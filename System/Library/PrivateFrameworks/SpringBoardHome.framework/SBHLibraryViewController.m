@implementation SBHLibraryViewController

- (BOOL)iconViewDisplaysAccessories:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSUInteger v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, void *);
  void *v26;
  id v27;
  _QWORD v28[4];
  id v29;

  v4 = a3;
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isAdditionalItemsIndicatorIcon") && !UIAccessibilityIsReduceMotionEnabled())
  {
    if (-[NSMapTable count](self->_presentedFolderControllers, "count"))
    {

    }
    else
    {
      v9 = -[NSMapTable count](self->_dismissingFolderControllers, "count");

      if (!v9)
        goto LABEL_4;
    }
    objc_msgSend(v4, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "category");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "categoryIdentifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMapTable keyEnumerator](self->_presentedFolderControllers, "keyEnumerator");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "allObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __56__SBHLibraryViewController_iconViewDisplaysAccessories___block_invoke;
    v28[3] = &unk_1E8D8B068;
    v15 = v11;
    v29 = v15;
    objc_msgSend(v13, "bs_filter:", v28);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "count");

    if (v17)
    {

      v7 = 0;
      goto LABEL_5;
    }
    -[NSMapTable keyEnumerator](self->_dismissingFolderControllers, "keyEnumerator");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "allObjects");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = v14;
    v24 = 3221225472;
    v25 = __56__SBHLibraryViewController_iconViewDisplaysAccessories___block_invoke_2;
    v26 = &unk_1E8D8B068;
    v27 = v15;
    v20 = v15;
    objc_msgSend(v19, "bs_filter:", &v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v21, "count", v23, v24, v25, v26);

    if (v22)
    {
      v7 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
LABEL_4:
  -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "iconViewDisplaysAccessories:", v4);
LABEL_5:

LABEL_6:
  return v7;
}

- (SBIconViewDelegate)iconViewDelegate
{
  return (SBIconViewDelegate *)objc_loadWeakRetained((id *)&self->_iconViewDelegate);
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  if (v4)
  {
    v6[1] = 3221225472;
    v6[2] = __66__SBHLibraryViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
    v6[3] = &unk_1E8D89DE8;
    v5 = v4;
    v6[0] = MEMORY[0x1E0C809B0];
    v7 = v4;
    -[SBHLibraryViewController enumerateIconViewQueryableChildrenUsingBlock:](self, "enumerateIconViewQueryableChildrenUsingBlock:", v6);

    v4 = v5;
  }

}

- (void)enumerateIconViewQueryableChildrenWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  void (**v6)(id, SBHLibraryPodFolderController *, unint64_t, _BYTE *);
  _BOOL4 v7;
  SBHLibraryPodFolderController *v8;
  SBHLibraryPodFolderController *v9;
  SBHLibraryPodFolderController *podFolderViewController;
  char v11;

  v6 = (void (**)(id, SBHLibraryPodFolderController *, unint64_t, _BYTE *))a4;
  if ((a3 & 0x40) == 0)
  {
    if ((v11 = 0, !self->_iconTableViewController)
      || (v7 = -[SBHLibrarySearchController isActive](self->_containerViewController, "isActive"), (a3 & 3) != 0) && !v7
      || (v6[2](v6, (SBHLibraryPodFolderController *)self->_iconTableViewController, a3, &v11), (a3 & 3) == 0) && !v11)
    {
      -[SBNestingViewController nestedViewController](self, "nestedViewController");
      v8 = (SBHLibraryPodFolderController *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v8
        || (-[SBHLibraryPodFolderController bs_isDisappearingOrDisappeared](v8, "bs_isDisappearingOrDisappeared") & 1) != 0
        || (v6[2](v6, v9, a3, &v11), (a3 & 3) == 0) && !v11)
      {
        podFolderViewController = self->_podFolderViewController;
        if (podFolderViewController)
          v6[2](v6, podFolderViewController, a3, &v11);
      }

    }
  }

}

uint64_t __66__SBHLibraryViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateDisplayedIconViewsUsingBlock:", *(_QWORD *)(a1 + 32));
}

- (void)enumerateIconViewQueryableChildrenUsingBlock:(id)a3
{
  -[SBHLibraryViewController enumerateIconViewQueryableChildrenWithOptions:usingBlock:](self, "enumerateIconViewQueryableChildrenWithOptions:usingBlock:", 0, a3);
}

uint64_t __64__SBHLibraryViewController_isDisplayingIcon_inLocation_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = SBIconViewQueryingDisplayingIconInLocation(a2, *(void **)(a1 + 32), *(void **)(a1 + 40), a3);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (UIViewController)barSwipeViewController
{
  return self->_barSwipeViewController;
}

- (SBHLibraryViewControllerPresenter)presenter
{
  return (SBHLibraryViewControllerPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (SBHLibraryCategoryMapProvider)categoryMapProvider
{
  return self->_categoryMapProvider;
}

void __50__SBHLibraryViewController_presentedIconLocations__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "presentedIconLocations");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unionSet:", v3);

}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  BOOL v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x2020000000;
    v20 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __64__SBHLibraryViewController_isDisplayingIcon_inLocation_options___block_invoke;
    v13[3] = &unk_1E8D8AF50;
    v14 = v8;
    v15 = v10;
    v16 = &v17;
    -[SBHLibraryViewController enumerateIconViewQueryableChildrenWithOptions:usingBlock:](self, "enumerateIconViewQueryableChildrenWithOptions:usingBlock:", a5, v13);
    v11 = *((_BYTE *)v18 + 24) != 0;

    _Block_object_dispose(&v17, 8);
  }

  return v11;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  return -[SBHLibraryViewController isDisplayingIcon:inLocation:options:](self, "isDisplayingIcon:inLocation:options:", a3, a4, 0);
}

- (NSSet)presentedIconLocations
{
  void *v3;
  id v4;
  _QWORD v6[4];
  id v7;

  v3 = (void *)objc_opt_new();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SBHLibraryViewController_presentedIconLocations__block_invoke;
  v6[3] = &unk_1E8D8AF28;
  v4 = v3;
  v7 = v4;
  -[SBHLibraryViewController enumerateIconViewQueryableChildrenUsingBlock:](self, "enumerateIconViewQueryableChildrenUsingBlock:", v6);

  return (NSSet *)v4;
}

- (SBHLibraryViewController)initWithCategoryMapProvider:(id)a3
{
  id v5;
  SBHLibraryViewController *v6;
  SBHLibraryViewController *v7;
  id v8;
  uint64_t v9;
  BSEventQueue *transitionEventQueue;
  void *v11;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)SBHLibraryViewController;
  v6 = -[SBNestingViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_categoryMapProvider, a3);
    v7->_contentVisibility = 0;
    objc_storeStrong((id *)&v7->_iconLocation, CFSTR("SBIconLocationAppLibrary"));
    v8 = objc_alloc(MEMORY[0x1E0D01770]);
    v9 = objc_msgSend(v8, "initWithName:onQueue:", CFSTR("com.apple.SpringBoardHome.libraryViewController.transitions"), MEMORY[0x1E0C80D38]);
    transitionEventQueue = v7->_transitionEventQueue;
    v7->_transitionEventQueue = (BSEventQueue *)v9;

    +[PTDomain rootSettings](SBHCredenzaDomain, "rootSettings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeWeak((id *)&v7->_credenzaSettings, v11);

    -[SBHLibraryViewController _setupIconTableViewController:](v7, "_setupIconTableViewController:", 0);
  }

  return v7;
}

- (SBHLibraryViewController)init
{
  return -[SBHLibraryViewController initWithCategoryMapProvider:](self, "initWithCategoryMapProvider:", 0);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBIconModelDidLayoutIconStateNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHLibraryViewController;
  -[SBHLibraryViewController dealloc](&v4, sel_dealloc);
}

- (void)iconModelDidLayout:(id)a3
{
  void *v4;
  int v5;
  id v6;
  _QWORD v7[4];
  id v8;

  objc_msgSend(a3, "object");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController iconModel](self, "iconModel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v6, "isEqual:", v4);

  if (v5)
  {
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__SBHLibraryViewController_iconModelDidLayout___block_invoke;
    v7[3] = &unk_1E8D8AE90;
    v8 = v6;
    -[SBHLibraryViewController _enumerateAllViewControllersUsingBlock:](self, "_enumerateAllViewControllersUsingBlock:", v7);
    -[SBHLibraryViewController _setupIconTableViewController:](self, "_setupIconTableViewController:", -[SBHLibraryViewController isViewLoaded](self, "isViewLoaded"));

  }
}

void __47__SBHLibraryViewController_iconModelDidLayout___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "rootFolder");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setRootFolder:", v3);

  }
}

- (void)loadView
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
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SBHLibraryViewController;
  -[SBHLibraryViewController loadView](&v13, sel_loadView);
  -[SBHLibraryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E10]), "initWithFrame:", v5, v7, v9, v11);
  objc_msgSend(v12, "setFocusGroupIdentifier:", CFSTR("AppLibrary"));
  -[SBHLibraryViewController setView:](self, "setView:", v12);
  -[SBHLibraryViewController _setupIconTableViewController:](self, "_setupIconTableViewController:", 0);
  -[SBNestingViewController setDelegate:](self, "setDelegate:", self);
  -[SBHLibraryViewController _setupReducedTransparencyBackgroundViewIfNeeded](self, "_setupReducedTransparencyBackgroundViewIfNeeded");

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryViewController;
  -[SBHLibraryViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[SBHLibraryViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_setIgnoreBackdropViewsWhenHiding:", 1);
  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTintColor:", v4);

  -[SBHLibraryViewController _addBarSwipeView](self, "_addBarSwipeView");
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)SBHLibraryViewController;
  -[SBNestingViewController viewWillAppear:](&v8, sel_viewWillAppear_);
  -[SBHLibraryViewController invalidateSearchControllerAppLaunchResetTimer](self, "invalidateSearchControllerAppLaunchResetTimer");
  if (!self->_libraryCategoryMap)
    -[SBHLibraryViewController _enqueueAppLibraryUpdate](self, "_enqueueAppLibraryUpdate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__updateReduceTransparency, *MEMORY[0x1E0DC45B8], 0);

  -[SBHLibrarySearchController beginAppearanceTransition:animated:](self->_containerViewController, "beginAppearanceTransition:animated:", 1, v3);
  SBLogTelemetrySignposts();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v6))
  {
    *(_WORD *)v7 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v6, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_PRESENT", " enableTelemetry=YES  isAnimation=YES ", v7, 2u);
  }

  -[SBHLibraryViewController _notifyObserversWillPresent](self, "_notifyObserversWillPresent");
}

- (void)viewDidAppear:(BOOL)a3
{
  NSObject *v4;
  uint8_t v5[16];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryViewController;
  -[SBNestingViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[SBHLibrarySearchController endAppearanceTransition](self->_containerViewController, "endAppearanceTransition");
  SBLogTelemetrySignposts();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v4))
  {
    *(_WORD *)v5 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v4, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_PRESENT", " enableTelemetry=YES  isAnimation=YES ", v5, 2u);
  }

  -[SBHLibraryViewController _notifyObserversDidPresent](self, "_notifyObserversDidPresent");
}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint8_t v6[16];
  objc_super v7;

  v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SBHLibraryViewController;
  -[SBNestingViewController viewWillDisappear:](&v7, sel_viewWillDisappear_);
  -[SBHLibrarySearchController beginAppearanceTransition:animated:](self->_containerViewController, "beginAppearanceTransition:animated:", 0, v3);
  SBLogTelemetrySignposts();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v6, 2u);
  }

  -[SBHLibraryViewController _notifyObserversWillDismiss](self, "_notifyObserversWillDismiss");
  -[SBHLibraryViewController _dismissDisplayedContextMenu](self, "_dismissDisplayedContextMenu");
}

- (void)_dismissDisplayedContextMenu
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;

  -[SBNestingViewController deepestNestedDescendantViewController](self, "deepestNestedDescendantViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_class();
  v5 = v3;
  if (v4)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v6 = v5;
    else
      v6 = 0;
  }
  else
  {
    v6 = 0;
  }
  v7 = v6;

  if (v7)
    objc_msgSend(v7, "dismissDisplayedContextMenu");
  else
    -[SBHLibraryViewController enumerateDisplayedIconViewsUsingBlock:](self, "enumerateDisplayedIconViewsUsingBlock:", &__block_literal_global_53);

}

void __56__SBHLibraryViewController__dismissDisplayedContextMenu__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isShowingContextMenu"))
  {
    objc_msgSend(v4, "dismissContextMenuWithCompletion:", 0);
    *a3 = 1;
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  id v6;
  void *v7;
  uint8_t v8[16];
  objc_super v9;

  v3 = a3;
  -[SBHLibraryViewController _dismissExpandedPods:completion:](self, "_dismissExpandedPods:completion:", 0, 0);
  v9.receiver = self;
  v9.super_class = (Class)SBHLibraryViewController;
  -[SBNestingViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, v3);
  -[SBHLibrarySearchController endAppearanceTransition](self->_containerViewController, "endAppearanceTransition");
  SBLogTelemetrySignposts();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v8, 2u);
  }

  -[SBHLibrarySearchController resetSearchController:clearSearchResults:resetSearchBarTransformAndAlpha:](self->_containerViewController, "resetSearchController:clearSearchResults:resetSearchBarTransformAndAlpha:", v3, 1, 1);
  -[SBHLibraryViewController _flushPendingLibraryCategoryMapUpdateIfNeeded](self, "_flushPendingLibraryCategoryMapUpdateIfNeeded");
  v6 = -[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self->_categoryMapProvider, "requestLibraryCategoryMapRefreshWithOptions:reason:", 2, CFSTR("SBHLibraryViewController reload proactive categories after disappear request"));
  -[SBHLibraryViewController _notifyObserversDidDismiss](self, "_notifyObserversDidDismiss");
  -[SBHLibraryViewController _invalidateLibraryViewControllerDismissalTimer](self, "_invalidateLibraryViewControllerDismissalTimer");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:name:object:", self, *MEMORY[0x1E0DC45B8], 0);

  -[SBHLibraryViewController _teardownReducedTransparencyBackgroundView](self, "_teardownReducedTransparencyBackgroundView");
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;

  -[UIViewController viewIfLoaded](self->_barSwipeViewController, "viewIfLoaded");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBHLibraryViewController view](self, "view");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bringSubviewToFront:", v3);

  }
  v5.receiver = self;
  v5.super_class = (Class)SBHLibraryViewController;
  -[SBHLibraryViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);

}

- (void)viewDidLayoutSubviews
{
  SBFolderControllerBackgroundView *reducedTransparencyBackgroundView;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryViewController;
  -[SBHLibraryViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  reducedTransparencyBackgroundView = self->_reducedTransparencyBackgroundView;
  if (reducedTransparencyBackgroundView)
  {
    -[SBFolderControllerBackgroundView superview](self->_reducedTransparencyBackgroundView, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bounds");
    -[SBFolderControllerBackgroundView setFrame:](reducedTransparencyBackgroundView, "setFrame:");

    -[SBHLibraryViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendSubviewToBack:", self->_reducedTransparencyBackgroundView);

  }
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v4 = a4;
  v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBHLibraryViewController;
  -[SBHLibraryViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v10, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, v6, v4);
  -[SBHLibraryViewController externalBackgroundView](self, "externalBackgroundView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0DA9D88], "matchMoveAnimationForPinningToView:", v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addAnimation:forKey:", v9, CFSTR("SBHLibraryExternalBackgroundMatchMoveKey"));
    }
    else
    {
      objc_msgSend(v7, "layer");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removeAnimationForKey:", CFSTR("SBHLibraryExternalBackgroundMatchMoveKey"));
    }

  }
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  objc_super v16;

  height = a3.height;
  width = a3.width;
  v16.receiver = self;
  v16.super_class = (Class)SBHLibraryViewController;
  v7 = a4;
  -[SBHLibraryViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);
  -[SBHLibraryViewController externalBackgroundView](self, "externalBackgroundView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "animationForKey:", CFSTR("SBHLibraryExternalBackgroundMatchMoveKey"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "removeAnimationForKey:", CFSTR("SBHLibraryExternalBackgroundMatchMoveKey"));
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __79__SBHLibraryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v13[3] = &unk_1E8D8AEB8;
  v14 = v9;
  v15 = v10;
  v11 = v10;
  v12 = v9;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", 0, v13);

}

uint64_t __79__SBHLibraryViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addAnimation:forKey:", *(_QWORD *)(a1 + 40), CFSTR("SBHLibraryExternalBackgroundMatchMoveKey"));
}

- (id)contentScrollView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SBNestingViewController deepestNestedDescendantViewController](self, "deepestNestedDescendantViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentScrollView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[SBNestingViewController deepestNestedDescendantViewController](self, "deepestNestedDescendantViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentScrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBHLibrarySearchController contentScrollView](self->_containerViewController, "contentScrollView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)keyCommands
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)SBHLibraryViewController;
  -[SBHLibraryViewController keyCommands](&v7, sel_keyCommands);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3930], "keyCommandWithInput:modifierFlags:action:", *MEMORY[0x1E0DC4DA0], 0, sel__popExpandedPod);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)v3;
  if (v2)
  {
    objc_msgSend(v2, "arrayByAddingObject:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

- (void)setBehaviorDelegate:(id)a3
{
  NSNumber *shouldUseReduceTransparencyBackgroundView;

  objc_storeWeak((id *)&self->_behaviorDelegate, a3);
  shouldUseReduceTransparencyBackgroundView = self->_shouldUseReduceTransparencyBackgroundView;
  self->_shouldUseReduceTransparencyBackgroundView = 0;

}

- (void)_dismissExpandedPods:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(id, _QWORD);

  v4 = a3;
  v7 = (void (**)(id, _QWORD))a4;
  -[SBNestingViewController deepestNestedDescendantViewController](self, "deepestNestedDescendantViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[SBHLibraryViewController popNestedViewControllerAnimated:withCompletion:](self, "popNestedViewControllerAnimated:withCompletion:", v4, v7);
  }
  else if (v7)
  {
    v7[2](v7, 0);
  }

}

- (void)_expandPodAtIndex:(unint64_t)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  void (**v8)(id, _QWORD);
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  void (**v16)(id, _QWORD);

  v5 = a4;
  v8 = (void (**)(id, _QWORD))a5;
  -[SBHLibraryCategoryMap categoryIdentifiers](self->_libraryCategoryMap, "categoryIdentifiers");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBNestingViewController deepestNestedDescendantViewController](self, "deepestNestedDescendantViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 || -[SBHLibraryViewController isPresentingSearch](self, "isPresentingSearch"))
  {

    goto LABEL_4;
  }
  if (!objc_msgSend(v9, "count"))
  {
LABEL_4:
    if (v8)
      v8[2](v8, 0);
    goto LABEL_6;
  }
  -[SBFolderController folder](self->_podFolderViewController, "folder");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "icons");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectAtIndex:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "category");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __66__SBHLibraryViewController__expandPodAtIndex_animated_completion___block_invoke;
    v15[3] = &unk_1E8D85A58;
    v16 = v8;
    -[SBHLibraryViewController presentPodWithCategory:animated:completion:](self, "presentPodWithCategory:animated:completion:", v14, v5, v15);

  }
  else
  {
    -[SBHLibraryViewController presentPodWithCategory:animated:completion:](self, "presentPodWithCategory:animated:completion:", v14, v5, 0);
  }

