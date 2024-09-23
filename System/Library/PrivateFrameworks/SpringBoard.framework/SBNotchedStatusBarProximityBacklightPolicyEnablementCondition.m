@implementation SBNotchedStatusBarProximityBacklightPolicyEnablementCondition

- (SBNotchedStatusBarProximityBacklightPolicyEnablementCondition)init
{
  void *v3;
  void *v4;
  void *v5;
  SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *v6;

  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBWindowSceneStatusBarManager windowSceneStatusBarManagerForEmbeddedDisplay](SBWindowSceneStatusBarManager, "windowSceneStatusBarManagerForEmbeddedDisplay");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA00]), "initWithStatusBar:", 0);
  v6 = -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition initWithMainDisplaySceneManager:windowSceneStatusBarManager:statusBarServer:orientationProvider:](self, "initWithMainDisplaySceneManager:windowSceneStatusBarManager:statusBarServer:orientationProvider:", v3, v4, v5, SBApp);

  return v6;
}

- (SBNotchedStatusBarProximityBacklightPolicyEnablementCondition)initWithMainDisplaySceneManager:(id)a3 windowSceneStatusBarManager:(id)a4 statusBarServer:(id)a5 orientationProvider:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *v15;
  SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *v16;
  uint64_t v17;
  SBWindowSceneStatusBarAssertionManager *statusBarAssertionManager;
  void *v19;
  uint64_t v20;
  NSSet *currentBackgroundActivityIdentifiers;
  objc_super v23;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v23.receiver = self;
  v23.super_class = (Class)SBNotchedStatusBarProximityBacklightPolicyEnablementCondition;
  v15 = -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition init](&v23, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_mainDisplaySceneManager, a3);
    -[SBMainDisplaySceneManager addObserver:](v16->_mainDisplaySceneManager, "addObserver:", v16);
    objc_storeStrong((id *)&v16->_windowSceneStatusBarManager, a4);
    objc_msgSend(v12, "assertionManager");
    v17 = objc_claimAutoreleasedReturnValue();
    statusBarAssertionManager = v16->_statusBarAssertionManager;
    v16->_statusBarAssertionManager = (SBWindowSceneStatusBarAssertionManager *)v17;

    -[SBWindowSceneStatusBarAssertionManager addObserver:](v16->_statusBarAssertionManager, "addObserver:", v16);
    objc_storeStrong((id *)&v16->_orientationProvider, a6);
    -[SpringBoard addActiveOrientationObserver:](v16->_orientationProvider, "addActiveOrientationObserver:", v16);
    objc_storeStrong((id *)&v16->_statusBarConnection, a5);
    -[UIStatusBarServer setStatusBar:](v16->_statusBarConnection, "setStatusBar:", v16);
    objc_msgSend(MEMORY[0x1E0CEAA00], "getStyleOverrides");
    STUIBackgroundActivityIdentifiersForStyleOverrides();
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "copy");
    currentBackgroundActivityIdentifiers = v16->_currentBackgroundActivityIdentifiers;
    v16->_currentBackgroundActivityIdentifiers = (NSSet *)v20;

    -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition _evaluateEnablement](v16, "_evaluateEnablement");
  }

  return v16;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotchedStatusBarProximityBacklightPolicyEnablementCondition.m"), 77, CFSTR("This object must be invalidated prior to being deallocated."));

  }
  v5.receiver = self;
  v5.super_class = (Class)SBNotchedStatusBarProximityBacklightPolicyEnablementCondition;
  -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  void *v4;

  if (self->_invalidated)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBNotchedStatusBarProximityBacklightPolicyEnablementCondition.m"), 88, CFSTR("This object has already been invalidated."));

  }
  self->_invalidated = 1;
  -[SBMainDisplaySceneManager removeObserver:](self->_mainDisplaySceneManager, "removeObserver:", self);
  -[SBWindowSceneStatusBarAssertionManager removeObserver:](self->_statusBarAssertionManager, "removeObserver:", self);
  -[SpringBoard removeActiveOrientationObserver:](self->_orientationProvider, "removeActiveOrientationObserver:", self);
  -[UIStatusBarServer setStatusBar:](self->_statusBarConnection, "setStatusBar:", 0);
  -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition setDelegate:](self, "setDelegate:", 0);
}

