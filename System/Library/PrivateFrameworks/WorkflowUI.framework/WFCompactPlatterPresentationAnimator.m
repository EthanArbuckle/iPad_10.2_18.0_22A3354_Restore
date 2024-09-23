@implementation WFCompactPlatterPresentationAnimator

- (id)initForPresenting:(BOOL)a3
{
  WFCompactPlatterPresentationAnimator *v4;
  WFCompactPlatterPresentationAnimator *v5;
  WFCompactPlatterPresentationAnimator *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFCompactPlatterPresentationAnimator;
  v4 = -[WFCompactPlatterPresentationAnimator init](&v8, sel_init);
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
  return 0.375;
}

- (void)animateTransition:(id)a3
{
  id v4;

  v4 = a3;
  if (-[WFCompactPlatterPresentationAnimator isPresenting](self, "isPresenting"))
    -[WFCompactPlatterPresentationAnimator _animatePresentationWithTransitionContext:](self, "_animatePresentationWithTransitionContext:", v4);
  else
    -[WFCompactPlatterPresentationAnimator _animateDismissalWithTransitionContext:](self, "_animateDismissalWithTransitionContext:", v4);

}

- (void)_animatePresentationWithTransitionContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  _QWORD v23[4];
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;

  v3 = a3;
  objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x24BEBE9B0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v4, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "frameOfDismissedViewInContainerView");
  objc_msgSend(v8, "setFrame:");
  objc_msgSend(v3, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addSubview:", v8);

  objc_msgSend(v7, "frameOfPresentedViewInContainerView");
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;

  v18 = (void *)MEMORY[0x24BEBDB00];
  v23[0] = MEMORY[0x24BDAC760];
  v23[1] = 3221225472;
  v23[2] = __82__WFCompactPlatterPresentationAnimator__animatePresentationWithTransitionContext___block_invoke;
  v23[3] = &unk_24E6039E8;
  v24 = v8;
  v25 = v11;
  v26 = v13;
  v27 = v15;
  v28 = v17;
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __82__WFCompactPlatterPresentationAnimator__animatePresentationWithTransitionContext___block_invoke_2;
  v21[3] = &unk_24E603A10;
  v22 = v3;
  v19 = v3;
  v20 = v8;
  objc_msgSend(v18, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v23, v21, 1.0, 0.5, 0.0, 0.0, 0.0, 0.998);

}

- (void)_animateDismissalWithTransitionContext:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;

  v3 = a3;
  objc_msgSend(v3, "viewControllerForKey:", *MEMORY[0x24BEBE9A0]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "presentationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  objc_msgSend(v7, "frameOfDismissedViewInContainerView");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v16 = (void *)MEMORY[0x24BEBDB00];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = __79__WFCompactPlatterPresentationAnimator__animateDismissalWithTransitionContext___block_invoke;
  v21[3] = &unk_24E6039E8;
  v22 = v4;
  v23 = v9;
  v24 = v11;
  v25 = v13;
  v26 = v15;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __79__WFCompactPlatterPresentationAnimator__animateDismissalWithTransitionContext___block_invoke_2;
  v19[3] = &unk_24E603A10;
  v20 = v3;
  v17 = v3;
  v18 = v4;
  objc_msgSend(v16, "_animateUsingSpringWithDampingRatio:response:tracking:dampingRatioSmoothing:responseSmoothing:targetSmoothing:projectionDeceleration:animations:completion:", 0, v21, v19, 1.0, 0.5, 0.0, 0.0, 0.0, 0.998);

}

- (BOOL)isPresenting
{
  return self->_presenting;
}

void __79__WFCompactPlatterPresentationAnimator__animateDismissalWithTransitionContext___block_invoke(uint64_t a1)
{
  double v1;
  double v2;
  double v3;
  double v4;
  id v5;

  v1 = *(double *)(a1 + 40);
  v2 = *(double *)(a1 + 48);
  v3 = *(double *)(a1 + 56);
  v4 = *(double *)(a1 + 64);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFrame:", v1, v2, v3, v4);

}

uint64_t __79__WFCompactPlatterPresentationAnimator__animateDismissalWithTransitionContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

uint64_t __82__WFCompactPlatterPresentationAnimator__animatePresentationWithTransitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

uint64_t __82__WFCompactPlatterPresentationAnimator__animatePresentationWithTransitionContext___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "completeTransition:", objc_msgSend(*(id *)(a1 + 32), "transitionWasCancelled") ^ 1);
}

@end
