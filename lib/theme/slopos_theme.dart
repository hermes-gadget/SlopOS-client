import 'package:flutter/material.dart';

/// SlopOS pixel palette — deep-black retro blocky theme with
/// cyan (#00BFFF) accents. Sharp edges, thick borders, pixel fonts.
class SlopOSPalette {
  SlopOSPalette._();

  // Surfaces (deep blacks)
  static const bg = Color(0xFF0F0F0F);
  static const bg1 = Color(0xFF181818);
  static const bg2 = Color(0xFF1E1E1E);
  static const bg3 = Color(0xFF252525);
  static const bg4 = Color(0xFF2E2E2E);

  // Pixel grid lines
  static const line = Color(0xFF1E1E1E);
  static const line2 = Color(0xFF2F2F2F);
  static const line3 = Color(0xFF40444B);

  // Ink (text)
  static const ink = Color(0xFFF2F3F5);
  static const ink2 = Color(0xFF949BA4);
  static const ink3 = Color(0xFF5C6067);
  static const ink4 = Color(0xFF40444B);

  // Signal (cyan pixel glow)
  static const signal = Color(0xFF00BFFF);
  static const signalDim = Color(0xFF0099CC);
  static const signalBg = Color(0x1700BFFF);
  static const signalLine = Color(0x4200BFFF);
  static const signalGlow = Color(0x5900BFFF);

  // Warn (orange)
  static const warn = Color(0xFFFAA61A);
  static const warnDim = Color(0xFFC27E3C);
  static const warnBg = Color(0x1CFAA61A);
  static const warnLine = Color(0x4DFAA61A);

  // Alert (red)
  static const alert = Color(0xFFED4245);
  static const alertBg = Color(0x1CED4245);
  static const alertLine = Color(0x52ED4245);

  // Green (success)
  static const green = Color(0xFF3BA55D);
  static const greenBg = Color(0x1C3BA55D);
  static const greenLine = Color(0x473BA55D);

  // Blue (secondary accent)
  static const blue = Color(0xFF5865F2);
  static const blueBg = Color(0x1C5865F2);
  static const blueLine = Color(0x475865F2);

  // Magenta
  static const magenta = Color(0xFFDE7FDB);
  static const magentaBg = Color(0x1CDE7FDB);
  static const magentaLine = Color(0x47DE7FDB);

  // Me bubble (outgoing — cyan-tinted)
  static const me = Color(0xFF003952);
  static const meBorder = Color(0xFF00BFFF);
  static const meInk = Color(0xFFF2F3F5);

  // Incoming bubble
  static const incoming = Color(0xFF3A4560);
  static const incomingBorder = Color(0xFF4A5568);

  // Light variant
  static const lightBg = Color(0xFFF0F0E8);
  static const lightBg1 = Color(0xFFE8E8D8);
  static const lightBg2 = Color(0xFFD8D8C8);
  static const lightLine = Color(0xFFC0C0B0);
  static const lightInk = Color(0xFF0F0F0F);
  static const lightInk2 = Color(0xFF3D463E);
  static const lightInk3 = Color(0xFF6A756D);
  static const lightSignal = Color(0xFF0088CC);
}

/// Pixel font stacks — PressStart2P for headings, PixelifySans for body.
class SlopOSFonts {
  SlopOSFonts._();

  /// Blocky 8-bit display font for headings, titles, badges.
  static const pixel = 'PressStart2P';

  /// Readable pixel body font.
  static const body = 'PixelifySans';

  /// Monospace for code, coordinates, technical labels.
  static const mono = 'JetBrains Mono';

  static const List<String> pixelFallback = [
    'Courier',
    'monospace',
  ];
  static const List<String> bodyFallback = [
    'system-ui',
    '-apple-system',
    'Roboto',
    'sans-serif',
  ];
  static const List<String> monoFallback = [
    'SF Mono',
    'Menlo',
    'Consolas',
    'Roboto Mono',
    'monospace',
  ];
}

/// Blocky radii — sharp or near-sharp for pixel aesthetic.
class SlopOSRadii {
  SlopOSRadii._();

  /// Zero radius — perfectly sharp, pixel edges.
  static const none = 0.0;

  /// Minimal rounding — 2px for slight pixel bevel.
  static const pixel = 2.0;

  /// Card corner — still sharp but slightly beveled.
  static const card = 4.0;

  /// Used where zero-radius causes clipping issues.
  static const safe = 6.0;
}

/// Pixel theme factory.
class SlopOSTheme {
  SlopOSTheme._();

