@implementation SBHPadAddSheetViewController

- (SBHPadAddSheetViewController)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 allowedWidgets:(SBHWidgetFilteringParameters)a5 appCellConfigurator:(id)a6 addWidgetSheetStyle:(unint64_t)a7
{
  char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t v32;
  objc_super v33;

  v33.receiver = self;
  v33.super_class = (Class)SBHPadAddSheetViewController;
  v7 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellConfigurator:addWidgetSheetStyle:](&v33, sel_initWithListLayoutProvider_iconViewProvider_allowedWidgets_appCellConfigurator_addWidgetSheetStyle_, a3, a4, a5.families, *(_QWORD *)&a5.includesNonStackable, a6, a7);
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)*((_QWORD *)v7 + 182);
    *((_QWORD *)v7 + 182) = v8;

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, sel__contentSizeCategoryDidChange_, *MEMORY[0x1E0DC48E8], 0);

    v11 = SBHScreenTypeForCurrentDevice();
    SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation(v11, 3, (uint64_t)&v25);
    v12 = v25;
    v13 = v26;
    v14 = v28;
    *((_OWORD *)v7 + 76) = v27;
    *((_OWORD *)v7 + 77) = v14;
    *((_OWORD *)v7 + 74) = v12;
    *((_OWORD *)v7 + 75) = v13;
    v15 = v29;
    v16 = v30;
    v17 = v31;
    *((_QWORD *)v7 + 162) = v32;
    *((_OWORD *)v7 + 79) = v16;
    *((_OWORD *)v7 + 80) = v17;
    *((_OWORD *)v7 + 78) = v15;
    SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation(v11, 1, (uint64_t)&v25);
    v18 = v25;
    v19 = v26;
    v20 = v28;
    *(_OWORD *)(v7 + 1336) = v27;
    *(_OWORD *)(v7 + 1352) = v20;
    *(_OWORD *)(v7 + 1304) = v18;
    *(_OWORD *)(v7 + 1320) = v19;
    v21 = v29;
    v22 = v30;
    v23 = v31;
    *((_QWORD *)v7 + 177) = v32;
    *(_OWORD *)(v7 + 1384) = v22;
    *(_OWORD *)(v7 + 1400) = v23;
    *(_OWORD *)(v7 + 1368) = v21;
    objc_msgSend(v7, "setWantsBottomAttachedPresentation:", 1);
  }
  return (SBHPadAddSheetViewController *)v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, *MEMORY[0x1E0DC48E8], 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHPadAddSheetViewController;
  -[SBHPadAddSheetViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  uint64_t v4;
  MTMaterialView *v5;
  MTMaterialView *backgroundView;
  MTMaterialView *v7;
  UISplitViewController *v8;
  UISplitViewController *splitViewController;
  void *v10;
  void *v11;
  double v12;
  SBHPadAddSheetViewController *v13;
  double v14;
  double v15;
  unint64_t v16;
  SBHAddWidgetSheetViewController *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  SBHAddWidgetSheetViewController *v25;
  SBHAddWidgetSheetViewController *left;
  SBHAddWidgetSheetViewController *v27;
  void *v28;
  SBHAddWidgetSheetViewController *v29;
  id WeakRetained;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  SBHWidgetSearchController *v36;
  SBHWidgetSearchController *widgetSearchController;
  void *v38;
  void *v39;
  void *v40;
  SBHWidgetSearchController *v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  NSArray *v47;
  NSArray *searchBarGradientMaskLayers;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  objc_super v62;
  _QWORD v63[3];

  v63[2] = *MEMORY[0x1E0C80C00];
  v62.receiver = self;
  v62.super_class = (Class)SBHPadAddSheetViewController;
  -[SBHPadAddSheetViewController viewDidLoad](&v62, sel_viewDidLoad);
  -[SBHPadAddSheetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = -[SBHPadAddSheetViewController _newBackgroundView](self, "_newBackgroundView");
  backgroundView = self->_backgroundView;
  self->_backgroundView = v5;

  v7 = self->_backgroundView;
  v61 = v3;
  objc_msgSend(v3, "bounds");
  -[MTMaterialView setFrame:](v7, "setFrame:");
  -[MTMaterialView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
  objc_msgSend(v3, "addSubview:", self->_backgroundView);
  v8 = (UISplitViewController *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3C90]), "initWithStyle:", 1);
  splitViewController = self->_splitViewController;
  self->_splitViewController = v8;

  -[UISplitViewController _setOverrideHorizontalSizeClass:](self->_splitViewController, "_setOverrideHorizontalSizeClass:", 2);
  -[UISplitViewController view](self->_splitViewController, "view");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v11);

  LODWORD(v12) = 0;
  -[UISplitViewController setGutterWidth:](self->_splitViewController, "setGutterWidth:", v12);
  -[UISplitViewController setPreferredSplitBehavior:](self->_splitViewController, "setPreferredSplitBehavior:", 1);
  -[UISplitViewController setPreferredDisplayMode:](self->_splitViewController, "setPreferredDisplayMode:", 2);
  -[UISplitViewController setDisplayModeButtonVisibility:](self->_splitViewController, "setDisplayModeButtonVisibility:", 1);
  -[UISplitViewController setPrimaryBackgroundStyle:](self->_splitViewController, "setPrimaryBackgroundStyle:", 1);
  v60 = (void *)v4;
  if (v4)
    v13 = (SBHPadAddSheetViewController *)v4;
  else
    v13 = self;
  -[SBHPadAddSheetViewController _paddedSidebarWidthForInterfaceOrientation:](self, "_paddedSidebarWidthForInterfaceOrientation:", -[SBHPadAddSheetViewController interfaceOrientation](v13, "interfaceOrientation"));
  v15 = v14;
  -[UISplitViewController setPreferredPrimaryColumnWidth:](self->_splitViewController, "setPreferredPrimaryColumnWidth:");
  -[UISplitViewController setMaximumPrimaryColumnWidth:](self->_splitViewController, "setMaximumPrimaryColumnWidth:", v15);
  -[SBHPadAddSheetViewController bs_addChildViewController:](self, "bs_addChildViewController:", self->_splitViewController);
  v16 = -[SBHAddWidgetSheetViewControllerBase addWidgetSheetStyle](self, "addWidgetSheetStyle");
  v17 = [SBHAddWidgetSheetViewController alloc];
  -[SBHAddWidgetSheetViewControllerBase listLayoutProvider](self, "listLayoutProvider");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewControllerBase iconViewProvider](self, "iconViewProvider");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = -[SBHAddWidgetSheetViewControllerBase allowedWidgets](self, "allowedWidgets");
  v22 = v21;
  -[SBHAddWidgetSheetViewControllerBase appCellConfigurator](self, "appCellConfigurator");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "iconImageCache");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[SBHAddWidgetSheetViewControllerBase initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:](v17, "initWithListLayoutProvider:iconViewProvider:allowedWidgets:appCellIconImageCache:addWidgetSheetStyle:", v18, v19, v20, v22, v24, v16);
  left = self->_left;
  self->_left = v25;

  -[SBHAddWidgetSheetViewControllerBase setAllowsFakeWidgets:](self->_left, "setAllowsFakeWidgets:", self->_allowsFakeWidgets);
  -[SBHAddWidgetSheetViewControllerBase setExternalBackgroundView:](self->_left, "setExternalBackgroundView:", self->_backgroundView);
  -[SBHAddWidgetSheetViewController setAddWidgetSheetLocation:](self->_left, "setAddWidgetSheetLocation:", self->_addWidgetSheetLocation);
  -[SBHAddWidgetSheetViewControllerBase setAddWidgetSheetWidgetBackgroundType:](self->_left, "setAddWidgetSheetWidgetBackgroundType:", -[SBHAddWidgetSheetViewControllerBase addWidgetSheetWidgetBackgroundType](self, "addWidgetSheetWidgetBackgroundType"));
  -[SBHAddWidgetSheetViewController setApplicationWidgetCollections:](self->_left, "setApplicationWidgetCollections:", self->_applicationWidgetCollections);
  v27 = self->_left;
  -[SBHPadAddSheetViewController suggestedItemsForGalleryLayoutSize:](self, "suggestedItemsForGalleryLayoutSize:", self->_galleryLayoutSize);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewController setSuggestedItems:forGalleryLayoutSize:](v27, "setSuggestedItems:forGalleryLayoutSize:", v28, self->_galleryLayoutSize);

  v29 = self->_left;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);
  -[SBHAddWidgetSheetViewController setPresenter:](v29, "setPresenter:", WeakRetained);

  -[SBHAddWidgetSheetViewController setGalleryLayoutSize:](self->_left, "setGalleryLayoutSize:", self->_galleryLayoutSize);
  -[SBHAddWidgetSheetViewControllerBase setDelegate:](self->_left, "setDelegate:", self);
  -[SBHAddWidgetSheetViewController view](self->_left, "view");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setBackgroundColor:", v32);

  -[UISplitViewController setViewController:forColumn:](self->_splitViewController, "setViewController:forColumn:", self->_left, 0);
  -[SBHAddWidgetSheetViewController navigationController](self->_left, "navigationController");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setNavigationBarHidden:", 1);

  SBHBundle();
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("WIDGET_ADD_SHEET_SEARCH_PLACEHOLDER"), &stru_1E8D8E958, CFSTR("SpringBoardHome"));
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = -[SBHWidgetSearchController initWithAddWidgetSheetStyle:placeholderText:]([SBHWidgetSearchController alloc], "initWithAddWidgetSheetStyle:placeholderText:", v16, v35);
  widgetSearchController = self->_widgetSearchController;
  self->_widgetSearchController = v36;

  -[SBHWidgetSearchController setObscuresBackgroundDuringPresentation:](self->_widgetSearchController, "setObscuresBackgroundDuringPresentation:", 0);
  -[SBHWidgetSearchController setDelegate:](self->_widgetSearchController, "setDelegate:", self->_left);
  -[SBHWidgetSearchController setSearchResultsUpdater:](self->_widgetSearchController, "setSearchResultsUpdater:", self);
  -[SBHWidgetSearchController setAlwaysShowBarBackground:](self->_widgetSearchController, "setAlwaysShowBarBackground:", self->_wantsSeparator);
  -[SBHWidgetSearchController setShouldInsetContentForGrabber:](self->_widgetSearchController, "setShouldInsetContentForGrabber:", self->_wantsBottomAttachedPresentation);
  -[MTMaterialView visualStylingProviderForCategory:](self->_backgroundView, "visualStylingProviderForCategory:", 2);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetSearchController searchBarTextFieldBackgroundView](self->_widgetSearchController, "searchBarTextFieldBackgroundView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "automaticallyUpdateView:withStyle:", v39, 2);

  -[SBHWidgetSearchController searchBar](self->_widgetSearchController, "searchBar");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "sizeToFit");
  objc_msgSend(v3, "addSubview:", v40);
  v41 = self->_widgetSearchController;
  objc_msgSend(v3, "bounds");
  -[SBHWidgetSearchController updateSearchBarContentInsetsWithWidth:](v41, "updateSearchBarContentInsetsWithWidth:", v42);
  -[SBHWidgetSearchController searchBar](self->_widgetSearchController, "searchBar");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "sizeToFit");

  -[SBHWidgetSearchController searchBar](self->_widgetSearchController, "searchBar");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "layoutIfNeeded");

  -[SBHAddWidgetSheetViewController setExternalSearchController:](self->_left, "setExternalSearchController:", self->_widgetSearchController);
  v45 = (void *)MEMORY[0x1E0DA9E00];
  -[UISplitViewController view](self->_splitViewController, "view");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "configureGradientMaskForFeatherBlurRecipe:onContentView:", 0, v46);
  v47 = (NSArray *)objc_claimAutoreleasedReturnValue();
  searchBarGradientMaskLayers = self->_searchBarGradientMaskLayers;
  self->_searchBarGradientMaskLayers = v47;

  if (-[SBHPadAddSheetViewController wantsCloseButton](self, "wantsCloseButton"))
  {
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 7);
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v49, "addTarget:action:forControlEvents:", self, sel_closeButtonTapped_, 64);
    objc_msgSend(v40, "addSubview:", v49);
    v58 = (void *)MEMORY[0x1E0CB3718];
    objc_msgSend(v49, "trailingAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "trailingAnchor");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:constant:", v51, -21.0);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v52;
    objc_msgSend(v49, "centerYAnchor");
    v59 = v35;
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "searchTextField");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "centerYAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:", v55);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v63[1] = v56;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 2);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "activateConstraints:", v57);

    v35 = v59;
  }

}

