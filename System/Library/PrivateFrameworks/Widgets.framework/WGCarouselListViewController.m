@implementation WGCarouselListViewController

- (WGCarouselListViewController)initWithWidgetDiscoveryController:(id)a3 listSettings:(WGWidgetListSettings)a4
{
  uint64_t v4;
  unint64_t carouselEdges;
  id v7;
  WGCarouselListViewController *v8;
  WGCarouselListViewController *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id sizeChangeObserver;
  WGCarouselListViewController *v15;
  _QWORD v17[4];
  id v18;
  id location;
  objc_super v20;

  v4 = *(_QWORD *)&a4.useFavorites;
  carouselEdges = a4.carouselEdges;
  v7 = a3;
  v20.receiver = self;
  v20.super_class = (Class)WGCarouselListViewController;
  v8 = -[WGWidgetListViewController initWithWidgetDiscoveryController:](&v20, sel_initWithWidgetDiscoveryController_, v7);
  v9 = v8;
  if (v8)
  {
    v8->_listSettings.carouselEdges = carouselEdges;
    *(_QWORD *)&v8->_listSettings.useFavorites = v4;
    objc_initWeak(&location, v8);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1710], "mainQueue");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *MEMORY[0x24BDF7670];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __79__WGCarouselListViewController_initWithWidgetDiscoveryController_listSettings___block_invoke;
    v17[3] = &unk_24D731CB0;
    objc_copyWeak(&v18, &location);
    objc_msgSend(v10, "addObserverForName:object:queue:usingBlock:", v12, 0, v11, v17);
    v13 = objc_claimAutoreleasedReturnValue();
    sizeChangeObserver = v9->_sizeChangeObserver;
    v9->_sizeChangeObserver = (id)v13;

    v15 = v9;
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

  return v9;
}

void __79__WGCarouselListViewController_initWithWidgetDiscoveryController_listSettings___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setCachedThresholds:", 0);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self->_sizeChangeObserver);

  v4.receiver = self;
  v4.super_class = (Class)WGCarouselListViewController;
  -[WGWidgetListViewController dealloc](&v4, sel_dealloc);
}

- (void)_repopulateStackViewWithWidgetIdentifiers:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)WGCarouselListViewController;
  -[WGMajorListViewController _repopulateStackViewWithWidgetIdentifiers:](&v6, sel__repopulateStackViewWithWidgetIdentifiers_, a3);
  -[UIStackView arrangedSubviews](self->super.super._stackView, "arrangedSubviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
    -[WGCarouselListViewController _updateTeachingViewVisibilityAnimated:withCompletion:](self, "_updateTeachingViewVisibilityAnimated:withCompletion:", 0, 0);
  -[WGWidgetListViewController _didUpdateStackViewArrangedSubviews](self, "_didUpdateStackViewArrangedSubviews");
}

- (unint64_t)_insertionIndexofListItem:(id)a3 intoWidgetViews:(id)a4 withOrderedIdentifiers:(id)a5
{
  unint64_t v6;
  void *v7;
  void *v8;
  BOOL v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WGCarouselListViewController;
  v6 = -[WGMajorListViewController _insertionIndexofListItem:intoWidgetViews:withOrderedIdentifiers:](&v11, sel__insertionIndexofListItem_intoWidgetViews_withOrderedIdentifiers_, a3, a4, a5);
  -[UIStackView arrangedSubviews](self->super.super._stackView, "arrangedSubviews");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (self->_teachingView)
  {
    if (objc_msgSend(v7, "containsObject:"))
      v9 = v6 == 1;
    else
      v9 = 0;
    if (v9)
    {
      if ((unint64_t)objc_msgSend(v8, "count") <= 1)
        v6 = 1;
      else
        v6 = 2;
    }
  }

  return v6;
}

- (NSMutableDictionary)catchupTimers
{
  NSMutableDictionary *catchupTimers;
  NSMutableDictionary *v4;
  NSMutableDictionary *v5;

  catchupTimers = self->_catchupTimers;
  if (!catchupTimers)
  {
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v5 = self->_catchupTimers;
    self->_catchupTimers = v4;

    catchupTimers = self->_catchupTimers;
  }
  return catchupTimers;
}

- (id)extraViews
{
  void *v3;
  WGWidgetPinningTeachingView *teachingView;
  void *v5;
  char IsZero;
  void *v8;
  void *v9;
  char isKindOfClass;
  _BOOL8 v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)WGCarouselListViewController;
  -[WGMajorListViewController extraViews](&v12, sel_extraViews);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  teachingView = self->_teachingView;
  if (!teachingView)
    return v3;
  -[WGWidgetPinningTeachingView contentView](teachingView, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "alpha");
  IsZero = BSFloatIsZero();

  if ((IsZero & 1) != 0)
    return v3;
  v8 = (void *)objc_msgSend(v3, "mutableCopy");
  v11 = 0;
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(v8, "firstObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
      v11 = 1;
  }
  objc_msgSend(v8, "insertObject:atIndex:", self->_teachingView, v11);

  return v8;
}

- (BOOL)shouldAnimateFirstTwoViewsAsOne
{
  int v3;
  WGWidgetPinningTeachingView *teachingView;
  void *v5;
  WGWidgetPinningTeachingView *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WGCarouselListViewController;
  if (-[WGMajorListViewController shouldAnimateFirstTwoViewsAsOne](&v9, sel_shouldAnimateFirstTwoViewsAsOne))
  {
    LOBYTE(v3) = 1;
  }
  else
  {
    teachingView = self->_teachingView;
    if (teachingView)
    {
      -[WGCarouselListViewController extraViews](self, "extraViews");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "firstObject");
      v6 = (WGWidgetPinningTeachingView *)objc_claimAutoreleasedReturnValue();
      if (teachingView == v6)
      {
        -[WGWidgetPinningTeachingView contentView](self->_teachingView, "contentView");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "alpha");
        v3 = BSFloatIsOne() ^ 1;

      }
      else
      {
        LOBYTE(v3) = 0;
      }

    }
    else
    {
      LOBYTE(v3) = 0;
    }
  }
  return v3;
}

