@implementation SBLoginAppSceneHoster

- (SBLoginAppSceneHoster)init
{
  SBLoginAppSceneHoster *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBLoginAppSceneHoster;
  v2 = -[SBLoginAppSceneHoster init](&v5, sel_init);
  if (v2)
  {
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "registerSceneWorkspaceIdentifierToIgnore:", CFSTR("LoginWorkspace"));

  }
  return v2;
}

- (void)launchLoginAppWithInitialOrientation:(int64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  FBApplicationUpdateScenesTransaction *v16;
  FBApplicationUpdateScenesTransaction *sceneCreateTransaction;
  FBApplicationUpdateScenesTransaction *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  SBDeviceApplicationSceneHandle *v24;
  void *v25;
  void *v26;
  void *v27;
  SBDeviceApplicationSceneHandle *v28;
  SBDeviceApplicationSceneHandle *sceneHandle;
  void *v30;
  void *v31;
  void *v32;
  int64_t v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[6];
  _QWORD v38[6];
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id location[2];

  v6 = a4;
  v7 = v6;
  if (self->_scene)
  {
    (*((void (**)(id, _QWORD, _QWORD))v6 + 2))(v6, 0, 0);
  }
  else
  {
    objc_initWeak(location, self);
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBLoginAppSceneHoster hostedApp](self, "hostedApp");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v8, "newSceneIdentityForApplication:", v9);

    v11 = (void *)MEMORY[0x1E0D231F0];
    v36 = v10;
    objc_msgSend(v10, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identityForIdentifier:workspaceIdentifier:", v12, CFSTR("LoginWorkspace"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_alloc(MEMORY[0x1E0D228E8]);
    objc_msgSend(MEMORY[0x1E0D87D80], "identityForEmbeddedApplicationIdentifier:", CFSTR("com.apple.LoginUI"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (FBApplicationUpdateScenesTransaction *)objc_msgSend(v14, "initWithProcessIdentity:executionContextProvider:", v15, &__block_literal_global_2);
    sceneCreateTransaction = self->_sceneCreateTransaction;
    self->_sceneCreateTransaction = v16;

    v18 = self->_sceneCreateTransaction;
    v19 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_2;
    v39[3] = &unk_1E8E9E158;
    objc_copyWeak(&v42, location);
    v20 = v13;
    v40 = v20;
    v41 = v7;
    -[FBApplicationUpdateScenesTransaction setCompletionBlock:](v18, "setCompletionBlock:", v39);
    v35 = v8;
    -[SBLoginAppSceneHoster hostedApp](self, "hostedApp");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D228F8], "mainIdentity");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationSceneHandleRequest defaultRequestForApplication:sceneIdentity:displayIdentity:](SBApplicationSceneHandleRequest, "defaultRequestForApplication:sceneIdentity:displayIdentity:", v21, v20, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = [SBDeviceApplicationSceneHandle alloc];
    objc_msgSend(v23, "application");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "sceneDefinition");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "displayIdentity");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = -[SBApplicationSceneHandle _initWithApplication:sceneDefinition:displayIdentity:](v24, "_initWithApplication:sceneDefinition:displayIdentity:", v25, v26, v27);
    sceneHandle = self->_sceneHandle;
    self->_sceneHandle = v28;

    v30 = (void *)MEMORY[0x1E0D23148];
    objc_msgSend(MEMORY[0x1E0DAC510], "specification");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "parametersForSpecification:", v31);
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    v38[0] = v19;
    v38[1] = 3221225472;
    v38[2] = __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_4;
    v38[3] = &unk_1E8E9E180;
    v38[4] = self;
    v38[5] = a3;
    objc_msgSend(v32, "updateSettingsWithBlock:", v38);
    v37[0] = v19;
    v37[1] = 3221225472;
    v37[2] = __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_5;
    v37[3] = &unk_1E8E9E1A8;
    v37[4] = self;
    v37[5] = a3;
    objc_msgSend(v32, "updateClientSettingsWithBlock:", v37);
    -[FBApplicationUpdateScenesTransaction updateSceneWithIdentity:parameters:transitionContext:](self->_sceneCreateTransaction, "updateSceneWithIdentity:parameters:transitionContext:", v20, v32, 0);
    -[FBApplicationUpdateScenesTransaction begin](self->_sceneCreateTransaction, "begin");
    v33 = -[SBDeviceApplicationSceneHandle wallpaperStyle](self->_sceneHandle, "wallpaperStyle");
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setWallpaperStyle:forPriority:forVariant:withAnimationFactory:", v33, 1, 1, 0);
    objc_msgSend(v34, "setWallpaperStyle:forPriority:forVariant:withAnimationFactory:", v33, 1, 0, 0);

    objc_destroyWeak(&v42);
    objc_destroyWeak(location);
  }

}

