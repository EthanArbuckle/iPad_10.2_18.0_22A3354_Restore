@implementation DirectionsStepsListDataSource

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
    objc_msgSend(v4, "removeObserver:forKeyPath:", self, CFSTR("bounds"));

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
    objc_msgSend(v6, "removeObserver:forKeyPath:", self, CFSTR("bounds"));

  }
  v7.receiver = self;
  v7.super_class = (Class)DirectionsStepsListDataSource;
  -[DirectionsStepsListDataSource dealloc](&v7, "dealloc");
}

- (DirectionsStepsListDataSource)init
{
  DirectionsStepsListDataSource *v2;
  DirectionsStepsListDataSource *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[4];
  id v12;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)DirectionsStepsListDataSource;
  v2 = -[DirectionsStepsListDataSource init](&v14, "init");
  v3 = v2;
  if (v2)
  {
    v2->_options = 7;
    v2->_allowStepSelection = 1;
    v2->_shieldArtworkSize = 4;
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    v5 = MNLocaleDidChangeNotification();
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    objc_msgSend(v4, "addObserver:selector:name:object:", v3, "_handleLocaleChangeNotification:", v6, 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v7, "addObserver:selector:name:object:", v3, "_contentSizeCategoryDidChange:", UIContentSizeCategoryDidChangeNotification, 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    objc_msgSend(v8, "registerObserver:", v3);

    objc_initWeak(&location, v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[VGVirtualGarageService sharedService](VGVirtualGarageService, "sharedService"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100543564;
    v11[3] = &unk_1011AD100;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v9, "virtualGarageGetGarageWithReply:", v11);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  return v3;
}

- (void)setOptions:(unint64_t)a3
{
  if (self->_options != a3)
  {
    self->_options = a3;
    -[DirectionsStepsListDataSource invalidateLayoutAndReloadData](self, "invalidateLayoutAndReloadData");
  }
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
      -[DirectionsStepsListDataSource setCollectionView:](self, "setCollectionView:", 0);
      -[DirectionsStepsListDataSource _updateRegisteredCellClasses](self, "_updateRegisteredCellClasses");
      objc_msgSend(obj, "registerClass:forCellReuseIdentifier:", objc_opt_class(RoutePlanningFooterCell), CFSTR("FooterView"));
      objc_msgSend(obj, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 1, 0);
      -[DirectionsStepsListDataSource _updateElevationHeaderView](self, "_updateElevationHeaderView");
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
      -[DirectionsStepsListDataSource setTableView:](self, "setTableView:", 0);
      -[DirectionsStepsListDataSource _updateRegisteredCellClasses](self, "_updateRegisteredCellClasses");
      objc_msgSend(obj, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(DirectionsElevationSummaryCollectionViewCell), CFSTR("Elevation"));
      objc_msgSend(obj, "registerClass:forCellWithReuseIdentifier:", objc_opt_class(RoutePlanningFooterCollectionViewCell), CFSTR("FooterView"));
      objc_msgSend(obj, "addObserver:forKeyPath:options:context:", self, CFSTR("bounds"), 1, 0);
    }
  }

}

- (void)setFlattenToSingleSection:(BOOL)a3
{
  if (self->_flattenToSingleSection != a3)
  {
    self->_flattenToSingleSection = a3;
    -[DirectionsStepsListDataSource invalidateLayoutAndReloadData](self, "invalidateLayoutAndReloadData");
  }
}

- (void)setUseLargeCells:(BOOL)a3
{
  if (self->_useLargeCells != a3)
  {
    self->_useLargeCells = a3;
    -[DirectionsStepsListDataSource _updateRegisteredCellClasses](self, "_updateRegisteredCellClasses");
  }
}

- (void)setDisplayedInRoutePlanning:(BOOL)a3
{
  if (self->_displayedInRoutePlanning != a3)
  {
    self->_displayedInRoutePlanning = a3;
    -[DirectionsStepsListDataSource invalidateLayoutAndReloadData](self, "invalidateLayoutAndReloadData");
  }
}

- (void)_consumeUpdatedGarage:(id)a3
{
  void *v5;
  unsigned int v6;
  id v7;

  v7 = a3;
  if ((objc_msgSend(v7, "isEqual:", self->_virtualGarage) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_virtualGarage, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
    v6 = objc_msgSend(v5, "isEVRoute");

    if (v6)
      -[DirectionsStepsListDataSource invalidateLayoutAndReloadData](self, "invalidateLayoutAndReloadData");
  }

}

- (void)observeValueForKeyPath:(id)a3 ofObject:(id)a4 change:(id)a5 context:(void *)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  double v16;
  objc_super v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  if ((id)v13 == v11)
  {

  }
  else
  {
    v14 = (void *)v13;
    v15 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));

    if (v15 != v11)
    {
      v17.receiver = self;
      v17.super_class = (Class)DirectionsStepsListDataSource;
      -[DirectionsStepsListDataSource observeValueForKeyPath:ofObject:change:context:](&v17, "observeValueForKeyPath:ofObject:change:context:", v10, v11, v12, a6);
      goto LABEL_8;
    }
  }
  -[DirectionsStepsListDataSource _calculateWidthForCachedRowHeights](self, "_calculateWidthForCachedRowHeights");
  if (self->_routeStepRowHeights && self->_availableWidthForCachedRowHeights != v16)
    -[DirectionsStepsListDataSource invalidateLayoutAndReloadData](self, "invalidateLayoutAndReloadData");
LABEL_8:

}

- (Class)_directionsStepCellClass
{
  unsigned int v2;
  __objc2_class **v3;

  v2 = -[DirectionsStepsListDataSource usesLargeCells](self, "usesLargeCells");
  v3 = off_101196138;
  if (!v2)
    v3 = off_101196158;
  return (Class)(id)objc_opt_class(*v3);
}

- (Class)_directionsOriginDestinationCellClass
{
  unsigned int v2;
  __objc2_class **v3;

  v2 = -[DirectionsStepsListDataSource usesLargeCells](self, "usesLargeCells");
  v3 = off_101196128;
  if (!v2)
    v3 = off_101196148;
  return (Class)(id)objc_opt_class(*v3);
}

- (Class)_directionsStepCollectionViewCellClass
{
  unsigned int v2;
  __objc2_class **v3;

  v2 = -[DirectionsStepsListDataSource usesLargeCells](self, "usesLargeCells");
  v3 = off_101196130;
  if (!v2)
    v3 = off_101196150;
  return (Class)(id)objc_opt_class(*v3);
}

- (Class)_directionsOriginDestinationCollectionViewCellClass
{
  unsigned int v2;
  __objc2_class **v3;

  v2 = -[DirectionsStepsListDataSource usesLargeCells](self, "usesLargeCells");
  v3 = off_101196120;
  if (!v2)
    v3 = off_101196140;
  return (Class)(id)objc_opt_class(*v3);
}

- (void)_updateRegisteredCellClasses
{
  void *v3;
  objc_class *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_class *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));

  if (v3)
  {
    v4 = -[DirectionsStepsListDataSource _directionsStepCellClass](self, "_directionsStepCellClass");
    v5 = -[DirectionsStepsListDataSource _directionsOriginDestinationCellClass](self, "_directionsOriginDestinationCellClass");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class reuseIdentifier](v4, "reuseIdentifier"));
    objc_msgSend(v6, "registerClass:forCellReuseIdentifier:", v4, v7);

    v14 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class reuseIdentifier](v5, "reuseIdentifier"));
    objc_msgSend(v14, "registerClass:forCellReuseIdentifier:", v5, v8);
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));

    if (!v9)
      return;
    v10 = -[DirectionsStepsListDataSource _directionsStepCollectionViewCellClass](self, "_directionsStepCollectionViewCellClass");
    v11 = -[DirectionsStepsListDataSource _directionsOriginDestinationCollectionViewCellClass](self, "_directionsOriginDestinationCollectionViewCellClass");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class reuseIdentifier](v10, "reuseIdentifier"));
    objc_msgSend(v12, "registerClass:forCellWithReuseIdentifier:", v10, v13);

    v14 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class reuseIdentifier](v11, "reuseIdentifier"));
    objc_msgSend(v14, "registerClass:forCellWithReuseIdentifier:", v11, v8);
  }

}

- (NSArray)sections
{
  NSArray *sections;

  sections = self->_sections;
  if (!sections)
  {
    -[DirectionsStepsListDataSource _buildDataSourceItems](self, "_buildDataSourceItems");
    sections = self->_sections;
  }
  return sections;
}

