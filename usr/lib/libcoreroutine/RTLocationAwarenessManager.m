@implementation RTLocationAwarenessManager

void __60__RTLocationAwarenessManager_onLeechedLocationNotification___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[16];
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "leechedLocations");
    v2 = objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v3 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v3)
    {
      v4 = v3;
      v5 = 0;
      v6 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v4; ++i)
        {
          if (*(_QWORD *)v22 != v6)
            objc_enumerationMutation(v2);
          v8 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 40), "validLocation:", v8)
            && (!v5
             || (objc_msgSend(v5, "timestamp"),
                 v9 = (void *)objc_claimAutoreleasedReturnValue(),
                 objc_msgSend(v8, "timestamp"),
                 v10 = (void *)objc_claimAutoreleasedReturnValue(),
                 v11 = objc_msgSend(v9, "compare:", v10),
                 v10,
                 v9,
                 v11 == -1)))
          {
            v13 = v8;

            v5 = v13;
          }
          else
          {
            objc_msgSend(*(id *)(a1 + 40), "activeOnset");
            v12 = (void *)objc_claimAutoreleasedReturnValue();
            if (v12 && (objc_msgSend(*(id *)(a1 + 40), "activeRequestCoarseLocationReceived") & 1) == 0)
            {
              v14 = objc_msgSend(*(id *)(a1 + 40), "coarseLocation:", v8);

              if (v14)
                objc_msgSend(*(id *)(a1 + 40), "setActiveRequestCoarseLocationReceived:", 1);
            }
            else
            {

            }
          }
        }
        v4 = -[NSObject countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v4);
      objc_msgSend(*(id *)(a1 + 40), "updateLocationAwarenessHistogramsWithLocations:", v2);
      if (v5)
      {
        objc_msgSend(*(id *)(a1 + 40), "lastValidLocation");
        v15 = objc_claimAutoreleasedReturnValue();
        if (!v15)
          goto LABEL_21;
        v16 = (void *)v15;
        objc_msgSend(v5, "timestamp");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 40), "lastValidLocation");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "timestamp");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v17, "compare:", v19);

        if (v20 == 1)
LABEL_21:
          objc_msgSend(*(id *)(a1 + 40), "setLastValidLocation:", v5);
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 40), "updateLocationAwarenessHistogramsWithLocations:", v2);
      v5 = 0;
    }

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: [notification isKindOfClass:[RTLocationManagerNotificationLocationsLeeched class]]", buf, 2u);
    }
  }

}

- (CLLocation)lastValidLocation
{
  return self->_lastValidLocation;
}

- (void)updateLocationAwarenessHistogramsWithLocations:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  id obj;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  obj = a3;
  v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
  if (v4)
  {
    v5 = v4;
    v60 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v62 != v60)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v7, "timestamp");
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
        {
          v9 = (void *)objc_opt_class();
          objc_msgSend(v7, "timestamp");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = objc_msgSend(v9, "localHourFromTimestamp:", v10);

          objc_msgSend(v7, "horizontalAccuracy");
          if (v12 > 0.0)
          {
            v13 = v12;
            -[RTLocationAwarenessManager metrics](self, "metrics");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "timeHistograms");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "anyPositiveHistogram");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = objc_msgSend(v16, "counts");
            ++*(_DWORD *)(v17 + 4 * v11);

            -[RTLocationAwarenessManager metrics](self, "metrics");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "intervalHistogram");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "anyPositiveIntervalHistograms");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTLocationAwarenessManager lastLocationAnyPositive](self, "lastLocationAnyPositive");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTLocationAwarenessManager updateWithLocation:oneIntervalHistogram:lastLocation:](self, "updateWithLocation:oneIntervalHistogram:lastLocation:", v7, v20, v21);
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTLocationAwarenessManager setLastLocationAnyPositive:](self, "setLastLocationAnyPositive:", v22);

            if (v13 < 200.0)
            {
              -[RTLocationAwarenessManager metrics](self, "metrics");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "timeHistograms");
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "lessThan200mHistogram");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v26 = objc_msgSend(v25, "counts");
              ++*(_DWORD *)(v26 + 4 * v11);

              -[RTLocationAwarenessManager metrics](self, "metrics");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v27, "intervalHistogram");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v28, "lessThan200mIntervalHistograms");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTLocationAwarenessManager lastLocationLessThan200m](self, "lastLocationLessThan200m");
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTLocationAwarenessManager updateWithLocation:oneIntervalHistogram:lastLocation:](self, "updateWithLocation:oneIntervalHistogram:lastLocation:", v7, v29, v30);
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              -[RTLocationAwarenessManager setLastLocationLessThan200m:](self, "setLastLocationLessThan200m:", v31);

              if (v13 < 55.0)
              {
                -[RTLocationAwarenessManager metrics](self, "metrics");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v32, "timeHistograms");
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v33, "lessThan55mHistogram");
                v34 = (void *)objc_claimAutoreleasedReturnValue();
                v35 = objc_msgSend(v34, "counts");
                ++*(_DWORD *)(v35 + 4 * v11);

                -[RTLocationAwarenessManager metrics](self, "metrics");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "intervalHistogram");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "lessThan55mIntervalHistograms");
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTLocationAwarenessManager lastLocationLessThan55m](self, "lastLocationLessThan55m");
                v39 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTLocationAwarenessManager updateWithLocation:oneIntervalHistogram:lastLocation:](self, "updateWithLocation:oneIntervalHistogram:lastLocation:", v7, v38, v39);
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                -[RTLocationAwarenessManager setLastLocationLessThan55m:](self, "setLastLocationLessThan55m:", v40);

                if (v13 < 20.0)
                {
                  -[RTLocationAwarenessManager metrics](self, "metrics");
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v41, "timeHistograms");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "lessThan20mHistogram");
                  v43 = (void *)objc_claimAutoreleasedReturnValue();
                  v44 = objc_msgSend(v43, "counts");
                  ++*(_DWORD *)(v44 + 4 * v11);

                  -[RTLocationAwarenessManager metrics](self, "metrics");
                  v45 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v45, "intervalHistogram");
                  v46 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v46, "lessThan25mIntervalHistograms");
                  v47 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTLocationAwarenessManager lastLocationLessThan20m](self, "lastLocationLessThan20m");
                  v48 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTLocationAwarenessManager updateWithLocation:oneIntervalHistogram:lastLocation:](self, "updateWithLocation:oneIntervalHistogram:lastLocation:", v7, v47, v48);
                  v49 = (void *)objc_claimAutoreleasedReturnValue();
                  -[RTLocationAwarenessManager setLastLocationLessThan20m:](self, "setLastLocationLessThan20m:", v49);

                  if (v13 < 10.0)
                  {
                    -[RTLocationAwarenessManager metrics](self, "metrics");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v50, "timeHistograms");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v51, "lessThan10mHistogram");
                    v52 = (void *)objc_claimAutoreleasedReturnValue();
                    v53 = objc_msgSend(v52, "counts");
                    ++*(_DWORD *)(v53 + 4 * v11);

                    -[RTLocationAwarenessManager metrics](self, "metrics");
                    v54 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v54, "intervalHistogram");
                    v55 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v55, "lessThan10mIntervalHistograms");
                    v56 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTLocationAwarenessManager lastLocationLessThan10m](self, "lastLocationLessThan10m");
                    v57 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTLocationAwarenessManager updateWithLocation:oneIntervalHistogram:lastLocation:](self, "updateWithLocation:oneIntervalHistogram:lastLocation:", v7, v56, v57);
                    v58 = (void *)objc_claimAutoreleasedReturnValue();
                    -[RTLocationAwarenessManager setLastLocationLessThan10m:](self, "setLastLocationLessThan10m:", v58);

                  }
                }
              }
            }
          }
        }
      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    }
    while (v5);
  }

}

- (RTLocationAwarenessMetrics)metrics
{
  return self->_metrics;
}

- (id)updateWithLocation:(id)a3 oneIntervalHistogram:(id)a4 lastLocation:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  id v36;
  int v38;
  const char *v39;
  __int16 v40;
  int v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = a5;
  if (!v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v38 = 136315394;
      v39 = "-[RTLocationAwarenessManager(metric) updateWithLocation:oneIntervalHistogram:lastLocation:]";
      v40 = 1024;
      v41 = 89;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: location (in %s:%d)", (uint8_t *)&v38, 0x12u);
    }

    v36 = v9;
    goto LABEL_18;
  }
  if (!v9)
  {
    v36 = (id)objc_msgSend(v7, "copy");
LABEL_18:
    v17 = v36;
    goto LABEL_19;
  }
  objc_msgSend(v7, "timestamp");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "timestamp");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalSinceDate:", v11);
  v13 = v12;

  v14 = (void *)objc_opt_class();
  objc_msgSend(v9, "timestamp");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v14, "localHourFromTimestamp:", v15);

  v17 = v9;
  if (v13 > 0.0)
  {
    v18 = objc_msgSend(v7, "copy");

    v17 = (id)v18;
  }
  if (v13 > 8.0)
  {
    objc_msgSend(v8, "objectAtIndex:", 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "counts");
    ++*(_DWORD *)(v20 + 4 * v16);

    if (v13 > 60.0)
    {
      objc_msgSend(v8, "objectAtIndex:", 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "counts");
      ++*(_DWORD *)(v22 + 4 * v16);

      if (v13 > 120.0)
      {
        objc_msgSend(v8, "objectAtIndex:", 2);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "counts");
        ++*(_DWORD *)(v24 + 4 * v16);

        if (v13 > 900.0)
        {
          objc_msgSend(v8, "objectAtIndex:", 3);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "counts");
          ++*(_DWORD *)(v26 + 4 * v16);

          if (v13 > 3600.0)
          {
            objc_msgSend(v8, "objectAtIndex:", 4);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v27, "counts");
            ++*(_DWORD *)(v28 + 4 * v16);

            if (v13 > 7200.0)
            {
              objc_msgSend(v8, "objectAtIndex:", 5);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v30 = objc_msgSend(v29, "counts");
              ++*(_DWORD *)(v30 + 4 * v16);

              if (v13 > 14400.0)
              {
                objc_msgSend(v8, "objectAtIndex:", 6);
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                v32 = objc_msgSend(v31, "counts");
                ++*(_DWORD *)(v32 + 4 * v16);

                if (v13 > 28800.0)
                {
                  objc_msgSend(v8, "objectAtIndex:", 7);
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  v34 = objc_msgSend(v33, "counts");
                  ++*(_DWORD *)(v34 + 4 * v16);

                }
              }
            }
          }
        }
      }
    }
  }
LABEL_19:

  return v17;
}

+ (int64_t)localHourFromTimestamp:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int64_t v7;

  v3 = (void *)MEMORY[0x1E0C99D48];
  v4 = a3;
  objc_msgSend(v3, "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 32, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "hour");
  return v7;
}

- (BOOL)validLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  BOOL v7;
  double v8;
  double v9;
  void *v10;
  double v11;

  v4 = a3;
  v5 = v4;
  if (v4 && (objc_msgSend(v4, "horizontalAccuracy"), v6 >= 0.0))
  {
    objc_msgSend(v5, "horizontalAccuracy");
    v9 = v8;
    -[RTLocationAwarenessManager config](self, "config");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "requiredHorizontalAccuracy");
    v7 = v9 <= v11;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (RTLocationAwarenessManagerConfig)config
{
  return self->_config;
}

- (void)setLastLocationLessThan55m:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocationLessThan55m, a3);
}

- (void)setLastLocationLessThan200m:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocationLessThan200m, a3);
}

