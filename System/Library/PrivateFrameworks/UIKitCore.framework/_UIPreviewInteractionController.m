@implementation _UIPreviewInteractionController

- (_UIPreviewInteractionController)initWithView:(id)a3
{
  id v5;
  _UIPreviewInteractionController *v6;
  _UIPreviewInteractionController *v7;
  UIPreviewInteraction *v8;
  UIPreviewInteraction *previewInteraction;
  _UIPreviewInteractionGestureRecognizer *v10;
  _UIPreviewInteractionGestureRecognizer *v11;
  _UITouchesObservingGestureRecognizer *v12;
  _UISteadyTouchForceGestureRecognizer *v13;
  _UIPreviewInteractionController *v14;
  void *v16;
  objc_super v17;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionController.m"), 99, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("view"));

  }
  v17.receiver = self;
  v17.super_class = (Class)_UIPreviewInteractionController;
  v6 = -[_UIPreviewInteractionController init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeWeak((id *)&v6->_sourceView, v5);
    v8 = -[UIPreviewInteraction initWithView:]([UIPreviewInteraction alloc], "initWithView:", v5);
    previewInteraction = v7->_previewInteraction;
    v7->_previewInteraction = v8;

    -[UIPreviewInteraction setDelegate:](v7->_previewInteraction, "setDelegate:", v7);
    v10 = -[UILongPressGestureRecognizer initWithTarget:action:]([_UIPreviewInteractionGestureRecognizer alloc], "initWithTarget:action:", v7, sel__handleRevealGesture_);
    -[UIGestureRecognizer setName:](v10, "setName:", CFSTR("Reveal mk2"));
    -[UIGestureRecognizer setAllowedTouchTypes:](v10, "setAllowedTouchTypes:", &unk_1E1A94640);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v10, "setMinimumPressDuration:", 0.0);
    -[_UIPreviewInteractionGestureRecognizer setDelegate:](v10, "setDelegate:", v7);
    objc_msgSend(v5, "addGestureRecognizer:", v10);
    -[_UIPreviewInteractionController setRevealGestureRecognizer:](v7, "setRevealGestureRecognizer:", v10);

    v11 = -[UILongPressGestureRecognizer initWithTarget:action:]([_UIPreviewInteractionGestureRecognizer alloc], "initWithTarget:action:", v7, sel__handlePreviewGesture_);
    -[UIGestureRecognizer setName:](v11, "setName:", CFSTR("Preview mk2"));
    -[UIGestureRecognizer setAllowedTouchTypes:](v11, "setAllowedTouchTypes:", &unk_1E1A94640);
    -[UIGestureRecognizer setCancelsTouchesInView:](v11, "setCancelsTouchesInView:", 0);
    -[UILongPressGestureRecognizer setMinimumPressDuration:](v11, "setMinimumPressDuration:", 0.0);
    -[_UIPreviewInteractionGestureRecognizer setDelegate:](v11, "setDelegate:", v7);
    objc_msgSend(v5, "addGestureRecognizer:", v11);
    -[_UIPreviewInteractionController setPreviewGestureRecognizer:](v7, "setPreviewGestureRecognizer:", v11);

    v12 = -[_UITouchesObservingGestureRecognizer initWithTarget:action:]([_UITouchesObservingGestureRecognizer alloc], "initWithTarget:action:", v7, sel__handlePreviewActionsGesture_);
    -[UIGestureRecognizer setAllowedTouchTypes:](v12, "setAllowedTouchTypes:", &unk_1E1A94640);
    -[UIGestureRecognizer setCancelsTouchesInView:](v12, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelegate:](v12, "setDelegate:", v7);
    objc_msgSend(v5, "addGestureRecognizer:", v12);
    -[_UIPreviewInteractionController setGestureRecognizerForPreviewActions:](v7, "setGestureRecognizerForPreviewActions:", v12);

    v13 = -[_UISteadyTouchForceGestureRecognizer initWithTarget:action:]([_UISteadyTouchForceGestureRecognizer alloc], "initWithTarget:action:", v7, sel__handleSteadyTouchForceGesture_);
    -[UIGestureRecognizer setAllowedTouchTypes:](v13, "setAllowedTouchTypes:", &unk_1E1A94640);
    -[UIGestureRecognizer setCancelsTouchesInView:](v13, "setCancelsTouchesInView:", 0);
    -[UIGestureRecognizer setDelegate:](v13, "setDelegate:", v7);
    objc_msgSend(v5, "addGestureRecognizer:", v13);
    -[_UIPreviewInteractionController setSteadyTouchForceGestureRecognizer:](v7, "setSteadyTouchForceGestureRecognizer:", v13);

    v14 = v7;
  }

  return v7;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v15;

  -[_UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeGestureRecognizer:", v5);

  -[_UIPreviewInteractionController steadyTouchForceGestureRecognizer](self, "steadyTouchForceGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionController steadyTouchForceGestureRecognizer](self, "steadyTouchForceGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeGestureRecognizer:", v8);

  -[_UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "removeGestureRecognizer:", v11);

  -[_UIPreviewInteractionController gestureRecognizerForPreviewActions](self, "gestureRecognizerForPreviewActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionController gestureRecognizerForPreviewActions](self, "gestureRecognizerForPreviewActions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "removeGestureRecognizer:", v14);

  v15.receiver = self;
  v15.super_class = (Class)_UIPreviewInteractionController;
  -[_UIPreviewInteractionController dealloc](&v15, sel_dealloc);
}

- (void)commitInteractivePreview
{
  void *v3;
  _UIPreviewInteractionCommitTransition *v4;
  uint64_t v5;
  void *v6;
  _QWORD v7[5];
  _QWORD v8[5];
  id v9;

  if (!-[_UIPreviewInteractionController dismissingPreview](self, "dismissingPreview")
    && !-[UIPresentationController dismissing](self->_currentPresentationController, "dismissing"))
  {
    if (-[_UIPreviewInteractionController performingPreviewTransition](self, "performingPreviewTransition"))
    {
      -[_UIPreviewInteractionController setCommitTransitionScheduled:](self, "setCommitTransitionScheduled:", 1);
    }
    else
    {
      -[_UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (v3)
      {
        -[_UIPreviewInteractionController _stopCurrentInteractionEffect](self, "_stopCurrentInteractionEffect");
        -[_UIPreviewInteractionController setPerformingCommitTransition:](self, "setPerformingCommitTransition:", 1);
        -[_UIPreviewInteractionController setCommitTransitionScheduled:](self, "setCommitTransitionScheduled:", 0);
        -[_UIPreviewInteractionController _resetCustomPresentationHooks](self, "_resetCustomPresentationHooks");
        v4 = -[_UIPreviewInteractionCommitTransition initWithPresentedViewController:]([_UIPreviewInteractionCommitTransition alloc], "initWithPresentedViewController:", v3);
        v5 = MEMORY[0x1E0C809B0];
        v8[0] = MEMORY[0x1E0C809B0];
        v8[1] = 3221225472;
        v8[2] = __59___UIPreviewInteractionController_commitInteractivePreview__block_invoke;
        v8[3] = &unk_1E16B1B50;
        v8[4] = self;
        v9 = v3;
        v7[0] = v5;
        v7[1] = 3221225472;
        v7[2] = __59___UIPreviewInteractionController_commitInteractivePreview__block_invoke_2;
        v7[3] = &unk_1E16B1B28;
        v7[4] = self;
        -[_UIPreviewInteractionCommitTransition performTransitionWithPresentationBlock:completion:](v4, "performTransitionWithPresentationBlock:completion:", v8, v7);
        -[_UIPreviewInteractionController setCurrentCommitTransition:](self, "setCurrentCommitTransition:", v4);
        +[_UIStatistics previewInteractionPopCount](_UIStatistics, "previewInteractionPopCount");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "incrementValueBy:", 1);

        _UIPowerLogPopOccured();
      }

    }
  }
}

- (BOOL)previewInteractionShouldBegin:(id)a3
{
  id v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[_UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = -[_UIPreviewInteractionController _preparePreviewViewControllerPresentationFromPreviewInteraction:](self, "_preparePreviewViewControllerPresentationFromPreviewInteraction:", v4);
    -[_UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v6)
    {
      objc_msgSend(v7, "recognize");
    }
    else
    {
      objc_msgSend(v7, "cancel");

      -[_UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "cancel");

      -[_UIPreviewInteractionController steadyTouchForceGestureRecognizer](self, "steadyTouchForceGestureRecognizer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "cancel");
    }

  }
  return v6;
}

- (void)previewInteraction:(id)a3 didUpdatePreviewTransition:(double)a4 ended:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;
  void *v9;
  id v10;

  v5 = a5;
  -[_UIPreviewInteractionController currentPresentationTransition](self, "currentPresentationTransition", a3);
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "updateInteractiveTransition:", a4);
  if (v5)
  {
    -[_UIPreviewInteractionController setHasTransitionedToPreview:](self, "setHasTransitionedToPreview:", 1);
    -[_UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recognize");

    -[_UIPreviewInteractionController steadyTouchForceGestureRecognizer](self, "steadyTouchForceGestureRecognizer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "cancel");

    objc_msgSend(v10, "finishTransition");
  }

}

- (void)previewInteraction:(id)a3 didUpdateCommitTransition:(double)a4 ended:(BOOL)a5
{
  _BOOL4 v5;
  void *v8;

  v5 = a5;
  -[_UIPreviewInteractionController _preparedInteractionEffect](self, "_preparedInteractionEffect", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setForceFactor:", a4);

  if (v5)
    -[_UIPreviewInteractionController commitInteractivePreview](self, "commitInteractivePreview");
}

- (void)previewInteractionDidCancel:(id)a3
{
  if (!-[_UIPreviewInteractionController performingCommitTransition](self, "performingCommitTransition", a3))
    -[_UIPreviewInteractionController _dismissPreviewViewControllerIfNeeded](self, "_dismissPreviewViewControllerIfNeeded");
}

- (BOOL)_previewInteractionShouldEndOnGestureCompletion:(id)a3
{
  void *v4;
  void *v5;
  int v6;

  -[_UIPreviewInteractionController previewActionsController](self, "previewActionsController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[_UIPreviewInteractionController previewActionsController](self, "previewActionsController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "platterPanned") ^ 1;

  }
  else
  {
    LOBYTE(v6) = 1;
  }
  return v6;
}

- (id)animationControllerForDismissedController:(id)a3
{
  _UIPreviewInteractionDismissTransition *v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = objc_alloc_init(_UIPreviewInteractionDismissTransition);
  -[_UIPreviewInteractionDismissTransition _preparedDismissAnimator](v4, "_preparedDismissAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCurrentTransitionAnimator:", v5);

  -[_UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInteractiveTransitionFraction:", 0.0);

  -[_UIPreviewInteractionController setCurrentDismissTransition:](self, "setCurrentDismissTransition:", v4);
  return v4;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  _UIPreviewPresentationController2 *v9;
  void *v10;
  _UIPreviewPresentationController2 *v11;

  v7 = a4;
  v8 = a3;
  v9 = [_UIPreviewPresentationController2 alloc];
  -[_UIPreviewInteractionController currentPreviewingContext](self, "currentPreviewingContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[_UIPreviewPresentationController2 initWithPresentedViewController:presentingViewController:previewingContext:](v9, "initWithPresentedViewController:presentingViewController:previewingContext:", v8, v7, v10);

  -[_UIPreviewInteractionController _preparePreviewPresentationControllerIfNeeded:](self, "_preparePreviewPresentationControllerIfNeeded:", v11);
  -[_UIPreviewInteractionController setCurrentPresentationController:](self, "setCurrentPresentationController:", v11);
  return v11;
}

- (BOOL)gestureRecognizer:(id)a3 shouldBeRequiredToFailByGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  BOOL v9;

  v6 = a4;
  v7 = a3;
  -[_UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v8 == v7
    && -[_UIPreviewInteractionController _isLongPressGestureRecognizerUsedForDelayingActions:](self, "_isLongPressGestureRecognizerUsedForDelayingActions:", v6);

  return v9;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  BOOL v11;
  id v12;
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[_UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[_UIPreviewInteractionController steadyTouchForceGestureRecognizer](self, "steadyTouchForceGestureRecognizer");
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (v12 == v7)
      goto LABEL_13;
    -[_UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (v13 == v7)
      goto LABEL_13;
    if ((_UIPreviewInteractionIsTextGestureRecognizer(v7) & 1) != 0)
    {
      v11 = 0;
      goto LABEL_14;
    }
    if (-[_UIPreviewInteractionController _isLongPressGestureRecognizerUsedForDelayingActions:](self, "_isLongPressGestureRecognizerUsedForDelayingActions:", v7))
    {
LABEL_13:
      v11 = 1;
      goto LABEL_14;
    }
  }
  -[_UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9 == v6)
  {
    -[_UIPreviewInteractionController steadyTouchForceGestureRecognizer](self, "steadyTouchForceGestureRecognizer");
    v14 = (id)objc_claimAutoreleasedReturnValue();

    if (v14 == v7)
      goto LABEL_13;
    -[_UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
    v15 = (id)objc_claimAutoreleasedReturnValue();

    if (v15 == v7 || (_UIPreviewInteractionIsTextGestureRecognizer(v7) & 1) != 0)
      goto LABEL_13;
  }
  -[_UIPreviewInteractionController steadyTouchForceGestureRecognizer](self, "steadyTouchForceGestureRecognizer");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  v11 = v10 == v6;

LABEL_14:
  return v11;
}

- (void)_gestureRecognizerFailed:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  -[_UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    -[_UIPreviewInteractionController _dismissPreviewViewControllerIfNeeded](self, "_dismissPreviewViewControllerIfNeeded");
    -[_UIPreviewInteractionController previewInteraction](self, "previewInteraction");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelInteraction");

  }
}

- (BOOL)_preparePreviewViewControllerPresentationFromPreviewInteraction:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  id v13;
  void *v14;
  BOOL v15;
  void *v16;
  _UIPreviewInteractionPresentationTransition *v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v23;
  void *v24;
  _QWORD v25[5];
  id v26;
  id v27;

  v5 = a3;
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[_UIPreviewInteractionController _previewingIsPossibleForView:](self, "_previewingIsPossibleForView:", v6))
  {
    v15 = 0;
    goto LABEL_13;
  }
  -[_UIPreviewInteractionController delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInCoordinateSpace:", v6);
  v9 = v8;
  v11 = v10;
  v27 = 0;
  objc_msgSend(v7, "previewInteractionController:viewControllerForPreviewingAtLocation:inCoordinateSpace:presentingViewController:", self, v6, &v27);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v27;
  v14 = v13;
  v15 = v12 != 0;
  if (v12)
  {
    v24 = v13;
    objc_msgSend(v12, "presentingViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (v16 || (objc_msgSend(v12, "isBeingPresented") & 1) != 0)
    {

    }
    else if ((objc_msgSend(v12, "isBeingDismissed") & 1) == 0)
    {
LABEL_6:
      objc_msgSend(v12, "_setOverrideUseCustomPresentation:", 1);
      objc_msgSend(v12, "_setOverrideTransitioningDelegate:", self);
      -[_UIPreviewInteractionController setCurrentPreviewViewController:](self, "setCurrentPreviewViewController:", v12);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "previewInteractionController:willPresentViewController:forLocation:inSourceView:", self, v12, v6, v9, v11);
      v17 = objc_alloc_init(_UIPreviewInteractionPresentationTransition);
      -[_UIPreviewInteractionController setCurrentPresentationTransition:](self, "setCurrentPresentationTransition:", v17);
      -[_UIPreviewInteractionController currentPreviewingContext](self, "currentPreviewingContext");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = -[_UIPreviewInteractionController _newHighlighterForPreviewingContext:](self, "_newHighlighterForPreviewingContext:", v18);
      objc_msgSend(v19, "prepareHighlightWithPreviewingContext:", v18);
      -[_UIPreviewInteractionController setCurrentHighlighter:](self, "setCurrentHighlighter:", v19);
      -[_UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewInteractionController _preparePreviewPresentationControllerIfNeeded:](self, "_preparePreviewPresentationControllerIfNeeded:", v20);

      -[_UIPreviewInteractionController setPerformingPreviewTransition:](self, "setPerformingPreviewTransition:", 1);
      v25[0] = MEMORY[0x1E0C809B0];
      v25[1] = 3221225472;
      v25[2] = __99___UIPreviewInteractionController__preparePreviewViewControllerPresentationFromPreviewInteraction___block_invoke;
      v25[3] = &unk_1E16B1B50;
      v25[4] = self;
      v21 = v12;
      v26 = v21;
      objc_msgSend(v24, "presentViewController:animated:completion:", v21, 1, v25);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "previewInteractionController:willPresentViewController:", self, v21);

      v14 = v24;
      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionController.m"), 394, CFSTR("The view controller returned from -previewViewControllerForPosition:inSourceView: must not already be presented"));

    goto LABEL_6;
  }
LABEL_11:

LABEL_13:
  return v15;
}

- (void)_dismissPreviewViewControllerIfNeeded
{
  id v3;

  -[_UIPreviewInteractionController _dismissPreviewViewControllerIfNeededWithCompletion:](self, "_dismissPreviewViewControllerIfNeededWithCompletion:", 0);
  -[_UIPreviewInteractionController previewActionsController](self, "previewActionsController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissPreviewActionsWithCompletion:", 0);

}

- (void)_dismissPreviewViewControllerIfNeededWithCompletion:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t);
  void *v16;
  id v17;
  _UIPreviewInteractionController *v18;
  id v19;
  void (**v20)(_QWORD);

  v4 = (void (**)(_QWORD))a3;
  -[_UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && !-[_UIPreviewInteractionController performingCommitTransition](self, "performingCommitTransition"))
  {
    objc_msgSend(v5, "transitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v6, "isInteractive") & 1) != 0)
    {
      -[_UIPreviewInteractionController currentPresentationTransition](self, "currentPresentationTransition");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "cancelTransition");

      if (v4)
        v4[2](v4);
    }
    else
    {
      -[_UIPreviewInteractionController setDismissingPreview:](self, "setDismissingPreview:", 1);
      -[_UIPreviewInteractionController delegate](self, "delegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = MEMORY[0x1E0C809B0];
      v14 = 3221225472;
      v15 = __87___UIPreviewInteractionController__dismissPreviewViewControllerIfNeededWithCompletion___block_invoke;
      v16 = &unk_1E16B4420;
      v9 = v8;
      v17 = v9;
      v18 = self;
      v10 = v5;
      v19 = v10;
      v20 = v4;
      v11 = (void (**)(_QWORD))_Block_copy(&v13);
      objc_msgSend(v10, "presentingViewController", v13, v14, v15, v16);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
        objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, v11);
      else
        v11[2](v11);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v9, "previewInteractionController:willDismissViewController:", self, v10);

    }
  }

}

- (void)_finalizeAfterPreviewViewControllerPresentation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[_UIPreviewInteractionController _stopCurrentInteractionEffect](self, "_stopCurrentInteractionEffect");
  -[_UIPreviewInteractionController _finalizeHighlighterAfterPreviewViewControllerPresentation](self, "_finalizeHighlighterAfterPreviewViewControllerPresentation");
  -[_UIPreviewInteractionController setCommitTransitionScheduled:](self, "setCommitTransitionScheduled:", 0);
  -[_UIPreviewInteractionController setCurrentPresentationTransition:](self, "setCurrentPresentationTransition:", 0);
  -[_UIPreviewInteractionController setCurrentDismissTransition:](self, "setCurrentDismissTransition:", 0);
  -[_UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setOverrideUseCustomPresentation:", 0);

  -[_UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setOverrideTransitioningDelegate:", 0);

  -[_UIPreviewInteractionController setCurrentPreviewViewController:](self, "setCurrentPreviewViewController:", 0);
  -[_UIPreviewInteractionController setCurrentPresentationController:](self, "setCurrentPresentationController:", 0);
  -[_UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEnabled:", 0);

  -[_UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEnabled:", 1);

  -[_UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEnabled:", 0);

  -[_UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", 1);

  -[_UIPreviewInteractionController gestureRecognizerForPreviewActions](self, "gestureRecognizerForPreviewActions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setEnabled:", 0);

  -[_UIPreviewInteractionController gestureRecognizerForPreviewActions](self, "gestureRecognizerForPreviewActions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setEnabled:", 1);

  -[_UIPreviewInteractionController sourceView](self, "sourceView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionController gestureRecognizerForPreviewActions](self, "gestureRecognizerForPreviewActions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addGestureRecognizer:", v12);

  -[_UIPreviewInteractionController setPreviewActionsController:](self, "setPreviewActionsController:", 0);
  -[_UIPreviewInteractionController setHasTransitionedToPreview:](self, "setHasTransitionedToPreview:", 0);
  -[_UIPreviewInteractionController setPresentedViewTouchForceProvider:](self, "setPresentedViewTouchForceProvider:", 0);
  -[_UIPreviewInteractionController setPausingTouchForceProvider:](self, "setPausingTouchForceProvider:", 0);
  -[_UIPreviewInteractionController previewInteraction](self, "previewInteraction");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setTouchForceProvider:", 0);

}

- (void)_revertInteractionEffectToStartState
{
  void *v3;
  id v4;

  -[_UIPreviewInteractionController currentInteractionEffect](self, "currentInteractionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIPreviewInteractionController currentInteractionEffect](self, "currentInteractionEffect");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setForceFactor:", 0.0);

  }
}

- (id)_newHighlighterForPreviewingContext:(id)a3
{
  void *v3;
  __objc2_class **v4;
  id v5;

  objc_msgSend(a3, "customViewForInteractiveHighlight");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = off_1E167CB98;
  if (v3)
    v4 = off_1E167CB88;
  v5 = objc_alloc_init(*v4);

  return v5;
}

- (void)_finalizeHighlighterAfterPreviewViewControllerPresentation
{
  void *v3;
  id v4;

  -[_UIPreviewInteractionController currentHighlighter](self, "currentHighlighter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[_UIPreviewInteractionController currentPreviewingContext](self, "currentPreviewingContext");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "finalizeHighlightForPreviewingContext:", v3);

    -[_UIPreviewInteractionController setCurrentHighlighter:](self, "setCurrentHighlighter:", 0);
  }

}

- (BOOL)_isLongPressGestureRecognizerUsedForDelayingActions:(id)a3
{
  id v3;
  char isDragInteractionGestureRecognizer;
  double v5;

  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    isDragInteractionGestureRecognizer = 0;
  }
  else if (objc_msgSend(v3, "_isGestureType:", 1)
         && (objc_msgSend(v3, "minimumPressDuration"), v5 >= 0.5))
  {
    isDragInteractionGestureRecognizer = 1;
  }
  else
  {
    isDragInteractionGestureRecognizer = _isDragInteractionGestureRecognizer(v3);
  }

  return isDragInteractionGestureRecognizer;
}

- (void)_handleSteadyTouchForceGesture:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "state") == 3)
  {
    objc_msgSend(v4, "_allActiveTouches");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v27;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v27 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
          v22 = 0u;
          v23 = 0u;
          v24 = 0u;
          v25 = 0u;
          objc_msgSend(v10, "gestureRecognizers");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
          if (v12)
          {
            v13 = v12;
            v14 = *(_QWORD *)v23;
            while (2)
            {
              for (j = 0; j != v13; ++j)
              {
                if (*(_QWORD *)v23 != v14)
                  objc_enumerationMutation(v11);
                v16 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * j);
                if (-[_UIPreviewInteractionController _isLongPressGestureRecognizerUsedForDelayingActions:](self, "_isLongPressGestureRecognizerUsedForDelayingActions:", v16)&& objc_msgSend(v16, "state") != 5)
                {
                  -[_UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
                  v17 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v17)
                  {
                    -[_UIPreviewInteractionController previewInteraction](self, "previewInteraction");
                    v18 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v18, "cancelInteraction");

                    -[_UIPreviewInteractionController previewInteraction](self, "previewInteraction");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    -[_UIPreviewInteractionController previewInteractionDidCancel:](self, "previewInteractionDidCancel:", v19);
                  }
                  else
                  {
                    -[_UIPreviewInteractionController revealGestureRecognizer](self, "revealGestureRecognizer");
                    v20 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v20, "cancel");

                    -[_UIPreviewInteractionController previewGestureRecognizer](self, "previewGestureRecognizer");
                    v19 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v19, "cancel");
                  }

                  goto LABEL_23;
                }
              }
              v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
              if (v13)
                continue;
              break;
            }
          }

          v8 = v21;
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v7);
    }
