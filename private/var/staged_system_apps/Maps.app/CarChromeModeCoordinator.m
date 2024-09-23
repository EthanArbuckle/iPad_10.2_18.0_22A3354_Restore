@implementation CarChromeModeCoordinator

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1005EC44C;
  block[3] = &unk_1011ACF48;
  block[4] = a1;
  if (qword_1014D2AD0 != -1)
    dispatch_once(&qword_1014D2AD0, block);
  return (id)qword_1014D2AC8;
}

- (CarChromeModeCoordinator)init
{
  CarChromeModeCoordinator *v2;
  void *v3;
  NSHashTable *v4;
  NSHashTable *chromeViewControllers;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CarChromeModeCoordinator;
  v2 = -[CarChromeModeCoordinator init](&v8, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, "_sendSearchCancelFeedback", CFSTR("SiriCanceledMapsSearch"), CFSTR("com.apple.siri.CarDisplay"));

    v4 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 517, 0);
    chromeViewControllers = v2->_chromeViewControllers;
    v2->_chromeViewControllers = v4;

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, "_resetForTestingAction", CFSTR("ResetForTestingActionNotification"), 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeModeCoordinator siriActionSource](self, "siriActionSource"));
  objc_msgSend(v3, "invalidate");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDistributedNotificationCenter defaultCenter](NSDistributedNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

  v5.receiver = self;
  v5.super_class = (Class)CarChromeModeCoordinator;
  -[CarChromeModeCoordinator dealloc](&v5, "dealloc");
}

- (void)addChromeViewController:(id)a3
{
  -[NSHashTable addObject:](self->_chromeViewControllers, "addObject:", a3);
}

- (SiriDirectActionSource)siriActionSource
{
  SiriDirectActionSource *siriActionSource;
  SiriDirectActionSource *v4;
  SiriDirectActionSource *v5;

  siriActionSource = self->_siriActionSource;
  if (!siriActionSource)
  {
    v4 = (SiriDirectActionSource *)objc_alloc_init((Class)SiriDirectActionSource);
    v5 = self->_siriActionSource;
    self->_siriActionSource = v4;

    siriActionSource = self->_siriActionSource;
  }
  return siriActionSource;
}

- (void)popFromContext:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  uint8_t v20[128];
  uint8_t buf[4];
  void *v22;

  v4 = a3;
  v5 = sub_10043364C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_chromeViewControllers, "allObjects"));
    *(_DWORD *)buf = 138412290;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "The top context will be popped. All chrome controllers : %@", buf, 0xCu);

  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_chromeViewControllers, "allObjects"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v12);
        v14[0] = _NSConcreteStackBlock;
        v14[1] = 3221225472;
        v14[2] = sub_1005EC7C4;
        v14[3] = &unk_1011BD650;
        v15 = v4;
        objc_msgSend(v13, "scheduleCoordinatedContextChange:completionHandler:", v14, 0);

        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

}

- (void)_performActionForCarBlock:(id)a3 dashboardMapBlock:(id)a4 smallWidgetsBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  char isKindOfClass;
  void *v19;
  uint64_t v20;
  char v21;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v8 = a3;
  v9 = a4;
  v23 = a5;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_chromeViewControllers, "allObjects"));
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14);
        v16 = objc_retainBlock(v8);
        v17 = objc_opt_class(CarMapWidgetChromeViewController);
        isKindOfClass = objc_opt_isKindOfClass(v15, v17);
        v19 = v9;
        if ((isKindOfClass & 1) != 0
          || (v20 = objc_opt_class(CarSmallWidgetChromeViewController),
              v21 = objc_opt_isKindOfClass(v15, v20),
              v19 = v23,
              (v21 & 1) != 0))
        {
          v22 = objc_retainBlock(v19);

          v16 = v22;
        }
        if (v16)
          (*((void (**)(id, uint64_t))v16 + 2))(v16, v15);

        v14 = (char *)v14 + 1;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v12);
  }

}

