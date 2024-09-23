@implementation BKLibraryCollectionsListViewController

- (BKLibraryCollectionsListViewController)initWithSelectedBookIDs:(id)a3 knownAssetTypes:(id)a4 knownStoreAssetIDs:(id)a5 containsSeriesContainer:(BOOL)a6 showDivider:(BOOL)a7
{
  id v12;
  id v13;
  id v14;
  BKLibraryCollectionsListViewController *v15;
  BKLibraryBookshelfMetrics *v16;
  BKLibraryBookshelfMetrics *bookshelfMetrics;
  NSArray *v18;
  NSArray *assetIDs;
  NSArray *v20;
  NSArray *knownAssetTypes;
  void *v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  id v26;
  BUCoalescingCallBlock *v27;
  BUCoalescingCallBlock *coalescedTableViewReloadData;
  void *v29;
  id v30;
  void **v32;
  uint64_t v33;
  void (*v34)(uint64_t, void *);
  void *v35;
  id v36;
  id location;
  objc_super v38;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v38.receiver = self;
  v38.super_class = (Class)BKLibraryCollectionsListViewController;
  v15 = -[BKLibraryCollectionsListViewController init](&v38, "init");
  if (v15)
  {
    v16 = -[BKLibraryBookshelfMetrics initWithObserver:]([BKLibraryBookshelfMetrics alloc], "initWithObserver:", v15);
    bookshelfMetrics = v15->_bookshelfMetrics;
    v15->_bookshelfMetrics = v16;

    v18 = (NSArray *)objc_msgSend(v12, "copy");
    assetIDs = v15->_assetIDs;
    v15->_assetIDs = v18;

    v20 = (NSArray *)objc_msgSend(v13, "copy");
    knownAssetTypes = v15->_knownAssetTypes;
    v15->_knownAssetTypes = v20;

    objc_storeStrong((id *)&v15->_knownStoreAssetIDs, a5);
    v15->_containsSeriesContainer = a6;
    v15->_showDivider = a7;
    if (objc_msgSend(v12, "count"))
    {
      v15->_isAddingToCollection = 1;
    }
    else if (!v15->_isAddingToCollection)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v23 = v22;
      v24 = CFSTR("Collections");
      goto LABEL_6;
    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = v22;
    v24 = CFSTR("Add to Collection");
LABEL_6:
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", v24, &stru_10091C438, 0));
    -[BKLibraryCollectionsListViewController setTitle:](v15, "setTitle:", v25);

    objc_initWeak(&location, v15);
    v26 = objc_alloc((Class)BUCoalescingCallBlock);
    v32 = _NSConcreteStackBlock;
    v33 = 3221225472;
    v34 = sub_100178804;
    v35 = &unk_1008E8718;
    objc_copyWeak(&v36, &location);
    v27 = (BUCoalescingCallBlock *)objc_msgSend(v26, "initWithNotifyBlock:blockDescription:", &v32, CFSTR("BKLibraryCollectionsListViewController"));
    coalescedTableViewReloadData = v15->_coalescedTableViewReloadData;
    v15->_coalescedTableViewReloadData = v27;

    -[BUCoalescingCallBlock setCoalescingDelay:](v15->_coalescedTableViewReloadData, "setCoalescingDelay:", 1.0, v32, v33, v34, v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UITraitCollection bc_allAPITraits](UITraitCollection, "bc_allAPITraits"));
    v30 = -[BKLibraryCollectionsListViewController registerForTraitChanges:withAction:](v15, "registerForTraitChanges:withAction:", v29, "_traitCollectionDidChange:previousTraitCollection:");

    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);
  }

  return v15;
}

- (BKLibraryCollectionsListViewController)init
{
  return -[BKLibraryCollectionsListViewController initWithSelectedBookIDs:knownAssetTypes:knownStoreAssetIDs:containsSeriesContainer:showDivider:](self, "initWithSelectedBookIDs:knownAssetTypes:knownStoreAssetIDs:containsSeriesContainer:showDivider:", 0, 0, 0, 0, 0);
}

- (void)releaseViews
{
  NSFetchedResultsController *fetchedResultsController;
  UITableView *tableView;
  UIView *prefixFooterView;
  UIBarButtonItem *navBarEditButtonItem;
  void *v7;
  objc_super v8;

  -[NSFetchedResultsController setDelegate:](self->_fetchedResultsController, "setDelegate:", 0);
  fetchedResultsController = self->_fetchedResultsController;
  self->_fetchedResultsController = 0;

  -[UITableView setDelegate:](self->_tableView, "setDelegate:", 0);
  -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);
  tableView = self->_tableView;
  self->_tableView = 0;

  prefixFooterView = self->_prefixFooterView;
  self->_prefixFooterView = 0;

  navBarEditButtonItem = self->_navBarEditButtonItem;
  self->_navBarEditButtonItem = 0;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCell](self, "textEntryCell"));
  objc_msgSend(v7, "removeTextEntryField");

  -[BKLibraryCollectionsListViewController setTextEntryCell:](self, "setTextEntryCell:", 0);
  v8.receiver = self;
  v8.super_class = (Class)BKLibraryCollectionsListViewController;
  -[BKLibraryCollectionsListViewController releaseViews](&v8, "releaseViews");
}

- (void)dealloc
{
  objc_super v3;

  -[BKLibraryCollectionsListViewController releaseViews](self, "releaseViews");
  -[BKLibraryCollectionsListViewController releaseAllRecomputableMemory](self, "releaseAllRecomputableMemory");
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryCollectionsListViewController;
  -[BKLibraryCollectionsListViewController dealloc](&v3, "dealloc");
}

- (id)defaultCollectionName
{
  return 0;
}

- (void)_updateMetricsIfNeeded
{
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;
  double v8;
  double v9;
  id v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController viewIfLoaded](self, "viewIfLoaded"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController traitCollection](self, "traitCollection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "window"));
  if (v17 && v3 && v4)
  {
    v5 = objc_alloc((Class)TUIEnvironment);
    objc_msgSend(v17, "bounds");
    v7 = v6;
    v9 = v8;
    objc_msgSend(v4, "bounds");
    v10 = objc_msgSend(v5, "initWithTraitCollection:viewController:viewSize:windowSize:", v3, self, v7, v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController bookshelfMetrics](self, "bookshelfMetrics"));
    v12 = objc_msgSend(v11, "updateIfNeededWithEnvironment:bookshelfLayoutMode:editMode:isPopover:", v10, 0, 0, -[BKLibraryCollectionsListViewController _isInPopoverPresentation](self, "_isInPopoverPresentation"));

    if (v12)
    {
      objc_msgSend(v17, "setNeedsLayout");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController bookshelfMetrics](self, "bookshelfMetrics"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "computedMetrics"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryCollectionsListMetrics sectionName](BKLibraryCollectionsListMetrics, "sectionName"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", v15));
      -[BKLibraryCollectionsListViewController setMetrics:](self, "setMetrics:", v16);

    }
  }

}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)BKLibraryCollectionsListViewController;
  -[BKLibraryCollectionsListViewController viewDidLoad](&v10, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController metrics](self, "metrics"));
  self->_wantsAddCollectionRow = 1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController view](self, "view"));
  objc_msgSend(v4, "setAutoresizingMask:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController view](self, "view"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setSpringLoaded:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "view"));
  objc_msgSend(v8, "setAccessibilityIgnoresInvertColors:", 1);

  -[BKLibraryCollectionsListViewController p_updatePopoverFromMetricsIfNeeded:](self, "p_updatePopoverFromMetricsIfNeeded:", v3);
  -[BKLibraryCollectionsListViewController p_updateTableViewFromMetrics:](self, "p_updateTableViewFromMetrics:", v3);
  objc_msgSend(v5, "addSubview:", v6);
  if (-[BKLibraryCollectionsListViewController isAddingToCollection](self, "isAddingToCollection")
    || -[BKLibraryCollectionsListViewController supressLargeTitle](self, "supressLargeTitle"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v9, "setLargeTitleDisplayMode:", 2);

  }
  -[BKLibraryCollectionsListViewController resetNavigationBarButtons](self, "resetNavigationBarButtons");

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  const __CFString *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  NSDate *v14;
  NSDate *analyticsAppearDate;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)BKLibraryCollectionsListViewController;
  -[BKLibraryCollectionsListViewController viewWillAppear:](&v21, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController ba_analyticsTracker](self, "ba_analyticsTracker"));

  if (!v4)
  {
    if (-[BKLibraryCollectionsListViewController isAddingToCollection](self, "isAddingToCollection"))
      v5 = CFSTR("AddToCollection");
    else
      v5 = CFSTR("CollectionList");
    v6 = -[BKLibraryCollectionsListViewController ba_setupNewAnalyticsTrackerWithName:](self, "ba_setupNewAnalyticsTrackerWithName:", v5);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController navigationController](self, "navigationController"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "navigationBar"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "standardAppearance"));
  v10 = objc_msgSend(v9, "copy");

  objc_msgSend(v10, "configureWithOpaqueBackground");
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v10, "setShadowColor:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController navigationController](self, "navigationController"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "navigationBar"));
  objc_msgSend(v13, "setScrollEdgeAppearance:", v10);

  v14 = (NSDate *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  analyticsAppearDate = self->_analyticsAppearDate;
  self->_analyticsAppearDate = v14;

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "keyboardWillShow:", UIKeyboardWillShowNotification, 0);
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "keyboardWillHide:", UIKeyboardWillHideNotification, 0);
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "keyboardDidHide:", UIKeyboardDidHideNotification, 0);
  objc_msgSend(v16, "addObserver:selector:name:object:", self, "managedObjectContextDidSave:", NSManagedObjectContextDidSaveNotification, 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  objc_msgSend(v17, "reloadData");

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController selectedCollection](self, "selectedCollection"));
  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController selectedCollection](self, "selectedCollection"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _indexPathForCollection:](self, "_indexPathForCollection:", v19));

    if (v20)
      -[BKLibraryCollectionsListViewController scrollToIndexPath:animated:](self, "scrollToIndexPath:animated:", v20, 0);

  }
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  dispatch_time_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BKLibraryCollectionsListViewController;
  -[BKLibraryCollectionsListViewController viewDidAppear:](&v6, "viewDidAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  objc_msgSend(v4, "flashScrollIndicators");

  v5 = dispatch_time(0, 500000000);
  dispatch_after(v5, (dispatch_queue_t)&_dispatch_main_q, &stru_1008ED1E0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)BKLibraryCollectionsListViewController;
  -[BKLibraryCollectionsListViewController viewWillDisappear:](&v8, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController navigationController](self, "navigationController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "navigationBar"));
  objc_msgSend(v5, "setScrollEdgeAppearance:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
  -[BKLibraryCollectionsListViewController _analyticsSubmitBrowseCollectionScreenViewEventWithTracker:](self, "_analyticsSubmitBrowseCollectionScreenViewEventWithTracker:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "removeObserver:name:object:", self, UIKeyboardWillShowNotification, 0);
  objc_msgSend(v7, "removeObserver:name:object:", self, UIKeyboardWillHideNotification, 0);
  objc_msgSend(v7, "removeObserver:name:object:", self, UIKeyboardDidHideNotification, 0);
  objc_msgSend(v7, "removeObserver:name:object:", self, NSManagedObjectContextDidSaveNotification, 0);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[BKLibraryCollectionsListViewController setEditing:animated:](self, "setEditing:animated:", 0, 0);
  v5.receiver = self;
  v5.super_class = (Class)BKLibraryCollectionsListViewController;
  -[BKLibraryCollectionsListViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
  -[BKLibraryCollectionsListViewController setCollectionAssetCounts:](self, "setCollectionAssetCounts:", 0);
}

- (void)viewDidMoveToWindow:(id)a3 shouldAppearOrDisappear:(BOOL)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BKLibraryCollectionsListViewController;
  -[BKLibraryCollectionsListViewController viewDidMoveToWindow:shouldAppearOrDisappear:](&v5, "viewDidMoveToWindow:shouldAppearOrDisappear:", a3, a4);
  -[BKLibraryCollectionsListViewController _updateMetricsIfNeeded](self, "_updateMetricsIfNeeded");
}

- (id)p_firstVisibleCollection
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixCollections](self, "prefixCollections"));
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
    if (objc_msgSend(v5, "count"))
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
    else
      v4 = 0;

  }
  return v4;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  -[BKLibraryCollectionsListViewController setEditing:animated:reuseAddCollectionRow:completion:](self, "setEditing:animated:reuseAddCollectionRow:completion:", a3, a4, 0, 0);
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4 reuseAddCollectionRow:(BOOL)a5 completion:(id)a6
{
  _BOOL4 v6;
  _BOOL8 v7;
  _BOOL8 v8;
  id v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  id *v17;
  id v18;
  void *v19;
  id v20;
  _QWORD *v21;
  void *v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  void *v31;
  id v32;
  uint64_t v33;
  void *v34;
  id v35;
  dispatch_time_t when;
  void *v37;
  id v38;
  _BOOL4 v39;
  _QWORD *v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  id v48;
  id v49;
  uint64_t v50;
  _QWORD v51[5];
  id v52;
  _QWORD v53[4];
  id v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  _QWORD v59[4];
  id v60;
  BOOL v61;
  _QWORD block[4];
  id v63;
  objc_super v64;

  v6 = a5;
  v7 = a4;
  v8 = a3;
  v10 = a6;
  v64.receiver = self;
  v64.super_class = (Class)BKLibraryCollectionsListViewController;
  -[BKLibraryCollectionsListViewController setEditing:animated:](&v64, "setEditing:animated:", v8, v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setEditing:animated:", v8, v7);
  v12 = !v8 || v6;
  -[BKLibraryCollectionsListViewController _updateBarButtonsAnimated:](self, "_updateBarButtonsAnimated:", v7);
  if (v8 || !self->_endEditingMeansTableReload)
  {
    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10017983C;
    v59[3] = &unk_1008E83C0;
    v61 = v8;
    v20 = v11;
    v60 = v20;
    v21 = objc_retainBlock(v59);
    if (v7)
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v21, 0.3);
    else
      +[UIView performWithoutAnimation:](UIView, "performWithoutAnimation:", v21);
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixCollections](self, "prefixCollections"));
    v37 = v20;
    if (v12)
      v22 = 0;
    else
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _addCollectionIndexPath](self, "_addCollectionIndexPath"));
    -[BKLibraryCollectionsListViewController setIncludeHiddenInPrefixCollections:](self, "setIncludeHiddenInPrefixCollections:", v8);
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixCollections](self, "prefixCollections"));
    v40 = v21;
    v39 = v12;
    if (v12)
    {
      v23 = objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _addCollectionIndexPath](self, "_addCollectionIndexPath"));

      v41 = (void *)v23;
    }
    else
    {
      v41 = v22;
    }
    v24 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v43);
    v25 = objc_msgSend(objc_alloc((Class)NSSet), "initWithArray:", v42);
    v26 = objc_alloc_init((Class)NSMutableArray);
    v27 = objc_alloc_init((Class)NSMutableArray);
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_100179934;
    v56[3] = &unk_1008ED230;
    v38 = v25;
    v57 = v38;
    v28 = v26;
    v58 = v28;
    objc_msgSend(v43, "enumerateObjectsUsingBlock:", v56);
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1001799AC;
    v53[3] = &unk_1008ED230;
    v29 = v24;
    v54 = v29;
    v30 = v27;
    v55 = v30;
    objc_msgSend(v42, "enumerateObjectsUsingBlock:", v53);
    if (self->_wantsAddCollectionRow != v39)
    {
      if (v39)
      {
        if ((objc_msgSend(v30, "containsObject:", v41) & 1) == 0)
        {
          objc_msgSend(v30, "addObject:", v41);
          v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v41, "row") - 1, objc_msgSend(v41, "section")));
          when = dispatch_time(0, 500000000);
          v51[0] = _NSConcreteStackBlock;
          v51[1] = 3221225472;
          v51[2] = sub_100179A24;
          v51[3] = &unk_1008E7338;
          v51[4] = self;
          v52 = v31;
          v32 = v31;
          dispatch_after(when, (dispatch_queue_t)&_dispatch_main_q, v51);

        }
      }
      else if ((objc_msgSend(v28, "containsObject:", v41) & 1) == 0)
      {
        objc_msgSend(v28, "addObject:", v41);
      }
      self->_wantsAddCollectionRow = v39;
    }
    v17 = &v60;
    if (objc_msgSend(v28, "count") || objc_msgSend(v30, "count"))
    {
      if (v7)
        v33 = 0;
      else
        v33 = 5;
      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100179A88;
      v46[3] = &unk_1008EB4A8;
      v47 = v28;
      v48 = v37;
      v50 = v33;
      v49 = v30;
      v44[0] = _NSConcreteStackBlock;
      v44[1] = 3221225472;
      v44[2] = sub_100179ADC;
      v44[3] = &unk_1008E7B98;
      v45 = v10;
      objc_msgSend(v48, "performBatchUpdates:completion:", v46, v44);

      v34 = v47;
    }
    else
    {
      v35 = objc_retainBlock(v10);
      v34 = v35;
      if (v35)
        (*((void (**)(id))v35 + 2))(v35);
    }

    v19 = v40;
  }
  else
  {
    self->_endEditingMeansTableReload = 0;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController selectedCollection](self, "selectedCollection"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "deletedFlag"));
    v15 = objc_msgSend(v14, "BOOLValue");

    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController p_firstVisibleCollection](self, "p_firstVisibleCollection"));
      -[BKLibraryCollectionsListViewController setSelectedCollection:](self, "setSelectedCollection:", v16);

    }
    self->_wantsAddCollectionRow = v12;
    -[BKLibraryCollectionsListViewController setIncludeHiddenInPrefixCollections:](self, "setIncludeHiddenInPrefixCollections:", 0);
    -[BKLibraryCollectionsListViewController setUserCollections:](self, "setUserCollections:", 0);
    -[BKLibraryCollectionsListViewController setCollectionAssetCounts:](self, "setCollectionAssetCounts:", 0);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100179834;
    block[3] = &unk_1008E72C0;
    v17 = &v63;
    v63 = v11;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v18 = objc_retainBlock(v10);
    v19 = v18;
    if (v18)
      (*((void (**)(id))v18 + 2))(v18);
  }

}

