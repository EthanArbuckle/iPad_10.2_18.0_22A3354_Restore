@implementation PCShouldUseSystemActivityAssertion

void __PCShouldUseSystemActivityAssertion_block_invoke()
{
  __CFString *v0;
  int AppBooleanValue;
  int v2;
  NSObject *v3;
  const __CFString *v4;
  Boolean keyExistsAndHasValidFormat;
  uint8_t buf[4];
  const __CFString *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  keyExistsAndHasValidFormat = 0;
  v0 = (__CFString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("/var/mobile/Library/Preferences/%@"), CFSTR("com.apple.persistentconnection"));
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("PCShouldUseSystemActivityAssertion"), v0, &keyExistsAndHasValidFormat);
  if (keyExistsAndHasValidFormat)
  {
    v2 = AppBooleanValue;
    +[PCLog timer](PCLog, "timer");
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = CFSTR("YES");
      if (!v2)
        v4 = CFSTR("NO");
      *(_DWORD *)buf = 138543618;
      v7 = CFSTR("PCShouldUseSystemActivityAssertion");
      v8 = 2114;
      v9 = v4;
      _os_log_impl(&dword_1CBC1B000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ set. Setting PCShouldUseSystemActivityAssertion to %{public}@.", buf, 0x16u);
    }

    PCShouldUseSystemActivityAssertion_shouldUse = v2 != 0;
  }

}

@end
