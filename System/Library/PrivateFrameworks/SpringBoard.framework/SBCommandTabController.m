@implementation SBCommandTabController

+ (SBCommandTabController)sharedInstance
{
  if (sharedInstance___once_1 != -1)
    dispatch_once(&sharedInstance___once_1, &__block_literal_global_115);
  return (SBCommandTabController *)(id)__controllerInstance_2;
}

uint64_t __40__SBCommandTabController_sharedInstance__block_invoke()
{
  void *v0;
  uint64_t v1;
  SBCommandTabController *v2;
  void *v3;

  kdebug_trace();
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      return kdebug_trace();
    goto LABEL_5;
  }
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "userInterfaceIdiom");

  if (v1 == 1)
  {
LABEL_5:
    v2 = objc_alloc_init(SBCommandTabController);
    v3 = (void *)__controllerInstance_2;
    __controllerInstance_2 = (uint64_t)v2;

  }
  return kdebug_trace();
}

+ (id)sharedInstanceIfExists
{
  return (id)__controllerInstance_2;
}

+ (id)keyCommands
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  if (__sb__runningInSpringBoard())
  {
    if (SBFEffectiveDeviceClass() != 2)
      return 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "userInterfaceIdiom");

    if (v4 != 1)
      return 0;
  }
  objc_msgSend(MEMORY[0x1E0DAAED8], "systemKeyCommandOverlayEnvironment");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CEA6B8];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("COMMAND_TAB_DISCOVERABILITY"), &stru_1E8EC7EC0, CFSTR("SpringBoard"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "commandWithTitle:image:action:input:modifierFlags:propertyList:", v8, 0, sel__handleCommandTab_, CFSTR("\t"), 0x100000, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "_setEventDeferringEnvironment:", v5);
  objc_msgSend(MEMORY[0x1E0CEA6B8], "commandWithTitle:image:action:input:modifierFlags:propertyList:", &stru_1E8EC7EC0, 0, sel__handleShiftCommandTab_, CFSTR("\t"), 1179648, &unk_1E91D09B0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_setEventDeferringEnvironment:", v5);
  v12[0] = v9;
  v12[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (SBCommandTabController)init
{
  SBCommandTabController *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  UIApplicationSceneDeactivationAssertion *resignActiveAssertion;
  uint64_t v7;
  OS_dispatch_queue *recentDisplayItemsPersistenceQueue;
  void *v9;
  void *v10;
  uint64_t v11;
  SBRecentDisplayItemsDefaults *defaults;
  SBRecentDisplayItemsDataStore *v13;
  SBRecentDisplayItemsDataStore *dataStore;
  void *v15;
  SBRecentDisplayItemsController *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SBRecentDisplayItemsController *recentDisplayItemsController;
  SBRecentDisplayItemsController *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  PTToggleTestRecipe *testRecipe;
  uint64_t v27;
  uint64_t v28;
  void (*v29)(uint64_t, int);
  void *v30;
  id v31;
  id location;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SBCommandTabController;
  v2 = -[SBCommandTabController init](&v33, sel_init);
  if (v2)
  {
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sceneDeactivationManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "newAssertionWithReason:", 3);
    resignActiveAssertion = v2->_resignActiveAssertion;
    v2->_resignActiveAssertion = (UIApplicationSceneDeactivationAssertion *)v5;

    v7 = BSDispatchQueueCreateWithQualityOfService();
    recentDisplayItemsPersistenceQueue = v2->_recentDisplayItemsPersistenceQueue;
    v2->_recentDisplayItemsPersistenceQueue = (OS_dispatch_queue *)v7;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v2, sel__sceneDidDisconnect_, *MEMORY[0x1E0CEBB48], 0);

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "recentDisplayItemsDefaults");
    v11 = objc_claimAutoreleasedReturnValue();
    defaults = v2->_defaults;
    v2->_defaults = (SBRecentDisplayItemsDefaults *)v11;

    v13 = objc_alloc_init(SBRecentDisplayItemsDataStore);
    dataStore = v2->_dataStore;
    v2->_dataStore = v13;

    -[SBRecentDisplayItemsDataStore setPersistenceDelegate:](v2->_dataStore, "setPersistenceDelegate:", v2);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v2, sel__effectiveSettingsChangedNotification_, *MEMORY[0x1E0D46EC8], 0);

    v16 = [SBRecentDisplayItemsController alloc];
    +[SBAppInteractionEventSourceManager sharedInstance](SBAppInteractionEventSourceManager, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = -[SBRecentDisplayItemsController initWithRemovalPersonality:movePersonality:transitionFromSources:maxDisplayItems:eventSource:applicationController:](v16, "initWithRemovalPersonality:movePersonality:transitionFromSources:maxDisplayItems:eventSource:applicationController:", 7, 15, 0, 10, v17, v18);
    recentDisplayItemsController = v2->_recentDisplayItemsController;
    v2->_recentDisplayItemsController = (SBRecentDisplayItemsController *)v19;

    v21 = v2->_recentDisplayItemsController;
    -[SBRecentDisplayItemsDataStore displayItems](v2->_dataStore, "displayItems");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRecentDisplayItemsController setRecentDisplayItems:](v21, "setRecentDisplayItems:", v22);

    -[SBRecentDisplayItemsController setDelegate:](v2->_recentDisplayItemsController, "setDelegate:", v2);
    objc_initWeak(&location, v2);
    v23 = (void *)MEMORY[0x1E0D83110];
    v27 = MEMORY[0x1E0C809B0];
    v28 = 3221225472;
    v29 = __30__SBCommandTabController_init__block_invoke;
    v30 = &unk_1E8EA1F50;
    objc_copyWeak(&v31, &location);
    objc_msgSend(v23, "recipeWithTitle:prepareBlock:toggleAction:cleanupBlock:", CFSTR("Show Command Tab"), 0, &v27, 0);
    v24 = objc_claimAutoreleasedReturnValue();
    testRecipe = v2->_testRecipe;
    v2->_testRecipe = (PTToggleTestRecipe *)v24;

    +[PTDomain registerTestRecipe:](SBAppSwitcherDomain, "registerTestRecipe:", v2->_testRecipe, v27, v28, v29, v30);
    objc_destroyWeak(&v31);
    objc_destroyWeak(&location);
  }
  return v2;
}