- (id)_newBackgroundView
{
  void *v2;

  objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:", 54);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setBackdropScaleAdjustment:", &__block_literal_global_23);
  objc_msgSend(v2, "setGroupNameBase:", CFSTR("Add-Sheet"));
  return v2;
}

double __50__SBHPadAddSheetViewController__newBackgroundView__block_invoke()
{
  return 0.25;
}

- (void)setWantsSeparator:(BOOL)a3
{
  UIView *v4;
  UIView *separatorView;
  UIView *v6;
  void *v7;
  void *v8;

  if (self->_wantsSeparator != a3)
  {
    self->_wantsSeparator = a3;
    if (a3)
    {
      -[SBHPadAddSheetViewController loadViewIfNeeded](self, "loadViewIfNeeded");
      v4 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
      separatorView = self->_separatorView;
      self->_separatorView = v4;

      v6 = self->_separatorView;
      objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIView setBackgroundColor:](v6, "setBackgroundColor:", v7);

      -[UISplitViewController view](self->_splitViewController, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addSubview:", self->_separatorView);
    }
    else
    {
      -[UIView removeFromSuperview](self->_separatorView, "removeFromSuperview");
      v8 = self->_separatorView;
      self->_separatorView = 0;
    }

    -[SBHWidgetSearchController setAlwaysShowBarBackground:](self->_widgetSearchController, "setAlwaysShowBarBackground:", self->_wantsSeparator);
    -[SBHAddWidgetSheetViewController setShouldCenterAppCells:](self->_left, "setShouldCenterAppCells:", self->_wantsSeparator);
  }
}

