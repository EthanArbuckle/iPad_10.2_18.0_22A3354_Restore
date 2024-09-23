@implementation SBHIconLibraryTableViewController

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  SBHIconLibraryTableViewController *v15;
  id v16;

  v4 = a3;
  -[SBHIconLibraryTableViewController _visibleIcons](self, "_visibleIcons");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "queryResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconLibraryTableViewController _visibleSectionIndicies](self, "_visibleSectionIndicies");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __75__SBHIconLibraryTableViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v12[3] = &unk_1E8D88DC0;
  v13 = v7;
  v14 = v5;
  v15 = self;
  v16 = v4;
  v8 = v4;
  v9 = v5;
  v10 = v7;
  objc_msgSend(v11, "enumerateIndexesUsingBlock:", v12);

}

- (SBHIconTableViewDiffableDataSource)dataSource
{
  SBHIconTableViewDiffableDataSource *dataSource;
  SBHIconTableViewDiffableDataSource *v5;
  void *v6;
  SBHIconTableViewDiffableDataSource *v7;
  SBHIconTableViewDiffableDataSource *v8;
  SBHIconTableViewDiffableDataSource *v9;
  uint64_t v10;
  uint64_t v11;
  id (*v12)(uint64_t, void *, void *, void *);
  void *v13;
  id v14;
  id location;

  dataSource = self->_dataSource;
  if (dataSource)
    return dataSource;
  objc_initWeak(&location, self);
  v5 = [SBHIconTableViewDiffableDataSource alloc];
  -[SBHIconLibraryTableViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = __47__SBHIconLibraryTableViewController_dataSource__block_invoke;
  v13 = &unk_1E8D88D70;
  objc_copyWeak(&v14, &location);
  v7 = -[UITableViewDiffableDataSource initWithTableView:cellProvider:](v5, "initWithTableView:cellProvider:", v6, &v10);
  v8 = self->_dataSource;
  self->_dataSource = v7;

  -[UITableViewDiffableDataSource setDefaultRowAnimation:](self->_dataSource, "setDefaultRowAnimation:", 5, v10, v11, v12, v13);
  -[SBHIconTableViewDiffableDataSource setIconLibrary:](self->_dataSource, "setIconLibrary:", self->_library);
  v9 = self->_dataSource;
  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
  return v9;
}

- (id)_visibleSectionIndicies
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB3788]);
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[SBHIconLibraryTableViewController _visibleIndexPaths](self, "_visibleIndexPaths", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8++), "section"));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_visibleIcons
{
  char v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[5];

  v3 = -[SBHIconLibraryTableViewController isViewLoaded](self, "isViewLoaded");
  v4 = (void *)MEMORY[0x1E0C99E60];
  if ((v3 & 1) != 0)
  {
    -[SBHIconLibraryTableViewController _visibleIndexPaths](self, "_visibleIndexPaths");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __50__SBHIconLibraryTableViewController__visibleIcons__block_invoke;
    v10[3] = &unk_1E8D88D48;
    v10[4] = self;
    objc_msgSend(v6, "bs_mapNoNulls:", v10);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    return v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)_visibleIndexPaths
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[SBHIconLibraryTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "indexPathsForVisibleRows");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationAppLibrarySearch")))
    v7 = -[SBHIconLibraryTableViewController isDisplayingIcon:](self, "isDisplayingIcon:", v6);
  else
    v7 = 0;

  return v7;
}

- (NSSet)presentedIconLocations
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", CFSTR("SBIconLocationAppLibrarySearch"));
}

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;

  v4 = a3;
  if (-[SBHIconLibraryTableViewController _isViewControllerVisible](self, "_isViewControllerVisible"))
  {
    -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathForIcon:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      v8 = -[SBHIconLibraryTableViewController _isIndexPathVisible:](self, "_isIndexPathVisible:", v7);
    else
      v8 = 0;

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)_isViewControllerVisible
{
  return -[SBHIconLibraryTableViewController _appearState](self, "_appearState") - 1 < 2;
}

+ (Class)tableViewClass
{
  return (Class)objc_opt_self();
}

- (SBHIconLibraryTableViewController)init
{
  SBHIconLibraryTableViewController *v2;
  uint64_t v3;
  _UILegibilitySettings *legibilitySettings;
  void *v5;
  uint64_t v6;
  SBHAppLibrarySettings *settings;
  uint64_t v8;
  NSHashTable *grabbedIconViews;
  SBHScrollableZoomingIconViewInteraction *v10;
  SBHScrollableIconViewInteraction *scrollingInteraction;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBHIconLibraryTableViewController;
  v2 = -[SBHIconLibraryTableViewController initWithStyle:](&v15, sel_initWithStyle_, 0);
  if (v2)
  {
    +[SBHLocalizedIndexedCollationStrategy prewarm](SBHLocalizedIndexedCollationStrategy, "prewarm");
    v3 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC4270]), "initWithStyle:", 1);
    legibilitySettings = v2->_legibilitySettings;
    v2->_legibilitySettings = (_UILegibilitySettings *)v3;

    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appLibrarySettings");
    v6 = objc_claimAutoreleasedReturnValue();
    settings = v2->_settings;
    v2->_settings = (SBHAppLibrarySettings *)v6;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v8 = objc_claimAutoreleasedReturnValue();
    grabbedIconViews = v2->_grabbedIconViews;
    v2->_grabbedIconViews = (NSHashTable *)v8;

    v10 = -[SBHScrollableIconViewInteraction initWithContainer:]([SBHScrollableZoomingIconViewInteraction alloc], "initWithContainer:", v2);
    scrollingInteraction = v2->_scrollingInteraction;
    v2->_scrollingInteraction = &v10->super;

    -[PTSettings addKeyObserver:](v2->_settings, "addKeyObserver:", v2);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("SBHIconLibraryTableViewController-<%p>"), v2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconLibraryTableViewController setFocusGroupIdentifier:](v2, "setFocusGroupIdentifier:", v12);

    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v2->_needsLowQualityAlphaFade = objc_msgSend(v13, "sbf_featherBlurGraphicsQuality") < 100;

  }
  return v2;
}

- (SBHIconLibraryTableViewController)initWithCoder:(id)a3
{

  return 0;
}

- (SBHIconLibraryTableViewController)initWithStyle:(int64_t)a3
{

  return 0;
}