void __30__SBCommandTabController_init__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (a2)
  {
    if (objc_msgSend(WeakRetained, "isVisible"))
      objc_msgSend(v4, "next");
    else
      objc_msgSend(v4, "activateWithKeyCommand:", 0);
  }
  else
  {
    objc_msgSend(WeakRetained, "dismiss");
  }

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[UIApplicationSceneDeactivationAssertion relinquish](self->_resignActiveAssertion, "relinquish");
  v4.receiver = self;
  v4.super_class = (Class)SBCommandTabController;
  -[SBCommandTabController dealloc](&v4, sel_dealloc);
}

- (void)activateWithKeyCommand:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  SBCommandTabController *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "policyAggregator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  v7 = objc_msgSend(v6, "allowsCapability:explanation:", 19, &v24);
  v8 = v24;

  if (v7)
  {
    +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dismissAssistantViewInEverySceneIfNecessary");

    +[SBVoiceControlController sharedInstance](SBVoiceControlController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissTransientOverlay");

    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "recentAppLayouts");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "count"))
    {
      -[SBRecentDisplayItemsController recentDisplayItems](self->_recentDisplayItemsController, "recentDisplayItems");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = +[SBCommandTabViewController canActivateWithRecentDisplayItems:](SBCommandTabViewController, "canActivateWithRecentDisplayItems:", v13);

      if (v14)
      {
        if ((objc_msgSend(v4, "modifierFlags") & 0x20000) != 0)
        {
          v15 = self;
          v16 = 0;
        }
        else
        {
          v15 = self;
          v16 = 1;
        }
        -[SBCommandTabController _activateWithForwardDirection:](v15, "_activateWithForwardDirection:", v16);
        goto LABEL_16;
      }
    }
    else
    {

    }
    SBLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "recentAppLayouts");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "count");
      -[SBRecentDisplayItemsController recentDisplayItems](self->_recentDisplayItemsController, "recentDisplayItems");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "count");
      *(_DWORD *)buf = 134218240;
      v26 = v21;
      v27 = 2048;
      v28 = v23;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "Can't activate command-tab (numRecentAppLayouts: %lu, numRecentDisplayItems: %lu)", buf, 0x16u);

    }
  }
  else if (v8)
  {
    SBLogCommon();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v26 = (uint64_t)v8;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "Can't activate command-tab: %{public}@", buf, 0xCu);
    }

  }
