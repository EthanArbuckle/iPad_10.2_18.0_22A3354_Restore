@implementation CarDestinationsCardViewController

- (CarDestinationsCardViewController)initWithDelegate:(id)a3
{
  id v4;
  CarDestinationsCardViewController *v5;
  CarDestinationsCardViewController *v6;
  void *v7;
  RecentsDataFilter *v8;
  RecentsDataFilter *recentsDataFilter;
  RecentsDataProvider *v10;
  RecentsDataProvider *recentsDataProvider;
  MarkedLocationDataProvider *v12;
  MarkedLocationDataProvider *markedLocationDataProvider;
  SharedTripsDataProvider *v14;
  SharedTripsDataProvider *sharedTripsDataProvider;
  void *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  objc_super v27;
  _BYTE v28[128];

  v4 = a3;
  v27.receiver = self;
  v27.super_class = (Class)CarDestinationsCardViewController;
  v5 = -[CarBaseSearchViewController initWithDisabledETAUpdates:](&v27, "initWithDisabledETAUpdates:", 0);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", &stru_1011E0A98));
    v8 = -[RecentsDataFilter initWithSearchMode:filterPredicate:]([RecentsDataFilter alloc], "initWithSearchMode:filterPredicate:", 1, v7);
    recentsDataFilter = v6->_recentsDataFilter;
    v6->_recentsDataFilter = v8;

    v10 = objc_alloc_init(RecentsDataProvider);
    recentsDataProvider = v6->_recentsDataProvider;
    v6->_recentsDataProvider = v10;

    v12 = objc_alloc_init(MarkedLocationDataProvider);
    markedLocationDataProvider = v6->_markedLocationDataProvider;
    v6->_markedLocationDataProvider = v12;

    v14 = -[SharedTripsDataProvider initWithCombineAllTrips:]([SharedTripsDataProvider alloc], "initWithCombineAllTrips:", 1);
    sharedTripsDataProvider = v6->_sharedTripsDataProvider;
    v6->_sharedTripsDataProvider = v14;

    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController _allDataProviders](v6, "_allDataProviders", 0));
    v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    if (v17)
    {
      v18 = v17;
      v19 = *(_QWORD *)v24;
      do
      {
        v20 = 0;
        do
        {
          if (*(_QWORD *)v24 != v19)
            objc_enumerationMutation(v16);
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v20), "observers"));
          objc_msgSend(v21, "registerObserver:", v6);

          v20 = (char *)v20 + 1;
        }
        while (v18 != v20);
        v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      }
      while (v18);
    }

    v6->_focusMovedFromFirstRow = 0;
  }

  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  CarTableView *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;

  v31.receiver = self;
  v31.super_class = (Class)CarDestinationsCardViewController;
  -[CarDestinationsCardViewController viewDidLoad](&v31, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController view](self, "view"));
  objc_msgSend(v3, "setAccessibilityIdentifier:", CFSTR("CarDestinationsCard"));

  v4 = -[CarTableView initWithFrame:]([CarTableView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[CarBaseSearchViewController setTableView:](self, "setTableView:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setAccessibilityIdentifier:", CFSTR("CarDestinationsCardTableView"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  LODWORD(v8) = 1148846080;
  objc_msgSend(v7, "setContentCompressionResistancePriority:forAxis:", 0, v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  LODWORD(v10) = 1148846080;
  objc_msgSend(v9, "setContentCompressionResistancePriority:forAxis:", 1, v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setDataSource:", self);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setDelegate:", self);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v14, "setBackgroundColor:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v15, "_setHeaderAndFooterViewsFloat:", 0);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v16, "setRowHeight:", 44.0);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  v18 = objc_opt_class(CarSearchCategoryCell);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchCategoryCell reuseIdentifier](CarSearchCategoryCell, "reuseIdentifier"));
  objc_msgSend(v17, "registerClass:forCellReuseIdentifier:", v18, v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  v21 = objc_opt_class(CarSearchItemCell);
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchItemCell reuseIdentifier](CarSearchItemCell, "reuseIdentifier"));
  objc_msgSend(v20, "registerClass:forCellReuseIdentifier:", v21, v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  v24 = objc_opt_class(CarDestinationsTableHeaderView);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[CarDestinationsTableHeaderView reuseIdentifier](CarDestinationsTableHeaderView, "reuseIdentifier"));
  objc_msgSend(v23, "registerClass:forHeaderFooterViewReuseIdentifier:", v24, v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController view](self, "view"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v26, "addSubview:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController view](self, "view"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "_maps_constraintsForCenteringInView:", v29));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v30);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v15.receiver = self;
  v15.super_class = (Class)CarDestinationsCardViewController;
  -[CarBaseSearchViewController viewWillAppear:](&v15, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapsSuggestionsController"));
  objc_msgSend(v5, "registerObserver:", self);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController _allDataProviders](self, "_allDataProviders", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setActive:", 1);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

  -[CarDestinationsCardViewController _reloadData](self, "_reloadData");
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CarDestinationsCardViewController;
  -[CarBaseSearchViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("PPTMyRecentsViewControllerDidAppearNotification"), self, 0);
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  objc_super v15;
  _BYTE v16[128];

  v15.receiver = self;
  v15.super_class = (Class)CarDestinationsCardViewController;
  -[CarBaseSearchViewController viewWillDisappear:](&v15, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "mapsSuggestionsController"));
  objc_msgSend(v5, "unregisterObserver:", self);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController _allDataProviders](self, "_allDataProviders", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "setActive:", 0);
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

}

- (void)_prepareQuickRouteETAsIfNeeded
{
  if (!self->_batchingUpdates && self->_refreshQuickRouteManagers)
  {
    -[CarBaseSearchViewController prepareQuickRouteETAs](self, "prepareQuickRouteETAs");
    self->_refreshQuickRouteManagers = 0;
  }
}

- (id)_allDataProviders
{
  RecentsDataProvider *recentsDataProvider;
  _QWORD v4[3];

  recentsDataProvider = self->_recentsDataProvider;
  v4[0] = self->_sharedTripsDataProvider;
  v4[1] = recentsDataProvider;
  v4[2] = self->_markedLocationDataProvider;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v4, 3));
}

- (void)_beginUpdates
{
  id v2;

  if (!self->_batchingUpdates)
  {
    self->_batchingUpdates = 1;
    v2 = (id)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
    objc_msgSend(v2, "beginUpdates");

  }
}

- (void)_endUpdates
{
  id v3;

  self->_batchingUpdates = 0;
  -[CarDestinationsCardViewController _prepareQuickRouteETAsIfNeeded](self, "_prepareQuickRouteETAsIfNeeded");
  v3 = (id)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v3, "endUpdates");

}

