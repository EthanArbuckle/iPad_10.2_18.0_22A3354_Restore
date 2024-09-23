@implementation SBModalLibraryController

- (SBModalLibraryController)initWithIconManager:(id)a3 libraryViewController:(id)a4 floatingDockController:(id)a5 windowScene:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  SBModalLibraryController *v15;
  SBModalLibraryController *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  SBHModalLibraryPresenter *libraryPresenter;
  void *v21;
  void *v22;
  uint64_t v23;
  UIApplicationSceneDeactivationAssertion *resignActiveAssertion;
  objc_super v26;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v26.receiver = self;
  v26.super_class = (Class)SBModalLibraryController;
  v15 = -[SBModalLibraryController init](&v26, sel_init);
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_iconManager, a3);
    objc_storeStrong((id *)&v16->_libraryViewController, a4);
    objc_msgSend(v12, "addObserver:", v16);
    objc_storeWeak((id *)&v16->_floatingDockController, v13);
    objc_storeWeak((id *)&v16->_windowScene, v14);
    objc_msgSend(v14, "layoutStateTransitionCoordinator");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addObserver:", v16);

    objc_msgSend(v13, "floatingDockViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "configureForPresentingLibraryViewController:", v12);
    v19 = objc_claimAutoreleasedReturnValue();
    libraryPresenter = v16->_libraryPresenter;
    v16->_libraryPresenter = (SBHModalLibraryPresenter *)v19;

    -[SBHModalLibraryPresenter setPresentationDelegate:](v16->_libraryPresenter, "setPresentationDelegate:", v16);
    -[SBHModalLibraryPresenter addObserver:](v16->_libraryPresenter, "addObserver:", v16);
    +[SBSceneManagerCoordinator sharedInstance](SBSceneManagerCoordinator, "sharedInstance");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "sceneDeactivationManager");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "newAssertionWithReason:", 18);
    resignActiveAssertion = v16->_resignActiveAssertion;
    v16->_resignActiveAssertion = (UIApplicationSceneDeactivationAssertion *)v23;

  }
  return v16;
}

- (void)dealloc
{
  void *v4;
  objc_super v5;

  if (!-[SBModalLibraryController isInvalidated](self, "isInvalidated"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v5.receiver = self;
  v5.super_class = (Class)SBModalLibraryController;
  -[SBModalLibraryController dealloc](&v5, sel_dealloc);
}

- (void)invalidate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  if (!-[SBModalLibraryController isInvalidated](self, "isInvalidated"))
  {
    -[SBModalLibraryController setInvalidated:](self, "setInvalidated:", 1);
    -[SBModalLibraryController libraryViewController](self, "libraryViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "invalidate");

    -[SBModalLibraryController libraryViewController](self, "libraryViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:", self);

    -[SBModalLibraryController windowScene](self, "windowScene");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutStateTransitionCoordinator");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObserver:", self);

    -[SBModalLibraryController libraryDisplayLayoutElementAssertion](self, "libraryDisplayLayoutElementAssertion");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "invalidate");

    -[SBModalLibraryController floatingDockBehaviorAssertion](self, "floatingDockBehaviorAssertion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "invalidate");

    -[SBModalLibraryController resignActiveAssertion](self, "resignActiveAssertion");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "relinquish");

    -[SBModalLibraryController libraryWindowKeyboardFocusAssertion](self, "libraryWindowKeyboardFocusAssertion");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

  }
}

- (BOOL)isPresentingLibraryInForeground
{
  void *v2;
  char v3;
  char v4;

  -[SBModalLibraryController libraryPresenter](self, "libraryPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresentingLibrary");
  v4 = v3 & objc_msgSend(v2, "isLibraryContainedInForeground");

  return v4;
}

- (BOOL)isPresentingLibrary
{
  void *v2;
  char v3;

  -[SBModalLibraryController libraryPresenter](self, "libraryPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresentingLibrary");

  return v3;
}

- (void)presentLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SBModalLibraryController libraryPresenter](self, "libraryPresenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentLibraryWithAnimation:completion:", v4, v6);

}

