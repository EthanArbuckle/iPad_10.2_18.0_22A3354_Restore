@implementation SBHTodayViewController

- (SBHTodayViewController)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 legacyWidgetListViewController:(id)a5 location:(int64_t)a6
{
  return -[SBHTodayViewController initWithListLayoutProvider:iconViewProvider:location:](self, "initWithListLayoutProvider:iconViewProvider:location:", a3, a4, a6);
}

- (SBHTodayViewController)initWithListLayoutProvider:(id)a3 iconViewProvider:(id)a4 location:(int64_t)a5
{
  id v9;
  id v10;
  SBHTodayViewController *v11;
  SBHTodayViewController *v12;
  void *v13;
  uint64_t v14;
  SBHWidgetSettings *widgetSettings;
  void *v16;
  uint64_t v17;
  SBHScrollableZoomingIconViewInteraction *v18;
  SBHScrollableIconViewInteraction *scrollingInteraction;
  void *v20;
  void *v21;
  SBHSidebarVisualConfiguration *v22;
  SBHSidebarVisualConfiguration *v23;
  double v24;
  double v25;
  double v26;
  uint64_t v27;
  NSHashTable *iconViewsForbiddenFromEditing;
  objc_super v30;

  v9 = a3;
  v10 = a4;
  v30.receiver = self;
  v30.super_class = (Class)SBHTodayViewController;
  v11 = -[SBHTodayViewController init](&v30, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_listLayoutProvider, a3);
    objc_storeWeak((id *)&v12->_iconViewProvider, v10);
    v12->_location = a5;
    objc_storeStrong((id *)&v12->_iconLocation, CFSTR("SBIconLocationTodayView"));
    v12->_contentVisibility = 0;
    +[SBHHomeScreenDomain rootSettings](SBHHomeScreenDomain, "rootSettings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "widgetSettings");
    v14 = objc_claimAutoreleasedReturnValue();
    widgetSettings = v12->_widgetSettings;
    v12->_widgetSettings = (SBHWidgetSettings *)v14;

    -[PTSettings addKeyObserver:](v12->_widgetSettings, "addKeyObserver:", v12);
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v16, "userInterfaceIdiom");

    if ((v17 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      v18 = -[SBHScrollableIconViewInteraction initWithContainer:]([SBHScrollableZoomingIconViewInteraction alloc], "initWithContainer:", v12);
      scrollingInteraction = v12->_scrollingInteraction;
      v12->_scrollingInteraction = &v18->super;

    }
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObserver:selector:name:object:", v12, sel_iconViewWillPresentContextMenu_, CFSTR("SBIconViewWillPresentContextMenuNotification"), 0);
    objc_msgSend(v20, "addObserver:selector:name:object:", v12, sel_iconViewWillDismissContextMenu_, CFSTR("SBIconViewWillDismissContextMenuNotification"), 0);
    objc_msgSend(v9, "layoutForIconLocation:", CFSTR("SBIconLocationRoot"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v21, "sidebarVisualConfiguration");
      v22 = (SBHSidebarVisualConfiguration *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v22 = objc_alloc_init(SBHSidebarVisualConfiguration);
    }
    v23 = v22;
    -[SBHSidebarVisualConfiguration searchBarTopOffset](v22, "searchBarTopOffset");
    v12->_searchBarTopOffset = v24;
    -[SBHSidebarVisualConfiguration firstWidgetTopOffset](v23, "firstWidgetTopOffset");
    v12->_firstWidgetTopOffset = v25;
    -[SBHSidebarVisualConfiguration insets](v23, "insets");
    v12->_widgetsLeadingOffset = v26;
    v12->_widgetsAreCenteredForFullScreen = -[SBHSidebarVisualConfiguration isContentFullscreen](v23, "isContentFullscreen");
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v27 = objc_claimAutoreleasedReturnValue();
    iconViewsForbiddenFromEditing = v12->_iconViewsForbiddenFromEditing;
    v12->_iconViewsForbiddenFromEditing = (NSHashTable *)v27;

    -[SBHTodayViewController setViewRespectsSystemMinimumLayoutMargins:](v12, "setViewRespectsSystemMinimumLayoutMargins:", 0);
    -[SBHTodayViewController _setupStateCapture](v12, "_setupStateCapture");

  }
  return v12;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[BSInvalidatable invalidate](self->_stateCapture, "invalidate");
  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBIconViewWillPresentContextMenuNotification"), 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, CFSTR("SBIconViewWillDismissContextMenuNotification"), 0);

  v4.receiver = self;
  v4.super_class = (Class)SBHTodayViewController;
  -[SBHTodayViewController dealloc](&v4, sel_dealloc);
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBHTodayViewController;
  -[SBHTodayViewController loadView](&v5, sel_loadView);
  -[SBHTodayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPreservesSuperviewLayoutMargins:", 1);

  objc_msgSend(MEMORY[0x1E0DC4270], "sharedInstanceForStyle:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController setOverrideLegibilitySettings:](self, "setOverrideLegibilitySettings:", v4);

  -[SBHTodayViewController _setUpScrollView](self, "_setUpScrollView");
  -[SBHTodayViewController _setUpIconListViews](self, "_setUpIconListViews");
  -[SBHTodayViewController setRevealed:](self, "setRevealed:", 1);
  -[SBHTodayViewController setVisuallyRevealed:animated:](self, "setVisuallyRevealed:animated:", 1, 0);
}

- (void)_setUpScrollView
{
  void *v3;
  UIScrollView *v4;
  UIScrollView *scrollView;
  void *v6;
  double v7;
  void *v8;
  NSLayoutConstraint *scrollViewLeadingConstraint;
  void *v10;
  void *v11;
  NSLayoutConstraint *v12;
  NSLayoutConstraint *v13;
  void *v14;
  void *v15;
  NSLayoutConstraint *v16;
  NSLayoutConstraint *scrollViewTrailingConstraint;
  void *v18;
  NSLayoutConstraint *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[5];

  v28[4] = *MEMORY[0x1E0C80C00];
  -[SBHTodayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E0DC3C28]);
  scrollView = self->_scrollView;
  self->_scrollView = v4;

  -[UIScrollView setDelegate:](self->_scrollView, "setDelegate:", self);
  -[UIScrollView layer](self->_scrollView, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHitTestsAsOpaque:", 1);

  -[UIScrollView setAlwaysBounceVertical:](self->_scrollView, "setAlwaysBounceVertical:", 1);
  -[UIScrollView setShowsHorizontalScrollIndicator:](self->_scrollView, "setShowsHorizontalScrollIndicator:", 0);
  -[UIScrollView setShowsVerticalScrollIndicator:](self->_scrollView, "setShowsVerticalScrollIndicator:", 0);
  -[UIScrollView setClipsToBounds:](self->_scrollView, "setClipsToBounds:", 0);
  -[UIScrollView setTranslatesAutoresizingMaskIntoConstraints:](self->_scrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView setDelaysContentTouches:](self->_scrollView, "setDelaysContentTouches:", 0);
  -[UIScrollView setContentInsetAdjustmentBehavior:](self->_scrollView, "setContentInsetAdjustmentBehavior:", 2);
  objc_msgSend(v3, "addSubview:", self->_scrollView);
  v7 = 0.0;
  if (SBFEffectiveHomeButtonType() != 2)
  {
    if (__sb__runningInSpringBoard())
    {
      if (SBFEffectiveDeviceClass() == 2)
        v7 = 0.0;
      else
        v7 = 29.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "userInterfaceIdiom") == 1)
        v7 = 0.0;
      else
        v7 = 29.0;

    }
  }
  scrollViewLeadingConstraint = self->_scrollViewLeadingConstraint;
  if (!scrollViewLeadingConstraint)
  {
    -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "leadingAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    v13 = self->_scrollViewLeadingConstraint;
    self->_scrollViewLeadingConstraint = v12;

    -[UIScrollView trailingAnchor](self->_scrollView, "trailingAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "trailingAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    scrollViewTrailingConstraint = self->_scrollViewTrailingConstraint;
    self->_scrollViewTrailingConstraint = v16;

    scrollViewLeadingConstraint = self->_scrollViewLeadingConstraint;
  }
  v18 = (void *)MEMORY[0x1E0CB3718];
  v19 = self->_scrollViewTrailingConstraint;
  v28[0] = scrollViewLeadingConstraint;
  v28[1] = v19;
  objc_msgSend(v3, "topAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v28[2] = v22;
  objc_msgSend(v3, "bottomAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v27 = v3;
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:constant:", v24, v7);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v28[3] = v25;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 4);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "activateConstraints:", v26);

  -[UIScrollView setAccessibilityIdentifier:](self->_scrollView, "setAccessibilityIdentifier:", CFSTR("left-of-home-scroll-view"));
}

- (CGSize)_iconSpacingForIconListViews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  CGSize result;

  -[SBHTodayViewController listLayoutProvider](self, "listLayoutProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController iconLocation](self, "iconLocation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutForIconLocation:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SBHIconListLayoutListIconSpacing(v5, 1);
  v7 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, CFSTR("SBHIconGridSizeClassSmall"));
  v8 = SBHIconListLayoutIconImageInfoForGridSizeClass(v5, CFSTR("SBHIconGridSizeClassMedium")) + v7 * -2.0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "userInterfaceIdiom");

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v6 = v8;

  v11 = v6;
  v12 = v8;
  result.height = v12;
  result.width = v11;
  return result;
}

- (void)_updateIconListSpacing
{
  double v3;
  double v4;

  -[SBIconListView addIconViewConfigurationOption:](self->_listView, "addIconViewConfigurationOption:", 2);
  -[SBHTodayViewController _iconSpacingForIconListViews](self, "_iconSpacingForIconListViews");
  v4 = v3;
  -[SBIconListView setIconSpacing:](self->_listView, "setIconSpacing:");
  -[UIStackView setSpacing:](self->_stackView, "setSpacing:", v4);
}

- (void)_setUpIconListViewLayoutDelegates
{
  void *v3;
  uint64_t v4;
  _BOOL8 v5;
  SBHTodayIconListLayoutDelegate *v6;
  SBHTodayIconListLayoutDelegate *listLayoutDelegate;
  SBHTodayIconListLayoutDelegate *v8;
  void *v9;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  v5 = (v4 & 0xFFFFFFFFFFFFFFFBLL) == 1;
  v6 = -[SBHTodayIconListLayoutDelegate initWithIconListView:]([SBHTodayIconListLayoutDelegate alloc], "initWithIconListView:", self->_listView);
  listLayoutDelegate = self->_listLayoutDelegate;
  self->_listLayoutDelegate = v6;

  v8 = self->_listLayoutDelegate;
  -[SBHTodayViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayIconListLayoutDelegate setContainerView:](v8, "setContainerView:", v9);

  -[SBHTodayIconListLayoutDelegate setScrollView:](self->_listLayoutDelegate, "setScrollView:", self->_scrollView);
  -[SBHTodayIconListLayoutDelegate setCarouselLayout:](self->_listLayoutDelegate, "setCarouselLayout:", v5);
  -[SBIconListView setLayoutDelegate:](self->_listView, "setLayoutDelegate:", self->_listLayoutDelegate);
}

- (void)_setUpIconListViews
{
  NSMapTable *v3;
  NSMapTable *onScreenIconIndexRangeByIconListView;
  uint64_t v5;
  void *v6;
  void *v7;
  SBIconListView *v8;
  SBIconListView *listView;
  SBIconListView *v10;
  void *v11;
  NSMapTable *v12;
  void *v13;
  id v14;
  void *v15;
  UIStackView *v16;
  UIStackView *stackView;
  void *v18;
  NSLayoutConstraint *v19;
  NSLayoutConstraint *listViewMinimumHeightConstraint;
  void *v21;
  NSLayoutConstraint *v22;
  NSLayoutConstraint *listViewMinimumWidthConstraint;
  void *v24;
  void *v25;
  void *v26;
  NSLayoutConstraint *v27;
  NSLayoutConstraint *stackViewToScrollViewTopConstraint;
  void *v29;
  void *v30;
  NSLayoutConstraint *v31;
  NSLayoutConstraint *stackViewToScrollViewBottomConstraint;
  UIStackView *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  NSLayoutConstraint *v43;
  NSLayoutConstraint *v44;
  NSLayoutConstraint *v45;
  NSLayoutConstraint *v46;
  void *v47;
  void *v48;
  void *v49;
  _QWORD v50[6];
  _QWORD v51[2];

  v51[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3748], "weakToStrongObjectsMapTable");
  v3 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
  onScreenIconIndexRangeByIconListView = self->_onScreenIconIndexRangeByIconListView;
  self->_onScreenIconIndexRangeByIconListView = v3;

  -[SBHTodayViewController _beginSuspendingVisibleRowRangeUpdatesForReason:](self, "_beginSuspendingVisibleRowRangeUpdatesForReason:", CFSTR("SBHTodayViewSuspendVisibleRowRangeUpdatesForDisappearedReason"));
  -[SBHTodayViewController listLayoutProvider](self, "listLayoutProvider");
  v5 = objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController listModel](self, "listModel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController iconViewProvider](self, "iconViewProvider");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController iconLocation](self, "iconLocation");
  v49 = (void *)v5;
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[SBIconListView initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:]([SBIconListView alloc], "initWithModel:layoutProvider:iconLocation:orientation:iconViewProvider:", v6, v5, v48, 1, v7);
  listView = self->_listView;
  self->_listView = v8;

  -[SBIconListView addLayoutObserver:](self->_listView, "addLayoutObserver:", self);
  -[SBIconListView setDragDelegate:](self->_listView, "setDragDelegate:", self);
  v10 = self->_listView;
  -[SBHTodayViewController effectiveLegibilitySettings](self, "effectiveLegibilitySettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListView setLegibilitySettings:](v10, "setLegibilitySettings:", v11);

  -[SBIconListView setAutomaticallyAdjustsLayoutMetricsToFit:](self->_listView, "setAutomaticallyAdjustsLayoutMetricsToFit:", 0);
  -[SBIconListView hideAllIcons](self->_listView, "hideAllIcons");
  if (self->_location == 2)
    -[SBIconListView setIconViewConfigurationOptions:](self->_listView, "setIconViewConfigurationOptions:", 16);
  -[SBIconListView setTranslatesAutoresizingMaskIntoConstraints:](self->_listView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v12 = self->_onScreenIconIndexRangeByIconListView;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", 0x7FFFFFFFFFFFFFFFLL, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](v12, "setObject:forKey:", v13, self->_listView);

  v14 = objc_alloc(MEMORY[0x1E0DC3CA8]);
  v51[0] = self->_listView;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (UIStackView *)objc_msgSend(v14, "initWithArrangedSubviews:", v15);
  stackView = self->_stackView;
  self->_stackView = v16;

  -[UIStackView setAlignment:](self->_stackView, "setAlignment:", 3);
  -[SBIconListView heightAnchor](self->_listView, "heightAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "constraintGreaterThanOrEqualToConstant:", 0.0);
  v19 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  listViewMinimumHeightConstraint = self->_listViewMinimumHeightConstraint;
  self->_listViewMinimumHeightConstraint = v19;

  -[SBIconListView widthAnchor](self->_listView, "widthAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "constraintGreaterThanOrEqualToConstant:", 0.0);
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  listViewMinimumWidthConstraint = self->_listViewMinimumWidthConstraint;
  self->_listViewMinimumWidthConstraint = v22;

  -[UIStackView setAxis:](self->_stackView, "setAxis:", 1);
  -[UIStackView setTranslatesAutoresizingMaskIntoConstraints:](self->_stackView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIScrollView addSubview:](self->_scrollView, "addSubview:", self->_stackView);
  -[SBIconListView layer](self->_listView, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setSortsSublayers:", 0);

  -[SBHTodayViewController _updateIconListSpacing](self, "_updateIconListSpacing");
  -[SBHTodayViewController _setUpIconListViewLayoutDelegates](self, "_setUpIconListViewLayoutDelegates");
  -[UIStackView topAnchor](self->_stackView, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView topAnchor](self->_scrollView, "topAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v26);
  v27 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackViewToScrollViewTopConstraint = self->_stackViewToScrollViewTopConstraint;
  self->_stackViewToScrollViewTopConstraint = v27;

  -[UIStackView bottomAnchor](self->_stackView, "bottomAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView bottomAnchor](self->_scrollView, "bottomAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:", v30);
  v31 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  stackViewToScrollViewBottomConstraint = self->_stackViewToScrollViewBottomConstraint;
  self->_stackViewToScrollViewBottomConstraint = v31;

  v33 = self->_stackView;
  if (self->_widgetsAreCenteredForFullScreen)
  {
    -[UIStackView centerXAnchor](v33, "centerXAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView centerXAnchor](self->_scrollView, "centerXAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
  }
  else
  {
    -[UIStackView leadingAnchor](v33, "leadingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIScrollView leadingAnchor](self->_scrollView, "leadingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, self->_widgetsLeadingOffset);
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIScrollView contentLayoutGuide](self->_scrollView, "contentLayoutGuide");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "leadingAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIScrollView frameLayoutGuide](self->_scrollView, "frameLayoutGuide");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "leadingAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();

  v42 = (void *)MEMORY[0x1E0CB3718];
  v43 = self->_stackViewToScrollViewTopConstraint;
  v50[0] = v41;
  v50[1] = v36;
  v44 = self->_stackViewToScrollViewBottomConstraint;
  v45 = self->_listViewMinimumHeightConstraint;
  v50[2] = v43;
  v50[3] = v44;
  v46 = self->_listViewMinimumWidthConstraint;
  v50[4] = v45;
  v50[5] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v50, 6);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "activateConstraints:", v47);

}

- (void)_setupStateCapture
{
  id v3;
  void *v4;
  objc_class *v5;
  void *v6;
  int64_t v7;
  const __CFString *v8;
  __CFString *v9;
  __CFString *v10;
  void *v11;
  BSInvalidatable *v12;
  BSInvalidatable *stateCapture;
  id v14;
  id location;

  if (!self->_stateCapture)
  {
    objc_initWeak(&location, self);
    v3 = MEMORY[0x1E0C80D38];
    v4 = (void *)MEMORY[0x1E0CB3940];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = self->_location;
    v8 = CFSTR("UNKNOWN SBHTodayViewControllerLOCATION");
    if (v7 == 2)
      v8 = CFSTR("SBHTodayViewControllerLocationCoverSheet");
    if (v7 == 1)
      v9 = CFSTR("SBHTodayViewControllerLocationLeftOfHome");
    else
      v9 = (__CFString *)v8;
    v10 = v9;
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@-%@"), v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_copyWeak(&v14, &location);
    BSLogAddStateCaptureBlockWithTitle();
    v12 = (BSInvalidatable *)objc_claimAutoreleasedReturnValue();
    stateCapture = self->_stateCapture;
    self->_stateCapture = v12;

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }
}

__CFString *__44__SBHTodayViewController__setupStateCapture__block_invoke(uint64_t a1)
{
  id *v1;
  id WeakRetained;
  id v3;
  __CFString *v4;

  v1 = (id *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));

  if (WeakRetained)
  {
    v3 = objc_loadWeakRetained(v1);
    objc_msgSend(v3, "descriptionWithMultilinePrefix:", CFSTR("\n"));
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = CFSTR("(NULL!)");
  }
  return v4;
}

- (void)settings:(id)a3 changedValueForKey:(id)a4
{
  if (self->_widgetSettings == a3)
    -[SBHTodayViewController _updateIconListSpacing](self, "_updateIconListSpacing");
}

- (BOOL)shouldAutomaticallyForwardAppearanceMethods
{
  return 0;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int64_t location;
  void *v8;
  void *v9;
  objc_super v10;
  uint8_t buf[4];
  void *v12;
  __int16 v13;
  _BOOL4 v14;
  __int16 v15;
  int64_t v16;
  uint64_t v17;

  v3 = a3;
  v17 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    location = self->_location;
    *(_DWORD *)buf = 138412802;
    v12 = v6;
    v13 = 1024;
    v14 = v3;
    v15 = 2048;
    v16 = location;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "%@ animated: %{BOOL}u location %ld", buf, 0x1Cu);

  }
  v10.receiver = self;
  v10.super_class = (Class)SBHTodayViewController;
  -[SBHTodayViewController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  -[SBHTodayViewController _beginAppearanceTransitionForChildViewControllersToVisible:animated:](self, "_beginAppearanceTransitionForChildViewControllersToVisible:animated:", 1, v3);
  -[SBHTodayViewController _endSuspendingVisibleRowRangeUpdatesForReason:](self, "_endSuspendingVisibleRowRangeUpdatesForReason:", CFSTR("SBHTodayViewSuspendVisibleRowRangeUpdatesForDisappearedReason"));
  -[SBHTodayViewController _updateListLayoutAdditionalInsets](self, "_updateListLayoutAdditionalInsets");
  -[SBHTodayViewController _updateScrollViewContentInset](self, "_updateScrollViewContentInset");
  -[SBHTodayViewController _updateVisiblySettledForIconViews](self, "_updateVisiblySettledForIconViews");
  -[SBHTodayViewController view](self, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setNeedsLayout");

  -[SBHTodayViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

  -[SBHTodayViewController invalidateAllCancelTouchesAssertions](self, "invalidateAllCancelTouchesAssertions");
  -[SBHTodayViewController endDisablingWidgetHitTestingForReason:](self, "endDisablingWidgetHitTestingForReason:", CFSTR("SBHTodayViewDisableWidgetHitTestingForDisappearedReason"));
  -[SBIconListView setContentVisibility:](self->_listView, "setContentVisibility:", -[SBHTodayViewController contentVisibility](self, "contentVisibility"));
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id WeakRetained;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  int64_t v22;
  int64_t location;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  objc_super v29;
  uint8_t v30[128];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  _BOOL4 v34;
  __int16 v35;
  int64_t v36;
  __int16 v37;
  int64_t v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  uint64_t v42;
  __int16 v43;
  void *v44;
  __int16 v45;
  uint64_t v46;
  uint64_t v47;
  CGRect v48;
  CGRect v49;

  v3 = a3;
  v47 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    location = self->_location;
    v22 = -[SBHTodayViewController layoutOrientation](self, "layoutOrientation");
    -[SBHTodayViewController scrollView](self, "scrollView");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "frame");
    NSStringFromCGRect(v48);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHTodayViewController scrollViewLeadingConstraint](self, "scrollViewLeadingConstraint");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constant");
    v10 = v9;
    -[SBHTodayViewController stackView](self, "stackView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    NSStringFromCGRect(v49);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHTodayViewController stackViewToScrollViewLeadingConstraint](self, "stackViewToScrollViewLeadingConstraint");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "constant");
    *(_DWORD *)buf = 138545154;
    v32 = v6;
    v33 = 1024;
    v34 = v3;
    v35 = 2048;
    v36 = location;
    v37 = 2048;
    v38 = v22;
    v39 = 2114;
    v40 = v7;
    v41 = 2048;
    v42 = v10;
    v43 = 2114;
    v44 = v12;
    v45 = 2048;
    v46 = v14;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "[Overlay Position] %{public}@ animated: %{BOOL}u location %ld, orientation: %ld, scrollViewFrame: %{public}@, scrollViewLeading: %f, stackViewFrame: %{public}@, stackViewLeading: %f", buf, 0x4Eu);

  }
  v29.receiver = self;
  v29.super_class = (Class)SBHTodayViewController;
  -[SBHTodayViewController viewDidAppear:](&v29, sel_viewDidAppear_, v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "todayViewDidAppear:", self);

  -[SBHTodayViewController _endAppearanceTransitionForChildViewControllersToVisible:](self, "_endAppearanceTransitionForChildViewControllersToVisible:", 1);
  -[SBIconListView setContentVisibility:](self->_listView, "setContentVisibility:", -[SBHTodayViewController contentVisibility](self, "contentVisibility"));
  -[SBHTodayViewController _updateVisiblySettledForIconViews](self, "_updateVisiblySettledForIconViews");
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v16 = (void *)-[NSHashTable copy](self->_observers, "copy");
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * v20);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v21, "todayViewControllerDidAppear:", self);
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v18);
  }

}