- (NSArray)stepsSectionItems
{
  NSArray *stepsSectionItems;

  stepsSectionItems = self->_stepsSectionItems;
  if (!stepsSectionItems)
  {
    -[DirectionsStepsListDataSource _buildDataSourceItems](self, "_buildDataSourceItems");
    stepsSectionItems = self->_stepsSectionItems;
  }
  return stepsSectionItems;
}

- (unint64_t)indexOfFirstDisplayedStep
{
  return -[DirectionsStepsListDataSource _stepsSectionItemsExcludesFirstStep](self, "_stepsSectionItemsExcludesFirstStep");
}

- (BOOL)_stepsSectionItemsExcludesFirstStep
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned int v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "steps"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));

  if (objc_msgSend(v4, "isStartOrResumeStep"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "geoStep"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "instructionSet"));
    v7 = objc_msgSend(v6, "hasDrivingWalkingListInstruction") ^ 1;

  }
  else
  {
    LOBYTE(v7) = 0;
  }

  return v7;
}

- (void)reloadData
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void (**v16)(void);
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];

  -[DirectionsStepsListDataSource _buildDataSourceItems](self, "_buildDataSourceItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "superview"));
  if (v4)
  {

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));

    if (!v6)
      return;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));

  if (v7)
  {
    self->_routeHasNoManeuvers = 1;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route", 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "steps"));

    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(_QWORD *)v19 != v12)
            objc_enumerationMutation(v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), "geoStep"));
          if (objc_msgSend(v14, "hasManeuverType") && objc_msgSend(v14, "maneuverType"))
            self->_routeHasNoManeuvers = 0;

        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v11);
    }

    if (-[DirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection")
      && (v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource reloadHandler](self, "reloadHandler")),
          v15,
          v15))
    {
      v16 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource reloadHandler](self, "reloadHandler"));
      v16[2]();
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
      objc_msgSend(v17, "reloadData");

      v16 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
      objc_msgSend(v16, "reloadData");
    }

    if (!self->_temporarilyDisableAutoscroll)
      -[DirectionsStepsListDataSource scrollToCurrentStep](self, "scrollToCurrentStep");
  }
}

- (void)invalidateLayoutAndReloadData
{
  NSNumber *routeOverviewCellCachedHeight;

  free(self->_routeStepRowHeights);
  routeOverviewCellCachedHeight = self->_routeOverviewCellCachedHeight;
  self->_routeOverviewCellCachedHeight = 0;
  self->_routeStepRowHeights = 0;

  -[DirectionsStepsListDataSource reloadData](self, "reloadData");
  -[DirectionsStepsListDataSource _updateElevationHeaderView](self, "_updateElevationHeaderView");
}

- (void)_buildDataSourceItems
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  NSMutableArray *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSArray *v18;
  NSArray *sections;
  NSArray *v20;
  NSArray *stepsSectionItems;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
  if (v3)
  {
    v4 = objc_alloc_init((Class)NSMutableArray);
    if ((-[DirectionsStepsListDataSource options](self, "options") & 4) != 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "elevationProfile"));

      if (v5)
        objc_msgSend(v4, "addObject:", &off_10126DC60);
    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "steps"));
    v7 = objc_opt_new(NSMutableArray);
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "geoStep", (_QWORD)v22));
          if (!objc_msgSend(v14, "hasManeuverType")
            || objc_msgSend(v14, "maneuverType") != 85)
          {
            -[NSMutableArray addObject:](v7, "addObject:", v13);
          }

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }

    v15 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", -[NSMutableArray count](v7, "count"));
    if ((-[DirectionsStepsListDataSource options](self, "options") & 1) != 0)
      objc_msgSend(v15, "addObject:", CFSTR("OriginPinRow"));
    v16 = -[DirectionsStepsListDataSource _stepsSectionItemsExcludesFirstStep](self, "_stepsSectionItemsExcludesFirstStep", (_QWORD)v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](v7, "subarrayWithRange:", v16, (char *)-[NSMutableArray count](v7, "count") - v16));
    objc_msgSend(v15, "addObjectsFromArray:", v17);

    if ((-[DirectionsStepsListDataSource options](self, "options") & 2) != 0)
      objc_msgSend(v15, "addObject:", CFSTR("DestinationPinRow"));
    if (objc_msgSend(v15, "count"))
      objc_msgSend(v4, "addObject:", &off_10126DC78);
    if ((-[DirectionsStepsListDataSource options](self, "options") & 8) != 0)
      objc_msgSend(v4, "addObject:", &off_10126DC90);

  }
  else
  {
    v15 = 0;
    v4 = 0;
  }
  v18 = (NSArray *)objc_msgSend(v4, "copy");
  sections = self->_sections;
  self->_sections = v18;

  v20 = (NSArray *)objc_msgSend(v15, "copy");
  stepsSectionItems = self->_stepsSectionItems;
  self->_stepsSectionItems = v20;

}

- (void)setRoute:(id)a3
{
  GEOComposedRoute *v5;
  GEOComposedRoute *v6;

  v5 = (GEOComposedRoute *)a3;
  if (self->_route != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_route, a3);
    -[DirectionsStepsListDataSource setEnableNavigationUpdates:](self, "setEnableNavigationUpdates:", 0);
    -[DirectionsStepsListDataSource invalidateLayoutAndReloadData](self, "invalidateLayoutAndReloadData");
    v5 = v6;
  }

}

- (void)setEnableNavigationUpdates:(BOOL)a3
{
  DirectionsStepsListNavigationProvider *v4;
  DirectionsStepsListNavigationProvider *navigationProvider;
  DirectionsStepsListNavigationProvider *v6;

  if (self->_enableNavigationUpdates != a3)
  {
    self->_enableNavigationUpdates = a3;
    if (a3)
    {
      v4 = -[DirectionsStepsListNavigationProvider initWithDelegate:]([DirectionsStepsListNavigationProvider alloc], "initWithDelegate:", self);
      navigationProvider = self->_navigationProvider;
      self->_navigationProvider = v4;

      -[DirectionsStepsListDataSource _updateRouteFromNavigationProvider](self, "_updateRouteFromNavigationProvider");
    }
    else
    {
      v6 = self->_navigationProvider;
      self->_navigationProvider = 0;

    }
  }
}

- (void)_updateRouteFromNavigationProvider
{
  DirectionsStepsListNavigationProvider *navigationProvider;
  GEOComposedRoute *v4;
  GEOComposedRoute *v5;
  GEOComposedRoute **p_route;
  GEOComposedRoute *v7;
  GEOComposedRoute *v8;

  navigationProvider = self->_navigationProvider;
  if (navigationProvider)
  {
    if (-[DirectionsStepsListNavigationProvider isNavigating](navigationProvider, "isNavigating")
      && (v4 = (GEOComposedRoute *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListNavigationProvider route](self->_navigationProvider, "route"))) != 0)
    {
      v5 = v4;
      p_route = &self->_route;
      if (self->_route == v4)
      {
LABEL_10:

        return;
      }
      v8 = v4;
      objc_storeStrong((id *)&self->_route, v4);
      if (-[GEOComposedRoute transportType](*p_route, "transportType") != 1)
      {
LABEL_9:
        -[DirectionsStepsListDataSource invalidateLayoutAndReloadData](self, "invalidateLayoutAndReloadData");
        v5 = v8;
        goto LABEL_10;
      }
    }
    else
    {
      v8 = 0;
      p_route = &self->_route;
    }
    v7 = *p_route;
    *p_route = 0;

    goto LABEL_9;
  }
}

- (void)navigationProvider:(id)a3 didChangeToNavigating:(BOOL)a4 withRoute:(id)a5
{
  -[DirectionsStepsListDataSource _updateRouteFromNavigationProvider](self, "_updateRouteFromNavigationProvider", a3, a4, a5);
}

- (void)navigationProvider:(id)a3 didUpdateRoute:(id)a4
{
  -[DirectionsStepsListDataSource _updateRouteFromNavigationProvider](self, "_updateRouteFromNavigationProvider", a3, a4);
}

- (void)navigationProvider:(id)a3 didUpdateActiveStepIndex:(unint64_t)a4
{
  self->_temporarilyDisableAutoscroll = 1;
  -[DirectionsStepsListDataSource invalidateLayoutAndReloadData](self, "invalidateLayoutAndReloadData", a3, a4);
  self->_temporarilyDisableAutoscroll = 0;
  -[DirectionsStepsListDataSource _scrollToRouteStepAnimated:](self, "_scrollToRouteStepAnimated:", 1);
}

- (void)navigationProvider:(id)a3 didUpdateElapsedDistanceAlongRoute:(double)a4
{
  -[DirectionsElevationGraphHeaderView setNavigationProgress:](self->_graphHeaderView, "setNavigationProgress:", a3, a4);
}

