@implementation PLClickPresentationPresentationTransition

- (PLClickPresentationPresentationTransition)initWithTransitionDelegate:(id)a3 presentingViewController:(id)a4 presentedViewController:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  PLClickPresentationPresentationTransition *v12;
  PLClickPresentationPresentationTransition *v13;
  objc_super v15;

  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLClickPresentationPresentationTransition;
  v12 = -[PLClickPresentationTransition initWithTransitionDelegate:presentingViewController:presentedViewController:completion:](&v15, sel_initWithTransitionDelegate_presentingViewController_presentedViewController_completion_, a3, v10, v11, a6);
  v13 = v12;
  if (v12)
  {
    -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](v12->super._transitionContext, "_setFromViewController:", v10);
    -[_UIViewControllerOneToOneTransitionContext _setToViewController:](v13->super._transitionContext, "_setToViewController:", v11);
  }

  return v13;
}

- (void)updateBackgroundViewForTransition
{
  id v2;

  -[PLClickPresentationTransition backgroundView](self, "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWeighting:", 1.0);

}

- (CGAffineTransform)targetTransform
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->super._transitionContext;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform targetTransform](result, "targetTransform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (id)_newAnimator
{
  UIViewControllerTransitioningDelegate *transitionDelegate;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  transitionDelegate = self->super._transitionDelegate;
  -[_UIViewControllerOneToOneTransitionContext toViewController](self->super._transitionContext, "toViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerOneToOneTransitionContext fromViewController](self->super._transitionContext, "fromViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UIViewControllerOneToOneTransitionContext fromViewController](self->super._transitionContext, "fromViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewControllerTransitioningDelegate animationControllerForPresentedController:presentingController:sourceController:](transitionDelegate, "animationControllerForPresentedController:presentingController:sourceController:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_configureTransitionContextWithFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _PLViewControllerOneToOneTransitionContext *transitionContext;
  objc_super v12[3];
  objc_super v13;

  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PLClickPresentationPresentationTransition;
  v9 = a5;
  -[PLClickPresentationTransition _configureTransitionContextWithFromView:toView:containerView:](&v13, sel__configureTransitionContextWithFromView_toView_containerView_, v8, a4, v9);
  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:options:initialWeighting:", 6, 0, 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:", 1);
  objc_msgSend(v9, "bounds");
  objc_msgSend(v10, "setFrame:");
  objc_msgSend(v10, "setAutoresizingMask:", 18);
  objc_msgSend(v9, "insertSubview:atIndex:", v10, 0);

  -[PLClickPresentationTransition setBackgroundView:](self, "setBackgroundView:", v10);
  if (-[PLClickPresentationTransition propagatesPresentingViewTransform](self, "propagatesPresentingViewTransform"))
  {
    transitionContext = self->super._transitionContext;
    if (v8)
      objc_msgSend(v8, "transform");
    else
      memset(v12, 0, sizeof(v12));
    -[_PLViewControllerOneToOneTransitionContext setTargetTransform:](transitionContext, "setTargetTransform:", v12);
  }

}

@end
