@implementation CBMetricsDaemon

+ (id)sharedCBMetricsDaemon
{
  if (qword_10097BB28 != -1)
    dispatch_once(&qword_10097BB28, &stru_1009182C8);
  return (id)qword_10097BB20;
}

- (void)reportCBDiscovery:(id)a3 daemonCnx:(id)a4 action:(id)a5
{
  id v8;
  id v9;
  id v10;
  CBMetricsDiscoveryEvent *v11;
  void *v12;
  id v13;
  unint64_t discoveryEventsDroppedTotal;
  void *v15;
  NSMutableArray *discoveryEventsArray;
  NSMutableArray *v17;
  NSMutableArray *v18;
  void *v19;
  NSObject *dispatchQueue;
  _QWORD block[5];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc_init(CBMetricsDiscoveryEvent);
  -[CBMetricsDiscoveryEvent setAction:](v11, "setAction:", v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appID"));
  -[CBMetricsDiscoveryEvent setAppID:](v11, "setAppID:", v12);

  -[CBMetricsDiscoveryEvent setClientID:](v11, "setClientID:", objc_msgSend(v8, "clientID"));
  -[CBMetricsDiscoveryEvent setDiscoveryFlags:](v11, "setDiscoveryFlags:", objc_msgSend(v8, "discoveryFlags"));
  -[CBMetricsDiscoveryEvent setPid:](v11, "setPid:", objc_msgSend(v9, "pid"));
  -[CBMetricsDiscoveryEvent setScanRate:](v11, "setScanRate:", objc_msgSend(v8, "bleScanRate"));
  -[CBMetricsDiscoveryEvent setTimestamp:](v11, "setTimestamp:", CFAbsoluteTimeGetCurrent());
  os_unfair_lock_lock(&self->_lock);
  ++self->_discoveryEventsTotal;
  v13 = -[NSMutableArray count](self->_discoveryEventsArray, "count");
  discoveryEventsDroppedTotal = self->_discoveryEventsDroppedTotal;
  if ((unint64_t)v13 < 0x96)
  {
    discoveryEventsArray = self->_discoveryEventsArray;
    if (!discoveryEventsArray)
    {
      v17 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      v18 = self->_discoveryEventsArray;
      self->_discoveryEventsArray = v17;

      discoveryEventsArray = self->_discoveryEventsArray;
    }
    -[NSMutableArray addObject:](discoveryEventsArray, "addObject:", v11);
    if ((unint64_t)v13 < 0x64)
      -[CBMetricsDaemon _startIfNeeded](self, "_startIfNeeded");
    else
      -[CBMetricsDaemon _scheduleReport](self, "_scheduleReport");
    os_unfair_lock_unlock(&self->_lock);
    if (dword_100977C38 <= 20
      && (dword_100977C38 != -1 || _LogCategory_Initialize(&dword_100977C38, 20)))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appID"));
      LogPrintF_safe(&dword_100977C38, "-[CBMetricsDaemon reportCBDiscovery:daemonCnx:action:]", 20, "Metrics event report: CBDiscovery, appID %@, action %@, PID %d, CID 0x%X. count %llu, dropped %llu", v19, v10, objc_msgSend(v9, "pid"), objc_msgSend(v8, "clientID"), v13, discoveryEventsDroppedTotal);

    }
    if (objc_msgSend(v10, "isEqual:", CFSTR("strt")))
    {
      dispatchQueue = self->_dispatchQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000153A4;
      block[3] = &unk_1009172A0;
      block[4] = v11;
      dispatch_async(dispatchQueue, block);
    }
  }
  else
  {
    self->_discoveryEventsDroppedTotal = discoveryEventsDroppedTotal + 1;
    os_unfair_lock_unlock(&self->_lock);
    if (__ROR8__(0x8F5C28F5C28F5C29 * discoveryEventsDroppedTotal, 1) <= 0x51EB851EB851EB8uLL
      && dword_100977C38 <= 30
      && (dword_100977C38 != -1 || _LogCategory_Initialize(&dword_100977C38, 30)))
    {
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[CBMetricsDiscoveryEvent appID](v11, "appID"));
      LogPrintF_safe(&dword_100977C38, "-[CBMetricsDaemon reportCBDiscovery:daemonCnx:action:]", 30, "Metrics event dropped: CBDiscovery, appID %@, action %@, PID %d, CID 0x%X. count %llu, dropped %llu", v15, v10, -[CBMetricsDiscoveryEvent pid](v11, "pid"), -[CBMetricsDiscoveryEvent clientID](v11, "clientID"), v13, discoveryEventsDroppedTotal + 1);

    }
  }

}

