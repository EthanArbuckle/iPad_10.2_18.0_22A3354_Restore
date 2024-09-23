@implementation SBCaptureButtonSOSRestriction

- (SBCaptureButtonSOSRestriction)initWithCoordinator:(id)a3
{
  SBCaptureButtonSOSRestriction *v3;
  uint64_t v4;
  SBSOSEventHandler *SOSEventHandler;
  uint64_t v6;
  BSInvalidatable *SOSMonitoringAssertion;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBCaptureButtonSOSRestriction;
  v3 = -[SBCaptureButtonInternalRestrictionGlue initWithCoordinator:](&v9, sel_initWithCoordinator_, a3);
  if (v3)
  {
    +[SBSOSEventHandler sharedInstance](SBSOSEventHandler, "sharedInstance");
    v4 = objc_claimAutoreleasedReturnValue();
    SOSEventHandler = v3->_SOSEventHandler;
    v3->_SOSEventHandler = (SBSOSEventHandler *)v4;

    -[SBSOSEventHandler addObserver:](v3->_SOSEventHandler, "addObserver:", v3);
    v6 = objc_claimAutoreleasedReturnValue();
    SOSMonitoringAssertion = v3->_SOSMonitoringAssertion;
    v3->_SOSMonitoringAssertion = (BSInvalidatable *)v6;

  }
  return v3;
}

- (void)invalidate
{
  BSInvalidatable *SOSMonitoringAssertion;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBCaptureButtonSOSRestriction;
  -[SBCaptureButtonInternalRestrictionGlue invalidate](&v4, sel_invalidate);
  -[BSInvalidatable invalidate](self->_SOSMonitoringAssertion, "invalidate");
  SOSMonitoringAssertion = self->_SOSMonitoringAssertion;
  self->_SOSMonitoringAssertion = 0;

}

- (void)SOSEventHandlerStateDidChange:(id)a3
{
  if (objc_msgSend(a3, "isSOSActive"))
    -[SBCaptureButtonInternalRestrictionGlue acquireRestriction:](self, "acquireRestriction:", CFSTR("SOSIsActive"));
  else
    -[SBCaptureButtonInternalRestrictionGlue relinquishRestriction](self, "relinquishRestriction");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_SOSMonitoringAssertion, 0);
  objc_storeStrong((id *)&self->_SOSEventHandler, 0);
}

@end
