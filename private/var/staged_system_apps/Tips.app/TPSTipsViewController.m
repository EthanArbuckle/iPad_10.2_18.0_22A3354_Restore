@implementation TPSTipsViewController

- (void)updateNavigationTitle:(id)a3
{
  __CFString *v4;
  id v5;
  void *v6;
  unsigned __int8 v7;
  __CFString *v8;

  v8 = (__CFString *)a3;
  if (-[TPSTipsViewController shouldDisplayNavigationTitle](self, "shouldDisplayNavigationTitle"))
  {
    v4 = v8;
    if (v8)
      goto LABEL_7;
    goto LABEL_6;
  }
  v5 = -[__CFString length](v8, "length");
  v4 = v8;
  if (!v8 || v5)
  {
LABEL_6:

    v8 = &stru_1000A5680;
  }
LABEL_7:
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController title](self, "title"));
  v7 = objc_msgSend(v6, "isEqualToString:", v8);

  if ((v7 & 1) == 0)
    -[TPSTipsViewController setTitle:](self, "setTitle:", v8);

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    self->_delegateCurrentTipUpdated = objc_opt_respondsToSelector(obj, "tipsViewControllerCurrentTipUpdated:") & 1;
    self->_delegateShouldShowSearch = objc_opt_respondsToSelector(obj, "tipsViewControllerShouldShowSearch:") & 1;
  }

}

- (void)setShouldDisplayNavigationTitle:(BOOL)a3
{
  NSString *titleText;
  const __CFString *v5;
  __CFString *v6;

  if (self->_shouldDisplayNavigationTitle != a3)
  {
    self->_shouldDisplayNavigationTitle = a3;
    if (a3 && (titleText = self->_titleText) != 0)
      v5 = titleText;
    else
      v5 = &stru_1000A5680;
    v6 = (__CFString *)v5;
    -[TPSTipsViewController updateNavigationTitle:](self, "updateNavigationTitle:", v5);

  }
}

- (void)setAllowPaging:(BOOL)a3
{
  if (self->_allowPaging != a3)
  {
    self->_allowPaging = a3;
    -[TPSTipsViewController updatePagingScrollState](self, "updatePagingScrollState");
  }
}

- (BOOL)allowPaging
{
  return self->_allowPaging;
}

- (BOOL)shouldDisplayNavigationTitle
{
  return self->_shouldDisplayNavigationTitle;
}

- (void)setShouldHoldOffVideo:(BOOL)a3
{
  if (self->_shouldHoldOffVideo != a3)
  {
    self->_shouldHoldOffVideo = a3;
    if (!a3)
      -[TPSTipsViewController playVideoIfNeeded](self, "playVideoIfNeeded");
  }
}

- (TPSTip)currentTip
{
  return self->_currentTip;
}

- (void)commonInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPSTipsViewController;
  -[TPSViewController commonInit](&v3, "commonInit");
  self->_allowPaging = 1;
  self->_allowBookmarks = 1;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  -[TPSTipsViewController cancelAssetsPrefetch](self, "cancelAssetsPrefetch");
  v3 = (void *)objc_opt_new(TPSViewSourceProxy);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_delayedIncreaseCountViewForCurrentTip:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:name:object:", self, UIApplicationWillEnterForegroundNotification, 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v5, "removeObserver:name:object:", self, UIApplicationDidEnterBackgroundNotification, 0);

  v6.receiver = self;
  v6.super_class = (Class)TPSTipsViewController;
  -[TPSViewController dealloc](&v6, "dealloc");
}

- (void)viewDidLoad
{
  TPSKVOManager *v3;
  TPSKVOManager *KVOManager;
  TPSSavedTipsManager *v5;
  TPSSavedTipsManager *savedTipsManager;
  TPSDeferredAction *v7;
  TPSDeferredAction *scrolledDeferredAction;
  TPSTipsAssetPrefetchingManager *v9;
  TPSTipsAssetPrefetchingManager *assetPrefetchingManager;
  UIColor *v11;
  UIColor *navigationTitleTextColor;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  CGFloat v17;
  CGFloat v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)TPSTipsViewController;
  -[TPSViewController viewDidLoad](&v21, "viewDidLoad");
  -[TPSTipsViewController updateBarAppearance](self, "updateBarAppearance");
  v3 = (TPSKVOManager *)objc_msgSend(objc_alloc((Class)TPSKVOManager), "initWithObserver:", self);
  KVOManager = self->_KVOManager;
  self->_KVOManager = v3;

  v5 = (TPSSavedTipsManager *)objc_claimAutoreleasedReturnValue(+[TPSSavedTipsManager sharedInstance](TPSSavedTipsManager, "sharedInstance"));
  savedTipsManager = self->_savedTipsManager;
  self->_savedTipsManager = v5;

  v7 = (TPSDeferredAction *)objc_alloc_init((Class)TPSDeferredAction);
  scrolledDeferredAction = self->_scrolledDeferredAction;
  self->_scrolledDeferredAction = v7;

  -[TPSDeferredAction setDelegate:](self->_scrolledDeferredAction, "setDelegate:", self);
  v9 = (TPSTipsAssetPrefetchingManager *)objc_alloc_init((Class)TPSTipsAssetPrefetchingManager);
  assetPrefetchingManager = self->_assetPrefetchingManager;
  self->_assetPrefetchingManager = v9;

  v11 = (UIColor *)objc_claimAutoreleasedReturnValue(+[TPSAppearance defaultLabelColor](TPSAppearance, "defaultLabelColor"));
  navigationTitleTextColor = self->_navigationTitleTextColor;
  self->_navigationTitleTextColor = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v13, "setLargeTitleDisplayMode:", 2);

  self->_currentPagingIndex = 0x7FFFFFFFFFFFFFFFLL;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v14, "addObserver:selector:name:object:", self, "applicationDidBecomeActive", UIApplicationDidBecomeActiveNotification, 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v15, "addObserver:selector:name:object:", self, "applicationDidEnterBackground", UIApplicationDidEnterBackgroundNotification, 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
  objc_msgSend(v16, "bounds");
  self->_viewSize.width = v17;
  self->_viewSize.height = v18;

  -[TPSTipsViewController createViews](self, "createViews");
  -[TPSTipsViewController setupSearch](self, "setupSearch");
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "traitCollection"));
  -[TPSTipsViewController updateContentBackgroundWithTraitCollection:](self, "updateContentBackgroundWithTraitCollection:", v20);

  -[TPSTipsViewController registerTraitChanges](self, "registerTraitChanges");
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSTipsViewController;
  -[TPSAppViewController viewWillAppear:](&v5, "viewWillAppear:", a3);
  self->_canIncreaseViewCount = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));

  if (v4)
    -[TPSTipsViewController analyticsIncreaseCountViewForCurrentTipDelay:](self, "analyticsIncreaseCountViewForCurrentTipDelay:", TPSAnalyticsViewMethodViewAppear);
  -[TPSTipsViewController updateNavigationTitle:](self, "updateNavigationTitle:", self->_titleText);
  -[TPSTipsViewController updateTipForCell:startVideo:](self, "updateTipForCell:startVideo:", 0, 0);
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TPSTipsViewController;
  -[TPSAppViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  +[TPSAnalyticsSessionController incrementCollectionsViewedCount](TPSAnalyticsSessionController, "incrementCollectionsViewedCount");
  -[TPSTipsViewController updateTipForCell:startVideo:](self, "updateTipForCell:startVideo:", 0, 1);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TPSTipsViewController;
  -[TPSAppViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  self->_canIncreaseViewCount = 0;
  v4 = (void *)objc_opt_new(TPSViewSourceProxy);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_delayedIncreaseCountViewForCurrentTip:", v4);

  -[TPSTipsViewController _logTimeSpentBeforeCurrentTip:](self, "_logTimeSpentBeforeCurrentTip:", 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v14.receiver = self;
  v14.super_class = (Class)TPSTipsViewController;
  -[TPSAppViewController viewDidDisappear:](&v14, "viewDidDisappear:", a3);
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView visibleCells](self->_collectionView, "visibleCells", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "scrubVideoToFirstFrame");
        objc_msgSend(v9, "stopVideoPlayer");
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v6);
  }

}

- (void)setAllowBookmarks:(BOOL)a3
{
  if (self->_allowBookmarks != a3)
  {
    self->_allowBookmarks = a3;
    -[TPSTipsViewController updateNavigationBarButtons](self, "updateNavigationBarButtons");
  }
}

- (void)setTips:(id)a3
{
  NSArray *v5;
  NSUInteger v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMutableDictionary *tipsMap;
  NSMutableDictionary *v13;
  NSMutableDictionary *v14;
  NSArray *v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  void *v20;
  NSMutableDictionary *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  char isKindOfClass;
  id WeakRetained;
  char v38;
  id v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];

  v5 = (NSArray *)a3;
  if (self->_tips != v5)
  {
    objc_storeStrong((id *)&self->_tips, a3);
    v6 = -[NSArray count](self->_tips, "count");
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController pageControl](self, "pageControl"));
    objc_msgSend(v7, "setNumberOfPages:", v6);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "assetSizes"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)v9, "tip"));

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tipSizes](self, "tipSizes"));
    LOBYTE(v9) = objc_msgSend(v11, "isEqual:", v10);

    if ((v9 & 1) == 0)
    {
      -[TPSTipsViewController setTipSizes:](self, "setTipSizes:", v10);
      -[TPSTipCellAppearance updateAppearanceWithSize:](self->_cellAppearance, "updateAppearanceWithSize:", self->_viewSize.width, self->_viewSize.height);
    }
    tipsMap = self->_tipsMap;
    v40 = (void *)v10;
    if (tipsMap)
    {
      -[NSMutableDictionary removeAllObjects](tipsMap, "removeAllObjects");
    }
    else
    {
      v13 = (NSMutableDictionary *)objc_msgSend(&__NSDictionary0__struct, "mutableCopy");
      v14 = self->_tipsMap;
      self->_tipsMap = v13;

    }
    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    v15 = v5;
    v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v42 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * (_QWORD)i);
          v21 = self->_tipsMap;
          v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "identifier"));
          -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v20, v22);

        }
        v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v41, v45, 16);
      }
      while (v17);
    }

    -[UICollectionView reloadData](self->_collectionView, "reloadData");
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tipForTipID:](self, "tipForTipID:", v24));

    if (v25)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
      objc_msgSend(v26, "bounds");
      -[TPSTipsViewController ensureCurrentTipPositionWithViewSize:](self, "ensureCurrentTipPositionWithViewSize:", v27, v28);

      v29 = v40;
    }
    else
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
      v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "identifier"));
      v29 = v40;
      if (v31)
      {
        v32 = (void *)v31;
        v33 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController presentedViewController](self, "presentedViewController"));
        v35 = objc_opt_class(TPSActivityViewController, v34);
        isKindOfClass = objc_opt_isKindOfClass(v33, v35);

        if ((isKindOfClass & 1) != 0)
          -[TPSTipsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
      }
      else
      {

      }
      -[TPSTipsViewController setCurrentTip:](self, "setCurrentTip:", 0);
    }
    -[TPSTipsViewController updatePageControlToTip:](self, "updatePageControlToTip:", 0);
    -[TPSTipsViewController updatePagingScrollState](self, "updatePagingScrollState");
    -[TPSTipsViewController cancelAssetsPrefetch](self, "cancelAssetsPrefetch");
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v38 = objc_opt_respondsToSelector(WeakRetained, "tipsViewControllerContentUpdated:");

    if ((v38 & 1) != 0)
    {
      v39 = objc_loadWeakRetained((id *)&self->_delegate);
      objc_msgSend(v39, "tipsViewControllerContentUpdated:", self);

    }
  }

}

