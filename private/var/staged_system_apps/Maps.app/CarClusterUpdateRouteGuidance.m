@implementation CarClusterUpdateRouteGuidance

- (CarClusterUpdateRouteGuidance)init
{
  CarClusterUpdateRouteGuidance *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CarClusterUpdateRouteGuidance;
  result = -[CarClusterUpdateRouteGuidance init](&v3, "init");
  if (result)
  {
    result->_smartGuidanceActive = 1;
    result->_routeGuidanceState = -1;
    result->_maneuverState = -1;
    result->_distanceRemainingDisplayUnits = -1;
    result->_distanceRemainingToNextManeuverDisplayUnits = -1;
    result->_beingShownInApp = 1;
    result->_maneuverRoadClass = 9;
    result->_laneGuidanceShowing = 0;
    result->_sourceSupportsRouteGuidance = 1;
  }
  return result;
}

- (void)updateRemainingTime:(double)a3 estimatedTimeOfArrival:(double)a4
{
  void *v6;
  id v7;

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a3));
  -[CarClusterUpdateRouteGuidance setTimeRemainingToDestination:](self, "setTimeRemainingToDestination:", v6);

  v7 = (id)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", a4));
  -[CarClusterUpdateRouteGuidance setEstimatedTimeOfArrival:](self, "setEstimatedTimeOfArrival:", v7);

}

- (void)updateRemainingDistance:(double)a3
{
  void *v5;
  id v6;
  id v7;
  unsigned __int16 v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  -[CarClusterUpdateRouteGuidance setDistanceRemaining:](self, "setDistanceRemaining:", v5);

  v8 = 0;
  v7 = 0;
  +[CarClusterUpdate getStringValue:displayUnits:forRemainingDistance:](CarClusterUpdateRouteGuidance, "getStringValue:displayUnits:forRemainingDistance:", &v7, &v8, a3);
  v6 = v7;
  -[CarClusterUpdateRouteGuidance setDistanceRemainingDisplayString:](self, "setDistanceRemainingDisplayString:", v6);
  -[CarClusterUpdateRouteGuidance setDistanceRemainingDisplayUnits:](self, "setDistanceRemainingDisplayUnits:", v8);

}

- (void)updateNavAnnouncementStage:(unint64_t)a3
{
  -[CarClusterUpdateRouteGuidance setManeuverState:](self, "setManeuverState:", +[CarClusterUpdate _accNavManeuverStateForGEONavigationAnnouncementStage:](CarClusterUpdate, "_accNavManeuverStateForGEONavigationAnnouncementStage:", a3));
}

- (unint64_t)firstIndex_RouteGuidanceManeuverCurrentList
{
  void *v2;
  void *v3;
  unint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterUpdateRouteGuidance routeGuidanceManeuverCurrentList](self, "routeGuidanceManeuverCurrentList"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "firstObject"));

  if (v3)
    v4 = (unint64_t)objc_msgSend(v3, "unsignedIntegerValue");
  else
    v4 = -1;

  return v4;
}

- (void)setManeuverRoadClass:(int)a3
{
  if (self->_maneuverRoadClass != a3)
    self->_maneuverRoadClass = a3;
}

- (void)setRouteGuidanceState:(unsigned __int16)a3
{
  void *v5;
  void *v6;

  if (self->_routeGuidanceState != a3)
  {
    if (a3)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("Apple Maps [iAP Metadata]"), CFSTR("localized string not found"), 0));
      -[CarClusterUpdateRouteGuidance setSourceName:](self, "setSourceName:", v6);

    }
    else
    {
      -[CarClusterUpdate resetProperties](self, "resetProperties");
    }
    self->_routeGuidanceState = a3;
  }
}

- (void)setCurrentRoadName:(id)a3
{
  NSString *v4;
  NSString *currentRoadName;

  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));
  currentRoadName = self->_currentRoadName;
  self->_currentRoadName = v4;

}

- (void)setDestinationName:(id)a3
{
  NSString *v4;
  NSString *destinationName;

  v4 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" ")));
  destinationName = self->_destinationName;
  self->_destinationName = v4;

}

- (void)setDistanceRemaining:(id)a3
{
  NSNumber *v4;
  NSNumber *distanceRemaining;

  v4 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "integerValue")));
  distanceRemaining = self->_distanceRemaining;
  self->_distanceRemaining = v4;

}

- (unint64_t)_accNavUnitType
{
  unsigned __int16 v2;

  v2 = -[CarClusterUpdateRouteGuidance distanceRemainingToNextManeuverDisplayUnits](self, "distanceRemainingToNextManeuverDisplayUnits")- 1;
  if (v2 > 3u)
    return 1;
  else
    return qword_100E39750[(__int16)v2];
}

