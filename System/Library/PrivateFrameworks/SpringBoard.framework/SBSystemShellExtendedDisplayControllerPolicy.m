@implementation SBSystemShellExtendedDisplayControllerPolicy

- (SBSystemShellExtendedDisplayControllerPolicy)initWithExternalDisplayDefaults:(id)a3 appSwitcherDefaults:(id)a4 externalDisplayService:(id)a5 mousePointerManager:(id)a6 runtimeAvailabilitySettings:(id)a7 sceneManager:(id)a8 windowSceneManager:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  SBSystemShellExtendedDisplayControllerPolicy *v23;
  SBSystemShellExtendedDisplayControllerPolicy *v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id obj;
  id v35;
  id v36;
  id v37;
  id v38;
  void *v39;
  objc_super v40;

  v16 = a3;
  obj = a4;
  v17 = a4;
  v35 = a5;
  v18 = a5;
  v36 = a6;
  v19 = a6;
  v37 = a7;
  v20 = a7;
  v38 = a8;
  v21 = a8;
  v22 = a9;
  v39 = v16;
  if (v16)
  {
    if (v17)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicy.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("externalDisplayDefaults"));

    if (v17)
    {
LABEL_3:
      if (v18)
        goto LABEL_4;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicy.m"), 139, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("appSwitcherDefaults"));

  if (v18)
  {
LABEL_4:
    if (v19)
      goto LABEL_5;
    goto LABEL_14;
  }
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicy.m"), 140, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("externalDisplayService"));

  if (v19)
  {
LABEL_5:
    if (v20)
      goto LABEL_6;
    goto LABEL_15;
  }
LABEL_14:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicy.m"), 141, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("mousePointerManager"));

  if (v20)
  {
LABEL_6:
    if (v21)
      goto LABEL_7;
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicy.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("fbSceneManager"));

    if (v22)
      goto LABEL_8;
    goto LABEL_17;
  }
LABEL_15:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicy.m"), 142, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("runtimeAvailabilitySettings"));

  if (!v21)
    goto LABEL_16;
LABEL_7:
  if (v22)
    goto LABEL_8;
LABEL_17:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicy.m"), 144, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("windowSceneManager"));

LABEL_8:
  v40.receiver = self;
  v40.super_class = (Class)SBSystemShellExtendedDisplayControllerPolicy;
  v23 = -[SBSystemShellExtendedDisplayControllerPolicy init](&v40, sel_init);
  v24 = v23;
  if (v23)
  {
    objc_storeStrong((id *)&v23->_externalDisplayDefaults, a3);
    objc_storeStrong((id *)&v24->_appSwitcherDefaults, obj);
    objc_storeStrong((id *)&v24->_externalDisplayService, v35);
    objc_storeStrong((id *)&v24->_mousePointerManager, v36);
    objc_storeStrong((id *)&v24->_runtimeAvailabilitySettings, v37);
    objc_storeStrong((id *)&v24->_fbSceneManager, v38);
    objc_storeStrong((id *)&v24->_windowSceneManager, a9);
    -[SBExternalDisplayService addObserver:](v24->_externalDisplayService, "addObserver:", v24);
    -[PTSettings addKeyObserver:](v24->_runtimeAvailabilitySettings, "addKeyObserver:", v24);
  }

  return v24;
}