- (void)updatePagingScrollState
{
  void *v2;
  unsigned int v4;
  _BOOL8 v5;
  void *v6;
  _BOOL8 v7;
  id v8;

  v4 = -[TPSTipsViewController allowPaging](self, "allowPaging");
  if (v4)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController pageControl](self, "pageControl"));
    v5 = (uint64_t)objc_msgSend(v2, "numberOfPages") < 2;
  }
  else
  {
    v5 = 1;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController pageControl](self, "pageControl"));
  objc_msgSend(v6, "setHidden:", v5);

  if (v4)
  v7 = -[TPSTipsViewController allowPaging](self, "allowPaging");
  v8 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionView](self, "collectionView"));
  objc_msgSend(v8, "setScrollEnabled:", v7);

}

- (void)updateBarAppearance
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = objc_alloc_init((Class)UINavigationBarAppearance);
  objc_msgSend(v6, "configureWithDefaultBackground");
  objc_msgSend(v6, "setShadowImage:", 0);
  objc_msgSend(v6, "setShadowColor:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v3, "setStandardAppearance:", v6);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v4, "_setManualScrollEdgeAppearanceProgress:", 0.0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v5, "_setManualScrollEdgeAppearanceEnabled:", 1);

}

- (BOOL)updateBarButtonsForTip
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  __CFString *v9;
  char v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController savedTipsManager](self, "savedTipsManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v8 = objc_msgSend(v5, "isSavedWithTipIdentifier:", v7);

  if (v8)
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("bookmark"), "stringByAppendingString:", CFSTR(".fill")));
  else
    v9 = CFSTR("bookmark");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController saveBarButton](self, "saveBarButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "image"));
  v14 = objc_msgSend(v13, "isEqual:", v11);
  v10 = v14 ^ 1;

  if ((v14 & 1) == 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController saveBarButton](self, "saveBarButton"));

    if (!v15)
    {
      v16 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v11, 0, self, "toggleSavedTip:");
      -[TPSTipsViewController setSaveBarButton:](self, "setSaveBarButton:", v16);

    }
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController saveBarButton](self, "saveBarButton"));
    objc_msgSend(v17, "setImage:", v11);

    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController saveBarButton](self, "saveBarButton"));
    objc_msgSend(v19, "setTintColor:", v18);

  }
  if (+[TPSFeatureFlags allowsTipsSharing](TPSFeatureFlags, "allowsTipsSharing"))
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController shareBarButton](self, "shareBarButton"));

    if (!v20)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:](UIImage, "_systemImageNamed:", CFSTR("square.and.arrow.up")));
      v22 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithImage:style:target:action:", v21, 0, self, "shareCurrentTip:");
      -[TPSTipsViewController setShareBarButton:](self, "setShareBarButton:", v22);

      v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController shareBarButton](self, "shareBarButton"));
      objc_msgSend(v24, "setTintColor:", v23);

      v10 = 1;
    }
  }

  return v10;
}

- (void)toggleSavedTip:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController savedTipsManager](self, "savedTipsManager", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "correlationID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  objc_msgSend(v4, "toggleSavedTipWithCorrelationId:tipIdentifier:", v6, v8);

  -[TPSTipsViewController updateBarButtonsForTip](self, "updateBarButtonsForTip");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
  objc_msgSend(v9, "updateSavedTipsContent");

  v19 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController savedTipsManager](self, "savedTipsManager"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "identifier"));
  v14 = objc_msgSend(v11, "isSavedWithTipIdentifier:", v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "correlationID"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventTipSaved eventWithTipID:saved:correlationID:collectionID:](TPSAnalyticsEventTipSaved, "eventWithTipID:saved:correlationID:collectionID:", v10, v14, v16, v17));
  objc_msgSend(v18, "log");

}

- (BOOL)canSearch
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchController](self, "searchController"));
  v3 = v2 != 0;

  return v3;
}

- (void)setupSearch
{
  -[TPSTipsViewController setupSearchViewModel](self, "setupSearchViewModel");
  -[TPSTipsViewController setDefinesPresentationContext:](self, "setDefinesPresentationContext:", 1);
  -[TPSTipsViewController resetSearchController](self, "resetSearchController");
}

- (void)resetSearchController
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (self->_delegateShouldShowSearch
    && (v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController delegate](self, "delegate")),
        v4 = objc_msgSend(v3, "tipsViewControllerShouldShowSearch:", self),
        v3,
        v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchController](self, "searchController"));

    if (!v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController createSearchController](self, "createSearchController"));
      -[TPSTipsViewController setSearchController:](self, "setSearchController:", v6);

    }
  }
  else
  {
    -[TPSTipsViewController dismissPresentedSearchResultsViewController:](self, "dismissPresentedSearchResultsViewController:", 0);
    -[TPSTipsViewController setSearchResultsNavigationController:](self, "setSearchResultsNavigationController:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchController](self, "searchController"));
    objc_msgSend(v7, "setActive:", 0);

    -[TPSTipsViewController setSearchController:](self, "setSearchController:", 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchController](self, "searchController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v9, "setSearchController:", v8);

  -[TPSTipsViewController updateNavigationBarButtons](self, "updateNavigationBarButtons");
}

- (id)createSearchController
{
  id v3;
  void *v4;

  v3 = objc_msgSend(objc_alloc((Class)UISearchController), "initWithSearchResultsController:", 0);
  objc_msgSend(v3, "setSearchResultsUpdater:", self);
  objc_msgSend(v3, "setObscuresBackgroundDuringPresentation:", 0);
  objc_msgSend(v3, "setHidesNavigationBarDuringPresentation:", 0);
  objc_msgSend(v3, "setModalPresentationStyle:", 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "searchBar"));
  objc_msgSend(v4, "setDelegate:", self);
  objc_msgSend(v4, "setAutocorrectionType:", 1);
  objc_msgSend(v4, "setAutocapitalizationType:", 0);

  return v3;
}

- (void)updateSearchResultsPresentationIfNeeded
{
  void *v3;
  unsigned int v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchResultViewModel](self, "searchResultViewModel"));
  v4 = objc_msgSend(v3, "hasStartedSearch");

  if (v4)
    -[TPSTipsViewController presentSearchResultsViewController:](self, "presentSearchResultsViewController:", 1);
  else
    -[TPSTipsViewController dismissPresentedSearchResultsViewController:](self, "dismissPresentedSearchResultsViewController:", 1);
}

- (void)presentSearchResultsViewController:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  unsigned __int8 v6;
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

  v4 = objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchController](self, "searchController", a3));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = -[TPSTipsViewController isSearchViewControllerPresented](self, "isSearchViewControllerPresented");

    if ((v6 & 1) == 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationController](self, "navigationController"));
      objc_msgSend(v7, "dismissViewControllerAnimated:completion:", 0, 0);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchResultsNavigationController](self, "searchResultsNavigationController"));
      if (!v8)
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchResultViewModel](self, "searchResultViewModel"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIViewController _makeSearchResultsViewControllerWithViewModel:](UIViewController, "_makeSearchResultsViewControllerWithViewModel:", v9));
        -[TPSTipsViewController setSearchResultsNavigationController:](self, "setSearchResultsNavigationController:", v10);

        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchResultsNavigationController](self, "searchResultsNavigationController"));
        objc_msgSend(v11, "setModalPresentationStyle:", 7);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchController](self, "searchController"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "searchBar"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchResultsNavigationController](self, "searchResultsNavigationController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "popoverPresentationController"));

      objc_msgSend(v15, "setPermittedArrowDirections:", 0);
      objc_msgSend(v15, "setPopoverLayoutMargins:", 50.0, 10.0, 10.0, 10.0);
      objc_msgSend(v15, "setSourceView:", v13);
      v19 = v13;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
      objc_msgSend(v15, "setPassthroughViews:", v16);

      objc_msgSend(v15, "setDelegate:", self);
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationController](self, "navigationController"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchResultsNavigationController](self, "searchResultsNavigationController"));
      objc_msgSend(v17, "presentViewController:animated:completion:", v18, 1, 0);

    }
  }
}

- (BOOL)isSearchViewControllerPresented
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  char v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationController](self, "navigationController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "presentedViewController"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchResultsNavigationController](self, "searchResultsNavigationController"));
  v7 = objc_opt_class(v5, v6);
  isKindOfClass = objc_opt_isKindOfClass(v4, v7);

  if ((isKindOfClass & 1) != 0)
  {
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "topViewController"));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchResultsNavigationController](self, "searchResultsNavigationController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "topViewController"));

    v13 = objc_opt_class(v11, v12);
    v14 = objc_opt_isKindOfClass(v9, v13);

    v4 = (void *)v9;
  }
  else
  {
    v14 = 0;
  }

  return v14 & 1;
}

