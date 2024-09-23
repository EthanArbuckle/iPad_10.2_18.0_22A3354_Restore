@implementation CarClusterNavigationController

- (CarClusterNavigationController)initWithAccessory:(id)a3 component:(id)a4
{
  id v7;
  id v8;
  CarClusterNavigationController *v9;
  CarClusterNavigationController *v10;
  CarClusterUpdateRouteGuidance *v11;
  CarClusterUpdateRouteGuidance *currentACCNavRouteGuidance;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)CarClusterNavigationController;
  v9 = -[CarClusterNavigationController init](&v15, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_accessory, a3);
    objc_storeStrong((id *)&v10->_component, a4);
    v11 = objc_alloc_init(CarClusterUpdateRouteGuidance);
    currentACCNavRouteGuidance = v10->_currentACCNavRouteGuidance;
    v10->_currentACCNavRouteGuidance = v11;

    -[CarClusterUpdate setComponent:](v10->_currentACCNavRouteGuidance, "setComponent:", v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
    objc_msgSend(v13, "registerObserver:", v10);

  }
  return v10;
}

- (void)dealloc
{
  void *v3;
  MNETADisplayFormatter *etaDisplayFormatter;
  objc_super v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  objc_msgSend(v3, "unregisterObserver:", self);

  etaDisplayFormatter = self->_etaDisplayFormatter;
  if (etaDisplayFormatter)
    -[MNETADisplayFormatter setDelegate:](etaDisplayFormatter, "setDelegate:", 0);
  v5.receiver = self;
  v5.super_class = (Class)CarClusterNavigationController;
  -[CarClusterNavigationController dealloc](&v5, "dealloc");
}

- (void)setRouteGuidanceBeingShownInApp:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  objc_msgSend(v5, "setBeingShownInApp:", v3);

  -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
}

- (BOOL)smartGuidanceActive
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute composedGuidanceEvents](self->_currentRoute, "composedGuidanceEvents"));
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (void)setCurrentRoute:(id)a3
{
  GEOComposedRoute *v5;
  void *v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  _BOOL8 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  double v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  GEOComposedRoute *v35;

  v5 = (GEOComposedRoute *)a3;
  if (self->_currentRoute != v5)
  {
    v35 = v5;
    objc_storeStrong((id *)&self->_currentRoute, a3);
    -[CarClusterNavigationController setCurrentACCNavManeuvers:](self, "setCurrentACCNavManeuvers:", 0);
    -[CarClusterNavigationController setCurrentACCNavLaneGuidances:](self, "setCurrentACCNavLaneGuidances:", 0);
    -[CarClusterNavigationController setEtaDisplayFormatter:](self, "setEtaDisplayFormatter:", 0);
    -[CarClusterNavigationController setIndexedSteps:](self, "setIndexedSteps:", 0);
    if (v35)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      v7 = objc_msgSend(v6, "routeGuidanceState");

      if (!v7)
        -[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", 3);
      v8 = objc_alloc((Class)MNETADisplayFormatter);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "upcomingStop"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "timezone"));
      v12 = objc_msgSend(v8, "initWithTimeZone:", v11);
      -[CarClusterNavigationController setEtaDisplayFormatter:](self, "setEtaDisplayFormatter:", v12);

      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController etaDisplayFormatter](self, "etaDisplayFormatter"));
      objc_msgSend(v13, "setDelegate:", self);

      v14 = -[CarClusterNavigationController smartGuidanceActive](self, "smartGuidanceActive");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v15, "setSmartGuidanceActive:", v14);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute composedGuidanceEventsWithSignGuidance](v35, "composedGuidanceEventsWithSignGuidance"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v16, "count")));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v18, "setRouteGuidanceManeuverCount:", v17);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute composedGuidanceEvents](v35, "composedGuidanceEvents"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v19, "count")));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v21, "setLaneGuidanceTotalCount:", v20);

      v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v22, "setLaneGuidanceShowing:", 0);

      v23 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v23, "setLaneGuidanceCurrentIndex:", 0);

      v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController _destinationTimeZoneOffsetMinutes](self, "_destinationTimeZoneOffsetMinutes"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v25, "setDestinationTimeZoneOffsetMinutes:", v24);

      v26 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "displayETAInfoForRoute:", v35));

      v28 = (double)(unint64_t)objc_msgSend(v27, "displayRemainingMinutesToEndOfLeg");
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController etaDisplayFormatter](self, "etaDisplayFormatter"));
      objc_msgSend(v29, "setRemainingTimeToEndOfLeg:", v28);

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "remainingDistanceInfoForRoute:", v35));

      objc_msgSend(v31, "distanceRemainingToEndOfLeg");
      -[CarClusterNavigationController updateRemainingDistance:](self, "updateRemainingDistance:");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "destinationName"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v34, "setDestinationName:", v33);

    }
    -[CarClusterNavigationController sendLaneGuidance](self, "sendLaneGuidance");
    -[CarClusterNavigationController sendManeuvers](self, "sendManeuvers");
    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
    v5 = v35;
  }

}

- (BOOL)updateManeuverIndex:(unint64_t)a3 distanceToManeuver:(double)a4
{
  void *v6;
  void *v7;
  void *v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
  v9 = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  LOBYTE(self) = -[CarClusterNavigationController updateManeuverIndices:distanceToManeuver:](self, "updateManeuverIndices:distanceToManeuver:", v7, a4);

  return (char)self;
}

