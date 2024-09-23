@implementation RideBookingDataCoordinator

- (RideBookingDataCoordinator)init
{
  RideBookingDataCoordinator *v3;

  v3 = -[RideBookingDataCoordinator initWithRideBookingApplicationFinder:]([RideBookingDataCoordinator alloc], "initWithRideBookingApplicationFinder:", 0);

  return v3;
}

- (RideBookingDataCoordinator)initWithRideBookingApplicationFinder:(id)a3
{
  RideBookingApplicationFinder *v4;
  RideBookingDataCoordinator *v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  dispatch_queue_attr_t v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *processQueue;
  OS_dispatch_source *refreshRideOptionsTimer;
  OS_dispatch_source *requestRideExpireTimer;
  NSMutableDictionary *v16;
  NSMutableDictionary *applications;
  NSMutableDictionary *v18;
  NSMutableDictionary *rideOptionStatusMap;
  NSMutableDictionary *v20;
  NSMutableDictionary *rideStatusMap;
  void *v22;
  void *v23;
  NSMutableDictionary *v24;
  NSMutableDictionary *completedRideIdentifiersAndDatesMap;
  NSHashTable *v26;
  NSHashTable *rideOptionStateObservers;
  NSHashTable *v28;
  NSHashTable *requestRideObservers;
  NSHashTable *v30;
  NSHashTable *rideStatusObservers;
  objc_super v33;
  uint8_t buf[4];
  char *v35;
  __int16 v36;
  id v37;

  v4 = (RideBookingApplicationFinder *)a3;
  v33.receiver = self;
  v33.super_class = (Class)RideBookingDataCoordinator;
  v5 = -[RideBookingDataCoordinator init](&v33, "init");
  if (v5)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Initializing RideBookingDataCoordinator with RideBookingApplicationFinder: %@"), v4);
      *(_DWORD *)buf = 136315394;
      v35 = v8;
      v36 = 2112;
      v37 = v9;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    v10 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = dispatch_queue_create("com.apple.maps.RideBookingDataCoordinator", v11);
    processQueue = v5->_processQueue;
    v5->_processQueue = (OS_dispatch_queue *)v12;

    refreshRideOptionsTimer = v5->_refreshRideOptionsTimer;
    v5->_refreshRideOptionsTimer = 0;

    requestRideExpireTimer = v5->_requestRideExpireTimer;
    v5->_requestRideExpireTimer = 0;

    if (!v4)
      v4 = objc_alloc_init(RideBookingApplicationFinder);
    objc_storeStrong((id *)&v5->_applicationFinder, v4);
    -[RideBookingApplicationFinder setDelegate:](v5->_applicationFinder, "setDelegate:", v5);
    v16 = objc_opt_new(NSMutableDictionary);
    applications = v5->_applications;
    v5->_applications = v16;

    v18 = objc_opt_new(NSMutableDictionary);
    rideOptionStatusMap = v5->_rideOptionStatusMap;
    v5->_rideOptionStatusMap = v18;

    v20 = objc_opt_new(NSMutableDictionary);
    rideStatusMap = v5->_rideStatusMap;
    v5->_rideStatusMap = v20;

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "dictionaryForKey:", CFSTR("RideBookingCompletedRideIdentifiersAndDates")));

    if (v23)
      v24 = (NSMutableDictionary *)objc_msgSend(v23, "mutableCopy");
    else
      v24 = objc_opt_new(NSMutableDictionary);
    completedRideIdentifiersAndDatesMap = v5->_completedRideIdentifiersAndDatesMap;
    v5->_completedRideIdentifiersAndDatesMap = v24;

    -[RideBookingDataCoordinator _flushCompletedRideIdentifiersAndDatesMap](v5, "_flushCompletedRideIdentifiersAndDatesMap");
    v26 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 517, 0);
    rideOptionStateObservers = v5->_rideOptionStateObservers;
    v5->_rideOptionStateObservers = v26;

    v28 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 517, 0);
    requestRideObservers = v5->_requestRideObservers;
    v5->_requestRideObservers = v28;

    v30 = (NSHashTable *)objc_msgSend(objc_alloc((Class)NSHashTable), "initWithOptions:capacity:", 517, 0);
    rideStatusObservers = v5->_rideStatusObservers;
    v5->_rideStatusObservers = v30;

    v5->_waitingAppSuggestionsToLoad = 1;
  }

  return v5;
}

- (void)dealloc
{
  objc_super v3;

  -[RideBookingDataCoordinator _stopTimer:](self, "_stopTimer:", &self->_refreshRideOptionsTimer);
  -[RideBookingDataCoordinator _stopTimer:](self, "_stopTimer:", &self->_requestRideExpireTimer);
  v3.receiver = self;
  v3.super_class = (Class)RideBookingDataCoordinator;
  -[RideBookingDataCoordinator dealloc](&v3, "dealloc");
}

