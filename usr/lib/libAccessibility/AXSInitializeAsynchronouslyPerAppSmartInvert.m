@implementation AXSInitializeAsynchronouslyPerAppSmartInvert

void __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke()
{
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v1;
  const __CFNumber *NumberPreference;
  NSObject *v3;
  NSObject *v4;
  __CFNotificationCenter *v5;
  NSObject *v6;
  NSObject *v7;
  __CFNotificationCenter *LocalCenter;
  __CFNotificationCenter *v9;
  __CFNotificationCenter *v10;
  int valuePtr;

  if (_AXSProcessLoadsInvertBundlesForPerAppSmartInvert())
  {
    if (_AXSProcessIsSpringBoard_onceToken != -1)
      dispatch_once(&_AXSProcessIsSpringBoard_onceToken, &__block_literal_global_1634);
    if (_AXSProcessIsSpringBoard__AXSProcessIsSpringBoard == 1)
      CFPreferencesSetValue(CFSTR("AXSSystemUIProcessAppSmartInvertEnabledPreference"), (CFPropertyListRef)*MEMORY[0x1E0C9AE40], (CFStringRef)kAXSAccessibilityPreferenceDomain, (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandleSystemUILoadInvertBundles, CFSTR("com.apple.accessibility.system.ui.process.load.invert.bundles"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
  v1 = (const __CFString *)kAXSInvertColorsEnabledPreference;
  if (cachedAppID_onceToken != -1)
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_1626);
  NumberPreference = (const __CFNumber *)_getNumberPreference(v1, (const __CFString *)cachedAppID_CachedAppID);
  valuePtr = -1;
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    AXSupportLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_4();

    if (valuePtr != -1 && valuePtr != _kAXSCacheInvertColors)
    {
      _kAXSCacheInvertColors = valuePtr;
      AXSupportLogCommon();
      v4 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
        __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_3();

      if (valuePtr == 1)
      {
        if ((_AXSProcessLoadsInvertBundlesForPerAppSmartInvert() & 1) == 0)
        {
          v5 = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(v5, CFSTR("com.apple.accessibility.system.ui.process.load.invert.bundles"), 0, 0, 1u);
          AXLogInvertColorsLoadBundles();
          v6 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
            __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_2();

        }
        if (_kAXSCacheInvertColors != _kAXSCacheInvertColorsGlobal)
        {
          AXSupportLogCommon();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
            __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_1();

          LocalCenter = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(LocalCenter, (CFNotificationName)kAXSAccessibilityEnabledNotification, 0, 0, 1u);
          v9 = CFNotificationCenterGetDarwinNotifyCenter();
          CFNotificationCenterPostNotification(v9, (CFNotificationName)kAXSAccessibilityEnabledNotification, 0, 0, 1u);
        }
      }
      v10 = CFNotificationCenterGetLocalCenter();
      CFNotificationCenterPostNotification(v10, kAXSInvertColorsEnabledNotification[0], 0, 0, 1u);
    }
  }
}

void __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_18F1A7000, v0, v1, "Init Per-App Smart Invert ON, AX Enabled: true", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_9();
  OUTLINED_FUNCTION_4(&dword_18F1A7000, v0, v1, "Send Notification to SystemUI Processes", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_7();
}

void __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_18F1A7000, v0, v1, "Updated cache: preference = %@, result = %d (-1 - empty, 0 - false, 1 - true)", v2);
  OUTLINED_FUNCTION_1();
}

void __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_18F1A7000, v0, v1, "Read Local: preference = %@, result = %d (-1 - empty, 0 - false, 1 - true)", v2);
  OUTLINED_FUNCTION_1();
}

@end
