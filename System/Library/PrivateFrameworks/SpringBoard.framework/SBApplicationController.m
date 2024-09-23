@implementation SBApplicationController

- (id)applicationForDisplayItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (objc_msgSend(v4, "type") && objc_msgSend(v4, "type") != 3)
  {
    if (objc_msgSend(v4, "type") == 5)
    {
      -[SBApplicationController webApplication](self, "webApplication");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
  }
  else
  {
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)applicationWithBundleIdentifier:(id)a3
{
  os_unfair_lock_s *p_applicationsLock;
  id v5;
  void *v6;

  p_applicationsLock = &self->_applicationsLock;
  v5 = a3;
  os_unfair_lock_lock(p_applicationsLock);
  -[SBApplicationController _lock_applicationWithBundleIdentifier:](self, "_lock_applicationWithBundleIdentifier:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_applicationsLock);
  return v6;
}

- (id)_lock_applicationWithBundleIdentifier:(id)a3
{
  return (id)-[NSMutableDictionary objectForKey:](self->_applicationsByBundleIdentifier, "objectForKey:", a3);
}

+ (id)sharedInstanceIfExists
{
  return (id)objc_msgSend(a1, "_sharedInstanceCreateIfNecessary:", 0);
}

- (id)applicationWithPid:(int)a3
{
  uint64_t v3;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  id v15;
  void *v16;
  SEL v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3 < 1)
    return 0;
  v3 = *(_QWORD *)&a3;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[SBApplicationController runningApplications](self, "runningApplications");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v18 = a2;
    v9 = 0;
    v10 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v12, "processState");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "pid");

        if (v14 == (_DWORD)v3)
        {
          if (v9)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", v18, self, CFSTR("SBApplicationController.m"), 332, CFSTR("shouldn't ever have two apps with the same pid %d: app1=%@ app2=%@"), v3, v9, v12);

          }
          v15 = v12;

          v9 = v15;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)runningApplications
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[SBApplicationController allApplications](self, "allApplications", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "processState");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isRunning");

        if (v11)
          objc_msgSend(v3, "addObject:", v9);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)allApplications
{
  os_unfair_lock_s *p_applicationsLock;
  void *v4;

  p_applicationsLock = &self->_applicationsLock;
  os_unfair_lock_lock(&self->_applicationsLock);
  -[NSMutableDictionary allValues](self->_applicationsByBundleIdentifier, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_applicationsLock);
  return v4;
}

+ (id)_sharedInstanceCreateIfNecessary:(BOOL)a3
{
  _BOOL4 v3;
  id v4;
  BOOL v5;
  SBApplicationController *v6;
  void *v7;

  v3 = a3;
  if (a3 || _sharedInstanceCreateIfNecessary__sharedApplicationController)
  {
    pthread_mutex_lock(&_sharedInstanceCreateIfNecessary__sharedApplicationControllerLock);
    if (_sharedInstanceCreateIfNecessary__sharedApplicationController)
      v5 = 1;
    else
      v5 = !v3;
    if (!v5)
    {
      kdebug_trace();
      v6 = objc_alloc_init(SBApplicationController);
      v7 = (void *)_sharedInstanceCreateIfNecessary__sharedApplicationController;
      _sharedInstanceCreateIfNecessary__sharedApplicationController = (uint64_t)v6;

      kdebug_trace();
    }
    pthread_mutex_unlock(&_sharedInstanceCreateIfNecessary__sharedApplicationControllerLock);
    v4 = (id)_sharedInstanceCreateIfNecessary__sharedApplicationController;
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

+ (SBApplicationController)sharedInstance
{
  return (SBApplicationController *)objc_msgSend(a1, "_sharedInstanceCreateIfNecessary:", 1);
}

- (BOOL)_appLayoutContainsOnlyResizableApps:(id)a3
{
  id v3;
  char v4;
  _QWORD v6[5];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v3 = a3;
  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 1;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __63__SBApplicationController__appLayoutContainsOnlyResizableApps___block_invoke;
  v6[3] = &unk_1E8EA6040;
  v6[4] = &v7;
  objc_msgSend(v3, "enumerate:", v6);
  v4 = *((_BYTE *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __63__SBApplicationController__appLayoutContainsOnlyResizableApps___block_invoke(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;

  if (a3)
  {
    v6 = a3;
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "applicationWithBundleIdentifier:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v11;
    if (v11)
    {
      v10 = objc_msgSend(v11, "supportsChamoisViewResizing");
      v9 = v11;
      if ((v10 & 1) == 0)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
        *a4 = 1;
      }
    }

  }
}

void __65__SBApplicationController__updateVisibilityOverridesInBackground__block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  _QWORD block[5];
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(a1 + 32), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v5 |= objc_msgSend(v8, "update");

      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);

    if ((v5 & 1) != 0)
    {
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __65__SBApplicationController__updateVisibilityOverridesInBackground__block_invoke_2;
      block[3] = &unk_1E8E9DED8;
      block[4] = *(_QWORD *)(a1 + 40);
      dispatch_async(MEMORY[0x1E0C80D38], block);
    }
  }
  else
  {

  }
}

- (id)restrictionController
{
  return self->_restrictionController;
}

- (id)setupApplication
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.purplebuddy"));
}

- (id)dataActivationApplication
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.DataActivation"));
}

- (id)cameraApplication
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.camera"));
}

