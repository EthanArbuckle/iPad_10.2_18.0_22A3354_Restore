uint64_t start()
{
  void *v0;
  os_log_t v1;
  void *v2;
  NSObject *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  uint64_t v19;

  v0 = objc_autoreleasePoolPush();
  v1 = os_log_create("com.apple.Coordination", "Daemon");
  v2 = (void *)qword_100008040;
  qword_100008040 = (uint64_t)v1;

  if ((_set_user_dir_suffix("com.apple.coordinated") & 1) == 0)
  {
    v3 = qword_100008040;
    if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
      sub_1000035E4(v3);
  }
  if (objc_opt_class(MGDaemon))
  {
    v4 = objc_claimAutoreleasedReturnValue(+[MGDaemon daemon](MGDaemon, "daemon"));
    v5 = (void *)qword_100008048;
    qword_100008048 = v4;

    v6 = qword_100008040;
    if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v19 = qword_100008048;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "coordinated set up MGDaemon: %p", buf, 0xCu);
    }
    v7 = objc_alloc((Class)COHomeKitAdapter);
    v8 = objc_msgSend(v7, "initWithHomeManager:MediaGroupsDaemon:", 0, qword_100008048);
    +[COHomeKitAdapter setSharedInstance:](COHomeKitAdapter, "setSharedInstance:", v8);
    objc_initWeak((id *)buf, v8);
    v9 = (void *)qword_100008048;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100003568;
    v16[3] = &unk_1000040F0;
    objc_copyWeak(&v17, (id *)buf);
    objc_msgSend(v9, "setTopologyRequestHandler:", v16);
    objc_destroyWeak(&v17);
    objc_destroyWeak((id *)buf);

  }
  v10 = MGGetSInt32Answer(CFSTR("DeviceClassNumber"), 0xFFFFFFFFLL);
  if (v10 == 7)
    v11 = 4096;
  else
    v11 = -1;
  if ((_os_feature_enabled_impl("DistributedTimers", "ReplaceCoordination") & (v10 == 7)) == 1)
  {
    v12 = qword_100008040;
    if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "forcing constituent type to 'no-service'", buf, 2u);
    }
    v11 = 4026531840;
  }
  v13 = qword_100008040;
  if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v19 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "coordinated starting up with constituent type: 0x%lx", buf, 0xCu);
  }
  +[COCoordinationService startWithConstituentType:](COCoordinationService, "startWithConstituentType:", v11);
  objc_autoreleasePoolPop(v0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v14, "run");

  return 0;
}

void sub_100003544(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100003568(uint64_t a1)
{
  id WeakRetained;
  NSObject *v2;
  uint8_t v3[16];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = qword_100008040;
    if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "coordinated handling topology request", v3, 2u);
    }
    objc_msgSend(WeakRetained, "prewarm");
  }

}

void sub_1000035E4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "_set_user_dir_suffix failed!", v1, 2u);
}

id objc_msgSend_daemon(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "daemon");
}

id objc_msgSend_initWithHomeManager_MediaGroupsDaemon_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithHomeManager:MediaGroupsDaemon:");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_prewarm(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prewarm");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_setSharedInstance_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSharedInstance:");
}

id objc_msgSend_setTopologyRequestHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTopologyRequestHandler:");
}

id objc_msgSend_startWithConstituentType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startWithConstituentType:");
}
