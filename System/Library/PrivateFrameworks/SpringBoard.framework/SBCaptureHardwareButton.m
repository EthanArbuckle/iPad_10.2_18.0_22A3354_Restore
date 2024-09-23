@implementation SBCaptureHardwareButton

+ (uint64_t)deviceSupportsCaptureButton
{
  objc_opt_self();
  return MGGetBoolAnswer();
}

+ (uint64_t)isCaptureFeatureEnabled
{
  objc_opt_self();
  return CAMIsCameraButtonEnabled();
}

+ (uint64_t)simulateCaptureButtonWithActionButton
{
  void *v0;
  void *v1;
  uint64_t v2;

  objc_opt_self();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "captureButtonDefaults");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "simulateCaptureButtonUsingActionButton");

  return v2;
}

- (id)initWithActivationManager:(void *)a3 suppressionManager:(void *)a4 configurationCoordinator:(void *)a5 restrictionCoordinator:(void *)a6 mainWindowScene:(void *)a7 setupManager:(void *)a8 authenticationController:(void *)a9 HUDController:
{
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  id v24;
  uint64_t v25;
  id v26;
  void *v27;
  SBCaptureHardwareButtonAppActivator *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  _QWORD v58[4];
  id *v59;
  id v60;
  id v61;
  id location;
  objc_super v63;

  v17 = a2;
  v54 = a3;
  v56 = a4;
  v53 = a5;
  v57 = a6;
  v52 = a7;
  v51 = a8;
  v55 = a9;
  if (!a1)
    goto LABEL_11;
  v50 = v17;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithActivationManager_suppressionManager_configurationCoordinator_restrictionCoordinator_mainWindowScene_setupManager_authenticationController_HUDController_, a1, CFSTR("SBCaptureHardwareButton.m"), 124, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activationManager != nil"));

  }
  if (!v56)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithActivationManager_suppressionManager_configurationCoordinator_restrictionCoordinator_mainWindowScene_setupManager_authenticationController_HUDController_, a1, CFSTR("SBCaptureHardwareButton.m"), 125, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("configurationCoordinator != nil"));

  }
  if (!v57)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", sel_initWithActivationManager_suppressionManager_configurationCoordinator_restrictionCoordinator_mainWindowScene_setupManager_authenticationController_HUDController_, a1, CFSTR("SBCaptureHardwareButton.m"), 126, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowScene != nil"));

  }
  v63.receiver = a1;
  v63.super_class = (Class)SBCaptureHardwareButton;
  a1 = (id *)objc_msgSendSuper2(&v63, sel_init);
  if (!a1)
  {
    v17 = v50;
LABEL_11:
    v42 = v53;
    v41 = v54;
    v40 = v51;
    v43 = v52;
    v27 = v55;
    goto LABEL_12;
  }
  +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "physicalButtonSceneOverrideManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(a1 + 9, v18);
  v48 = v18;
  -[SBPhysicalButtonSceneOverrideManager addObserver:forReason:]((id *)v18, (uint64_t)a1, (uint64_t)CFSTR("capture button"));
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = a1[10];
  a1[10] = (id)v19;

  objc_storeStrong(a1 + 11, a2);
  objc_storeStrong(a1 + 12, a3);
  objc_storeStrong(a1 + 13, a4);
  objc_storeStrong(a1 + 8, a6);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = a1[1];
  a1[1] = (id)v21;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = a1[2];
  a1[2] = (id)v23;

  objc_storeStrong(a1 + 11, a2);
  objc_storeStrong(a1 + 15, a5);
  objc_storeStrong(a1 + 20, a7);
  objc_storeStrong(a1 + 21, a8);
  objc_storeStrong(a1 + 22, a9);
  objc_msgSend(a1, "_configureButtonProcessor");
  +[SBCaptureButtonDomain rootSettings](SBCaptureButtonDomain, "rootSettings");
  v25 = objc_claimAutoreleasedReturnValue();
  v26 = a1[17];
  a1[17] = (id)v25;

  v27 = v55;
  v28 = -[SBCaptureHardwareButtonAppActivator initWithSettingsSnapshot:windowScene:scanModeResource:activationManager:suppressionManager:setupManager:authenticationController:HUDController:]([SBCaptureHardwareButtonAppActivator alloc], "initWithSettingsSnapshot:windowScene:scanModeResource:activationManager:suppressionManager:setupManager:authenticationController:HUDController:", a1[17], a1[8], a1, a1[11], a1[12], a1[20], a1[21], v55);
  v29 = a1[14];
  a1[14] = v28;

  objc_msgSend(v57, "zStackResolver");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:ofParticipantWithIdentifier:", a1, 30);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_processZStackParticipantSettings:", v31);
  objc_msgSend(v57, "systemGestureManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addGestureRecognizer:withType:", a1[16], 136);
  objc_msgSend(a1[17], "addKeyObserver:", a1);
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "captureButtonDefaults");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  a1[26] = (id)objc_msgSend(v34, "captureButtonClickCount");
  objc_initWeak(&location, a1);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "captureButtonClickCount");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = MEMORY[0x1E0C80D38];
  v37 = MEMORY[0x1E0C80D38];
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __188__SBCaptureHardwareButton_initWithActivationManager_suppressionManager_configurationCoordinator_restrictionCoordinator_mainWindowScene_setupManager_authenticationController_HUDController___block_invoke;
  v58[3] = &unk_1E8EA5EB0;
  objc_copyWeak(&v61, &location);
  a1 = a1;
  v59 = a1;
  v38 = v34;
  v60 = v38;
  v39 = (id)objc_msgSend(v38, "observeDefault:onQueue:withBlock:", v35, v36, v58);

  objc_msgSend(a1, "_resetNextClickTimer");
  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);

  v17 = v50;
  v40 = v51;
  v42 = v53;
  v41 = v54;
  v43 = v52;