- (void)viewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int64_t location;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    location = self->_location;
    *(_DWORD *)buf = 138412802;
    v21 = v6;
    v22 = 1024;
    v23 = v3;
    v24 = 2048;
    v25 = location;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "%@ animated: %{BOOL}u location %ld", buf, 0x1Cu);

  }
  v18.receiver = self;
  v18.super_class = (Class)SBHTodayViewController;
  -[SBHTodayViewController viewWillDisappear:](&v18, sel_viewWillDisappear_, v3);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "todayViewControllerWillDisappear:", self);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

  -[SBHTodayViewController _beginAppearanceTransitionForChildViewControllersToVisible:animated:](self, "_beginAppearanceTransitionForChildViewControllersToVisible:animated:", 0, v3);
  -[SBHTodayViewController _updateVisiblySettledForIconViews](self, "_updateVisiblySettledForIconViews");
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  void *v6;
  int64_t location;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  uint8_t v19[128];
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  _BOOL4 v23;
  __int16 v24;
  int64_t v25;
  uint64_t v26;

  v3 = a3;
  v26 = *MEMORY[0x1E0C80C00];
  SBLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    _SBFLoggingMethodProem();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    location = self->_location;
    *(_DWORD *)buf = 138412802;
    v21 = v6;
    v22 = 1024;
    v23 = v3;
    v24 = 2048;
    v25 = location;
    _os_log_impl(&dword_1CFEF3000, v5, OS_LOG_TYPE_DEFAULT, "%@ animated: %{BOOL}u location %ld", buf, 0x1Cu);

  }
  v18.receiver = self;
  v18.super_class = (Class)SBHTodayViewController;
  -[SBHTodayViewController viewDidDisappear:](&v18, sel_viewDidDisappear_, v3);
  -[SBIconListView setContentVisibility:](self->_listView, "setContentVisibility:", 2);
  -[SBHTodayViewController cleanupViews](self, "cleanupViews");
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v12);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v13, "todayViewControllerDidDisappear:", self);
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v10);
  }

}

- (void)removeFromParentViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHTodayViewController;
  -[SBHTodayViewController removeFromParentViewController](&v3, sel_removeFromParentViewController);
  -[SBHTodayViewController cleanupViews](self, "cleanupViews");
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SBHTodayViewController;
  -[SBHTodayViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v4, sel_viewDidMoveToWindow_shouldAppearOrDisappear_, a3, a4);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIEdgeInsets)_effectiveLayoutInsets
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
  UIEdgeInsets result;

  -[SBHTodayViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "layoutMargins");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.right = v14;
  result.bottom = v13;
  result.left = v12;
  result.top = v11;
  return result;
}

- (void)_updateTouchInsets
{
  void *v3;
  uint64_t v4;
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
  id v16;
  CGRect v17;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  if ((v4 & 0xFFFFFFFFFFFFFFFBLL) == 1)
  {
    -[SBHTodayViewController view](self, "view");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "window");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHTodayViewController _effectiveLayoutInsets](self, "_effectiveLayoutInsets");
    objc_msgSend(v5, "bounds");
    objc_msgSend(v16, "bounds");
    objc_msgSend(v5, "convertRect:fromView:", v16);
    CGRectGetMaxY(v17);
    UIEdgeInsetsSubtract();
    UIEdgeInsetsMin();
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[UIStackView _setTouchInsets:](self->_stackView, "_setTouchInsets:");
    -[UIScrollView _setTouchInsets:](self->_scrollView, "_setTouchInsets:", v7, v9, v11, v13);
    objc_msgSend(v16, "_setTouchInsets:", v7, v9, v11, v13);
    -[SBHTodayViewController parentViewController](self, "parentViewController");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "_setTouchInsets:", v7, v9, v11, v13);

    -[SBIconListView _setTouchInsets:](self->_listView, "_setTouchInsets:", 0.0, v9, 0.0, v13);
  }
}

- (void)willMoveToParentViewController:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBHTodayViewController;
  v4 = a3;
  -[SBHTodayViewController willMoveToParentViewController:](&v9, sel_willMoveToParentViewController_, v4);
  -[SBHTodayViewController parentViewController](self, "parentViewController", v9.receiver, v9.super_class);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 != v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "userInterfaceIdiom");

    if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    {
      objc_msgSend(v5, "view");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setTouchInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));

    }
  }

}