- (BOOL)updateManeuverIndices:(id)a3 distanceToManeuver:(double)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  BOOL v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  void *v24;
  id v26;
  unsigned __int16 v27;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeGuidanceManeuverCurrentList"));
  if (v8)
  {
    v9 = (void *)v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "routeGuidanceManeuverCurrentList"));
    v12 = +[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v11, v6);

    if ((v12 & 1) != 0)
    {
      v13 = 0;
      goto LABEL_6;
    }
  }
  else
  {

  }
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  objc_msgSend(v14, "setRouteGuidanceManeuverCurrentList:", v6);

  v13 = 1;
LABEL_6:
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "distanceRemainingToNextManeuver"));
  objc_msgSend(v16, "doubleValue");
  v18 = v17;

  if (v18 != a4)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    objc_msgSend(v20, "setDistanceRemainingToNextManeuver:", v19);

    v27 = 0;
    v26 = 0;
    +[CarClusterUpdate getStringValue:displayUnits:forRemainingDistance:](CarClusterUpdateRouteGuidance, "getStringValue:displayUnits:forRemainingDistance:", &v26, &v27, a4);
    v21 = v26;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    objc_msgSend(v22, "setDistanceRemainingToNextManeuverDisplayString:", v21);

    v23 = v27;
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    objc_msgSend(v24, "setDistanceRemainingToNextManeuverDisplayUnits:", v23);

    v13 = 1;
  }

  return v13;
}

- (id)_destinationTimeZoneOffsetMinutes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[GEOComposedRoute destination](self->_currentRoute, "destination"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "timezone"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)objc_msgSend(v3, "secondsFromGMTForDate:", v4) / 60));

  return v5;
}

- (BOOL)updateRemainingTime:(double)a3
{
  void *v5;
  unsigned int v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;

  if (a3 < 0.0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  v6 = objc_msgSend(v5, "routeGuidanceState");

  if (!v6)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController etaDisplayFormatter](self, "etaDisplayFormatter"));
  objc_msgSend(v7, "displayRemainingTimeToEndOfLeg");
  v9 = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController etaDisplayFormatter](self, "etaDisplayFormatter"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "displayETAToEndOfLeg"));
  objc_msgSend(v11, "timeIntervalSince1970");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "timeRemainingToDestination"));
  objc_msgSend(v15, "doubleValue");
  v17 = v16;

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "estimatedTimeOfArrival"));
  objc_msgSend(v19, "doubleValue");
  v21 = v20;

  if (v9 == v17 && v13 == v21)
    return 0;
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  objc_msgSend(v22, "updateRemainingTime:estimatedTimeOfArrival:", v9, v13);

  return 1;
}

- (BOOL)updateRemainingDistance:(double)a3
{
  void *v5;
  void *v6;
  double v7;
  _BOOL4 v8;
  void *v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "distanceRemaining"));
  objc_msgSend(v6, "doubleValue");
  v8 = v7 != a3 && a3 >= 0.0;

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    objc_msgSend(v9, "updateRemainingDistance:", a3);

  }
  return v8;
}

- (BOOL)updateRouteGuidanceState:(unsigned __int16)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  CarClusterUpdateManeuverInfo *v20;
  void *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  const __CFString *v25;

  v3 = a3;
  if (a3 == 1)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentRoute](self, "currentRoute"));

    if (!v5)
      return 0;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  v7 = objc_msgSend(v6, "routeGuidanceState");

  if (v7 == (_DWORD)v3)
    return 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  objc_msgSend(v9, "setRouteGuidanceState:", v3);

  v10 = v3 - 3;
  if (v3 >= 3)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    objc_msgSend(v11, "setCurrentRoadName:", &stru_1011EB268);

    if ((_DWORD)v3 == 5)
      -[CarClusterNavigationController setCurrentRoute:](self, "setCurrentRoute:", 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentRoute](self, "currentRoute"));

    if (!v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v13, "setRouteGuidanceManeuverCount:", &off_1012705E8);

      v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v14, "setRouteGuidanceManeuverCurrentList:", &off_101274238);

      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v15, "setManeuverState:", 3);

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v16, "setLaneGuidanceShowing:", 0);

      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v17, "setLaneGuidanceTotalCount:", &off_101270600);

      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v18, "setLaneGuidanceCurrentIndex:", &off_101270600);

      v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v19, "setDestinationTimeZoneOffsetMinutes:", &off_101270600);

      v20 = objc_opt_new(CarClusterUpdateManeuverInfo);
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
      -[CarClusterUpdate setComponent:](v20, "setComponent:", v21);

      v22 = &stru_1011EB268;
      -[CarClusterUpdateManeuverInfo setAfterManeuverRoadName:](v20, "setAfterManeuverRoadName:", &stru_1011EB268);
      -[CarClusterUpdateManeuverInfo setManeuverType:](v20, "setManeuverType:", 0);
      switch(v10)
      {
        case 0:
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v24 = v23;
          v25 = CFSTR("ACCNav_RouteGuidance_Loading");
          goto LABEL_14;
        case 1:
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v24 = v23;
          v25 = CFSTR("ACCNav_RouteGuidance_Locating");
          goto LABEL_14;
        case 2:
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v24 = v23;
          v25 = CFSTR("ACCNav_RouteGuidance_Rerouting");
          goto LABEL_14;
        case 3:
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v24 = v23;
          v25 = CFSTR("ACCNav_RouteGuidance_ProceedToRoute");
LABEL_14:
          v22 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", v25, CFSTR("localized string not found"), 0));

          break;
        default:
          break;
      }
      -[CarClusterUpdateManeuverInfo setManeuverDescription:](v20, "setManeuverDescription:", v22);
      -[CarClusterUpdateManeuverInfo setIndex:](v20, "setIndex:", &off_101270600);
      -[CarClusterNavigationController sendManeuverUpdate:](self, "sendManeuverUpdate:", v20);

    }
  }
  return 1;
}

