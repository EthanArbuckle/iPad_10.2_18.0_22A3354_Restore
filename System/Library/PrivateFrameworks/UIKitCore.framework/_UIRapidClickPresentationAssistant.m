@implementation _UIRapidClickPresentationAssistant

- (_UIRapidClickPresentationAssistant)initWithClickPresentation:(id)a3
{
  id v4;
  _UIRapidClickPresentationAssistant *v5;
  _UIRapidClickPresentationAssistant *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIRapidClickPresentationAssistant;
  v5 = -[_UIRapidClickPresentationAssistant init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    -[_UIRapidClickPresentationAssistant setPresentation:](v5, "setPresentation:", v4);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObserver:selector:name:object:", v6, sel__firstResponderDidChange_, CFSTR("UIWindowFirstResponderDidChangeNotification"), 0);

  }
  return v6;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", CFSTR("UIWindowFirstResponderDidChangeNotification"));

  v4.receiver = self;
  v4.super_class = (Class)_UIRapidClickPresentationAssistant;
  -[_UIRapidClickPresentationAssistant dealloc](&v4, sel_dealloc);
}

- (void)_firstResponderDidChange:(id)a3
{
  void *v4;
  uint64_t (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  char v7;
  id v8;

  objc_msgSend(a3, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstResponder");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[_UIRapidClickPresentationAssistant keyboardAssertionInvalidationHandler](self, "keyboardAssertionInvalidationHandler");
    v5 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      -[_UIRapidClickPresentationAssistant presentation](self, "presentation");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = ((uint64_t (**)(_QWORD, id, void *))v5)[2](v5, v8, v6);

      if ((v7 & 1) == 0)
        -[_UIRapidClickPresentationAssistant setKeyboardSuppressionAssertion:](self, "setKeyboardSuppressionAssertion:", 0);
    }

  }
}

- (void)presentFromSourcePreview:(id)a3 lifecycleCompletion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  int v15;
  void (**v16)(id, _QWORD);
  _QWORD v17[4];
  id v18;
  id v19;
  _UIRapidClickPresentationAssistant *v20;
  char v21;

  v16 = (void (**)(id, _QWORD))a4;
  v6 = a3;
  -[_UIRapidClickPresentationAssistant presentation](self, "presentation");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_setOverrideUseCustomPresentation:", 1);
  objc_msgSend(v8, "_setOverrideTransitioningDelegate:", self);
  -[_UIRapidClickPresentationAssistant setSourcePreview:](self, "setSourcePreview:", v6);

  -[_UIRapidClickPresentationAssistant setLifecycleCompletion:](self, "setLifecycleCompletion:", v16);
  v9 = objc_msgSend(v8, "_isDelayingPresentation");
  objc_msgSend(v7, "presentationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __83___UIRapidClickPresentationAssistant_presentFromSourcePreview_lifecycleCompletion___block_invoke;
  v17[3] = &unk_1E16B4030;
  v12 = v11;
  v18 = v12;
  v13 = v8;
  v21 = v9;
  v19 = v13;
  v20 = self;
  +[UIViewController _performWithoutDeferringTransitions:](UIViewController, "_performWithoutDeferringTransitions:", v17);
  if ((v9 & 1) == 0)
  {
    objc_msgSend(v13, "presentationController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "dismissed");

    if (v15)
    {
      objc_msgSend(v13, "_setOverrideUseCustomPresentation:", 0);
      objc_msgSend(v13, "_setOverrideTransitioningDelegate:", 0);
      -[_UIRapidClickPresentationAssistant setLifecycleCompletion:](self, "setLifecycleCompletion:", 0);
      v16[2](v16, 0);
    }
    else
    {
      -[_UIRapidClickPresentationAssistant _performPresentationAnimationsFromViewController:](self, "_performPresentationAnimationsFromViewController:", v12);
    }
  }

}

- (void)_performPresentationAnimationsFromViewController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  -[_UIRapidClickPresentationAssistant presentation](self, "presentation", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "suppressInputViewDuringPresentation"))
  {
    +[UIKeyboardSceneDelegate automaticKeyboardArbiterClient](UIKeyboardSceneDelegate, "automaticKeyboardArbiterClient");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "vendKeyboardSuppressionAssertionForReason:type:", CFSTR("com.apple.UIKit._UIRapidClickPresentationAssistant"), 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UIRapidClickPresentationAssistant setKeyboardSuppressionAssertion:](self, "setKeyboardSuppressionAssertion:", v6);

  }
  objc_msgSend(v4, "appearanceTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UIRapidClickPresentationAssistant sourcePreview](self, "sourcePreview");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSourcePreview:", v8);

  }
  v9 = MEMORY[0x1E0C809B0];
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __87___UIRapidClickPresentationAssistant__performPresentationAnimationsFromViewController___block_invoke;
  v20[3] = &unk_1E16B1B28;
  v10 = v4;
  v21 = v10;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v20);
  objc_msgSend(v10, "customViewForTouchContinuation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_window");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend((id)UIApp, "_gestureEnvironment");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIGestureEnvironment _performTouchContinuationWithOverrideHitTestedView:]((uint64_t)v13, v11);

  }
  v17 = v7;
  v18[0] = v9;
  v18[1] = 3221225472;
  v18[2] = __87___UIRapidClickPresentationAssistant__performPresentationAnimationsFromViewController___block_invoke_2;
  v18[3] = &unk_1E16B1B28;
  v19 = v10;
  v16[0] = v9;
  v16[1] = 3221225472;
  v16[2] = __87___UIRapidClickPresentationAssistant__performPresentationAnimationsFromViewController___block_invoke_3;
  v16[3] = &unk_1E16B2588;
  v14 = v7;
  v15 = v10;
  -[_UIRapidClickPresentationAssistant _animateUsingFluidSpringWithType:animations:completion:](self, "_animateUsingFluidSpringWithType:animations:completion:", 0, v18, v16);

}

