@implementation SBSystemApertureContinuityDelayedUIWindowSceneDelegate

- (void)scene:(id)a3 willConnectToSession:(id)a4 options:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  int v12;
  int v13;
  int v14;
  NSString *debugName;
  __CFString *v16;
  NSObject *v17;
  NSString *v18;
  void *v19;
  id v20;
  UIWindowScene *v21;
  UIWindowScene *windowScene;
  UIWindowScene *v23;
  void *v24;
  BSInvalidatable *v25;
  void *v26;
  id v27;
  UIWindowScene *v28;
  UIWindowScene *v29;
  BSInvalidatable *continuitySessionManagerRegistration;
  void *v31;
  void *v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  NSString *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = SBFEffectiveArtworkSubtype();
  if (v10 <= 2795)
  {
    if (v10 != 2556 && v10 != 2622)
      goto LABEL_31;
LABEL_7:
    objc_msgSend(v9, "role");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = -[NSObject isEqualToString:](v11, "isEqualToString:", *MEMORY[0x1E0DAC9E0]);
    v13 = -[NSObject isEqualToString:](v11, "isEqualToString:", *MEMORY[0x1E0DAC9E8]);
    v14 = v13;
    if (v12)
    {
      debugName = self->_debugName;
      v16 = CFSTR("systemAperture");
    }
    else
    {
      if (!v13)
        goto LABEL_12;
      debugName = self->_debugName;
      v16 = CFSTR("systemApertureCurtain");
    }
    self->_debugName = &v16->isa;

LABEL_12:
    SBLogContinuityDisplay();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = self->_debugName;
      *(_DWORD *)buf = 134218242;
      v34 = v8;
      v35 = 2114;
      v36 = v18;
      _os_log_impl(&dword_1D0540000, v17, OS_LOG_TYPE_DEFAULT, "System Aperture Scene <%p>:%{public}@ willConnectToSession", buf, 0x16u);
    }

    if (v12)
    {
      v19 = (void *)objc_opt_class();
      v20 = v8;
      if (v19)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v20;
        else
          v19 = 0;
      }
      v21 = v19;

      if (!v21)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 65, CFSTR("systemApertureRole's scene is the wrong type %@"), objc_opt_class());

      }
      objc_storeStrong((id *)&self->_systemApertureContinuityWindowScene, v19);
      windowScene = self->_windowScene;
      self->_windowScene = v21;
      v23 = v21;

      +[SBContinuitySessionManager sharedInstance](SBContinuitySessionManager, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "registerSystemApertureWindowScene:", v23);
      v25 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v14)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 76, CFSTR("unexpected role for SBSystemApertureContinuityWindowSceneDelegate: %@"), v11);
        goto LABEL_34;
      }
      v26 = (void *)objc_opt_class();
      v27 = v8;
      if (v26)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v26 = v27;
        else
          v26 = 0;
      }
      v28 = v26;

      if (!v28)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 71, CFSTR("systemApertureCurtainRole's scene is the wrong type %@"), objc_opt_class());

      }
      objc_storeStrong((id *)&self->_systemApertureContinuityCurtainWindowScene, v26);
      v29 = self->_windowScene;
      self->_windowScene = v28;
      v23 = v28;

      +[SBContinuitySessionManager sharedInstance](SBContinuitySessionManager, "sharedInstance");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "registerSystemApertureCurtainWindowScene:", v23);
      v25 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    }
    continuitySessionManagerRegistration = self->_continuitySessionManagerRegistration;
    self->_continuitySessionManagerRegistration = v25;

LABEL_34:
    goto LABEL_35;
  }
  if (v10 == 2796 || v10 == 2868)
    goto LABEL_7;
LABEL_31:
  SBLogContinuityDisplay();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "Ignoring Jindo continuity scene on non-jindo phone, plz stop sending them to me 125755442", buf, 2u);
  }
LABEL_35:

}

