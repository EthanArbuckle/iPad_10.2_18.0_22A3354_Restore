@implementation SBFloatingDockRootViewController

- (SBFloatingDockRootViewController)initWithHomeScreenContextProvider:(id)a3 applicationController:(id)a4 recentsController:(id)a5 recentsDataStore:(id)a6 appSuggestionManager:(id)a7 layoutStateTransitionCoordinator:(id)a8 iconViewProvider:(id)a9 analyticsClient:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  SBFloatingDockRootViewController *v20;
  SBFloatingDockRootViewController *v21;
  id v23;
  id v24;
  id v25;
  id v26;
  objc_super v27;

  v16 = a3;
  v26 = a4;
  v25 = a5;
  v24 = a6;
  v23 = a7;
  v17 = a8;
  v18 = a9;
  v19 = a10;
  v27.receiver = self;
  v27.super_class = (Class)SBFloatingDockRootViewController;
  v20 = -[SBFloatingDockRootViewController initWithNibName:bundle:](&v27, sel_initWithNibName_bundle_, 0, 0);
  v21 = v20;
  if (v20)
  {
    objc_storeWeak((id *)&v20->_homeScreenContextProvider, v16);
    objc_storeStrong((id *)&v21->_applicationController, a4);
    objc_storeStrong((id *)&v21->_appSuggestionManager, a7);
    v21->_presentedProgress = 1.0;
    objc_storeStrong((id *)&v21->_recentsController, a5);
    objc_storeStrong((id *)&v21->_recentsDataStore, a6);
    objc_storeWeak((id *)&v21->_layoutStateTransitionCoordinator, v17);
    objc_storeWeak((id *)&v21->_iconViewProvider, v18);
    objc_storeStrong((id *)&v21->_analyticsClient, a10);
  }

  return v21;
}

- (void)dealloc
{
  BSInvalidatable *displayLayoutAssertion;
  BSInvalidatable *v4;
  objc_super v5;

  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (displayLayoutAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutAssertion, "invalidate");
    v4 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;

  }
  v5.receiver = self;
  v5.super_class = (Class)SBFloatingDockRootViewController;
  -[SBFloatingDockRootViewController dealloc](&v5, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  SBFloatingDockSuggestionsModel *v8;
  SBRecentDisplayItemsController *recentsController;
  SBRecentDisplayItemsDataStore *recentsDataStore;
  void *v11;
  void *v12;
  SBFloatingDockSuggestionsModel *v13;
  void *v14;
  SBFloatingDockSuggestionsViewController *v15;
  id WeakRetained;
  SBFloatingDockSuggestionsViewController *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  void *v32;
  _QWORD v33[4];
  id v34;
  id v35;
  id location;
  objc_super v37;

  v37.receiver = self;
  v37.super_class = (Class)SBFloatingDockRootViewController;
  -[SBFloatingDockRootViewController viewDidLoad](&v37, sel_viewDidLoad);
  -[SBFloatingDockRootViewController homeScreenContextProvider](self, "homeScreenContextProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockRootViewController applicationController](self, "applicationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockRootViewController iconViewProvider](self, "iconViewProvider");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingDockDefaults");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(MEMORY[0x1E0DAA438], "extendedFloatingDockCapacityIconCount");
  v8 = [SBFloatingDockSuggestionsModel alloc];
  recentsController = self->_recentsController;
  recentsDataStore = self->_recentsDataStore;
  +[SBDefaults localDefaults](SBDefaults, "localDefaults");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recentDisplayItemsDefaults");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = -[SBFloatingDockSuggestionsModel initWithMaximumNumberOfSuggestions:homeScreenContextProvider:recentsController:recentsDataStore:recentsDefaults:floatingDockDefaults:appSuggestionManager:applicationController:](v8, "initWithMaximumNumberOfSuggestions:homeScreenContextProvider:recentsController:recentsDataStore:recentsDefaults:floatingDockDefaults:appSuggestionManager:applicationController:", v7, v3, recentsController, recentsDataStore, v12, v6, self->_appSuggestionManager, v4);

  -[SBFloatingDockRootViewController requestedSuggestedApplication](self, "requestedSuggestedApplication");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockSuggestionsModel setRequestedSuggestedApplication:](v13, "setRequestedSuggestedApplication:", v14);

  -[SBFloatingDockRootViewController setSuggestionsModel:](self, "setSuggestionsModel:", v13);
  v15 = [SBFloatingDockSuggestionsViewController alloc];
  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
  v17 = -[SBFloatingDockSuggestionsViewController initWithNumberOfRecents:homeScreenContextProvider:applicationController:layoutStateTransitionCoordinator:suggestionsModel:iconViewProvider:](v15, "initWithNumberOfRecents:homeScreenContextProvider:applicationController:layoutStateTransitionCoordinator:suggestionsModel:iconViewProvider:", v7, v3, v4, WeakRetained, v13, v32);

  v18 = objc_alloc(MEMORY[0x1E0DAA3A8]);
  objc_msgSend(v3, "iconManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v18, "initWithIconManager:iconViewProvider:", v19, v32);

  objc_msgSend(v20, "setDelegate:", self);
  objc_msgSend(v20, "setSuggestionsViewController:", v17);
  -[SBFloatingDockRootViewController legibilitySettings](self, "legibilitySettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setLegibilitySettings:", v21);

  if (SBFEffectiveHomeButtonType() == 2)
  {
    objc_msgSend(MEMORY[0x1E0D47488], "sharedInstance");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "height");
    v24 = v23;
    objc_msgSend(v22, "edgeSpacing");
    objc_msgSend(v20, "setRequestedVerticalMargin:", v24 + v25 * 2.0);

  }
  -[SBFloatingDockRootViewController bs_addChildViewController:](self, "bs_addChildViewController:", v20);
  -[SBFloatingDockRootViewController setFloatingDockViewController:](self, "setFloatingDockViewController:", v20);
  -[SBFloatingDockRootViewController setLibraryPodIconEnabled:](self, "setLibraryPodIconEnabled:", objc_msgSend(v6, "appLibraryEnabled"));
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "appLibraryEnabled");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = MEMORY[0x1E0C80D38];
  v28 = MEMORY[0x1E0C80D38];
  v33[0] = MEMORY[0x1E0C809B0];
  v33[1] = 3221225472;
  v33[2] = __47__SBFloatingDockRootViewController_viewDidLoad__block_invoke;
  v33[3] = &unk_1E8E9F280;
  objc_copyWeak(&v35, &location);
  v29 = v6;
  v34 = v29;
  v30 = (id)objc_msgSend(v29, "observeDefault:onQueue:withBlock:", v26, v27, v33);

  v31 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEA7F8]), "initWithTarget:action:", self, sel__handlePanGestureRecognizer_);
  objc_msgSend(v31, "setDelegate:", self);
  objc_msgSend(v20, "_addDockGestureRecognizer:", v31);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

}

