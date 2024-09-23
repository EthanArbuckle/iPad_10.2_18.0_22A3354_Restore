@implementation SBMedusaAppsTestRecipe

- (SBMedusaAppsTestRecipe)init
{
  SBMedusaAppsTestRecipe *v2;
  uint64_t v3;
  NSString *leftTestBundleID;
  uint64_t v5;
  NSString *rightTestBundleID;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBMedusaAppsTestRecipe;
  v2 = -[SBMedusaAppsTestRecipe init](&v8, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(CFSTR("com.apple.mobilesafari"), "copy");
    leftTestBundleID = v2->_leftTestBundleID;
    v2->_leftTestBundleID = (NSString *)v3;

    v5 = objc_msgSend(CFSTR("com.apple.MobileSMS"), "copy");
    rightTestBundleID = v2->_rightTestBundleID;
    v2->_rightTestBundleID = (NSString *)v5;

    v2->_activated = 0;
  }
  return v2;
}

- (id)title
{
  return CFSTR("Medusa 2 Apps");
}

- (void)_toggle
{
  void *v3;
  SBDeviceApplicationSceneEntity *v4;
  void *v5;
  uint64_t v6;
  SBDeviceApplicationSceneEntity *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  id v27;

  self->_activated ^= 1u;
  -[SBMedusaAppsTestRecipe _updateAppsToBringUpFromPreferences](self, "_updateAppsToBringUpFromPreferences");
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = [SBDeviceApplicationSceneEntity alloc];
  objc_msgSend(v3, "applicationWithBundleIdentifier:", self->_rightTestBundleID);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:](v4, "initWithApplicationForMainDisplay:", v5);

  v7 = [SBDeviceApplicationSceneEntity alloc];
  objc_msgSend(v3, "applicationWithBundleIdentifier:", self->_leftTestBundleID);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:](v7, "initWithApplicationForMainDisplay:", v8);

  +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutStatePrimaryElement");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "layoutStateSideElement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "workspaceEntity");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "workspaceEntity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v3;
  if (self->_activated)
  {
    if (v13)
      v15 = v13;
    else
      v15 = (void *)v9;
    v16 = v15;
    if (v14)
      v17 = v14;
    else
      v17 = (void *)v6;
    v18 = v17;
    v19 = (void *)v9;
    v20 = (void *)v6;
  }
  else
  {
    v19 = (void *)v9;
    v16 = v13;
    v20 = (void *)v6;
    if ((objc_msgSend(v14, "isAnalogousToEntity:", v6, v23) & 1) != 0)
    {
      +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v18 = v14;
    }
  }
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __33__SBMedusaAppsTestRecipe__toggle__block_invoke;
  v25[3] = &unk_1E8EABC30;
  v26 = v16;
  v27 = v18;
  v21 = v18;
  v22 = v16;
  objc_msgSend(v24, "requestTransitionWithOptions:builder:validator:", 0, v25, &__block_literal_global_125);

}

void __33__SBMedusaAppsTestRecipe__toggle__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v4[4];
  id v5;
  id v6;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __33__SBMedusaAppsTestRecipe__toggle__block_invoke_2;
  v4[3] = &unk_1E8E9ECA8;
  v5 = *(id *)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  objc_msgSend(a2, "modifyApplicationContext:", v4);

}

void __33__SBMedusaAppsTestRecipe__toggle__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setEntity:forLayoutRole:", v3, 1);
  objc_msgSend(v4, "setEntity:forLayoutRole:", *(_QWORD *)(a1 + 40), 2);

}

uint64_t __33__SBMedusaAppsTestRecipe__toggle__block_invoke_3()
{
  return 1;
}

- (void)_updateAppsToBringUpFromPreferences
{
  __CFString *v3;
  __CFString *v4;
  NSString *v5;
  NSString *leftTestBundleID;
  __CFString *v7;
  __CFString *v8;
  NSString *v9;
  NSString *rightTestBundleID;
  id v11;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringForKey:", CFSTR("testMedusaAppLeftBundleID"));
  v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!v3)
    v3 = CFSTR("com.apple.mobilesafari");
  v5 = (NSString *)-[__CFString copy](v3, "copy");
  leftTestBundleID = self->_leftTestBundleID;
  self->_leftTestBundleID = v5;

  objc_msgSend(v11, "stringForKey:", CFSTR("testMedusaAppRightBundleID"));
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    v7 = CFSTR("com.apple.MobileSMS");
  v9 = (NSString *)-[__CFString copy](v7, "copy");
  rightTestBundleID = self->_rightTestBundleID;
  self->_rightTestBundleID = v9;

}

- (FBApplicationUpdateScenesTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_rightTestBundleID, 0);
  objc_storeStrong((id *)&self->_leftTestBundleID, 0);
}

@end
