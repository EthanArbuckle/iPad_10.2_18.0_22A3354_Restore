@implementation RTVisitMonitor

id __49__RTVisitMonitor_onLeechedLocationsNotification___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D183B0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithCLLocation:", v3);

  return v4;
}

void __49__RTVisitMonitor_onLeechedLocationsNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  int v4;
  id v5;
  _RTMap *v6;
  void *v7;
  _RTMap *v8;
  NSObject *v9;
  objc_class *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  const char *v22;
  __int16 v23;
  int v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqualToString:", v3);

  if (v4)
  {
    v5 = *(id *)(a1 + 32);
    v6 = [_RTMap alloc];
    objc_msgSend(v5, "leechedLocations");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[_RTMap initWithInput:](v6, "initWithInput:", v7);
    -[_RTMap withBlock:](v8, "withBlock:", &__block_literal_global_116);
    v14 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "_processLeechedLocations:", v14);
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v10 = (objc_class *)objc_opt_class();
      NSStringFromClass(v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 32), "name");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413314;
      v16 = v11;
      v17 = 2112;
      v18 = v12;
      v19 = 2112;
      v21 = 2080;
      v20 = v13;
      v22 = "-[RTVisitMonitor onLeechedLocationsNotification:]_block_invoke";
      v23 = 1024;
      v24 = 1181;
      _os_log_error_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_ERROR, "%@, %@, unhandled notification, %@ (in %s:%d)", buf, 0x30u);

    }
  }
}

- (void)_processLeechedLocations:(id)a3
{
  RTVisitFeedBuffer *feedBuffer;

  feedBuffer = self->_feedBuffer;
  if (feedBuffer)
  {
    -[RTVisitFeedBuffer addLocations:](feedBuffer, "addLocations:", a3);
    -[RTVisitMonitor _startFeedBufferTimer](self, "_startFeedBufferTimer");
  }
}

- (void)onLeechedLocationsNotification:(id)a3
{
  id v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  RTVisitMonitor *v10;
  SEL v11;

  v5 = a3;
  -[RTVisitMonitor queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__RTVisitMonitor_onLeechedLocationsNotification___block_invoke;
  block[3] = &unk_1E9297BC8;
  v9 = v5;
  v10 = self;
  v11 = a2;
  v7 = v5;
  dispatch_async(v6, block);

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

void __39__RTVisitMonitor__startFeedBufferTimer__block_invoke(uint64_t a1)
{
  NSObject *v2;
  id *WeakRetained;
  id v4;
  uint8_t v5[16];

  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v5 = 0;
    _os_log_debug_impl(&dword_1D1A22000, v2, OS_LOG_TYPE_DEBUG, "feedBuffer timer expiry", v5, 2u);
  }

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained[2], "invalidate");
  v4 = WeakRetained[2];
  WeakRetained[2] = 0;

  objc_msgSend(WeakRetained, "_processMatureLocations");
  objc_msgSend(WeakRetained, "_startFeedBufferTimer");

}

- (void)_startFeedBufferTimer
{
  RTTimerManager *timerManager;
  void *v4;
  RTTimer *v5;
  RTTimer *feedBufferTimer;
  RTTimer *v7;
  double v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  if (!self->_feedBufferTimer)
  {
    if (-[RTVisitFeedBuffer numLocations](self->_feedBuffer, "numLocations"))
    {
      objc_initWeak(&location, self);
      timerManager = self->_timerManager;
      -[RTVisitMonitor queue](self, "queue");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = MEMORY[0x1E0C809B0];
      v10 = 3221225472;
      v11 = __39__RTVisitMonitor__startFeedBufferTimer__block_invoke;
      v12 = &unk_1E92983E8;
      objc_copyWeak(&v13, &location);
      -[RTTimerManager timerWithIdentifier:queue:handler:](timerManager, "timerWithIdentifier:queue:handler:", CFSTR("com.apple.routined.visit.feedbuffer.timer"), v4, &v9);
      v5 = (RTTimer *)objc_claimAutoreleasedReturnValue();
      feedBufferTimer = self->_feedBufferTimer;
      self->_feedBufferTimer = v5;

      v7 = self->_feedBufferTimer;
      -[RTVisitFeedBuffer minWaitInterval](self->_feedBuffer, "minWaitInterval", v9, v10, v11, v12);
      -[RTTimer fireAfterDelay:](v7, "fireAfterDelay:", v8 * 0.5);
      -[RTTimer resume](self->_feedBufferTimer, "resume");
      objc_destroyWeak(&v13);
      objc_destroyWeak(&location);
    }
  }
}

- (void)_processMatureLocations
{
  unint64_t v4;
  unint64_t v5;
  void *v6;
  NSObject *v7;
  NSMutableDictionary *pipelines;
  void *v9;
  _QWORD v10[4];
  id v11;
  RTVisitMonitor *v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  unint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = -[RTVisitFeedBuffer numLocations](self->_feedBuffer, "numLocations");
  if (v4)
  {
    v5 = v4;
    -[RTVisitFeedBuffer maturedLocations](self->_feedBuffer, "maturedLocations");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      NSStringFromSelector(a2);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v14 = v9;
      v15 = 2048;
      v16 = objc_msgSend(v6, "count");
      v17 = 2048;
      v18 = v5;
      _os_log_debug_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_DEBUG, "%@, processing %lu/%lu matured locations from feedBuffer", buf, 0x20u);

    }
    if (objc_msgSend(v6, "count"))
    {
      pipelines = self->_pipelines;
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __41__RTVisitMonitor__processMatureLocations__block_invoke;
      v10[3] = &unk_1E929C8F8;
      v11 = v6;
      v12 = self;
      -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](pipelines, "enumerateKeysAndObjectsUsingBlock:", v10);

    }
  }
}

void __41__RTVisitMonitor__processMatureLocations__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;

  v5 = a3;
  if (objc_msgSend(v5, "bootStrappingDone"))
  {
    objc_msgSend(v5, "processLocations:", *(_QWORD *)(a1 + 32));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_processRealtimeVisits:pipeline:", v4, v5);

  }
}

- (void)_processRealtimeVisits:(id)a3 pipeline:(id)a4
{
  id v7;
  id v8;
  _RTMap *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t j;
  void *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  NSObject *v38;
  void *v39;
  void *v40;
  id v41;
  const char *v42;
  void *v43;
  NSObject *obj;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  uint64_t v50;
  uint64_t v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD v57[5];
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  uint64_t v61;
  __int16 v62;
  id v63;
  __int16 v64;
  id v65;
  _BYTE v66[128];
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  if (v8)
  {
    if (objc_msgSend(v7, "count"))
    {
      v9 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v7);
      v57[0] = MEMORY[0x1E0C809B0];
      v57[1] = 3221225472;
      v57[2] = __50__RTVisitMonitor__processRealtimeVisits_pipeline___block_invoke;
      v57[3] = &unk_1E929C920;
      v57[4] = self;
      -[_RTMap withBlock:](v9, "withBlock:", v57);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "type") == 2)
      {
        v42 = a2;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        obj = v10;
        v11 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
        if (v11)
        {
          v12 = v11;
          v40 = v10;
          v41 = v7;
          v43 = v8;
          v13 = 0;
          v14 = *(_QWORD *)v54;
          while (1)
          {
            for (i = 0; i != v12; ++i)
            {
              if (*(_QWORD *)v54 != v14)
                objc_enumerationMutation(obj);
              v16 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * i);
              -[RTVisitMonitor visitLabeler](self, "visitLabeler");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(MEMORY[0x1E0CB34D0], "_coreroutineBundle");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "bundleIdentifier");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = 0;
              objc_msgSend(v17, "labelVisit:clientIdentifier:error:", v16, v19, &v52);
              v20 = v52;

              -[RTVisitMonitor handleVisitIncident:](self, "handleVisitIncident:", v16);
              if (objc_msgSend(v16, "type") == 1)
              {
                -[RTVisitMonitor locationAwarenessManager](self, "locationAwarenessManager");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v51 = 0;
                objc_msgSend(v21, "addHighAccuracyLocationRequester:error:", self, &v51);
              }
              else
              {
                if (objc_msgSend(v16, "type") != 3)
                  goto LABEL_14;
                -[RTVisitMonitor locationAwarenessManager](self, "locationAwarenessManager");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                v50 = 0;
                objc_msgSend(v21, "removeHighAccuracyLocationRequester:error:", self, &v50);
              }

LABEL_14:
              _rt_log_facility_get_os_log(RTLogFacilityVisit);
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v43, "name");
                v23 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v59 = v23;
                v60 = 2048;
                v61 = v13 + i + 1;
                v62 = 2112;
                v63 = v16;
                _os_log_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_INFO, "pipeline, %@, visit %lu, %@", buf, 0x20u);

              }
            }
            v12 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v53, v67, 16);
            v13 += i;
            if (!v12)
              goto LABEL_32;
          }
        }
      }
      else if (objc_msgSend(v8, "type") == 1)
      {
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        obj = v10;
        v25 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
        if (v25)
        {
          v26 = v25;
          v40 = v10;
          v41 = v7;
          v42 = a2;
          v43 = v8;
          v27 = 0;
          v28 = *(_QWORD *)v47;
          do
          {
            for (j = 0; j != v26; ++j)
            {
              if (*(_QWORD *)v47 != v28)
                objc_enumerationMutation(obj);
              v30 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
              -[RTVisitMonitor handleLowConfidenceVisitIncident:](self, "handleLowConfidenceVisitIncident:", v30);
              _rt_log_facility_get_os_log(RTLogFacilityVisit);
              v31 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                objc_msgSend(v43, "name");
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412802;
                v59 = v32;
                v60 = 2048;
                v61 = v27 + j + 1;
                v62 = 2112;
                v63 = v30;
                _os_log_impl(&dword_1D1A22000, v31, OS_LOG_TYPE_INFO, "pipeline, %@, visit %lu, %@", buf, 0x20u);

              }
            }
            v26 = -[NSObject countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v46, v66, 16);
            v27 += j;
          }
          while (v26);
LABEL_32:
          v7 = v41;
          a2 = v42;
          v8 = v43;
          v10 = v40;
        }
      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        obj = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(obj, OS_LOG_TYPE_FAULT))
        {
          NSStringFromSelector(a2);
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v59 = v33;
          v60 = 2112;
          v61 = (uint64_t)v8;
          _os_log_fault_impl(&dword_1D1A22000, obj, OS_LOG_TYPE_FAULT, "%@, pipline does not support realtime visits, %@", buf, 0x16u);

        }
      }

      objc_msgSend(v10, "lastObject");
      v34 = (void *)objc_claimAutoreleasedReturnValue();

      if (v34)
      {
        v35 = v10;
        objc_msgSend(v10, "lastObject");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 0;
        -[RTVisitMonitor _setupGeoFencesForVisit:pipelineType:error:](self, "_setupGeoFencesForVisit:pipelineType:error:", v36, objc_msgSend(v8, "type"), &v45);
        v37 = v45;
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v38 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(a2);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v59 = v39;
          v60 = 2112;
          v61 = (uint64_t)v36;
          v62 = 2112;
          v63 = v8;
          v64 = 2112;
          v65 = v37;
          _os_log_impl(&dword_1D1A22000, v38, OS_LOG_TYPE_INFO, "%@, setupGeoFences for visit, %@, pipeline, %@, error %@", buf, 0x2Au);

        }
        v10 = v35;
      }

    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pipeline", buf, 2u);
    }

  }
}

+ (double)LocationHeartbeatWhileAwake
{
  void *v2;
  void *v3;
  double v4;
  double v5;
  NSObject *v6;
  int v8;
  const __CFString *v9;
  __int16 v10;
  double v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("VisitMonitorLocationHeartbeatIntervalWhileAwake"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = 138412546;
      v9 = CFSTR("VisitMonitorLocationHeartbeatIntervalWhileAwake");
      v10 = 2048;
      v11 = v5;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@ overridden to %.1fs", (uint8_t *)&v8, 0x16u);
    }

  }
  else
  {
    v5 = 300.0;
  }

  return v5;
}

+ (id)regionMonitoringClientIdentifierForPipelineType:(unint64_t)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTVisitPipeline typeToString:](RTVisitPipeline, "typeToString:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@.%@"), v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (RTVisitMonitor)init
{
  uint64_t v2;

  v2 = objc_opt_class();
  _RTRequireInitializer(v2, sel_initWithDefaultsManager_deviceLocationPredictor_distanceCalculator_hintManager_learnedLocationManager_locationAwarenessManager_locationManager_metricManager_motionActivityManager_platform_queue_state_timerManager_visitLabeler_);
}