void __47__SBFloatingDockRootViewController_viewDidLoad__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setLibraryPodIconEnabled:", objc_msgSend(*(id *)(a1 + 32), "appLibraryEnabled"));

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFloatingDockRootViewController;
  -[SBFloatingDockRootViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[SBFloatingDockRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "bounds");
  objc_msgSend(v5, "setBounds:");
  objc_msgSend(v3, "center");
  objc_msgSend(v5, "setCenter:");
  -[SBFloatingDockRootViewController _layoutFloatingDockPresentationProgress:](self, "_layoutFloatingDockPresentationProgress:", self->_presentedProgress);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFloatingDockRootViewController;
  -[SBFloatingDockRootViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  if (!self->_hasInitializedDockVisibility)
  {
    self->_hasInitializedDockVisibility = 1;
    if (-[SBFloatingDockRootViewController isFloatingDockFullyPresented](self, "isFloatingDockFullyPresented"))
    {
      -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "dockViewWillBecomeVisible");
      objc_msgSend(v4, "dockViewDidBecomeVisible");

    }
  }
}

- (void)getRotationContentSettings:(id *)a3 forWindow:(id)a4
{
  if (a3)
    a3->var6 = 0;
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      *(_BYTE *)&self->_delegateRespondsTo &= ~1u;
    objc_storeWeak((id *)&self->_delegate, obj);
    if (obj)
      *(_BYTE *)&self->_delegateRespondsTo = *(_BYTE *)&self->_delegateRespondsTo & 0xFE | objc_opt_respondsToSelector() & 1;
  }

}

- (BOOL)isFloatingDockPresented
{
  return self->_presentedProgress > 0.0;
}

- (BOOL)isFloatingDockFullyPresented
{
  return self->_presentedProgress >= 1.0;
}

- (BOOL)isLibraryPodIconEnabled
{
  void *v2;
  char v3;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLibraryPodIconEnabled");

  return v3;
}

- (void)setLibraryPodIconEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setLibraryPodIconEnabled:", v3);

}

- (double)maximumFloatingDockHeight
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumContentHeight");
  v4 = v3;

  return v4;
}

- (double)maximumDockContinuousCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumDockContinuousCornerRadius");
  v4 = v3;

  return v4;
}

- (double)floatingDockHeight
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentHeight");
  v4 = v3;

  return v4;
}

- (double)floatingDockHeightForFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  void *v7;
  double v8;
  double v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentHeightForFrame:", x, y, width, height);
  v9 = v8;

  return v9;
}

- (double)effectiveFloatingDockHeight
{
  double result;

  if (!-[SBFloatingDockRootViewController isFloatingDockPresented](self, "isFloatingDockPresented"))
    return 0.0;
  -[SBFloatingDockRootViewController floatingDockHeight](self, "floatingDockHeight");
  return result;
}

- (double)preferredVerticalMargin
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "preferredVerticalMargin");
  v4 = v3;

  return v4;
}

- (double)floatingDockViewTopMargin
{
  void *v3;
  void *v4;
  double v5;
  double v6;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockRootViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  objc_msgSend(v3, "minimumVerticalMarginForFrame:");
  v6 = v5;

  return v6;
}

- (double)translationFromFullyPresentedFrame
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "translationFromFullyPresentedFrame");
  v4 = v3;

  return v4;
}

- (_UILegibilitySettings)legibilitySettings
{
  void *v3;
  void *legibilitySettings;
  void *v5;
  _UILegibilitySettings *v6;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "legibilitySettings");
  legibilitySettings = (void *)objc_claimAutoreleasedReturnValue();
  v5 = legibilitySettings;
  if (!legibilitySettings)
    legibilitySettings = self->_legibilitySettings;
  v6 = legibilitySettings;

  return v6;
}

- (void)setLegibilitySettings:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqual:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLegibilitySettings:", v6);

  }
}

- (BOOL)isPresentingFolder
{
  void *v2;
  char v3;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresentingFolder");

  return v3;
}

- (SBFolderController)presentedFolderController
{
  void *v2;
  void *v3;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFolderController *)v3;
}

- (void)layoutUserControlledIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutUserControlledIconListsWithAnimationType:forceRelayout:", a3, v4);

}