LABEL_6:
}

uint64_t __66__SBHLibraryViewController__expandPodAtIndex_animated_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setSearchDimmingView:(id)a3
{
  -[SBHLibrarySearchController setSearchDimmingView:](self->_containerViewController, "setSearchDimmingView:", a3);
}

- (UIView)searchDimmingView
{
  return -[SBHLibrarySearchController searchDimmingView](self->_containerViewController, "searchDimmingView");
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBHLibraryViewController _updateViewControllerLegibility](self, "_updateViewControllerLegibility");
  }

}

- (void)setIconModel:(id)a3
{
  SBHIconModel **p_iconModel;
  char v6;
  void *v7;
  void *v8;
  SBHLibraryCategoriesRootFolder *categoriesFolder;
  SBHLibraryCategoriesRootFolder *v10;
  id v11;
  _QWORD v12[5];

  v11 = a3;
  p_iconModel = &self->_iconModel;
  v6 = objc_msgSend(v11, "isEqual:", self->_iconModel);
  v7 = v11;
  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObserver:name:object:", self, CFSTR("SBIconModelDidLayoutIconStateNotification"), *p_iconModel);
    objc_storeStrong((id *)&self->_iconModel, a3);
    categoriesFolder = self->_categoriesFolder;
    if (categoriesFolder)
    {
      -[SBRootFolder setDelegate:](categoriesFolder, "setDelegate:", 0);
      v10 = self->_categoriesFolder;
      self->_categoriesFolder = 0;

    }
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __41__SBHLibraryViewController_setIconModel___block_invoke;
    v12[3] = &unk_1E8D8AE90;
    v12[4] = self;
    -[SBHLibraryViewController _enumerateAllViewControllersUsingBlock:](self, "_enumerateAllViewControllersUsingBlock:", v12);
    -[SBHLibraryViewController _setupIconTableViewController:](self, "_setupIconTableViewController:", -[SBHLibraryViewController isViewLoaded](self, "isViewLoaded"));
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel_iconModelDidLayout_, CFSTR("SBIconModelDidLayoutIconStateNotification"), *p_iconModel);

    v7 = v11;
  }

}

void __41__SBHLibraryViewController_setIconModel___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 1160);
  v3 = a2;
  objc_msgSend(v2, "rootFolder");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setRootFolder:", v4);

}

- (void)setIconViewProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_iconViewProvider, obj);
    -[SBHLibraryViewController _setupIconTableViewController:](self, "_setupIconTableViewController:", -[SBHLibraryViewController isViewLoaded](self, "isViewLoaded"));
    v5 = obj;
  }

}

- (void)setIconImageCache:(id)a3
{
  id v5;
  _QWORD v6[4];
  id v7;

  v5 = a3;
  if ((-[SBHIconImageCache isEqual:](self->_iconImageCache, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_iconImageCache, a3);
    -[SBFolderIconImageCache setIconImageCache:](self->_folderIconImageCache, "setIconImageCache:", v5);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __46__SBHLibraryViewController_setIconImageCache___block_invoke;
    v6[3] = &unk_1E8D8AE90;
    v7 = v5;
    -[SBHLibraryViewController _enumerateAllViewControllersUsingBlock:](self, "_enumerateAllViewControllersUsingBlock:", v6);
    -[SBHLibraryViewController _setupIconTableViewController:](self, "_setupIconTableViewController:", -[SBHLibraryViewController isViewLoaded](self, "isViewLoaded"));

  }
}

uint64_t __46__SBHLibraryViewController_setIconImageCache___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setIconImageCache:", *(_QWORD *)(a1 + 32));
}

- (void)setListLayoutProvider:(id)a3
{
  SBIconListLayoutProvider *v5;
  _QWORD v6[4];
  SBIconListLayoutProvider *v7;

  v5 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v5)
  {
    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    -[SBHLibrarySearchController setListLayoutProvider:](self->_containerViewController, "setListLayoutProvider:", v5);
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __50__SBHLibraryViewController_setListLayoutProvider___block_invoke;
    v6[3] = &unk_1E8D8AE90;
    v7 = v5;
    -[SBHLibraryViewController _enumerateAllViewControllersUsingBlock:](self, "_enumerateAllViewControllersUsingBlock:", v6);
    -[SBHLibraryViewController _setupIconTableViewController:](self, "_setupIconTableViewController:", -[SBHLibraryViewController isViewLoaded](self, "isViewLoaded"));

  }
}

uint64_t __50__SBHLibraryViewController_setListLayoutProvider___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setListLayoutProvider:", *(_QWORD *)(a1 + 32));
}

- (SBFolderController)folderController
{
  return (SBFolderController *)self->_podFolderViewController;
}

- (SBFolderIconImageCache)folderIconImageCache
{
  SBFolderIconImageCache *folderIconImageCache;
  void *v4;
  void *v5;
  SBFolderIconImageCache *v6;
  SBFolderIconImageCache *v7;
  SBFolderIconImageCache *v8;
  void *v9;
  void *v10;

  folderIconImageCache = self->_folderIconImageCache;
  if (!folderIconImageCache)
  {
    -[SBHLibraryViewController listLayoutProvider](self, "listLayoutProvider");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "layoutForIconLocation:", CFSTR("SBIconLocationAppLibraryCategoryPodAdditionalItems"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = -[SBFolderIconImageCache initWithListLayout:]([SBFolderIconImageCache alloc], "initWithListLayout:", v5);
      v7 = self->_folderIconImageCache;
      self->_folderIconImageCache = v6;

      v8 = self->_folderIconImageCache;
      -[SBHLibraryViewController iconImageCache](self, "iconImageCache");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBFolderIconImageCache setIconImageCache:](v8, "setIconImageCache:", v9);

      -[SBFolderIconImageCache sharedCache](self->_folderIconImageCache, "sharedCache");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setMiniGridImageLoadingAsynchronous:", 1);

    }
    folderIconImageCache = self->_folderIconImageCache;
  }
  return folderIconImageCache;
}

- (BOOL)isPresentingSearch
{
  _BOOL4 v3;

  v3 = -[SBHLibrarySearchController isActive](self->_containerViewController, "isActive");
  if (v3)
    LOBYTE(v3) = self->_iconTableViewController != 0;
  return v3;
}

- (void)dismissSearch
{
  -[SBHLibrarySearchController endEditingForSearchField](self->_containerViewController, "endEditingForSearchField");
}

- (void)popPresentationState
{
  id v3;

  -[SBHLibraryViewController enumerateDisplayedIconViewsUsingBlock:](self, "enumerateDisplayedIconViewsUsingBlock:", &__block_literal_global_63_0);
  if (-[SBHLibraryViewController isPresentingFolder](self, "isPresentingFolder"))
  {
    -[SBHLibraryViewController popNestedViewControllerAnimated:withCompletion:](self, "popNestedViewControllerAnimated:withCompletion:", 1, 0);
  }
  else if (-[SBHLibraryViewController isPresentingSearch](self, "isPresentingSearch"))
  {
    -[SBHLibraryViewController dismissSearch](self, "dismissSearch");
  }
  else
  {
    -[SBHLibraryViewController behaviorDelegate](self, "behaviorDelegate");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "libraryViewControllerRequestsDismissal:", self);

  }
}

void __48__SBHLibraryViewController_popPresentationState__block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;

  v4 = a2;
  if (objc_msgSend(v4, "isShowingContextMenu"))
  {
    objc_msgSend(v4, "dismissContextMenuWithCompletion:", 0);
    *a3 = 1;
  }

}

- (void)noteIconViewWillZoomDown:(id)a3
{
  -[SBHLibraryViewController _scrollIconViewToVisible:animated:](self, "_scrollIconViewToVisible:animated:", a3, 1);
}

- (void)layoutIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v4 = a4;
  v18 = *MEMORY[0x1E0C80C00];
  -[SBFolderController layoutIconListsWithAnimationType:forceRelayout:](self->_podFolderViewController, "layoutIconListsWithAnimationType:forceRelayout:");
  v15 = 0u;
  v16 = 0u;
  v14 = 0u;
  -[SBNestingViewController nestedViewControllers](self, "nestedViewControllers", 0, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        objc_opt_class();
        SBFSafeCast();
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "layoutIconListsWithAnimationType:forceRelayout:", a3, v4);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)setBarSwipeViewController:(id)a3
{
  UIViewController *v5;
  int v6;
  UIViewController *v7;

  v5 = (UIViewController *)a3;
  if (self->_barSwipeViewController != v5)
  {
    v7 = v5;
    -[SBHLibraryViewController bs_removeChildViewController:](self, "bs_removeChildViewController:");
    objc_storeStrong((id *)&self->_barSwipeViewController, a3);
    v6 = -[SBHLibraryViewController isViewLoaded](self, "isViewLoaded");
    v5 = v7;
    if (v6)
    {
      -[SBHLibraryViewController _addBarSwipeView](self, "_addBarSwipeView");
      v5 = v7;
    }
  }

}

- (void)_addBarSwipeView
{
  UIViewController *barSwipeViewController;
  UIViewController *v4;
  void *v5;
  id v6;

  barSwipeViewController = self->_barSwipeViewController;
  if (barSwipeViewController)
  {
    v4 = barSwipeViewController;
    -[SBHLibraryViewController bs_addChildViewController:](self, "bs_addChildViewController:", v4);
    -[UIViewController view](v4, "view");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    -[SBHLibraryViewController view](self, "view");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    objc_msgSend(v6, "setFrame:");

    objc_msgSend(v6, "setAutoresizingMask:", 18);
  }
}

- (void)setExternalBackgroundView:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_externalBackgroundView);
  if (WeakRetained != obj)
  {
    objc_msgSend(WeakRetained, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeAnimationForKey:", CFSTR("SBHLibraryExternalBackgroundMatchMoveKey"));

    objc_storeWeak((id *)&self->_externalBackgroundView, obj);
    -[SBHLibraryViewController viewIfLoaded](self, "viewIfLoaded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0DA9D88], "matchMoveAnimationForPinningToView:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(obj, "addAnimation:forKey:", v8, CFSTR("SBHLibraryExternalBackgroundMatchMoveKey"));

    }
  }

}

- (void)setAllowsBadging:(BOOL)a3
{
  if (self->_allowsBadging != a3)
  {
    self->_allowsBadging = a3;
    -[SBHLibraryCategoriesRootFolder setSupportsBadging:](self->_categoriesFolder, "setSupportsBadging:");
  }
}

- (void)setBadgeBehaviorProvider:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_badgeBehaviorProvider);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_badgeBehaviorProvider, obj);
    -[SBFolder setBadgeBehaviorProvider:](self->_categoriesFolder, "setBadgeBehaviorProvider:", obj);
  }

}

- (BOOL)presentPodWithCategory:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void (**v10)(_QWORD, _QWORD);
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  void (**v17)(_QWORD);
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  id v28;
  id v29;
  _QWORD v30[4];
  void (**v31)(_QWORD);
  _QWORD aBlock[5];
  id v33;
  id v34;
  id v35;
  BOOL v36;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void (**)(_QWORD, _QWORD))v9;
  if (v8)
  {
    objc_msgSend(v8, "additionalItemsIndicatorIcon");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "categoryIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryViewController _iconLocationForCategoryIdentifier:](self, "_iconLocationForCategoryIdentifier:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __71__SBHLibraryViewController_presentPodWithCategory_animated_completion___block_invoke;
    aBlock[3] = &unk_1E8D8AEE0;
    aBlock[4] = self;
    v14 = v11;
    v33 = v14;
    v15 = v13;
    v34 = v15;
    v36 = v6;
    v16 = v10;
    v35 = v16;
    v17 = (void (**)(_QWORD))_Block_copy(aBlock);
    if (!-[SBHLibraryViewController isPresentingFolder](self, "isPresentingFolder"))
    {
      v17[2](v17);
LABEL_20:

      goto LABEL_21;
    }
    v29 = v14;
    -[SBNestingViewController deepestNestedDescendantViewController](self, "deepestNestedDescendantViewController");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_opt_class();
    v20 = v18;
    v28 = v15;
    if (v19)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v21 = v20;
      else
        v21 = 0;
    }
    else
    {
      v21 = 0;
    }
    v23 = v21;

    objc_msgSend(v23, "folder");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v24, "isLibraryCategoryFolder"))
    {
      objc_msgSend(v24, "libraryCategoryIdentifier");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v25 = 0;
    }
    v15 = v28;
    if (objc_msgSend(v25, "isEqual:", v12, v28))
    {
      if (!v16)
      {
LABEL_19:

        v14 = v29;
        goto LABEL_20;
      }
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBHLibraryPresentationErrorDomain"), 9, MEMORY[0x1E0C9AA70]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v16 + 2))(v16, v26);
    }
    else
    {
      v30[0] = MEMORY[0x1E0C809B0];
      v30[1] = 3221225472;
      v30[2] = __71__SBHLibraryViewController_presentPodWithCategory_animated_completion___block_invoke_3;
      v30[3] = &unk_1E8D86600;
      v31 = v17;
      -[SBHLibraryViewController popNestedViewControllerAnimated:withCompletion:](self, "popNestedViewControllerAnimated:withCompletion:", v6, v30);
      v26 = v31;
    }

    goto LABEL_19;
  }
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBHLibraryPresentationErrorDomain"), 4, MEMORY[0x1E0C9AA70]);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v10)[2](v10, v22);

  }
LABEL_21:

  return v8 != 0;
}

void __71__SBHLibraryViewController_presentPodWithCategory_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;

  objc_msgSend(*(id *)(a1 + 32), "podFolderViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 48);
  v5 = *(unsigned __int8 *)(a1 + 64);
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__SBHLibraryViewController_presentPodWithCategory_animated_completion___block_invoke_2;
  v6[3] = &unk_1E8D86600;
  v7 = *(id *)(a1 + 56);
  objc_msgSend(v2, "pushFolderIcon:location:animated:completion:", v3, v4, v5, v6);

}

void __71__SBHLibraryViewController_presentPodWithCategory_animated_completion___block_invoke_2(uint64_t a1, int a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    if (a2)
    {
      (*(void (**)(_QWORD, _QWORD))(v2 + 16))(*(_QWORD *)(a1 + 32), 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("SBHLibraryPresentationErrorDomain"), 8, MEMORY[0x1E0C9AA70]);
      v3 = (id)objc_claimAutoreleasedReturnValue();
      (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

    }
  }
}

uint64_t __71__SBHLibraryViewController_presentPodWithCategory_animated_completion___block_invoke_3(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (BOOL)presentPodWithCategoryIdentifier:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v5;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v15[5];

  v5 = a4;
  v8 = a5;
  v9 = objc_msgSend(a3, "integerValue");
  -[SBFolderController folder](self->_podFolderViewController, "folder");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "icons");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __81__SBHLibraryViewController_presentPodWithCategoryIdentifier_animated_completion___block_invoke;
  v15[3] = &__block_descriptor_40_e16_B16__0__SBIcon_8l;
  v15[4] = v9;
  objc_msgSend(v11, "bs_firstObjectPassingTest:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "category");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[SBHLibraryViewController presentPodWithCategory:animated:completion:](self, "presentPodWithCategory:animated:completion:", v13, v5, v8);

  return v5;
}

BOOL __81__SBHLibraryViewController_presentPodWithCategoryIdentifier_animated_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _BOOL8 v8;

  v3 = a2;
  if (objc_msgSend(v3, "isCategoryIcon"))
    v4 = v3;
  else
    v4 = 0;
  objc_msgSend(v4, "category");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "predictionCategoryID");

  v8 = v7 == *(_QWORD *)(a1 + 32);
  return v8;
}

- (void)forcedSearchTextFieldNoneditable:(BOOL)a3
{
  _BOOL4 v3;
  id v4;

  v3 = a3;
  -[SBHLibraryViewController containerViewController](self, "containerViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setForcedSearchTextFieldNoneditable:", !v3);

}

- (void)setPresenter:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_presenter, obj);
    -[SBHLibraryViewController _updateCategoryIconBlurBackdropView](self, "_updateCategoryIconBlurBackdropView");
    v5 = obj;
  }

}

- (void)setOverrideIconImageAppearance:(id)a3
{
  SBHIconImageAppearance *v4;
  SBHIconImageAppearance *overrideIconImageAppearance;
  id v6;

  v6 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    v4 = (SBHIconImageAppearance *)objc_msgSend(v6, "copy");
    overrideIconImageAppearance = self->_overrideIconImageAppearance;
    self->_overrideIconImageAppearance = v4;

    -[SBFolderController setOverrideIconImageAppearance:](self->_podFolderViewController, "setOverrideIconImageAppearance:", v6);
  }

}

- (SBRootFolder)categoriesRootFolder
{
  void *v2;
  void *v3;

  -[SBHLibraryPodFolderController dataSource](self->_podFolderViewController, "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "categoriesFolder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBRootFolder *)v3;
}

- (void)setOverrideLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_overrideLegibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_overrideLegibilitySettings, a3);
    -[SBHLibraryViewController _updateViewControllerLegibility](self, "_updateViewControllerLegibility");
  }

}

- (_UILegibilitySettings)effectiveLegibilitySettings
{
  _UILegibilitySettings *overrideLegibilitySettings;

  overrideLegibilitySettings = self->_overrideLegibilitySettings;
  if (!overrideLegibilitySettings)
    overrideLegibilitySettings = self->_legibilitySettings;
  return overrideLegibilitySettings;
}

- (NSArray)podTopLevelDisplayedIcons
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;

  -[SBHLibraryViewController categoriesRootFolder](self, "categoriesRootFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "firstList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99E10]);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__SBHLibraryViewController_podTopLevelDisplayedIcons__block_invoke;
  v8[3] = &unk_1E8D8A850;
  v9 = v4;
  v5 = v4;
  objc_msgSend(v3, "enumerateIconsUsingBlock:", v8);
  objc_msgSend(v5, "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v6;
}

void __53__SBHLibraryViewController_podTopLevelDisplayedIcons__block_invoke(uint64_t a1, void *a2)
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a2;
  v3 = objc_msgSend(v12, "isCategoryIcon");
  v4 = v12;
  if (v3)
  {
    objc_msgSend(v12, "category");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "compactPodFolder");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      objc_msgSend(v6, "iconsPassingTest:", &__block_literal_global_69);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "unionSet:", v8);

    }
    objc_msgSend(v5, "compactPodAdditionalItemsFolder");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      objc_msgSend(v9, "allIcons");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "unionSet:", v11);

    }
    v4 = v12;
  }

}

uint64_t __53__SBHLibraryViewController_podTopLevelDisplayedIcons__block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isApplicationIcon");
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBHLibraryViewController presentedIconLocations](self, "presentedIconLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  return -[SBHLibraryViewController iconViewForIcon:location:options:](self, "iconViewForIcon:location:options:", a3, a4, 0);
}