id __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke()
{
  id v0;

  v0 = objc_alloc_init(MEMORY[0x1E0D22918]);
  objc_msgSend(v0, "setLaunchIntent:", 4);
  return v0;
}

void __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_2(uint64_t a1, int a2)
{
  id *WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void (*v13)(void);
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id *v18;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 48));
  v18 = WeakRetained;
  if (a2)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sceneWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBLoginAppSceneHoster launchLoginAppWithInitialOrientation:completion:]_block_invoke_2");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInFunction:file:lineNumber:description:", v17, CFSTR("SBLoginAppSceneHoster.m"), 90, CFSTR("Must have a scene if the FBApplicationUpdateScenesTransaction was successful."));

    }
    objc_msgSend(v7, "addObserver:", v18);
    objc_msgSend(v7, "uiPresentationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "modifyDefaultPresentationContext:", &__block_literal_global_12);

    objc_storeStrong(v18 + 1, v7);
    objc_msgSend(v7, "uiPresentationManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "createPresenterWithIdentifier:", CFSTR("default"));
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v18[2];
    v18[2] = (id)v10;

    objc_msgSend(v18[2], "activate");
    objc_msgSend(v18, "_updateHIDEventDeferralsIfNecessary");
    v12 = *(_QWORD *)(a1 + 40);
    if (v12)
    {
      v13 = *(void (**)(void))(v12 + 16);
LABEL_10:
      v13();
    }
  }
  else
  {
    objc_msgSend(WeakRetained[3], "error");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("com.apple.SpringBoard.LoginAppSceneHoster"), 1, 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v14 = *(_QWORD *)(a1 + 40);
    if (v14)
    {
      v13 = *(void (**)(void))(v14 + 16);
      goto LABEL_10;
    }
  }

  v15 = v18[3];
  v18[3] = 0;

}

uint64_t __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAppearanceStyle:", 2);
}

void __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_4(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(v6, "ignoreOcclusionReasons");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", CFSTR("LoginAppContainer"));

  objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_referenceBounds");
  objc_msgSend(v6, "setFrame:");

  objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDisplayConfiguration:", v5);

  objc_msgSend(v6, "setInterfaceOrientation:", *(_QWORD *)(a1 + 40));
  objc_msgSend(v6, "setForeground:", 1);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "_populateSettingsWithDefaultStatusBarHeight:", v6);

}

void __73__SBLoginAppSceneHoster_launchLoginAppWithInitialOrientation_completion___block_invoke_5(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  objc_msgSend(v4, "setInterfaceOrientation:", v3);
  objc_msgSend(v4, "setBackgroundStyle:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "backgroundStyle"));
  objc_msgSend(v4, "setIdleTimerMode:", 1);

}

- (void)killLoginApp
{
  void *v3;
  void *v4;

  if (self->_scene)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBScene identifier](self->_scene, "identifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "destroyScene:withTransitionContext:", v4, 0);

  }
  -[SBLoginAppSceneHoster _updateHIDEventDeferralsIfNecessary](self, "_updateHIDEventDeferralsIfNecessary");
}

- (void)setDeferHIDEvents:(BOOL)a3
{
  if (self->_deferHIDEvents != a3)
  {
    self->_deferHIDEvents = a3;
    -[SBLoginAppSceneHoster _updateHIDEventDeferralsIfNecessary](self, "_updateHIDEventDeferralsIfNecessary");
  }
}

- (void)updateSettingsWithTransitionBlock:(id)a3
{
  -[FBScene updateSettingsWithTransitionBlock:](self->_scene, "updateSettingsWithTransitionBlock:", a3);
}

- (UIView)contentView
{
  return (UIView *)-[UIScenePresenter presentationView](self->_scenePresenter, "presentationView");
}

- (NSString)hostedAppBundleID
{
  return (NSString *)CFSTR("com.apple.LoginUI");
}

- (NSString)hostedSceneIdentifier
{
  return (NSString *)-[FBScene identifier](self->_scene, "identifier");
}

