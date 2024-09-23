@implementation PUOverOneUpPresentationSession

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateFlags.respondsToTilingView = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToViewController = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToBrowsingViewModel = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidPresent = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToDidFinish = objc_opt_respondsToSelector() & 1;
    self->_delegateFlags.respondsToIsReady = objc_opt_respondsToSelector() & 1;
  }

}

- (PUOverOneUpPresentationSession)initWithActivitySharingActionPerformer:(id)a3
{
  id v4;
  PUOverOneUpPresentationSession *v5;
  PUOverOneUpPresentationSession *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)PUOverOneUpPresentationSession;
  v5 = -[PUOverOneUpPresentationSession init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[PUOverOneUpPresentationSession setSharingActionPerformer:](v5, "setSharingActionPerformer:", v4);

  return v6;
}

- (void)setBarsDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_barsDelegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_barsDelegate, obj);
    self->_barsDelegateFlags.respondsToBarButtonItem = objc_opt_respondsToSelector() & 1;
    self->_barsDelegateFlags.respondsToDidAppendReviewScreenAction = objc_opt_respondsToSelector() & 1;
  }

}

- (void)_invalidatePresentedViewControllers
{
  if (!-[PUOverOneUpPresentationSession _needsUpdatePresentedViewControllers](self, "_needsUpdatePresentedViewControllers"))
  {
    -[PUOverOneUpPresentationSession _setNeedsUpdatePresentedViewControllers:](self, "_setNeedsUpdatePresentedViewControllers:", 1);
    -[PUOverOneUpPresentationSession _setPresentedViewControllers:](self, "_setPresentedViewControllers:", 0);
  }
}

- (void)_updatePresentedViewControllersIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  if (-[PUOverOneUpPresentationSession _needsUpdatePresentedViewControllers](self, "_needsUpdatePresentedViewControllers"))
  {
    -[PUOverOneUpPresentationSession _setNeedsUpdatePresentedViewControllers:](self, "_setNeedsUpdatePresentedViewControllers:", 0);
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    -[PUOverOneUpPresentationSession _slideshowViewController](self, "_slideshowViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
    {
      -[PUOverOneUpPresentationSession _slideshowViewController](self, "_slideshowViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v4);

    }
    -[PUOverOneUpPresentationSession _editViewController](self, "_editViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PUOverOneUpPresentationSession _editViewController](self, "_editViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v6);

    }
    -[PUOverOneUpPresentationSession _photoMarkupViewController](self, "_photoMarkupViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[PUOverOneUpPresentationSession _photoMarkupViewController](self, "_photoMarkupViewController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v8);

    }
    -[PUOverOneUpPresentationSession _funEffectsViewController](self, "_funEffectsViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      -[PUOverOneUpPresentationSession _funEffectsViewController](self, "_funEffectsViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v10);

    }
    -[PUOverOneUpPresentationSession _avalancheReviewController](self, "_avalancheReviewController");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[PUOverOneUpPresentationSession _avalancheReviewController](self, "_avalancheReviewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "addObject:", v12);

    }
    -[PUOverOneUpPresentationSession _setPresentedViewControllers:](self, "_setPresentedViewControllers:", v13);

  }
}

- (BOOL)isPresentingAnOverOneUpViewController
{
  void *v2;
  void *v3;

  -[PUOverOneUpPresentationSession _presentedViewControllers](self, "_presentedViewControllers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "anyObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3 != 0;
}

- (void)_finishOverOneUpPresentationSessionDismissForced:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v5;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v5 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[PUOverOneUpPresentationSession _invalidatePresentedViewControllers](self, "_invalidatePresentedViewControllers");
  -[PUOverOneUpPresentationSession _updatePresentedViewControllersIfNeeded](self, "_updatePresentedViewControllersIfNeeded");
  if (!-[PUOverOneUpPresentationSession isPresentingAnOverOneUpViewController](self, "isPresentingAnOverOneUpViewController")|| v5)
  {
    -[PUOverOneUpPresentationSession _presentedViewControllers](self, "_presentedViewControllers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "count"))
    {
      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v15;
        do
        {
          for (i = 0; i != v10; ++i)
          {
            if (*(_QWORD *)v15 != v11)
              objc_enumerationMutation(v8);
            -[PUOverOneUpPresentationSession dismissViewController:animated:completionHandler:](self, "dismissViewController:animated:completionHandler:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v4, 0, (_QWORD)v14);
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v10);
      }

    }
    if (self->_delegateFlags.respondsToDidFinish)
    {
      -[PUOverOneUpPresentationSession delegate](self, "delegate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "overOneUpPresentationSessionDidFinish:", self);

    }
  }
}

- (id)viewController
{
  void *v3;
  void *v4;

  if (self->_delegateFlags.respondsToViewController)
  {
    -[PUOverOneUpPresentationSession delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "overOneUpPresentationSessionViewController:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_tilingView
{
  void *v3;
  void *v4;

  if (self->_delegateFlags.respondsToTilingView)
  {
    -[PUOverOneUpPresentationSession delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "overOneUpPresentationSessionTilingView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_viewModel
{
  void *v3;
  void *v4;

  if (self->_delegateFlags.respondsToBrowsingViewModel)
  {
    -[PUOverOneUpPresentationSession delegate](self, "delegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "overOneUpPresentationSessionBrowserViewModel:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_assetsDataSource
{
  void *v2;
  void *v3;

  -[PUOverOneUpPresentationSession _viewModel](self, "_viewModel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetsDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_currentTileController
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[PUOverOneUpPresentationSession _viewModel](self, "_viewModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOverOneUpPresentationSession _tilingView](self, "_tilingView");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v3, "currentAssetReference");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPath");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "dataSourceIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "presentedTileControllerWithIndexPath:kind:dataSourceIdentifier:", v8, CFSTR("PUTileKindItemContent"), v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v10;
  }

  return v6;
}

- (BOOL)presentViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  void *v13;

  v4 = a4;
  v6 = a3;
  if (!self->_delegateFlags.respondsToIsReady
    || (-[PUOverOneUpPresentationSession delegate](self, "delegate"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v7, "overOneUpPresentationSessionPresentingViewControllerIsReady:", self),
        v7,
        v8))
  {
    -[PUOverOneUpPresentationSession _viewModel](self, "_viewModel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "currentAssetReference");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(v10, "copy");
    -[PUOverOneUpPresentationSession _setStashedAssetReference:](self, "_setStashedAssetReference:", v11);

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (!-[PUOverOneUpPresentationSession _presentPhotoMarkupViewController:](self, "_presentPhotoMarkupViewController:", v6))
      {
LABEL_26:
        -[PUOverOneUpPresentationSession viewController](self, "viewController");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "presentViewController:animated:completion:", v6, v4, 0);
        v12 = 0;
        goto LABEL_27;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (!-[PUOverOneUpPresentationSession _presentFunEffectsViewController:animated:](self, "_presentFunEffectsViewController:animated:", v6, v4))goto LABEL_26;
      }
      else
      {
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (!-[PUOverOneUpPresentationSession _presentAvalancheReviewController:](self, "_presentAvalancheReviewController:", v6))goto LABEL_26;
        }
        else
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            if (!-[PUOverOneUpPresentationSession _presentSlideshowViewController:](self, "_presentSlideshowViewController:", v6))goto LABEL_26;
          }
          else
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
              if (!-[PUOverOneUpPresentationSession _presentScreenRoutePickerViewController:](self, "_presentScreenRoutePickerViewController:", v6))goto LABEL_26;
            }
            else
            {
              objc_opt_class();
              if ((objc_opt_isKindOfClass() & 1) != 0)
              {
                if (!-[PUOverOneUpPresentationSession _presentEditViewController:](self, "_presentEditViewController:", v6))goto LABEL_26;
              }
              else
              {
                objc_opt_class();
                if ((objc_opt_isKindOfClass() & 1) == 0
                  || !-[PUOverOneUpPresentationSession _presentActivityViewController:](self, "_presentActivityViewController:", v6))
                {
                  goto LABEL_26;
                }
              }
            }
          }
        }
      }
    }
    if (!self->_delegateFlags.respondsToDidPresent)
    {
      v12 = 1;
      goto LABEL_28;
    }
    -[PUOverOneUpPresentationSession delegate](self, "delegate");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "overOneUpPresentationSession:didPresent:", self, v6);
    v12 = 1;
LABEL_27:

LABEL_28:
    goto LABEL_29;
  }
  v12 = 0;
LABEL_29:

  return v12;
}

- (BOOL)_presentEditViewController:(id)a3
{
  id v4;
  PUOneUpAssetNavigationTransition *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v4 = a3;
  -[PUOverOneUpPresentationSession _setEditViewController:](self, "_setEditViewController:", v4);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(v4, "setPresentationDelegate:", self);
  v5 = objc_alloc_init(PUOneUpAssetNavigationTransition);
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentingViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "parentViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "tabBar");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setHidden:", 1);

  }
  -[PUOverOneUpPresentationSession _funEffectsViewController](self, "_funEffectsViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    -[PUOverOneUpPresentationSession viewController](self, "viewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUNavigationTransition setExpectedDestinationOnPop:](v5, "setExpectedDestinationOnPop:", v12);

  }
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "pu_pushViewController:withTransition:animated:isInteractive:", v4, v5, 1, 0);

  return 1;
}