- (void)_scheduleCoordinatedContextChangeForViewController:(id)a3 carBlock:(id)a4 dashboardMapBlock:(id)a5 smallWidgetsBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char isKindOfClass;
  void *v14;
  uint64_t v15;
  char v16;
  id v17;
  id v18;

  v18 = a3;
  v9 = a5;
  v10 = a6;
  v11 = objc_retainBlock(a4);
  v12 = objc_opt_class(CarMapWidgetChromeViewController);
  isKindOfClass = objc_opt_isKindOfClass(v18, v12);
  v14 = v9;
  if ((isKindOfClass & 1) != 0
    || (v15 = objc_opt_class(CarSmallWidgetChromeViewController),
        v16 = objc_opt_isKindOfClass(v18, v15),
        v14 = v10,
        (v16 & 1) != 0))
  {
    v17 = objc_retainBlock(v14);

    v11 = v17;
  }
  objc_msgSend(v18, "scheduleCoordinatedContextChange:completionHandler:", v11, 0);

}

- (void)_scheduleCoordinatedContextChangeWithCarBlock:(id)a3 dashboardMapBlock:(id)a4 smallWidgetsBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_chromeViewControllers, "allObjects", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v11);
        -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeForViewController:carBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeForViewController:carBlock:dashboardMapBlock:smallWidgetsBlock:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v15), v8, v9, v10);
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v13);
  }

}

- (void)displayRouteGenius
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  id v12;
  NSObject *v13;
  uint8_t v14[16];
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_chromeViewControllers, "allObjects"));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v16;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v16 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)v7);
        v9 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routeGeniusManager"));
        v11 = objc_msgSend(v10, "isActive");

        if ((v11 & 1) != 0)
        {
          -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeForViewController:carBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeForViewController:carBlock:dashboardMapBlock:smallWidgetsBlock:", v8, &stru_1011BD690, &stru_1011BD6B0, &stru_1011BD6D0);
        }
        else
        {
          v12 = sub_10043364C();
          v13 = objc_claimAutoreleasedReturnValue(v12);
          if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)v14 = 0;
            _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "routeGenius is not active", v14, 2u);
          }

        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v5);
  }

}

- (void)endRouteGenius
{
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BD6F0, &stru_1011BD710, &stru_1011BD730);
}

- (void)displayMapBrowsing
{
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BD750, &stru_1011BD770, &stru_1011BD790);
}

- (void)displayMapRegion:(id *)a3
{
  -[CarChromeModeCoordinator _displayMapRegion:animated:](self, "_displayMapRegion:animated:", 1);
}

- (void)_displayMapRegion:(id *)a3 animated:(BOOL)a4
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  char v12;
  NSObject *v14;
  _QWORD *v15;
  id v16;
  _QWORD v17[8];
  char v18;
  _QWORD v19[8];
  char v20;
  uint8_t buf[16];

  v8 = v4;
  if (v5 < -180.0
    || (v9 = v5, v5 > 180.0)
    || v4 < -90.0
    || v4 > 90.0
    || (v10 = v6, v6 < 0.0)
    || v6 > 180.0
    || (v11 = v7, v7 < 0.0)
    || v7 > 360.0)
  {
    v16 = sub_10043364C();
    v14 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Will not display map region, invalid", buf, 2u);
    }
  }
  else
  {
    v12 = (char)a3;
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1005EDF40;
    v19[3] = &unk_1011BD7B0;
    *(double *)&v19[4] = v4;
    *(double *)&v19[5] = v5;
    *(double *)&v19[6] = v6;
    *(double *)&v19[7] = v7;
    v20 = (char)a3;
    v14 = objc_retainBlock(v19);
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1005EE02C;
    v17[3] = &unk_1011BD7B0;
    *(double *)&v17[4] = v8;
    *(double *)&v17[5] = v9;
    *(double *)&v17[6] = v10;
    *(double *)&v17[7] = v11;
    v18 = v12;
    v15 = objc_retainBlock(v17);
    -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v14, v15, 0);

  }
}

- (void)displayMapPanning
{
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BD7D0, 0, 0);
}

- (void)displayDestinations
{
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BD7F0, 0, 0);
}