- (id)iconViewForIcon:(id)a3 location:(id)a4 options:(unint64_t)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v8 = a3;
  v9 = a4;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v17 = 0;
    v18 = &v17;
    v19 = 0x3032000000;
    v20 = __Block_byref_object_copy__14;
    v21 = __Block_byref_object_dispose__14;
    v22 = 0;
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __61__SBHLibraryViewController_iconViewForIcon_location_options___block_invoke;
    v13[3] = &unk_1E8D8AF50;
    v14 = v8;
    v15 = v10;
    v16 = &v17;
    -[SBHLibraryViewController enumerateIconViewQueryableChildrenWithOptions:usingBlock:](self, "enumerateIconViewQueryableChildrenWithOptions:usingBlock:", a5, v13);
    v11 = (id)v18[5];

    _Block_object_dispose(&v17, 8);
  }

  return v11;
}

void __61__SBHLibraryViewController_iconViewForIcon_location_options___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  SBIconViewQueryingIconViewForIconInLocation(a2, *(void **)(a1 + 32), *(void **)(a1 + 40), a3);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    *a4 = 1;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__14;
    v19 = __Block_byref_object_dispose__14;
    v20 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __61__SBHLibraryViewController_firstIconViewForIcon_inLocations___block_invoke;
    v11[3] = &unk_1E8D8AF50;
    v12 = v6;
    v13 = v8;
    v14 = &v15;
    -[SBHLibraryViewController enumerateIconViewQueryableChildrenUsingBlock:](self, "enumerateIconViewQueryableChildrenUsingBlock:", v11);
    v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }

  return v9;
}

void __61__SBHLibraryViewController_firstIconViewForIcon_inLocations___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "firstIconViewForIcon:inLocations:", a1[4], a1[5]);
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    *a4 = 1;
  v7 = *(_QWORD *)(a1[6] + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)firstIconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__14;
    v15 = __Block_byref_object_dispose__14;
    v16 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__SBHLibraryViewController_firstIconViewForIcon___block_invoke;
    v8[3] = &unk_1E8D8AF78;
    v9 = v4;
    v10 = &v11;
    -[SBHLibraryViewController enumerateIconViewQueryableChildrenUsingBlock:](self, "enumerateIconViewQueryableChildrenUsingBlock:", v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __49__SBHLibraryViewController_firstIconViewForIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t v6;
  uint64_t v7;
  void *v8;

  objc_msgSend(a2, "firstIconViewForIcon:", *(_QWORD *)(a1 + 32));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
    *a4 = 1;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

- (id)firstNonSuggestionsOrRecentsIconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__14;
    v15 = __Block_byref_object_dispose__14;
    v16 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __72__SBHLibraryViewController_firstNonSuggestionsOrRecentsIconViewForIcon___block_invoke;
    v8[3] = &unk_1E8D8AF50;
    v8[4] = self;
    v9 = v4;
    v10 = &v11;
    -[SBHLibraryViewController enumerateIconViewQueryableChildrenUsingBlock:](self, "enumerateIconViewQueryableChildrenUsingBlock:", v8);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __72__SBHLibraryViewController_firstNonSuggestionsOrRecentsIconViewForIcon___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;

  v6 = a2;
  v7 = a1[5];
  v11 = v6;
  if (*(id *)(a1[4] + 1336) == v6)
  {
    objc_msgSend(v6, "firstNonSuggestionsOrRecentsIconViewForIcon:", v7);
    v8 = objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(v6, "firstIconViewForIcon:", v7);
  v8 = objc_claimAutoreleasedReturnValue();
  if (v8)
LABEL_3:
    *a4 = 1;
LABEL_4:
  v9 = *(_QWORD *)(a1[6] + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

}

- (BOOL)isDisplayingIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __57__SBHLibraryViewController_isDisplayingIcon_inLocations___block_invoke;
    v11[3] = &unk_1E8D8AF50;
    v12 = v6;
    v13 = v8;
    v14 = &v15;
    -[SBHLibraryViewController enumerateIconViewQueryableChildrenUsingBlock:](self, "enumerateIconViewQueryableChildrenUsingBlock:", v11);
    v9 = *((_BYTE *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }

  return v9;
}

uint64_t __57__SBHLibraryViewController_isDisplayingIcon_inLocations___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isDisplayingIcon:inLocations:", a1[4], a1[5]);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __45__SBHLibraryViewController_isDisplayingIcon___block_invoke;
    v8[3] = &unk_1E8D8AF78;
    v9 = v4;
    v10 = &v11;
    -[SBHLibraryViewController enumerateIconViewQueryableChildrenUsingBlock:](self, "enumerateIconViewQueryableChildrenUsingBlock:", v8);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __45__SBHLibraryViewController_isDisplayingIcon___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isDisplayingIcon:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x2020000000;
    v14 = 0;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __49__SBHLibraryViewController_isDisplayingIconView___block_invoke;
    v8[3] = &unk_1E8D8AF78;
    v9 = v4;
    v10 = &v11;
    -[SBHLibraryViewController enumerateIconViewQueryableChildrenUsingBlock:](self, "enumerateIconViewQueryableChildrenUsingBlock:", v8);
    v6 = *((_BYTE *)v12 + 24) != 0;

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __49__SBHLibraryViewController_isDisplayingIconView___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isDisplayingIconView:", *(_QWORD *)(a1 + 32));
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x2020000000;
    v18 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __60__SBHLibraryViewController_isDisplayingIconView_inLocation___block_invoke;
    v11[3] = &unk_1E8D8AF50;
    v12 = v6;
    v13 = v8;
    v14 = &v15;
    -[SBHLibraryViewController enumerateIconViewQueryableChildrenUsingBlock:](self, "enumerateIconViewQueryableChildrenUsingBlock:", v11);
    v9 = *((_BYTE *)v16 + 24) != 0;

    _Block_object_dispose(&v15, 8);
  }

  return v9;
}

uint64_t __60__SBHLibraryViewController_isDisplayingIconView_inLocation___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  result = objc_msgSend(a2, "isDisplayingIconView:inLocation:", a1[4], a1[5]);
  if ((_DWORD)result)
  {
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v7 = a3;
  v6 = a4;
  if (v7 && v6)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __74__SBHLibraryViewController_enumerateDisplayedIconViewsForIcon_usingBlock___block_invoke;
    v8[3] = &unk_1E8D8AFA0;
    v9 = v7;
    v10 = v6;
    -[SBHLibraryViewController enumerateIconViewQueryableChildrenUsingBlock:](self, "enumerateIconViewQueryableChildrenUsingBlock:", v8);

  }
}

uint64_t __74__SBHLibraryViewController_enumerateDisplayedIconViewsForIcon_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "enumerateDisplayedIconViewsForIcon:usingBlock:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  _QWORD v11[4];
  id v12;
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && objc_msgSend(v7, "count"))
  {
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy__14;
    v19 = __Block_byref_object_dispose__14;
    v20 = 0;
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __68__SBHLibraryViewController_firstIconViewForIcon_excludingLocations___block_invoke;
    v11[3] = &unk_1E8D8AF50;
    v12 = v6;
    v13 = v8;
    v14 = &v15;
    -[SBHLibraryViewController enumerateIconViewQueryableChildrenWithOptions:usingBlock:](self, "enumerateIconViewQueryableChildrenWithOptions:usingBlock:", 1, v11);
    v9 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

void __68__SBHLibraryViewController_firstIconViewForIcon_excludingLocations___block_invoke(_QWORD *a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;

  objc_msgSend(a2, "firstIconViewForIcon:excludingLocations:", a1[4], a1[5]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = v6;
    objc_storeStrong((id *)(*(_QWORD *)(a1[6] + 8) + 40), v6);
    v6 = v7;
    *a4 = 1;
  }

}

- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;

  v7 = a3;
  v18 = 0;
  v19 = &v18;
  v20 = 0x3032000000;
  v21 = __Block_byref_object_copy__14;
  v22 = __Block_byref_object_dispose__14;
  v8 = MEMORY[0x1E0C809B0];
  v23 = 0;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __57__SBHLibraryViewController_firstIconViewForIcon_options___block_invoke;
  v15[3] = &unk_1E8D8AFC8;
  v17 = &v18;
  v16 = v7;
  v12[0] = v8;
  v12[1] = 3221225472;
  v12[2] = __57__SBHLibraryViewController_firstIconViewForIcon_options___block_invoke_2;
  v12[3] = &unk_1E8D8AFF0;
  v14 = &v18;
  v9 = v16;
  v13 = v9;
  SBIconViewQueryingHandleMethodRecursion(self, a4, (uint64_t)a2, v15, v12);
  v10 = (id)v19[5];

  _Block_object_dispose(&v18, 8);
  return v10;
}

BOOL __57__SBHLibraryViewController_firstIconViewForIcon_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;

  objc_msgSend(a2, "firstIconViewForIcon:options:", *(_QWORD *)(a1 + 32), a3);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

BOOL __57__SBHLibraryViewController_firstIconViewForIcon_options___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "firstIconViewForIcon:", *(_QWORD *)(a1 + 32));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

  return *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40) != 0;
}

- (BOOL)isDisplayingIcon:(id)a3 options:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v8 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__SBHLibraryViewController_isDisplayingIcon_options___block_invoke;
  v14[3] = &unk_1E8D8AFC8;
  v16 = &v17;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __53__SBHLibraryViewController_isDisplayingIcon_options___block_invoke_2;
  v11[3] = &unk_1E8D8AFF0;
  v13 = &v17;
  v9 = v15;
  v12 = v9;
  SBIconViewQueryingHandleMethodRecursion(self, a4, (uint64_t)a2, v14, v11);
  LOBYTE(a4) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return a4;
}

uint64_t __53__SBHLibraryViewController_isDisplayingIcon_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "isDisplayingIcon:options:", *(_QWORD *)(a1 + 32), a3);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __53__SBHLibraryViewController_isDisplayingIcon_options___block_invoke_2(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "isDisplayingIcon:", *(_QWORD *)(a1 + 32));
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (BOOL)isDisplayingIconView:(id)a3 options:(unint64_t)a4
{
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  _QWORD v14[4];
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  char v20;

  v7 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v8 = MEMORY[0x1E0C809B0];
  v20 = 0;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __57__SBHLibraryViewController_isDisplayingIconView_options___block_invoke;
  v14[3] = &unk_1E8D8AFC8;
  v16 = &v17;
  v15 = v7;
  v11[0] = v8;
  v11[1] = 3221225472;
  v11[2] = __57__SBHLibraryViewController_isDisplayingIconView_options___block_invoke_2;
  v11[3] = &unk_1E8D8AFF0;
  v13 = &v17;
  v9 = v15;
  v12 = v9;
  SBIconViewQueryingHandleMethodRecursion(self, a4, (uint64_t)a2, v14, v11);
  LOBYTE(a4) = *((_BYTE *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return a4;
}

uint64_t __57__SBHLibraryViewController_isDisplayingIconView_options___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "isDisplayingIconView:options:", *(_QWORD *)(a1 + 32), a3);
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

uint64_t __57__SBHLibraryViewController_isDisplayingIconView_options___block_invoke_2(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "isDisplayingIconView:", *(_QWORD *)(a1 + 32));
  return *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  id WeakRetained;
  void *v5;

  WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);
  objc_msgSend(WeakRetained, "dequeueReusableIconViewOfClass:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)recycleIconView:(id)a3
{
  SBIconViewProviding **p_iconViewProvider;
  id v4;
  id WeakRetained;

  p_iconViewProvider = &self->_iconViewProvider;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_iconViewProvider);
  objc_msgSend(WeakRetained, "recycleIconView:", v4);

}

- (BOOL)isIconViewRecycled:(id)a3
{
  SBIconViewProviding **p_iconViewProvider;
  id v4;
  id WeakRetained;
  char v6;

  p_iconViewProvider = &self->_iconViewProvider;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_iconViewProvider);
  v6 = objc_msgSend(WeakRetained, "isIconViewRecycled:", v4);

  return v6;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(v7, "setDelegate:", self);
  if ((objc_msgSend(v6, "isCategoryIcon") & 1) == 0
    && (objc_msgSend(v6, "isFolderIcon") & 1) == 0
    && (objc_msgSend(v6, "isAdditionalItemsIndicatorIcon") & 1) == 0)
  {
    objc_msgSend(v7, "setIconContentScalingEnabled:", 1);
  }

}

- (void)libraryPodFolderController:(id)a3 willLayoutDisplayedCategories:(unint64_t)a4
{
  void *v6;
  uint64_t v7;
  uint64_t v8;
  SBHLibrarySearchController *v9;
  uint64_t v10;
  SBHLibrarySearchController *v11;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    v8 = (unsigned __int16)-[SBFolder listGridSize](self->_categoriesFolder, "listGridSize");
    v9 = self->_containerViewController;
    v11 = v9;
    if (a4 <= 2 * (unint64_t)v8)
      v10 = 2;
    else
      v10 = v8 + 2 * (unint64_t)v8 < a4;
    -[SBHLibrarySearchController setSearchBarAppearance:](v9, "setSearchBarAppearance:", v10);

  }
}

- (void)libraryPodFolderControllerRequestsDismissal:(id)a3
{
  void *v4;
  int v5;
  void *v6;
  SBHLibraryPodFolderController *v7;

  v7 = (SBHLibraryPodFolderController *)a3;
  if (self->_podFolderViewController == v7)
  {
    -[SBHLibraryViewController behaviorDelegate](self, "behaviorDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "libraryViewControllerRequestsDismissal:", self);

  }
  else
  {
    -[SBNestingViewController nestedViewControllers](self, "nestedViewControllers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", v7);

    if (v5)
    {
      -[SBHLibraryViewController popNestedViewControllerAnimated:withCompletion:](self, "popNestedViewControllerAnimated:withCompletion:", 1, 0);
      -[SBHLibrarySearchController resetSearchController:clearSearchResults:resetSearchBarTransformAndAlpha:](self->_containerViewController, "resetSearchController:clearSearchResults:resetSearchBarTransformAndAlpha:", 1, 0, 1);
    }
  }

}

- (void)pushNestedViewController:(id)a3 animated:(BOOL)a4 withCompletion:(id)a5
{
  _BOOL8 v6;
  id v8;
  void (**v9)(id, _QWORD);
  void *v10;
  void *v11;
  int v12;
  void *v13;
  SBHomeScreenIconTransitionAnimator *currentTransitionAnimator;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  BOOL v19;
  void *v20;
  void *v21;
  int v22;
  NSMutableArray *currentExpandCompletions;
  NSMutableArray *v24;
  NSMutableArray *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;
  _QWORD v30[5];
  id v31;

  v6 = a4;
  v8 = a3;
  v9 = (void (**)(id, _QWORD))a5;
  -[SBHLibraryViewController traitCollection](self, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "preferredContentSizeCategory");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "isEqualToString:", *MEMORY[0x1E0DC48B8]);

  if (v12)
  {
    objc_msgSend(v8, "traitOverrides");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPreferredContentSizeCategory:", *MEMORY[0x1E0DC48C0]);

  }
  currentTransitionAnimator = self->_currentTransitionAnimator;
  if (currentTransitionAnimator)
  {
    if (-[SBHomeScreenIconTransitionAnimator currentOperation](currentTransitionAnimator, "currentOperation") == 1)
    {
      objc_opt_class();
      -[SBHomeScreenIconTransitionAnimator childViewController](self->_currentTransitionAnimator, "childViewController");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      SBFSafeCast();
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      objc_opt_class();
      SBFSafeCast();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = (void *)v17;
      if (v16)
        v19 = v17 == 0;
      else
        v19 = 1;
      if (v19
        || (objc_msgSend(v16, "folder"),
            v20 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v18, "folder"),
            v21 = (void *)objc_claimAutoreleasedReturnValue(),
            v22 = objc_msgSend(v20, "isEqual:", v21),
            v21,
            v20,
            !v22))
      {
        if (-[BSEventQueue isEmpty](self->_transitionEventQueue, "isEmpty"))
        {
          v30[0] = MEMORY[0x1E0C809B0];
          v30[1] = 3221225472;
          v30[2] = __77__SBHLibraryViewController_pushNestedViewController_animated_withCompletion___block_invoke;
          v30[3] = &unk_1E8D84EF0;
          v30[4] = self;
          v31 = v8;
          -[SBHLibraryViewController _enqueueTransitionName:withHandler:](self, "_enqueueTransitionName:withHandler:", CFSTR("Request to open a folder while another folder is still closing"), v30);

        }
        -[SBHomeScreenIconTransitionAnimator completeImmediately](self->_currentTransitionAnimator, "completeImmediately");
        if (v9)
          v9[2](v9, 0);
      }
      else
      {
        if (v9)
        {
          currentExpandCompletions = self->_currentExpandCompletions;
          if (!currentExpandCompletions)
          {
            v24 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
            v25 = self->_currentExpandCompletions;
            self->_currentExpandCompletions = v24;

            currentExpandCompletions = self->_currentExpandCompletions;
          }
          v26 = (void *)objc_msgSend(v9, "copy");
          v27 = _Block_copy(v26);
          -[NSMutableArray addObject:](currentExpandCompletions, "addObject:", v27);

        }
        -[SBHLibraryViewController _notifyObserversWillPresentFolderController:](self, "_notifyObserversWillPresentFolderController:", v16);
        -[SBHomeScreenIconTransitionAnimator reverse](self->_currentTransitionAnimator, "reverse");
        if (-[SBHLibraryViewController isPresentingSearch](self, "isPresentingSearch"))
          -[SBHLibraryViewController dismissSearch](self, "dismissSearch");
      }

    }
    else if (v9)
    {
      v9[2](v9, 0);
    }
  }
  else
  {
    -[SBHLibraryViewController _wrappedCompletionBlockForNestedTransitionWithCompletion:](self, "_wrappedCompletionBlockForNestedTransitionWithCompletion:", v9);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29.receiver = self;
    v29.super_class = (Class)SBHLibraryViewController;
    -[SBNestingViewController pushNestedViewController:animated:withCompletion:](&v29, sel_pushNestedViewController_animated_withCompletion_, v8, v6, v28);

  }
}

_QWORD *__77__SBHLibraryViewController_pushNestedViewController_animated_withCompletion___block_invoke(uint64_t a1)
{
  _QWORD *result;

  result = *(_QWORD **)(a1 + 32);
  if (!result[161])
    return (_QWORD *)objc_msgSend(result, "pushNestedViewController:animated:withCompletion:", *(_QWORD *)(a1 + 40), 1, 0);
  return result;
}