- (void)_reloadData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (!self->_batchingUpdates)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "mapsSuggestionsController"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "suggestions"));
    -[CarDestinationsCardViewController setSuggestions:reload:](self, "setSuggestions:reload:", v5, 0);

    -[CarDestinationsCardViewController _reloadSharedTrips](self, "_reloadSharedTrips");
    -[CarDestinationsCardViewController _reloadRecents](self, "_reloadRecents");
    -[CarDestinationsCardViewController _prepareQuickRouteETAsIfNeeded](self, "_prepareQuickRouteETAsIfNeeded");
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CollectionManager sharedManager](CollectionManager, "sharedManager"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "currentCollectionsForCarPlay"));
    self->_showCollectionsEntry = objc_msgSend(v7, "count") != 0;

    v8 = (id)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
    objc_msgSend(v8, "reloadData");

  }
}

- (void)_reloadSection:(int64_t)a3
{
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", a3));
  if (!self->_batchingUpdates)
    -[CarDestinationsCardViewController _prepareQuickRouteETAsIfNeeded](self, "_prepareQuickRouteETAsIfNeeded");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  objc_msgSend(v4, "reloadSections:withRowAnimation:", v5, 100);

}

- (void)_reloadSharedTrips
{
  void *v3;
  void *v4;
  unint64_t v5;
  unint64_t v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsDataProvider sharedTripSummaries](self->_sharedTripsDataProvider, "sharedTripSummaries"));
  v5 = v3;
  v6 = v4;
  if (v5 | v6)
  {
    v7 = (void *)v6;
    v8 = objc_msgSend((id)v5, "isEqual:", v6);

    if ((v8 & 1) == 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[SharedTripsDataProvider sharedTripSummaries](self->_sharedTripsDataProvider, "sharedTripSummaries"));
      -[CarDestinationsCardViewController setSharedTripSummaries:](self, "setSharedTripSummaries:", v9);

      -[CarDestinationsCardViewController _reloadSection:](self, "_reloadSection:", 0);
    }
  }
}

