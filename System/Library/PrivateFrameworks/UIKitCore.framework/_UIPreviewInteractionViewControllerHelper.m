@implementation _UIPreviewInteractionViewControllerHelper

- (_UIPreviewInteractionViewControllerHelper)initWithViewControllerPresentation:(id)a3
{
  id v6;
  _UIPreviewInteractionViewControllerHelper *v7;
  _UIPreviewInteractionViewControllerHelper *v8;
  void *v9;
  void *v10;
  void *v11;
  _UIPreviewInteractionViewControllerHelper *v12;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("_UIPreviewInteractionViewControllerHelper.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("viewControllerPresentation"));

  }
  v15.receiver = self;
  v15.super_class = (Class)_UIPreviewInteractionViewControllerHelper;
  v7 = -[_UIPreviewInteractionViewControllerHelper init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_viewControllerPresentation, a3);
    objc_msgSend(v6, "presentationController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v8->_shouldUseDefaultPresentationController = 0;
    }
    else
    {
      objc_msgSend(v6, "appearanceTransition");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10)
      {
        v8->_shouldUseDefaultPresentationController = 0;
      }
      else
      {
        objc_msgSend(v6, "disappearanceTransition");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v8->_shouldUseDefaultPresentationController = v11 == 0;

      }
    }

    v12 = v8;
  }

  return v8;
}

- (void)presentViewControllerFromViewController:(id)a3 highlighter:(id)a4 presentationCompletion:(id)a5 dismissalCompletion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  id presentationCompletion;
  void *v16;
  id dismissalCompletion;
  _QWORD v18[4];
  id v19;
  id v20;
  id location;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_storeStrong((id *)&self->_highlighter, a4);
  v14 = (void *)objc_msgSend(v12, "copy");
  presentationCompletion = self->_presentationCompletion;
  self->_presentationCompletion = v14;

  v16 = (void *)objc_msgSend(v13, "copy");
  dismissalCompletion = self->_dismissalCompletion;
  self->_dismissalCompletion = v16;

  if (-[_UIPreviewInteractionViewControllerPresentation shouldPresentAutomatically](self->_viewControllerPresentation, "shouldPresentAutomatically"))
  {
    -[_UIPreviewInteractionViewControllerHelper _performPresentViewControllerFromViewController:](self, "_performPresentViewControllerFromViewController:", v10);
  }
  else
  {
    -[_UIPreviewInteractionHighlighter _animateForDelayedViewControllerPresentation](self->_highlighter, "_animateForDelayedViewControllerPresentation");
    objc_initWeak(&location, self);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __140___UIPreviewInteractionViewControllerHelper_presentViewControllerFromViewController_highlighter_presentationCompletion_dismissalCompletion___block_invoke;
    v18[3] = &unk_1E16B1500;
    objc_copyWeak(&v20, &location);
    v19 = v10;
    -[_UIPreviewInteractionViewControllerPresentation setPrivatePresentationBlock:](self->_viewControllerPresentation, "setPrivatePresentationBlock:", v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

}

- (void)dismissViewController
{
  void *v3;
  _UIPreviewInteractionHighlighter *v4;
  id v5;

  -[_UIPreviewInteractionViewControllerPresentation viewController](self->_viewControllerPresentation, "viewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "presentingViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, 0);
  }
  else
  {
    if (-[_UIPreviewInteractionViewControllerPresentation shouldPresentAutomatically](self->_viewControllerPresentation, "shouldPresentAutomatically"))
    {
      v4 = 0;
    }
    else
    {
      v4 = self->_highlighter;
    }
    -[_UIPreviewInteractionViewControllerHelper _finalizeAfterViewControllerPresentation](self, "_finalizeAfterViewControllerPresentation");
    -[_UIPreviewInteractionViewControllerHelper _performDismissalCompletionIfNeeded](self, "_performDismissalCompletionIfNeeded");
    if (v4)
      -[_UIPreviewInteractionHighlighter _delayedViewControllerPresentationDidCancel](v4, "_delayedViewControllerPresentationDidCancel");

  }
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  *((_BYTE *)self + 48) = 1;
  return self;
}

