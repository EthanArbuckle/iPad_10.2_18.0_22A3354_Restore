@implementation RTIntermittentGNSSManager

- (void)_updateWifiLocationAvailabilityStatus:(id)a3
{
  id v4;
  uint64_t v5;
  __int128 v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  double v13;
  double v14;
  NSObject *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  void *v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (!v5)
    goto LABEL_22;
  v7 = v5;
  v8 = 0;
  v9 = *(_QWORD *)v19;
  *(_QWORD *)&v6 = 136315394;
  v17 = v6;
  do
  {
    for (i = 0; i != v7; ++i)
    {
      if (*(_QWORD *)v19 != v9)
        objc_enumerationMutation(v4);
      v11 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
      if (objc_msgSend((id)objc_opt_class(), "validLocation:", v11))
      {
        if (objc_msgSend(v11, "type") == 4
          || objc_msgSend(v11, "type") == 11
          || objc_msgSend(v11, "type") == 13)
        {
          if (!self->_lastWifiLocationDate
            || (objc_msgSend(v11, "timestamp"),
                v12 = (void *)objc_claimAutoreleasedReturnValue(),
                objc_msgSend(v12, "timeIntervalSinceDate:", self->_lastWifiLocationDate),
                v14 = v13,
                v12,
                v14 >= 0.0))
          {
            objc_msgSend(v11, "timestamp", v17);
            v15 = v8;
            v8 = objc_claimAutoreleasedReturnValue();
LABEL_17:

            continue;
          }
        }
        if (objc_msgSend(v11, "type", v17) == 1 || objc_msgSend(v11, "type") == 9)
        {
          _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v11, "toString");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = v17;
            v23 = "-[RTIntermittentGNSSManager _updateWifiLocationAvailabilityStatus:]";
            v24 = 2112;
            v25 = v16;
            _os_log_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_INFO, "%s, gps location received, %@", buf, 0x16u);

          }
          goto LABEL_17;
        }
      }
    }
    v7 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  }
  while (v7);
  if (v8)
  {
    -[RTIntermittentGNSSManager setLastWifiLocationDate:](self, "setLastWifiLocationDate:", v8);

  }
LABEL_22:

}

+ (BOOL)validLocation:(id)a3
{
  id v3;
  void *v4;
  double v5;
  BOOL v6;
  double v7;

  v3 = a3;
  v4 = v3;
  if (v3 && (objc_msgSend(v3, "horizontalAccuracy"), v5 >= 0.0))
  {
    objc_msgSend(v4, "horizontalAccuracy");
    v6 = v7 <= 250.0;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setLastWifiLocationDate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_lastWifiLocationDate, a3);
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "stringFromDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[RTIntermittentGNSSManager setLastWifiLocationDate:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, lastWifiLocationDate, %@", (uint8_t *)&v8, 0x16u);

  }
  -[RTIntermittentGNSSManager _updateWifiLocationStarvedTimer](self, "_updateWifiLocationStarvedTimer");
  -[RTIntermittentGNSSManager setWifiLocationStarved:](self, "setWifiLocationStarved:", 0);

}

- (void)setWifiLocationStarved:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  -[RTIntermittentGNSSManager _completeRemoteStatusChecklistItem:](self, "_completeRemoteStatusChecklistItem:", 4);
  if (self->_wifiLocationStarved != v3)
  {
    self->_wifiLocationStarved = v3;
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v8 = 136315394;
      v9 = "-[RTIntermittentGNSSManager setWifiLocationStarved:]";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, wifiLocationStarved, %@", (uint8_t *)&v8, 0x16u);
    }

    -[RTIntermittentGNSSManager metrics](self, "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processSignalSwitch:", 5);

    -[RTIntermittentGNSSManager _considerRegisteringForIntermittentGNSS](self, "_considerRegisteringForIntermittentGNSS");
  }
}

void __59__RTIntermittentGNSSManager_onLeechedLocationNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  uint8_t buf[16];

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "leechedLocations");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "metrics");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "updateSessionLocationCount:", objc_msgSend(v10, "count"));

    objc_msgSend(*(id *)(a1 + 40), "_updateWifiLocationAvailabilityStatus:", v10);
    v3 = *(void **)(a1 + 40);
    objc_msgSend(v10, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_updateSignalEnvironmentRiskStatus:", objc_msgSend(v4, "signalEnvironmentType"));

    v5 = *(void **)(a1 + 40);
    v6 = objc_alloc(MEMORY[0x1E0D183B0]);
    objc_msgSend(v10, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = (void *)objc_msgSend(v6, "initWithCLLocation:", v7);
    objc_msgSend(v5, "_updateLocationNearLOI:", v8);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [notification isKindOfClass:[RTLocationManagerNotificationLocationsLeeched class]]", buf, 2u);
    }

  }
}

- (void)setSignalEnvironmentAtRisk:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_signalEnvironmentAtRisk != a3)
  {
    v3 = a3;
    self->_signalEnvironmentAtRisk = a3;
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v8 = 136315394;
      v9 = "-[RTIntermittentGNSSManager setSignalEnvironmentAtRisk:]";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, signalEnvironmentAtRisk, %@", (uint8_t *)&v8, 0x16u);
    }

    -[RTIntermittentGNSSManager metrics](self, "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processSignalSwitch:", 3);

    -[RTIntermittentGNSSManager _considerRegisteringForIntermittentGNSS](self, "_considerRegisteringForIntermittentGNSS");
  }
}

- (RTIntermittentGNSSManagerMetrics)metrics
{
  return self->_metrics;
}

- (void)_updateSignalEnvironmentRiskStatus:(int)a3
{
  _BOOL8 v5;

  -[RTIntermittentGNSSManager setCurrentSignalEnvironment:](self, "setCurrentSignalEnvironment:");
  v5 = 1;
  if ((a3 - 1) >= 2 && a3 != 6)
  {
    if (a3)
      v5 = 0;
    else
      v5 = -[RTIntermittentGNSSManager signalEnvironmentAtRisk](self, "signalEnvironmentAtRisk", 1);
  }
  -[RTIntermittentGNSSManager setSignalEnvironmentAtRisk:](self, "setSignalEnvironmentAtRisk:", v5);
}

- (void)setCurrentSignalEnvironment:(int)a3
{
  NSObject *v5;
  int currentSignalEnvironment;
  int v7;
  const char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  -[RTIntermittentGNSSManager _completeRemoteStatusChecklistItem:](self, "_completeRemoteStatusChecklistItem:", 1);
  if (self->_currentSignalEnvironment != a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      currentSignalEnvironment = self->_currentSignalEnvironment;
      v7 = 136315650;
      v8 = "-[RTIntermittentGNSSManager setCurrentSignalEnvironment:]";
      v9 = 1024;
      v10 = currentSignalEnvironment;
      v11 = 1024;
      v12 = a3;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, signal environment change detected, from, %d, to, %d", (uint8_t *)&v7, 0x18u);
    }

    self->_currentSignalEnvironment = a3;
  }
}

- (void)_updateLocationNearLOI:(id)a3
{
  void *v3;
  id v5;
  _BOOL4 unsettled;
  NSDate *lastSettledStateChangeDate;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  NSObject *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  id v27;
  uint8_t v28[128];
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  unsettled = self->_unsettled;
  if (self->_unsettled
    || (lastSettledStateChangeDate = self->_lastSettledStateChangeDate,
        -[RTIntermittentGNSSManager lastLOINearbyCheckDate](self, "lastLOINearbyCheckDate"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        -[NSDate timeIntervalSinceDate:](lastSettledStateChangeDate, "timeIntervalSinceDate:", v3),
        v8 >= 0.0))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIntermittentGNSSManager lastLOINearbyCheckDate](self, "lastLOINearbyCheckDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "timeIntervalSinceDate:", v10);
    v12 = v11;

    if (!unsettled)
    if (v12 >= 300.0)
    {
      v27 = 0;
      -[RTIntermittentGNSSManager _locationsOfInterestNearLocation:error:](self, "_locationsOfInterestNearLocation:error:", v5, &v27);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = v27;
      if (v14)
      {
        _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315394;
          v30 = "-[RTIntermittentGNSSManager _updateLocationNearLOI:]";
          v31 = 2112;
          v32 = v14;
          _os_log_debug_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_DEBUG, "%s, loi fetch error, %@", buf, 0x16u);
        }
      }
      else
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        v15 = v13;
        v16 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
        if (v16)
        {
          v17 = v16;
          v18 = *(_QWORD *)v24;
          while (2)
          {
            for (i = 0; i != v17; ++i)
            {
              if (*(_QWORD *)v24 != v18)
                objc_enumerationMutation(v15);
              v20 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
              if (-[RTIntermittentGNSSManager _frequentlyVisitedLocationOfInterest:](self, "_frequentlyVisitedLocationOfInterest:", v20, (_QWORD)v23))
              {
                -[RTIntermittentGNSSManager setAwayFromFrequentlyVisitedLOI:](self, "setAwayFromFrequentlyVisitedLOI:", 0);
                objc_msgSend(v5, "date");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTIntermittentGNSSManager setLastLOINearbyCheckDate:](self, "setLastLOINearbyCheckDate:", v21);

                _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
                v22 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 136315394;
                  v30 = "-[RTIntermittentGNSSManager _updateLocationNearLOI:]";
                  v31 = 2112;
                  v32 = v20;
                  _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%s, near frequently visited LOI, %@", buf, 0x16u);
                }

                goto LABEL_22;
              }
            }
            v17 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
            if (v17)
              continue;
            break;
          }
        }

        -[RTIntermittentGNSSManager setAwayFromFrequentlyVisitedLOI:](self, "setAwayFromFrequentlyVisitedLOI:", 1);
        objc_msgSend(v5, "date");
        v15 = objc_claimAutoreleasedReturnValue();
        -[RTIntermittentGNSSManager setLastLOINearbyCheckDate:](self, "setLastLOINearbyCheckDate:", v15);
      }
