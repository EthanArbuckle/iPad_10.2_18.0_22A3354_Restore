@implementation SBSpotlightTransientOverlayInteractiveGestureTransaction

- (SBSpotlightTransientOverlayInteractiveGestureTransaction)initWithTransitionRequest:(id)a3 spotlightTransientOverlayViewController:(id)a4
{
  id v7;
  SBSpotlightTransientOverlayInteractiveGestureTransaction *v8;
  SBSpotlightTransientOverlayInteractiveGestureTransaction *v9;
  uint64_t v10;
  SBSpotlightSettings *settings;
  objc_super v13;

  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)SBSpotlightTransientOverlayInteractiveGestureTransaction;
  v8 = -[SBMainWorkspaceTransaction initWithTransitionRequest:](&v13, sel_initWithTransitionRequest_, a3);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_spotlightTransientOverlayViewController, a4);
    +[SBSpotlightDomain rootSettings](SBSpotlightDomain, "rootSettings");
    v10 = objc_claimAutoreleasedReturnValue();
    settings = v9->_settings;
    v9->_settings = (SBSpotlightSettings *)v10;

  }
  return v9;
}

- (void)_begin
{
  void *v3;
  void *v4;
  void *v5;
  SBSpotlightTransientOverlayViewController *spotlightTransientOverlayViewController;
  void *v7;
  void *v8;
  objc_super v9;

  if (!self->_gestureFinishedBeforeTransactionBegan)
  {
    -[SBSpotlightTransientOverlayInteractiveGestureTransaction addMilestone:](self, "addMilestone:", CFSTR("trackingGesture"));
    +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "displayIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "startSuppressingKeyboardWithReason:predicate:displayIdentity:", CFSTR("SBSpotlightInteractiveGestureKeyboardSuppressionReason"), 0, v5);

  }
  v9.receiver = self;
  v9.super_class = (Class)SBSpotlightTransientOverlayInteractiveGestureTransaction;
  -[SBSpotlightTransientOverlayInteractiveGestureTransaction _begin](&v9, sel__begin);
  if (!self->_gestureFinishedBeforeTransactionBegan)
  {
    -[SBSpotlightTransientOverlayViewController beginInteractivePresentation](self->_spotlightTransientOverlayViewController, "beginInteractivePresentation");
    spotlightTransientOverlayViewController = self->_spotlightTransientOverlayViewController;
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "displayConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSpotlightTransientOverlayViewController setTargetDisplayConfiguration:](spotlightTransientOverlayViewController, "setTargetDisplayConfiguration:", v8);

    -[SBSpotlightTransientOverlayInteractiveGestureTransaction _presentTransientOverlayViewController:](self, "_presentTransientOverlayViewController:", self->_spotlightTransientOverlayViewController);
  }
}

- (void)_didComplete
{
  void *v3;
  objc_super v4;

  +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stopSuppressingKeyboardWithReason:", CFSTR("SBSpotlightInteractiveGestureKeyboardSuppressionReason"));

  v4.receiver = self;
  v4.super_class = (Class)SBSpotlightTransientOverlayInteractiveGestureTransaction;
  -[SBMainWorkspaceTransaction _didComplete](&v4, sel__didComplete);
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  char isKindOfClass;
  objc_class *v11;
  void *v12;

  v4 = a3;
  v5 = objc_opt_class();
  SBSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copyMainWorkspaceTransitionRequest");
  if (objc_msgSend(v7, "source") == 11)
  {
    objc_msgSend(v7, "workspace");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "transactionForTransitionRequest:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    if ((isKindOfClass & 1) != 0)
    {
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBSpotlightTransientOverlayInteractiveGestureTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> interruptible because:  next request is also interactive spotlight gesture"), v12, self);

    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)_logForInterruptAttemptReason:(id)a3
{
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;
  uint64_t v12;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:arguments:", v4, &v12);
    if (-[SBSpotlightTransientOverlayInteractiveGestureTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))-[SBSpotlightTransientOverlayInteractiveGestureTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("%@"), v7);
    SBLogCommon();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v10 = v7;
      _os_log_impl(&dword_1D0540000, v8, OS_LOG_TYPE_INFO, "%{public}@", buf, 0xCu);
    }

  }
}