- (void)reportAggressiveScan:(id)a3 action:(id)a4
{
  id v6;
  id v7;
  void *v8;
  __CFString *v9;
  void *v10;
  unsigned int v11;
  unsigned int v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *dispatchQueue;
  id v19;
  _QWORD block[6];
  id v21;
  void *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  CBMetricsAggressiveScanEvent *v29;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appID"));
  if (v8)
    v9 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "appID"));
  else
    v9 = CFSTR("unknown");

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "description"));
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = sub_1000624BC;
  v28 = sub_100062318;
  v29 = 0;
  v29 = objc_alloc_init(CBMetricsAggressiveScanEvent);
  v11 = objc_msgSend(v7, "isEqual:", CFSTR("agsN"));
  objc_msgSend((id)v25[5], "setScanScreenOnCount:", v11);
  v12 = objc_msgSend(v7, "isEqual:", CFSTR("agsF"));
  objc_msgSend((id)v25[5], "setScanScreenOffCount:", v12);
  v13 = objc_msgSend(v6, "bleScanRate");
  objc_msgSend((id)v25[5], "setScanRateScreenOn:", v13);
  v14 = objc_msgSend(v6, "bleScanRateScreenOff");
  objc_msgSend((id)v25[5], "setScanRateScreenOff:", v14);
  v15 = objc_msgSend(v6, "discoveryFlags");
  objc_msgSend((id)v25[5], "setDiscoveryFlags:", v15);
  objc_msgSend((id)v25[5], "setDiscoveryTypes:", 0);
  v16 = objc_msgSend((id)v25[5], "discoveryTypesPtr");
  v17 = objc_retainAutorelease(v6);
  CBDiscoveryTypesAddTypes(v16, objc_msgSend(v17, "discoveryTypesInternalPtr"));
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005E8FC;
  block[3] = &unk_100918318;
  block[4] = self;
  block[5] = v9;
  v22 = v10;
  v23 = &v24;
  v21 = v7;
  v19 = v7;
  dispatch_async(dispatchQueue, block);

  _Block_object_dispose(&v24, 8);
}

- (void)_startIfNeeded
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_startCalled)
  {
    self->_startCalled = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009CDB4;
    block[3] = &unk_1009172A0;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)_setupAggressiveScanMetricExportTimer
{
  OS_dispatch_source **p_aggrScanMetricExportTimer;
  OS_dispatch_source *v4;
  dispatch_source_t v5;
  void **v6;
  uint64_t v7;
  _QWORD *(*v8)(_QWORD *);
  void *v9;
  OS_dispatch_source *v10;
  CBMetricsDaemon *v11;

  p_aggrScanMetricExportTimer = &self->_aggrScanMetricExportTimer;
  v4 = self->_aggrScanMetricExportTimer;
  if (!v4)
  {
    v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_aggrScanMetricExportTimer, v5);
    v6 = _NSConcreteStackBlock;
    v7 = 3221225472;
    v8 = sub_10009D2C8;
    v9 = &unk_100918340;
    v4 = v5;
    v10 = v4;
    v11 = self;
    dispatch_source_set_event_handler((dispatch_source_t)v4, &v6);
    CUDispatchTimerSet(v4, 1200.0, -1.0, 10.0);
    dispatch_activate((dispatch_object_t)v4);
    if (dword_100977C38 <= 20
      && (dword_100977C38 != -1 || _LogCategory_Initialize(&dword_100977C38, 20)))
    {
      LogPrintF_safe(&dword_100977C38, "-[CBMetricsDaemon _setupAggressiveScanMetricExportTimer]", 20, "Aggressive Scan Metrics timer successfully setup", v6, v7, v8, v9);
    }

  }
}

