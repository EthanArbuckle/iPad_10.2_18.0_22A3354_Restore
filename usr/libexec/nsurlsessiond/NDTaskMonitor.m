@implementation NDTaskMonitor

- (NDTaskMonitor)initWithTask:(id)a3 taskInfo:(id)a4 clientBundleIdentifier:(id)a5 secondaryIdentifier:(id)a6 monitoredApplication:(id)a7 priority:(int64_t)a8 options:(unint64_t)a9 queue:(id)a10
{
  id v17;
  NDTaskMonitor *v18;
  NDTaskMonitor *v19;
  void *v20;
  uint64_t v21;
  UMUserSyncTask *UMSyncTask;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;
  objc_super v29;

  v27 = a3;
  v28 = a4;
  v17 = a5;
  v26 = a6;
  v25 = a7;
  v24 = a10;
  v29.receiver = self;
  v29.super_class = (Class)NDTaskMonitor;
  v18 = -[NDTaskMonitor init](&v29, "init");
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_task, a3);
    objc_storeStrong((id *)&v19->_taskInfo, a4);
    objc_storeStrong((id *)&v19->_queue, a10);
    objc_storeStrong((id *)&v19->_clientBundleIdentifier, a5);
    objc_storeStrong((id *)&v19->_clientSecondaryIdentifier, a6);
    objc_storeStrong((id *)&v19->_monitoredApplication, a7);
    v19->_basePriority = a8;
    v19->_discretionary = a9 & 1;
    v19->_explicitlyDiscretionary = (a9 & 2) != 0;
    v19->_performsNonDiscretionaryThrougputMonitoring = (a9 & 4) != 0;
    v19->_mayBeDemotedToDiscretionary = (a9 & 8) != 0;
    -[NDApplication addObserver:](v19->_monitoredApplication, "addObserver:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserSyncStakeholder sharedStakeholder](NDUserSyncStakeholder, "sharedStakeholder"));
    v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "startUMTask:taskInfo:", v17, v28));
    UMSyncTask = v19->_UMSyncTask;
    v19->_UMSyncTask = (UMUserSyncTask *)v21;

    v19->_powerMonitorToken = -1;
  }

  return v19;
}

- (void)stopThroughputMonitoring
{
  NSObject *throughputTimer;
  OS_dispatch_source *v4;
  NSMutableArray *progressTimestamps;
  NSMutableArray *progressValues;

  throughputTimer = self->_throughputTimer;
  if (throughputTimer)
  {
    dispatch_source_cancel(throughputTimer);
    v4 = self->_throughputTimer;
    self->_throughputTimer = 0;

    progressTimestamps = self->_progressTimestamps;
    self->_progressTimestamps = 0;

    progressValues = self->_progressValues;
    self->_progressValues = 0;

    self->_throughputInterval = 0;
  }
}

- (void)applicationEnteredForeground:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10000E0BC;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)taskWillResume
{
  id v3;

  if (self->_discretionary && !self->_explicitlyDiscretionary)
  {
    if (-[NDApplication isForeground](self->_monitoredApplication, "isForeground"))
    {
      v3 = (id)objc_claimAutoreleasedReturnValue(-[NSURLSessionTask error:code:](self->_task, "error:code:", CFSTR("_nsurlsessiondErrorDomain"), 6));
      -[NSURLSessionTask cancel_with_error:](self->_task, "cancel_with_error:");

    }
  }
}

- (void)cancel
{
  void *v3;
  UMUserSyncTask *UMSyncTask;
  int powerMonitorToken;

  -[NDTaskMonitor stopThroughputMonitoring](self, "stopThroughputMonitoring");
  -[NDApplication removeObserver:](self->_monitoredApplication, "removeObserver:", self);
  if (self->_UMSyncTask)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserSyncStakeholder sharedStakeholder](NDUserSyncStakeholder, "sharedStakeholder"));
    objc_msgSend(v3, "endUMTask:", self->_UMSyncTask);

    UMSyncTask = self->_UMSyncTask;
    self->_UMSyncTask = 0;

  }
  powerMonitorToken = self->_powerMonitorToken;
  if (powerMonitorToken != -1)
    notify_cancel(powerMonitorToken);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_UMSyncTask, 0);
  objc_storeStrong((id *)&self->_monitoredApplication, 0);
  objc_storeStrong((id *)&self->_progressValues, 0);
  objc_storeStrong((id *)&self->_progressTimestamps, 0);
  objc_storeStrong((id *)&self->_throughputTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_clientSecondaryIdentifier, 0);
  objc_storeStrong((id *)&self->_clientBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_taskInfo, 0);
  objc_storeStrong((id *)&self->_task, 0);
}