LABEL_12:

  return a1;
}

void __188__SBCaptureHardwareButton_initWithActivationManager_suppressionManager_configurationCoordinator_restrictionCoordinator_mainWindowScene_setupManager_authenticationController_HUDController___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 208) = objc_msgSend(*(id *)(a1 + 40), "captureButtonClickCount");
    objc_msgSend(WeakRetained, "_resetNextClickTimer");
  }

}

- (void)dealloc
{
  BSInvalidatable *physicalButtonOverrideObserver;
  SBCaptureHardwareButtonAppActivator *appActivator;
  objc_super v5;

  -[BSInvalidatable invalidate](self->_physicalButtonOverrideObserver, "invalidate");
  physicalButtonOverrideObserver = self->_physicalButtonOverrideObserver;
  self->_physicalButtonOverrideObserver = 0;

  -[SBCaptureHardwareButtonAppActivator invalidate](self->_appActivator, "invalidate");
  appActivator = self->_appActivator;
  self->_appActivator = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBCaptureHardwareButton;
  -[SBCaptureHardwareButton dealloc](&v5, sel_dealloc);
}

- (id)activeScanningModeAssertionForReason:(id)a3 exclusiveWithReasons:(id)a4 invalidationBlock:(id)a5
{
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  char v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  uint64_t v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t k;
  void *v30;
  void *v31;
  int v32;
  id *v34;
  id v35;
  id v36;
  id v37;
  NSMutableSet *obj;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[5];
  id v49;
  id v50;
  id v51[2];
  id location;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  _BYTE v59[128];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v39 = a4;
  v37 = a5;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  obj = self->_clientPowerAssertions;
  v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v54;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v54 != v10)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * i), "reason");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v39, "containsObject:", v12);

        if ((v13 & 1) != 0)
        {
          v35 = 0;
          goto LABEL_33;
        }
      }
      v9 = -[NSMutableSet countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v59, 16);
      if (v9)
        continue;
      break;
    }
  }

  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "UUIDString");
  obj = (NSMutableSet *)objc_claimAutoreleasedReturnValue();

  objc_initWeak(&location, self);
  v15 = objc_alloc(MEMORY[0x1E0D01868]);
  v48[0] = MEMORY[0x1E0C809B0];
  v48[1] = 3221225472;
  v48[2] = __103__SBCaptureHardwareButton_activeScanningModeAssertionForReason_exclusiveWithReasons_invalidationBlock___block_invoke;
  v48[3] = &unk_1E8EB96F8;
  v51[1] = (id)a2;
  v48[4] = self;
  v34 = v51;
  objc_copyWeak(v51, &location);
  v50 = v37;
  v16 = v36;
  v49 = v16;
  v35 = (id)objc_msgSend(v15, "initWithIdentifier:forReason:invalidationBlock:", obj, v16, v48);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0u;
  v47 = 0u;
  v44 = 0u;
  v45 = 0u;
  -[NSMutableDictionary allKeys](self->_clientExclusivityRestrictionsByAssertionIdentifier, "allKeys");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
  if (v19)
  {
    v20 = *(_QWORD *)v45;
    do
    {
      for (j = 0; j != v19; ++j)
      {
        if (*(_QWORD *)v45 != v20)
          objc_enumerationMutation(v18);
        v22 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * j);
        -[NSMutableDictionary objectForKeyedSubscript:](self->_clientExclusivityRestrictionsByAssertionIdentifier, "objectForKeyedSubscript:", v22, v34);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "containsObject:", v16);

        if (v24)
          objc_msgSend(v17, "addObject:", v22);
      }
      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v44, v58, 16);
    }
    while (v19);
  }

  -[NSMutableSet addObject:](self->_clientPowerAssertions, "addObject:", v35);
  if (v39)
    -[NSMutableDictionary setObject:forKey:](self->_clientExclusivityRestrictionsByAssertionIdentifier, "setObject:forKey:", v39, obj);
  SBLogCameraCaptureButtonScanMode();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    -[SBCaptureHardwareButton activeScanningModeAssertionForReason:exclusiveWithReasons:invalidationBlock:].cold.1();

  -[SBCaptureHardwareButton _reevaluateButtonScanState](self, "_reevaluateButtonScanState");
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v26 = (void *)-[NSMutableSet copy](self->_clientPowerAssertions, "copy");
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
  if (v27)
  {
    v28 = *(_QWORD *)v41;
    do
    {
      for (k = 0; k != v27; ++k)
      {
        if (*(_QWORD *)v41 != v28)
          objc_enumerationMutation(v26);
        v30 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * k);
        objc_msgSend(v30, "identifier", v34);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v32 = objc_msgSend(v17, "containsObject:", v31);

        if (v32)
          objc_msgSend(v30, "invalidate");
      }
      v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v40, v57, 16);
    }
    while (v27);
  }

  objc_destroyWeak(v34);
  objc_destroyWeak(&location);
LABEL_33:

  return v35;
}

void __103__SBCaptureHardwareButton_activeScanningModeAssertionForReason_exclusiveWithReasons_invalidationBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id *WeakRetained;
  uint64_t v5;
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;

  v3 = a2;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), CFSTR("SBCaptureHardwareButton.m"), 195, CFSTR("Main thread only"));

  }
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  v5 = *(_QWORD *)(a1 + 48);
  if (v5)
    (*(void (**)(uint64_t, id))(v5 + 16))(v5, v3);
  objc_msgSend(WeakRetained[1], "removeObject:", v3);
  v6 = WeakRetained[2];
  objc_msgSend(v3, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectForKey:", v7);

  SBLogCameraCaptureButtonScanMode();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    __103__SBCaptureHardwareButton_activeScanningModeAssertionForReason_exclusiveWithReasons_invalidationBlock___block_invoke_cold_1(a1, v3, v8);

  objc_msgSend(WeakRetained, "_reevaluateButtonScanState");
}

