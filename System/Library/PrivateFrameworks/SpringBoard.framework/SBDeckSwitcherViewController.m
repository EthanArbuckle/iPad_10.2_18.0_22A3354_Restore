@implementation SBDeckSwitcherViewController

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id WeakRetained;
  SBSwitcherAppSuggestionViewController *appSuggestionController;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  objc_super v20;

  v6 = a4;
  v20.receiver = self;
  v20.super_class = (Class)SBDeckSwitcherViewController;
  -[SBFluidSwitcherViewController layoutStateTransitionCoordinator:transitionDidBeginWithTransitionContext:](&v20, sel_layoutStateTransitionCoordinator_transitionDidBeginWithTransitionContext_, a3, v6);
  objc_msgSend(v6, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fromLayoutState");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "unlockedEnvironmentMode");
  WeakRetained = objc_loadWeakRetained((id *)&self->_appSuggestionManager);
  appSuggestionController = self->_appSuggestionController;
  if (v9 == 2)
  {
    if (appSuggestionController)
    {
      -[SBSwitcherAppSuggestionViewController parentViewController](appSuggestionController, "parentViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v12)
      {
        -[SBDeckSwitcherViewController addChildViewController:](self, "addChildViewController:", self->_appSuggestionController);
        -[SBDeckSwitcherViewController view](self, "view");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBSwitcherAppSuggestionViewController view](self->_appSuggestionController, "view");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addSubview:", v14);

        -[SBSwitcherAppSuggestionViewController didMoveToParentViewController:](self->_appSuggestionController, "didMoveToParentViewController:", self);
      }
    }
    if (!-[SBFluidSwitcherViewController _shouldInterruptPresentationAndDismiss](self, "_shouldInterruptPresentationAndDismiss"))
    {
      -[SBDeckSwitcherViewController _assertionReason](self, "_assertionReason");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "enableListeningForUpdatesForReason:", v15);

      -[SBSwitcherAppSuggestionViewController setShowSuggestions:](self->_appSuggestionController, "setShowSuggestions:", 1);
    }
  }
  else
  {
    -[SBSwitcherAppSuggestionViewController setShowSuggestions:](appSuggestionController, "setShowSuggestions:", 0);
    -[SBDeckSwitcherViewController _assertionReason](self, "_assertionReason");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "disableListeningForUpdatesForReason:", v16);

  }
  if (objc_msgSend(v7, "unlockedEnvironmentMode") == 3 && objc_msgSend(v8, "unlockedEnvironmentMode") == 2)
  {
    objc_msgSend(v6, "applicationTransitionContext");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "request");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "source");

    if (v19 == 10)
      -[SBSwitcherAppSuggestionViewController beginPausingSuggestionUpdatesForReason:](self->_appSuggestionController, "beginPausingSuggestionUpdatesForReason:", CFSTR("ContinuityTransition"));
  }

}

- (void)performTransitionWithContext:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  _QWORD v12[5];
  objc_super v13;

  v6 = a4;
  v8 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBDeckSwitcherViewController;
  -[SBFluidSwitcherViewController performTransitionWithContext:animated:completion:](&v13, sel_performTransitionWithContext_animated_completion_, v8, v6, a5);
  if (!v6)
  {
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __81__SBDeckSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke;
    v12[3] = &unk_1E8E9DED8;
    v12[4] = self;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v12);
  }
  objc_msgSend(v8, "layoutState");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "unlockedEnvironmentMode") != 2)
  {
    -[SBSwitcherAppSuggestionViewController setShowSuggestions:](self->_appSuggestionController, "setShowSuggestions:", 0);
    WeakRetained = objc_loadWeakRetained((id *)&self->_appSuggestionManager);
    -[SBDeckSwitcherViewController _assertionReason](self, "_assertionReason");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "disableListeningForUpdatesForReason:", v11);

  }
}