- (void)updatePresentationWithProgress:(double)a3 translation:(double)a4
{
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  void *v12;
  int v13;
  void *v14;

  if (!SBReduceMotion())
  {
    -[SBSpotlightSettings maxTranslationForHomeScreenScale](self->_settings, "maxTranslationForHomeScreenScale");
    -[SBSpotlightSettings homeScreenScaleRubberbandingMin](self->_settings, "homeScreenScaleRubberbandingMin");
    v8 = v7;
    -[SBSpotlightSettings homeScreenScaleRubberbandingMax](self->_settings, "homeScreenScaleRubberbandingMax");
    -[SBSpotlightSettings homeScreenScaleRubberbandingRange](self->_settings, "homeScreenScaleRubberbandingRange", v8, 1, v9, 1);
    BSUIConstrainValueToIntervalWithRubberBand();
    v11 = v10;
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isLockScreenVisible");

    if (v13)
    {
      +[SBUIController sharedInstance](SBUIController, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setLockScreenScale:withDuration:behaviorMode:completion:", 5, 0, v11, 0.0);
    }
    else
    {
      -[SBSpotlightTransientOverlayInteractiveGestureTransaction _homeScreenAnimator](self, "_homeScreenAnimator");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "setHomeScreenScale:behaviorMode:completion:", 5, 0, v11);
    }

  }
  -[SBSpotlightTransientOverlayViewController updateInteractivePresentationWithProgress:translation:](self->_spotlightTransientOverlayViewController, "updateInteractivePresentationWithProgress:translation:", a3, a4);
}

- (void)endPresentation:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  int v6;
  void *v7;

  v3 = a3;
  +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isLockScreenVisible");

  if (v6)
  {
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLockScreenScale:withDuration:behaviorMode:completion:", 3, 0, 1.0, 0.3);
  }
  else
  {
    -[SBSpotlightTransientOverlayInteractiveGestureTransaction _homeScreenAnimator](self, "_homeScreenAnimator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setHomeScreenScale:behaviorMode:completion:", 3, 0, 1.0);
  }

  -[SBSpotlightTransientOverlayViewController endInteractivePresentation:](self->_spotlightTransientOverlayViewController, "endInteractivePresentation:", v3);
  if (!v3)
    -[SBSpotlightTransientOverlayInteractiveGestureTransaction _dismissSpotlightTransientOverlayViewController](self, "_dismissSpotlightTransientOverlayViewController");
  -[SBSpotlightTransientOverlayInteractiveGestureTransaction removeMilestone:](self, "removeMilestone:", CFSTR("trackingGesture"));
}

- (void)noteGestureFinishedBeforeTransactionBegan
{
  self->_gestureFinishedBeforeTransactionBegan = 1;
}

- (void)_presentTransientOverlayViewController:(id)a3
{
  id v5;
  void *v6;
  SBWorkspaceTransientOverlay *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  SBWorkspaceTransientOverlay *v13;
  SBMainWorkspaceTransaction *v14;
  SBMainWorkspaceTransaction *presentTransientOverlayTransaction;
  void *v16;
  _QWORD v17[4];
  SBWorkspaceTransientOverlay *v18;

  v5 = a3;
  if (self->_presentTransientOverlayTransaction)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid condition not satisfying: %@"), CFSTR("_presentTransientOverlayTransaction == nil"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
      -[SBSpotlightTransientOverlayInteractiveGestureTransaction _presentTransientOverlayViewController:].cold.1(a2, (uint64_t)self, (uint64_t)v16);
    objc_msgSend(objc_retainAutorelease(v16), "UTF8String");
    _bs_set_crash_log_message();
    __break(0);
  }
  else
  {
    v6 = v5;
    v7 = -[SBWorkspaceTransientOverlay initWithViewController:]([SBWorkspaceTransientOverlay alloc], "initWithViewController:", v5);
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "workspace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "createRequestWithOptions:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setEventLabelWithFormat:", CFSTR("PresentTransientOverlay = %@"), v12);

    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __99__SBSpotlightTransientOverlayInteractiveGestureTransaction__presentTransientOverlayViewController___block_invoke;
    v17[3] = &unk_1E8EA1EB8;
    v18 = v7;
    v13 = v7;
    objc_msgSend(v10, "modifyTransientOverlayContext:", v17);
    objc_msgSend(v10, "modifyApplicationContext:", &__block_literal_global_44);
    objc_msgSend(v9, "transactionForTransitionRequest:", v10);
    v14 = (SBMainWorkspaceTransaction *)objc_claimAutoreleasedReturnValue();
    presentTransientOverlayTransaction = self->_presentTransientOverlayTransaction;
    self->_presentTransientOverlayTransaction = v14;

    -[SBMainWorkspaceTransaction addObserver:](self->_presentTransientOverlayTransaction, "addObserver:", self);
    -[SBSpotlightTransientOverlayInteractiveGestureTransaction addChildTransaction:](self, "addChildTransaction:", self->_presentTransientOverlayTransaction);

  }
}

