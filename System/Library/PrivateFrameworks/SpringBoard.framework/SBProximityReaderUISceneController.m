@implementation SBProximityReaderUISceneController

- (SBProximityReaderUISceneController)initWithSceneWorkspaceIdentifier:(id)a3 clientProcessIdentity:(id)a4 sceneVendingPolicy:(int64_t)a5 traitsRole:(id)a6 jobLabel:(id)a7 level:(double)a8
{
  SBProximityReaderUISceneController *v8;
  SBProximityReaderUISceneController *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  SBFDeviceLockOutController *v14;
  SBFDeviceLockOutController *lockOutController;
  void *v16;
  void *v17;
  uint64_t v18;
  UIApplicationSceneDeactivationAssertion *sceneDeactivationAssertion;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBProximityReaderUISceneController;
  v8 = -[SBSystemUISceneController initWithSceneWorkspaceIdentifier:clientProcessIdentity:sceneVendingPolicy:traitsRole:jobLabel:level:](&v21, sel_initWithSceneWorkspaceIdentifier_clientProcessIdentity_sceneVendingPolicy_traitsRole_jobLabel_level_, a3, a4, a5, a6, a7, a8);
  v9 = v8;
  if (v8)
  {
    v8->_presenting = 0;
    objc_msgSend((id)SBApp, "lockOutController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_class();
    v12 = v10;
    if (v11)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v13 = v12;
      else
        v13 = 0;
    }
    else
    {
      v13 = 0;
    }
    v14 = v13;

    lockOutController = v9->_lockOutController;
    v9->_lockOutController = v14;

    -[SBFDeviceLockOutController setProximityReaderBlockProvider:](v9->_lockOutController, "setProximityReaderBlockProvider:", v9);
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "sceneDeactivationManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "newAssertionWithReason:", 7);
    sceneDeactivationAssertion = v9->_sceneDeactivationAssertion;
    v9->_sceneDeactivationAssertion = (UIApplicationSceneDeactivationAssertion *)v18;

  }
  return v9;
}

- (void)dealloc
{
  UIApplicationSceneDeactivationAssertion *sceneDeactivationAssertion;
  objc_super v4;

  -[SBFDeviceLockOutController setProximityReaderBlockProvider:](self->_lockOutController, "setProximityReaderBlockProvider:", 0);
  -[UIApplicationSceneDeactivationAssertion relinquish](self->_sceneDeactivationAssertion, "relinquish");
  sceneDeactivationAssertion = self->_sceneDeactivationAssertion;
  self->_sceneDeactivationAssertion = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBProximityReaderUISceneController;
  -[SBSystemUISceneController dealloc](&v4, sel_dealloc);
}

+ (id)_setupInfo
{
  _QWORD v3[4];
  _QWORD v4[5];

  v4[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("class");
  v4[0] = objc_opt_class();
  v4[1] = MEMORY[0x1E0C9AAB0];
  v3[1] = CFSTR("enabled");
  v3[2] = CFSTR("traitsRole");
  v3[3] = CFSTR("presentationStyle");
  v4[2] = CFSTR("SBTraitsParticipantRoleSystemUIScene");
  v4[3] = &unk_1E91D2258;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v4, v3, 4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)setDefaultPresenter:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)SBProximityReaderUISceneController;
  -[SBSystemUISceneController setDefaultPresenter:](&v5, sel_setDefaultPresenter_, v4);
  objc_msgSend(v4, "setShouldPublishAsDisplayLayoutElement:", 1);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "setPresentingDelegate:", self);

}

- (BOOL)handleHomeButtonPress
{
  unint64_t v3;
  void *v4;
  SBSUIFeaturePolicyHostComponent *featurePolicyComponent;
  void *v6;

  v3 = -[SBSUIFeaturePolicyHostComponent desiredHardwareButtonEvents](self->_featurePolicyComponent, "desiredHardwareButtonEvents");
  if ((v3 & 0x10) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC5A8]), "initWithButtonEvents:withHandler:", 16, &__block_literal_global_388);
    featurePolicyComponent = self->_featurePolicyComponent;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIFeaturePolicyHostComponent sendActions:](featurePolicyComponent, "sendActions:", v6);

  }
  return (v3 >> 4) & 1;
}