- (SBHIconLibraryTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{

  return 0;
}

- (void)viewDidLoad
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
  double v13;
  void *v14;
  void *v15;
  int v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  double v48;
  objc_super v49;

  v49.receiver = self;
  v49.super_class = (Class)SBHIconLibraryTableViewController;
  -[SBHTableViewController viewDidLoad](&v49, sel_viewDidLoad);
  -[SBHIconLibraryTableViewController listLayoutProvider](self, "listLayoutProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutForIconLocation:", CFSTR("SBIconLocationAppLibrarySearch"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "iconImageInfo");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  +[SBHIconTableViewCell defaultTableViewCellHeightForIconImageInfo:](SBHIconTableViewCell, "defaultTableViewCellHeightForIconImageInfo:", v6, v8, v10, v12);
  v48 = v13;
  objc_msgSend(v3, "layoutForIconLocation:", CFSTR("SBIconLocationAppLibrary"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appLibraryVisualConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "usesInsetPlatterSearchAppearance");

  self->_usesPlatterAppearance = v16;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "userInterfaceIdiom");

  if ((v18 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    +[SBHIconTableViewCell defaultTableViewCellHorizontalMargin](SBHIconTableViewCell, "defaultTableViewCellHorizontalMargin");
    UIEdgeInsetsMakeWithEdges();
    v20 = v19;
    v22 = v21;
    v24 = v23;
    v26 = v25;
  }
  else
  {
    objc_msgSend(v3, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = SBHIconListLayoutNonDefaultIconGridSizeClassLayoutInsets(v27, 1);
    v22 = v28;
    v24 = v29;
    v26 = v30;

  }
  +[SBHIconTableViewCell defaultTableViewCellSeparatorInsetsForIconImageInfo:](SBHIconTableViewCell, "defaultTableViewCellSeparatorInsetsForIconImageInfo:", v6, v8, v10, v12);
  UIEdgeInsetsAdd();
  v32 = v31;
  v34 = v33;
  v36 = v35;
  v38 = v37;
  -[SBHIconLibraryTableViewController tableView](self, "tableView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setDragInteractionEnabled:", 1);
  objc_msgSend(v39, "setDragDelegate:", self);
  objc_msgSend(v39, "setClipsToBounds:", 0);
  objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "_setSectionIndexColor:", v40);

  objc_msgSend(v39, "setBackgroundView:", 0);
  objc_msgSend(v39, "setBackgroundColor:", 0);
  v41 = -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
  objc_msgSend(v39, "setRowHeight:", v48);
  v42 = (void *)objc_opt_new();
  objc_msgSend(v39, "setTableFooterView:", v42);

  objc_msgSend(v39, "setPreservesSuperviewLayoutMargins:", 0);
  objc_opt_self();
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "registerClass:forCellReuseIdentifier:", v43, CFSTR("IconTableViewCell"));

  objc_opt_self();
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "registerClass:forHeaderFooterViewReuseIdentifier:", v44, CFSTR("IconTableViewHeaderFooterView"));

  objc_msgSend(v39, "setContentInsetAdjustmentBehavior:", 1);
  objc_msgSend(v39, "setKeyboardDismissMode:", 1);
  objc_msgSend(v39, "_setDrawsSeparatorAtTopOfSections:", 0);
  objc_msgSend(v39, "setInsetsContentViewsToSafeArea:", 0);
  objc_msgSend(v39, "setLayoutMargins:", v20, v22, v24, v26);
  objc_msgSend(v39, "setSeparatorInset:", v32, v34, v36, v38);
  objc_msgSend(v39, "setSectionHeaderTopPadding:", 0.0);
  if (v16)
  {
    objc_msgSend(v39, "_setHeaderAndFooterViewsFloat:", 0);
    self->_needsLowQualityAlphaFade = 0;
  }
  else
  {
    objc_msgSend(v39, "_setUseLegacySectionHeaderFooterPinningBehavior:", 1);
  }
  -[SBHIconLibraryTableViewController _updateSectionHeaderHeight](self, "_updateSectionHeaderHeight");
  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__handleDidTapEmptyResultsArea_);
  objc_msgSend(v45, "setCancelsTouchesInView:", 0);
  objc_msgSend(v45, "setDelaysTouchesBegan:", 0);
  objc_msgSend(v45, "setDelaysTouchesEnded:", 0);
  objc_msgSend(v45, "setDelegate:", self);
  objc_msgSend(v39, "addGestureRecognizer:", v45);
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.1, 0.1, 0.1, 1.0);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3F08], "vibrantEffectWithCompositingMode:compositingColor:", 24, v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "setSeparatorEffect:", v47);

}

- (void)viewWillAppear:(BOOL)a3
{
  BSInvalidatable *v4;
  BSInvalidatable *isVisibleLibrarySearchPrewarmAssertion;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBHIconLibraryTableViewController;
  -[SBHTableViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  -[SBHIconLibraryTableViewController _setupObservedIcons](self, "_setupObservedIcons");
  -[SBHIconLibraryTableViewController acquireLibrarySearchPrewarmAssertionForReason:](self, "acquireLibrarySearchPrewarmAssertionForReason:", CFSTR("SBHIconLibraryTableViewController view will appear"));
  v4 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
  isVisibleLibrarySearchPrewarmAssertion = self->_isVisibleLibrarySearchPrewarmAssertion;
  self->_isVisibleLibrarySearchPrewarmAssertion = v4;

  objc_msgSend(MEMORY[0x1E0CD28B0], "setFrameStallSkipRequest:", 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHIconLibraryTableViewController;
  -[SBHIconLibraryTableViewController viewDidAppear:](&v5, sel_viewDidAppear_, a3);
  self->_hasAppeared = 1;
  -[SBHIconLibraryTableViewController observer](self, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryTableViewControllerDidAppear:", self);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  BSInvalidatable *isVisibleLibrarySearchPrewarmAssertion;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBHIconLibraryTableViewController;
  -[SBHTableViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[SBHIconLibraryTableViewController observer](self, "observer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "libraryTableViewControllerWillDisappear:", self);

  -[SBHIconLibraryTableViewController searchController](self, "searchController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchBar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endEditing:", 1);

  -[SBHIconLibraryTableViewController _teardownObservedIcons](self, "_teardownObservedIcons");
  -[BSInvalidatable invalidate](self->_isVisibleLibrarySearchPrewarmAssertion, "invalidate");
  isVisibleLibrarySearchPrewarmAssertion = self->_isVisibleLibrarySearchPrewarmAssertion;
  self->_isVisibleLibrarySearchPrewarmAssertion = 0;

}

- (void)viewDidDisappear:(BOOL)a3
{
  NSMapTable *dragSessionsForIconView;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHIconLibraryTableViewController;
  -[SBHIconLibraryTableViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  self->_hasAppeared = 0;
  dragSessionsForIconView = self->_dragSessionsForIconView;
  self->_dragSessionsForIconView = 0;

  -[SBHIconLibraryTableViewController _reloadAppIcons](self, "_reloadAppIcons");
}

- (void)_updateContentUnavailableConfigurationUsingState:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  if (-[SBHTableViewController showNoResultsView](self, "showNoResultsView"))
  {
    objc_msgSend(MEMORY[0x1E0DC3698], "searchConfiguration");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updatedConfigurationForState:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithUserInterfaceStyle:", 2);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "resolvedColorWithTraitCollection:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "imageProperties");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTintColor:", v8);

    objc_msgSend(v5, "textProperties");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setColor:", v8);

    objc_msgSend(v5, "secondaryTextProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setColor:", v8);

  }
  else
  {
    v5 = 0;
  }
  -[SBHIconLibraryTableViewController _setContentUnavailableConfiguration:](self, "_setContentUnavailableConfiguration:", v5);

}

- (id)_contentUnavailableConfigurationState
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SBHIconLibraryTableViewController;
  -[SBHIconLibraryTableViewController _contentUnavailableConfigurationState](&v7, sel__contentUnavailableConfigurationState);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryTableViewController _searchTextField](self, "_searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSearchControllerText:", v5);

  return v3;
}

- (double)headerTopOccludingInset
{
  void *v3;
  void *v4;
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
  void *v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v33;
  double MaxY;
  objc_super v36;
  CGRect v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;

  -[SBHIconLibraryTableViewController searchController](self, "searchController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchBar");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchTextField");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v36.receiver = self;
    v36.super_class = (Class)SBHIconLibraryTableViewController;
    -[SBHTableViewController headerTopOccludingInset](&v36, sel_headerTopOccludingInset);
    goto LABEL_5;
  }
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[SBHIconLibraryTableViewController view](self, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "superview");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "convertRect:toView:", v15, v7, v9, v11, v13);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  -[SBHIconLibraryTableViewController view](self, "view");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v41.origin.x = v25;
  v41.origin.y = v26;
  v41.size.width = v27;
  v41.size.height = v28;
  v37.origin.x = v17;
  v37.origin.y = v19;
  v37.size.width = v21;
  v37.size.height = v23;
  v38 = CGRectIntersection(v37, v41);
  x = v38.origin.x;
  y = v38.origin.y;
  width = v38.size.width;
  height = v38.size.height;

  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  v33 = 0.0;
  if (!CGRectIsNull(v39))
  {
    v40.origin.x = x;
    v40.origin.y = y;
    v40.size.width = width;
    v40.size.height = height;
    MaxY = CGRectGetMaxY(v40);
LABEL_5:
    v33 = MaxY;
  }

  return v33;
}