- (void)_reloadRecents
{
  void *v3;
  unsigned __int8 v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController recents](self, "recents"));
  -[CarDestinationsCardViewController _buildRecents](self, "_buildRecents");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController recents](self, "recents"));
  if (objc_msgSend(v3, "isEqualToArray:", v6))
  {
    v4 = -[CarDestinationsCardViewController _shouldUpdateSection:](self, "_shouldUpdateSection:", 1);

    if ((v4 & 1) == 0)
      goto LABEL_8;
  }
  else
  {

  }
  self->_refreshQuickRouteManagers = 1;
  if (self->_needReloadSuggestionSection)
  {
    self->_needReloadSuggestionSection = 0;
    -[CarDestinationsCardViewController _prepareQuickRouteETAsIfNeeded](self, "_prepareQuickRouteETAsIfNeeded");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
    objc_msgSend(v5, "reloadData");

  }
  else
  {
    -[CarDestinationsCardViewController _reloadSection:](self, "_reloadSection:", 1);
  }
LABEL_8:

}

- (void)_buildRecents
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MarkedLocationDataProvider markedLocation](self->_markedLocationDataProvider, "markedLocation"));
  if (v3)
    objc_msgSend(v7, "addObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataProvider recents](self->_recentsDataProvider, "recents"));
  objc_msgSend(v7, "addObjectsFromArray:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RecentsDataFilter filteredRecents:excludingDuplicatesOfEntries:](self->_recentsDataFilter, "filteredRecents:excludingDuplicatesOfEntries:", v7, self->_suggestions));
  v6 = objc_msgSend(v5, "copy");
  -[CarDestinationsCardViewController setRecents:](self, "setRecents:", v6);

}

- (void)homeDataProvidingObjectDidUpdate:(id)a3
{
  if (self->_sharedTripsDataProvider == a3)
    -[CarDestinationsCardViewController _reloadSharedTrips](self, "_reloadSharedTrips");
  else
    -[CarDestinationsCardViewController _reloadRecents](self, "_reloadRecents");
}

- (id)uniqueName
{
  return objc_msgSend((id)objc_opt_class(self), "description");
}

- (void)setSuggestions:(id)a3 reload:(BOOL)a4
{
  _BOOL4 v4;
  NSArray *v7;
  id v8;
  NSObject *v9;
  NSUInteger v10;
  NSUInteger v11;
  __CFString *v12;
  __CFString *v13;
  int v14;
  NSUInteger v15;
  __int16 v16;
  NSUInteger v17;
  __int16 v18;
  __CFString *v19;

  v4 = a4;
  v7 = (NSArray *)a3;
  if (self->_suggestions != v7)
  {
    v8 = sub_10043364C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v10 = -[NSArray count](self->_suggestions, "count");
      v11 = -[NSArray count](v7, "count");
      v12 = CFSTR("NO");
      if (v4)
        v12 = CFSTR("YES");
      v13 = v12;
      v14 = 134218498;
      v15 = v10;
      v16 = 2048;
      v17 = v11;
      v18 = 2112;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Destinations: suggestions changed. before: %ld, after: %ld, reload: %@", (uint8_t *)&v14, 0x20u);

    }
    if (v4)
    {
      -[CarDestinationsCardViewController _beginUpdates](self, "_beginUpdates");
      objc_storeStrong((id *)&self->_suggestions, a3);
      -[CarDestinationsCardViewController _reloadSection:](self, "_reloadSection:", 0);
      -[CarDestinationsCardViewController _reloadRecents](self, "_reloadRecents");
      -[CarDestinationsCardViewController _endUpdates](self, "_endUpdates");
      if (!self->_focusMovedFromFirstRow)
        -[CarDestinationsCardViewController setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
    }
    else
    {
      self->_needReloadSuggestionSection = 1;
      objc_storeStrong((id *)&self->_suggestions, a3);
      -[CarDestinationsCardViewController _reloadRecents](self, "_reloadRecents");
    }
  }

}

- (void)setSuggestions:(id)a3
{
  -[CarDestinationsCardViewController setSuggestions:reload:](self, "setSuggestions:reload:", a3, 1);
}

- (BOOL)_shouldChangeToSuggestionEntries:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned __int8 v16;
  void *v17;
  id v18;
  char v19;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController suggestions](self, "suggestions"));
  v6 = objc_msgSend(v5, "count");
  v7 = objc_msgSend(v4, "count");

  if (v6 == v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController suggestions](self, "suggestions"));
    v9 = objc_msgSend(v8, "count");

    if (v9)
    {
      v10 = 0;
      do
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController suggestions](self, "suggestions"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectAtIndexedSubscript:", v10));

        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", v10));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueIdentifier"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "uniqueIdentifier"));
        v16 = objc_msgSend(v14, "isEqualToString:", v15);

        if ((v16 & 1) == 0)
          break;
        ++v10;
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController suggestions](self, "suggestions"));
        v18 = objc_msgSend(v17, "count");

      }
      while (v10 < (unint64_t)v18);
      v19 = v16 ^ 1;
    }
    else
    {
      v19 = 0;
    }
  }
  else
  {
    v19 = 1;
  }

  return v19;
}