LABEL_23:

  }
}

- (BOOL)_viewControllerIsChildOfTwoColumnSplitViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    LODWORD(self) = objc_msgSend(v4, "_isCollapsed") ^ 1;
  }
  else if (v4)
  {
    objc_msgSend(v4, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      objc_msgSend(v4, "presentationController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v6;
      if (v6 && (objc_msgSend(v6, "shouldPresentInFullscreen") & 1) == 0)
      {
        objc_msgSend(v4, "presentingViewController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v5 = 0;
      }

    }
    LOBYTE(self) = -[_UIPreviewInteractionController _viewControllerIsChildOfTwoColumnSplitViewController:](self, "_viewControllerIsChildOfTwoColumnSplitViewController:", v5);

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (BOOL)_previewingIsPossibleForView:(id)a3
{
  void *v4;

  objc_msgSend(a3, "_viewControllerForAncestor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = !-[_UIPreviewInteractionController _viewControllerIsChildOfTwoColumnSplitViewController:](self, "_viewControllerIsChildOfTwoColumnSplitViewController:", v4);

  return (char)self;
}

- (id)_preparedInteractionEffect
{
  _UIInteractionEffect_deprecated *currentInteractionEffect;
  _UIInteractionEffect_deprecated **p_currentInteractionEffect;
  _UIInteractionEffect_deprecated *v6;
  _QWORD v7[4];
  id v8;
  id location;

  p_currentInteractionEffect = &self->_currentInteractionEffect;
  currentInteractionEffect = self->_currentInteractionEffect;
  if (currentInteractionEffect)
    return currentInteractionEffect;
  v6 = objc_alloc_init(_UIInteractionEffect_deprecated);
  objc_initWeak(&location, self);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __61___UIPreviewInteractionController__preparedInteractionEffect__block_invoke;
  v7[3] = &unk_1E16DAD78;
  objc_copyWeak(&v8, &location);
  -[_UIInteractionEffect_deprecated setUpdateBlock:](v6, "setUpdateBlock:", v7);
  objc_storeStrong((id *)p_currentInteractionEffect, v6);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
  return v6;
}

- (void)_stopCurrentInteractionEffect
{
  void *v3;

  -[_UIPreviewInteractionController currentInteractionEffect](self, "currentInteractionEffect");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUpdateBlock:", 0);

  -[_UIPreviewInteractionController setCurrentInteractionEffect:](self, "setCurrentInteractionEffect:", 0);
}

- (id)_preferredNavigationControllerForCommitTransition
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  -[_UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_opt_class();
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__154;
  v13 = __Block_byref_object_dispose__154;
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v14 = v5;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __84___UIPreviewInteractionController__preferredNavigationControllerForCommitTransition__block_invoke;
  v8[3] = &unk_1E16DAC88;
  v8[4] = &v9;
  v8[5] = v4;
  objc_msgSend(v3, "_traverseViewControllerHierarchyFromLevel:withBlock:", 0, v8);
  v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (void)_preparePreviewPresentationControllerIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[_UIPreviewInteractionController currentHighlighter](self, "currentHighlighter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentHighlighter:", v5);

  -[_UIPreviewInteractionController currentPresentationTransition](self, "currentPresentationTransition");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "interactiveTransitionFraction");
  objc_msgSend(v4, "setInteractiveTransitionFraction:");
  objc_msgSend(v7, "_preparedPresentationAnimator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCurrentTransitionAnimator:", v6);

}

- (id)_previewPresentationControllerForViewController:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(a3, "_existingPresentationControllerImmediate:effective:", 1, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (void)_resetCustomPresentationHooks
{
  void *v3;
  id v4;

  -[_UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setOverrideUseCustomPresentation:", 0);

  -[_UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setOverrideTransitioningDelegate:", 0);

}

- (void)_overrideSourceViewForBinaryCompatibilityIfNeeded:(id *)a3 sourceRect:(CGRect *)a4
{
  void *v7;
  void *v8;
  void *v9;
  CGFloat v10;
  CGFloat v11;
  CGFloat v12;
  CGFloat v13;
  id v14;

  -[_UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourceView");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  v8 = v14;
  if (v14)
  {
    *a3 = objc_retainAutorelease(v14);
    -[_UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "sourceRect");
    a4->origin.x = v10;
    a4->origin.y = v11;
    a4->size.width = v12;
    a4->size.height = v13;

    v8 = v14;
  }

}

- (void)_handlePreviewActionsGesture:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  void *v22;
  _UIPreviewInteractionCompatibilityTouchForceProvider *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  _QWORD v31[5];
  CGPoint v32;
  CGRect v33;

  v4 = a3;
  -[_UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5
    && !-[_UIPreviewInteractionController performingCommitTransition](self, "performingCommitTransition")
    && -[_UIPreviewInteractionController hasTransitionedToPreview](self, "hasTransitionedToPreview"))
  {
    -[_UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "containerView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "contentPlatterView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[_UIPreviewInteractionController previewActionsController](self, "previewActionsController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      -[_UIPreviewInteractionController currentPresentationController](self, "currentPresentationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "presentedViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7 || !v9 || !v12)
      {
LABEL_28:

        goto LABEL_29;
      }
      +[_UIPreviewActionsController actionsControllerWithContainerView:platterView:presentedViewController:delegate:](_UIPreviewActionsController, "actionsControllerWithContainerView:platterView:presentedViewController:delegate:", v7, v9, v12, self);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[_UIPreviewInteractionController setPreviewActionsController:](self, "setPreviewActionsController:", v13);

    }
    -[_UIPreviewInteractionController previewActionsController](self, "previewActionsController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      objc_msgSend(v4, "locationInView:", v7);
      v15 = v14;
      v17 = v16;
      if (objc_msgSend(v4, "state") == 1 || objc_msgSend(v4, "state") == 2)
      {
        -[_UIPreviewInteractionController previewActionsController](self, "previewActionsController");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "frameForActionView");
        v32.x = v15;
        v32.y = v17;
        v19 = CGRectContainsPoint(v33, v32);

        if (!v19)
        {
          if ((objc_msgSend(v12, "hasBegun") & 1) != 0)
          {
            objc_msgSend(v12, "updatePanningLocation:", v15, v17);
          }
          else
          {
            objc_msgSend(v12, "beginPanningAtLocation:", v15, v17);
            -[_UIPreviewInteractionController setInitialLocationForPreviewActionsPanning:](self, "setInitialLocationForPreviewActionsPanning:", v15, v17);
          }
        }
      }
      else if (objc_msgSend(v4, "state") == 3 || objc_msgSend(v4, "state") == 4)
      {
        if (v7)
        {
          -[_UIPreviewInteractionController previewInteraction](self, "previewInteraction");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "touchForceProvider");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          -[_UIPreviewInteractionController presentedViewTouchForceProvider](self, "presentedViewTouchForceProvider");
          v22 = (void *)objc_claimAutoreleasedReturnValue();

          if (v21 != v22)
          {
            v23 = -[_UIPreviewInteractionCompatibilityTouchForceProvider initWithView:]([_UIPreviewInteractionCompatibilityTouchForceProvider alloc], "initWithView:", v7);
            -[_UIPreviewInteractionController setPresentedViewTouchForceProvider:](self, "setPresentedViewTouchForceProvider:", v23);

            -[_UIPreviewInteractionController gestureRecognizerForPreviewActions](self, "gestureRecognizerForPreviewActions");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addGestureRecognizer:", v24);

          }
        }
        if (objc_msgSend(v12, "hasBegun"))
          objc_msgSend(v12, "endPanningAtLocation:", v15, v17);
        objc_msgSend(v12, "totalPanningTranslation");
        v26 = v25;
        v28 = v27;
        -[_UIPreviewInteractionController initialLocationForPreviewActionsPanning](self, "initialLocationForPreviewActionsPanning");
        if (!v7 || sqrt((v15 - v29) * (v15 - v29) + (v17 - v30) * (v17 - v30)) < 45.0 && v26 <= 45.0 && v28 <= 45.0)
        {
          v31[0] = MEMORY[0x1E0C809B0];
          v31[1] = 3221225472;
          v31[2] = __64___UIPreviewInteractionController__handlePreviewActionsGesture___block_invoke;
          v31[3] = &unk_1E16B1B28;
          v31[4] = self;
          objc_msgSend(v12, "dismissPreviewActionsWithCompletion:", v31);
        }
      }
    }
    goto LABEL_28;
  }
LABEL_29:

}

- (CGPoint)initialPlatterPositionForPreviewActionsController:(id)a3
{
  void *v3;
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
  CGPoint result;

  -[_UIPreviewInteractionController currentPresentationController](self, "currentPresentationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_computedPlatterFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = v5 + v9 * 0.5;
  v13 = v7 + v11 * 0.5;
  result.y = v13;
  result.x = v12;
  return result;
}

- (CGSize)maximumPreviewActionsViewSizeForPreviewActionsController:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat Width;
  double v20;
  double v21;
  CGSize result;
  CGRect v23;
  CGRect v24;

  -[_UIPreviewInteractionController currentPresentationController](self, "currentPresentationController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "frame");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  _UIPreviewInteractionPlatterInsetsForRect(v6, v8, v10, v12);
  v14 = v8 + v13;
  v17 = v10 - (v15 + v16);
  v23.size.height = v12 - (v13 + v18);
  v23.origin.x = v6 + v15;
  v23.origin.y = v14;
  v23.size.width = v17;
  Width = CGRectGetWidth(v23);
  v24.origin.x = v6;
  v24.origin.y = v8;
  v24.size.width = v10;
  v24.size.height = v12;
  v20 = CGRectGetHeight(v24) * 0.8;
  v21 = Width;
  result.height = v20;
  result.width = v21;
  return result;
}

- (void)previewActionsController:(id)a3 didCompleteWithSelectedAction:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a4;
  -[_UIPreviewInteractionController currentPreviewViewController](self, "currentPreviewViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionController previewInteraction](self, "previewInteraction");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cancelInteraction");

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __90___UIPreviewInteractionController_previewActionsController_didCompleteWithSelectedAction___block_invoke;
  v10[3] = &unk_1E16B1B50;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  -[_UIPreviewInteractionController _dismissPreviewViewControllerIfNeededWithCompletion:](self, "_dismissPreviewViewControllerIfNeededWithCompletion:", v10);

}

- (void)didDismissPreviewActionsController:(id)a3
{
  void *v4;

  -[_UIPreviewInteractionController previewInteraction](self, "previewInteraction", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "cancelInteraction");

  -[_UIPreviewInteractionController _dismissPreviewViewControllerIfNeeded](self, "_dismissPreviewViewControllerIfNeeded");
}

- (void)previewActionsController:(id)a3 didUpdatePlatterTranslation:(CGVector)a4 withVelocity:(CGVector)a5
{
  _BOOL4 v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _UIPreviewInteractionDecayTouchForceProvider *v14;
  void *v15;
  void *v16;
  id v17;

  v6 = fabs(a4.dx) <= 22.0;
  v7 = fabs(a4.dy) <= 44.0 && v6;
  -[_UIPreviewInteractionController pausingTouchForceProvider](self, "pausingTouchForceProvider", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    if (v7)
    {
      -[_UIPreviewInteractionController presentedViewTouchForceProvider](self, "presentedViewTouchForceProvider");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        -[_UIPreviewInteractionController presentedViewTouchForceProvider](self, "presentedViewTouchForceProvider");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = 0;
      }
      -[_UIPreviewInteractionController previewInteraction](self, "previewInteraction");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setTouchForceProvider:", v10);

      if (v9)
      -[_UIPreviewInteractionController setPausingTouchForceProvider:](self, "setPausingTouchForceProvider:", 0);
    }
  }
  else if (!v7)
  {
    -[_UIPreviewInteractionController presentedViewTouchForceProvider](self, "presentedViewTouchForceProvider");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      -[_UIPreviewInteractionController presentedViewTouchForceProvider](self, "presentedViewTouchForceProvider");
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[_UIPreviewInteractionController previewInteraction](self, "previewInteraction");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "touchForceProvider");
      v17 = (id)objc_claimAutoreleasedReturnValue();

    }
    v14 = -[_UIPreviewInteractionDecayTouchForceProvider initWithTouchForceProvider:]([_UIPreviewInteractionDecayTouchForceProvider alloc], "initWithTouchForceProvider:", v17);
    -[_UIPreviewInteractionController setPausingTouchForceProvider:](self, "setPausingTouchForceProvider:", v14);

    -[_UIPreviewInteractionController pausingTouchForceProvider](self, "pausingTouchForceProvider");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewInteractionController previewInteraction](self, "previewInteraction");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTouchForceProvider:", v15);

    -[_UIPreviewInteractionController _revertInteractionEffectToStartState](self, "_revertInteractionEffectToStartState");
  }
}

- (_UIPreviewInteractionControllerDelegate)delegate
{
  return (_UIPreviewInteractionControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGPoint)location
{
  double x;
  double y;
  CGPoint result;

  x = self->_location.x;
  y = self->_location.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setLocation:(CGPoint)a3
{
  self->_location = a3;
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (UIPreviewInteraction)previewInteraction
{
  return self->_previewInteraction;
}

- (void)setPreviewInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_previewInteraction, a3);
}

- (_UIPreviewInteractionTouchForceProviding)presentedViewTouchForceProvider
{
  return self->_presentedViewTouchForceProvider;
}

- (void)setPresentedViewTouchForceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_presentedViewTouchForceProvider, a3);
}