- (id)routeStepForIndexPath:(id)a3
{
  void *v4;
  id v5;
  id v6;
  void *v7;
  id v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", a3));
  if ((id)-[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v4, "section")) != (id)1)
    goto LABEL_7;
  v5 = objc_msgSend(v4, "row");
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
    goto LABEL_7;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
  v8 = objc_msgSend(v7, "count");

  if (v6 >= v8
    || (v9 = -[DirectionsStepsListDataSource _selectionRouteStepIndexForRowIndex:](self, "_selectionRouteStepIndexForRowIndex:", v6), v9 == 0x7FFFFFFFFFFFFFFFLL)|| (v10 = v9, v11 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems")), v12 = objc_msgSend(v11, "count"), v11, v10 >= (unint64_t)v12))
  {
LABEL_7:
    v14 = 0;
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v10));

  }
  return v14;
}

- (unint64_t)_rowIndexForCurrentlyMatchedStep
{
  DirectionsStepsListNavigationProvider *navigationProvider;
  unint64_t v4;
  char *v5;
  char *v6;

  navigationProvider = self->_navigationProvider;
  v4 = 0x7FFFFFFFFFFFFFFFLL;
  if (navigationProvider)
  {
    v5 = -[DirectionsStepsListNavigationProvider activeStepIndex](navigationProvider, "activeStepIndex");
    if (v5 != (char *)0x7FFFFFFFFFFFFFFFLL)
    {
      v6 = &v5[-[DirectionsStepsListDataSource options](self, "options") & 1];
      return (unint64_t)&v6[--[DirectionsStepsListDataSource _stepsSectionItemsExcludesFirstStep](self, "_stepsSectionItemsExcludesFirstStep")];
    }
  }
  return v4;
}

- (id)_itemAtIndexPath:(id)a3
{
  id v4;
  int64_t v5;
  __CFString *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;

  v4 = a3;
  v5 = -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v4, "section"));
  if (v5 == 2)
  {
    v6 = CFSTR("FooterView");
  }
  else if (v5 == 1)
  {
    if (((unint64_t)objc_msgSend(v4, "row") & 0x8000000000000000) != 0
      || (v7 = objc_msgSend(v4, "row"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems")),
          v9 = objc_msgSend(v8, "count"),
          v8,
          v7 >= v9))
    {
      v6 = 0;
    }
    else
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", objc_msgSend(v4, "row")));

    }
  }
  else if (v5)
  {
    v6 = 0;
  }
  else
  {
    v6 = CFSTR("Elevation");
  }

  return v6;
}

- (id)_adjustedItemToSelectFromIndexPath:(id)a3
{
  id v4;
  __CFString *v5;
  __CFString *v6;
  void *v7;
  __CFString *v8;
  __CFString *v10;
  void *v11;

  v4 = a3;
  v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _itemAtIndexPath:](self, "_itemAtIndexPath:", v4));
  if (v5 == CFSTR("OriginPinRow"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)objc_msgSend(v4, "item") + 1, objc_msgSend(v4, "section")));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _itemAtIndexPath:](self, "_itemAtIndexPath:", v11));

    if (v8 == CFSTR("DestinationPinRow") || v8 == 0)
      v10 = CFSTR("OriginPinRow");
    else
      v10 = v8;
    goto LABEL_15;
  }
  v6 = v5;
  if (v5 == CFSTR("DestinationPinRow"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForItem:inSection:](NSIndexPath, "indexPathForItem:inSection:", (char *)objc_msgSend(v4, "item") - 1, objc_msgSend(v4, "section")));
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _itemAtIndexPath:](self, "_itemAtIndexPath:", v7));

    if (v8 == CFSTR("OriginPinRow") || v8 == 0)
      v10 = CFSTR("DestinationPinRow");
    else
      v10 = v8;
LABEL_15:
    v6 = v10;

  }
  return v6;
}

- (unint64_t)routeStepIndexForRowIndex:(unint64_t)a3
{
  void *v5;
  __CFString *v6;
  uint64_t v7;
  char *v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));

  v7 = objc_opt_class(GEOComposedRouteStep);
  if ((objc_opt_isKindOfClass(v6, v7) & 1) != 0)
  {
    v8 = (char *)-[__CFString stepIndex](v6, "stepIndex");
  }
  else if (v6 == CFSTR("DestinationPinRow"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
    v8 = (char *)objc_msgSend(v9, "count") - 1;

  }
  else
  {
    v8 = 0;
  }

  return (unint64_t)v8;
}

- (unint64_t)_selectionRouteStepIndexForRowIndex:(unint64_t)a3
{
  void *v5;
  __CFString *v6;
  unint64_t v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", a3));

  if (v6 == CFSTR("OriginPinRow"))
  {
    v7 = a3 + 1;
  }
  else if (v6 == CFSTR("DestinationPinRow"))
  {
    v7 = a3 - 1;
  }
  else
  {
    v7 = -[DirectionsStepsListDataSource routeStepIndexForRowIndex:](self, "routeStepIndexForRowIndex:", a3);
  }

  return v7;
}

- (BOOL)_shouldHighlightCurrentStep
{
  return self->_navigationProvider != 0;
}

- (void)setCollapsingHeaderSuperview:(id)a3 topAnchorConstraint:(id)a4
{
  UIView *v6;
  NSLayoutConstraint *v7;
  UIView *headerSuperview;
  UIView *v9;
  NSLayoutConstraint *headerTableViewTopAnchorConstraint;

  v6 = (UIView *)a3;
  v7 = (NSLayoutConstraint *)a4;
  headerSuperview = self->_headerSuperview;
  self->_headerSuperview = v6;
  v9 = v6;

  headerTableViewTopAnchorConstraint = self->_headerTableViewTopAnchorConstraint;
  self->_headerTableViewTopAnchorConstraint = v7;

  -[DirectionsStepsListDataSource _updateElevationHeaderView](self, "_updateElevationHeaderView");
}

- (void)_updateElevationHeaderView
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  DirectionsElevationGraphHeaderView *graphHeaderView;
  _BOOL4 v7;
  DirectionsElevationGraphHeaderView *v8;
  DirectionsElevationGraphHeaderView *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *graphHeaderViewHeightConstraint;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSLayoutConstraint *v21;
  void *v22;
  char v23;
  void *v24;
  DirectionsElevationGraphHeaderView *v25;
  NSLayoutConstraint *v26;
  DirectionsElevationGraphHeaderView *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  void *v35;
  double left;
  double bottom;
  double right;
  id v39;
  id v40;
  _QWORD v41[4];

  if ((-[DirectionsStepsListDataSource options](self, "options") & 4) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "elevationProfile"));
    v3 = v5 != 0;

  }
  else
  {
    v3 = 0;
  }
  graphHeaderView = self->_graphHeaderView;
  if (self->_headerSuperview)
  {
    if (graphHeaderView)
      v7 = 0;
    else
      v7 = v3;
    if (v7)
    {
      v8 = -[DirectionsElevationGraphHeaderView initWithFrame:]([DirectionsElevationGraphHeaderView alloc], "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
      v9 = self->_graphHeaderView;
      self->_graphHeaderView = v8;

      -[DirectionsElevationGraphHeaderView setTranslatesAutoresizingMaskIntoConstraints:](self->_graphHeaderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[UIView addSubview:](self->_headerSuperview, "addSubview:", self->_graphHeaderView);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphHeaderView heightAnchor](self->_graphHeaderView, "heightAnchor"));
      -[DirectionsElevationGraphHeaderView maximumHeight](self->_graphHeaderView, "maximumHeight");
      v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToConstant:"));
      graphHeaderViewHeightConstraint = self->_graphHeaderViewHeightConstraint;
      self->_graphHeaderViewHeightConstraint = v11;

      v39 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphHeaderView topAnchor](self->_graphHeaderView, "topAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[UIView topAnchor](self->_headerSuperview, "topAnchor"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToAnchor:", v13));
      v41[0] = v14;
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphHeaderView leadingAnchor](self->_graphHeaderView, "leadingAnchor"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[UIView leadingAnchor](self->_headerSuperview, "leadingAnchor"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "constraintEqualToAnchor:", v16));
      v41[1] = v17;
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[UIView trailingAnchor](self->_headerSuperview, "trailingAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsElevationGraphHeaderView trailingAnchor](self->_graphHeaderView, "trailingAnchor"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:", v19));
      v21 = self->_graphHeaderViewHeightConstraint;
      v41[2] = v20;
      v41[3] = v21;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v41, 4));
      +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v22);

      graphHeaderView = self->_graphHeaderView;
