@implementation SBSceneSettingsUpdater

uint64_t __52__SBSceneSettingsUpdater_safeUpdateScene_withBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __52__SBSceneSettingsUpdater_safeUpdateScene_withBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

+ (void)safeUpdateScene:(id)a3 withBlock:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  _QWORD v15[4];
  id v16;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (!v7)
      goto LABEL_12;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSceneSettingsUpdater.m"), 171, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("updateBlock"));

    if (!v7)
      goto LABEL_12;
  }
  if (objc_msgSend(v7, "isValid"))
  {
    if (objc_msgSend(v7, "isActive"))
    {
      v15[0] = MEMORY[0x1E0C809B0];
      v15[1] = 3221225472;
      v15[2] = __52__SBSceneSettingsUpdater_safeUpdateScene_withBlock___block_invoke;
      v15[3] = &unk_1E8EA79D0;
      v16 = v8;
      objc_msgSend(v7, "performUpdate:", v15);
      v9 = v16;
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v7, "clientProcess");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __52__SBSceneSettingsUpdater_safeUpdateScene_withBlock___block_invoke_23;
      v13[3] = &unk_1E8EA7A20;
      v14 = v8;
      objc_msgSend(v7, "configureParameters:", v13);
      v9 = v14;
      goto LABEL_11;
    }
    SBLogCommon();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      +[SBSceneSettingsUpdater safeUpdateScene:withBlock:].cold.1((uint64_t)v7, v11);

  }
LABEL_12:

}

void __82__SBSceneSettingsUpdater_safeUpdateScene_withDisplayConfiguration_updateGeometry___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), CFSTR("SBSceneSettingsUpdater.m"), 154, CFSTR("Settings must be an UI subclass"));

  }
  objc_msgSend(*(id *)(a1 + 48), "__updateSceneSettings:forDisplayConfiguration:updateGeometry:", v4, *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56));

}

void __65__SBSceneSettingsUpdater_safeUpdateScene_withUserInterfaceStyle___block_invoke(_QWORD *a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_msgSend(v4, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", a1[4], a1[5], CFSTR("SBSceneSettingsUpdater.m"), 163, CFSTR("Settings must be an UI subclass"));

  }
  objc_msgSend(v4, "setUserInterfaceStyle:", a1[6]);

}

uint64_t __40__SBSceneSettingsUpdater_setForeground___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setForeground:", *(unsigned __int8 *)(a1 + 32));
}

- (void)setForeground:(BOOL)a3
{
  void *v5;
  id WeakRetained;
  _QWORD v7[4];
  BOOL v8;

  if (-[SBSceneSettingsUpdater isForeground](self, "isForeground") != a3)
  {
    v5 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __40__SBSceneSettingsUpdater_setForeground___block_invoke;
    v7[3] = &__block_descriptor_33_e73_v24__0__UIMutableApplicationSceneSettings_8__FBSSceneTransitionContext_16l;
    v8 = a3;
    objc_msgSend(v5, "safeUpdateScene:withBlock:", WeakRetained, v7);

  }
}

- (void)setDisplayConfiguration:(id)a3
{
  FBSDisplayConfiguration *v4;
  FBSDisplayConfiguration *displayConfiguration;
  SBTraitsSceneParticipantDelegate *sceneTraitsDelegate;
  TRAParticipant *traitsParticipant;
  void *v8;
  id WeakRetained;
  id v10;

  v10 = a3;
  if ((-[FBSDisplayConfiguration isEqual:](self->_displayConfiguration, "isEqual:") & 1) == 0)
  {
    v4 = (FBSDisplayConfiguration *)objc_msgSend(v10, "copy");
    displayConfiguration = self->_displayConfiguration;
    self->_displayConfiguration = v4;

    -[SBTraitsSceneParticipantDelegate invalidate](self->_sceneTraitsDelegate, "invalidate");
    -[TRAParticipant invalidate](self->_traitsParticipant, "invalidate");
    sceneTraitsDelegate = self->_sceneTraitsDelegate;
    self->_sceneTraitsDelegate = 0;

    traitsParticipant = self->_traitsParticipant;
    self->_traitsParticipant = 0;

    v8 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(v8, "safeUpdateScene:withDisplayConfiguration:updateGeometry:", WeakRetained, v10, self->_updatesGeometry);

    -[SBSceneSettingsUpdater _createTraitsParticipantIfNeededWithRole:](self, "_createTraitsParticipantIfNeededWithRole:", self->_traitsRole);
    -[SBTraitsSceneParticipantDelegate setOrientationActuationAnimatable:](self->_sceneTraitsDelegate, "setOrientationActuationAnimatable:", v10 != 0);
  }

}