- (BOOL)_presentPhotoMarkupViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  PUCrossfadeNavigationTransition *v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PUOverOneUpPresentationSession _setPhotoMarkupViewController:](self, "_setPhotoMarkupViewController:", v4);
  objc_msgSend(v4, "registerObserver:", self);
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "isNavigationBarHidden"))
  {
    v7 = objc_alloc_init(PUCrossfadeNavigationTransition);
    -[PUOverOneUpPresentationSession _funEffectsViewController](self, "_funEffectsViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PUOverOneUpPresentationSession viewController](self, "viewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PUNavigationTransition setExpectedDestinationOnPop:](v7, "setExpectedDestinationOnPop:", v9);

    }
    objc_msgSend(v6, "pu_pushViewController:withTransition:animated:isInteractive:", v4, v7, 1, 0);
  }
  else
  {
    v7 = objc_alloc_init(PUCrossfadeModalTransition);
    objc_msgSend(v6, "pu_presentViewController:transition:animated:interactive:completion:", v4, v7, 1, 0, 0);
  }

  return 1;
}

- (BOOL)_presentFunEffectsViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  PUCrossfadeNavigationTransition *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  objc_msgSend(v6, "registerObserver:", self);
  -[PUOverOneUpPresentationSession _setFunEffectsViewController:](self, "_setFunEffectsViewController:", v6);
  v7 = objc_alloc_init(PUCrossfadeNavigationTransition);
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "pu_pushViewController:withTransition:animated:isInteractive:", v6, v7, v4, 0);

  return 1;
}

- (BOOL)_presentActivityViewController:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v12;

  v5 = a3;
  objc_msgSend(v5, "activitySharingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 361, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("activitySharingController"));

  }
  objc_storeStrong((id *)&self->_activitySharingController, v6);
  objc_msgSend(v6, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeWeak((id *)&self->_activitySharingControllerDelegate, v7);

  objc_msgSend(v6, "setDelegate:", self);
  if (pptAfterPresentationCompletion)
  {
    v8 = (void *)objc_msgSend((id)pptAfterPresentationCompletion, "copy");
    objc_msgSend(v5, "setPpt_readyToInteractHandler:", v8);

    v9 = (void *)pptAfterPresentationCompletion;
    pptAfterPresentationCompletion = 0;

  }
  objc_msgSend(v5, "setTransitioningDelegate:", self);
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentViewController:animated:completion:", v5, 1, 0);

  return 1;
}

- (id)animationControllerForPresentedController:(id)a3 presentingController:(id)a4 sourceController:(id)a5
{
  void *v6;
  uint64_t v7;
  void *v8;
  int v9;
  BOOL v10;
  void *v11;
  void *v12;
  PUOneUpPhotosSharingTransitionContext *v13;
  PUOneUpSharingAnimationController *v14;
  void *v15;
  PUOneUpSharingAnimationController *v16;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  objc_msgSend(MEMORY[0x1E0D7B980], "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "enableOneUpAnimation");

  if (v9)
    v10 = v7 == 1;
  else
    v10 = 1;
  if (v10)
  {
    v16 = 0;
  }
  else
  {
    -[PUOverOneUpPresentationSession _viewModel](self, "_viewModel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "currentAssetReference");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_alloc_init(PUOneUpPhotosSharingTransitionContext);
    -[PUOneUpPhotosSharingTransitionContext setCurrentAssetReference:](v13, "setCurrentAssetReference:", v12);
    v14 = [PUOneUpSharingAnimationController alloc];
    -[PUOverOneUpPresentationSession viewController](self, "viewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = -[PUOneUpSharingAnimationController initWithTransitionContext:presentingViewController:](v14, "initWithTransitionContext:presentingViewController:", v13, v15);

    -[PUOneUpSharingAnimationController setDelegate:](v16, "setDelegate:", self);
  }
  return v16;
}

- (BOOL)_presentAvalancheReviewController:(id)a3
{
  id v5;
  PUNavigationController *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  PUAssetReference *v21;
  void *v22;
  void *v23;
  PUAssetReference *v24;
  PUOneUpPhotosSharingTransitionContext *v25;
  void *v26;
  PUOneUpPhotosSharingTransition *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;

  v5 = a3;
  -[PUOverOneUpPresentationSession _setAvalancheReviewController:](self, "_setAvalancheReviewController:", v5);
  objc_msgSend(v5, "setDelegate:", self);
  v6 = -[PUNavigationController initWithNavigationBarClass:toolbarClass:]([PUNavigationController alloc], "initWithNavigationBarClass:toolbarClass:", 0, objc_opt_class());
  -[PUNavigationController pushViewController:animated:](v6, "pushViewController:animated:", v5, 0);

  -[PUNavigationController setModalPresentationStyle:](v6, "setModalPresentationStyle:", 0);
  -[PUOverOneUpPresentationSession _viewModel](self, "_viewModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "currentAssetReference");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "asset");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "burstIdentifier");
  v10 = objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 407, CFSTR("Current asset must have an avalanche UUID"));

  }
  v11 = objc_alloc(MEMORY[0x1E0D715B8]);
  objc_msgSend(v9, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "mainQueueConcurrencyPhotoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v11, "initWithUUID:photoLibrary:", v10, v13);

  objc_msgSend(v9, "pl_managedAsset");
  v15 = objc_claimAutoreleasedReturnValue();
  v36 = v14;
  objc_msgSend(v14, "assets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v15;
  v17 = objc_msgSend(v16, "indexOfObject:", v15);

  v34 = (void *)v10;
  if (v17 == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 412, CFSTR("expect asset"));

  }
  objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v17, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "UUIDString");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v21 = [PUAssetReference alloc];
  objc_msgSend(v8, "asset");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "assetCollection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:](v21, "initWithAsset:assetCollection:indexPath:dataSourceIdentifier:", v22, v23, v18, v20);

  v25 = objc_alloc_init(PUOneUpPhotosSharingTransitionContext);
  -[PUOverOneUpPresentationSession _avalancheReviewController](self, "_avalancheReviewController");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPhotosSharingTransitionContext setAssetCollectionsDataSource:](v25, "setAssetCollectionsDataSource:", v26);

  -[PUOneUpPhotosSharingTransitionContext setCurrentAssetReference:](v25, "setCurrentAssetReference:", v24);
  v27 = -[PUViewControllerTransition initWithDuration:]([PUOneUpPhotosSharingTransition alloc], "initWithDuration:", 0.300000012);
  -[PUOverOneUpPresentationSession _avalancheReviewController](self, "_avalancheReviewController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpPhotosSharingTransition setSharingTransitionViewController:](v27, "setSharingTransitionViewController:", v28);

  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOneUpPhotosSharingTransition setPresentingViewController:](v27, "setPresentingViewController:", v29);

  -[PUOneUpPhotosSharingTransition setOneUpPhotosSharingTransitionContext:](v27, "setOneUpPhotosSharingTransitionContext:", v25);
  -[PUOneUpPhotosSharingTransition setDelegate:](v27, "setDelegate:", self);
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "pu_presentViewController:transition:animated:interactive:completion:", v6, v27, 1, 0, 0);

  return 1;
}

- (BOOL)_presentSlideshowViewController:(id)a3
{
  id v4;
  PUSlideshowNavigationController *v5;
  void *v6;

  v4 = a3;
  -[PUOverOneUpPresentationSession _setSlideshowViewController:](self, "_setSlideshowViewController:", v4);
  objc_msgSend(v4, "setDelegate:", self);
  v5 = -[PUSlideshowNavigationController initWithRootViewController:]([PUSlideshowNavigationController alloc], "initWithRootViewController:", v4);

  -[PUSlideshowNavigationController setModalTransitionStyle:](v5, "setModalTransitionStyle:", 2);
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

  return 1;
}

- (BOOL)_presentScreenRoutePickerViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (self->_barsDelegateFlags.respondsToBarButtonItem)
  {
    -[PUOverOneUpPresentationSession barsDelegate](self, "barsDelegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "overOneUpPresentationSession:barButtonItemForActivityType:", self, *MEMORY[0x1E0D7BC80]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  objc_msgSend(v4, "popoverPresentationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBarButtonItem:", v6);

  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "presentViewController:animated:completion:", v4, 1, 0);

  return 1;
}