- (RTVisitMonitor)initWithDefaultsManager:(id)a3 deviceLocationPredictor:(id)a4 hintManager:(id)a5 learnedLocationManager:(id)a6 locationAwarenessManager:(id)a7 locationManager:(id)a8 metricManager:(id)a9 motionActivityManager:(id)a10 platform:(id)a11 queue:(id)a12 state:(id)a13 visitLabeler:(id)a14
{
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  RTVisitMonitor *v23;
  id v25;
  id v26;
  id v27;
  id v29;
  void *v30;
  id v31;
  id v32;
  void *v34;
  id v35;
  id v37;

  v35 = a14;
  v32 = a13;
  v31 = a12;
  v25 = a11;
  v18 = a10;
  v27 = a9;
  v37 = a8;
  v26 = a7;
  v19 = a6;
  v20 = a5;
  v29 = a4;
  v21 = a3;
  v30 = (void *)objc_opt_new();
  v34 = (void *)objc_opt_new();
  v22 = v19;
  v23 = -[RTVisitMonitor initWithDefaultsManager:deviceLocationPredictor:distanceCalculator:hintManager:learnedLocationManager:locationAwarenessManager:locationManager:metricManager:motionActivityManager:platform:queue:state:timerManager:visitLabeler:](self, "initWithDefaultsManager:deviceLocationPredictor:distanceCalculator:hintManager:learnedLocationManager:locationAwarenessManager:locationManager:metricManager:motionActivityManager:platform:queue:state:timerManager:visitLabeler:", v21, v29, v30, v20, v19, v26, v37, v27, v18, v25, v31, v32, v34, v35);

  return v23;
}

- (RTVisitMonitor)initWithDefaultsManager:(id)a3 deviceLocationPredictor:(id)a4 distanceCalculator:(id)a5 hintManager:(id)a6 learnedLocationManager:(id)a7 locationAwarenessManager:(id)a8 locationManager:(id)a9 metricManager:(id)a10 motionActivityManager:(id)a11 platform:(id)a12 queue:(id)a13 state:(id)a14 timerManager:(id)a15 visitLabeler:(id)a16
{
  id v21;
  id v22;
  id v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  RTVisitMonitor *v28;
  RTVisitMonitor *v29;
  uint64_t v30;
  NSMutableDictionary *pipelines;
  uint64_t v32;
  NSMutableSet *pipelinesMonitoringRegion;
  RTVisitMonitor *v34;
  NSObject *v35;
  void *v36;
  void *v37;
  void *v38;
  NSObject *v39;
  NSObject *v40;
  NSObject *v41;
  const char *v42;
  NSObject *v44;
  id v46;
  id v47;
  id v48;
  id v49;
  id v50;
  id v51;
  void *v52;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  id v59;
  id v60;
  objc_super v61;
  uint8_t buf[16];

  v60 = a3;
  v49 = a4;
  v59 = a5;
  v46 = a6;
  v58 = a6;
  v47 = a7;
  v51 = a7;
  v48 = a8;
  v50 = a8;
  v21 = a9;
  v22 = a10;
  v23 = a11;
  v57 = a12;
  v56 = a13;
  v55 = a14;
  v54 = a15;
  v24 = a16;
  v52 = v24;
  if (!v60)
  {
    v25 = v49;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v35, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: defaultsManager", buf, 2u);
    }

    v34 = 0;
    v36 = v59;
    v37 = v60;
    v38 = v58;
    v27 = v50;
    v26 = v51;
    goto LABEL_50;
  }
  v25 = v49;
  if (!v49)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v39 = objc_claimAutoreleasedReturnValue();
    v38 = v58;
    v36 = v59;
    v27 = v50;
    v26 = v51;
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v39, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: deviceLocationPredictor", buf, 2u);
    }

    v34 = 0;
    v37 = v60;
    goto LABEL_50;
  }
  v27 = v50;
  v26 = v51;
  if (!v59)
  {
    v38 = v58;
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: distanceCalculator", buf, 2u);
    }

    v34 = 0;
    v36 = v59;
    v37 = v60;
    goto LABEL_50;
  }
  if (!v58)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: hintManager";
LABEL_47:
    _os_log_error_impl(&dword_1D1A22000, v41, OS_LOG_TYPE_ERROR, v42, buf, 2u);
    goto LABEL_48;
  }
  if (!v51)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: learnedLocationManager";
    goto LABEL_47;
  }
  if (!v50)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: locationAwarenessManager";
    goto LABEL_47;
  }
  if (!v21)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: locationManager";
    goto LABEL_47;
  }
  if (!v22)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: metricManager";
    goto LABEL_47;
  }
  if (!v23)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: motionActivityManager";
    goto LABEL_47;
  }
  if (!v57)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: platform";
    goto LABEL_47;
  }
  if (!v56)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: queue";
    goto LABEL_47;
  }
  if (!v55)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
      goto LABEL_48;
    *(_WORD *)buf = 0;
    v42 = "Invalid parameter not satisfying: state";
    goto LABEL_47;
  }
  if (!v54)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v41 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      v42 = "Invalid parameter not satisfying: timerManager";
      goto LABEL_47;
    }
LABEL_48:

    v34 = 0;
LABEL_49:
    v36 = v59;
    v37 = v60;
    v38 = v58;
    goto LABEL_50;
  }
  if (v24)
  {
    v61.receiver = self;
    v61.super_class = (Class)RTVisitMonitor;
    v28 = -[RTVisitMonitor init](&v61, sel_init);
    v29 = v28;
    if (v28)
    {
      objc_storeStrong((id *)&v28->_defaultsManager, a3);
      objc_storeStrong((id *)&v29->_deviceLocationPredictor, a4);
      objc_storeStrong((id *)&v29->_distanceCalculator, a5);
      objc_storeStrong((id *)&v29->_hintManager, v46);
      objc_storeStrong((id *)&v29->_learnedLocationManager, v47);
      objc_storeStrong((id *)&v29->_locationAwarenessManager, v48);
      objc_storeStrong((id *)&v29->_locationManager, a9);
      objc_storeStrong((id *)&v29->_metricManager, a10);
      objc_storeStrong((id *)&v29->_motionActivityManager, a11);
      objc_storeStrong((id *)&v29->_platform, a12);
      objc_storeStrong((id *)&v29->_timerManager, a15);
      objc_storeStrong((id *)&v29->_state, a14);
      objc_storeStrong((id *)&v29->_queue, a13);
      v30 = objc_opt_new();
      pipelines = v29->_pipelines;
      v29->_pipelines = (NSMutableDictionary *)v30;

      v32 = objc_opt_new();
      pipelinesMonitoringRegion = v29->_pipelinesMonitoringRegion;
      v29->_pipelinesMonitoringRegion = (NSMutableSet *)v32;

      objc_storeStrong((id *)&v29->_visitLabeler, a16);
    }
    v34 = v29;
    self = v34;
    goto LABEL_49;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v44 = objc_claimAutoreleasedReturnValue();
  v36 = v59;
  v37 = v60;
  v38 = v58;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visitLabeler", buf, 2u);
  }

  v34 = 0;
LABEL_50:

  return v34;
}

- (void)shutdownWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[RTVisitMonitor queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __38__RTVisitMonitor_shutdownWithHandler___block_invoke;
  v7[3] = &unk_1E9297650;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

uint64_t __38__RTVisitMonitor_shutdownWithHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "_shutdown");
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, 0);
  return result;
}

- (void)_shutdown
{
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t v18[128];
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  RTVisitMonitor *v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v20 = v5;
    v21 = 2112;
    v22 = self;
    _os_log_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_INFO, "%@ %@", buf, 0x16u);

  }
  -[RTVisitMonitor locationManager](self, "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:", self);

  -[RTVisitMonitor locationAwarenessManager](self, "locationAwarenessManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "removeLocationHeartbeatRequester:", self);

  -[RTVisitMonitor _unregisterVisitMonitorForRegionEventsForPipelineType:](self, "_unregisterVisitMonitorForRegionEventsForPipelineType:", 2);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[RTVisitMonitor pipelines](self, "pipelines", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "shutdown");
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (double)maxHorizontalAccuracyOverride
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  -[RTVisitMonitor defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("MaxHorizontalAccuracy"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "doubleValue");
    v5 = v4;
  }
  else
  {
    v5 = -1.0;
  }

  return v5;
}

- (unint64_t)visitPipelineTypeOverride
{
  void *v2;
  void *v3;
  id v4;
  unint64_t v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  int v11;

  -[RTVisitMonitor defaultsManager](self, "defaultsManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("PlaybackVisitPipelineType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v3;
    v5 = 1;
    objc_msgSend((id)objc_opt_class(), "typeToString:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v4, "isEqualToString:", v6);

    if ((v7 & 1) == 0)
    {
      v5 = 2;
      objc_msgSend((id)objc_opt_class(), "typeToString:", 2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v4, "isEqualToString:", v8);

      if ((v9 & 1) == 0)
      {
        objc_msgSend((id)objc_opt_class(), "typeToString:", 4);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v4, "isEqualToString:", v10);

        if (v11)
          v5 = 4;
        else
          v5 = 0;
      }
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setFeedBufferReferenceCounter:(unint64_t)a3
{
  unint64_t feedBufferReferenceCounter;

  feedBufferReferenceCounter = self->_feedBufferReferenceCounter;
  if (feedBufferReferenceCounter != a3)
  {
    if (feedBufferReferenceCounter)
    {
      if (a3)
      {
LABEL_4:
        self->_feedBufferReferenceCounter = a3;
        return;
      }
    }
    else
    {
      -[RTVisitMonitor _startFeedBuffer](self, "_startFeedBuffer");
      if (a3)
        goto LABEL_4;
    }
    -[RTVisitMonitor _stopFeedBuffer](self, "_stopFeedBuffer");
    goto LABEL_4;
  }
}

- (id)_moduleWithName:(id)a3 pipelineType:(unint64_t)a4 hyperParameter:(id)a5
{
  id v8;
  id v9;
  objc_class *v10;
  void *v11;
  int v12;
  RTDelayedLocationRequester *v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  RTDelayedLocationRequester *v18;
  objc_class *v19;
  void *v20;
  int v21;
  __objc2_class *v22;
  RTVisitPipelineModuleSCI *v23;
  void *v24;
  void *v25;
  void *v26;
  RTVisitPipelineModuleSCI *v27;
  objc_class *v28;
  void *v29;
  int v30;
  uint64_t v31;
  objc_class *v33;
  void *v34;
  int v35;
  RTVisitPipelineModuleSmoother *v36;
  double v37;
  double v38;
  double v39;
  objc_class *v40;
  void *v41;
  int v42;
  RTVisitPipelineModuleTrajectorySequenceCluster *v43;
  RTVisitModelControllerBatchMode *v44;
  objc_class *v45;
  void *v46;
  int v47;
  RTVisitPipelineModuleVisitCentroidUpdater *v48;
  void *v49;
  uint64_t v50;
  objc_class *v51;
  void *v52;
  int v53;
  RTVisitPipelineModuleAltitudeEstimator *v54;
  double v55;
  double v56;
  objc_class *v57;
  void *v58;
  int v59;
  RTVisitPipelineModuleMotionStateTrimmer *v60;
  NSObject *v61;
  NSObject *v62;
  int v63;
  id v64;
  __int16 v65;
  const char *v66;
  __int16 v67;
  int v68;
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  v10 = (objc_class *)objc_opt_class();
  NSStringFromClass(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v8, "isEqualToString:", v11);

  if (v12)
  {
    if (a4 == 2)
    {
      v13 = [RTDelayedLocationRequester alloc];
      -[RTVisitMonitor locationManager](self, "locationManager");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "maxHorizontalAccuracy");
      v16 = v15;
      -[RTVisitMonitor queue](self, "queue");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[RTDelayedLocationRequester initWithLocationManager:maxHorizontalAccuracy:queue:](v13, "initWithLocationManager:maxHorizontalAccuracy:queue:", v14, v17, v16);

    }
    else
    {
      v18 = 0;
    }
    v23 = [RTVisitPipelineModuleSCI alloc];
    -[RTVisitMonitor defaultsManager](self, "defaultsManager");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitMonitor hintManager](self, "hintManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitMonitor queue](self, "queue");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = -[RTVisitPipelineModuleSCI initWithDefaultsManager:delayedLocationRequester:hintManager:queue:hyperParameter:useLowConfidence:](v23, "initWithDefaultsManager:delayedLocationRequester:hintManager:queue:hyperParameter:useLowConfidence:", v24, v18, v25, v26, v9, a4 == 1);

    goto LABEL_8;
  }
  v19 = (objc_class *)objc_opt_class();
  NSStringFromClass(v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = objc_msgSend(v8, "isEqualToString:", v20);

  if (v21)
  {
    v22 = RTVisitPipelineModuleBurstNoiseFilter;
LABEL_11:
    v31 = objc_msgSend([v22 alloc], "initWithHyperParameter:", v9);
LABEL_12:
    v27 = (RTVisitPipelineModuleSCI *)v31;
    goto LABEL_13;
  }
  v28 = (objc_class *)objc_opt_class();
  NSStringFromClass(v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v8, "isEqualToString:", v29);

  if (v30)
  {
    v22 = RTVisitPipelineModuleSpeedCluster;
    goto LABEL_11;
  }
  v33 = (objc_class *)objc_opt_class();
  NSStringFromClass(v33);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(v8, "isEqualToString:", v34);

  if (v35)
  {
    v36 = [RTVisitPipelineModuleSmoother alloc];
    v37 = (double)(unint64_t)objc_msgSend(v9, "timeIntervalBetweenSmoothedPoints");
    v38 = (double)(unint64_t)objc_msgSend(v9, "smootherKernelWidth");
    objc_msgSend(v9, "maxGapInVisit");
    v31 = -[RTVisitPipelineModuleSmoother initWithTimeIntervalBetweenSmoothedPoints:kernelWidth:smallestSignificantWeightExponent:maxGapWithinVisit:](v36, "initWithTimeIntervalBetweenSmoothedPoints:kernelWidth:smallestSignificantWeightExponent:maxGapWithinVisit:", v37, v38, -10.0, v39);
    goto LABEL_12;
  }
  v40 = (objc_class *)objc_opt_class();
  NSStringFromClass(v40);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v8, "isEqualToString:", v41);

  if (v42)
  {
    v43 = [RTVisitPipelineModuleTrajectorySequenceCluster alloc];
    v44 = -[RTVisitModelControllerBatchMode initWithHyperParameter:]([RTVisitModelControllerBatchMode alloc], "initWithHyperParameter:", v9);
    v27 = -[RTVisitPipelineModuleTrajectorySequenceCluster initWithVisitTrajectorySequenceClassifier:hyperParameter:](v43, "initWithVisitTrajectorySequenceClassifier:hyperParameter:", v44, v9);

    goto LABEL_13;
  }
  v45 = (objc_class *)objc_opt_class();
  NSStringFromClass(v45);
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v8, "isEqualToString:", v46);

  if (v47)
  {
    v48 = [RTVisitPipelineModuleVisitCentroidUpdater alloc];
    -[RTVisitMonitor locationManager](self, "locationManager");
    v18 = (RTDelayedLocationRequester *)objc_claimAutoreleasedReturnValue();
    v49 = (void *)objc_opt_new();
    v50 = -[RTVisitPipelineModuleVisitCentroidUpdater initWithHyperParameter:locationManager:distanceCalculator:](v48, "initWithHyperParameter:locationManager:distanceCalculator:", v9, v18, v49);
LABEL_24:
    v27 = (RTVisitPipelineModuleSCI *)v50;

    goto LABEL_8;
  }
  v51 = (objc_class *)objc_opt_class();
  NSStringFromClass(v51);
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  v53 = objc_msgSend(v8, "isEqualToString:", v52);

  if (v53)
  {
    v54 = [RTVisitPipelineModuleAltitudeEstimator alloc];
    objc_msgSend(v9, "maxHorizontalAccuracy");
    v56 = v55;
    -[RTVisitMonitor locationManager](self, "locationManager");
    v18 = (RTDelayedLocationRequester *)objc_claimAutoreleasedReturnValue();
    v27 = -[RTVisitPipelineModuleAltitudeEstimator initWithMaxHorizontalAccuracy:locationManager:](v54, "initWithMaxHorizontalAccuracy:locationManager:", v18, v56);
LABEL_8:

    goto LABEL_13;
  }
  v57 = (objc_class *)objc_opt_class();
  NSStringFromClass(v57);
  v58 = (void *)objc_claimAutoreleasedReturnValue();
  v59 = objc_msgSend(v8, "isEqualToString:", v58);

  if (v59)
  {
    v60 = [RTVisitPipelineModuleMotionStateTrimmer alloc];
    -[RTVisitMonitor motionActivityManager](self, "motionActivityManager");
    v18 = (RTDelayedLocationRequester *)objc_claimAutoreleasedReturnValue();
    -[RTVisitMonitor defaultsManager](self, "defaultsManager");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = -[RTVisitPipelineModuleMotionStateTrimmer initWithMotionActivityManager:defaultsManager:](v60, "initWithMotionActivityManager:defaultsManager:", v18, v49);
    goto LABEL_24;
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v61 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
  {
    v63 = 138412802;
    v64 = v8;
    v65 = 2080;
    v66 = "-[RTVisitMonitor _moduleWithName:pipelineType:hyperParameter:]";
    v67 = 1024;
    v68 = 431;
    _os_log_error_impl(&dword_1D1A22000, v61, OS_LOG_TYPE_ERROR, "unsupported module, name, %@ (in %s:%d)", (uint8_t *)&v63, 0x1Cu);
  }

  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v62 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT))
  {
    v63 = 138412290;
    v64 = v8;
    _os_log_fault_impl(&dword_1D1A22000, v62, OS_LOG_TYPE_FAULT, "unsupported module, name, %@", (uint8_t *)&v63, 0xCu);
  }

  v27 = 0;
LABEL_13:

  return v27;
}