- (void)dismissLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SBModalLibraryController libraryPresenter](self, "libraryPresenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dismissLibraryWithAnimation:completion:", v4, v6);

}

- (void)toggleLibraryPresentedAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SBModalLibraryController libraryPresenter](self, "libraryPresenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toggleLibraryPresentedInForegroundWithAnimation:completion:", v4, v6);

}

- (void)presentLibraryCategoryPodForCategoryIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  SBModalLibraryController *v14;
  id v15;
  BOOL v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __95__SBModalLibraryController_presentLibraryCategoryPodForCategoryIdentifier_animated_completion___block_invoke;
  v12[3] = &unk_1E8EA0470;
  v13 = v8;
  v14 = self;
  v16 = v6;
  v15 = v9;
  v10 = v9;
  v11 = v8;
  -[SBModalLibraryController presentLibraryAnimated:completion:](self, "presentLibraryAnimated:completion:", v6, v12);

}

void __95__SBModalLibraryController_presentLibraryCategoryPodForCategoryIdentifier_animated_completion___block_invoke(uint64_t a1, int a2)
{
  uint64_t v3;
  id v4;

  if (a2)
  {
    if (*(_QWORD *)(a1 + 32))
    {
      objc_msgSend(*(id *)(a1 + 40), "libraryViewController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "presentPodWithCategoryIdentifier:animated:completion:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 56), *(_QWORD *)(a1 + 48));

    }
    else
    {
      v3 = *(_QWORD *)(a1 + 48);
      if (v3)
        (*(void (**)(uint64_t, _QWORD))(v3 + 16))(v3, 0);
    }
  }
}

- (id)coordinatorRequestedIdleTimerBehavior:(id)a3
{
  return +[SBIdleTimerBehavior defaultBehavior](SBIdleTimerBehavior, "defaultBehavior", a3);
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidBeginWithTransitionContext:(id)a4
{
  -[SBModalLibraryController _evaluateKeyboardWindowLevelAssertion](self, "_evaluateKeyboardWindowLevelAssertion", a3, a4);
  -[SBModalLibraryController _evaluateResignActiveAssertion](self, "_evaluateResignActiveAssertion");
  -[SBModalLibraryController _evaluateWindowStatus](self, "_evaluateWindowStatus");
}

- (void)layoutStateTransitionCoordinator:(id)a3 transitionDidEndWithTransitionContext:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(a4, "toLayoutState", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "unlockedEnvironmentMode") == 1
    && -[SBModalLibraryController isPresentingLibrary](self, "isPresentingLibrary"))
  {
    -[SBModalLibraryController libraryPresenter](self, "libraryPresenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setOverrideContainerViewController:", 0);

  }
  -[SBModalLibraryController _evaluateWindowStatus](self, "_evaluateWindowStatus");

}

- (void)libraryViewController:(id)a3 willPresentSearchController:(id)a4
{
  -[SBModalLibraryController setPresentingOrTransitioningSearch:](self, "setPresentingOrTransitioningSearch:", 1, a4);
  -[SBModalLibraryController _evaluateKeyboardWindowLevelAssertion](self, "_evaluateKeyboardWindowLevelAssertion");
}

- (void)libraryViewController:(id)a3 didDismissSearchController:(id)a4
{
  -[SBModalLibraryController setPresentingOrTransitioningSearch:](self, "setPresentingOrTransitioningSearch:", 0, a4);
  -[SBModalLibraryController _evaluateKeyboardWindowLevelAssertion](self, "_evaluateKeyboardWindowLevelAssertion");
}

- (BOOL)modalLibraryPresenterShouldAllowSwipeToDismissGesture:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  -[SBModalLibraryController iconManager](self, "iconManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBModalLibraryController libraryViewController](self, "libraryViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "_shouldLibraryOverlayAllowSwipeToDismissGesture:", v5);

  return v6;
}

