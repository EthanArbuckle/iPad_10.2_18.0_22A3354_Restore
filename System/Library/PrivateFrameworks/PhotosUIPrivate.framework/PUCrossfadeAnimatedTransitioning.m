@implementation PUCrossfadeAnimatedTransitioning

- (double)transitionDuration:(id)a3
{
  return 0.3;
}

- (void)animateTransition:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  _QWORD v12[4];
  id v13;

  v3 = a3;
  objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAlpha:", 0.0);
  objc_msgSend(v5, "addSubview:", v6);
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v11 = v3;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__PUCrossfadeAnimatedTransitioning_animateTransition___block_invoke;
  v12[3] = &unk_1E58ABD10;
  v13 = v6;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __54__PUCrossfadeAnimatedTransitioning_animateTransition___block_invoke_2;
  v10[3] = &unk_1E58A9910;
  v8 = v3;
  v9 = v6;
  objc_msgSend(v7, "animateWithDuration:animations:completion:", v12, v10, 0.3);

}

uint64_t __54__PUCrossfadeAnimatedTransitioning_animateTransition___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __54__PUCrossfadeAnimatedTransitioning_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

@end