- (SBApplication)hostedApp
{
  void *v2;
  void *v3;

  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "applicationWithBundleIdentifier:", CFSTR("com.apple.LoginUI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBApplication *)v3;
}

- (id)_appClientSettingsDiffInspector
{
  SBSUILoginUISceneClientSettingsDiffInspector *appClientSettingsDiffInspector;
  SBSUILoginUISceneClientSettingsDiffInspector *v4;
  SBSUILoginUISceneClientSettingsDiffInspector *v5;
  uint64_t v6;
  SBSUILoginUISceneClientSettingsDiffInspector *v7;
  uint64_t v8;
  void *v9;
  SBSUILoginUISceneClientSettingsDiffInspector *v10;
  uint64_t v11;
  void *v12;
  SBSUILoginUISceneClientSettingsDiffInspector *v13;
  uint64_t v14;
  void *v15;
  SBSUILoginUISceneClientSettingsDiffInspector *v16;
  uint64_t v17;
  void *v18;
  SBSUILoginUISceneClientSettingsDiffInspector *v19;
  uint64_t v20;
  void *v21;
  _QWORD v23[5];
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];
  _QWORD v27[5];

  appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
  if (!appClientSettingsDiffInspector)
  {
    v4 = (SBSUILoginUISceneClientSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0DAC508]);
    v5 = self->_appClientSettingsDiffInspector;
    self->_appClientSettingsDiffInspector = v4;

    v6 = MEMORY[0x1E0C809B0];
    v7 = self->_appClientSettingsDiffInspector;
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_3;
    v27[3] = &unk_1E8E9E1F8;
    v27[4] = self;
    __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke(v8, v27);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUILoginUISceneClientSettingsDiffInspector observeBackgroundStyleWithBlock:](v7, "observeBackgroundStyleWithBlock:", v9);

    v10 = self->_appClientSettingsDiffInspector;
    v26[0] = v6;
    v26[1] = 3221225472;
    v26[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_5;
    v26[3] = &unk_1E8E9E1F8;
    v26[4] = self;
    __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke(v11, v26);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUILoginUISceneClientSettingsDiffInspector observeIdleTimerModeWithBlock:](v10, "observeIdleTimerModeWithBlock:", v12);

    v13 = self->_appClientSettingsDiffInspector;
    v25[0] = v6;
    v25[1] = 3221225472;
    v25[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_6;
    v25[3] = &unk_1E8E9E1F8;
    v25[4] = self;
    __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke(v14, v25);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUILoginUISceneClientSettingsDiffInspector observeStatusBarUserNameOverrideWithBlock:](v13, "observeStatusBarUserNameOverrideWithBlock:", v15);

    v16 = self->_appClientSettingsDiffInspector;
    v24[0] = v6;
    v24[1] = 3221225472;
    v24[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_7;
    v24[3] = &unk_1E8E9E1F8;
    v24[4] = self;
    __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke(v17, v24);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUILoginUISceneClientSettingsDiffInspector observeRotationModeWithBlock:](v16, "observeRotationModeWithBlock:", v18);

    v19 = self->_appClientSettingsDiffInspector;
    v23[0] = v6;
    v23[1] = 3221225472;
    v23[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_8;
    v23[3] = &unk_1E8E9E1F8;
    v23[4] = self;
    __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke(v20, v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUILoginUISceneClientSettingsDiffInspector observeWallpaperModeWithBlock:](v19, "observeWallpaperModeWithBlock:", v21);

    appClientSettingsDiffInspector = self->_appClientSettingsDiffInspector;
  }
  return appClientSettingsDiffInspector;
}

id __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  void *v4;
  _QWORD v6[4];
  id v7;

  v2 = a2;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_2;
  v6[3] = &unk_1E8E9E1D0;
  v7 = v2;
  v3 = v2;
  v4 = (void *)objc_msgSend(v6, "copy");

  return v4;
}

uint64_t __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_4;
  v4[3] = &unk_1E8E9DED8;
  v4[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0D01908], "animateWithFactory:actions:", 0, v4);
  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "wallpaperStyle");
  objc_msgSend(v2, "setWallpaperStyle:forPriority:forVariant:withAnimationFactory:", v3, 1, 1, 0);
  objc_msgSend(v2, "setWallpaperStyle:forPriority:forVariant:withAnimationFactory:", v3, 1, 0, 0);

}

uint64_t __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "_noteMainSceneBackgroundStyleChanged");
}

void __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatedClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sceneUpdatedIdleTimerMode:", objc_msgSend(v4, "idleTimerMode"));
}

void __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatedClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "statusBarUserNameOverride");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneUpdatedStatusBarUserName:", v5);

}

