@implementation SBSystemShellEmbeddedDisplayController

- (SBSystemShellEmbeddedDisplayController)initWithAppSwitcherDefaults:(id)a3 sceneManager:(id)a4 initialOrientation:(int64_t)a5
{
  id v10;
  id v11;
  void *v12;
  SBSystemShellEmbeddedDisplayController *v13;
  SBSystemShellEmbeddedDisplayController *v14;
  SBAppSwitcherDefaults *appSwitcherDefaults;
  void *v16;
  uint64_t v17;
  id v18;
  id v19;
  void *v21;
  void *v22;
  _QWORD v23[4];
  id v24;
  id location;
  objc_super v26;

  v10 = a3;
  v11 = a4;
  v12 = v11;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellEmbeddedDisplayController.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appSwitcherDefaults"));

    if (v12)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellEmbeddedDisplayController.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("sceneManager"));

LABEL_3:
  v26.receiver = self;
  v26.super_class = (Class)SBSystemShellEmbeddedDisplayController;
  v13 = -[SBSystemShellEmbeddedDisplayController init](&v26, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_appSwitcherDefaults, a3);
    objc_storeStrong((id *)&v14->_sceneManager, a4);
    v14->_initialOrientation = a5;
    objc_initWeak(&location, v14);
    appSwitcherDefaults = v14->_appSwitcherDefaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "chamoisWindowingEnabled");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C80D38];
    v18 = MEMORY[0x1E0C80D38];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __102__SBSystemShellEmbeddedDisplayController_initWithAppSwitcherDefaults_sceneManager_initialOrientation___block_invoke;
    v23[3] = &unk_1E8E9DF28;
    objc_copyWeak(&v24, &location);
    v19 = (id)-[SBAppSwitcherDefaults observeDefault:onQueue:withBlock:](appSwitcherDefaults, "observeDefault:onQueue:withBlock:", v16, v17, v23);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

  return v14;
}

void __102__SBSystemShellEmbeddedDisplayController_initWithAppSwitcherDefaults_sceneManager_initialOrientation___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateDisplayAssertionPreferences");
    objc_msgSend(v2, "_updateSceneSettings");
    WeakRetained = v2;
  }

}

- (void)dealloc
{
  objc_super v3;

  -[SBDisplayAssertion invalidate](self->_displayAssertion, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBSystemShellEmbeddedDisplayController;
  -[SBSystemShellEmbeddedDisplayController dealloc](&v3, sel_dealloc);
}

- (id)displayControllerInfoForConnectingDisplay:(id)a3 configuration:(id)a4
{
  SBDisplayControllerInfo *v5;

  if (objc_msgSend(a3, "isMainRootDisplay"))
    v5 = -[SBDisplayControllerInfo initWithController:windowingMode:priorityLevel:deactivationReasons:]([SBDisplayControllerInfo alloc], "initWithController:windowingMode:priorityLevel:deactivationReasons:", self, 1, 2, 0);
  else
    v5 = 0;
  return v5;
}

- (void)connectToDisplayIdentity:(id)a3 configuration:(id)a4 displayManager:(id)a5 sceneManager:(id)a6 caDisplayQueue:(id)a7 assertion:(id)a8
{
  id v15;
  id v16;
  SBSceneManager *v17;
  id v18;
  SBDisplayAssertion *v19;
  FBSDisplayConfiguration *displayConfiguration;
  id v21;
  SBDisplayAssertion *displayAssertion;
  SBDisplayAssertion *v23;
  SBSceneManager *sbSceneManager;
  void *v25;
  void *v26;
  id v27;

  v27 = a3;
  v15 = a4;
  v16 = a5;
  v17 = (SBSceneManager *)a6;
  v18 = a7;
  v19 = (SBDisplayAssertion *)a8;
  if (self->_displayConfiguration)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellEmbeddedDisplayController.m"), 85, CFSTR("embedded display controller connecting twice to a display. already connected to: %@"), self->_displayConfiguration, v27);

  }
  if ((objc_msgSend(v15, "isMainRootDisplay") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellEmbeddedDisplayController.m"), 86, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[displayConfiguration isMainRootDisplay]"));

  }
  displayConfiguration = self->_displayConfiguration;
  self->_displayConfiguration = (FBSDisplayConfiguration *)v15;
  v21 = v15;

  displayAssertion = self->_displayAssertion;
  self->_displayAssertion = v19;
  v23 = v19;

  sbSceneManager = self->_sbSceneManager;
  self->_sbSceneManager = v17;

  -[SBSystemShellEmbeddedDisplayController _updateDisplayAssertionPreferences](self, "_updateDisplayAssertionPreferences");
}

