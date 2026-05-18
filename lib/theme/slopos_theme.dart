import 'package:flutter/material.dart';

/// SlopOS palette — deep-black Discord-inspired dark theme with
/// cyan (#00BFFF) accents. Matches the SlopOS T-Deck firmware theme.
class SlopOSPalette {
  SlopOSPalette._();

  // Surfaces (deep blacks)
  static const bg = Color(0xFF0F0F0F);
  static const bg1 = Color(0xFF181818);
  static const bg2 = Color(0xFF1E1E1E);
  static const bg3 = Color(0xFF252525);
  static const bg4 = Color(0xFF2E2E2E);

  // Lines
  static const line = Color(0xFF1E1E1E);
  static const line2 = Color(0xFF2E2E2E);
  static const line3 = Color(0xFF40444B);

  // Ink (text)
  static const ink = Color(0xFFF2F3F5);
  static const ink2 = Color(0xFF949BA4);
  static const ink3 = Color(0xFF5C6067);
  static const ink4 = Color(0xFF40444B);

  // Signal (cyan accent)
  static const signal = Color(0xFF00BFFF);
  static const signalDim = Color(0xFF0099CC);
  static const signalBg = Color(0x1700BFFF); // ~9% alpha
  static const signalLine = Color(0x4200BFFF); // ~26%
  static const signalGlow = Color(0x5900BFFF); // ~35%

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

  // Light variant (used when user explicitly picks light theme)
  static const lightBg = Color(0xFFF5F3EC);
  static const lightBg1 = Color(0xFFECE9DF);
  static const lightBg2 = Color(0xFFE2DED2);
  static const lightLine = Color(0xFFCAC5B4);
  static const lightInk = Color(0xFF0F0F0F);
  static const lightInk2 = Color(0xFF3D463E);
  static const lightInk3 = Color(0xFF6A756D);
  static const lightSignal = Color(0xFF0088CC);
}

/// Named font stacks — Flutter falls back to system fonts when the named
/// family isn't installed, keeping things working without bundled assets.
class SlopOSFonts {
  SlopOSFonts._();

  static const sans = 'Inter';
  static const mono = 'JetBrains Mono';
  static const display = 'Instrument Serif';

  static const List<String> sansFallback = [
    'system-ui',
    '-apple-system',
    'Roboto',
    'Noto Sans',
    'sans-serif',
  ];
  static const List<String> monoFallback = [
    'SF Mono',
    'Menlo',
    'Consolas',
    'Roboto Mono',
    'monospace',
  ];
  static const List<String> displayFallback = [
    'Cormorant Garamond',
    'Georgia',
    'Times New Roman',
    'serif',
  ];
}

/// Radii used consistently across the app.
class SlopOSRadii {
  SlopOSRadii._();
  static const xs = 6.0;
  static const sm = 10.0;
  static const md = 14.0;
  static const lg = 18.0;
  static const xl = 24.0;
  static const pill = 999.0;
}