- (unint64_t)_accNavManeuverRoadClass
{
  unsigned int v2;

  v2 = -[CarClusterUpdateRouteGuidance maneuverRoadClass](self, "maneuverRoadClass") - 2;
  if (v2 > 6)
    return 0;
  else
    return qword_100E39770[v2];
}

- (void)_updateManeuverState
{
  void *v3;
  unint64_t v4;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  void *i;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t Log;
  NSObject *v22;
  unint64_t v23;
  unint64_t v24;
  id obj;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  unint64_t v31;
  __int16 v32;
  unint64_t v33;
  __int16 v34;
  uint64_t v35;
  _BYTE v36[128];

  if (-[CarClusterUpdateRouteGuidance smartGuidanceActive](self, "smartGuidanceActive"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterUpdateRouteGuidance distanceRemainingToNextManeuver](self, "distanceRemainingToNextManeuver"));

    if (v3)
    {
      if (qword_1014D2B40 != -1)
        dispatch_once(&qword_1014D2B40, &stru_1011BDFA8);
      v4 = -[CarClusterUpdateRouteGuidance _accNavManeuverRoadClass](self, "_accNavManeuverRoadClass");
      v5 = -[CarClusterUpdateRouteGuidance _accNavUnitType](self, "_accNavUnitType");
      v6 = (void *)qword_1014D2B38;
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v4));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v7));
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", v5));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v9));

      v28 = 0u;
      v29 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "allKeys"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "sortedArrayUsingSelector:", "compare:"));

      obj = v12;
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
      if (v13)
      {
        v23 = v5;
        v24 = v4;
        v14 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v13; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v14)
              objc_enumerationMutation(obj);
            v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i);
            v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v16));
            v18 = (void *)objc_claimAutoreleasedReturnValue(-[CarClusterUpdateRouteGuidance distanceRemainingToNextManeuver](self, "distanceRemainingToNextManeuver"));
            v19 = objc_msgSend(v18, "integerValue");
            v20 = objc_msgSend(v17, "integerValue");

            if ((uint64_t)v19 >= (uint64_t)v20)
            {
              LOWORD(v13) = (unsigned __int16)objc_msgSend(v16, "integerValue");

              goto LABEL_15;
            }

          }
          v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v26, v36, 16);
          if (v13)
            continue;
          break;
        }
LABEL_15:
        v5 = v23;
        v4 = v24;
      }

      Log = GEOFindOrCreateLog(DefaultLoggingSubsystem, "CarCluster");
      v22 = objc_claimAutoreleasedReturnValue(Log);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 134218496;
        v31 = v4;
        v32 = 2048;
        v33 = v5;
        v34 = 2048;
        v35 = (unsigned __int16)v13;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "roadClass=%lu unitType=%lu maneuverState=%lu", buf, 0x20u);
      }

      -[CarClusterUpdateRouteGuidance setManeuverState:](self, "setManeuverState:", (unsigned __int16)v13);
    }
    else
    {
      -[CarClusterUpdateRouteGuidance setManeuverState:](self, "setManeuverState:", 0xFFFFLL);
    }
  }
}

- (void)setDistanceRemainingToNextManeuver:(id)a3
{
  NSNumber *v4;
  NSNumber *distanceRemainingToNextManeuver;

  if (a3)
  {
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", objc_msgSend(a3, "integerValue")));
    distanceRemainingToNextManeuver = self->_distanceRemainingToNextManeuver;
    self->_distanceRemainingToNextManeuver = v4;
  }
  else
  {
    distanceRemainingToNextManeuver = self->_distanceRemainingToNextManeuver;
    self->_distanceRemainingToNextManeuver = 0;
  }

  -[CarClusterUpdateRouteGuidance _updateManeuverState](self, "_updateManeuverState");
}

- (void)setLaneGuidanceCurrentIndex:(id)a3
{
  NSNumber *v4;

  if (a3)
  {
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "unsignedIntegerValue")));
    self->_laneGuidanceCurrentIndex = v4;

  }
  else
  {
    self->_laneGuidanceCurrentIndex = 0;
  }
}

- (void)setLaneGuidanceTotalCount:(id)a3
{
  NSNumber *v4;

  if (a3)
  {
    v4 = (NSNumber *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a3, "unsignedIntegerValue")));
    self->_laneGuidanceTotalCount = v4;

  }
  else
  {
    self->_laneGuidanceTotalCount = 0;
  }
}

+ (id)_enumProperties
{
  if (qword_1014D2B48 != -1)
    dispatch_once(&qword_1014D2B48, &stru_1011BDFC8);
  return (id)qword_1014D2B50;
}

+ (id)_integersKeyed
{
  if (qword_1014D2B58 != -1)
    dispatch_once(&qword_1014D2B58, &stru_1011BDFE8);
  return (id)qword_1014D2B60;
}