- (_UIPreviewInteractionTouchForceProviding)pausingTouchForceProvider
{
  return self->_pausingTouchForceProvider;
}

- (void)setPausingTouchForceProvider:(id)a3
{
  objc_storeStrong((id *)&self->_pausingTouchForceProvider, a3);
}

- (_UIPreviewInteractionGestureRecognizer)revealGestureRecognizer
{
  return self->_revealGestureRecognizer;
}

- (void)setRevealGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_revealGestureRecognizer, a3);
}

- (_UIPreviewInteractionGestureRecognizer)previewGestureRecognizer
{
  return self->_previewGestureRecognizer;
}

- (void)setPreviewGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_previewGestureRecognizer, a3);
}

- (_UISteadyTouchForceGestureRecognizer)steadyTouchForceGestureRecognizer
{
  return self->_steadyTouchForceGestureRecognizer;
}

- (void)setSteadyTouchForceGestureRecognizer:(id)a3
{
  objc_storeStrong((id *)&self->_steadyTouchForceGestureRecognizer, a3);
}

- (UIViewController)currentPreviewViewController
{
  return self->_currentPreviewViewController;
}

- (void)setCurrentPreviewViewController:(id)a3
{
  objc_storeStrong((id *)&self->_currentPreviewViewController, a3);
}