LABEL_16:

}

- (void)dismiss
{
  NSObject *v3;
  uint8_t v4[16];

  if (self->_timer)
  {
    SBLogCommon();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "cancelling command-tab present timer for view dismissal", v4, 2u);
    }

    -[SBCommandTabController _clearTimer](self, "_clearTimer");
  }
  -[SBCommandTabController _showWindow:](self, "_showWindow:", 0);
}

- (BOOL)isVisible
{
  SBWindow *window;

  window = self->_window;
  if (window)
    LOBYTE(window) = -[SBWindow isHidden](window, "isHidden") ^ 1;
  return (char)window;
}

- (void)next
{
  -[SBCommandTabViewController next](self->_commandTabViewController, "next");
}

- (void)previous
{
  -[SBCommandTabViewController previous](self->_commandTabViewController, "previous");
}

- (void)launchCurrentSelectedApplication
{
  SBCommandTabViewController *commandTabViewController;
  id v4;

  commandTabViewController = self->_commandTabViewController;
  -[SBCommandTabViewController selectedApplicationDisplayItem](commandTabViewController, "selectedApplicationDisplayItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBCommandTabController viewController:selectedApplicationWithDisplayItem:](self, "viewController:selectedApplicationWithDisplayItem:", commandTabViewController, v4);

}

- (void)removeCurrentSelectedApplication
{
  id v3;

  -[SBCommandTabViewController selectedApplicationDisplayItem](self->_commandTabViewController, "selectedApplicationDisplayItem");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") != 1)
    -[SBRecentDisplayItemsController removeDisplayItem:](self->_recentDisplayItemsController, "removeDisplayItem:", v3);

}

- (void)viewController:(id)a3 selectedApplicationWithDisplayItem:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  SBDeviceApplicationSceneEntity *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  SBDeviceApplicationSceneEntity *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL8 v26;
  SBDeviceApplicationSceneEntity *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  int v32;
  BOOL v33;
  SBAppClipPlaceholderWorkspaceEntity *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  _QWORD v46[4];
  id v47;
  SBCommandTabController *v48;
  _QWORD v49[4];
  SBDeviceApplicationSceneEntity *v50;
  id v51;
  id v52;
  id v53;
  uint64_t v54;
  _QWORD v55[4];
  id v56;
  uint8_t buf[16];

  v6 = a4;
  objc_msgSend(a3, "_sbWindowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "sceneManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "keyboardFocusController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "userFocusRequestGeneration");
    -[SBCommandTabController _emitAnalyticsEventForDisplayItem:](self, "_emitAnalyticsEventForDisplayItem:", v6);
    objc_msgSend(v11, "bufferEventsForSpringBoardScene:reason:", v8, CFSTR("SBCommandTabController"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      -[SBCommandTabController dismiss](self, "dismiss");
    v45 = v12;
    if (objc_msgSend(v6, "type") == 1)
    {
      -[SBCommandTabController dismiss](self, "dismiss");
      +[SBWorkspaceEntity entity](SBHomeScreenEntity, "entity");
      v14 = (SBDeviceApplicationSceneEntity *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      if (-[SBApplicationSceneEntity isApplicationSceneEntity](v14, "isApplicationSceneEntity"))
      {
        -[SBApplicationSceneEntity application](v14, "application");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "bundleIdentifier");
        v36 = (void *)objc_claimAutoreleasedReturnValue();

      }
      -[SBWorkspaceEntity setFlag:forActivationSetting:](v14, "setFlag:forActivationSetting:", 1, 48);
      v37 = MEMORY[0x1E0C809B0];
      v55[0] = MEMORY[0x1E0C809B0];
      v55[1] = 3221225472;
      v55[2] = __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke;
      v55[3] = &unk_1E8E9DED8;
      v56 = v13;
      v38 = v13;
      v39 = (void *)MEMORY[0x1D17E5550](v55);
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v49[0] = v37;
      v49[1] = 3221225472;
      v49[2] = __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_2;
      v49[3] = &unk_1E8EAAD30;
      v50 = v14;
      v51 = v8;
      v53 = v39;
      v54 = v45;
      v52 = v6;
      v46[0] = v37;
      v46[1] = 3221225472;
      v46[2] = __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_64;
      v46[3] = &unk_1E8EAAC50;
      v47 = v52;
      v48 = self;
      v41 = v39;
      v15 = v14;
      objc_msgSend(v40, "requestTransitionWithOptions:builder:validator:", 0, v49, v46);

      goto LABEL_21;
    }
    if (objc_msgSend(v6, "type") == 5)
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "webApplication");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = [SBDeviceApplicationSceneEntity alloc];
      objc_msgSend(v6, "uniqueIdentifier");
      v43 = v13;
      v19 = v11;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "displayIdentity");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](v18, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v17, v20, v9, v21);

      v11 = v19;
      v13 = v43;

      goto LABEL_18;
    }
    v44 = v9;
    objc_msgSend(v6, "bundleIdentifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "applicationWithBundleIdentifier:", v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v24, "bundleIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = +[SBAppClipPlaceholderWorkspaceEntity isAppClipUpdateAvailableForBundleIdentifier:](SBAppClipPlaceholderWorkspaceEntity, "isAppClipUpdateAvailableForBundleIdentifier:", v25);

    if (!v24 || v26)
    {
      +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "placeholderForDisplayID:", v22);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = v22;
      v32 = objc_msgSend(v31, "isAppClip") | v26;

      v33 = v32 == 1;
      v22 = v42;
      if (!v33)
      {
        v14 = 0;
LABEL_17:

        v9 = v44;
        goto LABEL_18;
      }
      v34 = [SBAppClipPlaceholderWorkspaceEntity alloc];
      objc_msgSend(v6, "uniqueIdentifier");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[SBAppClipPlaceholderWorkspaceEntity initWithBundleIdentifier:futureSceneIdentifier:needsUpdate:](v34, "initWithBundleIdentifier:futureSceneIdentifier:needsUpdate:", v42, v28, v26);
    }
    else
    {
      v27 = [SBDeviceApplicationSceneEntity alloc];
      objc_msgSend(v44, "displayIdentity");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = -[SBDeviceApplicationSceneEntity initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:](v27, "initWithApplication:uniqueIdentifier:sceneHandleProvider:displayIdentity:", v24, 0, v44, v28);
    }
    v14 = (SBDeviceApplicationSceneEntity *)v29;

    goto LABEL_17;
  }
  SBLogCommon();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "rejecting command-tab view controller request to launch app as it isn't associated with a window scene", buf, 2u);
  }