- (void)sceneDidDisconnect:(id)a3
{
  id v4;
  NSObject *v5;
  NSString *debugName;
  BSInvalidatable *continuitySessionManagerRegistration;
  UIWindowScene *windowScene;
  SBSystemApertureContinuityWindowScene *systemApertureContinuityWindowScene;
  SBSystemApertureContinuityCurtainWindowScene *systemApertureContinuityCurtainWindowScene;
  int v11;
  id v12;
  __int16 v13;
  NSString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogContinuityDisplay();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    debugName = self->_debugName;
    v11 = 134218242;
    v12 = v4;
    v13 = 2114;
    v14 = debugName;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "System Aperture Scene <%p>:%{public}@ didDisconnect", (uint8_t *)&v11, 0x16u);
  }

  -[BSInvalidatable invalidate](self->_continuitySessionManagerRegistration, "invalidate");
  continuitySessionManagerRegistration = self->_continuitySessionManagerRegistration;
  self->_continuitySessionManagerRegistration = 0;

  -[SBSystemApertureContinuityDelayedUIWindowSceneDelegate _tearDownUIAndInvalidateIfNecessaryForReason:](self, "_tearDownUIAndInvalidateIfNecessaryForReason:", CFSTR("scene disconnected"));
  windowScene = self->_windowScene;
  self->_windowScene = 0;

  systemApertureContinuityWindowScene = self->_systemApertureContinuityWindowScene;
  self->_systemApertureContinuityWindowScene = 0;

  systemApertureContinuityCurtainWindowScene = self->_systemApertureContinuityCurtainWindowScene;
  self->_systemApertureContinuityCurtainWindowScene = 0;

}

- (SBContinuitySession)connectedSession
{
  return self->_continuitySession;
}

- (void)didConnectToSession:(id)a3
{
  id v6;
  NSObject *v7;
  UIWindowScene *windowScene;
  NSString *debugName;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  UIWindowScene *v18;
  __int16 v19;
  NSString *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (self->_continuitySession)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 101, CFSTR("Already have a session!!"));

  }
  SBLogContinuityDisplay();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    windowScene = self->_windowScene;
    debugName = self->_debugName;
    v17 = 134218754;
    v18 = windowScene;
    v19 = 2114;
    v20 = debugName;
    v21 = 2048;
    v22 = v6;
    v23 = 2112;
    v24 = v6;
    _os_log_impl(&dword_1D0540000, v7, OS_LOG_TYPE_DEFAULT, "System aperture scene <%p>:%{public}@ connected to session: <%p>:%@", (uint8_t *)&v17, 0x2Au);
  }

  objc_storeStrong((id *)&self->_continuitySession, a3);
  objc_msgSend(v6, "addStateObserver:", self);
  -[UIWindowScene _FBSScene](self->_windowScene, "_FBSScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "continuitySessionParticipantClientComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 109, CFSTR("No SBUIContinuitySessionPartipantClientComponent"));

  }
  objc_msgSend(v11, "setContinuitySession:", v6);
  -[UIWindowScene _FBSScene](self->_windowScene, "_FBSScene");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "continuityHostProxyClientComponent");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 113, CFSTR("No SBContinuityHostProxyClientComponent"));

  }
  objc_msgSend(v6, "addScreenRecordingObserver:", v13);
  objc_msgSend(v13, "continuitySessionDidUpdateScreenRecordingState:", v6);
  -[SBSystemApertureContinuityDelayedUIWindowSceneDelegate continuitySessionDidUpdateState:](self, "continuitySessionDidUpdateState:", v6);

}

- (void)continuitySessionDidUpdateState:(id)a3
{
  SBContinuitySession *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  SEL v9;
  SBSystemApertureContinuityDelayedUIWindowSceneDelegate *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;

  v5 = (SBContinuitySession *)a3;
  if (self->_continuitySession != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 126, CFSTR("System aperture scene <%p>:%@ state update for session <%p> is not the one i'm tracking <%p>"), self->_windowScene, self->_debugName, v5, self->_continuitySession);

  }
  switch(-[SBContinuitySession state](v5, "state"))
  {
    case 1uLL:
      if (self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("State is blocked but we already created UI");
        v9 = a2;
        v10 = self;
        v11 = 133;
        goto LABEL_26;
      }
      goto LABEL_36;
    case 2uLL:
      if (self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("State is preparingForRemoteUnlock but we already created UI");
        v9 = a2;
        v10 = self;
        v11 = 136;
        goto LABEL_26;
      }
      goto LABEL_36;
    case 3uLL:
      if (self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("State is waitingForRemoteUnlock but we already created UI");
        v9 = a2;
        v10 = self;
        v11 = 139;
        goto LABEL_26;
      }
      goto LABEL_36;
    case 4uLL:
      if (self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("State is waitingForScenes but we already created UI");
        v9 = a2;
        v10 = self;
        v11 = 142;
        goto LABEL_26;
      }
      goto LABEL_36;
    case 5uLL:
      if (self->_initializedUI)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        v7 = v6;
        v8 = CFSTR("State is waitingForHIDServices but we already created UI");
        v9 = a2;
        v10 = self;
        v11 = 145;
        goto LABEL_26;
      }
      goto LABEL_36;
    case 6uLL:
      -[SBContinuitySession reasons](v5, "reasons");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v12;
      if (self->_systemApertureContinuityWindowScene)
      {
        if (objc_msgSend(v12, "containsObject:", CFSTR("checkpoint.waiting-for-ui-ready")))
        {
          SBLogContinuitySession();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[SBSystemApertureContinuityDelayedUIWindowSceneDelegate continuitySessionDidUpdateState:].cold.2();
LABEL_32:

          goto LABEL_35;
        }
LABEL_33:
        -[SBSystemApertureContinuityDelayedUIWindowSceneDelegate _initializeUIIfNecessaryForReason:](self, "_initializeUIIfNecessaryForReason:", CFSTR("session state .activating"));
        goto LABEL_35;
      }
      if (self->_systemApertureContinuityCurtainWindowScene)
      {
        if (objc_msgSend(v12, "containsObject:", CFSTR("checkpoint.waiting-for-system-aperture-ui-ready")))
        {
          SBLogContinuitySession();
          v13 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
            -[SBSystemApertureContinuityDelayedUIWindowSceneDelegate continuitySessionDidUpdateState:].cold.1();
          goto LABEL_32;
        }
        goto LABEL_33;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 169, CFSTR("What kind of system aperture scene is this??"));