- (void)popNestedViewControllerAnimated:(BOOL)a3 withCompletion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(id, _QWORD);
  SBHomeScreenIconTransitionAnimator *currentTransitionAnimator;
  void *v8;
  NSMutableArray *currentCollapseCompletions;
  NSMutableArray *v10;
  NSMutableArray *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_super v16;

  v4 = a3;
  v6 = (void (**)(id, _QWORD))a4;
  currentTransitionAnimator = self->_currentTransitionAnimator;
  if (currentTransitionAnimator)
  {
    if (-[SBHomeScreenIconTransitionAnimator currentOperation](currentTransitionAnimator, "currentOperation"))
    {
      if (v6)
        v6[2](v6, 0);
    }
    else
    {
      if (v6)
      {
        currentCollapseCompletions = self->_currentCollapseCompletions;
        if (!currentCollapseCompletions)
        {
          v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v11 = self->_currentCollapseCompletions;
          self->_currentCollapseCompletions = v10;

          currentCollapseCompletions = self->_currentCollapseCompletions;
        }
        v12 = (void *)objc_msgSend(v6, "copy");
        v13 = _Block_copy(v12);
        -[NSMutableArray addObject:](currentCollapseCompletions, "addObject:", v13);

      }
      objc_opt_class();
      -[SBHomeScreenIconTransitionAnimator childViewController](self->_currentTransitionAnimator, "childViewController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      SBFSafeCast();
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[SBHLibraryViewController _notifyObserversWillDismissFolderController:](self, "_notifyObserversWillDismissFolderController:", v15);
      -[SBHomeScreenIconTransitionAnimator reverse](self->_currentTransitionAnimator, "reverse");

    }
  }
  else
  {
    -[SBHLibraryViewController _wrappedCompletionBlockForNestedTransitionWithCompletion:](self, "_wrappedCompletionBlockForNestedTransitionWithCompletion:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v16.receiver = self;
    v16.super_class = (Class)SBHLibraryViewController;
    -[SBNestingViewController popNestedViewControllerAnimated:withCompletion:](&v16, sel_popNestedViewControllerAnimated_withCompletion_, v4, v8);

  }
}

- (id)nestingViewController:(id)a3 animationControllerForOperation:(int64_t)a4 onViewController:(id)a5 animated:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  SBHomeScreenIconTransitionAnimator *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  __objc2_class *v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  SBHLibraryPodIconZoomAnimator *v28;
  SBHLibraryPodIconZoomAnimator *v29;
  void *v30;
  void *v31;
  void *v33;
  SBHLibraryPodFolderController *v34;
  objc_super v35;

  v6 = a6;
  v10 = a5;
  v35.receiver = self;
  v35.super_class = (Class)SBHLibraryViewController;
  -[SBNestingViewController nestingViewController:animationControllerForOperation:onViewController:animated:](&v35, sel_nestingViewController_animationControllerForOperation_onViewController_animated_, a3, a4, v10, v6);
  v11 = (SBHomeScreenIconTransitionAnimator *)objc_claimAutoreleasedReturnValue();
  if (v11)
    goto LABEL_20;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v11 = 0;
    goto LABEL_20;
  }
  v34 = self->_podFolderViewController;
  v12 = v10;
  objc_msgSend(v12, "folderDelegate");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "folder");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "icon");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHLibrarySearchController searchBar](self->_containerViewController, "searchBar");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14
    && (objc_msgSend(v14, "folder"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v16, "icons"),
        v17 = (void *)objc_claimAutoreleasedReturnValue(),
        v18 = objc_msgSend(v17, "count"),
        v17,
        v16,
        v18))
  {
    v19 = 0;
    if (!v6)
    {
LABEL_6:
      v20 = SBHLibraryPodImmediateAnimator;
      goto LABEL_13;
    }
  }
  else
  {
    SBLogLibrary();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SBHLibraryViewController nestingViewController:animationControllerForOperation:onViewController:animated:].cold.1((uint64_t)v14, v21, v22, v23, v24, v25, v26, v27);

    v19 = 1;
    if (!v6)
      goto LABEL_6;
  }
  if ((v19 | UIAccessibilityIsReduceMotionEnabled()) != 1)
  {
    v28 = -[SBHLibraryPodIconZoomAnimator initWithAnimationContainer:innerFolderController:folderIcon:searchBar:libraryViewController:]([SBHLibraryPodIconZoomAnimator alloc], "initWithAnimationContainer:innerFolderController:folderIcon:searchBar:libraryViewController:", v34, v12, v14, v15, self);
    goto LABEL_15;
  }
  v20 = SBHLibraryPodFadeAnimator;
LABEL_13:
  v28 = (SBHLibraryPodIconZoomAnimator *)objc_msgSend([v20 alloc], "initWithAnimationContainer:innerFolderController:searchBar:", v34, v12, v15);
LABEL_15:
  v29 = v28;
  if (v28)
  {
    v11 = -[SBHomeScreenIconTransitionAnimator initWithIconAnimator:childViewController:operation:]([SBHomeScreenIconTransitionAnimator alloc], "initWithIconAnimator:childViewController:operation:", v28, v12, a4 != 1);
    -[SBHomeScreenIconTransitionAnimator setInitialDelay:](v11, "setInitialDelay:", 0.0);
    -[SBHLibraryViewController homeScreenIconTransitionAnimatorDelegate](self, "homeScreenIconTransitionAnimatorDelegate");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHomeScreenIconTransitionAnimator setDelegate:](v11, "setDelegate:", v30);

    v31 = v33;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v33, "folderController:willUseIconTransitionAnimator:forOperation:onViewController:animated:", self, v11, a4, v12, v6);
  }
  else
  {
    v11 = 0;
    v31 = v33;
  }

LABEL_20:
  return v11;
}

- (void)nestingViewController:(id)a3 willPerformOperation:(int64_t)a4 onViewController:(id)a5 withTransitionCoordinator:(id)a6
{
  SBHLibraryViewController *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  _QWORD v17[5];
  id v18;
  int64_t v19;
  _QWORD v20[5];
  id v21;
  int64_t v22;
  _QWORD v23[5];
  id v24;
  objc_super v25;

  v10 = (SBHLibraryViewController *)a3;
  v11 = a5;
  v12 = a6;
  v25.receiver = self;
  v25.super_class = (Class)SBHLibraryViewController;
  -[SBNestingViewController nestingViewController:willPerformOperation:onViewController:withTransitionCoordinator:](&v25, sel_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator_, v10, a4, v11, v12);
  -[SBHLibraryViewController _setupReducedTransparencyBackgroundViewIfNeeded](self, "_setupReducedTransparencyBackgroundViewIfNeeded");
  if (v10 == self)
  {
    -[BSEventQueue acquireLockForReason:](v10->_transitionEventQueue, "acquireLockForReason:", CFSTR("performingTransitionOperation"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke;
    v23[3] = &unk_1E8D8B018;
    v23[4] = v10;
    v24 = v13;
    v14 = v13;
    objc_msgSend(v12, "animateAlongsideTransition:completion:", 0, v23);

  }
  if ((unint64_t)(a4 - 1) <= 1)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = v11;
      objc_msgSend(v15, "setEditing:animated:", -[SBHLibraryViewController isEditing](self, "isEditing"), 1);
      if (a4 == 1)
      {
        -[SBHLibraryViewController _notifyObserversWillPresentFolderController:](self, "_notifyObserversWillPresentFolderController:", v15);
        if (-[SBHLibraryViewController isPresentingSearch](self, "isPresentingSearch"))
          -[SBHLibraryViewController dismissSearch](self, "dismissSearch");
      }
      else
      {
        -[SBHLibraryViewController _notifyObserversWillDismissFolderController:](self, "_notifyObserversWillDismissFolderController:", v15);
      }
      v16 = MEMORY[0x1E0C809B0];
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v20[2] = __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3;
      v20[3] = &unk_1E8D8B040;
      v20[4] = self;
      v22 = a4;
      v21 = v15;
      v17[0] = v16;
      v17[1] = 3221225472;
      v17[2] = __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4;
      v17[3] = &unk_1E8D8B040;
      v18 = v21;
      v19 = a4;
      v17[4] = self;
      objc_msgSend(v12, "animateAlongsideTransition:completion:", v20, v17);

    }
  }

}

void __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[5];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "setCurrentTransitionAnimator:", 0);
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2;
  v3[3] = &unk_1E8D84EF0;
  v2 = *(void **)(a1 + 40);
  v3[4] = *(_QWORD *)(a1 + 32);
  v4 = v2;
  dispatch_async(MEMORY[0x1E0C80D38], v3);

}

uint64_t __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1280), "relinquishLock:", *(_QWORD *)(a1 + 40));
}

void __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  double v11;
  id v12;
  id v13;

  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 1288);
  v13 = v3;
  if (v4)
    v5 = objc_msgSend(v4, "currentOperation");
  else
    v5 = *(_QWORD *)(a1 + 48) != 1;
  if (v5 == 1)
  {
    v11 = 0.0;
LABEL_15:
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1128), "setAlpha:", v11);
    goto LABEL_16;
  }
  if (!v5)
  {
    objc_opt_class();
    SBFSafeCast();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 32), "_shouldUseReduceTransparencyBackgroundView"))
    {
      objc_msgSend(v6, "contentView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_opt_class();
      v9 = v7;
      if (v8)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v10 = v9;
        else
          v10 = 0;
      }
      else
      {
        v10 = 0;
      }
      v12 = v10;

      objc_msgSend(v12, "setHidesFeatherBlur:", UIAccessibilityIsReduceTransparencyEnabled());
    }
    objc_msgSend(v6, "setPodFolderControllerDelegate:", *(_QWORD *)(a1 + 32));
    objc_msgSend(v6, "setLibraryCategoryMap:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1208));

    v11 = 1.0;
    goto LABEL_15;
  }
LABEL_16:

}

void __114__SBHLibraryViewController_nestingViewController_willPerformOperation_onViewController_withTransitionCoordinator___block_invoke_4(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;

  v3 = a2;
  v4 = *(_QWORD *)(a1 + 48);
  if (v4 == 2)
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_notifyObserversDidDismissFolderController:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "_teardownReducedTransparencyBackgroundView");
    goto LABEL_5;
  }
  if (v4 == 1)
  {
    v5 = v3;
    objc_msgSend(*(id *)(a1 + 32), "_flushPendingLibraryCategoryMapUpdateIfNeeded");
    objc_msgSend(*(id *)(a1 + 32), "_updateReduceTransparency");
LABEL_5:
    v3 = v5;
  }

}

- (id)iconView:(id)a3 labelImageWithParameters:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconView:labelImageWithParameters:", v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (int64_t)iconViewComponentBackgroundViewTypeForIconView:(id)a3
{
  return 6;
}

- (BOOL)iconShouldAllowTap:(id)a3
{
  id v3;
  int v4;
  void *v5;
  int v6;

  v3 = a3;
  v4 = objc_msgSend(v3, "isEditing");
  objc_msgSend(v3, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    LOBYTE(v6) = objc_msgSend(v5, "isAdditionalItemsIndicatorIcon");
  else
    v6 = objc_msgSend(v5, "isCategoryIcon") ^ 1;

  return v6;
}

- (void)iconTapped:(id)a3 modifierFlags:(int64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "iconTapped:modifierFlags:", v9, a4);
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "iconTapped:", v9);
  }
  objc_msgSend(v9, "setHighlighted:", 0);
  objc_msgSend(v9, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController _notifyObserversOfAppLaunchOfIcon:fromLocation:](self, "_notifyObserversOfAppLaunchOfIcon:fromLocation:", v7, v8);

}

- (id)customImageViewControllerForIconView:(id)a3
{
  return -[SBHLibraryViewController _customImageViewControllerForCategoryPodIconView:usingInternalCache:](self, "_customImageViewControllerForCategoryPodIconView:usingInternalCache:", a3, 1);
}

- (id)_customImageViewControllerForCategoryPodIconView:(id)a3 usingInternalCache:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a4;
  objc_msgSend(a3, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "isCategoryIcon"))
  {
    objc_msgSend(v6, "category");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "categoryIdentifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      -[SBHLibraryViewController _iconViewControllerForCategoryIdentifier:](self, "_iconViewControllerForCategoryIdentifier:", v8);
    else
      -[SBHLibraryViewController _createIconViewControllerForCategoryIdentifier:](self, "_createIconViewControllerForCategoryIdentifier:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryViewController _iconLocationForCategoryIdentifier:](self, "_iconLocationForCategoryIdentifier:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "updateCategory:location:", v7, v10);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_iconViewControllerForCategoryIdentifier:(id)a3
{
  id v4;
  NSMapTable *iconViewControllerForCategoryIdentifier;
  NSMapTable *v6;
  NSMapTable *v7;
  void *v8;

  v4 = a3;
  iconViewControllerForCategoryIdentifier = self->_iconViewControllerForCategoryIdentifier;
  if (!iconViewControllerForCategoryIdentifier)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_iconViewControllerForCategoryIdentifier;
    self->_iconViewControllerForCategoryIdentifier = v6;

    iconViewControllerForCategoryIdentifier = self->_iconViewControllerForCategoryIdentifier;
  }
  -[NSMapTable objectForKey:](iconViewControllerForCategoryIdentifier, "objectForKey:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    -[SBHLibraryViewController _createIconViewControllerForCategoryIdentifier:](self, "_createIconViewControllerForCategoryIdentifier:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](self->_iconViewControllerForCategoryIdentifier, "setObject:forKey:", v8, v4);
  }

  return v8;
}

- (id)_createIconViewControllerForCategoryIdentifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  SBHLibraryCategoryIconViewController *v7;
  void *v8;

  -[SBHLibraryViewController listLayoutProvider](self, "listLayoutProvider", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController iconImageCache](self, "iconImageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController folderIconImageCache](self, "folderIconImageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc_init(SBHLibraryCategoryIconViewController);
  -[SBHLibraryCategoryIconViewController setIconViewProvider:](v7, "setIconViewProvider:", self);
  -[SBHLibraryCategoryIconViewController setListLayoutProvider:](v7, "setListLayoutProvider:", v4);
  -[SBHLibraryCategoryIconViewController setIconImageCache:](v7, "setIconImageCache:", v5);
  -[SBHLibraryCategoryIconViewController setFolderIconImageCache:](v7, "setFolderIconImageCache:", v6);
  -[SBHLibraryViewController presenter](self, "presenter");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryCategoryIconViewController setNeedsBackgroundBlur:](v7, "setNeedsBackgroundBlur:", objc_msgSend(v8, "hasBackgroundBlur") ^ 1);

  return v7;
}

- (void)_precacheIconViewControllersForCategories:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v24;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v24 != v7)
          objc_enumerationMutation(v4);
        v9 = -[SBHLibraryViewController _iconViewControllerForCategoryIdentifier:](self, "_iconViewControllerForCategoryIdentifier:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v6);
  }
  v10 = (void *)MEMORY[0x1E0C99E20];
  -[NSMapTable keyEnumerator](self->_iconViewControllerForCategoryIdentifier, "keyEnumerator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setWithArray:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v13, "minusSet:", v4);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v20;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v20 != v17)
          objc_enumerationMutation(v14);
        -[NSMapTable removeObjectForKey:](self->_iconViewControllerForCategoryIdentifier, "removeObjectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v18++), (_QWORD)v19);
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
    }
    while (v16);
  }

}

- (id)_iconLocationForCategoryIdentifier:(id)a3
{
  id v3;
  __CFString *v4;
  __CFString **v5;
  __CFString *v6;

  v3 = a3;
  v4 = CFSTR("SBIconLocationAppLibraryCategoryPod");
  if (objc_msgSend(v3, "predictionCategoryID") == 3)
  {
    v5 = SBIconLocationAppLibraryCategoryPodSuggestions;
LABEL_5:
    v6 = *v5;

    v4 = v6;
    goto LABEL_6;
  }
  if (objc_msgSend(v3, "predictionCategoryID") == 4)
  {
    v5 = SBIconLocationAppLibraryCategoryPodRecents;
    goto LABEL_5;
  }
LABEL_6:

  return v4;
}

- (void)iconViewWasRecycled:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconViewWasRecycled:", v4);

}

- (void)iconViewWasDiscarded:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconViewWasDiscarded:", v4);

}

- (id)draggingDelegateForIconView:(id)a3
{
  id v4;
  void *v5;
  SBHLibraryViewController *v6;
  SBHLibraryViewController *v8;

  v4 = a3;
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isCategoryIcon") & 1) != 0
    || (objc_msgSend(v5, "isFolderIcon") & 1) != 0
    || objc_msgSend(v5, "isAdditionalItemsIndicatorIcon"))
  {
    v6 = self;
  }
  else
  {
    -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
    v8 = (SBHLibraryViewController *)(id)objc_claimAutoreleasedReturnValue();
    v6 = v8;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[SBHLibraryViewController draggingDelegateForIconView:](v8, "draggingDelegateForIconView:", v4);
      v6 = (SBHLibraryViewController *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

- (id)shortcutsDelegateForIconView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  SBHLibraryViewController *v8;
  SBHLibraryViewController *v9;

  v4 = a3;
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isCategoryIcon"))
  {

  }
  else
  {
    objc_msgSend(v4, "icon");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isFolderIcon");

    if (!v7)
    {
      -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
      v8 = (SBHLibraryViewController *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v8 = self;
LABEL_6:
  v9 = v8;

  return v9;
}

- (BOOL)iconViewShouldBeginShortcutsPresentation:(id)a3
{
  return 0;
}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  return 0;
}

- (BOOL)iconView:(id)a3 canAddDragItemsToSession:(id)a4
{
  return 0;
}

- (BOOL)iconShouldAllowCloseBoxTap:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "iconShouldAllowCloseBoxTap:", v4);

  return v6;
}

- (void)iconCloseBoxTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconCloseBoxTapped:", v4);

}

- (BOOL)iconViewDisplaysCloseBox:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "iconViewDisplaysCloseBox:", v4);

  return v6;
}

uint64_t __56__SBHLibraryViewController_iconViewDisplaysAccessories___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  SBFSafeCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "libraryCategoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  return v7;
}

uint64_t __56__SBHLibraryViewController_iconViewDisplaysAccessories___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a2;
  objc_opt_class();
  objc_msgSend(v3, "folder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  SBFSafeCast();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "libraryCategoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", *(_QWORD *)(a1 + 32));

  return v7;
}

- (BOOL)iconViewCanBecomeFocused:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;

  v4 = a3;
  objc_msgSend(v4, "icon");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isCategoryIcon");

  if ((v6 & 1) != 0)
  {
    v7 = 0;
  }
  else
  {
    -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      v7 = objc_msgSend(v8, "iconViewCanBecomeFocused:", v4);
    else
      v7 = 0;

  }
  return v7;
}

- (unint64_t)focusEffectTypeForIconView:(id)a3
{
  return 1;
}

- (id)_additionalItemsIndicatorIconViewForFolderController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  void *v15;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_opt_class();
  objc_msgSend(v4, "folder");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "libraryCategoryIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__14;
    v27 = __Block_byref_object_dispose__14;
    v28 = 0;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    -[SBFolderController iconListViews](self->_podFolderViewController, "iconListViews");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
    if (v8)
    {
      v9 = *(_QWORD *)v20;
      v10 = MEMORY[0x1E0C809B0];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v20 != v9)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
          v16[0] = v10;
          v16[1] = 3221225472;
          v16[2] = __81__SBHLibraryViewController__additionalItemsIndicatorIconViewForFolderController___block_invoke;
          v16[3] = &unk_1E8D87318;
          v17 = v6;
          v18 = &v23;
          objc_msgSend(v12, "enumerateIconViewsUsingBlock:", v16);

        }
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v29, 16);
      }
      while (v8);
    }

    v13 = (id)v24[5];
    _Block_object_dispose(&v23, 8);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

void __81__SBHLibraryViewController__additionalItemsIndicatorIconViewForFolderController___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  objc_msgSend(a2, "customIconImageViewController");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "iconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "icons");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bs_firstObjectOfClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "category");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "categoryIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", *(_QWORD *)(a1 + 32));

  if (v11)
  {
    objc_msgSend(v6, "iconViewForIcon:", v8);
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

    *a4 = 1;
  }

}

- (int64_t)closeBoxTypeForIconView:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "closeBoxTypeForIconView:", v4);

  return v6;
}

