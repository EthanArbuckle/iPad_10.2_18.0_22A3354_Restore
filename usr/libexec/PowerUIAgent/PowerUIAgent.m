void start()
{
  _xpc_connection_s *mach_service;
  uint64_t v1;
  void *v2;
  void *v3;
  os_log_t v4;
  unsigned int v5;
  dispatch_queue_global_t global_queue;
  NSObject *v7;
  NSObject *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  dispatch_queue_global_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  uint64_t *v24;
  id *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _QWORD v29[4];
  NSObject *v30;
  _QWORD handler[4];
  NSObject *v32;
  char v33;

  mach_service = xpc_connection_create_mach_service("com.apple.thermalMonitor.displayMitigationsEnabledNote", 0, 1uLL);
  v1 = objc_claimAutoreleasedReturnValue(+[PowerUIChargeAwarenessNotifier sharedInstance](PowerUIChargeAwarenessNotifier, "sharedInstance"));
  v2 = (void *)qword_100008088;
  qword_100008088 = v1;

  v3 = objc_autoreleasePoolPush();
  v4 = os_log_create("com.apple.PowerUIAgent", "main");
  v5 = +[PowerUISmartChargeUtilities isiPhone](PowerUISmartChargeUtilities, "isiPhone");
  global_queue = dispatch_get_global_queue(2, 0);
  v7 = objc_claimAutoreleasedReturnValue(global_queue);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100003084;
  handler[3] = &unk_100004190;
  v33 = v5;
  v8 = v4;
  v32 = v8;
  xpc_set_event_stream_handler("com.apple.notifyd.matching", v7, handler);

  if ((+[PowerUISmartChargeUtilities isOBCSupported](PowerUISmartChargeUtilities, "isOBCSupported") & 1) != 0|| MGGetBoolAnswer(CFSTR("DeviceSupports80ChargeLimit")))
  {
    v9 = objc_claimAutoreleasedReturnValue(+[PowerUISmartChargeManager manager](PowerUISmartChargeManager, "manager"));
    v10 = (void *)qword_100008090;
    qword_100008090 = v9;
  }
  else if (+[PowerUISmartChargeUtilities isInternalBuild](PowerUISmartChargeUtilities, "isInternalBuild"))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[PowerUISmartChargeUtilities numberForPreferenceKey:inDomain:](PowerUISmartChargeUtilities, "numberForPreferenceKey:inDomain:", CFSTR("allowMCLOverride"), CFSTR("com.apple.smartcharging.topoffprotection")));
    v10 = v23;
    if (v23 && (objc_msgSend(v23, "BOOLValue") & 1) != 0)
    {
      v24 = &qword_100008090;
      v25 = (id *)PowerUISmartChargeManager_ptr;
    }
    else
    {
      v24 = &qword_1000080A8;
      v25 = (id *)PowerUISmartChargeManagerUnsupported_ptr;
    }
    v27 = objc_claimAutoreleasedReturnValue(objc_msgSend(*v25, "manager"));
    v28 = (void *)*v24;
    *v24 = v27;

  }
  else
  {
    v26 = objc_claimAutoreleasedReturnValue(+[PowerUISmartChargeManagerUnsupported manager](PowerUISmartChargeManagerUnsupported, "manager"));
    v10 = (void *)qword_1000080B0;
    qword_1000080B0 = v26;
  }

  xpc_set_event_stream_handler("com.apple.alarm", 0, &stru_1000041D0);
  v11 = objc_claimAutoreleasedReturnValue(+[PowerUICECManager manager](PowerUICECManager, "manager"));
  v12 = (void *)qword_100008098;
  qword_100008098 = v11;

  v13 = dispatch_get_global_queue(0, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  xpc_set_idle_handler(v14, &stru_100004210);

  if (v5)
  {
    v15 = objc_claimAutoreleasedReturnValue(+[PowerUIUPOManager sharedInstance](PowerUIUPOManager, "sharedInstance"));
    v16 = (void *)qword_100008080;
    qword_100008080 = v15;

    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100003214;
    v29[3] = &unk_100004238;
    v30 = v8;
    xpc_connection_set_event_handler(mach_service, v29);
    xpc_connection_activate(mach_service);
    v17 = objc_claimAutoreleasedReturnValue(+[PowerUILPMNotifier sharedInstance](PowerUILPMNotifier, "sharedInstance"));
    v18 = (void *)qword_100008070;
    qword_100008070 = v17;

    v19 = objc_claimAutoreleasedReturnValue(+[PowerUIDrainAnalyzer sharedInstance](PowerUIDrainAnalyzer, "sharedInstance"));
    v20 = (void *)qword_100008078;
    qword_100008078 = v19;

  }
  v21 = objc_alloc_init((Class)PowerUIAudioAccessorySmartChargeManager);
  v22 = (void *)qword_1000080A0;
  qword_1000080A0 = (uint64_t)v21;

  objc_autoreleasePoolPop(v3);
  CFRunLoopRun();
  exit(1);
}