LABEL_22:

    }
  }
  else
  {

  }
}

- (NSDate)lastLOINearbyCheckDate
{
  return self->_lastLOINearbyCheckDate;
}

- (void)onLeechedLocationNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  RTIntermittentGNSSManager *v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __59__RTIntermittentGNSSManager_onLeechedLocationNotification___block_invoke;
  v11 = &unk_1E9297540;
  v12 = v4;
  v13 = self;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v8);
  -[RTNotifier queue](self, "queue", v8, v9, v10, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

}

- (id)_initializeWifiLocationStarvedTimer
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t);
  void *v16;
  id v17;
  RTIntermittentGNSSManager *v18;
  id v19;
  id location;

  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIntermittentGNSSManager timerManager](self, "timerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = MEMORY[0x1E0C809B0];
  v14 = 3221225472;
  v15 = __64__RTIntermittentGNSSManager__initializeWifiLocationStarvedTimer__block_invoke;
  v16 = &unk_1E92A2468;
  v6 = v3;
  v17 = v6;
  v18 = self;
  objc_copyWeak(&v19, &location);
  objc_msgSend(v4, "timerWithIdentifier:queue:handler:", CFSTR("RTIntermittentGNSSLocationStarvedTimer"), v5, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTIntermittentGNSSManager lastWifiLocationDate](self, "lastWifiLocationDate", v13, v14, v15, v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIntermittentGNSSManager lastDenseWifiScanResultDate](self, "lastDenseWifiScanResultDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "laterDate:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "timeIntervalSinceDate:", v10);
  objc_msgSend(v7, "fireAfterDelay:", fmax(840.0 - v11, 1.0));
  objc_msgSend(v7, "resume");

  objc_destroyWeak(&v19);
  objc_destroyWeak(&location);
  return v7;
}

- (void)_updateWifiLocationStarvedTimer
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  const __CFString *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  -[RTIntermittentGNSSManager wifiLocationStarvedTimer](self, "wifiLocationStarvedTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTIntermittentGNSSManager wifiLocationStarvedTimer](self, "wifiLocationStarvedTimer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "invalidate");

    -[RTIntermittentGNSSManager setWifiLocationStarvedTimer:](self, "setWifiLocationStarvedTimer:", 0);
  }
  -[RTIntermittentGNSSManager lastWifiLocationDate](self, "lastWifiLocationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    -[RTIntermittentGNSSManager lastDenseWifiScanResultDate](self, "lastDenseWifiScanResultDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      return;
  }
  -[RTIntermittentGNSSManager _initializeWifiLocationStarvedTimer](self, "_initializeWifiLocationStarvedTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIntermittentGNSSManager setWifiLocationStarvedTimer:](self, "setWifiLocationStarvedTimer:", v7);

  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    -[RTIntermittentGNSSManager lastWifiLocationDate](self, "lastWifiLocationDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringFromDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIntermittentGNSSManager lastDenseWifiScanResultDate](self, "lastDenseWifiScanResultDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringFromDate");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = 136316162;
    v14 = "-[RTIntermittentGNSSManager _updateWifiLocationStarvedTimer]";
    v15 = 2112;
    v16 = CFSTR("RTIntermittentGNSSLocationStarvedTimer");
    v17 = 2112;
    v18 = v10;
    v19 = 2112;
    v20 = v12;
    v21 = 2048;
    v22 = 0x408A400000000000;
    _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, %@, lastWifiLocationDate, %@, lastDenseWifiScanResultDate, %@, interval, %.2f", (uint8_t *)&v13, 0x34u);

  }
}

- (NSDate)lastWifiLocationDate
{
  return self->_lastWifiLocationDate;
}

- (RTTimer)wifiLocationStarvedTimer
{
  return self->_wifiLocationStarvedTimer;
}

- (void)setWifiLocationStarvedTimer:(id)a3
{
  objc_storeStrong((id *)&self->_wifiLocationStarvedTimer, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (RTIntermittentGNSSManager)initWithDefaultsManager:(id)a3 learnedLocationManager:(id)a4 locationManager:(id)a5 motionActivityManager:(id)a6 platform:(id)a7 vehicleLocationProvider:(id)a8 wifiManager:(id)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  RTIntermittentGNSSManager *v24;

  v16 = a9;
  v17 = a8;
  v18 = a7;
  v19 = a6;
  v20 = a5;
  v21 = a4;
  v22 = a3;
  v23 = (void *)objc_opt_new();
  v24 = -[RTIntermittentGNSSManager initWithDefaultsManager:learnedLocationManager:locationManager:motionActivityManager:platform:timerManager:vehicleLocationProvider:wifiManager:](self, "initWithDefaultsManager:learnedLocationManager:locationManager:motionActivityManager:platform:timerManager:vehicleLocationProvider:wifiManager:", v22, v21, v20, v19, v18, v23, v17, v16);

  return v24;
}

- (RTIntermittentGNSSManager)initWithDefaultsManager:(id)a3 learnedLocationManager:(id)a4 locationManager:(id)a5 motionActivityManager:(id)a6 platform:(id)a7 timerManager:(id)a8 vehicleLocationProvider:(id)a9 wifiManager:(id)a10
{
  id v16;
  id v17;
  id v18;
  RTIntermittentGNSSManager *v19;
  RTIntermittentGNSSManagerMetrics *v20;
  RTIntermittentGNSSManagerMetrics *metrics;
  RTIntermittentGNSSManager *v22;
  RTIntermittentGNSSManager *v23;
  void *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v28;
  id v29;
  RTIntermittentGNSSManager *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  objc_super v37;
  uint8_t buf[16];

  v16 = a3;
  v17 = a4;
  v36 = a5;
  v35 = a6;
  v34 = a7;
  v33 = a8;
  v32 = a9;
  v18 = a10;
  if (!v16)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: defaultsManager";
LABEL_26:
    _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, v26, buf, 2u);
    goto LABEL_27;
  }
  if (!v17)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_26;
  }
  if (!v36)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_26;
  }
  if (!v35)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_26;
  }
  if (!v34)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: platform";
    goto LABEL_26;
  }
  if (!v33)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      goto LABEL_27;
    *(_WORD *)buf = 0;
    v26 = "Invalid parameter not satisfying: timerManager";
    goto LABEL_26;
  }
  if (!v32)
  {
    v24 = v18;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v26 = "Invalid parameter not satisfying: vehicleLocationProvider";
      goto LABEL_26;
    }
LABEL_27:

    v23 = 0;
    v22 = self;
    goto LABEL_28;
  }
  v29 = v18;
  if (v18)
  {
    v37.receiver = self;
    v37.super_class = (Class)RTIntermittentGNSSManager;
    v19 = -[RTNotifier init](&v37, sel_init);
    if (v19)
    {
      v31 = v19;
      objc_storeStrong((id *)&v19->_defaultsManager, a3);
      objc_storeStrong((id *)&v31->_learnedLocationManager, a4);
      objc_storeStrong((id *)&v31->_locationManager, a5);
      v20 = -[RTIntermittentGNSSManagerMetrics initWithDefaultsManager:timerManager:]([RTIntermittentGNSSManagerMetrics alloc], "initWithDefaultsManager:timerManager:", v16, v33);
      metrics = v31->_metrics;
      v31->_metrics = v20;

      objc_storeStrong((id *)&v31->_motionActivityManager, a6);
      objc_storeStrong((id *)&v31->_platform, a7);
      objc_storeStrong((id *)&v31->_timerManager, a8);
      objc_storeStrong((id *)&v31->_vehicleLocationProvider, a9);
      objc_storeStrong((id *)&v31->_wifiManager, a10);
      -[RTService setup](v31, "setup");
      v19 = v31;
    }
    v22 = v19;
    v23 = v22;
    v24 = v29;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v28 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v28, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: wifiManager", buf, 2u);
    }

    v23 = 0;
    v24 = 0;
    v22 = self;
  }
LABEL_28:

  return v23;
}

- (BOOL)platformSupported
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;

  -[RTIntermittentGNSSManager platform](self, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "internalInstall") & 1) != 0)
  {
    -[RTIntermittentGNSSManager defaultsManager](self, "defaultsManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSBypassPlatformCheck"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      -[RTIntermittentGNSSManager defaultsManager](self, "defaultsManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSBypassPlatformCheck"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "BOOLValue");

      return v8;
    }
  }
  else
  {

  }
  return MGGetBoolAnswer();
}

