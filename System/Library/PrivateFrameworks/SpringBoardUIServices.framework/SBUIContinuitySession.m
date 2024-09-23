@implementation SBUIContinuitySession

- (SBUIContinuitySession)init
{
  void *v3;
  SBUIBSServiceConnectionWrapper *v4;
  SBUIContinuitySession *v5;

  v3 = (void *)BSDispatchQueueCreateWithQualityOfService();
  v4 = objc_alloc_init(SBUIBSServiceConnectionWrapper);
  v5 = -[SBUIContinuitySession initWithConnectionFactory:connectionQueue:](self, "initWithConnectionFactory:connectionQueue:", v4, v3);

  return v5;
}

- (SBUIContinuitySession)initWithConnectionFactory:(id)a3 connectionQueue:(id)a4
{
  id v6;
  id v7;
  SBUIContinuitySession *v8;
  SBUIContinuitySession *v9;
  uint64_t v10;
  NSSet *lock_serverBlockedReasons;
  uint64_t v12;
  NSSet *lock_clientBlockedReasons;
  SBUIContinuitySessionAppearanceSettings *v14;
  SBUIContinuitySessionAppearanceSettings *appearanceSettings;
  void *v16;
  objc_class *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  BSCompoundAssertion *screenRecordingAssertions;
  BSCompoundAssertion *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  BSServiceConnection *connection;
  BSServiceConnection *v30;
  SBUIContinuitySession *v31;
  NSObject *connectionQueue;
  _QWORD v34[4];
  SBUIContinuitySession *v35;
  _QWORD v36[4];
  SBUIContinuitySession *v37;
  _QWORD v38[4];
  id v39;
  id location;
  objc_super v41;

  v6 = a3;
  v7 = a4;
  v41.receiver = self;
  v41.super_class = (Class)SBUIContinuitySession;
  v8 = -[SBUIContinuitySession init](&v41, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    v8->_lock_clientCalledActivate = 0;
    objc_storeStrong((id *)&v8->_connectionQueue, a4);
    v9->_lock_serverStep = 0;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    lock_serverBlockedReasons = v9->_lock_serverBlockedReasons;
    v9->_lock_serverBlockedReasons = (NSSet *)v10;

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v12 = objc_claimAutoreleasedReturnValue();
    lock_clientBlockedReasons = v9->_lock_clientBlockedReasons;
    v9->_lock_clientBlockedReasons = (NSSet *)v12;

    v9->_lock_hostedInterfaceOrientation = 0;
    v14 = objc_alloc_init(SBUIContinuitySessionAppearanceSettings);
    appearanceSettings = v9->_appearanceSettings;
    v9->_appearanceSettings = v14;

    objc_initWeak(&location, v9);
    v16 = (void *)MEMORY[0x1E0D01718];
    v17 = (objc_class *)objc_opt_class();
    NSStringFromClass(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke;
    v38[3] = &unk_1E4C406B8;
    objc_copyWeak(&v39, &location);
    objc_msgSend(v16, "assertionWithIdentifier:stateDidChangeHandler:", v18, v38);
    v20 = objc_claimAutoreleasedReturnValue();
    screenRecordingAssertions = v9->_screenRecordingAssertions;
    v9->_screenRecordingAssertions = (BSCompoundAssertion *)v20;

    v22 = v9->_screenRecordingAssertions;
    SBLogContinuitySessionService();
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSCompoundAssertion setLog:](v22, "setLog:", v23);

    v24 = (void *)MEMORY[0x1E0D23018];
    objc_msgSend(MEMORY[0x1E0D23018], "defaultShellMachName");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBUIContinuitySessionServiceSpecification identifier](SBUIContinuitySessionServiceSpecification, "identifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "endpointForMachName:service:instance:", v25, v26, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "connectionWithEndpoint:", v27);
    v28 = objc_claimAutoreleasedReturnValue();
    connection = v9->_connection;
    v9->_connection = (BSServiceConnection *)v28;

    v30 = v9->_connection;
    v36[0] = v19;
    v36[1] = 3221225472;
    v36[2] = __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_10;
    v36[3] = &unk_1E4C40708;
    v31 = v9;
    v37 = v31;
    -[BSServiceConnection configureConnection:](v30, "configureConnection:", v36);
    connectionQueue = v9->_connectionQueue;
    v34[0] = v19;
    v34[1] = 3221225472;
    v34[2] = __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_2_15;
    v34[3] = &unk_1E4C3E408;
    v35 = v31;
    dispatch_sync(connectionQueue, v34);

    objc_destroyWeak(&v39);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  os_unfair_lock_s *WeakRetained;
  os_unfair_lock_s *v5;
  int v6;
  NSObject *v7;
  int v8;
  const __CFString *v9;
  int v10;
  NSObject *v11;
  _BOOL4 v12;
  int v13;
  const __CFString *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  WeakRetained = (os_unfair_lock_s *)objc_loadWeakRetained((id *)(a1 + 32));
  v5 = WeakRetained;
  if (WeakRetained)
  {
    os_unfair_lock_lock(WeakRetained + 6);
    v6 = BYTE1(v5[7]._os_unfair_lock_opaque);
    os_unfair_lock_unlock(v5 + 6);
    if (v6)
    {
      SBLogContinuitySessionService();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        v8 = objc_msgSend(v3, "isActive");
        v9 = CFSTR("stop");
        if (v8)
          v9 = CFSTR("start");
        v13 = 138543362;
        v14 = v9;
        _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, "Ignoring call to %{public}@ screen recording because the session has already ended", (uint8_t *)&v13, 0xCu);
      }
    }
    else
    {
      v10 = objc_msgSend(v3, "isActive");
      SBLogContinuitySessionService();
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
      if (v10)
      {
        if (v12)
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1A471F000, v11, OS_LOG_TYPE_DEFAULT, "Screen recording started", (uint8_t *)&v13, 2u);
        }

        objc_msgSend(*(id *)&v5[2]._os_unfair_lock_opaque, "remoteTarget");
        v7 = objc_claimAutoreleasedReturnValue();
        -[NSObject didStartScreenRecording](v7, "didStartScreenRecording");
      }
      else
      {
        if (v12)
        {
          LOWORD(v13) = 0;
          _os_log_impl(&dword_1A471F000, v11, OS_LOG_TYPE_DEFAULT, "Screen recording stopped", (uint8_t *)&v13, 2u);
        }

        objc_msgSend(*(id *)&v5[2]._os_unfair_lock_opaque, "remoteTarget");
        v7 = objc_claimAutoreleasedReturnValue();
        -[NSObject didStopScreenRecording](v7, "didStopScreenRecording");
      }
    }

  }
}

