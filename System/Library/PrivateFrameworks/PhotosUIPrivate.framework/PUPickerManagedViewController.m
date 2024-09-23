@implementation PUPickerManagedViewController

- (PUPickerManagedViewController)initWithConfiguration:(id)a3 contentViewController:(id)a4
{
  id v7;
  id v8;
  PUPickerManagedViewController *v9;
  PUNavigationController *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PUSidebarViewController *v16;
  void *v17;
  void *v18;
  void *v19;
  PUSidebarViewController *v20;
  UINavigationController *v21;
  UISplitViewController *v22;
  void *v23;
  id v24;
  UINavigationController *contentNavigationController;
  PUNavigationController *v26;
  PUSidebarViewController *sidebarViewController;
  PUSidebarViewController *v28;
  PUSidebarViewController *v29;
  UINavigationController *sidebarNavigationController;
  UINavigationController *v31;
  UISplitViewController *splitViewController;
  id v34;
  id obj;
  void *v36;
  id v37;
  void *v38;
  objc_super v39;
  uint64_t v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v39.receiver = self;
  v39.super_class = (Class)PUPickerManagedViewController;
  v9 = -[PUPickerManagedViewController initWithNibName:bundle:](&v39, sel_initWithNibName_bundle_, 0, 0);
  if (v9)
  {
    v10 = -[PUNavigationController initWithNavigationBarClass:toolbarClass:]([PUNavigationController alloc], "initWithNavigationBarClass:toolbarClass:", objc_opt_class(), 0);
    v41[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUNavigationController setViewControllers:](v10, "setViewControllers:", v11);

    -[PUNavigationController interactivePopGestureRecognizer](v10, "interactivePopGestureRecognizer");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setEnabled:", objc_msgSend(v7, "allowsInteractivePopGesture"));

    -[PUNavigationController pu_setDisablePushPopAnimation:](v10, "pu_setDisablePushPopAnimation:", objc_msgSend(v7, "allowsNavigationPushPopAnimation") ^ 1);
    objc_msgSend(v7, "photoLibrary");
    v38 = v7;
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D7B970], "sharedLibraryStatusProviderWithPhotoLibrary:");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B578]), "initWithSharedLibraryStatusProvider:", v36);
    if (objc_msgSend(v38, "excludesHiddenAlbum"))
      v15 = 7;
    else
      v15 = 3;
    v16 = [PUSidebarViewController alloc];
    objc_msgSend(v38, "generatedFilter");
    obj = a3;
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "assetPredicate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "allPhotosVirtualCollection");
    v34 = a4;
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v8;
    v20 = -[PUSidebarViewController initWithNavigationRoot:photoLibrary:libraryFilterState:options:additionalAssetsFilterPredicate:pickerAllPhotosVirtualCollection:](v16, "initWithNavigationRoot:photoLibrary:libraryFilterState:options:additionalAssetsFilterPredicate:pickerAllPhotosVirtualCollection:", v8, v13, v14, v15, v18, v19);

    v21 = (UINavigationController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3A40]), "initWithRootViewController:", v20);
    v22 = (UISplitViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C90]), "initWithStyle:", 1);
    -[UISplitViewController setViewController:forColumn:](v22, "setViewController:forColumn:", v21, 0);
    -[UISplitViewController setViewController:forColumn:](v22, "setViewController:forColumn:", v10, 2);
    -[UISplitViewController setViewController:forColumn:](v22, "setViewController:forColumn:", v10, 3);
    -[UISplitViewController setPrimaryBackgroundStyle:](v22, "setPrimaryBackgroundStyle:", 1);
    -[UISplitViewController setPreferredSplitBehavior:](v22, "setPreferredSplitBehavior:", 1);
    -[UISplitViewController setPresentsWithGesture:](v22, "setPresentsWithGesture:", 0);
    v40 = objc_opt_class();
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (id)-[UISplitViewController registerForTraitChanges:withTarget:action:](v22, "registerForTraitChanges:withTarget:action:", v23, v9, sel__splitViewControllerDidChangeTraitPresentationSemanticContext_);

    objc_storeStrong((id *)&v9->_configuration, obj);
    objc_storeStrong((id *)&v9->_contentViewController, v34);
    contentNavigationController = v9->_contentNavigationController;
    v9->_contentNavigationController = &v10->super;
    v26 = v10;

    sidebarViewController = v9->_sidebarViewController;
    v9->_sidebarViewController = v20;
    v28 = v20;
    v8 = v37;
    v29 = v28;

    sidebarNavigationController = v9->_sidebarNavigationController;
    v9->_sidebarNavigationController = v21;
    v31 = v21;

    splitViewController = v9->_splitViewController;
    v9->_splitViewController = v22;

    v7 = v38;
  }

  return v9;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  int v15;
  void *v16;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PUPickerManagedViewController;
  -[PUPickerManagedViewController viewDidLoad](&v18, sel_viewDidLoad);
  -[PUPickerManagedViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerChangeObserver:context:", self, PUPickerConfigurationObservationContext_97284);

  -[PUPickerManagedViewController contentNavigationController](self, "contentNavigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setDelegate:", self);

  -[PUPickerManagedViewController splitViewController](self, "splitViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", self);

  -[PUPickerManagedViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "hasClearBackgroundColor");

  if ((v7 & 1) == 0)
  {
    -[PUPickerManagedViewController configuration](self, "configuration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "hasClearBackgroundColor"))
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemBackgroundColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerManagedViewController view](self, "view");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setBackgroundColor:", v9);

  }
  -[PUPickerManagedViewController _updatePreferredDisplayMode](self, "_updatePreferredDisplayMode");
  -[PUPickerManagedViewController splitViewController](self, "splitViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerManagedViewController px_addOrReplaceChildViewController:activateConstraints:](self, "px_addOrReplaceChildViewController:activateConstraints:", v11, 1);

  -[PUPickerManagedViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
  -[PUPickerManagedViewController splitViewController](self, "splitViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "displayMode") == 1)
  {

LABEL_9:
    v15 = 0;
    v16 = 0;
    goto LABEL_11;
  }
  -[PUPickerManagedViewController splitViewController](self, "splitViewController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "isCollapsed");

  if ((v14 & 1) != 0)
    goto LABEL_9;
  -[PUPickerManagedViewController sidebarViewController](self, "sidebarViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 1;
LABEL_11:
  -[PUPickerManagedViewController contentViewController](self, "contentViewController");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSidebarViewController:", v16);

  if (v15)
  -[PUPickerManagedViewController _updateOnboardingOverlayView](self, "_updateOnboardingOverlayView");
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPickerManagedViewController;
  -[PUPickerManagedViewController traitCollectionDidChange:](&v4, sel_traitCollectionDidChange_, a3);
  -[PUPickerManagedViewController _updateSupportsInteractiveBarTransition](self, "_updateSupportsInteractiveBarTransition");
}

- (void)didRotateFromInterfaceOrientation:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPickerManagedViewController;
  -[PUPickerManagedViewController didRotateFromInterfaceOrientation:](&v4, sel_didRotateFromInterfaceOrientation_, a3);
  -[PUPickerManagedViewController _updateSupportsInteractiveBarTransition](self, "_updateSupportsInteractiveBarTransition");
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PUPickerManagedViewController;
  -[PUPickerManagedViewController preferredContentSizeDidChangeForChildContentContainer:](&v4, sel_preferredContentSizeDidChangeForChildContentContainer_, a3);
  -[PUPickerManagedViewController _updatePreferredContentSize](self, "_updatePreferredContentSize");
}

- (void)viewWillLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PUPickerManagedViewController;
  -[PUPickerManagedViewController viewWillLayoutSubviews](&v3, sel_viewWillLayoutSubviews);
  -[PUPickerManagedViewController _updateSupportsInteractiveBarTransition](self, "_updateSupportsInteractiveBarTransition");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PUPickerManagedViewController;
  -[PUPickerManagedViewController viewDidLayoutSubviews](&v6, sel_viewDidLayoutSubviews);
  -[PUPickerManagedViewController _updateInteractiveBarTransitionFractionExpandedAndWindowHeight](self, "_updateInteractiveBarTransitionFractionExpandedAndWindowHeight");
  -[PUPickerManagedViewController _updatePreferredDisplayMode](self, "_updatePreferredDisplayMode");
  -[PUPickerManagedViewController _updateBackgroundColor](self, "_updateBackgroundColor");
  -[PUPickerManagedViewController _updateOnboardingOverlayBadgeContainer](self, "_updateOnboardingOverlayBadgeContainer");
  -[PUPickerManagedViewController onboardingOverlayView](self, "onboardingOverlayView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUPickerManagedViewController onboardingOverlayView](self, "onboardingOverlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bringSubviewToFront:", v5);

}

- (PUPickerOnboardingView)onboardingOverlayView
{
  void *v3;
  int v4;
  PUPickerOnboardingView *v5;
  void *v6;
  void *v7;
  PUPickerOnboardingView *v8;
  PUPickerOnboardingView *onboardingOverlayView;

  if (!self->_onboardingOverlayView)
  {
    -[PUPickerManagedViewController configuration](self, "configuration");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "shouldShowOnboardingOverlayView");

    if (v4)
    {
      v5 = [PUPickerOnboardingView alloc];
      -[PUPickerManagedViewController configuration](self, "configuration");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "pickerClientDisplayName");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PUPickerOnboardingView initWithClientDisplayName:](v5, "initWithClientDisplayName:", v7);

      -[PUPickerOnboardingView setDelegate:](v8, "setDelegate:", self);
      -[PUPickerOnboardingView setTranslatesAutoresizingMaskIntoConstraints:](v8, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      onboardingOverlayView = self->_onboardingOverlayView;
      self->_onboardingOverlayView = v8;

    }
  }
  return self->_onboardingOverlayView;
}

- (void)presentDataAccessEducationViewController:(id)a3
{
  +[PUPickerUtilities presentDataAccessEducationViewController](PUPickerUtilities, "presentDataAccessEducationViewController", a3);
}

- (void)_updateOnboardingOverlayView
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[5];

  v30[4] = *MEMORY[0x1E0C80C00];
  -[PUPickerManagedViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "shouldShowOnboardingOverlayView");

  -[PUPickerManagedViewController onboardingOverlayView](self, "onboardingOverlayView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeFromSuperview");

  if (v4)
  {
    -[PUPickerManagedViewController view](self, "view");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerManagedViewController onboardingOverlayView](self, "onboardingOverlayView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addSubview:", v7);

    v20 = (void *)MEMORY[0x1E0CB3718];
    -[PUPickerManagedViewController onboardingOverlayView](self, "onboardingOverlayView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "topAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerManagedViewController view](self, "view");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "constraintEqualToAnchor:", v26);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v25;
    -[PUPickerManagedViewController onboardingOverlayView](self, "onboardingOverlayView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "bottomAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerManagedViewController view](self, "view");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v21);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[1] = v19;
    -[PUPickerManagedViewController onboardingOverlayView](self, "onboardingOverlayView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerManagedViewController view](self, "view");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintEqualToAnchor:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v30[2] = v11;
    -[PUPickerManagedViewController onboardingOverlayView](self, "onboardingOverlayView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "trailingAnchor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUPickerManagedViewController view](self, "view");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v30[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "activateConstraints:", v17);

  }
  else
  {
    -[PUPickerManagedViewController setOnboardingOverlayView:](self, "setOnboardingOverlayView:", 0);
  }
}