- (id)_assertionReason
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@-%p"), v5, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setBestAppSuggestion:(id)a3
{
  -[SBSwitcherAppSuggestionViewController setBestAppSuggestion:](self->_appSuggestionController, "setBestAppSuggestion:", a3);
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBDeckSwitcherViewController;
  -[SBFluidSwitcherViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  -[SBSwitcherAppSuggestionViewController view](self->_appSuggestionController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBDeckSwitcherViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "setFrame:");

}

- (id)bestAppSuggestion
{
  return -[SBSwitcherAppSuggestionViewController bestAppSuggestion](self->_appSuggestionController, "bestAppSuggestion");
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  id v6;
  void *v7;
  id WeakRetained;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  uint64_t v18;
  id v19;
  _QWORD v20[4];
  id v21;
  SBDeckSwitcherViewController *v22;
  _QWORD v23[4];
  id v24;
  objc_super v25;

  v6 = a4;
  v25.receiver = self;
  v25.super_class = (Class)SBDeckSwitcherViewController;
  -[SBFluidSwitcherViewController layoutStateTransitionCoordinator:transitionDidEndWithTransitionContext:](&v25, sel_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext_, a3, v6);
  objc_msgSend(v6, "toLayoutState");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "unlockedEnvironmentMode") == 2)
  {
    if (!-[SBFluidSwitcherViewController _shouldInterruptPresentationAndDismiss](self, "_shouldInterruptPresentationAndDismiss")&& !-[SBSwitcherAppSuggestionViewController showSuggestions](self->_appSuggestionController, "showSuggestions"))
    {
      WeakRetained = objc_loadWeakRetained((id *)&self->_appSuggestionManager);
      -[SBDeckSwitcherViewController _assertionReason](self, "_assertionReason");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(WeakRetained, "enableListeningForUpdatesForReason:", v9);

      -[SBSwitcherAppSuggestionViewController setShowSuggestions:](self->_appSuggestionController, "setShowSuggestions:", 1);
    }
  }
  else
  {
    -[SBSwitcherAppSuggestionViewController parentViewController](self->_appSuggestionController, "parentViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
    {
      objc_msgSend(v6, "applicationTransitionContext");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "request");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "source");

      -[SBSwitcherAppSuggestionViewController view](self->_appSuggestionController, "view");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "layer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setAllowsGroupOpacity:", 1);

      v16 = (void *)MEMORY[0x1E0CEABB0];
      if (v13 == 10)
        v17 = 0.35;
      else
        v17 = 0.0;
      v18 = MEMORY[0x1E0C809B0];
      v23[0] = MEMORY[0x1E0C809B0];
      v23[1] = 3221225472;
      v23[2] = __103__SBDeckSwitcherViewController_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke;
      v23[3] = &unk_1E8E9DED8;
      v24 = v14;
      v20[0] = v18;
      v20[1] = 3221225472;
      v20[2] = __103__SBDeckSwitcherViewController_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2;
      v20[3] = &unk_1E8E9DEB0;
      v21 = v24;
      v22 = self;
      v19 = v24;
      objc_msgSend(v16, "animateWithDuration:animations:completion:", v23, v20, v17);

    }
  }
  if ((objc_msgSend(v6, "isInterrupted") & 1) == 0)
    -[SBSwitcherAppSuggestionViewController endPausingSuggestionUpdatesForReason:](self->_appSuggestionController, "endPausingSuggestionUpdatesForReason:", CFSTR("ContinuityTransition"));

}

void __81__SBDeckSwitcherViewController_performTransitionWithContext_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2064), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "setFrame:");

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 2064), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

}

- (int64_t)orientationForSuggestionViewController:(id)a3
{
  void *v4;
  int64_t v5;

  -[SBFluidSwitcherViewController dataSource](self, "dataSource", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "switcherInterfaceOrientationForSwitcherContentController:", self);

  return v5;
}

