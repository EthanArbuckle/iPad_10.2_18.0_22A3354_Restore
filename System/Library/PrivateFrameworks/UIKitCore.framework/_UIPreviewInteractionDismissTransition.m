@implementation _UIPreviewInteractionDismissTransition

- (_UIPreviewInteractionDismissTransition)init
{
  _UIPreviewInteractionDismissTransition *v2;
  _UIPreviewInteractionDismissTransition *v3;
  _UIPreviewInteractionDismissTransition *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_UIPreviewInteractionDismissTransition;
  v2 = -[_UIPreviewInteractionDismissTransition init](&v6, sel_init);
  v3 = v2;
  if (v2)
    v4 = v2;

  return v3;
}

- (double)transitionDuration:(id)a3
{
  void *v3;
  double v4;
  double v5;

  -[_UIPreviewInteractionDismissTransition _preparedDismissAnimator](self, "_preparedDismissAnimator", a3);
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
  -[_UIPreviewInteractionDismissTransition _preparedDismissAnimator](self, "_preparedDismissAnimator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addAnimations:", &__block_literal_global_421);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __60___UIPreviewInteractionDismissTransition_animateTransition___block_invoke_2;
  v7[3] = &unk_1E16B42D0;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "addCompletion:", v7);
  objc_msgSend(v5, "startAnimation");

}

- (id)_preparedDismissAnimator
{
  UIViewPropertyAnimator *dismissAnimator;
  UIViewPropertyAnimator **p_dismissAnimator;
  UIViewPropertyAnimator *v4;
  UICubicTimingParameters *v5;

  p_dismissAnimator = &self->_dismissAnimator;
  dismissAnimator = self->_dismissAnimator;
  if (dismissAnimator)
  {
    v4 = dismissAnimator;
  }
  else
  {
    v5 = -[UICubicTimingParameters initWithAnimationCurve:]([UICubicTimingParameters alloc], "initWithAnimationCurve:", 0);
    v4 = -[UIViewPropertyAnimator initWithDuration:timingParameters:]([UIViewPropertyAnimator alloc], "initWithDuration:timingParameters:", v5, 0.2);
    objc_storeStrong((id *)p_dismissAnimator, v4);

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dismissAnimator, 0);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
