@implementation SBModalUIFluidDismissGestureWorkspaceTransaction

- (SBModalUIFluidDismissGestureWorkspaceTransaction)initWithTransitionRequest:(id)a3 windowScene:(id)a4 dismissalType:(int64_t)a5 initiatedFromBottomEdge:(BOOL)a6
{
  id v10;
  SBModalUIFluidDismissGestureWorkspaceTransaction *v11;
  SBModalUIFluidDismissGestureWorkspaceTransaction *v12;
  uint64_t v13;
  SBAssistantSceneControlling *assistantController;
  uint64_t v15;
  SBAppSwitcherSettings *settings;
  objc_super v18;

  v10 = a4;
  v18.receiver = self;
  v18.super_class = (Class)SBModalUIFluidDismissGestureWorkspaceTransaction;
  v11 = -[SBSystemGestureWorkspaceTransaction initWithTransitionRequest:](&v18, sel_initWithTransitionRequest_, a3);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_windowScene, v10);
    objc_msgSend(v10, "assistantController");
    v13 = objc_claimAutoreleasedReturnValue();
    assistantController = v12->_assistantController;
    v12->_assistantController = (SBAssistantSceneControlling *)v13;

    v12->_dismissalType = a5;
    v12->_initiatedFromBottomEdge = a6;
    +[SBAppSwitcherDomain rootSettings](SBAppSwitcherDomain, "rootSettings");
    v15 = objc_claimAutoreleasedReturnValue();
    settings = v12->_settings;
    v12->_settings = (SBAppSwitcherSettings *)v15;

    v12->_animateGestureCancelationOrFailure = 0;
  }

  return v12;
}

- (BOOL)canInterruptForTransitionRequest:(id)a3
{
  return 1;
}

- (void)_didInterruptWithReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v4 = a3;
  -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  v7.receiver = self;
  v7.super_class = (Class)SBModalUIFluidDismissGestureWorkspaceTransaction;
  -[SBModalUIFluidDismissGestureWorkspaceTransaction _didInterruptWithReason:](&v7, sel__didInterruptWithReason_, v4);

}

- (void)_begin
{
  int64_t dismissalType;
  id WeakRetained;
  SBTransientOverlayPresenting *v5;
  SBTransientOverlayPresenting *transientOverlayPresenter;
  objc_class *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  CGFloat v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  objc_super v30;
  CGRect v31;

  dismissalType = self->_dismissalType;
  if ((unint64_t)(dismissalType - 2) >= 4)
  {
    if (!dismissalType)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalUIFluidDismissGestureWorkspaceTransaction.m"), 130, CFSTR("Invalid dismissal type for dismiss gesture workspace transaction"));
      goto LABEL_11;
    }
    if (dismissalType != 1)
      goto LABEL_14;
    -[SBAssistantSceneControlling assistantRootViewController](self->_assistantController, "assistantRootViewController");
    v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v8 = 256;
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "transientOverlayPresenter");
    v5 = (SBTransientOverlayPresenting *)objc_claimAutoreleasedReturnValue();
    transientOverlayPresenter = self->_transientOverlayPresenter;
    self->_transientOverlayPresenter = v5;

    -[SBTransientOverlayPresenting viewControllerForGestureDismissal](self->_transientOverlayPresenter, "viewControllerForGestureDismissal");
    v7 = (objc_class *)objc_claimAutoreleasedReturnValue();
    v8 = 272;
  }
  v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8);
  *(Class *)((char *)&self->super.super.super.super.super.super.isa + v8) = v7;

  if (!*(Class *)((char *)&self->super.super.super.super.super.super.isa + v8))
    goto LABEL_12;
  -[SBModalUIFluidDismissGestureWorkspaceTransaction addMilestone:](self, "addMilestone:", CFSTR("SBModalUIFluidDismissGestureMilestone"));
  -[SBModalUIFluidDismissGestureWorkspaceTransaction _viewForGesture](self, "_viewForGesture");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  _UISystemGestureLocationInView();
  v13 = v12;
  v15 = v14;

  objc_msgSend(v10, "bounds");
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;
  v20 = CGRectGetHeight(v31);
  if (v15 >= v20)
    v15 = v20;
  UIRectGetCenter();
  self->_dismissingViewTouchOffset.x = v13 - v21;
  self->_dismissingViewTouchOffset.y = v15 - v22;
  self->_originalBounds.origin.x = x;
  self->_originalBounds.origin.y = y;
  self->_originalBounds.size.width = width;
  self->_originalBounds.size.height = height;
  UIRectGetCenter();
  self->_originalCenter.x = v23;
  self->_originalCenter.y = v24;
LABEL_11:

LABEL_12:
  if (self->_dismissalType == 2)
  {
    +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBWorkspaceTransaction transitionRequest](self, "transitionRequest");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "displayIdentity");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "startSuppressingKeyboardWithReason:predicate:displayIdentity:", CFSTR("SBModalUIFluidDismissGestureKeyboardSuppressionReason"), 0, v28);

  }