- (CBMetricsDaemon)init
{
  CBMetricsDaemon *v2;
  CBMetricsDaemon *v3;
  dispatch_queue_attr_t v4;
  NSObject *v5;
  dispatch_queue_attr_t v6;
  NSObject *v7;
  dispatch_queue_t v8;
  OS_dispatch_queue *dispatchQueue;
  CBMetricsDaemon *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)CBMetricsDaemon;
  v2 = -[CBMetricsDaemon init](&v12, "init");
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v5 = objc_claimAutoreleasedReturnValue(v4);
    v6 = dispatch_queue_attr_make_with_qos_class(v5, QOS_CLASS_BACKGROUND, 0);
    v7 = objc_claimAutoreleasedReturnValue(v6);
    v8 = dispatch_queue_create("CBMetrics", v7);
    dispatchQueue = v3->_dispatchQueue;
    v3->_dispatchQueue = (OS_dispatch_queue *)v8;

    v10 = v3;
  }

  return v3;
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  unint64_t discoveryEventsDroppedTotal;
  unint64_t discoveryEventsTotal;
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  discoveryEventsDroppedTotal = self->_discoveryEventsDroppedTotal;
  discoveryEventsTotal = self->_discoveryEventsTotal;
  os_unfair_lock_unlock(p_lock);
  v6 = objc_msgSend((id)objc_opt_class(self), "description");
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v8 = NSPrintF_safe("%@: Discovery total/dropped: %llu/%llu", v7, discoveryEventsTotal, discoveryEventsDroppedTotal);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);

  return v9;
}

- (void)_reportEvents
{
  os_unfair_lock_s *p_lock;
  NSMutableArray *v4;
  NSMutableArray *discoveryEventsArray;
  id v6;
  id v7;
  void *i;
  void *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  uint64_t v13;
  void *v14;
  const __CFString *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  unint64_t discoveryEventsTotal;
  unint64_t discoveryEventsDroppedReported;
  unint64_t discoveryEventsDroppedTotal;
  NSMutableArray *v28;
  NSMutableArray *obj;
  uint64_t v30;
  id v31;
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _QWORD v37[2];
  _QWORD v38[2];
  _QWORD v39[7];
  _QWORD v40[7];
  _BYTE v41[128];

  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  self->_scheduledReport = 0;
  v4 = self->_discoveryEventsArray;
  discoveryEventsArray = self->_discoveryEventsArray;
  self->_discoveryEventsArray = 0;

  discoveryEventsTotal = self->_discoveryEventsTotal;
  discoveryEventsDroppedReported = self->_discoveryEventsDroppedReported;
  discoveryEventsDroppedTotal = self->_discoveryEventsDroppedTotal;
  self->_discoveryEventsDroppedReported = discoveryEventsDroppedTotal;
  os_unfair_lock_unlock(p_lock);
  v28 = v4;
  v6 = -[NSMutableArray count](v4, "count");
  if (&_PLLogRegisteredEvent && v6)
  {
    v24 = v6;
    v31 = objc_alloc_init((Class)NSMutableArray);
    v35 = 0u;
    v36 = 0u;
    v33 = 0u;
    v34 = 0u;
    obj = v4;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
    if (v7)
    {
      v30 = *(_QWORD *)v34;
      do
      {
        v32 = v7;
        for (i = 0; i != v32; i = (char *)i + 1)
        {
          if (*(_QWORD *)v34 != v30)
            objc_enumerationMutation(obj);
          v9 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * (_QWORD)i);
          v39[0] = CFSTR("actn");
          v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "action"));
          v11 = (void *)v10;
          if (v10)
            v12 = (const __CFString *)v10;
          else
            v12 = &stru_100941758;
          v40[0] = v12;
          v39[1] = CFSTR("apID");
          v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "appID"));
          v14 = (void *)v13;
          if (v13)
            v15 = (const __CFString *)v13;
          else
            v15 = &stru_100941758;
          v40[1] = v15;
          v39[2] = CFSTR("cid");
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", objc_msgSend(v9, "clientID")));
          v40[2] = v16;
          v39[3] = CFSTR("dsFl");
          v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v9, "discoveryFlags")));
          v40[3] = v17;
          v39[4] = CFSTR("pid");
          v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "pid")));
          v40[4] = v18;
          v39[5] = CFSTR("scnR");
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", objc_msgSend(v9, "scanRate")));
          v40[5] = v19;
          v39[6] = CFSTR("timS");
          objc_msgSend(v9, "timestamp");
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
          v40[6] = v20;
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v40, v39, 7));

          objc_msgSend(v31, "addObject:", v21);
        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v33, v41, 16);
      }
      while (v7);
    }

    v37[0] = CFSTR("dscE");
    v37[1] = CFSTR("drpE");
    v38[0] = v31;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", discoveryEventsDroppedTotal - discoveryEventsDroppedReported));
    v38[1] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v38, v37, 2));

    if (dword_100977C38 <= 20
      && (dword_100977C38 != -1 || _LogCategory_Initialize(&dword_100977C38, 20)))
    {
      LogPrintF_safe(&dword_100977C38, "-[CBMetricsDaemon _reportEvents]", 20, "PowerLog report: name %@, total %llu +%llu, dropped %llu +%llu", CFSTR("CBDiscovery"), discoveryEventsTotal, v24, discoveryEventsDroppedTotal, discoveryEventsDroppedTotal - discoveryEventsDroppedReported);
    }
    PLLogRegisteredEvent(35, CFSTR("CBDiscovery"), v23, 0);

  }
}