- (void)_updateVisibilityOverridesInBackground
{
  void *v3;
  NSObject *v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBApplicationController *v8;

  v3 = (void *)-[NSMutableDictionary copy](self->_systemAppsVisibilityOverrides, "copy");
  dispatch_get_global_queue(25, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SBApplicationController__updateVisibilityOverridesInBackground__block_invoke;
  v6[3] = &unk_1E8E9E820;
  v7 = v3;
  v8 = self;
  v5 = v3;
  dispatch_async(v4, v6);

}

- (SBApplicationController)init
{
  SBApplicationController *v2;
  SBApplicationController *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *applicationsByBundleIdentifier;
  SBApplicationRestrictionController *v6;
  SBApplicationRestrictionController *restrictionController;
  NSMutableDictionary *v8;
  NSMutableDictionary *systemAppsVisibilityOverrides;
  NSSet *v10;
  NSSet *preventLaunchBundleIDs;
  SBReverseCountedSemaphore *v12;
  SBReverseCountedSemaphore *uninstallationReverseSemaphore;
  void *v14;
  uint64_t v15;
  SBApplicationController *v16;
  uint64_t v17;
  RBSProcessMonitor *processMonitor;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  FBSApplicationLibrary *appLibrary;
  FBSApplicationLibrary *v24;
  void *v25;
  uint64_t v26;
  SBApplicationInfo *systemAppInfo;
  void *v28;
  SBSplashBoardController *v29;
  SBSplashBoardLaunchRequestProvider *v30;
  uint64_t v31;
  SBSplashBoardController *splashBoardController;
  SBApplicationLibraryObserver *v33;
  SBApplicationLibraryObserver *appLibraryObserver;
  __CFNotificationCenter *DarwinNotifyCenter;
  void *v36;
  void *v37;
  void *v38;
  SBApplicationController *v39;
  SBAppProtectionCoordinator *v40;
  SBAppProtectionCoordinator *appProtectionCoordinator;
  uint64_t v42;
  SBApplicationRestrictionMonitoringServer *restrictionMonitoringServer;
  _QWORD v45[4];
  SBApplicationController *v46;
  _QWORD v47[4];
  char v48;
  _QWORD v49[4];
  SBApplicationController *v50;
  objc_super v51;

  v51.receiver = self;
  v51.super_class = (Class)SBApplicationController;
  v2 = -[SBApplicationController init](&v51, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_applicationsLock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    applicationsByBundleIdentifier = v3->_applicationsByBundleIdentifier;
    v3->_applicationsByBundleIdentifier = v4;

    v6 = -[SBApplicationRestrictionController initWithDataSource:]([SBApplicationRestrictionController alloc], "initWithDataSource:", v3);
    restrictionController = v3->_restrictionController;
    v3->_restrictionController = v6;

    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    systemAppsVisibilityOverrides = v3->_systemAppsVisibilityOverrides;
    v3->_systemAppsVisibilityOverrides = v8;

    v10 = (NSSet *)objc_alloc_init(MEMORY[0x1E0C99E60]);
    preventLaunchBundleIDs = v3->_preventLaunchBundleIDs;
    v3->_preventLaunchBundleIDs = v10;

    v12 = objc_alloc_init(SBReverseCountedSemaphore);
    uninstallationReverseSemaphore = v3->_uninstallationReverseSemaphore;
    v3->_uninstallationReverseSemaphore = v12;

    v14 = (void *)MEMORY[0x1E0D87D90];
    v15 = MEMORY[0x1E0C809B0];
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __31__SBApplicationController_init__block_invoke;
    v49[3] = &unk_1E8EA33B0;
    v16 = v3;
    v50 = v16;
    objc_msgSend(v14, "monitorWithConfiguration:", v49);
    v17 = objc_claimAutoreleasedReturnValue();
    processMonitor = v16->_processMonitor;
    v16->_processMonitor = (RBSProcessMonitor *)v17;

    v19 = (void *)MEMORY[0x1E0D23068];
    +[SBApplication _appStateKeysToPrefetch](SBApplication, "_appStateKeysToPrefetch");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPrefetchedKeys:", v20);

    v21 = objc_alloc_init(MEMORY[0x1E0D23080]);
    objc_msgSend(v21, "setApplicationInfoClass:", objc_opt_class());
    objc_msgSend(v21, "setApplicationPlaceholderClass:", objc_opt_class());
    objc_msgSend(v21, "setAllowConcurrentLoading:", 1);
    v47[0] = v15;
    v47[1] = 3221225472;
    v47[2] = __31__SBApplicationController_init__block_invoke_35;
    v47[3] = &__block_descriptor_33_e28_B16__0__LSApplicationProxy_8l;
    v48 = objc_msgSend(MEMORY[0x1E0D44730], "inUserSessionLoginUI");
    objc_msgSend(v21, "setInstalledApplicationFilter:", v47);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x1E0D23078]), "initWithConfiguration:", v21);
    appLibrary = v16->_appLibrary;
    v16->_appLibrary = (FBSApplicationLibrary *)v22;

    v24 = v16->_appLibrary;
    FBSystemAppBundleID();
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSApplicationLibrary installedApplicationWithBundleIdentifier:](v24, "installedApplicationWithBundleIdentifier:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    systemAppInfo = v16->_systemAppInfo;
    v16->_systemAppInfo = (SBApplicationInfo *)v26;

    objc_msgSend(MEMORY[0x1E0D228F8], "mainConfiguration");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = [SBSplashBoardController alloc];
    v30 = -[SBSplashBoardLaunchRequestProvider initWithApplicationController:displayConfiguration:]([SBSplashBoardLaunchRequestProvider alloc], "initWithApplicationController:displayConfiguration:", v16, v28);
    v31 = -[XBApplicationController initWithMainDisplayConfiguration:applicationProvider:launchRequestProvider:](v29, "initWithMainDisplayConfiguration:applicationProvider:launchRequestProvider:", v28, v16, v30);
    splashBoardController = v16->_splashBoardController;
    v16->_splashBoardController = (SBSplashBoardController *)v31;

    v33 = -[SBApplicationLibraryObserver initWithAppLibrary:splashBoardController:]([SBApplicationLibraryObserver alloc], "initWithAppLibrary:splashBoardController:", v16->_appLibrary, v16->_splashBoardController);
    appLibraryObserver = v16->_appLibraryObserver;
    v16->_appLibraryObserver = v33;

    -[SBApplicationLibraryObserver addApplicationLifecycleObserver:](v16->_appLibraryObserver, "addApplicationLifecycleObserver:", v16);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v16, (CFNotificationCallback)_appIconVisibilityPreferencesChanged, CFSTR("com.apple.springboard.appIconVisibilityPreferencesChanged"), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    kdebug_trace();
    -[FBSApplicationLibrary allInstalledApplications](v16->_appLibrary, "allInstalledApplications");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationController _loadApplications:remove:](v16, "_loadApplications:remove:", v36, 0);

    kdebug_trace();
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "addObserver:selector:name:object:", v16, sel__memoryWarningReceived, *MEMORY[0x1E0CEB298], 0);
    if (__SBShouldClearSystemAppSnapshotsWhenInitialized)
      -[SBApplicationController _finishDeferredMajorVersionMigrationTasks_FlushSystemSnapshots](v16, "_finishDeferredMajorVersionMigrationTasks_FlushSystemSnapshots");
    if (__SBShouldClearAllLegacySnapshotsWhenInitialized)
      -[SBApplicationController _finishDeferredMajorVersionMigrationTasks_FlushLegacySnapshots](v16, "_finishDeferredMajorVersionMigrationTasks_FlushLegacySnapshots");
    objc_msgSend(MEMORY[0x1E0DA9E80], "sharedInstance");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v15;
    v45[1] = 3221225472;
    v45[2] = __31__SBApplicationController_init__block_invoke_2_47;
    v45[3] = &unk_1E8E9DED8;
    v39 = v16;
    v46 = v39;
    objc_msgSend(v38, "performAfterFirstUnlockSinceBootUsingBlock:", v45);

    v40 = objc_alloc_init(SBAppProtectionCoordinator);
    appProtectionCoordinator = v39->_appProtectionCoordinator;
    v39->_appProtectionCoordinator = v40;

    v42 = objc_opt_new();
    restrictionMonitoringServer = v39->_restrictionMonitoringServer;
    v39->_restrictionMonitoringServer = (SBApplicationRestrictionMonitoringServer *)v42;

    -[SBApplicationRestrictionController addObserver:](v3->_restrictionController, "addObserver:", v39->_restrictionMonitoringServer);
  }
  return v3;
}