- (void)setLastLocationAnyPositive:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocationAnyPositive, a3);
}

- (CLLocation)lastLocationLessThan55m
{
  return self->_lastLocationLessThan55m;
}

- (CLLocation)lastLocationLessThan200m
{
  return self->_lastLocationLessThan200m;
}

- (CLLocation)lastLocationAnyPositive
{
  return self->_lastLocationAnyPositive;
}

- (void)setLastValidLocation:(id)a3
{
  id v4;
  NSObject *v5;
  CLLocation *lastValidLocation;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  CLLocation *v11;
  CLLocation *v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  NSObject *v19;
  RTTimer *restTimer;
  int v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v21 = 136315394;
      v22 = "-[RTLocationAwarenessManager setLastValidLocation:]";
      v23 = 1024;
      v24 = 257;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: latestValidLocation (in %s:%d)", (uint8_t *)&v21, 0x12u);
    }

  }
  lastValidLocation = self->_lastValidLocation;
  if (lastValidLocation)
  {
    -[CLLocation timestamp](lastValidLocation, "timestamp");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timestamp");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "compare:", v8);

    if (v9 != -1)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        v21 = 136315394;
        v22 = "-[RTLocationAwarenessManager setLastValidLocation:]";
        v23 = 1024;
        v24 = 260;
        _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "If lastValidLocation is not nil, it should have an earlier timestamp than latestValidLocation's. (in %s:%d)", (uint8_t *)&v21, 0x12u);
      }

    }
  }
  v11 = (CLLocation *)objc_msgSend(v4, "copy");
  v12 = self->_lastValidLocation;
  self->_lastValidLocation = v11;

  if (self->_activeOnset)
  {
    if (!-[RTLocationAwarenessManager requestedHighAccuracyLocation](self, "requestedHighAccuracyLocation"))
    {
      -[CLLocation timestamp](self->_lastValidLocation, "timestamp");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "timeIntervalSinceDate:", self->_activeOnset);
      v15 = v14;
      -[RTLocationAwarenessManager config](self, "config");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "dispatchTimerLeeway");
      v18 = -v17;

      if (v15 > v18)
      {
        -[RTLocationAwarenessManager setActiveRequestFulfilled:](self, "setActiveRequestFulfilled:", 1);
        _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        {
          restTimer = self->_restTimer;
          v21 = 134217984;
          v22 = (const char *)restTimer;
          _os_log_debug_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_DEBUG, "Pause rest timer %p.", (uint8_t *)&v21, 0xCu);
        }

        -[RTLocationAwarenessManager onRest](self, "onRest");
      }
    }
  }

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
  RTLocationAwarenessManager *v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __60__RTLocationAwarenessManager_onLeechedLocationNotification___block_invoke;
  v11 = &unk_1E9297540;
  v12 = v4;
  v13 = self;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v8);
  -[RTNotifier queue](self, "queue", v8, v9, v10, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

}

- (void)considerUpdatingHeartbeatDelayMetrics
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  NSObject *v7;
  id v8;
  uint8_t buf[16];

  -[RTLocationAwarenessManager scheduledHeartbeatFiringTime](self, "scheduledHeartbeatFiringTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessManager scheduledHeartbeatFiringTime](self, "scheduledHeartbeatFiringTime");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeIntervalSinceDate:", v4);
    v6 = v5;

    -[RTLocationAwarenessManager updateHeartbeatTimerDelayForTimestamp:withDelay:](self, "updateHeartbeatTimerDelayForTimestamp:withDelay:", v8, v6);
    -[RTLocationAwarenessManager setScheduledHeartbeatFiringTime:](self, "setScheduledHeartbeatFiringTime:", 0);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Unable to calculate heartbeat delay: nil scheduled time.", buf, 2u);
    }

  }
}

- (NSDate)scheduledHeartbeatFiringTime
{
  return self->_scheduledHeartbeatFiringTime;
}

- (void)adjustHeartbeatTimer
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  BOOL v13;
  uint64_t v14;
  void *v15;
  _BOOL4 v16;
  NSObject *v17;
  NSObject *v18;
  void *v19;
  RTTimerManager *timerManager;
  void *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  void *v25;
  RTTimer *v26;
  RTTimer *heartbeatTimer;
  RTTimer *v28;
  void *v29;
  double v30;
  void *v31;
  RTTimer *v32;
  _QWORD v33[4];
  id v34;
  _QWORD block[4];
  id v36;
  id v37;
  id location;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  double v42;
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  -[RTLocationAwarenessManager minHeartbeatBucket](self, "minHeartbeatBucket");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTLocationAwarenessManager minHeartbeatBucket](self, "minHeartbeatBucket");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessManager intervalForHeartbeatBucket:](self, "intervalForHeartbeatBucket:", v4);
    v6 = v5;

    -[RTLocationAwarenessManager starvingDurationTillNow](self, "starvingDurationTillNow");
    -[RTLocationAwarenessManager nextFiringDelayWithHeartbeatInterval:starvingDuration:](self, "nextFiringDelayWithHeartbeatInterval:starvingDuration:", v6, v7);
    v9 = v8;
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessManager config](self, "config");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "dispatchTimerLeeway");
    v13 = v9 > v12;

    v14 = MEMORY[0x1E0C809B0];
    if (!v13)
    {
      -[RTLocationAwarenessManager activeOnset](self, "activeOnset");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = v15 == 0;

      if (v16)
      {
        -[RTNotifier queue](self, "queue");
        v17 = objc_claimAutoreleasedReturnValue();
        block[0] = v14;
        block[1] = 3221225472;
        block[2] = __50__RTLocationAwarenessManager_adjustHeartbeatTimer__block_invoke;
        block[3] = &unk_1E9298210;
        objc_copyWeak(&v37, &location);
        v36 = v10;
        dispatch_async(v17, block);

        objc_destroyWeak(&v37);
      }
      v9 = v6;
    }
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      -[RTLocationAwarenessManager heartbeatTimer](self, "heartbeatTimer");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218240;
      v40 = v19;
      v41 = 2048;
      v42 = v9;
      _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "Reset heartbeat timer, %p, firing delay, %f secs.", buf, 0x16u);

    }
    timerManager = self->_timerManager;
    v21 = (void *)MEMORY[0x1E0CB3940];
    v22 = (objc_class *)objc_opt_class();
    NSStringFromClass(v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", CFSTR("%@.heartbeatTimer"), v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTNotifier queue](self, "queue");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v33[0] = v14;
    v33[1] = 3221225472;
    v33[2] = __50__RTLocationAwarenessManager_adjustHeartbeatTimer__block_invoke_62;
    v33[3] = &unk_1E92983E8;
    objc_copyWeak(&v34, &location);
    -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", v24, v25, v33);
    v26 = (RTTimer *)objc_claimAutoreleasedReturnValue();
    heartbeatTimer = self->_heartbeatTimer;
    self->_heartbeatTimer = v26;

    v28 = self->_heartbeatTimer;
    -[RTLocationAwarenessManager config](self, "config");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "dispatchTimerLeeway");
    -[RTTimer fireAfterDelay:interval:leeway:](v28, "fireAfterDelay:interval:leeway:", v9, INFINITY, v30);

    -[RTTimer resume](self->_heartbeatTimer, "resume");
    objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceNow:", v9);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessManager setScheduledHeartbeatFiringTime:](self, "setScheduledHeartbeatFiringTime:", v31);

    objc_destroyWeak(&v34);
    objc_destroyWeak(&location);
  }
  else
  {
    -[RTTimer invalidate](self->_heartbeatTimer, "invalidate");
    v32 = self->_heartbeatTimer;
    self->_heartbeatTimer = 0;

  }
}

- (NSNumber)minHeartbeatBucket
{
  return self->_minHeartbeatBucket;
}

- (void)considerRequestingForLocation
{
  void *v3;
  RTTimer *restTimer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  void *v33;
  RTTimerManager *timerManager;
  void *v35;
  objc_class *v36;
  void *v37;
  void *v38;
  void *v39;
  RTTimer *v40;
  RTTimer *v41;
  RTTimer *v42;
  void *v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  NSObject *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  const char *v58;
  void *v59;
  void *v60;
  void *v61;
  _QWORD v62[5];
  uint8_t buf[4];
  void *v64;
  __int16 v65;
  void *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  -[RTLocationAwarenessManager minHeartbeatBucket](self, "minHeartbeatBucket");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    restTimer = self->_restTimer;

    if (!restTimer)
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessManager metrics](self, "metrics");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "heartbeatStats");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "timerFiringCount");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessManager incrementBasicHistogram:forTimestamp:](self, "incrementBasicHistogram:forTimestamp:", v8, v5);

      -[RTLocationAwarenessManager lastValidLocation](self, "lastValidLocation");
      v9 = objc_claimAutoreleasedReturnValue();
      if (!v9)
        goto LABEL_5;
      v10 = (void *)v9;
      -[RTLocationAwarenessManager stationaryStartTimestamp](self, "stationaryStartTimestamp");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessManager lastValidLocation](self, "lastValidLocation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timestamp");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v13);
      v15 = v14;

      if (v15 <= 0.0)
      {
        -[RTLocationAwarenessManager metrics](self, "metrics");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "heartbeatStats");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v60, "skippedRequestDueToStationary");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLocationAwarenessManager incrementBasicHistogram:forTimestamp:](self, "incrementBasicHistogram:forTimestamp:", v61, v5);

        _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          -[RTLocationAwarenessManager lastValidLocation](self, "lastValidLocation");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "timestamp");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringFromDate");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLocationAwarenessManager stationaryStartTimestamp](self, "stationaryStartTimestamp");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "stringFromDate");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v64 = v55;
          v65 = 2112;
          v66 = v57;
          v58 = "Skip active location request, [stationary]. Last valid location timestamp, %@, stationary since, %@.";
          goto LABEL_13;
        }
      }
      else
      {
LABEL_5:
        -[RTLocationAwarenessManager starvingDurationTillNow](self, "starvingDurationTillNow");
        v17 = v16;
        -[RTLocationAwarenessManager config](self, "config");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "dispatchTimerLeeway");
        v20 = v17 + v19;
        -[RTLocationAwarenessManager minHeartbeatBucket](self, "minHeartbeatBucket");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLocationAwarenessManager intervalForHeartbeatBucket:](self, "intervalForHeartbeatBucket:", v21);
        v23 = v22;

        -[RTLocationAwarenessManager metrics](self, "metrics");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "heartbeatStats");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v25;
        if (v20 > v23)
        {
          objc_msgSend(v25, "activeRequestCount");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLocationAwarenessManager incrementBasicHistogram:forTimestamp:](self, "incrementBasicHistogram:forTimestamp:", v27, v5);

          -[RTLocationAwarenessManager resetActiveRequestSummaryVariables](self, "resetActiveRequestSummaryVariables");
          objc_storeStrong((id *)&self->_activeOnset, v5);
          -[RTLocationAwarenessManager locationManager](self, "locationManager");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyHundredMeters, "notificationName");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "addObserver:selector:name:", self, sel_onNoOpLocationNotification_, v29);

          _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
          v30 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            -[RTLocationAwarenessManager restTimer](self, "restTimer");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            -[RTLocationAwarenessManager config](self, "config");
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "activeDuration");
            *(_DWORD *)buf = 134218240;
            v64 = v31;
            v65 = 2048;
            v66 = v33;
            _os_log_impl(&dword_1D1A22000, v30, OS_LOG_TYPE_INFO, "Reset rest timer, %p, firing delay, %f secs.", buf, 0x16u);

          }
          timerManager = self->_timerManager;
          v35 = (void *)MEMORY[0x1E0CB3940];
          v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "stringWithFormat:", CFSTR("%@.restTimer"), v37);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTNotifier queue](self, "queue");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v62[0] = MEMORY[0x1E0C809B0];
          v62[1] = 3221225472;
          v62[2] = __59__RTLocationAwarenessManager_considerRequestingForLocation__block_invoke;
          v62[3] = &unk_1E92977B8;
          v62[4] = self;
          -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", v38, v39, v62);
          v40 = (RTTimer *)objc_claimAutoreleasedReturnValue();
          v41 = self->_restTimer;
          self->_restTimer = v40;

          v42 = self->_restTimer;
          -[RTLocationAwarenessManager config](self, "config");
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v43, "activeDuration");
          v45 = v44;
          -[RTLocationAwarenessManager config](self, "config");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "dispatchTimerLeeway");
          -[RTTimer fireAfterDelay:interval:leeway:](v42, "fireAfterDelay:interval:leeway:", v45, INFINITY, v47);

          -[RTTimer resume](self->_restTimer, "resume");
          v48 = (void *)MEMORY[0x1E0C99D68];
          -[RTLocationAwarenessManager config](self, "config");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "activeDuration");
          objc_msgSend(v48, "dateWithTimeIntervalSinceNow:");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLocationAwarenessManager setScheduledRestTimerFiringTime:](self, "setScheduledRestTimerFiringTime:", v50);

          goto LABEL_15;
        }
        objc_msgSend(v25, "skippedRequestDueToRecentFix");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[RTLocationAwarenessManager incrementBasicHistogram:forTimestamp:](self, "incrementBasicHistogram:forTimestamp:", v51, v5);

        _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
        v52 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          -[RTLocationAwarenessManager lastValidLocation](self, "lastValidLocation");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "timestamp");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v54, "stringFromDate");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          -[RTLocationAwarenessManager stationaryStartTimestamp](self, "stationaryStartTimestamp");
          v56 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "stringFromDate");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v64 = v55;
          v65 = 2112;
          v66 = v57;
          v58 = "Skip active location request, [recent fix]. Last valid location timestamp, %@, stationary since, %@.";