- (id)animationControllerForDismissedController:(id)a3
{
  *((_BYTE *)self + 48) = 0;
  return self;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  _UIPreviewInteractionHighlighter *v13;
  uint64_t v14;
  _UIPreviewInteractionHighlighter *v15;
  _UIPreviewInteractionHighlighter *v16;
  _QWORD v18[4];
  _UIPreviewInteractionHighlighter *v19;
  id v20;
  id location;
  _QWORD v22[4];
  _UIPreviewInteractionHighlighter *v23;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_shouldUseDefaultPresentationController)
    -[_UIPreviewInteractionViewControllerHelper defaultPresentationControllerForPresentedViewController:presentingViewController:sourceViewController:](self, "defaultPresentationControllerForPresentedViewController:presentingViewController:sourceViewController:", v8, v9, v10);
  else
    -[_UIPreviewInteractionViewControllerHelper customPresentationControllerForPresentedViewController:presentingViewController:sourceViewController:](self, "customPresentationControllerForPresentedViewController:presentingViewController:sourceViewController:", v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPreviewPresentationDelegate:", self);
  objc_msgSend(v11, "setAppliesVisualEffectsToPresentingView:", 0);
  objc_msgSend(v11, "_setShouldContinueTouchesOnTargetViewController:", 1);
  -[_UIPreviewInteractionViewControllerPresentation customViewForTouchContinuation](self->_viewControllerPresentation, "customViewForTouchContinuation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setCustomViewForTouchContinuation:", v12);

  objc_msgSend(v11, "_setContainerIgnoresDirectTouchEvents:", 0);
  v13 = self->_highlighter;
  v14 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __140___UIPreviewInteractionViewControllerHelper_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke;
  v22[3] = &unk_1E16B6288;
  v15 = v13;
  v23 = v15;
  objc_msgSend(v11, "set_containerSuperviewForCurrentTransition:", v22);
  objc_initWeak(&location, self);
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __140___UIPreviewInteractionViewControllerHelper_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2;
  v18[3] = &unk_1E16B1500;
  objc_copyWeak(&v20, &location);
  v16 = v15;
  v19 = v16;
  objc_msgSend(v11, "setDismissalTransitionDidEndBlock:", v18);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

  return v11;
}

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v5;
  _BOOL4 shouldActAsAppearanceAnimationController;
  void *v7;
  void *v8;
  void *v9;
  _UIPreviewInteractionViewControllerPresentation *viewControllerPresentation;
  _UIPreviewInteractionCrossBlurViewControllerTransition *v11;
  char v12;
  uint64_t v13;
  _UIPreviewInteractionCrossBlurViewControllerTransition *v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  _UIPreviewInteractionCrossBlurViewControllerTransition *v20;
  void *v21;
  double v22;
  double v23;
  _QWORD v24[4];
  id v25;
  _QWORD v26[4];
  id v27;
  _UIPreviewInteractionCrossBlurViewControllerTransition *v28;
  id v29;
  BOOL v30;
  id location;
  _QWORD aBlock[5];
  _UIPreviewInteractionCrossBlurViewControllerTransition *v33;
  id v34;
  id v35;
  id v36;
  BOOL v37;
  _QWORD v38[4];
  _UIPreviewInteractionCrossBlurViewControllerTransition *v39;
  id v40;
  id v41;
  id v42;

  v5 = a3;
  objc_storeStrong((id *)&self->_currentTransitionContext, a3);
  shouldActAsAppearanceAnimationController = self->_shouldActAsAppearanceAnimationController;
  objc_msgSend(v5, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForKey:", CFSTR("UITransitionContextFromView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForKey:", CFSTR("UITransitionContextToView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  viewControllerPresentation = self->_viewControllerPresentation;
  if (shouldActAsAppearanceAnimationController)
    -[_UIPreviewInteractionViewControllerPresentation appearanceTransition](viewControllerPresentation, "appearanceTransition");
  else
    -[_UIPreviewInteractionViewControllerPresentation disappearanceTransition](viewControllerPresentation, "disappearanceTransition");
  v11 = (_UIPreviewInteractionCrossBlurViewControllerTransition *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = objc_alloc_init(_UIPreviewInteractionCrossBlurViewControllerTransition);
    -[_UIPreviewInteractionCrossBlurViewControllerTransition setDismissTransition:](v11, "setDismissTransition:", !shouldActAsAppearanceAnimationController);
  }
  v12 = objc_opt_respondsToSelector();
  v13 = MEMORY[0x1E0C809B0];
  if ((v12 & 1) != 0)
  {
    v38[0] = MEMORY[0x1E0C809B0];
    v38[1] = 3221225472;
    v38[2] = __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke;
    v38[3] = &unk_1E16B51E8;
    v39 = v11;
    v40 = v8;
    v41 = v9;
    v42 = v7;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v38);

  }
  aBlock[0] = v13;
  aBlock[1] = 3221225472;
  aBlock[2] = __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke_2;
  aBlock[3] = &unk_1E16BFCF8;
  v37 = shouldActAsAppearanceAnimationController;
  aBlock[4] = self;
  v14 = v11;
  v33 = v14;
  v15 = v8;
  v34 = v15;
  v16 = v9;
  v35 = v16;
  v17 = v7;
  v36 = v17;
  v18 = _Block_copy(aBlock);
  objc_initWeak(&location, self);
  v26[0] = v13;
  v26[1] = 3221225472;
  v26[2] = __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke_3;
  v26[3] = &unk_1E16DAB48;
  objc_copyWeak(&v29, &location);
  v19 = v5;
  v27 = v19;
  v20 = v14;
  v28 = v20;
  v30 = shouldActAsAppearanceAnimationController;
  v21 = _Block_copy(v26);
  -[_UIPreviewInteractionViewControllerPresentation setPrivatePresentationCompletionBlock:](self->_viewControllerPresentation, "setPrivatePresentationCompletionBlock:", v21);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UIPreviewInteractionCrossBlurViewControllerTransition performWithCustomAnimator:completion:](v20, "performWithCustomAnimator:completion:", v18, v21);
  }
  else if (-[_UIPreviewInteractionViewControllerPresentation shouldUseCATransitions](self->_viewControllerPresentation, "shouldUseCATransitions"))
  {
    -[_UIPreviewInteractionViewControllerHelper transitionDuration:](self, "transitionDuration:", v19);
    +[UIView animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:](UIView, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v18, v21);
  }
  else
  {
    v22 = dbl_186681F70[!shouldActAsAppearanceAnimationController];
    if (shouldActAsAppearanceAnimationController)
      v23 = 44.0;
    else
      v23 = 35.0;
    v24[0] = MEMORY[0x1E0C809B0];
    v24[1] = 3221225472;
    v24[2] = __63___UIPreviewInteractionViewControllerHelper_animateTransition___block_invoke_4;
    v24[3] = &unk_1E16C0E38;
    v25 = v21;
    +[UIView _animateUsingSpringWithTension:friction:interactive:animations:completion:](UIView, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v18, v24, v22, v23);

  }
  objc_destroyWeak(&v29);
  objc_destroyWeak(&location);

}