void __31__SBApplicationController_init__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "setEvents:", 2);
  objc_msgSend(MEMORY[0x1E0D87DA0], "predicateMatchingProcessTypeApplication");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicates:", v5);

  objc_msgSend(v3, "setServiceClass:", 33);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SBApplicationController_init__block_invoke_2;
  v6[3] = &unk_1E8EA8940;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setPreventLaunchUpdateHandle:", v6);

}

void __31__SBApplicationController_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  id v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __31__SBApplicationController_init__block_invoke_3;
  v6[3] = &unk_1E8E9E820;
  v7 = v4;
  v8 = *(id *)(a1 + 32);
  v5 = v4;
  dispatch_async(MEMORY[0x1E0C80D38], v6);

}

void __31__SBApplicationController_init__block_invoke_3(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  _BOOL4 v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t k;
  uint64_t v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  void *v31;
  void *v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  uint64_t v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v43 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v8, "bundleIdentifier");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "bundleIdentifier");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v10);
        }
        else
        {
          objc_msgSend(v8, "processIdentity");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "embeddedApplicationIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11)
          {
            objc_msgSend(v10, "embeddedApplicationIdentifier");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v2, "addObject:", v12);

          }
        }

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v5);
  }

  v13 = (void *)objc_msgSend(v2, "mutableCopy");
  objc_msgSend(v13, "minusSet:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 96));
  v32 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 96), "mutableCopy");
  objc_msgSend(v32, "minusSet:", v2);
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 96), v2);
  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v39 != v16)
          objc_enumerationMutation(obj);
        v18 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(*(id *)(a1 + 40), "applicationWithBundleIdentifier:", v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogCommon();
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
        if (v19)
        {
          if (v21)
          {
            *(_DWORD *)buf = 138543362;
            v48 = v18;
            _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "termination assertion acquired for %{public}@", buf, 0xCu);
          }

          objc_msgSend(v19, "_setLaunchPrevented:", 1);
        }
        else
        {
          if (v21)
          {
            *(_DWORD *)buf = 138543362;
            v48 = v18;
            _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "termination assertion acquired for %{public}@ (app not found)", buf, 0xCu);
          }

        }
      }
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v49, 16);
    }
    while (v15);
  }

  v36 = 0u;
  v37 = 0u;
  v34 = 0u;
  v35 = 0u;
  v22 = v32;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v35;
    do
    {
      for (k = 0; k != v24; ++k)
      {
        if (*(_QWORD *)v35 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * k);
        objc_msgSend(*(id *)(a1 + 40), "applicationWithBundleIdentifier:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        SBLogCommon();
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT);
        if (v28)
        {
          if (v30)
          {
            *(_DWORD *)buf = 138543362;
            v48 = v27;
            _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "termination assertion released for %{public}@", buf, 0xCu);
          }

          objc_msgSend(v28, "_setLaunchPrevented:", 0);
        }
        else
        {
          if (v30)
          {
            *(_DWORD *)buf = 138543362;
            v48 = v27;
            _os_log_impl(&dword_1D0540000, v29, OS_LOG_TYPE_DEFAULT, "termination assertion released for %{public}@ (app not found)", buf, 0xCu);
          }

        }
        objc_msgSend((id)SBApp, "applicationAutoLaunchService");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "_noteTerminationAssertionRemovedForApplication:", v28);

      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v34, v46, 16);
    }
    while (v24);
  }

}

uint64_t __31__SBApplicationController_init__block_invoke_35(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = a2;
  v4 = v3;
  if (!*(_BYTE *)(a1 + 32))
  {
    objc_msgSend(v3, "correspondingApplicationRecord");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "managementDomain");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v6 = !v7 || objc_msgSend(v7, "isEqualToString:", *MEMORY[0x1E0CA57C8]);
    goto LABEL_9;
  }
  objc_msgSend(v3, "bundleIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("com.apple.LoginUI")) & 1) == 0)
  {
    objc_msgSend(v4, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    FBSystemAppBundleID();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v8, "isEqualToString:", v9);

LABEL_9:
    goto LABEL_10;
  }
  v6 = 1;
LABEL_10:

  return v6;
}