- (void)_resolveSearchFieldItemWithSearchInfo:(id)a3 withCompletion:(id)a4
{
  id v5;
  id v6;
  ClientTypeResolver *v7;
  void *v8;
  unsigned int v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  NSObject *v14;
  const char *v15;
  NSObject *v16;
  uint32_t v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[4];
  uint64_t v28;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_alloc_init(ClientTypeResolver);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientResolvedResult"));
    v9 = objc_msgSend(v8, "itemType");
    if (v9 > 6)
    {
LABEL_12:

      goto LABEL_13;
    }
    if (((1 << v9) & 0x19) != 0)
    {
      v13 = sub_10043364C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 134217984;
        v28 = (int)objc_msgSend(v8, "itemType");
        v15 = "Unsupported clientResolved type: %ld";
        v16 = v14;
        v17 = 12;
LABEL_10:
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, v15, buf, v17);
      }
    }
    else
    {
      if (((1 << v9) & 0x46) != 0)
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[ClientTypeResolver personalizedItemSource](v7, "personalizedItemSource"));
        v11 = objc_msgSend(v8, "itemType");
        v25[0] = _NSConcreteStackBlock;
        v25[1] = 3221225472;
        v25[2] = sub_1005EE5CC;
        v25[3] = &unk_1011BD818;
        v26 = v6;
        objc_msgSend(v10, "addressOrLOIWithType:completion:", v11, v25);

        goto LABEL_12;
      }
      v18 = objc_msgSend(v8, "resultIndex");
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
      v20 = objc_msgSend(v19, "count");

      if (v18 < v20)
      {
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectAtIndexedSubscript:", objc_msgSend(v8, "resultIndex")));

        v23 = (void *)objc_claimAutoreleasedReturnValue(+[SearchFieldItem searchFieldItemWithObject:](SearchFieldItem, "searchFieldItemWithObject:", v22));
        (*((void (**)(id, void *))v6 + 2))(v6, v23);

        goto LABEL_12;
      }
      v24 = sub_10043364C();
      v14 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        v15 = "ResultIndex of clientResolved item with type .Server was not found in the searchInfo.results";
        v16 = v14;
        v17 = 2;
        goto LABEL_10;
      }
    }

    goto LABEL_12;
  }
  v12 = sub_10043364C();
  v7 = (ClientTypeResolver *)objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(&v7->super, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, &v7->super, OS_LOG_TYPE_ERROR, "resolveSearchFieldItemWithSearchInfo:withCompletion requires a completion handler", buf, 2u);
  }
LABEL_13:

}

- (void)_handleClientResolvedResultForSearchSession:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentResultsSearchInfo"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1005EE748;
  v7[3] = &unk_1011BD840;
  v8 = v4;
  v6 = v4;
  -[CarChromeModeCoordinator _resolveSearchFieldItemWithSearchInfo:withCompletion:](self, "_resolveSearchFieldItemWithSearchInfo:withCompletion:", v5, v7);

}

- (void)refreshSessionWithEVResults:(id)a3 contexts:(id)a4
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  char isKindOfClass;
  NSObject *v10;
  id v11;
  uint8_t v12[16];

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "count"))
  {
    v11 = sub_10043364C();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "There are no contexts available. Ignoring the call to refresh the ev chargers.", v12, 2u);
    }
    goto LABEL_6;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
  v8 = objc_opt_class(CarSearchResultsModeController);
  isKindOfClass = objc_opt_isKindOfClass(v7, v8);

  if ((isKindOfClass & 1) != 0)
  {
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lastObject"));
    -[NSObject updateChargerAvailabilityWithResults:](v10, "updateChargerAvailabilityWithResults:", v5);
LABEL_6:

  }
}