- (void)carMapsSuggestionControllerDidRefresh:(id)a3
{
  void *v4;
  unsigned int v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suggestions"));
  v5 = -[CarDestinationsCardViewController _shouldChangeToSuggestionEntries:](self, "_shouldChangeToSuggestionEntries:", v4);

  if (v5)
  {
    self->_refreshQuickRouteManagers = 1;
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "suggestions"));
    -[CarDestinationsCardViewController setSuggestions:](self, "setSuggestions:", v6);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 3;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  unint64_t siriSuggestionsCount;
  void *v7;
  char *v8;

  -[CarDestinationsCardViewController _refreshNumberOfRowsInSection](self, "_refreshNumberOfRowsInSection", a3);
  if (a4 == 2)
    return self->_showCollectionsEntry;
  if (a4 == 1)
    return self->_recentsCount;
  if (a4)
    return 0;
  siriSuggestionsCount = self->_siriSuggestionsCount;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
  v8 = (char *)objc_msgSend(v7, "count") + siriSuggestionsCount;

  return (int64_t)v8;
}

- (BOOL)_shouldUpdateSection:(int64_t)a3
{
  unint64_t *p_recentsCount;
  unint64_t recentsCount;
  unint64_t *p_siriSuggestionsCount;
  unint64_t siriSuggestionsCount;

  p_recentsCount = &self->_recentsCount;
  recentsCount = self->_recentsCount;
  p_siriSuggestionsCount = &self->_siriSuggestionsCount;
  siriSuggestionsCount = self->_siriSuggestionsCount;
  -[CarDestinationsCardViewController _refreshNumberOfRowsInSection](self, "_refreshNumberOfRowsInSection");
  if (!a3)
    return *p_siriSuggestionsCount != siriSuggestionsCount;
  if (a3 == 1)
  {
    p_siriSuggestionsCount = p_recentsCount;
    siriSuggestionsCount = recentsCount;
    return *p_siriSuggestionsCount != siriSuggestionsCount;
  }
  return 1;
}

