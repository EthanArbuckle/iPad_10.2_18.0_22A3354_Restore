@implementation CLDurianCommuteMetricManager

- (void)checkNearOrAtHome:(CLLocationCoordinate2D)a3 horizontalAccuracy:(double)a4
{
  double v6;
  uint64_t v7;
  _BOOL4 nearOrAtHome;
  const char *v9;
  NSObject *v10;
  uint32_t v11;
  uint64_t v12;
  CLLocationCoordinate2D v13;
  uint8_t buf[4];
  int v15;
  __int16 v16;
  const char *v17;
  __int16 v18;
  _BOOL4 v19;
  __int16 v20;
  CLLocationDegrees latitude;
  __int16 v22;
  CLLocationDegrees longitude;
  __int16 v24;
  double v25;
  __int16 v26;
  double v27;

  v13 = a3;
  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (CLLocationCoordinate2DIsValid(self->_homeLocation))
  {
    v6 = CLLocationCoordinate2DGetDistanceFrom(&v13, &self->_homeLocation) - a4;
    self->_nearOrAtHome = v6 < 250.0;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      nearOrAtHome = self->_nearOrAtHome;
      *(_DWORD *)buf = 68290307;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v18 = 1025;
      v19 = nearOrAtHome;
      v20 = 2049;
      latitude = v13.latitude;
      v22 = 2049;
      longitude = v13.longitude;
      v24 = 2049;
      v25 = a4;
      v26 = 2049;
      v27 = v6;
      v9 = "{\"msg%{public}.0s\":\"#rwl, _nearOrAtHome\", \"_nearOrAtHome\":%{private}hhd, \"loc.lat\":\"%{private}f\", \"
           "loc.lon\":\"%{private}f\", \"loc.hacc\":\"%{private}f\", \"distance\":\"%{private}f\"}";
      v10 = v7;
      v11 = 64;
LABEL_10:
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, v9, buf, v11);
    }
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v12 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 68289026;
      v15 = 0;
      v16 = 2082;
      v17 = "";
      v9 = "{\"msg%{public}.0s\":\"#rwl, _nearOrAtHome, Home location is unknown.\"}";
      v10 = v12;
      v11 = 18;
      goto LABEL_10;
    }
  }
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;

  -[CLIntersiloUniverse silo](self->_universe, "silo", a3);
  objc_msgSend(objc_msgSend(a4, "lastObject"), "coordinate");
  v7 = v6;
  v9 = v8;
  objc_msgSend(objc_msgSend(a4, "lastObject"), "horizontalAccuracy");
  -[CLDurianCommuteMetricManager checkNearOrAtHome:horizontalAccuracy:](self, "checkNearOrAtHome:horizontalAccuracy:", v7, v9, v10);
}

- (CLDurianCommuteMetricManager)init
{
  -[CLDurianCommuteMetricManager doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);
  return 0;
}

- (id)initInUniverse:(id)a3
{
  CLDurianCommuteMetricManager *v4;
  NSObject *v5;
  objc_super v7;
  uint8_t buf[8];
  _WORD v9[5];

  v7.receiver = self;
  v7.super_class = (Class)CLDurianCommuteMetricManager;
  v4 = -[CLDurianCommuteMetricManager init](&v7, "init");
  if (v4)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v9[0] = 2082;
      *(_QWORD *)&v9[1] = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, init CLCommuteMetricManager\"}", buf, 0x12u);
    }
    v4->_universe = (CLIntersiloUniverse *)a3;
    v4->_beaconManager = (SPBeaconManager *)objc_alloc_init((Class)SPBeaconManager);
    operator new();
  }
  return 0;
}

- (void)onDataProtectionNotification:(int)a3 data:(uint64_t)a4
{
  NSObject *v7;
  int v8;
  NSObject *v9;
  int v10;
  int v11;
  __int16 v12;
  const char *v13;
  __int16 v14;
  int v15;
  __int16 v16;
  _BOOL4 v17;

  objc_msgSend(*(id *)(a1 + 8), "silo");
  if (a3 == 1)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      v10 = 68289282;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 1026;
      v15 = BYTE4(a4) & 1;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, device unlocked since boot\", \"deviceUnlockedSinceBoot\":%{public}hhd}", (uint8_t *)&v10, 0x18u);
    }
  }
  else if (!a3)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      v8 = *(unsigned __int8 *)(a1 + 137);
      v10 = 68289538;
      v11 = 0;
      v12 = 2082;
      v13 = "";
      v14 = 1026;
      v15 = v8;
      v16 = 1026;
      v17 = a4 == 1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, data availability\", \"statsLoaded\":%{public}hhd, \"dataAvailability\":%{public}hhd}", (uint8_t *)&v10, 0x1Eu);
    }
    if (!*(_BYTE *)(a1 + 137) && (_DWORD)a4 == 1)
      objc_msgSend((id)a1, "loadStats");
  }
}