- (void)_scheduleReport
{
  NSObject *dispatchQueue;
  _QWORD block[5];

  os_unfair_lock_assert_owner(&self->_lock);
  if (!self->_scheduledReport)
  {
    self->_scheduledReport = 1;
    dispatchQueue = self->_dispatchQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009CDAC;
    block[3] = &unk_1009172A0;
    block[4] = self;
    dispatch_async(dispatchQueue, block);
  }
}

- (void)reportAuthTagType:(unsigned __int8)a3 authTagStatus:(unsigned __int8)a4 integrityTagStatus:(unsigned __int8)a5 resolutionWindow:(char)a6
{
  NSObject *dispatchQueue;
  _QWORD v7[5];
  unsigned __int8 v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  char v11;

  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009D058;
  v7[3] = &unk_1009173A0;
  v7[4] = self;
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = a6;
  dispatch_async(dispatchQueue, v7);
}

- (void)_reportAuthTagType:(unsigned __int8)a3 authTagStatus:(unsigned __int8)a4 integrityTagStatus:(unsigned __int8)a5 resolutionWindow:(char)a6
{
  int v6;
  int v7;
  int v8;
  double Current;
  double v10;
  double v11;
  void *v12;
  id v13;
  const char *v14;
  uint64_t v15;
  _DWORD v16[3];
  uint64_t v17;
  uint64_t v18;
  int v19;
  double v20;
  double v21;

  v6 = a6;
  v7 = a5;
  v8 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_dispatchQueue);
  Current = CFAbsoluteTimeGetCurrent();
  v21 = -1.0;
  v20 = -1.0;
  v19 = -1;
  if ((objc_msgSend(gCBDaemonServer, "prefSystemReferenceTimeDisabled") & 1) == 0
    && TMGetReferenceTime(&v21, &v20, &v19)
    && v19)
  {
    v10 = v21;
    v11 = v21 - Current;
    if (dword_100977C38 > 20)
      goto LABEL_13;
    if (dword_100977C38 != -1)
      goto LABEL_6;
    if (_LogCategory_Initialize(&dword_100977C38, 20))
    {
      v10 = v21;
LABEL_6:
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v10));
      v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "description")));
      v14 = (const char *)objc_msgSend(v13, "UTF8String");
      LogPrintF_safe(&dword_100977C38, "-[CBMetricsDaemon _reportAuthTagType:authTagStatus:integrityTagStatus:resolutionWindow:]", 20, "Reference time %f, (%s). delta: %f ±%f reliability %d", v10, v14, v11, v20, v19);

    }
  }
  else
  {
    v11 = -1.0;
    if (dword_100977C38 <= 20
      && (dword_100977C38 != -1 || _LogCategory_Initialize(&dword_100977C38, 20)))
    {
      LogPrintF_safe(&dword_100977C38, "-[CBMetricsDaemon _reportAuthTagType:authTagStatus:integrityTagStatus:resolutionWindow:]", 20, "No reference time available for auth tag");
    }
  }