void __99__SBSpotlightTransientOverlayInteractiveGestureTransaction__presentTransientOverlayViewController___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTransitionType:", 0);
  objc_msgSend(v3, "setTransientOverlay:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAnimated:", 1);

}

uint64_t __99__SBSpotlightTransientOverlayInteractiveGestureTransaction__presentTransientOverlayViewController___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWaitsForSceneUpdates:", 0);
}

- (void)_dismissSpotlightTransientOverlayViewController
{
  SBWorkspaceTransientOverlay *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  SBWorkspaceTransientOverlay *v9;
  SBMainWorkspaceTransaction *presentTransientOverlayTransaction;
  void *v11;
  _QWORD v12[4];
  SBWorkspaceTransientOverlay *v13;

  v3 = -[SBWorkspaceTransientOverlay initWithViewController:]([SBWorkspaceTransientOverlay alloc], "initWithViewController:", self->_spotlightTransientOverlayViewController);
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "workspace");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "createRequestWithOptions:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEventLabelWithFormat:", CFSTR("DismissSearchOverlay"), v8);

  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __107__SBSpotlightTransientOverlayInteractiveGestureTransaction__dismissSpotlightTransientOverlayViewController__block_invoke;
  v12[3] = &unk_1E8EA1EB8;
  v9 = v3;
  v13 = v9;
  objc_msgSend(v6, "modifyTransientOverlayContext:", v12);
  objc_msgSend(v6, "modifyApplicationContext:", &__block_literal_global_35);
  presentTransientOverlayTransaction = self->_presentTransientOverlayTransaction;
  if (presentTransientOverlayTransaction
    && -[SBWorkspaceTransaction canInterruptForTransitionRequest:](presentTransientOverlayTransaction, "canInterruptForTransitionRequest:", v6))
  {
    -[SBWorkspaceTransaction interruptForTransitionRequest:](self->_presentTransientOverlayTransaction, "interruptForTransitionRequest:", v6);
  }
  objc_msgSend(v5, "transactionForTransitionRequest:", v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSpotlightTransientOverlayInteractiveGestureTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v11, 1);

}

void __107__SBSpotlightTransientOverlayInteractiveGestureTransaction__dismissSpotlightTransientOverlayViewController__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setTransitionType:", 1);
  objc_msgSend(v3, "setTransientOverlay:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAnimated:", 1);

}

uint64_t __107__SBSpotlightTransientOverlayInteractiveGestureTransaction__dismissSpotlightTransientOverlayViewController__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWaitsForSceneUpdates:", 0);
}

- (id)_homeScreenAnimator
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  -[UIViewController _sbWindowScene](self->_spotlightTransientOverlayViewController, "_sbWindowScene");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "homeScreenController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    +[SBUIController sharedInstance](SBUIController, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (void)transactionDidComplete:(id)a3
{
  SBMainWorkspaceTransaction *v4;
  SBMainWorkspaceTransaction *v5;

  v4 = (SBMainWorkspaceTransaction *)a3;
  if (self->_presentTransientOverlayTransaction == v4)
  {
    self->_presentTransientOverlayTransaction = 0;
    v5 = v4;

    v4 = v5;
  }

}

- (SBSpotlightSettings)settings
{
  return self->_settings;
}

- (void)setSettings:(id)a3
{
  objc_storeStrong((id *)&self->_settings, a3);
}

- (SBSpotlightTransientOverlayViewController)spotlightTransientOverlayViewController
{
  return self->_spotlightTransientOverlayViewController;
}

- (void)setSpotlightTransientOverlayViewController:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightTransientOverlayViewController, a3);
}

- (SBMainWorkspaceTransaction)presentTransientOverlayTransaction
{
  return self->_presentTransientOverlayTransaction;
}

- (void)setPresentTransientOverlayTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_presentTransientOverlayTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentTransientOverlayTransaction, 0);
  objc_storeStrong((id *)&self->_spotlightTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

- (void)_presentTransientOverlayViewController:(uint64_t)a3 .cold.1(const char *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  objc_class *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  const __CFString *v15;
  __int16 v16;
  int v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  NSStringFromSelector(a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = 138544642;
  v9 = v5;
  v10 = 2114;
  v11 = v7;
  v12 = 2048;
  v13 = a2;
  v14 = 2114;
  v15 = CFSTR("SBSpotlightTransientOverlayInteractiveGestureTransaction.m");
  v16 = 1024;
  v17 = 150;
  v18 = 2114;
  v19 = a3;
  _os_log_error_impl(&dword_1D0540000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", (uint8_t *)&v8, 0x3Au);

}

@end
