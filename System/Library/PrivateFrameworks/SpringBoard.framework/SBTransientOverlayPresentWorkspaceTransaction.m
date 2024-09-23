@implementation SBTransientOverlayPresentWorkspaceTransaction

- (SBTransientOverlayPresentWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayPresentWorkspaceTransaction;
  return -[SBMainWorkspaceTransaction initWithTransitionRequest:](&v4, sel_initWithTransitionRequest_, a3);
}

- (void)_willBegin
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  BSInvalidatable *v8;
  BSInvalidatable *displayLayoutTransitionAssertion;
  void *v10;
  void *v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBTransientOverlayPresentWorkspaceTransaction;
  -[SBTransientOverlayPresentWorkspaceTransaction _willBegin](&v12, sel__willBegin);
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientOverlayPresentWorkspaceTransaction.m"), 61, CFSTR("No window scene to get a publisher: %@"), self);

  }
  objc_msgSend(v4, "displayLayoutPublisher");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBTransientOverlayPresentWorkspaceTransaction.m"), 61, CFSTR("No publisher for window scene: %@; self: %@"),
      v4,
      self);

  }
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transitionAssertionWithReason:", v7);
  v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
  self->_displayLayoutTransitionAssertion = v8;

}

- (void)_begin
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BSInvalidatable *v11;
  BSInvalidatable *eventBufferingAssertion;
  void *v13;
  void *v14;
  _BOOL4 v15;
  void *v16;
  SBUIAnimationController *v17;
  SBUIAnimationController *animation;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)SBTransientOverlayPresentWorkspaceTransaction;
  -[SBTransientOverlayPresentWorkspaceTransaction _begin](&v19, sel__begin);
  -[SBTransientOverlayPresentWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("SBTransientOverlayPresentWorkspaceTransactionMilestonePresentationCompletion"));
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientOverlayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "switcherController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "workspace");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "keyboardFocusController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bufferEventsForSpringBoardScene:reason:", v10, CFSTR("SBTransientOverlayPresentWorkspaceTransaction"));
  v11 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  eventBufferingAssertion = self->_eventBufferingAssertion;
  self->_eventBufferingAssertion = v11;

  if (v5 && objc_msgSend(v7, "unlockedEnvironmentMode") == 2)
  {
    objc_msgSend(v7, "appLayoutForWorkspaceTransientOverlay:", v5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      objc_msgSend(v5, "viewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "preferredUnlockedGestureDismissalStyle") == 3;

    }
    else
    {
      v15 = 0;
    }

  }
  else
  {
    v15 = 0;
  }
  -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "beginTransitionForWorkspaceTransaction:", self);
  if (v15)
  {
    objc_msgSend(v7, "animationControllerForTransitionRequest:", v3);
    v17 = (SBUIAnimationController *)objc_claimAutoreleasedReturnValue();
    animation = self->_animation;
    self->_animation = v17;

    if (self->_animation)
    {
      -[SBTransientOverlayPresentWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("SBTransientOverlayPresentWorkspaceTransactionMilestoneAnimation"));
      -[SBUIAnimationController addObserver:](self->_animation, "addObserver:", self);
      -[SBTransientOverlayPresentWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", self->_animation, 0);
    }
  }
  else
  {
    -[SBTransientOverlayPresentWorkspaceTransaction _performStandardPresentationAnimated:](self, "_performStandardPresentationAnimated:", objc_msgSend(v4, "isAnimated"));
  }

}

- (BOOL)_canBeInterrupted
{
  return -[SBUIAnimationController isReasonableMomentToInterrupt](self->_animation, "isReasonableMomentToInterrupt")
      || -[SBWorkspaceTransaction _isInterruptingForTransitionRequest](self, "_isInterruptingForTransitionRequest");
}

