package com.dashtoon.whatsapp_zero_tap

import android.content.Context
import android.util.Log
import com.whatsapp.otp.android.sdk.WhatsAppOtpHandler
import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.Result
import io.flutter.plugin.common.MethodChannel.MethodCallHandler


/** WhatsappZeroTapPlugin */
class WhatsappZeroTapPlugin : FlutterPlugin, MethodCallHandler {
  private lateinit var channel: MethodChannel
  private lateinit var context: Context
  private val whatsAppOtpHandler: WhatsAppOtpHandler = WhatsAppOtpHandler()


  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel =
      MethodChannel(flutterPluginBinding.binaryMessenger, "whatsapp_zero_tap")
    channel.setMethodCallHandler(this)
    context = flutterPluginBinding.applicationContext
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    when (call.method) {
      "isWhatsAppInstalled" -> {
        result.success(whatsAppOtpHandler.isWhatsAppInstalled(context))
      }

      "isWhatsAppOtpHandshakeSupported" -> {
        result.success(
          whatsAppOtpHandler.isWhatsAppOtpHandshakeSupported(
            context
          )
        )
      }

      "listenForOTP" -> {
        listenForOTP(call, result)
      }

      else -> {
        result.notImplemented()
      }
    }
  }


  private fun listenForOTP(call: MethodCall, result: Result) {
    val timeoutMillis = call.argument<Int>("timeoutMillis") ?: 20000
    WhatsappOtpCodeReceiver.register(result, timeoutMillis)
    Log.d(
      "WhatsappZeroTapPlugin",
      "Listening for WhatsApp OTP with timeout: $timeoutMillis ms"
    )

    whatsAppOtpHandler.sendOtpIntentToWhatsApp(context)
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    WhatsappOtpCodeReceiver.unregister()
    channel.setMethodCallHandler(null)
  }
}