- (void)toggleEditButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  unsigned __int8 v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  if (objc_msgSend(v4, "hasActiveDrag"))
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
    v6 = objc_msgSend(v5, "hasActiveDrop");

    if ((v6 & 1) == 0)
    {
      if (-[BKLibraryCollectionsListViewController isEditing](self, "isEditing"))
        -[BKLibraryCollectionsListViewController stopEditButtonPressed:](self, "stopEditButtonPressed:", v7);
      else
        -[BKLibraryCollectionsListViewController startEditButtonPressed:](self, "startEditButtonPressed:", v7);
    }
  }

}

- (void)startEditButtonPressed:(id)a3
{
  -[BKLibraryCollectionsListViewController setEditing:animated:](self, "setEditing:animated:", 1, 1);
}

- (void)stopEditButtonPressed:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;

  if (-[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCell](self, "textEntryCell"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textEntryField"));
    v6 = objc_msgSend(v5, "isFirstResponder");

    if (v6)
    {
      self->_endTextEditingMeansEndEditMode = 1;
      -[BKLibraryCollectionsListViewController endTextEditing](self, "endTextEditing");
    }
  }
  else
  {
    -[BKLibraryCollectionsListViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  }
}

- (void)addCollection:(id)a3
{
  id v4;
  void ***v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  BKLibraryCollectionsListViewController *v10;
  id v11;

  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100179D28;
  v9 = &unk_1008E7338;
  v10 = self;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView", a3));
  v4 = v11;
  v5 = objc_retainBlock(&v6);
  if ((-[BKLibraryCollectionsListViewController isEditing](self, "isEditing", v6, v7, v8, v9, v10) & 1) != 0)
  {
    ((void (*)(void ***))v5[2])(v5);
  }
  else
  {
    self->_suppressEditControlsForNewCollection = 1;
    -[BKLibraryCollectionsListViewController setEditing:animated:reuseAddCollectionRow:completion:](self, "setEditing:animated:reuseAddCollectionRow:completion:", 1, 0, 1, v5);
  }

}

- (void)endTextEditing
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryIndexPath](self, "textEntryIndexPath"));
  -[BKLibraryCollectionsListViewController setPostKeyboardIndexPath:](self, "setPostKeyboardIndexPath:", v3);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCell](self, "textEntryCell"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "textEntryField"));
  objc_msgSend(v4, "resignFirstResponder");

}

- (void)setWantsAddCollectionRow:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _addCollectionIndexPath](self, "_addCollectionIndexPath"));
  -[BKLibraryCollectionsListViewController setWantsAddCollectionRow:indexPath:animated:](self, "setWantsAddCollectionRow:indexPath:animated:", v3, v5, 0);

}

- (void)setWantsAddCollectionRow:(BOOL)a3 indexPath:(id)a4 animated:(BOOL)a5
{
  _BOOL4 v6;
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;
  BOOL v15;

  v6 = a3;
  v8 = a4;
  if (self->_wantsAddCollectionRow != v6)
  {
    self->_wantsAddCollectionRow = v6;
    v10 = v8;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100179FD8;
    v11[3] = &unk_1008ED258;
    v14 = v6;
    v12 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
    v13 = v10;
    v15 = a5;
    v9 = v12;
    objc_msgSend(v9, "performBatchUpdates:completion:", v11, 0);

    v8 = v10;
  }

}

- (UIBarButtonItem)navBarEditButtonItem
{
  UIBarButtonItem *navBarEditButtonItem;
  UIBarButtonItem *v4;
  UIBarButtonItem *v5;

  navBarEditButtonItem = self->_navBarEditButtonItem;
  if (!navBarEditButtonItem)
  {
    v4 = (UIBarButtonItem *)objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithTitle:style:target:action:", 0, 0, self, "toggleEditButtonPressed:");
    v5 = self->_navBarEditButtonItem;
    self->_navBarEditButtonItem = v4;

    navBarEditButtonItem = self->_navBarEditButtonItem;
  }
  return navBarEditButtonItem;
}

- (BOOL)isSelectionEnabledForCollection:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;
  unsigned __int8 v7;

  v4 = a3;
  if (!v4 || !-[BKLibraryCollectionsListViewController isAddingToCollection](self, "isAddingToCollection"))
  {
    v7 = 1;
    goto LABEL_9;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixCollections](self, "prefixCollections"));
  if (!objc_msgSend(v5, "containsObject:", v4))
  {

    goto LABEL_8;
  }
  v6 = -[BKLibraryCollectionsListViewController containsSeriesContainer](self, "containsSeriesContainer");

  if ((v6 & 1) == 0)
  {
LABEL_8:
    v7 = objc_msgSend(v4, "allowsManualAddition");
    goto LABEL_9;
  }
  v7 = 0;
LABEL_9:

  return v7;
}

- (NSArray)prefixCollections
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BCManagedObjectIDMonitor *v9;
  BCManagedObjectIDMonitor *prefixCollectionsMonitor;
  NSArray *prefixCollections;
  void *v12;
  void *v13;
  void *v14;
  NSArray *v15;
  NSArray *v16;
  NSArray *v17;
  NSArray *v18;
  _QWORD v20[4];
  id v21;
  const __CFString *v22;

  if (!self->_prefixCollectionsMonitor)
  {
    v3 = objc_alloc((Class)BCManagedObjectIDMonitor);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "persistentStoreCoordinator"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection predicateForAllDefaultCollections](BKCollection, "predicateForAllDefaultCollections"));
    v22 = CFSTR("hidden");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v22, 1));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v7));
    v9 = (BCManagedObjectIDMonitor *)objc_msgSend(v3, "initWithContext:coordinator:entityName:predicate:mapProperty:propertiesOfInterest:observer:", 0, v5, CFSTR("BKCollection"), v6, CFSTR("collectionID"), v8, self);
    prefixCollectionsMonitor = self->_prefixCollectionsMonitor;
    self->_prefixCollectionsMonitor = v9;

  }
  prefixCollections = self->_prefixCollections;
  if (!prefixCollections)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "collectionProvider"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "selectableDefaultCollections"));

    if (-[BKLibraryCollectionsListViewController includeHiddenInPrefixCollections](self, "includeHiddenInPrefixCollections"))
    {
      v15 = v14;
      v16 = self->_prefixCollections;
      self->_prefixCollections = v15;
    }
    else
    {
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10017A3D4;
      v20[3] = &unk_1008ED280;
      v21 = objc_alloc_init((Class)NSMutableArray);
      v16 = (NSArray *)v21;
      objc_msgSend(v14, "enumerateObjectsUsingBlock:", v20);
      v17 = (NSArray *)-[NSArray copy](v16, "copy");
      v18 = self->_prefixCollections;
      self->_prefixCollections = v17;

    }
    prefixCollections = self->_prefixCollections;
  }
  return prefixCollections;
}

- (void)setIncludeHiddenInPrefixCollections:(BOOL)a3
{
  if (self->_includeHiddenInPrefixCollections != a3)
  {
    self->_includeHiddenInPrefixCollections = a3;
    -[BKLibraryCollectionsListViewController invalidatePrefixCollections](self, "invalidatePrefixCollections");
  }
}

- (void)invalidatePrefixCollections
{
  NSArray *prefixCollections;

  prefixCollections = self->_prefixCollections;
  self->_prefixCollections = 0;

}

- (void)managedObjectBackgroundMonitor:(id)a3 didSaveNotify:(id)a4
{
  void *v5;
  id v6;
  id v7;
  _QWORD block[4];
  id v9;
  id v10;
  id location;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "updatedObjects", a3));
  v6 = objc_msgSend(v5, "copy");

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10017A534;
  block[3] = &unk_1008EAF88;
  objc_copyWeak(&v10, &location);
  v9 = v6;
  v7 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)managedObjectContextDidSave:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSPredicate *v17;
  id v18;
  id v19;
  _QWORD *v20;
  id v21;
  _QWORD block[4];
  id v23;
  id v24;
  id location;
  _QWORD v26[4];
  id v27;
  id v28;

  v4 = a3;
  v5 = objc_opt_class(BKLibraryManagedObjectContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "object"));
  v7 = BUDynamicCast(v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "persistentStoreCoordinator"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "persistentStoreCoordinator"));
    v12 = objc_msgSend(v9, "hasStoreInCommonWith:", v11);

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userInfo"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", NSInsertedObjectsKey));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", NSUpdatedObjectsKey));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", NSDeletedObjectsKey));
      if (objc_msgSend(v14, "count") || objc_msgSend(v15, "count") || objc_msgSend(v16, "count"))
      {
        v17 = +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("self isKindOfClass: %@"), objc_opt_class(BKCollectionMember));
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10017AC98;
        v26[3] = &unk_1008ED2D0;
        v27 = (id)objc_claimAutoreleasedReturnValue(v17);
        v18 = objc_alloc_init((Class)NSMutableSet);
        v28 = v18;
        v19 = v27;
        v20 = objc_retainBlock(v26);
        ((void (*)(_QWORD *, void *))v20[2])(v20, v14);
        ((void (*)(_QWORD *, void *))v20[2])(v20, v15);
        ((void (*)(_QWORD *, void *))v20[2])(v20, v16);
        objc_initWeak(&location, self);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_10017ADFC;
        block[3] = &unk_1008E74F0;
        v23 = v18;
        v21 = v18;
        objc_copyWeak(&v24, &location);
        dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
        objc_destroyWeak(&v24);

        objc_destroyWeak(&location);
      }

    }
  }

}

