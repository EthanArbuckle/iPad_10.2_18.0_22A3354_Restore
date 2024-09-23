@implementation PRXTransitioningController

- (PRXTransitioningController)initWithPullDismissalProvider:(id)a3
{
  id v4;
  PRXTransitioningController *v5;
  PRXTransitioningController *v6;
  PRXTransitioningController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRXTransitioningController;
  v5 = -[PRXTransitioningController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_pullDismissalProvider, v4);
    v7 = v6;
  }

  return v6;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  PRXCardSlideUpPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PRXCardSlideUpPresentationController initWithPresentedViewController:presentingViewController:]([PRXCardSlideUpPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  return v8;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pullDismissalProvider);
  objc_msgSend(WeakRetained, "pullDismissalInteractionDriver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "animationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)interactionControllerForDismissal:(id)a3
{
  id WeakRetained;
  void *v4;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_pullDismissalProvider);
  objc_msgSend(WeakRetained, "pullDismissalInteractionDriver");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "interactionController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (PRXPullDismissalProvider)pullDismissalProvider
{
  return (PRXPullDismissalProvider *)objc_loadWeakRetained((id *)&self->_pullDismissalProvider);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_pullDismissalProvider);
}

@end
