@implementation MNNavigationService

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

@end