- (void)setIconModel:(id)a3
{
  id v5;

  v5 = a3;
  if ((objc_msgSend(v5, "isEqual:", self->_iconModel) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_iconModel, a3);
    -[SBHIconLibraryTableViewController _teardownObservedIcons](self, "_teardownObservedIcons");
    -[SBHIconLibraryTableViewController _teardownLibrary](self, "_teardownLibrary");
  }

}

- (void)_teardownLibrary
{
  SBHTableViewIconLibrary *library;
  NSCountedSet *libraryPrewarmAssertions;
  SBHIconLibraryQuery *currentQuery;

  -[SBHIconTableViewDiffableDataSource setIconLibrary:](self->_dataSource, "setIconLibrary:", 0);
  -[SBHTableViewIconLibrary removeObserver:](self->_library, "removeObserver:", self);
  library = self->_library;
  self->_library = 0;

  libraryPrewarmAssertions = self->_libraryPrewarmAssertions;
  self->_libraryPrewarmAssertions = 0;

  currentQuery = self->_currentQuery;
  self->_currentQuery = 0;

}

- (void)_setupLibrary
{
  SBHTableViewIconLibrary *v3;
  SBHTableViewIconLibrary *library;
  void *v5;
  SBHIconLibraryQuery *v6;
  SBHIconLibraryQuery *currentQuery;
  SBHIconLibrarySpotlightQueryEngine *v8;

  if (!self->_library)
  {
    if (self->_iconModel)
    {
      v8 = -[SBHIconLibraryAbstractQueryEngine initWithIconModel:]([SBHIconLibrarySpotlightQueryEngine alloc], "initWithIconModel:", self->_iconModel);
      v3 = -[SBHTableViewIconLibrary initWithIconModel:queryEngine:]([SBHTableViewIconLibrary alloc], "initWithIconModel:queryEngine:", self->_iconModel, v8);
      library = self->_library;
      self->_library = v3;

      -[SBHTableViewIconLibrary addObserver:](self->_library, "addObserver:", self);
      -[SBHTableViewIconLibrary lastQueryResults](self->_library, "lastQueryResults");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "query");
      v6 = (SBHIconLibraryQuery *)objc_claimAutoreleasedReturnValue();
      currentQuery = self->_currentQuery;
      self->_currentQuery = v6;

      -[SBHIconTableViewDiffableDataSource setIconLibrary:](self->_dataSource, "setIconLibrary:", self->_library);
    }
  }
}

- (void)setRootFolder:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if ((-[SBRootFolder isEqual:](self->_rootFolder, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_rootFolder, a3);
    objc_msgSend(v6, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconLibraryTableViewController setIconModel:](self, "setIconModel:", v5);

  }
}

- (void)setIconViewProvider:(id)a3
{
  id WeakRetained;
  void *v5;
  int v6;
  void *v7;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_iconViewProvider);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_iconViewProvider, obj);
    v6 = -[SBHIconLibraryTableViewController isViewLoaded](self, "isViewLoaded");
    v5 = obj;
    if (v6)
    {
      -[SBHIconLibraryTableViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "reloadData");

      v5 = obj;
    }
  }

}

- (void)setLibraryCategoryMap:(id)a3
{
  SBHLibraryCategoryMap *v4;
  SBHLibraryCategoryMap *libraryCategoryMap;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[SBHLibraryCategoryMap isEqualToCategoryMap:](self->_libraryCategoryMap, "isEqualToCategoryMap:"))
  {
    v4 = (SBHLibraryCategoryMap *)objc_msgSend(v7, "copy");
    libraryCategoryMap = self->_libraryCategoryMap;
    self->_libraryCategoryMap = v4;

    if (-[SBHIconLibraryTableViewController isViewLoaded](self, "isViewLoaded"))
    {
      -[SBHIconLibraryTableViewController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "reloadData");

    }
  }

}

- (UIView)headerBlurView
{
  void *v2;
  uint64_t v3;
  id v4;
  void *v5;
  id v6;
  void *v7;

  -[SBHIconLibraryTableViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_opt_class();
  v4 = v2;
  if (v3)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
  }
  else
  {
    v5 = 0;
  }
  v6 = v5;

  objc_msgSend(v6, "headerBlur");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v7;
}

id __47__SBHIconLibraryTableViewController_dataSource__block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  id WeakRetained;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;

  v7 = a3;
  v8 = a4;
  objc_msgSend(a2, "dequeueReusableCellWithIdentifier:", CFSTR("IconTableViewCell"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v11 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "focusGroupIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFocusGroupIdentifier:", v12);

    objc_msgSend(v11, "dataSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "queryResult");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "iconForItemIdentifier:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v11, "_configureCell:forIcon:", v9, v15);
      objc_msgSend(v11, "_handleAlphaFadeForCell:atIndexPath:", v9, v7);
    }
    else
    {
      SBLogIcon();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        __47__SBHIconLibraryTableViewController_dataSource__block_invoke_cold_1((uint64_t)v8, v16);

    }
  }

  return v9;
}

- (void)_iconModelWillReload:(id)a3
{
  void *v4;
  SBHIconTableViewDiffableDataSource *dataSource;
  _QWORD v6[5];

  +[SBHIconLibraryQueryResult nullQueryResults](SBHIconLibraryQueryResult, "nullQueryResults", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  dataSource = self->_dataSource;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __58__SBHIconLibraryTableViewController__iconModelWillReload___block_invoke;
  v6[3] = &unk_1E8D84C50;
  v6[4] = self;
  -[SBHIconTableViewDiffableDataSource applyQueryResult:animatingDifferences:completion:](dataSource, "applyQueryResult:animatingDifferences:completion:", v4, 0, v6);

}

uint64_t __58__SBHIconLibraryTableViewController__iconModelWillReload___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_reloadAppIcons");
}

- (void)_refreshIconIfVisible:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  if (v4)
  {
    v13 = v4;
    -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "indexPathForIcon:", v13);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      -[SBHIconLibraryTableViewController tableView](self, "tableView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "indexPathsForVisibleRows");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "containsObject:", v7);

      if (v10)
      {
        -[SBHIconLibraryTableViewController tableView](self, "tableView");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "cellForRowAtIndexPath:", v7);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        -[SBHIconLibraryTableViewController _configureCell:forIcon:](self, "_configureCell:forIcon:", v12, v13);
      }
    }

    v4 = v13;
  }

}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  id v5;

  -[SBHIconLibraryTableViewController _updateShowHeadersFromQueryResult:](self, "_updateShowHeadersFromQueryResult:", 0, a4);
  -[SBHIconLibraryTableViewController tableView](self, "tableView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reloadData");

}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings isEqual:](self->_legibilitySettings, "isEqual:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBHIconLibraryTableViewController _reloadVisibleCells](self, "_reloadVisibleCells");
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  -[SBHIconLibraryTableViewController _iconViewAtIndexPath:](self, "_iconViewAtIndexPath:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performTap");
  objc_msgSend(v8, "icon");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryTableViewController _logLaunchOfIcon:atIndexPath:](self, "_logLaunchOfIcon:atIndexPath:", v7, v6);

}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;

  if (self->_showHeaders)
  {
    v6 = a3;
    -[SBHIconLibraryTableViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("IconTableViewHeaderFooterView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setTitle:", v7);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "userInterfaceIdiom");

    v11 = 4.0;
    if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      v11 = 12.0;
    objc_msgSend(v8, "setTitleLayoutMargins:", v11, 0.0, 4.0, 0.0);

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v6 = a5;
  -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconAtIndexPath:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  -[SBHIconLibraryTableViewController _observeIcon:](self, "_observeIcon:", v9);
}