- (double)currentThroughputThreshold
{
  return dbl_1000803A0[self->_throughputInterval] * 1024.0;
}

- (int64_t)currentIntervalEndDelta
{
  unint64_t throughputInterval;

  throughputInterval = self->_throughputInterval;
  if (throughputInterval)
    return (uint64_t)((dbl_100080358[throughputInterval] - dbl_100080358[throughputInterval - 1]) * 60.0 * 1000000000.0);
  else
    return 60000000000;
}

- (void)calculateThroughput
{
  NSMutableArray *v3;
  id v4;
  unint64_t v5;
  uint64_t v6;
  void *i;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  NSObject *v17;
  void *v18;
  void *v19;
  NSMutableArray *progressValues;
  NSMutableArray *progressTimestamps;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  double v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  NSMutableArray *v34;
  __int16 v35;
  NSMutableArray *v36;
  _BYTE v37[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = self->_progressValues;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
  if (v4)
  {
    v5 = 0;
    v6 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v24 != v6)
          objc_enumerationMutation(v3);
        v5 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "unsignedIntegerValue", (_QWORD)v23);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v37, 16);
    }
    while (v4);
    v8 = (double)v5;
  }
  else
  {
    v8 = 0.0;
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray firstObject](self->_progressTimestamps, "firstObject"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_progressTimestamps, "lastObject"));
  objc_msgSend(v10, "doubleValue");
  v12 = v11;
  objc_msgSend(v9, "doubleValue");
  v14 = v13;
  -[NDTaskMonitor currentThroughputThreshold](self, "currentThroughputThreshold");
  v15 = v8 / (v12 - v14);
  if (v15 < v16)
  {
    v17 = (id)qword_1000C7158;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTask _loggableDescription](self->_task, "_loggableDescription"));
      -[NDTaskMonitor currentThroughputThreshold](self, "currentThroughputThreshold");
      progressTimestamps = self->_progressTimestamps;
      progressValues = self->_progressValues;
      *(_DWORD *)buf = 138544386;
      v28 = v19;
      v29 = 2048;
      v30 = v15;
      v31 = 2048;
      v32 = v22;
      v33 = 2112;
      v34 = progressValues;
      v35 = 2112;
      v36 = progressTimestamps;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%{public}@ canceling because of low throughput monitoring! Current throughput: %f bytes/sec, current threshold: %f bytes/sec, samples %@/%@", buf, 0x34u);

    }
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NSURLSessionTask error:code:](self->_task, "error:code:", CFSTR("_nsurlsessiondErrorDomain"), 3));
    -[NSURLSessionTask cancel_with_error:](self->_task, "cancel_with_error:", v18);

  }
}

