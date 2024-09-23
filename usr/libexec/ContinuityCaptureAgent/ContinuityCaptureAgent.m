uint64_t start(int a1, uint64_t a2)
{
  xpc_object_t v2;
  dispatch_queue_attr_t v3;
  void *v4;
  void *TargetingWorkloopWithPriority;
  void *v6;
  id v7;
  id v8;
  void *v9;
  int v11;
  const char *v12;

  if (a1 >= 2 && !strcmp(*(const char **)(a2 + 8), "server"))
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 136315138;
      v12 = "200.0.1";
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cca start, log version:%s", (uint8_t *)&v11, 0xCu);
    }
    if (!FigGetCFPreferenceBooleanWithDefault(CFSTR("com.apple.continuitycapture.hostLocalServer"), CFSTR("com.apple.cameracapture"), 0))
    {
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v11) = 0;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "cca force exiting, because the platform doesn't support it running as server", (uint8_t *)&v11, 2u);
      }
      xpc_set_event(objc_msgSend(CFSTR("com.apple.cmio.registerassistantservice.system-extensions.matching"), "UTF8String"), objc_msgSend(CFSTR("com.apple.cmio.ContinuityCaptureAgent.extension.discovery"), "UTF8String"), 0);
      exit(0);
    }
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "CMIOExtensionBundleIdentifier", "com.apple.cmio.ContinuityCaptureAgent");
    xpc_set_event(objc_msgSend(CFSTR("com.apple.cmio.registerassistantservice.system-extensions.matching"), "UTF8String"), objc_msgSend(CFSTR("com.apple.cmio.ContinuityCaptureAgent.extension.discovery"), "UTF8String"), v2);

    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    TargetingWorkloopWithPriority = (void *)FigDispatchQueueCreateTargetingWorkloopWithPriority("com.apple.continuitycapture.provider", v4, 14);

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = objc_msgSend(v6, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("group.com.apple.portrait.BackgroundReplacement"));

    v8 = objc_msgSend(objc_alloc((Class)CMContinuityCaptureProvider), "initWithQueue:", TargetingWorkloopWithPriority);
    v9 = (void *)qword_100008028;
    qword_100008028 = (uint64_t)v8;

    if (qword_100008028)
    {
      objc_msgSend((id)qword_100008028, "activate");
      CFRunLoopRun();
    }

  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v11) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ContinuityCaptureAgent, exit", (uint8_t *)&v11, 2u);
  }
  return 0;
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_containerURLForSecurityApplicationGroupIdentifier_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containerURLForSecurityApplicationGroupIdentifier:");
}

id objc_msgSend_defaultManager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultManager");
}

id objc_msgSend_initWithQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithQueue:");
}
