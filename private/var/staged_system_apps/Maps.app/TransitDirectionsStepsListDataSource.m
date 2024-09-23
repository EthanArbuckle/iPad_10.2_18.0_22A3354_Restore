@implementation TransitDirectionsStepsListDataSource

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
  objc_msgSend(v3, "removeObserver:forKeyPath:", self, CFSTR("bounds"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
  objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("bounds"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
  objc_msgSend(v5, "removeObserver:forKeyPath:", self, CFSTR("bounds"));

  v6.receiver = self;
  v6.super_class = (Class)TransitDirectionsStepsListDataSource;
  -[TransitDirectionsStepsListDataSource dealloc](&v6, "dealloc");
}

- (TransitDirectionsStepsListDataSource)init
{
  return -[TransitDirectionsStepsListDataSource initWithRoute:](self, "initWithRoute:", 0);
}

- (TransitDirectionsStepsListDataSource)initWithRoute:(id)a3
{
  id v5;
  TransitDirectionsStepsListDataSource *v6;
  TransitDirectionsStepsListDataSource *v7;
  MKTransitItemReferenceDateUpdater *v8;
  MKTransitItemReferenceDateUpdater *referenceDateUpdater;
  void *v10;
  uint64_t v11;
  void *v12;
  id v14;
  NSObject *v15;
  id v16;
  NSObject *v17;
  char *v18;
  objc_super v19;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  const char *v23;
  __int16 v24;
  int v25;
  __int16 v26;
  const char *v27;

  v5 = a3;
  v19.receiver = self;
  v19.super_class = (Class)TransitDirectionsStepsListDataSource;
  v6 = -[TransitDirectionsStepsListDataSource init](&v19, "init");
  v7 = v6;
  if (v6)
  {
    v6->_options = 1;
    *(_OWORD *)&v6->_activeComposedRouteStepIndex = xmmword_100E3EBA0;
    v8 = (MKTransitItemReferenceDateUpdater *)objc_msgSend(objc_alloc((Class)MKTransitItemReferenceDateUpdater), "initWithDelegate:", v6);
    referenceDateUpdater = v7->_referenceDateUpdater;
    v7->_referenceDateUpdater = v8;

    v7->_highlightingBehaviour = 0;
    objc_storeStrong((id *)&v7->_route, a3);
    if (v5 && objc_msgSend(v5, "transportType") != 1)
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v21 = "-[TransitDirectionsStepsListDataSource initWithRoute:]";
        v22 = 2080;
        v23 = "TransitDirectionsStepsListDataSource.m";
        v24 = 1024;
        v25 = 171;
        v26 = 2080;
        v27 = "!route || route.transportType == GEOTransportType_TRANSIT";
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v16 = sub_1004318FC();
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v18 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v21 = v18;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v11 = MNLocaleDidChangeNotification();
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    objc_msgSend(v10, "addObserver:selector:name:object:", v7, "_localeDidChange", v12, 0);

  }
  return v7;
}

- (TransitDirectionsStepsListDataSource)initWithRoute:(id)a3 delegate:(id)a4 forNavigation:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  TransitDirectionsStepsListDataSource *v9;
  TransitDirectionsStepsListDataSource *v10;

  v5 = a5;
  v8 = a4;
  v9 = -[TransitDirectionsStepsListDataSource initWithRoute:](self, "initWithRoute:", a3);
  v10 = v9;
  if (v9)
  {
    -[TransitDirectionsStepsListDataSource setEnableNavigationUpdates:](v9, "setEnableNavigationUpdates:", v5);
    -[TransitDirectionsStepsListDataSource setAllowStepSelection:](v10, "setAllowStepSelection:", v5);
    -[TransitDirectionsStepsListDataSource setDelegate:](v10, "setDelegate:", v8);
  }

  return v10;
}

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  GEOComposedRoute *route;
  TransitDirectionsStepsListDataProvider *dataProvider;
  id v8;
  NSObject *v9;
  TransitDirectionsStepsListDataSource *v10;
  objc_class *v11;
  NSString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSIndexPath *activeItemIndexPath;
  NSIndexPath *displayedItemIndexPath;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  GEOComposedRoute *v24;

  v5 = (GEOComposedRoute *)a3;
  route = self->_route;
  if (route != v5)
  {
    -[GEOComposedRoute unregisterObserver:](route, "unregisterObserver:", self);
    dataProvider = self->_dataProvider;
    self->_dataProvider = 0;

    objc_storeStrong((id *)&self->_route, a3);
    -[GEOComposedRoute registerObserver:](self->_route, "registerObserver:", self);
    v8 = sub_100ADE540();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      -[TransitDirectionsStepsListDataSource _rebuildItems](self, "_rebuildItems");
      *(_OWORD *)&self->_activeComposedRouteStepIndex = xmmword_100E3EBA0;
      activeItemIndexPath = self->_activeItemIndexPath;
      self->_activeItemIndexPath = 0;

      displayedItemIndexPath = self->_displayedItemIndexPath;
      self->_displayedItemIndexPath = 0;

      -[TransitDirectionsStepsListDataSource _prepareForUpdatedRoute](self, "_prepareForUpdatedRoute");
      self->_routeSetAwaitingTableViewReload = 1;
      objc_initWeak((id *)buf, self);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100ADE580;
      v19[3] = &unk_1011AD260;
      objc_copyWeak(&v20, (id *)buf);
      -[TransitDirectionsStepsListDataSource _reloadListViewForRouteChangeIfNotAnimating:](self, "_reloadListViewForRouteChangeIfNotAnimating:", v19);
      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
      goto LABEL_10;
    }
    v10 = self;
    v11 = (objc_class *)objc_opt_class(v10);
    v12 = NSStringFromClass(v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    if ((objc_opt_respondsToSelector(v10, "accessibilityIdentifier") & 1) != 0)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v10, "performSelector:", "accessibilityIdentifier"));
      v15 = v14;
      if (v14 && !objc_msgSend(v14, "isEqualToString:", v13))
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v13, v10, v15));

        goto LABEL_8;
      }

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v13, v10));
LABEL_8:

    *(_DWORD *)buf = 138543618;
    v22 = v16;
    v23 = 2112;
    v24 = v5;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "[%{public}@] setRoute: %@", buf, 0x16u);

    goto LABEL_9;
  }
LABEL_10:

}

- (TransitDirectionsStepsListDataProvider)dataProvider
{
  void *dataProvider;
  TransitDirectionsStepsListDataProvider *v4;
  TransitDirectionsStepsListDataProvider *v5;

  dataProvider = self->_dataProvider;
  if (!dataProvider)
  {
    dataProvider = self->_route;
    if (dataProvider)
    {
      if (self->_navigationProvider)
        v4 = -[TransitDirectionsStepsListDataProvider initWithRoute:forGuidance:]([TransitDirectionsStepsListDataProvider alloc], "initWithRoute:forGuidance:", self->_route, 1);
      else
        v4 = (TransitDirectionsStepsListDataProvider *)objc_claimAutoreleasedReturnValue(objc_msgSend(dataProvider, "transitDirectionsStepsListDataProvider"));
      v5 = self->_dataProvider;
      self->_dataProvider = v4;

      dataProvider = self->_dataProvider;
    }
  }
  return (TransitDirectionsStepsListDataProvider *)dataProvider;
}

- (void)setActive:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  TransitDirectionsStepsListDataSource *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  __CFString *v15;
  uint8_t buf[4];
  void *v17;
  __int16 v18;
  __CFString *v19;

  if (self->_active != a3)
  {
    v3 = a3;
    v5 = sub_100ADE540();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
LABEL_11:

      self->_active = v3;
      -[MKTransitItemReferenceDateUpdater setActive:](self->_referenceDateUpdater, "setActive:", v3);
      if (v3)
        -[TransitDirectionsStepsListDataSource _reloadListViewForRouteChange](self, "_reloadListViewForRouteChange");
      return;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    v14 = CFSTR("NO");
    if (v3)
      v14 = CFSTR("YES");
    v15 = v14;
    *(_DWORD *)buf = 138543618;
    v17 = v13;
    v18 = 2114;
    v19 = v15;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] setActive: %{public}@", buf, 0x16u);

    goto LABEL_11;
  }
}

- (void)setDelegate:(id)a3
{
  id v4;
  id WeakRetained;
  unint64_t v6;
  unsigned __int8 v7;
  unint64_t obj;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  obj = (unint64_t)v4;
  v6 = (unint64_t)WeakRetained;
  if (obj | v6)
  {
    v7 = objc_msgSend((id)obj, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      objc_storeWeak((id *)&self->_delegate, (id)obj);
      -[TransitDirectionsStepsListDataSource _notifyDelegateOfUpdatedActiveStep](self, "_notifyDelegateOfUpdatedActiveStep");
      -[TransitDirectionsStepsListDataSource _notifyDelegateOfUpdatedDisplayedStep](self, "_notifyDelegateOfUpdatedDisplayedStep");
    }
  }

}

- (void)setOptions:(unint64_t)a3
{
  self->_options = a3;
  -[TransitDirectionsStepsListDataSource _updateFooterInListView](self, "_updateFooterInListView");
}

- (id)_scrollView
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
    v7 = v6;
    if (v6)
      v8 = v6;
    else
      v8 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
    v5 = v8;

  }
  return v5;
}

- (void)setTableView:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_tableView);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      objc_msgSend(WeakRetained, "removeObserver:forKeyPath:", self, CFSTR("bounds"));
    objc_storeWeak((id *)&self->_tableView, obj);
    if (obj)
    {
      -[TransitDirectionsStepsListDataSource setCollectionView:](self, "setCollectionView:", 0);
      -[TransitDirectionsStepsListDataSource setListView:](self, "setListView:", 0);
      -[TransitDirectionsStepsListDataSource _updateRegisteredCellClasses](self, "_updateRegisteredCellClasses");
      objc_msgSend(obj, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 1, 0);
      -[TransitDirectionsStepsListDataSource _resetRowHeightCache](self, "_resetRowHeightCache");
      -[TransitDirectionsStepsListDataSource _reloadListViewForRouteChange](self, "_reloadListViewForRouteChange");
    }
  }

}

- (void)setCollectionView:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_collectionView);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      objc_msgSend(WeakRetained, "removeObserver:forKeyPath:", self, CFSTR("bounds"));
    objc_storeWeak((id *)&self->_collectionView, obj);
    if (obj)
    {
      -[TransitDirectionsStepsListDataSource setTableView:](self, "setTableView:", 0);
      -[TransitDirectionsStepsListDataSource setListView:](self, "setListView:", 0);
      -[TransitDirectionsStepsListDataSource _updateRegisteredCellClasses](self, "_updateRegisteredCellClasses");
      objc_msgSend(obj, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 1, 0);
      -[TransitDirectionsStepsListDataSource _resetRowHeightCache](self, "_resetRowHeightCache");
      -[TransitDirectionsStepsListDataSource _reloadListViewForRouteChange](self, "_reloadListViewForRouteChange");
    }
  }

}

- (void)setListView:(id)a3
{
  id WeakRetained;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_listView);
  if (WeakRetained != obj)
  {
    if (WeakRetained)
      objc_msgSend(WeakRetained, "removeObserver:forKeyPath:", self, CFSTR("bounds"));
    objc_storeWeak((id *)&self->_listView, obj);
    if (obj)
    {
      -[TransitDirectionsStepsListDataSource setTableView:](self, "setTableView:", 0);
      -[TransitDirectionsStepsListDataSource setCollectionView:](self, "setCollectionView:", 0);
      -[TransitDirectionsStepsListDataSource _updateRegisteredCellClasses](self, "_updateRegisteredCellClasses");
      objc_msgSend(obj, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 1, 0);
      -[TransitDirectionsStepsListDataSource _reloadListViewForRouteChange](self, "_reloadListViewForRouteChange");
      -[TransitDirectionsStepsListDataSource _updateActiveItemInListViewIfNeeded](self, "_updateActiveItemInListViewIfNeeded");
      -[TransitDirectionsStepsListDataSource _updateFooterInListView](self, "_updateFooterInListView");
    }
  }

}

- (void)setFlattenToSingleSection:(BOOL)a3
{
  if (self->_flattenToSingleSection != a3)
  {
    self->_flattenToSingleSection = a3;
    -[TransitDirectionsStepsListDataSource _reloadListViewForRouteChange](self, "_reloadListViewForRouteChange");
  }
}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  double v14;
  double v15;
  id v16;
  NSObject *v17;
  TransitDirectionsStepsListDataSource *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  objc_super v28;
  uint8_t buf[4];
  void *v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _scrollView](self, "_scrollView"));

  if (v13 == v11)
  {
    -[TransitDirectionsStepsListDataSource _availableWidth](self, "_availableWidth");
    v15 = v14;
    if (self->_listWidthForCachedRowHeights == v14)
      goto LABEL_12;
    v16 = sub_100ADE540();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
LABEL_11:

      -[TransitDirectionsStepsListDataSource recalculateLeadingInstructionMarginForWidth:](self, "recalculateLeadingInstructionMarginForWidth:", v15);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
      objc_msgSend(v25, "reloadData");

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
      objc_msgSend(v26, "reloadData");

      v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
      objc_msgSend(v27, "reloadData");

      goto LABEL_12;
    }
    v18 = self;
    v19 = (objc_class *)objc_opt_class(v18);
    v20 = NSStringFromClass(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
      v23 = v22;
      if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

        goto LABEL_10;
      }

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_10:

    *(_DWORD *)buf = 138543362;
    v30 = v24;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "[%{public}@] available width did change", buf, 0xCu);

    goto LABEL_11;
  }
  v28.receiver = self;
  v28.super_class = (Class)TransitDirectionsStepsListDataSource;
  -[TransitDirectionsStepsListDataSource observeValueForKeyPath:ofObject:change:context:](&v28, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
LABEL_12:

}

- (void)_updateRegisteredCellClasses
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
    +[TransitDirectionsCell registerCellsForTableView:](TransitDirectionsCell, "registerCellsForTableView:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
    objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(RoutePlanningFooterCell), CFSTR("TransitDirectionsListSharingIdentifier"));

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
    +[TransitDirectionsCell registerCellsForCollectionView:](TransitDirectionsCell, "registerCellsForCollectionView:", v7);

    v8 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
    objc_msgSend(v8, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(RoutePlanningFooterCollectionViewCell), CFSTR("TransitDirectionsListSharingIdentifier"));

  }
}

- (void)_reloadListViewForRouteChange
{
  void *v3;
  id v4;
  NSObject *v5;
  _BOOL4 v6;
  TransitDirectionsStepsListDataSource *v7;
  TransitDirectionsStepsListDataSource *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  TransitDirectionsStepsListDataSource *v15;
  TransitDirectionsStepsListDataSource *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  id reloadTableCompletionBlock;
  uint8_t buf[4];
  __CFString *v28;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _scrollView](self, "_scrollView"));

  v4 = sub_100ADE540();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG);
  if (!v3)
  {
    if (!v6)
      goto LABEL_24;
    v15 = self;
    v16 = v15;
    if (!v15)
    {
      v22 = CFSTR("<nil>");
      goto LABEL_23;
    }
    v17 = (objc_class *)objc_opt_class(v15);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
      {
        v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

        goto LABEL_17;
      }

    }
    v22 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_17:

LABEL_23:
    *(_DWORD *)buf = 138543362;
    v28 = v22;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Will not reload table for route change, no scroll view yet", buf, 0xCu);

    goto LABEL_24;
  }
  if (!v6)
    goto LABEL_20;
  v7 = self;
  v8 = v7;
  if (!v7)
  {
    v14 = CFSTR("<nil>");
    goto LABEL_19;
  }
  v9 = (objc_class *)objc_opt_class(v7);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
    v13 = v12;
    if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
    {
      v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

      goto LABEL_9;
    }

  }
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_9:

LABEL_19:
  *(_DWORD *)buf = 138543362;
  v28 = v14;
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Will reload table for route change", buf, 0xCu);

LABEL_20:
  -[TransitDirectionsStepsListDataSource _resetRowHeightCache](self, "_resetRowHeightCache");
  -[TransitDirectionsStepsListDataSource _availableWidth](self, "_availableWidth");
  -[TransitDirectionsStepsListDataSource recalculateLeadingInstructionMarginForWidth:](self, "recalculateLeadingInstructionMarginForWidth:");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
  objc_msgSend(v23, "reloadData");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
  objc_msgSend(v24, "reloadData");

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
  objc_msgSend(v25, "reloadData");

  -[TransitDirectionsStepsListDataSource _updateFooterInListView](self, "_updateFooterInListView");
  v5 = objc_retainBlock(self->_reloadTableCompletionBlock);
  reloadTableCompletionBlock = self->_reloadTableCompletionBlock;
  self->_reloadTableCompletionBlock = 0;

  if (v5)
    ((void (*))v5[2].isa)(v5);
LABEL_24:

}

- (void)_reloadListViewForRouteChangeIfNotAnimating
{
  -[TransitDirectionsStepsListDataSource _reloadListViewForRouteChangeIfNotAnimating:](self, "_reloadListViewForRouteChangeIfNotAnimating:", 0);
}

- (void)_reloadListViewForRouteChangeIfNotAnimating:(id)a3
{
  id v4;
  id v5;
  id reloadTableCompletionBlock;
  id v7;
  NSObject *v8;
  TransitDirectionsStepsListDataSource *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __CFString *v16;
  __CFString *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  __CFString *v21;

  v4 = a3;
  v5 = objc_msgSend(v4, "copy");
  reloadTableCompletionBlock = self->_reloadTableCompletionBlock;
  self->_reloadTableCompletionBlock = v5;

  if (!self->_animatingExpansion)
  {
    -[TransitDirectionsStepsListDataSource _didFinishAnimatingListView](self, "_didFinishAnimatingListView");
    goto LABEL_13;
  }
  self->_listViewReloadWaitingAnimationCompletion = 1;
  v7 = sub_100ADE540();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    v9 = self;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_8;
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_8:

    v16 = CFSTR("YES");
    if (!v4)
      v16 = CFSTR("NO");
    v17 = v16;
    *(_DWORD *)buf = 138543618;
    v19 = v15;
    v20 = 2112;
    v21 = v17;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "[%{public}@] Will defer table reload until after expansion/collapse animation (completion block: %@)", buf, 0x16u);

  }
LABEL_13:

}

