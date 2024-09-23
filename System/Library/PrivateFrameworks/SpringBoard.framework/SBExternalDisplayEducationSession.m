@implementation SBExternalDisplayEducationSession

- (SBExternalDisplayEducationSession)initWithDisplayIdentity:(id)a3 hardwareAvailability:(BOOL)a4 bannerPoster:(id)a5
{
  id v9;
  id v10;
  SBExternalDisplayEducationSession *v11;
  SBExternalDisplayEducationSession *v12;
  id v13;
  void *v14;
  uint64_t v15;
  BSAbsoluteMachTimer *bannerDismissTimer;
  BSAtomicSignal *v17;
  BSAtomicSignal *displayDisconnectSignal;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  objc_super v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v25.receiver = self;
  v25.super_class = (Class)SBExternalDisplayEducationSession;
  v11 = -[SBExternalDisplayEducationSession init](&v25, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_displayIdentity, a3);
    v12->_isHardwareAvailable = a4;
    v12->_isHardwareAvailableDuringDisplayConnectionWindow = a4;
    objc_storeStrong((id *)&v12->_bannerPoster, a5);
    v13 = objc_alloc(MEMORY[0x1E0D01690]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBExternalDisplayEducationSession-%@.bannerDismissTimer"), v12->_displayIdentity);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithIdentifier:", v14);
    bannerDismissTimer = v12->_bannerDismissTimer;
    v12->_bannerDismissTimer = (BSAbsoluteMachTimer *)v15;

    v17 = (BSAtomicSignal *)objc_alloc_init(MEMORY[0x1E0D016C0]);
    displayDisconnectSignal = v12->_displayDisconnectSignal;
    v12->_displayDisconnectSignal = v17;

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "externalDisplayDefaults");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v12->_previousPresentedReasons = objc_msgSend(v20, "externalDisplayEducationReasons");
    SBLogDisplayEducation();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      SBExternalDisplayEducationReasonMaskDescription();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v22;
      v28 = 2114;
      v29 = v23;
      _os_log_impl(&dword_1D0540000, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ creating session with previous reasons: %{public}@", buf, 0x16u);

    }
  }

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  -[NSXPCListener invalidate](self->_listener, "invalidate");
  -[NSXPCConnection invalidate](self->_xpcConnection, "invalidate");
  -[BSAbsoluteMachTimer invalidate](self->_bannerDismissTimer, "invalidate");
  v3.receiver = self;
  v3.super_class = (Class)SBExternalDisplayEducationSession;
  -[SBExternalDisplayEducationSession dealloc](&v3, sel_dealloc);
}

- (void)displayConnected
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t previousPresentedReasons;
  NSObject *v9;
  _BOOL4 v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  const char *v19;
  _QWORD v20[5];
  id v21;
  SEL v22;
  _QWORD v23[5];
  id v24;
  SEL v25;
  uint8_t buf[4];
  void *v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  SBLogDisplayEducation();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v27 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ display connected", buf, 0xCu);

  }
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "externalDisplayDefaults");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  previousPresentedReasons = self->_previousPresentedReasons;
  if (!previousPresentedReasons)
  {
    SBLogDisplayEducation();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SBExternalDisplayEducationReasonMaskDescription();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v15;
      v28 = 2114;
      v29 = v16;
      _os_log_impl(&dword_1D0540000, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ we've not presented either alert before. presenting now. previousReasons: %{public}@", buf, 0x16u);

    }
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __53__SBExternalDisplayEducationSession_displayConnected__block_invoke;
    v23[3] = &unk_1E8EB7548;
    v23[4] = self;
    v25 = a2;
    v24 = v7;
    -[SBExternalDisplayEducationSession _presentEducationAlert:](self, "_presentEducationAlert:", v23);
    v13 = v24;
    goto LABEL_12;
  }
  if (!self->_isHardwareAvailableDuringDisplayConnectionWindow)
  {
    if (previousPresentedReasons != 3)
      goto LABEL_20;
    SBLogDisplayEducation();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      SBExternalDisplayEducationReasonMaskDescription();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      v28 = 2114;
      v29 = v18;
      v19 = "%{public}@ have presented both alerts before. rolling banner now. previousReasons: %{public}@";
LABEL_18:
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, v19, buf, 0x16u);

    }