- (void)dismissViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  void (**v11)(_QWORD);
  BOOL v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  BOOL v17;
  NSObject *v18;
  void *v19;
  void *v20;
  _QWORD aBlock[4];
  id v22;
  id v23;
  id location;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  void *v28;
  uint64_t v29;

  v6 = a4;
  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __83__PUOverOneUpPresentationSession_dismissViewController_animated_completionHandler___block_invoke;
  aBlock[3] = &unk_1E58A4AC8;
  v10 = v9;
  v22 = v10;
  objc_copyWeak(&v23, &location);
  v11 = (void (**)(_QWORD))_Block_copy(aBlock);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = -[PUOverOneUpPresentationSession _dismissPhotoMarkupViewController:animated:completionHandler:](self, "_dismissPhotoMarkupViewController:animated:completionHandler:", v8, v6, v11);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = -[PUOverOneUpPresentationSession _dismissFunEffectsViewController:animated:completionHandler:](self, "_dismissFunEffectsViewController:animated:completionHandler:", v8, v6, v11);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = -[PUOverOneUpPresentationSession _dismissSlideshowViewController:animated:completionHandler:](self, "_dismissSlideshowViewController:animated:completionHandler:", v8, v6, v11);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = -[PUOverOneUpPresentationSession _dismissAvalancheReviewController:animated:completionHandler:](self, "_dismissAvalancheReviewController:animated:completionHandler:", v8, v6, v11);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = -[PUOverOneUpPresentationSession _dismissEditViewController:animated:completionHandler:](self, "_dismissEditViewController:animated:completionHandler:", v8, v6, v11);
    goto LABEL_13;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v12 = -[PUOverOneUpPresentationSession _dismissActivityViewController:animated:completionHandler:](self, "_dismissActivityViewController:animated:completionHandler:", v8, v6, v11);
LABEL_13:
    if (v12)
      goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    PLOneUpGetLog();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v8, "presentingViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v8, "modalPresentationStyle"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v14;
      v27 = 2112;
      v28 = v15;
      _os_log_impl(&dword_1AAB61000, v13, OS_LOG_TYPE_ERROR, "Failed to dismiss edit. presentingVC: %@, modalPresentationStyle: %@", buf, 0x16u);

    }
  }
  objc_msgSend(v8, "presentingViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16 == 0;

  if (!v17)
  {
    if (objc_msgSend(v8, "modalPresentationStyle") != 7)
    {
      -[PUOverOneUpPresentationSession viewController](self, "viewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dismissViewControllerAnimated:completion:", v6, v11);

      goto LABEL_25;
    }
    PLUIGetLog();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      -[PUOverOneUpPresentationSession viewController](self, "viewController");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v26 = v8;
      v27 = 2112;
      v28 = v19;
      _os_log_impl(&dword_1AAB61000, v18, OS_LOG_TYPE_DEFAULT, "can't dismiss %@ from presumed presenting view controller %@", buf, 0x16u);

    }
  }
  v11[2](v11);
LABEL_25:

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

}

- (BOOL)_dismissSlideshowViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  objc_msgSend(a3, "dismissViewControllerAnimated:completion:", a4, a5);
  -[PUOverOneUpPresentationSession _setSlideshowViewController:](self, "_setSlideshowViewController:", 0);
  return 1;
}

- (BOOL)_dismissEditViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  void (**v8)(_QWORD);
  _BOOL8 v9;
  NSObject *v10;
  void *v11;
  int v13;
  void *v14;
  uint64_t v15;

  v5 = a4;
  v15 = *MEMORY[0x1E0C80C00];
  v8 = (void (**)(_QWORD))a5;
  v9 = -[PUOverOneUpPresentationSession _popToOneUpFromViewController:animated:](self, "_popToOneUpFromViewController:animated:", a3, v5);
  -[PUOverOneUpPresentationSession _setEditViewController:](self, "_setEditViewController:", 0);
  if (v8)
    v8[2](v8);
  PLOneUpGetLog();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 138412290;
    v14 = v11;
    _os_log_impl(&dword_1AAB61000, v10, OS_LOG_TYPE_DEFAULT, "Actually dismissed Edit VC success? %@", (uint8_t *)&v13, 0xCu);

  }
  return v9;
}

- (BOOL)_dismissPhotoMarkupViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  void *v11;
  id v12;
  BOOL v13;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(_QWORD))a5;
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "navigationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOverOneUpPresentationSession _setPhotoMarkupViewController:](self, "_setPhotoMarkupViewController:", 0);
  objc_msgSend(v11, "presentedViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v8)
  {
    v13 = 1;
    objc_msgSend(v11, "dismissViewControllerAnimated:completion:", 1, 0);
    if (!v9)
      goto LABEL_4;
    goto LABEL_3;
  }
  v13 = -[PUOverOneUpPresentationSession _popToOneUpFromViewController:animated:](self, "_popToOneUpFromViewController:animated:", v8, v6);
  if (v9)
LABEL_3:
    v9[2](v9);
LABEL_4:

  return v13;
}

- (BOOL)_dismissFunEffectsViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  void (**v8)(_QWORD);
  id v9;
  BOOL v10;

  v5 = a4;
  v8 = (void (**)(_QWORD))a5;
  v9 = a3;
  -[PUOverOneUpPresentationSession _setFunEffectsViewController:](self, "_setFunEffectsViewController:", 0);
  v10 = -[PUOverOneUpPresentationSession _popToOneUpFromViewController:animated:](self, "_popToOneUpFromViewController:animated:", v9, v5);

  if (v8)
    v8[2](v8);

  return v10;
}

- (BOOL)_dismissActivityViewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v5 = a4;
  v8 = a5;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __92__PUOverOneUpPresentationSession__dismissActivityViewController_animated_completionHandler___block_invoke;
  v11[3] = &unk_1E58AB968;
  v11[4] = self;
  v12 = v8;
  v9 = v8;
  objc_msgSend(a3, "pu_dismissViewControllerAnimated:interactive:completion:", v5, 0, v11);

  return 1;
}

- (BOOL)_dismissAvalancheReviewController:(id)a3 animated:(BOOL)a4 completionHandler:(id)a5
{
  _BOOL8 v5;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[5];
  id v12;

  v5 = a4;
  v7 = a5;
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __95__PUOverOneUpPresentationSession__dismissAvalancheReviewController_animated_completionHandler___block_invoke;
  v11[3] = &unk_1E58AB968;
  v11[4] = self;
  v12 = v7;
  v9 = v7;
  objc_msgSend(v8, "pu_dismissViewControllerAnimated:interactive:completion:", v5, 0, v11);

  return 1;
}

- (BOOL)_popToOneUpFromViewController:(id)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  BOOL v13;
  int v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  NSObject *v23;
  void *v24;
  _BOOL4 v26;
  char v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  NSObject *v36;
  __int16 v37;
  void *v38;
  uint64_t v39;

  v4 = a4;
  v39 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "navigationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indexOfObject:", v8);
  v12 = objc_msgSend(v10, "containsObject:", v6);
  if (v9)
    v13 = v11 == 0x7FFFFFFFFFFFFFFFLL;
  else
    v13 = 1;
  if (v13)
    v14 = 1;
  else
    v14 = v12 ^ 1;
  if (v14 != 1)
  {
    v26 = v4;
    v27 = v14;
    objc_msgSend(v10, "px_subarrayAfterIndex:", v11);
    v16 = objc_claimAutoreleasedReturnValue();
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v29 != v21)
            objc_enumerationMutation(v16);
          -[PUOverOneUpPresentationSession _removeViewController:](self, "_removeViewController:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * i));
        }
        v20 = -[NSObject countByEnumeratingWithState:objects:count:](v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v20);
    }
    if ((isKindOfClass & 1) != 0)
    {
      PLOneUpGetLog();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        -[PUOverOneUpPresentationSession _editViewController](self, "_editViewController");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v34 = v9;
        v35 = 2112;
        v36 = v16;
        v37 = 2112;
        v38 = v24;
        _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_DEFAULT, "Popping to 1Up: navController: %@, VCs to remove: %@, editVC: %@", buf, 0x20u);

      }
    }
    objc_msgSend(v9, "pu_popToViewController:animated:interactive:", v8, v26, 0);
    LOBYTE(v14) = v27;
    goto LABEL_23;
  }
  if ((isKindOfClass & 1) != 0)
  {
    v15 = v12;
    PLOneUpGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v11 != 0x7FFFFFFFFFFFFFFFLL);
      v17 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v15);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v34 = v9;
      v35 = 2112;
      v36 = v17;
      v37 = 2112;
      v38 = v18;
      _os_log_impl(&dword_1AAB61000, v16, OS_LOG_TYPE_ERROR, "Not in a good state to pop. navController: %@, inNavStack: %@, vcInNavStack: %@", buf, 0x20u);

    }
LABEL_23:

  }
  return v14 ^ 1;
}

