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

<video src="https://raw.githubusercontent.com/dashtoon/whatsapp_zero_tap/refs/heads/main/example/assets/example.mp4" controls width="100%" style="max-width: 600px;">
Your browser does not support the video tag.</video>
