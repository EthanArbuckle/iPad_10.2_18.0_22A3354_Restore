@implementation PUCrossfadeNavigationTransition

- (PUCrossfadeNavigationTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUCrossfadeNavigationTransition;
  return -[PUNavigationTransition initWithDuration:](&v3, sel_initWithDuration_, 0.300000012);
}

- (void)_animateTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  _QWORD v12[5];
  _QWORD v13[4];
  id v14;

  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition toViewController](self, "toViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition containerView](self, "containerView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIfNeeded");
  -[PUViewControllerTransition finalToViewFrame](self, "finalToViewFrame");
  objc_msgSend(v6, "setFrame:");
  objc_msgSend(v6, "setAlpha:", 0.0);
  objc_msgSend(v7, "insertSubview:aboveSubview:", v6, v5);
  v8 = (void *)MEMORY[0x1E0DC3F10];
  -[PUViewControllerTransition duration](self, "duration");
  v10 = v9;
  v12[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__PUCrossfadeNavigationTransition__animateTransition__block_invoke;
  v13[3] = &unk_1E58ABD10;
  v14 = v6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53__PUCrossfadeNavigationTransition__animateTransition__block_invoke_2;
  v12[3] = &unk_1E58A9910;
  v11 = v6;
  objc_msgSend(v8, "animateWithDuration:animations:completion:", v13, v12, v10);

}

uint64_t __53__PUCrossfadeNavigationTransition__animateTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __53__PUCrossfadeNavigationTransition__animateTransition__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

@end
