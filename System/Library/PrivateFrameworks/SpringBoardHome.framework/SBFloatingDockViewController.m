@implementation SBFloatingDockViewController

- (SBFloatingDockViewController)initWithIconManager:(id)a3 iconViewProvider:(id)a4
{
  id v6;
  id v7;
  SBFloatingDockViewController *v8;
  SBFloatingDockViewController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  SBIconListModel *dockListModel;
  uint64_t v14;
  SBIconListLayoutProvider *listLayoutProvider;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  objc_super v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v21.receiver = self;
  v21.super_class = (Class)SBFloatingDockViewController;
  v8 = -[SBFloatingDockViewController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, 0, 0);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_iconManager, v6);
    objc_storeWeak((id *)&v9->_iconViewProvider, v7);
    objc_msgSend(v6, "iconModel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "rootFolder");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dock");
    v12 = objc_claimAutoreleasedReturnValue();
    dockListModel = v9->_dockListModel;
    v9->_dockListModel = (SBIconListModel *)v12;

    objc_msgSend(v6, "listLayoutProvider");
    v14 = objc_claimAutoreleasedReturnValue();
    listLayoutProvider = v9->_listLayoutProvider;
    v9->_listLayoutProvider = (SBIconListLayoutProvider *)v14;

    +[SBHFloatingDockStyleConfiguration defaultConfiguration](SBHFloatingDockStyleConfiguration, "defaultConfiguration");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockViewController setUnderlyingPresentationStyleConfiguration:](v9, "setUnderlyingPresentationStyleConfiguration:", v16);

    objc_opt_self();
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v22[0] = v17;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v22, 1);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (id)-[SBFloatingDockViewController registerForTraitChanges:withAction:](v9, "registerForTraitChanges:withAction:", v18, sel__updateViewBackdropGroupName);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)SBFloatingDockViewController;
  -[SBFloatingDockViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  SBFloatingDockView *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SBFolderPresentingViewController *v14;
  void *v15;
  void *v16;
  void *v17;
  SBHTouchPassThroughView *v18;
  SBHTouchPassThroughView *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)SBFloatingDockViewController;
  -[SBFloatingDockViewController viewDidLoad](&v21, sel_viewDidLoad);
  -[SBFloatingDockViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockViewController dockListModel](self, "dockListModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addListObserver:", self);
  v6 = objc_alloc_init(SBFloatingDockView);
  -[SBFloatingDockView mainPlatterView](v6, "mainPlatterView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockViewController _backdropGroupName](self, "_backdropGroupName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackdropGroupName:", v8);

  -[SBFloatingDockViewController _backdropGroupNamespace](self, "_backdropGroupNamespace");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackdropGroupNamespace:", v9);

  -[SBFloatingDockView setDelegate:](v6, "setDelegate:", self);
  -[SBFloatingDockViewController setDockView:](self, "setDockView:", v6);
  objc_msgSend(v3, "addSubview:", v6);
  -[SBFloatingDockViewController _rebuildUserIconListView](self, "_rebuildUserIconListView");
  self->_libraryPodIconVisible = 1;
  -[SBFloatingDockViewController _updateLibraryPodDockAccessoryViewDisplayed](self, "_updateLibraryPodDockAccessoryViewDisplayed");
  -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    -[SBFloatingDockViewController addChildViewController:](self, "addChildViewController:", v10);
    objc_msgSend(v10, "listView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockView setRecentIconListView:](v6, "setRecentIconListView:", v11);
    objc_msgSend(v10, "didMoveToParentViewController:", self);
    objc_msgSend(v4, "iconImageCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setIconImageCache:", v12);

    objc_msgSend(v4, "folderIconImageCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setFolderIconImageCache:", v13);

  }
  v14 = objc_alloc_init(SBFolderPresentingViewController);
  -[SBFolderPresentingViewController setFolderPresentationDelegate:](v14, "setFolderPresentationDelegate:", self);
  -[SBFloatingDockViewController setFolderPresentingViewController:](self, "setFolderPresentingViewController:", v14);
  -[SBFolderPresentingViewController view](v14, "view");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAutoresizingMask:", 18);

  -[SBFolderPresentingViewController view](v14, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v16, "setFrame:");

  -[SBFloatingDockViewController bs_addChildViewController:](self, "bs_addChildViewController:", v14);
  -[SBFolderPresentingViewController view](v14, "view");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sendSubviewToBack:", v17);

  v18 = [SBHTouchPassThroughView alloc];
  objc_msgSend(v3, "bounds");
  v19 = -[SBHTouchPassThroughView initWithFrame:](v18, "initWithFrame:");
  -[SBHTouchPassThroughView setAutoresizingMask:](v19, "setAutoresizingMask:", 18);
  -[SBFloatingDockViewController setScalingView:](self, "setScalingView:", v19);
  objc_msgSend(v3, "addSubview:", v19);
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_iconManagerDidChangeIconModel_, CFSTR("SBHIconManagerIconModelDidChange"), v4);
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_iconModelDidLayout_, CFSTR("SBIconModelDidLayoutIconStateNotification"), 0);
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_iconEditingDidChange_, CFSTR("SBHIconManagerEditingStateChanged"), v4);
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_iconDraggingDidChange_, CFSTR("SBHIconManagerIconDraggingChanged"), v4);
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_listLayoutProviderDidChange_, CFSTR("SBHIconManagerListLayoutProviderDidChange"), v4);
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_reduceTransparencyEnabledStateDidChange_, *MEMORY[0x1E0DC45B8], 0);
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel__sizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFloatingDockViewController;
  -[SBFloatingDockViewController viewDidAppear:](&v7, sel_viewDidAppear_, a3);
  -[SBFloatingDockViewController dockView](self, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "sb_coronaAnimationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addParticipant:", self);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBFloatingDockViewController;
  -[SBFloatingDockViewController viewDidDisappear:](&v7, sel_viewDidDisappear_, a3);
  -[SBFloatingDockViewController dockView](self, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v5, "sb_coronaAnimationController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeParticipant:", self);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  SBFloatingDockView *dockView;
  SBFloatingDockView *v15;
  __int128 v16;
  CGFloat v17;
  double v18;
  void *v19;
  void *v20;
  CGAffineTransform v21;
  CGAffineTransform v22;
  CGRect remainder;
  CGRect slice;
  objc_super v25;
  CGRect v26;

  v25.receiver = self;
  v25.super_class = (Class)SBFloatingDockViewController;
  -[SBFloatingDockViewController viewDidLayoutSubviews](&v25, sel_viewDidLayoutSubviews);
  -[SBFloatingDockViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBFloatingDockViewController contentHeightForFrame:](self, "contentHeightForFrame:");
  UICeilToViewScale();
  v13 = v12;
  memset(&slice, 0, sizeof(slice));
  memset(&remainder, 0, sizeof(remainder));
  v26.origin.x = v5;
  v26.origin.y = v7;
  v26.size.width = v9;
  v26.size.height = v11;
  CGRectDivide(v26, &slice, &remainder, v13, CGRectMaxYEdge);
  -[SBFloatingDockView setBounds:](self->_dockView, "setBounds:", 0.0, 0.0, slice.size.width, slice.size.height);
  dockView = self->_dockView;
  UIRectGetCenter();
  -[SBFloatingDockView setCenter:](dockView, "setCenter:");
  v15 = self->_dockView;
  -[SBFloatingDockViewController translationFromFullyPresentedFrame](self, "translationFromFullyPresentedFrame");
  v16 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  *(_OWORD *)&v21.a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&v21.c = v16;
  *(_OWORD *)&v21.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  CGAffineTransformTranslate(&v22, &v21, 0.0, v17);
  -[SBFloatingDockView setTransform:](v15, "setTransform:", &v22);
  -[SBFloatingDockViewController lastDockHeight](self, "lastDockHeight");
  if (v13 != v18)
  {
    -[SBFloatingDockViewController setLastDockHeight:](self, "setLastDockHeight:", v13);
    -[SBFloatingDockViewController iconManager](self, "iconManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "noteFloatingDockWillChangeHeight");
    -[SBFloatingDockViewController delegate](self, "delegate");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "floatingDockViewController:didChangeContentHeight:", self, v13);

  }
  -[SBFloatingDockView setFocusGroupIdentifier:](self->_dockView, "setFocusGroupIdentifier:", CFSTR("FolderViewFocusGroup"));

}

