@implementation WaypointController

- (WaypointController)initWithConfiguration:(id)a3
{
  id v5;
  id v6;
  NSObject *v7;
  _BOOL4 v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  objc_class *v12;
  NSString *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  os_log_type_t v17;
  objc_class *v18;
  NSString *v19;
  WaypointController *v20;
  WaypointController *v21;
  void *v22;
  GEOMapServiceTraits *v23;
  GEOMapServiceTraits *traitsForNextTask;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  const char *v29;
  dispatch_queue_attr_t v30;
  NSObject *v31;
  dispatch_queue_t v32;
  OS_dispatch_queue *isolationQueue;
  uint64_t v34;
  NSMapTable *receivedResults;
  NSMutableArray *v36;
  NSMutableArray *tasks;
  objc_super v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  void *v43;

  v5 = a3;
  v6 = sub_10031892C();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG);

  v9 = sub_10031892C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v8)
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      goto LABEL_7;
    v12 = (objc_class *)objc_opt_class(self);
    v13 = NSStringFromClass(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "debugDescription"));
    *(_DWORD *)buf = 138412546;
    v41 = v14;
    v42 = 2112;
    v43 = v15;
    v16 = v11;
    v17 = OS_LOG_TYPE_DEBUG;
  }
  else
  {
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      goto LABEL_7;
    v18 = (objc_class *)objc_opt_class(self);
    v19 = NSStringFromClass(v18);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "description"));
    *(_DWORD *)buf = 138412546;
    v41 = v14;
    v42 = 2112;
    v43 = v15;
    v16 = v11;
    v17 = OS_LOG_TYPE_INFO;
  }
  _os_log_impl((void *)&_mh_execute_header, v16, v17, "%@ is being initialized: configuration=%@", buf, 0x16u);

LABEL_7:
  v39.receiver = self;
  v39.super_class = (Class)WaypointController;
  v20 = -[WaypointController init](&v39, "init");
  v21 = v20;
  if (v20)
  {
    objc_storeStrong((id *)&v20->_configuration, a3);
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "traits"));
    v23 = (GEOMapServiceTraits *)objc_msgSend(v22, "copy");
    traitsForNextTask = v21->_traitsForNextTask;
    v21->_traitsForNextTask = v23;

    -[GEOMapServiceTraits setRequestPurpose:](v21->_traitsForNextTask, "setRequestPurpose:", 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bundleIdentifier"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.WaypointController.%p"), v26, v21));

    v28 = objc_retainAutorelease(v27);
    v29 = (const char *)objc_msgSend(v28, "UTF8String");
    v30 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v31 = objc_claimAutoreleasedReturnValue(v30);
    v32 = dispatch_queue_create(v29, v31);
    isolationQueue = v21->_isolationQueue;
    v21->_isolationQueue = (OS_dispatch_queue *)v32;

    v34 = objc_claimAutoreleasedReturnValue(+[NSMapTable weakToStrongObjectsMapTable](NSMapTable, "weakToStrongObjectsMapTable"));
    receivedResults = v21->_receivedResults;
    v21->_receivedResults = (NSMapTable *)v34;

    v36 = objc_opt_new(NSMutableArray);
    tasks = v21->_tasks;
    v21->_tasks = v36;

  }
  return v21;
}