LABEL_13:
          _os_log_impl(&dword_1D1A22000, v52, OS_LOG_TYPE_INFO, v58, buf, 0x16u);

        }
      }

LABEL_15:
    }
  }
}

- (void)incrementBasicHistogram:(id)a3 forTimestamp:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;

  v5 = a4;
  v6 = objc_msgSend(a3, "counts");
  v7 = objc_msgSend((id)objc_opt_class(), "localHourFromTimestamp:", v5);

  ++*(_DWORD *)(v6 + 4 * v7);
}

- (NSDate)stationaryStartTimestamp
{
  return self->_stationaryStartTimestamp;
}

- (void)updateHeartbeatTimerDelayForTimestamp:(id)a3 withDelay:(double)a4
{
  id v6;
  void *v7;
  double v8;
  double v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  signed int v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  signed int v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  double v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[RTLocationAwarenessManager config](self, "config");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "heartbeatIntervalResolution");
  v9 = v8 * 0.5;

  if (v9 < a4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v28 = 134217984;
      v29 = a4;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "Significant heartbeat delay, %0.1f seconds", (uint8_t *)&v28, 0xCu);
    }

    v11 = objc_msgSend((id)objc_opt_class(), "localHourFromTimestamp:", v6);
    -[RTLocationAwarenessManager metrics](self, "metrics");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "heartbeatStats");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "timerFiringDelayedCount");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "counts");
    ++*(_DWORD *)(v15 + 4 * v11);

    v16 = llround(a4);
    -[RTLocationAwarenessManager metrics](self, "metrics");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "heartbeatStats");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "timerFiringDelayedTotalSeconds");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "counts");
    *(_DWORD *)(v20 + 4 * v11) += v16;

    -[RTLocationAwarenessManager metrics](self, "metrics");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "heartbeatStats");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "timerFiringDelayedMaxSeconds");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = *(_DWORD *)(objc_msgSend(v23, "counts") + 4 * v11);

    if (v24 < v16)
    {
      -[RTLocationAwarenessManager metrics](self, "metrics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "heartbeatStats");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "timerFiringDelayedMaxSeconds");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)(objc_msgSend(v27, "counts") + 4 * v11) = v16;

    }
  }

}

- (double)starvingDurationTillNow
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;

  -[RTLocationAwarenessManager lastValidLocation](self, "lastValidLocation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessManager lastValidLocation](self, "lastValidLocation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "timestamp");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v6);
    v8 = v7;

  }
  else
  {
    -[RTLocationAwarenessManager config](self, "config");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "maxHeartbeatInterval");
    v8 = v9;
  }

  return v8;
}

- (void)setScheduledHeartbeatFiringTime:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledHeartbeatFiringTime, a3);
}

- (void)onHeartbeat
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v7[5];

  -[RTLocationAwarenessManager activeOnset](self, "activeOnset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[RTLocationAwarenessManager heartbeatBuffer](self, "heartbeatBuffer");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __41__RTLocationAwarenessManager_onHeartbeat__block_invoke;
    v7[3] = &unk_1E92977B8;
    v7[4] = self;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringFromDate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "enqueueBlock:description:", v7, CFSTR("Heartbeat tasks buffered at %@"), v6);

  }
  else
  {
    -[RTLocationAwarenessManager heartbeatTasks](self, "heartbeatTasks");
  }
}

- (double)nextFiringDelayWithHeartbeatInterval:(double)result starvingDuration:(double)a4
{
  double v4;

  v4 = result - a4;
  if (v4 < result)
    result = v4;
  if (result < 0.0)
    return 0.0;
  return result;
}

- (double)intervalForHeartbeatBucket:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  double v7;
  double v8;
  uint64_t v9;
  int v11;
  const char *v12;
  __int16 v13;
  int v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      v11 = 136315394;
      v12 = "-[RTLocationAwarenessManager intervalForHeartbeatBucket:]";
      v13 = 1024;
      v14 = 1057;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: bucket (in %s:%d)", (uint8_t *)&v11, 0x12u);
    }

  }
  -[RTLocationAwarenessManager config](self, "config");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "heartbeatIntervalResolution");
  v8 = v7;
  v9 = objc_msgSend(v4, "integerValue");

  return v8 * (double)v9;
}

- (RTTimer)heartbeatTimer
{
  return self->_heartbeatTimer;
}

- (void)heartbeatTasks
{
  -[RTLocationAwarenessManager considerUpdatingHeartbeatDelayMetrics](self, "considerUpdatingHeartbeatDelayMetrics");
  -[RTLocationAwarenessManager considerRequestingForLocation](self, "considerRequestingForLocation");
  -[RTLocationAwarenessManager adjustHeartbeatTimer](self, "adjustHeartbeatTimer");
}

- (NSDate)activeOnset
{
  return self->_activeOnset;
}

- (double)metricAge
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTLocationAwarenessManager metrics](self, "metrics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "startTimestamp");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceDate:", v5);
  v7 = v6;

  return v7;
}

- (void)considerUpdateActiveRequestMetrics
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD v14[5];
  NSObject *v15;
  _QWORD v16[5];
  NSObject *v17;

  -[RTLocationAwarenessManager setActiveRequestInterrupted:](self, "setActiveRequestInterrupted:", -[RTLocationAwarenessManager activeRequestInterruptedCheck](self, "activeRequestInterruptedCheck"));
  v3 = dispatch_group_create();
  -[RTLocationAwarenessManager authorizationManager](self, "authorizationManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = MEMORY[0x1E0C809B0];
  if (v4)
  {
    dispatch_group_enter(v3);
    -[RTLocationAwarenessManager authorizationManager](self, "authorizationManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke;
    v16[3] = &unk_1E9297D58;
    v16[4] = self;
    v17 = v3;
    objc_msgSend(v6, "fetchRoutineEnabledWithHandler:", v16);

  }
  -[RTLocationAwarenessManager wifiManager](self, "wifiManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    dispatch_group_enter(v3);
    -[RTLocationAwarenessManager wifiManager](self, "wifiManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v5;
    v14[1] = 3221225472;
    v14[2] = __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_3;
    v14[3] = &unk_1E929EA98;
    v14[4] = self;
    v15 = v3;
    objc_msgSend(v8, "fetchPowerStatus:", v14);

  }
  -[RTLocationAwarenessManager setActiveRequestLocationServiceOn:](self, "setActiveRequestLocationServiceOn:", objc_msgSend(MEMORY[0x1E0C9E3C8], "locationServicesEnabled"));
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v12[0] = v5;
  v12[1] = 3221225472;
  v12[2] = __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_5;
  v12[3] = &unk_1E9297540;
  v12[4] = self;
  v13 = v9;
  v11 = v9;
  dispatch_group_notify(v3, v10, v12);

}

void __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke(uint64_t a1, char a2)
{
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_2;
  block[3] = &unk_1E9297D30;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = a2;
  v7 = v5;
  dispatch_async(v4, block);

}

void __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActiveRequestRoutineOn:", *(unsigned __int8 *)(a1 + 48));
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_3(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  _QWORD block[5];
  id v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_4;
  block[3] = &unk_1E9297BC8;
  v5 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v8 = a2;
  v7 = v5;
  dispatch_async(v4, block);

}

void __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_4(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setActiveRequestWifiOn:", *(_QWORD *)(a1 + 48) == 2);
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
}

void __72__RTLocationAwarenessManager_metric__considerUpdateActiveRequestMetrics__block_invoke_5(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  char v16;
  char v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int v26;
  int v27;
  _DWORD v28[2];
  __int16 v29;
  int v30;
  __int16 v31;
  int v32;
  __int16 v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v22 = objc_msgSend(*(id *)(a1 + 32), "activeRequestInterrupted");
    v23 = objc_msgSend(*(id *)(a1 + 32), "activeRequestFulfilled");
    v24 = objc_msgSend(*(id *)(a1 + 32), "activeRequestCoarseLocationReceived");
    v25 = objc_msgSend(*(id *)(a1 + 32), "activeRequestLocationServiceOn");
    v26 = objc_msgSend(*(id *)(a1 + 32), "activeRequestRoutineOn");
    v27 = objc_msgSend(*(id *)(a1 + 32), "activeRequestWifiOn");
    v28[0] = 67110400;
    v28[1] = v22;
    v29 = 1024;
    v30 = v23;
    v31 = 1024;
    v32 = v24;
    v33 = 1024;
    v34 = v25;
    v35 = 1024;
    v36 = v26;
    v37 = 1024;
    v38 = v27;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "active request status, interrupted, %d, fulfilled, %d, coarseLocationReceived, %d, locationServiceOn, %d, routineOn, %d, wifiOn, %d", (uint8_t *)v28, 0x26u);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "activeRequestInterrupted"))
  {
    v3 = *(void **)(a1 + 32);
    objc_msgSend(v3, "metrics");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "heartbeatStats");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "activeRequestInterrupted");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "incrementBasicHistogram:forTimestamp:", v6, *(_QWORD *)(a1 + 40));

  }
  v7 = objc_msgSend(*(id *)(a1 + 32), "activeRequestFulfilled");
  v8 = *(void **)(a1 + 32);
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "metrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "heartbeatStats");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "validLocationCount");
    v11 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(*(id *)(a1 + 32), "activeRequestCoarseLocationReceived"))
    {
      v12 = *(void **)(a1 + 32);
      objc_msgSend(v12, "metrics");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "heartbeatStats");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "activeRequestTimeoutWithCoarseLocation");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "incrementBasicHistogram:forTimestamp:", v15, *(_QWORD *)(a1 + 40));

    }
    v16 = objc_msgSend(*(id *)(a1 + 32), "activeRequestLocationServiceOn");
    v8 = *(void **)(a1 + 32);
    if ((v16 & 1) != 0)
    {
      v17 = objc_msgSend(*(id *)(a1 + 32), "activeRequestRoutineOn");
      v8 = *(void **)(a1 + 32);
      if ((v17 & 1) != 0)
      {
        v18 = objc_msgSend(*(id *)(a1 + 32), "activeRequestWifiOn");
        v8 = *(void **)(a1 + 32);
        objc_msgSend(v8, "metrics");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "heartbeatStats");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = v19;
        if ((v18 & 1) != 0)
          objc_msgSend(v19, "activeRequestTimeoutWithOtherReasons");
        else
          objc_msgSend(v19, "activeRequestTimeoutWithLocationServiceEnabledRoutineEnabledWifiOff");
        v11 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(*(id *)(a1 + 32), "metrics");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "heartbeatStats");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "activeRequestTimeoutWithLocationServiceEnabledRoutineDisabled");
        v11 = objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "metrics");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "heartbeatStats");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "activeRequestTimeoutWithLocationServiceDisabled");
      v11 = objc_claimAutoreleasedReturnValue();
    }
  }
  v20 = (void *)v11;
  objc_msgSend(v8, "incrementBasicHistogram:forTimestamp:", v11, *(_QWORD *)(a1 + 40));

  objc_msgSend(*(id *)(a1 + 32), "resetActiveRequestSummaryVariables");
  objc_msgSend(*(id *)(a1 + 32), "setActiveOnset:", 0);
  objc_msgSend(*(id *)(a1 + 32), "heartbeatBuffer");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "dispatchPendingInvocations");

}