- (void)_updateOnboardingOverlayBadgeContainer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  -[PUPickerManagedViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "supportsInteractiveBarTransition") & 1) != 0)
  {
    -[PUPickerManagedViewController viewIfLoaded](self, "viewIfLoaded");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PUPickerManagedViewController contentViewController](self, "contentViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "viewIfLoaded");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v8, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
    v6 = v8;
  else
    v6 = 0;
  -[PUPickerManagedViewController onboardingOverlayView](self, "onboardingOverlayView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBadgeContainerView:", v6);

}

- (void)_updatePreferredContentSize
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[PUPickerManagedViewController splitViewController](self, "splitViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSize");
  v5 = v4;
  v7 = v6;

  -[PUPickerManagedViewController preferredContentSize](self, "preferredContentSize");
  if (v9 != v5 || v8 != v7)
    -[PUPickerManagedViewController setPreferredContentSize:](self, "setPreferredContentSize:", v5, v7);
}

- (void)_updatePreferredDisplayMode
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;

  -[PUPickerManagedViewController sheetPresentationController](self, "sheetPresentationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "detents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    -[PUPickerManagedViewController sheetPresentationController](self, "sheetPresentationController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "detents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = PXExists() ^ 1;

  }
  else
  {
    v7 = 1;
  }

  -[PUPickerManagedViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "bounds");
  v10 = v9;

  -[PUPickerManagedViewController configuration](self, "configuration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "allowsSidebar"))
  {
    -[PUPickerManagedViewController contentViewController](self, "contentViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "hasContent");
    v14 = 2;
    if (v10 < 400.0)
      v14 = 1;
    if ((v13 & v7) != 0)
      v15 = v14;
    else
      v15 = 1;

  }
  else
  {
    v15 = 1;
  }

  -[PUPickerManagedViewController splitViewController](self, "splitViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "preferredDisplayMode");

  if (v17 != v15)
  {
    -[PUPickerManagedViewController splitViewController](self, "splitViewController");
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPreferredDisplayMode:", v15);

  }
}

- (void)_updateBackgroundColor
{
  void *v3;
  void *v4;
  id v5;

  -[PUPickerManagedViewController contentViewController](self, "contentViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sidebarViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[PUPickerManagedViewController view](self, "view");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "px_enumerateDescendantSubviewsPassingTest:usingBlock:", &__block_literal_global_163_97306, &__block_literal_global_167_97307);

  }
}

- (void)_updateSupportsInteractiveBarTransition
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  const char *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  _BOOL4 v21;
  char v22;
  void *v23;
  _QWORD v24[4];
  char v25;
  uint8_t buf[16];

  -[PUPickerManagedViewController traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if (v4)
  {
    PLPickerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v6 = "Interactive navigation bar transition is skipped due to non-phone idiom.";
LABEL_21:
      _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, v6, buf, 2u);
      goto LABEL_22;
    }
    goto LABEL_22;
  }
  -[PUPickerManagedViewController splitViewController](self, "splitViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "displayMode") == 1)
  {

  }
  else
  {
    -[PUPickerManagedViewController splitViewController](self, "splitViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isCollapsed");

    if ((v9 & 1) == 0)
    {
      PLPickerGetLog();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)buf = 0;
        v6 = "Interactive navigation bar transition is skipped due to visible sidebar.";
        goto LABEL_21;
      }
      goto LABEL_22;
    }
  }
  -[PUPickerManagedViewController configuration](self, "configuration");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "edgesWithoutContentMargins") & 5;

  if (v11)
  {
    PLPickerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v6 = "Interactive navigation bar transition is skipped due to hidden navigation bar or toolbar.";
      goto LABEL_21;
    }
