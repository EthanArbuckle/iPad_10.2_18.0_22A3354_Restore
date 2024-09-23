uint64_t start()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  id v6;
  dispatch_queue_global_t global_queue;
  NSObject *v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  pid_t v14;
  void **v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  pid_t v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;

  v0 = objc_autoreleasePoolPush();
  v1 = (void *)MGCopyAnswer(CFSTR("BuildVersion"), 0);
  v2 = (void *)MGCopyAnswer(CFSTR("HWModelStr"), 0);
  v3 = _ATLogCategoryFramework();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109634;
    v23 = getpid();
    v24 = 2114;
    v25 = v2;
    v26 = 2114;
    v27 = v1;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "ATC starting up. PID:%d, deviceModel=%{public}@, buildVersion=%{public}@", buf, 0x1Cu);
  }

  NSSetUncaughtExceptionHandler((NSUncaughtExceptionHandler *)sub_1000034CC);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[ATDeviceService sharedInstance](ATDeviceService, "sharedInstance"));
  v6 = objc_msgSend(objc_alloc((Class)MSVXPCTransaction), "initWithName:", CFSTR("com.apple.atc.startup"));
  objc_msgSend(v6, "beginTransaction");
  +[ATSession setSessionHost:](ATSession, "setSessionHost:", 1);
  global_queue = dispatch_get_global_queue(0, 0);
  v8 = objc_claimAutoreleasedReturnValue(global_queue);
  v16 = _NSConcreteStackBlock;
  v17 = 3221225472;
  v18 = sub_10000359C;
  v19 = &unk_100004108;
  v9 = v5;
  v20 = v9;
  v21 = v6;
  v10 = v6;
  dispatch_async(v8, &v16);

  objc_autoreleasePoolPop(v0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop", v16, v17, v18, v19));
  objc_msgSend(v11, "run");

  v12 = _ATLogCategoryFramework();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = getpid();
    *(_DWORD *)buf = 67109120;
    v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "ATC shutting down, PID:%d", buf, 8u);
  }

  objc_msgSend(v9, "stop");
  return 0;
}

void sub_1000034CC(void *a1)
{
  id v1;
  uint64_t v2;
  NSObject *v3;
  void *v4;
  int v5;
  id v6;
  __int16 v7;
  void *v8;

  v1 = a1;
  v2 = _ATLogCategoryFramework();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "callStackSymbols"));
    v5 = 138543618;
    v6 = v1;
    v7 = 2114;
    v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_FAULT, "Uncaught exception in ATC, crashing: %{public}@, %{public}@", (uint8_t *)&v5, 0x16u);

  }
}

void sub_10000359C(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  int v8;
  uint64_t v9;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  ATWaitForSpringBoard(300.0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v3, "timeIntervalSinceDate:", v2);
  v5 = v4;

  v6 = _ATLogCategoryFramework();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = 134217984;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "---Waited for SB: %.1fs---", (uint8_t *)&v8, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "run");
  objc_msgSend(*(id *)(a1 + 40), "endTransaction");

}

id objc_msgSend_beginTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "beginTransaction");
}

id objc_msgSend_callStackSymbols(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "callStackSymbols");
}

id objc_msgSend_date(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "date");
}

id objc_msgSend_endTransaction(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endTransaction");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_setSessionHost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSessionHost:");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_stop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stop");
}

id objc_msgSend_timeIntervalSinceDate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timeIntervalSinceDate:");
}
