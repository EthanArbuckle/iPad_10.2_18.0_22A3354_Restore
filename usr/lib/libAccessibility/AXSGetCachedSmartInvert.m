@implementation AXSGetCachedSmartInvert

void __AXSGetCachedSmartInvert_block_invoke_2()
{
  uint64_t v0;
  __CFNotificationCenter *DarwinNotifyCenter;
  const __CFString *v2;
  __CFNotificationCenter *v3;

  if (cachedAppID_onceToken != -1)
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_1626);
  v0 = cachedAppID_CachedAppID;
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, CFSTR("com.apple.accessibility.cache.invert.colors"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  if (v0)
  {
    v2 = (const __CFString *)objc_msgSend(CFSTR("com.apple.accessibility.cache.invert.colors"), "stringByAppendingString:", v0);
    v3 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v3, 0, (CFNotificationCallback)_axsHandlePrefChangedApp, v2, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

void __AXSGetCachedSmartInvert_block_invoke()
{
  NSObject *v0;
  const __CFNumber *NumberPreference;
  NSObject *v2;
  NSObject *v3;
  _BOOL4 v4;
  int valuePtr;

  preferencesQueue();
  v0 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v0, &__block_literal_global_1069);

  NumberPreference = (const __CFNumber *)_getNumberPreference((const __CFString *)kAXSInvertColorsEnabledPreference, 0);
  valuePtr = -1;
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    _kAXSCacheInvertColorsGlobal = valuePtr;
    _kAXSCacheInvertColors = valuePtr;
    AXSupportLogCommon();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
      __AXSGetCachedSmartInvert_block_invoke_cold_2();

    AXSupportLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      __AXSInitializeAsynchronouslyPerAppSmartInvert_block_invoke_cold_3();

  }
  else
  {
    if (MADisplayFilterPrefGetCategoryEnabled())
      v4 = MADisplayFilterPrefGetType() == 512;
    else
      v4 = 0;
    _kAXSCacheInvertColorsGlobal = v4;
    _kAXSCacheInvertColors = v4;
    if (_kAXSWriteableClient)
      dispatch_async(MEMORY[0x1E0C80D38], &__block_literal_global_1890);
  }
  AXSInitializeAsynchronouslyPerAppSmartInvert();
}

void __AXSGetCachedSmartInvert_block_invoke_cold_2()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_18F1A7000, v0, v1, "Read Global: preference = %@, result = %d (-1 - empty, 0 - false, 1 - true)", v2);
  OUTLINED_FUNCTION_1();
}

@end
