@implementation SBCameraHardwareButton

- (void)setDispatchingRuleAssertion:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 24), a2);
}

- (void)setDeferringRuleAssertion:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 32), a2);
}

- (void)setPhysicalButtonOverrideObserver:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 40), a2);
}

- (void)setDisableDeferringToApplications:(BOOL)a3
{
  if (self->_disableDeferringToApplications != a3)
  {
    self->_disableDeferringToApplications = a3;
    -[SBCameraHardwareButton _updateCameraDeferringRule](self, "_updateCameraDeferringRule");
  }
}

- (uint64_t)allCameraShutterButtonPIDs
{
  if (result)
    return *(_QWORD *)(result + 48);
  return result;
}

- (void)_process:(id)a3 stateDidUpdate:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  int v14;
  _QWORD *v15;
  void *v16;
  int v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  NSMutableIndexSet *foregroundCameraShutterButtonPIDs;
  NSMutableIndexSet *v23;
  NSMutableIndexSet *v24;
  int v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  SBLogButtonsCamera();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v7, "state");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "endowmentNamespaces");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 138543874;
    v26 = v6;
    v27 = 2114;
    v28 = v7;
    v29 = 2114;
    v30 = v10;
    _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "process %{public}@ update:%{public}@ endowments:%{public}@", (uint8_t *)&v25, 0x20u);

  }
  v11 = objc_msgSend(v6, "pid");
  objc_msgSend(v7, "state");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "previousState");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v12, "taskState");
  v15 = (_QWORD *)MEMORY[0x1E0D22E58];
  if (v14 == 4)
  {
    objc_msgSend(v12, "endowmentNamespaces");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "containsObject:", *v15);

  }
  else
  {
    v17 = 0;
  }
  if (objc_msgSend(v13, "taskState") == 4)
  {
    objc_msgSend(v13, "endowmentNamespaces");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "containsObject:", *v15);

  }
  else
  {
    v19 = 0;
  }
  if (v19 != v17)
  {
    SBLogButtonsCamera();
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT);
    if (v17)
    {
      if (v21)
      {
        v25 = 138543362;
        v26 = v6;
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "process is running / visible:%{public}@", (uint8_t *)&v25, 0xCu);
      }

      foregroundCameraShutterButtonPIDs = self->_foregroundCameraShutterButtonPIDs;
      if (!foregroundCameraShutterButtonPIDs)
      {
        v23 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
        v24 = self->_foregroundCameraShutterButtonPIDs;
        self->_foregroundCameraShutterButtonPIDs = v23;

        foregroundCameraShutterButtonPIDs = self->_foregroundCameraShutterButtonPIDs;
      }
      -[NSMutableIndexSet addIndex:](foregroundCameraShutterButtonPIDs, "addIndex:", v11);
      if (-[NSMutableIndexSet count](self->_foregroundCameraShutterButtonPIDs, "count") == 1)
        -[SBSceneManager addObserver:](self->_mainDisplaySceneManager, "addObserver:", self);
    }
    else
    {
      if (v21)
      {
        v25 = 138543362;
        v26 = v6;
        _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "process is not running / not visible:%{public}@", (uint8_t *)&v25, 0xCu);
      }

      -[NSMutableIndexSet removeIndex:](self->_foregroundCameraShutterButtonPIDs, "removeIndex:", v11);
      -[NSMutableIndexSet removeIndex:](self->_foregroundPendingRemovalCameraShutterButtonPIDs, "removeIndex:", v11);
      if (!-[NSMutableIndexSet count](self->_foregroundCameraShutterButtonPIDs, "count"))
        -[SBSceneManager removeObserver:](self->_mainDisplaySceneManager, "removeObserver:", self);
    }
    -[SBCameraHardwareButton _updateCameraDeferringRule](self, "_updateCameraDeferringRule");
  }

}

- (void)_updateCameraDeferringRule
{
  if (!-[SBCameraHardwareButton _shouldDeferToNonSpringBoardProcess](self, "_shouldDeferToNonSpringBoardProcess")
    || !-[SBCameraHardwareButton _deferToPhysicalOverrideScene](self, "_deferToPhysicalOverrideScene")
    && !-[SBCameraHardwareButton _deferToForegroundApp](self, "_deferToForegroundApp"))
  {
    -[SBCameraHardwareButton _deferCameraPressesToSpringBoard](self, "_deferCameraPressesToSpringBoard");
  }
}

- (BOOL)_shouldDeferToNonSpringBoardProcess
{
  _BOOL4 disableDeferringToApplications;
  NSObject *v3;
  uint8_t v5[16];

  disableDeferringToApplications = self->_disableDeferringToApplications;
  if (self->_disableDeferringToApplications)
  {
    SBLogButtonsCamera();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "_shouldDeferToNonSpringBoardProcess shouldSendToSpringBoard:YES", v5, 2u);
    }

  }
  return !disableDeferringToApplications;
}

- (BOOL)_deferToPhysicalOverrideScene
{
  NSObject *v3;
  FBScene *physicalButtonOverrideScene;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  FBScene *v10;
  int v12;
  FBScene *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  SBLogButtonsCamera();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    physicalButtonOverrideScene = self->_physicalButtonOverrideScene;
    v12 = 138543362;
    v13 = physicalButtonOverrideScene;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "_deferToPhysicalOverrideScene scene:%{public}@", (uint8_t *)&v12, 0xCu);
  }

  v5 = -[FBScene isActive](self->_physicalButtonOverrideScene, "isActive");
  if (v5)
  {
    -[FBScene clientHandle](self->_physicalButtonOverrideScene, "clientHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "processHandle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "pid");

    SBLogButtonsCamera();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      BSProcessDescriptionForPID();
      v10 = (FBScene *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "_deferToPhysicalOverrideScene process:%{public}@", (uint8_t *)&v12, 0xCu);

    }
    if ((int)v8 < 1)
    {
      LOBYTE(v5) = 0;
    }
    else
    {
      -[SBCameraHardwareButton _deferCameraPressesToPID:](self, "_deferCameraPressesToPID:", v8);
      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (void)_deferCameraPressesToPID:(int)a3
{
  uint64_t v3;
  int lastCameraApplicationPID;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  BSInvalidatable *deferringRuleAssertion;
  void *v10;
  void *v11;
  void *v12;
  BSInvalidatable *v13;
  BSInvalidatable *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v3 = *(_QWORD *)&a3;
  v17 = *MEMORY[0x1E0C80C00];
  lastCameraApplicationPID = self->_lastCameraApplicationPID;
  SBLogButtonsCamera();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (lastCameraApplicationPID == (_DWORD)v3)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      -[SBCameraHardwareButton _deferCameraPressesToPID:].cold.1(v3, v7);
  }
  else
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      BSProcessDescriptionForPID();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138543362;
      v16 = v8;
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "_deferCameraPressesToPID: %{public}@", (uint8_t *)&v15, 0xCu);

    }
    -[BSInvalidatable invalidate](self->_deferringRuleAssertion, "invalidate");
    deferringRuleAssertion = self->_deferringRuleAssertion;
    self->_deferringRuleAssertion = 0;

    v7 = objc_msgSend(MEMORY[0x1E0D00D80], "new");
    objc_msgSend(MEMORY[0x1E0D00CA8], "environmentWithIdentifier:", CFSTR("cameraButton"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setEnvironment:](v7, "setEnvironment:", v10);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0D00D90], "new");
    objc_msgSend(v11, "setPid:", v3);
    -[BSMutableIntegerMap objectForKey:](self->_deferringTokensPerPID, "objectForKey:", (int)v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
      objc_msgSend(v11, "setToken:", v12);
    -[BKSHIDEventDeliveryManager deferEventsMatchingPredicate:toTarget:withReason:](self->_deliveryManager, "deferEventsMatchingPredicate:toTarget:withReason:", v7, v11, CFSTR("CameraIsAlive"));
    v13 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v14 = self->_deferringRuleAssertion;
    self->_deferringRuleAssertion = v13;

    self->_lastCameraApplicationPID = v3;
  }

}

