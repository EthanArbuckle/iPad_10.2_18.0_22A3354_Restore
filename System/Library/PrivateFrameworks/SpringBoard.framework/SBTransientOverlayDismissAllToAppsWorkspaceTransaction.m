@implementation SBTransientOverlayDismissAllToAppsWorkspaceTransaction

- (SBTransientOverlayDismissAllToAppsWorkspaceTransaction)initWithTransitionRequest:(id)a3
{
  id v4;
  SBTransientOverlayDismissAllToAppsWorkspaceTransaction *v5;
  SBTransientOverlayDismissAllToAppsWorkspaceTransaction *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SBTransientOverlayDismissAllToAppsWorkspaceTransaction;
  v5 = -[SBToAppsWorkspaceTransaction initWithTransitionRequest:](&v11, sel_initWithTransitionRequest_, v4);
  v6 = v5;
  if (v5)
  {
    -[SBToAppsWorkspaceTransaction _setShouldSerialDismissOverlays:](v5, "_setShouldSerialDismissOverlays:", 0);
    if (SBMainWorkspaceTransitionSourceIsUserEventDriven(objc_msgSend(v4, "source")))
    {
      -[SBToAppsWorkspaceTransaction layoutTransaction](v6, "layoutTransaction");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "options");

      -[SBToAppsWorkspaceTransaction layoutTransaction](v6, "layoutTransaction");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setOptions:", v8 | 2);

    }
  }

  return v6;
}

- (void)dealloc
{
  BSInvalidatable *pipWindowLevelOverrideAssertionInvalidatable;
  objc_super v4;

  -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](self->_autoPIPTransaction, "setCompletionBlock:", 0);
  -[BSInvalidatable invalidate](self->_pipWindowLevelOverrideAssertionInvalidatable, "invalidate");
  pipWindowLevelOverrideAssertionInvalidatable = self->_pipWindowLevelOverrideAssertionInvalidatable;
  self->_pipWindowLevelOverrideAssertionInvalidatable = 0;

  v4.receiver = self;
  v4.super_class = (Class)SBTransientOverlayDismissAllToAppsWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction dealloc](&v4, sel_dealloc);
}

- (void)_begin
{
  unint64_t v3;
  SBDismissOverlaysAnimationController *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBTransientOverlayDismissAllToAppsWorkspaceTransaction;
  -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _begin](&v6, sel__begin);
  -[SBToAppsWorkspaceTransaction activateApplications](self, "activateApplications");
  v3 = -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _serialOverlayPreDismissalOptions](self, "_serialOverlayPreDismissalOptions");
  if (+[SBDismissOverlaysAnimationController willDismissOverlaysForDismissOptions:](SBDismissOverlaysAnimationController, "willDismissOverlaysForDismissOptions:", v3))
  {
    -[SBToAppsWorkspaceTransaction _delayTransitionCompletionForRequester:](self, "_delayTransitionCompletionForRequester:", CFSTR("_SBTransientOverlayDismissAllToAppsWorkspaceTransactionDelayRequesterDismissOverlays"));
    v4 = -[SBDismissOverlaysAnimationController initWithTransitionContextProvider:options:]([SBDismissOverlaysAnimationController alloc], "initWithTransitionContextProvider:options:", self->super.super.super._transitionRequest, v3);
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __64__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__begin__block_invoke;
    v5[3] = &unk_1E8E9E980;
    v5[4] = self;
    -[SBDismissOverlaysAnimationController setCompletionBlock:](v4, "setCompletionBlock:", v5);
    -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v4, 0);

  }
  else
  {
    -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _handleDismissOverlaysCompletion](self, "_handleDismissOverlaysCompletion");
  }
}

uint64_t __64__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__begin__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_handleDismissOverlaysCompletion");
  return objc_msgSend(*(id *)(a1 + 32), "_stopDelayingTransitionCompletionForRequester:", CFSTR("_SBTransientOverlayDismissAllToAppsWorkspaceTransactionDelayRequesterDismissOverlays"));
}