- (double)presentedProgress
{
  return self->_presentedProgress;
}

- (SBIconListView)userIconListView
{
  void *v2;
  void *v3;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userIconListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconListView *)v3;
}

- (SBIconListView)suggestionsIconListView
{
  void *v2;
  void *v3;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recentIconListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBIconListView *)v3;
}

- (void)setRequestedSuggestedApplication:(id)a3
{
  void *v5;
  SBApplication *v6;

  v6 = (SBApplication *)a3;
  if (self->_requestedSuggestedApplication != v6)
  {
    objc_storeStrong((id *)&self->_requestedSuggestedApplication, a3);
    -[SBFloatingDockRootViewController suggestionsModel](self, "suggestionsModel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setRequestedSuggestedApplication:", v6);

  }
}

- (CGRect)floatingDockScreenFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingDockScreenFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)floatingDockScreenPresentationFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "floatingDockScreenPresentationFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)setPresentationProgressInteractively:(double)a3 withCompletion:(id)a4
{
  -[SBFloatingDockRootViewController setPresentationProgress:interactive:withCompletion:](self, "setPresentationProgress:interactive:withCompletion:", 1, a4, a3);
}

- (void)setPresentationProgress:(double)a3 interactive:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v5 = a4;
  v8 = a5;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__SBFloatingDockRootViewController_setPresentationProgress_interactive_withCompletion___block_invoke;
  v10[3] = &unk_1E8E9F1C0;
  v11 = v8;
  v9 = v8;
  -[SBFloatingDockRootViewController _setPresentedProgress:animated:interactive:completion:](self, "_setPresentedProgress:animated:interactive:completion:", 1, v5, v10, a3);

}

uint64_t __87__SBFloatingDockRootViewController_setPresentationProgress_interactive_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setPresentationProgress:(double)a3 animated:(BOOL)a4 interactive:(BOOL)a5 withCompletion:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v6 = a5;
  v7 = a4;
  v10 = a6;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __96__SBFloatingDockRootViewController_setPresentationProgress_animated_interactive_withCompletion___block_invoke;
  v12[3] = &unk_1E8E9F1C0;
  v13 = v10;
  v11 = v10;
  -[SBFloatingDockRootViewController _setPresentedProgress:animated:interactive:completion:](self, "_setPresentedProgress:animated:interactive:completion:", v7, v6, v12, a3);

}

uint64_t __96__SBFloatingDockRootViewController_setPresentationProgress_animated_interactive_withCompletion___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)setPresentationProgressInteractively:(double)a3
{
  -[SBFloatingDockRootViewController setPresentationProgress:interactive:](self, "setPresentationProgress:interactive:", 1, a3);
}

- (void)setPresentationProgress:(double)a3 interactive:(BOOL)a4
{
  -[SBFloatingDockRootViewController setPresentationProgress:interactive:withCompletion:](self, "setPresentationProgress:interactive:withCompletion:", a4, 0, a3);
}

- (void)setPresentationProgress:(double)a3 animated:(BOOL)a4 interactive:(BOOL)a5
{
  -[SBFloatingDockRootViewController _setPresentedProgress:animated:interactive:completion:](self, "_setPresentedProgress:animated:interactive:completion:", a4, a5, 0, a3);
}

- (void)presentFolderForIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  id v13;

  v6 = a5;
  v10 = a6;
  v11 = a4;
  v12 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "presentFolderForIcon:location:animated:completion:", v12, v11, v6, v10);

}

- (void)dismissPresentedFolderAnimated:(BOOL)a3 withTransitionContext:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v8 = a5;
  -[SBFloatingDockRootViewController setCurrentTransitionContext:](self, "setCurrentTransitionContext:", a4);
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __100__SBFloatingDockRootViewController_dismissPresentedFolderAnimated_withTransitionContext_completion___block_invoke;
  v11[3] = &unk_1E8E9F230;
  v11[4] = self;
  v12 = v8;
  v10 = v8;
  objc_msgSend(v9, "dismissPresentedFolderAnimated:completion:", v6, v11);

}

uint64_t __100__SBFloatingDockRootViewController_dismissPresentedFolderAnimated_withTransitionContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentTransitionContext:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (void)dismissPresentedLibraryAnimated:(BOOL)a3 withTransitionContext:(id)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  _QWORD v11[5];
  id v12;

  v6 = a3;
  v8 = a4;
  v9 = a5;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v10, "isPresentingLibrary"))
  {
    -[SBFloatingDockRootViewController setCurrentTransitionContext:](self, "setCurrentTransitionContext:", v8);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __101__SBFloatingDockRootViewController_dismissPresentedLibraryAnimated_withTransitionContext_completion___block_invoke;
    v11[3] = &unk_1E8E9F230;
    v11[4] = self;
    v12 = v9;
    objc_msgSend(v10, "dismissLibraryAnimated:completion:", v6, v11);

  }
  else if (v9)
  {
    (*((void (**)(id, uint64_t))v9 + 2))(v9, 1);
  }

}

uint64_t __101__SBFloatingDockRootViewController_dismissPresentedLibraryAnimated_withTransitionContext_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentTransitionContext:", 0);
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, a2);
  return result;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDisplayingIcon:", v4);

  return v6;
}

