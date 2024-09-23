@implementation SBDashBoardApplicationLauncher

- (SBDashBoardApplicationLauncher)init
{
  SBDashBoardApplicationLauncher *v2;
  id v3;
  objc_class *v4;
  void *v5;
  uint64_t v6;
  BSEventQueue *eventQueue;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBDashBoardApplicationLauncher;
  v2 = -[SBDashBoardApplicationLauncher init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D01770]);
    v4 = (objc_class *)objc_opt_class();
    NSStringFromClass(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "initWithName:onQueue:", v5, MEMORY[0x1E0C80D38]);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (BSEventQueue *)v6;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[CSCoverSheetViewController unregisterExternalEventHandler:](self->_coverSheetViewController, "unregisterExternalEventHandler:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBDashBoardApplicationLauncher;
  -[SBDashBoardApplicationLauncher dealloc](&v3, sel_dealloc);
}

- (void)setCoverSheetViewController:(id)a3
{
  CSCoverSheetViewController *v5;
  CSCoverSheetViewController *v6;

  v5 = (CSCoverSheetViewController *)a3;
  if (self->_coverSheetViewController != v5)
  {
    v6 = v5;
    -[CSCoverSheetViewController registerExternalEventHandler:](v5, "registerExternalEventHandler:", self);
    -[CSCoverSheetViewController unregisterExternalEventHandler:](self->_coverSheetViewController, "unregisterExternalEventHandler:", self);
    objc_storeStrong((id *)&self->_coverSheetViewController, a3);
    v5 = v6;
  }

}

- (BOOL)handleTransitionRequest:(id)a3
{
  id v4;
  _BOOL4 v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  SBDeviceApplicationSceneEntity *v12;
  void *v13;
  BOOL v14;
  NSObject *v15;
  uint64_t v16;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;

  v4 = a3;
  v22 = 0;
  v5 = -[SBDashBoardApplicationLauncher _canHandleTransitionRequest:outActivatingSceneEntity:](self, "_canHandleTransitionRequest:outActivatingSceneEntity:", v4, &v22);
  v6 = v22;
  v7 = v6;
  if (v5)
  {
    v8 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __58__SBDashBoardApplicationLauncher_handleTransitionRequest___block_invoke;
    v20[3] = &unk_1E8E9EE50;
    v9 = v6;
    v21 = v9;
    objc_msgSend(v4, "modifyApplicationContext:", v20);
    objc_msgSend(v4, "finalize");
    v10 = v9;
    objc_msgSend(v10, "application");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (+[SBSecureAppPolicy shouldAlwaysShowSecureSceneForApp:](SBSecureAppPolicy, "shouldAlwaysShowSecureSceneForApp:", v11))
    {
      v12 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainSecureDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainSecureDisplay:", v11);
      v13 = (void *)objc_msgSend(v10, "copyActivationSettings");
      -[SBWorkspaceEntity applyActivationSettings:](v12, "applyActivationSettings:", v13);

    }
    else
    {
      v12 = (SBDeviceApplicationSceneEntity *)v10;
    }
    SBLogDashBoard();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      -[SBDashBoardApplicationLauncher handleTransitionRequest:].cold.1(v12, v4, v15);

    v16 = objc_msgSend(v4, "source");
    v18[0] = v8;
    v18[1] = 3221225472;
    v18[2] = __58__SBDashBoardApplicationLauncher_handleTransitionRequest___block_invoke_7;
    v18[3] = &unk_1E8EA82B8;
    v19 = v4;
    v14 = -[SBDashBoardApplicationLauncher _presentApplicationSceneEntity:source:fromRequest:withResult:](self, "_presentApplicationSceneEntity:source:fromRequest:withResult:", v12, v16, v19, v18);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __58__SBDashBoardApplicationLauncher_handleTransitionRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  id v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "setFlag:forActivationSetting:", 1, 39);
  objc_msgSend(v4, "setEntity:forLayoutRole:", *(_QWORD *)(a1 + 32), 1);
  +[SBWorkspaceEntity entity](SBEmptyWorkspaceEntity, "entity");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEntity:forLayoutRole:", v5, 2);

}

void __58__SBDashBoardApplicationLauncher_handleTransitionRequest___block_invoke_7(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v9 = a3;
  objc_msgSend(*(id *)(a1 + 32), "applicationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "needsToSendActivationResult"))
  {
    FBSOpenApplicationErrorCreate();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendActivationResultError:", v6, v9);

  }
  objc_msgSend(*(id *)(a1 + 32), "completionBlock");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    (*(void (**)(uint64_t, BOOL))(v7 + 16))(v7, a2 == 0);

}

- (void)launchQuickNote
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  const char *v9;
  uint8_t *v10;
  void *v11;
  int v12;
  __int16 v13;
  __int16 v14;

  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("mobilenotes-quicknote://quicknote?launchedByPencil=1"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SBWorkspaceApplicationForURLWithError(v3, 0, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "info");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[CSCoverSheetViewController activeBehavior](self->_coverSheetViewController, "activeBehavior");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v5) = objc_msgSend(v7, "areRestrictedCapabilities:", 0x2000);

  if ((_DWORD)v5)
  {
    SBLogDashBoard();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 0;
      v9 = "QuickNote launch restricted";
      v10 = (uint8_t *)&v14;
LABEL_7:
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, v9, v10, 2u);
    }
  }
  else
  {
    objc_msgSend((id)SBApp, "privacyPreflightController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "requiresPreflightForApplication:", v6);

    if (!v12)
    {
      -[SBDashBoardApplicationLauncher _activateAppWithURL:](self, "_activateAppWithURL:", v3);
      goto LABEL_10;
    }
    SBLogDashBoard();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      v9 = "QuickNote launch restricted due to privacy";
      v10 = (uint8_t *)&v13;
      goto LABEL_7;
    }
  }

LABEL_10:
}