void __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_10(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;

  v3 = a2;
  +[SBUIContinuitySessionServiceSpecification interface](SBUIContinuitySessionServiceSpecification, "interface");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInterface:", v4);

  +[SBUIContinuitySessionServiceSpecification serviceQuality](SBUIContinuitySessionServiceSpecification, "serviceQuality");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setServiceQuality:", v5);

  objc_msgSend(v3, "setInterfaceTarget:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setTargetQueue:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_2;
  v6[3] = &unk_1E4C406E0;
  v7 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setInvalidationHandler:", v6);

}

void __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_2(uint64_t a1)
{
  NSObject *v2;
  id v3;
  uint8_t buf[16];

  SBLogContinuitySessionService();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1A471F000, v2, OS_LOG_TYPE_DEFAULT, "Ending session - server invalidated", buf, 2u);
  }

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 29) = 1;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(id *)(a1 + 32);
  BSDispatchMain();

}

void __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_11(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("serverInvalidated"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 48);
  *(_QWORD *)(v3 + 48) = v2;
  v5 = v2;

  *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40) = 7;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "continuitySession:didUpdateContinuitySessionStep:reasons:", *(_QWORD *)(a1 + 32), 7, v5);

}

uint64_t __67__SBUIContinuitySession_initWithConnectionFactory_connectionQueue___block_invoke_2_15(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "activate");
}

- (void)dealloc
{
  BSCompoundAssertion *screenRecordingAssertions;
  objc_super v4;

  -[BSCompoundAssertion invalidate](self->_screenRecordingAssertions, "invalidate");
  screenRecordingAssertions = self->_screenRecordingAssertions;
  self->_screenRecordingAssertions = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBUIContinuitySession;
  -[SBUIContinuitySession dealloc](&v4, sel_dealloc);
}