- (void)viewDidLoad
{
  _BOOL8 v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)WGCarouselListViewController;
  -[WGWidgetListViewController viewDidLoad](&v5, sel_viewDidLoad);
  -[WGCarouselListViewController _updateTeachingViewVisibilityAnimated:withCompletion:](self, "_updateTeachingViewVisibilityAnimated:withCompletion:", 0, 0);
  if (self->_listSettings.useFavorites)
    v3 = -[WGWidgetDiscoveryController areWidgetsPinned](self->super.super._discoveryController, "areWidgetsPinned")
      || -[WGWidgetDiscoveryController alwaysShowsFavoriteWidgets](self->super.super._discoveryController, "alwaysShowsFavoriteWidgets");
  else
    v3 = 0;
  -[WGCarouselListViewController setRevealed:](self, "setRevealed:", v3);
  -[WGCarouselListViewController setRevealed:](self, "setRevealed:", v3 ^ 1);
  -[WGCarouselListViewController setVisuallyRevealed:](self, "setVisuallyRevealed:", v3);
  -[WGCarouselListViewController setVisuallyRevealed:](self, "setVisuallyRevealed:", v3 ^ 1);
  if ((self->_listSettings.carouselEdges & 4) != 0)
  {
    -[WGMajorListViewController footerView](self, "footerView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setShouldSizeContent:", 0);

  }
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGCarouselListViewController;
  -[WGMajorListViewController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[WGCarouselListViewController setCachedThresholds:](self, "setCachedThresholds:", 0);
  -[WGCarouselListViewController updateCarouselAndRevealState](self, "updateCarouselAndRevealState");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGCarouselListViewController;
  -[WGMajorListViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[WGWidgetPinningTeachingView startAnimating](self->_teachingView, "startAnimating");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGCarouselListViewController;
  -[WGMajorListViewController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[WGWidgetPinningTeachingView stopAnimating](self->_teachingView, "stopAnimating");
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)WGCarouselListViewController;
  -[WGCarouselListViewController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[WGCarouselListViewController setCachedThresholds:](self, "setCachedThresholds:", 0);
  if (-[WGCarouselListViewController _appearState](self, "_appearState"))
    -[WGCarouselListViewController updateCarouselAndRevealState](self, "updateCarouselAndRevealState");
}

- (void)setListSettings:(WGWidgetListSettings)a3
{
  uint64_t v3;
  unint64_t carouselEdges;
  WGWidgetListSettings *p_listSettings;

  v3 = *(_QWORD *)&a3.useFavorites;
  carouselEdges = a3.carouselEdges;
  p_listSettings = &self->_listSettings;
  if (!WGWidgetListSettingsEqualsToWidgetListSettings(self->_listSettings.carouselEdges, *(_QWORD *)&self->_listSettings.useFavorites, a3.carouselEdges, *(uint64_t *)&a3.useFavorites))
  {
    p_listSettings->carouselEdges = carouselEdges;
    *(_QWORD *)&p_listSettings->useFavorites = v3;
    -[WGCarouselListViewController updateCarouselAndRevealState](self, "updateCarouselAndRevealState");
  }
}

- (void)setRevealed:(BOOL)a3
{
  _BOOL8 v3;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  if (self->_revealed != a3)
  {
    v3 = a3;
    v5 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
      -[WGCarouselListViewController setRevealed:].cold.1(v3, v5, v6, v7, v8, v9, v10, v11);
    self->_revealed = v3;
    -[WGWidgetListViewController widgetListView](self, "widgetListView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    v16 = v15;
    v17 = *MEMORY[0x24BDBF148];
    v18 = *(double *)(MEMORY[0x24BDBF148] + 8);

    if (v17 != v14 || v18 != v16)
      -[WGCarouselListViewController _updateScrollViewContentSize](self, "_updateScrollViewContentSize");
  }
}

- (void)setVisuallyRevealed:(BOOL)a3
{
  -[WGCarouselListViewController setVisuallyRevealed:withSlowAnimation:](self, "setVisuallyRevealed:withSlowAnimation:", a3, 0);
}

- (void)setVisuallyRevealed:(BOOL)a3 withSlowAnimation:(BOOL)a4
{
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  char isKindOfClass;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  void *v26;
  double v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  unint64_t v34;
  unsigned __int8 *p_visuallyRevealed;
  id obj;
  _QWORD v38[5];
  id v39;
  BOOL v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  p_visuallyRevealed = (unsigned __int8 *)&self->_visuallyRevealed;
  if (self->_visuallyRevealed != a3)
  {
    *p_visuallyRevealed = a3;
    v5 = WGLogWidgets;
    if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
      -[WGCarouselListViewController setVisuallyRevealed:withSlowAnimation:].cold.1((uint64_t)p_visuallyRevealed, v5, v6, v7, v8, v9, v10, v11);
    v34 = -[WGCarouselListViewController _indexOfFirstNonFavoritedWidgetInStackView](self, "_indexOfFirstNonFavoritedWidgetInStackView");
    -[UIStackView arrangedSubviews](self->super.super._stackView, "arrangedSubviews");
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v42;
      v33 = *MEMORY[0x24BDBCB80];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v42 != v14)
            objc_enumerationMutation(obj);
          v16 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_opt_class();
          isKindOfClass = objc_opt_isKindOfClass();
          objc_opt_class();
          v18 = objc_opt_isKindOfClass();
          if ((isKindOfClass & 1) != 0 || (v18 & 1) != 0)
          {
            -[WGCarouselListViewController _identifierForCell:](self, "_identifierForCell:", v16);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            -[WGCarouselListViewController catchupTimers](self, "catchupTimers");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "objectForKey:", v19);
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v21, "invalidate");
            -[WGCarouselListViewController catchupTimers](self, "catchupTimers");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v22, "removeObjectForKey:", v19);

            -[UIStackView arrangedSubviews](self->super.super._stackView, "arrangedSubviews");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v23, "indexOfObject:", v16);

            v25 = pow(0.9, (double)(v24 - v34)) * 0.05 * (double)(v24 - v34);
            v26 = (void *)MEMORY[0x24BDBCF40];
            if (*p_visuallyRevealed)
              v27 = v25;
            else
              v27 = 0.0;
            v38[0] = MEMORY[0x24BDAC760];
            v38[1] = 3221225472;
            v38[2] = __70__WGCarouselListViewController_setVisuallyRevealed_withSlowAnimation___block_invoke;
            v38[3] = &unk_24D731D00;
            v40 = a4;
            v38[4] = self;
            v39 = v19;
            v28 = v19;
            objc_msgSend(v26, "timerWithTimeInterval:repeats:block:", 0, v38, v27);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            -[WGCarouselListViewController catchupTimers](self, "catchupTimers");
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "setObject:forKey:", v29, v28);

            objc_msgSend(MEMORY[0x24BDBCF18], "mainRunLoop");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "addTimer:forMode:", v29, v33);

          }
        }
        v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v13);
    }
    -[WGCarouselListViewController _updateScrollViewContentSize](self, "_updateScrollViewContentSize");

  }
  -[WGWidgetListViewController widgetListView](self, "widgetListView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v32, "isTracking") & 1) == 0)
    -[WGCarouselListViewController setRevealed:](self, "setRevealed:", *p_visuallyRevealed);

}

void __70__WGCarouselListViewController_setVisuallyRevealed_withSlowAnimation___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  double v14;

  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(void **)(a1 + 40);
  if (*(_BYTE *)(v4 + 1137))
    v6 = 0.0;
  else
    v6 = 1.0;
  v7 = dbl_21732B920[*(_BYTE *)(a1 + 48) == 0];
  v8 = (void *)MEMORY[0x24BDF6F90];
  if (*(_BYTE *)(a1 + 48))
    v9 = 12.52;
  else
    v9 = 24.0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __70__WGCarouselListViewController_setVisuallyRevealed_withSlowAnimation___block_invoke_2;
  v12[3] = &unk_24D731CD8;
  v12[4] = v4;
  v13 = v5;
  v14 = v6;
  v10 = a2;
  objc_msgSend(v8, "_animateUsingSpringWithTension:friction:interactive:animations:completion:", 0, v12, 0, v7, v9);
  objc_msgSend(v10, "invalidate");

  objc_msgSend(*(id *)(a1 + 32), "catchupTimers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", *(_QWORD *)(a1 + 40));

}

void __70__WGCarouselListViewController_setVisuallyRevealed_withSlowAnimation___block_invoke_2(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1160), "objectForKey:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    objc_msgSend(v2, "setValue:", *(double *)(a1 + 48));
    v2 = v3;
  }

}

