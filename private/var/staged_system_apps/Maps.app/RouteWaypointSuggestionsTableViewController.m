@implementation RouteWaypointSuggestionsTableViewController

- (RouteWaypointSuggestionsTableViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  RouteWaypointSuggestionsTableViewController *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RouteWaypointSuggestionsTableViewController;
  v4 = -[RouteWaypointSuggestionsTableViewController initWithNibName:bundle:](&v7, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v4->_wasLocationServicesApproved = objc_msgSend(v5, "isLocationServicesApproved");
    v4->_wasAuthorizedForPreciseLocation = objc_msgSend(v5, "isAuthorizedForPreciseLocation");

  }
  return v4;
}

- (void)loadView
{
  MapsThemeTableView *v3;

  v3 = objc_alloc_init(MapsThemeTableView);
  -[RouteWaypointSuggestionsTableViewController setView:](self, "setView:", v3);

}

- (void)viewDidLoad
{
  void *v3;
  objc_class *v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  SearchDataSource *v14;
  void *v15;
  SearchDataSource *v16;
  SearchDataSource *acDataSource;
  void *v18;
  RouteNoQueryDataSource *v19;
  void *v20;
  RouteNoQueryDataSource *v21;
  RouteNoQueryDataSource *noQueryDataSource;
  _QWORD v23[5];
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)RouteWaypointSuggestionsTableViewController;
  -[RouteWaypointSuggestionsTableViewController viewDidLoad](&v24, "viewDidLoad");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController view](self, "view"));
  v4 = (objc_class *)objc_opt_class(self);
  v5 = NSStringFromClass(v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByReplacingOccurrencesOfString:withString:", CFSTR("Controller"), &stru_1011EB268));
  objc_msgSend(v3, "setAccessibilityIdentifier:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  objc_msgSend(v9, "setBackgroundColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  objc_msgSend(v10, "setSeparatorStyle:", 1);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  objc_msgSend(v11, "setPreservesSuperviewLayoutMargins:", 1);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  objc_msgSend(v12, "setSectionHeaderTopPadding:", 0.0);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  objc_msgSend(v13, "setAccessibilityIdentifier:", CFSTR("RouteSearchResultsTableView"));

  v14 = [SearchDataSource alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  v16 = -[SearchDataSource initWithTableView:](v14, "initWithTableView:", v15);
  acDataSource = self->_acDataSource;
  self->_acDataSource = v16;

  -[SearchDataSource setSearchMode:](self->_acDataSource, "setSearchMode:", 2);
  -[SearchDataSource setUsePlaceSummary:](self->_acDataSource, "setUsePlaceSummary:", sub_1008974F8());
  -[SearchDataSource setRoutePlanning:](self->_acDataSource, "setRoutePlanning:", 1);
  -[DataSource setDelegate:](self->_acDataSource, "setDelegate:", self);
  -[RouteWaypointSuggestionsTableViewController reconfigureDataSources](self, "reconfigureDataSources");
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_100AEC108;
  v23[3] = &unk_1011B0CC8;
  v23[4] = self;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithBlock:](NSPredicate, "predicateWithBlock:", v23));
  v19 = [RouteNoQueryDataSource alloc];
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  v21 = -[RouteNoQueryDataSource initWithTableView:filterPredicate:](v19, "initWithTableView:filterPredicate:", v20, v18);
  noQueryDataSource = self->_noQueryDataSource;
  self->_noQueryDataSource = v21;

  -[DataSource setDelegate:](self->_noQueryDataSource, "setDelegate:", self);
  -[RouteWaypointSuggestionsTableViewController updateDataSourceHasInput:isEditing:](self, "updateDataSourceHasInput:isEditing:", 0, 0);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  SearchDataSource *v9;
  SearchDataSource *v10;
  unsigned int v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)RouteWaypointSuggestionsTableViewController;
  -[RouteWaypointSuggestionsTableViewController viewDidLayoutSubviews](&v13, "viewDidLayoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController view](self, "view"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  v9 = (SearchDataSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "dataSource"));
  v10 = v9;
  if (v9 == self->_acDataSource)
  {
    v11 = -[SearchDataSource shouldReloadOnHeightChange](v9, "shouldReloadOnHeightChange");

    if (v11)
    {
      if (self->_lastSize.width != v5 || self->_lastSize.height != v7)
      {
        self->_lastSize.width = v5;
        self->_lastSize.height = v7;
        -[RouteWaypointSuggestionsTableViewController reloadSuggestionsTableView](self, "reloadSuggestionsTableView");
      }
    }
  }
  else
  {

  }
}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  void *v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    -[RouteWaypointSuggestionsTableViewController reconfigureDataSources](self, "reconfigureDataSources");
    v5 = obj;
  }

}