- (SBFloatingDockView)dockView
{
  -[SBFloatingDockViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_dockView;
}

- (id)dockViewIfExists
{
  return self->_dockView;
}

- (void)setDockView:(id)a3
{
  objc_storeStrong((id *)&self->_dockView, a3);
}

- (id)userIconListView
{
  void *v2;
  void *v3;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "userIconListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)libraryPodIconViewIfLoaded
{
  return self->_libraryPodIconView;
}

- (SBIconView)libraryPodIconView
{
  SBIconView **p_libraryPodIconView;
  SBIconView *libraryPodIconView;
  void *v5;
  SBHLibraryPodIndicatorIcon *v6;
  unint64_t v7;
  SBIconView *v8;
  void *v9;
  SBIconView *v10;
  void *v11;
  void *v12;
  void *v13;
  SBHLibraryIndicatorIconDropInteractionDelegate *v14;
  SBHLibraryIndicatorIconDropInteractionDelegate *libraryIconDropInteractionDelegate;
  void *v16;
  SBIconView *v17;
  _QWORD v19[4];
  SBIconView *v20;

  p_libraryPodIconView = &self->_libraryPodIconView;
  libraryPodIconView = self->_libraryPodIconView;
  if (!libraryPodIconView)
  {
    -[SBFloatingDockViewController iconManager](self, "iconManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc_init(SBHLibraryPodIndicatorIcon);
    v7 = +[SBDockIconListView defaultIconViewConfigurationOptions](SBDockIconListView, "defaultIconViewConfigurationOptions") | 0x10;
    v8 = [SBIconView alloc];
    objc_msgSend(v5, "listLayoutProvider");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[SBIconView initWithConfigurationOptions:listLayoutProvider:](v8, "initWithConfigurationOptions:listLayoutProvider:", v7, v9);

    -[SBIconView setDelegate:](v10, "setDelegate:", self);
    -[SBIconView addObserver:](v10, "addObserver:", self);
    -[SBIconView setIcon:](v10, "setIcon:", v6);
    -[SBIconView setAllowsCloseBox:](v10, "setAllowsCloseBox:", 0);
    -[SBIconView setAllowsEditingAnimation:](v10, "setAllowsEditingAnimation:", 0);
    -[SBIconView setIconContentScalingEnabled:](v10, "setIconContentScalingEnabled:", 1);
    -[SBFloatingDockViewController userIconLocation](self, "userIconLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView setLocation:animated:](v10, "setLocation:animated:", v11, 0);

    objc_msgSend(v5, "iconImageCache");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView setIconImageCache:](v10, "setIconImageCache:", v12);

    objc_msgSend(v5, "folderIconImageCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconView setFolderIconImageCache:](v10, "setFolderIconImageCache:", v13);

    v14 = -[SBHLibraryIndicatorIconDropInteractionDelegate initWithLibraryIndicatorIconView:]([SBHLibraryIndicatorIconDropInteractionDelegate alloc], "initWithLibraryIndicatorIconView:", v10);
    libraryIconDropInteractionDelegate = self->_libraryIconDropInteractionDelegate;
    self->_libraryIconDropInteractionDelegate = v14;

    -[SBHLibraryIndicatorIconDropInteractionDelegate setContextProvider:](self->_libraryIconDropInteractionDelegate, "setContextProvider:", self);
    objc_storeStrong((id *)p_libraryPodIconView, v10);
    v16 = (void *)MEMORY[0x1E0DC3F10];
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __50__SBFloatingDockViewController_libraryPodIconView__block_invoke;
    v19[3] = &unk_1E8D84C50;
    v20 = v10;
    v17 = v10;
    objc_msgSend(v16, "performWithoutAnimation:", v19);

    libraryPodIconView = *p_libraryPodIconView;
  }
  return libraryPodIconView;
}

uint64_t __50__SBFloatingDockViewController_libraryPodIconView__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (id)recentIconListView
{
  void *v2;
  void *v3;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recentIconListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)setLibraryPodIconEnabled:(BOOL)a3
{
  _BOOL4 v5;
  SBIconView *libraryPodIconView;
  SBHLibraryIconViewController *libraryIconViewController;
  SBHLibraryIndicatorIconDropInteractionDelegate *libraryIconDropInteractionDelegate;

  if (self->_libraryPodIconEnabled != a3)
  {
    v5 = -[SBFloatingDockViewController isLibraryPodIconEffectivelyVisible](self, "isLibraryPodIconEffectivelyVisible");
    self->_libraryPodIconEnabled = a3;
    if (v5 != -[SBFloatingDockViewController isLibraryPodIconEffectivelyVisible](self, "isLibraryPodIconEffectivelyVisible"))-[SBFloatingDockViewController _resizeDockForChangedNumberOfIconsAnimated:](self, "_resizeDockForChangedNumberOfIconsAnimated:", 1);
    if (!a3)
    {
      libraryPodIconView = self->_libraryPodIconView;
      self->_libraryPodIconView = 0;

      libraryIconViewController = self->_libraryIconViewController;
      self->_libraryIconViewController = 0;

      libraryIconDropInteractionDelegate = self->_libraryIconDropInteractionDelegate;
      self->_libraryIconDropInteractionDelegate = 0;

      -[SBFloatingDockViewController _updateLibraryPodDockAccessoryViewDisplayed](self, "_updateLibraryPodDockAccessoryViewDisplayed");
    }
  }
}

- (void)_rebuildLibraryPodIcon
{
  SBIconView *libraryPodIconView;
  SBHLibraryIconViewController *libraryIconViewController;
  SBHLibraryIndicatorIconDropInteractionDelegate *libraryIconDropInteractionDelegate;
  id v6;

  if (-[SBFloatingDockViewController isLibraryPodIconEnabled](self, "isLibraryPodIconEnabled"))
  {
    libraryPodIconView = self->_libraryPodIconView;
    self->_libraryPodIconView = 0;

    libraryIconViewController = self->_libraryIconViewController;
    self->_libraryIconViewController = 0;

    libraryIconDropInteractionDelegate = self->_libraryIconDropInteractionDelegate;
    self->_libraryIconDropInteractionDelegate = 0;

    -[SBFloatingDockViewController dockView](self, "dockView");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessoryIconView:", 0);
    -[SBFloatingDockViewController _updateLibraryPodDockAccessoryViewDisplayed](self, "_updateLibraryPodDockAccessoryViewDisplayed");

  }
}

- (void)setLibraryPodIconVisible:(BOOL)a3
{
  -[SBFloatingDockViewController setLibraryPodIconVisible:animated:](self, "setLibraryPodIconVisible:animated:", a3, 1);
}

- (void)setLibraryPodIconVisible:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL4 v7;

  if (self->_libraryPodIconVisible != a3)
  {
    v4 = a4;
    v7 = -[SBFloatingDockViewController isLibraryPodIconEffectivelyVisible](self, "isLibraryPodIconEffectivelyVisible");
    self->_libraryPodIconVisible = a3;
    if (v7 != -[SBFloatingDockViewController isLibraryPodIconEffectivelyVisible](self, "isLibraryPodIconEffectivelyVisible"))-[SBFloatingDockViewController _resizeDockForChangedNumberOfIconsAnimated:](self, "_resizeDockForChangedNumberOfIconsAnimated:", v4);
  }
}

- (BOOL)isLibraryPodIconEffectivelyVisible
{
  _BOOL4 v3;

  v3 = -[SBFloatingDockViewController isLibraryPodIconEnabled](self, "isLibraryPodIconEnabled");
  if (v3)
    LOBYTE(v3) = -[SBFloatingDockViewController isLibraryPodIconVisible](self, "isLibraryPodIconVisible");
  return v3;
}

- (id)configureForPresentingLibraryViewController:(id)a3
{
  SBHLibraryViewController *v5;
  SBHLibraryViewController *libraryViewController;
  SBHLibraryIconViewController *libraryIconViewController;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  SBFloatingDockViewController *v13;
  SBFloatingDockViewController *v14;
  SBHModalLibraryPresenter *v15;
  void *v16;

  v5 = (SBHLibraryViewController *)a3;
  libraryViewController = self->_libraryViewController;
  if (libraryViewController != v5)
  {
    -[SBHLibraryViewController removeObserver:](libraryViewController, "removeObserver:", self);
    objc_storeStrong((id *)&self->_libraryViewController, a3);
    -[SBHLibraryViewController addObserver:](self->_libraryViewController, "addObserver:", self);
    libraryIconViewController = self->_libraryIconViewController;
    -[SBHLibraryViewController podFolderViewController](v5, "podFolderViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "dataSource");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryIconViewController setLibraryDataSource:](libraryIconViewController, "setLibraryDataSource:", v9);

    if (v5)
    {
      -[SBFloatingDockViewController delegate](self, "delegate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "libraryContainerViewControllerForFloatingDockViewController:", self);
      v11 = objc_claimAutoreleasedReturnValue();
      v12 = (void *)v11;
      if (v11)
        v13 = (SBFloatingDockViewController *)v11;
      else
        v13 = self;
      v14 = v13;

      v15 = -[SBHModalLibraryPresenter initWithContainerViewController:libraryViewController:]([SBHModalLibraryPresenter alloc], "initWithContainerViewController:libraryViewController:", v14, v5);
      -[SBHModalLibraryPresenter setContextProvider:](v15, "setContextProvider:", self);
      -[SBHLibraryViewController setPresenter:](v5, "setPresenter:", v15);
      -[SBFloatingDockViewController setLibraryPresenter:](self, "setLibraryPresenter:", v15);

    }
    else
    {
      -[SBFloatingDockViewController setLibraryPresenter:](self, "setLibraryPresenter:", 0);
    }
  }
  -[SBFloatingDockViewController libraryPresenter](self, "libraryPresenter");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void)setSuggestionsViewController:(id)a3
{
  SBFloatingDockSuggestionsViewProviding *v5;
  SBFloatingDockSuggestionsViewProviding *suggestionsViewController;
  SBFloatingDockSuggestionsViewProviding *v7;

  v5 = (SBFloatingDockSuggestionsViewProviding *)a3;
  suggestionsViewController = self->_suggestionsViewController;
  if (suggestionsViewController != v5)
  {
    v7 = v5;
    -[SBFloatingDockSuggestionsViewProviding setFloatingDockViewController:](suggestionsViewController, "setFloatingDockViewController:", 0);
    objc_storeStrong((id *)&self->_suggestionsViewController, a3);
    -[SBFloatingDockSuggestionsViewProviding setFloatingDockViewController:](self->_suggestionsViewController, "setFloatingDockViewController:", self);
    v5 = v7;
  }

}

- (id)suggestionsIconLocation
{
  void *v2;
  void *v3;
  void *v4;

  -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "listView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)userIconLocation
{
  return CFSTR("SBIconLocationFloatingDock");
}

- (double)maximumContentHeight
{
  return 150.0;
}

- (double)contentHeight
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentHeight");
  v4 = v3;

  return v4;
}

- (double)contentHeightForFrame:(CGRect)a3
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
  -[SBFloatingDockViewController dockView](self, "dockView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "contentHeightForBounds:", x, y, width, height);
  v9 = v8;

  return v9;
}

- (double)preferredVerticalMargin
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "interIconSpacing");
  v4 = v3;

  return v4;
}

- (double)requestedVerticalMargin
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "platterVerticalMargin");
  v4 = v3;

  return v4;
}

- (void)setRequestedVerticalMargin:(double)a3
{
  id v4;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPlatterVerticalMargin:", a3);

}

- (double)minimumVerticalMarginForFrame:(CGRect)a3
{
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
  double v14;

  BSRectWithSize();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBFloatingDockViewController dockView](self, "dockView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "platterShadowOutsetsForBounds:", v5, v7, v9, v11);
  v14 = v13;

  return v14;
}

- (double)translationFromFullyPresentedFrame
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
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  -[SBFloatingDockViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[SBFloatingDockViewController contentHeightForFrame:](self, "contentHeightForFrame:");
  UICeilToViewScale();
  v13 = v12;
  -[SBFloatingDockViewController dockOffscreenProgress](self, "dockOffscreenProgress");
  v15 = v14;
  v16 = 0.0;
  if ((BSFloatIsZero() & 1) == 0)
  {
    -[SBFloatingDockViewController minimumVerticalMarginForFrame:](self, "minimumVerticalMarginForFrame:", v5, v7, v9, v11);
    v16 = v15 * (v13 + v17);
  }

  return v16;
}

- (double)maximumDockContinuousCornerRadius
{
  void *v2;
  double v3;
  double v4;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumDockContinuousCornerRadius");
  v4 = v3;

  return v4;
}

- (void)enumerateVisibleIconViewsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__SBFloatingDockViewController_enumerateVisibleIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_1E8D852B8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "enumerateIconViewsUsingBlock:", v7);

}

uint64_t __68__SBFloatingDockViewController_enumerateVisibleIconViewsUsingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateIconListViewsUsingBlock:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a3;
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[2](v7, v4);

  -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "listView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
    v7[2](v7, v6);

}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (void)setLegibilitySettings:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_legibilitySettings) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBFloatingDockViewController folderPresentingViewController](self, "folderPresentingViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentedFolderController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLegibilitySettings:", v5);

    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __54__SBFloatingDockViewController_setLegibilitySettings___block_invoke;
    v8[3] = &unk_1E8D8D338;
    v9 = v5;
    -[SBFloatingDockViewController enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", v8);

  }
}

uint64_t __54__SBFloatingDockViewController_setLegibilitySettings___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLegibilitySettings:", *(_QWORD *)(a1 + 32));
}

- (BOOL)isPresentingFolder
{
  void *v3;
  void *v4;
  char v5;

  -[SBFloatingDockViewController presentedFolderController](self, "presentedFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[SBFloatingDockViewController presentedFolderController](self, "presentedFolderController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isOpen");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (SBFolderController)presentedFolderController
{
  void *v2;
  void *v3;

  -[SBFloatingDockViewController folderPresentingViewController](self, "folderPresentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "presentedFolderController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBFolderController *)v3;
}

- (BOOL)isEditing
{
  void *v2;
  char v3;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEditing");

  return v3;
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[SBFloatingDockViewController dockView](self, "dockView");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEditing:", v3);

}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;
  id v6;

  v4 = a4;
  v5 = a3;
  -[SBFloatingDockViewController dockView](self, "dockView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEditing:animated:", v5, v4);

}

- (CGSize)maximumEditingIconSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumEditingIconSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)setMaximumEditingIconSize:(CGSize)a3
{
  double height;
  double width;
  id v5;

  height = a3.height;
  width = a3.width;
  -[SBFloatingDockViewController dockView](self, "dockView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaximumEditingIconSize:", width, height);

}

- (void)setSuppressesEditingStateForListViews:(BOOL)a3
{
  if (self->_suppressesEditingStateForListViews != a3)
  {
    self->_suppressesEditingStateForListViews = a3;
    -[SBFloatingDockViewController _updateEditingStateAnimated:](self, "_updateEditingStateAnimated:", 1);
  }
}

- (void)setListLayoutProvider:(id)a3
{
  -[SBFloatingDockViewController setListLayoutProvider:animated:](self, "setListLayoutProvider:animated:", a3, 0);
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  SBIconListLayoutProvider *v7;
  SBIconListLayoutProvider *v8;
  _QWORD v9[4];
  SBIconListLayoutProvider *v10;
  BOOL v11;

  v4 = a4;
  v8 = (SBIconListLayoutProvider *)a3;
  if (self->_listLayoutProvider != v8)
  {
    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __63__SBFloatingDockViewController_setListLayoutProvider_animated___block_invoke;
    v9[3] = &unk_1E8D8DD40;
    v7 = v8;
    v10 = v7;
    v11 = v4;
    -[SBFloatingDockViewController enumerateIconListsUsingBlock:](self, "enumerateIconListsUsingBlock:", v9);
    -[SBIconView setListLayoutProvider:animated:](self->_libraryPodIconView, "setListLayoutProvider:animated:", v7, v4);
    -[SBFloatingDockViewController _resizeDockForChangedNumberOfIconsAnimated:](self, "_resizeDockForChangedNumberOfIconsAnimated:", v4);

  }
}