- (void)_updateScrollViewContentSize
{
  _BOOL4 visuallyRevealed;
  void *v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  if (-[WGWidgetListViewController shouldIncludeScrollView](self, "shouldIncludeScrollView"))
  {
    -[WGWidgetListViewController widgetListView](self, "widgetListView");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_setAutomaticContentOffsetAdjustmentEnabled:", 0);
    visuallyRevealed = self->_visuallyRevealed;
    -[WGWidgetListViewController stackViewBottomConstraint](self, "stackViewBottomConstraint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (visuallyRevealed)
    {
      objc_msgSend(v4, "setActive:", 1);

      -[UIStackView layoutIfNeeded](self->super.super._stackView, "layoutIfNeeded");
    }
    else
    {
      objc_msgSend(v4, "setActive:", 0);

      objc_msgSend(v8, "frame");
      objc_msgSend(v8, "setContentSize:", v6, v7);
    }
  }
  else
  {
    -[WGWidgetListViewController stackViewBottomConstraint](self, "stackViewBottomConstraint");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActive:", 1);
  }

}

- (void)setContainerView:(id)a3
{
  id v4;
  id v5;
  objc_super v6;

  v4 = a3;
  -[WGMajorListViewController containerView](self, "containerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)WGCarouselListViewController;
  -[WGMajorListViewController setContainerView:](&v6, sel_setContainerView_, v4);

  if (v5 != v4)
    -[WGCarouselListViewController setCachedThresholds:](self, "setCachedThresholds:", 0);

}

- (BOOL)headerVisible
{
  void *v2;
  void *v3;
  char v4;

  -[WGMajorListViewController headerView](self, "headerView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alpha");
  v4 = BSFloatIsZero() ^ 1;

  return v4;
}

- (void)setHeaderVisible:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  BOOL v10;
  objc_super v11;

  v3 = a3;
  -[WGMajorListViewController headerView](self, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = -[WGCarouselListViewController headerVisible](self, "headerVisible");
  v11.receiver = self;
  v11.super_class = (Class)WGCarouselListViewController;
  -[WGMajorListViewController setHeaderVisible:](&v11, sel_setHeaderVisible_, v3);
  if ((_DWORD)v5 != v3)
  {
    v7 = (void *)MEMORY[0x24BDF6F90];
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __49__WGCarouselListViewController_setHeaderVisible___block_invoke;
    v8[3] = &unk_24D731D28;
    v9 = v6;
    v10 = v3;
    objc_msgSend(v7, "animateWithDuration:delay:options:animations:completion:", 4, v8, 0, 0.3, 0.0);

  }
}

uint64_t __49__WGCarouselListViewController_setHeaderVisible___block_invoke(uint64_t a1)
{
  double v1;

  v1 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v1 = 0.0;
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v1);
}

- (void)setFooterVisible:(BOOL)a3
{
  _QWORD v3[5];
  BOOL v4;

  if (self->_footerVisible != a3)
  {
    self->_footerVisible = a3;
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 3221225472;
    v3[2] = __49__WGCarouselListViewController_setFooterVisible___block_invoke;
    v3[3] = &unk_24D731D28;
    v3[4] = self;
    v4 = a3;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:delay:options:animations:completion:", 4, v3, 0, 0.3, 0.0);
  }
}

void __49__WGCarouselListViewController_setFooterVisible___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  double v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "footerView");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "contentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  v4 = 1.0;
  if (!*(_BYTE *)(a1 + 40))
    v4 = 0.0;
  objc_msgSend(v2, "setAlpha:", v4);

}

- (void)setEditingIcons:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (-[WGWidgetListViewController isEditingIcons](self, "isEditingIcons") != a3)
  {
    if (v3)
    {
      -[WGCarouselListViewController setVisuallyRevealedPriorToEditingIcons:](self, "setVisuallyRevealedPriorToEditingIcons:", -[WGCarouselListViewController isVisuallyRevealed](self, "isVisuallyRevealed"));
    }
    else if (!-[WGCarouselListViewController visuallyRevealedPriorToEditingIcons](self, "visuallyRevealedPriorToEditingIcons"))
    {
      -[WGWidgetListViewController widgetListView](self, "widgetListView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setContentOffset:animated:", 1, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));

      v5 = 0;
      goto LABEL_7;
    }
    v5 = 1;
LABEL_7:
    -[WGCarouselListViewController setVisuallyRevealed:](self, "setVisuallyRevealed:", v5);
    v7.receiver = self;
    v7.super_class = (Class)WGCarouselListViewController;
    -[WGMajorListViewController setEditingIcons:](&v7, sel_setEditingIcons_, v3);
  }
}

- (void)scrollViewDidScroll:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)WGCarouselListViewController;
  -[WGMajorListViewController scrollViewDidScroll:](&v4, sel_scrollViewDidScroll_, a3);
  -[WGCarouselListViewController updateCarouselAndRevealState](self, "updateCarouselAndRevealState");
}

- (void)updateCarouselAndRevealState
{
  -[WGCarouselListViewController _updateCarouselEffect](self, "_updateCarouselEffect");
  if (self->_listSettings.useFavorites)
    -[WGCarouselListViewController _updateRevealState](self, "_updateRevealState");
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  void *v10;
  NSObject *v11;
  _BOOL4 v12;
  _BOOL4 v13;
  double v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  unint64_t v21;
  void *v22;
  void *v23;
  NSObject *v24;
  __int128 v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  CGFloat v34;
  double v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  objc_super v40;
  uint8_t buf[32];
  _BYTE v42[20];
  uint64_t v43;

  y = a4.y;
  x = a4.x;
  v43 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v40.receiver = self;
  v40.super_class = (Class)WGCarouselListViewController;
  -[WGWidgetListViewController scrollViewWillEndDragging:withVelocity:targetContentOffset:](&v40, sel_scrollViewWillEndDragging_withVelocity_targetContentOffset_, v9, a5, x, y);
  v10 = (void *)WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEFAULT))
  {
    v11 = v10;
    v12 = -[WGCarouselListViewController isRevealed](self, "isRevealed");
    v13 = -[WGCarouselListViewController isVisuallyRevealed](self, "isVisuallyRevealed");
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)&buf[4] = v12;
    *(_WORD *)&buf[8] = 1024;
    *(_DWORD *)&buf[10] = v13;
    _os_log_impl(&dword_2172E1000, v11, OS_LOG_TYPE_DEFAULT, "Carousel scrollview will end dragging isRevealed: %{BOOL}d isVisuallyRevealed: %{BOOL}d", buf, 0xEu);

  }
  if (-[WGCarouselListViewController isRevealed](self, "isRevealed")
    || !-[WGCarouselListViewController isVisuallyRevealed](self, "isVisuallyRevealed"))
  {
    if (-[WGCarouselListViewController isRevealed](self, "isRevealed")
      && !-[WGCarouselListViewController isVisuallyRevealed](self, "isVisuallyRevealed"))
    {
      -[WGCarouselListViewController setRevealed:](self, "setRevealed:", 0);
    }
  }
  else
  {
    -[WGCarouselListViewController setRevealed:](self, "setRevealed:", 1);
    if (-[WGCarouselListViewController _hasEnoughContentToScroll](self, "_hasEnoughContentToScroll"))
    {
      objc_msgSend(v9, "contentOffset");
      v15 = -[WGCarouselListViewController _indexForNextCellAfterContentOffset:](self, "_indexForNextCellAfterContentOffset:", v14);
      v16 = -[WGCarouselListViewController _indexForNextCellAfterContentOffset:](self, "_indexForNextCellAfterContentOffset:", a5->y);
      objc_msgSend(v9, "panGestureRecognizer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "velocityInView:", v9);
      v19 = v18;

      v20 = fmin(fmax(v19 / -15000.0, 0.0), 1.0);
      v21 = vcvtad_u64_f64(pow(v20, 3.0) * (double)(v16 - v15) + (double)v15);
      -[UIStackView arrangedSubviews](self->super.super._stackView, "arrangedSubviews");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v22, "count") <= v21)
      {
        v23 = 0;
      }
      else
      {
        objc_msgSend(v22, "objectAtIndex:", v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
      }
      v24 = WGLogWidgets;
      if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134219008;
        *(double *)&buf[4] = v19;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v20;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = v15;
        *(_WORD *)v42 = 2048;
        *(_QWORD *)&v42[2] = v16;
        *(_WORD *)&v42[10] = 2048;
        *(_QWORD *)&v42[12] = v21;
        _os_log_debug_impl(&dword_2172E1000, v24, OS_LOG_TYPE_DEBUG, "gestureVelocity: %.2f normalizedVelocity: %.2f indexForCurrentContentOffset %lu indexForTargetContentOffset %lu, targetIndex %lu", buf, 0x34u);
        if (v23)
        {
LABEL_14:
          *(_OWORD *)v42 = 0u;
          memset(buf, 0, sizeof(buf));
          objc_msgSend(v23, "transform");
          v25 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
          v37 = *MEMORY[0x24BDBD8B8];
          v38 = v25;
          v39 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
          objc_msgSend(v23, "setTransform:", &v37);
          objc_msgSend(v23, "frame");
          v27 = v26;
          v29 = v28;
          objc_msgSend(v9, "contentSize");
          v31 = v30;
          objc_msgSend(v9, "bounds");
          if (v19 < 0.0 && v29 < v31 - v32)
          {
            objc_msgSend(v9, "contentOffset");
            a5->x = v33;
            a5->y = v34;
            objc_msgSend(v9, "contentOffset");
            smoothDecelerationAnimation(fmin(-v19 / (v29 - v35), 15.0));
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v9, "_setContentOffset:animated:animationCurve:animationAdjustsForContentOffsetDelta:animation:", 1, 3, 0, v36, v27, v29);

          }
          v37 = *(_OWORD *)buf;
          v38 = *(_OWORD *)&buf[16];
          v39 = *(_OWORD *)v42;
          objc_msgSend(v23, "setTransform:", &v37);
        }
      }
      else if (v23)
      {
        goto LABEL_14;
      }

    }
  }

}