- (void)tableView:(id)a3 didEndDisplayingCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v6;

  objc_msgSend(a4, "icon", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryTableViewController _unobserveIcon:](self, "_unobserveIcon:", v6);

}

- (CGRect)tableView:(id)a3 frameForSectionIndexGivenProposedFrame:(CGRect)a4
{
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v8;
  double Height;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGRect v20;
  CGRect v21;
  CGRect result;

  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3;
  objc_msgSend(v8, "frame");
  Height = CGRectGetHeight(v20);
  objc_msgSend(v8, "adjustedContentInset");
  v11 = v10;

  -[SBHIconLibraryTableViewController layoutDelegate](self, "layoutDelegate");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fixedBottomLayoutInsetInWindowCoordinateSpaceForTableViewController:", self);
  v14 = v13;

  -[SBHTableViewController keyboardFrame](self, "keyboardFrame");
  v15 = CGRectGetHeight(v21) - v14;
  if (v15 < 0.0)
    v15 = 0.0;
  v16 = Height - v11 - v15;
  v17 = x;
  v18 = y;
  v19 = width;
  result.size.height = v16;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (BOOL)tableView:(id)a3 shouldDrawBottomSeparatorForSection:(int64_t)a4
{
  return objc_msgSend(a3, "numberOfSections") - 1 > a4;
}

- (BOOL)tableView:(id)a3 shouldHaveFullLengthBottomSeparatorForSection:(int64_t)a4
{
  return 0;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;

  -[SBHIconLibraryTableViewController dataSource](self, "dataSource", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "titleForSectionAtIndex:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tableView:(id)a3 contextMenuConfigurationForRowAtIndexPath:(id)a4 point:(CGPoint)a5
{
  return 0;
}

- (void)scrollViewDidScroll:(id)a3
{
  -[SBHScrollableIconViewInteraction clippingScrollViewDidScroll:](self->_scrollingInteraction, "clippingScrollViewDidScroll:", a3);
  -[SBHIconLibraryTableViewController _handleLowQualityAlphaFade](self, "_handleLowQualityAlphaFade");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  if (!-[SBHTableViewController showNoResultsView](self, "showNoResultsView", a3))
    -[SBHScrollableIconViewInteraction updateScrolling:](self->_scrollingInteraction, "updateScrolling:", 1);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[SBHScrollableIconViewInteraction updateScrolling:](self->_scrollingInteraction, "updateScrolling:", 0);
}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  -[SBHScrollableIconViewInteraction updateScrolling:](self->_scrollingInteraction, "updateScrolling:", 0);
}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  -[SBHScrollableIconViewInteraction updateScrolling:](self->_scrollingInteraction, "updateScrolling:", 0);
}

- (UIEdgeInsets)visibleContainerInsets
{
  void *v2;
  CGFloat Height;
  double v4;
  double v5;
  double v6;
  double v7;
  CGRect v8;
  UIEdgeInsets result;

  -[SBHIconLibraryTableViewController headerBlurView](self, "headerBlurView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "frame");
  Height = CGRectGetHeight(v8);

  v4 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  v7 = Height;
  result.right = v6;
  result.bottom = v5;
  result.left = v4;
  result.top = v7;
  return result;
}

- (void)_handleLowQualityAlphaFade
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  if (self->_needsLowQualityAlphaFade)
  {
    v11 = 0u;
    v12 = 0u;
    v9 = 0u;
    v10 = 0u;
    -[SBHIconLibraryTableViewController tableView](self, "tableView", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "indexPathsForVisibleRows");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v10;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v10 != v7)
            objc_enumerationMutation(v4);
          -[SBHIconLibraryTableViewController _handleAlphaFadeForCell:atIndexPath:](self, "_handleAlphaFadeForCell:atIndexPath:", 0, *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i));
        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      }
      while (v6);
    }

  }
}

- (void)_handleAlphaFadeForCell:(id)a3 atIndexPath:(id)a4
{
  unint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  unint64_t v22;

  v22 = (unint64_t)a3;
  v6 = (unint64_t)a4;
  if (v22 | v6)
  {
    if (self->_needsLowQualityAlphaFade && self->_hasAppeared)
    {
      -[SBHIconLibraryTableViewController tableView](self, "tableView");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v22;
      if (!v22)
      {
        objc_msgSend(v7, "cellForRowAtIndexPath:", v6);
        v8 = objc_claimAutoreleasedReturnValue();
      }
      v22 = v8;
      objc_msgSend(v7, "rectForRowAtIndexPath:", v6);
      objc_msgSend((id)v22, "iconView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "frame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v7, "superview");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend((id)v22, "convertRect:toView:", v18, v11, v13, v15, v17);
      v20 = v19;

      objc_msgSend(v7, "rowHeight");
      objc_msgSend((id)v22, "setAlpha:", fmin(fmax(v20 / (v21 + v21) * 0.75 / 0.66 + 0.25, 0.25), 1.0));

    }
  }
  else
  {
    v22 = 0;
  }

}