- (BOOL)handleLockButtonPress
{
  char v3;
  void *v4;
  SBSUIFeaturePolicyHostComponent *featurePolicyComponent;
  void *v6;

  v3 = -[SBSUIFeaturePolicyHostComponent desiredHardwareButtonEvents](self->_featurePolicyComponent, "desiredHardwareButtonEvents");
  if ((v3 & 1) != 0)
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAC5A8]), "initWithButtonEvents:withHandler:", 1, &__block_literal_global_22_5);
    featurePolicyComponent = self->_featurePolicyComponent;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIFeaturePolicyHostComponent sendActions:](featurePolicyComponent, "sendActions:", v6);

  }
  return v3 & 1;
}

- (BOOL)handleBackgroundActivity:(id)a3 handler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  SBSUIFeaturePolicyHostComponent *featurePolicyComponent;
  void *v13;
  BOOL v14;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(id *, char);
  void *v19;
  id v20;
  id v21;
  id v22;
  id location;

  v6 = a3;
  v7 = a4;
  if (-[SBProximityReaderUISceneController _isHandlingBackgroundActivity:](self, "_isHandlingBackgroundActivity:", v6)
    || (-[SBSUIFeaturePolicyHostComponent desiredBackgroundActivities](self->_featurePolicyComponent, "desiredBackgroundActivities"), v8 = (void *)objc_claimAutoreleasedReturnValue(), v9 = objc_msgSend(v8, "containsObject:", v6), v8, !v9))
  {
    v14 = 0;
  }
  else
  {
    objc_initWeak(&location, self);
    v10 = objc_alloc(MEMORY[0x1E0DAC570]);
    v16 = MEMORY[0x1E0C809B0];
    v17 = 3221225472;
    v18 = __71__SBProximityReaderUISceneController_handleBackgroundActivity_handler___block_invoke;
    v19 = &unk_1E8E9E158;
    objc_copyWeak(&v22, &location);
    v20 = v6;
    v21 = v7;
    v11 = (void *)objc_msgSend(v10, "initWithBackgroundActivityIdentifier:handler:", v20, &v16);
    featurePolicyComponent = self->_featurePolicyComponent;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v11, v16, v17, v18, v19);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSUIFeaturePolicyHostComponent sendActions:](featurePolicyComponent, "sendActions:", v13);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&location);
    v14 = 1;
  }

  return v14;
}

void __71__SBProximityReaderUISceneController_handleBackgroundActivity_handler___block_invoke(id *a1, char a2)
{
  id WeakRetained;
  void *v5;
  _QWORD v6[5];
  id v7;
  id v8;
  char v9;

  WeakRetained = objc_loadWeakRetained(a1 + 6);
  v5 = WeakRetained;
  if (WeakRetained)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__SBProximityReaderUISceneController_handleBackgroundActivity_handler___block_invoke_2;
    v6[3] = &unk_1E8EA04C0;
    v9 = a2;
    v6[4] = WeakRetained;
    v7 = a1[4];
    v8 = a1[5];
    dispatch_async(MEMORY[0x1E0C80D38], v6);

  }
}

uint64_t __71__SBProximityReaderUISceneController_handleBackgroundActivity_handler___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  if (*(_BYTE *)(result + 56))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "_addHandlingBackgroundActivity:", *(_QWORD *)(result + 40));
    (*(void (**)(void))(*(_QWORD *)(v1 + 48) + 16))();
    return objc_msgSend(*(id *)(v1 + 32), "_removeHandlingBackgroundActivity:", *(_QWORD *)(v1 + 40));
  }
  return result;
}