- (void)scrollViewDidChangeAdjustedContentInset:(id)a3
{
  -[WGCarouselListViewController setCachedThresholds:](self, "setCachedThresholds:", 0);
}

- (id)_newCatchupPropertyForCell:(id)a3
{
  id v4;
  _BOOL4 v5;
  double v6;

  v4 = objc_alloc_init(MEMORY[0x24BDF6FA0]);
  v5 = -[WGCarouselListViewController isRevealed](self, "isRevealed");
  v6 = 1.0;
  if (v5)
    v6 = 0.0;
  objc_msgSend(v4, "setValue:", v6);
  return v4;
}

- (void)_createPropertiesForStackViewUpdate
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableDictionary *catchupProperties;
  NSMutableDictionary *v9;
  NSMutableDictionary *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)WGCarouselListViewController;
  -[WGWidgetListViewController _createPropertiesForStackViewUpdate](&v15, sel__createPropertiesForStackViewUpdate);
  if (self->_listSettings.useFavorites)
  {
    if (-[NSMutableDictionary count](self->_catchupProperties, "count"))
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      -[NSMutableDictionary allValues](self->_catchupProperties, "allValues", 0);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      if (v4)
      {
        v5 = v4;
        v6 = *(_QWORD *)v12;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v12 != v6)
              objc_enumerationMutation(v3);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v7++), "invalidate");
          }
          while (v5 != v7);
          v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
        }
        while (v5);
      }

      catchupProperties = self->_catchupProperties;
      self->_catchupProperties = 0;

    }
    if (!self->_catchupProperties)
    {
      v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v10 = self->_catchupProperties;
      self->_catchupProperties = v9;

    }
  }
}

- (id)_animatablePropertiesForStackViewUpdate
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  objc_super v14;

  v3 = (void *)MEMORY[0x24BDBCEB8];
  v14.receiver = self;
  v14.super_class = (Class)WGCarouselListViewController;
  -[WGWidgetListViewController _animatablePropertiesForStackViewUpdate](&v14, sel__animatablePropertiesForStackViewUpdate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "arrayWithArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIStackView arrangedSubviews](self->super.super._stackView, "arrangedSubviews");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __71__WGCarouselListViewController__animatablePropertiesForStackViewUpdate__block_invoke;
  v12[3] = &unk_24D731D50;
  v12[4] = self;
  v7 = v5;
  v13 = v7;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v12);
  v8 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
    -[WGCarouselListViewController _animatablePropertiesForStackViewUpdate].cold.1((uint64_t)self, v8);
  v9 = v13;
  v10 = v7;

  return v10;
}

void __71__WGCarouselListViewController__animatablePropertiesForStackViewUpdate__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  _BYTE *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(*(id *)(a1 + 32), "_identifierForCell:", v7);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_BYTE **)(a1 + 32);
    if (v4[1200])
    {
      v5 = (void *)objc_msgSend(v4, "_newCatchupPropertyForCell:", v7);
      objc_msgSend(*(id *)(a1 + 32), "catchupProperties");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKey:", v5, v3);

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);
    }

  }
}

- (void)_stackViewArrangedSubviewsTransformPresentationValueChanged
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  $ED191FA5279C67AC4BE6375188FD581F *p_responderFlags;
  unint64_t v8;
  uint64_t v9;
  void *v10;
  char isKindOfClass;
  char v12;
  void *v13;
  void *v14;
  uint64_t v15;
  unint64_t v16;
  $ED191FA5279C67AC4BE6375188FD581F *v17;
  void *v18;
  void *v19;
  __int128 v20;
  void *v21;
  void *v22;
  double v23;
  uint64_t v24;
  CGAffineTransform v25;
  CGAffineTransform v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  -[UIStackView arrangedSubviews](self->super.super._stackView, "arrangedSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v28;
    p_responderFlags = &self->super.super.super.super._responderFlags;
    v8 = 0x24D730000uLL;
    do
    {
      v9 = 0;
      v24 = v5;
      do
      {
        if (*(_QWORD *)v28 != v6)
          objc_enumerationMutation(v3);
        v10 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v9);
        objc_opt_class();
        isKindOfClass = objc_opt_isKindOfClass();
        objc_opt_class();
        v12 = objc_opt_isKindOfClass();
        if ((isKindOfClass & 1) != 0 || (v12 & 1) != 0)
        {
          if (p_responderFlags[298])
          {
            if ((isKindOfClass & 1) == 0)
              goto LABEL_12;
            objc_msgSend(v10, "platterView");
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v13, "listItem");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "widgetIdentifier");
            v15 = v6;
            v16 = v8;
            v17 = p_responderFlags;
            v18 = v3;
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            LODWORD(v13) = -[WGWidgetDiscoveryController isElementWithIdentifierFavorited:](self->super.super._discoveryController, "isElementWithIdentifierFavorited:", v19);
            v3 = v18;
            p_responderFlags = v17;
            v8 = v16;
            v6 = v15;
            v5 = v24;
            if ((_DWORD)v13)
            {
              v20 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
              *(_OWORD *)&v26.a = *MEMORY[0x24BDBD8B8];
              *(_OWORD *)&v26.c = v20;
              *(_OWORD *)&v26.tx = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
              objc_msgSend(v10, "setTransform:", &v26);
            }
            else
            {
LABEL_12:
              -[WGCarouselListViewController _identifierForCell:](self, "_identifierForCell:", v10);
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              -[NSMutableDictionary objectForKey:](self->_catchupProperties, "objectForKey:", v21);
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              memset(&v26, 0, sizeof(v26));
              objc_msgSend(v22, "presentationValue");
              CGAffineTransformMakeTranslation(&v26, 0.0, v23 * 160.0);
              v25 = v26;
              objc_msgSend(v10, "setTransform:", &v25);

            }
          }
          -[WGWidgetListViewController _resizeCell:](self, "_resizeCell:", v10);
        }
        ++v9;
      }
      while (v5 != v9);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v5);
  }
  -[UIStackView layoutIfNeeded](self->super.super._stackView, "layoutIfNeeded");
  -[WGCarouselListViewController _updateCarouselEffect](self, "_updateCarouselEffect");

}

- (void)_updateCarouselEffect
{
  _QWORD *v2;
  _DWORD *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  OUTLINED_FUNCTION_2_0(a1, a2);
  OUTLINED_FUNCTION_5();
  *v3 = 134217984;
  *v2 = v5;
  OUTLINED_FUNCTION_1_1(&dword_2172E1000, v6, v7, "setting alpha to %.2f because not revealed");

  OUTLINED_FUNCTION_4_0();
}

uint64_t __53__WGCarouselListViewController__updateCarouselEffect__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", *(double *)(a1 + 40));
}

