@implementation PowerUILocationSignalMonitor

- (PowerUILocationSignalMonitor)initWithDelegate:(id)a3 trialManager:(id)a4 withContextStore:(id)a5
{
  id v8;
  id v9;
  PowerUILocationSignalMonitor *v10;
  os_log_t v11;
  OS_os_log *log;
  NSObject *v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  NSObject *v16;
  dispatch_queue_t v17;
  OS_dispatch_queue *callbackQueue;
  NSObject *v19;
  dispatch_queue_t v20;
  OS_dispatch_queue *fullChargeDateQueue;
  uint64_t v22;
  RTRoutineManager *routine;
  dispatch_semaphore_t v24;
  OS_dispatch_semaphore *authorizationSemaphore;
  uint64_t v26;
  CLLocationManager *locationManager;
  objc_super v29;

  v8 = a3;
  v9 = a5;
  v29.receiver = self;
  v29.super_class = (Class)PowerUILocationSignalMonitor;
  v10 = -[PowerUILocationSignalMonitor init](&v29, sel_init);
  if (v10)
  {
    v11 = os_log_create("com.apple.powerui.smartcharging", "signals");
    log = v10->_log;
    v10->_log = (OS_os_log *)v11;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = dispatch_queue_create("com.apple.powerui.locsignalmonitor.queue", v13);
    queue = v10->_queue;
    v10->_queue = (OS_dispatch_queue *)v14;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = dispatch_queue_create("com.apple.powerui.locsignalmonitor.callbackqueue", v16);
    callbackQueue = v10->_callbackQueue;
    v10->_callbackQueue = (OS_dispatch_queue *)v17;

    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = dispatch_queue_create("com.apple.powerui.locsignalmonitor.fullchargedatequeue", v19);
    fullChargeDateQueue = v10->_fullChargeDateQueue;
    v10->_fullChargeDateQueue = (OS_dispatch_queue *)v20;

    objc_storeStrong((id *)&v10->_delegate, a3);
    objc_storeStrong((id *)&v10->_context, a5);
    objc_msgSend(MEMORY[0x24BE27ED0], "defaultManager");
    v22 = objc_claimAutoreleasedReturnValue();
    routine = v10->_routine;
    v10->_routine = (RTRoutineManager *)v22;

    v24 = dispatch_semaphore_create(0);
    authorizationSemaphore = v10->_authorizationSemaphore;
    v10->_authorizationSemaphore = (OS_dispatch_semaphore *)v24;

    v26 = objc_msgSend(objc_alloc(MEMORY[0x24BDBFA88]), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/LocationBundles/SystemCustomization.bundle"), v10, v10->_callbackQueue);
    locationManager = v10->_locationManager;
    v10->_locationManager = (CLLocationManager *)v26;

    -[CLLocationManager setDesiredAccuracy:](v10->_locationManager, "setDesiredAccuracy:", 100.0);
  }

  return v10;
}

+ (PowerUILocationSignalMonitor)monitorWithDelegate:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  v4 = (void *)objc_opt_class();
  objc_msgSend(MEMORY[0x24BE1B170], "userContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "monitorWithDelegate:trialManager:withContext:", v3, 0, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (PowerUILocationSignalMonitor *)v6;
}

+ (PowerUILocationSignalMonitor)monitorWithDelegate:(id)a3 trialManager:(id)a4 withContext:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;

  v7 = a5;
  v8 = a4;
  v9 = a3;
  v10 = (void *)objc_msgSend(objc_alloc((Class)objc_opt_class()), "initWithDelegate:trialManager:withContextStore:", v9, v8, v7);

  return (PowerUILocationSignalMonitor *)v10;
}

- (unint64_t)signalID
{
  return 4;
}

- (id)longChargesAroundDate:(id)a3 withinSeconds:(double)a4 withinDays:(int)a5 withMinimumDuration:(double)a6 checkWhetherNearDate:(BOOL)a7
{
  id v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  double v17;
  uint64_t i;
  void *v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  +[PowerUISmartChargeUtilities pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:](PowerUISmartChargeUtilities, "pluginEventsBefore:withMinimumDuration:ignoringDisconnectsShorterThan:", v10, a6, 300.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v29;
    v17 = (double)a5;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v29 != v16)
          objc_enumerationMutation(v13);
        v19 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        objc_msgSend(v19, "startDate", (_QWORD)v28);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "timeIntervalSinceReferenceDate");
        v22 = v21;
        objc_msgSend(v10, "timeIntervalSinceReferenceDate");
        v24 = v23 + v17 * -86400.0;

        if (v22 > v24)
          objc_msgSend(v12, "addObject:", v19);
      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v15);
  }

  +[PowerUISmartChargeUtilities filterChargeSessions:startsBefore:dynamicallyAroundDate:withinSeconds:](PowerUISmartChargeUtilities, "filterChargeSessions:startsBefore:dynamicallyAroundDate:withinSeconds:", v12, v10, v10, (unint64_t)a4);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  +[PowerUISmartChargeUtilities concatenateChargeSessions:withMaxDeltaSecondsBetweenEvents:](PowerUISmartChargeUtilities, "concatenateChargeSessions:withMaxDeltaSecondsBetweenEvents:", v25, 10);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

- (BOOL)locationIsUncertain:(id)a3
{
  id v4;
  void *v5;
  double v6;
  NSObject *log;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "horizontalAccuracy");
    if (v6 <= 200.0)
    {
      v12 = 0;
      goto LABEL_9;
    }
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)MEMORY[0x24BDD16E0];
      v9 = log;
      objc_msgSend(v5, "horizontalAccuracy");
      objc_msgSend(v8, "numberWithDouble:");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v10;
      _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "Horizontal accuracy: %@. Returning uncertain", (uint8_t *)&v14, 0xCu);

    }
  }
  else
  {
    v11 = self->_log;
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v14) = 0;
      _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "No location: Returning uncertain", (uint8_t *)&v14, 2u);
    }
  }
  v12 = 1;
LABEL_9:

  return v12;
}

- (void)logPredictionsWithDuration:(id)a3 withConfidence:(id)a4 withLOIString:(id)a5 withPredictionMethod:(id)a6 withSkipString:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v11 = v20;
  v12 = v19;
  v13 = v18;
  v14 = v17;
  v15 = v16;
  AnalyticsSendEventLazy();

}

id __124__PowerUILocationSignalMonitor_logPredictionsWithDuration_withConfidence_withLOIString_withPredictionMethod_withSkipString___block_invoke(uint64_t a1)
{
  void *v2;
  const __CFString *v3;
  NSObject *v4;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 32), CFSTR("homeEntryDurationPrediction"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 40), CFSTR("confidence"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 48), CFSTR("loi"));
  objc_msgSend(v2, "setObject:forKeyedSubscript:", *(_QWORD *)(a1 + 56), CFSTR("predictionMethod"));
  if (*(_QWORD *)(a1 + 64))
    v3 = *(const __CFString **)(a1 + 64);
  else
    v3 = CFSTR("No Skip");
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("skip"));
  objc_msgSend(*(id *)(a1 + 72), "log");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 138412290;
    v7 = v2;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Logging to CA: %@", (uint8_t *)&v6, 0xCu);
  }

  return v2;
}