LABEL_14:
  -[SBModalUIFluidDismissGestureWorkspaceTransaction _dismissalFeedbackGenerator](self, "_dismissalFeedbackGenerator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "activateWithCompletionBlock:", 0);

  v30.receiver = self;
  v30.super_class = (Class)SBModalUIFluidDismissGestureWorkspaceTransaction;
  -[SBSystemGestureWorkspaceTransaction _begin](&v30, sel__begin);
}

- (void)_didComplete
{
  void *v3;
  void *v4;
  SBWindowSceneStatusBarSettingsAssertion *statusBarAssertion;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBModalUIFluidDismissGestureWorkspaceTransaction;
  -[SBSystemGestureWorkspaceTransaction _didComplete](&v6, sel__didComplete);
  -[SBModalUIFluidDismissGestureWorkspaceTransaction _dismissalFeedbackGenerator](self, "_dismissalFeedbackGenerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivate");

  if (self->_dismissalType == 2)
  {
    +[SBKeyboardSuppressionManager sharedInstance](SBKeyboardSuppressionManager, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stopSuppressingKeyboardWithReason:", CFSTR("SBModalUIFluidDismissGestureKeyboardSuppressionReason"));

  }
  -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_statusBarAssertion, "invalidate");
  statusBarAssertion = self->_statusBarAssertion;
  self->_statusBarAssertion = 0;

}

- (BOOL)_canBeInterrupted
{
  return !self->_isDismissing;
}

- (void)systemGestureStateChanged:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (-[SBModalUIFluidDismissGestureWorkspaceTransaction isRunning](self, "isRunning")
    && !self->_isDismissing)
  {
    v4 = objc_msgSend(v5, "state");
    if (v4 == 2)
    {
      -[SBModalUIFluidDismissGestureWorkspaceTransaction _updateWithGesture:](self, "_updateWithGesture:", v5);
    }
    else if (v4 == 1)
    {
      -[SBModalUIFluidDismissGestureWorkspaceTransaction _beginWithGesture:](self, "_beginWithGesture:", v5);
    }
    else
    {
      -[SBModalUIFluidDismissGestureWorkspaceTransaction _finishWithGesture:](self, "_finishWithGesture:", v5);
    }
  }

}

- (void)_finishWithCompletionType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBModalUIFluidDismissGestureWorkspaceTransaction;
  -[SBSystemGestureWorkspaceTransaction _finishWithCompletionType:](&v8, sel__finishWithCompletionType_);
  if (a3 == 1)
  {
    +[SBKeyboardFocusCoordinator sharedInstance](SBKeyboardFocusCoordinator, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBModalUIFluidDismissGestureWorkspaceTransaction windowScene](self, "windowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[SBKeyboardFocusArbitrationReason modalUIFluidDismissGestureDidFinish](SBKeyboardFocusArbitrationReason, "modalUIFluidDismissGestureDidFinish");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "requestArbitrationForSBWindowScene:forReason:", v6, v7);

  }
  -[SBModalUIFluidDismissGestureWorkspaceTransaction removeMilestone:](self, "removeMilestone:", CFSTR("SBModalUIFluidDismissGestureMilestone"));
}

- (void)_updateWithGesture:(id)a3
{
  double v4;
  id v5;

  v5 = a3;
  if (!self->_hasPreservedInputViews)
  {
    self->_hasPreservedInputViews = 1;
    -[SBTransientOverlayViewController preserveInputViewsAnimated:](self->_transientOverlayViewController, "preserveInputViewsAnimated:", 1);
  }
  -[SBModalUIFluidDismissGestureWorkspaceTransaction _updateDismissingViewLayoutAndStyleForGesture](self, "_updateDismissingViewLayoutAndStyleForGesture");
  if (-[SBModalUIFluidDismissGestureWorkspaceTransaction _shouldDismissImmmediatelyAtFullGestureProgress](self, "_shouldDismissImmmediatelyAtFullGestureProgress"))
  {
    -[SBModalUIFluidDismissGestureWorkspaceTransaction _swipeUpGestureProgress](self, "_swipeUpGestureProgress");
    if (v4 >= 1.0)
      -[SBModalUIFluidDismissGestureWorkspaceTransaction _finishInteractionAndDismiss:animated:](self, "_finishInteractionAndDismiss:animated:", 1, 1);
  }

}

- (void)_finishWithGesture:(id)a3
{
  id v5;
  _BOOL8 v6;
  _BOOL8 animateGestureCancelationOrFailure;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;

  v5 = a3;
  v13 = v5;
  if (!self->_assistantRootViewController && !self->_transientOverlayViewController)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalUIFluidDismissGestureWorkspaceTransaction.m"), 212, CFSTR("We reached the end of a modal UI dismissal transaction with no _assistantRootViewController or _transientOverlayViewController..."));

    v5 = v13;
  }
  if ((objc_msgSend(v5, "state") & 0xFFFFFFFFFFFFFFFELL) == 4)
  {
    v6 = 0;
    animateGestureCancelationOrFailure = self->_animateGestureCancelationOrFailure;
  }
  else
  {
    -[SBModalUIFluidDismissGestureWorkspaceTransaction _viewForGesture](self, "_viewForGesture");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "velocityInView:", v8);
    v10 = v9;
    objc_msgSend(v13, "translationInView:", v8);
    v6 = v11 + v10 * 0.15 <= self->_dismissalThreshold;

    animateGestureCancelationOrFailure = 1;
  }
  -[SBModalUIFluidDismissGestureWorkspaceTransaction _finishInteractionAndDismiss:animated:](self, "_finishInteractionAndDismiss:animated:", v6, animateGestureCancelationOrFailure);

}