- (void)sendRouteGuidance
{
  void *v3;
  uint64_t Log;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  void *v24;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "CarCluster");
  v5 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController accessory](self, "accessory"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "accessoryUID"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
    v9 = objc_msgSend(v8, "identifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "logFormat"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "accNavFormat"));
    *(_DWORD *)buf = 138413058;
    v18 = v7;
    v19 = 2048;
    v20 = v9;
    v21 = 2112;
    v22 = v10;
    v23 = 2112;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "accessory=%@ component=%ld \nupdate=%@ \naccNavFormat=%@", buf, 0x2Au);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController accessory](self, "accessory"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[ACCNavigationInfoBuilder accNavigationRouteGuidanceUpdateInfoFrom:](ACCNavigationInfoBuilder, "accNavigationRouteGuidanceUpdateInfoFrom:", v3));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
  v16 = v14;
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v16, 1));
  objc_msgSend(v12, "updateRouteGuidanceInfo:componentList:", v13, v15);

}

- (void)sendManeuverUpdate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  unsigned int v7;
  void *v8;
  uint64_t Log;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  id v25;
  __int16 v26;
  void *v27;
  __int16 v28;
  void *v29;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidanceIndexes](self, "currentACCNavLaneGuidanceIndexes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "index"));
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "index"));
    objc_msgSend(v4, "setLinkedLaneGuidanceInfo:", v8);

  }
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "CarCluster");
  v10 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController accessory](self, "accessory"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "accessoryUID"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
    v14 = objc_msgSend(v13, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logFormat"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accNavFormat"));
    *(_DWORD *)buf = 138413058;
    v23 = v12;
    v24 = 2048;
    v25 = v14;
    v26 = 2112;
    v27 = v15;
    v28 = 2112;
    v29 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "accessory=%@ component=%ld \nupdate=%@ \naccNavFormat=%@", buf, 0x2Au);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController accessory](self, "accessory"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[ACCNavigationInfoBuilder accNavigationManeuverUpdateInfoFrom:](ACCNavigationInfoBuilder, "accNavigationManeuverUpdateInfoFrom:", v4));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
  v21 = v19;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v21, 1));
  objc_msgSend(v17, "updateManeuverInfo:componentList:", v18, v20);

}

- (void)sendLaneGuidanceUpdate:(id)a3
{
  id v4;
  uint64_t Log;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint8_t buf[4];
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;

  v4 = a3;
  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "CarCluster");
  v6 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController accessory](self, "accessory"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "accessoryUID"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
    v10 = objc_msgSend(v9, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "logFormat"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "accNavFormat"));
    *(_DWORD *)buf = 138413058;
    v19 = v8;
    v20 = 2048;
    v21 = v10;
    v22 = 2112;
    v23 = v11;
    v24 = 2112;
    v25 = v12;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "accessory=%@ component=%ld \nupdate=%@ \naccNavFormat=%@", buf, 0x2Au);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController accessory](self, "accessory"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[ACCNavigationInfoBuilder accNavigationLaneGuidanceInfoFrom:](ACCNavigationInfoBuilder, "accNavigationLaneGuidanceInfoFrom:", v4));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
  v17 = v15;
  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v17, 1));
  objc_msgSend(v13, "updateLaneGuidanceInfo:componentList:", v14, v16);

}