- (void)_reloadVisibleCells
{
  void *v3;
  id v4;
  NSObject *v5;
  TransitDirectionsStepsListDataSource *v6;
  TransitDirectionsStepsListDataSource *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  id v15;
  NSObject *v16;
  TransitDirectionsStepsListDataSource *v17;
  TransitDirectionsStepsListDataSource *v18;
  objc_class *v19;
  NSString *v20;
  void *v21;
  void *v22;
  void *v23;
  __CFString *v24;
  void *v25;
  id v26;
  NSObject *v27;
  TransitDirectionsStepsListDataSource *v28;
  TransitDirectionsStepsListDataSource *v29;
  objc_class *v30;
  NSString *v31;
  void *v32;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  _QWORD v42[4];
  id v43;
  TransitDirectionsStepsListDataSource *v44;
  uint8_t buf[4];
  __CFString *v46;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));

  if (!v3)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));

    if (v14)
    {
      v15 = sub_100ADE540();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
LABEL_33:

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
LABEL_38:
        v39 = v41;
        objc_msgSend(v41, "reloadData");
        goto LABEL_39;
      }
      v17 = self;
      v18 = v17;
      if (!v17)
      {
        v24 = CFSTR("<nil>");
        goto LABEL_32;
      }
      v19 = (objc_class *)objc_opt_class(v17);
      v20 = NSStringFromClass(v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
      if ((objc_opt_respondsToSelector(v18, "accessibilityIdentifier") & 1) != 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v18, "performSelector:", "accessibilityIdentifier"));
        v23 = v22;
        if (v22 && !objc_msgSend(v22, "isEqualToString:", v21))
        {
          v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v21, v18, v23));

          goto LABEL_18;
        }

      }
      v24 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v21, v18));
LABEL_18:

LABEL_32:
      *(_DWORD *)buf = 138543362;
      v46 = v24;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "[%{public}@] Reloading visible cells in table view", buf, 0xCu);

      goto LABEL_33;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));

    if (!v25)
      return;
    v26 = sub_100ADE540();
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
LABEL_37:

      v41 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
      goto LABEL_38;
    }
    v28 = self;
    v29 = v28;
    if (!v28)
    {
      v35 = CFSTR("<nil>");
      goto LABEL_36;
    }
    v30 = (objc_class *)objc_opt_class(v28);
    v31 = NSStringFromClass(v30);
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    if ((objc_opt_respondsToSelector(v29, "accessibilityIdentifier") & 1) != 0)
    {
      v33 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v29, "performSelector:", "accessibilityIdentifier"));
      v34 = v33;
      if (v33 && !objc_msgSend(v33, "isEqualToString:", v32))
      {
        v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v32, v29, v34));

        goto LABEL_27;
      }

    }
    v35 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v32, v29));
LABEL_27:

LABEL_36:
    *(_DWORD *)buf = 138543362;
    v46 = v35;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "[%{public}@] Reloading all cells in list view", buf, 0xCu);

    goto LABEL_37;
  }
  v4 = sub_100ADE540();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_29;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_9;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_9:

LABEL_29:
    *(_DWORD *)buf = 138543362;
    v46 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Reloading individual visible cells in collection view", buf, 0xCu);

  }
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "indexPathsForVisibleItems"));

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "visibleCells"));

  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100ADF8B8;
  v42[3] = &unk_1011E20C0;
  v43 = v37;
  v44 = self;
  v40 = v37;
  objc_msgSend(v39, "enumerateObjectsUsingBlock:", v42);

LABEL_39:
}

- (void)_updateFooterInListView
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  RoutePlanningFooterView *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));

  if (v3)
  {
    v4 = -[TransitDirectionsStepsListDataSource options](self, "options");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "footerView"));
    v7 = v6;
    if ((v4 & 8) != 0)
    {

      if (v7)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "footerView"));

        v10 = objc_opt_class(RoutePlanningFooterView);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          v11 = v9;
        else
          v11 = 0;
        v13 = v11;

        -[TransitDirectionsStepsListDataSource _configureFooterView:](self, "_configureFooterView:", v13);
      }
      else
      {
        v13 = -[RoutePlanningFooterView initWithFrame:]([RoutePlanningFooterView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
        -[TransitDirectionsStepsListDataSource _configureFooterView:](self, "_configureFooterView:", v13);
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
        objc_msgSend(v12, "setFooterView:", v13);

      }
      goto LABEL_12;
    }

    if (v7)
    {
      v13 = (RoutePlanningFooterView *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
      -[RoutePlanningFooterView setFooterView:](v13, "setFooterView:", 0);
LABEL_12:

    }
  }
}

- (void)_didFinishAnimatingListView
{
  id v3;
  NSObject *v4;
  TransitDirectionsStepsListDataSource *v5;
  objc_class *v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  __CFString *v13;
  uint8_t buf[4];
  void *v15;
  __int16 v16;
  __CFString *v17;

  if (self->_listViewReloadWaitingAnimationCompletion)
  {
    v3 = sub_100ADE540();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (!os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
LABEL_12:

      self->_listViewReloadWaitingAnimationCompletion = 0;
      goto LABEL_13;
    }
    v5 = self;
    v6 = (objc_class *)objc_opt_class(v5);
    v7 = NSStringFromClass(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    if ((objc_opt_respondsToSelector(v5, "accessibilityIdentifier") & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v5, "performSelector:", "accessibilityIdentifier"));
      v10 = v9;
      if (v9 && !objc_msgSend(v9, "isEqualToString:", v8))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v8, v5, v10));

        goto LABEL_8;
      }

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v8, v5));
LABEL_8:

    if (v5->_reloadTableCompletionBlock)
      v12 = CFSTR("YES");
    else
      v12 = CFSTR("NO");
    v13 = v12;
    *(_DWORD *)buf = 138543618;
    v15 = v11;
    v16 = 2112;
    v17 = v13;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Will perform deferred table reload (completion block: %@)", buf, 0x16u);

    goto LABEL_12;
  }
LABEL_13:
  -[TransitDirectionsStepsListDataSource _reloadListViewForRouteChange](self, "_reloadListViewForRouteChange");
}

- (double)_availableWidth
{
  void *v2;
  double Width;
  CGRect v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _scrollView](self, "_scrollView"));
  objc_msgSend(v2, "bounds");
  Width = CGRectGetWidth(v5);

  return Width;
}

- (int64_t)_userInterfaceIdiom
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _scrollView](self, "_scrollView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "traitCollection"));
  v4 = objc_msgSend(v3, "userInterfaceIdiom");

  return (int64_t)v4;
}

- (void)recalculateLeadingInstructionMarginForWidth:(double)a3
{
  -[TransitDirectionsStepsListDataSource _resetArtworkSizesForAdaptiveItems](self, "_resetArtworkSizesForAdaptiveItems");
  -[TransitDirectionsStepsListDataSource _measureShieldWidthForListWidth:](self, "_measureShieldWidthForListWidth:", a3);
  self->_listWidthForCachedRowHeights = a3;
}

- (void)_measureShieldWidthForListWidth:(double)a3
{
  void *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  TransitDirectionsListArtworkWidthCalculator *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  uint64_t v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _QWORD v29[2];
  __int128 v30;
  __int128 v31;
  _QWORD v32[4];
  id v33;
  _BYTE v34[128];

  if (self->_listWidthForLeadingInset != a3)
  {
    self->_listWidthForLeadingInset = a3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _scrollView](self, "_scrollView"));
    v6 = dbl_100E3EBB0[sub_1002A8AA0(v5) == 5];

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _scrollView](self, "_scrollView"));
    sub_1002A8AA0(v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _scrollView](self, "_scrollView"));
    if (sub_1002A8AA0(v8) == 5)
      v9 = 30.0;
    else
      v9 = 40.0;

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMapTable strongToStrongObjectsMapTable](NSMapTable, "strongToStrongObjectsMapTable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "items"));
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100ADFFF8;
    v32[3] = &unk_1011E20E8;
    v13 = v10;
    v33 = v13;
    v14 = sub_10039DCD4(v12, v32);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

    *(double *)v29 = v9;
    *(double *)&v29[1] = a3 - v6;
    v30 = xmmword_100E3EBC0;
    v31 = xmmword_100E3EBC0;
    v16 = -[TransitDirectionsListArtworkWidthCalculator initWithSizedArtworks:sizeParameter:]([TransitDirectionsListArtworkWidthCalculator alloc], "initWithSizedArtworks:sizeParameter:", v15, v29);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsListArtworkWidthCalculator calculateArtworkViewWidthAndArtworkSizes:](v16, "calculateArtworkViewWidthAndArtworkSizes:", &self->_transitDirectionsListInstructionsLeadingInset));
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(_QWORD *)v26 != v20)
            objc_enumerationMutation(v17);
          v22 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v22));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v22));
          objc_msgSend(v24, "setSelectedSize:", objc_msgSend(v23, "shieldSize"));

        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v25, v34, 16);
      }
      while (v19);
    }

  }
}

- (void)_resetArtworkSizesForAdaptiveItems
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  self->_listWidthForLeadingInset = 0.0;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "items"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
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
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v7);
        v9 = objc_opt_class(TransitDirectionsListArtworkItem);
        if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
        {
          v10 = v8;
          if (objc_msgSend(v10, "adaptiveShieldSize"))
            objc_msgSend(v10, "setSelectedSize:", objc_msgSend(v10, "initialAdaptiveSizeGroup"));

        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

}

- (void)_scrollToFirstCell
{
  id v3;
  NSObject *v4;
  TransitDirectionsStepsListDataSource *v5;
  TransitDirectionsStepsListDataSource *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double height;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  uint64_t v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v42;
  void *v43;
  double v44;
  uint8_t buf[4];
  __CFString *v46;

  v3 = sub_100ADE540();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v46 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Scrolling to first cell", buf, 0xCu);

  }
  v13 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
  if (!v13)
    goto LABEL_19;
  v14 = (void *)v13;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
  if ((uint64_t)objc_msgSend(v15, "numberOfSections") < 1)
    goto LABEL_18;
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
  objc_msgSend(v16, "bounds");
  v18 = v17;
  v20 = v19;
  height = CGSizeZero.height;

  if (CGSizeZero.width != v18 || height != v20)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    objc_msgSend(v14, "scrollToRowAtIndexPath:atScrollPosition:animated:", v15, 1, 0);
LABEL_18:

  }
LABEL_19:
  v23 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
  if (!v23)
    goto LABEL_27;
  v24 = (void *)v23;
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
  if ((uint64_t)objc_msgSend(v25, "numberOfSections") < 1)
    goto LABEL_26;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
  objc_msgSend(v26, "bounds");
  v28 = v27;
  v30 = v29;
  v31 = CGSizeZero.height;

  if (CGSizeZero.width != v28 || v31 != v30)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, 0));
    objc_msgSend(v24, "scrollToItemAtIndexPath:atScrollPosition:animated:", v25, 1, 0);
LABEL_26:

  }
LABEL_27:
  v33 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
  if (v33)
  {
    v34 = (void *)v33;
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
    objc_msgSend(v35, "bounds");
    v37 = v36;
    v39 = v38;
    v40 = CGSizeZero.height;

    if (CGSizeZero.width != v37 || v40 != v39)
    {
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
      objc_msgSend(v43, "contentInset");
      objc_msgSend(v42, "setContentOffset:animated:", 0, 0.0, v44);

    }
  }
}

- (void)scrollToDisplayedItemAnimated:(BOOL)a3
{
  -[TransitDirectionsStepsListDataSource _scrollToDisplayedItemIfNeeded:animated:](self, "_scrollToDisplayedItemIfNeeded:animated:", 0, a3);
}

- (void)_scrollToDisplayedItemIfNeeded:(id)a3 animated:(BOOL)a4
{
  void *v4;
  _BOOL8 v5;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  NSObject *v22;
  TransitDirectionsStepsListDataSource *v23;
  TransitDirectionsStepsListDataSource *v24;
  objc_class *v25;
  NSString *v26;
  void *v27;
  void *v28;
  void *v29;
  __CFString *v30;
  void *v31;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  id v36;
  NSObject *v37;
  TransitDirectionsStepsListDataSource *v38;
  TransitDirectionsStepsListDataSource *v39;
  objc_class *v40;
  NSString *v41;
  void *v42;
  void *v43;
  void *v44;
  __CFString *v45;
  double MinY;
  double v47;
  void *v48;
  uint8_t buf[4];
  __CFString *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  void *v54;
  CGRect v55;
  CGRect v56;

  v5 = a4;
  v7 = a3;
  if (-[TransitDirectionsStepsListDataSource automaticallyScrollToDisplayedStep](self, "automaticallyScrollToDisplayedStep"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _scrollView](self, "_scrollView"));
    v9 = v8;
    if (!v8)
      goto LABEL_43;
    objc_msgSend(v8, "bounds");
    if (vabdd_f64(0.0, v10) <= 2.22044605e-16)
      goto LABEL_43;
    objc_msgSend(v9, "contentSize");
    if (vabdd_f64(0.0, v11) <= 2.22044605e-16)
      goto LABEL_43;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
    if (v12)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
      if ((uint64_t)objc_msgSend(v4, "numberOfSections") >= 1)
      {

LABEL_43:
        goto LABEL_44;
      }
    }
    v13 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
    if (v13)
    {
      v14 = (void *)v13;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
      v16 = objc_msgSend(v15, "numberOfSections");

      if (v12)
      {

      }
      if ((uint64_t)v16 > 0)
        goto LABEL_43;
    }
    else if (v12)
    {

    }
    if (v7
      || (v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexPath](self, "displayedItemIndexPath"))) == 0)
    {
      v17 = objc_msgSend(v7, "section");
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexPath](self, "displayedItemIndexPath"));
      v19 = objc_msgSend(v18, "section");

      if (v17 == v19)
        goto LABEL_43;
    }
    else
    {

    }
    v21 = sub_100ADE540();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
LABEL_30:

      -[TransitDirectionsStepsListDataSource frameOfDisplayedComposedRouteStepCell](self, "frameOfDisplayedComposedRouteStepCell");
      x = v55.origin.x;
      y = v55.origin.y;
      width = v55.size.width;
      height = v55.size.height;
      if (!CGRectIsNull(v55))
      {
        v56.origin.x = x;
        v56.origin.y = y;
        v56.size.width = width;
        v56.size.height = height;
        MinY = CGRectGetMinY(v56);
        objc_msgSend(v9, "contentInset");
        objc_msgSend(v9, "setContentOffset:animated:", v5, 0.0, MinY - v47);
        goto LABEL_43;
      }
      v36 = sub_100ADE540();
      v37 = objc_claimAutoreleasedReturnValue(v36);
      if (!os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
      {
LABEL_42:

        goto LABEL_43;
      }
      v38 = self;
      v39 = v38;
      if (!v38)
      {
        v45 = CFSTR("<nil>");
        goto LABEL_41;
      }
      v40 = (objc_class *)objc_opt_class(v38);
      v41 = NSStringFromClass(v40);
      v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
      if ((objc_opt_respondsToSelector(v39, "accessibilityIdentifier") & 1) != 0)
      {
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v39, "performSelector:", "accessibilityIdentifier"));
        v44 = v43;
        if (v43 && !objc_msgSend(v43, "isEqualToString:", v42))
        {
          v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v42, v39, v44));

          goto LABEL_38;
        }

      }
      v45 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v42, v39));
LABEL_38:

LABEL_41:
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexPath](v39, "displayedItemIndexPath"));
      *(_DWORD *)buf = 138543618;
      v50 = v45;
      v51 = 2114;
      v52 = v48;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "[%{public}@] Couldn't scroll to displayed step: %{public}@ (invalid frame)", buf, 0x16u);

      goto LABEL_42;
    }
    v23 = self;
    v24 = v23;
    if (!v23)
    {
      v30 = CFSTR("<nil>");
      goto LABEL_29;
    }
    v25 = (objc_class *)objc_opt_class(v23);
    v26 = NSStringFromClass(v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    if ((objc_opt_respondsToSelector(v24, "accessibilityIdentifier") & 1) != 0)
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v24, "performSelector:", "accessibilityIdentifier"));
      v29 = v28;
      if (v28 && !objc_msgSend(v28, "isEqualToString:", v27))
      {
        v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v27, v24, v29));

        goto LABEL_27;
      }

    }
    v30 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v27, v24));
LABEL_27:

LABEL_29:
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexPath](v24, "displayedItemIndexPath"));
    *(_DWORD *)buf = 138543874;
    v50 = v30;
    v51 = 2112;
    v52 = v7;
    v53 = 2112;
    v54 = v31;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "[%{public}@] Scrolling to updated displayed index path (previous: %@, updated: %@)", buf, 0x20u);

    goto LABEL_30;
  }
LABEL_44:

}

- (BOOL)_supportsFooterItem
{
  void *v3;
  BOOL v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
    v4 = v5 != 0;

  }
  return v4;
}

- (id)listItemForIndexPath:(id)a3
{
  id v4;
  unint64_t v5;
  __CFString *v6;
  void *v7;

  v4 = a3;
  if (v4)
  {
    v5 = -[TransitDirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections");
    if (-[TransitDirectionsStepsListDataSource _supportsFooterItem](self, "_supportsFooterItem")
      && (-[TransitDirectionsStepsListDataSource options](self, "options") & 8) != 0
      && (id)(v5 - 1) == objc_msgSend(v4, "section"))
    {
      v6 = CFSTR("TransitDirectionsListSharingIdentifier");
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "itemAtIndexPath:", v4));

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)_numberOfSections
{
  void *v3;
  char *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  v4 = (char *)objc_msgSend(v3, "numberOfSections");

  if (-[TransitDirectionsStepsListDataSource _supportsFooterItem](self, "_supportsFooterItem"))
    v4 += (-[TransitDirectionsStepsListDataSource options](self, "options") >> 3) & 1;
  return (unint64_t)v4;
}

- (unint64_t)_numberOfRowsInSection:(unint64_t)a3
{
  unint64_t v5;
  void *v7;
  id v8;

  v5 = -[TransitDirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections");
  if (-[TransitDirectionsStepsListDataSource _supportsFooterItem](self, "_supportsFooterItem")
    && (-[TransitDirectionsStepsListDataSource options](self, "options") & 8) != 0
    && v5 - 1 == a3)
  {
    return 1;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  v8 = objc_msgSend(v7, "numberOfItemsInSection:", a3);

  return (unint64_t)v8;
}

- (id)_flatIndexFromIndexPath:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  char *v7;
  char *i;
  id v9;
  void *v10;

  v4 = a3;
  if (-[TransitDirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection"))
  {
    v5 = (char *)objc_msgSend(v4, "row");
    v6 = (char *)objc_msgSend(v4, "section");
    if (v6)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        v5 = &v5[-[TransitDirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", i)];
    }
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v5, 0));
  }
  else
  {
    v9 = v4;
  }
  v10 = v9;

  return v10;
}

- (id)_indexPathFromFlatIndexPath:(id)a3
{
  id v4;
  char *v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  if (!-[TransitDirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection"))
  {
    v11 = v4;
LABEL_9:
    v10 = v11;
    goto LABEL_10;
  }
  v5 = (char *)objc_msgSend(v4, "row");
  v6 = -[TransitDirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      v9 = -[TransitDirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", v8);
      if ((unint64_t)v5 < v9)
        break;
      ++v8;
      v5 -= v9;
      if (v7 == v8)
        goto LABEL_6;
    }
    v11 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v5, v8));
    goto LABEL_9;
  }
LABEL_6:
  v10 = 0;
LABEL_10:

  return v10;
}

- (NSArray)transitSegmentSectionRanges
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "segmentRanges"));

  return (NSArray *)v3;
}

- (BOOL)hasIncidentItems
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  v3 = objc_msgSend(v2, "hasIncidentItems");

  return v3;
}