- (BOOL)isDataCollectionAuthorized
{
  unsigned int v2;
  uint64_t v3;
  signed int v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  int v11;
  int v12;
  __int16 v13;
  const char *v14;
  __int16 v15;
  uint64_t v16;

  v2 = +[CLLocationManager authorizationStatusForBundlePath:](CLLocationManager, "authorizationStatusForBundlePath:", CFSTR("/System/Library/LocationBundles/FindMyDevice.framework/"));
  if (v2 != 3)
  {
    v4 = v2;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v5 = qword_1022A0038;
    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
      return 0;
    v11 = 68289283;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v15 = 2049;
    v16 = v4;
    v6 = "{\"msg%{public}.0s\":\"#rwl, location authorization status\", \"authorizationStatus\":%{private}ld}";
    v7 = v5;
    v8 = 28;
    goto LABEL_12;
  }
  if (objc_opt_class(MCProfileConnection, v3))
    return _objc_msgSend(+[MCProfileConnection sharedConnection](MCProfileConnection, "sharedConnection"), "isDiagnosticSubmissionAllowed");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
  v9 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    v11 = 68289026;
    v12 = 0;
    v13 = 2082;
    v14 = "";
    v6 = "{\"msg%{public}.0s\":\"#rwl, sendMetrics, skip metric submission. MCProfileConnection is not supported.\"}";
    v7 = v9;
    v8 = 18;
LABEL_12:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, v6, (uint8_t *)&v11, v8);
  }
  return 0;
}

- (void)loadStats
{
  int v3;
  NSObject *v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  __int128 v8;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (!self->_statsLoaded)
  {
    v3 = (*(uint64_t (**)(void *))(*(_QWORD *)self->_metricCache + 936))(self->_metricCache);
    self->_statsLoaded = 1;
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v4 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      v7 = 68289282;
      LOWORD(v8) = 2082;
      *(_QWORD *)((char *)&v8 + 2) = "";
      WORD5(v8) = 1026;
      HIDWORD(v8) = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, loadStats, load existing stats\", \"result\":%{public}hhd}", (uint8_t *)&v7, 0x18u);
    }
    if (-[CLDurianCommuteMetricManager lookupStatsWithDate:stats:](self, "lookupStatsWithDate:stats:", -[CLDurianCommuteStats startDate](self->_stats, "startDate"), self->_stats))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
      v5 = qword_1022A0038;
      if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      v7 = 68289026;
      LOWORD(v8) = 2082;
      *(_QWORD *)((char *)&v8 + 2) = "";
      v6 = "{\"msg%{public}.0s\":\"#rwl, loadStats, load existing stats\"}";
    }
    else
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
      v5 = qword_1022A0038;
      if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
        goto LABEL_16;
      v7 = 68289026;
      LOWORD(v8) = 2082;
      *(_QWORD *)((char *)&v8 + 2) = "";
      v6 = "{\"msg%{public}.0s\":\"#rwl, loadStats, init a new stats\"}";
    }
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v7, 0x12u);
LABEL_16:
    -[CLDurianCommuteMetricManager printCurrentStats](self, "printCurrentStats", v7, v8);
  }
}

- (void)dealloc
{
  void *metricCache;
  objc_super v4;

  -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");

  metricCache = self->_metricCache;
  if (metricCache)
    (*(void (**)(void *))(*(_QWORD *)metricCache + 8))(metricCache);
  self->_metricCache = 0;
  v4.receiver = self;
  v4.super_class = (Class)CLDurianCommuteMetricManager;
  -[CLDurianCommuteMetricManager dealloc](&v4, "dealloc");
}

- (void)cleanup
{
  NSObject *v3;
  NSObject *v4;
  int v5;
  int v6;
  __int16 v7;
  const char *v8;

  if (((*(uint64_t (**)(void *, SEL))(*(_QWORD *)self->_metricCache + 944))(self->_metricCache, a2) & 1) == 0)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#rwl Could not store metric cache\"}", (uint8_t *)&v5, 0x12u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    }
    v4 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      v5 = 68289026;
      v6 = 0;
      v7 = 2082;
      v8 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v4, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#rwl Could not store metric cache", "{\"msg%{public}.0s\":\"#rwl Could not store metric cache\"}", (uint8_t *)&v5, 0x12u);
    }
  }
  -[CLRoutineMonitorServiceProtocol stopLeechingVisitsForClient:](self->_routineMonitor, "stopLeechingVisitsForClient:", self);
  -[CLDurianCommuteMetricManager setValid:](self, "setValid:", 0);
}

