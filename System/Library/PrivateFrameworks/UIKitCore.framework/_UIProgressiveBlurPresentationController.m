@implementation _UIProgressiveBlurPresentationController

- (int64_t)presentationStyle
{
  return 8;
}

- (_UIProgressiveBlurPresentationController)initWithPresentedViewController:(id)a3 presentingViewController:(id)a4
{
  _UIProgressiveBlurPresentationController *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)_UIProgressiveBlurPresentationController;
  result = -[UIPresentationController initWithPresentedViewController:presentingViewController:](&v5, sel_initWithPresentedViewController_presentingViewController_, a3, a4);
  if (result)
    result->_blurStyle = 4005;
  return result;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  id v4;

  -[_UIProgressiveBlurPresentationController _configureSubviews](self, "_configureSubviews");
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIProgressiveBlurPresentationController _animateWithCoordinator:isPresenting:](self, "_animateWithCoordinator:isPresenting:", v3, 1);

}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  id v4;

  -[_UIProgressiveBlurPresentationController _configureSubviews](self, "_configureSubviews");
  -[UIPresentationController presentedViewController](self, "presentedViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "transitionCoordinator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIProgressiveBlurPresentationController _animateWithCoordinator:isPresenting:](self, "_animateWithCoordinator:isPresenting:", v3, 0);

}

- (BOOL)_mayChildGrabPresentedViewControllerView
{
  return 1;
}

- (void)_configureSubviews
{
  void *v3;
  UIVisualEffectView *v4;
  void *v5;
  UIVisualEffectView *v6;
  UIVisualEffectView *visualEffectView;
  id v8;

  if (!self->_visualEffectView)
  {
    -[UIPresentationController containerView](self, "containerView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      v4 = [UIVisualEffectView alloc];
      -[UIPresentationController containerView](self, "containerView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "bounds");
      v6 = -[UIVisualEffectView initWithFrame:](v4, "initWithFrame:");
      visualEffectView = self->_visualEffectView;
      self->_visualEffectView = v6;

      -[UIVisualEffectView setEffect:](self->_visualEffectView, "setEffect:", 0);
      -[UIPresentationController containerView](self, "containerView");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_visualEffectView);

    }
  }
}

- (void)_animateWithCoordinator:(id)a3 isPresenting:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  uint64_t v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  _QWORD aBlock[4];
  id v26;
  id v27;
  double v28;

  v4 = a4;
  v6 = a3;
  -[_UIProgressiveBlurPresentationController visualEffectView](self, "visualEffectView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", self->_blurStyle);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = !v4;
  if (v4)
    v10 = (void *)v8;
  else
    v10 = 0;
  if (v4)
    v11 = 0;
  else
    v11 = (void *)v8;
  if (v9)
    v12 = 0.0;
  else
    v12 = 0.2;
  +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v13);

  objc_msgSend(v7, "setEffect:", v11);
  v14 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __81___UIProgressiveBlurPresentationController__animateWithCoordinator_isPresenting___block_invoke;
  aBlock[3] = &unk_1E16B1C28;
  v15 = v7;
  v26 = v15;
  v16 = v10;
  v27 = v16;
  v28 = v12;
  v23[0] = v14;
  v23[1] = 3221225472;
  v23[2] = __81___UIProgressiveBlurPresentationController__animateWithCoordinator_isPresenting___block_invoke_2;
  v23[3] = &unk_1E16B1CC8;
  v17 = _Block_copy(aBlock);
  v24 = v17;
  if ((objc_msgSend(v6, "animateAlongsideTransition:completion:", v23, 0) & 1) == 0)
  {
    +[_UIProgressiveBlurPresentationAnimator alphaAnimationFactory](_UIProgressiveBlurPresentationAnimator, "alphaAnimationFactory");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "transitionDuration");
    v20 = v19;
    v21[0] = v14;
    v21[1] = 3221225472;
    v21[2] = __81___UIProgressiveBlurPresentationController__animateWithCoordinator_isPresenting___block_invoke_3;
    v21[3] = &unk_1E16B1BF8;
    v22 = v17;
    +[UIView _animateWithDuration:delay:options:factory:animations:completion:](UIView, "_animateWithDuration:delay:options:factory:animations:completion:", 393248, v18, v21, 0, v20, 0.0);

  }
}

- (BOOL)_forcesPreferredAnimationControllers
{
  return 1;
}

- (id)_preferredAnimationControllerForPresentation
{
  return -[_UIProgressiveBlurPresentationAnimator initForPresenting:]([_UIProgressiveBlurPresentationAnimator alloc], "initForPresenting:", 1);
}

- (id)_preferredAnimationControllerForDismissal
{
  return -[_UIProgressiveBlurPresentationAnimator initForPresenting:]([_UIProgressiveBlurPresentationAnimator alloc], "initForPresenting:", 0);
}

- (int64_t)blurStyle
{
  return self->_blurStyle;
}

- (void)setBlurStyle:(int64_t)a3
{
  self->_blurStyle = a3;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
}

@end