- (void)_performPresentViewControllerFromViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[5];

  v4 = a3;
  -[_UIPreviewInteractionHighlighter _prepareForViewControllerPresentation:](self->_highlighter, "_prepareForViewControllerPresentation:", self->_viewControllerPresentation);
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[_UIPreviewInteractionViewControllerPresentation presentationController](self->_viewControllerPresentation, "presentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "_allowsAutorotation");

  if ((v8 & 1) == 0)
    objc_msgSend(v6, "beginDisablingInterfaceAutorotation");
  objc_storeStrong((id *)&self->_presentingWindow, v6);
  -[_UIPreviewInteractionViewControllerPresentation viewController](self->_viewControllerPresentation, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "parentViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_storeWeak((id *)&self->_previousParentViewController, v10);
    objc_msgSend(v9, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "superview");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&self->_previousSuperview, v12);

    objc_msgSend(v9, "willMoveToParentViewController:", 0);
    objc_msgSend(v9, "removeFromParentViewController");
  }
  objc_msgSend(v9, "_setOverrideUseCustomPresentation:", 1);
  objc_msgSend(v9, "_setOverrideTransitioningDelegate:", self);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __93___UIPreviewInteractionViewControllerHelper__performPresentViewControllerFromViewController___block_invoke;
  v13[3] = &unk_1E16B3FD8;
  v13[4] = self;
  objc_msgSend(v4, "_presentViewController:animated:completion:", v9, 1, v13);

}

- (id)defaultPresentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  _UIPreviewPresentationController2 *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = -[_UIPreviewPresentationController2 initWithPresentedViewController:presentingViewController:previewingContext:]([_UIPreviewPresentationController2 alloc], "initWithPresentedViewController:presentingViewController:previewingContext:", v8, v9, 0);
  -[_UIPreviewPresentationController2 setShouldScaleContentViewToAspectFitPlatter:](v11, "setShouldScaleContentViewToAspectFitPlatter:", 0);
  -[_UIPreviewPresentationController2 setShouldEnableUserInteractionOnPlatter:](v11, "setShouldEnableUserInteractionOnPlatter:", 1);
  -[_UIPreviewInteractionHighlighter interactiveHighlightEffect](self->_highlighter, "interactiveHighlightEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v11);
  v13 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __147___UIPreviewInteractionViewControllerHelper_defaultPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke;
  v20[3] = &unk_1E16BFAB8;
  objc_copyWeak(&v22, &location);
  v14 = v12;
  v21 = v14;
  -[UIPresentationController set_customFromViewForCurrentTransition:](v11, "set_customFromViewForCurrentTransition:", v20);
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __147___UIPreviewInteractionViewControllerHelper_defaultPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2;
  v17[3] = &unk_1E16BFAB8;
  objc_copyWeak(&v19, &location);
  v15 = v14;
  v18 = v15;
  -[UIPresentationController set_customToViewForCurrentTransition:](v11, "set_customToViewForCurrentTransition:", v17);

  objc_destroyWeak(&v19);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return v11;
}