- (BOOL)iconView:(id)a3 editingModeGestureRecognizerDidFire:(id)a4
{
  id v6;
  id v7;
  void *v8;
  char v9;

  v6 = a4;
  v7 = a3;
  -[SBHLibraryViewController iconViewDelegate](self, "iconViewDelegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "iconView:editingModeGestureRecognizerDidFire:", v7, v6);

  return v9;
}

- (void)setContentVisibility:(unint64_t)a3
{
  void *v5;

  if (self->_contentVisibility != a3)
  {
    self->_contentVisibility = a3;
    -[SBHLibraryViewController folderController](self, "folderController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setContentVisibility:", a3);

    if (a3 == 2 && -[SBHLibraryViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))
    {
      -[SBHLibraryViewController _startLibraryViewControllerDismissalTimer:](self, "_startLibraryViewControllerDismissalTimer:", CFSTR("App Library is hidden!"));
      -[SBHLibraryViewController _dismissExpandedPods:completion:](self, "_dismissExpandedPods:completion:", 0, 0);
    }
    else
    {
      -[SBHLibraryViewController _invalidateLibraryViewControllerDismissalTimer](self, "_invalidateLibraryViewControllerDismissalTimer");
    }
  }
}

- (void)overlayControllerDidBeginChangingPresentationProgress:(id)a3
{
  if (-[SBHLibraryViewController isPresentingSearch](self, "isPresentingSearch", a3))
    -[SBHLibraryViewController dismissSearch](self, "dismissSearch");
}

- (void)overlayController:(id)a3 visibilityDidChange:(BOOL)a4
{
  BSInvalidatable *libraryPrewarmAssertion;

  if (!a4)
  {
    -[BSInvalidatable invalidate](self->_libraryPrewarmAssertion, "invalidate", a3);
    libraryPrewarmAssertion = self->_libraryPrewarmAssertion;
    self->_libraryPrewarmAssertion = 0;

  }
}

- (void)overlayController:(id)a3 didChangePresentationProgress:(double)a4 newPresentationProgress:(double)a5 fromLeading:(BOOL)a6
{
  id v9;
  BSInvalidatable *v10;
  BSInvalidatable *libraryPrewarmAssertion;
  id v12;

  v9 = a3;
  if (a5 >= 1.0 && !a6 && !self->_libraryPrewarmAssertion)
  {
    v12 = v9;
    -[SBHLibraryViewController acquireLibrarySearchPrewarmAssertionForReason:](self, "acquireLibrarySearchPrewarmAssertionForReason:", CFSTR("Library View Controller is presented"));
    v10 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    libraryPrewarmAssertion = self->_libraryPrewarmAssertion;
    self->_libraryPrewarmAssertion = v10;

    v9 = v12;
  }

}

- (void)_enqueueTransitionName:(id)a3 withHandler:(id)a4
{
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x1E0D01778], "eventWithName:handler:", a3, a4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController transitionEventQueue](self, "transitionEventQueue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "executeOrInsertEvent:atPosition:", v6, 1);

}

- (id)_wrappedCompletionBlockForNestedTransitionWithCompletion:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  _QWORD aBlock[4];
  id v10;
  id v11;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __85__SBHLibraryViewController__wrappedCompletionBlockForNestedTransitionWithCompletion___block_invoke;
  aBlock[3] = &unk_1E8D8B090;
  objc_copyWeak(&v11, &location);
  v10 = v4;
  v5 = v4;
  v6 = _Block_copy(aBlock);
  v7 = _Block_copy(v6);

  objc_destroyWeak(&v11);
  objc_destroyWeak(&location);
  return v7;
}

void __85__SBHLibraryViewController__wrappedCompletionBlockForNestedTransitionWithCompletion___block_invoke(uint64_t a1, uint64_t a2)
{
  id *WeakRetained;
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  uint64_t v26;
  void *v27;
  char v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t m;
  uint64_t v36;
  void *v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _BYTE v55[128];
  _BYTE v56[128];
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v5 = *(_QWORD *)(a1 + 32);
  if (v5)
    (*(void (**)(uint64_t, uint64_t))(v5 + 16))(v5, a2);
  if (WeakRetained)
  {
    v6 = WeakRetained[162];
    v7 = WeakRetained[163];
    v8 = WeakRetained[162];
    WeakRetained[162] = 0;

    v9 = WeakRetained[163];
    WeakRetained[163] = 0;

    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v52 != v13)
            objc_enumerationMutation(v10);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * i) + 16))();
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v51, v58, 16);
      }
      while (v12);
    }

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v15 = v7;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v48;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v48 != v18)
            objc_enumerationMutation(v15);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j) + 16))();
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      }
      while (v17);
    }
    v38 = v10;

    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    objc_msgSend(WeakRetained[138], "keyEnumerator");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "allObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v44;
      do
      {
        for (k = 0; k != v23; ++k)
        {
          if (*(_QWORD *)v44 != v24)
            objc_enumerationMutation(v21);
          v26 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * k);
          objc_msgSend(WeakRetained, "nestedViewControllers");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v28 = objc_msgSend(v27, "containsObject:", v26);

          if ((v28 & 1) == 0)
          {
            objc_msgSend(WeakRetained[138], "objectForKey:", v26);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(WeakRetained, "_notifyObserversWillDismissFolderController:", v26);
            objc_msgSend(WeakRetained, "_notifyObserversDidDismissFolderController:", v26);
            objc_msgSend(v29, "_updateAccessoryViewAnimated:", 1);

          }
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v43, v56, 16);
      }
      while (v23);
    }

    v41 = 0u;
    v42 = 0u;
    v39 = 0u;
    v40 = 0u;
    objc_msgSend(WeakRetained[139], "keyEnumerator");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "allObjects");
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v40;
      do
      {
        for (m = 0; m != v33; ++m)
        {
          if (*(_QWORD *)v40 != v34)
            objc_enumerationMutation(v31);
          v36 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * m);
          objc_msgSend(WeakRetained[139], "objectForKey:", v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(WeakRetained, "_notifyObserversDidDismissFolderController:", v36);
          objc_msgSend(v37, "_updateAccessoryViewAnimated:", 1);

        }
        v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v39, v55, 16);
      }
      while (v33);
    }

  }
}

- (void)enumerateViewControllersUsingBlock:(id)a3
{
  void (**v4)(id, SBHLibraryPodFolderController *, _BYTE *);
  SBHIconLibraryTableViewController *iconTableViewController;
  SBHLibraryPodFolderController *podFolderViewController;
  char v7;

  v4 = (void (**)(id, SBHLibraryPodFolderController *, _BYTE *))a3;
  v7 = 0;
  if (!-[SBHLibrarySearchController isActive](self->_containerViewController, "isActive")
    || (iconTableViewController = self->_iconTableViewController) == 0
    || (v4[2](v4, (SBHLibraryPodFolderController *)iconTableViewController, &v7), !v7))
  {
    if (!-[SBHLibrarySearchController isActive](self->_containerViewController, "isActive"))
    {
      podFolderViewController = self->_podFolderViewController;
      if (podFolderViewController)
        v4[2](v4, podFolderViewController, &v7);
    }
  }

}

- (void)_enumerateAllViewControllersUsingBlock:(id)a3
{
  id v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  SBHLibraryPodFolderController *podFolderViewController;
  SBHIconLibraryTableViewController *iconTableViewController;
  char v8;

  v4 = a3;
  v5 = (void (**)(_QWORD, _QWORD, _QWORD))v4;
  v8 = 0;
  podFolderViewController = self->_podFolderViewController;
  if (!podFolderViewController
    || ((*((void (**)(id, SBHLibraryPodFolderController *, char *))v4 + 2))(v4, podFolderViewController, &v8),
        !v8))
  {
    iconTableViewController = self->_iconTableViewController;
    if (iconTableViewController)
      ((void (**)(_QWORD, SBHIconLibraryTableViewController *, char *))v5)[2](v5, iconTableViewController, &v8);
  }

}

- (void)_updateViewControllerLegibility
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;

  -[SBHLibraryViewController effectiveLegibilitySettings](self, "effectiveLegibilitySettings");
  v3 = objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[SBHLibraryViewController traitCollection](self, "traitCollection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceStyle");

    if (v5 == 2)
      v6 = 1;
    else
      v6 = 2;
    objc_msgSend(MEMORY[0x1E0DC4270], "sharedInstanceForStyle:", v6);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  v7 = (id)v3;
  -[SBFolderController setLegibilitySettings:](self->_podFolderViewController, "setLegibilitySettings:", v3);

}

- (void)_setupIconTableViewController:(BOOL)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  SBIconListLayoutProvider *v7;
  SBHIconImageCache *v8;
  void *v9;
  void *v10;
  SBHLibraryCategoryMapProvider *v11;
  _SBHLibraryCollectionOfModelThings *v12;
  NSMapTable *iconViewControllerForCategoryIdentifier;
  SBHLibraryCategoriesRootFolder *categoriesFolder;
  SBHLibraryCategoriesRootFolder *v15;
  SBHIconLibraryTableViewController *iconTableViewController;
  SBHIconLibraryTableViewController *v17;
  SBHIconLibraryTableViewController *v18;
  SBHIconLibraryTableViewController *v19;
  void *v20;
  SBHLibraryCategoriesRootFolder *v21;
  SBHLibraryCategoriesRootFolder *v22;
  id v23;
  SBHLibraryCategoriesRootFolder *v24;
  void *v25;
  void *v26;
  SBHLibraryCategoriesRootFolder *v27;
  void *v28;
  SBHLibraryPodFolderControllerConfiguration *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  SBHLibraryPodFolderController *podFolderViewController;
  SBHLibraryPodFolderController *v34;
  SBHLibraryPodFolderController *v35;
  SBHLibraryPodFolderController *v36;
  void *v37;
  SBHLibrarySearchController *containerViewController;
  void *v39;
  SBHLibrarySearchController *v40;
  void *v41;
  uint64_t v42;
  SBHLibrarySearchController *v43;
  SBHLibrarySearchController *v44;
  SBHLibrarySearchController *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  NSArray *v56;
  NSArray *containerViewControllerConstraints;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSObject *v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  SBHLibraryPodFolderControllerConfiguration *v76;
  void *v77;
  void *v78;
  uint64_t v79;
  void *v80;
  SBHIconImageCache *v81;
  SBIconListLayoutProvider *v82;
  void *v83;
  void *v84;
  void *v85;
  int v86;
  _BOOL4 v87;
  _SBHLibraryCollectionOfModelThings *v88;
  id v89;
  void *v90;
  void *v91;
  _QWORD v92[4];
  SBIconListLayoutProvider *v93;
  SBHIconImageCache *v94;
  id v95;
  id v96;
  id v97;
  _QWORD v98[6];

  v87 = a3;
  v98[4] = *MEMORY[0x1E0C80C00];
  -[SBHLibraryViewController iconViewProvider](self, "iconViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController iconModel](self, "iconModel");
  v5 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v5, "rootFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = self->_listLayoutProvider;
  v8 = self->_iconImageCache;
  -[SBHLibraryViewController effectiveLegibilitySettings](self, "effectiveLegibilitySettings");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController iconModel](self, "iconModel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController folderIconImageCache](self, "folderIconImageCache");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = self->_categoryMapProvider;
  -[SBHLibraryViewController overrideIconImageAppearance](self, "overrideIconImageAppearance");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[_SBHLibraryCollectionOfModelThings initWithIconViewProvider:iconModel:rootFolder:listLayoutProvider:iconImageCache:folderIconImageCache:categoryMapProvider:]([_SBHLibraryCollectionOfModelThings alloc], "initWithIconViewProvider:iconModel:rootFolder:listLayoutProvider:iconImageCache:folderIconImageCache:categoryMapProvider:", v4, v9, v6, v7, v8, v10, v11);
  v97 = 0;
  LOBYTE(v5) = -[_SBHLibraryCollectionOfModelThings examineModelValidityWithError:](v12, "examineModelValidityWithError:", &v97);
  v89 = v97;
  if ((v5 & 1) == 0)
  {
    v88 = v12;
    SBLogLibrary();
    v63 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
      -[SBHLibraryViewController _setupIconTableViewController:].cold.1((uint64_t)v89, v63, v64, v65, v66, v67, v68, v69);
    goto LABEL_26;
  }
  if (!-[_SBHLibraryCollectionOfModelThings isEqual:](self->_model, "isEqual:", v12))
  {
    v83 = v6;
    objc_storeStrong((id *)&self->_model, v12);
    iconViewControllerForCategoryIdentifier = self->_iconViewControllerForCategoryIdentifier;
    self->_iconViewControllerForCategoryIdentifier = 0;

    categoriesFolder = self->_categoriesFolder;
    if (categoriesFolder)
    {
      -[SBRootFolder setDelegate:](categoriesFolder, "setDelegate:", 0);
      v15 = self->_categoriesFolder;
      self->_categoriesFolder = 0;

    }
    v88 = v12;
    v80 = v9;
    -[SBHLibraryViewController _dismissExpandedPods:completion:](self, "_dismissExpandedPods:completion:", 0, 0);
    iconTableViewController = self->_iconTableViewController;
    if (iconTableViewController)
    {
      -[SBHIconLibraryTableViewController setObserver:](iconTableViewController, "setObserver:", 0);
      v17 = self->_iconTableViewController;
      self->_iconTableViewController = 0;

    }
    v18 = objc_alloc_init(SBHIconLibraryTableViewController);
    v19 = self->_iconTableViewController;
    self->_iconTableViewController = v18;

    -[SBHIconLibraryTableViewController setObserver:](self->_iconTableViewController, "setObserver:", self);
    -[SBHIconLibraryTableViewController setListLayoutProvider:](self->_iconTableViewController, "setListLayoutProvider:", v7);
    v84 = v4;
    -[SBHIconLibraryTableViewController setIconViewProvider:](self->_iconTableViewController, "setIconViewProvider:", v4);
    -[SBHLibraryViewController iconLocation](self, "iconLocation");
    v79 = objc_claimAutoreleasedReturnValue();
    -[SBIconListLayoutProvider layoutForIconLocation:](v7, "layoutForIconLocation:");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    SBHIconListLayoutIconGridSizeClassSizes(v20);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = -[SBFolder initWithDisplayName:maxListCount:listGridSize:iconGridSizeClassSizes:]([SBHLibraryCategoriesRootFolder alloc], "initWithDisplayName:maxListCount:listGridSize:iconGridSizeClassSizes:", CFSTR("Categories Folder"), 1, 4294901764, v77);
    v22 = self->_categoriesFolder;
    self->_categoriesFolder = v21;

    -[SBRootFolder setModel:](self->_categoriesFolder, "setModel:", self->_iconModel);
    v23 = -[SBFolder addEmptyList](self->_categoriesFolder, "addEmptyList");
    v24 = self->_categoriesFolder;
    -[SBHIconModel rootFolder](self->_iconModel, "rootFolder");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "delegate");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBRootFolder setDelegate:](v24, "setDelegate:", v26);

    -[SBHLibraryCategoriesRootFolder setSupportsBadging:](self->_categoriesFolder, "setSupportsBadging:", -[SBHLibraryViewController allowsBadging](self, "allowsBadging"));
    v27 = self->_categoriesFolder;
    -[SBHLibraryViewController badgeBehaviorProvider](self, "badgeBehaviorProvider");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFolder setBadgeBehaviorProvider:](v27, "setBadgeBehaviorProvider:", v28);

    v29 = objc_alloc_init(SBHLibraryPodFolderControllerConfiguration);
    -[SBFolderControllerConfiguration setIconViewProvider:](v29, "setIconViewProvider:", self);
    -[SBFolderControllerConfiguration setListLayoutProvider:](v29, "setListLayoutProvider:", v7);
    -[SBFolderControllerConfiguration setIconImageCache:](v29, "setIconImageCache:", v8);
    -[SBFolderControllerConfiguration setFolderIconImageCache:](v29, "setFolderIconImageCache:", v10);
    -[SBFolderControllerConfiguration setLegibilitySettings:](v29, "setLegibilitySettings:", v91);
    -[SBHLibraryPodFolderControllerConfiguration setCategoryMapProvider:](v29, "setCategoryMapProvider:", v11);
    -[SBHLibraryPodFolderControllerConfiguration setCategoriesFolder:](v29, "setCategoriesFolder:", self->_categoriesFolder);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "userInterfaceIdiom");

    if ((v31 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v32 = 30;
    else
      v32 = 2;
    -[SBFolderControllerConfiguration setAllowedOrientations:](v29, "setAllowedOrientations:", v32);
    -[SBFolderControllerConfiguration setOverrideIconImageAppearance:](v29, "setOverrideIconImageAppearance:", v90);
    podFolderViewController = self->_podFolderViewController;
    if (podFolderViewController)
    {
      -[SBHLibraryPodFolderController setPodFolderControllerDelegate:](podFolderViewController, "setPodFolderControllerDelegate:", 0);
      -[SBFolderController setFolder:](self->_podFolderViewController, "setFolder:", 0);
      v34 = self->_podFolderViewController;
      self->_podFolderViewController = 0;

    }
    v81 = v8;
    v82 = v7;
    v76 = v29;
    v35 = -[SBHLibraryPodFolderController initWithConfiguration:]([SBHLibraryPodFolderController alloc], "initWithConfiguration:", v29);
    v36 = self->_podFolderViewController;
    self->_podFolderViewController = v35;

    -[SBHLibraryPodFolderController contentScrollView](self->_podFolderViewController, "contentScrollView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "setShowsVerticalScrollIndicator:", 0);

    -[SBHLibraryPodFolderController setPodFolderControllerDelegate:](self->_podFolderViewController, "setPodFolderControllerDelegate:", self);
    -[SBFolderController setFolderDelegate:](self->_podFolderViewController, "setFolderDelegate:", self);
    -[SBHLibraryPodFolderController setEditing:](self->_podFolderViewController, "setEditing:", -[SBHLibraryViewController isEditing](self, "isEditing"));
    -[SBFolderController setContentVisibility:](self->_podFolderViewController, "setContentVisibility:", -[SBHLibraryViewController contentVisibility](self, "contentVisibility"));
    containerViewController = self->_containerViewController;
    if (containerViewController)
    {
      -[SBHLibrarySearchController setDelegate:](containerViewController, "setDelegate:", self);
      -[SBHLibrarySearchController setSearchResultsUpdater:](self->_containerViewController, "setSearchResultsUpdater:", 0);
      objc_msgSend(MEMORY[0x1E0CB3718], "deactivateConstraints:", self->_containerViewControllerConstraints);
      -[SBHLibrarySearchController view](self->_containerViewController, "view");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "removeFromSuperview");

      -[SBHLibraryViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", self->_containerViewController);
      v40 = self->_containerViewController;
      self->_containerViewController = 0;

    }
    v86 = -[SBHLibraryViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
    v78 = v20;
    objc_msgSend(v20, "appLibraryVisualConfiguration");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = objc_msgSend(v41, "usesInsetPlatterSearchAppearance");

    v43 = -[SBHLibrarySearchController initWithSearchResultsController:contentViewController:usingPlatterAppearance:]([SBHLibrarySearchController alloc], "initWithSearchResultsController:contentViewController:usingPlatterAppearance:", self->_iconTableViewController, self->_podFolderViewController, v42);
    v44 = self->_containerViewController;
    self->_containerViewController = v43;

    -[SBHLibrarySearchController setDelegate:](self->_containerViewController, "setDelegate:", self);
    v45 = self->_containerViewController;
    -[SBHLibraryViewController iconLocation](self, "iconLocation");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibrarySearchController setContainingIconLocation:](v45, "setContainingIconLocation:", v46);

    -[SBHLibrarySearchController setSearchResultsUpdater:](self->_containerViewController, "setSearchResultsUpdater:", self->_iconTableViewController);
    -[SBHLibraryViewController addChildViewController:](self, "addChildViewController:", self->_containerViewController);
    -[SBHLibraryViewController view](self, "view");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibrarySearchController view](self->_containerViewController, "view");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v47, "addSubview:", v48);
    objc_msgSend(v48, "leadingAnchor");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "leadingAnchor");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "constraintEqualToAnchor:", v73);
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v98[0] = v72;
    objc_msgSend(v48, "trailingAnchor");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "trailingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "constraintEqualToAnchor:", v70);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v98[1] = v49;
    objc_msgSend(v48, "topAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "topAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v51);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v98[2] = v52;
    v85 = v48;
    objc_msgSend(v48, "bottomAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v75 = v47;
    objc_msgSend(v47, "bottomAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v54);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v98[3] = v55;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 4);
    v56 = (NSArray *)objc_claimAutoreleasedReturnValue();
    containerViewControllerConstraints = self->_containerViewControllerConstraints;
    self->_containerViewControllerConstraints = v56;

    objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", self->_containerViewControllerConstraints);
    -[SBHLibrarySearchController didMoveToParentViewController:](self->_containerViewController, "didMoveToParentViewController:", self);
    if (v86)
      -[SBHLibrarySearchController beginAppearanceTransition:animated:](self->_containerViewController, "beginAppearanceTransition:animated:", 1, v87);
    v7 = v82;
    -[SBHLibrarySearchController setListLayoutProvider:](self->_containerViewController, "setListLayoutProvider:", v82);
    v92[0] = MEMORY[0x1E0C809B0];
    v92[1] = 3221225472;
    v92[2] = __58__SBHLibraryViewController__setupIconTableViewController___block_invoke;
    v92[3] = &unk_1E8D8B0B8;
    v93 = v82;
    v8 = v81;
    v94 = v81;
    v95 = v10;
    v6 = v83;
    v96 = v83;
    -[SBHLibraryViewController _enumerateAllViewControllersUsingBlock:](self, "_enumerateAllViewControllersUsingBlock:", v92);
    if (v91)
      -[SBHLibraryViewController _updateViewControllerLegibility](self, "_updateViewControllerLegibility");
    objc_msgSend(MEMORY[0x1E0DC4270], "sharedInstanceForStyle:", 1);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconLibraryTableViewController setLegibilitySettings:](self->_iconTableViewController, "setLegibilitySettings:", v58);
    objc_msgSend(v58, "primaryColor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v85, "setTintColor:", v59);

    -[SBHIconLibraryTableViewController tableView](self->_iconTableViewController, "tableView");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "setAccessibilityIdentifier:", CFSTR("dewey-search-result-table-view"));

    -[SBHLibraryPodFolderController view](self->_podFolderViewController, "view");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "setAccessibilityIdentifier:", CFSTR("dewey-pod-view"));

    if (v86)
      -[SBHLibrarySearchController endAppearanceTransition](self->_containerViewController, "endAppearanceTransition");
    -[SBHLibraryCategoryMapProvider libraryCategoryMap](self->_categoryMapProvider, "libraryCategoryMap");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    if (v62)
      -[SBHLibraryViewController _installCategoryMap:](self, "_installCategoryMap:", v62);
    else
      -[SBHLibraryViewController _updateLibraryCategoryMap:](self, "_updateLibraryCategoryMap:", 0);
    -[SBHLibraryCategoryMapProvider addObserver:](self->_categoryMapProvider, "addObserver:", self);
    -[SBHLibraryViewController _notifyObserversDataSourceDidChange](self, "_notifyObserversDataSourceDidChange");

    v4 = v84;
    v9 = v80;
    v63 = v79;