- (BOOL)launchCaptureApplication:(id)a3
{
  id v3;
  void *v4;
  char v5;

  v3 = a3;
  +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "launchCaptureApplication:source:", v3, 32);

  return v5;
}

- (void)prewarmCameraForIdentifier:(id)a3
{
  -[SBDashBoardApplicationLauncher prewarmCameraForIdentifier:prewarmReason:](self, "prewarmCameraForIdentifier:prewarmReason:", a3, 0);
}

- (void)prewarmCameraForIdentifier:(id)a3 prewarmReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *currentPrewarmIdentifiersToReasons;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBDashBoardApplicationLauncher prewarmConfigurationForIdentifier:](self, "prewarmConfigurationForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardApplicationLauncher _prewarmWithConfiguration:prewarmReason:](self, "_prewarmWithConfiguration:prewarmReason:", v8, v7);
  if (!self->_currentPrewarmIdentifiersToReasons)
  {
    v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    currentPrewarmIdentifiersToReasons = self->_currentPrewarmIdentifiersToReasons;
    self->_currentPrewarmIdentifiersToReasons = v9;

  }
  objc_msgSend(v6, "applicationBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](self->_currentPrewarmIdentifiersToReasons, "objectForKeyedSubscript:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    SBLogDashBoard();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v21 = v11;
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_INFO, "Identifier: %@ had existing reason: %@", buf, 0x16u);
    }

  }
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentPrewarmIdentifiersToReasons, "setObject:forKeyedSubscript:", v7, v11);
  -[NSMutableDictionary objectForKeyedSubscript:](self->_prewarmIdentifiersToCancelTimers, "objectForKeyedSubscript:", v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "invalidate");

  v15 = (void *)MEMORY[0x1E0C99E88];
  v18 = CFSTR("PrewarmIdentifier");
  v19 = v11;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__stopTrackingPrewarmReason_, v16, 0, 3.0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prewarmIdentifiersToCancelTimers, "setObject:forKeyedSubscript:", v17, v11);
}

- (void)_stopTrackingPrewarmReason:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("PrewarmIdentifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[NSMutableDictionary objectForKeyedSubscript:](self->_prewarmIdentifiersToCancelTimers, "objectForKeyedSubscript:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidate");

  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prewarmIdentifiersToCancelTimers, "setObject:forKeyedSubscript:", 0, v6);
  -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentPrewarmIdentifiersToReasons, "setObject:forKeyedSubscript:", 0, v6);

}

- (id)prewarmConfigurationForIdentifier:(id)a3
{
  SBDashBoardCaptureLaunchPolicy *captureLaunchPolicy;
  id v4;
  void *v5;
  void *v6;

  captureLaunchPolicy = self->_captureLaunchPolicy;
  v4 = a3;
  +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardCaptureLaunchPolicy prewarmingConfigurationForIdentifier:captureApplicationProvider:](captureLaunchPolicy, "prewarmingConfigurationForIdentifier:captureApplicationProvider:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)notePrewarmRequestWasUsefulForIdentifier:(id)a3
{
  self->_cameraPrewarmSucceeded = 1;
}

- (void)notePrewarmRequestEndedForIdentifier:(id)a3
{
  -[SBDashBoardApplicationLauncher notePrewarmRequestEndedForIdentifier:prewarmReason:](self, "notePrewarmRequestEndedForIdentifier:prewarmReason:", a3, 0);
}

- (void)notePrewarmRequestEndedForIdentifier:(id)a3 prewarmReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  int v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBDashBoardApplicationLauncher prewarmConfigurationForIdentifier:](self, "prewarmConfigurationForIdentifier:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "prewarmingBundleIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v6, "applicationBundleIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_currentPrewarmIdentifiersToReasons, "setObject:forKeyedSubscript:", 0, v10);
    -[NSMutableDictionary objectForKeyedSubscript:](self->_prewarmIdentifiersToCancelTimers, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "invalidate");

    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_prewarmIdentifiersToCancelTimers, "setObject:forKeyedSubscript:", 0, v10);
    SBLogDashBoard();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 138412290;
      v14 = v9;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Cooling camera for bundle identifier: %@", (uint8_t *)&v13, 0xCu);
    }

    -[SBDashBoardApplicationLauncher _coolCameraIfNecessaryForBundleIdentifier:prewarmReason:](self, "_coolCameraIfNecessaryForBundleIdentifier:prewarmReason:", v9, v7);
  }
  *(_WORD *)&self->_cameraIsPrewarming = 0;

}

- (id)currentActivePrewarmReasons
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[NSMutableDictionary allKeys](self->_currentPrewarmIdentifiersToReasons, "allKeys", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_currentPrewarmIdentifiersToReasons, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)_prewarmWithConfiguration:(id)a3 prewarmReason:(id)a4
{
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  int v10;
  void *v11;
  NSObject *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v17;
  _BYTE v18[10];
  __int16 v19;
  int v20;
  __int16 v21;
  void *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v6, "prewarmCameraHardware");
  v9 = objc_msgSend(v6, "prewarmForCaptureLaunch");
  v10 = objc_msgSend(v6, "backgroundLaunch");
  objc_msgSend(v6, "applicationBundleIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogDashBoard();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 67109890;
    *(_DWORD *)v18 = v8;
    *(_WORD *)&v18[4] = 1024;
    *(_DWORD *)&v18[6] = v10;
    v19 = 1024;
    v20 = v9;
    v21 = 2112;
    v22 = v11;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Prewarming camera hardware: %{BOOL}u, prewarming background launch target: %{BOOL}u, prewarming for capture launch: %{BOOL}u, application bundle identifier: %@", (uint8_t *)&v17, 0x1Eu);
  }

  objc_msgSend(v6, "prewarmingBundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    if (v8)
    {
      SBLogDashBoard();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        *(_QWORD *)v18 = v13;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "Prewarming camera for bundle identifier: %@", (uint8_t *)&v17, 0xCu);
      }

      -[SBDashBoardApplicationLauncher _prewarmCameraForBundleIdentifier:prewarmReason:](self, "_prewarmCameraForBundleIdentifier:prewarmReason:", v13, v7);
    }
    if (v10)
    {
      SBLogDashBoard();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        v17 = 138412290;
        *(_QWORD *)v18 = v13;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Background camera launch initiated for bundle identifier: %@", (uint8_t *)&v17, 0xCu);
      }

      -[SBDashBoardApplicationLauncher _backgroundLaunchWithBundleIdentifier:isCaptureApplicationLaunch:](self, "_backgroundLaunchWithBundleIdentifier:isCaptureApplicationLaunch:", v13, v9);
      *(_WORD *)&self->_cameraIsPrewarming = 1;
    }
  }
  else
  {
    SBLogDashBoard();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[SBDashBoardApplicationLauncher _prewarmWithConfiguration:prewarmReason:].cold.1((uint64_t)v11, v16);

  }
}

