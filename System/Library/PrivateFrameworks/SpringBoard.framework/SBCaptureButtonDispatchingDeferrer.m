@implementation SBCaptureButtonDispatchingDeferrer

- (SBCaptureButtonDispatchingDeferrer)initWithZStackResolver:(id)a3 restrictionCoordinator:(id)a4
{
  id v7;
  id v8;
  SBCaptureButtonDispatchingDeferrer *v9;
  uint64_t v10;
  BKSHIDEventDeliveryManager *deliveryManager;
  uint64_t v12;
  BSInvalidatable *inhibitionObservation;
  void *v14;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)SBCaptureButtonDispatchingDeferrer;
  v9 = -[SBCaptureButtonDispatchingDeferrer init](&v16, sel_init);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0D00CC8], "sharedInstance");
    v10 = objc_claimAutoreleasedReturnValue();
    deliveryManager = v9->_deliveryManager;
    v9->_deliveryManager = (BKSHIDEventDeliveryManager *)v10;

    objc_storeStrong((id *)&v9->_zStackResolver, a3);
    objc_msgSend(v8, "addObserver:", v9);
    v12 = objc_claimAutoreleasedReturnValue();
    inhibitionObservation = v9->_inhibitionObservation;
    v9->_inhibitionObservation = (BSInvalidatable *)v12;

    v9->_inhibitedDueToRestrictionCoordinator = objc_msgSend(v8, "isCaptureButtonActionInhibited:", 0);
    -[SBFZStackResolver addObserver:ofParticipantWithIdentifier:](v9->_zStackResolver, "addObserver:ofParticipantWithIdentifier:", v9, 30);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBCaptureButtonDispatchingDeferrer _processZStackParticipantSettings:](v9, "_processZStackParticipantSettings:", v14);
    -[SBCaptureButtonDispatchingDeferrer _updateCaptureButtonDispatchingDeferringTarget](v9, "_updateCaptureButtonDispatchingDeferringTarget");

  }
  return v9;
}

- (void)dealloc
{
  SBFZStackResolver *zStackResolver;
  objc_super v4;

  -[SBFZStackResolver removeObserver:ofParticipantWithIdentifier:](self->_zStackResolver, "removeObserver:ofParticipantWithIdentifier:", self, 30);
  zStackResolver = self->_zStackResolver;
  self->_zStackResolver = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBCaptureButtonDispatchingDeferrer;
  -[SBCaptureButtonDispatchingDeferrer dealloc](&v4, sel_dealloc);
}

- (void)zStackParticipantWithIdentifier:(int64_t)a3 wasAcquiredWithSettings:(id)a4
{
  -[SBCaptureButtonDispatchingDeferrer _processZStackParticipantSettings:](self, "_processZStackParticipantSettings:", a4);
}

- (void)zStackParticipantWithIdentifier:(int64_t)a3 settingsDidChange:(id)a4
{
  -[SBCaptureButtonDispatchingDeferrer _processZStackParticipantSettings:](self, "_processZStackParticipantSettings:", a4);
}

- (void)captureButtonRestrictionChangedTo:(BOOL)a3
{
  self->_inhibitedDueToRestrictionCoordinator = a3;
  -[SBCaptureButtonDispatchingDeferrer _updateCaptureButtonDispatchingDeferringTarget](self, "_updateCaptureButtonDispatchingDeferringTarget");
}

- (void)_processZStackParticipantSettings:(id)a3
{
  void *v4;
  FBScene *targetScene;
  id v6;

  objc_msgSend(a3, "captureButtonFullFidelityEventRequestingScenes");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((BSEqualObjects() & 1) == 0)
  {
    -[FBScene removeObserver:](self->_targetScene, "removeObserver:", self);
    objc_storeStrong((id *)&self->_targetScene, v4);
    targetScene = self->_targetScene;
    if (targetScene)
      -[FBScene addObserver:](targetScene, "addObserver:", self);
    -[SBCaptureButtonDispatchingDeferrer _updateCaptureButtonDispatchingDeferringTarget](self, "_updateCaptureButtonDispatchingDeferringTarget");
  }

}

- (void)_updateCaptureButtonDispatchingDeferringTarget
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 40);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_1D0540000, a2, OS_LOG_TYPE_DEBUG, "Selected scene requesting full-fidelity capture button events: %@", (uint8_t *)&v3, 0xCu);
}

- (void)_deferCaptureButtonEventsToSceneWithIdentityToken:(id)a3 PID:(int)a4
{
  uint64_t v4;
  id v7;
  NSObject *v8;
  void *v9;
  BSInvalidatable *deferringRuleAssertion;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  BSInvalidatable *v17;
  BSInvalidatable *v18;
  int v19;
  void *v20;
  uint64_t v21;

  v4 = *(_QWORD *)&a4;
  v21 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (self->_currentDeferralTargetPid != (_DWORD)v4)
  {
    SBLogCameraCaptureOverlay();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      BSProcessDescriptionForPID();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 138412290;
      v20 = v9;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_DEFAULT, "Deferring full-fidelity capture button events to: %@", (uint8_t *)&v19, 0xCu);

    }
    -[BSInvalidatable invalidate](self->_deferringRuleAssertion, "invalidate");
    deferringRuleAssertion = self->_deferringRuleAssertion;
    self->_deferringRuleAssertion = 0;

    v11 = (void *)objc_msgSend(MEMORY[0x1E0D00D80], "new");
    objc_msgSend(MEMORY[0x1E0D00CA8], "ui_cameraCaptureButtonEnvironment");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setEnvironment:", v12);
    v13 = (void *)objc_msgSend(MEMORY[0x1E0D00D90], "new");
    objc_msgSend(v13, "setPid:", v4);
    v14 = (void *)MEMORY[0x1E0D00CB8];
    objc_msgSend(v7, "stringRepresentation");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "tokenForString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    if (v16)
      objc_msgSend(v13, "setToken:", v16);
    -[BKSHIDEventDeliveryManager deferEventsMatchingPredicate:toTarget:withReason:](self->_deliveryManager, "deferEventsMatchingPredicate:toTarget:withReason:", v11, v13, CFSTR("Entitled Capture Button Consumer Active"));
    v17 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    v18 = self->_deferringRuleAssertion;
    self->_deferringRuleAssertion = v17;

    self->_currentDeferralTargetPid = v4;
    objc_storeStrong((id *)&self->_currentDeferralSceneIdentityToken, a3);

  }
}

- (void)_stopDeferringCaptureButtonEvents
{
  NSObject *v3;
  BSInvalidatable *deferringRuleAssertion;
  uint8_t v5[16];

  if (self->_deferringRuleAssertion)
  {
    SBLogCameraCaptureOverlay();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_1D0540000, v3, OS_LOG_TYPE_DEFAULT, "No longer deferring full-fidelity capture button events.", v5, 2u);
    }

    -[BSInvalidatable invalidate](self->_deferringRuleAssertion, "invalidate");
    deferringRuleAssertion = self->_deferringRuleAssertion;
    self->_deferringRuleAssertion = 0;

    self->_currentDeferralTargetPid = -1;
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inhibitionObservation, 0);
  objc_storeStrong((id *)&self->_deferringRuleAssertion, 0);
  objc_storeStrong((id *)&self->_targetScene, 0);
  objc_storeStrong((id *)&self->_currentDeferralSceneIdentityToken, 0);
  objc_storeStrong((id *)&self->_zStackResolver, 0);
  objc_storeStrong((id *)&self->_deliveryManager, 0);
}

@end