- (void)physicalButtonSceneOverridesDidChange:(id)a3
{
  id obj;

  objc_msgSend(a3, "cameraBehaviorScene");
  obj = (id)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_physicalButtonOverrideScene, obj);
    -[SBCameraHardwareButton _updateCameraDeferringRule](self, "_updateCameraDeferringRule");
  }

}

- (BOOL)_deferToForegroundApp
{
  uint64_t v3;

  v3 = -[NSMutableIndexSet count](self->_foregroundCameraShutterButtonPIDs, "count");
  if (v3)
  {
    if (-[SBCameraHardwareButton _shouldDeferToCoverSheetCamera](self, "_shouldDeferToCoverSheetCamera"))
      -[SBCameraHardwareButton _deferCameraPressesToCameraApplication](self, "_deferCameraPressesToCameraApplication");
    else
      -[SBCameraHardwareButton _deferCameraPressesToPID:](self, "_deferCameraPressesToPID:", -[NSMutableIndexSet firstIndex](self->_foregroundCameraShutterButtonPIDs, "firstIndex"));
  }
  return v3 != 0;
}

- (BOOL)_shouldDeferToCoverSheetCamera
{
  void *v3;
  void *v4;
  BOOL v5;
  NSObject *v6;
  const char *v7;
  uint8_t *v8;
  __int16 v10;
  uint8_t buf[2];

  -[SBApplicationController cameraApplication](self->_applicationController, "cameraApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;
  if (v4)
  {
    if (!-[SBCameraHardwareButton _isCoverSheetCameraVisible](self, "_isCoverSheetCameraVisible"))
    {
      v5 = 0;
      goto LABEL_10;
    }
    SBLogButtonsCamera();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 0;
      v7 = "_shouldDeferToCoverSheetCamera YES: cover sheet visible && camera view is visible";
      v8 = (uint8_t *)&v10;
LABEL_7:
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
    }
  }
  else
  {
    SBLogButtonsCamera();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "_shouldDeferToCoverSheetCamera NO: camera app missing from device";
      v8 = buf;
      goto LABEL_7;
    }
  }

LABEL_10:
  return v5;
}

- (BOOL)_isCoverSheetCameraVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (-[SBCoverSheetPresentationManager isVisible](self->_coverSheetPresentationManager, "isVisible"))
  {
    -[SBCoverSheetPresentationManager coverSheetHostedAppSceneHandle](self->_coverSheetPresentationManager, "coverSheetHostedAppSceneHandle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "application");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBApplicationController cameraApplication](self->_applicationController, "cameraApplication");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v4)
    {
      v7 = objc_msgSend(v4, "isEqual:", v5);

      if ((v7 & 1) != 0)
        return 1;
    }
    else
    {

    }
  }
  return 0;
}

uint64_t __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_process:stateDidUpdate:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

void __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v5;
  id v6;
  id v7;
  id v8;

  v5 = a3;
  v8 = a4;
  v6 = v8;
  v7 = v5;
  BSDispatchMain();

}