LABEL_19:

    -[SBExternalDisplayEducationSession _presentBanner](self, "_presentBanner");
    goto LABEL_20;
  }
  SBLogDisplayEducation();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if ((previousPresentedReasons & 1) != 0)
  {
    if (v10)
    {
      _SBFLoggingMethodProem();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      SBExternalDisplayEducationReasonMaskDescription();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v27 = v17;
      v28 = 2114;
      v29 = v18;
      v19 = "%{public}@ hardwareReqs are satisfied. have presented satisfied alert before. rolling banner now. previousRe"
            "asons: %{public}@";
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if (v10)
  {
    _SBFLoggingMethodProem();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    SBExternalDisplayEducationReasonMaskDescription();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v27 = v11;
    v28 = 2114;
    v29 = v12;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ hardwareReqs are satisfied. haven't presented satisfied alert before. presenting now. previousReasons: %{public}@", buf, 0x16u);

  }
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __53__SBExternalDisplayEducationSession_displayConnected__block_invoke_42;
  v20[3] = &unk_1E8EB7548;
  v20[4] = self;
  v22 = a2;
  v21 = v7;
  -[SBExternalDisplayEducationSession _presentEducationAlert:](self, "_presentEducationAlert:", v20);
  v13 = v21;
LABEL_12:

LABEL_20:
}

void __53__SBExternalDisplayEducationSession_displayConnected__block_invoke(uint64_t a1, int a2)
{
  int v3;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 25);
    SBLogDisplayEducation();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
    if (v3)
    {
      if (v5)
      {
        _SBFLoggingMethodProem();
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v6;
        _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ counting as satisfied alert", (uint8_t *)&v12, 0xCu);

      }
      v7 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) | 1;
    }
    else
    {
      if (v5)
      {
        _SBFLoggingMethodProem();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ counting as not satisfied alert", (uint8_t *)&v12, 0xCu);

      }
      v7 = *(void **)(a1 + 40);
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) | 2;
    }
    objc_msgSend(v7, "setExternalDisplayEducationReasons:", v8);
  }
  else
  {
    SBLogDisplayEducation();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v10;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ not counting as no user response", (uint8_t *)&v12, 0xCu);

    }
  }
}

void __53__SBExternalDisplayEducationSession_displayConnected__block_invoke_42(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  SBLogDisplayEducation();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      _SBFLoggingMethodProem();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v6;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ counting as satisfied alert", (uint8_t *)&v8, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "setExternalDisplayEducationReasons:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) | 1);
  }
  else
  {
    if (v5)
    {
      _SBFLoggingMethodProem();
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 138543362;
      v9 = v7;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ not counting as no user response", (uint8_t *)&v8, 0xCu);

    }
  }
}