- (id)_configurationForPipelineType:(unint64_t)a3
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  objc_class *v15;
  objc_class *v16;
  NSObject *v17;
  objc_class *v19;
  objc_class *v20;
  objc_class *v21;
  objc_class *v22;
  void *v23;
  void *v24;
  int v25;
  objc_class *v26;
  uint64_t v27;
  objc_class *v28;
  objc_class *v29;
  objc_class *v30;
  objc_class *v31;
  void *v32;
  objc_class *v33;
  void *v34;
  objc_class *v35;
  objc_class *v36;
  id v37;
  void *v38;
  void *v39;
  _QWORD v40[3];
  _QWORD v41[6];
  _QWORD v42[4];
  _QWORD v43[2];
  uint8_t buf[4];
  void *v45;
  __int16 v46;
  void *v47;
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  if (a3 > 4 || ((1 << a3) & 0x16) == 0)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: VALID_PIPELINE(pipelineType)", buf, 2u);
    }

    if (a3 != 4)
      return 0;
  }
  -[RTVisitMonitor platform](self, "platform");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "internalInstall") & 1) == 0)
  {

LABEL_8:
    switch(a3)
    {
      case 1uLL:
        v15 = (objc_class *)objc_opt_class();
        NSStringFromClass(v15);
        v12 = objc_claimAutoreleasedReturnValue();
        v43[0] = v12;
        v16 = (objc_class *)objc_opt_class();
        NSStringFromClass(v16);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v43[1] = v13;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v43, 2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_24;
      case 2uLL:
        v19 = (objc_class *)objc_opt_class();
        NSStringFromClass(v19);
        v12 = objc_claimAutoreleasedReturnValue();
        v42[0] = v12;
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v42[1] = v13;
        v21 = (objc_class *)objc_opt_class();
        NSStringFromClass(v21);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v42[2] = v14;
        v22 = (objc_class *)objc_opt_class();
        NSStringFromClass(v22);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v42[3] = v23;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 4);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      case 3uLL:
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
        {
          NSStringFromSelector(a2);
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          +[RTVisitPipeline typeToString:](RTVisitPipeline, "typeToString:", 3);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v45 = v38;
          v46 = 2112;
          v47 = v39;
          _os_log_fault_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_FAULT, "%@, unsupported type, %@", buf, 0x16u);

        }
        v11 = 0;
        goto LABEL_25;
      case 4uLL:
        -[RTVisitMonitor platform](self, "platform");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "usesTSCForClustering");

        v26 = (objc_class *)objc_opt_class();
        NSStringFromClass(v26);
        v27 = objc_claimAutoreleasedReturnValue();
        v12 = v27;
        if (v25)
        {
          v41[0] = v27;
          v28 = (objc_class *)objc_opt_class();
          NSStringFromClass(v28);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v41[1] = v13;
          v29 = (objc_class *)objc_opt_class();
          NSStringFromClass(v29);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v41[2] = v14;
          v30 = (objc_class *)objc_opt_class();
          NSStringFromClass(v30);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v41[3] = v23;
          v31 = (objc_class *)objc_opt_class();
          NSStringFromClass(v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          v41[4] = v32;
          v33 = (objc_class *)objc_opt_class();
          NSStringFromClass(v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v41[5] = v34;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 6);
          v11 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_21:
        }
        else
        {
          v40[0] = v27;
          v35 = (objc_class *)objc_opt_class();
          NSStringFromClass(v35);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v40[1] = v13;
          v36 = (objc_class *)objc_opt_class();
          NSStringFromClass(v36);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v40[2] = v14;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
        }
        break;
      default:
        v11 = 0;
        goto LABEL_26;
    }
    goto LABEL_23;
  }
  -[RTVisitMonitor defaultsManager](self, "defaultsManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3940];
  +[RTVisitPipeline typeToString:](RTVisitPipeline, "typeToString:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("RTVisitPiplelineType%@"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
    goto LABEL_8;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v12 = objc_claimAutoreleasedReturnValue();
  if (!os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    goto LABEL_25;
  +[RTVisitPipeline typeToString:](RTVisitPipeline, "typeToString:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "componentsJoinedByString:", CFSTR(", "));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)buf = 138412546;
  v45 = v13;
  v46 = 2112;
  v47 = v14;
  _os_log_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_INFO, "pipeline configuration overidden by defaults, pipelineType, %@, configuration, %@", buf, 0x16u);
LABEL_23:

LABEL_24:
LABEL_25:

LABEL_26:
  v37 = v11;

  return v37;
}

- (id)_modulesForPipelineType:(unint64_t)a3 hyperParameter:(id)a4
{
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  if (a3 <= 4 && ((1 << a3) & 0x16) != 0)
    goto LABEL_3;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v21 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_error_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: VALID_PIPELINE(type)", buf, 2u);
  }

  if (a3 == 4)
  {
LABEL_3:
    if (v7)
    {
      v8 = (void *)objc_opt_new();
      -[RTVisitMonitor _configurationForPipelineType:](self, "_configurationForPipelineType:", a3);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTVisitPipeline typeToString:](RTVisitPipeline, "typeToString:", a3);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "componentsJoinedByString:", CFSTR(", "));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412802;
        v28 = v11;
        v29 = 2112;
        v30 = v12;
        v31 = 2112;
        v32 = v13;
        _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "%@, pipelineType, %@, configuration, %@", buf, 0x20u);

      }
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v14 = v9;
      v15 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v23;
        do
        {
          v18 = 0;
          do
          {
            if (*(_QWORD *)v23 != v17)
              objc_enumerationMutation(v14);
            -[RTVisitMonitor _moduleWithName:pipelineType:hyperParameter:](self, "_moduleWithName:pipelineType:hyperParameter:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v18), a3, v7, (_QWORD)v22);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              objc_msgSend(v8, "addObject:", v19);

            ++v18;
          }
          while (v16 != v18);
          v16 = -[NSObject countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
        }
        while (v16);
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: hyperParameter", buf, 2u);
      }
      v8 = 0;
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

+ (id)hyperParameterForPipelineType:(unint64_t)a3
{
  NSObject *v5;
  id result;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  switch(a3)
  {
    case 0uLL:
    case 3uLL:
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      {
        NSStringFromSelector(a2);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        +[RTVisitPipeline typeToString:](RTVisitPipeline, "typeToString:", a3);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = 138412546;
        v10 = v7;
        v11 = 2112;
        v12 = v8;
        _os_log_fault_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_FAULT, "%@, unsupported type, %@", (uint8_t *)&v9, 0x16u);

      }
      goto LABEL_5;
    case 1uLL:
    case 2uLL:
    case 4uLL:
      result = (id)objc_opt_new();
      break;
    default:
LABEL_5:
      result = 0;
      break;
  }
  return result;
}

- (id)_createPipelineWithType:(unint64_t)a3 name:(id)a4 lastVisit:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  int v12;
  double v13;
  double v14;
  void *v15;
  NSObject *v16;
  void *v17;
  RTVisitPipeline *v18;
  NSObject *v20;
  int v21;
  const __CFString *v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  if (a3 <= 4 && ((1 << a3) & 0x16) != 0)
    goto LABEL_3;
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    LOWORD(v21) = 0;
    _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: VALID_PIPELINE(type)", (uint8_t *)&v21, 2u);
  }

  if (a3 == 4)
  {
LABEL_3:
    if (v8)
    {
      objc_msgSend((id)objc_opt_class(), "hyperParameterForPipelineType:", a3);
      v10 = objc_claimAutoreleasedReturnValue();
      -[RTVisitMonitor platform](self, "platform");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "internalInstall");

      if (v12)
      {
        -[RTVisitMonitor maxHorizontalAccuracyOverride](self, "maxHorizontalAccuracyOverride");
        if (v13 > 0.0)
        {
          v14 = v13;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSObject setValue:forKey:](v10, "setValue:forKey:", v15, CFSTR("maxHorizontalAccuracy"));

          _rt_log_facility_get_os_log(RTLogFacilityVisit);
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v21 = 138412546;
            v22 = CFSTR("MaxHorizontalAccuracy");
            v23 = 2048;
            v24 = v14;
            _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@ overridden to %.2f", (uint8_t *)&v21, 0x16u);
          }

        }
      }
      -[RTVisitMonitor _modulesForPipelineType:hyperParameter:](self, "_modulesForPipelineType:hyperParameter:", a3, v10);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[RTVisitPipeline initWithModules:name:type:lastVisit:hyperParameter:]([RTVisitPipeline alloc], "initWithModules:name:type:lastVisit:hyperParameter:", v17, v8, a3, v9, v10);

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v21) = 0;
        _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: name", (uint8_t *)&v21, 2u);
      }
      v18 = 0;
    }

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (void)_setupRealtimePipelineWithType:(unint64_t)a3 handler:(id)a4
{
  void (**v7)(id, _QWORD);
  NSMutableDictionary *pipelines;
  void *v9;
  void *v10;
  NSObject *v11;
  char *v12;
  void *v13;
  const char *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  NSObject *v20;
  NSMutableDictionary *v21;
  void *v22;
  int v23;
  const char *v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = (void (**)(id, _QWORD))a4;
  if (a3 - 1 >= 2)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315394;
      v24 = "-[RTVisitMonitor _setupRealtimePipelineWithType:handler:]";
      v25 = 1024;
      LODWORD(v26) = 594;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: VALID_REALTIME_PIPELINE(type) (in %s:%d)", (uint8_t *)&v23, 0x12u);
    }

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      goto LABEL_8;
    NSStringFromSelector(a2);
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    +[RTVisitPipeline typeToString:](RTVisitPipeline, "typeToString:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412546;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v14 = "%@, unsupported type, %@";
    goto LABEL_22;
  }
  pipelines = self->_pipelines;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKeyedSubscript:](pipelines, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v11 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
LABEL_8:

      v7[2](v7, 0);
      goto LABEL_9;
    }
    NSStringFromSelector(a2);
    v12 = (char *)objc_claimAutoreleasedReturnValue();
    +[RTVisitPipeline typeToString:](RTVisitPipeline, "typeToString:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 138412546;
    v24 = v12;
    v25 = 2112;
    v26 = v13;
    v14 = "%@, pipline already setup, type, %@";
LABEL_22:
    _os_log_fault_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v23, 0x16u);

    goto LABEL_8;
  }
  if (a3 == 2)
  {
    -[RTVisitMonitor state](self, "state");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastVisitIncident");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("com.apple.routined.visit.pipeline.realtime-high-confidence");
  }
  else
  {
    if (a3 != 1)
    {
      v17 = 0;
      v18 = 0;
      goto LABEL_16;
    }
    -[RTVisitMonitor state](self, "state");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "lastLowConfidenceVisitIncident");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = CFSTR("com.apple.routined.visit.pipeline.realtime-low-confidence");
  }