- (void)dealloc
{
  objc_super v3;

  -[BSContinuousMachTimer invalidate](self->_timerForAttachedDevicesToAffectDisplayAssertion, "invalidate");
  -[SBExternalDisplayService removeObserver:](self->_externalDisplayService, "removeObserver:", self);
  -[PTSettings removeKeyObserver:](self->_runtimeAvailabilitySettings, "removeKeyObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)SBSystemShellExtendedDisplayControllerPolicy;
  -[SBSystemShellExtendedDisplayControllerPolicy dealloc](&v3, sel_dealloc);
}

- (unint64_t)displayAssertionPriorityLevel:(id)a3
{
  return 2;
}

- (unint64_t)displayAssertionDeactivationReasons:(id)a3
{
  return 0;
}

- (void)connectToDisplayController:(id)a3 displayConfiguration:(id)a4
{
  id v7;
  id v8;
  FBSDisplayIdentity *v9;
  FBSDisplayIdentity *displayIdentity;
  BSAtomicSignal *v11;
  BSAtomicSignal *displayDisconnectSignal;
  NSObject *v13;
  SBSDisplayModeSettings *v14;
  SBSDisplayModeSettings *displayModeSettings;
  uint64_t v16;
  SBExternalDisplayDefaults *externalDisplayDefaults;
  id v18;
  BSDefaultObserver *v19;
  BSDefaultObserver *displayModeSettingsToken;
  double v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  double contentScale;
  SBDisplayScaleMapping *v27;
  SBDisplayScaleMapping *displayScaleMapping;
  _BOOL8 v29;
  void *v30;
  id v31;
  void *v32;
  objc_class *v33;
  void *v34;
  void *v35;
  BSContinuousMachTimer *v36;
  BSContinuousMachTimer *timerForAttachedDevicesToAffectDisplayAssertion;
  BSContinuousMachTimer *v38;
  id v39;
  SBExternalDisplayDefaults *v40;
  void *v41;
  BSDefaultObserver *v42;
  BSDefaultObserver *externalDisplayDefaultsToken;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  _QWORD v53[4];
  id v54;
  _QWORD v55[5];
  id v56;
  SEL v57;
  _QWORD v58[5];
  id v59;
  SEL v60;
  _QWORD v61[3];
  _QWORD v62[3];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  double v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSystemShellExtendedDisplayControllerPolicy connectToDisplayController:displayConfiguration:]");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInFunction:file:lineNumber:description:", v51, CFSTR("SBSystemShellExtendedDisplayControllerPolicy.m"), 181, CFSTR("this call must be made on the main thread"));

  }
  objc_storeWeak((id *)&self->_displayController, v7);
  objc_msgSend(v8, "identity");
  v9 = (FBSDisplayIdentity *)objc_claimAutoreleasedReturnValue();
  displayIdentity = self->_displayIdentity;
  self->_displayIdentity = v9;

  v11 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E0D016C0]);
  displayDisconnectSignal = self->_displayDisconnectSignal;
  self->_displayDisconnectSignal = v11;

  if (-[FBSDisplayIdentity connectionType](self->_displayIdentity, "connectionType") != 2
    && -[FBSDisplayIdentity connectionType](self->_displayIdentity, "connectionType") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemShellExtendedDisplayControllerPolicy.m"), 186, CFSTR("can only handle .Wired displays or .Wireless displays (unsupported, but we'll run)"));

  }
  if (-[FBSDisplayIdentity connectionType](self->_displayIdentity, "connectionType") == 2)
  {
    SBLogDisplayControlling();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v64 = v47;
      _os_log_error_impl(&dword_1D0540000, v13, OS_LOG_TYPE_ERROR, "%{public}@ created with an unsupported display. features are not guaranteed and support is not provided", buf, 0xCu);

    }
  }
  -[SBExternalDisplayDefaults displayModeSettingsForDisplay:](self->_externalDisplayDefaults, "displayModeSettingsForDisplay:", v8);
  v14 = (SBSDisplayModeSettings *)objc_claimAutoreleasedReturnValue();
  displayModeSettings = self->_displayModeSettings;
  self->_displayModeSettings = v14;

  v16 = MEMORY[0x1E0C809B0];
  externalDisplayDefaults = self->_externalDisplayDefaults;
  v58[0] = MEMORY[0x1E0C809B0];
  v58[1] = 3221225472;
  v58[2] = __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke;
  v58[3] = &unk_1E8EA0AF0;
  v58[4] = self;
  v18 = v8;
  v59 = v18;
  v60 = a2;
  -[SBExternalDisplayDefaults observeDisplayModeSettingsOnQueue:withBlock:](externalDisplayDefaults, "observeDisplayModeSettingsOnQueue:withBlock:", MEMORY[0x1E0C80D38], v58);
  v19 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
  displayModeSettingsToken = self->_displayModeSettingsToken;
  self->_displayModeSettingsToken = v19;

  -[SBExternalDisplayDefaults contentsScale](self->_externalDisplayDefaults, "contentsScale");
  self->_contentScale = v21;
  v22 = BSFloatEqualToFloat();
  SBLogDisplayControlling();
  v23 = objc_claimAutoreleasedReturnValue();
  v24 = v23;
  if ((v22 & 1) != 0)
  {
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      contentScale = self->_contentScale;
      *(_DWORD *)buf = 138543618;
      v64 = v25;
      v65 = 2048;
      v66 = contentScale;
      _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ scale looks OK: %.2f", buf, 0x16u);

    }
  }
  else if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v49 = self->_contentScale;
    *(_DWORD *)buf = 138543618;
    v64 = v48;
    v65 = 2048;
    v66 = v49;
    _os_log_error_impl(&dword_1D0540000, v24, OS_LOG_TYPE_ERROR, "%{public}@ returning an unsupported scale. features are not guaranteed and support is not provided: %.2f", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0DA9D58], "withDisplay:useNativeSize:", v18, -[SBExternalDisplayDefaults chamois](self->_externalDisplayDefaults, "chamois"));
  v27 = (SBDisplayScaleMapping *)objc_claimAutoreleasedReturnValue();
  displayScaleMapping = self->_displayScaleMapping;
  self->_displayScaleMapping = v27;

  v29 = -[SBSystemShellExtendedDisplayControllerPolicy _areRuntimeAvailabilityRequirementsMet](self, "_areRuntimeAvailabilityRequirementsMet");
  -[SBSystemShellExtendedDisplayControllerPolicy reevaluateMirroringEnablement](self, "reevaluateMirroringEnablement");
  self->_didConnectToRequiredDevicesDuringTimerWindow = v29;
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "addObserver:selector:name:object:", self, sel__windowManagementStyleDidChange_, CFSTR("SBSwitcherControllerWindowManagementStyleDidChangeNotification"), 0);
  v31 = objc_alloc(MEMORY[0x1E0D01720]);
  v32 = (void *)MEMORY[0x1E0CB3940];
  v33 = (objc_class *)objc_opt_class();
  NSStringFromClass(v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("%@-%@"), v34, self->_displayIdentity);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (BSContinuousMachTimer *)objc_msgSend(v31, "initWithIdentifier:", v35);
  timerForAttachedDevicesToAffectDisplayAssertion = self->_timerForAttachedDevicesToAffectDisplayAssertion;
  self->_timerForAttachedDevicesToAffectDisplayAssertion = v36;

  v38 = self->_timerForAttachedDevicesToAffectDisplayAssertion;
  v55[0] = v16;
  v55[1] = 3221225472;
  v55[2] = __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke_50;
  v55[3] = &unk_1E8EB7780;
  v55[4] = self;
  v57 = a2;
  v39 = v30;
  v56 = v39;
  -[BSContinuousMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v38, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v55, 14.0, 0.5);

  objc_initWeak((id *)buf, self);
  v40 = self->_externalDisplayDefaults;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "mirroringEnabled");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v16;
  v53[1] = 3221225472;
  v53[2] = __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke_54;
  v53[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v54, (id *)buf);
  -[SBExternalDisplayDefaults observeDefault:onQueue:withBlock:](v40, "observeDefault:onQueue:withBlock:", v41, MEMORY[0x1E0C80D38], v53);
  v42 = (BSDefaultObserver *)objc_claimAutoreleasedReturnValue();
  externalDisplayDefaultsToken = self->_externalDisplayDefaultsToken;
  self->_externalDisplayDefaultsToken = v42;

  -[SBMousePointerManager addObserver:](self->_mousePointerManager, "addObserver:", self);
  objc_msgSend(v39, "addObserver:selector:name:object:", self, sel__keyboardAvailabilityChanged_, CFSTR("SBHardwareKeyboardAvailabilityChangedNotification"), 0);
  v61[0] = CFSTR("kSBSystemShellExtendedDisplayControllerHardwareAvailabilityIsAvailableKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v29);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v44;
  v62[1] = MEMORY[0x1E0C9AAB0];
  v61[1] = CFSTR("kSBSystemShellExtendedDisplayControllerFiredDuringDeviceConnectionWindowKey");
  v61[2] = CFSTR("kSBSystemShellExtendedDisplayControllerDisplayIdentityKey");
  -[FBSDisplayIdentity rootIdentity](self->_displayIdentity, "rootIdentity");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v45;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v62, v61, 3);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "postNotificationName:object:userInfo:", CFSTR("SBSystemShellExtendedDisplayControllerPolicyConnectNotification"), self, v46);

  objc_destroyWeak(&v54);
  objc_destroyWeak((id *)buf);

}