- (void)statusBarServer:(id)a3 didReceiveStyleOverrides:(unint64_t)a4
{
  BSDispatchMain();
}

void __106__SBNotchedStatusBarProximityBacklightPolicyEnablementCondition_statusBarServer_didReceiveStyleOverrides___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  STUIBackgroundActivityIdentifiersForStyleOverrides();
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v5, "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 56);
  *(_QWORD *)(v3 + 56) = v2;

}

- (void)statusBarAssertionManager:(id)a3 statusBarSettingsDidChange:(id)a4
{
  BSDispatchQueueAssertMain();
  -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition _evaluateEnablement](self, "_evaluateEnablement");
}

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  id v5;

  v5 = a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(v5, "addObserver:", self);

  -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition _evaluateEnablement](self, "_evaluateEnablement");
}

- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4
{
  id v5;

  v5 = a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(v5, "removeObserver:", self);

  -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition _evaluateEnablement](self, "_evaluateEnablement");
}

- (void)sceneHandle:(id)a3 didUpdateSettingsWithDiff:(id)a4 previousSettings:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIApplicationSceneSettingsDiffInspector *applicationSceneSettingsDiffInspector;
  UIApplicationSceneSettingsDiffInspector *v12;
  UIApplicationSceneSettingsDiffInspector *v13;
  UIApplicationSceneSettingsDiffInspector *v14;
  uint64_t v15;
  UIApplicationSceneSettingsDiffInspector *v16;
  _QWORD v17[4];
  id v18;
  _QWORD v19[4];
  id v20;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  BSDispatchQueueAssertMain();
  applicationSceneSettingsDiffInspector = self->_applicationSceneSettingsDiffInspector;
  if (!applicationSceneSettingsDiffInspector)
  {
    v12 = (UIApplicationSceneSettingsDiffInspector *)objc_alloc_init(MEMORY[0x1E0CEA340]);
    v13 = self->_applicationSceneSettingsDiffInspector;
    self->_applicationSceneSettingsDiffInspector = v12;

    objc_initWeak(&location, self);
    v14 = self->_applicationSceneSettingsDiffInspector;
    v15 = MEMORY[0x1E0C809B0];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __120__SBNotchedStatusBarProximityBacklightPolicyEnablementCondition_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke;
    v19[3] = &unk_1E8EA2658;
    objc_copyWeak(&v20, &location);
    -[UIApplicationSceneSettingsDiffInspector observeStatusBarStyleOverridesToSuppressWithBlock:](v14, "observeStatusBarStyleOverridesToSuppressWithBlock:", v19);
    v16 = self->_applicationSceneSettingsDiffInspector;
    v17[0] = v15;
    v17[1] = 3221225472;
    v17[2] = __120__SBNotchedStatusBarProximityBacklightPolicyEnablementCondition_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2;
    v17[3] = &unk_1E8EA2658;
    objc_copyWeak(&v18, &location);
    -[UIApplicationSceneSettingsDiffInspector observeForcedStatusBarForegroundTransparentWithBlock:](v16, "observeForcedStatusBarForegroundTransparentWithBlock:", v17);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
    applicationSceneSettingsDiffInspector = self->_applicationSceneSettingsDiffInspector;
  }
  -[UIApplicationSceneSettingsDiffInspector inspectDiff:withContext:](applicationSceneSettingsDiffInspector, "inspectDiff:withContext:", v9, 0);

}

void __120__SBNotchedStatusBarProximityBacklightPolicyEnablementCondition_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluateEnablement");

}

void __120__SBNotchedStatusBarProximityBacklightPolicyEnablementCondition_sceneHandle_didUpdateSettingsWithDiff_previousSettings___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_evaluateEnablement");

}

- (void)_setEnabled:(BOOL)a3 statusBarHeight:(double)a4
{
  id WeakRetained;

  if (self->_isEnabled != a3)
  {
    self->_isEnabled = a3;
    if (!a3)
      a4 = 0.0;
    self->_statusBarHeight = a4;
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "condition:enablementDidChange:", self, self->_isEnabled);

  }
}