LABEL_21:

}

uint64_t __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  id v15;
  id v16;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 16);
  objc_msgSend(v3, "setEventLabel:", CFSTR("ActivateAppCommandTab"));
  v4 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_3;
  v13[3] = &unk_1E8EAACE0;
  v14 = *(id *)(a1 + 32);
  v15 = *(id *)(a1 + 40);
  v16 = *(id *)(a1 + 48);
  objc_msgSend(v3, "modifyApplicationContext:", v13);
  v9[0] = v4;
  v9[1] = 3221225472;
  v9[2] = __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_4;
  v9[3] = &unk_1E8EAAD08;
  v5 = *(id *)(a1 + 32);
  v7 = *(void **)(a1 + 56);
  v6 = *(_QWORD *)(a1 + 64);
  v10 = v5;
  v12 = v6;
  v11 = v7;
  v8 = (id)objc_msgSend(v3, "addCompletionHandler:", v9);

}

void __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "setActivatingEntity:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "switcherController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switcherControllerForDisplayItem:", *(_QWORD *)(a1 + 48));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_currentMainAppLayout");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsItem:", *(_QWORD *)(a1 + 48)))
    objc_msgSend(*(id *)(a1 + 32), "setFlag:forActivationSetting:", 1, 11);

}

void __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_4(uint64_t a1, int a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  uint8_t v10[8];
  _QWORD v11[4];
  id v12;

  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "applicationSceneEntity");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "sceneHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sceneIfExists");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "keyboardFocusController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = *(_QWORD *)(a1 + 48);
      if (v8 == objc_msgSend(v7, "userFocusRequestGeneration"))
      {
        v11[0] = MEMORY[0x1E0C809B0];
        v11[1] = 3221225472;
        v11[2] = __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_5;
        v11[3] = &unk_1E8E9F1C0;
        v12 = *(id *)(a1 + 40);
        objc_msgSend(v7, "userFocusRequestForScene:reason:completion:", v5, CFSTR("commandTab"), v11);

      }
      else
      {
        SBLogKeyboardFocus();
        v9 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)v10 = 0;
          _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "CommandTab: not invoking userFocusRequestForScene: -- someone else requested a focus change since transition began", v10, 2u);
        }

        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }

    }
    else
    {
      (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    }

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_5(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __76__SBCommandTabController_viewController_selectedApplicationWithDisplayItem___block_invoke_64(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a2;
  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "switcherControllerForDisplayItem:", *(_QWORD *)(a1 + 32));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (!v6)
    v6 = *(void **)(*(_QWORD *)(a1 + 40) + 104);
  objc_msgSend(v6, "_fbsDisplayConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDisplayConfiguration:", v8);

  return 1;
}

- (void)recentDisplayItemsControllerDidUpdateDisplayItems:(id)a3
{
  SBRecentDisplayItemsDataStore *dataStore;
  id v4;

  dataStore = self->_dataStore;
  -[SBRecentDisplayItemsController recentDisplayItems](self->_recentDisplayItemsController, "recentDisplayItems", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBRecentDisplayItemsDataStore setDisplayItems:](dataStore, "setDisplayItems:", v4);

}

- (void)recentDisplayItemsController:(id)a3 didRemoveItem:(id)a4
{
  -[SBCommandTabViewController removeDisplayItem:](self->_commandTabViewController, "removeDisplayItem:", a4);
}

- (BOOL)recentDisplayItemsController:(id)a3 shouldAddItem:(id)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  NSMutableSet *appsAllowedWhileHidden;
  void *v19;
  void *v21;
  void *v22;
  void *v23;

  v9 = a4;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "model");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "type") == 5)
    objc_msgSend(v9, "webClipIdentifier");
  else
    objc_msgSend(v9, "bundleIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "expectedIconForDisplayIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v11, "isIconVisible:", v13) & 1) == 0)
  {
    objc_msgSend(v13, "applicationBundleID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "applicationBundleID");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "applicationWithBundleIdentifier:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "info");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v6, "isAppClip") & 1) != 0)
      {
        v14 = 1;
LABEL_15:

        goto LABEL_16;
      }
      +[SBApplicationPlaceholderController sharedInstance](SBApplicationPlaceholderController, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "applicationBundleID");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v17;
      objc_msgSend(v17, "placeholderForDisplayID:");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v7, "isAppClip") & 1) != 0)
      {
        v14 = 1;
LABEL_14:

        goto LABEL_15;
      }
      v21 = v16;
    }
    appsAllowedWhileHidden = self->_appsAllowedWhileHidden;
    objc_msgSend(v9, "bundleIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[NSMutableSet containsObject:](appsAllowedWhileHidden, "containsObject:", v19);

    v16 = v21;
    if (!v15)
    {
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_14;
  }
  v14 = 1;
LABEL_17:

  return v14;
}

