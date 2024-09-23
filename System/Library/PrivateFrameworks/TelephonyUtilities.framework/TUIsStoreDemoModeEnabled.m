@implementation TUIsStoreDemoModeEnabled

void __TUIsStoreDemoModeEnabled_block_invoke()
{
  BOOL v0;
  NSObject *v1;
  uint8_t v2[15];
  Boolean keyExistsAndHasValidFormat;

  keyExistsAndHasValidFormat = 0;
  if (CFPreferencesGetAppBooleanValue(CFSTR("StoreDemoMode"), CFSTR("com.apple.demo-settings"), &keyExistsAndHasValidFormat))
  {
    v0 = keyExistsAndHasValidFormat == 0;
  }
  else
  {
    v0 = 1;
  }
  if (!v0)
  {
    TUDefaultLog();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v2 = 0;
      _os_log_impl(&dword_19A50D000, v1, OS_LOG_TYPE_DEFAULT, "[WARN] Store demo mode is enabled. There could be some restrictions enabled.", v2, 2u);
    }

    TUIsStoreDemoModeEnabled_storeDemoModeEnabled = 1;
  }
}

@end