- (void)sendLaneGuidance
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableSet *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  char *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  char *v35;
  char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  uint64_t v48;
  void *i;
  void *v50;
  void *v51;
  uint64_t Log;
  NSObject *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  NSMutableArray *v60;
  void *v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  void *v67;
  __int16 v68;
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  _BYTE v74[128];

  v3 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidances](self, "currentACCNavLaneGuidances"));

  if (!v5)
  {
    v6 = objc_opt_new(NSMutableArray);
    -[CarClusterNavigationController setCurrentACCNavLaneGuidances:](self, "setCurrentACCNavLaneGuidances:", v6);

    v7 = objc_opt_new(NSMutableSet);
    -[CarClusterNavigationController setCurrentACCNavLaneGuidanceIndexes:](self, "setCurrentACCNavLaneGuidanceIndexes:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidances](self, "currentACCNavLaneGuidances"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("index")));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidances](self, "currentACCNavLaneGuidances"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "firstObject"));

  v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "index"));
  if (v11)
  {
    v12 = (void *)v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "laneGuidanceCurrentIndex"));

    if (v14)
    {
      while (1)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "index"));
        v16 = objc_msgSend(v15, "unsignedIntegerValue");
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "laneGuidanceCurrentIndex"));
        v19 = objc_msgSend(v18, "unsignedIntegerValue");

        if (v16 == v19)
          break;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "index"));
        -[NSMutableArray addObject:](v3, "addObject:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidances](self, "currentACCNavLaneGuidances"));
        objc_msgSend(v21, "removeObjectAtIndex:", 0);

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidanceIndexes](self, "currentACCNavLaneGuidanceIndexes"));
        v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "index"));
        objc_msgSend(v22, "removeObject:", v23);

        v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidances](self, "currentACCNavLaneGuidances"));
        v25 = objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "firstObject"));

        v10 = (void *)v25;
      }
    }
  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidances](self, "currentACCNavLaneGuidances"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "lastObject"));

  v58 = v27;
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "index"));
  v29 = (char *)objc_msgSend(v28, "unsignedIntegerValue");

  v60 = v3;
  if (-[CarClusterNavigationController smartGuidanceActive](self, "smartGuidanceActive"))
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentRoute](self, "currentRoute"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "composedGuidanceEvents"));

  }
  else
  {
    v31 = 0;
  }
  v32 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
  v33 = objc_msgSend(v32, "laneGuidanceCapacity");

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidances](self, "currentACCNavLaneGuidances"));
  if (objc_msgSend(v34, "count") >= v33)
  {
LABEL_16:

  }
  else
  {
    v35 = v29 + 1;
    while (1)
    {
      v36 = (char *)objc_msgSend(v31, "count");

      if (v36 <= v35)
        break;
      v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectAtIndexedSubscript:", v35));
      v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[CarClusterUpdateLaneGuidance laneGuidanceUpdateWithComposedGuidanceEvent:component:](CarClusterUpdateLaneGuidance, "laneGuidanceUpdateWithComposedGuidanceEvent:component:", v37, v38));

      v40 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v35));
      objc_msgSend(v39, "setIndex:", v40);

      if (v39)
      {
        v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidances](self, "currentACCNavLaneGuidances"));
        objc_msgSend(v41, "addObject:", v39);

        v42 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidanceIndexes](self, "currentACCNavLaneGuidanceIndexes"));
        v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "index"));
        objc_msgSend(v42, "addObject:", v43);

      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidances](self, "currentACCNavLaneGuidances"));
      ++v35;
      if (objc_msgSend(v34, "count") >= v33)
        goto LABEL_16;
    }
  }
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidances](self, "currentACCNavLaneGuidances"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "valueForKey:", CFSTR("index")));

  v64 = 0u;
  v65 = 0u;
  v62 = 0u;
  v63 = 0u;
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavLaneGuidances](self, "currentACCNavLaneGuidances"));
  v46 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
  if (v46)
  {
    v47 = v46;
    v48 = *(_QWORD *)v63;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(_QWORD *)v63 != v48)
          objc_enumerationMutation(v45);
        v50 = *(void **)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v50, "hasBeenSent") & 1) == 0)
        {
          objc_msgSend(v50, "setHasBeenSent:", 1);
          v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "index"));
          -[NSMutableArray addObject:](v4, "addObject:", v51);

          -[CarClusterNavigationController sendLaneGuidanceUpdate:](self, "sendLaneGuidanceUpdate:", v50);
        }
      }
      v47 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v62, v74, 16);
    }
    while (v47);
  }

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "CarCluster");
  v53 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
  {
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "componentsJoinedByString:", CFSTR(", ")));
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v60, "componentsJoinedByString:", CFSTR(", ")));
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "componentsJoinedByString:", CFSTR(", ")));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v4, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)buf = 138413058;
    v67 = v54;
    v68 = 2112;
    v69 = v55;
    v70 = 2112;
    v71 = v56;
    v72 = 2112;
    v73 = v57;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_INFO, "current=[%@] removed=[%@] newCurrent=[%@] sent=[%@]", buf, 0x2Au);

  }
}

