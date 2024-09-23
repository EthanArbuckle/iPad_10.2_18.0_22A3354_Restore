uint64_t start()
{
  void *v0;
  id v1;
  id v2;
  id v3;
  id v4;
  void *v5;
  uint8_t v7[16];

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Starting companionLogRelay", v7, 2u);
  }
  v0 = objc_autoreleasePoolPush();
  v1 = objc_alloc((Class)PCCProxyingDevice);
  v2 = objc_alloc_init((Class)PCCIDSEndpoint);
  v3 = objc_msgSend(v1, "initWithEndpoint:", v2);

  v4 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.OSASyncProxy.client"));
  objc_msgSend(v4, "setDelegate:", v3);
  objc_msgSend(v4, "resume");

  objc_autoreleasePoolPop(v0);
  if (v3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
    objc_msgSend(v5, "run");

  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100003D58();
  }

  return 1;
}

void sub_100003D58()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "Unable to instantiate PCCProxyingDevice. Exiting..", v0, 2u);
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_initWithEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEndpoint:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}