- (id)coreRoutinePredictedEntryDateFromNearbyLOIs:(id)a3
{
  dispatch_semaphore_t v4;
  RTRoutineManager *routine;
  void *v6;
  dispatch_time_t v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  double v21;
  NSObject *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  int v26;
  double v27;
  int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  NSObject *v39;
  NSObject *v40;
  void *v41;
  void *v42;
  double v43;
  id v44;
  _BOOL4 v45;
  void *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  NSObject *v50;
  void *v51;
  void *v53;
  id v54;
  dispatch_semaphore_t dsema;
  id obj;
  void *v57;
  uint64_t v58;
  uint64_t v59;
  void *v60;
  NSObject *v61;
  PowerUILocationSignalMonitor *v62;
  id v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[5];
  dispatch_semaphore_t v74;
  _QWORD *v75;
  uint64_t *v76;
  _QWORD v77[5];
  id v78;
  uint64_t v79;
  uint64_t *v80;
  uint64_t v81;
  uint64_t (*v82)(uint64_t, uint64_t);
  void (*v83)(uint64_t);
  id v84;
  uint8_t buf[4];
  void *v86;
  __int16 v87;
  id v88;
  _BYTE v89[128];
  _BYTE v90[128];
  uint64_t v91;

  v91 = *MEMORY[0x24BDAC8D0];
  v54 = a3;
  v53 = (void *)os_transaction_create();
  v79 = 0;
  v80 = &v79;
  v81 = 0x3032000000;
  v82 = __Block_byref_object_copy__8;
  v83 = __Block_byref_object_dispose__8;
  v84 = 0;
  v77[0] = 0;
  v77[1] = v77;
  v77[2] = 0x3032000000;
  v77[3] = __Block_byref_object_copy__8;
  v77[4] = __Block_byref_object_dispose__8;
  v78 = 0;
  v4 = dispatch_semaphore_create(0);
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  routine = self->_routine;
  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 36000.0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v73[0] = MEMORY[0x24BDAC760];
  v73[1] = 3221225472;
  v73[2] = __76__PowerUILocationSignalMonitor_coreRoutinePredictedEntryDateFromNearbyLOIs___block_invoke;
  v73[3] = &unk_24D3FCE78;
  v75 = v77;
  v73[4] = self;
  dsema = v4;
  v74 = dsema;
  v76 = &v79;
  -[RTRoutineManager fetchPredictedLocationsOfInterestBetweenStartDate:endDate:withHandler:](routine, "fetchPredictedLocationsOfInterestBetweenStartDate:endDate:withHandler:", v57, v6, v73);
  v62 = self;

  v7 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(dsema, v7))
  {
    -[PowerUILocationSignalMonitor log](self, "log");
    v61 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_ERROR))
      -[PowerUILocationSignalMonitor coreRoutinePredictedEntryDateFromNearbyLOIs:].cold.1();
    v63 = 0;
    goto LABEL_62;
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v61 = objc_claimAutoreleasedReturnValue();
  v71 = 0u;
  v72 = 0u;
  v69 = 0u;
  v70 = 0u;
  v8 = v54;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v70;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v70 != v10)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * i), "identifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject addObject:](v61, "addObject:", v12);

      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v69, v90, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", 28800.0);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  obj = (id)v80[5];
  v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
  if (!v13)
  {
    v63 = 0;
    goto LABEL_59;
  }
  v63 = 0;
  v58 = *(_QWORD *)v66;
  do
  {
    v59 = v13;
    for (j = 0; j != v59; ++j)
    {
      if (*(_QWORD *)v66 != v58)
        objc_enumerationMutation(obj);
      v15 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * j);
      objc_msgSend(v15, "nextEntryTime");
      v64 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "locationOfInterest");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v17)
      {

LABEL_24:
        -[PowerUILocationSignalMonitor log](v62, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v86 = v15;
          _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_INFO, "CR Skipping loi %@ because it's not nearby", buf, 0xCu);
        }
        v25 = CFSTR("Far Location");
LABEL_27:

        v26 = 0;
        if (v63)
          goto LABEL_28;
        v27 = 0.0;
        v28 = 1;
        goto LABEL_30;
      }
      objc_msgSend(v15, "locationOfInterest");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = -[NSObject containsObject:](v61, "containsObject:", v19);

      if ((v20 & 1) == 0)
        goto LABEL_24;
      objc_msgSend(v15, "confidence");
      if (v21 < 0.9)
      {
        -[PowerUILocationSignalMonitor log](v62, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v15, "confidence");
          objc_msgSend(v23, "numberWithDouble:");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          v86 = v24;
          _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_INFO, "CR LOI prediction is not confident %@", buf, 0xCu);

        }
        v25 = CFSTR("Low Confidence");
        goto LABEL_27;
      }
      if (!v64 || (objc_msgSend(v64, "timeIntervalSinceNow"), v43 <= 0.0))
      {
        -[PowerUILocationSignalMonitor log](v62, "log");
        v22 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v46 = (void *)MEMORY[0x24BDD16E0];
          objc_msgSend(v15, "locationOfInterest");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "numberWithInteger:", objc_msgSend(v47, "type"));
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v86 = v48;
          v87 = 2112;
          v88 = v64;
          _os_log_impl(&dword_215A71000, v22, OS_LOG_TYPE_INFO, "CR nextEntryTime to loi %@ is now, NULL, or in the past %@", buf, 0x16u);

        }
        v25 = CFSTR("No Duration");
        goto LABEL_27;
      }
      if (v63)
      {
        objc_msgSend(v63, "earlierDate:", v64);
        v44 = (id)objc_claimAutoreleasedReturnValue();
        v45 = v44 == v63;

        if (v45)
        {
          -[PowerUILocationSignalMonitor log](v62, "log");
          v49 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v86 = v64;
            v87 = 2112;
            v88 = v63;
            _os_log_impl(&dword_215A71000, v49, OS_LOG_TYPE_INFO, "CR prediction %@ is later than current prediction %@", buf, 0x16u);
          }

          v26 = 0;
          v25 = CFSTR("Later Prediction");
        }
        else
        {
          v25 = 0;
          v26 = 1;
        }
LABEL_28:
        objc_msgSend(v63, "timeIntervalSinceDate:", v57);
        v28 = 0;
        goto LABEL_30;
      }
      v25 = 0;
      v27 = 0.0;
      v28 = 1;
      v26 = 1;
LABEL_30:
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = (void *)MEMORY[0x24BDD16E0];
      objc_msgSend(v15, "locationOfInterest");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "confidence");
      objc_msgSend(v30, "numberWithDouble:");
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "locationOfInterest");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      +[PowerUILocationSignalMonitor stringFromRTType:](PowerUILocationSignalMonitor, "stringFromRTType:", objc_msgSend(v33, "type"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[PowerUILocationSignalMonitor logPredictionsWithDuration:withConfidence:withLOIString:withPredictionMethod:withSkipString:](v62, "logPredictionsWithDuration:withConfidence:withLOIString:withPredictionMethod:withSkipString:", v29, v32, v34, CFSTR("CoreRoutine"), v25);

      if (v26)
      {
        if (v28)
        {
          v35 = v64;
        }
        else
        {
          objc_msgSend(v63, "earlierDate:", v64);
          v35 = (id)objc_claimAutoreleasedReturnValue();
        }
        v36 = v35;

        objc_msgSend(v36, "earlierDate:", v60);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v38 = v60 == v37;

        if (v38)
        {
          v63 = v60;

          -[PowerUILocationSignalMonitor log](v62, "log");
          v39 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_215A71000, v39, OS_LOG_TYPE_DEFAULT, "CR predicted longer than 8 hours. Using 8 hour default", buf, 2u);
          }

        }
        else
        {
          v63 = v36;
        }
        -[PowerUILocationSignalMonitor log](v62, "log");
        v40 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
        {
          objc_msgSend(v15, "locationOfInterest");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          +[PowerUILocationSignalMonitor stringFromRTType:](PowerUILocationSignalMonitor, "stringFromRTType:", objc_msgSend(v41, "type"));
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v86 = v64;
          v87 = 2112;
          v88 = v42;
          _os_log_impl(&dword_215A71000, v40, OS_LOG_TYPE_DEFAULT, "CR predicts %@ for %@", buf, 0x16u);

        }
      }

    }
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v89, 16);
  }
  while (v13);
LABEL_59:

  -[PowerUILocationSignalMonitor log](v62, "log");
  v50 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
  {
    v51 = (void *)v80[5];
    *(_DWORD *)buf = 138412290;
    v86 = v51;
    _os_log_impl(&dword_215A71000, v50, OS_LOG_TYPE_DEFAULT, "CR Prediction with predicted next LOIs %@", buf, 0xCu);
  }

LABEL_62:
  _Block_object_dispose(v77, 8);

  _Block_object_dispose(&v79, 8);
  return v63;
}

void __76__PowerUILocationSignalMonitor_coreRoutinePredictedEntryDateFromNearbyLOIs___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  int v10;
  const __CFString *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (!v6 || v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("No predicted LOI");
      if (v7)
        v9 = v7;
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "CR: No predicted location: %@", (uint8_t *)&v10, 0xCu);
    }

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

