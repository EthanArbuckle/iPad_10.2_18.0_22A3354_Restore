@implementation SBAccidentalActivationMitigationSessionCancellationDefaultPolicy

- (SBAccidentalActivationMitigationSessionCancellationDefaultPolicy)initWithSession:(id)a3
{
  id v5;
  SBAccidentalActivationMitigationSessionCancellationDefaultPolicy *v6;
  SBAccidentalActivationMitigationSessionCancellationDefaultPolicy *v7;

  v5 = a3;
  v6 = -[SBAccidentalActivationMitigationSessionCancellationDefaultPolicy init](self, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_session, a3);
    -[SBSAccidentalActivationMitigationSession addObserver:](v7->_session, "addObserver:", v7);
  }

  return v7;
}

- (SBAccidentalActivationMitigationSessionCancellationDefaultPolicy)initWithSession:(id)a3 suppressionManager:(id)a4
{
  id v7;
  SBAccidentalActivationMitigationSessionCancellationDefaultPolicy *v8;
  SBAccidentalActivationMitigationSessionCancellationDefaultPolicy *v9;
  uint64_t v10;
  SBLiftToWakeController *liftToWakeController;
  AWAttentionAwarenessConfiguration *v12;
  AWAttentionAwarenessConfiguration *idleUserIntentAwarenessConfiguration;
  SBAttentionAwarenessClient *v14;
  SBAttentionAwarenessClient *idleUserIntentAwarenessClient;

  v7 = a4;
  v8 = -[SBAccidentalActivationMitigationSessionCancellationDefaultPolicy initWithSession:](self, "initWithSession:", a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_suppressionManager, a4);
    +[SBLiftToWakeController sharedController](SBLiftToWakeController, "sharedController");
    v10 = objc_claimAutoreleasedReturnValue();
    liftToWakeController = v9->_liftToWakeController;
    v9->_liftToWakeController = (SBLiftToWakeController *)v10;

    v12 = (AWAttentionAwarenessConfiguration *)objc_alloc_init(MEMORY[0x1E0CFEC08]);
    idleUserIntentAwarenessConfiguration = v9->_idleUserIntentAwarenessConfiguration;
    v9->_idleUserIntentAwarenessConfiguration = v12;

    -[AWAttentionAwarenessConfiguration setIdentifier:](v9->_idleUserIntentAwarenessConfiguration, "setIdentifier:", CFSTR("accidental-activation-mitigation-session-user-intent"));
    -[AWAttentionAwarenessConfiguration setEventMask:](v9->_idleUserIntentAwarenessConfiguration, "setEventMask:", 4095);
    -[AWAttentionAwarenessConfiguration setAttentionLostTimeout:](v9->_idleUserIntentAwarenessConfiguration, "setAttentionLostTimeout:", 0.0);
    v14 = objc_alloc_init(SBAttentionAwarenessClient);
    idleUserIntentAwarenessClient = v9->_idleUserIntentAwarenessClient;
    v9->_idleUserIntentAwarenessClient = v14;

    -[SBAttentionAwarenessClient setConfiguration:](v9->_idleUserIntentAwarenessClient, "setConfiguration:", v9->_idleUserIntentAwarenessConfiguration);
    -[SBAttentionAwarenessClient setDelegate:](v9->_idleUserIntentAwarenessClient, "setDelegate:", v9);
    -[SBAttentionAwarenessClient setEnabled:](v9->_idleUserIntentAwarenessClient, "setEnabled:", 0);
  }

  return v9;
}

- (void)dealloc
{
  SBAttentionAwarenessClient *idleUserIntentAwarenessClient;
  SBAttentionAwarenessClient *v4;
  objc_super v5;

  -[SBLiftToWakeController removeObserver:](self->_liftToWakeController, "removeObserver:", self);
  idleUserIntentAwarenessClient = self->_idleUserIntentAwarenessClient;
  if (idleUserIntentAwarenessClient)
  {
    -[SBAttentionAwarenessClient invalidate](idleUserIntentAwarenessClient, "invalidate");
    v4 = self->_idleUserIntentAwarenessClient;
    self->_idleUserIntentAwarenessClient = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SBAccidentalActivationMitigationSessionCancellationDefaultPolicy;
  -[SBAccidentalActivationMitigationSessionCancellationDefaultPolicy dealloc](&v5, sel_dealloc);
}

- (void)_startEvaluatingWhetherActivationWasIntentional
{
  NSObject *v3;
  SBSAccidentalActivationMitigationSession *session;
  int v5;
  SBSAccidentalActivationMitigationSession *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    session = self->_session;
    v5 = 138412290;
    v6 = session;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Start evaluating whether activation was intentional upon session:%@ become active;",
      (uint8_t *)&v5,
      0xCu);
  }

  -[SBAttentionAwarenessClient setEnabled:](self->_idleUserIntentAwarenessClient, "setEnabled:", 1);
  -[SBLiftToWakeController addObserver:](self->_liftToWakeController, "addObserver:", self);
}