uint64_t __63__SBFloatingDockViewController_setListLayoutProvider_animated___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setLayoutProvider:animated:", *(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (NSString)description
{
  return (NSString *)-[SBFloatingDockViewController descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (CGRect)floatingDockScreenFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double x;
  double y;
  double width;
  double height;
  void *v21;
  double v22;
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
  CGRect v34;
  CGRect v35;
  CGRect result;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "platterFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[SBFloatingDockViewController translationFromFullyPresentedFrame](self, "translationFromFullyPresentedFrame");
    v16 = v15;
    v34.origin.x = v8;
    v34.origin.y = v10;
    v34.size.width = v12;
    v34.size.height = v14;
    v35 = CGRectOffset(v34, 0.0, v16);
    x = v35.origin.x;
    y = v35.origin.y;
    width = v35.size.width;
    height = v35.size.height;
    objc_msgSend(v6, "fixedCoordinateSpace");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertRect:toCoordinateSpace:", v21, x, y, width, height);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;

  }
  else
  {
    v23 = *MEMORY[0x1E0C9D648];
    v25 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v27 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v29 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v30 = v23;
  v31 = v25;
  v32 = v27;
  v33 = v29;
  result.size.height = v33;
  result.size.width = v32;
  result.origin.y = v31;
  result.origin.x = v30;
  return result;
}

- (CGRect)floatingDockScreenPresentationFrame
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double x;
  double y;
  double width;
  double height;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
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
  double v43;
  double v44;
  CGRect v45;
  CGRect v46;
  CGRect result;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v3, "platterFrame");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[SBFloatingDockViewController translationFromFullyPresentedFrame](self, "translationFromFullyPresentedFrame");
    v16 = v15;
    v45.origin.x = v8;
    v45.origin.y = v10;
    v45.size.width = v12;
    v45.size.height = v14;
    v46 = CGRectOffset(v45, 0.0, v16);
    x = v46.origin.x;
    y = v46.origin.y;
    width = v46.size.width;
    height = v46.size.height;
    objc_msgSend(v3, "layer");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "layer");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "presentationLayer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "convertRect:fromLayer:", v23, x, y, width, height);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    objc_msgSend(v6, "fixedCoordinateSpace");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "convertRect:toCoordinateSpace:", v32, v25, v27, v29, v31);
    v34 = v33;
    v36 = v35;
    v38 = v37;
    v40 = v39;

  }
  else
  {
    v34 = *MEMORY[0x1E0C9D648];
    v36 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v38 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v40 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  }

  v41 = v34;
  v42 = v36;
  v43 = v38;
  v44 = v40;
  result.size.height = v44;
  result.size.width = v43;
  result.origin.y = v42;
  result.origin.x = v41;
  return result;
}

- (void)dockViewWillBecomeVisible
{
  void *v3;
  id v4;

  -[SBFloatingDockViewController _updateLibraryPodIconComponentVisibility](self, "_updateLibraryPodIconComponentVisibility");
  -[SBFloatingDockViewController dockView](self, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 0);

  -[SBFloatingDockViewController enumerateVisibleIconViewsUsingBlock:](self, "enumerateVisibleIconViewsUsingBlock:", &__block_literal_global_72);
  -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dockViewWillBecomeVisible");

}

uint64_t __57__SBFloatingDockViewController_dockViewWillBecomeVisible__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPaused:forReason:", 0, 4);
}

- (void)dockViewWillResignVisible
{
  id v3;

  -[SBFloatingDockViewController enumerateVisibleIconViewsUsingBlock:](self, "enumerateVisibleIconViewsUsingBlock:", &__block_literal_global_53_0);
  -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockViewWillResignVisible");

}

uint64_t __57__SBFloatingDockViewController_dockViewWillResignVisible__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setPaused:forReason:", 1, 4);
}

- (void)dockViewDidResignVisible
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dockViewDidResignVisible");

  -[SBFloatingDockViewController dockView](self, "dockView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_coronaAnimationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeParticipant:", self);

  objc_msgSend(v7, "setHidden:", 1);
  -[SBFloatingDockViewController _updateLibraryPodIconComponentVisibility](self, "_updateLibraryPodIconComponentVisibility");
  objc_msgSend(MEMORY[0x1E0DC37E0], "focusSystemForEnvironment:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_focusEnvironmentWillDisappear:", v7);

}

- (void)dockViewDidBecomeVisible
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sb_coronaAnimationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addParticipant:", self);

  -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dockViewDidBecomeVisible");

}

- (void)layoutUserControlledIconListsWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  _BOOL8 v4;
  void *v7;
  void *v8;
  id v9;

  v4 = a4;
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v7;
  if (v4)
  {
    objc_msgSend(v7, "setIconsNeedLayout");
    v7 = v9;
  }
  objc_msgSend(v7, "layoutIconsIfNeededWithAnimationType:options:", a3, 0);
  -[SBFloatingDockViewController presentedFolderController](self, "presentedFolderController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutIconListsWithAnimationType:forceRelayout:", a3, v4);

}

- (void)enumerateIconListsUsingBlock:(id)a3
{
  void (**v4)(id, id);
  void *v5;
  id v6;

  v4 = (void (**)(id, id))a3;
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v6);
  -[SBFloatingDockViewController recentIconListView](self, "recentIconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v4[2](v4, v5);

}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  BOOL v7;
  void *v8;

  v4 = a3;
  -[SBFloatingDockViewController userIconLocation](self, "userIconLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[SBFloatingDockViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v4, v5);

  if (v6)
  {
    v7 = 1;
  }
  else
  {
    -[SBFloatingDockViewController suggestionsIconLocation](self, "suggestionsIconLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v8
      && -[SBFloatingDockViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v4, v8);

  }
  return v7;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "isDisplayingIconView:", v4) & 1) != 0)
  {
    v6 = 1;
  }
  else
  {
    -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "listView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = objc_msgSend(v8, "isDisplayingIconView:", v4);
  }

  return v6;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  char v15;
  BOOL v16;

  v6 = a3;
  v7 = a4;
  -[SBFloatingDockViewController userIconLocation](self, "userIconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[SBFloatingDockViewController userIconListView](self, "userIconListView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
LABEL_5:
    v15 = objc_msgSend(v10, "isDisplayingIconView:", v6);
    goto LABEL_6;
  }
  -[SBFloatingDockViewController suggestionsIconLocation](self, "suggestionsIconLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v7, "isEqualToString:", v12);

  if (v13)
  {
    -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "listView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v11;
    goto LABEL_5;
  }
  if (!self->_libraryPodIconView
    || !-[SBFloatingDockViewController isLibraryPodIconEffectivelyVisible](self, "isLibraryPodIconEffectivelyVisible"))
  {
    v16 = 0;
    goto LABEL_7;
  }
  -[SBIconView location](self->_libraryPodIconView, "location");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v7, "isEqualToString:", v11);
LABEL_6:
  v16 = v15;

LABEL_7:
  return v16;
}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4;
  id v5;
  char v6;
  _QWORD v7[4];
  id v8;
  _QWORD *v9;
  _QWORD v10[3];
  char v11;

  v4 = a3;
  v10[0] = 0;
  v10[1] = v10;
  v10[2] = 0x2020000000;
  v11 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __70__SBFloatingDockViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_1E8D8DD88;
  v9 = v10;
  v5 = v4;
  v8 = v5;
  -[SBFloatingDockViewController enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", v7);
  if (self->_libraryPodIconView
    && -[SBFloatingDockViewController isLibraryPodIconEffectivelyVisible](self, "isLibraryPodIconEffectivelyVisible"))
  {
    v6 = 0;
    (*((void (**)(id, SBIconView *, char *))v5 + 2))(v5, self->_libraryPodIconView, &v6);
  }

  _Block_object_dispose(v10, 8);
}

void __70__SBFloatingDockViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1, void *a2)
{
  id v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __70__SBFloatingDockViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke_2;
    v6[3] = &unk_1E8D86D10;
    v4 = *(id *)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    v7 = v4;
    v8 = v5;
    objc_msgSend(a2, "enumerateIconViewsUsingBlock:", v6);

  }
}

uint64_t __70__SBFloatingDockViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;
  char v7;

  v7 = 0;
  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
  return result;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  void (**v6)(id, void *);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = (void (**)(id, void *))a4;
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedIconViewForIcon:", v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
    v6[2](v6, v8);
  -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "listView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayedIconViewForIcon:", v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    v6[2](v6, v11);
  if (self->_libraryPodIconView)
  {
    if (-[SBFloatingDockViewController isLibraryPodIconEffectivelyVisible](self, "isLibraryPodIconEffectivelyVisible"))
    {
      -[SBIconView icon](self->_libraryPodIconView, "icon");
      v12 = (id)objc_claimAutoreleasedReturnValue();

      if (v12 == v13)
        v6[2](v6, self->_libraryPodIconView);
    }
  }

}

- (void)prepareForTransitionToStyleConfiguration:(id)a3 fromDockVisible:(BOOL)a4 toDockVisible:(BOOL)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  id v15;

  v5 = a5;
  v6 = a4;
  v8 = a3;
  -[SBFloatingDockViewController setTransitioningUnderlyingPresentationStyleConfiguration:](self, "setTransitioningUnderlyingPresentationStyleConfiguration:", 1);
  -[SBFloatingDockViewController setTransitionTargetUnderlyingPresentationStyleConfiguration:](self, "setTransitionTargetUnderlyingPresentationStyleConfiguration:", v8);
  if (v6 && v5)
  {
    v9 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __103__SBFloatingDockViewController_prepareForTransitionToStyleConfiguration_fromDockVisible_toDockVisible___block_invoke;
    v14[3] = &unk_1E8D84EF0;
    v14[4] = self;
    v15 = v8;
    objc_msgSend(v9, "animateWithDuration:animations:", v14, 0.3);
    v10 = v15;
LABEL_7:

    goto LABEL_8;
  }
  if (v5 && !v6)
  {
    v11 = (void *)MEMORY[0x1E0DC3F10];
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __103__SBFloatingDockViewController_prepareForTransitionToStyleConfiguration_fromDockVisible_toDockVisible___block_invoke_2;
    v12[3] = &unk_1E8D84EF0;
    v12[4] = self;
    v13 = v8;
    objc_msgSend(v11, "performWithoutAnimation:", v12);
    v10 = v13;
    goto LABEL_7;
  }
LABEL_8:

}

uint64_t __103__SBFloatingDockViewController_prepareForTransitionToStyleConfiguration_fromDockVisible_toDockVisible___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDockForStyleConfiguration:", *(_QWORD *)(a1 + 40));
}

uint64_t __103__SBFloatingDockViewController_prepareForTransitionToStyleConfiguration_fromDockVisible_toDockVisible___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateDockForStyleConfiguration:", *(_QWORD *)(a1 + 40));
}