- (void)_evaluateEnablement
{
  void *v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  NSSet *v11;
  void *v12;
  double v13;
  SBNotchedStatusBarProximityBacklightPolicyEnablementCondition *v14;
  _BOOL8 v15;
  NSSet *currentBackgroundActivityIdentifiers;
  void *v17;
  void *v18;
  _BOOL8 v19;
  void *v20;
  void *v21;
  double v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  if (!-[NSSet count](self->_currentBackgroundActivityIdentifiers, "count")
    || -[SpringBoard activeInterfaceOrientation](self->_orientationProvider, "activeInterfaceOrientation") != 1)
  {
    v13 = 0.0;
    v14 = self;
    v15 = 0;
LABEL_18:
    -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition _setEnabled:statusBarHeight:](v14, "_setEnabled:statusBarHeight:", v15, v13);
    return;
  }
  if (!-[SBWindowSceneStatusBarManager isStatusBarEffectivelyHidden](self->_windowSceneStatusBarManager, "isStatusBarEffectivelyHidden"))
  {
    currentBackgroundActivityIdentifiers = self->_currentBackgroundActivityIdentifiers;
    -[SBWindowSceneStatusBarAssertionManager currentStatusBarSettings](self->_statusBarAssertionManager, "currentStatusBarSettings");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "backgroundActivitiesToSuppress");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = _STBackgroundActivityIdentifiersNotEmptyAfterSubtractingIdentifiers(currentBackgroundActivityIdentifiers, v18);

    objc_msgSend((id)*MEMORY[0x1E0CEB258], "statusBarHeight");
    v14 = self;
    v15 = v19;
    goto LABEL_18;
  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  -[SBMainDisplaySceneManager externalForegroundApplicationSceneHandles](self->_mainDisplaySceneManager, "externalForegroundApplicationSceneHandles", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  v5 = 0.0;
  if (v4)
  {
    v6 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "sceneIfExists");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v8;
        if (v8)
        {
          objc_msgSend(v8, "uiSettings");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v10, "statusBarDisabled") & 1) == 0
            && (objc_msgSend(v10, "forcedStatusBarForegroundTransparent") & 1) == 0)
          {
            v11 = self->_currentBackgroundActivityIdentifiers;
            objc_msgSend(v10, "statusBarStyleOverridesToSuppress");
            STUIBackgroundActivityIdentifiersForStyleOverrides();
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            LOBYTE(v11) = _STBackgroundActivityIdentifiersNotEmptyAfterSubtractingIdentifiers(v11, v12);

            if ((v11 & 1) != 0)
            {
              v20 = (void *)MEMORY[0x1E0CEA9E8];
              objc_msgSend(v9, "uiClientSettings");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              v4 = 1;
              objc_msgSend(v20, "heightForStyle:orientation:", objc_msgSend(v21, "statusBarStyle"), 1);
              v5 = v22;

              goto LABEL_21;
            }
          }

        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_21:

  -[SBNotchedStatusBarProximityBacklightPolicyEnablementCondition _setEnabled:statusBarHeight:](self, "_setEnabled:statusBarHeight:", v4, v5);
}

- (SBNotchedStatusBarProximityBacklightPolicyEnablementConditionDelegate)delegate
{
  return (SBNotchedStatusBarProximityBacklightPolicyEnablementConditionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isEnabled
{
  return self->_isEnabled;
}

- (double)enabledStatusBarHeight
{
  return self->_statusBarHeight;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_currentBackgroundActivityIdentifiers, 0);
  objc_storeStrong((id *)&self->_applicationSceneSettingsDiffInspector, 0);
  objc_storeStrong((id *)&self->_mainDisplaySceneManager, 0);
  objc_storeStrong((id *)&self->_statusBarAssertionManager, 0);
  objc_storeStrong((id *)&self->_windowSceneStatusBarManager, 0);
  objc_storeStrong((id *)&self->_statusBarConnection, 0);
  objc_storeStrong((id *)&self->_orientationProvider, 0);
}

@end
