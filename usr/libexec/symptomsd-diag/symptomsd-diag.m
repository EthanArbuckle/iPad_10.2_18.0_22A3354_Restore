id sub_100003370()
{
  if (qword_100008028 != -1)
    dispatch_once(&qword_100008028, &stru_100004148);
  return (id)qword_100008030;
}

void sub_1000033B0(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.symptomsd-diag", "daemon");
  v2 = (void *)qword_100008030;
  qword_100008030 = (uint64_t)v1;

}

uint64_t start()
{
  NSString *v0;
  void *v1;
  id v2;
  NSObject *v3;
  __CFRunLoopSource *v4;
  __CFRunLoop *Main;
  id v7;
  NSObject *v8;
  CFRunLoopSourceContext v9;

  if ((_set_user_dir_suffix("com.apple.symptomsd-diag") & 1) == 0)
  {
    v7 = sub_100003370();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v9.version) = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Failed to fixup temporary directory to conform to sandbox", (uint8_t *)&v9, 2u);
    }

    exit(1);
  }
  v0 = NSTemporaryDirectory();
  v1 = (void *)objc_claimAutoreleasedReturnValue(v0);
  v2 = sub_100003370();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v9.version) = 138412290;
    *(CFIndex *)((char *)&v9.version + 4) = (CFIndex)v1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Updated temporary directory to: %@", (uint8_t *)&v9, 0xCu);
  }

  dispatch_async((dispatch_queue_t)&_dispatch_main_q, &stru_100004168);
  v4 = (__CFRunLoopSource *)qword_100008040;
  if (!qword_100008040)
  {
    memset(&v9, 0, 72);
    v9.perform = (void (__cdecl *)(void *))nullsub_1;
    v4 = CFRunLoopSourceCreate(kCFAllocatorDefault, 0, &v9);
    qword_100008040 = (uint64_t)v4;
    if (!v4)
      dispatch_main();
  }
  Main = CFRunLoopGetMain();
  CFRunLoopAddSource(Main, v4, kCFRunLoopCommonModes);
  CFRunLoopRun();
  return 0;
}

void sub_100003568(id a1)
{
  void *v1;
  id v2;
  NSObject *v3;
  dispatch_source_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v1 = objc_autoreleasePoolPush();
  v2 = sub_100003370();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Initializing signal handlers.", v9, 2u);
  }

  signal(15, (void (__cdecl *)(int))1);
  v4 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, (dispatch_queue_t)&_dispatch_main_q);
  v5 = (void *)qword_100008038;
  qword_100008038 = (uint64_t)v4;

  if (qword_100008038)
  {
    dispatch_source_set_event_handler((dispatch_source_t)qword_100008038, &stru_100004188);
    dispatch_resume((dispatch_object_t)qword_100008038);
  }
  atexit_b(&stru_1000041A8);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance"));
  objc_msgSend(v6, "startup");

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[DRSService sharedInstance](DRSService, "sharedInstance"));
  objc_msgSend(v7, "activateService");

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[DRSTaskingService sharedInstance](DRSTaskingService, "sharedInstance"));
  objc_msgSend(v8, "activateService");

  objc_autoreleasePoolPop(v1);
}

void sub_100003694(id a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v1 = sub_100003370();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "symptomsd-diag is terminating", v6, 2u);
  }

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ABCAdministrator sharedInstance](ABCAdministrator, "sharedInstance"));
  objc_msgSend(v3, "shutdown");

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[DRSService sharedInstance](DRSService, "sharedInstance"));
  objc_msgSend(v4, "deactivateService");

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[DRSTaskingService sharedInstance](DRSTaskingService, "sharedInstance"));
  objc_msgSend(v5, "deactivateService");

}

id objc_msgSend_activateService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activateService");
}

id objc_msgSend_deactivateService(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivateService");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutdown");
}

id objc_msgSend_startup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startup");
}
