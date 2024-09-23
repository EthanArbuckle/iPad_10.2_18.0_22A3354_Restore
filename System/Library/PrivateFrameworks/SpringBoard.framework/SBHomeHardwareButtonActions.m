@implementation SBHomeHardwareButtonActions

- (id)initWitHomeButtonType:(int64_t)a3
{
  SBHomeHardwareButtonActions *v4;
  uint64_t v5;
  SBHardwareButtonService *hardwareButtonService;
  uint64_t v7;
  SBProximitySensorManager *proximitySensorManager;
  uint64_t v9;
  SBHardwareButtonInteraction *siriButtonInteraction;
  uint64_t v11;
  SBHardwareButtonGestureParameters *siriGestureParameters;
  uint64_t v13;
  SBHardwareButtonInteraction *accessibilityButtonInteraction;
  uint64_t v15;
  SBHardwareButtonGestureParameters *accessibilityGestureParameters;
  SBHardwareButtonActionList *v17;
  SBHardwareButtonActionList *buttonUpActions;
  SBHardwareButtonActionList *v19;
  SBHardwareButtonActionList *buttonUpPostActions;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SBHomeHardwareButtonActions;
  v4 = -[SBHomeHardwareButtonActions init](&v22, sel_init);
  if (v4)
  {
    +[SBHardwareButtonService sharedInstance](SBHardwareButtonService, "sharedInstance");
    v5 = objc_claimAutoreleasedReturnValue();
    hardwareButtonService = v4->_hardwareButtonService;
    v4->_hardwareButtonService = (SBHardwareButtonService *)v5;

    objc_msgSend((id)SBApp, "proximitySensorManager");
    v7 = objc_claimAutoreleasedReturnValue();
    proximitySensorManager = v4->_proximitySensorManager;
    v4->_proximitySensorManager = (SBProximitySensorManager *)v7;

    v4->_homeButtonType = a3;
    if (a3 != 2)
    {
      +[SBSiriHardwareButtonInteraction hardwareButtonInteractionForHomeButton](SBSiriHardwareButtonInteraction, "hardwareButtonInteractionForHomeButton");
      v9 = objc_claimAutoreleasedReturnValue();
      siriButtonInteraction = v4->_siriButtonInteraction;
      v4->_siriButtonInteraction = (SBHardwareButtonInteraction *)v9;

      -[SBHardwareButtonInteraction addHardwareButtonGestureParametersObserver:](v4->_siriButtonInteraction, "addHardwareButtonGestureParametersObserver:", v4);
      -[SBHardwareButtonInteraction hardwareButtonGestureParameters](v4->_siriButtonInteraction, "hardwareButtonGestureParameters");
      v11 = objc_claimAutoreleasedReturnValue();
      siriGestureParameters = v4->_siriGestureParameters;
      v4->_siriGestureParameters = (SBHardwareButtonGestureParameters *)v11;

      +[SBAccessibilityHardwareButtonInteraction hardwareButtonInteractionForHomeButton](SBAccessibilityHardwareButtonInteraction, "hardwareButtonInteractionForHomeButton");
      v13 = objc_claimAutoreleasedReturnValue();
      accessibilityButtonInteraction = v4->_accessibilityButtonInteraction;
      v4->_accessibilityButtonInteraction = (SBHardwareButtonInteraction *)v13;

      -[SBHardwareButtonInteraction addHardwareButtonGestureParametersObserver:](v4->_accessibilityButtonInteraction, "addHardwareButtonGestureParametersObserver:", v4);
      -[SBHardwareButtonInteraction hardwareButtonGestureParameters](v4->_accessibilityButtonInteraction, "hardwareButtonGestureParameters");
      v15 = objc_claimAutoreleasedReturnValue();
      accessibilityGestureParameters = v4->_accessibilityGestureParameters;
      v4->_accessibilityGestureParameters = (SBHardwareButtonGestureParameters *)v15;

    }
    v17 = objc_alloc_init(SBHardwareButtonActionList);
    buttonUpActions = v4->_buttonUpActions;
    v4->_buttonUpActions = v17;

    v19 = objc_alloc_init(SBHardwareButtonActionList);
    buttonUpPostActions = v4->_buttonUpPostActions;
    v4->_buttonUpPostActions = v19;

    SBGuidedAccessPrepare();
  }
  return v4;
}

- (void)configureForwardingToLockButtonActions:(id)a3
{
  SBHardwareButtonInteraction *v4;
  SBHardwareButtonInteraction *siriButtonInteraction;
  id v6;

  if (self->_homeButtonType == 2)
  {
    objc_msgSend(a3, "siriButtonInteraction");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    +[SBSiriHardwareButtonEventsOnlyButtonInteraction hardwareButtonInteractionForHomeButtonForwardingToInteraction:](SBSiriHardwareButtonEventsOnlyButtonInteraction, "hardwareButtonInteractionForHomeButtonForwardingToInteraction:", v6);
    v4 = (SBHardwareButtonInteraction *)objc_claimAutoreleasedReturnValue();
    siriButtonInteraction = self->_siriButtonInteraction;
    self->_siriButtonInteraction = v4;

  }
}

- (void)setButtonDown:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  self->_buttonDown = a3;
  -[SBHardwareButtonActionList setButtonDown:](self->_buttonUpActions, "setButtonDown:");
  -[SBHardwareButtonActionList setButtonDown:](self->_buttonUpPostActions, "setButtonDown:", v3);
}

