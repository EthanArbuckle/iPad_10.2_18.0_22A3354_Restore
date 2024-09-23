@implementation NavdRouteCollectionUpdateProvider

- (NavdRouteCollectionUpdateProvider)initWithNavigationService:(id)a3 routeCollection:(id)a4
{
  id v7;
  RouteCollection *v8;
  NavdRouteCollectionUpdateProvider *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  void *v15;
  RouteCollection *v16;
  RouteCollection *currentRouteCollection;
  id v18;
  NSObject *v19;
  RouteCollection *v20;
  id v21;
  RouteCollection *v22;
  id v23;
  NSObject *v24;
  RouteCollection *v25;
  objc_super v27;
  uint8_t buf[4];
  NavdRouteCollectionUpdateProvider *v29;
  __int16 v30;
  RouteCollection *v31;
  __int16 v32;
  RouteCollection *v33;

  v7 = a3;
  v8 = (RouteCollection *)a4;
  v27.receiver = self;
  v27.super_class = (Class)NavdRouteCollectionUpdateProvider;
  v9 = -[NavdRouteCollectionUpdateProvider init](&v27, "init");
  if (v9)
  {
    v10 = sub_100336540();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134349056;
      v29 = v9;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%{public}p] Initializing", buf, 0xCu);
    }

    objc_storeStrong((id *)&v9->_navigationService, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](v9->_navigationService, "route"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](v9->_navigationService, "route"));
      v14 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v13));

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService alternateRoutes](v9->_navigationService, "alternateRoutes"));
      -[NSObject addObjectsFromArray:](v14, "addObjectsFromArray:", v15);

      v16 = -[RouteCollection initWithRoutes:currentRouteIndex:]([RouteCollection alloc], "initWithRoutes:currentRouteIndex:", v14, 0);
      currentRouteCollection = v9->_currentRouteCollection;
      v9->_currentRouteCollection = v16;

      v18 = sub_100336540();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = v9->_currentRouteCollection;
        *(_DWORD *)buf = 134349314;
        v29 = v9;
        v30 = 2112;
        v31 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "[%{public}p] navd already has a route; using it: %@",
          buf,
          0x16u);
      }

    }
    else
    {
      objc_storeStrong((id *)&v9->_currentRouteCollection, a4);
      v21 = sub_100336540();
      v14 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v22 = v9->_currentRouteCollection;
        *(_DWORD *)buf = 134349314;
        v29 = v9;
        v30 = 2112;
        v31 = v22;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "[%{public}p] using provided route collection: %@", buf, 0x16u);
      }
    }

    if (v8 && !-[RouteCollection isEqual:](v9->_currentRouteCollection, "isEqual:", v8))
    {
      v23 = sub_100336540();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        v25 = v9->_currentRouteCollection;
        *(_DWORD *)buf = 134349570;
        v29 = v9;
        v30 = 2112;
        v31 = v8;
        v32 = 2112;
        v33 = v25;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "[%{public}p] route collections don't match: routeCollection=%@, _currentRouteCollection=%@", buf, 0x20u);
      }

    }
    -[MNNavigationService registerObserver:](v9->_navigationService, "registerObserver:", v9);
    -[MNNavigationService openForClient:](v9->_navigationService, "openForClient:", v9);
  }

  return v9;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  objc_super v7;
  uint8_t buf[4];
  NavdRouteCollectionUpdateProvider *v9;

  v3 = sub_100336540();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134349056;
    v9 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteCollectionUpdateProvider navigationService](self, "navigationService"));
  objc_msgSend(v5, "unregisterObserver:", self);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteCollectionUpdateProvider navigationService](self, "navigationService"));
  objc_msgSend(v6, "closeForClient:", self);

  v7.receiver = self;
  v7.super_class = (Class)NavdRouteCollectionUpdateProvider;
  -[NavdRouteCollectionUpdateProvider dealloc](&v7, "dealloc");
}

- (void)updateRoute:(id)a3
{
  id v4;
  void *v5;
  id v6;
  RouteCollection *v7;
  void *v8;
  NSObject *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint8_t buf[4];
  NavdRouteCollectionUpdateProvider *v15;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteCollectionUpdateProvider currentRouteCollection](self, "currentRouteCollection"));
    v6 = objc_msgSend(v5, "indexOfRoute:", v4);

    if (v6 != (id)0x7FFFFFFFFFFFFFFFLL)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteCollectionUpdateProvider currentRouteCollection](self, "currentRouteCollection"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routeCollectionByChangingCurrentRouteIndex:", v6));
      -[NavdRouteCollectionUpdateProvider setCurrentRouteCollection:](self, "setCurrentRouteCollection:", v12);

      goto LABEL_8;
    }
    v7 = [RouteCollection alloc];
    v13 = v4;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));
    v9 = -[RouteCollection initWithRoutes:currentRouteIndex:](v7, "initWithRoutes:currentRouteIndex:", v8, 0);

    -[NavdRouteCollectionUpdateProvider setCurrentRouteCollection:](self, "setCurrentRouteCollection:", v9);
  }
  else
  {
    v10 = sub_100336540();
    v9 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134349056;
      v15 = self;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%{public}p] updateRoute: received nil route", buf, 0xCu);
    }
  }

