package com.marsa9.cbt

import android.app.ActivityManager
import android.content.Context
import android.content.Intent
import android.os.Build
import android.os.Bundle
import android.view.WindowManager
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val CHANNEL = "com.marsa9.cbt/security"
    private var isExamActive = false

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->
            when (call.method) {
                "enableSecureFlag" -> {
                    isExamActive = true

                    // Block screenshot & screen recording
                    window.addFlags(WindowManager.LayoutParams.FLAG_SECURE)

                    // Screen always on
                    window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)

                    result.success(null)
                }

                "disableSecureFlag" -> {
                    isExamActive = false

                    window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE)
                    window.clearFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)

                    result.success(null)
                }

                else -> result.notImplemented()
            }
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)

        // Block split screen saat app dibuka
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
            if (isInMultiWindowMode) {
                // Keluar dari split screen
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.S) {
                    moveTaskToFront(taskId, 0)
                }
            }
        }
    }

    override fun onWindowFocusChanged(hasFocus: Boolean) {
        super.onWindowFocusChanged(hasFocus)

        if (!hasFocus && isExamActive) {
            // Paksa kembali ke foreground
            val intent = packageManager.getLaunchIntentForPackage(packageName)
            intent?.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT)
            intent?.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
            startActivity(intent)
        }
    }

    override fun onMultiWindowModeChanged(
        isInMultiWindowMode: Boolean,
        newConfig: android.content.res.Configuration
    ) {
        super.onMultiWindowModeChanged(isInMultiWindowMode, newConfig)

        if (isInMultiWindowMode && isExamActive) {
            // Keluar dari split screen paksa
            val intent = packageManager.getLaunchIntentForPackage(packageName)
            intent?.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT)
            startActivity(intent)
        }
    }

    override fun onPictureInPictureModeChanged(
        isInPictureInPictureMode: Boolean,
        newConfig: android.content.res.Configuration
    ) {
        super.onPictureInPictureModeChanged(isInPictureInPictureMode, newConfig)

        if (isInPictureInPictureMode && isExamActive) {
            // Keluar dari PiP mode
            val intent = packageManager.getLaunchIntentForPackage(packageName)
            intent?.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT)
            startActivity(intent)
        }
    }

    override fun onUserLeaveHint() {
        super.onUserLeaveHint()

        if (isExamActive) {
            // User tekan home button — paksa kembali
            val intent = packageManager.getLaunchIntentForPackage(packageName)
            intent?.addFlags(Intent.FLAG_ACTIVITY_REORDER_TO_FRONT)
            intent?.addFlags(Intent.FLAG_ACTIVITY_SINGLE_TOP)
            startActivity(intent)
        }
    }

    override fun onStop() {
        super.onStop()

        if (isExamActive) {
            // App masuk background — paksa ke foreground
            val activityManager = getSystemService(
                Context.ACTIVITY_SERVICE
            ) as ActivityManager
            activityManager.moveTaskToFront(taskId, 0)
        }
    }
}