- (void)dismissPresentedSearchResultsViewController:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  _QWORD v6[5];
  id v7;
  id location;

  v3 = a3;
  if (-[TPSTipsViewController isSearchViewControllerPresented](self, "isSearchViewControllerPresented"))
  {
    objc_initWeak(&location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationController](self, "navigationController"));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100023BE4;
    v6[3] = &unk_1000A2A00;
    objc_copyWeak(&v7, &location);
    v6[4] = self;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", v3, v6);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&location);
  }
}

- (void)searchWithSearchQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "searchTerm"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchController](self, "searchController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchBar"));
  objc_msgSend(v7, "setText:", v5);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchController](self, "searchController"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "searchBar"));
  objc_msgSend(v9, "becomeFirstResponder");

  v10 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchResultViewModel](self, "searchResultViewModel"));
  objc_msgSend(v10, "setSearchQuery:", v4);

}

- (id)tipForTipID:(id)a3
{
  return -[NSMutableDictionary objectForKeyedSubscript:](self->_tipsMap, "objectForKeyedSubscript:", a3);
}

- (void)createViews
{
  TPSCollectionViewFlowLayout *v3;
  TPSCollectionViewFlowLayout *collectionViewLayout;
  UICollectionView *v5;
  UICollectionView *collectionView;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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
  TPSPageControl *v27;
  TPSPageControl *pageControl;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  NSLayoutConstraint *v48;
  NSLayoutConstraint *pageControlBottomConstraint;

  if (!self->_collectionView)
  {
    v3 = objc_alloc_init(TPSCollectionViewFlowLayout);
    collectionViewLayout = self->_collectionViewLayout;
    self->_collectionViewLayout = v3;

    -[TPSCollectionViewFlowLayout setScrollDirection:](self->_collectionViewLayout, "setScrollDirection:", 1);
    -[TPSCollectionViewFlowLayout setMinimumLineSpacing:](self->_collectionViewLayout, "setMinimumLineSpacing:", 0.0);
    v5 = (UICollectionView *)objc_msgSend(objc_alloc((Class)UICollectionView), "initWithFrame:collectionViewLayout:", self->_collectionViewLayout, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    collectionView = self->_collectionView;
    self->_collectionView = v5;

    -[UICollectionView setTranslatesAutoresizingMaskIntoConstraints:](self->_collectionView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UICollectionView setShowsHorizontalScrollIndicator:](self->_collectionView, "setShowsHorizontalScrollIndicator:", 0);
    -[UICollectionView setShowsVerticalScrollIndicator:](self->_collectionView, "setShowsVerticalScrollIndicator:", 0);
    -[UICollectionView setAlwaysBounceHorizontal:](self->_collectionView, "setAlwaysBounceHorizontal:", 1);
    -[UICollectionView _setInterpageSpacing:](self->_collectionView, "_setInterpageSpacing:", 40.0, 0.0);
    -[UICollectionView setContentInsetAdjustmentBehavior:](self->_collectionView, "setContentInsetAdjustmentBehavior:", 2);
    -[UICollectionView setPagingEnabled:](self->_collectionView, "setPagingEnabled:", 1);
    -[TPSTipsViewController _adjustScrollViewPagingDecelerationForSize:](self, "_adjustScrollViewPagingDecelerationForSize:", self->_viewSize.width, self->_viewSize.height);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
    objc_msgSend(v7, "addSubview:", self->_collectionView);

    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(TPSTipCollectionViewCell, v8), kTPSTipCellIdentifierKey);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(TPSIntroTipCollectionViewCell, v9), kTPSIntroTipCellIdentifierKey);
    -[UICollectionView registerClass:forCellWithReuseIdentifier:](self->_collectionView, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(TPSOutroTipCollectionViewCell, v10), kTPSOutroTipCellIdentifierKey);
    -[UICollectionView setDelegate:](self->_collectionView, "setDelegate:", self);
    -[UICollectionView setDataSource:](self->_collectionView, "setDataSource:", self);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView leadingAnchor](self->_collectionView, "leadingAnchor"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "leadingAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "constraintEqualToAnchor:", v13));
    objc_msgSend(v14, "setActive:", 1);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView trailingAnchor](self->_collectionView, "trailingAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "trailingAnchor"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v17));
    objc_msgSend(v18, "setActive:", 1);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView topAnchor](self->_collectionView, "topAnchor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "constraintEqualToAnchor:", v21));
    objc_msgSend(v22, "setActive:", 1);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView bottomAnchor](self->_collectionView, "bottomAnchor"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "bottomAnchor"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v25));
    objc_msgSend(v26, "setActive:", 1);

    -[TPSKVOManager addKVOObject:forKeyPath:options:context:](self->_KVOManager, "addKVOObject:forKeyPath:options:context:", self->_collectionView, CFSTR("contentSize"), 3, "contentLayoutChanged:userInfo:");
    -[TPSKVOManager addKVOObject:forKeyPath:options:context:](self->_KVOManager, "addKVOObject:forKeyPath:options:context:", self->_collectionView, CFSTR("contentOffset"), 3, "contentLayoutChanged:userInfo:");
  }
  if (!self->_pageControl)
  {
    v27 = objc_alloc_init(TPSPageControl);
    pageControl = self->_pageControl;
    self->_pageControl = v27;

    -[TPSPageControl setHudDelegate:](self->_pageControl, "setHudDelegate:", self);
    -[TPSPageControl setTranslatesAutoresizingMaskIntoConstraints:](self->_pageControl, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[TPSPageControl setBackgroundStyle:](self->_pageControl, "setBackgroundStyle:", 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor labelColor](UIColor, "labelColor"));
    -[TPSPageControl setCurrentPageIndicatorTintColor:](self->_pageControl, "setCurrentPageIndicatorTintColor:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGray2Color](UIColor, "systemGray2Color"));
    -[TPSPageControl setPageIndicatorTintColor:](self->_pageControl, "setPageIndicatorTintColor:", v30);

    -[TPSPageControl addTarget:action:forControlEvents:](self->_pageControl, "addTarget:action:forControlEvents:", self, "pageControlPageChanged:", 4096);
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
    objc_msgSend(v31, "addSubview:", self->_pageControl);

    v32 = (void *)objc_claimAutoreleasedReturnValue(-[TPSPageControl widthAnchor](self->_pageControl, "widthAnchor"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "widthAnchor"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34, -20.0));

    LODWORD(v36) = 1144750080;
    objc_msgSend(v35, "setPriority:", v36);
    objc_msgSend(v35, "setActive:", 1);
    -[TPSPageControl sizeForNumberOfPages:](self->_pageControl, "sizeForNumberOfPages:", 8);
    v38 = v37;
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[TPSPageControl widthAnchor](self->_pageControl, "widthAnchor"));
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintLessThanOrEqualToConstant:", v38));
    objc_msgSend(v40, "setActive:", 1);

    v41 = (void *)objc_claimAutoreleasedReturnValue(-[TPSPageControl centerXAnchor](self->_pageControl, "centerXAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "centerXAnchor"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v43));
    objc_msgSend(v44, "setActive:", 1);

    v45 = (void *)objc_claimAutoreleasedReturnValue(-[TPSPageControl bottomAnchor](self->_pageControl, "bottomAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "bottomAnchor"));
    v48 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintEqualToAnchor:constant:", v47, 0.0));
    pageControlBottomConstraint = self->_pageControlBottomConstraint;
    self->_pageControlBottomConstraint = v48;

    -[NSLayoutConstraint setActive:](self->_pageControlBottomConstraint, "setActive:", 1);
  }
  -[TPSTipsViewController updatePagingScrollState](self, "updatePagingScrollState");
}

- (void)updateContentBackgroundWithTraitCollection:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  if (objc_msgSend(a3, "userInterfaceStyle") == (id)1)
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v7 = (id)v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController traitCollection](self, "traitCollection"));
  -[TPSTipCellAppearance setTraitCollection:](self->_cellAppearance, "setTraitCollection:", v5);

  -[UICollectionView setBackgroundColor:](self->_collectionView, "setBackgroundColor:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
  objc_msgSend(v6, "setBackgroundColor:", v7);

}

- (id)cellForCurrentTip
{
  NSUInteger v3;
  void *v4;
  void *v5;

  v3 = -[NSArray indexOfObject:](self->_tips, "indexOfObject:", self->_currentTip);
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    if (self->_isSharedVariant)
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController centerCell](self, "centerCell"));
    else
      v4 = 0;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v3, 0));
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView cellForItemAtIndexPath:](self->_collectionView, "cellForItemAtIndexPath:", v5));

  }
  return v4;
}

- (void)updateTipForCell:(id)a3 startVideo:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  id v7;

  v4 = a4;
  v7 = a3;
  if ((-[UICollectionView isHidden](self->_collectionView, "isHidden") & 1) != 0)
  {
LABEL_8:
    v6 = v7;
    goto LABEL_9;
  }
  v6 = v7;
  if (v7
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController cellForCurrentTip](self, "cellForCurrentTip"))) != 0)
  {
    v7 = v6;
    objc_msgSend(v6, "updateImageView");
    objc_msgSend(v7, "updateContentLabel");
    if (v4
      && -[TPSAppViewController viewWillAppear](self, "viewWillAppear")
      && !-[TPSTipsViewController shouldHoldOffVideo](self, "shouldHoldOffVideo"))
    {
      objc_msgSend(v7, "playVideo");
    }
    goto LABEL_8;
  }
LABEL_9:

}

- (id)_currentViewMethod
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  v2 = objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventAppLaunched lastRecordedLaunchType](TPSAnalyticsEventAppLaunched, "lastRecordedLaunchType"));
  v3 = (void *)v2;
  v4 = (void *)TPSAnalyticsViewMethodCollectionsList;
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  return v5;
}