- (double)empiricalDurationAwayFromLocations:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  unint64_t v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  NSObject *v27;
  const __CFString *v28;
  NSObject *v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  NSObject *v34;
  void *v36;
  id obj;
  uint64_t v38;
  PowerUILocationSignalMonitor *v39;
  uint64_t v40;
  double v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  double v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCE48], "currentCalendar");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "components:fromDate:", 32, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = v7;
  v8 = objc_msgSend(v7, "hour");
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v41 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  v45 = 0u;
  obj = v4;
  v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
  if (v40)
  {
    v38 = *(_QWORD *)v43;
    v39 = self;
    do
    {
      for (i = 0; i != v40; ++i)
      {
        if (*(_QWORD *)v43 != v38)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v42 + 1) + 8 * i);
        objc_msgSend(v10, "visits");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (void *)objc_msgSend(v11, "mutableCopy");

        v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C0]), "initWithKey:ascending:", CFSTR("exitDate"), 1);
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v13);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "sortUsingDescriptors:", v14);

        -[PowerUILocationSignalMonitor log](self, "log");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v10, "location");
          v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
          *(_DWORD *)buf = 138412546;
          v47 = v16;
          v48 = 2112;
          v49 = v12;
          _os_log_impl(&dword_215A71000, v15, OS_LOG_TYPE_INFO, "Sorted by exit date visits to %@: %@", buf, 0x16u);

        }
        if (objc_msgSend(v12, "count") >= 2)
        {
          v17 = 0;
          do
          {
            objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v18, "exitDate");
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v5, "components:fromDate:", 32, v19);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "hour");
            v22 = v8 - v21;
            if (v8 - v21 < 0)
              v22 = v21 - v8;
            ++v17;
            if (v22 <= 1)
            {
              objc_msgSend(v12, "objectAtIndexedSubscript:", v17);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "entryDate");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v24, "timeIntervalSinceDate:", v19);
              if (v25 > 0.0)
              {
                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)&v41, "addObject:", v26);

              }
            }

          }
          while (objc_msgSend(v12, "count") - 1 > v17);
        }
        self = v39;
        -[PowerUILocationSignalMonitor log](v39, "log");
        v27 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v47 = v41;
          _os_log_impl(&dword_215A71000, v27, OS_LOG_TYPE_INFO, "Empirical Away durations: %@", buf, 0xCu);
        }

      }
      v40 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v42, v50, 16);
    }
    while (v40);
  }

  if (objc_msgSend(*(id *)&v41, "count"))
  {
    v28 = 0;
  }
  else
  {
    -[PowerUILocationSignalMonitor log](self, "log");
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v29, OS_LOG_TYPE_DEFAULT, "Empirical Away cannot predict because there's not enough visits", buf, 2u);
    }

    v28 = CFSTR("No Duration");
  }
  objc_msgSend(*(id *)&v41, "percentile:", 0.5);
  v31 = v30;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUILocationSignalMonitor stringFromRTType:](PowerUILocationSignalMonitor, "stringFromRTType:", 0);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUILocationSignalMonitor logPredictionsWithDuration:withConfidence:withLOIString:withPredictionMethod:withSkipString:](self, "logPredictionsWithDuration:withConfidence:withLOIString:withPredictionMethod:withSkipString:", v32, &unk_24D443D20, v33, CFSTR("EmpiricalAway"), v28);

  if (v31 > 28800.0)
    v31 = 28800.0;
  if (v31 == 28800.0)
  {
    -[PowerUILocationSignalMonitor log](self, "log");
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v47 = 28800.0 / 60.0 / 60.0;
      _os_log_impl(&dword_215A71000, v34, OS_LOG_TYPE_DEFAULT, "Empirical Away predicts %f hours > 8 hours. Using 8 hour default", buf, 0xCu);
    }

  }
  return v31;
}

- (id)empiricalPredictedDateAwayFromNearbyLocations:(id)a3
{
  double v4;
  double v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  -[PowerUILocationSignalMonitor empiricalDurationAwayFromLocations:](self, "empiricalDurationAwayFromLocations:", a3);
  if (v4 <= 0.0)
  {
    -[PowerUILocationSignalMonitor log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_215A71000, v7, OS_LOG_TYPE_DEFAULT, "Empirical Away cannot predict because duration = 0", (uint8_t *)&v10, 2u);
    }
    v6 = 0;
  }
  else
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUILocationSignalMonitor log](self, "log");
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v8;
      _os_log_impl(&dword_215A71000, v7, OS_LOG_TYPE_DEFAULT, "Empirical Away Prediction %@ from empirical duration %@", (uint8_t *)&v10, 0x16u);

    }
  }

  return v6;
}

- (double)empiricalDurationAtRemoteLocation:(int64_t)a3 withPotentialLOIs:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  unint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  double v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  NSObject *v32;
  double v33;
  unint64_t v34;
  void *v35;
  NSObject *v36;
  const __CFString *v37;
  NSObject *v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  NSObject *v43;
  uint64_t v46;
  id v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t v60[4];
  uint64_t v61;
  uint8_t v62[128];
  uint8_t buf[4];
  double v64;
  __int16 v65;
  void *v66;
  __int16 v67;
  void *v68;
  _BYTE v69[128];
  uint64_t v70;

  v70 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
  v8 = 0x24BDD1000uLL;
  if (v7)
  {
    v9 = v7;
    v10 = *(_QWORD *)v57;
    v46 = *(_QWORD *)v57;
    v47 = v6;
    do
    {
      v11 = 0;
      v49 = v9;
      do
      {
        if (*(_QWORD *)v57 != v10)
          objc_enumerationMutation(v6);
        v12 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v11);
        objc_msgSend(v12, "visits");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = v13;
        if (v13 && (double)(unint64_t)objc_msgSend(v13, "count") >= 5.0)
        {
          v54 = 0u;
          v55 = 0u;
          v52 = 0u;
          v53 = 0u;
          v50 = v14;
          v15 = v14;
          v22 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
          if (v22)
          {
            v23 = v22;
            v48 = v11;
            v24 = *(_QWORD *)v53;
            do
            {
              for (i = 0; i != v23; ++i)
              {
                if (*(_QWORD *)v53 != v24)
                  objc_enumerationMutation(v15);
                v26 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * i);
                objc_msgSend(v26, "locationOfInterestConfidence");
                if (v27 >= 0.9)
                {
                  objc_msgSend(v26, "exitDate");
                  v28 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v26, "entryDate");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "timeIntervalSinceDate:", v29);
                  v31 = v30;

                  -[PowerUILocationSignalMonitor log](self, "log");
                  v32 = objc_claimAutoreleasedReturnValue();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                  {
                    +[PowerUILocationSignalMonitor stringFromRTType:](PowerUILocationSignalMonitor, "stringFromRTType:", objc_msgSend(v12, "type"));
                    v33 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
                    objc_msgSend(*(id *)(v8 + 1760), "numberWithDouble:", v31);
                    v34 = v8;
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)buf = 138412546;
                    v64 = v33;
                    v65 = 2112;
                    v66 = v35;
                    _os_log_impl(&dword_215A71000, v32, OS_LOG_TYPE_INFO, "Empirical Prediction: %@ Visit Duration : %@", buf, 0x16u);

                    v8 = v34;
                  }

                  if (v31 >= 0.0)
                  {
                    objc_msgSend(*(id *)(v8 + 1760), "numberWithDouble:", v31);
                    v36 = objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v51, "addObject:", v36);
                  }
                  else
                  {
                    -[PowerUILocationSignalMonitor log](self, "log");
                    v36 = objc_claimAutoreleasedReturnValue();
                    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
                      -[PowerUILocationSignalMonitor empiricalDurationAtRemoteLocation:withPotentialLOIs:].cold.1(v60, &v61, v36);
                  }

                }
              }
              v23 = -[NSObject countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v52, v62, 16);
            }
            while (v23);
            v10 = v46;
            v6 = v47;
            v11 = v48;
            v9 = v49;
          }
          v14 = v50;
        }
        else
        {
          -[PowerUILocationSignalMonitor log](self, "log");
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            +[PowerUILocationSignalMonitor stringFromRTType:](PowerUILocationSignalMonitor, "stringFromRTType:", objc_msgSend(v12, "type"));
            v16 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
            v17 = v10;
            v18 = v6;
            v19 = v11;
            objc_msgSend(*(id *)(v8 + 1760), "numberWithUnsignedInteger:", objc_msgSend(v14, "count"));
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(v8 + 1760), "numberWithDouble:", 5.0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412802;
            v64 = v16;
            v65 = 2112;
            v66 = v20;
            v67 = 2112;
            v68 = v21;
            _os_log_impl(&dword_215A71000, v15, OS_LOG_TYPE_INFO, "Empirical Prediction: %@ has not enough visits %@ < %@", buf, 0x20u);

            v11 = v19;
            v6 = v18;
            v10 = v17;
            v9 = v49;

          }
        }

        ++v11;
      }
      while (v11 != v9);
      v9 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v56, v69, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v51, "count"))
  {
    v37 = 0;
  }
  else
  {
    -[PowerUILocationSignalMonitor log](self, "log");
    v38 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v38, OS_LOG_TYPE_DEFAULT, "Empirical Stay cannot predict because there's not enough visits", buf, 2u);
    }

    v37 = CFSTR("No Duration");
  }
  objc_msgSend(v51, "percentile:", 0.5);
  v40 = v39;
  objc_msgSend(*(id *)(v8 + 1760), "numberWithDouble:");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  +[PowerUILocationSignalMonitor stringFromRTType:](PowerUILocationSignalMonitor, "stringFromRTType:", a3);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  -[PowerUILocationSignalMonitor logPredictionsWithDuration:withConfidence:withLOIString:withPredictionMethod:withSkipString:](self, "logPredictionsWithDuration:withConfidence:withLOIString:withPredictionMethod:withSkipString:", v41, &unk_24D443D20, v42, CFSTR("Empirical"), v37);

  if (v40 > 28800.0)
    v40 = 28800.0;
  if (v40 == 28800.0)
  {
    -[PowerUILocationSignalMonitor log](self, "log");
    v43 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v64 = 28800.0 / 60.0 / 60.0;
      _os_log_impl(&dword_215A71000, v43, OS_LOG_TYPE_INFO, "Empirical Stay predicts %f hours > 8 hours. Using 8 hour default", buf, 0xCu);
    }

  }
  return v40;
}