  static ThemeData dark() {
    const scheme = ColorScheme.dark(
      primary: SlopOSPalette.signal,
      onPrimary: Color(0xFF0A1810),
      primaryContainer: SlopOSPalette.signalBg,
      onPrimaryContainer: SlopOSPalette.signal,
      secondary: SlopOSPalette.blue,
      onSecondary: Color(0xFF0A1520),
      tertiary: SlopOSPalette.magenta,
      onTertiary: Color(0xFF201020),
      error: SlopOSPalette.alert,
      onError: Color(0xFF1A0A08),
      errorContainer: SlopOSPalette.alertBg,
      onErrorContainer: SlopOSPalette.alert,
      surface: SlopOSPalette.bg,
      onSurface: SlopOSPalette.ink,
      surfaceContainerLowest: SlopOSPalette.bg,
      surfaceContainerLow: SlopOSPalette.bg1,
      surfaceContainer: SlopOSPalette.bg1,
      surfaceContainerHigh: SlopOSPalette.bg2,
      surfaceContainerHighest: SlopOSPalette.bg3,
      onSurfaceVariant: SlopOSPalette.ink2,
      outline: SlopOSPalette.line2,
      outlineVariant: SlopOSPalette.line,
      shadow: Colors.black,
      scrim: Colors.black54,
      inverseSurface: SlopOSPalette.ink,
      onInverseSurface: SlopOSPalette.bg,
      inversePrimary: SlopOSPalette.signalDim,
    );
    return _build(scheme, Brightness.dark);
  }

  static ThemeData light() {
    const scheme = ColorScheme.light(
      primary: SlopOSPalette.lightSignal,
      onPrimary: Colors.white,
      primaryContainer: Color(0xFFD4E8D8),
      onPrimaryContainer: SlopOSPalette.lightSignal,
      secondary: Color(0xFF2F6EA8),
      onSecondary: Colors.white,
      tertiary: Color(0xFF8C4A8A),
      onTertiary: Colors.white,
      error: Color(0xFFB53D2F),
      onError: Colors.white,
      surface: SlopOSPalette.lightBg,
      onSurface: SlopOSPalette.lightInk,
      surfaceContainerLowest: SlopOSPalette.lightBg,
      surfaceContainerLow: SlopOSPalette.lightBg1,
      surfaceContainer: SlopOSPalette.lightBg1,
      surfaceContainerHigh: SlopOSPalette.lightBg2,
      surfaceContainerHighest: Color(0xFFD5D0C0),
      onSurfaceVariant: SlopOSPalette.lightInk2,
      outline: SlopOSPalette.lightLine,
      outlineVariant: Color(0xFFDBD6C6),
    );
    return _build(scheme, Brightness.light);
  }