- (void)_didComplete
{
  BSInvalidatable *pipWindowLevelOverrideAssertionInvalidatable;
  void *v4;
  NSArray *switcherTransitioningTransientOverlayViewControllers;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[SBToAppsWorkspaceTransaction _clearAnimation](self, "_clearAnimation");
  -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](self->_autoPIPTransaction, "setCompletionBlock:", 0);
  -[BSInvalidatable invalidate](self->_pipWindowLevelOverrideAssertionInvalidatable, "invalidate");
  pipWindowLevelOverrideAssertionInvalidatable = self->_pipWindowLevelOverrideAssertionInvalidatable;
  self->_pipWindowLevelOverrideAssertionInvalidatable = 0;

  v4 = (void *)-[NSArray copy](self->_switcherTransitioningTransientOverlayViewControllers, "copy");
  switcherTransitioningTransientOverlayViewControllers = self->_switcherTransitioningTransientOverlayViewControllers;
  self->_switcherTransitioningTransientOverlayViewControllers = 0;

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v11, "endIgnoringAppearanceUpdates");
        objc_msgSend(v11, "endIgnoringContentOverlayInsetUpdates");
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBKeyboardFocusArbitrationReason transientOverlayDismissAllToAppsWorkspaceTransactionDidComplete](SBKeyboardFocusArbitrationReason, "transientOverlayDismissAllToAppsWorkspaceTransactionDidComplete");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "requestArbitrationForSBWindowScene:forReason:", v13, v14);

  v15.receiver = self;
  v15.super_class = (Class)SBTransientOverlayDismissAllToAppsWorkspaceTransaction;
  -[SBToAppsWorkspaceTransaction _didComplete](&v15, sel__didComplete);

}

- (unint64_t)_serialOverlayPreDismissalOptions
{
  void *v2;
  uint64_t v3;
  unint64_t v4;

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "source");

  if (v3 <= 5)
  {
    if (v3 != 2)
      return v3 == 5;
    return 32;
  }
  if (v3 == 6)
    return 32;
  v4 = 2;
  if (v3 != 33)
    v4 = 0;
  if (v3 == 16)
    return 16;
  else
    return v4;
}

- (unint64_t)_concurrentOverlayDismissalOptions
{
  void *v2;
  uint64_t v3;

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "source");

  if (v3 == 2)
    return 9;
  else
    return 0;
}

- (id)_setupAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  if (self->_isUsingSwitcherAnimation)
  {
    -[SBWorkspaceTransaction windowScene](self, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "switcherController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "animationControllerForTransitionRequest:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (BOOL)_shouldAnimateTransition
{
  void *v2;
  void *v3;
  char v4;

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "transientOverlayContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isAnimated");

  return v4;
}

- (BOOL)_shouldResignActiveForAnimation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBTransientOverlayDismissAllToAppsWorkspaceTransaction;
  if (!-[SBToAppsWorkspaceTransaction _shouldResignActiveForAnimation](&v10, sel__shouldResignActiveForAnimation))
    return 0;
  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transientOverlayContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transientOverlay");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredSceneDeactivationReasonValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7 != 0;

  return v8;
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
  int v11;
  objc_class *v12;
  void *v13;
  void *v14;
  char v15;
  objc_class *v16;
  void *v17;
  uint64_t v18;
  objc_class *v19;
  objc_class *v20;
  BOOL v21;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  int v31;
  objc_class *v32;
  void *v33;
  objc_class *v34;

  v4 = a3;
  v5 = objc_opt_class();
  SBSafeCast(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copyMainWorkspaceTransitionRequest");
  if (!-[SBTransientOverlayDismissAllToAppsWorkspaceTransaction isInterrupted](self, "isInterrupted"))
  {
    objc_msgSend(v7, "applicationContext");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isBackground");

    if (v11)
    {
      v12 = (objc_class *)objc_opt_class();
      NSStringFromClass(v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  request is for background activation"), v9, self);
      goto LABEL_13;
    }
    +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isInSetupMode") & 1) != 0)
    {
      +[SBSetupManager sharedInstance](SBSetupManager, "sharedInstance");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isInSetupModeReadyToExit");

      if ((v15 & 1) == 0)
      {
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because: we are in setup mode"), v9, self);
        goto LABEL_13;
      }
    }
    else
    {

    }
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "source");

    if (v18 == 31)
    {
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because: we are in a startup transition"), v9, self);
      goto LABEL_13;
    }
    if (!self->_isUsingSwitcherAnimation && self->_beganDismissingTransientOverlays)
    {
      -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "transientOverlayContext");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "transientOverlay");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "transientOverlayContext");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "transientOverlay");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v9, "isAnalogousToEntity:", v26))
      {
        objc_msgSend(v4, "transientOverlayContext");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = objc_msgSend(v27, "transitionType");

        if (!v28)
        {
          v34 = (objc_class *)objc_opt_class();
          NSStringFromClass(v34);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> interruptible because:  next request is to present the same transient overlay we're currently dismissing"), v33, self);
          goto LABEL_24;
        }
      }
      objc_msgSend(v9, "viewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v4, "eventLabel");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = objc_msgSend(v30, "isEqualToString:", CFSTR("SBSpotlightTransientOverlayInteractiveGestureEventLabel"));

        if (v31)
        {
          v32 = (objc_class *)objc_opt_class();
          NSStringFromClass(v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> interruptible because:  we're dismissing the spotlight overlay and the next request is to present it interactively"), v33, self);
LABEL_24:

          v21 = 1;
          goto LABEL_14;
        }
      }
      else
      {

      }
    }
    v20 = (objc_class *)objc_opt_class();
    NSStringFromClass(v20);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  other"), v9, self);
    goto LABEL_13;
  }
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _logForInterruptAttemptReason:](self, "_logForInterruptAttemptReason:", CFSTR("<%@:%p> not interruptible because:  already interrupted"), v9, self);
LABEL_13:
  v21 = 0;