LABEL_22:
    v22 = 0;
    goto LABEL_23;
  }
  -[PUPickerManagedViewController view](self, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "window");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "windowScene");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "interfaceOrientation") - 3;

  if (v15 <= 1)
  {
    PLPickerGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      v6 = "Interactive navigation bar transition is skipped due to landscape orientation.";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  -[PUPickerManagedViewController view](self, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "window");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "_rootSheetPresentationController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "_detentValues");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  PLPickerGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  v21 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (v20 != 2)
  {
    if (v21)
    {
      *(_WORD *)buf = 0;
      v6 = "Interactive navigation bar transition is skipped due to invalid detent counts.";
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  if (v21)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AAB61000, v5, OS_LOG_TYPE_DEBUG, "Interactive navigation bar transition is enabled.", buf, 2u);
  }
  v22 = 1;
LABEL_23:

  -[PUPickerManagedViewController configuration](self, "configuration");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __72__PUPickerManagedViewController__updateSupportsInteractiveBarTransition__block_invoke;
  v24[3] = &__block_descriptor_33_e40_v16__0___PUMutablePickerConfiguration__8l;
  v25 = v22;
  objc_msgSend(v23, "performChanges:", v24);

}

- (void)_updateInteractiveBarTransitionFractionExpandedAndWindowHeight
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  NSObject *v25;
  void *v26;
  _QWORD v27[6];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[PUPickerManagedViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;

  -[PUPickerManagedViewController view](self, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "window");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "_rootSheetPresentationController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "_detentValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 1.0;
  if (objc_msgSend(v10, "count") == 2)
  {
    -[PUPickerManagedViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    -[PUPickerManagedViewController view](self, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "safeAreaInsets");
    v17 = v14 - v16;

    objc_msgSend(v10, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "doubleValue");
    v20 = v19;

    objc_msgSend(v10, "lastObject");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "doubleValue");
    v23 = v22;

    v24 = fmin(v20, v23);
    v11 = fmin(fmax((v17 - v24) / (fmax(v20, v23) - v24), 0.0), 1.0);
  }
  PLPickerGetLog();
  v25 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218240;
    v29 = v6;
    v30 = 2048;
    v31 = v11;
    _os_log_impl(&dword_1AAB61000, v25, OS_LOG_TYPE_DEBUG, "Interactive navigation bar transition will update with window height: %f, fraction expanded: %f", buf, 0x16u);
  }

  -[PUPickerManagedViewController configuration](self, "configuration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __95__PUPickerManagedViewController__updateInteractiveBarTransitionFractionExpandedAndWindowHeight__block_invoke;
  v27[3] = &__block_descriptor_48_e40_v16__0___PUMutablePickerConfiguration__8l;
  *(double *)&v27[4] = v11;
  v27[5] = v6;
  objc_msgSend(v26, "performChanges:", v27);

}