- (void)_removeViewController:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;

  v10 = a3;
  -[PUOverOneUpPresentationSession _photoMarkupViewController](self, "_photoMarkupViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v10)
  {
    -[PUOverOneUpPresentationSession _setPhotoMarkupViewController:](self, "_setPhotoMarkupViewController:", 0);
    goto LABEL_11;
  }
  -[PUOverOneUpPresentationSession _funEffectsViewController](self, "_funEffectsViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v10)
  {
    -[PUOverOneUpPresentationSession _setFunEffectsViewController:](self, "_setFunEffectsViewController:", 0);
    goto LABEL_11;
  }
  -[PUOverOneUpPresentationSession _slideshowViewController](self, "_slideshowViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v10)
  {
    -[PUOverOneUpPresentationSession _setSlideshowViewController:](self, "_setSlideshowViewController:", 0);
    goto LABEL_11;
  }
  -[PUOverOneUpPresentationSession _avalancheReviewController](self, "_avalancheReviewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v10)
  {
    -[PUOverOneUpPresentationSession _setAvalancheReviewController:](self, "_setAvalancheReviewController:", 0);
    goto LABEL_11;
  }
  -[PUOverOneUpPresentationSession _editViewController](self, "_editViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9 = v10;
  if (v8 == v10)
  {
    -[PUOverOneUpPresentationSession _setEditViewController:](self, "_setEditViewController:", 0);
LABEL_11:
    v9 = v10;
  }

}

- (BOOL)prepareForDismissingForced:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t i;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v3 = a3;
  v19 = *MEMORY[0x1E0C80C00];
  -[PUOverOneUpPresentationSession _invalidatePresentedViewControllers](self, "_invalidatePresentedViewControllers");
  -[PUOverOneUpPresentationSession _updatePresentedViewControllersIfNeeded](self, "_updatePresentedViewControllersIfNeeded");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[PUOverOneUpPresentationSession _presentedViewControllers](self, "_presentedViewControllers", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (!v6)
  {
    v9 = 1;
    goto LABEL_16;
  }
  v7 = v6;
  v8 = *(_QWORD *)v15;
  v9 = 1;
  while (2)
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v15 != v8)
        objc_enumerationMutation(v5);
      v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
      v12 = objc_msgSend(v11, "conformsToProtocol:", &unk_1EEC31040);
      if ((v9 & v12) == 1)
      {
        v9 = objc_msgSend(v11, "prepareForDismissingForced:", v3);
        if ((v9 & 1) != 0)
          continue;
      }
      else
      {
        v9 &= v12 ^ 1;
        if ((v9 & 1) != 0)
          continue;
      }
      if (!v3)
      {
        v9 = 0;
        goto LABEL_16;
      }
    }
    v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v7)
      continue;
    break;
  }
LABEL_16:

  -[PUOverOneUpPresentationSession _finishOverOneUpPresentationSessionDismissForced:animated:](self, "_finishOverOneUpPresentationSessionDismissForced:animated:", v9 | v3, 0);
  return v9;
}

- (id)_assetReferenceFromAsset:(id)a3 hintIndexPath:(id)a4 hintCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  PUAssetReference *v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    v11 = v9;
    v12 = v10;
    if (!v11)
    {
      -[PUOverOneUpPresentationSession _stashedAssetReference](self, "_stashedAssetReference");
      v11 = (id)objc_claimAutoreleasedReturnValue();

      if (v11)
      {
        -[PUOverOneUpPresentationSession _stashedAssetReference](self, "_stashedAssetReference");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "indexPath");
        v11 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    if (!v12)
    {
      -[PUOverOneUpPresentationSession _stashedAssetReference](self, "_stashedAssetReference");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        -[PUOverOneUpPresentationSession _stashedAssetReference](self, "_stashedAssetReference");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "assetCollection");
        v12 = (id)objc_claimAutoreleasedReturnValue();

      }
    }
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "UUIDString");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:]([PUAssetReference alloc], "initWithAsset:assetCollection:indexPath:dataSourceIdentifier:", v8, v12, v11, v16);
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_performNavigationRequestForAssetDisplayDescriptor:(id)a3 completionHandler:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "dateWithTimeIntervalSinceNow:", 2.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PLOneUpGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 138412290;
    v13 = v10;
    _os_log_impl(&dword_1AAB61000, v11, OS_LOG_TYPE_DEFAULT, "Performing request with navigator: %@", (uint8_t *)&v12, 0xCu);
  }

  objc_msgSend(v10, "navigateToAssetDisplayDescriptor:beforeDate:completionHandler:", v8, v9, v7);
}

- (void)slideshowViewControllerDidFinish:(id)a3 withVisibleAssets:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  objc_msgSend(a4, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOverOneUpPresentationSession _assetReferenceFromAsset:hintIndexPath:hintCollection:](self, "_assetReferenceFromAsset:hintIndexPath:hintCollection:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUAssetDisplayDescriptor assetDisplayDescriptorForSimpleNavigationToAssetReference:](PUAssetDisplayDescriptor, "assetDisplayDescriptorForSimpleNavigationToAssetReference:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __85__PUOverOneUpPresentationSession_slideshowViewControllerDidFinish_withVisibleAssets___block_invoke;
  v11[3] = &unk_1E58AA020;
  v11[4] = self;
  v12 = v6;
  v10 = v6;
  -[PUOverOneUpPresentationSession _performNavigationRequestForAssetDisplayDescriptor:completionHandler:](self, "_performNavigationRequestForAssetDisplayDescriptor:completionHandler:", v9, v11);

}

- (void)editController:(id)a3 didFinishPreparingForTransitionAfterEditingPhoto:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v15[5];
  id v16;

  v6 = a3;
  -[PUOverOneUpPresentationSession _assetReferenceFromAsset:hintIndexPath:hintCollection:](self, "_assetReferenceFromAsset:hintIndexPath:hintCollection:", a4, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUAssetDisplayDescriptor assetDisplayDescriptorForSimpleNavigationToAssetReference:](PUAssetDisplayDescriptor, "assetDisplayDescriptorForSimpleNavigationToAssetReference:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "presentingViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "parentViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v12, "tabBar");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setHidden:", 0);

  }
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __98__PUOverOneUpPresentationSession_editController_didFinishPreparingForTransitionAfterEditingPhoto___block_invoke;
  v15[3] = &unk_1E58AA020;
  v15[4] = self;
  v16 = v6;
  v14 = v6;
  -[PUOverOneUpPresentationSession _performNavigationRequestForAssetDisplayDescriptor:completionHandler:](self, "_performNavigationRequestForAssetDisplayDescriptor:completionHandler:", v8, v15);

}

- (void)editController:(id)a3 didFinishPreparingForTransitionAfterEditingVideo:(id)a4 modificationDate:(id)a5 seekTime:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  PUAssetDisplayDescriptor *v13;
  PUAssetDisplayDescriptor *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  id v21;
  _QWORD v22[5];
  id v23;
  $3CC8671D27C23BF42ADDB32F2B5E48AE buf;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  -[PUOverOneUpPresentationSession _assetReferenceFromAsset:hintIndexPath:hintCollection:](self, "_assetReferenceFromAsset:hintIndexPath:hintCollection:", a4, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = [PUAssetDisplayDescriptor alloc];
  buf = *a6;
  v14 = -[PUAssetDisplayDescriptor initWithAssetReference:modifiedAfterDate:videoSeekTime:](v13, "initWithAssetReference:modifiedAfterDate:videoSeekTime:", v12, v11, &buf);

  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "navigationController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "presentingViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "parentViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v18, "tabBar");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setHidden:", 0);

  }
  PLOneUpGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf.var0) = 138412546;
    *(int64_t *)((char *)&buf.var0 + 4) = (int64_t)v14;
    LOWORD(buf.var2) = 2112;
    *(_QWORD *)((char *)&buf.var2 + 2) = v18;
    _os_log_impl(&dword_1AAB61000, v20, OS_LOG_TYPE_DEFAULT, "Preparing to perform dismiss Edit for displayDescriptor: %@, parentController: %@", (uint8_t *)&buf, 0x16u);
  }

  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __124__PUOverOneUpPresentationSession_editController_didFinishPreparingForTransitionAfterEditingVideo_modificationDate_seekTime___block_invoke;
  v22[3] = &unk_1E58AA020;
  v22[4] = self;
  v23 = v10;
  v21 = v10;
  -[PUOverOneUpPresentationSession _performNavigationRequestForAssetDisplayDescriptor:completionHandler:](self, "_performNavigationRequestForAssetDisplayDescriptor:completionHandler:", v14, v22);

}

- (void)photoMarkupController:(id)a3 didFinishWithSavedAsset:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t);
  void *v13;
  PUOverOneUpPresentationSession *v14;
  id v15;

  v5 = a3;
  objc_msgSend(v5, "reviewAsset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOverOneUpPresentationSession _assetReferenceFromAsset:hintIndexPath:hintCollection:](self, "_assetReferenceFromAsset:hintIndexPath:hintCollection:", v6, 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUAssetDisplayDescriptor assetDisplayDescriptorForSimpleNavigationToAssetReference:](PUAssetDisplayDescriptor, "assetDisplayDescriptorForSimpleNavigationToAssetReference:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __80__PUOverOneUpPresentationSession_photoMarkupController_didFinishWithSavedAsset___block_invoke;
  v13 = &unk_1E58AA020;
  v14 = self;
  v15 = v5;
  v9 = v5;
  -[PUOverOneUpPresentationSession _performNavigationRequestForAssetDisplayDescriptor:completionHandler:](self, "_performNavigationRequestForAssetDisplayDescriptor:completionHandler:", v8, &v10);
  objc_msgSend(v9, "unregisterObserver:", self, v10, v11, v12, v13, v14);

}