- (void)_updateRevealState
{
  void *v3;
  double v4;
  double v5;
  _BOOL4 v6;
  _BOOL4 visuallyRevealed;
  int IsOne;
  int v9;
  int v10;
  NSObject *v11;
  _BOOL8 v12;
  int v13;
  _DWORD v14[2];
  __int16 v15;
  _BOOL4 v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  -[WGWidgetListViewController widgetListView](self, "widgetListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentOffset");
  -[WGCarouselListViewController setRevealProgress:](self, "setRevealProgress:", fmin(fmax(v4 / 60.0, 0.0), 1.0));
  objc_msgSend(v3, "contentOffset");
  -[WGCarouselListViewController setDismissProgress:](self, "setDismissProgress:", -fmin(fmax(v5 / 60.0, -1.0), 0.0));
  v6 = -[WGCarouselListViewController isRevealed](self, "isRevealed");
  visuallyRevealed = self->_visuallyRevealed;
  if (v6)
    IsOne = 0;
  else
    IsOne = BSFloatIsOne();
  v9 = BSFloatIsOne();
  v10 = objc_msgSend(v3, "isDecelerating");
  v11 = WGLogWidgets;
  if (os_log_type_enabled((os_log_t)WGLogWidgets, OS_LOG_TYPE_DEBUG))
  {
    v14[0] = 67110144;
    v14[1] = v6;
    v15 = 1024;
    v16 = visuallyRevealed;
    v17 = 1024;
    v18 = IsOne;
    v19 = 1024;
    v20 = v9;
    v21 = 1024;
    v22 = v10;
    _os_log_debug_impl(&dword_2172E1000, v11, OS_LOG_TYPE_DEBUG, "revealed: %{BOOL}u, wasVisuallyRevealed: %{BOOL}u, nowRevealed, %{BOOL}u, nowDismissed: %{BOOL}u, isDecelerating: %{BOOL}u", (uint8_t *)v14, 0x20u);
  }
  v12 = 1;
  if (self->_listSettings.pinned && !v6 | v9)
  {
    if ((v6 & v9 ^ 1 | v10) != 1
      || (v6 & v10 & 1) == 0
      && ((v10 & 1) != 0 || (!visuallyRevealed ? (v13 = 1) : (v13 = v9), (IsOne & 1) == 0 && v13)))
    {
      v12 = -[WGWidgetListViewController isEditingIcons](self, "isEditingIcons", 1);
    }
  }
  -[WGCarouselListViewController setVisuallyRevealed:](self, "setVisuallyRevealed:", v12);

}

- (double)easedOutValueForValue:(double)a3
{
  void *v4;
  double v5;
  float v6;
  double v7;

  objc_msgSend(MEMORY[0x24BDE56F0], "functionWithName:", *MEMORY[0x24BDE5D28]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(float *)&v5 = a3;
  objc_msgSend(v4, "_solveForInput:", v5);
  v7 = v6;

  return v7;
}

- (unint64_t)_indexOfFirstNonFavoritedWidgetInStackView
{
  void *v3;
  void *v4;
  unint64_t i;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  _QWORD v11[5];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__2;
  v16 = __Block_byref_object_dispose__2;
  v17 = 0;
  -[WGWidgetListViewController visibleWidgetIdentifiers](self, "visibleWidgetIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "copy");

  for (i = 0; i < objc_msgSend(v4, "count"); ++i)
  {
    objc_msgSend(v4, "objectAtIndex:", i);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[WGWidgetDiscoveryController isElementWithIdentifierFavorited:](self->super.super._discoveryController, "isElementWithIdentifierFavorited:", v6))
    {
      v7 = (void *)v13[5];
      v13[5] = (uint64_t)v6;

      break;
    }

  }
  -[UIStackView arrangedSubviews](self->super.super._stackView, "arrangedSubviews");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __74__WGCarouselListViewController__indexOfFirstNonFavoritedWidgetInStackView__block_invoke;
  v11[3] = &unk_24D731DC0;
  v11[4] = &v12;
  v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", v11);

  _Block_object_dispose(&v12, 8);
  return v9;
}

uint64_t __74__WGCarouselListViewController__indexOfFirstNonFavoritedWidgetInStackView__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v3 = a2;
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

  objc_msgSend(v7, "platterView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "listItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "widgetIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "isEqualToString:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40));

  return v11;
}

- (unint64_t)_indexForNextCellAfterContentOffset:(double)a3
{
  void *v5;
  void *v6;
  unint64_t v7;
  unint64_t v8;
  void *v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  double v13;

  -[UIStackView arrangedSubviews](self->super.super._stackView, "arrangedSubviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");

  v7 = objc_msgSend(v6, "count");
  v8 = -[WGCarouselListViewController _indexOfFirstNonFavoritedWidgetInStackView](self, "_indexOfFirstNonFavoritedWidgetInStackView");
  v9 = 0;
  if (v7 <= v8)
    v10 = v8;
  else
    v10 = v7;
  while (1)
  {
    v11 = v8;
    if (v10 == v8)
      break;
    objc_msgSend(v6, "objectAtIndex:", v8);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "frame");
    v8 = v11 + 1;
    v9 = v12;
    if (v13 >= a3)
      goto LABEL_8;
  }
  v12 = v9;
LABEL_8:

  return v11;
}

- (id)_identifierForCell:(id)a3
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  objc_class *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  if (!v5)
    goto LABEL_13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v6 = objc_opt_class();
    v7 = v5;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v11 = v8;

    objc_msgSend(v11, "platterView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "listItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "widgetIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
      goto LABEL_12;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0
      || (v9 = (objc_class *)objc_opt_class(),
          NSStringFromClass(v9),
          (v10 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_12:
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "recursiveDescription");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("WGCarouselListViewController.m"), 802, CFSTR("_identifierForCell: no identifier for cell with view hierarchy: %@"), v15);

LABEL_13:
      v10 = 0;
    }
  }

  return v10;
}

- (BOOL)_hasEnoughContentToScroll
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  BOOL v8;

  -[WGWidgetListViewController widgetListView](self, "widgetListView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "contentSize");
  v5 = v4;
  -[WGMajorListViewController containerView](self, "containerView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v5 > v7;

  return v8;
}

- (BOOL)_isViewControllerVisible
{
  return -[WGCarouselListViewController _appearState](self, "_appearState") - 1 < 3;
}

- (void)_updateTeachingViewVisibilityAnimated:(BOOL)a3 withCompletion:(id)a4
{
  void (**v5)(_QWORD);
  WGWidgetPinningTeachingView *v6;
  WGWidgetPinningTeachingView *teachingView;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  _QWORD v14[4];
  void (**v15)(_QWORD);
  id v16;
  _QWORD v17[4];
  id v18;
  id location;

  v5 = (void (**)(_QWORD))a4;
  if (self->_listSettings.useFavorites
    && -[WGCarouselListViewController shouldShowTeachingView](self, "shouldShowTeachingView"))
  {
    if (!self->_teachingView)
    {
      v6 = objc_alloc_init(WGWidgetPinningTeachingView);
      teachingView = self->_teachingView;
      self->_teachingView = v6;

      -[WGWidgetPinningTeachingView setDelegate:](self->_teachingView, "setDelegate:", self);
      -[UIStackView arrangedSubviews](self->super.super._stackView, "arrangedSubviews");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[WGMajorListViewController headerView](self, "headerView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v8, "indexOfObject:", v9);

      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        v11 = 0;
      else
        v11 = v10 + 1;
      -[UIStackView insertArrangedSubview:atIndex:](self->super.super._stackView, "insertArrangedSubview:atIndex:", self->_teachingView, v11);
      if (v5)
        v5[2](v5);
    }
  }
  else if (self->_teachingView)
  {
    objc_initWeak(&location, self);
    v12 = (void *)MEMORY[0x24BDF6F90];
    v13 = MEMORY[0x24BDAC760];
    v17[0] = MEMORY[0x24BDAC760];
    v17[1] = 3221225472;
    v17[2] = __85__WGCarouselListViewController__updateTeachingViewVisibilityAnimated_withCompletion___block_invoke;
    v17[3] = &unk_24D7316E8;
    objc_copyWeak(&v18, &location);
    v14[0] = v13;
    v14[1] = 3221225472;
    v14[2] = __85__WGCarouselListViewController__updateTeachingViewVisibilityAnimated_withCompletion___block_invoke_2;
    v14[3] = &unk_24D731DE8;
    objc_copyWeak(&v16, &location);
    v15 = v5;
    objc_msgSend(v12, "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v17, v14, 0.5, 0.15, 1.0, 0.0);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v18);
    objc_destroyWeak(&location);
  }

}

void __85__WGCarouselListViewController__updateTeachingViewVisibilityAnimated_withCompletion___block_invoke(uint64_t a1)
{
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[147], "setHidden:", 1);

}

void __85__WGCarouselListViewController__updateTeachingViewVisibilityAnimated_withCompletion___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  id *WeakRetained;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained[147], "removeFromSuperview");
  v2 = WeakRetained[147];
  WeakRetained[147] = 0;

  v3 = *(_QWORD *)(a1 + 32);
  if (v3)
    (*(void (**)(void))(v3 + 16))();

}

