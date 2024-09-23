@implementation _SBContinuitySessionServiceClient

- (_SBContinuitySessionServiceClient)initWithConnection:(id)a3 pid:(int)a4
{
  id v7;
  _SBContinuitySessionServiceClient *v8;
  _SBContinuitySessionServiceClient *v9;
  uint64_t v10;
  NSSet *clientExternallyBlockedReasons;
  NSObject *v12;
  __int16 v14[8];
  objc_super v15;

  v7 = a3;
  v15.receiver = self;
  v15.super_class = (Class)_SBContinuitySessionServiceClient;
  v8 = -[_SBContinuitySessionServiceClient init](&v15, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v8->_connection, a3);
    v9->_pid = a4;
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v10 = objc_claimAutoreleasedReturnValue();
    clientExternallyBlockedReasons = v9->_clientExternallyBlockedReasons;
    v9->_clientExternallyBlockedReasons = (NSSet *)v10;

    *(_DWORD *)&v9->_lock_waitingForClientActivation = 16777473;
    SBLogContinuitySessionService();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_signpost_enabled(v12))
    {
      v14[0] = 0;
      _os_signpost_emit_with_name_impl(&dword_1D0540000, v12, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_CONNECTION_NEGOTIATION", (const char *)&unk_1D0E9B6CB, (uint8_t *)v14, 2u);
    }

  }
  return v9;
}

- (void)setSession:(id)a3
{
  SBContinuitySession *v5;
  SBContinuitySession *session;
  SBContinuitySession *v7;

  v5 = (SBContinuitySession *)a3;
  session = self->_session;
  if (session != v5)
  {
    v7 = v5;
    -[SBContinuitySession removeStateObserver:](session, "removeStateObserver:", self);
    -[SBContinuitySession removeOrientationObserver:](self->_session, "removeOrientationObserver:", self);
    objc_storeStrong((id *)&self->_session, a3);
    -[SBContinuitySession addStateObserver:](self->_session, "addStateObserver:", self);
    -[SBContinuitySession addOrientationObserver:](self->_session, "addOrientationObserver:", self);
    v5 = v7;
  }

}

- (NSSet)externallyBlockedReasons
{
  void *v3;

  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", self->_clientExternallyBlockedReasons);
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_waitingForClientActivation)
    objc_msgSend(v3, "addObject:", CFSTR("block._SBContinuitySessionServiceClient.waiting-for-clientActivation"));
  os_unfair_lock_unlock(&self->_lock);
  return (NSSet *)v3;
}

- (void)_connectionQueue_handleLaunchEventOfType:(id)a3 payload:(id)a4
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

- (void)_connectionQueue_handleContinuityButtonEvent:(unint64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_waitingForClientActivation)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionServiceClient.m"), 125, CFSTR("Can't process button event before client activation"));

  }
  os_unfair_lock_unlock(p_lock);
  BSDispatchMain();
}

- (void)_connectionQueue_setHostedInterfaceOrientation:(int64_t)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  if (self->_lock_waitingForClientActivation)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionServiceClient.m"), 147, CFSTR("Can't process hosted interface orientation change"));

  }
  os_unfair_lock_unlock(p_lock);
  BSDispatchMain();
}

- (void)_connectionQueue_handleActivated
{
  NSObject *v3;
  void *v4;
  uint8_t buf[4];
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogContinuitySessionService();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[_SBContinuitySessionServiceClient succinctDescription](self, "succinctDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] received activation message (not handled yet)", buf, 0xCu);

  }
  BSDispatchMain();
}

- (void)_connectionQueue_handleUpdatedExternallyBlockedReasons:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  BSDispatchMain();

}

- (void)_connectionQueue_handleHIDServicesConfigured
{
  BSDispatchMain();
}

- (void)_connectionQueue_updatedAppearanceSettings:(id)a3 transitionContext:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;

  v7 = a3;
  v11 = a4;
  v12 = a5;
  v8 = v12;
  v9 = v11;
  v10 = v7;
  BSDispatchMain();

}

- (void)_connectionQueue_didCaptureScreenshot
{
  BSDispatchMain();
}

- (void)_connectionQueue_didStartScreenRecording
{
  BSDispatchMain();
}

- (void)_connectionQueue_clientHasAdoptedScreenCaptureNotifications
{
  BSDispatchMain();
}

- (void)_connectionQueue_didStopScreenRecording
{
  BSDispatchMain();
}

- (void)_connectionQueue_didInvalidate
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogContinuitySessionService();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    -[_SBContinuitySessionServiceClient succinctDescription](self, "succinctDescription");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138543362;
    v6 = v4;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "[%{public}@] connection did invalidate", (uint8_t *)&v5, 0xCu);

  }
  os_unfair_lock_lock(&self->_lock);
  self->_lock_invalidated = 1;
  os_unfair_lock_unlock(&self->_lock);
}

