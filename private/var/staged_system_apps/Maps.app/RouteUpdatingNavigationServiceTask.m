@implementation RouteUpdatingNavigationServiceTask

- (RouteUpdatingNavigationServiceTask)initWithRoutes:(id)a3
{
  id v4;
  RouteUpdatingNavigationServiceTask *v5;
  void *v6;
  void *v7;
  NSString *v8;
  void *v9;
  id v10;
  const char *v11;
  dispatch_queue_attr_t v12;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *isolationQueue;
  id v16;
  id v17;
  void *v18;
  NSSet *v19;
  NSSet *routeIDs;
  id v21;
  id v22;
  void *v23;
  NSSet *v24;
  NSSet *routeUpdateRequests;
  void *v26;
  void *v27;
  void *v28;
  objc_super v30;

  v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)RouteUpdatingNavigationServiceTask;
  v5 = -[RouteUpdatingNavigationServiceTask init](&v30, "init");
  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
    v8 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@.%@.isolationQueue.%p"), v7, objc_opt_class(v5), v5);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

    v10 = objc_retainAutorelease(v9);
    v11 = (const char *)objc_msgSend(v10, "UTF8String");
    v12 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    v14 = dispatch_queue_create(v11, v13);
    isolationQueue = v5->_isolationQueue;
    v5->_isolationQueue = (OS_dispatch_queue *)v14;

    v16 = objc_alloc((Class)NSSet);
    v17 = sub_10039DCD4(v4, &stru_1011B7FC8);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = (NSSet *)objc_msgSend(v16, "initWithArray:", v18);
    routeIDs = v5->_routeIDs;
    v5->_routeIDs = v19;

    v21 = objc_alloc((Class)NSSet);
    v22 = sub_10039DCD4(v4, &stru_1011B8008);
    v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
    v24 = (NSSet *)objc_msgSend(v21, "initWithArray:", v23);
    routeUpdateRequests = v5->_routeUpdateRequests;
    v5->_routeUpdateRequests = v24;

    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v26, "addObserver:selector:name:object:", v5, "_didEnterBackground", MKApplicationStateDidEnterBackgroundNotification, 0);

    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v27, "addObserver:selector:name:object:", v5, "_willEnterForeground", MKApplicationStateWillEnterForegroundNotification, 0);

    v28 = (void *)objc_claimAutoreleasedReturnValue(+[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance"));
    objc_msgSend(v28, "startObserving");

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  -[GEOTransitRouteUpdater setActive:](self->_transitRouteUpdater, "setActive:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance"));
  objc_msgSend(v4, "stopObserving");

  v5.receiver = self;
  v5.super_class = (Class)RouteUpdatingNavigationServiceTask;
  -[RouteUpdatingNavigationServiceTask dealloc](&v5, "dealloc");
}

- (void)startWithUpdateHandler:(id)a3
{
  id v4;
  NSObject *isolationQueue;
  id v6;
  _QWORD block[5];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100482EB4;
  block[3] = &unk_1011B8030;
  v9 = &v10;
  block[4] = self;
  v6 = v4;
  v8 = v6;
  dispatch_sync(isolationQueue, block);
  if (!*((_BYTE *)v11 + 24))
  {
    -[RouteUpdatingNavigationServiceTask _updateRouteUpdateObservationIfNeededWithRoutes:](self, "_updateRouteUpdateObservationIfNeededWithRoutes:", 0);
    -[RouteUpdatingNavigationServiceTask _refreshUpdateEnabledForCurrentState](self, "_refreshUpdateEnabledForCurrentState");
  }

  _Block_object_dispose(&v10, 8);
}

- (void)stop
{
  NSObject *isolationQueue;
  void *v4;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  isolationQueue = self->_isolationQueue;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100482FF8;
  v5[3] = &unk_1011ADF48;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(isolationQueue, v5);
  if (!*((_BYTE *)v7 + 24))
  {
    -[GEOTransitRouteUpdater setActive:](self->_transitRouteUpdater, "setActive:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v4, "unregisterObserver:", self);

  }
  _Block_object_dispose(&v6, 8);
}

- (void)_didEnterBackground
{
  -[RouteUpdatingNavigationServiceTask _pauseUpdates](self, "_pauseUpdates");
}

- (void)_willEnterForeground
{
  -[RouteUpdatingNavigationServiceTask _resumeUpdates](self, "_resumeUpdates");
}

- (void)_pauseUpdates
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100483094;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

- (void)_resumeUpdates
{
  NSObject *isolationQueue;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100483254;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_async(isolationQueue, block);
}

- (void)_refreshUpdateEnabledForCurrentState
{
  void *v3;
  unsigned int v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MKApplicationStateMonitor sharedInstance](MKApplicationStateMonitor, "sharedInstance"));
  v4 = objc_msgSend(v3, "isInBackground");

  if (v4)
  {
    -[RouteUpdatingNavigationServiceTask _pauseUpdates](self, "_pauseUpdates");
  }
  else if (self->_transitRouteUpdater
         || (v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService")),
             v6 = objc_msgSend(v5, "state"),
             v5,
             v6 == (id)2))
  {
    -[RouteUpdatingNavigationServiceTask _resumeUpdates](self, "_resumeUpdates");
  }
}