- (id)empiricalPredictedDateStayingAtNearbyLOIs:(id)a3 withRemoteLocation:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  NSObject *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  int v25;
  double v26;
  double v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v34;
  uint64_t v35;
  void *v36;
  PowerUILocationSignalMonitor *v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  void *v49;
  _BYTE v50[128];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v36 = (void *)os_transaction_create();
  objc_msgSend(MEMORY[0x24BDBCE60], "now");
  v35 = objc_claimAutoreleasedReturnValue();
  -[PowerUILocationSignalMonitor LOIsWithinMeters:](self, "LOIsWithinMeters:", 100000);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");

  v9 = (void *)objc_msgSend(v8, "mutableCopy");
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = self;
  -[PowerUILocationSignalMonitor log](self, "log");
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v8;
    _os_log_impl(&dword_215A71000, v11, OS_LOG_TYPE_DEFAULT, "Empirical Stay Prediction: All LOIs within 100000 meters %@", buf, 0xCu);
  }

  v44 = 0u;
  v45 = 0u;
  v42 = 0u;
  v43 = 0u;
  v12 = v6;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v43;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v43 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v10, "addObject:", *(_QWORD *)(*((_QWORD *)&v42 + 1) + 8 * i));
      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v42, v51, 16);
    }
    while (v14);
  }
  v34 = v12;

  -[PowerUILocationSignalMonitor log](self, "log");
  v17 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v47 = v10;
    _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "Empirical Prediction: Removing nearby LOIs with identifiers %@", buf, 0xCu);
  }

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v18 = v8;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v39;
    do
    {
      for (j = 0; j != v20; ++j)
      {
        if (*(_QWORD *)v39 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
        objc_msgSend(v23, "identifier", v34);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v10, "containsObject:", v24);

        if (v25)
          objc_msgSend(v9, "removeObject:", v23);
        if (objc_msgSend(v23, "type") != a4)
          objc_msgSend(v9, "removeObject:", v23);
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v38, v50, 16);
    }
    while (v20);
  }

  -[PowerUILocationSignalMonitor empiricalDurationAtRemoteLocation:withPotentialLOIs:](v37, "empiricalDurationAtRemoteLocation:withPotentialLOIs:", a4, v9);
  if (v26 <= 0.0)
  {
    -[PowerUILocationSignalMonitor log](v37, "log");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v34;
    v28 = (void *)v35;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, v30, OS_LOG_TYPE_DEFAULT, "Empirical Stay cannot predict because duration = 0", buf, 2u);
    }
    v29 = 0;
  }
  else
  {
    v27 = v26;
    v28 = (void *)v35;
    objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeInterval:sinceDate:", v35);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[PowerUILocationSignalMonitor log](v37, "log");
    v30 = objc_claimAutoreleasedReturnValue();
    v31 = v34;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v27);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v47 = v29;
      v48 = 2112;
      v49 = v32;
      _os_log_impl(&dword_215A71000, v30, OS_LOG_TYPE_DEFAULT, "Empirical Stay Prediction %@ from empirical duration %@", buf, 0x16u);

    }
  }

  return v29;
}

- (BOOL)longChargesOccurredInLocationsNear:(id)a3 withError:(id *)a4
{
  id v6;
  NSObject *log;
  BOOL v8;
  dispatch_semaphore_t v9;
  RTRoutineManager *routine;
  uint64_t v11;
  dispatch_time_t v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  id v19;
  void *v20;
  uint64_t v21;
  int v22;
  uint64_t v23;
  uint64_t j;
  void *v25;
  void *v26;
  double v27;
  BOOL v28;
  void *v29;
  void *v30;
  _BOOL4 v31;
  NSObject *v32;
  _BOOL4 v33;
  id v34;
  void *v35;
  id v36;
  void *v37;
  id v38;
  void *v39;
  id v40;
  void *v41;
  dispatch_semaphore_t v42;
  RTRoutineManager *v43;
  void *v44;
  dispatch_time_t v45;
  NSObject *v46;
  dispatch_semaphore_t dsema;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  unsigned int v53;
  PowerUILocationSignalMonitor *v54;
  id obj;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _QWORD v64[5];
  dispatch_semaphore_t v65;
  _BYTE *v66;
  _QWORD v67[5];
  dispatch_semaphore_t v68;
  uint64_t *v69;
  uint8_t *v70;
  uint64_t v71;
  uint64_t *v72;
  uint64_t v73;
  uint64_t (*v74)(uint64_t, uint64_t);
  void (*v75)(uint64_t);
  id v76;
  uint8_t buf[8];
  uint8_t *v78;
  uint64_t v79;
  uint64_t (*v80)(uint64_t, uint64_t);
  void (*v81)(uint64_t);
  id v82;
  _BYTE v83[128];
  uint8_t v84[128];
  _BYTE v85[24];
  void *v86;
  uint64_t v87;

  v87 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v49 = v6;
  if (-[PowerUILocationSignalMonitor locationIsUncertain:](self, "locationIsUncertain:", v6))
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Location is uncertain; assuming conservatively we are not in typical location.",
        buf,
        2u);
    }
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PowerUIAgent"), 1, &unk_24D44B1D8);
    v8 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_QWORD *)buf = 0;
    v78 = buf;
    v79 = 0x3032000000;
    v80 = __Block_byref_object_copy__8;
    v81 = __Block_byref_object_dispose__8;
    v82 = 0;
    v71 = 0;
    v72 = &v71;
    v73 = 0x3032000000;
    v74 = __Block_byref_object_copy__8;
    v75 = __Block_byref_object_dispose__8;
    v76 = 0;
    v9 = dispatch_semaphore_create(0);
    routine = self->_routine;
    v11 = MEMORY[0x24BDAC760];
    v67[0] = MEMORY[0x24BDAC760];
    v67[1] = 3221225472;
    v67[2] = __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke;
    v67[3] = &unk_24D3FCE78;
    v69 = &v71;
    v67[4] = self;
    dsema = v9;
    v68 = dsema;
    v70 = buf;
    -[RTRoutineManager fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:](routine, "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:", v6, v67, 200.0);
    v12 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(dsema, v12))
    {
      if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
        -[PowerUILocationSignalMonitor longChargesOccurredInLocationsNear:withError:].cold.1();
      ADClientAddValueForScalarKey();
      objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PowerUIAgent"), 2, &unk_24D44B200);
      v8 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v54 = self;
      if (objc_msgSend(*((id *)v78 + 5), "count"))
      {
        *a4 = objc_retainAutorelease((id)v72[5]);
        objc_msgSend(MEMORY[0x24BDBCEB8], "array");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v14 = *((id *)v78 + 5);
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
        if (v15)
        {
          v16 = *(_QWORD *)v61;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v61 != v16)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v60 + 1) + 8 * i), "visits");
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObjectsFromArray:", v18);

            }
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v60, v84, 16);
          }
          while (v15);
        }

        objc_msgSend(v13, "sortUsingComparator:", &__block_literal_global_16);
        v19 = objc_alloc_init(MEMORY[0x24BDD1500]);
        objc_msgSend(v19, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm"));
        +[PowerUISmartChargeUtilities lastPluggedInDate](PowerUISmartChargeUtilities, "lastPluggedInDate");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        obj = v13;
        v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v83, 16);
        v52 = v19;
        if (v21)
        {
          v53 = 0;
          v22 = 0;
          v23 = *(_QWORD *)v57;
          do
          {
            for (j = 0; j != v21; ++j)
            {
              if (*(_QWORD *)v57 != v23)
                objc_enumerationMutation(obj);
              v25 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * j);
              objc_msgSend(v25, "entryDate");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v20, "timeIntervalSinceDate:", v26);
              v28 = v27 > 2592000.0;

              if (!v28)
              {
                objc_msgSend(v25, "entryDate");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v25, "exitDate");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                v31 = +[PowerUISmartChargeUtilities doesTimeOfDayForDate:fallBetweenDate:andDate:](PowerUISmartChargeUtilities, "doesTimeOfDayForDate:fallBetweenDate:andDate:", v20, v29, v30);

                ++v22;
                v32 = v54->_log;
                v33 = os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG);
                if (v31)
                {
                  if (v33)
                  {
                    objc_msgSend(v25, "entryDate");
                    v50 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "stringFromDate:", v50);
                    v34 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "exitDate");
                    v35 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "stringFromDate:", v35);
                    v36 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "stringFromDate:", v20);
                    v37 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v85 = 138412802;
                    *(_QWORD *)&v85[4] = v34;
                    *(_WORD *)&v85[12] = 2112;
                    *(_QWORD *)&v85[14] = v36;
                    *(_WORD *)&v85[22] = 2112;
                    v86 = v37;
                    _os_log_debug_impl(&dword_215A71000, v32, OS_LOG_TYPE_DEBUG, "Match! visit start: %@  ---  visit end: %@  ---  plugin date: %@", v85, 0x20u);

                  }
                  ++v53;
                }
                else
                {
                  if (v33)
                  {
                    objc_msgSend(v25, "entryDate");
                    v51 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "stringFromDate:", v51);
                    v38 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v25, "exitDate");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "stringFromDate:", v39);
                    v40 = (id)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v52, "stringFromDate:", v20);
                    v41 = (void *)objc_claimAutoreleasedReturnValue();
                    *(_DWORD *)v85 = 138412802;
                    *(_QWORD *)&v85[4] = v38;
                    *(_WORD *)&v85[12] = 2112;
                    *(_QWORD *)&v85[14] = v40;
                    *(_WORD *)&v85[22] = 2112;
                    v86 = v41;
                    _os_log_debug_impl(&dword_215A71000, v32, OS_LOG_TYPE_DEBUG, "NO Match! visit start: %@  ---  visit end: %@  ---  plugin date: %@", v85, 0x20u);

                  }
                }
              }
            }
            v21 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v83, 16);
          }
          while (v21);
        }
        else
        {
          v53 = 0;
          v22 = 0;
        }

        v46 = v54->_log;
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v85 = 67109376;
          *(_DWORD *)&v85[4] = v53;
          *(_WORD *)&v85[8] = 1024;
          *(_DWORD *)&v85[10] = v22;
          _os_log_impl(&dword_215A71000, v46, OS_LOG_TYPE_DEFAULT, "%u out of %u LoI visits match current time", v85, 0xEu);
        }
        v8 = v53 > 4;

      }
      else
      {
        *(_QWORD *)v85 = 0;
        *(_QWORD *)&v85[8] = v85;
        *(_QWORD *)&v85[16] = 0x2020000000;
        LOBYTE(v86) = 0;
        v42 = dispatch_semaphore_create(0);

        v43 = self->_routine;
        objc_msgSend(MEMORY[0x24BDBCE60], "dateWithTimeIntervalSinceNow:", -259200.0);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v64[0] = v11;
        v64[1] = 3221225472;
        v64[2] = __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke_112;
        v64[3] = &unk_24D3FCEA0;
        v64[4] = self;
        v66 = v85;
        dsema = v42;
        v65 = dsema;
        -[RTRoutineManager fetchLocationsOfInterestVisitedSinceDate:withHandler:](v43, "fetchLocationsOfInterestVisitedSinceDate:withHandler:", v44, v64);

        v45 = dispatch_time(0, 30000000000);
        if (dispatch_semaphore_wait(dsema, v45))
        {
          if (os_log_type_enabled((os_log_t)self->_log, OS_LOG_TYPE_ERROR))
            -[PowerUILocationSignalMonitor longChargesOccurredInLocationsNear:withError:].cold.1();
          ADClientAddValueForScalarKey();
          objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("com.apple.PowerUIAgent"), 2, &unk_24D44B228);
          v8 = 0;
          *a4 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v8 = *(_BYTE *)(*(_QWORD *)&v85[8] + 24) == 0;
        }

        _Block_object_dispose(v85, 8);
      }
    }

    _Block_object_dispose(&v71, 8);
    _Block_object_dispose(buf, 8);

  }
  return v8;
}