- (CGRect)_cellFrameInScrollBoundsForCell:(id)a3
{
  id v4;
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
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  CGRect result;

  v4 = a3;
  -[WGWidgetListViewController widgetListView](self, "widgetListView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIStackView superview](self->super.super._stackView, "superview");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 == v5)
  {
    objc_msgSend(v4, "frame");
    v19 = v18;
    objc_msgSend(v5, "contentOffset");
    v17 = v19 - v20;
  }
  else
  {
    objc_msgSend(v4, "bounds");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
    -[WGMajorListViewController containerView](self, "containerView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "convertRect:toView:", v15, v8, v10, v12, v14);
    v17 = v16;

  }
  objc_msgSend(v4, "frame");
  v22 = v21;
  v24 = v23;

  v25 = 0.0;
  v26 = v17;
  v27 = v22;
  v28 = v24;
  result.size.height = v28;
  result.size.width = v27;
  result.origin.y = v26;
  result.origin.x = v25;
  return result;
}

- (void)_styleFullyInvisibleTopCell:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v11[3];

  v3 = a3;
  objc_msgSend(v3, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClippingEdge:", 1);

  objc_msgSend(v3, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v11[0] = *MEMORY[0x24BDBD8B8];
  v11[1] = v6;
  v11[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v5, "setTransform:", v11);

  objc_msgSend(v3, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAnchorPoint:", 0.5, 0.5);

  objc_msgSend(v3, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v9, "setFrame:");

  objc_msgSend(v3, "setTopMarginForLayout:", 0.0);
  objc_msgSend(v3, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAlpha:", 0.0);
}

- (void)_styleCroppedAndScaledCellForTopEdge:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 thresholds:(id)a5
{
  CGFloat width;
  double y;
  CGFloat x;
  double *v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  CGFloat MaxY;
  double v25;
  double v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat rect;
  CGAffineTransform v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  _OWORD v38[3];
  CGRect v39;

  rect = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = (double *)a5;
  v11 = a3;
  objc_msgSend(v11, "platterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClippingEdge:", 1);

  objc_msgSend(v11, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v38[0] = *MEMORY[0x24BDBD8B8];
  v38[1] = v14;
  v38[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v13, "setTransform:", v38);
  objc_msgSend(v13, "layer");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setAnchorPoint:", 0.5, 0.0);

  -[WGWidgetListViewController widgetListView](self, "widgetListView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v18 = v17;
  v19 = v10[1];
  objc_msgSend(v16, "contentInset");
  v21 = v20 + 0.0;
  v23 = v22 - y;
  objc_msgSend(v13, "setBounds:", 0.0, -y, v18, v19);
  objc_msgSend(v13, "setOrigin:", v21, v23);
  objc_msgSend(v11, "setTopMarginForLayout:", v23);

  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = rect;
  MaxY = CGRectGetMaxY(v39);
  v25 = v10[2];
  v26 = v10[3];
  v27 = MaxY - v25;

  v35 = 0u;
  v36 = 0x3FF0000000000000;
  BYTE8(v35) = 1;
  v37 = 1;
  v31 = 0x3FECCCCCCCCCCCCDLL;
  v33 = 0x3FF0000000000000;
  v32 = 1;
  v34 = 1;
  BSIntervalMap();
  CGAffineTransformMakeScale(&v30, v28, v28);
  objc_msgSend(v13, "setTransform:", &v30);
  -[WGCarouselListViewController easedOutValueForValue:](self, "easedOutValueForValue:", 1.0 - v27 / (v26 - v25));
  objc_msgSend(v13, "setAlpha:");

}

- (void)_styleCroppedCellForTopEdge:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5 thresholds:(id)a6
{
  double height;
  double width;
  double y;
  double v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  void *v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  _OWORD v24[3];

  height = a5.size.height;
  width = a5.size.width;
  y = a4.origin.y;
  v10 = *((double *)a6 + 1);
  v11 = a3;
  objc_msgSend(v11, "platterView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setClippingEdge:", 1);

  objc_msgSend(v11, "contentView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v24[0] = *MEMORY[0x24BDBD8B8];
  v24[1] = v14;
  v24[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v13, "setTransform:", v24);

  objc_msgSend(v11, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layer");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAnchorPoint:", 0.5, 0.5);

  -[WGWidgetListViewController widgetListView](self, "widgetListView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "contentInset");
  v19 = v18 + 0.0;
  v21 = v20 - y;
  if (height < v10)
    height = v10;
  objc_msgSend(v11, "contentView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v19, v21, width, height);

  objc_msgSend(v11, "setTopMarginForLayout:", v21);
  objc_msgSend(v11, "contentView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v23, "setAlpha:", 1.0);
}

- (void)_styleFullyVisibleCell:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  __int128 v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _OWORD v11[3];

  v3 = a3;
  objc_msgSend(v3, "platterView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setClippingEdge:", 4);

  objc_msgSend(v3, "contentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v11[0] = *MEMORY[0x24BDBD8B8];
  v11[1] = v6;
  v11[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v5, "setTransform:", v11);

  objc_msgSend(v3, "contentView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setAnchorPoint:", 0.5, 0.5);

  objc_msgSend(v3, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v9, "setFrame:");

  objc_msgSend(v3, "setTopMarginForLayout:", 0.0);
  objc_msgSend(v3, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setAlpha:", 1.0);
}

- (void)_styleCroppedCellForBottomEdge:(id)a3 intersectionRect:(CGRect)a4 thresholds:(id)a5
{
  double height;
  double width;
  double v7;
  id v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _OWORD v16[3];

  height = a4.size.height;
  width = a4.size.width;
  v7 = *((double *)a5 + 1);
  v8 = a3;
  objc_msgSend(v8, "platterView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setClippingEdge:", 4);

  objc_msgSend(v8, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v16[0] = *MEMORY[0x24BDBD8B8];
  v16[1] = v11;
  v16[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v10, "setTransform:", v16);

  objc_msgSend(v8, "contentView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAnchorPoint:", 0.5, 0.5);

  if (height < v7)
    height = v7;
  objc_msgSend(v8, "contentView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", 0.0, 0.0, width, height);

  objc_msgSend(v8, "setTopMarginForLayout:", 0.0);
  objc_msgSend(v8, "contentView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setAlpha:", 1.0);
}

- (void)_styleCroppedAndScaledCellForBottomEdge:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5 thresholds:(id)a6
{
  CGFloat height;
  CGFloat width;
  double y;
  CGFloat x;
  double v12;
  double *v13;
  id v14;
  void *v15;
  void *v16;
  __int128 v17;
  void *v18;
  CGFloat MinY;
  double v20;
  double v21;
  CGFloat v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  CGAffineTransform v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  __int128 v34;
  uint64_t v35;
  uint64_t v36;
  _OWORD v37[3];
  CGRect v38;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v12 = *((double *)a6 + 1);
  v13 = (double *)a6;
  v14 = a3;
  objc_msgSend(v14, "platterView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setClippingEdge:", 4);

  objc_msgSend(v14, "contentView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v37[0] = *MEMORY[0x24BDBD8B8];
  v37[1] = v17;
  v37[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v16, "setTransform:", v37);
  objc_msgSend(v16, "layer");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setAnchorPoint:", 0.5, 1.0);

  v38.origin.x = x;
  v38.origin.y = y;
  v38.size.width = width;
  v38.size.height = height;
  MinY = CGRectGetMinY(v38);
  v20 = v13[5];
  v21 = v13[6];
  v22 = MinY - v20;

  v23 = fmin(fmax(v22 / (v21 - v20), 0.0), 1.0);
  -[WGMajorListViewController containerView](self, "containerView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "bounds");
  v26 = v25 - v12 + -10.0 - y + v23 * 10.0;
  objc_msgSend(v14, "frame");
  objc_msgSend(v16, "setBounds:", 0.0, v26);
  objc_msgSend(v16, "setOrigin:", 0.0, v26);
  objc_msgSend(v14, "setTopMarginForLayout:", v26);

  v34 = 0u;
  v36 = 1;
  v35 = 0x3FF0000000000000;
  BYTE8(v34) = 1;
  v30 = 0x3FECCCCCCCCCCCCDLL;
  v32 = 0x3FF0000000000000;
  v31 = 1;
  v33 = 1;
  BSIntervalMap();
  CGAffineTransformMakeScale(&v29, v27, v27);
  objc_msgSend(v16, "setTransform:", &v29);
  -[WGCarouselListViewController easedOutValueForValue:](self, "easedOutValueForValue:", 1.0 - v23);
  objc_msgSend(v16, "setAlpha:", v28 * 0.3 + 0.7);

}

- (void)_styleDisapearingCellForBottomEdge:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 previousCellFrameInContainerView:(CGRect)a5 thresholds:(id)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v10;
  double v13;
  double *v14;
  id v15;
  void *v16;
  void *v17;
  __int128 v18;
  void *v19;
  CGFloat MinY;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  CGAffineTransform v28;
  _OWORD v29[3];
  CGRect v30;

  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v10 = a4.origin.y;
  v13 = *((double *)a6 + 1);
  v14 = (double *)a6;
  v15 = a3;
  objc_msgSend(v15, "platterView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setClippingEdge:", 4);

  objc_msgSend(v15, "contentView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v29[0] = *MEMORY[0x24BDBD8B8];
  v29[1] = v18;
  v29[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v17, "setTransform:", v29);
  objc_msgSend(v17, "layer");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAnchorPoint:", 0.5, 1.0);

  v30.origin.x = x;
  v30.origin.y = y;
  v30.size.width = width;
  v30.size.height = height;
  MinY = CGRectGetMinY(v30);
  v21 = v14[7];
  v22 = v14[8];
  v23 = MinY - v21;

  v24 = fmin(fmax(v23 / (v22 - v21), 0.0), 1.0);
  -[WGMajorListViewController containerView](self, "containerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "bounds");
  v27 = v26 - v13 - v10 + v24 * 6.0;
  objc_msgSend(v15, "frame");
  objc_msgSend(v17, "setBounds:", 0.0, v27);
  objc_msgSend(v17, "setOrigin:", 0.0, v27);
  objc_msgSend(v15, "setTopMarginForLayout:", v27);

  CGAffineTransformMakeScale(&v28, 0.9, 0.9);
  objc_msgSend(v17, "setTransform:", &v28);
  objc_msgSend(v17, "setAlpha:", fmin(fmax((v24 * -2.0 + 1.0) * 0.7, 0.0), 1.0));

}

- (void)_styleFullyInvisibleBottomCell:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 thresholds:(id)a5
{
  double y;
  double v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  void *v13;
  double v14;
  double v15;
  CGAffineTransform v16;
  _OWORD v17[3];

  y = a4.origin.y;
  v7 = *((double *)a5 + 1);
  v8 = a3;
  -[WGMajorListViewController containerView](self, "containerView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  objc_msgSend(v8, "platterView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setClippingEdge:", 4);

  objc_msgSend(v8, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v17[0] = *MEMORY[0x24BDBD8B8];
  v17[1] = v12;
  v17[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v11, "setTransform:", v17);
  objc_msgSend(v11, "layer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setAnchorPoint:", 0.5, 1.0);

  objc_msgSend(v9, "bounds");
  v15 = v14 - v7 - y;
  objc_msgSend(v8, "frame");
  objc_msgSend(v11, "setBounds:", 0.0, v15);
  objc_msgSend(v11, "setOrigin:", 0.0, v15);
  objc_msgSend(v8, "setTopMarginForLayout:", v15);

  CGAffineTransformMakeScale(&v16, 0.9, 0.9);
  objc_msgSend(v11, "setTransform:", &v16);
  objc_msgSend(v11, "setAlpha:", 0.0);

}

- (void)_styleFooterView:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5 containerHeight:(double)a6
{
  double height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v10;
  void *v11;
  CGFloat v12;
  __int128 v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  __int128 v23;
  CGFloat v24;
  CGAffineTransform v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  CGRect v29;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v10 = a3;
  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29.origin.x = x;
  v29.origin.y = y;
  v29.size.width = width;
  v29.size.height = height;
  v12 = (CGRectGetMaxY(v29) - (a6 + 10.0)) / (height + a6 + 10.0 - (a6 + 10.0)) + 0.0;
  v13 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v26 = *MEMORY[0x24BDBD8B8];
  v27 = v13;
  v28 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v11, "setTransform:", &v26);
  objc_msgSend(v11, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAnchorPoint:", 0.5, 0.5);

  objc_msgSend(v10, "bounds");
  v16 = v15;
  v18 = v17;
  v20 = v19;
  v22 = v21;

  objc_msgSend(v11, "setFrame:", v16, v18, v20, v22);
  v23 = *(_OWORD *)(MEMORY[0x24BE0BC40] + 16);
  v26 = *MEMORY[0x24BE0BC40];
  v27 = v23;
  BSUIConstrainValueToIntervalWithRubberBand();
  CGAffineTransformMakeScale(&v25, v24, v24);
  objc_msgSend(v11, "setTransform:", &v25);
  objc_msgSend(v11, "setAlpha:", fmin(fmax(1.0 - v12, 0.0), 1.0));

}

- (void)_styleHeaderView:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5
{
  double v6;
  CGFloat v7;
  void *v8;
  void *v9;
  CGAffineTransform v10;
  __int128 v11;
  uint64_t v12;
  uint64_t v13;

  CGRectGetMinY(a4);
  v11 = 0u;
  v13 = 1;
  v12 = 0x3FF0000000000000;
  BYTE8(v11) = 1;
  BSUIConstrainValueToIntervalWithRubberBand();
  v7 = fmin(fmax(v6, 0.75), 1.25);
  -[WGMajorListViewController headerView](self, "headerView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "contentView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  CGAffineTransformMakeScale(&v10, v7, v7);
  objc_msgSend(v9, "setTransform:", &v10);

}

- (void)_styleTeachingView:(id)a3 withCellFrameInScrollViewBounds:(CGRect)a4 intersectionRect:(CGRect)a5
{
  double height;
  double y;
  CGFloat x;
  id v9;
  void *v10;
  __int128 v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  int IsZero;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  CGFloat rect;
  CGAffineTransform v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  _OWORD v33[3];
  CGRect v34;

  height = a4.size.height;
  rect = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v9 = a3;
  objc_msgSend(v9, "contentView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 16);
  v33[0] = *MEMORY[0x24BDBD8B8];
  v33[1] = v11;
  v33[2] = *(_OWORD *)(MEMORY[0x24BDBD8B8] + 32);
  objc_msgSend(v10, "setTransform:", v33);
  objc_msgSend(v10, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAnchorPoint:", 0.5, 0.5);

  -[WGWidgetListViewController widgetListView](self, "widgetListView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");

  objc_msgSend(v13, "contentInset");
  v15 = v14;
  v17 = v16;
  IsZero = BSFloatIsZero();
  v19 = 0.0;
  if ((IsZero & 1) == 0)
  {
    v34.origin.x = x;
    v34.origin.y = y;
    v34.size.width = rect;
    v34.size.height = height;
    v19 = (CGRectGetMaxY(v34) - v15) / height;
  }
  v30 = 0u;
  v32 = 1;
  v20 = fmin(fmax(v19, 0.0), 1.0);
  v31 = 0x3FF0000000000000;
  BYTE8(v30) = 1;
  v26 = 0x3FECCCCCCCCCCCCDLL;
  v28 = 0x3FF0000000000000;
  v27 = 1;
  v29 = 1;
  BSIntervalMap();
  if (IsZero)
    v22 = 1.0;
  else
    v22 = v21;
  if (v22 < 1.0)
  {
    objc_msgSend(v10, "layer");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAnchorPoint:", 0.5, 0.0);

  }
  objc_msgSend(v10, "setBounds:", 0.0);
  objc_msgSend(v10, "setOrigin:", v17 + 0.0, fmax(v15 - y, 0.0));
  CGAffineTransformMakeScale(&v25, v22, v22);
  objc_msgSend(v10, "setTransform:", &v25);
  -[WGCarouselListViewController easedOutValueForValue:](self, "easedOutValueForValue:", v20);
  objc_msgSend(v10, "setAlpha:");

}

- (id)_thresholdsForCell:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *cachedThresholds;
  NSMutableDictionary *v7;
  NSMutableDictionary *v8;
  WGCarouselCellThresholds *v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  CGRect v27;

  v4 = a3;
  -[WGCarouselListViewController _identifierForCell:](self, "_identifierForCell:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  cachedThresholds = self->_cachedThresholds;
  if (!cachedThresholds)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    v8 = self->_cachedThresholds;
    self->_cachedThresholds = v7;

    cachedThresholds = self->_cachedThresholds;
  }
  -[NSMutableDictionary objectForKey:](cachedThresholds, "objectForKey:", v5);
  v9 = (WGCarouselCellThresholds *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = objc_alloc_init(WGCarouselCellThresholds);
    -[WGMajorListViewController containerView](self, "containerView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17 + -10.0;
    -[WGWidgetListViewController widgetListView](self, "widgetListView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "contentInset");
    v21 = v20;

    objc_msgSend(v4, "platterView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27.origin.x = v12;
    v27.origin.y = v14;
    v27.size.width = v16;
    v27.size.height = v18;
    objc_msgSend(v22, "minimumSizeThatFits:", CGRectGetWidth(v27), 0.0);
    v9->_headerHeight = v23;

    v9->_threshold1 = v21 + v9->_headerHeight;
    -[UIStackView spacing](self->super.super._stackView, "spacing");
    v9->_threshold2 = v21 - v24;
    v9->_threshold3 = v18;
    v25 = v18 - v9->_headerHeight;
    v9->_threshold4 = v25;
    v9->_threshold5 = v18;
    v9->_threshold6 = v25;
    v9->_threshold7 = v18;
    -[NSMutableDictionary setObject:forKey:](self->_cachedThresholds, "setObject:forKey:", v9, v5);

  }
  return v9;
}

- (void)widgetPinningTeachingViewDidSelectYes:(id)a3
{
  dispatch_time_t v4;
  _QWORD block[5];

  -[WGWidgetDiscoveryController noteWidgetsPinningViewControllerDidDismiss:](self->super.super._discoveryController, "noteWidgetsPinningViewControllerDidDismiss:", 1);
  v4 = dispatch_time(0, 500000000);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __70__WGCarouselListViewController_widgetPinningTeachingViewDidSelectYes___block_invoke;
  block[3] = &unk_24D7314D8;
  block[4] = self;
  dispatch_after(v4, MEMORY[0x24BDAC9B8], block);
}

uint64_t __70__WGCarouselListViewController_widgetPinningTeachingViewDidSelectYes___block_invoke(uint64_t a1)
{
  void *v1;
  _QWORD v3[5];

  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __70__WGCarouselListViewController_widgetPinningTeachingViewDidSelectYes___block_invoke_2;
  v3[3] = &unk_24D7314D8;
  v3[4] = v1;
  return objc_msgSend(v1, "_updateTeachingViewVisibilityAnimated:withCompletion:", 1, v3);
}

uint64_t __70__WGCarouselListViewController_widgetPinningTeachingViewDidSelectYes___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setVisuallyRevealed:withSlowAnimation:", 0, 1);
}

- (void)widgetPinningTeachingViewDidSelectNo:(id)a3
{
  -[WGWidgetDiscoveryController noteWidgetsPinningViewControllerDidDismiss:](self->super.super._discoveryController, "noteWidgetsPinningViewControllerDidDismiss:", 0);
  -[WGCarouselListViewController _updateTeachingViewVisibilityAnimated:withCompletion:](self, "_updateTeachingViewVisibilityAnimated:withCompletion:", 1, 0);
}

- (BOOL)shouldShowTeachingView
{
  return -[WGWidgetDiscoveryController shouldShowWidgetsPinningTeachingView](self->super.super._discoveryController, "shouldShowWidgetsPinningTeachingView");
}

- (WGWidgetListSettings)listSettings
{
  WGWidgetListSettings *p_listSettings;
  unint64_t carouselEdges;
  uint64_t v4;
  WGWidgetListSettings result;

  p_listSettings = &self->_listSettings;
  carouselEdges = self->_listSettings.carouselEdges;
  v4 = *(_QWORD *)&p_listSettings->useFavorites;
  result.useFavorites = v4;
  result.carouselIgnoresHeader = BYTE1(v4);
  result.pinned = BYTE2(v4);
  result.carouselEdges = carouselEdges;
  return result;
}

- (BOOL)isRevealed
{
  return self->_revealed;
}

- (BOOL)isVisuallyRevealed
{
  return self->_visuallyRevealed;
}

- (double)revealProgress
{
  return self->_revealProgress;
}

- (void)setRevealProgress:(double)a3
{
  self->_revealProgress = a3;
}

- (double)dismissProgress
{
  return self->_dismissProgress;
}

- (void)setDismissProgress:(double)a3
{
  self->_dismissProgress = a3;
}

- (BOOL)visuallyRevealedPriorToEditingIcons
{
  return self->_visuallyRevealedPriorToEditingIcons;
}

- (void)setVisuallyRevealedPriorToEditingIcons:(BOOL)a3
{
  self->_visuallyRevealedPriorToEditingIcons = a3;
}

- (NSMutableDictionary)catchupProperties
{
  return self->_catchupProperties;
}

- (void)setCatchupProperties:(id)a3
{
  objc_storeStrong((id *)&self->_catchupProperties, a3);
}

- (void)setCatchupTimers:(id)a3
{
  objc_storeStrong((id *)&self->_catchupTimers, a3);
}

- (BOOL)isFooterVisible
{
  return self->_footerVisible;
}

- (WGWidgetPinningTeachingView)teachingView
{
  return self->_teachingView;
}

- (void)setTeachingView:(id)a3
{
  objc_storeStrong((id *)&self->_teachingView, a3);
}

- (NSMutableDictionary)cachedThresholds
{
  return self->_cachedThresholds;
}

- (void)setCachedThresholds:(id)a3
{
  objc_storeStrong((id *)&self->_cachedThresholds, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedThresholds, 0);
  objc_storeStrong((id *)&self->_teachingView, 0);
  objc_storeStrong((id *)&self->_catchupTimers, 0);
  objc_storeStrong((id *)&self->_catchupProperties, 0);
  objc_storeStrong(&self->_sizeChangeObserver, 0);
}

- (void)setRevealed:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2172E1000, a2, a3, "Setting carousel list to reveal: %{BOOL}u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)setVisuallyRevealed:(uint64_t)a3 withSlowAnimation:(uint64_t)a4 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_2172E1000, a2, a3, "Setting carousel list to visuallyRevealed: %{BOOL}u", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_6();
}

- (void)_animatablePropertiesForStackViewUpdate
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v2 = *(_QWORD *)(a1 + 1160);
  v3 = 138412290;
  v4 = v2;
  _os_log_debug_impl(&dword_2172E1000, a2, OS_LOG_TYPE_DEBUG, "Created catchup properties: %@", (uint8_t *)&v3, 0xCu);
}

@end