void sub_100003084(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  const char *string;
  NSObject *v6;
  int v7;
  const char *v8;

  v3 = a2;
  v4 = v3;
  if (*(_BYTE *)(a1 + 40))
  {
    string = xpc_dictionary_get_string(v3, _xpc_event_key_name);
    v6 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 136315138;
      v8 = string;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Received notification: %s", (uint8_t *)&v7, 0xCu);
    }
    if (!strcmp(string, "com.apple.system.lowpowermode.auto_disabled"))
    {
      objc_msgSend((id)qword_100008070, "displayAutoDisabledNotification");
    }
    else if (!strcmp(string, "com.apple.system.lowpowermode.first_time"))
    {
      objc_msgSend((id)qword_100008070, "displayFirstUseNotification");
    }
    else if (!strcmp(string, "com.apple.system.lowpowermode"))
    {
      objc_msgSend((id)qword_100008070, "removeAutoDisabledNotification");
    }
    else if (!strcmp(string, "com.apple.thermalmonitor.ageAwareMitigationsEnabled"))
    {
      objc_msgSend((id)qword_100008080, "displayMitigationsEnabledNotification");
    }
    else if (!strcmp(string, "com.apple.powerlog.batteryServiceNotification"))
    {
      objc_msgSend((id)qword_100008080, "displayBatteryServiceNotification");
    }
  }

}

void sub_100003200(id a1, OS_xpc_object *a2)
{
  objc_msgSend((id)qword_100008090, "handleAlarmEvent:", a2);
}

void sub_100003214(uint64_t a1, void *a2)
{
  _xpc_connection_s *v3;
  _QWORD handler[4];
  id v5;

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100003298;
  handler[3] = &unk_100004238;
  v5 = *(id *)(a1 + 32);
  v3 = a2;
  xpc_connection_set_event_handler(v3, handler);
  xpc_connection_activate(v3);

}

void sub_100003298(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  void *v5;
  NSObject *v6;
  NSObject *v7;
  xpc_object_t reply;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v10;
  uint8_t v11[16];
  uint8_t v12[16];
  uint8_t buf[16];

  v3 = a2;
  v4 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Received message on thermal monitor connection", buf, 2u);
  }
  v5 = objc_autoreleasePoolPush();
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_BOOL(v3, "postNotification"))
    {
      v7 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Going to post a notification", v11, 2u);
      }
      objc_msgSend((id)qword_100008080, "requestBulletin");
      reply = xpc_dictionary_create_reply(v3);
      remote_connection = xpc_dictionary_get_remote_connection(v3);
      v10 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      xpc_connection_send_message(v10, reply);

    }
  }
  else
  {
    v6 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalid message type!", v12, 2u);
    }
  }
  objc_autoreleasePoolPop(v5);

}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_displayAutoDisabledNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayAutoDisabledNotification");
}

id objc_msgSend_displayBatteryServiceNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayBatteryServiceNotification");
}

id objc_msgSend_displayFirstUseNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayFirstUseNotification");
}

id objc_msgSend_displayMitigationsEnabledNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "displayMitigationsEnabledNotification");
}

id objc_msgSend_isInternalBuild(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isInternalBuild");
}

id objc_msgSend_isOBCSupported(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isOBCSupported");
}

id objc_msgSend_isiPhone(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isiPhone");
}

id objc_msgSend_manager(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "manager");
}

id objc_msgSend_numberForPreferenceKey_inDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberForPreferenceKey:inDomain:");
}

id objc_msgSend_removeAutoDisabledNotification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAutoDisabledNotification");
}

id objc_msgSend_requestBulletin(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "requestBulletin");
}

id objc_msgSend_sharedInstance(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedInstance");
}
