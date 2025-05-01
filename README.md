# whatsapp_zero_tap
A Flutter plugin to auto-fill OTPs using WhatsApp's [Zero Tap](https://developers.facebook.com/docs/whatsapp/business-management-api/authentication-templates/zero-tap-authentication-templates/) for Android devices

## API Reference
* `Future<bool> isWhatsappInstalled()`: Returns whether WhatsApp is installed on the device.

* `Future<bool> isWhatsAppOtpHandshakeSupported()`: Checks if the current device supports WhatsApp OTP handshakes.

* `Future<String?> getOTP({required Duration timeout})`: Initiates a zero-tap OTP fetch flow from WhatsApp. Throws a platform exception if otp is not received within `timeout`.