- (BOOL)activeRequestInterruptedCheck
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  BOOL v10;
  NSObject *v11;
  uint8_t v13[16];

  -[RTLocationAwarenessManager scheduledRestTimerFiringTime](self, "scheduledRestTimerFiringTime");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessManager scheduledRestTimerFiringTime](self, "scheduledRestTimerFiringTime");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceDate:", v5);
    v7 = v6;
    -[RTLocationAwarenessManager config](self, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "heartbeatIntervalResolution");
    v10 = v7 > v9 * 0.5;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v13 = 0;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "Unable to check for active request interruption: nil scheduledRestTimerFiringTime.", v13, 2u);
    }

    return 0;
  }
  return v10;
}

- (void)resetActiveRequestSummaryVariables
{
  -[RTLocationAwarenessManager setActiveRequestInterrupted:](self, "setActiveRequestInterrupted:", 0);
  -[RTLocationAwarenessManager setActiveRequestFulfilled:](self, "setActiveRequestFulfilled:", 0);
  -[RTLocationAwarenessManager setActiveRequestCoarseLocationReceived:](self, "setActiveRequestCoarseLocationReceived:", 0);
  -[RTLocationAwarenessManager setActiveRequestLocationServiceOn:](self, "setActiveRequestLocationServiceOn:", 1);
  -[RTLocationAwarenessManager setActiveRequestRoutineOn:](self, "setActiveRequestRoutineOn:", 1);
  -[RTLocationAwarenessManager setActiveRequestWifiOn:](self, "setActiveRequestWifiOn:", 1);
}

- (RTLocationAwarenessManager)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithLocationManager_config_metricManager_motionActivityManager_authorizationManager_wifiManager_xpcActivityManager_timerManager_learnedLocationStore_);
}

- (RTLocationAwarenessManager)initWithLocationManager:(id)a3 config:(id)a4 metricManager:(id)a5 motionActivityManager:(id)a6 authorizationManager:(id)a7 wifiManager:(id)a8 xpcActivityManager:(id)a9 timerManager:(id)a10 learnedLocationStore:(id)a11
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  RTLocationAwarenessManager *v26;
  RTLocationAwarenessManager *v27;
  uint64_t v28;
  RTLocationAwarenessManagerConfig *config;
  uint64_t v30;
  NSMapTable *requesterToHeartbeatBucket;
  uint64_t v32;
  NSMapTable *heartbeatBucketToRequesters;
  NSDate *activeOnset;
  NSNumber *minHeartbeatBucket;
  CLLocation *lastValidLocation;
  uint64_t v37;
  NSDate *stationaryStartTimestamp;
  RTInvocationDispatcher *v39;
  void *v40;
  uint64_t v41;
  RTInvocationDispatcher *heartbeatBuffer;
  uint64_t v43;
  RTLocationAwarenessMetrics *metrics;
  CLLocation *lastLocationAnyPositive;
  CLLocation *lastLocationLessThan200m;
  CLLocation *lastLocationLessThan55m;
  CLLocation *lastLocationLessThan20m;
  CLLocation *lastLocationLessThan10m;
  uint64_t v50;
  NSMutableSet *highAccuracyLocationRequesters;
  uint64_t v52;
  NSMutableSet *fixedRateLocationRequesters;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  id v61;
  id v62;
  objc_super v63;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  int v67;
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v17 = a3;
  v18 = a4;
  v56 = a5;
  v19 = a5;
  v62 = a6;
  v57 = a7;
  v61 = a7;
  v58 = a8;
  v60 = a8;
  v20 = a9;
  v21 = a10;
  v59 = a11;
  if (v17)
  {
    if (v18)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v65 = "-[RTLocationAwarenessManager initWithLocationManager:config:metricManager:motionActivityManager:authorizatio"
            "nManager:wifiManager:xpcActivityManager:timerManager:learnedLocationStore:]";
      v66 = 1024;
      v67 = 85;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: locationManager (in %s:%d)", buf, 0x12u);
    }

    if (v18)
    {
LABEL_3:
      if (v20)
        goto LABEL_4;
      goto LABEL_12;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v65 = "-[RTLocationAwarenessManager initWithLocationManager:config:metricManager:motionActivityManager:authorizationM"
          "anager:wifiManager:xpcActivityManager:timerManager:learnedLocationStore:]";
    v66 = 1024;
    v67 = 86;
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: config (in %s:%d)", buf, 0x12u);
  }

  if (v20)
  {
LABEL_4:
    if (v21)
      goto LABEL_18;
    goto LABEL_15;
  }
LABEL_12:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v65 = "-[RTLocationAwarenessManager initWithLocationManager:config:metricManager:motionActivityManager:authorizationM"
          "anager:wifiManager:xpcActivityManager:timerManager:learnedLocationStore:]";
    v66 = 1024;
    v67 = 91;
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: xpcActivityManager (in %s:%d)", buf, 0x12u);
  }

  if (!v21)
  {
LABEL_15:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v65 = "-[RTLocationAwarenessManager initWithLocationManager:config:metricManager:motionActivityManager:authorizatio"
            "nManager:wifiManager:xpcActivityManager:timerManager:learnedLocationStore:]";
      v66 = 1024;
      v67 = 92;
      _os_log_error_impl(&dword_1D1A22000, v25, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: timerManager (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_18:
  v26 = 0;
  if (v17 && v18 && v20)
  {
    v63.receiver = self;
    v63.super_class = (Class)RTLocationAwarenessManager;
    v27 = -[RTNotifier init](&v63, sel_init);
    if (v27)
    {
      v28 = objc_msgSend(v18, "copy");
      config = v27->_config;
      v27->_config = (RTLocationAwarenessManagerConfig *)v28;

      objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 5, 0x10000);
      v30 = objc_claimAutoreleasedReturnValue();
      requesterToHeartbeatBucket = v27->_requesterToHeartbeatBucket;
      v27->_requesterToHeartbeatBucket = (NSMapTable *)v30;

      objc_msgSend(MEMORY[0x1E0CB3748], "mapTableWithKeyOptions:valueOptions:", 0x10000, 0);
      v32 = objc_claimAutoreleasedReturnValue();
      heartbeatBucketToRequesters = v27->_heartbeatBucketToRequesters;
      v27->_heartbeatBucketToRequesters = (NSMapTable *)v32;

      objc_storeStrong((id *)&v27->_timerManager, a10);
      objc_storeStrong((id *)&v27->_locationManager, a3);
      activeOnset = v27->_activeOnset;
      v27->_activeOnset = 0;

      minHeartbeatBucket = v27->_minHeartbeatBucket;
      v27->_minHeartbeatBucket = 0;

      lastValidLocation = v27->_lastValidLocation;
      v27->_lastValidLocation = 0;

      objc_storeStrong((id *)&v27->_motionActivityManager, a6);
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v37 = objc_claimAutoreleasedReturnValue();
      stationaryStartTimestamp = v27->_stationaryStartTimestamp;
      v27->_stationaryStartTimestamp = (NSDate *)v37;

      v39 = [RTInvocationDispatcher alloc];
      -[RTNotifier queue](v27, "queue");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = -[RTInvocationDispatcher initWithQueue:](v39, "initWithQueue:", v40);
      heartbeatBuffer = v27->_heartbeatBuffer;
      v27->_heartbeatBuffer = (RTInvocationDispatcher *)v41;

      v43 = objc_opt_new();
      metrics = v27->_metrics;
      v27->_metrics = (RTLocationAwarenessMetrics *)v43;

      objc_storeStrong((id *)&v27->_metricManager, v56);
      objc_storeStrong((id *)&v27->_learnedLocationStore, a11);
      lastLocationAnyPositive = v27->_lastLocationAnyPositive;
      v27->_lastLocationAnyPositive = 0;

      lastLocationLessThan200m = v27->_lastLocationLessThan200m;
      v27->_lastLocationLessThan200m = 0;

      lastLocationLessThan55m = v27->_lastLocationLessThan55m;
      v27->_lastLocationLessThan55m = 0;

      lastLocationLessThan20m = v27->_lastLocationLessThan20m;
      v27->_lastLocationLessThan20m = 0;

      lastLocationLessThan10m = v27->_lastLocationLessThan10m;
      v27->_lastLocationLessThan10m = 0;

      objc_storeStrong((id *)&v27->_authorizationManager, v57);
      objc_storeStrong((id *)&v27->_wifiManager, v58);
      objc_storeStrong((id *)&v27->_xpcActivityManager, a9);
      v50 = objc_opt_new();
      highAccuracyLocationRequesters = v27->_highAccuracyLocationRequesters;
      v27->_highAccuracyLocationRequesters = (NSMutableSet *)v50;

      v52 = objc_opt_new();
      fixedRateLocationRequesters = v27->_fixedRateLocationRequesters;
      v27->_fixedRateLocationRequesters = (NSMutableSet *)v52;

      v27->_requestedHighAccuracyLocation = 0;
      -[RTService setup](v27, "setup");
    }
    self = v27;
    v26 = self;
  }

  return v26;
}

- (void)_setup
{
  NSObject *v4;
  void *v5;
  NSDate *v6;
  NSDate *activeOnset;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint8_t buf[4];
  void *v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  if (_os_feature_enabled_impl())
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v18 = v5;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, all day GNSS feature enabled", buf, 0xCu);

    }
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    activeOnset = self->_activeOnset;
    self->_activeOnset = v6;

    -[RTLocationAwarenessManager setRequestedHighAccuracyLocation:](self, "setRequestedHighAccuracyLocation:", 1);
    -[RTLocationAwarenessManager locationManager](self, "locationManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:", self, sel_onNoOpLocationNotification_, v9);

  }
  else
  {
    -[RTLocationAwarenessManager locationManager](self, "locationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:", self, sel_onLeechedLocationNotification_, v11);

    -[RTLocationAwarenessManager motionActivityManager](self, "motionActivityManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTMotionActivityManagerNotificationActivity, "notificationName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:", self, sel_onMotionActivityManagerNotificationActivityNotification_, v13);

    -[RTLocationAwarenessManager motionActivityManager](self, "motionActivityManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:", self, sel_onMotionActivityManagerNotificationActivityNotification_, v15);

    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addObserver:selector:name:object:", self, sel_onDailyMetricsNotification_, CFSTR("RTMetricManagerDailyMetricNotification"), 0);

  }
}