- (void)activate
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
  v15 = CFSTR("SBUIContinuitySession.m");
  v16 = 1024;
  v17 = 165;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1A471F000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

- (void)setExternallyBlockedReasons:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSSet *v7;
  NSSet *lock_clientBlockedReasons;
  _BOOL4 lock_sessionEnded;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (v4)
  {
    v5 = objc_msgSend(v4, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;
  os_unfair_lock_lock(&self->_lock);
  if ((-[NSSet isEqual:](self->_lock_clientBlockedReasons, "isEqual:", v6) & 1) != 0)
  {
    os_unfair_lock_unlock(&self->_lock);
  }
  else
  {
    v7 = (NSSet *)objc_msgSend(v6, "copy");
    lock_clientBlockedReasons = self->_lock_clientBlockedReasons;
    self->_lock_clientBlockedReasons = v7;

    lock_sessionEnded = self->_lock_sessionEnded;
    os_unfair_lock_unlock(&self->_lock);
    if (!lock_sessionEnded)
    {
      SBLogContinuitySessionService();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 138543362;
        v13 = v6;
        _os_log_impl(&dword_1A471F000, v10, OS_LOG_TYPE_DEFAULT, "Sending updated externally blocked reasons: %{public}@", (uint8_t *)&v12, 0xCu);
      }

      -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "didUpdateExternalBlockedReasons:", v6);

    }
  }

}

- (NSSet)externallyBlockedReasons
{
  os_unfair_lock_s *p_lock;
  void *v4;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSSet copy](self->_lock_clientBlockedReasons, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (unint64_t)step
{
  os_unfair_lock_s *p_lock;
  unint64_t lock_serverStep;
  BOOL v5;
  NSObject *v6;
  void *v7;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_serverStep = self->_lock_serverStep;
  LODWORD(self) = self->_lock_sessionEnded;
  os_unfair_lock_unlock(p_lock);
  if ((_DWORD)self)
    v5 = lock_serverStep == 7;
  else
    v5 = 1;
  if (!v5)
  {
    SBLogContinuitySessionService();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      NSStringFromSBUIContinuitySessionStep(lock_serverStep);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_INFO, "overriding current state (%{public}@ to invalid because the session has ended", (uint8_t *)&v9, 0xCu);

    }
    return 7;
  }
  return lock_serverStep;
}

- (NSSet)stepReasons
{
  os_unfair_lock_s *p_lock;
  void *v4;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v4 = (void *)-[NSSet copy](self->_lock_serverBlockedReasons, "copy");
  os_unfair_lock_unlock(p_lock);
  return (NSSet *)v4;
}

- (void)noteHIDServicesConfigured
{
  _BOOL4 hidServicesConfigured;
  NSObject *v4;
  _BOOL4 v5;
  void *v6;
  uint8_t v7[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  hidServicesConfigured = self->_hidServicesConfigured;
  SBLogContinuitySessionService();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (hidServicesConfigured)
  {
    if (v5)
    {
      *(_WORD *)v7 = 0;
      _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring duplicate notification that HID services were configured.  I already told SB that...", v7, 2u);
    }

  }
  else
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "Sending note that HID services were configured", buf, 2u);
    }

    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "noteHIDServicesConfigured");

    self->_hidServicesConfigured = 1;
  }
}

- (void)handleLaunchEventOfType:(id)a3 payload:(id)a4
{
  id v6;
  id v7;
  _BOOL4 lock_sessionEnded;
  NSObject *v9;
  _BOOL4 v10;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  os_unfair_lock_lock(&self->_lock);
  lock_sessionEnded = self->_lock_sessionEnded;
  os_unfair_lock_unlock(&self->_lock);
  SBLogContinuitySessionService();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (lock_sessionEnded)
  {
    if (v10)
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1A471F000, v9, OS_LOG_TYPE_DEFAULT, "Ignoring call to handleLaunchEventOfType - %{public}@ because the session has ended", (uint8_t *)&v11, 0xCu);
    }
  }
  else
  {
    if (v10)
    {
      v11 = 138543362;
      v12 = v6;
      _os_log_impl(&dword_1A471F000, v9, OS_LOG_TYPE_DEFAULT, "Sending launch event: %{public}@", (uint8_t *)&v11, 0xCu);
    }

    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v9 = objc_claimAutoreleasedReturnValue();
    -[NSObject handleLaunchEventOfType:payload:](v9, "handleLaunchEventOfType:payload:", v6, v7);
  }

}