- (void)modalLibraryPresenter:(id)a3 willPresentLibrary:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SBModalLibraryController iconManager](self, "iconManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_sbWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "isMainDisplayWindowScene");
  if ((_DWORD)v5)
    objc_msgSend(v7, "setMainDisplayLibraryViewVisible:libraryViewTransitioning:", 1, 1);
  -[SBModalLibraryController _willPerformTransitionWithLibraryToPresented:](self, "_willPerformTransitionWithLibraryToPresented:", 1);

}

- (void)modalLibraryPresenter:(id)a3 didPresentLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v5 = a4;
  -[SBModalLibraryController _didCompleteTransitionWithLibraryToPresented:](self, "_didCompleteTransitionWithLibraryToPresented:", 1);
  objc_msgSend(v5, "_sbWindowScene");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v6, "isMainDisplayWindowScene");
  if ((_DWORD)v5)
  {
    -[SBModalLibraryController iconManager](self, "iconManager");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setMainDisplayLibraryViewVisibilityTransitioning:", 0);
    objc_msgSend(v9, "rootFolderController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA5E0], "focusSystemForEnvironment:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_focusEnvironmentWillDisappear:", v7);

  }
}

- (void)modalLibraryPresenter:(id)a3 willDismissLibrary:(id)a4
{
  void *v5;
  int v6;
  void *v7;
  id v8;

  v8 = a4;
  objc_msgSend(v8, "_sbWindowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMainDisplayWindowScene");

  if (v6)
  {
    -[SBModalLibraryController iconManager](self, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMainDisplayLibraryViewVisibilityTransitioning:", 1);

  }
  -[SBModalLibraryController _prepareLibraryViewControllerForDismissal:](self, "_prepareLibraryViewControllerForDismissal:", v8);
  -[SBModalLibraryController _willPerformTransitionWithLibraryToPresented:](self, "_willPerformTransitionWithLibraryToPresented:", 0);

}

- (void)modalLibraryPresenter:(id)a3 didPassCriticalDismissalPoint:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBModalLibraryController iconManager](self, "iconManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_scrollToLastIconPageIfNecessaryForLibraryOverlayDismissal:", v5);

}

- (void)modalLibraryPresenter:(id)a3 didDismissLibrary:(id)a4
{
  void *v5;
  int v6;
  void *v7;

  objc_msgSend(a4, "_sbWindowScene", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isMainDisplayWindowScene");

  if (v6)
  {
    -[SBModalLibraryController iconManager](self, "iconManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setMainDisplayLibraryViewVisible:libraryViewTransitioning:", 0, 0);

  }
  -[SBModalLibraryController _didCompleteTransitionWithLibraryToPresented:](self, "_didCompleteTransitionWithLibraryToPresented:", 0);
}

- (void)_willPerformTransitionWithLibraryToPresented:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;

  v3 = a3;
  -[SBModalLibraryController floatingDockController](self, "floatingDockController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingDockViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLibraryPodIconVisible:", v3 ^ 1);

  -[SBModalLibraryController _configureFloatingDockBehaviorAssertionForPresented:](self, "_configureFloatingDockBehaviorAssertionForPresented:", v3);
  if (v3)
  {
    -[SBModalLibraryController _evaluateResignActiveAssertion](self, "_evaluateResignActiveAssertion");
    -[SBModalLibraryController _evaluateKeyboardWindowLevelAssertion](self, "_evaluateKeyboardWindowLevelAssertion");
    -[SBModalLibraryController libraryViewController](self, "libraryViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "enumerateDisplayedIconViewsUsingBlock:", &__block_literal_global_281);

  }
  -[SBModalLibraryController _evaluateWindowStatus](self, "_evaluateWindowStatus");
}

uint64_t __73__SBModalLibraryController__willPerformTransitionWithLibraryToPresented___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setDisallowCursorInteraction:", 0);
}

