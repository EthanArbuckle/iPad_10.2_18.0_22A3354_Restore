@implementation SBCaptureApplicationLaunchMonitor

- (SBCaptureApplicationLaunchMonitor)initWithScene:(id)a3 delegate:(id)a4
{
  id v7;
  id v8;
  SBCaptureApplicationLaunchMonitor *v9;
  id v10;
  void *v11;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_class *v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  objc_super v23;

  v7 = a3;
  v8 = a4;
  v23.receiver = self;
  v23.super_class = (Class)SBCaptureApplicationLaunchMonitor;
  v9 = -[SBCaptureApplicationLaunchMonitor init](&v23, sel_init);
  if (v9)
  {
    v10 = v7;
    if (v10)
    {
      v11 = v10;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v17 = (void *)MEMORY[0x1E0CB3940];
        v18 = (objc_class *)objc_msgSend(v11, "classForCoder");
        if (!v18)
          v18 = (objc_class *)objc_opt_class();
        NSStringFromClass(v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "stringWithFormat:", CFSTR("Value for '%@' was of unexpected class %@. Expected %@."), CFSTR("scene"), v19, v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
          -[SBCaptureApplicationLaunchMonitor initWithScene:delegate:].cold.1();
        objc_msgSend(objc_retainAutorelease(v22), "UTF8String");
        _bs_set_crash_log_message();
        __break(0);
        JUMPOUT(0x1D0832140);
      }

      if (v8)
      {
        objc_storeStrong((id *)&v9->_scene, a3);
        objc_storeWeak((id *)&v9->_delegate, v8);
        goto LABEL_6;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("delegate != ((void *)0)"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBCaptureApplicationLaunchMonitor initWithScene:delegate:].cold.2();
    }
    else
    {
      v13 = (void *)MEMORY[0x1E0CB3940];
      v14 = (objc_class *)objc_opt_class();
      NSStringFromClass(v14);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringWithFormat:", CFSTR("Value for '%@' was unexpectedly nil. Expected %@."), CFSTR("scene"), v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        -[SBCaptureApplicationLaunchMonitor initWithScene:delegate:].cold.1();
    }
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1D0832098);
  }
LABEL_6:

  return v9;
}

- (void)invalidate
{
  FBScene *scene;

  if (self->_scene)
  {
    -[SBCaptureApplicationLaunchMonitor cancel](self, "cancel");
    scene = self->_scene;
    self->_scene = 0;

    objc_storeWeak((id *)&self->_delegate, 0);
  }
}

- (void)cancel
{
  NSObject *v3;
  void *v4;
  void *v5;
  FBScene *v6;
  BSAbsoluteMachTimer *monitorTimer;
  BSAbsoluteMachTimer *v8;
  SBCameraViewfinderMonitoring *viewfinderMonitoringToken;
  SBCameraViewfinderMonitoring *v10;
  int v11;
  SBCaptureApplicationLaunchMonitor *v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  SBLogCaptureApplication();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[FBScene clientHandle](self->_scene, "clientHandle");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 134218242;
    v12 = self;
    v13 = 2114;
    v14 = v5;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "CALM %p stop observing %{public}@", (uint8_t *)&v11, 0x16u);

  }
  v6 = self->_scene;
  -[FBScene removeObserver:](v6, "removeObserver:", self);
  monitorTimer = self->_monitorTimer;
  if (monitorTimer)
  {
    -[BSAbsoluteMachTimer invalidate](monitorTimer, "invalidate");
    v8 = self->_monitorTimer;
    self->_monitorTimer = 0;

  }
  viewfinderMonitoringToken = self->_viewfinderMonitoringToken;
  if (viewfinderMonitoringToken)
  {
    -[SBCameraViewfinderMonitoring cancel](viewfinderMonitoringToken, "cancel");
    v10 = self->_viewfinderMonitoringToken;
    self->_viewfinderMonitoringToken = 0;

  }
  *(_WORD *)&self->_isCameraInUse = 0;
  *(_DWORD *)&self->_launchRequirementsPublished = 0;

}