- (void)setActive:(BOOL)a3 withTransitionContext:(id)a4
{
  _BOOL4 v4;
  FBScene **p_scene;
  id v6;
  id WeakRetained;
  id v8;

  v4 = a3;
  p_scene = &self->_scene;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_scene);
  v8 = WeakRetained;
  if (v4)
    objc_msgSend(WeakRetained, "activateWithTransitionContext:", v6);
  else
    objc_msgSend(WeakRetained, "deactivateWithTransitionContext:", v6);

}

- (SBTraitsSceneParticipantDelegate)sceneTraitsDelegate
{
  return self->_sceneTraitsDelegate;
}

- (BOOL)isForeground
{
  id WeakRetained;
  void *v3;
  char v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isForeground");

  return v4;
}

- (unint64_t)initialSupportedInterfaceOrientations
{
  return self->_initialSupportedInterfaceOrientations;
}

- (void)_createTraitsParticipantIfNeededWithRole:(id)a3
{
  void *v4;
  char v5;
  SBTraitsSceneParticipantDelegate *sceneTraitsDelegate;
  TRAParticipant *traitsParticipant;
  void *v8;
  FBSDisplayConfiguration *displayConfiguration;
  void *v10;
  id v11;

  v11 = a3;
  -[TRAParticipant role](self->_traitsParticipant, "role");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v11, "isEqualToString:", v4);

  if ((v5 & 1) == 0)
  {
    -[SBTraitsSceneParticipantDelegate invalidate](self->_sceneTraitsDelegate, "invalidate");
    -[TRAParticipant invalidate](self->_traitsParticipant, "invalidate");
    sceneTraitsDelegate = self->_sceneTraitsDelegate;
    self->_sceneTraitsDelegate = 0;

    traitsParticipant = self->_traitsParticipant;
    self->_traitsParticipant = 0;

  }
  v8 = v11;
  if (v11)
  {
    if (!self->_traitsParticipant)
    {
      displayConfiguration = self->_displayConfiguration;
      if (displayConfiguration)
      {
        if (self->_allowsTraitsArbitration)
        {
          -[FBSDisplayConfiguration identity](displayConfiguration, "identity");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBSceneSettingsUpdater __setupTraitsParticipantWithRole:displayIdentity:](self, "__setupTraitsParticipantWithRole:displayIdentity:", v11, v10);

          v8 = v11;
        }
      }
    }
  }

}

- (void)__setupTraitsParticipantWithRole:(id)a3 displayIdentity:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  SBTraitsSceneParticipantDelegate *v14;
  id WeakRetained;
  SBTraitsSceneParticipantDelegate *v16;
  SBTraitsSceneParticipantDelegate *sceneTraitsDelegate;
  TRAParticipant *v18;
  TRAParticipant *traitsParticipant;
  NSHashTable *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSettingsUpdater.m"), 224, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("role"));

  }
  if (!self->_traitsParticipant && SBTraitsArbiterOrientationActuationEnabledForRole(v7))
  {
    if ((objc_msgSend(v8, "expectsSecureRendering") & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0D228F8], "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "mainIdentity");
      v10 = (id)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v10 = v8;
    }
    objc_msgSend((id)SBApp, "windowSceneManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "windowSceneForDisplayIdentity:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "traitsArbiter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [SBTraitsSceneParticipantDelegate alloc];
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    v16 = -[SBTraitsSceneParticipantDelegate initWithScene:](v14, "initWithScene:", WeakRetained);
    sceneTraitsDelegate = self->_sceneTraitsDelegate;
    self->_sceneTraitsDelegate = v16;

    -[SBTraitsSceneParticipantDelegate setOrientationActuationAnimatable:](self->_sceneTraitsDelegate, "setOrientationActuationAnimatable:", self->_displayConfiguration != 0);
    objc_msgSend(v13, "acquireParticipantWithRole:delegate:", v7, self->_sceneTraitsDelegate);
    v18 = (TRAParticipant *)objc_claimAutoreleasedReturnValue();
    traitsParticipant = self->_traitsParticipant;
    self->_traitsParticipant = v18;

    -[SBTraitsSceneParticipantDelegate setArbiter:](self->_sceneTraitsDelegate, "setArbiter:", v13);
    -[SBTraitsSceneParticipantDelegate setParticipant:](self->_sceneTraitsDelegate, "setParticipant:", self->_traitsParticipant);
    -[SBTraitsSceneParticipantDelegate setInitialSupportedOrientationsOverride:](self->_sceneTraitsDelegate, "setInitialSupportedOrientationsOverride:", -[SBSceneSettingsUpdater initialSupportedInterfaceOrientations](self, "initialSupportedInterfaceOrientations"));
    -[TRAParticipant setNeedsUpdatePreferencesWithReason:](self->_traitsParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("Setup"));
    -[TRAParticipant updatePreferencesIfNeeded](self->_traitsParticipant, "updatePreferencesIfNeeded");
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v20 = self->_observers;
    v21 = -[NSHashTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v27;
      do
      {
        v24 = 0;
        do
        {
          if (*(_QWORD *)v27 != v23)
            objc_enumerationMutation(v20);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v24++), "didUpdateSceneTraitsDelegate:", self->_sceneTraitsDelegate);
        }
        while (v22 != v24);
        v22 = -[NSHashTable countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v22);
    }

  }
}