- (void)_didCompleteTransitionWithLibraryToPresented:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v3 = a3;
  -[SBModalLibraryController _setLibraryDisplayLayoutElementActive:](self, "_setLibraryDisplayLayoutElementActive:");
  -[SBModalLibraryController _evaluateKeyboardWindowLevelAssertion](self, "_evaluateKeyboardWindowLevelAssertion");
  -[SBModalLibraryController _evaluateResignActiveAssertion](self, "_evaluateResignActiveAssertion");
  if (v3)
  {
    -[SBModalLibraryController _currentLayoutState](self, "_currentLayoutState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unlockedEnvironmentMode");

    if (v6 == 3)
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      -[SBModalLibraryController coordinatorRequestedIdleTimerBehavior:](self, "coordinatorRequestedIdleTimerBehavior:", v9);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (id)objc_msgSend(v9, "idleTimerProvider:didProposeBehavior:forReason:", self, v7, CFSTR("SBModalLibraryPresentedReason"));

    }
  }
}

- (void)_setLibraryDisplayLayoutElementActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = a3;
  -[SBModalLibraryController libraryDisplayLayoutElementAssertion](self, "libraryDisplayLayoutElementAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !v5)
  {
    v19 = 0;
    v6 = objc_alloc(MEMORY[0x1E0DAAE30]);
    v7 = (void *)objc_msgSend(v6, "initWithIdentifier:", *MEMORY[0x1E0DAB648]);
    objc_msgSend(v7, "setFillsDisplayBounds:", 1);
    objc_msgSend(v7, "setLayoutRole:", 3);
    -[SBModalLibraryController libraryViewController](self, "libraryViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "level");
    v12 = v11;
    v13 = (uint64_t)v11;

    if (*MEMORY[0x1E0CEBE28] + -2.0 >= (double)(uint64_t)v12)
      v14 = 0;
    else
      v14 = v13;
    objc_msgSend(v7, "setLevel:", v14);
    -[SBModalLibraryController libraryViewController](self, "libraryViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_sbWindowScene");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "displayLayoutPublisher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addElement:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBModalLibraryController setLibraryDisplayLayoutElementAssertion:](self, "setLibraryDisplayLayoutElementAssertion:", v18);
    goto LABEL_10;
  }
  if (!v3 && v5)
  {
    v19 = v5;
    objc_msgSend(v5, "invalidate");
    -[SBModalLibraryController setLibraryDisplayLayoutElementAssertion:](self, "setLibraryDisplayLayoutElementAssertion:", 0);
LABEL_10:
    v5 = v19;
  }

}

- (void)_prepareLibraryViewControllerForDismissal:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "enumerateDisplayedIconViewsUsingBlock:", &__block_literal_global_18_4);
  -[SBModalLibraryController iconManager](self, "iconManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dismissIconShareSheets");
  objc_msgSend(MEMORY[0x1E0CEA6C0], "sharedHUDService");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dismissOrCancelHUDPresentationIfNeeded");

}

void __70__SBModalLibraryController__prepareLibraryViewControllerForDismissal___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isShowingContextMenu"))
  {
    objc_msgSend(v4, "dismissContextMenuWithCompletion:", 0);
    *a3 = 1;
  }

}

- (void)_configureFloatingDockBehaviorAssertionForPresented:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  SBFloatingDockBehaviorAssertion *v6;
  void *v7;
  SBFloatingDockBehaviorAssertion *v8;
  id v9;

  v3 = a3;
  -[SBModalLibraryController floatingDockBehaviorAssertion](self, "floatingDockBehaviorAssertion");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && !v5)
  {
    v9 = 0;
    v6 = [SBFloatingDockBehaviorAssertion alloc];
    -[SBModalLibraryController floatingDockController](self, "floatingDockController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBFloatingDockBehaviorAssertion initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:](v6, "initWithFloatingDockController:visibleProgress:animated:gesturePossible:atLevel:reason:withCompletion:", v7, 1, 1, 9, CFSTR("SBModalLibraryPresentedReason"), 0, 0.0);

    -[SBModalLibraryController setFloatingDockBehaviorAssertion:](self, "setFloatingDockBehaviorAssertion:", v8);
LABEL_7:
    v5 = v9;
    goto LABEL_8;
  }
  if (!v3 && v5)
  {
    v9 = v5;
    objc_msgSend(v5, "invalidate");
    -[SBModalLibraryController setFloatingDockBehaviorAssertion:](self, "setFloatingDockBehaviorAssertion:", 0);
    goto LABEL_7;
  }
LABEL_8:

}