- (SBCameraHardwareButton)initWithActivationManager:(id)a3
{
  id v6;
  void *v7;
  SBCameraHardwareButton *v8;
  SBCameraHardwareButton *v9;
  uint64_t v10;
  BKSHIDEventDeliveryManager *deliveryManager;
  uint64_t v12;
  SBApplicationController *applicationController;
  uint64_t v14;
  SBLockScreenManager *lockScreenManager;
  uint64_t v16;
  SBCoverSheetPresentationManager *coverSheetPresentationManager;
  uint64_t v18;
  SBBacklightController *backlightController;
  uint64_t v20;
  SBProximitySensorManager *proximitySensorManager;
  CMPocketStateManager *v22;
  CMPocketStateManager *pocketStateManager;
  SBSceneManager *v24;
  SBSceneManager *mainDisplaySceneManager;
  id *v26;
  uint64_t v27;
  BSInvalidatable *physicalButtonOverrideObserver;
  SBCameraHardwareButtonStudyLogger *v29;
  SBCameraHardwareButtonStudyLogger *studyLogger;
  SBBacklightStudyLogger *v31;
  SBBacklightStudyLogger *backlightStudyLogger;
  SBLiftToWakeStudyLogger *v33;
  void *v34;
  uint64_t v35;
  SBLiftToWakeStudyLogger *liftToWakeStudyLogger;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  BKSHIDEventDeliveryManager *v43;
  void *v44;
  uint64_t v45;
  BSInvalidatable *dispatchingRuleAssertion;
  SBHIDButtonStateArbiter *v47;
  SBHIDButtonStateArbiter *buttonArbiter;
  uint64_t v49;
  SBCameraHardwareButtonSettings *settings;
  void *v51;
  uint64_t v52;
  SBCameraHardwareButtonDefaults *defaults;
  SBCameraHardwareButtonDefaults *v54;
  void *v55;
  void *v56;
  void *v57;
  SBCameraHardwareButton *v58;
  id v59;
  void *v61;
  void *v62;
  void *v63;
  SBSceneManager *v64;
  void *v65;
  _QWORD v66[4];
  SBCameraHardwareButton *v67;
  objc_super v68;
  _QWORD v69[2];
  _QWORD v70[2];

  v70[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("activationManager != ((void *)0)"));
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBCameraHardwareButton initWithActivationManager:].cold.1(a2, (uint64_t)self, (uint64_t)v61);
    objc_msgSend(objc_retainAutorelease(v61), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0723420);
  }
  v7 = v6;
  v68.receiver = self;
  v68.super_class = (Class)SBCameraHardwareButton;
  v8 = -[SBCameraHardwareButton init](&v68, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_activationManager, a3);
    objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    deliveryManager = v9->_deliveryManager;
    v9->_deliveryManager = (BKSHIDEventDeliveryManager *)v10;

    +[SBApplicationController sharedInstance](SBApplicationController, "sharedInstance");
    v12 = objc_claimAutoreleasedReturnValue();
    applicationController = v9->_applicationController;
    v9->_applicationController = (SBApplicationController *)v12;

    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v14 = objc_claimAutoreleasedReturnValue();
    lockScreenManager = v9->_lockScreenManager;
    v9->_lockScreenManager = (SBLockScreenManager *)v14;

    +[SBCoverSheetPresentationManager sharedInstance](SBCoverSheetPresentationManager, "sharedInstance");
    v16 = objc_claimAutoreleasedReturnValue();
    coverSheetPresentationManager = v9->_coverSheetPresentationManager;
    v9->_coverSheetPresentationManager = (SBCoverSheetPresentationManager *)v16;

    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v18 = objc_claimAutoreleasedReturnValue();
    backlightController = v9->_backlightController;
    v9->_backlightController = (SBBacklightController *)v18;

    objc_msgSend((id)SBApp, "proximitySensorManager");
    v20 = objc_claimAutoreleasedReturnValue();
    proximitySensorManager = v9->_proximitySensorManager;
    v9->_proximitySensorManager = (SBProximitySensorManager *)v20;

    v22 = (CMPocketStateManager *)objc_alloc_init(MEMORY[0x1E0CA56A8]);
    pocketStateManager = v9->_pocketStateManager;
    v9->_pocketStateManager = v22;

    +[SBSceneManagerCoordinator mainDisplaySceneManager](SBSceneManagerCoordinator, "mainDisplaySceneManager");
    v24 = (SBSceneManager *)objc_claimAutoreleasedReturnValue();
    v65 = v7;
    mainDisplaySceneManager = v9->_mainDisplaySceneManager;
    v9->_mainDisplaySceneManager = v24;
    v64 = v24;

    -[SBSceneManager physicalButtonSceneOverrideManager](v64, "physicalButtonSceneOverrideManager");
    v26 = (id *)objc_claimAutoreleasedReturnValue();
    -[SBPhysicalButtonSceneOverrideManager addObserver:forReason:](v26, (uint64_t)v9, (uint64_t)CFSTR("camera hardware button"));
    v27 = objc_claimAutoreleasedReturnValue();
    physicalButtonOverrideObserver = v9->_physicalButtonOverrideObserver;
    v9->_physicalButtonOverrideObserver = (BSInvalidatable *)v27;

    v29 = objc_alloc_init(SBCameraHardwareButtonStudyLogger);
    studyLogger = v9->_studyLogger;
    v9->_studyLogger = v29;

    v31 = -[SBBacklightStudyLogger initWithController:]([SBBacklightStudyLogger alloc], "initWithController:", v9->_backlightController);
    backlightStudyLogger = v9->_backlightStudyLogger;
    v9->_backlightStudyLogger = v31;

    v33 = [SBLiftToWakeStudyLogger alloc];
    +[SBLiftToWakeController sharedController](SBLiftToWakeController, "sharedController");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = -[SBLiftToWakeStudyLogger initWithController:](v33, "initWithController:", v34);
    liftToWakeStudyLogger = v9->_liftToWakeStudyLogger;
    v9->_liftToWakeStudyLogger = (SBLiftToWakeStudyLogger *)v35;

    objc_msgSend(MEMORY[0x1E0D00D30], "build:", &__block_literal_global_33);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = (void *)objc_msgSend(MEMORY[0x1E0D00D98], "new");
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v63);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setSenderDescriptors:", v38);

    objc_msgSend(MEMORY[0x1E0D00D18], "descriptorWithPage:usage:", 144, 33);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v62);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setDescriptors:", v39);

    objc_msgSend(MEMORY[0x1E0D00CA8], "environmentWithIdentifier:", CFSTR("cameraButton"));
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D00CF0], "targetForDeferringEnvironment:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D00CE8], "ruleForDispatchingDiscreteEventsMatchingPredicate:toTarget:", v37, v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v9->_deliveryManager;
    v70[0] = v42;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 1);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSHIDEventDeliveryManager dispatchDiscreteEventsForReason:withRules:](v43, "dispatchDiscreteEventsForReason:withRules:", CFSTR("SBCameraHardwareButton"), v44);
    v45 = objc_claimAutoreleasedReturnValue();
    dispatchingRuleAssertion = v9->_dispatchingRuleAssertion;
    v9->_dispatchingRuleAssertion = (BSInvalidatable *)v45;

    v47 = objc_alloc_init(SBHIDButtonStateArbiter);
    buttonArbiter = v9->_buttonArbiter;
    v9->_buttonArbiter = v47;

    -[SBHIDButtonStateArbiter setDelegate:](v9->_buttonArbiter, "setDelegate:", v9);
    +[SBCameraHardwareButtonDomain rootSettings](SBCameraHardwareButtonDomain, "rootSettings");
    v49 = objc_claimAutoreleasedReturnValue();
    settings = v9->_settings;
    v9->_settings = (SBCameraHardwareButtonSettings *)v49;

    -[PTSettings addKeyObserver:](v9->_settings, "addKeyObserver:", v9);
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "cameraHardwareButtonDefaults");
    v52 = objc_claimAutoreleasedReturnValue();
    defaults = v9->_defaults;
    v9->_defaults = (SBCameraHardwareButtonDefaults *)v52;

    v54 = v9->_defaults;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shutterButtonLongPressTimeout");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = v55;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shutterButtonShouldUsePocketDetection");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v69[1] = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __52__SBCameraHardwareButton_initWithActivationManager___block_invoke_2;
    v66[3] = &unk_1E8E9DED8;
    v58 = v9;
    v67 = v58;
    v59 = (id)-[SBCameraHardwareButtonDefaults observeDefaults:onQueue:withBlock:](v54, "observeDefaults:onQueue:withBlock:", v57, MEMORY[0x1E0C80D38], v66);

    v7 = v65;
    -[SBCameraHardwareButton _updateSettingsForReason:](v58, "_updateSettingsForReason:", CFSTR("launch time"));
    -[SBCameraHardwareButton _reconfigureProcessMonitor](v58, "_reconfigureProcessMonitor");

  }
  return v9;
}

uint64_t __52__SBCameraHardwareButton_initWithActivationManager___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setAuthenticated:", 1);
}

uint64_t __52__SBCameraHardwareButton_initWithActivationManager___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSettingsForReason:", CFSTR("user defaults changed"));
}

- (void)dealloc
{
  objc_super v3;

  -[BSInvalidatable invalidate](self->_dispatchingRuleAssertion, "invalidate");
  -[BSInvalidatable invalidate](self->_deferringRuleAssertion, "invalidate");
  -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_longPressCancellationTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBCameraHardwareButton;
  -[SBCameraHardwareButton dealloc](&v3, sel_dealloc);
}

- (void)handleButtonEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue;
  uint64_t v6;

  IntegerValue = IOHIDEventGetIntegerValue();
  v6 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 144 && v6 == 33)
  {
    -[SBCameraHardwareButtonStudyLogger logButtonEvent:](self->_studyLogger, "logButtonEvent:", a3);
    -[SBHIDButtonStateArbiter processEvent:](self->_buttonArbiter, "processEvent:", a3);
  }
}