- (void)dealloc
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)start
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (BOOL)_updateSceneReadyStatusForReason:(id)a3
{
  id v4;
  FBScene *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  _BOOL4 v14;
  BOOL v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  int v21;
  SBCaptureApplicationLaunchMonitor *v22;
  __int16 v23;
  id v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  _BOOL4 v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_scene;
  v6 = -[FBScene contentState](v5, "contentState");
  -[FBScene settings](v5, "settings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_opt_class();
  v9 = v7;
  if (v8)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v10 = v9;
    else
      v10 = 0;
  }
  else
  {
    v10 = 0;
  }
  v11 = v10;

  v12 = objc_msgSend(v11, "deactivationReasons");
  v14 = v6 == 2 && v12 == 0;
  if (self->_sceneIsReadyForWatchdogging == v14 && self->_firstReadyStatusUpdateComplete)
  {
    v15 = 0;
  }
  else
  {
    self->_firstReadyStatusUpdateComplete = 1;
    self->_sceneIsReadyForWatchdogging = v14;
    SBLogCaptureApplication();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      -[FBScene clientHandle](v5, "clientHandle");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "bundleIdentifier");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromFBSceneContentState();
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = 134219266;
      v22 = self;
      v23 = 2112;
      v24 = v4;
      v25 = 2114;
      v26 = v18;
      v27 = 1024;
      v28 = v14;
      v29 = 2114;
      v30 = v19;
      v31 = 2048;
      v32 = v12;
      _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "CALM %p updateSceneReadyStatus(%@) %{public}@ active:%{BOOL}u contentState:%{public}@ deactivationReasons:%lX", (uint8_t *)&v21, 0x3Au);

    }
    v15 = 1;
  }

  return v15;
}

- (BOOL)_isCaptureApplicationLaunchMonitorIgnored
{
  void *v2;
  void *v3;
  char v4;

  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "captureApplicationDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "ignoreCaptureApplicationLaunchMonitor");

  return v4;
}

- (BOOL)_isViewfinderSessionAuditTokenMatching:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t v12;

  v4 = a3;
  -[FBScene clientHandle](self->_scene, "clientHandle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "processHandle");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = (void *)MEMORY[0x1E0D016E0];
    objc_msgSend(v6, "auditToken");
    objc_msgSend(v8, "tokenFromAuditToken:", &v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isEqual:", v4);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (void)_checkForButtonConfiguration:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "clientSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "physicalButtonConfigurations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        if (!objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "_behavior", (_QWORD)v11))
        {
          self->_hasCameraCaptureButtonConfiguration = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v8)
        continue;
      break;
    }
  }
LABEL_11:

}

+ (id)TCCServer
{
  if (TCCServer_onceToken != -1)
    dispatch_once(&TCCServer_onceToken, &__block_literal_global_98);
  return (id)TCCServer_tccServer;
}

void __46__SBCaptureApplicationLaunchMonitor_TCCServer__block_invoke()
{
  uint64_t v0;
  void *v1;
  dispatch_queue_t v2;

  v2 = dispatch_queue_create("com.apple.springboard.capture.tccserver", 0);
  v0 = tcc_server_create();
  v1 = (void *)TCCServer_tccServer;
  TCCServer_tccServer = v0;

}

- (void)_checkForTCCAccess
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;

  -[FBScene clientHandle](self->_scene, "clientHandle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "processHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v13 = 0u;
    v14 = 0u;
    objc_msgSend(v4, "auditToken");
    tcc_service_singleton_for_CF_name();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)tcc_credential_create_for_process_with_audit_token();
    v8 = (void *)tcc_message_options_create();
    tcc_message_options_set_reply_handler_policy();
    tcc_message_options_set_request_prompt_policy();
    v10 = 0;
    v11 = &v10;
    v12 = 0x2020000000uLL;
    objc_msgSend((id)objc_opt_class(), "TCCServer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    tcc_server_message_request_authorization();

    self->_hasTCCAccess = v11[3] == 2;
    _Block_object_dispose(&v10, 8);

  }
}