- (void)_pushLatestStateToClient
{
  _BOOL4 lock_invalidated;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  const __CFString *v8;
  const __CFString *v9;
  BOOL v10;
  const __CFString *v11;
  NSObject *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  BSServiceConnection *connection;
  void *v17;
  void *v18;
  unint64_t state;
  NSSet *stateReasons;
  uint64_t v21;
  id v22;
  NSObject *v23;
  void *v24;
  __CFString *v25;
  __CFString *v26;
  __CFString *v27;
  void *v28;
  unint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  id v34;
  uint8_t buf[4];
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  const __CFString *v40;
  __int16 v41;
  const __CFString *v42;
  __int16 v43;
  void *v44;
  _QWORD v45[2];

  v45[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  os_unfair_lock_lock(&self->_lock);
  lock_invalidated = self->_lock_invalidated;
  os_unfair_lock_unlock(&self->_lock);
  if (lock_invalidated || self->_main_suppressClientCallouts)
  {
    SBLogContinuitySessionService();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      -[_SBContinuitySessionServiceClient succinctDescription](self, "succinctDescription");
      v6 = objc_claimAutoreleasedReturnValue();
      v7 = (void *)v6;
      v8 = &stru_1E8EC7EC0;
      v9 = CFSTR("suppressing callouts");
      if (self->_main_suppressClientCallouts)
      {
        v10 = !lock_invalidated;
      }
      else
      {
        v9 = &stru_1E8EC7EC0;
        v10 = 1;
      }
      v11 = CFSTR(" + ");
      if (v10)
        v11 = &stru_1E8EC7EC0;
      *(_DWORD *)buf = 138544130;
      v36 = v6;
      v37 = 2114;
      if (lock_invalidated)
        v8 = CFSTR("INVALIDATED");
      v38 = v8;
      v39 = 2114;
      v40 = v11;
      v41 = 2114;
      v42 = v9;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_INFO, "[%{public}@] - not pushing state to client because it is %{public}@%{public}@%{public}@", buf, 0x2Au);

    }
  }
  else
  {
    SBLogContinuitySessionService();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      -[_SBContinuitySessionServiceClient succinctDescription](self, "succinctDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBContinuitySessionState(self->_state);
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[NSSet bs_array](self->_stateReasons, "bs_array");
      v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v36 = (uint64_t)v13;
      v37 = 2114;
      v38 = v14;
      v39 = 2114;
      v40 = v15;
      _os_log_impl(&dword_1D0540000, v12, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushing state %{public}@ + reasons %{public}@ to remote client", buf, 0x20u);

    }
    connection = self->_connection;
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("NonLaunchingAngelIPC"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSServiceConnection remoteTargetWithAssertionAttributes:](connection, "remoteTargetWithAssertionAttributes:", v18);
    v5 = objc_claimAutoreleasedReturnValue();

    state = self->_state;
    stateReasons = self->_stateReasons;
    v34 = 0;
    v21 = SBContinuitySessionStateTranslateForClient(state, stateReasons, &v34);
    v22 = v34;
    SBLogContinuitySessionService();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      -[_SBContinuitySessionServiceClient succinctDescription](self, "succinctDescription");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBContinuitySessionState(self->_state);
      v25 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[NSSet bs_array](self->_stateReasons, "bs_array");
      v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      NSStringFromSBUIContinuitySessionStep();
      v33 = v21;
      v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "bs_array");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138544386;
      v36 = (uint64_t)v24;
      v37 = 2114;
      v38 = v25;
      v39 = 2114;
      v40 = v26;
      v41 = 2114;
      v42 = v27;
      v43 = 2114;
      v44 = v28;
      _os_log_impl(&dword_1D0540000, v23, OS_LOG_TYPE_DEFAULT, "[%{public}@] translated internal state: %{public}@ + reasons: %{public}@ to client state: %{public}@ + reasons %{public}@ ", buf, 0x34u);

      v21 = v33;
    }

    if (!self->_main_sentDisplayUUID)
    {
      v29 = self->_state;
      if (v29 >= 5 && v29 != 11)
      {
        if (!self->_displayHardwareIdentifier)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionServiceClient.m"), 364, CFSTR("don't have a display hardware identifier set"));

        }
        -[NSObject didSetDisplayHardwareIdentifier:](v5, "didSetDisplayHardwareIdentifier:");
        self->_main_sentDisplayUUID = 1;
      }
    }
    if (self->_negotiatingSessionStart && (v21 & 0xFFFFFFFFFFFFFFFELL) == 6)
    {
      self->_negotiatingSessionStart = 0;
      SBLogContinuitySessionService();
      v30 = objc_claimAutoreleasedReturnValue();
      if (os_signpost_enabled(v30))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1D0540000, v30, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SB_ONENESS_CONNECTION_NEGOTIATION", (const char *)&unk_1D0E9B6CB, buf, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject didUpdateContinuitySessionStep:reasons:](v5, "didUpdateContinuitySessionStep:reasons:", v31, v22);

  }
}