- (void)_forceContentToMatchContainerFrame
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  NSObject *v23;
  NSObject *v24;
  const char *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  void *v39;
  double MidX;
  void *v41;
  double v42;
  NSObject *v43;
  void *v44;
  void *v45;
  _BYTE v46[12];
  __int16 v47;
  double v48;
  uint64_t v49;
  CGPoint v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v49 = *MEMORY[0x1E0C80C00];
  -[PUPickerManagedViewController configuration](self, "configuration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "supportsInteractiveBarTransition");

  if (!v4)
    return;
  -[PUPickerManagedViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  -[PUPickerManagedViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "_rootSheetPresentationController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "_detentValues");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count") == 2)
  {
    objc_msgSend(v12, "firstObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "doubleValue");
    v15 = v14;
    objc_msgSend(v12, "lastObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "doubleValue");
    v18 = fmax(v15, v17);

    objc_msgSend(v11, "containerView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "safeAreaInsets");
    v21 = v20;

    v22 = v18 + v21;
    PLPickerGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)v46 = 134218240;
      *(double *)&v46[4] = v22;
      v47 = 2048;
      v48 = v18;
      _os_log_impl(&dword_1AAB61000, v23, OS_LOG_TYPE_DEBUG, "Interactive navigation bar transition calculated max card height to: %f, detent: %f", v46, 0x16u);
    }

    if (v22 <= v8)
      goto LABEL_12;
    PLPickerGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v46 = 0;
      v25 = "Interactive navigation bar transition failed to calculate max card height from root sheet detent values. Height too large.";
LABEL_10:
      _os_log_impl(&dword_1AAB61000, v24, OS_LOG_TYPE_ERROR, v25, v46, 2u);
    }
  }
  else
  {
    PLPickerGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v46 = 0;
      v25 = "Interactive navigation bar transition failed to calculate max card height from root sheet detent values. Invalid detents.";
      goto LABEL_10;
    }
  }
  v22 = v8 + -54.0;