LABEL_26:

    v12 = v88;
  }

}

void __58__SBHLibraryViewController__setupIconTableViewController___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  objc_msgSend(v3, "setListLayoutProvider:", a1[4]);
  objc_msgSend(v3, "setIconImageCache:", a1[5]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setFolderIconImageCache:", a1[6]);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setRootFolder:", a1[7]);

}

- (void)_enqueueAppLibraryUpdate
{
  id v2;

  v2 = -[SBHLibraryCategoryMapProvider requestLibraryCategoryMapRefreshWithOptions:reason:](self->_categoryMapProvider, "requestLibraryCategoryMapRefreshWithOptions:reason:", 6, CFSTR("-[SBHLibraryViewController _reloadAppLibrary]"));
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)SBHLibraryViewController;
  -[SBHLibraryViewController setEditing:animated:](&v6, sel_setEditing_animated_, a3);
  -[SBHLibraryViewController _updateEditingStateAnimated:](self, "_updateEditingStateAnimated:", v4);
}

- (void)setSuppressesEditingStateForListViews:(BOOL)a3
{
  if (self->_suppressesEditingStateForListViews != a3)
  {
    self->_suppressesEditingStateForListViews = a3;
    -[SBHLibraryViewController _updateEditingStateAnimated:](self, "_updateEditingStateAnimated:", 1);
  }
}

- (void)_updateEditingStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  id v6;

  v3 = a3;
  if (-[SBHLibraryViewController isEditing](self, "isEditing"))
    v5 = -[SBHLibraryViewController suppressesEditingStateForListViews](self, "suppressesEditingStateForListViews") ^ 1;
  else
    v5 = 0;
  -[SBFolderController setEditing:animated:](self->_podFolderViewController, "setEditing:animated:", v5, v3);
  -[SBNestingViewController nestedViewController](self, "nestedViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEditing:animated:", v5, v3);

}

- (void)_scrollIconViewToVisible:(id)a3 animated:(BOOL)a4
{
  int v5;
  void *v6;
  void *v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SBHLibraryPodFolderController *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  SBHLibraryPodFolderController *v19;
  SBHLibraryPodFolderController *podFolderViewController;
  id v21;
  CGRect v22;

  v21 = a3;
  v5 = -[SBHLibraryViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  v6 = v21;
  if (v5)
  {
    v7 = v21;
    if (!v21)
    {
      v8 = (objc_class *)objc_opt_class();
      NSStringFromClass(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      NSLog(CFSTR("%@ cannot scroll to a nil SBIconView"), v9);

      v7 = 0;
    }
    objc_msgSend(v7, "icon");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      objc_msgSend(v21, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHLibraryViewController iconViewForIcon:location:](self, "iconViewForIcon:location:", v10, v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        if (-[SBHLibraryViewController isPresentingSearch](self, "isPresentingSearch"))
        {
          -[SBHLibrarySearchController contentScrollView](self->_containerViewController, "contentScrollView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[SBHIconLibraryTableViewController headerBlurView](self->_iconTableViewController, "headerBlurView");
          v14 = (SBHLibraryPodFolderController *)objc_claimAutoreleasedReturnValue();
          -[SBHLibraryPodFolderController frame](v14, "frame");
          v16 = v15;
          objc_msgSend(v13, "adjustedContentInset");
          v18 = v16 - v17;
        }
        else
        {
          -[SBNestingViewController deepestNestedDescendantViewController](self, "deepestNestedDescendantViewController");
          v19 = (SBHLibraryPodFolderController *)objc_claimAutoreleasedReturnValue();
          v14 = v19;
          if (v19
            && (-[SBHLibraryPodFolderController bs_isDisappearingOrDisappeared](v19, "bs_isDisappearingOrDisappeared") & 1) == 0)
          {
            podFolderViewController = v14;
          }
          else
          {
            podFolderViewController = self->_podFolderViewController;
          }
          -[SBHLibraryPodFolderController contentScrollView](podFolderViewController, "contentScrollView");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = 16.0;
        }

        objc_msgSend(v12, "bounds");
        objc_msgSend(v12, "convertRect:toView:", v13);
        CGRectInset(v22, 0.0, -v18);
        objc_msgSend(v13, "contentSize");
        BSRectWithSize();
        UIRectContainInRect();
        objc_msgSend(v13, "scrollRectToVisible:animated:", 1);

      }
    }

    v6 = v21;
  }

}

- (BOOL)isPresentingFolder
{
  void *v2;
  void *v3;
  BOOL v4;

  if (self->_currentTransitionAnimator)
  {
    -[NSMapTable keyEnumerator](self->_presentedFolderControllers, "keyEnumerator");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "count") != 0;

  }
  else
  {
    -[SBNestingViewController deepestNestedDescendantViewController](self, "deepestNestedDescendantViewController");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v2 != 0;
  }

  return v4;
}

- (void)_popExpandedPod
{
  if (-[SBHLibraryViewController isPresentingFolder](self, "isPresentingFolder"))
    -[SBHLibraryViewController popNestedViewControllerAnimated:withCompletion:](self, "popNestedViewControllerAnimated:withCompletion:", 1, 0);
}

- (BOOL)_shouldUseReduceTransparencyBackgroundView
{
  void *v2;
  char v3;

  -[SBHLibraryViewController presenter](self, "presenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hasBackgroundBlur") ^ 1;

  return v3;
}

- (void)_setupReducedTransparencyBackgroundViewIfNeeded
{
  SBFolderControllerBackgroundView *v3;
  void *v4;
  SBFolderControllerBackgroundView *v5;
  SBFolderControllerBackgroundView *reducedTransparencyBackgroundView;
  void *v7;
  void *v8;

  if (-[SBHLibraryViewController isViewLoaded](self, "isViewLoaded")
    && -[SBHLibraryViewController _shouldUseReduceTransparencyBackgroundView](self, "_shouldUseReduceTransparencyBackgroundView"))
  {
    if (UIAccessibilityIsReduceTransparencyEnabled() && !self->_reducedTransparencyBackgroundView)
    {
      v3 = [SBFolderControllerBackgroundView alloc];
      -[SBHLibraryViewController view](self, "view");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "bounds");
      v5 = -[SBFolderControllerBackgroundView initWithFrame:](v3, "initWithFrame:");
      reducedTransparencyBackgroundView = self->_reducedTransparencyBackgroundView;
      self->_reducedTransparencyBackgroundView = v5;

      -[SBFolderControllerBackgroundView setAutoresizingMask:](self->_reducedTransparencyBackgroundView, "setAutoresizingMask:", 18);
      -[SBFolderControllerBackgroundView setEffect:](self->_reducedTransparencyBackgroundView, "setEffect:", 4);
      -[SBFolderControllerBackgroundView setEffectActive:](self->_reducedTransparencyBackgroundView, "setEffectActive:", 1);
      -[SBFolderControllerBackgroundView setAlpha:](self->_reducedTransparencyBackgroundView, "setAlpha:", 0.0);
      -[SBHLibraryViewController view](self, "view");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "addSubview:", self->_reducedTransparencyBackgroundView);

      -[SBHLibraryViewController view](self, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "sendSubviewToBack:", self->_reducedTransparencyBackgroundView);

    }
    -[SBHLibraryViewController _updateReduceTransparency](self, "_updateReduceTransparency");
  }
}

- (void)_teardownReducedTransparencyBackgroundView
{
  SBFolderControllerBackgroundView *reducedTransparencyBackgroundView;

  -[SBFolderControllerBackgroundView removeFromSuperview](self->_reducedTransparencyBackgroundView, "removeFromSuperview");
  reducedTransparencyBackgroundView = self->_reducedTransparencyBackgroundView;
  self->_reducedTransparencyBackgroundView = 0;

}

- (void)_updateReduceTransparency
{
  _BOOL8 IsReduceTransparencyEnabled;
  _BOOL4 v4;
  void *v5;
  void *v6;
  uint64_t v7;
  char v8;
  id v9;

  if (-[SBHLibraryViewController isViewLoaded](self, "isViewLoaded")
    && -[SBHLibraryViewController _shouldUseReduceTransparencyBackgroundView](self, "_shouldUseReduceTransparencyBackgroundView")&& !-[NSMutableArray count](self->_currentCollapseCompletions, "count")&& !-[NSMutableArray count](self->_currentExpandCompletions, "count"))
  {
    IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
    v4 = -[SBHLibraryViewController isPresentingFolder](self, "isPresentingFolder");
    if (IsReduceTransparencyEnabled && !self->_reducedTransparencyBackgroundView)
      -[SBHLibraryViewController _setupReducedTransparencyBackgroundViewIfNeeded](self, "_setupReducedTransparencyBackgroundViewIfNeeded");
    if (v4)
    {
      -[SBHLibraryViewController podFolderViewController](self, "podFolderViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "contentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = objc_opt_class();
      __BSSafeCast(v6, v7);
      v9 = (id)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "setHidesFeatherBlur:", IsReduceTransparencyEnabled);
      -[SBFolderControllerBackgroundView setAlpha:](self->_reducedTransparencyBackgroundView, "setAlpha:", (double)IsReduceTransparencyEnabled);

    }
    else
    {
      if (self->_reducedTransparencyBackgroundView)
        v8 = IsReduceTransparencyEnabled;
      else
        v8 = 1;
      if ((v8 & 1) == 0)
        -[SBHLibraryViewController _teardownReducedTransparencyBackgroundView](self, "_teardownReducedTransparencyBackgroundView");
    }
  }
}

- (void)willPresentSearchController:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  uint8_t v8[16];

  v4 = a3;
  SBLogTelemetrySignposts();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v8 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_SEARCH_PRESENT", " enableTelemetry=YES  isAnimation=YES ", v8, 2u);
  }

  -[SBHLibraryViewController _notifyObserversWillPresentSearchController:](self, "_notifyObserversWillPresentSearchController:", v4);
  -[SBHLibraryViewController podFolderViewController](self, "podFolderViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentScrollView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_scrollToTopIfPossible:", 1);

  if (-[SBHLibraryViewController isPresentingFolder](self, "isPresentingFolder"))
    -[SBHLibraryViewController popNestedViewControllerAnimated:withCompletion:](self, "popNestedViewControllerAnimated:withCompletion:", 1, 0);
}

- (void)didPresentSearchController:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  SBLogTelemetrySignposts();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_SEARCH_PRESENT", " enableTelemetry=YES  isAnimation=YES ", v6, 2u);
  }

  -[SBHLibraryViewController _notifyObserversDidPresentSearchController:](self, "_notifyObserversDidPresentSearchController:", v4);
  -[SBHLibraryViewController _flushPendingLibraryCategoryMapUpdateIfNeeded](self, "_flushPendingLibraryCategoryMapUpdateIfNeeded");
}

- (void)willDismissSearchController:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  SBLogTelemetrySignposts();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v5, OS_SIGNPOST_INTERVAL_BEGIN, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_SEARCH_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v6, 2u);
  }

  -[SBHLibraryViewController _notifyObserversWillDismissSearchController:](self, "_notifyObserversWillDismissSearchController:", v4);
}

- (void)didDismissSearchController:(id)a3
{
  id v4;
  NSObject *v5;
  uint8_t v6[16];

  v4 = a3;
  SBLogTelemetrySignposts();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_signpost_enabled(v5))
  {
    *(_WORD *)v6 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CFEF3000, v5, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "SBH_HOME_LIBRARY_SEARCH_DISMISS", " enableTelemetry=YES  isAnimation=YES ", v6, 2u);
  }

  -[SBHLibraryViewController _notifyObserversDidDismissSearchController:](self, "_notifyObserversDidDismissSearchController:", v4);
}

- (void)_updateCategoryIconBlurBackdropView
{
  void *v3;
  char v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  char v8;

  -[SBHLibraryViewController presenter](self, "presenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hasBackgroundBlur") ^ 1;

  -[NSMapTable objectEnumerator](self->_iconViewControllerForCategoryIdentifier, "objectEnumerator");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __63__SBHLibraryViewController__updateCategoryIconBlurBackdropView__block_invoke;
  v7[3] = &__block_descriptor_33_e53_v32__0__SBHLibraryCategoryIconViewController_8Q16_B24l;
  v8 = v4;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v7);

}

uint64_t __63__SBHLibraryViewController__updateCategoryIconBlurBackdropView__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setNeedsBackgroundBlur:", *(unsigned __int8 *)(a1 + 32));
}

- (BOOL)shouldBeIndicatedInPageControl
{
  return 0;
}

- (BOOL)shouldShowDoneButtonWhenEditing
{
  return 1;
}

- (BOOL)shouldShowAddWidgetButtonWhenEditing
{
  return 0;
}

- (void)addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  observers = self->_observers;
  v8 = v4;
  if (!observers)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observers;
    self->_observers = v6;

    v4 = v8;
    observers = self->_observers;
  }
  -[NSHashTable addObject:](observers, "addObject:", v4);

}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_notifyObserversWillDismissSearchController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__SBHLibraryViewController__notifyObserversWillDismissSearchController___block_invoke;
  v6[3] = &unk_1E8D8B100;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v6);

}

void __72__SBHLibraryViewController__notifyObserversWillDismissSearchController___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "libraryViewController:willDismissSearchController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyObserversDidDismissSearchController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__SBHLibraryViewController__notifyObserversDidDismissSearchController___block_invoke;
  v6[3] = &unk_1E8D8B100;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v6);

}

void __71__SBHLibraryViewController__notifyObserversDidDismissSearchController___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "libraryViewController:didDismissSearchController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyObserversDidPresentSearchController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __71__SBHLibraryViewController__notifyObserversDidPresentSearchController___block_invoke;
  v6[3] = &unk_1E8D8B100;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v6);

}

void __71__SBHLibraryViewController__notifyObserversDidPresentSearchController___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "libraryViewController:didPresentSearchController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyObserversWillPresentSearchController:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __72__SBHLibraryViewController__notifyObserversWillPresentSearchController___block_invoke;
  v6[3] = &unk_1E8D8B100;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v6);

}

void __72__SBHLibraryViewController__notifyObserversWillPresentSearchController___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "libraryViewController:willPresentSearchController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyObserversWillPresentFolderController:(id)a3
{
  id v4;
  NSMapTable *v5;
  NSMapTable *presentedFolderControllers;
  id v7;
  id v8;
  _QWORD v9[5];
  id v10;

  v4 = a3;
  if (!self->_presentedFolderControllers)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v5 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    presentedFolderControllers = self->_presentedFolderControllers;
    self->_presentedFolderControllers = v5;

  }
  -[SBHLibraryViewController _additionalItemsIndicatorIconViewForFolderController:](self, "_additionalItemsIndicatorIconViewForFolderController:", v4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable bs_setSafeObject:forKey:](self->_presentedFolderControllers, "bs_setSafeObject:forKey:", v8, v4);
  -[NSMapTable removeObjectForKey:](self->_dismissingFolderControllers, "removeObjectForKey:", v4);
  objc_msgSend(v8, "_updateAccessoryViewAnimated:", 1);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __72__SBHLibraryViewController__notifyObserversWillPresentFolderController___block_invoke;
  v9[3] = &unk_1E8D8B100;
  v9[4] = self;
  v10 = v4;
  v7 = v4;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v9);

}