void __31__SBApplicationController_init__block_invoke_2_47(uint64_t a1)
{
  dispatch_time_t v2;
  _QWORD block[4];
  id v4;

  v2 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __31__SBApplicationController_init__block_invoke_3_48;
  block[3] = &unk_1E8E9DED8;
  v4 = *(id *)(a1 + 32);
  dispatch_after(v2, MEMORY[0x1E0C80D38], block);

}

uint64_t __31__SBApplicationController_init__block_invoke_3_48(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateVisibilityOverridesInBackground");
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationController.m"), 285, CFSTR("%@ does not dealloc"), objc_opt_class());

  v5.receiver = self;
  v5.super_class = (Class)SBApplicationController;
  -[SBApplicationController dealloc](&v5, sel_dealloc);
}

- (id)allBundleIdentifiers
{
  os_unfair_lock_s *p_applicationsLock;
  void *v4;

  p_applicationsLock = &self->_applicationsLock;
  os_unfair_lock_lock(&self->_applicationsLock);
  -[NSMutableDictionary allKeys](self->_applicationsByBundleIdentifier, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_applicationsLock);
  return v4;
}

- (void)uninstallApplication:(id)a3
{
  void *v4;
  NSObject *v5;
  void *v6;
  FBSApplicationLibrary *appLibrary;
  _QWORD v8[5];
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Uninstall application: %{public}@", buf, 0xCu);
  }

  -[SBApplicationController _removeApplicationsFromModelWithBundleIdentifier:forInstall:withReason:](self, "_removeApplicationsFromModelWithBundleIdentifier:forInstall:withReason:", v4, 0, CFSTR("User Requested"));
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationController _sendInstalledAppsDidChangeNotification:removed:replaced:updated:](self, "_sendInstalledAppsDidChangeNotification:removed:replaced:updated:", 0, v6, 0, 0);

  -[SBReverseCountedSemaphore increment](self->_uninstallationReverseSemaphore, "increment");
  appLibrary = self->_appLibrary;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48__SBApplicationController_uninstallApplication___block_invoke;
  v8[3] = &unk_1E8E9E980;
  v8[4] = self;
  -[FBSApplicationLibrary uninstallApplication:completion:](appLibrary, "uninstallApplication:completion:", v4, v8);

}

uint64_t __48__SBApplicationController_uninstallApplication___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 88), "decrement");
}

- (void)requestUninstallApplication:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  id v8;
  id v9;

  v8 = a5;
  objc_msgSend(a3, "bundleIdentifier");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[SBApplicationController requestUninstallApplicationWithBundleIdentifier:options:withCompletion:](self, "requestUninstallApplicationWithBundleIdentifier:options:withCompletion:", v9, a4, v8);

}

- (void)requestUninstallApplicationWithBundleIdentifier:(id)a3 options:(unint64_t)a4 withCompletion:(id)a5
{
  char v6;
  id v8;
  id v9;
  SBApplicationLibraryObserver *appLibraryObserver;
  void *v11;
  void *v12;
  id v13;
  FBSApplicationLibrary *appLibrary;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  appLibraryObserver = self->_appLibraryObserver;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("requesting uninstall of %@"), v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationLibraryObserver suspendCalloutsAssertionWithReason:](appLibraryObserver, "suspendCalloutsAssertionWithReason:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = objc_alloc_init(MEMORY[0x1E0D23088]);
  objc_msgSend(v13, "setUserInitiated:", 1);
  if ((v6 & 1) != 0)
    objc_msgSend(v13, "setShowsArchiveOption:", 1);
  appLibrary = self->_appLibrary;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __98__SBApplicationController_requestUninstallApplicationWithBundleIdentifier_options_withCompletion___block_invoke;
  v17[3] = &unk_1E8E9F688;
  v18 = v12;
  v19 = v9;
  v15 = v12;
  v16 = v9;
  -[FBSApplicationLibrary uninstallApplication:withOptions:completion:](appLibrary, "uninstallApplication:withOptions:completion:", v8, v13, v17);

}

void __98__SBApplicationController_requestUninstallApplicationWithBundleIdentifier_options_withCompletion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD block[4];
  id v6;
  id v7;
  id v8;

  v3 = a2;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __98__SBApplicationController_requestUninstallApplicationWithBundleIdentifier_options_withCompletion___block_invoke_2;
  block[3] = &unk_1E8EA7D10;
  v6 = v3;
  v8 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 32);
  v4 = v3;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __98__SBApplicationController_requestUninstallApplicationWithBundleIdentifier_options_withCompletion___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  id v8;

  v2 = *(void **)(a1 + 32);
  if (v2)
  {
    objc_msgSend(v2, "userInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectForKey:", *MEMORY[0x1E0CB3388]);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "domain");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0D22BF0]))
      v5 = objc_msgSend(v8, "code") == 4;
    else
      v5 = 0;

    v7 = *(_QWORD *)(a1 + 48);
    if (v7)
      (*(void (**)(uint64_t, _QWORD, _BOOL8, _QWORD))(v7 + 16))(v7, 0, v5, 0);
    objc_msgSend(*(id *)(a1 + 40), "invalidate");

  }
  else
  {
    v6 = *(_QWORD *)(a1 + 48);
    if (v6)
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(v6 + 16))(v6, 1, 0, *(_QWORD *)(a1 + 40));
    else
      objc_msgSend(*(id *)(a1 + 40), "invalidate");
  }
}

- (void)waitForUninstallsToComplete:(double)a3
{
  NSObject *v3;

  if (!-[SBReverseCountedSemaphore waitWithTimeout:](self->_uninstallationReverseSemaphore, "waitWithTimeout:", a3))
  {
    SBLogAppLibrary();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      -[SBApplicationController waitForUninstallsToComplete:].cold.1(v3);

  }
}

- (id)alwaysAvailableApplicationBundleIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  -[SBApplicationController allApplications](self, "allApplications", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isInternalApplication") & 1) != 0
          || objc_msgSend(v9, "isSystemApplication"))
        {
          objc_msgSend(v9, "info");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v10, "hasHiddenTag"))
          {

          }
          else
          {
            v11 = objc_msgSend(v9, "isSetup");

            if (!v11)
              continue;
          }
          objc_msgSend(v9, "bundleIdentifier");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v12);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v6);
  }

  v13 = (void *)objc_msgSend(v3, "copy");
  return v13;
}

- (id)musicApplication
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.Music"));
}

- (id)mobilePhone
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.mobilephone"));
}

- (id)faceTimeApp
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.facetime"));
}

- (id)inCallServiceApp
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.InCallService"));
}

- (id)clockApplication
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.mobiletimer"));
}

- (id)iPodOutApplication
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.iphoneos.iPodOut"));
}

- (id)mapsApplication
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.Maps"));
}

- (id)webApplication
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.webapp"));
}

- (id)loginApplication
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.LoginUI"));
}

- (id)testFlightApplication
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.TestFlight"));
}

- (id)notesApplication
{
  return -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", CFSTR("com.apple.mobilenotes"));
}

- (id)allSplashBoardApplications
{
  return -[SBApplicationController _allApplicationsFilteredBySystem:](self, "_allApplicationsFilteredBySystem:", 0);
}

- (id)splashBoardSystemApplications
{
  return -[SBApplicationController _allApplicationsFilteredBySystem:](self, "_allApplicationsFilteredBySystem:", 1);
}

- (id)allInstalledApplications
{
  return (id)-[FBSApplicationLibrary allInstalledApplications](self->_appLibrary, "allInstalledApplications");
}

- (id)_allApplicationsFilteredBySystem:(BOOL)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v8[4];
  BOOL v9;

  -[FBSApplicationLibrary allInstalledApplications](self->_appLibrary, "allInstalledApplications");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __60__SBApplicationController__allApplicationsFilteredBySystem___block_invoke;
    v8[3] = &__block_descriptor_33_e34_B32__0__SBApplicationInfo_8Q16_B24l;
    v9 = a3;
    objc_msgSend(v4, "indexesOfObjectsPassingTest:", v8);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectsAtIndexes:", v5);
    v6 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v6;
  }
  return v4;
}

uint64_t __60__SBApplicationController__allApplicationsFilteredBySystem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 32) && objc_msgSend(v3, "type") != 1)
    v5 = 0;
  else
    v5 = objc_msgSend(v4, "usesSplashBoard");

  return v5;
}

- (id)recentlyUsedBundleIDs
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recentAppLayouts");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __48__SBApplicationController_recentlyUsedBundleIDs__block_invoke;
  v7[3] = &unk_1E8EA89A8;
  v5 = v4;
  v8 = v5;
  objc_msgSend(v3, "enumerateObjectsUsingBlock:", v7);

  return v5;
}

void __48__SBApplicationController_recentlyUsedBundleIDs__block_invoke(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __48__SBApplicationController_recentlyUsedBundleIDs__block_invoke_2;
  v3[3] = &unk_1E8EA43C0;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "enumerate:", v3);

}

void __48__SBApplicationController_recentlyUsedBundleIDs__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (!objc_msgSend(v6, "type"))
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v6, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
}

- (id)_splashBoardController
{
  return self->_splashBoardController;
}

- (id)_appProtectionCoordinator
{
  return self->_appProtectionCoordinator;
}

- (id)_appLibrary
{
  return self->_appLibrary;
}

- (id)_appLibraryObserver
{
  return self->_appLibraryObserver;
}

- (id)_applicationRestrictionMonitoringServer
{
  return self->_restrictionMonitoringServer;
}

+ (void)_setClearSystemAppSnapshotsWhenLoaded:(BOOL)a3
{
  __SBShouldClearSystemAppSnapshotsWhenInitialized = a3;
}

+ (void)_setClearAllLegacySnapshotsWhenLoaded:(BOOL)a3
{
  __SBShouldClearAllLegacySnapshotsWhenInitialized = a3;
}

- (void)_finishDeferredMajorVersionMigrationTasks_FlushSystemSnapshots
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  os_activity_scope_state_s state;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1D0540000, "XBMigration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SBApplicationController allApplications](self, "allApplications", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * i);
        if ((objc_msgSend(v8, "isSystemApplication") & 1) != 0
          || objc_msgSend(v8, "isInternalApplication"))
        {
          objc_msgSend(v8, "flushSnapshotsForAllScenes");
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v14, 16);
    }
    while (v5);
  }

  os_activity_scope_leave(&state);
}

- (void)_finishDeferredMajorVersionMigrationTasks_FlushLegacySnapshots
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  os_activity_scope_state_s state;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  v3 = _os_activity_create(&dword_1D0540000, "XBMigration", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  os_activity_scope_enter(v3, &state);

  v10 = 0u;
  v11 = 0u;
  v8 = 0u;
  v9 = 0u;
  -[SBApplicationController allApplications](self, "allApplications", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "flushSnapshotsForAllScenesIncludingAllLegacyImages");
      }
      while (v5 != v7);
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v8, v13, 16);
    }
    while (v5);
  }

  os_activity_scope_leave(&state);
}