- (void)performInitialButtonDownActions
{
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  _BOOL4 v17;
  void *v18;
  int v19;
  NSObject *v20;
  _BOOL4 v21;
  void *v22;
  NSObject *v23;
  const char *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  NSObject *v31;
  const char *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  _QWORD v37[2];
  _QWORD v38[2];
  uint8_t buf[4];
  NSObject *v40;
  __int16 v41;
  id v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  if (!SBGuidedAccessIsActive())
  {
    self->_dontUnlockOnButtonUp = 0;
    -[SBHomeHardwareButtonActions setButtonDown:](self, "setButtonDown:", 1);
    self->_menuButtonHoldStartTime = mach_absolute_time();
    self->_menuButtonHoldStartAbsoluteTime = CFAbsoluteTimeGetCurrent();
    dispatch_get_global_queue(0, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v6, &__block_literal_global_134);

    +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
    v4 = objc_claimAutoreleasedReturnValue();
    if (-[NSObject isInEmergencyCallbackMode](v4, "isInEmergencyCallbackMode")
      && -[NSObject activeCallExists](v4, "activeCallExists"))
    {
      SBLogButtonsHome();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        goto LABEL_45;
      NSStringFromSelector(a2);
      v7 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v7;
      v8 = "%{public}@ result: ECBM enabled and active call exists";
LABEL_18:
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, v8, buf, 0xCu);

      goto LABEL_45;
    }
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "isInSetupMode"))
    {
      v10 = -[NSObject inCall](v4, "inCall");

      if (v10)
      {
        SBLogButtonsHome();
        v5 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          goto LABEL_45;
        NSStringFromSelector(a2);
        v7 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v7;
        v8 = "%{public}@ result: on a call in setup mode";
        goto LABEL_18;
      }
    }
    else
    {

    }
    if (-[SBProximitySensorManager isObjectInProximity](self->_proximitySensorManager, "isObjectInProximity"))
      -[SBProximitySensorManager resetProximityCalibration](self->_proximitySensorManager, "resetProximityCalibration");
    +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isAnyTouchGestureRunning");

    if (v12)
    {
      SBLogButtonsHome();
      v5 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        goto LABEL_45;
      NSStringFromSelector(a2);
      v7 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v7;
      v8 = "%{public}@ result: system gesture running";
      goto LABEL_18;
    }
    v13 = objc_opt_class();
    SBSafeCast(v13, self->_siriButtonInteraction);
    v14 = objc_claimAutoreleasedReturnValue();
    v5 = v14;
    if (v14)
      -[NSObject setInitialPressDownTime:](v14, "setInitialPressDownTime:", self->_menuButtonHoldStartAbsoluteTime);
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    self->_screenWasDimOnMenuDown = objc_msgSend(v16, "screenIsDim");
    v36 = 0;
    v17 = -[SBHomeHardwareButtonActions _shouldIgnorePressesDueToProxOrIdle:](self, "_shouldIgnorePressesDueToProxOrIdle:", &v36);
    v35 = v36;
    if (v17)
    {
      objc_msgSend((id)SBApp, "lockHardwareButton");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = objc_msgSend(v18, "reverseFadeOutIfNeeded");

      SBLogButtonsHome();
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = os_log_type_enabled(v20, OS_LOG_TYPE_INFO);
      if (v19)
      {
        v22 = v35;
        if (v21)
        {
          NSStringFromSelector(a2);
          v23 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v23;
          v41 = 2114;
          v42 = v35;
          v24 = "%{public}@ result: reversed lock fadeout because %{public}@";
LABEL_34:
          _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_INFO, v24, buf, 0x16u);

        }
      }
      else
      {
        v22 = v35;
        if (v21)
        {
          NSStringFromSelector(a2);
          v23 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v40 = v23;
          v41 = 2114;
          v42 = v35;
          v24 = "%{public}@ result: ignored because %{public}@";
          goto LABEL_34;
        }
      }
LABEL_44:

      goto LABEL_45;
    }
    +[SBScreenWakeAnimationController sharedInstance](SBScreenWakeAnimationController, "sharedInstance");
    v20 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "screenIsOn")
      && (-[NSObject isSleepAnimationInProgress](v20, "isSleepAnimationInProgress") & 1) == 0)
    {
      objc_msgSend(v15, "isUILocked");
    }
    else
    {
      v25 = -[NSObject isWakeAnimationInProgress](v20, "isWakeAnimationInProgress");
      if (objc_msgSend(v15, "isUILocked") && (v25 & 1) == 0)
      {
        v34 = v16;
        SBLogButtonsHome();
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v27 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v40 = v27;
          _os_log_impl(&dword_1D0540000, v26, OS_LOG_TYPE_INFO, "%{public}@ result: turning on the screen if necessary", buf, 0xCu);

        }
        v37[0] = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v38[0] = v33;
        v37[1] = CFSTR("SBUIUnlockOptionsStartFadeInAnimation");
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", 1);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v38[1] = v28;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 2);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "unlockUIFromSource:withOptions:", 15, v29);

        self->_dontUnlockOnButtonUp = 1;
        v16 = v34;
      }
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && -[SBHardwareButtonInteraction consumeInitialPressDown](self->_siriButtonInteraction, "consumeInitialPressDown"))
    {
      SBLogButtonsHome();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v31 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v31;
        v32 = "%{public}@ result: siriButtonInteraction handled it";
LABEL_42:
        _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_INFO, v32, buf, 0xCu);

      }
    }
    else
    {
      SBLogButtonsHome();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v31 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v31;
        v32 = "%{public}@ result: ignored";
        goto LABEL_42;
      }
    }
    v22 = v35;

    goto LABEL_44;
  }
  SBLogButtonsHome();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "%{public}@ result: guided access", buf, 0xCu);
LABEL_45:

  }
}

uint64_t __62__SBHomeHardwareButtonActions_performInitialButtonDownActions__block_invoke()
{
  return +[SBMediaController sendResetPlaybackTimeoutCommand](SBMediaController, "sendResetPlaybackTimeoutCommand");
}

- (BOOL)_performButtonPreflightActions
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  BOOL v14;
  int v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "postNotificationName:object:", *MEMORY[0x1E0DAC358], 0);

  ADClientAddValueForScalarKey();
  objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "emitEvent:", 0);

  -[SBHardwareButtonActionList performQueuedButtonUpActions](self->_buttonUpActions, "performQueuedButtonUpActions");
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBHardwareButtonInteraction observeFinalPressUp](self->_siriButtonInteraction, "observeFinalPressUp");
  +[SBTelephonyManager sharedTelephonyManager](SBTelephonyManager, "sharedTelephonyManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isInEmergencyCallbackMode")
    && objc_msgSend(v6, "isEmergencyCallActive"))
  {
    SBLogButtonsHome();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v8;
      v9 = "%{public}@ result: ECBM enabled and emergency call is active";
LABEL_15:
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v16, 0xCu);

      goto LABEL_16;
    }
    goto LABEL_16;
  }
  +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isInSetupMode"))
  {

LABEL_12:
    +[SBSystemGestureManager mainDisplayManager](SBSystemGestureManager, "mainDisplayManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isAnyTouchGestureRunning");

    if (!v13)
    {
      v14 = 1;
      goto LABEL_18;
    }
    SBLogButtonsHome();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543362;
      v17 = v8;
      v9 = "%{public}@ result: system gesture running";
      goto LABEL_15;
    }
    goto LABEL_16;
  }
  v11 = objc_msgSend(v6, "inCall");

  if (!v11)
    goto LABEL_12;
  SBLogButtonsHome();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138543362;
    v17 = v8;
    v9 = "%{public}@ result: on a call in setup mode";
    goto LABEL_15;
  }
LABEL_16:

  v14 = 0;