void __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  id WeakRetained;
  void *v6;
  uint8_t buf[4];
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "displayModeSettingsForDisplay:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32), CFSTR("SBSystemShellExtendedDisplayControllerPolicy.m"), 196, CFSTR("got nil SBSDisplayModeSettings for display: %@"), *(_QWORD *)(a1 + 40));

  }
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 96), "isEqual:", v2) & 1) == 0)
  {
    SBLogDisplayControlling();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 16), *(void **)(a1 + 32));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v8 = v4;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ did detect SBSDisplayModeSettings change in defaults", buf, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 96), v2);
    WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 8));
    objc_msgSend(WeakRetained, "requestUpdate:", 3);

  }
}

void __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke_50(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 168), "hasBeenSignalled") & 1) == 0)
  {
    SBLogDisplayControlling();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 16), *(void **)(a1 + 32));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v12 = v3;
      _os_log_impl(&dword_1D0540000, v2, OS_LOG_TYPE_DEFAULT, "%{public}@ device timer fired -- newly connecting devices will no longer drive display assertion", buf, 0xCu);

    }
    v6 = a1 + 32;
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v6 + 8);
    objc_msgSend(*(id *)(v4 + 16), "rootIdentity", CFSTR("kSBSystemShellExtendedDisplayControllerDisplayIdentityKey"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "postNotificationName:object:userInfo:", CFSTR("SBSystemShellExtendedDisplayControllerPolicyDeviceConnectionWindowExpiredNotification"), v4, v8);

  }
}

void __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke_54(uint64_t a1)
{
  id *WeakRetained;
  id *v2;
  char v3;
  id v4;
  NSObject *v5;
  _QWORD block[4];
  char v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v3 = objc_msgSend(WeakRetained[3], "isMirroringEnabled");
    v4 = objc_loadWeakRetained(v2 + 1);
    objc_msgSend(v4, "requestUpdate:", 7);

    dispatch_get_global_queue(-32768, 0);
    v5 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke_2;
    block[3] = &__block_descriptor_33_e5_v8__0l;
    v7 = v3;
    dispatch_async(v5, block);

  }
}

void __96__SBSystemShellExtendedDisplayControllerPolicy_connectToDisplayController_displayConfiguration___block_invoke_2(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  _DWORD v12[2];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc(MEMORY[0x1E0D02308]);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v2, "initWithStarting:", v3);

  BiomeLibrary();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "SpringBoard");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ExternalDisplay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MirroringMode");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "source");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sendEvent:", v4);
  SBLogBiome();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = *(unsigned __int8 *)(a1 + 32);
    v12[0] = 67109120;
    v12[1] = v11;
    _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Donate mirroring mode enabled: %{BOOL}u", (uint8_t *)v12, 8u);
  }

}

- (void)displayControllerWillDisconnect:(id)a3 sceneManager:(id)a4
{
  BSDefaultObserver *displayModeSettingsToken;
  BSDefaultObserver *externalDisplayDefaultsToken;
  void *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  -[BSAtomicSignal signal](self->_displayDisconnectSignal, "signal", a3, a4);
  -[BSDefaultObserver invalidate](self->_displayModeSettingsToken, "invalidate");
  displayModeSettingsToken = self->_displayModeSettingsToken;
  self->_displayModeSettingsToken = 0;

  -[BSDefaultObserver invalidate](self->_externalDisplayDefaultsToken, "invalidate");
  externalDisplayDefaultsToken = self->_externalDisplayDefaultsToken;
  self->_externalDisplayDefaultsToken = 0;

  -[SBMousePointerManager removeObserver:](self->_mousePointerManager, "removeObserver:", self);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);
  v10 = CFSTR("kSBSystemShellExtendedDisplayControllerDisplayIdentityKey");
  -[FBSDisplayIdentity rootIdentity](self->_displayIdentity, "rootIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "postNotificationName:object:userInfo:", CFSTR("SBSystemShellExtendedDisplayControllerPolicyDisconnectNotification"), self, v9);

}

- (void)displayControllerDidDisconnect:(id)a3 sceneManager:(id)a4
{
  -[FBScene invalidate](self->_currentScene, "invalidate", a3, a4);
}

- (void)displayController:(id)a3 didGainControlOfDisplayWithSceneManager:(id)a4
{
  void *v5;
  _QWORD v6[5];

  objc_msgSend(a4, "allScenes", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __106__SBSystemShellExtendedDisplayControllerPolicy_displayController_didGainControlOfDisplayWithSceneManager___block_invoke;
  v6[3] = &unk_1E8EA2978;
  v6[4] = self;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v6);

  self->_previouslyReceivedDeactivationReasons = 0;
}