- (void)updateHardwareAvailability:(BOOL)a3 withinDisplayConnectionWindow:(BOOL)a4
{
  NSObject *v7;
  void *v8;
  _BOOL4 isHardwareAvailableDuringDisplayConnectionWindow;
  unint64_t previousPresentedReasons;
  NSObject *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  NSXPCConnection *xpcConnection;
  void *v16;
  NSObject *v17;
  void *v18;
  _BOOL4 isHardwareAvailable;
  _BOOL4 v20;
  void *v21;
  void *v22;
  _QWORD v23[6];
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  if (self->_isHardwareAvailable || !a3)
    return;
  self->_isHardwareAvailable = a3;
  if (a4 && !self->_isHardwareAvailableDuringDisplayConnectionWindow)
    self->_isHardwareAvailableDuringDisplayConnectionWindow = a3;
  SBLogDisplayEducation();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isHardwareAvailableDuringDisplayConnectionWindow = self->_isHardwareAvailableDuringDisplayConnectionWindow;
    *(_DWORD *)buf = 138543618;
    v25 = v8;
    v26 = 1024;
    LODWORD(v27) = isHardwareAvailableDuringDisplayConnectionWindow;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ _isHardwareAvailableDuringDisplayConnectionWindow: %{BOOL}u", buf, 0x12u);

  }
  if (self->_isHardwareAvailableDuringDisplayConnectionWindow)
  {
    if (!self->_isPresenting)
    {
      previousPresentedReasons = self->_previousPresentedReasons;
      SBLogDisplayEducation();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if ((previousPresentedReasons & 1) != 0)
      {
        if (v12)
        {
          _SBFLoggingMethodProem();
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          SBExternalDisplayEducationReasonMaskDescription();
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v21;
          v26 = 2114;
          v27 = v22;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ hardwareReqs are satisfied. have presented satisfied alert before. rolling banner now. previousReasons: %{public}@", buf, 0x16u);

        }
        -[SBExternalDisplayEducationSession _presentBanner](self, "_presentBanner");
      }
      else
      {
        if (v12)
        {
          _SBFLoggingMethodProem();
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          SBExternalDisplayEducationReasonMaskDescription();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138543618;
          v25 = v13;
          v26 = 2114;
          v27 = v14;
          _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@ hardwareReqs are satisfied. haven't presented satisfied alert before. presenting now. previousReasons: %{public}@", buf, 0x16u);

        }
        v23[0] = MEMORY[0x1E0C809B0];
        v23[1] = 3221225472;
        v23[2] = __94__SBExternalDisplayEducationSession_updateHardwareAvailability_withinDisplayConnectionWindow___block_invoke;
        v23[3] = &unk_1E8EB7570;
        v23[4] = self;
        v23[5] = a2;
        -[SBExternalDisplayEducationSession _presentEducationAlert:](self, "_presentEducationAlert:", v23);
      }
      return;
    }
  }
  else if (!self->_isPresenting)
  {
    return;
  }
  xpcConnection = self->_xpcConnection;
  if (xpcConnection)
  {
    -[NSXPCConnection remoteObjectProxy](xpcConnection, "remoteObjectProxy");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogDisplayEducation();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      isHardwareAvailable = self->_isHardwareAvailable;
      v20 = self->_isHardwareAvailableDuringDisplayConnectionWindow;
      *(_DWORD *)buf = 138544130;
      v25 = v18;
      v26 = 2114;
      v27 = v16;
      v28 = 1024;
      v29 = isHardwareAvailable;
      v30 = 1024;
      v31 = v20;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ telling remoteObject %{public}@; hardwareAvailable: %{BOOL}u; during window: %{BOOL}u",
        buf,
        0x22u);

    }
    objc_msgSend(v16, "externalDisplayHardwareRequirementsSatisfiedChanged:", self->_isHardwareAvailable);

  }
}

void __94__SBExternalDisplayEducationSession_updateHardwareAvailability_withinDisplayConnectionWindow___block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogDisplayEducation();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      _SBFLoggingMethodProem();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ counting as satisfied alert", (uint8_t *)&v9, 0xCu);

    }
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "externalDisplayDefaults");
    v4 = objc_claimAutoreleasedReturnValue();

    -[NSObject setExternalDisplayEducationReasons:](v4, "setExternalDisplayEducationReasons:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) | 1);
  }
  else if (v5)
  {
    _SBFLoggingMethodProem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ not counting as no user response", (uint8_t *)&v9, 0xCu);

  }
}

- (void)deviceConnectionWindowExpired
{
  NSObject *v4;
  void *v5;
  unint64_t previousPresentedReasons;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[6];
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  SBLogDisplayEducation();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v15 = v5;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ device connection window expired", buf, 0xCu);

  }
  if (!self->_isHardwareAvailableDuringDisplayConnectionWindow && !self->_isPresenting)
  {
    previousPresentedReasons = self->_previousPresentedReasons;
    SBLogDisplayEducation();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if ((previousPresentedReasons & 2) != 0)
    {
      if (v8)
      {
        _SBFLoggingMethodProem();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        SBExternalDisplayEducationReasonMaskDescription();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v11;
        v16 = 2114;
        v17 = v12;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ hardwareReqs are not satisfied. have presented unsatisfied alert before. rolling banner now. previousReasons: %{public}@", buf, 0x16u);

      }
      -[SBExternalDisplayEducationSession _presentBanner](self, "_presentBanner");
    }
    else
    {
      if (v8)
      {
        _SBFLoggingMethodProem();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        SBExternalDisplayEducationReasonMaskDescription();
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        v15 = v9;
        v16 = 2114;
        v17 = v10;
        _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "%{public}@ hardwareReqs are not satisfied. haven't presented unsatisfied alert before. presenting now. previousReasons: %{public}@", buf, 0x16u);

      }
      v13[0] = MEMORY[0x1E0C809B0];
      v13[1] = 3221225472;
      v13[2] = __66__SBExternalDisplayEducationSession_deviceConnectionWindowExpired__block_invoke;
      v13[3] = &unk_1E8EB7570;
      v13[4] = self;
      v13[5] = a2;
      -[SBExternalDisplayEducationSession _presentEducationAlert:](self, "_presentEducationAlert:", v13);
    }
  }
}