- (void)setThroughputTimerForCurrentInterval
{
  NSObject *throughputTimer;
  NSObject *v4;
  dispatch_time_t v5;
  _QWORD handler[5];

  throughputTimer = self->_throughputTimer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10005CE0C;
  handler[3] = &unk_1000B23A0;
  handler[4] = self;
  dispatch_source_set_event_handler(throughputTimer, handler);
  v4 = self->_throughputTimer;
  v5 = dispatch_time(0, -[NDTaskMonitor currentIntervalEndDelta](self, "currentIntervalEndDelta"));
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)taskTransferredData:(int64_t)a3 countOfBytesReceived:(int64_t)a4
{
  CFAbsoluteTime Current;
  void *v8;
  double v9;
  CFAbsoluteTime v10;
  NSMutableArray *progressValues;
  void *v12;
  NSMutableArray *progressTimestamps;
  uint64_t v14;
  void *v15;
  void *v16;

  if (!self->_hasTransferredData)
    -[NDTaskMonitor startThroughputMonitoringIfAppropriate](self, "startThroughputMonitoringIfAppropriate");
  self->_hasTransferredData = 1;
  Current = CFAbsoluteTimeGetCurrent();
  if (!-[NSMutableArray count](self->_progressTimestamps, "count"))
    self->_throughputMonitoringStartTime = Current;
  if (-[NSMutableArray count](self->_progressTimestamps, "count")
    && (v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_progressTimestamps, "lastObject")),
        objc_msgSend(v8, "doubleValue"),
        v10 = Current - v9,
        v8,
        v10 <= 1.0))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_progressValues, "lastObject"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)objc_msgSend(v16, "unsignedIntegerValue") + a4 + a3));

    -[NSMutableArray removeLastObject](self->_progressValues, "removeLastObject");
    -[NSMutableArray addObject:](self->_progressValues, "addObject:", v15);
  }
  else
  {
    if ((unint64_t)-[NSMutableArray count](self->_progressTimestamps, "count") >= 0xA)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_progressTimestamps, "removeObjectAtIndex:", 0);
      -[NSMutableArray removeObjectAtIndex:](self->_progressValues, "removeObjectAtIndex:", 0);
    }
    progressValues = self->_progressValues;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLongLong:](NSNumber, "numberWithLongLong:", a4 + a3));
    -[NSMutableArray addObject:](progressValues, "addObject:", v12);

    progressTimestamps = self->_progressTimestamps;
    v14 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
    -[NSMutableArray addObject:](progressTimestamps, "addObject:", v14);
    v15 = (void *)v14;
  }

  if ((unint64_t)-[NSMutableArray count](self->_progressTimestamps, "count") >= 0xA
    && Current - self->_throughputMonitoringStartTime >= 15.0)
  {
    -[NDTaskMonitor calculateThroughput](self, "calculateThroughput");
  }
}

- (void)startThroughputMonitoring
{
  NSMutableArray *v3;
  NSMutableArray *progressTimestamps;
  NSMutableArray *v5;
  NSMutableArray *progressValues;
  OS_dispatch_source *v7;
  OS_dispatch_source *throughputTimer;

  if (!self->_throughputTimer)
  {
    v3 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    progressTimestamps = self->_progressTimestamps;
    self->_progressTimestamps = v3;

    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    progressValues = self->_progressValues;
    self->_progressValues = v5;

    self->_throughputInterval = 0;
    v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    throughputTimer = self->_throughputTimer;
    self->_throughputTimer = v7;

    -[NDTaskMonitor setThroughputTimerForCurrentInterval](self, "setThroughputTimerForCurrentInterval");
    dispatch_resume((dispatch_object_t)self->_throughputTimer);
  }
}

- (void)startThroughputMonitoringIfAppropriate
{
  void *v3;
  unsigned int v4;
  uint64_t v5;
  int *p_powerMonitorToken;
  NSObject *queue;
  NDApplication *monitoredApplication;
  _QWORD handler[5];

  if (self->_discretionary
    || self->_performsNonDiscretionaryThrougputMonitoring
    && self->_basePriority == 300
    && (monitoredApplication = self->_monitoredApplication) != 0
    && !-[NDApplication isForeground](monitoredApplication, "isForeground"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[Daemon sharedDaemon](Daemon, "sharedDaemon"));
    v4 = objc_msgSend(v3, "isInSyncBubble");

    if (v4)
    {
      p_powerMonitorToken = &self->_powerMonitorToken;
      if (self->_powerMonitorToken == -1)
      {
        queue = self->_queue;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 3221225472;
        handler[2] = sub_10005CDD4;
        handler[3] = &unk_1000B1DA0;
        handler[4] = self;
        v5 = notify_register_dispatch("com.apple.system.powersources.source", p_powerMonitorToken, queue, handler);
      }
      if ((IOPSDrawingUnlimitedPower(v5, p_powerMonitorToken) & 1) == 0)
        -[NDTaskMonitor startThroughputMonitoring](self, "startThroughputMonitoring");
    }
    else
    {
      -[NDTaskMonitor startThroughputMonitoring](self, "startThroughputMonitoring");
    }
  }
}

- (void)applicationWasQuitFromAppSwitcher:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005CD24;
  v7[3] = &unk_1000B23F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)backgroundUpdatesDisabledForApplication:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005CC68;
  v7[3] = &unk_1000B23F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)applicationNoLongerInForeground:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CC20;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)applicationEndedTransitionalDiscretionaryBackgroundPeriod:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005CB7C;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (int64_t)basePriority
{
  return self->_basePriority;
}

- (void)setBasePriority:(int64_t)a3
{
  self->_basePriority = a3;
}

@end