- (id)_captureExtensionBundleIdentifierForContainingApplication:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "captureApplicationForBundleIdentifier:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "extension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)coverSheetIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

- (int64_t)participantState
{
  if (self->_secureAppAction)
    return 2;
  else
    return 1;
}

- (BOOL)handleEvent:(id)a3
{
  id v4;
  SBInProcessSecureAppAction *secureAppAction;
  char v6;

  v4 = a3;
  if (objc_msgSend(v4, "type") == 25)
  {
    -[SBInProcessSecureAppAction invalidate](self->_secureAppAction, "invalidate");
    secureAppAction = self->_secureAppAction;
    self->_secureAppAction = 0;

    v6 = objc_msgSend(v4, "isConsumable");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)wouldHandleButtonEvent:(id)a3
{
  return 0;
}

- (id)captureApplicationForSceneEntity:(id)a3
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]())
    v4 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
  else
    v4 = 0;
  if ((LCSFeatureEnabled() & 1) != 0 || (v5 = 0, v4))
  {
    objc_msgSend(v3, "application");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "captureApplicationForBundleIdentifier:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (BOOL)_canHandleTransitionRequest:(id)a3 outActivatingSceneEntity:(id *)a4
{
  id v5;
  void *v6;
  int v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  int CanActivateWhilePasscodeLocked;
  int v17;

  v5 = a3;
  objc_msgSend(v5, "displayIdentity");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isMainDisplay");

  if (v7
    && ((v8 = objc_msgSend(v5, "source"), v8 <= 0x2F) && ((1 << v8) & 0x8001004C2134) != 0 || v8 == 70 || v8 == 67))
  {
    objc_msgSend(v5, "applicationContext");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v9, "isBackground") & 1) != 0
      || (objc_msgSend(v9, "entities"),
          v10 = (void *)objc_claimAutoreleasedReturnValue(),
          v11 = objc_msgSend(v10, "count"),
          v10,
          v11 > 1))
    {
      v12 = 0;
    }
    else
    {
      objc_msgSend(v9, "resolvedActivatingWorkspaceEntity");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "applicationSceneEntity");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v14, "BOOLForActivationSetting:", 37) & 1) != 0)
      {
        v12 = 0;
      }
      else
      {
        objc_msgSend(v14, "application");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        CanActivateWhilePasscodeLocked = SBWorkspaceApplicationCanActivateWhilePasscodeLocked(v15);

        v17 = objc_msgSend(v14, "BOOLForActivationSetting:", 36);
        v12 = 0;
        if (v14 && CanActivateWhilePasscodeLocked | v17)
        {
          if (a4)
            *a4 = objc_retainAutorelease(v14);
          v12 = 1;
        }
      }

    }
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (BOOL)_canPresentApplicationSceneEntity:(id)a3 fromSource:(id)a4 toDestination:(id)a5
{
  void *v5;
  char v6;

  if (!a5)
    return 1;
  objc_msgSend(a5, "placement", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqual:", SBDashBoardCapturePlacementCameraPage) & 1) != 0
    || (objc_msgSend(v5, "isEqual:", SBDashBoardCapturePlacementCameraOverlay) & 1) != 0
    || (objc_msgSend(v5, "isEqual:", SBDashBoardCapturePlacementCaptureButtonCameraPage) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    v6 = objc_msgSend(v5, "isEqual:", SBDashBoardCapturePlacementSecureApp);
  }

  return v6;
}

- (BOOL)_isCoverSheetHostingEntity:(id)a3
{
  id v4;
  void *v5;
  char v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  if (-[CSCoverSheetViewController isHostingAnApp](self->_coverSheetViewController, "isHostingAnApp"))
  {
    -[CSCoverSheetViewController hostedAppSceneHandles](self->_coverSheetViewController, "hostedAppSceneHandles");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __61__SBDashBoardApplicationLauncher__isCoverSheetHostingEntity___block_invoke;
    v8[3] = &unk_1E8E9F570;
    v9 = v4;
    v6 = objc_msgSend(v5, "bs_containsObjectPassingTest:", v8);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __61__SBDashBoardApplicationLauncher__isCoverSheetHostingEntity___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t v5;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "sceneHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqual:", v4);

  return v5;
}

- (BOOL)_presentApplicationSceneEntity:(id)a3 source:(int64_t)a4 fromRequest:(id)a5 withResult:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  BSEventQueue *eventQueue;
  id v28;
  BOOL v29;
  void *v30;
  _QWORD v31[5];
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  objc_msgSend(v10, "actions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  objc_msgSend(v10, "removeActions:", v14);
  SBDashBoardCaptureLaunchSourceFromWorkspaceTransitionSource(a4);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDashBoardCaptureLaunchPolicy resolveCameraDestinationLaunchOf:fromSource:](self->_captureLaunchPolicy, "resolveCameraDestinationLaunchOf:fromSource:", v10, v30);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = -[SBDashBoardApplicationLauncher _canPresentApplicationSceneEntity:fromSource:toDestination:](self, "_canPresentApplicationSceneEntity:fromSource:toDestination:", v10, v30, v15);
  eventQueue = self->_eventQueue;
  v16 = (void *)MEMORY[0x1E0D01778];
  v17 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(v10, "sceneHandle");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "sceneIdentifier");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringWithFormat:", CFSTR("CaptureLaunch-%@"), v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __95__SBDashBoardApplicationLauncher__presentApplicationSceneEntity_source_fromRequest_withResult___block_invoke;
  v31[3] = &unk_1E8EA8308;
  v31[4] = self;
  v32 = v15;
  v33 = v10;
  v34 = v11;
  v35 = v14;
  v36 = v12;
  v28 = v14;
  v21 = v11;
  v22 = v10;
  v23 = v15;
  v24 = v12;
  objc_msgSend(v16, "eventWithName:handler:", v20, v31);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSEventQueue executeOrInsertEvent:atPosition:](eventQueue, "executeOrInsertEvent:atPosition:", v25, 1);

  -[CSCoverSheetViewController dismissOverlaysAnimated:](self->_coverSheetViewController, "dismissOverlaysAnimated:", 1);
  return v29;
}