- (void)updateAppearanceSettings:(id)a3 withCompletion:(id)a4
{
  void (**v6)(id, void *, SBUIContinuitySessionTransitionContext *);
  id v7;
  uint64_t v8;
  id v9;
  void (**v10)(_QWORD, _QWORD, _QWORD);
  _BOOL4 lock_sessionEnded;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  SBUIContinuitySessionAppearanceSettings *v19;
  void *v20;
  SBUIContinuitySessionTransitionContext *v21;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  SBUIContinuitySessionAppearanceSettings *v25;
  SBUIContinuitySessionAppearanceSettings *appearanceSettings;
  NSObject *v27;
  void *v28;
  uint64_t v29[4];
  void (**v30)(_QWORD, _QWORD, _QWORD);
  _QWORD v31[4];
  id v32;
  uint8_t buf[4];
  SBUIContinuitySessionAppearanceSettings *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = (void (**)(id, void *, SBUIContinuitySessionTransitionContext *))a3;
  v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v8 = MEMORY[0x1E0C809B0];
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = __65__SBUIContinuitySession_updateAppearanceSettings_withCompletion___block_invoke;
  v31[3] = &unk_1E4C40730;
  v9 = v7;
  v32 = v9;
  v10 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x1A85A1798](v31);
  os_unfair_lock_lock(&self->_lock);
  lock_sessionEnded = self->_lock_sessionEnded;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_sessionEnded)
  {
    SBLogContinuitySessionService();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A471F000, v12, OS_LOG_TYPE_DEFAULT, "Ignoring call to updateAppearanceSettings because the session has ended", buf, 2u);
    }

    SBUIContinuitySessionErrorCreate((void *)0xFFFFFFFFFFFFF82FLL, CFSTR("Session has ended"), v13, v14, v15, v16, v17, v18, v29[0]);
    v19 = (SBUIContinuitySessionAppearanceSettings *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, _QWORD, SBUIContinuitySessionAppearanceSettings *))v10)[2](v10, 0, v19);
  }
  else
  {
    v19 = self->_appearanceSettings;
    v20 = (void *)-[SBUIContinuitySessionAppearanceSettings mutableCopy](v19, "mutableCopy");
    v21 = objc_alloc_init(SBUIContinuitySessionTransitionContext);
    if (v6)
    {
      v6[2](v6, v20, v21);
      v22 = (void *)objc_msgSend(v20, "copy");
      if (-[SBUIContinuitySessionAppearanceSettings isEqual:](v19, "isEqual:", v22))
      {
        SBLogContinuitySessionService();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v34 = v19;
          _os_log_impl(&dword_1A471F000, v23, OS_LOG_TYPE_DEFAULT, "Appearance settings not changed from %{public}@ - firing completion now", buf, 0xCu);
        }

        v10[2](v10, 1, 0);
      }
      else
      {
        v25 = (SBUIContinuitySessionAppearanceSettings *)objc_msgSend(v20, "copy");
        appearanceSettings = self->_appearanceSettings;
        self->_appearanceSettings = v25;

        SBLogContinuitySessionService();
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v34 = v19;
          v35 = 2114;
          v36 = v22;
          _os_log_impl(&dword_1A471F000, v27, OS_LOG_TYPE_DEFAULT, "Appearance settings changed from %{public}@ to %{public}@ - sending appearance update", buf, 0x16u);
        }

        -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v29[0] = v8;
        v29[1] = 3221225472;
        v29[2] = (uint64_t)__65__SBUIContinuitySession_updateAppearanceSettings_withCompletion___block_invoke_28;
        v29[3] = (uint64_t)&unk_1E4C40780;
        v30 = v10;
        objc_msgSend(v28, "updatedAppearanceSettings:transitionContext:completion:", v22, v21, v29);

      }
    }
    else
    {
      SBLogContinuitySessionService();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A471F000, v24, OS_LOG_TYPE_DEFAULT, "No updater block provided, firing completion now", buf, 2u);
      }

      v10[2](v10, 1, 0);
    }

  }
}