/// Shared helpers exposed via [SlopOSTheme].
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
          fontFamily: SlopOSFonts.sans,
          fontFamilyFallback: SlopOSFonts.sansFallback,
        );

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: scheme,
      scaffoldBackgroundColor: scheme.surface,
      canvasColor: scheme.surface,
      fontFamily: SlopOSFonts.sans,
      fontFamilyFallback: SlopOSFonts.sansFallback,
      textTheme: baseText,
      dividerColor: scheme.outlineVariant,
      dividerTheme: DividerThemeData(
        color: scheme.outlineVariant,
        thickness: 1,
        space: 1,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: scheme.surface,
        foregroundColor: scheme.onSurface,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(
          fontFamily: SlopOSFonts.sans,
          fontFamilyFallback: SlopOSFonts.sansFallback,
          fontSize: 20,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.2,
          color: scheme.onSurface,
        ),
        iconTheme: IconThemeData(color: scheme.onSurface),
        shape: Border(
          bottom: BorderSide(color: scheme.outlineVariant, width: 1),
        ),
      ),
      cardTheme: CardThemeData(
        color: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.md),
          side: BorderSide(color: scheme.outlineVariant, width: 1),
        ),
        margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 0),
      ),
      listTileTheme: ListTileThemeData(
        iconColor: scheme.onSurfaceVariant,
        textColor: scheme.onSurface,
        tileColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.md),
        ),
      ),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        backgroundColor: scheme.primary,
        foregroundColor: scheme.onPrimary,
        elevation: 0,
        focusElevation: 0,
        hoverElevation: 0,
        highlightElevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.pill),
        ),
        extendedTextStyle: const TextStyle(
          fontFamily: SlopOSFonts.sans,
          fontFamilyFallback: SlopOSFonts.sansFallback,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: scheme.primary,
          foregroundColor: scheme.onPrimary,
          elevation: 0,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SlopOSRadii.pill),
          ),
          textStyle: const TextStyle(
            fontFamily: SlopOSFonts.sans,
            fontFamilyFallback: SlopOSFonts.sansFallback,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: scheme.onSurface,
          side: BorderSide(color: scheme.outline),
          padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SlopOSRadii.pill),
          ),
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: scheme.primary,
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 10),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(SlopOSRadii.pill),
          ),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: scheme.surfaceContainerHigh,
        hintStyle: TextStyle(color: scheme.onSurfaceVariant),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 12,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.md),
          borderSide: BorderSide(color: scheme.outline),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.md),
          borderSide: BorderSide(color: scheme.outlineVariant),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.md),
          borderSide: BorderSide(color: scheme.primary, width: 1.5),
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        side: BorderSide(color: scheme.outlineVariant),
        labelStyle: TextStyle(
          fontFamily: SlopOSFonts.sans,
          fontFamilyFallback: SlopOSFonts.sansFallback,
          fontSize: 12.5,
          fontWeight: FontWeight.w600,
          color: scheme.onSurfaceVariant,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.pill),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      ),
      navigationBarTheme: NavigationBarThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        indicatorColor: scheme.primary.withValues(alpha: 0.14),
        indicatorShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.md),
        ),
        labelTextStyle: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return TextStyle(
            fontFamily: SlopOSFonts.mono,
            fontFamilyFallback: SlopOSFonts.monoFallback,
            fontSize: 10,
            fontWeight: selected ? FontWeight.w700 : FontWeight.w500,
            letterSpacing: 0.1,
            color: selected ? scheme.primary : scheme.onSurfaceVariant,
          );
        }),
        iconTheme: WidgetStateProperty.resolveWith((states) {
          final selected = states.contains(WidgetState.selected);
          return IconThemeData(
            color: selected ? scheme.primary : scheme.onSurfaceVariant,
            size: 22,
          );
        }),
      ),
      bottomSheetTheme: BottomSheetThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        modalBackgroundColor: scheme.surfaceContainerLow,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            top: Radius.circular(SlopOSRadii.lg),
          ),
        ),
      ),
      dialogTheme: DialogThemeData(
        backgroundColor: scheme.surfaceContainerLow,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.lg),
        ),
      ),
      snackBarTheme: SnackBarThemeData(
        backgroundColor: scheme.surfaceContainerHigh,
        contentTextStyle: TextStyle(color: scheme.onSurface),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.md),
        ),
      ),
      popupMenuTheme: PopupMenuThemeData(
        color: scheme.surfaceContainerHigh,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(SlopOSRadii.md),
        ),
      ),
      iconTheme: IconThemeData(color: scheme.onSurfaceVariant, size: 22),
      splashFactory: InkSparkle.splashFactory,
    );
  }

  /// Mono text style — sizes default to the body size Inter is using.
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

  /// Serif display style.
  static TextStyle display({
    double? fontSize,
    FontWeight? fontWeight,
    Color? color,
    double? letterSpacing,
  }) {
    return TextStyle(
      fontFamily: SlopOSFonts.display,
      fontFamilyFallback: SlopOSFonts.displayFallback,
      fontSize: fontSize,
      fontWeight: fontWeight ?? FontWeight.w400,
      color: color,
      letterSpacing: letterSpacing ?? -0.2,
    );
  }

  /// Small-caps mono label — used for section accents and chip labels.
  static TextStyle accentLabel({Color? color, double? fontSize}) {
    return TextStyle(
      fontFamily: SlopOSFonts.mono,
      fontFamilyFallback: SlopOSFonts.monoFallback,
      fontSize: fontSize ?? 9.5,
      fontWeight: FontWeight.w600,
      letterSpacing: 1.8,
      color: color,
    );
  }

  /// Color-code an SNR value for consistency across the app.
  static Color snrColor(num? snr, {required bool blocked}) {
    if (blocked) return SlopOSPalette.alert;
    if (snr == null) return SlopOSPalette.ink3;
    if (snr > -5) return SlopOSPalette.green;
    if (snr > -12) return SlopOSPalette.warn;
    return SlopOSPalette.alert;
  }
}