- (void)_setup
{
  void *v3;
  void *v4;
  char v5;
  NSObject *v6;
  void *v7;
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
  void *v18;
  void *v19;
  void *v20;
  dispatch_semaphore_t v21;
  RTMotionActivityManager *motionActivityManager;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  dispatch_time_t v26;
  void *v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  char v40;
  id v41;
  BOOL v42;
  NSMutableArray *v43;
  NSMutableArray *accessPoints;
  NSDate *v45;
  NSDate *lastLOINearbyCheckDate;
  NSDate *v47;
  NSDate *lastSettledStateChangeDate;
  NSDate *v49;
  NSDate *lastWifiLocationDate;
  NSDate *v51;
  NSDate *lastDenseWifiScanResultDate;
  NSDate *v53;
  NSDate *lastRegisteredForIntermittentGNSSVariableFlipDate;
  _QWORD v55[4];
  NSObject *v56;
  __int128 *p_buf;
  uint64_t *v58;
  uint64_t v59;
  id *v60;
  uint64_t v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  __int128 buf;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint8_t v71[16];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  -[RTIntermittentGNSSManager defaultsManager](self, "defaultsManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSBypassSetup"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {

  }
  else
  {
    v5 = _os_feature_enabled_impl();

    if ((v5 & 1) == 0)
      goto LABEL_7;
  }
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136315138;
    *(_QWORD *)((char *)&buf + 4) = "-[RTIntermittentGNSSManager _setup]";
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, IntermittentGNSS registration and setup blocked by user defaults or feature flag", (uint8_t *)&buf, 0xCu);
  }

LABEL_7:
  -[RTIntermittentGNSSManager setRemoteStatusChecklist:](self, "setRemoteStatusChecklist:", 0);
  -[RTIntermittentGNSSManager _initializeWifiLocationStarvedTimer](self, "_initializeWifiLocationStarvedTimer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIntermittentGNSSManager setWifiLocationStarvedTimer:](self, "setWifiLocationStarvedTimer:", v7);

  -[RTIntermittentGNSSManager locationManager](self, "locationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObserver:selector:name:", self, sel_onLeechedLocationNotification_, v9);

  -[RTIntermittentGNSSManager motionActivityManager](self, "motionActivityManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTMotionActivityManagerNotificationActivity, "notificationName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "addObserver:selector:name:", self, sel_onMotionActivityManagerNotification_, v11);

  -[RTIntermittentGNSSManager motionActivityManager](self, "motionActivityManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addObserver:selector:name:", self, sel_onMotionActivityManagerNotification_, v13);

  -[RTIntermittentGNSSManager motionActivityManager](self, "motionActivityManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTMotionActivityManagerNotificationDominantMotionActivityChange, "notificationName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "addObserver:selector:name:", self, sel_onMotionActivityManagerNotification_, v15);

  -[RTIntermittentGNSSManager vehicleLocationProvider](self, "vehicleLocationProvider");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVehicleEventNotification, "notificationName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObserver:selector:name:", self, sel_onVehicleEventNotification_, v17);

  -[RTIntermittentGNSSManager wifiManager](self, "wifiManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTWiFiManagerNotificationScanResults, "notificationName");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "addObserver:selector:name:", self, sel_onWifiScanResultsNotification_, v19);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "addObserver:selector:name:object:", self, sel_onDailyMetricsNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

  v21 = dispatch_semaphore_create(0);
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v66 = 0x3032000000;
  v67 = __Block_byref_object_copy__158;
  v68 = __Block_byref_object_dispose__158;
  v69 = 0;
  v59 = 0;
  v60 = (id *)&v59;
  v61 = 0x3032000000;
  v62 = __Block_byref_object_copy__158;
  v63 = __Block_byref_object_dispose__158;
  v64 = 0;
  motionActivityManager = self->_motionActivityManager;
  v55[0] = MEMORY[0x1E0C809B0];
  v55[1] = 3221225472;
  v55[2] = __35__RTIntermittentGNSSManager__setup__block_invoke;
  v55[3] = &unk_1E92A4FC8;
  p_buf = &buf;
  v58 = &v59;
  v23 = v21;
  v56 = v23;
  -[RTMotionActivityManager fetchPredominantMotionActivityWithHandler:](motionActivityManager, "fetchPredominantMotionActivityWithHandler:", v55);
  v24 = v23;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v24, v26))
    goto LABEL_12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "timeIntervalSinceDate:", v25);
  v29 = v28;
  v30 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_116);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "filteredArrayUsingPredicate:", v31);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "firstObject");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v30, "submitToCoreAnalytics:type:duration:", v34, 1, v29);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v35 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)v71 = 0;
    _os_log_fault_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", v71, 2u);
  }

  v36 = (void *)MEMORY[0x1E0CB35C8];
  v70 = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)v71 = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v71, &v70, 1);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  if (v38)
  {
    v39 = objc_retainAutorelease(v38);

    v40 = 0;
  }
  else
  {
LABEL_12:
    v39 = 0;
    v40 = 1;
  }

  v41 = v39;
  if ((v40 & 1) == 0)
    objc_storeStrong(v60 + 5, v39);
  if (!v60[5])
  {
    v42 = -[RTIntermittentGNSSManager _motionActivityConditionsSatisifed:](self, "_motionActivityConditionsSatisifed:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    self->_unsettled = v42;
    self->_motionActivityTypeSatisfied = v42;
  }
  v43 = (NSMutableArray *)objc_opt_new();
  accessPoints = self->_accessPoints;
  self->_accessPoints = v43;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v45 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastLOINearbyCheckDate = self->_lastLOINearbyCheckDate;
  self->_lastLOINearbyCheckDate = v45;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v47 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastSettledStateChangeDate = self->_lastSettledStateChangeDate;
  self->_lastSettledStateChangeDate = v47;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v49 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastWifiLocationDate = self->_lastWifiLocationDate;
  self->_lastWifiLocationDate = v49;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v51 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastDenseWifiScanResultDate = self->_lastDenseWifiScanResultDate;
  self->_lastDenseWifiScanResultDate = v51;

  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v53 = (NSDate *)objc_claimAutoreleasedReturnValue();
  lastRegisteredForIntermittentGNSSVariableFlipDate = self->_lastRegisteredForIntermittentGNSSVariableFlipDate;
  self->_lastRegisteredForIntermittentGNSSVariableFlipDate = v53;

  self->_signalEnvironmentAtRisk = 1;
  self->_awayFromFrequentlyVisitedLOI = 1;
  self->_wifiLocationStarved = 1;
  -[RTIntermittentGNSSManager _considerRegisteringForIntermittentGNSS](self, "_considerRegisteringForIntermittentGNSS");

  _Block_object_dispose(&v59, 8);
  _Block_object_dispose(&buf, 8);

}

void __35__RTIntermittentGNSSManager__setup__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_shutdownWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  -[RTIntermittentGNSSManager locationManager](self, "locationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:", self);

  -[RTIntermittentGNSSManager motionActivityManager](self, "motionActivityManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[RTIntermittentGNSSManager vehicleLocationProvider](self, "vehicleLocationProvider");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[RTIntermittentGNSSManager wifiManager](self, "wifiManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[RTIntermittentGNSSManager wifiLocationStarvedTimer](self, "wifiLocationStarvedTimer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "invalidate");

  -[RTIntermittentGNSSManager setWifiLocationStarvedTimer:](self, "setWifiLocationStarvedTimer:", 0);
  -[RTIntermittentGNSSManager wifiScanTimer](self, "wifiScanTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "invalidate");

  -[RTIntermittentGNSSManager setWifiScanTimer:](self, "setWifiScanTimer:", 0);
  -[RTIntermittentGNSSManager metrics](self, "metrics");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "shutdown");

  v11 = v12;
  if (v12)
  {
    (*((void (**)(id, _QWORD))v12 + 2))(v12, 0);
    v11 = v12;
  }

}

- (void)setCompletedInitialWifiScan:(BOOL)a3
{
  -[RTIntermittentGNSSManager _completeRemoteStatusChecklistItem:](self, "_completeRemoteStatusChecklistItem:", 8);
  self->_completedInitialWifiScan = a3;
}

- (void)setUnsettled:(BOOL)a3
{
  NSDate *v4;
  NSDate *lastSettledStateChangeDate;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (self->_unsettled != a3)
  {
    self->_unsettled = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastSettledStateChangeDate = self->_lastSettledStateChangeDate;
    self->_lastSettledStateChangeDate = v4;

    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (self->_unsettled)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v9 = 136315394;
      v10 = "-[RTIntermittentGNSSManager setUnsettled:]";
      v11 = 2112;
      v12 = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, unsettled, %@", (uint8_t *)&v9, 0x16u);
    }

    -[RTIntermittentGNSSManager metrics](self, "metrics");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "processSignalSwitch:", 2);

    -[RTIntermittentGNSSManager _considerRegisteringForIntermittentGNSS](self, "_considerRegisteringForIntermittentGNSS");
  }
}

- (void)setLastDenseWifiScanResultDate:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_storeStrong((id *)&self->_lastDenseWifiScanResultDate, a3);
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v5, "stringFromDate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 136315394;
    v9 = "-[RTIntermittentGNSSManager setLastDenseWifiScanResultDate:]";
    v10 = 2112;
    v11 = v7;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, lastDenseWifiScanResultDate, %@", (uint8_t *)&v8, 0x16u);

  }
  -[RTIntermittentGNSSManager _updateWifiLocationStarvedTimer](self, "_updateWifiLocationStarvedTimer");
  -[RTIntermittentGNSSManager setWifiLocationStarved:](self, "setWifiLocationStarved:", 0);

}

- (void)setMotionActivityTypeSatisfied:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  if (self->_motionActivityTypeSatisfied != a3)
  {
    v3 = a3;
    self->_motionActivityTypeSatisfied = a3;
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v8 = 136315394;
      v9 = "-[RTIntermittentGNSSManager setMotionActivityTypeSatisfied:]";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, motionActivityTypeSatisfied, %@", (uint8_t *)&v8, 0x16u);
    }

    -[RTIntermittentGNSSManager metrics](self, "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processSignalSwitch:", 1);

    -[RTIntermittentGNSSManager _considerRegisteringForIntermittentGNSS](self, "_considerRegisteringForIntermittentGNSS");
  }
}