void __95__SBDashBoardApplicationLauncher__presentApplicationSceneEntity_source_fromRequest_withResult___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void (**v4)(_QWORD, _QWORD, _QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void (**v23)(_QWORD, _QWORD, _QWORD);
  _QWORD v24[4];
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "acquireLockForReason:", CFSTR("app launch"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __95__SBDashBoardApplicationLauncher__presentApplicationSceneEntity_source_fromRequest_withResult___block_invoke_2;
  v24[3] = &unk_1E8EA82E0;
  v3 = v2;
  v25 = v3;
  v26 = *(id *)(a1 + 72);
  v4 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1D17E5550](v24);
  v5 = *(void **)(a1 + 40);
  if (v5)
  {
    objc_msgSend(v5, "placement");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "entity");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "application");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "activeBehavior");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "areRestrictedCapabilities:", 4);

    +[SBCaptureApplicationCenter sharedInstance](SBCaptureApplicationCenter, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v11, "isApplicationLaunchNeededForApplicationBundleIdentifier:", v12);

    v14 = *(void **)(a1 + 32);
    if ((v13 & 1) != 0 || v10)
    {
      objc_msgSend(v14, "_attemptToUnlockToApplication:completion:", v8, v4);
    }
    else if (objc_msgSend(v14, "_isCoverSheetHostingEntity:", *(_QWORD *)(a1 + 48)))
    {
      SBLogDashBoard();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v7;
        v29 = 2114;
        v30 = v6;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "Not launching hostable entity %@ in placement %{public}@ because it's already hosted", buf, 0x16u);
      }

      v4[2](v4, 0, 0);
    }
    else
    {
      if (objc_msgSend(v6, "isEqual:", SBDashBoardCapturePlacementCameraPage))
      {
        v18 = *(void **)(a1 + 32);
        v19 = *(_QWORD *)(a1 + 56);
        v20 = *(_QWORD *)(a1 + 64);
        v23 = v4;
        v21 = v7;
        v22 = 0;
      }
      else
      {
        if (!objc_msgSend(v6, "isEqual:", SBDashBoardCapturePlacementCameraOverlay))
        {
          if (objc_msgSend(v6, "isEqual:", SBDashBoardCapturePlacementCaptureButtonCameraPage))
          {
            objc_msgSend(*(id *)(a1 + 32), "_activateCameraEntity:animated:asOverlay:viaSwitcherModal:request:actions:completion:", v7, 1, 0, 1, *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), v4);
          }
          else if (objc_msgSend(v6, "isEqual:", SBDashBoardCapturePlacementSecureApp))
          {
            objc_msgSend(*(id *)(a1 + 32), "_activateAppSceneBelowDashBoard:hostableEntity:secureAppType:withActions:interactive:completion:", *(_QWORD *)(a1 + 48), v7, 4, *(_QWORD *)(a1 + 64), 0, v4);
          }
          goto LABEL_17;
        }
        v18 = *(void **)(a1 + 32);
        v19 = *(_QWORD *)(a1 + 56);
        v20 = *(_QWORD *)(a1 + 64);
        v23 = v4;
        v21 = v7;
        v22 = 1;
      }
      objc_msgSend(v18, "_activateCameraEntity:animated:asOverlay:viaSwitcherModal:request:actions:completion:", v21, 1, v22, 0, v19, v20, v23);
    }
LABEL_17:

    goto LABEL_18;
  }
  v16 = secureAppTypeForSBApplicationSceneEntity(*(void **)(a1 + 48));
  v17 = *(void **)(a1 + 48);
  if (v16 == 4)
  {
    objc_msgSend(v17, "translateActivationSettingsToActions");
    objc_msgSend(*(id *)(a1 + 32), "_activateCameraEntity:animated:actions:completion:", 0, 1, *(_QWORD *)(a1 + 64), v4);
  }
  else
  {
    objc_msgSend(v17, "addActions:", *(_QWORD *)(a1 + 64));
    objc_msgSend(*(id *)(a1 + 32), "_reallyActivateAppSceneWithEntity:interactive:withCompletion:", *(_QWORD *)(a1 + 48), 0, v4);
  }
LABEL_18:

}

void __95__SBDashBoardApplicationLauncher__presentApplicationSceneEntity_source_fromRequest_withResult___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  id v6;

  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "relinquish");
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
    (*(void (**)(uint64_t, uint64_t, id))(v5 + 16))(v5, a2, v6);

}