- (void)_evaluateKeyboardWindowLevelAssertion
{
  id WeakRetained;
  int v4;
  void *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  void *v16;
  char v17;
  id v18;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  v4 = objc_msgSend(WeakRetained, "isMainDisplayWindowScene");

  if (v4)
  {
    -[SBModalLibraryController _currentLayoutState](self, "_currentLayoutState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "unlockedEnvironmentMode");

    v7 = (v6 & 0xFFFFFFFFFFFFFFFELL) == 2
      && -[SBModalLibraryController isPresentingLibraryInForeground](self, "isPresentingLibraryInForeground")
      && -[SBModalLibraryController isPresentingOrTransitioningSearch](self, "isPresentingOrTransitioningSearch");
    -[SBModalLibraryController keyboardWindowLevelAssertion](self, "keyboardWindowLevelAssertion");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7 || v8)
    {
      if (v8)
        v17 = v7;
      else
        v17 = 1;
      if ((v17 & 1) != 0)
        goto LABEL_16;
      v18 = v8;
      objc_msgSend(v8, "invalidate");
      -[SBModalLibraryController setKeyboardWindowLevelAssertion:](self, "setKeyboardWindowLevelAssertion:", 0);
    }
    else
    {
      v18 = 0;
      -[SBModalLibraryController libraryViewController](self, "libraryViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "_sbWindowScene");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "medusaHostedKeyboardWindowController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBModalLibraryController libraryViewController](self, "libraryViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "view");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "window");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "windowLevel");
      v16 = (void *)objc_msgSend(v11, "newMedusaHostedKeyboardWindowLevelAssertionWithPriority:windowLevel:", 1, v15 + 1.0);

      -[SBModalLibraryController setKeyboardWindowLevelAssertion:](self, "setKeyboardWindowLevelAssertion:", v16);
    }
    v8 = v18;
LABEL_16:

  }
}

- (void)_evaluateResignActiveAssertion
{
  void *v3;
  uint64_t v4;
  _BOOL4 v5;
  _BOOL4 v6;
  void *v7;
  int v8;
  NSObject *v9;
  void *v10;
  id WeakRetained;
  void *v12;
  NSObject *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  -[SBModalLibraryController _currentLayoutState](self, "_currentLayoutState");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "unlockedEnvironmentMode");

  v5 = -[SBModalLibraryController isPresentingLibraryInForeground](self, "isPresentingLibraryInForeground");
  v6 = v4 == 3 && v5;
  -[SBModalLibraryController resignActiveAssertion](self, "resignActiveAssertion");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isAcquired");

  if (!v6 || (v8 & 1) != 0)
  {
    if (((v6 | v8 ^ 1) & 1) != 0)
      return;
    SBLogAppLibrary();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v14 = 0;
      _os_log_impl(&dword_1D0540000, v13, OS_LOG_TYPE_DEFAULT, "[Modal Library Controller] Updating resign active assertion to: Relinquished", v14, 2u);
    }

    -[SBModalLibraryController resignActiveAssertion](self, "resignActiveAssertion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "relinquish");
  }
  else
  {
    SBLogAppLibrary();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D0540000, v9, OS_LOG_TYPE_DEFAULT, "[Modal Library Controller] Updating resign active assertion to: Acquired", buf, 2u);
    }

    -[SBModalLibraryController resignActiveAssertion](self, "resignActiveAssertion");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
    objc_msgSend(WeakRetained, "_fbsDisplayIdentity");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "sb_acquireForDisplayIdentity:", v12);

  }
}

