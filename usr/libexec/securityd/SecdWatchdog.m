@implementation SecdWatchdog

- (SecdWatchdog)init
{
  SecdWatchdog *v2;
  SecdWatchdog *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SecdWatchdog;
  v2 = -[SecdWatchdog init](&v5, "init");
  v3 = v2;
  if (v2)
  {
    *(_OWORD *)&v2->_runtimeSecondsBeforeWatchdog = xmmword_100248F00;
    *(_OWORD *)&v2->_checkPeriod = xmmword_100248F10;
    v2->_gracefulExitLeeway = 300;
    v2->_diskUsageLimit = 1048576000;
    v2->_diskUsageHigh = 0;
    -[SecdWatchdog activateTimer](v2, "activateTimer");
  }
  return v3;
}

- (unint64_t)secondsFromMachTime:(unint64_t)a3
{
  if (qword_100340CE0 != -1)
    dispatch_once(&qword_100340CE0, &stru_1002DAAF8);
  return qword_100340CE8 * a3 / 0x3B9ACA00;
}

- (void)runWatchdog
{
  __int128 v3;
  SecdWatchdog *v4;
  unint64_t v5;
  const void *v6;
  NSObject *v7;
  dispatch_time_t v8;
  dispatch_queue_global_t global_queue;
  NSObject *v10;
  double Current;
  const void *v12;
  NSObject *v13;
  unint64_t diskUsageLimit;
  int v15;
  unint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;

  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v44 = v3;
  v45 = v3;
  v42 = v3;
  v43 = v3;
  v40 = v3;
  v41 = v3;
  v38 = v3;
  v39 = v3;
  v36 = v3;
  v37 = v3;
  v34 = v3;
  v35 = v3;
  v32 = v3;
  v33 = v3;
  v30 = v3;
  v31 = v3;
  v28 = v3;
  v29 = v3;
  v26 = v3;
  v27 = v3;
  v24 = v3;
  v25 = v3;
  v22 = v3;
  v23 = v3;
  v20 = v3;
  v21 = v3;
  v18 = v3;
  v19 = v3;
  v17 = v3;
  if (objc_msgSend((id)objc_opt_class(self), "watchdogrusage:", &v17))
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = -[SecdWatchdog secondsFromMachTime:](v4, "secondsFromMachTime:", (_QWORD)v18);
    if (v5 <= v4->_runtimeSecondsBeforeWatchdog + v4->_rusageBaseline)
    {
      if (!v4->_diskUsageHigh && *((_QWORD *)&v31 + 1) > v4->_diskUsageLimit + v4->_diskUsageBaseLine)
      {
        if (objc_msgSend((id)objc_opt_class(v4), "triggerOSFaults")
          && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
        {
          diskUsageLimit = v4->_diskUsageLimit;
          v15 = 134217984;
          v16 = diskUsageLimit;
          _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "securityd have written more then %llu", (uint8_t *)&v15, 0xCu);
        }
        v4->_diskUsageHigh = 1;
      }
      Current = CFAbsoluteTimeGetCurrent();
      if (Current > v4->_lastCheckTime + (double)v4->_resetPeriod)
      {
        v12 = sub_10000EF14("SecWatchdog");
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v15) = 0;
          _os_log_debug_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "resetting watchdog monitoring interval ahead another 24 hours", (uint8_t *)&v15, 2u);
        }

        v4->_lastCheckTime = Current;
        v4->_rusageBaseline = v5;
        v4->_diskUsageHigh = 0;
        v4->_diskUsageBaseLine = *((_QWORD *)&v31 + 1);
      }
    }
    else
    {
      v6 = sub_10000EF14("SecCritical");
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v15) = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "SecWatchdog: watchdog has detected securityd/secd is using too much CPU - attempting to exit gracefully", (uint8_t *)&v15, 2u);
      }

      sub_1000345CC(CFSTR("securityd watchdog triggered"), 0x53C0000Cu);
      xpc_transaction_exit_clean();
      v8 = dispatch_time(0, 1000000000 * v4->_gracefulExitLeeway);
      global_queue = dispatch_get_global_queue(2, 0);
      v10 = objc_claimAutoreleasedReturnValue(global_queue);
      dispatch_after(v8, v10, &stru_1002DAB18);

    }
    objc_sync_exit(v4);

  }
}