- (void)viewWillLayoutSubviews
{
  id WeakRetained;
  char v4;
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
  double v16;
  void *v17;
  double v18;
  double v19;
  objc_super v20;

  v20.receiver = self;
  v20.super_class = (Class)SBHTodayViewController;
  -[SBHTodayViewController viewWillLayoutSubviews](&v20, sel_viewWillLayoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_msgSend(WeakRetained, "isTodayViewRotating:", self);

  if ((v4 & 1) == 0)
  {
    -[SBHTodayViewController _effectiveLayoutInsets](self, "_effectiveLayoutInsets");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = v9;
    if (v9 == 0.0)
    {
      objc_msgSend(MEMORY[0x1E0DC5B80], "sbh_displayEdgeInfoForScreenType:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "safeAreaInsetsPortrait");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "bottomInset");
      v13 = v16;

    }
    -[UIScrollView _setAutoScrollTouchInsets:](self->_scrollView, "_setAutoScrollTouchInsets:", 0.0, 0.0, -v13, 0.0);
    -[SBHTodayViewController view](self, "view");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setNeedsUpdateConstraints");

    -[NSLayoutConstraint constant](self->_stackViewToScrollViewTopConstraint, "constant");
    if (v18 != v6 && -[SBHTodayViewController needsToManageTopInset](self, "needsToManageTopInset"))
      -[NSLayoutConstraint setConstant:](self->_stackViewToScrollViewTopConstraint, "setConstant:", v6);
    -[NSLayoutConstraint constant](self->_stackViewToScrollViewBottomConstraint, "constant");
    if (v19 != -v10)
      -[NSLayoutConstraint setConstant:](self->_stackViewToScrollViewBottomConstraint, "setConstant:");
    -[SBHTodayIconListLayoutDelegate setCarouselInsets:](self->_listLayoutDelegate, "setCarouselInsets:", v6, v8, v10, v12);
    -[SBHTodayViewController _updateListLayoutAdditionalInsets](self, "_updateListLayoutAdditionalInsets");
    -[SBHTodayViewController _updateTouchInsets](self, "_updateTouchInsets");
    -[SBHTodayViewController _updateScrollViewContentInset](self, "_updateScrollViewContentInset");
  }
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SBHTodayViewController;
  -[SBHTodayViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[SBHTodayViewController _updateVisibleRowRangeForListViews](self, "_updateVisibleRowRangeForListViews");
  if (-[SBHTodayIconListLayoutDelegate isCarouselLayout](self->_listLayoutDelegate, "isCarouselLayout"))
    -[SBIconListView setIconsNeedLayout](self->_listView, "setIconsNeedLayout");
}

- (void)setEditing:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[SBHTodayViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  v5.receiver = self;
  v5.super_class = (Class)SBHTodayViewController;
  -[SBHTodayViewController setEditing:](&v5, sel_setEditing_, v3);
  -[SBHTodayViewController _updateEditingStateAnimated:](self, "_updateEditingStateAnimated:", 1);
}

- (void)_updateEditingStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  _QWORD v14[4];
  id v15;
  SBHTodayViewController *v16;
  _QWORD v17[5];
  char v18;

  v3 = a3;
  if (-[SBHTodayViewController isEditing](self, "isEditing"))
    v5 = -[SBHTodayViewController suppressesEditingStateForListViews](self, "suppressesEditingStateForListViews") ^ 1;
  else
    v5 = 0;
  -[SBIconListView setEditing:](self->_listView, "setEditing:", v5);
  -[SBIconListView updateEditingStateAnimated:](self->_listView, "updateEditingStateAnimated:", v3);
  v6 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("ToggleEditing-%@"), v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBHTodayViewController _beginSuspendingVisibleRowRangeUpdatesForReason:](self, "_beginSuspendingVisibleRowRangeUpdatesForReason:", v9);
  -[UIScrollView stopScrollingAndZooming](self->_scrollView, "stopScrollingAndZooming");
  v10 = (void *)MEMORY[0x1E0DC3F10];
  -[SBHWidgetSettings toggleEditingOrPinnedAnimationSettings](self->_widgetSettings, "toggleEditingOrPinnedAnimationSettings");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x1E0C809B0];
  if (v3)
    v12 = 3;
  else
    v12 = 2;
  v17[1] = 3221225472;
  v17[2] = __54__SBHTodayViewController__updateEditingStateAnimated___block_invoke;
  v17[3] = &unk_1E8D85BB8;
  v17[4] = self;
  v18 = v5;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __54__SBHTodayViewController__updateEditingStateAnimated___block_invoke_2;
  v14[3] = &unk_1E8D86CC8;
  v15 = v9;
  v16 = self;
  v13 = v9;
  objc_msgSend(v10, "sb_animateWithSettings:mode:animations:completion:", v11, v12, v17, v14);

}

uint64_t __54__SBHTodayViewController__updateEditingStateAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double Height;
  void *v7;
  double v8;
  CGRect v10;

  objc_msgSend(*(id *)(a1 + 32), "_updateListLayoutAdditionalInsets");
  objc_msgSend(*(id *)(a1 + 32), "_toggleListVisibilityWithEditing:", *(unsigned __int8 *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "_updateScrollViewContentInset");
  if (*(_BYTE *)(a1 + 40))
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "layout");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = SBHIconListLayoutIconImageInfoForGridSizeClass(v2, CFSTR("SBHIconGridSizeClassMedium"));
    v5 = v4;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "frame");
    Height = CGRectGetHeight(v10);
    if (Height >= v5)
      v5 = Height;

  }
  else
  {
    v3 = *MEMORY[0x1E0C9D820];
    v5 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1192), "setConstant:", v5);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1200), "setConstant:", v3);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1168), "layoutIfNeeded");
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1112), "layoutIfNeeded");
  if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1208), "isVisuallyRevealed") & 1) == 0)
  {
    v7 = *(void **)(*(_QWORD *)(a1 + 32) + 1112);
    objc_msgSend(v7, "adjustedContentInset");
    objc_msgSend(v7, "setContentOffset:", 0.0, -v8);
  }
  objc_msgSend(*(id *)(a1 + 32), "_updateEditingStateForListView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1072));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1072), "layoutIconsNow");
}

uint64_t __54__SBHTodayViewController__updateEditingStateAnimated___block_invoke_2(uint64_t result)
{
  if (*(_QWORD *)(result + 32))
    return objc_msgSend(*(id *)(result + 40), "_endSuspendingVisibleRowRangeUpdatesForReason:");
  return result;
}

- (void)_updateListLayoutAdditionalInsets
{
  -[SBHTodayIconListLayoutDelegate setAdditionalLayoutInsets:](self->_listLayoutDelegate, "setAdditionalLayoutInsets:", *MEMORY[0x1E0DC49E8], *(double *)(MEMORY[0x1E0DC49E8] + 8), *(double *)(MEMORY[0x1E0DC49E8] + 16), *(double *)(MEMORY[0x1E0DC49E8] + 24));
}

- (void)_toggleListVisibilityWithEditing:(BOOL)a3
{
  -[SBHTodayViewController setVisuallyRevealed:animated:](self, "setVisuallyRevealed:animated:", 1, 0);
  -[SBHTodayViewController setRevealed:](self, "setRevealed:", 1);
}

- (void)setRootFolder:(id)a3
{
  SBRootFolder *v5;
  SBRootFolder *rootFolder;
  void *v7;
  void *v8;
  SBIconListView *listView;
  void *v10;
  SBRootFolder *v11;

  v5 = (SBRootFolder *)a3;
  rootFolder = self->_rootFolder;
  if (rootFolder != v5)
  {
    v11 = v5;
    -[SBRootFolder todayList](rootFolder, "todayList");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeListObserver:", self);

    objc_storeStrong((id *)&self->_rootFolder, a3);
    -[SBRootFolder todayList](v11, "todayList");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addListObserver:", self);
    listView = self->_listView;
    if (listView)
    {
      -[SBIconListView setModel:](listView, "setModel:", v8);
      -[SBHTodayViewController view](self, "view");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setNeedsLayout");

    }
    v5 = v11;
  }

}

- (id)listModel
{
  void *v2;
  void *v3;

  -[SBHTodayViewController rootFolder](self, "rootFolder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "todayList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (SBIconListView)listView
{
  -[SBHTodayViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  return self->_listView;
}

- (void)layoutIconListViewWithAnimationType:(int64_t)a3 forceRelayout:(BOOL)a4
{
  if (a4)
    -[SBIconListView setIconsNeedLayout](self->_listView, "setIconsNeedLayout");
  -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](self->_listView, "layoutIconsIfNeededWithAnimationType:options:", a3, 0);
}

- (void)setSuppressesEditingStateForListViews:(BOOL)a3
{
  if (self->_suppressesEditingStateForListViews != a3)
  {
    self->_suppressesEditingStateForListViews = a3;
    -[SBHTodayViewController _updateEditingStateAnimated:](self, "_updateEditingStateAnimated:", 1);
  }
}

- (BOOL)isSpotlightVisible
{
  return 0;
}

- (void)noteIconViewWillZoomDown:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int IsAppPrediction;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  if (-[SBHTodayViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "userInterfaceIdiom");

    if ((v5 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      objc_msgSend(v14, "location");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      IsAppPrediction = SBHIconLocationIsAppPrediction(v6);

      if (IsAppPrediction)
      {
        -[SBHTodayViewController iconManager](self, "iconManager");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "appPredictionsIconViewDisplayingIconView:options:", v14, 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
          v10 = v9;
        else
          v10 = v14;
        v11 = v10;

        v12 = v11;
      }
      else
      {
        v12 = v14;
      }
      v14 = v12;
      objc_msgSend(v12, "icon");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13)
        -[SBHTodayViewController scrollIconToVisible:atPosition:animated:completion:](self, "scrollIconToVisible:atPosition:animated:completion:", v13, 1, 1, 0);

    }
  }

}

- (id)beginOverridingViewControllerAppearanceStateToRemainDisappearedForReason:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSHashTable *viewControllerAppearStateOverrideAssertions;
  NSHashTable *v8;
  NSHashTable *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = objc_alloc(MEMORY[0x1E0D01868]);
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __99__SBHTodayViewController_beginOverridingViewControllerAppearanceStateToRemainDisappearedForReason___block_invoke;
  v14 = &unk_1E8D85A30;
  objc_copyWeak(&v15, &location);
  v6 = (void *)objc_msgSend(v5, "initWithIdentifier:forReason:invalidationBlock:", CFSTR("OverrideAppearanceStateToRemainDisappeared"), v4, &v11);
  viewControllerAppearStateOverrideAssertions = self->_viewControllerAppearStateOverrideAssertions;
  if (!viewControllerAppearStateOverrideAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable", v11, v12, v13, v14);
    v8 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v9 = self->_viewControllerAppearStateOverrideAssertions;
    self->_viewControllerAppearStateOverrideAssertions = v8;

    viewControllerAppearStateOverrideAssertions = self->_viewControllerAppearStateOverrideAssertions;
  }
  -[NSHashTable addObject:](viewControllerAppearStateOverrideAssertions, "addObject:", v6, v11, v12, v13, v14);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&location);

  return v6;
}

void __99__SBHTodayViewController_beginOverridingViewControllerAppearanceStateToRemainDisappearedForReason___block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v4 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerAppearStateOverrideAssertions");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", v7);

    objc_msgSend(v4, "viewControllerAppearStateOverrideAssertions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "count");

  }
}

- (BOOL)isOverridingViewControllerAppearanceStateToRemainDisappeared
{
  return -[NSHashTable count](self->_viewControllerAppearStateOverrideAssertions, "count") != 0;
}

- (void)setListLayoutProvider:(id)a3
{
  -[SBHTodayViewController setListLayoutProvider:animated:](self, "setListLayoutProvider:animated:", a3, 0);
}

- (void)setListLayoutProvider:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void **p_listLayoutProvider;
  void *v8;
  id v9;

  v4 = a4;
  p_listLayoutProvider = (void **)&self->_listLayoutProvider;
  v9 = a3;
  if (*p_listLayoutProvider != v9)
  {
    objc_storeStrong((id *)&self->_listLayoutProvider, a3);
    -[SBHTodayViewController _updateIconListSpacing](self, "_updateIconListSpacing");
    -[SBHTodayViewController iconLocation](self, "iconLocation");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    SBHIconListLayoutProviderListGridSizeMatchesListLayoutProvider(*p_listLayoutProvider, v9, v8, 1);
    -[SBIconListView setLayoutProvider:animated:](self->_listView, "setLayoutProvider:animated:", v9, v4);

  }
}

- (id)keepIconImageViewControllersStaticForReason:(id)a3
{
  id v4;
  _SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion *v5;
  NSHashTable *keepStaticAssertions;
  NSHashTable *v7;
  NSHashTable *v8;

  v4 = a3;
  v5 = -[_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion initWithTodayViewController:reason:]([_SBHTodayViewControllerIconImageViewControllerKeepStaticAssertion alloc], "initWithTodayViewController:reason:", self, v4);

  keepStaticAssertions = self->_keepStaticAssertions;
  if (!keepStaticAssertions)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v7 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v8 = self->_keepStaticAssertions;
    self->_keepStaticAssertions = v7;

    keepStaticAssertions = self->_keepStaticAssertions;
  }
  -[NSHashTable addObject:](keepStaticAssertions, "addObject:", v5);
  -[SBHTodayViewController _updatePresentationModeForIconViews](self, "_updatePresentationModeForIconViews");
  return v5;
}

- (void)_removeIconImageViewControllerKeepStaticAssertion:(id)a3
{
  -[NSHashTable removeObject:](self->_keepStaticAssertions, "removeObject:", a3);
  -[SBHTodayViewController _updatePresentationModeForIconViews](self, "_updatePresentationModeForIconViews");
}

- (BOOL)_shouldKeepIconImageViewControllersStatic
{
  return -[NSHashTable count](self->_keepStaticAssertions, "count") != 0;
}