LABEL_12:
  -[PUPickerManagedViewController childViewControllers](self, "childViewControllers", *(_QWORD *)v46);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "count");

  if (v27 != 1)
  {
    PXAssertGetLog();
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v46 = 0;
      _os_log_error_impl(&dword_1AAB61000, v28, OS_LOG_TYPE_ERROR, "This code assumes there's just 1 child view controller, reevaluate if this changes.", v46, 2u);
    }

  }
  -[PUPickerManagedViewController childViewControllers](self, "childViewControllers");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "firstObject");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v31, "frame");
  v33 = v32;
  v35 = v34;
  -[PUPickerManagedViewController view](self, "view");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "bounds");
  v38 = v37;

  objc_msgSend(v31, "setFrame:", v33, v35, v38, v22);
  -[PUPickerManagedViewController view](self, "view");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "bounds");
  MidX = CGRectGetMidX(v51);
  -[PUPickerManagedViewController view](self, "view");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "bounds");
  v42 = v22 * 0.5 + CGRectGetMinY(v52);

  objc_msgSend(v31, "setCenter:", MidX, v42);
  PLPickerGetLog();
  v43 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG))
  {
    v53.origin.x = v33;
    v53.origin.y = v35;
    v53.size.width = v38;
    v53.size.height = v22;
    NSStringFromCGRect(v53);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v50.x = MidX;
    v50.y = v42;
    NSStringFromCGPoint(v50);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v46 = 138412546;
    *(_QWORD *)&v46[4] = v44;
    v47 = 2112;
    v48 = *(double *)&v45;
    _os_log_impl(&dword_1AAB61000, v43, OS_LOG_TYPE_DEBUG, "Interactive navigation bar transition did update view frame to %@, center to: %@", v46, 0x16u);

  }
}

