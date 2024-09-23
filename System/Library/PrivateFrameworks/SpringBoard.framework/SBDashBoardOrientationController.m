@implementation SBDashBoardOrientationController

- (void)deferOrientationUpdatesWithReason:(id)a3
{
  void *v4;
  BSInvalidatable *v5;
  BSInvalidatable *v6;
  BSInvalidatable *deferOrientationUpdatesAssertion;
  id v8;

  v8 = a3;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRolePipelineManager")) & 1) == 0)
  {
    v4 = (void *)SBApp;
    v5 = self->_deferOrientationUpdatesAssertion;
    objc_msgSend(v4, "deviceOrientationUpdateDeferralAssertionWithReason:", v8);
    v6 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = v6;

    -[BSInvalidatable invalidate](v5, "invalidate");
  }

}

- (void)cancelOrientationUpdateDeferral
{
  BSInvalidatable *deferOrientationUpdatesAssertion;

  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRolePipelineManager")) & 1) == 0)
  {
    -[BSInvalidatable invalidate](self->_deferOrientationUpdatesAssertion, "invalidate");
    deferOrientationUpdatesAssertion = self->_deferOrientationUpdatesAssertion;
    self->_deferOrientationUpdatesAssertion = 0;

  }
}

- (void)noteInterfaceOrientationChanged:(int64_t)a3 duration:(double)a4 logMessage:(id)a5
{
  id v7;

  v7 = a5;
  if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRolePipelineManager")) & 1) == 0)
    objc_msgSend((id)SBApp, "noteInterfaceOrientationChanged:duration:logMessage:", a3, v7, a4);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deferOrientationUpdatesAssertion, 0);
}

@end