- (void)_updatePresentationModeForIconViews
{
  _BOOL4 v3;
  uint64_t v4;
  _QWORD v5[5];

  v3 = -[SBHTodayViewController _shouldKeepIconImageViewControllersStatic](self, "_shouldKeepIconImageViewControllersStatic");
  v4 = 2;
  if (!v3)
    v4 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __61__SBHTodayViewController__updatePresentationModeForIconViews__block_invoke;
  v5[3] = &__block_descriptor_40_e24_v24__0__SBIconView_8_B16l;
  v5[4] = v4;
  -[SBHTodayViewController enumerateDisplayedIconViewsUsingBlock:](self, "enumerateDisplayedIconViewsUsingBlock:", v5);
}

void __61__SBHTodayViewController__updatePresentationModeForIconViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  objc_msgSend(a2, "customIconImageViewController");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "setPresentationMode:", *(_QWORD *)(a1 + 32));

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

- (void)setLegibilitySettings:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_legibilitySettings) & 1) == 0)
  {
    -[SBHTodayViewController effectiveLegibilitySettings](self, "effectiveLegibilitySettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[SBHTodayViewController effectiveLegibilitySettings](self, "effectiveLegibilitySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
      -[SBHTodayViewController updateViewsWithLegibilitySettings](self, "updateViewsWithLegibilitySettings");

  }
}

- (void)setOverrideLegibilitySettings:(id)a3
{
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_overrideLegibilitySettings) & 1) == 0)
  {
    -[SBHTodayViewController effectiveLegibilitySettings](self, "effectiveLegibilitySettings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_overrideLegibilitySettings, a3);
    -[SBHTodayViewController effectiveLegibilitySettings](self, "effectiveLegibilitySettings");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v5, "isEqual:", v6) & 1) == 0)
      -[SBHTodayViewController updateViewsWithLegibilitySettings](self, "updateViewsWithLegibilitySettings");

  }
}

- (void)updateViewsWithLegibilitySettings
{
  id v3;

  -[SBHTodayViewController effectiveLegibilitySettings](self, "effectiveLegibilitySettings");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconListView setLegibilitySettings:](self->_listView, "setLegibilitySettings:", v3);

}

- (_UILegibilitySettings)effectiveLegibilitySettings
{
  _UILegibilitySettings *overrideLegibilitySettings;

  overrideLegibilitySettings = self->_overrideLegibilitySettings;
  if (!overrideLegibilitySettings)
    overrideLegibilitySettings = self->_legibilitySettings;
  return overrideLegibilitySettings;
}

- (void)setContentVisibility:(unint64_t)a3
{
  unint64_t contentVisibility;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
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
  contentVisibility = self->_contentVisibility;
  if (contentVisibility != a3)
  {
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    v6 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v23 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "todayViewController:contentVisibilityWillChange:", self, a3);
        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      }
      while (v8);
    }

    self->_contentVisibility = a3;
    -[SBIconListView setContentVisibility:](self->_listView, "setContentVisibility:", a3);
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    v12 = (void *)-[NSHashTable copy](self->_observers, "copy");
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v19;
      do
      {
        for (j = 0; j != v14; ++j)
        {
          if (*(_QWORD *)v19 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v17, "todayViewController:contentVisibilityDidChange:", self, contentVisibility);
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
      }
      while (v14);
    }

  }
}

- (BOOL)isPresentingIconLocation:(id)a3
{
  id v4;
  void *v5;
  char v6;

  v4 = a3;
  -[SBHTodayViewController iconLocation](self, "iconLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "isEqualToString:", v5);

  return v6;
}

- (NSSet)presentedIconLocations
{
  void *v2;
  void *v3;

  -[SBHTodayViewController iconLocation](self, "iconLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v3;
}

- (id)iconViewForIcon:(id)a3 location:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[SBHTodayViewController iconLocation](self, "iconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[SBIconListView displayedIconViewForIcon:](self->_listView, "displayedIconViewForIcon:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[SBHTodayViewController iconViewForIcon:location:](self, "iconViewForIcon:location:", v6, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11), (_QWORD)v15);
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
  -[SBHTodayViewController presentedIconLocations](self, "presentedIconLocations");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController firstIconViewForIcon:inLocations:](self, "firstIconViewForIcon:inLocations:", v4, v6);
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
  -[SBHTodayViewController presentedIconLocations](self, "presentedIconLocations");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "minusSet:", v6);
  objc_msgSend(v9, "allObjects");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController firstIconViewForIcon:inLocations:](self, "firstIconViewForIcon:inLocations:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isDisplayingIcon:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  void *v10;
  char v11;

  v6 = a3;
  v7 = a4;
  -[SBHTodayViewController iconLocation](self, "iconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
  {
    -[SBIconListView model](self->_listView, "model");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "directlyContainsIcon:", v6);

  }
  else
  {
    v11 = 0;
  }

  return v11;
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
        if (-[SBHTodayViewController isDisplayingIcon:inLocation:](self, "isDisplayingIcon:inLocation:", v6, *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), (_QWORD)v14))
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

- (void)enumerateDisplayedIconViewsForIcon:(id)a3 usingBlock:(id)a4
{
  void *v6;
  void (**v7)(id, void *);

  v7 = (void (**)(id, void *))a4;
  -[SBIconListView displayedIconViewForIcon:](self->_listView, "displayedIconViewForIcon:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    v7[2](v7, v6);

}

- (void)enumerateDisplayedIconViewsUsingBlock:(id)a3
{
  id v4;
  SBIconListView *listView;
  id v6;
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
  listView = self->_listView;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__SBHTodayViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke;
  v7[3] = &unk_1E8D86D10;
  v6 = v4;
  v8 = v6;
  v9 = v10;
  -[SBIconListView enumerateIconViewsUsingBlock:](listView, "enumerateIconViewsUsingBlock:", v7);

  _Block_object_dispose(v10, 8);
}

uint64_t __64__SBHTodayViewController_enumerateDisplayedIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
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

- (BOOL)isDisplayingIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[SBHTodayViewController iconLocation](self, "iconLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SBHTodayViewController isDisplayingIcon:inLocations:](self, "isDisplayingIcon:inLocations:", v4, v6);

  return (char)self;
}

- (BOOL)isDisplayingIconView:(id)a3
{
  return -[SBIconListView isDisplayingIconView:](self->_listView, "isDisplayingIconView:", a3);
}

- (BOOL)isDisplayingIconView:(id)a3 inLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  int v9;
  BOOL v10;

  v6 = a3;
  v7 = a4;
  -[SBHTodayViewController iconLocation](self, "iconLocation");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "isEqualToString:", v8);

  if (v9)
    v10 = -[SBIconListView isDisplayingIconView:](self->_listView, "isDisplayingIconView:", v6);
  else
    v10 = 0;

  return v10;
}

- (void)iconViewWillPresentContextMenu:(id)a3
{
  id v4;

  objc_msgSend(a3, "object");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SBHTodayViewController isDisplayingIconView:](self, "isDisplayingIconView:"))
    -[SBHTodayViewController _cancelTouchesForWidgetIconView:](self, "_cancelTouchesForWidgetIconView:", v4);

}

- (void)iconViewWillDismissContextMenu:(id)a3
{
  NSMutableSet *widgetHitTestingDisabledReasons;
  id v5;
  char v6;
  id v7;

  widgetHitTestingDisabledReasons = self->_widgetHitTestingDisabledReasons;
  v5 = a3;
  v6 = -[NSMutableSet containsObject:](widgetHitTestingDisabledReasons, "containsObject:", CFSTR("SBHTodayViewDisableWidgetHitTestingForScrollingReason"));
  objc_msgSend(v5, "object");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (-[SBHTodayViewController isDisplayingIconView:](self, "isDisplayingIconView:", v7) && (v6 & 1) == 0)
    -[SBHTodayViewController invalidateAllCancelTouchesAssertions](self, "invalidateAllCancelTouchesAssertions");

}

- (id)_widgetIconViewAtLocation:(CGPoint)a3
{
  id v3;
  _QWORD v5[6];
  CGPoint v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__3;
  v11 = __Block_byref_object_dispose__3;
  v12 = 0;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __52__SBHTodayViewController__widgetIconViewAtLocation___block_invoke;
  v5[3] = &unk_1E8D86D38;
  v6 = a3;
  v5[4] = self;
  v5[5] = &v7;
  -[SBHTodayViewController enumerateWidgetIconViewsUsingBlock:](self, "enumerateWidgetIconViewsUsingBlock:", v5);
  v3 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v3;
}

void __52__SBHTodayViewController__widgetIconViewAtLocation___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v6;
  CGRect v7;

  v6 = a2;
  objc_msgSend(v6, "bounds");
  objc_msgSend(v6, "convertRect:toView:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1112));
  if (CGRectContainsPoint(v7, *(CGPoint *)(a1 + 48)))
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a2);
    *a3 = 1;
  }

}

- (void)cancelTouchesForAllWidgets
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x1E0C809B0];
  v2[1] = 3221225472;
  v2[2] = __52__SBHTodayViewController_cancelTouchesForAllWidgets__block_invoke;
  v2[3] = &unk_1E8D85CC0;
  v2[4] = self;
  -[SBHTodayViewController enumerateWidgetIconViewsUsingBlock:](self, "enumerateWidgetIconViewsUsingBlock:", v2);
}

uint64_t __52__SBHTodayViewController_cancelTouchesForAllWidgets__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelTouchesForWidgetIconView:", a2);
}

- (void)_cancelTouchesForHitTestedWidgetInScrollView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(v4, "panGestureRecognizer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v4);
  v7 = v6;
  v9 = v8;

  -[SBHTodayViewController _widgetIconViewAtLocation:](self, "_widgetIconViewAtLocation:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = v10;
    -[SBHTodayViewController _cancelTouchesForWidgetIconView:](self, "_cancelTouchesForWidgetIconView:", v10);
    v10 = v11;
  }

}

- (void)_cancelTouchesForWidgetIconView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  void *v8;
  NSMutableDictionary *v9;
  NSMutableDictionary *cancelTouchesAssertionsByWidgetID;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a3;
  objc_msgSend(v15, "customIconImageViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_opt_respondsToSelector();

  v6 = v15;
  if ((v5 & 1) != 0)
  {
    objc_msgSend(v15, "customIconImageViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelTouchesForCurrentEventInHostedContent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v15;
    if (v8)
    {
      if (!self->_cancelTouchesAssertionsByWidgetID)
      {
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v9 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
        cancelTouchesAssertionsByWidgetID = self->_cancelTouchesAssertionsByWidgetID;
        self->_cancelTouchesAssertionsByWidgetID = v9;

        v6 = v15;
      }
      objc_msgSend(v6, "icon");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "uniqueIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSMutableDictionary objectForKey:](self->_cancelTouchesAssertionsByWidgetID, "objectForKey:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v13;
      if (v13)
        objc_msgSend(v13, "invalidate");
      -[NSMutableDictionary setObject:forKey:](self->_cancelTouchesAssertionsByWidgetID, "setObject:forKey:", v8, v12);

      v6 = v15;
    }
  }

}

- (void)invalidateAllCancelTouchesAssertions
{
  NSMutableDictionary *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSMutableDictionary *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = self->_cancelTouchesAssertionsByWidgetID;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(v3);
        -[NSMutableDictionary objectForKey:](self->_cancelTouchesAssertionsByWidgetID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "invalidate");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v19, v24, 16);
    }
    while (v5);
  }

  -[NSMutableDictionary removeAllObjects](self->_cancelTouchesAssertionsByWidgetID, "removeAllObjects");
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v9 = self->_cancelTouchesAssertionsByLegacyWidgetID;
  v10 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        -[NSMutableDictionary objectForKey:](self->_cancelTouchesAssertionsByLegacyWidgetID, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v13), (_QWORD)v15);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "invalidate");

        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
    }
    while (v11);
  }

  -[NSMutableDictionary removeAllObjects](self->_cancelTouchesAssertionsByLegacyWidgetID, "removeAllObjects");
}

- (id)cancelTouchesOnIconViews
{
  id v3;
  id v4;
  _SBHTodayViewControllerCancelTouchesAssertion *v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__SBHTodayViewController_cancelTouchesOnIconViews__block_invoke;
  v7[3] = &unk_1E8D85CC0;
  v8 = v3;
  v4 = v3;
  -[SBHTodayViewController enumerateWidgetIconViewsUsingBlock:](self, "enumerateWidgetIconViewsUsingBlock:", v7);
  v5 = -[_SBHTodayViewControllerCancelTouchesAssertion initWithAssertions:]([_SBHTodayViewControllerCancelTouchesAssertion alloc], "initWithAssertions:", v4);

  return v5;
}

void __50__SBHTodayViewController_cancelTouchesOnIconViews__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "customIconImageViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_opt_respondsToSelector();

  v5 = v8;
  if ((v4 & 1) != 0)
  {
    objc_msgSend(v8, "customIconImageViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cancelTouchesForCurrentEventInHostedContent");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);

    v5 = v8;
  }

}

- (BOOL)_isWidgetHitTestingDisabled
{
  return -[NSMutableSet count](self->_widgetHitTestingDisabledReasons, "count") != 0;
}

- (void)beginDisablingWidgetHitTestingForReason:(id)a3
{
  NSMutableSet *widgetHitTestingDisabledReasons;
  NSMutableSet *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  widgetHitTestingDisabledReasons = self->_widgetHitTestingDisabledReasons;
  if (!widgetHitTestingDisabledReasons)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v5 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v6 = self->_widgetHitTestingDisabledReasons;
    self->_widgetHitTestingDisabledReasons = v5;

    widgetHitTestingDisabledReasons = self->_widgetHitTestingDisabledReasons;
  }
  if (!-[NSMutableSet count](widgetHitTestingDisabledReasons, "count"))
    -[SBHTodayViewController enumerateWidgetIconViewsUsingBlock:](self, "enumerateWidgetIconViewsUsingBlock:", &__block_literal_global_16);
  -[NSMutableSet addObject:](self->_widgetHitTestingDisabledReasons, "addObject:", v7);

}

uint64_t __66__SBHTodayViewController_beginDisablingWidgetHitTestingForReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCustomIconImageViewHitTestingDisabled:", 1);
}

- (void)endDisablingWidgetHitTestingForReason:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_widgetHitTestingDisabledReasons, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_widgetHitTestingDisabledReasons, "removeObject:", v4);
    if (!-[NSMutableSet count](self->_widgetHitTestingDisabledReasons, "count"))
      -[SBHTodayViewController enumerateWidgetIconViewsUsingBlock:](self, "enumerateWidgetIconViewsUsingBlock:", &__block_literal_global_94);
  }

}

