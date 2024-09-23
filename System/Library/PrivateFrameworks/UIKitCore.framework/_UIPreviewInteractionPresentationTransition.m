@implementation _UIPreviewInteractionPresentationTransition

- (_UIPreviewInteractionPresentationTransition)init
{
  _UIPreviewInteractionPresentationTransition *v2;
  _UIPreviewInteractionPresentationTransition *v3;
  _UIPreviewInteractionPresentationTransition *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewInteractionPresentationTransition;
  v2 = -[_UIPreviewInteractionPresentationTransition init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_didScheduleFinishTransition = 0;
    v2->_interactiveTransitionFraction = 0.1;
    v4 = v2;
  }

  return v3;
}

- (double)interactiveTransitionFraction
{
  return self->_interactiveTransitionFraction;
}

- (void)updateInteractiveTransition:(double)a3
{
  id v5;

  if (!self->_didScheduleFinishTransition
    && !self->_didScheduleCancelTransition
    && -[UIViewControllerContextTransitioning isInteractive](self->_transitionContext, "isInteractive"))
  {
    -[_UIPreviewInteractionPresentationTransition _preparedPresentationAnimator](self, "_preparedPresentationAnimator");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isRunning") & 1) == 0)
    {
      objc_msgSend(v5, "setFractionComplete:", self->_interactiveTransitionFraction * a3);
      -[UIViewControllerContextTransitioning updateInteractiveTransition:](self->_transitionContext, "updateInteractiveTransition:", a3);
    }

  }
}

- (void)finishTransition
{
  if (!self->_didScheduleFinishTransition)
  {
    if (self->_transitionContext)
      -[_UIPreviewInteractionPresentationTransition _performFinishTransition](self, "_performFinishTransition");
    else
      *(_WORD *)&self->_didScheduleFinishTransition = 1;
  }
}

- (void)cancelTransition
{
  if (!self->_didScheduleCancelTransition)
  {
    if (self->_transitionContext)
      -[_UIPreviewInteractionPresentationTransition _performCancelTransition](self, "_performCancelTransition");
    else
      *(_WORD *)&self->_didScheduleFinishTransition = 256;
  }
}

- (double)transitionDuration:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[_UIPreviewInteractionPresentationTransition _preparedPresentationAnimator](self, "_preparedPresentationAnimator", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "duration");
  v5 = v4;

  return v5;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[_UIPreviewInteractionPresentationTransition _preparedPresentationAnimator](self, "_preparedPresentationAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAnimations:", &__block_literal_global_422);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __65___UIPreviewInteractionPresentationTransition_animateTransition___block_invoke_2;
  v7[3] = &unk_1E16B42D0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addCompletion:", v7);
  if (self->_shouldPerformAsDismissTransition)
    objc_msgSend(v5, "startAnimation");
  else
    objc_msgSend(v5, "pauseAnimation");

}

- (void)animationEnded:(BOOL)a3
{
  UIViewPropertyAnimator *presentationAnimator;

  presentationAnimator = self->_presentationAnimator;
  self->_presentationAnimator = 0;

}

- (void)startInteractiveTransition:(id)a3
{
  id v5;
  _QWORD block[5];

  v5 = a3;
  objc_storeStrong((id *)&self->_transitionContext, a3);
  -[_UIPreviewInteractionPresentationTransition animateTransition:](self, "animateTransition:", v5);
  if (*(_WORD *)&self->_didScheduleFinishTransition)
  {
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74___UIPreviewInteractionPresentationTransition_startInteractiveTransition___block_invoke;
    block[3] = &unk_1E16B1B28;
    block[4] = self;
    dispatch_async(MEMORY[0x1E0C80D38], block);
  }

}

- (BOOL)wantsInteractiveStart
{
  return !self->_didScheduleFinishTransition;
}

