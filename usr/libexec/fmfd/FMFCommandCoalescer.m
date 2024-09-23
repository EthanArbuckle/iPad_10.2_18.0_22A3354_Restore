@implementation FMFCommandCoalescer

- (void)_sendRefreshOfType:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[FMFCommandCoalescer queue](self, "queue"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10000E674;
  v7[3] = &unk_100099348;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (double)_timeTillMinCallback
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFCommandManager sharedInstance](FMFCommandManager, "sharedInstance"));
  objc_msgSend(v2, "lastSuccessfulResponseTimestamp");
  v4 = v3;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v5, "minCallbackInterval");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v8, "timeIntervalSince1970");
  v10 = v9 - v4;

  return v7 - v10;
}

- (void)refreshLocationForHandles:(id)a3 forSession:(id)a4 callerId:(id)a5 priority:(int64_t)a6 reason:(int64_t)a7 completionBlock:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  id v20;
  id v21;
  id v22;
  _QWORD block[5];
  id v24;
  id v25;
  id v26;
  id v27;
  int64_t v28;
  int64_t v29;

  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a8;
  v18 = objc_claimAutoreleasedReturnValue(-[FMFCommandCoalescer queue](self, "queue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005F70;
  block[3] = &unk_10009A810;
  block[4] = self;
  v24 = v14;
  v25 = v15;
  v26 = v16;
  v28 = a6;
  v29 = a7;
  v27 = v17;
  v19 = v17;
  v20 = v16;
  v21 = v15;
  v22 = v14;
  dispatch_async(v18, block);

}

- (void)_scheduleRefresh
{
  int64_t v3;
  id v4;
  NSObject *v5;
  void *v6;
  char *v7;
  char *v8;
  char v9;
  id v10;
  NSObject *v11;
  void *v12;
  const __CFString *v13;
  uint64_t v14;
  char *v15;
  id v16;
  NSObject *v17;
  void *v18;
  const __CFString *v19;
  dispatch_time_t v20;
  NSObject *v21;
  id v22;
  void *v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  id v27;
  char *v28;
  _QWORD block[4];
  id v30[3];
  char v31;
  id location;
  uint8_t buf[4];
  void *v34;
  __int16 v35;
  const __CFString *v36;
  __int16 v37;
  char *v38;

  v3 = -[FMFCommandCoalescer coleasedRefreshPriority](self, "coleasedRefreshPriority");
  if ((id)-[FMFCommandCoalescer refreshScheduled](self, "refreshScheduled") == (id)2)
  {
    v4 = sub_100011D0C();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]"));
      *(_DWORD *)buf = 138412290;
      v34 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Skipping since we already have a high priority refresh queued", buf, 0xCu);

    }
LABEL_4:

    return;
  }
  if (v3 == 1)
  {
    -[FMFCommandCoalescer _highPriorityRefreshInterval](self, "_highPriorityRefreshInterval");
    v8 = v7;
    v9 = 1;
  }
  else
  {
    if (-[FMFCommandCoalescer refreshScheduled](self, "refreshScheduled")
      || (v26 = (void *)objc_claimAutoreleasedReturnValue(-[FMFCommandCoalescer coalescedCommands](self, "coalescedCommands")),
          v27 = objc_msgSend(v26, "count"),
          v26,
          !v27))
    {
      v22 = sub_100011D0C();
      v5 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]"));
        *(_DWORD *)buf = 138412290;
        v34 = v23;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%@ Returning since there is no need to schedule a refresh", buf, 0xCu);

      }
      goto LABEL_4;
    }
    -[FMFCommandCoalescer _timeTillMinCallback](self, "_timeTillMinCallback");
    v8 = v28;
    v9 = 0;
  }
  v10 = sub_100011D0C();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]"));
    v13 = CFSTR("lowPriority");
    *(_DWORD *)buf = 138412802;
    v34 = v12;
    if (v3 == 1)
      v13 = CFSTR("highPriority");
    v35 = 2112;
    v36 = v13;
    v37 = 2048;
    v38 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%@ Trying to schedule a %@ refresh after %f", buf, 0x20u);

  }
  if (v3 == 1)
    v14 = 2;
  else
    v14 = 1;
  -[FMFCommandCoalescer setRefreshScheduled:](self, "setRefreshScheduled:", v14);
  if (*(double *)&v8 <= 0.0)
  {
    v24 = CFSTR("lowPriority");
    if (v3 == 1)
      v24 = CFSTR("highPriority");
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("immediate-%@(after %f)"), v24, v8));
    -[FMFCommandCoalescer _sendRefreshOfType:](self, "_sendRefreshOfType:", v25);

  }
  else
  {
    v15 = (char *)-[FMFCommandCoalescer sequencer](self, "sequencer") + 1;
    -[FMFCommandCoalescer setSequencer:](self, "setSequencer:", v15);
    objc_initWeak(&location, self);
    v16 = sub_100011D0C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[FMFCommandCoalescer _scheduleRefresh]"));
      v19 = CFSTR("lowPriority");
      *(_DWORD *)buf = 138412802;
      v34 = v18;
      if (v3 == 1)
        v19 = CFSTR("highPriority");
      v35 = 2112;
      v36 = v19;
      v37 = 2048;
      v38 = v15;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%@ Queuing a dispatch_after for request(%@) with sequenceNumber: %ld", buf, 0x20u);

    }
    v20 = dispatch_time(0, (uint64_t)(*(double *)&v8 * 1000000000.0));
    v21 = objc_claimAutoreleasedReturnValue(-[FMFCommandCoalescer queue](self, "queue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10003A990;
    block[3] = &unk_10009A7E8;
    objc_copyWeak(v30, &location);
    v30[1] = v15;
    v31 = v9;
    v30[2] = v8;
    dispatch_after(v20, v21, block);

    objc_destroyWeak(v30);
    objc_destroyWeak(&location);
  }
}

- (int64_t)refreshScheduled
{
  return self->_refreshScheduled;
}

- (NSMutableArray)coalescedCommands
{
  return self->_coalescedCommands;
}

- (int64_t)coleasedRefreshPriority
{
  return self->_coleasedRefreshPriority;
}

- (void)setRefreshScheduled:(int64_t)a3
{
  self->_refreshScheduled = a3;
}

- (void)setColeasedRefreshPriority:(int64_t)a3
{
  self->_coleasedRefreshPriority = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

+ (id)sharedInstance
{
  if (qword_1000B3808 != -1)
    dispatch_once(&qword_1000B3808, &stru_10009A770);
  return (id)qword_1000B3800;
}

- (double)_highPriorityRefreshInterval
{
  void *v2;
  double v3;
  double v4;
  double result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[FMFDataManager sharedInstance](FMFDataManager, "sharedInstance"));
  objc_msgSend(v2, "userLocateWaitIntervalInMS");
  v4 = v3;

  result = v4 / 1000.0;
  if (v4 <= 0.0)
    return 0.2;
  return result;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (int64_t)sequencer
{
  return self->_sequencer;
}

- (void)setSequencer:(int64_t)a3
{
  self->_sequencer = a3;
}

- (void)setCoalescedCommands:(id)a3
{
  objc_storeStrong((id *)&self->_coalescedCommands, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_coalescedCommands, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
