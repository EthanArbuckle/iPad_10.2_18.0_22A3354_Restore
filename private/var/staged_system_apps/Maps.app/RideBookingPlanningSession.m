@implementation RideBookingPlanningSession

- (RideBookingPlanningSession)initWithInitiator:(unint64_t)a3 waypointRequests:(id)a4 traits:(id)a5
{
  id v9;
  id v10;
  RideBookingPlanningSession *v11;
  RideBookingPlanningSession *v12;
  uint64_t v13;
  RoutePlanningWaypointRequest *originRequest;
  uint64_t v15;
  RoutePlanningWaypointRequest *destinationRequest;
  GEOMapServiceTraits *v17;
  GEOMapServiceTraits *traits;
  GEOObserverHashTable *v19;
  GEOObserverHashTable *observers;
  void *v21;
  void *v22;
  void *v23;
  WaypointControllerConfiguration *v24;
  WaypointController *v25;
  WaypointController *waypointController;
  objc_super v28;
  _QWORD v29[2];

  v9 = a4;
  v10 = a5;
  v28.receiver = self;
  v28.super_class = (Class)RideBookingPlanningSession;
  v11 = -[RideBookingPlanningSession init](&v28, "init");
  v12 = v11;
  if (v11)
  {
    v11->_sessionInitiator = a3;
    objc_storeStrong((id *)&v11->_waypointRequests, a4);
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 0));
    originRequest = v12->_originRequest;
    v12->_originRequest = (RoutePlanningWaypointRequest *)v13;

    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndexedSubscript:", 1));
    destinationRequest = v12->_destinationRequest;
    v12->_destinationRequest = (RoutePlanningWaypointRequest *)v15;

    v17 = (GEOMapServiceTraits *)objc_msgSend(v10, "copy");
    traits = v12->_traits;
    v12->_traits = v17;

    v19 = (GEOObserverHashTable *)objc_msgSend(objc_alloc((Class)GEOObserverHashTable), "initWithProtocol:queue:", &OBJC_PROTOCOL___RideBookingPlanningSessionObserver, 0);
    observers = v12->_observers;
    v12->_observers = v19;

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointRequest](v12->_originRequest, "waypointRequest"));
    v29[0] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[RoutePlanningWaypointRequest waypointRequest](v12->_destinationRequest, "waypointRequest"));
    v29[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));

    v24 = -[WaypointControllerConfiguration initWithRequests:traits:]([WaypointControllerConfiguration alloc], "initWithRequests:traits:", v23, v12->_traits);
    v25 = -[WaypointController initWithConfiguration:]([WaypointController alloc], "initWithConfiguration:", v24);
    waypointController = v12->_waypointController;
    v12->_waypointController = v25;

    -[WaypointController setDelegate:](v12->_waypointController, "setDelegate:", v12);
  }

  return v12;
}

- (NSString)originName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession originRequest](self, "originRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession resolvedWaypoints](self, "resolvedWaypoints"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "origin"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nameWithResolvedWaypoint:allowCurrentLocation:", v5, 1));

  return (NSString *)v6;
}

- (NSString)destinationName
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession destinationRequest](self, "destinationRequest"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession resolvedWaypoints](self, "resolvedWaypoints"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "destination"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nameWithResolvedWaypoint:allowCurrentLocation:", v5, 0));

  return (NSString *)v6;
}

- (Result)resolvedWaypointsResult
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession waypointController](self, "waypointController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "resolvedWaypointSetResult"));

  return (Result *)v3;
}

- (WaypointSet)resolvedWaypoints
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100466C0C;
  v10 = sub_100466C1C;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession resolvedWaypointsResult](self, "resolvedWaypointsResult"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100466C24;
  v5[3] = &unk_1011B7630;
  v5[4] = &v6;
  objc_msgSend(v2, "withValue:orError:", v5, &stru_1011B7650);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (WaypointSet *)v3;
}