LABEL_16:
  -[RTVisitMonitor _createPipelineWithType:name:lastVisit:](self, "_createPipelineWithType:name:lastVisit:", a3, v18, v17);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v20 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      v23 = 136315394;
      v24 = "-[RTVisitMonitor _setupRealtimePipelineWithType:handler:]";
      v25 = 1024;
      LODWORD(v26) = 641;
      _os_log_error_impl(&dword_1D1A22000, v20, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pipeline (in %s:%d)", (uint8_t *)&v23, 0x12u);
    }

  }
  v21 = self->_pipelines;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary setObject:forKeyedSubscript:](v21, "setObject:forKeyedSubscript:", v19, v22);

  -[RTVisitMonitor _bootstrapPipeline:handler:](self, "_bootstrapPipeline:handler:", v19, v7);
LABEL_9:

}

- (void)_registerVisitMonitorForRegionEventsForPipelineType:(unint64_t)a3
{
  void *v6;
  RTLocationManager *locationManager;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSMutableSet *pipelinesMonitoringRegion;
  void *v13;
  _QWORD v14[5];
  id v15;
  SEL v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "regionMonitoringClientIdentifierForPipelineType:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  locationManager = self->_locationManager;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __70__RTVisitMonitor__registerVisitMonitorForRegionEventsForPipelineType___block_invoke;
  v14[3] = &unk_1E929C738;
  v16 = a2;
  v14[4] = self;
  v8 = v6;
  v15 = v8;
  -[RTLocationManager registerForRegionEventsWithClientIdentifier:handler:](locationManager, "registerForRegionEventsWithClientIdentifier:handler:", v8, v14);
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTVisitPipeline typeToString:](RTVisitPipeline, "typeToString:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v18 = v10;
    v19 = 2112;
    v20 = v11;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, Registration for pipeline, %@", buf, 0x16u);

  }
  pipelinesMonitoringRegion = self->_pipelinesMonitoringRegion;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet addObject:](pipelinesMonitoringRegion, "addObject:", v13);

}

void __70__RTVisitMonitor__registerVisitMonitorForRegionEventsForPipelineType___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  const char *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a4;
  v9 = v8;
  if (a3 == 4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", 4);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
      v19 = 138413058;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v15;
      v25 = 2112;
      v26 = v9;
      v14 = "%@, regionMonitoring failure, %@, pipelinesMonitoringRegion, %@, error, %@";
      goto LABEL_7;
    }
  }
  else if (a3 == 3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", 3);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
      v19 = 138413058;
      v20 = v11;
      v21 = 2112;
      v22 = v12;
      v23 = 2112;
      v24 = v13;
      v25 = 2112;
      v26 = v9;
      v14 = "%@, regionMonitoring client registration failure, %@, pipelinesMonitoringRegion, %@, error, %@";
LABEL_7:
      _os_log_fault_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_FAULT, v14, (uint8_t *)&v19, 0x2Au);

    }
  }
  else
  {
    if (!v8)
    {
      objc_msgSend(*(id *)(a1 + 32), "handleRegionCallback:region:clientIdentifier:", a3, v7, *(_QWORD *)(a1 + 40));
      goto LABEL_12;
    }
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 176);
      v19 = 138413058;
      v20 = v16;
      v21 = 2112;
      v22 = v17;
      v23 = 2112;
      v24 = v18;
      v25 = 2112;
      v26 = v9;
      _os_log_fault_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_FAULT, "%@, regionMonitoring %@, pipelinesMonitoringRegion, %@, error, %@", (uint8_t *)&v19, 0x2Au);

    }
  }

LABEL_12:
}

- (void)_unregisterVisitMonitorForRegionEventsForPipelineType:(unint64_t)a3
{
  NSMutableSet *pipelinesMonitoringRegion;
  void *v7;
  RTLocationManager *locationManager;
  void *v9;
  NSMutableSet *v10;
  void *v11;
  _QWORD v12[5];

  pipelinesMonitoringRegion = self->_pipelinesMonitoringRegion;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(pipelinesMonitoringRegion) = -[NSMutableSet containsObject:](pipelinesMonitoringRegion, "containsObject:", v7);

  if ((_DWORD)pipelinesMonitoringRegion)
  {
    locationManager = self->_locationManager;
    objc_msgSend((id)objc_opt_class(), "regionMonitoringClientIdentifierForPipelineType:", a3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __72__RTVisitMonitor__unregisterVisitMonitorForRegionEventsForPipelineType___block_invoke;
    v12[3] = &__block_descriptor_40_e17_v16__0__NSError_8l;
    v12[4] = a2;
    -[RTLocationManager unregisterForRegionEventsWithClientIdentifier:handler:](locationManager, "unregisterForRegionEventsWithClientIdentifier:handler:", v9, v12);

    v10 = self->_pipelinesMonitoringRegion;
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableSet removeObject:](v10, "removeObject:", v11);

  }
}

void __72__RTVisitMonitor__unregisterVisitMonitorForRegionEventsForPipelineType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v3)
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    {
      NSStringFromSelector(*(SEL *)(a1 + 32));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v3;
      _os_log_fault_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_FAULT, "%@, regionMonitoring client unregistration failure, error, %@", (uint8_t *)&v7, 0x16u);
LABEL_6:

    }
  }
  else if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412546;
    v8 = v6;
    v9 = 2112;
    v10 = 0;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "%@, error, %@", (uint8_t *)&v7, 0x16u);
    goto LABEL_6;
  }

}

- (void)handleRegionCallback:(int64_t)a3 region:(id)a4 clientIdentifier:(id)a5
{
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  NSObject *v24;
  id v25;
  _QWORD block[5];
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  void *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v9 = a4;
  v10 = a5;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(a2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138413058;
    v30 = v12;
    v31 = 2112;
    v32 = v13;
    v33 = 2112;
    v34 = v9;
    v35 = 2112;
    v36 = v10;
    _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "%@, callbackType, %@, region, %@, clientIdentifier, %@", buf, 0x2Au);

  }
  if ((unint64_t)(a3 - 1) <= 1)
  {
    v14 = objc_msgSend((id)objc_opt_class(), "hintSourceForRegionCallbackType:", a3);
    v15 = objc_alloc(MEMORY[0x1E0D183B0]);
    objc_msgSend(v9, "center");
    v17 = v16;
    objc_msgSend(v9, "center");
    v19 = v18;
    objc_msgSend(v9, "radius");
    v21 = v20;
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v15, "initWithLatitude:longitude:horizontalUncertainty:date:", v22, v17, v19, v21);

    -[RTVisitMonitor queue](self, "queue");
    v24 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __63__RTVisitMonitor_handleRegionCallback_region_clientIdentifier___block_invoke;
    block[3] = &unk_1E9297BC8;
    v27 = v23;
    v28 = v14;
    block[4] = self;
    v25 = v23;
    dispatch_async(v24, block);

  }
}

uint64_t __63__RTVisitMonitor_handleRegionCallback_region_clientIdentifier___block_invoke(_QWORD *a1)
{
  return objc_msgSend(*(id *)(a1[4] + 64), "submitHintFromSource:location:", a1[6], a1[5]);
}

+ (int64_t)hintSourceForRegionCallbackType:(int64_t)a3
{
  NSObject *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 == 1)
    return 7;
  if (a3 == 2)
    return 8;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    NSStringFromSelector(a2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[RTLocationManager stringForRegionCallbackType:](RTLocationManager, "stringForRegionCallbackType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412546;
    v10 = v7;
    v11 = 2112;
    v12 = v8;
    _os_log_fault_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_FAULT, "%@, unsupported type, %@", (uint8_t *)&v9, 0x16u);

  }
  return -1;
}

- (void)_bootstrapPipeline:(id)a3 handler:(id)a4
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
  uint64_t v16;
  void *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  _QWORD v24[5];
  id v25;
  id v26;
  id v27;
  _QWORD *v28;
  _QWORD v29[4];
  uint8_t buf[4];
  id v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastVisit");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "exit");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "lastVisit");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
  {
    objc_msgSend(v11, "exit");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v11, "entry");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
      goto LABEL_6;
    objc_msgSend(v6, "lastVisit");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "entry");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v15 = v13;
  objc_msgSend(v13, "dateByAddingTimeInterval:", 1.0);
  v16 = objc_claimAutoreleasedReturnValue();

  v8 = (void *)v16;
LABEL_6:
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v29[0] = 0;
  v29[1] = v29;
  v29[2] = 0x2020000000;
  v29[3] = 0;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v8, "stringFromDate");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v31 = v6;
    v32 = 2112;
    v33 = v19;
    _os_log_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_INFO, "start bootstraping pipeline, %@, with locations since %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __45__RTVisitMonitor__bootstrapPipeline_handler___block_invoke;
  v24[3] = &unk_1E929C760;
  v24[4] = self;
  v21 = v6;
  v25 = v21;
  v28 = v29;
  v22 = v17;
  v26 = v22;
  v23 = v7;
  v27 = v23;
  -[RTVisitMonitor _batchProcess:fromDate:toDate:handler:](self, "_batchProcess:fromDate:toDate:handler:", v21, v8, v20, v24);

  _Block_object_dispose(v29, 8);
}

void __45__RTVisitMonitor__bootstrapPipeline_handler___block_invoke(uint64_t a1, void *a2, int a3, void *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  const __CFString *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  const __CFString *v28;
  __int16 v29;
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a2;
  v9 = objc_msgSend(v7, "code");
  v10 = v7;
  v11 = v10;
  v12 = v10;
  if (v9 == 2)
  {

    v12 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "_processRealtimeVisits:pipeline:", v8, *(_QWORD *)(a1 + 40));
  v13 = objc_msgSend(v8, "count");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) += v13;
  if (a3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setBootStrappingDone:", 1);
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      v15 = *(_QWORD *)(a1 + 40);
      v16 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "timeIntervalSinceDate:", *(_QWORD *)(a1 + 48));
      v21 = 138413314;
      v19 = CFSTR("NO");
      v22 = v15;
      v23 = 2048;
      if (v9 == 2)
        v19 = CFSTR("YES");
      v24 = v16;
      v25 = 2048;
      v26 = v18;
      v27 = 2112;
      v28 = v19;
      v29 = 2112;
      v30 = v11;
      _os_log_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_INFO, "finished bootstrapping pipeline, %@, visits processed, %lu, latency, %.2f, diminishedMode, %@, error, %@", (uint8_t *)&v21, 0x34u);

    }
    v20 = *(_QWORD *)(a1 + 56);
    if (v20)
      (*(void (**)(uint64_t, void *))(v20 + 16))(v20, v12);
  }

}

+ (id)bucketLocations:(id)a3 interval:(double)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  id v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (objc_msgSend(v5, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObject:", v7);
    objc_msgSend(v5, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "date");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "dateByAddingTimeInterval:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v27 = 0u;
    v28 = 0u;
    v25 = 0u;
    v26 = 0u;
    v24 = v5;
    v11 = v5;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v26;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v26 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
          objc_msgSend(v16, "date");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "compare:", v10);

          if (v18 != -1)
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "array");
            v19 = objc_claimAutoreleasedReturnValue();

            objc_msgSend(v6, "addObject:", v19);
            objc_msgSend(v16, "date");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v20, "dateByAddingTimeInterval:", a4);
            v21 = objc_claimAutoreleasedReturnValue();

            v7 = (void *)v19;
            v10 = (void *)v21;
          }
          objc_msgSend(v7, "addObject:", v16);
        }
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      }
      while (v13);
    }

    v22 = v6;
    v5 = v24;
  }
  else
  {
    v22 = (id)MEMORY[0x1E0C9AA60];
  }

  return v22;
}