uint64_t __65__SBUIContinuitySession_updateAppearanceSettings_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __65__SBUIContinuitySession_updateAppearanceSettings_withCompletion___block_invoke_28(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  v6 = v8;
  v7 = v5;
  BSDispatchMain();

}

uint64_t __65__SBUIContinuitySession_updateAppearanceSettings_withCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), objc_msgSend(*(id *)(a1 + 32), "BOOLValue"), *(_QWORD *)(a1 + 40));
}

- (SBUIContinuitySessionAppearanceSettings)appearanceSettings
{
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  return self->_appearanceSettings;
}

- (void)handleContinuityButtonEvent:(unint64_t)a3
{
  _BOOL4 lock_clientCalledActivate;
  _BOOL4 lock_sessionEnded;
  NSObject *v7;
  _BOOL4 v8;
  void *v9;
  const char *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  os_unfair_lock_lock(&self->_lock);
  lock_clientCalledActivate = self->_lock_clientCalledActivate;
  lock_sessionEnded = self->_lock_sessionEnded;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_clientCalledActivate)
  {
    SBLogContinuitySessionService();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
    if (!lock_sessionEnded)
    {
      if (v8)
      {
        NSStringFromSBUIContinuityButtonEventType(a3);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = 138543362;
        v13 = v11;
        _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, "Sending button event: %{public}@", (uint8_t *)&v12, 0xCu);

      }
      -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
      v7 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject handleContinuityButtonEvent:](v7, "handleContinuityButtonEvent:", v9);
      goto LABEL_11;
    }
    if (v8)
    {
      NSStringFromSBUIContinuityButtonEventType(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      v10 = "Ignoring call to handleContinuityButtonEvent - %{public}@ because the session has ended";
LABEL_7:
      _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, v10, (uint8_t *)&v12, 0xCu);
LABEL_11:

    }
  }
  else
  {
    SBLogContinuitySessionService();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromSBUIContinuityButtonEventType(a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138543362;
      v13 = v9;
      v10 = "Ignoring call to handleContinuityButtonEvent - %{public}@ because the session hasn't been activated by the client";
      goto LABEL_7;
    }
  }

}

- (int64_t)hostedInterfaceOrientation
{
  os_unfair_lock_s *p_lock;
  int64_t lock_hostedInterfaceOrientation;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_hostedInterfaceOrientation = self->_lock_hostedInterfaceOrientation;
  os_unfair_lock_unlock(p_lock);
  return lock_hostedInterfaceOrientation;
}

- (void)setHostedInterfaceOrientation:(int64_t)a3
{
  _BOOL4 lock_sessionEnded;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_clientCalledActivate)
  {
    lock_sessionEnded = self->_lock_sessionEnded;
    self->_lock_hostedInterfaceOrientation = a3;
    os_unfair_lock_unlock(&self->_lock);
    if (!lock_sessionEnded)
    {
      SBLogContinuitySessionService();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        BSInterfaceOrientationDescription();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = 138543362;
        v11 = v7;
        _os_log_impl(&dword_1A471F000, v6, OS_LOG_TYPE_DEFAULT, "Setting hosted interface orientation: %{public}@", (uint8_t *)&v10, 0xCu);

      }
      -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject setHostedInterfaceOrientation:](v8, "setHostedInterfaceOrientation:", v9);
      goto LABEL_9;
    }
  }
  else
  {
    self->_lock_hostedInterfaceOrientation = a3;
    os_unfair_lock_unlock(&self->_lock);
  }
  SBLogContinuitySessionService();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    BSInterfaceOrientationDescription();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543362;
    v11 = v9;
    _os_log_impl(&dword_1A471F000, v8, OS_LOG_TYPE_DEFAULT, "Pending call to set the hosted interface orientation: %{public}@ because the session hasn't been activated by the client or has ended", (uint8_t *)&v10, 0xCu);
LABEL_9:

  }
}

- (void)_invalidateOrientations
{
  self->_interfaceOrientation = 0;
  self->_supportedInterfaceOrientations = 0;
}