- (void)displaySearchSession:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  _QWORD *v17;
  id obj;
  _QWORD v19[4];
  id v20;
  id v21;
  CarChromeModeCoordinator *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentResultsSearchInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "placeCollections"));
  if (objc_msgSend(v6, "count"))
  {
    v7 = 1;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "publisher"));
    v7 = v8 != 0;

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "results"));
  v10 = objc_msgSend(v9, "count");

  if (v10 || !v7)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "clientResolvedResult"));

    if (v11)
    {
      -[CarChromeModeCoordinator _handleClientResolvedResultForSearchSession:](self, "_handleClientResolvedResultForSearchSession:", v4);
    }
    else
    {
      v25 = 0u;
      v26 = 0u;
      v23 = 0u;
      v24 = 0u;
      obj = (id)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_chromeViewControllers, "allObjects"));
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v24;
        do
        {
          v15 = 0;
          do
          {
            if (*(_QWORD *)v24 != v14)
              objc_enumerationMutation(obj);
            v16 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)v15);
            v19[0] = _NSConcreteStackBlock;
            v19[1] = 3221225472;
            v19[2] = sub_1005EEA50;
            v19[3] = &unk_1011BD868;
            v20 = v4;
            v21 = v5;
            v22 = self;
            v17 = objc_retainBlock(v19);
            -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeForViewController:carBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeForViewController:carBlock:dashboardMapBlock:smallWidgetsBlock:", v16, v17, 0, 0);

            v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        }
        while (v13);
      }

    }
  }

}

- (void)displaySearchAlongTheRouteForCategory:(id)a3
{
  id v4;
  void *v5;
  void ***v6;
  NSObject *v7;
  id v8;
  void **v9;
  uint64_t v10;
  id (*v11)(uint64_t, uint64_t, void *);
  void *v12;
  NSObject *v13;
  CarChromeModeCoordinator *v14;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9 = _NSConcreteStackBlock;
    v10 = 3221225472;
    v11 = sub_1005EF39C;
    v12 = &unk_1011B06C8;
    v13 = v4;
    v14 = self;
    v6 = objc_retainBlock(&v9);
    -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v6, 0, 0, v9, v10, v11, v12);

    v7 = v13;
  }
  else
  {
    v8 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Will not display SAR, category is nil.", buf, 2u);
    }
  }

}

- (void)_displaySearchAlongTheRouteForSearchSession:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  CarChromeModeCoordinator *v12;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "currentResults"));
  if (objc_msgSend(v5, "count"))
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1005EF638;
    v9[3] = &unk_1011BD868;
    v10 = v5;
    v11 = v4;
    v12 = self;
    v6 = objc_retainBlock(v9);
    -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v6, 0, 0);

    v7 = v10;
  }
  else
  {
    v8 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Will not show or update SAR mode, zero map items received", buf, 2u);
    }
  }

}

- (void)_displaySearchAlongTheRouteForMapItems:(id)a3
{
  -[CarChromeModeCoordinator _displaySearchAlongTheRouteForMapItems:selectedItemIndex:](self, "_displaySearchAlongTheRouteForMapItems:selectedItemIndex:", a3, 0);
}

- (void)_displaySearchAlongTheRouteForMapItems:(id)a3 selectedItemIndex:(unint64_t)a4
{
  id v6;
  void ***v7;
  NSObject *v8;
  id v9;
  void **v10;
  uint64_t v11;
  id (*v12)(uint64_t, uint64_t, void *);
  void *v13;
  NSObject *v14;
  unint64_t v15;
  uint8_t buf[16];

  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v10 = _NSConcreteStackBlock;
    v11 = 3221225472;
    v12 = sub_1005EF908;
    v13 = &unk_1011BD890;
    v14 = v6;
    v15 = a4;
    v7 = objc_retainBlock(&v10);
    -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v7, 0, 0, v10, v11, v12, v13);

    v8 = v14;
  }
  else
  {
    v9 = sub_10043364C();
    v8 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Will not show or update SAR mode, zero map items received", buf, 2u);
    }
  }

}

- (void)endSearchSession:(id)a3
{
  id v4;
  void *v5;
  _QWORD *v6;
  NSObject *v7;
  id v8;
  _QWORD v9[4];
  NSObject *v10;
  uint8_t buf[16];

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1005EFBB8;
    v9[3] = &unk_1011BD650;
    v10 = v4;
    v6 = objc_retainBlock(v9);
    -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v6, 0, 0);

    v7 = v10;
  }
  else
  {
    v8 = sub_10043364C();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Will not end search session, nil session provided.", buf, 2u);
    }
  }

}