- (void)assetPickerOnboardingViewDidTransitionToBadge:(id)a3
{
  objc_msgSend(a3, "setUserInteractionEnabled:", 0);
}

- (void)assetPickerOnboardingViewDidDismissBadge:(id)a3
{
  id v3;

  -[PUPickerManagedViewController configuration](self, "configuration", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "performChanges:", &__block_literal_global_171_97290);

}

- (void)splitViewControllerDidExpand:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;

  v4 = objc_msgSend(a3, "displayMode");
  if (v4 == 1)
  {
    v5 = 0;
  }
  else
  {
    -[PUPickerManagedViewController sidebarViewController](self, "sidebarViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[PUPickerManagedViewController contentViewController](self, "contentViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSidebarViewController:", v5);

  if (v4 != 1)
  -[PUPickerManagedViewController _updateSupportsInteractiveBarTransition](self, "_updateSupportsInteractiveBarTransition");
}

- (void)splitViewControllerDidCollapse:(id)a3
{
  void *v4;

  -[PUPickerManagedViewController contentViewController](self, "contentViewController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSidebarViewController:", 0);

  -[PUPickerManagedViewController _updateSupportsInteractiveBarTransition](self, "_updateSupportsInteractiveBarTransition");
}

- (void)splitViewController:(id)a3 willChangeToDisplayMode:(int64_t)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  PUPickerManagedViewController *v10;
  int64_t v11;

  v6 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __77__PUPickerManagedViewController_splitViewController_willChangeToDisplayMode___block_invoke;
  block[3] = &unk_1E58A9DF0;
  v10 = self;
  v11 = a4;
  v9 = v6;
  v7 = v6;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

- (void)navigationController:(id)a3 willShowViewController:(id)a4 animated:(BOOL)a5
{
  void *v6;
  char v7;
  void *v8;
  id v9;

  v9 = a4;
  -[PUPickerManagedViewController configuration](self, "configuration");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isPeopleOrPetsPicker");

  if ((v7 & 1) == 0)
  {
    -[PUPickerManagedViewController contentViewController](self, "contentViewController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "navigationWillPresentViewController:", v9);

  }
}

- (void)navigationController:(id)a3 didShowViewController:(id)a4 animated:(BOOL)a5
{
  id v6;
  id v7;

  v6 = a4;
  -[PUPickerManagedViewController contentViewController](self, "contentViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v6)
    -[PUPickerManagedViewController _updateOnboardingOverlayBadgeContainer](self, "_updateOnboardingOverlayBadgeContainer");
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  char v6;
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  if ((void *)PUPickerConfigurationObservationContext_97284 != a5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPickerManagedViewController.m"), 498, CFSTR("Code which should be unreachable has been reached"));

    abort();
  }
  if ((v6 & 0x25) != 0)
    -[PUPickerManagedViewController _updateOnboardingOverlayView](self, "_updateOnboardingOverlayView");
  if ((v6 & 1) != 0)
    -[PUPickerManagedViewController _updateSupportsInteractiveBarTransition](self, "_updateSupportsInteractiveBarTransition");
  if ((v6 & 0xE0) != 0)
    -[PUPickerManagedViewController _forceContentToMatchContainerFrame](self, "_forceContentToMatchContainerFrame");

}

- (void)setOnboardingOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_onboardingOverlayView, a3);
}

- (PUPickerConfiguration)configuration
{
  return self->_configuration;
}

- (PUPickerContainerController)contentViewController
{
  return self->_contentViewController;
}

- (UISplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (UINavigationController)contentNavigationController
{
  return self->_contentNavigationController;
}

- (UINavigationController)sidebarNavigationController
{
  return self->_sidebarNavigationController;
}

- (PUSidebarViewController)sidebarViewController
{
  return self->_sidebarViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sidebarViewController, 0);
  objc_storeStrong((id *)&self->_sidebarNavigationController, 0);
  objc_storeStrong((id *)&self->_contentNavigationController, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_contentViewController, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_onboardingOverlayView, 0);
}

uint64_t __77__PUPickerManagedViewController_splitViewController_willChangeToDisplayMode___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  void *v4;

  if (*(_QWORD *)(a1 + 48) == 1 || (objc_msgSend(*(id *)(a1 + 32), "isCollapsed") & 1) != 0)
  {
    v2 = 0;
    v3 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "sidebarViewController");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = 1;
  }
  objc_msgSend(*(id *)(a1 + 40), "contentViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setSidebarViewController:", v3);

  if (v2)
  return objc_msgSend(*(id *)(a1 + 40), "_updateSupportsInteractiveBarTransition");
}