- (void)_flushCompletedRideIdentifiersAndDatesMap
{
  uint64_t Log;
  NSObject *v5;
  char *v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  NSObject *processQueue;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  id v17;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v7 = objc_alloc((Class)NSString);
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@"), v9);
    *(_DWORD *)buf = 136315394;
    v15 = v6;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004E5B6C;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v13, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)rideBookingApplicationsDidChange:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  id v21;

  v5 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v9 = objc_alloc((Class)NSString);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
    *(_DWORD *)buf = 136315394;
    v19 = v8;
    v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004E6168;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v17, (id *)buf);
  v16 = v5;
  v14 = v5;
  dispatch_async(processQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)addRideBookingDataCoordinatorRideOptionStateObserver:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  id v21;

  v5 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v9 = objc_alloc((Class)NSString);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
    *(_DWORD *)buf = 136315394;
    v19 = v8;
    v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004E6AF8;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v17, (id *)buf);
  v16 = v5;
  v14 = v5;
  dispatch_async(processQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)removeRideBookingDataCoordinatorRideOptionStateObserver:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  id v21;

  v5 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v9 = objc_alloc((Class)NSString);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
    *(_DWORD *)buf = 136315394;
    v19 = v8;
    v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004E7058;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v17, (id *)buf);
  v16 = v5;
  v14 = v5;
  dispatch_async(processQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)_broadcastRideOptionStateDidChange
{
  uint64_t v4;
  uint64_t Log;
  NSObject *v6;
  char *v7;
  id v8;
  NSString *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  RideBookingDataCoordinator *v27;
  void *v28;
  char *v29;
  id v30;
  uint64_t v31;
  NSObject *v32;
  char *v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  id v41;
  void *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t v47[128];
  uint8_t buf[4];
  char *v49;
  __int16 v50;
  id v51;

  v4 = DefaultLoggingSubsystem;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  v40 = v4;
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v8 = objc_alloc((Class)NSString);
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@"), v10);
    *(_DWORD *)buf = 136315394;
    v49 = v7;
    v4 = v40;
    v50 = 2112;
    v51 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator rideOptionStateObservers](self, "rideOptionStateObservers"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v44;
    v39 = *(_QWORD *)v44;
    do
    {
      v16 = 0;
      v41 = v14;
      do
      {
        if (*(_QWORD *)v44 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)v16);
        if ((objc_opt_respondsToSelector(v17, "rideOptionStateDidChange:") & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator rideOptionStatusMap](self, "rideOptionStatusMap"));
          v19 = objc_msgSend(v18, "copy");

          if (-[RideBookingDataCoordinator waitingAppSuggestionsToLoad](self, "waitingAppSuggestionsToLoad"))
          {
            v20 = 0;
          }
          else
          {
            v21 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator appStoreSuggestions](self, "appStoreSuggestions"));
            v20 = objc_msgSend(v21, "copy");

          }
          if (-[RideBookingDataCoordinator waitingAppSuggestionsToLoad](self, "waitingAppSuggestionsToLoad"))
          {
            v22 = 0;
          }
          else
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator installedSuggestions](self, "installedSuggestions"));
            v22 = objc_msgSend(v23, "copy");

          }
          v42 = v19;
          v24 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingRideOptionState stateWithRideOptionStatusMap:appStoreSuggestions:installedSuggestions:](RideBookingRideOptionState, "stateWithRideOptionStatusMap:appStoreSuggestions:installedSuggestions:", v19, v20, v22));
          v25 = GEOFindOrCreateLog(v4, "RideBooking");
          v26 = objc_claimAutoreleasedReturnValue(v25);
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v27 = self;
            v28 = v12;
            v29 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
            v30 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("rideOptionState: %@, appStoreSuggestions:%@ installedSuggestions:%@"), v24, v20, v22);
            *(_DWORD *)buf = 136315394;
            v49 = v29;
            v12 = v28;
            self = v27;
            v15 = v39;
            v50 = 2112;
            v51 = v30;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

            v4 = v40;
          }

          objc_msgSend(v17, "rideOptionStateDidChange:", v24);
          v14 = v41;
        }
        v16 = (char *)v16 + 1;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v43, v47, 16);
    }
    while (v14);
  }

  v31 = GEOFindOrCreateLog(v4, "RideBooking");
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    v33 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v34 = objc_alloc((Class)NSString);
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator rideOptionStateObservers](self, "rideOptionStateObservers"));
    v36 = objc_msgSend(v35, "count");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator rideOptionStateObservers](self, "rideOptionStateObservers"));
    v38 = objc_msgSend(v34, "initWithFormat:", CFSTR("Broadcasted to %lu RideBookingDataCoordinatorRideOptionStateObservers: %@"), v36, v37);
    *(_DWORD *)buf = 136315394;
    v49 = v33;
    v50 = 2112;
    v51 = v38;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
}

- (void)updateRideOptionStateForOrigin:(id)a3 destination:(id)a4
{
  id v7;
  id v8;
  uint64_t Log;
  NSObject *v10;
  char *v11;
  id v12;
  NSString *v13;
  void *v14;
  id v15;
  NSObject *processQueue;
  id v17;
  id v18;
  double v19;
  CLLocationDegrees v20;
  CLLocationDegrees v21;
  CLLocationCoordinate2D v22;
  double v23;
  CLLocationDegrees v24;
  CLLocationDegrees v25;
  CLLocationCoordinate2D v26;
  void *v27;
  _QWORD v28[5];
  id v29;
  _QWORD block[4];
  id v31;
  id v32;
  id v33;
  uint8_t buf[4];
  char *v35;
  __int16 v36;
  id v37;

  v7 = a3;
  v8 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v10 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v12 = objc_alloc((Class)NSString);
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@"), v14);
    *(_DWORD *)buf = 136315394;
    v35 = v11;
    v36 = 2112;
    v37 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004E7A00;
  block[3] = &unk_1011AFF10;
  objc_copyWeak(&v33, (id *)buf);
  v17 = v7;
  v31 = v17;
  v18 = v8;
  v32 = v18;
  dispatch_async(processQueue, block);
  objc_msgSend(v17, "coordinate");
  v20 = v19;
  objc_msgSend(v17, "coordinate");
  v22 = CLLocationCoordinate2DMake(v20, v21);
  objc_msgSend(v18, "coordinate");
  v24 = v23;
  objc_msgSend(v18, "coordinate");
  v26 = CLLocationCoordinate2DMake(v24, v25);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[RidesharingAppSuggestionsProvider sharedProvider](RidesharingAppSuggestionsProvider, "sharedProvider"));
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_1004E7DC0;
  v28[3] = &unk_1011B9178;
  v28[4] = self;
  objc_copyWeak(&v29, (id *)buf);
  objc_msgSend(v27, "fetchSuggestedAppsForSource:destination:withCompletion:", v28, v22.latitude, v22.longitude, v26.latitude, v26.longitude);

  objc_destroyWeak(&v29);
  objc_destroyWeak(&v33);
  objc_destroyWeak((id *)buf);

}

- (void)_updateRideOptionStatusMapForOrigin:(id)a3 destination:(id)a4 application:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t Log;
  NSObject *v14;
  char *v15;
  id v16;
  NSString *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  uint64_t v24;
  NSObject *v25;
  char *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  uint64_t v31;
  NSObject *v32;
  char *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  id v38;
  _BYTE *v39;
  id v40;
  id location;
  uint8_t v42[4];
  char *v43;
  __int16 v44;
  id v45;
  _BYTE buf[24];
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = DefaultLoggingSubsystem;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v14 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v16 = objc_alloc((Class)NSString);
    v17 = NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_msgSend(v16, "initWithFormat:", CFSTR("%@"), v18);
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[CLPlacemark placemarkWithGEOMapItem:](CLPlacemark, "placemarkWithGEOMapItem:", v9));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[CLPlacemark placemarkWithGEOMapItem:](CLPlacemark, "placemarkWithGEOMapItem:", v10));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v47 = sub_1004E867C;
  v48 = sub_1004E868C;
  v49 = 0;
  if (objc_msgSend(v11, "enabled")
    && (v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier")),
        v23 = isExtensionHidden(),
        v22,
        !v23))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingRideOptionStatus statusWithApplication:loadingRideOptions:](RideBookingRideOptionStatus, "statusWithApplication:loadingRideOptions:", v11, 1));
    -[RideBookingDataCoordinator _updateRideOptionStatusMapWithApplication:status:](self, "_updateRideOptionStatusMapWithApplication:status:", v11, v30);

    objc_initWeak(&location, self);
    v31 = GEOFindOrCreateLog(v12, "RideBooking");
    v32 = (id)objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v34 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Sending a getRideStatus request with application %@"), v11);
      *(_DWORD *)v42 = 136315394;
      v43 = v33;
      v44 = 2112;
      v45 = v34;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", v42, 0x16u);

    }
    v35[0] = _NSConcreteStackBlock;
    v35[1] = 3221225472;
    v35[2] = sub_1004E8694;
    v35[3] = &unk_1011B91C8;
    objc_copyWeak(&v40, &location);
    v39 = buf;
    v36 = v11;
    v37 = v20;
    v38 = v21;
    objc_msgSend(v36, "getRideStatusWithCompletion:", v35);

    objc_destroyWeak(&v40);
    objc_destroyWeak(&location);
  }
  else
  {
    v24 = GEOFindOrCreateLog(v12, "RideBooking");
    v25 = (id)objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      v26 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v27 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Application is disabled. Returning the rideOptionStatus request."));
      *(_DWORD *)v42 = 136315394;
      v43 = v26;
      v44 = 2112;
      v45 = v27;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", v42, 0x16u);

    }
    v28 = objc_claimAutoreleasedReturnValue(+[RideBookingRideOptionStatus statusWithApplication:](RideBookingRideOptionStatus, "statusWithApplication:", v11));
    v29 = *(void **)(*(_QWORD *)&buf[8] + 40);
    *(_QWORD *)(*(_QWORD *)&buf[8] + 40) = v28;

    -[RideBookingDataCoordinator _updateRideOptionStatusMapWithApplication:status:](self, "_updateRideOptionStatusMapWithApplication:status:", v11, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
  }
  _Block_object_dispose(buf, 8);

}