- (void)closeButtonTapped:(id)a3
{
  id v4;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v4, "addWidgetSheetViewControllerDidCancel:", self);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHPadAddSheetViewController;
  -[SBHPadAddSheetViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[SBHPadAddSheetViewController configureViewsForCurrentInterfaceOrientation](self, "configureViewsForCurrentInterfaceOrientation");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHPadAddSheetViewController;
  -[SBHPadAddSheetViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[SBHPadAddSheetViewController _layoutSeparatorView](self, "_layoutSeparatorView");
}

- (void)viewDidLayoutSubviews
{
  SBHWidgetSearchController *widgetSearchController;
  void *v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHPadAddSheetViewController;
  -[SBHPadAddSheetViewController viewDidLayoutSubviews](&v9, sel_viewDidLayoutSubviews);
  widgetSearchController = self->_widgetSearchController;
  -[SBHPadAddSheetViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[SBHWidgetSearchController updateSearchBarContentInsetsWithWidth:](widgetSearchController, "updateSearchBarContentInsetsWithWidth:", v5);

  -[SBHWidgetSearchController searchBar](self->_widgetSearchController, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeToFit");

  -[SBHWidgetSearchController searchBar](self->_widgetSearchController, "searchBar");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layoutIfNeeded");

  -[SBHPadAddSheetViewController _layoutSearchBarGradientMaskLayers](self, "_layoutSearchBarGradientMaskLayers");
  -[SBHPadAddSheetViewController _layoutSeparatorView](self, "_layoutSeparatorView");
  -[SBHPadAddSheetViewController sheetPresentationController](self, "sheetPresentationController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHWidgetSearchController grabberTopSpacing](self->_widgetSearchController, "grabberTopSpacing");
  objc_msgSend(v8, "_setGrabberTopSpacing:");

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  uint64_t v9;
  objc_super v10;
  _QWORD v11[6];

  height = a3.height;
  width = a3.width;
  v7 = a4;
  SBFWindowForViewControllerTransition();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "_toWindowOrientation");
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __83__SBHPadAddSheetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke;
  v11[3] = &unk_1E8D87778;
  v11[4] = self;
  v11[5] = v9;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, 0);
  v10.receiver = self;
  v10.super_class = (Class)SBHPadAddSheetViewController;
  -[SBHPadAddSheetViewController viewWillTransitionToSize:withTransitionCoordinator:](&v10, sel_viewWillTransitionToSize_withTransitionCoordinator_, v7, width, height);

}

uint64_t __83__SBHPadAddSheetViewController_viewWillTransitionToSize_withTransitionCoordinator___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "configureViewsForInterfaceOrientation:", *(_QWORD *)(a1 + 40));
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  -[SBHAddWidgetSheetViewController updateSearchResultsForSearchController:](self->_left, "updateSearchResultsForSearchController:", a3);
  -[SBHPadAddSheetViewController setNeedsUpdateContentUnavailableConfiguration](self, "setNeedsUpdateContentUnavailableConfiguration");
}