LABEL_14:
      -[DirectionsElevationGraphHeaderView setDelegate:](graphHeaderView, "setDelegate:", self);
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
      -[DirectionsElevationGraphHeaderView setRoute:](self->_graphHeaderView, "setRoute:", v24);

      -[DirectionsElevationGraphHeaderView setStyleForNavigation:](self->_graphHeaderView, "setStyleForNavigation:", self->_navigationProvider != 0);
      v25 = self->_graphHeaderView;
      -[DirectionsStepsListNavigationProvider elapsedDistance](self->_navigationProvider, "elapsedDistance");
      -[DirectionsElevationGraphHeaderView setNavigationProgress:](v25, "setNavigationProgress:");
      -[DirectionsStepsListDataSource _updateElevationHeaderTableInset](self, "_updateElevationHeaderTableInset");
      -[DirectionsStepsListDataSource _updateElevationHeaderHeight](self, "_updateElevationHeaderHeight");
      return;
    }
    if (graphHeaderView)
      v23 = v3;
    else
      v23 = 1;
    if ((v23 & 1) != 0)
      goto LABEL_14;
  }
  -[DirectionsElevationGraphHeaderView removeFromSuperview](graphHeaderView, "removeFromSuperview");
  -[NSLayoutConstraint setConstant:](self->_headerTableViewTopAnchorConstraint, "setConstant:", 0.0);
  v26 = self->_graphHeaderViewHeightConstraint;
  self->_graphHeaderViewHeightConstraint = 0;

  v27 = self->_graphHeaderView;
  self->_graphHeaderView = 0;

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  objc_msgSend(v28, "contentInset");
  v30 = v29;
  v32 = v31;
  v34 = v33;

  v35 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  objc_msgSend(v35, "setContentInset:", 0.0, v30, v32, v34);

  left = UIEdgeInsetsZero.left;
  bottom = UIEdgeInsetsZero.bottom;
  right = UIEdgeInsetsZero.right;
  v40 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  objc_msgSend(v40, "setVerticalScrollIndicatorInsets:", UIEdgeInsetsZero.top, left, bottom, right);

}

- (void)_updateElevationHeaderTableInset
{
  void *v3;
  DirectionsElevationGraphHeaderView *graphHeaderView;
  unsigned __int8 v5;
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
  void *v17;
  double v18;
  double v19;
  double v20;
  double left;
  double bottom;
  double right;
  id v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  if (!v3 || (graphHeaderView = self->_graphHeaderView) == 0)
  {

    goto LABEL_6;
  }
  v5 = -[DirectionsElevationGraphHeaderView isRecalatingHeights](graphHeaderView, "isRecalatingHeights");

  if ((v5 & 1) != 0)
  {
LABEL_6:
    left = UIEdgeInsetsZero.left;
    bottom = UIEdgeInsetsZero.bottom;
    right = UIEdgeInsetsZero.right;
    v24 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
    objc_msgSend(v24, "setScrollIndicatorInsets:", UIEdgeInsetsZero.top, left, bottom, right);
    goto LABEL_7;
  }
  -[DirectionsElevationGraphHeaderView minimumHeight](self->_graphHeaderView, "minimumHeight");
  -[NSLayoutConstraint setConstant:](self->_headerTableViewTopAnchorConstraint, "setConstant:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  objc_msgSend(v6, "contentInset");
  v8 = v7;
  v10 = v9;
  v12 = v11;

  -[DirectionsElevationGraphHeaderView maximumHeight](self->_graphHeaderView, "maximumHeight");
  v14 = v13;
  -[NSLayoutConstraint constant](self->_headerTableViewTopAnchorConstraint, "constant");
  v16 = v14 - v15;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  objc_msgSend(v17, "setContentInset:", v16, v8, v10, v12);

  v18 = UIEdgeInsetsZero.left;
  v19 = UIEdgeInsetsZero.bottom;
  v20 = UIEdgeInsetsZero.right;
  v24 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  objc_msgSend(v24, "setVerticalScrollIndicatorInsets:", v16, v18, v19, v20);
LABEL_7:

}

- (void)_updateElevationHeaderHeight
{
  void *v3;
  DirectionsElevationGraphHeaderView *graphHeaderView;
  unsigned __int8 v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  if (v3 && (graphHeaderView = self->_graphHeaderView) != 0)
  {
    v18 = v3;
    v5 = -[DirectionsElevationGraphHeaderView isRecalatingHeights](graphHeaderView, "isRecalatingHeights");

    if ((v5 & 1) == 0)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
      objc_msgSend(v6, "contentOffset");
      v8 = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
      objc_msgSend(v9, "adjustedContentInset");
      v11 = v8 + v10;

      -[DirectionsElevationGraphHeaderView maximumHeight](self->_graphHeaderView, "maximumHeight");
      v13 = v12;
      if (v11 > 0.0)
      {
        v13 = v12 - v11;
        -[DirectionsElevationGraphHeaderView minimumHeight](self->_graphHeaderView, "minimumHeight");
        if (v13 <= v14)
        {
          -[DirectionsElevationGraphHeaderView minimumHeight](self->_graphHeaderView, "minimumHeight");
          v13 = v15;
        }
      }
      -[NSLayoutConstraint setConstant:](self->_graphHeaderViewHeightConstraint, "setConstant:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
      objc_msgSend(v16, "contentOffset");
      -[DirectionsElevationGraphHeaderView setBottomHairlineHidden:](self->_graphHeaderView, "setBottomHairlineHidden:", v17 <= 2.22044605e-16);

      -[NSLayoutConstraint setActive:](self->_graphHeaderViewHeightConstraint, "setActive:", 1);
    }
  }
  else
  {

  }
}

- (void)directionsElevationGraphHeaderViewWillRecalculateHeights:(id)a3
{
  -[NSLayoutConstraint setActive:](self->_graphHeaderViewHeightConstraint, "setActive:", 0);
}

- (void)directionsElevationGraphHeaderViewDidRecalculateHeights:(id)a3
{
  -[DirectionsStepsListDataSource _updateElevationHeaderTableInset](self, "_updateElevationHeaderTableInset", a3);
  -[DirectionsStepsListDataSource _updateElevationHeaderHeight](self, "_updateElevationHeaderHeight");
}

- (void)_handleLocaleChangeNotification:(id)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView", a3));
  objc_msgSend(v4, "performSelector:withObject:afterDelay:", "reloadData", 0, 0.0);

  v5 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
  objc_msgSend(v5, "performSelector:withObject:afterDelay:", "reloadData", 0, 0.0);

}

- (void)suspendAutoscrollingToStep
{
  self->_temporarilyDisableAutoscroll = 1;
}

- (void)resumeAutoscrollingToStep
{
  self->_temporarilyDisableAutoscroll = 0;
}

- (void)scrollToCurrentStep
{
  -[DirectionsStepsListDataSource _scrollToRouteStepAnimated:](self, "_scrollToRouteStepAnimated:", 0);
}

