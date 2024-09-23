@implementation RouteLoadingController

- (RouteLoadingController)initWithWaypointSet:(id)a3 taskFactory:(id)a4
{
  id v7;
  id v8;
  RouteLoadingController *v9;
  RouteLoadingController *v10;
  void *v11;
  void *v12;
  NSString *v13;
  void *v14;
  uint64_t v15;
  NSString *activeTasksSync;
  uint64_t v17;
  NSString *routesResultsSync;
  NSMutableDictionary *v19;
  NSMutableDictionary *activeTasks;
  NSMutableDictionary *v21;
  NSMutableDictionary *mutableRoutesResults;
  objc_super v24;

  v7 = a3;
  v8 = a4;
  v24.receiver = self;
  v24.super_class = (Class)RouteLoadingController;
  v9 = -[RouteLoadingController init](&v24, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_waypointSet, a3);
    objc_storeStrong((id *)&v10->_routeLoadingTaskFactory, a4);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bundleIdentifier"));
    v13 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.%p"), v12, objc_opt_class(v10), v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);

    v15 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.activeTasksSync"), v14));
    activeTasksSync = v10->_activeTasksSync;
    v10->_activeTasksSync = (NSString *)v15;

    v17 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.routesResultsSync"), v14));
    routesResultsSync = v10->_routesResultsSync;
    v10->_routesResultsSync = (NSString *)v17;

    v19 = objc_opt_new(NSMutableDictionary);
    activeTasks = v10->_activeTasks;
    v10->_activeTasks = v19;

    v21 = objc_opt_new(NSMutableDictionary);
    mutableRoutesResults = v10->_mutableRoutesResults;
    v10->_mutableRoutesResults = v21;

  }
  return v10;
}

- (NSSet)supportedTransportTypes
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController routeLoadingTaskFactory](self, "routeLoadingTaskFactory"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "supportedTransportTypes"));

  return (NSSet *)v3;
}

- (void)cancelLoading
{
  void *v3;
  void *v4;
  id obj;

  obj = (id)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasksSync](self, "activeTasksSync"));
  objc_sync_enter(obj);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasks](self, "activeTasks"));
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", &stru_1011BE5C0);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasks](self, "activeTasks"));
  objc_msgSend(v4, "removeAllObjects");

  objc_sync_exit(obj);
}

- (void)cancelLoadingForTransportType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id obj;

  obj = (id)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasksSync](self, "activeTasksSync"));
  objc_sync_enter(obj);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasks](self, "activeTasks"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  objc_msgSend(v7, "cancel");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasks](self, "activeTasks"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  objc_msgSend(v8, "removeObjectForKey:", v9);

  objc_sync_exit(obj);
}

- (BOOL)isActive
{
  void *v3;
  void *v4;
  BOOL v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasksSync](self, "activeTasksSync"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasks](self, "activeTasks"));
  v5 = objc_msgSend(v4, "count") != 0;

  objc_sync_exit(v3);
  return v5;
}

- (BOOL)isActiveForTransportType:(int64_t)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController _routeLoadingTaskForTransportType:](self, "_routeLoadingTaskForTransportType:", a3));
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "inProgress");
  else
    v5 = 0;

  return v5;
}

- (void)setWaypointSet:(id)a3
{
  WaypointSet *v5;
  WaypointSet *v6;

  v5 = (WaypointSet *)a3;
  if (self->_waypointSet != v5)
  {
    v6 = v5;
    -[RouteLoadingController cancelLoading](self, "cancelLoading");
    objc_storeStrong((id *)&self->_waypointSet, a3);
    v5 = v6;
  }

}

- (NSDictionary)routesResults
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController routesResultsSync](self, "routesResultsSync"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController mutableRoutesResults](self, "mutableRoutesResults"));
  v5 = objc_msgSend(v4, "copy");

  objc_sync_exit(v3);
  return (NSDictionary *)v5;
}

- (id)routesForTransportType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController routesResultsSync](self, "routesResultsSync"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController mutableRoutesResults](self, "mutableRoutesResults"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

  objc_sync_exit(v5);
  return v8;
}