- (id)persistedDisplayItemsForDataStore:(id)a3
{
  SBRecentDisplayItemsDataStore *v4;
  id v5;
  NSOrderedSet *persistedRecentDisplayItems;
  NSObject *recentDisplayItemsPersistenceQueue;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  SBDisplayItem *v13;
  SBDisplayItem *v14;
  NSObject *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD block[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = (SBRecentDisplayItemsDataStore *)a3;
  if (self->_dataStore == v4)
  {
    persistedRecentDisplayItems = self->_persistedRecentDisplayItems;
    if (persistedRecentDisplayItems)
    {
      v5 = (id)-[NSOrderedSet mutableCopy](persistedRecentDisplayItems, "mutableCopy");
    }
    else
    {
      v23 = 0;
      v24 = &v23;
      v25 = 0x3032000000;
      v26 = __Block_byref_object_copy__36;
      v27 = __Block_byref_object_dispose__36;
      v28 = 0;
      recentDisplayItemsPersistenceQueue = self->_recentDisplayItemsPersistenceQueue;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __60__SBCommandTabController_persistedDisplayItemsForDataStore___block_invoke;
      block[3] = &unk_1E8E9DFA0;
      block[4] = self;
      block[5] = &v23;
      dispatch_sync(recentDisplayItemsPersistenceQueue, block);
      if (v24[5])
      {
        v5 = objc_alloc_init(MEMORY[0x1E0C99E10]);
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v8 = (id)v24[5];
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
        if (v9)
        {
          v10 = *(_QWORD *)v19;
          while (2)
          {
            for (i = 0; i != v9; ++i)
            {
              if (*(_QWORD *)v19 != v10)
                objc_enumerationMutation(v8);
              v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
              v13 = [SBDisplayItem alloc];
              v14 = -[SBDisplayItem initWithPlistRepresentation:](v13, "initWithPlistRepresentation:", v12, (_QWORD)v18);
              if (!v14)
              {

                SBLogCommon();
                v15 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
                  -[SBCommandTabController persistedDisplayItemsForDataStore:].cold.1(v12, v15);

                v5 = 0;
                goto LABEL_18;
              }
              objc_msgSend(v5, "addObject:", v14);

            }
            v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v29, 16);
            if (v9)
              continue;
            break;
          }
        }
LABEL_18:

      }
      else
      {
        v5 = 0;
      }
      _Block_object_dispose(&v23, 8);

    }
    +[SBDisplayItem homeScreenDisplayItem](SBDisplayItem, "homeScreenDisplayItem", (_QWORD)v18);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __60__SBCommandTabController_persistedDisplayItemsForDataStore___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 80), "commandTabPlistRepresentation");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)dataStore:(id)a3 persistDisplayItems:(id)a4
{
  id v6;
  void *v7;
  NSObject *recentDisplayItemsPersistenceQueue;
  id v9;
  _QWORD block[4];
  id v11;
  id v12;
  id location;

  v6 = a4;
  if (self->_dataStore == a3 && (-[NSOrderedSet isEqual:](self->_persistedRecentDisplayItems, "isEqual:", v6) & 1) == 0)
  {
    v7 = (void *)objc_msgSend(v6, "copy");
    objc_storeStrong((id *)&self->_persistedRecentDisplayItems, v7);
    objc_initWeak(&location, self->_defaults);
    recentDisplayItemsPersistenceQueue = self->_recentDisplayItemsPersistenceQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __56__SBCommandTabController_dataStore_persistDisplayItems___block_invoke;
    block[3] = &unk_1E8E9F280;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    v9 = v7;
    dispatch_async(recentDisplayItemsPersistenceQueue, block);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }

}

