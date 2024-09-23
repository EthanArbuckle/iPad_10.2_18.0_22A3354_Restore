@implementation PLExpandedPlatterTransitioningDelegate

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v6 = a5;
  objc_msgSend(v6, "pl_containingClickPresentationInteractionPresentingViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
    objc_msgSend(v7, "viewForPreview");
  else
    objc_msgSend(v6, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLViewControllerAnimator initForPresentation:withSourceView:]([PLViewControllerAnimator alloc], "initForPresentation:withSourceView:", 1, v9);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v8, "clickPresentationInteractionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  if (objc_msgSend(v11, "hasCommittedToPresentation"))
    v12 = objc_msgSend(v11, "didInteractionInitiateWithHint");
  else
    v12 = 0;
  objc_msgSend(v10, "setIncludePresentingViewInAnimation:", v12);
  if (-[UIPresentationController conformsToProtocol:](self->_presentationController, "conformsToProtocol:", &unk_1EFC68418))objc_msgSend(v10, "addObserver:", self->_presentationController);
  objc_msgSend(v10, "addObserver:", self);

  return v10;
}

- (id)animationControllerForDismissedController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  __objc2_class **v9;
  void *v10;
  void *v11;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v4, "presenter"), (v5 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = v5;
    objc_msgSend(v5, "viewForPreview");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "presentingViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = 0;
  }
  v9 = off_1E91D2A08;
  if ((objc_opt_respondsToSelector() & 1) != 0
    && objc_msgSend(v4, "viewControllerTransitionTypeForTransitionDelegate:", self) == 1)
  {
    v9 = &off_1E91D2A10;
  }
  v10 = (void *)objc_msgSend(objc_alloc(*v9), "initForPresentation:withSourceView:", 0, v7);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "clickPresentationInteractionManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
  objc_msgSend(v10, "setIncludePresentingViewInAnimation:", objc_msgSend(v11, "didInteractionInitiateWithHint"));
  if (-[UIPresentationController conformsToProtocol:](self->_presentationController, "conformsToProtocol:", &unk_1EFC68418))objc_msgSend(v10, "addObserver:", self->_presentationController);
  objc_msgSend(v10, "addObserver:", self);

  return v10;
}

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v8;
  UIPresentationController *presentationController;
  id v10;
  id v11;
  void *v12;
  void *v13;
  PLExpandedPlatterPresentationController *v14;
  UIPresentationController *v15;
  UIPresentationController *v16;

  v8 = a3;
  presentationController = self->_presentationController;
  if (!presentationController)
  {
    v10 = a5;
    v11 = a4;
    objc_msgSend(v10, "pl_containingClickPresentationInteractionPresentingViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "viewForPreview");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v12 && (objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v8, "setPresenter:", v12);
    v14 = -[PLExpandedPlatterPresentationController initWithPresentedViewController:presentingViewController:sourceViewController:sourceView:]([PLExpandedPlatterPresentationController alloc], "initWithPresentedViewController:presentingViewController:sourceViewController:sourceView:", v8, v11, v10, v13);

    v15 = self->_presentationController;
    self->_presentationController = &v14->super;

    presentationController = self->_presentationController;
  }
  v16 = presentationController;

  return v16;
}

- (void)viewControllerAnimator:(id)a3 willBeginPresentationAnimationWithTransitionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(v7, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transitionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __117__PLExpandedPlatterTransitioningDelegate_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke;
  v10[3] = &unk_1E91D3450;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "animateAlongsideTransition:completion:", 0, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __117__PLExpandedPlatterTransitioningDelegate_viewControllerAnimator_willBeginPresentationAnimationWithTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  LODWORD(v2) = objc_msgSend(v3, "isCancelled");

  if ((_DWORD)v2)
    objc_msgSend(WeakRetained, "_setPresentationController:", 0);

}

- (void)viewControllerAnimator:(id)a3 willBeginDismissalAnimationWithTransitionContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id location;

  v6 = a3;
  v7 = a4;
  objc_initWeak(&location, self);
  objc_msgSend(v7, "viewControllerForKey:", *MEMORY[0x1E0CEBDA8]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "transitionCoordinator");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __114__PLExpandedPlatterTransitioningDelegate_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext___block_invoke;
  v10[3] = &unk_1E91D3450;
  objc_copyWeak(&v11, &location);
  objc_msgSend(v9, "animateAlongsideTransition:completion:", 0, v10);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);

}

void __114__PLExpandedPlatterTransitioningDelegate_viewControllerAnimator_willBeginDismissalAnimationWithTransitionContext___block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  LOBYTE(v2) = objc_msgSend(v3, "isCancelled");

  if ((v2 & 1) == 0)
    objc_msgSend(WeakRetained, "_setPresentationController:", 0);

}

- (UIPresentationController)_presentationController
{
  return self->_presentationController;
}

- (void)_setPresentationController:(id)a3
{
  objc_storeStrong((id *)&self->_presentationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_presentationController, 0);
}

@end