- (void)refreshRoutesForTransportType:(int64_t)a3
{
  void *v5;
  void *v6;
  unsigned int v7;
  id v8;
  NSObject *v9;
  char *v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  uint64_t IsEnabled_Maps420;
  uint64_t v16;
  uint64_t IsEnabled_DrivingMultiWaypointRoutes;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26[3];
  id buf[2];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController supportedTransportTypes](self, "supportedTransportTypes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    if (-[RouteLoadingController isActiveForTransportType:](self, "isActiveForTransportType:", a3))
      -[RouteLoadingController cancelLoadingForTransportType:](self, "cancelLoadingForTransportType:", a3);
    v8 = sub_10043214C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = (char *)os_signpost_id_generate(v9);

    v11 = sub_10043214C();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = v12;
    if ((unint64_t)(v10 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v10, "RouteLoading", ", (uint8_t *)buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController waypointSet](self, "waypointSet"));
    IsEnabled_Maps420 = (uint64_t)objc_msgSend(v14, "count");
    switch(a3)
    {
      case 0:
        IsEnabled_DrivingMultiWaypointRoutes = MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v16);
        if ((IsEnabled_DrivingMultiWaypointRoutes & 1) == 0)
        {
          IsEnabled_Maps420 = MapsFeature_IsEnabled_Maps420(IsEnabled_DrivingMultiWaypointRoutes);
          if ((IsEnabled_Maps420 & 1) == 0)
            goto LABEL_10;
        }
        break;
      case 1:
        MapsFeature_IsEnabled_DrivingMultiWaypointRoutes(IsEnabled_Maps420, v16);
        break;
      case 2:
LABEL_10:
        MapsFeature_IsEnabled_Maps182(IsEnabled_Maps420);
        break;
      case 5:
        MapsFeature_IsEnabled_Maps420(IsEnabled_Maps420);
        break;
      default:
        break;
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController routeLoadingTaskFactory](self, "routeLoadingTaskFactory"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "taskForTransportType:waypointSet:", a3, v14));

    v20 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasksSync](self, "activeTasksSync"));
    objc_sync_enter(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasks](self, "activeTasks"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v19, v22);

    objc_sync_exit(v20);
    objc_initWeak(buf, self);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[GEONotificationPreferenceManager sharedManager](GEONotificationPreferenceManager, "sharedManager"));
    LODWORD(v20) = objc_msgSend(v23, "isEnabledForSubTestWithName:", CFSTR("GEOPPTTest_RouteManager_DirectionsRequest"));

    if ((_DWORD)v20)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      objc_msgSend(v24, "postNotificationName:object:", CFSTR("GEOPPTTest_RouteManager_DirectionsRequestBEGIN"), 0);

    }
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100627390;
    v25[3] = &unk_1011BE608;
    v26[1] = v10;
    objc_copyWeak(v26, buf);
    v26[2] = (id)a3;
    objc_msgSend(v19, "startWithCompletionHandler:", v25);
    objc_destroyWeak(v26);
    objc_destroyWeak(buf);

  }
}

- (id)_routeLoadingTaskForTransportType:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasksSync](self, "activeTasksSync"));
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasks](self, "activeTasks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));

  objc_sync_exit(v5);
  return v8;
}

- (void)setTransportTypeForRealtimeUpdates:(int64_t)a3
{
  id v5;
  NSObject *v6;
  unint64_t v7;
  const __CFString *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  __int16 v12;
  const __CFString *v13;

  if (self->_transportTypeForRealtimeUpdates != a3)
  {
    v5 = sub_10043214C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v7 = self->_transportTypeForRealtimeUpdates - 1;
      if (v7 > 4)
        v8 = CFSTR("Undefined");
      else
        v8 = off_1011BE690[v7];
      if ((unint64_t)(a3 - 1) > 4)
        v9 = CFSTR("Undefined");
      else
        v9 = off_1011BE690[a3 - 1];
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v9;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Updating transport type for realtime updates: %{public}@ -> %{public}@", (uint8_t *)&v10, 0x16u);
    }

    self->_transportTypeForRealtimeUpdates = a3;
    -[RouteLoadingController _updateTaskForRealtimeUpdates](self, "_updateTaskForRealtimeUpdates");
  }
}