- (void)_shutdownWithHandler:(id)a3
{
  RTTimer *heartbeatTimer;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  dispatch_semaphore_t v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  dispatch_time_t v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  id v30;
  dispatch_semaphore_t v31;
  void *v32;
  NSObject *v33;
  NSObject *v34;
  void *v35;
  dispatch_time_t v36;
  id v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  void *v49;
  id v50;
  RTPowerAssertion *xpcActivityPowerAssertion;
  void *v52;
  void (**v53)(id, id);
  _QWORD v54[4];
  NSObject *v55;
  _QWORD v56[4];
  NSObject *v57;
  uint64_t v58;
  uint8_t buf[8];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v53 = (void (**)(id, id))a3;
  -[RTTimer invalidate](self->_heartbeatTimer, "invalidate");
  heartbeatTimer = self->_heartbeatTimer;
  self->_heartbeatTimer = 0;

  -[RTLocationAwarenessManager onRest](self, "onRest");
  -[RTLocationAwarenessManager locationManager](self, "locationManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:", self);

  -[RTLocationAwarenessManager motionActivityManager](self, "motionActivityManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeObserver:", self);

  -[RTLocationAwarenessManager heartbeatBuffer](self, "heartbeatBuffer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "shutdown");

  v9 = dispatch_semaphore_create(0);
  -[RTLocationAwarenessManager xpcActivityManager](self, "xpcActivityManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v56[0] = MEMORY[0x1E0C809B0];
  v56[1] = 3221225472;
  v56[2] = __51__RTLocationAwarenessManager__shutdownWithHandler___block_invoke;
  v56[3] = &unk_1E9297150;
  v12 = v9;
  v57 = v12;
  objc_msgSend(v10, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.locationAwareness.heartbeat"), v56);

  v13 = v12;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = dispatch_time(0, 3600000000000);
  if (dispatch_semaphore_wait(v13, v15))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "timeIntervalSinceDate:", v14);
    v18 = v17;
    v19 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_107);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "filteredArrayUsingPredicate:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "firstObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "submitToCoreAnalytics:type:duration:", v23, 1, v18);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D18598];
    v58 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v58, 1);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 15, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    if (v28)
    {
      v29 = objc_retainAutorelease(v28);

    }
    else
    {
      v29 = 0;
    }
    v11 = MEMORY[0x1E0C809B0];
  }
  else
  {
    v29 = 0;
  }

  v30 = v29;
  v31 = dispatch_semaphore_create(0);

  -[RTLocationAwarenessManager xpcActivityManager](self, "xpcActivityManager");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v11;
  v54[1] = 3221225472;
  v54[2] = __51__RTLocationAwarenessManager__shutdownWithHandler___block_invoke_2;
  v54[3] = &unk_1E9297150;
  v33 = v31;
  v55 = v33;
  objc_msgSend(v32, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.locationAwareness.highAccuracyLocationRequest"), v54);

  v34 = v33;
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = dispatch_time(0, 3600000000000);
  v37 = v30;
  if (dispatch_semaphore_wait(v34, v36))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "timeIntervalSinceDate:", v35);
    v39 = v38;
    v40 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_107);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "filteredArrayUsingPredicate:", v41);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "firstObject");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v40, "submitToCoreAnalytics:type:duration:", v44, 1, v39);
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1D1A22000, v45, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", buf, 2u);
    }

    v46 = (void *)MEMORY[0x1E0CB35C8];
    v47 = *MEMORY[0x1E0D18598];
    v58 = *MEMORY[0x1E0CB2D50];
    *(_QWORD *)buf = CFSTR("semaphore wait timeout");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", buf, &v58, 1);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "errorWithDomain:code:userInfo:", v47, 15, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v37 = v30;
    if (v49)
    {
      v37 = objc_retainAutorelease(v49);

    }
  }

  v50 = v37;
  xpcActivityPowerAssertion = self->_xpcActivityPowerAssertion;
  self->_xpcActivityPowerAssertion = 0;

  if (v53)
    v53[2](v53, v50);

}

intptr_t __51__RTLocationAwarenessManager__shutdownWithHandler___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

intptr_t __51__RTLocationAwarenessManager__shutdownWithHandler___block_invoke_2(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

- (void)_onDailyMetricsNotification:(id)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  RTLocationAwarenessMetricManager *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v5;
    _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@, received notification, %@", (uint8_t *)&v11, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "now");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeInterval:sinceDate:", v8, -86400.0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[RTLocationAwarenessMetricManager initWithLocationManager:motionManager:learnedLocationStore:startDate:endDate:]([RTLocationAwarenessMetricManager alloc], "initWithLocationManager:motionManager:learnedLocationStore:startDate:endDate:", self->_locationManager, self->_motionActivityManager, self->_learnedLocationStore, v9, v8);
  -[RTLocationAwarenessMetricManager submitMetrics](v10, "submitMetrics");

}

- (void)onDailyMetricsNotification:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTNotifier queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__RTLocationAwarenessManager_onDailyMetricsNotification___block_invoke;
  v7[3] = &unk_1E9297540;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __57__RTLocationAwarenessManager_onDailyMetricsNotification___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_onDailyMetricsNotification:", *(_QWORD *)(a1 + 40));
}

- (void)setMinHeartbeatBucket:(id)a3
{
  unint64_t v5;
  NSNumber *minHeartbeatBucket;
  NSObject *v7;
  int v8;
  unint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v5 = (unint64_t)a3;
  minHeartbeatBucket = self->_minHeartbeatBucket;
  if (v5 | (unint64_t)minHeartbeatBucket
    && (!v5 || !minHeartbeatBucket || -[NSNumber compare:](minHeartbeatBucket, "compare:", v5)))
  {
    objc_storeStrong((id *)&self->_minHeartbeatBucket, a3);
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = 138412290;
      v9 = v5;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "Set minHeartbeatBucket to %@.", (uint8_t *)&v8, 0xCu);
    }

    -[RTLocationAwarenessManager adjustHeartbeatTimer](self, "adjustHeartbeatTimer");
  }

}

- (BOOL)addLocationHeartbeatRequester:(id)a3 interval:(double)a4 error:(id *)a5
{
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  _QWORD v22[5];
  id v23;
  double v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (!v8)
  {
    if (!a5)
      goto LABEL_11;
    v11 = (void *)MEMORY[0x1E0CB35C8];
    v12 = *MEMORY[0x1E0D18598];
    v27 = *MEMORY[0x1E0CB2D50];
    v28[0] = CFSTR("Requester should not be nil.");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "errorWithDomain:code:userInfo:", v12, 0, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

LABEL_10:
    LOBYTE(a5) = 0;
    goto LABEL_11;
  }
  if (!-[RTLocationAwarenessManager validInterval:](self, "validInterval:", a4))
  {
    if (!a5)
      goto LABEL_11;
    v14 = (void *)MEMORY[0x1E0CB3940];
    -[RTLocationAwarenessManager config](self, "config");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "maxHeartbeatInterval");
    objc_msgSend(v14, "stringWithFormat:", CFSTR("Interval should be between 0 and %f."), v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = (void *)MEMORY[0x1E0CB35C8];
    v19 = *MEMORY[0x1E0D18598];
    v25 = *MEMORY[0x1E0CB2D50];
    v26 = v17;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v26, &v25, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "errorWithDomain:code:userInfo:", v19, 1, v20);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __75__RTLocationAwarenessManager_addLocationHeartbeatRequester_interval_error___block_invoke;
  v22[3] = &unk_1E9297BC8;
  v22[4] = self;
  v24 = a4;
  v23 = v8;
  v9 = (void *)MEMORY[0x1D8232094](v22);
  -[RTNotifier queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v10, v9);

  if (a5)
    *a5 = 0;

  LOBYTE(a5) = 1;
LABEL_11:

  return (char)a5;
}

void __75__RTLocationAwarenessManager_addLocationHeartbeatRequester_interval_error___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(*(id *)(a1 + 32), "heartbeatBucketForInterval:", *(double *)(a1 + 48));
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "requesterToHeartbeatBucket");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || objc_msgSend(v12, "compare:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "heartbeatBucketToRequesters");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "requesterToHeartbeatBucket");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKey:", v12, *(_QWORD *)(a1 + 40));

    objc_msgSend(*(id *)(a1 + 32), "heartbeatBucketToRequesters");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", v12);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v8)
    {
      objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "heartbeatBucketToRequesters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setObject:forKey:", v8, v12);

    }
    objc_msgSend(v8, "addObject:", *(_QWORD *)(a1 + 40));
    objc_msgSend(*(id *)(a1 + 32), "updateMinHeartbeatBucket");
    v10 = *(void **)(a1 + 32);
    objc_msgSend(v10, "requesterToHeartbeatBucket");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "_updateXPCActivityForObserverCount:", objc_msgSend(v11, "count"));

  }
}

- (void)removeLocationHeartbeatRequester:(id)a3
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
  RTLocationAwarenessManager *v13;

  v4 = a3;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __63__RTLocationAwarenessManager_removeLocationHeartbeatRequester___block_invoke;
  v11 = &unk_1E9297540;
  v12 = v4;
  v13 = self;
  v5 = v4;
  v6 = (void *)MEMORY[0x1D8232094](&v8);
  -[RTNotifier queue](self, "queue", v8, v9, v10, v11);
  v7 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v7, v6);

}

void __63__RTLocationAwarenessManager_removeLocationHeartbeatRequester___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(*(id *)(a1 + 40), "requesterToHeartbeatBucket");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKey:", *(_QWORD *)(a1 + 32));
    v8 = (id)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(*(id *)(a1 + 40), "requesterToHeartbeatBucket");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeObjectForKey:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 40), "heartbeatBucketToRequesters");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "objectForKey:", v8);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "removeObject:", *(_QWORD *)(a1 + 32));

      objc_msgSend(*(id *)(a1 + 40), "updateMinHeartbeatBucket");
      v6 = *(void **)(a1 + 40);
      objc_msgSend(v6, "requesterToHeartbeatBucket");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "_updateXPCActivityForObserverCount:", objc_msgSend(v7, "count"));

    }
  }
}

- (void)_addHighAccuracyLocationRequester:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[RTLocationAwarenessManager highAccuracyLocationRequesters](self, "highAccuracyLocationRequesters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[RTLocationAwarenessManager highAccuracyLocationRequesters](self, "highAccuracyLocationRequesters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  if (!v6)
    -[RTLocationAwarenessManager _updateXPCActivityForHighAccuracyLocationRequest](self, "_updateXPCActivityForHighAccuracyLocationRequest");
}