- (void)_finishInteractionAndDismiss:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  double v10;
  double v11;
  dispatch_time_t v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[6];
  BOOL v16;
  _QWORD block[5];
  NSObject *v18;
  _QWORD *v19;
  BOOL v20;
  BOOL v21;
  _QWORD v22[4];
  NSObject *v23;
  _QWORD v24[3];
  char v25;

  v4 = a4;
  v5 = a3;
  self->_isDismissing = a3;
  v24[0] = 0;
  v24[1] = v24;
  v24[2] = 0x2020000000;
  v25 = 0;
  v7 = dispatch_group_create();
  v8 = v7;
  v9 = MEMORY[0x1E0C809B0];
  if (v5)
  {
    dispatch_group_enter(v7);
    v22[0] = v9;
    v22[1] = 3221225472;
    v22[2] = __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke;
    v22[3] = &unk_1E8E9DED8;
    v23 = v8;
    -[SBModalUIFluidDismissGestureWorkspaceTransaction _dismissClientAnimated:completion:](self, "_dismissClientAnimated:completion:", v4, v22);

  }
  if (self->_isDismissing)
  {
    -[SBModalUIFluidDismissGestureWorkspaceTransaction _zoomOutDelay](self, "_zoomOutDelay");
    v11 = v10;
  }
  else
  {
    v11 = 0.0;
  }
  dispatch_group_enter(v8);
  v12 = dispatch_time(0, (uint64_t)(v11 * 1000000000.0));
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_2;
  block[3] = &unk_1E8EA5AB0;
  v20 = v4;
  v21 = v5;
  block[4] = self;
  v19 = v24;
  v13 = v8;
  v18 = v13;
  dispatch_after(v12, MEMORY[0x1E0C80D38], block);
  if (-[SBModalUIFluidDismissGestureWorkspaceTransaction _shouldFinishImmediately](self, "_shouldFinishImmediately"))
    dispatch_group_leave(v13);
  v15[0] = v9;
  v15[1] = 3221225472;
  v15[2] = __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_5;
  v15[3] = &unk_1E8EA3080;
  v15[4] = self;
  v15[5] = v24;
  v16 = v5;
  v14 = (void *)MEMORY[0x1E0C80D38];
  dispatch_group_notify(v13, MEMORY[0x1E0C80D38], v15);

  _Block_object_dispose(v24, 8);
}

void __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
}

void __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  __int128 v6;
  _QWORD v7[5];
  __int128 v8;
  char v9;
  _QWORD v10[4];
  uint64_t v11;
  char v12;

  v2 = (void *)MEMORY[0x1E0CEABB0];
  objc_msgSend(*(id *)(a1 + 32), "_layoutSettings");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 56))
    v4 = 3;
  else
    v4 = 2;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_3;
  v10[3] = &unk_1E8E9F508;
  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(_BYTE *)(a1 + 57);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_4;
  v7[3] = &unk_1E8EA5A88;
  v7[4] = v11;
  v6 = *(_OWORD *)(a1 + 40);
  v9 = v12;
  v5 = (id)v6;
  v8 = v6;
  objc_msgSend(v2, "sb_animateWithSettings:mode:animations:completion:", v3, v4, v10, v7);

}