- (void)prepareForTransitionToEnvironmentMode:(int64_t)a3 fromDockVisible:(BOOL)a4 toDockVisible:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  void *v9;
  void *v10;
  _BOOL8 v11;
  id v12;

  v5 = a5;
  v6 = a4;
  -[SBFloatingDockRootViewController setUseDismissHitTestPadding:](self, "setUseDismissHitTestPadding:", a3 == 3);
  -[SBFloatingDockRootViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setNeedsLayout");

  objc_msgSend(MEMORY[0x1E0DAA460], "configurationWithEnvironmentMode:", a3);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (unint64_t)(a3 - 4) < 0xFFFFFFFFFFFFFFFELL;
  objc_msgSend(v10, "setWantsFastIconReordering:", v11);
  objc_msgSend(v10, "setShouldIndicateImpossibleDrop:", v11);
  objc_msgSend(v10, "prepareForTransitionToStyleConfiguration:fromDockVisible:toDockVisible:", v12, v6, v5);

}

- (void)cleanupAfterTransitionToEnvironmentMode:(int64_t)a3
{
  id v3;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cleanUpAfterUnderlyingBackgroundStyleTransition");

}

- (void)_setDisplayLayoutElementActive:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;

  v3 = a3;
  -[SBFloatingDockRootViewController view](self, "view");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "level");
  -[SBFloatingDockRootViewController _setDisplayLayoutElementActive:windowLevel:](self, "_setDisplayLayoutElementActive:windowLevel:", v3);

}

- (void)_setDisplayLayoutElementActive:(BOOL)a3 windowLevel:(double)a4
{
  BSInvalidatable *displayLayoutAssertion;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BSInvalidatable *v12;
  BSInvalidatable *v13;
  BSInvalidatable *v14;
  void *v15;

  displayLayoutAssertion = self->_displayLayoutAssertion;
  if (a3)
  {
    if (!displayLayoutAssertion)
    {
      v7 = objc_alloc(MEMORY[0x1E0DAAE30]);
      v15 = (void *)objc_msgSend(v7, "initWithIdentifier:", *MEMORY[0x1E0DAB660]);
      objc_msgSend(v15, "setLevel:", (uint64_t)a4);
      objc_msgSend(v15, "setLayoutRole:", 4);
      -[SBFloatingDockRootViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "window");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFloatingDockRootViewController _calculateStandardDockFrame](self, "_calculateStandardDockFrame");
      objc_msgSend(v8, "convertRect:toView:", 0);
      objc_msgSend(v9, "_convertRectToSceneReferenceSpace:");
      objc_msgSend(v15, "setReferenceFrame:");
      -[UIViewController _sbWindowScene](self, "_sbWindowScene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "displayLayoutPublisher");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addElement:", v15);
      v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      v13 = self->_displayLayoutAssertion;
      self->_displayLayoutAssertion = v12;

    }
  }
  else if (displayLayoutAssertion)
  {
    -[BSInvalidatable invalidate](displayLayoutAssertion, "invalidate", a4);
    v14 = self->_displayLayoutAssertion;
    self->_displayLayoutAssertion = 0;

  }
}

- (void)updateDisplayLayoutElementWindowLevel:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  id v8;

  -[SBFloatingDockRootViewController displayLayoutAssertion](self, "displayLayoutAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[UIViewController _sbWindowScene](self, "_sbWindowScene");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayLayoutPublisher");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transitionAssertionWithReason:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue();

    -[SBFloatingDockRootViewController _setDisplayLayoutElementActive:windowLevel:](self, "_setDisplayLayoutElementActive:windowLevel:", 0, a3);
    -[SBFloatingDockRootViewController _setDisplayLayoutElementActive:windowLevel:](self, "_setDisplayLayoutElementActive:windowLevel:", 1, a3);
    objc_msgSend(v8, "invalidate");

  }
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconViewForIcon:location:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstIconViewForIcon:inLocations:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)firstIconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstIconViewForIcon:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstIconViewForIcon:excludingLocations:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDisplayingIcon:inLocation:", v7, v6);

  return v9;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  BOOL v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        if (-[SBFloatingDockRootViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
        {
          v12 = 1;
          goto LABEL_11;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isDisplayingIconView:", v4);

  return v6;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isDisplayingIconView:inLocation:", v7, v6);

  return v9;
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "enumerateDisplayedIconViewsUsingBlock:", v4);

}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "enumerateDisplayedIconViewsForIcon:usingBlock:", v7, v6);

}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isPresentingIconLocation:", v4);

  return v6;
}

- (NSSet)presentedIconLocations
{
  void *v2;
  void *v3;

  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedIconLocations");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (void)_layoutFloatingDockPresentationProgress:(double)a3
{
  void *v5;
  id v6;

  if (-[SBFloatingDockRootViewController useDismissHitTestPadding](self, "useDismissHitTestPadding"))
  {
    +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "dismissHitTestTopPadding");

  }
  UIEdgeInsetsMakeWithEdges();
  -[SBFloatingDockViewController _setPaddingEdgeInsets:](self->_floatingDockViewController, "_setPaddingEdgeInsets:");
  -[SBFloatingDockViewController setDockOffscreenProgress:](self->_floatingDockViewController, "setDockOffscreenProgress:", 1.0 - a3);
  -[SBFloatingDockRootViewController delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockRootViewController floatingDockScreenFrame](self, "floatingDockScreenFrame");
  objc_msgSend(v6, "floatingDockRootViewController:didChangeToFrame:", self);

}