- (void)_removeHighAccuracyLocationRequester:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a3;
  -[RTLocationAwarenessManager highAccuracyLocationRequesters](self, "highAccuracyLocationRequesters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[RTLocationAwarenessManager highAccuracyLocationRequesters](self, "highAccuracyLocationRequesters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v11);

  if (v7)
  {
    -[RTLocationAwarenessManager highAccuracyLocationRequesters](self, "highAccuracyLocationRequesters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v11);

    if (v5 == 1)
    {
      -[RTLocationAwarenessManager highAccuracyLocationRequesters](self, "highAccuracyLocationRequesters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (!v10)
        -[RTLocationAwarenessManager _updateXPCActivityForHighAccuracyLocationRequest](self, "_updateXPCActivityForHighAccuracyLocationRequest");
    }
  }

}

- (BOOL)addHighAccuracyLocationRequester:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, Add high accuracy location requester, %@", buf, 0x16u);

    }
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __69__RTLocationAwarenessManager_addHighAccuracyLocationRequester_error___block_invoke;
    v13[3] = &unk_1E9297540;
    v13[4] = self;
    v14 = v7;
    dispatch_async(v10, v13);

    if (a4)
      *a4 = 0;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: requester", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("requester"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7 != 0;
}

uint64_t __69__RTLocationAwarenessManager_addHighAccuracyLocationRequester_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addHighAccuracyLocationRequester:", *(_QWORD *)(a1 + 40));
}

- (BOOL)removeHighAccuracyLocationRequester:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, Remove high accuracy location requester, %@", buf, 0x16u);

    }
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __72__RTLocationAwarenessManager_removeHighAccuracyLocationRequester_error___block_invoke;
    v13[3] = &unk_1E9297540;
    v13[4] = self;
    v14 = v7;
    dispatch_async(v10, v13);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: requester", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("requester"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7 != 0;
}

uint64_t __72__RTLocationAwarenessManager_removeHighAccuracyLocationRequester_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeHighAccuracyLocationRequester:", *(_QWORD *)(a1 + 40));
}

- (BOOL)addFixedRateLocationRequester:(id)a3 error:(id *)a4
{
  id v7;
  NSObject *v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  _QWORD v13[5];
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  if (v7)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v7;
      _os_log_impl(&dword_1D1A22000, v8, OS_LOG_TYPE_INFO, "%@, Add fixed rate location requester, %@", buf, 0x16u);

    }
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __66__RTLocationAwarenessManager_addFixedRateLocationRequester_error___block_invoke;
    v13[3] = &unk_1E9297540;
    v13[4] = self;
    v14 = v7;
    dispatch_async(v10, v13);

    if (a4)
      *a4 = 0;

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: requester", buf, 2u);
    }

    if (a4)
    {
      _RTErrorInvalidParameterCreate((uint64_t)CFSTR("requester"));
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v7 != 0;
}

uint64_t __66__RTLocationAwarenessManager_addFixedRateLocationRequester_error___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_addFixedRateLocationRequester:", *(_QWORD *)(a1 + 40));
}

- (void)removeFixedRateLocationRequester:(id)a3
{
  id v5;
  NSObject *v6;
  NSObject *v7;
  char *v8;
  NSObject *v9;
  id v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  const char *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v14 = "-[RTLocationAwarenessManager removeFixedRateLocationRequester:]";
      v15 = 1024;
      LODWORD(v16) = 427;
      _os_log_error_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: requester (in %s:%d)", buf, 0x12u);
    }

  }
  _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v8 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v14 = v8;
    v15 = 2112;
    v16 = v5;
    _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, Remove fixed rate location requester, %@", buf, 0x16u);

  }
  -[RTNotifier queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __63__RTLocationAwarenessManager_removeFixedRateLocationRequester___block_invoke;
  v11[3] = &unk_1E9297540;
  v11[4] = self;
  v12 = v5;
  v10 = v5;
  dispatch_async(v9, v11);

}

uint64_t __63__RTLocationAwarenessManager_removeFixedRateLocationRequester___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_removeFixedRateLocationRequester:", *(_QWORD *)(a1 + 40));
}

- (void)_addFixedRateLocationRequester:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[RTLocationAwarenessManager fixedRateLocationRequesters](self, "fixedRateLocationRequesters");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  -[RTLocationAwarenessManager fixedRateLocationRequesters](self, "fixedRateLocationRequesters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v4);

  if (!v6)
    -[RTLocationAwarenessManager _requestForFixedRateLocation](self, "_requestForFixedRateLocation");
}

- (void)_removeFixedRateLocationRequester:(id)a3
{
  void *v4;
  uint64_t v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  -[RTLocationAwarenessManager fixedRateLocationRequesters](self, "fixedRateLocationRequesters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  -[RTLocationAwarenessManager fixedRateLocationRequesters](self, "fixedRateLocationRequesters");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "containsObject:", v13);

  if (v7)
  {
    -[RTLocationAwarenessManager fixedRateLocationRequesters](self, "fixedRateLocationRequesters");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeObject:", v13);

    if (v5 == 1)
    {
      -[RTLocationAwarenessManager fixedRateLocationRequesters](self, "fixedRateLocationRequesters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "count");

      if (!v10)
      {
        -[RTLocationAwarenessManager locationManager](self, "locationManager");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyRhythmicNonWaking, "notificationName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "removeObserver:fromNotification:", self, v12);

      }
    }
  }

}

- (void)_updateXPCActivityForHighAccuracyLocationRequest
{
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  RTXPCActivityCriteria *v8;
  void *v9;
  dispatch_semaphore_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  dispatch_time_t v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[4];
  id v28[2];
  _QWORD v29[4];
  NSObject *v30;
  uint64_t v31;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  -[RTLocationAwarenessManager highAccuracyLocationRequesters](self, "highAccuracyLocationRequesters");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    -[RTLocationAwarenessManager highAccuracyLocationRequesters](self, "highAccuracyLocationRequesters");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");

    if (v7 != 1)
      return;
    v8 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 1, 0, 0, 0, 0, 1, 1800.0, 900.0);
    objc_initWeak(location, self);
    -[RTLocationAwarenessManager xpcActivityManager](self, "xpcActivityManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __78__RTLocationAwarenessManager__updateXPCActivityForHighAccuracyLocationRequest__block_invoke_2;
    v27[3] = &unk_1E9297790;
    v28[1] = (id)a2;
    objc_copyWeak(v28, location);
    objc_msgSend(v9, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.locationAwareness.highAccuracyLocationRequest"), v8, v27);

    objc_destroyWeak(v28);
    objc_destroyWeak(location);
  }
  else
  {
    if (-[RTLocationAwarenessManager requestedHighAccuracyLocation](self, "requestedHighAccuracyLocation"))
      -[RTLocationAwarenessManager onRest](self, "onRest");
    v10 = dispatch_semaphore_create(0);
    -[RTLocationAwarenessManager xpcActivityManager](self, "xpcActivityManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = MEMORY[0x1E0C809B0];
    v29[1] = 3221225472;
    v29[2] = __78__RTLocationAwarenessManager__updateXPCActivityForHighAccuracyLocationRequest__block_invoke;
    v29[3] = &unk_1E9297150;
    v12 = v10;
    v30 = v12;
    objc_msgSend(v11, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.locationAwareness.highAccuracyLocationRequest"), v29);

    v8 = v12;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(&v8->super, v14))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "timeIntervalSinceDate:", v13);
      v17 = v16;
      v18 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_107);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "filteredArrayUsingPredicate:", v19);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "firstObject");
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v18, "submitToCoreAnalytics:type:duration:", v22, 1, v17);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_fault_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)location, 2u);
      }

      v24 = (void *)MEMORY[0x1E0CB35C8];
      v31 = *MEMORY[0x1E0CB2D50];
      location[0] = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", location, &v31, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
    }

  }
}

intptr_t __78__RTLocationAwarenessManager__updateXPCActivityForHighAccuracyLocationRequest__block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __78__RTLocationAwarenessManager__updateXPCActivityForHighAccuracyLocationRequest__block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412546;
      v12 = v8;
      v13 = 2112;
      v14 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", (uint8_t *)&v11, 0x16u);

    }
    if (v5)
      v5[2](v5, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    v10 = WeakRetained;
    if (WeakRetained)
      objc_msgSend(WeakRetained, "requestForHighAccuracyLocation");
    if (v5)
      v5[2](v5, 0);

  }
}

- (void)_updateXPCActivityForObserverCount:(unint64_t)a3
{
  RTPowerAssertion *xpcActivityPowerAssertion;
  dispatch_semaphore_t v5;
  void *v6;
  NSObject *v7;
  RTXPCActivityCriteria *v8;
  void *v9;
  dispatch_time_t v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;
  _QWORD v25[4];
  id v26[2];
  _QWORD v27[4];
  NSObject *v28;
  uint64_t v29;
  id location[2];

  location[1] = *(id *)MEMORY[0x1E0C80C00];
  if (a3 == 1)
  {
    v8 = -[RTXPCActivityCriteria initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:]([RTXPCActivityCriteria alloc], "initWithInterval:gracePeriod:priority:requireNetworkConnectivity:requireInexpensiveNetworkConnectivity:networkTransferDirection:allowBattery:powerNap:", 1, 0, 0, 0, 1, 0, 3600.0, 1800.0);
    objc_initWeak(location, self);
    -[RTLocationAwarenessManager xpcActivityManager](self, "xpcActivityManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25[0] = MEMORY[0x1E0C809B0];
    v25[1] = 3221225472;
    v25[2] = __65__RTLocationAwarenessManager__updateXPCActivityForObserverCount___block_invoke_2;
    v25[3] = &unk_1E9297790;
    v26[1] = (id)a2;
    objc_copyWeak(v26, location);
    objc_msgSend(v24, "registerActivityWithIdentifier:criteria:handler:", CFSTR("com.apple.routined.locationAwareness.heartbeat"), v8, v25);

    objc_destroyWeak(v26);
    objc_destroyWeak(location);
  }
  else
  {
    if (a3)
      return;
    xpcActivityPowerAssertion = self->_xpcActivityPowerAssertion;
    self->_xpcActivityPowerAssertion = 0;

    v5 = dispatch_semaphore_create(0);
    -[RTLocationAwarenessManager xpcActivityManager](self, "xpcActivityManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __65__RTLocationAwarenessManager__updateXPCActivityForObserverCount___block_invoke;
    v27[3] = &unk_1E9297150;
    v7 = v5;
    v28 = v7;
    objc_msgSend(v6, "unregisterActivityWithIdentifier:handler:", CFSTR("com.apple.routined.locationAwareness.heartbeat"), v27);

    v8 = v7;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = dispatch_time(0, 3600000000000);
    if (dispatch_semaphore_wait(&v8->super, v10))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "now");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "timeIntervalSinceDate:", v9);
      v13 = v12;
      v14 = (void *)objc_opt_new();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithBlock:", &__block_literal_global_107);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3978], "callStackSymbols");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "filteredArrayUsingPredicate:", v15);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "firstObject");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v14, "submitToCoreAnalytics:type:duration:", v18, 1, v13);
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
      {
        LOWORD(location[0]) = 0;
        _os_log_fault_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_FAULT, "Semaphore wait timed out, we're hung!", (uint8_t *)location, 2u);
      }

      v20 = (void *)MEMORY[0x1E0CB35C8];
      v29 = *MEMORY[0x1E0CB2D50];
      location[0] = CFSTR("semaphore wait timeout");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", location, &v29, 1);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D18598], 15, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();

      if (v22)
    }

  }
}