- (void)printCurrentStats
{
  id v3;
  NSMutableSet *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  NSObject *v15;
  uint64_t state;
  NSDate *v17;
  NSDate *v18;
  int64_t v19;
  id v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  int v31;
  __int16 v32;
  const char *v33;
  __int16 v34;
  uint64_t v35;
  __int16 v36;
  NSDate *v37;
  __int16 v38;
  NSDate *v39;
  __int16 v40;
  int64_t v41;
  __int16 v42;
  id v43;
  __int16 v44;
  id v45;
  _BYTE v46[128];
  _BYTE v47[128];

  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    v3 = +[NSMutableString string](NSMutableString, "string");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v4 = -[CLDurianCommuteStats carryingItems](self->_stats, "carryingItems");
    v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v47, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v7)
            objc_enumerationMutation(v4);
          objc_msgSend(v3, "appendFormat:", CFSTR("(%@)"), objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "UUIDString"));
        }
        v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v26, v47, 16);
      }
      while (v6);
    }
    v9 = +[NSMutableString string](NSMutableString, "string");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v10 = -[NSMutableDictionary keyEnumerator](-[CLDurianCommuteStats itemJourneyStats](self->_stats, "itemJourneyStats"), "keyEnumerator");
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v46, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(_QWORD *)v23 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(v9, "appendFormat:", CFSTR("(%@:%ld)"), objc_msgSend(*(id *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j), "UUIDString"), objc_msgSend(-[NSMutableDictionary objectForKey:](-[CLDurianCommuteStats itemJourneyStats](self->_stats, "itemJourneyStats"), "objectForKey:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)j)), "journeyCount"));
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v22, v46, 16);
      }
      while (v12);
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v15 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      state = self->_state;
      v17 = -[CLDurianCommuteStats startDate](self->_stats, "startDate");
      v18 = -[CLDurianCommuteStats endDate](self->_stats, "endDate");
      v19 = -[CLDurianCommuteStats deviceJourneyCount](self->_stats, "deviceJourneyCount");
      v20 = objc_msgSend(v3, "UTF8String");
      v21 = objc_msgSend(v9, "UTF8String");
      *(_DWORD *)buf = 68290563;
      v31 = 0;
      v32 = 2082;
      v33 = "";
      v34 = 2049;
      v35 = state;
      v36 = 2114;
      v37 = v17;
      v38 = 2114;
      v39 = v18;
      v40 = 2049;
      v41 = v19;
      v42 = 2081;
      v43 = v20;
      v44 = 2081;
      v45 = v21;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, current stats\", \"state\":%{private}ld, \"startDate\":%{public, location:escape_only}@, \"endDate\":%{public, location:escape_only}@, \"journeyCount\":%{private}ld, \"carryingItems\":%{private, location:escape_only}s, \"items.journeyCounts\":%{private, location:escape_only}s}", buf, 0x4Eu);
    }
  }
}

- (void)resetStats
{
  self->_state = 0;
  -[CLDurianCommuteStats removeAllCarryingItems](self->_stats, "removeAllCarryingItems");
}

- (void)transitionWithEvent:(int)a3
{
  NSObject *v5;
  uint64_t state;
  NSDate *v7;
  unsigned int v8;
  CLDurianCommuteStats *stats;
  int v10;
  int v11;
  double v12;
  NSObject *v13;
  uint64_t minimumTravelTimeInterval;
  NSObject *v15;
  uint64_t v16;
  int v17;
  int v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  _BYTE v24[10];

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    state = self->_state;
    v17 = 68289795;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2049;
    v22 = state;
    v23 = 1025;
    *(_DWORD *)v24 = a3;
    *(_WORD *)&v24[4] = 1025;
    *(_DWORD *)&v24[6] = -[CLDurianCommuteMetricManager valid](self, "valid");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, fsm event\", \"state\":%{private}ld, \"event\":%{private}d, \"valid\":%{private}hhd}", (uint8_t *)&v17, 0x28u);
  }
  if (!-[CLDurianCommuteMetricManager isDataCollectionAuthorized](self, "isDataCollectionAuthorized"))
  {
    -[CLDurianCommuteMetricManager resetStats](self, "resetStats");
    return;
  }
  if (a3 != 3)
  {
    if (a3 != 2)
    {
      if (a3 == 1)
      {
        v7 = +[NSDate date](NSDate, "date");
        self->_state = 2;
        v8 = -[CLDurianCommuteStats containsDate:](self->_stats, "containsDate:", v7);
        stats = self->_stats;
        if (v8)
        {
          -[CLDurianCommuteStats removeAllCarryingItems](stats, "removeAllCarryingItems");
        }
        else
        {
          -[CLDurianCommuteStats resetWithDate:](stats, "resetWithDate:", v7);
          -[CLDurianCommuteMetricManager pruneOldStats](self, "pruneOldStats");
        }
        self->_lastTravelTime = CFAbsoluteTimeGetCurrent();
      }
      goto LABEL_27;
    }
    v11 = self->_state;
    if (v11 == 3)
    {
      v12 = CFAbsoluteTimeGetCurrent() - self->_lastTravelTime;
      if (v12 <= self->_minimumTravelTimeInterval)
      {
        -[CLDurianCommuteStats removeAllCarryingItems](self->_stats, "removeAllCarryingItems");
        if (qword_1022A0030 != -1)
          dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
        v13 = qword_1022A0038;
        if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
        {
          minimumTravelTimeInterval = (uint64_t)self->_minimumTravelTimeInterval;
          v17 = 68289539;
          v18 = 0;
          v19 = 2082;
          v20 = "";
          v21 = 2049;
          v22 = (uint64_t)v12;
          v23 = 2049;
          *(_QWORD *)v24 = minimumTravelTimeInterval;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, fsm travel time is too short.\", \"interval\":%{private}ld, \"threshold\":%{private}ld}", (uint8_t *)&v17, 0x26u);
        }
      }
      else
      {
        -[CLDurianCommuteMetricManager _completeJourney](self, "_completeJourney");
      }
    }
    else if (v11 == 2)
    {
      -[CLDurianCommuteStats removeAllCarryingItems](self->_stats, "removeAllCarryingItems");
    }
    v10 = 1;
    goto LABEL_26;
  }
  if (self->_state == 2)
  {
    v10 = 3;
LABEL_26:
    self->_state = v10;
  }