- (void)addProcessRequestingCameraButton:(int)a3 token:(id)a4
{
  id v6;
  NSObject *v7;
  NSMutableIndexSet *allCameraShutterButtonPIDs;
  NSMutableIndexSet *v9;
  NSMutableIndexSet *v10;
  BSMutableIntegerMap *v11;
  BSMutableIntegerMap *deferringTokensPerPID;
  _DWORD v13[2];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  SBLogButtonsCamera();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13[0] = 67109120;
    v13[1] = a3;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "add pid %d", (uint8_t *)v13, 8u);
  }

  allCameraShutterButtonPIDs = self->_allCameraShutterButtonPIDs;
  if (!allCameraShutterButtonPIDs)
  {
    v9 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
    v10 = self->_allCameraShutterButtonPIDs;
    self->_allCameraShutterButtonPIDs = v9;

    v11 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E0D017B8]);
    deferringTokensPerPID = self->_deferringTokensPerPID;
    self->_deferringTokensPerPID = v11;

    allCameraShutterButtonPIDs = self->_allCameraShutterButtonPIDs;
  }
  -[NSMutableIndexSet addIndex:](allCameraShutterButtonPIDs, "addIndex:", a3);
  if (v6)
    -[BSMutableIntegerMap setObject:forKey:](self->_deferringTokensPerPID, "setObject:forKey:", v6, a3);
  -[SBCameraHardwareButton _reconfigureProcessMonitor](self, "_reconfigureProcessMonitor");

}

- (void)removeProcessRequestingCameraButton:(int)a3
{
  NSObject *v5;
  _DWORD v6[2];
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogButtonsCamera();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6[0] = 67109120;
    v6[1] = a3;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "remove pid %d", (uint8_t *)v6, 8u);
  }

  -[NSMutableIndexSet removeIndex:](self->_allCameraShutterButtonPIDs, "removeIndex:", a3);
  -[NSMutableIndexSet removeIndex:](self->_foregroundCameraShutterButtonPIDs, "removeIndex:", a3);
  -[NSMutableIndexSet removeIndex:](self->_foregroundPendingRemovalCameraShutterButtonPIDs, "removeIndex:", a3);
  -[BSMutableIntegerMap removeObjectForKey:](self->_deferringTokensPerPID, "removeObjectForKey:", a3);
  -[SBCameraHardwareButton _reconfigureProcessMonitor](self, "_reconfigureProcessMonitor");
  -[SBCameraHardwareButton _updateCameraDeferringRule](self, "_updateCameraDeferringRule");
}

- (void)_updateSettingsForReason:(id)a3
{
  id v4;
  void *v5;
  int v6;
  double v7;
  double v8;
  double v9;
  double v10;
  int v11;
  NSObject *v12;
  const char *v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  _BYTE v18[22];
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D83028], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "prototypeSettingsEnabled");

  if (v6)
  {
    -[SBCameraHardwareButtonSettings shutterButtonLongPressTimeout](self->_settings, "shutterButtonLongPressTimeout");
    v8 = v7;
    -[SBCameraHardwareButtonSettings shutterButtonLongPressCancellationTimeout](self->_settings, "shutterButtonLongPressCancellationTimeout");
    v10 = v9;
    v11 = -[SBCameraHardwareButtonSettings shutterButtonShouldUsePocketDetection](self->_settings, "shutterButtonShouldUsePocketDetection");
    SBLogButtonsCamera();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v18 = 138543362;
      *(_QWORD *)&v18[4] = v4;
      v13 = "update settings (because %{public}@) from prototype settings";
LABEL_6:
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, v13, v18, 0xCu);
    }
  }
  else
  {
    -[SBCameraHardwareButtonDefaults shutterButtonLongPressTimeout](self->_defaults, "shutterButtonLongPressTimeout");
    v8 = v14;
    -[SBCameraHardwareButtonDefaults shutterButtonLongPressCancellationTimeout](self->_defaults, "shutterButtonLongPressCancellationTimeout");
    v10 = v15;
    v11 = -[SBCameraHardwareButtonDefaults shutterButtonShouldUsePocketDetection](self->_defaults, "shutterButtonShouldUsePocketDetection");
    SBLogButtonsCamera();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v18 = 138543362;
      *(_QWORD *)&v18[4] = v4;
      v13 = "update settings (because %{public}@) from defaults";
      goto LABEL_6;
    }
  }

  if (self->_shouldUsePocketStateDetection != v11
    || (-[SBHIDButtonStateArbiter longPressTimeout](self->_buttonArbiter, "longPressTimeout"), v16 != v8)
    || self->_longPressCancellationTimeout != v10)
  {
    self->_shouldUsePocketStateDetection = v11;
    -[SBHIDButtonStateArbiter setLongPressTimeout:](self->_buttonArbiter, "setLongPressTimeout:", fmin(fmax(v8, 0.0), 10.0), *(_OWORD *)v18);
    self->_longPressCancellationTimeout = fmin(fmax(v10, 0.0), 10.0);
    SBLogButtonsCamera();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v18 = 134218496;
      *(double *)&v18[4] = v8;
      *(_WORD *)&v18[12] = 2048;
      *(double *)&v18[14] = v10;
      v19 = 1024;
      v20 = v11;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "settings update longPressTimeout:%g cancelAfter:%g pocketDetectEnabled:%{BOOL}u", v18, 0x1Cu);
    }

  }
}

- (void)_reconfigureProcessMonitor
{
  id v3;
  NSMutableIndexSet *allCameraShutterButtonPIDs;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  allCameraShutterButtonPIDs = self->_allCameraShutterButtonPIDs;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__SBCameraHardwareButton__reconfigureProcessMonitor__block_invoke;
  v11[3] = &unk_1E8EA27D0;
  v10 = v3;
  v12 = v10;
  -[NSMutableIndexSet enumerateIndexesUsingBlock:](allCameraShutterButtonPIDs, "enumerateIndexesUsingBlock:", v11);
  -[SBApplicationController cameraApplication](self->_applicationController, "cameraApplication");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = (void *)MEMORY[0x1E0D87DA0];
    objc_msgSend(v5, "bundleIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "predicateMatchingBundleIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "addObject:", v9);
  }
  -[SBCameraHardwareButton _reconfigureProcessMonitorForPredicates:](self, "_reconfigureProcessMonitorForPredicates:", v10);

}

void __52__SBCameraHardwareButton__reconfigureProcessMonitor__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)MEMORY[0x1E0D87DA0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "predicateMatchingIdentifier:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
}