- (void)noteScreenshotCaptured
{
  _BOOL4 lock_clientCalledActivate;
  _BOOL4 lock_sessionEnded;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  uint8_t *v8;
  uint8_t v9[16];
  __int16 v10;
  uint8_t buf[2];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  os_unfair_lock_lock(&self->_lock);
  lock_clientCalledActivate = self->_lock_clientCalledActivate;
  lock_sessionEnded = self->_lock_sessionEnded;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_clientCalledActivate)
  {
    SBLogContinuitySessionService();
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
    if (lock_sessionEnded)
    {
      if (v6)
      {
        v10 = 0;
        v7 = "Ignoring call to note screenshot captured because the session has ended";
        v8 = (uint8_t *)&v10;
LABEL_7:
        _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, v7, v8, 2u);
      }
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v9 = 0;
        _os_log_impl(&dword_1A471F000, v5, OS_LOG_TYPE_DEFAULT, "Noting screenshot captured", v9, 2u);
      }

      -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
      v5 = objc_claimAutoreleasedReturnValue();
      -[NSObject didCaptureScreenshot](v5, "didCaptureScreenshot");
    }
  }
  else
  {
    SBLogContinuitySessionService();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v7 = "Ignoring call to note screenshot captured because the session hasn't been activated by the client";
      v8 = buf;
      goto LABEL_7;
    }
  }

}

- (id)acquireScreenRecordingAssertion
{
  void *v3;
  BSCompoundAssertion *screenRecordingAssertions;
  void *v5;
  void *v6;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  screenRecordingAssertions = self->_screenRecordingAssertions;
  objc_msgSend(v3, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSCompoundAssertion acquireForReason:](screenRecordingAssertions, "acquireForReason:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)invalidate
{
  NSObject *v3;
  NSSet *v4;
  NSSet *lock_serverBlockedReasons;
  BSServiceConnection *connection;
  BSCompoundAssertion *screenRecordingAssertions;
  uint8_t v8[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  os_unfair_lock_lock(&self->_lock);
  if (!self->_lock_sessionEnded)
  {
    SBLogContinuitySessionService();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl(&dword_1A471F000, v3, OS_LOG_TYPE_DEFAULT, "Ending session - client manually invalidated session", v8, 2u);
    }

    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v4 = (NSSet *)objc_claimAutoreleasedReturnValue();
    lock_serverBlockedReasons = self->_lock_serverBlockedReasons;
    self->_lock_serverBlockedReasons = v4;

    self->_lock_serverStep = 7;
  }
  self->_lock_sessionEnded = 1;
  -[SBUIContinuitySession _invalidateOrientations](self, "_invalidateOrientations");
  os_unfair_lock_unlock(&self->_lock);
  -[BSServiceConnection invalidate](self->_connection, "invalidate");
  connection = self->_connection;
  self->_connection = 0;

  -[BSCompoundAssertion invalidate](self->_screenRecordingAssertions, "invalidate");
  screenRecordingAssertions = self->_screenRecordingAssertions;
  self->_screenRecordingAssertions = 0;

}

- (void)didSetDisplayHardwareIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v5 = v4;
  BSDispatchMain();

}

void __57__SBUIContinuitySession_didSetDisplayHardwareIdentifier___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  SBLogContinuitySessionService();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138543362;
    v5 = v3;
    _os_log_impl(&dword_1A471F000, v2, OS_LOG_TYPE_DEFAULT, "Received display hardware identifier: %{public}@", (uint8_t *)&v4, 0xCu);
  }

  objc_storeStrong((id *)(*(_QWORD *)(a1 + 40) + 96), *(id *)(a1 + 32));
}

- (void)didUpdateContinuitySessionStep:(id)a3 reasons:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v10 = v7;
  v8 = v7;
  v9 = v6;
  BSDispatchMain();

}

