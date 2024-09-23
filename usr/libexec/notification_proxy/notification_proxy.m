void sub_100003C24(uint64_t a1)
{
  uint64_t *v1;
  uint64_t *v2;
  int v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v1 = (uint64_t *)(a1 + 32);
  v2 = (uint64_t *)(a1 + 40);
  v3 = lockdown_send_message(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40), 100);
  v4 = qword_10000C958;
  if (v3)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      v5 = *v2;
      v6 = *v1;
      v7 = 138412546;
      v8 = v5;
      v9 = 2112;
      v10 = v6;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "lockdown_send_message error, message: %@, connection: %@", (uint8_t *)&v7, 0x16u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
  {
    sub_10000622C(v1 + 1, v1, v4);
  }
}

id sub_100003D78(uint64_t a1)
{
  id *v1;
  int v2;
  NSObject *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  int v12;
  id v13;

  v1 = (id *)(a1 + 32);
  v2 = lockdown_send_message(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &off_100008800, 100);
  v3 = qword_10000C958;
  if (v2)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *v1;
      v12 = 138412290;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "shutdown error, connection: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
  {
    sub_1000062A4((uint64_t)v1, v3, v5, v6, v7, v8, v9, v10);
  }
  return objc_msgSend(*v1, "cancel");
}

void sub_100004024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_100004044(uint64_t a1)
{
  id WeakRetained;
  int v3;
  int v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  CFTypeID v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v15;

  cf = 0;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = lockdown_receive_message(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), &cf);
  if (v3)
  {
    v4 = v3;
    v5 = qword_10000C958;
    if (!os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
      goto LABEL_5;
    *(_DWORD *)buf = 67109120;
    LODWORD(v15) = v4;
    v6 = "lockdown_receive_message error: %d";
    v7 = v5;
    v8 = 8;
    goto LABEL_4;
  }
  if (cf)
  {
    v9 = CFGetTypeID(cf);
    if (v9 == CFDictionaryGetTypeID())
    {
      v10 = (void *)cf;
      sub_1000041F4(WeakRetained, (void *)cf);

      goto LABEL_7;
    }
    v12 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v15 = cf;
      v6 = "lockdown_receive_message returned an unsupported object: %@!";
      v7 = v12;
      v8 = 12;
      goto LABEL_4;
    }
  }
  else
  {
    v11 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      v6 = "lockdown_receive_message returned NULL";
      v7 = v11;
      v8 = 2;
LABEL_4:
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, buf, v8);
    }
  }
LABEL_5:
  dispatch_source_cancel(*(dispatch_source_t *)(*(_QWORD *)(a1 + 32) + 16));
  if (cf)
    CFRelease(cf);
LABEL_7:
  cf = 0;

}

void sub_1000041F4(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  uint32_t v13;
  uint64_t v14;
  const char *v15;
  NSObject *v16;
  os_log_type_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  uint64_t v21;
  uint32_t v22;
  uint32_t v23;
  uint64_t v24;
  _QWORD v25[4];
  id v26;
  id v27;
  uint8_t buf[4];
  id v29;
  __int16 v30;
  void *v31;

  v3 = a1;
  v4 = a2;
  v5 = objc_autoreleasePoolPush();
  if (!v4)
  {
    v14 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v3;
      v15 = "%@ - Disconnected";
      v16 = v14;
      v17 = OS_LOG_TYPE_INFO;
LABEL_14:
      _os_log_impl((void *)&_mh_execute_header, v16, v17, v15, buf, 0xCu);
    }
LABEL_15:
    objc_msgSend(v3, "cancel");
    v7 = 0;
    goto LABEL_29;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Command")));
  if (!v6)
  {
    v18 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v3;
      v15 = "%@ - No command in the message";
      v16 = v18;
      v17 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_14;
    }
    goto LABEL_15;
  }
  v7 = v6;
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("PostNotification")))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("Name")));
    v9 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v29 = v3;
      v30 = 2112;
      v31 = v8;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ - Got POST_NOTIFICATION command for notification: %@", buf, 0x16u);
    }
    if (v8)
    {
      if (!qword_10000C968)
      {
        v22 = notify_post((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
        if (!v22)
          goto LABEL_28;
        v23 = v22;
        v24 = qword_10000C958;
        if (!os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
          goto LABEL_28;
        *(_DWORD *)buf = 138412546;
        v29 = v3;
        v30 = 1024;
        LODWORD(v31) = v23;
        v11 = "%@ - Failed to post notification (%u)";
        v12 = v24;
        v13 = 18;
        goto LABEL_27;
      }
      v10 = qword_10000C958;
      if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v29 = v3;
        v30 = 2112;
        v31 = v8;
        v11 = "%@ - Insecure notification service cannot post notification '%@'";
        v12 = v10;
        v13 = 22;
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, v11, buf, v13);
      }
    }
    else
    {
      v21 = qword_10000C958;
      if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v29 = v3;
        v11 = "%@ - No name in post notification command";
        v12 = v21;
        v13 = 12;
        goto LABEL_27;
      }
    }
