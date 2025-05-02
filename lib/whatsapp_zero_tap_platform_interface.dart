import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'whatsapp_zero_tap_method_channel.dart';

abstract class WhatsappZeroTapPlatform extends PlatformInterface {
  /// Constructs a WhatsappZeroTapPlatform.
  WhatsappZeroTapPlatform() : super(token: _token);

  static final Object _token = Object();

  static WhatsappZeroTapPlatform _instance = MethodChannelWhatsappZeroTap();

  /// The default instance of [WhatsappZeroTapPlatform] to use.
  ///
  /// Defaults to [MethodChannelWhatsappZeroTap].
  static WhatsappZeroTapPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [WhatsappZeroTapPlatform] when
  /// they register themselves.
  static set instance(WhatsappZeroTapPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<bool> isWhatsAppInstalled() {
    throw UnimplementedError('getWhatsappVersion() has not been implemented.');
  }

  Future<String?> listenForOTP({required Duration timeout}) {
    throw UnimplementedError('listenForOTP() has not been implemented.');
  }

  Future<bool> isWhatsAppOtpHandshakeSupported() {
    throw UnimplementedError(
      'isWhatsAppOtpHandshakeSupported() has not been implemented.',
    );
  }
}