void __106__SBSystemShellExtendedDisplayControllerPolicy_displayController_didGainControlOfDisplayWithSceneManager___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUISubclass");

  if (v4)
  {
    objc_msgSend(v7, "uiSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (*(id *)(*(_QWORD *)(a1 + 32) + 120) == v7)
      objc_msgSend(v6, "setForeground:", 1);
    objc_msgSend(v6, "setDeactivationReasons:", objc_msgSend(v6, "deactivationReasons") & ~*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
    objc_msgSend(v7, "updateSettings:withTransitionContext:", v6, 0);

  }
}

- (void)displayController:(id)a3 sceneManager:(id)a4 didLoseControlOfDisplayWithDeactivationReasons:(unint64_t)a5
{
  void *v7;
  _QWORD v8[6];

  objc_msgSend(a4, "allScenes", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __126__SBSystemShellExtendedDisplayControllerPolicy_displayController_sceneManager_didLoseControlOfDisplayWithDeactivationReasons___block_invoke;
  v8[3] = &unk_1E8EB77A8;
  v8[4] = self;
  v8[5] = a5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  self->_previouslyReceivedDeactivationReasons = a5;
}

void __126__SBSystemShellExtendedDisplayControllerPolicy_displayController_sceneManager_didLoseControlOfDisplayWithDeactivationReasons___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUISubclass");

  if (v4)
  {
    objc_msgSend(v7, "uiSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    if (*(id *)(*(_QWORD *)(a1 + 32) + 120) == v7)
      objc_msgSend(v6, "setForeground:", 0);
    objc_msgSend(v6, "setDeactivationReasons:", *(_QWORD *)(a1 + 40) | objc_msgSend(v6, "deactivationReasons"));
    objc_msgSend(v7, "updateSettings:withTransitionContext:", v6, 0);

  }
}

- (void)displayController:(id)a3 sceneManager:(id)a4 didReceiveNewDeactivationReasons:(unint64_t)a5
{
  void *v7;
  _QWORD v8[6];

  objc_msgSend(a4, "allScenes", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __112__SBSystemShellExtendedDisplayControllerPolicy_displayController_sceneManager_didReceiveNewDeactivationReasons___block_invoke;
  v8[3] = &unk_1E8EB77A8;
  v8[4] = self;
  v8[5] = a5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v8);

  self->_previouslyReceivedDeactivationReasons = a5;
}

void __112__SBSystemShellExtendedDisplayControllerPolicy_displayController_sceneManager_didReceiveNewDeactivationReasons___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "settings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isUISubclass");

  if (v4)
  {
    objc_msgSend(v7, "uiSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)objc_msgSend(v5, "mutableCopy");

    objc_msgSend(v6, "setDeactivationReasons:", *(_QWORD *)(a1 + 40) | objc_msgSend(v6, "deactivationReasons") & ~*(_QWORD *)(*(_QWORD *)(a1 + 32) + 128));
    objc_msgSend(v7, "updateSettings:withTransitionContext:", v6, 0);

  }
}

- (void)displayController:(id)a3 didBeginTransaction:(id)a4 sceneManager:(id)a5 displayConfiguration:(id)a6 deactivationReasons:(unint64_t)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  FBScene *currentScene;
  _QWORD v22[5];
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (-[SBSystemShellExtendedDisplayControllerPolicy _wantsControlOfDisplay](self, "_wantsControlOfDisplay"))
  {
    -[SBSystemShellExtendedDisplayControllerPolicy _fetchOrCreateSceneWithDisplayConfiguration:deactivationReasons:sceneManager:](self, "_fetchOrCreateSceneWithDisplayConfiguration:deactivationReasons:sceneManager:", v14, a7, v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogDisplayControlling();
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v15)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v24 = v18;
        v25 = 2114;
        v26 = v15;
        _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ retrieved springboard scene %{public}@", buf, 0x16u);

      }
      if (objc_msgSend(v12, "isAuditHistoryEnabled"))
      {
        objc_msgSend(v15, "identifier");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "_addAuditHistoryItem:", CFSTR("retrieved springboard scene %@"), v19);

      }
    }
    else
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[SBSystemShellExtendedDisplayControllerPolicy displayController:didBeginTransaction:sceneManager:displayConfiguration:deactivationReasons:].cold.1((void **)&self->super.isa, (uint64_t)a2, v17);

      if (objc_msgSend(v12, "isAuditHistoryEnabled"))
        objc_msgSend(v12, "_addAuditHistoryItem:", CFSTR("failed to retrieve springboard scene"));
    }
    currentScene = self->_currentScene;
    self->_currentScene = (FBScene *)v15;
  }
  else
  {
    -[FBScene invalidate](self->_currentScene, "invalidate");
    objc_msgSend(v13, "allScenes");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __140__SBSystemShellExtendedDisplayControllerPolicy_displayController_didBeginTransaction_sceneManager_displayConfiguration_deactivationReasons___block_invoke;
    v22[3] = &unk_1E8EA2978;
    v22[4] = self;
    objc_msgSend(v20, "enumerateObjectsUsingBlock:", v22);

    currentScene = self->_currentScene;
    self->_currentScene = 0;
  }

}

uint64_t __140__SBSystemShellExtendedDisplayControllerPolicy_displayController_didBeginTransaction_sceneManager_displayConfiguration_deactivationReasons___block_invoke(uint64_t result, void *a2)
{
  if (*(void **)(*(_QWORD *)(result + 32) + 120) != a2)
    return objc_msgSend(a2, "invalidate");
  return result;
}