- (BOOL)smartGuidanceActive
{
  return self->_smartGuidanceActive;
}

- (void)setSmartGuidanceActive:(BOOL)a3
{
  self->_smartGuidanceActive = a3;
}

- (int)maneuverRoadClass
{
  return self->_maneuverRoadClass;
}

- (unsigned)routeGuidanceState
{
  return self->_routeGuidanceState;
}

- (unsigned)maneuverState
{
  return self->_maneuverState;
}

- (void)setManeuverState:(unsigned __int16)a3
{
  self->_maneuverState = a3;
}

- (NSString)currentRoadName
{
  return self->_currentRoadName;
}

- (NSString)destinationName
{
  return self->_destinationName;
}

- (NSNumber)estimatedTimeOfArrival
{
  return (NSNumber *)objc_getProperty(self, a2, 56, 1);
}

- (void)setEstimatedTimeOfArrival:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 56);
}

- (NSNumber)timeRemainingToDestination
{
  return (NSNumber *)objc_getProperty(self, a2, 64, 1);
}

- (void)setTimeRemainingToDestination:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 64);
}

- (NSNumber)distanceRemaining
{
  return self->_distanceRemaining;
}

- (NSString)distanceRemainingDisplayString
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (void)setDistanceRemainingDisplayString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 80);
}

- (unsigned)distanceRemainingDisplayUnits
{
  return self->_distanceRemainingDisplayUnits;
}

- (void)setDistanceRemainingDisplayUnits:(unsigned __int16)a3
{
  self->_distanceRemainingDisplayUnits = a3;
}

- (NSNumber)distanceRemainingToNextManeuver
{
  return self->_distanceRemainingToNextManeuver;
}

- (NSString)distanceRemainingToNextManeuverDisplayString
{
  return (NSString *)objc_getProperty(self, a2, 96, 1);
}

- (void)setDistanceRemainingToNextManeuverDisplayString:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 96);
}

- (unsigned)distanceRemainingToNextManeuverDisplayUnits
{
  return self->_distanceRemainingToNextManeuverDisplayUnits;
}

- (void)setDistanceRemainingToNextManeuverDisplayUnits:(unsigned __int16)a3
{
  self->_distanceRemainingToNextManeuverDisplayUnits = a3;
}

- (NSArray)routeGuidanceManeuverCurrentList
{
  return (NSArray *)objc_getProperty(self, a2, 104, 1);
}

- (void)setRouteGuidanceManeuverCurrentList:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 104);
}

- (NSNumber)routeGuidanceManeuverCount
{
  return (NSNumber *)objc_getProperty(self, a2, 112, 1);
}

- (void)setRouteGuidanceManeuverCount:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 112);
}

- (BOOL)beingShownInApp
{
  return self->_beingShownInApp;
}

- (void)setBeingShownInApp:(BOOL)a3
{
  self->_beingShownInApp = a3;
}

- (NSNumber)laneGuidanceCurrentIndex
{
  return self->_laneGuidanceCurrentIndex;
}

- (NSNumber)laneGuidanceTotalCount
{
  return self->_laneGuidanceTotalCount;
}

- (BOOL)laneGuidanceShowing
{
  return self->_laneGuidanceShowing;
}

- (void)setLaneGuidanceShowing:(BOOL)a3
{
  self->_laneGuidanceShowing = a3;
}

- (NSString)sourceName
{
  return self->_sourceName;
}

- (void)setSourceName:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 136);
}

- (BOOL)sourceSupportsRouteGuidance
{
  return self->_sourceSupportsRouteGuidance;
}

- (NSNumber)destinationTimeZoneOffsetMinutes
{
  return self->_destinationTimeZoneOffsetMinutes;
}

- (void)setDestinationTimeZoneOffsetMinutes:(id)a3
{
  objc_storeStrong((id *)&self->_destinationTimeZoneOffsetMinutes, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_destinationTimeZoneOffsetMinutes, 0);
  objc_storeStrong((id *)&self->_sourceName, 0);
  objc_storeStrong((id *)&self->_routeGuidanceManeuverCount, 0);
  objc_storeStrong((id *)&self->_routeGuidanceManeuverCurrentList, 0);
  objc_storeStrong((id *)&self->_distanceRemainingToNextManeuverDisplayString, 0);
  objc_storeStrong((id *)&self->_distanceRemainingToNextManeuver, 0);
  objc_storeStrong((id *)&self->_distanceRemainingDisplayString, 0);
  objc_storeStrong((id *)&self->_distanceRemaining, 0);
  objc_storeStrong((id *)&self->_timeRemainingToDestination, 0);
  objc_storeStrong((id *)&self->_estimatedTimeOfArrival, 0);
  objc_storeStrong((id *)&self->_destinationName, 0);
  objc_storeStrong((id *)&self->_currentRoadName, 0);
}

@end