- (void)_setPresentedProgress:(double)a3 animated:(BOOL)a4 interactive:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  _BOOL8 v7;
  void (**v10)(id, uint64_t);
  int v11;
  _BOOL4 v12;
  _BOOL4 v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  int v35;
  void *v36;
  int v37;
  void *v38;
  _QWORD v39[6];
  _QWORD v40[5];
  void (**v41)(id, uint64_t);
  double v42;
  double v43;
  _QWORD v44[4];
  id v45;
  SBFloatingDockRootViewController *v46;
  double v47;
  double v48;
  BOOL v49;

  v6 = a5;
  v7 = a4;
  v10 = (void (**)(id, uint64_t))a6;
  if ((BSFloatEqualToFloat() & 1) != 0)
    goto LABEL_32;
  v11 = BSFloatGreaterThanFloat();
  v12 = -[SBFloatingDockRootViewController isFloatingDockPresented](self, "isFloatingDockPresented");
  v13 = v12;
  if (v11)
  {
    if (!v12)
    {
      -[SBFloatingDockRootViewController loadViewIfNeeded](self, "loadViewIfNeeded");
      -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "dockViewWillBecomeVisible");

      -[SBFloatingDockRootViewController _beginPresentationTransition](self, "_beginPresentationTransition");
      -[SBFloatingDockRootViewController _setDisplayLayoutElementActive:](self, "_setDisplayLayoutElementActive:", 1);
    }
    v15 = !v13;
    if (!BSFloatGreaterThanFloat())
      goto LABEL_10;
    -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_sbWindowScene");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "switcherController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = objc_msgSend(v19, "isPresentingFolder");

    if ((_DWORD)v17)
    {
      -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dismissPresentedFolderAnimated:completion:", v7, 0);
    }
    else if (v6
           && (-[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController"),
               v34 = (void *)objc_claimAutoreleasedReturnValue(),
               v35 = objc_msgSend(v34, "isPresentingLibraryInForeground"),
               v34,
               v35))
    {
      -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "dismissLibraryAnimated:completion:", v7, 0);
    }
    else
    {
      if (objc_msgSend(v18, "unlockedEnvironmentMode") == 3)
        goto LABEL_9;
      -[SBFloatingDockRootViewController homeScreenContextProvider](self, "homeScreenContextProvider");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "iconManager");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = objc_msgSend(v36, "hasOpenFolder");

      if (v37)
      {
        objc_msgSend(v20, "iconManager");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "popExpandedIconAnimated:completionHandler:", v7, 0);

      }
    }

LABEL_9:
LABEL_10:
    v21 = 0;
    goto LABEL_14;
  }
  if (v12)
  {
    -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "dockViewWillResignVisible");

    -[SBFloatingDockRootViewController _beginPresentationTransition](self, "_beginPresentationTransition");
    -[SBFloatingDockRootViewController _setDisplayLayoutElementActive:](self, "_setDisplayLayoutElementActive:", 0);
    v15 = 0;
    v21 = 1;
  }
  else
  {
    v21 = 0;
    v15 = 0;
  }
LABEL_14:
  self->_presentedProgress = a3;
  v23 = fmin(fmax(a3, 0.0), 1.0);
  -[SBFloatingDockRootViewController viewIfLoaded](self, "viewIfLoaded");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v24)
    goto LABEL_19;
  -[SBFloatingDockRootViewController delegate](self, "delegate");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockRootViewController floatingDockHeight](self, "floatingDockHeight");
  v27 = v26 * a3;
  if (!v7)
  {
    objc_msgSend(v25, "floatingDockRootViewController:willChangeToHeight:interactive:", self, v6, v26 * a3);
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __90__SBFloatingDockRootViewController__setPresentedProgress_animated_interactive_completion___block_invoke_3;
    v39[3] = &unk_1E8E9DE88;
    v39[4] = self;
    *(double *)&v39[5] = a3;
    objc_msgSend(MEMORY[0x1E0CEABB0], "_performWithoutRetargetingAnimations:", v39);

LABEL_19:
    if (v10)
      v10[2](v10, 1);
    if (v15)
    {
      -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dockViewDidBecomeVisible");
    }
    else
    {
      if (!v21 || !BSFloatIsZero())
        goto LABEL_32;
      -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "dockViewDidResignVisible");
    }

    -[SBFloatingDockRootViewController _endPresentationTransition](self, "_endPresentationTransition");
    goto LABEL_32;
  }
  +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[SBFloatingDockRootViewController isPresentingFolder](self, "isPresentingFolder"))
    objc_msgSend(v28, "dockWithPresentedFolderAnimationSettings");
  else
    objc_msgSend(v28, "dockAnimationSettings");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  ++self->_floatingDockPresentationAnimationCount;
  v31 = (void *)MEMORY[0x1E0CEABB0];
  if (v6)
    v32 = 5;
  else
    v32 = 3;
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __90__SBFloatingDockRootViewController__setPresentedProgress_animated_interactive_completion___block_invoke;
  v44[3] = &unk_1E8EB76F8;
  v45 = v25;
  v46 = self;
  v49 = v6;
  v47 = v27;
  v48 = a3;
  v40[0] = MEMORY[0x1E0C809B0];
  v40[1] = 3221225472;
  v40[2] = __90__SBFloatingDockRootViewController__setPresentedProgress_animated_interactive_completion___block_invoke_2;
  v40[3] = &unk_1E8EB7720;
  v40[4] = self;
  v42 = a3;
  v41 = v10;
  v43 = v23;
  v33 = v25;
  objc_msgSend(v31, "sb_animateWithSettings:mode:animations:completion:", v30, v32, v44, v40);

LABEL_32:
}

uint64_t __90__SBFloatingDockRootViewController__setPresentedProgress_animated_interactive_completion___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "floatingDockRootViewController:willChangeToHeight:interactive:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 64), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 40), "_layoutFloatingDockPresentationProgress:", *(double *)(a1 + 56));
}