- (void)cleanUpAfterUnderlyingBackgroundStyleTransition
{
  id v3;

  -[SBFloatingDockViewController transitionTargetUnderlyingPresentationStyleConfiguration](self, "transitionTargetUnderlyingPresentationStyleConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockViewController setTransitioningUnderlyingPresentationStyleConfiguration:](self, "setTransitioningUnderlyingPresentationStyleConfiguration:", 0);
  -[SBFloatingDockViewController setUnderlyingPresentationStyleConfiguration:](self, "setUnderlyingPresentationStyleConfiguration:", v3);
  -[SBFloatingDockViewController _updateDockForStyleConfiguration:](self, "_updateDockForStyleConfiguration:", v3);

}

- (void)setDockOffscreenProgress:(double)a3
{
  void *v4;
  id v5;

  if (self->_dockOffscreenProgress != a3)
  {
    self->_dockOffscreenProgress = a3;
    -[SBFloatingDockViewController viewIfLoaded](self, "viewIfLoaded");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setNeedsLayout");

    -[SBFloatingDockViewController viewIfLoaded](self, "viewIfLoaded");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layoutIfNeeded");

  }
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  -[SBFloatingDockViewController suggestionsIconLocation](self, "suggestionsIconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v7, "isEqualToString:", v8))
  {
    -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconViewForIcon:location:", v6, v7);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBFloatingDockViewController userIconLocation](self, "userIconLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "isEqualToString:", v11);

    if (!v12
      || (-[SBFloatingDockViewController userIconListView](self, "userIconListView"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v13, "model"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v14, "directlyContainsIcon:", v6),
          v14,
          v13,
          !v15))
    {
      v16 = 0;
      goto LABEL_9;
    }
    -[SBFloatingDockViewController userIconListView](self, "userIconListView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "displayedIconViewForIcon:", v6);
    v10 = objc_claimAutoreleasedReturnValue();
  }
  v16 = (void *)v10;

LABEL_9:
  return v16;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = a4;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    while (2)
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        -[SBFloatingDockViewController iconViewForIcon:location:](self, "iconViewForIcon:location:", v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
        v12 = objc_claimAutoreleasedReturnValue();
        if (v12)
        {
          v13 = (void *)v12;
          goto LABEL_11;
        }
        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      if (v9)
        continue;
      break;
    }
  }
  v13 = 0;
LABEL_11:

  return v13;
}

- (id)firstIconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[SBFloatingDockViewController presentedIconLocations](self, "presentedIconLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockViewController firstIconViewForIcon:inLocations:](self, "firstIconViewForIcon:inLocations:", v4, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)firstIconViewForIcon:(id)a3 excludingLocations:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[SBFloatingDockViewController presentedIconLocations](self, "presentedIconLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "minusSet:", v6);
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockViewController firstIconViewForIcon:inLocations:](self, "firstIconViewForIcon:inLocations:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)firstIconViewForIcon:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayedIconViewForIcon:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v8)
  {
    if ((a4 & 0x40) != 0)
    {
      v8 = 0;
    }
    else
    {
      -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      SBIconViewQueryingFirstIconViewForIcon(v9, v6, a4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v8;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  int v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  -[SBFloatingDockViewController suggestionsIconLocation](self, "suggestionsIconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 && objc_msgSend(v7, "isEqualToString:", v8))
  {
    -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "isDisplayingIcon:inLocation:", v6, v7);
  }
  else
  {
    -[SBFloatingDockViewController userIconLocation](self, "userIconLocation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v7, "isEqualToString:", v11);

    if (!v12)
    {
      v10 = 0;
      goto LABEL_8;
    }
    -[SBFloatingDockViewController userIconListView](self, "userIconListView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "model");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v13, "directlyContainsIcon:", v6);

  }
LABEL_8:

  return v10;
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
        if (-[SBFloatingDockViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
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

- (void)_addDockGestureRecognizer:(id)a3
{
  -[SBFloatingDockView addGestureRecognizer:](self->_dockView, "addGestureRecognizer:", a3);
}

- (void)_setPaddingEdgeInsets:(UIEdgeInsets)a3
{
  -[SBFloatingDockView setPaddingEdgeInsets:](self->_dockView, "setPaddingEdgeInsets:", a3.top, a3.left, a3.bottom, a3.right);
}

- (void)_rebuildUserIconListView
{
  void *v3;
  void *v4;
  SBFloatingDockIconListView *v5;
  void *v6;
  void *v7;
  SBFloatingDockIconListView *v8;
  void *v9;
  void *v10;
  id v11;

  -[SBFloatingDockViewController dockViewIfExists](self, "dockViewIfExists");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    -[SBFloatingDockViewController iconManager](self, "iconManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockViewController dockListModel](self, "dockListModel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = [SBFloatingDockIconListView alloc];
    objc_msgSend(v3, "listLayoutProvider");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockViewController userIconLocation](self, "userIconLocation");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[SBDockIconListView initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:](v5, "initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:", v4, v6, v7, 1, self);

    -[SBIconListView setIconViewConfigurationOptions:](v8, "setIconViewConfigurationOptions:", 2);
    -[SBIconListView setDragDelegate:](v8, "setDragDelegate:", self);
    objc_msgSend(v3, "iconImageCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView setIconImageCache:](v8, "setIconImageCache:", v9);

    objc_msgSend(v3, "folderIconImageCache");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBIconListView setFolderIconImageCache:](v8, "setFolderIconImageCache:", v10);

    -[SBIconListView setAutomaticallyAdjustsLayoutMetricsToFit:](v8, "setAutomaticallyAdjustsLayoutMetricsToFit:", 0);
    -[SBIconListView addLayoutObserver:](v8, "addLayoutObserver:", self);
    objc_msgSend(v11, "setUserIconListView:", v8);

  }
}

- (void)_rebuildAfterIconModelChange
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "iconModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "rootFolder");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dock");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "addListObserver:", self);
  -[SBFloatingDockViewController setDockListModel:](self, "setDockListModel:", v5);
  -[SBFloatingDockViewController _rebuildUserIconListView](self, "_rebuildUserIconListView");
  -[SBFloatingDockViewController _rebuildLibraryPodIcon](self, "_rebuildLibraryPodIcon");
  -[SBFloatingDockViewController _resizeDockForChangedNumberOfIconsAnimated:](self, "_resizeDockForChangedNumberOfIconsAnimated:", 0);

}

- (void)_updateLibraryPodDockAccessoryViewDisplayed
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  -[SBFloatingDockViewController dockView](self, "dockView");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v3 = -[SBFloatingDockViewController isLibraryPodIconEnabled](self, "isLibraryPodIconEnabled");
  objc_msgSend(v7, "accessoryIconView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || v4)
  {
    if (v4)
      v6 = v3;
    else
      v6 = 1;
    if ((v6 & 1) == 0)
      objc_msgSend(v7, "setAccessoryIconView:", 0);
  }
  else
  {
    -[SBFloatingDockViewController libraryPodIconView](self, "libraryPodIconView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessoryIconView:", v5);

  }
  objc_msgSend(v7, "setAccessoryIconViewVisible:", -[SBFloatingDockViewController isLibraryPodIconVisible](self, "isLibraryPodIconVisible"));

}

- (BOOL)_shouldOpenFolderIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "model");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "directlyContainsIcon:", v4);

  return v7;
}

- (void)_resizeDockForChangedNumberOfIconsAnimated:(BOOL)a3
{
  _BOOL4 v3;
  __CFRunLoopObserver *resizeRunLoopObserver;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  double v15;
  id v16;
  _QWORD v17[4];
  id v18;
  SBFloatingDockViewController *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;

  v3 = a3;
  resizeRunLoopObserver = self->_resizeRunLoopObserver;
  if (resizeRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(resizeRunLoopObserver);
    CFRelease(self->_resizeRunLoopObserver);
    self->_resizeRunLoopObserver = 0;
  }
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layoutIconsIfNeededWithAnimationType:options:", 0, 0);
  -[SBFloatingDockViewController _updateLibraryPodDockAccessoryViewDisplayed](self, "_updateLibraryPodDockAccessoryViewDisplayed");
  -[SBFloatingDockViewController dockView](self, "dockView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setNeedsLayout");
  objc_msgSend(v7, "contentHeight");
  v9 = v8;
  objc_msgSend(v7, "frame");
  v14 = (void *)MEMORY[0x1E0DC3F10];
  v17[1] = 3221225472;
  v17[0] = MEMORY[0x1E0C809B0];
  if (v3)
    v15 = 0.3;
  else
    v15 = 0.0;
  v17[2] = __75__SBFloatingDockViewController__resizeDockForChangedNumberOfIconsAnimated___block_invoke;
  v17[3] = &unk_1E8D8DDB0;
  v18 = v7;
  v19 = self;
  v20 = v9;
  v21 = v10;
  v22 = v11;
  v23 = v12;
  v24 = v13;
  v16 = v7;
  objc_msgSend(v14, "animateWithDuration:delay:options:animations:completion:", 2, v17, 0, v15, 0.0);

}

void __75__SBFloatingDockViewController__resizeDockForChangedNumberOfIconsAnimated___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  objc_msgSend(*(id *)(a1 + 32), "contentHeight");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 40), "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if (*(double *)(a1 + 48) != v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "iconManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "noteFloatingDockWillChangeHeight");
    objc_msgSend(v4, "noteFloatingDockWillAnimateChangeInHeight");
    objc_msgSend(v6, "floatingDockViewController:didChangeContentHeight:", *(_QWORD *)(a1 + 40), v3);

  }
  objc_msgSend(*(id *)(a1 + 32), "frame");
  if ((BSRectEqualToRect() & 1) == 0)
  {
    v5 = *(void **)(a1 + 40);
    objc_msgSend(v5, "floatingDockScreenFrame");
    objc_msgSend(v6, "floatingDockViewController:didChangeContentFrame:", v5);
  }

}

- (void)_coalesceRequestsToResizeDockForChangedNumberOfIcons
{
  const __CFAllocator *v3;
  __CFRunLoop *Main;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_resizeRunLoopObserver)
  {
    objc_initWeak(&location, self);
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __84__SBFloatingDockViewController__coalesceRequestsToResizeDockForChangedNumberOfIcons__block_invoke;
    v5[3] = &unk_1E8D856A8;
    objc_copyWeak(&v6, &location);
    self->_resizeRunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 0, 0, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_resizeRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __84__SBFloatingDockViewController__coalesceRequestsToResizeDockForChangedNumberOfIcons__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_resizeDockForChangedNumberOfIconsAnimated:", 1);

}

- (BOOL)_isInAppToAppTransition
{
  SBFloatingDockViewController *v2;
  void *v3;

  v2 = self;
  -[SBFloatingDockViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isFloatingDockViewControllerPresentedOverTransitioningAppToAppContent:", v2);

  return (char)v2;
}

- (BOOL)_isInSwitcherTransition
{
  SBFloatingDockViewController *v2;
  void *v3;

  v2 = self;
  -[SBFloatingDockViewController delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v2) = objc_msgSend(v3, "isFloatingDockViewControllerPresentedOverTransitioningSwitcherContent:", v2);

  return (char)v2;
}

- (BOOL)_isLibraryContainedInForeground
{
  void *v2;
  char v3;

  -[SBFloatingDockViewController libraryPresenter](self, "libraryPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isLibraryContainedInForeground");

  return v3;
}

- (unint64_t)_backgroundEffectForPresentedFolder
{
  void *v2;
  unint64_t v3;

  -[SBFloatingDockViewController underlyingPresentationStyleConfiguration](self, "underlyingPresentationStyleConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "backgroundEffect");

  return v3;
}

- (unint64_t)_platterEffectForPresentedFolder
{
  void *v2;
  unint64_t v3;

  -[SBFloatingDockViewController underlyingPresentationStyleConfiguration](self, "underlyingPresentationStyleConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "platterEffect");

  return v3;
}

- (unint64_t)_currentFolderIconBackgroundStyle
{
  void *v2;
  unint64_t v3;

  -[SBFloatingDockViewController underlyingPresentationStyleConfiguration](self, "underlyingPresentationStyleConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "folderIconBackgroundStyle");

  return v3;
}

- (void)_updateDockForStyleConfiguration:(id)a3
{
  id v4;
  BOOL v5;
  _QWORD v6[4];
  BOOL v7;

  v4 = a3;
  -[SBFloatingDockViewController _updateFolderIconBackgroundsForStyleConfiguration:](self, "_updateFolderIconBackgroundsForStyleConfiguration:", v4);
  -[SBFloatingDockViewController _updatePresentedFolderBackgroundForStyleConfiguration:](self, "_updatePresentedFolderBackgroundForStyleConfiguration:", v4);
  -[SBFloatingDockViewController _updatePlatterShadowForStyleConfiguration:](self, "_updatePlatterShadowForStyleConfiguration:", v4);

  v5 = -[SBFloatingDockViewController wantsFastIconReordering](self, "wantsFastIconReordering");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __65__SBFloatingDockViewController__updateDockForStyleConfiguration___block_invoke;
  v6[3] = &__block_descriptor_33_e24_v16__0__SBIconListView_8l;
  v7 = v5;
  -[SBFloatingDockViewController enumerateIconListViewsUsingBlock:](self, "enumerateIconListViewsUsingBlock:", v6);
}

uint64_t __65__SBFloatingDockViewController__updateDockForStyleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setWantsFastIconReordering:", *(unsigned __int8 *)(a1 + 32));
}

- (void)_updateLibraryPodIconComponentVisibility
{
  _BOOL8 v3;
  SBHLibraryIconViewController *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  id v9;

  if (-[SBFloatingDockViewController isPresentingLibrary](self, "isPresentingLibrary"))
  {
    v3 = -[SBFloatingDockViewController isPresentingLibraryInForeground](self, "isPresentingLibraryInForeground");
    -[SBFloatingDockViewController setLibraryPodIconVisible:animated:](self, "setLibraryPodIconVisible:animated:", v3 ^ 1, v3);
    v4 = self->_libraryIconViewController;
    -[SBHLibraryIconViewController categoryStackView](v4, "categoryStackView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      v7 = 0.0;
    else
      v7 = 1.0;
    if (v3)
      v8 = 1.0;
    else
      v8 = 0.0;
    objc_msgSend(v5, "setAlpha:", v7);

    -[SBHLibraryIconViewController dismissalView](v4, "dismissalView");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setAlpha:", v8);
  }
}

- (void)_updateFolderIconBackgroundsForStyleConfiguration:(id)a3
{
  uint64_t v4;
  id v5;
  _QWORD v6[5];

  v4 = objc_msgSend(a3, "folderIconBackgroundStyle");
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __82__SBFloatingDockViewController__updateFolderIconBackgroundsForStyleConfiguration___block_invoke;
  v6[3] = &__block_descriptor_40_e27_v32__0__SBIconView_8Q16_B24l;
  v6[4] = v4;
  objc_msgSend(v5, "enumerateIconViewsUsingBlock:", v6);

}

void __82__SBFloatingDockViewController__updateFolderIconBackgroundsForStyleConfiguration___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isFolderIcon");

  if (v4)
    objc_msgSend(v5, "setFolderBackgroundStyle:", *(_QWORD *)(a1 + 32));

}

- (void)_updatePresentedFolderBackgroundForStyleConfiguration:(id)a3
{
  id v4;

  -[SBFloatingDockViewController folderPresentingViewController](self, "folderPresentingViewController", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundEffect:", -[SBFloatingDockViewController _backgroundEffectForPresentedFolder](self, "_backgroundEffectForPresentedFolder"));

}

- (void)_updatePlatterShadowForStyleConfiguration:(id)a3
{
  uint64_t v4;
  id v5;

  v4 = objc_msgSend(a3, "wantsPlatterShadow");
  -[SBFloatingDockViewController dockView](self, "dockView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHasPlatterShadow:", v4);

}

- (id)_backdropGroupName
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  __CFString *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("-%p"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("SBFloatingDockViewControllerBackdropGroupName"), "stringByAppendingString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockViewController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceStyle");
  v7 = CFSTR("-Light");
  if (v6 == 2)
    v7 = CFSTR("-Dark");
  v8 = v7;

  objc_msgSend(v4, "stringByAppendingString:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_backdropGroupNamespace
{
  return (id)*MEMORY[0x1E0CD2958];
}

- (void)_updateViewBackdropGroupName
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[SBFloatingDockViewController _backdropGroupName](self, "_backdropGroupName");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHLibraryIconViewController categoryStackView](self->_libraryIconViewController, "categoryStackView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackdropGroupName:", v6);

  -[SBFloatingDockViewController dockView](self, "dockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mainPlatterView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackdropGroupName:", v6);

}

- (void)iconModelDidLayout:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconModel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "object");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 == v6)
    -[SBFloatingDockViewController _rebuildAfterIconModelChange](self, "_rebuildAfterIconModelChange");

}