LABEL_8:
}

- (void)setCurrentRouteCollection:(id)a3
{
  id v5;
  unint64_t v6;
  unint64_t v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  int v13;
  NavdRouteCollectionUpdateProvider *v14;
  __int16 v15;
  void *v16;

  v5 = a3;
  v6 = self->_currentRouteCollection;
  v7 = (unint64_t)v5;
  if (v7 | v6)
  {
    v8 = objc_msgSend((id)v6, "isEqual:", v7);

    if ((v8 & 1) == 0)
    {
      v9 = sub_100336540();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v7, "shortDescription"));
        v13 = 134349314;
        v14 = self;
        v15 = 2112;
        v16 = v11;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] Updating route collection: %@", (uint8_t *)&v13, 0x16u);

      }
      objc_storeStrong((id *)&self->_currentRouteCollection, a3);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteCollectionUpdateProvider delegate](self, "delegate"));
      objc_msgSend(v12, "routeCollectionUpdateProvider:didUpdateRouteCollection:", self, self->_currentRouteCollection);

    }
  }

}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v7;
  int IsNavigating;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  RouteCollection *v14;
  id v15;
  MNNavigationService *navigationService;
  int v17;
  NavdRouteCollectionUpdateProvider *v18;
  __int16 v19;
  MNNavigationService *v20;

  if ((MNNavigationServiceStateIsNavigating(a4, a2) & 1) == 0)
  {
    IsNavigating = MNNavigationServiceStateIsNavigating(a5, v7);
    if (a5 == 3 || IsNavigating)
    {
      v9 = sub_100336540();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v17 = 134349056;
        v18 = self;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%{public}p] State changed to active guidance", (uint8_t *)&v17, 0xCu);
      }

      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self->_navigationService, "route"));
      if (v12)
      {
        objc_msgSend(v11, "addObject:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService alternateRoutes](self->_navigationService, "alternateRoutes"));
        objc_msgSend(v11, "addObjectsFromArray:", v13);

        v14 = -[RouteCollection initWithRoutes:currentRouteIndex:]([RouteCollection alloc], "initWithRoutes:currentRouteIndex:", v11, 0);
        -[NavdRouteCollectionUpdateProvider setCurrentRouteCollection:](self, "setCurrentRouteCollection:", v14);
      }
      else
      {
        v15 = sub_100336540();
        v14 = (RouteCollection *)objc_claimAutoreleasedReturnValue(v15);
        if (os_log_type_enabled(&v14->super, OS_LOG_TYPE_FAULT))
        {
          navigationService = self->_navigationService;
          v17 = 134349314;
          v18 = self;
          v19 = 2112;
          v20 = navigationService;
          _os_log_impl((void *)&_mh_execute_header, &v14->super, OS_LOG_TYPE_FAULT, "[%{public}p] MNNavigationService (%@) does not have a route", (uint8_t *)&v17, 0x16u);
        }
      }

    }
  }
}

- (void)navigationService:(id)a3 didUpdateAlternateRoutes:(id)a4 traffics:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;

  v7 = a5;
  v8 = a4;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NavdRouteCollectionUpdateProvider currentRouteCollection](self, "currentRouteCollection"));
  v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routeCollectionByReplacingAlternateComposedRoutes:withTraffics:", v8, v7));

  -[NavdRouteCollectionUpdateProvider setCurrentRouteCollection:](self, "setCurrentRouteCollection:", v10);
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  -[NavdRouteCollectionUpdateProvider updateRoute:](self, "updateRoute:", a4);
}

- (void)navigationService:(id)a3 didSwitchToNewTransportType:(int)a4 newRoute:(id)a5 traffic:(id)a6
{
  -[NavdRouteCollectionUpdateProvider updateRoute:](self, "updateRoute:", a5, *(_QWORD *)&a4);
}

- (RouteCollectionUpdateProviderDelegate)delegate
{
  return (RouteCollectionUpdateProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RouteCollection)currentRouteCollection
{
  return self->_currentRouteCollection;
}

- (MNNavigationService)navigationService
{
  return self->_navigationService;
}

- (void)setNavigationService:(id)a3
{
  objc_storeStrong((id *)&self->_navigationService, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationService, 0);
  objc_storeStrong((id *)&self->_currentRouteCollection, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