LABEL_14:

  return v21;
}

- (void)_handleDismissOverlaysCompletion
{
  void *v3;
  SBAutoPIPWorkspaceTransaction *autoPIPTransaction;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  unint64_t v11;
  objc_class *v12;
  void *v13;
  BSInvalidatable *v14;
  BSInvalidatable *pipWindowLevelOverrideAssertionInvalidatable;
  SBAutoPIPWorkspaceTransaction *v16;
  void *v17;
  SBAutoPIPWorkspaceTransaction *v18;
  SBAutoPIPWorkspaceTransaction *v19;
  void *v20;
  SBAutoPIPWorkspaceTransaction *v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id location;

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBToAppsWorkspaceTransaction isGoingToMainSwitcher](self, "isGoingToMainSwitcher")
    || !+[SBAutoPIPWorkspaceTransaction shouldAutoPIPEnteringBackgroundForRequest:](SBAutoPIPWorkspaceTransaction, "shouldAutoPIPEnteringBackgroundForRequest:", v3))
  {
    -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _performDismissal](self, "_performDismissal");
  }
  else
  {
    -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](self->_autoPIPTransaction, "setCompletionBlock:", 0);
    if (-[SBAutoPIPWorkspaceTransaction isRunning](self->_autoPIPTransaction, "isRunning"))
      -[SBAutoPIPWorkspaceTransaction interruptWithReason:](self->_autoPIPTransaction, "interruptWithReason:", CFSTR("NewTransition"));
    autoPIPTransaction = self->_autoPIPTransaction;
    self->_autoPIPTransaction = 0;

    objc_msgSend((id)SBApp, "windowSceneManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayIdentity");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "windowSceneForDisplayIdentity:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v7, "pictureInPictureManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transientOverlayPresenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "topmostWindowLevel");
    v11 = (unint64_t)(v10 + 1.0);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "acquireWindowLevelOverrideAssertionForControllerWithContentType:toWindowLevel:withReason:identifier:", 0, v11, 6, v13);
    v14 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    pipWindowLevelOverrideAssertionInvalidatable = self->_pipWindowLevelOverrideAssertionInvalidatable;
    self->_pipWindowLevelOverrideAssertionInvalidatable = v14;

    v16 = [SBAutoPIPWorkspaceTransaction alloc];
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[SBAutoPIPWorkspaceTransaction initWithTransitionRequest:](v16, "initWithTransitionRequest:", v17);
    v19 = self->_autoPIPTransaction;
    self->_autoPIPTransaction = v18;

    -[SBAutoPIPWorkspaceTransaction entityToPIP](self->_autoPIPTransaction, "entityToPIP");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      -[SBToAppsWorkspaceTransaction _delayTransitionCompletionForRequester:](self, "_delayTransitionCompletionForRequester:", CFSTR("_SBTransientOverlayDismissAllToAppsWorkspaceTransactionDelayRequesterAutoPIP"));
      objc_initWeak(&location, self);
      v21 = self->_autoPIPTransaction;
      v22[0] = MEMORY[0x1E0C809B0];
      v22[1] = 3221225472;
      v22[2] = __90__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__handleDismissOverlaysCompletion__block_invoke;
      v22[3] = &unk_1E8EA1598;
      objc_copyWeak(&v24, &location);
      v23 = v20;
      -[SBAutoPIPWorkspaceTransaction setCompletionBlock:](v21, "setCompletionBlock:", v22);
      -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction addChildTransaction:](self, "addChildTransaction:", self->_autoPIPTransaction);

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }

  }
}