- (void)_batchProcess:(id)a3 fromDate:(id)a4 toDate:(id)a5 handler:(id)a6
{
  char *v10;
  id v11;
  id v12;
  void (**v13)(id, _QWORD, uint64_t, void *);
  void *v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  const __CFString **v28;
  uint64_t *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  void *v33;
  void *v34;
  id v35;
  id v36;
  char *v37;
  void *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  _QWORD v44[5];
  id v45;
  id v46;
  char *v47;
  void (**v48)(id, _QWORD, uint64_t, void *);
  uint8_t buf[4];
  const char *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;
  void *v56;
  uint64_t v57;
  const __CFString *v58;
  uint64_t v59;
  _QWORD v60[3];

  v60[1] = *MEMORY[0x1E0C80C00];
  v10 = (char *)a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, _QWORD, uint64_t, void *))a6;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[RTVisitMonitor _batchProcess:fromDate:toDate:handler:]";
      v51 = 1024;
      LODWORD(v52) = 837;
      _os_log_error_impl(&dword_1D1A22000, v22, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: pipeline (in %s:%d)", buf, 0x12u);
    }

    if (v11)
    {
LABEL_3:
      if (v12)
        goto LABEL_4;
      goto LABEL_16;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[RTVisitMonitor _batchProcess:fromDate:toDate:handler:]";
    v51 = 1024;
    LODWORD(v52) = 838;
    _os_log_error_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromDate (in %s:%d)", buf, 0x12u);
  }

  if (v12)
  {
LABEL_4:
    if (v13)
      goto LABEL_5;
LABEL_19:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v50 = "-[RTVisitMonitor _batchProcess:fromDate:toDate:handler:]";
      v51 = 1024;
      LODWORD(v52) = 840;
      _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }
    goto LABEL_21;
  }
LABEL_16:
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v24 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v50 = "-[RTVisitMonitor _batchProcess:fromDate:toDate:handler:]";
    v51 = 1024;
    LODWORD(v52) = 839;
    _os_log_error_impl(&dword_1D1A22000, v24, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toDate (in %s:%d)", buf, 0x12u);
  }

  if (!v13)
    goto LABEL_19;
LABEL_5:
  if (!v10)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D18598];
    v59 = *MEMORY[0x1E0CB2D50];
    v60[0] = CFSTR("requires pipeline");
    v27 = (void *)MEMORY[0x1E0C99D80];
    v28 = (const __CFString **)v60;
    v29 = &v59;
LABEL_24:
    objc_msgSend(v27, "dictionaryWithObjects:forKeys:count:", v28, v29, 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "errorWithDomain:code:userInfo:", v26, 7, v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, 1, v31);

    goto LABEL_25;
  }
  if (!v11 || !v12)
  {
    v25 = (void *)MEMORY[0x1E0CB35C8];
    v26 = *MEMORY[0x1E0D18598];
    v57 = *MEMORY[0x1E0CB2D50];
    v58 = CFSTR("requires valid dates.");
    v27 = (void *)MEMORY[0x1E0C99D80];
    v28 = &v58;
    v29 = &v57;
    goto LABEL_24;
  }
  if (objc_msgSend(v11, "isAfterDate:", v12))
  {
    v14 = (void *)MEMORY[0x1E0CB35C8];
    v15 = *MEMORY[0x1E0D18598];
    v55 = *MEMORY[0x1E0CB2D50];
    v16 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v11, "stringFromDate");
    v17 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromDate");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringWithFormat:", CFSTR("fromDate, %@, postdates toDate, %@"), v17, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = v19;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v56, &v55, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "errorWithDomain:code:userInfo:", v15, 7, v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v13[2](v13, 0, 1, v21);

LABEL_21:
    goto LABEL_25;
  }
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v32 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v11, "stringFromDate");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringFromDate");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412802;
    v50 = v10;
    v51 = 2112;
    v52 = v33;
    v53 = 2112;
    v54 = v34;
    _os_log_impl(&dword_1D1A22000, v32, OS_LOG_TYPE_INFO, "batch processing pipeline %@ between, %@, to, %@", buf, 0x20u);

  }
  v44[0] = MEMORY[0x1E0C809B0];
  v44[1] = 3221225472;
  v44[2] = __56__RTVisitMonitor__batchProcess_fromDate_toDate_handler___block_invoke;
  v44[3] = &unk_1E929C7D0;
  v44[4] = self;
  v48 = v13;
  v35 = v11;
  v45 = v35;
  v36 = v12;
  v46 = v36;
  v37 = v10;
  v47 = v37;
  v38 = (void *)MEMORY[0x1D8232094](v44);
  v39 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v35, v36);
  v40 = objc_alloc(MEMORY[0x1E0D184F0]);
  objc_msgSend(v37, "hyperParameter");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "maxHorizontalAccuracy");
  v42 = (void *)objc_msgSend(v40, "initWithDateInterval:horizontalAccuracy:batchSize:boundingBoxLocation:", v39, 3600, 0);

  -[RTVisitMonitor locationManager](self, "locationManager");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "fetchStoredLocationsWithOptions:handler:", v42, v38);

LABEL_25:
}

void __56__RTVisitMonitor__batchProcess_fromDate_toDate_handler___block_invoke(id *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _RTMap *v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _QWORD block[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;

  v5 = a3;
  v6 = a2;
  v7 = -[_RTMap initWithInput:]([_RTMap alloc], "initWithInput:", v6);

  -[_RTMap withBlock:](v7, "withBlock:", &__block_literal_global_40);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1[4], "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__RTVisitMonitor__batchProcess_fromDate_toDate_handler___block_invoke_3;
  block[3] = &unk_1E929C7A8;
  v15 = v5;
  v21 = a1[8];
  v16 = v8;
  v17 = a1[5];
  v18 = a1[6];
  v10 = a1[7];
  v11 = a1[4];
  v19 = v10;
  v20 = v11;
  v12 = v8;
  v13 = v5;
  dispatch_async(v9, block);

}

id __56__RTVisitMonitor__batchProcess_fromDate_toDate_handler___block_invoke_2(uint64_t a1, void *a2)
{
  objc_class *v2;
  id v3;
  void *v4;

  v2 = (objc_class *)MEMORY[0x1E0D183B0];
  v3 = a2;
  v4 = (void *)objc_msgSend([v2 alloc], "initWithCLLocation:", v3);

  return v4;
}

void __56__RTVisitMonitor__batchProcess_fromDate_toDate_handler___block_invoke_3(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  int v31;
  void (*v32)(void);
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  id obj;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t v46[128];
  uint8_t buf[4];
  void *v48;
  __int16 v49;
  uint64_t v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  uint64_t v55;

  v1 = a1;
  v55 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32))
  {
    (*(void (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 80) + 16))(*(_QWORD *)(a1 + 80), 0, 1);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "firstObject");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "date");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(v1 + 40), "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(*(id *)(v1 + 40), "count")
      || (objc_msgSend(v5, "isBeforeDate:", *(_QWORD *)(v1 + 48)) & 1) != 0
      || objc_msgSend(v3, "isAfterDate:", *(_QWORD *)(v1 + 56)))
    {
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(*(id *)(v1 + 48), "stringFromDate");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 56), "stringFromDate");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "stringFromDate");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "stringFromDate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v48 = v7;
        v49 = 2112;
        v50 = (uint64_t)v8;
        v51 = 2112;
        v52 = v9;
        v53 = 2112;
        v54 = v10;
        _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "no valid locations are fetched between, %@, and, %@, first location date, %@, last location date, %@", buf, 0x2Au);

      }
      (*(void (**)(void))(*(_QWORD *)(v1 + 80) + 16))();
    }
    else
    {
      v37 = v3;
      v38 = v5;
      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        v12 = *(void **)(v1 + 64);
        v13 = objc_msgSend(*(id *)(v1 + 40), "count");
        objc_msgSend(*(id *)(v1 + 40), "firstObject");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v1 + 40), "lastObject");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v48 = v12;
        v49 = 2048;
        v50 = v13;
        v51 = 2112;
        v52 = v14;
        v53 = 2112;
        v54 = v15;
        _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "batch processing pipeline %@ with %lu locations, first, %@, last, %@", buf, 0x2Au);

      }
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      objc_msgSend((id)objc_opt_class(), "bucketLocations:interval:", *(_QWORD *)(v1 + 40), 43200.0);
      obj = (id)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v43;
        v40 = v1;
        v39 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v18; ++i)
          {
            if (*(_QWORD *)v43 != v19)
              objc_enumerationMutation(obj);
            v21 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
            v22 = (void *)MEMORY[0x1D8231EA8]();
            _rt_log_facility_get_os_log(RTLogFacilityVisit);
            v23 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              v24 = v16;
              v25 = *(void **)(v1 + 64);
              v26 = v22;
              v27 = objc_msgSend(v21, "count");
              objc_msgSend(v21, "firstObject");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "lastObject");
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413058;
              v48 = v25;
              v16 = v24;
              v49 = 2048;
              v50 = v27;
              v22 = v26;
              v51 = 2112;
              v52 = v28;
              v53 = 2112;
              v54 = v29;
              _os_log_impl(&dword_1D1A22000, v23, OS_LOG_TYPE_INFO, "batch processing pipeline %@ with %lu bucketed locations, first, %@, last, %@", buf, 0x2Au);

              v19 = v39;
              v1 = v40;
            }

            objc_msgSend(*(id *)(v1 + 64), "processLocations:", v21);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v16, "addObjectsFromArray:", v30);

            objc_autoreleasePoolPop(v22);
          }
          v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v46, 16);
        }
        while (v18);
      }

      v5 = v38;
      v31 = objc_msgSend(v38, "isOnOrAfter:", *(_QWORD *)(v1 + 56));
      v32 = *(void (**)(void))(*(_QWORD *)(v1 + 80) + 16);
      if (v31)
      {
        v32();
      }
      else
      {
        v32();
        v34 = *(_QWORD *)(v1 + 64);
        v33 = *(void **)(v1 + 72);
        objc_msgSend(v38, "dateByAddingTimeInterval:", 1.0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "earlierDate:", *(_QWORD *)(v1 + 56));
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "_batchProcess:fromDate:toDate:handler:", v34, v36, *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 80));

      }
      v3 = v37;

    }
  }
}

- (void)fetchVisitsFromDate:(id)a3 toDate:(id)a4 handler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  id v19;
  _QWORD block[5];
  id v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  const char *v26;
  __int16 v27;
  int v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v8)
  {
    if (v9)
      goto LABEL_3;
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTVisitMonitor fetchVisitsFromDate:toDate:handler:]";
      v27 = 1024;
      v28 = 931;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: fromDate (in %s:%d)", buf, 0x12u);
    }

    if (v9)
    {
LABEL_3:
      if (v10)
        goto LABEL_14;
      goto LABEL_11;
    }
  }
  _rt_log_facility_get_os_log(RTLogFacilityGeneral);
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 136315394;
    v26 = "-[RTVisitMonitor fetchVisitsFromDate:toDate:handler:]";
    v27 = 1024;
    v28 = 932;
    _os_log_error_impl(&dword_1D1A22000, v12, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: toDate (in %s:%d)", buf, 0x12u);
  }

  if (!v10)
  {
LABEL_11:
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v26 = "-[RTVisitMonitor fetchVisitsFromDate:toDate:handler:]";
      v27 = 1024;
      v28 = 933;
      _os_log_error_impl(&dword_1D1A22000, v13, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
LABEL_14:
  v14 = (void *)objc_opt_new();
  -[RTVisitMonitor queue](self, "queue");
  v15 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__RTVisitMonitor_fetchVisitsFromDate_toDate_handler___block_invoke;
  block[3] = &unk_1E929C820;
  block[4] = self;
  v21 = v8;
  v23 = v14;
  v24 = v10;
  v22 = v9;
  v16 = v14;
  v17 = v10;
  v18 = v9;
  v19 = v8;
  dispatch_async(v15, block);

}

void __53__RTVisitMonitor_fetchVisitsFromDate_toDate_handler___block_invoke(id *a1)
{
  void *v2;
  int v3;
  uint64_t v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  __CFString *v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  __CFString *v13;
  _QWORD v14[4];
  id v15;
  __CFString *v16;
  id v17;
  id v18;
  id v19;
  uint8_t buf[4];
  const __CFString *v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "platform");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "internalInstall");

  if (v3 && (v4 = objc_msgSend(a1[4], "visitPipelineTypeOverride")) != 0)
  {
    v5 = v4;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      objc_msgSend((id)objc_opt_class(), "typeToString:", v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v21 = CFSTR("PlaybackVisitPipelineType");
      v22 = 2112;
      v23 = v7;
      _os_log_impl(&dword_1D1A22000, v6, OS_LOG_TYPE_INFO, "%@ overridden to %@", buf, 0x16u);

    }
  }
  else
  {
    v5 = 4;
  }
  objc_msgSend(a1[4], "_createPipelineWithType:name:lastVisit:", v5, CFSTR("com.apple.routined.visit.pipeline.batch-from-date"), 0);
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v21 = v8;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "creating pipeline %@", buf, 0xCu);
  }

  v10 = a1[4];
  v11 = a1[5];
  v12 = a1[6];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __53__RTVisitMonitor_fetchVisitsFromDate_toDate_handler___block_invoke_107;
  v14[3] = &unk_1E929C7F8;
  v19 = a1[8];
  v15 = a1[7];
  v16 = v8;
  v17 = a1[5];
  v18 = a1[6];
  v13 = v8;
  objc_msgSend(v10, "_batchProcess:fromDate:toDate:handler:", v13, v11, v12, v14);

}