- (id)customPresentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  UIPreviewPresentationController *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  BOOL v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  UIPreviewPresentationController *v23;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  BOOL v31;
  BOOL v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  BOOL v37;
  BOOL v38;
  id location[2];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_UIPreviewInteractionViewControllerPresentation presentationController](self->_viewControllerPresentation, "presentationController");
  v11 = (UIPreviewPresentationController *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    v11 = -[UIPreviewPresentationController initWithPresentedViewController:presentingViewController:]([UIPreviewPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v9);
  -[_UIPreviewInteractionHighlighter interactiveHighlightEffect](self->_highlighter, "interactiveHighlightEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(location, v11);
  -[UIPresentationController presentedView](v11, "presentedView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = v10;
  v26 = v8;
  v15 = v13 == v14;

  v16 = -[_UIPreviewInteractionViewControllerPresentation shouldFlipFromAndToViewsForDisappearanceTransition](self->_viewControllerPresentation, "shouldFlipFromAndToViewsForDisappearanceTransition");
  v17 = MEMORY[0x1E0C809B0];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __146___UIPreviewInteractionViewControllerHelper_customPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke;
  v33[3] = &unk_1E16DAB70;
  v37 = v15;
  v18 = v12;
  v34 = v18;
  objc_copyWeak(&v36, location);
  v38 = v16;
  v19 = v13;
  v35 = v19;
  -[UIPresentationController set_customFromViewForCurrentTransition:](v11, "set_customFromViewForCurrentTransition:", v33);
  v27[0] = v17;
  v27[1] = 3221225472;
  v27[2] = __146___UIPreviewInteractionViewControllerHelper_customPresentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2;
  v27[3] = &unk_1E16DAB70;
  v31 = v15;
  objc_copyWeak(&v30, location);
  v32 = v16;
  v20 = v19;
  v28 = v20;
  v21 = v18;
  v29 = v21;
  -[UIPresentationController set_customToViewForCurrentTransition:](v11, "set_customToViewForCurrentTransition:", v27);
  v22 = v29;
  v23 = v11;

  objc_destroyWeak(&v30);
  objc_destroyWeak(&v36);

  objc_destroyWeak(location);
  return v23;
}

- (void)_finalizeAfterViewControllerPresentation
{
  UIWindow *presentingWindow;
  _UIPreviewInteractionHighlighter *highlighter;
  UIViewController **p_previousParentViewController;
  id WeakRetained;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;

  -[UIWindow endDisablingInterfaceAutorotationAnimated:](self->_presentingWindow, "endDisablingInterfaceAutorotationAnimated:", 1);
  presentingWindow = self->_presentingWindow;
  self->_presentingWindow = 0;

  highlighter = self->_highlighter;
  self->_highlighter = 0;

  -[_UIPreviewInteractionViewControllerPresentation viewController](self->_viewControllerPresentation, "viewController");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_setOverrideUseCustomPresentation:", 0);
  objc_msgSend(v11, "_setOverrideTransitioningDelegate:", 0);
  p_previousParentViewController = &self->_previousParentViewController;
  WeakRetained = objc_loadWeakRetained((id *)&self->_previousParentViewController);

  if (WeakRetained)
  {
    v7 = objc_loadWeakRetained((id *)&self->_previousParentViewController);
    objc_msgSend(v11, "willMoveToParentViewController:", v7);

    v8 = objc_loadWeakRetained((id *)&self->_previousSuperview);
    objc_msgSend(v11, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", v9);

    v10 = objc_loadWeakRetained((id *)p_previousParentViewController);
    objc_msgSend(v10, "addChildViewController:", v11);

  }
}

- (void)_performDismissalCompletionIfNeeded
{
  void (**dismissalCompletion)(id, SEL);
  id v4;

  dismissalCompletion = (void (**)(id, SEL))self->_dismissalCompletion;
  if (dismissalCompletion)
  {
    dismissalCompletion[2](dismissalCompletion, a2);
    v4 = self->_dismissalCompletion;
    self->_dismissalCompletion = 0;

  }
}

- (_UIPreviewInteractionViewControllerPresentation)viewControllerPresentation
{
  return self->_viewControllerPresentation;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentTransitionContext, 0);
  objc_destroyWeak((id *)&self->_previousSuperview);
  objc_destroyWeak((id *)&self->_previousParentViewController);
  objc_storeStrong(&self->_dismissalCompletion, 0);
  objc_storeStrong(&self->_presentationCompletion, 0);
  objc_storeStrong((id *)&self->_presentingWindow, 0);
  objc_storeStrong((id *)&self->_viewControllerPresentation, 0);
  objc_storeStrong((id *)&self->_highlighter, 0);
}

@end
