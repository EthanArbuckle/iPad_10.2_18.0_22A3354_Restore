@implementation VUIActionSystemSettings

- (VUIActionSystemSettings)initWithContextData:(id)a3
{
  id v4;
  VUIActionSystemSettings *v5;
  VUIActionSystemSettings *v6;
  void *v7;
  uint64_t v8;
  NSString *settingsAppDeeplink;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)VUIActionSystemSettings;
  v5 = -[VUIActionSystemSettings init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    if (v4)
    {
      objc_msgSend(v4, "vui_stringForKey:", CFSTR("subsection"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v6->_subsectionDestination = +[VUIActionSystemSettings _subsectionFromString:](VUIActionSystemSettings, "_subsectionFromString:", v7);
      objc_msgSend(v4, "vui_stringForKey:", CFSTR("settingsAppDeeplink"));
      v8 = objc_claimAutoreleasedReturnValue();
      settingsAppDeeplink = v6->_settingsAppDeeplink;
      v6->_settingsAppDeeplink = (NSString *)v8;

    }
    else
    {
      v5->_subsectionDestination = 0;
    }
  }

  return v6;
}

- (void)performWithTargetResponder:(id)a3 completionHandler:(id)a4
{
  _BOOL8 v5;
  void *v6;
  id v7;

  v7 = a4;
  v5 = +[VUIActionSystemSettings _openAccountSettings:](VUIActionSystemSettings, "_openAccountSettings:", self->_subsectionDestination);
  v6 = v7;
  if (v7)
  {
    (*((void (**)(id, _BOOL8))v7 + 2))(v7, v5);
    v6 = v7;
  }

}

- (BOOL)isAccountRequired
{
  return 1;
}

+ (BOOL)_openAccountSettings:(int64_t)a3
{
  VUIAccountSettingsViewController *v4;
  void *v5;
  void *v6;

  v4 = objc_alloc_init(VUIAccountSettingsViewController);
  -[VUIAccountSettingsViewController setInitialSubsection:](v4, "setInitialSubsection:", a3);
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v4);
  objc_msgSend(v5, "setModalTransitionStyle:", 0);
  objc_msgSend(v5, "setModalPresentationStyle:", 2);
  +[VUIApplicationRouter topPresentedViewController](VUIApplicationRouter, "topPresentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

  return 1;
}

+ (int64_t)_subsectionFromString:(id)a3
{
  id v3;
  void *v4;
  int64_t v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    if ((objc_msgSend(v3, "isEqualToString:", CFSTR("ConnectedApps")) & 1) != 0)
    {
      v5 = 1;
    }
    else if (objc_msgSend(v4, "isEqualToString:", CFSTR("ManageSubscriptions")))
    {
      v5 = 2;
    }
    else
    {
      v5 = 0;
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (int64_t)subsectionDestination
{
  return self->_subsectionDestination;
}

- (void)setSubsectionDestination:(int64_t)a3
{
  self->_subsectionDestination = a3;
}

- (NSString)settingsAppDeeplink
{
  return self->_settingsAppDeeplink;
}

- (void)setSettingsAppDeeplink:(id)a3
{
  objc_storeStrong((id *)&self->_settingsAppDeeplink, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settingsAppDeeplink, 0);
}

@end
