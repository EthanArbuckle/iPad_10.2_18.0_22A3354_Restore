@implementation SBBarSwipeAffordanceViewController

- (void)setWantsToBeActiveAffordance:(BOOL)a3
{
  -[SBBarSwipeAffordanceController setWantsToBeActiveAffordance:](self->_barSwipeAffordanceController, "setWantsToBeActiveAffordance:", a3);
}

- (SBBarSwipeAffordanceViewController)initWithZStackParticipantIdentifier:(int64_t)a3 windowScene:(id)a4
{
  id v6;
  SBBarSwipeAffordanceViewController *v7;
  SBBarSwipeAffordanceController *v8;
  SBBarSwipeAffordanceController *barSwipeAffordanceController;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBBarSwipeAffordanceViewController;
  v7 = -[SBBarSwipeAffordanceViewController initWithNibName:bundle:](&v11, sel_initWithNibName_bundle_, 0, 0);
  if (v7)
  {
    v8 = -[SBBarSwipeAffordanceController initWithZStackParticipantIdentifier:windowScene:]([SBBarSwipeAffordanceController alloc], "initWithZStackParticipantIdentifier:windowScene:", a3, v6);
    barSwipeAffordanceController = v7->_barSwipeAffordanceController;
    v7->_barSwipeAffordanceController = v8;

  }
  return v7;
}

- (SBBarSwipeAffordanceControllingDelegate)delegate
{
  return -[SBBarSwipeAffordanceController delegate](self->_barSwipeAffordanceController, "delegate");
}

- (void)setDelegate:(id)a3
{
  -[SBBarSwipeAffordanceController setDelegate:](self->_barSwipeAffordanceController, "setDelegate:", a3);
}

- (BOOL)wantsToBeActiveAffordance
{
  return -[SBBarSwipeAffordanceController wantsToBeActiveAffordance](self->_barSwipeAffordanceController, "wantsToBeActiveAffordance");
}

- (BOOL)suppressAffordance
{
  return -[SBBarSwipeAffordanceController suppressAffordance](self->_barSwipeAffordanceController, "suppressAffordance");
}

- (void)setSuppressAffordance:(BOOL)a3
{
  -[SBBarSwipeAffordanceController setSuppressAffordance:](self->_barSwipeAffordanceController, "setSuppressAffordance:", a3);
}

- (int64_t)activationPolicyForParticipantsBelow
{
  return -[SBBarSwipeAffordanceController activationPolicyForParticipantsBelow](self->_barSwipeAffordanceController, "activationPolicyForParticipantsBelow");
}

- (void)setActivationPolicyForParticipantsBelow:(int64_t)a3
{
  -[SBBarSwipeAffordanceController setActivationPolicyForParticipantsBelow:](self->_barSwipeAffordanceController, "setActivationPolicyForParticipantsBelow:", a3);
}

- (SBFZStackParticipant)zStackParticipant
{
  return -[SBBarSwipeAffordanceController zStackParticipant](self->_barSwipeAffordanceController, "zStackParticipant");
}

- (SBHomeGrabberPointerClickDelegate)pointerClickDelegate
{
  return -[SBBarSwipeAffordanceController pointerClickDelegate](self->_barSwipeAffordanceController, "pointerClickDelegate");
}

- (void)setPointerClickDelegate:(id)a3
{
  -[SBBarSwipeAffordanceController setPointerClickDelegate:](self->_barSwipeAffordanceController, "setPointerClickDelegate:", a3);
}

- (void)loadView
{
  id v3;

  -[SBBarSwipeAffordanceController barSwipeAffordanceView](self->_barSwipeAffordanceController, "barSwipeAffordanceView");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBBarSwipeAffordanceViewController setView:](self, "setView:", v3);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)zStackParticipantDidChange:(id)a3
{
  -[SBBarSwipeAffordanceController zStackParticipantDidChange:](self->_barSwipeAffordanceController, "zStackParticipantDidChange:", a3);
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  -[SBBarSwipeAffordanceController zStackParticipant:updatePreferences:](self->_barSwipeAffordanceController, "zStackParticipant:updatePreferences:", a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_barSwipeAffordanceController, 0);
}

@end