void __90__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__handleDismissOverlaysCompletion__block_invoke(uint64_t a1, int a2)
{
  id WeakRetained;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v8 = WeakRetained;
    if (a2)
    {
      v5 = objc_opt_class();
      SBSafeCast(v5, *(void **)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "viewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handlePictureInPictureDidBegin");

    }
    objc_msgSend(v8, "_performDismissal");
    objc_msgSend(v8, "_stopDelayingTransitionCompletionForRequester:", CFSTR("_SBTransientOverlayDismissAllToAppsWorkspaceTransactionDelayRequesterAutoPIP"));
    WeakRetained = v8;
  }

}

- (void)_performDismissal
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SBWorkspaceTransientOverlay *v11;
  void *v12;
  _BOOL4 v13;
  uint64_t v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  void *v19;
  char v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  void (**v28)(_QWORD);
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id v34;
  id *v35;
  id location;
  id *p_location;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  void *v41;
  _QWORD v42[4];
  id v43;
  SBTransientOverlayDismissAllToAppsWorkspaceTransaction *v44;
  BOOL v45;

  -[SBToAppsWorkspaceTransaction _delayTransitionCompletionForRequester:](self, "_delayTransitionCompletionForRequester:", CFSTR("_SBTransientOverlayDismissAllToAppsWorkspaceTransactionDelayRequesterDismissal"));
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationContext");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)SBApp, "windowSceneManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "displayIdentity");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "windowSceneForDisplayIdentity:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "transientOverlayPresenter");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "topmostPresentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10
    && -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _shouldUseSwitcherDismissalAnimationForTransientOverlayViewController:](self, "_shouldUseSwitcherDismissalAnimationForTransientOverlayViewController:", v10))
  {
    v11 = -[SBWorkspaceTransientOverlay initWithViewController:]([SBWorkspaceTransientOverlay alloc], "initWithViewController:", v10);
    objc_msgSend(v4, "appLayoutForWorkspaceTransientOverlay:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12 != 0;

  }
  else
  {
    v13 = 0;
  }
  self->_isUsingSwitcherAnimation = v13;
  v14 = MEMORY[0x1E0C809B0];
  v42[0] = MEMORY[0x1E0C809B0];
  v42[1] = 3221225472;
  v42[2] = __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke;
  v42[3] = &unk_1E8E9EE00;
  v15 = v5;
  v45 = v13;
  v43 = v15;
  v44 = self;
  v16 = (void (**)(_QWORD))MEMORY[0x1D17E5550](v42);
  if (v13)
  {
    location = 0;
    p_location = &location;
    v38 = 0x3032000000;
    v39 = __Block_byref_object_copy__45;
    v40 = __Block_byref_object_dispose__45;
    v41 = 0;
    v32[0] = v14;
    v32[1] = 3221225472;
    v32[2] = __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_39;
    v32[3] = &unk_1E8EA5348;
    v33 = v4;
    v34 = v9;
    v35 = &location;
    objc_msgSend(v33, "enumerateTransientOverlayViewControllersUsingBlock:", v32);
    objc_storeStrong((id *)&self->_switcherTransitioningTransientOverlayViewControllers, p_location[5]);
    v16[2](v16);

    _Block_object_dispose(&location, 8);
    v17 = v41;
  }
  else
  {
    v25 = v4;
    objc_msgSend(v26, "previousEntities");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "entities");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v18, "isEqualToSet:", v19);

    if ((v20 & 1) == 0)
    {
      -[SBToAppsWorkspaceTransaction _delayTransitionCompletionForRequester:](self, "_delayTransitionCompletionForRequester:", CFSTR("SBTransientOverlayDismissToAppsSwitcherAlongsideAnimation"));
      objc_msgSend(v25, "animationControllerForTransitionRequest:", v15);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "completionBlock");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_initWeak(&location, self);
      v29[0] = v14;
      v29[1] = 3221225472;
      v29[2] = __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_2_44;
      v29[3] = &unk_1E8EA10C8;
      objc_copyWeak(&v31, &location);
      v24 = v23;
      v30 = v24;
      objc_msgSend(v22, "setCompletionBlock:", v29);
      -[SBTransientOverlayDismissAllToAppsWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v22, 0);
      v16[2](v16);

      objc_destroyWeak(&v31);
      objc_destroyWeak(&location);

      v4 = v25;
      goto LABEL_11;
    }
    objc_msgSend(v15, "applicationContext");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v14;
    v27[1] = 3221225472;
    v27[2] = __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_3;
    v27[3] = &unk_1E8E9F1C0;
    v28 = v16;
    v4 = v25;
    objc_msgSend(v25, "performTransitionWithContext:animated:completion:", v21, 0, v27);

    v17 = v28;
  }