- (BOOL)_shouldUseNavigationServiceForRoutes:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  NSSet *routeIDs;
  unsigned __int8 v8;
  id v9;
  NSObject *isolationQueue;
  void *v11;
  void *v12;
  _QWORD v14[6];
  __int128 buf;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v4 = a3;
  if (GEOConfigGetBOOL(MapsConfig_TransitRouteUpdatesAlwaysUseLocalUpdater, off_1014B3DF8))
  {
    v5 = sub_10043214C();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      routeIDs = self->_routeIDs;
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = routeIDs;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Forcing use of local updater for routes: %@", (uint8_t *)&buf, 0xCu);
    }
    v8 = 0;
  }
  else
  {
    if (!v4)
    {
      v8 = 1;
      goto LABEL_8;
    }
    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
    v9 = sub_10039DCD4(v4, &stru_1011B8050);
    v6 = objc_claimAutoreleasedReturnValue(v9);
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v16 = 0x3032000000;
    v17 = sub_10048363C;
    v18 = sub_10048364C;
    v19 = 0;
    isolationQueue = self->_isolationQueue;
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100483654;
    v14[3] = &unk_1011ADF48;
    v14[4] = self;
    v14[5] = &buf;
    dispatch_sync(isolationQueue, v14);
    v11 = *(void **)(*((_QWORD *)&buf + 1) + 40);
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v6));
    v8 = objc_msgSend(v11, "isEqualToSet:", v12);

    _Block_object_dispose(&buf, 8);
  }

LABEL_8:
  return v8;
}

- (void)_updateRouteUpdateObservationIfNeededWithRoutes:(id)a3
{
  NSObject *isolationQueue;
  id v5;
  unsigned __int8 v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[5];

  isolationQueue = self->_isolationQueue;
  v5 = a3;
  dispatch_assert_queue_not_V2(isolationQueue);
  v6 = -[RouteUpdatingNavigationServiceTask _shouldUseNavigationServiceForRoutes:](self, "_shouldUseNavigationServiceForRoutes:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v8 = v7;
  if ((v6 & 1) != 0)
  {
    objc_msgSend(v7, "registerObserver:", self);

    v9 = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100483760;
    block[3] = &unk_1011AC860;
    block[4] = self;
    dispatch_sync(v9, block);
  }
  else
  {
    objc_msgSend(v7, "unregisterObserver:", self);

    -[RouteUpdatingNavigationServiceTask _createTransitRouteUpdaterIfNeeded](self, "_createTransitRouteUpdaterIfNeeded");
  }
}

- (void)_createTransitRouteUpdaterIfNeeded
{
  NSObject *isolationQueue;
  _QWORD block[5];

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  isolationQueue = self->_isolationQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10048389C;
  block[3] = &unk_1011AC860;
  block[4] = self;
  dispatch_sync(isolationQueue, block);
}

- (void)navigationService:(id)a3 didUpdatePreviewRoutes:(id)a4 withSelectedRouteIndex:(unint64_t)a5
{
  -[RouteUpdatingNavigationServiceTask _updateRouteUpdateObservationIfNeededWithRoutes:](self, "_updateRouteUpdateObservationIfNeededWithRoutes:", a4);
  -[RouteUpdatingNavigationServiceTask _refreshUpdateEnabledForCurrentState](self, "_refreshUpdateEnabledForCurrentState");
}

- (void)navigationService:(id)a3 didReceiveRealtimeUpdates:(id)a4
{
  id v6;
  NSObject *isolationQueue;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _QWORD block[7];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  id (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint8_t buf[4];
  id v46;
  __int16 v47;
  uint64_t v48;
  _BYTE v49[128];

  v27 = a3;
  v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  if (objc_msgSend(v6, "count"))
  {
    v39 = 0;
    v40 = &v39;
    v41 = 0x3032000000;
    v42 = sub_10048363C;
    v43 = sub_10048364C;
    v44 = 0;
    v33 = 0;
    v34 = &v33;
    v35 = 0x3032000000;
    v36 = sub_100483DA8;
    v37 = sub_100483DD0;
    v38 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100483DD8;
    block[3] = &unk_1011B8078;
    block[4] = self;
    block[5] = &v39;
    block[6] = &v33;
    dispatch_sync(isolationQueue, block);
    v8 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v6, "count", v27));
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v9 = v6;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v49, 16);
    if (v10)
    {
      v11 = *(_QWORD *)v29;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(_QWORD *)v29 != v11)
            objc_enumerationMutation(v9);
          v13 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
          v14 = objc_opt_class(MNRealtimeTransitUpdate);
          if ((objc_opt_isKindOfClass(v13, v14) & 1) != 0)
          {
            v15 = (void *)v40[5];
            v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "routeID"));
            LODWORD(v15) = objc_msgSend(v15, "containsObject:", v16);

            if ((_DWORD)v15)
            {
              v17 = v13;
              v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "routeID"));
              v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "transitUpdate"));
              v20 = (void *)objc_claimAutoreleasedReturnValue(+[RouteUpdatingTaskResult resultWithRouteID:transitUpdate:](RouteUpdatingTaskResult, "resultWithRouteID:transitUpdate:", v18, v19));

              objc_msgSend(v8, "addObject:", v20);
            }
          }
        }
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v49, 16);
      }
      while (v10);
    }

    if (objc_msgSend(v8, "count"))
    {
      v21 = sub_10043214C();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = objc_msgSend(v8, "count");
        v24 = v40[5];
        *(_DWORD *)buf = 134218242;
        v46 = v23;
        v47 = 2112;
        v48 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Received %lu navd realtime updates for routes: %@", buf, 0x16u);
      }

      v25 = v34[5];
      v26 = objc_msgSend(v8, "copy");
      (*(void (**)(uint64_t, id))(v25 + 16))(v25, v26);

    }
    _Block_object_dispose(&v33, 8);

    _Block_object_dispose(&v39, 8);
  }

}

