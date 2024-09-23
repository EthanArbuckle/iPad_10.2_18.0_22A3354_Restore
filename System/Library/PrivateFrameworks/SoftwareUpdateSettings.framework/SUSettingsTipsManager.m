@implementation SUSettingsTipsManager

+ (id)sharedManager
{
  id location;
  dispatch_once_t *v4;

  v4 = (dispatch_once_t *)&sharedManager_onceToken;
  location = 0;
  objc_storeStrong(&location, &__block_literal_global_3);
  if (*v4 != -1)
    dispatch_once(v4, location);
  objc_storeStrong(&location, 0);
  return (id)sharedManager_sharedInstance;
}

void __38__SUSettingsTipsManager_sharedManager__block_invoke()
{
  SUSettingsTipsManager *v0;
  void *v1;

  v0 = objc_alloc_init(SUSettingsTipsManager);
  v1 = (void *)sharedManager_sharedInstance;
  sharedManager_sharedInstance = (uint64_t)v0;

}

- (SUSettingsTipsManager)init
{
  SUSettingsTipsManager *v3;
  objc_super v4;
  SEL v5;
  SUSettingsTipsManager *v6;

  v5 = a2;
  v6 = 0;
  v4.receiver = self;
  v4.super_class = (Class)SUSettingsTipsManager;
  v6 = -[SUSettingsTipsManager init](&v4, sel_init);
  v3 = v6;
  objc_storeStrong((id *)&v6, 0);
  return v3;
}

- (void)setup
{
  -[SUSettingsTipsManager setup:](self, "setup:", 0, a2, self);
}

- (void)setupForManualControl
{
  -[SUSettingsTipsManager setup:](self, "setup:", 1, a2, self);
}

- (void)setup:(BOOL)a3
{
  SUSettingsSwiftTipsManager *v3;
  BOOL v4;

  v4 = a3;
  v3 = +[SUSettingsSwiftTipsManager sharedManager](SUSettingsSwiftTipsManager, "sharedManager");
  -[SUSettingsSwiftTipsManager setupForManualControl:](v3, "setupForManualControl:", v4);

}

- (void)configureManualComingSoonTipWithTitle:(id)a3 andContent:(id)a4 learnMoreLink:(id)a5
{
  SUSettingsSwiftTipsManager *v7;
  id v8;
  id v9;
  id location[3];

  location[2] = self;
  location[1] = (id)a2;
  location[0] = 0;
  objc_storeStrong(location, a3);
  v9 = 0;
  objc_storeStrong(&v9, a4);
  v8 = 0;
  objc_storeStrong(&v8, a5);
  v7 = +[SUSettingsSwiftTipsManager sharedManager](SUSettingsSwiftTipsManager, "sharedManager");
  -[SUSettingsSwiftTipsManager configureManualComingSoonTipWithTitle:andContent:learnMoreLink:](v7, "configureManualComingSoonTipWithTitle:andContent:learnMoreLink:", location[0], v9, v8);

  objc_storeStrong(&v8, 0);
  objc_storeStrong(&v9, 0);
  objc_storeStrong(location, 0);
}

@end
