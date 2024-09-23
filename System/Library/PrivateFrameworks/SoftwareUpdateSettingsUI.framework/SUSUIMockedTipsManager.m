@implementation SUSUIMockedTipsManager

+ (id)sharedManager
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedManager_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_4);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedManager_sharedInstance;
}

void __39__SUSUIMockedTipsManager_sharedManager__block_invoke()
{
  SUSUIMockedTipsManager *v0;
  void *v1;

  v0 = objc_alloc_init(SUSUIMockedTipsManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;

}

- (SUSUIMockedTipsManager)init
{
  SUSUIMockedTipsManager *v3;
  objc_super v4;
  SEL v5;
  SUSUIMockedTipsManager *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUSUIMockedTipsManager;
  v6 = -[SUSettingsTipsManager init](&v4, sel_init);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)setup
{
  -[SUSettingsTipsManager setupForManualControl](self, "setupForManualControl", a2, self);
}

- (void)contentDidBecomeAvailableWithTitle:(id)a3 andContent:(id)a4 learnMoreLinkUrl:(id)a5
{
  NSObject *log;
  os_log_type_t v6;
  id v7;
  id v8;
  id v9;
  id v12;
  os_log_type_t type;
  os_log_t oslog;
  id v15;
  id v16;
  id location[2];
  SUSUIMockedTipsManager *v18;
  uint8_t v19[56];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18 = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v16 = 0;
  objc_storeStrong(&v16, a4);
  v15 = 0;
  objc_storeStrong(&v15, a5);
  oslog = (os_log_t)_SUSUIInternalLoggingFacility();
  type = OS_LOG_TYPE_DEFAULT;
  if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
  {
    log = oslog;
    v6 = type;
    v9 = +[SUSUITestAutomationManager sharedManager](SUSUITestAutomationManager, "sharedManager");
    v8 = (id)objc_msgSend(v9, "currentSession");
    v7 = (id)objc_msgSend(v8, "correlationId");
    v12 = v7;
    __os_log_helper_16_2_4_8_64_8_66_8_66_8_66((uint64_t)v19, (uint64_t)v12, (uint64_t)location[0], (uint64_t)v16, (uint64_t)v15);
    _os_log_impl(&dword_21BF33000, log, v6, "[XCUI correlationId: %@] XCUI Testing - Displaying Coming Soon Tip:\n\tTitle: %{public}@\n\tContent: %{public}@\n\tLearn More URL: %{public}@", v19, 0x2Au);

    objc_storeStrong(&v12, 0);
  }
  objc_storeStrong((id *)&oslog, 0);
  -[SUSettingsTipsManager configureManualComingSoonTipWithTitle:andContent:learnMoreLink:](v18, "configureManualComingSoonTipWithTitle:andContent:learnMoreLink:", location[0], v16, v15);
  objc_storeStrong(&v15, 0);
  objc_storeStrong(&v16, 0);
  objc_storeStrong(location, 0);
}

@end