+ (void)safeUpdateScene:(id)a3 withUserInterfaceStyle:(int64_t)a4
{
  _QWORD v4[7];

  if (a4)
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __65__SBSceneSettingsUpdater_safeUpdateScene_withUserInterfaceStyle___block_invoke;
    v4[3] = &__block_descriptor_56_e73_v24__0__UIMutableApplicationSceneSettings_8__FBSSceneTransitionContext_16l;
    v4[4] = a2;
    v4[5] = a1;
    v4[6] = a4;
    objc_msgSend(a1, "safeUpdateScene:withBlock:", a3, v4);
  }
}

+ (void)safeUpdateScene:(id)a3 withDisplayConfiguration:(id)a4 updateGeometry:(BOOL)a5
{
  id v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  SEL v13;
  id v14;
  BOOL v15;

  v9 = a4;
  v10 = v9;
  if (v9)
  {
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __82__SBSceneSettingsUpdater_safeUpdateScene_withDisplayConfiguration_updateGeometry___block_invoke;
    v11[3] = &unk_1E8EA7988;
    v13 = a2;
    v14 = a1;
    v12 = v9;
    v15 = a5;
    objc_msgSend(a1, "safeUpdateScene:withBlock:", a3, v11);

  }
}

+ (void)__updateSceneSettings:(id)a3 forDisplayConfiguration:(id)a4 updateGeometry:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  void *v10;
  id v11;

  v5 = a5;
  v11 = a3;
  v9 = a4;
  if ((objc_msgSend(v11, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSceneSettingsUpdater.m"), 250, CFSTR("Settings must be an UI subclass"));

  }
  if (__updateSceneSettings_forDisplayConfiguration_updateGeometry__onceToken != -1)
    dispatch_once(&__updateSceneSettings_forDisplayConfiguration_updateGeometry__onceToken, &__block_literal_global_86);
  objc_msgSend(v11, "setScreenReferenceDisplayModeStatus:", objc_msgSend((id)__updateSceneSettings_forDisplayConfiguration_updateGeometry____displayReferenceModeMonitor, "referenceModeStatusForDisplayWithConfiguration:", v9));
  objc_msgSend(v11, "setDisplayConfiguration:", v9);
  if (v5)
  {
    objc_msgSend(v9, "bounds");
    objc_msgSend(v11, "setFrame:");
    objc_msgSend(a1, "__updateSceneInsetSettings:forDisplayConfiguration:", v11, v9);
  }

}

+ (void)__updateSceneInsetSettings:(id)a3 forDisplayConfiguration:(id)a4
{
  id v7;
  void *v8;
  int v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  id v16;

  v16 = a3;
  v7 = a4;
  if ((objc_msgSend(v16, "isUISubclass") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("SBSceneSettingsUpdater.m"), 266, CFSTR("Settings must be an UI subclass"));

  }
  if ((objc_msgSend(v7, "isMainRootDisplay") & 1) != 0
    || (objc_msgSend(v7, "identity"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v8, "isContinuityDisplay"),
        v8,
        v9))
  {
    objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sb_applyDisplayEdgeInfoToSceneSettings:", v16);

  }
  else
  {
    v11 = *MEMORY[0x1E0CEB4B0];
    v12 = *(double *)(MEMORY[0x1E0CEB4B0] + 8);
    v13 = *(double *)(MEMORY[0x1E0CEB4B0] + 16);
    v14 = *(double *)(MEMORY[0x1E0CEB4B0] + 24);
    objc_msgSend(v16, "setSafeAreaInsetsPortrait:", *MEMORY[0x1E0CEB4B0], v12, v13, v14);
    objc_msgSend(v16, "setPeripheryInsets:", v11, v12, v13, v14);
    objc_msgSend(v16, "setHomeAffordanceOverlayAllowance:", 0.0);
  }

}

- (SBSceneSettingsUpdater)initWithScene:(id)a3 persistentIdentifier:(id)a4 level:(double)a5 updatesGeometry:(BOOL)a6
{
  id v11;
  id v12;
  SBSceneSettingsUpdater *v13;
  SBSceneSettingsUpdater *v14;
  void *v16;
  objc_super v17;

  v11 = a3;
  v12 = a4;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSettingsUpdater.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene"));

  }
  v17.receiver = self;
  v17.super_class = (Class)SBSceneSettingsUpdater;
  v13 = -[SBSceneSettingsUpdater init](&v17, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeWeak((id *)&v13->_scene, v11);
    objc_storeStrong((id *)&v14->_scenePersistentIdentifier, a4);
    v14->_updatesGeometry = a6;
    -[SBSceneSettingsUpdater setLevel:](v14, "setLevel:", a5);
    -[SBSceneSettingsUpdater _setPersistenceIdentifier:](v14, "_setPersistenceIdentifier:", v12);
  }

  return v14;
}

