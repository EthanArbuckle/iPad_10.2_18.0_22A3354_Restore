@implementation PUCrossfadeModalTransition

- (PUCrossfadeModalTransition)init
{
  return -[PUViewControllerTransition initWithDuration:](self, "initWithDuration:", 0.3);
}

- (void)animatePresentTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PUCrossfadeModalTransition *v17;
  _QWORD v18[4];
  id v19;

  -[PUViewControllerTransition containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition toViewController](self, "toViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v7, "snapshotViewAfterScreenUpdates:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAutoresizingMask:", 18);
    objc_msgSend(v5, "insertSubview:atIndex:", v8, 0);

  }
  objc_msgSend(v7, "snapshotViewAfterScreenUpdates:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition finalToViewFrame](self, "finalToViewFrame");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v3, "insertSubview:aboveSubview:", v5, v7);
  objc_msgSend(v3, "addSubview:", v9);
  v10 = (void *)MEMORY[0x1E0DC3F10];
  -[PUViewControllerTransition duration](self, "duration");
  v12 = v11;
  v13 = MEMORY[0x1E0C809B0];
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __54__PUCrossfadeModalTransition_animatePresentTransition__block_invoke;
  v18[3] = &unk_1E58ABD10;
  v19 = v9;
  v15[0] = v13;
  v15[1] = 3221225472;
  v15[2] = __54__PUCrossfadeModalTransition_animatePresentTransition__block_invoke_2;
  v15[3] = &unk_1E58AAE08;
  v16 = v19;
  v17 = self;
  v14 = v19;
  objc_msgSend(v10, "animateWithDuration:animations:completion:", v18, v15, v12);

}

- (void)animateDismissTransition
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

  -[PUViewControllerTransition containerView](self, "containerView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition toViewController](self, "toViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition finalToViewFrame](self, "finalToViewFrame");
  objc_msgSend(v5, "setFrame:");
  objc_msgSend(v3, "insertSubview:aboveSubview:", v5, v7);
  objc_msgSend(v5, "setAlpha:", 0.0);
  v8 = (void *)MEMORY[0x1E0DC3F10];
  -[PUViewControllerTransition duration](self, "duration");
  v10 = v9;
  v12[4] = self;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __54__PUCrossfadeModalTransition_animateDismissTransition__block_invoke;
  v13[3] = &unk_1E58ABD10;
  v14 = v5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__PUCrossfadeModalTransition_animateDismissTransition__block_invoke_2;
  v12[3] = &unk_1E58A9910;
  v11 = v5;
  objc_msgSend(v8, "animateWithDuration:animations:completion:", v13, v12, v10);

}

uint64_t __54__PUCrossfadeModalTransition_animateDismissTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __54__PUCrossfadeModalTransition_animateDismissTransition__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitionWasCancelled") ^ 1;

  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", v3);
}

uint64_t __54__PUCrossfadeModalTransition_animatePresentTransition__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __54__PUCrossfadeModalTransition_animatePresentTransition__block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  objc_msgSend(*(id *)(a1 + 40), "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitionWasCancelled") ^ 1;

  return objc_msgSend(*(id *)(a1 + 40), "completeTransition:", v3);
}

@end