- (void)_memoryWarningReceived
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  -[SBApplicationController allApplications](self, "allApplications", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "purgeCaches");
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)_sendInstalledAppsDidChangeNotification:(id)a3 removed:(id)a4 replaced:(id)a5 updated:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;
  __int16 v24;
  id v25;
  __int16 v26;
  id v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  if (v10 && objc_msgSend(v10, "count"))
    objc_msgSend(v14, "setObject:forKey:", v10, CFSTR("SBInstalledApplicationsAddedBundleIDs"));
  if (v12 && objc_msgSend(v12, "count"))
    objc_msgSend(v14, "setObject:forKey:", v12, CFSTR("SBInstalledApplicationsReplacedBundleIDs"));
  if (v13 && objc_msgSend(v13, "count"))
    objc_msgSend(v14, "setObject:forKey:", v13, CFSTR("SBInstalledApplicationsUpdatedBundleIDs"));
  if (v11 && objc_msgSend(v11, "count"))
    objc_msgSend(v14, "setObject:forKey:", v11, CFSTR("SBInstalledApplicationsRemovedBundleIDs"));
  objc_msgSend(v14, "allKeys");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "count");

  if (v16)
  {
    -[SBApplicationRestrictionController noteApplicationIdentifiersDidChangeWithAdded:replaced:removed:](self->_restrictionController, "noteApplicationIdentifiersDidChangeWithAdded:replaced:removed:", v10, v12, v11);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "postNotificationName:object:userInfo:", CFSTR("SBInstalledApplicationsDidChangeNotification"), self, v14);

    SBLogAppLibrary();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      v20 = 138544130;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      v24 = 2114;
      v25 = v12;
      v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "Installed apps did change.\nAdded: %{public}@\nRemoved: %{public}@\nReplaced: %{public}@\nUpdated: %{public}@", (uint8_t *)&v20, 0x2Au);
    }

    SBLogCommon();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 138544130;
      v21 = v10;
      v22 = 2114;
      v23 = v11;
      v24 = 2114;
      v25 = v12;
      v26 = 2114;
      v27 = v13;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "Installed apps did change.\nAdded: %{public}@\nRemoved: %{public}@\nReplaced: %{public}@\nUpdated: %{public}@", (uint8_t *)&v20, 0x2Au);
    }

  }
}

- (Class)_appClassForInfo:(id)a3
{
  id v3;
  void *v4;
  objc_class *v5;

  v3 = a3;
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "type") == 1 && (objc_msgSend(v4, "isEqualToString:", CFSTR("com.apple.camera")) & 1) == 0)
    objc_msgSend(v3, "representsWebApplication");
  v5 = (objc_class *)(id)objc_opt_class();

  return v5;
}

- (id)_loadApplicationFromApplicationInfo:(id)a3
{
  id v4;
  _SBLoadApplicationResult *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  SBAppVisibilityPreferences *v19;
  NSSet *cachedSystemAppsWithVisibilityOverrideHidden;
  const char *v21;
  const char *v22;
  void *v24;

  v4 = a3;
  v5 = objc_alloc_init(_SBLoadApplicationResult);
  objc_msgSend(v4, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bundleURL");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "dataContainerURL");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "path");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", v6);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v5)
    v5->_update = v12 != 0;
  if (!v6
    || (objc_msgSend(v9, "pathExtension"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqualToString:", CFSTR("app")),
        v14,
        !v15))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: Unable to load application because there is no bundle identifier (id=%@) or the bundle is not an app bundle (url=%@) for application info %@."), v6, v7, v4);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_setProperty_nonatomic_copy(v5, v21, v16, 16);
    goto LABEL_24;
  }
  v16 = (void *)objc_msgSend(objc_alloc(-[SBApplicationController _appClassForInfo:](self, "_appClassForInfo:", v4)), "initWithApplicationInfo:", v4);
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: Unable to load application (id=%@) because SBApplication's initializer returned nil."), v6);
    goto LABEL_21;
  }
  if (objc_msgSend(v13, "isSystemApplication") && !objc_msgSend(v16, "isSystemApplication"))
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("ERROR: Attempt to replace system application with a user application, which is disallowed."), v6);
LABEL_21:
    v19 = (SBAppVisibilityPreferences *)objc_claimAutoreleasedReturnValue();
    if (v5)
      objc_setProperty_nonatomic_copy(v5, v22, v19, 16);
    goto LABEL_23;
  }
  if (v5)
    v5->_success = 1;
  v24 = v11;
  if (v13)
    -[SBApplicationController _removeApplicationsFromModelWithBundleIdentifier:forInstall:withReason:](self, "_removeApplicationsFromModelWithBundleIdentifier:forInstall:withReason:", v6, 1, CFSTR("Update"));
  os_unfair_lock_lock(&self->_applicationsLock);
  -[NSMutableDictionary setObject:forKey:](self->_applicationsByBundleIdentifier, "setObject:forKey:", v16, v6);
  os_unfair_lock_unlock(&self->_applicationsLock);
  objc_msgSend(v16, "info");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "visibilityOverride");

  if (v18)
  {
    v11 = v24;
    v19 = -[SBAppVisibilityPreferences initWithDefaultVisible:bundleID:containerPath:]([SBAppVisibilityPreferences alloc], "initWithDefaultVisible:bundleID:containerPath:", v18 == 1, v6, v24);
    if (v19)
    {
      -[NSMutableDictionary setObject:forKey:](self->_systemAppsVisibilityOverrides, "setObject:forKey:", v19, v6);
      if (!-[SBAppVisibilityPreferences isCurrentlyVisible](v19, "isCurrentlyVisible"))
      {
        cachedSystemAppsWithVisibilityOverrideHidden = self->_cachedSystemAppsWithVisibilityOverrideHidden;
        self->_cachedSystemAppsWithVisibilityOverrideHidden = 0;

      }
    }
LABEL_23:

    goto LABEL_24;
  }
  v11 = v24;
LABEL_24:

  return v5;
}