intptr_t __65__RTLocationAwarenessManager__updateXPCActivityForObserverCount___block_invoke(uint64_t a1)
{
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void __65__RTLocationAwarenessManager__updateXPCActivityForObserverCount___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void (**v5)(id, id);
  id v6;
  NSObject *v7;
  void *v8;
  id WeakRetained;
  _QWORD v10[4];
  void (**v11)(id, id);
  uint64_t v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v6;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "%@, error, %@", buf, 0x16u);

    }
    if (v5)
      v5[2](v5, v6);
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    if (WeakRetained)
    {
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __65__RTLocationAwarenessManager__updateXPCActivityForObserverCount___block_invoke_50;
      v10[3] = &unk_1E92971A0;
      v12 = *(_QWORD *)(a1 + 40);
      v11 = v5;
      objc_msgSend(WeakRetained, "hourlySingleShotWithHandler:", v10);

    }
    else if (v5)
    {
      v5[2](v5, 0);
    }

  }
}

void __65__RTLocationAwarenessManager__updateXPCActivityForObserverCount___block_invoke_50(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 40));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v3;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, failed hourly single shot, error, %@", (uint8_t *)&v7, 0x16u);

    }
  }
  v6 = *(_QWORD *)(a1 + 32);
  if (v6)
    (*(void (**)(uint64_t, id))(v6 + 16))(v6, v3);

}

uint64_t __59__RTLocationAwarenessManager_considerRequestingForLocation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onRest");
}

- (void)hourlySingleShotWithHandler:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[5];
  id v9;
  SEL v10;

  v5 = a3;
  -[RTNotifier queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke;
  block[3] = &unk_1E9298E88;
  v9 = v5;
  v10 = a2;
  block[4] = self;
  v7 = v5;
  dispatch_async(v6, block);

}

void __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  __int128 v4;
  _QWORD v5[5];
  __int128 v6;

  objc_msgSend(*(id *)(a1 + 32), "wifiManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_2;
  v5[3] = &unk_1E92A3B10;
  v5[4] = *(_QWORD *)(a1 + 32);
  v4 = *(_OWORD *)(a1 + 40);
  v3 = (id)v4;
  v6 = v4;
  objc_msgSend(v2, "fetchPowerStatus:", v5);

}

void __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint64_t v10;
  uint64_t v11;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_3;
  v8[3] = &unk_1E92A3AE8;
  v6 = *(void **)(a1 + 40);
  v5 = *(_QWORD *)(a1 + 48);
  v10 = a2;
  v11 = v5;
  v7 = v6;
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v7;
  dispatch_async(v4, v8);

}

void __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[4];
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 48) == 2)
  {
    objc_msgSend((id)objc_opt_class(), "powerAssertion");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setXpcActivityPowerAssertion:", v2);

    objc_msgSend(*(id *)(a1 + 32), "locationManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_54;
    v7[3] = &unk_1E929AAC0;
    v4 = *(void **)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v4;
    objc_msgSend(v3, "fetchCurrentLocationWithHandler:", v7);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(*(SEL *)(a1 + 56));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v10 = v6;
      _os_log_debug_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_DEBUG, "%@, wifi requirement not satisfied, defer hourly single shot", buf, 0xCu);

    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

void __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_54(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  void *v6;
  id v7;
  _QWORD block[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_2_55;
  block[3] = &unk_1E9299330;
  v6 = *(void **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  v9 = v4;
  v10 = v6;
  v7 = v4;
  dispatch_async(v5, block);

}

uint64_t __58__RTLocationAwarenessManager_hourlySingleShotWithHandler___block_invoke_2_55(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setXpcActivityPowerAssertion:", 0);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
}

- (void)requestForHighAccuracyLocation
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__RTLocationAwarenessManager_requestForHighAccuracyLocation__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __60__RTLocationAwarenessManager_requestForHighAccuracyLocation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestForHighAccuracyLocation");
}

- (void)_requestForHighAccuracyLocation
{
  NSObject *v4;
  NSDate *v5;
  NSDate *activeOnset;
  void *v7;
  void *v8;
  RTTimerManager *timerManager;
  void *v10;
  objc_class *v11;
  void *v12;
  void *v13;
  void *v14;
  RTTimer *v15;
  RTTimer *v16;
  NSObject *v17;
  void *v18;
  RTTimer *v19;
  void *v20;
  uint64_t v21;
  RTTimer *v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  void *v28;
  RTTimer *restTimer;
  _QWORD v30[5];
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  RTTimer *v34;
  __int16 v35;
  uint64_t v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (self->_restTimer
    && !-[RTLocationAwarenessManager requestedHighAccuracyLocation](self, "requestedHighAccuracyLocation"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      restTimer = self->_restTimer;
      *(_DWORD *)buf = 138412546;
      v32 = v28;
      v33 = 2048;
      v34 = restTimer;
      _os_log_debug_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_DEBUG, "%@, Stop rest timer %p to start high accuracy location request.", buf, 0x16u);

    }
    -[RTLocationAwarenessManager onRest](self, "onRest");
  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (NSDate *)objc_claimAutoreleasedReturnValue();
  activeOnset = self->_activeOnset;
  self->_activeOnset = v5;

  -[RTLocationAwarenessManager setRequestedHighAccuracyLocation:](self, "setRequestedHighAccuracyLocation:", 1);
  -[RTLocationAwarenessManager locationManager](self, "locationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:", self, sel_onNoOpLocationNotification_, v8);

  timerManager = self->_timerManager;
  v10 = (void *)MEMORY[0x1E0CB3940];
  v11 = (objc_class *)objc_opt_class();
  NSStringFromClass(v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringWithFormat:", CFSTR("%@.restTimer"), v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[RTNotifier queue](self, "queue");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x1E0C809B0];
  v30[1] = 3221225472;
  v30[2] = __61__RTLocationAwarenessManager__requestForHighAccuracyLocation__block_invoke;
  v30[3] = &unk_1E92977B8;
  v30[4] = self;
  -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", v13, v14, v30);
  v15 = (RTTimer *)objc_claimAutoreleasedReturnValue();
  v16 = self->_restTimer;
  self->_restTimer = v15;

  _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessManager restTimer](self, "restTimer");
    v19 = (RTTimer *)objc_claimAutoreleasedReturnValue();
    -[RTLocationAwarenessManager config](self, "config");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "highAccuracyLocationRequestDuration");
    *(_DWORD *)buf = 138412802;
    v32 = v18;
    v33 = 2048;
    v34 = v19;
    v35 = 2048;
    v36 = v21;
    _os_log_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_INFO, "%@, Start rest timer, %p, firing delay, %f secs.", buf, 0x20u);

  }
  v22 = self->_restTimer;
  -[RTLocationAwarenessManager config](self, "config");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "highAccuracyLocationRequestDuration");
  v25 = v24;
  -[RTLocationAwarenessManager config](self, "config");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "dispatchTimerLeeway");
  -[RTTimer fireAfterDelay:interval:leeway:](v22, "fireAfterDelay:interval:leeway:", v25, INFINITY, v27);

  -[RTTimer resume](self->_restTimer, "resume");
}

uint64_t __61__RTLocationAwarenessManager__requestForHighAccuracyLocation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "onRest");
}

- (void)requestForFixedRateLocation
{
  NSObject *v3;
  _QWORD block[5];

  -[RTNotifier queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __57__RTLocationAwarenessManager_requestForFixedRateLocation__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __57__RTLocationAwarenessManager_requestForFixedRateLocation__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_requestForFixedRateLocation");
}

- (void)_requestForFixedRateLocation
{
  NSObject *v3;
  void *v4;
  id v5;
  uint8_t buf[4];
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  if (-[RTLocationAwarenessManager requestedFixedRateLocation](self, "requestedFixedRateLocation"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v7 = "-[RTLocationAwarenessManager _requestForFixedRateLocation]";
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%s, Rhythmic request ongoing, do nothing", buf, 0xCu);
    }

  }
  else
  {
    -[RTLocationAwarenessManager locationManager](self, "locationManager");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyRhythmicNonWaking, "notificationName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:", self, sel_onNoOpLocationNotification_, v4);

  }
}

- (void)onMotionActivityManagerNotificationActivityNotification:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  NSObject *v19;
  RTLocationAwarenessManager *v20;
  SEL v21;
  _QWORD v22[4];
  NSObject *v23;
  RTLocationAwarenessManager *v24;
  uint8_t buf[4];
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTMotionActivityManagerNotificationActivity, "notificationName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqualToString:", v7);

  if (v8)
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __86__RTLocationAwarenessManager_onMotionActivityManagerNotificationActivityNotification___block_invoke;
    v22[3] = &unk_1E9297540;
    v23 = v5;
    v24 = self;
    v9 = (void *)MEMORY[0x1D8232094](v22);
    -[RTNotifier queue](self, "queue");
    v10 = objc_claimAutoreleasedReturnValue();
    dispatch_async(v10, v9);

    v11 = v23;
  }
  else
  {
    objc_msgSend(v5, "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTNotification notificationName](RTMotionActivityManagerNotificationMotionSettledStateChange, "notificationName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v12, "isEqualToString:", v13);

    if (v14)
    {
      v18[0] = MEMORY[0x1E0C809B0];
      v18[1] = 3221225472;
      v18[2] = __86__RTLocationAwarenessManager_onMotionActivityManagerNotificationActivityNotification___block_invoke_2;
      v18[3] = &unk_1E9297BC8;
      v19 = v5;
      v20 = self;
      v21 = a2;
      v15 = (void *)MEMORY[0x1D8232094](v18);
      -[RTNotifier queue](self, "queue");
      v16 = objc_claimAutoreleasedReturnValue();
      dispatch_async(v16, v15);

      v11 = v19;
    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v5, "name");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v26 = v17;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "unsupported notification, %@", buf, 0xCu);

      }
    }
  }

}

void __86__RTLocationAwarenessManager_onMotionActivityManagerNotificationActivityNotification___block_invoke(uint64_t a1)
{
  BOOL v2;
  void *v3;
  void *v4;
  id *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  id v11;

  objc_msgSend(*(id *)(a1 + 32), "activity");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (!v11
    || objc_msgSend(v11, "type") != 1
    || (v2 = objc_msgSend(v11, "confidence") == 2, v3 = v11, !v2)
    && (v2 = objc_msgSend(v11, "confidence") == 3, v3 = v11, !v2))
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (id *)(a1 + 40);
    goto LABEL_9;
  }
  objc_msgSend(v3, "startDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *(void **)(a1 + 40);
  v5 = (id *)(a1 + 40);
  objc_msgSend(v6, "stationaryStartTimestamp");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceDate:", v7);
  v9 = v8;

  if (v9 < 0.0)
  {
    objc_msgSend(v11, "startDate");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
    objc_msgSend(*v5, "setStationaryStartTimestamp:", v10);

  }
}

void __86__RTLocationAwarenessManager_onMotionActivityManagerNotificationActivityNotification___block_invoke_2(uint64_t a1)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(v2, "settledState") == 1
    && objc_msgSend(*(id *)(a1 + 40), "requestedHighAccuracyLocation"))
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = 138412290;
      v6 = v4;
      _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "%@, received unsettled notification, stop requesting high accuracy location", (uint8_t *)&v5, 0xCu);

    }
    objc_msgSend(*(id *)(a1 + 40), "onRest");
  }

}