- (void)_refreshNumberOfRowsInSection
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  unint64_t *p_siriSuggestionsCount;
  id v12;
  unint64_t v13;
  void *v14;
  id v15;

  v3 = +[CarDisplayController maximumListLength](CarDisplayController, "maximumListLength");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
  v5 = v3 - (_QWORD)objc_msgSend(v4, "count");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController recents](self, "recents"));
  if (v5 - (unint64_t)objc_msgSend(v6, "count") < 4)
  {
    v8 = 3;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController recents](self, "recents"));
    v8 = v5 - (_QWORD)objc_msgSend(v7, "count");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController suggestions](self, "suggestions"));
  if ((unint64_t)objc_msgSend(v9, "count") >= v8)
  {
    p_siriSuggestionsCount = &self->_siriSuggestionsCount;
    self->_siriSuggestionsCount = v8;
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController suggestions](self, "suggestions"));
    p_siriSuggestionsCount = &self->_siriSuggestionsCount;
    self->_siriSuggestionsCount = (unint64_t)objc_msgSend(v10, "count");

  }
  v15 = (id)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController recents](self, "recents"));
  v12 = objc_msgSend(v15, "count");
  v13 = v5 - *p_siriSuggestionsCount;
  if ((unint64_t)v12 >= v13)
  {
    self->_recentsCount = v13;
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController recents](self, "recents"));
    self->_recentsCount = (unint64_t)objc_msgSend(v14, "count");

  }
}

- (id)_titleForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  const __CFString *v7;
  __CFString *v8;

  switch(a3)
  {
    case 2:
      v8 = &stru_1011EB268;
      break;
    case 1:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController recents](self, "recents"));
      if (objc_msgSend(v4, "count"))
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("CarDestinations_DestinationsHeader_Recents");
        goto LABEL_9;
      }
LABEL_11:
      v8 = 0;
      goto LABEL_12;
    case 0:
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
      if (-[CarDestinationsCardViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v4, 0) >= 1)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v6 = v5;
        v7 = CFSTR("CarDestinations_DestinationsHeader_Suggestions");
LABEL_9:
        v8 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", v7, CFSTR("localized string not found"), 0));

LABEL_12:
        return v8;
      }
      goto LABEL_11;
    default:
      v8 = 0;
      break;
  }
  return v8;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  double v4;
  void *v7;

  v4 = 0.0;
  if ((unint64_t)a4 <= 1)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView", a3));
    if (-[CarDestinationsCardViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v7, a4) <= 0)v4 = 0.0;
    else
      v4 = 17.0;

  }
  return v4;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v6;
  int64_t v7;
  double v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView", a3));
  v7 = -[CarDestinationsCardViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v6, a4);

  v8 = 0.0;
  if ((unint64_t)a4 <= 1 && v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
    v10 = -[CarDestinationsCardViewController numberOfSectionsInTableView:](self, "numberOfSectionsInTableView:", v9);

    do
    {
      v11 = a4++;
      if (a4 >= v10)
        break;
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
      v13 = -[CarDestinationsCardViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v12, a4);

    }
    while (v13 < 1);
    if (v11 <= 1)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController _titleForSection:](self, "_titleForSection:", a4));
      if (objc_msgSend(v14, "length"))
        v8 = 3.0;
      else
        v8 = 10.0;

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
      v16 = -[CarDestinationsCardViewController tableView:numberOfRowsInSection:](self, "tableView:numberOfRowsInSection:", v15, a4);

      if (v16 <= 0)
        return 0.0;
    }
  }
  return v8;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController _titleForSection:](self, "_titleForSection:", a4));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableHeaderFooterViewWithIdentifier:", CFSTR("TableHeaderViewReuseIdentifier")));
    objc_msgSend(v8, "setAccessibilityIdentifier:", CFSTR("CarDestinationsTableHeader"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "titleLabel"));
    objc_msgSend(v9, "setText:", v7);

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4;
  id v5;

  v4 = objc_alloc_init((Class)UITableViewHeaderFooterView);
  v5 = objc_alloc_init((Class)UIView);
  objc_msgSend(v4, "setBackgroundView:", v5);

  return v4;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  if ((unint64_t)objc_msgSend(v7, "section") > 1)
  {
    v9 = 44.0;
  }
  else
  {
    v11.receiver = self;
    v11.super_class = (Class)CarDestinationsCardViewController;
    -[CarBaseSearchViewController tableView:heightForRowAtIndexPath:](&v11, "tableView:heightForRowAtIndexPath:", v6, v7);
    v9 = v8;
  }

  return v9;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  if (v5 != (id)1)
  {
    if (!v5)
    {
      v6 = objc_msgSend(v4, "row");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
      if (objc_msgSend(v7, "count"))
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
        v9 = objc_msgSend(v8, "count");

        if (v6 < v9)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
LABEL_10:
          v11 = v10;
          v12 = v6;
          goto LABEL_11;
        }
      }
      else
      {

      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
      v6 = (id)((_BYTE *)v6 - (_BYTE *)objc_msgSend(v13, "count"));

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController suggestions](self, "suggestions"));
      v15 = objc_msgSend(v14, "count");

      if (v15 > v6)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController suggestions](self, "suggestions"));
        goto LABEL_10;
      }
    }
    v16 = 0;
    goto LABEL_13;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController recents](self, "recents"));
  v12 = objc_msgSend(v4, "row");
  v10 = v11;