- (id)contentUnavailableConfigurationState
{
  return -[SBHAddWidgetSheetViewController contentUnavailableConfigurationState](self->_left, "contentUnavailableConfigurationState");
}

- (void)updateContentUnavailableConfigurationUsingState:(id)a3
{
  id v4;

  -[SBHAddWidgetSheetViewController _updatedContentUnavailableConfigurationUsingState:](self->_left, "_updatedContentUnavailableConfigurationUsingState:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHPadAddSheetViewController setContentUnavailableConfiguration:](self, "setContentUnavailableConfiguration:", v4);

}

- (UIEdgeInsets)preferredInsetsForSheetPresentationInInterfaceOrientation:(int64_t)a3
{
  unint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  _OWORD v9[7];
  uint64_t v10;
  UIEdgeInsets result;

  v10 = 0;
  memset(v9, 0, sizeof(v9));
  v4 = SBHScreenTypeForCurrentDevice();
  SBHPadAddWidgetSheetMetricsForScreenTypeAndInterfaceOrientation(v4, a3, (uint64_t)v9);
  v5 = *(double *)v9;
  v6 = 0.0;
  v7 = 0.0;
  v8 = *(double *)v9;
  result.right = v8;
  result.bottom = v7;
  result.left = v5;
  result.top = v6;
  return result;
}

- (void)setAddWidgetSheetWidgetBackgroundType:(unint64_t)a3
{
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHPadAddSheetViewController;
  -[SBHAddWidgetSheetViewControllerBase setAddWidgetSheetWidgetBackgroundType:](&v6, sel_setAddWidgetSheetWidgetBackgroundType_);
  -[SBHAddWidgetSheetViewControllerBase setAddWidgetSheetWidgetBackgroundType:](self->_left, "setAddWidgetSheetWidgetBackgroundType:", a3);
  -[SBHPadAddSheetViewController _detailViewController](self, "_detailViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAddWidgetSheetWidgetBackgroundType:", a3);

}

- (void)configureViewsForInterfaceOrientation:(int64_t)a3
{
  void *v5;
  void *v6;
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
  double v18;
  double v19;

  -[SBHPadAddSheetViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_screen");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_referenceBounds");
  v8 = v7;
  v10 = v9;

  if ((unint64_t)(a3 - 3) >= 2)
    v11 = v10;
  else
    v11 = v8;
  if ((unint64_t)(a3 - 3) < 2)
    v8 = v10;
  -[SBHPadAddSheetViewController preferredInsetsForSheetPresentationInInterfaceOrientation:](self, "preferredInsetsForSheetPresentationInInterfaceOrientation:", a3);
  -[SBHPadAddSheetViewController setPreferredContentSize:](self, "setPreferredContentSize:", v8 - (v12 + v13), v11 - (v14 + v15));
  -[SBHPadAddSheetViewController _paddedSidebarWidthForInterfaceOrientation:](self, "_paddedSidebarWidthForInterfaceOrientation:", a3);
  v17 = v16;
  v18 = *MEMORY[0x1E0DC53A8];
  if (self->_wantsSeparator)
    v16 = *MEMORY[0x1E0DC53A8];
  -[UISplitViewController setPreferredPrimaryColumnWidth:](self->_splitViewController, "setPreferredPrimaryColumnWidth:", v16);
  if (self->_wantsSeparator)
    v19 = v18;
  else
    v19 = v17;
  -[UISplitViewController setMaximumPrimaryColumnWidth:](self->_splitViewController, "setMaximumPrimaryColumnWidth:", v19);
}

- (void)configureViewsForCurrentInterfaceOrientation
{
  void *v3;
  SBHPadAddSheetViewController *v4;
  SBHPadAddSheetViewController *v5;

  -[SBHPadAddSheetViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "window");
  v5 = (SBHPadAddSheetViewController *)objc_claimAutoreleasedReturnValue();

  v4 = v5;
  if (!v5)
    v4 = self;
  -[SBHPadAddSheetViewController configureViewsForInterfaceOrientation:](self, "configureViewsForInterfaceOrientation:", -[SBHPadAddSheetViewController interfaceOrientation](v4, "interfaceOrientation"));

}

- (double)_columnSpacing
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;

  -[SBHAddWidgetSheetViewControllerBase listLayoutProvider](self, "listLayoutProvider");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
  v5 = v4;
  objc_msgSend(v3, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassMedium"));
  v7 = v6 + v5 * -2.0;

  return v7;
}

- (unint64_t)_numberOfWidgetColumnsThatFitInWidth:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  unint64_t v11;
  unint64_t v12;

  -[SBHAddWidgetSheetViewControllerBase listLayoutProvider](self, "listLayoutProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
  v8 = v7;
  objc_msgSend(v6, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassMedium"));
  v10 = v9 - v8;
  -[SBHPadAddSheetViewController _metricsForCurrentOrientation](self, "_metricsForCurrentOrientation", 0, 0, 0);
  v11 = (unint64_t)((v10 - v8 - 0.0 - 0.0 + a3) / v10);
  if (v11 <= 2)
    v11 = 2;
  if (v11 >= 5)
    v12 = 5;
  else
    v12 = v11;

  return v12;
}

- (double)_widthNeededForWidgetColumns:(unint64_t)a3
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[SBHAddWidgetSheetViewControllerBase listLayoutProvider](self, "listLayoutProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassSmall"));
  v8 = v7;
  objc_msgSend(v6, "iconImageInfoForGridSizeClass:", CFSTR("SBHIconGridSizeClassMedium"));
  v10 = v9 - v8;
  -[SBHPadAddSheetViewController _metricsForCurrentOrientation](self, "_metricsForCurrentOrientation", 0, 0, 0);

  return 0.0 - (v10 - v8 - (double)a3 * v10) + 0.0;
}