- (void)setCurrentTip:(id)a3
{
  TPSTip *v5;
  TPSTip **p_currentTip;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  TPSTip *v11;
  TPSTip *v12;
  unsigned int v13;
  void *v14;

  v5 = (TPSTip *)a3;
  p_currentTip = &self->_currentTip;
  if (self->_currentTip != v5)
  {
    v7 = objc_claimAutoreleasedReturnValue(+[TPSLogger default](TPSLogger, "default"));
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      sub_10006CAB0(v5, v7);

    objc_storeStrong((id *)&self->_currentTip, a3);
    if (*p_currentTip)
    {
      -[TPSTipsViewController updateTipForCell:startVideo:](self, "updateTipForCell:startVideo:", 0, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip identifier](*p_currentTip, "identifier"));

      if (v8)
      {
        self->_canIncreaseViewCount = 1;
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController _currentViewMethod](self, "_currentViewMethod"));
        -[TPSTipsViewController analyticsIncreaseCountViewForCurrentTipDelay:](self, "analyticsIncreaseCountViewForCurrentTipDelay:", v9);

      }
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController centerCell](self, "centerCell"));
      v11 = (TPSTip *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tip"));
      v12 = v11;
      if (v11 == *p_currentTip)
      {
        v13 = objc_msgSend(v10, "contentFinishedLoading");

        if (v13)
          -[TPSTipsViewController cellContentLoaded:](self, "cellContentLoaded:", v10);
      }
      else
      {

      }
      -[TPSTipsViewController _logTimeSpentBeforeCurrentTip:](self, "_logTimeSpentBeforeCurrentTip:", *p_currentTip);

    }
    -[TPSTipsViewController updatePageControlToTip:](self, "updatePageControlToTip:", v5);
    if (self->_delegateCurrentTipUpdated)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController delegate](self, "delegate"));
      objc_msgSend(v14, "tipsViewControllerCurrentTipUpdated:", self);

    }
  }

}

- (void)_adjustScrollViewPagingDecelerationForSize:(CGSize)a3
{
  double width;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  UICollectionView *collectionView;
  void *v14;
  UICollectionView *v15;
  id v16;

  width = a3.width;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen", a3.width, a3.height));
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;

  if (v7 >= v9)
    v10 = v7;
  else
    v10 = v9;
  if (v10 >= width)
    v11 = width;
  else
    v11 = v10;
  v12 = (1.0 - (v11 * 0.00000994318182 + 0.966818182)) * -1.22140276 + 1.0;
  collectionView = self->_collectionView;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v11 * -0.000000184659091 + 0.000359090909));
  -[UICollectionView setValue:forKey:](collectionView, "setValue:forKey:", v14, CFSTR("_pagingSpringPull"));

  v15 = self->_collectionView;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v12));
  -[UICollectionView setValue:forKey:](v15, "setValue:forKey:", v16, CFSTR("_pagingFriction"));

}

- (void)analyticsIncreaseCountViewForCurrentTipDelay:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(+[TPSViewSourceProxy proxyWithViewMethod:](TPSViewSourceProxy, "proxyWithViewMethod:", a3));
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_delayedIncreaseCountViewForCurrentTip:");
  if (self->_canIncreaseViewCount)
    -[TPSTipsViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_delayedIncreaseCountViewForCurrentTip:", v4, kTipsAnalyticsDelayedEventInterval);

}

- (void)_delayedIncreaseCountViewForCurrentTip:(id)a3
{
  id v4;
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
  id v25;

  v4 = a3;
  if (self->_currentTip && self->_canIncreaseViewCount)
  {
    v25 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentSwipeEvent](self, "currentSwipeEvent"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip identifier](self->_currentTip, "identifier"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentSwipeEvent](self, "currentSwipeEvent"));
      objc_msgSend(v7, "setContentID:", v6);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentSwipeEvent](self, "currentSwipeEvent"));
      objc_msgSend(v9, "setCollectionID:", v8);

      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip correlationID](self->_currentTip, "correlationID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentSwipeEvent](self, "currentSwipeEvent"));
      objc_msgSend(v11, "setCorrelationID:", v10);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip clientConditionID](self->_currentTip, "clientConditionID"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentSwipeEvent](self, "currentSwipeEvent"));
      objc_msgSend(v13, "setClientConditionID:", v12);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentSwipeEvent](self, "currentSwipeEvent"));
      objc_msgSend(v14, "log");

      -[TPSTipsViewController setCurrentSwipeEvent:](self, "setCurrentSwipeEvent:", 0);
    }
    else
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip identifier](self->_currentTip, "identifier"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip correlationID](self->_currentTip, "correlationID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip clientConditionID](self->_currentTip, "clientConditionID"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "viewMethod"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController traitCollection](self, "traitCollection"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventContentViewed analyticsViewModeForTraitCollection:](TPSAnalyticsEventContentViewed, "analyticsViewModeForTraitCollection:", v19));
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventContentViewed eventWithContentID:collectionID:correlationID:clientConditionID:viewMethod:viewMode:](TPSAnalyticsEventContentViewed, "eventWithContentID:collectionID:correlationID:clientConditionID:viewMethod:viewMode:", v24, v15, v16, v17, v18, v20));
      objc_msgSend(v21, "log");

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip identifier](self->_currentTip, "identifier"));
    objc_msgSend(v22, "tipViewed:collectionIdentifier:", v23, self->_collectionID);

    +[TPSAnalyticsSessionController incrementTipsViewedCount](TPSAnalyticsSessionController, "incrementTipsViewedCount");
    self->_canIncreaseViewCount = 0;
    v4 = v25;
  }

}

- (void)networkStateDidChange:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  objc_super v14;
  _BYTE v15[128];

  v3 = a3;
  v14.receiver = self;
  v14.super_class = (Class)TPSTipsViewController;
  -[TPSViewController networkStateDidChange:](&v14, "networkStateDidChange:");
  if (v3)
  {
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView visibleCells](self->_collectionView, "visibleCells", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v9), "loadContentIfNeeded");
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
      }
      while (v7);
    }

  }
}

- (void)updatePageControlToTip:(id)a3
{
  TPSTip *v4;
  BOOL v5;
  NSUInteger v6;
  int64_t v7;
  void *v8;
  void *v9;
  TPSTip *v10;

  v4 = (TPSTip *)a3;
  if (!v4)
    v4 = self->_currentTip;
  v10 = v4;
  -[TPSTipsViewController updateNavigationTitle:](self, "updateNavigationTitle:", self->_titleText);
  if (-[NSArray count](self->_tips, "count"))
    v5 = v10 == 0;
  else
    v5 = 1;
  if (v5 || (v6 = -[NSArray indexOfObject:](self->_tips, "indexOfObject:", v10), v6 == 0x7FFFFFFFFFFFFFFFLL))
  {
    if (-[NSString length](self->_titleText, "length"))
    {
      v7 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:
      self->_currentPagingIndex = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController pageControl](self, "pageControl"));
      objc_msgSend(v8, "setCurrentPage:", v7);

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController pageControl](self, "pageControl"));
      objc_msgSend(v9, "setNeedsLayout");

      -[TPSTipsViewController updateNavigationBarButtons](self, "updateNavigationBarButtons");
    }
  }
  else
  {
    v7 = v6;
    if (v6 != self->_currentPagingIndex)
      goto LABEL_11;
  }

}

- (void)contentLayoutChanged:(id)a3 userInfo:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSKeyValueChangeOldKey));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", NSKeyValueChangeNewKey));

  if (v6 != v7)
  {
    v8 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController scrolledDeferredAction](self, "scrolledDeferredAction"));
    objc_msgSend(v8, "scheduleNextRunLoop");

  }
}

- (BOOL)eligibleToPlayVideo
{
  if ((-[UICollectionView isHidden](self->_collectionView, "isHidden") & 1) != 0)
    return 0;
  else
    return !-[TPSTipsViewController shouldHoldOffVideo](self, "shouldHoldOffVideo");
}

- (void)playVideoIfNeeded
{
  id v3;

  if (-[TPSTipsViewController eligibleToPlayVideo](self, "eligibleToPlayVideo"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController cellForCurrentTip](self, "cellForCurrentTip"));
    if ((objc_msgSend(v3, "videoHasFinished") & 1) == 0)
      objc_msgSend(v3, "continuePlayVideo");

  }
}

- (void)continueVideoForCurrentTip
{
  id v3;

  if (-[TPSTipsViewController eligibleToPlayVideo](self, "eligibleToPlayVideo"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController cellForCurrentTip](self, "cellForCurrentTip"));
    objc_msgSend(v3, "continuePlayVideo");

  }
}

- (void)stopVideoForCurrentTip
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController cellForCurrentTip](self, "cellForCurrentTip"));
  objc_msgSend(v2, "stopVideoPlayer");

}

- (void)reconfigureAllCollectionViewItems
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;
  _QWORD v10[5];
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v3, "count")));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100025010;
  v10[3] = &unk_1000A2A28;
  v10[4] = self;
  v6 = v4;
  v11 = v6;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100025090;
  v8[3] = &unk_1000A2A50;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v8);

}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  unsigned __int8 v8;
  void *v9;
  _QWORD v10[5];
  id v11[3];
  unsigned __int8 v12;
  _QWORD v13[4];
  id v14[3];
  id location;
  objc_super v16;

  height = a3.height;
  width = a3.width;
  v7 = a4;
  v16.receiver = self;
  v16.super_class = (Class)TPSTipsViewController;
  -[TPSTipsViewController viewWillTransitionToSize:withTransitionCoordinator:](&v16, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  if ((id)-[TPSAppViewController supportedInterfaceOrientations](self, "supportedInterfaceOrientations") != (id)2)
  {
    self->_viewSize.width = width;
    self->_viewSize.height = height;
    -[TPSTipCellAppearance updateAppearanceWithSize:](self->_cellAppearance, "updateAppearanceWithSize:", width, height);
    v8 = +[TPSAppearance isPhoneUI](TPSAppearance, "isPhoneUI");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController cellForCurrentTip](self, "cellForCurrentTip"));
    objc_msgSend(v9, "setContentFinishedLoading:", 0);
    objc_msgSend(v9, "setHasNotifiedDelegateContentLoaded:", 0);
    self->_updatingSize = 1;
    -[TPSCollectionViewFlowLayout invalidateLayout](self->_collectionViewLayout, "invalidateLayout");
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000252C0;
    v13[3] = &unk_1000A2A78;
    objc_copyWeak(v14, &location);
    v14[1] = *(id *)&width;
    v14[2] = *(id *)&height;
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100025304;
    v10[3] = &unk_1000A2AA0;
    objc_copyWeak(v11, &location);
    v12 = v8;
    v10[4] = self;
    v11[1] = *(id *)&width;
    v11[2] = *(id *)&height;
    objc_msgSend(v7, "animateAlongsideTransition:completion:", v13, v10);
    objc_destroyWeak(v11);
    objc_destroyWeak(v14);
    objc_destroyWeak(&location);

  }
}

