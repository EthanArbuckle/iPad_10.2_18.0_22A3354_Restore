@implementation SBApplicationSupportServiceRequestContext

+ (BOOL)shouldOverrideClientInitialization:(id)a3
{
  void *v3;
  void *v4;
  BOOL v5;

  objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", objc_msgSend(a3, "pid"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = +[SBSystemUIScenesCoordinator shouldHandleSceneRequestsForProcess:withOptions:](SBSystemUIScenesCoordinator, "shouldHandleSceneRequestsForProcess:withOptions:", v4, 0);
  else
    v5 = 0;

  return v5;
}

- (SBApplicationSupportServiceRequestContext)initWithApplication:(id)a3 launchDisplayConfiguration:(id)a4
{
  return -[SBApplicationSupportServiceRequestContext initWithApplication:launchDisplayConfiguration:persistenceIdentifierProvider:sceneIdentityProvider:sceneIdentityTokenProvider:](self, "initWithApplication:launchDisplayConfiguration:persistenceIdentifierProvider:sceneIdentityProvider:sceneIdentityTokenProvider:", a3, a4, 0, 0, 0);
}

- (SBApplicationSupportServiceRequestContext)initWithApplication:(id)a3 launchDisplayConfiguration:(id)a4 persistenceIdentifierProvider:(id)a5 sceneIdentityProvider:(id)a6 sceneIdentityTokenProvider:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  SBApplicationSupportServiceRequestContext *v17;
  SBApplicationSupportServiceRequestContext *v18;
  void *v20;
  id v22;
  objc_super v23;

  v13 = a3;
  v22 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBApplicationSupportServiceRequestContext.m"), 189, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("app"));

  }
  v23.receiver = self;
  v23.super_class = (Class)SBApplicationSupportServiceRequestContext;
  v17 = -[SBApplicationSupportServiceRequestContext init](&v23, sel_init);
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_app, a3);
    objc_storeStrong((id *)&v18->_launchDisplayConfiguration, a4);
    objc_storeStrong((id *)&v18->_preferredAppPersistenceIDProvider, a5);
    objc_storeStrong((id *)&v18->_preferredAppSceneIdentityProvider, a6);
    objc_storeStrong((id *)&v18->_preferredSceneIdentityTokenProvider, a7);
  }

  return v18;
}

- (id)_main_applicationInitializationContext
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  SBApplication *app;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  BSDispatchQueueAssertMain();
  -[SBApplicationSupportServiceRequestContext _main_embeddedDisplayContext](self, "_main_embeddedDisplayContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSupportServiceRequestContext _main_launchDisplayContext](self, "_main_launchDisplayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSupportServiceRequestContext _main_deviceContext](self, "_main_deviceContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSupportServiceRequestContext _main_persistenceIDs](self, "_main_persistenceIDs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0DC5BC8]);
  objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");

  v10 = (void *)objc_msgSend(v7, "initWithMainDisplayContext:launchDisplayContext:deviceContext:persistedSceneIdentifiers:supportAppSceneRequests:", v3, v4, v5, v6, (v9 & 0xFFFFFFFFFFFFFFFBLL) == 1);
  app = self->_app;
  if (app)
  {
    -[SBApplication info](app, "info");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "supportsMultiwindow");

    if ((v13 & 1) == 0)
    {
      -[SBApplicationSupportServiceRequestContext _main_appSceneIdentityProvider](self, "_main_appSceneIdentityProvider");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = (void *)objc_msgSend(v14, "newSceneIdentityForApplication:", self->_app);

      -[SBApplicationSupportServiceRequestContext _main_sceneIdentityTokenProvider](self, "_main_sceneIdentityTokenProvider");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "newSceneIdentityTokenForIdentity:", v15);

      objc_msgSend(v10, "setDefaultSceneToken:", v17);
    }
  }

  return v10;
}