- (double)_paddedSidebarWidthForInterfaceOrientation:(int64_t)a3
{
  -[SBHPadAddSheetViewController _metricsForOrientation:](self, "_metricsForOrientation:", a3, 0);
  return 0.0 + 0.0;
}

- (void)_layoutSearchBarGradientMaskLayers
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  NSArray *v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0DA9E00], "gradientMaskLayerInsetsForFeatherBlurRecipe:", 4);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SBHWidgetSearchController searchBar](self->_widgetSearchController, "searchBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v20 = self->_searchBarGradientMaskLayers;
  v21 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v21)
  {
    v22 = v21;
    v23 = v19 - (v4 + v8);
    v24 = v17 - (v6 + v10);
    v25 = v4 + v15;
    v26 = v6 + v13;
    v27 = *(_QWORD *)v30;
    do
    {
      v28 = 0;
      do
      {
        if (*(_QWORD *)v30 != v27)
          objc_enumerationMutation(v20);
        objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * v28++), "setFrame:", v26, v25, v24, v23, (_QWORD)v29);
      }
      while (v22 != v28);
      v22 = -[NSArray countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v22);
  }

}

- (void)_layoutSeparatorView
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  double MaxX;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  CGRect v21;

  -[UISplitViewController view](self->_splitViewController, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHAddWidgetSheetViewController view](self->_left, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[SBHAddWidgetSheetViewController view](self->_left, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "convertRect:fromView:", v13, v6, v8, v10, v12);
  MaxX = CGRectGetMaxX(v21);

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "scale");
  v17 = 1.0 / v16;

  -[SBHPadAddSheetViewController view](self, "view");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "bounds");
  v20 = v19;

  -[UIView setFrame:](self->_separatorView, "setFrame:", MaxX, 0.0, v17, v20);
}