LABEL_28:

    goto LABEL_29;
  }
  if (objc_msgSend(v7, "isEqualToString:", CFSTR("ObserveNotification")))
  {
    v19 = qword_10000C960;
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000052B8;
    v25[3] = &unk_100008330;
    v26 = v4;
    v27 = v3;
    dispatch_async(v19, v25);

  }
  else if (objc_msgSend(v7, "isEqualToString:", CFSTR("Shutdown")))
  {
    v20 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v3;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%@ - Got SHUTDOWN command", buf, 0xCu);
    }
    objc_msgSend(v3, "shutdown");
  }
LABEL_29:

  objc_autoreleasePoolPop(v5);
}

void sub_1000045CC(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sub_1000045F8(WeakRetained);

}

void sub_1000045F8(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  v2 = qword_10000C960;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100005D70;
  block[3] = &unk_100008358;
  v5 = v1;
  v3 = v1;
  dispatch_async(v2, block);

}

uint64_t sub_1000048AC(uint64_t a1)
{
  return xpc_remote_connection_send_message(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), *(_QWORD *)(a1 + 40));
}

id sub_100004924(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void sub_1000049D0(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 40));
  _Unwind_Resume(a1);
}

void sub_1000049F0(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  id v5;
  void *v6;
  const char *string;
  const char *v8;
  const char *v9;
  const char *v10;
  void *v11;
  void *v12;
  char *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  const char *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  int v35;
  char *v36;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (v3 == &_xpc_error_connection_invalid)
    {
      v18 = qword_10000C958;
      if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
        sub_10000630C(v18, v19, v20, v21, v22, v23, v24, v25);
    }
    else if (v3 == &_xpc_error_connection_interrupted)
    {
      v26 = qword_10000C958;
      if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
        sub_100006340(v26, v27, v28, v29, v30, v31, v32, v33);
    }
    else
    {
      v13 = xpc_copy_description(v3);
      v14 = qword_10000C958;
      if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
      {
        v35 = 136446210;
        v36 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Unexpected RemoteXPC error: %{public}s", (uint8_t *)&v35, 0xCu);
      }
      if (v13)
        free(v13);
    }
    sub_1000045F8(WeakRetained);
    xpc_remote_connection_cancel(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8), v34);
  }
  else
  {
    v5 = objc_alloc_init((Class)NSMutableDictionary);
    if (v5)
    {
      v6 = v5;
      string = xpc_dictionary_get_string(v3, (const char *)objc_msgSend(CFSTR("Command"), "UTF8String"));
      if (string)
      {
        v8 = string;
        v9 = xpc_dictionary_get_string(v3, (const char *)objc_msgSend(CFSTR("Name"), "UTF8String"));
        if (v9)
        {
          v10 = v9;
          v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v8));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v11, CFSTR("Command"));

          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v10));
          objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("Name"));

          sub_1000041F4(WeakRetained, v6);
LABEL_21:

          goto LABEL_25;
        }
        v16 = qword_10000C958;
        if (!os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        LOWORD(v35) = 0;
        v17 = "Failed to read name.";
      }
      else
      {
        v16 = qword_10000C958;
        if (!os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
          goto LABEL_21;
        LOWORD(v35) = 0;
        v17 = "Failed to read command.";
      }
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v17, (uint8_t *)&v35, 2u);
      goto LABEL_21;
    }
    v15 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v35) = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Failed to create dictionary.", (uint8_t *)&v35, 2u);
    }
  }
LABEL_25:

}