LABEL_11:
}

void __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke(uint64_t a1)
{
  SBTransientOverlayDismissAllWorkspaceTransaction *v2;
  SBTransientOverlayDismissAllWorkspaceTransaction *v3;
  _QWORD v4[5];

  v2 = -[SBTransientOverlayDismissAllWorkspaceTransaction initWithTransitionRequest:]([SBTransientOverlayDismissAllWorkspaceTransaction alloc], "initWithTransitionRequest:", *(_QWORD *)(a1 + 32));
  v3 = v2;
  if (*(_BYTE *)(a1 + 48))
    -[SBTransientOverlayDismissAllWorkspaceTransaction setAnimatedOverride:](v2, "setAnimatedOverride:", 0);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_2;
  v4[3] = &unk_1E8E9E980;
  v4[4] = *(_QWORD *)(a1 + 40);
  -[SBTransientOverlayDismissAllWorkspaceTransaction setCompletionBlock:](v3, "setCompletionBlock:", v4);
  objc_msgSend(*(id *)(a1 + 40), "addChildTransaction:withSchedulingPolicy:", v3, 0);
  *(_BYTE *)(*(_QWORD *)(a1 + 40) + 345) = 1;

}

uint64_t __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_stopDelayingTransitionCompletionForRequester:", CFSTR("_SBTransientOverlayDismissAllToAppsWorkspaceTransactionDelayRequesterDismissal"));
}

void __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_39(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(*(id *)(a1 + 32), "isAcquiredTransientOverlayViewController:") & 1) == 0
    && objc_msgSend(*(id *)(a1 + 40), "isPresentingViewController:", v8))
  {
    objc_msgSend(v8, "beginIgnoringAppearanceUpdates");
    objc_msgSend(v8, "beginIgnoringContentOverlayInsetUpdates");
    v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    if (!v4)
    {
      v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

      v4 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    }
    objc_msgSend(v4, "addObject:", v8);
  }

}

uint64_t __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_2_44(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  uint64_t result;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_stopDelayingTransitionCompletionForRequester:", CFSTR("SBTransientOverlayDismissToAppsSwitcherAlongsideAnimation"));

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

uint64_t __75__SBTransientOverlayDismissAllToAppsWorkspaceTransaction__performDismissal__block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)_shouldUseSwitcherDismissalAnimationForTransientOverlayViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  BOOL v15;

  v4 = a3;
  -[SBWorkspaceTransaction windowScene](self, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "switcherController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && objc_msgSend(v6, "hasAppLayoutForTransientOverlayViewController:", v4))
  {
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "applicationContext");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_opt_class();
    objc_msgSend(v8, "layoutState");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_opt_class();
    objc_msgSend(v8, "previousLayoutState");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    SBSafeCast(v12, v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v11, "unlockedEnvironmentMode") == 2 || objc_msgSend(v14, "unlockedEnvironmentMode") == 2;
  }
  else
  {
    v15 = 0;
  }

  return v15;
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
    if (-[SBTransientOverlayDismissAllToAppsWorkspaceTransaction isAuditHistoryEnabled](self, "isAuditHistoryEnabled"))-[SBTransientOverlayDismissAllToAppsWorkspaceTransaction _addAuditHistoryItem:](self, "_addAuditHistoryItem:", CFSTR("%@"), v7);
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipWindowLevelOverrideAssertionInvalidatable, 0);
  objc_storeStrong((id *)&self->_autoPIPTransaction, 0);
  objc_storeStrong((id *)&self->_switcherTransitioningTransientOverlayViewControllers, 0);
}

@end