- (id)_appInfosToBundleIDs:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "bundleIdentifier", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (void)_loadApplications:(id)a3 remove:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  SBApplicationInfo *v14;
  void *v15;
  void *v16;
  SBApplicationInfo *systemAppInfo;
  NSObject *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __CFString *v32;
  __CFString *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  id obj;
  id v50;
  uint64_t v51;
  uint64_t v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t buf[4];
  id v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBApplicationController _preLoadApplications](self, "_preLoadApplications");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v6);
  objc_msgSend(v8, "removeObject:", self->_systemAppInfo);
  v50 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v45 = v7;
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithArray:", v7);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v62 != v12)
          objc_enumerationMutation(obj);
        v14 = *(SBApplicationInfo **)(*((_QWORD *)&v61 + 1) + 8 * i);
        -[FBSBundleInfo bundleIdentifier](v14, "bundleIdentifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        if (v16)
        {
          systemAppInfo = self->_systemAppInfo;

          if (v14 != systemAppInfo)
          {
            objc_msgSend(v8, "removeObject:", v14);
            objc_msgSend(v50, "addObject:", v14);
          }
        }
        else
        {

        }
      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v71, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v50, "count"))
  {
    SBLogAppLibrary();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v66 = v50;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_INFO, "Reloading application states for '%@' as they have been updated.", buf, 0xCu);
    }

  }
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v19 = v9;
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v58;
    do
    {
      for (j = 0; j != v21; ++j)
      {
        if (*(_QWORD *)v58 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v57 + 1) + 8 * j), "bundleIdentifier");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBApplicationController _removeApplicationsFromModelWithBundleIdentifier:forInstall:withReason:](self, "_removeApplicationsFromModelWithBundleIdentifier:forInstall:withReason:", v24, 0, CFSTR("Removed from the system."));

      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v57, v70, 16);
    }
    while (v21);
  }
  v46 = v19;

  v47 = v8;
  v25 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v8);
  objc_msgSend(v25, "unionSet:", v50);
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  v48 = v25;
  v52 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
  if (v52)
  {
    v51 = *(_QWORD *)v54;
    do
    {
      v26 = 0;
      do
      {
        if (*(_QWORD *)v54 != v51)
          objc_enumerationMutation(v48);
        v27 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v26);
        v28 = (void *)MEMORY[0x1D17E5334]();
        -[SBApplicationController _loadApplicationFromApplicationInfo:](self, "_loadApplicationFromApplicationInfo:", v27);
        v29 = objc_claimAutoreleasedReturnValue();
        v30 = v29;
        if (v29)
        {
          if (*(_BYTE *)(v29 + 9))
            v31 = 11;
          else
            v31 = 10;
          if (*(_BYTE *)(v29 + 8))
          {
            v32 = CFSTR("Application replaced");
            if (!*(_BYTE *)(v29 + 9))
              v32 = CFSTR("Application added");
          }
          else
          {
            v32 = *(__CFString **)(v29 + 16);
          }
        }
        else
        {
          v32 = 0;
          v31 = 10;
        }
        v33 = v32;
        v34 = (void *)MEMORY[0x1E0D4E420];
        objc_msgSend(v27, "bundleIdentifier");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "logStep:byParty:phase:success:forBundleID:description:", v31, 10, 3, 1, v35, v36);

        objc_msgSend(v27, "bundleIdentifier");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v30 || !*(_BYTE *)(v30 + 8))
        {
          SBLogAppLibrary();
          v38 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
          {
            if (v30)
              v39 = *(void **)(v30 + 16);
            else
              v39 = 0;
            *(_DWORD *)buf = 138543618;
            v66 = v37;
            v67 = 2114;
            v68 = v39;
            v40 = v39;
            _os_log_error_impl(&dword_1D0540000, v38, OS_LOG_TYPE_ERROR, "*** Application failed to load in 'loadApplications': %{public}@: %{public}@", buf, 0x16u);

          }
          objc_msgSend(v47, "removeObject:", v27);
          objc_msgSend(v50, "removeObject:", v27);
          objc_msgSend(v46, "addObject:", v27);
        }

        objc_autoreleasePoolPop(v28);
        ++v26;
      }
      while (v52 != v26);
      v41 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v53, v69, 16);
      v52 = v41;
    }
    while (v41);
  }

  -[SBApplicationController _appInfosToBundleIDs:](self, "_appInfosToBundleIDs:", v47);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationController _appInfosToBundleIDs:](self, "_appInfosToBundleIDs:", v50);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationController _appInfosToBundleIDs:](self, "_appInfosToBundleIDs:", v46);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationController _sendInstalledAppsDidChangeNotification:removed:replaced:updated:](self, "_sendInstalledAppsDidChangeNotification:removed:replaced:updated:", v42, v44, v43, 0);

}

- (void)_removeApplicationsFromModelWithBundleIdentifier:(id)a3 forInstall:(BOOL)a4 withReason:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSSet *cachedSystemAppsWithVisibilityOverrideHidden;
  id v16;

  v16 = a3;
  v8 = a5;
  if (!a4)
  {
    v9 = (void *)MEMORY[0x1E0D4E420];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Application removed for reason: %@"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "logStep:byParty:phase:success:forBundleID:description:", 12, 10, 3, 1, v16, v10);

  }
  -[SBApplicationController applicationWithBundleIdentifier:](self, "applicationWithBundleIdentifier:", v16);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11)
  {
    objc_msgSend(v11, "setUninstalled:", 1);
    if (!a4)
      SBWorkspaceKillApplication(v12, 0, CFSTR("uninstalling app"), 0);
  }
  -[NSMutableDictionary objectForKey:](self->_systemAppsVisibilityOverrides, "objectForKey:", v16);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    if ((objc_msgSend(v13, "isCurrentlyVisible") & 1) == 0)
    {
      cachedSystemAppsWithVisibilityOverrideHidden = self->_cachedSystemAppsWithVisibilityOverrideHidden;
      self->_cachedSystemAppsWithVisibilityOverrideHidden = 0;

    }
    -[NSMutableDictionary removeObjectForKey:](self->_systemAppsVisibilityOverrides, "removeObjectForKey:", v16);
  }
  os_unfair_lock_lock(&self->_applicationsLock);
  -[NSMutableDictionary removeObjectForKey:](self->_applicationsByBundleIdentifier, "removeObjectForKey:", v16);
  os_unfair_lock_unlock(&self->_applicationsLock);

}

- (void)_updateVisibilityOverrides
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSSet *cachedSystemAppsWithVisibilityOverrideHidden;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_systemAppsVisibilityOverrides;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_systemAppsVisibilityOverrides, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * i), (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 |= objc_msgSend(v9, "update");

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);

    if ((v6 & 1) != 0)
    {
      cachedSystemAppsWithVisibilityOverrideHidden = self->_cachedSystemAppsWithVisibilityOverrideHidden;
      self->_cachedSystemAppsWithVisibilityOverrideHidden = 0;

      -[SBApplicationRestrictionController noteVisibilityOverridesDidChange](self->_restrictionController, "noteVisibilityOverridesDidChange");
    }
  }
  else
  {

  }
}

