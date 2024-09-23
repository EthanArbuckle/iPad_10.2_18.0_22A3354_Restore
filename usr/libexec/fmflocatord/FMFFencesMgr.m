@implementation FMFFencesMgr

+ (id)sharedInstance
{
  if (qword_1000695D0 != -1)
    dispatch_once(&qword_1000695D0, &stru_1000557A8);
  return (id)qword_1000695D8;
}

- (FMFFencesMgr)init
{
  FMFFencesMgr *v2;
  id v3;
  NSObject *v4;
  int v5;
  const __CFString *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  FenceSchedulerProtocol *scheduler;
  uint64_t v15;
  NSSet *allFences;
  uint64_t v17;
  FenceProvider *fenceProvider;
  FenceProvider *v19;
  _QWORD v21[4];
  FMFFencesMgr *v22;
  objc_super v23;
  uint8_t buf[4];
  const __CFString *v25;

  v23.receiver = self;
  v23.super_class = (Class)FMFFencesMgr;
  v2 = -[FMFFencesMgr init](&v23, "init");
  if (v2)
  {
    v3 = sub_10001C4E8();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v5 = sub_10001F9D4();
      v6 = CFSTR("ON");
      if (v5)
        v6 = CFSTR("OFF");
      *(_DWORD *)buf = 138412290;
      v25 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Fence_Migration feature flag: %@", buf, 0xCu);
    }

    v7 = objc_alloc((Class)FMDataArchiver);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr _fencesCacheFileURL](v2, "_fencesCacheFileURL"));
    v9 = objc_msgSend(v7, "initWithFileURL:", v8);
    -[FMFFencesMgr setDataArchiver:](v2, "setDataArchiver:", v9);

    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v10, "setDataProtectionClass:", 4);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v11, "setBackedUp:", 0);

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr dataArchiver](v2, "dataArchiver"));
    objc_msgSend(v12, "setCreateDirectories:", 1);

    v13 = objc_claimAutoreleasedReturnValue(-[FMFFencesMgr createFenceScheduler](v2, "createFenceScheduler"));
    scheduler = v2->_scheduler;
    v2->_scheduler = (FenceSchedulerProtocol *)v13;

    -[FMFFencesMgr registerAlarms](v2, "registerAlarms");
    v15 = objc_claimAutoreleasedReturnValue(+[NSSet set](NSSet, "set"));
    allFences = v2->_allFences;
    v2->_allFences = (NSSet *)v15;

    v17 = objc_claimAutoreleasedReturnValue(-[FMFFencesMgr createFenceProvider](v2, "createFenceProvider"));
    fenceProvider = v2->_fenceProvider;
    v2->_fenceProvider = (FenceProvider *)v17;

    v19 = v2->_fenceProvider;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000172D4;
    v21[3] = &unk_1000557D0;
    v22 = v2;
    -[FenceProvider getFences:](v19, "getFences:", v21);

  }
  return v2;
}

- (id)createFenceScheduler
{
  int v3;
  Class *v4;

  v3 = sub_10001F9D4();
  v4 = (Class *)FMFScheduler_ptr;
  if (!v3)
    v4 = (Class *)&off_1000547A8;
  return objc_msgSend(objc_alloc(*v4), "initWithDelegate:", self);
}

- (id)createFenceProvider
{
  id v3;
  void *v4;
  id v5;

  if (sub_10001F9D4())
  {
    v3 = objc_alloc((Class)FMFSession);
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue mainQueue](NSOperationQueue, "mainQueue"));
    v5 = objc_msgSend(v3, "initWithDelegate:delegateQueue:", self, v4);

  }
  else
  {
    v5 = (id)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr findMyLocateSession](self, "findMyLocateSession"));
  }
  return v5;
}

- (id)findMyLocateSession
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100017488;
  block[3] = &unk_100055230;
  block[4] = self;
  if (qword_1000695E8 != -1)
    dispatch_once(&qword_1000695E8, block);
  return (id)qword_1000695E0;
}