- (void)scenePresenter:(id)a3 didPresentScene:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  SBSUIStatusBarSceneHostComponent *v19;
  SBSUIStatusBarSceneHostComponent *statusBarComponent;
  SBSUIStatusBarSceneHostComponent *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  SBSUIFeaturePolicyHostComponent *v28;
  SBSUIFeaturePolicyHostComponent *featurePolicyComponent;
  SBSUIFeaturePolicyHostComponent *v30;
  id v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  id v35;
  void *v36;
  SBSUIIdleTimerSceneHostComponent *v37;
  SBSUIIdleTimerSceneHostComponent *idleTimerComponent;
  SBSUIIdleTimerSceneHostComponent *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  BSInvalidatable *v44;
  BSInvalidatable *suppressSystemGesturesAssertion;
  void *v46;
  BSInvalidatable *v47;
  BSInvalidatable *bannerSuppressionAssertion;
  void *v49;
  BSInvalidatable *v50;
  BSInvalidatable *suppressSystemApertureAssertion;
  UIApplicationSceneDeactivationAssertion *sceneDeactivationAssertion;
  void *v53;
  void *v54;
  void *v55;
  BSInvalidatable *v56;
  BSInvalidatable *captureButtonSuppressionAssertion;
  void *v58;
  void *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v7, "definition");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "specification");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uiSceneSessionRole");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)objc_opt_new();
  objc_msgSend(v11, "uiSceneSessionRole");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v10, "isEqual:", v12);

  if (v13)
  {
    self->_presenting = 1;
    v14 = objc_opt_class();
    objc_msgSend(v7, "componentForExtension:ofClass:", v14, objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_opt_class();
    v17 = v15;
    if (v16)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v18 = v17;
      else
        v18 = 0;
    }
    else
    {
      v18 = 0;
    }
    v19 = v18;

    statusBarComponent = self->_statusBarComponent;
    self->_statusBarComponent = v19;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v21 = self->_statusBarComponent;
      v22 = v6;
      -[SBSUIStatusBarSceneHostComponent setDelegate:](v21, "setDelegate:", v22);
      objc_msgSend(v22, "statusBarSceneHostComponent:didChangePreferredStatusBarVisibilityWithAnimationSettings:", self->_statusBarComponent, 0);

    }
    v23 = objc_opt_class();
    objc_msgSend(v7, "componentForExtension:ofClass:", v23, objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_opt_class();
    v26 = v24;
    if (v25)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v27 = v26;
      else
        v27 = 0;
    }
    else
    {
      v27 = 0;
    }
    v28 = v27;

    featurePolicyComponent = self->_featurePolicyComponent;
    self->_featurePolicyComponent = v28;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v30 = self->_featurePolicyComponent;
      v31 = v6;
      -[SBSUIFeaturePolicyHostComponent setDelegate:](v30, "setDelegate:", v31);
      objc_msgSend(v31, "featurePolicyHostComponentDidChangeAllowsMenuButtonDismissal:", self->_featurePolicyComponent);
      objc_msgSend(v31, "featurePolicyHostComponentDidChangeDesiredHardwareButtonEvents:", self->_featurePolicyComponent);
      objc_msgSend(v31, "featurePolicyHostComponentDidChangeDesiredBackgroundActivities:", self->_featurePolicyComponent);

    }
    v32 = objc_opt_class();
    objc_msgSend(v7, "componentForExtension:ofClass:", v32, objc_opt_class());
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_opt_class();
    v35 = v33;
    if (v34)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v36 = v35;
      else
        v36 = 0;
    }
    else
    {
      v36 = 0;
    }
    v37 = v36;

    idleTimerComponent = self->_idleTimerComponent;
    self->_idleTimerComponent = v37;

    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v39 = self->_idleTimerComponent;
      v40 = v6;
      -[SBSUIIdleTimerSceneHostComponent setDelegate:](v39, "setDelegate:", v40);
      objc_msgSend(v40, "idleTimerSceneHostComponentDidChangeShouldDisableIdleTimer:", self->_idleTimerComponent);

    }
    if (!self->_suppressSystemGesturesAssertion)
    {
      +[SBSystemGestureManager deviceHardwareButtonGestureTypes](SBSystemGestureManager, "deviceHardwareButtonGestureTypes");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = (void *)objc_msgSend(v41, "mutableCopy");

      objc_msgSend(v42, "addObject:", &unk_1E91D2270);
      +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "acquireSystemGestureDisableAssertionForReason:exceptSystemGestureTypes:", CFSTR("Prox Reader UI Presentation"), v42);
      v44 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      suppressSystemGesturesAssertion = self->_suppressSystemGesturesAssertion;
      self->_suppressSystemGesturesAssertion = v44;

    }
    if (!self->_bannerSuppressionAssertion)
    {
      objc_msgSend((id)SBApp, "bannerManager");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "acquireBannerSuppressionAssertionForReason:", CFSTR("Prox Reader UI Presentation"));
      v47 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
      self->_bannerSuppressionAssertion = v47;

    }
    if (!self->_suppressSystemApertureAssertion)
    {
      objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v49, "systemApertureRepresentationSuppressionAssertionForProximityReaderVisibility");
      v50 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      suppressSystemApertureAssertion = self->_suppressSystemApertureAssertion;
      self->_suppressSystemApertureAssertion = v50;

    }
    sceneDeactivationAssertion = self->_sceneDeactivationAssertion;
    objc_msgSend(v7, "settings");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "displayIdentity");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIApplicationSceneDeactivationAssertion sb_acquireForDisplayIdentity:](sceneDeactivationAssertion, "sb_acquireForDisplayIdentity:", v54);

    if (!self->_captureButtonSuppressionAssertion)
    {
      objc_msgSend((id)SBApp, "captureButtonRestrictionCoordinator");
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "inhibitCaptureButtonActionAssertionWithReason:", CFSTR("Prox Reader UI Presentation"));
      v56 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      captureButtonSuppressionAssertion = self->_captureButtonSuppressionAssertion;
      self->_captureButtonSuppressionAssertion = v56;

    }
    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "setForceAlertsToPend:forReason:", 1, CFSTR("Prox Reader UI Presentation"));
    objc_msgSend(v58, "moveActiveUnlockedAlertsToPendingWithAnimation:completion:", 1, 0);
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v59 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
    if (v60)
    {
      v61 = v60;
      v62 = *(_QWORD *)v65;
      do
      {
        v63 = 0;
        do
        {
          if (*(_QWORD *)v65 != v62)
            objc_enumerationMutation(v59);
          objc_msgSend(*(id *)(*((_QWORD *)&v64 + 1) + 8 * v63++), "proximityReaderBlockStatusChanged:", self);
        }
        while (v61 != v63);
        v61 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &v64, v68, 16);
      }
      while (v61);
    }

  }
}