uint64_t __65__SBApplicationController__updateVisibilityOverridesInBackground__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 32);
  *(_QWORD *)(v2 + 32) = 0;

  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "noteVisibilityOverridesDidChange");
}

- (void)applicationsAdded:(id)a3
{
  -[SBApplicationController _loadApplications:remove:](self, "_loadApplications:remove:", a3, 0);
}

- (void)applicationsReplaced:(id)a3
{
  -[SBApplicationController _loadApplications:remove:](self, "_loadApplications:remove:", a3, 0);
}

- (void)applicationsUpdated:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  uint64_t v23;
  void *v24;
  void *v25;
  os_unfair_lock_t lock;
  id obj;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  lock = &self->_applicationsLock;
  os_unfair_lock_lock(&self->_applicationsLock);
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v4;
  v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v33;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v33 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v12, "bundleIdentifier", lock);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBApplicationController _lock_applicationWithBundleIdentifier:](self, "_lock_applicationWithBundleIdentifier:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          objc_msgSend(v12, "bundleIdentifier");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v15);

          objc_msgSend(v12, "bundleIdentifier");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "setObject:forKey:", v14, v16);

          objc_msgSend(v12, "bundleIdentifier");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "setObject:forKey:", v12, v17);

        }
      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v9);
  }

  os_unfair_lock_unlock(lock);
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v18 = v5;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v23 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
        objc_msgSend(v6, "objectForKey:", v23, lock);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKey:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setInfo:", v25);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v20);
  }

  -[SBApplicationController _sendInstalledAppsDidChangeNotification:removed:replaced:updated:](self, "_sendInstalledAppsDidChangeNotification:removed:replaced:updated:", 0, 0, 0, v18);
}

- (void)applicationsRemoved:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  os_unfair_lock_lock(&self->_applicationsLock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v11, "bundleIdentifier", (_QWORD)v14);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBApplicationController _lock_applicationWithBundleIdentifier:](self, "_lock_applicationWithBundleIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          objc_msgSend(v5, "removeObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_applicationsLock);
  if (objc_msgSend(v5, "count"))
    -[SBApplicationController _loadApplications:remove:](self, "_loadApplications:remove:", 0, v5);

}

- (void)applicationsDemoted:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "mutableCopy");
  os_unfair_lock_lock(&self->_applicationsLock);
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v27 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v11, "bundleIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBApplicationController _lock_applicationWithBundleIdentifier:](self, "_lock_applicationWithBundleIdentifier:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v13)
          objc_msgSend(v5, "removeObject:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_applicationsLock);
  if (objc_msgSend(v5, "count"))
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = v5;
    v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v16; ++j)
        {
          if (*(_QWORD *)v23 != v17)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * j), "bundleIdentifier", (_QWORD)v22);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBApplicationController _removeApplicationsFromModelWithBundleIdentifier:forInstall:withReason:](self, "_removeApplicationsFromModelWithBundleIdentifier:forInstall:withReason:", v19, 0, CFSTR("Demotion"));

        }
        v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v16);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v14);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationController _appInfosToBundleIDs:](self, "_appInfosToBundleIDs:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBApplicationController _sendInstalledAppsDidChangeNotification:removed:replaced:updated:](self, "_sendInstalledAppsDidChangeNotification:removed:replaced:updated:", 0, v21, 0, 0);
  }

}

- (void)applicationRestrictionsMayHaveChanged
{
  -[SBApplicationRestrictionController noteRestrictionsMayHaveChanged](self->_restrictionController, "noteRestrictionsMayHaveChanged");
}

- (id)bundleIdentifiersWithVisibilityOverrideHidden
{
  NSSet *cachedSystemAppsWithVisibilityOverrideHidden;
  void *v4;
  NSMutableDictionary *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  NSSet *v13;
  NSSet *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  cachedSystemAppsWithVisibilityOverrideHidden = self->_cachedSystemAppsWithVisibilityOverrideHidden;
  if (!cachedSystemAppsWithVisibilityOverrideHidden)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithCapacity:", -[NSMutableDictionary count](self->_systemAppsVisibilityOverrides, "count"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v5 = self->_systemAppsVisibilityOverrides;
    v6 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v17 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          -[NSMutableDictionary objectForKey:](self->_systemAppsVisibilityOverrides, "objectForKey:", v10, (_QWORD)v16);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v11 && (objc_msgSend(v11, "isCurrentlyVisible") & 1) == 0)
            objc_msgSend(v4, "addObject:", v10);

        }
        v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v7);
    }

    v13 = (NSSet *)objc_msgSend(v4, "copy");
    v14 = self->_cachedSystemAppsWithVisibilityOverrideHidden;
    self->_cachedSystemAppsWithVisibilityOverrideHidden = v13;

    cachedSystemAppsWithVisibilityOverrideHidden = self->_cachedSystemAppsWithVisibilityOverrideHidden;
  }
  return cachedSystemAppsWithVisibilityOverrideHidden;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_restrictionMonitoringServer, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_preventLaunchBundleIDs, 0);
  objc_storeStrong((id *)&self->_uninstallationReverseSemaphore, 0);
  objc_storeStrong((id *)&self->_appProtectionCoordinator, 0);
  objc_storeStrong((id *)&self->_splashBoardController, 0);
  objc_storeStrong((id *)&self->_systemAppInfo, 0);
  objc_storeStrong((id *)&self->_appLibrary, 0);
  objc_storeStrong((id *)&self->_appLibraryObserver, 0);
  objc_storeStrong((id *)&self->_restrictionController, 0);
  objc_storeStrong((id *)&self->_cachedSystemAppsWithVisibilityOverrideHidden, 0);
  objc_storeStrong((id *)&self->_systemAppsVisibilityOverrides, 0);
  objc_storeStrong((id *)&self->_applicationsByBundleIdentifier, 0);
}

- (void)waitForUninstallsToComplete:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1D0540000, log, OS_LOG_TYPE_ERROR, "Timed out waiting for app uninstallation to complete", v1, 2u);
}

@end