- (void)dealloc
{
  id v3;
  NSObject *v4;
  _QWORD *v5;
  objc_super v6;
  _QWORD block[4];
  _QWORD *v8;
  _QWORD v9[5];

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_1000341A4(self);

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000175E0;
  v9[3] = &unk_100055230;
  v9[4] = self;
  v5 = objc_retainBlock(v9);
  if (+[NSThread isMainThread](NSThread, "isMainThread"))
  {
    ((void (*)(_QWORD *))v5[2])(v5);
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017620;
    block[3] = &unk_100055258;
    v8 = v5;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

  }
  v6.receiver = self;
  v6.super_class = (Class)FMFFencesMgr;
  -[FMFFencesMgr dealloc](&v6, "dealloc");
}

- (void)registerAlarms
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  uint64_t v7;
  id v8;
  _QWORD v9[6];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr scheduler](self, "scheduler"));
  v5 = (const char *)objc_msgSend((id)objc_opt_class(v3, v4), "alarmStream");

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr scheduler](self, "scheduler"));
  v8 = objc_msgSend((id)objc_opt_class(v6, v7), "timerIdentifier");

  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000176D8;
  v9[3] = &unk_1000557F8;
  v9[4] = self;
  v9[5] = v8;
  xpc_set_event_stream_handler(v5, (dispatch_queue_t)&_dispatch_main_q, v9);
}

- (void)start
{
  id v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  NSObject *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LOWORD(v20) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Preparing to sanitize any inconsistent state for fences", (uint8_t *)&v20, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[AccountManager sharedInstance](AccountManager, "sharedInstance"));
  v7 = objc_msgSend(v5, "allAccountsOfType:", objc_opt_class(FMFAccount, v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

  if (objc_msgSend(v8, "count")
    && (v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectAtIndexedSubscript:", 0))) != 0)
  {
    v10 = (void *)v9;
    -[FMFFencesMgr _readFencesToMonitorCache](self, "_readFencesToMonitorCache");
    v11 = sub_10001C4E8();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr fencesToMonitor](self, "fencesToMonitor"));
      v14 = objc_msgSend(v13, "count");
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr locMgr](self, "locMgr"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "monitoredRegions"));
      v17 = objc_msgSend(v16, "count");
      v20 = 134218240;
      v21 = v14;
      v22 = 2048;
      v23 = v17;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "FMF has %ld fences in fmflocatord & %ld fences in CoreLocation", (uint8_t *)&v20, 0x16u);

    }
  }
  else
  {
    v18 = sub_10001C4E8();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Removed all fences since there is no FMF account", (uint8_t *)&v20, 2u);
    }

    -[FMFFencesMgr setFencesToMonitor:withFenceVersion:triggerValidityDuration:andTriggerURL:](self, "setFencesToMonitor:withFenceVersion:triggerValidityDuration:andTriggerURL:", 0, 0, 0, 0.0);
  }

}

- (void)stop
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  NSObject *v7;
  _QWORD block[5];
  uint8_t buf[16];

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Stopping FMFFencesMgr...", buf, 2u);
  }

  -[FMFFencesMgr setDelegate:](self, "setDelegate:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr locMgr](self, "locMgr"));

  if (v5)
  {
    v6 = sub_10001C4E8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Removing the FMF fences location manager...", buf, 2u);
    }

    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100017B50;
    block[3] = &unk_100055230;
    block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)setFencesToMonitor:(id)a3 withFenceVersion:(id)a4 triggerValidityDuration:(double)a5 andTriggerURL:(id)a6
{
  id v10;
  id v11;
  id v12;

  v10 = a6;
  v11 = a4;
  v12 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  -[FMFFencesMgr setFenceVersion:](self, "setFenceVersion:", v11);

  -[FMFFencesMgr setTriggerURL:](self, "setTriggerURL:", v10);
  -[FMFFencesMgr setTriggerValidityDuration:](self, "setTriggerValidityDuration:", a5);
  -[FMFFencesMgr setFencesToMonitor:](self, "setFencesToMonitor:", v12);

}

- (BOOL)isFenceBeingMonitored:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr monitoredFences](self, "monitoredFences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fenceId"));

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v6));
  LOBYTE(v4) = v7 != 0;

  return (char)v4;
}

- (NSString)description
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr monitoredFences](self, "monitoredFences"));
  v4 = objc_msgSend(v3, "count");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr locMgr](self, "locMgr"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "monitoredRegions"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("fmf fences - expected:%ld, actual:%ld"), v4, objc_msgSend(v6, "count")));

  return (NSString *)v7;
}