LABEL_27:
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
  v15 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    v16 = self->_state;
    v17 = 68289283;
    v18 = 0;
    v19 = 2082;
    v20 = "";
    v21 = 2049;
    v22 = v16;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, fsm processed\", \"state\":%{private}ld}", (uint8_t *)&v17, 0x1Cu);
  }
  -[CLDurianCommuteMetricManager printCurrentStats](self, "printCurrentStats");
}

- (void)observeDevice:(id)a3
{
  NSObject *v5;
  uint64_t state;
  _DWORD v7[2];
  __int16 v8;
  const char *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  id v13;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    state = self->_state;
    v7[0] = 68289539;
    v7[1] = 0;
    v8 = 2082;
    v9 = "";
    v10 = 2049;
    v11 = state;
    v12 = 2113;
    v13 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, fsm observe device\", \"state\":%{private}ld, \"deviceID\":%{private, location:escape_only}@}", (uint8_t *)v7, 0x26u);
  }
  if ((self->_state & 0xFFFFFFFE) == 2)
    -[CLDurianCommuteStats addCarryingItem:](self->_stats, "addCarryingItem:", a3);
  -[CLDurianCommuteMetricManager printCurrentStats](self, "printCurrentStats");
}

- (void)_completeJourney
{
  NSObject *v3;
  _DWORD v4[2];
  __int16 v5;
  const char *v6;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
  v3 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
  {
    v4[0] = 68289026;
    v4[1] = 0;
    v5 = 2082;
    v6 = "";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, fsm complete journey\"}", (uint8_t *)v4, 0x12u);
  }
  -[CLDurianCommuteStats completeJourney](self->_stats, "completeJourney");
  -[CLDurianCommuteMetricManager saveStats:](self, "saveStats:", self->_stats);
  -[CLDurianCommuteMetricManager printCurrentStats](self, "printCurrentStats");
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  NSObject *v4;
  _DWORD v5[2];
  __int16 v6;
  const char *v7;

  if (!-[CLDurianCommuteMetricManager isDataCollectionAuthorized](self, "isDataCollectionAuthorized", a3))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v4 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      v5[0] = 68289026;
      v5[1] = 0;
      v6 = 2082;
      v7 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, location auth change, clean stats.\"}", (uint8_t *)v5, 0x12u);
    }
    -[CLDurianCommuteMetricManager resetStats](self, "resetStats");
  }
}

- (void)onVisit:(id)a3
{
  NSObject *v5;
  uint64_t state;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  unsigned __int8 v12;
  CLLocationDegrees v13;
  CLLocationDegrees v14;
  CLDurianCommuteMetricManager *v15;
  uint64_t v16;
  NSObject *v17;
  char v18;
  int v19;
  int v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
  v5 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
  {
    state = self->_state;
    v19 = 68290307;
    v20 = 0;
    v21 = 2082;
    v22 = "";
    v23 = 2049;
    v24 = state;
    v25 = 2049;
    v26 = objc_msgSend(objc_msgSend(a3, "_placeInference"), "userType");
    v27 = 2114;
    v28 = objc_msgSend(a3, "arrivalDate");
    v29 = 2114;
    v30 = objc_msgSend(a3, "departureDate");
    v31 = 2113;
    v32 = a3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, fsm on visit (routine monitor)\", \"state\":%{private}ld, \"type\":%{private}ld, \"startDate\":%{public, location:escape_only}@, \"endDate\":%{public, location:escape_only}@, \"visit\":%{private, location:escape_only}@}", (uint8_t *)&v19, 0x44u);
  }
  if (a3)
  {
    objc_msgSend(a3, "coordinate");
    v8 = v7;
    v10 = v9;
    objc_msgSend(a3, "horizontalAccuracy");
    -[CLDurianCommuteMetricManager checkNearOrAtHome:horizontalAccuracy:](self, "checkNearOrAtHome:horizontalAccuracy:", v8, v10, v11);
    if (objc_msgSend(a3, "_placeInference"))
    {
      v12 = objc_msgSend(a3, "hasDepartureDate");
      if (objc_msgSend(objc_msgSend(a3, "_placeInference"), "userType") == (id)1)
      {
        objc_msgSend(a3, "coordinate");
        self->_homeLocation.latitude = v13;
        self->_homeLocation.longitude = v14;
        v15 = self;
        if ((v12 & 1) != 0)
          v16 = 1;
        else
          v16 = 2;
        goto LABEL_20;
      }
      if (objc_msgSend(objc_msgSend(a3, "_placeInference"), "userType") == (id)2)
        v18 = v12;
      else
        v18 = 1;
      if ((v18 & 1) == 0)
      {
        v15 = self;
        v16 = 3;
LABEL_20:
        -[CLDurianCommuteMetricManager transitionWithEvent:](v15, "transitionWithEvent:", v16);
      }
    }
    else
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
      v17 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
      {
        v19 = 68289026;
        v20 = 0;
        v21 = 2082;
        v22 = "";
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, fsm on visit (routine monitor), no SLV.\"}", (uint8_t *)&v19, 0x12u);
      }
    }
  }
}

