/// SlopOS ecosystem integration service.
///
/// Provides SlopOS-specific device detection, firmware interaction hooks,
/// and ecosystem features that extend the base MeshCore protocol.
///
/// This is the foundation layer — T-Deck firmware commands, OTA update
/// plumbing, and device-specific settings will be built on top of this.
library;

/// Check whether a BLE device name indicates a SlopOS device.
bool isSlopOSDevice(String deviceName) {
  return deviceName.startsWith('SlopOS-');
}

/// Check whether a device name is any known MeshCore-compatible device.
bool isMeshCoreDevice(String deviceName) {
  const prefixes = [
    'SlopOS-',
    'MeshCore-',
    'Whisper-',
    'WisCore-',
    'Seeed',
    'Lilygo',
    'HT-',
    'LowMesh_MC_',
    'NRF52',
  ];
  return prefixes.any((p) => deviceName.startsWith(p));
}

/// SlopOS firmware variant identifiers.
enum SlopOSVariant {
  /// LilyGo T-Deck running SlopOS firmware
  tdeck,

  /// LilyGo T-Pager running SlopOS firmware
  tpager,

  /// Generic MeshCore-compatible device
  generic,
}

/// Parse the device name to determine the SlopOS variant.
SlopOSVariant slopOSVariantFromName(String deviceName) {
  if (deviceName.contains('T-Deck') || deviceName.contains('tdeck')) {
    return SlopOSVariant.tdeck;
  }
  if (deviceName.contains('T-Pager') || deviceName.contains('tpager')) {
    return SlopOSVariant.tpager;
  }
  return SlopOSVariant.generic;
}

/// SlopOS-specific firmware capabilities that extend MeshCore protocol.
class SlopOSCapabilities {
  final bool hasDisplay;
  final bool hasKeyboard;
  final bool hasTouch;
  final bool hasGPS;
  final bool hasSDCard;

  const SlopOSCapabilities({
    this.hasDisplay = false,
    this.hasKeyboard = false,
    this.hasTouch = false,
    this.hasGPS = false,
    this.hasSDCard = false,
  });

  /// Default capabilities for known variants.
  factory SlopOSCapabilities.forVariant(SlopOSVariant variant) {
    switch (variant) {
      case SlopOSVariant.tdeck:
        return const SlopOSCapabilities(
          hasDisplay: true,
          hasKeyboard: true,
          hasTouch: true,
          hasGPS: true,
          hasSDCard: true,
        );
      case SlopOSVariant.tpager:
        return const SlopOSCapabilities(
          hasDisplay: true,
          hasKeyboard: true,
          hasGPS: true,
          hasSDCard: false,
        );
      case SlopOSVariant.generic:
        return const SlopOSCapabilities();
    }
  }
}