LABEL_18:

  return v14;
}

- (BOOL)_shouldIgnorePressesDueToProxOrIdle:(id *)a3
{
  void *v5;
  int v6;
  __CFString *v7;
  void *v8;
  char v9;

  *a3 = 0;
  if (!self->_screenWasDimOnMenuDown)
  {
    +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "screenIsDim");

    if (!v6)
      return 0;
  }
  if (UIAccessibilityIsVoiceOverRunning())
    return 0;
  if (!-[SBProximitySensorManager isObjectInProximity](self->_proximitySensorManager, "isObjectInProximity"))
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isUILocked");

    if ((v9 & 1) == 0)
    {
      v7 = CFSTR("screen was/is dim and unlocked");
      goto LABEL_9;
    }
    return 0;
  }
  v7 = CFSTR("screen was/is dim and object within proximity");
LABEL_9:
  *a3 = v7;
  return 1;
}

- (void)performSinglePressUpActions
{
  -[SBHomeHardwareButtonActions performSinglePressUpActionsWithSourceType:](self, "performSinglePressUpActionsWithSourceType:", 0);
}

- (void)performSinglePressUpActionsWithSourceType:(unint64_t)a3
{
  _BOOL4 v6;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  int v37;
  NSObject *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  char v44;
  void *v45;
  void *v46;
  void *v47;
  int v48;
  NSObject *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  int v54;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSObject *v60;
  void *v61;
  const char *v62;
  void *v63;
  char v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  void *v79;
  void *v80;
  int v81;
  NSObject *v82;
  void *v83;
  const char *v84;
  NSObject *v85;
  void *v86;
  const char *v87;
  NSObject *v88;
  uint32_t v89;
  void *v90;
  char v91;
  NSObject *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  NSObject *v97;
  void *v98;
  void *v99;
  char v100;
  NSObject *v101;
  void *v102;
  void *v103;
  int v104;
  uint64_t v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  int v115;
  NSObject *v116;
  id v117;
  _QWORD v118[6];
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  id v123;
  _BYTE v124[128];
  _QWORD v125[2];
  _QWORD v126[2];
  uint8_t buf[4];
  void *v128;
  __int16 v129;
  id v130;
  uint64_t v131;

  v131 = *MEMORY[0x1E0C80C00];
  if (!-[SBHomeHardwareButtonActions _performButtonPreflightActions](self, "_performButtonPreflightActions"))
  {
    SBLogButtonsHome();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v128 = v12;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_INFO, "%{public}@ result: failed preflight checks", buf, 0xCu);

    }
    goto LABEL_113;
  }
  if (SBGuidedAccessIsActive())
  {
    v6 = -[SBHardwareButtonService consumeHomeButtonSinglePressUpWithPriority:](self->_hardwareButtonService, "consumeHomeButtonSinglePressUpWithPriority:", 300);
    SBLogButtonsHome();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (v6)
    {
      if (v8)
      {
        NSStringFromSelector(a2);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v128 = v9;
        v10 = "%{public}@ result: external consumer (at guided-access priority)";
LABEL_13:
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, v10, buf, 0xCu);

      }
    }
    else if (v8)
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v128 = v9;
      v10 = "%{public}@ result: guided access";
      goto LABEL_13;
    }

    _AXSHandleHomeButtonPressSwallowedForGuidedAccess();
    return;
  }
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "noteMenuButtonSinglePress");

  +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
  v116 = objc_claimAutoreleasedReturnValue();
  v115 = -[NSObject reachabilityModeActive](v116, "reachabilityModeActive");
  v123 = 0;
  v14 = -[SBHomeHardwareButtonActions _shouldIgnorePressesDueToProxOrIdle:](self, "_shouldIgnorePressesDueToProxOrIdle:", &v123);
  v15 = v123;
  if (v14)
  {
    SBLogButtonsHome();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v128 = v17;
      v129 = 2114;
      v130 = v15;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_INFO, "%{public}@ result: ignored because %{public}@", buf, 0x16u);

    }
  }
  else
  {
    +[SBMainSwitcherControllerCoordinator _shim_activeSwitcherController](SBMainSwitcherControllerCoordinator, "_shim_activeSwitcherController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "unlockedEnvironmentMode");

    if (v19 != 3)
      goto LABEL_18;
    +[SBWallpaperController sharedInstance](SBWallpaperController, "sharedInstance");
    v16 = objc_claimAutoreleasedReturnValue();
    -[NSObject preheatWallpaperForVariant:](v16, "preheatWallpaperForVariant:", 1);
  }

LABEL_18:
  v117 = v15;
  objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v114 = v20;
  if (v14)
  {
    v21 = 1;
  }
  else
  {
    if (objc_msgSend(v20, "handleHomeButtonPress"))
    {
      SBLogButtonsHome();
      v22 = objc_claimAutoreleasedReturnValue();
      v21 = 1;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v128 = v23;
        _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_INFO, "%{public}@ result: system aperture controller wants home button", buf, 0xCu);

      }
    }
    else
    {
      objc_msgSend((id)SBApp, "lockOutController");
      v22 = objc_claimAutoreleasedReturnValue();
      if (-[NSObject isProximityReaderBlocked](v22, "isProximityReaderBlocked"))
      {
        objc_msgSend((id)SBApp, "systemUIScenesCoordinator");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "proximityReaderUISceneController");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "handleHomeButtonPress");
        v21 = v26;
        if (v26)
        {
          SBLogButtonsHome();
          v27 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v128 = v28;
            _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_INFO, "%{public}@ result: Proximity reader handled it", buf, 0xCu);

          }
        }

      }
      else
      {
        v21 = 0;
      }
    }

  }
  objc_msgSend((id)SBApp, "windowSceneManager");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activeDisplayWindowScene");
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "transientOverlayPresentationManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "transientOverlayPresenterForWindowScene:", v30);
  v33 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)SBApp, "bannerManager");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = v34;
  if ((v21 & 1) != 0)
    goto LABEL_41;
  objc_msgSend(v34, "bannerWindowInWindowScene:", v30);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "windowLevel");
  if (objc_msgSend(v33, "hasPresentationAboveWindowLevel:"))
  {

  }
  else
  {
    v37 = objc_msgSend(v35, "handleHomeButtonPress");

    if (v37)
    {
      SBLogButtonsHome();
      v38 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v128 = v39;
        _os_log_impl(&dword_1D0540000, v38, OS_LOG_TYPE_INFO, "%{public}@ result: banner manager wants home button", buf, 0xCu);

      }
      goto LABEL_40;
    }
  }
  +[SBCommandTabController sharedInstance](SBCommandTabController, "sharedInstance");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = objc_msgSend(v40, "isVisible");

  if (v41)
  {
    +[SBCommandTabController sharedInstance](SBCommandTabController, "sharedInstance");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "dismiss");

    SBLogButtonsHome();
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v128 = v43;
      _os_log_impl(&dword_1D0540000, v38, OS_LOG_TYPE_INFO, "%{public}@ result: dismissing command-tab UI", buf, 0xCu);

    }