- (void)activateTimer
{
  SecdWatchdog *v2;
  __int128 v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  dispatch_source_t v6;
  OS_dispatch_source *timer;
  NSObject *v8;
  _QWORD v9[4];
  id v10;
  id location;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;

  v2 = self;
  objc_sync_enter(v2);
  *(_QWORD *)&v3 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v3 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v39 = v3;
  v40 = v3;
  v37 = v3;
  v38 = v3;
  v35 = v3;
  v36 = v3;
  v33 = v3;
  v34 = v3;
  v31 = v3;
  v32 = v3;
  v29 = v3;
  v30 = v3;
  v27 = v3;
  v28 = v3;
  v25 = v3;
  v26 = v3;
  v23 = v3;
  v24 = v3;
  v21 = v3;
  v22 = v3;
  v19 = v3;
  v20 = v3;
  v17 = v3;
  v18 = v3;
  v15 = v3;
  v16 = v3;
  v13 = v3;
  v14 = v3;
  v12 = v3;
  objc_msgSend((id)objc_opt_class(v2), "watchdogrusage:", &v12);
  v2->_rusageBaseline = -[SecdWatchdog secondsFromMachTime:](v2, "secondsFromMachTime:", (_QWORD)v13);
  v2->_lastCheckTime = CFAbsoluteTimeGetCurrent();
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v2);
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  v6 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v5);
  timer = v2->_timer;
  v2->_timer = (OS_dispatch_source *)v6;

  dispatch_source_set_timer((dispatch_source_t)v2->_timer, 0, 1000000000 * v2->_checkPeriod, 1000000000 * v2->_checkPeriodLeeway);
  v8 = v2->_timer;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10002A204;
  v9[3] = &unk_1002EB598;
  objc_copyWeak(&v10, &location);
  dispatch_source_set_event_handler(v8, v9);
  dispatch_resume((dispatch_object_t)v2->_timer);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);
  objc_sync_exit(v2);

}

- (id)watchdogParameters
{
  SecdWatchdog *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[4];

  v2 = self;
  objc_sync_enter(v2);
  v9[0] = CFSTR("allowed-runtime");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", v2->_runtimeSecondsBeforeWatchdog));
  v10[0] = v3;
  v9[1] = CFSTR("reset-period");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v2->_resetPeriod));
  v10[1] = v4;
  v9[2] = CFSTR("check-period");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v2->_checkPeriod));
  v10[2] = v5;
  v9[3] = CFSTR("graceful-exit-time");
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithLong:](NSNumber, "numberWithLong:", v2->_gracefulExitLeeway));
  v10[3] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 4));

  objc_sync_exit(v2);
  return v7;
}

- (BOOL)setWatchdogParameters:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  SecdWatchdog *v8;
  id v9;
  OS_dispatch_source *timer;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  id location;
  NSErrorUserInfoKey v20;
  void *v21;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v8 = self;
  objc_sync_enter(v8);
  location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, v8);
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10002A09C;
  v16[3] = &unk_1002DAB40;
  objc_copyWeak(&v18, &location);
  v9 = v7;
  v17 = v9;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v16);
  dispatch_source_cancel((dispatch_source_t)v8->_timer);
  timer = v8->_timer;
  v8->_timer = 0;

  objc_destroyWeak(&v18);
  objc_destroyWeak(&location);
  objc_sync_exit(v8);

  -[SecdWatchdog activateTimer](v8, "activateTimer");
  v11 = objc_msgSend(v9, "count");
  v12 = v11;
  if (a4 && v11)
  {
    v20 = NSLocalizedDescriptionKey;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("failed to set parameters: %@"), v9));
    v21 = v13;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", CFSTR("com.apple.securityd.watchdog"), 0, v14));

  }
  return v12 == 0;
}

- (BOOL)diskUsageHigh
{
  return self->_diskUsageHigh;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timer, 0);
}

+ (id)watchdog
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002A394;
  block[3] = &unk_1002ED1A0;
  block[4] = a1;
  if (qword_100340CD8 != -1)
    dispatch_once(&qword_100340CD8, block);
  return (id)qword_100340CD0;
}

+ (BOOL)watchdogrusage:(rusage_info_v6 *)a3
{
  pid_t v4;

  v4 = getpid();
  return proc_pid_rusage(v4, 6, (rusage_info_t *)a3) == 0;
}

+ (BOOL)triggerOSFaults
{
  return 1;
}

@end
