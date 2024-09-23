@implementation NDAVThroughputMonitor

- (NDAVThroughputMonitor)initWithWrapper:(id)a3 monitoredApplication:(id)a4 priority:(int64_t)a5 options:(unint64_t)a6 queue:(id)a7
{
  char v8;
  id v13;
  id v14;
  id v15;
  NDAVThroughputMonitor *v16;
  NDAVThroughputMonitor *v17;
  objc_super v19;

  v8 = a6;
  v13 = a3;
  v14 = a4;
  v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)NDAVThroughputMonitor;
  v16 = -[NDAVThroughputMonitor init](&v19, "init");
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_wrapper, a3);
    objc_storeStrong((id *)&v17->_queue, a7);
    objc_storeStrong((id *)&v17->_monitoredApplication, a4);
    v17->_basePriority = a5;
    v17->_discretionary = v8 & 1;
    v17->_explicitlyDiscretionary = (v8 & 2) != 0;
    v17->_performsNonDiscretionaryThroughputMonitoring = (v8 & 4) != 0;
    -[NDApplication addObserver:](v17->_monitoredApplication, "addObserver:", v17);
  }

  return v17;
}

- (void)cancel
{
  -[NDAVThroughputMonitor stopThroughputMonitoring](self, "stopThroughputMonitoring");
  -[NDApplication removeObserver:](self->_monitoredApplication, "removeObserver:", self);
}

- (void)wrapperTransferredData:(unint64_t)a3
{
  CFAbsoluteTime Current;
  void *v6;
  double v7;
  CFAbsoluteTime v8;
  NSMutableArray *progressTimestamps;
  void *v10;
  NSMutableArray *progressValues;
  uint64_t v12;
  void *v13;
  void *v14;

  if (!self->_hasTransferredData)
    -[NDAVThroughputMonitor startThroughputMonitoringIfAppropriate](self, "startThroughputMonitoringIfAppropriate");
  self->_hasTransferredData = 1;
  Current = CFAbsoluteTimeGetCurrent();
  if (!-[NSMutableArray count](self->_progressTimestamps, "count"))
    self->_throughputMonitoringStartTime = Current;
  if (-[NSMutableArray count](self->_progressTimestamps, "count")
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_progressTimestamps, "lastObject")),
        objc_msgSend(v6, "doubleValue"),
        v8 = Current - v7,
        v6,
        v8 <= 1.0))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_progressValues, "lastObject"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", (char *)objc_msgSend(v14, "unsignedLongLongValue") + a3));

    -[NSMutableArray removeLastObject](self->_progressValues, "removeLastObject");
    -[NSMutableArray addObject:](self->_progressValues, "addObject:", v13);
  }
  else
  {
    if ((unint64_t)-[NSMutableArray count](self->_progressTimestamps, "count") >= 0xA)
    {
      -[NSMutableArray removeObjectAtIndex:](self->_progressTimestamps, "removeObjectAtIndex:", 0);
      -[NSMutableArray removeObjectAtIndex:](self->_progressValues, "removeObjectAtIndex:", 0);
    }
    progressTimestamps = self->_progressTimestamps;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", Current));
    -[NSMutableArray addObject:](progressTimestamps, "addObject:", v10);

    progressValues = self->_progressValues;
    v12 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a3));
    -[NSMutableArray addObject:](progressValues, "addObject:", v12);
    v13 = (void *)v12;
  }

  if ((unint64_t)-[NSMutableArray count](self->_progressTimestamps, "count") >= 0xA
    && Current - self->_throughputMonitoringStartTime >= 15.0)
  {
    -[NDAVThroughputMonitor calculateThroughput](self, "calculateThroughput");
  }
}

- (void)startThroughputMonitoringIfAppropriate
{
  NDApplication *monitoredApplication;

  if (self->_discretionary
    || self->_performsNonDiscretionaryThroughputMonitoring
    && self->_basePriority == 300
    && (monitoredApplication = self->_monitoredApplication) != 0
    && !-[NDApplication isForeground](monitoredApplication, "isForeground"))
  {
    -[NDAVThroughputMonitor startThroughputMonitoring](self, "startThroughputMonitoring");
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

    -[NDAVThroughputMonitor setThroughputTimerForCurrentInterval](self, "setThroughputTimerForCurrentInterval");
    dispatch_resume((dispatch_object_t)self->_throughputTimer);
  }
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
  double v28;
  __int16 v29;
  uint64_t v30;
  __int16 v31;
  NSMutableArray *v32;
  __int16 v33;
  NSMutableArray *v34;
  _BYTE v35[128];

  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = self->_progressValues;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
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
        v5 += (unint64_t)objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * (_QWORD)i), "unsignedLongLongValue", (_QWORD)v23);
      }
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
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
  -[NDAVThroughputMonitor currentIntervalThroughputThreshold](self, "currentIntervalThroughputThreshold");
  v15 = v8 / (v12 - v14);
  if (v15 < v16)
  {
    v17 = (id)qword_1000C7158;
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      -[NDAVThroughputMonitor currentIntervalThroughputThreshold](self, "currentIntervalThroughputThreshold");
      progressTimestamps = self->_progressTimestamps;
      progressValues = self->_progressValues;
      *(_DWORD *)buf = 134218754;
      v28 = v15;
      v29 = 2048;
      v30 = v22;
      v31 = 2112;
      v32 = progressValues;
      v33 = 2112;
      v34 = progressTimestamps;
      _os_log_error_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Canceling AVAssetTask because of low throughput monitoring! Current throughput: %f bytes/sec, current threshold: %f bytes/sec, samples %@/%@", buf, 0x2Au);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[NDAVAssetDownloadSessionWrapper URL](self->_wrapper, "URL"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLError _web_errorWithDomain:code:URL:](NSURLError, "_web_errorWithDomain:code:URL:", CFSTR("_nsurlsessiondErrorDomain"), 3, v18));

    -[NDAVAssetDownloadSessionWrapper cancelAndDeliverError:](self->_wrapper, "cancelAndDeliverError:", v19);
  }

}

- (int64_t)currentIntervalDuration
{
  unint64_t throughputInterval;

  throughputInterval = self->_throughputInterval;
  if (throughputInterval)
    return (uint64_t)((dbl_100080358[throughputInterval] - dbl_100080358[throughputInterval - 1]) * 60.0 * 1000000000.0);
  else
    return 60000000000;
}

- (double)currentIntervalThroughputThreshold
{
  return dbl_1000803A0[self->_throughputInterval] * 1024.0;
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
  handler[2] = sub_100063778;
  handler[3] = &unk_1000B23A0;
  handler[4] = self;
  dispatch_source_set_event_handler(throughputTimer, handler);
  v4 = self->_throughputTimer;
  v5 = dispatch_time(0, -[NDAVThroughputMonitor currentIntervalDuration](self, "currentIntervalDuration"));
  dispatch_source_set_timer(v4, v5, 0xFFFFFFFFFFFFFFFFLL, 0x3B9ACA00uLL);
}

- (void)applicationEnteredForeground:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100063710;
  block[3] = &unk_1000B23A0;
  block[4] = self;
  dispatch_async(queue, block);
}

- (void)applicationNoLongerInForeground:(id)a3
{
  NSObject *queue;
  _QWORD block[5];

  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000636F4;
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoredApplication, 0);
  objc_storeStrong((id *)&self->_progressValues, 0);
  objc_storeStrong((id *)&self->_progressTimestamps, 0);
  objc_storeStrong((id *)&self->_throughputTimer, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_wrapper, 0);
}

@end
