@implementation TUDialAssist

+ (TUDialAssist)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global_7);
  return (TUDialAssist *)(id)sharedInstance_sharedInstance;
}

void __30__TUDialAssist_sharedInstance__block_invoke()
{
  TUDialAssist *v0;
  void *v1;

  v0 = objc_alloc_init(TUDialAssist);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (TUDialAssist)init
{
  TUDialAssist *v2;
  const char *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TUDialAssist;
  v2 = -[TUDialAssist init](&v5, sel_init);
  if (v2)
  {
    v3 = (const char *)objc_msgSend(TUDialAssistUserSettingChanged, "UTF8String");
    notify_register_dispatch(v3, &v2->_dialAssistUserSettingsChangedToken, MEMORY[0x1E0C80D38], &__block_literal_global_3_0);
    CFPreferencesAppSynchronize(TUDialAssistDomain);
    CFPreferencesAppSynchronize(TUMobilePhoneDomain);
  }
  return v2;
}

uint64_t __20__TUDialAssist_init__block_invoke()
{
  NSObject *v0;
  uint8_t v2[16];

  TUDefaultLog();
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl(&dword_19A50D000, v0, OS_LOG_TYPE_DEFAULT, "Dial assist value changed. Synchronizing prefs", v2, 2u);
  }

  return CFPreferencesAppSynchronize(TUDialAssistDomain);
}

- (void)dealloc
{
  objc_super v3;

  notify_cancel(self->_dialAssistUserSettingsChangedToken);
  v3.receiver = self;
  v3.super_class = (Class)TUDialAssist;
  -[TUDialAssist dealloc](&v3, sel_dealloc);
}

- (int)dialAssistUserSettingsChangedToken
{
  return self->_dialAssistUserSettingsChangedToken;
}

@end