- (void)collapseAllItems
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  TransitDirectionsStepsListDataSource *v7;
  TransitDirectionsStepsListDataSource *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t v29[128];
  uint8_t buf[4];
  __CFString *v31;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  v4 = objc_msgSend(v3, "hasBuiltItems");

  if (!v4)
    return;
  v5 = sub_100ADE540();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_11;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_9;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_9:

LABEL_11:
    *(_DWORD *)buf = 138543362;
    v31 = v14;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Collapse all items", buf, 0xCu);

  }
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "items"));

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v18; i = (char *)i + 1)
      {
        if (*(_QWORD *)v26 != v19)
          objc_enumerationMutation(v16);
        v21 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v21, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsListExpandableItem))objc_msgSend(v21, "setExpanded:", 0);
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v18);
  }

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
  objc_msgSend(v22, "reloadData");

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
  objc_msgSend(v23, "reloadData");

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
  objc_msgSend(v24, "reloadData");

}

- (void)expandAllItems
{
  id v3;
  NSObject *v4;
  TransitDirectionsStepsListDataSource *v5;
  TransitDirectionsStepsListDataSource *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  __CFString *v29;

  v3 = sub_100ADE540();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v29 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] Expand all items", buf, 0xCu);

  }
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "items"));

  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v19, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsListExpandableItem))objc_msgSend(v19, "setExpanded:", 1);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v16);
  }

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
  objc_msgSend(v20, "reloadData");

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
  objc_msgSend(v21, "reloadData");

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
  objc_msgSend(v22, "reloadData");

}

- (void)_refreshItemInstructionStrings
{
  id v3;
  NSObject *v4;
  TransitDirectionsStepsListDataSource *v5;
  TransitDirectionsStepsListDataSource *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint8_t buf[4];
  __CFString *v14;

  v3 = sub_100ADE540();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] refreshItemInstructionStrings", buf, 0xCu);

  }
  -[TransitDirectionsStepsListDataSource _rebuildItems](self, "_rebuildItems");
}

- (void)updateForClusteredLegSelectedRideIndexChange
{
  id v3;
  NSObject *v4;
  TransitDirectionsStepsListDataSource *v5;
  TransitDirectionsStepsListDataSource *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  uint8_t buf[4];
  __CFString *v14;

  v3 = sub_100ADE540();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v14 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] updateForClusteredLegSelectedRideIndexChanage", buf, 0xCu);

  }
  -[TransitDirectionsStepsListDataSource _rebuildItems](self, "_rebuildItems");
}

- (void)_rebuildItems
{
  id v3;
  NSObject *v4;
  TransitDirectionsStepsListDataSource *v5;
  TransitDirectionsStepsListDataSource *v6;
  objc_class *v7;
  NSString *v8;
  void *v9;
  void *v10;
  void *v11;
  __CFString *v12;
  void *v13;
  void *v14;
  uint8_t buf[4];
  __CFString *v16;

  v3 = sub_100ADE540();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    v5 = self;
    v6 = v5;
    if (!v5)
    {
      v12 = CFSTR("<nil>");
      goto LABEL_10;
    }
    v7 = (objc_class *)objc_opt_class(v5);
    v8 = NSStringFromClass(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    if ((objc_opt_respondsToSelector(v6, "accessibilityIdentifier") & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v6, "performSelector:", "accessibilityIdentifier"));
      v11 = v10;
      if (v10 && !objc_msgSend(v10, "isEqualToString:", v9))
      {
        v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v9, v6, v11));

        goto LABEL_8;
      }

    }
    v12 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v9, v6));
LABEL_8:

LABEL_10:
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}@] rebuildItems", buf, 0xCu);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _expandedItemsIndices](self, "_expandedItemsIndices"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  objc_msgSend(v14, "forceRebuild");

  -[TransitDirectionsStepsListDataSource _expandItemsAtIndices:](self, "_expandItemsAtIndices:", v13);
}

- (id)_expandedItemsIndices
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *i;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableIndexSet indexSet](NSMutableIndexSet, "indexSet"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "items"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v5);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsListExpandableItem)&& objc_msgSend(v11, "expanded"))
        {
          objc_msgSend(v3, "addIndex:", (char *)i + v8);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      v8 += (uint64_t)i;
    }
    while (v7);
  }

  return v3;
}

- (void)_expandItemsAtIndices:(id)a3
{
  _QWORD v3[5];

  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_100AE1A54;
  v3[3] = &unk_1011B1E88;
  v3[4] = self;
  objc_msgSend(a3, "enumerateIndexesUsingBlock:", v3);
}

- (void)transitItemReferenceDateUpdater:(id)a3 didUpdateToReferenceDate:(id)a4
{
  -[TransitDirectionsStepsListDataSource _reloadVisibleCells](self, "_reloadVisibleCells", a3, a4);
}

- (void)composedRoute:(id)a3 changedSelectedRideInClusteredSegment:(id)a4 fromIndex:(unint64_t)a5 toIndex:(unint64_t)a6
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD *v13;
  const char *label;
  const char *v15;
  void *v16;
  _QWORD v17[2];
  void (*v18)(uint64_t);
  void *v19;
  TransitDirectionsStepsListDataSource *v20;
  id v21;
  id v22;
  id location;

  v8 = a3;
  v9 = a4;
  objc_initWeak(&location, self);
  v10 = &_dispatch_main_q;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v18 = sub_100AE1CAC;
  v19 = &unk_1011AFF10;
  objc_copyWeak(&v22, &location);
  v20 = self;
  v11 = v9;
  v21 = v11;
  v12 = &_dispatch_main_q;
  v13 = v17;
  label = dispatch_queue_get_label((dispatch_queue_t)&_dispatch_main_q);
  v15 = dispatch_queue_get_label(0);
  if (label == v15 || label && v15 && !strcmp(label, v15))
  {
    v16 = objc_autoreleasePoolPush();
    v18((uint64_t)v13);
    objc_autoreleasePoolPop(v16);
  }
  else
  {
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, v13);
  }

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

}

- (void)composedRoute:(id)a3 appliedTransitRouteUpdates:(id)a4
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100AE1D44;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (BOOL)_useNavigationMetrics
{
  return self->_navigationProvider != 0;
}

- (void)setEnableNavigationUpdates:(BOOL)a3
{
  DirectionsStepsListNavigationProvider *v4;
  DirectionsStepsListNavigationProvider *navigationProvider;
  DirectionsStepsListNavigationProvider *v6;
  _BOOL8 v7;
  void *v8;
  DirectionsStepsListNavigationProvider *v9;
  TransitDirectionsStepsListDataProvider *v10;
  TransitDirectionsStepsListDataProvider *dataProvider;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  int v17;
  const char *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  __int16 v23;
  const char *v24;

  if (self->_enableNavigationUpdates != a3)
  {
    self->_enableNavigationUpdates = a3;
    if (a3)
    {
      v4 = -[DirectionsStepsListNavigationProvider initWithDelegate:]([DirectionsStepsListNavigationProvider alloc], "initWithDelegate:", self);
      navigationProvider = self->_navigationProvider;
      self->_navigationProvider = v4;

      v6 = self->_navigationProvider;
      v7 = -[DirectionsStepsListNavigationProvider isNavigating](v6, "isNavigating");
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListNavigationProvider route](self->_navigationProvider, "route"));
      -[TransitDirectionsStepsListDataSource navigationProvider:didChangeToNavigating:withRoute:](self, "navigationProvider:didChangeToNavigating:withRoute:", v6, v7, v8);

    }
    else
    {
      v9 = self->_navigationProvider;
      self->_navigationProvider = 0;

      if (!self->_route)
      {
        v12 = sub_1004318FC();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
        {
          v17 = 136315906;
          v18 = "-[TransitDirectionsStepsListDataSource setEnableNavigationUpdates:]";
          v19 = 2080;
          v20 = "TransitDirectionsStepsListDataSource.m";
          v21 = 1024;
          v22 = 865;
          v23 = 2080;
          v24 = "_route != nil";
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v17, 0x26u);
        }

        if (sub_100A70734())
        {
          v14 = sub_1004318FC();
          v15 = objc_claimAutoreleasedReturnValue(v14);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
            v17 = 138412290;
            v18 = v16;
            _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v17, 0xCu);

          }
        }
      }
      v10 = (TransitDirectionsStepsListDataProvider *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute transitDirectionsStepsListDataProvider](self->_route, "transitDirectionsStepsListDataProvider"));
      dataProvider = self->_dataProvider;
      self->_dataProvider = v10;

      -[TransitDirectionsStepsListDataSource setActiveComposedRouteStepIndex:](self, "setActiveComposedRouteStepIndex:", 0x7FFFFFFFFFFFFFFFLL);
      -[TransitDirectionsStepsListDataSource setDisplayedComposedRouteStepIndex:](self, "setDisplayedComposedRouteStepIndex:", 0x7FFFFFFFFFFFFFFFLL);
    }
    -[TransitDirectionsStepsListDataSource _reloadListViewForRouteChange](self, "_reloadListViewForRouteChange");
  }
}

- (void)navigationProvider:(id)a3 didChangeToNavigating:(BOOL)a4 withRoute:(id)a5
{
  if (a4)
    -[TransitDirectionsStepsListDataSource navigationProvider:didUpdateRoute:](self, "navigationProvider:didUpdateRoute:", a3, a5);
}

- (void)navigationProvider:(id)a3 didUpdateRoute:(id)a4
{
  id v6;

  v6 = a3;
  -[TransitDirectionsStepsListDataSource setRoute:](self, "setRoute:", a4);
  -[TransitDirectionsStepsListDataSource navigationProvider:didUpdateActiveStepIndex:](self, "navigationProvider:didUpdateActiveStepIndex:", v6, objc_msgSend(v6, "activeStepIndex"));
  -[TransitDirectionsStepsListDataSource navigationProvider:didUpdateDisplayedStepIndex:](self, "navigationProvider:didUpdateDisplayedStepIndex:", v6, objc_msgSend(v6, "displayedStepIndex"));

}

- (void)navigationProvider:(id)a3 didUpdateActiveStepIndex:(unint64_t)a4
{
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  TransitDirectionsStepsListDataSource *v10;
  TransitDirectionsStepsListDataSource *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  unint64_t activeComposedRouteStepIndex;
  void *v19;
  id v20;
  NSObject *v21;
  TransitDirectionsStepsListDataSource *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  id v29;
  NSObject *v30;
  TransitDirectionsStepsListDataSource *v31;
  TransitDirectionsStepsListDataSource *v32;
  objc_class *v33;
  NSString *v34;
  void *v35;
  void *v36;
  void *v37;
  __CFString *v38;
  uint8_t buf[4];
  __CFString *v40;
  __int16 v41;
  unint64_t v42;
  __int16 v43;
  id v44;
  __int16 v45;
  id v46;

  v6 = a3;
  v7 = v6;
  if (a4 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = sub_100ADE540();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
LABEL_30:

      goto LABEL_36;
    }
    v10 = self;
    v11 = v10;
    if (!v10)
    {
      v17 = CFSTR("<nil>");
      goto LABEL_29;
    }
    v12 = (objc_class *)objc_opt_class(v10);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    if ((objc_opt_respondsToSelector(v11, "accessibilityIdentifier") & 1) != 0)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v11, "performSelector:", "accessibilityIdentifier"));
      v16 = v15;
      if (v15 && !objc_msgSend(v15, "isEqualToString:", v14))
      {
        v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v14, v11, v16));

        goto LABEL_9;
      }

    }
    v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v14, v11));
LABEL_9:

LABEL_29:
    *(_DWORD *)buf = 138543362;
    v40 = v17;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%{public}@] Auto-advance step index is NSNotFound, meaning no matched step. Ignore it and maintain what we have.", buf, 0xCu);

    goto LABEL_30;
  }
  if (objc_msgSend(v6, "displayedStepIndex") != (id)0x7FFFFFFFFFFFFFFFLL
    && (unint64_t)objc_msgSend(v7, "displayedStepIndex") <= a4)
  {
    v29 = sub_100ADE540();
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
LABEL_35:

      self->_activeComposedRouteStepIndex = a4;
      objc_msgSend(v7, "setDisplayedStepIndex:", 0x7FFFFFFFFFFFFFFFLL);
      goto LABEL_36;
    }
    v31 = self;
    v32 = v31;
    if (!v31)
    {
      v38 = CFSTR("<nil>");
      goto LABEL_34;
    }
    v33 = (objc_class *)objc_opt_class(v31);
    v34 = NSStringFromClass(v33);
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    if ((objc_opt_respondsToSelector(v32, "accessibilityIdentifier") & 1) != 0)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v32, "performSelector:", "accessibilityIdentifier"));
      v37 = v36;
      if (v36 && !objc_msgSend(v36, "isEqualToString:", v35))
      {
        v38 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v35, v32, v37));

        goto LABEL_27;
      }

    }
    v38 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v35, v32));
LABEL_27:

LABEL_34:
    *(_DWORD *)buf = 138543874;
    v40 = v38;
    v41 = 2048;
    v42 = a4;
    v43 = 2048;
    v44 = objc_msgSend(v7, "displayedStepIndex");
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "[%{public}@] Auto-advance step index %lu has caught up to manually-selected step index %lu", buf, 0x20u);

    goto LABEL_35;
  }
  activeComposedRouteStepIndex = self->_activeComposedRouteStepIndex;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexPath](self, "displayedItemIndexPath"));
  v20 = sub_100ADE540();
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = self;
    v23 = (objc_class *)objc_opt_class(v22);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
      v27 = v26;
      if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
      {
        v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

        goto LABEL_18;
      }

    }
    v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_18:

    *(_DWORD *)buf = 138544130;
    v40 = v28;
    v41 = 2048;
    v42 = a4;
    v43 = 2048;
    v44 = (id)activeComposedRouteStepIndex;
    v45 = 2048;
    v46 = objc_msgSend(v7, "displayedStepIndex");
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}@] Auto-advanced to step index %lu (previous: %lu, displayedStepIndex: %lu)", buf, 0x2Au);

  }
  -[TransitDirectionsStepsListDataSource setActiveComposedRouteStepIndex:](self, "setActiveComposedRouteStepIndex:", a4);
  -[TransitDirectionsStepsListDataSource _scrollToDisplayedItemIfNeeded:animated:](self, "_scrollToDisplayedItemIfNeeded:animated:", v19, 1);

LABEL_36:
}

- (void)navigationProvider:(id)a3 didUpdateDisplayedStepIndex:(unint64_t)a4
{
  NSIndexPath *v6;
  id v7;
  NSObject *v8;
  TransitDirectionsStepsListDataSource *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t displayedComposedRouteStepIndex;
  unint64_t activeComposedRouteStepIndex;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;

  v6 = self->_displayedItemIndexPath;
  v7 = sub_100ADE540();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = self;
    v10 = (objc_class *)objc_opt_class(v9);
    v11 = NSStringFromClass(v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
      v14 = v13;
      if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

        goto LABEL_7;
      }

    }
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_7:

    activeComposedRouteStepIndex = v9->_activeComposedRouteStepIndex;
    displayedComposedRouteStepIndex = v9->_displayedComposedRouteStepIndex;
    *(_DWORD *)buf = 138544130;
    v19 = v15;
    v20 = 2048;
    v21 = a4;
    v22 = 2048;
    v23 = displayedComposedRouteStepIndex;
    v24 = 2048;
    v25 = activeComposedRouteStepIndex;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Displayed step index did change to %lu (previous: %lu, activeStepIndex: %lu)", buf, 0x2Au);

  }
  -[TransitDirectionsStepsListDataSource setDisplayedComposedRouteStepIndex:](self, "setDisplayedComposedRouteStepIndex:", a4);
  -[TransitDirectionsStepsListDataSource _scrollToDisplayedItemIfNeeded:animated:](self, "_scrollToDisplayedItemIfNeeded:animated:", v6, 1);

}

- (void)navigationProvider:(id)a3 didUpdateMatchedLocation:(id)a4
{
  -[TransitDirectionsStepsListDataSource setMatchedLocation:](self, "setMatchedLocation:", a4);
}

- (void)navigationProvider:(id)a3 didReceiveRealtimeUpdates:(id)a4
{
  id v5;
  void *v6;

  v5 = a4;
  +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("MapsTestingTransitRouteUpdateWillUpdateRoute"), 0, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource route](self, "route"));
  objc_msgSend(v6, "applyUpdatesToTransitRoute:", v5);

  +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("MapsTestingTransitRouteUpdateDidUpdateRoute"), 0, 0);
}

- (void)setActiveComposedRouteStepIndex:(unint64_t)a3
{
  unint64_t activeComposedRouteStepIndex;
  id v6;
  NSObject *v7;
  NSObject *v8;
  TransitDirectionsStepsListDataSource *v9;
  objc_class *v10;
  NSString *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  TransitDirectionsStepsListDataSource *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  unint64_t v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;

  activeComposedRouteStepIndex = self->_activeComposedRouteStepIndex;
  if (activeComposedRouteStepIndex != a3)
  {
    v6 = sub_100ADE540();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = v7;
    if (a3 == 0x7FFFFFFFFFFFFFFFLL && activeComposedRouteStepIndex != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
      {
LABEL_11:

        return;
      }
      v9 = self;
      v10 = (objc_class *)objc_opt_class(v9);
      v11 = NSStringFromClass(v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      if ((objc_opt_respondsToSelector(v9, "accessibilityIdentifier") & 1) != 0)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v9, "performSelector:", "accessibilityIdentifier"));
        v14 = v13;
        if (v13 && !objc_msgSend(v13, "isEqualToString:", v12))
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v12, v9, v14));

          goto LABEL_10;
        }

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v12, v9));
LABEL_10:

      *(_DWORD *)buf = 138543362;
      v25 = v15;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_FAULT, "[%{public}@] Suppressing attempt to set matched step index to NSNotFound", buf, 0xCu);

      goto LABEL_11;
    }
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    v16 = self;
    v17 = (objc_class *)objc_opt_class(v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

        goto LABEL_18;
      }

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_18:

    v23 = self->_activeComposedRouteStepIndex;
    *(_DWORD *)buf = 138543874;
    v25 = v22;
    v26 = 2048;
    v27 = v23;
    v28 = 2048;
    v29 = a3;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%{public}@] Active step index changed from %lu to %lu", buf, 0x20u);

LABEL_19:
    self->_activeComposedRouteStepIndex = a3;
    -[TransitDirectionsStepsListDataSource _refreshActiveItemIndexPath](self, "_refreshActiveItemIndexPath");
    -[TransitDirectionsStepsListDataSource _refreshDisplayedItemIndexPath](self, "_refreshDisplayedItemIndexPath");
  }
}

- (NSIndexPath)activeItemIndexPath
{
  NSIndexPath *activeItemIndexPath;

  activeItemIndexPath = self->_activeItemIndexPath;
  if (!activeItemIndexPath)
  {
    -[TransitDirectionsStepsListDataSource _refreshActiveItemIndexPath](self, "_refreshActiveItemIndexPath");
    activeItemIndexPath = self->_activeItemIndexPath;
  }
  return activeItemIndexPath;
}