void __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_3(uint64_t a1)
{
  double v2;
  int v3;
  double v4;
  CGFloat v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  _BYTE *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  SBFluidDismissalState *v32;
  uint64_t v33;
  double v34;
  double v35;
  CGAffineTransform v36;
  CGAffineTransform v37;

  objc_msgSend(*(id *)(a1 + 32), "_backgroundWeightingForDismissal:", *(unsigned __int8 *)(a1 + 40));
  v35 = v2;
  v3 = *(unsigned __int8 *)(a1 + 40);
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(a1 + 32), "_scaleForDismissal");
    v5 = v4;
  }
  else
  {
    v5 = 1.0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_viewForGesture");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  CGAffineTransformMakeScale(&v37, v5, v5);
  UIRectGetCenter();
  BSRectWithSize();
  UIRectCenteredAboutPoint();
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v15 = objc_msgSend(*(id *)(a1 + 32), "dismissalType");
  v16 = v12;
  v17 = v8;
  v18 = v10;
  v19 = v12;
  v20 = v14;
  if (v15 == 2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_homeScreenAnimator", v8, v10, v12, v14);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setHomeScreenScale:behaviorMode:completion:", 3, 0, 1.0);

    v16 = v12;
    v17 = v8;
    v18 = v10;
    v19 = v12;
    v20 = v14;
    if (*(_BYTE *)(a1 + 40))
    {
      v22 = *(_BYTE **)(a1 + 32);
      v17 = v8;
      v18 = v10;
      v19 = v12;
      v20 = v14;
      if (v22[344])
      {
        objc_msgSend(v22, "_scaleForGestureProgress", v8, v10, v12, v14);
        CGAffineTransformMakeScale(&v36, v23 * 0.95, v23 * 0.95);
        UIRectGetCenter();
        BSRectWithSize();
        UIRectCenteredAboutPoint();
        v16 = v12;
      }
    }
  }
  v34 = v20;
  v24 = v8;
  v25 = v10;
  if (v3)
    v26 = 0.0;
  else
    v26 = 1.0;
  v27 = v16;
  v28 = v14;
  v29 = v17;
  v30 = v18;
  v31 = v19;
  v32 = objc_alloc_init(SBFluidDismissalState);
  -[SBFluidDismissalState setBackgroundWeighting:](v32, "setBackgroundWeighting:", v35);
  -[SBFluidDismissalState setContentWeighting:](v32, "setContentWeighting:", v26);
  -[SBFluidDismissalState setContentRect:](v32, "setContentRect:", v24, v25, v27, v28);
  -[SBFluidDismissalState setHomeGrabberContentRect:](v32, "setHomeGrabberContentRect:", v29, v30, v31, v34);
  -[SBFluidDismissalState setDismissalType:](v32, "setDismissalType:", objc_msgSend(*(id *)(a1 + 32), "dismissalType"));
  if (*(_BYTE *)(a1 + 40))
    v33 = 1;
  else
    v33 = 2;
  -[SBFluidDismissalState setTransitionPhase:](v32, "setTransitionPhase:", v33);
  objc_msgSend(*(id *)(a1 + 32), "_setFluidDismissalState:", v32);

}

void __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_4(uint64_t a1, int a2, char a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  char v8;

  if (a2)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "isSystemAssistantExperienceEnabled"))
    {
      v5 = *(_QWORD *)(a1 + 32);
      v6 = *(void **)(v5 + 256);
      if (v6)
      {
        if (*(_QWORD *)(v5 + 376) == 1)
        {
          objc_msgSend(v6, "siriPresentationViewController");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "noteFluidDismissalCompletedWithSuccess:", *(unsigned __int8 *)(a1 + 56));

        }
      }
    }
  }
  if (*(_BYTE *)(a1 + 56))
    v8 = 0;
  else
    v8 = a3;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = v8;
  if ((objc_msgSend(*(id *)(a1 + 32), "_shouldFinishImmediately") & 1) == 0)
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

uint64_t __90__SBModalUIFluidDismissGestureWorkspaceTransaction__finishInteractionAndDismiss_animated___block_invoke_5(uint64_t result)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(*(_QWORD *)(result + 32) + 346) = 0;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24))
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 32), "_cleanupHierarchyForDismissal:", *(unsigned __int8 *)(result + 48));
    if (*(_BYTE *)(v1 + 48))
      v2 = 1;
    else
      v2 = -1;
    return objc_msgSend(*(id *)(v1 + 32), "finishWithCompletionType:", v2);
  }
  return result;
}

- (void)_updateDismissingViewLayoutAndStyleForGesture
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  _QWORD v13[7];

  -[SBModalUIFluidDismissGestureWorkspaceTransaction _scaleForGestureProgress](self, "_scaleForGestureProgress");
  v4 = v3;
  -[SBModalUIFluidDismissGestureWorkspaceTransaction _yOffsetForGestureProgress](self, "_yOffsetForGestureProgress");
  v6 = v5;
  -[SBModalUIFluidDismissGestureWorkspaceTransaction _swipeUpGestureTranslation](self, "_swipeUpGestureTranslation");
  v7 = (void *)MEMORY[0x1E0CEABB0];
  -[SBModalUIFluidDismissGestureWorkspaceTransaction _layoutSettings](self, "_layoutSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __97__SBModalUIFluidDismissGestureWorkspaceTransaction__updateDismissingViewLayoutAndStyleForGesture__block_invoke;
  v13[3] = &unk_1E8E9DF00;
  v13[4] = self;
  v13[5] = v4;
  v13[6] = v6;
  objc_msgSend(v7, "sb_animateWithSettings:mode:animations:completion:", v8, 5, v13, 0);

  if (self->_dismissalType == 2 && !SBReduceMotion())
  {
    if (BSFloatGreaterThanFloat())
    {
      +[SBSpotlightDomain rootSettings](SBSpotlightDomain, "rootSettings");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "maxTranslationForHomeScreenScale");
      objc_msgSend(v9, "homeScreenScaleRubberbandingMin");
      objc_msgSend(v9, "homeScreenScaleRubberbandingMax");
      objc_msgSend(v9, "homeScreenScaleRubberbandingRange");
      BSUIConstrainValueToIntervalWithRubberBand();
      v11 = v10;
      -[SBModalUIFluidDismissGestureWorkspaceTransaction _homeScreenAnimator](self, "_homeScreenAnimator");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setHomeScreenScale:behaviorMode:completion:", 5, 0, v11);

    }
    else
    {
      -[SBModalUIFluidDismissGestureWorkspaceTransaction _homeScreenAnimator](self, "_homeScreenAnimator");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setHomeScreenScale:behaviorMode:completion:", 5, 0, 1.0);
    }

  }
}