- (void)_updateTaskForRealtimeUpdates
{
  void *v3;
  void *v4;
  id v5;
  _QWORD v6[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController activeTasksSync](self, "activeTasksSync"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController routeUpdatingTask](self, "routeUpdatingTask"));
  objc_msgSend(v4, "stop");

  -[RouteLoadingController setRouteUpdatingTask:](self, "setRouteUpdatingTask:", 0);
  objc_sync_exit(v3);

  if (-[RouteLoadingController transportTypeForRealtimeUpdates](self, "transportTypeForRealtimeUpdates"))
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[RouteLoadingController routesForTransportType:](self, "routesForTransportType:", -[RouteLoadingController transportTypeForRealtimeUpdates](self, "transportTypeForRealtimeUpdates")));
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100627A20;
    v6[3] = &unk_1011B7B30;
    v6[4] = self;
    objc_msgSend(v5, "withValue:orError:", v6, &stru_1011BE628);

  }
}

- (void)_handleResults:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id obj;
  void *v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];

  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController routesForTransportType:](self, "routesForTransportType:", -[RouteLoadingController transportTypeForRealtimeUpdates](self, "transportTypeForRealtimeUpdates")));
    v5 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v4, "count"));
    v6 = objc_msgSend(objc_alloc((Class)NSMutableDictionary), "initWithCapacity:", objc_msgSend(v4, "count"));
    +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("MapsTestingTransitRouteUpdateWillUpdateRoute"), 0, 0);
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v20 = v4;
    obj = v4;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "routeID"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transitUpdate"));
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_100627E88;
          v23[3] = &unk_1011BE650;
          v24 = v12;
          v25 = v13;
          v26 = v5;
          v27 = v6;
          v14 = v13;
          v15 = v12;
          objc_msgSend(v22, "withValue:orError:", v23, &stru_1011BE670);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v8);
    }

    +[PPTNotificationCenter postNotificationIfNeededWithName:object:userInfo:](PPTNotificationCenter, "postNotificationIfNeededWithName:object:userInfo:", CFSTR("MapsTestingTransitRouteUpdateDidUpdateRoute"), 0, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RouteLoadingController delegate](self, "delegate"));
    v17 = objc_msgSend(v6, "copy");
    v18 = objc_msgSend(v5, "copy");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithValue:](Result, "resultWithValue:", v18));
    objc_msgSend(v16, "routeLoadingController:didReceiveUpdates:forRoutesResult:", self, v17, v19);

    v4 = v20;
  }

}

- (RouteLoadingControllerDelegate)delegate
{
  return (RouteLoadingControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RouteLoadingTaskFactory)routeLoadingTaskFactory
{
  return self->_routeLoadingTaskFactory;
}

- (WaypointSet)waypointSet
{
  return self->_waypointSet;
}

- (int64_t)transportTypeForRealtimeUpdates
{
  return self->_transportTypeForRealtimeUpdates;
}

- (NSMutableDictionary)activeTasks
{
  return self->_activeTasks;
}

- (void)setActiveTasks:(id)a3
{
  objc_storeStrong((id *)&self->_activeTasks, a3);
}

- (NSMutableDictionary)mutableRoutesResults
{
  return self->_mutableRoutesResults;
}

- (void)setMutableRoutesResults:(id)a3
{
  objc_storeStrong((id *)&self->_mutableRoutesResults, a3);
}

- (RouteUpdatingTask)routeUpdatingTask
{
  return self->_routeUpdatingTask;
}

- (void)setRouteUpdatingTask:(id)a3
{
  objc_storeStrong((id *)&self->_routeUpdatingTask, a3);
}

- (NSString)activeTasksSync
{
  return self->_activeTasksSync;
}

- (NSString)routesResultsSync
{
  return self->_routesResultsSync;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_routesResultsSync, 0);
  objc_storeStrong((id *)&self->_activeTasksSync, 0);
  objc_storeStrong((id *)&self->_routeUpdatingTask, 0);
  objc_storeStrong((id *)&self->_mutableRoutesResults, 0);
  objc_storeStrong((id *)&self->_activeTasks, 0);
  objc_storeStrong((id *)&self->_waypointSet, 0);
  objc_storeStrong((id *)&self->_routeLoadingTaskFactory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
