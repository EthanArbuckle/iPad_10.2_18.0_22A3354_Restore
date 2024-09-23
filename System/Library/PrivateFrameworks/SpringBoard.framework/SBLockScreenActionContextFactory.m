@implementation SBLockScreenActionContextFactory

+ (id)sharedInstance
{
  if (sharedInstance___once_4 != -1)
    dispatch_once(&sharedInstance___once_4, &__block_literal_global_156);
  return (id)sharedInstance___instance_5;
}

void __50__SBLockScreenActionContextFactory_sharedInstance__block_invoke()
{
  SBLockScreenActionContextFactory *v0;
  void *v1;

  v0 = objc_alloc_init(SBLockScreenActionContextFactory);
  v1 = (void *)sharedInstance___instance_5;
  sharedInstance___instance_5 = (uint64_t)v0;

}

- (id)lockScreenActionContextForAlertItem:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v3 = a3;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SBLockScreenActionContextFactory_lockScreenActionContextForAlertItem___block_invoke;
  v10[3] = &unk_1E8E9DED8;
  v11 = v3;
  v4 = v3;
  v5 = (void *)MEMORY[0x1D17E5550](v10);
  objc_msgSend(v4, "lockLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "shortLockLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9EA0]), "initWithLockLabel:shortLockLabel:action:identifier:", v6, v7, v5, 0);
  objc_msgSend(v8, "setCanBypassPinLock:", 0);
  objc_msgSend(v8, "setRequiresUIUnlock:", 1);
  objc_msgSend(v8, "setDeactivateAwayController:", 1);

  return v8;
}

uint64_t __72__SBLockScreenActionContextFactory_lockScreenActionContextForAlertItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performUnlockAction");
}

- (id)lockScreenActionContextForPlugin:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(v4, "unlockAction");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBLockScreenActionContextFactory lockScreenActionContextForAction:fromPlugin:](self, "lockScreenActionContextForAction:fromPlugin:", v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)lockScreenActionContextForAction:(id)a3 fromPlugin:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v23[4];
  id v24;
  _QWORD v25[4];
  id v26;
  id v27;
  id v28;
  uint64_t v29;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  v8 = 0;
  if (v5 && v6)
  {
    if (objc_msgSend(v5, "isApplicationAction"))
    {
      +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "policyAggregator");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "allowsCapability:", 3);

      if (!v11)
      {
        v18 = 0;
LABEL_14:
        v8 = 0;
LABEL_17:

        goto LABEL_18;
      }
      v12 = v5;
      objc_msgSend(v7, "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "bundleID");
      v14 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "url");
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v12, "transitionStyle");
      if (v14 | v15)
      {
        v17 = v16;
        v18 = objc_alloc_init(MEMORY[0x1E0DA9EA0]);
        objc_msgSend(v12, "label");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setLockLabel:", v19);

        objc_msgSend(v18, "setRequiresAuthentication:", 1);
        objc_msgSend(v18, "setCanBypassPinLock:", 0);
        objc_msgSend(v18, "setRequiresUIUnlock:", 1);
        objc_msgSend(v18, "setDeactivateAwayController:", 1);
        objc_msgSend(v18, "setIntent:", 3);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke;
        v25[3] = &unk_1E8EA0AC8;
        v26 = (id)v14;
        v27 = (id)v15;
        v28 = v13;
        v29 = v17;
        objc_msgSend(v18, "setAction:", v25);

      }
      else
      {
        v18 = 0;
      }

      if (!(v14 | v15))
        goto LABEL_14;
    }
    else if (objc_msgSend(v5, "isEmergencyDialerAction"))
    {
      v18 = objc_alloc_init(MEMORY[0x1E0DA9EA0]);
      objc_msgSend(v18, "setRequiresAuthentication:", 0);
      objc_msgSend(v18, "setRequiresUIUnlock:", 0);
      objc_msgSend(v18, "setDeactivateAwayController:", 0);
      objc_msgSend(v18, "setAction:", &__block_literal_global_10_0);
    }
    else if (objc_msgSend(v5, "isCallAction"))
    {
      v20 = v5;
      v18 = objc_alloc_init(MEMORY[0x1E0DA9EA0]);
      objc_msgSend(v18, "setRequiresAuthentication:", 0);
      objc_msgSend(v18, "setRequiresUIUnlock:", 0);
      objc_msgSend(v18, "setDeactivateAwayController:", 0);
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_5;
      v23[3] = &unk_1E8E9DED8;
      v24 = v20;
      v21 = v20;
      objc_msgSend(v18, "setAction:", v23);

    }
    else
    {
      v18 = 0;
    }
    objc_msgSend(v18, "setSource:", 8);
    v18 = v18;
    v8 = v18;
    goto LABEL_17;
  }
LABEL_18:

  return v8;
}

void __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;
  uint64_t v11;

  if (!*(_QWORD *)(a1 + 32))
  {
    SBWorkspaceApplicationForURLWithError(*(void **)(a1 + 40), 0, 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      goto LABEL_4;
    goto LABEL_3;
  }
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationWithBundleIdentifier:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
LABEL_3:
    +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_2;
    v7[3] = &unk_1E8EAE4C0;
    v8 = v3;
    v9 = *(id *)(a1 + 48);
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 56);
    v10 = v5;
    v11 = v6;
    objc_msgSend(v4, "requestTransitionWithBuilder:", v7);

  }
LABEL_4:

}

void __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  id v12;
  uint64_t v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("Activate %@ from plugin %@"), v6, *(_QWORD *)(a1 + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEventLabel:", v7);

  objc_msgSend(v5, "setSource:", 7);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_3;
  v10[3] = &unk_1E8EAE498;
  v11 = *(id *)(a1 + 32);
  v8 = *(id *)(a1 + 48);
  v9 = *(_QWORD *)(a1 + 56);
  v12 = v8;
  v13 = v9;
  objc_msgSend(v5, "modifyApplicationContext:", v10);

}

void __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_3(_QWORD *a1, void *a2)
{
  SBDeviceApplicationSceneEntity *v3;
  id v4;

  v4 = a2;
  v3 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", a1[4]);
  -[SBWorkspaceEntity setObject:forActivationSetting:](v3, "setObject:forActivationSetting:", a1[5], 5);
  objc_msgSend(v4, "setActivatingEntity:", v3);
  if (a1[6] == 2)
    objc_msgSend(v4, "setAnimationDisabled:", 1);

}

void __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_4()
{
  void *v0;
  void *v1;
  id v2;

  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lockScreenEnvironment");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "callController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "launchEmergencyDialer");

}

void __80__SBLockScreenActionContextFactory_lockScreenActionContextForAction_fromPlugin___block_invoke_5(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "url");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  SBWorkspaceActivateApplicationFromURL(v1, 0, 0);

}

@end
