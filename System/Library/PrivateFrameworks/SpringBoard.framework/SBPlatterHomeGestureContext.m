@implementation SBPlatterHomeGestureContext

- (SBPlatterHomeGestureContext)initWithParticipant:(id)a3 participantIdentifier:(int64_t)a4 windowScene:(id)a5
{
  id v9;
  id v10;
  SBPlatterHomeGestureContext *v11;
  SBPlatterHomeGestureContext *v12;
  SBBarSwipeAffordanceController *v13;
  SBBarSwipeAffordanceController *barSwipeAffordanceController;
  void *v16;
  void *v17;
  objc_super v18;

  v9 = a3;
  v10 = a5;
  if (v9)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPlatterHomeGestureContext.m"), 37, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("participant"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBPlatterHomeGestureContext.m"), 38, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("identifier"));

LABEL_3:
  v18.receiver = self;
  v18.super_class = (Class)SBPlatterHomeGestureContext;
  v11 = -[SBPlatterHomeGestureContext init](&v18, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_participant, v9);
    v13 = -[SBBarSwipeAffordanceController initWithZStackParticipantIdentifier:windowScene:]([SBBarSwipeAffordanceController alloc], "initWithZStackParticipantIdentifier:windowScene:", a4, v10);
    barSwipeAffordanceController = v12->_barSwipeAffordanceController;
    v12->_barSwipeAffordanceController = v13;

    -[SBBarSwipeAffordanceController setDelegate:](v12->_barSwipeAffordanceController, "setDelegate:", v12);
  }

  return v12;
}

- (void)dealloc
{
  void *v3;
  BSInvalidatable *gestureRecognizerPriorityAssertion;
  objc_super v5;

  -[SBPlatterHomeGestureContext becomeActiveAffordanceIfPossible:](self, "becomeActiveAffordanceIfPossible:", 0);
  -[SBBarSwipeAffordanceController barSwipeAffordanceView](self->_barSwipeAffordanceController, "barSwipeAffordanceView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  -[BSInvalidatable invalidate](self->_gestureRecognizerPriorityAssertion, "invalidate");
  gestureRecognizerPriorityAssertion = self->_gestureRecognizerPriorityAssertion;
  self->_gestureRecognizerPriorityAssertion = 0;

  v5.receiver = self;
  v5.super_class = (Class)SBPlatterHomeGestureContext;
  -[SBPlatterHomeGestureContext dealloc](&v5, sel_dealloc);
}

- (void)becomeActiveAffordanceIfPossible:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const __CFString *v10;
  __int16 v11;
  id v12;
  uint64_t v13;

  v3 = a3;
  v13 = *MEMORY[0x1E0C80C00];
  if (-[SBBarSwipeAffordanceController wantsToBeActiveAffordance](self->_barSwipeAffordanceController, "wantsToBeActiveAffordance") != a3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
    SBLogBanners();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = CFSTR("relinquish");
      if (v3)
        v7 = CFSTR("obtain");
      v9 = 138543618;
      v10 = v7;
      v11 = 2114;
      v12 = WeakRetained;
      _os_log_impl(&dword_1D0540000, v6, OS_LOG_TYPE_DEFAULT, "Banner participant asked to %{public}@ home gesture: %{public}@", (uint8_t *)&v9, 0x16u);
    }

    if (!v3)
    {
      -[SBBarSwipeAffordanceController barSwipeAffordanceView](self->_barSwipeAffordanceController, "barSwipeAffordanceView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setDelegate:", 0);

    }
    -[SBBarSwipeAffordanceController setWantsToBeActiveAffordance:](self->_barSwipeAffordanceController, "setWantsToBeActiveAffordance:", v3);

  }
}

- (BOOL)ownsHomeGesture
{
  void *v2;
  char v3;

  -[SBBarSwipeAffordanceController zStackParticipant](self->_barSwipeAffordanceController, "zStackParticipant");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ownsHomeGesture");

  return v3;
}

- (void)setWantsHomeGesture:(BOOL)a3
{
  id WeakRetained;
  NSObject *v5;
  const __CFString *v6;
  id v7;
  int v8;
  const __CFString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_wantsToBeActiveAffordance != a3)
  {
    self->_wantsToBeActiveAffordance = a3;
    WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
    SBLogBanners();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = CFSTR("obtain");
      if (!self->_wantsToBeActiveAffordance)
        v6 = CFSTR("relinquish");
      v8 = 138543618;
      v9 = v6;
      v10 = 2114;
      v11 = WeakRetained;
      _os_log_impl(&dword_1D0540000, v5, OS_LOG_TYPE_DEFAULT, "Banner participant wants to %{public}@ home gesture: %{public}@", (uint8_t *)&v8, 0x16u);
    }

    v7 = objc_loadWeakRetained((id *)&self->_delegate);
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "wantsHomeGestureDidChangeForBannerManagerHomeGestureContext:", self);

  }
}