- (void)triggerFence:(id)a3 atLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v6 = a3;
  v7 = a4;
  if (sub_10001F9D4())
  {
    -[FMFFencesMgr fmf_triggerFence:atLocation:](self, "fmf_triggerFence:atLocation:", v6, v7);
  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr findMyLocateSession](self, "findMyLocateSession"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fenceId"));
    v10 = objc_msgSend(v6, "lastTrigger");
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_100017E38;
    v11[3] = &unk_100055820;
    v12 = v6;
    objc_msgSend(v8, "triggerFenceWithID:trigger:location:completionHandler:", v9, v10, v7, v11);

  }
}

- (void)fmf_triggerFence:(id)a3 atLocation:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMFSession sharedInstance](FMFSession, "sharedInstance"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100018040;
  v10[3] = &unk_100055888;
  v11 = v5;
  v12 = v6;
  v8 = v6;
  v9 = v5;
  objc_msgSend(v7, "getActiveLocationSharingDevice:", v10);

}

- (void)setFencesToMonitor:(id)a3
{
  NSArray *v4;
  NSArray *fencesToMonitor;

  v4 = (NSArray *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  fencesToMonitor = self->_fencesToMonitor;
  self->_fencesToMonitor = v4;

  -[FMFFencesMgr _updateFencesToMonitorCache](self, "_updateFencesToMonitorCache");
  -[FMFFencesMgr _updateMonitoredFences](self, "_updateMonitoredFences");
}

- (void)setAllFences:(id)a3
{
  NSSet *v4;
  id v5;
  NSObject *v6;
  NSSet *allFences;
  NSSet *v8;
  int v9;
  const char *v10;
  __int16 v11;
  NSSet *v12;
  __int16 v13;
  NSSet *v14;

  v4 = (NSSet *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)&_dispatch_main_q);
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    allFences = self->_allFences;
    v9 = 136315650;
    v10 = "-[FMFFencesMgr setAllFences:]";
    v11 = 2112;
    v12 = allFences;
    v13 = 2112;
    v14 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: old: %@ new: %@", (uint8_t *)&v9, 0x20u);
  }

  v8 = self->_allFences;
  self->_allFences = v4;

  -[FMFFencesMgr _updateMonitoredFences](self, "_updateMonitoredFences");
}

- (void)_updateMonitoredFences
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:selector:object:](NSObject, "cancelPreviousPerformRequestsWithTarget:selector:object:", self, "__updateMonitoredFences", 0);
  -[FMFFencesMgr performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "__updateMonitoredFences", 0, 1.0);
}

- (void)__updateMonitoredFences
{
  void *v2;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr fencesToMonitor](self, "fencesToMonitor", 0));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v11 = objc_msgSend(v10, "shouldUseCloudKitStore");
        v12 = v10;
        if (v11)
        {
          v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr updatedFenceForFence:](self, "updatedFenceForFence:", v10));
          v12 = v2;
        }
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fenceId"));
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v12, v13);

        if (v11)
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  -[FMFFencesMgr setMonitoredFences:](self, "setMonitoredFences:", v4);
}

- (id)updatedFenceForFence:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "fenceId"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr fenceWithID:](self, "fenceWithID:", v5));

  if (v6)
  {
    objc_msgSend(v6, "longitude");
    objc_msgSend(v4, "setLongitude:");
    objc_msgSend(v6, "latitude");
    objc_msgSend(v4, "setLatitude:");
    objc_msgSend(v6, "radius");
    objc_msgSend(v4, "setRadius:");
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "schedule"));
    objc_msgSend(v4, "setSchedule:", v7);

    v8 = v4;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)fenceWithID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr allFences](self, "allFences"));
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10001877C;
  v9[3] = &unk_1000558B0;
  v10 = v4;
  v6 = v4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "fm_firstObjectPassingTest:", v9));

  return v7;
}

