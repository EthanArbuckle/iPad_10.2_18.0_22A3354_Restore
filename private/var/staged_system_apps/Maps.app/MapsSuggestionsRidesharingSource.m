@implementation MapsSuggestionsRidesharingSource

- (id)initFromResourceDepot:(id)a3 name:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  MapsSuggestionsRidesharingSource *v10;
  id v11;
  const char *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *queue;
  id oneShotCallbackBlock;
  uint64_t v18;
  MapsSuggestionsAppGuardian *guardian;
  NSObject *v20;
  MapsSuggestionsRidesharingSource *v21;
  uint64_t Log;
  NSObject *v23;
  uint64_t v24;
  _QWORD v26[4];
  id v27;
  _QWORD block[4];
  id v29;
  objc_super v30;
  _BYTE location[12];
  __int16 v32;
  int v33;
  __int16 v34;
  const char *v35;
  __int16 v36;
  const char *v37;

  v6 = a3;
  v7 = a4;
  if (!v6)
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RidesharingSource");
    v23 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRidesharingSource.m";
      v32 = 1024;
      v33 = 56;
      v34 = 2082;
      v35 = "-[MapsSuggestionsRidesharingSource initFromResourceDepot:name:]";
      v36 = 2082;
      v37 = "nil == (resourceDepot)";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires a resource depot to buid!", location, 0x26u);
    }
    goto LABEL_11;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "oneSourceDelegate"));

  if (!v8)
  {
    v24 = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RidesharingSource");
    v23 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Suggestions/MapsSuggestionsRidesharingSource.m";
      v32 = 1024;
      v33 = 57;
      v34 = 2082;
      v35 = "-[MapsSuggestionsRidesharingSource initFromResourceDepot:name:]";
      v36 = 2082;
      v37 = "nil == (resourceDepot.oneSourceDelegate)";
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires one SourceDelegate!", location, 0x26u);
    }
LABEL_11:

    v21 = 0;
    goto LABEL_12;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "oneSourceDelegate"));
  v30.receiver = self;
  v30.super_class = (Class)MapsSuggestionsRidesharingSource;
  v10 = -[MapsSuggestionsRidesharingSource initWithDelegate:name:](&v30, "initWithDelegate:name:", v9, v7);

  if (v10)
  {
    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRidesharingSource uniqueName](v10, "uniqueName")));
    v12 = (const char *)objc_msgSend(v11, "cStringUsingEncoding:", 4);
    v13 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create(v12, v14);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v15;

    oneShotCallbackBlock = v10->_oneShotCallbackBlock;
    v10->_oneShotCallbackBlock = 0;

    v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "oneAppGuardian"));
    guardian = v10->_guardian;
    v10->_guardian = (MapsSuggestionsAppGuardian *)v18;

    objc_initWeak((id *)location, v10);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10094C494;
    block[3] = &unk_1011AD260;
    objc_copyWeak(&v29, (id *)location);
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    v20 = v10->_queue;
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_10094C5B8;
    v26[3] = &unk_1011BCB28;
    objc_copyWeak(&v27, (id *)location);
    notify_register_dispatch("MapsSuggestionsRidesharingSourceShouldRefresh", &v10->_token, v20, v26);
    objc_destroyWeak(&v27);
    objc_destroyWeak(&v29);
    objc_destroyWeak((id *)location);
  }
  self = v10;
  v21 = self;
LABEL_12:

  return v21;
}

+ (BOOL)isEnabled
{
  int v2;

  v2 = sub_10048286C();
  if (v2)
    LOBYTE(v2) = GEOConfigGetBOOL(GEOConfigMapsSuggestionsRidesharingSourceEnabled[0], GEOConfigMapsSuggestionsRidesharingSourceEnabled[1]);
  return v2;
}

+ (unint64_t)disposition
{
  return 1;
}

- (BOOL)canProduceEntriesOfType:(int64_t)a3
{
  return a3 == 9;
}

- (BOOL)removeEntry:(id)a3 behavior:(int64_t)a4 handler:(id)a5
{
  return 0;
}

- (void)start
{
  uint64_t Log;
  NSObject *v4;
  MapsSuggestionsRidesharingSource *v5;
  uint8_t v6[16];

  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RidesharingSource");
  v4 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEBUG, "start", v6, 2u);
  }

  v5 = self;
  objc_sync_enter(v5);
  -[MapsSuggestionsRidesharingSource setSuspended:](v5, "setSuspended:", 0);
  objc_sync_exit(v5);

}

- (void)stop
{
  MapsSuggestionsRidesharingSource *v3;
  uint64_t Log;
  NSObject *v5;
  uint8_t v6[16];

  -[MapsSuggestionsAppGuardian unregisterAllBundleIDsForSource:](self->_guardian, "unregisterAllBundleIDsForSource:", self);
  v3 = self;
  objc_sync_enter(v3);
  -[MapsSuggestionsRidesharingSource setSuspended:](v3, "setSuspended:", 1);
  objc_sync_exit(v3);

  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RidesharingSource");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "stop", v6, 2u);
  }

}