- (void)dismissWithReason:(unint64_t)a3 alongsideActions:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t);
  void *v18;
  _UIRapidClickPresentationAssistant *v19;
  id v20;

  v8 = a4;
  v9 = a5;
  -[_UIRapidClickPresentationAssistant presentation](self, "presentation");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "dismissing");

  if ((v12 & 1) == 0)
  {
    v13 = MEMORY[0x1E0C809B0];
    self->_isInteractionInitiatedDismiss = 1;
    v15 = v13;
    v16 = 3221225472;
    v17 = __84___UIRapidClickPresentationAssistant_dismissWithReason_alongsideActions_completion___block_invoke;
    v18 = &unk_1E16B1D18;
    v19 = self;
    v20 = v8;
    v14 = _Block_copy(&v15);
    if (+[UIView areAnimationsEnabled](UIView, "areAnimationsEnabled", v15, v16, v17, v18, v19))
      -[_UIRapidClickPresentationAssistant _animateDismissalWithReason:actions:completion:](self, "_animateDismissalWithReason:actions:completion:", a3, v14, v9);
    else
      -[_UIRapidClickPresentationAssistant _nonAnimatedDismissalWithReason:actions:completion:](self, "_nonAnimatedDismissalWithReason:actions:completion:", a3, v14, v9);

  }
}