- (void)didChangeConnectionStateForDevice:(id)a3 fromState:(unint64_t)a4 toState:(unint64_t)a5
{
  NSObject *v9;
  _BOOL4 nearOrAtHome;
  _DWORD v11[2];
  __int16 v12;
  const char *v13;
  __int16 v14;
  _BOOL4 v15;
  __int16 v16;
  id v17;
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (a4 != a5)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v9 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      nearOrAtHome = self->_nearOrAtHome;
      v11[0] = 68290051;
      v11[1] = 0;
      v12 = 2082;
      v13 = "";
      v14 = 1025;
      v15 = nearOrAtHome;
      v16 = 2113;
      v17 = a3;
      v18 = 1026;
      v19 = a4;
      v20 = 1026;
      v21 = a5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, connection state updated\", \"_nearOrAtHome\":%{private}hhd, \"deviceID\":%{private, location:escape_only}@, \"oldState\":%{public}d, \"newState\":%{public}d}", (uint8_t *)v11, 0x2Eu);
    }
    if ((a5 == 4 || a5 == 2) && !self->_nearOrAtHome)
      -[CLDurianCommuteMetricManager observeDevice:](self, "observeDevice:", a3);
  }
}

- (void)didObserveScanForDevice:(id)a3
{
  NSObject *v5;
  _BOOL4 nearOrAtHome;
  NSObject *v7;
  int v8;
  int v9;
  __int16 v10;
  const char *v11;
  __int16 v12;
  _BOOL4 v13;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (a3)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      nearOrAtHome = self->_nearOrAtHome;
      v8 = 68289283;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      v12 = 1025;
      v13 = nearOrAtHome;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, didObserveScanForDevice UUID\", \"_nearOrAtHome\":%{private}hhd}", (uint8_t *)&v8, 0x18u);
    }
    if (!self->_nearOrAtHome)
      -[CLDurianCommuteMetricManager observeDevice:](self, "observeDevice:", a3);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v7 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      v8 = 68289026;
      v9 = 0;
      v10 = 2082;
      v11 = "";
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, unable to retrieve UUID\"}", (uint8_t *)&v8, 0x12u);
    }
  }
}

- (id)keyFromDate:(id)a3
{
  return -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", objc_msgSend(a3, "startDayOfWeek"));
}

- (BOOL)lookupStatsWithDate:(id)a3 stats:(id)a4
{
  id v7;
  NSObject *v8;
  BOOL v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  const char *v13;
  NSObject *v14;
  _BYTE v16[16];
  _QWORD v17[2];
  uint64_t buf;
  __int16 v19;
  const char *v20;
  __int16 v21;
  id v22;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (!self->_statsLoaded)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      buf = 68289026;
      v19 = 2082;
      v20 = "";
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#rwl, lookupStatsWithDate, cannot read data due to access to encrypted data\"}", (uint8_t *)&buf, 0x12u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    }
    v11 = qword_1022A0038;
    if (!os_signpost_enabled((os_log_t)qword_1022A0038))
      return 0;
    buf = 68289026;
    v19 = 2082;
    v20 = "";
    v12 = "#rwl, lookupStatsWithDate, cannot read data due to access to encrypted data";
    v13 = "{\"msg%{public}.0s\":\"#rwl, lookupStatsWithDate, cannot read data due to access to encrypted data\"}";
    goto LABEL_25;
  }
  if (a3 && a4)
  {
    v7 = -[CLDurianCommuteMetricManager keyFromDate:](self, "keyFromDate:", a3);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      buf = 68289282;
      v19 = 2082;
      v20 = "";
      v21 = 2082;
      v22 = objc_msgSend(v7, "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, lookupStatsWithDate\", \"key\":%{public, location:escape_only}s}", (uint8_t *)&buf, 0x1Cu);
    }
    sub_100119F3C();
    if (sub_100006BB4((uint64_t)self->_metricCache, (const char *)objc_msgSend(CFSTR("CLDurianCommuteStats"), "UTF8String"), &buf))
    {
      sub_100119F3C();
      if (sub_100006BB4((uint64_t)&buf, (const char *)objc_msgSend(v7, "UTF8String"), v17))
      {
        sub_100525028(v16);
        objc_msgSend(a4, "updateStatsWithNVP:", v16);
        sub_10011A5A8(v16);
        sub_10011A5A8(v17);
        v9 = 1;
LABEL_29:
        sub_10011A5A8(&buf);
        return v9;
      }
      sub_10011A5A8(v17);
    }
    v9 = 0;
    goto LABEL_29;
  }
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
  v14 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
  {
    buf = 68289026;
    v19 = 2082;
    v20 = "";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#rwl, lookupStatsWithDate, invalid parameters\"}", (uint8_t *)&buf, 0x12u);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
  }
  v11 = qword_1022A0038;
  if (os_signpost_enabled((os_log_t)qword_1022A0038))
  {
    buf = 68289026;
    v19 = 2082;
    v20 = "";
    v12 = "#rwl, lookupStatsWithDate, invalid parameters";
    v13 = "{\"msg%{public}.0s\":\"#rwl, lookupStatsWithDate, invalid parameters\"}";
LABEL_25:
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v11, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, v12, v13, (uint8_t *)&buf, 0x12u);
  }
  return 0;
}