void __66__SBExternalDisplayEducationSession_deviceConnectionWindowExpired__block_invoke(uint64_t a1, int a2)
{
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  SBLogDisplayEducation();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (a2)
  {
    if (v5)
    {
      _SBFLoggingMethodProem();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v6;
      _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ counting as not satisfied alert", (uint8_t *)&v9, 0xCu);

    }
    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "externalDisplayDefaults");
    v4 = objc_claimAutoreleasedReturnValue();

    -[NSObject setExternalDisplayEducationReasons:](v4, "setExternalDisplayEducationReasons:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) | 2);
  }
  else if (v5)
  {
    _SBFLoggingMethodProem();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138543362;
    v10 = v8;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ not counting as no user response", (uint8_t *)&v9, 0xCu);

  }
}

- (void)displayDisconnected
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  -[BSAtomicSignal signal](self->_displayDisconnectSignal, "signal");
  SBLogDisplayEducation();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@ display disconnected", (uint8_t *)&v5, 0xCu);

  }
  if (self->_isPresenting)
  {
    -[SBExternalDisplayEducationSession _dismissEducationAlert:](self, "_dismissEducationAlert:", CFSTR("Display Disconnected"));
    -[SBExternalDisplayEducationSession _dismissBanner:](self, "_dismissBanner:", CFSTR("Display Disconnected"));
  }
}

- (void)_dismissEducationAlert:(id)a3
{
  id v4;
  NSXPCConnection *xpcConnection;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSXPCConnection *v9;
  void *v10;
  void *v11;
  SBSRemoteAlertHandle *alertHandle;
  int v13;
  void *v14;
  __int16 v15;
  id v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  xpcConnection = self->_xpcConnection;
  SBLogDisplayEducation();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if (xpcConnection)
  {
    if (v7)
    {
      _SBFLoggingMethodProem();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = self->_xpcConnection;
      v13 = 138543874;
      v14 = v8;
      v15 = 2114;
      v16 = v4;
      v17 = 2114;
      v18 = v9;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing alert for reason: %{public}@; via: xpcConnection (%{public}@)",
        (uint8_t *)&v13,
        0x20u);

    }
    -[NSXPCConnection remoteObjectProxy](self->_xpcConnection, "remoteObjectProxy");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dismissAnimated:", 1);

  }
  else
  {
    if (v7)
    {
      _SBFLoggingMethodProem();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      alertHandle = self->_alertHandle;
      v13 = 138543874;
      v14 = v11;
      v15 = 2114;
      v16 = v4;
      v17 = 2114;
      v18 = alertHandle;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ dismissing alert for reason: %{public}@; via: alertHandle (%{public}@)",
        (uint8_t *)&v13,
        0x20u);

    }
    -[SBSRemoteAlertHandle invalidate](self->_alertHandle, "invalidate");
  }

}