uint64_t __55__SBCaptureApplicationLaunchMonitor__checkForTCCAccess__block_invoke(uint64_t result, uint64_t a2, uint64_t a3)
{
  uint64_t v3;

  if (a2)
  {
    if (!a3)
    {
      v3 = result;
      result = tcc_authorization_record_get_authorization_right();
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(v3 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

- (void)_checkForCameraInUse
{
  void *v3;
  _BOOL4 v4;

  -[SBCameraViewfinderMonitoring auditTokenForProcessWithActiveOrImminentViewfinderSession](self->_viewfinderMonitoringToken, "auditTokenForProcessWithActiveOrImminentViewfinderSession");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[SBCaptureApplicationLaunchMonitor _isViewfinderSessionAuditTokenMatching:](self, "_isViewfinderSessionAuditTokenMatching:", v3);

  if (v4)
    self->_isCameraInUse = 1;
}

- (BOOL)_hasCaptureApplicationRequirements
{
  return self->_hasTCCAccess && self->_isCameraInUse && self->_hasCameraCaptureButtonConfiguration;
}

- (id)_unmetReason
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (!self->_hasTCCAccess)
    objc_msgSend(v3, "addObject:", CFSTR("Camera usage not authorized"));
  if (!self->_isCameraInUse)
    objc_msgSend(v4, "addObject:", CFSTR("Camera not actively used"));
  if (!self->_hasCameraCaptureButtonConfiguration)
    objc_msgSend(v4, "addObject:", CFSTR("AVCaptureEventInteraction not installed"));
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR("; "));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_checkAllRequirementsForScene:(id)a3
{
  -[SBCaptureApplicationLaunchMonitor _checkForButtonConfiguration:](self, "_checkForButtonConfiguration:", a3);
  -[SBCaptureApplicationLaunchMonitor _checkForTCCAccess](self, "_checkForTCCAccess");
  -[SBCaptureApplicationLaunchMonitor _checkForCameraInUse](self, "_checkForCameraInUse");
}

- (void)_publishLaunchRequirementsIfNeededForScene:(id)a3 forced:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  _BOOL4 v7;
  _BOOL4 v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  _BOOL4 hasTCCAccess;
  _BOOL4 isCameraInUse;
  _BOOL4 hasCameraCaptureButtonConfiguration;
  SBCameraViewfinderMonitoring *viewfinderMonitoringToken;
  SBCameraViewfinderMonitoring *v17;
  id WeakRetained;
  void *v19;
  int v20;
  void *v21;
  __int16 v22;
  int v23;
  __int16 v24;
  _BOOL4 v25;
  __int16 v26;
  _BOOL4 v27;
  __int16 v28;
  _BOOL4 v29;
  __int16 v30;
  _BOOL4 v31;
  uint64_t v32;

  v4 = a4;
  v32 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (!self->_launchRequirementsPublished)
  {
    -[SBCaptureApplicationLaunchMonitor _checkAllRequirementsForScene:](self, "_checkAllRequirementsForScene:", v6);
    v7 = -[SBCaptureApplicationLaunchMonitor _hasCaptureApplicationRequirements](self, "_hasCaptureApplicationRequirements");
    v8 = -[SBCaptureApplicationLaunchMonitor _isCaptureApplicationLaunchMonitorIgnored](self, "_isCaptureApplicationLaunchMonitorIgnored");
    v9 = v8 | v7;
    SBLogCaptureApplication();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v6, "clientHandle");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      hasTCCAccess = self->_hasTCCAccess;
      isCameraInUse = self->_isCameraInUse;
      hasCameraCaptureButtonConfiguration = self->_hasCameraCaptureButtonConfiguration;
      v20 = 138413570;
      v21 = v12;
      v22 = 1024;
      v23 = v9;
      v24 = 1024;
      v25 = v8;
      v26 = 1024;
      v27 = hasTCCAccess;
      v28 = 1024;
      v29 = isCameraInUse;
      v30 = 1024;
      v31 = hasCameraCaptureButtonConfiguration;
      _os_log_impl(&dword_1D0540000, v10, OS_LOG_TYPE_DEFAULT, "Capture Application - %@ -: Launch monitor result: hasMetLaunchRequirements: %{BOOL}u, isCaptureApplicationLaunchMonitorIgnored: %{BOOL}u, hasTCCAccess: %{BOOL}u, isCameraInUse: %{BOOL}u, hasCameraCaptureButtonConfiguration: %{BOOL}u", (uint8_t *)&v20, 0x2Au);

    }
    if ((v4 | v9) == 1)
    {
      viewfinderMonitoringToken = self->_viewfinderMonitoringToken;
      if (viewfinderMonitoringToken)
      {
        -[SBCameraViewfinderMonitoring cancel](viewfinderMonitoringToken, "cancel");
        v17 = self->_viewfinderMonitoringToken;
        self->_viewfinderMonitoringToken = 0;

      }
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        if ((_DWORD)v9)
        {
          objc_msgSend(WeakRetained, "captureApplicationMonitor:hasMetLaunchRequirements:unmetReason:", self, 1, 0);
        }
        else
        {
          -[SBCaptureApplicationLaunchMonitor _unmetReason](self, "_unmetReason");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "captureApplicationMonitor:hasMetLaunchRequirements:unmetReason:", self, 0, v19);

        }
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) == 0)
        {
LABEL_14:

          goto LABEL_15;
        }
        objc_msgSend(WeakRetained, "captureApplicationMonitor:hasMetLaunchRequirements:", self, v9);
      }
      self->_launchRequirementsPublished = 1;
      goto LABEL_14;
    }
  }
