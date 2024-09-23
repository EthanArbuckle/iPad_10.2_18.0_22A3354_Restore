@implementation SBCaptureApplicationCenter

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44__SBCaptureApplicationCenter_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_14 != -1)
    dispatch_once(&sharedInstance_onceToken_14, block);
  return (id)sharedInstance___result_0;
}

void __44__SBCaptureApplicationCenter_sharedInstance__block_invoke(uint64_t a1)
{
  id v1;
  void *v2;

  v1 = objc_alloc_init(*(Class *)(a1 + 32));
  v2 = (void *)sharedInstance___result_0;
  sharedInstance___result_0 = (uint64_t)v1;

}

+ (id)captureApplicationSettings
{
  if (captureApplicationSettings_onceToken != -1)
    dispatch_once(&captureApplicationSettings_onceToken, &__block_literal_global_117);
  return (id)captureApplicationSettings_settings;
}

void __56__SBCaptureApplicationCenter_captureApplicationSettings__block_invoke()
{
  uint64_t v0;
  void *v1;

  +[SBCaptureApplicationDomain rootSettings](SBCaptureApplicationDomain, "rootSettings");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)captureApplicationSettings_settings;
  captureApplicationSettings_settings = v0;

}

- (SBCaptureApplicationCenter)init
{
  SBCaptureApplicationCenter *v2;
  LCSCaptureApplicationMonitor *v3;
  LCSCaptureApplicationMonitor *captureApplicationMonitor;
  dispatch_queue_t v5;
  OS_dispatch_queue *queue;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBCaptureApplicationCenter;
  v2 = -[SBCaptureApplicationCenter init](&v9, sel_init);
  if (v2)
  {
    v3 = (LCSCaptureApplicationMonitor *)objc_alloc_init(MEMORY[0x1E0D44658]);
    captureApplicationMonitor = v2->_captureApplicationMonitor;
    v2->_captureApplicationMonitor = v3;

    -[LCSCaptureApplicationMonitor addObserver:](v2->_captureApplicationMonitor, "addObserver:", v2);
    v5 = dispatch_queue_create("com.apple.SpringBoardFramework.SBCaptureApplicationCenter", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v5;

    v7 = (id)objc_msgSend((id)objc_opt_class(), "captureApplicationSettings");
  }
  return v2;
}

- (id)captureApplicationForBundleIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__38;
  v16 = __Block_byref_object_dispose__38;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __68__SBCaptureApplicationCenter_captureApplicationForBundleIdentifier___block_invoke;
  block[3] = &unk_1E8E9FD30;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __68__SBCaptureApplicationCenter_captureApplicationForBundleIdentifier___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1[4] + 16), "knownCaptureApplicationsByBundleIdentifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)captureApplicationForExtensionIdentifier:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  id v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__38;
  v16 = __Block_byref_object_dispose__38;
  v17 = 0;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__SBCaptureApplicationCenter_captureApplicationForExtensionIdentifier___block_invoke;
  block[3] = &unk_1E8E9FD30;
  v10 = v4;
  v11 = &v12;
  block[4] = self;
  v6 = v4;
  dispatch_sync(queue, block);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

void __71__SBCaptureApplicationCenter_captureApplicationForExtensionIdentifier___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "knownCaptureApplicationsByBundleIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "allValues");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __71__SBCaptureApplicationCenter_captureApplicationForExtensionIdentifier___block_invoke_2;
  v7[3] = &unk_1E8EAB518;
  v8 = *(id *)(a1 + 40);
  objc_msgSend(v3, "bs_firstObjectPassingTest:", v7);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

uint64_t __71__SBCaptureApplicationCenter_captureApplicationForExtensionIdentifier___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "extension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v5;
}

- (id)knownCaptureApplications
{
  NSObject *queue;
  id v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy__38;
  v10 = __Block_byref_object_dispose__38;
  v11 = 0;
  queue = self->_queue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __54__SBCaptureApplicationCenter_knownCaptureApplications__block_invoke;
  v5[3] = &unk_1E8E9DFA0;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(queue, v5);
  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

void __54__SBCaptureApplicationCenter_knownCaptureApplications__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "knownCaptureApplicationsByBundleIdentifier");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allValues");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_set");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (BOOL)launchCaptureApplication:(id)a3 source:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBDeviceApplicationSceneEntity *v11;
  void *v12;
  void *v13;
  char v14;

  v6 = a3;
  -[SBCaptureApplicationCenter captureApplicationForBundleIdentifier:](self, "captureApplicationForBundleIdentifier:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    +[SBWorkspace mainWorkspace](SBMainWorkspace, "mainWorkspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "applicationWithBundleIdentifier:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", v10);
    objc_msgSend(v8, "createRequestForApplicationActivation:options:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEventLabel:", CFSTR("CaptureApplicationLaunch"));
    objc_msgSend(MEMORY[0x1E0D01828], "processHandle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setOriginatingProcess:", v13);

    objc_msgSend(v12, "setSource:", a4);
    objc_msgSend(v12, "modifyApplicationContext:", &__block_literal_global_12_1);
    v14 = objc_msgSend(v8, "executeTransitionRequest:", v12);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __62__SBCaptureApplicationCenter_launchCaptureApplication_source___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "applicationSceneEntities");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bs_each:", &__block_literal_global_14_1);

}