- (void)reconfigureDataSources
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
  v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "personalizedItemManagerForRouteSearchTableViewController:", self));

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "userLocationSearchResultForRouteSearchTableViewController:", self));

  -[SearchDataSource setMapPersonalizedItems:](self->_acDataSource, "setMapPersonalizedItems:", v6);
  -[SearchDataSource setUserLocationSearchResult:](self->_acDataSource, "setUserLocationSearchResult:", v5);

}

- (void)updateCategoryDataSource:(BOOL)a3
{
  void *v5;
  void *v6;
  SearchHomeDataSource *v7;
  void *v8;
  SearchHomeDataSource *v9;
  SearchHomeDataSource *browseCategoryDataSource;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setDataSource:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setDelegate:", 0);

  -[SearchDataSource setActive:](self->_acDataSource, "setActive:", 0);
  -[RouteNoQueryDataSource setActive:](self->_noQueryDataSource, "setActive:", 0);
  self->_supportsFullTextSearch = a3;
  v7 = [SearchHomeDataSource alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  v9 = -[SearchHomeDataSource initWithTableView:updateLocation:](v7, "initWithTableView:updateLocation:", v8, 0);
  browseCategoryDataSource = self->_browseCategoryDataSource;
  self->_browseCategoryDataSource = v9;

  -[DataSource setDelegate:](self->_browseCategoryDataSource, "setDelegate:", self);
}

- (void)updateDataSourceHasInput:(BOOL)a3 isEditing:(BOOL)a4
{
  _BOOL4 v4;
  int v5;
  void *v7;
  void *v8;
  unsigned int v9;
  SearchDataSource *acDataSource;
  void *v11;
  SearchDataSource *v12;
  void *v13;
  void *v14;
  RouteNoQueryDataSource *noQueryDataSource;
  void *v16;
  RouteNoQueryDataSource *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  unsigned int v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  v4 = a4;
  v5 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
  v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "selectedSearchFieldItem"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "composedWaypoint"));
  v9 = objc_msgSend(v8, "isServerProvidedWaypoint");

  if (!v4 || (v9 & ~v5) != 0)
  {
    -[SearchDataSource setActive:](self->_acDataSource, "setActive:", 0);
    -[RouteNoQueryDataSource setActive:](self->_noQueryDataSource, "setActive:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
    objc_msgSend(v14, "setDataSource:", 0);

    -[RouteWaypointSuggestionsTableViewController reloadSuggestionsTableView](self, "reloadSuggestionsTableView");
  }
  else if (v5)
  {
    if (!-[DataSource active](self->_acDataSource, "active"))
    {
      -[RouteNoQueryDataSource setActive:](self->_noQueryDataSource, "setActive:", 0);
      acDataSource = self->_acDataSource;
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
      objc_msgSend(v11, "setDelegate:", acDataSource);

      v12 = self->_acDataSource;
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
      objc_msgSend(v13, "setDataSource:", v12);

      -[SearchDataSource setActive:](self->_acDataSource, "setActive:", 1);
      -[RouteWaypointSuggestionsTableViewController updateRowHeightForCurrentDataSource](self, "updateRowHeightForCurrentDataSource");
    }
  }
  else if (!-[DataSource active](self->_noQueryDataSource, "active"))
  {
    -[SearchDataSource setActive:](self->_acDataSource, "setActive:", 0);
    noQueryDataSource = self->_noQueryDataSource;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
    objc_msgSend(v16, "setDelegate:", noQueryDataSource);

    v17 = self->_noQueryDataSource;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
    objc_msgSend(v18, "setDataSource:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    LODWORD(v18) = objc_msgSend(v19, "isLocationServicesApproved");
    v20 = objc_msgSend(v19, "isAuthorizedForPreciseLocation");
    if ((_DWORD)v18)
    {
      v21 = v20;
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
      if ((objc_msgSend(v22, "waypointsIncludeCurrentLocationForRouteSearchTableViewController:", self) & v21) == 1)
      {
        -[RouteNoQueryDataSource setUserLocationSearchResult:](self->_noQueryDataSource, "setUserLocationSearchResult:", 0);
      }
      else
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "userLocationSearchResultForRouteSearchTableViewController:", self));
        -[RouteNoQueryDataSource setUserLocationSearchResult:](self->_noQueryDataSource, "setUserLocationSearchResult:", v24);

      }
    }
    else
    {
      -[RouteNoQueryDataSource setUserLocationSearchResult:](self->_noQueryDataSource, "setUserLocationSearchResult:", 0);
    }
    -[RouteNoQueryDataSource setActive:](self->_noQueryDataSource, "setActive:", 1);
    -[RouteWaypointSuggestionsTableViewController updateRowHeightForCurrentDataSource](self, "updateRowHeightForCurrentDataSource");

  }
}

