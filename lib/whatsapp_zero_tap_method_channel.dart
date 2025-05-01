import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'whatsapp_zero_tap_platform_interface.dart';

/// An implementation of [WhatsappZeroTapPlatform] that uses method channels.
class MethodChannelWhatsappZeroTap extends WhatsappZeroTapPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('whatsapp_zero_tap');

  @override
  Future<bool> isWhatsappInstalled() async {
    if (!Platform.isAndroid) return false;
    return await methodChannel.invokeMethod('isWhatsappInstalled');
  }

  @override
  Future<String?> getOTP({required Duration timeout}) async {
    if (!Platform.isAndroid) return null;
    return await methodChannel.invokeMethod('getOTP', {
      'timeoutMillis': timeout.inMilliseconds,
    });
  }

  @override
  Future<bool> isWhatsAppOtpHandshakeSupported() async {
    if (!Platform.isAndroid) return false;
    return await methodChannel.invokeMethod('isWhatsAppOtpHandshakeSupported');
  }
}