- (void)_performFinishTransition
{
  id v3;
  id v4;
  id v5;

  -[_UIPreviewInteractionPresentationTransition _preparedPresentationAnimator](self, "_preparedPresentationAnimator");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[_UIPreviewInteractionPresentationTransition _shouldReduceMotion](self, "_shouldReduceMotion"))
  {
    v3 = -[_UIPreviewInteractionPresentationTransition _newReducedMotionTimingCurveProviderForPreviewTransition](self, "_newReducedMotionTimingCurveProviderForPreviewTransition");
    objc_msgSend(v5, "continueAnimationWithTimingParameters:durationFactor:", v3, 1.0 - self->_interactiveTransitionFraction);
  }
  else
  {
    v3 = -[_UIPreviewInteractionPresentationTransition _newTimingCurveProviderForPreviewTransition](self, "_newTimingCurveProviderForPreviewTransition");
    objc_msgSend(v5, "continueAnimationWithTimingParameters:durationFactor:", v3, 1.0 - self->_interactiveTransitionFraction);
    v4 = -[_UIPreviewInteractionPresentationTransition _newPushDecayAnimator](self, "_newPushDecayAnimator");
    objc_msgSend(v4, "startAnimation");

  }
  -[UIViewControllerContextTransitioning finishInteractiveTransition](self->_transitionContext, "finishInteractiveTransition");

}

- (void)_performCancelTransition
{
  id v3;

  -[_UIPreviewInteractionPresentationTransition _preparedPresentationAnimator](self, "_preparedPresentationAnimator");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setReversed:", 1);
  objc_msgSend(v3, "startAnimation");
  -[UIViewControllerContextTransitioning cancelInteractiveTransition](self->_transitionContext, "cancelInteractiveTransition");

}

- (id)_previewPresentationControllerForTransitionContext:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIPreviewInteractionPresentationTransition _previewPresentationControllerForViewController:](self, "_previewPresentationControllerForViewController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
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

- (id)_preparedPresentationAnimator
{
  UIViewPropertyAnimator *presentationAnimator;
  UIViewPropertyAnimator **p_presentationAnimator;
  UIViewPropertyAnimator *v4;
  UICubicTimingParameters *v5;

  p_presentationAnimator = &self->_presentationAnimator;
  presentationAnimator = self->_presentationAnimator;
  if (presentationAnimator)
  {
    v4 = presentationAnimator;
  }
  else
  {
    v5 = -[UICubicTimingParameters initWithAnimationCurve:]([UICubicTimingParameters alloc], "initWithAnimationCurve:", 3);
    v4 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v5, 0.28);
    objc_storeStrong((id *)p_presentationAnimator, v4);

  }
  return v4;
}

- (id)_newTimingCurveProviderForPreviewTransition
{
  return -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 0.84, 420.0, 1800.0, 0.0, 0.0);
}

- (id)_newReducedMotionTimingCurveProviderForPreviewTransition
{
  return -[UICubicTimingParameters initWithAnimationCurve:]([UICubicTimingParameters alloc], "initWithAnimationCurve:", 0);
}

- (id)_newPushDecayAnimator
{
  UISpringTimingParameters *v3;
  UIViewPropertyAnimator *v4;
  _QWORD v6[5];

  v3 = -[UISpringTimingParameters initWithMass:stiffness:damping:initialVelocity:]([UISpringTimingParameters alloc], "initWithMass:stiffness:damping:initialVelocity:", 18.0, 820.0, 400.0, 0.0, 0.0);
  v4 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v3, 0.0);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __68___UIPreviewInteractionPresentationTransition__newPushDecayAnimator__block_invoke;
  v6[3] = &unk_1E16B1B28;
  v6[4] = self;
  -[UIViewPropertyAnimator addAnimations:](v4, "addAnimations:", v6);
  -[UIViewPropertyAnimator setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);

  return v4;
}

- (void)_applyPushDecayEffectTransformToView:(id)a3
{
  id v3;
  CGAffineTransform v4;
  CGAffineTransform v5;
  CGAffineTransform v6;
  CGAffineTransform v7;
  CGAffineTransform v8;

  if (a3)
  {
    memset(&v8, 0, sizeof(v8));
    v3 = a3;
    objc_msgSend(v3, "transform");
    v6 = v8;
    CGAffineTransformScale(&v7, &v6, 1.26, 1.26);
    v5 = v7;
    objc_msgSend(v3, "setTransform:", &v5);
    v4 = v8;
    objc_msgSend(v3, "setTransform:", &v4);

  }
}

- (BOOL)_shouldReduceMotion
{
  return _AXSReduceMotionEnabled() != 0;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationAnimator, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