- (void)ensureCurrentTipVisible
{
  -[TPSTipsViewController ensureCurrentTipPositionWithViewSize:](self, "ensureCurrentTipPositionWithViewSize:", self->_viewSize.width, self->_viewSize.height);
}

- (void)ensureCurrentTipPositionWithViewSize:(CGSize)a3
{
  double width;
  NSArray *tips;
  double v6;
  double v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  _QWORD v12[6];
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  if (!self->_scrollingTipContent)
  {
    width = a3.width;
    if (-[NSArray count](self->_tips, "count", a3.width, a3.height))
    {
      v13 = 0;
      v14 = &v13;
      v15 = 0x2020000000;
      v16 = 0x7FFFFFFFFFFFFFFFLL;
      tips = self->_tips;
      v12[0] = _NSConcreteStackBlock;
      v12[1] = 3221225472;
      v12[2] = sub_100025598;
      v12[3] = &unk_1000A2AC8;
      v12[4] = self;
      v12[5] = &v13;
      -[NSArray enumerateObjectsUsingBlock:](tips, "enumerateObjectsUsingBlock:", v12);
      if ((unint64_t)v14[3] <= 0x7FFFFFFFFFFFFFFELL)
      {
        -[UICollectionView _interpageSpacing](self->_collectionView, "_interpageSpacing");
        v7 = v6;
        v8 = v14[3];
        -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
        if (v9 != (width + v7) * (double)v8)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v14[3], 0));
          -[UICollectionView scrollToItemAtIndexPath:atScrollPosition:animated:](self->_collectionView, "scrollToItemAtIndexPath:atScrollPosition:animated:", v10, 16, 0);
          self->_scrollingTipContent = 0;
          self->_animatingTipsScroll = 0;
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController delegate](self, "delegate"));
          -[TPSTipsViewController updateTipForCell:startVideo:](self, "updateTipForCell:startVideo:", 0, objc_msgSend(v11, "tipsViewControllerShouldStartVideo:", self));

          -[TPSTipsViewController updatePageControlToTip:](self, "updatePageControlToTip:", 0);
        }
      }
      _Block_object_dispose(&v13, 8);
    }
  }
}

- (void)showInlineLabelWithTitle:(id)a3 message:(id)a4
{
  id v6;
  id v7;
  id v8;
  objc_super v9;

  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)TPSTipsViewController;
  v7 = a3;
  -[TPSViewController showInlineLabelWithTitle:message:](&v9, "showInlineLabelWithTitle:message:", v7, v6);
  v8 = objc_msgSend(v7, "length", v9.receiver, v9.super_class);

  if (v8 && objc_msgSend(v6, "length"))
  {
    -[UICollectionView setHidden:](self->_collectionView, "setHidden:", 1);
    -[TPSTipsViewController updateNavigationTitle:](self, "updateNavigationTitle:", &stru_1000A5680);
  }

}

- (void)removeInlineMessageLabel
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TPSTipsViewController;
  -[TPSViewController removeInlineMessageLabel](&v3, "removeInlineMessageLabel");
  -[TPSTipsViewController updatePageControlToTip:](self, "updatePageControlToTip:", 0);
  -[UICollectionView setHidden:](self->_collectionView, "setHidden:", 0);
}

- (void)applicationDidBecomeActive
{
  void *v3;
  id v4;

  self->_canIncreaseViewCount = -[TPSAppViewController viewWillAppear](self, "viewWillAppear");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController _currentViewMethod](self, "_currentViewMethod"));
  -[TPSTipsViewController analyticsIncreaseCountViewForCurrentTipDelay:](self, "analyticsIncreaseCountViewForCurrentTipDelay:", v3);

  -[TPSTipsViewController _logTimeSpentBeforeCurrentTip:](self, "_logTimeSpentBeforeCurrentTip:", self->_currentTip);
  -[TPSTipsViewController updateTipForCell:startVideo:](self, "updateTipForCell:startVideo:", 0, 1);
  v4 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController cellForCurrentTip](self, "cellForCurrentTip"));
  objc_msgSend(v4, "loadBodyContentIfNeeded");

}

- (void)applicationDidEnterBackground
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  self->_canIncreaseViewCount = 0;
  v3 = (void *)objc_opt_new(TPSViewSourceProxy);
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "_delayedIncreaseCountViewForCurrentTip:", v3);

  if ((-[UICollectionView isHidden](self->_collectionView, "isHidden") & 1) == 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController cellForCurrentTip](self, "cellForCurrentTip"));
    objc_msgSend(v4, "scrubVideoToFirstFrame");
    v6 = objc_opt_class(TPSTipCollectionViewCell, v5);
    if ((objc_opt_isKindOfClass(v4, v6) & 1) != 0)
      objc_msgSend(v4, "cancelReplayButtonTimer");

  }
  -[TPSTipsViewController _logTimeSpentBeforeCurrentTip:](self, "_logTimeSpentBeforeCurrentTip:", 0);
}

- (void)applicationWillTerminate
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tryItViewController](self, "tryItViewController"));
  objc_msgSend(v2, "logEndSession");

}

- (void)pageControlPageChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  self->_canIncreaseViewCount = 1;
  v4 = objc_msgSend(a3, "currentPage");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip identifier](self->_currentTip, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip correlationID](self->_currentTip, "correlationID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip clientConditionID](self->_currentTip, "clientConditionID"));
  v9 = TPSAnalyticsViewMethodSwipe;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController traitCollection](self, "traitCollection"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventContentViewed analyticsViewModeForTraitCollection:](TPSAnalyticsEventContentViewed, "analyticsViewModeForTraitCollection:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventContentViewed eventWithContentID:collectionID:correlationID:clientConditionID:viewMethod:viewMode:](TPSAnalyticsEventContentViewed, "eventWithContentID:collectionID:correlationID:clientConditionID:viewMethod:viewMode:", v5, v6, v7, v8, v9, v11));
  -[TPSTipsViewController setCurrentSwipeEvent:](self, "setCurrentSwipeEvent:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v4));
  -[TPSTipsViewController setCurrentTip:](self, "setCurrentTip:", v14);

  v16 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionView](self, "collectionView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v4, 0));
  objc_msgSend(v16, "scrollToItemAtIndexPath:atScrollPosition:animated:", v15, 16, 0);

}

- (void)scrollViewDidEndScrollingAnimation:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  UICollectionView *collectionView;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  self->_scrollingTipContent = 0;
  self->_animatingTipsScroll = 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    collectionView = self->_collectionView;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v6, 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v8));

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
    objc_msgSend(v9, "setTip:withCellAppearance:", v10, self->_cellAppearance);

    if (!-[TPSTipsViewController shouldHoldOffVideo](self, "shouldHoldOffVideo"))
      objc_msgSend(v9, "playVideo");

  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  -[TPSTipsViewController updatePageControlToTip:](self, "updatePageControlToTip:", v11);

}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  self->_scrollingTipContent = 1;
  self->_animatingTipsScroll = 0;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[TPSTip identifier](self->_currentTip, "identifier", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip correlationID](self->_currentTip, "correlationID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip clientConditionID](self->_currentTip, "clientConditionID"));
  v7 = TPSAnalyticsViewMethodSwipe;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController traitCollection](self, "traitCollection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventContentViewed analyticsViewModeForTraitCollection:](TPSAnalyticsEventContentViewed, "analyticsViewModeForTraitCollection:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventContentViewed eventWithContentID:collectionID:correlationID:clientConditionID:viewMethod:viewMode:](TPSAnalyticsEventContentViewed, "eventWithContentID:collectionID:correlationID:clientConditionID:viewMethod:viewMode:", v11, v4, v5, v6, v7, v9));
  -[TPSTipsViewController setCurrentSwipeEvent:](self, "setCurrentSwipeEvent:", v10);

}

- (void)scrollViewWillBeginDecelerating:(id)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView visibleCells](self->_collectionView, "visibleCells", a3, 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "tip"));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));

        if (v10 != v11)
          -[TPSTipsViewController updateTipForCell:startVideo:](self, "updateTipForCell:startVideo:", v9, 0);
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController centerCell](self, "centerCell"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "tip"));
  -[TPSTipsViewController updatePageControlToTip:](self, "updatePageControlToTip:", v13);

}

- (void)scrollViewDidEndDecelerating:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController centerCell](self, "centerCell", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tip"));

  if (v4 != v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tip"));
    -[TPSTipsViewController setCurrentTip:](self, "setCurrentTip:", v6);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  -[TPSTipsViewController updatePageControlToTip:](self, "updatePageControlToTip:", v7);

  self->_scrollingTipContent = 0;
}

- (void)updateBarMaterial
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  _BOOL4 v8;
  uint64_t v9;
  double y;
  double v11;
  void *i;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  unsigned __int8 v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  CGRect v43;
  CGRect v44;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionView](self, "collectionView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells"));

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v5 = v4;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v6)
  {
    v7 = v6;
    LOBYTE(v8) = 0;
    v9 = *(_QWORD *)v39;
    y = CGRectZero.origin.y;
    v11 = 0.0;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v9)
          objc_enumerationMutation(v5);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "contentScrollView", (_QWORD)v38));
        objc_msgSend(v14, "adjustedContentInset");
        v16 = v15;
        objc_msgSend(v14, "contentOffset");
        v18 = v16 + v17;
        if (v16 + v17 < 0.0)
          v18 = 0.0;
        v19 = fmin(v18, 1.0);
        if (v19 > v11)
          v11 = v19;
        if (v8
          || (v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "tip")),
              v21 = objc_msgSend(v20, "isIntro"),
              v20,
              (v21 & 1) != 0))
        {
          v8 = 1;
        }
        else
        {
          objc_msgSend(v14, "contentSize");
          v23 = v22;
          v25 = v24;
          objc_msgSend(v13, "bottomPadding");
          -[TPSPageControl convertRect:fromView:](self->_pageControl, "convertRect:fromView:", v14, CGRectZero.origin.x, y, v23, v25 + v26);
          v28 = v27;
          v30 = v29;
          v32 = v31;
          -[TPSPageControl bounds](self->_pageControl, "bounds");
          v44.origin.x = 0.0;
          v44.origin.y = v28;
          v44.size.width = v30;
          v44.size.height = v32;
          v8 = CGRectIntersectsRect(v43, v44);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
    }
    while (v7);
  }
  else
  {
    v8 = 0;
    v11 = 0.0;
  }

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v33, "_manualScrollEdgeAppearanceProgress");
  v35 = v34;

  if (v35 != v11)
  {
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v36, "_setManualScrollEdgeAppearanceProgress:", v11);

    v37 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v37, "_setManualScrollEdgeAppearanceEnabled:", 1);

  }
  -[TPSPageControl setBackgroundStyle:](self->_pageControl, "setBackgroundStyle:", v8, (_QWORD)v38);

}