void __72__SBHLibraryViewController__notifyObserversWillPresentFolderController___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "libraryViewController:willPresentFolderController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyObserversWillDismissFolderController:(id)a3
{
  id v4;
  NSMapTable *dismissingFolderControllers;
  NSMapTable *v6;
  NSMapTable *v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;

  v4 = a3;
  dismissingFolderControllers = self->_dismissingFolderControllers;
  if (!dismissingFolderControllers)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToWeakObjectsMapTable");
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_dismissingFolderControllers;
    self->_dismissingFolderControllers = v6;

    dismissingFolderControllers = self->_dismissingFolderControllers;
  }
  -[SBHLibraryViewController _additionalItemsIndicatorIconViewForFolderController:](self, "_additionalItemsIndicatorIconViewForFolderController:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable bs_setSafeObject:forKey:](dismissingFolderControllers, "bs_setSafeObject:forKey:", v8, v4);

  -[NSMapTable removeObjectForKey:](self->_presentedFolderControllers, "removeObjectForKey:", v4);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __72__SBHLibraryViewController__notifyObserversWillDismissFolderController___block_invoke;
  v10[3] = &unk_1E8D8B100;
  v10[4] = self;
  v11 = v4;
  v9 = v4;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v10);

}

void __72__SBHLibraryViewController__notifyObserversWillDismissFolderController___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "libraryViewController:willDismissFolderController:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_notifyObserversDidDismissFolderController:(id)a3
{
  NSMapTable *dismissingFolderControllers;
  id v5;
  id v6;

  dismissingFolderControllers = self->_dismissingFolderControllers;
  v5 = a3;
  -[NSMapTable removeObjectForKey:](dismissingFolderControllers, "removeObjectForKey:", v5);
  -[SBHLibraryViewController _additionalItemsIndicatorIconViewForFolderController:](self, "_additionalItemsIndicatorIconViewForFolderController:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "_updateAccessoryViewAnimated:", 1);
}

- (void)_notifyObserversWillDismiss
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__SBHLibraryViewController__notifyObserversWillDismiss__block_invoke;
  v2[3] = &unk_1E8D8B128;
  v2[4] = self;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v2);
}

void __55__SBHLibraryViewController__notifyObserversWillDismiss__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "libraryViewControllerWillDismiss:", *(_QWORD *)(a1 + 32));

}

- (void)_notifyObserversDidDismiss
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__SBHLibraryViewController__notifyObserversDidDismiss__block_invoke;
  v2[3] = &unk_1E8D8B128;
  v2[4] = self;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v2);
}

void __54__SBHLibraryViewController__notifyObserversDidDismiss__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "libraryViewControllerDidDismiss:", *(_QWORD *)(a1 + 32));

}

- (void)_notifyObserversWillPresent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __55__SBHLibraryViewController__notifyObserversWillPresent__block_invoke;
  v2[3] = &unk_1E8D8B128;
  v2[4] = self;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v2);
}

void __55__SBHLibraryViewController__notifyObserversWillPresent__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "libraryViewControllerWillPresent:", *(_QWORD *)(a1 + 32));

}

- (void)_notifyObserversDidPresent
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __54__SBHLibraryViewController__notifyObserversDidPresent__block_invoke;
  v2[3] = &unk_1E8D8B128;
  v2[4] = self;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v2);
}

void __54__SBHLibraryViewController__notifyObserversDidPresent__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "libraryViewControllerDidPresent:", *(_QWORD *)(a1 + 32));

}

- (void)_notifyObserversOfAppLaunchOfIcon:(id)a3 fromLocation:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[5];
  id v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __75__SBHLibraryViewController__notifyObserversOfAppLaunchOfIcon_fromLocation___block_invoke;
  v10[3] = &unk_1E8D8B150;
  v10[4] = self;
  v11 = v6;
  v12 = v7;
  v8 = v7;
  v9 = v6;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v10);

}

void __75__SBHLibraryViewController__notifyObserversOfAppLaunchOfIcon_fromLocation___block_invoke(_QWORD *a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "libraryViewController:willLaunchIcon:fromLocation:", a1[4], a1[5], a1[6]);

}

- (void)_notifyObserversDataSourceDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __63__SBHLibraryViewController__notifyObserversDataSourceDidChange__block_invoke;
  v2[3] = &unk_1E8D8B128;
  v2[4] = self;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v2);
}

void __63__SBHLibraryViewController__notifyObserversDataSourceDidChange__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = *(_QWORD *)(a1 + 32);
    objc_msgSend(*(id *)(v3 + 1336), "dataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "libraryViewController:dataSourceDidChange:", v3, v4);

  }
}

- (void)_notifyObserversOfAcceptedDrop:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __59__SBHLibraryViewController__notifyObserversOfAcceptedDrop___block_invoke;
  v6[3] = &unk_1E8D8B100;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  -[SBHLibraryViewController _enumerateObservers:](self, "_enumerateObservers:", v6);

}

void __59__SBHLibraryViewController__notifyObserversOfAcceptedDrop___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "libraryViewController:didAcceptDrop:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

}

- (void)_enumerateObservers:(id)a3
{
  void (**v4)(id, _QWORD);
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = (void (**)(id, _QWORD))a3;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSHashTable allObjects](self->_observers, "allObjects", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)libraryCategoryMapProvider:(id)a3 categoryMapWasRefreshed:(unint64_t)a4 libraryCategoryMap:(id)a5
{
  -[SBHLibraryViewController _updateLibraryCategoryMap:](self, "_updateLibraryCategoryMap:", a5, a4);
}

- (void)_updateLibraryCategoryMap:(id)a3
{
  id v5;
  void *v6;
  _BOOL4 v7;
  BOOL v8;
  SBHLibraryCategoryMap *libraryCategoryMap;
  NSObject *v10;
  _BOOL4 v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  _BOOL4 v16;
  SBHLibraryCategoryMap *pendingLibraryCategoryMap;
  NSObject *v18;
  int v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[SBHLibrarySearchController bs_isAppearingOrAppeared](self->_containerViewController, "bs_isAppearingOrAppeared"))
  {
    -[SBNestingViewController nestedViewController](self, "nestedViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = !v6
      && !-[SBHLibraryViewController isPresentingSearch](self, "isPresentingSearch")
      && -[SBHLibraryViewController contentVisibility](self, "contentVisibility") != 2;

  }
  else
  {
    v7 = 0;
  }
  v8 = -[SBHLibraryViewController _hiddenCategoriesDidChangeFromCurrentCategoryMap:toUpdatedCategoryMap:](self, "_hiddenCategoriesDidChangeFromCurrentCategoryMap:toUpdatedCategoryMap:", self->_libraryCategoryMap, v5);
  libraryCategoryMap = self->_libraryCategoryMap;
  SBLogLibrary();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (libraryCategoryMap)
    v12 = !v7;
  else
    v12 = 1;
  if (v12 || v8)
  {
    if (v11)
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "library category map update received: %@", (uint8_t *)&v19, 0xCu);
    }

    pendingLibraryCategoryMap = self->_pendingLibraryCategoryMap;
    self->_pendingLibraryCategoryMap = 0;

    -[SBHLibraryViewController _installCategoryMap:](self, "_installCategoryMap:", v5);
    if (!v5)
    {
      SBLogLibrary();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        -[SBHLibraryViewController _updateLibraryCategoryMap:].cold.1(v18);

      -[SBHLibraryViewController _enqueueAppLibraryUpdate](self, "_enqueueAppLibraryUpdate");
    }
  }
  else
  {
    if (v11)
    {
      v19 = 138412290;
      v20 = v5;
      _os_log_impl(&dword_1CFEF3000, v10, OS_LOG_TYPE_DEFAULT, "Queuing up pending library category map: %@", (uint8_t *)&v19, 0xCu);
    }

    objc_storeStrong((id *)&self->_pendingLibraryCategoryMap, a3);
    SBLogLibrary();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v19) = 0;
      _os_log_impl(&dword_1CFEF3000, v13, OS_LOG_TYPE_DEFAULT, "Setting up partial library category map update...", (uint8_t *)&v19, 2u);
    }

    objc_msgSend((id)objc_opt_class(), "_updateCategoryMap:withCategoryDataFrom:", self->_libraryCategoryMap, v5);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    SBLogLibrary();
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT);
    if (v14)
    {
      if (v16)
      {
        v19 = 138412290;
        v20 = v14;
        _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "Successfully updated non-proactive special categories w/ new partial map: %@", (uint8_t *)&v19, 0xCu);
      }

      -[SBHLibraryViewController _installCategoryMap:](self, "_installCategoryMap:", v14);
    }
    else
    {
      if (v16)
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_DEFAULT, "Could not amend map; partial update aborted.",
          (uint8_t *)&v19,
          2u);
      }

    }
  }

}

- (BOOL)_hiddenCategoriesDidChangeFromCurrentCategoryMap:(id)a3 toUpdatedCategoryMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  char v15;

  v6 = a4;
  v7 = a3;
  -[SBHLibraryViewController _hiddenCategoryIdentifierForCategoryMap:](self, "_hiddenCategoryIdentifierForCategoryMap:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sortedApplicationIdentifiersForCategoryIdentifier:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHLibraryViewController _hiddenCategoryIdentifierForCategoryMap:](self, "_hiddenCategoryIdentifierForCategoryMap:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedApplicationIdentifiersForCategoryIdentifier:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = objc_msgSend(v9, "count");
  if (v12 == objc_msgSend(v11, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "isEqualToSet:", v14);

  }
  else
  {
    v15 = 1;
  }

  return v15;
}

- (id)_hiddenCategoryIdentifierForCategoryMap:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "categoryIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_firstObjectPassingTest:", &__block_literal_global_169);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

BOOL __68__SBHLibraryViewController__hiddenCategoryIdentifierForCategoryMap___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "predictionCategoryID") == 7;
}

+ (id)_updateCategoryMap:(id)a3 withCategoryDataFrom:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = a3;
  v7 = (void *)objc_msgSend(v6, "mutableCopy");
  objc_msgSend(v7, "updateRecentlyAddedCategoryFromMap:", v5);

  LOBYTE(v5) = BSEqualObjects();
  if ((v5 & 1) != 0)
    v8 = 0;
  else
    v8 = v7;

  return v8;
}

- (void)_flushPendingLibraryCategoryMapUpdateIfNeeded
{
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, a2, a3, "Installing pending category map: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_installCategoryMap:(id)a3
{
  id v5;
  unsigned int v6;
  NSObject *v7;
  SBHLibraryCategoryMap **p_libraryCategoryMap;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  id v27;
  __int16 v28;
  unsigned int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (-[SBHLibraryViewController isViewLoaded](self, "isViewLoaded"))
    v6 = -[SBHLibraryViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  else
    v6 = 0;
  SBLogLibrary();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v27 = v5;
    v28 = 1024;
    v29 = v6;
    _os_log_impl(&dword_1CFEF3000, v7, OS_LOG_TYPE_DEFAULT, "Installing category map %@ - animated %{BOOL}u", buf, 0x12u);
  }

  p_libraryCategoryMap = &self->_libraryCategoryMap;
  objc_storeStrong((id *)&self->_libraryCategoryMap, a3);
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", self->_podFolderViewController);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[SBNestingViewController nestedViewController](self, "nestedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBFSafeCast();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bs_safeAddObject:", v11);

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v12 = v9;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v22 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v17, "setLibraryCategoryMap:", *p_libraryCategoryMap, (_QWORD)v21);
        if (v6)
          objc_msgSend(v17, "layoutIconListsWithAnimationType:forceRelayout:", v6 - 1, 1);
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v14);
  }

  -[SBHIconLibraryTableViewController setLibraryCategoryMap:](self->_iconTableViewController, "setLibraryCategoryMap:", *p_libraryCategoryMap);
  v18 = (void *)MEMORY[0x1E0C99E60];
  -[SBHLibraryCategoryMap categoryIdentifiers](*p_libraryCategoryMap, "categoryIdentifiers");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setWithArray:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController _precacheIconViewControllersForCategories:](self, "_precacheIconViewControllersForCategories:", v20);

}

- (void)libraryTableViewControllerDidAppear:(id)a3
{
  -[SBFolderController setContentVisibility:](self->_podFolderViewController, "setContentVisibility:", 1);
  -[SBHLibraryViewController invalidateSearchControllerAppLaunchResetTimer](self, "invalidateSearchControllerAppLaunchResetTimer");
}

- (void)libraryTableViewControllerWillDisappear:(id)a3
{
  -[SBFolderController setContentVisibility:](self->_podFolderViewController, "setContentVisibility:", 0);
}

- (void)libraryTableViewControllerDidLaunchIcon:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SBHLibraryViewController invalidateSearchControllerAppLaunchResetTimer](self, "invalidateSearchControllerAppLaunchResetTimer");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("App Library Search launch of app '%@'"), v5);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController _startAppLaunchResetTimer:](self, "_startAppLaunchResetTimer:", v4);

  -[SBHLibraryViewController _notifyObserversOfAppLaunchOfIcon:fromLocation:](self, "_notifyObserversOfAppLaunchOfIcon:fromLocation:", v5, CFSTR("SBIconLocationAppLibrarySearch"));
}

- (void)_invalidateLibraryViewControllerDismissalTimer
{
  NSTimer *libraryViewControllerDismissalTimer;

  -[NSTimer invalidate](self->_libraryViewControllerDismissalTimer, "invalidate");
  libraryViewControllerDismissalTimer = self->_libraryViewControllerDismissalTimer;
  self->_libraryViewControllerDismissalTimer = 0;

}

- (void)_startLibraryViewControllerDismissalTimer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  NSTimer *v10;
  NSTimer *libraryViewControllerDismissalTimer;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self->_libraryViewControllerDismissalTimer)
    -[SBHLibraryViewController _invalidateLibraryViewControllerDismissalTimer](self, "_invalidateLibraryViewControllerDismissalTimer");
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogLibrary();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v4;
    v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "Starting App Library view controller dismissal timer for reason: %{public}@, session identifier %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v7 = (void *)MEMORY[0x1E0C99E88];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__SBHLibraryViewController__startLibraryViewControllerDismissalTimer___block_invoke;
  v12[3] = &unk_1E8D8B1B8;
  v8 = v4;
  v13 = v8;
  v9 = v5;
  v14 = v9;
  objc_copyWeak(&v15, (id *)buf);
  objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v12, 480.0);
  v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  libraryViewControllerDismissalTimer = self->_libraryViewControllerDismissalTimer;
  self->_libraryViewControllerDismissalTimer = v10;

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __70__SBHLibraryViewController__startLibraryViewControllerDismissalTimer___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "isValid") & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_dismissLibraryViewControllerForReason:sessionIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    SBLogLibrary();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v8 = v4;
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "App Library view controller dismissal timer for reason %{public}@, session identifier %{public}@ -- was invalidated.  We're not going to do anything.", buf, 0x16u);
    }

  }
}

- (void)_dismissLibraryViewControllerForReason:(id)a3 sessionIdentifier:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBHLibraryViewController invalidateSearchControllerAppLaunchResetTimer](self, "invalidateSearchControllerAppLaunchResetTimer");
  if (-[SBHLibraryViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared")
    && -[SBHLibraryViewController contentVisibility](self, "contentVisibility") != 2)
  {
    SBLogLibrary();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      _os_log_impl(&dword_1CFEF3000, v9, OS_LOG_TYPE_DEFAULT, "App Library view controller dismissal timer won't dismiss for reason %{public}@, session identifier %{public}@ -- container view controller is visible and it'd be really bad if we just changed the way the UI looked while they're using it", (uint8_t *)&v10, 0x16u);
    }

  }
  else
  {
    -[SBHLibraryViewController behaviorDelegate](self, "behaviorDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "libraryViewControllerRequestsDismissal:", self);

  }
}

- (id)acquireLibrarySearchPrewarmAssertionForReason:(id)a3
{
  return -[SBHIconLibraryTableViewController acquireLibrarySearchPrewarmAssertionForReason:](self->_iconTableViewController, "acquireLibrarySearchPrewarmAssertionForReason:", a3);
}

- (void)invalidateSearchControllerAppLaunchResetTimer
{
  NSTimer *searchControllerAppLaunchResetTimer;

  -[NSTimer invalidate](self->_searchControllerAppLaunchResetTimer, "invalidate");
  searchControllerAppLaunchResetTimer = self->_searchControllerAppLaunchResetTimer;
  self->_searchControllerAppLaunchResetTimer = 0;

}

- (void)_startAppLaunchResetTimer:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  NSTimer *v10;
  NSTimer *searchControllerAppLaunchResetTimer;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  SBLogLibrary();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v17 = v4;
    v18 = 2114;
    v19 = v5;
    _os_log_impl(&dword_1CFEF3000, v6, OS_LOG_TYPE_DEFAULT, "Starting app launch reset timer for reason: %{public}@, session identifier %{public}@", buf, 0x16u);
  }

  objc_initWeak((id *)buf, self);
  v7 = (void *)MEMORY[0x1E0C99E88];
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __54__SBHLibraryViewController__startAppLaunchResetTimer___block_invoke;
  v12[3] = &unk_1E8D8B1B8;
  v8 = v4;
  v13 = v8;
  v9 = v5;
  v14 = v9;
  objc_copyWeak(&v15, (id *)buf);
  objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 0, v12, 8.0);
  v10 = (NSTimer *)objc_claimAutoreleasedReturnValue();
  searchControllerAppLaunchResetTimer = self->_searchControllerAppLaunchResetTimer;
  self->_searchControllerAppLaunchResetTimer = v10;

  objc_destroyWeak(&v15);
  objc_destroyWeak((id *)buf);

}

void __54__SBHLibraryViewController__startAppLaunchResetTimer___block_invoke(uint64_t a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  id WeakRetained;
  uint8_t buf[4];
  uint64_t v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a2, "isValid") & 1) != 0)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
    objc_msgSend(WeakRetained, "_dismissSearchIfNotInUseForReason:sessionIdentifier:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  }
  else
  {
    SBLogLibrary();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *(_QWORD *)(a1 + 32);
      v5 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138543618;
      v8 = v4;
      v9 = 2114;
      v10 = v5;
      _os_log_impl(&dword_1CFEF3000, v3, OS_LOG_TYPE_DEFAULT, "App launch reset timer for reason %{public}@, session identifier %{public}@ -- was invalidated.  We're not going to do anything.", buf, 0x16u);
    }

  }
}

- (void)_dismissSearchIfNotInUseForReason:(id)a3 sessionIdentifier:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  const char *v9;
  int v10;
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[SBHLibraryViewController invalidateSearchControllerAppLaunchResetTimer](self, "invalidateSearchControllerAppLaunchResetTimer");
  if (-[SBHLibrarySearchController bs_isAppearingOrAppeared](self->_containerViewController, "bs_isAppearingOrAppeared")&& -[SBHLibraryViewController contentVisibility](self, "contentVisibility") != 2)
  {
    SBLogLibrary();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v9 = "App launch reset timer for reason %{public}@, session identifier %{public}@ -- container view controller is v"
           "isible and it'd be really bad if we just changed the way the UI looked while they're using it";
      goto LABEL_9;
    }