- (void)transitRouteUpdater:(id)a3 didReceiveResponse:(id)a4
{
  id v6;
  NSObject *isolationQueue;
  id v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  void *i;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD block[7];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  id (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint8_t buf[4];
  id v47;
  __int16 v48;
  uint64_t v49;
  _BYTE v50[128];

  v28 = a3;
  v6 = a4;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_isolationQueue);
  if (v6)
  {
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = sub_10048363C;
    v44 = sub_10048364C;
    v45 = 0;
    v34 = 0;
    v35 = &v34;
    v36 = 0x3032000000;
    v37 = sub_100483DA8;
    v38 = sub_100483DD0;
    v39 = 0;
    isolationQueue = self->_isolationQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004841CC;
    block[3] = &unk_1011B8078;
    block[4] = self;
    block[5] = &v40;
    block[6] = &v34;
    dispatch_sync(isolationQueue, block);
    v8 = objc_alloc((Class)NSMutableArray);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeUpdates", v28));
    v10 = objc_msgSend(v8, "initWithCapacity:", objc_msgSend(v9, "count"));

    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeUpdates"));
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v50, 16);
    if (v12)
    {
      v13 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(_QWORD *)v30 != v13)
            objc_enumerationMutation(v11);
          v15 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
          v16 = (void *)v41[5];
          v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routeIdentifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "clientRouteID"));
          LOBYTE(v16) = objc_msgSend(v16, "containsObject:", v18);

          if ((v16 & 1) != 0)
          {
            v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routeIdentifier"));
            v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "clientRouteID"));
            v21 = (void *)objc_claimAutoreleasedReturnValue(+[RouteUpdatingTaskResult resultWithRouteID:transitUpdate:](RouteUpdatingTaskResult, "resultWithRouteID:transitUpdate:", v20, v15));

            objc_msgSend(v10, "addObject:", v21);
          }
        }
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v29, v50, 16);
      }
      while (v12);
    }

    if (objc_msgSend(v10, "count"))
    {
      v22 = sub_10043214C();
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        v24 = objc_msgSend(v10, "count");
        v25 = v41[5];
        *(_DWORD *)buf = 134218242;
        v47 = v24;
        v48 = 2112;
        v49 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Received %lu private realtime updates for routes: %@", buf, 0x16u);
      }

      v26 = v35[5];
      v27 = objc_msgSend(v10, "copy");
      (*(void (**)(uint64_t, id))(v26 + 16))(v26, v27);

    }
    _Block_object_dispose(&v34, 8);

    _Block_object_dispose(&v40, 8);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitRouteUpdater, 0);
  objc_storeStrong((id *)&self->_isolationQueue, 0);
  objc_storeStrong((id *)&self->_routeUpdateRequests, 0);
  objc_storeStrong((id *)&self->_routeIDs, 0);
  objc_storeStrong(&self->_handler, 0);
}

@end