- (void)_refreshActiveItemIndexPath
{
  NSIndexPath *v3;
  unint64_t activeComposedRouteStepIndex;
  NSIndexPath *v5;
  id v6;
  NSObject *v7;
  TransitDirectionsStepsListDataSource *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  id v15;
  TransitDirectionsStepsListDataSource *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  char *v22;
  id v23;
  id v24;
  TransitDirectionsStepsListDataSource *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  char *v31;
  NSIndexPath *activeItemIndexPath;
  unint64_t v33;
  id v34;
  unsigned __int8 v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  NSObject *v40;
  char *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  _BYTE v47[14];
  __int16 v48;
  void *v49;

  v3 = self->_activeItemIndexPath;
  if (!self->_navigationProvider)
  {
    v24 = sub_100ADE540();
    v7 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_26;
    v25 = self;
    v26 = (objc_class *)objc_opt_class(v25);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
      v30 = v29;
      if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
      {
        v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

        goto LABEL_25;
      }

    }
    v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_25:

    *(_DWORD *)buf = 138543362;
    v43 = v31;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] Not navigating, clearing active step index path", buf, 0xCu);

    goto LABEL_26;
  }
  activeComposedRouteStepIndex = self->_activeComposedRouteStepIndex;
  if (activeComposedRouteStepIndex == 0x7FFFFFFFFFFFFFFFLL
    || activeComposedRouteStepIndex >= (unint64_t)-[GEOComposedRoute stepsCount](self->_route, "stepsCount"))
  {
    v15 = sub_100ADE540();
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_26:
      v5 = 0;
      goto LABEL_27;
    }
    v16 = self;
    v17 = (objc_class *)objc_opt_class(v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

        goto LABEL_18;
      }

    }
    v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_18:

    v23 = -[GEOComposedRoute stepsCount](v16->_route, "stepsCount");
    *(_DWORD *)buf = 138543874;
    v43 = v22;
    v44 = 2048;
    v45 = (const char *)activeComposedRouteStepIndex;
    v46 = 2048;
    *(_QWORD *)v47 = v23;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Active step index %lu is out of bounds %lu", buf, 0x20u);

    goto LABEL_26;
  }
  v5 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _itemIndexPathForStepIndex:](self, "_itemIndexPathForStepIndex:", activeComposedRouteStepIndex));
  if (!v5)
  {
    v36 = sub_1004318FC();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No indexPath found for active step with index %lu"), activeComposedRouteStepIndex));
      *(_DWORD *)buf = 136316162;
      v43 = "-[TransitDirectionsStepsListDataSource _refreshActiveItemIndexPath]";
      v44 = 2080;
      v45 = "TransitDirectionsStepsListDataSource.m";
      v46 = 1024;
      *(_DWORD *)v47 = 981;
      *(_WORD *)&v47[4] = 2080;
      *(_QWORD *)&v47[6] = "indexPath != nil";
      v48 = 2112;
      v49 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

    }
    if (sub_100A70734())
    {
      v39 = sub_1004318FC();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v43 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v6 = sub_100ADE540();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_11;
      }

    }
    v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_11:

    *(_DWORD *)buf = 138543874;
    v43 = v14;
    v44 = 2048;
    v45 = (const char *)activeComposedRouteStepIndex;
    v46 = 2112;
    *(_QWORD *)v47 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Active stepIndex %lu corresponds to indexPath: %@", buf, 0x20u);

  }
LABEL_27:

  activeItemIndexPath = self->_activeItemIndexPath;
  self->_activeItemIndexPath = v5;

  v33 = self->_activeItemIndexPath;
  v34 = v3;
  if ((unint64_t)v34 | v33)
  {
    v35 = objc_msgSend((id)v33, "isEqual:", v34);

    if ((v35 & 1) == 0)
    {
      -[TransitDirectionsStepsListDataSource _updateActiveItemInListViewIfNeeded](self, "_updateActiveItemInListViewIfNeeded");
      -[TransitDirectionsStepsListDataSource _notifyDelegateOfUpdatedActiveStep](self, "_notifyDelegateOfUpdatedActiveStep");
    }
  }

}

- (void)setDisplayedComposedRouteStepIndex:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  TransitDirectionsStepsListDataSource *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t displayedComposedRouteStepIndex;
  id v15;
  NSObject *v16;
  TransitDirectionsStepsListDataSource *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  uint8_t buf[4];
  void *v25;
  __int16 v26;
  unint64_t v27;
  __int16 v28;
  unint64_t v29;

  if (self->_displayedComposedRouteStepIndex != a3)
  {
    if (!-[TransitDirectionsStepsListDataSource enableNavigationUpdates](self, "enableNavigationUpdates")
      || -[DirectionsStepsListNavigationProvider displayedStepIndex](self->_navigationProvider, "displayedStepIndex") == a3)
    {
      v5 = sub_100ADE540();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
LABEL_11:

        self->_displayedComposedRouteStepIndex = a3;
        -[TransitDirectionsStepsListDataSource _refreshDisplayedItemIndexPath](self, "_refreshDisplayedItemIndexPath");
        return;
      }
      v7 = self;
      v8 = (objc_class *)objc_opt_class(v7);
      v9 = NSStringFromClass(v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
      if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
        v12 = v11;
        if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

          goto LABEL_10;
        }

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_10:

      displayedComposedRouteStepIndex = self->_displayedComposedRouteStepIndex;
      *(_DWORD *)buf = 138543874;
      v25 = v13;
      v26 = 2048;
      v27 = displayedComposedRouteStepIndex;
      v28 = 2048;
      v29 = a3;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Displayed step index changed from %lu to %lu", buf, 0x20u);

      goto LABEL_11;
    }
    v15 = sub_100ADE540();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      goto LABEL_19;
    v17 = self;
    v18 = (objc_class *)objc_opt_class(v17);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_18;
      }

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_18:

    *(_DWORD *)buf = 138543618;
    v25 = v23;
    v26 = 2048;
    v27 = a3;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}@] Updating navigation provider with updated displayed step index %lu", buf, 0x16u);

LABEL_19:
    -[DirectionsStepsListNavigationProvider setDisplayedStepIndex:](self->_navigationProvider, "setDisplayedStepIndex:", a3);
  }
}

- (id)displayedTransitDirectionsListItemIndexPath
{
  NSIndexPath *displayedItemIndexPath;

  displayedItemIndexPath = self->_displayedItemIndexPath;
  if (!displayedItemIndexPath)
  {
    -[TransitDirectionsStepsListDataSource _refreshDisplayedItemIndexPath](self, "_refreshDisplayedItemIndexPath");
    displayedItemIndexPath = self->_displayedItemIndexPath;
  }
  return displayedItemIndexPath;
}

- (void)_refreshDisplayedItemIndexPath
{
  NSIndexPath *v3;
  unint64_t displayedComposedRouteStepIndex;
  NSIndexPath *v5;
  id v6;
  NSObject *v7;
  TransitDirectionsStepsListDataSource *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  id v15;
  TransitDirectionsStepsListDataSource *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  void *v20;
  void *v21;
  char *v22;
  id v23;
  id v24;
  TransitDirectionsStepsListDataSource *v25;
  objc_class *v26;
  NSString *v27;
  void *v28;
  void *v29;
  void *v30;
  char *v31;
  NSIndexPath *displayedItemIndexPath;
  unint64_t v33;
  id v34;
  unsigned __int8 v35;
  id v36;
  NSObject *v37;
  void *v38;
  id v39;
  NSObject *v40;
  char *v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  const char *v45;
  __int16 v46;
  _BYTE v47[14];
  __int16 v48;
  void *v49;

  v3 = self->_displayedItemIndexPath;
  displayedComposedRouteStepIndex = self->_displayedComposedRouteStepIndex;
  if (displayedComposedRouteStepIndex == 0x7FFFFFFFFFFFFFFFLL)
    displayedComposedRouteStepIndex = self->_activeComposedRouteStepIndex;
  if (!self->_navigationProvider)
  {
    v24 = sub_100ADE540();
    v7 = objc_claimAutoreleasedReturnValue(v24);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      goto LABEL_28;
    v25 = self;
    v26 = (objc_class *)objc_opt_class(v25);
    v27 = NSStringFromClass(v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    if ((objc_opt_respondsToSelector(v25, "accessibilityIdentifier") & 1) != 0)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v25, "performSelector:", "accessibilityIdentifier"));
      v30 = v29;
      if (v29 && !objc_msgSend(v29, "isEqualToString:", v28))
      {
        v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v28, v25, v30));

        goto LABEL_27;
      }

    }
    v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v28, v25));
LABEL_27:

    *(_DWORD *)buf = 138543362;
    v43 = v31;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "[%{public}@] Not navigating, clearing displayed step index path", buf, 0xCu);

    goto LABEL_28;
  }
  if (displayedComposedRouteStepIndex == 0x7FFFFFFFFFFFFFFFLL
    || displayedComposedRouteStepIndex >= (unint64_t)-[GEOComposedRoute stepsCount](self->_route, "stepsCount"))
  {
    v15 = sub_100ADE540();
    v7 = objc_claimAutoreleasedReturnValue(v15);
    if (!os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
LABEL_28:
      v5 = 0;
      goto LABEL_29;
    }
    v16 = self;
    v17 = (objc_class *)objc_opt_class(v16);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    if ((objc_opt_respondsToSelector(v16, "accessibilityIdentifier") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v16, "performSelector:", "accessibilityIdentifier"));
      v21 = v20;
      if (v20 && !objc_msgSend(v20, "isEqualToString:", v19))
      {
        v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v19, v16, v21));

        goto LABEL_20;
      }

    }
    v22 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v19, v16));
LABEL_20:

    v23 = -[GEOComposedRoute stepsCount](v16->_route, "stepsCount");
    *(_DWORD *)buf = 138543874;
    v43 = v22;
    v44 = 2048;
    v45 = (const char *)displayedComposedRouteStepIndex;
    v46 = 2048;
    *(_QWORD *)v47 = v23;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] Displayed step index %lu is out of bounds %lu", buf, 0x20u);

    goto LABEL_28;
  }
  v5 = (NSIndexPath *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _itemIndexPathForStepIndex:](self, "_itemIndexPathForStepIndex:", displayedComposedRouteStepIndex));
  if (!v5)
  {
    v36 = sub_1004318FC();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No indexPath found for displayed step with index %lu"), displayedComposedRouteStepIndex));
      *(_DWORD *)buf = 136316162;
      v43 = "-[TransitDirectionsStepsListDataSource _refreshDisplayedItemIndexPath]";
      v44 = 2080;
      v45 = "TransitDirectionsStepsListDataSource.m";
      v46 = 1024;
      *(_DWORD *)v47 = 1040;
      *(_WORD *)&v47[4] = 2080;
      *(_QWORD *)&v47[6] = "indexPath != nil";
      v48 = 2112;
      v49 = v38;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

    }
    if (sub_100A70734())
    {
      v39 = sub_1004318FC();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
      {
        v41 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v43 = v41;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v6 = sub_100ADE540();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = self;
    v9 = (objc_class *)objc_opt_class(v8);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_13;
      }

    }
    v14 = (char *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_13:

    *(_DWORD *)buf = 138543874;
    v43 = v14;
    v44 = 2048;
    v45 = (const char *)displayedComposedRouteStepIndex;
    v46 = 2112;
    *(_QWORD *)v47 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%{public}@] displayed stepIndex %lu corresponds to indexPath: %@", buf, 0x20u);

  }
LABEL_29:

  displayedItemIndexPath = self->_displayedItemIndexPath;
  self->_displayedItemIndexPath = v5;

  v33 = self->_displayedItemIndexPath;
  v34 = v3;
  if ((unint64_t)v34 | v33)
  {
    v35 = objc_msgSend((id)v33, "isEqual:", v34);

    if ((v35 & 1) == 0)
    {
      -[TransitDirectionsStepsListDataSource _updateActiveItemInListViewIfNeeded](self, "_updateActiveItemInListViewIfNeeded");
      -[TransitDirectionsStepsListDataSource _updateDisplayStyleInVisibleCells](self, "_updateDisplayStyleInVisibleCells");
      -[TransitDirectionsStepsListDataSource _notifyDelegateOfUpdatedDisplayedStep](self, "_notifyDelegateOfUpdatedDisplayedStep");
    }
  }

}

- (id)_itemIndexPathForStepIndex:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  _UNKNOWN **v8;
  void **p_cache;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  id v24;
  NSObject *v25;
  id v26;
  NSObject *v27;
  char *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  const char *v39;
  __int16 v40;
  int v41;
  _BYTE v42[128];

  if (a3 != 0x7FFFFFFFFFFFFFFFLL && (unint64_t)-[GEOComposedRoute stepsCount](self->_route, "stepsCount") > a3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
    v6 = (uint64_t)objc_msgSend(v5, "numberOfSections");

    if (v6 >= 1)
    {
      v7 = 0;
      v8 = MKPlaceCollectionsLogicController_ptr;
      p_cache = VenuesManager.cache;
      v29 = v6;
      do
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
        v11 = (uint64_t)objc_msgSend(v10, "numberOfItemsInSection:includingHiddenSubitems:", v7, 1);

        if (v11 >= 1)
        {
          v12 = v11;
          v13 = 0;
          v30 = v11;
          v31 = v7;
          do
          {
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8[341], "indexPathForRow:inSection:", v13, v7));
            v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v14));
            v16 = objc_opt_class(p_cache + 508);
            if ((objc_opt_isKindOfClass(v15, v16) & 1) != 0)
            {
              v17 = v15;
              if (objc_msgSend(v17, "matchingRouteStepIndex") == (id)a3)
              {
LABEL_23:

                return v14;
              }
              v34 = 0u;
              v35 = 0u;
              v32 = 0u;
              v33 = 0u;
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "composedRouteSteps"));
              v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
              if (v19)
              {
                v20 = v19;
                v21 = *(_QWORD *)v33;
                while (2)
                {
                  for (i = 0; i != v20; i = (char *)i + 1)
                  {
                    if (*(_QWORD *)v33 != v21)
                      objc_enumerationMutation(v18);
                    if (objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i), "stepIndex") == (id)a3)
                    {

                      goto LABEL_23;
                    }
                  }
                  v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
                  if (v20)
                    continue;
                  break;
                }
              }

              v6 = v29;
              v12 = v30;
              v7 = v31;
              v8 = MKPlaceCollectionsLogicController_ptr;
              p_cache = (void **)(VenuesManager + 16);
            }

            ++v13;
          }
          while (v13 != v12);
        }
        ++v7;
      }
      while (v7 != v6);
    }
    if (a3)
      return (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _itemIndexPathForStepIndex:](self, "_itemIndexPathForStepIndex:", a3 - 1));
    v24 = sub_1004318FC();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315650;
      v37 = "-[TransitDirectionsStepsListDataSource _itemIndexPathForStepIndex:]";
      v38 = 2080;
      v39 = "TransitDirectionsStepsListDataSource.m";
      v40 = 1024;
      v41 = 1091;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", buf, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v26 = sub_1004318FC();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        v28 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v37 = v28;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }
  v14 = 0;
  return v14;
}

- (CGRect)frameOfDisplayedComposedRouteStepCell
{
  CGFloat y;
  CGFloat x;
  CGFloat width;
  double height;
  _QWORD *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  _QWORD v24[5];
  CGRect result;

  x = CGRectNull.origin.x;
  y = CGRectNull.origin.y;
  width = CGRectNull.size.width;
  height = CGRectNull.size.height;
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100AE3CE8;
  v24[3] = &unk_1011E2110;
  v24[4] = self;
  v7 = objc_retainBlock(v24);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexPath](self, "displayedItemIndexPath"));
  v9 = objc_msgSend(v8, "section");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  v11 = (uint64_t)objc_msgSend(v10, "numberOfItemsInSection:", v9);

  if (v11 < 1)
  {
    v19 = height;
  }
  else
  {
    for (i = 0; i != v11; ++i)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", i, v9));
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _flatIndexFromIndexPath:](self, "_flatIndexFromIndexPath:", v13));
      ((void (*)(_QWORD *, void *))v7[2])(v7, v14);
      v19 = v18;
      if (i)
      {
        v19 = height + CGRectGetHeight(*(CGRect *)&v15);
      }
      else
      {
        width = v17;
        y = v16;
        x = v15;
      }

      height = v19;
    }
  }

  v20 = x;
  v21 = y;
  v22 = width;
  v23 = v19;
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v21;
  result.origin.x = v20;
  return result;
}

- (void)_notifyDelegateOfUpdatedActiveStep
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  TransitDirectionsStepsListDataSource *v7;
  TransitDirectionsStepsListDataSource *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  unint64_t activeComposedRouteStepIndex;
  void *v16;
  id v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  void *v23;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v17, "transitDirectionsStepsListDataSource:didUpdateActiveGuidanceStep:") & 1) == 0)
  {

    return;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource activeItemIndexPath](self, "activeItemIndexPath"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource activeComposedRouteStep](self, "activeComposedRouteStep"));
    if (!v4)
    {
LABEL_16:

      return;
    }
    v5 = sub_100ADE540();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
      objc_msgSend(v16, "transitDirectionsStepsListDataSource:didUpdateActiveGuidanceStep:", self, v4);

      goto LABEL_16;
    }
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_14;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_11;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_11:

LABEL_14:
    activeComposedRouteStepIndex = v8->_activeComposedRouteStepIndex;
    *(_DWORD *)buf = 138543874;
    v19 = v14;
    v20 = 2048;
    v21 = activeComposedRouteStepIndex;
    v22 = 2112;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Notifying delegate of updated ACTIVE (parent) route step for index %lu: %@", buf, 0x20u);

    goto LABEL_15;
  }
}

- (void)_notifyDelegateOfUpdatedDisplayedStep
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  TransitDirectionsStepsListDataSource *v7;
  TransitDirectionsStepsListDataSource *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  __CFString *v14;
  unint64_t displayedComposedRouteStepIndex;
  void *v16;
  id v17;
  uint8_t buf[4];
  __CFString *v19;
  __int16 v20;
  unint64_t v21;
  __int16 v22;
  void *v23;

  v17 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v17, "transitDirectionsStepsListDataSource:didUpdateDisplayedGuidanceStep:") & 1) == 0)
  {

    return;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexPath](self, "displayedItemIndexPath"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedComposedRouteStep](self, "displayedComposedRouteStep"));
    if (!v4)
    {
LABEL_16:

      return;
    }
    v5 = sub_100ADE540();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
LABEL_15:

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
      objc_msgSend(v16, "transitDirectionsStepsListDataSource:didUpdateDisplayedGuidanceStep:", self, v4);

      goto LABEL_16;
    }
    v7 = self;
    v8 = v7;
    if (!v7)
    {
      v14 = CFSTR("<nil>");
      goto LABEL_14;
    }
    v9 = (objc_class *)objc_opt_class(v7);
    v10 = NSStringFromClass(v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    if ((objc_opt_respondsToSelector(v8, "accessibilityIdentifier") & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v8, "performSelector:", "accessibilityIdentifier"));
      v13 = v12;
      if (v12 && !objc_msgSend(v12, "isEqualToString:", v11))
      {
        v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v11, v8, v13));

        goto LABEL_11;
      }

    }
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v11, v8));
LABEL_11:

LABEL_14:
    displayedComposedRouteStepIndex = v8->_displayedComposedRouteStepIndex;
    *(_DWORD *)buf = 138543874;
    v19 = v14;
    v20 = 2048;
    v21 = displayedComposedRouteStepIndex;
    v22 = 2112;
    v23 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%{public}@] Notifying delegate of updated DISPLAYED (parent) route step for index %lu: %@", buf, 0x20u);

    goto LABEL_15;
  }
}

- (id)_activeItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource activeItemIndexPath](self, "activeItemIndexPath"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource activeItemIndexPath](self, "activeItemIndexPath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemAtIndexPath:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentItem"));
    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentItem"));

      v6 = (void *)v8;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (GEOComposedRouteStep)activeComposedRouteStep
{
  void *v3;
  void *v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  char *v12;
  TransitDirectionsStepsListDataSource *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _activeItem](self, "_activeItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matchingRouteStep"));
  if (!v4 && objc_msgSend(v3, "type"))
  {
    v13 = self;
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource activeItemIndexPath](v13, "activeItemIndexPath"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No step found for updated matched index path %@"), v8));
      *(_DWORD *)buf = 136316162;
      v15 = "-[TransitDirectionsStepsListDataSource activeComposedRouteStep]";
      v16 = 2080;
      v17 = "TransitDirectionsStepsListDataSource.m";
      v18 = 1024;
      v19 = 1174;
      v20 = 2080;
      v21 = "step || item.type == TransitDirectionsListItemTypeOrigin";
      v22 = 2112;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

    }
    if (sub_100A70734())
    {
      v10 = sub_1004318FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }

  return (GEOComposedRouteStep *)v4;
}

- (unint64_t)activeItemIndex
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource activeItemIndexPath](self, "activeItemIndexPath"));
  v3 = objc_msgSend(v2, "section");

  return (unint64_t)v3;
}

- (id)_displayedItem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexPath](self, "displayedItemIndexPath"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexPath](self, "displayedItemIndexPath"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemAtIndexPath:", v5));

    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentItem"));
    if (v7)
    {
      v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentItem"));

      v6 = (void *)v8;
    }
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (GEOComposedRouteStep)displayedComposedRouteStep
{
  void *v3;
  void *v4;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  char *v12;
  TransitDirectionsStepsListDataSource *v13;
  uint8_t buf[4];
  const char *v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  int v19;
  __int16 v20;
  const char *v21;
  __int16 v22;
  void *v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _displayedItem](self, "_displayedItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "matchingRouteStep"));
  if (!v4 && objc_msgSend(v3, "type"))
  {
    v13 = self;
    v6 = sub_1004318FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource activeItemIndexPath](v13, "activeItemIndexPath"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("No step found for updated matched index path %@"), v8));
      *(_DWORD *)buf = 136316162;
      v15 = "-[TransitDirectionsStepsListDataSource displayedComposedRouteStep]";
      v16 = 2080;
      v17 = "TransitDirectionsStepsListDataSource.m";
      v18 = 1024;
      v19 = 1200;
      v20 = 2080;
      v21 = "step || item.type == TransitDirectionsListItemTypeOrigin";
      v22 = 2112;
      v23 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s) '%@'", buf, 0x30u);

    }
    if (sub_100A70734())
    {
      v10 = sub_1004318FC();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v12 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        *(_DWORD *)buf = 138412290;
        v15 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

      }
    }
  }

  return (GEOComposedRouteStep *)v4;
}

- (unint64_t)displayedItemIndex
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexPath](self, "displayedItemIndexPath"));
  v3 = objc_msgSend(v2, "section");

  return (unint64_t)v3;
}

- (unint64_t)indexOfItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "indexPathForItem:", v4));

  v7 = objc_msgSend(v6, "section");
  return (unint64_t)v7;
}

- (id)displayedItemIndexForAnalytics
{
  unint64_t v2;

  v2 = -[TransitDirectionsStepsListDataSource displayedItemIndex](self, "displayedItemIndex");
  if (v2 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  else
    return (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v2));
}

- (void)_localeDidChange
{
  -[TransitDirectionsStepsListDataSource _refreshItemInstructionStrings](self, "_refreshItemInstructionStrings");
  -[TransitDirectionsStepsListDataSource _reloadListViewForRouteChangeIfNotAnimating](self, "_reloadListViewForRouteChangeIfNotAnimating");
}

- (MapsThrottler)matchedLocationThrottler
{
  MapsThrottler *matchedLocationThrottler;
  MapsThrottler *v4;
  id v5;
  MapsThrottler *v6;
  MapsThrottler *v7;
  _QWORD v9[4];
  id v10;
  id location;

  matchedLocationThrottler = self->_matchedLocationThrottler;
  if (!matchedLocationThrottler)
  {
    objc_initWeak(&location, self);
    v4 = [MapsThrottler alloc];
    v5 = &_dispatch_main_q;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100AE4A3C;
    v9[3] = &unk_1011B3F50;
    objc_copyWeak(&v10, &location);
    v6 = -[MapsThrottler initWithInitialValue:throttlingInterval:queue:updateHandler:](v4, "initWithInitialValue:throttlingInterval:queue:updateHandler:", 0, &_dispatch_main_q, v9, 10.0);
    v7 = self->_matchedLocationThrottler;
    self->_matchedLocationThrottler = v6;

    objc_destroyWeak(&v10);
    objc_destroyWeak(&location);
    matchedLocationThrottler = self->_matchedLocationThrottler;
  }
  return matchedLocationThrottler;
}

- (MNLocation)matchedLocation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource matchedLocationThrottler](self, "matchedLocationThrottler"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "value"));

  return (MNLocation *)v3;
}

- (void)setMatchedLocation:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource matchedLocationThrottler](self, "matchedLocationThrottler"));
  objc_msgSend(v5, "setValue:", v4);

}

- (void)setUseCollapsedDisplayStyle:(BOOL)a3
{
  if (self->_useCollapsedDisplayStyle != a3)
    -[TransitDirectionsStepsListDataSource _setUseCollapsedDisplayStyle:](self, "_setUseCollapsedDisplayStyle:");
}

- (void)_setUseCollapsedDisplayStyle:(BOOL)a3
{
  void *v4;
  id v5;

  self->_useCollapsedDisplayStyle = a3;
  -[TransitDirectionsStepsListDataSource _updateDisplayStyleInVisibleCells](self, "_updateDisplayStyleInVisibleCells");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _scrollView](self, "_scrollView"));
  objc_msgSend(v4, "layoutBelowIfNeeded");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
  objc_msgSend(v5, "reloadSeparators");

}

- (void)_updateDisplayStyleInVisibleCells
{
  void *v3;
  id v4;
  NSObject *v5;
  TransitDirectionsStepsListDataSource *v6;
  TransitDirectionsStepsListDataSource *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  TransitDirectionsStepsListDataSource *v21;
  TransitDirectionsStepsListDataSource *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  __CFString *v28;
  void *v29;
  void *v30;
  id v31;
  NSObject *v32;
  TransitDirectionsStepsListDataSource *v33;
  TransitDirectionsStepsListDataSource *v34;
  objc_class *v35;
  NSString *v36;
  void *v37;
  void *v38;
  void *v39;
  __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  _QWORD v46[5];
  _QWORD v47[4];
  void *v48;
  TransitDirectionsStepsListDataSource *v49;
  _QWORD v50[4];
  void *v51;
  TransitDirectionsStepsListDataSource *v52;
  uint8_t buf[4];
  __CFString *v54;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));

  if (!v3)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));

    if (v14)
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "visibleCells"));

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "indexPathsForVisibleRows"));

      v19 = sub_100ADE540();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (!os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
LABEL_33:

        v47[0] = _NSConcreteStackBlock;
        v47[1] = 3221225472;
        v47[2] = sub_100AE51E0;
        v47[3] = &unk_1011E2138;
        v48 = v18;
        v49 = self;
        v44 = v18;
        objc_msgSend(v16, "enumerateObjectsUsingBlock:", v47);
        v45 = v48;
        goto LABEL_34;
      }
      v21 = self;
      v22 = v21;
      if (!v21)
      {
        v28 = CFSTR("<nil>");
        goto LABEL_32;
      }
      v23 = (objc_class *)objc_opt_class(v21);
      v24 = NSStringFromClass(v23);
      v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
      if ((objc_opt_respondsToSelector(v22, "accessibilityIdentifier") & 1) != 0)
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v22, "performSelector:", "accessibilityIdentifier"));
        v27 = v26;
        if (v26 && !objc_msgSend(v26, "isEqualToString:", v25))
        {
          v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v25, v22, v27));

          goto LABEL_18;
        }

      }
      v28 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v25, v22));
LABEL_18:

LABEL_32:
      *(_DWORD *)buf = 138543362;
      v54 = v28;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "[%{public}@] Updating displayStyle in individual cells in table view", buf, 0xCu);

      goto LABEL_33;
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));

    if (!v29)
      return;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "allStepViews"));

    v31 = sub_100ADE540();
    v32 = objc_claimAutoreleasedReturnValue(v31);
    if (!os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
LABEL_40:

      v46[0] = _NSConcreteStackBlock;
      v46[1] = 3221225472;
      v46[2] = sub_100AE52C4;
      v46[3] = &unk_1011B9D70;
      v46[4] = self;
      objc_msgSend(v16, "enumerateObjectsUsingBlock:", v46);
      goto LABEL_35;
    }
    v33 = self;
    v34 = v33;
    if (!v33)
    {
      v40 = CFSTR("<nil>");
      goto LABEL_39;
    }
    v35 = (objc_class *)objc_opt_class(v33);
    v36 = NSStringFromClass(v35);
    v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
    if ((objc_opt_respondsToSelector(v34, "accessibilityIdentifier") & 1) != 0)
    {
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v34, "performSelector:", "accessibilityIdentifier"));
      v39 = v38;
      if (v38 && !objc_msgSend(v38, "isEqualToString:", v37))
      {
        v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v37, v34, v39));

        goto LABEL_27;
      }

    }
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v37, v34));
LABEL_27:

LABEL_39:
    *(_DWORD *)buf = 138543362;
    v54 = v40;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEBUG, "[%{public}@] Updating displayStyle in individual step views in list view", buf, 0xCu);

    goto LABEL_40;
  }
  v4 = sub_100ADE540();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v6 = self;
    v7 = v6;
    if (!v6)
    {
      v13 = CFSTR("<nil>");
      goto LABEL_29;
    }
    v8 = (objc_class *)objc_opt_class(v6);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_9;
      }

    }
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_9:

LABEL_29:
    *(_DWORD *)buf = 138543362;
    v54 = v13;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "[%{public}@] Updating displayStyle in individual visible cells in collection view", buf, 0xCu);

  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "visibleCells"));

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "indexPathsForVisibleItems"));

  v50[0] = _NSConcreteStackBlock;
  v50[1] = 3221225472;
  v50[2] = sub_100AE50FC;
  v50[3] = &unk_1011E20C0;
  v51 = v43;
  v52 = self;
  v44 = v43;
  objc_msgSend(v16, "enumerateObjectsUsingBlock:", v50);
  v45 = v51;
LABEL_34:

LABEL_35:
}

- (unint64_t)_stepViewDisplayOptionsForSection:(unint64_t)a3
{
  unint64_t v3;
  DirectionsStepsListNavigationProvider *navigationProvider;
  unint64_t v7;

  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v3 = 2;
  if (!self->_useCollapsedDisplayStyle)
    v3 = 4;
  navigationProvider = self->_navigationProvider;
  if (navigationProvider)
    v3 = 4;
  if (self->_useCollapsedDisplayStyle && navigationProvider != 0)
  {
    v7 = -[TransitDirectionsStepsListDataSource displayedItemIndex](self, "displayedItemIndex");
    v3 = 2;
    if (v7 == a3)
      return 3;
  }
  return v3;
}

- (NSMapTable)estimatedHeightsByItem
{
  NSMapTable *estimatedHeightsByItem;
  NSMapTable *v4;
  NSMapTable *v5;

  estimatedHeightsByItem = self->_estimatedHeightsByItem;
  if (!estimatedHeightsByItem)
  {
    v4 = (NSMapTable *)objc_claimAutoreleasedReturnValue(+[NSMapTable mapTableWithKeyOptions:valueOptions:](NSMapTable, "mapTableWithKeyOptions:valueOptions:", 261, 0));
    v5 = self->_estimatedHeightsByItem;
    self->_estimatedHeightsByItem = v4;

    estimatedHeightsByItem = self->_estimatedHeightsByItem;
  }
  return estimatedHeightsByItem;
}

- (void)_resetRowHeightCache
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource estimatedHeightsByItem](self, "estimatedHeightsByItem"));
  objc_msgSend(v2, "removeAllObjects");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[TransitDirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection", a3))
    return 1;
  else
    return -[TransitDirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t v6;
  int64_t v7;

  if (!-[TransitDirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection", a3))
    return -[TransitDirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", a4);
  if (!-[TransitDirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections"))
    return 0;
  v6 = 0;
  v7 = 0;
  do
    v7 += -[TransitDirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", v6++);
  while (v6 < -[TransitDirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections"));
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  char *v25;
  id v26;
  objc_class *v27;
  NSString *v28;
  void *v29;
  uint64_t v31;
  id v32;
  NSObject *v33;
  id v34;
  NSObject *v35;
  char *v36;
  int v37;
  const char *v38;
  __int16 v39;
  const char *v40;
  __int16 v41;
  int v42;
  __int16 v43;
  const char *v44;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v8));
  v10 = objc_opt_class(TransitDirectionsListItem);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = (id)objc_claimAutoreleasedReturnValue(+[TransitDirectionsCell dequeueCellForListItem:fromTableView:atIndexPath:](TransitDirectionsCell, "dequeueCellForListItem:fromTableView:atIndexPath:", v9, v6, v7));
    if (objc_msgSend(v11, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsExpandableCell))
      objc_msgSend(v11, "setExpandableCellDelegate:", self);
    v12 = objc_opt_class(TransitDirectionsBoardingInfoCell);
    if ((objc_opt_isKindOfClass(v11, v12) & 1) != 0)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stepView"));
      objc_msgSend(v13, "setBoardingInfoDelegate:", self);
    }
    else
    {
      v14 = objc_opt_class(TransitDirectionsClusteredVehiclesCell);
      if ((objc_opt_isKindOfClass(v11, v14) & 1) == 0)
      {
        v31 = objc_opt_class(TransitDirectionsIncidentCell);
        if ((objc_opt_isKindOfClass(v11, v31) & 1) != 0)
          objc_msgSend(v11, "setDelegate:", self);
LABEL_11:
        v15 = objc_opt_class(TransitDirectionsIncidentCell);
        if ((objc_opt_isKindOfClass(v11, v15) & 1) == 0)
        {
          -[TransitDirectionsStepsListDataSource leadingInstructionMargin](self, "leadingInstructionMargin");
          objc_msgSend(v11, "setLeadingInstructionMargin:");
        }
        objc_msgSend(v11, "setUseNavigationMetrics:", -[TransitDirectionsStepsListDataSource _useNavigationMetrics](self, "_useNavigationMetrics"));
        objc_msgSend(v11, "setDisplayOptions:", -[TransitDirectionsStepsListDataSource _stepViewDisplayOptionsForSection:](self, "_stepViewDisplayOptionsForSection:", objc_msgSend(v7, "section")));
        objc_msgSend(v11, "configureWithItem:", v9);
        v16 = objc_opt_class(TransitDirectionsOperatorInfoCell);
        if ((objc_opt_isKindOfClass(v11, v16) & 1) != 0)
        {
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stepView"));
          if ((uint64_t)objc_msgSend(v7, "row") <= 0)
          {
            v32 = sub_1004318FC();
            v33 = objc_claimAutoreleasedReturnValue(v32);
            if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            {
              v37 = 136315906;
              v38 = "-[TransitDirectionsStepsListDataSource tableView:cellForRowAtIndexPath:]";
              v39 = 2080;
              v40 = "TransitDirectionsStepsListDataSource.m";
              v41 = 1024;
              v42 = 1431;
              v43 = 2080;
              v44 = "indexPath.row > 0";
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v37, 0x26u);
            }

            if (sub_100A70734())
            {
              v34 = sub_1004318FC();
              v35 = objc_claimAutoreleasedReturnValue(v34);
              if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
              {
                v36 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
                v37 = 138412290;
                v38 = v36;
                _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v37, 0xCu);

              }
            }
          }
          if ((uint64_t)objc_msgSend(v7, "row") >= 1)
          {
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v7, "row") - 1, objc_msgSend(v7, "section")));
            v19 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "itemAtIndexPath:", v18));

            objc_msgSend(v17, "setPreviousItem:withPreviousNavigationState:", v20, -[TransitDirectionsStepsListDataSource _cellNavStateForItem:atIndexPath:](self, "_cellNavStateForItem:atIndexPath:", v20, v18));
          }

        }
        objc_msgSend(v11, "setNavigationState:", -[TransitDirectionsStepsListDataSource _cellNavStateForItem:atIndexPath:](self, "_cellNavStateForItem:atIndexPath:", v9, v7));
        if (v11)
          goto LABEL_26;
        goto LABEL_19;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "stepView"));
      objc_msgSend(v13, "setDelegate:", self);
    }

    goto LABEL_11;
  }
  if (!objc_msgSend(v9, "isEqual:", CFSTR("TransitDirectionsListSharingIdentifier")))
  {
LABEL_19:
    v21 = sub_1004318FC();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v37 = 136315650;
      v38 = "-[TransitDirectionsStepsListDataSource tableView:cellForRowAtIndexPath:]";
      v39 = 2080;
      v40 = "TransitDirectionsStepsListDataSource.m";
      v41 = 1024;
      v42 = 1450;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v37, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        v25 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v37 = 138412290;
        v38 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v37, 0xCu);

      }
    }
    v26 = objc_alloc((Class)MKTableViewCell);
    v27 = (objc_class *)objc_opt_class(MKTableViewCell);
    v28 = NSStringFromClass(v27);
    v29 = (void *)objc_claimAutoreleasedReturnValue(v28);
    v11 = objc_msgSend(v26, "initWithStyle:reuseIdentifier:", 0, v29);

LABEL_26:
    -[TransitDirectionsStepsListDataSource _configureSeparatorForCell:forRowAtIndexPath:](self, "_configureSeparatorForCell:forRowAtIndexPath:", v11, v7);
    goto LABEL_27;
  }
  v11 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _footerCellForIndexPath:inTableView:](self, "_footerCellForIndexPath:inTableView:", v7, v6));