- (void)updateInputText:(id)a3 traits:(id)a4 source:(int)a5
{
  uint64_t v5;
  id v8;
  SearchDataSource *acDataSource;
  id v10;
  id v11;

  v5 = *(_QWORD *)&a5;
  v11 = a3;
  v8 = a4;
  -[SearchDataSource invalidateDataForFilterChange](self->_acDataSource, "invalidateDataForFilterChange");
  acDataSource = self->_acDataSource;
  if (v8)
  {
    -[SearchDataSource setInputText:traits:source:](acDataSource, "setInputText:traits:source:", v11, v8, v5);
  }
  else
  {
    v10 = -[RouteWaypointSuggestionsTableViewController newTraits](self, "newTraits");
    -[SearchDataSource setInputText:traits:source:](acDataSource, "setInputText:traits:source:", v11, v10, v5);

  }
}

- (void)updateTableViewHeader:(BOOL)a3
{
  -[RouteNoQueryDataSource updateTableViewHeader:](self->_noQueryDataSource, "updateTableViewHeader:", a3);
}

- (void)reset
{
  -[RouteWaypointSuggestionsTableViewController updateDataSourceHasInput:isEditing:](self, "updateDataSourceHasInput:isEditing:", 0, 0);
  -[SearchDataSource reset](self->_acDataSource, "reset");
  -[SearchDataSource invalidateDataForFilterChange](self->_acDataSource, "invalidateDataForFilterChange");
}

- (void)reloadSuggestionsTableView
{
  void *v3;

  -[RouteWaypointSuggestionsTableViewController updateRowHeightForCurrentDataSource](self, "updateRowHeightForCurrentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  objc_msgSend(v3, "reloadData");

  -[RouteWaypointSuggestionsTableViewController _callTableHandlerIfNeeded](self, "_callTableHandlerIfNeeded");
}

- (void)_callTableHandlerIfNeeded
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  _BOOL8 v9;
  void *v10;
  id v11;
  void (**v12)(id, _BOOL8);

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableViewDidReloadHandler](self, "tableViewDidReloadHandler"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
    v5 = (uint64_t)objc_msgSend(v4, "numberOfSections");

    if (v5 < 1)
    {
      v9 = 0;
    }
    else
    {
      v6 = 0;
      do
      {
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
        v8 = (uint64_t)objc_msgSend(v7, "numberOfRowsInSection:", v6);
        v9 = v8 > 0;

        if (v8 >= 1)
          break;
        ++v6;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
        v11 = objc_msgSend(v10, "numberOfSections");

      }
      while (v6 < (uint64_t)v11);
    }
    v12 = (void (**)(id, _BOOL8))objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableViewDidReloadHandler](self, "tableViewDidReloadHandler"));
    v12[2](v12, v9);

  }
}

- (void)updateRowHeightForCurrentDataSource
{
  void *v3;
  SearchDataSource *v4;
  uint64_t v5;
  SearchDataSource *acDataSource;
  void *v7;
  RouteNoQueryDataSource *v8;
  RouteNoQueryDataSource *noQueryDataSource;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  id v15;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  v4 = (SearchDataSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dataSource"));
  v5 = 40;
  acDataSource = self->_acDataSource;

  if (v4 == acDataSource
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView")),
        v8 = (RouteNoQueryDataSource *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dataSource")),
        v5 = 32,
        noQueryDataSource = self->_noQueryDataSource,
        v8,
        v7,
        v8 == noQueryDataSource))
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v5), "rowHeight");
    v10 = v11;
  }
  else
  {
    v10 = UITableViewAutomaticDimension;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
  objc_msgSend(v12, "rowHeight");
  v14 = v13;

  if (v14 != v10)
  {
    v15 = (id)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController tableView](self, "tableView"));
    objc_msgSend(v15, "setRowHeight:", v10);

  }
}

- (int)listForDataSource:(id)a3
{
  return 10;
}