- (BOOL)gestureRecognizerShouldBegin:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;

  v4 = a3;
  -[SBHIconLibraryTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locationInView:", v5);
  v7 = v6;
  v9 = v8;

  objc_msgSend(v5, "indexPathForRowAtPoint:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v4) = v10 == 0;

  return (char)v4;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4;

  -[SBHIconLibraryTableViewController _queryForCurrentSearchTextField](self, "_queryForCurrentSearchTextField", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryTableViewController _executeQuery:](self, "_executeQuery:", v4);

}

- (BOOL)searchControllerShouldReturn:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[SBHIconLibraryTableViewController currentQuery](self, "currentQuery", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "searchString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "length");

  if (v6)
  {
    -[SBHIconLibraryTableViewController _indexPathForDefaultSearchResult](self, "_indexPathForDefaultSearchResult");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "markedTextRange");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v6) = v8 == 0;

    if (v7 && !v8)
    {
      -[SBHIconLibraryTableViewController tableView](self, "tableView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHIconLibraryTableViewController tableView:didSelectRowAtIndexPath:](self, "tableView:didSelectRowAtIndexPath:", v6, v7);

      LOBYTE(v6) = 1;
    }

  }
  return (char)v6;
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  return objc_msgSend(a3, "isEqualToString:", CFSTR("SBIconLocationAppLibrarySearch"));
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationAppLibrarySearch"))
    && -[SBHIconLibraryTableViewController _isViewControllerVisible](self, "_isViewControllerVisible"))
  {
    -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "queryResult");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "indexPathForIcon:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 && -[SBHIconLibraryTableViewController _isIndexPathVisible:](self, "_isIndexPathVisible:", v9))
    {
      -[SBHIconLibraryTableViewController _iconViewAtIndexPath:](self, "_iconViewAtIndexPath:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)firstIconViewForIcon:(id)a3 inLocations:(id)a4
{
  id v6;
  void *v7;

  v6 = a3;
  if (objc_msgSend(a4, "containsObject:", CFSTR("SBIconLocationAppLibrarySearch"))
    && -[SBHIconLibraryTableViewController _isViewControllerVisible](self, "_isViewControllerVisible"))
  {
    -[SBHIconLibraryTableViewController firstIconViewForIcon:](self, "firstIconViewForIcon:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)firstIconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[SBHIconLibraryTableViewController _isViewControllerVisible](self, "_isViewControllerVisible"))
  {
    -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathForIcon:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[SBHIconLibraryTableViewController _isIndexPathVisible:](self, "_isIndexPathVisible:", v7))
    {
      -[SBHIconLibraryTableViewController _iconViewAtIndexPath:](self, "_iconViewAtIndexPath:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
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
        if (-[SBHIconLibraryTableViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
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
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;

  v4 = a3;
  if (-[SBHIconLibraryTableViewController _isViewControllerVisible](self, "_isViewControllerVisible"))
  {
    -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryResult");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "icon");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathForIcon:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      v9 = -[SBHIconLibraryTableViewController _isIndexPathVisible:](self, "_isIndexPathVisible:", v8);
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  BOOL v7;

  v6 = a3;
  if (objc_msgSend(a4, "isEqualToString:", CFSTR("SBIconLocationAppLibrarySearch")))
    v7 = -[SBHIconLibraryTableViewController isDisplayingIconView:](self, "isDisplayingIconView:", v6);
  else
    v7 = 0;

  return v7;
}

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void (**v11)(id, void *);

  v11 = (void (**)(id, void *))a4;
  v6 = a3;
  -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "queryResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexPathForIcon:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 && -[SBHIconLibraryTableViewController _isIndexPathVisible:](self, "_isIndexPathVisible:", v9))
  {
    -[SBHIconLibraryTableViewController _iconViewAtIndexPath:](self, "_iconViewAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11[2](v11, v10);

  }
}

void __75__SBHIconLibraryTableViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  id v12;
  uint64_t v13;

  objc_msgSend(*(id *)(a1 + 32), "iconsForSectionAtIndex:", a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__SBHIconLibraryTableViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke_2;
  v9[3] = &unk_1E8D88D98;
  v6 = *(id *)(a1 + 40);
  v7 = *(_QWORD *)(a1 + 48);
  v8 = *(void **)(a1 + 56);
  v10 = v6;
  v11 = v7;
  v12 = v8;
  v13 = a3;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

}

void __75__SBHIconLibraryTableViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v3))
  {
    objc_msgSend(*(id *)(a1 + 40), "_iconViewForIcon:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  }
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
  -[SBHIconLibraryTableViewController presentedIconLocations](self, "presentedIconLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "minusSet:", v6);
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryTableViewController firstIconViewForIcon:inLocations:](self, "firstIconViewForIcon:inLocations:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (void)iconViewWillBeginDrag:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  -[NSHashTable addObject:](self->_grabbedIconViews, "addObject:", v13);
  objc_msgSend(v13, "icon");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForIcon:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconLibraryTableViewController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cellForRowAtIndexPath:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "iconView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqual:", v13);

  if (v11)
  {
    -[SBHIconLibraryTableViewController view](self, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v13);

    objc_msgSend(v13, "setCenter:", 10000.0, 10000.0);
    objc_msgSend(v9, "setIconView:", 0);
    -[SBHIconLibraryTableViewController _configureCell:forIcon:](self, "_configureCell:forIcon:", v9, v4);
  }

}

- (void)iconViewDidEndDrag:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[NSHashTable removeObject:](self->_grabbedIconViews, "removeObject:", v6);
  objc_msgSend(v6, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryTableViewController view](self, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 == v5)
    objc_msgSend(v6, "removeFromSuperview");

}

- (BOOL)_observeIcon:(id)a3
{
  id v4;
  NSHashTable *observedIcons;
  NSHashTable *v6;
  NSHashTable *v7;
  BOOL v8;

  v4 = a3;
  if (!v4)
    goto LABEL_7;
  observedIcons = self->_observedIcons;
  if (!observedIcons)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_observedIcons;
    self->_observedIcons = v6;

    observedIcons = self->_observedIcons;
  }
  if (!-[NSHashTable containsObject:](observedIcons, "containsObject:", v4)
    && -[SBHIconLibraryTableViewController _startObservingIcon:](self, "_startObservingIcon:", v4))
  {
    -[NSHashTable addObject:](self->_observedIcons, "addObject:", v4);
    v8 = 1;
  }
  else
  {
LABEL_7:
    v8 = 0;
  }

  return v8;
}

- (void)_unobserveIcon:(id)a3
{
  NSHashTable *observedIcons;
  id v5;

  if (a3)
  {
    observedIcons = self->_observedIcons;
    v5 = a3;
    -[NSHashTable removeObject:](observedIcons, "removeObject:", v5);
    -[SBHIconLibraryTableViewController _stopObservingIcon:](self, "_stopObservingIcon:", v5);

  }
}

- (BOOL)_startObservingIcon:(id)a3
{
  id v4;
  int v5;

  v4 = a3;
  v5 = -[SBHIconLibraryTableViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared");
  if (v5)
    objc_msgSend(v4, "addObserver:", self);

  return v5;
}

- (void)_stopObservingIcon:(id)a3
{
  objc_msgSend(a3, "removeObserver:", self);
}

- (void)_teardownObservedIcons
{
  NSHashTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSHashTable *observedIcons;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_observedIcons;
  v4 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        -[SBHIconLibraryTableViewController _stopObservingIcon:](self, "_stopObservingIcon:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v7++), (_QWORD)v9);
      }
      while (v5 != v7);
      v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  observedIcons = self->_observedIcons;
  self->_observedIcons = 0;

}

- (void)_setupObservedIcons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _QWORD v18[4];
  id v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queryResult");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHIconLibraryTableViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "indexPathsForVisibleRows");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = MEMORY[0x1E0C809B0];
  v18[1] = 3221225472;
  v18[2] = __56__SBHIconLibraryTableViewController__setupObservedIcons__block_invoke;
  v18[3] = &unk_1E8D88D48;
  v7 = v4;
  v19 = v7;
  objc_msgSend(v6, "bs_mapNoNulls:", v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = v8;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[SBHIconLibraryTableViewController _observeIcon:](self, "_observeIcon:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v13++), (_QWORD)v14);
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v11);
  }

}

uint64_t __56__SBHIconLibraryTableViewController__setupObservedIcons__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "iconAtIndexPath:", a2);
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  id v7;
  void *v8;
  void *v9;

  v7 = a4;
  -[SBHIconLibraryTableViewController _iconViewAtIndexPath:](self, "_iconViewAtIndexPath:", a5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHIconLibraryTableViewController _processDragItemsForIconView:session:](self, "_processDragItemsForIconView:session:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBHIconLibraryTableViewController _iconViewForDragSession:](self, "_iconViewForDragSession:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragSessionWillBegin:", v5);

}

- (void)tableView:(id)a3 dragSessionDidEnd:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[SBHIconLibraryTableViewController _iconViewForDragSession:](self, "_iconViewForDragSession:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dragSession:willEndWithOperation:", v5, 2);
  objc_msgSend(v6, "dragSession:didEndWithOperation:", v5, 2);
  -[SBHIconLibraryTableViewController _resetDragSession:](self, "_resetDragSession:", v5);

}

- (id)tableView:(id)a3 dragPreviewParametersForRowAtIndexPath:(id)a4
{
  id v4;
  void *v5;

  v4 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v5);

  return v4;
}

- (BOOL)tableView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  return 0;
}

- (id)_processDragItemsForIconView:(id)a3 session:(id)a4
{
  id v6;
  id v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "canBeginDrags"))
  {
    -[SBHIconLibraryTableViewController _mapIconView:forDragSession:](self, "_mapIconView:forDragSession:", v6, v7);
    objc_initWeak(&location, v7);
    objc_msgSend(v6, "dragItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __74__SBHIconLibraryTableViewController__processDragItemsForIconView_session___block_invoke;
    v10[3] = &unk_1E8D88E10;
    objc_copyWeak(&v12, &location);
    v11 = v6;
    objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v8 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v8;
}

void __74__SBHIconLibraryTableViewController__processDragItemsForIconView_session___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[4];
  id v5;
  id v6;
  id v7;
  id location;

  v3 = a2;
  objc_initWeak(&location, v3);
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __74__SBHIconLibraryTableViewController__processDragItemsForIconView_session___block_invoke_2;
  v4[3] = &unk_1E8D88DE8;
  objc_copyWeak(&v6, &location);
  objc_copyWeak(&v7, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  objc_msgSend(v3, "setPreviewProvider:", v4);

  objc_destroyWeak(&v7);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

id __74__SBHIconLibraryTableViewController__processDragItemsForIconView_session___block_invoke_2(id *a1)
{
  id WeakRetained;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  WeakRetained = objc_loadWeakRetained(a1 + 5);
  v3 = objc_loadWeakRetained(a1 + 6);
  objc_msgSend(a1[4], "dragPreviewForItem:session:", WeakRetained, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parameters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(a1[4], "isDragging") && (objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v6, "setDragState:", 2);
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3760]), "initWithView:parameters:", v6, v5);

  return v7;
}

- (id)_iconViewForDragSession:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  id v11;
  id v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  -[NSMapTable keyEnumerator](self->_dragSessionsForIconView, "keyEnumerator", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_dragSessionsForIconView, "objectForKey:", v10);
        v11 = (id)objc_claimAutoreleasedReturnValue();
        if (v11 == v4)
        {
          v12 = v10;

          goto LABEL_11;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (id)_dragSessionForIconView:(id)a3
{
  return -[NSMapTable objectForKey:](self->_dragSessionsForIconView, "objectForKey:", a3);
}

- (void)_mapIconView:(id)a3 forDragSession:(id)a4
{
  id v6;
  NSMapTable *dragSessionsForIconView;
  NSMapTable *v8;
  NSMapTable *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  dragSessionsForIconView = self->_dragSessionsForIconView;
  if (!dragSessionsForIconView)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
    v8 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_dragSessionsForIconView;
    self->_dragSessionsForIconView = v8;

    dragSessionsForIconView = self->_dragSessionsForIconView;
  }
  -[NSMapTable setObject:forKey:](dragSessionsForIconView, "setObject:forKey:", v6, v10);

}

- (void)_resetDragSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  NSMapTable *dragSessionsForIconView;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)-[NSMapTable copy](self->_dragSessionsForIconView, "copy", 0);
  objc_msgSend(v5, "keyEnumerator");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_dragSessionsForIconView, "objectForKey:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();

        if (v12 == v4)
          -[NSMapTable removeObjectForKey:](self->_dragSessionsForIconView, "removeObjectForKey:", v11);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  if (!-[NSMapTable count](self->_dragSessionsForIconView, "count"))
  {
    dragSessionsForIconView = self->_dragSessionsForIconView;
    self->_dragSessionsForIconView = 0;

  }
}