- (void)_animateDismissalWithReason:(unint64_t)a3 actions:(id)a4 completion:(id)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  void *v27;
  void (**v28)(void);
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  _QWORD *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id location;
  _QWORD v40[4];
  id v41;
  _QWORD v42[5];
  id v43;

  v28 = (void (**)(void))a4;
  v8 = a5;
  -[_UIRapidClickPresentationAssistant presentation](self, "presentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "uiController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "containerView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "disappearanceTransition");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_UIRapidClickPresentationAssistant sourcePreview](self, "sourcePreview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSourcePreview:", v13);

  }
  v14 = 2;
  if (a3 <= 0xB)
  {
    if (((1 << a3) & 0xBBA) != 0)
    {
      v14 = 1;
    }
    else if (a3 == 2)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        objc_msgSend(v12, "setDismissalStyle:", 1);
      v14 = 2;
    }
  }
  v42[0] = 0;
  v42[1] = v42;
  v42[2] = 0x3032000000;
  v42[3] = __Block_byref_object_copy__10;
  v42[4] = __Block_byref_object_dispose__10;
  v43 = 0;
  v27 = v10;
  objc_msgSend(v10, "platterContainerView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIRapidClickPresentationAssistant presentation](self, "presentation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "viewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "presentingViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = MEMORY[0x1E0C809B0];
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __85___UIRapidClickPresentationAssistant__animateDismissalWithReason_actions_completion___block_invoke_21;
  v40[3] = &unk_1E16B1B28;
  v20 = v9;
  v41 = v20;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v40);
  if (v28)
    v28[2]();
  objc_msgSend(v29, "_setOverrideUseCustomPresentation:", 0);
  objc_msgSend(v29, "_setOverrideTransitioningDelegate:", 0);
  objc_initWeak(&location, self);
  v37[0] = v19;
  v37[1] = 3221225472;
  v37[2] = __85___UIRapidClickPresentationAssistant__animateDismissalWithReason_actions_completion___block_invoke_2;
  v37[3] = &unk_1E16B1B28;
  v21 = v20;
  v38 = v21;
  v30[0] = v19;
  v30[1] = 3221225472;
  v30[2] = __85___UIRapidClickPresentationAssistant__animateDismissalWithReason_actions_completion___block_invoke_3;
  v30[3] = &unk_1E16B4058;
  objc_copyWeak(&v36, &location);
  v35 = v42;
  v22 = v18;
  v31 = v22;
  v23 = v15;
  v32 = v23;
  v24 = v12;
  v33 = v24;
  v25 = v8;
  v34 = v25;
  -[_UIRapidClickPresentationAssistant _animateUsingFluidSpringWithType:animations:completion:](self, "_animateUsingFluidSpringWithType:animations:completion:", v14, v37, v30);
  -[_UIRapidClickPresentationAssistant setKeyboardSuppressionAssertion:](self, "setKeyboardSuppressionAssertion:", 0);

  objc_destroyWeak(&v36);
  objc_destroyWeak(&location);

  _Block_object_dispose(v42, 8);
}

- (void)_nonAnimatedDismissalWithReason:(unint64_t)a3 actions:(id)a4 completion:(id)a5
{
  void (**v7)(_QWORD);
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void (**v17)(id);
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t);
  void *v22;
  id v23;

  v17 = (void (**)(id))a4;
  v7 = (void (**)(_QWORD))a5;
  -[_UIRapidClickPresentationAssistant presentation](self, "presentation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uiController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  v20 = 3221225472;
  v21 = __89___UIRapidClickPresentationAssistant__nonAnimatedDismissalWithReason_actions_completion___block_invoke;
  v22 = &unk_1E16B1B28;
  v11 = v8;
  v23 = v11;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", &v19);
  objc_msgSend(v10, "platterContainerView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "removeFromSuperview");

  objc_msgSend(v10, "flocker");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "unflockToDrag:animated:", 0, 0);

  objc_msgSend(v9, "_setOverrideUseCustomPresentation:", 0);
  objc_msgSend(v9, "_setOverrideTransitioningDelegate:", 0);
  if (v17)
    v17[2](v17);
  objc_msgSend(v11, "disappearanceTransition", v17, v19, v20, v21, v22);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "alongsideAnimator");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "performAllAnimations");

  objc_msgSend(v14, "alongsideAnimator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "performAllCompletions");

  -[_UIRapidClickPresentationAssistant setKeyboardSuppressionAssertion:](self, "setKeyboardSuppressionAssertion:", 0);
  if (v7)
    v7[2](v7);

}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v7;
  id v8;
  void *v9;
  UIPresentationController *v10;

  v7 = a3;
  v8 = a4;
  -[_UIRapidClickPresentationAssistant presentation](self, "presentation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentationController");
  v10 = (UIPresentationController *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = -[UIPresentationController initWithPresentedViewController:presentingViewController:]([UIPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v8);
  -[UIPresentationController _setContainerIgnoresDirectTouchEvents:](v10, "_setContainerIgnoresDirectTouchEvents:", 0);

  return v10;
}

- (id)animationControllerForDismissedController:(id)a3
{
  if (self->_isInteractionInitiatedDismiss)
    self = 0;
  return self;
}

- (double)transitionDuration:(id)a3
{
  int v3;
  double result;

  v3 = objc_msgSend(a3, "isAnimated");
  result = 0.0;
  if (v3)
    return 0.25;
  return result;
}

- (void)animateTransition:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD);
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  _UIRapidClickPresentationAssistant *v11;
  id v12;

  v4 = a3;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __56___UIRapidClickPresentationAssistant_animateTransition___block_invoke;
  v10 = &unk_1E16B1B50;
  v11 = self;
  v5 = v4;
  v12 = v5;
  v6 = (void (**)(_QWORD))_Block_copy(&v7);
  if (objc_msgSend(v5, "isAnimated", v7, v8, v9, v10, v11))
    v6[2](v6);
  else
    +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v6);

}