void __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  __CFString *v7;
  NSObject *v8;
  const __CFString *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  __CFString *v13;
  int v14;
  const __CFString *v15;
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v6 = a2;
  v7 = a3;
  objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a3);
  if (v7 || !objc_msgSend(v6, "count"))
  {
    v8 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v9 = CFSTR("No nearby LOI");
      if (v7)
        v9 = v7;
      v14 = 138412290;
      v15 = v9;
      _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "No LOIs nearby: %@", (uint8_t *)&v14, 0xCu);
    }
    ADClientSetValueForScalarKey();
  }
  else
  {
    v10 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)MEMORY[0x24BDD16E0];
      v12 = v10;
      objc_msgSend(v11, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
      v14 = 138412290;
      v15 = v13;
      _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "%@ nearby LOIs", (uint8_t *)&v14, 0xCu);

    }
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

void __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke_112(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  NSObject *v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = v5;
  if (a3)
  {
    ADClientSetValueForScalarKey();
  }
  else
  {
    v7 = objc_msgSend(v5, "count");
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 96);
    if (v7)
    {
      if (os_log_type_enabled(*(os_log_t *)(v8 + 96), OS_LOG_TYPE_DEFAULT))
      {
        v10 = v9;
        v11 = 134217984;
        v12 = objc_msgSend(v6, "count");
        _os_log_impl(&dword_215A71000, v10, OS_LOG_TYPE_DEFAULT, "No LoIs, but did see visits in the past. (%lu)", (uint8_t *)&v11, 0xCu);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
    }
    else
    {
      if (os_log_type_enabled(*(os_log_t *)(v8 + 96), OS_LOG_TYPE_FAULT))
        __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke_112_cold_1();
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
    }
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

uint64_t __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke_116(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "entryDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "entryDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (BOOL)inTypicalChargingLocationWithError:(id *)a3
{
  uint64_t v5;
  NSObject *queue;
  NSObject *log;
  uint64_t v8;
  void *v9;
  _BOOL4 v10;
  void *v11;
  _BOOL4 v12;
  NSObject *v13;
  dispatch_time_t v14;
  NSObject *v15;
  NSObject *v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  const __CFString *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  BOOL v25;
  NSObject *v26;
  _QWORD v28[5];
  _QWORD block[5];
  uint8_t buf[4];
  const __CFString *v31;
  __int16 v32;
  const __CFString *v33;
  uint64_t v34;

  v34 = *MEMORY[0x24BDAC8D0];
  v5 = MEMORY[0x24BDAC760];
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __67__PowerUILocationSignalMonitor_inTypicalChargingLocationWithError___block_invoke;
  block[3] = &unk_24D3FB7B0;
  block[4] = self;
  dispatch_sync(queue, block);
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
    -[PowerUILocationSignalMonitor inTypicalChargingLocationWithError:].cold.1((uint64_t)self, log, v8);
  -[PowerUILocationSignalMonitor currentLocation](self, "currentLocation");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PowerUILocationSignalMonitor locationIsUncertain:](self, "locationIsUncertain:", v9);

  if (v10)
    -[CLLocationManager startUpdatingLocation](self->_locationManager, "startUpdatingLocation");
  -[PowerUILocationSignalMonitor currentLocation](self, "currentLocation");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PowerUILocationSignalMonitor locationIsUncertain:](self, "locationIsUncertain:", v11);

  if (v12)
  {
    -[PowerUILocationSignalMonitor requestLocationSemaphore](self, "requestLocationSemaphore");
    v13 = objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = dispatch_time(0, 30000000000);
      dispatch_semaphore_wait(v13, v14);
    }
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");

  }
  v15 = self->_log;
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = v15;
    -[PowerUILocationSignalMonitor currentLocation](self, "currentLocation");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
      v18 = CFSTR("Have Location");
    else
      v18 = 0;
    -[CLLocationManager location](self->_locationManager, "location");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
      v20 = CFSTR("Have Location");
    else
      v20 = 0;
    *(_DWORD *)buf = 138412546;
    v31 = v18;
    v32 = 2112;
    v33 = v20;
    _os_log_impl(&dword_215A71000, v16, OS_LOG_TYPE_DEFAULT, "Current location %@, Location manager location: %@", buf, 0x16u);

  }
  -[PowerUILocationSignalMonitor currentLocation](self, "currentLocation");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v21;
  if (v21)
  {
    v23 = v21;
  }
  else
  {
    -[CLLocationManager location](self->_locationManager, "location");
    v23 = (id)objc_claimAutoreleasedReturnValue();
  }
  v24 = v23;

  v25 = -[PowerUILocationSignalMonitor longChargesOccurredInLocationsNear:withError:](self, "longChargesOccurredInLocationsNear:withError:", v24, a3);
  v26 = self->_queue;
  v28[0] = v5;
  v28[1] = 3221225472;
  v28[2] = __67__PowerUILocationSignalMonitor_inTypicalChargingLocationWithError___block_invoke_124;
  v28[3] = &unk_24D3FB7B0;
  v28[4] = self;
  dispatch_sync(v26, v28);

  return v25;
}

void __67__PowerUILocationSignalMonitor_inTypicalChargingLocationWithError___block_invoke(uint64_t a1)
{
  void *v2;
  dispatch_semaphore_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "location");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentLocation:", v2);

  v3 = dispatch_semaphore_create(0);
  objc_msgSend(*(id *)(a1 + 32), "setRequestLocationSemaphore:", v3);

}

uint64_t __67__PowerUILocationSignalMonitor_inTypicalChargingLocationWithError___block_invoke_124(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setCurrentLocation:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setRequestLocationSemaphore:", 0);
}