- (id)readAllStats
{
  CLDurianCommuteStats *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  _QWORD v9[2];
  uint8_t buf[8];
  __int16 v11;
  const char *v12;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (self->_statsLoaded)
  {
    sub_100119F3C();
    if (sub_100006BB4((uint64_t)self->_metricCache, (const char *)objc_msgSend(CFSTR("CLDurianCommuteStats"), "UTF8String"), v9))
    {
      v3 = -[CLDurianCommuteStats initWithDate:]([CLDurianCommuteStats alloc], "initWithDate:", +[NSDate date](NSDate, "date"));
      sub_100525A8C((uint64_t)v9);
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v6 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#rwl, read stats, stats don't exist\"}", buf, 0x12u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    }
    v7 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v11 = 2082;
      v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#rwl, read stats, stats don't exist", "{\"msg%{public}.0s\":\"#rwl, read stats, stats don't exist\"}", buf, 0x12u);
    }
    sub_10011A5A8(v9);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v4 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v11 = 2082;
      v12 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "{\"msg%{public}.0s\":\"#rwl, readAllStats, cannot read data due to access to encrypted data\"}", buf, 0x12u);
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    }
    v5 = qword_1022A0038;
    if (os_signpost_enabled((os_log_t)qword_1022A0038))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v11 = 2082;
      v12 = "";
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v5, OS_SIGNPOST_EVENT, 0xEEEEB0B5B2B2EEEELL, "#rwl, readAllStats, cannot read data due to access to encrypted data", "{\"msg%{public}.0s\":\"#rwl, readAllStats, cannot read data due to access to encrypted data\"}", buf, 0x12u);
    }
  }
  return 0;
}

- (void)saveStats:(id)a3
{
  NSObject *v5;
  id v6;
  const char *v7;
  NSObject *v8;
  int v9;
  NSObject *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[2];
  uint8_t buf[8];
  _BYTE v18[10];
  __int16 v19;
  id v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  __int16 v29;
  int v30;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (self->_statsLoaded)
  {
    sub_100119F3C();
    if (!sub_100006BB4((uint64_t)self->_metricCache, (const char *)objc_msgSend(CFSTR("CLDurianCommuteStats"), "UTF8String"), v16))
    {
      if (qword_1022A0030 != -1)
        dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
      v5 = qword_1022A0038;
      if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 68289026;
        *(_DWORD *)&buf[4] = 0;
        *(_WORD *)v18 = 2082;
        *(_QWORD *)&v18[2] = "";
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, save stats, stats don't exist\"}", buf, 0x12u);
      }
    }
    v6 = -[CLDurianCommuteMetricManager keyFromDate:](self, "keyFromDate:", objc_msgSend(a3, "startDate"));
    v7 = (const char *)objc_msgSend(v6, "UTF8String");
    if (a3)
    {
      objc_msgSend(a3, "getNVPFromStats");
    }
    else
    {
      *(_QWORD *)buf = 0;
      *(_QWORD *)v18 = 0;
    }
    sub_1000CADE4((uint64_t)v16, v7, (uint64_t)buf);
    sub_10011A5A8(buf);
    sub_1000CADE4((uint64_t)self->_metricCache, (const char *)objc_msgSend(CFSTR("CLDurianCommuteStats"), "UTF8String"), (uint64_t)v16);
    v9 = (*(uint64_t (**)(void *))(*(_QWORD *)self->_metricCache + 944))(self->_metricCache);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v10 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(v6, "UTF8String");
      v12 = objc_msgSend(a3, "startDate");
      v13 = objc_msgSend(a3, "endDate");
      v14 = objc_msgSend(a3, "deviceJourneyCount");
      v15 = objc_msgSend(objc_msgSend(a3, "itemJourneyStats"), "count");
      *(_DWORD *)buf = 68290563;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v18 = 2082;
      *(_QWORD *)&v18[2] = "";
      v19 = 2082;
      v20 = v11;
      v21 = 2114;
      v22 = v12;
      v23 = 2114;
      v24 = v13;
      v25 = 2049;
      v26 = v14;
      v27 = 2049;
      v28 = v15;
      v29 = 1026;
      v30 = v9;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, store done\", \"key\":%{public, location:escape_only}s, \"startDate\":%{public, location:escape_only}@, \"endDate\":%{public, location:escape_only}@, \"journeyCount\":%{private}ld, \"itemCount\":%{private}ld, \"result\":%{public}hhd}", buf, 0x4Au);
    }
    sub_10011A5A8(v16);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v8 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      *(_WORD *)v18 = 2082;
      *(_QWORD *)&v18[2] = "";
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, saveStats, cannot update due to access to encrypted data\"}", buf, 0x12u);
    }
  }
}

- (void)pruneOldStats
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD v6[2];
  uint8_t buf[8];
  __int16 v8;
  const char *v9;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (self->_statsLoaded)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v3 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, prune old stats\"}", buf, 0x12u);
    }
    sub_100119F3C();
    if (sub_100006BB4((uint64_t)self->_metricCache, (const char *)objc_msgSend(CFSTR("CLDurianCommuteStats"), "UTF8String"), v6))
    {
      sub_100525A8C((uint64_t)v6);
    }
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v5 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, save stats, stats don't exist\"}", buf, 0x12u);
    }
    sub_10011A5A8(v6);
  }
  else
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v4 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 68289026;
      *(_DWORD *)&buf[4] = 0;
      v8 = 2082;
      v9 = "";
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, pruneOldStats, cannot prune data due to access to encrypted data\"}", buf, 0x12u);
    }
  }
}