- (void)setMonitoredFences:(id)a3
{
  NSDictionary *v4;
  id v5;
  NSObject *v6;
  NSDictionary *monitoredFences;
  NSDictionary *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  const char *v14;
  __int16 v15;
  NSDictionary *v16;
  __int16 v17;
  NSDictionary *v18;

  v4 = (NSDictionary *)a3;
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    monitoredFences = self->_monitoredFences;
    v13 = 136315650;
    v14 = "-[FMFFencesMgr setMonitoredFences:]";
    v15 = 2112;
    v16 = monitoredFences;
    v17 = 2112;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: old: %@ new: %@", (uint8_t *)&v13, 0x20u);
  }

  v8 = self->_monitoredFences;
  self->_monitoredFences = v4;

  -[FMFFencesMgr _updateCL](self, "_updateCL");
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr monitoredFences](self, "monitoredFences"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "allValues"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fm_map:", &stru_1000558F0));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr scheduler](self, "scheduler"));
  objc_msgSend(v12, "setSchedules:", v11);

}

- (void)setNetworkAvailable:(BOOL)a3
{
  _BOOL4 v3;
  id v5;
  NSObject *v6;
  _BOOL4 networkAvailable;
  int v8;
  const char *v9;
  __int16 v10;
  _BOOL4 v11;
  __int16 v12;
  _BOOL4 v13;

  v3 = a3;
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    networkAvailable = self->_networkAvailable;
    v8 = 136315650;
    v9 = "-[FMFFencesMgr setNetworkAvailable:]";
    v10 = 1024;
    v11 = networkAvailable;
    v12 = 1024;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: old: %d new: %d", (uint8_t *)&v8, 0x18u);
  }

  if (self->_networkAvailable != v3)
  {
    self->_networkAvailable = v3;
    if (v3)
      -[FMFFencesMgr _updateCL](self, "_updateCL");
  }
}

- (CLLocationManager)locMgr
{
  CLLocationManager *locMgr;
  id v4;
  NSObject *v5;
  CLLocationManager *v6;
  CLLocationManager *v7;
  uint8_t v9[16];

  locMgr = self->_locMgr;
  if (!locMgr)
  {
    v4 = sub_10001C4E8();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Creating FMF location manager for fences...", v9, 2u);
    }

    v6 = (CLLocationManager *)objc_msgSend(objc_alloc((Class)CLLocationManager), "initWithEffectiveBundlePath:delegate:onQueue:", CFSTR("/System/Library/PrivateFrameworks/FMF.framework"), self, &_dispatch_main_q);
    v7 = self->_locMgr;
    self->_locMgr = v6;

    locMgr = self->_locMgr;
  }
  return locMgr;
}

- (void)_updateCL
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  id v13;
  __int128 v14;
  id v15;
  uint64_t v16;
  void *i;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  id v28;
  uint64_t v29;
  void *j;
  void *v31;
  double v32;
  CLLocationDegrees v33;
  CLLocationDegrees v34;
  double latitude;
  double longitude;
  id v37;
  double v38;
  double v39;
  void *v40;
  NSObject *v41;
  void *v42;
  id v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  id v57;
  __int16 v58;
  id v59;
  CLLocationCoordinate2D v60;

  v3 = sub_10001C4E8();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Synchronizing fences between fmflocatord & CL...", buf, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr _currentFences](self, "_currentFences"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr locMgr](self, "locMgr"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "monitoredRegions"));

  v8 = sub_10001C4E8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    v10 = objc_msgSend(v5, "count");
    v11 = objc_msgSend(v7, "count");
    *(_DWORD *)buf = 134218240;
    v57 = v10;
    v58 = 2048;
    v59 = v11;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Number of current fences: fmflocatord=%ld CL=%ld", buf, 0x16u);
  }

  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v13)
  {
    v15 = v13;
    v16 = *(_QWORD *)v51;
    *(_QWORD *)&v14 = 138412290;
    v44 = v14;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier", v44));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", v19));

        if (!v20)
        {
          v21 = sub_10001C4E8();
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "identifier"));
            *(_DWORD *)buf = v44;
            v57 = v23;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Fence %@ in CL is not present in fmflocatord. Unregistering it...", buf, 0xCu);

          }
          v24 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr locMgr](self, "locMgr"));
          objc_msgSend(v24, "stopMonitoringForRegion:", v18);

        }
      }
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v15);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v25 = v5;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v26)
  {
    v28 = v26;
    v29 = *(_QWORD *)v47;
    *(_QWORD *)&v27 = 138412290;
    v45 = v27;
    do
    {
      for (j = 0; j != v28; j = (char *)j + 1)
      {
        if (*(_QWORD *)v47 != v29)
          objc_enumerationMutation(v25);
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j), v45, (_QWORD)v46));
        objc_msgSend(v31, "latitude");
        v33 = v32;
        objc_msgSend(v31, "longitude");
        v60 = CLLocationCoordinate2DMake(v33, v34);
        latitude = v60.latitude;
        longitude = v60.longitude;
        if (CLLocationCoordinate2DIsValid(v60))
        {
          v37 = objc_alloc((Class)CLCircularRegion);
          objc_msgSend(v31, "radius");
          v39 = v38;
          v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "fenceId"));
          v41 = objc_msgSend(v37, "initWithCenter:radius:identifier:", v40, latitude, longitude, v39);

          v42 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr locMgr](self, "locMgr"));
          objc_msgSend(v42, "startMonitoringForRegion:", v41);

        }
        else
        {
          v43 = sub_10001C4E8();
          v41 = objc_claimAutoreleasedReturnValue(v43);
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = v45;
            v57 = v31;
            _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Invalid 2D coord when attempting to create fence %@", buf, 0xCu);
          }
        }

      }
      v28 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
    }
    while (v28);
  }

}