void __56__SBCommandTabController_dataStore_persistDisplayItems___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v4 = *(id *)(a1 + 32);
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "plistRepresentation", (_QWORD)v10);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  objc_msgSend(WeakRetained, "setCommandTabPlistRepresentation:", v3);
}

- (BOOL)dataStore:(id)a3 shouldRestorePersistedDisplayItem:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  char v14;

  v4 = a4;
  +[SBIconController sharedInstance](SBIconController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "type"))
  {
    v7 = objc_msgSend(v4, "type");

    v8 = v7 == 1;
  }
  else
  {
    objc_msgSend(v4, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v6, "expectedIconForDisplayIdentifier:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v6, "isIconVisible:", v10);
      +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "restrictionController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "isApplicationIdentifierRestricted:", v9);

      v8 = v11 & (v14 ^ 1);
    }
    else
    {
      v8 = 0;
    }

  }
  return v8;
}

- (void)_sceneDidDisconnect:(id)a3
{
  void *v4;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIWindow _sbWindowScene](self->_window, "_sbWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Dismissing command-tab because its scene has disconnected", v7, 2u);
    }

    -[SBCommandTabController dismiss](self, "dismiss");
  }
}

- (void)_effectiveSettingsChangedNotification:(id)a3
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBCommandTabController__effectiveSettingsChangedNotification___block_invoke;
  block[3] = &unk_1E8E9DED8;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __64__SBCommandTabController__effectiveSettingsChangedNotification___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isCommandTabAllowed");

  if ((v3 & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "dismiss");
}

- (void)_emitAnalyticsEventForDisplayItem:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[3];

  v13[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v12[0] = *MEMORY[0x1E0DABF40];
  +[SBDisplayItem homeScreenDisplayItem](SBDisplayItem, "homeScreenDisplayItem");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqual:", v5);
  if ((v6 & 1) != 0)
  {
    v7 = &unk_1E91D09C8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[SBCommandTabViewController indexOfDisplayItem:](self->_commandTabViewController, "indexOfDisplayItem:", v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v12[1] = *MEMORY[0x1E0DABF48];
  v13[0] = v7;
  v13[1] = &unk_1E91D09E0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v6 & 1) == 0)

  v9 = (void *)MEMORY[0x1E0DA9D78];
  v10 = v8;
  objc_msgSend(v9, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "emitEvent:withPayload:", 14, v10);

}