- (void)displayIdentityDidDisconnect:(id)a3
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellEmbeddedDisplayController.m"), 101, CFSTR("told the embedded display disconnected. whoa."));

}

- (void)displayAssertionDidInvalidate:(id)a3
{
  id v5;

  if (!-[SBDisplayAssertion hasControlOfDisplay](self->_displayAssertion, "hasControlOfDisplay", a3))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellEmbeddedDisplayController.m"), 107, CFSTR("embedded display controller's assertion was invalidated."));

  }
}

- (void)displayAssertionDidGainControlOfDisplay:(id)a3
{
  FBScene *v5;
  FBScene *scene;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (self->_scene)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellEmbeddedDisplayController.m"), 111, CFSTR("embedded display controller's assertion was activated multiple times"));

  }
  -[SBSystemShellEmbeddedDisplayController _createSystemShellSceneWithOrientation:](self, "_createSystemShellSceneWithOrientation:", self->_initialOrientation);
  v5 = (FBScene *)objc_claimAutoreleasedReturnValue();
  scene = self->_scene;
  self->_scene = v5;

  -[FBScene systemShellHostingEnvironment](self->_scene, "systemShellHostingEnvironment");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSystemShellHostingSpaceIdentifier:", v8);

  if (!self->_scene)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellEmbeddedDisplayController.m"), 114, CFSTR("failed to create system shell scene for embedded display"));

  }
}

- (void)displayAssertion:(id)a3 didReceiveNewDeactivationReasons:(unint64_t)a4
{
  id v6;

  if (!-[SBDisplayAssertion hasControlOfDisplay](self->_displayAssertion, "hasControlOfDisplay", a3, a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellEmbeddedDisplayController.m"), 118, CFSTR("embedded display controller's assertion was deactivated somehow."));

  }
}

- (void)displayAssertion:(id)a3 didLoseControlOfDisplayForDeactivationReasons:(unint64_t)a4
{
  id v6;

  if (!-[SBDisplayAssertion hasControlOfDisplay](self->_displayAssertion, "hasControlOfDisplay", a3, a4))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellEmbeddedDisplayController.m"), 122, CFSTR("embedded display controller's assertion was deactivated somehow."));

  }
}

- (id)_createSystemShellSceneWithOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  _QWORD v18[5];
  _QWORD v19[5];

  objc_msgSend(MEMORY[0x1E0D23140], "definition");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0D231F0];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bundleIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identityForIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setIdentity:", v9);

  objc_msgSend(MEMORY[0x1E0D231C0], "localIdentity");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setClientIdentity:", v10);

  +[FBSSceneSpecification specification](SBApplicationSceneSpecification, "specification");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSpecification:", v11);

  v12 = (void *)MEMORY[0x1E0D23148];
  objc_msgSend(v5, "specification");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "parametersForSpecification:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __81__SBSystemShellEmbeddedDisplayController__createSystemShellSceneWithOrientation___block_invoke;
  v19[3] = &unk_1E8EA2A30;
  v19[4] = self;
  objc_msgSend(v14, "updateSettingsWithBlock:", v19);
  v18[0] = v15;
  v18[1] = 3221225472;
  v18[2] = __81__SBSystemShellEmbeddedDisplayController__createSystemShellSceneWithOrientation___block_invoke_2;
  v18[3] = &__block_descriptor_40_e39_v16__0__FBSMutableSceneClientSettings_8l;
  v18[4] = a3;
  objc_msgSend(v14, "updateClientSettingsWithBlock:", v18);
  -[FBSceneManager createSceneWithDefinition:initialParameters:](self->_sceneManager, "createSceneWithDefinition:initialParameters:", v5, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

void __81__SBSystemShellEmbeddedDisplayController__createSystemShellSceneWithOrientation___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "setDisplayConfiguration:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "bounds");
  objc_msgSend(v10, "setFrame:");
  objc_msgSend(v10, "setLevel:", 0.0);
  objc_msgSend(v10, "setForeground:", 1);
  objc_msgSend(v10, "setInterfaceOrientation:", 1);
  if (objc_msgSend(v10, "isUISubclass"))
  {
    v3 = v10;
    objc_msgSend(v3, "setTargetOfEventDeferringEnvironments:", 0);
    objc_msgSend(v3, "setInterfaceOrientationMode:", 100);
    v4 = (void *)SBApp;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "identity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "userInterfaceStyleProviderForDisplay:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v6, "currentStyle"));

    objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "sb_applyDisplayEdgeInfoToSceneSettings:", v3);
    objc_msgSend(v3, "setEnhancedWindowingEnabled:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "chamoisWindowingEnabled"));

  }
  objc_msgSend(v10, "ignoreOcclusionReasons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObject:", CFSTR("SystemApp"));

  objc_msgSend(v10, "transientLocalSettings");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setObject:forSetting:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), 4444);

}

