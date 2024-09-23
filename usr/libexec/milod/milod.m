void start()
{
  void *v0;
  NSObject *v1;
  id v2;
  void *v3;
  id v4;
  void *v5;
  id v6;
  uint8_t v7[16];

  v0 = objc_autoreleasePoolPush();
  if (qword_100008038 != -1)
    dispatch_once(&qword_100008038, &stru_100004110);
  v1 = qword_100008040;
  if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "milod started", v7, 2u);
  }
  v2 = objc_alloc((Class)ULServer);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[ULEnvironment standardEnvironment](ULEnvironment, "standardEnvironment"));
  v4 = objc_msgSend(v2, "initWithEnvironment:", v3);
  v5 = (void *)qword_100008048;
  qword_100008048 = (uint64_t)v4;

  v6 = objc_msgSend(objc_alloc((Class)NSXPCListener), "initWithMachServiceName:", CFSTR("com.apple.milod.xpc.service"));
  objc_msgSend(v6, "setDelegate:", qword_100008048);
  objc_msgSend(v6, "resume");
  xpc_set_event_stream_handler("com.apple.notifyd.matching", (dispatch_queue_t)&_dispatch_main_q, &stru_1000040D0);

  objc_autoreleasePoolPop(v0);
  dispatch_main();
}

void sub_100003BAC(id a1, OS_xpc_object *a2)
{
  const char *string;
  const char *v3;

  string = xpc_dictionary_get_string(a2, _xpc_event_key_name);
  if (string)
  {
    v3 = string;
    if (!strcmp("RTLocationsOfInterestDidClearNotification", string))
    {
      objc_msgSend((id)qword_100008048, "locationsOfInterestDidClearNotification");
    }
    else if (!strcmp("com.apple.Preferences.ResetPrivacyWarningsNotification", v3))
    {
      objc_msgSend((id)qword_100008048, "resetPrivacyWarningsNotification");
    }
  }
}

void sub_100003C30(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.MicroLocation", "MicroLocation");
  v2 = (void *)qword_100008040;
  qword_100008040 = (uint64_t)v1;

}

id objc_msgSend_initWithEnvironment_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithEnvironment:");
}

id objc_msgSend_initWithMachServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithMachServiceName:");
}

id objc_msgSend_resume(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "resume");
}

id objc_msgSend_setDelegate_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDelegate:");
}

id objc_msgSend_standardEnvironment(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "standardEnvironment");
}
