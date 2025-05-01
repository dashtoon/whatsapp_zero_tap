# Whatsapp Zero Tap Flutter

Autofill OTPs using WhatsApp's [Zero Tap](https://developers.facebook.com/docs/whatsapp/business-management-api/authentication-templates/zero-tap-authentication-templates/) for Android devices

## API Reference

* `Future<bool> isWhatsAppInstalled()`: Returns whether WhatsApp is installed on the device.

* `Future<bool> isWhatsAppOtpHandshakeSupported()`: Checks if the current device supports WhatsApp OTP handshakes.

* `Future<String?> getOTP({required Duration timeout})`: Initiates a zero-tap OTP fetch flow from WhatsApp. Throws a
  platform exception if OTP is not received within `timeout`.
