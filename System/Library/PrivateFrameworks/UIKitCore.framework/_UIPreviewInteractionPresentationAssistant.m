@implementation _UIPreviewInteractionPresentationAssistant

- (_UIPreviewInteractionPresentationAssistant)initWithViewControllerPresentation:(id)a3
{
  id v4;
  _UIPreviewInteractionPresentationAssistant *v5;
  _UIPreviewInteractionPresentationAssistant *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIPreviewInteractionPresentationAssistant;
  v5 = -[_UIPreviewInteractionPresentationAssistant init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[_UIPreviewInteractionPresentationAssistant setPresentation:](v5, "setPresentation:", v4);

  return v6;
}

- (void)presentFromViewController:(id)a3 sourcePreview:(id)a4 dismissalCompletion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "viewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  -[_UIPreviewInteractionPresentationAssistant _stashParentViewControllerIfNecessary](self, "_stashParentViewControllerIfNecessary");
  objc_msgSend(v12, "_setOverrideUseCustomPresentation:", 1);
  objc_msgSend(v12, "_setOverrideTransitioningDelegate:", self);
  -[_UIPreviewInteractionPresentationAssistant setSourcePreview:](self, "setSourcePreview:", v9);

  -[_UIPreviewInteractionPresentationAssistant setDismissalCompletion:](self, "setDismissalCompletion:", v8);
  objc_msgSend(v10, "presentViewController:animated:completion:", v12, 1, 0);

}

- (void)dismissViewController
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  -[UIViewControllerContextTransitioning containerView](self->_currentContext, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  -[_UIPreviewInteractionPresentationAssistant presentationAnimator](self, "presentationAnimator");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "isReversed") & 1) == 0 && objc_msgSend(v11, "_animationState") != 5)
  {
    if (-[_UIPreviewInteractionPresentationAssistant isAppearing](self, "isAppearing")
      && objc_msgSend(v11, "isRunning"))
    {
      objc_msgSend(v11, "pauseAnimation");
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __67___UIPreviewInteractionPresentationAssistant_dismissViewController__block_invoke;
      v12[3] = &unk_1E16B1B28;
      v12[4] = self;
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v12);
      -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "appearanceTransition");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_opt_respondsToSelector();

      if ((v6 & 1) != 0)
      {
        -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "appearanceTransition");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "transitionWillReverse");

      }
      objc_msgSend(v11, "setReversed:", 1);
      objc_msgSend(v11, "timingParameters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "continueAnimationWithTimingParameters:durationFactor:", v9, 1.0);
    }
    else
    {
      -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "viewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }

}

- (void)_stashParentViewControllerIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "parentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v8, "parentViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewInteractionPresentationAssistant setStashedParentViewController:](self, "setStashedParentViewController:", v5);

    objc_msgSend(v8, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "superview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIPreviewInteractionPresentationAssistant setStashedSuperView:](self, "setStashedSuperView:", v7);

    objc_msgSend(v8, "willMoveToParentViewController:", 0);
    objc_msgSend(v8, "removeFromParentViewController");
  }

}

- (void)_applyStashedParentViewControllerIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void (**v8)(_QWORD);
  void *v9;
  _QWORD v10[4];
  void (**v11)(_QWORD);
  _QWORD aBlock[5];
  id v13;

  -[_UIPreviewInteractionPresentationAssistant stashedParentViewController](self, "stashedParentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __90___UIPreviewInteractionPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke;
    aBlock[3] = &unk_1E16B1B50;
    aBlock[4] = self;
    v7 = v5;
    v13 = v7;
    v8 = (void (**)(_QWORD))_Block_copy(aBlock);
    objc_msgSend(v7, "transitionCoordinator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10[0] = v6;
      v10[1] = 3221225472;
      v10[2] = __90___UIPreviewInteractionPresentationAssistant__applyStashedParentViewControllerIfNecessary__block_invoke_3;
      v10[3] = &unk_1E16B1CC8;
      v11 = v8;
      objc_msgSend(v9, "animateAlongsideTransition:completion:", 0, v10);

    }
    else
    {
      v8[2](v8);
    }

  }
}