- (_UIPreviewPresentationController2)currentPresentationController
{
  return self->_currentPresentationController;
}

- (void)setCurrentPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_currentPresentationController, a3);
}

- (_UIPreviewInteractionHighlighting)currentHighlighter
{
  return self->_currentHighlighter;
}

- (void)setCurrentHighlighter:(id)a3
{
  objc_storeStrong((id *)&self->_currentHighlighter, a3);
}

- (_UIPreviewInteractionPresentationTransition)currentPresentationTransition
{
  return self->_currentPresentationTransition;
}

- (void)setCurrentPresentationTransition:(id)a3
{
  objc_storeStrong((id *)&self->_currentPresentationTransition, a3);
}

- (_UIPreviewInteractionDismissTransition)currentDismissTransition
{
  return self->_currentDismissTransition;
}

- (void)setCurrentDismissTransition:(id)a3
{
  objc_storeStrong((id *)&self->_currentDismissTransition, a3);
}

- (_UIPreviewInteractionCommitTransition)currentCommitTransition
{
  return self->_currentCommitTransition;
}

- (void)setCurrentCommitTransition:(id)a3
{
  objc_storeStrong((id *)&self->_currentCommitTransition, a3);
}

- (BOOL)performingPreviewTransition
{
  return self->_performingPreviewTransition;
}

