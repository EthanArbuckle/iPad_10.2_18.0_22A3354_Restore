@implementation PUOneUpAssetNavigationTransition

- (PUOneUpAssetNavigationTransition)init
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUOneUpAssetNavigationTransition;
  return -[PUNavigationTransition initWithDuration:](&v3, sel_initWithDuration_, 0.300000012);
}

- (void)animatePushTransition
{
  -[PUOneUpAssetNavigationTransition _animateTransitionWithOperation:](self, "_animateTransitionWithOperation:", 1);
}

- (void)animatePopTransition
{
  -[PUOneUpAssetNavigationTransition _animateTransitionWithOperation:](self, "_animateTransitionWithOperation:", 2);
}

- (void)_animateTransitionWithOperation:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  char v10;
  int v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  id v20;
  char v21;

  -[PUViewControllerTransition fromViewController](self, "fromViewController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpAssetNavigationTransition toViewController](self, "toViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "conformsToProtocol:", &unk_1EEC5C390) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpAssetNavigationTransition.m"), 36, CFSTR("%@ (fromViewController) isn't conforming to PUOneUpAssetTransitionViewController"), v5);

  }
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EEC5C390) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOneUpAssetNavigationTransition.m"), 37, CFSTR("%@ (toViewController) isn't conforming to PUOneUpAssetTransitionViewController"), v6);

  }
  -[PUOneUpAssetNavigationTransition toViewController](self, "toViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIfNeeded");

  -[PUOneUpAssetNavigationTransition _prepareViewForTransition](self, "_prepareViewForTransition");
  objc_msgSend(v5, "navigationController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0 || (v9 = v5) == 0)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v9 = v6;
      else
        v9 = 0;
    }
  }
  v10 = objc_msgSend(v9, "_useStandardStatusBarHeight");
  v11 = objc_msgSend(v5, "prefersStatusBarHidden");
  if (v11 != objc_msgSend(v6, "prefersStatusBarHidden"))
    objc_msgSend(v9, "_setUseStandardStatusBarHeight:", 1);
  objc_msgSend(v5, "oneUpAssetTransitionWillBegin:", self);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __68__PUOneUpAssetNavigationTransition__animateTransitionWithOperation___block_invoke;
  v17[3] = &unk_1E58A2668;
  v17[4] = self;
  v18 = v6;
  v19 = v5;
  v20 = v9;
  v21 = v10;
  v12 = v9;
  v13 = v5;
  v14 = v6;
  objc_msgSend(v13, "oneUpAssetTransition:requestTransitionContextWithCompletion:", self, v17);

}

- (id)toViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUOneUpAssetNavigationTransition;
  -[PUViewControllerTransition toViewController](&v3, sel_toViewController);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_prepareViewForTransition
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PUViewControllerTransition containerView](self, "containerView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[PUOneUpAssetNavigationTransition toViewController](self, "toViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition fromViewController](self, "fromViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUViewControllerTransition finalToViewFrame](self, "finalToViewFrame");
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v7, "insertSubview:aboveSubview:", v4, v6);

}

void __68__PUOneUpAssetNavigationTransition__animateTransitionWithOperation___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  id v16;
  char v17;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "containerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "oneUpTransitionContextWithContextWithContainerView:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(void **)(a1 + 32);
  v7 = *(void **)(a1 + 40);
  objc_msgSend(v8, "duration");
  v10 = v9;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __68__PUOneUpAssetNavigationTransition__animateTransitionWithOperation___block_invoke_2;
  v13[3] = &unk_1E58A2640;
  v11 = *(id *)(a1 + 48);
  v12 = *(_QWORD *)(a1 + 32);
  v14 = v11;
  v15 = v12;
  v16 = *(id *)(a1 + 56);
  v17 = *(_BYTE *)(a1 + 64);
  objc_msgSend(v7, "oneUpAssetTransition:animateTransitionWithContext:duration:completion:", v8, v6, v13, v10);

}

uint64_t __68__PUOneUpAssetNavigationTransition__animateTransitionWithOperation___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "oneUpAssetTransitionDidEnd:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "transitionContext");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "transitionWasCancelled") ^ 1;

  objc_msgSend(*(id *)(a1 + 40), "completeTransition:", v3);
  return objc_msgSend(*(id *)(a1 + 48), "_setUseStandardStatusBarHeight:", *(unsigned __int8 *)(a1 + 56));
}

@end