- (void)setAwayFromFrequentlyVisitedLOI:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  const __CFString *v6;
  void *v7;
  int v8;
  const char *v9;
  __int16 v10;
  const __CFString *v11;
  uint64_t v12;

  v3 = a3;
  v12 = *MEMORY[0x1E0C80C00];
  -[RTIntermittentGNSSManager _completeRemoteStatusChecklistItem:](self, "_completeRemoteStatusChecklistItem:", 2);
  if (self->_awayFromFrequentlyVisitedLOI != v3)
  {
    self->_awayFromFrequentlyVisitedLOI = v3;
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = CFSTR("NO");
      if (v3)
        v6 = CFSTR("YES");
      v8 = 136315394;
      v9 = "-[RTIntermittentGNSSManager setAwayFromFrequentlyVisitedLOI:]";
      v10 = 2112;
      v11 = v6;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, awayFromFrequentlyVisitedLOI, %@", (uint8_t *)&v8, 0x16u);
    }

    -[RTIntermittentGNSSManager metrics](self, "metrics");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "processSignalSwitch:", 4);

    -[RTIntermittentGNSSManager _considerRegisteringForIntermittentGNSS](self, "_considerRegisteringForIntermittentGNSS");
  }
}

- (void)setRegisteredForIntermittentGNSS:(BOOL)a3
{
  NSDate *v4;
  NSDate *lastRegisteredForIntermittentGNSSVariableFlipDate;
  NSObject *v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  void *v10;
  const __CFString *v11;
  const __CFString *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  const __CFString *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (self->_registeredForIntermittentGNSS != a3)
  {
    self->_registeredForIntermittentGNSS = a3;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
    lastRegisteredForIntermittentGNSSVariableFlipDate = self->_lastRegisteredForIntermittentGNSSVariableFlipDate;
    self->_lastRegisteredForIntermittentGNSSVariableFlipDate = v4;

    notify_post((const char *)objc_msgSend(CFSTR("RTIntermittentGNSSRegistrationStateDidChangeNotification"), "UTF8String"));
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      if (self->_registeredForIntermittentGNSS)
        v7 = CFSTR("YES");
      else
        v7 = CFSTR("NO");
      v14 = 136315394;
      v15 = "-[RTIntermittentGNSSManager setRegisteredForIntermittentGNSS:]";
      v16 = 2112;
      v17 = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, register for intermittent gnss, %@", (uint8_t *)&v14, 0x16u);
    }

    if (self->_registeredForIntermittentGNSS)
    {
      -[RTIntermittentGNSSManager _registerForRhythmicNonWakingLocation](self, "_registerForRhythmicNonWakingLocation");
    }
    else
    {
      -[RTIntermittentGNSSManager metrics](self, "metrics");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "getLastRegistrationDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "timeIntervalSinceDate:", v9);
      v12 = v11;

      _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = 136315394;
        v15 = "-[RTIntermittentGNSSManager setRegisteredForIntermittentGNSS:]";
        v16 = 2048;
        v17 = v12;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, intermittent gnss duration, %.2f", (uint8_t *)&v14, 0x16u);
      }

      -[RTIntermittentGNSSManager _unregisterForRhythmicNonWakingLocation](self, "_unregisterForRhythmicNonWakingLocation");
    }
  }
}

- (void)_checkWifiDenseArea
{
  void *v4;
  void *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[4];
  id v13[2];
  id location;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_initWeak(&location, self);
  -[RTIntermittentGNSSManager timerManager](self, "timerManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __48__RTIntermittentGNSSManager__checkWifiDenseArea__block_invoke;
  v12[3] = &unk_1E92A2718;
  objc_copyWeak(v13, &location);
  v13[1] = (id)a2;
  objc_msgSend(v4, "timerWithIdentifier:queue:handler:", CFSTR("RTIntermittentGNSSWifiScanTimer"), v5, v12);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTIntermittentGNSSManager setWifiScanTimer:](self, "setWifiScanTimer:", v6);

  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v16 = v8;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, scheduling active wifi scan", buf, 0xCu);

  }
  -[RTIntermittentGNSSManager wifiManager](self, "wifiManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "scheduleScanWithChannels:", &unk_1E932CB38);

  -[RTIntermittentGNSSManager setActiveWifiScan:](self, "setActiveWifiScan:", 1);
  -[RTIntermittentGNSSManager wifiScanTimer](self, "wifiScanTimer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fireAfterDelay:", 1.0);

  -[RTIntermittentGNSSManager wifiScanTimer](self, "wifiScanTimer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "resume");

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

void __48__RTIntermittentGNSSManager__checkWifiDenseArea__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "wifiScanTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(WeakRetained, "setWifiScanTimer:", 0);
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 40));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, active wifi scan timer expiry", (uint8_t *)&v6, 0xCu);

  }
  objc_msgSend(WeakRetained, "_processWifiScanResults");

}

- (BOOL)_frequentlyVisitedLocationOfInterest:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  double v24;
  uint64_t i;
  void *v26;
  void *v27;
  char v28;
  void *v29;
  double v30;
  double v31;
  uint64_t v32;
  NSObject *v33;
  void *v34;
  void *v36;
  void *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  double v49;
  __int16 v50;
  double v51;
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "location");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "location");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "horizontalUncertainty");
    v8 = v7;

    if (v8 <= 250.0)
    {
      objc_msgSend(v4, "visits");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "entryDate");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "dateByAddingTimeInterval:", -604800.0);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", v14);
      if (v15 <= 0.0)
      {
        v16 = objc_msgSend(v10, "count");

        if (v16)
        {
          objc_msgSend(v10, "firstObject");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "entryDate");
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v36 = v11;
          objc_msgSend(v11, "dateByAddingTimeInterval:", -2419200.0);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = 0u;
          v39 = 0u;
          v40 = 0u;
          v41 = 0u;
          v37 = v10;
          v20 = v10;
          v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
          if (v21)
          {
            v22 = v21;
            v23 = *(_QWORD *)v39;
            v24 = 1.0;
            do
            {
              for (i = 0; i != v22; ++i)
              {
                if (*(_QWORD *)v39 != v23)
                  objc_enumerationMutation(v20);
                v26 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
                objc_msgSend(v26, "entryDate");
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                v28 = objc_msgSend(v27, "isBeforeDate:", v19);

                if ((v28 & 1) == 0)
                {
                  objc_msgSend(v26, "entryDate");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "timeIntervalSinceDate:", v18);
                  v31 = v30;

                  if (v31 >= 14400.0)
                  {
                    v24 = v24 + 1.0;
                    objc_msgSend(v26, "entryDate");
                    v32 = objc_claimAutoreleasedReturnValue();

                    v18 = (void *)v32;
                  }
                }
              }
              v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v38, v52, 16);
            }
            while (v22);
          }
          else
          {
            v24 = 1.0;
          }

          _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
          v33 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            objc_msgSend(v19, "stringFromDate");
            v34 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 136316162;
            v43 = "-[RTIntermittentGNSSManager _frequentlyVisitedLocationOfInterest:]";
            v44 = 2112;
            v45 = v4;
            v46 = 2112;
            v47 = v34;
            v48 = 2048;
            v49 = v24 * 0.25;
            v50 = 2048;
            v51 = v24;
            _os_log_impl(&dword_1D1A22000, v33, OS_LOG_TYPE_INFO, "%s, loi, %@, lookbackWindowStartDate, %@, visitDensityPastFourWeeks, %.2f, numVisitsPastFourWeeks, %.2f", buf, 0x34u);

          }
          v9 = v24 * 0.25 >= 0.75;

          v11 = v36;
          v10 = v37;
          goto LABEL_23;
        }
      }
      else
      {

      }
      v9 = 0;
LABEL_23:

      goto LABEL_24;
    }
  }
  v9 = 0;
LABEL_24:

  return v9;
}