void __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_7(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatedClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sceneUpdatedRotationMode:", objc_msgSend(v4, "rotationMode"));
}

void __56__SBLoginAppSceneHoster__appClientSettingsDiffInspector__block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updatedClientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "sceneUpdatedWallpaperMode:", objc_msgSend(v4, "wallpaperMode"));
}

- (void)_updateHIDEventDeferralsIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  FBScene *scene;
  void *v11;
  BSInvalidatable *v12;
  BSInvalidatable *keyboardFocusRedirectAssertion;
  id v14;

  if (self->_deferHIDEvents != (self->_keyboardFocusRedirectAssertion != 0))
  {
    +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "keyboardFocusController");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    -[SBLoginAppSceneHoster hostedAppBundleID](self, "hostedAppBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "processesForBundleIdentifier:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "state");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "pid");

    }
    else
    {
      v9 = 0xFFFFFFFFLL;
    }
    if (self->_deferHIDEvents && (scene = self->_scene) != 0 && (v9 & 0x80000000) == 0)
    {
      -[FBScene identityToken](scene, "identityToken");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "redirectSpringBoardLockFocusForReason:toProcessidentifier:toSceneIdentityToken:", CFSTR("LoginWindow"), v9, v11);
      v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      keyboardFocusRedirectAssertion = self->_keyboardFocusRedirectAssertion;
      self->_keyboardFocusRedirectAssertion = v12;

    }
    else
    {
      -[BSInvalidatable invalidate](self->_keyboardFocusRedirectAssertion, "invalidate");
      v11 = self->_keyboardFocusRedirectAssertion;
      self->_keyboardFocusRedirectAssertion = 0;
    }

  }
}

- (void)scene:(id)a3 didUpdateClientSettingsWithDiff:(id)a4 oldClientSettings:(id)a5 transitionContext:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  SBLoginAppClientSettingObserverContext *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v8 = a4;
  v9 = a3;
  objc_msgSend(v9, "settings");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v11 = v21;
  else
    v11 = 0;
  v12 = v11;

  objc_msgSend(v9, "clientSettings");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_self();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v15 = v13;
  else
    v15 = 0;
  v16 = v15;

  v17 = objc_alloc_init(SBLoginAppClientSettingObserverContext);
  -[SBLoginAppClientSettingObserverContext setSettings:](v17, "setSettings:", v12);

  -[SBLoginAppClientSettingObserverContext setUpdatedClientSettings:](v17, "setUpdatedClientSettings:", v16);
  if (!self->_appClientSettingsDiffInspector && v16)
  {
    -[SBLoginAppSceneHoster delegate](self, "delegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sceneUpdatedIdleTimerMode:", objc_msgSend(v16, "idleTimerMode"));
    objc_msgSend(v16, "statusBarUserNameOverride");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sceneUpdatedStatusBarUserName:", v19);

    objc_msgSend(v18, "sceneUpdatedRotationMode:", objc_msgSend(v16, "rotationMode"));
    objc_msgSend(v18, "sceneUpdatedWallpaperMode:", objc_msgSend(v16, "wallpaperMode"));

  }
  -[SBLoginAppSceneHoster _appClientSettingsDiffInspector](self, "_appClientSettingsDiffInspector");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "inspectDiff:withContext:", v8, v17);

}

- (void)sceneDidInvalidate:(id)a3
{
  UIScenePresenter *scenePresenter;
  FBScene *scene;
  void *v6;
  id v7;

  -[UIScenePresenter invalidate](self->_scenePresenter, "invalidate", a3);
  scenePresenter = self->_scenePresenter;
  self->_scenePresenter = 0;

  scene = self->_scene;
  self->_scene = 0;

  +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeWallpaperStyleForPriority:forVariant:withAnimationFactory:", 1, 1, 0);
  objc_msgSend(v7, "removeWallpaperStyleForPriority:forVariant:withAnimationFactory:", 1, 0, 0);
  -[SBLoginAppSceneHoster delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneInvalidated");

}

- (BOOL)deferHIDEvents
{
  return self->_deferHIDEvents;
}

- (SBLoginAppSceneHosterDelegate)delegate
{
  return (SBLoginAppSceneHosterDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_keyboardFocusRedirectAssertion, 0);
  objc_storeStrong((id *)&self->_sceneHandle, 0);
  objc_storeStrong((id *)&self->_appClientSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_sceneCreateTransaction, 0);
  objc_storeStrong((id *)&self->_scenePresenter, 0);
  objc_storeStrong((id *)&self->_scene, 0);
}

@end
