@implementation _TVNavigationCrossfadeAnimator

- (double)transitionDuration:(id)a3
{
  return 0.5;
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
  v9[2] = __52___TVNavigationCrossfadeAnimator_animateTransition___block_invoke;
  v9[3] = &unk_24EB85440;
  v10 = v4;
  v8 = v4;
  -[_TVNavigationCrossfadeAnimator _beginCrossfadeAnimationFromViewController:toViewController:containerView:completion:](self, "_beginCrossfadeAnimationFromViewController:toViewController:containerView:completion:", v7, v6, v5, v9);

}

+ (void)_beginCrossfadeAnimationFromView:(id)a3 toView:(id)a4 containerView:(id)a5 delay:(double)a6 fadeOutFromView:(BOOL)a7 removeFromView:(BOOL)a8 completion:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  BOOL v27;
  _QWORD v28[4];
  id v29;
  id v30;
  BOOL v31;

  v15 = a3;
  v16 = a4;
  v17 = a9;
  v18 = a5;
  objc_msgSend(v18, "bounds");
  objc_msgSend(v16, "setFrame:");
  objc_msgSend(v16, "setAlpha:", 0.0);
  objc_msgSend(v18, "addSubview:", v16);

  v19 = MEMORY[0x24BDAC760];
  v20 = (void *)MEMORY[0x24BDF6F90];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __136___TVNavigationCrossfadeAnimator__beginCrossfadeAnimationFromView_toView_containerView_delay_fadeOutFromView_removeFromView_completion___block_invoke;
  v28[3] = &unk_24EB85638;
  v31 = a7;
  v29 = v15;
  v30 = v16;
  v24[0] = v19;
  v24[1] = 3221225472;
  v24[2] = __136___TVNavigationCrossfadeAnimator__beginCrossfadeAnimationFromView_toView_containerView_delay_fadeOutFromView_removeFromView_completion___block_invoke_2;
  v24[3] = &unk_24EB85660;
  v27 = a8;
  v25 = v29;
  v26 = v17;
  v21 = v17;
  v22 = v29;
  v23 = v16;
  objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", 2, v28, v24, 0.5, a6);

}

- (void)_beginCrossfadeAnimationFromViewController:(id)a3 toViewController:(id)a4 containerView:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  id v16;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_opt_class();
  objc_msgSend(v13, "view");
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "_beginCrossfadeAnimationFromView:toView:containerView:delay:fadeOutFromView:removeFromView:completion:", v16, v15, v11, self->_fadeOutFromView, 1, v10, 0.0);
}

- (BOOL)fadeOutFromView
{
  return self->_fadeOutFromView;
}

- (void)setFadeOutFromView:(BOOL)a3
{
  self->_fadeOutFromView = a3;
}

@end