- (void)start
{
  NSObject *v3;
  id v4;
  NSObject *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  id v11;
  id buf[2];
  os_activity_scope_state_s state;

  v3 = _os_activity_create((void *)&_mh_execute_header, "Resolve waypoints", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  v4 = sub_10031892C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_signpost_enabled(v5))
  {
    LOWORD(buf[0]) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "StartFetchingGEOComposedWaypoint", ", (uint8_t *)buf, 2u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v6, "postNotificationName:object:", CFSTR("MapsWaypointResolutionDidBeginNotification"), 0);

  objc_initWeak(buf, self);
  v7 = objc_claimAutoreleasedReturnValue(-[WaypointController isolationQueue](self, "isolationQueue"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100318B04;
  v9[3] = &unk_1011AEAA0;
  v10 = v3;
  v8 = v3;
  objc_copyWeak(&v11, buf);
  dispatch_async(v7, v9);

  objc_destroyWeak(&v11);
  objc_destroyWeak(buf);
  os_activity_scope_leave(&state);
}

- (void)_startOnIsolationQueue
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *v22;
  ComposedWaypointTask *v23;
  void *v24;
  id v25;
  id v26;
  uint64_t v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint8_t buf[8];
  _BYTE v38[128];
  _BYTE v39[128];

  v3 = sub_10031892C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Starting waypoint fetching", buf, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[WaypointController isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_V2(v5);

  if (-[WaypointController isRunning](self, "isRunning"))
  {
    v6 = sub_10031892C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "Asked to start fetching waypoints but we already started; ignoring",
        buf,
        2u);
    }
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController configuration](self, "configuration"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requests"));
    v10 = objc_msgSend(v9, "count");

    if ((unint64_t)v10 > 1)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController tasks](self, "tasks"));
      objc_msgSend(v16, "removeAllObjects");

      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController configuration](self, "configuration"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "requests"));

      v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      if (v19)
      {
        v20 = v19;
        v21 = *(_QWORD *)v34;
        do
        {
          v22 = 0;
          do
          {
            if (*(_QWORD *)v34 != v21)
              objc_enumerationMutation(v18);
            v23 = -[ComposedWaypointTask initWithRequest:]([ComposedWaypointTask alloc], "initWithRequest:", *(_QWORD *)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)v22));
            v24 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController tasks](self, "tasks"));
            objc_msgSend(v24, "addObject:", v23);

            v22 = (char *)v22 + 1;
          }
          while (v20 != v22);
          v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
        }
        while (v20);
      }

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v7 = objc_claimAutoreleasedReturnValue(-[WaypointController tasks](self, "tasks", 0));
      v25 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v30;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v30 != v27)
              objc_enumerationMutation(v7);
            -[WaypointController _submitTask:](self, "_submitTask:", *(_QWORD *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)v28));
            v28 = (char *)v28 + 1;
          }
          while (v26 != v28);
          v26 = -[NSObject countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v29, v38, 16);
        }
        while (v26);
      }
    }
    else
    {
      v11 = sub_10031892C();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Cannot load waypoints with nil origin or destination; defaulting to a generic error.",
          buf,
          2u);
      }

      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("WaypointRequestErrorDomain"), 0, 0));
      v14 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:", v13));
      -[WaypointController setResolvedWaypointSetResult:](self, "setResolvedWaypointSetResult:", v14);

      v7 = objc_claimAutoreleasedReturnValue(-[WaypointController delegate](self, "delegate"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController resolvedWaypointSetResult](self, "resolvedWaypointSetResult"));
      -[NSObject waypointController:didResolveWaypointSet:](v7, "waypointController:didResolveWaypointSet:", self, v15);

    }
  }

}

- (void)stop
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[WaypointController isolationQueue](self, "isolationQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100318FEC;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_stopOnIsolationQueue
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  uint8_t buf[8];
  _BYTE v16[128];

  v3 = sub_10031892C();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Stopping waypoint fetching", buf, 2u);
  }

  v5 = objc_claimAutoreleasedReturnValue(-[WaypointController isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_V2(v5);

  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController tasks](self, "tasks", 0));
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
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v10), "cancel");
        v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    }
    while (v8);
  }

  -[WaypointController setActivity:](self, "setActivity:", 0);
}

- (BOOL)isRunning
{
  NSObject *v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v3 = objc_claimAutoreleasedReturnValue(-[WaypointController isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_V2(v3);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController tasks](self, "tasks", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v8, "isLoaded") & 1) == 0 && !objc_msgSend(v8, "isCancelled"))
        {
          LOBYTE(v5) = 1;
          goto LABEL_12;
        }
      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_12:

  return (char)v5;
}

