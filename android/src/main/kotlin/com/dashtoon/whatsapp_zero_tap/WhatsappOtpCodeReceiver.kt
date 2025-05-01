package com.dashtoon.whatsapp_zero_tap

import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.os.Handler
import android.os.Looper
import android.util.Log
import com.whatsapp.otp.android.sdk.WhatsAppOtpIncomingIntentHandler
import com.whatsapp.otp.android.sdk.enums.WhatsAppOtpError
import io.flutter.plugin.common.MethodChannel.Result

class WhatsappOtpCodeReceiver : BroadcastReceiver() {
  private val otpHandler = WhatsAppOtpIncomingIntentHandler()

  companion object {
    private var result: Result? = null
    private var runnable: Runnable? = null
    private var handler: Handler = Handler(Looper.getMainLooper())


    fun register(result: Result, timeoutMillis: Int) {
      unregister()

      this.result = result
      runnable = Runnable {
        try {
          result.error(
            "timeout",
            "OTP code not received within $timeoutMillis milliseconds",
            null
          )
          this.result = null
        } catch (e: IllegalArgumentException) {
          Log.e("WhatsappOtpReceiver", "Failed to send timeout error", e)
        }
      }

      handler.postDelayed(runnable!!, timeoutMillis.toLong())
    }

    fun unregister() {
      runnable?.let {
        handler.removeCallbacks(it)
        runnable = null
      }
      result = null
    }
  }


  override fun onReceive(context: Context, intent: Intent) {
    otpHandler.processOtpCode(
      intent,
      { code ->
        sendSuccess(code)
      },
      { error, exception ->
        sendError(error, exception)
      }
    )
    unregister()
  }

  private fun sendSuccess(code: String?) {
    try {
      result?.success(code)
    } catch (e: Exception) {
      Log.e("WhatsappOtpReceiver", "Failed to send OTP success", e)
    }
  }

  private fun sendError(error: WhatsAppOtpError?, exception: Exception?) {
    try {
      result?.error(
        error?.name ?: "UNKNOWN_ERROR",
        exception?.message ?: "Unknown exception",
        null
      )
    } catch (e: Exception) {
      Log.e("WhatsappOtpReceiver", "Failed to send OTP error", e)
    }
  }
}
