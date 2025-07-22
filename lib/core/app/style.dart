import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final lightTheme = _getTheme();

// Primary
const _colorPrimary = Color(0xFF17598E);
const _colorPrimaryContainer = Color(0xFF599ED1);

// Secondary
const _colorSecondary = Color(0xFF6E4FFF);
const _colorSecondaryContainer = Color(0xFF8A73F5);

// Surface
const _colorSurface = Color(0xFFFFFFFF);
const _colorSurfaceContainer = Color(0xFFECECEC);
const _colorOnSurface = Color(0xFF15141C);
const _colorOnSurfaceVariant = Color(0xFF414141);
const _colorDivider = _colorOnSurfaceVariant;
const _colorDisabled = Colors.grey;
const _colorError = Colors.red;

const _lightColorScheme = ColorScheme(
  brightness: Brightness.light,
  // Primary
  primary: _colorPrimary,
  onPrimary: _colorSurface,
  primaryContainer: _colorPrimaryContainer,
  onPrimaryContainer: _colorOnSurface,
  // Secondary
  secondary: _colorSecondary,
  onSecondary: _colorOnSurface,
  secondaryContainer: _colorSecondaryContainer,
  onSecondaryContainer: _colorOnSurface,
  // Error
  error: _colorError,
  onError: _colorSurface,
  // Surface
  surface: _colorSurface,
  onSurface: _colorOnSurface,
  surfaceContainer: _colorSurfaceContainer,
  onSurfaceVariant: _colorOnSurfaceVariant,
  // Outline
  outline: _colorDivider,
);

ThemeData _getTheme() {
  const colorScheme = _lightColorScheme;
  final textTheme = _getTextTheme(colorScheme);

  final primaryTextTheme = textTheme.apply(
    displayColor: colorScheme.onPrimary,
    bodyColor: colorScheme.onPrimary,
  );

  const shape = RoundedRectangleBorder(
    borderRadius: BorderRadius.all(Radius.circular(8)),
  );
  final buttonShape = RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16),
  );
  const buttonPadding = EdgeInsets.symmetric(horizontal: 24, vertical: 12);
  final buttonTextStyle = textTheme.titleSmall;

  return ThemeData(
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme,
    primaryTextTheme: primaryTextTheme,
    scaffoldBackgroundColor: colorScheme.surface,
    disabledColor: _colorDisabled,
    dividerTheme: DividerThemeData(
      color: colorScheme.outline,
      space: 1,
      thickness: 1,
    ),
    chipTheme: ChipThemeData(
      labelStyle: textTheme.labelSmall,
      side: const BorderSide(width: 0),
    ),
    cardTheme: CardThemeData(
      clipBehavior: Clip.antiAlias,
      elevation: 0,
      shape: shape,
      color: colorScheme.surfaceContainer,
      surfaceTintColor: Colors.transparent,
      margin: EdgeInsets.zero,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: colorScheme.primary,
      linearTrackColor: colorScheme.primaryContainer,
      circularTrackColor: colorScheme.primaryContainer,
    ),
    popupMenuTheme: PopupMenuThemeData(
      color: colorScheme.surface,
      surfaceTintColor: colorScheme.surface,
    ),
    bottomSheetTheme: BottomSheetThemeData(
      showDragHandle: false,
      backgroundColor: colorScheme.surface,
      surfaceTintColor: Colors.transparent,
      shape: shape,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      type: BottomNavigationBarType.fixed,
      showSelectedLabels: true,
      showUnselectedLabels: true,
      backgroundColor: colorScheme.surfaceContainer,
      selectedItemColor: colorScheme.primary,
    ),
    navigationRailTheme: const NavigationRailThemeData(
      labelType: NavigationRailLabelType.all,
      groupAlignment: 0,
    ),
    appBarTheme: AppBarTheme(
      titleTextStyle: textTheme.titleLarge,
      backgroundColor: colorScheme.surface,
    ),
    dialogTheme: DialogThemeData(
      backgroundColor: colorScheme.surface,
      surfaceTintColor: colorScheme.surface,
      titleTextStyle: textTheme.titleLarge,
    ),
    snackBarTheme: SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      backgroundColor: colorScheme.onSurface,
      contentTextStyle: primaryTextTheme.bodyLarge,
      shape: shape,
    ),
    listTileTheme: ListTileThemeData(iconColor: colorScheme.primary),
    inputDecorationTheme: InputDecorationTheme(
      filled: false,
      suffixIconColor: colorScheme.onSurface,
      floatingLabelBehavior: FloatingLabelBehavior.never,
      hoverColor: colorScheme.primary.withValues(alpha: 0x1A),
      prefixIconColor: WidgetStateColor.resolveWith(
        (states) => states.contains(WidgetState.focused)
            ? colorScheme.primary
            : colorScheme.onSurfaceVariant,
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      border: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(width: 0.5, color: colorScheme.onSurfaceVariant),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: const BorderRadius.all(Radius.circular(16)),
        borderSide: BorderSide(width: 0.5, color: colorScheme.onSurfaceVariant),
      ),
      labelStyle: textTheme.bodyMedium!.copyWith(
        color: colorScheme.onSurfaceVariant,
      ),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.primary,
      foregroundColor: colorScheme.onPrimary,
      shape: const CircleBorder(),
      elevation: 8,
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        shape: buttonShape,
        padding: buttonPadding,
        backgroundColor: colorScheme.primary,
        foregroundColor: colorScheme.onPrimary,
        textStyle: buttonTextStyle,
        elevation: 2,
      ),
    ),
    filledButtonTheme: FilledButtonThemeData(
      style: FilledButton.styleFrom(
        shape: buttonShape,
        padding: buttonPadding,
        textStyle: buttonTextStyle,
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        shape: buttonShape,
        padding: buttonPadding,
        side: BorderSide(color: colorScheme.primary, width: 1),
        foregroundColor: colorScheme.primary,
        textStyle: buttonTextStyle,
        elevation: 0,
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        shape: buttonShape,
        padding: buttonPadding,
        foregroundColor: colorScheme.primary,
        textStyle: buttonTextStyle,
      ),
    ),
  );
}

