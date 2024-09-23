@implementation RMSLoggingInitialize

void ___RMSLoggingInitialize_block_invoke()
{
  void *v0;
  __CFString *v1;
  const void *v2;
  void *v3;
  void *v4;
  __CFNotificationCenter *DarwinNotifyCenter;
  __CFNotificationCenter *v6;
  const __CFString *v7;
  const __CFString *v8;
  const __CFString *v9;
  const __CFString *v10;
  const __CFString *v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  CPLoggingSetMaxConsoleLevel();
  CPLoggingSetLogName();
  if (MGGetBoolAnswer())
  {
    v0 = (void *)MEMORY[0x24BDD17C8];
    v7 = CFSTR("/");
    v8 = CFSTR("var");
    v9 = CFSTR("mobile");
    v10 = CFSTR("Library");
    v11 = CFSTR("Logs");
    v12 = CFSTR("TVRemoteMediaServices");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 6);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "pathWithComponents:", v1);
    v2 = (const void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = (__CFString *)CPLoggingCopyLogDirectory();
    v3 = (void *)MEMORY[0x24BDD17C8];
    v7 = v1;
    v8 = CFSTR("TVRemoteMediaServices");
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v7, 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "pathWithComponents:", v4);
    v2 = (const void *)objc_claimAutoreleasedReturnValue();

  }
  CPLoggingSetLogDirectory();
  CFRelease(v2);
  CPLoggingSetCreateLogFormatBlock();
  _RMSInitializeLogLevel();
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_RMSLogLevelChangedHandler, CFSTR("com.apple.TVRemoteMediaServices.LogLevelChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(v6, 0, (CFNotificationCallback)_RMSLogLevelChangedHandler, CFSTR("com.apple.ManagedConfiguration.profileListChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
}

CFStringRef ___RMSLoggingInitialize_block_invoke_2(int a1, int a2, CFDateRef date, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10)
{
  CFStringRef StringWithDate;
  CFStringRef v13;
  const __CFString *v14;
  CFStringRef v15;

  if (_RMSLogDateFormat_once != -1)
    dispatch_once(&_RMSLogDateFormat_once, &__block_literal_global_25);
  StringWithDate = CFDateFormatterCreateStringWithDate(0, (CFDateFormatterRef)_RMSLogDateFormat_dateFormatter, date);
  v13 = StringWithDate;
  if ((a2 - 3) > 4)
    v14 = CFSTR("Unknown");
  else
    v14 = off_24DCD7810[a2 - 3];
  v15 = CFStringCreateWithFormat(0, 0, CFSTR("%@ [%@] %@"), StringWithDate, v14, a10);
  CFRelease(v13);
  return v15;
}

@end