- (void)captureButtonAppActivatorLaunchDidComplete:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_bufferedPressAbsoluteTimestamp)
  {
    v3 = a3;
    SBLogButtonsCapture();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Buffer: posting; successful launch", buf, 2u);
      }

      -[SBCaptureHardwareButton _postBufferedPress](self, "_postBufferedPress");
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Buffer: dropping; unsuccesful launch", v7, 2u);
      }

      -[SBCaptureHardwareButton _invalidateBufferedPress](self, "_invalidateBufferedPress");
    }
  }
}

- (BOOL)handleSimulatedCaptureButtonEvent:(uint64_t)a1
{
  if (a1)
  {
    objc_opt_self();
    if (CAMIsCameraButtonEnabled())
      objc_msgSend(*(id *)(a1 + 256), "processEvent:", a2);
  }
  return a1 != 0;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  SBCaptureHardwareButtonAppActivator *v5;
  SBCaptureHardwareButtonAppActivator *appActivator;

  if (objc_msgSend(&unk_1E91CEDE8, "containsObject:", a4))
  {
    -[SBCaptureHardwareButtonAppActivator invalidate](self->_appActivator, "invalidate");
    v5 = -[SBCaptureHardwareButtonAppActivator initWithSettingsSnapshot:windowScene:scanModeResource:activationManager:suppressionManager:setupManager:authenticationController:HUDController:]([SBCaptureHardwareButtonAppActivator alloc], "initWithSettingsSnapshot:windowScene:scanModeResource:activationManager:suppressionManager:setupManager:authenticationController:HUDController:", self->_settings, self->_mainWindowScene, self, self->_activationManager, self->_suppressionManager, self->_setupManager, self->_authenticationController, self->_hudController);
    appActivator = self->_appActivator;
    self->_appActivator = v5;

    -[SBCaptureHardwareButton _resetNextClickTimer](self, "_resetNextClickTimer");
  }
}

- (void)_configureButtonProcessor
{
  SBHIDButtonStateArbiter *v3;
  SBHIDButtonStateArbiter *simulationButtonArbiter;
  SBCaptureHardwareButtonFullPressRecognizer *v5;
  SBCaptureHardwareButtonFullPressRecognizer *captureButtonRecognizer;

  if (+[SBCaptureHardwareButton simulateCaptureButtonWithActionButton]()
    && !self->_simulationButtonArbiter)
  {
    v3 = objc_alloc_init(SBHIDButtonStateArbiter);
    simulationButtonArbiter = self->_simulationButtonArbiter;
    self->_simulationButtonArbiter = v3;

    -[SBHIDButtonStateArbiter setDelegate:](self->_simulationButtonArbiter, "setDelegate:", self);
  }
  if (!self->_captureButtonRecognizer)
  {
    v5 = -[SBCaptureHardwareButtonFullPressRecognizer initWithTarget:action:]([SBCaptureHardwareButtonFullPressRecognizer alloc], "initWithTarget:action:", self, sel__captureButtonGestureRecognizerAction_);
    captureButtonRecognizer = self->_captureButtonRecognizer;
    self->_captureButtonRecognizer = v5;

  }
}

- (void)_processZStackParticipantSettings:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  NSArray *buttonEventRequestingScenes;
  NSObject *v8;
  void *v9;
  NSUInteger v10;
  BSInvalidatable *clientRequestedButtonPowerAssertion;
  BSInvalidatable *v12;
  BSInvalidatable *v13;
  BSInvalidatable *v14;
  void *v15;
  NSArray *v16;
  NSArray *foregroundCaptureSceneTargets;
  NSObject *v18;
  void *v19;
  void *v20;
  NSArray *v21;
  NSArray *physicalButtonSceneTargets;
  NSObject *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  void *v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "captureButtonFullFidelityEventRequestingScenes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualArrays() & 1) == 0)
  {
    v6 = (NSArray *)objc_msgSend(v5, "copy");
    buttonEventRequestingScenes = self->_buttonEventRequestingScenes;
    self->_buttonEventRequestingScenes = v6;

    SBLogButtonsCapture();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self->_buttonEventRequestingScenes);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "captureButtonFullFidelityEventRequestingScenes %{public}@", buf, 0xCu);

    }
    v10 = -[NSArray count](self->_buttonEventRequestingScenes, "count");
    clientRequestedButtonPowerAssertion = self->_clientRequestedButtonPowerAssertion;
    if (v10)
    {
      if (!clientRequestedButtonPowerAssertion)
      {
        objc_initWeak((id *)buf, self);
        v25[0] = MEMORY[0x1E0C809B0];
        v25[1] = 3221225472;
        v25[2] = __61__SBCaptureHardwareButton__processZStackParticipantSettings___block_invoke;
        v25[3] = &unk_1E8EB5DD8;
        objc_copyWeak(&v26, (id *)buf);
        -[SBCaptureHardwareButton activeScanningModeAssertionForReason:exclusiveWithReasons:invalidationBlock:](self, "activeScanningModeAssertionForReason:exclusiveWithReasons:invalidationBlock:", CFSTR("kSBButtonScanningModeReasonSceneRequestingEvents"), 0, v25);
        v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
        v13 = self->_clientRequestedButtonPowerAssertion;
        self->_clientRequestedButtonPowerAssertion = v12;

        objc_destroyWeak(&v26);
        objc_destroyWeak((id *)buf);
      }
    }
    else if (clientRequestedButtonPowerAssertion)
    {
      -[BSInvalidatable invalidate](clientRequestedButtonPowerAssertion, "invalidate");
      v14 = self->_clientRequestedButtonPowerAssertion;
      self->_clientRequestedButtonPowerAssertion = 0;

      -[SBCaptureHardwareButton _invalidateBufferedPress](self, "_invalidateBufferedPress");
    }
  }
  objc_msgSend(v4, "foregroundCaptureSceneTargets");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualArrays() & 1) == 0)
  {
    v16 = (NSArray *)objc_msgSend(v15, "copy");
    foregroundCaptureSceneTargets = self->_foregroundCaptureSceneTargets;
    self->_foregroundCaptureSceneTargets = v16;

    SBLogButtonsCapture();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self->_foregroundCaptureSceneTargets);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v19;
      _os_log_impl(&dword_1D0540000, v18, OS_LOG_TYPE_DEFAULT, "foregroundCaptureSceneTargets %{public}@", buf, 0xCu);

    }
  }
  objc_msgSend(v4, "physicalButtonSceneTargets");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualArrays() & 1) == 0)
  {
    v21 = (NSArray *)objc_msgSend(v20, "copy");
    physicalButtonSceneTargets = self->_physicalButtonSceneTargets;
    self->_physicalButtonSceneTargets = v21;

    SBLogButtonsCapture();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self->_physicalButtonSceneTargets);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v28 = v24;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "physicalButtonSceneTargets %{public}@", buf, 0xCu);

    }
  }

}