- (void)_pushLatestOrientationToClient
{
  _BOOL4 lock_invalidated;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  const __CFString *v7;
  const __CFString *v8;
  BOOL v9;
  const __CFString *v10;
  NSObject *v11;
  void *v12;
  __CFString *v13;
  __CFString *v14;
  BSServiceConnection *connection;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  __int16 v21;
  const __CFString *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  const __CFString *v26;
  _QWORD v27[2];

  v27[1] = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  os_unfair_lock_lock(&self->_lock);
  lock_invalidated = self->_lock_invalidated;
  os_unfair_lock_unlock(&self->_lock);
  if (!lock_invalidated && !self->_main_suppressClientCallouts)
  {
    SBLogContinuitySessionService();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      -[_SBContinuitySessionServiceClient succinctDescription](self, "succinctDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      BSInterfaceOrientationDescription();
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      BSInterfaceOrientationMaskDescription();
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v19 = 138543874;
      v20 = (uint64_t)v12;
      v21 = 2114;
      v22 = v13;
      v23 = 2114;
      v24 = v14;
      _os_log_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEFAULT, "[%{public}@] pushing interface orientation %{public}@ + supported interface orientations %{public}@ to remote client", (uint8_t *)&v19, 0x20u);

    }
    connection = self->_connection;
    objc_msgSend(MEMORY[0x1E0D87CD0], "attributeWithDomain:name:", CFSTR("com.apple.common"), CFSTR("NonLaunchingAngelIPC"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSServiceConnection remoteTargetWithAssertionAttributes:](connection, "remoteTargetWithAssertionAttributes:", v17);
    v4 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_interfaceOrientation);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_supportedInterfaceOrientations);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject didUpdateCurrentInterfaceOrientation:supportedInterfaceOrientations:](v4, "didUpdateCurrentInterfaceOrientation:supportedInterfaceOrientations:", v6, v18);

    goto LABEL_15;
  }
  SBLogContinuitySessionService();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    -[_SBContinuitySessionServiceClient succinctDescription](self, "succinctDescription");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)v5;
    v7 = &stru_1E8EC7EC0;
    v8 = CFSTR("suppressing callouts");
    if (self->_main_suppressClientCallouts)
    {
      v9 = !lock_invalidated;
    }
    else
    {
      v8 = &stru_1E8EC7EC0;
      v9 = 1;
    }
    v10 = CFSTR(" + ");
    if (v9)
      v10 = &stru_1E8EC7EC0;
    v19 = 138544130;
    v20 = v5;
    v21 = 2114;
    if (lock_invalidated)
      v7 = CFSTR("INVALIDATED");
    v22 = v7;
    v23 = 2114;
    v24 = v10;
    v25 = 2114;
    v26 = v8;
    _os_log_impl(&dword_1D0540000, v4, OS_LOG_TYPE_INFO, "[%{public}@] - not pushing interface orientation to client because it is %{public}@%{public}@%{public}@", (uint8_t *)&v19, 0x2Au);
LABEL_15:

  }
}

- (void)continuitySessionDidUpdateState:(id)a3
{
  SBContinuitySession *v5;
  NSSet *v6;
  NSSet *stateReasons;
  void *v8;
  NSString *v9;
  NSString *displayHardwareIdentifier;
  NSObject *v11;
  unint64_t state;
  NSObject *v13;
  void *v14;
  void *v15;
  NSSet *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  NSSet *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = (SBContinuitySession *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_session != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionServiceClient.m"), 406, CFSTR("session updated orientation: %@ is not the one i'm tracking: %@"), v5, self->_session);

  }
  self->_state = -[SBContinuitySession state](v5, "state");
  -[SBContinuitySession reasons](v5, "reasons");
  v6 = (NSSet *)objc_claimAutoreleasedReturnValue();
  stateReasons = self->_stateReasons;
  self->_stateReasons = v6;

  -[SBContinuitySession displayHardwareIdentifier](v5, "displayHardwareIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (NSString *)objc_msgSend(v8, "copy");
  displayHardwareIdentifier = self->_displayHardwareIdentifier;
  self->_displayHardwareIdentifier = v9;

  SBLogContinuitySessionService();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    -[_SBContinuitySessionServiceClient succinctDescription](self, "succinctDescription");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSBContinuitySessionState(self->_state);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = self->_stateReasons;
    *(_DWORD *)buf = 138543874;
    v19 = v14;
    v20 = 2114;
    v21 = v15;
    v22 = 2114;
    v23 = v16;
    _os_log_debug_impl(&dword_1D0540000, v11, OS_LOG_TYPE_DEBUG, "[%{public}@] session did update state %{public}@ + reasons %{public}@", buf, 0x20u);

  }
  if (self->_main_suppressClientCallouts
    && ((state = self->_state, state > 1)
     || state == 1
     && !-[NSSet containsObject:](self->_stateReasons, "containsObject:", CFSTR("block._SBContinuitySessionServiceClient.waiting-for-clientActivation"))&& !-[NSSet containsObject:](self->_stateReasons, "containsObject:", CFSTR("block.session.client-connected"))))
  {
    SBLogContinuitySessionService();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[_SBContinuitySessionServiceClient continuitySessionDidUpdateState:].cold.1(self, v13);

    self->_main_suppressClientCallouts = 0;
    -[_SBContinuitySessionServiceClient _pushLatestStateToClient](self, "_pushLatestStateToClient");
    -[_SBContinuitySessionServiceClient _pushLatestOrientationToClient](self, "_pushLatestOrientationToClient");
  }
  else
  {
    -[_SBContinuitySessionServiceClient _pushLatestStateToClient](self, "_pushLatestStateToClient");
  }

}