void __97__SBModalUIFluidDismissGestureWorkspaceTransaction__updateDismissingViewLayoutAndStyleForGesture__block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  _BYTE *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  _BOOL4 v30;
  double v31;
  double v32;
  double v33;
  SBFluidDismissalState *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  CGAffineTransform v45;

  objc_msgSend(*(id *)(a1 + 32), "_viewForGesture");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  CGAffineTransformMakeScale(&v45, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 40));
  v41 = v4;
  v43 = v6;
  UIRectGetCenter();
  BSRectWithSize();
  UIRectCenteredAboutPoint();
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(*(id *)(a1 + 32), "_backgroundWeightingForGestureProgress");
  v20 = v19;
  v21 = 1.0;
  if (objc_msgSend(*(id *)(a1 + 32), "dismissalType") == 2)
  {
    v22 = *(_BYTE **)(a1 + 32);
    if (v22[344])
    {
      objc_msgSend(v22, "_swipeUpGestureProgress");
      v39 = 1.0 - v23;
      v40 = 0.0;
      v37 = v14;
      v38 = v12;
      v35 = v18;
      v36 = v16;
      v24 = v18;
      v25 = v16;
      v26 = v14;
      v27 = v12;
      v28 = v41;
      v29 = v43;
    }
    else
    {
      v40 = v20;
      v24 = v18;
      v25 = v16;
      v26 = v14;
      v27 = v12;
      v28 = v41;
      v29 = v43;
      v37 = v43;
      v38 = v41;
      v35 = v10;
      v36 = v8;
      v39 = 1.0;
    }
    v30 = SBReduceMotion();
    if (v30)
    {
      v27 = v28;
      v26 = v29;
      v25 = v8;
      v24 = v10;
      v31 = v28;
    }
    else
    {
      v31 = v38;
    }
    v32 = v37;
    if (v30)
      v32 = v29;
    v42 = v32;
    v44 = v31;
    if (v30)
    {
      v21 = 1.0;
    }
    else
    {
      v8 = v36;
      v10 = v35;
      v21 = v39;
    }
    v33 = v40;
    if (v30)
      v33 = 0.0;
    v12 = v27;
    v14 = v26;
    v16 = v25;
    v18 = v24;
    v20 = v33;
  }
  else
  {
    v42 = v14;
    v44 = v12;
    v8 = v16;
    v10 = v18;
  }
  v34 = objc_alloc_init(SBFluidDismissalState);
  -[SBFluidDismissalState setBackgroundWeighting:](v34, "setBackgroundWeighting:", v20);
  -[SBFluidDismissalState setContentWeighting:](v34, "setContentWeighting:", v21);
  -[SBFluidDismissalState setContentRect:](v34, "setContentRect:", v12, v14, v16, v18);
  -[SBFluidDismissalState setHomeGrabberContentRect:](v34, "setHomeGrabberContentRect:", v44, v42, v8, v10);
  -[SBFluidDismissalState setDismissalType:](v34, "setDismissalType:", objc_msgSend(*(id *)(a1 + 32), "dismissalType"));
  -[SBFluidDismissalState setTransitionPhase:](v34, "setTransitionPhase:", 0);
  objc_msgSend(*(id *)(a1 + 32), "_setFluidDismissalState:", v34);

}

- (id)_dismissalFeedbackGenerator
{
  UINotificationFeedbackGenerator *dismissalFeedbackGenerator;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  UINotificationFeedbackGenerator *v8;
  UINotificationFeedbackGenerator *v9;

  dismissalFeedbackGenerator = self->_dismissalFeedbackGenerator;
  if (!dismissalFeedbackGenerator)
  {
    v4 = objc_alloc(MEMORY[0x1E0CEA7D0]);
    v5 = (void *)MEMORY[0x1E0CEAE28];
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", &unk_1E91D0560, &unk_1E91D0578, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "privateConfigurationForTypes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (UINotificationFeedbackGenerator *)objc_msgSend(v4, "initWithConfiguration:", v7);
    v9 = self->_dismissalFeedbackGenerator;
    self->_dismissalFeedbackGenerator = v8;

    dismissalFeedbackGenerator = self->_dismissalFeedbackGenerator;
  }
  return dismissalFeedbackGenerator;
}

- (id)_layoutSettings
{
  void *v4;
  uint64_t v5;
  void *v6;

  switch(-[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType"))
  {
    case 0:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalUIFluidDismissGestureWorkspaceTransaction.m"), 404, CFSTR("Invalid dismissal type for dismiss gesture workspace transaction"));
      v6 = 0;
      goto LABEL_8;
    case 1:
      -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "siriSwipeDismissalSettings");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 2:
    case 3:
      -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "alertCardifiedDismissalSettings");
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 4:
    case 5:
      -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "alertBarSwipeDismissalSettings");
      v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
      v6 = (void *)v5;
LABEL_8:

      break;
    default:
      v6 = 0;
      break;
  }
  return v6;
}