- (RideBookingRideOptionStateObserverProxy)rideOptionStateObserver
{
  void *v2;
  id v3;
  _QWORD v5[5];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = sub_100466C0C;
  v10 = sub_100466C1C;
  v11 = 0;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession rideOptionStateObserverResult](self, "rideOptionStateObserverResult"));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100466D14;
  v5[3] = &unk_1011B7678;
  v5[4] = &v6;
  objc_msgSend(v2, "withValue:orError:", v5, &stru_1011B7698);

  v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (RideBookingRideOptionStateObserverProxy *)v3;
}

- (void)refresh
{
  void *v3;
  id v4;

  if (-[RideBookingPlanningSession sessionState](self, "sessionState"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession waypointController](self, "waypointController"));
    objc_msgSend(v3, "stop");

    -[RideBookingPlanningSession setRideOptionStateObserverResult:](self, "setRideOptionStateObserverResult:", 0);
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession waypointController](self, "waypointController"));
    objc_msgSend(v4, "start");

  }
}

- (void)resume
{
  void *v3;
  id v4;

  if (!-[RideBookingPlanningSession sessionState](self, "sessionState"))
  {
    -[RideBookingPlanningSession setSessionState:](self, "setSessionState:", 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession observers](self, "observers"));
    objc_msgSend(v3, "mapsSession:didChangeState:", self, -[RideBookingPlanningSession sessionState](self, "sessionState"));

    v4 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession waypointController](self, "waypointController"));
    objc_msgSend(v4, "start");

  }
}

- (void)suspend
{
  void *v3;
  id v4;

  if ((id)-[RideBookingPlanningSession sessionState](self, "sessionState") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession waypointController](self, "waypointController"));
    objc_msgSend(v3, "stop");

    -[RideBookingPlanningSession setRideOptionStateObserverResult:](self, "setRideOptionStateObserverResult:", 0);
    -[RideBookingPlanningSession setSessionState:](self, "setSessionState:", 2);
    v4 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession observers](self, "observers"));
    objc_msgSend(v4, "mapsSession:didChangeState:", self, -[RideBookingPlanningSession sessionState](self, "sessionState"));

  }
}

- (void)prepareToReplayCurrentState
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession observers](self, "observers"));
  objc_msgSend(v2, "snapshotCurrentObservers");

}

- (void)replayCurrentState
{
  void *v3;
  void *v4;
  id v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession observers](self, "observers"));
  objc_msgSend(v3, "removeSnapshottedObservers");

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession observers](self, "observers"));
  objc_msgSend(v4, "mapsSession:didChangeState:", self, -[RideBookingPlanningSession sessionState](self, "sessionState"));

  v5 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession observers](self, "observers"));
  objc_msgSend(v5, "restoreOriginalObservers");

}

- (void)cleanupStateReplay
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession observers](self, "observers"));
  objc_msgSend(v2, "clearSnapshottedObservers");

}

- (void)_handleReceivedWaypointSetResult
{
  void *v3;
  void *v4;
  _QWORD block[4];
  id v6;
  id location;
  _QWORD v8[5];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession resolvedWaypointsResult](self, "resolvedWaypointsResult"));
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10046708C;
  v8[3] = &unk_1011B76C0;
  v8[4] = self;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "flatMap:", v8));
  -[RideBookingPlanningSession setRideOptionStateObserverResult:](self, "setRideOptionStateObserverResult:", v4);

  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1004671A4;
  block[3] = &unk_1011AD260;
  objc_copyWeak(&v6, &location);
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)addObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession observers](self, "observers"));
  objc_msgSend(v5, "registerObserver:", v4);

}

- (void)removeObserver:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession observers](self, "observers"));
  objc_msgSend(v5, "unregisterObserver:", v4);

}