- (void)initAnalyticsTimer
{
  CLTimer *v3;
  double analyticsHoldoffInterval;
  double v5;
  NSObject *v6;
  double v7;
  _QWORD v8[5];
  uint8_t buf[4];
  int v10;
  __int16 v11;
  const char *v12;
  __int16 v13;
  double v14;
  __int16 v15;
  double v16;

  v3 = (CLTimer *)objc_msgSend(-[CLIntersiloUniverse silo](self->_universe, "silo"), "newTimer");
  self->_analyticsTimer = v3;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1014D6004;
  v8[3] = &unk_10212BB58;
  v8[4] = self;
  -[CLTimer setHandler:](v3, "setHandler:", v8);
  analyticsHoldoffInterval = self->_analyticsHoldoffInterval;
  v5 = CFAbsoluteTimeGetCurrent() - self->_lastAnalyticsSubmissionTime;
  if (analyticsHoldoffInterval > v5)
    analyticsHoldoffInterval = 86400.0 - v5;
  -[CLTimer setNextFireDelay:interval:](self->_analyticsTimer, "setNextFireDelay:interval:", analyticsHoldoffInterval, self->_analyticsHoldoffInterval);
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
  v6 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
  {
    v7 = self->_analyticsHoldoffInterval;
    *(_DWORD *)buf = 68289538;
    v10 = 0;
    v11 = 2082;
    v12 = "";
    v13 = 2050;
    v14 = analyticsHoldoffInterval;
    v15 = 2050;
    v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, Commute Metrics, init analytics timer\", \"delay\":\"%{public}f\", \"interval\":\"%{public}f\"}", buf, 0x26u);
  }
}

- (void)onAnalyticsTimerFired:(id)a3
{
  NSObject *v4;
  double analyticsHoldoffInterval;
  _DWORD v6[2];
  __int16 v7;
  const char *v8;
  __int16 v9;
  double v10;

  if (self->_analyticsTimer == a3)
  {
    self->_lastAnalyticsSubmissionTime = CFAbsoluteTimeGetCurrent();
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v4 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
    {
      analyticsHoldoffInterval = self->_analyticsHoldoffInterval;
      v6[0] = 68289282;
      v6[1] = 0;
      v7 = 2082;
      v8 = "";
      v9 = 2050;
      v10 = analyticsHoldoffInterval;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, Commute Metrics, timer fired\", \"interval\":\"%{public}f\"}", (uint8_t *)v6, 0x1Cu);
    }
    -[CLDurianCommuteMetricManager sendMetrics](self, "sendMetrics");
  }
}

- (void)sendMetrics
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  double v14;
  SPBeaconManager *beaconManager;
  double v16;
  NSObject *v17;
  const char *v18;
  double v19;
  NSObject *v20;
  id v21;
  NSDictionary *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  id v29;
  void *v30;
  id obj;
  uint64_t v32;
  id v33;
  id v34;
  _QWORD v35[11];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[6];
  _QWORD v41[6];
  _BYTE v42[128];
  uint64_t buf;
  __int16 v44;
  const char *v45;
  __int16 v46;
  id v47;
  __int16 v48;
  id v49;
  __int16 v50;
  id v51;
  __int16 v52;
  id v53;
  __int16 v54;
  id v55;

  -[CLIntersiloUniverse silo](self->_universe, "silo");
  if (!self->_statsLoaded)
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v17 = qword_1022A0038;
    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
      return;
    buf = 68289026;
    v44 = 2082;
    v45 = "";
    v18 = "{\"msg%{public}.0s\":\"#rwl, sendMetrics, skip metric submission due to access to encrypted data\"}";