- (void)scenePresenter:(id)a3 willDismissScene:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  SBSUIStatusBarSceneHostComponent *statusBarComponent;
  SBSUIFeaturePolicyHostComponent *featurePolicyComponent;
  SBSUIIdleTimerSceneHostComponent *idleTimerComponent;
  BSInvalidatable *suppressSystemGesturesAssertion;
  BSInvalidatable *bannerSuppressionAssertion;
  BSInvalidatable *suppressSystemApertureAssertion;
  BSInvalidatable *captureButtonSuppressionAssertion;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "definition", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "specification");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uiSceneSessionRole");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "uiSceneSessionRole");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "isEqual:", v9);

  if (v10)
  {
    self->_presenting = 0;
    -[SBSUIStatusBarSceneHostComponent setDelegate:](self->_statusBarComponent, "setDelegate:", 0);
    statusBarComponent = self->_statusBarComponent;
    self->_statusBarComponent = 0;

    -[SBSUIFeaturePolicyHostComponent setDelegate:](self->_featurePolicyComponent, "setDelegate:", 0);
    featurePolicyComponent = self->_featurePolicyComponent;
    self->_featurePolicyComponent = 0;

    -[SBSUIIdleTimerSceneHostComponent setDelegate:](self->_idleTimerComponent, "setDelegate:", 0);
    idleTimerComponent = self->_idleTimerComponent;
    self->_idleTimerComponent = 0;

    -[BSInvalidatable invalidate](self->_suppressSystemGesturesAssertion, "invalidate");
    suppressSystemGesturesAssertion = self->_suppressSystemGesturesAssertion;
    self->_suppressSystemGesturesAssertion = 0;

    -[BSInvalidatable invalidate](self->_bannerSuppressionAssertion, "invalidate");
    bannerSuppressionAssertion = self->_bannerSuppressionAssertion;
    self->_bannerSuppressionAssertion = 0;

    -[BSInvalidatable invalidate](self->_suppressSystemApertureAssertion, "invalidate");
    suppressSystemApertureAssertion = self->_suppressSystemApertureAssertion;
    self->_suppressSystemApertureAssertion = 0;

    -[UIApplicationSceneDeactivationAssertion relinquish](self->_sceneDeactivationAssertion, "relinquish");
    -[BSInvalidatable invalidate](self->_captureButtonSuppressionAssertion, "invalidate");
    captureButtonSuppressionAssertion = self->_captureButtonSuppressionAssertion;
    self->_captureButtonSuppressionAssertion = 0;

    +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setForceAlertsToPend:forReason:", 0, CFSTR("Prox Reader UI Presentation"));

    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v19 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v25;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v25 != v22)
            objc_enumerationMutation(v19);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v23++), "proximityReaderBlockStatusChanged:", self);
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v21);
    }

  }
}

