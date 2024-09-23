@implementation PUInteractiveDismissalController

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[PUInteractiveDismissalController _invalidateViewController](self, "_invalidateViewController");
    -[PUInteractiveDismissalController _invalidateViewHostingGestureRecognizers](self, "_invalidateViewHostingGestureRecognizers");
    v5 = obj;
  }

}

- (void)viewControllerWillAppear
{
  -[PUInteractiveDismissalController setDismissalInteractionProgress:](self, "setDismissalInteractionProgress:", 0.0);
}

- (void)invalidateDelegateData
{
  -[PUInteractiveDismissalController _invalidateViewController](self, "_invalidateViewController");
  -[PUInteractiveDismissalController _invalidateViewHostingGestureRecognizers](self, "_invalidateViewHostingGestureRecognizers");
  -[PUInteractiveDismissalController _updateIfNeeded](self, "_updateIfNeeded");
}

- (void)_updateIfNeeded
{
  -[PUInteractiveDismissalController _updateViewControllerIfNeeded](self, "_updateViewControllerIfNeeded");
  -[PUInteractiveDismissalController _updateViewHostingGestureRecognizersIfNeeded](self, "_updateViewHostingGestureRecognizersIfNeeded");
  -[PUInteractiveDismissalController _updateGestureRecognizersIfNeeded](self, "_updateGestureRecognizersIfNeeded");
  -[PUInteractiveDismissalController _updateInterruptibleViewControllerTransitionIfNeeded](self, "_updateInterruptibleViewControllerTransitionIfNeeded");
}

- (PUTilingView)tilingView
{
  void *v3;
  void *v4;

  -[PUInteractiveDismissalController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactiveDismissalControllerTilingView:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PUTilingView *)v4;
}

- (PUTileController)designatedTileController
{
  void *v3;
  void *v4;

  -[PUInteractiveDismissalController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "interactiveDismissalControllerDesignatedTileController:", self);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (PUTileController *)v4;
}

- (PUTilingViewControllerTransition)tilingViewControllerTransition
{
  void *v2;

  -[PUInteractiveDismissalController _interruptibleViewControllerTransition](self, "_interruptibleViewControllerTransition");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "conformsToProtocol:", &unk_1EED16528) & 1) == 0)
  {

    v2 = 0;
  }
  return (PUTilingViewControllerTransition *)v2;
}

- (BOOL)canBeginDismissalAtLocationFromProvider:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  if (-[PUInteractiveDismissalController _preferredDismissalTransitionType](self, "_preferredDismissalTransitionType")
    && (-[PUInteractiveDismissalController _interruptibleViewControllerTransition](self, "_interruptibleViewControllerTransition"), v5 = (void *)objc_claimAutoreleasedReturnValue(), v5, v5))
  {
    -[PUInteractiveDismissalController delegate](self, "delegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "interactiveDismissalController:canBeginDismissalAtLocationFromProvider:", self, v4);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (int64_t)_preferredDismissalTransitionType
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int64_t v10;

  -[PUInteractiveDismissalController _viewController](self, "_viewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "topViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pu_currentNavigationTransition");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)v5;
  v7 = 0;
  if (v3 && v2 == v4 && !v5)
  {
    objc_msgSend(v3, "viewControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (unint64_t)objc_msgSend(v8, "count") > 1;

  }
  objc_msgSend(v2, "presentingViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    v10 = 1;
  else
    v10 = 2 * (v9 != 0);

  return v10;
}

- (void)beginDismissal
{
  int64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  -[PUInteractiveDismissalController setIsHandlingDismissalInteraction:](self, "setIsHandlingDismissalInteraction:", 1);
  v4 = -[PUInteractiveDismissalController _preferredDismissalTransitionType](self, "_preferredDismissalTransitionType");
  -[PUInteractiveDismissalController _viewController](self, "_viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v5;
  if (v4 == 2)
  {
    objc_msgSend(v5, "presentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUInteractiveDismissalController.m"), 143, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("presentingViewController"), v14);

    }
    objc_msgSend(v6, "pu_dismissViewControllerAnimated:interactive:completion:", 1, 1, 0);
  }
  else if (v4 == 1)
  {
    objc_msgSend(v5, "navigationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUInteractiveDismissalController.m"), 136, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("navigationController != nil"), v14);

    }
    objc_msgSend(v6, "pu_popViewControllerAnimated:interactive:", 1, 1);
  }
  else
  {
    if (v4)
      goto LABEL_12;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUInteractiveDismissalController.m"), 130, CFSTR("undefined transition type"));
  }

LABEL_12:
  -[PUInteractiveDismissalController _interruptibleViewControllerTransition](self, "_interruptibleViewControllerTransition");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUInteractiveDismissalController.m"), 150, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interruptibleViewControllerTransition != nil"));

  }
  if (objc_msgSend(v7, "conformsToProtocol:", &unk_1EED16528))
  {
    v8 = v7;
    +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "transitionProgressBehavior");

    objc_msgSend(v8, "pauseTransitionWithOptions:", (unint64_t)(v10 - 1) < 2);
  }
  else
  {
    objc_msgSend(v7, "pauseTransition");
  }

}

