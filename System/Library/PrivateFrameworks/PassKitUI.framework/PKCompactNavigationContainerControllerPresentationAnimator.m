@implementation PKCompactNavigationContainerControllerPresentationAnimator

- (PKCompactNavigationContainerControllerPresentationAnimator)initWithPresenting:(BOOL)a3
{
  PKCompactNavigationContainerControllerPresentationAnimator *v4;
  PKCompactNavigationContainerControllerPresentationAnimator *v5;
  PKCompactNavigationContainerControllerPresentationAnimator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PKCompactNavigationContainerControllerPresentationAnimator;
  v4 = -[PKCompactNavigationContainerControllerPresentationAnimator init](&v8, sel_init);
  v5 = v4;
  if (v4)
  {
    v4->_presenting = a3;
    v6 = v4;
  }

  return v5;
}

- (double)transitionDuration:(id)a3
{
  return 0.5;
}

- (void)_updateWithTransitionContext:(id)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  PKCompactNavigationContainerControllerPresentationAnimator *v33;
  id v34;
  _QWORD aBlock[4];
  id v36;

  v5 = a3;
  objc_storeStrong((id *)&self->_transitionContext, a3);
  v6 = *MEMORY[0x1E0DC55B8];
  v7 = *MEMORY[0x1E0DC55C8];
  if (self->_presenting)
    v8 = *MEMORY[0x1E0DC55B8];
  else
    v8 = *MEMORY[0x1E0DC55C8];
  objc_msgSend(v5, "viewControllerForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *MEMORY[0x1E0DC55C0];
  v11 = *MEMORY[0x1E0DC55D0];
  if (self->_presenting)
    v12 = *MEMORY[0x1E0DC55C0];
  else
    v12 = *MEMORY[0x1E0DC55D0];
  objc_msgSend(v5, "viewForKey:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_presentingVC, v9);
  objc_storeWeak((id *)&self->_presentingView, v13);
  if (self->_presenting)
    v14 = v7;
  else
    v14 = v6;
  objc_msgSend(v5, "viewControllerForKey:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_presenting)
    v16 = v11;
  else
    v16 = v10;
  objc_msgSend(v5, "viewForKey:", v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_presentedVC, v15);
  objc_storeWeak((id *)&self->_presentedView, v17);
  -[UIViewControllerContextTransitioning containerView](self->_transitionContext, "containerView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __91__PKCompactNavigationContainerControllerPresentationAnimator__updateWithTransitionContext___block_invoke;
  aBlock[3] = &unk_1E3E68710;
  v36 = v5;
  v20 = v5;
  v21 = _Block_copy(aBlock);
  v22 = (void *)MEMORY[0x1E0DC3F10];
  v28[0] = v19;
  v28[1] = 3221225472;
  v28[2] = __91__PKCompactNavigationContainerControllerPresentationAnimator__updateWithTransitionContext___block_invoke_2;
  v28[3] = &unk_1E3E751E0;
  v29 = v13;
  v30 = v9;
  v31 = v17;
  v32 = v15;
  v33 = self;
  v34 = v21;
  v23 = v15;
  v24 = v17;
  v25 = v9;
  v26 = v21;
  v27 = v13;
  objc_msgSend(v22, "performWithoutAnimation:", v28);
  objc_msgSend(v18, "addSubview:", v27);
  objc_msgSend(v18, "addSubview:", v24);

}

double __91__PKCompactNavigationContainerControllerPresentationAnimator__updateWithTransitionContext___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  double x;
  CGFloat v8;
  CGFloat v9;
  CGFloat v10;
  CGFloat v11;
  double v12;
  CGRect v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "finalFrameForViewController:", v5);
  x = v14.origin.x;
  v8 = *MEMORY[0x1E0C9D648];
  v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v16.origin.x = *(CGFloat *)MEMORY[0x1E0C9D648];
  v16.origin.y = v9;
  v16.size.width = v10;
  v16.size.height = v11;
  if (CGRectEqualToRect(v14, v16))
  {
    objc_msgSend(*(id *)(a1 + 32), "initialFrameForViewController:", v5);
    x = v15.origin.x;
    v17.origin.x = v8;
    v17.origin.y = v9;
    v17.size.width = v10;
    v17.size.height = v11;
    if (CGRectEqualToRect(v15, v17))
    {
      objc_msgSend(v6, "frame");
      x = v12;
    }
  }

  return x;
}

uint64_t __91__PKCompactNavigationContainerControllerPresentationAnimator__updateWithTransitionContext___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  objc_msgSend(v2, "setFrame:");
  v3 = *(void **)(a1 + 48);
  (*(void (**)(void))(*(_QWORD *)(a1 + 72) + 16))();
  objc_msgSend(v3, "setFrame:");
  objc_msgSend(*(id *)(a1 + 56), "setPresentingNavigationController:", *(_BYTE *)(*(_QWORD *)(a1 + 64) + 16) == 0);
  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  return objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
}

- (void)animateTransition:(id)a3
{
  id v4;
  id WeakRetained;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[4];
  id v14;
  PKCompactNavigationContainerControllerPresentationAnimator *v15;
  id v16;

  v4 = a3;
  -[PKCompactNavigationContainerControllerPresentationAnimator _updateWithTransitionContext:](self, "_updateWithTransitionContext:", v4);
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentedVC);
  v6 = objc_loadWeakRetained((id *)&self->_presentedView);
  v7 = (void *)MEMORY[0x1E0DC3F10];
  v12 = v4;
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __80__PKCompactNavigationContainerControllerPresentationAnimator_animateTransition___block_invoke;
  v13[3] = &unk_1E3E61400;
  v14 = WeakRetained;
  v15 = self;
  v16 = v6;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __80__PKCompactNavigationContainerControllerPresentationAnimator_animateTransition___block_invoke_2;
  v11[3] = &unk_1E3E62288;
  v8 = v4;
  v9 = v6;
  v10 = WeakRetained;
  objc_msgSend(v7, "_animateUsingDefaultTimingWithOptions:animations:completion:", 134, v13, v11);

}

uint64_t __80__PKCompactNavigationContainerControllerPresentationAnimator_animateTransition___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPresentingNavigationController:", *(unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 16));
  return objc_msgSend(*(id *)(a1 + 48), "layoutIfNeeded");
}

uint64_t __80__PKCompactNavigationContainerControllerPresentationAnimator_animateTransition___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", a2);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedView);
  objc_destroyWeak((id *)&self->_presentedVC);
  objc_destroyWeak((id *)&self->_presentingView);
  objc_destroyWeak((id *)&self->_presentingVC);
  objc_storeStrong((id *)&self->_transitionContext, 0);
}

@end