LABEL_35:
LABEL_36:

      return;
    case 7uLL:
      if (self->_initializedUI)
        goto LABEL_36;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("State moved to launching but we haven't initialized the UI yet");
      v9 = a2;
      v10 = self;
      v11 = 175;
      goto LABEL_26;
    case 8uLL:
      if (self->_initializedUI)
        goto LABEL_36;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("State moved to launching but we haven't initialized the UI yet");
      v9 = a2;
      v10 = self;
      v11 = 178;
      goto LABEL_26;
    case 9uLL:
      if (self->_initializedUI)
        goto LABEL_36;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("State moved to flushing but we haven't initialized the UI yet");
      v9 = a2;
      v10 = self;
      v11 = 181;
      goto LABEL_26;
    case 10uLL:
      if (self->_initializedUI)
        goto LABEL_36;
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      v8 = CFSTR("State moved to active but we haven't initialized the UI yet");
      v9 = a2;
      v10 = self;
      v11 = 184;
LABEL_26:
      objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", v9, v10, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), v11, v8);
      goto LABEL_35;
    case 11uLL:
      -[SBSystemApertureContinuityDelayedUIWindowSceneDelegate _tearDownUIAndInvalidateIfNecessaryForReason:](self, "_tearDownUIAndInvalidateIfNecessaryForReason:", CFSTR("session state is .invalid"));
      goto LABEL_36;
    default:
      goto LABEL_36;
  }
}