uint64_t __53__RTVisitMonitor_fetchVisitsFromDate_toDate_handler___block_invoke_107(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  uint64_t result;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  uint64_t v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (a4)
    return (*(uint64_t (**)(_QWORD, _QWORD, uint64_t))(*(_QWORD *)(a1 + 64) + 16))(*(_QWORD *)(a1 + 64), 0, a4);
  result = objc_msgSend(*(id *)(a1 + 32), "addObjectsFromArray:", a2);
  if (a3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 40);
      objc_msgSend(*(id *)(a1 + 48), "stringFromDate");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 56), "stringFromDate");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138412802;
      v12 = v8;
      v13 = 2112;
      v14 = v9;
      v15 = 2112;
      v16 = v10;
      _os_log_impl(&dword_1D1A22000, v7, OS_LOG_TYPE_INFO, "pipeline %@ completes batch processing from %@, to %@", (uint8_t *)&v11, 0x20u);

    }
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  }
  return result;
}

- (void)setHighConfidencePipelineReferenceCounter:(unint64_t)a3
{
  unint64_t highConfidencePipelineReferenceCounter;

  highConfidencePipelineReferenceCounter = self->_highConfidencePipelineReferenceCounter;
  if (highConfidencePipelineReferenceCounter != a3)
  {
    if (highConfidencePipelineReferenceCounter)
    {
      if (a3)
      {
LABEL_4:
        self->_highConfidencePipelineReferenceCounter = a3;
        return;
      }
    }
    else
    {
      -[RTVisitMonitor _setupRealtimePipelineWithType:handler:](self, "_setupRealtimePipelineWithType:handler:", 2, &__block_literal_global_108);
      if (a3)
        goto LABEL_4;
    }
    -[RTVisitMonitor _stopMonitoringAllRegionsForPipelineType:](self, "_stopMonitoringAllRegionsForPipelineType:", 2);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pipelines, "setObject:forKeyedSubscript:", 0, &unk_1E9327EF0);
    goto LABEL_4;
  }
}

void __60__RTVisitMonitor_setHighConfidencePipelineReferenceCounter___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    +[RTVisitPipeline typeToString:](RTVisitPipeline, "typeToString:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v4;
    v7 = 2112;
    v8 = v2;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "setup complete, pipeline, %@, error, %@", (uint8_t *)&v5, 0x16u);

  }
}

- (void)_stopMonitoringAllRegionsForPipelineType:(unint64_t)a3
{
  NSMutableSet *pipelinesMonitoringRegion;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  pipelinesMonitoringRegion = self->_pipelinesMonitoringRegion;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(pipelinesMonitoringRegion) = -[NSMutableSet containsObject:](pipelinesMonitoringRegion, "containsObject:", v6);

  if ((_DWORD)pipelinesMonitoringRegion)
  {
    -[RTVisitMonitor locationManager](self, "locationManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "regionMonitoringClientIdentifierForPipelineType:", a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = 0;
    objc_msgSend(v7, "stopMonitoringAllRegionsForClientIdentifier:error:", v8, &v12);
    v9 = v12;

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      +[RTVisitPipeline typeToString:](RTVisitPipeline, "typeToString:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v11;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_INFO, "stopMonitoringAllRegionsForClientIdentifier complete, pipeline, %@, error, %@", buf, 0x16u);

    }
  }
}

- (void)setLowConfidencePipelineReferenceCounter:(unint64_t)a3
{
  unint64_t lowConfidencePipelineReferenceCounter;

  lowConfidencePipelineReferenceCounter = self->_lowConfidencePipelineReferenceCounter;
  if (lowConfidencePipelineReferenceCounter != a3)
  {
    if (lowConfidencePipelineReferenceCounter)
    {
      if (a3)
      {
LABEL_4:
        self->_lowConfidencePipelineReferenceCounter = a3;
        return;
      }
    }
    else
    {
      -[RTVisitMonitor _setupRealtimePipelineWithType:handler:](self, "_setupRealtimePipelineWithType:handler:", 1, &__block_literal_global_110);
      if (a3)
        goto LABEL_4;
    }
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_pipelines, "setObject:forKeyedSubscript:", 0, &unk_1E9327F08);
    goto LABEL_4;
  }
}

void __59__RTVisitMonitor_setLowConfidencePipelineReferenceCounter___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    +[RTVisitPipeline typeToString:](RTVisitPipeline, "typeToString:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = 138412546;
    v6 = v4;
    v7 = 2112;
    v8 = v2;
    _os_log_debug_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_DEBUG, "setup complete, pipeline, %@, error, %@", (uint8_t *)&v5, 0x16u);

  }
}

- (void)setMonitoringVisitIncidents:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_monitoringVisitIncidents != a3)
  {
    v3 = a3;
    self->_monitoringVisitIncidents = a3;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "start monitoring visit incidents", buf, 2u);
      }

      -[RTVisitMonitor _registerVisitMonitorForRegionEventsForPipelineType:](self, "_registerVisitMonitorForRegionEventsForPipelineType:", 2);
      -[RTVisitMonitor setHighConfidencePipelineReferenceCounter:](self, "setHighConfidencePipelineReferenceCounter:", -[RTVisitMonitor highConfidencePipelineReferenceCounter](self, "highConfidencePipelineReferenceCounter") + 1);
      -[RTVisitMonitor setFeedBufferReferenceCounter:](self, "setFeedBufferReferenceCounter:", -[RTVisitMonitor feedBufferReferenceCounter](self, "feedBufferReferenceCounter") + 1);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "stop monitoring visit incidents", v7, 2u);
      }

      -[RTVisitMonitor setFeedBufferReferenceCounter:](self, "setFeedBufferReferenceCounter:", -[RTVisitMonitor feedBufferReferenceCounter](self, "feedBufferReferenceCounter") - 1);
      -[RTVisitMonitor setHighConfidencePipelineReferenceCounter:](self, "setHighConfidencePipelineReferenceCounter:", -[RTVisitMonitor highConfidencePipelineReferenceCounter](self, "highConfidencePipelineReferenceCounter") - 1);
      -[RTVisitMonitor _unregisterVisitMonitorForRegionEventsForPipelineType:](self, "_unregisterVisitMonitorForRegionEventsForPipelineType:", 2);
    }
  }
}

- (void)setMonitoringLeechedVisitIncidents:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_monitoringLeechedVisitIncidents != a3)
  {
    v3 = a3;
    self->_monitoringLeechedVisitIncidents = a3;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "start monitoring leeched visit incidents", buf, 2u);
      }

      -[RTVisitMonitor setHighConfidencePipelineReferenceCounter:](self, "setHighConfidencePipelineReferenceCounter:", -[RTVisitMonitor highConfidencePipelineReferenceCounter](self, "highConfidencePipelineReferenceCounter") + 1);
      -[RTVisitMonitor setFeedBufferReferenceCounter:](self, "setFeedBufferReferenceCounter:", -[RTVisitMonitor feedBufferReferenceCounter](self, "feedBufferReferenceCounter") + 1);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "stop monitoring leeched visit incidents", v7, 2u);
      }

      -[RTVisitMonitor setFeedBufferReferenceCounter:](self, "setFeedBufferReferenceCounter:", -[RTVisitMonitor feedBufferReferenceCounter](self, "feedBufferReferenceCounter") - 1);
      -[RTVisitMonitor setHighConfidencePipelineReferenceCounter:](self, "setHighConfidencePipelineReferenceCounter:", -[RTVisitMonitor highConfidencePipelineReferenceCounter](self, "highConfidencePipelineReferenceCounter") - 1);
    }
  }
}

- (void)setMonitoringLowConfidenceVisitIncidents:(BOOL)a3
{
  _BOOL4 v3;
  NSObject *v5;
  _BOOL4 v6;
  uint8_t v7[16];
  uint8_t buf[16];

  if (self->_monitoringLowConfidenceVisitIncidents != a3)
  {
    v3 = a3;
    self->_monitoringLowConfidenceVisitIncidents = a3;
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = os_log_type_enabled(v5, OS_LOG_TYPE_INFO);
    if (v3)
    {
      if (v6)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "start monitoring low-confidence visit incidents.", buf, 2u);
      }

      -[RTVisitMonitor setLowConfidencePipelineReferenceCounter:](self, "setLowConfidencePipelineReferenceCounter:", -[RTVisitMonitor lowConfidencePipelineReferenceCounter](self, "lowConfidencePipelineReferenceCounter") + 1);
      -[RTVisitMonitor setFeedBufferReferenceCounter:](self, "setFeedBufferReferenceCounter:", -[RTVisitMonitor feedBufferReferenceCounter](self, "feedBufferReferenceCounter") + 1);
    }
    else
    {
      if (v6)
      {
        *(_WORD *)v7 = 0;
        _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "stop monitoring low-confidence visit incidents.", v7, 2u);
      }

      -[RTVisitMonitor setFeedBufferReferenceCounter:](self, "setFeedBufferReferenceCounter:", -[RTVisitMonitor feedBufferReferenceCounter](self, "feedBufferReferenceCounter") - 1);
      -[RTVisitMonitor setLowConfidencePipelineReferenceCounter:](self, "setLowConfidencePipelineReferenceCounter:", -[RTVisitMonitor lowConfidencePipelineReferenceCounter](self, "lowConfidencePipelineReferenceCounter") - 1);
    }
  }
}

- (void)startMonitoringVisitIncidents
{
  NSObject *v3;
  _QWORD block[5];

  -[RTVisitMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __47__RTVisitMonitor_startMonitoringVisitIncidents__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __47__RTVisitMonitor_startMonitoringVisitIncidents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMonitoringVisitIncidents:", 1);
}

- (void)stopMonitoringVisitIncidents
{
  NSObject *v3;
  _QWORD block[5];

  -[RTVisitMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__RTVisitMonitor_stopMonitoringVisitIncidents__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __46__RTVisitMonitor_stopMonitoringVisitIncidents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMonitoringVisitIncidents:", 0);
}

- (void)startMonitoringLeechedVisitIncidents
{
  NSObject *v3;
  _QWORD block[5];

  -[RTVisitMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __54__RTVisitMonitor_startMonitoringLeechedVisitIncidents__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __54__RTVisitMonitor_startMonitoringLeechedVisitIncidents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMonitoringLeechedVisitIncidents:", 1);
}

- (void)stopMonitoringLeechedVisitIncidents
{
  NSObject *v3;
  _QWORD block[5];

  -[RTVisitMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__RTVisitMonitor_stopMonitoringLeechedVisitIncidents__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __53__RTVisitMonitor_stopMonitoringLeechedVisitIncidents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMonitoringLeechedVisitIncidents:", 0);
}

- (void)startMonitoringLowConfidenceVisitIncidents
{
  NSObject *v3;
  _QWORD block[5];

  -[RTVisitMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __60__RTVisitMonitor_startMonitoringLowConfidenceVisitIncidents__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __60__RTVisitMonitor_startMonitoringLowConfidenceVisitIncidents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMonitoringLowConfidenceVisitIncidents:", 1);
}

- (void)stopMonitoringLowConfidenceVisitIncidents
{
  NSObject *v3;
  _QWORD block[5];

  -[RTVisitMonitor queue](self, "queue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__RTVisitMonitor_stopMonitoringLowConfidenceVisitIncidents__block_invoke;
  block[3] = &unk_1E92977B8;
  block[4] = self;
  dispatch_async(v3, block);

}

uint64_t __59__RTVisitMonitor_stopMonitoringLowConfidenceVisitIncidents__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setMonitoringLowConfidenceVisitIncidents:", 0);
}

- (void)_startFeedBuffer
{
  NSObject *v3;
  RTVisitFeedBuffer *v4;
  RTVisitFeedBuffer *feedBuffer;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  const char *v20;
  __int16 v21;
  int v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D1A22000, v3, OS_LOG_TYPE_INFO, "starting feed buffer", buf, 2u);
  }

  v4 = -[RTVisitFeedBuffer initWithMinWaitInterval:]([RTVisitFeedBuffer alloc], "initWithMinWaitInterval:", 15.0);
  feedBuffer = self->_feedBuffer;
  self->_feedBuffer = v4;

  -[RTVisitMonitor state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dump");

  -[RTVisitMonitor locationManager](self, "locationManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObserver:selector:name:", self, sel_onLeechedLocationsNotification_, v8);

  -[RTVisitMonitor locationAwarenessManager](self, "locationAwarenessManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "LocationHeartbeatWhileAwake");
  v14 = 0;
  objc_msgSend(v9, "addLocationHeartbeatRequester:interval:error:", self, &v14);
  v10 = v14;

  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v12 = objc_msgSend(v10, "code");
      objc_msgSend(v10, "localizedDescription");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v16 = v12;
      v17 = 2112;
      v18 = v13;
      v19 = 2080;
      v20 = "-[RTVisitMonitor _startFeedBuffer]";
      v21 = 1024;
      v22 = 1150;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "Request location heartbeat error, code, %ld, description, %@ (in %s:%d)", buf, 0x26u);

    }
  }

}

- (void)_stopFeedBuffer
{
  void *v3;
  void *v4;
  void *v5;
  RTTimer *feedBufferTimer;
  RTVisitFeedBuffer *feedBuffer;

  -[RTVisitMonitor locationManager](self, "locationManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[RTNotification notificationName](RTLocationManagerNotificationLocationsLeeched, "notificationName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:fromNotification:", self, v4);

  -[RTVisitMonitor locationAwarenessManager](self, "locationAwarenessManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeLocationHeartbeatRequester:", self);

  -[RTTimer invalidate](self->_feedBufferTimer, "invalidate");
  feedBufferTimer = self->_feedBufferTimer;
  self->_feedBufferTimer = 0;

  feedBuffer = self->_feedBuffer;
  self->_feedBuffer = 0;

}

+ (id)regionWithRegionIdentifier:(id)a3 location:(id)a4 shouldNotifyForEntry:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  id v12;
  double v13;
  CLLocationDegrees v14;
  CLLocationDegrees v15;
  CLLocationCoordinate2D v16;
  void *v17;

  v5 = a5;
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v5)
  {
    objc_msgSend(v8, "horizontalUncertainty");
    if (v10 < 5.0)
      v10 = 5.0;
    v11 = fmin(v10, 100.0);
  }
  else
  {
    v11 = 500.0;
  }
  v12 = objc_alloc(MEMORY[0x1E0C9E368]);
  objc_msgSend(v9, "latitude");
  v14 = v13;
  objc_msgSend(v9, "longitude");
  v16 = CLLocationCoordinate2DMake(v14, v15);
  v17 = (void *)objc_msgSend(v12, "initForLowPowerWithCenter:radius:identifier:", v7, v16.latitude, v16.longitude, v11);
  objc_msgSend(v17, "setNotifyOnEntry:", v5);
  objc_msgSend(v17, "setNotifyOnExit:", v5 ^ 1);

  return v17;
}

- (void)setupGeoFencesForVisit:(id)a3 pipelineType:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  unint64_t v16;

  v8 = a3;
  v9 = a5;
  -[RTVisitMonitor queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __62__RTVisitMonitor_setupGeoFencesForVisit_pipelineType_handler___block_invoke;
  v13[3] = &unk_1E9297590;
  v13[4] = self;
  v14 = v8;
  v15 = v9;
  v16 = a4;
  v11 = v9;
  v12 = v8;
  dispatch_async(v10, v13);

}

void __62__RTVisitMonitor_setupGeoFencesForVisit_pipelineType_handler___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  id v6;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[7];
  v6 = 0;
  objc_msgSend(v2, "_setupGeoFencesForVisit:pipelineType:error:", v3, v4, &v6);
  v5 = v6;
  (*(void (**)(void))(a1[6] + 16))();

}