- (void)iconEditingDidChange:(id)a3
{
  -[SBFloatingDockViewController _updateEditingStateAnimated:](self, "_updateEditingStateAnimated:", 1);
}

- (void)_updateEditingStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  _BOOL8 v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v3 = a3;
  -[SBFloatingDockViewController delegate](self, "delegate");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v12, "isFloatingDockViewControllerPresentedOnExternalDisplay:", self) & 1) == 0)
  {
    v5 = -[SBFloatingDockViewController isEditing](self, "isEditing");
    if (v5)
      v6 = -[SBFloatingDockViewController suppressesEditingStateForListViews](self, "suppressesEditingStateForListViews") ^ 1;
    else
      v6 = 0;
    -[SBFloatingDockViewController userIconListView](self, "userIconListView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setEditing:", v6);
    objc_msgSend(v7, "updateEditingStateAnimated:", v3);
    -[SBFloatingDockViewController dockView](self, "dockView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "recentIconListView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "setEditing:", v6);
    objc_msgSend(v9, "updateEditingStateAnimated:", v3);
    -[SBIconView setEditing:animated:](self->_libraryPodIconView, "setEditing:animated:", v6, v3);
    if (-[SBFloatingDockViewController isPresentingFolder](self, "isPresentingFolder"))
    {
      -[SBFloatingDockViewController folderPresentingViewController](self, "folderPresentingViewController");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "presentedFolderController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "setEditing:animated:", v5, v3);

    }
  }

}

- (void)iconDraggingDidChange:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  NSHashTable *bouncedDropSessions;

  -[SBFloatingDockViewController iconManager](self, "iconManager", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isIconDragging");

  -[SBFloatingDockViewController dockView](self, "dockView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setMinimumUserIconSpaces:", v5);

  -[SBFloatingDockViewController _resizeDockForChangedNumberOfIconsAnimated:](self, "_resizeDockForChangedNumberOfIconsAnimated:", 1);
  if ((v5 & 1) == 0)
  {
    bouncedDropSessions = self->_bouncedDropSessions;
    self->_bouncedDropSessions = 0;

  }
}

- (void)reduceTransparencyEnabledStateDidChange:(id)a3
{
  void *v4;
  void *v5;
  char isKindOfClass;
  id v7;

  -[SBFloatingDockViewController folderPresentingViewController](self, "folderPresentingViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundEffect:", -[SBFloatingDockViewController _backgroundEffectForPresentedFolder](self, "_backgroundEffectForPresentedFolder"));

  -[SBFloatingDockViewController presentedFolderController](self, "presentedFolderController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_opt_self();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
    objc_msgSend(v7, "setBackgroundEffect:", -[SBFloatingDockViewController _platterEffectForPresentedFolder](self, "_platterEffectForPresentedFolder"));

}

- (void)_sizeCategoryDidChange:(id)a3
{
  id v3;

  -[SBFloatingDockViewController userIconListView](self, "userIconListView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllIconViews");
  objc_msgSend(v3, "layoutIconsNow");

}

- (void)listLayoutProviderDidChange:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  -[SBFloatingDockViewController iconManager](self, "iconManager", a3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "listLayoutProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockViewController setListLayoutProvider:](self, "setListLayoutProvider:", v4);
  objc_msgSend(v9, "folderIconImageCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconImageCache");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __60__SBFloatingDockViewController_listLayoutProviderDidChange___block_invoke;
  v10[3] = &unk_1E8D8DDF8;
  v11 = v5;
  v12 = v6;
  v7 = v6;
  v8 = v5;
  -[SBFloatingDockViewController enumerateIconListsUsingBlock:](self, "enumerateIconListsUsingBlock:", v10);
  -[SBIconView setFolderIconImageCache:](self->_libraryPodIconView, "setFolderIconImageCache:", v8);
  -[SBIconView setIconImageCache:](self->_libraryPodIconView, "setIconImageCache:", v7);

}

void __60__SBFloatingDockViewController_listLayoutProviderDidChange___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setFolderIconImageCache:", v3);
  objc_msgSend(v4, "setIconImageCache:", *(_QWORD *)(a1 + 40));

}

- (void)floatingDockViewMainPlatterDidChangeFrame:(id)a3
{
  id v4;

  -[SBFloatingDockViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockViewController floatingDockScreenFrame](self, "floatingDockScreenFrame");
  objc_msgSend(v4, "floatingDockViewController:didChangeContentFrame:", self);

}

- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__SBFloatingDockViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke;
  v4[3] = &unk_1E8D84C50;
  v4[4] = self;
  objc_msgSend(a4, "addAnimations:", v4);
}

void __98__SBFloatingDockViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "dockView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = (void *)MEMORY[0x1E0DC3F10];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __98__SBFloatingDockViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2;
  v4[3] = &unk_1E8D84C50;
  v5 = v1;
  v3 = v1;
  objc_msgSend(v2, "performWithoutAnimation:", v4);
  objc_msgSend(v3, "pl_performCrossFadeIfNecessary");

}

uint64_t __98__SBFloatingDockViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)iconListView:(id)a3 canHandleIconDropSession:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  NSHashTable *bouncedDropSessions;
  NSHashTable *v15;
  NSHashTable *v16;

  v6 = a3;
  v7 = a4;
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[SBFloatingDockViewController iconManager](self, "iconManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iconDragManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v11, "canHandleIconDropSession:inIconListView:", v7, v6);
    v12 = objc_msgSend(v11, "canAcceptDropInSession:inIconListView:", v7, v6);

    if ((v12 & 1) != 0)
      goto LABEL_9;
  }
  else
  {
    v9 = 0;
  }
  if (-[SBFloatingDockViewController shouldIndicateImpossibleDrop](self, "shouldIndicateImpossibleDrop")
    && !-[NSHashTable containsObject:](self->_bouncedDropSessions, "containsObject:", v7))
  {
    -[SBFloatingDockViewController dockView](self, "dockView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "bounce");

    bouncedDropSessions = self->_bouncedDropSessions;
    if (!bouncedDropSessions)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v15 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v16 = self->_bouncedDropSessions;
      self->_bouncedDropSessions = v15;

      bouncedDropSessions = self->_bouncedDropSessions;
    }
    -[NSHashTable addObject:](bouncedDropSessions, "addObject:", v7);
  }
LABEL_9:

  return v9;
}

- (void)iconListView:(id)a3 iconDropSessionDidEnter:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v10)
  {
    -[SBFloatingDockViewController iconManager](self, "iconManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconDragManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconDropSessionDidEnter:inIconListView:", v6, v10);

  }
}

- (id)iconListView:(id)a3 iconDropSessionDidUpdate:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[SBFloatingDockViewController iconManager](self, "iconManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iconDragManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iconDropSessionDidUpdate:inIconListView:", v7, v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)iconListView:(id)a3 iconDropSessionDidExit:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[SBFloatingDockViewController userIconListView](self, "userIconListView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v10)
  {
    -[SBFloatingDockViewController iconManager](self, "iconManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "iconDragManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "iconDropSessionDidExit:fromIconListView:", v6, v10);

  }
}

- (void)iconListView:(id)a3 performIconDrop:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconDragManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performIconDrop:inIconListView:", v6, v7);

  -[SBFloatingDockViewController _resizeDockForChangedNumberOfIconsAnimated:](self, "_resizeDockForChangedNumberOfIconsAnimated:", 1);
}

- (id)iconListView:(id)a3 iconViewForDroppingIconDragItem:(id)a4 proposedIconView:(id)a5
{
  return a5;
}

- (void)iconListView:(id)a3 willUseIconView:(id)a4 forDroppingIconDragItem:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconDragManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconListView:willUseIconView:forDroppingIconDragItem:", v10, v9, v8);

}

- (id)iconListView:(id)a3 previewForDroppingIconDragItem:(id)a4 proposedPreview:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconDragManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconListView:previewForDroppingIconDragItem:proposedPreview:", v10, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (void)iconListView:(id)a3 iconDragItem:(id)a4 willAnimateDropWithAnimator:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconDragManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconListView:iconDragItem:willAnimateDropWithAnimator:", v10, v9, v8);

}

- (BOOL)iconListView:(id)a3 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a4 onIconView:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  char v11;

  v7 = a5;
  v8 = a4;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconDragManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "shouldAllowSpringLoadedInteractionForIconDropSession:onIconView:", v8, v7);

  return v11;
}

- (void)iconListView:(id)a3 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconDragManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "performSpringLoadedInteractionForIconDragOnIconView:", v5);

}

- (id)iconListView:(id)a3 customSpringAnimationBehaviorForDroppingItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconDragManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconListView:customSpringAnimationBehaviorForDroppingItem:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[SBFloatingDockViewController dockListModel](self, "dockListModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[SBFloatingDockViewController _coalesceRequestsToResizeDockForChangedNumberOfIcons](self, "_coalesceRequestsToResizeDockForChangedNumberOfIcons");
}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v5;
  id v6;

  v5 = a3;
  -[SBFloatingDockViewController dockListModel](self, "dockListModel");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
    -[SBFloatingDockViewController _coalesceRequestsToResizeDockForChangedNumberOfIcons](self, "_coalesceRequestsToResizeDockForChangedNumberOfIcons");
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4;
  void *v5;
  char v6;
  char v7;
  void *v8;

  v4 = a3;
  -[SBFloatingDockViewController userIconLocation](self, "userIconLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v8, "isPresentingIconLocation:", v4);

  }
  return v7;
}

- (NSSet)presentedIconLocations
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0C99E60];
  -[SBFloatingDockViewController userIconLocation](self, "userIconLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setWithObject:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentedIconLocations");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setByAddingObjectsFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v8;
}

