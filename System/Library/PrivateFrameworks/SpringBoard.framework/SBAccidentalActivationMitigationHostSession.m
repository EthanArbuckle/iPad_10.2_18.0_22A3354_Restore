@implementation SBAccidentalActivationMitigationHostSession

- (SBAccidentalActivationMitigationHostSession)initWithSuppressionManager:(id)a3
{
  id v5;
  SBAccidentalActivationMitigationHostSession *v6;
  SBAccidentalActivationMitigationHostSession *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SBAccidentalActivationMitigationHostSession;
  v6 = -[SBAccidentalActivationMitigationHostSession init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_suppressionManager, a3);

  return v7;
}

- (void)addObserver:(id)a3
{
  id v4;
  BOOL v5;
  NSHashTable *observers;
  NSHashTable *v7;
  NSHashTable *v8;
  id v9;

  v4 = a3;
  if (v4)
  {
    v9 = v4;
    v5 = -[NSHashTable containsObject:](self->_observers, "containsObject:", v4);
    v4 = v9;
    if (!v5)
    {
      observers = self->_observers;
      if (!observers)
      {
        objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
        v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
        v8 = self->_observers;
        self->_observers = v7;

        observers = self->_observers;
      }
      -[NSHashTable addObject:](observers, "addObject:", v9);
      v4 = v9;
    }
  }

}

- (void)removeObserver:(id)a3
{
  NSHashTable *observers;
  id v5;

  v5 = a3;
  if (v5)
    -[NSHashTable removeObject:](self->_observers, "removeObject:", v5);
  if (!-[NSHashTable count](self->_observers, "count"))
  {
    observers = self->_observers;
    self->_observers = 0;

  }
}

- (void)setState:(int64_t)a3
{
  int64_t state;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  double duration;
  void *v19;
  void *v20;
  SBIdleTimer *v21;
  SBIdleTimer *idleTimer;
  uint64_t v23;
  NSObject *v24;
  _BOOL4 v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  SBIdleTimer *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint8_t buf[4];
  SBAccidentalActivationMitigationHostSession *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  void *v53;
  _BYTE v54[128];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  BSDispatchQueueAssertMain();
  state = self->_state;
  if (state != a3)
  {
    self->_state = a3;
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v7 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v41;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v40 + 1) + 8 * v11++), "accidentalActivationMitigationSessionStateDidChange:", self);
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v40, v54, 16);
      }
      while (v9);
    }

    switch(a3)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAccidentalActivationMitigationHostSession.m"), 71, CFSTR("Accidental activation mitigation session should never become initial again."));

        SBLogCameraCaptureAccidentalActivationMitigationSession();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSBSAccidentalActivationMitigationSessionState();
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSBCaptureButtonSuppressionState(-[SBCaptureButtonSuppressionManager suppressionState](self->_suppressionManager, "suppressionState"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v45 = self;
          v46 = 2112;
          v47 = v14;
          v48 = 2112;
          v49 = *(double *)&v15;
          _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[PostLaunchSuppression][AccidentalActivationMitigationSession] %@ did transition to state: %@; due to mitiga"
            "tion session initialized, VO=%@;",
            buf,
            0x20u);

        }
        goto LABEL_31;
      case 1:
        if (state)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAccidentalActivationMitigationHostSession.m"), 76, CFSTR("Accidental activation mitigation session must be initial before becoming active."));

        }
        SBLogCameraCaptureAccidentalActivationMitigationSession();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSBSAccidentalActivationMitigationSessionState();
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          duration = self->_duration;
          NSStringFromSBCaptureButtonSuppressionState(-[SBCaptureButtonSuppressionManager suppressionState](self->_suppressionManager, "suppressionState"));
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v45 = self;
          v46 = 2112;
          v47 = v17;
          v48 = 2048;
          v49 = duration;
          v50 = 2112;
          v51 = v19;
          _os_log_impl(&dword_1D0540000, v16, OS_LOG_TYPE_DEFAULT, "[PostLaunchSuppression][AccidentalActivationMitigationSession] %@ did transition to state: %@; start timer w"
            "ith duration: %f due to mitigation session become active, VO=%@; screen is dimmed",
            buf,
            0x2Au);

        }
        -[SBAccidentalActivationMitigationHostSession delegate](self, "delegate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v39 = 0;
        objc_msgSend(v20, "hostSessionDidRequestStartMitigation:outIdleTimer:", self, &v39);
        v21 = (SBIdleTimer *)v39;

        idleTimer = self->_idleTimer;
        self->_idleTimer = v21;
        v13 = v21;

        -[SBIdleTimer addIdleTimerObserver:](self->_idleTimer, "addIdleTimerObserver:", self);
        goto LABEL_31;
      case 2:
        if (state != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAccidentalActivationMitigationHostSession.m"), 85, CFSTR("Accidental activation mitigation session must be active before becoming cancelled."));

        }
        v23 = objc_opt_class();
        SBSafeCast(v23, self->_cancellationPolicy);
        v13 = objc_claimAutoreleasedReturnValue();
        SBLogCameraCaptureAccidentalActivationMitigationSession();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT);
        if (v13)
        {
          if (!v25)
            goto LABEL_30;
          NSStringFromSBSAccidentalActivationMitigationSessionState();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSBAccidentalActivationMitigationSessionCancellationEventType(-[NSObject eventType](v13, "eventType"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject eventReason](v13, "eventReason");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSBCaptureButtonSuppressionState(-[SBCaptureButtonSuppressionManager suppressionState](self->_suppressionManager, "suppressionState"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413314;
          v45 = self;
          v46 = 2112;
          v47 = v26;
          v48 = 2112;
          v49 = *(double *)&v27;
          v50 = 2112;
          v51 = v28;
          v52 = 2112;
          v53 = v29;
          _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "[PostLaunchSuppression][AccidentalActivationMitigationSession] %@ did transition to state: %@; cancelled due"
            " to event type: %@; reason: %@, VO=%@; screen is un-dimmed, camera running",
            buf,
            0x34u);

        }
        else
        {
          if (!v25)
            goto LABEL_30;
          NSStringFromSBSAccidentalActivationMitigationSessionState();
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSBCaptureButtonSuppressionState(-[SBCaptureButtonSuppressionManager suppressionState](self->_suppressionManager, "suppressionState"));
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v45 = self;
          v46 = 2112;
          v47 = v26;
          v48 = 2112;
          v49 = *(double *)&v27;
          _os_log_impl(&dword_1D0540000, v24, OS_LOG_TYPE_DEFAULT, "[PostLaunchSuppression][AccidentalActivationMitigationSession] %@ did transition to state :%@; cancelled due"
            " to custom cancellation policy, VO=%@; screen is un-dimmed, camera running",
            buf,
            0x20u);
        }

LABEL_30:
        -[SBAccidentalActivationMitigationHostSession delegate](self, "delegate");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "hostSessionDidRequestCancelMitigation:", self);

        -[SBIdleTimer removeIdleTimerObserver:](self->_idleTimer, "removeIdleTimerObserver:", self);
        v35 = self->_idleTimer;
        self->_idleTimer = 0;

LABEL_31:
        break;
      case 3:
        if (state != 1)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBAccidentalActivationMitigationHostSession.m"), 98, CFSTR("Accidental activation mitigation session must be active before becoming mitigated."));

        }
        SBLogCameraCaptureAccidentalActivationMitigationSession();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          NSStringFromSBSAccidentalActivationMitigationSessionState();
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          NSStringFromSBCaptureButtonSuppressionState(-[SBCaptureButtonSuppressionManager suppressionState](self->_suppressionManager, "suppressionState"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412802;
          v45 = self;
          v46 = 2112;
          v47 = v31;
          v48 = 2112;
          v49 = *(double *)&v32;
          _os_log_impl(&dword_1D0540000, v30, OS_LOG_TYPE_DEFAULT, "[PostLaunchSuppression][AccidentalActivationMitigationSession] %@ did transition to state: %@; stopping came"
            "ra due to mitigation session ended, VO=%@; camera stopped, device dimmed and locked",
            buf,
            0x20u);

        }
        -[SBAccidentalActivationMitigationHostSession delegate](self, "delegate");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "hostSessionDidRequestMitigateAccidentalActivation:", self);

        -[SBIdleTimer removeIdleTimerObserver:](self->_idleTimer, "removeIdleTimerObserver:", self);
        v13 = self->_idleTimer;
        self->_idleTimer = 0;
        goto LABEL_31;
      default:
        return;
    }
  }
}