LABEL_15:

}

- (void)_startMonitorTimer
{
  id v3;
  void *v4;
  BSAbsoluteMachTimer *v5;
  BSAbsoluteMachTimer *monitorTimer;
  BSAbsoluteMachTimer *v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id location;

  if (self->_scene && !self->_launchRequirementsPublished && !self->_monitorTimer)
  {
    v3 = objc_alloc(MEMORY[0x1E0D01690]);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBFCaptureApplicationLaunchMonitor.monitorTimer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (BSAbsoluteMachTimer *)objc_msgSend(v3, "initWithIdentifier:", v4);
    monitorTimer = self->_monitorTimer;
    self->_monitorTimer = v5;

    objc_initWeak(&location, self);
    v7 = self->_monitorTimer;
    +[SBCaptureApplicationCenter captureApplicationSettings](SBCaptureApplicationCenter, "captureApplicationSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "launchMonitorDurationInSeconds");
    v10 = v9;
    v11 = MEMORY[0x1E0C80D38];
    v12 = MEMORY[0x1E0C80D38];
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __55__SBCaptureApplicationLaunchMonitor__startMonitorTimer__block_invoke;
    v13[3] = &unk_1E8E9EEC8;
    objc_copyWeak(&v14, &location);
    -[BSAbsoluteMachTimer scheduleWithFireInterval:leewayInterval:queue:handler:](v7, "scheduleWithFireInterval:leewayInterval:queue:handler:", v11, v13, v10, 0.05);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

void __55__SBCaptureApplicationLaunchMonitor__startMonitorTimer__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "scene");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "_publishLaunchRequirementsIfNeededForScene:forced:", v1, 1);

}

- (void)sceneContentStateDidChange:(id)a3
{
  FBScene *v5;
  FBScene *v6;
  void *v7;
  _QWORD block[5];
  FBScene *v9;

  v5 = (FBScene *)a3;
  if (self->_scene != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBCaptureApplicationLaunchMonitor.m"), 279, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("scene == _scene"));

  }
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __64__SBCaptureApplicationLaunchMonitor_sceneContentStateDidChange___block_invoke;
  block[3] = &unk_1E8E9E820;
  block[4] = self;
  v9 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

_QWORD *__64__SBCaptureApplicationLaunchMonitor_sceneContentStateDidChange___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (result[3])
  {
    result = (_QWORD *)objc_msgSend(result, "_updateSceneReadyStatusForReason:", CFSTR("sceneContentStateDidChange"));
    if ((_DWORD)result)
    {
      objc_msgSend(*(id *)(a1 + 32), "_publishLaunchRequirementsIfNeededForScene:forced:", *(_QWORD *)(a1 + 40), 0);
      return (_QWORD *)objc_msgSend(*(id *)(a1 + 32), "_startMonitorTimer");
    }
  }
  return result;
}

- (void)sceneDidInvalidate:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCaptureApplication();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v4, "clientHandle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bundleIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412290;
    v9 = v7;
    _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Capture Application - %@ - Launch Monitor state: Scene did invalidate", (uint8_t *)&v8, 0xCu);

  }
  -[SBCaptureApplicationLaunchMonitor invalidate](self, "invalidate");

}

- (void)scene:(id)a3 didUpdateSettings:(id)a4
{
  id v5;

  v5 = a3;
  if (-[SBCaptureApplicationLaunchMonitor _updateSceneReadyStatusForReason:](self, "_updateSceneReadyStatusForReason:", CFSTR("didUpdateSettings")))
  {
    -[SBCaptureApplicationLaunchMonitor _publishLaunchRequirementsIfNeededForScene:forced:](self, "_publishLaunchRequirementsIfNeededForScene:forced:", v5, 0);
    -[SBCaptureApplicationLaunchMonitor _startMonitorTimer](self, "_startMonitorTimer");
  }

}