- (void)_reconfigureProcessMonitorForPredicates:(id)a3
{
  id v4;
  RBSProcessMonitor *processMonitor;
  RBSProcessMonitor *v6;
  void *v7;
  RBSProcessMonitor *v8;
  RBSProcessMonitor *v9;
  id v10;
  _QWORD v11[4];
  RBSProcessMonitor *v12;
  _QWORD v13[5];
  RBSProcessMonitor *v14;

  v4 = a3;
  v10 = v4;
  if (v4 && objc_msgSend(v4, "count"))
  {
    processMonitor = self->_processMonitor;
    if (processMonitor)
    {
      v11[0] = MEMORY[0x1E0C809B0];
      v11[1] = 3221225472;
      v11[2] = __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke_4;
      v11[3] = &unk_1E8EA33B0;
      v12 = (RBSProcessMonitor *)v10;
      -[RBSProcessMonitor updateConfiguration:](processMonitor, "updateConfiguration:", v11);
      v6 = v12;
    }
    else
    {
      v7 = (void *)MEMORY[0x1E0D87D90];
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke;
      v13[3] = &unk_1E8EA3388;
      v13[4] = self;
      v14 = (RBSProcessMonitor *)v10;
      objc_msgSend(v7, "monitorWithConfiguration:", v13);
      v8 = (RBSProcessMonitor *)objc_claimAutoreleasedReturnValue();
      v9 = self->_processMonitor;
      self->_processMonitor = v8;

      v6 = v14;
    }
  }
  else
  {
    -[RBSProcessMonitor invalidate](self->_processMonitor, "invalidate", v10);
    v6 = self->_processMonitor;
    self->_processMonitor = 0;
  }

}

void __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0D87DC0];
  v4 = a2;
  objc_msgSend(v3, "descriptor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = *MEMORY[0x1E0D22E58];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEndowmentNamespaces:", v6);

  objc_msgSend(v4, "setStateDescriptor:", v5);
  objc_msgSend(v4, "setServiceClass:", 33);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke_2;
  v7[3] = &unk_1E8EA3360;
  v7[4] = *(_QWORD *)(a1 + 32);
  objc_msgSend(v4, "setUpdateHandler:", v7);
  objc_msgSend(v4, "setPredicates:", *(_QWORD *)(a1 + 40));

}

uint64_t __66__SBCameraHardwareButton__reconfigureProcessMonitorForPredicates___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPredicates:", *(_QWORD *)(a1 + 32));
}

- (void)_deferCameraPressesToSpringBoard
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_1D0540000, log, OS_LOG_TYPE_DEBUG, "_deferCameraPressesToSpringBoard (but this is not a change)", v1, 2u);
}

- (void)_deferCameraPressesToApplication:(id)a3
{
  void *v4;
  NSObject *v5;
  BSInvalidatable *deferringRuleAssertion;
  uint8_t v7[16];

  if (a3)
  {
    objc_msgSend(a3, "processState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "isRunning"))
    {
      -[SBCameraHardwareButton _deferCameraPressesToPID:](self, "_deferCameraPressesToPID:", objc_msgSend(v4, "pid"));
    }
    else
    {
      SBLogButtonsCamera();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "_deferCameraPressesToApplication: camera app is not running, back to SpringBoard for now", v7, 2u);
      }

      -[BSInvalidatable invalidate](self->_deferringRuleAssertion, "invalidate");
      deferringRuleAssertion = self->_deferringRuleAssertion;
      self->_deferringRuleAssertion = 0;

      self->_lastCameraApplicationPID = -1;
    }

  }
}

- (void)_deferCameraPressesToCameraApplication
{
  id v3;

  -[SBApplicationController cameraApplication](self->_applicationController, "cameraApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBCameraHardwareButton _deferCameraPressesToApplication:](self, "_deferCameraPressesToApplication:", v3);

}

- (void)_launchCameraIfReady
{
  NSObject *v3;
  _BOOL4 v4;
  _BOOL4 v5;
  _BOOL4 v6;
  _BOOL4 v7;
  _BOOL4 v8;
  NSObject *v9;
  SBLockScreenManager *lockScreenManager;
  char v11;
  void *v12;
  SBCameraActivationManager *activationManager;
  SBCameraActivationManager *v14;
  _QWORD v15[5];
  char v16;
  const __CFString *v17;
  uint64_t v18;
  uint8_t buf[4];
  _BOOL4 v20;
  __int16 v21;
  _BOOL4 v22;
  __int16 v23;
  _BOOL4 v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  SBLogButtonsCamera();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = -[_SBCameraLaunchCondition isMet](self->_shouldLaunchCameraCondition, "isMet");
    v5 = -[_SBCameraLaunchCondition isMet](self->_longPressCondition, "isMet");
    v6 = -[_SBCameraLaunchCondition isMet](self->_outOfPocketCondition, "isMet");
    *(_DWORD *)buf = 67109632;
    v20 = v4;
    v21 = 1024;
    v22 = v5;
    v23 = 1024;
    v24 = v6;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "_launchCameraIfReady (launch:%{BOOL}u long press:%{BOOL}u outOfPocket:%{BOOL}u)", buf, 0x14u);
  }

  if (-[_SBCameraLaunchCondition isMet](self->_shouldLaunchCameraCondition, "isMet"))
  {
    if (!-[_SBCameraLaunchCondition isMet](self->_longPressCondition, "isMet"))
      goto LABEL_9;
    v7 = -[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked");
    v8 = -[SBBacklightController screenIsDim](self->_backlightController, "screenIsDim");
    SBLogButtonsCamera();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109376;
      v20 = v7;
      v21 = 1024;
      v22 = v8;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "_launchCameraIfReady: launching screen-locked:%{BOOL}u dim:%{BOOL}u", buf, 0xEu);
    }

    if (v7 && v8)
    {
      lockScreenManager = self->_lockScreenManager;
      v17 = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
      v18 = MEMORY[0x1E0C9AAB0];
      v11 = 1;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v18, &v17, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBLockScreenManager unlockUIFromSource:withOptions:](lockScreenManager, "unlockUIFromSource:withOptions:", 27, v12);

    }
    else
    {
LABEL_9:
      v11 = 0;
    }
    activationManager = self->_activationManager;
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __46__SBCameraHardwareButton__launchCameraIfReady__block_invoke;
    v15[3] = &unk_1E8EA33D8;
    v15[4] = self;
    v16 = v11;
    v14 = activationManager;
    -[SBCameraActivationManager activateCaptureApplicationWithBundleID:URL:fromSource:withPreludeAnimationToken:completion:]((uint64_t)v14, 0, 0, 0x20uLL, 0, v15);

  }
}

- (uint64_t)activationManager
{
  if (result)
    return *(_QWORD *)(result + 168);
  return result;
}

uint64_t __46__SBCameraHardwareButton__launchCameraIfReady__block_invoke(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "_notifyCoreAnalyticsCameraDidLaunchToLockScreen:screenWasOff:", a2, *(unsigned __int8 *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "_updateCameraDeferringRule");
}

- (void)_notifyCoreAnalyticsCameraDidLaunchToLockScreen:(BOOL)a3 screenWasOff:(BOOL)a4
{
  AnalyticsSendEventLazy();
}

