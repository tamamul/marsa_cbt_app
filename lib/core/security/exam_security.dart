import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class ExamSecurity {
  static const _channel = MethodChannel('com.marsa9.cbt/security');

  /// Aktifkan semua proteksi saat ujian dimulai
  static Future<void> enable() async {
    // Screen always on
    await WakelockPlus.enable();

    // Fullscreen — sembunyikan status bar + navigation bar
    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.immersiveSticky,
    );

    // Kunci orientasi portrait
    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);

    // Block screenshot & screen recording (Android)
    try {
      await _channel.invokeMethod('enableSecureFlag');
    } catch (_) {}
  }

  /// Nonaktifkan semua proteksi setelah ujian selesai
  static Future<void> disable() async {
    await WakelockPlus.disable();

    await SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
    );

    await SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    try {
      await _channel.invokeMethod('disableSecureFlag');
    } catch (_) {}
  }
}