uint64_t start(int a1, char **a2)
{
  const char *v4;
  int v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  os_log_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  dispatch_queue_global_t global_queue;
  NSObject *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  dispatch_queue_t v22;
  void *v23;
  dispatch_queue_t v24;
  dispatch_queue_t v25;
  void *remote_service_listener;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  NSObject *v35;
  char *label;
  uint8_t buf[8];
  _QWORD v38[2];
  _QWORD v39[2];

  v4 = "com.apple.mobile.notification_proxy";
  label = "com.apple.mobile.notification_proxy.remote";
  while (1)
  {
    v5 = getopt(a1, a2, "i");
    if (v5 != 105)
      break;
    v6 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("com.apple.mobile.lockdown.request_host_buid"), CFSTR("com.apple.mobile.lockdown.request_pair"), CFSTR("com.apple.datamigrator.migrationDidFinish"), CFSTR("com.apple.mobile.lockdown.trust"), CFSTR("com.apple.mobile.lockdown.do_not_trust"), CFSTR("com.apple.mobile.lockdown.open_trust_dialog"), CFSTR("com.apple.mobile.lockdown.cancel_trust_dialog"), 0));
    v7 = (void *)qword_10000C968;
    qword_10000C968 = v6;

    label = "com.apple.mobile.insecure_notification_proxy.remote";
    v4 = "com.apple.mobile.insecure_notification_proxy";
  }
  if (v5 != -1)
  {
    syslog(3, "unknown option '%c'\n", (char)v5);
    goto LABEL_10;
  }
  v8 = (uint64_t)v4;
  v9 = os_log_create(v4, "default");
  v10 = (void *)qword_10000C958;
  qword_10000C958 = (uint64_t)v9;

  v38[0] = CFSTR("com.apple.mobile.application_installed");
  v38[1] = CFSTR("com.apple.mobile.application_uninstalled");
  v39[0] = CFSTR("com.apple.LaunchServices.applicationRegistered");
  v39[1] = CFSTR("com.apple.LaunchServices.applicationUnregistered");
  v11 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v39, v38, 2));
  v12 = (void *)qword_10000C970;
  qword_10000C970 = v11;

  global_queue = dispatch_get_global_queue(0, 0);
  v14 = objc_claimAutoreleasedReturnValue(global_queue);
  v15 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v14);

  dispatch_source_set_event_handler(v15, &stru_100008410);
  dispatch_resume(v15);
  v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v17 = (void *)qword_10000C978;
  qword_10000C978 = v16;

  v18 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v19 = (void *)qword_10000C980;
  qword_10000C980 = v18;

  v20 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v21 = (void *)qword_10000C988;
  qword_10000C988 = v20;

  v22 = dispatch_queue_create("com.apple.mobile.notification_proxy_observer_queue", 0);
  v23 = (void *)qword_10000C960;
  qword_10000C960 = (uint64_t)v22;

  v24 = dispatch_queue_create_with_target_V2(label, (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent, (dispatch_queue_t)&_dispatch_main_q);
  if (!v24)
  {
    v35 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Failed to create queue.", buf, 2u);
    }
LABEL_10:
    exit(1);
  }
  v25 = v24;
  remote_service_listener = (void *)xpc_remote_connection_create_remote_service_listener(label, v24, 0);
  xpc_remote_connection_set_event_handler(remote_service_listener, &stru_100008450);
  xpc_remote_connection_activate(remote_service_listener);
  v27 = qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
    sub_100006374(v8, v27, v28, v29, v30, v31, v32, v33);
  lockdown_checkin_xpc(v8, 0, 0, &stru_100008490);
  CFRunLoopRun();

  return 0;
}

void sub_1000050C0(id a1)
{
  NSObject *v1;
  uint8_t v2[16];

  v1 = qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Got SIGTERM, exiting now.\n", v2, 2u);
  }
  exit(0);
}

void sub_100005118(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  xpc_type_t type;
  char *v4;
  NSObject *v5;
  _BOOL4 v6;
  const char *v7;
  OS_xpc_object *v8;
  MNPRemoteServiceConnection *v9;
  int v10;
  char *v11;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_remote_connection)
  {
    v8 = v2;
    v9 = -[MNPRemoteServiceConnection initWithConnection:]([MNPRemoteServiceConnection alloc], "initWithConnection:", v8);

    -[MNPRemoteServiceConnection listen](v9, "listen");
    goto LABEL_11;
  }
  type = xpc_get_type(v2);
  v4 = xpc_copy_description(v2);
  v5 = qword_10000C958;
  v6 = os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (!v6)
      goto LABEL_9;
    v10 = 136446210;
    v11 = v4;
    v7 = "Error in remote service listener: %{public}s";
  }
  else
  {
    if (!v6)
      goto LABEL_9;
    v10 = 136446210;
    v11 = v4;
    v7 = "Unexpected event in remote service listener: %{public}s";
  }
  _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v10, 0xCu);