void __61__SBCaptureHardwareButton__processZStackParticipantSettings___block_invoke(uint64_t a1)
{
  _QWORD *WeakRetained;
  void *v2;
  _QWORD *v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[4];
    WeakRetained[4] = 0;
    v3 = WeakRetained;

    WeakRetained = v3;
  }

}

- (BOOL)_physicalButtonTargetMatchesExpectedTargetScene
{
  SBCaptureHardwareButton *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = self;
  -[NSArray lastObject](self->_physicalButtonSceneTargets, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "scene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "clientProcess");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v6, "isEqual:", v2->_captureAppBundleIdentifierForBufferedPress);

  return (char)v2;
}

- (BOOL)_waitingForCaptureAppActivation
{
  _BOOL4 v3;

  v3 = -[SBCaptureHardwareButtonAppActivator isActivationInProgress](self->_appActivator, "isActivationInProgress");
  if (v3)
    LOBYTE(v3) = !-[SBCaptureHardwareButton _physicalButtonTargetMatchesExpectedTargetScene](self, "_physicalButtonTargetMatchesExpectedTargetScene");
  return v3;
}

- (void)_invalidateBufferedPress
{
  NSString *captureAppBundleIdentifierForBufferedPress;

  if (self->_bufferedPressAbsoluteTimestamp)
  {
    captureAppBundleIdentifierForBufferedPress = self->_captureAppBundleIdentifierForBufferedPress;
    self->_bufferedPressAbsoluteTimestamp = 0;
    self->_captureAppBundleIdentifierForBufferedPress = 0;

  }
}

- (void)_bufferPressForBundleIdentifier:(id)a3 timestamp:(unint64_t)a4
{
  id v6;
  NSObject *v7;
  NSString *v8;
  NSString *captureAppBundleIdentifierForBufferedPress;
  int v10;
  unint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  SBLogButtonsCapture();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 134217984;
    v11 = a4;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Buffering press(down time: %llu)", (uint8_t *)&v10, 0xCu);
  }

  v8 = (NSString *)objc_msgSend(v6, "copy");
  captureAppBundleIdentifierForBufferedPress = self->_captureAppBundleIdentifierForBufferedPress;
  self->_captureAppBundleIdentifierForBufferedPress = v8;

  self->_bufferedPressAbsoluteTimestamp = a4;
}

- (void)_postBufferedPress
{
  OUTLINED_FUNCTION_5(&dword_1D0540000, a2, a3, "Buffer: Nothing to do? (down time: %llu)", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_2_0();
}

- (void)_reevaluateButtonScanState
{
  uint64_t v3;
  BSInvalidatable *underlyingButtonPowerAssertion;
  BSInvalidatable *v5;
  BSInvalidatable *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  BSInvalidatable *v10;
  __int16 v11;
  __int16 v12;

  v3 = -[NSMutableSet count](self->_clientPowerAssertions, "count");
  underlyingButtonPowerAssertion = self->_underlyingButtonPowerAssertion;
  if (v3)
  {
    if (underlyingButtonPowerAssertion)
      return;
    BKSHIDTouchSensitiveButtonRequestScanMode();
    v5 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_underlyingButtonPowerAssertion;
    self->_underlyingButtonPowerAssertion = v5;

    SBLogCameraCaptureButtonScanMode();
    v7 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      goto LABEL_9;
    v12 = 0;
    v8 = "Setting Capture Button scan state to Active";
    v9 = (uint8_t *)&v12;
    goto LABEL_8;
  }
  if (!underlyingButtonPowerAssertion)
    return;
  -[BSInvalidatable invalidate](underlyingButtonPowerAssertion, "invalidate");
  v10 = self->_underlyingButtonPowerAssertion;
  self->_underlyingButtonPowerAssertion = 0;

  SBLogCameraCaptureButtonScanMode();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 0;
    v8 = "Setting Capture Button scan state to Idle";
    v9 = (uint8_t *)&v11;
LABEL_8:
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
  }
LABEL_9:

}

- (id)_sendCameraCaptureButtonDownToSceneOverride
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[SBPhysicalButtonSceneOverrideManager sendCameraCaptureButtonDown]((id *)&self->_physicalButtonOverrideManager->super.isa);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    SBLogButtonsCapture();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v2, "identifier");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = 138543362;
      v7 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "_sendCameraCaptureButtonDownToSceneOverride to: %{public}@", (uint8_t *)&v6, 0xCu);

    }
  }
  return v2;
}

