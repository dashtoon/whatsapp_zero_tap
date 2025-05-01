import 'whatsapp_zero_tap_platform_interface.dart';

class WhatsappZeroTap {
  Future<bool> isWhatsappInstalled() {
    return WhatsappZeroTapPlatform.instance.isWhatsappInstalled();
  }

  Future<bool> isWhatsAppOtpHandshakeSupported() {
    return WhatsappZeroTapPlatform.instance.isWhatsAppOtpHandshakeSupported();
  }

  Future<String?> getOTP({required Duration timeout}) {
    return WhatsappZeroTapPlatform.instance.getOTP(timeout: timeout);
  }
}
