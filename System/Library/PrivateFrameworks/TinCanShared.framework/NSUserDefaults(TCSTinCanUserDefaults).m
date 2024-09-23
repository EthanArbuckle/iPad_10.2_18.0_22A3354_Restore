@implementation NSUserDefaults(TCSTinCanUserDefaults)

- (uint64_t)_tcsHandleDeviceFirstUnlock
{
  NSObject *v2;
  uint8_t v4[16];

  _TCSInitializeLogging();
  v2 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21342E000, v2, OS_LOG_TYPE_DEFAULT, "TCSTinCanUserDefaults notified of device first-unlock.", v4, 2u);
  }
  return objc_msgSend(a1, "_tcsEnsureProtectionClass");
}

- (uint64_t)_tcsSetPrefsDaemonCacheEnabled:()TCSTinCanUserDefaults
{
  return _CFPreferencesSetDaemonCacheEnabled();
}

- (void)_tcsSetPrefsObject:()TCSTinCanUserDefaults forKey:
{
  CFPreferencesSetValue(key, value, CFSTR("com.apple.tincan"), (CFStringRef)*MEMORY[0x24BDBD590], (CFStringRef)*MEMORY[0x24BDBD588]);
}

- (uint64_t)_tcsEnsureProtectionClass
{
  NSObject *v2;
  uint8_t v4[16];

  _TCSInitializeLogging();
  v2 = TCSLogDefault;
  if (os_log_type_enabled((os_log_t)TCSLogDefault, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_21342E000, v2, OS_LOG_TYPE_DEFAULT, "TCSTinCanUserDefaults ensuring domain is protection class C.", v4, 2u);
  }
  _CFPreferencesSetFileProtectionClass();
  objc_msgSend(a1, "_tcsSetPrefsDaemonCacheEnabled:", 0);
  objc_msgSend(a1, "_tcsSetPrefsObject:forKey:", MEMORY[0x24BDBD1C8], CFSTR("SetFileProtectionClass"));
  objc_msgSend(a1, "_tcsSetPrefsObject:forKey:", 0, CFSTR("SetFileProtectionClass"));
  return objc_msgSend(a1, "_tcsSetPrefsDaemonCacheEnabled:", 1);
}

@end