LABEL_27:

  return v11;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  float v9;
  double v10;
  uint64_t v11;
  double v12;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", a4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource estimatedHeightsByItem](self, "estimatedHeightsByItem"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v6));

  if (v8)
  {
    objc_msgSend(v8, "floatValue");
    v10 = v9;
  }
  else
  {
    v11 = objc_opt_class(TransitDirectionsListItem);
    if ((objc_opt_isKindOfClass(v6, v11) & 1) != 0)
    {
      +[TransitDirectionsStepView estimatedHeightForListItem:](TransitDirectionsStepView, "estimatedHeightForListItem:", v6);
      v10 = v12;
    }
    else
    {
      v10 = 70.0;
    }
  }

  return v10;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  -[TransitDirectionsStepsListDataSource _cacheHeightForRow:atIndexPath:](self, "_cacheHeightForRow:atIndexPath:", a4, a5);
}

- (void)tableView:(id)a3 didHighlightRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _additionalSelectionIndexPathsForIndexPath:](self, "_additionalSelectionIndexPathsForIndexPath:", a4));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
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
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11)));
        objc_msgSend(v12, "setHighlighted:", 1);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)tableView:(id)a3 didUnhighlightRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _additionalSelectionIndexPathsForIndexPath:](self, "_additionalSelectionIndexPathsForIndexPath:", v7));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12)));
        objc_msgSend(v13, "setHighlighted:", 0);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _additionalSelectionIndexPathsForIndexPath:](self, "_additionalSelectionIndexPathsForIndexPath:", v7));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
        objc_msgSend(v6, "selectRowAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v12), 0, 0);
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  char v25;
  void *v26;
  void *v27;
  char v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _additionalSelectionIndexPathsForIndexPath:](self, "_additionalSelectionIndexPathsForIndexPath:", v7));
  v9 = sub_1002A8AA0(v6);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedRows", 0));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v30;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v30 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v14);
        if (v9 != 5
          || (objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v14), "isEqual:", v7) & 1) == 0
          && (objc_msgSend(v8, "containsObject:", v15) & 1) == 0)
        {
          objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v15, v9 != 5);
        }
        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
    }
    while (v12);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v7));
  v17 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v16));
  v18 = objc_opt_class(TransitDirectionsListItem);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    if (objc_msgSend(v19, "compare:", v16) == (id)-1)
    {
      v20 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v19));

      v17 = (id)v20;
    }
    v17 = v17;
    if (objc_msgSend(v17, "type") == (id)3
      && (v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate")),
          v22 = objc_opt_respondsToSelector(v21, "transitDirectionsStepsListDataSource:didSelectTrip:"),
          v21,
          (v22 & 1) != 0))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
      objc_msgSend(v23, "transitDirectionsStepsListDataSource:didSelectTrip:", self, v17);
    }
    else if (objc_msgSend(v17, "type") == (id)4
           && (v24 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate")),
               v25 = objc_opt_respondsToSelector(v24, "transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:"), v24, (v25 & 1) != 0))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndexPath:", v16));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "stepView"));
      -[TransitDirectionsStepsListDataSource transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:](self, "transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:", v26);

    }
    else
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
      v28 = objc_opt_respondsToSelector(v27, "transitDirectionsStepsListDataSource:didTapRowForItem:");

      if ((v28 & 1) == 0)
      {
LABEL_24:

        goto LABEL_25;
      }
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
      objc_msgSend(v23, "transitDirectionsStepsListDataSource:didTapRowForItem:", self, v17);
    }

    goto LABEL_24;
  }
LABEL_25:

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  return -[TransitDirectionsStepsListDataSource _shouldHighlightItemAtIndexPath:](self, "_shouldHighlightItemAtIndexPath:", a4);
}

- (void)tableViewDidFinishReload:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  BOOL v12;
  uint64_t v13;
  id v14;
  CGRect v15;

  v4 = a3;
  if (self->_routeSetAwaitingTableViewReload)
  {
    self->_routeSetAwaitingTableViewReload = 0;
    v14 = v4;
    objc_msgSend(v4, "contentOffset");
    v6 = v5;
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "safeAreaLayoutGuide"));
    objc_msgSend(v10, "layoutFrame");
    v11 = -CGRectGetMinY(v15);
    v12 = v6 == 0.0 && v8 == v11;
    if (v12 || (uint64_t)objc_msgSend(v14, "numberOfSections") < 1)
    {

      goto LABEL_10;
    }
    v13 = (uint64_t)objc_msgSend(v14, "numberOfRowsInSection:", 0);

    v4 = v14;
    if (v13 >= 1)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", 0, 0));
      objc_msgSend(v14, "scrollToRowAtIndexPath:atScrollPosition:animated:", v9, 1, 0);
LABEL_10:

      v4 = v14;
    }
  }

}

- (void)_cacheHeightForRow:(id)a3 atIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSNumber *v10;
  char *v11;
  id v12;
  NSObject *v13;
  id v14;
  int v15;
  const char *v16;
  __int16 v17;
  const char *v18;
  __int16 v19;
  int v20;
  __int16 v21;
  const char *v22;
  CGRect v23;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v7));
  if (v8)
  {
    v9 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource estimatedHeightsByItem](self, "estimatedHeightsByItem"));
    objc_msgSend(v6, "bounds");
    v10 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", CGRectGetHeight(v23));
    v11 = (char *)objc_claimAutoreleasedReturnValue(v10);
    -[NSObject setObject:forKey:](v9, "setObject:forKey:", v11, v8);
    goto LABEL_3;
  }
  v12 = sub_1004318FC();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v15 = 136315906;
    v16 = "-[TransitDirectionsStepsListDataSource _cacheHeightForRow:atIndexPath:]";
    v17 = 2080;
    v18 = "TransitDirectionsStepsListDataSource.m";
    v19 = 1024;
    v20 = 1567;
    v21 = 2080;
    v22 = "item";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v15, 0x26u);
  }

  if (sub_100A70734())
  {
    v14 = sub_1004318FC();
    v9 = objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      goto LABEL_4;
    v11 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
    v15 = 138412290;
    v16 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v15, 0xCu);
LABEL_3:

LABEL_4:
  }

}

- (int64_t)_cellNavStateForItem:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  unint64_t activeComposedRouteStepIndex;
  uint64_t v16;
  void *v17;
  int64_t v18;
  id v19;
  NSUInteger v20;
  NSUInteger v21;
  id v22;
  NSUInteger v23;
  NSUInteger v24;
  NSRange v25;
  id v26;
  void *v27;
  _BOOL4 v28;
  NSRange v30;
  NSRange v31;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource activeItemIndexPath](self, "activeItemIndexPath"));
  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource matchedLocation](self, "matchedLocation"));
    v10 = objc_msgSend(v9, "_navigation_isStale");

    v11 = objc_msgSend(v7, "section");
    v12 = objc_msgSend(v8, "section");
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v7));
    if (v11 != v12)
    {
      if (objc_msgSend(v8, "compare:", v13) == (id)1)
      {
        v19 = -[TransitDirectionsStepsListDataSource _segementRangeForItemAtIndexPath:](self, "_segementRangeForItemAtIndexPath:", v8);
        v21 = v20;
        v22 = -[TransitDirectionsStepsListDataSource _segementRangeForItemAtIndexPath:](self, "_segementRangeForItemAtIndexPath:", v13);
        v24 = v23;
        v30.location = (NSUInteger)v19;
        v30.length = v21;
        v31.location = (NSUInteger)v22;
        v31.length = v24;
        v25 = NSIntersectionRange(v30, v31);
        if (v25.length)
        {
          if ((id)v25.location == v22 && v25.length == v24)
          {
            v18 = 1;
          }
          else
          {
            v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentItem"));
            v28 = v27 == 0;

            v18 = 2 * v28;
          }
        }
        else
        {
          v18 = 3;
        }
      }
      else
      {
        v18 = 0;
      }
      goto LABEL_24;
    }
    v14 = objc_msgSend(v6, "matchingRouteStepIndex");
    activeComposedRouteStepIndex = self->_activeComposedRouteStepIndex;
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "parentItem"));
    if (!v16)
      goto LABEL_20;
    v17 = (void *)v16;
    if (objc_msgSend(v6, "type") == (id)5 || objc_msgSend(v6, "type") == (id)14)
    {

    }
    else
    {
      v26 = objc_msgSend(v6, "type");

      if (v26 != (id)6)
        goto LABEL_20;
    }
    if ((unint64_t)v14 <= activeComposedRouteStepIndex)
    {
      if (v10)
        v18 = 1;
      else
        v18 = 5;
LABEL_24:

      goto LABEL_25;
    }
LABEL_20:
    if (v10)
      v18 = 0;
    else
      v18 = 4;
    goto LABEL_24;
  }
  v18 = 0;
LABEL_25:

  return v18;
}

- (_NSRange)_segementRangeForItemAtIndexPath:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  _BYTE *v12;
  unint64_t v13;
  unint64_t v14;
  _BYTE *v15;
  _BOOL4 v17;
  NSUInteger v18;
  NSUInteger v19;
  char *v20;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _NSRange result;

  v4 = a3;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource transitSegmentSectionRanges](self, "transitSegmentSectionRanges"));
  v5 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v23;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
    do
    {
      v11 = 0;
      v20 = &v8[(_QWORD)v6];
      do
      {
        if (*(_QWORD *)v23 != v9)
          objc_enumerationMutation(obj);
        v12 = objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v11), "rangeValue", v20);
        v14 = v13;
        v15 = objc_msgSend(v4, "section");
        v17 = v15 >= v12 && v15 - v12 < v14;
        if (v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (v17)
            v10 = (uint64_t)&v11[(_QWORD)v8];
          else
            v10 = 0x7FFFFFFFFFFFFFFFLL;
          if (v17)
            v7 = 1;
        }
        else
        {
          if (!v17)
            goto LABEL_25;
          ++v7;
        }
        ++v11;
      }
      while (v6 != v11);
      v6 = (char *)objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      v8 = v20;
    }
    while (v6);
  }
  else
  {
    v7 = 0;
    v10 = 0x7FFFFFFFFFFFFFFFLL;
  }
LABEL_25:

  v18 = v10;
  v19 = v7;
  result.length = v19;
  result.location = v18;
  return result;
}

- (id)_footerCellForIndexPath:(id)a3 inTableView:(id)a4
{
  RoutePlanningFooterCell *v5;
  RoutePlanningFooterCell *v6;
  void *v7;

  if (a4)
    v5 = (RoutePlanningFooterCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("TransitDirectionsListSharingIdentifier"), a3));
  else
    v5 = -[RoutePlanningFooterCell initWithFrame:]([RoutePlanningFooterCell alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v6 = v5;
  -[RoutePlanningFooterCell set_mapkit_separatorStyleOverride:](v5, "set_mapkit_separatorStyleOverride:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterCell footerView](v6, "footerView"));
  -[TransitDirectionsStepsListDataSource _configureFooterView:](self, "_configureFooterView:", v7);

  return v6;
}

- (id)_footerCellForIndexPath:(id)a3 inCollectionView:(id)a4
{
  void *v5;
  void *v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("TransitDirectionsListSharingIdentifier"), a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "footerView"));
  -[TransitDirectionsStepsListDataSource _configureFooterView:](self, "_configureFooterView:", v6);

  return v5;
}

- (void)_configureFooterView:(id)a3
{
  GEOComposedRoute *route;
  void *v5;
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  id v9;

  route = self->_route;
  v9 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute ticketingSegmentsForSelectedRides](route, "ticketingSegmentsForSelectedRides"));
  v6 = objc_msgSend(v5, "count");

  v7 = sub_1002A8AA0(v9) != 5;
  if (v6)
    v8 = (2 * v7) | 4;
  else
    v8 = 2 * v7;
  objc_msgSend(v9, "setVisibleCommandSet:", v8);
  objc_msgSend(v9, "setDelegate:", self);

}

- (void)_configureSeparatorForCell:(id)a3 forRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  char *v14;
  void *v15;
  void *v16;
  int64_t v17;
  int64_t v18;
  id v19;
  id v20;
  unsigned __int8 v21;
  unsigned int v22;
  _BOOL8 v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  id v29;
  NSObject *v30;
  char *v31;
  int v32;
  const char *v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  int v37;
  __int16 v38;
  const char *v39;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v7));
  v9 = objc_opt_class(TransitDirectionsListItem);
  if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
  {
    v10 = objc_opt_class(MKTableViewCell);
    if ((objc_opt_isKindOfClass(v6, v10) & 1) == 0
      || !objc_msgSend(v6, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsCell)
      || (objc_opt_respondsToSelector(v6, "setUseLeadingInstructionMarginAsLeadingSeparatorInset:") & 1) == 0)
    {
      v27 = sub_1004318FC();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
        v32 = 136315906;
        v33 = "-[TransitDirectionsStepsListDataSource _configureSeparatorForCell:forRowAtIndexPath:]";
        v34 = 2080;
        v35 = "TransitDirectionsStepsListDataSource.m";
        v36 = 1024;
        v37 = 1683;
        v38 = 2080;
        v39 = "[cell isKindOfClass:[MKTableViewCell class]] && [cell conformsToProtocol:@protocol(TransitDirectionsCell)]"
              " && [cell respondsToSelector:@selector(setUseLeadingInstructionMarginAsLeadingSeparatorInset:)]";
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v32, 0x26u);
      }

      if (sub_100A70734())
      {
        v29 = sub_1004318FC();
        v30 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v31 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v32 = 138412290;
          v33 = v31;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v32, 0xCu);

        }
      }
    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
    if (v11)
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
    else
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
    v13 = v12;
    v14 = (char *)objc_msgSend(v12, "numberOfSections");

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
      v17 = -[TransitDirectionsStepsListDataSource tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v16, objc_msgSend(v7, "section"));
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
      v17 = -[TransitDirectionsStepsListDataSource collectionView:numberOfItemsInSection:](self, "collectionView:numberOfItemsInSection:", v16, objc_msgSend(v7, "section"));
    }
    v18 = v17;

    v19 = (id)(v18 - 1);
    v20 = objc_msgSend(v7, "row");
    v21 = -[TransitDirectionsStepsListDataSource options](self, "options");
    v22 = -[TransitDirectionsStepsListDataSource _supportsFooterItem](self, "_supportsFooterItem");
    v23 = 1;
    if ((v21 & 8) != 0 && v19 == v20)
    {
      v24 = -2;
      if (!v22)
        v24 = -1;
      v23 = &v14[v24] != objc_msgSend(v7, "section");
    }
    v25 = v6;
    objc_msgSend(v25, "setUseLeadingInstructionMarginAsLeadingSeparatorInset:", v23);
    if (v19 == v20)
      v26 = 1;
    else
      v26 = v23 ^ 1;
    objc_msgSend(v25, "set_mapkit_separatorStyleOverride:", v26);

  }
}

- (void)transitDirectionsCell:(id)a3 didTapAdvisory:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v8 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
  objc_msgSend(v7, "captureUserAction:onTarget:forAdvisory:", 250, objc_msgSend((id)v8, "currentUITargetForAnalytics"), v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
  LOBYTE(v8) = objc_opt_respondsToSelector(v9, "transitDirectionsStepsListDataSource:didTapIncidentsCell:withAdvisory:");

  if ((v8 & 1) != 0)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
    objc_msgSend(v10, "transitDirectionsStepsListDataSource:didTapIncidentsCell:withAdvisory:", self, v11, v6);

  }
}

- (void)transitDirectionsCell:(id)a3 wantsToExpandOrCollapseItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cell"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
  -[TransitDirectionsStepsListDataSource _transitDirectionsCell:wantsToExpandOrCollapseItem:inTableView:](self, "_transitDirectionsCell:wantsToExpandOrCollapseItem:inTableView:", v8, v6, v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "cell"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
  -[TransitDirectionsStepsListDataSource _transitDirectionsCell:wantsToExpandOrCollapseItem:inCollectionView:](self, "_transitDirectionsCell:wantsToExpandOrCollapseItem:inCollectionView:", v10, v6, v11);

  v12 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
  -[TransitDirectionsStepsListDataSource _transitDirectionsStepView:wantsToExpandOrCollapseItem:inListView:](self, "_transitDirectionsStepView:wantsToExpandOrCollapseItem:inListView:", v7, v6, v12);

}

- (void)_transitDirectionsCell:(id)a3 wantsToExpandOrCollapseItem:(id)a4 inTableView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  char *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForCell:", v8));

    if (v9 && v11)
    {
      self->_animatingExpansion = 1;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
      v13 = objc_opt_respondsToSelector(v12, "transitDirectionsStepsListDataSource:willExpandItem:");

      if ((v13 & 1) != 0)
      {
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
        objc_msgSend(v14, "transitDirectionsStepsListDataSource:willExpandItem:", self, v9);

      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource tableView](self, "tableView"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100AE71CC;
      v23[3] = &unk_1011AF1B0;
      v23[4] = self;
      v24 = v11;
      v25 = v9;
      v26 = v8;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100AE78B4;
      v21[3] = &unk_1011ACCB8;
      v21[4] = self;
      v22 = v25;
      objc_msgSend(v15, "performBatchUpdates:completion:", v23, v21);

    }
    else
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v28 = "-[TransitDirectionsStepsListDataSource _transitDirectionsCell:wantsToExpandOrCollapseItem:inTableView:]";
        v29 = 2080;
        v30 = "TransitDirectionsStepsListDataSource.m";
        v31 = 1024;
        v32 = 1737;
        v33 = 2080;
        v34 = "indexPath != nil && item != nil";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v18 = sub_1004318FC();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v28 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }

  }
}

- (void)_transitDirectionsCell:(id)a3 wantsToExpandOrCollapseItem:(id)a4 inCollectionView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  NSObject *v19;
  char *v20;
  _QWORD v21[5];
  id v22;
  _QWORD v23[5];
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  const char *v30;
  __int16 v31;
  int v32;
  __int16 v33;
  const char *v34;

  v8 = a3;
  v9 = a4;
  if (a5)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "indexPathForCell:", v8));

    if (v9 && v11)
    {
      self->_animatingExpansion = 1;
      if ((objc_msgSend(v9, "expanded") & 1) == 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
        v13 = objc_opt_respondsToSelector(v12, "transitDirectionsStepsListDataSource:willExpandItem:");

        if ((v13 & 1) != 0)
        {
          v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
          objc_msgSend(v14, "transitDirectionsStepsListDataSource:willExpandItem:", self, v9);

        }
      }
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource collectionView](self, "collectionView"));
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_100AE7CFC;
      v23[3] = &unk_1011AF1B0;
      v23[4] = self;
      v24 = v11;
      v25 = v9;
      v26 = v8;
      v21[0] = _NSConcreteStackBlock;
      v21[1] = 3221225472;
      v21[2] = sub_100AE83DC;
      v21[3] = &unk_1011ACCB8;
      v21[4] = self;
      v22 = v25;
      objc_msgSend(v15, "performBatchUpdates:completion:", v23, v21);

    }
    else
    {
      v16 = sub_1004318FC();
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v28 = "-[TransitDirectionsStepsListDataSource _transitDirectionsCell:wantsToExpandOrCollapseItem:inCollectionView:]";
        v29 = 2080;
        v30 = "TransitDirectionsStepsListDataSource.m";
        v31 = 1024;
        v32 = 1811;
        v33 = 2080;
        v34 = "indexPath != nil && item != nil";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v18 = sub_1004318FC();
        v19 = objc_claimAutoreleasedReturnValue(v18);
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          v20 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v28 = v20;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }

  }
}