- (void)_updateRideOptionStatusMapWithApplication:(id)a3 status:(id)a4
{
  id v7;
  id v8;
  uint64_t Log;
  NSObject *v10;
  char *v11;
  id v12;
  NSString *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *processQueue;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  _QWORD block[4];
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  const char *v30;
  __int16 v31;
  void *v32;

  v7 = a3;
  v8 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v10 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v12 = objc_alloc((Class)NSString);
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@"), v14);
    *(_DWORD *)buf = 136315394;
    v26 = v11;
    v27 = 2112;
    *(_QWORD *)v28 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));

  if (v16)
  {
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004E8F10;
    block[3] = &unk_1011AFF10;
    objc_copyWeak(&v24, (id *)buf);
    v22 = v8;
    v23 = v7;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v18 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "name"));
      *(_DWORD *)buf = 136447234;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      v27 = 1024;
      *(_DWORD *)v28 = 397;
      *(_WORD *)&v28[4] = 2082;
      *(_QWORD *)&v28[6] = "-[RideBookingDataCoordinator _updateRideOptionStatusMapWithApplication:status:]";
      v29 = 2082;
      v30 = "nil == (application.identifier)";
      v31 = 2112;
      v32 = v20;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. application %@ identifier cannot be nil", buf, 0x30u);

    }
  }

}

- (void)_startRefreshRideOptionsTimer
{
  uint64_t Log;
  NSObject *v5;
  char *v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  NSObject *processQueue;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  id v17;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v7 = objc_alloc((Class)NSString);
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@"), v9);
    *(_DWORD *)buf = 136315394;
    v15 = v6;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004E91D8;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v13, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)_refreshRideOptions
{
  uint64_t Log;
  NSObject *v5;
  char *v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  NSObject *processQueue;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  id v17;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v7 = objc_alloc((Class)NSString);
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@"), v9);
    *(_DWORD *)buf = 136315394;
    v15 = v6;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004E960C;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v13, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)_stopRefreshRideOptionsTimer
{
  uint64_t Log;
  NSObject *v5;
  char *v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  NSObject *processQueue;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  id v17;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v7 = objc_alloc((Class)NSString);
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@"), v9);
    *(_DWORD *)buf = 136315394;
    v15 = v6;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004E9AC8;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v13, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)addRideBookingDataCoordinatorRequestRideObserver:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _BYTE v22[14];
  __int16 v23;
  const char *v24;

  v5 = a3;
  if (v5)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v9 = objc_alloc((Class)NSString);
      v10 = NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
      *(_DWORD *)buf = 136315394;
      v20 = v8;
      v21 = 2112;
      *(_QWORD *)v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004E9E24;
    block[3] = &unk_1011AD1E8;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v14 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      v21 = 1024;
      *(_DWORD *)v22 = 462;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "-[RideBookingDataCoordinator addRideBookingDataCoordinatorRequestRideObserver:]";
      v23 = 2082;
      v24 = "nil == (observer)";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires non-nil RideBookingDataCoordinatorRequestRideObserver to be added", buf, 0x26u);
    }

  }
}

- (void)removeRideBookingDataCoordinatorRequestRideObserver:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _BYTE v22[14];
  __int16 v23;
  const char *v24;

  v5 = a3;
  if (v5)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v9 = objc_alloc((Class)NSString);
      v10 = NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
      *(_DWORD *)buf = 136315394;
      v20 = v8;
      v21 = 2112;
      *(_QWORD *)v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004EA304;
    block[3] = &unk_1011AD1E8;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v14 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      v21 = 1024;
      *(_DWORD *)v22 = 480;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "-[RideBookingDataCoordinator removeRideBookingDataCoordinatorRequestRideObserver:]";
      v23 = 2082;
      v24 = "nil == (observer)";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires non-nil RideBookingDataCoordinatorRequestRideObserver to be removed", buf, 0x26u);
    }

  }
}

- (void)_resetRequestRide
{
  uint64_t Log;
  NSObject *v5;
  char *v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  RideBookingApplication *requestRideApplication;
  CLPlacemark *requestRidePickupLocation;
  CLPlacemark *requestRideDropoffLocation;
  NSUUID *requestRideEtaUpdateIdentifier;
  RideBookingPaymentMethod *requestRidePaymentMethod;
  OS_dispatch_source *requestRideExpireTimer;
  RideBookingRequestRideStatus *requestRideStatus;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  id v21;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v7 = objc_alloc((Class)NSString);
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@"), v9);
    *(_DWORD *)buf = 136315394;
    v19 = v6;
    v20 = 2112;
    v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  requestRideApplication = self->_requestRideApplication;
  self->_requestRideApplication = 0;

  requestRidePickupLocation = self->_requestRidePickupLocation;
  self->_requestRidePickupLocation = 0;

  requestRideDropoffLocation = self->_requestRideDropoffLocation;
  self->_requestRideDropoffLocation = 0;

  requestRideEtaUpdateIdentifier = self->_requestRideEtaUpdateIdentifier;
  self->_requestRideEtaUpdateIdentifier = 0;

  requestRidePaymentMethod = self->_requestRidePaymentMethod;
  self->_requestRidePaymentMethod = 0;

  -[RideBookingDataCoordinator _stopRequestRideExpireTimer](self, "_stopRequestRideExpireTimer");
  requestRideExpireTimer = self->_requestRideExpireTimer;
  self->_requestRideExpireTimer = 0;

  requestRideStatus = self->_requestRideStatus;
  self->_requestRideStatus = 0;

}