TextTheme _getTextTheme(ColorScheme colorScheme) {
  final headlineColor = colorScheme.onSurface;
  const headlineWeight = FontWeight.w500;
  const headlineHeight = 1.4;
  const headlineLetterSpacing = 0.0;

  final titleColor = colorScheme.onSurface;
  const titleWeight = FontWeight.w700;
  const titleHeight = 1.25;
  const titleLetterSpacing = 0.0;

  final bodyColor = colorScheme.onSurfaceVariant;
  const bodyWeight = FontWeight.normal;
  const bodyHeight = 1.55;
  const bodyLetterSpacing = 0.02;

  final labelColor = colorScheme.onSurfaceVariant;
  const labelWeight = FontWeight.w400;

  final textTheme = TextTheme(
    // Headline
    headlineLarge: TextStyle(
      fontSize: 24,
      height: headlineHeight,
      letterSpacing: headlineLetterSpacing,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),
    headlineMedium: TextStyle(
      fontSize: 20,
      height: headlineHeight,
      letterSpacing: headlineLetterSpacing,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),
    headlineSmall: TextStyle(
      fontSize: 18,
      height: headlineHeight,
      letterSpacing: headlineLetterSpacing,
      color: headlineColor,
      fontWeight: headlineWeight,
    ),

    // Title
    titleLarge: TextStyle(
      fontSize: 20,
      height: titleHeight,
      letterSpacing: titleLetterSpacing,
      color: titleColor,
      fontWeight: titleWeight,
    ),
    titleMedium: TextStyle(
      fontSize: 18,
      height: titleHeight,
      letterSpacing: titleLetterSpacing,
      color: titleColor,
      fontWeight: titleWeight,
    ),
    titleSmall: TextStyle(
      fontSize: 14,
      height: titleHeight,
      letterSpacing: titleLetterSpacing,
      color: titleColor,
      fontWeight: titleWeight,
    ),

    // Body
    bodyLarge: TextStyle(
      fontSize: 16,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: bodyColor,
      fontWeight: bodyWeight,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: bodyColor,
      fontWeight: bodyWeight,
    ),
    bodySmall: TextStyle(
      fontSize: 12,
      height: bodyHeight,
      color: bodyColor,
      fontWeight: bodyWeight,
    ),

    // Label
    labelLarge: TextStyle(
      fontSize: 16,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: labelColor,
      fontWeight: labelWeight,
    ),
    labelMedium: TextStyle(
      fontSize: 14,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: labelColor,
      fontWeight: labelWeight,
    ),
    labelSmall: TextStyle(
      fontSize: 12,
      height: bodyHeight,
      letterSpacing: bodyLetterSpacing,
      color: labelColor,
      fontWeight: labelWeight,
    ),
  );

  return GoogleFonts.rubikTextTheme(textTheme);
}