- (void)continuitySession:(id)a3 didUpdateInterfaceOrientation:(int64_t)a4 supportedInterfaceOrientations:(unint64_t)a5
{
  void *v9;
  SBContinuitySession *v10;

  v10 = (SBContinuitySession *)a3;
  dispatch_assert_queue_V2(MEMORY[0x1E0C80D38]);
  if (self->_session != v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_SBContinuitySessionServiceClient.m"), 430, CFSTR("session updated orientation: %@ is not the one i'm tracking: %@"), v10, self->_session);

  }
  -[_SBContinuitySessionServiceClient setInterfaceOrientation:](self, "setInterfaceOrientation:", a4);
  -[_SBContinuitySessionServiceClient setSupportedInterfaceOrientations:](self, "setSupportedInterfaceOrientations:", a5);
  -[_SBContinuitySessionServiceClient _pushLatestOrientationToClient](self, "_pushLatestOrientationToClient");

}

- (NSString)description
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D01750], "descriptionForRootObject:", self);
}

- (id)succinctDescription
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0D01750];
  objc_msgSend(MEMORY[0x1E0D01758], "succinctStyle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "descriptionForRootObject:withStyle:", self, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)appendDescriptionToStream:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _SBContinuitySessionServiceClient *v10;
  _QWORD v11[4];
  id v12;
  _SBContinuitySessionServiceClient *v13;

  v4 = a3;
  v5 = MEMORY[0x1E0C809B0];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63___SBContinuitySessionServiceClient_appendDescriptionToStream___block_invoke;
  v11[3] = &unk_1E8E9E820;
  v7 = v4;
  v12 = v7;
  v13 = self;
  objc_msgSend(v7, "appendProem:block:", self, v11);
  if ((objc_msgSend(v7, "hasSuccinctStyle") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0D01758], "collectionLineBreakNoneStyle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = v5;
    v8[1] = 3221225472;
    v8[2] = __63___SBContinuitySessionServiceClient_appendDescriptionToStream___block_invoke_2;
    v8[3] = &unk_1E8E9E820;
    v9 = v7;
    v10 = self;
    objc_msgSend(v9, "overlayStyle:block:", v6, v8);

  }
}

- (_SBContinuitySessionServiceClientDelegate)delegate
{
  return (_SBContinuitySessionServiceClientDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBContinuitySession)session
{
  return self->_session;
}

- (int)pid
{
  return self->_pid;
}

- (NSSet)clientExternallyBlockedReasons
{
  return self->_clientExternallyBlockedReasons;
}

- (void)setClientExternallyBlockedReasons:(id)a3
{
  objc_storeStrong((id *)&self->_clientExternallyBlockedReasons, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (NSSet)stateReasons
{
  return self->_stateReasons;
}

- (void)setStateReasons:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
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

- (NSString)displayHardwareIdentifier
{
  return self->_displayHardwareIdentifier;
}

- (void)setDisplayHardwareIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BSServiceConnection)connection
{
  return self->_connection;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_displayHardwareIdentifier, 0);
  objc_storeStrong((id *)&self->_stateReasons, 0);
  objc_storeStrong((id *)&self->_clientExternallyBlockedReasons, 0);
  objc_storeStrong((id *)&self->_session, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)continuitySessionDidUpdateState:(void *)a1 .cold.1(void *a1, NSObject *a2)
{
  void *v3;
  uint8_t v4[24];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "succinctDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "[%{public}@] got first update after handling client activation, ending client update suppression and pushing latest state + orientation", v4, 0xCu);

  OUTLINED_FUNCTION_2_2();
}

@end