- (id)dequeueReusableIconViewOfClass:(Class)a3
{
  void *v4;
  void *v5;

  -[SBFloatingDockViewController iconViewProvider](self, "iconViewProvider");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "dequeueReusableIconViewOfClass:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)recycleIconView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SBFloatingDockViewController iconViewProvider](self, "iconViewProvider");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "recycleIconView:", v4);

}

- (BOOL)isIconViewRecycled:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBFloatingDockViewController iconViewProvider](self, "iconViewProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isIconViewRecycled:", v4);

  return v6;
}

- (void)configureIconView:(id)a3 forIcon:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  -[SBFloatingDockViewController iconViewProvider](self, "iconViewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configureIconView:forIcon:", v9, v6);

  objc_msgSend(v9, "icon");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v8, "isFolderIcon");

  if ((_DWORD)v7)
    objc_msgSend(v9, "setFolderBackgroundStyle:", -[SBFloatingDockViewController _currentFolderIconBackgroundStyle](self, "_currentFolderIconBackgroundStyle"));

}

- (void)iconTouchBegan:(id)a3
{
  objc_msgSend(a3, "setHighlighted:", 1);
}

- (void)icon:(id)a3 touchMoved:(id)a4
{
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  id v26;
  CGPoint v27;
  CGRect v28;

  v5 = a4;
  v26 = a3;
  UIEdgeInsetsMakeWithEdges();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v26, "bounds");
  v15 = v9 + v14;
  v17 = v7 + v16;
  v19 = v18 - (v9 + v13);
  v21 = v20 - (v7 + v11);
  objc_msgSend(v5, "locationInView:", v26);
  v23 = v22;
  v25 = v24;

  v28.origin.x = v15;
  v28.origin.y = v17;
  v28.size.width = v19;
  v28.size.height = v21;
  v27.x = v23;
  v27.y = v25;
  objc_msgSend(v26, "setHighlighted:", CGRectContainsPoint(v28, v27));

}

- (void)icon:(id)a3 touchEnded:(BOOL)a4
{
  objc_msgSend(a3, "setHighlighted:", 0, a4);
}

- (void)iconTapped:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  -[SBFloatingDockViewController toggleLibraryPresentedAnimated:completion:](self, "toggleLibraryPresentedAnimated:completion:", 1, 0);
  -[SBFloatingDockViewController delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isFloatingDockViewControllerPresentedOverApplication:", self);
  v11 = *MEMORY[0x1E0DABD80];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0DA9D78];
  v9 = v7;
  objc_msgSend(v8, "sharedInstance");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "emitEvent:withPayload:", 53, v9);

}

- (BOOL)iconViewCanBeginDrags:(id)a3
{
  return 0;
}

- (id)customImageViewControllerForIconView:(id)a3
{
  SBHLibraryIconViewController *libraryIconViewController;
  id v5;
  SBHLibraryIconViewController *v6;
  void *v7;
  SBHLibraryIconViewController *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  SBHLibraryIconViewController *v15;

  libraryIconViewController = self->_libraryIconViewController;
  if (!libraryIconViewController)
  {
    v5 = a3;
    v6 = [SBHLibraryIconViewController alloc];
    objc_msgSend(v5, "listLayoutProvider");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = -[SBHLibraryIconViewController initWithListLayoutProvider:](v6, "initWithListLayoutProvider:", v7);
    -[SBFloatingDockViewController libraryViewController](self, "libraryViewController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "podFolderViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dataSource");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHLibraryIconViewController setLibraryDataSource:](v8, "setLibraryDataSource:", v11);

    -[SBHLibraryIconViewController categoryStackView](v8, "categoryStackView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBFloatingDockViewController _backdropGroupName](self, "_backdropGroupName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackdropGroupName:", v13);

    -[SBFloatingDockViewController _backdropGroupNamespace](self, "_backdropGroupNamespace");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackdropGroupNamespace:", v14);

    v15 = self->_libraryIconViewController;
    self->_libraryIconViewController = v8;

    libraryIconViewController = self->_libraryIconViewController;
  }
  return libraryIconViewController;
}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  if (v6)
    -[SBFloatingDockViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v6);
  objc_msgSend(v8, "customIconImageViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
    -[SBFloatingDockViewController bs_addChildViewController:](self, "bs_addChildViewController:", v7);

}

- (BOOL)iconViewCanBecomeFocused:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = objc_msgSend(v5, "iconViewCanBecomeFocused:", v4);
  else
    v6 = 1;

  return v6;
}

- (unint64_t)focusEffectTypeForIconView:(id)a3
{
  return 1;
}

- (void)floatingDockSuggestionsViewControllerDidChangeNumberOfVisibleSuggestions:(id)a3
{
  -[SBFloatingDockViewController _resizeDockForChangedNumberOfIconsAnimated:](self, "_resizeDockForChangedNumberOfIconsAnimated:", 1);
}

- (BOOL)isPresentingLibrary
{
  void *v2;
  char v3;

  -[SBFloatingDockViewController libraryPresenter](self, "libraryPresenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isPresentingLibrary");

  return v3;
}

- (BOOL)isPresentingLibraryInForeground
{
  _BOOL4 v3;

  v3 = -[SBFloatingDockViewController isPresentingLibrary](self, "isPresentingLibrary");
  if (v3)
    LOBYTE(v3) = -[SBFloatingDockViewController _isLibraryContainedInForeground](self, "_isLibraryContainedInForeground");
  return v3;
}

- (void)presentLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SBFloatingDockViewController libraryPresenter](self, "libraryPresenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "presentLibraryWithAnimation:completion:", v4, v6);

}

- (void)dismissLibraryAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a3;
  v7 = a4;
  if (v4
    && (!-[SBFloatingDockViewController _isLibraryContainedInForeground](self, "_isLibraryContainedInForeground")
     || -[SBFloatingDockViewController _isInAppToAppTransition](self, "_isInAppToAppTransition")
     || -[SBFloatingDockViewController _isInSwitcherTransition](self, "_isInSwitcherTransition")))
  {
    -[SBFloatingDockViewController libraryPresenter](self, "libraryPresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissLibraryWithTransition:completion:", 2, v7);
  }
  else
  {
    -[SBFloatingDockViewController libraryPresenter](self, "libraryPresenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dismissLibraryWithAnimation:completion:", v4, v7);
  }

}

- (void)toggleLibraryPresentedAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a3;
  v6 = a4;
  -[SBFloatingDockViewController libraryPresenter](self, "libraryPresenter");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "toggleLibraryPresentedInForegroundWithAnimation:completion:", v4, v6);

}

- (void)libraryViewController:(id)a3 dataSourceDidChange:(id)a4
{
  -[SBHLibraryIconViewController setLibraryDataSource:](self->_libraryIconViewController, "setLibraryDataSource:", a4);
}

- (BOOL)isDefaultContainerForegroundForPresenter:(id)a3
{
  SBFloatingDockViewController *v3;
  void *v4;

  v3 = self;
  -[SBFloatingDockViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isDefaultLibraryContainerViewControllerForegroundForFloatingDockViewController:", v3);

  return (char)v3;
}

- (id)containerViewControllerForPresentingInForeground:(id)a3
{
  void *v4;
  void *v5;

  -[SBFloatingDockViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "foregroundLibraryContainerViewControllerForFloatingDockViewController:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)acquireOrderSourceContainerViewBeforeLibraryViewAssertionForReason:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SBFloatingDockViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "floatingDockViewController:acquireOrderFloatingDockContainerBeforeLibraryAssertionForReason:", self, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)libraryIconViewForPresenter:(id)a3
{
  return self->_libraryPodIconView;
}

- (id)libraryIconViewControllerForPresenter:(id)a3
{
  return self->_libraryIconViewController;
}

- (void)libraryIndicatorIconView:(id)a3 didAcceptDropForSession:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "iconDragManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "noteDragItemWasConsumedExternallyForDropSession:", v5);

}

- (void)handleSpringLoadDidActivateForLibraryIndicatorIconView:(id)a3
{
  -[SBFloatingDockViewController presentLibraryAnimated:completion:](self, "presentLibraryAnimated:completion:", 1, 0);
}

- (void)presentFolderForIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD aBlock[4];
  id v23;
  id v24;
  id location;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = a6;
  -[SBFloatingDockViewController currentFolderAnimator](self, "currentFolderAnimator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "childViewController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v15, "folder");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "icon");
      v17 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v17 = 0;
    }
    if (objc_msgSend(v10, "isEqual:", v17))
    {
      if (v12)
      {
        -[SBFloatingDockViewController currentExpandCompletions](self, "currentExpandCompletions");
        v19 = (id)objc_claimAutoreleasedReturnValue();
        if (!v19)
        {
          v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[SBFloatingDockViewController setCurrentExpandCompletions:](self, "setCurrentExpandCompletions:", v19);
        }
        v20 = (void *)objc_msgSend(v12, "copy");
        v21 = _Block_copy(v20);
        objc_msgSend(v19, "addObject:", v21);

      }
      if (objc_msgSend(v14, "currentOperation") == 1)
        objc_msgSend(v14, "reverse");
    }
    else if (v12)
    {
      (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
    }

  }
  else
  {
    objc_initWeak(&location, self);
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __82__SBFloatingDockViewController_presentFolderForIcon_location_animated_completion___block_invoke;
    aBlock[3] = &unk_1E8D8B090;
    objc_copyWeak(&v24, &location);
    v23 = v12;
    v18 = _Block_copy(aBlock);
    -[SBFloatingDockViewController _presentFolderForIcon:location:animated:completion:](self, "_presentFolderForIcon:location:animated:completion:", v10, v11, v7, v18);

    objc_destroyWeak(&v24);
    objc_destroyWeak(&location);
  }

}

void __82__SBFloatingDockViewController_presentFolderForIcon_location_animated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "currentExpandCompletions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "currentCollapseCompletions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setCurrentExpandCompletions:", 0);
  objc_msgSend(WeakRetained, "setCurrentCollapseCompletions:", 0);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * i) + 16))();
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v15; ++j)
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * j));
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void)dismissPresentedFolderAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD aBlock[4];
  id v17;
  id v18;
  id location;

  v4 = a3;
  v6 = a4;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "canCloseFolders") & 1) != 0)
  {
    -[SBFloatingDockViewController currentFolderAnimator](self, "currentFolderAnimator");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      if (v6)
      {
        -[SBFloatingDockViewController currentCollapseCompletions](self, "currentCollapseCompletions");
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (!v9)
        {
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          -[SBFloatingDockViewController setCurrentCollapseCompletions:](self, "setCurrentCollapseCompletions:", v9);
        }
        v10 = (void *)objc_msgSend(v6, "copy");
        v11 = _Block_copy(v10);
        objc_msgSend(v9, "addObject:", v11);

      }
      if (!objc_msgSend(v8, "currentOperation"))
        objc_msgSend(v8, "reverse");
    }
    else
    {
      objc_initWeak(&location, self);
      aBlock[0] = MEMORY[0x1E0C809B0];
      aBlock[1] = 3221225472;
      aBlock[2] = __74__SBFloatingDockViewController_dismissPresentedFolderAnimated_completion___block_invoke;
      aBlock[3] = &unk_1E8D8B090;
      objc_copyWeak(&v18, &location);
      v17 = v6;
      v12 = _Block_copy(aBlock);
      -[SBFloatingDockViewController folderPresentingViewController](self, "folderPresentingViewController");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "presentedFolderController");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v14)
      {
        objc_msgSend(v7, "iconDragManager");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "noteFolderControllerWillClose:", v14);

      }
      objc_msgSend(v13, "dismissPresentedFolderControllerAnimated:completion:", v4, v12);

      objc_destroyWeak(&v18);
      objc_destroyWeak(&location);
    }

  }
  else if (v6)
  {
    (*((void (**)(id, _QWORD))v6 + 2))(v6, 0);
  }

}

void __74__SBFloatingDockViewController_dismissPresentedFolderAnimated_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  id WeakRetained;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "currentExpandCompletions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "currentCollapseCompletions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(WeakRetained, "setCurrentExpandCompletions:", 0);
  objc_msgSend(WeakRetained, "setCurrentCollapseCompletions:", 0);
  v7 = *(_QWORD *)(a1 + 32);
  if (v7)
    (*(void (**)(uint64_t, uint64_t))(v7 + 16))(v7, a2);
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(v8);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v12++) + 16))();
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v10);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v13 = v6;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        (*(void (**)(_QWORD))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17) + 16))(*(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17));
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v15);
  }

}

