@implementation _SiriUINavigationControllerDelegateAdapter

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v5 = a5;
  v12 = a3;
  v8 = a4;
  -[_SiriUINavigationControllerDelegateAdapter externalDelegate](self, "externalDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "navigationController:willShowViewController:animated:", v12, v8, v5);
  -[_SiriUINavigationControllerDelegateAdapter transitionController](self, "transitionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v12, "transitionCoordinator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "coordinateAdditionalTransitionsWithTransitionCoordinator:", v11);

  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  void *v9;
  id v10;

  v5 = a5;
  v10 = a3;
  v8 = a4;
  -[_SiriUINavigationControllerDelegateAdapter externalDelegate](self, "externalDelegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v9, "navigationController:didShowViewController:animated:", v10, v8, v5);

}

- (unint64_t)navigationControllerSupportedInterfaceOrientations:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;

  v4 = a3;
  -[_SiriUINavigationControllerDelegateAdapter externalDelegate](self, "externalDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "navigationControllerSupportedInterfaceOrientations:", v4);
  else
    v6 = 30;

  return v6;
}

- (int64_t)navigationControllerPreferredInterfaceOrientationForPresentation:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[_SiriUINavigationControllerDelegateAdapter externalDelegate](self, "externalDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "navigationControllerPreferredInterfaceOrientationForPresentation:", v4);
  else
    v6 = 0;

  return v6;
}

- (id)navigationController:(id)a3 animationControllerForOperation:(int64_t)a4 fromViewController:(id)a5 toViewController:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  -[_SiriUINavigationControllerDelegateAdapter transitionController](self, "transitionController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v13, "setOperation:", a4);
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v13, "animationController"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[_SiriUINavigationControllerDelegateAdapter externalDelegate](self, "externalDelegate");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v15, "navigationController:animationControllerForOperation:fromViewController:toViewController:", v10, a4, v11, v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v14 = 0;
    }

  }
  return v14;
}

- (id)navigationController:(id)a3 interactionControllerForAnimationController:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[_SiriUINavigationControllerDelegateAdapter transitionController](self, "transitionController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v8, "interactionControllerForAnimationController:", v7),
        (v9 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    -[_SiriUINavigationControllerDelegateAdapter externalDelegate](self, "externalDelegate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v10, "navigationController:interactionControllerForAnimationController:", v6, v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (UINavigationControllerDelegate)externalDelegate
{
  return (UINavigationControllerDelegate *)objc_loadWeakRetained((id *)&self->_externalDelegate);
}

- (void)setExternalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_externalDelegate, a3);
}

- (SiriUINavigationTransitioning)transitionController
{
  return self->_transitionController;
}

- (void)setTransitionController:(id)a3
{
  objc_storeStrong((id *)&self->_transitionController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionController, 0);
  objc_destroyWeak((id *)&self->_externalDelegate);
}

@end
