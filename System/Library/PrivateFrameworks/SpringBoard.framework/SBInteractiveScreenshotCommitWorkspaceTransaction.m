@implementation SBInteractiveScreenshotCommitWorkspaceTransaction

- (SBInteractiveScreenshotCommitWorkspaceTransaction)initWithTransitionRequest:(id)a3 gestureSessionID:(id)a4
{
  id v6;
  SBInteractiveScreenshotCommitWorkspaceTransaction *v7;
  uint64_t v8;
  NSUUID *gestureSessionID;
  objc_super v11;

  v6 = a4;
  v11.receiver = self;
  v11.super_class = (Class)SBInteractiveScreenshotCommitWorkspaceTransaction;
  v7 = -[SBMainWorkspaceTransaction initWithTransitionRequest:](&v11, sel_initWithTransitionRequest_, a3);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copy");
    gestureSessionID = v7->_gestureSessionID;
    v7->_gestureSessionID = (NSUUID *)v8;

  }
  return v7;
}

- (void)_begin
{
  void *v3;
  float v4;
  double v5;
  NSTimer *v6;
  NSTimer *watchdogTimeoutTimer;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)SBInteractiveScreenshotCommitWorkspaceTransaction;
  -[SBInteractiveScreenshotCommitWorkspaceTransaction _begin](&v14, sel__begin);
  -[SBInteractiveScreenshotCommitWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("pendingCompletion"));
  objc_initWeak(&location, self);
  v3 = (void *)MEMORY[0x1E0C99E88];
  UIAnimationDragCoefficient();
  v5 = v4 * 5.0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __59__SBInteractiveScreenshotCommitWorkspaceTransaction__begin__block_invoke;
  v11 = &unk_1E8E9FA90;
  objc_copyWeak(&v12, &location);
  objc_msgSend(v3, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v8, v5);
  v6 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  watchdogTimeoutTimer = self->_watchdogTimeoutTimer;
  self->_watchdogTimeoutTimer = v6;

  -[SBInteractiveScreenshotCommitWorkspaceTransaction _updateState](self, "_updateState", v8, v9, v10, v11);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __59__SBInteractiveScreenshotCommitWorkspaceTransaction__begin__block_invoke(uint64_t a1, void *a2)
{
  _QWORD *WeakRetained;
  void *v4;
  id v5;

  v5 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained && (id)WeakRetained[27] == v5)
    objc_msgSend(WeakRetained, "_handleWatchdogTimeout");

}

- (void)transientOverlayPresentWorkspaceTransactionDidPerformPresentation:(id)a3
{
  self->_hasBeganPresentation = 1;
  -[SBInteractiveScreenshotCommitWorkspaceTransaction _updateState](self, "_updateState", a3);
}

- (void)setHasFinishedFlashAnimation:(BOOL)a3
{
  if (self->_hasFinishedFlashAnimation != a3)
  {
    self->_hasFinishedFlashAnimation = a3;
    -[SBInteractiveScreenshotCommitWorkspaceTransaction _updateState](self, "_updateState");
  }
}

- (void)setHasFinishedSettlingAnimation:(BOOL)a3
{
  if (self->_hasFinishedSettlingAnimation != a3)
  {
    self->_hasFinishedSettlingAnimation = a3;
    -[SBInteractiveScreenshotCommitWorkspaceTransaction _updateState](self, "_updateState");
  }
}

- (void)setScreenshotMarkupTransientOverlayViewController:(id)a3
{
  id v5;
  id v6;

  v5 = a3;
  if (v5 && !self->_screenshotMarkupTransientOverlayViewController)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_screenshotMarkupTransientOverlayViewController, a3);
    -[SBInteractiveScreenshotCommitWorkspaceTransaction _updateState](self, "_updateState");
    v5 = v6;
  }

}

- (void)_handleWatchdogTimeout
{
  self->_hasWatchdogExpired = 1;
  -[SBInteractiveScreenshotCommitWorkspaceTransaction _updateState](self, "_updateState");
}

