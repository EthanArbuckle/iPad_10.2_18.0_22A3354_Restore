@implementation RideBookingRideOptionStateObserverProxy

- (RideBookingRideOptionStateObserverProxy)initWithDelegate:(id)a3
{
  id v4;
  RideBookingRideOptionStateObserverProxy *v5;
  RideBookingRideOptionStateObserverProxy *v6;
  uint64_t v7;
  RidesharingAnalyticsBookingSession *analyticsBookingSession;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)RideBookingRideOptionStateObserverProxy;
  v5 = -[RideBookingRideOptionStateObserverProxy init](&v11, "init");
  v6 = v5;
  if (v5)
  {
    -[RideBookingRideOptionStateObserverProxy setDelegate:](v5, "setDelegate:", v4);
    v7 = objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy rideBookingCurrentRideBookingSessionCreateIfNecessary:](RideBookingAccessProxy, "rideBookingCurrentRideBookingSessionCreateIfNecessary:", 1));
    analyticsBookingSession = v6->_analyticsBookingSession;
    v6->_analyticsBookingSession = (RidesharingAnalyticsBookingSession *)v7;

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
    objc_msgSend(v9, "addRideBookingDataCoordinatorRideOptionStateObserver:", v6);

  }
  return v6;
}

- (void)updateRideOptionStateForOrigin:(id)a3 destination:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "placemark"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionStateObserverProxy analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v10, "setOrigin:", v9);

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placemark"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "location"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionStateObserverProxy analyticsBookingSession](self, "analyticsBookingSession"));
  objc_msgSend(v13, "setDestination:", v12);

  v18 = (id)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_geoMapItem"));

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v14));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "_geoMapItem"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapItemStorage mapItemStorageForGEOMapItem:](GEOMapItemStorage, "mapItemStorageForGEOMapItem:", v16));
  objc_msgSend(v18, "updateRideOptionStateForOrigin:destination:", v15, v17);

}

- (void)startRequestRideForRideOption:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = (id)objc_claimAutoreleasedReturnValue(+[RideBookingAccessProxy coordinator](RideBookingAccessProxy, "coordinator"));
  objc_msgSend(v4, "startRequestRideForRideOption:", v3);

}

- (void)rideOptionStateDidChange:(id)a3
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
  block[2] = sub_1004FD6E0;
  block[3] = &unk_1011AD1E8;
  objc_copyWeak(&v8, &location);
  v7 = v4;
  v5 = v4;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);

  objc_destroyWeak(&v8);
  objc_destroyWeak(&location);
}

- (void)_updateAnalyticsWithRideOptionStatus:(id)a3
{
  id v4;
  char *v5;
  char *v6;
  void *v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_opt_new(GEORideBookingIntentResponseFailure);
  objc_msgSend(v8, "setIntent:", 1);
  objc_msgSend(v8, "setFailure:", 0);
  v5 = (char *)objc_msgSend(v4, "rideOptionStatusError");

  v6 = v5 - 1;
  if ((unint64_t)(v5 - 1) <= 0xA && ((0x7FDu >> (char)v6) & 1) != 0)
    objc_msgSend(v8, "setFailure:", dword_100E37720[(_QWORD)v6]);
  if (objc_msgSend(v8, "failure"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingRideOptionStateObserverProxy analyticsBookingSession](self, "analyticsBookingSession"));
    objc_msgSend(v7, "captureIntent:withFailure:", objc_msgSend(v8, "intent"), objc_msgSend(v8, "failure"));

  }
}

- (RidesharingAnalyticsBookingSession)analyticsBookingSession
{
  return self->_analyticsBookingSession;
}

- (void)setAnalyticsBookingSession:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsBookingSession, a3);
}

- (RideBookingRideOptionState)rideOptionState
{
  return self->_rideOptionState;
}

- (void)setRideOptionState:(id)a3
{
  objc_storeStrong((id *)&self->_rideOptionState, a3);
}

- (RideBookingRideOptionStateObserverProxyDelegate)delegate
{
  return (RideBookingRideOptionStateObserverProxyDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_rideOptionState, 0);
  objc_storeStrong((id *)&self->_analyticsBookingSession, 0);
}

@end