void __74__PUPickerManagedViewController_assetPickerOnboardingViewDidDismissBadge___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  v2 = a2;
  objc_msgSend(v2, "setDidDismissOnboardingOverlayView:", 1);
  objc_msgSend(v2, "setDidShowPhotosIndicator:", 1);

}

void __95__PUPickerManagedViewController__updateInteractiveBarTransitionFractionExpandedAndWindowHeight__block_invoke(uint64_t a1, void *a2)
{
  double v3;
  id v4;

  v3 = *(double *)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "setInteractiveBarTransitionFractionExpanded:", v3);
  objc_msgSend(v4, "setInteractiveBarTransitionWindowHeight:", *(double *)(a1 + 40));

}

uint64_t __72__PUPickerManagedViewController__updateSupportsInteractiveBarTransition__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setSupportsInteractiveBarTransition:", *(unsigned __int8 *)(a1 + 32));
}

void __55__PUPickerManagedViewController__updateBackgroundColor__block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = (void *)MEMORY[0x1E0DC3658];
  v3 = a2;
  objc_msgSend(v2, "clearColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setBackgroundColor:", v4);

}

uint64_t __55__PUPickerManagedViewController__updateBackgroundColor__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("_UISplitViewControllerPanelImplView"));
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

uint64_t __60__PUPickerManagedViewController__updatePreferredDisplayMode__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(a2, "identifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", *MEMORY[0x1E0DC5378]) ^ 1;

  return v3;
}

@end