LABEL_13:
  v18 = 0;
  v17 = 0;
  v16[0] = (int)v11;
  v16[1] = (int)v20;
  v16[2] = v19;
  if (v7 == 1)
  {
    WORD1(v17) = 1;
    switch(v6)
    {
      case -1:
        WORD1(v18) = 1;
        break;
      case 1:
        WORD2(v18) = 1;
        break;
      case 0:
        LOWORD(v18) = 1;
        break;
    }
  }
  else if (v8 == 5)
  {
    HIWORD(v17) = 1;
  }
  else if (v8 == 1)
  {
    WORD2(v17) = 1;
  }
  LOWORD(v17) = 1;
  v15 = sub_100065478();
  (*(void (**)(uint64_t, _DWORD *))(*(_QWORD *)v15 + 32))(v15, v16);
}

- (void)_reportAggressiveScanMetricEvents
{
  id v3;
  NSMutableDictionary *aggrScanMetricDict;
  void *v5;
  NSMutableDictionary *v6;
  _QWORD v7[5];
  const __CFString *v8;
  id v9;

  if (&_PLLogRegisteredEvent && self->_aggrScanMetricDict)
  {
    v3 = objc_alloc_init((Class)NSMutableArray);
    aggrScanMetricDict = self->_aggrScanMetricDict;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10009D4C8;
    v7[3] = &unk_100918368;
    v7[4] = v3;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](aggrScanMetricDict, "enumerateKeysAndObjectsUsingBlock:", v7);
    v8 = CFSTR("agsE");
    v9 = v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v9, &v8, 1));
    if (dword_100977C38 <= 20
      && (dword_100977C38 != -1 || _LogCategory_Initialize(&dword_100977C38, 20)))
    {
      LogPrintF_safe(&dword_100977C38, "-[CBMetricsDaemon _reportAggressiveScanMetricEvents]", 20, "PowerLog report: name %@ with %lu events", CFSTR("AggressiveScan"), objc_msgSend(v3, "count"));
    }
    PLLogRegisteredEvent(35, CFSTR("AggressiveScan"), v5, 0);

  }
  v6 = self->_aggrScanMetricDict;
  self->_aggrScanMetricDict = 0;

}

- (void)reportxpcCBAdvertiserUpdate:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD block[4];
  id v8;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009D8BC;
  block[3] = &unk_1009172A0;
  v8 = v4;
  v6 = v4;
  dispatch_async(dispatchQueue, block);

}

- (void)reportRSSIMetric:(id)a3
{
  id v4;
  NSObject *dispatchQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  CBMetricsDaemon *v9;

  v4 = a3;
  dispatchQueue = self->_dispatchQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10009D98C;
  v7[3] = &unk_100918340;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(dispatchQueue, v7);

}