LABEL_10:

    goto LABEL_11;
  }
  if (!-[SBHLibrarySearchController isActive](self->_containerViewController, "isActive"))
  {
    SBLogLibrary();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v10 = 138543618;
      v11 = v6;
      v12 = 2114;
      v13 = v7;
      v9 = "App launch won't dismiss search for reason %{public}@, session identifier %{public}@ -- search isn't active, "
           "so we can't dismiss something that isn't dismissable";
LABEL_9:
      _os_log_impl(&dword_1CFEF3000, v8, OS_LOG_TYPE_DEFAULT, v9, (uint8_t *)&v10, 0x16u);
      goto LABEL_10;
    }
    goto LABEL_10;
  }
  -[SBHLibraryViewController dismissSearch](self, "dismissSearch");
LABEL_11:

}

- (void)folderController:(id)a3 willUseIconTransitionAnimator:(id)a4 forOperation:(int64_t)a5 onViewController:(id)a6 animated:(BOOL)a7
{
  -[SBHLibraryViewController setCurrentTransitionAnimator:](self, "setCurrentTransitionAnimator:", a4);
}

- (Class)controllerClassForFolder:(id)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4
{
  return 1;
}

- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4
{
  return 0;
}

- (void)folderControllerWillBeginScrolling:(id)a3
{
  if (-[SBHLibraryViewController isPresentingSearch](self, "isPresentingSearch", a3))
    -[SBHLibraryViewController dismissSearch](self, "dismissSearch");
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5
{
  void *v6;
  id v7;
  void *v8;
  int v9;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11 = *MEMORY[0x1E0DAB500];
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a5;
  objc_msgSend(v6, "arrayWithObjects:count:", &v11, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "hasItemsConformingToTypeIdentifiers:", v8, v11, v12);

  if (v9)
    return -[SBHLibraryViewController isEditing](self, "isEditing");
  else
    return 0;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5
{
  -[SBHLibraryViewController _updateDragPreviewIconViewsForDropSession:inIconListView:](self, "_updateDragPreviewIconViewsForDropSession:inIconListView:", a5, a4);
}

- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5
{
  id v7;
  uint64_t v8;

  v7 = a5;
  -[SBHLibraryViewController _updateDragPreviewIconViewsForDropSession:inIconListView:](self, "_updateDragPreviewIconViewsForDropSession:inIconListView:", v7, a4);
  LODWORD(a4) = -[SBHLibraryViewController _canPerformDropForAnyItemInSession:](self, "_canPerformDropForAnyItemInSession:", v7);

  if ((_DWORD)a4)
    v8 = 3;
  else
    v8 = 0;
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", v8);
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5
{
  -[SBHLibraryViewController _updateDragPreviewIconViewsForDropSession:inIconListView:](self, "_updateDragPreviewIconViewsForDropSession:inIconListView:", a5, a4);
}

- (void)folderController:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  char v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  SBHLibraryViewController *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v6 = a5;
  v32 = self;
  -[SBHLibraryViewController iconModel](self, "iconModel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootFolder");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  objc_msgSend(v6, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
  if (v9)
  {
    v10 = v9;
    v28 = v7;
    v29 = v6;
    v11 = 0;
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        objc_msgSend(v14, "sbh_appDragLocalContext");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "startLocation") != 4;
        -[SBHLibraryViewController _iconIdentifierForDragItem:](v32, "_iconIdentifierForDragItem:", v14);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (v17)
          objc_msgSend(v31, "addObject:", v17);
        objc_msgSend(v15, "containedIconIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = v18;
        if (v18)
        {
          objc_msgSend(v18, "allObjects");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "addObjectsFromArray:", v20);

        }
        v11 |= v16;

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v37, v42, 16);
    }
    while (v10);

    v7 = v28;
    v6 = v29;
    if ((v11 & 1) != 0)
    {
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v21 = v31;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v34;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v34 != v24)
              objc_enumerationMutation(v21);
            objc_msgSend(v28, "leafIconForIdentifier:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * j));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            if (-[SBHLibraryViewController _canPerformDropForDraggedIcon:](v32, "_canPerformDropForDraggedIcon:", v26))
            {
              objc_msgSend(v30, "ignoredList");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "addIcon:", v26);

            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
        }
        while (v23);
      }

      -[SBHLibraryViewController _notifyObserversOfAcceptedDrop:](v32, "_notifyObserversOfAcceptedDrop:", v29);
    }
  }
  else
  {

  }
}

- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  CGFloat v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  id v33;
  id v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat Height;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  CGAffineTransform v57;
  id v58;
  CGAffineTransform v59;
  CGAffineTransform v60;
  CGRect v61;

  v9 = a4;
  v10 = a5;
  v11 = a6;
  -[SBHLibraryViewController _iconIdentifierForDragItem:](self, "_iconIdentifierForDragItem:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController iconModel](self, "iconModel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "leafIconForIdentifier:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHLibraryViewController firstNonSuggestionsOrRecentsIconViewForIcon:](self, "firstNonSuggestionsOrRecentsIconViewForIcon:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v15)
  {
    -[SBHLibraryViewController firstIconViewForIcon:](self, "firstIconViewForIcon:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v55 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v60.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v60.c = v55;
  *(_OWORD *)&v60.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v9, "iconContentScale", *(_QWORD *)&v60.tx, *(_QWORD *)&v60.ty, *(_QWORD *)&v60.a, *(_QWORD *)&v60.b, v55);
  *(_OWORD *)&v59.a = v54;
  *(_OWORD *)&v59.c = v56;
  *(_OWORD *)&v59.tx = v53;
  CGAffineTransformScale(&v60, &v59, v16, v16);
  if (!v15)
  {
    v58 = 0;
    -[SBHLibraryViewController _destinationFolderIconViewForDragItem:folderRelativeIconIndexPath:](self, "_destinationFolderIconViewForDragItem:folderRelativeIconIndexPath:", v10, &v58);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v58;
    v27 = v26;
    if (v25)
    {
      if (v26 && !objc_msgSend(v26, "sbListIndex"))
      {
        objc_msgSend(v25, "frameForMiniIconAtIndex:", objc_msgSend(v27, "sbIconIndex"));
        objc_msgSend(v9, "convertRect:fromView:", v25);
        v38 = v37;
        v40 = v39;
        v42 = v41;
        v44 = v43;
        UIRectGetCenter();
        v46 = v45;
        v48 = v47;
        objc_msgSend(v9, "alignmentIconSize");
        v50 = v49;
        v61.origin.x = v38;
        v61.origin.y = v40;
        v61.size.width = v42;
        v61.size.height = v44;
        Height = CGRectGetHeight(v61);
        v57 = v60;
        CGAffineTransformScale(&v59, &v57, Height / v50, Height / v50);
        v60 = v59;
        v33 = objc_alloc(MEMORY[0x1E0DC3770]);
        v59 = v60;
        v34 = v9;
        v35 = v46;
        v36 = v48;
      }
      else
      {
        objc_msgSend(v25, "superview");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "center");
        objc_msgSend(v28, "convertPoint:toView:", v9);
        v30 = v29;
        v32 = v31;

        v57 = v60;
        CGAffineTransformScale(&v59, &v57, 0.01, 0.01);
        v60 = v59;
        v33 = objc_alloc(MEMORY[0x1E0DC3770]);
        v59 = v60;
        v34 = v9;
        v35 = v30;
        v36 = v32;
      }
      v23 = (void *)objc_msgSend(v33, "initWithContainer:center:transform:", v34, &v59, v35, v36);
    }
    else
    {
      v23 = 0;
    }

    if (v23)
      goto LABEL_5;
LABEL_14:
    v24 = 0;
    goto LABEL_15;
  }
  objc_msgSend(v15, "superview");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "center");
  objc_msgSend(v17, "convertPoint:toView:", v9);
  v19 = v18;
  v21 = v20;

  v22 = objc_alloc(MEMORY[0x1E0DC3770]);
  v59 = v60;
  v23 = (void *)objc_msgSend(v22, "initWithContainer:center:transform:", v9, &v59, v19, v21);
  if (!v23)
    goto LABEL_14;
LABEL_5:
  objc_msgSend(v11, "retargetedPreviewWithTarget:", v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "set_springboardPlatterStyle:", 1);
LABEL_15:

  return v24;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  _QWORD v24[4];
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  _QWORD v29[4];
  id v30;

  v8 = a5;
  v9 = a6;
  -[SBHLibraryViewController _iconIdentifierForDragItem:](self, "_iconIdentifierForDragItem:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController iconModel](self, "iconModel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "leafIconForIdentifier:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHLibraryViewController firstIconViewForIcon:](self, "firstIconViewForIcon:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  v15 = MEMORY[0x1E0C809B0];
  if (v13)
  {
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke;
    v29[3] = &unk_1E8D84C50;
    v16 = v13;
    v30 = v16;
    objc_msgSend(v9, "addAnimations:", v29);
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_2;
    v27[3] = &unk_1E8D863E0;
    v28 = v16;
    objc_msgSend(v9, "addCompletion:", v27);

  }
  objc_msgSend(v8, "sbh_appDragLocalContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "portaledPreview");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v19 = v18;
  else
    v19 = 0;
  v20 = v19;

  if (v20)
  {
    v24[0] = v15;
    v24[1] = 3221225472;
    v24[2] = __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_3;
    v24[3] = &unk_1E8D84EF0;
    v21 = v20;
    v25 = v21;
    v26 = v14;
    objc_msgSend(v9, "addAnimations:", v24);
    v22[0] = v15;
    v22[1] = 3221225472;
    v22[2] = __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_4;
    v22[3] = &unk_1E8D863E0;
    v23 = v21;
    objc_msgSend(v9, "addCompletion:", v22);

  }
}

uint64_t __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setIconImageAndAccessoryAlpha:", 0.0);
}

uint64_t __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIconImageAndAccessoryAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 32), "cleanUpAfterDropAnimation");
}

uint64_t __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setIconAllowsLabelArea:", objc_msgSend(*(id *)(a1 + 40), "allowsLabelArea"));
  if (!*(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "setIconCanShowCloseBox:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setDragState:", 3);
}

uint64_t __99__SBHLibraryViewController_folderController_iconListView_iconDragItem_willAnimateDropWithAnimator___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "dropDestinationAnimationCompleted");
}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6
{
  return 0;
}

- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5
{
  return 0;
}

- (id)_iconIdentifierForDragItem:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a3, "sbh_appDragLocalContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "uniqueIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_draggedItemIdentifiersInSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v18 = v4;
  objc_msgSend(v4, "items");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        objc_msgSend(v11, "sbh_appDragLocalContext");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[SBHLibraryViewController _iconIdentifierForDragItem:](self, "_iconIdentifierForDragItem:", v11);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v5, "addObject:", v13);
        objc_msgSend(v12, "containedIconIdentifiers");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          objc_msgSend(v14, "allObjects");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObjectsFromArray:", v16);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v8);
  }

  return v5;
}

- (id)_destinationFolderIconViewForDragItem:(id)a3 folderRelativeIconIndexPath:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;

  v6 = a3;
  -[SBHLibraryViewController _iconIdentifierForDragItem:](self, "_iconIdentifierForDragItem:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController iconModel](self, "iconModel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "leafIconForIdentifier:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__14;
    v26 = __Block_byref_object_dispose__14;
    v27 = 0;
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy__14;
    v20 = __Block_byref_object_dispose__14;
    v21 = 0;
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __94__SBHLibraryViewController__destinationFolderIconViewForDragItem_folderRelativeIconIndexPath___block_invoke;
    v12[3] = &unk_1E8D8B1E0;
    v14 = &v16;
    v13 = v9;
    v15 = &v22;
    -[SBHLibraryViewController enumerateViewControllersUsingBlock:](self, "enumerateViewControllersUsingBlock:", v12);
    if (a4)
      *a4 = objc_retainAutorelease((id)v23[5]);
    v10 = (id)v17[5];

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v22, 8);

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

void __94__SBHLibraryViewController__destinationFolderIconViewForDragItem_folderRelativeIconIndexPath___block_invoke(_QWORD *a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id obj;

  v5 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = a1[4];
    v7 = *(_QWORD *)(a1[6] + 8);
    obj = *(id *)(v7 + 40);
    objc_msgSend(v5, "folderIconViewForIcon:folderRelativeIconIndexPath:", v6, &obj);
    v8 = objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)(v7 + 40), obj);
    v9 = *(_QWORD *)(a1[5] + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

    if (*(_QWORD *)(*(_QWORD *)(a1[5] + 8) + 40))
      *a3 = 1;
  }

}

- (BOOL)_canPerformDropForAnyItemInSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  BOOL v12;
  BOOL v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHLibraryViewController iconModel](self, "iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryViewController _draggedItemIdentifiersInSession:](self, "_draggedItemIdentifiersInSession:", v4);
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    while (2)
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(v5, "leafIconForIdentifier:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = -[SBHLibraryViewController _canPerformDropForDraggedIcon:](self, "_canPerformDropForDraggedIcon:", v11);

        if (v12)
        {
          v13 = 1;
          goto LABEL_11;
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v8)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (BOOL)_canPerformDropForDraggedIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  if (!a3)
    return 0;
  v4 = a3;
  -[SBHLibraryViewController iconModel](self, "iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rootFolder");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "ignoredList");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v6) = objc_msgSend(v7, "isAllowedToContainIcon:", v4);
  return (char)v6;
}

- (void)_updateDragPreviewIconViewsForDropSession:(id)a3 inIconListView:(id)a4
{
  id v5;
  char v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = objc_msgSend(a4, "iconViewConfigurationOptions");
  objc_msgSend(MEMORY[0x1E0CD28B0], "begin");
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = v5;
  objc_msgSend(v5, "items");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v10), "sbh_appDragLocalContext");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "portaledPreview");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v13 = v12;
        else
          v13 = 0;
        v14 = v13;

        objc_msgSend(v14, "updateDestinationIconLocation:allowsLabelArea:animated:", CFSTR("SBIconLocationAppLibraryCategoryPod"), (v6 & 2) == 0, 1);
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0CD28B0], "commit");
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (SBHomeScreenIconTransitionAnimatorDelegate)homeScreenIconTransitionAnimatorDelegate
{
  return (SBHomeScreenIconTransitionAnimatorDelegate *)objc_loadWeakRetained((id *)&self->_homeScreenIconTransitionAnimatorDelegate);
}

- (void)setHomeScreenIconTransitionAnimatorDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_homeScreenIconTransitionAnimatorDelegate, a3);
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (SBHLibraryCategoryMap)libraryCategoryMap
{
  return self->_libraryCategoryMap;
}

- (void)setIconViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_iconViewDelegate, a3);
}

- (SBHIconBadgeBehaviorProviding)badgeBehaviorProvider
{
  return (SBHIconBadgeBehaviorProviding *)objc_loadWeakRetained((id *)&self->_badgeBehaviorProvider);
}

- (SBHLibraryViewControllerDelegate)behaviorDelegate
{
  return (SBHLibraryViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_behaviorDelegate);
}

- (UIView)externalBackgroundView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_externalBackgroundView);
}

- (BOOL)allowsBadging
{
  return self->_allowsBadging;
}

- (SBHIconImageAppearance)overrideIconImageAppearance
{
  return self->_overrideIconImageAppearance;
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (void)setIconLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1272);
}

- (BOOL)suppressesEditingStateForListViews
{
  return self->_suppressesEditingStateForListViews;
}

- (BSEventQueue)transitionEventQueue
{
  return self->_transitionEventQueue;
}

- (SBHomeScreenIconTransitionAnimator)currentTransitionAnimator
{
  return self->_currentTransitionAnimator;
}

- (void)setCurrentTransitionAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_currentTransitionAnimator, a3);
}

- (NSMutableArray)currentExpandCompletions
{
  return self->_currentExpandCompletions;
}

- (void)setCurrentExpandCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_currentExpandCompletions, a3);
}

- (NSMutableArray)currentCollapseCompletions
{
  return self->_currentCollapseCompletions;
}

- (void)setCurrentCollapseCompletions:(id)a3
{
  objc_storeStrong((id *)&self->_currentCollapseCompletions, a3);
}

- (SBHCredenzaSettings)credenzaSettings
{
  return (SBHCredenzaSettings *)objc_loadWeakRetained((id *)&self->_credenzaSettings);
}

- (void)setCredenzaSettings:(id)a3
{
  objc_storeWeak((id *)&self->_credenzaSettings, a3);
}

- (SBHLibrarySearchController)containerViewController
{
  return self->_containerViewController;
}

- (SBHIconLibraryTableViewController)iconTableViewController
{
  return self->_iconTableViewController;
}

- (SBHLibraryPodFolderController)podFolderViewController
{
  return self->_podFolderViewController;
}

- (_UILegibilitySettings)overrideLegibilitySettings
{
  return self->_overrideLegibilitySettings;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_overrideLegibilitySettings, 0);
  objc_storeStrong((id *)&self->_podFolderViewController, 0);
  objc_storeStrong((id *)&self->_iconTableViewController, 0);
  objc_storeStrong((id *)&self->_containerViewController, 0);
  objc_destroyWeak((id *)&self->_credenzaSettings);
  objc_storeStrong((id *)&self->_currentCollapseCompletions, 0);
  objc_storeStrong((id *)&self->_currentExpandCompletions, 0);
  objc_storeStrong((id *)&self->_currentTransitionAnimator, 0);
  objc_storeStrong((id *)&self->_transitionEventQueue, 0);
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_storeStrong((id *)&self->_overrideIconImageAppearance, 0);
  objc_destroyWeak((id *)&self->_externalBackgroundView);
  objc_storeStrong((id *)&self->_barSwipeViewController, 0);
  objc_destroyWeak((id *)&self->_behaviorDelegate);
  objc_destroyWeak((id *)&self->_presenter);
  objc_destroyWeak((id *)&self->_badgeBehaviorProvider);
  objc_destroyWeak((id *)&self->_iconViewDelegate);
  objc_storeStrong((id *)&self->_libraryCategoryMap, 0);
  objc_destroyWeak((id *)&self->_homeScreenIconTransitionAnimatorDelegate);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_shouldUseReduceTransparencyBackgroundView, 0);
  objc_storeStrong((id *)&self->_reducedTransparencyBackgroundView, 0);
  objc_storeStrong((id *)&self->_libraryPrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_dismissingFolderControllers, 0);
  objc_storeStrong((id *)&self->_presentedFolderControllers, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_libraryViewControllerDismissalTimer, 0);
  objc_storeStrong((id *)&self->_searchControllerAppLaunchResetTimer, 0);
  objc_storeStrong((id *)&self->_categoriesFolder, 0);
  objc_storeStrong((id *)&self->_model, 0);
  objc_storeStrong((id *)&self->_pendingLibraryCategoryMap, 0);
  objc_storeStrong((id *)&self->_folderIconImageCache, 0);
  objc_storeStrong((id *)&self->_iconViewControllerForCategoryIdentifier, 0);
  objc_storeStrong((id *)&self->_containerViewControllerConstraints, 0);
  objc_storeStrong((id *)&self->_categoryMapProvider, 0);
}

- (void)nestingViewController:(uint64_t)a3 animationControllerForOperation:(uint64_t)a4 onViewController:(uint64_t)a5 animated:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, a2, a3, "Forcing cross-fade animation for folder transition for icon: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_setupIconTableViewController:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_1CFEF3000, a2, a3, "Failing to set up App Library: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_updateLibraryCategoryMap:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Nil category map received; queueing up an update!",
    v1,
    2u);
}

@end