- (void)_presentFolderForIcon:(id)a3 location:(id)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  unint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  NSObject *v29;
  Class v30;
  void *v31;
  void *v32;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD))a6;
  if (v10 && -[SBFloatingDockViewController _shouldOpenFolderIcon:](self, "_shouldOpenFolderIcon:", v10))
  {
    -[SBFloatingDockViewController userIconListView](self, "userIconListView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "displayedIconViewForIcon:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v32 = v13;
      -[SBFloatingDockViewController iconManager](self, "iconManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "folder");
      v16 = objc_claimAutoreleasedReturnValue();
      v30 = (Class)objc_msgSend(v15, "controllerClassForFolderClass:", objc_opt_class());
      v17 = objc_alloc_init((Class)-[objc_class configurationClass](v30, "configurationClass"));
      v31 = (void *)v16;
      objc_msgSend(v17, "setFolder:", v16);
      objc_msgSend(v15, "listLayoutProvider");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setListLayoutProvider:", v18);

      objc_msgSend(v17, "setOrientation:", objc_msgSend(v15, "interfaceOrientation"));
      objc_msgSend(v17, "setIconViewProvider:", self);
      objc_msgSend(v15, "folderIconImageCache");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setFolderIconImageCache:", v19);

      -[SBFloatingDockViewController legibilitySettings](self, "legibilitySettings");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setLegibilitySettings:", v20);

      objc_msgSend(v17, "setFolderDelegate:", self);
      objc_msgSend(v17, "setOriginatingIconLocation:", v11);
      objc_msgSend(v15, "delegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setAddsFocusGuidesForWrapping:", objc_msgSend(v21, "isFocusAllowedForIconManager:", v15));

      objc_opt_self();
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v16) = objc_opt_isKindOfClass();

      if ((v16 & 1) != 0)
      {
        v23 = v17;
        v24 = -[SBFloatingDockViewController _platterEffectForPresentedFolder](self, "_platterEffectForPresentedFolder");
        if (v24 == 1)
          v25 = 3;
        else
          v25 = v24;
        objc_msgSend(v23, "setBackgroundEffect:", v25);

      }
      v26 = (void *)objc_msgSend([v30 alloc], "initWithConfiguration:", v17);
      objc_msgSend(v26, "setFolderIconView:", v14);
      objc_msgSend(v26, "setEditing:animated:", objc_msgSend(v15, "isEditing"), 0);
      -[SBFloatingDockViewController folderPresentingViewController](self, "folderPresentingViewController");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setBackgroundEffect:", -[SBFloatingDockViewController _backgroundEffectForPresentedFolder](self, "_backgroundEffectForPresentedFolder"));
      objc_msgSend(v27, "presentFolderController:animated:completion:", v26, v7, v12);

      v13 = v32;
    }
    else
    {
      SBLogCommon();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
        -[SBFloatingDockViewController _presentFolderForIcon:location:animated:completion:].cold.2();

      if (v12)
        v12[2](v12, 0);
    }

  }
  else
  {
    SBLogCommon();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      -[SBFloatingDockViewController _presentFolderForIcon:location:animated:completion:].cold.1();

    if (v12)
      v12[2](v12, 0);
  }

}

- (id)folderPresentationController:(id)a3 animationControllerForTransitionWithFolder:(id)a4 presenting:(BOOL)a5 animated:(BOOL)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  SBHomeScreenIconTransitionAnimator *v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  SBIconFadeAnimator *v18;
  void *v19;
  SBFolderIconZoomAnimator *v20;
  void *v21;
  void *v22;

  v6 = a6;
  v7 = a5;
  v10 = a4;
  v11 = a3;
  -[SBFloatingDockViewController folderPresentingViewController](self, "folderPresentingViewController");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  if (v12 != v11 || !v6)
    goto LABEL_17;
  objc_msgSend(v10, "folder");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "icon");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15
    && +[SBScaleIconZoomAnimator validateAnimationContainer:targetIcon:](SBFolderIconZoomAnimator, "validateAnimationContainer:targetIcon:", self, v15))
  {
    v16 = 0;
    if (v7)
      goto LABEL_11;
LABEL_10:
    if (-[SBFloatingDockViewController _isInAppToAppTransition](self, "_isInAppToAppTransition"))
      goto LABEL_12;
    goto LABEL_11;
  }
  SBLogCommon();
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    -[SBFloatingDockViewController folderPresentationController:animationControllerForTransitionWithFolder:presenting:animated:].cold.1((uint64_t)v15, v17);

  v16 = 1;
  if (!v7)
    goto LABEL_10;
LABEL_11:
  if ((v16 | UIAccessibilityIsReduceMotionEnabled()) != 1)
  {
    v20 = -[SBFolderIconZoomAnimator initWithAnimationContainer:innerFolderController:folderIcon:]([SBFolderIconZoomAnimator alloc], "initWithAnimationContainer:innerFolderController:folderIcon:", self, v10, v15);
    -[SBFolderIconZoomAnimator setIsAnimatingInFloatingDock:](v20, "setIsAnimatingInFloatingDock:", 1);
    goto LABEL_14;
  }
LABEL_12:
  v18 = [SBIconFadeAnimator alloc];
  objc_msgSend(v10, "contentView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBIconFadeAnimator initWithAnimationContainer:crossfadeView:](v18, "initWithAnimationContainer:crossfadeView:", self, v19);

  -[SBFolderIconZoomAnimator setFadesReferenceView:](v20, "setFadesReferenceView:", 0);
LABEL_14:
  v13 = -[SBHomeScreenIconTransitionAnimator initWithIconAnimator:childViewController:operation:]([SBHomeScreenIconTransitionAnimator alloc], "initWithIconAnimator:childViewController:operation:", v20, v10, v7 ^ 1);
  -[SBFloatingDockViewController setCurrentFolderAnimator:](self, "setCurrentFolderAnimator:", v13);
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHomeScreenIconTransitionAnimator setDelegate:](v13, "setDelegate:", v21);

  -[SBFloatingDockViewController delegate](self, "delegate");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v22, "floatingDockViewController:willUseAnimator:forTransitioningWithFolder:presenting:", self, v13, v10, v7);

LABEL_17:
  return v13;
}

- (void)folderPresentationController:(id)a3 willPerformTransitionWithFolder:(id)a4 presenting:(BOOL)a5 withTransitionCoordinator:(id)a6
{
  _BOOL8 v7;
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  SBFloatingDockViewController *v19;
  _QWORD v20[5];
  id v21;
  BOOL v22;

  v7 = a5;
  v10 = a4;
  v11 = a6;
  v12 = a3;
  -[SBFloatingDockViewController folderPresentingViewController](self, "folderPresentingViewController");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  if (v13 == v12)
  {
    v14 = MEMORY[0x1E0C809B0];
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __130__SBFloatingDockViewController_folderPresentationController_willPerformTransitionWithFolder_presenting_withTransitionCoordinator___block_invoke;
    v20[3] = &unk_1E8D89C40;
    v20[4] = self;
    v21 = v10;
    v22 = v7;
    v17[0] = v14;
    v17[1] = 3221225472;
    v17[2] = __130__SBFloatingDockViewController_folderPresentationController_willPerformTransitionWithFolder_presenting_withTransitionCoordinator___block_invoke_2;
    v17[3] = &unk_1E8D8B018;
    v15 = v21;
    v18 = v15;
    v19 = self;
    objc_msgSend(v11, "animateAlongsideTransition:completion:", v20, v17);
    if (objc_msgSend(v11, "isAnimated"))
      objc_msgSend(v11, "animateAlongsideTransition:completion:", &__block_literal_global_85_0, 0);
    -[SBFloatingDockViewController delegate](self, "delegate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "floatingDockViewController:willPerformTransitionWithFolder:presenting:withTransitionCoordinator:", self, v15, v7, v11);

  }
}

void __130__SBFloatingDockViewController_folderPresentationController_willPerformTransitionWithFolder_presenting_withTransitionCoordinator___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char isKindOfClass;
  int v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v9 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_platterEffectForPresentedFolder") == 1)
  {
    objc_opt_self();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v5 = objc_msgSend(v9, "isCancelled");
      if (*(_BYTE *)(a1 + 48))
        v6 = v5;
      else
        v6 = 1;
      v7 = 3;
      if (((*(_BYTE *)(a1 + 48) == 0) & v5) != 0)
        v7 = 1;
      if (v6)
        v8 = v7;
      else
        v8 = 1;
      objc_msgSend(*(id *)(a1 + 40), "setBackgroundEffect:", v8);
    }
  }

}

void __130__SBFloatingDockViewController_folderPresentationController_willPerformTransitionWithFolder_presenting_withTransitionCoordinator___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "superview");
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 != v4)
  {
    objc_msgSend(v4, "addSubview:", v2);
    objc_msgSend(v4, "setNeedsLayout");
  }
  objc_msgSend(*(id *)(a1 + 40), "setCurrentFolderAnimator:", 0);

}

uint64_t __130__SBFloatingDockViewController_folderPresentationController_willPerformTransitionWithFolder_presenting_withTransitionCoordinator___block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isInteractive");
  if ((result & 1) == 0)
    return objc_msgSend(MEMORY[0x1E0DC3F10], "_recenterMotionEffects");
  return result;
}

- (double)minimumHomeScreenScaleForFolderPresentationController:(id)a3
{
  void *v4;
  double v5;
  double v6;

  -[SBFloatingDockViewController delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "minimumHomeScreenScaleForFloatingDockViewController:", self);
  v6 = v5;

  return v6;
}

- (id)folderPresentationController:(id)a3 sourceViewForPresentingViewController:(id)a4
{
  id v5;
  void *v6;
  char isKindOfClass;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_opt_self();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    objc_msgSend(v5, "folder");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "icon");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    -[SBFloatingDockViewController firstIconViewForIcon:](self, "firstIconViewForIcon:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (UIWindow)animationWindow
{
  void *v2;
  void *v3;

  -[SBFloatingDockViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIWindow *)v3;
}

- (SBHIconModel)iconModel
{
  void *v2;
  void *v3;

  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "iconModel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHIconModel *)v3;
}

- (SBIconListView)dockIconListView
{
  return 0;
}

- (void)returnScalingView
{
  void *v3;
  id v4;

  -[SBFloatingDockViewController view](self, "view");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockViewController scalingView](self, "scalingView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", v3);

}

- (Class)controllerClassForFolder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();

  objc_msgSend(v5, "controllerClassForFolderClass:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (Class)v7;
}

- (BOOL)folderController:(id)a3 canChangeCurrentPageIndexToIndex:(int64_t)a4
{
  return 1;
}

- (void)folderController:(id)a3 draggedIconShouldDropFromListView:(id)a4
{
  -[SBFloatingDockViewController dismissPresentedFolderAnimated:completion:](self, "dismissPresentedFolderAnimated:completion:", 1, 0);
}

- (BOOL)folderControllerShouldClose:(id)a3 withPinchGesture:(id)a4
{
  -[SBFloatingDockViewController dismissPresentedFolderAnimated:completion:](self, "dismissPresentedFolderAnimated:completion:", 1, 0);
  return 0;
}

- (void)folderControllerWillOpen:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  -[SBFloatingDockSuggestionsViewProviding dockFolderWillBeginTransitioning](self->_suggestionsViewController, "dockFolderWillBeginTransitioning", a3);
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rootFolderController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "folderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setSuppressesEditingStateForListViews:", 1);

}

- (void)folderControllerDidOpen:(id)a3
{
  -[SBFloatingDockSuggestionsViewProviding dockFolderDidEndTransitioning](self->_suggestionsViewController, "dockFolderDidEndTransitioning", a3);
}

- (void)folderControllerWillClose:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (!-[SBFloatingDockViewController _isInAppToAppTransition](self, "_isInAppToAppTransition", a3))
  {
    -[SBFloatingDockViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "floatingDockViewController:wantsToBePresented:", self, 1);

  }
  -[SBFloatingDockSuggestionsViewProviding dockFolderWillBeginTransitioning](self->_suggestionsViewController, "dockFolderWillBeginTransitioning");
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rootFolderController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "folderView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSuppressesEditingStateForListViews:", 0);

}

