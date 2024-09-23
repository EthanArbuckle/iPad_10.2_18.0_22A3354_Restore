@implementation _UINavigationCrossfadeAnimator

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
  void *v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t v20;
  _QWORD v21[4];
  id v22;
  id v23;

  v4 = a3;
  objc_msgSend(v4, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", CFSTR("UITransitionContextToViewController"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", CFSTR("UITransitionContextToView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewForKey:", CFSTR("UITransitionContextFromView"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "finalFrameForViewController:", v6);
  objc_msgSend(v7, "setFrame:");
  objc_msgSend(v7, "setAlpha:", 0.0);
  objc_msgSend(v5, "addSubview:", v7);
  objc_msgSend(v8, "alpha");
  v10 = v9;
  -[_UINavigationCrossfadeAnimator transitionDuration:](self, "transitionDuration:", v4);
  v12 = v11;
  v13 = MEMORY[0x1E0C809B0];
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __52___UINavigationCrossfadeAnimator_animateTransition___block_invoke;
  v21[3] = &unk_1E16B1B50;
  v22 = v7;
  v23 = v8;
  v17[0] = v13;
  v17[1] = 3221225472;
  v17[2] = __52___UINavigationCrossfadeAnimator_animateTransition___block_invoke_2;
  v17[3] = &unk_1E16B7138;
  v20 = v10;
  v18 = v23;
  v19 = v4;
  v14 = v4;
  v15 = v23;
  v16 = v7;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v21, v17, v12);

}

- (BOOL)_shouldCrossFadeNavigationBar
{
  return 1;
}

@end