- (NSMutableArray)userCollections
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  NSFetchedResultsController *v10;
  NSFetchedResultsController *fetchedResultsController;
  void *v12;
  unsigned int v13;
  void *v14;
  void *v15;
  NSMutableArray *v16;
  NSMutableArray *userCollections;
  id v19;

  if (!self->_userCollections)
  {
    if (!self->_fetchedResultsController)
    {
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "uiChildContext"));
      v5 = objc_alloc_init((Class)NSFetchRequest);
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("BKCollection"), v4));
      objc_msgSend(v5, "setEntity:", v6);

      v7 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("sortKey"), 1);
      v19 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1));
      objc_msgSend(v5, "setSortDescriptors:", v8);

      v9 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection predicateForNonDeletedUserCollections](BKCollection, "predicateForNonDeletedUserCollections"));
      objc_msgSend(v5, "setPredicate:", v9);

      v10 = (NSFetchedResultsController *)objc_msgSend(objc_alloc((Class)NSFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v5, v4, 0, 0);
      fetchedResultsController = self->_fetchedResultsController;
      self->_fetchedResultsController = v10;

      -[NSFetchedResultsController setDelegate:](self->_fetchedResultsController, "setDelegate:", self);
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController fetchedResultsController](self, "fetchedResultsController"));
    v13 = objc_msgSend(v12, "performFetch:", 0);

    if (v13)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController fetchedResultsController](self, "fetchedResultsController"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "fetchedObjects"));
      v16 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v15));
      userCollections = self->_userCollections;
      self->_userCollections = v16;

    }
  }
  return self->_userCollections;
}

- (void)_updateInsets
{
  double v3;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
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
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat r2;
  void *r2a;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  v3 = 0.0;
  if ((-[BKLibraryCollectionsListViewController _isInPopoverPresentation](self, "_isInPopoverPresentation") & 1) == 0)
  {
    -[BKLibraryCollectionsListViewController keyboardFrame](self, "keyboardFrame");
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
    if (!CGRectIsEmpty(v23))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController view](self, "view"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "safeAreaLayoutGuide"));
      objc_msgSend(v9, "layoutFrame");
      v11 = v10;
      v13 = v12;
      v15 = v14;
      r2 = v16;

      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      v27.origin.x = v11;
      v27.origin.y = v13;
      v27.size.width = v15;
      v27.size.height = r2;
      v25 = CGRectIntersection(v24, v27);
      v17 = v25.origin.x;
      v18 = v25.origin.y;
      v19 = v25.size.width;
      v20 = v25.size.height;
      if (!CGRectIsNull(v25))
      {
        v26.origin.x = v17;
        v26.origin.y = v18;
        v26.size.width = v19;
        v26.size.height = v20;
        v3 = CGRectGetHeight(v26);
      }
    }
  }
  r2a = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  objc_msgSend(r2a, "setContentInset:", 0.0, 0.0, v3, 0.0);
  objc_msgSend(r2a, "setScrollIndicatorInsets:", 0.0, 0.0, v3, 0.0);

}

- (void)viewDidLayoutSubviews
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
  void *v13;
  double Width;
  void *v15;
  void *v16;
  id v17;
  double Height;
  void *v19;
  void *v20;
  double v21;
  double v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;
  CGRect v28;
  CGRect v29;

  v27.receiver = self;
  v27.super_class = (Class)BKLibraryCollectionsListViewController;
  -[BKLibraryCollectionsListViewController viewDidLayoutSubviews](&v27, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

  -[BKLibraryCollectionsListViewController _updateInsets](self, "_updateInsets");
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  objc_msgSend(v13, "bounds");
  Width = CGRectGetWidth(v28);

  LODWORD(v12) = -[BKLibraryCollectionsListViewController _isInPopoverPresentation](self, "_isInPopoverPresentation");
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController headerSeparatorView](self, "headerSeparatorView"));
  v16 = v15;
  if ((_DWORD)v12)
  {

    if (!v16)
      return;
    -[BKLibraryCollectionsListViewController setHeaderSeparatorView:](self, "setHeaderSeparatorView:", 0);
    v17 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
    objc_msgSend(v17, "setTableHeaderView:", 0);
  }
  else
  {

    if (v16)
    {
      v17 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController headerSeparatorView](self, "headerSeparatorView"));
      objc_msgSend(v17, "bounds");
      Height = CGRectGetHeight(v29);
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController headerSeparatorView](self, "headerSeparatorView"));
      objc_msgSend(v19, "setFrame:", 0.0, 0.0, Width, Height);

    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v20, "scale");
      v22 = 1.0 / v21;

      v17 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, Width, v22);
      v23 = objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, Width, v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "separatorColor"));
      objc_msgSend(v23, "setBackgroundColor:", v25);

      objc_msgSend(v17, "addSubview:", v23);
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
      objc_msgSend(v26, "setTableHeaderView:", v17);

      -[BKLibraryCollectionsListViewController setHeaderSeparatorView:](self, "setHeaderSeparatorView:", v23);
    }
  }

}

- (unint64_t)supportedInterfaceOrientations
{
  if (isPad(self, a2))
    return 30;
  else
    return 2;
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height;
  double width;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  objc_super v13;

  height = a3.height;
  width = a3.width;
  v13.receiver = self;
  v13.super_class = (Class)BKLibraryCollectionsListViewController;
  v7 = a4;
  -[BKLibraryCollectionsListViewController viewWillTransitionToSize:withTransitionCoordinator:](&v13, "viewWillTransitionToSize:withTransitionCoordinator:", v7, width, height);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController selectedCollection](self, "selectedCollection"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _indexPathForCollection:](self, "_indexPathForCollection:", v8));

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10017B60C;
  v11[3] = &unk_1008E7868;
  v11[4] = self;
  v12 = v9;
  v10 = v9;
  objc_msgSend(v7, "animateAlongsideTransition:completion:", v11, 0);

}

- (void)resetNavigationBarButtons
{
  -[BKLibraryCollectionsListViewController _updateBarButtonsAnimated:](self, "_updateBarButtonsAnimated:", 0);
}

- (void)_updateBarButtonsAnimated:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  unsigned int v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  uint64_t v22;

  v3 = a3;
  v5 = -[BKLibraryCollectionsListViewController isEditing](self, "isEditing");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v7 = v6;
  if (v5)
    v8 = CFSTR("Done");
  else
    v8 = CFSTR("Edit");
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_10091C438, 0));

  if (!-[BKLibraryCollectionsListViewController isAddingToCollection](self, "isAddingToCollection"))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController navBarEditButtonItem](self, "navBarEditButtonItem"));
    if (v5)
      v11 = 2;
    else
      v11 = 0;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController navigationItem](self, "navigationItem"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "rightBarButtonItems"));
    v14 = objc_msgSend(v13, "containsObject:", v10);

    if (v14)
    {
      if ((id)v11 != objc_msgSend(v10, "style")
        || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title")),
            v16 = objc_msgSend(v9, "isEqualToString:", v15),
            v15,
            (v16 & 1) == 0))
      {
        if (v3)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController navigationController](self, "navigationController"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "navigationBar"));
          v19[0] = _NSConcreteStackBlock;
          v19[1] = 3221225472;
          v19[2] = sub_10017B868;
          v19[3] = &unk_1008E8BE8;
          v20 = v10;
          v21 = v9;
          v22 = v11;
          +[UIView transitionWithView:duration:options:animations:completion:](UIView, "transitionWithView:duration:options:animations:completion:", v18, 5242880, v19, 0, 0.3);

        }
        else
        {
          objc_msgSend(v10, "setTitle:", v9);
          objc_msgSend(v10, "setStyle:", v11);
        }
      }
    }
    else
    {
      objc_msgSend(v10, "setTitle:", v9);
      objc_msgSend(v10, "setStyle:", v11);
      objc_msgSend(v12, "setRightBarButtonItem:animated:", v10, v3);
    }

  }
}

- (UITableView)tableView
{
  UITableView *tableView;
  UITableView *v4;
  UITableView *v5;

  tableView = self->_tableView;
  if (!tableView)
  {
    v4 = (UITableView *)objc_msgSend(objc_alloc((Class)UITableView), "initWithFrame:style:", 0, CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    v5 = self->_tableView;
    self->_tableView = v4;

    -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    -[UITableView setDropDelegate:](self->_tableView, "setDropDelegate:", self);
    -[UITableView setDragDelegate:](self->_tableView, "setDragDelegate:", self);
    -[UITableView setSeparatorStyle:](self->_tableView, "setSeparatorStyle:", 1);
    -[UITableView setEstimatedRowHeight:](self->_tableView, "setEstimatedRowHeight:", 45.0);
    -[UITableView setAllowsSelectionDuringEditing:](self->_tableView, "setAllowsSelectionDuringEditing:", 1);
    -[UITableView setClipsToBounds:](self->_tableView, "setClipsToBounds:", 1);
    -[UITableView setOpaque:](self->_tableView, "setOpaque:", 1);
    -[UITableView setDragInteractionEnabled:](self->_tableView, "setDragInteractionEnabled:", 1);
    tableView = self->_tableView;
  }
  return tableView;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  -[BKLibraryCollectionsListViewController stopEditButtonPressed:](self, "stopEditButtonPressed:", self);
  return 0;
}

- (BOOL)textFieldShouldEndEditing:(id)a3
{
  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void **v22;
  uint64_t v23;
  id (*v24)(uint64_t, void *);
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;

  if (-[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing", a3))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCell](self, "textEntryCell"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textEntryField"));

    if (-[BKLibraryCollectionsListViewController textFieldShouldEndEditing:](self, "textFieldShouldEndEditing:", v5))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "text"));
      if (objc_msgSend(v6, "length"))
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionController"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCollection](self, "textEntryCollection"));
        v10 = v9;
        if (v9)
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "localizedTitle"));
          v12 = objc_msgSend(v11, "isEqualToString:", v6);

          if ((v12 & 1) == 0)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionID"));
            -[BKLibraryCollectionsListViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", 1);
            v27[0] = _NSConcreteStackBlock;
            v27[1] = 3221225472;
            v27[2] = sub_10017BC5C;
            v27[3] = &unk_1008EA4F8;
            v28 = v8;
            v29 = v13;
            v30 = v6;
            v14 = v13;
            objc_msgSend(v7, "performBlockInUIContext:", v27);
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController delegate](self, "delegate"));
            objc_msgSend(v15, "collectionListView:collectionChanged:", self, v10);

          }
        }
        else
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryIndexPath](self, "textEntryIndexPath"));

          if (v16 && objc_msgSend(v6, "length"))
          {
            -[BKLibraryCollectionsListViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", 1);
            v22 = _NSConcreteStackBlock;
            v23 = 3221225472;
            v24 = sub_10017BCCC;
            v25 = &unk_1008ED318;
            v26 = v6;
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "insertNewCollectionSyncOnMainQueueWithCollectionID:newCollectionBlock:", 0, &v22));
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter", v22, v23, v24, v25));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "collectionID"));
            objc_msgSend(v18, "emitCollectionAddEventWithTracker:collectionID:collectionItemCount:", v19, v20, 0);

            v21 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
            objc_msgSend(v21, "addObject:", v17);

            self->_wantsAddCollectionRow = 0;
          }
        }

      }
    }
    -[BKLibraryCollectionsListViewController animateEndTextEditCollections](self, "animateEndTextEditCollections");
    -[BKLibraryCollectionsListViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);

  }
}

- (void)controller:(id)a3 didChangeObject:(id)a4 atIndexPath:(id)a5 forChangeType:(unint64_t)a6 newIndexPath:(id)a7
{
  unsigned __int8 v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v9 = -[BKLibraryCollectionsListViewController changeIsUserDriven](self, "changeIsUserDriven");
  if (a6 - 5 >= 0xFFFFFFFFFFFFFFFELL && (v9 & 1) == 0)
  {
    v10 = objc_opt_class(NSObject);
    v11 = BUClassAndProtocolCast(v14, v10, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController delegate](self, "delegate", &OBJC_PROTOCOL___BKCollection));
      objc_msgSend(v13, "collectionListView:collectionChanged:", self, v12);

    }
  }

}

- (void)controllerDidChangeContent:(id)a3
{
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;

  if (-[BKLibraryCollectionsListViewController changeIsUserDriven](self, "changeIsUserDriven", a3))
  {
    -[BKLibraryCollectionsListViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", 0);
  }
  else if (-[BKLibraryCollectionsListViewController isEditing](self, "isEditing"))
  {
    self->_endEditingMeansTableReload = 1;
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController selectedCollection](self, "selectedCollection"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "deletedFlag"));
    v6 = objc_msgSend(v5, "BOOLValue");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController p_firstVisibleCollection](self, "p_firstVisibleCollection"));
      -[BKLibraryCollectionsListViewController setSelectedCollection:](self, "setSelectedCollection:", v7);

    }
    -[BKLibraryCollectionsListViewController setUserCollections:](self, "setUserCollections:", 0);
    v8 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
    objc_msgSend(v8, "reloadData");

  }
}