- (void)sendManeuvers
{
  NSMutableArray *v3;
  NSMutableArray *v4;
  void *v5;
  NSMutableArray *v6;
  NSMutableDictionary *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  char *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  void *v35;
  char *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  id v48;
  id v49;
  uint64_t v50;
  void *i;
  void *v52;
  void *v53;
  uint64_t Log;
  NSObject *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  NSMutableArray *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  uint8_t buf[4];
  void *v69;
  __int16 v70;
  void *v71;
  __int16 v72;
  void *v73;
  __int16 v74;
  void *v75;
  _BYTE v76[128];

  v3 = objc_opt_new(NSMutableArray);
  v4 = objc_opt_new(NSMutableArray);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavManeuvers](self, "currentACCNavManeuvers"));

  if (!v5)
  {
    v6 = objc_opt_new(NSMutableArray);
    -[CarClusterNavigationController setCurrentACCNavManeuvers:](self, "setCurrentACCNavManeuvers:", v6);

    v7 = objc_opt_new(NSMutableDictionary);
    -[CarClusterNavigationController setIndexedSteps:](self, "setIndexedSteps:", v7);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavManeuvers](self, "currentACCNavManeuvers"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "valueForKey:", CFSTR("index")));

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavManeuvers](self, "currentACCNavManeuvers"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "firstObject"));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  v13 = objc_msgSend(v12, "firstIndex_RouteGuidanceManeuverCurrentList");

  if (v13 != (id)-1)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "index"));
    v15 = objc_msgSend(v14, "unsignedIntegerValue");
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    if (v15 == objc_msgSend(v16, "firstIndex_RouteGuidanceManeuverCurrentList"))
    {
      v17 = v11;
LABEL_8:

      v11 = v17;
    }
    else
    {
      while (1)
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavManeuvers](self, "currentACCNavManeuvers"));
        v19 = objc_msgSend(v18, "count");

        if (!v19)
          break;
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "index"));
        -[NSMutableArray addObject:](v3, "addObject:", v20);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavManeuvers](self, "currentACCNavManeuvers"));
        objc_msgSend(v21, "removeObjectAtIndex:", 0);

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavManeuvers](self, "currentACCNavManeuvers"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "firstObject"));

        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "index"));
        v23 = objc_msgSend(v14, "unsignedIntegerValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
        v11 = v17;
        if (v23 == objc_msgSend(v16, "firstIndex_RouteGuidanceManeuverCurrentList"))
          goto LABEL_8;
      }
    }
  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavManeuvers](self, "currentACCNavManeuvers"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "lastObject"));

  v61 = v25;
  if (v25)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "index"));
    v27 = (char *)objc_msgSend(v26, "unsignedIntegerValue") + 1;
  }
  else
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    v27 = (char *)objc_msgSend(v26, "firstIndex_RouteGuidanceManeuverCurrentList");
  }

  v28 = -[CarClusterNavigationController smartGuidanceActive](self, "smartGuidanceActive");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentRoute](self, "currentRoute"));
  v30 = v29;
  v63 = v3;
  if (v28)
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "composedGuidanceEvents"));
  else
    v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "steps"));
  v32 = (void *)v31;
  v62 = (void *)v9;

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavManeuvers](self, "currentACCNavManeuvers"));
  v34 = objc_msgSend(v33, "count");
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
  if (v34 >= objc_msgSend(v35, "guidanceManeuverCapacity"))
  {
LABEL_23:

  }
  else
  {
    while (1)
    {
      v36 = (char *)objc_msgSend(v32, "count");

      if (v36 <= v27)
        break;
      if (-[CarClusterNavigationController smartGuidanceActive](self, "smartGuidanceActive"))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", v27));
        v38 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentRoute](self, "currentRoute"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "steps"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "objectAtIndexedSubscript:", objc_msgSend(v37, "stepIndex")));

        v41 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[CarClusterUpdateManeuverInfo maneuverUpdateWithGuidanceEvent:routeStep:component:](CarClusterUpdateManeuverInfo, "maneuverUpdateWithGuidanceEvent:routeStep:component:", v37, v40, v41));

        v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v27));
        objc_msgSend(v42, "setIndex:", v43);

        -[CarClusterNavigationController _updateSecondaryManeuversIfNecessaryForGuidanceEvent:maneuver:](self, "_updateSecondaryManeuversIfNecessaryForGuidanceEvent:maneuver:", v37, v42);
      }
      else
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "objectAtIndexedSubscript:", v27));
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(+[CarClusterUpdateManeuverInfo maneuverUpdateWithStep:component:](CarClusterUpdateManeuverInfo, "maneuverUpdateWithStep:component:", v37, v40));
      }

      if (v42)
      {
        v44 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavManeuvers](self, "currentACCNavManeuvers"));
        objc_msgSend(v44, "addObject:", v42);

      }
      ++v27;

      v33 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavManeuvers](self, "currentACCNavManeuvers"));
      v45 = objc_msgSend(v33, "count");
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
      if (v45 >= objc_msgSend(v35, "guidanceManeuverCapacity"))
        goto LABEL_23;
    }
  }
  v46 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavManeuvers](self, "currentACCNavManeuvers"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "valueForKey:", CFSTR("index")));

  v66 = 0u;
  v67 = 0u;
  v64 = 0u;
  v65 = 0u;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavManeuvers](self, "currentACCNavManeuvers"));
  v48 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
  if (v48)
  {
    v49 = v48;
    v50 = *(_QWORD *)v65;
    do
    {
      for (i = 0; i != v49; i = (char *)i + 1)
      {
        if (*(_QWORD *)v65 != v50)
          objc_enumerationMutation(v47);
        v52 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v52, "hasBeenSent", v60, v61) & 1) == 0)
        {
          if (objc_msgSend(v52, "isSecondary"))
          {
            objc_msgSend(v52, "setDistanceBetweenManeuver:", 0);
            objc_msgSend(v52, "setDistanceBetweenManeuverDisplayString:", 0);
            objc_msgSend(v52, "setDistanceBetweenManeuverDisplayUnits:", 0xFFFFLL);
          }
          objc_msgSend(v52, "setHasBeenSent:", 1);
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "index"));
          -[NSMutableArray addObject:](v4, "addObject:", v53);

          -[CarClusterNavigationController sendManeuverUpdate:](self, "sendManeuverUpdate:", v52);
        }
      }
      v49 = objc_msgSend(v47, "countByEnumeratingWithState:objects:count:", &v64, v76, 16);
    }
    while (v49);
  }

  Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "CarCluster");
  v55 = objc_claimAutoreleasedReturnValue(Log);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "componentsJoinedByString:", CFSTR(", ")));
    v57 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v63, "componentsJoinedByString:", CFSTR(", ")));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "componentsJoinedByString:", CFSTR(", ")));
    v59 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray componentsJoinedByString:](v4, "componentsJoinedByString:", CFSTR(", ")));
    *(_DWORD *)buf = 138413058;
    v69 = v56;
    v70 = 2112;
    v71 = v57;
    v72 = 2112;
    v73 = v58;
    v74 = 2112;
    v75 = v59;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_INFO, "current=[%@] removed=[%@] newCurrent=[%@] sent=[%@]", buf, 0x2Au);

  }
}

- (void)_updateSecondaryManeuversIfNecessaryForGuidanceEvent:(id)a3 maneuver:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSMutableArray *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  id v20;

  if (a3 && a4)
  {
    v6 = a4;
    v20 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "stepIndex")));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController indexedSteps](self, "indexedSteps"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v20));

    if (!v8)
    {
      v9 = objc_opt_new(NSMutableArray);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController indexedSteps](self, "indexedSteps"));
      objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v20);

    }
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController indexedSteps](self, "indexedSteps"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "objectForKeyedSubscript:", v20));
    objc_msgSend(v12, "addObject:", v6);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController indexedSteps](self, "indexedSteps"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v20));
    objc_msgSend(v14, "sortUsingComparator:", &stru_1011E1C60);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController indexedSteps](self, "indexedSteps"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectForKeyedSubscript:", v20));
    v17 = objc_msgSend(v16, "count");

    if ((unint64_t)v17 >= 2)
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController indexedSteps](self, "indexedSteps"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKeyedSubscript:", v20));
      objc_msgSend(v19, "enumerateObjectsUsingBlock:", &stru_1011E1CA0);

    }
  }
}