- (void)_transitDirectionsStepView:(id)a3 wantsToExpandOrCollapseItem:(id)a4 inListView:(id)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  char *v19;
  _QWORD v20[5];
  id v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  int v27;
  __int16 v28;
  const char *v29;

  v7 = a4;
  if (a5)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "indexPathForItem:", v7));

    if (v7 && v9)
    {
      self->_animatingExpansion = 1;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
      v11 = objc_opt_respondsToSelector(v10, "transitDirectionsStepsListDataSource:willExpandItem:");

      if ((v11 & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
        objc_msgSend(v12, "transitDirectionsStepsListDataSource:willExpandItem:", self, v7);

      }
      objc_msgSend(v7, "setExpanded:", objc_msgSend(v7, "expanded") ^ 1);
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
      v14 = objc_msgSend(v9, "section");
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100AE87C8;
      v20[3] = &unk_1011ACCB8;
      v20[4] = self;
      v21 = v7;
      objc_msgSend(v13, "reloadSectionAtIndex:animated:completion:", v14, 1, v20);

    }
    else
    {
      v15 = sub_1004318FC();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v23 = "-[TransitDirectionsStepsListDataSource _transitDirectionsStepView:wantsToExpandOrCollapseItem:inListView:]";
        v24 = 2080;
        v25 = "TransitDirectionsStepsListDataSource.m";
        v26 = 1024;
        v27 = 1885;
        v28 = 2080;
        v29 = "indexPath != nil && item != nil";
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v17 = sub_1004318FC();
        v18 = objc_claimAutoreleasedReturnValue(v17);
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          v19 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v23 = v19;
          _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }

  }
}

- (void)didTapShareButtonOnRoutePlanningFooterView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "currentUITargetForAnalytics");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
    v8 = objc_msgSend(v7, "currentUITargetForAnalytics");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexForAnalytics](self, "displayedItemIndexForAnalytics"));
    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:transitStep:", 6013, v8, 0, v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
  v11 = objc_opt_respondsToSelector(v10, "directionsStepsListDidTapShareButton:");

  if ((v11 & 1) != 0)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
    objc_msgSend(v12, "directionsStepsListDidTapShareButton:", self);

  }
}

- (void)didTapGetTicketsOnRoutePlanningFooterView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "transitDirectionsStepsListDataSource:didTapGetTicketsForSegments:");

  if ((v5 & 1) != 0)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute ticketingSegmentsForSelectedRides](self->_route, "ticketingSegmentsForSelectedRides"));
    objc_msgSend(v7, "transitDirectionsStepsListDataSource:didTapGetTicketsForSegments:", self, v6);

  }
}

- (id)ticketingSegmentsForRoutePlanningFooterView:(id)a3
{
  return -[GEOComposedRoute ticketingSegmentsForSelectedRides](self->_route, "ticketingSegmentsForSelectedRides", a3);
}

- (void)routePlanningView:(id)a3 didTapGetTicketsForURL:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "transitDirectionsStepsListDataSource:didTapGetTicketsWithURL:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
    objc_msgSend(v7, "transitDirectionsStepsListDataSource:didTapGetTicketsWithURL:", self, v8);

  }
}

- (void)didTapReportAProblemButtonOnRoutePlanningFooterView:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "currentUITargetForAnalytics");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
    v8 = objc_msgSend(v7, "currentUITargetForAnalytics");
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexForAnalytics](self, "displayedItemIndexForAnalytics"));
    objc_msgSend(v6, "captureUserAction:onTarget:eventValue:transitStep:", 5013, v8, 0, v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
  v11 = objc_opt_respondsToSelector(v10, "directionsStepsListDidTapRAPButton:");

  if ((v11 & 1) != 0)
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
    objc_msgSend(v12, "directionsStepsListDidTapRAPButton:", self);

  }
}

- (void)transitDirectionsBoardingInfoStepView:(id)a3 didSelectScheduleForItem:(id)a4
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v10;
  id v11;
  id v12;
  id v13;

  v11 = a4;
  v5 = objc_msgSend(v11, "type");
  v6 = v11;
  if (v11 && v5 == (id)9)
  {
    while (1)
    {
      v12 = v6;
      if (objc_msgSend(v6, "type") == (id)2)
        break;
      v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "nextItem"));

      v6 = (void *)v7;
      if (!v7)
        goto LABEL_7;
    }
    v6 = v12;
  }
LABEL_7:
  v13 = v6;
  if (objc_msgSend(v6, "type") == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "transitDirectionsStepsListDataSource:didSelectTrip:");

    if ((v9 & 1) != 0)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
      objc_msgSend(v10, "transitDirectionsStepsListDataSource:didSelectTrip:", self, v13);

    }
  }

}

- (void)transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexForAnalytics](self, "displayedItemIndexForAnalytics"));
  +[GEOAPPortal captureUserAction:target:value:transitStep:](GEOAPPortal, "captureUserAction:target:value:transitStep:", 17098, 0, 0, v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
  LOBYTE(v4) = objc_opt_respondsToSelector(v5, "transitDirectionsStepsListDataSource:didTapClusteredVehiclesCell:");

  if ((v4 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
    objc_msgSend(v6, "transitDirectionsStepsListDataSource:didTapClusteredVehiclesCell:", self, v7);

  }
}

- (void)_updateListForClusteredRideOptionChangeInClusteredSegment:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  TransitDirectionsStepsListDataSource *v7;
  objc_class *v8;
  NSString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MapsThrottler *v14;
  id v15;
  MapsThrottler *v16;
  MapsThrottler *clusteredRideUpdateThrottler;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[4];
  void *v22;

  v4 = a3;
  if (!self->_clusteredRideUpdateThrottler)
  {
    v5 = sub_100ADE540();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (!os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
LABEL_9:

      objc_initWeak((id *)buf, self);
      v14 = [MapsThrottler alloc];
      v15 = &_dispatch_main_q;
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100AE9098;
      v19[3] = &unk_1011B3F50;
      objc_copyWeak(&v20, (id *)buf);
      v16 = -[MapsThrottler initWithInitialValue:throttlingInterval:queue:updateHandler:](v14, "initWithInitialValue:throttlingInterval:queue:updateHandler:", 0, &_dispatch_main_q, v19, 0.0);
      clusteredRideUpdateThrottler = self->_clusteredRideUpdateThrottler;
      self->_clusteredRideUpdateThrottler = v16;

      objc_destroyWeak(&v20);
      objc_destroyWeak((id *)buf);
      goto LABEL_10;
    }
    v7 = self;
    v8 = (objc_class *)objc_opt_class(v7);
    v9 = NSStringFromClass(v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    if ((objc_opt_respondsToSelector(v7, "accessibilityIdentifier") & 1) != 0)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource performSelector:](v7, "performSelector:", "accessibilityIdentifier"));
      v12 = v11;
      if (v11 && !objc_msgSend(v11, "isEqualToString:", v10))
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v10, v7, v12));

        goto LABEL_8;
      }

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v10, v7));
LABEL_8:

    *(_DWORD *)buf = 138543362;
    v22 = v13;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "[%{public}@] Will prepare transit clustered ride update throttler to prevent more than one rebuild/reload per run loop", buf, 0xCu);

    goto LABEL_9;
  }
LABEL_10:
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  -[MapsThrottler setValue:](self->_clusteredRideUpdateThrottler, "setValue:", v18);

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (-[TransitDirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection", a3))
    return 1;
  else
    return -[TransitDirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections");
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  unint64_t v6;
  int64_t v7;

  if (!-[TransitDirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection", a3))
    return -[TransitDirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", a4);
  if (!-[TransitDirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections"))
    return 0;
  v6 = 0;
  v7 = 0;
  do
    v7 += -[TransitDirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", v6++);
  while (v6 < -[TransitDirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections"));
  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  char *v16;
  objc_class *v17;
  NSString *v18;
  void *v19;
  int v21;
  const char *v22;
  __int16 v23;
  const char *v24;
  __int16 v25;
  int v26;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v8));
  v10 = objc_opt_class(TransitDirectionsListItem);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransitDirectionsCell dequeueCellForListItem:fromCollectionView:atIndexPath:](TransitDirectionsCell, "dequeueCellForListItem:fromCollectionView:atIndexPath:", v9, v6, v7));
    -[TransitDirectionsStepsListDataSource _configureTransitDirectionsCollectionViewCell:withItem:atIndexPath:](self, "_configureTransitDirectionsCollectionViewCell:withItem:atIndexPath:", v11, v9, v7);
  }
  else if (objc_msgSend(v9, "isEqual:", CFSTR("TransitDirectionsListSharingIdentifier")))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _footerCellForIndexPath:inCollectionView:](self, "_footerCellForIndexPath:inCollectionView:", v7, v6));
  }
  else
  {
    v12 = sub_1004318FC();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315650;
      v22 = "-[TransitDirectionsStepsListDataSource collectionView:cellForItemAtIndexPath:]";
      v23 = 2080;
      v24 = "TransitDirectionsStepsListDataSource.m";
      v25 = 1024;
      v26 = 2064;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion reached unexpectedly!", (uint8_t *)&v21, 0x1Cu);
    }

    if (sub_100A70734())
    {
      v14 = sub_1004318FC();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v16 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
        v21 = 138412290;
        v22 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v21, 0xCu);

      }
    }
    v17 = (objc_class *)objc_opt_class(MapsThemeCollectionViewCell);
    v18 = NSStringFromClass(v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v19, v7));

  }
  return v11;
}

- (void)_configureTransitDirectionsCollectionViewCell:(id)a3 withItem:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  id v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  char *v24;
  int v25;
  const char *v26;
  __int16 v27;
  const char *v28;
  __int16 v29;
  int v30;
  __int16 v31;
  const char *v32;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsExpandableCell))
    objc_msgSend(v8, "setExpandableCellDelegate:", self);
  v11 = objc_opt_class(TransitDirectionsBoardingInfoCollectionViewCell);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stepView"));
    objc_msgSend(v12, "setBoardingInfoDelegate:", self);
LABEL_7:

    goto LABEL_8;
  }
  v13 = objc_opt_class(TransitDirectionsClusteredVehiclesCollectionViewCell);
  if ((objc_opt_isKindOfClass(v8, v13) & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stepView"));
    objc_msgSend(v12, "setDelegate:", self);
    goto LABEL_7;
  }
  v19 = objc_opt_class(TransitDirectionsIncidentCollectionViewCell);
  if ((objc_opt_isKindOfClass(v8, v19) & 1) != 0)
    objc_msgSend(v8, "setDelegate:", self);
LABEL_8:
  -[TransitDirectionsStepsListDataSource leadingInstructionMargin](self, "leadingInstructionMargin");
  objc_msgSend(v8, "setLeadingInstructionMargin:");
  objc_msgSend(v8, "setUseNavigationMetrics:", -[TransitDirectionsStepsListDataSource _useNavigationMetrics](self, "_useNavigationMetrics"));
  objc_msgSend(v8, "setDisplayOptions:", -[TransitDirectionsStepsListDataSource _stepViewDisplayOptionsForSection:](self, "_stepViewDisplayOptionsForSection:", objc_msgSend(v10, "section")));
  objc_msgSend(v8, "configureWithItem:", v9);
  v14 = objc_opt_class(TransitDirectionsOperatorInfoCollectionViewCell);
  if ((objc_opt_isKindOfClass(v8, v14) & 1) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stepView"));
    if ((uint64_t)objc_msgSend(v10, "row") <= 0)
    {
      v20 = sub_1004318FC();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        v25 = 136315906;
        v26 = "-[TransitDirectionsStepsListDataSource _configureTransitDirectionsCollectionViewCell:withItem:atIndexPath:]";
        v27 = 2080;
        v28 = "TransitDirectionsStepsListDataSource.m";
        v29 = 1024;
        v30 = 2097;
        v31 = 2080;
        v32 = "indexPath.row > 0";
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v25, 0x26u);
      }

      if (sub_100A70734())
      {
        v22 = sub_1004318FC();
        v23 = objc_claimAutoreleasedReturnValue(v22);
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          v24 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v25 = 138412290;
          v26 = v24;
          _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v25, 0xCu);

        }
      }
    }
    if ((uint64_t)objc_msgSend(v10, "row") >= 1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v10, "row") - 1, objc_msgSend(v10, "section")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "itemAtIndexPath:", v16));

      objc_msgSend(v15, "setPreviousItem:withPreviousNavigationState:", v18, -[TransitDirectionsStepsListDataSource _cellNavStateForItem:atIndexPath:](self, "_cellNavStateForItem:atIndexPath:", v18, v16));
    }

  }
  objc_msgSend(v8, "setNavigationState:", -[TransitDirectionsStepsListDataSource _cellNavStateForItem:atIndexPath:](self, "_cellNavStateForItem:atIndexPath:", v9, v10));

}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  return -[TransitDirectionsStepsListDataSource _shouldHighlightItemAtIndexPath:](self, "_shouldHighlightItemAtIndexPath:", a4);
}

- (void)collectionView:(id)a3 didHighlightItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _additionalSelectionIndexPathsForIndexPath:](self, "_additionalSelectionIndexPathsForIndexPath:", a4));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
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
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11)));
        objc_msgSend(v12, "setHighlighted:", 1);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)collectionView:(id)a3 didUnhighlightItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _additionalSelectionIndexPathsForIndexPath:](self, "_additionalSelectionIndexPathsForIndexPath:", a4));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
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
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11)));
        objc_msgSend(v12, "setHighlighted:", 0);

        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (BOOL)collectionView:(id)a3 shouldSelectItemAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _additionalSelectionIndexPathsForIndexPath:](self, "_additionalSelectionIndexPathsForIndexPath:", a4));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
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
        objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v11), 0, 0);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

  return 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *j;
  uint64_t v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  char v29;
  void *v30;
  void *v31;
  void *v32;
  char v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _additionalSelectionIndexPathsForIndexPath:](self, "_additionalSelectionIndexPathsForIndexPath:", v7));
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathsForSelectedItems"));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v39 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v14, "isEqual:", v7) & 1) == 0
          && (objc_msgSend(v8, "containsObject:", v14) & 1) == 0)
        {
          objc_msgSend(v6, "deselectItemAtIndexPath:animated:", v14, 0);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v38, v43, 16);
    }
    while (v11);
  }

  if (sub_1002A8AA0(v6) == 5)
  {
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v15 = v8;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v35;
      do
      {
        for (j = 0; j != v17; j = (char *)j + 1)
        {
          if (*(_QWORD *)v35 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)j);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v20, (_QWORD)v34));
          if ((objc_msgSend(v21, "isSelected") & 1) == 0)
            objc_msgSend(v6, "selectItemAtIndexPath:animated:scrollPosition:", v20, 0, 0);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v42, 16);
      }
      while (v17);
    }

  }
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v7, (_QWORD)v34));
  v23 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v22));
  v24 = objc_opt_class(TransitDirectionsListItem);
  if ((objc_opt_isKindOfClass(v23, v24) & 1) != 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    if (objc_msgSend(v25, "compare:", v7) == (id)-1)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v25));
      v27 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v26));

      v23 = (id)v27;
    }
    v23 = v23;
    if (objc_msgSend(v23, "type") == (id)4
      && (v28 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate")),
          v29 = objc_opt_respondsToSelector(v28, "transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:"), v28, (v29 & 1) != 0))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForItemAtIndexPath:", v7));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "stepView"));
      -[TransitDirectionsStepsListDataSource transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:](self, "transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:", v31);

    }
    else
    {
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
      v33 = objc_opt_respondsToSelector(v32, "transitDirectionsStepsListDataSource:didTapRowForItem:");

      if ((v33 & 1) == 0)
      {
LABEL_31:

        goto LABEL_32;
      }
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
      objc_msgSend(v30, "transitDirectionsStepsListDataSource:didTapRowForItem:", self, v23);
    }

    goto LABEL_31;
  }
LABEL_32:

}

- (int64_t)transitDirectionsListView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  return -[TransitDirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", a4);
}

- (id)transitDirectionsListView:(id)a3 stepViewForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v8));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueStepViewForItem:", v9));

  -[TransitDirectionsStepsListDataSource _configureStepView:forItem:atIndexPath:](self, "_configureStepView:forItem:atIndexPath:", v10, v9, v6);
  return v10;
}

- (void)_configureStepView:(id)a3 forItem:(id)a4 atIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  char *v23;
  int v24;
  const char *v25;
  __int16 v26;
  const char *v27;
  __int16 v28;
  int v29;
  __int16 v30;
  const char *v31;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v8, "conformsToProtocol:", &OBJC_PROTOCOL___TransitDirectionsExpandableCell))
    objc_msgSend(v8, "setExpandableCellDelegate:", self);
  v11 = objc_opt_class(TransitDirectionsBoardingInfoStepView);
  if ((objc_opt_isKindOfClass(v8, v11) & 1) != 0)
  {
    objc_msgSend(v8, "setBoardingInfoDelegate:", self);
  }
  else
  {
    v12 = objc_opt_class(TransitDirectionsClusteredVehiclesStepView);
    if ((objc_opt_isKindOfClass(v8, v12) & 1) != 0
      || (v13 = objc_opt_class(TransitDirectionsIncidentStepView),
          (objc_opt_isKindOfClass(v8, v13) & 1) != 0))
    {
      objc_msgSend(v8, "setDelegate:", self);
    }
  }
  -[TransitDirectionsStepsListDataSource leadingInstructionMargin](self, "leadingInstructionMargin");
  objc_msgSend(v8, "setLeadingInstructionMargin:");
  objc_msgSend(v8, "setUseNavigationMetrics:", -[TransitDirectionsStepsListDataSource _useNavigationMetrics](self, "_useNavigationMetrics"));
  objc_msgSend(v8, "setDisplayOptions:", -[TransitDirectionsStepsListDataSource _stepViewDisplayOptionsForSection:](self, "_stepViewDisplayOptionsForSection:", objc_msgSend(v10, "section")));
  objc_msgSend(v8, "configureWithItem:", v9);
  v14 = objc_opt_class(TransitDirectionsOperatorInfoStepView);
  if ((objc_opt_isKindOfClass(v8, v14) & 1) != 0)
  {
    v15 = v8;
    if ((uint64_t)objc_msgSend(v10, "row") <= 0)
    {
      v19 = sub_1004318FC();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        v24 = 136315906;
        v25 = "-[TransitDirectionsStepsListDataSource _configureStepView:forItem:atIndexPath:]";
        v26 = 2080;
        v27 = "TransitDirectionsStepsListDataSource.m";
        v28 = 1024;
        v29 = 2243;
        v30 = 2080;
        v31 = "indexPath.row > 0";
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", (uint8_t *)&v24, 0x26u);
      }

      if (sub_100A70734())
      {
        v21 = sub_1004318FC();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          v23 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          v24 = 138412290;
          v25 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@", (uint8_t *)&v24, 0xCu);

        }
      }
    }
    if ((uint64_t)objc_msgSend(v10, "row") >= 1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v10, "row") - 1, objc_msgSend(v10, "section")));
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "itemAtIndexPath:", v16));

      objc_msgSend(v15, "setPreviousItem:withPreviousNavigationState:", v18, -[TransitDirectionsStepsListDataSource _cellNavStateForItem:atIndexPath:](self, "_cellNavStateForItem:atIndexPath:", v18, v16));
    }

  }
  objc_msgSend(v8, "setNavigationState:", -[TransitDirectionsStepsListDataSource _cellNavStateForItem:atIndexPath:](self, "_cellNavStateForItem:atIndexPath:", v9, v10));

}