- (id)_iconFilter
{
  return &__block_literal_global_33;
}

uint64_t __48__SBHIconLibraryTableViewController__iconFilter__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isLeafIcon"))
    v3 = objc_msgSend(v2, "isWidgetIcon") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (BOOL)_executeQuery:(id)a3
{
  id v5;
  int v6;
  BOOL v7;
  void *v8;
  int v9;
  char v10;
  BOOL v11;
  void *v12;

  v5 = a3;
  if ((BSEqualObjects() & 1) != 0
    || ((v6 = -[SBHIconLibraryTableViewController _appearState](self, "_appearState"),
         v7 = -[SBHIconLibraryTableViewController disablesNullQueryExecution](self, "disablesNullQueryExecution"),
         -[SBHIconLibraryTableViewController _nullQuery](self, "_nullQuery"),
         v8 = (void *)objc_claimAutoreleasedReturnValue(),
         v9 = objc_msgSend(v5, "isEqual:", v8),
         v8,
         !v6)
      ? (v10 = 1)
      : (v10 = v7),
        v9 && (v10 & 1) != 0))
  {
    v11 = 0;
  }
  else
  {
    objc_storeStrong((id *)&self->_currentQuery, a3);
    -[SBHIconLibraryTableViewController library](self, "library");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "executeQuery:", self->_currentQuery);

    -[SBHIconLibraryTableViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
    -[SBHIconLibraryTableViewController _updateShowHeadersFromQueryResult:](self, "_updateShowHeadersFromQueryResult:", 0);
    v11 = 1;
  }

  return v11;
}

- (void)_reloadAppIcons
{
  SBHIconLibraryQuery *v3;
  SBHIconLibraryQuery *v4;

  if (self->_library)
  {
    v3 = self->_currentQuery;
    if (!v3)
    {
      -[SBHIconLibraryTableViewController _nullQuery](self, "_nullQuery");
      v3 = (SBHIconLibraryQuery *)objc_claimAutoreleasedReturnValue();
    }
    v4 = v3;
    -[SBHIconLibraryTableViewController _executeQuery:](self, "_executeQuery:", v3);

  }
}

- (void)iconLibrary:(id)a3 hasUpdatedQueryResult:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[5];

  v5 = a4;
  objc_msgSend(v5, "query");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)&self->_currentQuery, v6);
  -[SBHIconLibraryTableViewController _updateShowHeadersFromQueryResult:](self, "_updateShowHeadersFromQueryResult:", v5);
  -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __71__SBHIconLibraryTableViewController_iconLibrary_hasUpdatedQueryResult___block_invoke;
  v14[3] = &unk_1E8D84C50;
  v14[4] = self;
  objc_msgSend(v7, "applyQueryResult:animatingDifferences:completion:", v5, 0, v14);

  v8 = -[SBHIconLibraryTableViewController _shouldShowNoResultsViewForQueryResult:](self, "_shouldShowNoResultsViewForQueryResult:", v5);
  -[SBHTableViewController setShowNoResultsView:](self, "setShowNoResultsView:", v8);
  -[SBHIconLibraryTableViewController _setNeedsUpdateContentUnavailableConfiguration](self, "_setNeedsUpdateContentUnavailableConfiguration");
  objc_msgSend(v6, "searchString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  -[SBHIconLibraryTableViewController _searchTextField](self, "_searchTextField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v8 || !v10 || objc_msgSend(v11, "hasMarkedText"))
    v13 = 6;
  else
    v13 = 1;
  objc_msgSend(v12, "setReturnKeyType:", v13);

}

void __71__SBHIconLibraryTableViewController_iconLibrary_hasUpdatedQueryResult___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "tableView");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "reloadSectionIndexTitles");

}

- (void)_updateShowHeadersFromQueryResult:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  unint64_t v10;
  id v11;
  id v12;

  v4 = a3;
  if (!v4)
  {
    -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "queryResult");
    v11 = (id)objc_claimAutoreleasedReturnValue();

    v4 = v11;
  }
  v12 = v4;
  objc_msgSend(v4, "query");
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6
    && (v7 = (void *)v6,
        objc_msgSend(v12, "query"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = SBLibraryUseSectionsForQuery(v8),
        v8,
        v7,
        !v9))
  {
    self->_showHeaders = 0;
  }
  else
  {
    v10 = -[SBHAppLibrarySettings minimumNumberOfIconsToShowSectionHeaderInDeweySearch](self->_settings, "minimumNumberOfIconsToShowSectionHeaderInDeweySearch");
    self->_showHeaders = objc_msgSend(v12, "totalNumberOfItems") > v10;
  }
  -[SBHIconLibraryTableViewController _updateSectionHeaderHeight](self, "_updateSectionHeaderHeight");

}