- (void)_activateWithForwardDirection:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  id v6;
  uint8_t buf[16];

  v3 = a3;
  if (!self->_window)
    -[SBCommandTabController _showWindow:](self, "_showWindow:", 1);
  if (self->_timer)
    -[SBCommandTabController _clearTimer](self, "_clearTimer");
  if (self->_window)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__showCommandTabBarAfterTimer_, 0, 0, 0.1);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_timer, v6);
    if (v3)
    {
      if ((SBWorkspaceSpringBoardIsActive() & 1) == 0)
        -[SBCommandTabViewController next](self->_commandTabViewController, "next");
    }
    else
    {
      -[SBCommandTabViewController previous](self->_commandTabViewController, "previous");
    }

  }
  else
  {
    SBLogCommon();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Failed to create command-tab window while attempting to activate", buf, 2u);
    }

  }
}

- (void)_showCommandTabBarAfterTimer:(id)a3
{
  -[SBCommandTabController _clearTimer](self, "_clearTimer", a3);
  -[SBCommandTabViewController showCommandTabBar](self->_commandTabViewController, "showCommandTabBar");
}

- (void)_showWindow:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  SBWindow *window;
  NSObject *v10;
  int v11;
  BSInvalidatable *v12;
  SBCommandTabViewController *v13;
  SBWindow *v14;
  BSInvalidatable *v15;
  UIApplicationSceneDeactivationAssertion *resignActiveAssertion;
  void *v17;
  BSInvalidatable *v18;
  BSInvalidatable *deferOrientationUpdatesAssertion;
  SBCommandTabWindow *v20;
  SBWindow *v21;
  SBCommandTabViewController *v22;
  void *v23;
  SBCommandTabViewController *v24;
  SBCommandTabViewController *commandTabViewController;
  void *v26;
  void *v27;
  BSInvalidatable *v28;
  BSInvalidatable *keyboardFocusAssertion;
  _DWORD v30[2];
  uint64_t v31;

  v3 = a3;
  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)SBApp, "windowSceneManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activeDisplayWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "switcherController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isChamoisWindowingUIEnabled");

  window = self->_window;
  if (v3)
  {
    if (window)
    {
      SBLogCommon();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v11 = -[SBWindow isHidden](self->_window, "isHidden");
        v30[0] = 67109120;
        v30[1] = v11;
        _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Not creating command-tab window because one already exists, isHidden: %d", (uint8_t *)v30, 8u);
      }
    }
    else
    {
      if ((v8 & 1) == 0)
      {
        resignActiveAssertion = self->_resignActiveAssertion;
        objc_msgSend(v6, "_fbsDisplayIdentity");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIApplicationSceneDeactivationAssertion sb_acquireForDisplayIdentity:](resignActiveAssertion, "sb_acquireForDisplayIdentity:", v17);

      }
      objc_msgSend((id)SBApp, "deviceOrientationUpdateDeferralAssertionWithReason:", CFSTR("CommandTab"));
      v18 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
      self->_deferOrientationUpdatesAssertion = v18;

      v20 = -[SBWindow initWithWindowScene:role:debugName:]([SBCommandTabWindow alloc], "initWithWindowScene:role:debugName:", v6, CFSTR("SBTraitsParticipantRoleCommandTab"), CFSTR("Command Tab Window"));
      v21 = self->_window;
      self->_window = &v20->super;

      v22 = [SBCommandTabViewController alloc];
      -[SBRecentDisplayItemsController recentDisplayItems](self->_recentDisplayItemsController, "recentDisplayItems");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = -[SBCommandTabViewController initWithRecentDisplayItems:](v22, "initWithRecentDisplayItems:", v23);
      commandTabViewController = self->_commandTabViewController;
      self->_commandTabViewController = v24;

      -[SBCommandTabViewController setDelegate:](self->_commandTabViewController, "setDelegate:", self);
      -[SBWindow setRootViewController:](self->_window, "setRootViewController:", self->_commandTabViewController);
      -[SBWindow setWindowLevel:](self->_window, "setWindowLevel:", *MEMORY[0x1E0CEBBD0] + 45.0);
      if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleCommandTab")) & 1) == 0)
        -[SBWindow _legacySetRotatableViewOrientation:updateStatusBar:duration:force:](self->_window, "_legacySetRotatableViewOrientation:updateStatusBar:duration:force:", objc_msgSend((id)SBApp, "activeInterfaceOrientation"), 0, 0, 0.0);
      -[SBWindow setHidden:](self->_window, "setHidden:", 0);
      -[SBFWindow makeKeyWindow](self->_window, "makeKeyWindow");
      -[SBCommandTabViewController becomeFirstResponder](self->_commandTabViewController, "becomeFirstResponder");
      +[SBMainWorkspace sharedInstance](SBMainWorkspace, "sharedInstance");
      v10 = objc_claimAutoreleasedReturnValue();
      -[NSObject keyboardFocusController](v10, "keyboardFocusController");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBKeyboardFocusLockReason commandTab](SBKeyboardFocusLockReason, "commandTab");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "focusLockSpringBoardWindowScene:forReason:", v6, v27);
      v28 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      keyboardFocusAssertion = self->_keyboardFocusAssertion;
      self->_keyboardFocusAssertion = v28;

    }
  }
  else if (window)
  {
    if ((v8 & 1) == 0)
      -[UIApplicationSceneDeactivationAssertion relinquish](self->_resignActiveAssertion, "relinquish");
    -[BSInvalidatable invalidate](self->_deferOrientationUpdatesAssertion, "invalidate");
    v12 = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = 0;

    -[SBCommandTabViewController resignFirstResponder](self->_commandTabViewController, "resignFirstResponder");
    v13 = self->_commandTabViewController;
    self->_commandTabViewController = 0;

    -[SBFWindow resignAsKeyWindow](self->_window, "resignAsKeyWindow");
    -[SBWindow setHidden:](self->_window, "setHidden:", 1);
    v14 = self->_window;
    self->_window = 0;

    -[BSInvalidatable invalidate](self->_keyboardFocusAssertion, "invalidate");
    v15 = self->_keyboardFocusAssertion;
    self->_keyboardFocusAssertion = 0;

  }
}