LABEL_40:

LABEL_41:
    v44 = 1;
    goto LABEL_42;
  }
  v44 = 0;
LABEL_42:
  +[SBControlCenterController sharedInstanceIfExists](SBControlCenterController, "sharedInstanceIfExists");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v45;
  if ((v44 & 1) == 0)
  {
    objc_msgSend(v45, "_controlCenterWindow");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "windowLevel");
    if (objc_msgSend(v33, "hasPresentationAboveWindowLevel:"))
    {

LABEL_50:
      v113 = v35;
      objc_msgSend(v30, "assistantController");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "window");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v53, "windowLevel");
      if ((objc_msgSend(v33, "hasPresentationAboveWindowLevel:") & 1) != 0 || (objc_opt_respondsToSelector() & 1) == 0)
      {

      }
      else
      {
        v54 = -[SBHardwareButtonInteraction consumeSinglePressUp](self->_siriButtonInteraction, "consumeSinglePressUp");

        if (v54)
        {
          SBLogButtonsHome();
          v55 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v128 = v56;
            _os_log_impl(&dword_1D0540000, v55, OS_LOG_TYPE_INFO, "%{public}@ result: assistant handled it", buf, 0xCu);

          }
          v52 = v117;
          v35 = v113;
          goto LABEL_110;
        }
      }
      v109 = v51;
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v58, "lockScreenEnvironment");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "buttonEventsHandler");
      v112 = (void *)objc_claimAutoreleasedReturnValue();

      v111 = v57;
      v110 = v46;
      if (objc_msgSend(v57, "handlesHomeButtonSinglePresses"))
      {
        if (self->_dontUnlockOnButtonUp)
        {
          SBLogButtonsHome();
          v60 = objc_claimAutoreleasedReturnValue();
          v52 = v117;
          v35 = v113;
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            NSStringFromSelector(a2);
            v61 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v128 = v61;
            v62 = "%{public}@ result: ignored because we don't unlock on button up";
LABEL_107:
            _os_log_impl(&dword_1D0540000, v60, OS_LOG_TYPE_INFO, v62, buf, 0xCu);

            goto LABEL_108;
          }
          goto LABEL_108;
        }
        v52 = v117;
        v35 = v113;
        if (-[SBHardwareButtonService consumeHomeButtonSinglePressUpWithPriority:](self->_hardwareButtonService, "consumeHomeButtonSinglePressUpWithPriority:", 100))
        {
          SBLogButtonsHome();
          v85 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
            goto LABEL_104;
          NSStringFromSelector(a2);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v128 = v86;
          v87 = "%{public}@ result: button consumer app handled it";
          v88 = v85;
          v89 = 12;
        }
        else
        {
          +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
          v96 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v96, "transientOverlayPresentationManager");
          v85 = objc_claimAutoreleasedReturnValue();

          if (-[NSObject handleHomeButtonPress](v85, "handleHomeButtonPress"))
          {
            SBLogButtonsHome();
            v97 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v98 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v128 = v98;
              _os_log_impl(&dword_1D0540000, v97, OS_LOG_TYPE_INFO, "%{public}@ result: Transient overlay presentation manager handled it", buf, 0xCu);

            }
            v35 = v113;
            goto LABEL_104;
          }

          if (!objc_msgSend(v112, "handleHomeButtonPress"))
          {
            +[SBAlertItemsController sharedInstance](SBAlertItemsController, "sharedInstance");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            v100 = objc_msgSend(v99, "hasLockScreenModalAlert");

            if ((v100 & 1) == 0)
            {
              SBLogButtonsHome();
              v101 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
              {
                NSStringFromSelector(a2);
                v102 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138543362;
                v128 = v102;
                _os_log_impl(&dword_1D0540000, v101, OS_LOG_TYPE_INFO, "%{public}@ result: attempting unlock with home button source", buf, 0xCu);

              }
              +[SBBacklightController sharedInstance](SBBacklightController, "sharedInstance");
              v60 = objc_claimAutoreleasedReturnValue();
              +[SBScreenWakeAnimationController sharedInstance](SBScreenWakeAnimationController, "sharedInstance");
              v103 = (void *)objc_claimAutoreleasedReturnValue();
              v104 = -[NSObject screenIsOn](v60, "screenIsOn");
              if (v104 && !objc_msgSend(v103, "isSleepAnimationInProgress"))
                v105 = 0;
              else
                v105 = objc_msgSend(v103, "isWakeAnimationInProgress") ^ 1;
              v125[0] = CFSTR("SBUIUnlockOptionsTurnOnScreenFirstKey");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v104 ^ 1u);
              v106 = (void *)objc_claimAutoreleasedReturnValue();
              v126[0] = v106;
              v125[1] = CFSTR("SBUIUnlockOptionsStartFadeInAnimation");
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v105);
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v126[1] = v107;
              objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v126, v125, 2);
              v108 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v57, "unlockUIFromSource:withOptions:", 15, v108);

              v52 = v117;
              v35 = v113;
              goto LABEL_108;
            }
LABEL_105:
            SBLogButtonsHome();
            v60 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v61 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v128 = v61;
              v62 = "%{public}@ result: ignored because there's a lock screen modal alert";
              goto LABEL_107;
            }