- (void)_updateState
{
  id WeakRetained;
  void *v5;
  int *v6;
  NSTimer *watchdogTimeoutTimer;
  NSTimer *v8;
  SBWorkspaceTransientOverlay *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SBWorkspaceTransientOverlay *v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  _QWORD v18[4];
  SBWorkspaceTransientOverlay *v19;
  id v20;

  WeakRetained = objc_loadWeakRetained((id *)&self->_interactiveScreenshotCommitDelegate);
  v5 = WeakRetained;
  v6 = &OBJC_IVAR___SBInteractiveScreenshotGestureRootViewController__flashView;
  if (self->_hasFinishedPresentation && self->_hasFinishedFlashAnimation || self->_hasWatchdogExpired)
  {
    if (-[SBInteractiveScreenshotCommitWorkspaceTransaction isWaitingForMilestone:](self, "isWaitingForMilestone:", CFSTR("pendingCompletion")))
    {
      objc_msgSend(v5, "interactiveScreenshotCommitWorkspaceTransactionRequestsGestureWindowInvalidation:", self);
      -[SBInteractiveScreenshotCommitWorkspaceTransaction removeMilestone:](self, "removeMilestone:", CFSTR("pendingCompletion"));
    }
  }
  else if (self->_hasFinishedSettlingAnimation)
  {
    if (self->_hasBeganPresentation)
    {
      if (!self->_hasRequestedPlaceholderChromeRemoval)
      {
        self->_hasRequestedPlaceholderChromeRemoval = 1;
        objc_msgSend(WeakRetained, "interactiveScreenshotCommitWorkspaceTransactionRequestsPlaceholderChromeRemoval:", self);
      }
    }
    else if (self->_screenshotMarkupTransientOverlayViewController && !self->_hasQueuedPresentationTransaction)
    {
      self->_hasQueuedPresentationTransaction = 1;
      v9 = -[SBWorkspaceTransientOverlay initWithViewController:]([SBWorkspaceTransientOverlay alloc], "initWithViewController:", self->_screenshotMarkupTransientOverlayViewController);
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "createRequestWithOptions:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEventLabelWithFormat:", CFSTR("PresentScreenshotMarkupTransientOverlay"));
      v12 = MEMORY[0x1E0C809B0];
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __65__SBInteractiveScreenshotCommitWorkspaceTransaction__updateState__block_invoke;
      v18[3] = &unk_1E8EB1810;
      v13 = v9;
      v19 = v13;
      v14 = v10;
      v20 = v14;
      objc_msgSend(v11, "modifyTransientOverlayContext:", v18);
      objc_msgSend(v14, "transactionForTransitionRequest:", v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBInteractiveScreenshotCommitWorkspaceTransaction.m"), 127, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[transaction isKindOfClass:[SBTransientOverlayPresentWorkspaceTransaction class]]"));

        v6 = &OBJC_IVAR___SBInteractiveScreenshotGestureRootViewController__flashView;
      }
      objc_msgSend(v15, "addObserver:", self);
      v17[0] = v12;
      v17[1] = 3221225472;
      v17[2] = __65__SBInteractiveScreenshotCommitWorkspaceTransaction__updateState__block_invoke_2;
      v17[3] = &unk_1E8E9E980;
      v17[4] = self;
      objc_msgSend(v15, "setCompletionBlock:", v17);
      -[SBInteractiveScreenshotCommitWorkspaceTransaction addChildTransaction:withSchedulingPolicy:](self, "addChildTransaction:withSchedulingPolicy:", v15, 0);

    }
  }
  if (*((_BYTE *)&self->super.super.super.super.super.isa + v6[549]) || self->_hasWatchdogExpired)
  {
    watchdogTimeoutTimer = self->_watchdogTimeoutTimer;
    self->_watchdogTimeoutTimer = 0;
    v8 = watchdogTimeoutTimer;

    -[NSTimer invalidate](v8, "invalidate");
  }

}

void __65__SBInteractiveScreenshotCommitWorkspaceTransaction__updateState__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  objc_msgSend(v3, "setTransitionType:", 0);
  objc_msgSend(v3, "setTransientOverlay:", *(_QWORD *)(a1 + 32));
  objc_msgSend(v3, "setAnimated:", 1);
  objc_msgSend(*(id *)(a1 + 40), "mainWindowScene");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWindowScene:", v4);

}

uint64_t __65__SBInteractiveScreenshotCommitWorkspaceTransaction__updateState__block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 209) = 1;
  return objc_msgSend(*(id *)(a1 + 32), "_updateState");
}

- (NSUUID)gestureSessionID
{
  return self->_gestureSessionID;
}

- (BOOL)hasFinishedFlashAnimation
{
  return self->_hasFinishedFlashAnimation;
}

- (BOOL)hasFinishedSettlingAnimation
{
  return self->_hasFinishedSettlingAnimation;
}

- (SBTransientOverlayViewController)screenshotMarkupTransientOverlayViewController
{
  return self->_screenshotMarkupTransientOverlayViewController;
}

- (SBInteractiveScreenshotCommitWorkspaceTransactionDelegate)interactiveScreenshotCommitDelegate
{
  return (SBInteractiveScreenshotCommitWorkspaceTransactionDelegate *)objc_loadWeakRetained((id *)&self->_interactiveScreenshotCommitDelegate);
}

- (void)setInteractiveScreenshotCommitDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactiveScreenshotCommitDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_interactiveScreenshotCommitDelegate);
  objc_storeStrong((id *)&self->_screenshotMarkupTransientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_gestureSessionID, 0);
  objc_storeStrong((id *)&self->_watchdogTimeoutTimer, 0);
}

@end