- (unint64_t)p_assetCountForCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint64_t *v18;
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "collectionID"));
  if (v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController collectionAssetCounts](self, "collectionAssetCounts"));
    if (!v6)
    {
      v6 = objc_alloc_init((Class)NSMutableDictionary);
      -[BKLibraryCollectionsListViewController setCollectionAssetCounts:](self, "setCollectionAssetCounts:", v6);
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v5));
    v8 = v7;
    if (v7)
    {
      v9 = objc_msgSend(v7, "unsignedIntegerValue");
LABEL_13:

      goto LABEL_14;
    }
    v20 = 0;
    v21 = &v20;
    v22 = 0x2020000000;
    v23 = 0;
    if (objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDFinished))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_10017C09C;
      v19[3] = &unk_1008ED340;
      v19[4] = &v20;
      objc_msgSend(v10, "performBlockInUIContext:", v19);
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "members"));
      v12 = objc_msgSend(v11, "count");

      if (!v12)
      {
LABEL_12:
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v21[3]));
        objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, v5);

        v9 = (id)v21[3];
        _Block_object_dispose(&v20, 8);
        goto LABEL_13;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
      v16[0] = _NSConcreteStackBlock;
      v16[1] = 3221225472;
      v16[2] = sub_10017C14C;
      v16[3] = &unk_1008EA520;
      v17 = v5;
      v18 = &v20;
      objc_msgSend(v13, "performBlockInUIContext:", v16);

      v10 = v17;
    }

    goto LABEL_12;
  }
  v9 = 0;
LABEL_14:

  return (unint64_t)v9;
}

- (void)_concludeDeleteAtIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v4 = a3;
  v5 = -[BKLibraryCollectionsListViewController _collectionIndexForIndexPath:](self, "_collectionIndexForIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", v5));

  if (v7)
  {
    -[BKLibraryCollectionsListViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController delegate](self, "delegate"));
    v9 = objc_msgSend(v8, "collectionListView:collectionDeleted:", self, v7);

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
      objc_msgSend(v10, "removeObjectAtIndex:", v5);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
      v13 = v4;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
      objc_msgSend(v11, "deleteRowsAtIndexPaths:withRowAnimation:", v12, 0);

    }
    else
    {
      -[BKLibraryCollectionsListViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
      objc_msgSend(v11, "reloadData");
    }

  }
}

- (void)_concludeHide:(BOOL)a3 atIndexPath:(id)a4
{
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  BOOL v14;

  v6 = -[BKLibraryCollectionsListViewController _collectionIndexForIndexPath:](self, "_collectionIndexForIndexPath:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixCollections](self, "prefixCollections"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v6));

  if (v10)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10017C45C;
    v11[3] = &unk_1008ED368;
    v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionController"));
    v13 = v10;
    v14 = a3;
    v9 = v12;
    objc_msgSend(v8, "performBlockInUIContext:", v11);

  }
}

- (id)tableView:(id)a3 itemsForBeginningDragSession:(id)a4 atIndexPath:(id)a5
{
  objc_msgSend(a4, "setLocalContext:", self);
  return &__NSArray0__struct;
}

- (id)tableView:(id)a3 itemsForAddingToDragSession:(id)a4 atIndexPath:(id)a5 point:(CGPoint)a6
{
  return &__NSArray0__struct;
}

- (void)tableView:(id)a3 dragSessionWillBegin:(id)a4
{
  id v5;
  void *v6;
  BKLibraryCollectionsListViewController *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setSpringLoaded:", 0);

  -[UIBarButtonItem setEnabled:](self->_navBarEditButtonItem, "setEnabled:", 0);
  v7 = (BKLibraryCollectionsListViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localContext"));

  if (v7 != self)
    -[BKLibraryCollectionsListViewController stopEditButtonPressed:](self, "stopEditButtonPressed:", self);
}

- (void)tableView:(id)a3 dragSessionDidEnd:(id)a4
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView", a3, a4));
  objc_msgSend(v5, "setSpringLoaded:", 1);

  -[UIBarButtonItem setEnabled:](self->_navBarEditButtonItem, "setEnabled:", 1);
  -[BKLibraryCollectionsListViewController resetNavigationBarButtons](self, "resetNavigationBarButtons");
}

- (BOOL)tableView:(id)a3 dragSessionAllowsMoveOperation:(id)a4
{
  return 1;
}

- (BOOL)tableView:(id)a3 dragSessionIsRestrictedToDraggingApplication:(id)a4
{
  return 1;
}

- (id)tableView:(id)a3 dropSessionDidUpdate:(id)a4 withDestinationIndexPath:(id)a5
{
  id v7;
  void *v8;
  BKLibraryCollectionsListViewController *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "localDragSession"));
  v9 = (BKLibraryCollectionsListViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localContext"));

  if (v9 == self)
  {
    v11 = objc_alloc((Class)UITableViewDropProposal);
    v12 = 3;
    v13 = 1;
  }
  else
  {
    if (-[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", v7)
      || -[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v7))
    {
      v10 = 2;
    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _collectionForIndexPath:](self, "_collectionForIndexPath:", v7));
      if (objc_msgSend(v14, "allowsManualAddition"))
        v10 = 2;
      else
        v10 = 1;

    }
    v11 = objc_alloc((Class)UITableViewDropProposal);
    v12 = v10;
    v13 = 2;
  }
  v15 = objc_msgSend(v11, "initWithDropOperation:intent:", v12, v13);

  return v15;
}

- (void)tableView:(id)a3 dropSessionDidEnter:(id)a4
{
  UIBarButtonItem *navBarEditButtonItem;
  id v6;
  void *v7;
  BKLibraryCollectionsListViewController *v8;

  navBarEditButtonItem = self->_navBarEditButtonItem;
  v6 = a4;
  -[UIBarButtonItem setEnabled:](navBarEditButtonItem, "setEnabled:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localDragSession"));

  v8 = (BKLibraryCollectionsListViewController *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localContext"));
  if (v8 != self)
    -[BKLibraryCollectionsListViewController stopEditButtonPressed:](self, "stopEditButtonPressed:", self);
}

- (void)tableView:(id)a3 dropSessionDidExit:(id)a4
{
  -[UIBarButtonItem setEnabled:](self->_navBarEditButtonItem, "setEnabled:", 1, a4);
}

- (void)tableView:(id)a3 dropSessionDidEnd:(id)a4
{
  -[UIBarButtonItem setEnabled:](self->_navBarEditButtonItem, "setEnabled:", 1, a4);
}

- (void)_addStoreItems:(id)a3 toCollection:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id obj;
  _QWORD v17[4];
  id v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionController"));

  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(obj);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v12), "storeID"));
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10017C96C;
        v17[3] = &unk_1008E73F0;
        v18 = v13;
        v14 = v6;
        v19 = v14;
        v15 = v13;
        objc_msgSend(v8, "addStoreID:toCollectionID:forceToTop:completion:", v15, v14, 1, v17);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

}

- (void)tableView:(id)a3 performDropWithCoordinator:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  id v32;
  uint64_t v33;
  void *i;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  uint64_t v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  id v52;
  void *v53;
  void *v54;
  uint64_t v55;
  void *v56;
  void *v57;
  unsigned int v58;
  char v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  BKLibraryCollectionsListViewController *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  id obj;
  void *v79;
  _QWORD v80[4];
  id v81;
  id v82;
  BKLibraryCollectionsListViewController *v83;
  id v84;
  char v85;
  _QWORD v86[4];
  id v87;
  id v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _BYTE v97[128];

  v6 = a3;
  v7 = a4;
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "destinationIndexPath"));
  v9 = objc_opt_class(BKCollection);
  v73 = self;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _collectionForIndexPath:](self, "_collectionForIndexPath:", v8));
  v11 = BUDynamicCast(v9, v10);
  v71 = (void *)objc_claimAutoreleasedReturnValue(v11);

  v76 = v6;
  v72 = (void *)v8;
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v8));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageView"));
  objc_msgSend(v13, "bounds");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageView"));
  v75 = v12;
  objc_msgSend(v12, "convertRect:fromView:", v22, v15, v17, v19, v21);
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;

  v95 = 0u;
  v96 = 0u;
  v93 = 0u;
  v94 = 0u;
  v74 = v7;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "items"));
  v31 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v94;
    do
    {
      for (i = 0; i != v32; i = (char *)i + 1)
      {
        if (*(_QWORD *)v94 != v33)
          objc_enumerationMutation(obj);
        v35 = *(void **)(*((_QWORD *)&v93 + 1) + 8 * (_QWORD)i);
        v36 = objc_opt_class(BKLibraryAsset);
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dragItem"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localObject"));
        v39 = BUDynamicCast(v36, v38);
        v40 = (void *)objc_claimAutoreleasedReturnValue(v39);

        v41 = objc_opt_class(BSUIItemDescription);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dragItem"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localObject"));
        v44 = BUDynamicCast(v41, v43);
        v45 = (void *)objc_claimAutoreleasedReturnValue(v44);

        v46 = objc_opt_class(BCAssetDragInfo);
        v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "dragItem"));
        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "localObject"));
        v49 = BUDynamicCast(v46, v48);
        v50 = (void *)objc_claimAutoreleasedReturnValue(v49);

        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "assetID"));
        v52 = objc_msgSend(v51, "length");

        if (v52)
        {
          v53 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "assetID"));
          v55 = objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "libraryAssetOnMainQueueWithAssetID:", v54));

          v40 = (void *)v55;
        }
        if (v40)
        {
          v56 = v79;
          v57 = v40;
        }
        else
        {
          if (!v45)
            goto LABEL_13;
          v56 = v77;
          v57 = v45;
        }
        objc_msgSend(v56, "addObject:", v57, v71);
LABEL_13:

      }
      v32 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v93, v97, 16);
    }
    while (v32);
  }

  v58 = -[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](v73, "_isAddCollectionIndexPath:", v72);
  v59 = v58;
  if (v58)
  {
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "uiChildContext"));
    v62 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection insertNewCollectionWithCollectionID:inManagedObjectContext:](BKCollection, "insertNewCollectionWithCollectionID:inManagedObjectContext:", 0, v61));

    v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "localizedStringForKey:value:table:", CFSTR("Untitled Collection"), &stru_10091C438, 0));
    objc_msgSend(v62, "setTitle:", v64);

    objc_msgSend(v62, "addLibraryAssets:", v79);
    v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "collectionID"));
    -[BKLibraryCollectionsListViewController _addStoreItems:toCollection:](v73, "_addStoreItems:toCollection:", v77, v65);

  }
  v86[0] = _NSConcreteStackBlock;
  v86[1] = 3221225472;
  v86[2] = sub_10017CF1C;
  v86[3] = &unk_1008EC390;
  v87 = v7;
  v88 = v72;
  v89 = v24;
  v90 = v26;
  v91 = v28;
  v92 = v30;
  v80[0] = _NSConcreteStackBlock;
  v80[1] = 3221225472;
  v80[2] = sub_10017D1B0;
  v80[3] = &unk_1008ED390;
  v85 = v59;
  v81 = v71;
  v82 = v79;
  v83 = v73;
  v84 = v77;
  v66 = v77;
  v67 = v79;
  v68 = v71;
  v69 = v72;
  v70 = v74;
  objc_msgSend(v76, "performBatchUpdates:completion:", v86, v80);

}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;
  double result;
  unsigned int v7;

  result = 0.0;
  if (!a4)
  {
    v7 = -[BKLibraryCollectionsListViewController showDivider](self, "showDivider", a3, 0.0, v4, v5);
    result = 0.0;
    if (v7)
      return 6.0;
  }
  return result;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  if (a4)
  {
    v4 = 0;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixFooterView](self, "prefixFooterView", a3));

    if (!v6)
    {
      v7 = objc_alloc_init((Class)UIView);
      -[BKLibraryCollectionsListViewController setPrefixFooterView:](self, "setPrefixFooterView:", v7);

      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController metrics](self, "metrics"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "tableSeparatorColor"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixFooterView](self, "prefixFooterView"));
      objc_msgSend(v10, "setBackgroundColor:", v9);

    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixFooterView](self, "prefixFooterView"));
  }
  return v4;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  char *v7;
  unint64_t v8;

  v6 = a3;
  if (a4 == 1)
  {
    v8 = -[BKLibraryCollectionsListViewController _numberOfUserRows](self, "_numberOfUserRows");
    v7 = (char *)-[BKLibraryCollectionsListViewController _numberOfNewCollectionButtonRows](self, "_numberOfNewCollectionButtonRows")+ v8;
  }
  else if (a4)
  {
    v7 = 0;
  }
  else
  {
    v7 = -[BKLibraryCollectionsListViewController _numberOfPrefixRows](self, "_numberOfPrefixRows");
  }

  return (int64_t)v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  const __CFString *v9;
  BKLibraryCollectionsListCell *v10;

  v6 = a3;
  v7 = a4;
  v8 = objc_autoreleasePoolPush();
  if (-[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v7))
    v9 = CFSTR("NewCollectionCell");
  else
    v9 = CFSTR("Cell");
  v10 = (BKLibraryCollectionsListCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v9));
  if (!v10)
    v10 = -[BKLibraryCollectionsListCell initWithStyle:reuseIdentifier:]([BKLibraryCollectionsListCell alloc], "initWithStyle:reuseIdentifier:", 0, v9);
  -[BKLibraryCollectionsListViewController _configureCell:atIndexPath:](self, "_configureCell:atIndexPath:", v10, v7);
  objc_autoreleasePoolPop(v8);

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  unint64_t v8;
  void *v9;
  id v10;
  void *v11;
  BKLibraryCollectionsListCell *textEntryCell;
  BKLibraryCollectionsListCell *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  BKLibraryCollectionsListCell *v19;
  uint64_t v20;
  uint64_t v21;
  BKLibraryCollectionsListCell *v22;
  BKLibraryCollectionsListCell *v23;
  BKLibraryCollectionsListCell *v24;

  v24 = (BKLibraryCollectionsListCell *)a4;
  v7 = a5;
  if (-[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", v7)
    || -[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v7))
  {
    v8 = -[BKLibraryCollectionsListViewController _collectionIndexForIndexPath:](self, "_collectionIndexForIndexPath:", v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
    v10 = objc_msgSend(v9, "count");

    if ((unint64_t)v10 <= v8)
    {
      if (!-[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing")
        || !-[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v7))
      {
LABEL_11:
        v14 = 0;
LABEL_19:

        goto LABEL_20;
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController defaultCollectionName](self, "defaultCollectionName"));
    }
    else
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
      textEntryCell = (BKLibraryCollectionsListCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndex:", v8));

      v13 = (BKLibraryCollectionsListCell *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCollection](self, "textEntryCollection"));
      if (v13 != textEntryCell)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryIndexPath](self, "textEntryIndexPath"));
        if (v14)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryIndexPath](self, "textEntryIndexPath"));
          v16 = objc_msgSend(v15, "row");
          v17 = objc_msgSend(v7, "row");

          if (v16 == v17)
            goto LABEL_17;
          goto LABEL_11;
        }