- (void)_reallyActivateAppSceneWithEntity:(id)a3 interactive:(BOOL)a4 withCompletion:(id)a5
{
  id v7;
  uint64_t v8;
  void *v9;
  int v10;
  id v11;

  v11 = a3;
  v7 = a5;
  v8 = secureAppTypeForSBApplicationSceneEntity(v11);
  if (v8 == 4
    && (-[CSCoverSheetViewController activeBehavior](self->_coverSheetViewController, "activeBehavior"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v10 = objc_msgSend(v9, "areRestrictedCapabilities:", 4),
        v9,
        v10))
  {
    -[SBDashBoardApplicationLauncher _attemptToUnlockToCameraCompletion:](self, "_attemptToUnlockToCameraCompletion:", v7);
  }
  else
  {
    -[SBDashBoardApplicationLauncher _activateAppSceneBelowDashBoard:hostableEntity:secureAppType:withActions:interactive:completion:](self, "_activateAppSceneBelowDashBoard:hostableEntity:secureAppType:withActions:interactive:completion:", v11, 0, v8, 0, 0, v7);
  }

}

- (void)_activateAppSceneBelowDashBoard:(id)a3 hostableEntity:(id)a4 secureAppType:(unint64_t)a5 withActions:(id)a6 interactive:(BOOL)a7 completion:(id)a8
{
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  char v19;
  SBInProcessSecureAppAction *secureAppAction;
  SBInProcessSecureAppAction *v21;
  id WeakRetained;
  void *v23;
  uint64_t v24;
  SBInProcessSecureAppAction *v25;
  SBInProcessSecureAppAction *v26;
  SBInProcessSecureAppAction *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  CSCoverSheetViewController *coverSheetViewController;
  void *v33;
  void *v34;
  void *v35;
  _QWORD v36[6];

  v14 = a3;
  v15 = a4;
  v16 = a8;
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
  {
    +[SBSecureAppManager sharedInstance](SBSecureAppManager, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "hasSecureAppOfType:", a5);

    if ((v19 & 1) == 0)
    {
      secureAppAction = self->_secureAppAction;
      if (secureAppAction)
      {
        -[SBInProcessSecureAppAction invalidate](secureAppAction, "invalidate");
        v21 = self->_secureAppAction;
        self->_secureAppAction = 0;

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_secureAppManager);
      objc_msgSend(WeakRetained, "secureAppAction");
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        objc_msgSend(v23, "invalidate");
      v36[0] = MEMORY[0x1E0C809B0];
      v36[1] = 3221225472;
      v36[2] = __130__SBDashBoardApplicationLauncher__activateAppSceneBelowDashBoard_hostableEntity_secureAppType_withActions_interactive_completion___block_invoke;
      v36[3] = &unk_1E8EA8330;
      v36[4] = self;
      v36[5] = a2;
      v24 = MEMORY[0x1D17E5550](v36);
      v25 = [SBInProcessSecureAppAction alloc];
      if (v15)
        v26 = -[SBInProcessSecureAppAction initWithType:hostableEntity:handler:](v25, "initWithType:hostableEntity:handler:", a5, v15, v24, v24, v23);
      else
        v26 = -[SBInProcessSecureAppAction initWithType:applicationSceneEntity:handler:](v25, "initWithType:applicationSceneEntity:handler:", a5, v14, v24, v24, v23);
      v27 = self->_secureAppAction;
      self->_secureAppAction = v26;

      objc_msgSend(v17, "secureAppViewController");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      +[SBActionHandler sharedInstance](SBActionHandler, "sharedInstance");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", self->_secureAppAction);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D016E0], "tokenForCurrentProcess");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "handleActions:origin:withResult:", v30, v31, 0);

      if (!a7 && v28)
        objc_msgSend(v17, "updateBecauseSecureAppChanged");

    }
  }
  if (!a7)
    objc_msgSend(v17, "setCoverSheetPresented:animated:withCompletion:", 0, 1, 0);
  coverSheetViewController = self->_coverSheetViewController;
  objc_msgSend(MEMORY[0x1E0D1BB48], "actionWithType:", 4);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSCoverSheetViewController handleAction:fromSender:](coverSheetViewController, "handleAction:fromSender:", v33, self);

  if (v16)
    (*((void (**)(id, _QWORD, _QWORD))v16 + 2))(v16, 0, 0);

}

void __130__SBDashBoardApplicationLauncher__activateAppSceneBelowDashBoard_hostableEntity_secureAppType_withActions_interactive_completion___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "error");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "domain");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DAB960]))
    goto LABEL_4;
  v4 = objc_msgSend(v9, "code");

  if (v4 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = a1 + 32;
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(v7 + 8);
    objc_msgSend(v9, "localizedDescription");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", v6, v5, CFSTR("SBDashBoardApplicationLauncher.m"), 524, CFSTR("SBDashBoardViewController failed to acquire an assertion: %@"), v8);

LABEL_4:
  }

}

- (void)_activateCameraEntity:(id)a3 animated:(BOOL)a4 actions:(id)a5 completion:(id)a6
{
  -[SBDashBoardApplicationLauncher _activateCameraEntity:animated:asOverlay:viaSwitcherModal:request:actions:completion:](self, "_activateCameraEntity:animated:asOverlay:viaSwitcherModal:request:actions:completion:", a3, a4, 0, 0, 0, a5, a6);
}

