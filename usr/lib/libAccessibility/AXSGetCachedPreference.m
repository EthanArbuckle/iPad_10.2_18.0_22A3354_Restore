@implementation AXSGetCachedPreference

void __AXSGetCachedPreference_block_invoke_2(uint64_t a1)
{
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v3;
  const __CFString *v4;
  __CFNotificationCenter *v5;

  if (*(_QWORD *)(a1 + 32))
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_axsHandlePrefChanged, *(CFStringRef *)(a1 + 32), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    if (*(_QWORD *)(a1 + 40))
    {
      v3 = *(void **)(a1 + 32);
      if (v3)
        v4 = (const __CFString *)objc_msgSend(v3, "stringByAppendingString:");
      else
        v4 = 0;
      v5 = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(v5, 0, (CFNotificationCallback)_axsHandlePrefChangedApp, v4, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
  }
}

void __AXSGetCachedPreference_block_invoke_3(uint64_t a1)
{
  const __CFNumber *NumberPreference;
  int *v3;
  NSObject *v4;
  __CFNotificationCenter *LocalCenter;
  int valuePtr;

  NumberPreference = (const __CFNumber *)_getNumberPreference(*(const __CFString **)(a1 + 32), *(const __CFString **)(a1 + 40));
  valuePtr = -1;
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    if (valuePtr != -1)
    {
      v3 = *(int **)(a1 + 48);
      if (valuePtr != *v3)
      {
        *v3 = valuePtr;
        if (*(_QWORD *)(a1 + 56))
        {
          AXSupportLogCommon();
          v4 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
            __AXSGetCachedPreference_block_invoke_3_cold_1();

          LocalCenter = CFNotificationCenterGetLocalCenter();
          CFNotificationCenterPostNotification(LocalCenter, *(CFNotificationName *)(a1 + 56), 0, 0, 1u);
        }
      }
    }
  }
}

void __AXSGetCachedPreference_block_invoke(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  uint64_t v4;
  const __CFNumber *NumberPreference;
  dispatch_time_t v6;
  _QWORD v7[6];
  __int128 v8;
  int valuePtr;
  _QWORD block[6];

  if (cachedAppID_onceToken != -1)
    dispatch_once(&cachedAppID_onceToken, &__block_literal_global_1626);
  v2 = cachedAppID_CachedAppID;
  preferencesQueue();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __AXSGetCachedPreference_block_invoke_2;
  block[3] = &__block_descriptor_48_e5_v8__0l;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v2;
  dispatch_async(v3, block);

  NumberPreference = (const __CFNumber *)_getNumberPreference(*(const __CFString **)(a1 + 40), 0);
  valuePtr = -1;
  if (NumberPreference)
  {
    CFNumberGetValue(NumberPreference, kCFNumberIntType, &valuePtr);
    **(_DWORD **)(a1 + 48) = valuePtr;
  }
  v6 = dispatch_time(0, 500000000);
  v7[0] = v4;
  v7[1] = 3221225472;
  v7[2] = __AXSGetCachedPreference_block_invoke_3;
  v7[3] = &__block_descriptor_64_e5_v8__0l;
  v7[4] = *(_QWORD *)(a1 + 40);
  v7[5] = v2;
  v8 = *(_OWORD *)(a1 + 48);
  dispatch_after(v6, MEMORY[0x1E0C80D38], v7);
}

void __AXSGetCachedPreference_block_invoke_3_cold_1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_6(&dword_18F1A7000, v0, (uint64_t)v0, "Sending Update UI notification: preference = %@, cache = %d (-1 - empty, 0 - false, 1 - true)", v1);
  OUTLINED_FUNCTION_1();
}

@end