- (void)_trigger:(int64_t)a3 forRegionWithID:(id)a4 atLocation:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  unsigned int v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  const __CFString *v33;
  void *v34;
  const __CFString *v35;
  void *v36;
  double v37;
  void *v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[4];
  _QWORD v43[4];
  _BYTE buf[28];
  __int16 v45;
  NSObject *v46;
  __int16 v47;
  id v48;
  __int16 v49;
  void *v50;

  v8 = a4;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr monitoredFences](self, "monitoredFences"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v8));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
    v41 = 0;
    v13 = objc_msgSend(v11, "shouldTrigger:forLocation:atDate:reason:", a3, v9, v12, &v41);
    v14 = v41;

    v15 = sub_10001C4E8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = sub_10001612C(a3);
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      *(_DWORD *)buf = 136316418;
      *(_QWORD *)&buf[4] = "-[FMFFencesMgr _trigger:forRegionWithID:atLocation:]";
      *(_WORD *)&buf[12] = 1024;
      *(_DWORD *)&buf[14] = v13;
      *(_WORD *)&buf[18] = 2112;
      *(_QWORD *)&buf[20] = v18;
      v45 = 2112;
      v46 = v14;
      v47 = 2112;
      v48 = v9;
      v49 = 2112;
      v50 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: shouldTrigger: %d status: %@ reason: %@ location: %@ forFence: %@", buf, 0x3Au);

    }
    if (v13)
    {
      objc_msgSend(v11, "setLastTrigger:", a3);
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
      objc_msgSend(v11, "setLastTriggerTimestamp:", v19);

      v20 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr delegate](self, "delegate"));
      objc_msgSend(v20, "fenceTriggered:atLocation:", v11, v9);

      v21 = objc_alloc((Class)CLLocation);
      objc_msgSend(v11, "latitude");
      v23 = v22;
      objc_msgSend(v11, "longitude");
      v40 = objc_msgSend(v21, "initWithLatitude:longitude:", v23, v24);
      objc_msgSend(v9, "distanceFromLocation:");
      v26 = v25;
      objc_msgSend(v11, "radius");
      v28 = v26 - v27;
      memset(buf, 0, 24);
      v29 = (void *)objc_claimAutoreleasedReturnValue(+[SystemConfig sharedInstance](SystemConfig, "sharedInstance"));
      v30 = v29;
      if (v29)
        objc_msgSend(v29, "batteryStats");
      else
        memset(buf, 0, 24);

      v42[0] = CFSTR("locationManagerMonitoringFenceTriggerDistance");
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", (uint64_t)v28));
      v43[0] = v32;
      v42[1] = CFSTR("locationManagerMonitoringFenceTriggerType");
      v33 = sub_10001612C(a3);
      v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
      v43[1] = v34;
      v42[2] = CFSTR("locationManagerMonitoringFenceType");
      v35 = sub_100016104((uint64_t)objc_msgSend(v11, "triggerType"));
      v36 = (void *)objc_claimAutoreleasedReturnValue(v35);
      v43[2] = v36;
      v42[3] = CFSTR("locationManagerMonitoringFenceTriggerBatteryLevel");
      LODWORD(v37) = *(_DWORD *)&buf[16];
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v37));
      v43[3] = v38;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 4));
      AnalyticsSendEvent(CFSTR("com.apple.icloud.fmflocatord.ReliabilityMetric"), v39);

    }
  }
  else
  {
    v31 = sub_10001C4E8();
    v14 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10003428C();
  }

}