- (void)displayController:(id)a3 updatePresentationWithSceneManager:(id)a4 displayConfiguration:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  void (**v13)(_QWORD);
  char v14;
  void *v15;
  void *v16;
  uint64_t v17;
  char v18;
  uint64_t v19;
  NSObject *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  SBSystemShellExtendedDisplayControllerPolicy *v25;
  void (**v26)(_QWORD);
  _QWORD *v27;
  SEL v28;
  uint64_t v29;
  _QWORD v30[4];
  uint8_t buf[4];
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v22 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(_QWORD))a6;
  v14 = -[FBSDisplayConfiguration isEqual:](self->_lastPresentationUpdateDisplayConfiguration, "isEqual:", v12);
  if ((v14 & 1) == 0)
    objc_storeStrong((id *)&self->_lastPresentationUpdateDisplayConfiguration, a5);
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "boundPointerUIScenes");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v15, "unionSet:", v16);
  if (self->_currentScene)
    objc_msgSend(v15, "addObject:");
  v17 = objc_msgSend(v15, "count");
  v30[0] = 0;
  v30[1] = v30;
  v30[2] = 0x2020000000;
  v30[3] = 0;
  if (v17)
    v18 = v14;
  else
    v18 = 1;
  if ((v18 & 1) != 0)
  {
    v13[2](v13);
  }
  else
  {
    v19 = v17;
    SBLogDisplayControlling();
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v32 = v21;
      _os_log_impl(&dword_1D0540000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ running update as display changed and we have scenes to update", buf, 0xCu);

    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke;
    v23[3] = &unk_1E8EB77F8;
    v24 = v12;
    v25 = self;
    v28 = a2;
    v29 = v19;
    v27 = v30;
    v26 = v13;
    objc_msgSend(v15, "enumerateObjectsUsingBlock:", v23);

  }
  _Block_object_dispose(v30, 8);

}

void __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  id v9;
  __int128 v10;
  _QWORD v11[5];
  id v12;
  __int128 v13;
  uint64_t v14;
  uint64_t v15;

  v3 = a2;
  objc_msgSend(v3, "settings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  objc_msgSend(v5, "setDisplayConfiguration:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v5, "setFrame:");
  SBLogDisplayControlling();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke_cold_1(a1, v3, v6);

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke_65;
  v11[3] = &unk_1E8EB77D0;
  v11[4] = *(_QWORD *)(a1 + 40);
  v12 = v3;
  v7 = *(_QWORD *)(a1 + 72);
  v10 = *(_OWORD *)(a1 + 48);
  v14 = *(_QWORD *)(a1 + 64);
  v15 = v7;
  v8 = (id)v10;
  v13 = v10;
  v9 = v3;
  objc_msgSend(v9, "updateSettings:withTransitionContext:completion:", v5, 0, v11);

}

void __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke_65(_QWORD *a1)
{
  uint64_t v2;
  NSObject *v3;

  v2 = (uint64_t)(a1 + 7);
  ++*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24);
  SBLogDisplayControlling();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke_65_cold_1((uint64_t)a1, v2, v3);

  if (*(_QWORD *)(*(_QWORD *)(a1[7] + 8) + 24) == a1[9])
    (*(void (**)(void))(a1[6] + 16))();
}

- (id)displayPreferencesForDisplayController:(id)a3
{
  id v4;
  double v5;
  SBSceneHostingDisplayPreferences *v6;

  v4 = objc_alloc_init(MEMORY[0x1E0D23130]);
  -[SBSDisplayModeSettings overscanCompensation](self->_displayModeSettings, "overscanCompensation");
  objc_msgSend(v4, "setOverscanCompensation:", FBSDisplayOverscanCompensationForDisplayValue());
  if (-[SBExternalDisplayDefaults chamois](self->_externalDisplayDefaults, "chamois"))
  {
    -[SBDisplayScaleMapping referenceSize](self->_displayScaleMapping, "referenceSize");
    objc_msgSend(v4, "setNativePixelSize:");
  }
  -[SBDisplayScaleMapping logicalScaleForDisplayScale:](self->_displayScaleMapping, "logicalScaleForDisplayScale:", -[SBSDisplayModeSettings scale](self->_displayModeSettings, "scale"));
  v6 = -[SBSceneHostingDisplayPreferences initWithDisplayConfigurationRequest:logicalScale:contentsScale:keepOtherModes:]([SBSceneHostingDisplayPreferences alloc], "initWithDisplayConfigurationRequest:logicalScale:contentsScale:keepOtherModes:", v4, 0, v5, v5, self->_contentScale);

  return v6;
}

- (id)assertionPreferencesForDisplay:(id)a3 displayConfiguration:(id)a4
{
  id v5;
  SBDisplayAssertionPreferences *v6;
  void *v7;
  void *v8;
  FBSDisplayIdentity *displayIdentity;
  uint64_t v10;
  void *v11;

  v5 = a4;
  v6 = objc_alloc_init(SBDisplayAssertionPreferences);
  -[SBDisplayAssertionPreferences setWantsControlOfDisplay:](v6, "setWantsControlOfDisplay:", -[SBSystemShellExtendedDisplayControllerPolicy _wantsControlOfDisplay](self, "_wantsControlOfDisplay"));
  -[SBExternalDisplayService preferredArrangementOfExternalDisplay:](self->_externalDisplayService, "preferredArrangementOfExternalDisplay:", self->_displayIdentity);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayAssertionPreferences setDisplayArrangement:](v6, "setDisplayArrangement:", v7);

  +[SBDisplayPowerLogEntry forDisplay:mode:zoom:](SBDisplayPowerLogEntry, "forDisplay:mode:zoom:", v5, 3, SBDisplayPowerLogZoomLevelFromScale(-[SBSDisplayModeSettings scale](self->_displayModeSettings, "scale")));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBDisplayAssertionPreferences setPowerLogEntry:](v6, "setPowerLogEntry:", v8);
  displayIdentity = self->_displayIdentity;
  v10 = objc_opt_class();
  _SBPreventIdleSleepReason(displayIdentity, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDisplayAssertionPreferences setDisableSystemIdleSleepReason:](v6, "setDisableSystemIdleSleepReason:", v11);

  -[SBDisplayAssertionPreferences setCloneMirroringMode:](v6, "setCloneMirroringMode:", 2);
  return v6;
}

- (BOOL)_wantsControlOfDisplay
{
  return -[SBExternalDisplayDefaults isMirroringEnabled](self->_externalDisplayDefaults, "isMirroringEnabled") ^ 1;
}