- (void)scenePresenter:(id)a3 updateHomeAffordance:(BOOL)a4 forScene:(id)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a4;
  v12 = a5;
  v8 = a3;
  v9 = objc_opt_class();
  SBSafeCast(v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v10, "hostingWindowForScene:", v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBProximityReaderUISceneController _updateHomeAffordance:window:](self, "_updateHomeAffordance:window:", v5, v11);

  }
}

- (BOOL)isProximityReaderBlocked
{
  return self->_presenting;
}

- (void)addProximityReaderObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)removeProximityReaderObserver:(id)a3
{
  if (a3)
    -[NSHashTable removeObject:](self->_observers, "removeObject:");
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  SBBarSwipeAffordanceViewController *homeAffordanceViewController;
  id v5;

  homeAffordanceViewController = self->_homeAffordanceViewController;
  v5 = a4;
  objc_msgSend(v5, "setActivationPolicyForParticipantsBelow:", -[SBBarSwipeAffordanceViewController activationPolicyForParticipantsBelow](homeAffordanceViewController, "activationPolicyForParticipantsBelow"));

}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if (a4 == 1)
    return 17;
  else
    return 0;
}

- (void)_addHandlingBackgroundActivity:(id)a3
{
  id v4;
  NSMutableSet *handlingBackgroundActivities;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    handlingBackgroundActivities = self->_handlingBackgroundActivities;
    v8 = v4;
    if (!handlingBackgroundActivities)
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
      v7 = self->_handlingBackgroundActivities;
      self->_handlingBackgroundActivities = v6;

      handlingBackgroundActivities = self->_handlingBackgroundActivities;
    }
    -[NSMutableSet addObject:](handlingBackgroundActivities, "addObject:", v8);
    v4 = v8;
  }

}

- (void)_removeHandlingBackgroundActivity:(id)a3
{
  if (a3)
    -[NSMutableSet removeObject:](self->_handlingBackgroundActivities, "removeObject:");
}

- (BOOL)_isHandlingBackgroundActivity:(id)a3
{
  return -[NSMutableSet containsObject:](self->_handlingBackgroundActivities, "containsObject:", a3);
}