uint64_t __90__SBFloatingDockRootViewController__setPresentedProgress_animated_interactive_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  void *v6;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 1120);
  if (v3 && (*(_QWORD *)(v2 + 1120) = v3 - 1, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1120)))
    v4 = 0;
  else
    v4 = BSFloatEqualToFloat();
  result = *(_QWORD *)(a1 + 40);
  if (result)
    result = (*(uint64_t (**)(uint64_t, uint64_t))(result + 16))(result, v4);
  if ((_DWORD)v4)
  {
    if (BSFloatIsOne())
    {
      objc_msgSend(*(id *)(a1 + 32), "floatingDockViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dockViewDidBecomeVisible");
    }
    else
    {
      if (!BSFloatIsZero())
        return objc_msgSend(*(id *)(a1 + 32), "_endPresentationTransition");
      objc_msgSend(*(id *)(a1 + 32), "floatingDockViewController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "dockViewDidResignVisible");
    }

    return objc_msgSend(*(id *)(a1 + 32), "_endPresentationTransition");
  }
  return result;
}

uint64_t __90__SBFloatingDockRootViewController__setPresentedProgress_animated_interactive_completion___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layoutFloatingDockPresentationProgress:", *(double *)(a1 + 40));
}

- (void)_beginPresentationTransition
{
  void *v3;
  void *v4;
  char isKindOfClass;
  id v6;

  if (!-[SBFloatingDockRootViewController isTransitioningPresentation](self, "isTransitioningPresentation"))
  {
    -[SBFloatingDockRootViewController setTransitioningPresentation:](self, "setTransitioningPresentation:", 1);
    if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleFloatingDock")) & 1) == 0)
    {
      -[SBFloatingDockRootViewController view](self, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "window");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      objc_opt_self();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v6, "disableInterfaceOrientationChangesForReason:", CFSTR("floating-dock"));

    }
  }
}

- (void)_endPresentationTransition
{
  void *v3;
  void *v4;
  void *v5;
  char isKindOfClass;
  id v7;

  if (-[SBFloatingDockRootViewController isTransitioningPresentation](self, "isTransitioningPresentation"))
  {
    -[SBFloatingDockRootViewController setTransitioningPresentation:](self, "setTransitioningPresentation:", 0);
    if ((SBTraitsArbiterOrientationActuationEnabledForRole(CFSTR("SBTraitsParticipantRoleFloatingDock")) & 1) == 0)
    {
      -[SBFloatingDockRootViewController view](self, "view");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "window");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_self();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
        objc_msgSend(v4, "enableInterfaceOrientationChangesForReason:", CFSTR("floating-dock"));

    }
    -[SBFloatingDockRootViewController delegate](self, "delegate");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "floatingDockRootViewControllerDidEndPresentationTransition:", self);

  }
}

- (CGRect)_calculateStandardDockFrame
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  CGFloat v14;
  double x;
  double y;
  double width;
  double height;
  CGRect v19;
  CGRect slice;
  CGRect v21;
  CGRect result;

  -[SBFloatingDockRootViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  memset(&slice, 0, sizeof(slice));
  -[SBFloatingDockRootViewController floatingDockViewController](self, "floatingDockViewController", 0, 0, 0, 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "contentHeightForFrame:", v5, v7, v9, v11);
  v14 = ceil(v13);
  v21.origin.x = v5;
  v21.origin.y = v7;
  v21.size.width = v9;
  v21.size.height = v11;
  CGRectDivide(v21, &slice, &v19, v14, CGRectMaxYEdge);

  x = slice.origin.x;
  y = slice.origin.y;
  width = slice.size.width;
  height = slice.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)_handlePanGestureRecognizer:(id)a3
{
  id v4;
  id WeakRetained;
  int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  SBFAnalyticsClient *v13;
  void *v14;
  void **v15;
  uint64_t *v16;
  SBFAnalyticsClient *analyticsClient;
  void *v18;
  void *v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if ((*(_BYTE *)&self->_delegateRespondsTo & 1) == 0
    || (WeakRetained = objc_loadWeakRetained((id *)&self->_delegate),
        v6 = objc_msgSend(WeakRetained, "floatingDockRootViewControllerShouldHandlePanGestureRecognizer:", self),
        WeakRetained,
        v6))
  {
    -[SBFloatingDockRootViewController view](self, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "translationInView:", v7);
    objc_msgSend(v4, "velocityInView:", v7);
    v9 = v8;
    -[SBFloatingDockRootViewController _floatingDockViewTranslation](self, "_floatingDockViewTranslation");
    v21 = *MEMORY[0x1E0D013B0];
    v22 = *(_OWORD *)(MEMORY[0x1E0D013B0] + 16);
    BSUIConstrainValueToIntervalWithRubberBand();
    v11 = v10;
    -[SBFloatingDockRootViewController delegate](self, "delegate", v21, v22);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    switch(objc_msgSend(v4, "state"))
    {
      case 1:
        analyticsClient = self->_analyticsClient;
        v29 = *MEMORY[0x1E0DABD68];
        v30[0] = &unk_1E91D15F8;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, &v29, 1);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFAnalyticsClient emitEvent:withPayload:](analyticsClient, "emitEvent:withPayload:", 26, v18);

        goto LABEL_6;
      case 2:
LABEL_6:
        objc_msgSend(v12, "floatingDockRootViewController:modifyProgress:interactive:completion:", self, 1, 0, v11);
        break;
      case 3:
        if (v11 >= 0.25 && v9 <= 10.0)
        {
          objc_msgSend(v12, "floatingDockRootViewController:modifyProgress:interactive:completion:", self, 0, 0, 1.0);
          v13 = self->_analyticsClient;
          v25 = *MEMORY[0x1E0DABD68];
          v26 = &unk_1E91D1628;
          v14 = (void *)MEMORY[0x1E0C99D80];
          v15 = &v26;
          v16 = &v25;
        }
        else
        {
          objc_msgSend(v12, "floatingDockRootViewController:modifyProgress:interactive:completion:", self, 0, 0, 0.0);
          v13 = self->_analyticsClient;
          v27 = *MEMORY[0x1E0DABD68];
          v28 = &unk_1E91D1610;
          v14 = (void *)MEMORY[0x1E0C99D80];
          v15 = &v28;
          v16 = &v27;
        }
        goto LABEL_13;
      case 4:
      case 5:
        objc_msgSend(v12, "floatingDockRootViewController:modifyProgress:interactive:completion:", self, 0, 0, 1.0);
        v13 = self->_analyticsClient;
        v23 = *MEMORY[0x1E0DABD68];
        v24 = &unk_1E91D1628;
        v14 = (void *)MEMORY[0x1E0C99D80];
        v15 = &v24;
        v16 = &v23;
LABEL_13:
        objc_msgSend(v14, "dictionaryWithObjects:forKeys:count:", v15, v16, 1);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBFAnalyticsClient emitEvent:withPayload:](v13, "emitEvent:withPayload:", 26, v20);

        break;
      default:
        break;
    }

  }
}