uint64_t __64__SBHTodayViewController_endDisablingWidgetHitTestingForReason___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "setCustomIconImageViewHitTestingDisabled:", 0);
}

- (void)enumerateWidgetIconViewsUsingBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bs_safeAddObject:", self->_listView);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v16;
    v9 = MEMORY[0x1E0C809B0];
LABEL_3:
    v10 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v8)
        objc_enumerationMutation(v6);
      v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
      v12[0] = v9;
      v12[1] = 3221225472;
      v12[2] = __61__SBHTodayViewController_enumerateWidgetIconViewsUsingBlock___block_invoke;
      v12[3] = &unk_1E8D86D10;
      v13 = v4;
      v14 = &v19;
      objc_msgSend(v11, "enumerateIconViewsUsingBlock:", v12);
      LOBYTE(v11) = *((_BYTE *)v20 + 24) == 0;

      if ((v11 & 1) == 0)
        break;
      if (v7 == ++v10)
      {
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v23, 16);
        if (v7)
          goto LABEL_3;
        break;
      }
    }
  }

  _Block_object_dispose(&v19, 8);
}

void __61__SBHTodayViewController_enumerateWidgetIconViewsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  int v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "icon");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isWidgetIcon");

  if (v7)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
      *a4 = 1;
  }

}

- (void)coronaAnimationController:(id)a3 willAnimateCoronaTransitionWithAnimator:(id)a4
{
  _QWORD v4[5];

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__SBHTodayViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke;
  v4[3] = &unk_1E8D84C50;
  v4[4] = self;
  objc_msgSend(a4, "addAnimations:", v4);
}

void __92__SBHTodayViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke(uint64_t a1)
{
  id v1;
  void *v2;
  id v3;
  _QWORD v4[4];
  id v5;

  v1 = *(id *)(*(_QWORD *)(a1 + 32) + 1072);
  v2 = (void *)MEMORY[0x1E0DC3F10];
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __92__SBHTodayViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2;
  v4[3] = &unk_1E8D84C50;
  v5 = v1;
  v3 = v1;
  objc_msgSend(v2, "performWithoutAnimation:", v4);
  objc_msgSend(v3, "pl_performCrossFadeIfNecessary");

}

uint64_t __92__SBHTodayViewController_coronaAnimationController_willAnimateCoronaTransitionWithAnimator___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)iconListView:(id)a3 didAddIconView:(id)a4
{
  void *v5;
  id v6;

  v6 = a4;
  objc_msgSend(v6, "addObserver:", self);
  objc_msgSend(v6, "customIconImageViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 && (objc_msgSend(v6, "isIconImageViewBorrowed") & 1) == 0)
    -[SBHTodayViewController bs_addChildViewController:](self, "bs_addChildViewController:", v5);
  objc_msgSend(v6, "setCustomIconImageViewHitTestingDisabled:", -[SBHTodayViewController _isWidgetHitTestingDisabled](self, "_isWidgetHitTestingDisabled"));
  objc_msgSend(v6, "setWantsFocusProxyView:", -[SBHTodayIconListLayoutDelegate isCarouselLayout](self->_listLayoutDelegate, "isCarouselLayout"));

}

- (void)iconListView:(id)a3 didRemoveIconView:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  objc_msgSend(v5, "removeObserver:", self);
  objc_msgSend(v5, "customIconImageViewController");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    -[SBHTodayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v7);
    v6 = v7;
  }

}

- (void)iconView:(id)a3 didChangeCustomImageViewController:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  objc_msgSend(v8, "customIconImageViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
    -[SBHTodayViewController bs_removeChildViewController:](self, "bs_removeChildViewController:", v6);
  if (v7)
  {
    objc_msgSend(v8, "setCustomIconImageViewHitTestingDisabled:", -[SBHTodayViewController _isWidgetHitTestingDisabled](self, "_isWidgetHitTestingDisabled"));
    -[SBHTodayViewController bs_addChildViewController:](self, "bs_addChildViewController:", v7);
    if (-[SBHTodayViewController _shouldKeepIconImageViewControllersStatic](self, "_shouldKeepIconImageViewControllersStatic"))
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(v7, "setPresentationMode:", 2);
    }
  }

}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  void *v5;

  -[SBHTodayViewController view](self, "view", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

  -[SBHTodayViewController _updateVisibleRowRangeForListViews](self, "_updateVisibleRowRangeForListViews");
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  id v5;

  -[SBHTodayViewController view](self, "view", a3, a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setNeedsLayout");

}

- (void)iconList:(id)a3 didRemoveIcon:(id)a4
{
  id v4;

  -[SBHTodayViewController view](self, "view", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (void)iconList:(id)a3 didMoveIcon:(id)a4
{
  id v4;

  -[SBHTodayViewController view](self, "view", a3, a4);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setNeedsLayout");

}

- (BOOL)iconListView:(id)a3 canHandleIconDropSession:(id)a4
{
  id v6;
  id v7;
  id v8;
  char v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  -[SBHTodayViewController listView](self, "listView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[SBHTodayViewController iconManager](self, "iconManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "iconDragManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = objc_msgSend(v11, "canHandleIconDropSession:inIconListView:", v7, v6);
  }
  else
  {
    v9 = 0;
  }

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
  -[SBHTodayViewController listView](self, "listView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v10)
  {
    -[SBHTodayViewController iconManager](self, "iconManager");
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
  -[SBHTodayViewController listView](self, "listView");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    -[SBHTodayViewController iconManager](self, "iconManager");
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
  -[SBHTodayViewController listView](self, "listView");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 == v10)
  {
    -[SBHTodayViewController iconManager](self, "iconManager");
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
  id v9;

  v6 = a4;
  v7 = a3;
  -[SBHTodayViewController iconManager](self, "iconManager");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconDragManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "performIconDrop:inIconListView:", v6, v7);

}

- (id)iconListView:(id)a3 iconViewForDroppingIconDragItem:(id)a4 proposedIconView:(id)a5
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
  -[SBHTodayViewController iconManager](self, "iconManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "iconDragManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "iconListView:iconViewForDroppingIconDragItem:proposedIconView:", v10, v9, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
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
  -[SBHTodayViewController iconManager](self, "iconManager");
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
  -[SBHTodayViewController iconManager](self, "iconManager");
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
  -[SBHTodayViewController iconManager](self, "iconManager");
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
  -[SBHTodayViewController iconManager](self, "iconManager");
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
  -[SBHTodayViewController iconManager](self, "iconManager");
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
  -[SBHTodayViewController iconManager](self, "iconManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "iconDragManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "iconListView:customSpringAnimationBehaviorForDroppingItem:", v7, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(v4, "_removeAllRetargetableAnimations:", 1);
  -[SBHTodayViewController _cancelTouchesForHitTestedWidgetInScrollView:](self, "_cancelTouchesForHitTestedWidgetInScrollView:", v4);
  -[SBHTodayViewController beginDisablingWidgetHitTestingForReason:](self, "beginDisablingWidgetHitTestingForReason:", CFSTR("SBHTodayViewDisableWidgetHitTestingForScrollingReason"));
  objc_msgSend(v4, "contentOffset");
  v6 = v5;
  v8 = v7;

  -[SBHTodayViewController setScrollingBeginningOffset:](self, "setScrollingBeginningOffset:", v6, v8);
  -[SBHTodayViewController _updateVisiblySettledForIconViews](self, "_updateVisiblySettledForIconViews");
  -[SBHScrollableIconViewInteraction updateScrolling:](self->_scrollingInteraction, "updateScrolling:", 1);
}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;

  if (self->_scrollView == a3)
  {
    v4 = a3;
    -[SBHTodayViewController _updateListViewLayoutAnimated:](self, "_updateListViewLayoutAnimated:", 1);
    -[SBHTodayViewController _updateVisibleRowRangeForListView:](self, "_updateVisibleRowRangeForListView:", self->_listView);
    -[SBHScrollableIconViewInteraction clippingScrollViewDidScroll:](self->_scrollingInteraction, "clippingScrollViewDidScroll:", v4);

  }
}

- (void)scrollIconToVisible:(id)a3 atPosition:(int64_t)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  void (**v10)(_QWORD);
  id v11;
  void *v12;
  uint64_t v13;
  NSMutableArray *scrollViewDidEndScrollingHandlers;
  NSMutableArray *v15;
  NSMutableArray *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  CGFloat v35;
  double v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  double v61;
  double v62;
  double v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v6 = a5;
  v10 = (void (**)(_QWORD))a6;
  v11 = a3;
  -[SBHTodayViewController _updateScrollViewContentSize](self, "_updateScrollViewContentSize");
  -[SBHTodayViewController listView](self, "listView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "indexOfIcon:", v11);

  if (v13 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (v10)
      v10[2](v10);
  }
  else
  {
    if (v10)
    {
      scrollViewDidEndScrollingHandlers = self->_scrollViewDidEndScrollingHandlers;
      if (!scrollViewDidEndScrollingHandlers)
      {
        v15 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 1);
        v16 = self->_scrollViewDidEndScrollingHandlers;
        self->_scrollViewDidEndScrollingHandlers = v15;

        scrollViewDidEndScrollingHandlers = self->_scrollViewDidEndScrollingHandlers;
      }
      v17 = _Block_copy(v10);
      -[NSMutableArray addObject:](scrollViewDidEndScrollingHandlers, "addObject:", v17);

    }
    -[SBHTodayViewController listLayoutDelegate](self, "listLayoutDelegate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBHTodayViewController _effectiveLayoutInsets](self, "_effectiveLayoutInsets");
    v61 = v19;
    v62 = v20;
    v21 = objc_msgSend(v12, "coordinateForIconAtIndex:", v13);
    v23 = v22;
    objc_msgSend(v18, "unadjustedOriginYForIconCoordinate:", v21, v22);
    -[UIScrollView convertPoint:fromView:](self->_scrollView, "convertPoint:fromView:", v12, 0.0, v24);
    v26 = v25;
    -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
    v63 = v27;
    objc_msgSend(v18, "unadjustedBoundsForIconCoordinate:", v21, v23);
    v29 = v28;
    v31 = v30;
    v33 = v32;
    v35 = v34;
    -[UIScrollView bounds](self->_scrollView, "bounds");
    if (a4 == 1)
    {
      -[SBHTodayViewController iconLocation](self, "iconLocation");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListLayoutProvider layoutForIconLocation:](self->_listLayoutProvider, "layoutForIconLocation:", v50);
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "layoutInsetsForOrientation:", 1);
      v53 = v52;
      -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
      v55 = v53 + v61 + v54;
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      if (v56 >= v26 - v55)
        v26 = v26 - v55;
      else
        v26 = v56;

    }
    else if (!a4)
    {
      v40 = v38;
      v41 = v39;
      v42 = v36;
      v64.origin.x = v29;
      v43 = v37;
      v64.origin.y = v31;
      v64.size.width = v33;
      v64.size.height = v35;
      v44 = CGRectGetHeight(v64) * 0.5;
      v65.origin.x = v42;
      v65.origin.y = v43;
      v45 = v43;
      v65.size.width = v40;
      v65.size.height = v41;
      v46 = v26 + v44 - CGRectGetHeight(v65) * 0.5;
      -[UIScrollView contentSize](self->_scrollView, "contentSize");
      v48 = v62 + v47;
      v66.origin.x = v42;
      v66.origin.y = v45;
      v66.size.width = v40;
      v66.size.height = v41;
      v49 = v48 - CGRectGetHeight(v66);
      if (v46 >= v49)
        v26 = v49;
      else
        v26 = v46;
    }
    -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
    v58 = -v57;
    if (v26 >= v58)
      v59 = v26;
    else
      v59 = v58;
    objc_msgSend(MEMORY[0x1E0CD2848], "animation");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    convertDampingRatioAndResponseToTensionAndFriction();
    objc_msgSend(v60, "setMass:", 1.0);
    objc_msgSend(v60, "setStiffness:", 0.0);
    objc_msgSend(v60, "setDamping:", 0.0);
    objc_msgSend(v60, "durationForEpsilon:", 1.17549435e-38);
    objc_msgSend(v60, "setDuration:");
    -[UIScrollView _setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:](self->_scrollView, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", v6, 3, 0, v60, v63, v59);

  }
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  id v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unint64_t v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  unint64_t v18;
  double v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v31;
  CGFloat v32;
  double v33;
  double v34;
  double v35;
  CGFloat v36;
  CGFloat v37;
  double v38;
  double v39;
  void *v40;
  uint64_t v41;

  v7 = a3;
  if (-[SBHTodayIconListLayoutDelegate isRevealed](self->_listLayoutDelegate, "isRevealed")
    || !-[SBHTodayIconListLayoutDelegate isVisuallyRevealed](self->_listLayoutDelegate, "isVisuallyRevealed"))
  {
    if (-[SBHTodayIconListLayoutDelegate isRevealed](self->_listLayoutDelegate, "isRevealed")
      && !-[SBHTodayIconListLayoutDelegate isVisuallyRevealed](self->_listLayoutDelegate, "isVisuallyRevealed"))
    {
      -[SBHTodayViewController setRevealed:](self, "setRevealed:", 0);
    }
  }
  else
  {
    -[SBHTodayViewController setRevealed:](self, "setRevealed:", 1);
    objc_msgSend(v7, "contentSize");
    v9 = v8;
    objc_msgSend(v7, "bounds");
    if (v9 > v10)
    {
      -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
      v12 = -[SBHTodayViewController _indexForNextWidgetInListViewAfterContentOffset:](self, "_indexForNextWidgetInListViewAfterContentOffset:", v11);
      v13 = -[SBHTodayViewController _indexForNextWidgetInListViewAfterContentOffset:](self, "_indexForNextWidgetInListViewAfterContentOffset:", a5->y);
      -[UIScrollView panGestureRecognizer](self->_scrollView, "panGestureRecognizer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "velocityInView:", v7);
      v16 = v15;

      v17 = 0.0;
      v18 = vcvtad_u64_f64(pow(fmin(fmax(v16 / -15000.0, 0.0), 1.0), 3.0) * (double)(v13 - v12) + (double)v12);
      if (-[SBHTodayViewController needsToManageTopInset](self, "needsToManageTopInset"))
      {
        -[NSLayoutConstraint constant](self->_stackViewToScrollViewTopConstraint, "constant");
        v17 = v19;
      }
      -[SBHTodayViewController listView](self, "listView");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBHTodayViewController listLayoutDelegate](self, "listLayoutDelegate");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "coordinateForIconAtIndex:", v18);
      objc_msgSend(v21, "unadjustedOriginYForIconCoordinate:", v22, v23);
      objc_msgSend(v7, "convertPoint:fromView:", v20, 0.0, v24 - v17);
      v26 = v25;
      v28 = v27;
      v29 = objc_msgSend(v20, "coordinateForIconAtIndex:", 0);
      objc_msgSend(v21, "unadjustedOriginYForIconCoordinate:", v29, v30);
      objc_msgSend(v7, "convertPoint:fromView:", v20, 0.0, v31 - v17);
      if (a5->y > v32)
      {
        objc_msgSend(v7, "contentSize");
        v34 = v33;
        objc_msgSend(v7, "bounds");
        if (v16 < 0.0 && v28 < v34 - v35)
        {
          objc_msgSend(v7, "contentOffset");
          a5->x = v36;
          a5->y = v37;
          objc_msgSend(v7, "contentOffset");
          v39 = fmin(-v16 / (v28 - v38), 15.0);
          v40 = (void *)objc_opt_new();
          v41 = 0;
          convertDampingRatioAndResponseToTensionAndFriction();
          objc_msgSend(v40, "setMass:", 1.0);
          objc_msgSend(v40, "setStiffness:", 0.0);
          objc_msgSend(v40, "setDamping:", 0.0);
          objc_msgSend(v40, "durationForEpsilon:", 1.17549435e-38);
          objc_msgSend(v40, "setDuration:");
          objc_msgSend(v40, "setInitialVelocity:", v39);
          objc_msgSend(v7, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 1, 3, 0, v40, v26, v28);

        }
      }

    }
  }
  -[SBHTodayViewController invalidateAllCancelTouchesAssertions](self, "invalidateAllCancelTouchesAssertions", v41);

}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  if (!a4)
    -[SBHTodayViewController _scrollViewDidEndScrolling](self, "_scrollViewDidEndScrolling", a3);
}

- (BOOL)scrollViewShouldScrollToTop:(id)a3
{
  return 1;
}

- (UIEdgeInsets)visibleContainerInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UIEdgeInsets result;

  -[UIScrollView adjustedContentInset](self->_scrollView, "adjustedContentInset");
  v4 = v3;
  -[SBHTodayViewController _effectiveLayoutInsets](self, "_effectiveLayoutInsets");
  v6 = v4 + v5;
  v7 = 0.0;
  v8 = 0.0;
  v9 = 0.0;
  result.right = v9;
  result.bottom = v8;
  result.left = v7;
  result.top = v6;
  return result;
}