- (void)_updateSectionHeaderHeight
{
  void *v3;
  double v4;
  id v5;

  -[SBHIconLibraryTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  v4 = *MEMORY[0x1E0DC53D8];
  if (!self->_showHeaders)
    v4 = 0.0;
  objc_msgSend(v3, "setSectionHeaderHeight:", v4);

}

- (void)_reloadVisibleCells
{
  void *v3;
  id v4;

  if (-[SBHIconLibraryTableViewController _isViewControllerVisible](self, "_isViewControllerVisible"))
  {
    -[SBHIconLibraryTableViewController _visibleIndexPaths](self, "_visibleIndexPaths");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "allObjects");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconLibraryTableViewController _reloadRowsAtIndexPaths:](self, "_reloadRowsAtIndexPaths:", v3);

  }
}

- (void)_reloadRowsAtIndexPaths:(id)a3
{
  SBHIconTableViewDiffableDataSource *dataSource;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[5];

  dataSource = self->_dataSource;
  v5 = a3;
  -[SBHIconTableViewDiffableDataSource queryResult](dataSource, "queryResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "snapshot");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __61__SBHIconLibraryTableViewController__reloadRowsAtIndexPaths___block_invoke;
  v9[3] = &unk_1E8D88D48;
  v9[4] = self;
  objc_msgSend(v5, "bs_map:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "reloadItemsWithIdentifiers:", v7);
}

uint64_t __61__SBHIconLibraryTableViewController__reloadRowsAtIndexPaths___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "itemIdentifierForIndexPath:", a2);
}

id __50__SBHIconLibraryTableViewController__visibleIcons__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v2, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queryResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconAtIndexPath:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)_isIndexPathVisible:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBHIconLibraryTableViewController _visibleIndexPaths](self, "_visibleIndexPaths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "containsObject:", v4);

  return v6;
}

- (void)_configureCell:(id)a3 forIcon:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  _BOOL4 v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a3;
  v6 = a4;
  -[SBHIconLibraryTableViewController listLayoutProvider](self, "listLayoutProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[SBHIconLibraryTableViewController iconViewProvider](self, "iconViewProvider");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iconView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "iconView");
    v10 = objc_claimAutoreleasedReturnValue();
    if (!v10
      || (v11 = (void *)v10,
          v12 = -[NSHashTable containsObject:](self->_grabbedIconViews, "containsObject:", v9),
          v11,
          v12))
    {
      -[SBHIconLibraryTableViewController _createIconView](self, "_createIconView");
      v13 = objc_claimAutoreleasedReturnValue();

      v9 = (void *)v13;
    }
    objc_msgSend(v8, "configureIconView:forIcon:", v9, v6);
    objc_msgSend(v9, "setLabelHidden:", 1);
    objc_msgSend(v9, "setAllowsLabelArea:", 0);
    objc_msgSend(v9, "setAllowsCloseBox:", 0);
    objc_msgSend(v9, "setAllowsAccessoryView:", 0);
    -[SBHIconLibraryTableViewController iconImageCache](self, "iconImageCache");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setIconImageCache:", v14);

    objc_msgSend(v9, "setListLayoutProvider:", v7);
    objc_msgSend(v9, "setLocation:", CFSTR("SBIconLocationAppLibrarySearch"));
    objc_msgSend(v9, "addObserver:", self);
    objc_msgSend(v9, "setImageLoadingBehavior:", 1);
    objc_msgSend(v9, "setIcon:", v6);
    objc_msgSend(v16, "setIconView:", v9);
    objc_msgSend(v16, "configureCellForIcon:", v6);
    -[SBHIconLibraryTableViewController legibilitySettings](self, "legibilitySettings");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setLegibilitySettings:", v15);

  }
}

- (BOOL)_shouldShowNoResultsViewForQueryResult:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  if ((-[SBHIconLibraryTableViewController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared") & 1) == 0)
  {
    if ((objc_msgSend(v4, "isNullQueryResult") & 1) != 0)
    {
      LOBYTE(v5) = 1;
      goto LABEL_8;
    }
    objc_msgSend(v4, "query");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
      goto LABEL_8;
    objc_msgSend(v4, "query");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "searchString");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(v4, "snapshot");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      LOBYTE(v5) = objc_msgSend(v9, "numberOfItems") < 1;

      goto LABEL_8;
    }
  }
  LOBYTE(v5) = 0;
LABEL_8:

  return (char)v5;
}

- (void)_logLaunchOfIcon:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  ATXAppDirectoryClient *v8;
  ATXAppDirectoryClient *appDirectoryClient;
  uint64_t (**v10)(_QWORD, _QWORD);
  char v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  ATXAppDirectoryClient *v18;
  void *v19;
  void *v20;
  NSObject *v21;

  v6 = a3;
  v7 = a4;
  -[SBHIconLibraryTableViewController _notifyDelegatesOfAppLaunchFromSearchController:](self, "_notifyDelegatesOfAppLaunchFromSearchController:", v6);
  if (!self->_appDirectoryClient)
  {
    objc_msgSend(MEMORY[0x1E0CF8CA0], "sharedInstance");
    v8 = (ATXAppDirectoryClient *)objc_claimAutoreleasedReturnValue();
    appDirectoryClient = self->_appDirectoryClient;
    self->_appDirectoryClient = v8;

  }
  -[SBHIconLibraryTableViewController _iconFilter](self, "_iconFilter");
  v10 = (uint64_t (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v11 = ((uint64_t (**)(_QWORD, id))v10)[2](v10, v6);

  if ((v11 & 1) != 0)
  {
    objc_msgSend(v6, "leafIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconLibraryTableViewController currentQuery](self, "currentQuery");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v7, "indexAtPosition:", 0);
    -[SBHIconLibraryTableViewController libraryCategoryMap](self, "libraryCategoryMap");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "metadata");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectForKey:", CFSTR("response"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = self->_appDirectoryClient;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "searchString");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[ATXAppDirectoryClient logLaunchFromSearchWithDate:bundleID:bundleIndex:searchQueryLength:searchTab:appDirectoryResponse:](v18, "logLaunchFromSearchWithDate:bundleID:bundleIndex:searchQueryLength:searchTab:appDirectoryResponse:", v19, v12, v14, objc_msgSend(v20, "length"), 0, v17);

  }
  else
  {
    SBLogIcon();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      -[SBHIconLibraryTableViewController _logLaunchOfIcon:atIndexPath:].cold.1(v21);

  }
}

- (void)_handleDidTapEmptyResultsArea:(id)a3
{
  id v3;

  -[SBHIconLibraryTableViewController searchController](self, "searchController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setActive:", 0);

}

- (void)_notifyDelegatesOfAppLaunchFromSearchController:(id)a3
{
  SBHIconLibraryTableViewControllerObserver **p_observer;
  id v4;
  id WeakRetained;

  p_observer = &self->_observer;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_observer);
  objc_msgSend(WeakRetained, "libraryTableViewControllerDidLaunchIcon:", v4);

}