- (void)displayIncidentReporting
{
  _QWORD *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1005F0028;
  v4[3] = &unk_1011BD650;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v3, 0, 0);

}

- (void)displayIncidentReportSubmissionWithItem:(id)a3 report:(id)a4
{
  id v6;
  id v7;
  _QWORD *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  CarChromeModeCoordinator *v12;

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1005F020C;
  v9[3] = &unk_1011BD868;
  v10 = a3;
  v11 = a4;
  v12 = self;
  v6 = v11;
  v7 = v10;
  v8 = objc_retainBlock(v9);
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v8, 0, 0);

}

- (id)_replaceTopmostSearchResultContexts:(id)a3 withContext:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  char v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  _QWORD v14[5];
  char v15;
  uint8_t buf[8];
  uint8_t *v17;
  uint64_t v18;
  char *v19;

  v5 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = objc_opt_class(CarRoutePlanningModeController);
    v8 = objc_opt_isKindOfClass(v6, v7) & 1;
    *(_QWORD *)buf = 0;
    v17 = buf;
    v18 = 0x2020000000;
    v19 = 0;
    v19 = (char *)objc_msgSend(v5, "count") - 1;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1005F04D4;
    v14[3] = &unk_1011BD8B8;
    v15 = v8;
    v14[4] = buf;
    objc_msgSend(v5, "enumerateObjectsWithOptions:usingBlock:", 2, v14);
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_maps_subarrayToIndex:", *((_QWORD *)v17 + 3)));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "arrayByAddingObject:", v6));
    _Block_object_dispose(buf, 8);
  }
  else
  {
    v11 = sub_10043364C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Tried to replace top-most non-search mode with a nil. -> Ignoring the call.", buf, 2u);
    }

    v9 = v5;
    v10 = v9;
  }

  return v10;
}

- (void)displaySearchCategories
{
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BD8D8, 0, 0);
}

- (void)displaySearchWithInteractionModel:(unint64_t)a3
{
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  uint8_t v10[16];
  uint8_t buf[16];

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = objc_msgSend(v5, "BOOLForKey:", CFSTR("StarkSearchEnableKeyboard"));

  v7 = sub_10043364C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Will show CarKeyboardModeController because it is set in user defaults", buf, 2u);
    }

    -[CarChromeModeCoordinator displayKeyboardSearchWithInteractionModel:](self, "displayKeyboardSearchWithInteractionModel:", a3);
  }
  else
  {
    if (v9)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Will show Siri search", v10, 2u);
    }

    -[CarChromeModeCoordinator _displaySiriSearch](self, "_displaySiriSearch");
  }
}

- (void)_displaySiriSearch
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v8 = (id)objc_claimAutoreleasedReturnValue(+[SiriDirectActionContext mapSearchDirectActionWithAppBundleId:](SiriDirectActionContext, "mapSearchDirectActionWithAppBundleId:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeModeCoordinator siriActionSource](self, "siriActionSource"));
  objc_msgSend(v5, "activateWithContext:", v8);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "chromeViewController"));
  objc_msgSend(v7, "captureUserAction:onTarget:", 8009, 1010);

}

- (void)_sendSearchCancelFeedback
{
  id v2;
  NSObject *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v2 = sub_10043364C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Notified search was canceled", v6, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chromeViewController"));
  objc_msgSend(v5, "captureUserAction:", 18);

}

- (void)launchIntoKeyboardSearchWithRequestedInteractionModel:(unint64_t)a3
{
  CarKeyboardSearchResultsViewController *v5;

  v5 = objc_alloc_init(CarKeyboardSearchResultsViewController);
  -[CarChromeModeCoordinator _displayKeyboardSearchWithInteractionModel:resultsProvider:animated:](self, "_displayKeyboardSearchWithInteractionModel:resultsProvider:animated:", a3, v5, 0);

}

