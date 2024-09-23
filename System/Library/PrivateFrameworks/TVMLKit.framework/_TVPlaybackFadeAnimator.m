@implementation _TVPlaybackFadeAnimator

- (_TVPlaybackFadeAnimator)init
{
  _TVPlaybackFadeAnimator *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_TVPlaybackFadeAnimator;
  result = -[_TVPlaybackFadeAnimator init](&v3, sel_init);
  if (result)
  {
    result->_transitionDuration = 0.2;
    result->_usesCustomEasing = 1;
  }
  return result;
}

- (double)transitionDuration:(id)a3
{
  return self->_transitionDuration;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BDF7F90]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x24BDF7F80]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45___TVPlaybackFadeAnimator_animateTransition___block_invoke;
  v9[3] = &unk_24EB85440;
  v10 = v4;
  v8 = v4;
  -[_TVPlaybackFadeAnimator _beginFadeAnimationFromViewController:toViewController:containerView:completion:](self, "_beginFadeAnimationFromViewController:toViewController:containerView:completion:", v7, v6, v5, v9);

}

- (void)_beginFadeAnimationFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  BOOL shouldAnimateHalfwayThenPopIn;
  double transitionDuration;
  uint64_t usesCustomEasing;
  void *v20;
  uint64_t v21;
  id v22;
  id v23;
  id v24;
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  double v31;
  BOOL v32;
  char v33;
  _QWORD v34[4];
  id v35;

  v10 = a3;
  v11 = a6;
  v12 = a5;
  objc_msgSend(a4, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "bounds");
  objc_msgSend(v13, "setFrame:");
  objc_msgSend(v13, "setHidden:", 1);
  objc_msgSend(v12, "addSubview:", v13);
  v14 = objc_alloc(MEMORY[0x24BDF6F90]);
  objc_msgSend(v12, "bounds");
  v15 = (void *)objc_msgSend(v14, "initWithFrame:");
  objc_msgSend(v15, "setAutoresizingMask:", 18);
  objc_msgSend(MEMORY[0x24BDF6950], "blackColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setBackgroundColor:", v16);

  objc_msgSend(v15, "setAlpha:", 0.0);
  objc_msgSend(v12, "addSubview:", v15);

  shouldAnimateHalfwayThenPopIn = self->_shouldAnimateHalfwayThenPopIn;
  if (shouldAnimateHalfwayThenPopIn)
    transitionDuration = self->_transitionDuration;
  else
    transitionDuration = self->_transitionDuration * 0.5;
  usesCustomEasing = self->_usesCustomEasing;
  v20 = (void *)MEMORY[0x24BDF6F90];
  v21 = MEMORY[0x24BDAC760];
  v34[0] = MEMORY[0x24BDAC760];
  v34[1] = 3221225472;
  v34[2] = __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke;
  v34[3] = &unk_24EB85440;
  v35 = v15;
  v26[0] = v21;
  v26[1] = 3221225472;
  v26[2] = __107___TVPlaybackFadeAnimator__beginFadeAnimationFromViewController_toViewController_containerView_completion___block_invoke_2;
  v26[3] = &unk_24EB866F0;
  v27 = v10;
  v28 = v13;
  v32 = shouldAnimateHalfwayThenPopIn;
  v29 = v35;
  v30 = v11;
  v31 = transitionDuration;
  v33 = usesCustomEasing;
  v22 = v11;
  v23 = v35;
  v24 = v13;
  v25 = v10;
  objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", usesCustomEasing << 16, v34, v26, transitionDuration, 0.0);

}

- (double)transitionDuration
{
  return self->_transitionDuration;
}

- (void)setTransitionDuration:(double)a3
{
  self->_transitionDuration = a3;
}

- (BOOL)usesCustomEasing
{
  return self->_usesCustomEasing;
}

- (void)setUsesCustomEasing:(BOOL)a3
{
  self->_usesCustomEasing = a3;
}

- (BOOL)shouldAnimateHalfwayThenPopIn
{
  return self->_shouldAnimateHalfwayThenPopIn;
}

- (void)setShouldAnimateHalfwayThenPopIn:(BOOL)a3
{
  self->_shouldAnimateHalfwayThenPopIn = a3;
}

@end