- (SBDeckSwitcherViewController)initWithRootModifier:(id)a3 liveContentOverlayCoordinator:(id)a4 dataSource:(id)a5 delegate:(id)a6 debugName:(id)a7
{
  SBDeckSwitcherViewController *v7;
  SBSwitcherAppSuggestionViewController *v8;
  SBSwitcherAppSuggestionViewController *appSuggestionController;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)SBDeckSwitcherViewController;
  v7 = -[SBFluidSwitcherViewController initWithRootModifier:liveContentOverlayCoordinator:dataSource:delegate:debugName:](&v12, sel_initWithRootModifier_liveContentOverlayCoordinator_dataSource_delegate_debugName_, a3, a4, a5, a6, a7);
  if (v7)
  {
    v8 = -[SBSwitcherAppSuggestionViewController initWithNibName:bundle:]([SBSwitcherAppSuggestionViewController alloc], "initWithNibName:bundle:", 0, 0);
    appSuggestionController = v7->_appSuggestionController;
    v7->_appSuggestionController = v8;

    -[SBSwitcherAppSuggestionViewController setDelegate:](v7->_appSuggestionController, "setDelegate:", v7);
    +[SBAppSuggestionManager sharedInstance](SBAppSuggestionManager, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v7->_appSuggestionManager, v10);

  }
  return v7;
}

- (void)invalidate
{
  id WeakRetained;
  void *v4;
  objc_super v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_appSuggestionManager);
  -[SBDeckSwitcherViewController _assertionReason](self, "_assertionReason");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "disableListeningForUpdatesForReason:", v4);

  v5.receiver = self;
  v5.super_class = (Class)SBDeckSwitcherViewController;
  -[SBFluidSwitcherViewController invalidate](&v5, sel_invalidate);
}

uint64_t __103__SBDeckSwitcherViewController_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __103__SBDeckSwitcherViewController_layoutStateTransitionCoordinator_transitionDidEndWithTransitionContext___block_invoke_2(uint64_t a1)
{
  void *v2;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  objc_msgSend(*(id *)(a1 + 32), "layer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAllowsGroupOpacity:", 0);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 2064), "willMoveToParentViewController:", 0);
  objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 2064), "removeFromParentViewController");
}

- (void)handleFluidSwitcherGestureManager:(id)a3 didBeginGesture:(id)a4
{
  SBSwitcherAppSuggestionViewController *appSuggestionController;
  id v7;
  id v8;
  id WeakRetained;
  void *v10;
  objc_super v11;

  appSuggestionController = self->_appSuggestionController;
  v7 = a4;
  v8 = a3;
  -[SBSwitcherAppSuggestionViewController setShowSuggestions:](appSuggestionController, "setShowSuggestions:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_appSuggestionManager);
  -[SBDeckSwitcherViewController _assertionReason](self, "_assertionReason");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "disableListeningForUpdatesForReason:", v10);

  v11.receiver = self;
  v11.super_class = (Class)SBDeckSwitcherViewController;
  -[SBFluidSwitcherViewController handleFluidSwitcherGestureManager:didBeginGesture:](&v11, sel_handleFluidSwitcherGestureManager_didBeginGesture_, v8, v7);

}

- (void)_setBestAppSuggestion:(id)a3 animationCompletion:(id)a4
{
  -[SBSwitcherAppSuggestionViewController _setBestAppSuggestion:animationCompletion:](self->_appSuggestionController, "_setBestAppSuggestion:animationCompletion:", a3, a4);
}

- (void)suggestionViewController:(id)a3 activatedSuggestion:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  -[SBFluidSwitcherViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v5, "switcherContentController:activatedBestAppSuggestion:", self, v6);

}

- (SBSwitcherAppSuggestionViewController)appSuggestionController
{
  return self->_appSuggestionController;
}

- (void)setAppSuggestionController:(id)a3
{
  objc_storeStrong((id *)&self->_appSuggestionController, a3);
}

- (SBAppSuggestionManager)appSuggestionManager
{
  return (SBAppSuggestionManager *)objc_loadWeakRetained((id *)&self->_appSuggestionManager);
}

- (void)setAppSuggestionManager:(id)a3
{
  objc_storeWeak((id *)&self->_appSuggestionManager, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_appSuggestionManager);
  objc_storeStrong((id *)&self->_appSuggestionController, 0);
}

@end