- (void)displayKeyboardSearchWithInteractionModel:(unint64_t)a3
{
  CarKeyboardSearchResultsViewController *v5;

  v5 = objc_alloc_init(CarKeyboardSearchResultsViewController);
  -[CarChromeModeCoordinator _displayKeyboardSearchWithInteractionModel:resultsProvider:animated:](self, "_displayKeyboardSearchWithInteractionModel:resultsProvider:animated:", a3, v5, 1);

}

- (void)_displayKeyboardSearchWithInteractionModel:(unint64_t)a3 resultsProvider:(id)a4 animated:(BOOL)a5
{
  id v8;
  void *v9;
  unsigned int v10;
  id v11;
  NSObject *v12;
  _QWORD *v13;
  _QWORD v14[4];
  NSObject *v15;
  unint64_t v16;
  BOOL v17;
  uint8_t buf[16];

  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MapsExternalDevice sharedInstance](MapsExternalDevice, "sharedInstance"));
  v10 = objc_msgSend(v9, "disableSoftwareKeyboard");

  if (v10)
  {
    v11 = sub_10043364C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Will not show keyboard, car does not permit it", buf, 2u);
    }
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1005F0BAC;
    v14[3] = &unk_1011BD900;
    v17 = a5;
    v16 = a3;
    v15 = v8;
    v13 = objc_retainBlock(v14);
    -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v13, 0, 0);

    v12 = v15;
  }

}

- (void)displayNavigationSearch
{
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BD920, 0, 0);
}

- (void)displaySearchResultsWithCategory:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005F0FA4;
  v6[3] = &unk_1011BD650;
  v7 = a3;
  v4 = v7;
  v5 = objc_retainBlock(v6);
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v5, 0, 0);

}

- (void)displayCollectionList
{
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BD940, 0, 0);
}

- (void)displaySearchResultsWithCollection:(id)a3
{
  id v4;
  _QWORD *v5;
  _QWORD v6[4];
  id v7;

  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1005F11A4;
  v6[3] = &unk_1011BD650;
  v7 = a3;
  v4 = v7;
  v5 = objc_retainBlock(v6);
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v5, 0, 0);

}

- (void)displayRoutePlanningForDestination:(id)a3
{
  -[CarChromeModeCoordinator displayRoutePlanningForDestination:userInfo:](self, "displayRoutePlanningForDestination:userInfo:", a3, 0);
}

- (void)displayRoutePlanningForDestination:(id)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  id v8;
  _QWORD *v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  void *v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  CarChromeModeCoordinator *v20;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1005F13A0;
    v17[3] = &unk_1011BD868;
    v18 = v6;
    v8 = v7;
    v19 = v8;
    v20 = self;
    v9 = objc_retainBlock(v17);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("skipEndNavigationPrompt")));
    v11 = objc_msgSend(v10, "BOOLValue");

    v12 = v11 ^ 1;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CarSessionController sharedInstance](CarSessionController, "sharedInstance"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1005F1728;
    v15[3] = &unk_1011B1EB0;
    v15[4] = self;
    v16 = v9;
    v14 = v9;
    objc_msgSend(v13, "endNavigationIfNeededWithPrompt:andPerformBlock:", v12, v15);

  }
}

- (void)displayRoutePlanningForExistingRoute
{
  _QWORD *v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_1005F17BC;
  v4[3] = &unk_1011BD650;
  v4[4] = self;
  v3 = objc_retainBlock(v4);
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v3, 0, 0);

}

- (void)endRoutePlanning
{
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BD960, 0, 0);
}

