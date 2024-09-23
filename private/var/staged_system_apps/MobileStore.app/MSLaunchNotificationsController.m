@implementation MSLaunchNotificationsController

- (MSLaunchNotificationsController)initWithParentViewController:(id)a3
{
  MSLaunchNotificationsController *v4;
  id v5;
  objc_super v7;
  id location;

  objc_initWeak(&location, a3);
  v7.receiver = self;
  v7.super_class = (Class)MSLaunchNotificationsController;
  v4 = -[MSLaunchNotificationsController init](&v7, "init");
  if (v4)
  {
    v5 = objc_loadWeakRetained(&location);
    objc_storeWeak((id *)&v4->_parentViewController, v5);

  }
  objc_destroyWeak(&location);
  return v4;
}

- (void)checkForNotifications
{
  if (!-[MSLaunchNotificationsController _hasDisplayedFamilySetup](self, "_hasDisplayedFamilySetup"))
    -[MSLaunchNotificationsController _showFamilySetupPrompt](self, "_showFamilySetupPrompt");
}

- (BOOL)_hasDisplayedFamilySetup
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = objc_msgSend(v2, "BOOLForKey:", CFSTR("SUUIFamilySetupDisplayed"));

  return v3;
}

- (void)_showFamilySetupPrompt
{
  void *v3;
  uint64_t v4;
  AAUIFamilySetupPrompter *v5;
  AAUIFamilySetupPrompter *familySetupPrompter;
  AAUIFamilySetupPrompter *v7;
  id WeakRetained;
  void *v9;
  id v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SSAccountStore defaultStore](SSAccountStore, "defaultStore"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeAccount"));

  if (v10)
  {
    v4 = sub_100003E38();
    v5 = (AAUIFamilySetupPrompter *)objc_msgSend(objc_alloc((Class)sub_100003F08(CFSTR("AAUIFamilySetupPrompter"), v4)), "initWithiTunesAccount:", v10);
    familySetupPrompter = self->_familySetupPrompter;
    self->_familySetupPrompter = v5;

    v7 = self->_familySetupPrompter;
    WeakRetained = objc_loadWeakRetained((id *)&self->_parentViewController);
    -[AAUIFamilySetupPrompter promptIfEligibleWithPresentingViewController:isFirstRun:](v7, "promptIfEligibleWithPresentingViewController:isFirstRun:", WeakRetained, 1);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    objc_msgSend(v9, "setBool:forKey:", 1, CFSTR("SUUIFamilySetupDisplayed"));
    objc_msgSend(v9, "synchronize");

  }
}

- (SUUIClientContext)clientContext
{
  return self->_clientContext;
}

- (void)setClientContext:(id)a3
{
  objc_storeStrong((id *)&self->_clientContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationQueue, 0);
  objc_destroyWeak((id *)&self->_parentViewController);
  objc_storeStrong((id *)&self->_familySetupPrompter, 0);
  objc_storeStrong((id *)&self->_clientContext, 0);
}

@end