- (void)externalDisplayServiceDidUpdatePreferredDisplayArrangement:(id)a3
{
  void *v4;
  void *v5;
  id WeakRetained;

  if ((objc_msgSend(MEMORY[0x1E0CB3978], "isMainThread", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "-[SBSystemShellExtendedDisplayControllerPolicy externalDisplayServiceDidUpdatePreferredDisplayArrangement:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, CFSTR("SBSystemShellExtendedDisplayControllerPolicy.m"), 460, CFSTR("this call must be made on the main thread"));

  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_displayController);
  objc_msgSend(WeakRetained, "requestUpdate:", 1);

}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBSystemShellExtendedDisplayControllerPolicy descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (NSString)description
{
  return (NSString *)-[SBSystemShellExtendedDisplayControllerPolicy descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  SBSystemShellExtendedDisplayControllerPolicy *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  SBSystemShellExtendedDisplayControllerPolicy *v18;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = MEMORY[0x1E0C809B0];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __86__SBSystemShellExtendedDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke;
  v16[3] = &unk_1E8E9E820;
  v7 = v5;
  v17 = v7;
  v18 = self;
  objc_msgSend(v7, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Display Scale Mapping"), v4, v16);
  if (self->_currentScene)
  {
    v14[0] = v6;
    v14[1] = 3221225472;
    v14[2] = __86__SBSystemShellExtendedDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke_2;
    v14[3] = &unk_1E8E9E820;
    v14[4] = self;
    v8 = v7;
    v15 = v8;
    objc_msgSend(v8, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("FBScene"), v4, v14);
    v11[0] = v6;
    v11[1] = 3221225472;
    v11[2] = __86__SBSystemShellExtendedDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke_3;
    v11[3] = &unk_1E8E9E820;
    v12 = v8;
    v13 = self;
    objc_msgSend(v12, "appendBodySectionWithName:multilinePrefix:block:", CFSTR("Dev Overrides"), CFSTR("\t"), v11);

  }
  v9 = v7;

  return v9;
}

id __86__SBSystemShellExtendedDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke(uint64_t a1)
{
  return (id)objc_msgSend(*(id *)(a1 + 32), "appendObject:withName:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 104), 0);
}

void __86__SBSystemShellExtendedDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 120), "uiSettings");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v2 = *(void **)(a1 + 40);
  objc_msgSend(v8, "frame");
  v3 = (id)objc_msgSend(v2, "appendRect:withName:", CFSTR("frame"));
  v4 = (id)objc_msgSend(*(id *)(a1 + 40), "appendBool:withName:", objc_msgSend(v8, "isForeground"), CFSTR("isForeground"));
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v8, "deactivationReasons");
  UIApplicationSceneDeactivationReasonMaskDescriptionComponents();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v5, "appendObject:withName:", v6, CFSTR("deactivationReasons"));

}

id __86__SBSystemShellExtendedDisplayControllerPolicy_descriptionBuilderWithMultilinePrefix___block_invoke_3(uint64_t a1)
{
  id v2;
  void *v3;

  v2 = (id)objc_msgSend(*(id *)(a1 + 32), "appendBool:withName:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "connectionType") == 1, CFSTR("isWiredDisplay"));
  v3 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 24), "contentsScale");
  return (id)objc_msgSend(v3, "appendFloat:withName:decimalPrecision:", CFSTR("contentsScale"), 2);
}

- (void)mousePointerManager:(id)a3 hardwarePointingDeviceAttachedDidChange:(BOOL)a4
{
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __108__SBSystemShellExtendedDisplayControllerPolicy_mousePointerManager_hardwarePointingDeviceAttachedDidChange___block_invoke;
  v4[3] = &unk_1E8E9DF28;
  objc_copyWeak(&v5, &location);
  dispatch_async(MEMORY[0x1E0C80D38], v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

void __108__SBSystemShellExtendedDisplayControllerPolicy_mousePointerManager_hardwarePointingDeviceAttachedDidChange___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_hardwareAvailabilityChanged");

}

- (BOOL)_areRuntimeAvailabilityRequirementsMet
{
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  BOOL v13;
  int v15;
  void *v16;
  __int16 v17;
  _BYTE v18[14];
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[SBSystemShellExtendedDisplayControllerPolicy _currentRuntimeMask](self, "_currentRuntimeMask");
  v4 = -[SBExternalDisplayRuntimeAvailabilitySettings extendedDisplayRequirements](self->_runtimeAvailabilitySettings, "extendedDisplayRequirements");
  SBLogDisplayControlling();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    SBManagedDisplayModeRequirementMaskDescription(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    SBManagedDisplayModeRequirementMaskDescription(v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138543618;
    v16 = v6;
    v17 = 2114;
    *(_QWORD *)v18 = v7;
    _os_signpost_emit_with_name_impl(&dword_1D0540000, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "SB_EXTENDED_DISPLAY_RESOLVER_EVALUATE", "required: %{public}@; current: %{public}@",
      (uint8_t *)&v15,
      0x16u);

  }
  v8 = v4 & v3;

  SBLogDisplayControlling();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBManagedDisplayModeRequirementMaskDescription(v4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBManagedDisplayModeRequirementMaskDescription(v3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138544130;
    v16 = v10;
    v17 = 1024;
    *(_DWORD *)v18 = v8 == v4;
    *(_WORD *)&v18[4] = 2114;
    *(_QWORD *)&v18[6] = v11;
    v19 = 2114;
    v20 = v12;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ returning %{BOOL}u; requiredMask: %{public}@; currentMask: %{public}@",
      (uint8_t *)&v15,
      0x26u);

  }
  v13 = v8 == v4;

  self->_requiredHardwareAvailable = v13;
  return v13;
}

- (int64_t)_currentRuntimeMask
{
  SBBitmaskUnionIf();
  return SBBitmaskUnionIf();
}

uint64_t __67__SBSystemShellExtendedDisplayControllerPolicy__currentRuntimeMask__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 72), "isHardwarePointingDeviceAttached");
}