- (id)_detailViewController
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  id v14;

  -[SBHPadAddSheetViewController splitViewController](self, "splitViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerForColumn:", 2);
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
  {
    v8 = v7;
  }
  else
  {
    objc_msgSend(v5, "navigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v9 = v8;

  objc_msgSend(v9, "topViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();
  v12 = v10;
  if (v11)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v13 = v12;
    else
      v13 = 0;
  }
  else
  {
    v13 = 0;
  }
  v14 = v13;

  return v14;
}

- (SBHPadAddWidgetSheetMetrics)_metricsForOrientation:(SEL)a3
{
  int *v4;
  char *v5;
  CGSize v6;
  __int128 v7;
  __int128 v8;

  if ((unint64_t)(a4 - 3) >= 2)
    v4 = &OBJC_IVAR___SBHPadAddSheetViewController__portraitMetrics;
  else
    v4 = &OBJC_IVAR___SBHPadAddSheetViewController__landscapeMetrics;
  v5 = (char *)self + *v4;
  v6 = (CGSize)*((_OWORD *)v5 + 5);
  *(_OWORD *)&retstr->scaledWidgetSize.height = *((_OWORD *)v5 + 4);
  retstr->detailWidgetPadding = v6;
  *(_OWORD *)&retstr->detailAddButtonTopSpacing = *((_OWORD *)v5 + 6);
  retstr->detailPageControlTopSpacing = *((double *)v5 + 14);
  v7 = *((_OWORD *)v5 + 1);
  *(_OWORD *)&retstr->sheetMargin = *(_OWORD *)v5;
  *(_OWORD *)&retstr->sidebarWidth = v7;
  v8 = *((_OWORD *)v5 + 3);
  *(_OWORD *)&retstr->trailingPadding = *((_OWORD *)v5 + 2);
  *(_OWORD *)&retstr->widgetScaleFactor = v8;
  return self;
}

- (SBHPadAddWidgetSheetMetrics)_metricsForCurrentOrientation
{
  void *v4;
  SBHPadAddSheetViewController *v5;
  SBHPadAddWidgetSheetMetrics *result;
  SBHPadAddSheetViewController *v7;

  -[SBHPadAddSheetViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v7 = (SBHPadAddSheetViewController *)objc_claimAutoreleasedReturnValue();

  v5 = v7;
  if (!v7)
    v5 = self;
  -[SBHPadAddSheetViewController _metricsForOrientation:](self, "_metricsForOrientation:", -[SBHPadAddSheetViewController interfaceOrientation](v5, "interfaceOrientation"));

  return result;
}

- (void)setApplicationWidgetCollections:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_applicationWidgetCollections, a3);
  v5 = a3;
  -[SBHAddWidgetSheetViewController setApplicationWidgetCollections:](self->_left, "setApplicationWidgetCollections:", v5);
  -[SBHPadAddSheetViewController _detailViewController](self, "_detailViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setApplicationWidgetCollections:", v5);

}

- (void)setFavoredApplicationWidgetCollections:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *favoredApplicationWidgetCollections;
  id v7;

  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  favoredApplicationWidgetCollections = self->_favoredApplicationWidgetCollections;
  self->_favoredApplicationWidgetCollections = v5;

  -[SBHAddWidgetSheetViewController setFavoredApplicationWidgetCollections:](self->_left, "setFavoredApplicationWidgetCollections:", v4);
  -[SBHPadAddSheetViewController _detailViewController](self, "_detailViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setFavoredApplicationWidgetCollections:", v4);

}