- (id)_locationsOfInterestNearLocation:(id)a3 error:(id *)a4
{
  id v6;
  dispatch_semaphore_t v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  dispatch_time_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  char v26;
  id v27;
  id v28;
  NSObject *v29;
  NSObject *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  void *v35;
  const char *aSelector;
  uint64_t v37;
  uint64_t v38;
  void (*v39)(uint64_t, void *, void *);
  void *v40;
  NSObject *v41;
  uint64_t *v42;
  uint64_t *v43;
  uint64_t v44;
  id *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;
  uint64_t v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, uint64_t);
  void (*v54)(uint64_t);
  id v55;
  _BYTE buf[12];
  __int16 v57;
  id v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  _QWORD v63[4];

  aSelector = a2;
  v63[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v50 = 0;
  v51 = &v50;
  v52 = 0x3032000000;
  v53 = __Block_byref_object_copy__158;
  v54 = __Block_byref_object_dispose__158;
  v55 = 0;
  v44 = 0;
  v45 = (id *)&v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy__158;
  v48 = __Block_byref_object_dispose__158;
  v49 = 0;
  v7 = dispatch_semaphore_create(0);
  -[RTIntermittentGNSSManager learnedLocationManager](self, "learnedLocationManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = MEMORY[0x1E0C809B0];
  v38 = 3221225472;
  v39 = __68__RTIntermittentGNSSManager__locationsOfInterestNearLocation_error___block_invoke;
  v40 = &unk_1E9296EE0;
  v42 = &v50;
  v43 = &v44;
  v9 = v7;
  v41 = v9;
  objc_msgSend(v8, "fetchLocationsOfInterestWithinDistance:ofLocation:handler:", v6, &v37, 1000.0);

  v10 = v9;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 3600000000000);
  if (!dispatch_semaphore_wait(v10, v12))
    goto LABEL_6;
  objc_msgSend(MEMORY[0x1E0C99D68], "now", aSelector, v37, v38, v39, v40);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "timeIntervalSinceDate:", v11);
  v15 = v14;
  v16 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_116);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "filteredArrayUsingPredicate:", v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "firstObject");
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "submitToCoreAnalytics:type:duration:", v20, 1, v15);
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_fault_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
  }

  v22 = (void *)MEMORY[0x1E0CB35C8];
  v63[0] = *MEMORY[0x1E0CB2D50];
  *(_QWORD *)buf = CFSTR("semaphore wait timeout");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, v63, 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (v24)
  {
    v25 = objc_retainAutorelease(v24);

    v26 = 0;
  }
  else
  {
LABEL_6:
    v25 = 0;
    v26 = 1;
  }

  v27 = v25;
  if ((v26 & 1) == 0)
    objc_storeStrong(v45 + 5, v25);
  v28 = v45[5];
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v29 = objc_claimAutoreleasedReturnValue();
  v30 = v29;
  if (v28)
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(aSelector);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "-[RTIntermittentGNSSManager _locationsOfInterestNearLocation:error:]";
      v57 = 2112;
      v58 = v35;
      _os_log_debug_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_DEBUG, "%s, error, %@", buf, 0x16u);

    }
    v31 = 0;
    if (a4)
      *a4 = objc_retainAutorelease(v45[5]);
  }
  else
  {
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      v32 = objc_msgSend((id)v51[5], "count");
      v33 = v51[5];
      *(_DWORD *)buf = 136315906;
      *(_QWORD *)&buf[4] = "-[RTIntermittentGNSSManager _locationsOfInterestNearLocation:error:]";
      v57 = 2112;
      v58 = v6;
      v59 = 2048;
      v60 = v32;
      v61 = 2112;
      v62 = v33;
      _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "%s, location, %@, loi count, %lu, LOIs, %@", buf, 0x2Au);
    }

    v31 = (id)v51[5];
  }

  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&v50, 8);

  return v31;
}

void __68__RTIntermittentGNSSManager__locationsOfInterestNearLocation_error___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v5 = a2;
  v6 = a3;
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v5;
  v12 = v5;

  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v6;
  v11 = v6;

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (BOOL)_motionActivityConditionsSatisifed:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (objc_msgSend(v4, "type") == 2 || objc_msgSend(v5, "type") == 3 || objc_msgSend(v5, "type") == 5)
      v6 = objc_msgSend(v5, "confidence") == 2
        || objc_msgSend(v5, "confidence") == 3
        || -[RTIntermittentGNSSManager motionActivityTypeSatisfied](self, "motionActivityTypeSatisfied")
        || -[RTIntermittentGNSSManager currentDominantMotionType](self, "currentDominantMotionType") == 6;
    else
      v6 = objc_msgSend(v5, "type") == 6
        && -[RTIntermittentGNSSManager motionActivityTypeSatisfied](self, "motionActivityTypeSatisfied");
    -[RTIntermittentGNSSManager setCurrentDominantMotionType:](self, "setCurrentDominantMotionType:", objc_msgSend(v5, "type"));
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)_processWifiScanResults
{
  _BOOL4 v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v3 = -[RTIntermittentGNSSManager _wifiDenseConditionsMet](self, "_wifiDenseConditionsMet");
  -[RTIntermittentGNSSManager accessPoints](self, "accessPoints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeAllObjects");

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIntermittentGNSSManager setLastDenseWifiScanResultDate:](self, "setLastDenseWifiScanResultDate:", v5);

  }
  -[RTIntermittentGNSSManager setCompletedInitialWifiScan:](self, "setCompletedInitialWifiScan:", 1);
  if (-[RTIntermittentGNSSManager activeWifiScan](self, "activeWifiScan"))
  {
    if (!v3)
      -[RTIntermittentGNSSManager setWifiLocationStarved:](self, "setWifiLocationStarved:", 1);
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = "-[RTIntermittentGNSSManager _processWifiScanResults]";
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%s, Cancelling wifi scan", (uint8_t *)&v8, 0xCu);
    }

    -[RTIntermittentGNSSManager wifiManager](self, "wifiManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cancelScan");

    -[RTIntermittentGNSSManager setActiveWifiScan:](self, "setActiveWifiScan:", 0);
  }
}

- (BOOL)_wifiDenseConditionsMet
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  uint64_t v8;
  uint64_t i;
  NSObject *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint8_t buf[4];
  void *v22;
  __int16 v23;
  const __CFString *v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  void *v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  -[RTIntermittentGNSSManager accessPoints](self, "accessPoints", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v8)
          objc_enumerationMutation(v4);
        if (objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * i), "rssi") > -96)
          ++v7;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v31, 16);
    }
    while (v6);
  }
  else
  {
    v7 = 0;
  }

  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7 <= 5)
      v12 = CFSTR("NO");
    else
      v12 = CFSTR("YES");
    -[RTIntermittentGNSSManager accessPoints](self, "accessPoints");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "count");
    -[RTIntermittentGNSSManager accessPoints](self, "accessPoints");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413314;
    v22 = v11;
    v23 = 2112;
    v24 = v12;
    v25 = 2048;
    v26 = v7;
    v27 = 2048;
    v28 = v14;
    v29 = 2112;
    v30 = v15;
    _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, wifiDense, %@, strong access points count, %lu/%lu, accessPoints, %@", buf, 0x34u);

  }
  return v7 > 5;
}

- (void)onDailyMetricsNotification:(id)a3
{
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  -[RTIntermittentGNSSManager metrics](self, "metrics", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RTIntermittentGNSSManager_onDailyMetricsNotification___block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v5, block);

}

void __56__RTIntermittentGNSSManager_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "metrics");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "submitDailyMetricsToCoreAnalytics");

}

- (void)onMotionActivityManagerNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  RTIntermittentGNSSManager *v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __65__RTIntermittentGNSSManager_onMotionActivityManagerNotification___block_invoke;
  v11 = &unk_1E9297540;
  v12 = v4;
  v13 = self;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v8);
  -[RTNotifier queue](self, "queue", v8, v9, v10, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

}

void __65__RTIntermittentGNSSManager_onMotionActivityManagerNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v13;
  int v14;
  const char *v15;
  __int16 v16;
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  v5 = *(void **)(a1 + 32);
  if (v4)
  {
    v6 = objc_msgSend(v5, "settledState");
    if (v6 == 1)
    {
      v7 = *(void **)(a1 + 40);
      v8 = 1;
      goto LABEL_11;
    }
    if (v6 == 2)
    {
      v7 = *(void **)(a1 + 40);
      v8 = 0;
LABEL_11:
      objc_msgSend(v7, "setUnsettled:", v8);
    }
  }
  else
  {
    objc_msgSend(v5, "name");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTMotionActivityManagerNotificationDominantMotionActivityChange, "notificationName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v9, "isEqualToString:", v10);

    if (v11)
    {
      objc_msgSend(*(id *)(a1 + 32), "dominantMotionActivity");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v14 = 136315394;
        v15 = "-[RTIntermittentGNSSManager onMotionActivityManagerNotification:]_block_invoke";
        v16 = 2112;
        v17 = v12;
        _os_log_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_INFO, "%s, dominantMotionActivityNotification activity, %@", (uint8_t *)&v14, 0x16u);
      }

      objc_msgSend(*(id *)(a1 + 40), "setMotionActivityTypeSatisfied:", objc_msgSend(*(id *)(a1 + 40), "_motionActivityConditionsSatisifed:", v12));
    }
  }
}

- (void)onVehicleEventNotification:(id)a3
{
  id v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(uint64_t);
  void *v11;
  id v12;
  RTIntermittentGNSSManager *v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __56__RTIntermittentGNSSManager_onVehicleEventNotification___block_invoke;
  v11 = &unk_1E9297540;
  v12 = v4;
  v13 = self;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v8);
  -[RTNotifier queue](self, "queue", v8, v9, v10, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

}

void __56__RTIntermittentGNSSManager_onVehicleEventNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  char v14;
  int v15;
  const char *v16;
  __int16 v17;
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTVehicleEventNotification, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    v5 = *(id *)(a1 + 32);
    -[NSObject vehicleEvents](v5, "vehicleEvents");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectAtIndexedSubscript:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "date");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v8, "stringFromDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315394;
      v16 = "-[RTIntermittentGNSSManager onVehicleEventNotification:]_block_invoke";
      v17 = 2112;
      v18 = v10;
      _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%s, received vehicle event with date, %@, ", (uint8_t *)&v15, 0x16u);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "timeIntervalSinceDate:", v8);
    if (v12 <= 600.0)
    {
      v14 = objc_msgSend(*(id *)(a1 + 40), "wifiLocationStarved");

      if ((v14 & 1) == 0)
        objc_msgSend(*(id *)(a1 + 40), "_checkWifiDenseArea");
    }
    else
    {

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 136315394;
      v16 = "-[RTIntermittentGNSSManager onVehicleEventNotification:]_block_invoke";
      v17 = 2112;
      v18 = v13;
      _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, notification not supported, %@", (uint8_t *)&v15, 0x16u);

    }
  }

}

- (void)onWifiScanResultsNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  RTIntermittentGNSSManager *v9;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __59__RTIntermittentGNSSManager_onWifiScanResultsNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __59__RTIntermittentGNSSManager_onWifiScanResultsNotification___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "scanResults");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "accessPoints");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "addObjectsFromArray:", v3);

    objc_msgSend(*(id *)(a1 + 40), "_processWifiScanResults");
  }
}

+ (id)overrideStateToString:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("RTIntermittentGNSSManagerRegistrationOverrideUnsupported");
  else
    return off_1E92A5008[a3];
}