- (void)_presentEducationAlert:(id)a3
{
  id v5;
  NSXPCListener *v6;
  NSXPCListener *listener;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  SBSRemoteAlertHandle *v12;
  SBSRemoteAlertHandle *alertHandle;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  SEL v27;
  _QWORD v28[2];
  _QWORD v29[3];

  v29[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 294, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

  }
  if (self->_isPresenting)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 295, CFSTR("we can only show education banner / alert once per display connection session"));

  }
  self->_isPresenting = 1;
  objc_msgSend(MEMORY[0x1E0CB3B58], "anonymousListener");
  v6 = (NSXPCListener *)objc_claimAutoreleasedReturnValue();
  listener = self->_listener;
  self->_listener = v6;

  -[NSXPCListener setDelegate:](self->_listener, "setDelegate:", self);
  -[NSXPCListener activate](self->_listener, "activate");
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DAAF78]), "initWithServiceName:viewControllerClassName:", CFSTR("com.apple.SpringBoardEducation"), CFSTR("SBERemoteViewController"));
  objc_msgSend(v8, "setPrefersEmbeddedDisplayPresentation:", 1);
  v9 = objc_alloc_init(MEMORY[0x1E0DAAF70]);
  -[NSXPCListener endpoint](self->_listener, "endpoint");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_endpoint");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setXpcEndpoint:", v11);

  v12 = (SBSRemoteAlertHandle *)objc_msgSend(MEMORY[0x1E0DAAF88], "newHandleWithDefinition:configurationContext:", v8, v9);
  alertHandle = self->_alertHandle;
  self->_alertHandle = v12;

  v14 = objc_alloc_init(MEMORY[0x1E0DAAF58]);
  v29[0] = &unk_1E91D15E0;
  v28[0] = CFSTR("SBEducationRemoteViewControllerEducationTypeKey");
  v28[1] = CFSTR("SBEducationRemoteViewControllerHasPointerAndKeyboardConnectedKey");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", self->_isHardwareAvailableDuringDisplayConnectionWindow);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v29[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v29, v28, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setUserInfo:", v16);

  v17 = (void *)MEMORY[0x1E0D016A0];
  v25[0] = MEMORY[0x1E0C809B0];
  v25[1] = 3221225472;
  v25[2] = __60__SBExternalDisplayEducationSession__presentEducationAlert___block_invoke;
  v25[3] = &unk_1E8EB7598;
  v26 = v5;
  v27 = a2;
  v25[4] = self;
  v18 = v5;
  objc_msgSend(v17, "responderWithHandler:", v25);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setQueue:", MEMORY[0x1E0C80D38]);
  v20 = (void *)MEMORY[0x1E0C99E60];
  v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D01698]), "initWithInfo:responder:", 0, v19);
  objc_msgSend(v20, "setWithObject:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setActions:", v22);

  -[SBSRemoteAlertHandle activateWithContext:](self->_alertHandle, "activateWithContext:", v14);
}

void __60__SBExternalDisplayEducationSession__presentEducationAlert___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  int v8;
  int v9;
  NSObject *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  int v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "error");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    SBLogDisplayEducation();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      __60__SBExternalDisplayEducationSession__presentEducationAlert___block_invoke_cold_1(a1, (uint64_t)v4, v5);
  }
  else
  {
    objc_msgSend(v3, "info");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "flagForSetting:", 1);

    if (v7)
      v8 = 1;
    else
      v8 = 2;
    if (v7 == 0x7FFFFFFFFFFFFFFFLL)
      v9 = 0;
    else
      v9 = v8;
    SBLogDisplayEducation();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138543618;
      v17 = v11;
      v18 = 1024;
      v19 = v9;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ received response from user. externalDisplayEnabled: %{BOOL}u", (uint8_t *)&v16, 0x12u);

    }
    v12 = v7 == 0;

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "externalDisplayDefaults");
    v5 = objc_claimAutoreleasedReturnValue();

    +[SBDefaults localDefaults](SBDefaults, "localDefaults");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "appSwitcherDefaults");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setShouldUpdateExternalDisplayMirroringWhenWindowManagementStyleUpdates:", 0);

    -[NSObject setMirroringEnabled:](v5, "setMirroringEnabled:", v12);
  }

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)_presentBanner
{
  void *v4;
  void *v5;
  SBExternalDisplayEducationPillViewController *v6;
  SBExternalDisplayEducationPillViewController *educationBannerViewController;
  BNPosting *bannerPoster;
  SBExternalDisplayEducationPillViewController *v9;
  id v10;
  NSObject *v11;
  BSAbsoluteMachTimer *bannerDismissTimer;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _BYTE location[12];
  __int16 v20;
  id v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  if (self->_isPresenting)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBExternalDisplayEducationObserver.m"), 338, CFSTR("we can only show education banner / alert once per display connection session"));

  }
  self->_isPresenting = 1;
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "externalDisplayDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[SBExternalDisplayEducationPillViewController initWithExtendedDisplayEnabled:]([SBExternalDisplayEducationPillViewController alloc], "initWithExtendedDisplayEnabled:", objc_msgSend(v5, "isMirroringEnabled") ^ 1);
  educationBannerViewController = self->_educationBannerViewController;
  self->_educationBannerViewController = v6;

  -[SBExternalDisplayEducationPillViewController setDelegate:](self->_educationBannerViewController, "setDelegate:", self);
  bannerPoster = self->_bannerPoster;
  v9 = self->_educationBannerViewController;
  v18 = 0;
  -[BNPosting postPresentable:withOptions:userInfo:error:](bannerPoster, "postPresentable:withOptions:userInfo:error:", v9, 1, 0, &v18);
  v10 = v18;
  if (v10)
  {
    SBLogDisplayEducation();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      _SBFLoggingMethodProem();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)location = 138543618;
      *(_QWORD *)&location[4] = v14;
      v20 = 2114;
      v21 = v10;
      _os_log_error_impl(&dword_1D0540000, v11, OS_LOG_TYPE_ERROR, "%{public}@ error while presenting education banner: %{public}@", location, 0x16u);

    }
  }
  objc_initWeak((id *)location, self);
  bannerDismissTimer = self->_bannerDismissTimer;
  v13 = MEMORY[0x1E0C80D38];
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __51__SBExternalDisplayEducationSession__presentBanner__block_invoke;
  v16[3] = &unk_1E8E9EEC8;
  objc_copyWeak(&v17, (id *)location);
  -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](bannerDismissTimer, "scheduleWithFireInterval:leewayInterval:queue:handler:", MEMORY[0x1E0C80D38], v16, 3.0, 0.05);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)location);

}