- (BOOL)_sendCaptureIntentToEligibleForegroundScene
{
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;

  -[NSArray lastObject](self->_foregroundCaptureSceneTargets, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "scene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "isActive"))
    {
      objc_msgSend(v4, "captureApplication");
      v6 = objc_claimAutoreleasedReturnValue();
      -[SBCaptureButtonAppConfigurationCoordinator associatedAppBundleIdentifier](self->_configurationCoordinator, "associatedAppBundleIdentifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject bundleIdentifier](v6, "bundleIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);
      SBLogButtonsCapture();
      v10 = objc_claimAutoreleasedReturnValue();
      v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
      if (v9)
      {
        if (v11)
          -[SBCaptureHardwareButton _sendCaptureIntentToEligibleForegroundScene].cold.1();

        -[NSObject launchActions](v6, "launchActions");
        v10 = objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "sendActions:", v10);
      }
      else if (v11)
      {
        -[SBCaptureHardwareButton _sendCaptureIntentToEligibleForegroundScene].cold.2();
      }

    }
    else
    {
      SBLogButtonsCapture();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        -[SBCaptureHardwareButton _sendCaptureIntentToEligibleForegroundScene].cold.3();
      LOBYTE(v9) = 0;
    }

  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (void)_resetNextClickTimer
{
  BSAbsoluteMachTimer *nextClickDownTimer;
  int64_t clickCountToActivateApp;

  -[BSAbsoluteMachTimer invalidate](self->_nextClickDownTimer, "invalidate");
  nextClickDownTimer = self->_nextClickDownTimer;
  self->_nextClickDownTimer = 0;

  clickCountToActivateApp = self->_clickCountToActivateApp;
  self->_remainingClicksDownToActivateApp = clickCountToActivateApp;
  self->_remainingClicksUpToActivateApp = clickCountToActivateApp;
}

- (void)_nextClickTimeoutDidFire
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogButtonsCapture();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[button down] Timed out waiting for second click", v4, 2u);
  }

  -[SBCaptureHardwareButton _resetNextClickTimer](self, "_resetNextClickTimer");
}

- (BOOL)_shouldContinueAfterProcessingStateForClickDown
{
  BSAbsoluteMachTimer *nextClickDownTimer;
  int64_t remainingClicksDownToActivateApp;
  int64_t v6;
  float v7;
  double v8;
  NSObject *v9;
  int64_t v10;
  BSAbsoluteMachTimer *v11;
  BSAbsoluteMachTimer *v12;
  BSAbsoluteMachTimer *v13;
  void *v14;
  BSInvalidatable *v15;
  BSInvalidatable *hintDropletAssertion;
  NSObject *v17;
  void *v19;
  _QWORD v20[5];
  uint8_t buf[4];
  double v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  -[BSAbsoluteMachTimer invalidate](self->_nextClickDownTimer, "invalidate");
  nextClickDownTimer = self->_nextClickDownTimer;
  self->_nextClickDownTimer = 0;

  remainingClicksDownToActivateApp = self->_remainingClicksDownToActivateApp;
  v6 = remainingClicksDownToActivateApp - 1;
  self->_remainingClicksDownToActivateApp = remainingClicksDownToActivateApp - 1;
  if (remainingClicksDownToActivateApp == 1)
  {
    SBLogButtonsCapture();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "[button down] Got required clicks to activate app", buf, 2u);
    }

  }
  else
  {
    _AXSSideButtonClickSpeed();
    v8 = v7;
    SBLogButtonsCapture();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = self->_remainingClicksDownToActivateApp;
      *(_DWORD *)buf = 134218240;
      v22 = v8;
      v23 = 1024;
      v24 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[button down] Waiting for next click (for %gs) (%d clicks remaining)", buf, 0x12u);
    }

    v11 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("Capture button next click"));
    v12 = self->_nextClickDownTimer;
    self->_nextClickDownTimer = v11;

    v13 = self->_nextClickDownTimer;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __74__SBCaptureHardwareButton__shouldContinueAfterProcessingStateForClickDown__block_invoke;
    v20[3] = &unk_1E8EA1428;
    v20[4] = self;
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v13, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v20, v8, 0.01);
    if (self->_hintDropletAssertion)
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("shouldn't already have a hint droplet assertion"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBCaptureHardwareButton _shouldContinueAfterProcessingStateForClickDown].cold.1(a2, (uint64_t)self, (uint64_t)v19);
      objc_msgSend(objc_retainAutorelease(v19), "UTF8String");
      _bs_set_crash_log_message();
      __break(0);
      JUMPOUT(0x1D0BAA154);
    }
    -[SBWindowScene hardwareButtonBezelEffectsCoordinator](self->_mainWindowScene, "hardwareButtonBezelEffectsCoordinator");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "activateHintDropletForButton:", 9);
    v15 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    hintDropletAssertion = self->_hintDropletAssertion;
    self->_hintDropletAssertion = v15;

  }
  return v6 == 0;
}

uint64_t __74__SBCaptureHardwareButton__shouldContinueAfterProcessingStateForClickDown__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_nextClickTimeoutDidFire");
}