- (void)folderControllerDidClose:(id)a3
{
  -[SBFloatingDockSuggestionsViewProviding dockFolderDidEndTransitioning](self->_suggestionsViewController, "dockFolderDidEndTransitioning", a3);
}

- (void)folderControllerShouldBeginEditing:(id)a3 withHaptic:(BOOL)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  id v20;

  v20 = a3;
  -[SBFloatingDockViewController delegate](self, "delegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0
    || (objc_msgSend(v5, "isFloatingDockViewControllerPresentedOnExternalDisplay:", self) & 1) == 0)
  {
    -[SBFloatingDockViewController iconManager](self, "iconManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "center");
    v10 = v9;
    v12 = v11;
    objc_msgSend(v6, "iconEditingFeedbackBehavior");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "convertPoint:toView:", v14, v10, v12);
    v16 = v15;
    v18 = v17;

    objc_msgSend(v6, "iconEditingFeedbackBehavior");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setEditing:withFeedbackBehavior:location:", 1, v19, v16, v18);

  }
}

- (void)folderControllerShouldEndEditing:(id)a3
{
  id v3;

  -[SBFloatingDockViewController iconManager](self, "iconManager", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setEditing:", 0);

}

- (void)folderControllerWillBeginScrolling:(id)a3
{
  void *v3;
  id v4;

  -[SBFloatingDockViewController iconManager](self, "iconManager", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconDragManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "noteFolderBeganScrolling");

}

- (void)folderController:(id)a3 didBeginEditingTitle:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "folderController:didBeginEditingTitle:", v8, v6);

}

- (void)folderController:(id)a3 didEndEditingTitle:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v7, "folderController:didEndEditingTitle:", v8, v6);

}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 canHandleIconDropSession:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  char v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[SBFloatingDockViewController presentedFolderController](self, "presentedFolderController");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    -[SBFloatingDockViewController iconManager](self, "iconManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "iconDragManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v14, "canHandleIconDropSession:inIconListView:", v9, v8);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidEnter:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  v9 = a3;
  -[SBFloatingDockViewController presentedFolderController](self, "presentedFolderController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    -[SBFloatingDockViewController iconManager](self, "iconManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iconDragManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "iconDropSessionDidEnter:inIconListView:", v8, v13);

  }
}

- (id)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidUpdate:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  -[SBFloatingDockViewController presentedFolderController](self, "presentedFolderController");
  v11 = (id)objc_claimAutoreleasedReturnValue();

  if (v11 == v10)
  {
    -[SBFloatingDockViewController iconManager](self, "iconManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "iconDragManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iconDropSessionDidUpdate:inIconListView:", v9, v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 0);
  }

  return v12;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDropSessionDidExit:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a4;
  v8 = a5;
  v9 = a3;
  -[SBFloatingDockViewController presentedFolderController](self, "presentedFolderController");
  v10 = (id)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    -[SBFloatingDockViewController iconManager](self, "iconManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "iconDragManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "iconDropSessionDidExit:fromIconListView:", v8, v13);

  }
}

- (void)folderController:(id)a3 iconListView:(id)a4 performIconDrop:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a5;
  v8 = a4;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconDragManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "performIconDrop:inIconListView:", v7, v8);

}

- (void)folderController:(id)a3 iconListView:(id)a4 willUseIconView:(id)a5 forDroppingIconDragItem:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "iconDragManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconListView:willUseIconView:forDroppingIconDragItem:", v11, v10, v9);

}

- (id)folderController:(id)a3 iconListView:(id)a4 previewForDroppingIconDragItem:(id)a5 proposedPreview:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconDragManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "iconListView:previewForDroppingIconDragItem:proposedPreview:", v11, v10, v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (void)folderController:(id)a3 iconListView:(id)a4 iconDragItem:(id)a5 willAnimateDropWithAnimator:(id)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;

  v9 = a6;
  v10 = a5;
  v11 = a4;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "iconDragManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconListView:iconDragItem:willAnimateDropWithAnimator:", v11, v10, v9);

}

- (BOOL)folderController:(id)a3 iconListView:(id)a4 shouldAllowSpringLoadedInteractionForIconDropSession:(id)a5 onIconView:(id)a6
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  char v12;

  v8 = a6;
  v9 = a5;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconDragManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "shouldAllowSpringLoadedInteractionForIconDropSession:onIconView:", v9, v8);

  return v12;
}

- (void)folderController:(id)a3 iconListView:(id)a4 springLoadedInteractionForIconDragDidCompleteOnIconView:(id)a5
{
  id v6;
  void *v7;
  id v8;

  v6 = a5;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconDragManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "performSpringLoadedInteractionForIconDragOnIconView:", v6);

}

- (id)folderController:(id)a3 iconListView:(id)a4 customSpringAnimationBehaviorForDroppingItem:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v7 = a5;
  v8 = a4;
  -[SBFloatingDockViewController iconManager](self, "iconManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconDragManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "iconListView:customSpringAnimationBehaviorForDroppingItem:", v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)folderController:(id)a3 accessibilityTintColorForScreenRect:(CGRect)a4
{
  double height;
  double width;
  double y;
  double x;
  void *v8;
  void *v9;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  -[SBFloatingDockViewController iconManager](self, "iconManager", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityTintColorForScreenRect:", x, y, width, height);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBFloatingDockViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  return (id)objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[SBFloatingDockViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  void *v15;
  id v16;
  void *v17;
  id v18;

  -[SBFloatingDockViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFloatingDockViewController dockOffscreenProgress](self, "dockOffscreenProgress");
  v5 = (id)objc_msgSend(v4, "appendFloat:withName:decimalPrecision:", CFSTR("dockOffscreenProgress"), 2);
  -[SBFloatingDockViewController suggestionsViewController](self, "suggestionsViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (id)objc_msgSend(v4, "appendObject:withName:", v6, CFSTR("suggestionsViewController"));

  -[SBFloatingDockViewController contentHeight](self, "contentHeight");
  v8 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("contentHeight"), 1);
  -[SBFloatingDockViewController maximumContentHeight](self, "maximumContentHeight");
  v9 = (id)objc_msgSend(v4, "appendDouble:withName:decimalPrecision:", CFSTR("maximumContentHeight"), 1);
  v10 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBFloatingDockViewController isPresentingLibrary](self, "isPresentingLibrary"), CFSTR("isPresentingLibrary"), 1);
  v11 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBFloatingDockViewController _isLibraryContainedInForeground](self, "_isLibraryContainedInForeground"), CFSTR("isLibraryContainedInForeground"), 1);
  v12 = (id)objc_msgSend(v4, "appendBool:withName:ifEqualTo:", -[SBFloatingDockViewController isPresentingFolder](self, "isPresentingFolder"), CFSTR("isPresentingFolder"), 1);
  -[SBFloatingDockViewController presentedFolderController](self, "presentedFolderController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (id)objc_msgSend(v4, "appendObject:withName:skipIfNil:", v13, CFSTR("presentedFolderController"), 1);

  -[SBFloatingDockViewController legibilitySettings](self, "legibilitySettings");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (id)objc_msgSend(v4, "appendObject:withName:", v15, CFSTR("legibilitySettings"));

  -[SBFloatingDockViewController underlyingPresentationStyleConfiguration](self, "underlyingPresentationStyleConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v4, "appendObject:withName:", v17, CFSTR("underlyingPresentationStyleConfiguration"));

  return v4;
}

- (SBFloatingDockViewControllerDelegate)delegate
{
  return (SBFloatingDockViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBFloatingDockSuggestionsViewProviding)suggestionsViewController
{
  return self->_suggestionsViewController;
}

- (BOOL)isLibraryPodIconEnabled
{
  return self->_libraryPodIconEnabled;
}

- (BOOL)isLibraryPodIconVisible
{
  return self->_libraryPodIconVisible;
}

- (SBHLibraryViewController)libraryViewController
{
  return self->_libraryViewController;
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (BOOL)suppressesEditingStateForListViews
{
  return self->_suppressesEditingStateForListViews;
}

- (double)dockOffscreenProgress
{
  return self->_dockOffscreenProgress;
}

- (BOOL)wantsFastIconReordering
{
  return self->_wantsFastIconReordering;
}

- (void)setWantsFastIconReordering:(BOOL)a3
{
  self->_wantsFastIconReordering = a3;
}

- (BOOL)shouldIndicateImpossibleDrop
{
  return self->_shouldIndicateImpossibleDrop;
}

- (void)setShouldIndicateImpossibleDrop:(BOOL)a3
{
  self->_shouldIndicateImpossibleDrop = a3;
}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (SBIconListModel)dockListModel
{
  return self->_dockListModel;
}

- (void)setDockListModel:(id)a3
{
  objc_storeStrong((id *)&self->_dockListModel, a3);
}

- (SBHModalLibraryPresenter)libraryPresenter
{
  return self->_libraryPresenter;
}

- (void)setLibraryPresenter:(id)a3
{
  objc_storeStrong((id *)&self->_libraryPresenter, a3);
}

- (SBFolderPresentingViewController)folderPresentingViewController
{
  return self->_folderPresentingViewController;
}

- (void)setFolderPresentingViewController:(id)a3
{
  objc_storeStrong((id *)&self->_folderPresentingViewController, a3);
}

- (SBHomeScreenIconTransitionAnimator)currentFolderAnimator
{
  return self->_currentFolderAnimator;
}

- (void)setCurrentFolderAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_currentFolderAnimator, a3);
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

- (SBHTouchPassThroughView)scalingView
{
  return self->_scalingView;
}

- (void)setScalingView:(id)a3
{
  objc_storeStrong((id *)&self->_scalingView, a3);
}

- (double)lastDockHeight
{
  return self->_lastDockHeight;
}

- (void)setLastDockHeight:(double)a3
{
  self->_lastDockHeight = a3;
}

- (SBHFloatingDockStyleConfiguration)underlyingPresentationStyleConfiguration
{
  return self->_underlyingPresentationStyleConfiguration;
}

- (void)setUnderlyingPresentationStyleConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1152);
}

- (BOOL)isTransitioningUnderlyingBackgroundStyle
{
  return self->_transitioningUnderlyingPresentationStyleConfiguration;
}

- (void)setTransitioningUnderlyingPresentationStyleConfiguration:(BOOL)a3
{
  self->_transitioningUnderlyingPresentationStyleConfiguration = a3;
}

- (SBHFloatingDockStyleConfiguration)transitionTargetUnderlyingPresentationStyleConfiguration
{
  return self->_transitionTargetUnderlyingPresentationStyleConfiguration;
}

- (void)setTransitionTargetUnderlyingPresentationStyleConfiguration:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1160);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionTargetUnderlyingPresentationStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_underlyingPresentationStyleConfiguration, 0);
  objc_storeStrong((id *)&self->_scalingView, 0);
  objc_storeStrong((id *)&self->_currentCollapseCompletions, 0);
  objc_storeStrong((id *)&self->_currentExpandCompletions, 0);
  objc_storeStrong((id *)&self->_currentFolderAnimator, 0);
  objc_storeStrong((id *)&self->_folderPresentingViewController, 0);
  objc_storeStrong((id *)&self->_libraryPresenter, 0);
  objc_storeStrong((id *)&self->_dockListModel, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_destroyWeak((id *)&self->_iconManager);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_libraryViewController, 0);
  objc_storeStrong((id *)&self->_suggestionsViewController, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bouncedDropSessions, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_libraryIconDropInteractionDelegate, 0);
  objc_storeStrong((id *)&self->_libraryIconViewController, 0);
  objc_storeStrong((id *)&self->_libraryPodIconView, 0);
  objc_storeStrong((id *)&self->_dockView, 0);
}

- (void)_presentFolderForIcon:location:animated:completion:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_3(&dword_1CFEF3000, v0, v1, "%s Folder icon %@ cannot be opened because it does not exist in the user icon list", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)_presentFolderForIcon:location:animated:completion:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  OUTLINED_FUNCTION_4_3();
  OUTLINED_FUNCTION_3_3(&dword_1CFEF3000, v0, v1, "%s No folder icon view for %@", v2, v3, v4, v5, 2u);
  OUTLINED_FUNCTION_3();
}

- (void)folderPresentationController:(uint64_t)a1 animationControllerForTransitionWithFolder:(NSObject *)a2 presenting:animated:.cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "Forcing cross-fade animation for floating dock folder transition for icon: %@", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

@end