- (void)waypointController:(id)a3 didResolveWaypointSet:(id)a4
{
  id v5;
  void **v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  RideBookingPlanningSession *v10;
  id v11;

  v6 = _NSConcreteStackBlock;
  v7 = 3221225472;
  v8 = sub_100467390;
  v9 = &unk_1011AC8B0;
  v10 = self;
  v11 = a4;
  v5 = v11;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &v6);
  -[RideBookingPlanningSession _handleReceivedWaypointSetResult](self, "_handleReceivedWaypointSetResult", v6, v7, v8, v9, v10);

}

- (void)rideOptionStateDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[2];

  v4 = a3;
  if (objc_msgSend(v4, "noRideOptionsAvailable")
    && objc_msgSend(v4, "noAppStoreSuggestionsAvailable"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Directions Not Available"), CFSTR("localized string not found"), 0));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("No ride booking apps for your location are available from the App Store. [Ridesharing Route Planning]"), CFSTR("localized string not found"), 0));

    v13[0] = NSLocalizedDescriptionKey;
    v13[1] = NSLocalizedFailureReasonErrorKey;
    v14[0] = v6;
    v14[1] = v8;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v14, v13, 2));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.Maps.RideBooking"), 0, v9));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[Result resultWithError:](Result, "resultWithError:", v10));
    -[RideBookingPlanningSession setRideOptionStateObserverResult:](self, "setRideOptionStateObserverResult:", v11);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession observers](self, "observers"));
  objc_msgSend(v12, "RideBookingPlanningSession:rideOptionStateDidChange:", self, v4);

}

- (unint64_t)sessionInitiator
{
  return self->_sessionInitiator;
}

- (PlatformController)platformController
{
  return (PlatformController *)objc_loadWeakRetained((id *)&self->_platformController);
}

- (void)setPlatformController:(id)a3
{
  objc_storeWeak((id *)&self->_platformController, a3);
}

- (RoutePlanningWaypointRequest)originRequest
{
  return self->_originRequest;
}

- (RoutePlanningWaypointRequest)destinationRequest
{
  return self->_destinationRequest;
}

- (NSArray)waypointRequests
{
  return self->_waypointRequests;
}

- (GEOMapServiceTraits)traits
{
  return self->_traits;
}

- (Result)rideOptionStateObserverResult
{
  return self->_rideOptionStateObserverResult;
}

- (void)setRideOptionStateObserverResult:(id)a3
{
  objc_storeStrong((id *)&self->_rideOptionStateObserverResult, a3);
}

- (unint64_t)sessionState
{
  return self->_sessionState;
}

- (void)setSessionState:(unint64_t)a3
{
  self->_sessionState = a3;
}

- (GEOObserverHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (WaypointController)waypointController
{
  return self->_waypointController;
}

- (void)setWaypointController:(id)a3
{
  objc_storeStrong((id *)&self->_waypointController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_waypointController, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_rideOptionStateObserverResult, 0);
  objc_storeStrong((id *)&self->_traits, 0);
  objc_storeStrong((id *)&self->_waypointRequests, 0);
  objc_storeStrong((id *)&self->_destinationRequest, 0);
  objc_storeStrong((id *)&self->_originRequest, 0);
  objc_destroyWeak((id *)&self->_platformController);
}

- (int64_t)requestState
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  int64_t v7;
  void *v8;
  void *v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[GEONetworkObserver sharedNetworkObserver](GEONetworkObserver, "sharedNetworkObserver"));
  v4 = objc_msgSend(v3, "isNetworkReachable");

  if (!v4)
    return 3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession rideOptionStateObserverResult](self, "rideOptionStateObserverResult"));
  v6 = v5;
  if (v5)
  {
    if (objc_msgSend(v5, "isSuccess"))
      v7 = 2;
    else
      v7 = 3;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession resolvedWaypointsResult](self, "resolvedWaypointsResult"));
    if (v8)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[RideBookingPlanningSession resolvedWaypointsResult](self, "resolvedWaypointsResult"));
      if (objc_msgSend(v9, "isSuccess"))
        v7 = 1;
      else
        v7 = 3;

    }
    else
    {
      v7 = 1;
    }

  }
  return v7;
}

@end