void __51__SBExternalDisplayEducationSession__presentBanner__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_dismissBanner:", CFSTR("Timer"));

}

- (void)_dismissBanner:(id)a3
{
  BNPosting *bannerPoster;
  void *v5;
  id v6;
  id v7;

  v7 = a3;
  bannerPoster = self->_bannerPoster;
  objc_msgSend(MEMORY[0x1E0D010A0], "uniqueIdentificationForPresentable:", self->_educationBannerViewController);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)-[BNPosting revokePresentablesWithIdentification:reason:options:userInfo:error:](bannerPoster, "revokePresentablesWithIdentification:reason:options:userInfo:error:", v5, v7, 0, 0, 0);

}

- (void)pillViewControllerDidReceiveUserTap:(id)a3
{
  BSAbsoluteMachTimer *bannerDismissTimer;
  id v5;

  -[BSAbsoluteMachTimer invalidate](self->_bannerDismissTimer, "invalidate", a3);
  bannerDismissTimer = self->_bannerDismissTimer;
  self->_bannerDismissTimer = 0;

  -[SBExternalDisplayEducationSession _dismissBanner:](self, "_dismissBanner:", CFSTR("User Interaction"));
  objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("prefs:root=DISPLAY&path=DISPLAY_ARRANGEMENT"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  SBWorkspaceActivateApplicationFromURL(v5, 0, 0);

}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v7;
  char v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = -[BSAtomicSignal hasBeenSignalled](self->_displayDisconnectSignal, "hasBeenSignalled");
  if ((v8 & 1) != 0)
  {
    SBLogDisplayEducation();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[SBExternalDisplayEducationSession listener:shouldAcceptNewConnection:].cold.1((uint64_t)self, (uint64_t)a2, v9);
  }
  else
  {
    objc_msgSend(v7, "setExportedObject:", self);
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFDCCE28);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setExportedInterface:", v10);

    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFEB5080);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setRemoteObjectInterface:", v11);

    objc_msgSend(v7, "resume");
    objc_storeStrong((id *)&self->_xpcConnection, a4);
    SBLogDisplayEducation();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      _SBFLoggingMethodProem();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138543362;
      v15 = v12;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ client connected ", (uint8_t *)&v14, 0xCu);

    }
  }

  return v8 ^ 1;
}

- (FBSDisplayIdentity)displayIdentity
{
  return self->_displayIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bannerDismissTimer, 0);
  objc_storeStrong((id *)&self->_educationBannerViewController, 0);
  objc_storeStrong((id *)&self->_listener, 0);
  objc_storeStrong((id *)&self->_xpcConnection, 0);
  objc_storeStrong((id *)&self->_alertHandle, 0);
  objc_storeStrong((id *)&self->_bannerPoster, 0);
  objc_storeStrong((id *)&self->_displayDisconnectSignal, 0);
  objc_storeStrong((id *)&self->_displayIdentity, 0);
}

void __60__SBExternalDisplayEducationSession__presentEducationAlert___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v5;
  v8 = 2114;
  v9 = a2;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "%{public}@ received error back from education service: %{public}@", (uint8_t *)&v6, 0x16u);

}

- (void)listener:(NSObject *)a3 shouldAcceptNewConnection:.cold.1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  _SBFLoggingMethodProem();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_error_impl(&dword_1D0540000, a3, OS_LOG_TYPE_ERROR, "%{public}@ client connected but our display is already gone. we're talking to a ghost.", (uint8_t *)&v5, 0xCu);

}

@end