LABEL_11:
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v12));

LABEL_13:
  return v16;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  CarDestinationsCardViewController *v16;
  CarDestinationsCardViewController *v17;
  objc_class *v18;
  NSString *v19;
  void *v20;
  void *v21;
  void *v22;
  __CFString *v23;
  objc_super v25;
  uint8_t buf[4];
  __CFString *v27;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if ((unint64_t)v8 < 2)
  {
    v25.receiver = self;
    v25.super_class = (Class)CarDestinationsCardViewController;
    v9 = -[CarBaseSearchViewController tableView:cellForRowAtIndexPath:](&v25, "tableView:cellForRowAtIndexPath:", v6, v7);
    v10 = (id)objc_claimAutoreleasedReturnValue(v9);
LABEL_17:
    v12 = v10;
    goto LABEL_18;
  }
  if (v8 != (id)2)
  {
    v13 = sub_10043364C();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v16 = self;
    v17 = v16;
    if (!v16)
    {
      v23 = CFSTR("<nil>");
      goto LABEL_15;
    }
    v18 = (objc_class *)objc_opt_class(v16);
    v19 = NSStringFromClass(v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    if ((objc_opt_respondsToSelector(v17, "accessibilityIdentifier") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController performSelector:](v17, "performSelector:", "accessibilityIdentifier"));
      v22 = v21;
      if (v21 && !objc_msgSend(v21, "isEqualToString:", v20))
      {
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p, %@>"), v20, v17, v22));

        goto LABEL_13;
      }

    }
    v23 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@<%p>"), v20, v17));
LABEL_13:

LABEL_15:
    *(_DWORD *)buf = 138543362;
    v27 = v23;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "[%{public}@] CarDestinationsCardVC tried to dequeue a cell for invalid section.", buf, 0xCu);

LABEL_16:
    v10 = objc_alloc_init((Class)UITableViewCell);
    goto LABEL_17;
  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[CarSearchCategoryCell reuseIdentifier](CarSearchCategoryCell, "reuseIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v11, v7));

  objc_msgSend(v12, "setupWithSavedPlaces");
LABEL_18:

  return v12;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  _BYTE *v9;
  void *v10;
  void *v11;
  _BYTE *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  int64_t v22;
  void *v23;
  objc_super v24;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "section");
  if (v8 == (id)2)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController delegate](self, "delegate"));
    objc_msgSend(v14, "destinationsCardDidSelectSavedPlaces:", self);
