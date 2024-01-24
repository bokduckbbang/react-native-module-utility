package com.reactnativemoduleutility

import android.content.Context
import android.content.pm.PackageInfo
import android.os.Build
import android.os.VibrationEffect
import android.os.Vibrator
import android.view.WindowManager
import com.facebook.react.bridge.Promise
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import java.lang.Exception
import android.app.Activity
import android.provider.Settings

class ModuleUtilityModule(reactContext: ReactApplicationContext) :
  ReactContextBaseJavaModule(reactContext) {

  override fun getName(): String {
    return "ModuleUtility"
  }

  @ReactMethod
  fun exitApp() {
    android.os.Process.killProcess(android.os.Process.myPid())
  }

  @ReactMethod
  fun feedback() {
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
      val vibrator = reactApplicationContext.getSystemService(Context.VIBRATOR_SERVICE) as Vibrator
      val effect = VibrationEffect.createOneShot(5, VibrationEffect.EFFECT_TICK)
      vibrator.vibrate(effect)
    }
  }

  @ReactMethod
  fun beginBackgroundTask(promise: Promise) {}

  @ReactMethod
  fun endBackgroundTask(promise: Promise) {}

  @ReactMethod
  fun requestTrackingPermission() {}

  @ReactMethod
  fun version(promise: Promise) {
    try {
      val info: PackageInfo = reactApplicationContext.packageManager.getPackageInfo(
        reactApplicationContext.packageName,
        0
      );
      promise.resolve(info.versionName)
    } catch (e: Exception) {
      promise.reject("Exception", e.toString())
    }
  }

  @ReactMethod
  fun secureActivate() {
    val activity = currentActivity
    activity?.runOnUiThread { activity.window.addFlags(WindowManager.LayoutParams.FLAG_SECURE) }
  }

  @ReactMethod
  fun secureDeactivate() {
    val activity = currentActivity
    activity?.runOnUiThread { activity.window.clearFlags(WindowManager.LayoutParams.FLAG_SECURE) }
  }

  @ReactMethod
  fun getDeviceId(promise: Promise) {
    promise.resolve(Settings.Secure.getString(currentActivity?.contentResolver, Settings.Secure.ANDROID_ID))
  }

  @ReactMethod
  fun getModelId(promise: Promise) {
    promise.resolve(Build.MODEL)
  }

  @ReactMethod
  fun getOs(promise: Promise) {
    promise.resolve(Build.VERSION.RELEASE)
  }
}