- (BOOL)_setupGeoFencesForVisit:(id)a3 pipelineType:(unint64_t)a4 error:(id *)a5
{
  id v9;
  NSObject *v10;
  NSMutableSet *pipelinesMonitoringRegion;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  char *v22;
  RTDeviceLocationPredictor *deviceLocationPredictor;
  void *v24;
  void *v25;
  NSObject *v26;
  _QWORD v28[5];
  id v29;
  id v30;
  SEL v31;
  id v32;
  id v33;
  uint8_t buf[4];
  const char *v35;
  __int16 v36;
  void *v37;
  __int16 v38;
  void *v39;
  __int16 v40;
  id v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  if (!v9)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v35 = "-[RTVisitMonitor _setupGeoFencesForVisit:pipelineType:error:]";
      v36 = 1024;
      LODWORD(v37) = 1273;
      _os_log_error_impl(&dword_1D1A22000, v10, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit (in %s:%d)", buf, 0x12u);
    }

  }
  pipelinesMonitoringRegion = self->_pipelinesMonitoringRegion;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(pipelinesMonitoringRegion) = -[NSMutableSet containsObject:](pipelinesMonitoringRegion, "containsObject:", v12);

  if ((_DWORD)pipelinesMonitoringRegion)
  {
    objc_msgSend((id)objc_opt_class(), "regionMonitoringClientIdentifierForPipelineType:", a4);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[RTVisitMonitor locationManager](self, "locationManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0;
    objc_msgSend(v14, "stopMonitoringAllRegionsForClientIdentifier:error:", v13, &v33);
    v15 = v33;

    if (v15)
    {
      if (a5)
      {
        v15 = objc_retainAutorelease(v15);
        v16 = 0;
        *a5 = v15;
      }
      else
      {
        v16 = 0;
      }
      goto LABEL_24;
    }
    if (objc_msgSend(v9, "type") == 1)
    {
      v17 = (void *)objc_opt_class();
      objc_msgSend(v9, "location");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "regionWithRegionIdentifier:location:shouldNotifyForEntry:", CFSTR("ExitForCurrentVisit"), v18, 0);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      -[RTVisitMonitor locationManager](self, "locationManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0;
      objc_msgSend(v20, "startMonitoringForRegion:clientIdentifier:error:", v19, v13, &v32);
      v15 = v32;

      _rt_log_facility_get_os_log(RTLogFacilityVisit);
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        NSStringFromSelector(a2);
        v22 = (char *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138413058;
        v35 = v22;
        v36 = 2112;
        v37 = v13;
        v38 = 2112;
        v39 = v19;
        v40 = 2112;
        v41 = v15;
        _os_log_impl(&dword_1D1A22000, v21, OS_LOG_TYPE_INFO, "%@, clientIdentifier, %@, start monitoring for region, %@, error, %@", buf, 0x2Au);

      }
      if (!a5)
        goto LABEL_23;
    }
    else
    {
      if (objc_msgSend(v9, "type") == 3)
      {
        deviceLocationPredictor = self->_deviceLocationPredictor;
        objc_msgSend(v9, "location");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "exit");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v28[0] = MEMORY[0x1E0C809B0];
        v28[1] = 3221225472;
        v28[2] = __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke;
        v28[3] = &unk_1E929C8D0;
        v28[4] = self;
        v29 = v13;
        v31 = a2;
        v30 = v9;
        -[RTDeviceLocationPredictor fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:handler:](deviceLocationPredictor, "fetchNextPredictedLocationsOfInterestFromLocation:startDate:timeInterval:handler:", v24, v25, v28, 7200.0);

      }
      else
      {
        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v26 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          v35 = (const char *)v9;
          _os_log_debug_impl(&dword_1D1A22000, v26, OS_LOG_TYPE_DEBUG, "Invalid type received on visit, %@", buf, 0xCu);
        }

      }
      v15 = 0;
      if (!a5)
        goto LABEL_23;
    }
    *a5 = objc_retainAutorelease(v15);
LABEL_23:
    v16 = v15 == 0;
LABEL_24:

    goto LABEL_25;
  }
  v16 = 0;
LABEL_25:

  return v16;
}

void __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  id v7;
  id v8;
  __int128 v9;
  _QWORD block[4];
  id v11;
  uint64_t v12;
  id v13;
  __int128 v14;

  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke_2;
  block[3] = &unk_1E92978E8;
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v11 = v3;
  v12 = v5;
  v13 = v6;
  v9 = *(_OWORD *)(a1 + 48);
  v7 = (id)v9;
  v14 = v9;
  v8 = v3;
  dispatch_async(v4, block);

}

void __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  char v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  id obj;
  _QWORD v34[5];
  id v35;
  uint64_t v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  uint64_t v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v2)
  {
    v3 = v2;
    v4 = 0;
    v5 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v3; ++i)
      {
        if (*(_QWORD *)v39 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        v8 = (void *)objc_opt_class();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%ld"), CFSTR("EntryForNextPredictedLocationOfInterest"), v4 + i + 1);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "locationOfInterest");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "location");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "regionWithRegionIdentifier:location:shouldNotifyForEntry:", v9, v11, 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 40), "locationManager");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = *(_QWORD *)(a1 + 48);
        v37 = 0;
        objc_msgSend(v13, "startMonitoringForRegion:clientIdentifier:error:", v12, v14, &v37);
        v15 = v37;

        _rt_log_facility_get_os_log(RTLogFacilityVisit);
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          NSStringFromSelector(*(SEL *)(a1 + 64));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = *(_QWORD *)(a1 + 48);
          *(_DWORD *)buf = 138413058;
          v43 = v17;
          v44 = 2112;
          v45 = v18;
          v46 = 2112;
          v47 = v12;
          v48 = 2112;
          v49 = v15;
          _os_log_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_INFO, "%@, clientIdentifier, %@, start monitoring for region, %@, error, %@", buf, 0x2Au);

        }
      }
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
      v4 += i;
    }
    while (v3);
  }

  objc_msgSend(*(id *)(a1 + 32), "valueForKeyPath:", CFSTR("locationOfInterest"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "valueForKeyPath:", CFSTR("identifier"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "placeInference");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "loiIdentifier");
  v22 = objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    v23 = (void *)v22;
    objc_msgSend(*(id *)(a1 + 56), "placeInference");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "loiIdentifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v20, "containsObject:", v25);

    if ((v26 & 1) == 0)
    {
      v27 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
      objc_msgSend(*(id *)(a1 + 56), "placeInference");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "loiIdentifier");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke_124;
      v34[3] = &unk_1E929C8A8;
      v30 = *(void **)(a1 + 48);
      v34[4] = *(_QWORD *)(a1 + 40);
      v31 = v30;
      v32 = *(_QWORD *)(a1 + 64);
      v35 = v31;
      v36 = v32;
      objc_msgSend(v27, "fetchLocationOfInterestWithIdentifier:handler:", v29, v34);

    }
  }
  else
  {

  }
}

void __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke_124(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  id v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t v10;

  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "queue");
    v4 = objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke_2_125;
    v7[3] = &unk_1E9298238;
    v7[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v5 = *(id *)(a1 + 40);
    v6 = *(_QWORD *)(a1 + 48);
    v9 = v5;
    v10 = v6;
    dispatch_async(v4, v7);

  }
}

void __61__RTVisitMonitor__setupGeoFencesForVisit_pipelineType_error___block_invoke_2_125(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  uint64_t v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(a1 + 40), "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "location");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "regionWithRegionIdentifier:location:shouldNotifyForEntry:", CFSTR("EntryForLastVisitExit"), v4, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "locationManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(a1 + 48);
  v12 = 0;
  objc_msgSend(v6, "startMonitoringForRegion:clientIdentifier:error:", v5, v7, &v12);
  v8 = v12;

  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    NSStringFromSelector(*(SEL *)(a1 + 56));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(a1 + 48);
    *(_DWORD *)buf = 138413058;
    v14 = v10;
    v15 = 2112;
    v16 = v11;
    v17 = 2112;
    v18 = v5;
    v19 = 2112;
    v20 = v8;
    _os_log_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_INFO, "%@, clientIdentifier, %@, start monitoring for region, %@, error, %@", buf, 0x2Au);

  }
}

- (id)_updateSourceForVisit:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint8_t buf[16];

  v3 = a3;
  if (v3)
  {
    v4 = objc_alloc(MEMORY[0x1E0D18578]);
    objc_msgSend(v3, "date");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v3, "type");
    objc_msgSend(v3, "location");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "entry");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "exit");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v3, "dataPointCount");
    objc_msgSend(v3, "confidence");
    v12 = v11;
    objc_msgSend(v3, "placeInference");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v4, "initWithDate:type:location:entry:exit:dataPointCount:confidence:placeInference:source:", v5, v6, v7, v8, v9, v10, v12, v13, 1);

  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D1A22000, v15, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: visit", buf, 2u);
    }

    v14 = 0;
  }

  return v14;
}

uint64_t __50__RTVisitMonitor__processRealtimeVisits_pipeline___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_updateSourceForVisit:", a2);
}

- (void)fetchVisitMonitorStatusWithHandler:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTVisitMonitor fetchVisitMonitorStatusWithHandler:]";
      v12 = 1024;
      v13 = 1496;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTVisitMonitor queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __53__RTVisitMonitor_fetchVisitMonitorStatusWithHandler___block_invoke;
  v8[3] = &unk_1E9297678;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __53__RTVisitMonitor_fetchVisitMonitorStatusWithHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  RTVisitMonitorStatus *v2;

  v1 = *(_QWORD *)(a1 + 40);
  v2 = -[RTVisitMonitorStatus initWithMonitoringVisitIncidents:monitoringLeechedVisitIncidents:monitoringLowConfidenceVisitIncidents:feedBufferReferenceCounter:]([RTVisitMonitorStatus alloc], "initWithMonitoringVisitIncidents:monitoringLeechedVisitIncidents:monitoringLowConfidenceVisitIncidents:feedBufferReferenceCounter:", objc_msgSend(*(id *)(a1 + 32), "monitoringVisitIncidents"), objc_msgSend(*(id *)(a1 + 32), "monitoringLeechedVisitIncidents"), objc_msgSend(*(id *)(a1 + 32), "monitoringLowConfidenceVisitIncidents"), objc_msgSend(*(id *)(a1 + 32), "feedBufferReferenceCounter"));
  (*(void (**)(uint64_t, RTVisitMonitorStatus *))(v1 + 16))(v1, v2);

}

- (void)fetchVisitMonitorState:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  const char *v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!v4)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315394;
      v11 = "-[RTVisitMonitor fetchVisitMonitorState:]";
      v12 = 1024;
      v13 = 1507;
      _os_log_error_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: handler (in %s:%d)", buf, 0x12u);
    }

  }
  -[RTVisitMonitor queue](self, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __41__RTVisitMonitor_fetchVisitMonitorState___block_invoke;
  v8[3] = &unk_1E9297678;
  v8[4] = self;
  v9 = v4;
  v7 = v4;
  dispatch_async(v6, v8);

}

void __41__RTVisitMonitor_fetchVisitMonitorState___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "state");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id, _QWORD))(v1 + 16))(v1, v2, 0);

}

