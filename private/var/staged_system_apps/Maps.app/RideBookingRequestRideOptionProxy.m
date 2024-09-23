@implementation RideBookingRequestRideOptionProxy

- (RideBookingRequestRideOptionProxy)initWithDelegate:(id)a3
{
  id v4;
  RideBookingRequestRideOptionProxy *v5;
  RideBookingRequestRideOptionProxy *v6;
  uint64_t v7;
  RidesharingAnalyticsBookingSession *analyticsBookingSession;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RideBookingRequestRideOptionProxy;
  v5 = -[RideBookingRequestRideOptionProxy init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_delegate, v4);
    v7 = objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy rideBookingCurrentRideBookingSessionCreateIfNecessary:](RideBookingAccessProxy, "rideBookingCurrentRideBookingSessionCreateIfNecessary:", 0));
    analyticsBookingSession = v6->_analyticsBookingSession;
    v6->_analyticsBookingSession = (RidesharingAnalyticsBookingSession *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
    objc_msgSend(v9, "addRideBookingDataCoordinatorRequestRideObserver:", v6);

  }
  return v6;
}

- (void)updateStartingWaypointCoordinate:(CLLocationCoordinate2D)a3
{
  double longitude;
  double latitude;
  id v5;

  longitude = a3.longitude;
  latitude = a3.latitude;
  v5 = (id)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
  objc_msgSend(v5, "updateRequestRideStartingWaypointCoordinate:", latitude, longitude);

}

- (void)updateRequestRidePaymentMethod:(id)a3
{
  id v4;
  void *v5;
  _BOOL8 v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "intentsPaymentMethod"));
  v6 = objc_msgSend(v5, "type") == (id)8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideOptionProxy analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v7, "setPaymentIsApplePay:", v6);

  v8 = (id)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
  objc_msgSend(v8, "updateRequestRidePaymentMethod:", v4);

}

- (void)updateRequestRidePassengers:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
  objc_msgSend(v4, "updateRequestRidePassengers:", v3);

}

- (void)requestRideWithCompletion:(id)a3
{
  id v4;
  void *v5;
  uint64_t Log;
  NSObject *v7;
  _QWORD v8[4];
  id v9;
  id v10;
  _BYTE location[12];
  __int16 v12;
  int v13;
  __int16 v14;
  const char *v15;
  __int16 v16;
  const char *v17;

  v4 = a3;
  if (v4)
  {
    objc_initWeak((id *)location, self);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1007A717C;
    v8[3] = &unk_1011C6A70;
    objc_copyWeak(&v10, (id *)location);
    v9 = v4;
    objc_msgSend(v5, "requestRideWithCompletion:", v8);

    objc_destroyWeak(&v10);
    objc_destroyWeak((id *)location);
  }
  else
  {
    Log = GEOFindOrCreateLog(MapsSuggestionsLoggingSubsystem, "RideBookingRequestRideOptionProxy");
    v7 = objc_claimAutoreleasedReturnValue(Log);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)location = 136446978;
      *(_QWORD *)&location[4] = "/Library/Caches/com.apple.xbs/Sources/Maps/iOS/Ride Booking/RideBookingRequestRideOptionProxy.m";
      v12 = 1024;
      v13 = 66;
      v14 = 2082;
      v15 = "-[RideBookingRequestRideOptionProxy requestRideWithCompletion:]";
      v16 = 2082;
      v17 = "nil == (completion)";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_FAULT, "At %{public}s:%d, %{public}s forbids: %{public}s. Requires completion block", location, 0x26u);
    }

  }
}

- (void)requestRideStatusDidChange:(id)a3
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
  block[2] = sub_1007A73FC;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateAnalyticsWithRequestRideStatus:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "origin"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "location"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideOptionProxy analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v6, "setOrigin:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "destination"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "location"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideOptionProxy analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v9, "setDestination:", v8);

  v10 = (void *)objc_opt_new(GEORideBookingIntentResponseFailure);
  objc_msgSend(v10, "setIntent:", 2);
  objc_msgSend(v10, "setFailure:", 0);
  v11 = (unint64_t)objc_msgSend(v14, "requestRideStatusError") - 1;
  if (v11 <= 7)
    objc_msgSend(v10, "setFailure:", dword_100E3A5D8[v11]);
  if (objc_msgSend(v10, "failure"))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideOptionProxy analyticsBookingSession](self, "analyticsBookingSession"));
    objc_msgSend(v12, "captureIntent:withFailure:", objc_msgSend(v10, "intent"), objc_msgSend(v10, "failure"));

  }
  if (objc_msgSend(v14, "requestRideStatusError"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideOptionProxy analyticsBookingSession](self, "analyticsBookingSession"));
    objc_msgSend(v13, "endSessionOnView:state:", 2, 5);

  }
}

- (void)_updateAnalyticsWithRideStatus:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "identifier"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "identifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:](RideBookingAccessProxy, "rideBookingCurrentBookedSessionForAppIdentifier:rideIdentifier:", v6, v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "application"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "version"));
  objc_msgSend(v8, "setAppVersion:", v10);

  objc_msgSend(v8, "setNumberOfEnabledExtensions:", -[RidesharingAnalyticsBookingSession numberOfEnabledExtensions](self->_analyticsBookingSession, "numberOfEnabledExtensions"));
  objc_msgSend(v8, "setNumberOfInstalledExtensions:", -[RidesharingAnalyticsBookingSession numberOfInstalledExtensions](self->_analyticsBookingSession, "numberOfInstalledExtensions"));
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "intentResponseFailures", 0));
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v21;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v21 != v14)
          objc_enumerationMutation(v11);
        objc_msgSend(v8, "captureIntent:withFailure:", 3, objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)v15), "failure"));
        v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v13);
  }

  if ((objc_msgSend(v4, "isValidRide") & 1) != 0)
  {
    objc_msgSend(v8, "setBookedUsingMaps:", 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideOptionProxy analyticsBookingSession](self, "analyticsBookingSession"));
    v17 = v16;
    v18 = 4;
    v19 = 1;
  }
  else
  {
    objc_msgSend(v8, "endSession");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRequestRideOptionProxy analyticsBookingSession](self, "analyticsBookingSession"));
    v17 = v16;
    v18 = 3;
    v19 = 5;
  }
  objc_msgSend(v16, "endSessionOnView:state:", v18, v19);

}

- (RidesharingAnalyticsBookingSession)analyticsBookingSession
{
  return self->_analyticsBookingSession;
}

- (void)setAnalyticsBookingSession:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsBookingSession, a3);
}

- (RideBookingRequestRideOptionProxyDelegate)delegate
{
  return (RideBookingRequestRideOptionProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_analyticsBookingSession, 0);
}

@end