- (void)dealloc
{
  SBTraitsSceneParticipantDelegate *sceneTraitsDelegate;
  TRAParticipant *traitsParticipant;
  objc_super v5;

  -[SBTraitsSceneParticipantDelegate invalidate](self->_sceneTraitsDelegate, "invalidate");
  sceneTraitsDelegate = self->_sceneTraitsDelegate;
  self->_sceneTraitsDelegate = 0;

  -[TRAParticipant invalidate](self->_traitsParticipant, "invalidate");
  traitsParticipant = self->_traitsParticipant;
  self->_traitsParticipant = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBSceneSettingsUpdater;
  -[SBSceneSettingsUpdater dealloc](&v5, sel_dealloc);
}

- (NSString)traitsRole
{
  return self->_traitsRole;
}

- (void)setTraitsRole:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_traitsRole, a3);
  v5 = a3;
  -[SBSceneSettingsUpdater _createTraitsParticipantIfNeededWithRole:](self, "_createTraitsParticipantIfNeededWithRole:", v5);

}

- (double)level
{
  id WeakRetained;
  void *v3;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  objc_msgSend(WeakRetained, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "level");
  v5 = v4;

  return v5;
}

- (void)setLevel:(double)a3
{
  double v5;
  void *v6;
  id WeakRetained;

  -[SBSceneSettingsUpdater level](self, "level");
  if (v5 != a3)
  {
    v6 = (void *)objc_opt_class();
    WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
    objc_msgSend(v6, "safeUpdateScene:withSceneLevel:", WeakRetained, a3);

  }
}

- (void)setAllowsTraitsArbitration:(BOOL)a3
{
  if (self->_allowsTraitsArbitration != a3)
  {
    self->_allowsTraitsArbitration = a3;
    -[SBSceneSettingsUpdater _createTraitsParticipantIfNeededWithRole:](self, "_createTraitsParticipantIfNeededWithRole:", self->_traitsRole);
  }
}

- (BOOL)isActive
{
  id WeakRetained;
  char v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v3 = objc_msgSend(WeakRetained, "isActive");

  return v3;
}

- (id)addObserver:(id)a3
{
  id v5;
  id v6;
  id v7;
  void *v8;
  NSHashTable *observers;
  NSHashTable *v10;
  NSHashTable *v11;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id location;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSettingsUpdater.m"), 120, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("observer"));

  }
  if (-[NSHashTable containsObject:](self->_observers, "containsObject:", v5))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSceneSettingsUpdater.m"), 121, CFSTR("observer was already added: %@"), v5);

  }
  objc_initWeak(&location, self);
  v6 = objc_alloc(MEMORY[0x1E0D01868]);
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __38__SBSceneSettingsUpdater_addObserver___block_invoke;
  v15[3] = &unk_1E8EA4CC0;
  objc_copyWeak(&v17, &location);
  v7 = v5;
  v16 = v7;
  v8 = (void *)objc_msgSend(v6, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("SBSceneSettingsUpdater"), CFSTR("observer"), v15);
  observers = self->_observers;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v11 = self->_observers;
    self->_observers = v10;

    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v7);

  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v8;
}