LABEL_108:

            self->_dontUnlockOnButtonUp = 0;
            goto LABEL_109;
          }
          SBLogButtonsHome();
          v85 = objc_claimAutoreleasedReturnValue();
          if (!os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
          {
LABEL_104:

            goto LABEL_105;
          }
          NSStringFromSelector(a2);
          v86 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v128 = v86;
          v129 = 2114;
          v130 = v112;
          v87 = "%{public}@ result: CoverSheet (%{public}@) handled it";
          v88 = v85;
          v89 = 22;
        }
        _os_log_impl(&dword_1D0540000, v88, OS_LOG_TYPE_INFO, v87, buf, v89);

        goto LABEL_104;
      }
      +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
      v63 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = objc_msgSend(v63, "contentObscuresEmbeddedDisplayScreen");

      if ((v64 & 1) == 0)
      {
        +[SBAssistantController sharedInstance](SBAssistantController, "sharedInstance");
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v65, "dismissAssistantViewInEverySceneIfNecessary");

      }
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      objc_msgSend((id)SBApp, "windowSceneManager");
      v66 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v66, "connectedWindowScenes");
      v67 = (void *)objc_claimAutoreleasedReturnValue();

      v68 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
      if (v68)
      {
        v69 = v68;
        v70 = *(_QWORD *)v120;
LABEL_66:
        v71 = 0;
        while (1)
        {
          if (*(_QWORD *)v120 != v70)
            objc_enumerationMutation(v67);
          v72 = *(void **)(*((_QWORD *)&v119 + 1) + 8 * v71);
          if (objc_msgSend(v72, "isMainDisplayWindowScene"))
            break;
          if (v69 == ++v71)
          {
            v69 = objc_msgSend(v67, "countByEnumeratingWithState:objects:count:", &v119, v124, 16);
            if (v69)
              goto LABEL_66;
            goto LABEL_79;
          }
        }
        objc_msgSend(v72, "modalLibraryController");
        v73 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v72, "layoutStateProvider");
        v74 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v74, "layoutState");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = objc_msgSend(v75, "unlockedEnvironmentMode");

        if ((v76 & 0xFFFFFFFFFFFFFFFELL) != 2 || !objc_msgSend(v73, "isPresentingLibraryInForeground"))
        {

          goto LABEL_79;
        }
        objc_msgSend(v73, "libraryViewController");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "popPresentationState");

        SBLogButtonsHome();
        v78 = objc_claimAutoreleasedReturnValue();
        v52 = v117;
        if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v128 = v79;
          _os_log_impl(&dword_1D0540000, v78, OS_LOG_TYPE_INFO, "%{public}@ result: Library view controller handled it", buf, 0xCu);

        }
        goto LABEL_94;
      }
LABEL_79:

      +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v80, "handleHomeButtonPress");

      if (v81)
      {
        SBLogButtonsHome();
        v82 = objc_claimAutoreleasedReturnValue();
        v52 = v117;
        v35 = v113;
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v128 = v83;
          v84 = "%{public}@ result: SBMainSwitcherCoordinator handled it";
LABEL_85:
          _os_log_impl(&dword_1D0540000, v82, OS_LOG_TYPE_INFO, v84, buf, 0xCu);

        }
      }
      else
      {
        v52 = v117;
        v35 = v113;
        if (!-[SBHardwareButtonService consumeHomeButtonSinglePressUpWithPriority:](self->_hardwareButtonService, "consumeHomeButtonSinglePressUpWithPriority:", 0))
        {
          +[SBUIController sharedInstance](SBUIController, "sharedInstance");
          v90 = (void *)objc_claimAutoreleasedReturnValue();
          v91 = objc_msgSend(v90, "handleHomeButtonSinglePressUpForWindowScene:withSourceType:", v30, a3);

          if ((v91 & 1) == 0)
          {
            SBLogButtonsHome();
            v92 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
            {
              NSStringFromSelector(a2);
              v93 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543362;
              v128 = v93;
              _os_log_impl(&dword_1D0540000, v92, OS_LOG_TYPE_INFO, "%{public}@ result: SBUIController is busy - queued the home button event for later processing", buf, 0xCu);

            }
            v118[0] = MEMORY[0x1E0C809B0];
            v118[1] = 3221225472;
            v118[2] = __73__SBHomeHardwareButtonActions_performSinglePressUpActionsWithSourceType___block_invoke;
            v118[3] = &unk_1E8E9DE88;
            v118[4] = self;
            v118[5] = a3;
            objc_msgSend(MEMORY[0x1E0D229B0], "eventWithName:handler:", CFSTR("HandleMenuButton"), v118);
            v94 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x1E0D229B8], "sharedInstance");
            v95 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v95, "cancelEventsWithName:", CFSTR("HandleMenuButton"));
            objc_msgSend(v95, "executeOrAppendEvent:", v94);

LABEL_94:
            v35 = v113;
          }
LABEL_109:

          v51 = v109;
          v46 = v110;
          goto LABEL_110;
        }
        SBLogButtonsHome();
        v82 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v83 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v128 = v83;
          v84 = "%{public}@ result: button consumer app handled it";
          goto LABEL_85;
        }
      }

      goto LABEL_109;
    }
    v48 = objc_msgSend(v46, "handleMenuButtonTap");

    if (!v48)
      goto LABEL_50;
    SBLogButtonsHome();
    v49 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v128 = v50;
      _os_log_impl(&dword_1D0540000, v49, OS_LOG_TYPE_INFO, "%{public}@ result: control center handled it", buf, 0xCu);

    }
  }
  objc_msgSend(v30, "assistantController");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v117;
LABEL_110:
  v11 = v116;
  if (v115)
  {
    ADClientAddValueForScalarKey();
    -[NSObject deactivateReachability](v116, "deactivateReachability");
  }

LABEL_113:
}

uint64_t __73__SBHomeHardwareButtonActions_performSinglePressUpActionsWithSourceType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "performSinglePressUpActionsWithSourceType:", *(_QWORD *)(a1 + 40));
}