- (void)_handleButtonDownAtTimestamp:(unint64_t)a3
{
  NSObject *v5;
  SBHardwareButtonCoordinator *hardwareButtonCoordinator;
  void *v7;
  BSInvalidatable *v8;
  BSInvalidatable *buttonActiveAssertion;
  SBHardwareButtonCoordinator *v10;
  void *v11;
  NSObject *v12;
  SBCaptureButtonRestrictionCoordinator *restrictionCoordinator;
  _BOOL4 v14;
  NSObject *v15;
  void *v16;
  SBPhysicalButtonCompletionHandling *v17;
  SBPhysicalButtonCompletionHandling *overrideButtonUpHandler;
  NSObject *v19;
  const char *v20;
  SBCaptureHardwareButtonAppActivator *appActivator;
  void *v22;
  id v23;
  uint8_t buf[4];
  unint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[SBCaptureHardwareButton _invalidateBufferedPress](self, "_invalidateBufferedPress");
  if (self->_buttonActiveAssertion)
  {
    SBLogButtonsCapture();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "[button down] Button already down, ignoring subsequent button down", buf, 2u);
    }
    goto LABEL_4;
  }
  hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
  -[SBCaptureHardwareButton hardwareButtonIdentifier](self, "hardwareButtonIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHardwareButtonCoordinator assertButtonIsActive:](hardwareButtonCoordinator, "assertButtonIsActive:", v7);
  v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  buttonActiveAssertion = self->_buttonActiveAssertion;
  self->_buttonActiveAssertion = v8;

  v10 = self->_hardwareButtonCoordinator;
  -[SBCaptureHardwareButton hardwareButtonIdentifier](self, "hardwareButtonIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  self->_inhibitActionsForButtonCoordination = !-[SBHardwareButtonCoordinator buttonShouldStart:](v10, "buttonShouldStart:", v11);

  if (!self->_inhibitActionsForButtonCoordination)
  {
    restrictionCoordinator = self->_restrictionCoordinator;
    v23 = 0;
    v14 = -[SBCaptureButtonRestrictionCoordinator isCaptureButtonActionInhibited:](restrictionCoordinator, "isCaptureButtonActionInhibited:", &v23);
    v5 = v23;
    self->_inhibitActionsForRestriction = v14;
    if (v14)
    {
      SBLogButtonsCapture();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v25 = (unint64_t)v5;
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_DEFAULT, "[button down] Ignoring button press to inhibit assertion(s): %{public}@.", buf, 0xCu);
      }

      -[SBCaptureHardwareButton _resetNextClickTimer](self, "_resetNextClickTimer");
      goto LABEL_4;
    }
    if (-[SBCaptureHardwareButton _waitingForCaptureAppActivation](self, "_waitingForCaptureAppActivation"))
    {
      -[SBCaptureButtonAppConfigurationCoordinator associatedAppBundleIdentifier](self->_configurationCoordinator, "associatedAppBundleIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBCaptureHardwareButton _bufferPressForBundleIdentifier:timestamp:](self, "_bufferPressForBundleIdentifier:timestamp:", v16, a3);

LABEL_4:
      return;
    }
    -[SBCaptureHardwareButton _sendCameraCaptureButtonDownToSceneOverride](self, "_sendCameraCaptureButtonDownToSceneOverride");
    v17 = (SBPhysicalButtonCompletionHandling *)objc_claimAutoreleasedReturnValue();
    overrideButtonUpHandler = self->_overrideButtonUpHandler;
    self->_overrideButtonUpHandler = v17;

    if (self->_overrideButtonUpHandler)
    {
      SBLogButtonsCapture();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_23:

        goto LABEL_4;
      }
      *(_DWORD *)buf = 134217984;
      v25 = a3;
      v20 = "Invoking scene override Button Down Action (down time: %llu)";
    }
    else
    {
      if (!-[SBCaptureHardwareButton _sendCaptureIntentToEligibleForegroundScene](self, "_sendCaptureIntentToEligibleForegroundScene"))
      {
        if (-[SBCaptureHardwareButton _shouldContinueAfterProcessingStateForClickDown](self, "_shouldContinueAfterProcessingStateForClickDown"))
        {
          appActivator = self->_appActivator;
          -[SBCaptureButtonAppConfigurationCoordinator associatedAppBundleIdentifier](self->_configurationCoordinator, "associatedAppBundleIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBCaptureHardwareButtonAppActivator buttonPressDownAtTimestamp:requestingActivationOfAppWithBundleIdentifier:clickCountToActivate:](appActivator, "buttonPressDownAtTimestamp:requestingActivationOfAppWithBundleIdentifier:clickCountToActivate:", a3, v22, self->_clickCountToActivateApp);

        }
        goto LABEL_4;
      }
      SBLogButtonsCapture();
      v19 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        goto LABEL_23;
      *(_DWORD *)buf = 134217984;
      v25 = a3;
      v20 = "Sending capture intent to foreground scene (down time: %llu)";
    }
    _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, v20, buf, 0xCu);
    goto LABEL_23;
  }
  SBLogButtonsCapture();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[button down] Inhibit Actions preventing further processing", buf, 2u);
  }

  -[SBCaptureHardwareButton _resetNextClickTimer](self, "_resetNextClickTimer");
}