- (void)_stopEvaluatingWhetherActivationWasIntentional
{
  NSObject *v3;
  SBSAccidentalActivationMitigationSession *session;
  int v5;
  SBSAccidentalActivationMitigationSession *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  SBLogCameraCaptureAccidentalActivationMitigationSession();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    session = self->_session;
    v5 = 138412290;
    v6 = session;
    _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "Stop evaluating whether activation was intentional upon session:%@ become cancelled or mitigated", (uint8_t *)&v5, 0xCu);
  }

  -[SBAttentionAwarenessClient setEnabled:](self->_idleUserIntentAwarenessClient, "setEnabled:", 0);
  -[SBLiftToWakeController removeObserver:](self->_liftToWakeController, "removeObserver:", self);
}

- (void)accidentalActivationMitigationSessionStateDidChange:(id)a3
{
  id v4;

  v4 = a3;
  if (objc_msgSend(v4, "state") == 1)
  {
    -[SBAccidentalActivationMitigationSessionCancellationDefaultPolicy _startEvaluatingWhetherActivationWasIntentional](self, "_startEvaluatingWhetherActivationWasIntentional");
  }
  else if (objc_msgSend(v4, "state") == 2 || objc_msgSend(v4, "state") == 3)
  {
    -[SBAccidentalActivationMitigationSessionCancellationDefaultPolicy _stopEvaluatingWhetherActivationWasIntentional](self, "_stopEvaluatingWhetherActivationWasIntentional");
  }

}

- (void)clientDidResetForUserAttention:(id)a3 withEvent:(id)a4
{
  id v5;
  NSObject *v6;
  SBSAccidentalActivationMitigationSession *session;
  void *v8;
  NSString *eventReason;
  void *v10;
  int v11;
  SBSAccidentalActivationMitigationSession *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  if (objc_msgSend(v5, "eventMask") == 2)
  {
    self->_eventType = 0;
    self->_eventReason = (NSString *)NSStringFromSBAttentionAwarenessClientLastEventMask(objc_msgSend(v5, "eventMask"));
    SBLogCameraCaptureAccidentalActivationMitigationSession();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      goto LABEL_6;
    goto LABEL_7;
  }
  if (-[SBCaptureButtonSuppressionManager suppressionState](self->_suppressionManager, "suppressionState") != 1)
  {
    self->_eventType = 0;
    self->_eventReason = (NSString *)NSStringFromSBAttentionAwarenessClientLastEventMask(objc_msgSend(v5, "eventMask"));
    SBLogCameraCaptureAccidentalActivationMitigationSession();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
LABEL_6:
      session = self->_session;
      NSStringFromSBAccidentalActivationMitigationSessionCancellationEventType(self->_eventType);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      eventReason = self->_eventReason;
      NSStringFromSBCaptureButtonSuppressionState(-[SBCaptureButtonSuppressionManager suppressionState](self->_suppressionManager, "suppressionState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138413058;
      v12 = session;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = eventReason;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Did observe attention awareness event for session: %@; event type: %@; reason: %@; VO=%@",
        (uint8_t *)&v11,
        0x2Au);

    }
LABEL_7:

    -[SBSAccidentalActivationMitigationSession requestSessionCancellation](self->_session, "requestSessionCancellation");
  }

}

- (void)liftToWakeController:(id)a3 didObserveTransition:(int64_t)a4 deviceOrientation:(int64_t)a5
{
  NSObject *v6;
  SBSAccidentalActivationMitigationSession *session;
  void *v8;
  NSString *eventReason;
  void *v10;
  int v11;
  SBSAccidentalActivationMitigationSession *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  NSString *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (a4 == 2)
  {
    self->_eventType = 1;
    self->_eventReason = (NSString *)(id)NSStringFromSBLiftToWakeTransition(2);
    SBLogCameraCaptureAccidentalActivationMitigationSession();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      session = self->_session;
      NSStringFromSBAccidentalActivationMitigationSessionCancellationEventType(self->_eventType);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      eventReason = self->_eventReason;
      NSStringFromSBCaptureButtonSuppressionState(-[SBCaptureButtonSuppressionManager suppressionState](self->_suppressionManager, "suppressionState"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138413058;
      v12 = session;
      v13 = 2112;
      v14 = v8;
      v15 = 2112;
      v16 = eventReason;
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Did observe lift to wake for session: %@; event type: %@, reason: %@; VO=%@",
        (uint8_t *)&v11,
        0x2Au);

    }
    -[SBSAccidentalActivationMitigationSession requestSessionCancellation](self->_session, "requestSessionCancellation");
  }
}

- (int64_t)eventType
{
  return self->_eventType;
}

- (NSString)eventReason
{
  return self->_eventReason;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_idleUserIntentAwarenessClient, 0);
  objc_storeStrong((id *)&self->_idleUserIntentAwarenessConfiguration, 0);
  objc_storeStrong((id *)&self->_liftToWakeController, 0);
  objc_storeStrong((id *)&self->_suppressionManager, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end