- (void)updateNavigationBarButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  if (!-[TPSTipsViewController isSharedVariant](self, "isSharedVariant"))
  {
    if (-[TPSTipsViewController allowBookmarks](self, "allowBookmarks"))
    {
      if (!-[TPSTipsViewController updateBarButtonsForTip](self, "updateBarButtonsForTip"))
        return;
      v11 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController saveBarButton](self, "saveBarButton"));

      if (v3)
      {
        v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController saveBarButton](self, "saveBarButton"));
        objc_msgSend(v11, "addObject:", v4);

      }
      if (+[TPSFeatureFlags allowsTipsSharing](TPSFeatureFlags, "allowsTipsSharing"))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController shareBarButton](self, "shareBarButton"));

        if (v5)
        {
          v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController shareBarButton](self, "shareBarButton"));
          objc_msgSend(v11, "addObject:", v6);

        }
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v7, "setRightBarButtonItems:", v11);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v8, "setHidesSearchBarWhenScrolling:", 0);

    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationItem](self, "navigationItem"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rightBarButtonItem"));

      if (!v10)
        return;
      v11 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v11, "setRightBarButtonItem:", 0);
    }

  }
}

- (id)searchBarNavButton
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchController](self, "searchController"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchBarButton](self, "searchBarButton"));

    if (!v4)
    {
      v5 = objc_alloc((Class)UIBarButtonItem);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchController](self, "searchController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "searchBar"));
      v8 = objc_msgSend(v5, "initWithCustomView:", v7);
      -[TPSTipsViewController setSearchBarButton:](self, "setSearchBarButton:", v8);

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchBarButton](self, "searchBarButton"));
  }
  else
  {
    -[TPSTipsViewController setSearchBarButton:](self, "setSearchBarButton:", 0);
    v9 = 0;
  }
  return v9;
}

- (void)scrollViewDidScroll:(id)a3
{
  self->_canIncreaseViewCount = 1;
  -[TPSTipsViewController cancelAssetsPrefetch](self, "cancelAssetsPrefetch", a3);
}

- (id)centerCellIndexPath
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[UICollectionView center](self->_collectionView, "center");
  v4 = v3;
  -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
  v6 = v4 + v5;
  -[UICollectionView center](self->_collectionView, "center");
  v8 = v7;
  -[UICollectionView contentOffset](self->_collectionView, "contentOffset");
  return -[UICollectionView indexPathForItemAtPoint:](self->_collectionView, "indexPathForItemAtPoint:", v6, v8 + v9);
}

- (id)centerCell
{
  void *v3;
  UICollectionView *collectionView;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController centerCellIndexPath](self, "centerCellIndexPath"));
  collectionView = self->_collectionView;
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView cellForItemAtIndexPath:](collectionView, "cellForItemAtIndexPath:", v3));
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView visibleCells](collectionView, "visibleCells"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));

  }
  return v5;
}

- (id)activityViewControllerForTip:(id)a3
{
  id v4;
  id v5;
  TPSTextActivityItemSource *v6;
  void *v7;
  TPSURLActivityItemSource *v8;
  void *v9;
  TPSURLActivityItemSource *v10;
  void *v11;
  TPSActivityViewController *v12;
  void *v13;
  _QWORD v15[7];

  v4 = a3;
  if (v4)
  {
    v5 = objc_msgSend(&__NSArray0__struct, "mutableCopy");
    v6 = -[TPSTextActivityItemSource initWithTip:]([TPSTextActivityItemSource alloc], "initWithTip:", v4);
    objc_msgSend(v5, "addObject:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "webURLPath"));

    if (v7)
    {
      v8 = [TPSURLActivityItemSource alloc];
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
      v10 = -[TPSURLActivityItemSource initWithTip:appController:](v8, "initWithTip:appController:", v4, v9);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController traitCollection](self, "traitCollection"));
      -[TPSURLActivityItemSource setUserInterfaceStyle:](v10, "setUserInterfaceStyle:", objc_msgSend(v11, "userInterfaceStyle"));

      objc_msgSend(v5, "addObject:", v10);
    }
    v12 = -[TPSActivityViewController initWithActivityItems:applicationActivities:]([TPSActivityViewController alloc], "initWithActivityItems:applicationActivities:", v5, 0);
    v15[0] = UIActivityTypePrint;
    v15[1] = UIActivityTypeAddToReadingList;
    v15[2] = UIActivityTypeAssignToContact;
    v15[3] = UIActivityTypePostToFlickr;
    v15[4] = UIActivityTypeSaveToCameraRoll;
    v15[5] = UIActivityTypePostToVimeo;
    v15[6] = UIActivityTypeOpenInIBooks;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 7));
    -[TPSActivityViewController setExcludedActivityTypes:](v12, "setExcludedActivityTypes:", v13);

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[NSArray count](self->_tips, "count", a3, a4);
}

- (void)collectionView:(id)a3 didEndDisplayingCell:(id)a4 forItemAtIndexPath:(id)a5
{
  objc_msgSend(a4, "resetVideoPlayer", a3);
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  __CFString **v13;
  unsigned int v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSArray objectAtIndexedSubscript:](self->_tips, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((objc_msgSend(v8, "isIntro") & 1) != 0)
  {
    v13 = &kTPSIntroTipCellIdentifierKey;
  }
  else
  {
    v14 = objc_msgSend(v8, "isOutro");
    v13 = &kTPSTipCellIdentifierKey;
    if (v14)
      v13 = &kTPSOutroTipCellIdentifierKey;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", *v13, v7));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "backgroundColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "contentScrollView"));
  objc_msgSend(v18, "setBackgroundColor:", v17);

  objc_msgSend(v15, "setDelegate:", self);
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
  objc_msgSend(v15, "setAppController:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
  objc_msgSend(v20, "safeAreaInsets");
  objc_msgSend(v15, "setContentSafeAreaInsets:");

  objc_msgSend(v15, "setAdditionalBottomOffset:", self->_toolbarHeight);
  objc_msgSend(v15, "setIsSharedVariant:", self->_isSharedVariant);
  objc_msgSend(v15, "setTip:withCellAppearance:", v8, self->_cellAppearance);
  if (v12
    && (-[UICollectionView isHidden](self->_collectionView, "isHidden") & 1) == 0
    && !self->_animatingTipsScroll)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    if (objc_msgSend(v21, "appInBackground"))
    {

    }
    else
    {
      v22 = -[TPSAppViewController viewWillAppear](self, "viewWillAppear");

      if (v22)
        -[TPSTipsViewController updateTipForCell:startVideo:](self, "updateTipForCell:startVideo:", v15, -[TPSAppViewController viewWillAppear](self, "viewWillAppear"));
    }
  }

  return v15;
}

- (CGSize)collectionView:(id)a3 layout:(id)a4 sizeForItemAtIndexPath:(id)a5
{
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  -[UICollectionView bounds](self->_collectionView, "bounds", a3, a4, a5);
  v6 = v5;
  v8 = v7;
  result.height = v8;
  result.width = v6;
  return result;
}

- (void)initCellAppearanceWithTrait:(id)a3 size:(CGSize)a4
{
  double height;
  double width;
  id v7;
  TPSTipCellAppearance *v8;
  TPSTipCellAppearance *cellAppearance;
  void *v10;
  id v11;

  if (!self->_cellAppearance)
  {
    height = a4.height;
    width = a4.width;
    v7 = a3;
    v8 = (TPSTipCellAppearance *)-[TPSTipCellAppearance initAppearanceWithTraits:size:]([TPSTipCellAppearance alloc], "initAppearanceWithTraits:size:", v7, width, height);
    cellAppearance = self->_cellAppearance;
    self->_cellAppearance = v8;

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
    objc_msgSend(v10, "safeAreaInsets");
    -[TPSTipCellAppearance setTopSafeAreaHeight:](self->_cellAppearance, "setTopSafeAreaHeight:");

    v11 = objc_msgSend(v7, "userInterfaceStyle");
    -[TPSTipCellAppearance setUserInterfaceStyle:](self->_cellAppearance, "setUserInterfaceStyle:", v11);
  }
}