- (void)performLongPressActions
{
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  const char *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  char v18;
  NSObject *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  const char *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  char v29;
  void *v30;
  int v31;
  NSObject *v32;
  void *v33;
  const char *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  void *v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  if (!SBGuidedAccessIsActive())
  {
    objc_msgSend((id)SBApp, "lockOutController");
    v5 = objc_claimAutoreleasedReturnValue();
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "windowSceneManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "activeDisplayWindowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transientOverlayPresentationManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "transientOverlayPresenterForWindowScene:", v11);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)SBApp, "bannerManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v9;
    v16 = objc_msgSend(v9, "isUILocked");
    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "isPowerDownTransientOverlayTopmost"))
    {
      v18 = -[NSObject isLockedOut](v5, "isLockedOut");

      if ((v18 & 1) == 0)
      {
        SBLogButtonsHome();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v40 = v20;
          _os_log_impl(&dword_1D0540000, v19, OS_LOG_TYPE_INFO, "%{public}@ result: dismissing powerdown", buf, 0xCu);

        }
        +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "dismissPowerDownTransientOverlayWithCompletion:", &__block_literal_global_77);

        goto LABEL_40;
      }
    }
    else
    {

    }
    if (objc_msgSend(v15, "handleHomeButtonLongPress"))
    {
      SBLogButtonsHome();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v40 = v23;
        v24 = "%{public}@ result: system aperture controller handled it";
LABEL_38:
        _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_INFO, v24, buf, 0xCu);

        goto LABEL_39;
      }
      goto LABEL_39;
    }
    objc_msgSend(v14, "bannerWindowInWindowScene:", v11);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "windowLevel");
    if ((objc_msgSend(v38, "hasPresentationAboveWindowLevel:") & 1) != 0)
    {

    }
    else
    {
      v26 = objc_msgSend(v14, "handleHomeButtonLongPress");

      if (v26)
      {
        SBLogButtonsHome();
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v40 = v23;
          v24 = "%{public}@ result: banner manager handled it";
          goto LABEL_38;
        }
LABEL_39:

        goto LABEL_40;
      }
    }
    if (!v16
      || (objc_msgSend(v37, "lockScreenEnvironment"),
          v27 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v27, "buttonEventsHandler"),
          v28 = (void *)objc_claimAutoreleasedReturnValue(),
          v29 = objc_msgSend(v28, "handleHomeButtonLongPress"),
          v28,
          v27,
          (v29 & 1) == 0))
    {
      +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = objc_msgSend(v30, "handleHomeButtonLongPress");

      if (v31)
      {
        SBLogButtonsHome();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v40 = v33;
          v34 = "%{public}@ result: main switcher handled it";
LABEL_34:
          _os_log_impl(&dword_1D0540000, v32, OS_LOG_TYPE_INFO, v34, buf, 0xCu);

          goto LABEL_35;
        }
        goto LABEL_35;
      }
      if (-[SBHardwareButtonService consumeHomeButtonLongPressWithPriority:](self->_hardwareButtonService, "consumeHomeButtonLongPressWithPriority:", 0))
      {
        SBLogButtonsHome();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v40 = v33;
          v34 = "%{public}@ result: external consumer (at normal priority)";
          goto LABEL_34;
        }
LABEL_35:

        +[SBCommandTabController sharedInstance](SBCommandTabController, "sharedInstance");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "dismiss");

        ADClientAddValueForScalarKey();
        objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "emitEvent:", 2);

        -[SBHomeHardwareButtonActions _logMenuButtonHoldTime](self, "_logMenuButtonHoldTime");
LABEL_40:

        goto LABEL_41;
      }
      if ((objc_opt_respondsToSelector() & 1) != 0
        && -[SBHardwareButtonInteraction consumeLongPress](self->_siriButtonInteraction, "consumeLongPress"))
      {
        SBLogButtonsHome();
        v32 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v40 = v33;
          v34 = "%{public}@ result: siriButtonInteraction handled it";
          goto LABEL_34;
        }
        goto LABEL_35;
      }
    }
    SBLogButtonsHome();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v23;
      v24 = "%{public}@ result: ignored because nothing handled it";
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  v4 = -[SBHardwareButtonService consumeHomeButtonLongPressWithPriority:](self->_hardwareButtonService, "consumeHomeButtonLongPressWithPriority:", 300);
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
  if (v4)
  {
    if (v6)
    {
      NSStringFromSelector(a2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v40 = v7;
      v8 = "%{public}@ result: external consumer (at guided-access priority)";
LABEL_12:
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, v8, buf, 0xCu);

    }
  }
  else if (v6)
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v40 = v7;
    v8 = "%{public}@ result: guided access";
    goto LABEL_12;
  }
LABEL_41:

}

void __54__SBHomeHardwareButtonActions_performLongPressActions__block_invoke()
{
  SBWorkspaceTerminateAllApps(5, 0, CFSTR("power down shortcut"), 0);
}

- (void)performDoublePressDownActions
{
  _BOOL4 v4;
  NSObject *v5;
  _BOOL4 v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  void *v17;
  int v18;
  void *v19;
  int v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  int v31;
  NSObject *v32;
  const char *v33;
  void *v34;
  int v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  int v40;
  void *v41;
  id v42;
  uint8_t buf[4];
  NSObject *v44;
  __int16 v45;
  NSObject *v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  if (-[SBHomeHardwareButtonActions _performButtonPreflightActions](self, "_performButtonPreflightActions"))
  {
    if (SBGuidedAccessIsActive())
    {
      v4 = -[SBHardwareButtonService consumeHomeButtonDoublePressDownWithPriority:](self->_hardwareButtonService, "consumeHomeButtonDoublePressDownWithPriority:", 300);
      SBLogButtonsHome();
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
      if (v4)
      {
        if (v6)
        {
          NSStringFromSelector(a2);
          v7 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v7;
          v8 = "%{public}@ result: external consumer (at guided-access priority)";
LABEL_13:
          _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, v8, buf, 0xCu);

        }
      }
      else if (v6)
      {
        NSStringFromSelector(a2);
        v7 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = v7;
        v8 = "%{public}@ result: guided access";
        goto LABEL_13;
      }

      _AXSHandleHomeButtonPressSwallowedForGuidedAccess();
      return;
    }
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "noteMenuButtonDoublePress");

    v42 = 0;
    v12 = -[SBHomeHardwareButtonActions _shouldIgnorePressesDueToProxOrIdle:](self, "_shouldIgnorePressesDueToProxOrIdle:", &v42);
    v9 = v42;
    if (v12)
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v13 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v44 = v13;
        v45 = 2114;
        v46 = v9;
        v14 = "%{public}@ result: ignored because %{public}@";
        v15 = v10;
        v16 = 22;
LABEL_22:
        _os_log_impl(&dword_1D0540000, v15, OS_LOG_TYPE_INFO, v14, buf, v16);

      }
LABEL_51:

      goto LABEL_52;
    }
    objc_msgSend((id)SBApp, "lockOutController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "isBlocked");

    if (v18)
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_51;
      NSStringFromSelector(a2);
      v13 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v13;
      v14 = "%{public}@ result: blocked";
LABEL_21:
      v15 = v10;
      v16 = 12;
      goto LABEL_22;
    }
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isInSetupMode");

    if (v20)
    {
      SBLogButtonsHome();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        goto LABEL_51;
      NSStringFromSelector(a2);
      v13 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v44 = v13;
      v14 = "%{public}@ result: in setup mode";
      goto LABEL_21;
    }
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "windowSceneManager");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "activeDisplayWindowScene");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "transientOverlayPresentationManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "transientOverlayPresenterForWindowScene:", v22);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend((id)SBApp, "bannerManager");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)SBApp, "systemApertureControllerForMainDisplay");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v27, "handleHomeButtonDoublePress"))
    {
      SBLogButtonsHome();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v29 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = v29;
        _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_INFO, "%{public}@ result: system aperture controller handled it", buf, 0xCu);

      }
      goto LABEL_48;
    }
    objc_msgSend(v26, "bannerWindowInWindowScene:", v22);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "windowLevel");
    if ((objc_msgSend(v25, "hasPresentationAboveWindowLevel:") & 1) != 0)
    {

    }
    else
    {
      v31 = objc_msgSend(v26, "handleHomeButtonDoublePress");

      if (v31)
      {
        SBLogButtonsHome();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v32 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v32;
          v33 = "%{public}@ result: banner manager handled it";
LABEL_47:
          _os_log_impl(&dword_1D0540000, v28, OS_LOG_TYPE_INFO, v33, buf, 0xCu);

        }
LABEL_48:

LABEL_49:
        ADClientAddValueForScalarKey();
        objc_msgSend(MEMORY[0x1E0DA9D78], "sharedInstance");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "emitEvent:", 1);