  static ThemeData _build(ColorScheme scheme, Brightness brightness) {
    final baseText =
        Typography.material2021(
          platform: TargetPlatform.android,
          colorScheme: scheme,
        ).black.apply(
          bodyColor: scheme.onSurface,
          displayColor: scheme.onSurface,
          fontFamily: SlopOSFonts.body,
          fontFamilyFallback: SlopOSFonts.bodyFallback,
        );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      canvasColor: scheme.surface,
      fontFamily: SlopOSFonts.body,
      fontFamilyFallback: SlopOSFonts.bodyFallback,
      textTheme: baseText,
      dividerColor: scheme.outlineVariant,
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 2,
        space: 0,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: SlopOSFonts.pixel,
          fontFamilyFallback: SlopOSFonts.pixelFallback,
          fontSize: 14,
          fontWeight: FontWeight.w400,
          letterSpacing: 1.0,
          color: scheme.onSurface,
        ),
        iconTheme: IconThemeData(color: scheme.onSurface),
        shape: const Border(
          bottom: BorderSide(color: SlopOSPalette.line2, width: 2),
        ),
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.card),
          side: BorderSide(color: scheme.outline, width: 2),
        ),
        margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 0),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: scheme.onSurfaceVariant,
        textColor: scheme.onSurface,
        tileColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.pixel),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.pixel),
          side: BorderSide(color: scheme.primary, width: 2),
        ),
        extendedTextStyle: TextStyle(
          fontFamily: SlopOSFonts.pixel,
          fontFamilyFallback: SlopOSFonts.pixelFallback,
          fontWeight: FontWeight.w400,
          fontSize: 12,
          letterSpacing: 0.5,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SlopOSRadii.pixel),
            side: const BorderSide(color: SlopOSPalette.signalDim, width: 2),
          ),
          textStyle: TextStyle(
            fontFamily: SlopOSFonts.pixel,
            fontFamilyFallback: SlopOSFonts.pixelFallback,
            fontWeight: FontWeight.w400,
            fontSize: 11,
            letterSpacing: 0.5,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.onSurface,
          side: BorderSide(color: scheme.outline, width: 2),
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SlopOSRadii.pixel),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SlopOSRadii.pixel),
          ),
          textStyle: TextStyle(
            fontFamily: SlopOSFonts.pixel,
            fontFamilyFallback: SlopOSFonts.pixelFallback,
            fontSize: 11,
            letterSpacing: 0.5,
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHigh,
        hintStyle: TextStyle(
          color: scheme.onSurfaceVariant,
          fontFamily: SlopOSFonts.body,
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.pixel),
          borderSide: BorderSide(color: scheme.outline, width: 2),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.pixel),
          borderSide: BorderSide(color: scheme.outlineVariant, width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.pixel),
          borderSide: BorderSide(color: scheme.primary, width: 2),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        side: BorderSide(color: scheme.outlineVariant, width: 2),
        labelStyle: TextStyle(
          fontFamily: SlopOSFonts.pixel,
          fontFamilyFallback: SlopOSFonts.pixelFallback,
          fontSize: 9,
          fontWeight: FontWeight.w400,
          color: scheme.onSurfaceVariant,
          letterSpacing: 0.5,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.pixel),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        indicatorColor: scheme.primary.withValues(alpha: 0.14),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.pixel),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontFamily: SlopOSFonts.pixel,
            fontFamilyFallback: SlopOSFonts.pixelFallback,
            fontSize: 8,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2,
            color: selected ? scheme.primary : scheme.onSurfaceVariant,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? scheme.primary : scheme.onSurfaceVariant,
            size: 20,
          );
        }),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: scheme.surfaceContainerLow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(SlopOSRadii.card),
          ),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.card),
          side: BorderSide(color: scheme.outline, width: 2),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        contentTextStyle: TextStyle(
          color: scheme.onSurface,
          fontFamily: SlopOSFonts.body,
        ),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.pixel),
          side: BorderSide(color: scheme.outline, width: 2),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: scheme.surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.pixel),
          side: BorderSide(color: scheme.outline, width: 2),
        ),
      ),
      iconTheme: IconThemeData(color: scheme.onSurfaceVariant, size: 20),
      splashFactory: NoSplash.splashFactory,
    );
  }

  /// 8-bit pixel heading — PressStart2P, blocky and bold.
  static TextStyle pixelHeading({
    double? fontSize,
    Color? color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: SlopOSFonts.pixel,
      fontFamilyFallback: SlopOSFonts.pixelFallback,
      fontSize: fontSize ?? 16,
      fontWeight: FontWeight.w400,
      color: color,
      letterSpacing: letterSpacing ?? 0.5,
    );
  }

  /// Pixel body text — PixelifySans for readable blocky text.
  static TextStyle pixelBody({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
  }) {
    return TextStyle(
      fontFamily: SlopOSFonts.body,
      fontFamilyFallback: SlopOSFonts.bodyFallback,
      fontSize: fontSize ?? 14,
      fontWeight: fontWeight ?? FontWeight.w500,
      color: color,
    );
  }

  /// Mono text — code, coordinates, technical labels.
  static TextStyle mono({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: SlopOSFonts.mono,
      fontFamilyFallback: SlopOSFonts.monoFallback,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
      letterSpacing: letterSpacing ?? 0.2,
      fontFeatures: const [FontFeature.tabularFigures()],
    );
  }

  /// Small pixel label — blocky uppercase for badges and chips.
  static TextStyle pixelLabel({Color? color, double? fontSize}) {
    return TextStyle(
      fontFamily: SlopOSFonts.pixel,
      fontFamilyFallback: SlopOSFonts.pixelFallback,
      fontSize: fontSize ?? 8,
      fontWeight: FontWeight.w400,
      letterSpacing: 0.5,
      color: color,
    );
  }

  /// Color-code an SNR value.
  static Color snrColor(num? snr, {required bool blocked}) {
    if (blocked) return SlopOSPalette.alert;
    if (snr == null) return SlopOSPalette.ink3;
    if (snr > -5) return SlopOSPalette.green;
    if (snr > -12) return SlopOSPalette.warn;
    return SlopOSPalette.alert;
  }
}