LABEL_9:
  if (v4)
    free(v4);
LABEL_11:

}

void sub_100005274(id a1, _lockdown_connection *a2, __CFDictionary *a3)
{
  MNPLockdownConnection *v3;

  v3 = -[MNPLockdownConnection initWithConnection:]([MNPLockdownConnection alloc], "initWithConnection:", a2);
  -[MNPLockdownConnection listen](v3, "listen");

}

void sub_1000052B8(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  const char *v21;
  NSObject *v22;
  os_log_type_t v23;
  void *v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *i;
  void *v30;
  id v31;
  id v32;
  id v33;
  const char *v34;
  NSObject *v35;
  id v36;
  uint32_t v37;
  uint32_t v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  _QWORD handler[4];
  id v45;
  int out_token;
  _QWORD block[4];
  id v48;
  id v49;
  id v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[128];
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  void *v59;

  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", CFSTR("Name")));
  if (!v2)
  {
    v11 = qword_10000C958;
    if (!os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412290;
    v57 = v12;
    v13 = "%@ - No name in observe notification command";
    v14 = v11;
    v15 = 12;
LABEL_16:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, v13, buf, v15);
    goto LABEL_41;
  }
  if (qword_10000C968 && (objc_msgSend((id)qword_10000C968, "containsObject:", v2) & 1) == 0)
  {
    v16 = qword_10000C958;
    if (!os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
      goto LABEL_41;
    v17 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v57 = v17;
    v58 = 2112;
    v59 = v2;
    v13 = "%@ - Notification '%@' is not on the allowed list";
    v14 = v16;
    v15 = 22;
    goto LABEL_16;
  }
  v3 = qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
  {
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v57 = v4;
    v58 = 2112;
    v59 = v2;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "%@ - Got OBSERVE_NOTIFICATION command for notification: %@", buf, 0x16u);
  }
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C970, "objectForKeyedSubscript:", v2));
  if (!v5)
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C978, "objectForKeyedSubscript:", v2));
    if (v18)
    {
      v6 = v18;
      objc_msgSend(v18, "addObject:", *(_QWORD *)(a1 + 40));
    }
    else
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", *(_QWORD *)(a1 + 40)));
      objc_msgSend((id)qword_10000C978, "setObject:forKeyedSubscript:", v6, v2);
      out_token = 0;
      v33 = objc_retainAutorelease(v2);
      v34 = (const char *)objc_msgSend(v33, "UTF8String");
      v35 = qword_10000C960;
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 3221225472;
      handler[2] = sub_100005ACC;
      handler[3] = &unk_1000084E0;
      v36 = v33;
      v45 = v36;
      v37 = notify_register_dispatch(v34, &out_token, v35, handler);
      if (v37)
      {
        v38 = v37;
        v39 = qword_10000C958;
        if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
        {
          v40 = *(_QWORD *)(a1 + 40);
          *(_DWORD *)buf = 138412546;
          v57 = v40;
          v58 = 1024;
          LODWORD(v59) = v38;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "%@ - Failed to register for notification (%u)", buf, 0x12u);
        }

        goto LABEL_40;
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", out_token));
      objc_msgSend((id)qword_10000C988, "setObject:forKeyedSubscript:", v43, v36);

    }
    v19 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
    {
      v20 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v57 = v20;
      v58 = 2112;
      v59 = v2;
      v21 = "%@ - Watching for bsd notification %@";
      v22 = v19;
      v23 = OS_LOG_TYPE_INFO;
LABEL_39:
      _os_log_impl((void *)&_mh_execute_header, v22, v23, v21, buf, 0x16u);
    }
LABEL_40:

    goto LABEL_41;
  }
  v6 = (void *)v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C980, "objectForKeyedSubscript:", v5));
  if (!v7)
  {
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C970, "allKeysForObject:", v6));
    v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
    if (v25)
    {
      v26 = v25;
      v27 = 0;
      v28 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v26; i = (char *)i + 1)
        {
          if (*(_QWORD *)v52 != v28)
            objc_enumerationMutation(v24);
          v30 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v30, "isEqualToString:", v2))
          {
            v31 = v30;

            v27 = v31;
          }
        }
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v55, 16);
      }
      while (v26);

      if (v27)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet setWithObject:](NSMutableSet, "setWithObject:", *(_QWORD *)(a1 + 40)));
        objc_msgSend((id)qword_10000C980, "setObject:forKeyedSubscript:", v8, v6);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100005880;
        block[3] = &unk_1000084B8;
        v48 = *(id *)(a1 + 40);
        v49 = v6;
        v50 = v27;
        v32 = v27;
        dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);

        goto LABEL_9;
      }
    }
    else
    {

    }
    v41 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      v42 = *(_QWORD *)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      v57 = v42;
      v58 = 2112;
      v59 = v2;
      v21 = "%@ - Couldn't find key for %@, not registering notification";
      v22 = v41;
      v23 = OS_LOG_TYPE_DEFAULT;
      goto LABEL_39;
    }
    goto LABEL_40;
  }
  v8 = v7;
  objc_msgSend(v7, "addObject:", *(_QWORD *)(a1 + 40));