- (void)_evaluateWindowStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  BSInvalidatable *v8;
  BSInvalidatable *libraryWindowKeyboardFocusAssertion;
  BSInvalidatable *v10;
  BSInvalidatable *v11;
  void *v12;

  if (-[SBModalLibraryController isPresentingLibraryInForeground](self, "isPresentingLibraryInForeground"))
  {
    -[SBModalLibraryController libraryViewController](self, "libraryViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "viewIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "window");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!self->_libraryWindowKeyboardFocusAssertion)
    {
      +[SBWorkspace mainWorkspace](SBWorkspace, "mainWorkspace");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "keyboardFocusController");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      +[SBKeyboardFocusLockReason modalAppLibrary](SBKeyboardFocusLockReason, "modalAppLibrary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "focusLockSpringBoardWindow:forReason:", v12, v7);
      v8 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
      libraryWindowKeyboardFocusAssertion = self->_libraryWindowKeyboardFocusAssertion;
      self->_libraryWindowKeyboardFocusAssertion = v8;

    }
    if ((objc_msgSend(v12, "isKeyWindow") & 1) == 0)
      objc_msgSend(v12, "makeKeyWindow");

  }
  else
  {
    v10 = self->_libraryWindowKeyboardFocusAssertion;
    if (v10)
    {
      -[BSInvalidatable invalidate](v10, "invalidate");
      v11 = self->_libraryWindowKeyboardFocusAssertion;
      self->_libraryWindowKeyboardFocusAssertion = 0;

    }
  }
}

- (id)_currentLayoutState
{
  id WeakRetained;
  void *v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_windowScene);
  objc_msgSend(WeakRetained, "layoutStateProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutState");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (SBLibraryViewController)libraryViewController
{
  return self->_libraryViewController;
}

- (SBHIconManager)iconManager
{
  return self->_iconManager;
}

- (SBFloatingDockController)floatingDockController
{
  return (SBFloatingDockController *)objc_loadWeakRetained((id *)&self->_floatingDockController);
}

- (SBWindowScene)windowScene
{
  return (SBWindowScene *)objc_loadWeakRetained((id *)&self->_windowScene);
}

- (SBHModalLibraryPresenter)libraryPresenter
{
  return self->_libraryPresenter;
}

- (UIApplicationSceneDeactivationAssertion)resignActiveAssertion
{
  return self->_resignActiveAssertion;
}

- (SBMedusaHostedKeyboardWindowLevelAssertion)keyboardWindowLevelAssertion
{
  return self->_keyboardWindowLevelAssertion;
}

- (void)setKeyboardWindowLevelAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_keyboardWindowLevelAssertion, a3);
}

- (SBFloatingDockBehaviorAssertion)floatingDockBehaviorAssertion
{
  return self->_floatingDockBehaviorAssertion;
}

- (void)setFloatingDockBehaviorAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertion, a3);
}

- (BSInvalidatable)libraryDisplayLayoutElementAssertion
{
  return self->_libraryDisplayLayoutElementAssertion;
}

- (void)setLibraryDisplayLayoutElementAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_libraryDisplayLayoutElementAssertion, a3);
}

- (BSInvalidatable)libraryWindowKeyboardFocusAssertion
{
  return self->_libraryWindowKeyboardFocusAssertion;
}

- (void)setLibraryWindowKeyboardFocusAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_libraryWindowKeyboardFocusAssertion, a3);
}

- (BOOL)isPresentingOrTransitioningSearch
{
  return self->_presentingOrTransitioningSearch;
}

- (void)setPresentingOrTransitioningSearch:(BOOL)a3
{
  self->_presentingOrTransitioningSearch = a3;
}

- (BOOL)isInvalidated
{
  return self->_invalidated;
}

- (void)setInvalidated:(BOOL)a3
{
  self->_invalidated = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryWindowKeyboardFocusAssertion, 0);
  objc_storeStrong((id *)&self->_libraryDisplayLayoutElementAssertion, 0);
  objc_storeStrong((id *)&self->_floatingDockBehaviorAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardWindowLevelAssertion, 0);
  objc_storeStrong((id *)&self->_resignActiveAssertion, 0);
  objc_storeStrong((id *)&self->_libraryPresenter, 0);
  objc_destroyWeak((id *)&self->_windowScene);
  objc_destroyWeak((id *)&self->_floatingDockController);
  objc_storeStrong((id *)&self->_iconManager, 0);
  objc_storeStrong((id *)&self->_libraryViewController, 0);
}

@end