- (void)_scrollToRouteStepAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  id v11;
  unint64_t v12;
  unint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  id v21;
  void *v22;
  id v23;
  void *v24;
  id v25;
  NSObject *v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  NSObject *v36;
  void *v37;
  int v38;
  void *v39;
  __int16 v40;
  void *v41;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "superview"));
  if (v6)
  {

  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));

    if (!v8)
      return;
  }
  v9 = -[DirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", -[DirectionsStepsListDataSource _sectionIndexForSection:](self, "_sectionIndexForSection:", 1));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
  v11 = objc_msgSend(v10, "count");

  if (v9 && v11 == (id)v9)
  {
    v12 = -[DirectionsStepsListDataSource _rowIndexForCurrentlyMatchedStep](self, "_rowIndexForCurrentlyMatchedStep");
    if (v12 >= v9 || v12 == 0x7FFFFFFFFFFFFFFFLL)
      v14 = 0;
    else
      v14 = v12;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", v14, -[DirectionsStepsListDataSource _sectionIndexForSection:](self, "_sectionIndexForSection:", 1)));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _flatIndexFromIndexPath:](self, "_flatIndexFromIndexPath:", v15));

    if (self->_navigationProvider)
      v17 = 1;
    else
      v17 = 2;
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));

    if (!v18)
    {
LABEL_24:
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));

      if (!v28)
      {
LABEL_33:

        return;
      }
      v29 = objc_msgSend(v16, "section");
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
      if ((uint64_t)v29 >= (uint64_t)objc_msgSend(v30, "numberOfSections"))
      {

      }
      else
      {
        v31 = objc_msgSend(v16, "item");
        v32 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
        v33 = objc_msgSend(v32, "numberOfItemsInSection:", objc_msgSend(v16, "section"));

        if ((uint64_t)v31 < (uint64_t)v33)
        {
          v34 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
          objc_msgSend(v34, "scrollToItemAtIndexPath:atScrollPosition:animated:", v16, v17, v3);
LABEL_32:

          goto LABEL_33;
        }
      }
      v35 = sub_100431C0C();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
        v38 = 138412546;
        v39 = v16;
        v40 = 2112;
        v41 = v37;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "indexPath (%@) out-of-bounds; resetting scroll position on %@",
          (uint8_t *)&v38,
          0x16u);

      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
      objc_msgSend(v34, "setContentOffset:animated:", v3, CGPointZero.x, CGPointZero.y);
      goto LABEL_32;
    }
    v19 = objc_msgSend(v16, "section");
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
    if ((uint64_t)v19 >= (uint64_t)objc_msgSend(v20, "numberOfSections"))
    {

    }
    else
    {
      v21 = objc_msgSend(v16, "row");
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
      v23 = objc_msgSend(v22, "numberOfRowsInSection:", objc_msgSend(v16, "section"));

      if ((uint64_t)v21 < (uint64_t)v23)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
        objc_msgSend(v24, "scrollToRowAtIndexPath:atScrollPosition:animated:", v16, v17, v3);
LABEL_23:

        goto LABEL_24;
      }
    }
    v25 = sub_100431C0C();
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
      v38 = 138412546;
      v39 = v16;
      v40 = 2112;
      v41 = v27;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "indexPath (%@) out-of-bounds; resetting scroll position on %@",
        (uint8_t *)&v38,
        0x16u);

    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
    objc_msgSend(v24, "setContentOffset:animated:", v3, CGPointZero.x, CGPointZero.y);
    goto LABEL_23;
  }
}

- (void)didTapShareButtonOnRoutePlanningFooterView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "directionsStepsListDidTapShareButton:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource delegate](self, "delegate"));
    objc_msgSend(v6, "directionsStepsListDidTapShareButton:", self);

  }
}

- (void)didTapReportAProblemButtonOnRoutePlanningFooterView:(id)a3
{
  void *v4;
  char v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource delegate](self, "delegate", a3));
  v5 = objc_opt_respondsToSelector(v4, "directionsStepsListDidTapRAPButton:");

  if ((v5 & 1) != 0)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource delegate](self, "delegate"));
    objc_msgSend(v6, "directionsStepsListDidTapRAPButton:", self);

  }
}

- (int64_t)_numberOfSections
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource sections](self, "sections"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (int64_t)_numberOfRowsInSection:(int64_t)a3
{
  void *v5;
  id v6;
  int64_t v7;
  int64_t v8;
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource sections](self, "sections"));
  v6 = objc_msgSend(v5, "count");

  if ((uint64_t)v6 <= a3)
    return 0;
  v7 = -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", a3);
  if (v7 == 2)
    return (-[DirectionsStepsListDataSource options](self, "options") >> 3) & 1;
  if (v7 != 1)
  {
    if (!v7
      && (id)-[DirectionsStepsListDataSource _idiom](self, "_idiom") == (id)5
      && (-[DirectionsStepsListDataSource options](self, "options") & 4) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "elevationProfile"));
      v8 = v13 != 0;

      return v8;
    }
    return 0;
  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
  v11 = objc_msgSend(v10, "count");

  return (int64_t)v11;
}

- (id)_flatIndexFromIndexPath:(id)a3
{
  id v4;
  char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  void *v10;

  v4 = a3;
  if (-[DirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection"))
  {
    v5 = (char *)objc_msgSend(v4, "row");
    v6 = (uint64_t)objc_msgSend(v4, "section");
    if (v6 >= 1)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
        v5 = &v5[-[DirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", i)];
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
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  int64_t v9;
  void *v10;
  id v11;

  v4 = a3;
  if (!-[DirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection"))
  {
    v11 = v4;
LABEL_9:
    v10 = v11;
    goto LABEL_10;
  }
  v5 = (char *)objc_msgSend(v4, "row");
  v6 = -[DirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections");
  if (v6 >= 1)
  {
    v7 = v6;
    v8 = 0;
    while (1)
    {
      v9 = -[DirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", v8);
      if ((uint64_t)v5 < v9)
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

- (int64_t)_sectionIndexForSection:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource sections](self, "sections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v6 = objc_msgSend(v4, "indexOfObject:", v5);

  return (int64_t)v6;
}

- (int64_t)_sectionAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource sections](self, "sections"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectAtIndexedSubscript:", a3));
  v6 = objc_msgSend(v5, "integerValue");

  return (int64_t)v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (-[DirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection", a3))
    return 1;
  else
    return -[DirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections");
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6;
  int64_t v7;

  if (!-[DirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection", a3))
    return -[DirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", a4);
  if (-[DirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections") < 1)
    return 0;
  v6 = 0;
  v7 = 0;
  do
    v7 += -[DirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", v6++);
  while (v6 < -[DirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections"));
  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  -[DirectionsStepsListDataSource _heightForRowAtIndexPath:](self, "_heightForRowAtIndexPath:", a4);
  return result;
}

- (double)_heightForRowAtIndexPath:(id)a3
{
  void *v4;
  __CFString *v5;
  __CFString *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  double v15;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", a3));
  if (v4)
  {
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _itemAtIndexPath:](self, "_itemAtIndexPath:", v4));
    v6 = v5;
    if (v5 == CFSTR("DestinationPinRow") || v5 == CFSTR("OriginPinRow"))
    {
      -[DirectionsStepsListDataSource _rowHeightForStartEndCell:](self, "_rowHeightForStartEndCell:", v5 == CFSTR("OriginPinRow"));
    }
    else
    {
      if (v5 == CFSTR("FooterView"))
      {
        if ((-[DirectionsStepsListDataSource options](self, "options") & 8) != 0)
          v8 = UITableViewAutomaticDimension;
        else
          v8 = 0.0;
        goto LABEL_20;
      }
      if (v5 == CFSTR("Elevation"))
      {
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "traitCollection"));
        v11 = v10;
        if (v10)
        {
          v12 = v10;
        }
        else
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
          v12 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "traitCollection"));

        }
        if (objc_msgSend(v12, "userInterfaceIdiom") == (id)5)
          v8 = UITableViewAutomaticDimension;
        else
          v8 = 200.0;

        goto LABEL_20;
      }
      -[DirectionsStepsListDataSource _rowHeightForStep:](self, "_rowHeightForStep:", v5);
    }
    v8 = v7;
LABEL_20:

    goto LABEL_21;
  }
  +[DirectionsStepTableViewCell cellMetricsForIdiom:](DirectionsStepTableViewCell, "cellMetricsForIdiom:", -[DirectionsStepsListDataSource _idiom](self, "_idiom"));
  v8 = v15;
LABEL_21:

  return v8;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v7));
  v9 = v8;
  if (v8)
  {
    v10 = -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v8, "section"));
    if (v10 == 2)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _footerCellForIndexPath:inTableView:](self, "_footerCellForIndexPath:inTableView:", v7, v6));
      goto LABEL_7;
    }
    if (v10 == 1)
    {
      v11 = objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _stepCellForIndexPath:inTableView:](self, "_stepCellForIndexPath:inTableView:", v7, v6));
LABEL_7:
      v12 = (void *)v11;
      goto LABEL_8;
    }
  }
  v12 = 0;
LABEL_8:

  return v12;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  -[DirectionsStepsListDataSource _willDisplayCell:forRowAtIndexPath:](self, "_willDisplayCell:forRowAtIndexPath:", a4, a5);
}

- (void)_willDisplayCell:(id)a3 forRowAtIndexPath:(id)a4
{
  void *v6;
  unint64_t v7;
  char *v8;
  int64_t v9;
  char *v10;
  const __CFString *v11;
  __CFString *v12;
  _BOOL4 v13;
  _BOOL4 v14;
  _BOOL4 v15;
  unsigned int v16;
  void *v17;
  uint64_t v18;
  char isKindOfClass;
  _BOOL8 v20;
  void *v21;
  char v22;
  uint64_t v23;
  char v24;
  void *v25;
  void *v26;
  void *v27;
  _BOOL8 v28;
  void *v29;
  id v30;

  v30 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", a4));
  v7 = -[DirectionsStepsListDataSource _rowIndexForCurrentlyMatchedStep](self, "_rowIndexForCurrentlyMatchedStep");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
    v8 = 0;
  else
    v8 = (char *)v7;
  v9 = -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v6, "section"));
  v10 = (char *)objc_msgSend(v6, "row");
  v11 = (const __CFString *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _itemAtIndexPath:](self, "_itemAtIndexPath:", v6));
  v12 = (__CFString *)v11;
  if (v9 == 1 && v8)
  {
    v13 = v10 == v8 - 1;
    v14 = v11 == CFSTR("DestinationPinRow");
LABEL_8:
    v15 = v13;
    v13 = v10 == v8;
    v16 = !-[DirectionsStepsListDataSource _shouldDimStepWithRow:selectedStepIndex:](self, "_shouldDimStepWithRow:selectedStepIndex:", v10, v8);
    goto LABEL_10;
  }
  v13 = 0;
  v14 = v11 == CFSTR("DestinationPinRow");
  if (v9 == 1)
    goto LABEL_8;
  LOBYTE(v16) = 1;
  v15 = 0;
LABEL_10:
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "backgroundView"));
  v18 = objc_opt_class(DirectionsTableViewCellBackgroundView);
  isKindOfClass = objc_opt_isKindOfClass(v17, v18);

  if ((isKindOfClass & 1) != 0)
  {
    v20 = v13 && -[DirectionsStepsListDataSource _shouldHighlightCurrentStep](self, "_shouldHighlightCurrentStep");
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "backgroundView"));
    objc_msgSend(v21, "setHighlightedColor:", v20);

  }
  v22 = !v14;
  if (v12 == CFSTR("FooterView"))
    v22 = 1;
  if ((v22 & 1) != 0)
  {
    if (v12 == CFSTR("FooterView"))
    {
LABEL_23:
      v23 = 0;
      goto LABEL_25;
    }
  }
  else if ((-[DirectionsStepsListDataSource options](self, "options") & 8) == 0)
  {
    goto LABEL_23;
  }
  if ((v13 || v15) && -[DirectionsStepsListDataSource _shouldHighlightCurrentStep](self, "_shouldHighlightCurrentStep"))
    goto LABEL_23;
  v23 = 1;