- (void)_broadcastRequestRideStatusDidChange
{
  uint64_t v4;
  uint64_t Log;
  NSObject *v6;
  char *v7;
  id v8;
  NSString *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  char *v21;
  id v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t v31[128];
  uint8_t buf[4];
  char *v33;
  __int16 v34;
  id v35;

  v4 = DefaultLoggingSubsystem;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v8 = objc_alloc((Class)NSString);
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@"), v10);
    *(_DWORD *)buf = 136315394;
    v33 = v7;
    v34 = 2112;
    v35 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator requestRideObservers](self, "requestRideObservers"));
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(_QWORD *)v28 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v17, "requestRideStatusDidChange:") & 1) != 0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator requestRideStatus](self, "requestRideStatus"));
          objc_msgSend(v17, "requestRideStatusDidChange:", v18);

        }
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v14);
  }

  v19 = GEOFindOrCreateLog(v4, "RideBooking");
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    v21 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v22 = objc_alloc((Class)NSString);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator requestRideObservers](self, "requestRideObservers"));
    v24 = objc_msgSend(v23, "count");
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator requestRideObservers](self, "requestRideObservers"));
    v26 = objc_msgSend(v22, "initWithFormat:", CFSTR("Broadcasted to %lu RideBookingDataSourceRequestRideObservers: %@"), v24, v25);
    *(_DWORD *)buf = 136315394;
    v33 = v21;
    v34 = 2112;
    v35 = v26;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
}

- (void)startRequestRideForRideOption:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _BYTE v22[14];
  __int16 v23;
  const char *v24;

  v5 = a3;
  if (v5)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v9 = objc_alloc((Class)NSString);
      v10 = NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
      *(_DWORD *)buf = 136315394;
      v20 = v8;
      v21 = 2112;
      *(_QWORD *)v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004EAB68;
    block[3] = &unk_1011AD1E8;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v14 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      v21 = 1024;
      *(_DWORD *)v22 = 523;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "-[RideBookingDataCoordinator startRequestRideForRideOption:]";
      v23 = 2082;
      v24 = "nil == (rideOption)";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires non-nil RideBookingRideOption", buf, 0x26u);
    }

  }
}

- (void)_updateRequestRidePickupAndDropoffLocations
{
  uint64_t Log;
  NSObject *v5;
  char *v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  NSObject *processQueue;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  id v17;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v7 = objc_alloc((Class)NSString);
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@"), v9);
    *(_DWORD *)buf = 136315394;
    v15 = v6;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004EAE90;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v13, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)_startRequestRideExpireTimerWithExpirationDate:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  _QWORD block[4];
  id v15;
  id v16;
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  id v20;

  v5 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v9 = objc_alloc((Class)NSString);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
    *(_DWORD *)buf = 136315394;
    v18 = v8;
    v19 = 2112;
    v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  if (v5)
  {
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004EB28C;
    block[3] = &unk_1011AD1E8;
    objc_copyWeak(&v16, (id *)buf);
    v15 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v16);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_expireRequestRideStatus
{
  uint64_t Log;
  NSObject *v5;
  char *v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  NSObject *processQueue;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  id v17;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v7 = objc_alloc((Class)NSString);
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@"), v9);
    *(_DWORD *)buf = 136315394;
    v15 = v6;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004EB790;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v13, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)_stopRequestRideExpireTimer
{
  uint64_t Log;
  NSObject *v5;
  char *v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  NSObject *processQueue;
  _QWORD block[4];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  id v17;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v7 = objc_alloc((Class)NSString);
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@"), v9);
    *(_DWORD *)buf = 136315394;
    v15 = v6;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004EBB04;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v13, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)_cleanRequestLocationNames
{
  uint64_t Log;
  NSObject *v5;
  char *v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  NSObject *processQueue;
  _QWORD block[5];
  id v13;
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  id v17;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v7 = objc_alloc((Class)NSString);
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@"), v9);
    *(_DWORD *)buf = 136315394;
    v15 = v6;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004EBE70;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v13, (id *)buf);
  block[4] = self;
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v13);
  objc_destroyWeak((id *)buf);
}

- (void)_updateRequestRideStatus:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  id v21;

  v5 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v9 = objc_alloc((Class)NSString);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
    *(_DWORD *)buf = 136315394;
    v19 = v8;
    v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004EC420;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v17, (id *)buf);
  v16 = v5;
  v14 = v5;
  dispatch_async(processQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)updateRequestRideStartingWaypointCoordinate:(CLLocationCoordinate2D)a3
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  uint64_t Log;
  NSObject *v8;
  char *v9;
  id v10;
  NSString *v11;
  void *v12;
  id v13;
  NSObject *processQueue;
  _QWORD block[4];
  id v16[3];
  uint8_t buf[4];
  char *v18;
  __int16 v19;
  id v20;

  longitude = a3.longitude;
  latitude = a3.latitude;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v8 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v10 = objc_alloc((Class)NSString);
    v11 = NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v13 = objc_msgSend(v10, "initWithFormat:", CFSTR("%@"), v12);
    *(_DWORD *)buf = 136315394;
    v18 = v9;
    v19 = 2112;
    v20 = v13;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004EC70C;
  block[3] = &unk_1011AEE38;
  objc_copyWeak(v16, (id *)buf);
  v16[1] = *(id *)&latitude;
  v16[2] = *(id *)&longitude;
  dispatch_async(processQueue, block);
  objc_destroyWeak(v16);
  objc_destroyWeak((id *)buf);
}

- (void)updateRequestRidePaymentMethod:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  id v21;

  v5 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v9 = objc_alloc((Class)NSString);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
    *(_DWORD *)buf = 136315394;
    v19 = v8;
    v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004ED46C;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v17, (id *)buf);
  v16 = v5;
  v14 = v5;
  dispatch_sync(processQueue, block);

  objc_destroyWeak(&v17);
  objc_destroyWeak((id *)buf);
}

- (void)updateRequestRidePassengers:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18[2];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _BYTE v22[14];
  __int16 v23;
  const char *v24;

  v5 = a3;
  if (v5)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v9 = objc_alloc((Class)NSString);
      v10 = NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
      *(_DWORD *)buf = 136315394;
      v20 = v8;
      v21 = 2112;
      *(_QWORD *)v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004ED7E4;
    block[3] = &unk_1011B9268;
    objc_copyWeak(v18, (id *)buf);
    v18[1] = (id)a2;
    v17 = v5;
    dispatch_sync(processQueue, block);

    objc_destroyWeak(v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v14 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      v21 = 1024;
      *(_DWORD *)v22 = 757;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "-[RideBookingDataCoordinator updateRequestRidePassengers:]";
      v23 = 2082;
      v24 = "nil == (passengers)";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires non-nil RideBookingPassengersChoice to be added", buf, 0x26u);
    }

  }
}

- (void)requestRideWithCompletion:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[5];
  id v17;
  id v18[2];
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _BYTE v22[14];
  __int16 v23;
  const char *v24;

  v5 = a3;
  if (v5)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v9 = objc_alloc((Class)NSString);
      v10 = NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
      *(_DWORD *)buf = 136315394;
      v20 = v8;
      v21 = 2112;
      *(_QWORD *)v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004EDC48;
    block[3] = &unk_1011B92B8;
    objc_copyWeak(v18, (id *)buf);
    block[4] = self;
    v18[1] = (id)a2;
    v17 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v14 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      v21 = 1024;
      *(_DWORD *)v22 = 770;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "-[RideBookingDataCoordinator requestRideWithCompletion:]";
      v23 = 2082;
      v24 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }

  }
}