- (void)_animateUsingFluidSpringWithType:(unint64_t)a3 animations:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  id v15;
  id v16;
  _QWORD v17[5];
  id v18;
  unint64_t v19;
  _QWORD v20[4];
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = 0.4;
  if (_AXSReduceMotionEnabled())
  {
    v11 = 0;
    v12 = 0.0;
    v13 = 1.0;
  }
  else
  {
    if (a3 == 2)
    {
      v11 = 0;
      v14 = 0.996;
      v12 = 0.15;
      v13 = 0.85;
      goto LABEL_4;
    }
    v12 = 0.0;
    if (a3 == 1)
    {
      v11 = 0;
      v10 = 0.35;
      v13 = 0.85;
    }
    else if (a3)
    {
      v11 = 0;
      v13 = 0.0;
      v10 = 0.0;
    }
    else
    {
      v11 = 1;
      v10 = 0.32;
      v13 = 0.8;
    }
  }
  v14 = 0.0;
LABEL_4:
  ++self->_animationCount;
  v19 = a3;
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __93___UIRapidClickPresentationAssistant__animateUsingFluidSpringWithType_animations_completion___block_invoke;
  v20[3] = &unk_1E16B1BF8;
  v21 = v8;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93___UIRapidClickPresentationAssistant__animateUsingFluidSpringWithType_animations_completion___block_invoke_2;
  v17[3] = &unk_1E16B4080;
  v17[4] = self;
  v18 = v9;
  v15 = v9;
  v16 = v8;
  +[UIView _animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:](UIView, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", v11, v20, v17, v13, v10, 0.0, 0.0, v12, v14);

}

- (_UIClickPresentation)presentation
{
  return self->presentation;
}

- (void)setPresentation:(id)a3
{
  objc_storeStrong((id *)&self->presentation, a3);
}

- (id)lifecycleCompletion
{
  return self->lifecycleCompletion;
}

- (void)setLifecycleCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (id)keyboardAssertionInvalidationHandler
{
  return self->keyboardAssertionInvalidationHandler;
}

- (void)setKeyboardAssertionInvalidationHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (UITargetedPreview)sourcePreview
{
  return self->_sourcePreview;
}

- (void)setSourcePreview:(id)a3
{
  objc_storeStrong((id *)&self->_sourcePreview, a3);
}

- (id)keyboardSuppressionAssertion
{
  return self->_keyboardSuppressionAssertion;
}

- (void)setKeyboardSuppressionAssertion:(id)a3
{
  objc_storeStrong(&self->_keyboardSuppressionAssertion, a3);
}

- (NSTimer)animationWatchdogTimer
{
  return (NSTimer *)objc_loadWeakRetained((id *)&self->_animationWatchdogTimer);
}

- (void)setAnimationWatchdogTimer:(id)a3
{
  objc_storeWeak((id *)&self->_animationWatchdogTimer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_animationWatchdogTimer);
  objc_storeStrong(&self->_keyboardSuppressionAssertion, 0);
  objc_storeStrong((id *)&self->_sourcePreview, 0);
  objc_storeStrong(&self->keyboardAssertionInvalidationHandler, 0);
  objc_storeStrong(&self->lifecycleCompletion, 0);
  objc_storeStrong((id *)&self->presentation, 0);
}

@end