- (id)_sourcePreviewPortal
{
  void *v2;
  _UIPortalView *v3;
  void *v4;
  _UIPortalView *v5;
  void *v6;
  void *v7;
  void *v8;
  _OWORD v10[3];
  __int128 v11;
  __int128 v12;
  __int128 v13;

  -[_UIPreviewInteractionPresentationAssistant sourcePreview](self, "sourcePreview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = [_UIPortalView alloc];
  objc_msgSend(v2, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = -[_UIPortalView initWithFrame:](v3, "initWithFrame:");

  -[_UIPortalView setHidesSourceView:](v5, "setHidesSourceView:", _AXSReduceMotionEnabled() == 0);
  -[_UIPortalView setMatchesAlpha:](v5, "setMatchesAlpha:", 1);
  objc_msgSend(v2, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPortalView setSourceView:](v5, "setSourceView:", v6);

  objc_msgSend(v2, "target");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "transform");
  }
  else
  {
    v12 = 0u;
    v13 = 0u;
    v11 = 0u;
  }
  v10[0] = v11;
  v10[1] = v12;
  v10[2] = v13;
  -[UIView setTransform:](v5, "setTransform:", v10);

  -[UIView setUserInteractionEnabled:](v5, "setUserInteractionEnabled:", 0);
  return v5;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  UIPreviewPresentationController *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  _QWORD v29[4];
  id v30;
  id v31;
  _QWORD v32[4];
  id v33;
  id from;
  id location;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "presentationController");
  v12 = (UIPreviewPresentationController *)objc_claimAutoreleasedReturnValue();

  if (!v12)
    v12 = -[UIPreviewPresentationController initWithPresentedViewController:presentingViewController:]([UIPreviewPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v8, v9);
  -[UIPresentationController _setShouldContinueTouchesOnTargetViewController:](v12, "_setShouldContinueTouchesOnTargetViewController:", 1);
  -[UIPresentationController _setContainerIgnoresDirectTouchEvents:](v12, "_setContainerIgnoresDirectTouchEvents:", 0);
  -[UIPreviewPresentationController setAppliesVisualEffectsToPresentingView:](v12, "setAppliesVisualEffectsToPresentingView:", 0);
  -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "customViewForTouchContinuation");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIPresentationController _setCustomViewForTouchContinuation:](v12, "_setCustomViewForTouchContinuation:", v14);

  -[_UIPreviewInteractionPresentationAssistant _sourcePreviewPortal](self, "_sourcePreviewPortal");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionPresentationAssistant setPresentationSourcePortalView:](self, "setPresentationSourcePortalView:", v15);

  objc_initWeak(&location, v12);
  objc_initWeak(&from, self);
  -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "customContainerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = MEMORY[0x1E0C809B0];
  if (v17)
  {
    -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "customContainerView");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[_UIPreviewInteractionPresentationAssistant highlighter](self, "highlighter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "customContainerView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v22)
    {
LABEL_9:
      v24 = 0;
      goto LABEL_10;
    }
    -[_UIPreviewInteractionPresentationAssistant highlighter](self, "highlighter");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "customContainerView");
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v23 = (void *)v20;

  if (!v23)
    goto LABEL_9;
  v32[0] = v18;
  v32[1] = 3221225472;
  v32[2] = __141___UIPreviewInteractionPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke;
  v32[3] = &unk_1E16B6288;
  v24 = v23;
  v33 = v24;
  -[UIPresentationController set_containerSuperviewForCurrentTransition:](v12, "set_containerSuperviewForCurrentTransition:", v32);

LABEL_10:
  v29[0] = v18;
  v29[1] = 3221225472;
  v29[2] = __141___UIPreviewInteractionPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_2;
  v29[3] = &unk_1E16DC3F8;
  objc_copyWeak(&v30, &from);
  objc_copyWeak(&v31, &location);
  -[UIPresentationController set_customFromViewForCurrentTransition:](v12, "set_customFromViewForCurrentTransition:", v29);
  v26[0] = v18;
  v26[1] = 3221225472;
  v26[2] = __141___UIPreviewInteractionPresentationAssistant_presentationControllerForPresentedViewController_presentingViewController_sourceViewController___block_invoke_3;
  v26[3] = &unk_1E16DC3F8;
  objc_copyWeak(&v27, &from);
  objc_copyWeak(&v28, &location);
  -[UIPresentationController set_customToViewForCurrentTransition:](v12, "set_customToViewForCurrentTransition:", v26);
  objc_destroyWeak(&v28);
  objc_destroyWeak(&v27);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v12;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  -[_UIPreviewInteractionPresentationAssistant setIsAppearing:](self, "setIsAppearing:", 1, a4, a5);
  return self;
}