- (void)refresh
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[WaypointController isolationQueue](self, "isolationQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100319348;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_submitTask:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  char *v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26[2];
  uint8_t buf[4];
  void *v28;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[WaypointController isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_V2(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController receivedResults](self, "receivedResults"));
  objc_msgSend(v6, "setObject:forKey:", 0, v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController tasks](self, "tasks"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Waypoint%lu"), objc_msgSend(v7, "indexOfObject:", v4)));

  v9 = sub_10031892C();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = (char *)os_signpost_id_generate(v10);

  v12 = sub_10031892C();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v14 = v13;
  if ((unint64_t)(v11 - 1) <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_DWORD *)buf = 138543362;
    v28 = v8;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v14, OS_SIGNPOST_INTERVAL_BEGIN, (os_signpost_id_t)v11, "FetchGEOComposedWaypoint", "%{public}@", buf, 0xCu);
  }

  v15 = sub_10031892C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
    *(_DWORD *)buf = 138543362;
    v28 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Fetching waypoint with identifier: %{public}@", buf, 0xCu);

  }
  objc_initWeak((id *)buf, self);
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1003196B4;
  v23[3] = &unk_1011B1768;
  objc_copyWeak(v26, (id *)buf);
  v26[1] = v11;
  v18 = v8;
  v24 = v18;
  v19 = v4;
  v25 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController traitsForNextTask](self, "traitsForNextTask"));
  objc_msgSend(v19, "submitWithHandler:traits:networkActivityHandler:", v23, v20, 0);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController traitsForNextTask](self, "traitsForNextTask"));
  v22 = objc_msgSend(v21, "copyByIncrementingSessionCounters");
  -[WaypointController setTraitsForNextTask:](self, "setTraitsForNextTask:", v22);

  objc_destroyWeak(v26);
  objc_destroyWeak((id *)buf);

}

