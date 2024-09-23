@implementation RideBookingRideStatusObserverProxy

- (RideBookingRideStatusObserverProxy)initWithDelegate:(id)a3
{
  id v4;
  RideBookingRideStatusObserverProxy *v5;
  RideBookingRideStatusObserverProxy *v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)RideBookingRideStatusObserverProxy;
  v5 = -[RideBookingRideStatusObserverProxy init](&v9, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
    objc_msgSend(v7, "addRideBookingDataCoordinatorRideStatusObserver:", v6);

  }
  return v6;
}

- (void)updateRideStatusMap
{
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_1011BACC0);
}

- (void)sendFeedbackForRideStatus:(id)a3 feedbackRating:(id)a4 feedbackTip:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t Log;
  NSObject *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  _BYTE location[12];
  __int16 v22;
  int v23;
  __int16 v24;
  const char *v25;
  __int16 v26;
  const char *v27;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v13)
  {
    objc_initWeak((id *)location, self);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10054D514;
    v17[3] = &unk_1011BACE8;
    objc_copyWeak(&v20, (id *)location);
    v18 = v10;
    v19 = v13;
    objc_msgSend(v14, "sendFeedbackForRideStatus:feedbackRating:feedbackTip:completion:", v18, v11, v12, v17);

    objc_destroyWeak(&v20);
    objc_destroyWeak((id *)location);
  }
  else
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingRideStatusObserverProxy");
    v16 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingRideStatusObserverProxy.m";
      v22 = 1024;
      v23 = 49;
      v24 = 2082;
      v25 = "-[RideBookingRideStatusObserverProxy sendFeedbackForRideStatus:feedbackRating:feedbackTip:completion:]";
      v26 = 2082;
      v27 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", location, 0x26u);
    }

  }
}

- (void)checkIfCanCancelRideWithRideStatus:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t Log;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _BYTE location[12];
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_initWeak((id *)location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10054D8EC;
    v11[3] = &unk_1011BAD38;
    objc_copyWeak(&v14, (id *)location);
    v12 = v6;
    v13 = v7;
    objc_msgSend(v8, "checkIfCanCancelRideWithRideStatus:completion:", v12, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)location);
  }
  else
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingRideStatusObserverProxy");
    v10 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingRideStatusObserverProxy.m";
      v16 = 1024;
      v17 = 63;
      v18 = 2082;
      v19 = "-[RideBookingRideStatusObserverProxy checkIfCanCancelRideWithRideStatus:completion:]";
      v20 = 2082;
      v21 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", location, 0x26u);
    }

  }
}

- (void)cancelRideWithRideStatus:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t Log;
  NSObject *v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  _BYTE location[12];
  __int16 v16;
  int v17;
  __int16 v18;
  const char *v19;
  __int16 v20;
  const char *v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    objc_initWeak((id *)location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10054DD18;
    v11[3] = &unk_1011BACE8;
    objc_copyWeak(&v14, (id *)location);
    v12 = v6;
    v13 = v7;
    objc_msgSend(v8, "cancelRideWithRideStatus:completion:", v12, v11);

    objc_destroyWeak(&v14);
    objc_destroyWeak((id *)location);
  }
  else
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingRideStatusObserverProxy");
    v10 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingRideStatusObserverProxy.m";
      v16 = 1024;
      v17 = 77;
      v18 = 2082;
      v19 = "-[RideBookingRideStatusObserverProxy cancelRideWithRideStatus:completion:]";
      v20 = 2082;
      v21 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", location, 0x26u);
    }

  }
}

- (void)rideStatusMapDidChange:(id)a3
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
  block[2] = sub_10054DFAC;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateAnalyticsWithRideStatus:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "application"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:](RideBookingAccessProxy, "rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:", v5, v6));

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "intentResponseFailures", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v14 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "captureIntent:withFailure:", objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "intent"), objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "failure"));
        v12 = (char *)v12 + 1;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v10);
  }

  if ((objc_msgSend(v3, "isValidRide") & 1) == 0)
    objc_msgSend(v7, "endSession");

}

- (void)_updateAnalyticsWithRideStatus:(id)a3 cancelError:(id)a4 handling:(BOOL)a5
{
  _BOOL4 v5;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;

  v5 = a5;
  v7 = a4;
  if (v7)
  {
    v16 = v7;
    v8 = a3;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "application"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "identifier"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:](RideBookingAccessProxy, "rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:", v10, v11));
    v13 = (void *)objc_opt_new(GEORideBookingIntentResponseFailure);
    v14 = v13;
    if (v5)
      v15 = 6;
    else
      v15 = 5;
    objc_msgSend(v13, "setIntent:", v15);
    objc_msgSend(v14, "setFailure:", 1);
    if (objc_msgSend(v16, "code") == (id)-11)
      objc_msgSend(v14, "setFailure:", 4);
    if (objc_msgSend(v16, "code") == (id)-13)
      objc_msgSend(v14, "setFailure:", 3);
    objc_msgSend(v12, "captureIntent:withFailure:", objc_msgSend(v14, "intent"), objc_msgSend(v14, "failure"));
    objc_msgSend(v12, "endSession");

    v7 = v16;
  }

}

- (void)_updateAnalyticsWithRideStatus:(id)a3 feedbackError:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;

  if (a4)
  {
    v5 = a4;
    v6 = a3;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "application"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));

    v12 = (id)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:](RideBookingAccessProxy, "rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:", v8, v9));
    v10 = (void *)objc_opt_new(GEORideBookingIntentResponseFailure);
    objc_msgSend(v10, "setIntent:", 7);
    objc_msgSend(v10, "setFailure:", 1);
    v11 = objc_msgSend(v5, "code");

    if (v11 == (id)-11)
      objc_msgSend(v10, "setFailure:", 4);
    objc_msgSend(v12, "captureIntent:withFailure:", objc_msgSend(v10, "intent"), objc_msgSend(v10, "failure"));
    objc_msgSend(v12, "endSession");

  }
}

- (RideBookingRideStatusObserverProxyDelegate)delegate
{
  return (RideBookingRideStatusObserverProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

@end