- (BOOL)isInSameTimeZone
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  OS_os_log *v10;
  uint64_t v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *log;
  int v23;
  int v24;
  BOOL v25;
  NSObject *v26;
  _QWORD v28[9];
  _QWORD v29[5];
  _QWORD v30[6];
  _QWORD v31[3];
  int v32;
  _QWORD v33[5];
  id v34;
  uint64_t v35;
  _QWORD v36[2];
  int v37;
  uint64_t v38;
  _QWORD v39[2];
  int v40;
  _QWORD v41[5];
  _QWORD v42[5];
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  _BYTE v49[16];
  uint64_t v50;

  v50 = *MEMORY[0x24BDAC8D0];
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__8;
  v47 = __Block_byref_object_dispose__8;
  v48 = 0;
  BiomeLibrary();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "Device");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "TimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "publisher");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "last");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = MEMORY[0x24BDAC760];
  v42[0] = MEMORY[0x24BDAC760];
  v42[1] = 3221225472;
  v42[2] = __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke;
  v42[3] = &unk_24D3FB6F8;
  v42[4] = self;
  v41[0] = MEMORY[0x24BDAC760];
  v41[1] = 3221225472;
  v41[2] = __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_126;
  v41[3] = &unk_24D3FCF08;
  v41[4] = &v43;
  v9 = (id)objc_msgSend(v7, "sinkWithCompletion:receiveInput:", v42, v41);

  if (v44[5])
  {
    v10 = self->_log;
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEBUG))
    {
      objc_msgSend((id)v44[5], "secondsFromGMT");
      -[PowerUILocationSignalMonitor isInSameTimeZone].cold.3((uint64_t)v49, v10, v11, v12);
    }

    v38 = 0;
    v39[0] = &v38;
    v39[1] = 0x2020000000;
    v40 = 0;
    v35 = 0;
    v36[0] = &v35;
    v36[1] = 0x2020000000;
    v37 = 0;
    v33[0] = 0;
    v33[1] = v33;
    v33[2] = 0x3032000000;
    v33[3] = __Block_byref_object_copy__8;
    v33[4] = __Block_byref_object_dispose__8;
    v34 = 0;
    BiomeLibrary();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "Device");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "Power");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "PluggedIn");
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v31[0] = 0;
    v31[1] = v31;
    v31[2] = 0x2020000000;
    v32 = -1;
    objc_msgSend(v5, "publisher");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "publisher");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "orderedMergeWithOther:comparator:", v18, &__block_literal_global_130);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v8;
    v30[1] = 3221225472;
    v30[2] = __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_2;
    v30[3] = &unk_24D3FCF50;
    v30[4] = v33;
    v30[5] = v31;
    objc_msgSend(v19, "filterWithIsIncluded:", v30);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v8;
    v29[1] = 3221225472;
    v29[2] = __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_3;
    v29[3] = &unk_24D3FB6F8;
    v29[4] = self;
    v28[0] = v8;
    v28[1] = 3221225472;
    v28[2] = __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_134;
    v28[3] = &unk_24D3FCF78;
    v28[4] = self;
    v28[5] = v33;
    v28[6] = &v43;
    v28[7] = &v38;
    v28[8] = &v35;
    v21 = (id)objc_msgSend(v20, "sinkWithCompletion:receiveInput:", v29, v28);

    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      -[PowerUILocationSignalMonitor isInSameTimeZone].cold.2((uint64_t)v36, (uint64_t)v39, log);
    v23 = *(_DWORD *)(v36[0] + 24);
    if (v23)
    {
      v24 = *(_DWORD *)(v39[0] + 24);
      v25 = v24 >= 11 && v24 / v23 > 3;
    }
    else
    {
      v25 = 1;
    }
    _Block_object_dispose(v31, 8);

    _Block_object_dispose(v33, 8);
    _Block_object_dispose(&v35, 8);
    _Block_object_dispose(&v38, 8);
  }
  else
  {
    -[PowerUILocationSignalMonitor log](self, "log");
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
      -[PowerUILocationSignalMonitor isInSameTimeZone].cold.1();

    v25 = 0;
  }

  _Block_object_dispose(&v43, 8);
  return v25;
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_cold_1(v3);

  }
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_126(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(a2, "eventBody");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

uint64_t __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_128(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "timestamp");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "timestamp");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

uint64_t __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_2(uint64_t a1, void *a2)
{
  id v4;
  void *v5;
  char isKindOfClass;
  id *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  int v14;
  uint64_t v15;

  v4 = a2;
  objc_msgSend(v4, "eventBody");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  v7 = (id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if ((isKindOfClass & 1) != 0)
  {
    objc_storeStrong(v7, a2);
LABEL_11:
    v15 = 0;
    goto LABEL_12;
  }
  if (!*v7)
    goto LABEL_11;
  objc_msgSend(v4, "eventBody");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_11;
  }
  objc_msgSend(v4, "eventBody");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hasStarting");

  if (!v10)
    goto LABEL_11;
  objc_msgSend(v4, "eventBody");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "starting");

  v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v14 = *(_DWORD *)(v13 + 24);
  if (v14 != -1 && v14 == v12)
    goto LABEL_11;
  *(_DWORD *)(v13 + 24) = v12;
  if ((v12 & 1) == 0)
    goto LABEL_11;
  v15 = 1;
LABEL_12:

  return v15;
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_3_cold_1(v3);

  }
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_134(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;

  v3 = a2;
  objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "eventBody");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(NSObject **)(a1[4] + 96);
  if (v5)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
      __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_134_cold_2((uint64_t)(a1 + 5), v6, v3);
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "timeZone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[5] + 8) + 40), "eventBody");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "timeZone");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7 == v9)
      v10 = a1[7];
    else
      v10 = a1[8];
    ++*(_DWORD *)(*(_QWORD *)(v10 + 8) + 24);
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_134_cold_1();
  }

}

- (int64_t)inKnownMicrolocation
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  int v11;
  NSObject *log;
  _BOOL4 v13;
  int64_t v14;
  NSObject *v15;
  uint8_t v17[8];
  _QWORD v18[8];
  _QWORD v19[5];
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  char v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  +[PowerUISmartChargeUtilities lastPluggedInDate](PowerUISmartChargeUtilities, "lastPluggedInDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "timeIntervalSinceReferenceDate");
  v5 = v4;

  v24 = 0;
  v25 = &v24;
  v26 = 0x2020000000;
  v27 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x2020000000;
  v23 = 0;
  BiomeLibrary();
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "Location");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "MicroLocationVisit");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "publisher");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __52__PowerUILocationSignalMonitor_inKnownMicrolocation__block_invoke;
  v19[3] = &unk_24D3FB6F8;
  v19[4] = self;
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __52__PowerUILocationSignalMonitor_inKnownMicrolocation__block_invoke_135;
  v18[3] = &unk_24D3FCFA0;
  v18[7] = v5;
  v18[4] = self;
  v18[5] = &v24;
  v18[6] = &v20;
  v10 = (id)objc_msgSend(v9, "sinkWithCompletion:receiveInput:", v19, v18);

  if (*((_BYTE *)v25 + 24))
  {
    v11 = *((unsigned __int8 *)v21 + 24);
    log = self->_log;
    v13 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v11)
    {
      if (v13)
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Microlocation event near pluggedIn time", v17, 2u);
      }
      v14 = 1;
    }
    else
    {
      if (v13)
      {
        *(_WORD *)v17 = 0;
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "No matching microlocation found", v17, 2u);
      }
      v14 = 0;
    }
  }
  else
  {
    v15 = self->_log;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v17 = 0;
      _os_log_impl(&dword_215A71000, v15, OS_LOG_TYPE_DEFAULT, "No microlocations found. Falling back to TimeZone check", v17, 2u);
    }
    v14 = -1;
  }

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v24, 8);
  return v14;
}

void __52__PowerUILocationSignalMonitor_inKnownMicrolocation__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  if (objc_msgSend(v3, "state"))
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __52__PowerUILocationSignalMonitor_inKnownMicrolocation__block_invoke_cold_1(v3);

  }
}

void __52__PowerUILocationSignalMonitor_inKnownMicrolocation__block_invoke_135(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  NSObject *v7;
  NSObject *v9;
  void *v10;
  double v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  int v16;
  id v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  double v21;
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  v4 = *(double *)(a1 + 56);
  objc_msgSend(v3, "timestamp");
  v6 = v4 - v5;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v10 = (void *)MEMORY[0x24BDBCE60];
    v11 = *(double *)(a1 + 56);
    v12 = v7;
    objc_msgSend(v10, "dateWithTimeIntervalSinceReferenceDate:", v11);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)MEMORY[0x24BDBCE60];
    objc_msgSend(v3, "timestamp");
    objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 138412802;
    v17 = v13;
    v18 = 2112;
    v19 = v15;
    v20 = 2048;
    v21 = v6;
    _os_log_debug_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEBUG, "working on event - plugin: %@ - event timestamp: %@ - diff: %f", (uint8_t *)&v16, 0x20u);

  }
  if (v6 > -60.0 && v6 < 60.0)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v16 = 138412290;
      v17 = v3;
      _os_log_impl(&dword_215A71000, v9, OS_LOG_TYPE_DEFAULT, "Microlocation event near pluggedIn time %@", (uint8_t *)&v16, 0xCu);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
  }

}