- (void)viewWillLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView traitCollection](self->_collectionView, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
  objc_msgSend(v4, "bounds");
  -[TPSTipsViewController initCellAppearanceWithTrait:size:](self, "initCellAppearanceWithTrait:size:", v3, v5, v6);

  v7.receiver = self;
  v7.super_class = (Class)TPSTipsViewController;
  -[TPSTipsViewController viewWillLayoutSubviews](&v7, "viewWillLayoutSubviews");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize *p_viewSize;
  double width;
  double height;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  _BYTE v35[128];
  CGRect v36;

  v34.receiver = self;
  v34.super_class = (Class)TPSTipsViewController;
  -[TPSTipsViewController viewDidLayoutSubviews](&v34, "viewDidLayoutSubviews");
  if (!self->_updatingSize && -[TPSAppViewController viewWillAppear](self, "viewWillAppear"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
    objc_msgSend(v3, "bounds");
    v5 = v4;
    v7 = v6;

    p_viewSize = &self->_viewSize;
    width = self->_viewSize.width;
    height = self->_viewSize.height;
    if (width != v5 || height != v7)
    {
      p_viewSize->width = v5;
      self->_viewSize.height = v7;
      -[TPSTipCellAppearance updateAppearanceWithSize:](self->_cellAppearance, "updateAppearanceWithSize:", v5, v7);
      -[UICollectionView reloadData](self->_collectionView, "reloadData");
      -[TPSTipsViewController _adjustScrollViewPagingDecelerationForSize:](self, "_adjustScrollViewPagingDecelerationForSize:", p_viewSize->width, self->_viewSize.height);
      width = p_viewSize->width;
      height = self->_viewSize.height;
    }
    -[TPSTipsViewController ensureCurrentTipPositionWithViewSize:](self, "ensureCurrentTipPositionWithViewSize:", width, height);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController view](self, "view"));
    objc_msgSend(v12, "safeAreaInsets");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    if (v18 <= 0.0)
      v21 = -16.0;
    else
      v21 = -v18;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController pageControlBottomConstraint](self, "pageControlBottomConstraint"));
    objc_msgSend(v22, "setConstant:", v21);

    v23 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController pageControl](self, "pageControl"));
    objc_msgSend(v23, "bounds");
    self->_toolbarHeight = CGRectGetHeight(v36);

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[UICollectionView visibleCells](self->_collectionView, "visibleCells", 0));
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v25)
    {
      v26 = v25;
      v27 = *(_QWORD *)v31;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v31 != v27)
            objc_enumerationMutation(v24);
          v29 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v29, "setAdditionalBottomOffset:", self->_toolbarHeight);
          objc_msgSend(v29, "setContentSafeAreaInsets:", v14, v16, v18, v20);
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v26);
    }

  }
}

- (void)registerTraitChanges
{
  void *v3;
  id v4;
  _QWORD v5[5];
  uint64_t v6;

  v6 = objc_opt_class(UITraitUserInterfaceStyle, a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100026DB8;
  v5[3] = &unk_1000A2AF0;
  v5[4] = self;
  v4 = -[TPSTipsViewController registerForTraitChanges:withHandler:](self, "registerForTraitChanges:withHandler:", v3, v5);

}

- (void)_logTimeSpentBeforeCurrentTip:(id)a3
{
  TPSAnalyticsEventTipTimeSpent *previousTipTimeSpentEvent;
  void *v5;
  void *v6;
  void *v7;
  TPSAnalyticsEventTipTimeSpent *v8;
  NSString *collectionID;
  void *v10;
  TPSAnalyticsEventTipTimeSpent *v11;
  TPSAnalyticsEventTipTimeSpent *v12;
  id v13;

  v13 = a3;
  previousTipTimeSpentEvent = self->_previousTipTimeSpentEvent;
  if (previousTipTimeSpentEvent)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAnalyticsEventTipTimeSpent date](previousTipTimeSpentEvent, "date"));

    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAnalyticsEventTipTimeSpent date](self->_previousTipTimeSpentEvent, "date"));
      objc_msgSend(v6, "timeIntervalSinceDate:", v7);
      -[TPSAnalyticsEventTipTimeSpent setTimeSpent:](self->_previousTipTimeSpentEvent, "setTimeSpent:");

      -[TPSAnalyticsEventTipTimeSpent log](self->_previousTipTimeSpentEvent, "log");
    }
  }
  if (v13)
  {
    v8 = (TPSAnalyticsEventTipTimeSpent *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    collectionID = self->_collectionID;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "correlationID"));
    v11 = (TPSAnalyticsEventTipTimeSpent *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventTipTimeSpent eventWithTipID:collectionID:correlationID:](TPSAnalyticsEventTipTimeSpent, "eventWithTipID:collectionID:correlationID:", v8, collectionID, v10));
    v12 = self->_previousTipTimeSpentEvent;
    self->_previousTipTimeSpentEvent = v11;

  }
  else
  {
    v8 = self->_previousTipTimeSpentEvent;
    self->_previousTipTimeSpentEvent = 0;
  }

}

- (void)logAppIntent:(id)a3 actionDirection:(id)a4
{
  TPSTip *currentTip;
  id v6;
  id v7;
  void *v8;
  id v9;

  currentTip = self->_currentTip;
  v6 = a4;
  v7 = a3;
  v9 = (id)objc_claimAutoreleasedReturnValue(-[TPSTip identifier](currentTip, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventLinkAction eventWithTipID:actionName:actionDirection:](TPSAnalyticsEventLinkAction, "eventWithTipID:actionName:actionDirection:", v9, v7, v6));

  objc_msgSend(v8, "log");
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "searchBar"));
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));

  v5 = v8;
  if (v8)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAppSearchQuery queryWithSearchTerm:origin:](TPSAppSearchQuery, "queryWithSearchTerm:origin:", v8, 0));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchResultViewModel](self, "searchResultViewModel"));
    objc_msgSend(v7, "setSearchQuery:", v6);

    v5 = v8;
  }

}

- (void)searchBarTextDidBeginEditing:(id)a3
{
  -[TPSTipsViewController updateSearchResultsPresentationIfNeeded](self, "updateSearchResultsPresentationIfNeeded", a3);
}

- (void)presentationControllerDidDismiss:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "presentedViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController searchResultsNavigationController](self, "searchResultsNavigationController"));

  if (v4 == v5)
    -[TPSTipsViewController dismissSearch](self, "dismissSearch");
}

- (void)tipCollectionViewCellContentLayoutChanged:(id)a3
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController scrolledDeferredAction](self, "scrolledDeferredAction", a3));
  objc_msgSend(v3, "scheduleNextRunLoop");

}

- (void)cellContentLoaded:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "tip"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));

  if (v4 == v5)
  {
    -[TPSTipsViewController cancelAssetsPrefetch](self, "cancelAssetsPrefetch");
    -[TPSTipsViewController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "prefetchMediaPrefetchDelay", 0, 0.75);
  }
}

- (void)cancelAssetsPrefetch
{
  id v3;

  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "prefetchMediaPrefetchDelay", 0);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController assetPrefetchingManager](self, "assetPrefetchingManager"));
  objc_msgSend(v3, "cancel");

}

- (void)prefetchMediaPrefetchDelay
{
  void *v3;
  _BOOL8 v4;
  TPSTip *currentTip;
  void *v6;
  id v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController traitCollection](self, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceStyle") == (id)2;

  v7 = (id)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController assetPrefetchingManager](self, "assetPrefetchingManager"));
  currentTip = self->_currentTip;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tips](self, "tips"));
  objc_msgSend(v7, "prefetchAssetsFromTip:tips:assetUserInterfaceStyle:", currentTip, v6, v4);

}

- (void)tipCollectionViewCell:(id)a3 showSafariViewForURL:(id)a4
{
  id v5;
  id v6;

  if (a4)
  {
    v5 = a4;
    v6 = objc_msgSend(objc_alloc((Class)SFSafariViewController), "initWithURL:", v5);

    objc_msgSend(v6, "setDelegate:", self);
    -[TPSTipsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v6, 1, 0);

  }
}

- (void)tipCollectionViewCell:(id)a3 showTryItModeForURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  if (a4 && self->_currentTip)
  {
    v5 = a4;
    v6 = objc_alloc((Class)TryItViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController collectionID](self, "collectionID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "correlationID"));
    v12 = objc_msgSend(v6, "initWithLessonURL:tipID:collectionID:correlationID:", v5, v8, v9, v11);

    -[TPSTipsViewController setTryItViewController:](self, "setTryItViewController:", v12);
    if (+[TPSCommonDefines isPhoneUI](TPSCommonDefines, "isPhoneUI"))
      v13 = 0;
    else
      v13 = 2;
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tryItViewController](self, "tryItViewController"));
    objc_msgSend(v14, "setModalPresentationStyle:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tryItViewController](self, "tryItViewController"));
    objc_msgSend(v15, "setModalInPresentation:", 1);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tryItViewController](self, "tryItViewController"));
    -[TPSTipsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v16, 1, 0);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController tryItViewController](self, "tryItViewController"));
    objc_msgSend(v17, "setDelegate:", self);

    -[TPSTipsViewController stopVideoForCurrentTip](self, "stopVideoForCurrentTip");
  }
}

- (void)tipCollectionViewCell:(id)a3 showVideoForURL:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  if (a4)
  {
    v5 = a4;
    v6 = objc_alloc_init((Class)AVPlayerViewController);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[AVPlayer playerWithURL:](AVPlayer, "playerWithURL:", v5));

    objc_msgSend(v6, "setPlayer:", v7);
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000275CC;
    v9[3] = &unk_1000A2B18;
    v10 = v6;
    v8 = v6;
    -[TPSTipsViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, v9);

  }
}

- (void)tipCollectionViewCell:(id)a3 showUserGuideWithIdentifier:(id)a4 topicId:(id)a5
{
  id v7;
  void *v8;
  char v9;
  void *v10;
  id v11;

  v11 = a4;
  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController delegate](self, "delegate"));
  v9 = objc_opt_respondsToSelector(v8, "tipsViewController:loadMainUserGuideWithIdentifier:topicId:");

  if ((v9 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController delegate](self, "delegate"));
    objc_msgSend(v10, "tipsViewController:loadMainUserGuideWithIdentifier:topicId:", self, v11, v7);

  }
}

- (void)tipCollectionViewCell:(id)a3 linkTappedForURL:(id)a4
{
  id v6;
  TPSTip *currentTip;
  void *v8;
  NSString *collectionID;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (self->_isSharedVariant)
    -[TPSTipsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
  if (v6)
  {
    currentTip = self->_currentTip;
    if (currentTip)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip identifier](currentTip, "identifier"));
      collectionID = self->_collectionID;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip correlationID](self->_currentTip, "correlationID"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip clientConditionID](self->_currentTip, "clientConditionID"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[TPSAnalyticsEventContentLinkTapped eventWithContentID:collectionID:correlationID:clientConditionID:url:](TPSAnalyticsEventContentLinkTapped, "eventWithContentID:collectionID:correlationID:clientConditionID:url:", v8, collectionID, v10, v11, v6));
      objc_msgSend(v12, "log");

    }
  }

}

- (BOOL)tipCollectionViewCellCanDisplayAssets:(id)a3
{
  return !self->_scrollingTipContent;
}