- (void)enumerateScrollableIconViewsUsingBlock:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t, _BYTE *);
  void *v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v4 = a3;
  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  v7 = MEMORY[0x1E0C809B0];
  v8 = 3221225472;
  v9 = __65__SBHTodayViewController_enumerateScrollableIconViewsUsingBlock___block_invoke;
  v10 = &unk_1E8D86D60;
  v5 = v4;
  v11 = v5;
  v12 = &v13;
  -[SBHTodayViewController enumerateDisplayedIconViewsUsingBlock:](self, "enumerateDisplayedIconViewsUsingBlock:", &v7);
  if (!*((_BYTE *)v14 + 24))
  {
    -[SBHTodayViewController iconManager](self, "iconManager", v7, v8, v9, v10);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "enumerateIconViewsDisplayedInAppPredictionsInLocationGroup:withOptions:usingBlock:", CFSTR("SBIconLocationGroupTodayView"), 1, v5);

  }
  _Block_object_dispose(&v13, 8);

}

uint64_t __65__SBHTodayViewController_enumerateScrollableIconViewsUsingBlock___block_invoke(uint64_t a1, uint64_t a2, _BYTE *a3)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (*a3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  return result;
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
  return 1;
}

- (double)scrollPageOffsetForButtonsInEditingMode
{
  return 0.0;
}

- (void)_scrollViewDidEndScrolling
{
  void *v3;
  void *v4;
  NSMutableArray *scrollViewDidEndScrollingHandlers;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  if (self->_enableEditingModeWhenScrollEnds)
  {
    self->_enableEditingModeWhenScrollEnds = 0;
    -[SBHTodayViewController iconManager](self, "iconManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setEditing:", 1);

  }
  v4 = (void *)-[NSMutableArray copy](self->_scrollViewDidEndScrollingHandlers, "copy");
  scrollViewDidEndScrollingHandlers = self->_scrollViewDidEndScrollingHandlers;
  self->_scrollViewDidEndScrollingHandlers = 0;

  -[SBHTodayViewController _updateVisiblySettledForIconViews](self, "_updateVisiblySettledForIconViews");
  -[SBHScrollableIconViewInteraction updateScrolling:](self->_scrollingInteraction, "updateScrolling:", 0);
  -[SBHTodayViewController endDisablingWidgetHitTestingForReason:](self, "endDisablingWidgetHitTestingForReason:", CFSTR("SBHTodayViewDisableWidgetHitTestingForScrollingReason"));
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v22 != v9)
          objc_enumerationMutation(v6);
        (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * i) + 16))();
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v8);
  }

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v11 = (void *)-[NSHashTable copy](self->_observers, "copy", 0);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v18;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v18 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * j);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v16, "todayViewControllerDidEndScrolling:", self);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
    }
    while (v13);
  }

}

- (void)_updateListViewLayoutAnimated:(BOOL)a3
{
  _BOOL4 v3;
  SBIconListView *listView;

  v3 = a3;
  -[UIStackView layoutIfNeeded](self->_stackView, "layoutIfNeeded");
  -[UIScrollView layoutIfNeeded](self->_scrollView, "layoutIfNeeded");
  -[SBHTodayViewController _updateVisibleRowRangeForListViews](self, "_updateVisibleRowRangeForListViews");
  -[SBHTodayViewController _updateSubviewOrderingForListViews](self, "_updateSubviewOrderingForListViews");
  if (-[SBHTodayIconListLayoutDelegate isCarouselLayout](self->_listLayoutDelegate, "isCarouselLayout"))
    -[SBIconListView setIconsNeedLayout](self->_listView, "setIconsNeedLayout");
  listView = self->_listView;
  if (v3)
    -[SBIconListView layoutIconsIfNeededWithAnimationType:options:](listView, "layoutIconsIfNeededWithAnimationType:options:", 1, 0);
  else
    -[SBIconListView layoutIconsIfNeeded](listView, "layoutIconsIfNeeded");
}

- (unint64_t)_indexForNextWidgetInListViewAfterContentOffset:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;

  -[SBHTodayViewController listView](self, "listView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController listLayoutDelegate](self, "listLayoutDelegate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "model");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "numberOfIcons");
  objc_msgSend(v5, "convertPoint:fromView:", self->_scrollView, 0.0, a3);
  v10 = v9;
  v11 = 0;
  while (v8 != v11)
  {
    v12 = objc_msgSend(v5, "coordinateForIconAtIndex:", v11);
    objc_msgSend(v6, "unadjustedOriginYForIconCoordinate:", v12, v13);
    ++v11;
    if (v14 > v10)
    {
      v8 = v11 - 1;
      break;
    }
  }

  return v8;
}

- (void)_updateSubviewOrderingForListViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
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
  double MinY;
  id v27;
  void *v28;
  void *v29;
  uint64_t v30;
  unint64_t i;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t j;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t k;
  void *v47;
  void *v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;

  v59 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController listView](self, "listView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bs_safeAddObject:", v4);

  objc_msgSend(v3, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") != 1)
  {
    v7 = 0;
    do
    {
      objc_msgSend(v3, "objectAtIndex:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "objectAtIndex:", ++v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "bounds");
      objc_msgSend(v8, "convertRect:toView:", v6);
      v11 = v10;
      v13 = v12;
      v15 = v14;
      v17 = v16;
      objc_msgSend(v9, "bounds");
      objc_msgSend(v9, "convertRect:toView:", v6);
      v19 = v18;
      v21 = v20;
      v23 = v22;
      v25 = v24;
      v60.origin.x = v11;
      v60.origin.y = v13;
      v60.size.width = v15;
      v60.size.height = v17;
      if (CGRectGetMinY(v60) < 0.0)
      {
        v61.origin.x = v19;
        v61.origin.y = v21;
        v61.size.width = v23;
        v61.size.height = v25;
        MinY = CGRectGetMinY(v61);
        objc_msgSend(v6, "bounds");
        if (MinY < CGRectGetMidY(v62))
        {
          v27 = v9;

          v5 = v27;
        }
      }

    }
    while (v7 < objc_msgSend(v3, "count") - 1);
  }
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v28;
  if (v5)
  {
    objc_msgSend(v28, "addObject:", v5);
    v30 = objc_msgSend(v3, "indexOfObject:", v5);
    for (i = v30 + 1; i < objc_msgSend(v3, "count"); ++i)
    {
      objc_msgSend(v3, "objectAtIndex:", i);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "insertObject:atIndex:", v32, 0);

    }
    v33 = v30 - 1;
    if (v33 >= 0)
    {
      do
      {
        objc_msgSend(v3, "objectAtIndex:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "insertObject:atIndex:", v34, 0);

        --v33;
      }
      while (v33 != -1);
    }
  }
  v48 = v5;
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet", v6);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  -[UIStackView subviews](self->_stackView, "subviews");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
  if (v37)
  {
    v38 = v37;
    v39 = *(_QWORD *)v54;
    do
    {
      for (j = 0; j != v38; ++j)
      {
        if (*(_QWORD *)v54 != v39)
          objc_enumerationMutation(v36);
        v41 = *(_QWORD *)(*((_QWORD *)&v53 + 1) + 8 * j);
        if (objc_msgSend(v29, "containsObject:", v41))
          objc_msgSend(v35, "addObject:", v41);
      }
      v38 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    }
    while (v38);
  }

  if ((objc_msgSend(v29, "isEqualToOrderedSet:", v35) & 1) == 0)
  {
    v51 = 0u;
    v52 = 0u;
    v49 = 0u;
    v50 = 0u;
    v42 = v29;
    v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
    if (v43)
    {
      v44 = v43;
      v45 = *(_QWORD *)v50;
      do
      {
        for (k = 0; k != v44; ++k)
        {
          if (*(_QWORD *)v50 != v45)
            objc_enumerationMutation(v42);
          -[UIStackView bringSubviewToFront:](self->_stackView, "bringSubviewToFront:", *(_QWORD *)(*((_QWORD *)&v49 + 1) + 8 * k));
        }
        v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v49, v57, 16);
      }
      while (v44);
    }

  }
}

- (void)_updateVisiblySettledForIconViews
{
  -[SBHTodayViewController _updateVisiblySettledForIconViewsInListView:](self, "_updateVisiblySettledForIconViewsInListView:", self->_listView);
}

- (void)_updateVisiblySettledForIconViewsInListView:(id)a3
{
  uint64_t v4;
  id v5;

  v5 = a3;
  if (-[UIScrollView isDragging](self->_scrollView, "isDragging")
    || -[UIScrollView isDecelerating](self->_scrollView, "isDecelerating"))
  {
    v4 = 0;
  }
  else
  {
    v4 = -[UIScrollView isScrollAnimating](self->_scrollView, "isScrollAnimating") ^ 1;
  }
  objc_msgSend(v5, "setVisiblySettled:", v4);

}

- (void)_updateEditingStateForListView:(id)a3
{
  id v4;
  char v5;
  _QWORD v6[5];
  char v7;

  v4 = a3;
  v5 = objc_msgSend(v4, "isEditing");
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __57__SBHTodayViewController__updateEditingStateForListView___block_invoke;
  v6[3] = &unk_1E8D86D88;
  v6[4] = self;
  v7 = v5;
  objc_msgSend(v4, "enumerateIconViewsUsingBlock:", v6);

}

void __57__SBHTodayViewController__updateEditingStateForListView___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  id v7;

  v7 = a2;
  objc_msgSend(v7, "icon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isWidgetIcon");

  v5 = v7;
  if (v4)
  {
    v6 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "containsObject:", v7);
    if (*(_BYTE *)(a1 + 40) && objc_msgSend(*(id *)(a1 + 32), "_shouldIconViewForbidJiggling:", v7))
    {
      v5 = v7;
      if ((v6 & 1) == 0)
      {
        objc_msgSend(v7, "startForbiddingEditingModeWithReason:", CFSTR("kStopJigglingBecauseOffScreen"));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "addObject:", v7);
LABEL_8:
        v5 = v7;
      }
    }
    else
    {
      v5 = v7;
      if (v6)
      {
        objc_msgSend(v7, "endForbiddingEditingModeWithReason:", CFSTR("kStopJigglingBecauseOffScreen"));
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 968), "removeObject:", v7);
        goto LABEL_8;
      }
    }
  }

}

- (BOOL)_shouldIconViewForbidJiggling:(id)a3
{
  return 0;
}

- (void)_beginSuspendingVisibleRowRangeUpdatesForReason:(id)a3
{
  id v4;
  NSMutableSet *suspendVisibleRowRangeUpdatesReasons;
  NSMutableSet *v6;
  NSMutableSet *v7;
  id v8;

  v4 = a3;
  suspendVisibleRowRangeUpdatesReasons = self->_suspendVisibleRowRangeUpdatesReasons;
  v8 = v4;
  if (!suspendVisibleRowRangeUpdatesReasons)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();
    v7 = self->_suspendVisibleRowRangeUpdatesReasons;
    self->_suspendVisibleRowRangeUpdatesReasons = v6;

    v4 = v8;
    suspendVisibleRowRangeUpdatesReasons = self->_suspendVisibleRowRangeUpdatesReasons;
  }
  -[NSMutableSet addObject:](suspendVisibleRowRangeUpdatesReasons, "addObject:", v4);

}