void __62__SBCaptureApplicationCenter_launchCaptureApplication_source___block_invoke_2(uint64_t a1, void *a2)
{
  int v2;
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setFlag:forActivationSetting:", 1, 35);
  if (+[SBCaptureHardwareButton deviceSupportsCaptureButton]())
    v2 = +[SBCaptureHardwareButton isCaptureFeatureEnabled]();
  else
    v2 = 0;
  if ((LCSFeatureEnabled() & 1) != 0 || v2)
    objc_msgSend(v3, "setFlag:forActivationSetting:", 1, 36);

}

- (id)predictedPrewarmBundleIdentifierForApplicationBundleIdentifier:(id)a3
{
  id v4;
  int v5;
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  int v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = _os_feature_enabled_impl();
  v6 = v4;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.camera")))
    v7 = v5 == 0;
  else
    v7 = 0;
  v8 = v6;
  if (!v7)
  {
    -[SBCaptureApplicationCenter captureApplicationForBundleIdentifier:](self, "captureApplicationForBundleIdentifier:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6;
    if (v9)
    {
      +[SBLockScreenManager sharedInstanceIfExists](SBLockScreenManager, "sharedInstanceIfExists");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "wouldAttemptToHandleATransitionRequest");

      v8 = v6;
      if (v11)
      {
        objc_msgSend(v9, "extension");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "bundleIdentifier");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }

  }
  SBLogCaptureApplication();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Possible prewarm bundle identifier %@", (uint8_t *)&v15, 0xCu);
  }

  return v8;
}

- (BOOL)launchForExtensionToApplicationTransition:(id)a3 launchActions:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  char v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;

  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (v7)
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "applicationWithBundleIdentifier:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __104__SBCaptureApplicationCenter_launchForExtensionToApplicationTransition_launchActions_completionHandler___block_invoke;
    v16[3] = &unk_1E8E9F770;
    v17 = v11;
    v18 = v8;
    v19 = v7;
    v20 = v9;
    v13 = v11;
    v14 = objc_msgSend(v12, "requestTransitionWithBuilder:", v16);

  }
  else
  {
    v14 = 0;
  }

  return v14;
}

void __104__SBCaptureApplicationCenter_launchForExtensionToApplicationTransition_launchActions_completionHandler___block_invoke(id *a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id v11;

  v3 = a2;
  objc_msgSend(v3, "setEventLabel:", CFSTR("CaptureApplicationExtensionToApplicationLaunch"));
  objc_msgSend(v3, "setSource:", 0);
  v4 = MEMORY[0x1E0C809B0];
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __104__SBCaptureApplicationCenter_launchForExtensionToApplicationTransition_launchActions_completionHandler___block_invoke_2;
  v8[3] = &unk_1E8EAACE0;
  v9 = a1[4];
  v10 = a1[5];
  v11 = a1[6];
  objc_msgSend(v3, "modifyApplicationContext:", v8);
  v6[0] = v4;
  v6[1] = 3221225472;
  v6[2] = __104__SBCaptureApplicationCenter_launchForExtensionToApplicationTransition_launchActions_completionHandler___block_invoke_3;
  v6[3] = &unk_1E8E9F1C0;
  v7 = a1[7];
  v5 = (id)objc_msgSend(v3, "addCompletionHandler:", v6);

}

void __104__SBCaptureApplicationCenter_launchForExtensionToApplicationTransition_launchActions_completionHandler___block_invoke_2(_QWORD *a1, void *a2)
{
  SBDeviceApplicationSceneEntity *v3;
  void *v4;
  id v5;

  v5 = a2;
  v3 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", a1[4]);
  -[SBApplicationSceneEntity addActions:](v3, "addActions:", a1[5]);
  -[SBWorkspaceEntity setFlag:forActivationSetting:](v3, "setFlag:forActivationSetting:", 1, 59);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("CaptureExtensionToAppTransition for %@"), a1[6]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceEntity setObject:forActivationSetting:](v3, "setObject:forActivationSetting:", v4, 60);

  if (LCSFeatureEnabled())
    -[SBWorkspaceEntity setFlag:forActivationSetting:](v3, "setFlag:forActivationSetting:", 1, 37);
  objc_msgSend(v5, "setEntity:forLayoutRole:", v3, 1);

}

