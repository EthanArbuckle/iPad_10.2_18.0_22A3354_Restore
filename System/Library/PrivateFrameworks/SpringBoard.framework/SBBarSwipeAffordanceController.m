@implementation SBBarSwipeAffordanceController

- (void)_keyboardWillHide:(id)a3
{
  -[SBBarSwipeAffordanceController _setKeyboardHomeAffordanceVisible:](self, "_setKeyboardHomeAffordanceVisible:", 0);
}

- (void)_keyboardDidShow:(id)a3
{
  void *v4;
  void *v5;
  BOOL IsEmpty;
  CGRect v7;

  objc_msgSend(a3, "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", *MEMORY[0x1E0CEB890]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "CGRectValue");
  IsEmpty = CGRectIsEmpty(v7);

  if (!IsEmpty)
    -[SBBarSwipeAffordanceController _setKeyboardHomeAffordanceVisible:](self, "_setKeyboardHomeAffordanceVisible:", 1);
}

- (void)setWantsToBeActiveAffordance:(BOOL)a3
{
  if (self->_wantsToBeActiveAffordance != a3)
  {
    self->_wantsToBeActiveAffordance = a3;
    if (a3)
      -[SBBarSwipeAffordanceController _beginTryingToBecomeActiveAffordance](self, "_beginTryingToBecomeActiveAffordance");
    else
      -[SBBarSwipeAffordanceController _stopTryingToBecomeActiveAffordance](self, "_stopTryingToBecomeActiveAffordance");
  }
}

- (void)_setKeyboardHomeAffordanceVisible:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  SBBarSwipeAffordanceView *barSwipeAffordanceView;
  void *v7;
  id WeakRetained;

  v3 = a3;
  -[SBBarSwipeAffordanceView keyboardHomeAffordanceAssertion](self->_barSwipeAffordanceView, "keyboardHomeAffordanceAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    if (!v5)
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        barSwipeAffordanceView = self->_barSwipeAffordanceView;
        objc_msgSend(WeakRetained, "keyboardHomeAffordanceAssertionForBarSwipeAffordanceControlling:", self);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBBarSwipeAffordanceView setKeyboardHomeAffordanceAssertion:](barSwipeAffordanceView, "setKeyboardHomeAffordanceAssertion:", v7);

      }
    }
  }
  else if (v5)
  {
    -[SBBarSwipeAffordanceView setKeyboardHomeAffordanceAssertion:](self->_barSwipeAffordanceView, "setKeyboardHomeAffordanceAssertion:", 0);
  }
}

- (SBBarSwipeAffordanceController)initWithZStackParticipantIdentifier:(int64_t)a3 windowScene:(id)a4
{
  id v6;
  SBBarSwipeAffordanceController *v7;
  SBBarSwipeAffordanceController *v8;
  void *v9;
  void *v10;
  SBBarSwipeAffordanceView *v11;
  uint64_t v12;
  SBBarSwipeAffordanceView *barSwipeAffordanceView;
  void *v14;
  void *v15;
  objc_super v17;

  v6 = a4;
  v17.receiver = self;
  v17.super_class = (Class)SBBarSwipeAffordanceController;
  v7 = -[SBBarSwipeAffordanceController init](&v17, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_zStackParticipantIdentifier = a3;
    if (!v6)
    {
      objc_msgSend((id)SBApp, "windowSceneManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "embeddedDisplayWindowScene");
      v6 = (id)objc_claimAutoreleasedReturnValue();

    }
    objc_storeWeak((id *)&v8->_windowScene, v6);
    objc_msgSend(v6, "systemGestureManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = [SBBarSwipeAffordanceView alloc];
    v12 = -[SBBarSwipeAffordanceView initWithFrame:systemGestureManager:enableGestures:](v11, "initWithFrame:systemGestureManager:enableGestures:", v10, 1, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    barSwipeAffordanceView = v8->_barSwipeAffordanceView;
    v8->_barSwipeAffordanceView = (SBBarSwipeAffordanceView *)v12;

    v8->_activationPolicyForParticipantsBelow = 1;
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v8, sel__keyboardDidShow_, *MEMORY[0x1E0CEB828], 0);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v8, sel__keyboardWillHide_, *MEMORY[0x1E0CEB970], 0);

  }
  return v8;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB828], 0);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, *MEMORY[0x1E0CEB970], 0);

  v5.receiver = self;
  v5.super_class = (Class)SBBarSwipeAffordanceController;
  -[SBBarSwipeAffordanceController dealloc](&v5, sel_dealloc);
}