- (void)setDisfavoredApplicationWidgetCollections:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *disfavoredApplicationWidgetCollections;
  id v7;

  v4 = a3;
  v5 = (NSArray *)objc_msgSend(v4, "copy");
  disfavoredApplicationWidgetCollections = self->_disfavoredApplicationWidgetCollections;
  self->_disfavoredApplicationWidgetCollections = v5;

  -[SBHAddWidgetSheetViewController setDisfavoredApplicationWidgetCollections:](self->_left, "setDisfavoredApplicationWidgetCollections:", v4);
  -[SBHPadAddSheetViewController _detailViewController](self, "_detailViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setDisfavoredApplicationWidgetCollections:", v4);

}

- (void)setSuggestedItems:(id)a3 forGalleryLayoutSize:(unint64_t)a4
{
  NSMutableDictionary *suggestedItemsByGalleryLayoutSize;
  void *v7;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;

  v11 = a3;
  suggestedItemsByGalleryLayoutSize = self->_suggestedItemsByGalleryLayoutSize;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](suggestedItemsByGalleryLayoutSize, "objectForKeyedSubscript:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 != v11)
  {
    v9 = self->_suggestedItemsByGalleryLayoutSize;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9, "setObject:forKeyedSubscript:", v11, v10);

    -[SBHAddWidgetSheetViewController setSuggestedItems:forGalleryLayoutSize:](self->_left, "setSuggestedItems:forGalleryLayoutSize:", v11, a4);
  }

}

- (void)setCustomApplicationWidgetCollections:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_customApplicationWidgetCollections, a3);
  v5 = a3;
  -[SBHAddWidgetSheetViewController setCustomApplicationWidgetCollections:](self->_left, "setCustomApplicationWidgetCollections:", v5);
  -[SBHPadAddSheetViewController _detailViewController](self, "_detailViewController");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCustomApplicationWidgetCollections:", v5);

}

- (void)setAllowsFakeWidgets:(BOOL)a3
{
  self->_allowsFakeWidgets = a3;
  -[SBHAddWidgetSheetViewControllerBase setAllowsFakeWidgets:](self->_left, "setAllowsFakeWidgets:");
}

- (void)setWantsBottomAttachedPresentation:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  if (self->_wantsBottomAttachedPresentation != a3)
  {
    v3 = a3;
    self->_wantsBottomAttachedPresentation = a3;
    -[SBHWidgetSearchController setShouldInsetContentForGrabber:](self->_widgetSearchController, "setShouldInsetContentForGrabber:");
    -[SBHPadAddSheetViewController sheetPresentationController](self, "sheetPresentationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_setWantsBottomAttached:", v3);

  }
}

- (id)suggestedItemsForGalleryLayoutSize:(unint64_t)a3
{
  NSMutableDictionary *suggestedItemsByGalleryLayoutSize;
  void *v4;
  void *v5;

  suggestedItemsByGalleryLayoutSize = self->_suggestedItemsByGalleryLayoutSize;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](suggestedItemsByGalleryLayoutSize, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setPresenter:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presenter);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_presenter, obj);
    -[SBHAddWidgetSheetViewController setPresenter:](self->_left, "setPresenter:", obj);
  }

}

- (void)setGalleryLayoutSize:(unint64_t)a3
{
  self->_galleryLayoutSize = a3;
  -[SBHAddWidgetSheetViewController setGalleryLayoutSize:](self->_left, "setGalleryLayoutSize:");
  -[SBHPadAddSheetViewController configureViewsForCurrentInterfaceOrientation](self, "configureViewsForCurrentInterfaceOrientation");
}

- (void)setAddWidgetSheetLocation:(unint64_t)a3
{
  self->_addWidgetSheetLocation = a3;
  -[SBHAddWidgetSheetViewController setAddWidgetSheetLocation:](self->_left, "setAddWidgetSheetLocation:");
}

- (NSMutableDictionary)userInfo
{
  NSMutableDictionary *userInfo;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  userInfo = self->_userInfo;
  if (!userInfo)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    v5 = self->_userInfo;
    self->_userInfo = v4;

    userInfo = self->_userInfo;
  }
  return userInfo;
}

- (void)addWidgetSheetViewController:(id)a3 didSelectWidgetIconView:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addWidgetSheetViewController:didSelectWidgetIconView:", self, v5);

}

- (void)addWidgetSheetViewControllerDidCancel:(id)a3
{
  id v4;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addWidgetSheetViewControllerDidCancel:", self);

}

- (void)addWidgetSheetViewControllerWillAppear:(id)a3
{
  id v4;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addWidgetSheetViewControllerWillAppear:", self);

}