- (id)platterBarSwipeAffordanceViewForParticipant:(id)a3
{
  return -[SBBarSwipeAffordanceController barSwipeAffordanceView](self->_barSwipeAffordanceController, "barSwipeAffordanceView", a3);
}

- (void)zStackParticipantDidChange:(id)a3
{
  -[SBPlatterHomeGestureContext _setOwnsHomeGesture:](self, "_setOwnsHomeGesture:", -[SBPlatterHomeGestureContext ownsHomeGesture](self, "ownsHomeGesture", a3));
}

- (void)zStackParticipant:(id)a3 updatePreferences:(id)a4
{
  objc_msgSend(a4, "setActivationPolicyForParticipantsBelow:", 1);
}

- (id)keyboardHomeAffordanceAssertionForBarSwipeAffordanceControlling:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  char v16;
  void *v17;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (!-[SBPlatterHomeGestureContext wantsToBeActiveAffordance](self, "wantsToBeActiveAffordance")
    || (objc_opt_respondsToSelector() & 1) == 0)
  {
    goto LABEL_11;
  }
  if ((objc_msgSend(MEMORY[0x1E0CEA6C8], "usesInputSystemUI") & 1) != 0)
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0D22968], "keyboardScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_12;
  v6 = v5;
  objc_msgSend(v5, "clientSettings");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "preferredSceneHostIdentity");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_loadWeakRetained((id *)&self->_participant);
  v10 = objc_opt_class();
  v11 = v9;
  if (v10)
    v12 = (objc_opt_isKindOfClass() & 1) != 0 ? v11 : 0;
  else
    v12 = 0;
  v13 = v12;

  objc_msgSend(v13, "scene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "identityToken");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v8, "isEqual:", v15);

  if ((v16 & 1) == 0)
  {
LABEL_12:
    objc_msgSend(WeakRetained, "keyboardHomeAffordanceAssertionForBannerManagerHomeGestureContext:", self);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_11:
    v17 = 0;
  }

  return v17;
}

- (unint64_t)barSwipeAffordanceView:(id)a3 systemGestureTypeForType:(int64_t)a4
{
  if ((unint64_t)(a4 - 1) >= 3)
    return 0;
  else
    return a4 + 110;
}

- (id)hideAnimationSettingsForBarSwipeAffordanceView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "hideForHomeGestureOwnershipAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "BSAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)unhideAnimationSettingsForBarSwipeAffordanceView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unhideForHomeGestureOwnershipAnimationSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "BSAnimationSettings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_setOwnsHomeGesture:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  SBPlatterHomeGestureContext *v7;
  id WeakRetained;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  BSInvalidatable *gestureRecognizerPriorityAssertion;
  BSInvalidatable *v13;
  BSInvalidatable *v14;
  int v15;
  const __CFString *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[SBBarSwipeAffordanceController barSwipeAffordanceView](self->_barSwipeAffordanceController, "barSwipeAffordanceView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
    v7 = self;
  else
    v7 = 0;
  objc_msgSend(v5, "setDelegate:", v7);

  WeakRetained = objc_loadWeakRetained((id *)&self->_participant);
  SBLogBanners();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("relinquish");
    if (v3)
      v10 = CFSTR("obtain");
    v15 = 138543618;
    v16 = v10;
    v17 = 2114;
    v18 = WeakRetained;
    _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "Banner participant did %{public}@ home gesture: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "homeGestureOwnershipDidChange:", v3);
  v11 = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v11, "bannerManagerHomeGestureContext:homeGestureOwnershipDidChange:", self, v3);
  gestureRecognizerPriorityAssertion = self->_gestureRecognizerPriorityAssertion;
  if (v3)
  {
    if (!gestureRecognizerPriorityAssertion && (objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v11, "gestureRecognizerPriorityAssertionForBannerManagerHomeGestureContext:", self);
      v13 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
LABEL_18:
      v14 = self->_gestureRecognizerPriorityAssertion;
      self->_gestureRecognizerPriorityAssertion = v13;

    }
  }
  else if (gestureRecognizerPriorityAssertion)
  {
    -[BSInvalidatable invalidate](gestureRecognizerPriorityAssertion, "invalidate");
    v13 = 0;
    goto LABEL_18;
  }

}

- (SBPlatterHomeGestureContextDelegate)delegate
{
  return (SBPlatterHomeGestureContextDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBUIPresentableHomeGestureParticipant)participant
{
  return (SBUIPresentableHomeGestureParticipant *)objc_loadWeakRetained((id *)&self->_participant);
}

- (BOOL)wantsToBeActiveAffordance
{
  return self->_wantsToBeActiveAffordance;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_participant);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_gestureRecognizerPriorityAssertion, 0);
  objc_storeStrong((id *)&self->_barSwipeAffordanceController, 0);
}

@end