id __87__SBCameraHardwareButton__notifyCoreAnalyticsCameraDidLaunchToLockScreen_screenWasOff___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _QWORD v6[2];
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  v6[0] = CFSTR("lockScreen");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6[1] = CFSTR("screenOff");
  v7[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 33));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v3;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, v6, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_startWaitingForLongPressCancellation
{
  NSObject *v3;
  double longPressCancellationTimeout;
  BSAbsoluteMachTimer *v5;
  BSAbsoluteMachTimer *longPressCancellationTimer;
  BSAbsoluteMachTimer *v7;
  double v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  double v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_longPressCancellationTimeout > 0.0
    && -[SBCoverSheetPresentationManager isVisible](self->_coverSheetPresentationManager, "isVisible"))
  {
    SBLogButtonsCamera();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      longPressCancellationTimeout = self->_longPressCancellationTimeout;
      *(_DWORD *)buf = 134217984;
      v13 = longPressCancellationTimeout;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "_startWaitingForLongPressCancellation: coversheet visible, starting timer for %g seconds", buf, 0xCu);
    }

    objc_initWeak((id *)buf, self);
    v5 = (BSAbsoluteMachTimer *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01690]), "initWithIdentifier:", CFSTR("SBCameraHardwareButton.longPressCancellationTimer"));
    longPressCancellationTimer = self->_longPressCancellationTimer;
    self->_longPressCancellationTimer = v5;

    v7 = self->_longPressCancellationTimer;
    v8 = self->_longPressCancellationTimeout;
    v9 = MEMORY[0x1E0C80D38];
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __63__SBCameraHardwareButton__startWaitingForLongPressCancellation__block_invoke;
    v10[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v11, (id *)buf);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v7, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v10, v8, 0.0);

    objc_destroyWeak(&v11);
    objc_destroyWeak((id *)buf);
  }
}

void __63__SBCameraHardwareButton__startWaitingForLongPressCancellation__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_longPressDidCancel");

}

- (void)_longPressDidCancel
{
  _SBCameraLaunchCondition *v3;
  _SBCameraLaunchCondition *shouldLaunchCameraCondition;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  -[SBCameraHardwareButton _stopWaitingForLongPressCancellation](self, "_stopWaitingForLongPressCancellation");
  +[_SBCameraLaunchCondition conditionWithValue:](_SBCameraLaunchCondition, "conditionWithValue:", 0);
  v3 = (_SBCameraLaunchCondition *)objc_claimAutoreleasedReturnValue();
  shouldLaunchCameraCondition = self->_shouldLaunchCameraCondition;
  self->_shouldLaunchCameraCondition = v3;

  if (-[SBCameraHardwareButton _isCoverSheetCameraVisible](self, "_isCoverSheetCameraVisible"))
  {
    SBLogButtonsCamera();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "_longPressDidCancel: returning to main coversheet page", v7, 2u);
    }

    -[SBLockScreenManager coverSheetViewController](self->_lockScreenManager, "coverSheetViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "activateMainPageWithCompletion:", &__block_literal_global_96_0);

  }
}

- (void)_stopWaitingForLongPressCancellation
{
  BSAbsoluteMachTimer *longPressCancellationTimer;

  -[BSAbsoluteMachTimer invalidate](self->_longPressCancellationTimer, "invalidate");
  longPressCancellationTimer = self->_longPressCancellationTimer;
  self->_longPressCancellationTimer = 0;

}

- (void)performActionsForButtonDown:(id)a3
{
  id v4;
  SBHardwareButtonCoordinator *hardwareButtonCoordinator;
  void *v6;
  _SBCameraLaunchCondition *v7;
  _SBCameraLaunchCondition *longPressCondition;
  _SBCameraLaunchCondition *v9;
  _SBCameraLaunchCondition *outOfPocketCondition;
  NSObject *v11;
  _SBCameraLaunchCondition *v12;
  _SBCameraLaunchCondition *shouldLaunchCameraCondition;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  _BOOL4 v17;
  _BOOL4 v18;
  NSObject *v19;
  _SBCameraLaunchCondition *v20;
  void *v21;
  _SBCameraLaunchCondition *v22;
  _SBCameraLaunchCondition *v23;
  CMPocketStateManager *pocketStateManager;
  _SBCameraLaunchCondition *v25;
  _SBCameraLaunchCondition *v26;
  NSObject *v27;
  NSObject *v28;
  _QWORD v29[5];
  uint8_t buf[4];
  uint64_t v31;
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  hardwareButtonCoordinator = self->_hardwareButtonCoordinator;
  -[SBCameraHardwareButton hardwareButtonIdentifier](self, "hardwareButtonIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(hardwareButtonCoordinator) = -[SBHardwareButtonCoordinator buttonShouldStart:](hardwareButtonCoordinator, "buttonShouldStart:", v6);

  if ((hardwareButtonCoordinator & 1) != 0)
  {
    -[SBCameraHardwareButton _startWaitingForLongPressCancellation](self, "_startWaitingForLongPressCancellation");
    +[_SBCameraLaunchCondition conditionWithValue:](_SBCameraLaunchCondition, "conditionWithValue:", 0);
    v7 = (_SBCameraLaunchCondition *)objc_claimAutoreleasedReturnValue();
    longPressCondition = self->_longPressCondition;
    self->_longPressCondition = v7;

    +[_SBCameraLaunchCondition conditionWithValue:](_SBCameraLaunchCondition, "conditionWithValue:", 0);
    v9 = (_SBCameraLaunchCondition *)objc_claimAutoreleasedReturnValue();
    outOfPocketCondition = self->_outOfPocketCondition;
    self->_outOfPocketCondition = v9;

    if (-[SBBacklightController screenIsDim](self->_backlightController, "screenIsDim")
      && -[SBProximitySensorManager isObjectInProximity](self->_proximitySensorManager, "isObjectInProximity"))
    {
      SBLogButtonsCamera();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: object in proximity, bailing", buf, 2u);
      }

      +[_SBCameraLaunchCondition conditionWithValue:](_SBCameraLaunchCondition, "conditionWithValue:", 0);
      v12 = (_SBCameraLaunchCondition *)objc_claimAutoreleasedReturnValue();
      shouldLaunchCameraCondition = self->_shouldLaunchCameraCondition;
      self->_shouldLaunchCameraCondition = v12;

      objc_msgSend(v4, "reset");
    }
    else
    {
      -[SBHIDButtonStateArbiter longPressTimeout](self->_buttonArbiter, "longPressTimeout");
      v16 = v15;
      v17 = -[SBLockScreenManager isUILocked](self->_lockScreenManager, "isUILocked");
      v18 = -[SBBacklightController screenIsDim](self->_backlightController, "screenIsDim");
      if (v17
        && v18
        && -[SBCameraHardwareButtonSettings shutterButtonShouldUsePocketDetection](self->_settings, "shutterButtonShouldUsePocketDetection"))
      {
        SBLogButtonsCamera();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: checking pocket state", buf, 2u);
        }

        v20 = self->_outOfPocketCondition;
        v32[0] = self->_longPressCondition;
        v32[1] = v20;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        +[_SBCameraLaunchCondition conditionWithConditions:](_SBCameraLaunchCondition, "conditionWithConditions:", v21);
        v22 = (_SBCameraLaunchCondition *)objc_claimAutoreleasedReturnValue();
        v23 = self->_shouldLaunchCameraCondition;
        self->_shouldLaunchCameraCondition = v22;

        pocketStateManager = self->_pocketStateManager;
        -[SBBacklightController defaultLockScreenDimIntervalWhenNotificationsPresent](self->_backlightController, "defaultLockScreenDimIntervalWhenNotificationsPresent");
        v29[0] = MEMORY[0x1E0C809B0];
        v29[1] = 3221225472;
        v29[2] = __54__SBCameraHardwareButton_performActionsForButtonDown___block_invoke;
        v29[3] = &unk_1E8EA3440;
        v29[4] = self;
        -[CMPocketStateManager queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:](pocketStateManager, "queryStateOntoQueue:andMonitorFor:withTimeout:andHandler:", MEMORY[0x1E0C80D38], v29);
      }
      else
      {
        +[_SBCameraLaunchCondition conditionWithValue:](_SBCameraLaunchCondition, "conditionWithValue:", 1);
        v25 = (_SBCameraLaunchCondition *)objc_claimAutoreleasedReturnValue();
        v26 = self->_shouldLaunchCameraCondition;
        self->_shouldLaunchCameraCondition = v25;

        SBLogButtonsCamera();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          v31 = v16;
          _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: waiting for long press (timeout:%g)", buf, 0xCu);
        }

      }
      if (-[SBHIDButtonStateArbiter isLongPressDisabled](self->_buttonArbiter, "isLongPressDisabled"))
      {
        SBLogButtonsCamera();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: long press timeout is zero", buf, 2u);
        }

        -[_SBCameraLaunchCondition setMet:](self->_longPressCondition, "setMet:", 1);
        -[SBCameraHardwareButton _launchCameraIfReady](self, "_launchCameraIfReady");
      }
    }
  }
  else
  {
    SBLogButtonsCamera();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: button coordinator says NO, bailing", buf, 2u);
    }

  }
}