LABEL_18:

        goto LABEL_19;
      }
      if (!-[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing"))
      {

LABEL_17:
        -[BKLibraryCollectionsListCell removeTextEntryField](self->_textEntryCell, "removeTextEntryField");
        v14 = 0;
        textEntryCell = self->_textEntryCell;
        self->_textEntryCell = 0;
        goto LABEL_18;
      }
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCollection](self, "textEntryCollection"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "localizedTitle"));

    }
    -[BKLibraryCollectionsListViewController setTextEntryIndexPath:](self, "setTextEntryIndexPath:", v7);
    v19 = self->_textEntryCell;
    if (v19 == v24)
      goto LABEL_19;
    -[BKLibraryCollectionsListCell removeTextEntryField](v19, "removeTextEntryField");
    v20 = objc_opt_class(BKLibraryCollectionsListCell);
    v21 = BUDynamicCast(v20, v24);
    v22 = (BKLibraryCollectionsListCell *)objc_claimAutoreleasedReturnValue(v21);
    v23 = self->_textEntryCell;
    self->_textEntryCell = v22;

    -[BKLibraryCollectionsListCell setupTextEntryField:](self->_textEntryCell, "setupTextEntryField:", self);
    textEntryCell = (BKLibraryCollectionsListCell *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListCell textEntryField](self->_textEntryCell, "textEntryField"));
    -[BKLibraryCollectionsListCell setText:](textEntryCell, "setText:", v14);
    goto LABEL_18;
  }
LABEL_20:

}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  unsigned int v6;

  v5 = a4;
  if (-[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing")
    || self->_endTextEditingMeansEndEditMode
    || self->_suppressEditControlsForNewCollection)
  {
    LOBYTE(v6) = 0;
  }
  else
  {
    v6 = !-[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v5);
  }

  return v6;
}

- (void)tableView:(id)a3 willBeginEditingRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController navBarEditButtonItem](self, "navBarEditButtonItem"));
  objc_msgSend(v8, "setEnabled:", 0);

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chevron"));
  objc_msgSend(v9, "setHidden:", 1);

}

- (void)tableView:(id)a3 didEndEditingRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController navBarEditButtonItem](self, "navBarEditButtonItem"));
  objc_msgSend(v8, "setEnabled:", 1);

  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cellForRowAtIndexPath:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chevron"));
  objc_msgSend(v9, "setHidden:", 0);

}

- (id)tableView:(id)a3 targetIndexPathForMoveFromRowAtIndexPath:(id)a4 toProposedIndexPath:(id)a5
{
  id v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;

  v6 = a5;
  if (-[BKLibraryCollectionsListViewController _indexPathIsPrefix:](self, "_indexPathIsPrefix:", v6))
  {
    v7 = 0;
LABEL_8:
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v7, 1));

    goto LABEL_9;
  }
  if (-[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", v6)
    || (v8 = v6,
        -[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v6)))
  {
    v9 = objc_msgSend(v6, "row");
    v10 = -[BKLibraryCollectionsListViewController _numberOfUserRows](self, "_numberOfUserRows");
    if ((unint64_t)v9 >= v10
                               - -[BKLibraryCollectionsListViewController _numberOfNewCollectionButtonRows](self, "_numberOfNewCollectionButtonRows"))
    {
      v11 = -[BKLibraryCollectionsListViewController _numberOfUserRows](self, "_numberOfUserRows");
      v7 = (id)(v11
              - -[BKLibraryCollectionsListViewController _numberOfNewCollectionButtonRows](self, "_numberOfNewCollectionButtonRows"));
    }
    else
    {
      v7 = objc_msgSend(v6, "row");
    }
    goto LABEL_8;
  }
LABEL_9:

  return v8;
}

- (void)tableView:(id)a3 moveRowAtIndexPath:(id)a4 toIndexPath:(id)a5
{
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v15 = a4;
  v7 = a5;
  if (-[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", v15)
    && -[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", v7))
  {
    -[BKLibraryCollectionsListViewController setChangeIsUserDriven:](self, "setChangeIsUserDriven:", 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
    v9 = objc_msgSend(v8, "mutableCopy");

    v10 = -[BKLibraryCollectionsListViewController _collectionIndexForIndexPath:](self, "_collectionIndexForIndexPath:", v15);
    v11 = -[BKLibraryCollectionsListViewController _collectionIndexForIndexPath:](self, "_collectionIndexForIndexPath:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v10));
    objc_msgSend(v9, "removeObjectAtIndex:", v10);
    objc_msgSend(v9, "insertObject:atIndex:", v12, v11);
    -[BKLibraryCollectionsListViewController setUserCollections:](self, "setUserCollections:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
    +[BKUserSortOrderManager saveSortedCollectionsArray:inLibraryManager:](BKUserSortOrderManager, "saveSortedCollectionsArray:inLibraryManager:", v13, v14);

  }
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  _BOOL4 v5;

  v5 = -[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", a4);
  if (v5)
  {
    if (-[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing"))
      LOBYTE(v5) = 0;
    else
      LOBYTE(v5) = !-[BKLibraryCollectionsListViewController isAddingToCollection](self, "isAddingToCollection");
  }
  return v5;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  id v5;
  int64_t v6;
  void *v7;
  void *v8;
  unsigned int v9;

  v5 = a4;
  if (-[BKLibraryCollectionsListViewController isAddingToCollection](self, "isAddingToCollection"))
  {
    v6 = 0;
  }
  else if (-[BKLibraryCollectionsListViewController _indexPathIsPrefix:](self, "_indexPathIsPrefix:", v5))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _collectionForIndexPath:](self, "_collectionForIndexPath:", v5));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "hidden"));
    v9 = objc_msgSend(v8, "BOOLValue");

    if (v9)
      v6 = 2;
    else
      v6 = 1;

  }
  else
  {
    v6 = -[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v5) ^ 1;
  }

  return v6;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  if (a4 == 2)
    -[BKLibraryCollectionsListViewController _concludeHide:atIndexPath:](self, "_concludeHide:atIndexPath:", 0, a5);
}

+ (id)deleteActionHandler
{
  return &stru_1008ED3D0;
}

+ (id)hideActionHandler
{
  return &stru_1008ED418;
}

- (id)tableView:(id)a3 trailingSwipeActionsConfigurationForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  void *v13;

  v5 = a4;
  if (!-[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing")
    && !-[BKLibraryCollectionsListViewController isAddingToCollection](self, "isAddingToCollection"))
  {
    if (-[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", v5))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController deleteSwipeAction:](self, "deleteSwipeAction:", v5));
      if (!v6)
        goto LABEL_8;
LABEL_14:
      v13 = v6;
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UISwipeActionsConfiguration configurationWithActions:](UISwipeActionsConfiguration, "configurationWithActions:", v12));

      objc_msgSend(v7, "setPerformsFirstActionWithFullSwipe:", 0);
      goto LABEL_9;
    }
    if (!-[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v5))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _collectionForIndexPath:](self, "_collectionForIndexPath:", v5));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hidden"));
      v11 = objc_msgSend(v10, "BOOLValue");

      if ((v11 & 1) != 0)
        v6 = 0;
      else
        v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController hideSwipeAction:](self, "hideSwipeAction:", v5));

      if (!v6)
        goto LABEL_8;
      goto LABEL_14;
    }
  }
  v6 = 0;
LABEL_8:
  v7 = 0;
LABEL_9:

  return v7;
}

- (id)deleteSwipeAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Delete"), &stru_10091C438, 0));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10017E578;
  v12[3] = &unk_1008ED440;
  objc_copyWeak(&v14, &location);
  v7 = v4;
  v13 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 1, v6, v12));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController metrics](self, "metrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "deleteActionColor"));
  objc_msgSend(v8, "setBackgroundColor:", v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

- (id)hideSwipeAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Hide"), &stru_10091C438, 0));

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10017E760;
  v12[3] = &unk_1008ED440;
  objc_copyWeak(&v14, &location);
  v7 = v4;
  v13 = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIContextualAction contextualActionWithStyle:title:handler:](UIContextualAction, "contextualActionWithStyle:title:handler:", 0, v6, v12));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController metrics](self, "metrics"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "hideActionColor"));
  objc_msgSend(v8, "setBackgroundColor:", v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);

  return v8;
}

- (void)endTextEditAnimationComplete
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController view](self, "view"));
  objc_msgSend(v3, "setUserInteractionEnabled:", 1);

  -[BKLibraryCollectionsListViewController setTextEntryIndexPath:](self, "setTextEntryIndexPath:", 0);
  -[BKLibraryCollectionsListViewController setTextEntryCollection:](self, "setTextEntryCollection:", 0);
  if (self->_endTextEditingMeansEndEditMode)
  {
    self->_endTextEditingMeansEndEditMode = 0;
    -[BKLibraryCollectionsListViewController setEditing:animated:](self, "setEditing:animated:", 0, 1);
  }
}

- (void)animateEndTextEditCollections
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  if (-[BKLibraryCollectionsListViewController isEditing](self, "isEditing")
    && -[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing"))
  {
    self->_textEditing = 0;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCell](self, "textEntryCell"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "textEntryField"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "text"));
    v6 = objc_msgSend(v5, "length");

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCell](self, "textEntryCell"));
    objc_msgSend(v7, "removeTextEntryField");

    -[BKLibraryCollectionsListViewController setTextEntryCell:](self, "setTextEntryCell:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCollection](self, "textEntryCollection"));

    if (v8 || v6)
    {
      +[CATransaction begin](CATransaction, "begin");
      +[CATransaction setDisableActions:](CATransaction, "setDisableActions:", 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryIndexPath](self, "textEntryIndexPath"));
      v12 = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
      objc_msgSend(v9, "reloadRowsAtIndexPaths:withRowAnimation:", v11, 5);

      +[CATransaction commit](CATransaction, "commit");
    }
    else
    {
      self->_endEditingMeansTableReload = 1;
    }
    -[BKLibraryCollectionsListViewController endTextEditAnimationComplete](self, "endTextEditAnimationComplete");
  }
}