- (void)funEffectsViewController:(id)a3 didSaveAsset:(id)a4 withCompletion:(unint64_t)a5
{
  void *v7;
  void *v8;
  void *v9;
  PUOverOneUpPresentationSession *v10;
  uint64_t v11;
  void *v12;

  -[PUOverOneUpPresentationSession _funEffectsViewController](self, "_funEffectsViewController", a3, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  switch(a5)
  {
    case 5uLL:
      if (!self->_barsDelegateFlags.respondsToDidAppendReviewScreenAction)
        break;
      v12 = v7;
      -[PUOverOneUpPresentationSession barsDelegate](self, "barsDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = self;
      v11 = 1;
LABEL_9:
      objc_msgSend(v8, "overOneUpPresentationSession:didAppendReviewScreenAction:", v10, v11);

      goto LABEL_10;
    case 4uLL:
      if (!self->_barsDelegateFlags.respondsToDidAppendReviewScreenAction)
        break;
      v12 = v7;
      -[PUOverOneUpPresentationSession barsDelegate](self, "barsDelegate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      v10 = self;
      v11 = 0;
      goto LABEL_9;
    case 3uLL:
      v12 = v7;
      -[PUOverOneUpPresentationSession dismissViewController:animated:completionHandler:](self, "dismissViewController:animated:completionHandler:", v7, 1, 0);
      objc_msgSend(v12, "unregisterObserver:", self);
      -[PUOverOneUpPresentationSession _setFunEffectsViewController:](self, "_setFunEffectsViewController:", 0);
LABEL_10:
      v7 = v12;
      break;
  }

}

- (void)avalancheReviewControllerDidComplete:(id)a3 withAsset:(id)a4 animated:(BOOL)a5
{
  id v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  BOOL v14;

  v8 = a3;
  -[PUOverOneUpPresentationSession _assetReferenceFromAsset:hintIndexPath:hintCollection:](self, "_assetReferenceFromAsset:hintIndexPath:hintCollection:", a4, 0, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUAssetDisplayDescriptor assetDisplayDescriptorForSimpleNavigationToAssetReference:](PUAssetDisplayDescriptor, "assetDisplayDescriptorForSimpleNavigationToAssetReference:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __90__PUOverOneUpPresentationSession_avalancheReviewControllerDidComplete_withAsset_animated___block_invoke;
  v12[3] = &unk_1E58A3450;
  v12[4] = self;
  v13 = v8;
  v14 = a5;
  v11 = v8;
  -[PUOverOneUpPresentationSession _performNavigationRequestForAssetDisplayDescriptor:completionHandler:](self, "_performNavigationRequestForAssetDisplayDescriptor:completionHandler:", v10, v12);

}

- (void)avalancheReviewControllerDidComplete:(id)a3 animated:(BOOL)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __80__PUOverOneUpPresentationSession_avalancheReviewControllerDidComplete_animated___block_invoke;
  v4[3] = &unk_1E58ABD10;
  v4[4] = self;
  -[PUOverOneUpPresentationSession dismissViewController:animated:completionHandler:](self, "dismissViewController:animated:completionHandler:", a3, a4, v4);
}

- (void)_finalizeAvalancheReviewControllerDismiss
{
  void *v3;

  -[PUOverOneUpPresentationSession _avalancheReviewController](self, "_avalancheReviewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", 0);

  -[PUOverOneUpPresentationSession _setAvalancheReviewController:](self, "_setAvalancheReviewController:", 0);
}

- (void)activitySharingControllerDidCancel:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  id v12;

  v5 = a3;
  -[PUOverOneUpPresentationSession activitySharingControllerDelegate](self, "activitySharingControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activitySharingControllerDidCancel:", v5);

  v12 = v5;
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 801, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "px_descriptionForAssertionMessage");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 801, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController"), v9, v11);

    goto LABEL_6;
  }
LABEL_3:
  -[PUOverOneUpPresentationSession _activitySharingControllerDidCancel:](self, "_activitySharingControllerDidCancel:", v12);

}

- (void)activitySharingControllerWillDismissActivityViewController:(id)a3
{
  id v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  objc_class *v12;
  void *v13;
  id v14;

  v5 = a3;
  -[PUOverOneUpPresentationSession activitySharingControllerDelegate](self, "activitySharingControllerDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[PUOverOneUpPresentationSession activitySharingControllerDelegate](self, "activitySharingControllerDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "activitySharingControllerWillDismissActivityViewController:", v5);

  }
  v14 = v5;
  if (!v14)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (objc_class *)objc_opt_class();
    NSStringFromClass(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 810, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController"), v11);
LABEL_8:

    goto LABEL_5;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 810, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController"), v11, v13);

    goto LABEL_8;
  }
LABEL_5:
  -[PUOverOneUpPresentationSession _activitySharingControllerWillDismissActivityViewController:](self, "_activitySharingControllerWillDismissActivityViewController:", v14);

}

- (void)activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5
{
  _BOOL8 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  objc_class *v13;
  void *v14;
  objc_class *v15;
  void *v16;
  id v17;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  -[PUOverOneUpPresentationSession activitySharingControllerDelegate](self, "activitySharingControllerDelegate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activitySharingController:didCompleteWithActivityType:success:", v9, v10, v5);

  v17 = v9;
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 817, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("activitySharingController"), v14);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "px_descriptionForAssertionMessage");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 817, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("activitySharingController"), v14, v16);

    goto LABEL_6;
  }
LABEL_3:
  -[PUOverOneUpPresentationSession _activitySharingController:didCompleteWithActivityType:success:](self, "_activitySharingController:didCompleteWithActivityType:success:", v17, v10, v5);

}

- (void)_prepareForActivitySharingControllerDismiss:(id)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a4;
  objc_msgSend(a3, "currentAsset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOverOneUpPresentationSession _assetReferenceFromAsset:hintIndexPath:hintCollection:](self, "_assetReferenceFromAsset:hintIndexPath:hintCollection:", v7, 0, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  +[PUAssetDisplayDescriptor assetDisplayDescriptorForSimpleNavigationToAssetReference:](PUAssetDisplayDescriptor, "assetDisplayDescriptorForSimpleNavigationToAssetReference:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__PUOverOneUpPresentationSession__prepareForActivitySharingControllerDismiss_completionHandler___block_invoke;
  v11[3] = &unk_1E58AA6A8;
  v12 = v6;
  v10 = v6;
  -[PUOverOneUpPresentationSession _performNavigationRequestForAssetDisplayDescriptor:completionHandler:](self, "_performNavigationRequestForAssetDisplayDescriptor:completionHandler:", v9, v11);

}

- (void)_activitySharingControllerWillDismissActivityViewController:(id)a3
{
  -[PUOverOneUpPresentationSession _prepareForActivitySharingControllerDismiss:completionHandler:](self, "_prepareForActivitySharingControllerDismiss:completionHandler:", a3, 0);
}

- (void)_activitySharingControllerDidCancel:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  -[PUOverOneUpPresentationSession activitySharingControllerDelegate](self, "activitySharingControllerDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", v5);

  -[PUOverOneUpPresentationSession setActivitySharingControllerDelegate:](self, "setActivitySharingControllerDelegate:", 0);
  -[PUOverOneUpPresentationSession setActivitySharingController:](self, "setActivitySharingController:", 0);
  -[PUOverOneUpPresentationSession _finishOverOneUpPresentationSessionDismissForced:animated:](self, "_finishOverOneUpPresentationSessionDismissForced:animated:", 0, 1);
}

- (void)_activitySharingController:(id)a3 didCompleteWithActivityType:(id)a4 success:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[16];

  v5 = a5;
  v8 = a3;
  v9 = a4;
  -[PUOverOneUpPresentationSession activitySharingController](self, "activitySharingController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    PLUIGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AAB61000, v14, OS_LOG_TYPE_ERROR, "didCompleteWithActivityType: was called whereas self.activitySharingController == nil.", buf, 2u);
    }
    goto LABEL_11;
  }
  if (v5)
  {
    -[PUOverOneUpPresentationSession setActivitySharingController:](self, "setActivitySharingController:", 0);
    -[PUOverOneUpPresentationSession activitySharingControllerDelegate](self, "activitySharingControllerDelegate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setDelegate:", v11);
    -[PUOverOneUpPresentationSession setActivitySharingControllerDelegate:](self, "setActivitySharingControllerDelegate:", 0);
    if ((objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D7BD48]) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D7BD08]) & 1) != 0
      || (objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D7BD98]) & 1) != 0
      || objc_msgSend(v9, "isEqualToString:", *MEMORY[0x1E0D7BE50]))
    {
      objc_msgSend(v8, "selectedAssetsByAssetCollection");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v12 = 0;
    }
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __97__PUOverOneUpPresentationSession__activitySharingController_didCompleteWithActivityType_success___block_invoke;
    v15[3] = &unk_1E58A9328;
    v15[4] = self;
    v16 = v8;
    v17 = v11;
    v18 = v9;
    v19 = v12;
    v13 = v12;
    v14 = v11;
    -[PUOverOneUpPresentationSession _prepareForActivitySharingControllerDismiss:completionHandler:](self, "_prepareForActivitySharingControllerDismiss:completionHandler:", v16, v15);

LABEL_11:
  }

}