uint64_t __104__SBCaptureApplicationCenter_launchForExtensionToApplicationTransition_launchActions_completionHandler___block_invoke_3(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)suspendCaptureApplication:(id)a3
{
  id v3;
  void *v4;
  SBDeviceApplicationSceneEntity *v5;
  void *v6;
  void *v7;
  id v8;

  if (a3)
  {
    v3 = a3;
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "applicationWithBundleIdentifier:", v3);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    v5 = -[SBDeviceApplicationSceneEntity initWithApplicationForMainDisplay:]([SBDeviceApplicationSceneEntity alloc], "initWithApplicationForMainDisplay:", v8);
    -[SBApplicationSceneEntity sceneHandle](v5, "sceneHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
      SBWorkspaceSuspendApplicationScene(v6);

  }
}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      -[NSHashTable addObject:](observers, "addObject:", v9);
      v4 = v9;
    }
  }

}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;
  id v5;

  v5 = a3;
  if (v5)
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (BOOL)_bundleHasCameraEntitlement:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", a3, 1, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "entitlements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:ofClass:", CFSTR("com.apple.private.tcc.allow"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v5) = objc_msgSend(v6, "containsObject:", *MEMORY[0x1E0DB10F0]);
  return (char)v5;
}

- (BOOL)isApplicationLaunchNeededForApplicationBundleIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  NSObject *v11;
  char v12;
  NSObject *v13;
  _BOOL4 v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend((id)SBApp, "privacyPreflightController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "applicationWithBundleIdentifier:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "info");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "applicationIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v5, "requiresPreflightForApplication:", v9);

  if (v10)
  {
    SBLogCaptureApplication();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Preflight is required for this capture application, application launch is required for %@", (uint8_t *)&v17, 0xCu);
    }

    v12 = 1;
  }
  else if (-[SBCaptureApplicationCenter _bundleHasCameraEntitlement:](self, "_bundleHasCameraEntitlement:", v4))
  {
    SBLogCaptureApplication();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412290;
      v18 = v4;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "Application is entitled to have camera access %@", (uint8_t *)&v17, 0xCu);
    }

    v12 = 0;
  }
  else
  {
    v14 = -[SBCaptureApplicationCenter _isTCCGrantedForKey:applicationBundleIdentifier:](self, "_isTCCGrantedForKey:applicationBundleIdentifier:", *MEMORY[0x1E0DB10F0], v4);
    SBLogCaptureApplication();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v17 = 138412546;
      v18 = v4;
      v19 = 1024;
      v20 = v14;
      _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "TCC state for application %@: %{BOOL}u", (uint8_t *)&v17, 0x12u);
    }

    v12 = !v14;
  }

  return v12;
}

- (BOOL)_isTCCGrantedForKey:(__CFString *)a3 applicationBundleIdentifier:(id)a4
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  void *i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a4;
  if (v4)
  {
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v5 = (id)TCCAccessCopyInformation();
    v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v15;
      v8 = (_QWORD *)MEMORY[0x1E0DB1098];
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v10, "objectForKeyedSubscript:", *v8, (_QWORD)v14);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            CFBundleGetIdentifier((CFBundleRef)v11);
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v12, "isEqualToString:", v4))
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", *MEMORY[0x1E0DB10A8]);
              v6 = (void *)objc_claimAutoreleasedReturnValue();

              if (v6)
                LOBYTE(v6) = CFBooleanGetValue((CFBooleanRef)v6) != 0;

              goto LABEL_17;
            }

          }
        }
        v6 = (void *)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        if (v6)
          continue;
        break;
      }
    }
LABEL_17:

  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return (char)v6;
}

- (void)captureApplicationProvider:(id)a3 didUpdateKnownApplications:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v13;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v13 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v11, "captureApplicationCenter:didUpdateKnownApplications:", self, v5);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v8);
  }

}

- (LCSCaptureApplicationMonitor)captureApplicationMonitor
{
  return self->_captureApplicationMonitor;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_captureApplicationMonitor, 0);
  objc_storeStrong((id *)&self->_observers, 0);
}

@end