- (BOOL)tableView:(id)a3 shouldSpringLoadRowAtIndexPath:(id)a4 withContext:(id)a5
{
  id v6;
  unsigned __int8 v7;
  void *v8;

  v6 = a4;
  if (-[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", v6))
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _collectionForIndexPath:](self, "_collectionForIndexPath:", v6));
    v7 = objc_msgSend(v8, "allowsManualAddition");

  }
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "section") == (id)1 || !objc_msgSend(v6, "section"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController delegate](self, "delegate"));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _collectionForIndexPath:](self, "_collectionForIndexPath:", v6));
      if (v8)
      {
        if (-[BKLibraryCollectionsListViewController isAddingToCollection](self, "isAddingToCollection"))
        {
          -[BKLibraryCollectionsListViewController _addSelectedToIndexPath:](self, "_addSelectedToIndexPath:", v6);
        }
        else
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController delegate](self, "delegate"));
          objc_msgSend(v9, "collectionListView:collectionSelected:", self, v8);

          objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v6, 0);
        }
      }

    }
  }

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  void *v13;
  void *v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if ((objc_msgSend(v6, "hasActiveDrag") & 1) == 0)
  {
    v8 = v7;
    if ((objc_msgSend(v6, "hasActiveDrop") & 1) == 0)
    {
      if (-[BKLibraryCollectionsListViewController isEditing](self, "isEditing"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCell](self, "textEntryCell"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "textEntryField"));
        v11 = objc_msgSend(v10, "isFirstResponder");

        if (v11)
        {
          -[BKLibraryCollectionsListViewController stopEditButtonPressed:](self, "stopEditButtonPressed:", self);
        }
        else if (-[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing"))
        {
          -[BKLibraryCollectionsListViewController endTextEditing](self, "endTextEditing");
        }
        else if (-[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", v7)
               || -[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v7))
        {
          -[BKLibraryCollectionsListViewController _beginEditingUserCollectionAtIndexPath:](self, "_beginEditingUserCollectionAtIndexPath:", v7);
        }
        goto LABEL_17;
      }
      if (-[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v7))
      {
        -[BKLibraryCollectionsListViewController addCollection:](self, "addCollection:", self);
LABEL_17:
        v8 = 0;
        v14 = v7;
LABEL_18:

        goto LABEL_19;
      }
      v8 = v7;
      if (-[BKLibraryCollectionsListViewController _indexPathIsPrefix:](self, "_indexPathIsPrefix:", v7))
      {
        v12 = objc_msgSend(v7, "row");
        v8 = v7;
        if ((id)-[BKLibraryCollectionsListViewController _numberOfPrefixRows](self, "_numberOfPrefixRows") > v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixCollections](self, "prefixCollections"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", v12));

          if (-[BKLibraryCollectionsListViewController isSelectionEnabledForCollection:](self, "isSelectionEnabledForCollection:", v14))
          {
            v8 = v7;
          }
          else
          {

            v8 = 0;
          }
          goto LABEL_18;
        }
      }
    }
  }
LABEL_19:

  return v8;
}

- (void)releaseAllRecomputableMemory
{
  -[BKLibraryCollectionsListViewController setPrefixCollections:](self, "setPrefixCollections:", 0);
  -[BKLibraryCollectionsListViewController setCollectionAssetCounts:](self, "setCollectionAssetCounts:", 0);
  -[BKLibraryCollectionsListViewController setIconCache:](self, "setIconCache:", 0);
}

- (void)didReceiveMemoryWarning
{
  objc_super v3;

  -[BKLibraryCollectionsListViewController releaseAllRecomputableMemory](self, "releaseAllRecomputableMemory");
  v3.receiver = self;
  v3.super_class = (Class)BKLibraryCollectionsListViewController;
  -[BKLibraryCollectionsListViewController didReceiveMemoryWarning](&v3, "didReceiveMemoryWarning");
}

- (void)scrollToIndexPath:(id)a3
{
  -[BKLibraryCollectionsListViewController scrollToIndexPath:animated:](self, "scrollToIndexPath:animated:", a3, 1);
}

- (void)scrollToIndexPath:(id)a3 animated:(BOOL)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  BOOL v11;
  id location;

  v6 = a3;
  objc_initWeak(&location, self);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017EE1C;
  v8[3] = &unk_1008EAF38;
  objc_copyWeak(&v10, &location);
  v9 = v6;
  v11 = a4;
  v7 = v6;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
}

- (void)keyboardWillShow:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double x;
  double v9;
  double y;
  double v11;
  double width;
  double v13;
  double height;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  _QWORD v30[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKey:", UIKeyboardFrameEndUserInfoKey));
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "CGRectValue");
    x = v7;
    y = v9;
    width = v11;
    height = v13;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController view](self, "view"));
  objc_msgSend(v15, "convertRect:fromView:", 0, x, y, width, height);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", UIKeyboardAnimationCurveUserInfoKey));
  v25 = objc_msgSend(v24, "integerValue");

  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", UIKeyboardAnimationDurationUserInfoKey));
  objc_msgSend(v26, "doubleValue");
  v28 = v27;

  -[BKLibraryCollectionsListViewController setKeyboardFrame:](self, "setKeyboardFrame:", v17, v19, v21, v23);
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_10017F0B8;
  v30[3] = &unk_1008E72C0;
  v30[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", (_QWORD)v25 << 16, v30, 0, v28, 0.0);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryIndexPath](self, "textEntryIndexPath"));
  -[BKLibraryCollectionsListViewController scrollToIndexPath:](self, "scrollToIndexPath:", v29);

}

- (void)keyboardWillHide:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  _QWORD v10[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "userInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", UIKeyboardAnimationCurveUserInfoKey));
  v6 = objc_msgSend(v5, "integerValue");

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "valueForKey:", UIKeyboardAnimationDurationUserInfoKey));
  objc_msgSend(v7, "doubleValue");
  v9 = v8;

  -[BKLibraryCollectionsListViewController setKeyboardFrame:](self, "setKeyboardFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10017F1BC;
  v10[3] = &unk_1008E72C0;
  v10[4] = self;
  +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", (_QWORD)v6 << 16, v10, 0, v9, 0.0);

}

- (void)keyboardDidHide:(id)a3
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController postKeyboardIndexPath](self, "postKeyboardIndexPath", a3));

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController postKeyboardIndexPath](self, "postKeyboardIndexPath"));
    -[BKLibraryCollectionsListViewController scrollToIndexPath:](self, "scrollToIndexPath:", v5);

    -[BKLibraryCollectionsListViewController setPostKeyboardIndexPath:](self, "setPostKeyboardIndexPath:", 0);
  }
}

- (id)_iconForIndexPath:(id)a3 metrics:(id)a4 pointSize:(double)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  uint64_t v36;
  void *v37;

  v8 = a3;
  v9 = a4;
  if (-[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v8)
    && !-[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "collectionIconName_Add"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _collectionForIndexPath:](self, "_collectionForIndexPath:", v8));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "collectionID"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _iconNameForCollectionID:metrics:](self, "_iconNameForCollectionID:metrics:", v11, v9));

  }
  v13 = v12;
  if (v13)
  {
    v14 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController iconCache](self, "iconCache"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", v13));
    if (v15)
    {
      v16 = (void *)v15;
    }
    else
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[BSUITemplate manager](BSUITemplate, "manager"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "imageResourceCache"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController view](self, "view"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_screen"));
      objc_msgSend(v19, "scale");
      LOBYTE(v36) = 1;
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "symbolImageWithName:compatibleWithFontSize:weight:scale:renderingMode:colors:style:contentsScale:layoutDirection:insets:baseline:", v13, 4, 3, 0, 0, 0, a5, v20, UIEdgeInsetsZero.top, UIEdgeInsetsZero.left, UIEdgeInsetsZero.bottom, UIEdgeInsetsZero.right, 0, v36));
      v22 = objc_msgSend(v21, "newImageWithoutContentInsets");

      if (!v22)
      {
        v23 = BSUIBundle();
        v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:scale:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:scale:", 4, 3, a5));
        v22 = (id)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:withConfiguration:](UIImage, "imageNamed:inBundle:withConfiguration:", v13, v24, v25));

      }
      objc_msgSend(v9, "collectionGlyphPointSize");
      v27 = a5 / v26;
      objc_msgSend(v9, "collectionIconSize");
      v30 = CGSizeScale(v28, v29, v27);
      v32 = v31;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage im_imageWithCenteredIconImage:iconColor:size:](UIImage, "im_imageWithCenteredIconImage:iconColor:size:", v22, v33, v30, v32));

      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "imageWithRenderingMode:", 2));
      if (v16)
      {
        if (!v14)
        {
          v14 = objc_alloc_init((Class)NSMutableDictionary);
          -[BKLibraryCollectionsListViewController setIconCache:](self, "setIconCache:", v14);
        }
        objc_msgSend(v14, "setObject:forKey:", v16, v13);
      }
    }

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

- (id)_iconColorForIndexPath:(id)a3 metrics:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;

  v6 = a3;
  v7 = a4;
  if (-[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v6)
    && !-[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionIconColor_Add"));
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _collectionForIndexPath:](self, "_collectionForIndexPath:", v6));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "collectionID"));
    if (objc_msgSend(v9, "isEqualToString:", kBKCollectionDefaultIDBooks))
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionIconColor_Books"));
    }
    else if (objc_msgSend(v9, "isEqualToString:", kBKCollectionDefaultIDAudiobooks))
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionIconColor_Audiobooks"));
    }
    else if (objc_msgSend(v9, "isEqualToString:", kBKCollectionDefaultIDPDFs))
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionIconColor_PDFs"));
    }
    else if (objc_msgSend(v9, "isEqualToString:", kBKCollectionDefaultIDDownloaded))
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionIconColor_Downloaded"));
    }
    else if (objc_msgSend(v9, "isEqualToString:", kBKCollectionDefaultIDWantToRead)
           || objc_msgSend(v9, "isEqualToString:", kBKCollectionDefaultIDSamples))
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionIconColor_WantToRead"));
    }
    else if (objc_msgSend(v9, "isEqualToString:", kBKCollectionDefaultIDFinished))
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionIconColor_Finished"));
    }
    else
    {
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collectionIconColor_User"));
    }
    v11 = (void *)v10;

  }
  return v11;
}

- (id)_iconNameForCollectionID:(id)a3 metrics:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDBooks))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIconName_Books"));
  }
  else if (objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDWantToRead))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIconName_WantToRead"));
  }
  else if (objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDSamples))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIconName_Samples"));
  }
  else if (objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDAudiobooks))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIconName_Audiobooks"));
  }
  else if (objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDPDFs))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIconName_PDFs"));
  }
  else if (objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDDownloaded))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIconName_Downloaded"));
  }
  else if (objc_msgSend(v5, "isEqualToString:", kBKCollectionDefaultIDFinished))
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIconName_Finished"));
  }
  else
  {
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "collectionIconName_User"));
  }
  v8 = (void *)v7;

  return v8;
}

- (unint64_t)_numberOfPrefixRows
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixCollections](self, "prefixCollections"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (unint64_t)_numberOfUserRows
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (id)_indexPathForCollectionID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void **v12;
  uint64_t v13;
  id (*v14)(uint64_t, void *);
  void *v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10017FA04;
    v17[3] = &unk_1008ED468;
    v6 = v4;
    v18 = v6;
    v7 = objc_msgSend(v5, "indexOfObjectPassingTest:", v17);

    if (v7 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixCollections](self, "prefixCollections"));
      v12 = _NSConcreteStackBlock;
      v13 = 3221225472;
      v14 = sub_10017FA44;
      v15 = &unk_1008ED468;
      v16 = v6;
      v9 = objc_msgSend(v8, "indexOfObjectPassingTest:", &v12);

      if (v9 == (id)0x7FFFFFFFFFFFFFFFLL)
        v10 = 0;
      else
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, 0, v12, v13, v14, v15));

    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[BKLibraryCollectionsListViewController _rowForUserCollectionIndex:](self, "_rowForUserCollectionIndex:", v7), 1));
    }

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_indexPathForCollection:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  uint64_t v10;
  void *v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixCollections](self, "prefixCollections"));
    v8 = objc_msgSend(v7, "indexOfObject:", v4);

    v9 = (unint64_t)v8;
    v10 = 0;
  }
  else
  {
    v9 = -[BKLibraryCollectionsListViewController _rowForUserCollectionIndex:](self, "_rowForUserCollectionIndex:", v6);
    v10 = 1;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v9, v10));

  return v11;
}

- (unint64_t)_collectionIndexForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;

  v4 = a3;
  if (-[BKLibraryCollectionsListViewController _indexPathIsPrefix:](self, "_indexPathIsPrefix:", v4)
    || -[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", v4))
  {
    v5 = (unint64_t)objc_msgSend(v4, "row");
  }
  else
  {
    v5 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v5;
}

- (id)_collectionForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = -[BKLibraryCollectionsListViewController _collectionIndexForIndexPath:](self, "_collectionIndexForIndexPath:", v4);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_8;
  v6 = v5;
  if (!-[BKLibraryCollectionsListViewController _indexPathIsPrefix:](self, "_indexPathIsPrefix:", v4)
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixCollections](self, "prefixCollections")),
        v8 = objc_msgSend(v7, "count"),
        v7,
        v6 >= (unint64_t)v8))
  {
    if (-[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", v4))
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
      goto LABEL_7;
    }
LABEL_8:
    v11 = 0;
    goto LABEL_9;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController prefixCollections](self, "prefixCollections"));
LABEL_7:
  v10 = v9;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", v6));

LABEL_9:
  return v11;
}

- (unint64_t)_rowForUserCollectionIndex:(unint64_t)a3
{
  return a3;
}

- (BOOL)_indexPathIsPrefix:(id)a3
{
  return objc_msgSend(a3, "section") == 0;
}