LABEL_50:
        goto LABEL_51;
      }
    }
    if (objc_msgSend(v25, "handleHomeButtonDoublePress"))
    {
      SBLogButtonsHome();
      v28 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v32 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = v32;
        v33 = "%{public}@ result: transient overlay presentation manager handled it";
        goto LABEL_47;
      }
      goto LABEL_48;
    }
    if (objc_msgSend(v41, "isUILocked"))
    {
      if (-[SBHardwareButtonService consumeHomeButtonDoublePressDownWithPriority:](self->_hardwareButtonService, "consumeHomeButtonDoublePressDownWithPriority:", 100))
      {
        SBLogButtonsHome();
        v28 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          goto LABEL_48;
LABEL_46:
        NSStringFromSelector(a2);
        v32 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v44 = v32;
        v33 = "%{public}@ result: button consumer app handled it";
        goto LABEL_47;
      }
      objc_msgSend(v41, "lockScreenEnvironment");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "buttonEventsHandler");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      v40 = objc_msgSend(v37, "handleHomeButtonDoublePress");

      if (v40)
      {
        SBLogButtonsHome();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v32 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v32;
          v33 = "%{public}@ result: lock-screen view controller handled it";
          goto LABEL_47;
        }
        goto LABEL_48;
      }
    }
    else
    {
      +[SBMainSwitcherControllerCoordinator sharedInstance](SBMainSwitcherControllerCoordinator, "sharedInstance");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "handleHomeButtonDoublePress");

      if (v35)
      {
        SBLogButtonsHome();
        v28 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v32 = objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543362;
          v44 = v32;
          v33 = "%{public}@ result: main switcher handled it";
          goto LABEL_47;
        }
        goto LABEL_48;
      }
      if (-[SBHardwareButtonService consumeHomeButtonDoublePressDownWithPriority:](self->_hardwareButtonService, "consumeHomeButtonDoublePressDownWithPriority:", 0))
      {
        SBLogButtonsHome();
        v28 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          goto LABEL_48;
        goto LABEL_46;
      }
      if ((-[NSObject handleHomeButtonDoublePressDown](v10, "handleHomeButtonDoublePressDown") & 1) != 0)
        goto LABEL_49;
    }
    SBLogButtonsHome();
    v39 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v39, OS_LOG_TYPE_INFO, "Nothing handled the double press, so pretending it was a single press...", buf, 2u);
    }

    -[SBHomeHardwareButtonActions performSinglePressUpActions](self, "performSinglePressUpActions");
    goto LABEL_50;
  }
  SBLogButtonsHome();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v44 = v10;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "%{public}@ result: failed preflight checks", buf, 0xCu);
    goto LABEL_51;
  }
LABEL_52:

}

- (void)performTriplePressUpActions
{
  _BOOL4 v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  const char *v8;
  NSObject *v9;
  uint32_t v10;
  int IsActive;
  SBHardwareButtonService *hardwareButtonService;
  id v13;
  uint8_t buf[4];
  NSObject *v15;
  __int16 v16;
  NSObject *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (-[SBHomeHardwareButtonActions _performButtonPreflightActions](self, "_performButtonPreflightActions"))
  {
    v13 = 0;
    v4 = -[SBHomeHardwareButtonActions _shouldIgnorePressesDueToProxOrIdle:](self, "_shouldIgnorePressesDueToProxOrIdle:", &v13);
    v5 = v13;
    if (v4)
    {
      SBLogButtonsHome();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v7 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v7;
        v16 = 2114;
        v17 = v5;
        v8 = "%{public}@ result: ignored because %{public}@";
        v9 = v6;
        v10 = 22;
LABEL_21:
        _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, v8, buf, v10);

      }
LABEL_22:

      goto LABEL_23;
    }
    IsActive = SBGuidedAccessIsActive();
    hardwareButtonService = self->_hardwareButtonService;
    if (IsActive)
    {
      if (-[SBHardwareButtonService consumeHomeButtonTriplePressUpWithPriority:](hardwareButtonService, "consumeHomeButtonTriplePressUpWithPriority:", 300))
      {
        SBLogButtonsHome();
        v6 = objc_claimAutoreleasedReturnValue();
        if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
          goto LABEL_22;
        NSStringFromSelector(a2);
        v7 = objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543362;
        v15 = v7;
        v8 = "%{public}@ result: external consumer (at guided-access priority)";
LABEL_20:
        v9 = v6;
        v10 = 12;
        goto LABEL_21;
      }
    }
    else if (-[SBHardwareButtonService consumeHomeButtonTriplePressUpWithPriority:](hardwareButtonService, "consumeHomeButtonTriplePressUpWithPriority:", 0))
    {
      SBLogButtonsHome();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_22;
      NSStringFromSelector(a2);
      v7 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      v8 = "%{public}@ result: external consumer";
      goto LABEL_20;
    }
    if ((objc_opt_respondsToSelector() & 1) != 0
      && -[SBHardwareButtonInteraction consumeTriplePressUp](self->_accessibilityButtonInteraction, "consumeTriplePressUp"))
    {
      SBLogButtonsHome();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_22;
      NSStringFromSelector(a2);
      v7 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      v8 = "%{public}@ result: accessibility handled it";
    }
    else
    {
      SBLogButtonsHome();
      v6 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        goto LABEL_22;
      NSStringFromSelector(a2);
      v7 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v15 = v7;
      v8 = "%{public}@ result: ignored";
    }
    goto LABEL_20;
  }
  SBLogButtonsHome();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v6 = objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v6;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "%{public}@ result: failed preflight checks", buf, 0xCu);
    goto LABEL_22;
  }
LABEL_23:

}

