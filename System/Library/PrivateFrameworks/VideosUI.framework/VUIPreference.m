@implementation VUIPreference

+ (BOOL)ignoreHTTPCache
{
  if (ignoreHTTPCache_onceToken != -1)
    dispatch_once(&ignoreHTTPCache_onceToken, &__block_literal_global_11);
  return ignoreHTTPCache_sIgnoreHTTPCache;
}

+ (void)setupJSCoreConsoleLogging
{
  if (setupJSCoreConsoleLogging_onceToken != -1)
    dispatch_once(&setupJSCoreConsoleLogging_onceToken, &__block_literal_global_8);
}

void __32__VUIPreference_ignoreHTTPCache__block_invoke()
{
  int AppBooleanValue;
  void *v1;
  __SecTask *v2;
  void *v3;
  char v4;
  NSObject *v5;

  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("IgnoreHTTPCache"), CFSTR("com.apple.ITMLKit"), 0);
  ignoreHTTPCache_sIgnoreHTTPCache = AppBooleanValue != 0;
  if (!AppBooleanValue)
  {
    objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    ignoreHTTPCache_sIgnoreHTTPCache = objc_msgSend(v1, "BOOLForKey:", CFSTR("IgnoreLocalHTTPCache"));

    if (!ignoreHTTPCache_sIgnoreHTTPCache)
    {
      v2 = SecTaskCreateFromSelf((CFAllocatorRef)*MEMORY[0x1E0C9AE00]);
      v3 = (void *)SecTaskCopyValueForEntitlement(v2, CFSTR("get-task-allow"), 0);
      CFRelease(v2);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        v4 = objc_msgSend(v3, "BOOLValue");
      else
        v4 = 0;
      ignoreHTTPCache_sIgnoreHTTPCache = v4;

    }
  }
  VUIDefaultLogObject();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    __32__VUIPreference_ignoreHTTPCache__block_invoke_cold_1(v5);

}

void __32__VUIPreference_ignoreHTTPCache__block_invoke_cold_1(os_log_t log)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  v1[0] = 67109120;
  v1[1] = ignoreHTTPCache_sIgnoreHTTPCache;
  _os_log_error_impl(&dword_1D96EE000, log, OS_LOG_TYPE_ERROR, "Setting [%d] for Ignore HTTP Cache", (uint8_t *)v1, 8u);
}

uint64_t __42__VUIPreference_setupJSCoreConsoleLogging__block_invoke()
{
  uint64_t result;
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  result = CFPreferencesGetAppBooleanValue(CFSTR("LogJSConsole"), CFSTR("com.apple.ITMLKit"), &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
    return JSRemoteInspectorSetLogToSystemConsole();
  return result;
}

@end