- (void)_initializeUIIfNecessaryForReason:(id)a3
{
  __CFString *v5;
  NSObject *v6;
  UIWindowScene *windowScene;
  NSString *debugName;
  NSObject *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSObject *v27;
  NSString *v28;
  void *v29;
  SBSystemApertureContinuityWindowScene *systemApertureContinuityWindowScene;
  UIWindowScene *v31;
  NSString *v32;
  SBContinuitySession *continuitySession;
  __CFString *v34;
  SBSystemApertureContinuityCurtainWindowScene *systemApertureContinuityCurtainWindowScene;
  void *v36;
  void *v37;
  void *v38;
  uint8_t buf[4];
  UIWindowScene *v40;
  __int16 v41;
  NSString *v42;
  __int16 v43;
  __CFString *v44;
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v5 = (__CFString *)a3;
  SBLogContinuitySession();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    windowScene = self->_windowScene;
    debugName = self->_debugName;
    *(_DWORD *)buf = 134218498;
    v40 = windowScene;
    v41 = 2114;
    v42 = debugName;
    v43 = 2114;
    v44 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "System aperture scene <%p>:%{public}@ initializing UI if necessary - %{public}@", buf, 0x20u);
  }

  if (self->_initializedUI)
  {
    SBLogContinuitySession();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "--> already initialized UI", buf, 2u);
    }
  }
  else
  {
    v10 = -[SBContinuitySession state](self->_continuitySession, "state");
    SBLogContinuitySession();
    v11 = objc_claimAutoreleasedReturnValue();
    v9 = v11;
    if (v10 == 6)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        -[SBSystemApertureContinuityDelayedUIWindowSceneDelegate _initializeUIIfNecessaryForReason:].cold.2(v9, v12, v13, v14, v15, v16, v17, v18);

      SBLogContinuitySession();
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        -[SBSystemApertureContinuityDelayedUIWindowSceneDelegate _initializeUIIfNecessaryForReason:].cold.1(v19, v20, v21, v22, v23, v24, v25, v26);

      -[SBContinuitySession mainWindowScene](self->_continuitySession, "mainWindowScene");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 209, CFSTR("We don't have an main window scene for the session: %@"), self->_continuitySession);

      }
      SBLogContinuitySession();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        -[NSObject _sceneIdentifier](v9, "_sceneIdentifier");
        v28 = (NSString *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v40 = (UIWindowScene *)v9;
        v41 = 2114;
        v42 = v28;
        _os_log_impl(&dword_1D0540000, v27, OS_LOG_TYPE_DEFAULT, "--> associated main window scene is <%p>:%{public}@", buf, 0x16u);

      }
      -[NSObject systemApertureController](v9, "systemApertureController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v29)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 213, CFSTR("Couldn't find the system aperture controller for the continuity display's main scene <%p>"), v9);

      }
      systemApertureContinuityWindowScene = self->_systemApertureContinuityWindowScene;
      if (systemApertureContinuityWindowScene)
      {
        -[SBAccessoryWindowScene setAssociatedWindowScene:](systemApertureContinuityWindowScene, "setAssociatedWindowScene:", v9);
        objc_msgSend(v29, "highLevelContinuitySystemApertureWindowSceneDidConnect:", self->_systemApertureContinuityWindowScene);
        -[SBContinuitySession noteSystemApertureUIIsReady:](self->_continuitySession, "noteSystemApertureUIIsReady:", self->_systemApertureContinuityWindowScene);
      }
      else
      {
        systemApertureContinuityCurtainWindowScene = self->_systemApertureContinuityCurtainWindowScene;
        if (systemApertureContinuityCurtainWindowScene)
        {
          -[SBAccessoryWindowScene setAssociatedWindowScene:](systemApertureContinuityCurtainWindowScene, "setAssociatedWindowScene:", v9);
          objc_msgSend(v29, "superHighLevelContinuityCurtainWindowSceneDidConnect:", self->_systemApertureContinuityCurtainWindowScene);
          -[SBContinuitySession noteSystemApertureCurtainUIIsReady:](self->_continuitySession, "noteSystemApertureCurtainUIIsReady:", self->_systemApertureContinuityCurtainWindowScene);
        }
        else
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 225, CFSTR("What kind of system aperture scene is this??"));

        }
      }
      self->_initializedUI = 1;

    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v31 = self->_windowScene;
      v32 = self->_debugName;
      continuitySession = self->_continuitySession;
      if (continuitySession)
      {
        NSStringFromSBContinuitySessionState(v10);
        v34 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v34 = CFSTR(".unknown because we don't have a session yet!");
      }
      *(_DWORD *)buf = 134218498;
      v40 = v31;
      v41 = 2114;
      v42 = v32;
      v43 = 2114;
      v44 = v34;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "<%p>:%{public}@ refuses to initialize UI because the session state is %{public}@", buf, 0x20u);
      if (continuitySession)

    }
  }

}