- (void)addRideBookingDataCoordinatorRideStatusObserver:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _BYTE v22[14];
  __int16 v23;
  const char *v24;

  v5 = a3;
  if (v5)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v9 = objc_alloc((Class)NSString);
      v10 = NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@, adding observer: %@"), v11, v5);
      *(_DWORD *)buf = 136315394;
      v20 = v8;
      v21 = 2112;
      *(_QWORD *)v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004EE4A4;
    block[3] = &unk_1011AD1E8;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v14 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      v21 = 1024;
      *(_DWORD *)v22 = 805;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "-[RideBookingDataCoordinator addRideBookingDataCoordinatorRideStatusObserver:]";
      v23 = 2082;
      v24 = "nil == (observer)";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires non-nil RideBookingDataCoordinatorRideStatusObserver to be added", buf, 0x26u);
    }

  }
}

- (void)removeRideBookingDataCoordinatorRideStatusObserver:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  uint64_t v14;
  NSObject *v15;
  _QWORD block[4];
  id v17;
  id v18;
  uint8_t buf[4];
  const char *v20;
  __int16 v21;
  _BYTE v22[14];
  __int16 v23;
  const char *v24;

  v5 = a3;
  if (v5)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v9 = objc_alloc((Class)NSString);
      v10 = NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
      *(_DWORD *)buf = 136315394;
      v20 = v8;
      v21 = 2112;
      *(_QWORD *)v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004EE98C;
    block[3] = &unk_1011AD1E8;
    objc_copyWeak(&v18, (id *)buf);
    v17 = v5;
    dispatch_async(processQueue, block);

    objc_destroyWeak(&v18);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v14 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v20 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      v21 = 1024;
      *(_DWORD *)v22 = 824;
      *(_WORD *)&v22[4] = 2082;
      *(_QWORD *)&v22[6] = "-[RideBookingDataCoordinator removeRideBookingDataCoordinatorRideStatusObserver:]";
      v23 = 2082;
      v24 = "nil == (observer)";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires non-nil RideBookingDataCoordinatorRideStatusObserver to be removed", buf, 0x26u);
    }

  }
}

- (void)updateRideStatusMap
{
  uint64_t Log;
  NSObject *v5;
  char *v6;
  id v7;
  NSString *v8;
  void *v9;
  id v10;
  NSObject *processQueue;
  _QWORD block[4];
  id v13[2];
  uint8_t buf[4];
  char *v15;
  __int16 v16;
  id v17;

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v7 = objc_alloc((Class)NSString);
    v8 = NSStringFromSelector(a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    v10 = objc_msgSend(v7, "initWithFormat:", CFSTR("%@"), v9);
    *(_DWORD *)buf = 136315394;
    v15 = v6;
    v16 = 2112;
    v17 = v10;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004EECD8;
  block[3] = &unk_1011B72B0;
  objc_copyWeak(v13, (id *)buf);
  v13[1] = (id)a2;
  dispatch_async(processQueue, block);
  objc_destroyWeak(v13);
  objc_destroyWeak((id *)buf);
}

- (void)_updateRideStatusMapForApplication:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  id v14;
  _QWORD block[4];
  id v16;
  id v17[2];
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  id v21;

  v5 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v9 = objc_alloc((Class)NSString);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
    *(_DWORD *)buf = 136315394;
    v19 = v8;
    v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004EF234;
  block[3] = &unk_1011B2160;
  v16 = v5;
  v14 = v5;
  objc_copyWeak(v17, (id *)buf);
  v17[1] = (id)a2;
  dispatch_async(processQueue, block);
  objc_destroyWeak(v17);

  objc_destroyWeak((id *)buf);
}

- (void)_updateRideStatusMapWithApplication:(id)a3 status:(id)a4
{
  id v7;
  id v8;
  uint64_t Log;
  NSObject *v10;
  char *v11;
  id v12;
  NSString *v13;
  void *v14;
  id v15;
  NSObject *processQueue;
  id v17;
  id v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22[2];
  uint8_t buf[4];
  char *v24;
  __int16 v25;
  id v26;

  v7 = a3;
  v8 = a4;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v10 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v12 = objc_alloc((Class)NSString);
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@"), v14);
    *(_DWORD *)buf = 136315394;
    v24 = v11;
    v25 = 2112;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004EF6D0;
  block[3] = &unk_1011AE810;
  objc_copyWeak(v22, (id *)buf);
  v20 = v8;
  v21 = v7;
  v22[1] = (id)a2;
  v17 = v7;
  v18 = v8;
  dispatch_async(processQueue, block);

  objc_destroyWeak(v22);
  objc_destroyWeak((id *)buf);
}

- (void)_broadcastRideStatusDidChange
{
  uint64_t v4;
  uint64_t Log;
  NSObject *v6;
  char *v7;
  id v8;
  NSString *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *i;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  char *v22;
  id v23;
  void *v24;
  id v25;
  void *v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t v32[128];
  uint8_t buf[4];
  char *v34;
  __int16 v35;
  id v36;

  v4 = DefaultLoggingSubsystem;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v8 = objc_alloc((Class)NSString);
    v9 = NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v11 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@"), v10);
    *(_DWORD *)buf = 136315394;
    v34 = v7;
    v35 = 2112;
    v36 = v11;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator rideStatusMap](self, "rideStatusMap"));
  v13 = objc_msgSend(v12, "copy");

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator rideStatusObservers](self, "rideStatusObservers"));
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v16; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v19, "rideStatusMapDidChange:") & 1) != 0)
          objc_msgSend(v19, "rideStatusMapDidChange:", v13);
      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v16);
  }

  v20 = GEOFindOrCreateLog(v4, "RideBooking");
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v23 = objc_alloc((Class)NSString);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator rideStatusObservers](self, "rideStatusObservers"));
    v25 = objc_msgSend(v24, "count");
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingDataCoordinator rideStatusObservers](self, "rideStatusObservers"));
    v27 = objc_msgSend(v23, "initWithFormat:", CFSTR("Broadcasted to %lu RideBookingDataCoordinatorRideStatusObservers: %@"), v25, v26);
    *(_DWORD *)buf = 136315394;
    v34 = v22;
    v35 = 2112;
    v36 = v27;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
}

- (void)rideStatusDidChange:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  id v14;
  _QWORD block[4];
  id v16;
  id v17[2];
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  id v21;

  v5 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v9 = objc_alloc((Class)NSString);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
    *(_DWORD *)buf = 136315394;
    v19 = v8;
    v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004F02B8;
  block[3] = &unk_1011B9268;
  objc_copyWeak(v17, (id *)buf);
  v17[1] = (id)a2;
  v16 = v5;
  v14 = v5;
  dispatch_async(processQueue, block);

  objc_destroyWeak(v17);
  objc_destroyWeak((id *)buf);
}