- (void)_updateFencesToMonitorCache
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  id v23;
  NSObject *v24;
  void *v25;
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr _fencesCacheFileURL](self, "_fencesCacheFileURL"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr fencesToMonitor](self, "fencesToMonitor"));
  v5 = objc_msgSend(v4, "count");

  if (v5)
  {
    v6 = sub_10001C4E8();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr fencesToMonitor](self, "fencesToMonitor"));
      *(_DWORD *)buf = 134217984;
      v29 = objc_msgSend(v8, "count");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Saving %ld fences to cache...", buf, 0xCu);

    }
    v9 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr fencesToMonitor](self, "fencesToMonitor"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fm_map:", &stru_100055930));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v11, CFSTR("fences"));

    v12 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr triggerURL](self, "triggerURL"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v12, CFSTR("triggerURL"));

    -[FMFFencesMgr triggerValidityDuration](self, "triggerValidityDuration");
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v13, CFSTR("triggerValidityDuration"));

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr fenceVersion](self, "fenceVersion"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v14, CFSTR("fenceVersion"));

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr dataArchiver](self, "dataArchiver"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "saveDictionary:", v9));

    if (v16)
    {
      v17 = sub_10001C4E8();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_1000343A8();

    }
    goto LABEL_8;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr fenceVersion](self, "fenceVersion"));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
    v22 = objc_msgSend(v20, "fileExistsAtPath:", v21);

    if (v22)
    {
      v23 = sub_10001C4E8();
      v24 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
        sub_100034368(v24);

      v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v27 = 0;
      objc_msgSend(v25, "removeItemAtURL:error:", v3, &v27);
      v9 = v27;

      if (!v9)
        goto LABEL_9;
      v26 = sub_10001C4E8();
      v16 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        sub_1000342FC();
LABEL_8:

LABEL_9:
    }
  }

}

- (void)_readFencesToMonitorCache
{
  void *v3;
  uint64_t v4;
  NSSet *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  BOOL v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSObject *v18;
  uint8_t v19[8];
  id v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr dataArchiver](self, "dataArchiver"));
  v5 = +[NSSet setWithObject:](NSSet, "setWithObject:", objc_opt_class(NSDictionary, v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v20 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "readDictionaryAndClasses:error:", v6, &v20));
  v8 = v20;

  v9 = sub_10001C4E8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = v10;
  if (v7)
    v12 = v8 == 0;
  else
    v12 = 0;
  if (v12)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v19 = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "FMFFencesMgr successfully read fences from disk.", v19, 2u);
    }

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("triggerURL")));
    -[FMFFencesMgr setTriggerURL:](self, "setTriggerURL:", v13);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("triggerValidityDuration")));
    objc_msgSend(v14, "doubleValue");
    -[FMFFencesMgr setTriggerValidityDuration:](self, "setTriggerValidityDuration:");

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fenceVersion")));
    -[FMFFencesMgr setFenceVersion:](self, "setFenceVersion:", v15);

    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("fences")));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject fm_map:](v11, "fm_map:", &stru_100055970));
    -[FMFFencesMgr setFencesToMonitor:](self, "setFencesToMonitor:", v16);

    v17 = sub_10001C4E8();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      sub_100034468(self);

  }
  else if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    sub_100034408();
  }

}

- (id)_fencesCacheFileURL
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  id v10;
  NSObject *v11;

  v2 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("Preferences")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:relativeToURL:](NSURL, "fileURLWithPath:isDirectory:relativeToURL:", v5, 1, 0));

  }
  else
  {
    v7 = sub_10001C4E8();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
      sub_10003454C(v8);

    v6 = 0;
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.icloud.fmflocatord.fences.notbackedup.plist"), 0));

  v10 = sub_10001C4E8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_1000344E0();

  return v9;
}

- (id)_currentFences
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr monitoredFences](self, "monitoredFences"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "fm_filter:", &stru_1000559B0));

  return v3;
}

- (void)schedulerCurrentSchedulesDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[FMFFencesMgr schedulerCurrentSchedulesDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Schedules Changed, Updating CL", (uint8_t *)&v6, 0xCu);
  }

  -[FMFFencesMgr _updateCL](self, "_updateCL");
}

- (void)fenceSchedulerCurrentSchedulesDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  int v6;
  const char *v7;

  v4 = sub_10001C4E8();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = 136315138;
    v7 = "-[FMFFencesMgr fenceSchedulerCurrentSchedulesDidChange:]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s: Fence Schedules Changed, Updating CL", (uint8_t *)&v6, 0xCu);
  }

  -[FMFFencesMgr _updateCL](self, "_updateCL");
}

- (void)setupSessionCallbacks:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  _QWORD v7[4];
  id v8;
  id location;

  v4 = a3;
  if ((((uint64_t (*)(void))objc_opt_respondsToSelector)() & 1) != 0)
  {
    objc_initWeak(&location, self);
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100019C88;
    v7[3] = &unk_1000559D8;
    objc_copyWeak(&v8, &location);
    objc_msgSend(v4, "setFencesUpdateCallback:", v7);
    objc_destroyWeak(&v8);
    objc_destroyWeak(&location);
  }
  if ((objc_opt_respondsToSelector(v4, "setNetworkReachabilityUpdateCallback:") & 1) != 0)
  {
    objc_initWeak(&location, self);
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_100019CF0;
    v5[3] = &unk_100055A00;
    objc_copyWeak(&v6, &location);
    objc_msgSend(v4, "setNetworkReachabilityUpdateCallback:", v5);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }

}

- (void)locationManager:(id)a3 didEnterRegion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = sub_10001C4E8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_10003458C(v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received didEnterRegion from CoreLocation for region: %@"), v10));
  -[FMFFencesMgr showDebugFenceTriggerAlertIfNeededWithTitle:text:](self, "showDebugFenceTriggerAlertIfNeededWithTitle:text:", CFSTR("Received didEnterRegion from CoreLocation"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "location"));

  -[FMFFencesMgr _trigger:forRegionWithID:atLocation:](self, "_trigger:forRegionWithID:atLocation:", 0, v12, v13);
}

- (void)locationManager:(id)a3 didExitRegion:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v6 = a4;
  v7 = a3;
  v8 = sub_10001C4E8();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    sub_100034604(v6);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Received didExitRegion from CoreLocation for region: %@"), v10));
  -[FMFFencesMgr showDebugFenceTriggerAlertIfNeededWithTitle:text:](self, "showDebugFenceTriggerAlertIfNeededWithTitle:text:", CFSTR("Received didExitRegion from CoreLocation"), v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "location"));

  -[FMFFencesMgr _trigger:forRegionWithID:atLocation:](self, "_trigger:forRegionWithID:atLocation:", 1, v12, v13);
}

- (void)locationManager:(id)a3 didDetermineState:(int64_t)a4 forRegion:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;

  v8 = a3;
  v9 = a5;
  v10 = sub_10001C4E8();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_100034708(v9);

  if (a4)
  {
    if (a4 == 1)
      v12 = 2;
    else
      v12 = 3;
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "location"));
    -[FMFFencesMgr _trigger:forRegionWithID:atLocation:](self, "_trigger:forRegionWithID:atLocation:", v12, v13, v14);

  }
  else
  {
    v15 = sub_10001C4E8();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10003467C(v9, v16);

    AnalyticsSendEvent(CFSTR("com.apple.icloud.fmflocatord.ReliabilityMetric"), &off_10005B108);
  }

}

- (void)locationManager:(id)a3 didFailWithError:(id)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  const __CFString *v10;
  void *v11;

  v5 = a4;
  v6 = sub_10001C4E8();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    sub_100034780();

  v10 = CFSTR("locationManagerDidFailWithError");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr CLErrorAsString:](self, "CLErrorAsString:", objc_msgSend(v5, "code")));
  v11 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v11, &v10, 1));
  AnalyticsSendEvent(CFSTR("com.apple.icloud.fmflocatord.ReliabilityMetric"), v9);

}

