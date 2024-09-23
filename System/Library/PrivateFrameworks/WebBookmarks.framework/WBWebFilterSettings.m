@implementation WBWebFilterSettings

+ (WBWebFilterSettings)sharedWebFilterSettings
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__WBWebFilterSettings_sharedWebFilterSettings__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedWebFilterSettings_onceToken != -1)
    dispatch_once(&sharedWebFilterSettings_onceToken, block);
  return (WBWebFilterSettings *)(id)sharedWebFilterSettings_settings;
}

- (BOOL)isWebFilterEnabled
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WBWebFilterSettings userSettings](self, "userSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "restrictionType") != 0;
  else
    v4 = 0;

  return v4;
}

- (BOOL)usesAllowedSitesOnly
{
  void *v2;
  void *v3;
  BOOL v4;

  -[WBWebFilterSettings userSettings](self, "userSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "restrictionType") == 2;
  else
    v4 = 0;

  return v4;
}

- (WFUserSettings)userSettings
{
  WFUserSettings *userSettings;
  void *v4;
  objc_class *v5;
  id v6;
  void *v7;
  WFUserSettings *v8;
  WFUserSettings *v9;
  NSObject *v10;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  __int128 v16;
  Class (*v17)(uint64_t);
  void *v18;
  uint64_t *v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  userSettings = self->_userSettings;
  if (!userSettings)
  {
    if (!WebContentAnalysisLibraryCore_frameworkLibrary)
    {
      v16 = xmmword_24CB32F58;
      v17 = 0;
      WebContentAnalysisLibraryCore_frameworkLibrary = _sl_dlopen();
    }
    if (WebContentAnalysisLibraryCore_frameworkLibrary)
    {
      v12 = 0;
      v13 = &v12;
      v14 = 0x2050000000;
      v4 = (void *)getWFUserSettingsClass_softClass;
      v15 = getWFUserSettingsClass_softClass;
      if (!getWFUserSettingsClass_softClass)
      {
        *(_QWORD *)&v16 = MEMORY[0x24BDAC760];
        *((_QWORD *)&v16 + 1) = 3221225472;
        v17 = __getWFUserSettingsClass_block_invoke;
        v18 = &unk_24CB32F78;
        v19 = &v12;
        __getWFUserSettingsClass_block_invoke((uint64_t)&v16);
        v4 = (void *)v13[3];
      }
      v5 = objc_retainAutorelease(v4);
      _Block_object_dispose(&v12, 8);
      v6 = [v5 alloc];
      NSUserName();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (WFUserSettings *)objc_msgSend(v6, "initWithUserName:", v7, v12);
      v9 = self->_userSettings;
      self->_userSettings = v8;

    }
    userSettings = self->_userSettings;
    if (!userSettings)
    {
      v10 = WBS_LOG_CHANNEL_PREFIXBookmarks();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        -[WBWebFilterSettings userSettings].cold.1(v10);
      userSettings = self->_userSettings;
    }
  }
  return userSettings;
}

void __46__WBWebFilterSettings_sharedWebFilterSettings__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedWebFilterSettings_settings;
  sharedWebFilterSettings_settings = (uint64_t)v1;

}

- (WBWebFilterSettings)init
{
  WBWebFilterSettings *v2;
  __CFNotificationCenter *DarwinNotifyCenter;
  WBWebFilterSettings *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WBWebFilterSettings;
  v2 = -[WBWebFilterSettings init](&v6, sel_init);
  if (v2)
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v2, (CFNotificationCallback)webFilterConfigurationChanged, CFSTR("com.apple.ManagedConfiguration.webContentFilterChanged"), 0, (CFNotificationSuspensionBehavior)1024);
    v4 = v2;
  }

  return v2;
}

- (void)dealloc
{
  __CFNotificationCenter *DarwinNotifyCenter;
  objc_super v4;

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveEveryObserver(DarwinNotifyCenter, self);
  v4.receiver = self;
  v4.super_class = (Class)WBWebFilterSettings;
  -[WBWebFilterSettings dealloc](&v4, sel_dealloc);
}

- (void)reloadSettings
{
  WFUserSettings *userSettings;

  userSettings = self->_userSettings;
  self->_userSettings = 0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userSettings, 0);
}

- (void)userSettings
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_211022000, log, OS_LOG_TYPE_ERROR, "Could not construct WFUserSettings. Default values will be used", v1, 2u);
}

@end
