@implementation SBDashBoardModalHomeAffordanceController

- (SBDashBoardModalHomeAffordanceController)init
{
  SBDashBoardModalHomeAffordanceController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBDashBoardModalHomeAffordanceController;
  v2 = -[SBDashBoardModalHomeAffordanceController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend((id)SBApp, "windowSceneManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "embeddedDisplayWindowScene");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v2->_windowScene, v4);

  }
  return v2;
}

- (BOOL)registerHomeGestureParticipant:(id)a3
{
  SBFZStackParticipant *zStackParticipant;
  SBWindowScene **p_windowScene;
  id v6;
  id WeakRetained;
  void *v8;
  SBFZStackParticipant *v9;
  SBFZStackParticipant *v10;
  SBHomeGrabberView *v11;

  zStackParticipant = self->_zStackParticipant;
  if (!zStackParticipant)
  {
    p_windowScene = &self->_windowScene;
    v6 = a3;
    WeakRetained = objc_loadWeakRetained((id *)p_windowScene);
    objc_msgSend(WeakRetained, "zStackResolver");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "acquireParticipantWithIdentifier:delegate:", 10, self);
    v9 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
    v10 = self->_zStackParticipant;
    self->_zStackParticipant = v9;

    v11 = objc_alloc_init(SBHomeGrabberView);
    -[SBHomeGrabberView setDelegate:](v11, "setDelegate:", self);
    -[SBHomeGrabberView setAutoHides:](v11, "setAutoHides:", 1);
    -[SBHomeGrabberView setHomeAffordanceInteractionEnabled:](v11, "setHomeAffordanceInteractionEnabled:", -[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture"));
    objc_storeWeak((id *)&self->_homeGrabberView, v11);
    objc_msgSend(v6, "addGrabberView:", v11);
    objc_storeWeak((id *)&self->_homeGestureParticipant, v6);

  }
  return zStackParticipant == 0;
}

- (void)unregisterHomeGestureParticipant
{
  SBFZStackParticipant *zStackParticipant;
  SBFZStackParticipant *v4;

  zStackParticipant = self->_zStackParticipant;
  if (zStackParticipant)
  {
    -[SBFZStackParticipant invalidate](zStackParticipant, "invalidate");
    v4 = self->_zStackParticipant;
    self->_zStackParticipant = 0;

  }
}

- (BOOL)ownsHomeGesture
{
  return -[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture");
}

- (void)setHomeGestureRecognizer:(id)a3
{
  id WeakRetained;
  void *v6;
  UIScreenEdgePanGestureRecognizer *v7;
  UIScreenEdgePanGestureRecognizer **p_homeGestureRecognizer;
  UIScreenEdgePanGestureRecognizer *homeGestureRecognizer;
  UIScreenEdgePanGestureRecognizer *v10;
  id v11;

  v11 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "systemGestureManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  homeGestureRecognizer = self->_homeGestureRecognizer;
  p_homeGestureRecognizer = &self->_homeGestureRecognizer;
  v7 = homeGestureRecognizer;
  if (v11)
  {
    if (!v7)
    {
      objc_storeStrong((id *)p_homeGestureRecognizer, a3);
      objc_msgSend(v6, "addGestureRecognizer:withType:", *p_homeGestureRecognizer, 93);
    }
  }
  else
  {
    objc_msgSend(v6, "removeGestureRecognizer:", v7);
    v10 = *p_homeGestureRecognizer;
    *p_homeGestureRecognizer = 0;

  }
}

- (void)setNeedsUpdateZStackPreferencesWithReason:(id)a3
{
  -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", a3);
}

- (void)zStackParticipantDidChange:(id)a3
{
  CSModalHomeGestureParticipating **p_homeGestureParticipant;
  id v5;
  id WeakRetained;
  uint64_t v7;
  id v8;

  p_homeGestureParticipant = &self->_homeGestureParticipant;
  v5 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_homeGestureParticipant);
  objc_msgSend(WeakRetained, "homeGestureParticipantOwningHomeGestureDidChange:", objc_msgSend(v5, "ownsHomeGesture"));

  v8 = objc_loadWeakRetained((id *)&self->_homeGrabberView);
  v7 = objc_msgSend(v5, "ownsHomeGesture");

  objc_msgSend(v8, "setHomeAffordanceInteractionEnabled:", v7);
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id WeakRetained;
  id v6;

  v6 = a4;
  objc_msgSend(v6, "setActivationPolicyForParticipantsBelow:", 2);
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureParticipant);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "homeGestureParticipantUpdateZStackPreferences:", v6);

}

- (double)additionalEdgeSpacingForHomeGrabberView:(id)a3
{
  id v4;
  id WeakRetained;
  double v6;
  double v7;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeGestureParticipant);
  v6 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "additionalEdgeSpacingForGrabberView:", v4);
    v6 = v7;
  }

  return v6;
}

- (UIScreenEdgePanGestureRecognizer)homeGestureRecognizer
{
  return self->_homeGestureRecognizer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeGestureRecognizer, 0);
  objc_destroyWeak((id *)&self->_homeGrabberView);
  objc_destroyWeak((id *)&self->_homeGestureParticipant);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_destroyWeak((id *)&self->_windowScene);
}

@end
