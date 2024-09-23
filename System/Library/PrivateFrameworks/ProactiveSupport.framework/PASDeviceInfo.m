@implementation PASDeviceInfo

void __28___PASDeviceInfo_deviceUUID__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = MGCopyAnswer();
  v1 = (void *)deviceUUID_deviceUUID;
  deviceUUID_deviceUUID = v0;

}

void __36___PASDeviceInfo_internalDeviceCode__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;

  if (objc_msgSend(*(id *)(a1 + 32), "isInternalBuild"))
  {
    v1 = MGCopyAnswer();
    v2 = (void *)internalDeviceCode_deviceCode;
    internalDeviceCode_deviceCode = v1;

  }
}

void __45___PASDeviceInfo_shouldIncludePredictionLogs__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  _DWORD v6[2];
  __int16 v7;
  _BOOL4 v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("EnablePredictionLogging"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    shouldIncludePredictionLogs_isPredictionLoggingEnabled = objc_msgSend(v4, "BOOLForKey:", CFSTR("EnablePredictionLogging"));

  }
  else
  {
    if ((objc_msgSend(*(id *)(a1 + 32), "isBetaBuild") & 1) != 0)
      v5 = 1;
    else
      v5 = objc_msgSend(*(id *)(a1 + 32), "isInternalBuild");
    shouldIncludePredictionLogs_isPredictionLoggingEnabled = v5;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v6[0] = 67109376;
    v6[1] = shouldIncludePredictionLogs_isPredictionLoggingEnabled;
    v7 = 1024;
    v8 = v3 != 0;
    _os_log_debug_impl(&dword_1A0957000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Prediction Logging Enabled: %d (controlled by setting: %d)", (uint8_t *)v6, 0xEu);
  }
}

uint64_t __24___PASDeviceInfo_isiPad__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  isiPad_isiPad = (_DWORD)result == 3;
  return result;
}

uint64_t __34___PASDeviceInfo_isAudioAccessory__block_invoke()
{
  uint64_t result;

  result = MGGetSInt32Answer();
  isAudioAccessory_isAudioAccessory = (_DWORD)result == 7;
  return result;
}

void __29___PASDeviceInfo_isBetaBuild__block_invoke()
{
  const void *v0;
  const void *v1;

  v0 = (const void *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    isBetaBuild_isBeta = CFEqual(v0, CFSTR("Beta")) != 0;
    CFRelease(v1);
  }
}

uint64_t __33___PASDeviceInfo_isInternalBuild__block_invoke()
{
  uint64_t result;

  result = os_variant_has_internal_diagnostics();
  isInternalBuild_isInternalBuild = result;
  return result;
}

void __35___PASDeviceInfo_isDemoModeEnabled__block_invoke()
{
  id v0;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (id)objc_claimAutoreleasedReturnValue();
  isDemoModeEnabled_isDemoModeEnabled = objc_msgSend(v0, "BOOLForKey:", CFSTR("DemoMode"));

}

void __32___PASDeviceInfo_sharedInstance__block_invoke()
{
  _PASDeviceInfo *v0;
  void *v1;

  v0 = objc_alloc_init(_PASDeviceInfo);
  v1 = (void *)sharedInstance___sharedInstance;
  sharedInstance___sharedInstance = (uint64_t)v0;

}

@end