- (void)setPerformingPreviewTransition:(BOOL)a3
{
  self->_performingPreviewTransition = a3;
}

- (BOOL)hasTransitionedToPreview
{
  return self->_hasTransitionedToPreview;
}

- (void)setHasTransitionedToPreview:(BOOL)a3
{
  self->_hasTransitionedToPreview = a3;
}

- (BOOL)dismissingPreview
{
  return self->_dismissingPreview;
}

- (void)setDismissingPreview:(BOOL)a3
{
  self->_dismissingPreview = a3;
}

- (BOOL)commitTransitionScheduled
{
  return self->_commitTransitionScheduled;
}

- (void)setCommitTransitionScheduled:(BOOL)a3
{
  self->_commitTransitionScheduled = a3;
}

- (BOOL)performingCommitTransition
{
  return self->_performingCommitTransition;
}

- (void)setPerformingCommitTransition:(BOOL)a3
{
  self->_performingCommitTransition = a3;
}

- (_UIInteractionEffect_deprecated)currentInteractionEffect
{
  return self->_currentInteractionEffect;
}

- (void)setCurrentInteractionEffect:(id)a3
{
  objc_storeStrong((id *)&self->_currentInteractionEffect, a3);
}

- (_UITouchesObservingGestureRecognizer)gestureRecognizerForPreviewActions
{
  return self->_gestureRecognizerForPreviewActions;
}