LABEL_9:
  v9 = qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
  {
    v10 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v57 = v10;
    v58 = 2112;
    v59 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "%@ - Watching for NSNotification %@", buf, 0x16u);
  }

LABEL_41:
}

void sub_100005880(uint64_t a1)
{
  void *v2;
  __CFNotificationCenter *DistributedCenter;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  uint64_t v10;

  v2 = objc_autoreleasePoolPush();
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  v4 = qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_INFO))
  {
    v5 = *(_QWORD *)(a1 + 32);
    v6 = *(_QWORD *)(a1 + 40);
    v7 = 138412546;
    v8 = v5;
    v9 = 2112;
    v10 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%@ - Registering for %@", (uint8_t *)&v7, 0x16u);
  }
  CFNotificationCenterAddObserver(DistributedCenter, *(const void **)(a1 + 48), (CFNotificationCallback)sub_100005968, *(CFStringRef *)(a1 + 40), 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  objc_autoreleasePoolPop(v2);
}

void sub_100005968(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  uint64_t v19;
  __int16 v20;
  id v21;

  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithString:", a2);
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithString:", a3);
  v9 = qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v17 = a3;
    v18 = 2112;
    v19 = a5;
    v20 = 2112;
    v21 = v7;
    _os_log_debug_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Distributed Notification: %@, user info: %@, bsdName %@", buf, 0x20u);
  }
  v10 = qword_10000C960;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100005D24;
  v13[3] = &unk_100008330;
  v14 = v7;
  v15 = v8;
  v11 = v8;
  v12 = v7;
  dispatch_async(v10, v13);

}

void sub_100005ACC(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C978, "objectForKeyedSubscript:", v1));
  sub_100005B18(v1, v2);

}

void sub_100005B18(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *i;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[2];
  _QWORD v26[2];
  uint8_t buf[4];
  id v28;

  v3 = a1;
  v4 = a2;
  dispatch_assert_queue_V2((dispatch_queue_t)qword_10000C960);
  v5 = qword_10000C958;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
    sub_100006488((uint64_t)v3, v5, v6, v7, v8, v9, v10, v11);
  v12 = objc_autoreleasePoolPush();
  v13 = qword_10000C958;
  if (v4)
  {
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
      sub_1000063D8(v13, v4, (uint64_t)v3);
    v25[0] = CFSTR("Command");
    v25[1] = CFSTR("Name");
    v26[0] = CFSTR("RelayNotification");
    v26[1] = v3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 2));
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v15 = v4;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(_QWORD *)v21 != v18)
            objc_enumerationMutation(v15);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "sendMessage:", v14, (_QWORD)v20);
        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v17);
    }

  }
  else if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v28 = v3;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "No listeners for %@", buf, 0xCu);
  }
  objc_autoreleasePoolPop(v12);

}

void sub_100005D24(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  v2 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C980, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40)));
  sub_100005B18(v1, v2);

}

void sub_100005D70(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[4];
  id v9;

  v2 = *(void **)(a1 + 32);
  v3 = (void *)qword_10000C978;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100006040;
  v8[3] = &unk_100008508;
  v9 = v2;
  sub_100005E34(v9, v3, v8);
  v4 = *(void **)(a1 + 32);
  v5 = (void *)qword_10000C980;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100006168;
  v6[3] = &unk_100008508;
  v7 = v4;
  sub_100005E34(v7, v5, v6);

}