- (void)_didComplete
{
  BSInvalidatable *displayLayoutTransitionAssertion;
  objc_super v4;

  -[BSInvalidatable invalidate](self->_displayLayoutTransitionAssertion, "invalidate");
  displayLayoutTransitionAssertion = self->_displayLayoutTransitionAssertion;
  self->_displayLayoutTransitionAssertion = 0;

  -[BSInvalidatable invalidate](self->_eventBufferingAssertion, "invalidate");
  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayPresentWorkspaceTransaction;
  -[SBMainWorkspaceTransaction _didComplete](&v4, sel__didComplete);
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_class *v15;
  SBUIAnimationController *v16;
  BOOL v17;
  void *v18;
  int v19;
  objc_class *v20;
  objc_class *v21;
  void *v22;
  void *v23;
  char v24;
  objc_class *v25;
  void *v26;
  uint64_t v27;
  objc_class *v28;
  objc_class *v30;
  void *v31;
  objc_class *v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  void *v36;
  _QWORD v37[5];
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v4 = a3;
  if (self->_animation)
  {
    v5 = objc_opt_class();
    SBSafeCast(v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(v6, "copyMainWorkspaceTransitionRequest");
    if (-[SBTransientOverlayPresentWorkspaceTransaction isInterrupted](self, "isInterrupted"))
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTransientOverlayPresentWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  already interrupted"), v9, self);
LABEL_19:

      v17 = 0;
      goto LABEL_20;
    }
    objc_msgSend(v7, "applicationContext");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "isBackground");

    if (v19)
    {
      v20 = (objc_class *)objc_opt_class();
      NSStringFromClass(v20);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTransientOverlayPresentWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  request is for background activation"), v9, self);
      goto LABEL_19;
    }
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v22, "isInSetupMode") & 1) != 0)
    {
      +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "isInSetupModeReadyToExit");

      if ((v24 & 1) == 0)
      {
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBTransientOverlayPresentWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because: we are in setup mode"), v9, self);
        goto LABEL_19;
      }
    }
    else
    {

    }
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(v26, "source");

    if (v27 == 31)
    {
      v28 = (objc_class *)objc_opt_class();
      NSStringFromClass(v28);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTransientOverlayPresentWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because: we are in a startup transition"), v9, self);
      goto LABEL_19;
    }
    v16 = self->_animation;
    if ((-[SBUIAnimationController isInterruptible](v16, "isInterruptible") & 1) == 0)
    {
      v32 = (objc_class *)objc_opt_class();
      NSStringFromClass(v32);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = (objc_class *)objc_opt_class();
      NSStringFromClass(v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTransientOverlayPresentWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  self animation isn't interruptible : animationController=<%@:%p>"), v31, self, v34, v16);

      goto LABEL_29;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v38 = 0;
      v39 = &v38;
      v40 = 0x2020000000;
      v41 = 0;
      v37[0] = MEMORY[0x1E0C809B0];
      v37[1] = 3221225472;
      v37[2] = __82__SBTransientOverlayPresentWorkspaceTransaction_canInterruptForTransitionRequest___block_invoke;
      v37[3] = &unk_1E8E9E040;
      v37[4] = &v38;
      -[SBUIAnimationController _enumerateCoordinatingAnimationsWithBlock:](v16, "_enumerateCoordinatingAnimationsWithBlock:", v37);
      if (!*((_BYTE *)v39 + 24))
      {
        v35 = (objc_class *)objc_opt_class();
        NSStringFromClass(v35);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBTransientOverlayPresentWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  self animation isnt switcher animation and doesn't have switcher animation as a child"), v36, self);

        _Block_object_dispose(&v38, 8);
        goto LABEL_11;
      }
      _Block_object_dispose(&v38, 8);
    }
    if (v7 && objc_msgSend(v7, "source") == 14)
    {
      v30 = (objc_class *)objc_opt_class();
      NSStringFromClass(v30);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTransientOverlayPresentWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  rotation"), v31, self);
LABEL_29:

      goto LABEL_11;
    }
  }
  else
  {
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "transientOverlayContext");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "transientOverlay");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "transientOverlayContext");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "transientOverlay");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v6, "isAnalogousToEntity:", v7)
      || (objc_msgSend(v4, "transientOverlayContext"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "transitionType"),
          v13,
          v14 != 1))
    {
      v21 = (objc_class *)objc_opt_class();
      NSStringFromClass(v21);
      v16 = (SBUIAnimationController *)objc_claimAutoreleasedReturnValue();
      -[SBTransientOverlayPresentWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  _animation is nil"), v16, self);
LABEL_11:
      v17 = 0;
      goto LABEL_12;
    }
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (SBUIAnimationController *)objc_claimAutoreleasedReturnValue();
    -[SBTransientOverlayPresentWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> interruptible because:  next request is to dismiss the same transient overlay we're currently presenting"), v16, self);
  }
  v17 = 1;
LABEL_12:

LABEL_20:
  return v17;
}

void __82__SBTransientOverlayPresentWorkspaceTransaction_canInterruptForTransitionRequest___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  char isKindOfClass;

  v5 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    *a3 = 1;
  }
}

- (void)_willInterruptWithReason:(id)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBTransientOverlayPresentWorkspaceTransaction;
  -[SBTransientOverlayPresentWorkspaceTransaction _willInterruptWithReason:](&v5, sel__willInterruptWithReason_, a3);
  -[SBWorkspaceTransaction layoutStateTransitionCoordinator](self, "layoutStateTransitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isTransitioning"))
  {
    objc_msgSend(v4, "willEndTransition");
    objc_msgSend(v4, "endTransitionWithError:", 0);
  }

}