- (void)_activateCameraEntity:(id)a3 animated:(BOOL)a4 asOverlay:(BOOL)a5 viaSwitcherModal:(BOOL)a6 request:(id)a7 actions:(id)a8 completion:(id)a9
{
  _BOOL8 v13;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  void (**v25)(_QWORD, _QWORD);
  void *v26;
  void *v27;
  void *v28;
  SBDashBoardApplicationLauncher *v29;
  id v30;
  id v31;
  id v32;
  void *v33;
  void *v34;
  int v35;
  SBDashBoardApplicationLauncher *v36;
  void *v37;
  CSCoverSheetViewController *coverSheetViewController;
  id v39;
  _BOOL4 v40;
  _QWORD v41[4];
  void (**v42)(_QWORD, _QWORD);
  _QWORD v43[4];
  void (**v44)(_QWORD, _QWORD);
  _QWORD v45[5];
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  BOOL v51;
  BOOL v52;

  v13 = a4;
  v15 = a3;
  v16 = a7;
  v17 = a8;
  v18 = a9;
  +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke;
  v45[3] = &unk_1E8EA83F8;
  v20 = v18;
  v50 = v20;
  v45[4] = self;
  v21 = v16;
  v46 = v21;
  v22 = v15;
  v47 = v22;
  v51 = a6;
  v23 = v19;
  v48 = v23;
  v52 = a5;
  v24 = v17;
  v49 = v24;
  v25 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v45);
  if (objc_msgSend(v23, "isCoverSheetHostingAnApp"))
  {
    v40 = v13;
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "cameraApplication");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v23, "isInSecureApp") & 1) != 0)
      goto LABEL_4;
    objc_msgSend(v23, "coverSheetHostedAppSceneHandle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "application");
    v39 = v24;
    v29 = self;
    v30 = v20;
    v31 = v22;
    v32 = v21;
    v33 = v27;
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "isEqual:", v33);

    v27 = v33;
    v21 = v32;
    v22 = v31;
    v20 = v30;
    v36 = v29;
    v24 = v39;

    if (v35)
    {
LABEL_4:
      v43[0] = MEMORY[0x1E0C809B0];
      v43[1] = 3221225472;
      v43[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_2_54;
      v43[3] = &unk_1E8E9E8D0;
      v44 = v25;
      objc_msgSend(v23, "setCoverSheetPresented:animated:withCompletion:", 1, v40, v43);
      v37 = v44;
    }
    else
    {
      if (!-[CSCoverSheetViewController isHostingAnApp](v36->_coverSheetViewController, "isHostingAnApp"))
      {
        (*((void (**)(id, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
        goto LABEL_6;
      }
      coverSheetViewController = v36->_coverSheetViewController;
      v41[0] = MEMORY[0x1E0C809B0];
      v41[1] = 3221225472;
      v41[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_3_55;
      v41[3] = &unk_1E8E9E8D0;
      v42 = v25;
      -[CSCoverSheetViewController dismissHostedAppsAnimated:completion:](coverSheetViewController, "dismissHostedAppsAnimated:completion:", 1, v41);
      v37 = v42;
    }

LABEL_6:
    goto LABEL_10;
  }
  if (objc_msgSend(v23, "isAnyGestureActivelyRecognized"))
    objc_msgSend(v23, "setCoverSheetPresented:animated:withCompletion:", 1, v13, 0);
  v25[2](v25, v13);
LABEL_10:

}

void __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  _QWORD v16[4];
  SBDashBoardCaptureExtensionHostingFluidSwitcherViewController *v17;
  id v18;
  id v19;
  uint64_t v20;
  id v21;
  void (**v22)(_QWORD, _QWORD);
  id v23;
  char v24;
  _QWORD v25[4];
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  uint64_t v32;

  v4 = MEMORY[0x1E0C809B0];
  v32 = *MEMORY[0x1E0C80C00];
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_2;
  v27[3] = &unk_1E8EA8358;
  v5 = *(id *)(a1 + 72);
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  v29 = v5;
  v27[4] = v6;
  v28 = v7;
  v25[0] = v4;
  v25[1] = 3221225472;
  v25[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_3;
  v25[3] = &unk_1E8E9F1C0;
  v8 = (id)MEMORY[0x1D17E5550](v27);
  v26 = v8;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x1D17E5550](v25);
  if (*(_QWORD *)(a1 + 48))
  {
    if (*(_BYTE *)(a1 + 80))
    {
      v10 = -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController initWithCaptureExtensionEntity:]([SBDashBoardCaptureExtensionHostingFluidSwitcherViewController alloc], "initWithCaptureExtensionEntity:", *(_QWORD *)(a1 + 48));
      if (v10)
      {
        SBLogDashBoard();
        v11 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          -[CSCoverSheetViewControllerBase succinctDescription](v10, "succinctDescription");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v31 = v12;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Presenting switcher modal %@", buf, 0xCu);

        }
        v13 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
        v16[0] = v4;
        v16[1] = 3221225472;
        v16[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_46;
        v16[3] = &unk_1E8EA83D0;
        v17 = v10;
        v18 = *(id *)(a1 + 48);
        v14 = *(id *)(a1 + 40);
        v24 = a2;
        v15 = *(_QWORD *)(a1 + 32);
        v19 = v14;
        v20 = v15;
        v21 = *(id *)(a1 + 56);
        v22 = v9;
        v23 = v8;
        objc_msgSend(v13, "presentModalViewController:animated:completion:", v17, 0, v16);

      }
      else
      {
        v9[2](v9, 0);
      }
    }
    else
    {
      if (!*(_BYTE *)(a1 + 81))
      {
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "activateCameraWithHostableEntity:animated:sendingActions:completion:");
        goto LABEL_12;
      }
      v10 = objc_alloc_init(SBDashBoardCameraContainerViewController);
      -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController setActionsToDeliverToHostableEntity:](v10, "setActionsToDeliverToHostableEntity:", *(_QWORD *)(a1 + 64));
      -[SBDashBoardCaptureExtensionHostingFluidSwitcherViewController setHostedEntity:](v10, "setHostedEntity:", *(_QWORD *)(a1 + 48));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "activateOverlayWithViewController:animated:completion:", v10, a2, v9);
    }

  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "activateCameraViewAnimated:sendingActions:completion:", a2, *(_QWORD *)(a1 + 64), v9);
  }
