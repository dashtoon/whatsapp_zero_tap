import 'whatsapp_zero_tap_platform_interface.dart';

class WhatsappZeroTap {
  Future<bool> isWhatsAppInstalled() {
    return WhatsappZeroTapPlatform.instance.isWhatsAppInstalled();
  }

  Future<bool> isWhatsAppOtpHandshakeSupported() {
    return WhatsappZeroTapPlatform.instance.isWhatsAppOtpHandshakeSupported();
  }

  Future<String?> listenForOTP({required Duration timeout}) {
    return WhatsappZeroTapPlatform.instance.listenForOTP(timeout: timeout);
  }
}