- (void)addWidgetSheetViewControllerDidAppear:(id)a3
{
  id v4;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addWidgetSheetViewControllerDidAppear:", self);

}

- (void)addWidgetSheetViewControllerWillDisappear:(id)a3
{
  id v4;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addWidgetSheetViewControllerWillDisappear:", self);

}

- (void)addWidgetSheetViewControllerDidDisappear:(id)a3
{
  id v4;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addWidgetSheetViewControllerDidDisappear:", self);

}

- (SBHWidgetDragHandling)widgetDragHandler
{
  void *v2;
  void *v3;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "widgetDragHandler");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (SBHWidgetDragHandling *)v3;
}

- (id)backgroundViewMatchingMaterialBeneathAddWidgetSheetViewController:(id)a3
{
  return -[SBHPadAddSheetViewController _newBackgroundView](self, "_newBackgroundView", a3);
}

- (id)addWidgetSheetViewController:(id)a3 detailViewControllerForWidgetCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v6, "addWidgetSheetViewController:detailViewControllerForWidgetCollection:", self, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)galleryViewControllerForAddWidgetSheetViewController:(id)a3
{
  void *v4;
  void *v5;

  -[SBHAddWidgetSheetViewControllerBase delegate](self, "delegate", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "galleryViewControllerForAddWidgetSheetViewController:", self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSArray)applicationWidgetCollections
{
  return self->_applicationWidgetCollections;
}

- (NSArray)favoredApplicationWidgetCollections
{
  return self->_favoredApplicationWidgetCollections;
}

- (NSArray)disfavoredApplicationWidgetCollections
{
  return self->_disfavoredApplicationWidgetCollections;
}

- (NSMutableDictionary)suggestedItemsByGalleryLayoutSize
{
  return self->_suggestedItemsByGalleryLayoutSize;
}

- (void)setSuggestedItemsByGalleryLayoutSize:(id)a3
{
  objc_storeStrong((id *)&self->_suggestedItemsByGalleryLayoutSize, a3);
}

- (NSArray)customApplicationWidgetCollections
{
  return self->_customApplicationWidgetCollections;
}

- (BOOL)allowsFakeWidgets
{
  return self->_allowsFakeWidgets;
}

- (BOOL)wantsBottomAttachedPresentation
{
  return self->_wantsBottomAttachedPresentation;
}

- (SBHWidgetSheetViewControllerPresenter)presenter
{
  return (SBHWidgetSheetViewControllerPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (unint64_t)galleryLayoutSize
{
  return self->_galleryLayoutSize;
}

- (unint64_t)addWidgetSheetLocation
{
  return self->_addWidgetSheetLocation;
}

- (BOOL)wantsCloseButton
{
  return self->_wantsCloseButton;
}

- (void)setWantsCloseButton:(BOOL)a3
{
  self->_wantsCloseButton = a3;
}

- (BOOL)wantsSeparator
{
  return self->_wantsSeparator;
}

- (MTMaterialView)backgroundView
{
  return self->_backgroundView;
}

- (void)setBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundView, a3);
}

- (UISplitViewController)splitViewController
{
  return self->_splitViewController;
}

- (void)setSplitViewController:(id)a3
{
  objc_storeStrong((id *)&self->_splitViewController, a3);
}

- (SBHAddWidgetSheetViewController)left
{
  return self->_left;
}

- (void)setLeft:(id)a3
{
  objc_storeStrong((id *)&self->_left, a3);
}

- (SBHWidgetSearchController)widgetSearchController
{
  return self->_widgetSearchController;
}

- (void)setWidgetSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSearchController, a3);
}

- (NSArray)searchBarGradientMaskLayers
{
  return self->_searchBarGradientMaskLayers;
}

- (void)setSearchBarGradientMaskLayers:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarGradientMaskLayers, a3);
}

- (UIView)redBox
{
  return self->_redBox;
}

- (void)setRedBox:(id)a3
{
  objc_storeStrong((id *)&self->_redBox, a3);
}

- (UIView)separatorView
{
  return self->_separatorView;
}

- (void)setSeparatorView:(id)a3
{
  objc_storeStrong((id *)&self->_separatorView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_redBox, 0);
  objc_storeStrong((id *)&self->_searchBarGradientMaskLayers, 0);
  objc_storeStrong((id *)&self->_widgetSearchController, 0);
  objc_storeStrong((id *)&self->_left, 0);
  objc_storeStrong((id *)&self->_splitViewController, 0);
  objc_storeStrong((id *)&self->_backgroundView, 0);
  objc_destroyWeak((id *)&self->_presenter);
  objc_storeStrong((id *)&self->_customApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_suggestedItemsByGalleryLayoutSize, 0);
  objc_storeStrong((id *)&self->_disfavoredApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_favoredApplicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_applicationWidgetCollections, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
}

@end
