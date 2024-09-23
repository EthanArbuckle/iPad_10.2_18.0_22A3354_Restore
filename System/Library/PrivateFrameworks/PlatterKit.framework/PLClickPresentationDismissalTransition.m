@implementation PLClickPresentationDismissalTransition

- (PLClickPresentationDismissalTransition)initWithTransitionDelegate:(id)a3 presentingViewController:(id)a4 presentedViewController:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  PLClickPresentationDismissalTransition *v12;
  PLClickPresentationDismissalTransition *v13;
  objc_super v15;

  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PLClickPresentationDismissalTransition;
  v12 = -[PLClickPresentationTransition initWithTransitionDelegate:presentingViewController:presentedViewController:completion:](&v15, sel_initWithTransitionDelegate_presentingViewController_presentedViewController_completion_, a3, v10, v11, a6);
  v13 = v12;
  if (v12)
  {
    -[_UIViewControllerOneToOneTransitionContext _setFromViewController:](v12->super._transitionContext, "_setFromViewController:", v11);
    -[_UIViewControllerOneToOneTransitionContext _setToViewController:](v13->super._transitionContext, "_setToViewController:", v10);
  }

  return v13;
}

- (void)updateBackgroundViewForTransition
{
  id v2;

  -[PLClickPresentationTransition backgroundView](self, "backgroundView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWeighting:", 0.0);

}

- (id)_newAnimator
{
  UIViewControllerTransitioningDelegate *transitionDelegate;
  void *v3;
  void *v4;

  transitionDelegate = self->super._transitionDelegate;
  -[_UIViewControllerOneToOneTransitionContext fromViewController](self->super._transitionContext, "fromViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIViewControllerTransitioningDelegate animationControllerForDismissedController:](transitionDelegate, "animationControllerForDismissedController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_configureTransitionContextWithFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id WeakRetained;
  void *v7;
  _PLViewControllerOneToOneTransitionContext *transitionContext;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)PLClickPresentationDismissalTransition;
  -[PLClickPresentationTransition _configureTransitionContextWithFromView:toView:containerView:](&v11, sel__configureTransitionContextWithFromView_toView_containerView_, a3, a4, a5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentationTransition);
  v7 = WeakRetained;
  if (WeakRetained)
  {
    transitionContext = self->super._transitionContext;
    objc_msgSend(WeakRetained, "targetTransform");
    -[_PLViewControllerOneToOneTransitionContext setTargetTransform:](transitionContext, "setTargetTransform:", &v10);
    objc_msgSend(v7, "backgroundView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLClickPresentationTransition setBackgroundView:](self, "setBackgroundView:", v9);

  }
}

- (PLClickPresentationPresentationTransition)presentationTransition
{
  return (PLClickPresentationPresentationTransition *)objc_loadWeakRetained((id *)&self->_presentationTransition);
}

- (void)setPresentationTransition:(id)a3
{
  objc_storeWeak((id *)&self->_presentationTransition, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentationTransition);
}

@end