LABEL_25:
  objc_msgSend(v30, "setSeparatorStyle:", v23);
  if (objc_msgSend(v30, "separatorStyle") == (id)1)
    v24 = v16;
  else
    v24 = 1;
  if ((v24 & 1) == 0)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "separatorColor"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "colorWithAlphaComponent:", 0.150000006));
    objc_msgSend(v30, "setSeparatorColor:", v27);

  }
  if ((objc_opt_respondsToSelector(v30, "setAlignSeparatorWithLeadingText:") & 1) != 0)
  {
    v28 = !v14 || (-[DirectionsStepsListDataSource options](self, "options") & 8) == 0;
    objc_msgSend(v30, "setAlignSeparatorWithLeadingText:", v28);
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v30, "setBackgroundColor:", v29);

}

- (BOOL)tableView:(id)a3 shouldHighlightRowAtIndexPath:(id)a4
{
  void *v5;
  __CFString *v6;
  char isKindOfClass;
  uint64_t v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", a4));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _itemAtIndexPath:](self, "_itemAtIndexPath:", v5));
  if (-[DirectionsStepsListDataSource allowsStepSelection](self, "allowsStepSelection"))
  {
    isKindOfClass = 1;
    if (v6 != CFSTR("OriginPinRow") && v6 != CFSTR("DestinationPinRow"))
    {
      v8 = objc_opt_class(GEOComposedRouteStep);
      isKindOfClass = objc_opt_isKindOfClass(v6, v8);
    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _adjustedItemToSelectFromIndexPath:](self, "_adjustedItemToSelectFromIndexPath:"));
  v6 = objc_opt_class(GEOComposedRouteStep);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "directionsStepsList:didTapRowForRouteStep:");

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource delegate](self, "delegate"));
      objc_msgSend(v9, "directionsStepsList:didTapRowForRouteStep:", self, v5);

    }
  }

}

- (int64_t)numberOfSectionsInCollectionView:(id)a3
{
  if (-[DirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection", a3))
    return 1;
  else
    return -[DirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections");
}

- (int64_t)collectionView:(id)a3 numberOfItemsInSection:(int64_t)a4
{
  uint64_t v6;
  int64_t v7;

  if (!-[DirectionsStepsListDataSource shouldFlattenToSingleSection](self, "shouldFlattenToSingleSection", a3))
    return -[DirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", a4);
  if (-[DirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections") < 1)
    return 0;
  v6 = 0;
  v7 = 0;
  do
    v7 += -[DirectionsStepsListDataSource _numberOfRowsInSection:](self, "_numberOfRowsInSection:", v6++);
  while (v6 < -[DirectionsStepsListDataSource _numberOfSections](self, "_numberOfSections"));
  return v7;
}

- (id)collectionView:(id)a3 cellForItemAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  uint64_t v11;
  void *v12;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v7));
  v9 = v8;
  if (v8)
  {
    v10 = -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v8, "section"));
    switch(v10)
    {
      case 2:
        v11 = objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _footerCellForIndexPath:inCollectionView:](self, "_footerCellForIndexPath:inCollectionView:", v7, v6));
        goto LABEL_9;
      case 1:
        v11 = objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _stepCellForIndexPath:inCollectionView:](self, "_stepCellForIndexPath:inCollectionView:", v7, v6));
        goto LABEL_9;
      case 0:
        v11 = objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _elevationCellForIndexPath:inCollectionView:](self, "_elevationCellForIndexPath:inCollectionView:", v7, v6));
LABEL_9:
        v12 = (void *)v11;
        goto LABEL_10;
    }
  }
  v12 = 0;
LABEL_10:

  return v12;
}

- (BOOL)collectionView:(id)a3 shouldHighlightItemAtIndexPath:(id)a4
{
  void *v5;
  __CFString *v6;
  char isKindOfClass;
  uint64_t v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", a4));
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _itemAtIndexPath:](self, "_itemAtIndexPath:", v5));
  if (-[DirectionsStepsListDataSource allowsStepSelection](self, "allowsStepSelection"))
  {
    isKindOfClass = 1;
    if (v6 != CFSTR("OriginPinRow") && v6 != CFSTR("DestinationPinRow"))
    {
      v8 = objc_opt_class(GEOComposedRouteStep);
      isKindOfClass = objc_opt_isKindOfClass(v6, v8);
    }
  }
  else
  {
    isKindOfClass = 0;
  }

  return isKindOfClass & 1;
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  v10 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _adjustedItemToSelectFromIndexPath:](self, "_adjustedItemToSelectFromIndexPath:"));
  v6 = objc_opt_class(GEOComposedRouteStep);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) != 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource delegate](self, "delegate"));
    v8 = objc_opt_respondsToSelector(v7, "directionsStepsList:didTapRowForRouteStep:");

    if ((v8 & 1) != 0)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource delegate](self, "delegate"));
      objc_msgSend(v9, "directionsStepsList:didTapRowForRouteStep:", self, v5);

    }
  }

}

- (id)_elevationCellForIndexPath:(id)a3 inCollectionView:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v14;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("Elevation"), a3));
  objc_msgSend(v5, "setRoute:", self->_route);
  if (sub_1002A8AA0(v5) == 5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "trailingAccessoryConfigurations"));
    v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));

    if (!v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
      objc_msgSend(v8, "setTintColor:", v9);

      v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("info.circle.fill")));
      objc_msgSend(v8, "setImage:forState:", v10, 0);
      objc_msgSend(v8, "sizeToFit");
      v7 = objc_msgSend(objc_alloc((Class)_UICellAccessoryConfigurationCustomView), "initWithCustomView:", v8);
      v14 = v7;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
      objc_msgSend(v5, "setTrailingAccessoryConfigurations:", v11);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "customView"));
    objc_msgSend(v12, "addTarget:action:forControlEvents:", self, "_handleElevationInfoButtonTap:", 64);

  }
  return v5;
}

- (void)_handleElevationInfoButtonTap:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "directionsStepsList:didTapElevationInfoButton:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource delegate](self, "delegate"));
    objc_msgSend(v6, "directionsStepsList:didTapElevationInfoButton:", self, v7);

  }
}