- (BOOL)_indexPathIsUser:(id)a3
{
  id v4;
  id v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "section") == (id)1)
  {
    v5 = objc_msgSend(v4, "row");
    v6 = v5 < (id)-[BKLibraryCollectionsListViewController _numberOfUserRows](self, "_numberOfUserRows");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)_indexPathIsNewCollection:(id)a3
{
  id v4;
  char *v5;
  BOOL v6;

  v4 = a3;
  if (objc_msgSend(v4, "section") == (id)1)
  {
    v5 = (char *)objc_msgSend(v4, "row");
    v6 = v5 == (char *)-[BKLibraryCollectionsListViewController _numberOfUserRows](self, "_numberOfUserRows") + 1;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)_numberOfNewCollectionButtonRows
{
  return -[BKLibraryCollectionsListViewController wantsAddCollectionRow](self, "wantsAddCollectionRow");
}

- (BOOL)_viewFrameIncludesStatusBar
{
  return isPad(self, a2) ^ 1;
}

- (void)_setSelectionState:(BOOL)a3 cell:(id)a4 atIndexPath:(id)a5
{
  uint64_t v5;

  if (a3)
    v5 = 3;
  else
    v5 = 0;
  objc_msgSend(a4, "setAccessoryType:", v5);
}

- (void)_configureCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _BOOL8 v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned __int8 v17;
  void *v18;
  unsigned int v19;
  unint64_t v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  _BOOL8 v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  double v42;
  void *v43;
  void *v44;
  unsigned int v45;
  void *v46;
  void *v47;
  void *v48;
  unsigned int v49;
  unsigned int v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;

  v54 = a3;
  v6 = a4;
  v7 = objc_opt_class(BKLibraryCollectionsListCell);
  v8 = BUDynamicCast(v7, v54);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController metrics](self, "metrics"));
  objc_msgSend(v9, "setMetrics:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "textLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "detailTextLabel"));
  -[BKLibraryCollectionsListViewController _setSelectionState:cell:atIndexPath:](self, "_setSelectionState:cell:atIndexPath:", 0, v54, v6);
  objc_msgSend(v54, "setSelected:", 0);
  if (objc_msgSend(v6, "section") != (id)1 && objc_msgSend(v6, "section"))
  {
    v13 = 0;
    goto LABEL_32;
  }
  v50 = -[BKLibraryCollectionsListViewController isEditing](self, "isEditing");
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _collectionForIndexPath:](self, "_collectionForIndexPath:", v6));
  v52 = v12;
  if (v14)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCollection](self, "textEntryCollection"));
    if (v15 == v14)
    {
      v17 = -[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing");

      if ((v17 & 1) != 0)
      {
        v16 = 0;
LABEL_11:
        objc_msgSend(v54, "setUserInteractionEnabled:", -[BKLibraryCollectionsListViewController isSelectionEnabledForCollection:](self, "isSelectionEnabledForCollection:", v14));
        if (-[BKLibraryCollectionsListViewController _indexPathIsPrefix:](self, "_indexPathIsPrefix:", v6))
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hidden"));
          if ((objc_msgSend(v18, "BOOLValue") & 1) != 0)
            v19 = 1;
          else
            v19 = objc_msgSend(v54, "isUserInteractionEnabled") ^ 1;
          v49 = v19;

        }
        else
        {
          v49 = 0;
        }
        v20 = -[BKLibraryCollectionsListViewController p_assetCountForCollection:](self, "p_assetCountForCollection:", v14);
        if (v20)
        {
          v21 = v20;
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v23 = v10;
          v24 = v16;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("%lu"), &stru_10091C438, 0));

          v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v21));
          v16 = v24;
          v10 = v23;
          v12 = v52;
        }
        else
        {
          v51 = 0;
        }
        goto LABEL_20;
      }
    }
    else
    {

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localizedTitle"));
    goto LABEL_11;
  }
  v51 = 0;
  v16 = 0;
  v49 = 0;
LABEL_20:
  v53 = v14;
  if (-[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v6)
    && !-[BKLibraryCollectionsListViewController isTextEditing](self, "isTextEditing"))
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("New Collection…"), &stru_10091C438, 0));

    objc_msgSend(v54, "setUserInteractionEnabled:", v50 ^ 1);
    v49 = objc_msgSend(v54, "isUserInteractionEnabled") ^ 1;
    v16 = (void *)v27;
  }
  v46 = v16;
  objc_msgSend(v11, "setText:", v16);
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "imageView"));
  v47 = v11;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "font"));
  objc_msgSend(v29, "pointSize");
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _iconForIndexPath:metrics:pointSize:](self, "_iconForIndexPath:metrics:pointSize:", v6, v10));
  objc_msgSend(v28, "setImage:", v30);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _iconColorForIndexPath:metrics:](self, "_iconColorForIndexPath:metrics:", v6, v10));
  objc_msgSend(v28, "setTintColor:", v31);

  objc_msgSend(v12, "setText:", v51);
  v48 = v9;
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "chevron"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chevronFontAttributes"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "font"));
  v35 = 1;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:scale:](UIImageSymbolConfiguration, "configurationWithFont:scale:", v34, 1));

  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chevronName"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", v37));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "imageWithConfiguration:", v36));

  objc_msgSend(v32, "setImage:", v39);
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chevronFontAttributes"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "foregroundColor"));
  objc_msgSend(v32, "setTintColor:", v41);

  if (!-[BKLibraryCollectionsListViewController isAddingToCollection](self, "isAddingToCollection"))
    v35 = -[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v6);
  objc_msgSend(v32, "setHidden:", v35);
  v42 = 1.0;
  if (v50)
    v42 = 0.0;
  objc_msgSend(v52, "setAlpha:", v42);
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController selectedCollection](self, "selectedCollection"));

  if (v53)
  {
    if (v43)
    {
      v44 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController selectedCollection](self, "selectedCollection"));
      v45 = objc_msgSend(v44, "isEqualToCollection:", v53);

      if (v45)
        -[BKLibraryCollectionsListViewController _setSelectionState:cell:atIndexPath:](self, "_setSelectionState:cell:atIndexPath:", 1, v54, v6);
    }
  }

  v13 = v49 != 0;
  v11 = v47;
  v9 = v48;
  v12 = v52;
LABEL_32:
  objc_msgSend(v9, "setDimmed:", v13);
  objc_msgSend(v9, "setAccessibilityDelegate:", self);

}

- (id)_addCollectionIndexPath
{
  return +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", -[BKLibraryCollectionsListViewController _numberOfUserRows](self, "_numberOfUserRows"), 1);
}

- (BOOL)_isAddCollectionIndexPath:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  if (-[BKLibraryCollectionsListViewController wantsAddCollectionRow](self, "wantsAddCollectionRow"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _addCollectionIndexPath](self, "_addCollectionIndexPath"));
    v6 = objc_msgSend(v4, "isEqual:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_addSelectedToIndexPath:(id)a3
{
  id v4;
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
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  unint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  unsigned int v33;
  uint64_t v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  unint64_t v55;
  void *v56;
  unsigned int v57;
  void *v58;
  void *v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  uint64_t v64;
  void *v65;
  BKLibraryCollectionsListViewController *v66;
  unint64_t v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  void *v72;

  v4 = a3;
  if (v4)
  {
    v60 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
    objc_msgSend(v5, "rectForRowAtIndexPath:", v60);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController view](self, "view"));
    objc_msgSend(v14, "convertRect:toView:", v15, v7, v9, v11, v13);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController _collectionForIndexPath:](self, "_collectionForIndexPath:", v60));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController assetIDs](self, "assetIDs"));
    if (objc_msgSend(v25, "count"))
    {
      v26 = 0;
      v64 = kBKCollectionDefaultIDWantToRead;
      v61 = kBKCollectionDefaultIDFinished;
      v65 = v24;
      v66 = self;
      v63 = v25;
      while (1)
      {
        v27 = objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController ba_effectiveAnalyticsTracker](self, "ba_effectiveAnalyticsTracker"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectAtIndexedSubscript:", v26));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController knownAssetTypes](self, "knownAssetTypes"));
        v70 = (void *)v27;
        v67 = v26;
        if ((unint64_t)objc_msgSend(v29, "count") <= v26)
        {
          v31 = 0;
        }
        else
        {
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController knownAssetTypes](self, "knownAssetTypes"));
          v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectAtIndexedSubscript:", v26));

        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController knownStoreAssetIDs](self, "knownStoreAssetIDs"));
        v33 = objc_msgSend(v32, "containsObject:", v28);

        v34 = 1;
        if (!v33)
          v34 = 2;
        v71 = v34;
        v69 = v31;
        v35 = v31
            ? +[BAUtilities contentTypeFromAssetType:](BAUtilities, "contentTypeFromAssetType:", objc_msgSend(v31, "integerValue")): 0;
        v36 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "libraryAssetProvider"));

        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "libraryAssetOnMainQueueWithAssetID:", v28));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "supplementalContentAssets"));
        v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v39, "count")));

        v40 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
        v41 = objc_msgSend(v40, "seriesTypeForContentID:", v28);

        v68 = v37;
        if (objc_msgSend(v38, "isAudiobook"))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "hasRACSupport"));
          v43 = objc_msgSend(v42, "BOOLValue") ? 1 : 2;

        }
        else
        {
          v43 = 0;
        }
        v44 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
        v45 = v24;
        v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "collectionID"));
        v47 = v41;
        objc_msgSend(v44, "emitAddToCollectionEventWithTracker:collectionID:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:", v70, v46, v28, v71, v35, v72, v41, v43);

        v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "collectionID"));
        LODWORD(v46) = objc_msgSend(v48, "isEqualToString:", v64);

        if ((_DWORD)v46)
          break;
        v62 = v43;
        v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "collectionID"));
        v57 = objc_msgSend(v56, "isEqualToString:", v61);

        v25 = v63;
        v53 = v38;
        v54 = v68;
        v55 = v67;
        if (v57)
        {
          v51 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
          objc_msgSend(v51, "emitMarkAsFinishedEventWithTracker:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:", v70, v28, v71, v35, v72, v47, v62);
          goto LABEL_22;
        }
LABEL_23:

        v26 = v55 + 1;
        v24 = v65;
        self = v66;
        if (v26 >= (unint64_t)objc_msgSend(v25, "count"))
          goto LABEL_24;
      }
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
      objc_msgSend(v49, "emitWantListAddEventWithTracker:contentID:contentAcquisitionType:contentType:supplementalContentCount:seriesType:productionType:", v70, v28, v71, v35, v72, v41, v43);

      v50 = (void *)objc_claimAutoreleasedReturnValue(+[BKAppDelegate delegate](BKAppDelegate, "delegate"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "engagementManager"));

      v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "sessionDonor"));
      objc_msgSend(v52, "reportAddToWTRButtonUsed");

      v25 = v63;
      v53 = v38;
      v54 = v68;
      v55 = v67;
LABEL_22:

      goto LABEL_23;
    }
LABEL_24:
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController delegate](self, "delegate"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController knownAssetTypes](self, "knownAssetTypes"));
    objc_msgSend(v58, "collectionListView:addSelectedAssetIDs:toCollection:knownAssetTypes:animationDestination:", self, v25, v24, v59, v17, v19, v21, v23);

    v4 = v60;
  }

}

- (void)_beginEditingUserCollectionAtIndexPath:(id)a3
{
  unint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v12 = a3;
  v4 = -[BKLibraryCollectionsListViewController _collectionIndexForIndexPath:](self, "_collectionIndexForIndexPath:", v12);
  if (-[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", v12))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
    v6 = objc_msgSend(v5, "count");

    if ((unint64_t)v6 > v4)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController userCollections](self, "userCollections"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", v4));

      -[BKLibraryCollectionsListViewController setTextEntryCollection:](self, "setTextEntryCollection:", v8);
      -[BKLibraryCollectionsListViewController setTextEntryIndexPath:](self, "setTextEntryIndexPath:", v12);
      self->_textEditing = 1;
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_1001809FC;
      v13[3] = &unk_1008E7338;
      v14 = (id)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
      v15 = v12;
      v9 = v14;
      objc_msgSend(v9, "performBatchUpdates:completion:", v13, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController textEntryCell](self, "textEntryCell"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "textEntryField"));
      objc_msgSend(v11, "becomeFirstResponder");

    }
  }

}

- (id)p_currentPopoverPresentationController
{
  BKLibraryCollectionsListViewController *v3;
  BKLibraryCollectionsListViewController *v4;
  void *v5;
  BKLibraryCollectionsListViewController *v6;

  if (-[BKLibraryCollectionsListViewController _isInPopoverPresentation](self, "_isInPopoverPresentation")&& (v3 = self) != 0)
  {
    v4 = v3;
    while (1)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController popoverPresentationController](v4, "popoverPresentationController"));

      if (v5)
        break;
      v6 = (BKLibraryCollectionsListViewController *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController parentViewController](v4, "parentViewController"));

      v4 = v6;
      if (!v6)
        return v6;
    }
    v6 = (BKLibraryCollectionsListViewController *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController popoverPresentationController](v4, "popoverPresentationController"));

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (void)p_updatePopoverFromMetricsIfNeeded:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController p_currentPopoverPresentationController](self, "p_currentPopoverPresentationController"));
    if (v5)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "popoverBackgroundColor"));
      objc_msgSend(v5, "setBackgroundColor:", v6);

    }
    v4 = v7;
  }

}

- (void)p_updateTableViewFromMetrics:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
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
  void *v19;
  id v20;

  if (a3)
  {
    v4 = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableBackgroundColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
    objc_msgSend(v6, "setBackgroundColor:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableSeparatorColor"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
    objc_msgSend(v8, "setSeparatorColor:", v7);

    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
    objc_msgSend(v9, "separatorInset");
    v11 = v10;
    v13 = v12;
    v15 = v14;

    objc_msgSend(v4, "collectionIconSize");
    v17 = v16 + 16.0 + 8.0;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
    objc_msgSend(v18, "setSeparatorInset:", v11, v17, v13, v15);

    v20 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "tableSeparatorColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController headerSeparatorView](self, "headerSeparatorView"));
    objc_msgSend(v19, "setBackgroundColor:", v20);

  }
}

- (void)setMetrics:(id)a3
{
  void *v5;
  void *v6;
  id v7;
  BKLibraryCollectionsListMetrics *v8;
  _QWORD v9[4];
  id v10;
  BKLibraryCollectionsListViewController *v11;
  BKLibraryCollectionsListMetrics *v12;

  v8 = (BKLibraryCollectionsListMetrics *)a3;
  if (self->_metrics != v8)
  {
    objc_storeStrong((id *)&self->_metrics, a3);
    -[BKLibraryCollectionsListViewController setIconCache:](self, "setIconCache:", 0);
    -[BKLibraryCollectionsListViewController p_updatePopoverFromMetricsIfNeeded:](self, "p_updatePopoverFromMetricsIfNeeded:", v8);
    -[BKLibraryCollectionsListViewController p_updateTableViewFromMetrics:](self, "p_updateTableViewFromMetrics:", v8);
    -[BKLibraryCollectionsListViewController _updateBarButtonsAnimated:](self, "_updateBarButtonsAnimated:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathsForVisibleRows"));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100180DC4;
    v9[3] = &unk_1008ED490;
    v10 = v5;
    v11 = self;
    v12 = v8;
    v7 = v5;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

  }
}