- (double)_zoomOutDelay
{
  int64_t v3;
  double v4;
  void *v5;
  double v6;

  v3 = -[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType");
  if ((unint64_t)(v3 - 4) < 2)
  {
    -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertBarSwipeDismissZoomOutDelay");
    goto LABEL_7;
  }
  if (v3 == 3)
  {
    -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertCardifiedDismissZoomOutDelay");
    goto LABEL_7;
  }
  v4 = 0.0;
  if (v3 == 1)
  {
    -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriSwipeDismissZoomOutDelay");
LABEL_7:
    v4 = v6;

  }
  return v4;
}

- (double)_clientAnimationsDelay
{
  int64_t v3;
  double v4;
  void *v5;
  double v6;

  v3 = -[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType");
  if ((unint64_t)(v3 - 4) < 2)
  {
    -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertBarSwipeDismissClientAnimationsDelay");
    goto LABEL_7;
  }
  if (v3 == 3)
  {
    -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertCardifiedDismissClientAnimationsDelay");
    goto LABEL_7;
  }
  v4 = 0.0;
  if (v3 == 1)
  {
    -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriSwipeDismissClientAnimationsDelay");
LABEL_7:
    v4 = v6;

  }
  return v4;
}

- (double)_hapticDelay
{
  int64_t v3;
  double v4;
  void *v5;
  double v6;

  v3 = -[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType");
  if ((unint64_t)(v3 - 4) < 2)
  {
    -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertBarSwipeDismissHapticDelay");
    goto LABEL_7;
  }
  if (v3 == 3)
  {
    -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertCardifiedDismissHapticDelay");
    goto LABEL_7;
  }
  v4 = 0.0;
  if (v3 == 1)
  {
    -[SBAppSwitcherSettings animationSettings](self->_settings, "animationSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "siriSwipeDismissHapticDelay");
LABEL_7:
    v4 = v6;

  }
  return v4;
}

- (int64_t)_notificationFeedbackType
{
  unint64_t v2;

  v2 = -[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType");
  if (v2 > 5)
    return 0;
  else
    return qword_1D0E88CF8[v2];
}

- (void)_dismissClientAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL4 v4;
  id v7;
  double v8;
  double v9;
  double v10;
  dispatch_time_t v11;
  uint64_t v12;
  double v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  dispatch_time_t v17;
  void *v18;
  _QWORD v19[5];
  _QWORD block[6];
  BOOL v21;

  v4 = a3;
  v7 = a4;
  v8 = 0.0;
  v9 = 0.0;
  if (v4)
  {
    -[SBModalUIFluidDismissGestureWorkspaceTransaction _clientAnimationsDelay](self, "_clientAnimationsDelay");
    v9 = v10;
  }
  v11 = dispatch_time(0, (uint64_t)(v9 * 1000000000.0));
  v12 = MEMORY[0x1E0C809B0];
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__SBModalUIFluidDismissGestureWorkspaceTransaction__dismissClientAnimated_completion___block_invoke;
  block[3] = &unk_1E8EA5AD8;
  v21 = v4;
  block[4] = self;
  block[5] = a2;
  dispatch_after(v11, MEMORY[0x1E0C80D38], block);
  if (v4)
  {
    -[SBModalUIFluidDismissGestureWorkspaceTransaction _hapticDelay](self, "_hapticDelay");
    v8 = v13;
    v14 = dispatch_time(0, (uint64_t)(v13 * 1000000000.0));
    v19[0] = v12;
    v19[1] = 3221225472;
    v19[2] = __86__SBModalUIFluidDismissGestureWorkspaceTransaction__dismissClientAnimated_completion___block_invoke_2;
    v19[3] = &unk_1E8E9DED8;
    v19[4] = self;
    v15 = (void *)MEMORY[0x1E0C80D38];
    dispatch_after(v14, MEMORY[0x1E0C80D38], v19);

  }
  if (v9 >= v8)
    v16 = v9;
  else
    v16 = v8;
  v17 = dispatch_time(0, (uint64_t)(v16 * 1000000000.0));
  v18 = (void *)MEMORY[0x1E0C80D38];
  dispatch_after(v17, MEMORY[0x1E0C80D38], v7);

}

void __86__SBModalUIFluidDismissGestureWorkspaceTransaction__dismissClientAnimated_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id v3;

  v2 = objc_msgSend(*(id *)(a1 + 32), "dismissalType");
  if ((unint64_t)(v2 - 2) >= 4)
  {
    if (v2)
    {
      if (v2 == 1)
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 368), "dismissAssistantViewIfNecessaryWithAnimation:", *(unsigned __int8 *)(a1 + 48));
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("SBModalUIFluidDismissGestureWorkspaceTransaction.m"), 530, CFSTR("Invalid dismissal type for dismiss gesture workspace transaction"));

    }
  }
  else
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 272), "handleGestureDismissal");
  }
}