- (double)_floatingDockViewTranslationForHeight:(double)a3
{
  double v4;

  -[SBFloatingDockRootViewController floatingDockViewTopMargin](self, "floatingDockViewTopMargin");
  return v4 + a3;
}

- (double)_floatingDockViewTranslation
{
  double result;

  -[SBFloatingDockRootViewController floatingDockHeight](self, "floatingDockHeight");
  -[SBFloatingDockRootViewController _floatingDockViewTranslationForHeight:](self, "_floatingDockViewTranslationForHeight:");
  return result;
}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  SBFloatingDockRootViewController *v4;
  id WeakRetained;

  if ((*(_BYTE *)&self->_delegateRespondsTo & 1) == 0)
    return 1;
  v4 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  LOBYTE(v4) = objc_msgSend(WeakRetained, "floatingDockRootViewControllerShouldHandlePanGestureRecognizer:", v4);

  return (char)v4;
}

- (BOOL)gestureRecognizer:(id)a3 shouldRecognizeSimultaneouslyWithGestureRecognizer:(id)a4
{
  id v4;
  char isKindOfClass;

  v4 = a3;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (void)floatingDockViewController:(id)a3 wantsToBePresented:(BOOL)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a4;
  -[SBFloatingDockRootViewController delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatingDockRootViewController:floatingDockWantsToBePresented:", self, v4);

}

- (void)floatingDockViewController:(id)a3 didChangeContentHeight:(double)a4
{
  id v6;

  if (-[SBFloatingDockRootViewController isFloatingDockPresented](self, "isFloatingDockPresented", a3))
  {
    -[SBFloatingDockRootViewController delegate](self, "delegate");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "floatingDockRootViewController:willChangeToHeight:interactive:", self, 0, a4);

  }
}

- (void)floatingDockViewController:(id)a3 didChangeContentFrame:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[SBFloatingDockRootViewController delegate](self, "delegate", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "floatingDockRootViewController:didChangeToFrame:", self, x, y, width, height);

}

- (void)floatingDockViewController:(id)a3 willPerformTransitionWithFolder:(id)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6
{
  _BOOL8 v7;
  id v9;
  void *v10;
  id v11;

  v7 = a5;
  v11 = a4;
  v9 = a6;
  -[SBFloatingDockRootViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v10, "floatingDockRootViewController:willPerformTransitionWithFolder:presenting:withTransitionCoordinator:", self, v11, v7, v9);

}

- (void)floatingDockViewController:(id)a3 willUseAnimator:(id)a4 forTransitioningWithFolder:(id)a5 presenting:(BOOL)a6
{
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  v8 = v15;
  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v15, "iconAnimator");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_self();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_opt_isKindOfClass();

    if ((v11 & 1) != 0)
    {
      v12 = v9;
      +[SBMedusaDomain rootSettings](SBMedusaDomain, "rootSettings");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "dockWithPresentedFolderAnimationSettings");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setDockAnimationSettings:", v14);

    }
    v8 = v15;
  }

}

- (double)minimumHomeScreenScaleForFloatingDockViewController:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBFloatingDockRootViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0.0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "minimumHomeScreenScaleForFloatingDockRootViewController:", self);
    v5 = v6;
  }

  return v5;
}

- (BOOL)isFloatingDockViewControllerPresentedOverTransitioningAppToAppContent:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  unsigned int v8;
  BOOL v9;

  -[SBFloatingDockRootViewController currentTransitionContext](self, "currentTransitionContext", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unlockedEnvironmentMode");
  objc_msgSend(v3, "layoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unlockedEnvironmentMode");
  v8 = (v7 == 3) & ~objc_msgSend(v6, "isEqual:", v4);
  if (v5 == 3)
    v9 = v8;
  else
    v9 = 0;

  return v9;
}

- (BOOL)isFloatingDockViewControllerPresentedOverApplication:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "_sbWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "switcherController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v3) = objc_msgSend(v4, "unlockedEnvironmentMode") == 3;
  return (char)v3;
}