void __81__SBSystemShellEmbeddedDisplayController__createSystemShellSceneWithOrientation___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  id v5;

  v5 = a2;
  if (objc_msgSend(v5, "isUISubclass"))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = v5;
    objc_msgSend(v4, "setInterfaceOrientation:", v3);
    objc_msgSend(v4, "setStatusBarStyle:", 0);

  }
}

- (void)_updateDisplayAssertionPreferences
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  SBDisplayAssertionPreferences *v9;

  v9 = objc_alloc_init(SBDisplayAssertionPreferences);
  -[SBDisplayAssertionPreferences setWantsControlOfDisplay:](v9, "setWantsControlOfDisplay:", 1);
  if (-[SBAppSwitcherDefaults chamoisWindowingEnabled](self->_appSwitcherDefaults, "chamoisWindowingEnabled"))v4 = 3;
  else
    v4 = 2;
  objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellEmbeddedDisplayController.m"), 178, CFSTR("-[CADisplay mainDisplay] returned nil. All's bad with the world."));

  }
  +[SBDisplayPowerLogEntry forDisplay:mode:zoom:](SBDisplayPowerLogEntry, "forDisplay:mode:zoom:", self->_displayConfiguration, v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayAssertionPreferences setPowerLogEntry:](v9, "setPowerLogEntry:", v6);
  -[SBDisplayAssertion updateWithPreferences:](self->_displayAssertion, "updateWithPreferences:", v9);
  if (!-[SBDisplayAssertion hasControlOfDisplay](self->_displayAssertion, "hasControlOfDisplay"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellEmbeddedDisplayController.m"), 185, CFSTR("embedded display controller failed to gain control of display"));

  }
}

- (void)_updateSceneSettings
{
  char v3;
  FBScene *scene;
  _QWORD v5[4];
  char v6;

  v3 = -[SBAppSwitcherDefaults chamoisWindowingEnabled](self->_appSwitcherDefaults, "chamoisWindowingEnabled");
  scene = self->_scene;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __62__SBSystemShellEmbeddedDisplayController__updateSceneSettings__block_invoke;
  v5[3] = &__block_descriptor_33_e33_v16__0__FBSMutableSceneSettings_8l;
  v6 = v3;
  -[FBScene updateSettingsWithBlock:](scene, "updateSettingsWithBlock:", v5);
}

void __62__SBSystemShellEmbeddedDisplayController__updateSceneSettings__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(v3, "isUISubclass"))
    objc_msgSend(v3, "setEnhancedWindowingEnabled:", *(unsigned __int8 *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayAssertion, 0);
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_sbSceneManager, 0);
  objc_storeStrong((id *)&self->_sceneManager, 0);
  objc_storeStrong((id *)&self->_appSwitcherDefaults, 0);
}

@end