void sub_100005E34(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void (**v7)(id, _QWORD);
  id v8;
  __int128 v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  _BYTE v26[128];

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v8)
  {
    v10 = v8;
    v11 = 0;
    v12 = *(_QWORD *)v19;
    *(_QWORD *)&v9 = 138412546;
    v17 = v9;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v12)
          objc_enumerationMutation(v6);
        v14 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", v14, v17));
        if (objc_msgSend(v15, "containsObject:", v5))
        {
          v16 = qword_10000C958;
          if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v17;
            v23 = v5;
            v24 = 2112;
            v25 = v14;
            _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "%@ - removing notification \"%@\"", buf, 0x16u);
          }
          objc_msgSend(v15, "removeObject:", v5);
          if (!objc_msgSend(v15, "count"))
          {
            v7[2](v7, v14);
            if (v11)
              objc_msgSend(v11, "addObject:", v14);
            else
              v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v14));
          }
        }

      }
      v10 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v10);
    if (v11)
    {
      objc_msgSend(v6, "removeObjectsForKeys:", v11);

    }
  }

}

void sub_100006040(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint32_t v5;
  uint32_t v6;
  NSObject *v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  uint32_t v12;

  v3 = a2;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
    sub_1000064EC();
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10000C988, "objectForKeyedSubscript:", v3));
  v5 = notify_cancel((int)objc_msgSend(v4, "intValue"));
  if (v5)
  {
    v6 = v5;
    v7 = qword_10000C958;
    if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = 138412546;
      v10 = v8;
      v11 = 1024;
      v12 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%@ - Failed to cancel notification with status: %u", (uint8_t *)&v9, 0x12u);
    }
  }
  objc_msgSend((id)qword_10000C988, "removeObjectForKey:", v3);

}

void sub_100006168(uint64_t a1, void *a2)
{
  __CFString *v2;
  __CFNotificationCenter *DistributedCenter;

  v2 = a2;
  if (os_log_type_enabled((os_log_t)qword_10000C958, OS_LOG_TYPE_DEBUG))
    sub_100006550();
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, 0, v2, 0);

}

void sub_1000061D8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_1000061EC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_100006204(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_10000622C(_QWORD *a1, _QWORD *a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138412546;
  *(_QWORD *)&v3[4] = *a1;
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = *a2;
  sub_1000061D8((void *)&_mh_execute_header, (uint64_t)a2, a3, "  Sent the notification \"%@\" to the host via connection: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_1000061FC();
}

void sub_1000062A4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000061EC((void *)&_mh_execute_header, a2, a3, "  Sent shutdown message to the host via connection: %@", a5, a6, a7, a8, 2u);
  sub_1000061FC();
}

void sub_10000630C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006204((void *)&_mh_execute_header, a1, a3, "RemoteXPC connection invalid.", a5, a6, a7, a8, 0);
}

void sub_100006340(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100006204((void *)&_mh_execute_header, a1, a3, "RemoteXPC connection interrupted.", a5, a6, a7, a8, 0);
}

void sub_100006374(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000061EC((void *)&_mh_execute_header, a2, a3, "%{public}s started\n", a5, a6, a7, a8, 2u);
  sub_1000061FC();
}

void sub_1000063D8(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  int v6;
  id v7;
  __int16 v8;
  uint64_t v9;

  v5 = a1;
  v6 = 134218242;
  v7 = objc_msgSend(a2, "count");
  v8 = 2112;
  v9 = a3;
  _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "%ld watchers for %@", (uint8_t *)&v6, 0x16u);

}

void sub_100006488(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000061EC((void *)&_mh_execute_header, a2, a3, "ENTRY, noteName: %@", a5, a6, a7, a8, 2u);
  sub_1000061FC();
}

void sub_1000064EC()
{
  uint64_t v0;
  os_log_t v1;

  sub_100006214();
  sub_1000061D8((void *)&_mh_execute_header, v0, v1, "%@ - no more watchers for BSDNote \"%@\", cancelling notification");
  sub_1000061FC();
}

void sub_100006550()
{
  uint64_t v0;
  os_log_t v1;

  sub_100006214();
  sub_1000061D8((void *)&_mh_execute_header, v0, v1, "%@ - no more watchers for NSNote \"%@\", removing observer");
  sub_1000061FC();
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allKeysForObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allKeysForObject:");
}

id objc_msgSend_arrayWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObject:");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_dictionary(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionary");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_initWithConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConnection:");
}

id objc_msgSend_initWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithString:");
}

id objc_msgSend_intValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "intValue");
}

id objc_msgSend_isEqualToString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqualToString:");
}

id objc_msgSend_listen(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listen");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_removeObjectsForKeys_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectsForKeys:");
}

id objc_msgSend_sendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setWithObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObject:");
}

id objc_msgSend_setWithObjects_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithObjects:");
}

id objc_msgSend_shutdown(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shutdown");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}