- (void)showVisitReentryDetectionUI
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  int v9;
  const __CFAllocator *v10;
  __CFUserNotification *v11;
  __CFUserNotification *v12;
  CFRunLoopSourceRef RunLoopSource;
  __CFRunLoopSource *v14;
  __CFRunLoop *Main;
  CFDictionaryRef dictionary;

  -[RTVisitMonitor platform](self, "platform");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "internalInstall");

  if (v4)
  {
    -[RTVisitMonitor platform](self, "platform");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "iPhoneDevice");

    if (v6)
    {
      -[RTVisitMonitor defaultsManager](self, "defaultsManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKey:", CFSTR("VisitReentryDetection"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "BOOLValue");

      if (v9)
      {
        dictionary = (CFDictionaryRef)objc_opt_new();
        -[__CFDictionary setObject:forKeyedSubscript:](dictionary, "setObject:forKeyedSubscript:", CFSTR("Detected Reentry to Home LOI"), *MEMORY[0x1E0C9B800]);
        -[__CFDictionary setObject:forKeyedSubscript:](dictionary, "setObject:forKeyedSubscript:", CFSTR("Please file a radar if you did not intend to exit and re-enter home"), *MEMORY[0x1E0C9B810]);
        -[__CFDictionary setObject:forKeyedSubscript:](dictionary, "setObject:forKeyedSubscript:", CFSTR("Tap-to-Radar"), *MEMORY[0x1E0C9B830]);
        -[__CFDictionary setObject:forKeyedSubscript:](dictionary, "setObject:forKeyedSubscript:", CFSTR("Dismiss"), *MEMORY[0x1E0C9B838]);
        v10 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
        v11 = CFUserNotificationCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0.0, 0, 0, dictionary);
        if (v11)
        {
          v12 = v11;
          RunLoopSource = CFUserNotificationCreateRunLoopSource(v10, v11, (CFUserNotificationCallBack)_engineeringUIResponseHandler, 0);
          if (RunLoopSource)
          {
            v14 = RunLoopSource;
            Main = CFRunLoopGetMain();
            CFRunLoopAddSource(Main, v14, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
            v12 = v14;
          }
          CFRelease(v12);
        }

      }
    }
  }
}

- (void)_compareVisit:(id)a3 previousVisit:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  objc_class *v41;
  void *v42;
  void *v43;
  NSObject *v44;
  objc_class *v45;
  void *v46;
  uint64_t v47;
  void *v48;
  const __CFString *v49;
  double v50;
  double v51;
  void *v52;
  double v53;
  void *v54;
  void *v55;
  int v56;
  NSObject *v57;
  objc_class *v58;
  void *v59;
  void *v60;
  int v61;
  id v62;
  id v63;
  uint8_t buf[4];
  void *v65;
  __int16 v66;
  uint64_t v67;
  __int16 v68;
  double v69;
  __int16 v70;
  double v71;
  __int16 v72;
  double v73;
  __int16 v74;
  const __CFString *v75;
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = v8;
  if (v7 && v8)
  {
    objc_msgSend(v7, "exit");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(v7, "entry");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v13 = v12;

    objc_msgSend(v9, "exit");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      v16 = v14;
    }
    else
    {
      objc_msgSend(v9, "entry");
      v16 = (id)objc_claimAutoreleasedReturnValue();
    }
    v17 = v16;

    objc_msgSend(v13, "timeIntervalSinceDate:", v17);
    v19 = v18;
    objc_msgSend(v9, "exit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v20;
    if (!v20)
    {
      objc_msgSend(v9, "date");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v9, "entry");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      objc_msgSend(v21, "timeIntervalSinceDate:", v22);
      v24 = v23;
    }
    else
    {
      objc_msgSend(v9, "date");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "timeIntervalSinceDate:", v25);
      v24 = v26;

    }
    if (!v20)

    -[RTVisitMonitor distanceCalculator](self, "distanceCalculator");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "location");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "location");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v63 = 0;
    objc_msgSend(v27, "distanceFromLocation:toLocation:error:", v28, v29, &v63);
    v31 = v30;
    v62 = v63;

    objc_msgSend(v7, "placeInference");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "loiIdentifier");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "placeInference");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "loiIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = objc_msgSend(v33, "isEqual:", v35);

    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v36 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v37 = (objc_class *)objc_opt_class();
      NSStringFromClass(v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v65 = v38;
      v66 = 2112;
      v67 = (uint64_t)v39;
      v68 = 2112;
      v69 = *(double *)&v7;
      _os_log_impl(&dword_1D1A22000, v36, OS_LOG_TYPE_INFO, "%@, %@, visit, %@", buf, 0x20u);

    }
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v40 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      v41 = (objc_class *)objc_opt_class();
      NSStringFromClass(v41);
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412802;
      v65 = v42;
      v66 = 2112;
      v67 = (uint64_t)v43;
      v68 = 2112;
      v69 = *(double *)&v9;
      _os_log_impl(&dword_1D1A22000, v40, OS_LOG_TYPE_INFO, "%@, %@, previous visit, %@", buf, 0x20u);

    }
    _rt_log_facility_get_os_log(RTLogFacilityVisit);
    v44 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      v45 = (objc_class *)objc_opt_class();
      NSStringFromClass(v45);
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromSelector(a2);
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = (void *)v47;
      v49 = CFSTR("NO");
      *(_DWORD *)buf = 138413570;
      v65 = v46;
      v66 = 2112;
      if (v61)
        v49 = CFSTR("YES");
      v67 = v47;
      v68 = 2048;
      v69 = v24;
      v70 = 2048;
      v71 = v19;
      v72 = 2048;
      v73 = v31;
      v74 = 2112;
      v75 = v49;
      _os_log_impl(&dword_1D1A22000, v44, OS_LOG_TYPE_INFO, "%@, %@, durationOfPreviousVisit, %.2f, intervalSincePreviousVisit, %.2f, distanceFromPreviousVisit, %.2f, visits to same LOI, %@", buf, 0x3Eu);

    }
    objc_msgSend(v7, "confidence");
    v50 = *MEMORY[0x1E0D185C8];
    if (v51 != *MEMORY[0x1E0D185C8] || objc_msgSend(v7, "type") != 1)
      goto LABEL_43;
    objc_msgSend(v7, "placeInference");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v52, "userType") == 1)
    {
      objc_msgSend(v9, "confidence");
      if (v53 == v50 && objc_msgSend(v9, "type") == 3)
      {
        objc_msgSend(v7, "placeInference");
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v54, "userType") == 1)
        {
          objc_msgSend(v9, "placeInference");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v55, "userType") == 1)
          {
            if (v24 > 1800.0)
              v56 = v61;
            else
              v56 = 0;

            if (v56 == 1 && v19 < 240.0 && v31 < 300.0)
            {
              _rt_log_facility_get_os_log(RTLogFacilityVisit);
              v57 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                v58 = (objc_class *)objc_opt_class();
                NSStringFromClass(v58);
                v59 = (void *)objc_claimAutoreleasedReturnValue();
                NSStringFromSelector(a2);
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412546;
                v65 = v59;
                v66 = 2112;
                v67 = (uint64_t)v60;
                _os_log_impl(&dword_1D1A22000, v57, OS_LOG_TYPE_INFO, "%@, %@, observed exit and re-entry to home", buf, 0x16u);

              }
              -[RTVisitMonitor showVisitReentryDetectionUI](self, "showVisitReentryDetectionUI");
            }
            goto LABEL_43;
          }

        }
      }
    }

LABEL_43:
  }

}

- (void)compareVisit:(id)a3 previousVisit:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[RTVisitMonitor queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __45__RTVisitMonitor_compareVisit_previousVisit___block_invoke;
  block[3] = &unk_1E9299D78;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

uint64_t __45__RTVisitMonitor_compareVisit_previousVisit___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_compareVisit:previousVisit:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
}

- (void)handleVisitIncident:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  -[RTVisitMonitor state](self, "state");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lastVisitIncident");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[RTVisitMonitor state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLastVisitIncident:", v8);

  if (-[RTVisitMonitor monitoringVisitIncidents](self, "monitoringVisitIncidents")
    || -[RTVisitMonitor monitoringLeechedVisitIncidents](self, "monitoringLeechedVisitIncidents"))
  {
    -[RTVisitMonitor delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "onVisitIncident:error:", v8, 0);
    -[RTVisitMonitor _compareVisit:previousVisit:](self, "_compareVisit:previousVisit:", v8, v5);

  }
}

- (void)handleLowConfidenceVisitIncident:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  _rt_log_facility_get_os_log(RTLogFacilityVisit);
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v8 = 138412290;
    v9 = v4;
    _os_log_impl(&dword_1D1A22000, v5, OS_LOG_TYPE_INFO, "low confidence visit, %@", (uint8_t *)&v8, 0xCu);
  }

  -[RTVisitMonitor state](self, "state");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setLastLowConfidenceVisitIncident:", v4);

  if (-[RTVisitMonitor monitoringLowConfidenceVisitIncidents](self, "monitoringLowConfidenceVisitIncidents"))
  {
    -[RTVisitMonitor delegate](self, "delegate");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v7, "onLowConfidenceVisitIncident:error:", v4, 0);

  }
}

- (RTVisitMonitorDelegate)delegate
{
  return (RTVisitMonitorDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (RTDefaultsManager)defaultsManager
{
  return self->_defaultsManager;
}

- (void)setDefaultsManager:(id)a3
{
  objc_storeStrong((id *)&self->_defaultsManager, a3);
}

- (RTDeviceLocationPredictor)deviceLocationPredictor
{
  return self->_deviceLocationPredictor;
}

- (void)setDeviceLocationPredictor:(id)a3
{
  objc_storeStrong((id *)&self->_deviceLocationPredictor, a3);
}

- (RTDistanceCalculator)distanceCalculator
{
  return self->_distanceCalculator;
}

- (void)setDistanceCalculator:(id)a3
{
  objc_storeStrong((id *)&self->_distanceCalculator, a3);
}

- (RTHintManager)hintManager
{
  return self->_hintManager;
}

- (void)setHintManager:(id)a3
{
  objc_storeStrong((id *)&self->_hintManager, a3);
}

- (RTLearnedLocationManager)learnedLocationManager
{
  return self->_learnedLocationManager;
}

- (void)setLearnedLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_learnedLocationManager, a3);
}

- (RTLocationAwarenessManager)locationAwarenessManager
{
  return self->_locationAwarenessManager;
}

- (void)setLocationAwarenessManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationAwarenessManager, a3);
}

- (RTLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (RTMetricManager)metricManager
{
  return self->_metricManager;
}

- (void)setMetricManager:(id)a3
{
  objc_storeStrong((id *)&self->_metricManager, a3);
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

- (RTTimerManager)timerManager
{
  return self->_timerManager;
}

- (void)setTimerManager:(id)a3
{
  objc_storeStrong((id *)&self->_timerManager, a3);
}

- (RTVisitLabeler)visitLabeler
{
  return self->_visitLabeler;
}

- (void)setVisitLabeler:(id)a3
{
  objc_storeStrong((id *)&self->_visitLabeler, a3);
}

- (RTVisitMonitorState)state
{
  return self->_state;
}

- (void)setState:(id)a3
{
  objc_storeStrong((id *)&self->_state, a3);
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (unint64_t)feedBufferReferenceCounter
{
  return self->_feedBufferReferenceCounter;
}

- (unint64_t)lowConfidencePipelineReferenceCounter
{
  return self->_lowConfidencePipelineReferenceCounter;
}

- (unint64_t)highConfidencePipelineReferenceCounter
{
  return self->_highConfidencePipelineReferenceCounter;
}

- (NSMutableSet)pipelinesMonitoringRegion
{
  return self->_pipelinesMonitoringRegion;
}

- (void)setPipelinesMonitoringRegion:(id)a3
{
  objc_storeStrong((id *)&self->_pipelinesMonitoringRegion, a3);
}

- (NSMutableDictionary)pipelines
{
  return self->_pipelines;
}

- (void)setPipelines:(id)a3
{
  objc_storeStrong((id *)&self->_pipelines, a3);
}

- (BOOL)monitoringVisitIncidents
{
  return self->_monitoringVisitIncidents;
}

- (BOOL)monitoringLeechedVisitIncidents
{
  return self->_monitoringLeechedVisitIncidents;
}

- (BOOL)monitoringLowConfidenceVisitIncidents
{
  return self->_monitoringLowConfidenceVisitIncidents;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pipelines, 0);
  objc_storeStrong((id *)&self->_pipelinesMonitoringRegion, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_visitLabeler, 0);
  objc_storeStrong((id *)&self->_timerManager, 0);
  objc_storeStrong((id *)&self->_platform, 0);
  objc_storeStrong((id *)&self->_motionActivityManager, 0);
  objc_storeStrong((id *)&self->_metricManager, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_locationAwarenessManager, 0);
  objc_storeStrong((id *)&self->_learnedLocationManager, 0);
  objc_storeStrong((id *)&self->_hintManager, 0);
  objc_storeStrong((id *)&self->_distanceCalculator, 0);
  objc_storeStrong((id *)&self->_deviceLocationPredictor, 0);
  objc_storeStrong((id *)&self->_defaultsManager, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_feedBufferTimer, 0);
  objc_storeStrong((id *)&self->_feedBuffer, 0);
}

@end