- (id)animationControllerForDismissedController:(id)a3
{
  -[_UIPreviewInteractionPresentationAssistant setIsAppearing:](self, "setIsAppearing:", 0);
  return self;
}

- (double)transitionDuration:(id)a3
{
  _BOOL4 v3;
  double result;

  v3 = -[_UIPreviewInteractionPresentationAssistant isAppearing](self, "isAppearing", a3);
  result = 0.35;
  if (v3)
    return 0.4;
  return result;
}

- (void)animateTransition:(id)a3
{
  id v5;
  _BOOL8 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _QWORD v26[4];
  id v27;
  _QWORD v28[4];
  id v29;
  id location;
  _QWORD v31[5];
  id v32;
  BOOL v33;
  _QWORD aBlock[4];
  id v35;
  id v36;
  id v37;
  id v38;
  _UIPreviewInteractionPresentationAssistant *v39;
  BOOL v40;
  _QWORD v41[5];
  id v42;
  id v43;
  id v44;
  id v45;
  BOOL v46;

  v5 = a3;
  -[_UIPreviewInteractionPresentationAssistant _createpresentationAnimatorIfNecessary:](self, "_createpresentationAnimatorIfNecessary:", v5);
  -[_UIPreviewInteractionPresentationAssistant presentationAnimator](self, "presentationAnimator");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_currentContext, a3);
  v6 = -[_UIPreviewInteractionPresentationAssistant isAppearing](self, "isAppearing");
  objc_msgSend(v5, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setUserInteractionEnabled:", v6);
  objc_msgSend(v5, "viewForKey:", CFSTR("UITransitionContextFromView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewForKey:", CFSTR("UITransitionContextToView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v6)
    objc_msgSend(v10, "appearanceTransition");
  else
    objc_msgSend(v10, "disappearanceTransition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UIPreviewInteractionPresentationAssistant sourcePreview](self, "sourcePreview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourcePreview:", v13);

  }
  v14 = objc_opt_respondsToSelector();
  v15 = MEMORY[0x1E0C809B0];
  if ((v14 & 1) != 0)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke;
    v41[3] = &unk_1E16BFCF8;
    v41[4] = self;
    v46 = v6;
    v42 = v7;
    v43 = v8;
    v44 = v9;
    v45 = v12;
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v41);

  }
  aBlock[0] = v15;
  aBlock[1] = 3221225472;
  aBlock[2] = __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_2;
  aBlock[3] = &unk_1E16BFCF8;
  v16 = v12;
  v35 = v16;
  v17 = v8;
  v36 = v17;
  v18 = v9;
  v37 = v18;
  v19 = v7;
  v38 = v19;
  v39 = self;
  v40 = v6;
  v20 = _Block_copy(aBlock);
  v31[0] = v15;
  v31[1] = 3221225472;
  v31[2] = __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_3;
  v31[3] = &unk_1E16C2A08;
  v31[4] = self;
  v21 = v16;
  v32 = v21;
  v33 = v6;
  v22 = _Block_copy(v31);
  if (v6)
  {
    objc_initWeak(&location, self);
    v28[0] = v15;
    v28[1] = 3221225472;
    v28[2] = __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_16;
    v28[3] = &unk_1E16B44C0;
    objc_copyWeak(&v29, &location);
    -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setPrivatePresentationCompletionBlock:", v28);

    objc_destroyWeak(&v29);
    objc_destroyWeak(&location);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v26[0] = v15;
    v26[1] = 3221225472;
    v26[2] = __64___UIPreviewInteractionPresentationAssistant_animateTransition___block_invoke_2_20;
    v26[3] = &unk_1E16B1BA0;
    v27 = v22;
    objc_msgSend(v21, "performWithCustomAnimator:completion:", v20, v26);

    v24 = v25;
  }
  else
  {
    v24 = v25;
    objc_msgSend(v25, "addAnimations:", v20);
    objc_msgSend(v25, "addCompletion:", v22);
    objc_msgSend(v25, "startAnimation");
  }

}

- (void)_postInteractionCleanup
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void (**v8)(_QWORD);
  id v9;

  -[_UIPreviewInteractionPresentationAssistant highlighter](self, "highlighter");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(v9, "customBackgroundEffectView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeFromSuperview");

    -[_UIPreviewInteractionPresentationAssistant setHighlighter:](self, "setHighlighter:", 0);
  }
  -[_UIPreviewInteractionPresentationAssistant presentationSourcePortalView](self, "presentationSourcePortalView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeFromSuperview");

  -[_UIPreviewInteractionPresentationAssistant setPresentationSourcePortalView:](self, "setPresentationSourcePortalView:", 0);
  -[_UIPreviewInteractionPresentationAssistant setSourcePreview:](self, "setSourcePreview:", 0);
  -[_UIPreviewInteractionPresentationAssistant presentation](self, "presentation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_setOverrideUseCustomPresentation:", 0);
  objc_msgSend(v6, "_setOverrideTransitioningDelegate:", 0);
  -[_UIPreviewInteractionPresentationAssistant dismissalCompletion](self, "dismissalCompletion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void (**)(_QWORD))objc_msgSend(v7, "copy");

  -[_UIPreviewInteractionPresentationAssistant setDismissalCompletion:](self, "setDismissalCompletion:", 0);
  if (v8)
    v8[2](v8);
  -[_UIPreviewInteractionPresentationAssistant _applyStashedParentViewControllerIfNecessary](self, "_applyStashedParentViewControllerIfNecessary");

}