- (int)_roadClassAtLocation:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  int v8;
  int v9;

  v8 = 0;
  v9 = 9;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "routeMatch"));
  v5 = objc_msgSend(v4, "routeCoordinate");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentRoute](self, "currentRoute"));
  objc_msgSend(v6, "getFormOfWay:roadClass:at:", &v8, &v9, v5);

  return v9;
}

- (void)navigationService:(id)a3 willChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned int v12;
  id v13;

  v13 = a3;
  if (MNNavigationServiceStateChangedToNavigating(a4, a5, v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "route"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "route"));
      -[CarClusterNavigationController setCurrentRoute:](self, "setCurrentRoute:", v10);

      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      v12 = objc_msgSend(v11, "routeGuidanceState");

      if (!v12)
        -[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", 3);
      goto LABEL_7;
    }
  }
  if (!a5 && -[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", 0))
LABEL_7:
    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");

}

- (void)navigationService:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;

  v7 = a3;
  switch(a5)
  {
    case 0uLL:
      v12 = v7;
      -[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", 0);
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController etaDisplayFormatter](self, "etaDisplayFormatter"));
      objc_msgSend(v11, "setDelegate:", 0);

      -[CarClusterNavigationController setEtaDisplayFormatter:](self, "setEtaDisplayFormatter:", 0);
      -[CarClusterNavigationController setCurrentRoute:](self, "setCurrentRoute:", 0);
LABEL_8:
      -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
      v7 = v12;
      break;
    case 4uLL:
      v12 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      v9 = v8;
      v10 = 1;
      goto LABEL_7;
    case 5uLL:
      v12 = v7;
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      v9 = v8;
      v10 = 0;
LABEL_7:
      objc_msgSend(v8, "setBeingShownInApp:", v10);

      goto LABEL_8;
  }

}

- (void)navigationService:(id)a3 didFailWithError:(id)a4
{
  if (-[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", 0, a4))
    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
}

- (void)navigationService:(id)a3 didChangeNavigationState:(int)a4
{
  if (-[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", +[CarClusterUpdate _accNavRouteGuidanceStateForGEONavigationState:](CarClusterUpdate, "_accNavRouteGuidanceStateForGEONavigationState:", *(_QWORD *)&a4)))
  {
    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
  }
}

- (void)navigationService:(id)a3 didUpdateMatchedLocation:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;

  v12 = a4;
  if (objc_msgSend(v12, "locationUnreliable"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    objc_msgSend(v5, "setCurrentRoadName:", &stru_1011EB268);

    if (-[CarClusterNavigationController smartGuidanceActive](self, "smartGuidanceActive"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      v7 = v6;
      v8 = 9;
LABEL_6:
      objc_msgSend(v6, "setManeuverRoadClass:", v8);

    }
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "roadName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    objc_msgSend(v10, "setCurrentRoadName:", v9);

    if (-[CarClusterNavigationController smartGuidanceActive](self, "smartGuidanceActive"))
    {
      v11 = -[CarClusterNavigationController _roadClassAtLocation:](self, "_roadClassAtLocation:", v12);
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      v7 = v6;
      v8 = v11;
      goto LABEL_6;
    }
  }
  -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");

}

- (void)navigationService:(id)a3 updateSignsWithInfo:(id)a4
{
  id v5;

  v5 = a4;
  if (-[CarClusterNavigationController smartGuidanceActive](self, "smartGuidanceActive"))
    -[CarClusterNavigationController setLatestSignInfo:](self, "setLatestSignInfo:", v5);

}

- (void)navigationServiceEndGuidanceUpdate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  unsigned int v17;
  NSMutableArray *v18;

  if (!-[CarClusterNavigationController smartGuidanceActive](self, "smartGuidanceActive", a3))
    return;
  v18 = objc_opt_new(NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController latestSignInfo](self, "latestSignInfo"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "primarySign"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController latestSignInfo](self, "latestSignInfo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "primarySign"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v7, "composedGuidanceEventIndex")));
    -[NSMutableArray addObject:](v18, "addObject:", v8);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController latestSignInfo](self, "latestSignInfo"));
  v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "secondarySign"));
  if (!v10)
    goto LABEL_7;
  v11 = (void *)v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
  v13 = objc_msgSend(v12, "guidanceManeuverCapacity");

  if ((unint64_t)v13 >= 2)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController latestSignInfo](self, "latestSignInfo"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "secondarySign"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v14, "composedGuidanceEventIndex")));
    -[NSMutableArray addObject:](v18, "addObject:", v15);

LABEL_7:
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController latestSignInfo](self, "latestSignInfo"));
  objc_msgSend(v16, "primaryDistance_SIRI_USE_ONLY");
  v17 = -[CarClusterNavigationController updateManeuverIndices:distanceToManeuver:](self, "updateManeuverIndices:distanceToManeuver:", v18);

  if (v17)
  {
    -[CarClusterNavigationController sendManeuvers](self, "sendManeuvers");
    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
  }

}