LABEL_12:

}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_2(uint64_t a1, int a2, int a3)
{
  uint64_t (*v4)(void);
  uint64_t result;

  if (a3)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    return v4();
  }
  if (a2)
    return objc_msgSend(*(id *)(a1 + 32), "_attemptToUnlockToCameraCompletion:", *(_QWORD *)(a1 + 48));
  result = objc_msgSend(*(id *)(a1 + 40), "source");
  if (result == 70)
  {
    v4 = *(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16);
    return v4();
  }
  return result;
}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_46(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v15 = v3;
    v16 = 2112;
    v17 = v4;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Switcher modal %@ presented. Activating entity %@", buf, 0x16u);

  }
  v5 = *(void **)(a1 + 32);
  v6 = *(unsigned __int8 *)(a1 + 88);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_47;
  v8[3] = &unk_1E8EA83A8;
  v7 = *(_QWORD *)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 56);
  v9 = *(id *)(a1 + 64);
  v10 = *(id *)(a1 + 32);
  v11 = *(id *)(a1 + 40);
  v12 = *(id *)(a1 + 72);
  v13 = *(id *)(a1 + 80);
  objc_msgSend(v5, "activateDisplayItemFromRequest:animated:completion:", v7, v6, v8);

}

void __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_47(uint64_t a1, int a2)
{
  int v4;
  int v5;
  int v6;
  NSObject *v7;
  _BOOL4 v8;
  BOOL v9;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[5];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 48), "isInScreenOffMode");
  v5 = objc_msgSend(*(id *)(a1 + 40), "isPresented");
  v6 = objc_msgSend(*(id *)(a1 + 48), "bs_isAppearingOrAppeared");
  SBLogDashBoard();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
    v9 = v5 == 0;
  else
    v9 = 1;
  if (v9 || v4 != 0 || a2 == 0)
  {
    if (v8)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "No longer in a good state to complete transition to camera page", buf, 2u);
    }

    v12 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
    v13 = *(_QWORD *)(a1 + 48);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_51;
    v19[3] = &unk_1E8E9E8D0;
    v20 = *(id *)(a1 + 72);
    objc_msgSend(v12, "dismissModalViewController:animated:completion:", v13, 0, v19);
    v14 = v20;
  }
  else
  {
    if (v8)
    {
      v15 = *(_QWORD *)(a1 + 56);
      *(_DWORD *)buf = 138412290;
      v26 = v15;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Completed activation of entity %@. Dismissing any remaining modals.", buf, 0xCu);
    }

    v16 = *(_QWORD *)(a1 + 32);
    v17 = *(void **)(v16 + 48);
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_48;
    v21[3] = &unk_1E8E9E248;
    v21[4] = v16;
    v18 = *(_QWORD *)(a1 + 48);
    v22 = *(id *)(a1 + 56);
    v23 = *(id *)(a1 + 48);
    v24 = *(id *)(a1 + 64);
    objc_msgSend(v17, "_dismissAllModalViewControllersExcept:animated:completion:", v18, 0, v21);

    v14 = v22;
  }

}

void __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_48(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[4];
  id v8;
  uint64_t v9;
  id v10;
  uint8_t buf[16];

  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Dismissed remaining modals. Transitioning to camera page.", buf, 2u);
  }

  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 48);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_49;
  v7[3] = &unk_1E8EA47F0;
  v5 = *(id *)(a1 + 48);
  v6 = *(_QWORD *)(a1 + 32);
  v8 = v5;
  v9 = v6;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v4, "activateCameraWithHostableEntity:animated:sendingActions:completion:", v3, 0, 0, v7);

}

void __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_49(uint64_t a1, char a2)
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  char v11;
  uint8_t buf[4];
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v13 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "Completed transition to camera page. Tearing down modal %@", buf, 0xCu);

  }
  v6 = *(void **)(a1 + 32);
  v7 = *(void **)(*(_QWORD *)(a1 + 40) + 48);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_50;
  v8[3] = &unk_1E8EA8380;
  v9 = v6;
  v10 = *(id *)(a1 + 48);
  v11 = a2;
  objc_msgSend(v7, "dismissModalViewController:animated:completion:", v9, 0, v8);

}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 32), "succinctDescription");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "Completed teardown of modal %@", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_51(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_2_54(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __119__SBDashBoardApplicationLauncher__activateCameraEntity_animated_asOverlay_viaSwitcherModal_request_actions_completion___block_invoke_3_55(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_attemptToUnlockToCameraCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cameraApplication");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  -[SBDashBoardApplicationLauncher _attemptToUnlockToApplication:completion:](self, "_attemptToUnlockToApplication:completion:", v6, v4);
}

- (void)_attemptToUnlockToApplication:(id)a3 completion:(id)a4
{
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  SBLockScreenUnlockRequest *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, int);
  void *v15;
  id v16;
  id v17;

  v5 = a3;
  v6 = a4;
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __75__SBDashBoardApplicationLauncher__attemptToUnlockToApplication_completion___block_invoke;
  v15 = &unk_1E8E9F230;
  v16 = v5;
  v17 = v6;
  v7 = v6;
  v8 = v5;
  v9 = (void *)MEMORY[0x1D17E5550](&v12);
  v10 = objc_alloc_init(SBLockScreenUnlockRequest);
  -[SBLockScreenUnlockRequest setName:](v10, "setName:", CFSTR("Unlock For App Launch From DashBoard"), v12, v13, v14, v15);
  -[SBLockScreenUnlockRequest setSource:](v10, "setSource:", 24);
  -[SBLockScreenUnlockRequest setIntent:](v10, "setIntent:", 3);
  -[SBLockScreenUnlockRequest setDestinationApplication:](v10, "setDestinationApplication:", v8);
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "unlockWithRequest:completion:", v10, v9);

}