- (void)activateSessionForBundleIdentifier:(id)a3 duration:(double)a4 accidentalActivationMitigationSessionCancellationPolicyClassName:(id)a5
{
  NSString *v9;
  NSString *cancellationPolicyClassName;
  NSString *v11;
  SBAccidentalActivationMitigationSessionCancellationDefaultPolicy *v12;
  SBSAccidentalActivationMitigationSessionCancellationPolicy *cancellationPolicy;
  id v14;

  v14 = a3;
  v9 = (NSString *)a5;
  BSDispatchQueueAssertMain();
  objc_storeStrong((id *)&self->_bundleIdentifier, a3);
  self->_duration = a4;
  cancellationPolicyClassName = self->_cancellationPolicyClassName;
  self->_cancellationPolicyClassName = v9;
  v11 = v9;

  self->_mitigatedEarly = 0;
  if (v11)
    v12 = (SBAccidentalActivationMitigationSessionCancellationDefaultPolicy *)objc_msgSend(objc_alloc(NSClassFromString(v11)), "initWithSession:", self);
  else
    v12 = -[SBAccidentalActivationMitigationSessionCancellationDefaultPolicy initWithSession:suppressionManager:]([SBAccidentalActivationMitigationSessionCancellationDefaultPolicy alloc], "initWithSession:suppressionManager:", self, self->_suppressionManager);
  cancellationPolicy = self->_cancellationPolicy;
  self->_cancellationPolicy = (SBSAccidentalActivationMitigationSessionCancellationPolicy *)v12;

  -[SBAccidentalActivationMitigationHostSession setState:](self, "setState:", 1);
}

- (void)requestSessionCancellation
{
  BSDispatchQueueAssertMain();
  -[SBAccidentalActivationMitigationHostSession setState:](self, "setState:", 2);
}

- (void)requestSessionMitigateEarly
{
  BSDispatchQueueAssertMain();
  self->_mitigatedEarly = 1;
  -[SBAccidentalActivationMitigationHostSession setState:](self, "setState:", 3);
}

- (void)idleTimerDidExpire:(id)a3
{
  if (self->_idleTimer == a3 && -[SBAccidentalActivationMitigationHostSession state](self, "state") == 1)
    -[SBAccidentalActivationMitigationHostSession setState:](self, "setState:", 3);
}

- (int64_t)state
{
  return self->_state;
}

- (SBAccidentalActivationMitigationHostSessionDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (double)duration
{
  return self->_duration;
}

- (NSString)cancellationPolicyClassName
{
  return self->_cancellationPolicyClassName;
}

- (BOOL)mitigatedEarly
{
  return self->_mitigatedEarly;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cancellationPolicyClassName, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_idleTimer, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_cancellationPolicy, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
}

@end