+ (id)powerAssertion
{
  RTPowerAssertion *v2;
  objc_class *v3;
  void *v4;
  RTPowerAssertion *v5;

  v2 = [RTPowerAssertion alloc];
  v3 = (objc_class *)objc_opt_class();
  NSStringFromClass(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[RTPowerAssertion initWithIdentifier:timeout:](v2, "initWithIdentifier:timeout:", v4, 15.0);

  return v5;
}

- (void)updateMinHeartbeatBucket
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  id obj;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  int v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v26 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[RTLocationAwarenessManager heartbeatBucketToRequesters](self, "heartbeatBucketToRequesters");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  if (!v3)
  {
    v5 = 0;
    goto LABEL_17;
  }
  v4 = v3;
  v5 = 0;
  v6 = *(_QWORD *)v32;
  do
  {
    for (i = 0; i != v4; ++i)
    {
      if (*(_QWORD *)v32 != v6)
        objc_enumerationMutation(obj);
      v8 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
      -[RTLocationAwarenessManager heartbeatBucketToRequesters](self, "heartbeatBucketToRequesters");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKey:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (!v10)
      {

LABEL_12:
        objc_msgSend(v26, "addObject:", v8);
        goto LABEL_13;
      }
      objc_msgSend(v10, "allObjects");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "count");

      if (!v13)
        goto LABEL_12;
      if (!v5 || objc_msgSend(v5, "compare:", v8) == 1)
      {
        v14 = v8;

        v5 = v14;
      }
LABEL_13:

    }
    v4 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
  }
  while (v4);
LABEL_17:

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v15 = v26;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v28;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v20 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * j);
        -[RTLocationAwarenessManager heartbeatBucketToRequesters](self, "heartbeatBucketToRequesters");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "removeObjectForKey:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
    }
    while (v17);
  }

  if (!v5)
  {
    -[RTLocationAwarenessManager heartbeatBucketToRequesters](self, "heartbeatBucketToRequesters");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "count");

    if (v23)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 136315394;
        v36 = "-[RTLocationAwarenessManager updateMinHeartbeatBucket]";
        v37 = 1024;
        v38 = 866;
        _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "If minBucket is nil, heartbeatBucketToRequesters should be empty. (in %s:%d)", buf, 0x12u);
      }

    }
  }
  -[RTLocationAwarenessManager setMinHeartbeatBucket:](self, "setMinHeartbeatBucket:", v5);

}

void __50__RTLocationAwarenessManager_adjustHeartbeatTimer__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained, "updateHeartbeatTimerDelayForTimestamp:withDelay:", *(_QWORD *)(a1 + 32), 0.0);
    objc_msgSend(v3, "considerRequestingForLocation");
    WeakRetained = v3;
  }

}

void __50__RTLocationAwarenessManager_adjustHeartbeatTimer__block_invoke_62(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "onHeartbeat");

}

uint64_t __41__RTLocationAwarenessManager_onHeartbeat__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "heartbeatTasks");
}

- (void)onRest
{
  NSObject *v4;
  void *v5;
  void *v6;
  RTTimer *restTimer;
  void *v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self->_restTimer)
  {
    _rt_log_facility_get_os_log(RTLogFacilityLocationAwareness);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      NSStringFromSelector(a2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[RTLocationAwarenessManager restTimer](self, "restTimer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 138412546;
      v14 = v5;
      v15 = 2048;
      v16 = v6;
      _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@, Invalidate rest timer, %p.", (uint8_t *)&v13, 0x16u);

    }
    -[RTTimer invalidate](self->_restTimer, "invalidate");
    restTimer = self->_restTimer;
    self->_restTimer = 0;

  }
  -[RTLocationAwarenessManager activeOnset](self, "activeOnset");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    v9 = -[RTLocationAwarenessManager requestedHighAccuracyLocation](self, "requestedHighAccuracyLocation");
    -[RTLocationAwarenessManager locationManager](self, "locationManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyBest, "notificationName");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:fromNotification:", self, v11);

      -[RTLocationAwarenessManager setRequestedHighAccuracyLocation:](self, "setRequestedHighAccuracyLocation:", 0);
    }
    else
    {
      +[RTNotification notificationName](RTLocationManagerNotificationLocationsAccuracyHundredMeters, "notificationName");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "removeObserver:fromNotification:", self, v12);

    }
    -[RTLocationAwarenessManager considerUpdateActiveRequestMetrics](self, "considerUpdateActiveRequestMetrics");
  }
}

- (BOOL)validInterval:(double)a3
{
  void *v4;
  double v5;
  BOOL v6;

  if (a3 <= 0.0)
    return 0;
  -[RTLocationAwarenessManager config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "maxHeartbeatInterval");
  v6 = v5 >= a3;

  return v6;
}

- (BOOL)coarseLocation:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  BOOL v14;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "horizontalAccuracy");
    v7 = v6;
    -[RTLocationAwarenessManager config](self, "config");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "requiredHorizontalAccuracy");
    if (v7 <= v9)
    {
      v14 = 0;
    }
    else
    {
      objc_msgSend(v5, "horizontalAccuracy");
      v11 = v10;
      -[RTLocationAwarenessManager config](self, "config");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "maxHorizontalAccuracyForCoarseLocation");
      v14 = v11 <= v13;

    }
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (id)heartbeatBucketForInterval:(double)a3
{
  void *v4;
  double v5;
  unint64_t v6;

  -[RTLocationAwarenessManager config](self, "config");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "heartbeatIntervalResolution");
  v6 = vcvtpd_u64_f64(a3 / v5);

  return (id)objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v6);
}

- (void)setMetrics:(id)a3
{
  objc_storeStrong((id *)&self->_metrics, a3);
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_metricManager, a3);
}

- (RTAuthorizationManager)authorizationManager
{
  return self->_authorizationManager;
}

- (void)setAuthorizationManager:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationManager, a3);
}

- (RTWiFiManager)wifiManager
{
  return self->_wifiManager;
}

- (void)setWifiManager:(id)a3
{
  objc_storeStrong((id *)&self->_wifiManager, a3);
}

- (CLLocation)lastLocationLessThan20m
{
  return self->_lastLocationLessThan20m;
}

- (void)setLastLocationLessThan20m:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocationLessThan20m, a3);
}

- (CLLocation)lastLocationLessThan10m
{
  return self->_lastLocationLessThan10m;
}

- (void)setLastLocationLessThan10m:(id)a3
{
  objc_storeStrong((id *)&self->_lastLocationLessThan10m, a3);
}

- (NSDate)scheduledRestTimerFiringTime
{
  return self->_scheduledRestTimerFiringTime;
}

- (void)setScheduledRestTimerFiringTime:(id)a3
{
  objc_storeStrong((id *)&self->_scheduledRestTimerFiringTime, a3);
}

- (BOOL)activeRequestInterrupted
{
  return self->_activeRequestInterrupted;
}

- (void)setActiveRequestInterrupted:(BOOL)a3
{
  self->_activeRequestInterrupted = a3;
}

- (BOOL)activeRequestFulfilled
{
  return self->_activeRequestFulfilled;
}

- (void)setActiveRequestFulfilled:(BOOL)a3
{
  self->_activeRequestFulfilled = a3;
}

- (BOOL)activeRequestCoarseLocationReceived
{
  return self->_activeRequestCoarseLocationReceived;
}

- (void)setActiveRequestCoarseLocationReceived:(BOOL)a3
{
  self->_activeRequestCoarseLocationReceived = a3;
}

- (BOOL)activeRequestLocationServiceOn
{
  return self->_activeRequestLocationServiceOn;
}

- (void)setActiveRequestLocationServiceOn:(BOOL)a3
{
  self->_activeRequestLocationServiceOn = a3;
}

- (BOOL)activeRequestRoutineOn
{
  return self->_activeRequestRoutineOn;
}

- (void)setActiveRequestRoutineOn:(BOOL)a3
{
  self->_activeRequestRoutineOn = a3;
}

- (BOOL)activeRequestWifiOn
{
  return self->_activeRequestWifiOn;
}

- (void)setActiveRequestWifiOn:(BOOL)a3
{
  self->_activeRequestWifiOn = a3;
}

- (NSMapTable)requesterToHeartbeatBucket
{
  return self->_requesterToHeartbeatBucket;
}

- (void)setRequesterToHeartbeatBucket:(id)a3
{
  objc_storeStrong((id *)&self->_requesterToHeartbeatBucket, a3);
}

- (NSMapTable)heartbeatBucketToRequesters
{
  return self->_heartbeatBucketToRequesters;
}

- (void)setHeartbeatBucketToRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatBucketToRequesters, a3);
}

- (RTLearnedLocationStore)learnedLocationStore
{
  return self->_learnedLocationStore;
}

- (void)setLearnedLocationStore:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationStore, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (void)setHeartbeatTimer:(id)a3
{
  objc_storeStrong((id *)&self->_heartbeatTimer, a3);
}

- (RTTimer)restTimer
{
  return self->_restTimer;
}

- (void)setRestTimer:(id)a3
{
  objc_storeStrong((id *)&self->_restTimer, a3);
}

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (void)setActiveOnset:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 192);
}

- (RTMotionActivityManager)motionActivityManager
{
  return self->_motionActivityManager;
}

- (void)setMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityManager, a3);
}

- (RTPowerAssertion)xpcActivityPowerAssertion
{
  return self->_xpcActivityPowerAssertion;
}

- (void)setXpcActivityPowerAssertion:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityPowerAssertion, a3);
}

- (RTXPCActivityManager)xpcActivityManager
{
  return self->_xpcActivityManager;
}

- (void)setXpcActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_xpcActivityManager, a3);
}

- (void)setStationaryStartTimestamp:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 240);
}

- (RTInvocationDispatcher)heartbeatBuffer
{
  return self->_heartbeatBuffer;
}

- (void)setHeartbeatBuffer:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 248);
}

- (NSMutableSet)highAccuracyLocationRequesters
{
  return self->_highAccuracyLocationRequesters;
}

- (void)setHighAccuracyLocationRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_highAccuracyLocationRequesters, a3);
}

- (NSMutableSet)fixedRateLocationRequesters
{
  return self->_fixedRateLocationRequesters;
}

- (void)setFixedRateLocationRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_fixedRateLocationRequesters, a3);
}

- (BOOL)requestedHighAccuracyLocation
{
  return self->_requestedHighAccuracyLocation;
}

- (void)setRequestedHighAccuracyLocation:(BOOL)a3
{
  self->_requestedHighAccuracyLocation = a3;
}

- (BOOL)requestedFixedRateLocation
{
  return self->_requestedFixedRateLocation;
}

- (void)setRequestedFixedRateLocation:(BOOL)a3
{
  self->_requestedFixedRateLocation = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fixedRateLocationRequesters, 0);
  objc_storeStrong((id *)&self->_highAccuracyLocationRequesters, 0);
  objc_storeStrong((id *)&self->_heartbeatBuffer, 0);
  objc_storeStrong((id *)&self->_stationaryStartTimestamp, 0);
  objc_storeStrong((id *)&self->_xpcActivityManager, 0);
  objc_storeStrong((id *)&self->_xpcActivityPowerAssertion, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_lastValidLocation, 0);
  objc_storeStrong((id *)&self->_minHeartbeatBucket, 0);
  objc_storeStrong((id *)&self->_activeOnset, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_restTimer, 0);
  objc_storeStrong((id *)&self->_heartbeatTimer, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationStore, 0);
  objc_storeStrong((id *)&self->_heartbeatBucketToRequesters, 0);
  objc_storeStrong((id *)&self->_requesterToHeartbeatBucket, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_scheduledRestTimerFiringTime, 0);
  objc_storeStrong((id *)&self->_scheduledHeartbeatFiringTime, 0);
  objc_storeStrong((id *)&self->_lastLocationLessThan10m, 0);
  objc_storeStrong((id *)&self->_lastLocationLessThan20m, 0);
  objc_storeStrong((id *)&self->_lastLocationLessThan55m, 0);
  objc_storeStrong((id *)&self->_lastLocationLessThan200m, 0);
  objc_storeStrong((id *)&self->_lastLocationAnyPositive, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
  objc_storeStrong((id *)&self->_authorizationManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_metrics, 0);
}

@end