- (void)_endSuspendingVisibleRowRangeUpdatesForReason:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableSet containsObject:](self->_suspendVisibleRowRangeUpdatesReasons, "containsObject:"))
  {
    -[NSMutableSet removeObject:](self->_suspendVisibleRowRangeUpdatesReasons, "removeObject:", v4);
    if (!-[NSMutableSet count](self->_suspendVisibleRowRangeUpdatesReasons, "count"))
      -[SBHTodayViewController _updateVisibleRowRangeForListViews](self, "_updateVisibleRowRangeForListViews");
  }

}

- (void)_updateVisibleRowRangeForListViews
{
  -[SBHTodayViewController _updateVisibleRowRangeForListView:](self, "_updateVisibleRowRangeForListView:", self->_listView);
}

- (void)_updateVisibleRowRangeForListView:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  int v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  void *v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  CGFloat v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  int v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  unsigned __int16 v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  NSMapTable *onScreenIconIndexRangeByIconListView;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  CGRect v58;
  CGRect v59;

  v4 = a3;
  if (-[NSMutableSet count](self->_suspendVisibleRowRangeUpdatesReasons, "count"))
    goto LABEL_56;
  objc_msgSend(v4, "layoutDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutMetrics");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "listModel");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v57, "numberOfIcons");
  v8 = objc_msgSend(v5, "isCarouselLayout");
  -[SBHTodayViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v9, "convertRect:toView:", self->_scrollView);
  -[UIScrollView convertRect:toView:](self->_scrollView, "convertRect:toView:", v4);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "userInterfaceIdiom");

  if ((v19 & 0xFFFFFFFFFFFFFFFBLL) == 1 && (v8 & 1) == 0)
  {
    objc_msgSend(v9, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    objc_msgSend(v20, "convertRect:toView:", self->_scrollView);
    -[UIScrollView convertRect:toView:](self->_scrollView, "convertRect:toView:", v4);
    v13 = v21;
    v17 = v22;

  }
  v56 = v9;
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  if (!v7)
  {
    v35 = 1;
    v26 = 0x7FFFFFFFFFFFFFFFLL;
    v36 = 1;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_41;
  }
  v24 = 0;
  v25 = 0x7FFFFFFFFFFFFFFFLL;
  v26 = 0x7FFFFFFFFFFFFFFFLL;
  do
  {
    v27 = objc_msgSend(v4, "coordinateForIconAtIndex:", v24);
    if (v8)
    {
      if (v5)
        objc_msgSend(v5, "layoutAttributesForIconCoordinate:metrics:adjustedForRevealProgress:", v27, v28, v6, 0);
      if ((BSFloatIsZero() & 1) == 0)
      {
LABEL_11:
        if (v26 == 0x7FFFFFFFFFFFFFFFLL)
          v33 = v24;
        else
          v33 = v26;
        v25 = v24;
        goto LABEL_17;
      }
    }
    else
    {
      objc_msgSend(v4, "rectForIconAtIndex:", v24);
      v59.origin.x = v29;
      v59.origin.y = v30;
      v59.size.width = v31;
      v59.size.height = v32;
      v58.origin.x = v11;
      v58.origin.y = v13;
      v58.size.width = v15;
      v58.size.height = v17;
      if (CGRectIntersectsRect(v58, v59))
        goto LABEL_11;
    }
    v33 = 0x7FFFFFFFFFFFFFFFLL;
    if (v26 != 0x7FFFFFFFFFFFFFFFLL)
      goto LABEL_22;
LABEL_17:
    ++v24;
    v26 = v33;
  }
  while (v7 != v24);
  v26 = 0x7FFFFFFFFFFFFFFFLL;
  if (v33 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v55 = 1;
    v34 = 0x7FFFFFFFFFFFFFFFLL;
    goto LABEL_26;
  }
  v26 = v33;
LABEL_22:
  if (v26 <= 1)
    v37 = 1;
  else
    v37 = v26;
  objc_msgSend(v4, "coordinateForIconAtIndex:", v37 - 1);
  v55 = 0;
  v34 = v38 - 1;
LABEL_26:
  v23 = 0x7FFFFFFFFFFFFFFFLL;
  if (v25 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
    v35 = 1;
    v25 = 0x7FFFFFFFFFFFFFFFLL;
  }
  else
  {
    if (v25 + 1 < v7 - 1)
      v39 = v25 + 1;
    else
      v39 = v7 - 1;
    objc_msgSend(v4, "coordinateForIconAtIndex:", v39);
    v41 = v40;
    objc_msgSend(v4, "gridRangeForIconAtIndex:", v39);
    if (v41 + v42 - 1 == 0x8000000000000000)
      v43 = 0x7FFFFFFFFFFFFFFFLL;
    else
      v43 = v34;
    if (v41 + v42 - 1 == 0x8000000000000000)
      v44 = 0;
    else
      v44 = v41 + v42 - 1 - v34;
    v35 = 0;
    if (v34 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = 0;
    }
    else
    {
      v23 = v43;
      v7 = v44;
    }
  }
  v36 = v55;
LABEL_41:
  if (v23 != objc_msgSend(v4, "visibleRowRange") || v7 != v45)
  {
    objc_msgSend(v4, "setVisibleRowRange:", v23, v7);
    objc_msgSend(v4, "layoutIconsIfNeededWithAnimationType:options:", 1, 0);
  }
  if (v35 | v36)
    v46 = 0;
  else
    v46 = v25 - v26 + 1;
  if (v35 | v36)
    v47 = 0x7FFFFFFFFFFFFFFFLL;
  else
    v47 = v26;
  -[NSMapTable objectForKey:](self->_onScreenIconIndexRangeByIconListView, "objectForKey:", v4);
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "rangeValue");
  v51 = v50;

  if (v47 != v49 || v46 != v51)
  {
    onScreenIconIndexRangeByIconListView = self->_onScreenIconIndexRangeByIconListView;
    objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithRange:", v47, v46);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](onScreenIconIndexRangeByIconListView, "setObject:forKey:", v54, v4);

  }
  -[SBHTodayViewController _updateVisiblySettledForIconViewsInListView:](self, "_updateVisiblySettledForIconViewsInListView:", v4);
  -[SBHTodayViewController _updateEditingStateForListView:](self, "_updateEditingStateForListView:", v4);

LABEL_56:
}

- (CGRect)_cellFrameInScrollBoundsForCell:(id)a3
{
  id v4;
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
  CGRect result;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v6 = v5;
  -[UIScrollView contentOffset](self->_scrollView, "contentOffset");
  v8 = v6 - v7;
  objc_msgSend(v4, "frame");
  v10 = v9;
  v12 = v11;

  v13 = 0.0;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)cleanupViews
{
  -[SBHTodayViewController invalidateAllCancelTouchesAssertions](self, "invalidateAllCancelTouchesAssertions");
  -[SBHTodayViewController _endAppearanceTransitionForChildViewControllersToVisible:](self, "_endAppearanceTransitionForChildViewControllersToVisible:", 0);
  -[SBHTodayViewController _beginSuspendingVisibleRowRangeUpdatesForReason:](self, "_beginSuspendingVisibleRowRangeUpdatesForReason:", CFSTR("SBHTodayViewSuspendVisibleRowRangeUpdatesForDisappearedReason"));
  -[SBIconListView hideAllIcons](self->_listView, "hideAllIcons");
}

- (int64_t)layoutOrientation
{
  void *v2;
  void *v3;
  int64_t v4;

  -[SBHTodayViewController listView](self, "listView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "interfaceOrientation");

  return v4;
}

- (BOOL)needsToManageTopInset
{
  void *v2;
  char v3;

  -[SBHTodayViewController iconLocation](self, "iconLocation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("SBIconLocationTodayViewOverlay"));

  return v3;
}

- (id)_majorScrollView
{
  return self->_scrollView;
}

- (CGPoint)_interactiveSpotlightDraggingBeginPoint
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
  void *v12;
  void *v13;
  void *v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;
  CGRect v22;

  -[SBHTodayViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[SBHTodayViewController iconLocation](self, "iconLocation");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController listLayoutProvider](self, "listLayoutProvider");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layoutForIconLocation:", v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = SBHIconListLayoutIconImageInfoForGridSizeClass(v14, CFSTR("SBHIconGridSizeClassMedium"));
  v22.origin.x = v5;
  v22.origin.y = v7;
  v22.size.width = v9;
  v22.size.height = v11;
  v16 = (CGRectGetWidth(v22) - v15) * 0.5 * 0.5;
  UIRectGetCenter();
  v18 = v17;

  v19 = v16;
  v20 = v18;
  result.y = v20;
  result.x = v19;
  return result;
}

- (BOOL)_isViewVisibleInScrollViewSpace:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  char v13;
  CGRect v15;
  CGRect v16;

  v4 = a3;
  objc_msgSend(v4, "bounds");
  objc_msgSend(v4, "convertRect:toView:", self->_scrollView);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[UIScrollView bounds](self->_scrollView, "bounds");
  v16.origin.x = v6;
  v16.origin.y = v8;
  v16.size.width = v10;
  v16.size.height = v12;
  if (CGRectIntersectsRect(v15, v16))
  {
    objc_msgSend(v4, "alpha");
    v13 = BSFloatGreaterThanFloat();
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)extraViewsContainers
{
  void *v3;

  v3 = (void *)objc_opt_new();
  if (-[SBHTodayViewController _isViewVisibleInScrollViewSpace:](self, "_isViewVisibleInScrollViewSpace:", self->_listView))
  {
    objc_msgSend(v3, "addObject:", self->_listView);
  }
  return v3;
}

- (id)extraViews
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  _QWORD v8[5];
  id v9;

  v3 = (void *)objc_opt_new();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __36__SBHTodayViewController_extraViews__block_invoke;
  v8[3] = &unk_1E8D864F8;
  v8[4] = self;
  v4 = v3;
  v9 = v4;
  -[SBHTodayViewController enumerateDisplayedIconViewsUsingBlock:](self, "enumerateDisplayedIconViewsUsingBlock:", v8);
  v5 = v9;
  v6 = v4;

  return v6;
}

void __36__SBHTodayViewController_extraViews__block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "_isViewVisibleInScrollViewSpace:"))
  {
    objc_msgSend(v3, "effectiveIconImageAlpha");
    if (BSFloatGreaterThanFloat())
      objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }

}

- (BOOL)shouldAnimateLastTwoViewsAsOne
{
  return 0;
}

- (BOOL)shouldAnimateFirstTwoViewsAsOne
{
  return 0;
}

- (void)setRevealed:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (-[SBHTodayIconListLayoutDelegate isRevealed](self->_listLayoutDelegate, "isRevealed") != a3)
  {
    -[SBHTodayIconListLayoutDelegate setRevealed:](self->_listLayoutDelegate, "setRevealed:", v3);
    -[SBHTodayViewController _updateScrollViewContentSize](self, "_updateScrollViewContentSize");
  }
}

- (void)setVisuallyRevealed:(BOOL)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  _BOOL8 v5;

  v4 = a4;
  v5 = a3;
  if (-[SBHTodayIconListLayoutDelegate isVisuallyRevealed](self->_listLayoutDelegate, "isVisuallyRevealed") != a3)
  {
    -[SBHTodayIconListLayoutDelegate setVisuallyRevealed:animated:](self->_listLayoutDelegate, "setVisuallyRevealed:animated:", v5, v4);
    -[SBHTodayViewController _updateScrollViewContentSize](self, "_updateScrollViewContentSize");
  }
  if (!-[UIScrollView isTracking](self->_scrollView, "isTracking"))
    -[SBHTodayViewController setRevealed:](self, "setRevealed:", v5);
}

- (void)_updateScrollViewContentSize
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  UIScrollView *v6;

  v6 = self->_scrollView;
  -[UIScrollView _setAutomaticContentOffsetAdjustmentEnabled:](v6, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
  v3 = -[SBHTodayIconListLayoutDelegate isVisuallyRevealed](self->_listLayoutDelegate, "isVisuallyRevealed");
  -[SBHTodayViewController stackViewToScrollViewBottomConstraint](self, "stackViewToScrollViewBottomConstraint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setActive:", 1);

    -[UIScrollView layoutIfNeeded](v6, "layoutIfNeeded");
  }
  else
  {
    objc_msgSend(v4, "setActive:", 0);

  }
}

- (void)_updateRevealStateAnimated:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  _BOOL4 v7;
  _BOOL4 v8;
  int v9;
  int IsOne;
  _BOOL4 v11;
  uint64_t v12;
  UIScrollView *v13;

  v3 = a3;
  v13 = self->_scrollView;
  -[UIScrollView contentOffset](v13, "contentOffset");
  -[SBHTodayIconListLayoutDelegate setRevealProgress:](self->_listLayoutDelegate, "setRevealProgress:", fmin(fmax(v5 / 60.0, 0.0), 1.0));
  -[UIScrollView contentOffset](v13, "contentOffset");
  -[SBHTodayIconListLayoutDelegate setDismissProgress:](self->_listLayoutDelegate, "setDismissProgress:", -fmin(fmax(v6 / 60.0, -1.0), 0.0));
  v7 = -[SBHTodayIconListLayoutDelegate isRevealed](self->_listLayoutDelegate, "isRevealed");
  v8 = -[SBHTodayIconListLayoutDelegate isVisuallyRevealed](self->_listLayoutDelegate, "isVisuallyRevealed");
  if (v7)
    v9 = 1;
  else
    v9 = BSFloatIsOne() ^ 1;
  IsOne = BSFloatIsOne();
  v11 = -[UIScrollView isDecelerating](v13, "isDecelerating");
  if (v7 && !IsOne || (v7 & IsOne ^ 1 | v11) == 1 && (v7 && v11 || !v11 && (v9 & (!v8 | IsOne)) != 1))
    v12 = 1;
  else
    v12 = -[SBHTodayViewController isEditing](self, "isEditing");
  -[SBHTodayViewController setVisuallyRevealed:animated:](self, "setVisuallyRevealed:animated:", v12, v3);

}

- (CGRect)_suggestedTodayViewFrameForBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGRect v24;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[SBHTodayViewController listLayoutProvider](self, "listLayoutProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBHTodayViewController iconLocation](self, "iconLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "layoutForIconLocation:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  SBHIconListLayoutIconImageInfoForGridSizeClass(v10, CFSTR("SBHIconGridSizeClassMedium"));
  v24.origin.x = x;
  v24.origin.y = y;
  v24.size.width = width;
  v24.size.height = height;
  CGRectGetHeight(v24);
  BSRectWithSize();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scale");
  UIRectCenteredIntegralRectScale();
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;

  v20 = v13;
  v21 = v15;
  v22 = v17;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (UIViewController)legacyWidgetListViewController
{
  return 0;
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[SBHTodayViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
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

  -[SBHTodayViewController descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)descriptionBuilderWithMultilinePrefix:(id)a3
{
  void *v4;
  void *v5;
  int64_t location;
  const __CFString *v7;
  const __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;

  -[SBHTodayViewController succinctDescriptionBuilder](self, "succinctDescriptionBuilder", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  location = self->_location;
  v7 = CFSTR("UNKNOWN SBHTodayViewControllerLOCATION");
  if (location == 2)
    v7 = CFSTR("SBHTodayViewControllerLocationCoverSheet");
  if (location == 1)
    v8 = CFSTR("SBHTodayViewControllerLocationLeftOfHome");
  else
    v8 = v7;
  v9 = (id)objc_msgSend(v4, "appendObject:withName:", v8, CFSTR("location"));
  SBHStringFromContentVisibility(-[SBIconListView contentVisibility](self->_listView, "contentVisibility"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v10, CFSTR("_listView contentVisibility"));

  SBHStringFromContentVisibility(-[SBHTodayViewController contentVisibility](self, "contentVisibility"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:withName:", v11, CFSTR("contentVisibility"));

  v12 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBHTodayViewController bs_isAppearingOrAppeared](self, "bs_isAppearingOrAppeared"), CFSTR("isAppearingOrAppeared"), 1);
  v13 = (id)objc_msgSend(v5, "appendBool:withName:ifEqualTo:", -[SBHTodayViewController bs_isDisappearingOrDisappeared](self, "bs_isDisappearingOrDisappeared"), CFSTR("isDisappearingOrDisappeared"), 1);
  v14 = (id)objc_msgSend(v5, "appendBool:withName:", -[SBHTodayViewController isSpotlightVisible](self, "isSpotlightVisible"), CFSTR("spotlightVisible"));
  if (-[SBHTodayViewController isOverridingViewControllerAppearanceStateToRemainDisappeared](self, "isOverridingViewControllerAppearanceStateToRemainDisappeared"))
  {
    v15 = (id)objc_msgSend(v5, "appendObject:withName:", self->_viewControllerAppearStateOverrideAssertions, CFSTR("_viewControllerAppearStateOverrideAssertions"));
  }
  if (-[SBHTodayViewController _isWidgetHitTestingDisabled](self, "_isWidgetHitTestingDisabled"))
    v16 = (id)objc_msgSend(v5, "appendBool:withName:", self->_widgetHitTestingDisabledReasons != 0, CFSTR("_widgetHitTestingDisabledReasons"));
  if (-[SBHTodayViewController _shouldKeepIconImageViewControllersStatic](self, "_shouldKeepIconImageViewControllersStatic"))
  {
    v17 = (id)objc_msgSend(v5, "appendObject:withName:", self->_keepStaticAssertions, CFSTR("_keepStaticAssertions"));
  }
  return v5;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (_UILegibilitySettings)overrideLegibilitySettings
{
  return self->_overrideLegibilitySettings;
}

- (unint64_t)contentVisibility
{
  return self->_contentVisibility;
}

- (SBRootFolder)rootFolder
{
  return self->_rootFolder;
}

- (SBHIconManager)iconManager
{
  return (SBHIconManager *)objc_loadWeakRetained((id *)&self->_iconManager);
}

- (void)setIconManager:(id)a3
{
  objc_storeWeak((id *)&self->_iconManager, a3);
}

- (SBHTodayViewControllerDelegate)delegate
{
  return (SBHTodayViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (SBFOverlayDismissalDelegate)dismissalDelegate
{
  return (SBFOverlayDismissalDelegate *)objc_loadWeakRetained((id *)&self->_dismissalDelegate);
}

- (void)setDismissalDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_dismissalDelegate, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (UIViewController)containerViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_containerViewController);
}

- (void)setContainerViewController:(id)a3
{
  objc_storeWeak((id *)&self->_containerViewController, a3);
}

- (void)setListView:(id)a3
{
  objc_storeStrong((id *)&self->_listView, a3);
}

- (SBIconListLayoutProvider)listLayoutProvider
{
  return self->_listLayoutProvider;
}

- (NSMapTable)onScreenIconIndexRangeByIconListView
{
  return self->_onScreenIconIndexRangeByIconListView;
}

- (BOOL)suppressesEditingStateForListViews
{
  return self->_suppressesEditingStateForListViews;
}

- (void)setSpotlightVisible:(BOOL)a3
{
  self->_spotlightVisible = a3;
}

- (NSString)iconLocation
{
  return self->_iconLocation;
}

- (void)setIconLocation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1096);
}

- (int64_t)location
{
  return self->_location;
}

- (UIScrollView)scrollView
{
  return self->_scrollView;
}

- (double)searchBarTopOffset
{
  return self->_searchBarTopOffset;
}

- (BOOL)isOverlayViewDisappearing
{
  return self->_isOverlayViewDisappearing;
}

- (void)setIsOverlayViewDisappearing:(BOOL)a3
{
  self->_isOverlayViewDisappearing = a3;
}

- (double)mostRecentPresentationProgress
{
  return self->_mostRecentPresentationProgress;
}

- (void)setMostRecentPresentationProgress:(double)a3
{
  self->_mostRecentPresentationProgress = a3;
}

- (SBIconViewProviding)iconViewProvider
{
  return (SBIconViewProviding *)objc_loadWeakRetained((id *)&self->_iconViewProvider);
}

- (void)setIconViewProvider:(id)a3
{
  objc_storeWeak((id *)&self->_iconViewProvider, a3);
}

- (SBHWidgetSettings)widgetSettings
{
  return self->_widgetSettings;
}

- (void)setWidgetSettings:(id)a3
{
  objc_storeStrong((id *)&self->_widgetSettings, a3);
}

- (NSMutableArray)scrollViewDidEndScrollingHandlers
{
  return self->_scrollViewDidEndScrollingHandlers;
}

- (void)setScrollViewDidEndScrollingHandlers:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewDidEndScrollingHandlers, a3);
}

- (SBHScrollableIconViewInteraction)scrollingInteraction
{
  return self->_scrollingInteraction;
}

- (void)setScrollingInteraction:(id)a3
{
  objc_storeStrong((id *)&self->_scrollingInteraction, a3);
}

- (UIStackView)stackView
{
  return self->_stackView;
}

- (void)setStackView:(id)a3
{
  objc_storeStrong((id *)&self->_stackView, a3);
}

- (NSLayoutConstraint)scrollViewLeadingConstraint
{
  return self->_scrollViewLeadingConstraint;
}

- (void)setScrollViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)scrollViewTrailingConstraint
{
  return self->_scrollViewTrailingConstraint;
}

- (void)setScrollViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_scrollViewTrailingConstraint, a3);
}

- (NSLayoutConstraint)listViewMinimumHeightConstraint
{
  return self->_listViewMinimumHeightConstraint;
}

- (void)setListViewMinimumHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_listViewMinimumHeightConstraint, a3);
}

- (NSLayoutConstraint)listViewMinimumWidthConstraint
{
  return self->_listViewMinimumWidthConstraint;
}

- (void)setListViewMinimumWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_listViewMinimumWidthConstraint, a3);
}

- (SBHTodayIconListLayoutDelegate)listLayoutDelegate
{
  return self->_listLayoutDelegate;
}

- (void)setListLayoutDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_listLayoutDelegate, a3);
}

- (UIView)carouselReferenceForLegacyWidgetListView
{
  return self->_carouselReferenceForLegacyWidgetListView;
}

- (void)setCarouselReferenceForLegacyWidgetListView:(id)a3
{
  objc_storeStrong((id *)&self->_carouselReferenceForLegacyWidgetListView, a3);
}

- (UIView)legacyListContainerView
{
  return self->_legacyListContainerView;
}

- (void)setLegacyListContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_legacyListContainerView, a3);
}

- (MTMaterialView)legacyListPlatterView
{
  return self->_legacyListPlatterView;
}

- (void)setLegacyListPlatterView:(id)a3
{
  objc_storeStrong((id *)&self->_legacyListPlatterView, a3);
}

- (NSMutableDictionary)cancelTouchesAssertionsByLegacyWidgetID
{
  return self->_cancelTouchesAssertionsByLegacyWidgetID;
}

- (void)setCancelTouchesAssertionsByLegacyWidgetID:(id)a3
{
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByLegacyWidgetID, a3);
}

- (NSMutableDictionary)cancelTouchesAssertionsByWidgetID
{
  return self->_cancelTouchesAssertionsByWidgetID;
}

- (void)setCancelTouchesAssertionsByWidgetID:(id)a3
{
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByWidgetID, a3);
}

- (SBFTouchPassThroughView)spotlightContainerView
{
  return self->_spotlightContainerView;
}

- (void)setSpotlightContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_spotlightContainerView, a3);
}

- (NSLayoutConstraint)stackViewToScrollViewTopConstraint
{
  return self->_stackViewToScrollViewTopConstraint;
}

- (NSLayoutConstraint)stackViewToScrollViewBottomConstraint
{
  return self->_stackViewToScrollViewBottomConstraint;
}

- (NSLayoutConstraint)stackViewToScrollViewLeadingConstraint
{
  return self->_stackViewToScrollViewLeadingConstraint;
}

- (void)setStackViewToScrollViewLeadingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewToScrollViewLeadingConstraint, a3);
}

- (NSLayoutConstraint)stackViewToScrollViewTrailingConstraint
{
  return self->_stackViewToScrollViewTrailingConstraint;
}

- (void)setStackViewToScrollViewTrailingConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_stackViewToScrollViewTrailingConstraint, a3);
}

- (NSMutableSet)suspendVisibleRowRangeUpdatesReasons
{
  return self->_suspendVisibleRowRangeUpdatesReasons;
}

- (void)setSuspendVisibleRowRangeUpdatesReasons:(id)a3
{
  objc_storeStrong((id *)&self->_suspendVisibleRowRangeUpdatesReasons, a3);
}

- (NSMutableSet)widgetHitTestingDisabledReasons
{
  return self->_widgetHitTestingDisabledReasons;
}

- (void)setWidgetHitTestingDisabledReasons:(id)a3
{
  objc_storeStrong((id *)&self->_widgetHitTestingDisabledReasons, a3);
}

- (double)firstWidgetTopOffset
{
  return self->_firstWidgetTopOffset;
}

- (double)widgetsLeadingOffset
{
  return self->_widgetsLeadingOffset;
}

- (BOOL)widgetsAreCenteredForFullScreen
{
  return self->_widgetsAreCenteredForFullScreen;
}

- (NSHashTable)viewControllerAppearStateOverrideAssertions
{
  return self->_viewControllerAppearStateOverrideAssertions;
}

- (void)setViewControllerAppearStateOverrideAssertions:(id)a3
{
  objc_storeStrong((id *)&self->_viewControllerAppearStateOverrideAssertions, a3);
}

- (BOOL)enableEditingModeWhenScrollEnds
{
  return self->_enableEditingModeWhenScrollEnds;
}

- (void)setEnableEditingModeWhenScrollEnds:(BOOL)a3
{
  self->_enableEditingModeWhenScrollEnds = a3;
}

- (CGPoint)scrollingBeginningOffset
{
  double x;
  double y;
  CGPoint result;

  x = self->_scrollingBeginningOffset.x;
  y = self->_scrollingBeginningOffset.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setScrollingBeginningOffset:(CGPoint)a3
{
  self->_scrollingBeginningOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewControllerAppearStateOverrideAssertions, 0);
  objc_storeStrong((id *)&self->_widgetHitTestingDisabledReasons, 0);
  objc_storeStrong((id *)&self->_suspendVisibleRowRangeUpdatesReasons, 0);
  objc_storeStrong((id *)&self->_stackViewToScrollViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewToScrollViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewToScrollViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_stackViewToScrollViewTopConstraint, 0);
  objc_storeStrong((id *)&self->_spotlightContainerView, 0);
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByWidgetID, 0);
  objc_storeStrong((id *)&self->_cancelTouchesAssertionsByLegacyWidgetID, 0);
  objc_storeStrong((id *)&self->_legacyListPlatterView, 0);
  objc_storeStrong((id *)&self->_legacyListContainerView, 0);
  objc_storeStrong((id *)&self->_carouselReferenceForLegacyWidgetListView, 0);
  objc_storeStrong((id *)&self->_listLayoutDelegate, 0);
  objc_storeStrong((id *)&self->_listViewMinimumWidthConstraint, 0);
  objc_storeStrong((id *)&self->_listViewMinimumHeightConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewTrailingConstraint, 0);
  objc_storeStrong((id *)&self->_scrollViewLeadingConstraint, 0);
  objc_storeStrong((id *)&self->_stackView, 0);
  objc_storeStrong((id *)&self->_scrollingInteraction, 0);
  objc_storeStrong((id *)&self->_scrollViewDidEndScrollingHandlers, 0);
  objc_storeStrong((id *)&self->_widgetSettings, 0);
  objc_destroyWeak((id *)&self->_iconViewProvider);
  objc_storeStrong((id *)&self->_scrollView, 0);
  objc_storeStrong((id *)&self->_iconLocation, 0);
  objc_storeStrong((id *)&self->_onScreenIconIndexRangeByIconListView, 0);
  objc_storeStrong((id *)&self->_listLayoutProvider, 0);
  objc_storeStrong((id *)&self->_listView, 0);
  objc_destroyWeak((id *)&self->_containerViewController);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_destroyWeak((id *)&self->_dismissalDelegate);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_iconManager);
  objc_storeStrong((id *)&self->_rootFolder, 0);
  objc_storeStrong((id *)&self->_overrideLegibilitySettings, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_stateCapture, 0);
  objc_storeStrong((id *)&self->_keepStaticAssertions, 0);
  objc_storeStrong((id *)&self->_iconViewsForbiddenFromEditing, 0);
}

@end