- (void)navigationService:(id)a3 didUpdateProceedToRouteDistance:(double)a4 displayString:(id)a5 closestStepIndex:(unint64_t)a6
{
  unint64_t v7;

  if (a6 <= 1)
    v7 = 0;
  else
    v7 = a6;
  if (-[CarClusterNavigationController updateManeuverIndex:distanceToManeuver:](self, "updateManeuverIndex:distanceToManeuver:", v7, a5, a4))
  {
    -[CarClusterNavigationController sendManeuvers](self, "sendManeuvers");
    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
  }
}

- (void)navigationService:(id)a3 didUpdateDistanceUntilSign:(double)a4 timeUntilSign:(double)a5 forStepIndex:(unint64_t)a6
{
  void *v9;
  unsigned __int8 v10;
  unsigned int v11;

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentRoute](self, "currentRoute", a3, a4, a5));

  if (v9)
  {
    v10 = -[CarClusterNavigationController updateManeuverIndex:distanceToManeuver:](self, "updateManeuverIndex:distanceToManeuver:", a6, a4);
    v11 = -[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", 1);
    if ((v10 & 1) != 0 || v11)
    {
      -[CarClusterNavigationController sendManeuvers](self, "sendManeuvers");
      -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
    }
  }
}

- (void)navigationService:(id)a3 didUpdateDisplayETA:(id)a4 remainingDistance:(id)a5 batteryChargeInfo:(id)a6
{
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  double v15;
  void *v16;
  id v17;

  v17 = a4;
  v9 = a5;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "routeID"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "route"));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueRouteID"));
  v14 = objc_msgSend(v11, "isEqual:", v13);

  if (v14)
  {
    v15 = (double)(unint64_t)objc_msgSend(v17, "displayRemainingMinutesToEndOfLeg") * 60.0;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController etaDisplayFormatter](self, "etaDisplayFormatter"));
    objc_msgSend(v16, "setRemainingTimeToEndOfLeg:", v15);

    objc_msgSend(v9, "distanceRemainingToEndOfLeg");
    if (-[CarClusterNavigationController updateRemainingDistance:](self, "updateRemainingDistance:"))
      -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
  }

}

- (void)navigationService:(id)a3 displayPrimaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8 maneuverStepIndex:(unint64_t)a9 isSynthetic:(BOOL)a10
{
  if (-[CarClusterNavigationController updateManeuverIndex:distanceToManeuver:](self, "updateManeuverIndex:distanceToManeuver:", a9, (double)objc_msgSend(a4, "distance", a3)))
  {
    -[CarClusterNavigationController sendManeuvers](self, "sendManeuvers");
    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
  }
}

- (void)navigationService:(id)a3 displayManeuverAlertForAnnouncementStage:(unint64_t)a4
{
  void *v6;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance", a3));
  objc_msgSend(v6, "updateNavAnnouncementStage:", a4);

  -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
}

- (void)navigationService:(id)a3 displaySecondaryStep:(id)a4 instructions:(id)a5 shieldType:(int)a6 shieldText:(id)a7 drivingSide:(int)a8
{
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  char *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  _QWORD v23[2];

  -[CarClusterNavigationController sendManeuvers](self, "sendManeuvers", a3, a4, a5, *(_QWORD *)&a6, a7, *(_QWORD *)&a8);
  v22 = (id)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "routeGuidanceManeuverCurrentList"));
  if (objc_msgSend(v9, "count") == (id)1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController component](self, "component"));
    v11 = objc_msgSend(v10, "guidanceManeuverCapacity");

    if ((unint64_t)v11 >= 2)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "routeGuidanceManeuverCurrentList"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "firstObject"));
      v15 = (char *)objc_msgSend(v14, "unsignedIntegerValue");

      v16 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "routeGuidanceManeuverCurrentList"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "firstObject"));
      v23[0] = v18;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v15 + 1));
      v23[1] = v19;
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v23, 2));
      v21 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
      objc_msgSend(v21, "setRouteGuidanceManeuverCurrentList:", v20);

      -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
    }
  }
  else
  {

  }
}

- (void)navigationServiceDidHideSecondaryStep:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  -[CarClusterNavigationController sendManeuvers](self, "sendManeuvers", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeGuidanceManeuverCurrentList"));
  v6 = objc_msgSend(v5, "count");

  if (v6 == (id)2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "routeGuidanceManeuverCurrentList"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v12 = v9;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v12, 1));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    objc_msgSend(v11, "setRouteGuidanceManeuverCurrentList:", v10);

    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
  }
}

- (void)navigationService:(id)a3 didArriveAtWaypoint:(id)a4 endOfLegIndex:(unint64_t)a5
{
  void *v7;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "route"));
  LODWORD(a5) = objc_msgSend(v7, "isLegIndexOfLastLeg:", a5);

  if ((_DWORD)a5)
  {
    if (-[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", 2))
      -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
  }
}

- (void)navigationService:(id)a3 showLaneDirections:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController latestLaneGuidanceInfo](self, "latestLaneGuidanceInfo"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "uniqueID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "uniqueID"));
  v8 = +[MNComparison isValue:equalTo:](MNComparison, "isValue:equalTo:", v6, v7);

  if ((v8 & 1) == 0)
  {
    -[CarClusterNavigationController setLatestLaneGuidanceInfo:](self, "setLatestLaneGuidanceInfo:", v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v12, "composedGuidanceEventIndex")));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    objc_msgSend(v10, "setLaneGuidanceCurrentIndex:", v9);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    objc_msgSend(v11, "setLaneGuidanceShowing:", 1);

    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
  }

}

