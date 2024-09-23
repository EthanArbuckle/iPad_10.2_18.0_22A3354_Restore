uint64_t start()
{
  id v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  NSObject *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  uint64_t description;
  void *v20;
  id v21;
  NSObject *v22;
  uint8_t buf[8];
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  id v29;
  id v30;
  _QWORD *v31;
  _QWORD v32[5];
  id v33;
  uint8_t v34[4];
  uint64_t v35;

  v0 = (id)objc_opt_new(ARMainDaemonConfiguration);
  v32[0] = 0;
  v32[1] = v32;
  v32[2] = 0x3032000000;
  v32[3] = sub_1000025F0;
  v32[4] = sub_100002600;
  v33 = 0;
  v1 = objc_autoreleasePoolPush();
  v2 = (void *)objc_opt_new(ARSystemTimeSnapshot);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@:init"), v4));

  v6 = objc_retainAutorelease(v5);
  v7 = (void *)os_transaction_create(objc_msgSend(v6, "UTF8String"));
  v8 = sub_100002608();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Spawned", buf, 2u);
  }

  if (objc_msgSend(v0, "supportsWatchdog"))
    v10 = (void *)objc_opt_new(ARWatchdogMonitor);
  else
    v10 = 0;
  v11 = &_dispatch_main_q;
  objc_msgSend(v10, "addQueue:hangPolicy:", &_dispatch_main_q, 1);

  v12 = ARCreateFixedPriorityDispatchQueue("com.apple.arkit.daemon.initQueue", 0);
  v13 = objc_claimAutoreleasedReturnValue(v12);
  objc_msgSend(v10, "addQueue:hangPolicy:", v13, 0);
  *(_QWORD *)buf = _NSConcreteStackBlock;
  v25 = 3221225472;
  v26 = sub_100002648;
  v27 = &unk_100004248;
  v14 = v10;
  v28 = v14;
  v15 = v0;
  v29 = v15;
  v31 = v32;
  v16 = v2;
  v30 = v16;
  dispatch_async_and_wait(v13, buf);
  v17 = sub_100002608();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    description = os_transaction_get_description(v7);
    *(_DWORD *)v34 = 136446210;
    v35 = description;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Releasing %{public}s transaction", v34, 0xCu);
  }

  objc_autoreleasePoolPop(v1);
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop mainRunLoop](NSRunLoop, "mainRunLoop"));
  objc_msgSend(v20, "run");

  v21 = sub_100002608();
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)v34 = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Exiting unexpectedly", v34, 2u);
  }

  _Block_object_dispose(v32, 8);
  return 1;
}

void sub_1000025C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1000025F0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100002600(uint64_t a1)
{

}

id sub_100002608()
{
  if (qword_1000080F0 != -1)
    dispatch_once(&qword_1000080F0, &stru_100004288);
  return (id)qword_1000080E8;
}

void sub_100002648(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  id v5;
  NSString *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  void *v23;
  id v24;
  void ***v25;
  void *v26;
  _UNKNOWN **v27;
  void **v28;
  uint64_t v29;
  void (*v30)(uint64_t, int);
  void *v31;
  id v32;
  id location;
  __int128 buf;
  void (*v35)(uint64_t);
  void *v36;
  _UNKNOWN **v37;
  void *v38;
  void ***v39;

  objc_msgSend(*(id *)(a1 + 32), "updateStatus:", 1);
  v2 = *(id *)(a1 + 40);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));

  v5 = objc_retainAutorelease(v4);
  if (_set_user_dir_suffix(objc_msgSend(v5, "UTF8String")))
  {
    v6 = NSTemporaryDirectory();
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = sub_100002608();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138477827;
      *(_QWORD *)((char *)&buf + 4) = v7;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Sandbox temporary directory: %{private}@", (uint8_t *)&buf, 0xCu);
    }

  }
  else
  {
    v10 = sub_100002BD8();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      LOWORD(buf) = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to setup sandbox temporary directory!", (uint8_t *)&buf, 2u);
    }

    if (qword_100008110 != -1)
      dispatch_once(&qword_100008110, &stru_1000042C8);
    if (!byte_100008108)
      sub_100002E04();
  }

  if (objc_msgSend(v2, "hasLibraryDirectoryReadWriteAccess"))
  {
    v12 = ARLibraryDirectory();
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    location = 0;
    v15 = objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &location);
    v16 = location;

    if (v15)
    {
      v17 = sub_100002608();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138477827;
        *(_QWORD *)((char *)&buf + 4) = v13;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Sandbox library directory: %{private}@", (uint8_t *)&buf, 0xCu);
      }

    }
    else
    {
      v19 = sub_100002BD8();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(_QWORD *)((char *)&buf + 4) = v16;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to setup sandbox library directory with error: %@", (uint8_t *)&buf, 0xCu);
      }

      if (qword_100008110 != -1)
        dispatch_once(&qword_100008110, &stru_1000042C8);
      if (!byte_100008108)
        sub_100002D9C((uint64_t)v16);
    }

  }
  v21 = objc_msgSend(objc_alloc((Class)ARDaemon), "initWithConfiguration:spawnTime:watchdogMonitor:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 32));
  v22 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v23 = *(void **)(v22 + 40);
  *(_QWORD *)(v22 + 40) = v21;

  objc_initWeak(&location, *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40));
  v24 = &_dispatch_main_q;
  v28 = _NSConcreteStackBlock;
  v29 = 3221225472;
  v30 = sub_100002A88;
  v31 = &unk_100004220;
  objc_copyWeak(&v32, &location);
  v25 = &v28;
  *(_QWORD *)&buf = _NSConcreteStackBlock;
  *((_QWORD *)&buf + 1) = 3221225472;
  v35 = sub_100002C78;
  v36 = &unk_100004318;
  v37 = &off_100004440;
  v38 = &_dispatch_main_q;
  v39 = v25;
  if (qword_100008120 == -1)
  {
    v26 = &_dispatch_main_q;
    v27 = &off_100004440;
  }
  else
  {
    dispatch_once(&qword_100008120, &buf);
    v26 = v38;
    v25 = v39;
    v27 = v37;
  }

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "startup", v28, v29, v30, v31);
  objc_destroyWeak(&v32);
  objc_destroyWeak(&location);
}