- (id)_main_persistenceIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  BSDispatchQueueAssertMain();
  if (self->_app)
  {
    -[SBApplicationSupportServiceRequestContext _main_appPersistenceIDProvider](self, "_main_appPersistenceIDProvider");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplication bundleIdentifier](self->_app, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_persistenceIdentifiersForBundleIdentifier:onlyIncludeLaunchableIdentifiers:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)_main_launchDisplayContext
{
  void *v3;
  FBSDisplayConfiguration *launchDisplayConfiguration;
  void *v5;

  BSDispatchQueueAssertMain();
  -[SBApplicationSupportServiceRequestContext _main_effectiveApplicationForCompatibility](self, "_main_effectiveApplicationForCompatibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  launchDisplayConfiguration = self->_launchDisplayConfiguration;
  if (launchDisplayConfiguration
    && (-[FBSDisplayConfiguration isMainRootDisplay](launchDisplayConfiguration, "isMainRootDisplay") & 1) == 0
    && objc_msgSend(v3, "supportsChamoisOnExternalDisplay")
    && !_SBApplicationClassicModeIsClassic(-[SBApplicationSupportServiceRequestContext _main_effectiveClassicMode](self, "_main_effectiveClassicMode")))
  {
    -[SBApplicationSupportServiceRequestContext _main_displayContextForDisplayConfiguration:](self, "_main_displayContextForDisplayConfiguration:", self->_launchDisplayConfiguration);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_main_effectiveApplicationForCompatibility
{
  SBApplication *extensionContainingApp;

  BSDispatchQueueAssertMain();
  extensionContainingApp = self->_extensionContainingApp;
  if (!extensionContainingApp)
  {
    extensionContainingApp = self->_app;
    if (!extensionContainingApp)
      extensionContainingApp = self->_hostApp;
  }
  return extensionContainingApp;
}

- (id)_main_embeddedDisplayContext
{
  void *v3;

  BSDispatchQueueAssertMain();
  objc_msgSend(MEMORY[0x1E0DC5BD8], "sb_embeddedDisplayDefaultContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBApplicationSupportServiceRequestContext _main_applyClassicModeLiesIfNecessaryToDisplayContext:](self, "_main_applyClassicModeLiesIfNecessaryToDisplayContext:", v3);
  return v3;
}

- (void)_main_applyClassicModeLiesIfNecessaryToDisplayContext:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = -[SBApplicationSupportServiceRequestContext _main_effectiveClassicMode](self, "_main_effectiveClassicMode");
  if (_SBApplicationClassicModeIsClassic(v4))
  {
    objc_msgSend(v10, "displayConfiguration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBApplication restrictedClassicModeDisplayConfigurationForDisplayConfiguration:classicMode:](SBApplication, "restrictedClassicModeDisplayConfigurationForDisplayConfiguration:classicMode:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "setDisplayConfiguration:", v6);
    v7 = -[SBApplicationSupportServiceRequestContext _main_effectiveScreenType](self, "_main_effectiveScreenType");
    objc_msgSend(MEMORY[0x1E0DC5B80], "sb_displayEdgeInfoForScreenTypeConsideringCurrentDevice:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setDisplayEdgeInfo:", v8);

    objc_msgSend(MEMORY[0x1E0DC5BB8], "sb_displayShapeForScreenType:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setExclusionArea:", v9);

  }
}

- (id)_main_deviceContext
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;

  BSDispatchQueueAssertMain();
  v3 = -[SBApplicationSupportServiceRequestContext _main_effectiveClassicMode](self, "_main_effectiveClassicMode");
  if (_SBApplicationClassicModeIsClassic(v3))
  {
    objc_msgSend(MEMORY[0x1E0DC5BD0], "defaultContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA508], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if ((v6 & 0xFFFFFFFFFFFFFFFBLL) == 1 && SBApplicationClassicModeRepresentsPhone(v3))
      objc_msgSend(v4, "setDeviceInfoValue:forKey:", &unk_1E91D1640, *MEMORY[0x1E0DC5CB8]);
    if (SBFEffectiveHomeButtonType() == 2 && !SBApplicationClassicModeExpectsRoundedCorners(v3))
    {
      objc_msgSend(v4, "setDeviceInfoValue:forKey:", &unk_1E91D1658, *MEMORY[0x1E0DC5CD0]);
      objc_msgSend(v4, "setDeviceInfoValue:forKey:", &unk_1E91D1640, *MEMORY[0x1E0DC5CC0]);
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB37E8];
      -[SBApplicationSupportServiceRequestContext _main_effectiveScreenType](self, "_main_effectiveScreenType");
      SBHDisplayCornerRadiusForScreenType();
      objc_msgSend(v7, "numberWithDouble:");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setDeviceInfoValue:forKey:", v8, *MEMORY[0x1E0DC5CC0]);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC5BA8], "sb_defaultContext");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (int64_t)_main_effectiveClassicMode
{
  SBApplication *app;
  SBApplication *v4;
  SBApplication *extensionContainingApp;
  void *v6;
  int64_t v7;
  int64_t result;

  BSDispatchQueueAssertMain();
  app = self->_app;
  if (app)
  {
    v4 = app;
LABEL_4:
    extensionContainingApp = self->_extensionContainingApp;
    if (extensionContainingApp)
      v6 = -[SBApplication _classicModeForHostingExtensionContainedInApplication:](v4, extensionContainingApp);
    else
      v6 = -[SBApplication _classicMode](v4, "_classicMode");
    v7 = (int64_t)v6;

    return v7;
  }
  v4 = self->_hostApp;
  if (v4)
    goto LABEL_4;
  result = (int64_t)self->_extensionContainingApp;
  if (result)
    return (int64_t)-[SBApplication _classicModeForHostingExtensionContainedInThisApplicationInUnknownHostingHierarchy]((id *)result);
  return result;
}

- (id)_main_appPersistenceIDProvider
{
  SBApplicationSupportServiceRequestPersistenceIdentifierProvider *v3;

  BSDispatchQueueAssertMain();
  v3 = self->_preferredAppPersistenceIDProvider;
  if (!v3)
  {
    +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
    v3 = (SBApplicationSupportServiceRequestPersistenceIdentifierProvider *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_main_sceneIdentityTokenProvider
{
  SBApplicationSupportServiceRequestSceneIdentityTokenProvider *v3;

  BSDispatchQueueAssertMain();
  v3 = self->_preferredSceneIdentityTokenProvider;
  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0D22968], "sharedInstance");
    v3 = (SBApplicationSupportServiceRequestSceneIdentityTokenProvider *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_main_appSceneIdentityProvider
{
  SBApplicationSceneIdentityProviding *v3;

  BSDispatchQueueAssertMain();
  v3 = self->_preferredAppSceneIdentityProvider;
  if (!v3)
  {
    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v3 = (SBApplicationSceneIdentityProviding *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (unint64_t)_main_effectiveScreenType
{
  void *v3;
  uint64_t v4;
  unint64_t v5;

  BSDispatchQueueAssertMain();
  -[SBApplicationSupportServiceRequestContext _main_effectiveApplicationForCompatibility](self, "_main_effectiveApplicationForCompatibility");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
    v4 = -[SBApplication _screenTypeForClassicMode:]((uint64_t)v3, -[SBApplicationSupportServiceRequestContext _main_effectiveClassicMode](self, "_main_effectiveClassicMode"));
  else
    v4 = SBHScreenTypeForCurrentDevice();
  v5 = v4;

  return v5;
}

+ (id)hostingApplicationBundleIDForPid:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processForPID:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "_hostProcessForProcess:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "sb_isProbablyUIApplication"))
  {
    objc_msgSend(v7, "sb_bundleIdentifierWithFallback");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)_hostProcessForProcess:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (objc_msgSend(v3, "isExtensionProcess"))
  {
    v4 = v3;
    do
    {
      v5 = v4;
      objc_msgSend(v5, "hostProcess");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    while ((objc_msgSend(v4, "isExtensionProcess") & 1) != 0);
  }

  return v4;
}

+ (void)initializationContextForClient:(id)a3 completion:(id)a4
{
  id v7;
  void (**v8)(id, id);
  uint64_t v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  NSObject *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  void (**v29)(id, id);
  uint8_t buf[4];
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, id))a4;
  BSDispatchQueueAssertNotMain();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBApplicationSupportServiceRequestContext.m"), 135, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("client"));

  }
  v9 = objc_msgSend(v7, "pid");
  objc_msgSend(MEMORY[0x1E0D87D70], "identifierWithPid:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D87D68], "handleForIdentifier:error:", v10, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11
    || !+[SBSystemUIScenesCoordinator shouldHandleSceneRequestsForProcess:withOptions:](SBSystemUIScenesCoordinator, "shouldHandleSceneRequestsForProcess:withOptions:", v11, 0))
  {
    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "applicationWithPid:", v9);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v7, "bundleIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "applicationWithBundleIdentifier:", v17);
      v16 = (id)objc_claimAutoreleasedReturnValue();

    }
    SBLogCommon();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v16, "bundleIdentifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v31 = v19;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "Fetching initialization context for: %{public}@", buf, 0xCu);

    }
    if (v16)
    {
      if ((objc_msgSend(v16, "isSpotlight") & 1) != 0 || objc_msgSend(v16, "isPaperBoard"))
      {
        objc_msgSend(MEMORY[0x1E0DC5B60], "sb_embeddedDisplayDefaultContext");
        v20 = (id)objc_claimAutoreleasedReturnValue();
        v8[2](v8, v20);
LABEL_21:

        goto LABEL_22;
      }
      objc_msgSend(v16, "_initializationRequestContext");
      v20 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "applicationInitializationContextWithCompletion:", v8);
      SBLogClassicMode();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        +[SBApplicationSupportServiceRequestContext initializationContextForClient:completion:].cold.1(v9, v16, v25);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D22920], "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "processForPID:", v9);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend((id)objc_opt_class(), "_hostProcessForProcess:", v22);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithClient:host:", v22, v23);
      v29 = v8;
      v28 = v22;
      v24 = v23;
      v25 = v22;
      v20 = v27;
      BSDispatchMain();

    }
    goto LABEL_21;
  }
  SBLogCommon();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v31 = v7;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Providing init context for SystemUI Scene client: %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0DC5B60], "sb_embeddedDisplayDefaultContextForSystemUIScenes");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v13);