- (void)navigationService:(id)a3 hideLaneDirectionsForId:(id)a4
{
  void *v5;
  void *v6;
  void *v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController latestLaneGuidanceInfo](self, "latestLaneGuidanceInfo", a3, a4));

  if (v5)
  {
    -[CarClusterNavigationController setLatestLaneGuidanceInfo:](self, "setLatestLaneGuidanceInfo:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    objc_msgSend(v6, "setLaneGuidanceCurrentIndex:", 0);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController currentACCNavRouteGuidance](self, "currentACCNavRouteGuidance"));
    objc_msgSend(v7, "setLaneGuidanceShowing:", 0);

    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
  }
}

- (void)navigationServiceWillReroute:(id)a3
{
  if (-[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", 5))
    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
}

- (void)navigationService:(id)a3 didReroute:(id)a4 rerouteReason:(unint64_t)a5
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a4;
  -[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", 0);
  -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
  -[CarClusterNavigationController setCurrentRoute:](self, "setCurrentRoute:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v8 = +[CarClusterUpdate _accNavRouteGuidanceStateForGEONavigationState:](CarClusterUpdate, "_accNavRouteGuidanceStateForGEONavigationState:", objc_msgSend(v7, "navigationState"));

  if (-[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", v8))
    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
}

- (void)navigationServiceDidCancelReroute:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "route"));
  -[CarClusterNavigationController setCurrentRoute:](self, "setCurrentRoute:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MNNavigationService sharedService](MNNavigationService, "sharedService"));
  v6 = +[CarClusterUpdate _accNavRouteGuidanceStateForGEONavigationState:](CarClusterUpdate, "_accNavRouteGuidanceStateForGEONavigationState:", objc_msgSend(v5, "navigationState"));

  if (-[CarClusterNavigationController updateRouteGuidanceState:](self, "updateRouteGuidanceState:", v6))
    -[CarClusterNavigationController sendRouteGuidance](self, "sendRouteGuidance");
}

- (void)etaDisplayFormatter:(id)a3 didUpdateDisplayETA:(id)a4
{
  id v6;

  v6 = a3;
  -[CarClusterNavigationController _updateRemainingTimeIfNeededWithDisplayFormatter:remainingSeconds:](self, "_updateRemainingTimeIfNeededWithDisplayFormatter:remainingSeconds:", v6, (double)(unint64_t)objc_msgSend(a4, "displayRemainingMinutesToEndOfLeg") * 60.0);

}

- (void)_updateRemainingTimeIfNeededWithDisplayFormatter:(id)a3 remainingSeconds:(double)a4
{
  id v6;
  id v7;
  _QWORD block[4];
  id v9[2];
  id location;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[CarClusterNavigationController etaDisplayFormatter](self, "etaDisplayFormatter"));

  if (v7 == v6)
  {
    objc_initWeak(&location, self);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100ACD63C;
    block[3] = &unk_1011B72B0;
    objc_copyWeak(v9, &location);
    v9[1] = *(id *)&a4;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
    objc_destroyWeak(v9);
    objc_destroyWeak(&location);
  }
}

- (ACCNavigationAccessory)accessory
{
  return (ACCNavigationAccessory *)objc_getProperty(self, a2, 8, 1);
}

- (void)setAccessory:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (ACCNavigationAccessoryComponent)component
{
  return (ACCNavigationAccessoryComponent *)objc_getProperty(self, a2, 16, 1);
}

- (void)setComponent:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (GEOComposedRoute)currentRoute
{
  return self->_currentRoute;
}

- (CarClusterUpdateRouteGuidance)currentACCNavRouteGuidance
{
  return (CarClusterUpdateRouteGuidance *)objc_getProperty(self, a2, 32, 1);
}

- (void)setCurrentACCNavRouteGuidance:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSMutableArray)currentACCNavManeuvers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCurrentACCNavManeuvers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)currentACCNavLaneGuidances
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentACCNavLaneGuidances:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableSet)currentACCNavLaneGuidanceIndexes
{
  return (NSMutableSet *)objc_getProperty(self, a2, 56, 1);
}

- (void)setCurrentACCNavLaneGuidanceIndexes:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)indexedSteps
{
  return self->_indexedSteps;
}

- (void)setIndexedSteps:(id)a3
{
  objc_storeStrong((id *)&self->_indexedSteps, a3);
}

- (MNETADisplayFormatter)etaDisplayFormatter
{
  return (MNETADisplayFormatter *)objc_getProperty(self, a2, 72, 1);
}

- (void)setEtaDisplayFormatter:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (MNGuidanceSignInfo)latestSignInfo
{
  return (MNGuidanceSignInfo *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLatestSignInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (MNGuidanceLaneInfo)latestLaneGuidanceInfo
{
  return (MNGuidanceLaneInfo *)objc_getProperty(self, a2, 88, 1);
}

- (void)setLatestLaneGuidanceInfo:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_latestLaneGuidanceInfo, 0);
  objc_storeStrong((id *)&self->_latestSignInfo, 0);
  objc_storeStrong((id *)&self->_etaDisplayFormatter, 0);
  objc_storeStrong((id *)&self->_indexedSteps, 0);
  objc_storeStrong((id *)&self->_currentACCNavLaneGuidanceIndexes, 0);
  objc_storeStrong((id *)&self->_currentACCNavLaneGuidances, 0);
  objc_storeStrong((id *)&self->_currentACCNavManeuvers, 0);
  objc_storeStrong((id *)&self->_currentACCNavRouteGuidance, 0);
  objc_storeStrong((id *)&self->_currentRoute, 0);
  objc_storeStrong((id *)&self->_component, 0);
  objc_storeStrong((id *)&self->_accessory, 0);
}

@end