- (void)animationControllerDidFinishAnimation:(id)a3
{
  -[SBTransientOverlayPresentWorkspaceTransaction _performStandardPresentationAnimated:](self, "_performStandardPresentationAnimated:", 0);
  -[SBTransientOverlayPresentWorkspaceTransaction removeMilestone:](self, "removeMilestone:", CFSTR("SBTransientOverlayPresentWorkspaceTransactionMilestoneAnimation"));
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
    if (-[SBTransientOverlayPresentWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))-[SBTransientOverlayPresentWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("%@"), v7);
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

- (void)_performStandardPresentationAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void (**v10)(_QWORD);
  void *v11;
  void *v12;
  SBMutableTransientOverlayPresentationRequest *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void (**v17)(_QWORD);
  int v18;
  void *v19;
  _QWORD v20[5];
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;
  _QWORD v33[6];

  v3 = a3;
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "transientOverlayContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "transientOverlay");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentationManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __86__SBTransientOverlayPresentWorkspaceTransaction__performStandardPresentationAnimated___block_invoke;
  v33[3] = &unk_1E8E9DED8;
  v33[4] = self;
  v10 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v33);
  if (-[SBTransientOverlayPresentWorkspaceTransaction isInterrupted](self, "isInterrupted")
    || !v8
    || (objc_msgSend(v9, "isPresentingViewController:", v8) & 1) != 0)
  {
    v10[2](v10);
  }
  else
  {
    -[SBWorkspaceTransaction windowScene](self, "windowScene");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "switcherController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = v12;
    v18 = objc_msgSend(v12, "isAcquiredTransientOverlayViewController:", v8);
    if (v18)
    {
      objc_msgSend(v8, "beginIgnoringAppearanceUpdates");
      objc_msgSend(v8, "beginIgnoringContentOverlayInsetUpdates");
      objc_msgSend(v12, "removeAcquiredTransientOverlayViewController:", v8);
    }
    v13 = -[SBTransientOverlayPresentationRequest initWithViewController:]([SBMutableTransientOverlayPresentationRequest alloc], "initWithViewController:", v8);
    -[SBMutableTransientOverlayPresentationRequest setAnimated:](v13, "setAnimated:", v3);
    -[SBMutableTransientOverlayPresentationRequest setShouldDismissSiri:](v13, "setShouldDismissSiri:", objc_msgSend(v6, "shouldDismissSiriUponPresentation"));
    objc_msgSend(v6, "originatingProcess");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMutableTransientOverlayPresentationRequest setOriginatingProcess:](v13, "setOriginatingProcess:", v14);

    objc_msgSend(v6, "windowScene");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBMutableTransientOverlayPresentationRequest setWindowScene:](v13, "setWindowScene:", v15);

    v29 = 0;
    v30 = &v29;
    v31 = 0x2020000000;
    v32 = 0;
    v25 = 0;
    v26 = &v25;
    v27 = 0x2020000000;
    v28 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __86__SBTransientOverlayPresentWorkspaceTransaction__performStandardPresentationAnimated___block_invoke_2;
    v21[3] = &unk_1E8E9E068;
    v23 = &v25;
    v17 = v10;
    v22 = v17;
    v24 = &v29;
    -[SBMutableTransientOverlayPresentationRequest setCompletionHandler:](v13, "setCompletionHandler:", v21);
    objc_msgSend(v9, "performPresentationRequest:", v13);
    if (!*((_BYTE *)v30 + 24))
      *((_BYTE *)v26 + 24) = 1;
    if (v18)
    {
      objc_msgSend(v8, "endIgnoringAppearanceUpdates");
      objc_msgSend(v8, "endIgnoringContentOverlayInsetUpdates");
    }
    v20[0] = v16;
    v20[1] = 3221225472;
    v20[2] = __86__SBTransientOverlayPresentWorkspaceTransaction__performStandardPresentationAnimated___block_invoke_3;
    v20[3] = &unk_1E8E9E090;
    v20[4] = self;
    -[SBTransientOverlayPresentWorkspaceTransaction _enumerateObserversWithBlock:](self, "_enumerateObserversWithBlock:", v20);
    if (*((_BYTE *)v30 + 24))
      v17[2](v17);

    _Block_object_dispose(&v25, 8);
    _Block_object_dispose(&v29, 8);

  }
}

void __86__SBTransientOverlayPresentWorkspaceTransaction__performStandardPresentationAnimated___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "layoutStateTransitionCoordinator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "isTransitioning"))
  {
    objc_msgSend(v2, "willEndTransition");
    objc_msgSend(v2, "endTransitionWithError:", 0);
  }
  objc_msgSend(*(id *)(a1 + 32), "removeMilestone:", CFSTR("SBTransientOverlayPresentWorkspaceTransactionMilestonePresentationCompletion"));

}

uint64_t __86__SBTransientOverlayPresentWorkspaceTransaction__performStandardPresentationAnimated___block_invoke_2(uint64_t result)
{
  uint64_t v1;

  v1 = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
    result = (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v1 + 48) + 8) + 24) = 1;
  return result;
}

void __86__SBTransientOverlayPresentWorkspaceTransaction__performStandardPresentationAnimated___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "transientOverlayPresentWorkspaceTransactionDidPerformPresentation:", *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_eventBufferingAssertion, 0);
  objc_storeStrong((id *)&self->_displayLayoutTransitionAssertion, 0);
  objc_storeStrong((id *)&self->_animation, 0);
}

@end