- (void)_tearDownUIAndInvalidateIfNecessaryForReason:(id)a3
{
  id v5;
  NSObject *v6;
  UIWindowScene *windowScene;
  NSString *debugName;
  NSObject *v9;
  void *v10;
  SBContinuitySession *continuitySession;
  _BOOL4 initializedUI;
  NSObject *v13;
  _BOOL4 v14;
  SBSystemApertureContinuityWindowScene *systemApertureContinuityWindowScene;
  uint64_t v16;
  void *v17;
  void *v18;
  SBSystemApertureContinuityCurtainWindowScene *systemApertureContinuityCurtainWindowScene;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint8_t buf[4];
  UIWindowScene *v27;
  __int16 v28;
  NSString *v29;
  __int16 v30;
  id v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  SBLogContinuitySession();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    windowScene = self->_windowScene;
    debugName = self->_debugName;
    *(_DWORD *)buf = 134218498;
    v27 = windowScene;
    v28 = 2114;
    v29 = debugName;
    v30 = 2114;
    v31 = v5;
    _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "System aperture scene <%p>:%{public}@ tear down UI and invalidate if necessary - %{public}@", buf, 0x20u);
  }

  if (!self->_invalidated)
  {
    -[UIWindowScene _FBSScene](self->_windowScene, "_FBSScene");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "continuityHostProxyClientComponent");
    v9 = objc_claimAutoreleasedReturnValue();

    if (!v9)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 243, CFSTR("No SBContinuityHostProxyClientComponent"));

    }
    -[SBContinuitySession removeScreenRecordingObserver:](self->_continuitySession, "removeScreenRecordingObserver:", v9);
    -[SBContinuitySession removeStateObserver:](self->_continuitySession, "removeStateObserver:", self);
    continuitySession = self->_continuitySession;
    self->_continuitySession = 0;

    initializedUI = self->_initializedUI;
    SBLogContinuitySession();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT);
    if (!initializedUI)
    {
      if (v14)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "--> never initialized UI", buf, 2u);
      }
      goto LABEL_22;
    }
    if (v14)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "--> tearing down UI now...", buf, 2u);
    }

    systemApertureContinuityWindowScene = self->_systemApertureContinuityWindowScene;
    if (systemApertureContinuityWindowScene)
    {
      -[SBAccessoryWindowScene associatedWindowScene](systemApertureContinuityWindowScene, "associatedWindowScene");
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject systemApertureController](v13, "systemApertureController");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      if (v13)
      {
        if (v16)
        {
LABEL_14:
          objc_msgSend(v17, "highLevelContinuitySystemApertureWindowSceneDidDisconnect:", self->_systemApertureContinuityWindowScene);
          v18 = self->_systemApertureContinuityWindowScene;
          self->_systemApertureContinuityWindowScene = 0;
LABEL_21:

LABEL_22:
          self->_invalidated = 1;
          goto LABEL_23;
        }
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 265, CFSTR("Could not find associated scene for systemApertureScene <%p>:%@"), self->_windowScene, self->_debugName);

        if (v17)
          goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 266, CFSTR("Could not find systemApertureController for associatedScene <%p>:%@"), self->_windowScene, self->_debugName);

      goto LABEL_14;
    }
    systemApertureContinuityCurtainWindowScene = self->_systemApertureContinuityCurtainWindowScene;
    if (!systemApertureContinuityCurtainWindowScene)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = objc_claimAutoreleasedReturnValue();
      -[NSObject handleFailureInMethod:object:file:lineNumber:description:](v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 279, CFSTR("What kind of system aperture scene is this??"));
      goto LABEL_22;
    }
    -[SBAccessoryWindowScene associatedWindowScene](systemApertureContinuityCurtainWindowScene, "associatedWindowScene");
    v13 = objc_claimAutoreleasedReturnValue();
    -[NSObject systemApertureController](v13, "systemApertureController");
    v20 = objc_claimAutoreleasedReturnValue();
    v17 = (void *)v20;
    if (v13)
    {
      if (v20)
      {
LABEL_20:
        objc_msgSend(v17, "superHighLevelContinuityCurtainWindowSceneDidDisconnect:", self->_systemApertureContinuityCurtainWindowScene);
        v18 = self->_systemApertureContinuityCurtainWindowScene;
        self->_systemApertureContinuityCurtainWindowScene = 0;
        goto LABEL_21;
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 273, CFSTR("Could not find associated scene for systemApertureScene <%p>:%@"), self->_windowScene, self->_debugName);

      if (v17)
        goto LABEL_20;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBSystemApertureContinuityDelayedUIWindowSceneDelegate.m"), 274, CFSTR("Could not find systemApertureController for associatedScene <%p>:%@"), self->_windowScene, self->_debugName);

    goto LABEL_20;
  }
  SBLogContinuitySession();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "--> already invalidated", buf, 2u);
  }
LABEL_23:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugName, 0);
  objc_storeStrong((id *)&self->_continuitySessionManagerRegistration, 0);
  objc_storeStrong((id *)&self->_continuitySession, 0);
  objc_storeStrong((id *)&self->_windowScene, 0);
  objc_storeStrong((id *)&self->_systemApertureContinuityCurtainWindowScene, 0);
  objc_storeStrong((id *)&self->_systemApertureContinuityWindowScene, 0);
}

- (void)continuitySessionDidUpdateState:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_5_1(&dword_1D0540000, v0, v1, "<%p>:%{public}@ waiting on system aperture scene UI to be ready before initializing", v2, v3, v4, v5, v6);
}

- (void)continuitySessionDidUpdateState:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_12();
  OUTLINED_FUNCTION_5_1(&dword_1D0540000, v0, v1, "<%p>:%{public}@ waiting on main scene UI to be ready before initializing", v2, v3, v4, v5, v6);
}

- (void)_initializeUIIfNecessaryForReason:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "--> initializing UI !!!", a5, a6, a7, a8, 0);
}

- (void)_initializeUIIfNecessaryForReason:(uint64_t)a3 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_1D0540000, a1, a3, "--> state is .activating", a5, a6, a7, a8, 0);
}

@end