uint64_t __67__SBSystemShellExtendedDisplayControllerPolicy__currentRuntimeMask__block_invoke_2()
{
  objc_msgSend((id)SBApp, "updateHardwareKeyboardAttached");
  return objc_msgSend((id)SBApp, "isHardwareKeyboardAttached");
}

- (void)_hardwareAvailabilityChanged
{
  _BOOL8 v3;
  uint64_t v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v13;
  id WeakRetained;
  _QWORD v15[3];
  _QWORD v16[3];
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  _BOOL4 v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = -[SBSystemShellExtendedDisplayControllerPolicy _areRuntimeAvailabilityRequirementsMet](self, "_areRuntimeAvailabilityRequirementsMet");
  v4 = -[BSContinuousMachTimer isScheduled](self->_timerForAttachedDevicesToAffectDisplayAssertion, "isScheduled");
  if ((_DWORD)v4)
  {
    if (!self->_didConnectToRequiredDevicesDuringTimerWindow && v3)
    {
      SBLogDisplayControlling();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v18 = v13;
        v19 = 1024;
        v20 = v3;
        _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ saw required devices connect while timer was scheduled. isAvailable: %{BOOL}u", buf, 0x12u);

      }
      self->_didConnectToRequiredDevicesDuringTimerWindow = v3;
      -[SBSystemShellExtendedDisplayControllerPolicy reevaluateMirroringEnablement](self, "reevaluateMirroringEnablement");
      WeakRetained = objc_loadWeakRetained((id *)&self->_displayController);
      objc_msgSend(WeakRetained, "requestUpdate:", 7);

    }
  }
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v3, CFSTR("kSBSystemShellExtendedDisplayControllerHardwareAvailabilityIsAvailableKey"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  v15[1] = CFSTR("kSBSystemShellExtendedDisplayControllerFiredDuringDeviceConnectionWindowKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  v15[2] = CFSTR("kSBSystemShellExtendedDisplayControllerDisplayIdentityKey");
  -[FBSDisplayIdentity rootIdentity](self->_displayIdentity, "rootIdentity");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "postNotificationName:object:userInfo:", CFSTR("SBSystemShellExtendedDisplayControllerHardwareAvailabilityNotification"), self, v10);

}

- (void)_windowManagementStyleDidChange:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  SBSafeCast(v5, v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "windowScene");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v7, "isMainDisplayWindowScene");

  if ((_DWORD)v4)
    -[SBSystemShellExtendedDisplayControllerPolicy reevaluateMirroringEnablement](self, "reevaluateMirroringEnablement");

}

- (void)reevaluateMirroringEnablement
{
  SBWindowSceneManager *windowSceneManager;
  void *v4;
  void *v5;
  uint64_t v6;
  _BOOL8 v7;
  id v8;

  if (-[SBAppSwitcherDefaults shouldUpdateExternalDisplayMirroringWhenWindowManagementStyleUpdates](self->_appSwitcherDefaults, "shouldUpdateExternalDisplayMirroringWhenWindowManagementStyleUpdates"))
  {
    windowSceneManager = self->_windowSceneManager;
    objc_msgSend(MEMORY[0x1E0D228F8], "mainIdentity");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWindowSceneManager windowSceneForDisplayIdentity:](windowSceneManager, "windowSceneForDisplayIdentity:", v4);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "switcherController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "windowManagementStyle");

    if (v6)
      v7 = !self->_requiredHardwareAvailable;
    else
      v7 = 1;
    -[SBExternalDisplayDefaults setMirroringEnabled:](self->_externalDisplayDefaults, "setMirroringEnabled:", v7);

  }
}

- (id)_fetchOrCreateSceneWithDisplayConfiguration:(id)a3 deactivationReasons:(unint64_t)a4 sceneManager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  FBSceneManager *fbSceneManager;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  FBSceneManager *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  unint64_t v43;
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x1E0D231F0];
  v11 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bundleIdentifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "identity");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", CFSTR("%@:%@"), v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identityForIdentifier:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  fbSceneManager = self->_fbSceneManager;
  objc_msgSend(v16, "identifier");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[FBSceneManager sceneWithIdentifier:](fbSceneManager, "sceneWithIdentifier:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (v19)
  {
    objc_msgSend(v19, "uiSettings");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = (void *)objc_msgSend(v20, "mutableCopy");

    objc_msgSend(v21, "setDisplayConfiguration:", v8);
    objc_msgSend(v8, "bounds");
    objc_msgSend(v21, "setFrame:");
    objc_msgSend(v21, "setForeground:", a4 == 0);
    objc_msgSend(v21, "setDeactivationReasons:", objc_msgSend(v21, "deactivationReasons") | a4);
    objc_msgSend(v19, "updateSettings:withTransitionContext:", v21, 0);
    SBLogDisplayControlling();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v23;
      v46 = 2114;
      v47 = v24;
      _os_log_impl(&dword_1D0540000, v22, OS_LOG_TYPE_INFO, "%{public}@ reset %{public}@ for presentation", buf, 0x16u);

    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0D23140], "definition");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setIdentity:", v16);
    objc_msgSend(MEMORY[0x1E0D231C0], "localIdentity");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setClientIdentity:", v25);

    +[FBSSceneSpecification specification](SBExternalDisplayApplicationSceneSpecification, "specification");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setSpecification:", v26);

    v27 = (void *)MEMORY[0x1E0D23148];
    objc_msgSend(v21, "specification");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "parametersForSpecification:", v28);
    v22 = objc_claimAutoreleasedReturnValue();

    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __125__SBSystemShellExtendedDisplayControllerPolicy__fetchOrCreateSceneWithDisplayConfiguration_deactivationReasons_sceneManager___block_invoke;
    v40[3] = &unk_1E8EB7840;
    v41 = v8;
    v43 = a4;
    v39 = v9;
    v42 = v9;
    -[NSObject updateSettingsWithBlock:](v22, "updateSettingsWithBlock:", v40);
    -[NSObject updateClientSettingsWithBlock:](v22, "updateClientSettingsWithBlock:", &__block_literal_global_106_0);
    v29 = self->_fbSceneManager;
    objc_msgSend(v21, "identity");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "identifier");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D22908], "sharedInstance");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    -[FBSceneManager createSceneWithIdentifier:parameters:clientProvider:transitionContext:](v29, "createSceneWithIdentifier:parameters:clientProvider:transitionContext:", v31, v22, v32, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    SBLogDisplayControlling();
    v33 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      _SBDisplayControllerLoggingProem(self->_displayIdentity, self);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "identifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v45 = v34;
      v46 = 2114;
      v47 = v35;
      _os_log_impl(&dword_1D0540000, v33, OS_LOG_TYPE_INFO, "%{public}@ initialized %{public}@ for presentation", buf, 0x16u);

    }
    objc_msgSend(v19, "systemShellHostingEnvironment");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    SBUISystemShellHostingSpaceIdentifierForDisplayConfiguration();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setSystemShellHostingSpaceIdentifier:", v37);

    v9 = v39;
  }

  return v19;
}