- (CGRect)_frameForItemAtIndexPath:(id)a3 inAssetCollectionsDataSource:(id)a4 allowZoom:(BOOL)a5
{
  _BOOL4 v5;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  PUAssetReference *v22;
  void *v23;
  void *v24;
  PUAssetReference *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PUAssetReference *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  int v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  void *v41;
  void *v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  void *v51;
  double v52;
  void *v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  _BOOL4 v67;
  void *v68;
  void *v69;
  void *v70;
  CGRect result;

  v5 = a5;
  v9 = a3;
  v10 = a4;
  objc_msgSend(v10, "assetCollectionsFetchResult");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOverOneUpPresentationSession _viewModel](self, "_viewModel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "currentAssetReference");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v67 = v5;
  if (v11 && (v14 = objc_msgSend(v11, "count"), v14 > objc_msgSend(v9, "section")))
  {
    objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v9, "section"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "assetsInAssetCollection:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 892, CFSTR("No datasource or index out of bounds"));

    v16 = 0;
    v15 = 0;
  }
  v18 = objc_msgSend(v16, "count");
  v68 = v11;
  v69 = v10;
  v70 = v15;
  if (objc_msgSend(v9, "item") >= v18)
  {
    v26 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v15, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "stringWithFormat:", CFSTR("PUOverOneUpPresentationSession: IndexPath %@ does not exist in collection %@ with count %lu"), v9, v27, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 903, v19);
    v25 = 0;
  }
  else
  {
    objc_msgSend(v16, "objectAtIndex:", objc_msgSend(v9, "item"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "UUIDString");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = [PUAssetReference alloc];
    objc_msgSend(v13, "assetCollection");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "indexPath");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:](v22, "initWithAsset:assetCollection:indexPath:dataSourceIdentifier:", v19, v23, v24, v21);

  }
  -[PUOverOneUpPresentationSession activitySharingController](self, "activitySharingController");
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  if (v28)
  {
    if (v25)
    {
      -[PUOverOneUpPresentationSession _assetsDataSource](self, "_assetsDataSource");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "assetReferenceForAssetReference:", v25);
      v30 = (PUAssetReference *)objc_claimAutoreleasedReturnValue();

      v31 = -[PUOverOneUpPresentationSession _globalIndexForAssetReference:](self, "_globalIndexForAssetReference:", v30);
      if (v30)
      {
        -[PUAssetReference asset](v30, "asset");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "asset");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v32, "isEqual:", v33);

        v25 = v30;
      }
      else
      {
        v34 = 0;
        v25 = 0;
      }
    }
    else
    {
      v34 = 0;
      v31 = 0x7FFFFFFFFFFFFFFFLL;
    }
  }
  else
  {
    -[PUOverOneUpPresentationSession _avalancheReviewController](self, "_avalancheReviewController");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    v34 = 1;
    v31 = 0x7FFFFFFFFFFFFFFFLL;
    if (v16 && v35)
    {
      objc_msgSend(v13, "asset");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v16, "indexOfObject:", v36);

      v38 = objc_msgSend(v9, "item");
      v31 = v38;
      v34 = v37 == 0x7FFFFFFFFFFFFFFFLL || v38 == 0x7FFFFFFFFFFFFFFFLL || v38 == v37;
    }
  }
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "view");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "frame");
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;

  if (!v25 || (v34 & v67 & 1) != 0)
  {
    -[PUOverOneUpPresentationSession _frameForAssetReference:](self, "_frameForAssetReference:", v13);
  }
  else
  {
    -[PUAssetReference asset](v25, "asset");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v52 = (double)(unint64_t)objc_msgSend(v51, "pixelWidth");
    -[PUAssetReference asset](v25, "asset");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (double)(unint64_t)objc_msgSend(v53, "pixelHeight");

    v55 = PURectWithSizeThatFitsInRect(v52, v54, v44, v46, v48, v50);
  }
  v59 = v56;
  v60 = v57;
  v61 = v58;
  v62 = v55 + (double)v31 * v48;

  v63 = v62;
  v64 = v59;
  v65 = v60;
  v66 = v61;
  result.size.height = v66;
  result.size.width = v65;
  result.origin.y = v64;
  result.origin.x = v63;
  return result;
}

- (CGRect)_frameForAssetReference:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  void *v43;
  CGRect result;

  v5 = a3;
  -[PUOverOneUpPresentationSession _assetsDataSource](self, "_assetsDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetAtIndexPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqual:", v5);

  v10 = v5;
  if ((v9 & 1) == 0)
  {
    -[PUOverOneUpPresentationSession _assetsDataSource](self, "_assetsDataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetReferenceForAssetReference:", v5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[PUOverOneUpPresentationSession _tilingView](self, "_tilingView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layout");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 944, CFSTR("Missing layout"));

  }
  objc_msgSend(v10, "indexPath");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutInfoForTileWithIndexPath:kind:", v14, CFSTR("PUTileKindItemContent"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "frame");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    objc_msgSend(v15, "coordinateSystem");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "contentCoordinateSystem");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v24, v25, v17, v19);
    v28 = v27;

    -[PUOverOneUpPresentationSession viewController](self, "viewController");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "view");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "convertRect:toView:", v30, v26, v28, v21, v23);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

  }
  else
  {
    v32 = *MEMORY[0x1E0C9D628];
    v34 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v36 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v38 = *(double *)(MEMORY[0x1E0C9D628] + 24);
  }

  v39 = v32;
  v40 = v34;
  v41 = v36;
  v42 = v38;
  result.size.height = v42;
  result.size.width = v41;
  result.origin.y = v40;
  result.origin.x = v39;
  return result;
}

- (CGRect)_frameAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  CGRect result;

  v4 = a3;
  -[PUOverOneUpPresentationSession _tilingView](self, "_tilingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layout");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutInfoForTileWithIndexPath:kind:", v4, CFSTR("PUTileKindItemContent"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  objc_msgSend(v7, "coordinateSystem");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentCoordinateSystem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = PUConvertPointFromCoordinateSystemToCoordinateSystem(v16, v17, v9, v11);
  v20 = v19;

  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "view");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toView:", v22, v18, v20, v13, v15);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v31 = v24;
  v32 = v26;
  v33 = v28;
  v34 = v30;
  result.size.height = v34;
  result.size.width = v33;
  result.origin.y = v32;
  result.origin.x = v31;
  return result;
}

- (id)photosSharingTransition:(id)a3 layoutForAssetReference:(id)a4
{
  return -[PUCollectionViewLayoutCache initWithProvider:]([PUCollectionViewLayoutCache alloc], "initWithProvider:", self);
}

- (CGPoint)photosSharingTransition:(id)a3 contentOffsetForAssetReference:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  v5 = a4;
  -[PUOverOneUpPresentationSession _assetCollectionsDataSourceForCurrentModalViewController](self, "_assetCollectionsDataSourceForCurrentModalViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUOverOneUpPresentationSession _frameForItemAtIndexPath:inAssetCollectionsDataSource:allowZoom:](self, "_frameForItemAtIndexPath:inAssetCollectionsDataSource:allowZoom:", v7, v6, 0);
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.y = v13;
  result.x = v12;
  return result;
}

- (void)photosSharingTransition:(id)a3 setVisibility:(BOOL)a4 forAssetReference:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;

  v5 = a4;
  v7 = a3;
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
    objc_msgSend(v8, "oneUpAssetTransitionDidEnd:", v7);
  else
    objc_msgSend(v8, "oneUpAssetTransitionWillBegin:", v7);

}

- (id)photosSharingTransitionTransitioningView:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  -[PUOverOneUpPresentationSession viewController](self, "viewController", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "superview");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)viewToHideWhilePresentingWithTransition:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;

  -[PUOverOneUpPresentationSession viewController](self, "viewController", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (objc_class *)objc_opt_class();
      NSStringFromClass(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 1004, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.viewController"), v12, v13);

    }
  }
  -[PUOverOneUpPresentationSession _avalancheReviewController](self, "_avalancheReviewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v5, "chromeView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUOverOneUpPresentationSession activitySharingController](self, "activitySharingController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v5, "navigationController");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "toolbar");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v7;
}

- (void)oneUpSharingAnimationController:(id)a3 setVisibility:(BOOL)a4 forAssetReference:(id)a5
{
  _BOOL4 v5;
  id v7;
  void *v8;
  id v9;

  v5 = a4;
  v7 = a3;
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v5)
    objc_msgSend(v8, "oneUpAssetTransitionDidEnd:", v7);
  else
    objc_msgSend(v8, "oneUpAssetTransitionWillBegin:", v7);

}

- (id)_assetCollectionsDataSourceForCurrentModalViewController
{
  void *v3;
  void *v4;
  void *v5;

  -[PUOverOneUpPresentationSession _avalancheReviewController](self, "_avalancheReviewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PUOverOneUpPresentationSession _avalancheReviewController](self, "_avalancheReviewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUOverOneUpPresentationSession activitySharingController](self, "activitySharingController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[PUActivitySharingController carouselViewController](self->_activitySharingController, "carouselViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
  }
  return v4;
}