- (void)_createpresentationAnimatorIfNecessary:(id)a3
{
  double v4;
  double v5;
  double v6;
  UIViewPropertyAnimator *v7;
  UIViewPropertyAnimator *presentationAnimator;

  if (!self->_presentationAnimator)
  {
    -[_UIPreviewInteractionPresentationAssistant transitionDuration:](self, "transitionDuration:", a3);
    v5 = v4;
    if (-[_UIPreviewInteractionPresentationAssistant isAppearing](self, "isAppearing"))
      v6 = 0.85;
    else
      v6 = 1.0;
    v7 = -[UIViewPropertyAnimator initWithDuration:dampingRatio:animations:]([UIViewPropertyAnimator alloc], "initWithDuration:dampingRatio:animations:", 0, v5, v6);
    presentationAnimator = self->_presentationAnimator;
    self->_presentationAnimator = v7;

    -[UIViewPropertyAnimator _setShouldLayoutSubviews:](self->_presentationAnimator, "_setShouldLayoutSubviews:", 0);
  }
}

- (UIViewPropertyAnimator)presentationAnimator
{
  return self->_presentationAnimator;
}

- (_UIPreviewInteractionHighlighter)highlighter
{
  return self->_highlighter;
}

- (void)setHighlighter:(id)a3
{
  objc_storeStrong((id *)&self->_highlighter, a3);
}

- (_UIPreviewInteractionViewControllerPresentation)presentation
{
  return self->_presentation;
}

- (void)setPresentation:(id)a3
{
  objc_storeStrong((id *)&self->_presentation, a3);
}

- (_UIPortalView)presentationSourcePortalView
{
  return self->_presentationSourcePortalView;
}

- (void)setPresentationSourcePortalView:(id)a3
{
  objc_storeStrong((id *)&self->_presentationSourcePortalView, a3);
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePreview, a3);
}

- (UIViewController)stashedParentViewController
{
  return self->_stashedParentViewController;
}

- (void)setStashedParentViewController:(id)a3
{
  objc_storeStrong((id *)&self->_stashedParentViewController, a3);
}

- (UIView)stashedSuperView
{
  return self->_stashedSuperView;
}

- (void)setStashedSuperView:(id)a3
{
  objc_storeStrong((id *)&self->_stashedSuperView, a3);
}

- (id)dismissalCompletion
{
  return self->_dismissalCompletion;
}

- (void)setDismissalCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (BOOL)isAppearing
{
  return self->_isAppearing;
}

- (void)setIsAppearing:(BOOL)a3
{
  self->_isAppearing = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_dismissalCompletion, 0);
  objc_storeStrong((id *)&self->_stashedSuperView, 0);
  objc_storeStrong((id *)&self->_stashedParentViewController, 0);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
  objc_storeStrong((id *)&self->_presentationSourcePortalView, 0);
  objc_storeStrong((id *)&self->_presentation, 0);
  objc_storeStrong((id *)&self->_highlighter, 0);
  objc_storeStrong((id *)&self->_presentationAnimator, 0);
  objc_storeStrong((id *)&self->_currentContext, 0);
}

@end