void __38__SBSceneSettingsUpdater_addObserver___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[3], "removeObject:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

+ (void)safeUpdateScene:(id)a3 withSceneLevel:(double)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __57__SBSceneSettingsUpdater_safeUpdateScene_withSceneLevel___block_invoke;
  v4[3] = &__block_descriptor_40_e73_v24__0__UIMutableApplicationSceneSettings_8__FBSSceneTransitionContext_16l;
  *(double *)&v4[4] = a4;
  objc_msgSend(a1, "safeUpdateScene:withBlock:", a3, v4);
}

uint64_t __57__SBSceneSettingsUpdater_safeUpdateScene_withSceneLevel___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLevel:", *(double *)(a1 + 32));
}

+ (void)safeUpdateScene:(id)a3 withDisplayConfiguration:(id)a4
{
  objc_msgSend(a1, "safeUpdateScene:withDisplayConfiguration:updateGeometry:", a3, a4, 0);
}

void __52__SBSceneSettingsUpdater_safeUpdateScene_withBlock___block_invoke_23(uint64_t a1, void *a2)
{
  _QWORD v3[4];
  id v4;

  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __52__SBSceneSettingsUpdater_safeUpdateScene_withBlock___block_invoke_2;
  v3[3] = &unk_1E8EA79F8;
  v4 = *(id *)(a1 + 32);
  objc_msgSend(a2, "updateSettingsWithBlock:", v3);

}

- (void)_setPersistenceIdentifier:(id)a3
{
  id v4;
  void *v5;
  id WeakRetained;
  id v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_opt_class();
  WeakRetained = objc_loadWeakRetained((id *)&self->_scene);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __52__SBSceneSettingsUpdater__setPersistenceIdentifier___block_invoke;
  v8[3] = &unk_1E8EA2B68;
  v9 = v4;
  v7 = v4;
  objc_msgSend(v5, "safeUpdateScene:withBlock:", WeakRetained, v8);

}

uint64_t __52__SBSceneSettingsUpdater__setPersistenceIdentifier___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPersistenceIdentifier:", *(_QWORD *)(a1 + 32));
}

void __87__SBSceneSettingsUpdater___updateSceneSettings_forDisplayConfiguration_updateGeometry___block_invoke()
{
  SBDisplayReferenceModeMonitor *v0;
  void *v1;

  v0 = objc_alloc_init(SBDisplayReferenceModeMonitor);
  v1 = (void *)__updateSceneSettings_forDisplayConfiguration_updateGeometry____displayReferenceModeMonitor;
  __updateSceneSettings_forDisplayConfiguration_updateGeometry____displayReferenceModeMonitor = (uint64_t)v0;

}

- (FBScene)scene
{
  return (FBScene *)objc_loadWeakRetained((id *)&self->_scene);
}

- (NSString)scenePersistentIdentifier
{
  return self->_scenePersistentIdentifier;
}

- (BOOL)updatesGeometry
{
  return self->_updatesGeometry;
}

- (FBSDisplayConfiguration)displayConfiguration
{
  return self->_displayConfiguration;
}

- (void)setInitialSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_initialSupportedInterfaceOrientations = a3;
}

- (BOOL)allowsTraitsArbitration
{
  return self->_allowsTraitsArbitration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayConfiguration, 0);
  objc_storeStrong((id *)&self->_sceneTraitsDelegate, 0);
  objc_storeStrong((id *)&self->_scenePersistentIdentifier, 0);
  objc_destroyWeak((id *)&self->_scene);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_traitsParticipant, 0);
  objc_storeStrong((id *)&self->_traitsRole, 0);
}

+ (void)safeUpdateScene:(uint64_t)a1 withBlock:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_1D0540000, a2, OS_LOG_TYPE_ERROR, "SBSceneSettingsUpdater was asked to update settings on an invalidated scene: %{public}@.", (uint8_t *)&v2, 0xCu);
}

@end