- (int64_t)_tileCountForCurrentModalViewController
{
  void *v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  int64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;

  -[PUOverOneUpPresentationSession activitySharingController](self, "activitySharingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return -[PUOverOneUpPresentationSession _numberOfItems](self, "_numberOfItems");
  -[PUOverOneUpPresentationSession _avalancheReviewController](self, "_avalancheReviewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
    return 0;
  -[PUOverOneUpPresentationSession _assetCollectionsDataSourceForCurrentModalViewController](self, "_assetCollectionsDataSourceForCurrentModalViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetCollectionsFetchResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetCollectionsFetchResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  v10 = 0;
  if (v9)
  {
    v11 = 0;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "assetsInAssetCollection:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 += objc_msgSend(v13, "count");

      ++v11;
      objc_msgSend(v6, "assetCollectionsFetchResult");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "count");

    }
    while (v11 < v15);
  }

  return v10;
}

- (CGSize)collectionViewContentSize
{
  uint64_t v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGSize result;

  v3 = -[PUOverOneUpPresentationSession _tileCountForCurrentModalViewController](self, "_tileCountForCurrentModalViewController");
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v6;
  v9 = v8;

  v10 = v7 * (double)v3;
  v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  int64_t v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  CGRect v20;
  CGRect v21;
  CGRect v22;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v8 = -[PUOverOneUpPresentationSession _tileCountForCurrentModalViewController](self, "_tileCountForCurrentModalViewController");
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "frame");
  v12 = v11;

  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v13 = (uint64_t)fmax(CGRectGetMinX(v20) / v12, 0.0);
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 > v13)
  {
    while (1)
    {
      -[PUOverOneUpPresentationSession activitySharingController](self, "activitySharingController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (v15)
      {
        -[PUOverOneUpPresentationSession _assetReferenceAtGlobalIndex:](self, "_assetReferenceAtGlobalIndex:", v13);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "indexPath");
        v17 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v13, 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
      }

      -[PUOverOneUpPresentationSession layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "frame");
      v21.size.width = v12 - (v21.origin.x - (double)v13 * v12);
      v22.origin.x = x;
      v22.origin.y = y;
      v22.size.width = width;
      v22.size.height = height;
      if (!CGRectIntersectsRect(v21, v22))
        break;
      objc_msgSend(v14, "addObject:", v18);
      ++v13;

      if (v8 == v13)
        return v14;
    }

  }
  return v14;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;

  v4 = a3;
  -[PUOverOneUpPresentationSession _assetCollectionsDataSourceForCurrentModalViewController](self, "_assetCollectionsDataSourceForCurrentModalViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUOverOneUpPresentationSession _frameForItemAtIndexPath:inAssetCollectionsDataSource:allowZoom:](self, "_frameForItemAtIndexPath:inAssetCollectionsDataSource:allowZoom:", v4, v5, 1);
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForCellWithIndexPath:", v4);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);
  return v14;
}

- (id)layoutAttributesForSupplementaryViewOfKind:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;

  v6 = a3;
  v7 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("PUPhotosSharingSelectionBadgeKind")) & 1) != 0
    || (objc_msgSend(v6, "isEqualToString:", CFSTR("PUPhotosSharingOptionBadgeKind")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("PUAvalancheReviewBadgeKind")))
  {
    -[PUOverOneUpPresentationSession layoutAttributesForItemAtIndexPath:](self, "layoutAttributesForItemAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    -[PUOverOneUpPresentationSession activitySharingController](self, "activitySharingController");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      v18 = *MEMORY[0x1E0C9D648];
      v19 = *(double *)(MEMORY[0x1E0C9D648] + 8);
      v20 = *(double *)(MEMORY[0x1E0C9D648] + 16);
      v21 = *(double *)(MEMORY[0x1E0C9D648] + 24);
      -[PUActivitySharingController carouselViewController](self->_activitySharingController, "carouselViewController");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "frameForBadgeOfKind:forItemFrame:atIndexPath:", v6, v7, v10, v12, v14, v16);

    }
    else
    {
      -[PUOverOneUpPresentationSession _avalancheReviewController](self, "_avalancheReviewController");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "selectionBadgeFrameForItemFrame:atIndexPath:", v7, v10, v12, v14, v16);
      v25 = v24;
      v27 = v26;
      v20 = v28;
      v21 = v29;

      v18 = v10 + v25;
      v19 = v12 + v27;
    }
    objc_msgSend(MEMORY[0x1E0DC3628], "layoutAttributesForSupplementaryViewOfKind:withIndexPath:", v6, v7);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v30, "setFrame:", v18, v19, v20, v21);
    objc_msgSend(v30, "setZIndex:", 1);
    objc_msgSend(v30, "setAlpha:", 0.0);
  }
  else
  {
    v30 = 0;
  }

  return v30;
}

- (int64_t)_globalIndexForIndexPath:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  int64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;

  v4 = a3;
  if (v4)
  {
    -[PUOverOneUpPresentationSession _assetsDataSource](self, "_assetsDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0CB36B0]);
    v7 = objc_msgSend(v5, "numberOfSubItemsAtIndexPath:", v6);
    v8 = objc_msgSend(v4, "section");
    v9 = objc_msgSend(v4, "item");
    if (v8 >= v7)
    {
      v10 = 0x7FFFFFFFFFFFFFFFLL;
    }
    else
    {
      v10 = v9;
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 >= objc_msgSend(v5, "numberOfSubItemsAtIndexPath:", v11))
      {
        v10 = 0x7FFFFFFFFFFFFFFFLL;
      }
      else if (v8 >= 1)
      {
        v12 = 0;
        v13 = v11;
        do
        {
          objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v12);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          v10 += objc_msgSend(v5, "numberOfSubItemsAtIndexPath:", v11);
          ++v12;
          v13 = v11;
        }
        while (v8 != v12);
      }

    }
  }
  else
  {
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v10;
}

- (id)_indexPathForGlobalIndex:(int64_t)a3
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL || -[PUOverOneUpPresentationSession _numberOfItems](self, "_numberOfItems") <= a3)
  {
    v13 = 0;
  }
  else
  {
    -[PUOverOneUpPresentationSession _assetsDataSource](self, "_assetsDataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(MEMORY[0x1E0CB36B0]);
    v7 = objc_msgSend(v5, "numberOfSubItemsAtIndexPath:", v6);
    if (v7)
    {
      v8 = v7;
      v9 = 0;
      v10 = 0;
      while (1)
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v9);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v5, "numberOfSubItemsAtIndexPath:", v11) + v10;
        if (v12 > a3)
          break;

        ++v9;
        v10 = v12;
        if (v8 == v9)
          goto LABEL_7;
      }
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", a3 - v10, v9);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
LABEL_7:
      v13 = 0;
    }

  }
  return v13;
}

- (int64_t)_numberOfItems
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t i;
  void *v8;

  -[PUOverOneUpPresentationSession _assetsDataSource](self, "_assetsDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc_init(MEMORY[0x1E0CB36B0]);
  v4 = objc_msgSend(v2, "numberOfSubItemsAtIndexPath:", v3);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", i);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 += objc_msgSend(v2, "numberOfSubItemsAtIndexPath:", v8);

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)_globalIndexForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUOverOneUpPresentationSession _assetsDataSource](self, "_assetsDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetReferenceForAssetReference:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4
    || (objc_msgSend(v6, "indexPath"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = -[PUOverOneUpPresentationSession _globalIndexForIndexPath:](self, "_globalIndexForIndexPath:", v7),
        v7,
        v8 == 0x7FFFFFFFFFFFFFFFLL))
  {
    PXAssertGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138412290;
      v12 = v4;
      _os_log_error_impl(&dword_1AAB61000, v9, OS_LOG_TYPE_ERROR, "global index not found for assetReference %@", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v8;
}

- (id)_assetReferenceAtGlobalIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v10;
  int64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  -[PUOverOneUpPresentationSession _indexPathForGlobalIndex:](self, "_indexPathForGlobalIndex:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[PUOverOneUpPresentationSession _assetsDataSource](self, "_assetsDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "assetReferenceAtIndexPath:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    PXAssertGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v10 = 134217984;
      v11 = a3;
      _os_log_error_impl(&dword_1AAB61000, v8, OS_LOG_TYPE_ERROR, "globalIndex %li out of bounds", (uint8_t *)&v10, 0xCu);
    }

    v7 = 0;
  }

  return v7;
}

- (void)ppt_presentShareSheetWithCompletion:(id)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  id aBlock;

  aBlock = a3;
  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "px_descriptionForAssertionMessage");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 1227, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.viewController"), v11, v12);

    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = _Block_copy(aBlock);
    v7 = (void *)pptAfterPresentationCompletion;
    pptAfterPresentationCompletion = (uint64_t)v6;

    objc_msgSend(v5, "ppt_actionsController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "performShareAction");

  }
}

- (id)ppt_activityViewController
{
  void *v2;
  void *v3;

  -[PUOverOneUpPresentationSession activitySharingController](self, "activitySharingController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "activityViewControllerIfAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)ppt_shareUsingActivityOfType:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  -[PUOverOneUpPresentationSession activitySharingController](self, "activitySharingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityViewControllerIfAvailable");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_descriptionForAssertionMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 1239, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.activitySharingController.activityViewControllerIfAvailable"), v9, v10);

    }
  }
  objc_msgSend(v11, "ppt_performActivityOfType:", v5);

}