- (void)fetchIntermittentGNSSRegistrationStateWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD v7[5];
  NSObject *v8;
  uint8_t buf[16];

  v4 = a3;
  if (v4)
  {
    -[RTNotifier queue](self, "queue");
    v5 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __79__RTIntermittentGNSSManager_fetchIntermittentGNSSRegistrationStateWithHandler___block_invoke;
    v7[3] = &unk_1E9297678;
    v7[4] = self;
    v8 = v4;
    dispatch_async(v5, v7);

    v6 = v8;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }
  }

}

uint64_t __79__RTIntermittentGNSSManager_fetchIntermittentGNSSRegistrationStateWithHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(unsigned __int8 *)(*(_QWORD *)(a1 + 32) + 34), 0);
}

- (void)updateIntermittentGNSSRegistrationOverrideState:(unint64_t)a3 handler:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  NSObject *v11;
  NSObject *v12;
  _QWORD block[5];
  id v14;
  unint64_t v15;
  uint8_t buf[8];
  uint64_t v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  if (v6)
  {
    if (a3 < 3)
    {
      -[RTNotifier queue](self, "queue");
      v12 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __85__RTIntermittentGNSSManager_updateIntermittentGNSSRegistrationOverrideState_handler___block_invoke;
      block[3] = &unk_1E9298E88;
      block[4] = self;
      v15 = a3;
      v14 = v6;
      dispatch_async(v12, block);

    }
    else
    {
      v7 = (void *)MEMORY[0x1E0CB35C8];
      v8 = *MEMORY[0x1E0D18598];
      v17 = *MEMORY[0x1E0CB2D50];
      v18[0] = CFSTR("intermittent gnss override state out of range.");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "errorWithDomain:code:userInfo:", v8, 7, v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      (*((void (**)(id, void *))v6 + 2))(v6, v10);

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

uint64_t __85__RTIntermittentGNSSManager_updateIntermittentGNSSRegistrationOverrideState_handler___block_invoke(uint64_t a1)
{
  void *v2;
  int v3;

  objc_msgSend(*(id *)(a1 + 32), "platform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "internalInstall");

  if (v3)
  {
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 240) = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "_considerRegisteringForIntermittentGNSS");
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __64__RTIntermittentGNSSManager__initializeWifiLocationStarvedTimer__block_invoke(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  id WeakRetained;
  int v9;
  const char *v10;
  __int16 v11;
  const __CFString *v12;
  __int16 v13;
  uint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v2, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 32));
    v5 = v4;
    objc_msgSend(*(id *)(a1 + 40), "lastWifiLocationDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "timeIntervalSinceDate:", v6);
    v9 = 136315906;
    v10 = "-[RTIntermittentGNSSManager _initializeWifiLocationStarvedTimer]_block_invoke";
    v11 = 2112;
    v12 = CFSTR("RTIntermittentGNSSLocationStarvedTimer");
    v13 = 2048;
    v14 = v5;
    v15 = 2048;
    v16 = v7;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, location starved timer fired, timerIdentifier, %@,  %.2f since created, %.2f since lastWifiLocationDate", (uint8_t *)&v9, 0x2Au);

  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_onLocationStarvedTimerExpiry");

}

- (void)_onLocationStarvedTimerExpiry
{
  -[RTIntermittentGNSSManager setWifiLocationStarved:](self, "setWifiLocationStarved:", 1);
}

- (BOOL)_dutyCyclingConditionMet
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *v8;
  _BOOL4 v9;
  const char *v10;
  void *v11;
  void *v12;
  char v13;
  NSObject *v14;
  void *v15;
  void *v16;
  char v17;
  NSObject *v18;
  void *v19;
  void *v20;
  char v21;
  NSObject *v22;
  void *v23;
  void *v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  uint32_t v28;
  const __CFString *v29;
  const __CFString *v30;
  const __CFString *v31;
  _BOOL4 awayFromFrequentlyVisitedLOI;
  const __CFString *v33;
  _BOOL4 wifiLocationStarved;
  const __CFString *v35;
  const __CFString *v36;
  int v38;
  const char *v39;
  __int16 v40;
  const __CFString *v41;
  __int16 v42;
  const __CFString *v43;
  __int16 v44;
  const __CFString *v45;
  __int16 v46;
  const __CFString *v47;
  __int16 v48;
  const __CFString *v49;
  __int16 v50;
  const __CFString *v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  -[RTIntermittentGNSSManager platform](self, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "internalInstall");

  if (!v4)
    goto LABEL_31;
  -[RTIntermittentGNSSManager defaultsManager](self, "defaultsManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSBypassAllSignals"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

    goto LABEL_5;
  }
  v7 = _os_feature_enabled_impl();

  if ((v7 & 1) != 0)
  {
LABEL_5:
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v8 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v38 = 136315138;
      v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
      v10 = "%s, defaults override: bypassing all signals, should register for intermittent gnss";
LABEL_34:
      v27 = v8;
      v28 = 12;
LABEL_35:
      _os_log_impl(&dword_1D1A22000, v27, OS_LOG_TYPE_INFO, v10, (uint8_t *)&v38, v28);
      goto LABEL_65;
    }
    goto LABEL_65;
  }
  -[RTIntermittentGNSSManager defaultsManager](self, "defaultsManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSBypassDominantMotionCheck"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
  {

  }
  else
  {
    v13 = _os_feature_enabled_impl();

    if ((v13 & 1) == 0)
      goto LABEL_13;
  }
  self->_motionActivityTypeSatisfied = 1;
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v38 = 136315138;
    v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
    _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "%s, defaults override: bypassing dominant motion check", (uint8_t *)&v38, 0xCu);
  }

LABEL_13:
  -[RTIntermittentGNSSManager defaultsManager](self, "defaultsManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSBypassSettledStateCheck"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
  {

  }
  else
  {
    v17 = _os_feature_enabled_impl();

    if ((v17 & 1) == 0)
      goto LABEL_19;
  }
  self->_unsettled = 1;
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v38 = 136315138;
    v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
    _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "%s, defaults override: bypassing settled state check", (uint8_t *)&v38, 0xCu);
  }

LABEL_19:
  -[RTIntermittentGNSSManager defaultsManager](self, "defaultsManager");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSBypassFrequentLOICheck"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (v20)
  {

LABEL_22:
    self->_awayFromFrequentlyVisitedLOI = 1;
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      v38 = 136315138;
      v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
      _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "%s, defaults override: bypassing frequent LOI check", (uint8_t *)&v38, 0xCu);
    }

    goto LABEL_25;
  }
  v21 = _os_feature_enabled_impl();

  if ((v21 & 1) != 0)
    goto LABEL_22;
LABEL_25:
  -[RTIntermittentGNSSManager defaultsManager](self, "defaultsManager");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "objectForKey:", CFSTR("RTDefaultsIntermittentGNSSBypassWifiAvailabilityCheck"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {

  }
  else
  {
    v25 = _os_feature_enabled_impl();

    if ((v25 & 1) == 0)
      goto LABEL_31;
  }
  self->_wifiLocationStarved = 1;
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v38 = 136315138;
    v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
    _os_log_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_INFO, "%s, defaults override: bypassing wifi availability check", (uint8_t *)&v38, 0xCu);
  }

LABEL_31:
  if (-[RTIntermittentGNSSManager intermittentGNSSOverrideState](self, "intermittentGNSSOverrideState") == 1)
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v8 = objc_claimAutoreleasedReturnValue();
    LOBYTE(v9) = 1;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v38 = 136315138;
      v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
      v10 = "%s, ignoring conditions, user set intermittent gnss to ON until further user action";
      goto LABEL_34;
    }
  }
  else if (-[RTIntermittentGNSSManager intermittentGNSSOverrideState](self, "intermittentGNSSOverrideState") == 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v38 = 136315138;
      v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%s, ignoring conditions, user set intermittent gnss to OFF until further user action", (uint8_t *)&v38, 0xCu);
    }
    LOBYTE(v9) = 0;
  }
  else
  {
    v9 = self->_motionActivityTypeSatisfied
      && self->_unsettled
      && self->_signalEnvironmentAtRisk
      && self->_awayFromFrequentlyVisitedLOI
      && self->_wifiLocationStarved;
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v29 = CFSTR("NO");
      if (v9)
        v30 = CFSTR("YES");
      else
        v30 = CFSTR("NO");
      if (self->_motionActivityTypeSatisfied)
        v31 = CFSTR("YES");
      else
        v31 = CFSTR("NO");
      awayFromFrequentlyVisitedLOI = self->_awayFromFrequentlyVisitedLOI;
      if (self->_unsettled)
        v33 = CFSTR("YES");
      else
        v33 = CFSTR("NO");
      wifiLocationStarved = self->_wifiLocationStarved;
      if (self->_signalEnvironmentAtRisk)
        v35 = CFSTR("YES");
      else
        v35 = CFSTR("NO");
      v38 = 136316674;
      v39 = "-[RTIntermittentGNSSManager _dutyCyclingConditionMet]";
      if (awayFromFrequentlyVisitedLOI)
        v36 = CFSTR("YES");
      else
        v36 = CFSTR("NO");
      v40 = 2112;
      if (wifiLocationStarved)
        v29 = CFSTR("YES");
      v41 = v30;
      v42 = 2112;
      v43 = v31;
      v44 = 2112;
      v45 = v33;
      v46 = 2112;
      v47 = v35;
      v48 = 2112;
      v49 = v36;
      v50 = 2112;
      v51 = v29;
      v10 = "%s, conditions satisfied, %@, motionActivityTypeSatisfied, %@, unsettled, %@, signalEnvironmentAtRisk, %@, a"
            "wayFromFrequentlyVisitedLOI, %@, locationStarved, %@";
      v27 = v8;
      v28 = 72;
      goto LABEL_35;
    }
  }
