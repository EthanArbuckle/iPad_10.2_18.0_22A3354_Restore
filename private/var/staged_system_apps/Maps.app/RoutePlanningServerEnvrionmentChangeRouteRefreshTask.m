@implementation RoutePlanningServerEnvrionmentChangeRouteRefreshTask

- (RoutePlanningServerEnvrionmentChangeRouteRefreshTask)init
{
  RoutePlanningServerEnvrionmentChangeRouteRefreshTask *v2;
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v7;
  uint8_t buf[4];
  RoutePlanningServerEnvrionmentChangeRouteRefreshTask *v9;

  v7.receiver = self;
  v7.super_class = (Class)RoutePlanningServerEnvrionmentChangeRouteRefreshTask;
  v2 = -[RoutePlanningServerEnvrionmentChangeRouteRefreshTask init](&v7, "init");
  if (v2)
  {
    v3 = sub_1002CC26C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134349056;
      v9 = v2;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Initializing", buf, 0xCu);
    }

    v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
    objc_msgSend(v5, "addTileGroupObserver:queue:", v2, &_dispatch_main_q);

  }
  return v2;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  void *v5;
  objc_super v6;
  uint8_t buf[4];
  RoutePlanningServerEnvrionmentChangeRouteRefreshTask *v8;

  v3 = sub_1002CC26C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134349056;
    v8 = self;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "[%{public}p] Deallocating", buf, 0xCu);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[GEOResourceManifestManager modernManager](GEOResourceManifestManager, "modernManager"));
  objc_msgSend(v5, "removeTileGroupObserver:", self);

  v6.receiver = self;
  v6.super_class = (Class)RoutePlanningServerEnvrionmentChangeRouteRefreshTask;
  -[RoutePlanningServerEnvrionmentChangeRouteRefreshTask dealloc](&v6, "dealloc");
}

+ (int64_t)creationPreference
{
  return 2;
}

- (void)platformController:(id)a3 didChangeCurrentSessionFromSession:(id)a4 toSession:(id)a5
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;

  v9 = a5;
  v6 = objc_opt_class(RoutePlanningSession);
  if ((objc_opt_isKindOfClass(v9, v6) & 1) != 0)
    v7 = v9;
  else
    v7 = 0;
  v8 = v7;
  -[RoutePlanningServerEnvrionmentChangeRouteRefreshTask setRoutePlanningSession:](self, "setRoutePlanningSession:", v8);

}

- (void)resourceManifestManager:(id)a3 didChangeActiveTileGroup:(id)a4 fromOldTileGroup:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  void *v13;
  unsigned __int8 v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  void *v22;
  int v23;
  RoutePlanningServerEnvrionmentChangeRouteRefreshTask *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  void *v28;

  v7 = a4;
  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "environment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "environment"));
  v11 = v9;
  v12 = v10;
  if (v11 | v12)
  {
    v13 = (void *)v12;
    v14 = objc_msgSend((id)v11, "isEqual:", v12);

    if ((v14 & 1) == 0)
    {
      v15 = sub_1002CC26C();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "environment"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "environment"));
        v23 = 134349571;
        v24 = self;
        v25 = 2113;
        v26 = v17;
        v27 = 2113;
        v28 = v18;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "[%{public}p] Environment changed %{private}@ -> %{private}@", (uint8_t *)&v23, 0x20u);

      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningServerEnvrionmentChangeRouteRefreshTask routePlanningSession](self, "routePlanningSession"));

      if (v19)
      {
        v20 = sub_1002CC26C();
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          v23 = 134349056;
          v24 = self;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "[%{public}p] Requesting new routes", (uint8_t *)&v23, 0xCu);
        }

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningServerEnvrionmentChangeRouteRefreshTask routePlanningSession](self, "routePlanningSession"));
        objc_msgSend(v22, "requestUpdatedRouteWithRefreshedOrigin:", 0);

      }
    }
  }

}

- (RoutePlanningSession)routePlanningSession
{
  return self->_routePlanningSession;
}

- (void)setRoutePlanningSession:(id)a3
{
  objc_storeStrong((id *)&self->_routePlanningSession, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routePlanningSession, 0);
}

@end