- (void)displayNavigationForRouteCollection:(id)a3 options:(NavigationDetailsOptions *)a4
{
  id v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char isKindOfClass;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  void *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  NavigationSessionBuilder *v30;
  void *v31;
  void *v32;
  void *v33;
  __int128 v34;
  NavigationSessionBuilder *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  NSObject *v40;
  id v41;
  void *v42;
  uint64_t v43;
  char v44;
  void *v45;
  uint8_t buf[16];
  __int128 v47;
  __int128 v48;
  unint64_t navigationModeContext;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "currentRoute"));
  v7 = objc_msgSend(v6, "carplayDestinationHandoffRequired");

  if (v7)
  {
    v8 = sub_10043364C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = "-[CarChromeModeCoordinator displayNavigationForRouteCollection:options:]";
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%s was called while requiring NAD handoff. This is not supported.", buf, 0xCu);
    }

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "platformController"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSession"));
  v13 = objc_opt_class(NavigationSession);
  isKindOfClass = objc_opt_isKindOfClass(v12, v13);

  if ((isKindOfClass & 1) != 0)
  {
    v15 = sub_10043364C();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSession"));
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)&buf[4] = v17;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Attempted to begin navigation, but there is already a NavigationSession on the sessionStack: %@", buf, 0xCu);

    }
    goto LABEL_31;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSession"));
  v19 = objc_opt_class(RouteGeniusSession);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) != 0)
    v20 = v18;
  else
    v20 = 0;
  v16 = v20;

  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSession"));
  v22 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v21, v22) & 1) != 0)
    v23 = v21;
  else
    v23 = 0;
  v24 = v23;

  v45 = v24;
  if (v24)
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "configuration"));
    v26 = (unint64_t)objc_msgSend(v25, "isResumingMultipointRoute");
    v27 = 0;
LABEL_22:

    goto LABEL_23;
  }
  if (v16)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject routeGeniusEntry](v16, "routeGeniusEntry"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "entry"));

    if (objc_msgSend(v25, "type") == (id)11)
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "waypoints"));
      v26 = (unint64_t)objc_msgSend(v29, "count") > 2;

    }
    else
    {
      v26 = 0;
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "sharingContacts"));
    goto LABEL_22;
  }
  v27 = 0;
  v26 = 0;
LABEL_23:
  v30 = [NavigationSessionBuilder alloc];
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "chromeViewController"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "currentTraits"));
  v34 = *(_OWORD *)&a4->guidanceType;
  *(_OWORD *)buf = *(_OWORD *)&a4->shouldSimulateLocations;
  v47 = v34;
  v48 = *(_OWORD *)&a4->isReconnecting;
  navigationModeContext = a4->navigationModeContext;
  v35 = -[NavigationSessionBuilder initWithRouteCollection:navigationDetailsOptions:mapServiceTraits:sessionInitiator:isResumingMultipointRoute:tracePlaybackPath:](v30, "initWithRouteCollection:navigationDetailsOptions:mapServiceTraits:sessionInitiator:isResumingMultipointRoute:tracePlaybackPath:", v5, buf, v33, 2, v26, 0);
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[NavigationSessionBuilder build](v35, "build"));

  if (objc_msgSend(v27, "count"))
  {
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "configuration"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "sharedTripPrefetchContext"));

    objc_msgSend(v38, "setAutomaticSharingContacts:", v27);
    v39 = sub_10043364C();
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = objc_msgSend(v27, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v41;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Populated %lu Share ETA contacts from RG entry", buf, 0xCu);
    }

  }
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "currentSession"));
  v43 = objc_opt_class(RouteGeniusSession);
  v44 = objc_opt_isKindOfClass(v42, v43);

  if ((v44 & 1) != 0)
    objc_msgSend(v11, "replaceCurrentSessionWithSession:", v36);
  else
    objc_msgSend(v11, "pushSession:", v36);

LABEL_31:
}

- (void)displayNavigation
{
  -[CarChromeModeCoordinator _displayNavigationAnimated:](self, "_displayNavigationAnimated:", 1);
}

- (void)launchIntoNavigation
{
  -[CarChromeModeCoordinator _displayNavigationAnimated:](self, "_displayNavigationAnimated:", 0);
}

- (void)_displayNavigationAnimated:(BOOL)a3
{
  _QWORD *v5;
  _QWORD *v6;
  _QWORD *v7;
  _QWORD v8[4];
  BOOL v9;
  _QWORD v10[4];
  BOOL v11;
  _QWORD v12[4];
  BOOL v13;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1005F21C8;
  v12[3] = &unk_1011BD980;
  v13 = a3;
  v5 = objc_retainBlock(v12);
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1005F28D0;
  v10[3] = &unk_1011BD980;
  v11 = a3;
  v6 = objc_retainBlock(v10);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1005F3188;
  v8[3] = &unk_1011BD980;
  v9 = a3;
  v7 = objc_retainBlock(v8);
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v5, v6, v7);

}