- (void)ppt_cancelActivity
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  -[PUOverOneUpPresentationSession activitySharingController](self, "activitySharingController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "activityViewControllerIfAvailable");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_descriptionForAssertionMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 1248, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.activitySharingController.activityViewControllerIfAvailable"), v7, v8);

    }
  }
  objc_msgSend(v9, "ppt_cancelActivity");

}

- (void)ppt_dismissShareSheetWithCompletion:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a3;
  -[PUOverOneUpPresentationSession activitySharingController](self, "activitySharingController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "activityViewControllerIfAvailable");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "px_descriptionForAssertionMessage");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 1253, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.activitySharingController.activityViewControllerIfAvailable"), v9, v10);

    }
  }
  -[PUOverOneUpPresentationSession _dismissActivityViewController:animated:completionHandler:](self, "_dismissActivityViewController:animated:completionHandler:", v11, 1, v5);

}

- (void)ppt_presentPhotoEditor
{
  void *v4;
  void *v5;
  objc_class *v6;
  void *v7;
  void *v8;
  id v9;

  -[PUOverOneUpPresentationSession viewController](self, "viewController");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = (objc_class *)objc_opt_class();
      NSStringFromClass(v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "px_descriptionForAssertionMessage");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUOverOneUpPresentationSession.m"), 1258, CFSTR("%@ should be nil or an instance inheriting from %@, but it is %@"), CFSTR("self.viewController"), v7, v8);

    }
  }
  objc_msgSend(v9, "ppt_actionsController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "performSimpleActionWithActionType:", 15);

}

- (PUOverOneUpPresentationSessionDelegate)delegate
{
  return (PUOverOneUpPresentationSessionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (PUOverOneUpPresentationSessionBarsDelegate)barsDelegate
{
  return (PUOverOneUpPresentationSessionBarsDelegate *)objc_loadWeakRetained((id *)&self->_barsDelegate);
}

- (PUAvalancheReviewController)_avalancheReviewController
{
  return self->__avalancheReviewController;
}

- (void)_setAvalancheReviewController:(id)a3
{
  objc_storeStrong((id *)&self->__avalancheReviewController, a3);
}

- (PUSlideshowViewController)_slideshowViewController
{
  return self->__slideshowViewController;
}

- (void)_setSlideshowViewController:(id)a3
{
  objc_storeStrong((id *)&self->__slideshowViewController, a3);
}

- (PUPhotoEditViewController)_editViewController
{
  return self->__editViewController;
}

- (void)_setEditViewController:(id)a3
{
  objc_storeStrong((id *)&self->__editViewController, a3);
}

- (PUPhotoMarkupViewController)_photoMarkupViewController
{
  return self->__photoMarkupViewController;
}

- (void)_setPhotoMarkupViewController:(id)a3
{
  objc_storeStrong((id *)&self->__photoMarkupViewController, a3);
}

- (PUFunEffectsViewController)_funEffectsViewController
{
  return self->__funEffectsViewController;
}

- (void)_setFunEffectsViewController:(id)a3
{
  objc_storeStrong((id *)&self->__funEffectsViewController, a3);
}

- (PUAssetReference)_stashedAssetReference
{
  return self->__stashedAssetReference;
}

- (void)_setStashedAssetReference:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSHashTable)_presentedViewControllers
{
  return self->__presentedViewControllers;
}

- (void)_setPresentedViewControllers:(id)a3
{
  objc_storeStrong((id *)&self->__presentedViewControllers, a3);
}

- (BOOL)_needsUpdatePresentedViewControllers
{
  return self->__needsUpdatePresentedViewControllers;
}

- (void)_setNeedsUpdatePresentedViewControllers:(BOOL)a3
{
  self->__needsUpdatePresentedViewControllers = a3;
}

- (PUActivitySharingController)activitySharingController
{
  return self->_activitySharingController;
}

- (void)setActivitySharingController:(id)a3
{
  objc_storeStrong((id *)&self->_activitySharingController, a3);
}

- (PXActivitySharingControllerDelegate)activitySharingControllerDelegate
{
  return (PXActivitySharingControllerDelegate *)objc_loadWeakRetained((id *)&self->_activitySharingControllerDelegate);
}

- (void)setActivitySharingControllerDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_activitySharingControllerDelegate, a3);
}

- (PUOneUpActivitySharingActionPerformer)sharingActionPerformer
{
  return self->_sharingActionPerformer;
}

- (void)setSharingActionPerformer:(id)a3
{
  objc_storeStrong((id *)&self->_sharingActionPerformer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharingActionPerformer, 0);
  objc_destroyWeak((id *)&self->_activitySharingControllerDelegate);
  objc_storeStrong((id *)&self->_activitySharingController, 0);
  objc_storeStrong((id *)&self->__presentedViewControllers, 0);
  objc_storeStrong((id *)&self->__stashedAssetReference, 0);
  objc_storeStrong((id *)&self->__funEffectsViewController, 0);
  objc_storeStrong((id *)&self->__photoMarkupViewController, 0);
  objc_storeStrong((id *)&self->__editViewController, 0);
  objc_storeStrong((id *)&self->__slideshowViewController, 0);
  objc_storeStrong((id *)&self->__avalancheReviewController, 0);
  objc_destroyWeak((id *)&self->_barsDelegate);
  objc_destroyWeak((id *)&self->_delegate);
}

void __97__PUOverOneUpPresentationSession__activitySharingController_didCompleteWithActivityType_success___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  id v9;
  id v10;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "activityViewControllerIfAvailable");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __97__PUOverOneUpPresentationSession__activitySharingController_didCompleteWithActivityType_success___block_invoke_2;
  v6[3] = &unk_1E58A9AE0;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v7 = v4;
  v8 = v5;
  v9 = *(id *)(a1 + 56);
  v10 = *(id *)(a1 + 64);
  objc_msgSend(v2, "dismissViewController:animated:completionHandler:", v3, 1, v6);

}

void __97__PUOverOneUpPresentationSession__activitySharingController_didCompleteWithActivityType_success___block_invoke_2(uint64_t a1)
{
  id v2;

  if (!*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "sharingActionPerformer");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "performActionWithActivityType:assetsByAssetCollection:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));

  }
}

uint64_t __96__PUOverOneUpPresentationSession__prepareForActivitySharingControllerDismiss_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __80__PUOverOneUpPresentationSession_avalancheReviewControllerDidComplete_animated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finalizeAvalancheReviewControllerDismiss");
}

uint64_t __90__PUOverOneUpPresentationSession_avalancheReviewControllerDidComplete_withAsset_animated___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  _QWORD v5[5];

  v2 = *(void **)(a1 + 32);
  v1 = *(_QWORD *)(a1 + 40);
  v3 = *(unsigned __int8 *)(a1 + 48);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __90__PUOverOneUpPresentationSession_avalancheReviewControllerDidComplete_withAsset_animated___block_invoke_2;
  v5[3] = &unk_1E58ABD10;
  v5[4] = v2;
  return objc_msgSend(v2, "dismissViewController:animated:completionHandler:", v1, v3, v5);
}

uint64_t __90__PUOverOneUpPresentationSession_avalancheReviewControllerDidComplete_withAsset_animated___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_finalizeAvalancheReviewControllerDismiss");
}

uint64_t __80__PUOverOneUpPresentationSession_photoMarkupController_didFinishWithSavedAsset___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewController:animated:completionHandler:", *(_QWORD *)(a1 + 40), 1, 0);
}

void __124__PUOverOneUpPresentationSession_editController_didFinishPreparingForTransitionAfterEditingVideo_modificationDate_seekTime___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  void *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  PLOneUpGetLog();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 138412546;
    v9 = v7;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_1AAB61000, v6, OS_LOG_TYPE_DEFAULT, "Performing dismiss Edit with success: %@, error: %@", (uint8_t *)&v8, 0x16u);

  }
  objc_msgSend(*(id *)(a1 + 32), "dismissViewController:animated:completionHandler:", *(_QWORD *)(a1 + 40), 1, 0);

}

uint64_t __98__PUOverOneUpPresentationSession_editController_didFinishPreparingForTransitionAfterEditingPhoto___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewController:animated:completionHandler:", *(_QWORD *)(a1 + 40), 1, 0);
}

uint64_t __85__PUOverOneUpPresentationSession_slideshowViewControllerDidFinish_withVisibleAssets___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dismissViewController:animated:completionHandler:", *(_QWORD *)(a1 + 40), 1, 0);
}

uint64_t __95__PUOverOneUpPresentationSession__dismissAvalancheReviewController_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_finalizeAvalancheReviewControllerDismiss");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

uint64_t __92__PUOverOneUpPresentationSession__dismissActivityViewController_animated_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "activitySharingControllerDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "activitySharingController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setDelegate:", v2);

  objc_msgSend(*(id *)(a1 + 32), "setActivitySharingControllerDelegate:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setActivitySharingController:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __83__PUOverOneUpPresentationSession_dismissViewController_animated_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v2;
  id WeakRetained;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_finishOverOneUpPresentationSessionDismissForced:animated:", 0, 0);

}

@end
