@implementation SBDashBoardHomeAffordanceControllerClientBridge

- (SBDashBoardHomeAffordanceControllerClientBridge)initWithCoverSheetHomeGestureParticipant:(id)a3
{
  id v4;
  SBDashBoardHomeAffordanceControllerClientBridge *v5;
  SBDashBoardHomeAffordanceControllerClientBridge *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBDashBoardHomeAffordanceControllerClientBridge;
  v5 = -[SBDashBoardHomeAffordanceControllerClientBridge init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_coverSheetHomeGestureParticipant, v4);

  return v6;
}

- (void)zStackParticipantDidChange:(id)a3
{
  CSHomeGestureParticipating **p_coverSheetHomeGestureParticipant;
  id v4;
  id WeakRetained;

  p_coverSheetHomeGestureParticipant = &self->_coverSheetHomeGestureParticipant;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_coverSheetHomeGestureParticipant);
  objc_msgSend(WeakRetained, "homeGestureParticipantOwningHomeGestureDidChange:ownsHomeGesture:", v4, objc_msgSend(v4, "ownsHomeGesture"));

}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  objc_msgSend(a4, "setActivationPolicyForParticipantsBelow:", 1);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_coverSheetHomeGestureParticipant);
}

@end