- (double)updateSuggestionEntriesWithHandler:(id)a3
{
  void (**v4)(_QWORD);
  uint64_t v5;
  uint64_t Log;
  NSObject *v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  id *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *queue;
  double Double;
  MapsSuggestionsRidesharingSource *v18;
  uint64_t v19;
  NSObject *v20;
  NSObject *v21;
  _QWORD v22[4];
  void (**v23)(_QWORD);
  id v24;
  _QWORD block[4];
  void (**v26)(_QWORD);
  id v27;
  _QWORD v28[4];
  void (**v29)(_QWORD);
  id v30;
  uint8_t v31[16];
  id buf[2];

  v4 = (void (**)(_QWORD))a3;
  v5 = MapsSuggestionsLoggingSubsystem;
  Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RidesharingSource");
  v7 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "updateSuggestionEntriesWithHandler", (uint8_t *)buf, 2u);
  }

  objc_initWeak(buf, self);
  if ((+[MapsSuggestionsSiri isEnabled](MapsSuggestionsSiri, "isEnabled") & 1) == 0)
  {
    v13 = GEOFindOrCreateLog(v5, "RidesharingSource");
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "User turned off Siri: we're not using our suggestions", v31, 2u);
    }

    queue = self->_queue;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10094CFAC;
    v28[3] = &unk_1011B0520;
    v11 = &v30;
    objc_copyWeak(&v30, buf);
    v29 = v4;
    dispatch_async(queue, v28);
    v12 = v29;
    goto LABEL_11;
  }
  if (MapsSuggestionsIsInCoarseLocation())
  {
    v8 = GEOFindOrCreateLog(v5, "RidesharingSource");
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Maps is in Coarse Location", v31, 2u);
    }

    v10 = self->_queue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10094D1C0;
    block[3] = &unk_1011B0520;
    v11 = &v27;
    objc_copyWeak(&v27, buf);
    v26 = v4;
    dispatch_async(v10, block);
    v12 = v26;
LABEL_11:

    objc_destroyWeak(v11);
    goto LABEL_12;
  }
  v18 = self;
  objc_sync_enter(v18);
  if (!-[MapsSuggestionsRidesharingSource suspended](v18, "suspended"))
  {
    objc_sync_exit(v18);

    v21 = v18->_queue;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10094D3D4;
    v22[3] = &unk_1011B0520;
    objc_copyWeak(&v24, buf);
    v23 = v4;
    dispatch_async(v21, v22);
    Double = GEOConfigGetDouble(GEOConfigMapsSuggestionsRidesharingUpdateLookIntervalInSeconds[0], GEOConfigMapsSuggestionsRidesharingUpdateLookIntervalInSeconds[1]);

    objc_destroyWeak(&v24);
    goto LABEL_13;
  }
  v19 = GEOFindOrCreateLog(v5, "RidesharingSource");
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v31 = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "Suspended, so no need to update", v31, 2u);
  }

  if (v4)
    v4[2](v4);
  objc_sync_exit(v18);

LABEL_12:
  Double = 0.0;
LABEL_13:
  objc_destroyWeak(buf);

  return Double;
}

- (void)rideStatusMapDidChange:(id)a3
{
  id v5;
  MapsSuggestionsRidesharingSource *v6;
  uint64_t v7;
  uint64_t Log;
  NSObject *v9;
  NSString *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  uint64_t v15;
  NSObject *v16;
  NSObject *queue;
  _QWORD v18[4];
  id v19;
  id v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const char *v24;

  v5 = a3;
  v6 = self;
  objc_sync_enter(v6);
  if (-[MapsSuggestionsRidesharingSource suspended](v6, "suspended"))
  {
    v7 = MapsSuggestionsLoggingSubsystem;
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RidesharingSource");
    v9 = (id)objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v10 = NSStringFromSelector(a2);
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      *(_DWORD *)buf = 138412290;
      v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Returning from %@ because we are suspended", buf, 0xCu);

    }
    v12 = GEOFindOrCreateLog(v7, "RidesharingSource");
    v13 = (id)objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MapsSuggestionsRidesharingSource uniqueName](v6, "uniqueName"));
      *(_DWORD *)buf = 138412546;
      v22 = v14;
      v23 = 2080;
      v24 = "_updateRideBookingRideStatuses";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{MSgDebug} OBJECT{%@} %s END", buf, 0x16u);

    }
    v15 = GEOFindOrCreateLog(v7, "RidesharingSource");
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_END, 0xEEEEB0B5B2B2EEEELL, "_updateRideBookingRideStatuses", ", buf, 2u);
    }

    objc_sync_exit(v6);
  }
  else
  {
    objc_sync_exit(v6);

    objc_initWeak((id *)buf, v6);
    queue = v6->_queue;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10094D8D0;
    v18[3] = &unk_1011AD1E8;
    objc_copyWeak(&v20, (id *)buf);
    v19 = v5;
    dispatch_async(queue, v18);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)buf);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (BOOL)refreshing
{
  return self->_refreshing;
}

- (void)setRefreshing:(BOOL)a3
{
  self->_refreshing = a3;
}

- (BOOL)suspended
{
  return self->_suspended;
}

- (void)setSuspended:(BOOL)a3
{
  self->_suspended = a3;
}

- (RideBookingRideStatusObserverProxy)rideStatusObserverProxy
{
  return self->_rideStatusObserverProxy;
}

- (void)setRideStatusObserverProxy:(id)a3
{
  objc_storeStrong((id *)&self->_rideStatusObserverProxy, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rideStatusObserverProxy, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_guardian, 0);
  objc_storeStrong(&self->_oneShotCallbackBlock, 0);
}

@end