- (void)sendFeedbackForRideStatus:(id)a3 feedbackRating:(id)a4 feedbackTip:(id)a5 completion:(id)a6
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t Log;
  NSObject *v16;
  char *v17;
  id v18;
  NSString *v19;
  void *v20;
  id v21;
  NSObject *processQueue;
  uint64_t v23;
  NSObject *v24;
  _QWORD block[4];
  id v26;
  id v27;
  id v28;
  id v29;
  id v30[2];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  _BYTE v34[14];
  __int16 v35;
  const char *v36;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  if (v14)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v16 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v18 = objc_alloc((Class)NSString);
      v19 = NSStringFromSelector(a2);
      v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
      v21 = objc_msgSend(v18, "initWithFormat:", CFSTR("%@"), v20);
      *(_DWORD *)buf = 136315394;
      v32 = v17;
      v33 = 2112;
      *(_QWORD *)v34 = v21;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004F0774;
    block[3] = &unk_1011B9308;
    objc_copyWeak(v30, (id *)buf);
    v26 = v11;
    v27 = v12;
    v28 = v13;
    v30[1] = (id)a2;
    v29 = v14;
    dispatch_async(processQueue, block);

    objc_destroyWeak(v30);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v23 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v32 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      v33 = 1024;
      *(_DWORD *)v34 = 971;
      *(_WORD *)&v34[4] = 2082;
      *(_QWORD *)&v34[6] = "-[RideBookingDataCoordinator sendFeedbackForRideStatus:feedbackRating:feedbackTip:completion:]";
      v35 = 2082;
      v36 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }

  }
}

- (void)checkIfCanCancelRideWithRideStatus:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t Log;
  NSObject *v10;
  char *v11;
  id v12;
  NSString *v13;
  void *v14;
  id v15;
  NSObject *processQueue;
  uint64_t v17;
  NSObject *v18;
  _QWORD block[4];
  id v20;
  id v21;
  id v22[2];
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  _BYTE v26[14];
  __int16 v27;
  const char *v28;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v10 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v12 = objc_alloc((Class)NSString);
      v13 = NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@"), v14);
      *(_DWORD *)buf = 136315394;
      v24 = v11;
      v25 = 2112;
      *(_QWORD *)v26 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004F0DA8;
    block[3] = &unk_1011B92B8;
    objc_copyWeak(v22, (id *)buf);
    v20 = v7;
    v22[1] = (id)a2;
    v21 = v8;
    dispatch_async(processQueue, block);

    objc_destroyWeak(v22);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v17 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v24 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      v25 = 1024;
      *(_DWORD *)v26 = 996;
      *(_WORD *)&v26[4] = 2082;
      *(_QWORD *)&v26[6] = "-[RideBookingDataCoordinator checkIfCanCancelRideWithRideStatus:completion:]";
      v27 = 2082;
      v28 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }

  }
}

- (void)cancelRideWithRideStatus:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  uint64_t Log;
  NSObject *v10;
  char *v11;
  id v12;
  NSString *v13;
  void *v14;
  id v15;
  NSObject *processQueue;
  id v17;
  uint64_t v18;
  NSObject *v19;
  _QWORD block[4];
  id v21;
  RideBookingDataCoordinator *v22;
  id v23;
  id v24[2];
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  _BYTE v28[14];
  __int16 v29;
  const char *v30;

  v7 = a3;
  v8 = a4;
  if (v8)
  {
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v10 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v12 = objc_alloc((Class)NSString);
      v13 = NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@"), v14);
      *(_DWORD *)buf = 136315394;
      v26 = v11;
      v27 = 2112;
      *(_QWORD *)v28 = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    objc_initWeak((id *)buf, self);
    processQueue = self->_processQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1004F1400;
    block[3] = &unk_1011B93A0;
    objc_copyWeak(v24, (id *)buf);
    v21 = v7;
    v17 = v8;
    v24[1] = (id)a2;
    v22 = self;
    v23 = v17;
    dispatch_async(processQueue, block);

    objc_destroyWeak(v24);
    objc_destroyWeak((id *)buf);
  }
  else
  {
    v18 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v26 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      v27 = 1024;
      *(_DWORD *)v28 = 1018;
      *(_WORD *)&v28[4] = 2082;
      *(_QWORD *)&v28[6] = "-[RideBookingDataCoordinator cancelRideWithRideStatus:completion:]";
      v29 = 2082;
      v30 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }

  }
}

- (void)enableRideBookingApplications:(id)a3
{
  id v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *processQueue;
  id v14;
  _QWORD block[4];
  id v16;
  id v17;
  uint8_t buf[4];
  char *v19;
  __int16 v20;
  id v21;

  v5 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v9 = objc_alloc((Class)NSString);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
    *(_DWORD *)buf = 136315394;
    v19 = v8;
    v20 = 2112;
    v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_initWeak((id *)buf, self);
  processQueue = self->_processQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004F1A98;
  block[3] = &unk_1011AEAA0;
  v16 = v5;
  v14 = v5;
  objc_copyWeak(&v17, (id *)buf);
  dispatch_async(processQueue, block);
  objc_destroyWeak(&v17);

  objc_destroyWeak((id *)buf);
}

- (void)cleanMapItemName:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t Log;
  NSObject *v10;
  char *v11;
  id v12;
  NSString *v13;
  void *v14;
  id v15;
  void *v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  NSObject *v22;
  char *v23;
  id v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  char *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  _BYTE *v37;
  void *v38;
  uint8_t v39[4];
  char *v40;
  __int16 v41;
  id v42;
  _BYTE buf[40];
  id v44;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = DefaultLoggingSubsystem;
    Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
    v10 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v12 = objc_alloc((Class)NSString);
      v13 = NSStringFromSelector(a2);
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      v15 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@"), v14);
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = v11;
      *(_WORD *)&buf[12] = 2112;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "addressObject"));
    v17 = objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fullAddressWithMultiline:", 0));

    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x3032000000;
    *(_QWORD *)&buf[24] = sub_1004E867C;
    *(_QWORD *)&buf[32] = sub_1004E868C;
    v18 = v6;
    v44 = v18;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "place"));
    objc_msgSend(v19, "setName:", v17);

    v20 = (void *)objc_opt_new(GEOMapItemStorageUserValues);
    objc_msgSend(v20, "setName:", v17);
    objc_msgSend(*(id *)(*(_QWORD *)&buf[8] + 40), "setUserValues:", v20);
    if ((objc_msgSend(v18, "_hasMUID") & 1) != 0)
    {
      v21 = GEOFindOrCreateLog(v8, "RideBooking");
      v22 = (id)objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
        v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Have a MUID, so looking up the name by issuing a Ticket"));
        *(_DWORD *)v39 = 136315394;
        v40 = v23;
        v41 = 2112;
        v42 = v24;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", v39, 0x16u);

      }
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
      v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "defaultTraits"));

      v27 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_identifier"));
      v38 = v28;
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v38, 1));
      v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "ticketForIdentifiers:traits:", v29, v26));

      v35[0] = _NSConcreteStackBlock;
      v35[1] = 3221225472;
      v35[2] = sub_1004F2220;
      v35[3] = &unk_1011B93C8;
      v37 = buf;
      v36 = v7;
      -[NSObject submitWithHandler:networkActivity:](v30, "submitWithHandler:networkActivity:", v35, 0);

    }
    else
    {
      (*((void (**)(id, _QWORD))v7 + 2))(v7, *(_QWORD *)(*(_QWORD *)&buf[8] + 40));
      v32 = GEOFindOrCreateLog(v8, "RideBooking");
      v30 = (id)objc_claimAutoreleasedReturnValue(v32);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v33 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
        v34 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Returning because originalMapItem.hasMUID==NO"));
        *(_DWORD *)v39 = 136315394;
        v40 = v33;
        v41 = 2112;
        v42 = v34;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", v39, 0x16u);

      }
      v26 = v30;
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v31 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v17 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = 1067;
      *(_WORD *)&buf[18] = 2082;
      *(_QWORD *)&buf[20] = "-[RideBookingDataCoordinator cleanMapItemName:completion:]";
      *(_WORD *)&buf[28] = 2082;
      *(_QWORD *)&buf[30] = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
  }

}