void __125__SBSystemShellExtendedDisplayControllerPolicy__fetchOrCreateSceneWithDisplayConfiguration_deactivationReasons_sceneManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = a2;
  objc_msgSend(v3, "setTargetOfEventDeferringEnvironments:", 0);
  objc_msgSend(v3, "setInterfaceOrientationMode:", 2);
  v4 = (void *)SBApp;
  objc_msgSend(*(id *)(a1 + 32), "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "userInterfaceStyleProviderForDisplay:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInterfaceStyle:", objc_msgSend(v6, "currentStyle"));

  objc_msgSend(MEMORY[0x1E0DC5B80], "sb_thisDeviceDisplayEdgeInfo");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sb_applyDisplayEdgeInfoToSceneSettings:", v3);
  objc_msgSend(v3, "ignoreOcclusionReasons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", CFSTR("SystemApp"));

  objc_msgSend(v3, "setInterfaceOrientation:", 1);
  objc_msgSend(v3, "setDisplayConfiguration:", *(_QWORD *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(v3, "setLevel:", 0.0);
  objc_msgSend(v3, "setForeground:", *(_QWORD *)(a1 + 48) == 0);
  objc_msgSend(v3, "setDeactivationReasons:", *(_QWORD *)(a1 + 48));
  objc_msgSend(v3, "transientLocalSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forSetting:", *(_QWORD *)(a1 + 40), 4444);

  objc_msgSend(v3, "setEnhancedWindowingEnabled:", 1);
}

void __125__SBSystemShellExtendedDisplayControllerPolicy__fetchOrCreateSceneWithDisplayConfiguration_deactivationReasons_sceneManager___block_invoke_2(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setStatusBarStyle:", 0);
  objc_msgSend(v2, "setInterfaceOrientation:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayDisconnectSignal, 0);
  objc_storeStrong((id *)&self->_timerForAttachedDevicesToAffectDisplayAssertion, 0);
  objc_storeStrong((id *)&self->_lastPresentationUpdateDisplayConfiguration, 0);
  objc_storeStrong((id *)&self->_currentScene, 0);
  objc_storeStrong((id *)&self->_fbSceneManager, 0);
  objc_storeStrong((id *)&self->_displayScaleMapping, 0);
  objc_storeStrong((id *)&self->_displayModeSettings, 0);
  objc_storeStrong((id *)&self->_windowSceneManager, 0);
  objc_storeStrong((id *)&self->_mousePointerManager, 0);
  objc_storeStrong((id *)&self->_runtimeAvailabilitySettings, 0);
  objc_storeStrong((id *)&self->_externalDisplayService, 0);
  objc_storeStrong((id *)&self->_displayModeSettingsToken, 0);
  objc_storeStrong((id *)&self->_externalDisplayDefaultsToken, 0);
  objc_storeStrong((id *)&self->_appSwitcherDefaults, 0);
  objc_storeStrong((id *)&self->_externalDisplayDefaults, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
  objc_destroyWeak((id *)&self->_displayController);
}

- (void)displayController:(NSObject *)a3 didBeginTransaction:sceneManager:displayConfiguration:deactivationReasons:.cold.1(void **a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBDisplayControllerLoggingProem(a1[2], a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "%{public}@ failed to retrieve springboard scene", (uint8_t *)&v5, 0xCu);

}

void __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke_cold_1(uint64_t a1, void *a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 40) + 16), *(void **)(a1 + 40));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(a1 + 72);
  v9 = 138543874;
  v10 = v6;
  v11 = 2114;
  v12 = v7;
  v13 = 2048;
  v14 = v8;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ updating displayConfig+frame for %{public}@; pendingUpdateCount: %lu",
    (uint8_t *)&v9,
    0x20u);

}

void __133__SBSystemShellExtendedDisplayControllerPolicy_displayController_updatePresentationWithSceneManager_displayConfiguration_completion___block_invoke_65_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _SBDisplayControllerLoggingProem(*(void **)(*(_QWORD *)(a1 + 32) + 16), *(void **)(a1 + 32));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "identity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)a2 + 8) + 24);
  v9 = *(_QWORD *)(a1 + 72);
  v10 = 138544130;
  v11 = v6;
  v12 = 2114;
  v13 = v7;
  v14 = 2048;
  v15 = v8;
  v16 = 2048;
  v17 = v9;
  _os_log_debug_impl(&dword_1D0540000, a3, OS_LOG_TYPE_DEBUG, "%{public}@ completed update for %{public}@; completedUpdateCount: %lu; pendingUpdateCount: %lu",
    (uint8_t *)&v10,
    0x2Au);

}

@end