LABEL_65:

  return v9;
}

- (void)_considerRegisteringForIntermittentGNSS
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  RTIntermittentGNSSManager *v22;
  id v23;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  -[RTIntermittentGNSSManager conditionCheckTimer](self, "conditionCheckTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTIntermittentGNSSManager lastRegisteredForIntermittentGNSSVariableFlipDate](self, "lastRegisteredForIntermittentGNSSVariableFlipDate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;

    v8 = fmax(v7, 0.0);
    if (v8 >= 120.0)
    {
      -[RTIntermittentGNSSManager setRegisteredForIntermittentGNSS:](self, "setRegisteredForIntermittentGNSS:", -[RTIntermittentGNSSManager _dutyCyclingConditionMet](self, "_dutyCyclingConditionMet"));
    }
    else
    {
      v9 = fmax(120.0 - v8, 1.0);
      _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        -[RTIntermittentGNSSManager lastRegisteredForIntermittentGNSSVariableFlipDate](self, "lastRegisteredForIntermittentGNSSVariableFlipDate");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringFromDate");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 136315906;
        v25 = "-[RTIntermittentGNSSManager _considerRegisteringForIntermittentGNSS]";
        v26 = 2048;
        v27 = 0x405E000000000000;
        v28 = 2112;
        v29 = v12;
        v30 = 2048;
        v31 = v9;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, minimum required time for gnss registration flip not met, RTIntermittentGNSSDutyCycleMinFlipTime, %.2f, lastDutyCyclingConditionCheckDate, %@, time until next allowed flip, %.2f", buf, 0x2Au);

      }
      objc_initWeak((id *)buf, self);
      -[RTIntermittentGNSSManager timerManager](self, "timerManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTNotifier queue](self, "queue");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = MEMORY[0x1E0C809B0];
      v19 = 3221225472;
      v20 = __68__RTIntermittentGNSSManager__considerRegisteringForIntermittentGNSS__block_invoke;
      v21 = &unk_1E9298210;
      objc_copyWeak(&v23, (id *)buf);
      v22 = self;
      objc_msgSend(v13, "timerWithIdentifier:queue:handler:", CFSTR("RTIntermittentGNSSConditionCheckTimer"), v14, &v18);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTIntermittentGNSSManager setConditionCheckTimer:](self, "setConditionCheckTimer:", v15, v18, v19, v20, v21);

      -[RTIntermittentGNSSManager conditionCheckTimer](self, "conditionCheckTimer");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "fireAfterDelay:", v9);

      -[RTIntermittentGNSSManager conditionCheckTimer](self, "conditionCheckTimer");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "resume");

      objc_destroyWeak(&v23);
      objc_destroyWeak((id *)buf);
    }
  }
}

void __68__RTIntermittentGNSSManager__considerRegisteringForIntermittentGNSS__block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  const __CFString *v5;
  int v6;
  const char *v7;
  __int16 v8;
  const __CFString *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "conditionCheckTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(WeakRetained, "setConditionCheckTimer:", 0);
  objc_msgSend(*(id *)(a1 + 32), "setRegisteredForIntermittentGNSS:", objc_msgSend(WeakRetained, "_dutyCyclingConditionMet"));
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 34))
      v5 = CFSTR("YES");
    else
      v5 = CFSTR("NO");
    v6 = 136315394;
    v7 = "-[RTIntermittentGNSSManager _considerRegisteringForIntermittentGNSS]_block_invoke";
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%s, condition check timer expired and conditions for intermittentGNSS registration checked, registeredForIntermittentGNSS, %@", (uint8_t *)&v6, 0x16u);
  }

}

- (void)_registerForRhythmicNonWakingLocation
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[RTIntermittentGNSSManager platformSupported](self, "platformSupported"))
  {
    -[RTIntermittentGNSSManager locationManager](self, "locationManager");
    v3 = objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyRhythmicNonWaking, "notificationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject addObserver:selector:name:](v3, "addObserver:selector:name:", self, sel_onNoOpLocationNotification_, v4);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[RTIntermittentGNSSManager _registerForRhythmicNonWakingLocation]";
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, platform not supported, skipping actual registration for rhythmic location", (uint8_t *)&v6, 0xCu);
    }
  }

  -[RTIntermittentGNSSManager metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateMetricsForKey:", CFSTR("register"));

}

- (void)_unregisterForRhythmicNonWakingLocation
{
  NSObject *v3;
  void *v4;
  void *v5;
  int v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[RTIntermittentGNSSManager platformSupported](self, "platformSupported"))
  {
    -[RTIntermittentGNSSManager locationManager](self, "locationManager");
    v3 = objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyRhythmicNonWaking, "notificationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject removeObserver:fromNotification:](v3, "removeObserver:fromNotification:", self, v4);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v6 = 136315138;
      v7 = "-[RTIntermittentGNSSManager _unregisterForRhythmicNonWakingLocation]";
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, platform not supported, skipping actual unregistration for rhythmic location since no registration occurred", (uint8_t *)&v6, 0xCu);
    }
  }

  -[RTIntermittentGNSSManager metrics](self, "metrics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "updateMetricsForKey:", CFSTR("unregister"));

}

- (void)fetchRemoteStatusWithHandler:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  _QWORD block[5];
  id v13;
  SEL v14;
  _QWORD v15[5];
  id v16;
  uint8_t buf[16];

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v7 = MEMORY[0x1E0C809B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __58__RTIntermittentGNSSManager_fetchRemoteStatusWithHandler___block_invoke;
    v15[3] = &unk_1E9297650;
    v15[4] = self;
    v16 = v5;
    v8 = (void *)MEMORY[0x1D8232094](v15);
    -[RTNotifier queue](self, "queue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = v7;
    block[1] = 3221225472;
    block[2] = __58__RTIntermittentGNSSManager_fetchRemoteStatusWithHandler___block_invoke_82;
    block[3] = &unk_1E9298E88;
    block[4] = self;
    v13 = v8;
    v14 = a2;
    v10 = v8;
    dispatch_async(v9, block);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler", buf, 2u);
    }

  }
}

uint64_t __58__RTIntermittentGNSSManager_fetchRemoteStatusWithHandler___block_invoke(uint64_t a1)
{
  int v2;
  NSObject *v3;
  const char *v4;
  const char *v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  char v12;
  _BOOL4 v13;
  char v14;
  int v16;
  const char *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "remoteStatusChecklist") != 15)
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    v16 = 136315138;
    v17 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
    v5 = "%s, checklist not yet complete, status unknown";
LABEL_7:
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, v5, (uint8_t *)&v16, 0xCu);
    goto LABEL_32;
  }
  v2 = objc_msgSend(*(id *)(a1 + 32), "currentSignalEnvironment");
  if ((v2 - 2) < 3
    || (v2 != 1 ? (v6 = v2 == 6) : (v6 = 1),
        !v6 && (v14 = objc_msgSend(*(id *)(a1 + 32), "signalEnvironmentAtRisk"), (v14 & 1) == 0)))
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    v16 = 136315138;
    v17 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
    v4 = "%s, signal environment does not appear to be remote, status accessible";
LABEL_31:
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, v4, (uint8_t *)&v16, 0xCu);
    goto LABEL_32;
  }
  if ((objc_msgSend(*(id *)(a1 + 32), "wifiLocationStarved") & 1) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    v16 = 136315138;
    v17 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
    v4 = "%s, recent WiFi location, status accessible";
    goto LABEL_31;
  }
  objc_msgSend(*(id *)(a1 + 32), "lastDenseWifiScanResultDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    v16 = 136315138;
    v17 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
    v5 = "%s, no recent dense WiFi scan result, status unknown";
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "lastDenseWifiScanResultDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "timeIntervalSinceDate:", v9);
  v11 = v10;

  if (v11 <= 840.0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v3 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      goto LABEL_32;
    v16 = 136315138;
    v17 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
    v4 = "%s, dense WiFi, status accessible";
    goto LABEL_31;
  }
  v12 = objc_msgSend(*(id *)(a1 + 32), "awayFromFrequentlyVisitedLOI");
  _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
  v3 = objc_claimAutoreleasedReturnValue();
  v13 = os_log_type_enabled(v3, OS_LOG_TYPE_INFO);
  if ((v12 & 1) == 0)
  {
    if (!v13)
      goto LABEL_32;
    v16 = 136315138;
    v17 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
    v4 = "%s, near loi, status accessible";
    goto LABEL_31;
  }
  if (v13)
  {
    v16 = 136315138;
    v17 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, status remote", (uint8_t *)&v16, 0xCu);
  }
LABEL_32:

  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58__RTIntermittentGNSSManager_fetchRemoteStatusWithHandler___block_invoke_82(uint64_t a1)
{
  uint64_t v2;
  RTInvocationDispatcher *v3;
  const __CFString *v4;
  RTInvocationDispatcher *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  objc_class *v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  uint8_t buf[4];
  const char *v18;
  __int16 v19;
  const __CFString *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  if (objc_msgSend(*(id *)(a1 + 32), "remoteStatusChecklist") == 15)
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "remoteStatusDispatcher");
    v2 = objc_claimAutoreleasedReturnValue();
    if (v2)
    {
      v3 = (RTInvocationDispatcher *)v2;
      v4 = CFSTR("NO");
    }
    else
    {
      v5 = [RTInvocationDispatcher alloc];
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[RTInvocationDispatcher initWithQueue:](v5, "initWithQueue:", v6);

      objc_msgSend(*(id *)(a1 + 32), "setRemoteStatusDispatcher:", v3);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __58__RTIntermittentGNSSManager_fetchRemoteStatusWithHandler___block_invoke_2;
      v16[3] = &unk_1E92977B8;
      v16[4] = *(_QWORD *)(a1 + 32);
      v7 = (void *)MEMORY[0x1D8232094](v16);
      objc_msgSend(*(id *)(a1 + 32), "timerManager");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "queue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "timerWithIdentifier:queue:handler:", CFSTR("RTIntermittentGNSSFetchRemoteStatusTimeoutTimer"), v9, v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v10, "fireAfterDelay:", 660.0);
      objc_msgSend(v10, "resume");
      objc_msgSend(*(id *)(a1 + 32), "setRemoteStatusTimeoutTimer:", v10);

      v4 = CFSTR("YES");
    }
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v18 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke";
      v19 = 2112;
      v20 = v4;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%s, enqueueing handler, created dispatcher? %@", buf, 0x16u);
    }

    v12 = *(_QWORD *)(a1 + 40);
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromSelector(*(SEL *)(a1 + 48));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTInvocationDispatcher enqueueBlock:description:](v3, "enqueueBlock:description:", v12, CFSTR("%@-%@"), v14, v15);

  }
}