- (id)_stepCellForIndexPath:(id)a3 inTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  DirectionsStartEndTableViewCell *v13;
  void *v14;
  DirectionsStartEndTableViewCell *v15;
  DirectionsStartEndTableViewCell *v16;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v7));
  v9 = objc_msgSend(v8, "row");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9));

  if (v11 == CFSTR("OriginPinRow") || v11 == CFSTR("DestinationPinRow"))
  {
    if (v6)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class reuseIdentifier](-[DirectionsStepsListDataSource _directionsOriginDestinationCellClass](self, "_directionsOriginDestinationCellClass"), "reuseIdentifier"));
      v15 = (DirectionsStartEndTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v14, v7));
    }
    else
    {
      v16 = [DirectionsStartEndTableViewCell alloc];
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class reuseIdentifier](-[DirectionsStepsListDataSource _directionsOriginDestinationCellClass](self, "_directionsOriginDestinationCellClass"), "reuseIdentifier"));
      v15 = -[DirectionsStartEndTableViewCell initWithStyle:reuseIdentifier:](v16, "initWithStyle:reuseIdentifier:", 0, v14);
    }
    v13 = v15;

    -[DirectionsStepsListDataSource _configureStartEndCell:forIndexPath:](self, "_configureStartEndCell:forIndexPath:", v13, v7);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class reuseIdentifier](-[DirectionsStepsListDataSource _directionsStepCellClass](self, "_directionsStepCellClass"), "reuseIdentifier"));
    v13 = (DirectionsStartEndTableViewCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", v12, v7));

    -[DirectionsStepsListDataSource _configureStepCell:forIndexPath:](self, "_configureStepCell:forIndexPath:", v13, v7);
  }

  return v13;
}

- (id)_stepCellForIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  void *v14;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v7));
  v9 = objc_msgSend(v8, "row");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectAtIndexedSubscript:", v9));

  if (v11 == CFSTR("OriginPinRow") || v11 == CFSTR("DestinationPinRow"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class reuseIdentifier](-[DirectionsStepsListDataSource _directionsOriginDestinationCollectionViewCellClass](self, "_directionsOriginDestinationCollectionViewCellClass"), "reuseIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v14, v7));

    -[DirectionsStepsListDataSource _configureStartEndCell:forIndexPath:](self, "_configureStartEndCell:forIndexPath:", v13, v7);
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[objc_class reuseIdentifier](-[DirectionsStepsListDataSource _directionsStepCollectionViewCellClass](self, "_directionsStepCollectionViewCellClass"), "reuseIdentifier"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", v12, v7));

    -[DirectionsStepsListDataSource _configureStepCell:forIndexPath:](self, "_configureStepCell:forIndexPath:", v13, v7);
  }

  return v13;
}

- (void)_configureStartEndCell:(id)a3 forIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v6 = a3;
  v16 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", a4));
  v7 = objc_msgSend(v16, "row");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
  v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", v7));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "_maps_directionsWaypoints"));

  if (v9 == CFSTR("OriginPinRow"))
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "firstObject"));
  else
    v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "lastObject"));
  v13 = (void *)v12;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[VGVirtualGarage selectedVehicle](self->_virtualGarage, "selectedVehicle"));
  objc_msgSend(v6, "configureForWaypoint:route:selectedVehicle:displayedInRoutePlanning:", v13, v14, v15, -[DirectionsStepsListDataSource isDisplayedInRoutePlanning](self, "isDisplayedInRoutePlanning"));

  objc_msgSend(v6, "setIsDimmedStep:", -[DirectionsStepsListDataSource _isDimmedStepAtIndex:](self, "_isDimmedStepAtIndex:", v7));
}

- (void)_configureStepCell:(id)a3 forIndexPath:(id)a4
{
  void *v6;
  id v7;
  uint64_t v8;
  id v9;
  void *v10;
  DirectionsTableViewCellBackgroundView *v11;
  DirectionsTableViewCellBackgroundView *v12;
  void *v13;
  void *v14;
  void *v15;
  unint64_t v16;
  id v17;
  id v18;

  v18 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", a4));
  v7 = objc_msgSend(v6, "row");
  v8 = objc_opt_class(UITableViewCell);
  if ((objc_opt_isKindOfClass(v18, v8) & 1) != 0)
  {
    v9 = v18;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "backgroundView"));

    if (!v10)
    {
      v11 = [DirectionsTableViewCellBackgroundView alloc];
      objc_msgSend(v9, "bounds");
      v12 = -[DirectionsTableViewCellBackgroundView initWithFrame:](v11, "initWithFrame:");
      objc_msgSend(v9, "setBackgroundView:", v12);

    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", v7));

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
  objc_msgSend(v18, "setRoute:step:stepIndex:alignToLeftEdgeIfNoManeuverSign:size:", v15, v14, objc_msgSend(v14, "stepIndex"), self->_routeHasNoManeuvers, self->_shieldArtworkSize);

  objc_msgSend(v18, "setIsDimmedStep:", -[DirectionsStepsListDataSource _isDimmedStepAtIndex:](self, "_isDimmedStepAtIndex:", v7));
  v16 = -[DirectionsStepsListDataSource _rowIndexForCurrentlyMatchedStep](self, "_rowIndexForCurrentlyMatchedStep");
  if (v16 == 0x7FFFFFFFFFFFFFFFLL)
    v17 = 0;
  else
    v17 = (id)v16;
  objc_msgSend(v18, "setIsSelectedRow:", v7 == v17);

}

- (BOOL)_isDimmedStepAtIndex:(int64_t)a3
{
  unint64_t v5;
  unint64_t v6;

  if (!self->_navigationProvider)
    return 0;
  v5 = -[DirectionsStepsListDataSource _rowIndexForCurrentlyMatchedStep](self, "_rowIndexForCurrentlyMatchedStep");
  if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    v6 = 0;
  else
    v6 = v5;
  return -[DirectionsStepsListDataSource _shouldDimStepWithRow:selectedStepIndex:](self, "_shouldDimStepWithRow:selectedStepIndex:", a3, v6);
}

- (id)_footerCellForIndexPath:(id)a3 inTableView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  RoutePlanningFooterCell *v9;
  RoutePlanningFooterCell *v10;
  int64_t v11;
  void *v12;
  void *v13;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v6));
  -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v8, "section"));
  if (v7)
    v9 = (RoutePlanningFooterCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("FooterView"), v6));
  else
    v9 = -[RoutePlanningFooterCell initWithStyle:reuseIdentifier:]([RoutePlanningFooterCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("FooterView"));
  v10 = v9;
  v11 = -[DirectionsStepsListDataSource _footerCommands](self, "_footerCommands");
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterCell footerView](v10, "footerView"));
  objc_msgSend(v12, "setVisibleCommandSet:", v11);

  -[RoutePlanningFooterCell set_mapkit_separatorStyleOverride:](v10, "set_mapkit_separatorStyleOverride:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningFooterCell footerView](v10, "footerView"));
  objc_msgSend(v13, "setDelegate:", self);

  return v10;
}

- (id)_footerCellForIndexPath:(id)a3 inCollectionView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  int64_t v10;
  void *v11;
  void *v12;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource _indexPathFromFlatIndexPath:](self, "_indexPathFromFlatIndexPath:", v7));
  -[DirectionsStepsListDataSource _sectionAtIndex:](self, "_sectionAtIndex:", objc_msgSend(v8, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithReuseIdentifier:forIndexPath:", CFSTR("FooterView"), v7));

  v10 = -[DirectionsStepsListDataSource _footerCommands](self, "_footerCommands");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "footerView"));
  objc_msgSend(v11, "setVisibleCommandSet:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "footerView"));
  objc_msgSend(v12, "setDelegate:", self);

  return v9;
}

- (int64_t)_footerCommands
{
  if ((id)-[DirectionsStepsListDataSource _idiom](self, "_idiom") == (id)5)
    return 8;
  else
    return 10;
}

- (BOOL)_shouldDimStepWithRow:(unint64_t)a3 selectedStepIndex:(unint64_t)a4
{
  BOOL result;

  result = -[DirectionsStepsListDataSource _shouldHighlightCurrentStep](self, "_shouldHighlightCurrentStep");
  if (a3 >= a4)
    return 0;
  return result;
}

- (double)_rowHeightForStartEndCell:(BOOL)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  double v25;
  CGRect v27;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_directionsWaypoints"));

  if (a3)
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "firstObject"));
  else
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
  v8 = (void *)v7;
  if (v7)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
    if (v9)
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
    else
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
    v12 = v10;
    objc_msgSend(v10, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;

    v21 = objc_msgSend(objc_alloc(-[DirectionsStepsListDataSource _directionsOriginDestinationCellClass](self, "_directionsOriginDestinationCellClass")), "initWithFrame:", v14, v16, v18, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[VGVirtualGarage selectedVehicle](self->_virtualGarage, "selectedVehicle"));
    v24 = -[DirectionsStepsListDataSource isDisplayedInRoutePlanning](self, "isDisplayedInRoutePlanning");
    v27.origin.x = v14;
    v27.origin.y = v16;
    v27.size.width = v18;
    v27.size.height = v20;
    objc_msgSend(v21, "heightForWaypoint:route:selectedVehicle:displayedInRoutePlanning:width:", v8, v22, v23, v24, CGRectGetWidth(v27));
    v11 = v25;

  }
  else
  {
    v11 = 70.0;
  }

  return v11;
}