- (void)_startTimer:(id *)a3 withInterval:(double)a4 repeats:(BOOL)a5 block:(id)a6
{
  _BOOL4 v6;
  id v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  char *v15;
  id v16;
  NSString *v17;
  void *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  char *v23;
  id v24;
  dispatch_source_t v25;
  id v26;
  uint64_t v27;
  dispatch_time_t v28;
  uint64_t Log;
  NSObject *v30;
  uint64_t v31;
  char *v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  _BYTE v37[14];
  __int16 v38;
  const char *v39;

  v6 = a5;
  v11 = a6;
  if (!v11)
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingDataCoordinator");
    v30 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136446978;
      v35 = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m";
      v36 = 1024;
      *(_DWORD *)v37 = 1108;
      *(_WORD *)&v37[4] = 2082;
      *(_QWORD *)&v37[6] = "-[RideBookingDataCoordinator _startTimer:withInterval:repeats:block:]";
      v38 = 2082;
      v39 = "nil == (block)";
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", buf, 0x26u);
    }
    goto LABEL_17;
  }
  v12 = DefaultLoggingSubsystem;
  v13 = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v16 = objc_alloc((Class)NSString);
    v17 = NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_msgSend(v16, "initWithFormat:", CFSTR("%@"), v18);
    *(_DWORD *)buf = 136315394;
    v35 = v15;
    v36 = 2112;
    *(_QWORD *)v37 = v19;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  if (!a3)
  {
    v31 = GEOFindOrCreateLog(v12, "RideBooking");
    v30 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      v32 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v33 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Returning because timer==nil"));
      *(_DWORD *)buf = 136315394;
      v35 = v32;
      v36 = 2112;
      *(_QWORD *)v37 = v33;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
LABEL_17:

    goto LABEL_18;
  }
  v20 = *a3;
  if (!*a3)
  {
    v21 = GEOFindOrCreateLog(v12, "RideBooking");
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v23 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
      v24 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Instantiating a new timer"));
      *(_DWORD *)buf = 136315394;
      v35 = v23;
      v36 = 2112;
      *(_QWORD *)v37 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    }
    v25 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_processQueue);
    v26 = *a3;
    *a3 = v25;

    dispatch_source_set_timer((dispatch_source_t)*a3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    dispatch_source_set_event_handler((dispatch_source_t)*a3, v11);
    dispatch_resume((dispatch_object_t)*a3);
    v20 = *a3;
  }
  if (v6)
    v27 = (unint64_t)(a4 * 1000000000.0);
  else
    v27 = -1;
  v28 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
  dispatch_source_set_timer(v20, v28, v27, 0x3B9ACA00uLL);
LABEL_18:

}

- (void)_stopTimer:(id *)a3
{
  uint64_t v5;
  uint64_t Log;
  NSObject *v7;
  char *v8;
  id v9;
  NSString *v10;
  void *v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  char *v15;
  id v16;
  uint64_t v17;
  char *v18;
  uint8_t buf[4];
  char *v20;
  __int16 v21;
  id v22;

  v5 = DefaultLoggingSubsystem;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "RideBooking");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v8 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v9 = objc_alloc((Class)NSString);
    v10 = NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = objc_msgSend(v9, "initWithFormat:", CFSTR("%@"), v11);
    *(_DWORD *)buf = 136315394;
    v20 = v8;
    v21 = 2112;
    v22 = v12;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  if (!a3)
  {
    v14 = GEOFindOrCreateLog(v5, "RideBooking");
    v13 = objc_claimAutoreleasedReturnValue(v14);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v15 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Returning because timer==nil"));
    *(_DWORD *)buf = 136315394;
    v20 = v15;
    v21 = 2112;
    v22 = v16;
LABEL_10:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

    goto LABEL_11;
  }
  if (!*a3)
  {
    v17 = GEOFindOrCreateLog(v5, "RideBooking");
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      goto LABEL_11;
    v18 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v16 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Returning because *timer==nil (pointer)"));
    *(_DWORD *)buf = 136315394;
    v20 = v18;
    v21 = 2112;
    v22 = v16;
    goto LABEL_10;
  }
  dispatch_source_set_timer((dispatch_source_t)*a3, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
  dispatch_source_cancel((dispatch_source_t)*a3);
  v13 = *a3;
  *a3 = 0;
LABEL_11:

}

+ (void)openRideBookingApplication:(id)a3 withUserActivity:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;
  uint64_t Log;
  NSObject *v10;
  char *v11;
  id v12;
  NSString *v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  char *v18;
  id v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  char *v23;
  __int16 v24;
  id v25;

  v6 = a4;
  v7 = DefaultLoggingSubsystem;
  v8 = a3;
  Log = GEOFindOrCreateLog(v7, "RideBooking");
  v10 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v12 = objc_alloc((Class)NSString);
    v13 = NSStringFromSelector(a2);
    v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
    v15 = objc_msgSend(v12, "initWithFormat:", CFSTR("%@"), v14);
    *(_DWORD *)buf = 136315394;
    v23 = v11;
    v24 = 2112;
    v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  v16 = GEOFindOrCreateLog(v7, "RideBooking");
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = basename("/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingDataCoordinator.m");
    v19 = objc_alloc((Class)NSString);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
    v21 = objc_msgSend(v19, "initWithFormat:", CFSTR("Opening app with activity: %@"), v20);
    *(_DWORD *)buf = 136315394;
    v23 = v18;
    v24 = 2112;
    v25 = v21;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "{RBInfo}{%s}: %@", buf, 0x16u);

  }
  objc_msgSend(v8, "openWithActivity:", v6);

}

