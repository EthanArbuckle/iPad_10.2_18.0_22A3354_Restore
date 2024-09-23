uint64_t start()
{
  void *v0;
  NSObject *v1;
  dispatch_queue_attr_t v2;
  NSObject *v3;
  dispatch_queue_t v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];
  uint8_t buf[16];

  v0 = objc_autoreleasePoolPush();
  v1 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "mdmd starting...", buf, 2u);
  }
  v2 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = dispatch_queue_create("mdmd Catalyst Queue", v3);
  CATSetCatalystQueue();

  v5 = objc_msgSend(objc_alloc((Class)DMCPowerAssertion), "initWithReason:", CFSTR("mdmd-Start"));
  v6 = objc_msgSend(objc_alloc((Class)MDMServerCore), "initWithChannelType:", 0);
  objc_msgSend(v6, "startOutError:", 0);
  v7 = objc_msgSend(objc_alloc((Class)MDMServiceDelegate), "initWithServer:", v6);
  v8 = objc_alloc((Class)NSXPCListener);
  v9 = objc_msgSend(v8, "initWithMachServiceName:", kMDMServiceBootstrapName);
  objc_msgSend(v9, "setDelegate:", v7);
  objc_msgSend(v9, "resume");

  objc_autoreleasePoolPop(v0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"));
  objc_msgSend(v10, "run");

  v11 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "mdmd stopping.", v13, 2u);
  }

  return 0;
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_initWithChannelType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithChannelType:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_initWithReason_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithReason:");
}

id objc_msgSend_initWithServer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServer:");
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

id objc_msgSend_startOutError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startOutError:");
}