- (BOOL)transitDirectionsListView:(id)a3 shouldShowSeparatorForItem:(id)a4 atIndexPath:(id)a5 insets:(NSDirectionalEdgeInsets *)a6
{
  return -[TransitDirectionsStepsListDataSource shouldShowSeparatorForItemAtIndexPath:insets:](self, "shouldShowSeparatorForItemAtIndexPath:insets:", a5, a6);
}

- (id)activeItemForTransitDirectionsListView:(id)a3
{
  unint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;

  v4 = -[TransitDirectionsStepsListDataSource highlightingBehaviour](self, "highlightingBehaviour", a3);
  if (v4 == 2)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _displayedItem](self, "_displayedItem"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _activeItem](self, "_activeItem"));

    if (v6 == v7)
      v8 = 0;
    else
      v8 = v6;

  }
  else
  {
    if (v4 == 1)
      v5 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _displayedItem](self, "_displayedItem"));
    else
      v5 = objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _activeItem](self, "_activeItem"));
    v8 = (id)v5;
  }
  return v8;
}

- (BOOL)transitDirectionsListView:(id)a3 canSelectItem:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "indexPathForItem:", v5));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _flatIndexFromIndexPath:](self, "_flatIndexFromIndexPath:", v7));
  LOBYTE(self) = -[TransitDirectionsStepsListDataSource _shouldHighlightItemAtIndexPath:](self, "_shouldHighlightItemAtIndexPath:", v8);

  return (char)self;
}

- (void)transitDirectionsListView:(id)a3 didSelectItem:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  char v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if (objc_msgSend(v6, "type") == (id)4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:");

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "stepViewForItem:", v6));
      -[TransitDirectionsStepsListDataSource transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:](self, "transitDirectionsClusteredVehiclesCellDidTapAlternateRouteButtonInCell:", v9);
LABEL_6:

      goto LABEL_7;
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
  v11 = objc_opt_respondsToSelector(v10, "transitDirectionsStepsListDataSource:didTapRowForItem:");

  if ((v11 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
    objc_msgSend(v9, "transitDirectionsStepsListDataSource:didTapRowForItem:", self, v6);
    goto LABEL_6;
  }
LABEL_7:

}

- (void)transitDirectionsListView:(id)a3 didDisplayAdvisory:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
  objc_msgSend(v7, "captureUserAction:onTarget:forAdvisory:", 247, objc_msgSend(v6, "currentUITargetForAnalytics"), v5);

}

- (void)_updateActiveItemInListViewIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listView](self, "listView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource activeItemForTransitDirectionsListView:](self, "activeItemForTransitDirectionsListView:", v3));
  objc_msgSend(v5, "setActiveTransitDirectionsListItem:", v4);

}

- (id)_additionalSelectionIndexPathsForIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  char *v27;
  void *v28;
  void *v29;
  void *v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  const char *v38;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = objc_opt_class(TransitDirectionsListItem);
  if ((objc_opt_isKindOfClass(v6, v8) & 1) != 0)
  {
    v28 = v6;
    v9 = v6;
    v30 = v5;
    v10 = v5;
    if ((objc_msgSend(v9, "selectable") & 1) == 0)
    {
      while ((uint64_t)objc_msgSend(v10, "row", v28) >= 1)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v10, "row") - 1, objc_msgSend(v10, "section")));

        v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v11));
        v9 = v12;
        v10 = v11;
        if (objc_msgSend(v12, "selectable"))
          goto LABEL_6;
      }
    }
    v11 = v10;
    v12 = v9;
LABEL_6:
    if ((objc_msgSend(v12, "selectable", v28) & 1) == 0)
    {
      v23 = sub_1004318FC();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315906;
        v32 = "-[TransitDirectionsStepsListDataSource _additionalSelectionIndexPathsForIndexPath:]";
        v33 = 2080;
        v34 = "TransitDirectionsStepsListDataSource.m";
        v35 = 1024;
        v36 = 2349;
        v37 = 2080;
        v38 = "currentTransitItem.selectable";
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s [%s:%d] Assertion: (%s)", buf, 0x26u);
      }

      if (sub_100A70734())
      {
        v25 = sub_1004318FC();
        v26 = objc_claimAutoreleasedReturnValue(v25);
        if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        {
          v27 = (char *)objc_claimAutoreleasedReturnValue(+[NSThread callStackSymbols](NSThread, "callStackSymbols"));
          *(_DWORD *)buf = 138412290;
          v32 = v27;
          _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);

        }
      }
    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
    v14 = objc_msgSend(v13, "numberOfItemsInSection:", objc_msgSend(v11, "section"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v11, "row") + 1, objc_msgSend(v11, "section")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v15));

    if ((uint64_t)objc_msgSend(v15, "row") < (uint64_t)v14)
    {
      while (1)
      {
        v17 = objc_opt_class(TransitDirectionsListItem);
        if ((objc_opt_isKindOfClass(v16, v17) & 1) == 0
          || (objc_msgSend(v16, "selectable") & 1) != 0
          || objc_msgSend(v16, "type") == (id)7)
        {
          break;
        }
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _flatIndexFromIndexPath:](self, "_flatIndexFromIndexPath:", v15));
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", objc_msgSend(v18, "row"), objc_msgSend(v4, "section")));
        objc_msgSend(v7, "addObject:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", (char *)objc_msgSend(v18, "row") + 1, objc_msgSend(v18, "section")));
        v21 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v20));

        v16 = v21;
        v15 = v20;
        if ((uint64_t)objc_msgSend(v20, "row") >= (uint64_t)v14)
          goto LABEL_14;
      }
    }
    v20 = v15;
    v21 = v16;
LABEL_14:

    v6 = v29;
    v5 = v30;
  }

  return v7;
}

- (BOOL)_shouldHighlightItemAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  void *v13;
  void *v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v5));
  v7 = objc_opt_class(TransitDirectionsListItem);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
    v8 = v6;
  else
    v8 = 0;
  v9 = v8;
  v10 = v9;
  if (!v9)
  {
    if (-[TransitDirectionsStepsListDataSource allowsStepSelection](self, "allowsStepSelection"))
      objc_msgSend(v6, "isEqual:", CFSTR("TransitDirectionsListSharingIdentifier"));
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if (objc_msgSend(v9, "type") == (id)7
    || objc_msgSend(v10, "type") == (id)13
    || !-[TransitDirectionsStepsListDataSource allowsStepSelection](self, "allowsStepSelection"))
  {
    goto LABEL_14;
  }
  if (!objc_msgSend(v10, "type"))
  {
    v11 = -[TransitDirectionsStepsListDataSource allowsStepSelection](self, "allowsStepSelection");
    goto LABEL_15;
  }
  if ((objc_msgSend(v6, "isEqual:", CFSTR("TransitDirectionsListSharingIdentifier")) & 1) != 0)
    goto LABEL_14;
  if ((objc_msgSend(v10, "selectable") & 1) != 0)
  {
    v11 = 1;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _additionalSelectionIndexPathsForIndexPath:](self, "_additionalSelectionIndexPathsForIndexPath:", v4));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
    if (objc_msgSend(v14, "compare:", v4) == (id)-1)
      v11 = -[TransitDirectionsStepsListDataSource _shouldHighlightItemAtIndexPath:](self, "_shouldHighlightItemAtIndexPath:", v14);
    else
      v11 = 0;

  }
LABEL_15:

  return v11;
}

- (BOOL)shouldShowSeparatorForItemAtIndexPath:(id)a3 insets:(NSDirectionalEdgeInsets *)a4
{
  id v6;
  CGFloat leading;
  CGFloat top;
  CGFloat bottom;
  double trailing;
  void *v11;
  void *v12;
  uint64_t v13;
  unint64_t v14;
  void *v15;
  char *v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  char *v25;
  char *v26;
  unsigned __int8 v27;
  unsigned int v28;
  uint64_t v29;
  uint64_t v30;
  BOOL v31;
  double v32;
  double v33;
  double v34;
  unint64_t v36;
  uint64_t v37;
  void *v38;

  v6 = a3;
  top = a4->top;
  leading = a4->leading;
  bottom = a4->bottom;
  trailing = a4->trailing;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v6));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource listItemForIndexPath:](self, "listItemForIndexPath:", v11));
  v13 = objc_opt_class(TransitDirectionsListItem);
  if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
  {
    v14 = -[TransitDirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
    v16 = (char *)objc_msgSend(v15, "numberOfItemsInSection:", objc_msgSend(v11, "section"));

    v17 = v12;
    v36 = v14;
    v38 = v6;
    if ((-[TransitDirectionsStepsListDataSource _stepViewDisplayOptionsForSection:](self, "_stepViewDisplayOptionsForSection:", objc_msgSend(v11, "section")) & 4) != 0)
    {
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "nextItem"));
      if (v18)
      {
        v19 = (void *)v18;
        do
        {
          v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "parentItem", v36));
          if ((id)v20 == v17)
          {

          }
          else
          {
            v21 = (void *)v20;
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "parentItem"));
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "parentItem"));

            if (v22 != v23)
              break;
          }
          v16 -= objc_msgSend(v19, "shouldHideInExpandedDisplayStyle");
          v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "nextItem"));

          v19 = (void *)v24;
        }
        while (v24);

      }
    }
    v25 = v16 - 1;
    v26 = (char *)objc_msgSend(v11, "row", v36);
    LOBYTE(v16) = v16 - 1 == v26;
    v27 = -[TransitDirectionsStepsListDataSource options](self, "options");
    v28 = -[TransitDirectionsStepsListDataSource _supportsFooterItem](self, "_supportsFooterItem");
    if ((v27 & 8) != 0 && v25 == v26)
    {
      v29 = -2;
      if (!v28)
        v29 = -1;
      v6 = v38;
      if ((id)(v29 + v37) == objc_msgSend(v38, "section"))
      {
        LOBYTE(v16) = 1;
      }
      else
      {
        -[TransitDirectionsStepsListDataSource leadingInstructionMargin](self, "leadingInstructionMargin");
        leading = v34;
        LOBYTE(v16) = 1;
        trailing = 16.0;
      }
    }
    else
    {
      if ((v27 & 8) != 0 || v25 != v26)
      {
        -[TransitDirectionsStepsListDataSource leadingInstructionMargin](self, "leadingInstructionMargin");
        leading = v33;
      }
      else
      {
        v31 = v37 - 1 == (_QWORD)objc_msgSend(v11, "section");
        -[TransitDirectionsStepsListDataSource leadingInstructionMargin](self, "leadingInstructionMargin");
        leading = v32;
        LOBYTE(v16) = !v31;
      }
      trailing = 16.0;
      v6 = v38;
    }

  }
  else
  {
    v30 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v12, v30) & 1) != 0)
      LODWORD(v16) = objc_msgSend(v12, "isEqualToString:", CFSTR("TransitDirectionsListSharingIdentifier")) ^ 1;
    else
      LOBYTE(v16) = 1;
  }
  a4->top = top;
  a4->leading = leading;
  a4->bottom = bottom;
  a4->trailing = trailing;

  return (char)v16;
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  void *v9;
  char v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  char v17;
  void *v18;
  id v19;

  y = a4.y;
  x = a4.x;
  v19 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
  v10 = objc_opt_respondsToSelector(v9, "currentUITargetForAnalytics");

  if ((v10 & 1) != 0)
  {
    if (y <= 0.0)
      v11 = 7;
    else
      v11 = 8;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource delegate](self, "delegate"));
    v14 = objc_msgSend(v13, "currentUITargetForAnalytics");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedItemIndexForAnalytics](self, "displayedItemIndexForAnalytics"));
    objc_msgSend(v12, "captureUserAction:onTarget:eventValue:transitStep:", v11, v14, 0, v15);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource scrollViewDelegate](self, "scrollViewDelegate"));
  v17 = objc_opt_respondsToSelector(v16, "scrollViewWillEndDragging:withVelocity:targetContentOffset:");

  if ((v17 & 1) != 0)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource scrollViewDelegate](self, "scrollViewDelegate"));
    objc_msgSend(v18, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v19, a5, x, y);

  }
}

- (void)scrollViewDidScroll:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource scrollViewDelegate](self, "scrollViewDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "scrollViewDidScroll:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource scrollViewDelegate](self, "scrollViewDelegate"));
    objc_msgSend(v6, "scrollViewDidScroll:", v7);

  }
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource scrollViewDelegate](self, "scrollViewDelegate"));
  v5 = objc_opt_respondsToSelector(v4, "scrollViewWillBeginDragging:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource scrollViewDelegate](self, "scrollViewDelegate"));
    objc_msgSend(v6, "scrollViewWillBeginDragging:", v7);

  }
}

- (BOOL)pptTestSupportStepping
{
  return 1;
}

- (int64_t)pptTestCurrentStepIndex
{
  void *v2;
  void *v3;
  int64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedTransitDirectionsListItemIndexPath](self, "displayedTransitDirectionsListItemIndexPath"));
  v3 = v2;
  if (v2)
    v4 = (int64_t)objc_msgSend(v2, "section");
  else
    v4 = 0x7FFFFFFFFFFFFFFFLL;

  return v4;
}

- (BOOL)pptTestHasNextStep
{
  void *v3;
  void *v4;
  id v5;
  BOOL v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource displayedTransitDirectionsListItemIndexPath](self, "displayedTransitDirectionsListItemIndexPath"));
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "section");
    v6 = v5 < (id)-[TransitDirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections");
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)pptTestMoveToNextStep
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  if (-[TransitDirectionsStepsListDataSource pptTestHasNextStep](self, "pptTestHasNextStep"))
  {
    v3 = -[TransitDirectionsStepsListDataSource pptTestCurrentStepIndex](self, "pptTestCurrentStepIndex");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", 0, v3 + 1));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "itemAtIndexPath:", v5));

    v6 = v7;
    if (v7)
    {
      -[DirectionsStepsListNavigationProvider setDisplayedStepIndex:](self->_navigationProvider, "setDisplayedStepIndex:", objc_msgSend(v7, "matchingRouteStepIndex"));
      v6 = v7;
    }

  }
}

- (BOOL)pptTestMoveToBoardStep
{
  int64_t v3;
  BOOL v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = -[TransitDirectionsStepsListDataSource pptTestCurrentStepIndex](self, "pptTestCurrentStepIndex");
  if (v3 == 0x7FFFFFFFFFFFFFFFLL)
    return 0;
  v5 = v3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "items"));

  while (v5 < (unint64_t)objc_msgSend(v7, "count"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", v5));
    if (objc_msgSend(v8, "type") == (id)2)
    {
      if (v8)
      {
        -[DirectionsStepsListNavigationProvider setDisplayedStepIndex:](self->_navigationProvider, "setDisplayedStepIndex:", objc_msgSend(v8, "matchingRouteStepIndex"));

        v4 = 1;
        goto LABEL_10;
      }
      break;
    }

    ++v5;
  }
  v4 = 0;
LABEL_10:

  return v4;
}

- (TransitDirectionsStepsListDelegate)delegate
{
  return (TransitDirectionsStepsListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (unint64_t)options
{
  return self->_options;
}

- (BOOL)shouldFlattenToSingleSection
{
  return self->_flattenToSingleSection;
}

- (NSIndexPath)displayedItemIndexPath
{
  return self->_displayedItemIndexPath;
}

- (BOOL)allowsStepSelection
{
  return self->_allowStepSelection;
}

- (void)setAllowStepSelection:(BOOL)a3
{
  self->_allowStepSelection = a3;
}

- (UIScrollViewDelegate)scrollViewDelegate
{
  return (UIScrollViewDelegate *)objc_loadWeakRetained((id *)&self->_scrollViewDelegate);
}

- (void)setScrollViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_scrollViewDelegate, a3);
}

- (UITableView)tableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_tableView);
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (id)reloadHandler
{
  return self->_reloadHandler;
}

- (void)setReloadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (BOOL)enableNavigationUpdates
{
  return self->_enableNavigationUpdates;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (double)leadingInstructionMargin
{
  return self->_transitDirectionsListInstructionsLeadingInset;
}

- (BOOL)isActive
{
  return self->_active;
}

- (TransitDirectionsListView)listView
{
  return (TransitDirectionsListView *)objc_loadWeakRetained((id *)&self->_listView);
}

- (unint64_t)highlightingBehaviour
{
  return self->_highlightingBehaviour;
}

- (void)setHighlightingBehaviour:(unint64_t)a3
{
  self->_highlightingBehaviour = a3;
}

- (unint64_t)activeComposedRouteStepIndex
{
  return self->_activeComposedRouteStepIndex;
}

- (unint64_t)displayedComposedRouteStepIndex
{
  return self->_displayedComposedRouteStepIndex;
}

- (BOOL)automaticallyScrollToDisplayedStep
{
  return self->_automaticallyScrollToDisplayedStep;
}

- (void)setAutomaticallyScrollToDisplayedStep:(BOOL)a3
{
  self->_automaticallyScrollToDisplayedStep = a3;
}

- (BOOL)useCollapsedDisplayStyle
{
  return self->_useCollapsedDisplayStyle;
}

- (void)setEstimatedHeightsByItem:(id)a3
{
  objc_storeStrong((id *)&self->_estimatedHeightsByItem, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_estimatedHeightsByItem, 0);
  objc_destroyWeak((id *)&self->_listView);
  objc_storeStrong((id *)&self->_route, 0);
  objc_storeStrong(&self->_reloadHandler, 0);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong((id *)&self->_matchedLocationThrottler, 0);
  objc_storeStrong((id *)&self->_displayedItemIndexPath, 0);
  objc_storeStrong((id *)&self->_activeItemIndexPath, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_navigationProvider, 0);
  objc_storeStrong((id *)&self->_dataProvider, 0);
  objc_storeStrong((id *)&self->_referenceDateUpdater, 0);
  objc_storeStrong((id *)&self->_clusteredRideUpdateThrottler, 0);
  objc_storeStrong(&self->_reloadTableCompletionBlock, 0);
}

- (NSArray)_transitDirectionsListItems
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[TransitDirectionsStepsListDataSource dataProvider](self, "dataProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "items"));

  return (NSArray *)v3;
}

@end