- (void)performFinalButtonUpActions
{
  NSObject *v3;
  uint8_t v4[16];

  if (-[SBHomeHardwareButtonActions isButtonDown](self, "isButtonDown"))
  {
    SBLogButtonsHome();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Performing up actions", v4, 2u);
    }

    -[SBHomeHardwareButtonActions setButtonDown:](self, "setButtonDown:", 0);
    self->_screenWasDimOnMenuDown = 0;
    -[SBHomeHardwareButtonActions _logMenuButtonHoldTime](self, "_logMenuButtonHoldTime");
    -[SBHardwareButtonActionList performQueuedButtonUpActions](self->_buttonUpActions, "performQueuedButtonUpActions");
    -[SBHardwareButtonActionList performQueuedButtonUpActions](self->_buttonUpPostActions, "performQueuedButtonUpActions");
    if ((objc_opt_respondsToSelector() & 1) != 0)
      -[SBHardwareButtonInteraction observeFinalPressUp](self->_siriButtonInteraction, "observeFinalPressUp");
  }
}

- (void)performLongPressCancelledActions
{
  NSObject *v3;
  uint8_t v4[16];

  SBLogButtonsHome();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Performing long press cancelled actions", v4, 2u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[SBHardwareButtonInteraction observeLongPressCanceled](self->_siriButtonInteraction, "observeLongPressCanceled");
}

- (void)performDoubleTapUpActions
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  NSObject *v7;
  void *v8;
  const char *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  SBLogButtonsHome();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_INFO, "Performing double tap up actions", (uint8_t *)&v10, 2u);
  }

  if (+[SBReachabilityManager reachabilitySupported](SBReachabilityManager, "reachabilitySupported")
    && (+[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "reachabilityEnabled"),
        v4,
        v5))
  {
    +[SBReachabilityManager sharedInstance](SBReachabilityManager, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "toggleReachability");

    SBLogButtonsHome();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      v9 = "%{public}@ result: reachability handled it";
LABEL_9:
      _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_INFO, v9, (uint8_t *)&v10, 0xCu);

    }
  }
  else
  {
    SBLogButtonsHome();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543362;
      v11 = v8;
      v9 = "%{public}@ result: double-tap ignored because reachability is disabled";
      goto LABEL_9;
    }
  }

}

- (void)performWhenMenuButtonIsUpUsingBlock:(id)a3
{
  if (a3)
    -[SBHardwareButtonActionList scheduleButtonUpActionBlock:](self->_buttonUpActions, "scheduleButtonUpActionBlock:");
}

- (void)performAfterMenuButtonUpIsHandledUsingBlock:(id)a3
{
  if (a3)
    -[SBHardwareButtonActionList scheduleButtonUpActionBlock:](self->_buttonUpPostActions, "scheduleButtonUpActionBlock:");
}

- (void)_logMenuButtonHoldTime
{
  double Current;
  double menuButtonHoldStartAbsoluteTime;
  NSObject *v5;
  int v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (self->_menuButtonHoldStartTime)
  {
    Current = CFAbsoluteTimeGetCurrent();
    menuButtonHoldStartAbsoluteTime = self->_menuButtonHoldStartAbsoluteTime;
    SBLogButtonsHome();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = 134217984;
      v7 = Current - menuButtonHoldStartAbsoluteTime;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "First down to last up processed in %gs", (uint8_t *)&v6, 0xCu);
    }

    ADPushTimeIntervalForDistributionKeySinceStartTime();
  }
  self->_menuButtonHoldStartTime = 0;
}

- (id)hardwareButtonGestureParameters
{
  SBMutableHardwareButtonGestureParameters *v3;
  SBMutableHardwareButtonGestureParameters *v4;
  double v5;

  v3 = objc_alloc_init(SBMutableHardwareButtonGestureParameters);
  v4 = v3;
  if (self->_homeButtonType == 2)
  {
    -[SBMutableHardwareButtonGestureParameters setMaximumPressCount:](v3, "setMaximumPressCount:", 2);
    -[SBMutableHardwareButtonGestureParameters setMultiplePressTimeInterval:](v4, "setMultiplePressTimeInterval:", 0.3);
    v5 = 0.4;
  }
  else
  {
    -[SBMutableHardwareButtonGestureParameters setMaximumPressCount:](v3, "setMaximumPressCount:", -[SBHardwareButtonGestureParameters maximumPressCount](self->_accessibilityGestureParameters, "maximumPressCount"));
    -[SBHardwareButtonGestureParameters multiplePressTimeInterval](self->_accessibilityGestureParameters, "multiplePressTimeInterval");
    -[SBMutableHardwareButtonGestureParameters setMultiplePressTimeInterval:](v4, "setMultiplePressTimeInterval:");
    -[SBHardwareButtonGestureParameters longPressTimeInterval](self->_siriGestureParameters, "longPressTimeInterval");
  }
  -[SBMutableHardwareButtonGestureParameters setLongPressTimeInterval:](v4, "setLongPressTimeInterval:", v5);
  return v4;
}

- (void)provider:(id)a3 didUpdateButtonGestureParameters:(id)a4
{
  SBHardwareButtonInteraction *v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  uint8_t v11[16];
  uint8_t buf[16];

  v6 = (SBHardwareButtonInteraction *)a3;
  v7 = a4;
  if (self->_accessibilityButtonInteraction == v6)
  {
    SBLogButtonsHome();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "reconfiguring due to AX prefs change", buf, 2u);
    }

    objc_storeStrong((id *)&self->_accessibilityGestureParameters, a4);
  }
  if (self->_siriButtonInteraction == v6)
  {
    SBLogButtonsHome();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_INFO, "reconfiguring due to Siri prefs change", v11, 2u);
    }

    objc_storeStrong((id *)&self->_siriGestureParameters, a4);
  }
  -[SBHomeHardwareButtonActions hardwareButtonGestureParameters](self, "hardwareButtonGestureParameters");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHardwareButtonGestureParametersProviderBase publishUpdatedParameters:](self, "publishUpdatedParameters:", v10);

}

- (BOOL)isButtonDown
{
  return self->_buttonDown;
}

- (double)currentLongPressDuration
{
  return self->_currentLongPressDuration;
}

- (void)setCurrentLongPressDuration:(double)a3
{
  self->_currentLongPressDuration = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriGestureParameters, 0);
  objc_storeStrong((id *)&self->_accessibilityGestureParameters, 0);
  objc_storeStrong((id *)&self->_siriButtonInteraction, 0);
  objc_storeStrong((id *)&self->_accessibilityButtonInteraction, 0);
  objc_storeStrong((id *)&self->_hardwareButtonService, 0);
  objc_storeStrong((id *)&self->_proximitySensorManager, 0);
  objc_storeStrong((id *)&self->_buttonUpPostActions, 0);
  objc_storeStrong((id *)&self->_buttonUpActions, 0);
}

@end