void __64__SBUIContinuitySession_didUpdateContinuitySessionStep_reasons___block_invoke(id *a1)
{
  uint64_t v2;
  int v3;
  id v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  const __CFString *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (int)objc_msgSend(a1[4], "intValue");
  os_unfair_lock_lock((os_unfair_lock_t)a1[5] + 6);
  v3 = BSEqualObjects();
  v4 = a1[5];
  v5 = *((_QWORD *)v4 + 5);
  objc_storeStrong((id *)v4 + 6, a1[6]);
  *((_QWORD *)a1[5] + 5) = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)a1[5] + 6);
  if (v5 == v2)
    v6 = v3;
  else
    v6 = 0;
  SBLogContinuitySessionService();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    if (v6)
      v8 = &stru_1E4C40DE8;
    else
      v8 = CFSTR("updated");
    NSStringFromSBUIContinuitySessionStep(v2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "bs_array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 138543874;
    v13 = v8;
    v14 = 2114;
    v15 = v9;
    v16 = 2114;
    v17 = v10;
    _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, "Received %{public}@ state: %{public}@ reasons: %{public}@", (uint8_t *)&v12, 0x20u);

  }
  if ((v6 & 1) == 0)
  {
    objc_msgSend(a1[5], "delegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "continuitySession:didUpdateContinuitySessionStep:reasons:", a1[5], v2, a1[6]);

  }
}

- (void)didUpdateCurrentInterfaceOrientation:(id)a3 supportedInterfaceOrientations:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_connectionQueue);
  v10 = v7;
  v8 = v7;
  v9 = v6;
  BSDispatchMain();

}

void __93__SBUIContinuitySession_didUpdateCurrentInterfaceOrientation_supportedInterfaceOrientations___block_invoke(id *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v2 = objc_msgSend(a1[4], "unsignedIntValue");
  v3 = objc_msgSend(a1[5], "unsignedIntValue");
  objc_msgSend(a1[6], "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock((os_unfair_lock_t)a1[6] + 6);
  v5 = objc_msgSend(a1[6], "interfaceOrientation");
  v6 = objc_msgSend(a1[6], "supportedInterfaceOrientations");
  objc_msgSend(a1[6], "setInterfaceOrientation:", v2);
  objc_msgSend(a1[6], "setSupportedInterfaceOrientations:", v3);
  os_unfair_lock_unlock((os_unfair_lock_t)a1[6] + 6);
  if (v5 != v2 || v6 != v3)
  {
    SBLogContinuitySessionService();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      BSInterfaceOrientationDescription();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      BSInterfaceOrientationMaskDescription();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl(&dword_1A471F000, v7, OS_LOG_TYPE_DEFAULT, "Received interfaceOrientation: %{public}@ supportedOrientations: %{public}@", (uint8_t *)&v10, 0x16u);

    }
    objc_msgSend(v4, "continuitySession:didUpdateCurrentInterfaceOrientation:supportedInterfaceOrientations:", a1[6], v2, v3);
  }

}

- (SBUIContinuitySessionDelegate)delegate
{
  return (SBUIContinuitySessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)displayHardwareIdentifier
{
  return self->_displayHardwareIdentifier;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (unint64_t)supportedInterfaceOrientations
{
  return self->_supportedInterfaceOrientations;
}

- (void)setSupportedInterfaceOrientations:(unint64_t)a3
{
  self->_supportedInterfaceOrientations = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayHardwareIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_appearanceSettings, 0);
  objc_storeStrong((id *)&self->_screenRecordingAssertions, 0);
  objc_storeStrong((id *)&self->_lock_serverBlockedReasons, 0);
  objc_storeStrong((id *)&self->_lock_clientBlockedReasons, 0);
  objc_storeStrong((id *)&self->_connectionQueue, 0);
  objc_storeStrong((id *)&self->_connection, 0);
}

- (void)staging_adoptedMacDrivenScreenCaptureNotifications
{
  _BOOL4 lock_sessionEnded;
  NSObject *v4;
  _BOOL4 v5;
  uint8_t v6[16];
  uint8_t buf[16];

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  os_unfair_lock_lock(&self->_lock);
  lock_sessionEnded = self->_lock_sessionEnded;
  os_unfair_lock_unlock(&self->_lock);
  SBLogContinuitySessionService();
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (lock_sessionEnded)
  {
    if (v5)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "Ignoring client telling me they adopted screen capture notifications because the session has ended", buf, 2u);
    }
  }
  else
  {
    if (v5)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_1A471F000, v4, OS_LOG_TYPE_DEFAULT, "Client has adopted screen capture notifications", v6, 2u);
    }

    -[BSServiceConnection remoteTarget](self->_connection, "remoteTarget");
    v4 = objc_claimAutoreleasedReturnValue();
    -[NSObject clientHasAdoptedScreenCaptureNotifications](v4, "clientHasAdoptedScreenCaptureNotifications");
  }

}

@end