- (void)_clearTimer
{
  NSTimer *timer;

  -[NSTimer invalidate](self->_timer, "invalidate");
  timer = self->_timer;
  self->_timer = 0;

}

- (void)_allowAppToAppearWhileHidden:(id)a3
{
  id v4;
  NSMutableSet *appsAllowedWhileHidden;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  appsAllowedWhileHidden = self->_appsAllowedWhileHidden;
  v8 = v4;
  if (!appsAllowedWhileHidden)
  {
    v6 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    v7 = self->_appsAllowedWhileHidden;
    self->_appsAllowedWhileHidden = v6;

    v4 = v8;
    appsAllowedWhileHidden = self->_appsAllowedWhileHidden;
  }
  -[NSMutableSet addObject:](appsAllowedWhileHidden, "addObject:", v4);
  -[SBRecentDisplayItemsController _allowAppToAppearWhileHidden:](self->_recentDisplayItemsController, "_allowAppToAppearWhileHidden:", v8);

}

- (void)_disallowAppFromAppearingWhileHidden:(id)a3
{
  NSMutableSet *appsAllowedWhileHidden;
  id v5;

  v5 = a3;
  -[NSMutableSet removeObject:](self->_appsAllowedWhileHidden, "removeObject:");
  if (!-[NSMutableSet count](self->_appsAllowedWhileHidden, "count"))
  {
    appsAllowedWhileHidden = self->_appsAllowedWhileHidden;
    self->_appsAllowedWhileHidden = 0;

  }
  -[SBRecentDisplayItemsController _disallowAppFromAppearingWhileHidden:](self->_recentDisplayItemsController, "_disallowAppFromAppearingWhileHidden:", v5);

}

- (SBWindow)window
{
  return self->_window;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_testRecipe, 0);
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_storeStrong((id *)&self->_recentDisplayItemsPersistenceQueue, 0);
  objc_storeStrong((id *)&self->_appsAllowedWhileHidden, 0);
  objc_storeStrong((id *)&self->_persistedRecentDisplayItems, 0);
  objc_storeStrong((id *)&self->_recentDisplayItemsController, 0);
  objc_storeStrong((id *)&self->_keyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_commandTabViewController, 0);
}

- (void)persistedDisplayItemsForDataStore:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "failed to create display item from cmdtab plist rep -- aborting loading of items. failed plist rep: %@", (uint8_t *)&v2, 0xCu);
}

@end