- (void)scene:(id)a3 didUpdateClientSettings:(id)a4
{
  id v5;

  v5 = a3;
  if (-[SBCaptureApplicationLaunchMonitor _updateSceneReadyStatusForReason:](self, "_updateSceneReadyStatusForReason:", CFSTR("didUpdateClientSettings")))
  {
    -[SBCaptureApplicationLaunchMonitor _publishLaunchRequirementsIfNeededForScene:forced:](self, "_publishLaunchRequirementsIfNeededForScene:forced:", v5, 0);
    -[SBCaptureApplicationLaunchMonitor _startMonitorTimer](self, "_startMonitorTimer");
  }

}

- (void)_cameraViewfinderMonitorSessionDetected:(id)a3 auditToken:(id)a4
{
  id v5;

  -[SBCaptureApplicationLaunchMonitor _checkForCameraInUse](self, "_checkForCameraInUse", a3, a4);
  if (self->_isCameraInUse)
  {
    -[SBCaptureApplicationLaunchMonitor scene](self, "scene");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    -[SBCaptureApplicationLaunchMonitor _publishLaunchRequirementsIfNeededForScene:forced:](self, "_publishLaunchRequirementsIfNeededForScene:forced:", v5, 0);

  }
}

- (void)cameraViewfinderMonitorSessionWillBegin:(id)a3 auditToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[SBCaptureApplicationLaunchMonitor scene](self, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCaptureApplication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "clientHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Capture Application - %@ -: Viewfinder session will begin", (uint8_t *)&v12, 0xCu);

  }
  -[SBCaptureApplicationLaunchMonitor _cameraViewfinderMonitorSessionDetected:auditToken:](self, "_cameraViewfinderMonitorSessionDetected:auditToken:", v7, v6);

}

- (void)cameraViewfinderMonitorSessionDidBegin:(id)a3 auditToken:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = a3;
  -[SBCaptureApplicationLaunchMonitor scene](self, "scene");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogCaptureApplication();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(v8, "clientHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bundleIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138412290;
    v13 = v11;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Capture Application - %@ -: Viewfinder session did begin", (uint8_t *)&v12, 0xCu);

  }
  -[SBCaptureApplicationLaunchMonitor _cameraViewfinderMonitorSessionDetected:auditToken:](self, "_cameraViewfinderMonitorSessionDetected:auditToken:", v7, v6);

}

- (FBScene)scene
{
  return self->_scene;
}

- (SBFCaptureApplicationLaunchMonitorDelegate)delegate
{
  return (SBFCaptureApplicationLaunchMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SBCameraViewfinderMonitoring)viewfinderMonitoringToken
{
  return self->_viewfinderMonitoringToken;
}

- (void)setViewfinderMonitoringToken:(id)a3
{
  objc_storeStrong((id *)&self->_viewfinderMonitoringToken, a3);
}

- (BOOL)hasCameraCaptureButtonConfiguration
{
  return self->_hasCameraCaptureButtonConfiguration;
}

- (void)setHasCameraCaptureButtonConfiguration:(BOOL)a3
{
  self->_hasCameraCaptureButtonConfiguration = a3;
}

- (BOOL)isCameraInUse
{
  return self->_isCameraInUse;
}

- (void)setIsCameraInUse:(BOOL)a3
{
  self->_isCameraInUse = a3;
}

- (BOOL)hasTCCAccess
{
  return self->_hasTCCAccess;
}

- (void)setHasTCCAccess:(BOOL)a3
{
  self->_hasTCCAccess = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewfinderMonitoringToken, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_scene, 0);
  objc_storeStrong((id *)&self->_monitorTimer, 0);
}

- (void)initWithScene:delegate:.cold.1()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

- (void)initWithScene:delegate:.cold.2()
{
  void *v0;
  SEL v1;
  objc_class *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  OUTLINED_FUNCTION_5_2();
  NSStringFromSelector(v1);
  objc_claimAutoreleasedReturnValue();
  v2 = (objc_class *)OUTLINED_FUNCTION_3_2();
  NSStringFromClass(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_0_4();
  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5_3();
  OUTLINED_FUNCTION_1(&dword_1D0540000, MEMORY[0x1E0C81028], v4, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", v5, v6, v7, v8, v9);

  OUTLINED_FUNCTION_2();
}

@end