LABEL_12:

    goto LABEL_13;
  }
  if (v8 == (id)1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController delegate](self, "delegate"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController recents](self, "recents"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
    objc_msgSend(v14, "destinationsCard:didSelectRecent:", self, v20);

    goto LABEL_12;
  }
  if (!v8)
  {
    v9 = objc_msgSend(v7, "row");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
    if (objc_msgSend(v10, "count"))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
      v12 = objc_msgSend(v11, "count");

      if (v9 < v12)
      {
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v9));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "_transportTypeStringForAnalytics"));
        +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9003, 738, v15);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController delegate](self, "delegate"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", v9));
        objc_msgSend(v16, "destinationsCard:didSelectRecent:", self, v18);

LABEL_11:
        goto LABEL_12;
      }
    }
    else
    {

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
    v22 = v9 - (_BYTE *)objc_msgSend(v21, "count");

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController delegate](self, "delegate"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController suggestions](self, "suggestions"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectAtIndexedSubscript:", v22));
    objc_msgSend(v14, "destinationsCard:didSelectSuggestion:", self, v23);

    goto LABEL_11;
  }
LABEL_13:
  v24.receiver = self;
  v24.super_class = (Class)CarDestinationsCardViewController;
  -[CarBaseSearchViewController tableView:didSelectRowAtIndexPath:](&v24, "tableView:didSelectRowAtIndexPath:", v6, v7);

}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (objc_msgSend(v10, "section") != (id)2)
  {
    if (!objc_msgSend(v10, "section"))
    {
      v11 = objc_msgSend(v10, "row");
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
      if (!objc_msgSend(v12, "count"))
      {
LABEL_6:

        goto LABEL_7;
      }
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
      v14 = objc_msgSend(v13, "count");

      if (v11 < v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarDestinationsCardViewController sharedTripSummaries](self, "sharedTripSummaries"));
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", v11));

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "_transportTypeStringForAnalytics"));
        +[GEOAPPortal captureUserAction:target:value:](GEOAPPortal, "captureUserAction:target:value:", 9002, 738, v16);

        goto LABEL_6;
      }
    }
LABEL_7:
    v17.receiver = self;
    v17.super_class = (Class)CarDestinationsCardViewController;
    -[CarBaseSearchViewController tableView:willDisplayCell:forRowAtIndexPath:](&v17, "tableView:willDisplayCell:forRowAtIndexPath:", v8, v9, v10);
  }

}

- (void)tableView:(id)a3 didUpdateFocusInContext:(id)a4 withAnimationCoordinator:(id)a5
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "nextFocusedIndexPath", a3));
  self->_focusMovedFromFirstRow |= objc_msgSend(v6, "row") != 0;

}

- (NSArray)focusOrderSubItems
{
  void *v3;
  void *v4;

  if (-[CarDestinationsCardViewController isViewLoaded](self, "isViewLoaded"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "_car_visibleCells"));

  }
  else
  {
    v4 = &__NSArray0__struct;
  }
  return (NSArray *)v4;
}

- (NSArray)preferredFocusEnvironments
{
  void *v3;
  void *v4;
  void *v6;

  if (!-[CarDestinationsCardViewController isViewLoaded](self, "isViewLoaded"))
    return (NSArray *)&__NSArray0__struct;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarBaseSearchViewController tableView](self, "tableView"));
  v6 = v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v6, 1));

  return (NSArray *)v4;
}

- (CarDestinationsCardViewControllerDelegate)delegate
{
  return (CarDestinationsCardViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)recents
{
  return self->_recents;
}

- (void)setRecents:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (NSArray)sharedTripSummaries
{
  return self->_sharedTripSummaries;
}

- (void)setSharedTripSummaries:(id)a3
{
  objc_storeStrong((id *)&self->_sharedTripSummaries, a3);
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (unint64_t)siriSuggestionsCount
{
  return self->_siriSuggestionsCount;
}

- (void)setSiriSuggestionsCount:(unint64_t)a3
{
  self->_siriSuggestionsCount = a3;
}

- (unint64_t)recentsCount
{
  return self->_recentsCount;
}

- (void)setRecentsCount:(unint64_t)a3
{
  self->_recentsCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_sharedTripSummaries, 0);
  objc_storeStrong((id *)&self->_recents, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_markedLocationDataProvider, 0);
  objc_storeStrong((id *)&self->_sharedTripsDataProvider, 0);
  objc_storeStrong((id *)&self->_recentsDataProvider, 0);
  objc_storeStrong((id *)&self->_recentsDataFilter, 0);
}

@end
