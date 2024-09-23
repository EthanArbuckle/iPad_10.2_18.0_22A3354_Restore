@implementation WLLogController

+ (id)sharedLogger
{
  if (sharedLogger_onceToken != -1)
    dispatch_once(&sharedLogger_onceToken, &__block_literal_global_0);
  return (id)sharedLogger_instance;
}

void __31__WLLogController_sharedLogger__block_invoke()
{
  WLLogController *v0;
  void *v1;

  v0 = objc_alloc_init(WLLogController);
  v1 = (void *)sharedLogger_instance;
  sharedLogger_instance = (uint64_t)v0;

}

- (WLLogController)init
{
  WLLogController *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  WLLogController *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WLLogController;
  v2 = -[WLLogController init](&v6, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)_loggingUserDefaultsChangedNotificationHandler, CFSTR("com.apple.welcomekit.log.defaultschange"), 0, CFNotificationSuspensionBehaviorCoalesce);
    -[WLLogController _reloadLogPreferences](v2, "_reloadLogPreferences");
    v4 = v2;
  }

  return v2;
}

- (BOOL)_loggingEnabled
{
  return self->_loggingEnabled;
}

- (void)_reloadLogPreferences
{
  void *v3;
  char v4;
  id v5;

  if (+[WLInternal isInternal](WLInternal, "isInternal"))
  {
    self->_loggingEnabled = 1;
  }
  else
  {
    v5 = (id)CFPreferencesCopyAppValue(CFSTR("LogToFile"), CFSTR("com.apple.welcomekit"));
    v3 = (void *)CFPreferencesCopyAppValue(CFSTR("LogToSyslog"), CFSTR("com.apple.welcomekit"));
    if ((objc_msgSend(v5, "BOOLValue") & 1) != 0)
      v4 = 1;
    else
      v4 = objc_msgSend(v3, "BOOLValue");
    self->_loggingEnabled = v4;

  }
}

- (void)logMessageFromAddress:(void *)a3 withLevel:(unint64_t)a4 format:(id)a5 args:(char *)a6
{
  id v7;
  void *v8;
  id v9;

  v7 = a5;
  v8 = v7;
  if (self->_loggingEnabled)
  {
    v9 = v7;
    if (logMessageFromAddress_withLevel_format_args__onceToken != -1)
      dispatch_once(&logMessageFromAddress_withLevel_format_args__onceToken, &__block_literal_global_9);
    os_log_shim_with_CFString();
    v8 = v9;
  }

}

void __63__WLLogController_logMessageFromAddress_withLevel_format_args___block_invoke()
{
  if (_block_invoke_onceToken != -1)
    dispatch_once(&_block_invoke_onceToken, &__block_literal_global_10);
}

void __63__WLLogController_logMessageFromAddress_withLevel_format_args___block_invoke_2()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.welcomekit", "core");
  v1 = (void *)logMessageFromAddress_withLevel_format_args__log;
  logMessageFromAddress_withLevel_format_args__log = (uint64_t)v0;

}

@end