void __58__RTIntermittentGNSSManager_fetchRemoteStatusWithHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  int v5;
  const char *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "remoteStatusDispatcher");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      v5 = 136315138;
      v6 = "-[RTIntermittentGNSSManager fetchRemoteStatusWithHandler:]_block_invoke_2";
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, timing out enqueued handlers", (uint8_t *)&v5, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "remoteStatusDispatcher");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dispatchPendingInvocations");

    objc_msgSend(*(id *)(a1 + 32), "setRemoteStatusDispatcher:", 0);
    objc_msgSend(*(id *)(a1 + 32), "setRemoteStatusTimeoutTimer:", 0);
  }
}

- (void)_completeRemoteStatusChecklistItem:(unint64_t)a3
{
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  NSObject *v10;
  int v11;
  const char *v12;
  __int16 v13;
  unint64_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if ((a3 & ~-[RTIntermittentGNSSManager remoteStatusChecklist](self, "remoteStatusChecklist")) != 0)
  {
    -[RTIntermittentGNSSManager setRemoteStatusChecklist:](self, "setRemoteStatusChecklist:", -[RTIntermittentGNSSManager remoteStatusChecklist](self, "remoteStatusChecklist") | a3);
    if (-[RTIntermittentGNSSManager remoteStatusChecklist](self, "remoteStatusChecklist") == 15)
    {
      _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v11 = 136315394;
        v12 = "-[RTIntermittentGNSSManager _completeRemoteStatusChecklistItem:]";
        v13 = 2048;
        v14 = a3;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%s, completed %lu which completes the checklist", (uint8_t *)&v11, 0x16u);
      }

      -[RTIntermittentGNSSManager remoteStatusDispatcher](self, "remoteStatusDispatcher");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        -[RTIntermittentGNSSManager remoteStatusTimeoutTimer](self, "remoteStatusTimeoutTimer");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "invalidate");

        -[RTIntermittentGNSSManager setRemoteStatusTimeoutTimer:](self, "setRemoteStatusTimeoutTimer:", 0);
        -[RTIntermittentGNSSManager remoteStatusDispatcher](self, "remoteStatusDispatcher");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "dispatchPendingInvocations");

        -[RTIntermittentGNSSManager setRemoteStatusDispatcher:](self, "setRemoteStatusDispatcher:", 0);
      }
    }
    else
    {
      v9 = -[RTIntermittentGNSSManager remoteStatusChecklist](self, "remoteStatusChecklist");
      _rt_log_facility_get_os_log(RTLogFacilityIntermittentGNSS);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = 136315650;
        v12 = "-[RTIntermittentGNSSManager _completeRemoteStatusChecklistItem:]";
        v13 = 2048;
        v14 = a3;
        v15 = 2048;
        v16 = ~v9 & 0xF;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%s, completed %lu, still waiting on %lu", (uint8_t *)&v11, 0x20u);
      }

    }
  }
}

- (unint64_t)remoteStatusChecklist
{
  return self->_remoteStatusChecklist;
}

- (void)setRemoteStatusChecklist:(unint64_t)a3
{
  self->_remoteStatusChecklist = a3;
}

- (RTInvocationDispatcher)remoteStatusDispatcher
{
  return self->_remoteStatusDispatcher;
}

- (void)setRemoteStatusDispatcher:(id)a3
{
  objc_storeStrong((id *)&self->_remoteStatusDispatcher, a3);
}

- (RTTimer)remoteStatusTimeoutTimer
{
  return self->_remoteStatusTimeoutTimer;
}

- (void)setRemoteStatusTimeoutTimer:(id)a3
{
  objc_storeStrong((id *)&self->_remoteStatusTimeoutTimer, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (RTPlatform)platform
{
  return self->_platform;
}

- (void)setPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_platform, a3);
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (RTVehicleLocationProvider)vehicleLocationProvider
{
  return self->_vehicleLocationProvider;
}

- (void)setVehicleLocationProvider:(id)a3
{
  objc_storeStrong((id *)&self->_vehicleLocationProvider, a3);
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManager, a3);
}

- (RTTimer)conditionCheckTimer
{
  return self->_conditionCheckTimer;
}

- (void)setConditionCheckTimer:(id)a3
{
  objc_storeStrong((id *)&self->_conditionCheckTimer, a3);
}

- (RTTimer)wifiScanTimer
{
  return self->_wifiScanTimer;
}

- (void)setWifiScanTimer:(id)a3
{
  objc_storeStrong((id *)&self->_wifiScanTimer, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (NSDate)lastRegisteredForIntermittentGNSSVariableFlipDate
{
  return self->_lastRegisteredForIntermittentGNSSVariableFlipDate;
}

- (void)setLastRegisteredForIntermittentGNSSVariableFlipDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastRegisteredForIntermittentGNSSVariableFlipDate, a3);
}

- (void)setLastLOINearbyCheckDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastLOINearbyCheckDate, a3);
}

- (NSDate)lastSettledStateChangeDate
{
  return self->_lastSettledStateChangeDate;
}

- (void)setLastSettledStateChangeDate:(id)a3
{
  objc_storeStrong((id *)&self->_lastSettledStateChangeDate, a3);
}

- (NSDate)lastDenseWifiScanResultDate
{
  return self->_lastDenseWifiScanResultDate;
}

- (BOOL)awayFromFrequentlyVisitedLOI
{
  return self->_awayFromFrequentlyVisitedLOI;
}

- (BOOL)motionActivityTypeSatisfied
{
  return self->_motionActivityTypeSatisfied;
}

- (BOOL)registeredForIntermittentGNSS
{
  return self->_registeredForIntermittentGNSS;
}

- (BOOL)settledStateLOIVerified
{
  return self->_settledStateLOIVerified;
}

- (void)setSettledStateLOIVerified:(BOOL)a3
{
  self->_settledStateLOIVerified = a3;
}

- (BOOL)signalEnvironmentAtRisk
{
  return self->_signalEnvironmentAtRisk;
}

- (BOOL)unsettled
{
  return self->_unsettled;
}

- (BOOL)completedInitialWifiScan
{
  return self->_completedInitialWifiScan;
}

- (BOOL)wifiLocationStarved
{
  return self->_wifiLocationStarved;
}

- (BOOL)activeWifiScan
{
  return self->_activeWifiScan;
}

- (void)setActiveWifiScan:(BOOL)a3
{
  self->_activeWifiScan = a3;
}

- (double)totalDailyDuration
{
  return self->_totalDailyDuration;
}

- (void)setTotalDailyDuration:(double)a3
{
  self->_totalDailyDuration = a3;
}

- (int)currentSignalEnvironment
{
  return self->_currentSignalEnvironment;
}

- (NSMutableArray)accessPoints
{
  return self->_accessPoints;
}

- (void)setAccessPoints:(id)a3
{
  objc_storeStrong((id *)&self->_accessPoints, a3);
}

- (unint64_t)currentDominantMotionType
{
  return self->_currentDominantMotionType;
}

- (void)setCurrentDominantMotionType:(unint64_t)a3
{
  self->_currentDominantMotionType = a3;
}

- (unint64_t)intermittentGNSSOverrideState
{
  return self->_intermittentGNSSOverrideState;
}

- (void)setIntermittentGNSSOverrideState:(unint64_t)a3
{
  self->_intermittentGNSSOverrideState = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessPoints, 0);
  objc_storeStrong((id *)&self->_lastDenseWifiScanResultDate, 0);
  objc_storeStrong((id *)&self->_lastWifiLocationDate, 0);
  objc_storeStrong((id *)&self->_lastSettledStateChangeDate, 0);
  objc_storeStrong((id *)&self->_lastLOINearbyCheckDate, 0);
  objc_storeStrong((id *)&self->_lastRegisteredForIntermittentGNSSVariableFlipDate, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_wifiScanTimer, 0);
  objc_storeStrong((id *)&self->_wifiLocationStarvedTimer, 0);
  objc_storeStrong((id *)&self->_conditionCheckTimer, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_vehicleLocationProvider, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_storeStrong((id *)&self->_remoteStatusTimeoutTimer, 0);
  objc_storeStrong((id *)&self->_remoteStatusDispatcher, 0);
}

@end