void sub_100002A64(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100002A88(uint64_t a1, int a2)
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id WeakRetained;
  int v9;
  void *v10;
  __int16 v11;
  int v12;

  v4 = sub_100002608();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sys_signame[a2]));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uppercaseString"));

    v9 = 138543618;
    v10 = v7;
    v11 = 1024;
    v12 = a2;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Signal received: %{public}@ (%i)", (uint8_t *)&v9, 0x12u);

  }
  if (a2 != 29)
  {
    if (a2 != 15)
      return;
    quick_exit(0);
  }
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "printInfo");

}

void sub_100002BA8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.ARKit", "Daemon");
  v2 = (void *)qword_1000080E8;
  qword_1000080E8 = (uint64_t)v1;

}

id sub_100002BD8()
{
  if (qword_100008100 != -1)
    dispatch_once(&qword_100008100, &stru_1000042A8);
  return (id)qword_1000080F8;
}

void sub_100002C18(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.ARKit", "General");
  v2 = (void *)qword_1000080F8;
  qword_1000080F8 = (uint64_t)v1;

}

void sub_100002C48(id a1)
{
  byte_100008108 = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", ARSkipCrashOnARCrash);
}

void sub_100002C78(uint64_t a1)
{
  NSMutableDictionary *v2;
  void *v3;
  void *v4;
  _QWORD v5[4];
  id v6;
  id v7;

  v2 = objc_opt_new(NSMutableDictionary);
  v3 = (void *)qword_100008118;
  qword_100008118 = (uint64_t)v2;

  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100002D14;
  v5[3] = &unk_1000042F0;
  v4 = *(void **)(a1 + 32);
  v6 = *(id *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v5);

}

void sub_100002D14(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  uint64_t v6;
  NSObject *object;

  v3 = a2;
  v4 = objc_msgSend(v3, "intValue");
  v5 = (int)v4;
  v6 = ARCreateDispatchSourceForSignalWithHandler(v4, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  object = objc_claimAutoreleasedReturnValue(v6);
  objc_msgSend((id)qword_100008118, "setObject:forKeyedSubscript:", object, v3);

  dispatch_resume(object);
  signal(v5, (void (__cdecl *)(int))1);

}

void sub_100002D90(uint64_t a1)
{
  void *v1;

  qword_1000080B0 = a1;

}

void sub_100002D9C(uint64_t a1)
{
  void *v1;
  const char *v2;
  char *v3;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to setup sandbox library directory with error: %@"), a1));
  v2 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ARCrash: %@"), v1))), "UTF8String");
  v3 = strdup(v2);
  sub_100002D90((uint64_t)v3);

  abort();
}

void sub_100002E04()
{
  void *v0;
  const char *v1;
  char *v2;

  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Failed to setup sandbox temporary directory!")));
  v1 = (const char *)objc_msgSend(objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ARCrash: %@"), v0))), "UTF8String");
  v2 = strdup(v1);
  sub_100002D90((uint64_t)v2);

  abort();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addQueue_hangPolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addQueue:hangPolicy:");
}

id objc_msgSend_BOOLForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLForKey:");
}

id objc_msgSend_bundleIdentifier(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bundleIdentifier");
}

id objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_enumerateObjectsUsingBlock_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enumerateObjectsUsingBlock:");
}

id objc_msgSend_hasLibraryDirectoryReadWriteAccess(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasLibraryDirectoryReadWriteAccess");
}

id objc_msgSend_initWithConfiguration_spawnTime_watchdogMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:spawnTime:watchdogMonitor:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_mainBundle(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainBundle");
}

id objc_msgSend_mainRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mainRunLoop");
}

id objc_msgSend_printInfo(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "printInfo");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_startup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startup");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_supportsWatchdog(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "supportsWatchdog");
}

id objc_msgSend_updateStatus_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateStatus:");
}

id objc_msgSend_uppercaseString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uppercaseString");
}