- (void)tipCollectionViewCellHandleTripleTapInternalGesture:(id)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController currentTip](self, "currentTip"));
  objc_msgSend(v5, "overrideWidgetWithTip:", v4);

}

- (void)tipCollectionViewCellSharedTipTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  char v12;
  id v13;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController", a3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTip correlationID](self->_currentTip, "correlationID"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tipForCorrelationIdentifier:", v5));

  v6 = v13;
  if (v13)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSAppViewController appController](self, "appController"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionIdentifierForTipIdentifier:", v8));
    if (!v9)
    {
LABEL_5:

      v6 = v13;
      goto LABEL_6;
    }
    v10 = (void *)v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController delegate](self, "delegate"));
    v12 = objc_opt_respondsToSelector(v11, "tipsViewController:showSharedTipWithTipIdentifier:");

    v6 = v13;
    if ((v12 & 1) != 0)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TPSTipsViewController delegate](self, "delegate"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "identifier"));
      objc_msgSend(v7, "tipsViewController:showSharedTipWithTipIdentifier:", self, v8);
      goto LABEL_5;
    }
  }
LABEL_6:

}

- (void)safariViewControllerDidFinish:(id)a3
{
  -[TPSTipsViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0);
}

- (void)pageControlLongPressedForHUD:(id)a3 withText:(id)a4
{
  id v5;
  id v6;

  v6 = a4;
  if (objc_msgSend(v6, "length"))
  {
    v5 = objc_msgSend(objc_alloc((Class)UIAccessibilityHUDItem), "initWithTitle:image:imageInsets:", v6, 0, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right);
    -[TPSTipsViewController _showAccessibilityHUDItem:](self, "_showAccessibilityHUDItem:", v5);

  }
}

- (void)pageControlCancelLongPressedForHUD:(id)a3
{
  -[TPSTipsViewController _dismissAccessibilityHUD](self, "_dismissAccessibilityHUD", a3);
}

- (void)deferredActionPerform:(id)a3
{
  -[TPSTipsViewController updateBarMaterial](self, "updateBarMaterial", a3);
}

- (void)tryItViewControllerDidDismissWithTryItViewController:(id)a3
{
  -[TPSTipsViewController setTryItViewController:](self, "setTryItViewController:", 0);
  -[TPSTipsViewController continueVideoForCurrentTip](self, "continueVideoForCurrentTip");
}

- (BOOL)allowBookmarks
{
  return self->_allowBookmarks;
}

- (BOOL)shouldHoldOffVideo
{
  return self->_shouldHoldOffVideo;
}

- (TPSTipsViewControllerDelegate)delegate
{
  return (TPSTipsViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSArray)tips
{
  return self->_tips;
}

- (NSString)titleText
{
  return self->_titleText;
}

- (void)setTitleText:(id)a3
{
  objc_storeStrong((id *)&self->_titleText, a3);
}

- (UICollectionView)collectionView
{
  return self->_collectionView;
}

- (void)setCollectionView:(id)a3
{
  objc_storeStrong((id *)&self->_collectionView, a3);
}

- (NSString)collectionID
{
  return self->_collectionID;
}

- (void)setCollectionID:(id)a3
{
  objc_storeStrong((id *)&self->_collectionID, a3);
}

- (UIColor)contentBackgroundColor
{
  return self->_contentBackgroundColor;
}

- (void)setContentBackgroundColor:(id)a3
{
  objc_storeStrong((id *)&self->_contentBackgroundColor, a3);
}

- (BOOL)scrollingTipContent
{
  return self->_scrollingTipContent;
}

- (void)setScrollingTipContent:(BOOL)a3
{
  self->_scrollingTipContent = a3;
}

- (BOOL)updatingSize
{
  return self->_updatingSize;
}

- (void)setUpdatingSize:(BOOL)a3
{
  self->_updatingSize = a3;
}

- (BOOL)presentingShareSheet
{
  return self->_presentingShareSheet;
}

- (void)setPresentingShareSheet:(BOOL)a3
{
  self->_presentingShareSheet = a3;
}

- (TPSSizes)tipSizes
{
  return self->_tipSizes;
}

- (void)setTipSizes:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 232);
}

- (TPSDeferredAction)scrolledDeferredAction
{
  return self->_scrolledDeferredAction;
}

- (void)setScrolledDeferredAction:(id)a3
{
  objc_storeStrong((id *)&self->_scrolledDeferredAction, a3);
}

- (TPSTipCellAppearance)cellAppearance
{
  return self->_cellAppearance;
}

- (void)setCellAppearance:(id)a3
{
  objc_storeStrong((id *)&self->_cellAppearance, a3);
}

- (TPSAnalyticsEventContentViewed)currentSwipeEvent
{
  return self->_currentSwipeEvent;
}

- (void)setCurrentSwipeEvent:(id)a3
{
  objc_storeStrong((id *)&self->_currentSwipeEvent, a3);
}

- (TPSKVOManager)KVOManager
{
  return self->_KVOManager;
}

- (void)setKVOManager:(id)a3
{
  objc_storeStrong((id *)&self->_KVOManager, a3);
}

- (TPSPageControl)pageControl
{
  return self->_pageControl;
}

- (void)setPageControl:(id)a3
{
  objc_storeStrong((id *)&self->_pageControl, a3);
}

- (TPSSavedTipsManager)savedTipsManager
{
  return self->_savedTipsManager;
}

- (void)setSavedTipsManager:(id)a3
{
  objc_storeStrong((id *)&self->_savedTipsManager, a3);
}

- (TPSTipsAssetPrefetchingManager)assetPrefetchingManager
{
  return self->_assetPrefetchingManager;
}

- (NSLayoutConstraint)pageControlBottomConstraint
{
  return self->_pageControlBottomConstraint;
}

- (void)setPageControlBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_pageControlBottomConstraint, a3);
}

- (TPSSearchResultViewModel)searchResultViewModel
{
  return self->_searchResultViewModel;
}

- (void)setSearchResultViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultViewModel, a3);
}

- (UINavigationController)searchResultsNavigationController
{
  return self->_searchResultsNavigationController;
}

- (void)setSearchResultsNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_searchResultsNavigationController, a3);
}

- (UISearchController)searchController
{
  return self->_searchController;
}

- (void)setSearchController:(id)a3
{
  objc_storeStrong((id *)&self->_searchController, a3);
}

- (UIBarButtonItem)saveBarButton
{
  return self->_saveBarButton;
}

- (void)setSaveBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_saveBarButton, a3);
}

- (UIBarButtonItem)searchBarButton
{
  return self->_searchBarButton;
}

- (void)setSearchBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_searchBarButton, a3);
}

- (UIBarButtonItem)shareBarButton
{
  return self->_shareBarButton;
}

- (void)setShareBarButton:(id)a3
{
  objc_storeStrong((id *)&self->_shareBarButton, a3);
}

- (BOOL)isSharedVariant
{
  return self->_isSharedVariant;
}

- (void)setIsSharedVariant:(BOOL)a3
{
  self->_isSharedVariant = a3;
}

- (TryItViewController)tryItViewController
{
  return self->_tryItViewController;
}

- (void)setTryItViewController:(id)a3
{
  objc_storeStrong((id *)&self->_tryItViewController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tryItViewController, 0);
  objc_storeStrong((id *)&self->_shareBarButton, 0);
  objc_storeStrong((id *)&self->_searchBarButton, 0);
  objc_storeStrong((id *)&self->_saveBarButton, 0);
  objc_storeStrong((id *)&self->_searchController, 0);
  objc_storeStrong((id *)&self->_searchResultsNavigationController, 0);
  objc_storeStrong((id *)&self->_searchResultViewModel, 0);
  objc_storeStrong((id *)&self->_pageControlBottomConstraint, 0);
  objc_storeStrong((id *)&self->_assetPrefetchingManager, 0);
  objc_storeStrong((id *)&self->_savedTipsManager, 0);
  objc_storeStrong((id *)&self->_pageControl, 0);
  objc_storeStrong((id *)&self->_KVOManager, 0);
  objc_storeStrong((id *)&self->_currentSwipeEvent, 0);
  objc_storeStrong((id *)&self->_cellAppearance, 0);
  objc_storeStrong((id *)&self->_scrolledDeferredAction, 0);
  objc_storeStrong((id *)&self->_tipSizes, 0);
  objc_storeStrong((id *)&self->_contentBackgroundColor, 0);
  objc_storeStrong((id *)&self->_collectionID, 0);
  objc_storeStrong((id *)&self->_currentTip, 0);
  objc_storeStrong((id *)&self->_collectionView, 0);
  objc_storeStrong((id *)&self->_titleText, 0);
  objc_storeStrong((id *)&self->_tips, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_previousTipTimeSpentEvent, 0);
  objc_storeStrong((id *)&self->_collectionViewLayout, 0);
  objc_storeStrong((id *)&self->_tipsMap, 0);
  objc_storeStrong((id *)&self->_navigationTitleTextColor, 0);
}

- (void)setupSearchViewModel
{
  TPSTipsViewController *v2;

  v2 = self;
  sub_1000331E4();

}

- (void)dismissSearch
{
  UISearchController *v2;
  UISearchController *v3;
  UISearchBar *v4;
  TPSTipsViewController *v5;
  TPSTipsViewController *v6;

  v6 = self;
  v2 = -[TPSTipsViewController searchController](v6, "searchController");
  if (v2)
  {
    v3 = v2;
    v4 = -[UISearchController searchBar](v2, "searchBar");

    -[UISearchBar resignFirstResponder](v4, "resignFirstResponder");
    v5 = (TPSTipsViewController *)v4;
  }
  else
  {
    v5 = v6;
  }

}

- (void)shareCurrentTip:(id)a3
{
  TPSTipsViewController *v5;
  uint64_t v6;
  uint64_t v7;
  TPSTipsViewController *v8;
  _OWORD v9[2];

  if (a3)
  {
    v5 = self;
    v7 = swift_unknownObjectRetain(a3, v6);
    _bridgeAnyObjectToAny(_:)(v9, v7);
    swift_unknownObjectRelease(a3);
  }
  else
  {
    memset(v9, 0, sizeof(v9));
    v8 = self;
  }
  sub_100042514();

  sub_100011DE0((uint64_t)v9, &qword_1000B49D0);
}

@end