- (BOOL)notAuthorizedForLocation
{
  int authorizationStatus;
  BOOL v3;

  authorizationStatus = self->_authorizationStatus;
  if (authorizationStatus)
    v3 = authorizationStatus == 3;
  else
    v3 = 1;
  return !v3;
}

- (id)likelyToBeInKnownArea
{
  void *v3;
  int64_t v4;
  int64_t v5;
  NSObject *log;
  _BOOL4 v7;
  const char *v8;
  uint8_t *v9;
  _BOOL4 v10;
  _BOOL4 v11;
  uint64_t v12;
  const char *v13;
  uint8_t *v14;
  uint64_t v16;
  __int16 v17;
  uint8_t v18[2];
  uint8_t buf[2];

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PowerUILocationSignalMonitor inKnownMicrolocation](self, "inKnownMicrolocation");
  if (v4 != -1)
  {
    v5 = v4;
    objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("Microlocation"), CFSTR("reason"));
    log = self->_log;
    v7 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
    if (v5)
    {
      if (v7)
      {
        v17 = 0;
        v8 = "In a known micro-location; Not opting out of the feature";
        v9 = (uint8_t *)&v17;
LABEL_8:
        _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
        goto LABEL_9;
      }
      goto LABEL_9;
    }
    if (v7)
    {
      LOWORD(v16) = 0;
      v13 = "Not In a known micro-location; Opting out of the feature";
      v14 = (uint8_t *)&v16;
LABEL_14:
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, v13, v14, 2u);
      goto LABEL_15;
    }
    goto LABEL_15;
  }
  objc_msgSend(v3, "setObject:forKeyedSubscript:", CFSTR("TimeZone"), CFSTR("reason"));
  v10 = -[PowerUILocationSignalMonitor isInSameTimeZone](self, "isInSameTimeZone");
  log = self->_log;
  v11 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if (!v10)
  {
    if (v11)
    {
      *(_WORD *)v18 = 0;
      v13 = "Device has been through multiple timezones; Opting out of feature";
      v14 = v18;
      goto LABEL_14;
    }
LABEL_15:
    v12 = MEMORY[0x24BDBD1C0];
    goto LABEL_16;
  }
  if (v11)
  {
    *(_WORD *)buf = 0;
    v8 = "Device has has been in consistent timezones; Not opting out of feature";
    v9 = buf;
    goto LABEL_8;
  }
LABEL_9:
  v12 = MEMORY[0x24BDBD1C8];
LABEL_16:
  objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, CFSTR("value"), v16);
  return v3;
}

- (id)requiredFullChargeDate
{
  void *v3;
  void *v4;
  int v5;
  NSObject *log;
  id v7;
  NSObject *fullChargeDateQueue;
  _QWORD v10[6];
  uint8_t buf[8];
  uint8_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = (void *)os_transaction_create();
  +[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("locIgnored"), CFSTR("com.apple.smartcharging.topoffprotection"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "BOOLValue");

  if (v5)
  {
    log = self->_log;
    if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Location Ignored; Returning distant future", buf, 2u);
    }
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
    v7 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    *(_QWORD *)buf = 0;
    v12 = buf;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy__8;
    v15 = __Block_byref_object_dispose__8;
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
    v16 = (id)objc_claimAutoreleasedReturnValue();
    fullChargeDateQueue = self->_fullChargeDateQueue;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __54__PowerUILocationSignalMonitor_requiredFullChargeDate__block_invoke;
    v10[3] = &unk_24D3FC660;
    v10[4] = self;
    v10[5] = buf;
    dispatch_sync(fullChargeDateQueue, v10);
    v7 = *((id *)v12 + 5);
    _Block_object_dispose(buf, 8);

  }
  return v7;
}

void __54__PowerUILocationSignalMonitor_requiredFullChargeDate__block_invoke(uint64_t a1)
{
  int v2;
  uint64_t v3;
  NSObject *v4;
  const __CFString *v5;
  NSObject *v6;
  dispatch_time_t v7;
  void *v8;
  int v9;
  id v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __CFString *v16;
  NSObject *v17;
  void *v18;
  int v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  double v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint8_t buf[8];
  _QWORD v35[2];
  _QWORD v36[3];

  v36[2] = *MEMORY[0x24BDAC8D0];
  v2 = objc_msgSend(*(id *)(a1 + 32), "notAuthorizedForLocation");
  v3 = *(_QWORD *)(a1 + 32);
  if (!v2)
  {
    v6 = *(NSObject **)(v3 + 64);
    v7 = dispatch_time(0, 5000000000);
    dispatch_semaphore_wait(v6, v7);
    v8 = *(void **)(a1 + 32);
    v33 = 0;
    v9 = objc_msgSend(v8, "inTypicalChargingLocationWithError:", &v33);
    v10 = v33;
    v11 = v10;
    if (v9)
    {
      v12 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v12, OS_LOG_TYPE_DEFAULT, "In typical charging location; No need to advance full charge deadline",
          buf,
          2u);
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
    else
    {
      if (v10)
      {
        v17 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_215A71000, v17, OS_LOG_TYPE_DEFAULT, "Error while determining LoI; Fallback to Microlocation or TimeZone",
            buf,
            2u);
        }

        v5 = CFSTR("LoIError");
        goto LABEL_14;
      }
      objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v31 = *(void **)(v30 + 40);
      *(_QWORD *)(v30 + 40) = v29;

      v32 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 96);
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_215A71000, v32, OS_LOG_TYPE_DEFAULT, "Not in typical charging location; Opting out of feature",
          buf,
          2u);
      }
    }
    v16 = CFSTR("LocationOfInterest");
    goto LABEL_18;
  }
  v4 = *(NSObject **)(v3 + 96);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_215A71000, v4, OS_LOG_TYPE_DEFAULT, "Not authorized for location; Fallback to Microlocation or TimeZone",
      buf,
      2u);
  }
  v5 = CFSTR("NotAuthorized");
LABEL_14:
  objc_msgSend(*(id *)(a1 + 32), "likelyToBeInKnownArea");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("value"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "BOOLValue");

  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("reason"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@-%@"), v5, v20);
  v16 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (v19)
    objc_msgSend(MEMORY[0x24BDBCE60], "distantFuture");
  else
    objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

LABEL_18:
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "timeIntervalSinceNow");
  v35[0] = CFSTR("Reason");
  v35[1] = CFSTR("locationMonitorDecision");
  v36[0] = v16;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v24 > 0.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v25;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
  v26 = objc_claimAutoreleasedReturnValue();
  v27 = *(_QWORD *)(a1 + 32);
  v28 = *(void **)(v27 + 16);
  *(_QWORD *)(v27 + 16) = v26;

}

- (id)lastAcquiredLocation
{
  return -[CLLocationManager location](self->_locationManager, "location");
}

- (id)LOIsWithinMeters:(int)a3
{
  void *v5;
  dispatch_semaphore_t v6;
  RTRoutineManager *routine;
  double v8;
  NSObject *v9;
  dispatch_time_t v10;
  NSObject *v11;
  id v12;
  _QWORD v14[5];
  NSObject *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  -[PowerUILocationSignalMonitor lastAcquiredLocation](self, "lastAcquiredLocation");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__8;
  v21 = __Block_byref_object_dispose__8;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v22 = (id)objc_claimAutoreleasedReturnValue();
  v6 = dispatch_semaphore_create(0);
  routine = self->_routine;
  v8 = (double)a3;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __49__PowerUILocationSignalMonitor_LOIsWithinMeters___block_invoke;
  v14[3] = &unk_24D3FCEA0;
  v14[4] = self;
  v16 = &v17;
  v9 = v6;
  v15 = v9;
  -[RTRoutineManager fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:](routine, "fetchLocationsOfInterestWithinDistance:ofLocation:withHandler:", v5, v14, v8);
  v10 = dispatch_time(0, 30000000000);
  if (dispatch_semaphore_wait(v9, v10))
  {
    -[PowerUILocationSignalMonitor log](self, "log");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[PowerUILocationSignalMonitor LOIsWithinMeters:].cold.1();

    v12 = 0;
  }
  else
  {
    v12 = (id)v18[5];
  }

  _Block_object_dispose(&v17, 8);
  return v12;
}

void __49__PowerUILocationSignalMonitor_LOIsWithinMeters___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v6;
  id v7;
  NSObject *v8;

  v6 = a2;
  v7 = a3;
  if (v7)
  {
    objc_msgSend(*(id *)(a1 + 32), "log");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __49__PowerUILocationSignalMonitor_LOIsWithinMeters___block_invoke_cold_1();

  }
  else
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));

}