- (void)endNavigation
{
  -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BD9A0, &stru_1011BDA00, &stru_1011BDA20);
}

- (void)goToDetail
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = objc_msgSend(v3, "isAnyCarSceneHostingNavigation");

  if ((v4 & 1) != 0)
  {
    -[CarChromeModeCoordinator _performActionForCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_performActionForCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BDA60, &stru_1011BDA80, 0);
  }
  else
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Will not show Overview, no active nav running", v7, 2u);
    }

  }
}

- (void)goToOverview
{
  void *v3;
  unsigned __int8 v4;
  id v5;
  NSObject *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[CarDisplayController sharedInstance](CarDisplayController, "sharedInstance"));
  v4 = objc_msgSend(v3, "isAnyCarSceneHostingNavigation");

  if ((v4 & 1) != 0)
  {
    -[CarChromeModeCoordinator _performActionForCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_performActionForCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BDAA0, &stru_1011BDAC0, 0);
  }
  else
  {
    v5 = sub_10043364C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Will not show Overview, no active nav running", v7, 2u);
    }

  }
}

- (void)displayAllSharedTrips
{
  if (MSPSharedTripReceivingAvailable(self, a2))
    -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BDAE0, 0, 0);
}

- (void)displaySharedTrip:(id)a3
{
  id v4;
  uint64_t v5;
  _QWORD *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  if (MSPSharedTripReceivingAvailable(v4, v5))
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_1005F4200;
    v7[3] = &unk_1011BD650;
    v8 = v4;
    v6 = objc_retainBlock(v7);
    -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", v6, 0, 0);

  }
}

- (void)displayTripSharing
{
  if (MSPSharedTripSharingAvailable(self, a2))
    -[CarChromeModeCoordinator _scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:](self, "_scheduleCoordinatedContextChangeWithCarBlock:dashboardMapBlock:smallWidgetsBlock:", &stru_1011BDB00, 0, 0);
}

- (void)displayTripSharingContactKeyboardSearchWithInteractionModel:(unint64_t)a3 dataSource:(id)a4 searchHandler:(id)a5
{
  id v8;
  id v9;
  CarShareTripKeyboardSearchController *v10;
  _QWORD v11[5];
  id v12;
  id location;

  v8 = a4;
  v9 = a5;
  v10 = -[CarShareTripKeyboardSearchController initWithContactSearchResults:dataSource:searchHandler:]([CarShareTripKeyboardSearchController alloc], "initWithContactSearchResults:dataSource:searchHandler:", 0, v8, v9);
  objc_initWeak(&location, v10);
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1005F4484;
  v11[3] = &unk_1011AEAA0;
  v11[4] = self;
  objc_copyWeak(&v12, &location);
  -[CarShareTripKeyboardSearchController setDismissHandler:](v10, "setDismissHandler:", v11);
  -[CarChromeModeCoordinator _displayKeyboardSearchWithInteractionModel:resultsProvider:animated:](self, "_displayKeyboardSearchWithInteractionModel:resultsProvider:animated:", a3, v10, 1);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)displaySiriTripSharing
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v6 = (id)objc_claimAutoreleasedReturnValue(+[SiriDirectActionContext mapShareEtaDirectActionWithAppBundleId:](SiriDirectActionContext, "mapShareEtaDirectActionWithAppBundleId:", v4));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarChromeModeCoordinator siriActionSource](self, "siriActionSource"));
  objc_msgSend(v5, "activateWithContext:", v6);

}

- (void)cleanupForDisconnect
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[NSHashTable allObjects](self->_chromeViewControllers, "allObjects", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "scheduleCoordinatedContextChange:completionHandler:", &stru_1011BDB20, 0);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)setSiriActionSource:(id)a3
{
  objc_storeStrong((id *)&self->_siriActionSource, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_siriActionSource, 0);
  objc_storeStrong((id *)&self->_chromeViewControllers, 0);
}

@end
