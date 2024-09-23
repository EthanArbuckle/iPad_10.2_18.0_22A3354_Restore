@implementation SUCoreDDMUtilities

+ (id)sharedLogger
{
  if (sharedLogger_loggerOnce != -1)
    dispatch_once(&sharedLogger_loggerOnce, &__block_literal_global_7);
  return (id)sharedLogger_logger;
}

void __34__SUCoreDDMUtilities_sharedLogger__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0DA8960]), "initWithCategory:", CFSTR("DDM"));
  v1 = (void *)sharedLogger_logger;
  sharedLogger_logger = v0;

}

+ (void)postNotificationOfType:(unsigned __int16)a3
{
  objc_msgSend(a1, "postNotificationOfType:description:", a3, 0);
}

+ (void)postNotificationOfType:(unsigned __int16)a3 description:(id)a4
{
  unsigned int v4;
  id v5;
  void *v6;
  NSObject *v7;
  const __CFString *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  v15 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (v5)
  {
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "oslog");
    v7 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      if (v4 > 3)
        v8 = CFSTR("Unknown");
      else
        v8 = off_1EA8796F8[(__int16)v4];
      v9 = 136315650;
      v10 = "+[SUCoreDDMUtilities postNotificationOfType:description:]";
      v11 = 2114;
      v12 = v8;
      v13 = 2114;
      v14 = v5;
      _os_log_impl(&dword_1DDFDD000, v7, OS_LOG_TYPE_DEFAULT, "%s: Posting %{public}@ for %{public}@", (uint8_t *)&v9, 0x20u);
    }

  }
  if (v4 <= 3)
    notify_post((const char *)-[__CFString UTF8String](*off_1EA879718[(__int16)v4], "UTF8String"));

}

+ (BOOL)_forceSupervision
{
  int AppBooleanValue;
  void *v3;
  NSObject *v4;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  AppBooleanValue = CFPreferencesGetAppBooleanValue(CFSTR("ForceSupervision"), CFSTR("com.apple.sucore.ddm"), 0);
  if (AppBooleanValue)
  {
    +[SUCoreDDMUtilities sharedLogger](SUCoreDDMUtilities, "sharedLogger");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "oslog");
    v4 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v6 = 136315138;
      v7 = "+[SUCoreDDMUtilities _forceSupervision]";
      _os_log_impl(&dword_1DDFDD000, v4, OS_LOG_TYPE_DEFAULT, "%s: forceSupervision is set", (uint8_t *)&v6, 0xCu);
    }

  }
  return AppBooleanValue != 0;
}

@end