+ (id)stringFromRTType:(int64_t)a3
{
  if ((unint64_t)(a3 + 1) > 4)
    return CFSTR("Error");
  else
    return off_24D3FCFC0[a3 + 1];
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  uint64_t v4;
  NSObject *log;
  _BOOL4 v6;
  void *v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = objc_msgSend(a3, "authorizationStatus");
  ADClientSetValueForScalarKey();
  log = self->_log;
  v6 = os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT);
  if ((_DWORD)v4 == 3)
  {
    if (v6)
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Authorized for Protective Top-Off", (uint8_t *)&v10, 2u);
    }
  }
  else if (v6)
  {
    v7 = (void *)MEMORY[0x24BDD16E0];
    v8 = log;
    objc_msgSend(v7, "numberWithInt:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138412290;
    v11 = v9;
    _os_log_impl(&dword_215A71000, v8, OS_LOG_TYPE_DEFAULT, "Authorization status: %@", (uint8_t *)&v10, 0xCu);

  }
  self->_authorizationStatus = v4;
  dispatch_semaphore_signal((dispatch_semaphore_t)self->_authorizationSemaphore);
}

- (void)locationManager:(id)a3 didUpdateLocations:(id)a4
{
  void *v5;
  BOOL v6;
  NSObject *queue;
  id v8;
  _QWORD block[5];
  id v10;

  v8 = a4;
  objc_msgSend(v8, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PowerUILocationSignalMonitor locationIsUncertain:](self, "locationIsUncertain:", v5);

  if (!v6)
  {
    -[CLLocationManager stopUpdatingLocation](self->_locationManager, "stopUpdatingLocation");
    queue = self->_queue;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __67__PowerUILocationSignalMonitor_locationManager_didUpdateLocations___block_invoke;
    block[3] = &unk_24D3FC690;
    block[4] = self;
    v10 = v8;
    dispatch_sync(queue, block);

  }
}

void __67__PowerUILocationSignalMonitor_locationManager_didUpdateLocations___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;

  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setCurrentLocation:", v2);

  objc_msgSend(*(id *)(a1 + 32), "requestLocationSemaphore");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "requestLocationSemaphore");
    v4 = objc_claimAutoreleasedReturnValue();
    dispatch_semaphore_signal(v4);

  }
}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  NSObject *log;
  int v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v5 = a4;
  log = self->_log;
  if (os_log_type_enabled(log, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_215A71000, log, OS_LOG_TYPE_DEFAULT, "Location Manager failed with error: %@", (uint8_t *)&v7, 0xCu);
  }

}

- (NSDictionary)analyticsData
{
  return self->_analyticsData;
}

- (void)setAnalyticsData:(id)a3
{
  objc_storeStrong((id *)&self->_analyticsData, a3);
}

- (PowerUISignalMonitorDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  objc_storeStrong((id *)&self->_delegate, a3);
}

- (RTRoutineManager)routine
{
  return self->_routine;
}

- (void)setRoutine:(id)a3
{
  objc_storeStrong((id *)&self->_routine, a3);
}

- (CLLocationManager)locationManager
{
  return self->_locationManager;
}

- (void)setLocationManager:(id)a3
{
  objc_storeStrong((id *)&self->_locationManager, a3);
}

- (int)authorizationStatus
{
  return self->_authorizationStatus;
}

- (void)setAuthorizationStatus:(int)a3
{
  self->_authorizationStatus = a3;
}

- (CLLocation)currentLocation
{
  return (CLLocation *)objc_getProperty(self, a2, 48, 1);
}

- (void)setCurrentLocation:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (OS_dispatch_semaphore)requestLocationSemaphore
{
  return (OS_dispatch_semaphore *)objc_getProperty(self, a2, 56, 1);
}

- (void)setRequestLocationSemaphore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (OS_dispatch_semaphore)authorizationSemaphore
{
  return self->_authorizationSemaphore;
}

- (void)setAuthorizationSemaphore:(id)a3
{
  objc_storeStrong((id *)&self->_authorizationSemaphore, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (OS_dispatch_queue)callbackQueue
{
  return self->_callbackQueue;
}

- (void)setCallbackQueue:(id)a3
{
  objc_storeStrong((id *)&self->_callbackQueue, a3);
}

- (OS_dispatch_queue)fullChargeDateQueue
{
  return self->_fullChargeDateQueue;
}

- (void)setFullChargeDateQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fullChargeDateQueue, a3);
}

- (OS_os_log)log
{
  return self->_log;
}

- (void)setLog:(id)a3
{
  objc_storeStrong((id *)&self->_log, a3);
}

- (_CDLocalContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
  objc_storeStrong((id *)&self->_context, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_fullChargeDateQueue, 0);
  objc_storeStrong((id *)&self->_callbackQueue, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_authorizationSemaphore, 0);
  objc_storeStrong((id *)&self->_requestLocationSemaphore, 0);
  objc_storeStrong((id *)&self->_currentLocation, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_routine, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_analyticsData, 0);
}

- (void)coreRoutinePredictedEntryDateFromNearbyLOIs:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "CR Error: Timeout occurred to obtain predicted LOIs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

- (void)empiricalDurationAtRemoteLocation:(NSObject *)a3 withPotentialLOIs:.cold.1(uint8_t *a1, _QWORD *a2, NSObject *a3)
{
  void *v6;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)a1 = 138412290;
  *a2 = v6;
  _os_log_error_impl(&dword_215A71000, a3, OS_LOG_TYPE_ERROR, "Empirical Prediction: Ignoring negative duration %@", a1, 0xCu);

}

- (void)longChargesOccurredInLocationsNear:withError:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Error: Timeout occurred to obtain LsOI", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void __77__PowerUILocationSignalMonitor_longChargesOccurredInLocationsNear_withError___block_invoke_112_cold_1()
{
  os_log_t v0;
  uint8_t v1[16];

  OUTLINED_FUNCTION_2_0();
  _os_log_fault_impl(&dword_215A71000, v0, OS_LOG_TYPE_FAULT, "No LoI visits in three days", v1, 2u);
  OUTLINED_FUNCTION_6_0();
}

- (void)inTypicalChargingLocationWithError:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  if (*(_QWORD *)(a1 + 48))
    v3 = CFSTR("Have Location");
  else
    v3 = 0;
  v4 = 138412290;
  v5 = v3;
  OUTLINED_FUNCTION_5_2(&dword_215A71000, a2, a3, "Current location: %@", (uint8_t *)&v4);
  OUTLINED_FUNCTION_2();
}

- (void)isInSameTimeZone
{
  *(_DWORD *)a1 = 134217984;
  *(double *)(a1 + 4) = a4;
  OUTLINED_FUNCTION_5_2(&dword_215A71000, a2, a3, "current time zone offset: %f", (uint8_t *)a1);
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_5_0(v3, v4);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v5, v6, "Error getting TimeZone biome events in signal monitor: %s", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_3_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_5_0(v3, v4);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v5, v6, "Error getting TimeZone/Plugin biome events in signal monitor: %s", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_134_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "No timezone in event!", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void __48__PowerUILocationSignalMonitor_isInSameTimeZone__block_invoke_134_cold_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = (void *)MEMORY[0x24BDBCE60];
  v5 = *(void **)(*(_QWORD *)(*(_QWORD *)a1 + 8) + 40);
  v6 = a2;
  objc_msgSend(v5, "timestamp");
  objc_msgSend(v4, "dateWithTimeIntervalSinceReferenceDate:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x24BDBCE60];
  objc_msgSend(a3, "timestamp");
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 138412546;
  v11 = v7;
  v12 = 2112;
  v13 = v9;
  _os_log_debug_impl(&dword_215A71000, v6, OS_LOG_TYPE_DEBUG, "working on event with TZ timestamp: %@ - plugin timestamp: %@", (uint8_t *)&v10, 0x16u);

}

void __52__PowerUILocationSignalMonitor_inKnownMicrolocation__block_invoke_cold_1(void *a1)
{
  void *v1;
  void *v2;
  id v3;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint8_t v11;

  objc_msgSend(a1, "error");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "description");
  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  OUTLINED_FUNCTION_5_0(v3, v4);
  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_2(&dword_215A71000, v5, v6, "Error getting KML in signalMonitor: %s", v7, v8, v9, v10, v11);

  OUTLINED_FUNCTION_0_1();
}

- (void)LOIsWithinMeters:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_5(&dword_215A71000, v0, v1, "Error: Timeout occurred getting nearby LOIs", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_6_0();
}

void __49__PowerUILocationSignalMonitor_LOIsWithinMeters___block_invoke_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_4();
  _os_log_error_impl(&dword_215A71000, v0, OS_LOG_TYPE_ERROR, "Fetch LOIs error: %@", v1, 0xCu);
  OUTLINED_FUNCTION_2();
}

@end