LABEL_22:

}

void __87__SBApplicationSupportServiceRequestContext_initializationContextForClient_completion___block_invoke(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;

  v2 = (id *)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 32), "applicationInitializationContextWithCompletion:", *(_QWORD *)(a1 + 56));
  SBLogClassicMode();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG);

  if (v4)
  {
    SBLogClassicMode();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      __87__SBApplicationSupportServiceRequestContext_initializationContextForClient_completion___block_invoke_cold_1(a1, v2, v5);

  }
}

- (SBApplicationSupportServiceRequestContext)initWithClient:(id)a3 host:(id)a4
{
  id v6;
  id v7;
  int v8;
  pid_t v9;
  void *v10;
  char v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  SBApplicationSupportServiceRequestContext *v23;
  SBApplicationSupportServiceRequestContext *v24;
  SBApplicationSupportServiceRequestContext *v25;
  objc_super v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "pid");
  v9 = getpid();
  if (v8 == v9)
  {
    FBSystemAppBundleID();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v6)
      goto LABEL_13;
  }
  else
  {
    objc_msgSend(v7, "sb_bundleIdentifierWithFallback");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v7, "sb_isProbablyUIApplication");
    if (v7)
      v12 = v11;
    else
      v12 = 1;

    v13 = 0;
    if (v7 == v6 || (v12 & 1) == 0)
      goto LABEL_16;
  }
  if (!objc_msgSend(v6, "isExtensionProcess"))
  {
LABEL_13:
    v13 = 0;
    goto LABEL_16;
  }
  objc_msgSend(v6, "sb_bundleIdentifierWithFallback");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CA58F0], "pluginKitProxyForIdentifier:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "containingBundle");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "bundleType");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CA5830]);

  if (v18)
  {
    objc_msgSend(v16, "bundleIdentifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v13 = 0;
  }

LABEL_16:
  +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "applicationWithBundleIdentifier:", v10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "applicationWithBundleIdentifier:", v13);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)v21;
  if (v8 == v9 || v20 || v21)
  {
    v27.receiver = self;
    v27.super_class = (Class)SBApplicationSupportServiceRequestContext;
    v24 = -[SBApplicationSupportServiceRequestContext init](&v27, sel_init);
    v25 = v24;
    if (v24)
    {
      objc_storeStrong((id *)&v24->_hostApp, v20);
      objc_storeStrong((id *)&v25->_extensionContainingApp, v22);
      v25->_hostIsSpringBoard = v8 == v9;
    }
    self = v25;
    v23 = self;
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (void)applicationInitializationContextWithCompletion:(id)a3
{
  void (**v4)(id, id);
  SBApplicationSupportServiceRequestContext *v5;
  NSObject *v6;
  void *v7;
  UISApplicationInitializationContext *v8;
  void (**v9)(id, id);
  uint8_t buf[4];
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, id))a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_selfLock_applicationInitializationContext)
  {
    SBLogCommon();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      -[SBApplication bundleIdentifier](v5->_app, "bundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v11 = v7;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Returning cached initialization context for %{public}@", buf, 0xCu);

    }
    v8 = v5->_selfLock_applicationInitializationContext;
  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v5);

  if (v8)
  {
    v4[2](v4, v8);
  }
  else
  {
    v9 = v4;
    BSDispatchMain();

  }
}