- (BOOL)isFloatingDockViewControllerPresentedOverTransitioningSwitcherContent:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  BOOL v8;

  -[SBFloatingDockRootViewController currentTransitionContext](self, "currentTransitionContext", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "previousLayoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unlockedEnvironmentMode");
  objc_msgSend(v3, "layoutState");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unlockedEnvironmentMode");
  v8 = v5 == 2 && v7 == 2 || v5 == 2 && v7 == 3;

  return v8;
}

- (BOOL)isFloatingDockViewControllerPresentedOnExternalDisplay:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;

  objc_msgSend(a3, "_sbWindowScene");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  return v8 != 0;
}

- (id)libraryContainerViewControllerForFloatingDockViewController:(id)a3
{
  void *v4;
  void *v5;

  -[SBFloatingDockRootViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "libraryContainerViewControllerForFloatingDockRootViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)isDefaultLibraryContainerViewControllerForegroundForFloatingDockViewController:(id)a3
{
  void *v4;
  char v5;

  -[SBFloatingDockRootViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = objc_msgSend(v4, "isDefaultLibraryContainerViewControllerForegroundForFloatingDockRootViewController:", self);
  else
    v5 = 1;

  return v5;
}

- (id)foregroundLibraryContainerViewControllerForFloatingDockViewController:(id)a3
{
  void *v4;
  void *v5;

  -[SBFloatingDockRootViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "foregroundLibraryContainerViewControllerForFloatingDockRootViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)floatingDockViewController:(id)a3 acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBFloatingDockRootViewController delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "floatingDockRootViewController:acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (SBFloatingDockSuggestionsModel)suggestionsModel
{
  return self->_suggestionsModel;
}

- (void)setSuggestionsModel:(id)a3
{
  objc_storeStrong((id *)&self->_suggestionsModel, a3);
}

- (SBFloatingDockRootViewControllerDelegate)delegate
{
  return (SBFloatingDockRootViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (SBApplication)requestedSuggestedApplication
{
  return self->_requestedSuggestedApplication;
}

- (BOOL)isTransitioningPresentation
{
  return self->_transitioningPresentation;
}

- (void)setTransitioningPresentation:(BOOL)a3
{
  self->_transitioningPresentation = a3;
}

- (SBFloatingDockViewController)floatingDockViewController
{
  return self->_floatingDockViewController;
}

- (void)setFloatingDockViewController:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDockViewController, a3);
}

- (SBFloatingDockHomeScreenContextProviding)homeScreenContextProvider
{
  return (SBFloatingDockHomeScreenContextProviding *)objc_loadWeakRetained((id *)&self->_homeScreenContextProvider);
}

- (SBApplicationController)applicationController
{
  return self->_applicationController;
}

- (SBAppSuggestionManager)appSuggestionManager
{
  return self->_appSuggestionManager;
}

- (SBLayoutStateTransitionCoordinator)layoutStateTransitionCoordinator
{
  return (SBLayoutStateTransitionCoordinator *)objc_loadWeakRetained((id *)&self->_layoutStateTransitionCoordinator);
}

- (void)setLayoutStateTransitionCoordinator:(id)a3
{
  objc_storeWeak((id *)&self->_layoutStateTransitionCoordinator, a3);
}

- (SBRecentDisplayItemsController)recentsController
{
  return self->_recentsController;
}

- (void)setRecentsController:(id)a3
{
  objc_storeStrong((id *)&self->_recentsController, a3);
}

- (SBRecentDisplayItemsDataStore)recentsDataStore
{
  return self->_recentsDataStore;
}

- (void)setRecentsDataStore:(id)a3
{
  objc_storeStrong((id *)&self->_recentsDataStore, a3);
}

- (BOOL)useDismissHitTestPadding
{
  return self->_useDismissHitTestPadding;
}

- (void)setUseDismissHitTestPadding:(BOOL)a3
{
  self->_useDismissHitTestPadding = a3;
}

- (SBFAnalyticsClient)analyticsClient
{
  return self->_analyticsClient;
}

- (void)setAnalyticsClient:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsClient, a3);
}

- (SBWorkspaceApplicationSceneTransitionContext)currentTransitionContext
{
  return self->_currentTransitionContext;
}

- (void)setCurrentTransitionContext:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransitionContext, a3);
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (BSInvalidatable)displayLayoutAssertion
{
  return self->_displayLayoutAssertion;
}

- (void)setDisplayLayoutAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_displayLayoutAssertion, a3);
}

- (unint64_t)floatingDockPresentationAnimationCount
{
  return self->_floatingDockPresentationAnimationCount;
}

- (void)setFloatingDockPresentationAnimationCount:(unint64_t)a3
{
  self->_floatingDockPresentationAnimationCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_displayLayoutAssertion, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_currentTransitionContext, 0);
  objc_storeStrong((id *)&self->_analyticsClient, 0);
  objc_storeStrong((id *)&self->_recentsDataStore, 0);
  objc_storeStrong((id *)&self->_recentsController, 0);
  objc_destroyWeak((id *)&self->_layoutStateTransitionCoordinator);
  objc_storeStrong((id *)&self->_appSuggestionManager, 0);
  objc_storeStrong((id *)&self->_applicationController, 0);
  objc_destroyWeak((id *)&self->_homeScreenContextProvider);
  objc_storeStrong((id *)&self->_floatingDockViewController, 0);
  objc_storeStrong((id *)&self->_requestedSuggestedApplication, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_suggestionsModel, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
}

@end