- (void)dataSource:(id)a3 itemTapped:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  __CFString *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  unsigned int v24;
  _UNKNOWN **v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  uint64_t v33;
  SearchResult *v34;
  void *v35;
  SearchResult *v36;
  uint64_t v37;
  void *v38;
  uint64_t v39;
  void *v40;
  unsigned int v41;
  void *v42;
  _QWORD v43[5];
  id v44;
  _QWORD v45[4];
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;

  v6 = a3;
  v7 = a4;
  v48 = 0;
  v49 = &v48;
  v50 = 0x3032000000;
  v51 = sub_100AED228;
  v52 = sub_100AED238;
  v53 = 0;
  v8 = objc_opt_class(MKLocalSearchCompletion);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = v7;
    v10 = objc_msgSend(v9, "_type");
    if (v10 && v10 != (id)3)
      goto LABEL_10;
    v11 = objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v9));
    v12 = (void *)v49[5];
    v49[5] = v11;
LABEL_9:

LABEL_10:
    goto LABEL_11;
  }
  v13 = objc_opt_class(_TtC4Maps22MapsAutocompletePerson);
  if ((objc_opt_isKindOfClass(v7, v13) & 1) != 0)
  {
    v14 = (__CFString *)v7;
    v15 = objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v14));
    v16 = (void *)v49[5];
    v49[5] = v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
    objc_msgSend(v17, "routeSearchController:didSelectItem:", self, v49[5]);
LABEL_24:

    goto LABEL_26;
  }
  v18 = objc_opt_class(HistoryEntryRecentsItem);
  if ((objc_opt_isKindOfClass(v7, v18) & 1) != 0)
  {
    v19 = v7;
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "historyEntry"));
    v45[0] = _NSConcreteStackBlock;
    v45[1] = 3221225472;
    v45[2] = sub_100AED240;
    v45[3] = &unk_1011B1458;
    v47 = &v48;
    v46 = v19;
    objc_msgSend(v20, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v45, 0, 0, 0);

    v12 = v46;
    goto LABEL_9;
  }
  v33 = objc_opt_class(MapsSuggestionsEntry);
  if ((objc_opt_isKindOfClass(v7, v33) & 1) != 0)
  {
    v14 = (__CFString *)v7;
    v34 = [SearchResult alloc];
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString MKMapItem](v14, "MKMapItem"));
    v36 = -[SearchResult initWithMapItem:](v34, "initWithMapItem:", v35);
    v37 = objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v36));
    v38 = (void *)v49[5];
    v49[5] = v37;

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
    objc_msgSend(v17, "routeSearchController:didSelectItem:", self, v49[5]);
    goto LABEL_24;
  }
  v39 = objc_opt_class(BrowseCategory);
  if ((objc_opt_isKindOfClass(v7, v39) & 1) != 0 && !self->_supportsFullTextSearch)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[MapsOfflineUIHelper sharedHelper](MapsOfflineUIHelper, "sharedHelper"));
    v41 = objc_msgSend(v40, "isUsingOfflineMaps");

    if (v41)
    {
      v14 = (__CFString *)v7;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString category](v14, "category"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v42));

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", &off_101274958));
      objc_msgSend(v30, "setObject:forKeyedSubscript:", &off_101270690, CFSTR("GEOMapServiceTraits_Source"));
      v32 = (id)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
      objc_msgSend(v32, "routeSearchController:doSearchItem:userInfo:", self, v17, v30);
LABEL_23:

      goto LABEL_24;
    }
  }
LABEL_11:
  if (v49[5])
  {
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", &off_101274980));
    -[__CFString setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", &off_101270690, CFSTR("GEOMapServiceTraits_Source"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
    v22 = objc_opt_class(RouteSearchViewController);
    if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
      v24 = objc_msgSend(v23, "hasInputsInSearchField");

      if (v24)
        v25 = &off_101270690;
      else
        v25 = &off_1012706A8;
    }
    else
    {

      v25 = &off_1012706A8;
    }
    -[__CFString setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v25, CFSTR("GEOMapServiceTraits_Source"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "latLngForRouteSearchTableViewController:", self));

    if (v17)
      -[__CFString setObject:forKeyedSubscript:](v14, "setObject:forKeyedSubscript:", v17, CFSTR("kAddStopPreviousLocationLatLng"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
    v31 = v49[5];
    v32 = -[__CFString copy](v14, "copy");
    objc_msgSend(v30, "routeSearchController:doSearchItem:userInfo:", self, v31, v32);
    goto LABEL_23;
  }
  v26 = objc_opt_class(SearchResult);
  if ((objc_opt_isKindOfClass(v7, v26) & 1) != 0 && objc_msgSend(v7, "isDynamicCurrentLocation"))
  {
    v14 = CFSTR("AppInfoTemporaryPreciseLocationAuthorizationForDirectionsPurposeKey");
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MKMapService sharedService](MKMapService, "sharedService"));
    objc_msgSend(v27, "captureUserAction:onTarget:eventValue:", 56, 607, 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MKLocationManager sharedLocationManager](MKLocationManager, "sharedLocationManager"));
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_100AED280;
    v43[3] = &unk_1011B1820;
    v43[4] = self;
    v44 = v7;
    objc_msgSend(v28, "requestTemporaryPreciseLocationAuthorizationWithPurposeKey:completion:", v14, v43);

  }
  else
  {
    v14 = (__CFString *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
    -[__CFString routeSearchController:didSelectItem:](v14, "routeSearchController:didSelectItem:", self, v7);
  }
LABEL_26:

  _Block_object_dispose(&v48, 8);
}

