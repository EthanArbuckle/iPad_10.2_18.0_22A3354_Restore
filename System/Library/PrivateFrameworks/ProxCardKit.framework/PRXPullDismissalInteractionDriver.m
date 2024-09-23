@implementation PRXPullDismissalInteractionDriver

- (PRXPullDismissalInteractionDriver)initWithPresentedViewController:(id)a3 scrollView:(id)a4
{
  id v6;
  id v7;
  PRXPullDismissalInteractionDriver *v8;
  PRXPullDismissalInteractionDriver *v9;
  id v10;
  PRXPullDismissalInteractionDriver *v11;
  objc_super v13;

  v6 = a3;
  v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PRXPullDismissalInteractionDriver;
  v8 = -[PRXPullDismissalInteractionDriver init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_presentedViewController, v6);
    v10 = objc_storeWeak((id *)&v9->_scrollView, v7);
    objc_msgSend(v7, "setDelegate:", v9);

    v11 = v9;
  }

  return v9;
}

- (UIViewControllerAnimatedTransitioning)animationController
{
  return (UIViewControllerAnimatedTransitioning *)self->_interactiveTransition;
}

- (UIViewControllerInteractiveTransitioning)interactionController
{
  return (UIViewControllerInteractiveTransitioning *)self->_interactiveTransition;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id WeakRetained;
  int v5;
  PRXPurelyInteractiveTransition *v6;
  PRXPurelyInteractiveTransition *interactiveTransition;
  void *v8;
  id v9;

  if (!self->_interactiveTransition)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    v5 = objc_msgSend(WeakRetained, "allowsPullToDismiss");

    if (v5)
    {
      v6 = objc_alloc_init(PRXPurelyInteractiveTransition);
      interactiveTransition = self->_interactiveTransition;
      self->_interactiveTransition = v6;

      v9 = objc_loadWeakRetained((id *)&self->_presentedViewController);
      objc_msgSend(v9, "presentingViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "dismissViewControllerAnimated:completion:", 1, 0);

    }
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  PRXPurelyInteractiveTransition *interactiveTransition;
  id WeakRetained;

  interactiveTransition = self->_interactiveTransition;
  if (interactiveTransition)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(WeakRetained, "dismissalPercent");
    -[UIPercentDrivenInteractiveTransition updateInteractiveTransition:](interactiveTransition, "updateInteractiveTransition:");

  }
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[PRXPullDismissalInteractionDriver _finishPullToDismiss](self, "_finishPullToDismiss", a3);
}

- (void)_finishPullToDismiss
{
  id WeakRetained;
  double v4;
  double v5;
  PRXPurelyInteractiveTransition *interactiveTransition;
  PRXPurelyInteractiveTransition *v7;

  if (self->_interactiveTransition)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
    objc_msgSend(WeakRetained, "dismissalPercent");
    v5 = v4;

    interactiveTransition = self->_interactiveTransition;
    if (v5 >= 1.0)
      -[PRXPurelyInteractiveTransition finishInteractiveTransition](interactiveTransition, "finishInteractiveTransition");
    else
      -[PRXPurelyInteractiveTransition cancelInteractiveTransition](interactiveTransition, "cancelInteractiveTransition");
    v7 = self->_interactiveTransition;
    self->_interactiveTransition = 0;

  }
}

- (PRXPullDismissalScrollView)scrollView
{
  return (PRXPullDismissalScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (UIViewController)presentedViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentedViewController);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentedViewController);
  objc_destroyWeak((id *)&self->_scrollView);
  objc_storeStrong((id *)&self->_interactiveTransition, 0);
}

@end