void __92__SBApplicationSupportServiceRequestContext_applicationInitializationContextWithCompletion___block_invoke(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  objc_sync_enter(v2);
  SBLogCommon();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Generating initialization context on main thread for: %{public}@", (uint8_t *)&v9, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "_main_applicationInitializationContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;
  v8 = v5;

  objc_sync_exit(v2);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (id)_main_displayContextForDisplayConfiguration:(id)a3
{
  void *v4;

  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0DC5BD8], "sb_defaultContextForDisplayConfiguration:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBApplicationSupportServiceRequestContext _main_applyClassicModeLiesIfNecessaryToDisplayContext:](self, "_main_applyClassicModeLiesIfNecessaryToDisplayContext:", v4);
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_preferredSceneIdentityTokenProvider, 0);
  objc_storeStrong((id *)&self->_preferredAppSceneIdentityProvider, 0);
  objc_storeStrong((id *)&self->_preferredAppPersistenceIDProvider, 0);
  objc_storeStrong((id *)&self->_launchDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_selfLock_applicationInitializationContext, 0);
  objc_storeStrong((id *)&self->_extensionContainingApp, 0);
  objc_storeStrong((id *)&self->_hostApp, 0);
  objc_storeStrong((id *)&self->_app, 0);
}

+ (void)initializationContextForClient:(NSObject *)a3 completion:.cold.1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v4;
  uint64_t v5;
  uint8_t v6[14];
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  v7 = v5;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "Using initialization context for client with pid: %ld app: %@", v6, 0x16u);

}

void __87__SBApplicationSupportServiceRequestContext_initializationContextForClient_completion___block_invoke_cold_1(uint64_t a1, id *a2, NSObject *a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  __int16 v7;
  uint64_t v8;
  uint8_t v9[14];
  uint64_t v10;
  __int16 v11;
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  SBApplicationClassicModeDescription(objc_msgSend(*a2, "_main_effectiveClassicMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_17();
  v10 = v4;
  v11 = v7;
  v12 = v5;
  v13 = v7;
  v14 = v8;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "Generated initialization context for client with pid: %ld clientProcess: %@ hostProcess: %@ classicMode: %@", v9, 0x2Au);

}

@end