- (id)_indexPathForDefaultSearchResult
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHIconLibraryTableViewController tableView](self, "tableView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "indexPathsForVisibleRows");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_searchTextField
{
  void *v2;
  void *v3;
  void *v4;

  -[SBHIconLibraryTableViewController searchController](self, "searchController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchBar");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "searchTextField");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_queryForCurrentSearchTextField
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __CFString *v19;
  void *v20;
  SBHIconLibraryQuery *v21;
  void *v22;
  void *v23;
  __CFString *v25;
  void *v26;
  _QWORD v27[4];

  v27[3] = *MEMORY[0x1E0C80C00];
  -[SBHIconLibraryTableViewController _searchTextField](self, "_searchTextField");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markedTextRange");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(v2, "textInRange:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v2, "beginningOfDocument");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "endOfDocument");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "start");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "textRangeFromPosition:toPosition:", v6, v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v2, "textInRange:", v8);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = (void *)v9;
      v11 = &stru_1E8D8E958;
      if (v9)
        v12 = (__CFString *)v9;
      else
        v12 = &stru_1E8D8E958;
      v25 = v12;

      objc_msgSend(v4, "end");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "positionFromPosition:offset:", v13, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v14)
      {
        objc_msgSend(v2, "textRangeFromPosition:toPosition:", v14, v26);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "textInRange:", v15);
        v16 = objc_claimAutoreleasedReturnValue();
        v17 = v6;
        v18 = (void *)v16;
        if (v16)
          v19 = (__CFString *)v16;
        else
          v19 = &stru_1E8D8E958;
        v11 = v19;

        v6 = v17;
      }
      v27[0] = v25;
      v27[1] = v5;
      v27[2] = v11;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 3);
      v20 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v20 = 0;
    }
    v21 = -[SBHIconLibraryQuery initWithMarkedTextSearchString:markedTextRange:markedTextArray:]([SBHIconLibraryQuery alloc], "initWithMarkedTextSearchString:markedTextRange:markedTextArray:", v3, v4, v20);

  }
  else
  {
    v21 = -[SBHIconLibraryQuery initWithSearchString:]([SBHIconLibraryQuery alloc], "initWithSearchString:", v3);
  }
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v2, "textInputMode");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "primaryLanguage");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHIconLibraryQuery setKeyboardLanguageHint:](v21, "setKeyboardLanguageHint:", v23);

  }
  return v21;
}

- (id)_nullQuery
{
  return -[SBHIconLibraryQuery initWithSearchString:]([SBHIconLibraryQuery alloc], "initWithSearchString:", &stru_1E8D8E958);
}

- (id)_iconViewForIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  -[SBHIconLibraryTableViewController dataSource](self, "dataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queryResult");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexPathForIcon:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    -[SBHIconLibraryTableViewController _iconViewAtIndexPath:](self, "_iconViewAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_iconViewAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (-[SBHIconLibraryTableViewController _isIndexPathVisible:](self, "_isIndexPathVisible:", v4))
  {
    -[SBHIconLibraryTableViewController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cellForRowAtIndexPath:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "iconView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)_createIconView
{
  return -[SBIconView initWithConfigurationOptions:listLayoutProvider:]([SBIconView alloc], "initWithConfigurationOptions:listLayoutProvider:", 2, self->_listLayoutProvider);
}

- (void)_invalidatePrewarmAssertion:(id)a3
{
  -[NSCountedSet removeObject:](self->_libraryPrewarmAssertions, "removeObject:", a3);
  if (!-[NSCountedSet count](self->_libraryPrewarmAssertions, "count"))
    -[SBHIconLibraryTableViewController _teardownLibrary](self, "_teardownLibrary");
}

- (id)acquireLibrarySearchPrewarmAssertionForReason:(id)a3
{
  id v4;
  NSCountedSet *v5;
  NSCountedSet *libraryPrewarmAssertions;
  _SBHIconLibraryPrewarmAssertion *v7;

  v4 = a3;
  if (!self->_libraryPrewarmAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3550], "set");
    v5 = (NSCountedSet *)objc_claimAutoreleasedReturnValue();
    libraryPrewarmAssertions = self->_libraryPrewarmAssertions;
    self->_libraryPrewarmAssertions = v5;

  }
  v7 = -[_SBHIconLibraryPrewarmAssertion initWithReason:iconLibraryTableViewController:]([_SBHIconLibraryPrewarmAssertion alloc], "initWithReason:iconLibraryTableViewController:", v4, self);
  -[NSCountedSet addObject:](self->_libraryPrewarmAssertions, "addObject:", v7);
  -[SBHIconLibraryTableViewController _setupLibrary](self, "_setupLibrary");

  return v7;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (SBHIconImageCache)iconImageCache
{
  return self->_iconImageCache;
}

- (void)setIconImageCache:(id)a3
{
  objc_storeStrong((id *)&self->_iconImageCache, a3);
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (void)setListLayoutProvider:(id)a3
{
  objc_storeStrong((id *)&self->_listLayoutProvider, a3);
}

- (SBHLibrarySearchController)searchController
{
  return (SBHLibrarySearchController *)objc_loadWeakRetained((id *)&self->_searchController);
}

- (void)setSearchController:(id)a3
{
  objc_storeWeak((id *)&self->_searchController, a3);
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (SBHIconLibraryTableViewControllerObserver)observer
{
  return (SBHIconLibraryTableViewControllerObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (SBHIconLibraryTableViewControllerLayoutDelegate)layoutDelegate
{
  return (SBHIconLibraryTableViewControllerLayoutDelegate *)objc_loadWeakRetained((id *)&self->_layoutDelegate);
}

- (void)setLayoutDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_layoutDelegate, a3);
}

- (SBHIconModel)iconModel
{
  return self->_iconModel;
}

- (SBRootFolder)rootFolder
{
  return self->_rootFolder;
}

- (SBHLibraryCategoryMap)libraryCategoryMap
{
  return self->_libraryCategoryMap;
}

- (void)setHeaderBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_headerBlurView, a3);
}

- (BOOL)disablesNullQueryExecution
{
  return self->_disablesNullQueryExecution;
}

- (void)setDisablesNullQueryExecution:(BOOL)a3
{
  self->_disablesNullQueryExecution = a3;
}

- (SBHTableViewIconLibrary)library
{
  return self->_library;
}

- (SBHIconLibraryQuery)currentQuery
{
  return self->_currentQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_currentQuery, 0);
  objc_storeStrong((id *)&self->_library, 0);
  objc_storeStrong((id *)&self->_headerBlurView, 0);
  objc_storeStrong((id *)&self->_libraryCategoryMap, 0);
  objc_storeStrong((id *)&self->_rootFolder, 0);
  objc_storeStrong((id *)&self->_iconModel, 0);
  objc_destroyWeak((id *)&self->_layoutDelegate);
  objc_destroyWeak((id *)&self->_observer);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_destroyWeak((id *)&self->_searchController);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_iconImageCache, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_libraryPrewarmAssertions, 0);
  objc_storeStrong((id *)&self->_isVisibleLibrarySearchPrewarmAssertion, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_dragSessionsForIconView, 0);
  objc_storeStrong((id *)&self->_observedIcons, 0);
  objc_storeStrong((id *)&self->_grabbedIconViews, 0);
  objc_storeStrong((id *)&self->_scrollingInteraction, 0);
  objc_storeStrong((id *)&self->_appDirectoryClient, 0);
}

void __47__SBHIconLibraryTableViewController_dataSource__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_1CFEF3000, a2, OS_LOG_TYPE_ERROR, "no icon for identifier: %@", (uint8_t *)&v2, 0xCu);
}

- (void)_logLaunchOfIcon:(os_log_t)log atIndexPath:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CFEF3000, log, OS_LOG_TYPE_ERROR, "Encountered unsupported icon for app search. Undefined how to log this.", v1, 2u);
}

@end