- (void)setGestureRecognizerForPreviewActions:(id)a3
{
  objc_storeStrong((id *)&self->_gestureRecognizerForPreviewActions, a3);
}

- (_UIPreviewActionsController)previewActionsController
{
  return self->_previewActionsController;
}

- (void)setPreviewActionsController:(id)a3
{
  objc_storeStrong((id *)&self->_previewActionsController, a3);
}

- (CGPoint)initialLocationForPreviewActionsPanning
{
  double x;
  double y;
  CGPoint result;

  x = self->_initialLocationForPreviewActionsPanning.x;
  y = self->_initialLocationForPreviewActionsPanning.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setInitialLocationForPreviewActionsPanning:(CGPoint)a3
{
  self->_initialLocationForPreviewActionsPanning = a3;
}

- (UIViewControllerPreviewing_Internal)currentPreviewingContext
{
  return (UIViewControllerPreviewing_Internal *)objc_loadWeakRetained((id *)&self->_currentPreviewingContext);
}

- (void)setCurrentPreviewingContext:(id)a3
{
  objc_storeWeak((id *)&self->_currentPreviewingContext, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_currentPreviewingContext);
  objc_storeStrong((id *)&self->_previewActionsController, 0);
  objc_storeStrong((id *)&self->_gestureRecognizerForPreviewActions, 0);
  objc_storeStrong((id *)&self->_currentInteractionEffect, 0);
  objc_storeStrong((id *)&self->_currentCommitTransition, 0);
  objc_storeStrong((id *)&self->_currentDismissTransition, 0);
  objc_storeStrong((id *)&self->_currentPresentationTransition, 0);
  objc_storeStrong((id *)&self->_currentHighlighter, 0);
  objc_storeStrong((id *)&self->_currentPresentationController, 0);
  objc_storeStrong((id *)&self->_currentPreviewViewController, 0);
  objc_storeStrong((id *)&self->_steadyTouchForceGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_previewGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_revealGestureRecognizer, 0);
  objc_storeStrong((id *)&self->_pausingTouchForceProvider, 0);
  objc_storeStrong((id *)&self->_presentedViewTouchForceProvider, 0);
  objc_storeStrong((id *)&self->_previewInteraction, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