void __54__SBCameraHardwareButton_performActionsForButtonDown___block_invoke(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  _BOOL4 v5;
  int v6;
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 240), "logPocketState:", a2);
  SBLogButtonsCamera();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if ((a2 & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    if (v5)
    {
      v6 = 67109120;
      v7 = a2;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: not out-of-pocket (%d); ignoring press",
        (uint8_t *)&v6,
        8u);
    }

  }
  else
  {
    if (v5)
    {
      v6 = 67109120;
      v7 = a2;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "performActionsForButtonDown: out-of-pocket (%d)", (uint8_t *)&v6, 8u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "setMet:", 1);
    objc_msgSend(*(id *)(a1 + 32), "_launchCameraIfReady");
  }
}

- (void)performActionsForButtonLongPress:(id)a3
{
  -[_SBCameraLaunchCondition setMet:](self->_longPressCondition, "setMet:", 1);
  -[SBCameraHardwareButton _launchCameraIfReady](self, "_launchCameraIfReady");
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_settings == a3)
    -[SBCameraHardwareButton _updateSettingsForReason:](self, "_updateSettingsForReason:", CFSTR("prototype settings changed"), a4);
}

- (void)sceneManager:(id)a3 didAddExternalForegroundApplicationSceneHandle:(id)a4
{
  void *v5;
  void *v6;
  unsigned int v7;
  NSObject *v8;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a4, "application", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "pid");

  if ((int)v7 >= 1
    && -[NSMutableIndexSet containsIndex:](self->_foregroundPendingRemovalCameraShutterButtonPIDs, "containsIndex:", v7))
  {
    SBLogButtonsCamera();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "pid restored:%d", (uint8_t *)v9, 8u);
    }

    -[NSMutableIndexSet removeIndex:](self->_foregroundPendingRemovalCameraShutterButtonPIDs, "removeIndex:", v7);
    -[NSMutableIndexSet addIndex:](self->_foregroundCameraShutterButtonPIDs, "addIndex:", v7);
    -[SBCameraHardwareButton _updateCameraDeferringRule](self, "_updateCameraDeferringRule");
  }
}

- (void)sceneManager:(id)a3 didRemoveExternalForegroundApplicationSceneHandle:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  int v18;
  NSObject *v19;
  NSMutableIndexSet *foregroundPendingRemovalCameraShutterButtonPIDs;
  NSMutableIndexSet *v21;
  NSMutableIndexSet *v22;
  NSObject *v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  unsigned int v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  BSDispatchQueueAssertMain();
  objc_msgSend(v7, "application");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pid");

  if ((int)v10 >= 1
    && -[NSMutableIndexSet containsIndex:](self->_foregroundCameraShutterButtonPIDs, "containsIndex:", v10))
  {
    v24 = v6;
    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    objc_msgSend(v6, "externalForegroundApplicationSceneHandles");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      while (2)
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "application");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "processState");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "pid");

          if (v18 == v10)
          {

            SBLogButtonsCamera();
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 67109120;
              v30 = v10;
              _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "foreground scenes still exist for PID %d", buf, 8u);
            }

            goto LABEL_19;
          }
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        if (v13)
          continue;
        break;
      }
    }

    SBLogButtonsCamera();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v30 = v10;
      _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_DEFAULT, "removing PID %d", buf, 8u);
    }

    foregroundPendingRemovalCameraShutterButtonPIDs = self->_foregroundPendingRemovalCameraShutterButtonPIDs;
    if (!foregroundPendingRemovalCameraShutterButtonPIDs)
    {
      v21 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x1E0CB3788]);
      v22 = self->_foregroundPendingRemovalCameraShutterButtonPIDs;
      self->_foregroundPendingRemovalCameraShutterButtonPIDs = v21;

      foregroundPendingRemovalCameraShutterButtonPIDs = self->_foregroundPendingRemovalCameraShutterButtonPIDs;
    }
    -[NSMutableIndexSet addIndex:](foregroundPendingRemovalCameraShutterButtonPIDs, "addIndex:", v10);
    -[NSMutableIndexSet removeIndex:](self->_foregroundCameraShutterButtonPIDs, "removeIndex:", v10);
LABEL_19:
    v6 = v24;
    -[SBCameraHardwareButton _updateCameraDeferringRule](self, "_updateCameraDeferringRule");
  }

}

- (void)cancelHardwareButtonPress
{
  -[SBHIDButtonStateArbiter reset](self->_buttonArbiter, "reset");
}

- (id)hardwareButtonIdentifier
{
  return CFSTR("Camera");
}

- (SBHardwareButtonCoordinator)hardwareButtonCoordinator
{
  return self->_hardwareButtonCoordinator;
}

- (void)setHardwareButtonCoordinator:(id)a3
{
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, a3);
}

- (BOOL)disableDeferringToApplications
{
  return self->_disableDeferringToApplications;
}

- (uint64_t)lastCameraApplicationPID
{
  if (result)
    return *(unsigned int *)(result + 12);
  return result;
}

- (uint64_t)setLastCameraApplicationPID:(uint64_t)result
{
  if (result)
    *(_DWORD *)(result + 12) = a2;
  return result;
}

- (void)setAllCameraShutterButtonPIDs:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 48), a2);
}