- (void)_updateHomeAffordance:(BOOL)a3 window:(id)a4
{
  int v4;
  int v6;
  void *v7;
  SBBarSwipeAffordanceViewController *homeAffordanceViewController;
  SBBarSwipeAffordanceViewController *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  SBBarSwipeAffordanceViewController *v16;
  SBBarSwipeAffordanceViewController *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;

  v4 = a3;
  v27 = a4;
  v6 = -[SBBarSwipeAffordanceViewController wantsToBeActiveAffordance](self->_homeAffordanceViewController, "wantsToBeActiveAffordance");
  v7 = v27;
  if (v6 != v4)
  {
    homeAffordanceViewController = self->_homeAffordanceViewController;
    if (v4)
    {
      if (!homeAffordanceViewController)
      {
        v9 = [SBBarSwipeAffordanceViewController alloc];
        objc_msgSend(v27, "_sbWindowScene");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_opt_class();
        v12 = v10;
        if (v11)
        {
          if ((objc_opt_isKindOfClass() & 1) != 0)
            v13 = v12;
          else
            v13 = 0;
        }
        else
        {
          v13 = 0;
        }
        v15 = v13;

        v16 = -[SBBarSwipeAffordanceViewController initWithZStackParticipantIdentifier:windowScene:](v9, "initWithZStackParticipantIdentifier:windowScene:", 20, v15);
        v17 = self->_homeAffordanceViewController;
        self->_homeAffordanceViewController = v16;

        -[SBBarSwipeAffordanceViewController setPointerClickDelegate:](self->_homeAffordanceViewController, "setPointerClickDelegate:", self);
        -[SBBarSwipeAffordanceViewController setDelegate:](self->_homeAffordanceViewController, "setDelegate:", self);
        -[SBBarSwipeAffordanceViewController view](self->_homeAffordanceViewController, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "setDelegate:", self);

        -[SBBarSwipeAffordanceViewController view](self->_homeAffordanceViewController, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "addObserver:", self);

        v7 = v27;
      }
      objc_msgSend(v7, "rootViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_opt_class();
      v22 = v20;
      if (v21)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v23 = v22;
        else
          v23 = 0;
      }
      else
      {
        v23 = 0;
      }
      v24 = v23;

      objc_msgSend(v24, "addChildViewController:", self->_homeAffordanceViewController);
      objc_msgSend(v24, "view");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBBarSwipeAffordanceViewController view](self->_homeAffordanceViewController, "view");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "addOverlayView:", v26);

      -[SBBarSwipeAffordanceViewController didMoveToParentViewController:](self->_homeAffordanceViewController, "didMoveToParentViewController:", v24);
      -[SBBarSwipeAffordanceViewController setWantsToBeActiveAffordance:](self->_homeAffordanceViewController, "setWantsToBeActiveAffordance:", 1);
    }
    else
    {
      -[SBBarSwipeAffordanceViewController setWantsToBeActiveAffordance:](homeAffordanceViewController, "setWantsToBeActiveAffordance:", 0);
      -[SBBarSwipeAffordanceViewController willMoveToParentViewController:](self->_homeAffordanceViewController, "willMoveToParentViewController:", 0);
      -[SBBarSwipeAffordanceViewController view](self->_homeAffordanceViewController, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "removeFromSuperview");

      -[SBBarSwipeAffordanceViewController removeFromParentViewController](self->_homeAffordanceViewController, "removeFromParentViewController");
    }
    v7 = v27;
  }

}

- (void)_handleActionForHomeAffordanceView:(id)a3
{
  id v4;

  objc_msgSend(a3, "_sbWindowScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBSystemUISceneController _invalidateSceneControllersForWindowScene:](self, "_invalidateSceneControllersForWindowScene:", v4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeAffordanceViewController, 0);
  objc_storeStrong((id *)&self->_handlingBackgroundActivities, 0);
  objc_storeStrong((id *)&self->_idleTimerComponent, 0);
  objc_storeStrong((id *)&self->_featurePolicyComponent, 0);
  objc_storeStrong((id *)&self->_statusBarComponent, 0);
  objc_storeStrong((id *)&self->_lockOutController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_captureButtonSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_sceneDeactivationAssertion, 0);
  objc_storeStrong((id *)&self->_suppressSystemApertureAssertion, 0);
  objc_storeStrong((id *)&self->_bannerSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_suppressSystemGesturesAssertion, 0);
}

@end