- (void)locationManager:(id)a3 monitoringDidFailForRegion:(id)a4 withError:(id)a5
{
  id v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  void *v16;

  v7 = a4;
  v8 = a5;
  v9 = sub_10001C4E8();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    sub_1000347EC(v7, (uint64_t)v8, v10);

  v15 = CFSTR("locationManagerMonitoringDidFailForRegionError");
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FMFFencesMgr CLErrorAsString:](self, "CLErrorAsString:", objc_msgSend(v8, "code")));
  v16 = v11;
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v16, &v15, 1));
  AnalyticsSendEvent(CFSTR("com.apple.icloud.fmflocatord.ReliabilityMetric"), v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Monitoring failed for region with identifier: %@ (%@)"), v13, v8));
  -[FMFFencesMgr showDebugFenceTriggerAlertIfNeededWithTitle:text:](self, "showDebugFenceTriggerAlertIfNeededWithTitle:text:", CFSTR("Monitoring failed for region"), v14);

}

- (void)locationManager:(id)a3 didStartMonitoringForRegion:(id)a4
{
  id v4;
  id v5;
  NSObject *v6;

  v4 = a4;
  v5 = sub_10001C4E8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10003488C(v4);

  AnalyticsSendEvent(CFSTR("com.apple.icloud.fmflocatord.ReliabilityMetric"), &off_10005B130);
}

- (void)showDebugFenceTriggerAlertIfNeededWithTitle:(id)a3 text:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v5 = a4;
  if (qword_1000695F8 != -1)
    dispatch_once(&qword_1000695F8, &stru_100055A20);
  if (byte_1000695F0)
  {
    v6 = objc_alloc_init((Class)FMAlert);
    objc_msgSend(v6, "setCategory:", qword_100068E68);
    objc_msgSend(v6, "setMsgTitle:", v8);
    objc_msgSend(v6, "setMsgText:", v5);
    objc_msgSend(v6, "setShowMsgInLockScreen:", 1);
    objc_msgSend(v6, "setDismissMsgOnUnlock:", 0);
    objc_msgSend(v6, "setDismissMsgOnLock:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[FMAlertManager sharedInstance](FMAlertManager, "sharedInstance"));
    objc_msgSend(v7, "activateAlert:", v6);

  }
}

- (id)CLErrorAsString:(int64_t)a3
{
  if ((unint64_t)a3 >= 0x12)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a3));
  else
    return *(&off_100055A40 + a3);
}

- (NSString)triggerURL
{
  return self->_triggerURL;
}

- (void)setTriggerURL:(id)a3
{
  objc_storeStrong((id *)&self->_triggerURL, a3);
}

- (NSString)fenceVersion
{
  return self->_fenceVersion;
}

- (void)setFenceVersion:(id)a3
{
  objc_storeStrong((id *)&self->_fenceVersion, a3);
}

- (double)triggerValidityDuration
{
  return self->_triggerValidityDuration;
}

- (void)setTriggerValidityDuration:(double)a3
{
  self->_triggerValidityDuration = a3;
}

- (FMFFencesMgrDelegate)delegate
{
  return (FMFFencesMgrDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSArray)fencesToMonitor
{
  return self->_fencesToMonitor;
}

- (NSSet)allFences
{
  return self->_allFences;
}

- (NSDictionary)monitoredFences
{
  return self->_monitoredFences;
}

- (void)setLocMgr:(id)a3
{
  objc_storeStrong((id *)&self->_locMgr, a3);
}

- (FMDataArchiver)dataArchiver
{
  return self->_dataArchiver;
}

- (void)setDataArchiver:(id)a3
{
  objc_storeStrong((id *)&self->_dataArchiver, a3);
}

- (FenceProvider)fenceProvider
{
  return self->_fenceProvider;
}

- (FenceSchedulerProtocol)scheduler
{
  return self->_scheduler;
}

- (BOOL)isNetworkAvailable
{
  return self->_networkAvailable;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_scheduler, 0);
  objc_storeStrong((id *)&self->_fenceProvider, 0);
  objc_storeStrong((id *)&self->_dataArchiver, 0);
  objc_storeStrong((id *)&self->_locMgr, 0);
  objc_storeStrong((id *)&self->_monitoredFences, 0);
  objc_storeStrong((id *)&self->_allFences, 0);
  objc_storeStrong((id *)&self->_fencesToMonitor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_fenceVersion, 0);
  objc_storeStrong((id *)&self->_triggerURL, 0);
}

@end