- (void)_processTaskFinished:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  void *v8;
  BOOL v9;
  void *v10;
  _BYTE *v11;
  void *v12;
  char *v13;
  id v14;
  NSObject *v15;
  _BOOL4 v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  _BYTE *v22;
  int64_t v23;
  id v24;
  NSObject *v25;
  id v26;
  id v27;
  void *v28;
  id v29;
  id v30;
  WaypointSet *v31;
  WaypointSet *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  void *v37;
  BOOL v38;
  id v39;
  NSObject *v40;
  NSObject *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  uint64_t v47;
  void *v48;
  id v49;
  void *v50;
  id v51;
  NSObject *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void **v56;
  uint64_t v57;
  void (*v58)(uint64_t, void *);
  void *v59;
  WaypointController *v60;
  id v61;
  id v62;
  _QWORD v63[5];
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t v68[4];
  id v69;
  __int16 v70;
  uint64_t v71;
  _BYTE buf[24];
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;
  _BYTE v76[128];

  v4 = a3;
  v5 = sub_10031892C();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "Processing currently finished waypoint tasks", buf, 2u);
  }

  v7 = objc_claimAutoreleasedReturnValue(-[WaypointController isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_V2(v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController tasks](self, "tasks"));
  v9 = objc_msgSend(v8, "count") == 0;

  if (!v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController tasks](self, "tasks"));
    v11 = objc_msgSend(v10, "count");

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController tasks](self, "tasks"));
    v13 = (char *)objc_msgSend(v12, "indexOfObject:", v4);

    if (v13)
    {
      v14 = sub_10031892C();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      v16 = os_log_type_enabled(v15, OS_LOG_TYPE_INFO);
      if (v13 == v11 - 1)
      {
        if (v16)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Destination is ready", buf, 2u);
        }

        v15 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
        -[NSObject postNotificationName:object:](v15, "postNotificationName:object:", CFSTR("MapsWaypointResolutionDidLoadDestinationNotification"), 0);
      }
      else if (v16)
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v13;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Waypoint %lu loaded", buf, 0xCu);
      }
    }
    else
    {
      v17 = sub_10031892C();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Origin is ready", buf, 2u);
      }

      v15 = objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
      -[NSObject postNotificationName:object:](v15, "postNotificationName:object:", CFSTR("MapsWaypointResolutionDidLoadOriginNotification"), 0);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController receivedResults](self, "receivedResults"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKey:", v4));

    if ((objc_msgSend(v20, "isSuccess") & 1) != 0)
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController receivedResults](self, "receivedResults"));
      v22 = objc_msgSend(v21, "count");

      if (v11 >= v22)
        v23 = v11 - v22;
      else
        v23 = 0;
      if (v11 <= v22)
      {
        v24 = sub_10031892C();
        v25 = objc_claimAutoreleasedReturnValue(v24);
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "All waypoints are ready", buf, 2u);
        }

        v26 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v11);
        v27 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", v11);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController tasks](self, "tasks"));
        v56 = _NSConcreteStackBlock;
        v57 = 3221225472;
        v58 = sub_10031A154;
        v59 = &unk_1011B1848;
        v60 = self;
        v29 = v26;
        v61 = v29;
        v30 = v27;
        v62 = v30;
        objc_msgSend(v28, "enumerateObjectsUsingBlock:", &v56);

        v31 = [WaypointSet alloc];
        v32 = -[WaypointSet initWithWaypoints:](v31, "initWithWaypoints:", v29, v56, v57, v58, v59, v60);
        v33 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithValue:](Result, "resultWithValue:", v32));
        -[WaypointController setResolvedWaypointSetResult:](self, "setResolvedWaypointSetResult:", v33);

        if (objc_msgSend(v30, "count"))
        {
          v34 = sub_10031892C();
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            v36 = objc_msgSend(v30, "count");
            *(_DWORD *)buf = 134218242;
            *(_QWORD *)&buf[4] = v36;
            *(_WORD *)&buf[12] = 2112;
            *(_QWORD *)&buf[14] = v30;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "Found %lu errors while processing finished waypoint tasks: %@", buf, 0x16u);
          }

        }
      }
      v37 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController resolvedWaypointSetResult](self, "resolvedWaypointSetResult"));
      v38 = v37 == 0;

      v39 = sub_10031892C();
      v40 = objc_claimAutoreleasedReturnValue(v39);
      v41 = v40;
      if (v38)
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)&buf[4] = v23;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEBUG, "Still waiting for %lu waypoints to load; do nothing for now",
            buf,
            0xCu);
        }

      }
      else
      {
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          v42 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController resolvedWaypointSetResult](self, "resolvedWaypointSetResult"));
          *(_DWORD *)buf = 134218242;
          *(_QWORD *)&buf[4] = v11;
          *(_WORD *)&buf[12] = 2112;
          *(_QWORD *)&buf[14] = v42;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_INFO, "Finished resolving %lu waypoints: %@", buf, 0x16u);

        }
        v43 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController delegate](self, "delegate"));
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController resolvedWaypointSetResult](self, "resolvedWaypointSetResult"));
        objc_msgSend(v43, "waypointController:didResolveWaypointSet:", self, v44);

      }
    }
    else
    {
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController tasks](self, "tasks"));
      v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
      if (v46)
      {
        v47 = *(_QWORD *)v65;
        do
        {
          v48 = 0;
          do
          {
            if (*(_QWORD *)v65 != v47)
              objc_enumerationMutation(v45);
            v49 = *(id *)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)v48);
            if (v49 != v4)
              objc_msgSend(v49, "cancel");
            v48 = (char *)v48 + 1;
          }
          while (v46 != v48);
          v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
        }
        while (v46);
      }

      -[WaypointController setTasks:](self, "setTasks:", 0);
      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x3032000000;
      v73 = sub_10031A128;
      v74 = sub_10031A138;
      v75 = 0;
      v63[0] = _NSConcreteStackBlock;
      v63[1] = 3221225472;
      v63[2] = sub_10031A144;
      v63[3] = &unk_1011B17D0;
      v63[4] = buf;
      objc_msgSend(v20, "withValue:orError:", &stru_1011B17A8, v63);
      v50 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:", *(_QWORD *)(*(_QWORD *)&buf[8] + 40)));
      -[WaypointController setResolvedWaypointSetResult:](self, "setResolvedWaypointSetResult:", v50);

      v51 = sub_10031892C();
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
      {
        v53 = *(_QWORD *)(*(_QWORD *)&buf[8] + 40);
        *(_DWORD *)v68 = 134218242;
        v69 = v13;
        v70 = 2112;
        v71 = v53;
        _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "Will stop waypoint refinement, error loading waypoint %lu: %@", v68, 0x16u);
      }

      v54 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController delegate](self, "delegate"));
      v55 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController resolvedWaypointSetResult](self, "resolvedWaypointSetResult"));
      objc_msgSend(v54, "waypointController:didResolveWaypointSet:", self, v55);

      _Block_object_dispose(buf, 8);
    }

  }
}