- (void)_setupMetricExportTimer
{
  OS_dispatch_source **p_whbMetricExportTimer;
  OS_dispatch_source *v4;
  dispatch_source_t v5;
  void **v6;
  uint64_t v7;
  _QWORD *(*v8)(uint64_t);
  void *v9;
  OS_dispatch_source *v10;
  CBMetricsDaemon *v11;

  p_whbMetricExportTimer = &self->_whbMetricExportTimer;
  v4 = self->_whbMetricExportTimer;
  if (!v4)
  {
    v5 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_dispatchQueue);
    objc_storeStrong((id *)p_whbMetricExportTimer, v5);
    v6 = _NSConcreteStackBlock;
    v7 = 3221225472;
    v8 = sub_10009DB18;
    v9 = &unk_100918340;
    v4 = v5;
    v10 = v4;
    v11 = self;
    dispatch_source_set_event_handler((dispatch_source_t)v4, &v6);
    CUDispatchTimerSet(self->_whbMetricExportTimer, 43200.0, -1.0, 10.0);
    dispatch_activate((dispatch_object_t)*p_whbMetricExportTimer);
    if (dword_100977C38 <= 30
      && (dword_100977C38 != -1 || _LogCategory_Initialize(&dword_100977C38, 30)))
    {
      LogPrintF_safe(&dword_100977C38, "-[CBMetricsDaemon _setupMetricExportTimer]", 30, "WHB metric timer successfully setup", v6, v7, v8, v9);
    }

  }
}

- (void)_whbMetricExportTimerFired
{
  double v2;
  unint64_t numRssiBucketChanges;
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  OS_dispatch_source *whbMetricExportTimer;
  NSObject *v10;
  OS_dispatch_source *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  if (dword_100977C38 <= 20 && (dword_100977C38 != -1 || _LogCategory_Initialize(&dword_100977C38, 20)))
    LogPrintF_safe(&dword_100977C38, "-[CBMetricsDaemon _whbMetricExportTimerFired]", 20, "WHB metric export timer fired");
  numRssiBucketChanges = self->_numRssiBucketChanges;
  v5 = self->_numRssiNoBucketChanges + numRssiBucketChanges;
  if (v5)
    *(float *)&v2 = (float)((float)numRssiBucketChanges / (float)v5) * 100.0;
  else
    LODWORD(v2) = 0;
  v12[0] = CFSTR("CBWHBMetricsKeyEventType");
  v12[1] = CFSTR("CBWHBMetricsKeyRSSIChangePercent");
  v13[0] = CFSTR("RSSILevelEvent");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v2));
  v13[1] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CBMetricsDaemon sharedCBMetricsDaemon](CBMetricsDaemon, "sharedCBMetricsDaemon"));
  objc_msgSend(v8, "reportWhbMetric:", v7);

  self->_numRssiNoBucketChanges = 0;
  self->_numRssiBucketChanges = 0;
  whbMetricExportTimer = self->_whbMetricExportTimer;
  if (whbMetricExportTimer)
  {
    v10 = whbMetricExportTimer;
    dispatch_source_cancel(v10);
    v11 = self->_whbMetricExportTimer;
    self->_whbMetricExportTimer = 0;

  }
}

- (void)reportWhbMetric:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  NSObject *dispatchQueue;
  id v8;
  _QWORD block[4];
  id v10;

  v4 = a3;
  if (dword_100977C38 <= 20 && (dword_100977C38 != -1 || _LogCategory_Initialize(&dword_100977C38, 20)))
  {
    v5 = CUPrintNSObjectOneLine(v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    LogPrintF_safe(&dword_100977C38, "-[CBMetricsDaemon reportWhbMetric:]", 20, "WHB Metrics report: %@", v6);

  }
  dispatchQueue = self->_dispatchQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10009DDF0;
  block[3] = &unk_1009172A0;
  v10 = v4;
  v8 = v4;
  dispatch_async(dispatchQueue, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_whbMetricExportTimer, 0);
  objc_storeStrong((id *)&self->_aggrScanMetricExportTimer, 0);
  objc_storeStrong((id *)&self->_aggrScanMetricDict, 0);
  objc_storeStrong((id *)&self->_dispatchQueue, 0);
  objc_storeStrong((id *)&self->_discoveryEventsArray, 0);
}

@end