- (void)_analyticsSubmitBrowseCollectionScreenViewEventWithTracker:(id)a3
{
  NSMutableArray *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  void *j;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  id v37;
  void *v38;
  id v40;
  void *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _BYTE v50[128];
  id v51;
  _BYTE v52[128];

  v40 = a3;
  v3 = objc_opt_new(NSMutableArray);
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "collectionProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "selectableDefaultCollections"));

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v47 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)i);
        v12 = objc_alloc((Class)BACollectionIDData);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "collectionID"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "members"));
        v15 = objc_msgSend(v12, "initWithCollectionID:collectionMemberCount:", v13, objc_msgSend(v14, "count"));

        -[NSMutableArray addObject:](v3, "addObject:", v15);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v46, v52, 16);
    }
    while (v8);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "uiChildContext"));
  v17 = objc_alloc_init((Class)NSFetchRequest);
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSEntityDescription entityForName:inManagedObjectContext:](NSEntityDescription, "entityForName:inManagedObjectContext:", CFSTR("BKCollection"), v16));
  objc_msgSend(v17, "setEntity:", v18);

  v19 = objc_msgSend(objc_alloc((Class)NSSortDescriptor), "initWithKey:ascending:", CFSTR("sortKey"), 1);
  v51 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v51, 1));
  objc_msgSend(v17, "setSortDescriptors:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(+[BKCollection predicateForNonDeletedUserCollections](BKCollection, "predicateForNonDeletedUserCollections"));
  objc_msgSend(v17, "setPredicate:", v21);

  v22 = objc_msgSend(objc_alloc((Class)NSFetchedResultsController), "initWithFetchRequest:managedObjectContext:sectionNameKeyPath:cacheName:", v17, v16, 0, 0);
  if (objc_msgSend(v22, "performFetch:", 0))
  {
    v37 = v17;
    v38 = v16;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "fetchedObjects"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithArray:](NSMutableArray, "arrayWithArray:", v23));

    v44 = 0u;
    v45 = 0u;
    v42 = 0u;
    v43 = 0u;
    v25 = v24;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v43;
      do
      {
        for (j = 0; j != v27; j = (char *)j + 1)
        {
          if (*(_QWORD *)v43 != v28)
            objc_enumerationMutation(v25);
          v30 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * (_QWORD)j);
          v31 = objc_alloc((Class)BACollectionIDData);
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "collectionID"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "members"));
          v34 = objc_msgSend(v31, "initWithCollectionID:collectionMemberCount:", v32, objc_msgSend(v33, "count"));

          -[NSMutableArray addObject:](v3, "addObject:", v34);
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
      }
      while (v27);
    }

    v17 = v37;
    v16 = v38;
  }
  v35 = objc_msgSend(objc_alloc((Class)BACollectionSummaryData), "initWithCollectionSummary:", v3);
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[BAEventReporter sharedReporter](BAEventReporter, "sharedReporter"));
  objc_msgSend(v36, "emitBrowseCollectionScreenViewEventWithTracker:startDate:summaryData:", v40, self->_analyticsAppearDate, v35);

}

- (BOOL)bkaxIsCustomCollectionCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  LOBYTE(self) = -[BKLibraryCollectionsListViewController _indexPathIsUser:](self, "_indexPathIsUser:", v6);
  return (char)self;
}

- (BOOL)bkaxIsButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForCell:", v4));

  LOBYTE(self) = -[BKLibraryCollectionsListViewController _isAddCollectionIndexPath:](self, "_isAddCollectionIndexPath:", v6);
  return (char)self;
}

- (BOOL)bkaxIsLastCollection:(id)a3
{
  id v4;
  void *v5;
  char *v6;
  void *v7;
  char *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  v6 = (char *)objc_msgSend(v5, "numberOfSections") - 1;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  v8 = (char *)objc_msgSend(v7, "numberOfRowsInSection:", v6) - 1;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "indexPathForCell:", v4));

  v11 = objc_msgSend(v10, "row") == v8 && objc_msgSend(v10, "section") == v6;
  return v11;
}

- (void)bkaxPerformHide:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id location;

  v4 = a3;
  v5 = objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForCell:", v4));

  v8 = objc_loadWeakRetained(&location);
  objc_msgSend(v8, "_concludeHide:atIndexPath:", 1, v7);

  objc_destroyWeak(&location);
}

- (void)bkaxPerformShow:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id location;

  v4 = a3;
  v5 = objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForCell:", v4));

  v8 = objc_loadWeakRetained(&location);
  objc_msgSend(v8, "_concludeHide:atIndexPath:", 0, v7);

  objc_destroyWeak(&location);
}

- (void)bkaxPerformRename:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  id location;

  v4 = a3;
  v5 = objc_initWeak(&location, self);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKLibraryCollectionsListViewController tableView](self, "tableView"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForCell:", v4));

  v8 = objc_loadWeakRetained(&location);
  objc_msgSend(v8, "_beginEditingUserCollectionAtIndexPath:", v7);

  objc_destroyWeak(&location);
}

- (BOOL)bkaxDidPerformEscape:(id)a3
{
  return -[BKLibraryCollectionsListViewController accessibilityPerformEscape](self, "accessibilityPerformEscape", a3);
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[BKLibraryCollectionsListViewController isEditing](self, "isEditing"))
  {
    -[BKLibraryCollectionsListViewController stopEditButtonPressed:](self, "stopEditButtonPressed:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("Ended editing"), &stru_10091C438, 0));

    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v4);
    return 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)BKLibraryCollectionsListViewController;
    return -[BKLibraryCollectionsListViewController accessibilityPerformEscape](&v6, "accessibilityPerformEscape");
  }
}

- (BKLibraryManagedObjectContext)managedObjectContext
{
  return self->_managedObjectContext;
}

- (void)setManagedObjectContext:(id)a3
{
  objc_storeStrong((id *)&self->_managedObjectContext, a3);
}

- (BKLibraryCollectionsListViewDelegate)delegate
{
  return (BKLibraryCollectionsListViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BKCollection)selectedCollection
{
  return self->_selectedCollection;
}

- (void)setSelectedCollection:(id)a3
{
  objc_storeStrong((id *)&self->_selectedCollection, a3);
}

- (BKLibraryCollectionsListMetrics)metrics
{
  return self->_metrics;
}

- (BOOL)supressLargeTitle
{
  return self->_supressLargeTitle;
}

- (void)setSupressLargeTitle:(BOOL)a3
{
  self->_supressLargeTitle = a3;
}

- (BKLibraryBookshelfMetrics)bookshelfMetrics
{
  return self->_bookshelfMetrics;
}

- (BOOL)isTextEditing
{
  return self->_textEditing;
}

- (BOOL)wantsAddCollectionRow
{
  return self->_wantsAddCollectionRow;
}

- (void)setUserCollections:(id)a3
{
  objc_storeStrong((id *)&self->_userCollections, a3);
}

- (NSMutableDictionary)collectionAssetCounts
{
  return self->_collectionAssetCounts;
}

- (void)setCollectionAssetCounts:(id)a3
{
  objc_storeStrong((id *)&self->_collectionAssetCounts, a3);
}

- (void)setPrefixCollections:(id)a3
{
  objc_storeStrong((id *)&self->_prefixCollections, a3);
}

- (BOOL)includeHiddenInPrefixCollections
{
  return self->_includeHiddenInPrefixCollections;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (UIView)prefixFooterView
{
  return self->_prefixFooterView;
}

- (void)setPrefixFooterView:(id)a3
{
  objc_storeStrong((id *)&self->_prefixFooterView, a3);
}

- (BOOL)containsSeriesContainer
{
  return self->_containsSeriesContainer;
}

- (void)setContainsSeriesContainer:(BOOL)a3
{
  self->_containsSeriesContainer = a3;
}

- (BOOL)showDivider
{
  return self->_showDivider;
}

- (void)setShowDivider:(BOOL)a3
{
  self->_showDivider = a3;
}

- (void)setNavBarEditButtonItem:(id)a3
{
  objc_storeStrong((id *)&self->_navBarEditButtonItem, a3);
}

- (BUCoalescingCallBlock)coalescedTableViewReloadData
{
  return self->_coalescedTableViewReloadData;
}

- (void)setCoalescedTableViewReloadData:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedTableViewReloadData, a3);
}

- (NSFetchedResultsController)fetchedResultsController
{
  return self->_fetchedResultsController;
}

- (void)setFetchedResultsController:(id)a3
{
  objc_storeStrong((id *)&self->_fetchedResultsController, a3);
}

- (BCManagedObjectIDMonitor)prefixCollectionsMonitor
{
  return self->_prefixCollectionsMonitor;
}

- (void)setPrefixCollectionsMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_prefixCollectionsMonitor, a3);
}

- (NSMutableDictionary)iconCache
{
  return self->_iconCache;
}

- (void)setIconCache:(id)a3
{
  objc_storeStrong((id *)&self->_iconCache, a3);
}

- (BOOL)changeIsUserDriven
{
  return self->_changeIsUserDriven;
}

- (void)setChangeIsUserDriven:(BOOL)a3
{
  self->_changeIsUserDriven = a3;
}

- (BOOL)isAddingToCollection
{
  return self->_isAddingToCollection;
}

- (void)setIsAddingToCollection:(BOOL)a3
{
  self->_isAddingToCollection = a3;
}

- (CGRect)keyboardFrame
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_keyboardFrame.origin.x;
  y = self->_keyboardFrame.origin.y;
  width = self->_keyboardFrame.size.width;
  height = self->_keyboardFrame.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setKeyboardFrame:(CGRect)a3
{
  self->_keyboardFrame = a3;
}

- (UIView)headerSeparatorView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_headerSeparatorView);
}

- (void)setHeaderSeparatorView:(id)a3
{
  objc_storeWeak((id *)&self->_headerSeparatorView, a3);
}

- (BKLibraryCollectionsListCell)textEntryCell
{
  return self->_textEntryCell;
}

- (void)setTextEntryCell:(id)a3
{
  objc_storeStrong((id *)&self->_textEntryCell, a3);
}

- (BKCollection)textEntryCollection
{
  return self->_textEntryCollection;
}

- (void)setTextEntryCollection:(id)a3
{
  objc_storeStrong((id *)&self->_textEntryCollection, a3);
}

- (NSIndexPath)textEntryIndexPath
{
  return self->_textEntryIndexPath;
}

- (void)setTextEntryIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_textEntryIndexPath, a3);
}

- (NSIndexPath)postKeyboardIndexPath
{
  return self->_postKeyboardIndexPath;
}

- (void)setPostKeyboardIndexPath:(id)a3
{
  objc_storeStrong((id *)&self->_postKeyboardIndexPath, a3);
}

- (BOOL)endTextEditingMeansEndEditMode
{
  return self->_endTextEditingMeansEndEditMode;
}

- (void)setEndTextEditingMeansEndEditMode:(BOOL)a3
{
  self->_endTextEditingMeansEndEditMode = a3;
}

- (BOOL)suppressEditControlsForNewCollection
{
  return self->_suppressEditControlsForNewCollection;
}

- (void)setSuppressEditControlsForNewCollection:(BOOL)a3
{
  self->_suppressEditControlsForNewCollection = a3;
}

- (BOOL)endEditingMeansTableReload
{
  return self->_endEditingMeansTableReload;
}

- (void)setEndEditingMeansTableReload:(BOOL)a3
{
  self->_endEditingMeansTableReload = a3;
}

- (NSArray)assetIDs
{
  return self->_assetIDs;
}

- (void)setAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_assetIDs, a3);
}

- (NSArray)knownAssetTypes
{
  return self->_knownAssetTypes;
}

- (void)setKnownAssetTypes:(id)a3
{
  objc_storeStrong((id *)&self->_knownAssetTypes, a3);
}

- (NSHashTable)knownStoreAssetIDs
{
  return self->_knownStoreAssetIDs;
}

- (void)setKnownStoreAssetIDs:(id)a3
{
  objc_storeStrong((id *)&self->_knownStoreAssetIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownStoreAssetIDs, 0);
  objc_storeStrong((id *)&self->_knownAssetTypes, 0);
  objc_storeStrong((id *)&self->_assetIDs, 0);
  objc_storeStrong((id *)&self->_postKeyboardIndexPath, 0);
  objc_storeStrong((id *)&self->_textEntryIndexPath, 0);
  objc_storeStrong((id *)&self->_textEntryCollection, 0);
  objc_storeStrong((id *)&self->_textEntryCell, 0);
  objc_destroyWeak((id *)&self->_headerSeparatorView);
  objc_storeStrong((id *)&self->_iconCache, 0);
  objc_storeStrong((id *)&self->_prefixCollectionsMonitor, 0);
  objc_storeStrong((id *)&self->_fetchedResultsController, 0);
  objc_storeStrong((id *)&self->_coalescedTableViewReloadData, 0);
  objc_storeStrong((id *)&self->_navBarEditButtonItem, 0);
  objc_storeStrong((id *)&self->_prefixFooterView, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_prefixCollections, 0);
  objc_storeStrong((id *)&self->_collectionAssetCounts, 0);
  objc_storeStrong((id *)&self->_userCollections, 0);
  objc_storeStrong((id *)&self->_bookshelfMetrics, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_selectedCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_managedObjectContext, 0);
  objc_storeStrong((id *)&self->_analyticsAppearDate, 0);
}

@end