- (double)_availableWidth
{
  void *v3;
  void *v4;
  void *v5;
  double Width;
  CGRect v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
  v5 = v4;
  objc_msgSend(v4, "bounds");
  Width = CGRectGetWidth(v8);

  return Width;
}

- (int64_t)_idiom
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource tableView](self, "tableView"));
  v4 = v3;
  if (!v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource collectionView](self, "collectionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traitCollection"));
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (!v3)
  return (int64_t)v6;
}

- (double)_calculateWidthForCachedRowHeights
{
  double v3;
  double v4;
  double v5;

  -[DirectionsStepsListDataSource _availableWidth](self, "_availableWidth");
  v4 = v3;
  -[DirectionsStepsListDataSource _trailingViewWidth](self, "_trailingViewWidth");
  return v4 - v5;
}

- (double)_rowHeightForStep:(id)a3
{
  objc_class *v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  void *v9;
  id v10;
  NSObject *v11;
  objc_class *v12;
  void *v13;
  double v14;
  double v15;
  objc_class *v16;
  void *v17;
  double v18;
  id v19;
  NSObject *v20;
  void *v21;
  double v23;
  uint8_t buf[4];
  objc_class *v25;
  __int16 v26;
  double v27;
  __int16 v28;
  objc_class *v29;
  __int16 v30;
  void *v31;

  v4 = (objc_class *)a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
    v6 = objc_msgSend(v5, "indexOfObject:", v4);

    -[DirectionsStepsListDataSource _calculateWidthForCachedRowHeights](self, "_calculateWidthForCachedRowHeights");
    v8 = v7;
    if (!self->_routeStepRowHeights)
    {
      self->_availableWidthForCachedRowHeights = v7;
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource stepsSectionItems](self, "stepsSectionItems"));
      self->_routeStepRowHeights = (double *)malloc_type_calloc((size_t)objc_msgSend(v9, "count"), 8uLL, 0x100004000313F17uLL);

    }
    if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v10 = sub_100431C0C();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412290;
        v25 = v4;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "Invalid step: %@", buf, 0xCu);
      }

      v12 = -[DirectionsStepsListDataSource _directionsStepCellClass](self, "_directionsStepCellClass");
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
      -[objc_class heightForWidth:route:step:idiom:](v12, "heightForWidth:route:step:idiom:", v13, v4, -[DirectionsStepsListDataSource _idiom](self, "_idiom"), v8);
      v15 = v14;

    }
    else
    {
      v15 = self->_routeStepRowHeights[(_QWORD)v6];
      if (v15 == 0.0)
      {
        v16 = -[DirectionsStepsListDataSource _directionsStepCellClass](self, "_directionsStepCellClass");
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
        -[objc_class heightForWidth:route:step:idiom:](v16, "heightForWidth:route:step:idiom:", v17, v4, -[DirectionsStepsListDataSource _idiom](self, "_idiom"), v8);
        v15 = v18;

        if (v15 <= 0.0)
        {
          v19 = sub_100431C0C();
          v20 = objc_claimAutoreleasedReturnValue(v19);
          if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource route](self, "route"));
            *(_DWORD *)buf = 138413058;
            v25 = v16;
            v26 = 2048;
            v27 = v8;
            v28 = 2112;
            v29 = v4;
            v30 = 2112;
            v31 = v21;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_FAULT, "Invalid middle row height, cellClass: %@ width: %f step: %@ route: %@", buf, 0x2Au);

          }
          v15 = self->_routeStepRowHeights[(_QWORD)v6];
        }
        else
        {
          self->_routeStepRowHeights[(_QWORD)v6] = v15;
        }
      }
    }
  }
  else
  {
    +[DirectionsStepTableViewCell cellMetricsForIdiom:](DirectionsStepTableViewCell, "cellMetricsForIdiom:", -[DirectionsStepsListDataSource _idiom](self, "_idiom"));
    v15 = v23;
  }

  return v15;
}

- (double)_trailingViewWidth
{
  return 0.0;
}

- (void)virtualGarageDidUpdate:(id)a3
{
  id v4;
  id v5;
  _QWORD block[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005473AC;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)scrollViewWillEndDragging:(id)a3 withVelocity:(CGPoint)a4 targetContentOffset:(CGPoint *)a5
{
  double y;
  double x;
  id v9;
  id v10;

  y = a4.y;
  x = a4.x;
  v9 = a3;
  v10 = (id)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource scrollViewDelegate](self, "scrollViewDelegate"));
  objc_msgSend(v10, "scrollViewWillEndDragging:withVelocity:targetContentOffset:", v9, a5, x, y);

}

- (void)scrollViewDidScroll:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource scrollViewDelegate](self, "scrollViewDelegate"));
  objc_msgSend(v5, "scrollViewDidScroll:", v4);

  -[DirectionsStepsListDataSource _updateElevationHeaderHeight](self, "_updateElevationHeaderHeight");
}

- (void)scrollViewWillBeginDragging:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[DirectionsStepsListDataSource scrollViewDelegate](self, "scrollViewDelegate"));
  objc_msgSend(v5, "scrollViewWillBeginDragging:", v4);

  objc_msgSend(v4, "contentOffset");
  v7 = v6;

  -[DirectionsStepsListDataSource setScrollViewOffsetStart:](self, "setScrollViewOffsetStart:", v7);
}

- (void)scrollViewDidEndDragging:(id)a3 willDecelerate:(BOOL)a4
{
  -[DirectionsStepsListDataSource setScrollViewDecelerating:](self, "setScrollViewDecelerating:", a4);
}

- (BOOL)allowsStepSelection
{
  return self->_allowStepSelection;
}

- (void)setAllowStepSelection:(BOOL)a3
{
  self->_allowStepSelection = a3;
}

- (UICollectionView)collectionView
{
  return (UICollectionView *)objc_loadWeakRetained((id *)&self->_collectionView);
}

- (RouteStepListDelegate)delegate
{
  return (RouteStepListDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)shouldFlattenToSingleSection
{
  return self->_flattenToSingleSection;
}

- (unint64_t)options
{
  return self->_options;
}

- (id)reloadHandler
{
  return self->_reloadHandler;
}

- (void)setReloadHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 120);
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

- (BOOL)enableNavigationUpdates
{
  return self->_enableNavigationUpdates;
}

- (GEOComposedRoute)route
{
  return self->_route;
}

- (BOOL)usesLargeCells
{
  return self->_useLargeCells;
}

- (BOOL)isDisplayedInRoutePlanning
{
  return self->_displayedInRoutePlanning;
}

- (id)scrollDirectionHandler
{
  return self->_scrollDirectionHandler;
}

- (void)setScrollDirectionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 152);
}

- (int64_t)shieldArtworkSize
{
  return self->_shieldArtworkSize;
}

- (void)setShieldArtworkSize:(int64_t)a3
{
  self->_shieldArtworkSize = a3;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (void)setStepsSectionItems:(id)a3
{
  objc_storeStrong((id *)&self->_stepsSectionItems, a3);
}

- (double)scrollViewOffsetStart
{
  return self->_scrollViewOffsetStart;
}

- (void)setScrollViewOffsetStart:(double)a3
{
  self->_scrollViewOffsetStart = a3;
}

- (BOOL)scrollViewDecelerating
{
  return self->_scrollViewDecelerating;
}

- (void)setScrollViewDecelerating:(BOOL)a3
{
  self->_scrollViewDecelerating = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stepsSectionItems, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong(&self->_scrollDirectionHandler, 0);
  objc_storeStrong((id *)&self->_route, 0);
  objc_destroyWeak((id *)&self->_tableView);
  objc_destroyWeak((id *)&self->_scrollViewDelegate);
  objc_storeStrong(&self->_reloadHandler, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_collectionView);
  objc_storeStrong((id *)&self->_navigationProvider, 0);
  objc_storeStrong((id *)&self->_graphHeaderViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_graphHeaderView, 0);
  objc_storeStrong((id *)&self->_headerTableViewTopAnchorConstraint, 0);
  objc_storeStrong((id *)&self->_headerSuperview, 0);
  objc_storeStrong((id *)&self->_virtualGarage, 0);
  objc_storeStrong((id *)&self->_routeOverviewCellCachedHeight, 0);
}

@end
