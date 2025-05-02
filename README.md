# Whatsapp Zero Tap Flutter

Autofill OTPs using
WhatsApp's [Zero Tap](https://developers.facebook.com/docs/whatsapp/business-management-api/authentication-templates/zero-tap-authentication-templates/)
for Android devices

## API Reference

* Initialize: `wa = WhatsappZeroTap()`


* `Future<bool> isWhatsAppInstalled()`: Returns whether WhatsApp is installed on the device.


* `Future<bool> isWhatsAppOtpHandshakeSupported()`: Checks if the current device supports WhatsApp OTP handshakes.


* `Future<String?> listenForOTP({required Duration timeout})`: Initiates a zero-tap OTP fetch flow from WhatsApp. Throws
  a platform exception if OTP is not received within `timeout`.

**Note**: Call `listenForOTP` before sending the whatsapp message to avoid race conditions.

## Demo:



https://github.com/user-attachments/assets/ccd1e8ef-6d6d-4c35-9716-042b3a77b76b