uint64_t __75__SBDashBoardApplicationLauncher__attemptToUnlockToApplication_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t result;
  uint64_t (*v4)(void);

  if (a2)
  {
    SBWorkspaceActivateApplication(*(void **)(a1 + 32));
    result = *(_QWORD *)(a1 + 40);
    if (!result)
      return result;
    v4 = *(uint64_t (**)(void))(result + 16);
  }
  else
  {
    result = *(_QWORD *)(a1 + 40);
    if (!result)
      return result;
    v4 = *(uint64_t (**)(void))(result + 16);
  }
  return v4();
}

- (void)_activateAppWithURL:(id)a3
{
  SBWorkspaceActivateApplicationFromURL(a3, 0, &__block_literal_global_94);
}

uint64_t __54__SBDashBoardApplicationLauncher__activateAppWithURL___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSource:", 13);
}

- (void)_prewarmCameraForBundleIdentifier:(id)a3 prewarmReason:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  _QWORD v16[3];
  _QWORD v17[4];

  v17[3] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "numberWithLongLong:", mach_absolute_time());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", mach_continuous_time());
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  v11 = (void *)*MEMORY[0x1E0C8A080];
  if (v6)
    v11 = v6;
  v12 = *MEMORY[0x1E0C8A0B8];
  v16[0] = *MEMORY[0x1E0C8A0A0];
  v16[1] = v12;
  v17[0] = v11;
  v17[1] = v8;
  v16[2] = *MEMORY[0x1E0C8A0C8];
  v17[2] = v9;
  v13 = (void *)MEMORY[0x1E0C99D80];
  v14 = v11;
  objc_msgSend(v13, "dictionaryWithObjects:forKeys:count:", v17, v16, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  AVCapturePrewarmWithOptions();
}

- (void)_coolCameraIfNecessaryForBundleIdentifier:(id)a3 prewarmReason:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (self->_cameraIsPrewarming && !self->_cameraPrewarmSucceeded)
  {
    objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "emitEvent:", 45);

    v9 = (void *)*MEMORY[0x1E0C8A080];
    if (v7)
      v9 = v7;
    v13 = *MEMORY[0x1E0C8A0A0];
    v14[0] = v9;
    v10 = (void *)MEMORY[0x1E0C99D80];
    v11 = v9;
    objc_msgSend(v10, "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x1D17E1D28](v6, v12);
  }

}

- (BOOL)_backgroundLaunchWithBundleIdentifier:(id)a3 isCaptureApplicationLaunch:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  _QWORD v12[4];
  id v13;
  BOOL v14;

  if (!a3)
    return 0;
  v5 = a3;
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationWithBundleIdentifier:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__SBDashBoardApplicationLauncher__backgroundLaunchWithBundleIdentifier_isCaptureApplicationLaunch___block_invoke;
  v12[3] = &unk_1E8EA2470;
  v13 = v7;
  v14 = a4;
  v9 = v7;
  v10 = objc_msgSend(v8, "requestTransitionWithBuilder:", v12);

  return v10;
}

void __99__SBDashBoardApplicationLauncher__backgroundLaunchWithBundleIdentifier_isCaptureApplicationLaunch___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  char v6;

  v3 = a2;
  objc_msgSend(v3, "setSource:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __99__SBDashBoardApplicationLauncher__backgroundLaunchWithBundleIdentifier_isCaptureApplicationLaunch___block_invoke_2;
  v4[3] = &unk_1E8E9F398;
  v5 = *(id *)(a1 + 32);
  v6 = *(_BYTE *)(a1 + 40);
  objc_msgSend(v3, "modifyApplicationContext:", v4);

}

void __99__SBDashBoardApplicationLauncher__backgroundLaunchWithBundleIdentifier_isCaptureApplicationLaunch___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  SBDeviceApplicationSceneEntity *v4;

  v3 = a2;
  v4 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", *(_QWORD *)(a1 + 32));
  if (*(_BYTE *)(a1 + 40))
    -[SBWorkspaceEntity setFlag:forActivationSetting:](v4, "setFlag:forActivationSetting:", 1, 36);
  objc_msgSend(v3, "setBackground:", 1);
  objc_msgSend(v3, "setEntity:forLayoutRole:", v4, 1);

}

- (CSCoverSheetViewController)coverSheetViewController
{
  return self->_coverSheetViewController;
}

- (SBSecureAppManager)secureAppManager
{
  return (SBSecureAppManager *)objc_loadWeakRetained((id *)&self->_secureAppManager);
}

- (void)setSecureAppManager:(id)a3
{
  objc_storeWeak((id *)&self->_secureAppManager, a3);
}

- (SBDashBoardCaptureLaunchPolicy)captureLaunchPolicy
{
  return self->_captureLaunchPolicy;
}

- (void)setCaptureLaunchPolicy:(id)a3
{
  objc_storeStrong((id *)&self->_captureLaunchPolicy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureLaunchPolicy, 0);
  objc_destroyWeak((id *)&self->_secureAppManager);
  objc_storeStrong((id *)&self->_coverSheetViewController, 0);
  objc_storeStrong((id *)&self->_prewarmIdentifiersToCancelTimers, 0);
  objc_storeStrong((id *)&self->_currentPrewarmIdentifiersToReasons, 0);
  objc_storeStrong((id *)&self->_secureAppAction, 0);
  objc_storeStrong((id *)&self->_eventQueue, 0);
}

- (void)handleTransitionRequest:(NSObject *)a3 .cold.1(void *a1, void *a2, NSObject *a3)
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "uniqueIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBMainWorkspaceTransitionSourceDescription(objc_msgSend(a2, "source"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v5;
  v9 = 2112;
  v10 = v6;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "Handling transition request for application scene %@ from %@...", (uint8_t *)&v7, 0x16u);

}

- (void)_prewarmWithConfiguration:(uint64_t)a1 prewarmReason:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "Failed to prewarm: No prewarming bundle identifier found for application: %@", (uint8_t *)&v2, 0xCu);
}

@end
