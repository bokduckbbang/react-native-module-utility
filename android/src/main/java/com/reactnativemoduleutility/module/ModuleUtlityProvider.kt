package com.reactnativemoduleutility.module

import android.content.Context
import android.os.Build
import android.os.VibrationEffect
import android.os.Vibrator
import androidx.annotation.RequiresApi
import androidx.core.content.ContextCompat.getSystemService

class ModuleUtlityProvider {

  companion object {
    @Volatile
    private var instance: ModuleUtlityProvider? = null

    fun getInstance(): ModuleUtlityProvider = instance ?: synchronized(this) {
      instance ?: ModuleUtlityProvider().also { instance ->
        this.instance = instance
      }
    }
  }

  @RequiresApi(Build.VERSION_CODES.O)
  fun feedback(context: Context) {

  }

}