- (OS_dispatch_queue)processQueue
{
  return self->_processQueue;
}

- (void)setProcessQueue:(id)a3
{
  objc_storeStrong((id *)&self->_processQueue, a3);
}

- (RideBookingApplicationFinder)applicationFinder
{
  return self->_applicationFinder;
}

- (void)setApplicationFinder:(id)a3
{
  objc_storeStrong((id *)&self->_applicationFinder, a3);
}

- (NSMutableDictionary)applications
{
  return self->_applications;
}

- (void)setApplications:(id)a3
{
  objc_storeStrong((id *)&self->_applications, a3);
}

- (GEOMapItemStorage)origin
{
  return self->_origin;
}

- (void)setOrigin:(id)a3
{
  objc_storeStrong((id *)&self->_origin, a3);
}

- (GEOMapItemStorage)destination
{
  return self->_destination;
}

- (void)setDestination:(id)a3
{
  objc_storeStrong((id *)&self->_destination, a3);
}

- (OS_dispatch_source)refreshRideOptionsTimer
{
  return self->_refreshRideOptionsTimer;
}

- (void)setRefreshRideOptionsTimer:(id)a3
{
  objc_storeStrong((id *)&self->_refreshRideOptionsTimer, a3);
}

- (NSHashTable)rideOptionStateObservers
{
  return self->_rideOptionStateObservers;
}

- (void)setRideOptionStateObservers:(id)a3
{
  objc_storeStrong((id *)&self->_rideOptionStateObservers, a3);
}

- (NSMutableArray)appStoreSuggestions
{
  return self->_appStoreSuggestions;
}

- (void)setAppStoreSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_appStoreSuggestions, a3);
}

- (NSMutableArray)installedSuggestions
{
  return self->_installedSuggestions;
}

- (void)setInstalledSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_installedSuggestions, a3);
}

- (BOOL)waitingAppSuggestionsToLoad
{
  return self->_waitingAppSuggestionsToLoad;
}

- (void)setWaitingAppSuggestionsToLoad:(BOOL)a3
{
  self->_waitingAppSuggestionsToLoad = a3;
}

- (NSMutableDictionary)rideOptionStatusMap
{
  return self->_rideOptionStatusMap;
}

- (void)setRideOptionStatusMap:(id)a3
{
  objc_storeStrong((id *)&self->_rideOptionStatusMap, a3);
}

- (NSHashTable)requestRideObservers
{
  return self->_requestRideObservers;
}

- (void)setRequestRideObservers:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideObservers, a3);
}

- (RideBookingRideOption)requestRideOption
{
  return self->_requestRideOption;
}

- (void)setRequestRideOption:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideOption, a3);
}

- (RideBookingApplication)requestRideApplication
{
  return self->_requestRideApplication;
}

- (void)setRequestRideApplication:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideApplication, a3);
}

- (CLPlacemark)requestRidePickupLocation
{
  return self->_requestRidePickupLocation;
}

- (void)setRequestRidePickupLocation:(id)a3
{
  objc_storeStrong((id *)&self->_requestRidePickupLocation, a3);
}

- (CLPlacemark)requestRideDropoffLocation
{
  return self->_requestRideDropoffLocation;
}

- (void)setRequestRideDropoffLocation:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideDropoffLocation, a3);
}

- (OS_dispatch_source)requestRideExpireTimer
{
  return self->_requestRideExpireTimer;
}

- (void)setRequestRideExpireTimer:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideExpireTimer, a3);
}

- (NSUUID)requestRideEtaUpdateIdentifier
{
  return self->_requestRideEtaUpdateIdentifier;
}

- (void)setRequestRideEtaUpdateIdentifier:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideEtaUpdateIdentifier, a3);
}

- (RideBookingPaymentMethod)requestRidePaymentMethod
{
  return self->_requestRidePaymentMethod;
}

- (void)setRequestRidePaymentMethod:(id)a3
{
  objc_storeStrong((id *)&self->_requestRidePaymentMethod, a3);
}

- (RideBookingPassengersChoice)requestRidePassengersChoice
{
  return self->_requestRidePassengersChoice;
}

- (void)setRequestRidePassengersChoice:(id)a3
{
  objc_storeStrong((id *)&self->_requestRidePassengersChoice, a3);
}

- (RideBookingRequestRideStatus)requestRideStatus
{
  return self->_requestRideStatus;
}

- (void)setRequestRideStatus:(id)a3
{
  objc_storeStrong((id *)&self->_requestRideStatus, a3);
}

- (NSHashTable)rideStatusObservers
{
  return self->_rideStatusObservers;
}

- (void)setRideStatusObservers:(id)a3
{
  objc_storeStrong((id *)&self->_rideStatusObservers, a3);
}

- (NSMutableDictionary)rideStatusMap
{
  return self->_rideStatusMap;
}

- (void)setRideStatusMap:(id)a3
{
  objc_storeStrong((id *)&self->_rideStatusMap, a3);
}

- (NSMutableDictionary)completedRideIdentifiersAndDatesMap
{
  return self->_completedRideIdentifiersAndDatesMap;
}

- (void)setCompletedRideIdentifiersAndDatesMap:(id)a3
{
  objc_storeStrong((id *)&self->_completedRideIdentifiersAndDatesMap, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completedRideIdentifiersAndDatesMap, 0);
  objc_storeStrong((id *)&self->_rideStatusMap, 0);
  objc_storeStrong((id *)&self->_rideStatusObservers, 0);
  objc_storeStrong((id *)&self->_requestRideStatus, 0);
  objc_storeStrong((id *)&self->_requestRidePassengersChoice, 0);
  objc_storeStrong((id *)&self->_requestRidePaymentMethod, 0);
  objc_storeStrong((id *)&self->_requestRideEtaUpdateIdentifier, 0);
  objc_storeStrong((id *)&self->_requestRideExpireTimer, 0);
  objc_storeStrong((id *)&self->_requestRideDropoffLocation, 0);
  objc_storeStrong((id *)&self->_requestRidePickupLocation, 0);
  objc_storeStrong((id *)&self->_requestRideApplication, 0);
  objc_storeStrong((id *)&self->_requestRideOption, 0);
  objc_storeStrong((id *)&self->_requestRideObservers, 0);
  objc_storeStrong((id *)&self->_rideOptionStatusMap, 0);
  objc_storeStrong((id *)&self->_installedSuggestions, 0);
  objc_storeStrong((id *)&self->_appStoreSuggestions, 0);
  objc_storeStrong((id *)&self->_rideOptionStateObservers, 0);
  objc_storeStrong((id *)&self->_refreshRideOptionsTimer, 0);
  objc_storeStrong((id *)&self->_destination, 0);
  objc_storeStrong((id *)&self->_origin, 0);
  objc_storeStrong((id *)&self->_applications, 0);
  objc_storeStrong((id *)&self->_applicationFinder, 0);
  objc_storeStrong((id *)&self->_processQueue, 0);
}

@end