- (void)updateDismissalWithInteractionProgress:(double)a3 interactionWillFinish:(BOOL)a4
{
  _BOOL4 v4;
  void *v8;
  uint64_t v9;
  double v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a4;
  +[PUTilingViewSettings sharedInstance](PUTilingViewSettings, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "transitionProgressBehavior");

  if (v9 == 2)
  {
    v10 = 1.0;
  }
  else
  {
    v10 = a3;
    if (v9 == 1)
    {
      if (v4)
        v10 = 1.0;
      else
        v10 = 0.0;
    }
  }
  -[PUInteractiveDismissalController setDismissalInteractionProgress:](self, "setDismissalInteractionProgress:", v10);
  -[PUInteractiveDismissalController _interruptibleViewControllerTransition](self, "_interruptibleViewControllerTransition");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v11;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUInteractiveDismissalController.m"), 188, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interruptibleViewControllerTransition != nil"));

    v11 = 0;
  }
  objc_msgSend(v11, "updatePausedTransitionWithProgress:interactionProgress:", v10, a3);

}

- (void)endDismissal:(BOOL)a3
{
  _BOOL8 v3;
  void *v6;
  void *v7;
  id v8;

  v3 = a3;
  -[PUInteractiveDismissalController setIsHandlingDismissalInteraction:](self, "setIsHandlingDismissalInteraction:", 0);
  -[PUInteractiveDismissalController _interruptibleViewControllerTransition](self, "_interruptibleViewControllerTransition");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUInteractiveDismissalController.m"), 195, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("interruptibleViewControllerTransition != nil"));

    v6 = 0;
  }
  objc_msgSend(v6, "resumeTransition:", v3);
  -[PUInteractiveDismissalController setDismissalInteractionProgress:](self, "setDismissalInteractionProgress:", (double)v3);
  -[PUInteractiveDismissalController _invalidateGestureRecognizers](self, "_invalidateGestureRecognizers");
  -[PUInteractiveDismissalController _updateIfNeeded](self, "_updateIfNeeded");

}

- (void)setIsHandlingDismissalInteraction:(BOOL)a3
{
  id v4;

  if (self->_isHandlingDismissalInteraction != a3)
  {
    self->_isHandlingDismissalInteraction = a3;
    -[PUInteractiveDismissalController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactiveDismissalControllerChangedIsHandlingDismissalInteraction:", self);

  }
}

- (void)setDismissalInteractionProgress:(double)a3
{
  id v4;

  if (self->_dismissalInteractionProgress != a3)
  {
    self->_dismissalInteractionProgress = a3;
    -[PUInteractiveDismissalController delegate](self, "delegate");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactiveDismissalControllerChangedDismissalInteractionProgress:", self);

  }
}

- (void)_invalidateViewController
{
  -[PUInteractiveDismissalController _setViewController:](self, "_setViewController:", 0);
  -[PUInteractiveDismissalController _invalidateInterruptibleViewControllerTransition](self, "_invalidateInterruptibleViewControllerTransition");
}

- (void)_updateViewControllerIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[PUInteractiveDismissalController _viewController](self, "_viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PUInteractiveDismissalController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactiveDismissalControllerViewController:", self);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[PUInteractiveDismissalController _setViewController:](self, "_setViewController:", v5);
  }
}