- (BOOL)searchDataSource:(id)a3 shouldFilterItem:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  unsigned __int8 v9;
  void *v10;
  BOOL v11;
  uint64_t v12;
  id v13;
  unint64_t v14;
  uint64_t v16;
  void *v17;
  _QWORD v18[5];
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  char v22;

  v6 = a3;
  v7 = a4;
  v19 = 0;
  v20 = &v19;
  v21 = 0x2020000000;
  v22 = 0;
  v8 = objc_opt_class(MapsSuggestionsEntry);
  if ((objc_opt_isKindOfClass(v7, v8) & 1) != 0)
  {
    v9 = -[RouteWaypointSuggestionsTableViewController shouldFilterMapsSuggestionsEntry:](self, "shouldFilterMapsSuggestionsEntry:", v7);
    *((_BYTE *)v20 + 24) = v9;
  }
  else
  {
    v12 = objc_opt_class(MKLocalSearchCompletion);
    if ((objc_opt_isKindOfClass(v7, v12) & 1) != 0)
    {
      v13 = v7;
      v14 = (unint64_t)objc_msgSend(v13, "_type") & 0xFFFFFFFFFFFFFFFELL;

      if (v14 == 4)
      {
        v11 = 1;
        goto LABEL_10;
      }
    }
    else
    {
      v16 = objc_opt_class(HistoryEntryRecentsItem);
      if ((objc_opt_isKindOfClass(v7, v16) & 1) != 0)
      {
        *((_BYTE *)v20 + 24) = 1;
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "historyEntry"));
        v18[0] = _NSConcreteStackBlock;
        v18[1] = 3221225472;
        v18[2] = sub_100AED4CC;
        v18[3] = &unk_1011BF258;
        v18[4] = &v19;
        objc_msgSend(v17, "ifSearch:ifRoute:ifPlaceDisplay:ifTransitLineItem:", v18, 0, 0, 0);

      }
    }
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
  v11 = (objc_msgSend(v10, "routeSearchController:waypointsIncludeObject:", self, v7) & 1) != 0
     || *((_BYTE *)v20 + 24) != 0;

LABEL_10:
  _Block_object_dispose(&v19, 8);

  return v11;
}

- (BOOL)shouldFilterMapsSuggestionsEntry:(id)a3
{
  unint64_t v3;

  v3 = (unint64_t)objc_msgSend(a3, "type");
  return (v3 < 0x19) & (0x1F3FF69u >> v3);
}

- (void)searchDataSource:(id)a3 replaceQueryWithItem:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "didTapOnQueryAcceleratorWithItem:");

  if ((v6 & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
    objc_msgSend(v7, "didTapOnQueryAcceleratorWithItem:", v8);

  }
}

- (int)currentUITargetForAnalytics
{
  return 607;
}

- (int)currentMapViewTargetForAnalytics
{
  return 504;
}

- (id)newTraits
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteWaypointSuggestionsTableViewController delegate](self, "delegate"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "traitsForRouteSearchTableViewController:", self));

  return v4;
}

- (RouteWaypointSuggestionsTableViewControllerDelegate)delegate
{
  return (RouteWaypointSuggestionsTableViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (id)tableViewDidReloadHandler
{
  return self->_tableViewDidReloadHandler;
}

- (void)setTableViewDidReloadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_tableViewDidReloadHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_browseCategoryDataSource, 0);
  objc_storeStrong((id *)&self->_acDataSource, 0);
  objc_storeStrong((id *)&self->_noQueryDataSource, 0);
}

@end