- (void)setSuppressAffordance:(BOOL)a3
{
  if (self->_suppressAffordance != a3)
  {
    self->_suppressAffordance = a3;
    -[SBBarSwipeAffordanceController _updateActiveState](self, "_updateActiveState");
  }
}

- (void)setActivationPolicyForParticipantsBelow:(int64_t)a3
{
  if (self->_activationPolicyForParticipantsBelow != a3)
  {
    self->_activationPolicyForParticipantsBelow = a3;
    -[SBFZStackParticipant setNeedsUpdatePreferencesWithReason:](self->_zStackParticipant, "setNeedsUpdatePreferencesWithReason:", CFSTR("activationPolicyForParticipantsBelow changed"));
  }
}

- (void)zStackParticipantDidChange:(id)a3
{
  id WeakRetained;
  id v5;

  v5 = a3;
  -[SBBarSwipeAffordanceController _updateActiveState](self, "_updateActiveState");
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "zStackParticipantDidChange:", v5);

}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  id v6;
  id WeakRetained;
  id v8;

  v8 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "zStackParticipant:updatePreferences:", v8, v6);
  else
    objc_msgSend(v6, "setActivationPolicyForParticipantsBelow:", self->_activationPolicyForParticipantsBelow);

}

- (void)_beginTryingToBecomeActiveAffordance
{
  id WeakRetained;
  void *v4;
  SBFZStackParticipant *v5;
  SBFZStackParticipant *zStackParticipant;
  SBBarSwipeAffordanceView *barSwipeAffordanceView;
  id v8;

  if (!self->_zStackParticipant && self->_zStackParticipantIdentifier != 31)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "zStackResolver");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "acquireParticipantWithIdentifier:delegate:", self->_zStackParticipantIdentifier, self);
    v5 = (SBFZStackParticipant *)objc_claimAutoreleasedReturnValue();
    zStackParticipant = self->_zStackParticipant;
    self->_zStackParticipant = v5;

    -[SBBarSwipeAffordanceController zStackParticipantDidChange:](self, "zStackParticipantDidChange:", self->_zStackParticipant);
    barSwipeAffordanceView = self->_barSwipeAffordanceView;
    v8 = objc_loadWeakRetained((id *)&self->_pointerClickDelegate);
    -[SBBarSwipeAffordanceView setPointerClickDelegate:](barSwipeAffordanceView, "setPointerClickDelegate:", v8);

  }
}

- (void)_stopTryingToBecomeActiveAffordance
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

- (void)_updateActiveState
{
  uint64_t v3;

  if (-[SBFZStackParticipant ownsHomeGesture](self->_zStackParticipant, "ownsHomeGesture"))
    v3 = -[SBBarSwipeAffordanceController suppressAffordance](self, "suppressAffordance") ^ 1;
  else
    v3 = 0;
  -[SBBarSwipeAffordanceView setActive:](self->_barSwipeAffordanceView, "setActive:", v3);
}

- (SBBarSwipeAffordanceControllingDelegate)delegate
{
  return (SBBarSwipeAffordanceControllingDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBBarSwipeAffordanceView)barSwipeAffordanceView
{
  return self->_barSwipeAffordanceView;
}

- (BOOL)wantsToBeActiveAffordance
{
  return self->_wantsToBeActiveAffordance;
}

- (BOOL)suppressAffordance
{
  return self->_suppressAffordance;
}

- (int64_t)activationPolicyForParticipantsBelow
{
  return self->_activationPolicyForParticipantsBelow;
}

- (SBHomeGrabberPointerClickDelegate)pointerClickDelegate
{
  return (SBHomeGrabberPointerClickDelegate *)objc_loadWeakRetained((id *)&self->_pointerClickDelegate);
}

- (void)setPointerClickDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_pointerClickDelegate, a3);
}

- (SBFZStackParticipant)zStackParticipant
{
  return self->_zStackParticipant;
}

- (void)setZStackParticipant:(id)a3
{
  objc_storeStrong((id *)&self->_zStackParticipant, a3);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_zStackParticipant, 0);
  objc_destroyWeak((id *)&self->_pointerClickDelegate);
  objc_storeStrong((id *)&self->_barSwipeAffordanceView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