LABEL_31:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, v18, (uint8_t *)&buf, 0x12u);
    return;
  }
  -[CLDurianCommuteMetricManager pruneOldStats](self, "pruneOldStats");
  if (!-[CLDurianCommuteMetricManager isDataCollectionAuthorized](self, "isDataCollectionAuthorized"))
  {
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v17 = qword_1022A0038;
    if (!os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
      return;
    buf = 68289026;
    v44 = 2082;
    v45 = "";
    v18 = "{\"msg%{public}.0s\":\"#rwl, sendMetrics, skip metric submission.\"}";
    goto LABEL_31;
  }
  v3 = -[CLDurianCommuteMetricManager readAllStats](self, "readAllStats");
  v34 = objc_msgSend(objc_msgSend(v3, "startDate"), "daysToDate:", objc_msgSend(v3, "endDate"));
  if (qword_1022A0030 != -1)
    dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
  v4 = qword_1022A0038;
  if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_INFO))
  {
    buf = 68290307;
    v44 = 2082;
    v45 = "";
    v46 = 2114;
    v47 = objc_msgSend(v3, "startDate");
    v48 = 2114;
    v49 = objc_msgSend(v3, "endDate");
    v50 = 2050;
    v51 = v34;
    v52 = 2049;
    v53 = objc_msgSend(v3, "deviceJourneyCount");
    v54 = 2049;
    v55 = objc_msgSend(objc_msgSend(v3, "itemJourneyStats"), "count");
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "{\"msg%{public}.0s\":\"#rwl, send metrics\", \"startDate\":%{public, location:escape_only}@, \"endDate\":%{public, location:escape_only}@, \"days\":%{public}ld, \"journeyCount\":%{private}ld, \"itemCount\":%{private}ld}", (uint8_t *)&buf, 0x44u);
  }
  if (v34 && objc_msgSend(v3, "deviceJourneyCount"))
  {
    v5 = objc_msgSend(objc_msgSend(v3, "itemJourneyStats"), "count");
    v36 = 0u;
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    obj = objc_msgSend(objc_msgSend(objc_msgSend(v3, "itemJourneyStats"), "keysSortedByValueUsingSelector:", "journeyCount"), "reverseObjectEnumerator");
    v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
    v29 = v5;
    if (v33)
    {
      v6 = 0;
      v7 = 0;
      v32 = *(_QWORD *)v37;
      v8 = (double)(uint64_t)v5;
LABEL_11:
      v9 = 0;
      if (v6 <= 5)
        v10 = 5;
      else
        v10 = v6;
      v11 = v6 - v10;
      while (1)
      {
        if (*(_QWORD *)v37 != v32)
          objc_enumerationMutation(obj);
        v12 = *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * v9);
        v13 = objc_msgSend(objc_msgSend(objc_msgSend(v3, "itemJourneyStats", v29), "objectForKey:", v12), "journeyCount");
        v14 = (double)(uint64_t)objc_msgSend(v3, "deviceJourneyCount");
        beaconManager = self->_beaconManager;
        v35[0] = _NSConcreteStackBlock;
        v35[1] = 3221225472;
        v35[2] = sub_1014D674C;
        v35[3] = &unk_1021BBFB0;
        v35[6] = v6 + v9;
        v35[7] = v34;
        v16 = (double)(uint64_t)v13 / v14;
        v35[4] = self;
        v35[5] = v3;
        *(double *)&v35[8] = (double)(v6 + v9 + 1) / v8;
        if (v7 <= (uint64_t)v13)
          v7 = (uint64_t)v13;
        v35[9] = (uint64_t)((double)(v6 + v9 + 1) / v8 * 10.0);
        *(double *)&v35[10] = v16;
        -[SPBeaconManager beaconForUUID:completion:](beaconManager, "beaconForUUID:completion:", v12, v35);
        if (!(v11 + v9))
          break;
        if (v33 == (id)++v9)
        {
          v6 += v9;
          v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v36, v42, 16);
          if (v33)
            goto LABEL_11;
          break;
        }
      }
    }
    else
    {
      v7 = 0;
    }
    v19 = (double)(uint64_t)objc_msgSend(v3, "deviceJourneyCount", v29);
    if (qword_1022A0030 != -1)
      dispatch_once(&qword_1022A0030, &stru_1021BBFD0);
    v20 = qword_1022A0038;
    if (os_log_type_enabled((os_log_t)qword_1022A0038, OS_LOG_TYPE_DEBUG))
    {
      v21 = objc_msgSend(v3, "deviceJourneyCount");
      buf = 68289539;
      v44 = 2082;
      v45 = "";
      v46 = 2049;
      v47 = (id)v7;
      v48 = 2049;
      v49 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "{\"msg%{public}.0s\":\"#rwl, send summary metrics\", \"maxItemJourneyCount\":%{private}ld, \"journeyCount\":%{private}ld}", (uint8_t *)&buf, 0x26u);
    }
    v40[0] = CFSTR("DurationBinned");
    v41[0] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLDurianCommuteMetricManager decimateInteger:](self, "decimateInteger:", v34));
    v40[1] = CFSTR("TransitsBinned");
    v41[1] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLDurianCommuteMetricManager decimateInteger:](self, "decimateInteger:", objc_msgSend(v3, "deviceJourneyCount")));
    v41[2] = CFSTR("Work");
    v40[2] = CFSTR("LOIType");
    v40[3] = CFSTR("ModelType");
    v41[3] = CFSTR("Commute");
    v40[4] = CFSTR("MaxParityRate");
    -[CLDurianCommuteMetricManager decimateDoulbe:](self, "decimateDoulbe:", (double)v7 / v19);
    v41[4] = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    v40[5] = CFSTR("ItemCount");
    v41[5] = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", -[CLDurianCommuteMetricManager decimateInteger:](self, "decimateInteger:", v30));
    v22 = +[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v41, v40, 6);
    AnalyticsSendEvent((CLDurianLocationMonitor *)CFSTR("com.apple.locationd.moondragon.parityrateSummary"), (SEL)v22, v23, v24, v25, v26, v27, v28, v30);
  }
}

- (int64_t)decimateInteger:(int64_t)a3
{
  return 5 * (a3 / 5);
}

- (double)decimateDoulbe:(double)a3
{
  return (double)(uint64_t)(a3 * 100.0) / 100.0;
}

- (BOOL)valid
{
  return self->valid;
}

- (void)setValid:(BOOL)a3
{
  self->valid = a3;
}

- (void).cxx_destruct
{
  Client *value;

  value = self->_dataProtectionManagerClient.__ptr_.__value_;
  self->_dataProtectionManagerClient.__ptr_.__value_ = 0;
  if (value)
    (*(void (**)(Client *))(*(_QWORD *)value + 8))(value);
}

- (id).cxx_construct
{
  *((_QWORD *)self + 4) = 0;
  return self;
}

@end