- (uint64_t)foregroundCameraShutterButtonPIDs
{
  if (result)
    return *(_QWORD *)(result + 56);
  return result;
}

- (void)setForegroundCameraShutterButtonPIDs:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 56), a2);
}

- (uint64_t)foregroundPendingRemovalCameraShutterButtonPIDs
{
  if (result)
    return *(_QWORD *)(result + 64);
  return result;
}

- (void)setForegroundPendingRemovalCameraShutterButtonPIDs:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 64), a2);
}

- (uint64_t)deferringTokensPerPID
{
  if (result)
    return *(_QWORD *)(result + 72);
  return result;
}

- (void)setDeferringTokensPerPID:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 72), a2);
}

- (void)setButtonArbiter:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 80), a2);
}

- (void)setProcessMonitor:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 88), a2);
}

- (uint64_t)pocketStateManager
{
  if (result)
    return *(_QWORD *)(result + 96);
  return result;
}

- (void)setPocketStateManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 96), a2);
}

- (uint64_t)shouldLaunchCameraCondition
{
  if (result)
    return *(_QWORD *)(result + 104);
  return result;
}

- (void)setShouldLaunchCameraCondition:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 104), a2);
}

- (uint64_t)longPressCondition
{
  if (result)
    return *(_QWORD *)(result + 112);
  return result;
}

- (void)setLongPressCondition:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 112), a2);
}

- (uint64_t)outOfPocketCondition
{
  if (result)
    return *(_QWORD *)(result + 120);
  return result;
}

- (void)setOutOfPocketCondition:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 120), a2);
}

- (uint64_t)longPressCancellationTimer
{
  if (result)
    return *(_QWORD *)(result + 128);
  return result;
}

- (void)setLongPressCancellationTimer:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 128), a2);
}

- (uint64_t)physicalButtonOverrideScene
{
  if (result)
    return *(_QWORD *)(result + 136);
  return result;
}

- (void)setPhysicalButtonOverrideScene:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 136), a2);
}

- (double)longPressCancellationTimeout
{
  if (a1)
    return *(double *)(a1 + 144);
  else
    return 0.0;
}

- (uint64_t)setLongPressCancellationTimeout:(uint64_t)result
{
  if (result)
    *(double *)(result + 144) = a2;
  return result;
}

- (BOOL)shouldUsePocketStateDetection
{
  if (result)
    return *(_BYTE *)(result + 9) != 0;
  return result;
}

- (uint64_t)setShouldUsePocketStateDetection:(uint64_t)result
{
  if (result)
    *(_BYTE *)(result + 9) = a2;
  return result;
}

- (uint64_t)deliveryManager
{
  if (result)
    return *(_QWORD *)(result + 152);
  return result;
}

- (void)setDeliveryManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 152), a2);
}

- (uint64_t)applicationController
{
  if (result)
    return *(_QWORD *)(result + 160);
  return result;
}

- (void)setApplicationController:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 160), a2);
}

- (void)setActivationManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 168), a2);
}

- (uint64_t)lockScreenManager
{
  if (result)
    return *(_QWORD *)(result + 176);
  return result;
}

- (void)setLockScreenManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 176), a2);
}

- (uint64_t)coverSheetPresentationManager
{
  if (result)
    return *(_QWORD *)(result + 184);
  return result;
}

- (void)setCoverSheetPresentationManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 184), a2);
}

- (uint64_t)backlightController
{
  if (result)
    return *(_QWORD *)(result + 192);
  return result;
}

- (void)setBacklightController:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 192), a2);
}

- (uint64_t)proximitySensorManager
{
  if (result)
    return *(_QWORD *)(result + 200);
  return result;
}

- (void)setProximitySensorManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 200), a2);
}

- (uint64_t)mainDisplaySceneManager
{
  if (result)
    return *(_QWORD *)(result + 208);
  return result;
}

- (void)setMainDisplaySceneManager:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 208), a2);
}

- (uint64_t)settings
{
  if (result)
    return *(_QWORD *)(result + 216);
  return result;
}

- (void)setSettings:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 216), a2);
}

- (uint64_t)defaults
{
  if (result)
    return *(_QWORD *)(result + 224);
  return result;
}

- (void)setDefaults:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 224), a2);
}

- (uint64_t)backlightStudyLogger
{
  if (result)
    return *(_QWORD *)(result + 232);
  return result;
}

- (void)setBacklightStudyLogger:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 232), a2);
}

- (uint64_t)studyLogger
{
  if (result)
    return *(_QWORD *)(result + 240);
  return result;
}

- (void)setStudyLogger:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 240), a2);
}

- (uint64_t)liftToWakeStudyLogger
{
  if (result)
    return *(_QWORD *)(result + 248);
  return result;
}

- (void)setLiftToWakeStudyLogger:(uint64_t)a1
{
  if (a1)
    objc_storeStrong((id *)(a1 + 248), a2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_liftToWakeStudyLogger, 0);
  objc_storeStrong((id *)&self->_studyLogger, 0);
  objc_storeStrong((id *)&self->_backlightStudyLogger, 0);
  objc_storeStrong((id *)&self->_defaults, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_mainDisplaySceneManager, 0);
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_backlightController, 0);
  objc_storeStrong((id *)&self->_coverSheetPresentationManager, 0);
  objc_storeStrong((id *)&self->_lockScreenManager, 0);
  objc_storeStrong((id *)&self->_activationManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
  objc_storeStrong((id *)&self->_physicalButtonOverrideScene, 0);
  objc_storeStrong((id *)&self->_longPressCancellationTimer, 0);
  objc_storeStrong((id *)&self->_outOfPocketCondition, 0);
  objc_storeStrong((id *)&self->_longPressCondition, 0);
  objc_storeStrong((id *)&self->_shouldLaunchCameraCondition, 0);
  objc_storeStrong((id *)&self->_pocketStateManager, 0);
  objc_storeStrong((id *)&self->_processMonitor, 0);
  objc_storeStrong((id *)&self->_buttonArbiter, 0);
  objc_storeStrong((id *)&self->_deferringTokensPerPID, 0);
  objc_storeStrong((id *)&self->_foregroundPendingRemovalCameraShutterButtonPIDs, 0);
  objc_storeStrong((id *)&self->_foregroundCameraShutterButtonPIDs, 0);
  objc_storeStrong((id *)&self->_allCameraShutterButtonPIDs, 0);
  objc_storeStrong((id *)&self->_physicalButtonOverrideObserver, 0);
  objc_storeStrong((id *)&self->_deferringRuleAssertion, 0);
  objc_storeStrong((id *)&self->_dispatchingRuleAssertion, 0);
  objc_storeStrong((id *)&self->_hardwareButtonCoordinator, 0);
}

- (void)initWithActivationManager:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
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
  v15 = CFSTR("SBCameraHardwareButton.m");
  v16 = 1024;
  v17 = 155;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)_deferCameraPressesToPID:(int)a1 .cold.1(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "_deferCameraPressesToPID: PID:%d (but this is not a change)", (uint8_t *)v2, 8u);
}

@end
