@implementation MNNavigationService

- (id)routeId
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "serverRouteID"));

  return v3;
}

- (id)legacyRouteRepresentation
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "zilchDataFromStepIndex:", 0));

  return v3;
}

- (id)originalWaypointRouteRepresentation
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService lastLocation](self, "lastLocation"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "routeMatch"));
  v5 = objc_msgSend(v4, "routeCoordinate");

  if (GEOPolylineCoordinateIsValid(v5))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "geoOriginalWaypointRouteFromRouteCoordinate:purpose:", v5, 0));

    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "data"));
  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (GEOComposedWaypoint)upcomingStop
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService lastLocation](self, "lastLocation"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService lastLocation](self, "lastLocation"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeMatch"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "leg"));
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legs"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
  }
  v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "destination"));

  return (GEOComposedWaypoint *)v8;
}

- (unint64_t)arrivalState
{
  void *v3;
  char *v4;
  void *v5;
  void *v6;
  char *v7;
  void *v8;
  unint64_t v9;
  char *v10;
  BOOL v11;
  unint64_t v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
  v4 = (char *)objc_msgSend(v3, "legIndexForStepIndex:", -[MNNavigationService stepIndex](self, "stepIndex"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "legs"));
  v7 = (char *)objc_msgSend(v6, "count");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService arrivalInfo](self, "arrivalInfo"));
  v9 = (unint64_t)objc_msgSend(v8, "arrivalState");

  if (v9 > 6)
    return 0;
  v10 = v7 - 1;
  if (((1 << v9) & 0x72) != 0)
  {
    v11 = v4 == v10;
    v12 = 4;
  }
  else
  {
    if (((1 << v9) & 0xC) == 0)
      return 1;
    v11 = v4 == v10;
    v12 = 2;
  }
  if (v11)
    return v12 + 1;
  else
    return v12;
}

- (BOOL)isArrivedAtEVCharger
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL8 v12;
  void *v13;
  void *v14;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService arrivalInfo](self, "arrivalInfo"));
  if (((objc_msgSend(v3, "isInArrivalState") & 1) != 0
     || objc_msgSend(v3, "isInParkingState"))
    && (v4 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "legs")),
        v6 = objc_msgSend(v5, "count"),
        v7 = objc_msgSend(v3, "legIndex"),
        v5,
        v4,
        v6 > v7))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "legs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v3, "legIndex")));

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "chargingStationInfo"));
    if (v11)
    {
      LOBYTE(v12) = 1;
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "chargingInfo"));
      v12 = v14 != 0;

    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (GEOComposedRouteEVChargingStationInfo)arrivalChargingStationInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;

  if (-[MNNavigationService isArrivedAtEVCharger](self, "isArrivedAtEVCharger"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService arrivalInfo](self, "arrivalInfo"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "destination"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "legs"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v3, "legIndex")));

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "waypointDisplayInfoForWaypoint:", v4));

    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chargingStationInfo"));
    if (v10)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "evChargingInfo"));
      v12 = v11;
      if (v11)
        v13 = v11;
      else
        v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "chargingStationInfo"));
      v14 = v13;

    }
    else
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "chargingInfo"));
    }

  }
  else
  {
    v14 = 0;
  }
  return (GEOComposedRouteEVChargingStationInfo *)v14;
}

- (GEOComposedWaypoint)stopAfterCharging
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService arrivalInfo](self, "arrivalInfo"));
  v4 = objc_msgSend(v3, "legIndex");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "legs"));
  v7 = objc_msgSend(v6, "count");

  if (v4 >= v7)
  {
    v12 = 0;
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "legs"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService arrivalInfo](self, "arrivalInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", (char *)objc_msgSend(v10, "legIndex") + 1));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "destination"));

  }
  return (GEOComposedWaypoint *)v12;
}

- (void)setVoiceGuidanceEnabled:(BOOL)a3
{
  _BOOL4 v3;
  AudioPreferences *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  AudioPreferences *v9;

  v3 = a3;
  v5 = [AudioPreferences alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v9 = -[AudioPreferences initWithDefaults:](v5, "initWithDefaults:", v6);

  if (v3)
    v7 = 2;
  else
    v7 = 0;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
  -[AudioPreferences setGuidanceLevel:forTransportType:](v9, "setGuidanceLevel:forTransportType:", v7, objc_msgSend(v8, "transportType"));

  -[AudioPreferences synchronize](v9, "synchronize");
}

- (id)etaFilterData
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "routeAttributes"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[GEOMapService sharedService](GEOMapService, "sharedService"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "serializedETAFilterForSiriWithRouteAttributes:", v3));

  return v5;
}

- (id)incidentsOnRouteData
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "traffic"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeIncidents"));

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "incident"));

        if (v12)
        {
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "incident"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "data"));
          objc_msgSend(v3, "addObject:", v14);

        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  return v3;
}

- (id)incidentsOnRouteOffsets
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService lastLocation](self, "lastLocation"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeMatch"));
  v6 = objc_msgSend(v5, "routeCoordinate");

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route", 0));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "traffic"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeIncidents"));

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "incident"));

        if (v15)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(-[MNNavigationService route](self, "route"));
          objc_msgSend(v16, "distanceBetweenRouteCoordinate:andRouteCoordinate:", v6, objc_msgSend(v14, "routeCoordinate"));
          v18 = v17;

          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v18));
          objc_msgSend(v3, "addObject:", v19);

        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v11);
  }

  return v3;
}

- (int64_t)effectiveNavigationType
{
  if (-[MNNavigationService isInNavigatingState](self, "isInNavigatingState"))
    return (int64_t)-[MNNavigationService navigationType](self, "navigationType");
  else
    return (int64_t)-[MNNavigationService desiredNavigationType](self, "desiredNavigationType");
}

- (int)effectiveTransportType
{
  if (-[MNNavigationService isInNavigatingState](self, "isInNavigatingState"))
    return -[MNNavigationService navigationTransportType](self, "navigationTransportType");
  else
    return -[MNNavigationService desiredTransportType](self, "desiredTransportType");
}

@end
