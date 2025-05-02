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
  Future<bool> isWhatsAppInstalled() async {
    if (!Platform.isAndroid) return false;
    return await methodChannel.invokeMethod('isWhatsAppInstalled');
  }

  @override
  Future<String?> listenForOTP({required Duration timeout}) async {
    if (!Platform.isAndroid) return null;
    return await methodChannel.invokeMethod('listenForOTP', {
      'timeoutMillis': timeout.inMilliseconds,
    });
  }

  @override
  Future<bool> isWhatsAppOtpHandshakeSupported() async {
    if (!Platform.isAndroid) return false;
    return await methodChannel.invokeMethod('isWhatsAppOtpHandshakeSupported');
  }
}