- (NSDictionary)waypointRequestResults
{
  NSObject *v3;
  id v4;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  NSMutableDictionary *v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = sub_10031A128;
  v11 = sub_10031A138;
  v12 = objc_opt_new(NSMutableDictionary);
  v3 = objc_claimAutoreleasedReturnValue(-[WaypointController isolationQueue](self, "isolationQueue"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10031A3C0;
  v6[3] = &unk_1011AD318;
  v6[4] = self;
  v6[5] = &v7;
  dispatch_sync(v3, v6);

  v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (NSDictionary *)v4;
}

- (void)refreshDynamicOrigin
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[WaypointController isolationQueue](self, "isolationQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10031A66C;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_refreshDynamicOrigin
{
  NSObject *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  id v7;
  NSObject *v8;
  _BOOL4 v9;
  ComposedWaypointTask *v10;
  void *v11;
  void *v12;
  void *v13;
  uint8_t v14[16];
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(-[WaypointController isolationQueue](self, "isolationQueue"));
  dispatch_assert_queue_V2(v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController configuration](self, "configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "origin"));
  v6 = objc_msgSend(v5, "isCurrentLocation");

  v7 = sub_10031892C();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  v9 = os_log_type_enabled(v8, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (v9)
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Refreshing dynamic origin waypoint", buf, 2u);
    }

    v10 = [ComposedWaypointTask alloc];
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController configuration](self, "configuration"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "origin"));
    v8 = -[ComposedWaypointTask initWithRequest:](v10, "initWithRequest:", v12);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[WaypointController tasks](self, "tasks"));
    objc_msgSend(v13, "replaceObjectAtIndex:withObject:", 0, v8);

    -[WaypointController _submitTask:](self, "_submitTask:", v8);
  }
  else if (v9)
  {
    *(_WORD *)v14 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "The origin is not the user's current location; will not refresh dynamic origin",
      v14,
      2u);
  }

}

- (void)rebroadcastWaypoints
{
  NSObject *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = objc_claimAutoreleasedReturnValue(-[WaypointController isolationQueue](self, "isolationQueue"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10031A988;
  v4[3] = &unk_1011AD260;
  objc_copyWeak(&v5, &location);
  dispatch_async(v3, v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (WaypointControllerConfiguration)configuration
{
  return self->_configuration;
}

- (WaypointControllerDelegate)delegate
{
  return (WaypointControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (Result)resolvedWaypointSetResult
{
  return (Result *)objc_getProperty(self, a2, 24, 1);
}

- (void)setResolvedWaypointSetResult:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (OS_dispatch_queue)isolationQueue
{
  return self->_isolationQueue;
}

- (NSMutableArray)tasks
{
  return self->_tasks;
}

- (void)setTasks:(id)a3
{
  objc_storeStrong((id *)&self->_tasks, a3);
}

- (NSMapTable)receivedResults
{
  return self->_receivedResults;
}

- (void)setReceivedResults:(id)a3
{
  objc_storeStrong((id *)&self->_receivedResults, a3);
}

- (GEOMapServiceTraits)traitsForNextTask
{
  return self->_traitsForNextTask;
}

- (void)setTraitsForNextTask:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (OS_os_activity)activity
{
  return self->_activity;
}

- (void)setActivity:(id)a3
{
  objc_storeStrong((id *)&self->_activity, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_traitsForNextTask, 0);
  objc_storeStrong((id *)&self->_receivedResults, 0);
  objc_storeStrong((id *)&self->_tasks, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_resolvedWaypointSetResult, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end