void __86__SBModalUIFluidDismissGestureWorkspaceTransaction__dismissClientAnimated_completion___block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_dismissalFeedbackGenerator");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_privateNotificationOccurred:", objc_msgSend(*(id *)(a1 + 32), "_notificationFeedbackType"));

}

- (double)_scaleForDismissal
{
  unint64_t v2;
  double result;

  v2 = -[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType");
  result = 0.0;
  if (v2 <= 5)
    return dbl_1D0E88D28[v2];
  return result;
}

- (double)_backgroundWeightingForDismissal:(BOOL)a3
{
  _BOOL4 v3;
  unint64_t v4;
  double v5;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  BOOL v11;
  double v12;

  v3 = a3;
  v4 = -[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType");
  if (v4 > 5)
    return 0.0;
  if (v4 == 2)
  {
    +[SBLockScreenManager sharedInstance](SBLockScreenManager, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isUILocked");

    +[SBSpotlightDomain rootSettings](SBSpotlightDomain, "rootSettings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v5 = 0.0;
    if (v8)
      v11 = !v3;
    else
      v11 = 0;
    if (v11)
    {
      objc_msgSend(v9, "dimmingViewRubberbandingMax");
      v5 = v12;
    }

  }
  else if (v3)
  {
    return 0.0;
  }
  else
  {
    return 1.0;
  }
  return v5;
}

- (double)_scaleForGestureProgress
{
  double v3;
  double v4;
  unint64_t v5;

  -[SBModalUIFluidDismissGestureWorkspaceTransaction _swipeUpGestureProgress](self, "_swipeUpGestureProgress");
  v4 = v3;
  v5 = -[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType");
  if (v5 > 5)
    return 0.0;
  if (((1 << v5) & 0xE) != 0)
    return v4 * -0.145 + 1.0;
  return 1.0;
}

- (double)_backgroundWeightingForGestureProgress
{
  double v3;
  double v4;
  unint64_t v5;
  double v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;

  -[SBModalUIFluidDismissGestureWorkspaceTransaction _swipeUpGestureProgress](self, "_swipeUpGestureProgress");
  v4 = v3;
  v5 = -[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType");
  if (v5 > 5)
    return 0.0;
  if (((1 << v5) & 0x31) != 0)
    return 1.0;
  if (((1 << v5) & 0xA) != 0)
    return v4 * -0.1 + 0.9;
  -[SBModalUIFluidDismissGestureWorkspaceTransaction _swipeUpGestureTranslation](self, "_swipeUpGestureTranslation");
  v6 = 0.0;
  if (BSFloatGreaterThanFloat())
  {
    +[SBSpotlightDomain rootSettings](SBSpotlightDomain, "rootSettings");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "maxTranslationForDimmingView");
    objc_msgSend(v7, "dimmingViewRubberbandingMin");
    v9 = v8;
    objc_msgSend(v7, "dimmingViewRubberbandingMax");
    objc_msgSend(v7, "dimmingViewRubberbandingRange", v9, 1, v10, 1);
    BSUIConstrainValueToIntervalWithRubberBand();
    v6 = v11;

  }
  return v6;
}

- (double)_yOffsetForGestureProgress
{
  double v3;
  double v4;
  unint64_t v5;
  double v6;

  -[SBModalUIFluidDismissGestureWorkspaceTransaction _swipeUpGestureProgress](self, "_swipeUpGestureProgress");
  v4 = v3;
  v5 = -[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType");
  if (v5 > 5)
    return 0.0;
  if (((1 << v5) & 0xD) != 0)
  {
    v6 = -10.0;
  }
  else if (((1 << v5) & 0x30) != 0)
  {
    v6 = -15.0;
  }
  else
  {
    v6 = -25.0;
  }
  return v4 * v6 + 0.0;
}

- (double)_swipeUpGestureTranslation
{
  void *v3;
  uint64_t v4;
  double v5;
  void *v6;
  int64_t dismissalType;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;

  -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "state");

  v5 = 0.0;
  if (v4 != 1)
  {
    -[SBModalUIFluidDismissGestureWorkspaceTransaction _viewForGesture](self, "_viewForGesture");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    dismissalType = self->_dismissalType;
    -[SBSystemGestureWorkspaceTransaction gestureRecognizer](self, "gestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = v8;
    if (dismissalType == 2)
    {
      objc_msgSend(v8, "translationInView:", v6);
      v5 = v10;

    }
    else
    {
      _UISystemGestureTranslationInView();
      v12 = v11;

      v5 = fmin(v12, 0.0);
    }

  }
  return v5;
}

- (double)_swipeUpGestureProgress
{
  double v3;
  double v4;
  unint64_t v5;
  double v6;
  long double v7;
  double result;

  -[SBModalUIFluidDismissGestureWorkspaceTransaction _swipeUpGestureTranslation](self, "_swipeUpGestureTranslation");
  v4 = -v3;
  v5 = -[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType");
  if (v5 < 4)
  {
    v6 = fabs(v4);
    v7 = pow((v6 + v6) / 500.0 + 0.0, 0.7);
    tanh(v7 * 0.6);
LABEL_4:
    BSIntervalMap();
    return result;
  }
  if (v5 - 4 < 2)
    goto LABEL_4;
  return 0.0;
}

- (BOOL)_shouldDismissImmmediatelyAtFullGestureProgress
{
  int64_t v4;
  void *v6;

  v4 = -[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType");
  if ((unint64_t)(v4 - 4) < 2)
    return 1;
  if (v4)
  {
    if (v4 == 2)
      return SBReduceMotion();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("SBModalUIFluidDismissGestureWorkspaceTransaction.m"), 728, CFSTR("Invalid dismissal type for dismiss gesture workspace transaction"));

  }
  return 0;
}

- (BOOL)_shouldFinishImmediately
{
  int64_t v2;

  v2 = -[SBModalUIFluidDismissGestureWorkspaceTransaction dismissalType](self, "dismissalType");
  return v2 == 2 || v2 == 5;
}

- (void)_setFluidDismissalState:(id)a3
{
  id v4;
  SBAssistantRootViewController *assistantRootViewController;
  SBTransientOverlayPresenting *transientOverlayPresenter;
  id v7;

  v4 = a3;
  assistantRootViewController = self->_assistantRootViewController;
  if (assistantRootViewController && self->_dismissalType == 1)
  {
    v7 = v4;
    -[SBAssistantRootViewController setFluidDismissalState:](assistantRootViewController, "setFluidDismissalState:", v4);
LABEL_7:
    v4 = v7;
    goto LABEL_8;
  }
  if (self->_transientOverlayViewController)
  {
    transientOverlayPresenter = self->_transientOverlayPresenter;
    if (transientOverlayPresenter)
    {
      v7 = v4;
      -[SBTransientOverlayPresenting setFluidDismissalState:forViewController:](transientOverlayPresenter, "setFluidDismissalState:forViewController:", v4);
      goto LABEL_7;
    }
  }
LABEL_8:

}

- (id)_viewForGesture
{
  void *transientOverlayViewController;

  if (self->_transientOverlayViewController)
    transientOverlayViewController = self->_transientOverlayViewController;
  else
    transientOverlayViewController = self->_assistantRootViewController;
  objc_msgSend(transientOverlayViewController, "view");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_cleanupHierarchyForDismissal:(BOOL)a3
{
  SBWindowSceneStatusBarSettingsAssertion *statusBarAssertion;
  SBAssistantRootViewController *assistantRootViewController;
  SBTransientOverlayViewController *transientOverlayViewController;
  SBTransientOverlayPresenting *transientOverlayPresenter;

  if (self->_hasPreservedInputViews)
  {
    self->_hasPreservedInputViews = 0;
    -[SBTransientOverlayViewController restoreInputViewsAnimated:](self->_transientOverlayViewController, "restoreInputViewsAnimated:", 1);
  }
  -[SBWindowSceneStatusBarSettingsAssertion invalidate](self->_statusBarAssertion, "invalidate", a3);
  statusBarAssertion = self->_statusBarAssertion;
  self->_statusBarAssertion = 0;

  assistantRootViewController = self->_assistantRootViewController;
  self->_assistantRootViewController = 0;

  transientOverlayViewController = self->_transientOverlayViewController;
  self->_transientOverlayViewController = 0;

  transientOverlayPresenter = self->_transientOverlayPresenter;
  self->_transientOverlayPresenter = 0;

}

- (id)_homeScreenAnimator
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "homeScreenController");
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

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (void)setWindowScene:(id)a3
{
  objc_storeWeak((id *)&self->_windowScene, a3);
}

- (double)dismissalThreshold
{
  return self->_dismissalThreshold;
}

- (void)setDismissalThreshold:(double)a3
{
  self->_dismissalThreshold = a3;
}

- (BOOL)animateGestureCancelationOrFailure
{
  return self->_animateGestureCancelationOrFailure;
}

- (void)setAnimateGestureCancelationOrFailure:(BOOL)a3
{
  self->_animateGestureCancelationOrFailure = a3;
}

- (SBAssistantSceneControlling)assistantController
{
  return self->_assistantController;
}

- (void)setAssistantController:(id)a3
{
  objc_storeStrong((id *)&self->_assistantController, a3);
}

- (int64_t)dismissalType
{
  return self->_dismissalType;
}

- (SBMainWorkspaceTransaction)currentTransaction
{
  return self->_currentTransaction;
}

- (void)setCurrentTransaction:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransaction, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransaction, 0);
  objc_storeStrong((id *)&self->_assistantController, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_storeStrong((id *)&self->_transientOverlayViewController, 0);
  objc_storeStrong((id *)&self->_transientOverlayPresenter, 0);
  objc_storeStrong((id *)&self->_assistantRootViewController, 0);
  objc_storeStrong((id *)&self->_dismissalFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_statusBarAssertion, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end