- (void)_handleButtonUpAtTimestamp:(unint64_t)a3 forDownTimestamp:(unint64_t)a4
{
  BSInvalidatable *buttonActiveAssertion;
  BSInvalidatable *hintDropletAssertion;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  SBPhysicalButtonCompletionHandling *overrideButtonUpHandler;
  int64_t remainingClicksUpToActivateApp;
  NSObject *v14;
  _BOOL4 v15;
  int64_t remainingClicksDownToActivateApp;
  SBHardwareButtonCoordinator *hardwareButtonCoordinator;
  void *v18;
  SBCaptureHardwareButtonAppActivator *appActivator;
  int v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[BSInvalidatable invalidate](self->_buttonActiveAssertion, "invalidate");
  buttonActiveAssertion = self->_buttonActiveAssertion;
  self->_buttonActiveAssertion = 0;

  -[BSInvalidatable invalidate](self->_hintDropletAssertion, "invalidate");
  hintDropletAssertion = self->_hintDropletAssertion;
  self->_hintDropletAssertion = 0;

  if (self->_inhibitActionsForButtonCoordination)
  {
    SBLogButtonsCapture();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v10 = "[button up] Inhibit Actions preventing further processing";
LABEL_10:
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v20, 2u);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  if (self->_inhibitActionsForRestriction)
  {
    SBLogButtonsCapture();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v10 = "[button up] Ignoring button up due to inhibit assertion.";
      goto LABEL_10;
    }
LABEL_11:

    return;
  }
  if (self->_bufferedPressAbsoluteTimestamp)
  {
    SBLogButtonsCapture();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v20) = 0;
      v10 = "[button up] bailing because buffered press.";
      goto LABEL_10;
    }
    goto LABEL_11;
  }
  if (self->_overrideButtonUpHandler)
  {
    SBLogButtonsCapture();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v20 = 134218240;
      v21 = a4;
      v22 = 2048;
      v23 = a3;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Invoking scene override Button Up Action (down time: %llu, up time: %llu)", (uint8_t *)&v20, 0x16u);
    }

    -[SBPhysicalButtonCompletionHandling completeWithResult:](self->_overrideButtonUpHandler, "completeWithResult:", 0);
    overrideButtonUpHandler = self->_overrideButtonUpHandler;
    self->_overrideButtonUpHandler = 0;

  }
  else
  {
    remainingClicksUpToActivateApp = self->_remainingClicksUpToActivateApp;
    self->_remainingClicksUpToActivateApp = remainingClicksUpToActivateApp - 1;
    SBLogButtonsCapture();
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
    if (remainingClicksUpToActivateApp < 2)
    {
      if (v15)
      {
        LOWORD(v20) = 0;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[button up] Got required clicks to activate app", (uint8_t *)&v20, 2u);
      }

      -[SBCaptureHardwareButton _resetNextClickTimer](self, "_resetNextClickTimer");
      hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
      -[SBCaptureHardwareButton hardwareButtonIdentifier](self, "hardwareButtonIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(hardwareButtonCoordinator) = -[SBHardwareButtonCoordinator buttonShouldStart:](hardwareButtonCoordinator, "buttonShouldStart:", v18);

      appActivator = self->_appActivator;
      if ((_DWORD)hardwareButtonCoordinator)
        -[SBCaptureHardwareButtonAppActivator buttonPressUpAtTimestamp:clickCountToActivate:](appActivator, "buttonPressUpAtTimestamp:clickCountToActivate:", a3, self->_clickCountToActivateApp);
      else
        -[SBCaptureHardwareButtonAppActivator outOfBandCancel](appActivator, "outOfBandCancel");
    }
    else
    {
      if (v15)
      {
        remainingClicksDownToActivateApp = self->_remainingClicksDownToActivateApp;
        v20 = 67109120;
        LODWORD(v21) = remainingClicksDownToActivateApp;
        _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "[button up] Waiting for next click (%d remaining)", (uint8_t *)&v20, 8u);
      }

    }
  }
}

- (void)_captureButtonGestureRecognizerAction:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  switch(v5)
  {
    case 4:
      v8 = objc_msgSend(v4, "pressDownTimestamp");
      SBLogButtonsCapture();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 134217984;
        v14 = v8;
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Capture Button Press Cancel (down time: %llu)", (uint8_t *)&v13, 0xCu);
      }

      -[SBCaptureHardwareButton cancelHardwareButtonPress](self, "cancelHardwareButtonPress");
      break;
    case 3:
      v10 = objc_msgSend(v4, "pressUpTimestamp");
      v11 = objc_msgSend(v4, "pressDownTimestamp");
      SBLogButtonsCapture();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 134218240;
        v14 = v11;
        v15 = 2048;
        v16 = v10;
        _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "Capture Button Up (down time: %llu, up time: %llu)", (uint8_t *)&v13, 0x16u);
      }

      -[SBCaptureHardwareButton _handleButtonUpAtTimestamp:forDownTimestamp:](self, "_handleButtonUpAtTimestamp:forDownTimestamp:", v10, v11);
      break;
    case 1:
      v6 = objc_msgSend(v4, "pressDownTimestamp");
      SBLogButtonsCapture();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v13 = 134217984;
        v14 = v6;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "Capture Button Down (down time: %llu)", (uint8_t *)&v13, 0xCu);
      }

      -[SBCaptureHardwareButton _handleButtonDownAtTimestamp:](self, "_handleButtonDownAtTimestamp:", v6);
      break;
  }

}

- (void)zStackParticipantWithIdentifier:(int64_t)a3 wasAcquiredWithSettings:(id)a4
{
  -[SBCaptureHardwareButton _processZStackParticipantSettings:](self, "_processZStackParticipantSettings:", a4);
}

- (void)zStackParticipantWithIdentifier:(int64_t)a3 settingsDidChange:(id)a4
{
  -[SBCaptureHardwareButton _processZStackParticipantSettings:](self, "_processZStackParticipantSettings:", a4);
}

- (void)physicalButtonSceneOverridesDidChange:(id)a3
{
  id v4;
  _BOOL4 v5;
  NSObject *v6;
  _BOOL4 v7;
  uint8_t v8[16];
  uint8_t buf[16];

  v4 = a3;
  if (self->_bufferedPressAbsoluteTimestamp)
  {
    v5 = -[SBCaptureHardwareButton _physicalButtonTargetMatchesExpectedTargetScene](self, "_physicalButtonTargetMatchesExpectedTargetScene");
    SBLogButtonsCapture();
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Buffer: Posting early!", buf, 2u);
      }

      -[SBCaptureHardwareButton _postBufferedPress](self, "_postBufferedPress");
    }
    else
    {
      if (v7)
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Buffer: Not posting yet", v8, 2u);
      }

    }
  }

}

- (void)performActionsForButtonLongPress:(id)a3
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogButtonsCapture();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Simulated Capture Button Long Press (should be disabled?)", v4, 2u);
  }

}