- (void)_invalidateViewHostingGestureRecognizers
{
  -[PUInteractiveDismissalController _setViewHostingGestureRecognizers:](self, "_setViewHostingGestureRecognizers:", 0);
  -[PUInteractiveDismissalController _invalidateGestureRecognizers](self, "_invalidateGestureRecognizers");
}

- (void)_updateViewHostingGestureRecognizersIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  -[PUInteractiveDismissalController _viewHostingGestureRecognizers](self, "_viewHostingGestureRecognizers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PUInteractiveDismissalController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "interactiveDismissalControllerViewHostingGestureRecognizers:", self);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    -[PUInteractiveDismissalController _setViewHostingGestureRecognizers:](self, "_setViewHostingGestureRecognizers:", v5);
  }
}

- (void)_invalidateGestureRecognizers
{
  -[PUInteractiveDismissalController _setNeedsUpdateGestureRecognizers:](self, "_setNeedsUpdateGestureRecognizers:", 1);
}

- (void)_updateGestureRecognizersIfNeeded
{
  id v3;

  if (-[PUInteractiveDismissalController _needsUpdateGestureRecognizers](self, "_needsUpdateGestureRecognizers"))
  {
    -[PUInteractiveDismissalController _setNeedsUpdateGestureRecognizers:](self, "_setNeedsUpdateGestureRecognizers:", 0);
    -[PUInteractiveDismissalController _viewHostingGestureRecognizers](self, "_viewHostingGestureRecognizers");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[PUInteractiveDismissalController updateGestureRecognizersWithHostingView:](self, "updateGestureRecognizersWithHostingView:", v3);

  }
}

- (void)_invalidateInterruptibleViewControllerTransition
{
  -[PUInteractiveDismissalController _setInterruptibleViewControllerTransition:](self, "_setInterruptibleViewControllerTransition:", 0);
}

- (void)_updateInterruptibleViewControllerTransitionIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PUInteractiveDismissalController _interruptibleViewControllerTransition](self, "_interruptibleViewControllerTransition");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    -[PUInteractiveDismissalController _viewController](self, "_viewController");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pu_navigationTransition");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      objc_msgSend(v7, "pu_modalTransition");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v4)
      {
        objc_msgSend(v7, "navigationController");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "pu_modalTransition");
        v4 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    if (objc_msgSend(v4, "conformsToProtocol:", &unk_1EED16498))
      v6 = v4;
    else
      v6 = 0;
    -[PUInteractiveDismissalController _setInterruptibleViewControllerTransition:](self, "_setInterruptibleViewControllerTransition:", v6);

  }
}

- (PUInteractiveDismissalControllerDelegate)delegate
{
  return (PUInteractiveDismissalControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)isHandlingDismissalInteraction
{
  return self->_isHandlingDismissalInteraction;
}

- (double)dismissalInteractionProgress
{
  return self->_dismissalInteractionProgress;
}

- (UIViewController)_viewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->__viewController);
}

- (void)_setViewController:(id)a3
{
  objc_storeWeak((id *)&self->__viewController, a3);
}

- (UIView)_viewHostingGestureRecognizers
{
  return self->__viewHostingGestureRecognizers;
}

- (void)_setViewHostingGestureRecognizers:(id)a3
{
  objc_storeStrong((id *)&self->__viewHostingGestureRecognizers, a3);
}

- (PUInterruptibleViewControllerTransition)_interruptibleViewControllerTransition
{
  return self->__interruptibleViewControllerTransition;
}

- (void)_setInterruptibleViewControllerTransition:(id)a3
{
  objc_storeStrong((id *)&self->__interruptibleViewControllerTransition, a3);
}

- (BOOL)_needsUpdateGestureRecognizers
{
  return self->__needsUpdateGestureRecognizers;
}

- (void)_setNeedsUpdateGestureRecognizers:(BOOL)a3
{
  self->__needsUpdateGestureRecognizers = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__interruptibleViewControllerTransition, 0);
  objc_storeStrong((id *)&self->__viewHostingGestureRecognizers, 0);
  objc_destroyWeak((id *)&self->__viewController);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