- (void)performActionsForButtonDown:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogButtonsCapture();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 134217984;
    v7 = objc_msgSend(v4, "downTime");
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Simulated Capture Button Down (down time: %llu)", (uint8_t *)&v6, 0xCu);
  }

  -[SBCaptureHardwareButton _handleButtonDownAtTimestamp:](self, "_handleButtonDownAtTimestamp:", objc_msgSend(v4, "downTime"));
}

- (void)performActionsForButtonUp:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = mach_absolute_time();
  SBLogButtonsCapture();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = objc_msgSend(v4, "downTime");
    v9 = 2048;
    v10 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Simulated Capture Button Up (down time: %llu, up time: %llu)", (uint8_t *)&v7, 0x16u);
  }

  -[SBCaptureHardwareButton _handleButtonUpAtTimestamp:forDownTimestamp:](self, "_handleButtonUpAtTimestamp:forDownTimestamp:", v5, objc_msgSend(v4, "downTime"));
}

- (void)cancelHardwareButtonPress
{
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  SBPhysicalButtonCompletionHandling *overrideButtonUpHandler;
  int v7;
  unint64_t v8;
  __int16 v9;
  unint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  self->_inhibitActionsForButtonCoordination = 1;
  if (self->_overrideButtonUpHandler)
  {
    v3 = -[SBCaptureHardwareButtonFullPressRecognizer pressUpTimestamp](self->_captureButtonRecognizer, "pressUpTimestamp");
    v4 = -[SBCaptureHardwareButtonFullPressRecognizer pressDownTimestamp](self->_captureButtonRecognizer, "pressDownTimestamp");
    SBLogButtonsCapture();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134218240;
      v8 = v4;
      v9 = 2048;
      v10 = v3;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Invoking scene override Button Up Action due to press cancellation (down time: %llu, up time: %llu)", (uint8_t *)&v7, 0x16u);
    }

    -[SBPhysicalButtonCompletionHandling completeWithResult:](self->_overrideButtonUpHandler, "completeWithResult:", 1);
    overrideButtonUpHandler = self->_overrideButtonUpHandler;
    self->_overrideButtonUpHandler = 0;

  }
  else
  {
    -[SBCaptureHardwareButtonAppActivator outOfBandCancel](self->_appActivator, "outOfBandCancel");
  }
}

- (id)hardwareButtonIdentifier
{
  return CFSTR("Capture");
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, a3);
}

- (uint64_t)simulationButtonArbiter
{
  if (result)
    return *(_QWORD *)(result + 256);
  return result;
}

- (void)setSimulationButtonArbiter:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 256), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simulationButtonArbiter, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
  objc_storeStrong((id *)&self->_hintDropletAssertion, 0);
  objc_storeStrong((id *)&self->_nextClickDownTimer, 0);
  objc_storeStrong((id *)&self->_captureAppBundleIdentifierForBufferedPress, 0);
  objc_storeStrong((id *)&self->_hudController, 0);
  objc_storeStrong((id *)&self->_authenticationController, 0);
  objc_storeStrong((id *)&self->_setupManager, 0);
  objc_storeStrong((id *)&self->_overrideButtonUpHandler, 0);
  objc_storeStrong((id *)&self->_buttonActiveAssertion, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_captureButtonRecognizer, 0);
  objc_storeStrong((id *)&self->_restrictionCoordinator, 0);
  objc_storeStrong((id *)&self->_appActivator, 0);
  objc_storeStrong((id *)&self->_configurationCoordinator, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_activationManager, 0);
  objc_storeStrong((id *)&self->_physicalButtonOverrideObserver, 0);
  objc_storeStrong((id *)&self->_physicalButtonOverrideManager, 0);
  objc_storeStrong((id *)&self->_mainWindowScene, 0);
  objc_storeStrong((id *)&self->_foregroundCaptureSceneTargets, 0);
  objc_storeStrong((id *)&self->_physicalButtonSceneTargets, 0);
  objc_storeStrong((id *)&self->_buttonEventRequestingScenes, 0);
  objc_storeStrong((id *)&self->_clientRequestedButtonPowerAssertion, 0);
  objc_storeStrong((id *)&self->_underlyingButtonPowerAssertion, 0);
  objc_storeStrong((id *)&self->_clientExclusivityRestrictionsByAssertionIdentifier, 0);
  objc_storeStrong((id *)&self->_clientPowerAssertions, 0);
}

- (void)activeScanningModeAssertionForReason:exclusiveWithReasons:invalidationBlock:.cold.1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3();
  v3 = 2112;
  v4 = v0;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, v1, (uint64_t)v1, "Adding capture button active assertion for reason: %@ with identifier: %@", v2);
  OUTLINED_FUNCTION_2_0();
}

void __103__SBCaptureHardwareButton_activeScanningModeAssertionForReason_exclusiveWithReasons_invalidationBlock___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = *(_QWORD *)(a1 + 40);
  objc_msgSend(a2, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412546;
  v8 = v4;
  v9 = 2112;
  v10 = v5;
  OUTLINED_FUNCTION_2_1(&dword_1D0540000, a3, v6, "Removing capture button active assertion for reason: %@ with identifier: %@", (uint8_t *)&v7);

}

- (void)_sendCaptureIntentToEligibleForegroundScene
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_5(&dword_1D0540000, v0, v1, "sendCaptureIntent: Capture supporting scene foreground (%{public}@) but not in active state; unable to send capture intent.",
    v2,
    v3,
    v4,
    v5,
    v6);
  OUTLINED_FUNCTION_2_0();
}

- (void)_shouldContinueAfterProcessingStateForClickDown
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBCaptureHardwareButton.m");
  v16 = 1024;
  v17 = 464;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
