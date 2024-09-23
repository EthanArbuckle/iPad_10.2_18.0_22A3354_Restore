id sub_100001CC8(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  id result;

  v4 = *(void **)(a1 + 32);
  if (!a3)
    return objc_msgSend(v4, "fire:", a2);
  objc_msgSend(v4, "setBrowser:", 0);
  result = objc_msgSend(*(id *)(a1 + 32), "dontRestartBrowse");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 32), "startBrowsing:", *(_QWORD *)(a1 + 40));
  return result;
}

uint64_t sub_100001FB0()
{
  os_log_t v0;
  void *v1;
  NSMutableSet *v2;
  void *v3;
  dispatch_queue_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;

  v0 = os_log_create("com.apple.RemoteServiceDiscovery", "rsd_events");
  v1 = (void *)qword_100057C48;
  qword_100057C48 = (uint64_t)v0;

  v2 = objc_opt_new(NSMutableSet);
  v3 = (void *)qword_100057C58;
  qword_100057C58 = (uint64_t)v2;

  v4 = dispatch_queue_create("com.apple.rsd_events", 0);
  v5 = (void *)qword_100057C40;
  qword_100057C40 = (uint64_t)v4;

  v6 = xpc_event_publisher_create("com.apple.remoteservicediscovery.events", qword_100057C40);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = (void *)qword_100057C50;
  qword_100057C50 = v7;

  xpc_event_publisher_set_handler(qword_100057C50, &stru_100050E60);
  xpc_event_publisher_set_error_handler(qword_100057C50, &stru_100050EA0);
  return xpc_event_publisher_activate(qword_100057C50);
}

void sub_100002070(id a1, unsigned int a2, unint64_t a3, OS_xpc_object *a4)
{
  OS_xpc_object *v6;
  __int128 v7;
  RSDEventRegistration *v8;
  NSObject *v9;
  char *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  uint8_t *v27;
  __int16 v28;
  char *v29;
  uint8_t v30[16];
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;

  v6 = a4;
  if (a2 == 1)
  {
    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v12 = objc_msgSend((id)qword_100057C58, "copy", 0);
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v15)
            objc_enumerationMutation(v12);
          v17 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v17, "token") == (id)a3)
          {
            v18 = (void *)qword_100057C48;
            if (os_log_type_enabled((os_log_t)qword_100057C48, OS_LOG_TYPE_INFO))
            {
              v19 = v18;
              v20 = objc_msgSend(v17, "name");
              *(_DWORD *)v30 = 136446210;
              *(_QWORD *)&v30[4] = v20;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Removing RSD events registration: %{public}s", v30, 0xCu);

            }
            objc_msgSend(v17, "cancelBrowsing");
            objc_msgSend((id)qword_100057C58, "removeObject:", v17);
            goto LABEL_24;
          }
        }
        v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
        if (v14)
          continue;
        break;
      }
    }
LABEL_24:

  }
  else if (!a2)
  {
    *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v36 = v7;
    v37 = v7;
    v34 = v7;
    v35 = v7;
    v32 = v7;
    v33 = v7;
    *(_OWORD *)v30 = v7;
    v31 = v7;
    if ((xpc_get_event_name("com.apple.remoted.service", a3, v30) & 1) == 0)
      __strlcpy_chk(v30, "<Unknown>", 128, 128);
    v8 = -[RSDEventRegistration initWithToken:name:]([RSDEventRegistration alloc], "initWithToken:name:", a3, v30);
    objc_msgSend((id)qword_100057C58, "addObject:", v8);
    -[RSDEventRegistration startBrowsing:](v8, "startBrowsing:", v6);
    v9 = qword_100057C48;
    if (os_log_type_enabled((os_log_t)qword_100057C48, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v27 = v30;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Registered for RSD events: %{public}s", buf, 0xCu);
    }
    if (os_log_type_enabled((os_log_t)qword_100057C48, OS_LOG_TYPE_INFO))
    {
      v10 = xpc_copy_description(v6);
      v11 = qword_100057C48;
      if (os_log_type_enabled((os_log_t)qword_100057C48, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446466;
        v27 = v30;
        v28 = 2082;
        v29 = v10;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "%{public}s: %{public}s", buf, 0x16u);
      }
      free(v10);
    }

  }
}

void sub_100002364(id a1, int a2)
{
  NSObject *v3;

  v3 = qword_100057C48;
  if (os_log_type_enabled((os_log_t)qword_100057C48, OS_LOG_TYPE_ERROR))
    sub_100030758(a2, v3);
}

uint64_t sub_1000023A8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return _os_log_send_and_compose_impl(a1, v6, v5, 80, a5, v7, 16);
}

uint64_t sub_1000023C0(uint64_t a1)
{
  _QWORD *v1;

  return _os_crash_msg(*v1, a1);
}

BOOL sub_1000023CC()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

void sub_1000023D8(void *a1)
{
  id v2;
  void *v3;
  os_log_t v4;
  void *v5;
  xpc_connection_t mach_service;
  void *v7;
  id v8;

  v2 = a1;
  objc_storeStrong((id *)&qword_100057C60, a1);
  v3 = (void *)qword_100057C68;
  qword_100057C68 = (uint64_t)v2;
  v8 = v2;

  v4 = os_log_create("com.apple.RemoteServiceDiscovery", "ControlInterface");
  v5 = (void *)qword_100057C70;
  qword_100057C70 = (uint64_t)v4;

  mach_service = xpc_connection_create_mach_service("com.apple.remoted.control", (dispatch_queue_t)qword_100057C60, 1uLL);
  v7 = (void *)qword_100057C78;
  qword_100057C78 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_100057C78, &stru_100050EE0);
  xpc_connection_activate((xpc_connection_t)qword_100057C78);

}

void sub_10000249C(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  OS_xpc_object *v3;
  _QWORD handler[4];
  OS_xpc_object *v5;

  v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10000253C;
    handler[3] = &unk_100050F08;
    v3 = v2;
    v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_100057C60);
    xpc_connection_activate(v3);

  }
}

void sub_10000253C(uint64_t a1, void *a2)
{
  id v3;
  _xpc_connection_s *v4;
  id v5;
  void *v6;
  const char *string;
  id v8;
  uint64_t v9;
  xpc_object_t reply;
  id v11;
  void *v12;
  char v13;
  NSObject *v14;
  Block_layout *v15;
  id v16;
  void *v17;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v19;
  id v20;
  id v21;
  const char *v22;
  NSObject *v23;
  const char *v24;
  int v25;
  int *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  __int128 v30;
  __int128 block;
  void (*v32)(uint64_t);
  void *v33;
  __int128 v34;

  v3 = a2;
  v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
  v5 = v3;
  v6 = objc_autoreleasePoolPush();
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
  {
LABEL_21:
    xpc_connection_cancel(v4);
    goto LABEL_40;
  }
  if ((xpc_dictionary_expects_reply(v5) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057C70, OS_LOG_TYPE_ERROR))
      sub_100030A44();
    goto LABEL_21;
  }
  string = xpc_dictionary_get_string(v5, "cmd");
  if ((os_variant_has_internal_content("com.apple.xpc.remoted") & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057C70, OS_LOG_TYPE_ERROR))
      sub_100030A18();
    goto LABEL_26;
  }
  if (!string)
  {
    if (os_log_type_enabled((os_log_t)qword_100057C70, OS_LOG_TYPE_ERROR))
      sub_100030874();
    goto LABEL_26;
  }
  if (!strcmp(string, "attach_loopback"))
  {
    v11 = v5;
    sub_10002C45C();
LABEL_37:
    reply = xpc_dictionary_create_reply(v11);

    xpc_dictionary_set_string(reply, "result", "OK");
    goto LABEL_38;
  }
  if (!strcmp(string, "connect_loopback"))
  {
    v11 = v5;
    sub_10002C5D4();
    goto LABEL_37;
  }
  if (!strcmp(string, "detach_loopback"))
  {
    v11 = v5;
    sub_10002CA28();
    goto LABEL_37;
  }
  if (!strcmp(string, "suspend_loopback"))
  {
    v11 = v5;
    sub_10002CB78();
    goto LABEL_37;
  }
  if (!strcmp(string, "resume_loopback"))
  {
    v11 = v5;
    sub_10002CCC4();
    goto LABEL_37;
  }
  if (!strcmp(string, "reset_loopback"))
  {
    v11 = v5;
    sub_10002CE0C();
    goto LABEL_37;
  }
  if (!strcmp(string, "enable_bonjour"))
  {
    v12 = v5;
    v13 = 0;
LABEL_42:
    v20 = sub_100002A60(v12, v13);
    v9 = objc_claimAutoreleasedReturnValue(v20);
    goto LABEL_27;
  }
  if (!strcmp(string, "disable_bonjour"))
  {
    v14 = qword_100057C68;
    v11 = v5;
    v15 = &stru_100050F48;
LABEL_36:
    dispatch_async(v14, v15);
    goto LABEL_37;
  }
  if (!strcmp(string, "enable_bonjour_loopback"))
  {
    v12 = v5;
    v13 = 1;
    goto LABEL_42;
  }
  if (!strcmp(string, "enable_network_peer"))
  {
    v21 = v5;
    v22 = xpc_dictionary_get_string(v21, "arg");
    if (!v22)
    {
LABEL_55:
      v28 = sub_10001ECE8(v21);
      reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v28);
      goto LABEL_56;
    }
    *(_QWORD *)&block = _NSConcreteStackBlock;
    *((_QWORD *)&block + 1) = 3221225472;
    v32 = sub_100002B54;
    v33 = &unk_100050F88;
    *(_QWORD *)&v34 = strdup(v22);
    v23 = qword_100057C68;
LABEL_45:
    dispatch_async(v23, &block);
    reply = xpc_dictionary_create_reply(v21);
    xpc_dictionary_set_string(reply, "result", "OK");
LABEL_56:

    goto LABEL_38;
  }
  if (!strcmp(string, "disable_network_peer"))
  {
    v14 = qword_100057C68;
    v11 = v5;
    v15 = &stru_100050FA8;
    goto LABEL_36;
  }
  if (!strcmp(string, "connect_network_peer"))
  {
    v21 = v5;
    v24 = xpc_dictionary_get_string(v21, "arg");
    v30 = 0uLL;
    v25 = inet_pton(30, v24, &v30);
    if (v25 == -1)
    {
      v26 = __error();
      v27 = qword_100057C70;
      if (os_log_type_enabled((os_log_t)qword_100057C70, OS_LOG_TYPE_ERROR))
        sub_100030978(v26, v27);
      goto LABEL_55;
    }
    if (v25 != 1)
    {
      if (v25)
        sub_1000308A0(&v29, &block);
      if (os_log_type_enabled((os_log_t)qword_100057C70, OS_LOG_TYPE_ERROR))
        sub_10003094C();
      goto LABEL_55;
    }
    v23 = qword_100057C68;
    *(_QWORD *)&block = _NSConcreteStackBlock;
    *((_QWORD *)&block + 1) = 3221225472;
    v32 = sub_100002C28;
    v33 = &unk_100050FC8;
    v34 = v30;
    goto LABEL_45;
  }
  if (os_log_type_enabled((os_log_t)qword_100057C70, OS_LOG_TYPE_ERROR))
    sub_1000309EC();
LABEL_26:
  v8 = sub_10001ECE8(v5);
  v9 = objc_claimAutoreleasedReturnValue(v8);
LABEL_27:
  reply = (xpc_object_t)v9;
LABEL_38:
  v16 = reply;
  if (!v16)
    sub_1000307CC(&v30, &block);
  v17 = v16;

  remote_connection = xpc_dictionary_get_remote_connection(v17);
  v19 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_connection_send_message(v19, v17);

LABEL_40:
  objc_autoreleasePoolPop(v6);

}

id sub_100002A60(void *a1, char a2)
{
  id v3;
  const char *string;
  xpc_object_t reply;
  id v6;
  _QWORD v8[5];
  char v9;

  v3 = a1;
  string = xpc_dictionary_get_string(v3, "arg");
  if (string)
  {
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100002B28;
    v8[3] = &unk_100050F68;
    v8[4] = strdup(string);
    v9 = a2;
    dispatch_async((dispatch_queue_t)qword_100057C68, v8);
    reply = xpc_dictionary_create_reply(v3);
    xpc_dictionary_set_string(reply, "result", "OK");
  }
  else
  {
    v6 = sub_10001ECE8(v3);
    reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v6);
  }

  return reply;
}

void sub_100002B28(uint64_t a1)
{
  sub_100028D74(*(const char **)(a1 + 32), *(_BYTE *)(a1 + 40));
  free(*(void **)(a1 + 32));
}

void sub_100002B54(uint64_t a1)
{
  _BOOL4 v2;
  NSObject *v3;
  const char *v4;
  int v5;
  const char *v6;

  v2 = sub_10001C39C(*(const char **)(a1 + 32));
  v3 = qword_100057C70;
  if (os_log_type_enabled((os_log_t)qword_100057C70, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "failed";
    if (v2)
      v4 = "succeeded";
    v5 = 136446210;
    v6 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "network peer enable %{public}s", (uint8_t *)&v5, 0xCu);
  }
  free(*(void **)(a1 + 32));
}

void sub_100002C28(uint64_t a1)
{
  _BOOL4 v1;
  NSObject *v2;
  const char *v3;
  int v4;
  const char *v5;

  v1 = sub_10001CA78((_QWORD *)(a1 + 32));
  v2 = qword_100057C70;
  if (os_log_type_enabled((os_log_t)qword_100057C70, OS_LOG_TYPE_DEFAULT))
  {
    v3 = "failed";
    if (v1)
      v3 = "succeeded";
    v4 = 136446210;
    v5 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "network peer connect %{public}s", (uint8_t *)&v4, 0xCu);
  }
}

void sub_100002CE4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

id sub_10000326C()
{
  if (qword_100057CA0 != -1)
    dispatch_once(&qword_100057CA0, &stru_100051008);
  return (id)qword_100057C98;
}

NSObject *sub_100003584(const char *a1, int a2, _DWORD *a3)
{
  uint64_t v6;
  int v7;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  const char *name;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;

  v6 = if_nametoindex(a1);
  if ((_DWORD)v6)
  {
    v7 = v6;
    v8 = sub_10002AD94(v6, a2);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    v10 = v9;
    if (v9)
    {
      v11 = nw_parameters_copy_required_interface(v9);
      name = nw_interface_get_name(v11);
      if (!strncmp(name, a1, 0x10uLL))
      {
        nw_parameters_set_local_only(v10, 0);
        nw_parameters_set_required_interface_type(v10, nw_interface_type_other);
        *a3 = v7;
        v16 = v10;
        goto LABEL_14;
      }
      v13 = sub_10000326C();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        sub_100030B54();

    }
    else
    {
      v17 = sub_10000326C();
      v11 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        sub_100030AC8();
    }
    v16 = 0;
LABEL_14:

    goto LABEL_15;
  }
  v15 = sub_10000326C();
  v10 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_100030AF4();
  v16 = 0;
LABEL_15:

  return v16;
}

void sub_100003958(void *a1)
{
  id v1;
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSMutableSet *v6;
  void *v7;
  xpc_connection_t mach_service;
  void *v9;
  uint8_t v10[16];

  v1 = a1;
  v2 = sub_10000326C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "initializing CoreDevice backend", v10, 2u);
  }

  v4 = (void *)qword_100057C88;
  qword_100057C88 = (uint64_t)v1;
  v5 = v1;

  v6 = objc_opt_new(NSMutableSet);
  v7 = (void *)qword_100057C80;
  qword_100057C80 = (uint64_t)v6;

  mach_service = xpc_connection_create_mach_service("com.apple.remoted.coredevice", (dispatch_queue_t)qword_100057C88, 1uLL);
  v9 = (void *)qword_100057C90;
  qword_100057C90 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_100057C90, &stru_100050FE8);
  xpc_connection_activate((xpc_connection_t)qword_100057C90);

}

void sub_100003A40(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  OS_xpc_object *v3;
  _QWORD handler[4];
  OS_xpc_object *v5;

  v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100003AE0;
    handler[3] = &unk_100050F08;
    v3 = v2;
    v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_100057C88);
    xpc_connection_activate(v3);

  }
}

void sub_100003AE0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  void *v6;
  __int128 v7;
  void *v8;
  _BOOL4 v9;
  const char *string;
  const char *v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  id v21;
  NSObject *v22;
  const char *v23;
  const char *v24;
  NSObject *v25;
  NSObject *v26;
  NSObject *v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t uint64;
  id v31;
  NSObject *v32;
  RSDRemoteCoreDeviceDevice *v33;
  RSDRemoteCoreDeviceDevice *v34;
  id v35;
  NSObject *v36;
  const char *v37;
  RSDRemoteCoreDeviceDevice *v38;
  NSObject *v39;
  id v40;
  NSObject *v41;
  void *v42;
  id v43;
  id v44;
  const char *v45;
  const char *v46;
  uint64_t v47;
  void *host_with_numeric_port;
  uint64_t v49;
  id v50;
  NSObject *v51;
  RSDRemoteCoreDeviceDevice *v52;
  RSDRemoteCoreDeviceDevice *v53;
  id v54;
  NSObject *v55;
  const char *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  uint64_t v61;
  uint64_t v62;
  void *v63;
  id v64;
  BOOL v65;
  id v66;
  NSObject *v67;
  id v68;
  void *v69;
  id v70;
  NSObject *v71;
  id v72;
  id v73;
  NSObject *v74;
  id v75;
  id v76;
  NSObject *v77;
  id v78;
  uint64_t v79;
  id v80;
  id v81;
  NSObject *v82;
  id v83;
  id v84;
  NSObject *v85;
  id v86;
  id v87;
  NSObject *v88;
  id v89;
  id v90;
  NSObject *v91;
  id v92;
  id v93;
  NSObject *v94;
  id v95;
  id v96;
  NSObject *v97;
  id v98;
  id v99;
  char *__s2;
  char *__s2a;
  uint8_t v102[12];
  unsigned int v103;
  __int128 handler;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  uint64_t v109;
  char v110;
  _BYTE buf[32];
  NSObject *v112;
  RSDRemoteCoreDeviceDevice *v113;
  id v114;
  __int128 *v115;

  v3 = a2;
  v4 = *(id *)(a1 + 32);
  v5 = v3;
  v6 = objc_autoreleasePoolPush();
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
  {
    sub_100004608(v4);
    goto LABEL_102;
  }
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)buf = v7;
  *(_OWORD *)&buf[16] = v7;
  xpc_connection_get_audit_token(v4, buf);
  v8 = (void *)xpc_copy_entitlement_for_token("com.apple.private.remoted.coredevice", buf);
  v9 = v8 == 0;

  if (v9)
  {
    v14 = sub_10000326C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100030C3C();
    goto LABEL_14;
  }
  if ((xpc_dictionary_expects_reply(v5) & 1) == 0)
  {
    v16 = sub_10000326C();
    v15 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100030DD0();
LABEL_14:

    sub_100004608(v4);
    goto LABEL_102;
  }
  string = xpc_dictionary_get_string(v5, "cmd");
  v11 = string;
  if (!string)
  {
    v17 = sub_10000326C();
    v13 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100030874();
    goto LABEL_20;
  }
  if (!strcmp(string, "add_listener_device"))
  {
    __s2 = (char *)v4;
    v20 = v5;
    v21 = sub_10000326C();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "add server listener start", buf, 2u);
    }

    v23 = xpc_dictionary_get_string(v20, "interface_name");
    v24 = v23;
    if (v23)
    {
      v103 = 0;
      v25 = sub_100003584(v23, 1, &v103);
      v26 = objc_claimAutoreleasedReturnValue(v25);
      v27 = v26;
      if (v26 && (v28 = v103) != 0)
      {
        v29 = nw_listener_create(v26);
        if (v29)
        {
          uint64 = xpc_dictionary_get_uint64(v20, "connect_timeout");
          v31 = sub_10000326C();
          v32 = objc_claimAutoreleasedReturnValue(v31);
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = v24;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Creating new listener device for interface: %{public}s", buf, 0xCu);
          }

          v33 = -[RSDRemoteCoreDeviceDevice initWithServerListener:controlPeer:interfaceName:interfaceIndex:connectTimeout:]([RSDRemoteCoreDeviceDevice alloc], "initWithServerListener:controlPeer:interfaceName:interfaceIndex:connectTimeout:", v29, __s2, v24, v28, uint64);
          v34 = v33;
          if (v33 && -[RSDRemoteDevice device_name](v33, "device_name"))
          {
            -[RSDRemoteCoreDeviceDevice attach](v34, "attach");
            v35 = sub_10000326C();
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
            {
              v37 = -[RSDRemoteDevice device_name](v34, "device_name");
              *(_DWORD *)buf = 136446466;
              *(_QWORD *)&buf[4] = v37;
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = v24;
              _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Attached new listener device: %{public}s for interface: %{public}s", buf, 0x16u);
            }

            *(_QWORD *)&handler = _NSConcreteStackBlock;
            *((_QWORD *)&handler + 1) = 3221225472;
            *(_QWORD *)&v105 = sub_1000047E0;
            *((_QWORD *)&v105 + 1) = &unk_100051030;
            v38 = v34;
            *(_QWORD *)&v106 = v38;
            nw_listener_set_new_connection_handler(v29, &handler);
            *(_QWORD *)&v108 = 0;
            *((_QWORD *)&v108 + 1) = &v108;
            v109 = 0x2020000000;
            v110 = 1;
            *(_QWORD *)buf = _NSConcreteStackBlock;
            *(_QWORD *)&buf[8] = 3221225472;
            *(_QWORD *)&buf[16] = sub_100004980;
            *(_QWORD *)&buf[24] = &unk_100051058;
            v39 = v29;
            v112 = v39;
            v115 = &v108;
            v113 = v38;
            v114 = v20;
            nw_listener_set_state_changed_handler(v39, buf);
            nw_listener_set_queue(v39, (dispatch_queue_t)qword_100057C88);
            nw_listener_start(v39);
            v40 = sub_10000326C();
            v41 = objc_claimAutoreleasedReturnValue(v40);
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)v102 = 0;
              _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "add server listener done", v102, 2u);
            }

            _Block_object_dispose(&v108, 8);
            v42 = (void *)v106;
          }
          else
          {
            v87 = sub_10000326C();
            v88 = objc_claimAutoreleasedReturnValue(v87);
            if (os_log_type_enabled(v88, OS_LOG_TYPE_FAULT))
              sub_100030CC0();

            v89 = sub_1000047A8(v20, "ERROR");
            v42 = (void *)objc_claimAutoreleasedReturnValue(v89);
            xpc_dictionary_send_reply(v42);
          }

        }
        else
        {
          v93 = sub_10000326C();
          v94 = objc_claimAutoreleasedReturnValue(v93);
          if (os_log_type_enabled(v94, OS_LOG_TYPE_FAULT))
            sub_100030C94();

          v95 = sub_1000047A8(v20, "ERROR");
          v34 = (RSDRemoteCoreDeviceDevice *)objc_claimAutoreleasedReturnValue(v95);
          xpc_dictionary_send_reply(v34);
        }

      }
      else
      {
        v70 = sub_10000326C();
        v71 = objc_claimAutoreleasedReturnValue(v70);
        if (os_log_type_enabled(v71, OS_LOG_TYPE_FAULT))
          sub_100030AC8();

        v72 = sub_1000047A8(v20, "ERROR");
        v29 = objc_claimAutoreleasedReturnValue(v72);
        xpc_dictionary_send_reply(v29);
      }

    }
    else
    {
      v66 = sub_10000326C();
      v67 = objc_claimAutoreleasedReturnValue(v66);
      if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
        sub_100030C68();

      v68 = sub_1000047A8(v20, "ERROR");
      v69 = (void *)objc_claimAutoreleasedReturnValue(v68);
      xpc_dictionary_send_reply(v69);

    }
    goto LABEL_102;
  }
  if (!strcmp(v11, "add_client_device"))
  {
    v43 = v4;
    v44 = v5;
    v45 = xpc_dictionary_get_string(v44, "interface_name");
    v46 = xpc_dictionary_get_string(v44, "listener_address");
    v47 = xpc_dictionary_get_uint64(v44, "listener_port");
    if (v45 && v46 && v47 && v47 < 0x10000)
    {
      host_with_numeric_port = (void *)nw_endpoint_create_host_with_numeric_port(v46, (unsigned __int16)v47);
      if (host_with_numeric_port)
      {
        v49 = xpc_dictionary_get_uint64(v44, "connect_timeout");
        v50 = sub_10000326C();
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = v45;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Creating new client device for interface: %{public}s", buf, 0xCu);
        }

        v52 = -[RSDRemoteCoreDeviceDevice initWithClientEndpoint:controlPeer:interfaceName:connectTimeout:]([RSDRemoteCoreDeviceDevice alloc], "initWithClientEndpoint:controlPeer:interfaceName:connectTimeout:", host_with_numeric_port, v43, v45, v49);
        v53 = v52;
        if (v52 && -[RSDRemoteDevice device_name](v52, "device_name"))
        {
          -[RSDRemoteCoreDeviceDevice attach](v53, "attach");
          v54 = sub_10000326C();
          v55 = objc_claimAutoreleasedReturnValue(v54);
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v56 = -[RSDRemoteDevice device_name](v53, "device_name");
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = v56;
            *(_WORD *)&buf[12] = 2082;
            *(_QWORD *)&buf[14] = v45;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Attached new client device: %{public}s for interface: %{public}s", buf, 0x16u);
          }

          v57 = sub_1000047A8(v44, "OK");
          v19 = (void *)objc_claimAutoreleasedReturnValue(v57);
          xpc_dictionary_set_string(v19, "device_name", -[RSDRemoteDevice device_name](v53, "device_name"));
        }
        else
        {
          v90 = sub_10000326C();
          v91 = objc_claimAutoreleasedReturnValue(v90);
          if (os_log_type_enabled(v91, OS_LOG_TYPE_FAULT))
            sub_100030CC0();

          v92 = sub_1000047A8(v44, "ERROR");
          v19 = (void *)objc_claimAutoreleasedReturnValue(v92);
        }

      }
      else
      {
        v96 = sub_10000326C();
        v97 = objc_claimAutoreleasedReturnValue(v96);
        if (os_log_type_enabled(v97, OS_LOG_TYPE_ERROR))
          sub_100030D18();

        v98 = sub_1000047A8(v44, "ERROR");
        v19 = (void *)objc_claimAutoreleasedReturnValue(v98);
      }

    }
    else
    {
      v73 = sub_10000326C();
      v74 = objc_claimAutoreleasedReturnValue(v73);
      if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
        sub_100030CEC();

      v75 = sub_1000047A8(v44, "ERROR");
      v19 = (void *)objc_claimAutoreleasedReturnValue(v75);
    }

    goto LABEL_100;
  }
  if (strcmp(v11, "remove_device"))
  {
    v12 = sub_10000326C();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1000309EC();
LABEL_20:

    v18 = sub_10001ECE8(v5);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
    goto LABEL_100;
  }
  v58 = v4;
  v99 = v5;
  __s2a = (char *)xpc_dictionary_get_string(v99, "device_name");
  if (!__s2a)
  {
    v76 = sub_10000326C();
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
      sub_100030D44();

    v78 = sub_1000047A8(v99, "ERROR");
    v79 = objc_claimAutoreleasedReturnValue(v78);
LABEL_79:
    v19 = (void *)v79;
    goto LABEL_80;
  }
  v106 = 0u;
  v107 = 0u;
  handler = 0u;
  v105 = 0u;
  v59 = (id)qword_100057C80;
  v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &handler, buf, 16);
  if (!v60)
  {
LABEL_59:

LABEL_76:
    v84 = sub_10000326C();
    v85 = objc_claimAutoreleasedReturnValue(v84);
    if (os_log_type_enabled(v85, OS_LOG_TYPE_ERROR))
      sub_100030D70();

    v86 = sub_1000047A8(v99, "ERROR");
    v79 = objc_claimAutoreleasedReturnValue(v86);
    goto LABEL_79;
  }
  v61 = *(_QWORD *)v105;
LABEL_51:
  v62 = 0;
  while (1)
  {
    if (*(_QWORD *)v105 != v61)
      objc_enumerationMutation(v59);
    v63 = *(void **)(*((_QWORD *)&handler + 1) + 8 * v62);
    v64 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "control_peer", v99));
    if (v64 == v58)
      break;

LABEL_57:
    if (v60 == (id)++v62)
    {
      v60 = objc_msgSend(v59, "countByEnumeratingWithState:objects:count:", &handler, buf, 16);
      if (v60)
        goto LABEL_51;
      goto LABEL_59;
    }
  }
  v65 = strcmp((const char *)objc_msgSend(v63, "device_name"), __s2a) == 0;

  if (!v65)
    goto LABEL_57;
  v80 = v63;

  if (!v80)
    goto LABEL_76;
  v81 = sub_10000326C();
  v82 = objc_claimAutoreleasedReturnValue(v81);
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(v108) = 136446210;
    *(_QWORD *)((char *)&v108 + 4) = __s2a;
    _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Disconnecting removed device: %{public}s", (uint8_t *)&v108, 0xCu);
  }

  objc_msgSend(v80, "disconnect");
  objc_msgSend(v80, "cancelListener");
  v83 = sub_1000047A8(v99, "OK");
  v19 = (void *)objc_claimAutoreleasedReturnValue(v83);

LABEL_80:
LABEL_100:
  if (v19)
  {
    xpc_dictionary_send_reply(v19);

  }
LABEL_102:
  objc_autoreleasePoolPop(v6);

}

void sub_1000045B8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_list va;

  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1000045D8(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RemoteServiceDiscovery", "CoreDevice");
  v2 = (void *)qword_100057C98;
  qword_100057C98 = (uint64_t)v1;

}

void sub_100004608(void *a1)
{
  _xpc_connection_s *v1;
  id v2;
  id v3;
  __int128 v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  _xpc_connection_s *v9;
  id v10;
  NSObject *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  uint8_t buf[4];
  id v19;
  _BYTE v20[128];

  v1 = a1;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v2 = objc_msgSend((id)qword_100057C80, "copy");
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v15;
    *(_QWORD *)&v4 = 136446210;
    v13 = v4;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v2);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        v9 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "control_peer", v13));

        if (v9 == v1)
        {
          v10 = sub_10000326C();
          v11 = objc_claimAutoreleasedReturnValue(v10);
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            v12 = objc_msgSend(v8, "device_name");
            *(_DWORD *)buf = v13;
            v19 = v12;
            _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Peer connection canceled, disconnecting device: %{public}s", buf, 0xCu);
          }

          objc_msgSend(v8, "disconnect");
          objc_msgSend(v8, "cancelListener");
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v5);
  }

  xpc_connection_cancel(v1);
}

id sub_1000047A8(void *a1, const char *a2)
{
  xpc_object_t reply;

  reply = xpc_dictionary_create_reply(a1);
  xpc_dictionary_set_string(reply, "result", a2);
  return reply;
}

void sub_1000047E0(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v13;
  int v14;
  id v15;
  __int16 v16;
  id v17;

  v3 = a2;
  v4 = sub_10000326C();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "device_name");
    v14 = 138543618;
    v15 = v3;
    v16 = 2082;
    v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> got incoming remoted connection for device: %{public}s", (uint8_t *)&v14, 0x16u);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));
  if (v7)
  {
    v8 = sub_10000326C();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v10 = *(void **)(a1 + 32);
      v14 = 138543362;
      v15 = v10;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@> canceling existing connection to replace it", (uint8_t *)&v14, 0xCu);
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "client_connection"));
    if (v11)
    {
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "client_connection"));
      nw_connection_cancel(v12);

    }
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));
    xpc_remote_connection_cancel();

    objc_msgSend(*(id *)(a1 + 32), "setClient_connection:", v3);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "setClient_connection:", v3);
    objc_msgSend(*(id *)(a1 + 32), "needsConnect");
  }

}

void sub_100004980(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  unsigned int port;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  id v12;
  void *v13;
  id v14;
  NSObject *v15;
  id v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  id v21;
  id v22;
  uint64_t v23;
  BOOL v24;
  int v25;
  unsigned int v26;
  __int16 v27;
  id v28;

  v5 = a3;
  v6 = v5;
  if ((_DWORD)a2 == 3)
  {
    v14 = sub_10000326C();
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      sub_100030EF4();

    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v16 = sub_1000047A8(*(void **)(a1 + 48), "ERROR");
      v13 = (void *)objc_claimAutoreleasedReturnValue(v16);
    }
    else
    {
      v13 = 0;
    }
    objc_msgSend(*(id *)(a1 + 40), "disconnect");
    objc_msgSend(*(id *)(a1 + 40), "cancelListener");
    goto LABEL_27;
  }
  if ((_DWORD)a2 != 2)
  {
    if (v5)
    {
      v17 = sub_10000326C();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100030DFC((uint64_t)v6, a2, v18);

      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        goto LABEL_26;
    }
LABEL_20:
    v13 = 0;
    goto LABEL_32;
  }
  port = nw_listener_get_port(*(nw_listener_t *)(a1 + 32));
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    v19 = sub_10000326C();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      v21 = objc_msgSend(*(id *)(a1 + 40), "device_name");
      v25 = 67109378;
      v26 = port;
      v27 = 2082;
      v28 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "listener port: %u for device: %{public}s, ignored because client is no longer waiting for reply", (uint8_t *)&v25, 0x12u);
    }

    goto LABEL_20;
  }
  v8 = sub_10000326C();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (port)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11 = objc_msgSend(*(id *)(a1 + 40), "device_name");
      v25 = 67109378;
      v26 = port;
      v27 = 2082;
      v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "listener port: %u for device: %{public}s", (uint8_t *)&v25, 0x12u);
    }

    v12 = sub_1000047A8(*(void **)(a1 + 48), "OK");
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    xpc_dictionary_set_string(v13, "device_name", (const char *)objc_msgSend(*(id *)(a1 + 40), "device_name"));
    xpc_dictionary_set_uint64(v13, "listener_port", port);
    goto LABEL_27;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    sub_100030E6C(a1, v10);

LABEL_26:
  v22 = sub_1000047A8(*(void **)(a1 + 48), "ERROR");
  v13 = (void *)objc_claimAutoreleasedReturnValue(v22);
LABEL_27:
  v23 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  if (*(_BYTE *)(v23 + 24))
    v24 = v13 == 0;
  else
    v24 = 1;
  if (!v24)
  {
    *(_BYTE *)(v23 + 24) = 0;
    xpc_dictionary_send_reply(v13);
  }
LABEL_32:

}

void sub_100004C4C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_100004C5C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100004C80(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x12u);
}

void sub_1000054A4(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000582C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *string_ptr;

  v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    if (!strcmp(string_ptr, "HasInternalSecurityPolicies"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setIs_exposed_to_untrusted_devices_internal:", 1);
    }
    else if (!strcmp(string_ptr, "PreSetup"))
    {
      objc_msgSend(*(id *)(a1 + 32), "setIs_exposed_to_untrusted_devices_presetup:", 1);
    }
  }
  else
  {
    v5 = (void *)qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      sub_1000311AC(a1, v5);
  }

  return 1;
}

id sub_1000058F0(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  id v5;
  const char *string_ptr;
  NSNumber *v7;
  void *v8;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  void *v13;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v3);
    v7 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", remote_device_type_parse(string_ptr));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v13 = v8;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v13, 1));

  }
  else if (type == (xpc_type_t)&_xpc_type_array)
  {
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10000B6F0;
    v10[3] = &unk_100051230;
    v12 = a1;
    v5 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v11 = v5;
    xpc_array_apply(v3, v10);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void sub_100005B68(void *a1)
{
  unsigned int (**v1)(id, _QWORD);
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v1 = a1;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)qword_100057CB0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
LABEL_3:
    v6 = 0;
    while (1)
    {
      if (*(_QWORD *)v8 != v5)
        objc_enumerationMutation(v2);
      if (!v1[2](v1, *(_QWORD *)(*((_QWORD *)&v7 + 1) + 8 * v6)))
        break;
      if (v4 == (id)++v6)
      {
        v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
        if (v4)
          goto LABEL_3;
        break;
      }
    }
  }

}

uint64_t sub_100005E20(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t result;
  __int128 v5;
  void *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  __int128 v13;
  _QWORD v14[3];
  uint8_t buf[4];
  void *v16;
  __int16 v17;
  id v18;

  memset(v14, 170, sizeof(v14));
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
  v3 = v2;
  if (v2)
    objc_msgSend(v2, "getTcpOptions");
  else
    memset(v14, 0, 20);

  result = sub_10001E334((int)objc_msgSend(*(id *)(a1 + 32), "socket"), 0, 0, (unsigned __int8 *)v14, (int *)&v14[2] + 1);
  if (!(_DWORD)result)
  {
    *(_QWORD *)&v5 = 138543618;
    v13 = v5;
    do
    {
      v6 = (void *)qword_100057FE0;
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(void **)(a1 + 32);
        v8 = v6;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "device"));
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service"));
        v11 = objc_msgSend(v10, "name");
        *(_DWORD *)buf = v13;
        v16 = v9;
        v17 = 2080;
        v18 = v11;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@> Got incoming connection for \"%s\"", buf, 0x16u);

      }
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "service", v13));
      objc_msgSend(v12, "fireDevice:fd:", *(_QWORD *)(a1 + 40), HIDWORD(v14[2]));

      close(SHIDWORD(v14[2]));
      result = sub_10001E334((int)objc_msgSend(*(id *)(a1 + 32), "socket"), 0, 0, (unsigned __int8 *)v14, (int *)&v14[2] + 1);
    }
    while (!(_DWORD)result);
  }
  return result;
}

uint64_t sub_100005FD4(uint64_t a1)
{
  return close((int)objc_msgSend(*(id *)(a1 + 32), "socket"));
}

uint64_t sub_100006694(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));

  if (!v5)
    objc_msgSend(*(id *)(a1 + 32), "setLatestConnectError:", a3);
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id sub_100006C4C(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "triggerNeedsConnect");
}

uint64_t sub_100006D1C(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;

  v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    v5 = *(void **)(a1 + 32);
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_string_get_string_ptr(v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "addObject:", v7);

  }
  return 1;
}

id sub_100007B60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "triggerNeedsConnect");
}

void sub_100007B68(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  void *v5;
  uint64_t v6;
  void (**v7)(id, uint64_t);

  v5 = *(void **)(a1 + 32);
  v7 = a4;
  v6 = sub_100019990(v5, a3);
  v7[2](v7, v6);

}

void sub_100007BB8(uint64_t a1, void *a2)
{
  id v3;
  id *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  const char *v11;
  xpc_type_t type;
  unsigned int v13;
  const char *string;
  NSObject *v15;
  id v16;
  unsigned int v17;
  id v18;
  const char *v19;
  const char *v20;
  NSObject *v21;
  id v22;
  NSObject *v23;
  id v24;
  xpc_object_t value;
  void *v26;
  xpc_object_t reply;
  xpc_type_t v28;
  NSObject *v29;
  const char *v30;
  const char *v31;
  NSObject *v32;
  id v33;
  dispatch_time_t v34;
  unsigned int v35;
  id v36;
  NSObject *v37;
  _QWORD *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  xpc_object_t v44;
  void *v45;
  void *v46;
  void *v47;
  unsigned int v48;
  _BYTE *v49;
  NSObject *v50;
  id v51;
  const char *v52;
  uint64_t v53;
  uint64_t uint64;
  NSObject *v55;
  id v56;
  id v57;
  _BOOL4 v58;
  uint64_t v59;
  void *v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  const char *v64;
  id v65;
  _BOOL4 v66;
  NSObject *v67;
  id v68;
  unsigned int v69;
  _BOOL4 v70;
  id v71;
  xpc_object_t v72;
  void *v73;
  void *v74;
  id v75;
  uint64_t v76;
  void *v77;
  NSObject *v78;
  id v79;
  id v80;
  uint64_t v81;
  _QWORD v82[5];
  _QWORD v83[5];
  _QWORD applier[5];
  _QWORD v85[5];
  _QWORD v86[5];
  _QWORD block[5];
  uint8_t buf[4];
  id v89;
  __int16 v90;
  const char *v91;

  v3 = a2;
  v4 = (id *)(a1 + 32);
  v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));
  if (v5)
  {
    v6 = (void *)v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));
    v8 = *(void **)(a1 + 40);

    if (v7 != v8)
    {
      v9 = qword_100057FE0;
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
      {
        v10 = *v4;
        *(_DWORD *)buf = 138543362;
        v89 = v10;
        v11 = "%{public}@> ignore message from previous connection";
LABEL_5:
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, v11, buf, 0xCu);
        goto LABEL_97;
      }
      goto LABEL_97;
    }
  }
  type = xpc_get_type(v3);
  v13 = objc_msgSend(*v4, "state");
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (v13 == 5)
    {
      v15 = qword_100057FE0;
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
      {
        v16 = *v4;
        *(_DWORD *)buf = 138543362;
        v89 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@> Device connection interrupted, device already gone, giving up", buf, 0xCu);
      }
    }
    else
    {
      if (objc_msgSend(*v4, "state") != 2)
      {
        v21 = qword_100057FE0;
        if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
        {
          v22 = *v4;
          *(_DWORD *)buf = 138543362;
          v89 = v22;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@> Device must renegotiate TLS", buf, 0xCu);
        }
        *((_BYTE *)*v4 + 59) = 0;
        objc_msgSend(*v4, "refreshServiceListeners");
        if (*((_BYTE *)*v4 + 57))
        {
          v23 = qword_100057FE0;
          if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
          {
            v24 = *v4;
            *(_DWORD *)buf = 138543362;
            v89 = v24;
            _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@> Device connection interrupted. Proceed to reset", buf, 0xCu);
          }
          objc_msgSend(*v4, "disconnect");
          objc_msgSend(*v4, "setState:", 0);
          objc_msgSend(*v4, "attach");
          goto LABEL_97;
        }
      }
      v32 = qword_100057FE0;
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
      {
        v33 = *v4;
        *(_DWORD *)buf = 138543362;
        v89 = v33;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@> Device connection interrupted", buf, 0xCu);
      }
      if (objc_msgSend(*v4, "state") == 1)
      {
        v34 = dispatch_time(0, 1000000000);
        block[0] = _NSConcreteStackBlock;
        block[1] = 3221225472;
        block[2] = sub_100008A70;
        block[3] = &unk_1000510D0;
        block[4] = *v4;
        dispatch_after(v34, (dispatch_queue_t)qword_100057CB8, block);
      }
      else
      {
        v35 = objc_msgSend(*v4, "state");
        v36 = *v4;
        if (v35 == 2)
        {
          objc_msgSend(v36, "setState:", 0);
          v37 = qword_100057CB8;
          v86[0] = _NSConcreteStackBlock;
          v86[1] = 3221225472;
          v86[2] = sub_100008A78;
          v86[3] = &unk_1000510D0;
          v86[4] = *v4;
          v38 = v86;
        }
        else
        {
          objc_msgSend(v36, "setState:", 4);
          v37 = qword_100057CB8;
          v85[0] = _NSConcreteStackBlock;
          v85[1] = 3221225472;
          v85[2] = sub_100008A80;
          v85[3] = &unk_1000510D0;
          v85[4] = *v4;
          v38 = v85;
        }
        dispatch_async(v37, v38);
      }
    }
    v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "connection"));

    if (v46)
    {
      v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "connection"));
      xpc_remote_connection_cancel();

      objc_msgSend(*v4, "setConnection:", 0);
    }
    goto LABEL_97;
  }
  if (v13 == 1)
  {
    string = xpc_dictionary_get_string(v3, "MessageType");
    objc_msgSend(*v4, "setMessaging_protocol_version:", xpc_dictionary_get_uint64(v3, "MessagingProtocolVersion"));
    if (objc_msgSend(*v4, "messaging_protocol_version") && (!string || strcmp(string, "Handshake")))
    {
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
        sub_100031854();
      goto LABEL_96;
    }
    objc_msgSend(*v4, "setUuid:", xpc_dictionary_get_uuid(v3, "UUID"));
    value = xpc_dictionary_get_value(v3, "Properties");
    v26 = (void *)objc_claimAutoreleasedReturnValue(value);
    reply = v26;
    if (v26)
    {
      v28 = xpc_get_type(v26);
      v29 = qword_100057FE0;
      if (v28 != (xpc_type_t)&_xpc_type_dictionary)
      {
        if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
          sub_100031828();

        goto LABEL_96;
      }
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
      {
        v39 = *v4;
        *(_DWORD *)buf = 138543362;
        v89 = v39;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "%{public}@> Updating existing properties dictionary", buf, 0xCu);
      }
      applier[0] = _NSConcreteStackBlock;
      applier[1] = 3221225472;
      applier[2] = sub_100008A88;
      applier[3] = &unk_100051148;
      applier[4] = *v4;
      xpc_dictionary_apply(reply, applier);
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEBUG))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "properties"));
        v41 = (void *)xpc_copy_clean_description(v40);

        if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEBUG))
          sub_1000317C0();
        free(v41);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "public_properties"));
        v43 = (void *)xpc_copy_clean_description(v42);

        if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEBUG))
          sub_100031758();
        free(v43);
      }
    }
    v44 = xpc_dictionary_get_value(v3, "Services");
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_100008B34;
    v83[3] = &unk_100051148;
    v83[4] = *v4;
    xpc_dictionary_apply(v45, v83);
    if ((unint64_t)objc_msgSend(*v4, "messaging_protocol_version") < 4
      || (objc_msgSend(*v4, "tlsEnabled") & 1) != 0)
    {
      objc_msgSend(*v4, "handshakeCompleted:", 0);
LABEL_67:

LABEL_90:
      goto LABEL_97;
    }
    objc_msgSend(*v4, "setState:", 2);
    v48 = objc_msgSend(*v4, "negotiateTls");
    v49 = *v4;
    if (v48)
    {
      v49[58] = 1;
      v50 = qword_100057FE0;
      if (!os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_67;
      v51 = *v4;
      *(_DWORD *)buf = 138543362;
      v89 = v51;
      v52 = "%{public}@> Requested TLS.";
    }
    else
    {
      v49[58] = 0;
      v50 = qword_100057FE0;
      if (!os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
        goto LABEL_67;
      v57 = *v4;
      *(_DWORD *)buf = 138543362;
      v89 = v57;
      v52 = "%{public}@> Declined TLS.";
    }
    _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, v52, buf, 0xCu);
    goto LABEL_67;
  }
  v17 = objc_msgSend(*v4, "state");
  v18 = *v4;
  if (v17 != 2)
  {
    if (objc_msgSend(v18, "state") != 3)
      sub_100031C14(&v81, buf, v4);
    if (objc_msgSend(*v4, "messaging_protocol_version"))
    {
      v30 = xpc_dictionary_get_string(v3, "MessageType");
      if (v30)
      {
        v31 = v30;
        if (!strcmp(v30, "Heartbeat"))
        {
          if ((xpc_dictionary_expects_reply(v3) & 1) == 0)
          {
            if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
              sub_1000319D4();
            goto LABEL_96;
          }
          uint64 = xpc_dictionary_get_uint64(v3, "SequenceNumber");
          v55 = qword_100057FE0;
          if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
          {
            v56 = *v4;
            *(_DWORD *)buf = 138543618;
            v89 = v56;
            v90 = 2048;
            v91 = (const char *)uint64;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}@> Responding to heartbeat request with sequence number %llu", buf, 0x16u);
          }
          *((_QWORD *)*v4 + 11) = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
          ++*((_QWORD *)*v4 + 13);
          reply = xpc_dictionary_create_reply(v3);
          xpc_dictionary_set_uint64(reply, "SequenceNumber", uint64);
        }
        else
        {
          if (!strcmp(v31, "Reset"))
          {
            reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "handleReset:", v3));
            if (reply)
              goto LABEL_89;
            goto LABEL_96;
          }
          if (!strcmp(v31, "ResetGoahead"))
            goto LABEL_79;
          if (!strcmp(v31, "Timesync"))
          {
            if ((xpc_dictionary_expects_reply(v3) & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
                sub_100031AF4();
              goto LABEL_96;
            }
            v72 = xpc_dictionary_get_value(v3, "TimesyncPayload");
            v73 = (void *)objc_claimAutoreleasedReturnValue(v72);
            if (!v73)
            {
              if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
                sub_100031A34();
              goto LABEL_96;
            }
            v74 = v73;
            v75 = sub_10000E3A0(v73, (void *)qword_100057FE0);
            v76 = objc_claimAutoreleasedReturnValue(v75);
            if (!v76)
            {
              if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
                sub_100031A94();

              goto LABEL_96;
            }
            v77 = (void *)v76;
            reply = xpc_dictionary_create_reply(v3);
            xpc_dictionary_set_value(reply, "TimesyncPayload", v77);

          }
          else
          {
            if (strcmp(v31, "Goodbye"))
            {
              if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
                sub_100031BB4();
              goto LABEL_96;
            }
            if ((xpc_dictionary_expects_reply(v3) & 1) == 0)
            {
              if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
                sub_100031B54();
              goto LABEL_96;
            }
            reply = xpc_dictionary_create_reply(v3);
            xpc_dictionary_set_string(reply, "Result", "Ok");
            v82[0] = _NSConcreteStackBlock;
            v82[1] = 3221225472;
            v82[2] = sub_100008D60;
            v82[3] = &unk_1000510D0;
            v82[4] = *v4;
            dispatch_async((dispatch_queue_t)qword_100057CB8, v82);
          }
        }
        if (!reply)
          goto LABEL_97;
        goto LABEL_89;
      }
      if (!os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
        goto LABEL_96;
LABEL_69:
      sub_100031914();
      goto LABEL_96;
    }
    if (!os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      goto LABEL_96;
LABEL_53:
    sub_1000318B4();
    goto LABEL_96;
  }
  if (!objc_msgSend(v18, "messaging_protocol_version"))
  {
    if (!os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      goto LABEL_96;
    goto LABEL_53;
  }
  v19 = xpc_dictionary_get_string(v3, "MessageType");
  if (!v19)
  {
    if (!os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      goto LABEL_96;
    goto LABEL_69;
  }
  v20 = v19;
  if (!strcmp(v19, "Reset"))
  {
    v53 = objc_claimAutoreleasedReturnValue(objc_msgSend(*v4, "handleReset:", v3));
    if (v53)
    {
      reply = (xpc_object_t)v53;
LABEL_89:
      xpc_dictionary_send_reply(reply);
      goto LABEL_90;
    }
LABEL_96:
    objc_msgSend(*v4, "disconnect");
    goto LABEL_97;
  }
  if (!strcmp(v20, "ResetGoahead"))
  {
LABEL_79:
    objc_msgSend(*v4, "handleResetGoAhead");
    goto LABEL_97;
  }
  if (strcmp(v20, "StartTls"))
  {
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      sub_100031974();
    goto LABEL_96;
  }
  v58 = xpc_dictionary_get_BOOL(v3, "YesNo");
  v59 = xpc_dictionary_get_uint64(v3, "TlsPolicy");
  if (v59)
  {
    v60 = (void *)qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
    {
      v61 = *v4;
      v62 = v60;
      *(_DWORD *)buf = 138543618;
      v89 = v61;
      v90 = 2082;
      v91 = sub_100017A60(v59);
      _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "%{public}@> Peer TLS requirement: %{public}s", buf, 0x16u);

    }
  }
  v63 = qword_100057FE0;
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
  {
    v64 = "declined";
    v65 = *v4;
    if (v58)
      v64 = "requested";
    *(_DWORD *)buf = 138543618;
    v89 = v65;
    v90 = 2080;
    v91 = v64;
    _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_DEFAULT, "%{public}@> Peer %s TLS.", buf, 0x16u);
  }
  if (*((_BYTE *)*v4 + 58))
    v66 = v58;
  else
    v66 = 0;
  if (v66)
  {
    v67 = qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
    {
      v68 = *v4;
      *(_DWORD *)buf = 138543362;
      v89 = v68;
      _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "%{public}@> Both sides requested TLS.", buf, 0xCu);
    }
    *((_BYTE *)*v4 + 59) = 1;
    v69 = objc_msgSend(*v4, "isHost");
    v9 = qword_100057FE0;
    v70 = os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT);
    if (!v69)
    {
      if (!v70)
        goto LABEL_97;
      v80 = *v4;
      *(_DWORD *)buf = 138543362;
      v89 = v80;
      v11 = "%{public}@> Wait for peer to reset connection to enable TLS.";
      goto LABEL_5;
    }
    if (v70)
    {
      v71 = *v4;
      *(_DWORD *)buf = 138543362;
      v89 = v71;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@> Resetting connection to enable TLS.", buf, 0xCu);
    }
    objc_msgSend(*v4, "_resetNow");
  }
  else
  {
    *((_BYTE *)*v4 + 59) = 0;
    v78 = qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
    {
      v79 = *v4;
      *(_DWORD *)buf = 138543362;
      v89 = v79;
      _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_DEFAULT, "%{public}@> Not enabling TLS.", buf, 0xCu);
    }
    objc_msgSend(*v4, "handshakeCompleted:", v59);
  }
LABEL_97:

}

id sub_100008A70(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "triggerNeedsConnect");
}

id sub_100008A78(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "triggerNeedsConnect");
}

id sub_100008A80(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "triggerNeedsConnect");
}

uint64_t sub_100008A88(uint64_t a1, const char *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  const char *v9;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "properties"));
  xpc_dictionary_set_value(v6, a2, v5);

  v9 = a2;
  if (lfind(&v9, &off_100051250, &qword_1000410E8, 8uLL, (int (__cdecl *)(const void *, const void *))sub_10000B7A0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "public_properties"));
    xpc_dictionary_set_value(v7, a2, v5);

  }
  return 1;
}

uint64_t sub_100008B34(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  id *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  RSDRemoteService *v12;
  RSDRemoteService *v13;
  void *v14;
  id v16;
  int v17;
  id v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  void *v22;

  v5 = a3;
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v7 = *(void **)(a1 + 32);
    v6 = (id *)(a1 + 32);
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "serviceWithName:", a2));
    v9 = (void *)xpc_copy_clean_description(v5);
    v10 = qword_100057FE0;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEBUG))
      {
        v16 = *v6;
        v17 = 138543874;
        v18 = v16;
        v19 = 2080;
        v20 = a2;
        v21 = 2080;
        v22 = v9;
        _os_log_debug_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "%{public}@> Updating port for existing remote service \"%s\": %s", (uint8_t *)&v17, 0x20u);
      }
      objc_msgSend(v8, "updateWithDescription:", v5);

    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
      {
        v11 = *v6;
        v17 = 138543874;
        v18 = v11;
        v19 = 2082;
        v20 = a2;
        v21 = 2082;
        v22 = v9;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "%{public}@> Adding remote service \"%{public}s\": %{public}s", (uint8_t *)&v17, 0x20u);
      }
      v12 = -[RSDRemoteService initWithName:description:]([RSDRemoteService alloc], "initWithName:description:", a2, v5);
      if (v12)
      {
        v13 = v12;
        -[RSDRemoteService setDevice:](v12, "setDevice:", *v6);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v6, "services"));
        objc_msgSend(v14, "addObject:", v13);

      }
      else if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      {
        sub_100031CD4();
      }
    }
    free(v9);
  }
  else if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
  {
    sub_100031D48();
  }

  return 1;
}

id sub_100008D60(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "disconnect");
}

uint64_t sub_100009064(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t sub_100009074(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_100009084(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t uint64;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  void (*v10)(void);
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  uint64_t v19;

  v3 = a2;
  v4 = a1[4];
  v5 = *(_QWORD *)(v4 + 80);
  *(_QWORD *)(v4 + 80) = 0;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      sub_100031E20();
    goto LABEL_10;
  }
  uint64 = xpc_dictionary_get_uint64(v3, "SequenceNumber");
  v7 = qword_100057FE0;
  if (uint64 != a1[6])
  {
    v11 = uint64;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
    {
      v12 = a1[4];
      v13 = a1[6];
      v14 = 138543874;
      v15 = v12;
      v16 = 2048;
      v17 = v13;
      v18 = 2048;
      v19 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_ERROR, "%{public}@> Heartbeat %llu failed - WRONG sequence number %llu in reply", (uint8_t *)&v14, 0x20u);
    }
LABEL_10:
    v10 = *(void (**)(void))(a1[5] + 16);
    goto LABEL_11;
  }
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
  {
    v8 = a1[4];
    v9 = a1[6];
    v14 = 138543618;
    v15 = v8;
    v16 = 2048;
    v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> Heartbeat %llu succeeded", (uint8_t *)&v14, 0x16u);
  }
  *(_QWORD *)(a1[4] + 64) = v5;
  *(_QWORD *)(a1[4] + 72) = clock_gettime_nsec_np(_CLOCK_MONOTONIC);
  v10 = *(void (**)(void))(a1[5] + 16);
LABEL_11:
  v10();

}

void sub_100009488(uint64_t a1, void *a2)
{
  id v3;
  xpc_object_t value;
  void *v5;
  void (*v6)(void);

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_error)
  {
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      sub_100031F58();
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  else
  {
    value = xpc_dictionary_get_value(v3, "TimesyncPayload");
    v5 = (void *)objc_claimAutoreleasedReturnValue(value);
    if (v5)
    {
      sub_10000E4D4(*(_QWORD *)(a1 + 48), v5, (void *)qword_100057FE0);
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
        sub_100031FBC();
      v6 = *(void (**)(void))(*(_QWORD *)(a1 + 40) + 16);
    }
    v6();

  }
}

uint64_t sub_1000096FC(uint64_t a1, xpc_object_t object)
{
  NSObject *v3;
  uint64_t v4;
  int v6;
  uint64_t v7;

  if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_error
    || objc_msgSend(*(id *)(a1 + 32), "state") != 5)
  {
    return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), 0);
  }
  v3 = qword_100057FE0;
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138543362;
    v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> Device gone, aborting goodbye", (uint8_t *)&v6, 0xCu);
  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

id sub_100009A98(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_resetNow");
}

void sub_100009F94(uint64_t a1, xpc_object_t object)
{
  xpc_type_t type;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  id v8;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v11;

  type = xpc_get_type(object);
  v4 = *(void **)(a1 + 32);
  if (type == (xpc_type_t)&_xpc_type_error)
  {
    if (objc_msgSend(v4, "state") == 5)
    {
      v6 = qword_100057FE0;
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
      {
        v7 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v11 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@> Device gone, aborting reset", buf, 0xCu);
      }
    }
    else
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000A124;
      block[3] = &unk_1000510D0;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_async((dispatch_queue_t)qword_100057CB8, block);
    }
  }
  else
  {
    objc_msgSend(v4, "refreshServiceListeners");
    v8 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v8, "MessageType", "ResetGoahead");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));
    xpc_remote_connection_send_message(v5, v8);

    *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  }
}

id sub_10000A124(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 56) = 0;
  return objc_msgSend(*(id *)(a1 + 32), "reset");
}

void sub_10000A190(uint64_t a1)
{
  void (**v2)(void);

  if ((objc_msgSend(*(id *)(a1 + 32), "connectable") & 1) != 0
    || objc_msgSend(*(id *)(a1 + 32), "state") == 5)
  {
    if (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "count"))
    {
      v2 = (void (**)(void))objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "objectAtIndex:", 0));
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 112), "removeObjectAtIndex:", 0);
      v2[2]();
      objc_msgSend(*(id *)(a1 + 32), "drainPendedRequests");

    }
  }
}

void sub_10000B178()
{
  id v0;
  void *v1;
  id v2;

  v0 = sub_1000194E4();
  if (v0)
  {
    v2 = v0;
    v1 = (void *)sub_100018E80();
    xpc_dictionary_set_value((xpc_object_t)qword_100057FF8, "EncryptedRemoteXPCPopulatedOIDs", v1);

    v0 = v2;
  }

}

void sub_10000B1CC()
{
  const __CFString *v0;
  CFUUIDRef v1;
  const __CFUUID *v2;
  const __CFUUID *v3;
  CFStringRef v4;
  __int128 v5;
  NSObject *v6;
  CFUUIDBytes v7;
  uint64_t buf;
  __int16 v9;
  __int128 *v10;
  uuid_string_t out;

  v0 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057FD8, "valueForKey:", CFSTR("device-uuid")));
  v1 = CFUUIDCreateFromString(0, v0);
  if (v1)
  {
    v2 = v1;
  }
  else
  {
    v3 = CFUUIDCreate(0);
    if (!v3)
      sub_100032678(&buf, out);
    v2 = v3;
    v4 = CFUUIDCreateString(0, v3);
    if (!v4)
      sub_1000326E0(&buf, out);
    v0 = v4;
    objc_msgSend((id)qword_100057FD8, "setValue:forKey:", v4, CFSTR("device-uuid"));
  }
  v7 = CFUUIDGetUUIDBytes(v2);
  uuid_copy((unsigned __int8 *)&xmmword_100057FE8, &v7.byte0);
  *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out = v5;
  *(_OWORD *)&out[16] = v5;
  uuid_unparse((const unsigned __int8 *)&xmmword_100057FE8, out);
  v6 = qword_100057FE0;
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
  {
    buf = 0x1004100202;
    v9 = 2096;
    v10 = &xmmword_100057FE8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "device-uuid: %{uuid_t}.16P", (uint8_t *)&buf, 0x12u);
  }
  CFRelease(v2);
  CFRelease(v0);
}

char *sub_10000B348(const __CFString *a1)
{
  CFIndex v2;
  char *v3;
  char *v4;
  uint64_t v6;
  _OWORD v7[5];

  v2 = (2 * CFStringGetLength(a1)) | 1;
  v3 = (char *)malloc_type_malloc(v2, 0xDB3AC104uLL);
  if (!v3)
    sub_100032748(&v6, v7);
  v4 = v3;
  if (!CFStringGetCString(a1, v3, v2, 0x8000100u))
    sub_1000327B0(&v6, v7);
  return v4;
}

void sub_10000B3FC(void *a1, const char *a2, const __CFString *a3)
{
  id v5;
  CFTypeID v6;
  char *v7;
  CFTypeID v8;
  BOOL v9;
  CFTypeID v10;
  CFTypeID v11;
  const UInt8 *BytePtr;
  size_t Length;
  void *v14;
  uint64_t valuePtr;

  v5 = a1;
  v6 = CFGetTypeID(a3);
  if (v6 == CFStringGetTypeID())
  {
    v7 = sub_10000B348(a3);
    xpc_dictionary_set_string(v5, a2, v7);
    free(v7);
  }
  else
  {
    v8 = CFGetTypeID(a3);
    if (v8 == CFBooleanGetTypeID())
    {
      v9 = CFBooleanGetValue((CFBooleanRef)a3) != 0;
      xpc_dictionary_set_BOOL(v5, a2, v9);
    }
    else
    {
      v10 = CFGetTypeID(a3);
      if (v10 == CFNumberGetTypeID())
      {
        valuePtr = 0xAAAAAAAAAAAAAAAALL;
        CFNumberGetValue((CFNumberRef)a3, kCFNumberSInt64Type, &valuePtr);
        xpc_dictionary_set_uint64(v5, a2, valuePtr);
      }
      else
      {
        v11 = CFGetTypeID(a3);
        if (v11 == CFDataGetTypeID())
        {
          BytePtr = CFDataGetBytePtr((CFDataRef)a3);
          Length = CFDataGetLength((CFDataRef)a3);
          xpc_dictionary_set_data(v5, a2, BytePtr, Length);
        }
        else
        {
          v14 = (void *)qword_100057FE0;
          if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
            sub_100032818((uint64_t)a2, v14, a3);
        }
      }
    }
  }

}

void start()
{
  NSMutableSet *v0;
  void *v1;
  NSMutableSet *v2;
  void *v3;
  NSMutableSet *v4;
  void *v5;
  xpc_object_t v6;
  void *v7;
  os_log_t v8;
  void *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  void *v12;
  uint8_t v13[16];

  v0 = objc_opt_new(NSMutableSet);
  v1 = (void *)qword_100058000;
  qword_100058000 = (uint64_t)v0;

  v2 = objc_opt_new(NSMutableSet);
  v3 = (void *)qword_100058008;
  qword_100058008 = (uint64_t)v2;

  v4 = objc_opt_new(NSMutableSet);
  v5 = (void *)qword_100057CB0;
  qword_100057CB0 = (uint64_t)v4;

  v6 = xpc_dictionary_create(0, 0, 0);
  v7 = (void *)qword_100057FF8;
  qword_100057FF8 = (uint64_t)v6;

  v8 = os_log_create("com.apple.RemoteServiceDiscovery", "remoted");
  v9 = (void *)qword_100057FE0;
  qword_100057FE0 = (uint64_t)v8;

  v10 = qword_100057FE0;
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "remoted starting up, waiting for services...", v13, 2u);
  }
  v11 = dispatch_queue_create("com.apple.remoted", 0);
  v12 = (void *)qword_100057CB8;
  qword_100057CB8 = (uint64_t)v11;

  sub_10000B688();
  xpc_set_event_stream_handler("com.apple.iokit.matching", 0, &stru_100051208);
  sub_10001D400((void *)qword_100057CB8);
  dispatch_main();
}

uint64_t sub_10000B688()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;

  v0 = xpc_event_publisher_create("com.apple.remoted.service", qword_100057CB8);
  v1 = objc_claimAutoreleasedReturnValue(v0);
  v2 = (void *)qword_100057CA8;
  qword_100057CA8 = v1;

  xpc_event_publisher_set_handler(qword_100057CA8, &stru_100051330);
  xpc_event_publisher_set_error_handler(qword_100057CA8, &stru_100051350);
  return xpc_event_publisher_activate(qword_100057CA8);
}

uint64_t sub_10000B6F0(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  const char *string_ptr;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    string_ptr = xpc_string_get_string_ptr(v4);
    v7 = remote_device_type_parse(string_ptr);
    if ((_DWORD)v7)
    {
      v8 = *(void **)(a1 + 32);
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v7));
      objc_msgSend(v8, "addObject:", v9);

    }
  }
  else
  {
    v5 = (void *)qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      sub_1000328B0(a1, v5);
  }

  return 1;
}

uint64_t sub_10000B7A0(const char **a1, const char **a2)
{
  return strcmp(*a1, *a2);
}

void sub_10000B7AC(id a1)
{
  const __CFBoolean *v1;
  NSObject *v2;
  const __CFBoolean *v3;
  NSObject *v4;
  int v5;
  uint8_t buf[4];
  int v7;

  v5 = 0;
  v1 = (const __CFBoolean *)MGCopyAnswerWithError(CFSTR("3kmXfug8VcxLI5yEmsqQKw"), 0, &v5);
  if (v5)
  {
    v2 = qword_100057FE0;
    if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      sub_100032948(&v5, v2);
  }
  else
  {
    v3 = v1;
    byte_100057CC0 = CFBooleanGetValue(v1) != 0;
    CFRelease(v3);
  }
  v4 = qword_100057FE0;
  if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    v7 = byte_100057CC0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "InDiagnosticsMode: %d", buf, 8u);
  }
}

void sub_10000B8B0(id a1, unsigned int a2, unint64_t a3, OS_xpc_object *a4)
{
  OS_xpc_object *v6;
  __int128 v7;
  RSDLocalService *v8;
  RSDLocalService *v9;
  NSObject *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  RSDPreferences *v14;
  void *v15;
  void *v16;
  char has_internal_content;
  void *v18;
  const __CFDictionary *v19;
  const __CFDictionary *v20;
  const __CFString *Value;
  const char *v22;
  char *v23;
  id v24;
  id v25;
  id v26;
  uint64_t v27;
  void *i;
  void *v29;
  void *v30;
  NSObject *v31;
  id v32;
  char *v33;
  int v34;
  void *v35;
  BOOL v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t version_flags;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  char *in;
  _BYTE v49[128];
  _BYTE buf[12];
  __int16 v51;
  void *v52;
  uint8_t uu[16];
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;

  v6 = a4;
  switch(a2)
  {
    case 2u:
      v13 = qword_100057FE0;
      if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uu = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Finalized the initial set of remoted services", uu, 2u);
      }
      v14 = -[RSDPreferences initWithPrefDomain:]([RSDPreferences alloc], "initWithPrefDomain:", CFSTR("com.apple.remoted"));
      v15 = (void *)qword_100057FD8;
      qword_100057FD8 = (uint64_t)v14;

      objc_msgSend((id)qword_100057FD8, "migrateContentsOnDisk");
      sub_100019440((void *)qword_100057CB8);
      os_variant_has_internal_content("com.apple.xpc.remoted");
      sub_10000B1CC();
      v16 = (void *)qword_100057FF8;
      has_internal_content = os_variant_has_internal_content("com.apple.xpc.remoted");
      xpc_dictionary_set_BOOL(v16, "AppleInternal", has_internal_content);
      *(_QWORD *)buf = 0;
      if (!sub_10000DD58("kern.osversion", (char **)buf))
        _os_assumes_log(0);
      v18 = *(void **)buf;
      if (*(_QWORD *)buf)
      {
        xpc_dictionary_set_string((xpc_object_t)qword_100057FF8, "BuildVersion", *(const char **)buf);
        free(v18);
      }
      v19 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
      if (v19)
      {
        v20 = v19;
        Value = (const __CFString *)CFDictionaryGetValue(v19, _kCFSystemVersionProductVersionKey);
        if (Value)
          sub_10000B3FC((void *)qword_100057FF8, "OSVersion", Value);
        CFRelease(v20);
      }
      v22 = (const char *)bridge_version_copy_current_string();
      if (v22)
      {
        v23 = (char *)v22;
        xpc_dictionary_set_string((xpc_object_t)qword_100057FF8, "BridgeVersion", v22);
        free(v23);
      }
      else if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
      {
        sub_100032A90();
      }
      in = 0;
      if (!sub_10000DD58("kern.bootsessionuuid", &in))
        _os_assumes_log(0);
      v33 = in;
      if (in)
      {
        memset(uu, 170, sizeof(uu));
        v34 = uuid_parse(in, uu);
        if (v34)
          _os_assumes_log(v34);
        else
          xpc_dictionary_set_uuid((xpc_object_t)qword_100057FF8, "BootSessionUUID", uu);
      }
      free(v33);
      v35 = (void *)qword_100057FF8;
      v36 = getenv("__OSINSTALL_ENVIRONMENT") != 0;
      xpc_dictionary_set_BOOL(v35, "OSInstallEnvironment", v36);
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", CFSTR("/System/Library/CoreServices/RestoreVersion.plist"), 0));
      *(_QWORD *)uu = 0;
      v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v37, uu));
      v39 = *(id *)uu;
      v40 = v39;
      if (v38)
      {

        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("RestoreLongVersion")));
        v37 = v41;
        if (v41)
        {
          xpc_dictionary_set_string((xpc_object_t)qword_100057FF8, "RestoreLongVersion", (const char *)objc_msgSend(objc_retainAutorelease(v41), "UTF8String"));
        }
        else if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_ERROR))
        {
          sub_100032A64();
        }
      }
      else
      {
        v42 = (id)qword_100057FE0;
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          sub_1000329BC(v40, v42);

      }
      version_flags = xpc_remote_connection_get_version_flags();
      xpc_dictionary_set_uint64((xpc_object_t)qword_100057FF8, "RemoteXPCVersionFlags", version_flags);
      xpc_dictionary_set_BOOL((xpc_object_t)qword_100057FF8, "SensitivePropertiesVisible", 1);

      sub_10000C01C();
      if (os_variant_has_internal_content("com.apple.xpc.remoted"))
        sub_1000288C4((void *)qword_100057CB8);
      sub_100003958((void *)qword_100057CB8);
      if (os_variant_has_internal_content("com.apple.xpc.remoted"))
        sub_10002D008((id)qword_100057CB8);
      sub_10000EB4C((void *)qword_100057CB8);
      sub_100011988((void *)qword_100057CB8);
      sub_100025B14((void *)qword_100057CB8);
      sub_1000245C4((void *)qword_100057CB8);
      if (os_variant_has_internal_content("com.apple.xpc.remoted"))
        sub_10001C2CC((void *)qword_100057CB8);
      sub_1000144F4((void *)qword_100057CB8);
      sub_100016394((void *)qword_100057CB8);
      sub_1000023D8((void *)qword_100057CB8);
      sub_1000218B0((void *)qword_100057CB8);
      sub_1000272E8((id)qword_100057CB8);
      sub_100001FB0();
      sub_10001E65C();
      break;
    case 1u:
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v24 = objc_msgSend((id)qword_100058000, "copy", 0);
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      if (v25)
      {
        v26 = v25;
        v27 = *(_QWORD *)v45;
        while (2)
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v45 != v27)
              objc_enumerationMutation(v24);
            v29 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * (_QWORD)i);
            if (objc_msgSend(v29, "token") == (id)a3)
            {
              v30 = (void *)qword_100057FE0;
              if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
              {
                v31 = v30;
                v32 = objc_msgSend(v29, "name");
                *(_DWORD *)uu = 136446210;
                *(_QWORD *)&uu[4] = v32;
                _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_INFO, "Unregistered remoted service: %{public}s", uu, 0xCu);

              }
              objc_msgSend((id)qword_100058000, "removeObject:", v29);
              goto LABEL_38;
            }
          }
          v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
          if (v26)
            continue;
          break;
        }
      }
LABEL_38:

      break;
    case 0u:
      *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v59 = v7;
      v60 = v7;
      v57 = v7;
      v58 = v7;
      v55 = v7;
      v56 = v7;
      *(_OWORD *)uu = v7;
      v54 = v7;
      if ((xpc_get_event_name("com.apple.remoted.service", a3, uu) & 1) == 0)
        __strlcpy_chk(uu, "<Unknown>", 128, 128);
      v8 = -[RSDLocalService initWithToken:name:event:]([RSDLocalService alloc], "initWithToken:name:event:", a3, uu, v6);
      if (v8)
      {
        v9 = v8;
        objc_msgSend((id)qword_100058000, "addObject:", v8);
        v10 = qword_100057FE0;
        if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = uu;
          _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Registered remoted service: %{public}s", buf, 0xCu);
        }
        if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
        {
          v11 = (void *)xpc_copy_debug_description(v6);
          v12 = qword_100057FE0;
          if (os_log_type_enabled((os_log_t)qword_100057FE0, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = uu;
            v51 = 2082;
            v52 = v11;
            _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "%{public}s: %{public}s", buf, 0x16u);
          }
          free(v11);
        }

      }
      break;
  }

}

void sub_10000BF7C(id a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  _OWORD v4[5];
  uint64_t v5;

  v5 = 0;
  memset(v4, 0, sizeof(v4));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v2 = 3;
  else
    v2 = 2;
  v3 = _os_log_send_and_compose_impl(v2, &v5, v4, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(v5, v3);
  __break(1u);
}

void sub_10000C01C()
{
  const __CFString *v0;
  const __CFString *v1;
  NSObject *v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  const __CFString *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  const __CFString *v22;
  const __CFString *v23;
  NSObject *v24;
  NSObject *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  const __CFString *v33;
  const __CFString *v34;
  NSObject *v35;
  NSObject *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  const __CFString *v44;
  const __CFString *v45;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  const __CFString *v55;
  const __CFString *v56;
  NSObject *v57;
  NSObject *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  const __CFString *v66;
  const __CFString *v67;
  NSObject *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  const __CFString *v77;
  const __CFString *v78;
  NSObject *v79;
  NSObject *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  const __CFString *v88;
  const __CFString *v89;
  NSObject *v90;
  NSObject *v91;
  uint64_t v92;
  uint64_t v93;
  uint64_t v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  const __CFString *v99;
  const __CFString *v100;
  NSObject *v101;
  NSObject *v102;
  uint64_t v103;
  uint64_t v104;
  uint64_t v105;
  uint64_t v106;
  uint64_t v107;
  uint64_t v108;
  uint64_t v109;
  const __CFString *v110;
  const __CFString *v111;
  NSObject *v112;
  NSObject *v113;
  uint64_t v114;
  uint64_t v115;
  uint64_t v116;
  uint64_t v117;
  uint64_t v118;
  uint64_t v119;
  uint64_t v120;
  const __CFString *v121;
  const __CFString *v122;
  NSObject *v123;
  NSObject *v124;
  uint64_t v125;
  uint64_t v126;
  uint64_t v127;
  uint64_t v128;
  uint64_t v129;
  uint64_t v130;
  uint64_t v131;
  const __CFString *v132;
  const __CFString *v133;
  NSObject *v134;
  NSObject *v135;
  uint64_t v136;
  uint64_t v137;
  uint64_t v138;
  uint64_t v139;
  uint64_t v140;
  uint64_t v141;
  uint64_t v142;
  const __CFString *v143;
  const __CFString *v144;
  NSObject *v145;
  NSObject *v146;
  uint64_t v147;
  uint64_t v148;
  uint64_t v149;
  uint64_t v150;
  uint64_t v151;
  uint64_t v152;
  uint64_t v153;
  const __CFString *v154;
  const __CFString *v155;
  NSObject *v156;
  NSObject *v157;
  uint64_t v158;
  uint64_t v159;
  uint64_t v160;
  uint64_t v161;
  uint64_t v162;
  uint64_t v163;
  uint64_t v164;
  const __CFString *v165;
  const __CFString *v166;
  NSObject *v167;
  NSObject *v168;
  uint64_t v169;
  uint64_t v170;
  uint64_t v171;
  uint64_t v172;
  uint64_t v173;
  uint64_t v174;
  uint64_t v175;
  const __CFString *v176;
  const __CFString *v177;
  NSObject *v178;
  NSObject *v179;
  uint64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t v183;
  uint64_t v184;
  uint64_t v185;
  uint64_t v186;
  const __CFString *v187;
  const __CFString *v188;
  NSObject *v189;
  NSObject *v190;
  uint64_t v191;
  uint64_t v192;
  uint64_t v193;
  uint64_t v194;
  uint64_t v195;
  uint64_t v196;
  uint64_t v197;
  const __CFString *v198;
  const __CFString *v199;
  NSObject *v200;
  NSObject *v201;
  uint64_t v202;
  uint64_t v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t v208;
  const __CFString *v209;
  const __CFString *v210;
  NSObject *v211;
  NSObject *v212;
  uint64_t v213;
  uint64_t v214;
  uint64_t v215;
  uint64_t v216;
  uint64_t v217;
  uint64_t v218;
  uint64_t v219;
  const __CFString *v220;
  const __CFString *v221;
  NSObject *v222;
  NSObject *v223;
  uint64_t v224;
  uint64_t v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  const __CFString *v231;
  const __CFString *v232;
  NSObject *v233;
  NSObject *v234;
  uint64_t v235;
  uint64_t v236;
  uint64_t v237;
  uint64_t v238;
  uint64_t v239;
  uint64_t v240;
  uint64_t v241;
  const __CFString *v242;
  const __CFString *v243;
  NSObject *v244;
  NSObject *v245;
  uint64_t v246;
  uint64_t v247;
  uint64_t v248;
  uint64_t v249;
  uint64_t v250;
  uint64_t v251;
  uint64_t v252;
  const __CFString *v253;
  const __CFString *v254;
  NSObject *v255;
  NSObject *v256;
  uint64_t v257;
  uint64_t v258;
  uint64_t v259;
  uint64_t v260;
  uint64_t v261;
  uint64_t v262;
  uint64_t v263;
  const __CFString *v264;
  const __CFString *v265;
  NSObject *v266;
  NSObject *v267;
  uint64_t v268;
  uint64_t v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  uint64_t v273;
  uint64_t v274;
  const __CFString *v275;
  const __CFString *v276;
  NSObject *v277;
  NSObject *v278;
  uint64_t v279;
  uint64_t v280;
  uint64_t v281;
  uint64_t v282;
  uint64_t v283;
  uint64_t v284;
  uint64_t v285;
  const __CFString *v286;
  const __CFString *v287;
  NSObject *v288;
  NSObject *v289;
  uint64_t v290;
  uint64_t v291;
  uint64_t v292;
  uint64_t v293;
  uint64_t v294;
  uint64_t v295;
  uint64_t v296;
  const __CFString *v297;
  const __CFString *v298;
  NSObject *v299;
  NSObject *v300;
  uint64_t v301;
  uint64_t v302;
  uint64_t v303;
  uint64_t v304;
  uint64_t v305;
  uint64_t v306;
  uint64_t v307;
  const __CFString *v308;
  const __CFString *v309;
  NSObject *v310;
  NSObject *v311;
  uint64_t v312;
  uint64_t v313;
  uint64_t v314;
  uint64_t v315;
  uint64_t v316;
  uint64_t v317;
  uint64_t v318;
  const __CFString *v319;
  const __CFString *v320;
  NSObject *v321;
  NSObject *v322;
  uint64_t v323;
  uint64_t v324;
  uint64_t v325;
  uint64_t v326;
  uint64_t v327;
  uint64_t v328;
  uint64_t v329;
  const __CFString *v330;
  const __CFString *v331;
  NSObject *v332;
  NSObject *v333;
  uint64_t v334;
  uint64_t v335;
  uint64_t v336;
  uint64_t v337;
  uint64_t v338;
  uint64_t v339;
  uint64_t v340;
  const __CFString *v341;
  const __CFString *v342;
  NSObject *v343;
  NSObject *v344;
  uint64_t v345;
  uint64_t v346;
  uint64_t v347;
  uint64_t v348;
  uint64_t v349;
  uint64_t v350;
  uint64_t v351;
  const __CFString *v352;
  const __CFString *v353;
  NSObject *v354;
  NSObject *v355;
  uint64_t v356;
  uint64_t v357;
  uint64_t v358;
  uint64_t v359;
  uint64_t v360;
  uint64_t v361;
  uint64_t v362;
  const __CFString *v363;
  const __CFString *v364;
  NSObject *v365;
  NSObject *v366;
  uint64_t v367;
  uint64_t v368;
  uint64_t v369;
  uint64_t v370;
  uint64_t v371;
  uint64_t v372;
  uint64_t v373;
  const __CFString *v374;
  const __CFString *v375;
  NSObject *v376;
  NSObject *v377;
  uint64_t v378;
  uint64_t v379;
  uint64_t v380;
  uint64_t v381;
  uint64_t v382;
  uint64_t v383;
  uint64_t v384;
  const __CFString *v385;
  const __CFString *v386;
  NSObject *v387;
  NSObject *v388;
  uint64_t v389;
  uint64_t v390;
  uint64_t v391;
  uint64_t v392;
  uint64_t v393;
  uint64_t v394;
  uint64_t v395;
  const __CFString *v396;
  const __CFString *v397;
  NSObject *v398;
  NSObject *v399;
  uint64_t v400;
  uint64_t v401;
  uint64_t v402;
  uint64_t v403;
  uint64_t v404;
  uint64_t v405;
  uint64_t v406;
  const __CFString *v407;
  const __CFString *v408;
  NSObject *v409;
  NSObject *v410;
  uint64_t v411;
  uint64_t v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t v416;
  uint64_t v417;
  const __CFString *v418;
  const __CFString *v419;
  NSObject *v420;
  NSObject *v421;
  uint64_t v422;
  uint64_t v423;
  uint64_t v424;
  uint64_t v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  const __CFString *v429;
  const __CFString *v430;
  NSObject *v431;
  NSObject *v432;
  uint64_t v433;
  uint64_t v434;
  uint64_t v435;
  uint64_t v436;
  uint64_t v437;
  uint64_t v438;
  uint64_t v439;
  const __CFString *v440;
  const __CFString *v441;
  NSObject *v442;
  NSObject *v443;
  uint64_t v444;
  uint64_t v445;
  uint64_t v446;
  uint64_t v447;
  uint64_t v448;
  uint64_t v449;
  uint64_t v450;
  int v451;
  const char *v452;

  v0 = (const __CFString *)MGCopyAnswer(CFSTR("0uthiXrHZ212KvcJizKHEw"), 0);
  if (v0)
  {
    v1 = v0;
    sub_10000B3FC((void *)qword_100057FF8, "BoardId", v0);
    v2 = (id)qword_100057FE0;
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "BoardId";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v1);
  }
  else
  {
    v3 = (id)qword_100057FE0;
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_100033C3C(v3, v4, v5, v6, v7, v8, v9, v10);

  }
  v11 = (const __CFString *)MGCopyAnswer(CFSTR("VqRhf8vgXr9B+SYvpnX39g"), 0);
  if (v11)
  {
    v12 = v11;
    sub_10000B3FC((void *)qword_100057FF8, "BoardRevision", v11);
    v13 = (id)qword_100057FE0;
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "BoardRevision";
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v12);
  }
  else
  {
    v14 = (id)qword_100057FE0;
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100033BCC(v14, v15, v16, v17, v18, v19, v20, v21);

  }
  v22 = (const __CFString *)MGCopyAnswer(CFSTR("k7QIBwZJJOVw+Sej/8h8VA"), 0);
  if (v22)
  {
    v23 = v22;
    sub_10000B3FC((void *)qword_100057FF8, "CPUArchitecture", v22);
    v24 = (id)qword_100057FE0;
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "CPUArchitecture";
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v23);
  }
  else
  {
    v25 = (id)qword_100057FE0;
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      sub_100033B5C(v25, v26, v27, v28, v29, v30, v31, v32);

  }
  v33 = (const __CFString *)MGCopyAnswer(CFSTR("uO3aPe7lfB1XxSiz/1xBvA"), 0);
  if (v33)
  {
    v34 = v33;
    sub_10000B3FC((void *)qword_100057FF8, "CertificateProductionStatus", v33);
    v35 = (id)qword_100057FE0;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "CertificateProductionStatus";
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v34);
  }
  else
  {
    v36 = (id)qword_100057FE0;
    if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      sub_100033AEC(v36, v37, v38, v39, v40, v41, v42, v43);

  }
  v44 = (const __CFString *)MGCopyAnswer(CFSTR("eg8KDO//lXaLwp+URGP6DA"), 0);
  if (v44)
  {
    v45 = v44;
    sub_10000B3FC((void *)qword_100057FF8, "CertificateSecurityMode", v44);
    v46 = (id)qword_100057FE0;
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "CertificateSecurityMode";
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v45);
  }
  else
  {
    v47 = (id)qword_100057FE0;
    if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      sub_100033A7C(v47, v48, v49, v50, v51, v52, v53, v54);

  }
  v55 = (const __CFString *)MGCopyAnswer(CFSTR("566JrJVMlDfnslGpwUzNlQ"), 0);
  if (v55)
  {
    v56 = v55;
    sub_10000B3FC((void *)qword_100057FF8, "ChipID", v55);
    v57 = (id)qword_100057FE0;
    if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "ChipID";
      _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v56);
  }
  else
  {
    v58 = (id)qword_100057FE0;
    if (os_log_type_enabled(v58, OS_LOG_TYPE_ERROR))
      sub_100033A0C(v58, v59, v60, v61, v62, v63, v64, v65);

  }
  v66 = (const __CFString *)MGCopyAnswer(CFSTR("+3Uf0Pm5F8Xy7Onyvko0vA"), 0);
  if (v66)
  {
    v67 = v66;
    sub_10000B3FC((void *)qword_100057FF8, "DeviceClass", v66);
    v68 = (id)qword_100057FE0;
    if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "DeviceClass";
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v67);
  }
  else
  {
    v69 = (id)qword_100057FE0;
    if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
      sub_10003399C(v69, v70, v71, v72, v73, v74, v75, v76);

  }
  v77 = (const __CFString *)MGCopyAnswer(CFSTR("mumHZHMLEfAuTkkd28fHlQ"), 0);
  if (v77)
  {
    v78 = v77;
    sub_10000B3FC((void *)qword_100057FF8, "DeviceColor", v77);
    v79 = (id)qword_100057FE0;
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "DeviceColor";
      _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v78);
  }
  else
  {
    v80 = (id)qword_100057FE0;
    if (os_log_type_enabled(v80, OS_LOG_TYPE_ERROR))
      sub_10003392C(v80, v81, v82, v83, v84, v85, v86, v87);

  }
  v88 = (const __CFString *)MGCopyAnswer(CFSTR("JhEU414EIaDvAz8ki5DSqw"), 0);
  if (v88)
  {
    v89 = v88;
    sub_10000B3FC((void *)qword_100057FF8, "DeviceEnclosureColor", v88);
    v90 = (id)qword_100057FE0;
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "DeviceEnclosureColor";
      _os_log_impl((void *)&_mh_execute_header, v90, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v89);
  }
  else
  {
    v91 = (id)qword_100057FE0;
    if (os_log_type_enabled(v91, OS_LOG_TYPE_ERROR))
      sub_1000338BC(v91, v92, v93, v94, v95, v96, v97, v98);

  }
  v99 = (const __CFString *)MGCopyAnswer(CFSTR("7ZipyD32hkjOUTl66Q8REw"), 0);
  if (v99)
  {
    v100 = v99;
    sub_10000B3FC((void *)qword_100057FF8, "DeviceSupportsLockdown", v99);
    v101 = (id)qword_100057FE0;
    if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "DeviceSupportsLockdown";
      _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v100);
  }
  else
  {
    v102 = (id)qword_100057FE0;
    if (os_log_type_enabled(v102, OS_LOG_TYPE_ERROR))
      sub_10003384C(v102, v103, v104, v105, v106, v107, v108, v109);

  }
  v110 = (const __CFString *)MGCopyAnswer(CFSTR("AQiIpW0UeYQKnhy2da7AXg"), 0);
  if (v110)
  {
    v111 = v110;
    sub_10000B3FC((void *)qword_100057FF8, "EffectiveProductionStatusAp", v110);
    v112 = (id)qword_100057FE0;
    if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "EffectiveProductionStatusAp";
      _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v111);
  }
  else
  {
    v113 = (id)qword_100057FE0;
    if (os_log_type_enabled(v113, OS_LOG_TYPE_ERROR))
      sub_1000337DC(v113, v114, v115, v116, v117, v118, v119, v120);

  }
  v121 = (const __CFString *)MGCopyAnswer(CFSTR("PNexcW/LBlPgAm+Skp2EAg"), 0);
  if (v121)
  {
    v122 = v121;
    sub_10000B3FC((void *)qword_100057FF8, "EffectiveProductionStatusSEP", v121);
    v123 = (id)qword_100057FE0;
    if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "EffectiveProductionStatusSEP";
      _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v122);
  }
  else
  {
    v124 = (id)qword_100057FE0;
    if (os_log_type_enabled(v124, OS_LOG_TYPE_ERROR))
      sub_10003376C(v124, v125, v126, v127, v128, v129, v130, v131);

  }
  v132 = (const __CFString *)MGCopyAnswer(CFSTR("vENa/R1xAXLobl8r3PBL6w"), 0);
  if (v132)
  {
    v133 = v132;
    sub_10000B3FC((void *)qword_100057FF8, "EffectiveSecurityModeAp", v132);
    v134 = (id)qword_100057FE0;
    if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "EffectiveSecurityModeAp";
      _os_log_impl((void *)&_mh_execute_header, v134, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v133);
  }
  else
  {
    v135 = (id)qword_100057FE0;
    if (os_log_type_enabled(v135, OS_LOG_TYPE_ERROR))
      sub_1000336FC(v135, v136, v137, v138, v139, v140, v141, v142);

  }
  v143 = (const __CFString *)MGCopyAnswer(CFSTR("QJSuJ2zhdxYX/7DUA2JtUw"), 0);
  if (v143)
  {
    v144 = v143;
    sub_10000B3FC((void *)qword_100057FF8, "EffectiveSecurityModeSEP", v143);
    v145 = (id)qword_100057FE0;
    if (os_log_type_enabled(v145, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "EffectiveSecurityModeSEP";
      _os_log_impl((void *)&_mh_execute_header, v145, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v144);
  }
  else
  {
    v146 = (id)qword_100057FE0;
    if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR))
      sub_10003368C(v146, v147, v148, v149, v150, v151, v152, v153);

  }
  v154 = (const __CFString *)MGCopyAnswer(CFSTR("VG9TCKNqNLCHk0J6zTkuVQ"), 0);
  if (v154)
  {
    v155 = v154;
    sub_10000B3FC((void *)qword_100057FF8, "EthernetMacAddress", v154);
    v156 = (id)qword_100057FE0;
    if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "EthernetMacAddress";
      _os_log_impl((void *)&_mh_execute_header, v156, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v155);
  }
  else
  {
    v157 = (id)qword_100057FE0;
    if (os_log_type_enabled(v157, OS_LOG_TYPE_ERROR))
      sub_10003361C(v157, v158, v159, v160, v161, v162, v163, v164);

  }
  v165 = (const __CFString *)MGCopyAnswer(CFSTR("/YYygAofPDbhrwToVsXdeA"), 0);
  if (v165)
  {
    v166 = v165;
    sub_10000B3FC((void *)qword_100057FF8, "HWModel", v165);
    v167 = (id)qword_100057FE0;
    if (os_log_type_enabled(v167, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "HWModelStr";
      _os_log_impl((void *)&_mh_execute_header, v167, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v166);
  }
  else
  {
    v168 = (id)qword_100057FE0;
    if (os_log_type_enabled(v168, OS_LOG_TYPE_ERROR))
      sub_1000335AC(v168, v169, v170, v171, v172, v173, v174, v175);

  }
  v176 = (const __CFString *)MGCopyAnswer(CFSTR("5pYKlGnYYBzGvAlIU8RjEQ"), 0);
  if (v176)
  {
    v177 = v176;
    sub_10000B3FC((void *)qword_100057FF8, "HardwarePlatform", v176);
    v178 = (id)qword_100057FE0;
    if (os_log_type_enabled(v178, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "HardwarePlatform";
      _os_log_impl((void *)&_mh_execute_header, v178, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v177);
  }
  else
  {
    v179 = (id)qword_100057FE0;
    if (os_log_type_enabled(v179, OS_LOG_TYPE_ERROR))
      sub_10003353C(v179, v180, v181, v182, v183, v184, v185, v186);

  }
  v187 = (const __CFString *)MGCopyAnswer(CFSTR("7DfjbzhvH/GDkhio1dv8fA"), 0);
  if (v187)
  {
    v188 = v187;
    sub_10000B3FC((void *)qword_100057FF8, "HasSEP", v187);
    v189 = (id)qword_100057FE0;
    if (os_log_type_enabled(v189, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "HasSEP";
      _os_log_impl((void *)&_mh_execute_header, v189, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v188);
  }
  else
  {
    v190 = (id)qword_100057FE0;
    if (os_log_type_enabled(v190, OS_LOG_TYPE_ERROR))
      sub_1000334CC(v190, v191, v192, v193, v194, v195, v196, v197);

  }
  v198 = (const __CFString *)MGCopyAnswer(CFSTR("ToLFRidm+eJGWnpw6W4Wwg"), 0);
  if (v198)
  {
    v199 = v198;
    sub_10000B3FC((void *)qword_100057FF8, "HumanReadableProductVersionString", v198);
    v200 = (id)qword_100057FE0;
    if (os_log_type_enabled(v200, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "HumanReadableProductVersionString";
      _os_log_impl((void *)&_mh_execute_header, v200, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v199);
  }
  else
  {
    v201 = (id)qword_100057FE0;
    if (os_log_type_enabled(v201, OS_LOG_TYPE_ERROR))
      sub_10003345C(v201, v202, v203, v204, v205, v206, v207, v208);

  }
  v209 = (const __CFString *)MGCopyAnswer(CFSTR("Nzu4E/VsXjEIa83CkRdZrQ"), 0);
  if (v209)
  {
    v210 = v209;
    sub_10000B3FC((void *)qword_100057FF8, "Image4CryptoHashMethod", v209);
    v211 = (id)qword_100057FE0;
    if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "Image4CryptoHashMethod";
      _os_log_impl((void *)&_mh_execute_header, v211, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v210);
  }
  else
  {
    v212 = (id)qword_100057FE0;
    if (os_log_type_enabled(v212, OS_LOG_TYPE_ERROR))
      sub_1000333EC(v212, v213, v214, v215, v216, v217, v218, v219);

  }
  v220 = (const __CFString *)MGCopyAnswer(CFSTR("kyxFFGn+VS4L9a/bsvm19Q"), 0);
  if (v220)
  {
    v221 = v220;
    sub_10000B3FC((void *)qword_100057FF8, "Image4Supported", v220);
    v222 = (id)qword_100057FE0;
    if (os_log_type_enabled(v222, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "Image4Supported";
      _os_log_impl((void *)&_mh_execute_header, v222, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v221);
  }
  else
  {
    v223 = (id)qword_100057FE0;
    if (os_log_type_enabled(v223, OS_LOG_TYPE_ERROR))
      sub_10003337C(v223, v224, v225, v226, v227, v228, v229, v230);

  }
  v231 = (const __CFString *)MGCopyAnswer(CFSTR("I32sGclpgl5VujQRJxyhKQ"), 0);
  if (v231)
  {
    v232 = v231;
    sub_10000B3FC((void *)qword_100057FF8, "IsUIBuild", v231);
    v233 = (id)qword_100057FE0;
    if (os_log_type_enabled(v233, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "IsUIBuild";
      _os_log_impl((void *)&_mh_execute_header, v233, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v232);
  }
  else
  {
    v234 = (id)qword_100057FE0;
    if (os_log_type_enabled(v234, OS_LOG_TYPE_ERROR))
      sub_10003330C(v234, v235, v236, v237, v238, v239, v240, v241);

  }
  v242 = (const __CFString *)MGCopyAnswer(CFSTR("MrC93gcyPVLHmEbzUu9uzQ"), 0);
  if (v242)
  {
    v243 = v242;
    sub_10000B3FC((void *)qword_100057FF8, "IsVirtualDevice", v242);
    v244 = (id)qword_100057FE0;
    if (os_log_type_enabled(v244, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "IsVirtualDevice";
      _os_log_impl((void *)&_mh_execute_header, v244, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v243);
  }
  else
  {
    v245 = (id)qword_100057FE0;
    if (os_log_type_enabled(v245, OS_LOG_TYPE_ERROR))
      sub_10003329C(v245, v246, v247, v248, v249, v250, v251, v252);

  }
  v253 = (const __CFString *)MGCopyAnswer(CFSTR("k+KTni1jrwErpcDMEnn3aw"), 0);
  if (v253)
  {
    v254 = v253;
    sub_10000B3FC((void *)qword_100057FF8, "MobileDeviceMinimumVersion", v253);
    v255 = (id)qword_100057FE0;
    if (os_log_type_enabled(v255, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "MobileDeviceMinimumVersion";
      _os_log_impl((void *)&_mh_execute_header, v255, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v254);
  }
  else
  {
    v256 = (id)qword_100057FE0;
    if (os_log_type_enabled(v256, OS_LOG_TYPE_ERROR))
      sub_10003322C(v256, v257, v258, v259, v260, v261, v262, v263);

  }
  v264 = (const __CFString *)MGCopyAnswer(CFSTR("D0cJ8r7U5zve6uA6QbOiLA"), 0);
  if (v264)
  {
    v265 = v264;
    sub_10000B3FC((void *)qword_100057FF8, "ModelNumber", v264);
    v266 = (id)qword_100057FE0;
    if (os_log_type_enabled(v266, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "ModelNumber";
      _os_log_impl((void *)&_mh_execute_header, v266, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v265);
  }
  else
  {
    v267 = (id)qword_100057FE0;
    if (os_log_type_enabled(v267, OS_LOG_TYPE_ERROR))
      sub_1000331BC(v267, v268, v269, v270, v271, v272, v273, v274);

  }
  v275 = (const __CFString *)MGCopyAnswer(CFSTR("qgfS+6l1exvcMW5Tfplv2Q"), 0);
  if (v275)
  {
    v276 = v275;
    sub_10000B3FC((void *)qword_100057FF8, "OceanComputeCarrierID", v275);
    v277 = (id)qword_100057FE0;
    if (os_log_type_enabled(v277, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "OceanComputeCarrierID";
      _os_log_impl((void *)&_mh_execute_header, v277, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v276);
  }
  else
  {
    v278 = (id)qword_100057FE0;
    if (os_log_type_enabled(v278, OS_LOG_TYPE_ERROR))
      sub_10003314C(v278, v279, v280, v281, v282, v283, v284, v285);

  }
  v286 = (const __CFString *)MGCopyAnswer(CFSTR("LUy+wqFiBmou5hwM5OWbmA"), 0);
  if (v286)
  {
    v287 = v286;
    sub_10000B3FC((void *)qword_100057FF8, "OceanComputeCarrierSlot", v286);
    v288 = (id)qword_100057FE0;
    if (os_log_type_enabled(v288, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "OceanComputeCarrierSlot";
      _os_log_impl((void *)&_mh_execute_header, v288, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v287);
  }
  else
  {
    v289 = (id)qword_100057FE0;
    if (os_log_type_enabled(v289, OS_LOG_TYPE_ERROR))
      sub_1000330DC(v289, v290, v291, v292, v293, v294, v295, v296);

  }
  v297 = (const __CFString *)MGCopyAnswer(CFSTR("ivIu8YTDnBSrYv/SN4G8Ag"), 0);
  if (v297)
  {
    v298 = v297;
    sub_10000B3FC((void *)qword_100057FF8, "ProductName", v297);
    v299 = (id)qword_100057FE0;
    if (os_log_type_enabled(v299, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "ProductName";
      _os_log_impl((void *)&_mh_execute_header, v299, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v298);
  }
  else
  {
    v300 = (id)qword_100057FE0;
    if (os_log_type_enabled(v300, OS_LOG_TYPE_ERROR))
      sub_10003306C(v300, v301, v302, v303, v304, v305, v306, v307);

  }
  v308 = (const __CFString *)MGCopyAnswer(CFSTR("h9jDsbgj7xIVeIQ8S3/X3Q"), 0);
  if (v308)
  {
    v309 = v308;
    sub_10000B3FC((void *)qword_100057FF8, "ProductType", v308);
    v310 = (id)qword_100057FE0;
    if (os_log_type_enabled(v310, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "ProductType";
      _os_log_impl((void *)&_mh_execute_header, v310, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v309);
  }
  else
  {
    v311 = (id)qword_100057FE0;
    if (os_log_type_enabled(v311, OS_LOG_TYPE_ERROR))
      sub_100032FFC(v311, v312, v313, v314, v315, v316, v317, v318);

  }
  v319 = (const __CFString *)MGCopyAnswer(CFSTR("P5Go9WVVA604m7rKhbVndw"), 0);
  if (v319)
  {
    v320 = v319;
    sub_10000B3FC((void *)qword_100057FF8, "ProductVersionExtra", v319);
    v321 = (id)qword_100057FE0;
    if (os_log_type_enabled(v321, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "ProductVersionExtra";
      _os_log_impl((void *)&_mh_execute_header, v321, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v320);
  }
  else
  {
    v322 = (id)qword_100057FE0;
    if (os_log_type_enabled(v322, OS_LOG_TYPE_ERROR))
      sub_100032F8C(v322, v323, v324, v325, v326, v327, v328, v329);

  }
  v330 = (const __CFString *)MGCopyAnswer(CFSTR("h63QSdBCiT/z0WU6rdQv6Q"), 0);
  if (v330)
  {
    v331 = v330;
    sub_10000B3FC((void *)qword_100057FF8, "RegionCode", v330);
    v332 = (id)qword_100057FE0;
    if (os_log_type_enabled(v332, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "RegionCode";
      _os_log_impl((void *)&_mh_execute_header, v332, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v331);
  }
  else
  {
    v333 = (id)qword_100057FE0;
    if (os_log_type_enabled(v333, OS_LOG_TYPE_ERROR))
      sub_100032F1C(v333, v334, v335, v336, v337, v338, v339, v340);

  }
  v341 = (const __CFString *)MGCopyAnswer(CFSTR("zHeENZu+wbg7PUprwNwBWg"), 0);
  if (v341)
  {
    v342 = v341;
    sub_10000B3FC((void *)qword_100057FF8, "RegionInfo", v341);
    v343 = (id)qword_100057FE0;
    if (os_log_type_enabled(v343, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "RegionInfo";
      _os_log_impl((void *)&_mh_execute_header, v343, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v342);
  }
  else
  {
    v344 = (id)qword_100057FE0;
    if (os_log_type_enabled(v344, OS_LOG_TYPE_ERROR))
      sub_100032EAC(v344, v345, v346, v347, v348, v349, v350, v351);

  }
  v352 = (const __CFString *)MGCopyAnswer(CFSTR("9UCjT7Qfi4xLVvPAKIzTCQ"), 0);
  if (v352)
  {
    v353 = v352;
    sub_10000B3FC((void *)qword_100057FF8, "ReleaseType", v352);
    v354 = (id)qword_100057FE0;
    if (os_log_type_enabled(v354, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "ReleaseType";
      _os_log_impl((void *)&_mh_execute_header, v354, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v353);
  }
  else
  {
    v355 = (id)qword_100057FE0;
    if (os_log_type_enabled(v355, OS_LOG_TYPE_ERROR))
      sub_100032E3C(v355, v356, v357, v358, v359, v360, v361, v362);

  }
  v363 = (const __CFString *)MGCopyAnswer(CFSTR("wu9wv8HhpA95iHT4Yyez7A"), 0);
  if (v363)
  {
    v364 = v363;
    sub_10000B3FC((void *)qword_100057FF8, "SecurityDomain", v363);
    v365 = (id)qword_100057FE0;
    if (os_log_type_enabled(v365, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "SecurityDomain";
      _os_log_impl((void *)&_mh_execute_header, v365, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v364);
  }
  else
  {
    v366 = (id)qword_100057FE0;
    if (os_log_type_enabled(v366, OS_LOG_TYPE_ERROR))
      sub_100032DCC(v366, v367, v368, v369, v370, v371, v372, v373);

  }
  v374 = (const __CFString *)MGCopyAnswer(CFSTR("VasUgeSzVyHdB27g2XpN0g"), 0);
  if (v374)
  {
    v375 = v374;
    sub_10000B3FC((void *)qword_100057FF8, "SerialNumber", v374);
    v376 = (id)qword_100057FE0;
    if (os_log_type_enabled(v376, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "SerialNumber";
      _os_log_impl((void *)&_mh_execute_header, v376, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v375);
  }
  else
  {
    v377 = (id)qword_100057FE0;
    if (os_log_type_enabled(v377, OS_LOG_TYPE_ERROR))
      sub_100032D5C(v377, v378, v379, v380, v381, v382, v383, v384);

  }
  v385 = (const __CFString *)MGCopyAnswer(CFSTR("a5BRUxn1QBPXkAnbAHbmeg"), 0);
  if (v385)
  {
    v386 = v385;
    sub_10000B3FC((void *)qword_100057FF8, "SigningFuse", v385);
    v387 = (id)qword_100057FE0;
    if (os_log_type_enabled(v387, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "SigningFuse";
      _os_log_impl((void *)&_mh_execute_header, v387, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v386);
  }
  else
  {
    v388 = (id)qword_100057FE0;
    if (os_log_type_enabled(v388, OS_LOG_TYPE_ERROR))
      sub_100032CEC(v388, v389, v390, v391, v392, v393, v394, v395);

  }
  v396 = (const __CFString *)MGCopyAnswer(CFSTR("aadL+4GFBDe6DdsUD2HGGw"), 0);
  if (v396)
  {
    v397 = v396;
    sub_10000B3FC((void *)qword_100057FF8, "StoreDemoMode", v396);
    v398 = (id)qword_100057FE0;
    if (os_log_type_enabled(v398, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "StoreDemoMode";
      _os_log_impl((void *)&_mh_execute_header, v398, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v397);
  }
  else
  {
    v399 = (id)qword_100057FE0;
    if (os_log_type_enabled(v399, OS_LOG_TYPE_ERROR))
      sub_100032C7C(v399, v400, v401, v402, v403, v404, v405, v406);

  }
  v407 = (const __CFString *)MGCopyAnswer(CFSTR("gLd6IDfbVM+JiOhktEP7Bw"), 0);
  if (v407)
  {
    v408 = v407;
    sub_10000B3FC((void *)qword_100057FF8, "SupplementalBuildVersion", v407);
    v409 = (id)qword_100057FE0;
    if (os_log_type_enabled(v409, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "SupplementalBuildVersion";
      _os_log_impl((void *)&_mh_execute_header, v409, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v408);
  }
  else
  {
    v410 = (id)qword_100057FE0;
    if (os_log_type_enabled(v410, OS_LOG_TYPE_ERROR))
      sub_100032C0C(v410, v411, v412, v413, v414, v415, v416, v417);

  }
  v418 = (const __CFString *)MGCopyAnswer(CFSTR("0+nc/Udy4WNG8S+Q7a/s1A"), 0);
  if (v418)
  {
    v419 = v418;
    sub_10000B3FC((void *)qword_100057FF8, "ThinningProductType", v418);
    v420 = (id)qword_100057FE0;
    if (os_log_type_enabled(v420, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "ThinningProductType";
      _os_log_impl((void *)&_mh_execute_header, v420, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v419);
  }
  else
  {
    v421 = (id)qword_100057FE0;
    if (os_log_type_enabled(v421, OS_LOG_TYPE_ERROR))
      sub_100032B9C(v421, v422, v423, v424, v425, v426, v427, v428);

  }
  v429 = (const __CFString *)MGCopyAnswer(CFSTR("TF31PAB6aO8KAbPyNKSxKA"), 0);
  if (v429)
  {
    v430 = v429;
    sub_10000B3FC((void *)qword_100057FF8, "UniqueChipID", v429);
    v431 = (id)qword_100057FE0;
    if (os_log_type_enabled(v431, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "UniqueChipID";
      _os_log_impl((void *)&_mh_execute_header, v431, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v430);
  }
  else
  {
    v432 = (id)qword_100057FE0;
    if (os_log_type_enabled(v432, OS_LOG_TYPE_ERROR))
      sub_100032B2C(v432, v433, v434, v435, v436, v437, v438, v439);

  }
  v440 = (const __CFString *)MGCopyAnswer(CFSTR("re6Zb+zwFKJNlkQTUeT+/w"), 0);
  if (v440)
  {
    v441 = v440;
    sub_10000B3FC((void *)qword_100057FF8, "UniqueDeviceID", v440);
    v442 = (id)qword_100057FE0;
    if (os_log_type_enabled(v442, OS_LOG_TYPE_INFO))
    {
      v451 = 136315138;
      v452 = "UniqueDeviceID";
      _os_log_impl((void *)&_mh_execute_header, v442, OS_LOG_TYPE_INFO, "Populated property with MG: %s", (uint8_t *)&v451, 0xCu);
    }

    CFRelease(v441);
  }
  else
  {
    v443 = (id)qword_100057FE0;
    if (os_log_type_enabled(v443, OS_LOG_TYPE_ERROR))
      sub_100032ABC(v443, v444, v445, v446, v447, v448, v449, v450);

  }
}

size_t sub_10000DD58(const char *a1, char **a2)
{
  __int128 v4;
  int v5;
  int v6;
  size_t result;
  int v8;
  char *v9;
  char *v10;
  char *v11;
  uint64_t v12;
  size_t size;
  _OWORD v14[5];
  char __s1[16];
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;

  *__error() = 0;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v21 = v4;
  v22 = v4;
  v19 = v4;
  v20 = v4;
  v17 = v4;
  v18 = v4;
  *(_OWORD *)__s1 = v4;
  v16 = v4;
  size = 128;
  v5 = sysctlbyname(a1, __s1, &size, 0, 0);
  v6 = v5;
  if (size)
  {
    if (v5)
      return 0;
  }
  else
  {
    size = 128;
    *__error() = 12;
    if (v6)
      return 0;
  }
  if (size != 128 || *__error() != 12)
    goto LABEL_12;
  v8 = sysctlbyname(a1, 0, &size, 0, 0);
  result = 0;
  if (v8)
    return result;
  if (size < 0x81)
  {
LABEL_12:
    v11 = 0;
    v10 = __s1;
LABEL_13:
    *a2 = strdup(v10);
    v10 = v11;
    goto LABEL_14;
  }
  v9 = (char *)malloc_type_malloc(size, 0x19428D4FuLL);
  if (!v9)
    sub_100033CAC(&v12, v14);
  v10 = v9;
  if (!sysctlbyname(a1, v9, &size, 0, 0))
  {
    v11 = v10;
    goto LABEL_13;
  }
  size = 0;
LABEL_14:
  free(v10);
  return size;
}

void sub_10000DEDC(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0xCu);
}

double sub_10000DEE8(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_10000DF24(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  return _os_log_send_and_compose_impl(a1, a2, a3, a4, a5, a6, 16);
}

void sub_10000DF48(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x16u);
}

void sub_10000DF54(uint64_t a1@<X8>)
{
  uint64_t v1;

  *(_QWORD *)(v1 - 8) = a1;
}

void sub_10000DF60(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

void sub_10000DF74(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_10000DFAC(uint64_t a1)
{
  _QWORD *v1;

  return _os_crash_msg(*v1, a1);
}

xpc_type_t sub_10000DFB8()
{
  void *v0;

  return xpc_get_type(v0);
}

char *sub_10000DFC4(int *a1)
{
  return strerror(*a1);
}

void sub_10000DFD8(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 0x12u);
}

id sub_10000DFE4()
{
  void *v0;

  return objc_msgSend(v0, "name");
}

BOOL sub_10000DFF0()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

id sub_10000DFFC(uint64_t a1, void *a2)
{
  return a2;
}

uint64_t sub_10000E004()
{
  if (qword_100057CD8 != -1)
    dispatch_once(&qword_100057CD8, &stru_100051370);
  return byte_100057CD0;
}

void sub_10000E044(id a1)
{
  const __CFString *v1;
  const __CFString *v2;
  CFTypeID v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  uint64_t v9;
  _OWORD v10[5];

  v1 = (const __CFString *)MGCopyAnswer(CFSTR("+3Uf0Pm5F8Xy7Onyvko0vA"), 0);
  if (v1)
  {
    v2 = v1;
    v3 = CFGetTypeID(v1);
    if (v3 != CFStringGetTypeID())
    {
      v7 = 0;
      memset(v10, 0, sizeof(v10));
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v4 = 3;
      else
        v4 = 2;
      v8 = 134217984;
      v9 = 0;
      v5 = _os_log_send_and_compose_impl(v4, &v7, v10, 80, &_mh_execute_header, &_os_log_default, 16);
      v6 = _os_crash_msg(v7, v5);
      sub_100033D14(v6);
    }
    byte_100057CD0 = CFStringCompare(v2, CFSTR("AppleDisplay"), 0) == kCFCompareEqualTo;
    CFRelease(v2);
  }
  else
  {
    byte_100057CD0 = 0;
  }
}

void sub_10000E1A4(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000E1D4()
{
  if (qword_100057CE8 != -1)
    dispatch_once(&qword_100057CE8, &stru_100051390);
  return byte_100057CE0;
}

void sub_10000E214(id a1)
{
  uint64_t v1;
  id v2;

  v2 = (id)MGCopyAnswer(CFSTR("a6vjPkzcRjrsXmniFsm0dg"), 0);
  v1 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v2, v1) & 1) != 0)
    byte_100057CE0 = objc_msgSend(v2, "BOOLValue");

}

unint64_t sub_10000E270()
{
  unsigned int v0;
  uint64_t v1;
  uint64_t v3;
  timespec __tp;
  _OWORD v5[5];

  __tp.tv_sec = 0xAAAAAAAAAAAAAAAALL;
  __tp.tv_nsec = 0xAAAAAAAAAAAAAAAALL;
  if (clock_gettime(_CLOCK_REALTIME, &__tp))
    sub_100033D18(&v3, v5);
  __tp.tv_sec += 2208988800;
  v0 = sntp_datestamp_from_timespec(__tp.tv_sec, __tp.tv_nsec);
  return sntp_timestamp_from_datestamp(v0, v1);
}

id sub_10000E2F8(unint64_t a1, void *a2)
{
  id v3;
  xpc_object_t v4;
  void *v5;
  uint64_t v7;
  _OWORD bytes[2];
  uint64_t v9;
  unint64_t v10;
  _OWORD v11[5];

  v3 = a2;
  v9 = 0;
  memset(bytes, 0, sizeof(bytes));
  LOBYTE(bytes[0]) = 35;
  v10 = sntp_timestamp_hton(a1);
  v4 = xpc_data_create(bytes, 0x30uLL);
  if (!v4)
    sub_100033DC4(&v7, v11);
  v5 = v4;

  return v5;
}

id sub_10000E3A0(void *a1, void *a2)
{
  id v3;
  NSObject *v4;
  __int128 v5;
  unint64_t v6;
  unint64_t v7;
  xpc_object_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  __int128 v18;
  unint64_t v19;
  _OWORD bytes[3];
  __int128 buffer;
  __int128 v22;
  __int128 v23;
  _OWORD v24[5];

  v3 = a1;
  v4 = a2;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v22 = v5;
  v23 = v5;
  bytes[2] = v5;
  buffer = v5;
  bytes[0] = v5;
  bytes[1] = v5;
  v6 = sub_10000E270();
  v7 = sntp_timestamp_hton(v6);
  if (xpc_data_get_bytes(v3, &buffer, 0, 0x30uLL) == 48)
  {
    v24[0] = buffer;
    v24[1] = v22;
    v24[2] = v23;
    v18 = xmmword_100041100;
    v19 = v7;
    sntp_server_respond((uint64_t)v24, (uint64_t)&v18, (uint64_t (*)(void))sub_10000E270, (uint64_t)bytes);
    v8 = xpc_data_create(bytes, 0x30uLL);
    if (!v8)
      sub_100033DC4(&v18, v24);
    v9 = v8;

  }
  else
  {
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100033E4C(v4, v10, v11, v12, v13, v14, v15, v16);
    v9 = 0;
  }

  return v9;
}

void sub_10000E4D4(unint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  __int128 v5;
  int v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  unint64_t v21;
  unint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  unint64_t v36;
  __int128 buffer;
  __int128 v38;
  __int128 v39;
  _OWORD v40[5];
  unint64_t v41;
  _QWORD v42[2];
  _BYTE buf[22];
  __int16 v44;
  uint64_t v45;
  timex v46;

  v41 = a1;
  v4 = a3;
  *(_QWORD *)&v5 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v5 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v40[3] = v5;
  v40[4] = v5;
  v40[1] = v5;
  v40[2] = v5;
  v39 = v5;
  v40[0] = v5;
  buffer = v5;
  v38 = v5;
  if (xpc_data_get_bytes(a2, &buffer, 0, 0x30uLL) == 48)
  {
    v36 = sub_10000E270();
    *(_OWORD *)&v46.modes = buffer;
    *(_OWORD *)&v46.freq = v38;
    *(_OWORD *)&v46.esterror = v39;
    sntp_client_process_response((unsigned __int8 *)&v46, &v41, &v36, (uint64_t)v40);
    v6 = v40[0];
    if (LODWORD(v40[0]))
    {
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
        sub_100033F68(v6, v4, v7);
      goto LABEL_29;
    }
    v15 = sntp_calc_offset((uint64_t)v40);
    v17 = v16;
    v18 = v36;
    v19 = v4;
    v20 = sntp_datestamp_to_nsec(v15, v17);
    v21 = sntp_timestamp_to_datestamp(v18);
    v23 = sntp_datestamp_to_timespec(v21, v22);
    v25 = v24;
    v26 = v23 - 2208988800;
    v42[0] = v23 - 2208988800;
    v42[1] = v24;
    if (v20 >= 0)
      v27 = v20;
    else
      v27 = -v20;
    if (!v15 && v27 < 0x7A12000)
    {
      *(_QWORD *)&v46.modes = 8209;
      memset(&v46.freq, 0, 120);
      v46.offset = v20;
      v46.status = 1;
      v28 = ntp_adjtime(&v46);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v20;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v46.offset;
        v44 = 2048;
        v45 = v46.freq / 0x10000;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "PACING with ntp_adjtime of %lld ns => resulting offset: %ld ns freq: %ld PPM", buf, 0x20u);
      }
      if (v28 && os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        sub_100033F00(v28, v19, v29);
LABEL_28:

      goto LABEL_29;
    }
    v30 = sntp_datestamp_to_timespec(v15, v17);
    v32 = v31 + v25;
    *(_QWORD *)buf = v30 + v26;
    *(_QWORD *)&buf[8] = v31 + v25;
    if (v31 + v25 <= 999999999)
    {
      if ((v32 & 0x8000000000000000) == 0)
      {
LABEL_22:
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          v46.modes = 68158466;
          *(&v46.modes + 1) = 16;
          LOWORD(v46.offset) = 2096;
          *(uint64_t *)((char *)&v46.offset + 2) = (uint64_t)v42;
          WORD1(v46.freq) = 1040;
          HIDWORD(v46.freq) = 16;
          LOWORD(v46.maxerror) = 2096;
          *(uint64_t *)((char *)&v46.maxerror + 2) = (uint64_t)buf;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "setting time from %{timespec}.*P to %{timespec}.*P", (uint8_t *)&v46, 0x22u);
        }
        if (clock_settime(_CLOCK_REALTIME, (const timespec *)buf))
        {
          v35 = v19;
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
            sub_100033E7C(v35);

        }
        goto LABEL_28;
      }
      v33 = 1000000000;
      v34 = -1;
    }
    else
    {
      v33 = -1000000000;
      v34 = 1;
    }
    *(_QWORD *)buf = v30 + v26 + v34;
    *(_QWORD *)&buf[8] = v33 + v32;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_100033FD0(v4, v8, v9, v10, v11, v12, v13, v14);
LABEL_29:

}

void sub_10000E820(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 8u);
}

BOOL sub_10000E82C(NSObject *a1)
{
  return os_log_type_enabled(a1, OS_LOG_TYPE_ERROR);
}

void sub_10000EB4C(void *a1)
{
  id v2;
  os_log_t v3;
  void *v4;
  NSObject *v5;
  NSMutableSet *v6;
  void *v7;
  id v8;
  NSMutableDictionary *v9;
  void *v10;
  id v11;
  id *v12;
  __CFDictionary *v13;
  __CFDictionary *Mutable;
  __CFDictionary *v15;
  CFNumberRef v16;
  __CFDictionary *v17;
  const __CFDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  int valuePtr;
  int v30;
  uint64_t v31;
  uint8_t buf[16];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;

  v2 = a1;
  if (!qword_100057CF0)
  {
    v3 = os_log_create("com.apple.RemoteServiceDiscovery", "ncm_host");
    v4 = (void *)qword_100057CF8;
    qword_100057CF8 = (uint64_t)v3;

    v5 = qword_100057CF8;
    if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing ncm host backend", buf, 2u);
    }
    objc_storeStrong((id *)&qword_100057CF0, a1);
    v6 = objc_opt_new(NSMutableSet);
    v7 = (void *)qword_100057D00;
    qword_100057D00 = (uint64_t)v6;

    v8 = (id)qword_100057D00;
    if (!v8)
      sub_100034000(&v30, buf);

    v9 = objc_opt_new(NSMutableDictionary);
    v10 = (void *)qword_100057D08;
    qword_100057D08 = (uint64_t)v9;

    v11 = (id)qword_100057D08;
    if (!v11)
      sub_10003408C(&v30, buf);

    if (qword_100057D10)
      sub_1000341A4(&v30, buf);
    v12 = sub_1000111AC((void *)qword_100057CF0);
    qword_100057D10 = (uint64_t)v12;
    if (!v12)
      sub_100034118(&v30, buf);
    v13 = IOServiceMatching("AppleUSBNCMData");
    if (!v13)
    {
      v28 = 0;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      *(_OWORD *)buf = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v19 = 3;
      else
        v19 = 2;
      v30 = 134217984;
      v31 = 0;
      v20 = _os_log_send_and_compose_impl(v19, &v28, buf, 80, &_mh_execute_header, &_os_log_default, 16);
      v21 = _os_crash_msg(v28, v20);
      sub_100033D14(v21);
    }
    Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    v15 = Mutable;
    if (!Mutable)
    {
      v28 = 0;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      *(_OWORD *)buf = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v22 = 3;
      else
        v22 = 2;
      v30 = 134217984;
      v31 = 0;
      v23 = _os_log_send_and_compose_impl(v22, &v28, buf, 80, &_mh_execute_header, &_os_log_default, 16);
      v24 = _os_crash_msg(v28, v23);
      sub_100033D14(v24);
    }
    CFDictionarySetValue(Mutable, CFSTR("IOModel"), CFSTR("USB"));
    valuePtr = 1452;
    v16 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
    CFDictionarySetValue(v15, CFSTR("idVendor"), v16);
    CFDictionarySetValue(v13, CFSTR("IOPropertyMatch"), v15);
    v17 = IOServiceMatching("IOEthernetInterface");
    v18 = v17;
    if (!v17)
    {
      v28 = 0;
      v35 = 0u;
      v36 = 0u;
      v33 = 0u;
      v34 = 0u;
      *(_OWORD *)buf = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v25 = 3;
      else
        v25 = 2;
      v30 = 134217984;
      v31 = 0;
      v26 = _os_log_send_and_compose_impl(v25, &v28, buf, 80, &_mh_execute_header, &_os_log_default, 16);
      v27 = _os_crash_msg(v28, v26);
      sub_100033D14(v27);
    }
    CFDictionarySetValue(v17, CFSTR("IOParentMatch"), v13);
    if (v16)
      CFRelease(v16);
    CFRelease(v15);
    CFRelease(v13);
    sub_1000112B4((uint64_t)v12, (IOServiceMatchingCallback)sub_10000F074, v18);
  }

}

void sub_10000F004(_Unwind_Exception *a1)
{
  const void *v1;
  const void *v2;

  CFRelease(v2);
  if (v1)
    CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10000F074(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  int v7;
  NSObject *v9;
  uint64_t v10;
  RSDNCMInterface *v11;
  RSDNCMInterface *v12;
  RSDNCMInterface *v13;
  RSDNCMInterface *v14;
  RSDRemoteNCMHostDevice *v15;
  RSDRemoteNCMHostDevice *v16;
  void *v17;
  const __CFString *v18;
  const __CFString *v19;
  NSObject *v20;
  io_object_t v21;
  io_registry_entry_t v22;
  kern_return_t v23;
  NSObject *v24;
  __CFString *v25;
  NSObject *v26;
  _BOOL4 v27;
  CFStringRef v28;
  NSObject *v29;
  char v30;
  __int128 v31;
  io_registry_entry_t v32;
  __CFString *v33;
  NSObject *v34;
  kern_return_t Name;
  NSObject *v36;
  NSObject *v37;
  _BOOL4 v38;
  char v40;
  char v41[15];
  char v42;
  char v43[11];
  int v44;
  char v45;
  char v46[15];
  char v47;
  char v48[15];
  char v49;
  char v50[11];
  io_iterator_t iteratora;
  uint8_t v52[4];
  __CFString *v53;
  uint8_t buf[16];
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;

  if (!a1)
    sub_100034230(v52, buf);
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v4 = result;
    do
    {
      v44 = v4;
      v5 = qword_100057CF8;
      if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "NCM device attached", buf, 2u);
      }
      v6 = qword_100057CF8;
      if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v4;
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "IOIteratorNext returned %d", buf, 8u);
      }
      *(_DWORD *)buf = 0;
      v7 = -5;
      do
      {
        if (sub_100010F94(v4, buf))
        {
          if (*(_DWORD *)buf != 4372)
            goto LABEL_17;
          if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEBUG))
            sub_10003436C(&v42, v43);
          goto LABEL_22;
        }
        usleep(0x186A0u);
      }
      while (!__CFADD__(v7++, 1));
      v9 = qword_100057CF8;
      if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Failed to extract productid, fallback to false", v52, 2u);
      }
LABEL_17:
      v10 = sub_1000108BC(v4);
      if ((v10 & 1) != 0)
      {
LABEL_18:
        v11 = [RSDNCMInterface alloc];
        v12 = -[RSDNCMInterface initWithService:notificationPort:queue:](v11, "initWithService:notificationPort:queue:", v4, a1, qword_100057CF0);
        v13 = v12;
        if (v12)
        {
          -[RSDNCMInterface setIs_private:](v12, "setIs_private:", v10);
          v14 = v13;
          -[RSDNCMInterface setInactive_callback:](v14, "setInactive_callback:", &stru_1000513F8);
          -[RSDNCMInterface setAddressed_callback:](v14, "setAddressed_callback:", &stru_100051418);
          -[RSDNCMInterface setDetached_callback:](v14, "setDetached_callback:", &stru_100051438);

          if (-[RSDNCMInterface activate](v14, "activate"))
          {
            v15 = -[RSDRemoteNCMHostDevice initWithInterface:]([RSDRemoteNCMHostDevice alloc], "initWithInterface:", v14);
            -[RSDNCMInterface setDevice:](v14, "setDevice:", v15);
            *(_DWORD *)buf = -1431655766;
            v16 = v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](v16, "interface"));
            sub_100010E20((io_registry_entry_t)objc_msgSend(v17, "service"), buf);

            -[RSDRemoteDevice setBackendProperty:withUint:](v16, "setBackendProperty:withUint:", "LocationID", *(unsigned int *)buf);
            -[RSDRemoteNCMHostDevice attach](v16, "attach");
            objc_msgSend((id)qword_100057D00, "addObject:", v14);

          }
        }

        goto LABEL_22;
      }
      iteratora = 0;
      v18 = IOObjectCopyClass(v4);
      v19 = v18;
      if (v18)
      {
        if (CFStringCompare(v18, CFSTR("IOEthernetInterface"), 0))
        {
          v20 = qword_100057CF8;
          if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)&buf[4] = v19;
            _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Unsupported class %@", buf, 0xCu);
          }
        }
        else
        {
          v21 = sub_100010964(v4, 3);
          v22 = v21;
          if (v21)
          {
            if (IOObjectConformsTo(v21, "IOUSBDevice"))
            {
              v23 = IORegistryEntryCreateIterator(v22, "IOService", 0, &iteratora);
              if (v23)
              {
                v24 = qword_100057CF8;
                if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 67109120;
                  *(_DWORD *)&buf[4] = v23;
                  _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "IORegistryEntryCreateIterator failed: 0x%08x", buf, 8u);
                }
LABEL_44:
                LODWORD(v28) = 0;
LABEL_45:
                v30 = 0;
              }
              else
              {
                *(_QWORD *)&v31 = 0xAAAAAAAAAAAAAAAALL;
                *((_QWORD *)&v31 + 1) = 0xAAAAAAAAAAAAAAAALL;
                v60 = v31;
                v61 = v31;
                v58 = v31;
                v59 = v31;
                v56 = v31;
                v57 = v31;
                *(_OWORD *)buf = v31;
                v55 = v31;
                while (1)
                {
                  v32 = IOIteratorNext(iteratora);
                  LODWORD(v28) = v32;
                  if (!v32)
                    break;
                  v33 = (__CFString *)sub_100010A04(v32);
                  v34 = qword_100057CF8;
                  if (v33)
                  {
                    if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)v52 = 136315138;
                      v53 = v33;
                      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Iterating %s", v52, 0xCu);
                    }
                    free(v33);
                    Name = IORegistryEntryGetName((io_registry_entry_t)v28, (char *)buf);
                    if (Name)
                    {
                      v36 = qword_100057CF8;
                      if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_ERROR))
                      {
                        *(_DWORD *)v52 = 67109120;
                        LODWORD(v53) = Name;
                        _os_log_error_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "IORegistryEntryGetName failed: 0x%08x", v52, 8u);
                      }
                    }
                    else if (!(*(_QWORD *)buf ^ 0x61746144204D434ELL | buf[8])
                           && sub_1000108BC((io_registry_entry_t)v28))
                    {
                      IOObjectRelease((io_object_t)v28);
                      LODWORD(v28) = 1;
                      break;
                    }
                    IOObjectRelease((io_object_t)v28);
                  }
                  else if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_ERROR))
                  {
                    sub_1000343F0(&v45, v46);
                  }
                }
                v30 = 1;
              }
              IOObjectRelease(v22);
              goto LABEL_62;
            }
            v28 = IOObjectCopyClass(v22);
            v29 = qword_100057CF8;
            if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v28;
              _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Unexpected 3rd parent class %@", buf, 0xCu);
              if (!v28)
                goto LABEL_45;
            }
            else if (!v28)
            {
              goto LABEL_45;
            }
            CFRelease(v28);
            goto LABEL_44;
          }
          v25 = (__CFString *)sub_100010A04(v4);
          v26 = qword_100057CF8;
          v27 = os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_ERROR);
          if (v25)
          {
            if (v27)
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v25;
              _os_log_error_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Can't find 3rd parent for %s", buf, 0xCu);
            }
            free(v25);
          }
          else if (v27)
          {
            sub_1000343C8(&v47, v48);
          }
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_ERROR))
      {
        sub_1000343C8(&v49, v50);
      }
      LODWORD(v28) = 0;
      v30 = 0;
LABEL_62:
      if (iteratora)
        IOObjectRelease(iteratora);
      if (v19)
        CFRelease(v19);
      if ((v30 & 1) != 0)
      {
        v37 = qword_100057CF8;
        v38 = os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT);
        if (!(_DWORD)v28)
        {
          if (v38)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Using the public NCM interface", buf, 2u);
          }
          goto LABEL_18;
        }
        if (v38)
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Not using the public NCM interface due to the existence of private NCM interface", buf, 2u);
        }
      }
      else if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_ERROR))
      {
        sub_1000343A0(&v40, v41);
      }
LABEL_22:
      if ((_DWORD)v4)
      {
        if (IOObjectRelease(v4))
          sub_1000342BC(v52, buf);
      }
      result = IOIteratorNext(iterator);
      v4 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

void sub_10000F7E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,int a26,unsigned int a27)
{
  const void *v27;

  if (v27)
    CFRelease(v27);
  sub_100010858(&a27);
  _Unwind_Resume(a1);
}

void sub_10000FD34(uint64_t a1)
{
  id *v1;
  void *v2;
  NSObject *v3;
  void *v4;

  v1 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "state") != 3)
  {
    v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "connection"));

    if (v2)
    {
      v3 = qword_100057CF8;
      if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_ERROR))
        sub_1000344EC((uint64_t *)v1, v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*v1, "connection"));
      xpc_remote_connection_cancel(v4);

    }
  }
}

id sub_1000103F0(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "triggerNeedsConnect");
}

void sub_1000103F8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t failsafe_version_flags;
  void *v14;
  int v15;
  uint64_t v16;

  if ((_DWORD)a3)
  {
    v5 = qword_100057CF8;
    if (os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_ERROR))
      sub_100034760(a1, a3, v5);
    objc_msgSend(*(id *)(a1 + 32), "connect:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));

    v7 = qword_100057CF8;
    v8 = os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, but socket is not needed anymore, closing", (uint8_t *)&v15, 0xCu);
      }
      close(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 304));
    }
    else
    {
      if (v8)
      {
        v10 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, socket is connected", (uint8_t *)&v15, 0xCu);
      }
      v11 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 304);
      v12 = qword_100057CF0;
      failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v8);
      v14 = (void *)xpc_remote_connection_create_with_connected_fd(v11, v12, failsafe_version_flags, 0);
      objc_msgSend(*(id *)(a1 + 32), "connect:", v14);

    }
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 304) = -1;
}

uint64_t sub_100010858(unsigned int *a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];

  result = *a1;
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    if ((_DWORD)result)
      sub_1000347D4(&v2, v3);
  }
  return result;
}

uint64_t sub_1000108BC(io_registry_entry_t a1)
{
  int v2;
  NSObject *v4;
  _BOOL4 v5;
  uint64_t result;
  uint8_t v7[12];
  int v8;

  v8 = 0;
  v2 = -5;
  do
  {
    if ((sub_100010EC4(a1, &v8) & 1) != 0)
      return (HIBYTE(v8) >> 5) & 1;
    usleep(0x186A0u);
  }
  while (!__CFADD__(v2++, 1));
  v4 = qword_100057CF8;
  v5 = os_log_type_enabled((os_log_t)qword_100057CF8, OS_LOG_TYPE_DEFAULT);
  result = 0;
  if (v5)
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Failed to extract nwifflags, fallback to false", v7, 2u);
    return 0;
  }
  return result;
}

uint64_t sub_100010964(io_registry_entry_t a1, int a2)
{
  uint64_t v3;
  uint64_t v5;
  io_registry_entry_t parent[20];

  if (!a1)
    sub_100034868(&v5, parent);
  parent[0] = 0;
  v3 = 0;
  if (!IORegistryEntryGetParentEntry(a1, "IOService", parent))
  {
    v3 = parent[0];
    if (a2 != 1)
    {
      v3 = sub_100010964(parent[0], (a2 - 1));
      IOObjectRelease(parent[0]);
    }
  }
  return v3;
}

const __CFString *sub_100010A04(io_registry_entry_t a1)
{
  const __CFString *result;
  const __CFString *v2;
  char *v3;

  result = IORegistryEntryCopyPath(a1, "IOService");
  if (result)
  {
    v2 = result;
    v3 = sub_10000B348(result);
    CFRelease(v2);
    return (const __CFString *)v3;
  }
  return result;
}

void sub_100010A44(id a1, RSDNCMInterface *a2)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](a2, "device"));
  objc_msgSend(v2, "setSuspended:", 1);

}

void sub_100010A78(id a1, RSDNCMInterface *a2)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](a2, "device"));
  sub_10002AF08(v2);
  objc_msgSend(v2, "triggerNeedsConnect");
  objc_msgSend(v2, "setSuspended:", 0);

}

void sub_100010ABC(id a1, RSDNCMInterface *a2)
{
  RSDNCMInterface *v2;
  id v3;

  v2 = a2;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v2, "device"));
  objc_msgSend(v3, "disconnect");
  -[RSDNCMInterface setDevice:](v2, "setDevice:", 0);
  objc_msgSend((id)qword_100057D00, "removeObject:", v2);

}

double sub_100010B18(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

void sub_100010B30(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

_BYTE *sub_100010B40(_BYTE *result, _BYTE *a2)
{
  *result = 0;
  *a2 = 0;
  return result;
}

uint64_t sub_100010B50(uint64_t a1)
{
  _QWORD *v1;

  return _os_crash_msg(*v1, a1);
}

BOOL sub_100010B5C(io_registry_entry_t a1, _DWORD *a2)
{
  _BOOL8 v2;
  void *v4;
  uint64_t v5;
  id v6;
  NSObject *v7;

  v2 = 0;
  if (a1 && a2)
  {
    v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("IOLinkStatus"), kCFAllocatorDefault, 3u);
    v2 = v4 != 0;
    if (v4)
    {
      v5 = objc_opt_class(NSNumber);
      if ((objc_opt_isKindOfClass(v4, v5) & 1) == 0)
        _os_assumes_log(0);
      *a2 = objc_msgSend(v4, "unsignedIntValue");
    }
    else
    {
      v6 = sub_100010C28();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1000348D8();

    }
  }
  return v2;
}

id sub_100010C28()
{
  if (qword_100057D20 != -1)
    dispatch_once(&qword_100057D20, &stru_100051458);
  return (id)qword_100057D18;
}

BOOL sub_100010C68(io_registry_entry_t a1, char *a2)
{
  _BOOL8 v2;
  const __CFString *v4;
  const __CFString *v5;
  CFTypeID v6;
  CFStringEncoding SystemEncoding;
  int CString;
  id v9;
  NSObject *v10;

  v2 = 0;
  if (a1 && a2)
  {
    v4 = (const __CFString *)IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("BSD Name"), kCFAllocatorDefault, 3u);
    if (v4)
    {
      v5 = v4;
      v6 = CFGetTypeID(v4);
      if (v6 != CFStringGetTypeID())
        _os_assumes_log(0);
      SystemEncoding = CFStringGetSystemEncoding();
      CString = CFStringGetCString(v5, a2, 16, SystemEncoding);
      v2 = CString != 0;
      if (CString && !*a2)
        _os_assumes_log(0);
      CFRelease(v5);
    }
    else
    {
      v9 = sub_100010C28();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100034904();

      return 0;
    }
  }
  return v2;
}

void sub_100010D50(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100010D70(io_registry_entry_t entry, _QWORD *a2)
{
  uint64_t result;
  CFTypeRef v5;
  CFTypeID v6;
  id v7;
  NSObject *v8;

  result = 0;
  if (entry && a2)
  {
    v5 = IORegistryEntrySearchCFProperty(entry, "IOService", CFSTR("USB Serial Number"), kCFAllocatorDefault, 3u);
    *a2 = v5;
    if (v5)
    {
      v6 = CFGetTypeID(v5);
      if (v6 != CFStringGetTypeID())
        _os_assumes_log(0);
      return 1;
    }
    else
    {
      v7 = sub_100010C28();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_100034930();

      return 0;
    }
  }
  return result;
}

BOOL sub_100010E20(io_registry_entry_t a1, _DWORD *a2)
{
  _BOOL8 v2;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;

  v2 = 0;
  if (a1 && a2)
  {
    v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("locationID"), kCFAllocatorDefault, 3u);
    v5 = v4;
    v2 = v4 != 0;
    if (v4)
    {
      *a2 = objc_msgSend(v4, "unsignedIntValue");
    }
    else
    {
      v6 = sub_100010C28();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10003495C();

    }
  }
  return v2;
}

uint64_t sub_100010EC4(io_registry_entry_t a1, _DWORD *a2)
{
  uint64_t v2;
  NSObject *v5;
  id v7;

  v2 = 0;
  if (a1 && a2)
  {
    v5 = IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("NetworkInterfaceFlags"), kCFAllocatorDefault, 3u);
    if (v5
      || (v5 = IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("NetworkInterfaceFlags"), kCFAllocatorDefault, 1u)) != 0)
    {
      *a2 = -[NSObject unsignedIntValue](v5, "unsignedIntValue");
      v2 = 1;
    }
    else
    {
      v7 = sub_100010C28();
      v5 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_100034988();
      v2 = 0;
    }

  }
  return v2;
}

BOOL sub_100010F94(io_registry_entry_t a1, _DWORD *a2)
{
  _BOOL8 v2;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;

  v2 = 0;
  if (a1 && a2)
  {
    v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("idProduct"), kCFAllocatorDefault, 3u);
    v5 = v4;
    v2 = v4 != 0;
    if (v4)
    {
      *a2 = objc_msgSend(v4, "unsignedIntValue");
    }
    else
    {
      v6 = sub_100010C28();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1000349B4();

    }
  }
  return v2;
}

BOOL sub_100011038(io_registry_entry_t a1, _DWORD *a2)
{
  _BOOL8 v2;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;

  v2 = 0;
  if (a1 && a2)
  {
    v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("HostState"), kCFAllocatorDefault, 3u);
    v5 = v4;
    v2 = v4 != 0;
    if (v4)
    {
      *a2 = objc_msgSend(v4, "unsignedIntValue");
    }
    else
    {
      v6 = sub_100010C28();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_1000349E0();

    }
  }
  return v2;
}

BOOL sub_1000110DC(io_registry_entry_t a1, uint64_t a2)
{
  _BOOL8 v2;
  void *v4;
  void *v5;
  _WORD *v6;
  __int16 v7;
  id v8;
  NSObject *v9;

  v2 = 0;
  if (a1 && a2)
  {
    v4 = (void *)IORegistryEntrySearchCFProperty(a1, "IOService", CFSTR("IOMACAddress"), kCFAllocatorDefault, 3u);
    v5 = v4;
    v2 = v4 != 0;
    if (v4)
    {
      if ((unint64_t)objc_msgSend(v4, "length") <= 5)
        _os_assumes_log(0);
      v6 = objc_msgSend(objc_retainAutorelease(v5), "bytes");
      v7 = v6[2];
      *(_DWORD *)a2 = *(_DWORD *)v6;
      *(_WORD *)(a2 + 4) = v7;
    }
    else
    {
      v8 = sub_100010C28();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_100034A0C();

    }
  }
  return v2;
}

id *sub_1000111AC(void *a1)
{
  id v2;
  id *v3;
  id *v4;
  uint64_t v5;
  IONotificationPortRef v6;
  id v7;
  uint64_t v9;
  _OWORD v10[5];

  v2 = a1;
  v3 = (id *)malloc_type_calloc(1uLL, 0x20uLL, 0x10A00403DD93119uLL);
  if (!v3)
    sub_100034A38(&v9, v10);
  v4 = v3;
  objc_storeStrong(v3, a1);
  v5 = IOMainPort(0, (mach_port_t *)v4 + 2);
  if ((_DWORD)v5)
    os_assert_mach("create main port", v5);
  v6 = IONotificationPortCreate(*((_DWORD *)v4 + 2));
  v4[2] = v6;
  if (!v6)
    sub_100034AA0(&v9, v10);
  v7 = *v4;
  if (!v7)
    sub_100034B08(&v9, v10);

  IONotificationPortSetDispatchQueue((IONotificationPortRef)v4[2], (dispatch_queue_t)*v4);
  return v4;
}

void sub_1000112B4(uint64_t a1, IOServiceMatchingCallback callback, const __CFDictionary *a3)
{
  uint64_t v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _QWORD v15[6];
  uint64_t v16;
  _OWORD v17[5];

  if (!a1)
    sub_100034A38(&v16, v17);
  v5 = IOServiceAddMatchingNotification(*(IONotificationPortRef *)(a1 + 16), "IOServiceFirstMatch", a3, callback, *(void **)(a1 + 16), (io_iterator_t *)(a1 + 24));
  v6 = sub_100010C28();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_100034B70(v5, v7, v8, v9, v10, v11, v12, v13);

  if ((_DWORD)v5)
  {
    _os_assumes_log((int)v5);
  }
  else
  {
    v14 = *(NSObject **)a1;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000113B8;
    v15[3] = &unk_100050FC8;
    v15[4] = a1;
    v15[5] = callback;
    dispatch_async(v14, v15);
  }
}

uint64_t sub_1000113B8(uint64_t a1)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = sub_100010C28();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_100034BD4(a1, v3, v4, v5, v6, v7, v8, v9);

  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 40))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 24));
}

uint64_t sub_100011410(unsigned int *a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];

  result = *a1;
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    if ((_DWORD)result)
      sub_100034C40(&v2, v3);
  }
  return result;
}

uint64_t sub_100011474(const char *a1, const char *a2, IOOptionBits a3)
{
  char *v5;
  io_iterator_t v6;
  io_object_t v7;
  kern_return_t v8;
  id v9;
  NSObject *v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  kern_return_t v20;
  kern_return_t v21;
  io_registry_entry_t v23;
  __int128 v24;
  kern_return_t v25;
  id v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  int *v33;
  char *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  io_iterator_t iterator[2];
  char *path;
  io_name_t name;
  _BYTE buf[12];
  uint64_t v47;

  *(_QWORD *)iterator = 0;
  path = 0;
  if (!a2)
  {
    v47 = 0;
    memset(name, 0, 80);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v28 = 3;
    else
      v28 = 2;
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = 0;
    v29 = _os_log_send_and_compose_impl(v28, &v47, name, 80, &_mh_execute_header, &_os_log_default, 16);
    v30 = _os_crash_msg(v47, v29);
    sub_100033D14(v30);
  }
  if (a1)
  {
    if (asprintf(&path, "IODeviceTree:/%s", a1) < 0)
    {
      v47 = 0;
      memset(name, 0, 80);
      v31 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v32 = 3;
      else
        v32 = 2;
      v33 = __error();
      v34 = strerror(*v33);
      *(_DWORD *)buf = 136315138;
      *(_QWORD *)&buf[4] = v34;
      v35 = _os_log_send_and_compose_impl(v32, &v47, name, 80, &_mh_execute_header, &_os_log_default, 16);

      v36 = _os_crash_msg(v47, v35);
      sub_100033D14(v36);
    }
    v5 = path;
  }
  else
  {
    v5 = "IODeviceTree:/";
  }
  v6 = IORegistryEntryFromPath(kIOMainPortDefault, v5);
  v7 = v6;
  iterator[1] = v6;
  if (v6)
  {
    v8 = IORegistryEntryCreateIterator(v6, "IODeviceTree", a3, iterator);
    if (v8)
    {
      v9 = sub_100010C28();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        sub_100034D50(v8, v10);

    }
    else
    {
      while (1)
      {
        v23 = IOIteratorNext(iterator[0]);
        if (!v23)
          break;
        *(_QWORD *)&v24 = 0xAAAAAAAAAAAAAAAALL;
        *((_QWORD *)&v24 + 1) = 0xAAAAAAAAAAAAAAAALL;
        *(_OWORD *)&name[96] = v24;
        *(_OWORD *)&name[112] = v24;
        *(_OWORD *)&name[64] = v24;
        *(_OWORD *)&name[80] = v24;
        *(_OWORD *)&name[32] = v24;
        *(_OWORD *)&name[48] = v24;
        *(_OWORD *)name = v24;
        *(_OWORD *)&name[16] = v24;
        v25 = IORegistryEntryGetName(v23, name);
        if (v25)
        {
          v26 = sub_100010C28();
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109120;
            *(_DWORD *)&buf[4] = v25;
            _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "IORegistryEntryGetName: %d", buf, 8u);
          }

        }
        else if (!strcmp(a2, name))
        {
          v19 = 1;
          goto LABEL_15;
        }
      }
    }
  }
  else
  {
    v11 = sub_100010C28();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      sub_100034CEC((uint64_t)v5, v12, v13, v14, v15, v16, v17, v18);

  }
  v19 = 0;
LABEL_15:
  if (iterator[0])
  {
    v20 = IOObjectRelease(iterator[0]);
    if (v20)
    {
      *(_QWORD *)buf = 0;
      memset(name, 0, 80);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v37 = 3;
      else
        v37 = 2;
      LODWORD(v47) = 67109120;
      HIDWORD(v47) = v20;
      v38 = _os_log_send_and_compose_impl(v37, buf, name, 80, &_mh_execute_header, &_os_log_default, 16);
      v39 = _os_crash_msg(*(_QWORD *)buf, v38);
      sub_100033D14(v39);
    }
  }
  if (v7)
  {
    v21 = IOObjectRelease(v7);
    if (v21)
    {
      *(_QWORD *)buf = 0;
      memset(name, 0, 80);
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v40 = 3;
      else
        v40 = 2;
      LODWORD(v47) = 67109120;
      HIDWORD(v47) = v21;
      v41 = _os_log_send_and_compose_impl(v40, buf, name, 80, &_mh_execute_header, &_os_log_default, 16);
      v42 = _os_crash_msg(*(_QWORD *)buf, v41);
      sub_100033D14(v42);
    }
  }
  free(path);
  return v19;
}

void sub_1000118F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, char a13, __int16 a14, char a15, char a16, void *a17)
{
  free(a17);
  _Unwind_Resume(a1);
}

void sub_100011948(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RemoteServiceDiscovery", "iokit");
  v2 = (void *)qword_100057D18;
  qword_100057D18 = (uint64_t)v1;

}

void sub_100011978(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 8u);
}

void sub_100011988(void *a1)
{
  id v2;
  os_log_t v3;
  void *v4;
  NSObject *v5;
  NSMutableSet *v6;
  void *v7;
  id v8;
  id *v9;
  CFMutableDictionaryRef v10;
  __CFDictionary *v11;
  const __CFDictionary *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint8_t buf[16];
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  v2 = a1;
  if (!qword_100057D28 && (sub_10000E004() & 1) == 0)
  {
    v3 = os_log_create("com.apple.RemoteServiceDiscovery", "ncm_device");
    v4 = (void *)qword_100057D30;
    qword_100057D30 = (uint64_t)v3;

    v5 = qword_100057D30;
    if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing ncm device backend", buf, 2u);
    }
    objc_storeStrong((id *)&qword_100057D28, a1);
    v6 = objc_opt_new(NSMutableSet);
    v7 = (void *)qword_100057D38;
    qword_100057D38 = (uint64_t)v6;

    v8 = (id)qword_100057D38;
    if (!v8)
      sub_100034DC0(&v17, buf);

    if (qword_100057D40)
      sub_100034F64(&v17, buf);
    v9 = sub_1000111AC((void *)qword_100057D28);
    qword_100057D40 = (uint64_t)v9;
    if (!v9)
      sub_100034E4C(&v17, buf);
    v10 = IOServiceMatching("AppleUSBDeviceNCMData");
    if (!v10)
      sub_100034ED8(&v17, buf);
    v11 = IOServiceMatching("IOEthernetInterface");
    v12 = v11;
    if (!v11)
    {
      v16 = 0;
      v22 = 0u;
      v23 = 0u;
      v20 = 0u;
      v21 = 0u;
      *(_OWORD *)buf = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v13 = 3;
      else
        v13 = 2;
      v17 = 134217984;
      v18 = 0;
      v14 = _os_log_send_and_compose_impl(v13, &v16, buf, 80, &_mh_execute_header, &_os_log_default, 16);
      v15 = _os_crash_msg(v16, v14);
      sub_100033D14(v15);
    }
    CFDictionarySetValue(v11, CFSTR("IOParentMatch"), v10);
    CFRelease(v10);
    sub_1000112B4((uint64_t)v9, (IOServiceMatchingCallback)sub_100011C0C, v12);
  }

}

void sub_100011BE4(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100011C0C(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  __int128 v3;
  uint64_t v4;
  NSObject *v5;
  const __CFString *v6;
  CFComparisonResult v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  NSObject *v15;
  unsigned __int8 v16;
  int v17;
  NSObject *v18;
  RSDNCMInterface *v19;
  RSDNCMInterface *v20;
  RSDNCMInterface *v21;
  RSDNCMInterface *v22;
  __int128 v23;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t buf[4];
  void *v31;
  uint8_t v32[128];

  if (!a1)
    sub_100034FF0(&v26, v32);
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v4 = result;
    *(_QWORD *)&v3 = 67109120;
    v23 = v3;
    while (1)
    {
      v5 = qword_100057D30;
      if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)v32 = v23;
        *(_DWORD *)&v32[4] = v4;
        _os_log_debug_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "IOIteratorNext returned %d", v32, 8u);
      }
      v6 = IOObjectCopyClass(v4);
      v7 = CFStringCompare(v6, CFSTR("AppleUSBDeviceNCMPrivateEthernetInterface"), 0);
      if (v6)
        CFRelease(v6);
      if (v7 == kCFCompareEqualTo)
        goto LABEL_29;
      v8 = (void *)IORegistryEntrySearchCFProperty(v4, "IOService", CFSTR("DeviceDescription"), kCFAllocatorDefault, 3u);
      if (!v8)
        break;
      v9 = v8;
      v26 = 0u;
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("ConfigurationDescriptors")));
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
      if (v11)
      {
        v12 = *(_QWORD *)v27;
        while (2)
        {
          for (i = 0; i != v11; i = (char *)i + 1)
          {
            if (*(_QWORD *)v27 != v12)
              objc_enumerationMutation(v10);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "objectForKeyedSubscript:", CFSTR("Interfaces"), v23));
            v15 = qword_100057D30;
            if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v31 = v14;
              _os_log_debug_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "interfaces: %{public}@", buf, 0xCu);
            }
            v16 = objc_msgSend(v14, "containsObject:", CFSTR("AppleUSBNCMDataAux"));

            if ((v16 & 1) != 0)
            {
              v17 = 1;
              goto LABEL_22;
            }
          }
          v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v26, v32, 16);
          if (v11)
            continue;
          break;
        }
      }
      v17 = 0;
LABEL_22:

      CFRelease(v9);
      v18 = qword_100057D30;
      if (!v17)
        goto LABEL_27;
      if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v32 = 0;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Not using the public NCM interface due to the existence of private NCM interface", v32, 2u);
      }
LABEL_33:
      if ((_DWORD)v4)
      {
        if (IOObjectRelease(v4))
          sub_10003507C(&v26, v32);
      }
      result = IOIteratorNext(iterator);
      v4 = result;
      if (!(_DWORD)result)
        return result;
    }
    v18 = qword_100057D30;
    if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "failed to find USB device for interface", buf, 2u);
      v18 = qword_100057D30;
    }
LABEL_27:
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v32 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Using the public NCM interface", v32, 2u);
    }
LABEL_29:
    v19 = [RSDNCMInterface alloc];
    v20 = -[RSDNCMInterface initWithService:notificationPort:queue:](v19, "initWithService:notificationPort:queue:", v4, a1, qword_100057D28);
    v21 = v20;
    if (v20)
    {
      -[RSDNCMInterface setIs_private:](v20, "setIs_private:", v7 == kCFCompareEqualTo);
      v22 = v21;
      -[RSDNCMInterface setInactive_callback:](v22, "setInactive_callback:", &stru_100051510);
      -[RSDNCMInterface setAddressed_callback:](v22, "setAddressed_callback:", &stru_100051530);
      -[RSDNCMInterface setDetached_callback:](v22, "setDetached_callback:", &stru_100051550);

      if (-[RSDNCMInterface activate](v22, "activate"))
        objc_msgSend((id)qword_100057D38, "addObject:", v22);
    }

    goto LABEL_33;
  }
  return result;
}

void sub_100012024(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, int a16, unsigned int a17)
{
  const void *v17;

  CFRelease(v17);
  sub_1000134C4(&a17);
  _Unwind_Resume(a1);
}

id sub_100012990(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if ((_DWORD)result != 5)
    return objc_msgSend(*(id *)(a1 + 32), "createBonjourListener");
  return result;
}

void sub_1000129CC(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  _BOOL8 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t failsafe_version_flags;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  int v16;
  uint64_t v17;
  __int16 v18;
  id v19;

  v3 = a2;
  v4 = qword_100057D30;
  v5 = os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT);
  if (v5)
  {
    v6 = *(_QWORD *)(a1 + 32);
    v16 = 138543618;
    v17 = v6;
    v18 = 2114;
    v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@> %{public}@ got incoming remoted connection", (uint8_t *)&v16, 0x16u);
  }
  v7 = qword_100057D28;
  failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v5);
  v9 = (void *)xpc_remote_connection_create_with_nw_connection(v3, v7, failsafe_version_flags, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));

  if (v10)
  {
    v11 = qword_100057D30;
    if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 32);
      v16 = 138543362;
      v17 = v12;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@> Canceling existing connection to replace it", (uint8_t *)&v16, 0xCu);
    }
    v13 = *(_QWORD *)(a1 + 32);
    v14 = *(_QWORD *)(v13 + 296);
    if (v14)
    {
      xpc_remote_connection_cancel(v14);
      v13 = *(_QWORD *)(a1 + 32);
    }
    objc_storeStrong((id *)(v13 + 296), v9);
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));
    xpc_remote_connection_cancel(v15);

  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "connect:", v9);
  }

}

void sub_100012B70(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  int port;
  int v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t description;
  uint64_t v19;
  NSObject *v20;
  uint64_t v21;
  NSObject *v22;
  nw_error_domain_t error_domain;
  int error_code;
  dispatch_time_t v25;
  NSObject *v26;
  _QWORD block[5];
  uint8_t buf[4];
  uint64_t v29;
  __int16 v30;
  uint64_t v31;
  __int16 v32;
  int v33;
  __int16 v34;
  NSObject *v35;

  v5 = a3;
  v6 = v5;
  if (a2 == 3)
  {
    v22 = qword_100057D30;
    if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_ERROR))
      sub_10003526C(a1, (uint64_t)v6, v22);
    error_domain = nw_error_get_error_domain(v6);
    error_code = nw_error_get_error_code(v6);
    if (error_domain == nw_error_domain_dns && (error_code == -65563 || error_code == -65568))
    {
      nw_listener_cancel(*(nw_listener_t *)(*(_QWORD *)(a1 + 32) + 304));
      v25 = dispatch_time(0, 5000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100012E90;
      block[3] = &unk_1000510D0;
      block[4] = *(_QWORD *)(a1 + 32);
      dispatch_after(v25, (dispatch_queue_t)qword_100057D28, block);
    }
  }
  else if (a2 == 2)
  {
    v7 = (void *)qword_100057D30;
    if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v9 = *(_QWORD *)(v8 + 304);
      v10 = v7;
      v11 = (void *)nw_listener_copy_local_endpoint(v9);
      *(_DWORD *)buf = 138544130;
      v29 = v8;
      v30 = 2112;
      v31 = (uint64_t)v11;
      v32 = 1024;
      v33 = 2;
      v34 = 2112;
      v35 = v6;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@> listening on %@ (state %u, error %@)", buf, 0x26u);

    }
    port = nw_listener_get_port(*(nw_listener_t *)(*(_QWORD *)(a1 + 32) + 304));
    if (port)
    {
      v13 = port;
      v14 = qword_100057D30;
      if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_INFO))
      {
        v15 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543618;
        v29 = v15;
        v30 = 1024;
        LODWORD(v31) = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "%{public}@> listener port: %u", buf, 0x12u);
      }
      v16 = nw_listener_copy_local_endpoint(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 304));
      v17 = (void *)v16;
      if (v16)
      {
        description = nw_endpoint_get_description(v16);
        if (description)
        {
          v19 = description;
          v20 = qword_100057D30;
          if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_INFO))
          {
            v21 = *(_QWORD *)(a1 + 32);
            *(_DWORD *)buf = 138543618;
            v29 = v21;
            v30 = 2080;
            v31 = v19;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "%{public}@> listener local endpoint: %s", buf, 0x16u);
          }
        }
      }

    }
  }
  else if (v5)
  {
    v26 = qword_100057D30;
    if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_ERROR))
      sub_1000351F8(a1, (uint64_t)v6, v26);
  }

}

id sub_100012E90(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if ((_DWORD)result != 5)
    return objc_msgSend(*(id *)(a1 + 32), "createBonjourListener");
  return result;
}

void sub_100012ECC(uint64_t a1, void *a2, int a3)
{
  id v5;
  NSObject *v6;
  uint64_t v7;
  const char *v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  id v12;
  __int16 v13;
  const char *v14;

  v5 = a2;
  v6 = qword_100057D30;
  if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
  {
    v7 = *(_QWORD *)(a1 + 32);
    v8 = "removed";
    v9 = 138543874;
    if (a3)
      v8 = "added";
    v10 = v7;
    v11 = 2112;
    v12 = v5;
    v13 = 2080;
    v14 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@> advertised endpoint %@ %s", (uint8_t *)&v9, 0x20u);
  }

}

id sub_100013234(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if ((_DWORD)result != 5)
    return objc_msgSend(*(id *)(a1 + 32), "createPortListener");
  return result;
}

uint64_t sub_100013270(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t failsafe_version_flags;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint8_t buf[4];
  uint64_t v18;

  v16 = -1431655766;
  for (result = sub_10001E334(*(_DWORD *)(a1 + 40), 0, 0, (unsigned __int8 *)&xmmword_1000410A8, (int *)&v16);
        !(_DWORD)result;
        result = sub_10001E334(*(_DWORD *)(a1 + 40), 0, 0, (unsigned __int8 *)&xmmword_1000410A8, (int *)&v16))
  {
    v3 = qword_100057D30;
    v4 = os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> Got incoming remoted connection", buf, 0xCu);
    }
    v6 = v16;
    v7 = qword_100057D28;
    failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v4);
    v9 = (void *)xpc_remote_connection_create_with_connected_fd(v6, v7, failsafe_version_flags, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));

    if (v10)
    {
      v11 = qword_100057D30;
      if (os_log_type_enabled((os_log_t)qword_100057D30, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@> Canceling existing connection to replace it", buf, 0xCu);
      }
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(v13 + 296);
      if (v14)
      {
        xpc_remote_connection_cancel(v14);
        v13 = *(_QWORD *)(a1 + 32);
      }
      objc_storeStrong((id *)(v13 + 296), v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));
      xpc_remote_connection_cancel(v15);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "connect:", v9);
    }

  }
  return result;
}

uint64_t sub_100013468(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

uint64_t sub_1000134C4(unsigned int *a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];

  result = *a1;
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    if ((_DWORD)result)
      sub_100035360(&v2, v3);
  }
  return result;
}

void sub_100013528(id a1, RSDNCMInterface *a2)
{
  void *v2;
  void *v3;
  RSDNCMInterface *v4;

  v4 = a2;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v4, "device"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v4, "device"));
    objc_msgSend(v3, "disconnect");

    -[RSDNCMInterface setDevice:](v4, "setDevice:", 0);
  }

}

void sub_10001358C(id a1, RSDNCMInterface *a2)
{
  void *v2;
  void *v3;
  RSDRemoteNCMDeviceDevice *v4;
  void *v5;
  void *v6;
  RSDNCMInterface *v7;

  v7 = a2;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v7, "device"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v7, "device"));
    objc_msgSend(v3, "disconnect");

    -[RSDNCMInterface setDevice:](v7, "setDevice:", 0);
  }
  v4 = -[RSDRemoteNCMDeviceDevice initWithInterface:]([RSDRemoteNCMDeviceDevice alloc], "initWithInterface:", v7);
  -[RSDNCMInterface setDevice:](v7, "setDevice:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v7, "device"));
  sub_10002AF08(v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v7, "device"));
  objc_msgSend(v6, "attach");

}

void sub_100013648(id a1, RSDNCMInterface *a2)
{
  void *v2;
  void *v3;
  RSDNCMInterface *v4;

  v4 = a2;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v4, "device"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v4, "device"));
    objc_msgSend(v3, "disconnect");

    -[RSDNCMInterface setDevice:](v4, "setDevice:", 0);
  }
  objc_msgSend((id)qword_100057D38, "removeObject:", v4);

}

uint64_t sub_1000136BC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  return _os_log_send_and_compose_impl(a1, v6, v5, 80, a5, v7, 16);
}

void sub_1000136D4(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_error_impl(a1, log, OS_LOG_TYPE_ERROR, a4, (uint8_t *)va, 0x16u);
}

uint64_t sub_1000136E8(uint64_t a1, int a2, _QWORD *a3, void *a4)
{
  id v7;
  nw_parameters_t secure_tcp;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v14;
  _OWORD v15[5];

  v7 = a4;
  secure_tcp = nw_parameters_create_secure_tcp(v7, _nw_parameters_configure_protocol_default_configuration);
  if (!(_DWORD)a1)
    sub_1000353E8(&v14, v15);
  v9 = secure_tcp;
  v10 = nw_interface_create_with_index(a1);
  if (v10)
  {
    nw_parameters_require_interface(v9, v10);
    nw_parameters_set_local_only(v9, 1);
    nw_parameters_set_required_address_family(v9, 30);
    nw_parameters_set_required_interface_type(v9, nw_interface_type_wired);
    nw_parameters_set_no_fallback(v9, 1);
    nw_parameters_set_indefinite(v9, 0);
    xpc_remote_connection_setup_nw_parameters(v9, a2);
    v11 = 0;
    *a3 = objc_retainAutorelease(v9);
  }
  else
  {
    if (qword_100057D50 != -1)
      dispatch_once(&qword_100057D50, &stru_100051570);
    v12 = qword_100057D48;
    if (os_log_type_enabled((os_log_t)qword_100057D48, OS_LOG_TYPE_ERROR))
      sub_100035490(v12);
    v11 = 6;
  }

  return v11;
}

void sub_100013854(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RemoteServiceDiscovery", "bonjour");
  v2 = (void *)qword_100057D48;
  qword_100057D48 = (uint64_t)v1;

}

uint64_t sub_100013884(const char *a1)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057D58, "objectForKeyedSubscript:", v2));
  if (v3)
  {
    objc_msgSend((id)qword_100057D58, "removeObjectForKey:", v2);
    sub_100013934(a1);
    sub_100013B68();
    v4 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
      sub_1000354D0();
    v4 = 2;
  }

  return v4;
}

void sub_100013934(const char *a1)
{
  void *v2;
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  int v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *j;
  void *v16;
  _QWORD v17[5];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v3 = (id)qword_100057D78;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "interface"));
        v10 = strcmp(a1, (const char *)objc_msgSend(v9, "name"));

        if (!v10)
          objc_msgSend(v2, "addObject:", v8);
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v11 = v2;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v13; j = (char *)j + 1)
      {
        if (*(_QWORD *)v19 != v14)
          objc_enumerationMutation(v11);
        v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)j);
        if (objc_msgSend(v16, "state") == 3)
        {
          v17[0] = _NSConcreteStackBlock;
          v17[1] = 3221225472;
          v17[2] = sub_100015418;
          v17[3] = &unk_100051600;
          v17[4] = v16;
          objc_msgSend(v16, "goodByeWithCallback:", v17);
        }
        else
        {
          objc_msgSend(v16, "disconnect");
        }
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v13);
  }

}

void sub_100013B68()
{
  xpc_object_t empty;
  id v1;
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  id v6;
  const char *v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  empty = xpc_dictionary_create_empty();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v1 = (id)qword_100057D58;
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v10;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v10 != v4)
          objc_enumerationMutation(v1);
        v6 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v5));
        v7 = (const char *)objc_msgSend(v6, "UTF8String", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057D58, "objectForKeyedSubscript:", v6));
        xpc_dictionary_set_string(empty, v7, (const char *)objc_msgSend(v8, "address"));

        v5 = (char *)v5 + 1;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v3);
  }

  xpc_set_event("com.apple.remoted.compute-platform", "endpoints", empty);
}

uint64_t sub_100013CC0(uint64_t a1, const void *a2)
{
  return sub_100013CC8(a1, a2, 1);
}

uint64_t sub_100013CC8(uint64_t a1, const void *a2, int a3)
{
  void *v6;
  void *v7;
  uint64_t v8;
  RSDNetworkInterface *v9;
  id v10;
  RSDRemoteComputeControllerDevice *v11;
  RSDRemoteComputeControllerDevice *v12;
  RSDComputeControllerDeviceEndpoint *v13;
  RSDComputeControllerDeviceEndpoint *v14;
  void *v15;
  uint64_t v17;
  id v18;
  _OWORD v19[5];
  char v20[16];
  _WORD v21[15];

  *(_OWORD *)v20 = 0u;
  memset(v21, 0, sizeof(v21));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057D58, "objectForKeyedSubscript:", v6));
  if (v7)
  {
    if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
      sub_1000356F0();
    v8 = 17;
    goto LABEL_19;
  }
  v18 = 0;
  v9 = -[RSDNetworkInterface initWithName:error:]([RSDNetworkInterface alloc], "initWithName:error:", a1, &v18);
  v10 = v18;
  if (!v9)
  {
    v15 = (void *)qword_100057D60;
    if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
      sub_100035530(v15, v10);
    v8 = (uint64_t)objc_msgSend(v10, "code");
    goto LABEL_18;
  }
  v11 = -[RSDRemoteComputeControllerDevice initWithInterface:address:]([RSDRemoteComputeControllerDevice alloc], "initWithInterface:address:", v9, a2);
  if (!v11)
    sub_1000355C0(&v17, v19);
  v12 = v11;

  if (!inet_ntop(30, a2, v20, 0x2Eu))
  {
    v8 = *__error();
    if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
      sub_100035628();

LABEL_18:
    goto LABEL_19;
  }
  v13 = -[RSDComputeControllerDeviceEndpoint initWithAddress:]([RSDComputeControllerDeviceEndpoint alloc], "initWithAddress:", v20);
  if (!v13)
    sub_100035688(&v17, v19);
  v14 = v13;

  objc_msgSend((id)qword_100057D58, "setObject:forKeyedSubscript:", v14, v6);
  if (a3)
    sub_100013B68();
  -[RSDRemoteComputeControllerDevice attach](v12, "attach");

  v8 = 0;
LABEL_19:

  return v8;
}

uint64_t sub_100013F0C(uint64_t a1, const void *a2)
{
  return sub_100013CC8(a1, a2, 0);
}

uint64_t sub_100013F14(uint64_t a1)
{
  return sub_100013F1C(a1, 1);
}

uint64_t sub_100013F1C(uint64_t a1, int a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  RSDNetworkInterface *v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  RSDComputeControllerBrowser *v27;
  void *v28;
  void *v29;
  NSObject *bonjour_service;
  int v32;
  uint64_t v33;
  id v34;
  id v35;
  __int128 handler;
  void (*v37)(uint64_t, void *, void *);
  void *v38;
  RSDNetworkInterface *v39;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057D68, "objectForKeyedSubscript:", v4));
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
      sub_1000358B0();
    v6 = 17;
  }
  else
  {
    v7 = (id)qword_100057D80;
    if (!v7)
      sub_100035750(&v35, &handler);

    v35 = 0;
    v8 = -[RSDNetworkInterface initWithName:error:]([RSDNetworkInterface alloc], "initWithName:error:", a1, &v35);
    v9 = v35;
    if (v8)
    {
      v32 = a2;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[RSDRemoteComputeControllerDevice tlsOidsRequiredOfPeer](RSDRemoteComputeControllerDevice, "tlsOidsRequiredOfPeer"));
      v11 = sub_100027B38(16, v10);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);

      v34 = 0;
      v6 = sub_1000136E8(-[RSDNetworkInterface index](v8, "index"), 1, &v34, v12);
      v13 = v34;
      if ((_DWORD)v6)
      {
        v14 = qword_100057D60;
        if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_FAULT))
          sub_100035880(v14, v15, v16, v17, v18, v19, v20, v21);

        v22 = 0;
        v23 = 0;
      }
      else
      {
        bonjour_service = nw_browse_descriptor_create_bonjour_service("_remoted_compute._tcp", "local.");
        v25 = nw_browser_create(bonjour_service, v13);
        if (!v25)
          sub_100035818(&v33, &handler);
        v23 = v25;

        *(_QWORD *)&handler = _NSConcreteStackBlock;
        *((_QWORD *)&handler + 1) = 3221225472;
        v37 = sub_100015474;
        v38 = &unk_100051668;
        v39 = v8;
        nw_browser_set_browse_results_changed_handler(v23, &handler);
        nw_browser_set_state_changed_handler(v23, &stru_1000516A8);
        nw_browser_set_queue(v23, (dispatch_queue_t)qword_100057D70);
        nw_browser_start(v23);
        v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057D68, "objectForKeyedSubscript:", v22));
        objc_msgSend(v26, "setNw_browser:", v23);

        v6 = 0;
      }
      a2 = v32;
    }
    else
    {
      v24 = (void *)qword_100057D60;
      if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
        sub_100035530(v24, v9);
      v6 = (uint64_t)objc_msgSend(v9, "code");
      v13 = 0;
      v22 = 0;
      v23 = 0;
    }

    if ((_DWORD)v6)
    {
      if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
        sub_1000357B8();
    }
    else
    {
      v27 = objc_alloc_init(RSDComputeControllerBrowser);
      objc_msgSend((id)qword_100057D68, "setObject:forKeyedSubscript:", v27, v4);

      v28 = (void *)os_transaction_create("compute_controller");
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057D68, "objectForKeyedSubscript:", v4));
      objc_msgSend(v29, "setBrowser_tx:", v28);

      if (a2)
        sub_1000143A0();
      v6 = 0;
    }
  }

  return v6;
}

uint64_t sub_1000142C8(uint64_t a1)
{
  return sub_100013F1C(a1, 0);
}

uint64_t sub_1000142D0(const char *a1)
{
  void *v2;
  void *v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057D68, "objectForKeyedSubscript:", v2));
  v4 = v3;
  if (v3)
  {
    v5 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "nw_browser"));
    nw_browser_cancel(v5);

    objc_msgSend((id)qword_100057D68, "removeObjectForKey:", v2);
    sub_100013934(a1);
    sub_1000143A0();
    v6 = 0;
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
      sub_100035910();
    v6 = 2;
  }

  return v6;
}

void sub_1000143A0()
{
  xpc_object_t empty;
  xpc_object_t v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  xpc_object_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  empty = xpc_dictionary_create_empty();
  v1 = xpc_array_create_empty();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (id)qword_100057D68;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v10;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v2);
        v7 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v6));
        v8 = xpc_string_create((const char *)objc_msgSend(v7, "UTF8String", (_QWORD)v9));
        xpc_array_append_value(v1, v8);

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

  xpc_dictionary_set_value(empty, "interfaces", v1);
  xpc_set_event("com.apple.remoted.compute-platform", "browse", empty);

}

void sub_1000144F4(void *a1)
{
  id v2;
  os_log_t v3;
  void *v4;
  void *v5;
  NSObject *v6;
  NSMutableSet *v7;
  void *v8;
  NSMutableSet *v9;
  void *v10;
  NSMutableDictionary *v11;
  void *v12;
  NSMutableDictionary *v13;
  void *v14;
  NSObject *v15;
  int v16;
  uint64_t description;

  v2 = a1;
  if (!qword_100057D70)
  {
    v3 = os_log_create("com.apple.RemoteServiceDiscovery", "compute_controller");
    v4 = (void *)qword_100057D60;
    qword_100057D60 = (uint64_t)v3;

    if (sub_100026FB0() == 15)
    {
      sub_1000146C8(0);
      sub_1000194F0(5, 10, 5, &stru_1000515B0);
      v5 = (void *)qword_100057D60;
      if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEFAULT))
      {
        v6 = v5;
        v16 = 136446210;
        description = remote_device_type_get_description(15);
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "initializing compute platform with type %{public}s", (uint8_t *)&v16, 0xCu);

      }
      objc_storeStrong((id *)&qword_100057D70, a1);
      v7 = objc_opt_new(NSMutableSet);
      v8 = (void *)qword_100057D78;
      qword_100057D78 = (uint64_t)v7;

      v9 = objc_opt_new(NSMutableSet);
      v10 = (void *)qword_100057D80;
      qword_100057D80 = (uint64_t)v9;

      v11 = objc_opt_new(NSMutableDictionary);
      v12 = (void *)qword_100057D68;
      qword_100057D68 = (uint64_t)v11;

      v13 = objc_opt_new(NSMutableDictionary);
      v14 = (void *)qword_100057D58;
      qword_100057D58 = (uint64_t)v13;

    }
    else
    {
      v15 = qword_100057D60;
      if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v16) = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "not enabling backend on this platform", (uint8_t *)&v16, 2u);
      }
    }
  }

}

void sub_1000146C8(void *a1)
{
  id v1;
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  id v7;
  uint8_t v8[8];
  const __CFString *v9;
  CFBooleanRef v10;

  v1 = a1;
  v2 = objc_msgSend(&off_100052F20, "mutableCopy");
  v9 = CFSTR("GetCombined");
  v10 = kCFBooleanTrue;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v10, &v9, 1));
  v4 = AMFDRSealingMapCopyLocalDictForClass(CFSTR("ChMf"), v3, 0);
  if (v4)
  {
    v5 = (void *)v4;

    objc_msgSend(v2, "addObject:", CFSTR("1.2.840.113635.100.6.85"));
  }
  else
  {
    v6 = qword_100057D60;
    if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Chassis manifest not present.", v8, 2u);
    }

  }
  v7 = objc_msgSend(v2, "copy");
  sub_100019018(v7, v1);

}

void sub_10001480C(id a1, NSError *a2)
{
  if (!a2)
    sub_1000146C8(0);
}

void sub_100014D2C(uint64_t a1)
{
  _QWORD *v1;
  id *v2;
  id v3;
  int v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  int v14;
  NSObject *v15;
  id v16;
  nw_connection_t v17;
  uint64_t v18;
  uint64_t version_flags;
  void *v20;
  int v21;
  id v22;
  uint8_t buf[4];
  id v24;

  v2 = (id *)(a1 + 32);
  v1 = *(_QWORD **)(a1 + 32);
  if (v1[35])
  {
    v3 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", (char *)*v2 + 264);
    if (v3 && (objc_msgSend((id)qword_100057D80, "containsObject:", v3) & 1) != 0)
    {
      v4 = objc_msgSend(*v2, "type");
      v5 = objc_msgSend((id)objc_opt_class(*v2), "tlsOidsRequiredOfPeer");
      v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
      v7 = sub_100027B38(v4, v6);
      v8 = (void *)objc_claimAutoreleasedReturnValue(v7);

      v9 = objc_msgSend(*((id *)*v2 + 37), "index");
      v22 = 0;
      v10 = sub_1000136E8((uint64_t)v9, 2, &v22, v8);
      v11 = v22;
      if (v10)
      {
        if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
          sub_100035A9C();
        objc_msgSend(*v2, "disconnect");
      }
      else
      {
        v17 = nw_connection_create(*((nw_endpoint_t *)*v2 + 35), v11);
        v18 = qword_100057D70;
        version_flags = xpc_remote_connection_get_version_flags();
        v20 = (void *)xpc_remote_connection_create_with_nw_connection(v17, v18, version_flags, 2);
        objc_msgSend(*v2, "connect:", v20);

      }
    }
    else
    {
      v12 = qword_100057D60;
      if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEFAULT))
      {
        v13 = *v2;
        *(_DWORD *)buf = 138543362;
        v24 = v13;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%{public}@> device has already gone, disconnecting", buf, 0xCu);
      }
      objc_msgSend(*v2, "disconnect");
    }

  }
  else
  {
    v21 = -1;
    v14 = sub_10001D5D0(&v21, (__n128 *)objc_msgSend(v1, "remote_address"), 0xCAF6u, (int)objc_msgSend(*((id *)*v2 + 37), "index"), (uint64_t)&xmmword_1000410A8);
    v15 = qword_100057D60;
    if (v14)
    {
      if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
        sub_100035A38();
      objc_msgSend(*v2, "connect:", 0);
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_INFO))
      {
        v16 = *v2;
        *(_DWORD *)buf = 138543362;
        v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "%{public}@> network_connect_in6() completed successfully", buf, 0xCu);
      }
      objc_msgSend(*v2, "pollConnect:onQueue:withLog:completion:");
    }
  }
}

void sub_10001505C(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  NSObject *v5;
  _BOOL8 v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t failsafe_version_flags;
  void *v12;
  int v13;
  uint64_t v14;

  if (a3)
  {
    if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
      sub_100035B00();
    objc_msgSend(*(id *)(a1 + 32), "connect:", 0);
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));

    v5 = qword_100057D60;
    v6 = os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      if (v6)
      {
        v7 = *(_QWORD *)(a1 + 32);
        v13 = 138543362;
        v14 = v7;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, but socket is not needed anymore, closing", (uint8_t *)&v13, 0xCu);
      }
      close(*(_DWORD *)(a1 + 40));
    }
    else
    {
      if (v6)
      {
        v8 = *(_QWORD *)(a1 + 32);
        v13 = 138543362;
        v14 = v8;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, socket is connected", (uint8_t *)&v13, 0xCu);
      }
      v9 = *(unsigned int *)(a1 + 40);
      v10 = qword_100057D70;
      failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v6);
      v12 = (void *)xpc_remote_connection_create_with_connected_fd(v9, v10, failsafe_version_flags, 0);
      objc_msgSend(*(id *)(a1 + 32), "connect:", v12);

    }
  }
}

id sub_100015418(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
    sub_100035C48();
  return objc_msgSend(*(id *)(a1 + 32), "disconnect");
}

void sub_100015474(uint64_t a1, void *a2, void *a3)
{
  NSObject *v5;
  NSObject *v6;
  char changes;
  NSObject *v8;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  const char *bonjour_service_name;
  NSObject *v16;
  id v17;
  id v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  NSObject *v29;
  RSDRemoteComputeControllerDevice *v30;
  uint64_t v31;
  uuid_t uu;
  uint8_t buf[4];
  _BYTE v34[18];

  v5 = a2;
  v6 = a3;
  changes = nw_browse_result_get_changes(v5, v6);
  v8 = qword_100057D60;
  if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v34 = v5;
    *(_WORD *)&v34[8] = 2112;
    *(_QWORD *)&v34[10] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "browse_results_changed: %@ -> %@", buf, 0x16u);
  }
  if ((changes & 2) != 0)
    v9 = v6;
  else
    v9 = v5;
  if ((changes & 6) != 0)
  {
    v10 = v9;
    if (!v10)
      sub_100035CA8(uu, buf);
    v11 = v10;

    v12 = nw_browse_result_copy_endpoint(v11);
    if (!v12)
      sub_100035688(uu, buf);
    v13 = v12;

    memset(uu, 170, sizeof(uu));
    v14 = v13;
    bonjour_service_name = nw_endpoint_get_bonjour_service_name(v14);
    if (!bonjour_service_name)
      sub_100035D10(&v31, buf);
    uuid_parse(bonjour_service_name, uu);

    v16 = qword_100057D60;
    if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)v34 = 16;
      *(_WORD *)&v34[4] = 2096;
      *(_QWORD *)&v34[6] = &xmmword_100057FE8;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "browser local_device_uuid: %{uuid_t}.16P", buf, 0x12u);
    }
    if (uuid_is_null(uu))
      sub_100035DE4(&v31, buf);
    v17 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDBytes:", uu);
    if ((changes & 2) != 0)
    {
      if (objc_msgSend((id)qword_100057D80, "containsObject:", v17))
      {
        v20 = qword_100057D60;
        if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_FAULT))
          sub_100035DB4(v20, v21, v22, v23, v24, v25, v26, v27);
      }
      else
      {
        objc_msgSend((id)qword_100057D80, "addObject:", v17);
      }
      v28 = sub_100015788(uu);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v28);
      if (v19)
      {
        v29 = qword_100057D60;
        if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEBUG))
          sub_100035D78(v29);
      }
      else
      {
        v30 = -[RSDRemoteComputeControllerDevice initWithInterface:endpoint:bonjourUUID:]([RSDRemoteComputeControllerDevice alloc], "initWithInterface:endpoint:bonjourUUID:", *(_QWORD *)(a1 + 32), v14, uu);
        -[RSDRemoteDevice setTlsEnabled:](v30, "setTlsEnabled:", 1);
        -[RSDRemoteComputeControllerDevice attach](v30, "attach");

      }
    }
    else
    {
      if ((changes & 4) == 0)
      {
LABEL_28:

        goto LABEL_29;
      }
      v18 = sub_100015788(uu);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      objc_msgSend((id)qword_100057D80, "removeObject:", v17);
      if (v19)
      {
        if (objc_msgSend(v19, "state") == 3)
          objc_msgSend(v19, "heartbeatWithCallback:", &stru_100051640);
        else
          objc_msgSend(v19, "disconnect");
      }
    }

    goto LABEL_28;
  }
LABEL_29:

}

id sub_100015788(const unsigned __int8 *a1)
{
  NSObject *v2;
  id v3;
  id v4;
  __int128 v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *i;
  void *v11;
  void *v12;
  NSObject *v13;
  const unsigned __int8 *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t v24[128];
  uint8_t buf[4];
  int v26;
  __int16 v27;
  const unsigned __int8 *v28;

  v2 = qword_100057D60;
  if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68157954;
    v26 = 16;
    v27 = 2096;
    v28 = a1;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "checking for existing device %{uuid_t}.16P", buf, 0x12u);
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = (id)qword_100057D78;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v4)
  {
    v6 = v4;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v21;
    *(_QWORD *)&v5 = 68157954;
    v19 = v5;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v12 = (void *)qword_100057D60;
        if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEFAULT))
        {
          v13 = v12;
          v14 = (const unsigned __int8 *)objc_msgSend(v11, "bonjourUUID");
          *(_DWORD *)buf = v19;
          v26 = 16;
          v27 = 2096;
          v28 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "comparing against device uuid %{uuid_t}.16P", buf, 0x12u);

        }
        if (!uuid_compare((const unsigned __int8 *)objc_msgSend(v11, "bonjourUUID", v19, (_QWORD)v20), a1))
        {
          v15 = v11;

          ++v8;
          v7 = v15;
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);

    if (v7 && v8 >= 2)
      sub_100035E4C(v16, v17);
  }
  else
  {

    v7 = 0;
  }
  return v7;
}

void sub_1000159A4(id a1, BOOL a2)
{
  NSObject *v3;

  v3 = qword_100057D60;
  if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEBUG))
    sub_100035E64(a2, v3);
}

void sub_1000159E8(id a1, int a2, OS_nw_error *a3)
{
  OS_nw_error *v4;
  uint64_t v5;
  const char *v6;
  NSObject *v7;
  uint32_t v8;
  uint64_t v9;
  int v10;
  OS_nw_error *v11;

  v4 = a3;
  switch(a2)
  {
    case 4:
      v9 = qword_100057D60;
      if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEFAULT))
      {
        v10 = 138412290;
        v11 = v4;
        v6 = "nw_browser_state_waiting: %@";
        v7 = v9;
        v8 = 12;
        goto LABEL_8;
      }
      break;
    case 2:
      if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_FAULT))
        sub_100035FAC();
      break;
    case 1:
      v5 = qword_100057D60;
      if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v10) = 0;
        v6 = "browsing for other bonjour remoted instances";
        v7 = v5;
        v8 = 2;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v6, (uint8_t *)&v10, v8);
      }
      break;
    default:
      if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
      {
        sub_100035F4C();
        if (!v4)
          break;
      }
      else if (!v4)
      {
        break;
      }
      if (os_log_type_enabled((os_log_t)qword_100057D60, OS_LOG_TYPE_ERROR))
        sub_100035EEC();
      break;
  }

}

void sub_100015B70(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 8u);
}

BOOL sub_100015BA4()
{
  _BOOL8 v0;
  const char *v1;
  NSObject *v2;
  NSObject *v3;
  const char *v4;
  void *v6;
  int v7;
  uint8_t buf[4];
  const char *v9;
  __int16 v10;
  const char *v11;

  v6 = 0;
  sub_100017AF4((void *)qword_100057D88, CFSTR("rsd_compute_node_tls_chmf_required"), CFSTR("compute-node-tls-chmf-required"), (unsigned __int8 **)&v6);
  if (v6)
  {
    v0 = *(unsigned __int8 *)v6 != 0;
    v1 = (const char *)&unk_10004A612;
  }
  else
  {
    v7 = 0;
    if ((sub_10001CEA8("IODeviceTree:/product", (uint64_t)"fdr-sealed-chassis", &v7) & 1) != 0)
    {
      v0 = v7 != 0;
      if (v7)
        v1 = " by default per EDT";
      else
        v1 = " by default";
    }
    else
    {
      v2 = qword_100057D88;
      if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v9 = "IODeviceTree:/product";
        v10 = 2080;
        v11 = "fdr-sealed-chassis";
        _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Failed to read '%s/%s' from EDT. Assuming chassis not sealed.", buf, 0x16u);
      }
      v0 = 0;
      v1 = " by default";
    }
  }
  v3 = qword_100057D88;
  if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEFAULT))
  {
    v4 = (const char *)&unk_10004A612;
    if (!v0)
      v4 = "not ";
    *(_DWORD *)buf = 136315394;
    v9 = v4;
    v10 = 2080;
    v11 = v1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Chassis manifest is %srequired for TLS on compute node%s", buf, 0x16u);
  }
  free(v6);
  return v0;
}

void sub_100015D60(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, void *a9)
{
  free(a9);
  _Unwind_Resume(a1);
}

uint64_t sub_100015D74(uint64_t a1)
{
  return sub_100015D7C(a1, 1);
}

uint64_t sub_100015D7C(uint64_t a1, int a2)
{
  void *v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  RSDNetworkInterface *v9;
  id v10;
  void *v11;
  RSDListener *v12;
  RSDListener *v13;
  void *v14;
  void *v15;
  RSDNetworkInterface *v16;
  void *v17;
  id v18;
  void *v19;
  const unsigned __int8 *uuid;
  void *v21;
  RSDNetworkInterface *v22;
  void *v23;
  NSObject *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v36;
  _QWORD v37[4];
  RSDNetworkInterface *v38;
  _QWORD v39[4];
  RSDNetworkInterface *v40;
  id v41;
  uint64_t v42;
  uuid_string_t out;
  uuid_t dst;
  uint8_t buf[80];

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a1, 4));
  if (qword_100057D90)
  {
    v5 = qword_100057D88;
    if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_ERROR))
      sub_100036394(a1, v5, v6);
    v7 = 17;
    goto LABEL_26;
  }
  *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
  *(_QWORD *)&v8 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v8 + 1) = 0xAAAAAAAAAAAAAAAALL;
  *(_OWORD *)out = v8;
  *(_OWORD *)&out[16] = v8;
  v41 = 0;
  v9 = -[RSDNetworkInterface initWithName:error:]([RSDNetworkInterface alloc], "initWithName:error:", a1, &v41);
  v10 = v41;
  v11 = v10;
  if (v9)
  {
    v36 = v10;
    v12 = [RSDListener alloc];
    v13 = -[RSDListener initWithInterface:targetQueue:](v12, "initWithInterface:targetQueue:", v9, qword_100057DA8);
    v14 = (void *)qword_100057D90;
    qword_100057D90 = (uint64_t)v13;

    v15 = (void *)qword_100057D90;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100016B6C;
    v39[3] = &unk_100051600;
    v16 = v9;
    v40 = v16;
    objc_msgSend(v15, "listenOnPort:connectionHandler:", 51958, v39);
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[RSDRemoteComputeNodeDevice tlsOidsRequiredOfPeer](RSDRemoteComputeNodeDevice, "tlsOidsRequiredOfPeer"));
    v18 = sub_100027B38(15, v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue(v18);

    if (uuid_is_null((const unsigned __int8 *)&xmmword_100057FE8))
      sub_10003632C(dst, buf);
    if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEBUG))
      sub_1000362BC();
    uuid = xpc_dictionary_get_uuid((xpc_object_t)qword_100057FF8, "BootSessionUUID");
    if (!uuid)
      sub_100036118(dst, buf);
    memset(dst, 170, sizeof(dst));
    uuid_copy(dst, uuid);
    if (uuid_is_null(dst))
      sub_100036254(&v42, buf);
    if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEBUG))
      sub_1000361F0();
    xmmword_100057FE8 = (__int128)veorq_s8((int8x16_t)xmmword_100057FE8, *(int8x16_t *)dst);
    if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEBUG))
      sub_100036180();
    uuid_unparse((const unsigned __int8 *)&xmmword_100057FE8, out);
    v21 = (void *)qword_100057D90;
    v37[0] = _NSConcreteStackBlock;
    v37[1] = 3221225472;
    v37[2] = sub_100016D1C;
    v37[3] = &unk_100051030;
    v22 = v16;
    v38 = v22;
    objc_msgSend(v21, "listenOnBonjourName:type:domain:configureTLS:connectionHandler:", out, "_remoted_compute._tcp", "local.", v19, v37);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a1, 4));
    v24 = qword_100057D88;
    if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      *(_QWORD *)&buf[4] = a1;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "compute node listening on %{public}s", buf, 0xCu);
    }

LABEL_18:
    v25 = os_transaction_create("compute_node");
    v26 = (void *)qword_100057DA0;
    qword_100057DA0 = v25;

    if (a2)
      sub_100016314();
    v7 = 0;
    goto LABEL_26;
  }
  v27 = (void *)qword_100057D88;
  if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_ERROR))
    sub_10003607C(v27, v11);
  v7 = (uint64_t)objc_msgSend(v11, "code");

  if (!(_DWORD)v7)
    goto LABEL_18;
  v28 = qword_100057D88;
  if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_ERROR))
    sub_100036018(v7, v28, v29, v30, v31, v32, v33, v34);
LABEL_26:

  return v7;
}

uint64_t sub_1000161A0(uint64_t a1)
{
  return sub_100015D7C(a1, 0);
}

uint64_t sub_1000161A8(uint64_t a1)
{
  void *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v9[4];
  int v10;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithCString:encoding:](NSString, "stringWithCString:encoding:", a1, 4));
  if (qword_100057D90)
  {
    objc_msgSend((id)qword_100057D90, "cancel");
    v3 = (void *)qword_100057D90;
    qword_100057D90 = 0;

    if (objc_msgSend((id)qword_100057D98, "state") == 2)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_1000162BC;
      v9[3] = &unk_1000516C8;
      v10 = -1;
      objc_msgSend((id)qword_100057D98, "goodByeWithCallback:", v9);
    }
    else
    {
      objc_msgSend((id)qword_100057D98, "disconnect");
    }
    v7 = (void *)qword_100057DA0;
    qword_100057DA0 = 0;

    sub_100016314();
    v6 = 0;
  }
  else
  {
    v4 = qword_100057D88;
    if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_ERROR))
      sub_1000363FC(a1, v4, v5);
    v6 = 2;
  }

  return v6;
}

id sub_1000162BC(uint64_t a1, uint64_t a2)
{
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  if (*(_DWORD *)(a1 + 32))
  {
    v3 = qword_100057D88;
    if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_ERROR))
      sub_100036464(a2, v3, v4, v5, v6, v7, v8, v9);
  }
  return objc_msgSend((id)qword_100057D98, "disconnect");
}

void sub_100016314()
{
  void *v0;
  xpc_object_t v1;
  xpc_object_t xdict;

  xdict = xpc_dictionary_create_empty();
  v0 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057D90, "interface"));
  v1 = xpc_string_create((const char *)objc_msgSend(v0, "name"));

  xpc_dictionary_set_value(xdict, "interface", v1);
  xpc_set_event("com.apple.remoted.compute-platform", "listen", xdict);

}

void sub_100016394(void *a1)
{
  id v2;
  os_log_t v3;
  void *v4;
  int v5;
  NSObject *v6;
  _BOOL4 v7;
  NSObject *v8;
  int v9;
  uint64_t description;

  v2 = a1;
  if (!qword_100057DA8)
  {
    v3 = os_log_create("com.apple.RemoteServiceDiscovery", "compute_node");
    v4 = (void *)qword_100057D88;
    qword_100057D88 = (uint64_t)v3;

    v5 = sub_100026FB0();
    v6 = qword_100057D88;
    v7 = os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEFAULT);
    if (v5 == 16)
    {
      if (v7)
      {
        v8 = v6;
        v9 = 136446210;
        description = remote_device_type_get_description(16);
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "initializing compute platform with type %{public}s", (uint8_t *)&v9, 0xCu);

      }
      objc_storeStrong((id *)&qword_100057DA8, a1);
      sub_100019018(&off_100052F50, 0);
      sub_1000194F0(5, 10, 5, &stru_1000516E8);
    }
    else if (v7)
    {
      LOWORD(v9) = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "not enabling backend on this platform", (uint8_t *)&v9, 2u);
    }
  }

}

void sub_1000164FC(id a1, NSError *a2)
{
  if (!a2)
    sub_100019018(&off_100052F50, 0);
}

void sub_100016998(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t failsafe_version_flags;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  uint8_t buf[4];
  uint64_t v15;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 296);
  if (v3)
  {
    v4 = qword_100057DA8;
    failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(a1);
    v13 = (id)xpc_remote_connection_create_with_nw_connection(v3, v4, failsafe_version_flags, 1);
    v6 = *(_QWORD *)(a1 + 32);
    v7 = *(void **)(v6 + 296);
    *(_QWORD *)(v6 + 296) = 0;

LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "connect:", v13);

    return;
  }
  v8 = *(unsigned int *)(v2 + 288);
  if ((v8 & 0x80000000) == 0)
  {
    v9 = qword_100057DA8;
    v10 = xpc_remote_connection_get_failsafe_version_flags(a1);
    v13 = (id)xpc_remote_connection_create_with_connected_fd(v8, v9, v10, 1);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 288) = -1;
    goto LABEL_5;
  }
  v11 = qword_100057D88;
  if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEFAULT))
  {
    v12 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138543362;
    v15 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@> wait for the other side to connect", buf, 0xCu);
  }
}

uint64_t sub_100016B6C(uint64_t a1, int a2)
{
  uint64_t result;
  NSObject *v5;
  NSObject *v6;
  RSDRemoteComputeNodeDevice *v7;
  RSDRemoteComputeNodeDevice *v8;
  void *v9;
  NSObject *v10;
  uint8_t v11;
  _BYTE v12[15];
  uint8_t buf[12];
  socklen_t v14;
  sockaddr v15;
  uint64_t v16;
  int v17;
  unsigned int v18;

  v17 = 0;
  v18 = -1431655766;
  *(_QWORD *)&v15.sa_len = 0;
  *(_QWORD *)&v15.sa_data[6] = 0;
  v16 = 0;
  v14 = 28;
  for (result = sub_10001E334(a2, &v15, &v14, (unsigned __int8 *)&xmmword_1000410A8, (int *)&v18);
        !(_DWORD)result;
        result = sub_10001E334(a2, &v15, &v14, (unsigned __int8 *)&xmmword_1000410A8, (int *)&v18))
  {
    v5 = qword_100057D88;
    if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Got incoming remoted connection from port", buf, 2u);
    }
    if (qword_100057D98)
    {
      v6 = qword_100057D88;
      if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "replacing the remoted connection", buf, 2u);
      }
      objc_msgSend((id)qword_100057D98, "replacePeerSocket:", v18);
    }
    else
    {
      v7 = [RSDRemoteComputeNodeDevice alloc];
      v8 = -[RSDRemoteComputeNodeDevice initWithInterface:peerSocket:](v7, "initWithInterface:peerSocket:", *(_QWORD *)(a1 + 32), v18);
      v9 = (void *)qword_100057D98;
      qword_100057D98 = (uint64_t)v8;

      if (qword_100057D98)
      {
        objc_msgSend((id)qword_100057D98, "attach");
      }
      else
      {
        v10 = qword_100057D88;
        if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_ERROR))
          sub_10003652C(&v11, v12, v10);
      }
    }
  }
  return result;
}

void sub_100016D1C(uint64_t a1, void *a2)
{
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  const sockaddr *address;
  NSObject *v8;
  NSObject *v9;
  RSDRemoteComputeNodeDevice *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  _QWORD v17[10];

  v3 = a2;
  v4 = qword_100057D88;
  if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v17[0] = qword_100057D90;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ got incoming remoted bonjour connection", buf, 0xCu);
  }
  v5 = nw_connection_copy_current_path(v3);
  v6 = nw_path_copy_effective_remote_endpoint(v5);
  if (nw_endpoint_get_type(v6) != nw_endpoint_type_address)
    sub_100036594(&v15, buf);
  address = nw_endpoint_get_address(v6);
  v8 = qword_100057D88;
  if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68157954;
    LODWORD(v17[0]) = 16;
    WORD2(v17[0]) = 2096;
    *(_QWORD *)((char *)v17 + 6) = &address->sa_data[6];
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "remote address: %{network:in6_addr}.16P", buf, 0x12u);
  }
  if (qword_100057D98)
  {
    v9 = qword_100057D88;
    if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "replacing the remoted connection", buf, 2u);
    }
    objc_msgSend((id)qword_100057D98, "replacePeerConnection:", v3);
  }
  else
  {
    v10 = -[RSDRemoteComputeNodeDevice initWithInterface:peerConnection:endpoint:]([RSDRemoteComputeNodeDevice alloc], "initWithInterface:peerConnection:endpoint:", *(_QWORD *)(a1 + 32), v3, v6);
    v11 = (void *)qword_100057D98;
    qword_100057D98 = (uint64_t)v10;

    objc_msgSend((id)qword_100057D98, "setTlsEnabled:", 1);
    if (qword_100057D98)
    {
      objc_msgSend((id)qword_100057D98, "attach");
    }
    else
    {
      v12 = qword_100057D88;
      if (os_log_type_enabled((os_log_t)qword_100057D88, OS_LOG_TYPE_ERROR))
        sub_100036560(v12, v13, v14);
    }
  }

}

void sub_100016F54(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0x12u);
}

void sub_100016F64(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, a5, 2u);
}

char *sub_100016F70(_xpc_connection_s *a1)
{
  pid_t pid;
  char *v3;

  v3 = 0;
  pid = xpc_connection_get_pid(a1);
  asprintf(&v3, "pid/%d", pid);
  return v3;
}

void sub_100016FA8(void *a1)
{
  id v2;
  os_log_t v3;
  void *v4;
  xpc_connection_t mach_service;
  void *v6;
  id v7;

  v2 = a1;
  if (!qword_100057DB0)
  {
    v7 = v2;
    v3 = os_log_create("com.apple.RemoteServiceDiscovery", "ComputeInterface");
    v4 = (void *)qword_100057DB8;
    qword_100057DB8 = (uint64_t)v3;

    objc_storeStrong((id *)&qword_100057DB0, a1);
    mach_service = xpc_connection_create_mach_service("com.apple.remoted.compute-platform", (dispatch_queue_t)qword_100057DB0, 1uLL);
    v6 = (void *)qword_100057DC0;
    qword_100057DC0 = (uint64_t)mach_service;

    xpc_connection_set_event_handler((xpc_connection_t)qword_100057DC0, &stru_100051708);
    xpc_connection_activate((xpc_connection_t)qword_100057DC0);
    v2 = v7;
  }

}

void sub_100017058(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  OS_xpc_object *v3;
  _QWORD handler[4];
  OS_xpc_object *v5;

  v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000170F8;
    handler[3] = &unk_100050F08;
    v3 = v2;
    v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_100057DB0);
    xpc_connection_activate(v3);

  }
}

void sub_1000170F8(uint64_t a1, void *a2)
{
  id v3;
  __int128 v4;
  void *v5;
  _xpc_connection_s *v6;
  id v7;
  const char *string;
  const char *v9;
  id v10;
  uint64_t v11;
  id v12;
  xpc_object_t reply;
  id v14;
  const char *v15;
  uint64_t v16;
  int v17;
  int v18;
  void *v19;
  int v20;
  const char *v21;
  const char *v22;
  int v23;
  int v24;
  const char *v25;
  uint64_t v26;
  int v27;
  NSObject *v28;
  int v29;
  id v30;
  const char *v31;
  int v32;
  id v33;
  id v34;
  int v35;
  id v36;
  uint64_t v37;
  id v38;
  void *v39;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v41;
  id v42;
  int *v43;
  NSObject *v44;
  id v45;
  id v46;
  _OWORD v47[2];
  uint64_t v48;
  _QWORD v49[2];
  uint8_t buf[88];

  v3 = a2;
  *(_QWORD *)&v4 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v4 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v47[0] = v4;
  v47[1] = v4;
  xpc_connection_get_audit_token(*(_QWORD *)(a1 + 32), v47);
  v5 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.compute-platform", v47);

  if (v5)
  {
    v6 = (_xpc_connection_s *)*(id *)(a1 + 32);
    v7 = v3;
    if (xpc_get_type(v7) != (xpc_type_t)&_xpc_type_error)
    {
      if ((xpc_dictionary_expects_reply(v7) & 1) != 0)
      {
        string = xpc_dictionary_get_string(v7, "cmd");
        if (!string)
        {
          if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
            sub_100036628();
          v12 = sub_10001ECE8(v7);
          v11 = objc_claimAutoreleasedReturnValue(v12);
          goto LABEL_25;
        }
        v9 = string;
        if (!strcmp(string, "add_device"))
        {
          v14 = v7;
          v49[0] = 0;
          v49[1] = 0;
          v15 = xpc_dictionary_get_string(v14, "interface_name");
          if (v15)
          {
            v16 = (uint64_t)v15;
            v17 = sub_10001E284(v15);
            if (v17)
            {
              v18 = v17;
              if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
                sub_1000366AC();
              v19 = v14;
              v20 = v18;
              goto LABEL_64;
            }
            v31 = xpc_dictionary_get_string(v14, "address");
            if (v31)
            {
              v32 = inet_pton(30, v31, v49);
              if (v32 == -1)
              {
                v43 = __error();
                v44 = qword_100057DB8;
                if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
                  sub_100030978(v43, v44);
              }
              else
              {
                if (v32 == 1)
                {
                  sub_100013CC0(v16, v49);
                  goto LABEL_76;
                }
                if (v32)
                  sub_1000308A0(&v48, buf);
                if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
                  sub_10003094C();
              }
              v45 = sub_10001ECE8(v14);
              v37 = objc_claimAutoreleasedReturnValue(v45);
              goto LABEL_65;
            }
            if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
              sub_100036680();
          }
          else if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
          {
LABEL_55:
            sub_100036654();
          }
        }
        else if (!strcmp(v9, "remove_device"))
        {
          v14 = v7;
          v21 = xpc_dictionary_get_string(v14, "interface_name");
          if (v21)
          {
            v22 = v21;
            v23 = sub_10001E284(v21);
            if (v23)
            {
              v24 = v23;
              if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
                sub_1000366AC();
              v19 = v14;
              v20 = v24;
              goto LABEL_64;
            }
            sub_100013884(v22);
            goto LABEL_76;
          }
          if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
            goto LABEL_55;
        }
        else
        {
          if (strcmp(v9, "browse"))
          {
            if (!strcmp(v9, "browse_cancel"))
            {
              v30 = sub_1000176E0(v7);
              v11 = objc_claimAutoreleasedReturnValue(v30);
            }
            else if (!strcmp(v9, "listen"))
            {
              v33 = sub_100017780(v7);
              v11 = objc_claimAutoreleasedReturnValue(v33);
            }
            else if (!strcmp(v9, "listen_cancel"))
            {
              v34 = sub_100017874(v7);
              v11 = objc_claimAutoreleasedReturnValue(v34);
            }
            else if (!strcmp(v9, "require_tls"))
            {
              v42 = sub_100017914(v7);
              v11 = objc_claimAutoreleasedReturnValue(v42);
            }
            else if (!strcmp(v9, "is_tls_required_cmd"))
            {
              v46 = sub_1000179EC(v7);
              v11 = objc_claimAutoreleasedReturnValue(v46);
            }
            else
            {
              if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
                sub_1000366D8();
              v10 = sub_10001ECF4(v7, 22);
              v11 = objc_claimAutoreleasedReturnValue(v10);
            }
LABEL_25:
            reply = (xpc_object_t)v11;
LABEL_67:
            v38 = reply;
            if (!v38)
              sub_1000307CC(v49, buf);
            v39 = v38;

            remote_connection = xpc_dictionary_get_remote_connection(v39);
            v41 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
            xpc_connection_send_message(v41, v39);

            goto LABEL_69;
          }
          v14 = v7;
          v25 = xpc_dictionary_get_string(v14, "interface_name");
          if (v25)
          {
            v26 = (uint64_t)v25;
            v27 = sub_10001E284(v25);
            v28 = qword_100057DB8;
            if (v27)
            {
              v29 = v27;
              if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
                sub_1000366AC();
              v19 = v14;
              v20 = v29;
              goto LABEL_64;
            }
            if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = v26;
              _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Client request browsing on %{public}s", buf, 0xCu);
            }
            v35 = sub_100013F14(v26);
            if (v35)
            {
              v20 = v35;
              v19 = v14;
LABEL_64:
              v36 = sub_10001ECF4(v19, v20);
              v37 = objc_claimAutoreleasedReturnValue(v36);
LABEL_65:
              reply = (xpc_object_t)v37;
LABEL_66:

              goto LABEL_67;
            }
LABEL_76:
            reply = xpc_dictionary_create_reply(v14);
            xpc_dictionary_set_string(reply, "result", "OK");
            goto LABEL_66;
          }
          if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
            goto LABEL_55;
        }
        v19 = v14;
        v20 = 22;
        goto LABEL_64;
      }
      if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
        sub_100030DD0();
    }
    xpc_connection_cancel(v6);
LABEL_69:

    goto LABEL_70;
  }
  if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
    sub_1000365FC();
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
LABEL_70:

}

id sub_1000176E0(void *a1)
{
  id v1;
  const char *string;
  xpc_object_t reply;
  id v4;

  v1 = a1;
  string = xpc_dictionary_get_string(v1, "interface_name");
  if (string)
  {
    sub_1000142D0(string);
    reply = xpc_dictionary_create_reply(v1);

    xpc_dictionary_set_string(reply, "result", "OK");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
      sub_100036654();
    v4 = sub_10001ECF4(v1, 22);
    reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v4);

  }
  return reply;
}

id sub_100017780(void *a1)
{
  id v1;
  const char *string;
  uint64_t v3;
  int v4;
  int v5;
  void *v6;
  int v7;
  int v8;
  id v9;
  xpc_object_t reply;

  v1 = a1;
  string = xpc_dictionary_get_string(v1, "interface_name");
  if (string)
  {
    v3 = (uint64_t)string;
    v4 = sub_10001E284(string);
    if (v4)
    {
      v5 = v4;
      if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
        sub_1000366AC();
      v6 = v1;
      v7 = v5;
    }
    else
    {
      v8 = sub_100015D74(v3);
      if (!v8)
      {
        reply = xpc_dictionary_create_reply(v1);
        xpc_dictionary_set_string(reply, "result", "OK");
        goto LABEL_12;
      }
      v7 = v8;
      v6 = v1;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
      sub_100036654();
    v6 = v1;
    v7 = 22;
  }
  v9 = sub_10001ECF4(v6, v7);
  reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v9);
LABEL_12:

  return reply;
}

id sub_100017874(void *a1)
{
  id v1;
  const char *string;
  xpc_object_t reply;
  id v4;

  v1 = a1;
  string = xpc_dictionary_get_string(v1, "interface_name");
  if (string)
  {
    sub_1000161A8((uint64_t)string);
    reply = xpc_dictionary_create_reply(v1);

    xpc_dictionary_set_string(reply, "result", "OK");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
      sub_100036654();
    v4 = sub_10001ECF4(v1, 22);
    reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v4);

  }
  return reply;
}

id sub_100017914(void *a1)
{
  id v1;
  xpc_object_t value;
  void *v3;
  void *v4;
  id v5;
  xpc_object_t reply;
  uint64_t v7;

  v1 = a1;
  value = xpc_dictionary_get_value(v1, "is_tls_required");
  v3 = (void *)objc_claimAutoreleasedReturnValue(value);
  v4 = v3;
  if (v3 && xpc_get_type(v3) == (xpc_type_t)&_xpc_type_BOOL)
  {
    if (xpc_BOOL_get_value(v4))
      v7 = 3;
    else
      v7 = 2;
    sub_100027170(v7);
    reply = xpc_dictionary_create_reply(v1);
    xpc_dictionary_set_string(reply, "result", "OK");
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057DB8, OS_LOG_TYPE_ERROR))
      sub_100036704();
    v5 = sub_10001ECF4(v1, 22);
    reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v5);
  }

  return reply;
}

id sub_1000179EC(void *a1)
{
  id v1;
  uint64_t v2;
  xpc_object_t reply;

  v1 = a1;
  v2 = -[RSDRemoteComputeControllerDevice tlsRequirement]_0();
  reply = xpc_dictionary_create_reply(v1);

  xpc_dictionary_set_string(reply, "result", "OK");
  xpc_dictionary_set_BOOL(reply, "is_tls_required", v2 == 3);
  return reply;
}

const char *sub_100017A60(uint64_t a1)
{
  if ((unint64_t)(a1 - 1) > 2)
    return "invalid";
  else
    return off_100051840[a1 - 1];
}

uint64_t sub_100017A88(const char *a1)
{
  if (!strcmp(a1, "disabled"))
    return 1;
  if (!strcmp(a1, "optional"))
    return 2;
  if (!strcmp(a1, "required"))
    return 3;
  return 0;
}

void sub_100017AF4(void *a1, void *a2, void *a3, unsigned __int8 **a4)
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  unsigned __int8 *v11;
  unsigned __int8 v12;
  char *v13;
  unsigned __int8 *v14;
  unsigned __int8 *v15;
  id v16;
  uint64_t v17;
  int *v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  uint64_t v23;
  int *v24;
  char *v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  int *v30;
  char *v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  int v36;
  const char *v37;
  __int16 v38;
  uint64_t v39;
  __int16 v40;
  char *v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;

  v34 = a1;
  v7 = a2;
  v8 = a3;
  *a4 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057FD8, "valueForKey:", v8));
  if (v9)
  {
    v10 = objc_opt_class(NSNumber);
    if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
    {
      v11 = (unsigned __int8 *)malloc_type_calloc(1uLL, 1uLL, 0x61D5536CuLL);
      if (!v11)
      {
        v35 = 0;
        v45 = 0u;
        v46 = 0u;
        v43 = 0u;
        v44 = 0u;
        v42 = 0u;
        v28 = &_os_log_default;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          v29 = 3;
        else
          v29 = 2;
        v30 = __error();
        v31 = strerror(*v30);
        v36 = 136315650;
        v37 = "known-constant allocation";
        v38 = 2048;
        v39 = 1;
        v40 = 2080;
        v41 = v31;
        v32 = _os_log_send_and_compose_impl(v29, &v35, &v42, 80, &_mh_execute_header, &_os_log_default, 16);

        v33 = _os_crash_msg(v35, v32);
        sub_100033D14(v33);
      }
      *a4 = v11;
      v12 = objc_msgSend(v9, "BOOLValue");
      v13 = 0;
      v14 = *a4;
LABEL_9:
      *v14 = v12;
      goto LABEL_10;
    }
  }
  v13 = (char *)malloc_type_calloc(0xBuLL, 1uLL, 0x61D5536CuLL);
  if (!v13)
  {
    v35 = 0;
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v42 = 0u;
    v16 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v17 = 3;
    else
      v17 = 2;
    v18 = __error();
    v19 = strerror(*v18);
    v36 = 136315650;
    v37 = "known-constant allocation";
    v38 = 2048;
    v39 = 1;
    v40 = 2080;
    v41 = v19;
    v20 = _os_log_send_and_compose_impl(v17, &v35, &v42, 80, &_mh_execute_header, &_os_log_default, 16);

    v21 = _os_crash_msg(v35, v20);
    sub_100033D14(v21);
  }
  if (os_parse_boot_arg_string(objc_msgSend(objc_retainAutorelease(v7), "UTF8String"), v13, 10))
  {
    v15 = (unsigned __int8 *)malloc_type_calloc(1uLL, 1uLL, 0x61D5536CuLL);
    v14 = v15;
    if (!v15)
    {
      v35 = 0;
      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v42 = 0u;
      v22 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v23 = 3;
      else
        v23 = 2;
      v24 = __error();
      v25 = strerror(*v24);
      v36 = 136315650;
      v37 = "known-constant allocation";
      v38 = 2048;
      v39 = 1;
      v40 = 2080;
      v41 = v25;
      v26 = _os_log_send_and_compose_impl(v23, &v35, &v42, 80, &_mh_execute_header, &_os_log_default, 16);

      v27 = _os_crash_msg(v35, v26);
      sub_100033D14(v27);
    }
    *a4 = v15;
    v12 = strcmp(v13, "1") == 0;
    goto LABEL_9;
  }
LABEL_10:
  free(v13);

}

void sub_100017F08(_Unwind_Exception *exception_object)
{
  _Unwind_Resume(exception_object);
}

uint64_t sub_100017F38(void *a1, void *a2, void *a3)
{
  NSObject *v5;
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  char *v12;
  char *v13;
  id v14;
  uint64_t v15;
  char *v16;
  id v18;
  uint64_t v19;
  int *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  int v25;
  const char *v26;
  __int16 v27;
  uint64_t v28;
  __int16 v29;
  char *v30;
  _OWORD buf[5];

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057FD8, "valueForKey:", v7));
  if (v8)
  {
    v9 = objc_opt_class(NSString);
    if ((objc_opt_isKindOfClass(v8, v9) & 1) != 0)
    {
      v10 = sub_100017A88((const char *)objc_msgSend(objc_retainAutorelease(v8), "UTF8String"));
      if (v10)
      {
        v11 = v10;
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          v12 = off_100051840[v11 - 1];
          LODWORD(buf[0]) = 136446466;
          *(_QWORD *)((char *)buf + 4) = v12;
          WORD6(buf[0]) = 2114;
          *(_QWORD *)((char *)buf + 14) = v7;
          _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TLS is %{public}s per preference '%{public}@'", (uint8_t *)buf, 0x16u);
        }
        v13 = 0;
        goto LABEL_17;
      }
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
        sub_100036790();
    }
  }
  v13 = (char *)malloc_type_calloc(0xBuLL, 1uLL, 0x61D5536CuLL);
  if (!v13)
  {
    v24 = 0;
    memset(buf, 0, sizeof(buf));
    v18 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v19 = 3;
    else
      v19 = 2;
    v20 = __error();
    v21 = strerror(*v20);
    v25 = 136315650;
    v26 = "known-constant allocation";
    v27 = 2048;
    v28 = 1;
    v29 = 2080;
    v30 = v21;
    v22 = _os_log_send_and_compose_impl(v19, &v24, buf, 80, &_mh_execute_header, &_os_log_default, 16);

    v23 = _os_crash_msg(v24, v22);
    sub_100033D14(v23);
  }
  v14 = objc_retainAutorelease(v6);
  if (!os_parse_boot_arg_string(objc_msgSend(v14, "UTF8String"), v13, 10))
  {
LABEL_16:
    v11 = 0;
    goto LABEL_17;
  }
  v15 = sub_100017A88(v13);
  if (!v15)
  {
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100036730();
    goto LABEL_16;
  }
  v11 = v15;
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v16 = off_100051840[v11 - 1];
    LODWORD(buf[0]) = 136446466;
    *(_QWORD *)((char *)buf + 4) = v16;
    WORD6(buf[0]) = 2114;
    *(_QWORD *)((char *)buf + 14) = v14;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "TLS is %{public}s per boot arg '%{public}@'", (uint8_t *)buf, 0x16u);
  }
LABEL_17:
  free(v13);

  return v11;
}

void sub_100018268(_Unwind_Exception *a1)
{
  free(0);
  _Unwind_Resume(a1);
}

void sub_100018290()
{
  NSObject *v0;
  id v1;

  v0 = sub_1000182DC();
  v1 = (id)objc_claimAutoreleasedReturnValue(v0);
  sub_1000182BC(v1);

}

void sub_1000182BC(id obj)
{
  objc_storeStrong((id *)&qword_100057DD0, obj);
  sub_10000B178();
}

NSObject *sub_1000182DC()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  SecAccessControlRef v7;
  SecAccessControlRef v8;
  SecKeyRef v9;
  __SecKey *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  const void *v14;
  void *Attestation;
  id v16;
  SecKeyRef v17;
  const void *SelfSignedCertificate;
  __SecIdentity *v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  void *v26;
  sec_identity_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  void *v32;
  const __CFDictionary *parameters;
  id v34;
  void *v35;
  void *v36;
  id v37;
  uint8_t v38[8];
  id v39;
  CFErrorRef error;
  _QWORD v41[5];
  uint8_t buf[8];
  const __CFString *v43;
  CFStringRef v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  id v48;
  _QWORD v49[5];
  _QWORD v50[5];
  const __CFString *v51;
  CFBooleanRef v52;
  _QWORD v53[2];
  void *v54;
  _QWORD v55[2];
  void *v56;
  _QWORD v57[2];
  void *v58;
  _QWORD v59[3];

  sub_100018D34();
  error = 0;
  v57[0] = kSecOidCommonName;
  v57[1] = CFSTR("remoted-identity");
  v0 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v57, 2));
  v58 = v0;
  v1 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v58, 1));
  v59[0] = v1;
  v55[0] = kSecOidCountryName;
  v55[1] = CFSTR("US");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v55, 2));
  v56 = v2;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v56, 1));
  v59[1] = v3;
  v53[0] = kSecOidOrganization;
  v53[1] = CFSTR("Apple Inc");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v53, 2));
  v54 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v54, 1));
  v59[2] = v5;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v59, 3));

  v51 = CFSTR("GetCombined");
  v52 = kCFBooleanTrue;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v52, &v51, 1));
  v37 = objc_alloc_init((Class)NSMutableDictionary);
  v6 = kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate;
  v7 = SecAccessControlCreateWithFlags(0, kSecAttrAccessibleAlwaysThisDeviceOnlyPrivate, 0x40000000uLL, &error);
  v8 = v7;
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_10003681C();
    goto LABEL_16;
  }
  v49[0] = kSecAttrIsPermanent;
  v49[1] = kSecAttrTokenID;
  v50[0] = &__kCFBooleanFalse;
  v50[1] = kSecAttrTokenIDAppleKeyStore;
  v49[2] = kSecAttrKeyType;
  v49[3] = kSecAttrAccessControl;
  v50[2] = kSecAttrKeyTypeECSECPrimeRandom;
  v50[3] = v7;
  v49[4] = kSecAttrKeySizeInBits;
  v50[4] = &off_100052FF8;
  parameters = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v50, v49, 5));
  v9 = SecKeyCreateRandomKey(parameters, &error);
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_10003687C();

LABEL_16:
    v17 = 0;
    v10 = 0;
    SelfSignedCertificate = 0;
    v19 = 0;
    v20 = 0;
    v34 = 0;
    goto LABEL_49;
  }
  v10 = v9;
  v39 = 0;
  v11 = MAECopyDCRTWithOptions(0, &v39);
  v32 = (void *)objc_claimAutoreleasedReturnValue(v11);
  v34 = v39;
  if (!v32)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036A20();
    goto LABEL_29;
  }
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v32, CFSTR("1.2.840.113635.100.6.84"));
  v12 = qword_100057DC8;
  if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "New self identity contains DCRT chain data.", buf, 2u);
  }
  *(_QWORD *)buf = 0;
  v13 = SecKeyCopySystemKey(7, buf);
  v14 = (const void *)v13;
  if (v13)
  {
    Attestation = (void *)SecKeyCreateAttestation(v13, v10, buf);
    if (!Attestation && os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036B0C();
    v16 = Attestation;
    CFRelease(v14);
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036AAC();
    v16 = 0;
  }
  v30 = v16;

  if (*(_QWORD *)buf)
    CFRelease(*(CFTypeRef *)buf);
  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036A80();
LABEL_29:
    v30 = 0;
    goto LABEL_30;
  }
  objc_msgSend(v37, "setObject:forKeyedSubscript:", v16, CFSTR("1.2.840.113635.100.6.83"));
  v21 = qword_100057DC8;
  if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "New self identity contains DAK attestation.", buf, 2u);
  }
LABEL_30:
  v22 = (void *)AMFDRSealingMapCopyLocalDataForClass(CFSTR("ChMf"), v35, &error);
  if (v22)
  {
    objc_msgSend(v37, "setObject:forKeyedSubscript:", v22, CFSTR("1.2.840.113635.100.6.85"));
    v23 = qword_100057DC8;
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "New self identity contains FDR-sealed chassis manifest data.", buf, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
  {
    sub_1000369C0();
  }
  v17 = SecKeyCopyPublicKey(v10);
  v47 = kSecCertificateExtensionsEncoded;
  v24 = objc_msgSend(v37, "copy");
  v48 = v24;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v48, &v47, 1));

  SelfSignedCertificate = (const void *)SecGenerateSelfSignedCertificate(v36, v31, v17, v10);
  if (!SelfSignedCertificate)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_1000368DC();

    SelfSignedCertificate = 0;
    goto LABEL_47;
  }
  v25 = SecIdentityCreate(0, SelfSignedCertificate, v10);
  v19 = (__SecIdentity *)v25;
  if (!v25)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036908();

LABEL_47:
    v19 = 0;
    goto LABEL_48;
  }
  v41[0] = kSecAttrLabel;
  v41[1] = kSecAttrAccessGroup;
  *(_QWORD *)buf = CFSTR("com.apple.remoted.identity");
  v43 = CFSTR("com.apple.remoted");
  v41[2] = kSecClass;
  v41[3] = kSecValueRef;
  v44 = kSecClassIdentity;
  v45 = v25;
  v41[4] = kSecAttrAccessible;
  v46 = v6;
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", buf, v41, 5));
  if (SecItemAdd((CFDictionaryRef)v26, 0))
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036960();
LABEL_40:

LABEL_48:
    v20 = 0;
    goto LABEL_49;
  }
  v28 = sec_identity_create(v19);
  v29 = qword_100057DC8;
  if (!v28)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036934();
    goto LABEL_40;
  }
  if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v38 = 0;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_INFO, "Created new identity.", v38, 2u);
  }
  v20 = v28;

LABEL_49:
  if (v19)
    CFRelease(v19);
  if (SelfSignedCertificate)
    CFRelease(SelfSignedCertificate);
  if (v10)
    CFRelease(v10);
  if (v17)
    CFRelease(v17);
  if (v8)
    CFRelease(v8);
  if (error)
    CFRelease(error);

  if (!v20
    && (os_variant_is_recovery("com.apple.remoted") & 1) == 0
    && os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_FAULT))
  {
    sub_1000367F0();
  }
  return v20;
}

void sub_100018C48(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, CFTypeRef a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,CFTypeRef cf)
{
  const void *v25;
  const void *v26;

  if (cf)
    CFRelease(cf);
  CFRelease(v26);
  if (v25)
    CFRelease(v25);
  if (a19)
    CFRelease(a19);
  _Unwind_Resume(a1);
}

void sub_100018D1C()
{
  sub_100018D34();
  sub_1000182BC(0);
}

void sub_100018D34()
{
  const __CFDictionary *v0;
  OSStatus v1;
  NSObject *v3;
  uint8_t v5[8];
  _QWORD v6[3];
  _QWORD v7[3];

  v6[0] = kSecAttrLabel;
  v6[1] = kSecAttrAccessGroup;
  v7[0] = CFSTR("com.apple.remoted.identity");
  v7[1] = CFSTR("com.apple.remoted");
  v6[2] = kSecClass;
  v7[2] = kSecClassIdentity;
  v0 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 3));
  v1 = SecItemDelete(v0);
  if (v1 == -25300 || v1 == 0)
  {
    v3 = qword_100057DC8;
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Deleted identity.", v5, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
  {
    sub_100036B6C();
  }

}

uint64_t sub_100018E80()
{
  id v0;

  v0 = sub_100018EA0((void *)qword_100057DD0);
  return objc_claimAutoreleasedReturnValue(v0);
}

id sub_100018EA0(void *a1)
{
  NSObject *v1;
  xpc_object_t empty;
  __SecIdentity *v3;
  const char *v4;
  char **v5;
  const void *v6;
  const char *v7;
  id v8;
  SecCertificateRef certificateRef;

  v1 = a1;
  empty = xpc_array_create_empty();
  certificateRef = 0;
  if (v1)
  {
    v3 = sec_identity_copy_ref(v1);
    if (SecIdentityCopyCertificate(v3, &certificateRef))
    {
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
        sub_100036BCC();
    }
    else
    {
      v4 = "1.2.840.113635.100.6.83";
      v5 = off_100051828;
      do
      {
        v6 = (const void *)SecCertificateCopyExtensionValue(certificateRef, +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", v4), 0);
        if (v6)
        {
          xpc_array_set_string(empty, 0xFFFFFFFFFFFFFFFFLL, v4);
          CFRelease(v6);
        }
        v7 = *v5++;
        v4 = v7;
      }
      while (v7);
    }
  }
  else
  {
    v3 = 0;
  }
  v8 = empty;
  if (certificateRef)
    CFRelease(certificateRef);
  if (v3)
    CFRelease(v3);

  return v8;
}

void sub_100018FCC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  const void *v10;

  if (v10)
    CFRelease(v10);
  _Unwind_Resume(exception_object);
}

void sub_100019018(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a1;
  v4 = a2;
  v5 = qword_100057DD8;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000190BC;
  v8[3] = &unk_100051730;
  v9 = v3;
  v10 = v4;
  v6 = v4;
  v7 = v3;
  dispatch_async(v5, v8);

}

void sub_1000190BC(uint64_t a1)
{
  const __CFDictionary *v2;
  OSStatus v3;
  sec_identity_t v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD block[4];
  sec_identity_t v19;
  id v20;
  CFTypeRef result[4];
  id v22;
  _QWORD v23[16];
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;

  result[0] = 0;
  *(_QWORD *)&v24 = kSecAttrLabel;
  *((_QWORD *)&v24 + 1) = kSecAttrAccessGroup;
  v23[0] = CFSTR("com.apple.remoted.identity");
  v23[1] = CFSTR("com.apple.remoted");
  *(_QWORD *)&v25 = kSecClass;
  *((_QWORD *)&v25 + 1) = kSecReturnRef;
  v23[2] = kSecClassIdentity;
  v23[3] = &__kCFBooleanTrue;
  v2 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v23, &v24, 4));
  v3 = SecItemCopyMatching(v2, result);
  if (v3 != -25300 && v3)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036C2C();
    v4 = 0;
  }
  else
  {
    if (!result[0])
    {

LABEL_25:
      v15 = sub_1000182DC();
      v4 = (sec_identity_t)objc_claimAutoreleasedReturnValue(v15);
      goto LABEL_26;
    }
    v4 = sec_identity_create((SecIdentityRef)result[0]);
  }
  if (result[0])
    CFRelease(result[0]);

  if (!v4)
    goto LABEL_25;
  v5 = *(id *)(a1 + 32);
  if (v5)
    v6 = v5;
  else
    v6 = &__NSArray0__struct;
  v7 = sub_100018EA0(v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = objc_alloc_init((Class)NSMutableSet);
  result[0] = _NSConcreteStackBlock;
  result[1] = (CFTypeRef)3221225472;
  result[2] = sub_10001AB88;
  result[3] = &unk_100051080;
  v10 = v9;
  v22 = v10;
  xpc_array_apply(v8, result);
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v11);
        if (!objc_msgSend(v10, "containsObject:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i)))
        {

          goto LABEL_25;
        }
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v23, 16);
      if (v12)
        continue;
      break;
    }
  }

LABEL_26:
  v16 = qword_100057DE0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019404;
  block[3] = &unk_100051730;
  v19 = v4;
  v20 = *(id *)(a1 + 40);
  v17 = v4;
  dispatch_async(v16, block);

}

void sub_1000193DC(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

uint64_t sub_100019404(uint64_t a1)
{
  uint64_t result;

  sub_1000182BC(*(id *)(a1 + 32));
  result = *(_QWORD *)(a1 + 40);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void sub_100019440(void *a1)
{
  dispatch_queue_attr_t v2;
  NSObject *v3;
  dispatch_queue_t v4;
  void *v5;
  os_log_t v6;
  void *v7;
  id v8;

  v8 = a1;
  objc_storeStrong((id *)&qword_100057DE0, a1);
  v2 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = dispatch_queue_create("com.apple.remoted.identity", v3);
  v5 = (void *)qword_100057DD8;
  qword_100057DD8 = (uint64_t)v4;

  if (!qword_100057DC8)
  {
    v6 = os_log_create("com.apple.RemoteServiceDiscovery", "identity");
    v7 = (void *)qword_100057DC8;
    qword_100057DC8 = (uint64_t)v6;

  }
}

id sub_1000194E4()
{
  return (id)qword_100057DD0;
}

void sub_1000194F0(int a1, int a2, int a3, void *a4)
{
  id v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a4;
  v8 = (void *)qword_100057DE0;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000198A8;
  v10[3] = &unk_100051800;
  v11 = v7;
  v9 = v7;
  sub_10001CF88(v8, a1, a2, a3, &stru_100051770, &stru_1000517D8, 0, v10);

}

void sub_1000195A8(id a1, id a2)
{
  id v2;
  NSObject *v3;
  dispatch_queue_global_t global_queue;
  NSObject *v5;
  id v6;
  _QWORD block[4];
  id v8;
  uint8_t buf[16];

  v2 = a2;
  v3 = qword_100057DC8;
  if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "Attempting to issue DCRT", buf, 2u);
  }
  global_queue = dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue(global_queue);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100019678;
  block[3] = &unk_100051198;
  v8 = v2;
  v6 = v2;
  dispatch_async(v5, block);

}

void sub_100019678(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  _QWORD v6[2];
  _QWORD v7[2];

  v6[0] = kMAOptionsNetworkTimeoutInterval;
  v6[1] = kMAOptionsIgnoreExistingDCRT;
  v7[0] = &off_100052FB0;
  v7[1] = &__kCFBooleanFalse;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v7, v6, 2));
  v3 = qword_100057DE0;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001977C;
  v4[3] = &unk_100051798;
  v5 = *(id *)(a1 + 32);
  MAEIssueDCRTWithCompletion(v3, v2, v4);

}

void sub_10001977C(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
    sub_100036C8C();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

BOOL sub_1000197F8(id a1, NSError *a2)
{
  NSError *v2;
  unint64_t v3;
  uint64_t v4;
  void *v5;
  int HasDomainAndErrorCode;

  v2 = a2;
  if (objc_msgSend(&off_100052F68, "count"))
  {
    v3 = 0;
    v4 = MobileActivationErrorDomain;
    do
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(&off_100052F68, "objectAtIndexedSubscript:", v3));
      HasDomainAndErrorCode = mobileactivationErrorHasDomainAndErrorCode(v2, v4, objc_msgSend(v5, "longValue"));

      if (HasDomainAndErrorCode)
        break;
      ++v3;
    }
    while (v3 < (unint64_t)objc_msgSend(&off_100052F68, "count"));
  }
  else
  {
    LOBYTE(HasDomainAndErrorCode) = 0;
  }

  return HasDomainAndErrorCode;
}

void sub_1000198A8(uint64_t a1, int a2, void *a3)
{
  id v5;
  NSObject *v6;
  _DWORD v7[2];

  v5 = a3;
  v6 = qword_100057DC8;
  if (v5)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036CEC();
  }
  else if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_INFO))
  {
    v7[0] = 67109120;
    v7[1] = a2;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "Successfully issued DCRT after %d attempt(s)", (uint8_t *)v7, 8u);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t sub_100019990(void *a1, void *a2)
{
  id v3;
  id v4;
  int v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = a2;
  v4 = a1;
  v5 = objc_msgSend(v4, "type");
  v6 = (void *)objc_opt_class(v4);

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tlsOidsRequiredOfPeer"));
  v8 = sub_100019A0C(v5, v7, v3);

  return v8;
}

uint64_t sub_100019A0C(int a1, void *a2, void *a3)
{
  id v5;
  NSObject *v6;
  __SecTrust *v7;
  CFArrayRef v8;
  CFArrayRef v9;
  __SecCertificate *v10;
  uint64_t v11;

  v5 = a2;
  v6 = a3;
  v7 = sec_trust_copy_ref(v6);
  v8 = SecTrustCopyCertificateChain(v7);
  v9 = v8;
  if (v8)
  {
    v10 = (__SecCertificate *)objc_claimAutoreleasedReturnValue(-[__CFArray lastObject](v8, "lastObject"));
    if (v10)
    {
      v11 = sub_100019B2C(a1, v5, v10);
      CFRelease(v10);
      goto LABEL_9;
    }
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036D78();
  }
  else if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
  {
    sub_100036D4C();
  }
  v11 = 0;
LABEL_9:

  if (v7)
    CFRelease(v7);

  return v11;
}

void sub_100019AFC(_Unwind_Exception *a1)
{
  const void *v1;
  const void *v2;

  CFRelease(v2);
  if (v1)
    CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_100019B2C(int a1, void *a2, __SecCertificate *a3)
{
  id v5;
  __SecKey *v6;
  __SecKey *v7;
  CFDataRef v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  int v14;
  void *v15;
  id v16;
  void *v17;
  size_t v18;
  void *v19;
  uint64_t v20;
  id v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  id v26;
  uint64_t v27;
  int *v28;
  char *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  id v33;
  CFErrorRef error;
  uint64_t v35;
  _BYTE v36[12];
  __int16 v37;
  size_t v38;
  __int16 v39;
  char *v40;
  uint8_t buf[16];
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;

  v5 = a2;
  error = 0;
  v6 = SecCertificateCopyKey(a3);
  v7 = v6;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036DA4();
    goto LABEL_33;
  }
  v8 = SecKeyCopyExternalRepresentation(v6, &error);
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036DD0();
    goto LABEL_33;
  }
  v9 = (void *)SecCertificateCopyExtensionValue(a3, CFSTR("1.2.840.113635.100.6.84"), 0);
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036E30();

    goto LABEL_33;
  }
  v10 = v9;
  v42 = 0u;
  v43 = 0u;
  *(_OWORD *)buf = 0u;
  *(_QWORD *)v36 = 0;
  v33 = objc_retainAutorelease(v10);
  v11 = objc_msgSend(v33, "bytes");
  if (CTParseCertificateSet((unint64_t)v11, (unint64_t)objc_msgSend(v33, "length") + (_QWORD)v11, buf, 3, v36)|| !*(_QWORD *)v36)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036FC4();
    v12 = 0;
    goto LABEL_21;
  }
  v12 = objc_alloc_init((Class)NSMutableArray);
  if (!v12)
  {
LABEL_21:
    v16 = 0;
    goto LABEL_22;
  }
  if (*(_QWORD *)v36)
  {
    v13 = 0;
    v14 = 0;
    do
    {
      v15 = (void *)SecCertificateCreateWithBytes(0, *(_QWORD *)&buf[16 * v13], *(_QWORD *)&buf[16 * v13 + 8]);
      objc_msgSend(v12, "setObject:atIndexedSubscript:", v15, v13);

      v13 = ++v14;
    }
    while (*(_QWORD *)v36 > (unint64_t)v14);
  }
  v16 = objc_msgSend(v12, "copy");
LABEL_22:

  if (!v16)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036E5C();

    goto LABEL_33;
  }
  v17 = (void *)SecCertificateCopyExtensionValue(a3, CFSTR("1.2.840.113635.100.6.83"), 0);
  if (!v17)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036E88();

LABEL_33:
    v19 = 0;
LABEL_34:
    v20 = 0;
    goto LABEL_35;
  }
  v18 = aks_attest_context_size;
  if (_dispatch_is_multithreaded())
  {
    while (1)
    {
      v19 = malloc_type_calloc(1uLL, v18, 0x1B044E25uLL);
      if (v19)
        break;
      __os_temporary_resource_shortage();
    }
  }
  else
  {
    v19 = malloc_type_calloc(1uLL, v18, 0x61D5536CuLL);
    if (!v19)
    {
      v35 = 0;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      *(_OWORD *)buf = 0u;
      v26 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v27 = 3;
      else
        v27 = 2;
      v28 = __error();
      v29 = strerror(*v28);
      *(_DWORD *)v36 = 136315650;
      *(_QWORD *)&v36[4] = "known-constant allocation";
      v37 = 2048;
      v38 = v18;
      v39 = 2080;
      v40 = v29;
      v30 = _os_log_send_and_compose_impl(v27, &v35, buf, 80, &_mh_execute_header, &_os_log_default, 16);

      v31 = _os_crash_msg(v35, v30);
      sub_100033D14(v31);
    }
  }
  v22 = objc_retainAutorelease(v17);
  if (aks_attest_context_init(objc_msgSend(v22, "bytes"), objc_msgSend(v22, "length"), v19))
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036F64();
LABEL_70:

    goto LABEL_34;
  }
  v23 = (id)qword_100057DC8;
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[__CFData sha256](v8, "sha256"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "base64EncodedStringWithOptions:", 0));
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Authenticating TLS peer with public key sha256: %{public}@", buf, 0xCu);

  }
  if (objc_msgSend(v5, "containsObject:", CFSTR("1.2.840.113635.100.6.84"))
    && (sub_10001A2CC(v16) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036F38();
    goto LABEL_70;
  }
  if (objc_msgSend(v5, "containsObject:", CFSTR("1.2.840.113635.100.6.83"))
    && (sub_10001A3F0(v16, (uint64_t)v19) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036F0C();
    goto LABEL_70;
  }
  if (a1 == 15)
  {
    if (sub_100015BA4() && (sub_10001A888((uint64_t)v19, (uint64_t)a3) & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
        sub_100036EE0();
      goto LABEL_70;
    }
  }
  else if (a1 == 16 && (sub_10001A5F4((uint64_t)v19) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100036EB4();
    goto LABEL_70;
  }
  v25 = qword_100057DC8;
  if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "TLS peer authenticated successfully.", buf, 2u);
  }

  v20 = 1;
LABEL_35:
  free(v19);
  if (v7)
    CFRelease(v7);
  if (error)
    CFRelease(error);

  return v20;
}

void sub_10001A200(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, CFTypeRef cf)
{
  const void *v13;
  void *v14;

  free(v14);
  if (v13)
    CFRelease(v13);
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(a1);
}

uint64_t sub_10001A25C(void *a1, __SecCertificate *a2)
{
  id v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v3 = a1;
  v4 = objc_msgSend(v3, "type");
  v5 = (void *)objc_opt_class(v3);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "tlsOidsRequiredOfPeer"));
  v7 = sub_100019B2C(v4, v6, a2);

  return v7;
}

uint64_t sub_10001A2CC(void *a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint8_t v6[16];
  uint8_t buf[16];

  v1 = a1;
  v2 = qword_100057DC8;
  if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Verifying peer's DCRT chain against SCRT root CA...", buf, 2u);
  }
  v3 = 1;
  if ((sub_10001AC08(v1, 1) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100037050();
    v4 = qword_100057DC8;
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Verifying peer's DCRT chain against UCRT root CA...", v6, 2u);
    }
    if ((sub_10001AC08(v1, 0) & 1) != 0)
    {
      v3 = 1;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
        sub_100037024();
      v3 = 0;
    }
  }

  return v3;
}

uint64_t sub_10001A3F0(void *a1, uint64_t a2)
{
  id v3;
  __SecCertificate *v4;
  __SecCertificate *v5;
  __SecKey *v6;
  __SecKey *v7;
  CFDataRef v8;
  NSObject *v9;
  const __CFData *v10;
  uint64_t v11;
  uint8_t v13[8];
  CFErrorRef error;

  v3 = a1;
  error = 0;
  v4 = (__SecCertificate *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndexedSubscript:", 0));
  v5 = v4;
  if (v4)
  {
    v6 = SecCertificateCopyKey(v4);
    v7 = v6;
    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
        sub_1000370A8();
      v11 = 0;
      goto LABEL_20;
    }
    v8 = SecKeyCopyExternalRepresentation(v6, &error);
    v9 = qword_100057DC8;
    if (v8)
    {
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Verifying peer's DAK attestation...", v13, 2u);
      }
      v10 = objc_retainAutorelease(v8);
      if (!aks_attest_context_verify(a2, -[__CFData bytes](v10, "bytes"), -[__CFData length](v10, "length")))
      {
        v11 = 1;
        goto LABEL_19;
      }
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
        sub_100037134();
    }
    else if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
    {
      sub_1000370D4();
    }
    v11 = 0;
LABEL_19:

    CFRelease(v7);
LABEL_20:
    CFRelease(v5);
    if (error)
      CFRelease(error);
    goto LABEL_22;
  }
  if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
    sub_10003707C();
  v11 = 0;
LABEL_22:

  return v11;
}

void sub_10001A5B0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, CFTypeRef cf)
{
  const void *v10;

  CFRelease(v10);
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(a1);
}

uint64_t sub_10001A5F4(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  uint64_t v8;
  int v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  CFTypeRef cf;
  uint8_t buf[4];
  int v17;
  __int16 v18;
  int v19;
  const __CFString *v20;
  CFBooleanRef v21;

  cf = 0;
  v20 = CFSTR("GetCombined");
  v21 = kCFBooleanTrue;
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1));
  v13 = 0;
  v14 = 0;
  v11 = 0;
  v12 = 0;
  v10 = 0;
  v3 = (void *)AMFDRSealingMapCopyLocalDictForClass(CFSTR("ChMf"), v2, &cf);
  if (!v3)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100037194();
    goto LABEL_12;
  }
  if ((sub_10001B050(a1, &v14, &v13) & 1) != 0)
  {
    v4 = sub_10001B370(v3, v14, v13, (_WORD *)&v10 + 1, &v10);
    v5 = qword_100057DC8;
    if ((v4 & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109376;
        v17 = HIWORD(v10);
        v18 = 1024;
        v19 = (unsigned __int16)v10;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Peer authenticated as compute node at carrier %lc index %lc", buf, 0xEu);
      }
      if ((sub_10001B6E8(&v12, &v11) & 1) != 0)
      {
        v6 = sub_10001B810(v3, v12, v11);
        v7 = qword_100057DC8;
        if (v6)
        {
          if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Self matched cctrl in chassis manifest.", buf, 2u);
          }
LABEL_12:
          v8 = 1;
          goto LABEL_22;
        }
        if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_FAULT))
          sub_1000371F4();
      }
      else if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      {
        sub_100037220();
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
    {
      sub_10003724C();
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
  {
    sub_100037278();
  }
  v8 = 0;
LABEL_22:

  if (cf)
    CFRelease(cf);
  return v8;
}

void sub_10001A860(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10001A888(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  BOOL v8;
  NSObject *v9;
  char v10;
  NSObject *v11;
  uint64_t v12;
  int v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  CFTypeRef cf;
  uint8_t buf[4];
  int v21;
  __int16 v22;
  int v23;

  v18 = 0;
  cf = 0;
  v16 = 0;
  v17 = 0;
  v15 = 0;
  v14 = 0;
  if ((sub_10001B050(a1, &v18, &v17) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100037278();
    goto LABEL_29;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%08llX-%016llX"), v18, v17));
  v4 = SecCertificateCopyExtensionValue(a2, CFSTR("1.2.840.113635.100.6.85"), 0);
  v5 = (void *)v4;
  if (!v4)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_1000372A4();

    goto LABEL_29;
  }
  v6 = (void *)AMFDRSealingMapCopyDictFromCombinedData(v4, CFSTR("ChMf"), v3, v3, 0, &cf);
  v7 = v6;
  if (!v6)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_1000372D0();

    goto LABEL_29;
  }
  v8 = sub_10001B810(v6, v18, v17);
  v9 = qword_100057DC8;
  if (!v8)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_10003735C();

    goto LABEL_29;
  }
  if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Peer authenticated as cctrl.", buf, 2u);
  }
  if ((sub_10001B6E8(&v16, &v15) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100037220();

    goto LABEL_29;
  }
  v10 = sub_10001B370(v7, v16, v15, (_WORD *)&v14 + 1, &v14);
  v11 = qword_100057DC8;
  if ((v10 & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100037330();

LABEL_29:
    v12 = 0;
    goto LABEL_30;
  }
  if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    v21 = HIWORD(v14);
    v22 = 1024;
    v23 = (unsigned __int16)v14;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Self matched compute node at carrier %lc index %lc", buf, 0xEu);
  }

  v12 = 1;
LABEL_30:
  if (cf)
    CFRelease(cf);
  return v12;
}

void sub_10001AB60(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, CFTypeRef cf)
{
  _Unwind_Resume(exception_object);
}

void sub_10001AB80(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, const void *a16)
{
  if (a2)
    objc_terminate();
  sub_10001AB60(a1, 0, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12, a13, a14, a15, a16);
}

uint64_t sub_10001AB88(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  NSString *v6;
  void *v7;

  v4 = a3;
  if (xpc_get_type(v4) == (xpc_type_t)&_xpc_type_string)
  {
    v5 = *(void **)(a1 + 32);
    v6 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", xpc_string_get_string_ptr(v4));
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    objc_msgSend(v5, "addObject:", v7);

  }
  return 1;
}

uint64_t sub_10001AC08(void *a1, int a2)
{
  id v3;
  id v4;
  id v5;
  id v6;
  uint64_t AppleBasicAttestationSystem;
  id v8;
  const void *v9;
  const void *v10;
  uint64_t v11;
  NSObject *v13;
  NSObject *v14;
  uint8_t v15[12];
  SecTrustResultType result;
  CFTypeRef cf;
  SecTrustRef trust;
  const void *v19;

  v3 = a1;
  cf = 0;
  trust = 0;
  v4 = objc_msgSend(v3, "mutableCopy");
  result = kSecTrustResultInvalid;
  if (a2)
  {
    v5 = objc_alloc((Class)NSData);
    v6 = objc_msgSend(v5, "initWithBytes:length:", aBeginCertifica, dword_100057C38);
    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
        sub_100037388();
      goto LABEL_23;
    }
    AppleBasicAttestationSystem = SecPolicyCreateAppleBasicAttestationSystem(0);
    if (!AppleBasicAttestationSystem)
    {
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
        sub_1000373B4();
LABEL_22:

LABEL_23:
      v9 = 0;
LABEL_24:

      v11 = 0;
      goto LABEL_30;
    }
  }
  else
  {
    v8 = objc_alloc((Class)NSData);
    v6 = objc_msgSend(v8, "initWithBytes:length:", aBeginCertifica_0, dword_100057914);
    if (!v6)
    {
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
        sub_10003758C();
      goto LABEL_23;
    }
    AppleBasicAttestationSystem = SecPolicyCreateAppleBasicAttestationUser(0);
    if (!AppleBasicAttestationSystem)
    {
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
        sub_1000375B8();
      goto LABEL_22;
    }
  }
  v9 = (const void *)AppleBasicAttestationSystem;
  v10 = (const void *)SecCertificateCreateWithPEM(0, v6);
  if (!v10)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_1000373E0();

    goto LABEL_24;
  }
  objc_msgSend(v4, "addObject:", v10);
  if (SecTrustCreateWithCertificates(v4, v9, &trust))
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_10003752C();
  }
  else
  {
    v19 = v10;
    if (!SecTrustSetAnchorCertificates(trust, (CFArrayRef)+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v19, 1)))
    {
      if (!SecTrustEvaluateWithError(trust, (CFErrorRef *)&cf))
      {
        if (SecTrustGetTrustResult(trust, &result))
        {
          if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
            sub_10003746C();
          goto LABEL_28;
        }
        if (result != kSecTrustResultRecoverableTrustFailure || !SecTrustIsExpiredOnly(trust))
        {
          if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
            sub_10003740C();
          goto LABEL_28;
        }
        v14 = qword_100057DC8;
        if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Ignoring past-due expiration date on DCRT.", v15, 2u);
        }
      }
      v13 = qword_100057DC8;
      v11 = 1;
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Peer's DCRT passed trust evaluation.", v15, 2u);
      }
      goto LABEL_29;
    }
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_1000374CC();
  }
LABEL_28:
  v11 = 0;
LABEL_29:

  CFRelease(v10);
LABEL_30:
  if (cf)
    CFRelease(cf);
  if (trust)
    CFRelease(trust);
  if (v9)
    CFRelease(v9);

  return v11;
}

void sub_10001AFE0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, CFTypeRef cf, CFTypeRef a12)
{
  const void *v12;

  if (cf)
    CFRelease(cf);
  if (a12)
    CFRelease(a12);
  if (v12)
    CFRelease(v12);
  _Unwind_Resume(exception_object);
}

uint64_t sub_10001B050(uint64_t a1, _QWORD *a2, _QWORD *a3)
{
  BOOL v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;

  v24 = 0;
  v25 = 0;
  v22 = 0;
  v23 = 0;
  if (aks_attest_context_get(a1, 4, &v25, &v24) || (v25 ? (v5 = v24 == 0) : (v5 = 1), v5))
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100037788();
    goto LABEL_23;
  }
  v6 = objc_alloc((Class)NSData);
  v7 = objc_msgSend(v6, "initWithBytes:length:", v25, v24);
  if (!v7)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_1000375E4();
LABEL_23:
    v18 = 0;
    v8 = 0;
LABEL_24:
    v11 = 0;
    v15 = 0;
    v13 = 0;
    goto LABEL_25;
  }
  v8 = v7;
  v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v7, 1);
  v10 = qword_100057DC8;
  if (!v9)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100037610();
    v18 = 0;
    goto LABEL_24;
  }
  v11 = v9;
  if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Peer's DAK attestation contains HW identity: %@", buf, 0xCu);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "componentsSeparatedByString:", CFSTR("-")));
  v13 = v12;
  if (v12 && objc_msgSend(v12, "count") == (id)4)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 0));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v14));

    if ((objc_msgSend(v15, "scanHexLongLong:", &v23) & 1) != 0)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndexedSubscript:", 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v16));

      if ((objc_msgSend(v17, "scanHexLongLong:", &v22) & 1) != 0)
      {
        if (a2)
          *a2 = v23;
        if (a3)
          *a3 = v22;
        v18 = 1;
      }
      else
      {
        v21 = (void *)qword_100057DC8;
        if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
          sub_100037668(v21, v13);
        v18 = 0;
      }
      v15 = v17;
    }
    else
    {
      v20 = (void *)qword_100057DC8;
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
        sub_1000376F8(v20, v13);
      v18 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_10003763C();
    v18 = 0;
    v15 = 0;
  }
LABEL_25:

  return v18;
}

uint64_t sub_10001B370(void *a1, uint64_t a2, uint64_t a3, _WORD *a4, _WORD *a5)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  id v15;
  unsigned int v16;
  uint64_t v17;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  uint64_t v22;
  _WORD *v24;
  _WORD *v25;
  unsigned int v28;
  unsigned int v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  unsigned int v39;
  __int16 v40;
  unsigned int v41;
  _BYTE v42[128];

  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v7 = a1;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
  if (v8)
  {
    v9 = v8;
    v24 = a4;
    v25 = a5;
    v10 = *(_QWORD *)v33;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v33 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v11);
      v30 = 0;
      v31 = 0;
      v13 = objc_opt_class(NSString);
      v14 = 0;
      v15 = 0;
      if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
      {
        if (objc_msgSend(v12, "hasPrefix:", CFSTR("N"))
          && objc_msgSend(v12, "hasSuffix:", CFSTR("1"))
          && objc_msgSend(v12, "length") == (id)4)
        {
          v16 = objc_msgSend(v12, "characterAtIndex:", 1);
          v29 = objc_msgSend(v12, "characterAtIndex:", 2);
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v12));
          v17 = objc_opt_class(NSData);
          if ((objc_opt_isKindOfClass(v14, v17) & 1) != 0)
          {
            v28 = v16;
            v15 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v14, 4);
            v18 = qword_100057DC8;
            if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              v37 = v15;
              v38 = 1024;
              v39 = v28;
              v40 = 1024;
              v41 = v29;
              _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "Chassis manifest lists cnode UDID '%@' at carrier %lc index %lc", buf, 0x18u);
            }
            if ((sub_10001B998(v15, (uint64_t)&v31, (uint64_t)&v30) & 1) != 0)
            {
              if (v31 == a2 && v30 == a3)
              {
                if (v24)
                  *v24 = v28;
                if (v25)
                  *v25 = v29;

                v22 = 1;
                goto LABEL_32;
              }
            }
            else
            {
              v20 = qword_100057DC8;
              if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543362;
                v37 = v15;
                _os_log_error_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Failed to extract HW identifiers from cnode UDID '%{public}@'", buf, 0xCu);
              }
            }
            goto LABEL_19;
          }
          v19 = qword_100057DC8;
          if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v37 = v12;
            _os_log_error_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Chassis manifest contained unexpected type at %{public}@", buf, 0xCu);
          }
        }
        else
        {
          v14 = 0;
        }
        v15 = 0;
      }
LABEL_19:

      if (v9 == (id)++v11)
      {
        v21 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v32, v42, 16);
        v9 = v21;
        if (v21)
          goto LABEL_3;
        break;
      }
    }
  }
  v22 = 0;
LABEL_32:

  return v22;
}

uint64_t sub_10001B6E8(void *a1, void *a2)
{
  const void *v4;
  uint64_t v5;
  uint64_t v6;

  v4 = (const void *)MGCopyAnswer(CFSTR("566JrJVMlDfnslGpwUzNlQ"), 0);
  v5 = MGCopyAnswer(CFSTR("TF31PAB6aO8KAbPyNKSxKA"), 0);
  v6 = v5;
  if (v4)
  {
    if (!v5)
    {
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
        sub_100037814();
      v6 = 0;
LABEL_15:
      CFRelease(v4);
      return v6;
    }
    if (a1)
      CFNumberGetValue((CFNumberRef)v4, kCFNumberLongLongType, a1);
    if (a2)
      CFNumberGetValue((CFNumberRef)v6, kCFNumberLongLongType, a2);
LABEL_10:
    CFRelease((CFTypeRef)v6);
    if (!v4)
      return 0;
    v6 = 1;
    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
    sub_1000377E8();
  if (v6)
    goto LABEL_10;
  return v6;
}

void sub_10001B7E4(_Unwind_Exception *a1)
{
  const void *v1;
  const void *v2;

  CFRelease(v2);
  CFRelease(v1);
  _Unwind_Resume(a1);
}

BOOL sub_10001B810(void *a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  _BOOL8 v10;
  uint64_t v12;
  uint64_t v13;
  uint8_t buf[4];
  id v15;

  v12 = 0;
  v13 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "objectForKeyedSubscript:", CFSTR("BM02")));
  v6 = objc_opt_class(NSData);
  if ((objc_opt_isKindOfClass(v5, v6) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_1000378A0();
    goto LABEL_17;
  }
  v7 = objc_msgSend(objc_alloc((Class)NSString), "initWithData:encoding:", v5, 4);
  v8 = qword_100057DC8;
  if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "Chassis manifest lists cctrl UDID '%@'", buf, 0xCu);
  }
  if ((sub_10001B998(v7, (uint64_t)&v13, (uint64_t)&v12) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_100037840();

LABEL_17:
    v10 = 0;
    goto LABEL_18;
  }
  v10 = v13 == a2 && v12 == a3;

LABEL_18:
  return v10;
}

uint64_t sub_10001B998(void *a1, uint64_t a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v15;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("-")));
  v7 = v6;
  if (v6 && objc_msgSend(v6, "count") == (id)2)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 0));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v8));

    if ((objc_msgSend(v9, "scanHexLongLong:", a2) & 1) != 0)
    {
      v10 = 1;
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", 1));
      v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSScanner scannerWithString:](NSScanner, "scannerWithString:", v11));

      if ((objc_msgSend(v12, "scanHexLongLong:", a3) & 1) == 0)
      {
        v13 = (void *)qword_100057DC8;
        if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
          sub_10003792C(v13, v7);
        v10 = 0;
      }
      v9 = v12;
    }
    else
    {
      v15 = (void *)qword_100057DC8;
      if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
        sub_1000379BC(v15, v7);
      v10 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100057DC8, OS_LOG_TYPE_ERROR))
      sub_1000378CC();
    v10 = 0;
    v9 = 0;
  }

  return v10;
}

id sub_10001BB30(id a1)
{
  return a1;
}

void sub_10001C118(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t failsafe_version_flags;
  void *v14;
  int v15;
  uint64_t v16;

  if ((_DWORD)a3)
  {
    v5 = qword_100057DE8;
    if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR))
      sub_100034760(a1, a3, v5);
    objc_msgSend(*(id *)(a1 + 32), "connect:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));

    v7 = qword_100057DE8;
    v8 = os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, but socket is not needed anymore, closing", (uint8_t *)&v15, 0xCu);
      }
      close(*(_DWORD *)(a1 + 40));
    }
    else
    {
      if (v8)
      {
        v10 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, socket is connected", (uint8_t *)&v15, 0xCu);
      }
      v11 = *(unsigned int *)(a1 + 40);
      v12 = qword_100057DF8;
      failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v8);
      v14 = (void *)xpc_remote_connection_create_with_connected_fd(v11, v12, failsafe_version_flags, 0);
      objc_msgSend(*(id *)(a1 + 32), "connect:", v14);

    }
  }
}

void sub_10001C2CC(void *a1)
{
  id v2;
  os_log_t v3;
  void *v4;
  NSObject *v5;
  NSMutableSet *v6;
  void *v7;
  uint8_t v8[16];

  v2 = a1;
  if (!qword_100057DF8)
  {
    v3 = os_log_create("com.apple.RemoteServiceDiscovery", "network_peer");
    v4 = (void *)qword_100057DE8;
    qword_100057DE8 = (uint64_t)v3;

    v5 = qword_100057DE8;
    if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "initializing network peer device", v8, 2u);
    }
    objc_storeStrong((id *)&qword_100057DF8, a1);
    v6 = objc_opt_new(NSMutableSet);
    v7 = (void *)qword_100057DF0;
    qword_100057DF0 = (uint64_t)v6;

  }
}

BOOL sub_10001C39C(const char *a1)
{
  id v2;
  NSObject *v3;
  _BOOL8 result;
  uint64_t v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  int v10;
  NSObject *v11;
  dispatch_source_t v12;
  void *v13;
  NSObject *v14;
  RSDNCMInterface *v15;
  void *v16;
  NSObject *v17;
  _QWORD v18[4];
  int v19;
  _QWORD handler[4];
  int v21;
  uint64_t v22;
  int handle;
  __int16 handle_6;
  uint8_t buf[88];

  v2 = (id)qword_100057DF8;
  if (!v2)
    sub_100037AD8(handler, buf);

  v3 = qword_100057DE8;
  if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "enabling network peer", buf, 2u);
  }
  if (a1)
  {
    if (qword_100057E00)
    {
      result = os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR);
      if (result)
      {
        sub_100037D10();
        return 0;
      }
    }
    else
    {
      v5 = if_nametoindex(a1);
      if ((_DWORD)v5)
      {
        v6 = v5;
        if (sub_10001DF14(a1, &qword_100057E08, 0))
        {
          result = os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR);
          if (result)
          {
            sub_100037CB0();
            return 0;
          }
        }
        else
        {
          v8 = qword_100057DE8;
          if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "create peer listener start", buf, 2u);
          }
          handle_6 = -6663;
          handle = -1;
          v9 = sub_10001DB04(&handle, &qword_100057E08, &handle_6, v6, (uint64_t)&unk_1000410BC);
          if (v9)
          {
            v10 = v9;
            v11 = qword_100057DE8;
            if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 67109120;
              *(_DWORD *)&buf[4] = v10;
              _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Unable to start remoted listener: %{darwin.errno}d", buf, 8u);
              v11 = qword_100057DE8;
            }
            result = os_log_type_enabled(v11, OS_LOG_TYPE_ERROR);
            if (result)
            {
              sub_100037C50();
              return 0;
            }
          }
          else
          {
            if ((id)qword_100057E18)
              sub_100037BDC(&v22, buf);
            v12 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_read, handle, 0, (dispatch_queue_t)qword_100057DF8);
            v13 = (void *)qword_100057E18;
            qword_100057E18 = (uint64_t)v12;

            handler[0] = _NSConcreteStackBlock;
            handler[1] = 3221225472;
            handler[2] = sub_10001CD08;
            handler[3] = &unk_1000514F0;
            v21 = handle;
            dispatch_source_set_event_handler((dispatch_source_t)qword_100057E18, handler);
            v18[0] = _NSConcreteStackBlock;
            v18[1] = 3221225472;
            v18[2] = sub_10001CE7C;
            v18[3] = &unk_1000514F0;
            v19 = handle;
            dispatch_source_set_mandatory_cancel_handler(qword_100057E18, v18);
            dispatch_activate((dispatch_object_t)qword_100057E18);
            v14 = qword_100057DE8;
            if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "create peer listener done", buf, 2u);
            }
            v15 = objc_alloc_init(RSDNCMInterface);
            v16 = (void *)qword_100057E00;
            qword_100057E00 = (uint64_t)v15;

            objc_msgSend((id)qword_100057E00, "setIndex:", v6);
            objc_msgSend((id)qword_100057E00, "setName:", strdup(a1));
            v17 = qword_100057DE8;
            if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136446210;
              *(_QWORD *)&buf[4] = a1;
              _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "network peer enabled on %{public}s", buf, 0xCu);
            }
            return 1;
          }
        }
      }
      else
      {
        v7 = qword_100057DE8;
        result = os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR);
        if (result)
        {
          sub_100037B6C((uint64_t)a1, v7);
          return 0;
        }
      }
    }
  }
  else
  {
    result = os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR);
    if (result)
    {
      sub_100037B40();
      return 0;
    }
  }
  return result;
}

void sub_10001C78C()
{
  id v0;
  NSObject *v1;
  id v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  NSObject *v11;
  _QWORD v12[5];
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  uint64_t v17;
  uint8_t v18[128];
  uint8_t buf[88];

  v0 = (id)qword_100057DF8;
  if (!v0)
    sub_100037AD8(&v17, buf);

  v1 = qword_100057DE8;
  if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "disabling network peer", buf, 2u);
  }
  if (qword_100057E00)
  {
    v2 = (id)qword_100057E18;
    if (!v2)
      sub_100037D68(&v17, buf);

    dispatch_source_cancel((dispatch_source_t)qword_100057E18);
    v3 = (void *)qword_100057E18;
    qword_100057E18 = 0;

    v4 = (void *)qword_100057E00;
    qword_100057E00 = 0;

    if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_DEBUG))
      sub_100037DD0();
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v5 = objc_msgSend((id)qword_100057DF0, "copy");
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v14;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(_QWORD *)v14 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
          if (objc_msgSend(v10, "state") == 3)
          {
            v12[0] = _NSConcreteStackBlock;
            v12[1] = 3221225472;
            v12[2] = sub_10001CA1C;
            v12[3] = &unk_100051600;
            v12[4] = v10;
            objc_msgSend(v10, "goodByeWithCallback:", v12);
          }
          else
          {
            objc_msgSend(v10, "disconnect");
          }
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      }
      while (v7);
    }

    qword_100057E08.n128_u64[0] = 0;
    unk_100057E10 = 0;
    v11 = qword_100057DE8;
    if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "network peer disabled", buf, 2u);
    }
  }
  else if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR))
  {
    sub_100037D3C();
  }
}

id sub_10001CA1C(uint64_t a1, int a2)
{
  if (a2 && os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR))
    sub_100035C48();
  return objc_msgSend(*(id *)(a1 + 32), "disconnect");
}

BOOL sub_10001CA78(_QWORD *a1)
{
  id v2;
  id v3;
  uint64_t v4;
  void *v5;
  _BOOL8 result;
  id v7;
  void *v8;
  uint64_t v9;
  _OWORD v10[5];

  v2 = (id)qword_100057DF8;
  if (!v2)
    sub_100037AD8(&v9, v10);

  if (!qword_100057E00)
  {
    result = os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR);
    if (!result)
      return result;
    sub_100037E08();
    return 0;
  }
  v3 = sub_10001CBAC(a1);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (v4)
  {
    v5 = (void *)v4;
    if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR))
      sub_100037E60();

    return 0;
  }
  v7 = -[RSDRemoteNetworkPeerDevice initClientWithRemoteAddress:]([RSDRemoteNetworkPeerDevice alloc], "initClientWithRemoteAddress:", a1);
  if (v7)
  {
    v8 = v7;
    objc_msgSend(v7, "attach");

    return 1;
  }
  result = os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR);
  if (result)
  {
    sub_100037E34();
    return 0;
  }
  return result;
}

id sub_10001CBAC(_QWORD *a1)
{
  id v2;
  id v3;
  id v4;
  int v5;
  void *v6;
  uint64_t v7;
  void *i;
  void *v9;
  _QWORD *v10;
  id v12;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _OWORD v19[5];
  _BYTE v20[128];

  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = (id)qword_100057DF0;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = 0;
    v7 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v7)
          objc_enumerationMutation(v2);
        v9 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v10 = objc_msgSend(v9, "remote_address");
        if (*v10 == *a1 && v10[1] == a1[1])
        {
          v12 = v9;

          ++v5;
          v6 = v12;
        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
    }
    while (v4);

    if (v6 && v5 >= 2)
      sub_100037E8C(&v14, v19);
  }
  else
  {

    v6 = 0;
  }
  return v6;
}

uint64_t sub_10001CD08(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  id v4;
  void *v5;
  void *v6;
  RSDRemoteNetworkPeerDevice *v7;
  id v8;
  void *v9;
  NSObject *v10;
  uint8_t v11;
  _BYTE v12[15];
  uint8_t buf[12];
  socklen_t v14;
  sockaddr v15;
  uint64_t v16;
  int v17;
  unsigned int v18;

  v17 = 0;
  v18 = -1431655766;
  *(_QWORD *)&v15.sa_len = 0;
  *(_QWORD *)&v15.sa_data[6] = 0;
  v16 = 0;
  v14 = 28;
  for (result = sub_10001E334(*(_DWORD *)(a1 + 32), &v15, &v14, (unsigned __int8 *)&xmmword_1000410A8, (int *)&v18);
        !(_DWORD)result;
        result = sub_10001E334(*(_DWORD *)(a1 + 32), &v15, &v14, (unsigned __int8 *)&xmmword_1000410A8, (int *)&v18))
  {
    v3 = qword_100057DE8;
    if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Got incoming remoted connection", buf, 2u);
    }
    v4 = sub_10001CBAC(&v15.sa_data[6]);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v6 = v5;
    if (v5)
    {
      objc_msgSend(v5, "serverReplacePeerSocket:", v18);
    }
    else
    {
      v7 = [RSDRemoteNetworkPeerDevice alloc];
      v8 = -[RSDRemoteNetworkPeerDevice initServerWithPeerSocket:](v7, "initServerWithPeerSocket:", v18);
      if (v8)
      {
        v9 = v8;
        objc_msgSend(v8, "attach");

      }
      else
      {
        v10 = qword_100057DE8;
        if (os_log_type_enabled((os_log_t)qword_100057DE8, OS_LOG_TYPE_ERROR))
          sub_100037F14(&v11, v12, v10);
      }
    }

  }
  return result;
}

uint64_t sub_10001CE7C(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

double sub_10001CE84(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_10001CEA8(char *a1, uint64_t a2, _DWORD *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = sub_10001CF1C(a1, a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    if (objc_msgSend(v5, "length") == (id)4)
    {
      *a3 = *(_DWORD *)objc_msgSend(objc_retainAutorelease(v6), "bytes");
      v7 = 1;
    }
    else
    {
      v7 = 0;
    }
  }

  return v7;
}

id sub_10001CF1C(char *path, uint64_t a2)
{
  io_registry_entry_t v3;
  void *CFProperty;
  void *v5;
  CFTypeID v6;

  v3 = IORegistryEntryFromPath(0, path);
  CFProperty = (void *)IORegistryEntryCreateCFProperty(v3, (CFStringRef)+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", a2), 0, 0);
  if (CFProperty)
  {
    v5 = CFProperty;
    v6 = CFGetTypeID(CFProperty);
    if (v6 == CFDataGetTypeID())
      CFProperty = v5;
    else
      CFProperty = 0;
  }
  return CFProperty;
}

void sub_10001CF88(void *a1, int a2, int a3, int a4, void *a5, void *a6, void *a7, void *a8)
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  _QWORD *v25;
  _QWORD *v26;
  void *v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  _QWORD *v34;
  uint64_t *v35;
  int v36;
  int v37;
  int v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  id (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  _QWORD v45[3];
  int v46;

  v15 = a1;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v45[0] = 0;
  v45[1] = v45;
  v45[2] = 0x2020000000;
  v46 = 0;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = sub_10001D178;
  v43 = sub_10001D1A0;
  v44 = 0;
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_10001D1A8;
  v28[3] = &unk_1000518B0;
  v34 = v45;
  v20 = v16;
  v30 = v20;
  v36 = a2;
  v21 = v17;
  v31 = v21;
  v37 = a3;
  v38 = a4;
  v22 = v15;
  v29 = v22;
  v23 = v18;
  v32 = v23;
  v35 = &v39;
  v24 = v19;
  v33 = v24;
  v25 = objc_retainBlock(v28);
  v26 = objc_retainBlock(v25);
  v27 = (void *)v40[5];
  v40[5] = (uint64_t)v26;

  ((void (*)(_QWORD *))v25[2])(v25);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(v45, 8);
}

void sub_10001D154(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  uint64_t v14;
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v14 - 120), 8);
  _Unwind_Resume(a1);
}

id sub_10001D178(uint64_t a1, uint64_t a2)
{
  id result;

  result = objc_retainBlock(*(id *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void sub_10001D1A0(uint64_t a1)
{

}

void sub_10001D1A8(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;

  ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_10001D28C;
  v5[3] = &unk_100051888;
  v10 = *(_QWORD *)(a1 + 72);
  v12 = *(_DWORD *)(a1 + 88);
  v2 = *(_QWORD *)(a1 + 40);
  v7 = *(id *)(a1 + 48);
  v13 = *(_QWORD *)(a1 + 92);
  v6 = *(id *)(a1 + 32);
  v3 = *(id *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 80);
  v8 = v3;
  v11 = v4;
  v9 = *(id *)(a1 + 64);
  (*(void (**)(uint64_t, _QWORD *))(v2 + 16))(v2, v5);

}

void sub_10001D28C(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  uint64_t v5;
  dispatch_time_t v6;
  NSObject *v7;
  uint64_t v8;
  void *v9;
  _QWORD block[4];
  id v11;
  __int128 v12;

  v3 = a2;
  if (!v3)
    goto LABEL_7;
  v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
  if (v4 >= *(_DWORD *)(a1 + 80))
    goto LABEL_7;
  v5 = *(_QWORD *)(a1 + 40);
  if (v5)
  {
    if ((*(unsigned int (**)(uint64_t, id))(v5 + 16))(v5, v3))
    {
      v4 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
      goto LABEL_6;
    }
LABEL_7:
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = 0;

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
    goto LABEL_8;
  }
LABEL_6:
  v6 = dispatch_time(0, 1000000000 * (*(int *)(a1 + 84) + (v4 - 1) * *(int *)(a1 + 88)));
  v7 = *(NSObject **)(a1 + 32);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10001D3B8;
  block[3] = &unk_100051860;
  v11 = *(id *)(a1 + 48);
  v12 = *(_OWORD *)(a1 + 64);
  dispatch_after(v6, v7, block);

LABEL_8:
}

uint64_t sub_10001D3B8(_QWORD *a1)
{
  uint64_t v2;

  v2 = a1[4];
  if (v2)
    (*(void (**)(uint64_t, _QWORD))(v2 + 16))(v2, *(unsigned int *)(*(_QWORD *)(a1[5] + 8) + 24));
  return (*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 40) + 16))();
}

void sub_10001D400(void *a1)
{
  id v2;
  os_log_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  const char *v8;
  uint8_t *v9;
  __int16 v10;
  __int16 v11;

  v2 = a1;
  v3 = os_log_create("com.apple.RemoteServiceDiscovery", "watchdog");
  v4 = (void *)qword_100057E20;
  qword_100057E20 = (uint64_t)v3;

  objc_storeStrong((id *)&qword_100057E28, a1);
  if ((sub_10000E004() & 1) == 0)
  {
    if (qword_100057E38 != -1)
      dispatch_once(&qword_100057E38, &stru_1000518D0);
    if (!dword_100057E40)
    {
      v7 = qword_100057E20;
      if (!os_log_type_enabled((os_log_t)qword_100057E20, OS_LOG_TYPE_DEFAULT))
        goto LABEL_8;
      v11 = 0;
      v8 = "Not enable remoted watchdog";
      v9 = (uint8_t *)&v11;
      goto LABEL_7;
    }
  }
  wd_endpoint_register("com.apple.remoted.watchdog");
  wd_endpoint_add_queue(qword_100057E28);
  v5 = os_transaction_create("com.apple.remoted.watchdog");
  v6 = (void *)qword_100057E30;
  qword_100057E30 = v5;

  wd_endpoint_activate();
  v7 = qword_100057E20;
  if (os_log_type_enabled((os_log_t)qword_100057E20, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 0;
    v8 = "activated remoted watchdog";
    v9 = (uint8_t *)&v10;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, v8, v9, 2u);
  }
LABEL_8:

}

void sub_10001D54C(id a1)
{
  void *v1;

  v1 = malloc_type_calloc(0x100uLL, 1uLL, 0x100004077774924uLL);
  if (os_parse_boot_arg_string("rsd_wdt", v1, 255))
    dword_100057E40 = remote_device_type_parse(v1);
  free(v1);
}

void sub_10001D5BC(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_10001D5D0(int *a1, __n128 *a2, unsigned int a3, int a4, uint64_t a5)
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v23;
  NSObject *v24;
  id v25;
  uint64_t v26;
  sockaddr v27[2];
  uint8_t buf[4];
  _BYTE v29[10];
  __n128 *v30;
  _BYTE v31[6];
  int v32;
  __int16 v33;
  char *v34;

  memset(v27, 170, 28);
  if (!a1 || !a2 || !a3)
  {
    v18 = sub_10001D894();
    v10 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v29 = a1;
      *(_WORD *)&v29[8] = 2048;
      v30 = a2;
      *(_WORD *)v31 = 1024;
      *(_DWORD *)&v31[2] = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "invalid fd %p, addr %p or port %d", buf, 0x1Cu);
    }
    goto LABEL_11;
  }
  if (a2->n128_u8[0] == 254 && !a4 && (a2->n128_u8[1] & 0xC0) == 0x80)
  {
    v9 = sub_10001D894();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10003809C(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_11:
    v19 = 22;
    goto LABEL_15;
  }
  v20 = sub_10001D8D4(a1, a4, a5);
  if ((_DWORD)v20)
  {
    v19 = v20;
    v21 = sub_10001D894();
    v10 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10003803C();
  }
  else
  {
    sub_10001DA88((uint64_t)v27, a2, a3, a4);
    v23 = sub_10001D894();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67110402;
      *(_DWORD *)v29 = v27[0].sa_len;
      *(_WORD *)&v29[4] = 1024;
      *(_DWORD *)&v29[6] = v27[0].sa_family;
      LOWORD(v30) = 1024;
      *(_DWORD *)((char *)&v30 + 2) = bswap32(*(unsigned __int16 *)v27[0].sa_data) >> 16;
      HIWORD(v30) = 1024;
      *(_DWORD *)v31 = *(_DWORD *)&v27[1].sa_data[6];
      *(_WORD *)&v31[4] = 1040;
      v32 = 16;
      v33 = 2096;
      v34 = &v27[0].sa_data[6];
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "sockaddr_in6 { len: %d, family: %d, port: %d, scope_id: %d, addr: %{network:in6_addr}.16P }", buf, 0x2Au);
    }

    if (*a1 < 0)
      sub_100037FD4(&v26, buf);
    if (!connect(*a1, v27, 0x1Cu) || *__error() == 36)
      return 0;
    v19 = *__error();
    v25 = sub_10001D894();
    v10 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_100037F50(a1, v19, v10);
  }
LABEL_15:

  if (a1 && (_DWORD)v19)
    close_drop_optional_np(a1, 0);
  return v19;
}

id sub_10001D894()
{
  if (qword_100057E50 != -1)
    dispatch_once(&qword_100057E50, &stru_1000518F0);
  return (id)qword_100057E48;
}

uint64_t sub_10001D8D4(int *a1, int a2, uint64_t a3)
{
  id v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  id v12;
  uint64_t v14;
  int v15;
  _OWORD v16[5];

  v15 = a2;
  *a1 = socket(30, 1, 0);
  v6 = sub_10001D894();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    sub_1000381EC(a1, v7);

  if (*a1 == -1)
  {
    a3 = *__error();
    v12 = sub_10001D894();
    v9 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000380CC();
LABEL_16:

    if ((_DWORD)a3)
    {
LABEL_17:
      close_drop_optional_np(a1, 0);
      return a3;
    }
    return a3;
  }
  if (fcntl(*a1, 4, 4) == -1)
    sub_100032228(&v14, v16);
  if (a2 && setsockopt(*a1, 41, 125, &v15, 4u))
  {
    a3 = *__error();
    v8 = sub_10001D894();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10003818C();
    goto LABEL_16;
  }
  if (a3)
  {
    a3 = sub_10001E404(*a1, (unsigned __int8 *)a3);
    if ((_DWORD)a3)
    {
      v10 = sub_10001D894();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_10003812C();

      goto LABEL_17;
    }
  }
  return a3;
}

__n128 sub_10001DA88(uint64_t a1, __n128 *a2, unsigned int a3, int a4)
{
  __n128 result;
  uint64_t v5;
  _OWORD v6[5];

  if (!a1)
    sub_100038284(&v5, v6);
  *(_QWORD *)a1 = 0;
  *(_QWORD *)(a1 + 8) = 0;
  *(_DWORD *)(a1 + 24) = 0;
  *(_QWORD *)(a1 + 16) = 0;
  *(_WORD *)a1 = 7708;
  *(_WORD *)(a1 + 2) = __rev16(a3);
  result = *a2;
  *(__n128 *)(a1 + 8) = *a2;
  *(_DWORD *)(a1 + 24) = a4;
  return result;
}

uint64_t sub_10001DB04(int *a1, __n128 *a2, _WORD *a3, int a4, uint64_t a5)
{
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  id v21;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  int v27;
  id v28;
  id v29;
  id v30;
  id v31;
  socklen_t v32;
  int v33;
  sockaddr v34[2];
  uint8_t buf[4];
  _BYTE v36[28];
  __int16 v37;
  char *v38;

  if (!a1 || !a2 || !a3)
  {
    v18 = sub_10001D894();
    v10 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 134218496;
      *(_QWORD *)v36 = a1;
      *(_WORD *)&v36[8] = 2048;
      *(_QWORD *)&v36[10] = a2;
      *(_WORD *)&v36[18] = 2048;
      *(_QWORD *)&v36[20] = a3;
      _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "invalid fd %p, addr %p or port %p", buf, 0x20u);
    }
    goto LABEL_11;
  }
  if (a2->n128_u8[0] == 254 && !a4 && (a2->n128_u8[1] & 0xC0) == 0x80)
  {
    v9 = sub_10001D894();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10003809C(v10, v11, v12, v13, v14, v15, v16, v17);
LABEL_11:
    v19 = 22;
LABEL_15:

    if (a1 && (_DWORD)v19)
      close_drop_optional_np(a1, 0);
    return v19;
  }
  memset(v34, 170, 28);
  v20 = sub_10001D8D4(a1, a4, a5);
  if ((_DWORD)v20)
  {
    v19 = v20;
    v21 = sub_10001D894();
    v10 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10003803C();
    goto LABEL_15;
  }
  v33 = 1;
  if (setsockopt(*a1, 0xFFFF, 4, &v33, 4u) < 0)
  {
    v19 = *__error();
    v28 = sub_10001D894();
    v10 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000382EC();
    goto LABEL_15;
  }
  sub_10001DA88((uint64_t)v34, a2, (unsigned __int16)*a3, a4);
  v23 = sub_10001D894();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110402;
    *(_DWORD *)v36 = v34[0].sa_len;
    *(_WORD *)&v36[4] = 1024;
    *(_DWORD *)&v36[6] = v34[0].sa_family;
    *(_WORD *)&v36[10] = 1024;
    *(_DWORD *)&v36[12] = bswap32(*(unsigned __int16 *)v34[0].sa_data) >> 16;
    *(_WORD *)&v36[16] = 1024;
    *(_DWORD *)&v36[18] = *(_DWORD *)&v34[1].sa_data[6];
    *(_WORD *)&v36[22] = 1040;
    *(_DWORD *)&v36[24] = 16;
    v37 = 2096;
    v38 = &v34[0].sa_data[6];
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "sockaddr_in6 { len: %d, family: %d, port: %d, scope_id: %d, addr: %{network:in6_addr}.16P }", buf, 0x2Au);
  }

  if (bind(*a1, v34, 0x1Cu) == -1)
  {
    v19 = *__error();
    v29 = sub_10001D894();
    v10 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10003834C();
    goto LABEL_15;
  }
  if (listen(*a1, 128) == -1)
  {
    v19 = *__error();
    v30 = sub_10001D894();
    v10 = objc_claimAutoreleasedReturnValue(v30);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000383AC();
    goto LABEL_15;
  }
  v32 = 28;
  if (getsockname(*a1, v34, &v32) == -1)
  {
    v19 = *__error();
    v31 = sub_10001D894();
    v10 = objc_claimAutoreleasedReturnValue(v31);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10003840C();
    goto LABEL_15;
  }
  *a3 = bswap32(*(unsigned __int16 *)v34[0].sa_data) >> 16;
  v25 = sub_10001D894();
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    v27 = (unsigned __int16)*a3;
    *(_DWORD *)buf = 68158466;
    *(_DWORD *)v36 = 16;
    *(_WORD *)&v36[4] = 2096;
    *(_QWORD *)&v36[6] = &v34[0].sa_data[6];
    *(_WORD *)&v36[14] = 1024;
    *(_DWORD *)&v36[16] = a4;
    *(_WORD *)&v36[20] = 1024;
    *(_DWORD *)&v36[22] = v27;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "bound to %{network:in6_addr}.16P%%%d:%d", buf, 0x1Eu);
  }

  return 0;
}

uint64_t sub_10001DF14(const char *a1, _OWORD *a2, int a3)
{
  id v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  ifaddrs *v17;
  ifaddrs *v18;
  int v19;
  sockaddr *ifa_addr;
  id v21;
  NSObject *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  ifaddrs *v32;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  int v36;
  __int16 v37;
  char *v38;

  if (!a2)
  {
    v9 = sub_10001D894();
    v7 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10003846C(v7, v10, v11, v12, v13, v14, v15, v16);
    v8 = 22;
    goto LABEL_33;
  }
  v32 = 0;
  if (getifaddrs(&v32))
  {
    v6 = sub_10001D894();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100038500(v7);
    v8 = 0xFFFFFFFFLL;
LABEL_33:

    return v8;
  }
  v17 = v32;
  if (!v32)
  {
    freeifaddrs(0);
    goto LABEL_30;
  }
  v18 = 0;
  v19 = 0;
  do
  {
    if ((v17->ifa_flags & 1) != 0)
    {
      ifa_addr = v17->ifa_addr;
      if (ifa_addr->sa_family == 30
        && !strncmp(v17->ifa_name, a1, 0x10uLL)
        && (!a3 || ifa_addr->sa_data[6] == 254 && (ifa_addr->sa_data[7] & 0xC0) == 0x80))
      {
        *(_DWORD *)&ifa_addr[1].sa_data[6] = if_nametoindex(a1);
        v21 = sub_10001D894();
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315650;
          v34 = a1;
          v35 = 1040;
          v36 = 16;
          v37 = 2096;
          v38 = &ifa_addr->sa_data[6];
          _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%s: %{network:in6_addr}.16P", buf, 0x1Cu);
        }

        ++v19;
        v18 = v17;
      }
    }
    v17 = v17->ifa_next;
  }
  while (v17);
  if (v18)
    *a2 = *(_OWORD *)&v18->ifa_addr->sa_data[6];
  freeifaddrs(v32);
  if (v19 >= 2)
  {
    v23 = sub_10001D894();
    v7 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v34 = a1;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Found more than one ipv6 addresses for %s", buf, 0xCu);
    }
    v8 = 0;
    goto LABEL_33;
  }
  if (!v19)
  {
LABEL_30:
    v24 = sub_10001D894();
    v7 = objc_claimAutoreleasedReturnValue(v24);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10003849C((uint64_t)a1, v7, v25, v26, v27, v28, v29, v30);
    v8 = 3;
    goto LABEL_33;
  }
  return 0;
}

uint64_t sub_10001E1B8(int a1, _OWORD *a2)
{
  uint64_t v3;
  id v4;
  NSObject *v5;
  uint64_t v7;
  socklen_t v8;
  _BYTE v9[24];
  int v10;
  _OWORD v11[5];

  memset(v9, 0, sizeof(v9));
  v10 = 0;
  v8 = 28;
  if (!a2)
    sub_100038588(&v7, v11);
  if (getpeername(a1, (sockaddr *)v9, &v8))
  {
    v3 = *__error();
    v4 = sub_10001D894();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_1000385F0();

  }
  else
  {
    v3 = 0;
    *a2 = *(_OWORD *)&v9[8];
  }
  return v3;
}

uint64_t sub_10001E284(const char *a1)
{
  uint64_t v2;
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;

  *(_QWORD *)&v19 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v19 + 1) = 0xAAAAAAAAAAAAAAAALL;
  if (!if_nametoindex(a1))
  {
    v11 = sub_10001D894();
    v4 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_100038650((uint64_t)a1, v4, v12, v13, v14, v15, v16, v17);
    v2 = 2;
    goto LABEL_8;
  }
  v2 = sub_10001DF14(a1, &v19, 0);
  if ((_DWORD)v2)
  {
    v3 = sub_10001D894();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      sub_1000386B4((uint64_t)a1, v4, v5, v6, v7, v8, v9, v10);
LABEL_8:

  }
  return v2;
}

uint64_t sub_10001E334(int a1, sockaddr *a2, socklen_t *a3, unsigned __int8 *a4, int *a5)
{
  int v7;
  int v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  NSObject *v13;

  if (!a5)
    return 22;
  v7 = accept(a1, a2, a3);
  if (v7 == -1)
  {
    v9 = *__error();
    v12 = sub_10001D894();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_100038718();

  }
  else
  {
    v8 = v7;
    v9 = sub_10001E404(v7, a4);
    if ((_DWORD)v9)
    {
      v10 = sub_10001D894();
      v11 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
        sub_100038778();

      if ((v8 & 0x80000000) == 0)
        close(v8);
    }
    else
    {
      *a5 = v8;
    }
  }
  return v9;
}

uint64_t sub_10001E404(int a1, unsigned __int8 *a2)
{
  uint64_t v4;
  id v5;
  NSObject *v6;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  _OWORD v13[5];

  if (!*((_DWORD *)a2 + 4))
    sub_1000387D8(&v12, v13);
  LODWORD(v13[0]) = *((_DWORD *)a2 + 4);
  if (!setsockopt(a1, 6, 32, v13, 4u))
  {
    if (*a2)
    {
      LODWORD(v13[0]) = 1;
      if (setsockopt(a1, 0xFFFF, 8, v13, 4u))
      {
        v4 = *__error();
        v8 = sub_10001D894();
        v6 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_100038960();
        goto LABEL_5;
      }
      LODWORD(v13[0]) = *a2;
      if (LODWORD(v13[0]) && setsockopt(a1, 6, 16, v13, 4u))
      {
        v4 = *__error();
        v9 = sub_10001D894();
        v6 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_100038900();
        goto LABEL_5;
      }
      LODWORD(v13[0]) = *((_DWORD *)a2 + 2);
      if (LODWORD(v13[0]) && setsockopt(a1, 6, 258, v13, 4u))
      {
        v4 = *__error();
        v10 = sub_10001D894();
        v6 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_1000388A0();
        goto LABEL_5;
      }
      LODWORD(v13[0]) = *((_DWORD *)a2 + 3);
      if (LODWORD(v13[0]) && setsockopt(a1, 6, 257, v13, 4u))
      {
        v4 = *__error();
        v11 = sub_10001D894();
        v6 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_100038840();
        goto LABEL_5;
      }
    }
    return 0;
  }
  v4 = *__error();
  v5 = sub_10001D894();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_1000389C0();
LABEL_5:

  return v4;
}

void sub_10001E62C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RemoteServiceDiscovery", "network");
  v2 = (void *)qword_100057E48;
  qword_100057E48 = (uint64_t)v1;

}

void sub_10001E65C()
{
  os_log_t v0;
  void *v1;
  dispatch_queue_t v2;
  void *v3;
  uint64_t started;
  void *v5;
  NSObject *v6;
  uint8_t v7[16];

  if (qword_100057E78 != -1)
    dispatch_once(&qword_100057E78, &stru_1000519C8);
  if (!byte_100057E80)
  {
    if (qword_100057E88 != -1)
      dispatch_once(&qword_100057E88, &stru_1000519E8);
    if (dword_100057E90
      || os_variant_is_darwinos("com.apple.remoted")
      && !os_variant_is_recovery("com.apple.remoted")
      || sub_10000E004())
    {
      v0 = os_log_create("com.apple.RemoteServiceDiscovery", "timesync");
      v1 = (void *)qword_100057E58;
      qword_100057E58 = (uint64_t)v0;

      v2 = dispatch_queue_create("com.apple.remoted.timesync", 0);
      v3 = (void *)qword_100057E60;
      qword_100057E60 = (uint64_t)v2;

      started = remote_device_start_browsing(0xFFFFLL, qword_100057E60, &stru_100051930);
      v5 = (void *)qword_100057E70;
      qword_100057E70 = started;

      v6 = qword_100057E58;
      if (os_log_type_enabled((os_log_t)qword_100057E58, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "enabled remoted timesync", v7, 2u);
      }
    }
  }
}

void sub_10001E7B4(id a1, OS_remote_device *a2, BOOL a3)
{
  OS_remote_device *v4;
  unsigned int type;
  _BOOL4 v6;
  uint64_t name;
  NSObject *v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  _QWORD v18[4];
  NSObject *v19;
  uint64_t v20;
  _QWORD v21[4];
  NSObject *v22;
  _QWORD handler[4];
  NSObject *v24;
  uint64_t v25;
  unsigned int v26;
  uint8_t buf[4];
  uint64_t v28;

  v4 = a2;
  type = remote_device_get_type();
  if (qword_100057E88 != -1)
    dispatch_once(&qword_100057E88, &stru_1000519E8);
  if (dword_100057E90)
  {
    v6 = dword_100057E90 == type;
  }
  else
  {
    if (type > 0xF)
      goto LABEL_15;
    v6 = 1;
    if (((1 << type) & 0x9200) == 0)
      goto LABEL_15;
  }
  if (v6 && qword_100057E68 == 0)
  {
    objc_storeStrong((id *)&qword_100057E68, a2);
    name = remote_device_get_name(qword_100057E68);
    v9 = qword_100057E58;
    if (os_log_type_enabled((os_log_t)qword_100057E58, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136446210;
      v28 = name;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "start timesync with %{public}s", buf, 0xCu);
    }
    v10 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100057E60);
    dispatch_source_set_timer(v10, 0xFFFFFFFFFFFFFFFFLL, 0xFFFFFFFFFFFFFFFFLL, 0);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001EA38;
    handler[3] = &unk_100051958;
    v25 = name;
    v11 = v10;
    v24 = v11;
    v26 = type;
    dispatch_source_set_event_handler(v11, handler);
    v12 = qword_100057E68;
    v13 = qword_100057E60;
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10001EB54;
    v21[3] = &unk_100051980;
    v14 = v11;
    v22 = v14;
    remote_device_set_connected_callback(v12, v13, v21);
    v15 = qword_100057E68;
    v16 = qword_100057E60;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10001EB68;
    v18[3] = &unk_1000519A8;
    v19 = v14;
    v20 = name;
    v17 = v14;
    remote_device_set_disconnected_callback(v15, v16, v18);
    dispatch_activate(v17);

  }
LABEL_15:

}

void sub_10001EA38(uint64_t a1)
{
  int v2;
  NSObject *v3;
  const char *v4;
  uint64_t v5;
  NSObject *v6;
  dispatch_time_t v7;
  int v8;
  uint64_t v9;
  __int16 v10;
  const char *v11;

  v2 = remote_device_timesync(qword_100057E68);
  v3 = qword_100057E58;
  if (os_log_type_enabled((os_log_t)qword_100057E58, OS_LOG_TYPE_DEFAULT))
  {
    v4 = "fail";
    v5 = *(_QWORD *)(a1 + 40);
    if (v2)
      v4 = "success";
    v8 = 136446466;
    v9 = v5;
    v10 = 2082;
    v11 = v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "timesync with %{public}s %{public}s", (uint8_t *)&v8, 0x16u);
  }
  v6 = *(NSObject **)(a1 + 32);
  if (*(_DWORD *)(a1 + 48) == 15)
    v7 = -1;
  else
    v7 = dispatch_time(0, 60000000000);
  dispatch_source_set_timer(v6, v7, 0xFFFFFFFFFFFFFFFFLL, 0);
}

void sub_10001EB54(uint64_t a1)
{
  dispatch_source_set_timer(*(dispatch_source_t *)(a1 + 32), 0, 0xFFFFFFFFFFFFFFFFLL, 0);
}

void sub_10001EB68(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;

  v2 = qword_100057E58;
  if (os_log_type_enabled((os_log_t)qword_100057E58, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 40);
    v5 = 136446210;
    v6 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "%{public}s disconnected, timesync stop", (uint8_t *)&v5, 0xCu);
  }
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  v4 = (void *)qword_100057E68;
  qword_100057E68 = 0;

}

void sub_10001EC20(id a1)
{
  uint64_t v1;

  v1 = 0;
  if (os_parse_boot_arg_int("rsd_timesync", &v1))
    byte_100057E80 = v1 == -1;
}

void sub_10001EC64(id a1)
{
  void *v1;

  v1 = malloc_type_calloc(0x100uLL, 1uLL, 0x100004077774924uLL);
  if (os_parse_boot_arg_string("rsd_timesync", v1, 255))
    dword_100057E90 = remote_device_type_parse(v1);
  free(v1);
}

void sub_10001ECD4(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

id sub_10001ECE8(void *a1)
{
  return sub_1000047A8(a1, "ERROR");
}

id sub_10001ECF4(void *a1, int a2)
{
  id v3;
  void *v4;

  v3 = sub_1000047A8(a1, "ERROR");
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  xpc_dictionary_set_int64(v4, "error_code", a2);
  return v4;
}

void sub_10001EF40(uint64_t a1, void *a2)
{
  _xpc_connection_s *v3;
  char *v4;
  NSObject *v5;
  id v6;
  _xpc_connection_s *v7;
  _QWORD v8[5];
  _xpc_connection_s *v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  char *v13;

  v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_error)
  {
    v4 = sub_100016F70(v3);
    v5 = (id)qword_100057E98;
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6 = objc_msgSend(*(id *)(a1 + 32), "name");
      *(_DWORD *)buf = 136446466;
      v11 = v6;
      v12 = 2080;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Accepting service connection for \"%{public}s\" (client=\"%s\")", buf, 0x16u);
    }

    free(v4);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10001F0C0;
    v8[3] = &unk_100051170;
    v8[4] = *(_QWORD *)(a1 + 32);
    v7 = v3;
    v9 = v7;
    xpc_connection_set_event_handler(v7, v8);
    xpc_connection_set_target_queue(v7, (dispatch_queue_t)qword_100057EA0);
    xpc_connection_activate(v7);

  }
}

void sub_10001F0A4(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

void sub_10001F0C0(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _xpc_connection_s *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  const char *v11;
  const char *v12;
  __int128 v13;
  void *v14;
  BOOL v15;
  void *v16;
  _BOOL4 v17;
  const char *string;
  id v19;
  void *v20;
  void *v21;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v23;
  char *v24;
  NSObject *v25;
  id v26;
  id v27;
  id v28;
  void *v29;
  id v30;
  id v31;
  char *v32;
  NSObject *v33;
  id v34;
  uint64_t v35;
  _BYTE buf[32];
  id v37;
  id v38;

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v4;
  v7 = v3;
  v8 = objc_autoreleasePoolPush();
  if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_error)
  {
LABEL_10:
    xpc_connection_cancel(v6);
    goto LABEL_24;
  }
  if ((xpc_dictionary_expects_reply(v7) & 1) == 0)
  {
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
      sub_100038B5C();
    goto LABEL_10;
  }
  v9 = v7;
  v10 = v5;
  v11 = (const char *)objc_msgSend(v10, "entitlement");
  if (!v11)
    sub_100038A20(&v35, buf);
  v12 = v11;
  if (!strcmp(v11, "None-AppleInternal") || sub_1000221E8(v12))
  {

  }
  else
  {
    if (xpc_get_type(v9) != (xpc_type_t)&_xpc_type_dictionary)
      sub_100038AD4(&v35, buf);
    *(_QWORD *)&v13 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v13 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)buf = v13;
    *(_OWORD *)&buf[16] = v13;
    xpc_dictionary_get_audit_token(v9, buf);
    v14 = (void *)xpc_copy_entitlement_for_token("com.apple.private.network.intcoproc.restricted", buf);
    v15 = v14 == 0;

    if (v15)
    {
      v16 = (void *)xpc_copy_entitlement_for_token(v12, buf);
      v17 = v16 == 0;

      if (v17)
      {
        v32 = sub_100016F70(v6);
        v33 = (id)qword_100057E98;
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
        {
          v34 = objc_msgSend(v10, "name");
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = v34;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v32;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "service_handler: Client lacks privilege to interact with service with name %{public}s (client=\"%s\")", buf, 0x16u);
        }

        free(v32);
        goto LABEL_19;
      }
    }
    else
    {

    }
  }
  string = xpc_dictionary_get_string(v9, "cmd");
  if (!string || strcmp(string, "connect"))
  {
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
      sub_100038AA8();
LABEL_19:
    v19 = sub_1000047A8(v9, "ERROR");
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = v20;
    if (v20)
    {
      remote_connection = xpc_dictionary_get_remote_connection(v20);
      v23 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      xpc_connection_send_message(v23, v21);

    }
    goto LABEL_24;
  }
  v24 = sub_100016F70(v6);
  v25 = (id)qword_100057E98;
  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
  {
    v26 = objc_msgSend(v10, "name");
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v26;
    *(_WORD *)&buf[12] = 2080;
    *(_QWORD *)&buf[14] = v24;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "%{public}s> Got CONNECT command (client=\"%s\")", buf, 0x16u);
  }

  free(v24);
  v27 = v10;
  v28 = v9;
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "device"));
  *(_QWORD *)buf = _NSConcreteStackBlock;
  *(_QWORD *)&buf[8] = 3221225472;
  *(_QWORD *)&buf[16] = sub_100022224;
  *(_QWORD *)&buf[24] = &unk_1000510A8;
  v37 = v27;
  v38 = v28;
  v30 = v28;
  v31 = v27;
  objc_msgSend(v29, "invokeWhenConnectable:", buf);

LABEL_24:
  objc_autoreleasePoolPop(v8);

}

void sub_10001F4BC(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

void sub_10001F82C(uint64_t a1, void *a2)
{
  _xpc_connection_s *v3;
  char *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  _xpc_connection_s *v8;
  _QWORD v9[5];
  _xpc_connection_s *v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  char *v14;

  v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_error)
  {
    v4 = sub_100016F70(v3);
    v5 = qword_100057E98;
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_INFO))
    {
      v6 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543618;
      v12 = v6;
      v13 = 2080;
      v14 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "%{public}@> Accepting device connection (client=\"%s\")", buf, 0x16u);
    }
    free(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "device_peers"));
    objc_msgSend(v7, "addObject:", v3);

    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10001F998;
    v9[3] = &unk_100051170;
    v9[4] = *(_QWORD *)(a1 + 32);
    v8 = v3;
    v10 = v8;
    xpc_connection_set_event_handler(v8, v9);
    xpc_connection_set_target_queue(v8, (dispatch_queue_t)qword_100057EA0);
    xpc_connection_activate(v8);

  }
}

void sub_10001F998(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  _xpc_connection_s *v6;
  id v7;
  const char *string;
  const char *v9;
  id v10;
  id v11;
  xpc_object_t reply;
  xpc_connection_t v13;
  _xpc_connection_s *v14;
  _xpc_connection_s *v15;
  xpc_object_t v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  id v22;
  _xpc_connection_s *v23;
  id v24;
  __int128 v25;
  void *v26;
  _BOOL4 v27;
  id v28;
  id v29;
  char *v30;
  NSObject *v31;
  id v32;
  xpc_connection_t remote_connection;
  char *v34;
  NSObject *v35;
  xpc_object_t v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *i;
  void *v41;
  char *v42;
  NSObject *v43;
  size_t count;
  void *v45;
  xpc_connection_t v46;
  char *v47;
  NSObject *v48;
  xpc_object_t v49;
  void *v50;
  id v51;
  uint64_t v52;
  void *j;
  void *v54;
  id v55;
  xpc_connection_t v56;
  _xpc_connection_s *v57;
  const char *v58;
  const char *v59;
  char *v60;
  NSObject *v61;
  void *v62;
  id v63;
  char *v64;
  NSObject *v65;
  char *v66;
  NSObject *v67;
  id v68;
  id v69;
  _xpc_connection_s *v70;
  xpc_connection_t v71;
  _xpc_connection_s *v72;
  const char *v73;
  const char *v74;
  char *v75;
  NSObject *v76;
  void *v77;
  id v78;
  id v79;
  id v80;
  id v81;
  unsigned __int8 v82;
  id v83;
  char *v84;
  NSObject *v85;
  NSObject *v86;
  id v87;
  id v88;
  id v89;
  xpc_connection_t v90;
  _xpc_connection_s *v91;
  id v92;
  __int128 v93;
  void *v94;
  _BOOL4 v95;
  char *v96;
  NSObject *v97;
  NSObject *v98;
  id v99;
  char *v100;
  NSObject *v101;
  id v102;
  __int128 v103;
  void *v104;
  _BOOL4 v105;
  const char *v106;
  char *v107;
  NSObject *v108;
  id v109;
  xpc_connection_t v110;
  char *v111;
  NSObject *v112;
  id v113;
  id v114;
  signed int v115;
  char *v116;
  NSObject *v117;
  id v118;
  uint64_t v119;
  void *v120;
  id v121;
  char *v122;
  NSObject *v123;
  const void *data;
  __SecCertificate *v125;
  char *v126;
  NSObject *v127;
  id v128;
  char *v129;
  id v130;
  char *v131;
  id v132;
  xpc_object_t xdict;
  xpc_object_t xdicta;
  _xpc_connection_s *v135;
  id v136;
  id v137;
  _xpc_connection_s *v138;
  id v139;
  void *context;
  uint8_t v141[4];
  size_t v142;
  __int16 v143;
  unsigned int v144;
  __int16 v145;
  id v146;
  __int16 v147;
  char *v148;
  _BYTE buf[32];
  id v150;
  uint8_t v151[32];
  __int128 v152;
  __int128 v153;
  _BYTE v154[24];

  v3 = a2;
  v4 = *(void **)(a1 + 40);
  v5 = *(id *)(a1 + 32);
  v6 = v4;
  v7 = v3;
  context = objc_autoreleasePoolPush();
  if (xpc_get_type(v7) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_connection_cancel(v6);
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "device_peers"));
    objc_msgSend(v10, "removeObject:", v6);
LABEL_32:

    goto LABEL_33;
  }
  string = xpc_dictionary_get_string(v7, "cmd");
  if (!string)
  {
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
      sub_100038CB0();
    if (xpc_dictionary_expects_reply(v7))
      goto LABEL_25;
    goto LABEL_33;
  }
  v9 = string;
  if (!strcmp(string, "helo_device"))
  {
    v10 = v5;
    v15 = v6;
    if (xpc_dictionary_get_uint64(v7, "device_state") == 1
      && objc_msgSend(v10, "state") - 3 <= 2)
    {
      v16 = xpc_dictionary_create(0, 0, 0);
      sub_1000213A8(v10, v15, v16);
      xpc_connection_send_message(v15, v16);

    }
    goto LABEL_32;
  }
  if (!strcmp(v9, "heartbeat"))
  {
    v17 = v5;
    v18 = v7;
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heartbeat_requests"));
    v20 = objc_msgSend(v19, "count");

    if (!v20)
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_10002256C;
      *(_QWORD *)&buf[24] = &unk_100051A30;
      v150 = v17;
      objc_msgSend(v150, "heartbeatWithCallback:", buf);

    }
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "heartbeat_requests"));
    objc_msgSend(v21, "addObject:", v18);

  }
  else if (!strcmp(v9, "timesync"))
  {
    v22 = v5;
    v23 = v6;
    v24 = v7;
    *(_QWORD *)&v25 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v25 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)v151 = v25;
    *(_OWORD *)&v151[16] = v25;
    xpc_connection_get_audit_token(v23, v151);
    v26 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.device-admin", v151);
    v27 = v26 == 0;

    if (v27)
    {
      v29 = sub_10001ECF4(v24, 1);
      v28 = (id)objc_claimAutoreleasedReturnValue(v29);
      v30 = sub_100016F70(v23);
      v31 = qword_100057E98;
      if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136315138;
        *(_QWORD *)&buf[4] = v30;
        _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "device_timesync: Client lacks privilege (client=\"%s\")", buf, 0xCu);
      }
      free(v30);
      xpc_dictionary_send_reply(v28);
    }
    else
    {
      *(_QWORD *)buf = _NSConcreteStackBlock;
      *(_QWORD *)&buf[8] = 3221225472;
      *(_QWORD *)&buf[16] = sub_1000226C4;
      *(_QWORD *)&buf[24] = &unk_100051600;
      v150 = v24;
      objc_msgSend(v22, "timesyncWithCallback:", buf);
      v28 = v150;
    }

  }
  else
  {
    if ((xpc_dictionary_expects_reply(v7) & 1) != 0)
    {
      if (!strcmp(v9, "list_services"))
      {
        v137 = v5;
        v32 = v7;
        remote_connection = xpc_dictionary_get_remote_connection(v32);
        v135 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
        xdict = xpc_dictionary_create_reply(v32);
        v34 = sub_100016F70(v135);
        v35 = (id)qword_100057E98;
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          sub_100038CDC((uint64_t)objc_msgSend(v137, "uuidString"), (uint64_t)v34, (uint64_t)v154);

        free(v34);
        xpc_dictionary_set_string(xdict, "result", "OK");
        v36 = xpc_array_create(0, 0);
        v152 = 0u;
        v153 = 0u;
        memset(v151, 0, sizeof(v151));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "services"));
        v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", v151, buf, 16);
        if (v38)
        {
          v39 = **(_QWORD **)&v151[16];
          do
          {
            for (i = 0; i != v38; i = (char *)i + 1)
            {
              if (**(_QWORD **)&v151[16] != v39)
                objc_enumerationMutation(v37);
              v41 = *(void **)(*(_QWORD *)&v151[8] + 8 * (_QWORD)i);
              if (sub_10002271C(v32, v41))
                xpc_array_set_string(v36, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v41, "name"));
            }
            v38 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", v151, buf, 16);
          }
          while (v38);
        }

        xpc_dictionary_set_value(xdict, "services", v36);
        v42 = sub_100016F70(v135);
        v43 = (id)qword_100057E98;
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          count = xpc_array_get_count(v36);
          v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "services"));
          *(_DWORD *)v141 = 134218754;
          v142 = count;
          v143 = 1024;
          v144 = objc_msgSend(v45, "count");
          v145 = 2082;
          v146 = objc_msgSend(v137, "uuidString");
          v147 = 2080;
          v148 = v42;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "device_list_services: Returning %zd/%d services for device %{public}s (client=\"%s\")", v141, 0x26u);

        }
        free(v42);

        reply = xdict;
        goto LABEL_26;
      }
      if (!strcmp(v9, "list_local_services"))
      {
        xdicta = v5;
        v136 = v7;
        v46 = xpc_dictionary_get_remote_connection(v136);
        v138 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v46);
        if (sub_100022854(v136))
        {
          reply = xpc_dictionary_create_reply(v136);
          v47 = sub_100016F70(v138);
          v48 = (id)qword_100057E98;
          if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            sub_100038D18((uint64_t)objc_msgSend(xdicta, "uuidString"), (uint64_t)v47, (uint64_t)v141);

          free(v47);
          v49 = xpc_array_create(0, 0);
          v152 = 0u;
          v153 = 0u;
          memset(v151, 0, sizeof(v151));
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(xdicta, "service_listeners"));
          v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", v151, buf, 16);
          if (v51)
          {
            v52 = **(_QWORD **)&v151[16];
            do
            {
              for (j = 0; j != v51; j = (char *)j + 1)
              {
                if (**(_QWORD **)&v151[16] != v52)
                  objc_enumerationMutation(v50);
                v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*(_QWORD *)&v151[8]
                                                                                   + 8 * (_QWORD)j), "service", xdicta));
                xpc_array_set_string(v49, 0xFFFFFFFFFFFFFFFFLL, (const char *)objc_msgSend(v54, "name"));

              }
              v51 = objc_msgSend(v50, "countByEnumeratingWithState:objects:count:", v151, buf, 16);
            }
            while (v51);
          }

          xpc_dictionary_set_value(reply, "services", v49);
          xpc_dictionary_set_string(reply, "result", "OK");

        }
        else
        {
          v66 = sub_100016F70(v138);
          v67 = qword_100057E98;
          if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v66;
            _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_DEFAULT, "device_list_local_services: Client lacks privilege (client=\"%s\")", buf, 0xCu);
          }
          free(v66);
          v68 = sub_1000047A8(v136, "ERROR");
          reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v68);
        }

        goto LABEL_26;
      }
      if (strcmp(v9, "get_service"))
      {
        if (!strcmp(v9, "check_service"))
        {
          v69 = v5;
          v70 = (_xpc_connection_s *)v7;
          v71 = xpc_dictionary_get_remote_connection(v70);
          v72 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v71);
          v73 = xpc_dictionary_get_string(v70, "name");
          if (v73)
          {
            v74 = v73;
            v75 = sub_100016F70(v72);
            v76 = (id)qword_100057E98;
            if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 136446722;
              *(_QWORD *)&buf[4] = v74;
              *(_WORD *)&buf[12] = 2082;
              *(_QWORD *)&buf[14] = objc_msgSend(v69, "uuidString");
              *(_WORD *)&buf[22] = 2080;
              *(_QWORD *)&buf[24] = v75;
              _os_log_debug_impl((void *)&_mh_execute_header, v76, OS_LOG_TYPE_DEBUG, "Fetching service %{public}s on %{public}s (client=\"%s\")", buf, 0x20u);
            }

            free(v75);
            v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "serviceWithName:", v74));
            if (v77)
            {
              reply = xpc_dictionary_create_reply(v70);
              xpc_dictionary_set_string(reply, "result", "OK");
            }
            else
            {
              v100 = sub_100016F70(v72);
              v101 = qword_100057E98;
              if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446466;
                *(_QWORD *)&buf[4] = v74;
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = v100;
                _os_log_impl((void *)&_mh_execute_header, v101, OS_LOG_TYPE_DEFAULT, "device_check_service: Unable to find service with name %{public}s (client=\"%s\")", buf, 0x16u);
              }
              free(v100);
              v102 = sub_1000047A8(v70, "ERROR");
              reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v102);
            }

          }
          else
          {
            if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
              sub_100038D80();
            v83 = sub_1000047A8(v70, "ERROR");
            reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v83);
          }
          goto LABEL_156;
        }
        if (!strcmp(v9, "get_heartbeat_stats"))
        {
          v78 = v5;
          reply = xpc_dictionary_create_reply(v7);
          xpc_dictionary_set_string(reply, "result", "OK");
          v79 = objc_msgSend(v78, "heartbeat_stats");

          xpc_dictionary_set_data(reply, "heartbeat_stats", v79, 0x30uLL);
          goto LABEL_26;
        }
        if (!strcmp(v9, "get_connectable"))
        {
          v81 = v5;
          reply = xpc_dictionary_create_reply(v7);
          v82 = objc_msgSend(v81, "connectable");

          xpc_dictionary_set_BOOL(reply, "result", v82);
          goto LABEL_26;
        }
        if (!strcmp(v9, "reset"))
        {
          v88 = v5;
          v89 = v7;
          v90 = xpc_dictionary_get_remote_connection(v89);
          v91 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v90);
          v92 = v89;
          if (xpc_get_type(v92) != (xpc_type_t)&_xpc_type_dictionary)
            sub_100038DAC(v151, buf);
          *(_QWORD *)&v93 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v93 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)buf = v93;
          *(_OWORD *)&buf[16] = v93;
          xpc_dictionary_get_audit_token(v92, buf);
          v94 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.device-admin", buf);
          v95 = v94 == 0;

          v96 = sub_100016F70(v91);
          v97 = qword_100057E98;
          if (v95)
          {
            if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315138;
              *(_QWORD *)&buf[4] = v96;
              _os_log_impl((void *)&_mh_execute_header, v97, OS_LOG_TYPE_DEFAULT, "device_reset: Client lacks privilege to reset device (client=\"%s\")", buf, 0xCu);
            }
            free(v96);
            v113 = sub_1000047A8(v92, "ERROR");
            reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v113);
          }
          else
          {
            v98 = (id)qword_100057E98;
            if (os_log_type_enabled(v98, OS_LOG_TYPE_INFO))
            {
              v99 = objc_msgSend(v88, "uuidString");
              *(_DWORD *)buf = 136446466;
              *(_QWORD *)&buf[4] = v99;
              *(_WORD *)&buf[12] = 2080;
              *(_QWORD *)&buf[14] = v96;
              _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_INFO, "Resetting remote device %{public}s (client=\"%s\")", buf, 0x16u);
            }

            free(v96);
            objc_msgSend(v88, "reset");
            reply = xpc_dictionary_create_reply(v92);
            xpc_dictionary_set_string(reply, "result", "OK");
          }

          goto LABEL_26;
        }
        if (!strcmp(v9, "set_alias"))
        {
          v69 = v5;
          v70 = v6;
          v72 = (_xpc_connection_s *)v7;
          *(_QWORD *)&v103 = 0xAAAAAAAAAAAAAAAALL;
          *((_QWORD *)&v103 + 1) = 0xAAAAAAAAAAAAAAAALL;
          *(_OWORD *)buf = v103;
          *(_OWORD *)&buf[16] = v103;
          xpc_connection_get_audit_token(v70, buf);
          v104 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.device-admin", buf);
          v105 = v104 == 0;

          if (v105)
          {
            v116 = sub_100016F70(v70);
            v117 = qword_100057E98;
            if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v151 = 136315138;
              *(_QWORD *)&v151[4] = v116;
              _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "device_set_alias: Client lacks privilege to name device (client=\"%s\")", v151, 0xCu);
            }
            free(v116);
            v118 = sub_1000047A8(v72, "ERROR");
            v119 = objc_claimAutoreleasedReturnValue(v118);
          }
          else
          {
            v106 = xpc_dictionary_get_string(v72, "device_alias");
            if (v106)
            {
              v107 = sub_100016F70(v70);
              v108 = (id)qword_100057E98;
              if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
              {
                v109 = objc_msgSend(v69, "uuidString");
                *(_DWORD *)v151 = 136446722;
                *(_QWORD *)&v151[4] = v109;
                *(_WORD *)&v151[12] = 2082;
                *(_QWORD *)&v151[14] = v106;
                *(_WORD *)&v151[22] = 2080;
                *(_QWORD *)&v151[24] = v107;
                _os_log_impl((void *)&_mh_execute_header, v108, OS_LOG_TYPE_INFO, "setting remote device %{public}s alias as %{public}s (client=\"%s\")", v151, 0x20u);
              }

              free(v107);
              objc_msgSend(v69, "setDevice_alias:", v106);
              reply = xpc_dictionary_create_reply(v72);
              xpc_dictionary_set_string(reply, "result", "OK");
              goto LABEL_156;
            }
            if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
              sub_100038E34();
            v128 = sub_1000047A8(v72, "ERROR");
            v119 = objc_claimAutoreleasedReturnValue(v128);
          }
          reply = (xpc_object_t)v119;
        }
        else
        {
          if (!strcmp(v9, "disconnect_device"))
          {
            v69 = v5;
            v70 = (_xpc_connection_s *)v7;
            v110 = xpc_dictionary_get_remote_connection(v70);
            v72 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v110);
            if (objc_msgSend(v69, "type") - 14 >= 3)
            {
              v120 = (void *)qword_100057E98;
              if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
                sub_100038E60(v120, v69);
              v121 = sub_10001ECF4(v70, 1);
              reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v121);
            }
            else
            {
              v111 = sub_100016F70(v72);
              v112 = (id)qword_100057E98;
              if (os_log_type_enabled(v112, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 136446466;
                *(_QWORD *)&buf[4] = objc_msgSend(v69, "device_name");
                *(_WORD *)&buf[12] = 2080;
                *(_QWORD *)&buf[14] = v111;
                _os_log_impl((void *)&_mh_execute_header, v112, OS_LOG_TYPE_DEFAULT, "Disconnecting remote device %{public}s (client=\"%s\")", buf, 0x16u);
              }

              free(v111);
              if (objc_msgSend(v69, "state") == 3)
              {
                *(_QWORD *)buf = _NSConcreteStackBlock;
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = sub_100022900;
                *(_QWORD *)&buf[24] = &unk_100051600;
                v150 = v69;
                objc_msgSend(v150, "goodByeWithCallback:", buf);

              }
              else
              {
                objc_msgSend(v69, "disconnect");
              }
              reply = xpc_dictionary_create_reply(v70);
              xpc_dictionary_set_string(reply, "result", "OK");
            }
            goto LABEL_156;
          }
          if (!strcmp(v9, "get_latest_connect_error"))
          {
            v114 = v5;
            reply = xpc_dictionary_create_reply(v7);
            v115 = objc_msgSend(v114, "latestConnectError");

            xpc_dictionary_set_int64(reply, "result", v115);
            goto LABEL_26;
          }
          if (strcmp(v9, "authenticate_device"))
          {
            if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
              sub_10003900C();
LABEL_25:
            v11 = sub_1000047A8(v7, "ERROR");
            reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v11);
            goto LABEL_26;
          }
          v69 = v5;
          v70 = v6;
          v72 = (_xpc_connection_s *)v7;
          *(_QWORD *)v151 = 0;
          v122 = sub_100016F70(v70);
          v123 = qword_100057E98;
          if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136315138;
            *(_QWORD *)&buf[4] = v122;
            _os_log_impl((void *)&_mh_execute_header, v123, OS_LOG_TYPE_DEFAULT, "Authenticating device certificate on behalf of client... (client=\"%s\")", buf, 0xCu);
          }
          free(v122);
          data = xpc_dictionary_get_data(v72, "identity_cert", (size_t *)v151);
          if (data)
          {
            v125 = (__SecCertificate *)SecCertificateCreateWithBytes(0, data, *(_QWORD *)v151);
            if (v125)
            {
              if ((sub_10001A25C(v69, v125) & 1) != 0)
              {
                v126 = sub_100016F70(v70);
                v127 = qword_100057E98;
                if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 136315138;
                  *(_QWORD *)&buf[4] = v126;
                  _os_log_impl((void *)&_mh_execute_header, v127, OS_LOG_TYPE_DEFAULT, "Successfully authenticated device certificate on behalf of client (client=\"%s\")", buf, 0xCu);
                }
                free(v126);
                reply = xpc_dictionary_create_reply(v72);
                xpc_dictionary_set_string(reply, "result", "OK");
              }
              else
              {
                v131 = sub_100016F70(v70);
                if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
                  sub_100038FAC();
                free(v131);
                v132 = sub_1000047A8(v72, "ERROR");
                reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v132);
              }
              CFRelease(v125);
              goto LABEL_156;
            }
            v129 = sub_100016F70(v70);
            if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
              sub_100038F4C();
          }
          else
          {
            v129 = sub_100016F70(v70);
            if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
              sub_100038EEC();
          }
          free(v129);
          v130 = sub_1000047A8(v72, "ERROR");
          reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v130);
        }
LABEL_156:

LABEL_26:
        if (reply)
        {
          v13 = xpc_dictionary_get_remote_connection(reply);
          v14 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v13);
          xpc_connection_send_message(v14, reply);

        }
        goto LABEL_33;
      }
      v139 = v5;
      v55 = v7;
      v56 = xpc_dictionary_get_remote_connection(v55);
      v57 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(v56);
      v58 = xpc_dictionary_get_string(v55, "name");
      if (!v58)
      {
        if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
          sub_100038D54();
        v80 = sub_1000047A8(v55, "ERROR");
        reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v80);
        goto LABEL_102;
      }
      v59 = v58;
      v60 = sub_100016F70(v57);
      v61 = (id)qword_100057E98;
      if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 136446722;
        *(_QWORD *)&buf[4] = v59;
        *(_WORD *)&buf[12] = 2082;
        *(_QWORD *)&buf[14] = objc_msgSend(v139, "uuidString");
        *(_WORD *)&buf[22] = 2080;
        *(_QWORD *)&buf[24] = v60;
        _os_log_debug_impl((void *)&_mh_execute_header, v61, OS_LOG_TYPE_DEBUG, "Fetching service %{public}s on %{public}s (client=\"%s\")", buf, 0x20u);
      }

      free(v60);
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v139, "serviceWithName:", v59));
      if (v62)
      {
        if (sub_10002271C(v55, v62))
        {
          reply = xpc_dictionary_create_reply(v55);
          xpc_dictionary_set_string(reply, "result", "OK");
          v63 = objc_msgSend(v62, "copyClientDescription");
          xpc_dictionary_set_value(reply, "service", v63);

          v64 = sub_100016F70(v57);
          v65 = qword_100057E98;
          if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 136446466;
            *(_QWORD *)&buf[4] = v59;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = v64;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "device_get_service: Returning service \"%{public}s\" (client=\"%s\")", buf, 0x16u);
          }
          free(v64);
          goto LABEL_101;
        }
        v84 = sub_100016F70(v57);
        v86 = qword_100057E98;
        if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = v59;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v84;
          _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "device_get_service: Client lacks privilege to find service with name %{public}s (client=\"%s\")", buf, 0x16u);
        }
      }
      else
      {
        v84 = sub_100016F70(v57);
        v85 = qword_100057E98;
        if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 136446466;
          *(_QWORD *)&buf[4] = v59;
          *(_WORD *)&buf[12] = 2080;
          *(_QWORD *)&buf[14] = v84;
          _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "device_get_service: Unable to find service with name %{public}s (client=\"%s\")", buf, 0x16u);
        }
      }
      free(v84);
      v87 = sub_1000047A8(v55, "ERROR");
      reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v87);
LABEL_101:

LABEL_102:
      goto LABEL_26;
    }
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
      sub_100039038();
  }
LABEL_33:
  objc_autoreleasePoolPop(context);

}

void sub_100020FD4(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

id sub_100021144(uint64_t a1, xpc_object_t object)
{
  _xpc_connection_s *v3;
  char *v4;
  NSObject *v5;
  int v7;
  char *v8;

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    v3 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));
    v4 = sub_100016F70(v3);

    v5 = qword_100057E98;
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_INFO))
    {
      v7 = 136315138;
      v8 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "Unregistering client browse. (client=\"%s\")", (uint8_t *)&v7, 0xCu);
    }
    free(v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
  {
    sub_100039064();
  }
  return objc_msgSend(*(id *)(a1 + 32), "cancel");
}

void sub_1000213A8(void *a1, void *a2, void *a3)
{
  id v5;
  _xpc_connection_s *v6;
  id v7;
  _BOOL8 v8;
  char *v9;
  NSObject *v10;
  id v11;

  v5 = a3;
  v6 = a2;
  v7 = a1;
  v8 = sub_1000224D0((uint64_t)v6);
  v9 = sub_100016F70(v6);

  v10 = qword_100057E98;
  if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEBUG))
    sub_100039090(v8, (uint64_t)v9, v10);
  free(v9);
  xpc_dictionary_set_string(v5, "cmd", "found_device");
  v11 = objc_msgSend(v7, "copyClientDescriptionWithSensitiveProperties:", v8);

  xpc_dictionary_set_value(v5, "device", v11);
}

void sub_100021570(uint64_t a1)
{
  _xpc_connection_s *v1;

  v1 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));
  xpc_connection_cancel(v1);

}

void sub_1000215E0(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v1 = a1;
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = (id)qword_100057EA8;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "deliverDevice:", v1, (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void sub_1000216DC(void *a1)
{
  id v1;
  NSObject *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  xpc_object_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  uint8_t buf[8];
  _BYTE v15[128];

  v1 = a1;
  v2 = qword_100057E98;
  if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Delivering device update", buf, 2u);
  }
  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "device_peers", 0));
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v11;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)v7);
        v9 = xpc_dictionary_create(0, 0, 0);
        sub_1000213A8(v1, v8, v9);
        xpc_connection_send_message((xpc_connection_t)v8, v9);

        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    }
    while (v5);
  }

}

void sub_10002184C(void *a1)
{
  void *v1;
  _xpc_connection_s *v2;
  id v3;

  v3 = a1;
  v1 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device_listener"));

  if (v1)
  {
    v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "device_listener"));
    xpc_connection_cancel(v2);

    objc_msgSend(v3, "setDevice_listener:", 0);
  }

}

void sub_1000218B0(void *a1)
{
  id v1;
  id v2;
  void *v3;
  void *v4;
  os_log_t v5;
  void *v6;
  xpc_connection_t mach_service;
  void *v8;
  id v9;

  v1 = a1;
  v2 = objc_alloc_init((Class)NSMutableSet);
  v3 = (void *)qword_100057EA8;
  qword_100057EA8 = (uint64_t)v2;

  v4 = (void *)qword_100057EA0;
  qword_100057EA0 = (uint64_t)v1;
  v9 = v1;

  v5 = os_log_create("com.apple.RemoteServiceDiscovery", "ClientInterface");
  v6 = (void *)qword_100057E98;
  qword_100057E98 = (uint64_t)v5;

  mach_service = xpc_connection_create_mach_service("com.apple.remoted", (dispatch_queue_t)qword_100057EA0, 1uLL);
  v8 = (void *)qword_100057EB0;
  qword_100057EB0 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_100057EB0, &stru_100051A08);
  xpc_connection_activate((xpc_connection_t)qword_100057EB0);

}

void sub_100021978(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  OS_xpc_object *v3;
  _QWORD handler[4];
  OS_xpc_object *v5;

  v2 = a2;
  if (xpc_get_type(v2) != (xpc_type_t)&_xpc_type_error)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100021A18;
    handler[3] = &unk_100050F08;
    v3 = v2;
    v5 = v3;
    xpc_connection_set_event_handler(v3, handler);
    xpc_connection_set_target_queue(v3, (dispatch_queue_t)qword_100057EA0);
    xpc_connection_activate(v3);

  }
}

void sub_100021A18(uint64_t a1, void *a2)
{
  id v3;
  _xpc_connection_s *v4;
  id v5;
  void *v6;
  const char *string;
  const char *v8;
  id v9;
  uint64_t v10;
  id v11;
  xpc_object_t reply;
  xpc_object_t v13;
  xpc_connection_t v14;
  xpc_object_t v15;
  _BOOL4 v16;
  char *v17;
  NSObject *v18;
  _BOOL4 v19;
  const char *v20;
  BrowseRegistration *v21;
  BrowseRegistration *v22;
  char *v23;
  NSObject *v24;
  char *v25;
  NSObject *v26;
  id v27;
  void *v28;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v30;
  _xpc_connection_s *v31;
  BrowseRegistration *v32;
  _xpc_connection_s *v33;
  id v34;
  id v35;
  id v36;
  uint64_t v37;
  void *i;
  xpc_object_t v39;
  id v40;
  id v41;
  id v42;
  uint64_t v43;
  void *j;
  xpc_object_t v45;
  xpc_object_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  uint8_t v55[4];
  char *v56;
  __int128 buf;
  void *v58;
  void *v59;
  BrowseRegistration *v60;
  _xpc_connection_s *v61;
  Block_layout *v62;

  v3 = a2;
  v4 = (_xpc_connection_s *)*(id *)(a1 + 32);
  v5 = v3;
  v6 = objc_autoreleasePoolPush();
  if (xpc_get_type(v5) == (xpc_type_t)&_xpc_type_error)
  {
    xpc_connection_cancel(v4);
    goto LABEL_40;
  }
  if ((xpc_dictionary_expects_reply(v5) & 1) != 0)
  {
    string = xpc_dictionary_get_string(v5, "cmd");
    if (!string)
    {
      if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
        sub_1000391E8();
      goto LABEL_19;
    }
    v8 = string;
    if (strcmp(string, "browse"))
    {
      if (!strcmp(v8, "get_unique_device") || !strcmp(v8, "get_device"))
      {
        v11 = sub_10002295C(v4, v5);
        v10 = objc_claimAutoreleasedReturnValue(v11);
        goto LABEL_21;
      }
      if (!strcmp(v8, "get_local_device_description"))
      {
        reply = xpc_dictionary_create_reply(v5);
        v13 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_string(reply, "result", "OK");
        xpc_dictionary_set_uint64(v13, "device_messaging_protocol_version", 5uLL);
        xpc_dictionary_set_uuid(v13, "UUID", (const unsigned __int8 *)&xmmword_100057FE8);
        xpc_dictionary_set_value(v13, "properties", (xpc_object_t)qword_100057FF8);
        xpc_dictionary_set_value(reply, "device", v13);
        goto LABEL_37;
      }
      if (!strcmp(v8, "get_local_device_identity"))
      {
        v31 = v4;
        *(_QWORD *)&buf = _NSConcreteStackBlock;
        *((_QWORD *)&buf + 1) = 3221225472;
        v58 = sub_100023290;
        v59 = &unk_100051AC8;
        v60 = (BrowseRegistration *)v5;
        v61 = v31;
        v62 = &stru_100051A50;
        v32 = v60;
        v33 = v31;
        sub_100019018(0, &buf);

        goto LABEL_40;
      }
      if (!strcmp(v8, "delete_local_device_identity"))
      {
        reply = xpc_dictionary_create_reply(v5);
        sub_100018D1C();
      }
      else
      {
        if (strcmp(v8, "create_local_device_identity"))
        {
          if (strcmp(v8, "list_local_device_services"))
          {
            if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
              sub_10003927C();
LABEL_19:
            v9 = sub_1000047A8(v5, "ERROR");
            v10 = objc_claimAutoreleasedReturnValue(v9);
LABEL_21:
            reply = (xpc_object_t)v10;
LABEL_38:
            v27 = reply;
            if (!v27)
              sub_100039180(v55, &buf);
            v28 = v27;

            remote_connection = xpc_dictionary_get_remote_connection(v28);
            v30 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
            xpc_connection_send_message(v30, v28);

            goto LABEL_40;
          }
          v13 = v5;
          reply = xpc_dictionary_create_reply(v13);
          v15 = xpc_array_create(0, 0);
          if (sub_100022854(v13))
          {
            v46 = v13;
            xpc_dictionary_set_string(reply, "result", "OK");
            v53 = 0u;
            v54 = 0u;
            v51 = 0u;
            v52 = 0u;
            v34 = (id)qword_100058000;
            v35 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, &buf, 16);
            if (v35)
            {
              v36 = v35;
              v37 = *(_QWORD *)v52;
              do
              {
                for (i = 0; i != v36; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v52 != v37)
                    objc_enumerationMutation(v34);
                  v39 = xpc_string_create((const char *)objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * (_QWORD)i), "name"));
                  xpc_array_append_value(v15, v39);

                }
                v36 = objc_msgSend(v34, "countByEnumeratingWithState:objects:count:", &v51, &buf, 16);
              }
              while (v36);
            }

            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            v40 = (id)qword_100058008;
            v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
            if (v41)
            {
              v42 = v41;
              v43 = *(_QWORD *)v48;
              do
              {
                for (j = 0; j != v42; j = (char *)j + 1)
                {
                  if (*(_QWORD *)v48 != v43)
                    objc_enumerationMutation(v40);
                  v45 = xpc_string_create((const char *)objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)j), "name"));
                  xpc_array_append_value(v15, v45);

                }
                v42 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v47, v55, 16);
              }
              while (v42);
            }

            xpc_dictionary_set_value(reply, "services", v15);
            v13 = v46;
          }
          else
          {
            xpc_dictionary_set_string(reply, "result", "ERROR");
          }
          goto LABEL_36;
        }
        reply = xpc_dictionary_create_reply(v5);
        sub_100018290();
      }
      xpc_dictionary_set_string(reply, "result", "OK");
      goto LABEL_38;
    }
    v13 = v5;
    v14 = xpc_dictionary_get_remote_connection(v13);
    v15 = (xpc_object_t)objc_claimAutoreleasedReturnValue(v14);
    v16 = xpc_dictionary_get_BOOL(v13, "present_only");
    v17 = sub_100016F70((_xpc_connection_s *)v15);
    v18 = qword_100057E98;
    v19 = os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_INFO);
    if (v16)
    {
      if (v19)
      {
        LODWORD(buf) = 136315138;
        *(_QWORD *)((char *)&buf + 4) = v17;
        v20 = "Registering client browse (present-only). (client=\"%s\")";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, v20, (uint8_t *)&buf, 0xCu);
      }
    }
    else if (v19)
    {
      LODWORD(buf) = 136315138;
      *(_QWORD *)((char *)&buf + 4) = v17;
      v20 = "Registering client browse. (client=\"%s\")";
      goto LABEL_27;
    }
    free(v17);
    v21 = -[BrowseRegistration initWithRequest:]([BrowseRegistration alloc], "initWithRequest:", v13);
    if (!v21)
      sub_100039214(v55, &buf);
    *(_QWORD *)&buf = _NSConcreteStackBlock;
    *((_QWORD *)&buf + 1) = 3221225472;
    v58 = sub_100022E70;
    v59 = &unk_100051A78;
    v22 = v21;
    v60 = v22;
    sub_100005B68(&buf);
    v23 = sub_100016F70((_xpc_connection_s *)v15);
    v24 = qword_100057E98;
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v55 = 136315138;
      v56 = v23;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Completed immediate devices. (client=\"%s\")", v55, 0xCu);
    }
    free(v23);
    if (v16)
    {
      -[BrowseRegistration cancel](v22, "cancel");
      v25 = sub_100016F70((_xpc_connection_s *)v15);
      v26 = qword_100057E98;
      if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v55 = 136315138;
        v56 = v25;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Completed client browse (present-only). (client=\"%s\")", v55, 0xCu);
      }
      free(v25);
    }
    reply = xpc_dictionary_create_reply(v13);
    xpc_dictionary_set_string(reply, "cmd", "browse");
    xpc_dictionary_set_string(reply, "result", "OK");

LABEL_36:
LABEL_37:

    goto LABEL_38;
  }
  if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
    sub_1000392A8();
LABEL_40:
  objc_autoreleasePoolPop(v6);

}

BOOL sub_1000221E8(const char *a1)
{
  return !strcmp(a1, "AppleInternal") && (os_variant_has_internal_content("com.apple.RemoteServiceDiscovery") & 1) != 0;
}

void sub_100022224(uint64_t a1)
{
  id *v2;
  void *v3;
  unsigned int v4;
  id v5;
  xpc_object_t reply;
  xpc_object_t value;
  void *v8;
  void *v9;
  uint64_t uint64;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v16;
  char *v17;
  NSObject *v18;
  id v19;
  void *v20;
  id v21;
  __int128 v22;
  uint64_t v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  char *v27;

  v2 = (id *)(a1 + 32);
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "device"));
  v4 = objc_msgSend(v3, "state");

  if (v4 == 5)
  {
    v5 = sub_1000047A8(*(void **)(a1 + 40), "ERROR");
    reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v5);
  }
  else
  {
    v22 = xmmword_1000410A8;
    LODWORD(v23) = 8;
    value = xpc_dictionary_get_value(*(xpc_object_t *)(a1 + 40), "keepalive");
    v8 = (void *)objc_claimAutoreleasedReturnValue(value);
    v9 = v8;
    if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL)
      LOBYTE(v22) = xpc_BOOL_get_value(v9);
    uint64 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "keepalive_time");
    if (uint64)
      DWORD1(v22) = uint64;
    v11 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "keepcount");
    if (v11)
      DWORD2(v22) = v11;
    v12 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "keepinterval");
    if (v12)
      HIDWORD(v22) = v12;
    v13 = xpc_dictionary_get_uint64(*(xpc_object_t *)(a1 + 40), "connect_timeout");
    if (v13)
      LODWORD(v23) = v13;
    v14 = objc_msgSend(*v2, "getSocketWithTcpOption:", &v22);
    if (v14 < 0)
    {
      v20 = (void *)qword_100057E98;
      if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
        sub_1000392D4(v2, v20);
      v21 = sub_1000047A8(*(void **)(a1 + 40), "INTERRUPTED");
      reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v21);
    }
    else
    {
      remote_connection = xpc_dictionary_get_remote_connection(*(xpc_object_t *)(a1 + 40));
      v16 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      v17 = sub_100016F70(v16);
      v18 = (id)qword_100057E98;
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = objc_msgSend(*v2, "name", v22, v23);
        *(_DWORD *)buf = 136446466;
        v25 = v19;
        v26 = 2080;
        v27 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%{public}s> Connect succeeded (client=\"%s\")", buf, 0x16u);
      }

      free(v17);
      reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
      xpc_dictionary_set_string(reply, "result", "OK");
      xpc_dictionary_set_fd(reply, "fd", v14);
      close(v14);

    }
  }
  xpc_dictionary_send_reply(reply);

}

void sub_1000224B4(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

BOOL sub_1000224D0(uint64_t a1)
{
  __int128 v1;
  void *v2;
  void *v3;
  _BOOL8 result;
  _OWORD v5[2];
  __int128 v6;
  __int128 v7;

  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v6 = v1;
  v7 = v1;
  xpc_connection_get_audit_token(a1, &v6);
  v2 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.device-admin", &v6);

  result = 0;
  if (v2)
  {
    v3 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.allow-sandbox", &v6);

    if (v3)
      return 1;
    v5[0] = v6;
    v5[1] = v7;
    if (!sandbox_check_by_audit_token(v5, "forbidden-remote-device-admin", SANDBOX_CHECK_NO_REPORT))
      return 1;
  }
  return result;
}

void sub_10002256C(uint64_t a1, int a2)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  const char *v8;
  void *v9;
  xpc_object_t reply;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "heartbeat_requests", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    if (a2)
      v8 = "OK";
    else
      v8 = "ERROR";
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        reply = xpc_dictionary_create_reply(*(xpc_object_t *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9));
        xpc_dictionary_set_string(reply, "result", v8);
        xpc_dictionary_send_reply(reply);

        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "heartbeat_requests"));
  objc_msgSend(v11, "removeAllObjects");

}

void sub_1000226C4(uint64_t a1, int a2)
{
  void *v2;
  id v3;
  uint64_t v4;
  id reply;
  id v6;

  v2 = *(void **)(a1 + 32);
  if (a2)
  {
    v3 = sub_10001ECF4(v2, a2);
    v4 = objc_claimAutoreleasedReturnValue(v3);
  }
  else
  {
    reply = xpc_dictionary_create_reply(v2);
    xpc_dictionary_set_string(reply, "result", "OK");
    v4 = (uint64_t)reply;
  }
  v6 = (id)v4;
  xpc_dictionary_send_reply(v4);

}

BOOL sub_10002271C(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *v5;
  const char *v6;
  __int128 v7;
  void *v8;
  void *v9;
  _BOOL8 v10;
  void *v12;
  uint64_t v13;
  _OWORD v14[5];

  v3 = a1;
  v4 = a2;
  v5 = (const char *)objc_msgSend(v4, "entitlement");
  if (!v5)
    sub_10003935C(&v13, v14);
  v6 = v5;
  if (!strcmp(v5, "None-AppleInternal") || sub_1000221E8(v6))
    goto LABEL_7;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_dictionary)
    sub_1000393C4(&v13, v14);
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14[0] = v7;
  v14[1] = v7;
  xpc_dictionary_get_audit_token(v3, v14);
  v8 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.device-admin", v14);

  if (v8
    || (v9 = (void *)xpc_copy_entitlement_for_token("com.apple.private.network.intcoproc.restricted", v14),
        v9,
        v9))
  {
LABEL_7:
    v10 = 1;
  }
  else
  {
    v12 = (void *)xpc_copy_entitlement_for_token(v6, v14);
    v10 = v12 != 0;

  }
  return v10;
}

BOOL sub_100022854(void *a1)
{
  id v1;
  __int128 v2;
  void *v3;
  _BOOL8 v4;
  uint64_t v6;
  _OWORD v7[5];

  v1 = a1;
  if (xpc_get_type(v1) != (xpc_type_t)&_xpc_type_dictionary)
    sub_1000393C4(&v6, v7);
  *(_QWORD *)&v2 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v2 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v7[0] = v2;
  v7[1] = v2;
  xpc_dictionary_get_audit_token(v1, v7);
  v3 = (void *)xpc_copy_entitlement_for_token("com.apple.private.RemoteServiceDiscovery.device-admin", v7);
  v4 = v3 != 0;

  return v4;
}

id sub_100022900(uint64_t a1, int a2)
{
  NSObject *v4;

  if (a2)
  {
    v4 = qword_100057E98;
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
      sub_10003942C(a2, v4);
  }
  return objc_msgSend(*(id *)(a1 + 32), "disconnect");
}

id sub_10002295C(void *a1, void *a2)
{
  _xpc_connection_s *v3;
  id v4;
  unsigned int uint64;
  const char *string;
  const uint8_t *uuid;
  const char *v8;
  _BOOL4 v9;
  int v10;
  const char *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  xpc_object_t reply;
  _BOOL8 v18;
  void *v19;
  uint8_t *v20;
  id v21;
  void *v22;
  id v23;
  char *v24;
  NSObject *v25;
  unsigned int v26;
  char *v27;
  NSObject *v28;
  id v29;
  _QWORD v31[9];
  unsigned int v32;
  BOOL v33;
  uint64_t v34;
  uint8_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  uint8_t buf[4];
  unsigned int v41;
  __int16 v42;
  char *v43;
  uint8_t v44[8];
  uint8_t *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v3 = a1;
  v4 = a2;
  uint64 = xpc_dictionary_get_uint64(v4, "device_type");
  string = xpc_dictionary_get_string(v4, "device_name");
  uuid = xpc_dictionary_get_uuid(v4, "UUID");
  v8 = xpc_dictionary_get_string(v4, "trust_level");
  v9 = uint64 != 0;
  if (string)
    v10 = v9 + 1;
  else
    v10 = uint64 != 0;
  if (uuid)
    ++v10;
  if (v10 != 1)
  {
    v15 = qword_100057E98;
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)v44 = 67109632;
      *(_DWORD *)&v44[4] = v9;
      LOWORD(v45) = 1024;
      *(_DWORD *)((char *)&v45 + 2) = string != 0;
      HIWORD(v45) = 1024;
      LODWORD(v46) = uuid != 0;
      _os_log_error_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "GET query with invalid criteria (t:%d n:%d u:%d)", v44, 0x14u);
    }
    v16 = sub_1000047A8(v4, "ERROR");
    v14 = objc_claimAutoreleasedReturnValue(v16);
    goto LABEL_15;
  }
  v11 = v8;
  if (uuid || !v8)
  {
    v18 = sub_1000224D0((uint64_t)v3);
    *(_QWORD *)v44 = 0;
    v45 = v44;
    v46 = 0x3032000000;
    v47 = sub_100022E90;
    v48 = sub_100022EA0;
    v49 = 0;
    v34 = 0;
    v35 = (uint8_t *)&v34;
    v36 = 0x3032000000;
    v37 = sub_100022E90;
    v38 = sub_100022EA0;
    v39 = 0;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_100022EA8;
    v31[3] = &unk_100051AA0;
    v32 = uint64;
    v33 = v18;
    v31[6] = string;
    v31[7] = uuid;
    v31[4] = &v34;
    v31[5] = v44;
    v31[8] = v11;
    sub_100005B68(v31);
    if (v11)
    {
      if (!strcmp(v11, "trusted"))
      {
        v20 = v35;
        goto LABEL_23;
      }
      if (strcmp(v11, "untrusted"))
        goto LABEL_28;
    }
    else
    {
      v19 = (void *)*((_QWORD *)v35 + 5);
      if (v19)
        goto LABEL_24;
    }
    v20 = v45;
LABEL_23:
    v19 = (void *)*((_QWORD *)v20 + 5);
LABEL_24:
    v21 = v19;
    if (v21)
    {
      v22 = v21;
      reply = xpc_dictionary_create_reply(v4);
      xpc_dictionary_set_string(reply, "result", "OK");
      v23 = objc_msgSend(v22, "copyClientDescriptionWithSensitiveProperties:", v18);
      xpc_dictionary_set_value(reply, "device", v23);

      v24 = sub_100016F70(v3);
      v25 = (id)qword_100057E98;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(v22, "type");
        *(_DWORD *)buf = 67109378;
        v41 = v26;
        v42 = 2080;
        v43 = v24;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_INFO, "device_get_unique: Returning device of type %d (client=\"%s\")", buf, 0x12u);
      }

      free(v24);
LABEL_31:
      _Block_object_dispose(&v34, 8);

      _Block_object_dispose(v44, 8);
      goto LABEL_32;
    }
LABEL_28:
    v27 = sub_100016F70(v3);
    v28 = qword_100057E98;
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109378;
      v41 = uint64;
      v42 = 2080;
      v43 = v27;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "device_get_unique: Unable to find device with type %d (client=\"%s\")", buf, 0x12u);
    }
    free(v27);
    v29 = sub_1000047A8(v4, "ERROR");
    reply = (xpc_object_t)objc_claimAutoreleasedReturnValue(v29);
    goto LABEL_31;
  }
  v12 = qword_100057E98;
  if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
    sub_10003949C(v11 != 0, 0, v12);
  v13 = sub_1000047A8(v4, "ERROR");
  v14 = objc_claimAutoreleasedReturnValue(v13);
LABEL_15:
  reply = (xpc_object_t)v14;
LABEL_32:

  return reply;
}

void sub_100022D98(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, char a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  void *v29;

  free(v29);
  _Block_object_dispose(&a19, 8);
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

void sub_100022DE4(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v4;
  OS_xpc_object *xdict;
  uint64_t v6;
  _OWORD v7[5];

  v2 = a2;
  if (!v2)
    sub_100039520(&v6, v7);
  xdict = v2;

  remote_connection = xpc_dictionary_get_remote_connection(xdict);
  v4 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
  xpc_connection_send_message(v4, xdict);

}

uint64_t sub_100022E70(uint64_t a1, uint64_t a2)
{
  objc_msgSend(*(id *)(a1 + 32), "deliverDevice:", a2);
  return 1;
}

uint64_t sub_100022E90(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_100022EA0(uint64_t a1)
{

}

uint64_t sub_100022EA8(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  char *v6;
  char *v7;
  char *v8;
  char *v9;
  char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  char *v15;
  char *v16;
  char *v17;
  uint64_t v18;

  v3 = a2;
  v4 = v3;
  if (*(_DWORD *)(a1 + 72))
  {
    if (objc_msgSend(v3, "type") != *(_DWORD *)(a1 + 72))
    {
LABEL_3:
      v5 = 0;
      goto LABEL_20;
    }
    goto LABEL_14;
  }
  if (*(_QWORD *)(a1 + 48))
  {
    if (strcmp((const char *)objc_msgSend(v3, "device_name"), *(const char **)(a1 + 48))
      && (!objc_msgSend(v4, "device_alias")
       || strcmp((const char *)objc_msgSend(v4, "device_alias"), *(const char **)(a1 + 48))))
    {
      v6 = sub_10002313C(v4, "HWModel", *(unsigned __int8 *)(a1 + 76));
      v7 = v6;
      if (v6 && strcasestr(v6, *(const char **)(a1 + 48)))
      {
        v5 = v4;
        v8 = 0;
        v9 = 0;
        v10 = 0;
        goto LABEL_35;
      }
      v15 = sub_10002313C(v4, "ProductType", *(unsigned __int8 *)(a1 + 76));
      v10 = v15;
      if (v15 && strcasestr(v15, *(const char **)(a1 + 48)))
      {
        v9 = 0;
      }
      else
      {
        v16 = sub_10002313C(v4, "UniqueDeviceID", *(unsigned __int8 *)(a1 + 76));
        v9 = v16;
        if (!v16 || !strcasestr(v16, *(const char **)(a1 + 48)))
        {
          v17 = sub_10002313C(v4, "SerialNumber", *(unsigned __int8 *)(a1 + 76));
          v8 = v17;
          if (v17 && strcasestr(v17, *(const char **)(a1 + 48)))
            goto LABEL_33;
          v18 = sub_1000231EC(v4, *(unsigned __int8 *)(a1 + 76));
          if (v18)
          {
            v5 = 0;
            if (strtoull(*(const char **)(a1 + 48), 0, 0) == v18)
              goto LABEL_33;
          }
          else
          {
            v5 = 0;
          }
LABEL_34:
          if (!v7)
          {
LABEL_36:
            if (v10)
              free(v10);
            if (v9)
              free(v9);
            if (v8)
              free(v8);
            goto LABEL_15;
          }
LABEL_35:
          free(v7);
          goto LABEL_36;
        }
      }
      v8 = 0;
LABEL_33:
      v5 = v4;
      goto LABEL_34;
    }
  }
  else if (!*(_QWORD *)(a1 + 56)
         || !objc_msgSend(v3, "uuid")
         || uuid_compare(*(const unsigned __int8 **)(a1 + 56), (const unsigned __int8 *)objc_msgSend(v4, "uuid")))
  {
    goto LABEL_3;
  }
LABEL_14:
  v5 = v4;
LABEL_15:
  if (v5)
  {
    if (remote_device_type_is_trusted(objc_msgSend(v5, "type")))
      v11 = *(_QWORD *)(a1 + 32);
    else
      v11 = *(_QWORD *)(a1 + 40);
    objc_storeStrong((id *)(*(_QWORD *)(v11 + 8) + 40), v5);
  }
LABEL_20:
  v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  if (*(_QWORD *)(a1 + 64))
  {
    if (v12 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40))
      goto LABEL_23;
LABEL_25:
    v13 = 1;
    goto LABEL_26;
  }
  if (!v12)
    goto LABEL_25;
LABEL_23:
  v13 = 0;
LABEL_26:

  return v13;
}

char *sub_10002313C(void *a1, const char *a2, int a3)
{
  id v5;
  void *v6;
  xpc_object_t value;
  void *v8;
  void *v9;
  xpc_object_t v10;
  const char *string_ptr;
  char *v12;

  v5 = a1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "public_properties"));
  value = xpc_dictionary_get_value(v6, a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue(value);

  if (!v8 && a3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "properties"));
    v10 = xpc_dictionary_get_value(v9, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v10);

  }
  if (v8 && (string_ptr = xpc_string_get_string_ptr(v8)) != 0)
    v12 = strdup(string_ptr);
  else
    v12 = 0;

  return v12;
}

uint64_t sub_1000231EC(void *a1, int a2)
{
  id v3;
  void *v4;
  xpc_object_t value;
  void *v6;
  void *v7;
  xpc_object_t v8;
  uint64_t v9;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "public_properties"));
  value = xpc_dictionary_get_value(v4, "LocationID");
  v6 = (void *)objc_claimAutoreleasedReturnValue(value);

  if (!v6 && a2)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "properties"));
    v8 = xpc_dictionary_get_value(v7, "LocationID");
    v6 = (void *)objc_claimAutoreleasedReturnValue(v8);

  }
  if (!v6 || (v9 = xpc_uint64_get_value(v6)) == 0)
    v9 = 0;

  return v9;
}

void sub_100023290(uint64_t a1)
{
  NSObject *v2;
  xpc_object_t reply;
  xpc_object_t empty;
  __SecIdentity *v5;
  char *v6;
  CFDictionaryRef v7;
  id v8;
  const __CFData *v9;
  __SecIdentity *v10;
  CFDictionaryRef v11;
  void *v12;
  CFDataRef v13;
  CFTypeRef cf;
  SecKeyRef privateKeyRef;

  v2 = sub_1000194E4();
  cf = 0;
  privateKeyRef = 0;
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 32));
  empty = xpc_dictionary_create_empty();
  xpc_dictionary_set_string(reply, "result", "ERROR");
  if (!v2)
  {
    v6 = sub_100016F70(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
      sub_100039588();
    v5 = 0;
    goto LABEL_11;
  }
  v5 = sec_identity_copy_ref(v2);
  if (SecIdentityCopyPrivateKey(v5, &privateKeyRef))
  {
    v6 = sub_100016F70(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
      sub_100039768();
LABEL_11:
    v7 = 0;
LABEL_12:
    v8 = 0;
LABEL_13:
    free(v6);
    v9 = 0;
    v10 = v5;
    goto LABEL_14;
  }
  if (SecIdentityCopyCertificate(v5, (SecCertificateRef *)&cf))
  {
    v6 = sub_100016F70(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
      sub_100039708();
    goto LABEL_11;
  }
  v11 = SecKeyCopyAttributes(privateKeyRef);
  v7 = v11;
  if (!v11)
  {
    v6 = sub_100016F70(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
      sub_1000395E8();
    goto LABEL_11;
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[__CFDictionary objectForKeyedSubscript:](v11, "objectForKeyedSubscript:", kSecAttrTokenOID));
  if (!v12)
  {
    v6 = sub_100016F70(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
      sub_100039648();
    goto LABEL_12;
  }
  v8 = objc_retainAutorelease(v12);
  xpc_dictionary_set_data(empty, "identity_key", objc_msgSend(v8, "bytes"), (size_t)objc_msgSend(v8, "length"));
  v13 = SecCertificateCopyData((SecCertificateRef)cf);
  if (!v13)
  {
    v6 = sub_100016F70(*(_xpc_connection_s **)(a1 + 40));
    if (os_log_type_enabled((os_log_t)qword_100057E98, OS_LOG_TYPE_ERROR))
      sub_1000396A8();
    goto LABEL_13;
  }
  v9 = objc_retainAutorelease(v13);
  xpc_dictionary_set_data(empty, "identity_cert", -[__CFData bytes](v9, "bytes"), (size_t)-[__CFData length](v9, "length"));
  xpc_dictionary_set_value(reply, "identity", empty);
  v10 = v5;
  xpc_dictionary_set_string(reply, "result", "OK");
LABEL_14:
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

  if (cf)
    CFRelease(cf);
  if (privateKeyRef)
    CFRelease(privateKeyRef);
  if (v10)
    CFRelease(v10);

}

void sub_1000235F4(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, CFTypeRef cf, CFTypeRef a10)
{
  const void *v10;

  if (cf)
    CFRelease(cf);
  if (a10)
    CFRelease(a10);
  if (v10)
    CFRelease(v10);
  _Unwind_Resume(exception_object);
}

void sub_10002366C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0x16u);
}

double sub_100023690(_QWORD *a1, _OWORD *a2)
{
  double result;

  *a1 = 0;
  result = 0.0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  return result;
}

uint64_t sub_1000236AC(uint64_t result, uint64_t a2, uint64_t a3, float a4)
{
  *(float *)a3 = a4;
  *(_QWORD *)(a3 + 4) = result;
  *(_WORD *)(a3 + 12) = 2080;
  *(_QWORD *)(a3 + 14) = a2;
  return result;
}

id sub_100023934()
{
  if (qword_100057EC0 != -1)
    dispatch_once(&qword_100057EC0, &stru_100051BA0);
  return (id)qword_100057EB8;
}

uint64_t sub_100023974(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned int *)(a1 + 40));
}

uint64_t sub_100023988(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_100023DE4(uint64_t a1, int a2, void *a3)
{
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int port;
  int v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t description;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  nw_error_domain_t error_domain;
  int error_code;
  dispatch_time_t v29;
  uint64_t v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[5];
  id v41;
  id v42;
  __int128 v43;
  uint64_t v44;
  uint8_t buf[4];
  uint64_t v46;
  __int16 v47;
  int v48;
  __int16 v49;
  NSObject *v50;

  v5 = a3;
  if (a2 == 3)
  {
    v19 = sub_100023934();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100039AC4((uint64_t)v5, v20, v21, v22, v23, v24, v25, v26);

    error_domain = nw_error_get_error_domain(v5);
    error_code = nw_error_get_error_code(v5);
    if (error_domain == nw_error_domain_dns && (error_code == -65563 || error_code == -65568))
    {
      nw_listener_cancel(*(nw_listener_t *)(*(_QWORD *)(a1 + 32) + 16));
      v29 = dispatch_time(0, 5000000000);
      v30 = *(_QWORD *)(a1 + 32);
      v31 = *(void **)(a1 + 40);
      v32 = *(NSObject **)(v30 + 24);
      v40[0] = _NSConcreteStackBlock;
      v40[2] = sub_1000240F8;
      v40[3] = &unk_100051B18;
      v40[1] = 3221225472;
      v40[4] = v30;
      v43 = *(_OWORD *)(a1 + 56);
      v44 = *(_QWORD *)(a1 + 72);
      v41 = v31;
      v42 = *(id *)(a1 + 48);
      dispatch_after(v29, v32, v40);

    }
  }
  else if (a2 == 2)
  {
    v6 = sub_100023934();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)nw_listener_copy_local_endpoint(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      *(_DWORD *)buf = 138412802;
      v46 = (uint64_t)v8;
      v47 = 1024;
      v48 = 2;
      v49 = 2112;
      v50 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "listening on %@ (state %u, error %@)", buf, 0x1Cu);

    }
    port = nw_listener_get_port(*(nw_listener_t *)(*(_QWORD *)(a1 + 32) + 16));
    if (port)
    {
      v10 = port;
      v11 = sub_100023934();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v46) = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "listener port: %u", buf, 8u);
      }

      v13 = nw_listener_copy_local_endpoint(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 16));
      v14 = v13;
      if (v13)
      {
        description = nw_endpoint_get_description(v13);
        if (description)
        {
          v16 = description;
          v17 = sub_100023934();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315138;
            v46 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "listener local endpoint: %s", buf, 0xCu);
          }

        }
      }
LABEL_22:

    }
  }
  else if (*(_DWORD *)(a1 + 80))
  {
    v33 = sub_100023934();
    v14 = objc_claimAutoreleasedReturnValue(v33);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_100039A5C((uint64_t)v5, v14, v34, v35, v36, v37, v38, v39);
    goto LABEL_22;
  }

}

_BYTE *sub_1000240F8(_QWORD *a1)
{
  _BYTE *result;

  result = (_BYTE *)a1[4];
  if (!result[32])
    return objc_msgSend(result, "listenOnBonjourName:type:domain:configureTLS:connectionHandler:", a1[7], a1[8], a1[9], a1[5], a1[6]);
  return result;
}

void sub_10002411C(id a1, OS_nw_endpoint *a2, BOOL a3)
{
  _BOOL4 v3;
  OS_nw_endpoint *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  int v8;
  OS_nw_endpoint *v9;
  __int16 v10;
  const char *v11;

  v3 = a3;
  v4 = a2;
  v5 = sub_100023934();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "removed";
    if (v3)
      v7 = "added";
    v8 = 138412546;
    v9 = v4;
    v10 = 2080;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "advertised endpoint %@ %s", (uint8_t *)&v8, 0x16u);
  }

}

void sub_1000242A4(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RemoteServiceDiscovery", "listener");
  v2 = (void *)qword_100057EB8;
  qword_100057EB8 = (uint64_t)v1;

}

void sub_1000245C4(void *a1)
{
  id v2;
  os_log_t v3;
  void *v4;
  NSObject *v5;
  NSMutableSet *v6;
  void *v7;
  id v8;
  uint64_t v9;
  CFMutableDictionaryRef v10;
  __CFDictionary *v11;
  const __CFDictionary *v12;
  uint64_t v13;
  const __CFDictionary *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  uint64_t v20;
  uint8_t buf[16];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;

  v2 = a1;
  if (sub_10000E004())
  {
    v3 = os_log_create("com.apple.RemoteServiceDiscovery", "display_device");
    v4 = (void *)qword_100057EC8;
    qword_100057EC8 = (uint64_t)v3;

    v5 = qword_100057EC8;
    if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Initializing display backend", buf, 2u);
    }
    objc_storeStrong((id *)&qword_100057ED0, a1);
    v6 = objc_opt_new(NSMutableSet);
    v7 = (void *)qword_100057ED8;
    qword_100057ED8 = (uint64_t)v6;

    v8 = (id)qword_100057ED8;
    if (!v8)
      sub_100039CE0(&v19, buf);

    if (qword_100057EE0)
      sub_100039F9C(&v19, buf);
    qword_100057EE0 = (uint64_t)sub_1000111AC((void *)qword_100057ED0);
    if (!qword_100057EE0)
      sub_100039D6C(&v19, buf);
    if (qword_100057EE8)
      sub_100039F10(&v19, buf);
    qword_100057EE8 = (uint64_t)sub_1000111AC((void *)qword_100057ED0);
    if (!qword_100057EE8)
      sub_100039DF8(&v19, buf);
    v9 = qword_100057EE0;
    v10 = IOServiceMatching("AppleUSBDeviceNCMData");
    if (!v10)
      sub_100039E84(&v19, buf);
    v11 = IOServiceMatching("IOEthernetInterface");
    v12 = v11;
    if (!v11)
    {
      v18 = 0;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      *(_OWORD *)buf = 0u;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        v15 = 3;
      else
        v15 = 2;
      v19 = 134217984;
      v20 = 0;
      v16 = _os_log_send_and_compose_impl(v15, &v18, buf, 80, &_mh_execute_header, &_os_log_default, 16);
      v17 = _os_crash_msg(v18, v16);
      sub_100033D14(v17);
    }
    CFDictionarySetValue(v11, CFSTR("IOParentMatch"), v10);
    CFRelease(v10);
    sub_1000112B4(v9, (IOServiceMatchingCallback)sub_1000248A8, v12);
    v13 = qword_100057EE8;
    v14 = IOServiceMatching("AppleDisplayPlatformControl");
    sub_1000112B4(v13, (IOServiceMatchingCallback)sub_100024AC8, v14);
  }

}

void sub_100024880(_Unwind_Exception *a1)
{
  const void *v1;

  CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000248A8(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  uint64_t v5;
  NSObject *v6;
  const __CFString *v7;
  CFComparisonResult v8;
  RSDNCMInterface *v9;
  RSDNCMInterface *v10;
  RSDNCMInterface *v11;
  RSDNCMInterface *v12;
  uint64_t v13;
  uint8_t buf[88];

  if (!a1)
    sub_10003A028(&v13, buf);
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    do
    {
      v6 = qword_100057EC8;
      if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "IOIteratorNext returned %d", buf, 8u);
      }
      v7 = IOObjectCopyClass(v5);
      v8 = CFStringCompare(v7, CFSTR("AppleUSBDeviceNCMPrivateEthernetInterface"), 0);
      if (v7)
        CFRelease(v7);
      if (v8 == kCFCompareEqualTo)
      {
        v9 = [RSDNCMInterface alloc];
        v10 = -[RSDNCMInterface initWithService:notificationPort:queue:](v9, "initWithService:notificationPort:queue:", v5, a1, qword_100057ED0);
        v11 = v10;
        if (v10)
        {
          -[RSDNCMInterface setIs_private:](v10, "setIs_private:", 1);
          v12 = v11;
          -[RSDNCMInterface setAddressed_callback:](v12, "setAddressed_callback:", &stru_100051BC0);
          -[RSDNCMInterface setDetached_callback:](v12, "setDetached_callback:", &stru_100051BE0);

          if (-[RSDNCMInterface activate](v12, "activate"))
            objc_msgSend((id)qword_100057ED8, "addObject:", v12);
        }

      }
      if (IOObjectRelease(v5))
        sub_10003A0B4(&v13, buf);
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

void sub_100024A84(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, int a11, unsigned int a12)
{
  const void *v12;

  if (v12)
    CFRelease(v12);
  sub_1000134C4(&a12);
  _Unwind_Resume(a1);
}

uint64_t sub_100024AC8(IONotificationPort *a1, io_iterator_t iterator)
{
  uint64_t result;
  io_service_t v5;
  kern_return_t v6;
  kern_return_t v7;
  NSObject *v8;
  uint64_t notification;
  uint8_t buf[88];

  if (!a1)
    sub_10003A150(&notification, buf);
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    do
    {
      LODWORD(notification) = 0;
      v6 = IOServiceAddInterestNotification(a1, v5, "IOGeneralInterest", (IOServiceInterestCallback)sub_1000257A0, 0, (io_object_t *)&notification);
      if (v6)
      {
        v7 = v6;
        v8 = qword_100057EC8;
        if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "IOServiceAddInterestNotification: 0x%x", buf, 8u);
        }
      }
      else
      {
        sub_1000257BC(v5);
      }
      IOObjectRelease(v5);
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

id sub_100025284(uint64_t a1)
{
  id result;

  result = objc_msgSend(*(id *)(a1 + 32), "state");
  if ((_DWORD)result != 3)
    return objc_msgSend(*(id *)(a1 + 32), "createPortListener");
  return result;
}

uint64_t sub_1000252C0(uint64_t a1)
{
  uint64_t result;
  NSObject *v3;
  _BOOL8 v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t failsafe_version_flags;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  unsigned int v16;
  uint8_t buf[4];
  uint64_t v18;

  v16 = -1431655766;
  for (result = sub_10001E334(*(_DWORD *)(a1 + 40), 0, 0, (unsigned __int8 *)&xmmword_1000410A8, (int *)&v16);
        !(_DWORD)result;
        result = sub_10001E334(*(_DWORD *)(a1 + 40), 0, 0, (unsigned __int8 *)&xmmword_1000410A8, (int *)&v16))
  {
    v3 = qword_100057EC8;
    v4 = os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT);
    if (v4)
    {
      v5 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138543362;
      v18 = v5;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%{public}@> Got incoming remoted connection", buf, 0xCu);
    }
    v6 = v16;
    v7 = qword_100057ED0;
    failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v4);
    v9 = (void *)xpc_remote_connection_create_with_connected_fd(v6, v7, failsafe_version_flags, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));

    if (v10)
    {
      v11 = qword_100057EC8;
      if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT))
      {
        v12 = *(_QWORD *)(a1 + 32);
        *(_DWORD *)buf = 138543362;
        v18 = v12;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%{public}@> Canceling existing connection to replace it", buf, 0xCu);
      }
      v13 = *(_QWORD *)(a1 + 32);
      v14 = *(_QWORD *)(v13 + 296);
      if (v14)
      {
        xpc_remote_connection_cancel(v14);
        v13 = *(_QWORD *)(a1 + 32);
      }
      objc_storeStrong((id *)(v13 + 296), v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));
      xpc_remote_connection_cancel(v15);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "connect:", v9);
    }

  }
  return result;
}

uint64_t sub_1000254B8(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

void sub_100025678(id a1, RSDNCMInterface *a2)
{
  void *v2;
  void *v3;
  RSDRemoteDisplayDeviceDevice *v4;
  void *v5;
  RSDNCMInterface *v6;

  v6 = a2;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v6, "device"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v6, "device"));
    objc_msgSend(v3, "setSuspended:", 0);
  }
  else
  {
    v4 = -[RSDRemoteDisplayDeviceDevice initWithInterface:]([RSDRemoteDisplayDeviceDevice alloc], "initWithInterface:", v6);
    -[RSDNCMInterface setDevice:](v6, "setDevice:", v4);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v6, "device"));
    sub_10002AF08(v5);

    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v6, "device"));
    objc_msgSend(v3, "attach");
  }

}

void sub_10002572C(id a1, RSDNCMInterface *a2)
{
  void *v2;
  void *v3;
  RSDNCMInterface *v4;

  v4 = a2;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v4, "device"));

  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v4, "device"));
    objc_msgSend(v3, "disconnect");

    -[RSDNCMInterface setDevice:](v4, "setDevice:", 0);
  }
  objc_msgSend((id)qword_100057ED8, "removeObject:", v4);

}

void sub_1000257A0(uint64_t a1, io_registry_entry_t a2, int a3)
{
  if (a3 == -536870608)
    sub_1000257BC(a2);
}

void sub_1000257BC(io_registry_entry_t a1)
{
  int v1;
  uint64_t v2;
  const char *v3;
  NSObject *v4;
  uint32_t v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  id v17;
  id v18;
  uint64_t v19;
  void *j;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  uint64_t v33;
  int v34;
  _BYTE v35[128];
  uint8_t v36[128];
  uint8_t buf[88];

  v34 = -1;
  if (!sub_100011038(a1, &v34))
  {
    v6 = qword_100057EC8;
    if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_ERROR))
      sub_10003A2B4(v6);
    return;
  }
  v1 = v34;
  if (v34 >= 4)
    sub_10003A244(&v33, buf);
  switch(v34)
  {
    case 1:
      v7 = qword_100057EC8;
      if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "AppleDisplayPlatformControl: Host disconnected", buf, 2u);
      }
      v27 = 0u;
      v28 = 0u;
      v25 = 0u;
      v26 = 0u;
      v8 = (id)qword_100057ED8;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
      if (v9)
      {
        v10 = v9;
        v11 = *(_QWORD *)v26;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(_QWORD *)v26 != v11)
              objc_enumerationMutation(v8);
            v13 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * (_QWORD)i);
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "device", (_QWORD)v25));

            if (v14)
            {
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "device"));
              objc_msgSend(v15, "disconnect");

              objc_msgSend(v13, "setDevice:", 0);
            }
          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v25, v35, 16);
        }
        while (v10);
      }
      goto LABEL_33;
    case 2:
      v16 = qword_100057EC8;
      if (os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "AppleDisplayPlatformControl: Host sleep", buf, 2u);
      }
      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      v8 = (id)qword_100057ED8;
      v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v30;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v30 != v19)
              objc_enumerationMutation(v8);
            v21 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)j);
            v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "device"));

            if (v22)
            {
              v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "device"));
              objc_msgSend(v23, "setSuspended:", 1);

            }
          }
          v18 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        }
        while (v18);
      }
LABEL_33:

      return;
    case 3:
      v2 = qword_100057EC8;
      if (!os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT))
        return;
      *(_WORD *)buf = 0;
      v3 = "AppleDisplayPlatformControl: Host active";
      v4 = v2;
      v5 = 2;
      break;
    default:
      v24 = qword_100057EC8;
      if (!os_log_type_enabled((os_log_t)qword_100057EC8, OS_LOG_TYPE_DEFAULT))
        return;
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v1;
      v3 = "AppleDisplayPlatformControl: %d";
      v4 = v24;
      v5 = 8;
      break;
  }
  _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, v3, buf, v5);
}

void sub_100025B14(void *a1)
{
  os_log_t v2;
  void *v3;
  NSObject *v4;
  NSMutableSet *v5;
  void *v6;
  id v7;
  NSMutableDictionary *v8;
  void *v9;
  id v10;
  id *v11;
  __CFDictionary *v12;
  __CFDictionary *Mutable;
  __CFDictionary *v14;
  CFNumberRef v15;
  CFNumberRef v16;
  __CFDictionary *v17;
  const __CFDictionary *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  int v30;
  int valuePtr;
  int v32;
  uint64_t v33;
  uint8_t buf[16];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;

  v28 = a1;
  v2 = os_log_create("com.apple.RemoteServiceDiscovery", "display_host");
  v3 = (void *)qword_100057EF0;
  qword_100057EF0 = (uint64_t)v2;

  v4 = qword_100057EF0;
  if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Initializing display host backend", buf, 2u);
  }
  objc_storeStrong((id *)&qword_100057EF8, a1);
  v5 = objc_opt_new(NSMutableSet);
  v6 = (void *)qword_100057F00;
  qword_100057F00 = (uint64_t)v5;

  v7 = (id)qword_100057F00;
  if (!v7)
    sub_10003A2F4(&v32, buf);

  v8 = objc_opt_new(NSMutableDictionary);
  v9 = (void *)qword_100057F08;
  qword_100057F08 = (uint64_t)v8;

  v10 = (id)qword_100057F08;
  if (!v10)
    sub_10003A37C(&v32, buf);

  if (qword_100057F10)
    sub_10003A48C(&v32, buf);
  v11 = sub_1000111AC((void *)qword_100057EF8);
  qword_100057F10 = (uint64_t)v11;
  if (!v11)
    sub_10003A404(&v32, buf);
  v12 = IOServiceMatching("AppleUSBNCMData");
  if (!v12)
  {
    v29 = 0;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    *(_OWORD *)buf = 0u;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v19 = 3;
    else
      v19 = 2;
    v32 = 134217984;
    v33 = 0;
    v20 = _os_log_send_and_compose_impl(v19, &v29, buf, 80, &_mh_execute_header, &_os_log_default, 16);
    v21 = _os_crash_msg(v29, v20);
    sub_100033D14(v21);
  }
  Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  v14 = Mutable;
  if (!Mutable)
  {
    v29 = 0;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    *(_OWORD *)buf = 0u;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v22 = 3;
    else
      v22 = 2;
    v32 = 134217984;
    v33 = 0;
    v23 = _os_log_send_and_compose_impl(v22, &v29, buf, 80, &_mh_execute_header, &_os_log_default, 16);
    v24 = _os_crash_msg(v29, v23);
    sub_100033D14(v24);
  }
  CFDictionarySetValue(Mutable, CFSTR("IOModel"), CFSTR("USB"));
  valuePtr = 1452;
  v15 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &valuePtr);
  CFDictionarySetValue(v14, CFSTR("idVendor"), v15);
  v30 = 4372;
  v16 = CFNumberCreate(kCFAllocatorDefault, kCFNumberIntType, &v30);
  CFDictionarySetValue(v14, CFSTR("idProduct"), v16);
  CFDictionarySetValue(v12, CFSTR("IOPropertyMatch"), v14);
  v17 = IOServiceMatching("IOEthernetInterface");
  v18 = v17;
  if (!v17)
  {
    v29 = 0;
    v37 = 0u;
    v38 = 0u;
    v35 = 0u;
    v36 = 0u;
    *(_OWORD *)buf = 0u;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v25 = 3;
    else
      v25 = 2;
    v32 = 134217984;
    v33 = 0;
    v26 = _os_log_send_and_compose_impl(v25, &v29, buf, 80, &_mh_execute_header, &_os_log_default, 16);
    v27 = _os_crash_msg(v29, v26);
    sub_100033D14(v27);
  }
  CFDictionarySetValue(v17, CFSTR("IOParentMatch"), v12);
  if (v16)
    CFRelease(v16);
  if (v15)
    CFRelease(v15);
  CFRelease(v14);
  CFRelease(v12);
  sub_1000112B4((uint64_t)v11, (IOServiceMatchingCallback)sub_1000260CC, v18);

}

void sub_100026044(_Unwind_Exception *a1)
{
  const void *v1;
  const void *v2;

  CFRelease(v2);
  if (v1)
    CFRelease(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1000260CC(uint64_t a1, io_iterator_t iterator)
{
  uint64_t result;
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  int v8;
  NSObject *v10;
  RSDNCMInterface *v11;
  RSDNCMInterface *v12;
  RSDNCMInterface *v13;
  RSDNCMInterface *v14;
  RSDRemoteDisplayHostDevice *v15;
  RSDRemoteDisplayHostDevice *v16;
  void *v17;
  uint8_t v18[16];
  uint8_t buf[88];

  if (!a1)
    sub_10003A514(v18, buf);
  result = IOIteratorNext(iterator);
  if ((_DWORD)result)
  {
    v5 = result;
    do
    {
      v6 = qword_100057EF0;
      if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "NCM device attached", buf, 2u);
      }
      v7 = qword_100057EF0;
      if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&buf[4] = v5;
        _os_log_debug_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "IOIteratorNext returned %d", buf, 8u);
      }
      *(_DWORD *)buf = 0;
      v8 = -5;
      while ((sub_100010EC4(v5, buf) & 1) == 0)
      {
        usleep(0x186A0u);
        if (__CFADD__(v8++, 1))
        {
          v10 = qword_100057EF0;
          if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)v18 = 0;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to extract nwifflags, fallback to false", v18, 2u);
          }
          goto LABEL_19;
        }
      }
      if ((*(_DWORD *)buf & 0x20000000) != 0)
      {
        v11 = [RSDNCMInterface alloc];
        v12 = -[RSDNCMInterface initWithService:notificationPort:queue:](v11, "initWithService:notificationPort:queue:", v5, a1, qword_100057EF8);
        v13 = v12;
        if (v12)
        {
          -[RSDNCMInterface setIs_private:](v12, "setIs_private:", 1);
          v14 = v13;
          -[RSDNCMInterface setInactive_callback:](v14, "setInactive_callback:", &stru_100051C00);
          -[RSDNCMInterface setAddressed_callback:](v14, "setAddressed_callback:", &stru_100051C20);
          -[RSDNCMInterface setDetached_callback:](v14, "setDetached_callback:", &stru_100051C40);

          if (-[RSDNCMInterface activate](v14, "activate"))
          {
            v15 = -[RSDRemoteDisplayHostDevice initWithInterface:]([RSDRemoteDisplayHostDevice alloc], "initWithInterface:", v14);
            -[RSDNCMInterface setDevice:](v14, "setDevice:", v15);
            *(_DWORD *)buf = -1431655766;
            v16 = v15;
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[RSDRemoteNCMDevice interface](v16, "interface"));
            sub_100010E20((io_registry_entry_t)objc_msgSend(v17, "service"), buf);

            -[RSDRemoteDevice setBackendProperty:withUint:](v16, "setBackendProperty:withUint:", "LocationID", *(unsigned int *)buf);
            -[RSDRemoteDevice attach](v16, "attach");
            objc_msgSend((id)qword_100057F00, "addObject:", v14);

          }
        }

      }
LABEL_19:
      if (IOObjectRelease(v5))
        sub_10003A59C(v18, buf);
      result = IOIteratorNext(iterator);
      v5 = result;
    }
    while ((_DWORD)result);
  }
  return result;
}

void sub_1000263A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12, unsigned int a13)
{
  sub_100026E78(&a13);
  _Unwind_Resume(a1);
}

id sub_100026AA4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "triggerNeedsConnect");
}

void sub_100026AAC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  NSObject *v7;
  _BOOL8 v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t failsafe_version_flags;
  void *v14;
  int v15;
  uint64_t v16;

  if ((_DWORD)a3)
  {
    v5 = qword_100057EF0;
    if (os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_ERROR))
      sub_10003A6B4(a1, a3, v5);
    objc_msgSend(*(id *)(a1 + 32), "connect:", 0);
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(a1 + 32), "connection"));

    v7 = qword_100057EF0;
    v8 = os_log_type_enabled((os_log_t)qword_100057EF0, OS_LOG_TYPE_DEFAULT);
    if (v6)
    {
      if (v8)
      {
        v9 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v9;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, but socket is not needed anymore, closing", (uint8_t *)&v15, 0xCu);
      }
      close(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 296));
    }
    else
    {
      if (v8)
      {
        v10 = *(_QWORD *)(a1 + 32);
        v15 = 138543362;
        v16 = v10;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%{public}@> pollConnect completed, socket is connected", (uint8_t *)&v15, 0xCu);
      }
      v11 = *(unsigned int *)(*(_QWORD *)(a1 + 32) + 296);
      v12 = qword_100057EF8;
      failsafe_version_flags = xpc_remote_connection_get_failsafe_version_flags(v8);
      v14 = (void *)xpc_remote_connection_create_with_connected_fd(v11, v12, failsafe_version_flags, 0);
      objc_msgSend(*(id *)(a1 + 32), "connect:", v14);

    }
  }
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 296) = -1;
}

uint64_t sub_100026E78(unsigned int *a1)
{
  uint64_t result;
  uint64_t v2;
  _OWORD v3[5];

  result = *a1;
  if ((_DWORD)result)
  {
    result = IOObjectRelease(result);
    if ((_DWORD)result)
      sub_10003A72C(&v2, v3);
  }
  return result;
}

void sub_100026EDC(id a1, RSDNCMInterface *a2)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](a2, "device"));
  objc_msgSend(v2, "setSuspended:", 1);

}

void sub_100026F10(id a1, RSDNCMInterface *a2)
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](a2, "device"));
  sub_10002AF08(v2);
  objc_msgSend(v2, "triggerNeedsConnect");
  objc_msgSend(v2, "setSuspended:", 0);

}

void sub_100026F54(id a1, RSDNCMInterface *a2)
{
  RSDNCMInterface *v2;
  id v3;

  v2 = a2;
  v3 = (id)objc_claimAutoreleasedReturnValue(-[RSDNCMInterface device](v2, "device"));
  objc_msgSend(v3, "disconnect");
  -[RSDNCMInterface setDevice:](v2, "setDevice:", 0);
  objc_msgSend((id)qword_100057F00, "removeObject:", v2);

}

uint64_t sub_100026FB0()
{
  void *v0;
  uint64_t v1;
  id v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  int v6;
  int v7;
  int v8;
  id v9;
  uint64_t v11;
  __int16 v12;
  __int16 v13;

  v0 = malloc_type_calloc(0x100uLL, 1uLL, 0x100004077774924uLL);
  if (os_parse_boot_arg_string("rsd_enabled_backend", v0, 255)
    && (v1 = remote_device_type_parse(v0), (v1 - 15) <= 1))
  {
    v2 = sub_100027130();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 0;
      v4 = "enable backend required by boot-args";
      v5 = (uint8_t *)&v13;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }
  else
  {
    v6 = sub_100011474(0, "manta-c", 0);
    v7 = sub_100011474(0, "manta-b", 0);
    if ((v6 & v7) == 1)
    {
      v11 = _os_crash("both manta-b and manta-c device found in device tree");
      sub_100033D14(v11);
    }
    v8 = v6 | v7;
    if (v6)
      v1 = 16;
    else
      v1 = 15;
    if (v8 != 1)
    {
      v1 = 0;
      goto LABEL_15;
    }
    v9 = sub_100027130();
    v3 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v4 = "enable backend required by device tree";
      v5 = (uint8_t *)&v12;
      goto LABEL_12;
    }
  }

LABEL_15:
  free(v0);
  return v1;
}

void sub_100027118(_Unwind_Exception *a1)
{
  void *v1;

  free(v1);
  _Unwind_Resume(a1);
}

id sub_100027130()
{
  if (qword_100057F38 != -1)
    dispatch_once(&qword_100057F38, &stru_100051D48);
  return (id)qword_100057F30;
}

void sub_100027170(uint64_t a1)
{
  void *v1;
  NSString *v2;
  id v3;

  v1 = (void *)qword_100057FD8;
  v2 = +[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", sub_100017A60(a1));
  v3 = (id)objc_claimAutoreleasedReturnValue(v2);
  objc_msgSend(v1, "setValue:forKey:", v3, CFSTR("compute-platform-tls-requirement"));

}

void sub_1000272E8(id obj)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_storeStrong((id *)&qword_100057F18, obj);
  v5 = obj;
  v2 = xpc_event_publisher_create("com.apple.remoted.compute-platform", qword_100057F18);
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)qword_100057F20;
  qword_100057F20 = v3;

  xpc_event_publisher_set_handler(qword_100057F20, &stru_100051C60);
  xpc_event_publisher_set_error_handler(qword_100057F20, &stru_100051D00);
  xpc_event_publisher_activate(qword_100057F20);

}

void sub_100027378(id a1, unsigned int a2, unint64_t a3, OS_xpc_object *a4)
{
  OS_xpc_object *v6;
  id v7;
  NSObject *v8;
  __int128 v9;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  id v17;
  NSObject *v18;
  _BOOL4 v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  xpc_object_t array;
  NSObject *v32;
  id v33;
  NSObject *v34;
  _BOOL4 v35;
  id v36;
  NSObject *v37;
  const char *string;
  id v39;
  NSObject *v40;
  int v41;
  id v42;
  NSObject *v43;
  int v44;
  uint8_t *v45;
  __int16 v46;
  void *v47;
  uint8_t buf[16];
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;

  v6 = a4;
  if (byte_100057F28 == 1)
  {
    v7 = sub_100027130();
    v8 = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "skip xpc event after initialization", buf, 2u);
    }
LABEL_4:

    goto LABEL_43;
  }
  if (a2 != 2)
  {
    if (a2 == 1)
    {
      v17 = sub_100027130();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      v19 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

      if (!v19)
        goto LABEL_43;
      v20 = (void *)xpc_copy_debug_description(v6);
      v21 = sub_100027130();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136446210;
        *(_QWORD *)&buf[4] = v20;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "xpc event REMOVE: %{public}s", buf, 0xCu);
      }

LABEL_42:
      free(v20);
      goto LABEL_43;
    }
    if (a2)
      goto LABEL_43;
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    v54 = v9;
    v55 = v9;
    v52 = v9;
    v53 = v9;
    v50 = v9;
    v51 = v9;
    *(_OWORD *)buf = v9;
    v49 = v9;
    if ((xpc_get_event_name("com.apple.remoted.compute-platform", a3, buf) & 1) == 0)
    {
      v23 = sub_100027130();
      v8 = objc_claimAutoreleasedReturnValue(v23);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        sub_10003A89C(v8, v24, v25, v26, v27, v28, v29, v30);
      goto LABEL_4;
    }
    if (*(_DWORD *)buf == 2003792482 && *(_DWORD *)&buf[3] == 6648695)
    {
      array = xpc_dictionary_get_array(v6, "interfaces");
      v32 = objc_claimAutoreleasedReturnValue(array);
      v14 = v32;
      if (v32)
        xpc_array_apply(v32, &stru_100051CA0);
    }
    else
    {
      if (*(_QWORD *)buf == 0x746E696F70646E65 && *(unsigned __int16 *)&buf[8] == 115)
      {
        xpc_dictionary_apply(v6, &stru_100051CE0);
        goto LABEL_38;
      }
      if (*(_DWORD *)buf == 1953720684 && *(_DWORD *)&buf[3] == 7234932)
      {
        string = xpc_dictionary_get_string(v6, "interface");
        if (string)
        {
          v39 = sub_100027130();
          v40 = objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v44 = 136446210;
            v45 = (uint8_t *)string;
            _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_INFO, "start listening on %{public}s from xpc_event", (uint8_t *)&v44, 0xCu);
          }

          v41 = sub_1000161A0((uint64_t)string);
          if (v41 && v41 != 17)
          {
            v42 = sub_100027130();
            v43 = objc_claimAutoreleasedReturnValue(v42);
            if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
              sub_10003A7BC((uint64_t)string, v43);

          }
        }
        goto LABEL_38;
      }
      v13 = sub_100027130();
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        sub_10003A82C((uint64_t)buf, v14);
    }

LABEL_38:
    v33 = sub_100027130();
    v34 = objc_claimAutoreleasedReturnValue(v33);
    v35 = os_log_type_enabled(v34, OS_LOG_TYPE_INFO);

    if (!v35)
      goto LABEL_43;
    v20 = (void *)xpc_copy_debug_description(v6);
    v36 = sub_100027130();
    v37 = objc_claimAutoreleasedReturnValue(v36);
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      v44 = 136446466;
      v45 = buf;
      v46 = 2082;
      v47 = v20;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "xpc event ADD: %{public}s: %{public}s", (uint8_t *)&v44, 0x16u);
    }

    goto LABEL_42;
  }
  v15 = sub_100027130();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Finalized the initial set of compute platform xpc event", buf, 2u);
  }

  byte_100057F28 = 1;
  sub_100016FA8((void *)qword_100057F18);
LABEL_43:

}

BOOL sub_10002779C(id a1, unint64_t a2, OS_xpc_object *a3)
{
  const char *string_ptr;
  uint64_t v4;
  id v5;
  NSObject *v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  int v12;
  uint64_t v13;

  string_ptr = xpc_string_get_string_ptr(a3);
  if (string_ptr)
  {
    v4 = (uint64_t)string_ptr;
    v5 = sub_100027130();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v12 = 136446210;
      v13 = v4;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "start browsing on %{public}s from xpc event", (uint8_t *)&v12, 0xCu);
    }

    v7 = sub_1000142C8(v4);
    if (v7)
    {
      v8 = v7;
      if (v7 != 17)
      {
        v9 = sub_100027130();
        v10 = objc_claimAutoreleasedReturnValue(v9);
        if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          sub_10003A8CC(v4, v8, v10);

      }
    }
  }
  return 1;
}

BOOL sub_10002789C(id a1, const char *a2, OS_xpc_object *a3)
{
  const char *string_ptr;
  const char *v5;
  id v6;
  NSObject *v7;
  int v8;
  int v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  int v19;
  id v20;
  NSObject *v21;
  id v22;
  int v24;
  int v25;
  id v26;
  _QWORD v27[2];
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  const char *v31;
  __int16 v32;
  int v33;

  string_ptr = xpc_string_get_string_ptr(a3);
  if (string_ptr)
  {
    v5 = string_ptr;
    v27[0] = 0;
    v27[1] = 0;
    v6 = sub_100027130();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136446466;
      v29 = v5;
      v30 = 2082;
      v31 = a2;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "adding node %{public}s%%%{public}s from xpc event", buf, 0x16u);
    }

    v8 = inet_pton(30, v5, v27);
    v9 = v8;
    if (v8 == -1)
    {
      v19 = *__error();
      v20 = sub_100027130();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_10003A9EC(v19, v21);

      goto LABEL_12;
    }
    if (v8 != 1)
    {
      if (!v8)
      {
        v10 = sub_100027130();
        v11 = objc_claimAutoreleasedReturnValue(v10);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
          sub_10003A9BC(v11, v12, v13, v14, v15, v16, v17, v18);
LABEL_14:

        return 1;
      }
LABEL_12:
      v22 = sub_100027130();
      v11 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        sub_10003A94C(v9, v11);
      goto LABEL_14;
    }
    v24 = sub_100013F0C((uint64_t)a2, v27);
    if (v24)
    {
      v25 = v24;
      if (v24 != 17)
      {
        v26 = sub_100027130();
        v11 = objc_claimAutoreleasedReturnValue(v26);
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 136446722;
          v29 = v5;
          v30 = 2082;
          v31 = a2;
          v32 = 1024;
          v33 = v25;
          _os_log_fault_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_FAULT, "failed to add device %{public}s%%%{public}s in publisher: %{darwin.errno}d", buf, 0x1Cu);
        }
        goto LABEL_14;
      }
    }
  }
  return 1;
}

void sub_100027A98(id a1, int a2)
{
  uint64_t v2;
  uint64_t v3;
  _OWORD v4[5];
  uint64_t v5;

  v5 = 0;
  memset(v4, 0, sizeof(v4));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v2 = 3;
  else
    v2 = 2;
  v3 = _os_log_send_and_compose_impl(v2, &v5, v4, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(v5, v3);
  __break(1u);
}

id sub_100027B38(int a1, void *a2)
{
  id v3;
  id v4;
  id configure_tls_block;
  _QWORD v7[4];
  id v8;
  int v9;

  v3 = a2;
  v4 = sub_1000194E4();
  if (v4)
  {
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100027BF4;
    v7[3] = &unk_100051D28;
    v9 = a1;
    v8 = v3;
    configure_tls_block = (id)xpc_remote_connection_create_configure_tls_block(v4, v7, qword_100057F18);

  }
  else
  {
    configure_tls_block = objc_retainBlock(_nw_parameters_configure_protocol_disable);
  }

  return configure_tls_block;
}

void sub_100027BF4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  int v5;
  void *v6;
  uint64_t v7;
  void (**v8)(id, uint64_t);

  v5 = *(_DWORD *)(a1 + 40);
  v6 = *(void **)(a1 + 32);
  v8 = a4;
  v7 = sub_100019A0C(v5, v6, a3);
  v8[2](v8, v7);

}

void sub_100027C54(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RemoteServiceDiscovery", "compute");
  v2 = (void *)qword_100057F30;
  qword_100057F30 = (uint64_t)v1;

}

unsigned int *sub_100028044(unsigned int *result)
{
  uint64_t v1;
  _OWORD v2[5];

  if (!*result)
    sub_10003ABFC(&v1, v2);
  *result = bswap32(bswap32(*result) - 1);
  return result;
}

id sub_100028568()
{
  if (qword_100057F80 != -1)
    dispatch_once(&qword_100057F80, &stru_100051D68);
  return (id)qword_100057F78;
}

NSObject *sub_1000285A8(uint64_t a1, unsigned int a2)
{
  NSObject *secure_tcp;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v9;
  NSObject *v10;
  uint64_t v11;
  __int128 v12[5];

  secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, _nw_parameters_configure_protocol_default_configuration);
  if (byte_100057F48)
    goto LABEL_5;
  if (!(_DWORD)a1)
    sub_100039838(&v11, v12);
  v5 = nw_interface_create_with_index(a1);
  if (v5)
  {
    v6 = v5;
    nw_parameters_require_interface(secure_tcp, v5);
    nw_parameters_set_local_only(secure_tcp, 1);
    nw_parameters_set_required_address_family(secure_tcp, 30);
    nw_parameters_set_required_interface_type(secure_tcp, nw_interface_type_wired);

LABEL_5:
    nw_parameters_set_no_fallback(secure_tcp, 1);
    nw_parameters_set_indefinite(secure_tcp, 0);
    xpc_remote_connection_setup_nw_parameters(secure_tcp, a2);
    v7 = secure_tcp;
    goto LABEL_6;
  }
  v9 = sub_100028568();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    sub_10003AD60();

  v7 = 0;
LABEL_6:

  return v7;
}

void sub_1000288C4(void *a1)
{
  id v2;
  id v3;
  NSObject *v4;
  NSMutableOrderedSet *v5;
  void *v6;
  NSMutableSet *v7;
  void *v8;
  const __CFString *v9;
  const __CFString *v10;
  char *v11;
  const __CFDictionary *v12;
  io_service_t MatchingService;
  io_object_t v14;
  CFTypeRef v15;
  CFTypeID v16;
  CFIndex Length;
  int v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id v35;
  NSObject *v36;
  _QWORD v37[6];
  _QWORD v38[3];
  char v39;
  _QWORD v40[3];
  int v41;
  __int128 buf;
  void (*v43)(uint64_t);
  void *v44;
  NSObject *v45;
  _QWORD *v46;
  _QWORD *v47;
  void *v48;

  v2 = a1;
  v3 = sub_100028568();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(buf) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "initializing bonjour peer device", (uint8_t *)&buf, 2u);
  }

  objc_storeStrong((id *)&qword_100057F58, a1);
  v5 = objc_opt_new(NSMutableOrderedSet);
  v6 = (void *)qword_100057F50;
  qword_100057F50 = (uint64_t)v5;

  v7 = objc_opt_new(NSMutableSet);
  v8 = (void *)qword_100057F40;
  qword_100057F40 = (uint64_t)v7;

  v9 = (const __CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057FD8, "valueForKey:", CFSTR("bonjour-interface-name")));
  if (v9)
  {
    v10 = v9;
    v11 = sub_10000B348(v9);
    CFRelease(v10);
    if (v11)
    {
      sub_100028CA4(v11, 5);
      goto LABEL_23;
    }
  }
  v12 = IOServiceMatching("IOService");
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v12);
  if (!MatchingService)
    sub_10003AE08(v37, &buf);
  v14 = MatchingService;
  v15 = IORegistryEntrySearchCFProperty(MatchingService, "IODeviceTree", CFSTR("remotexpc-bonjour-enabled"), kCFAllocatorDefault, 1u);
  IOObjectRelease(v14);
  if (v15)
  {
    v16 = CFGetTypeID(v15);
    if (v16 == CFDataGetTypeID())
    {
      Length = CFDataGetLength((CFDataRef)v15);
      if (Length == 4)
      {
        v18 = *(_DWORD *)CFDataGetBytePtr((CFDataRef)v15);
        CFRelease(v15);
        if (v18)
        {
          v19 = malloc_type_malloc(0x10uLL, 0xD13E0E7AuLL);
          if (!v19)
            sub_10003AE70(v37, &buf);
          v20 = v19;
          v40[0] = 0;
          v40[1] = v40;
          v40[2] = 0x2020000000;
          v41 = 5;
          v38[0] = 0;
          v38[1] = v38;
          v38[2] = 0x2020000000;
          v39 = 0;
          v21 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)qword_100057F58);
          dispatch_source_set_timer(v21, 0, 0x3B9ACA00uLL, 0);
          v37[0] = _NSConcreteStackBlock;
          v37[1] = 3221225472;
          v37[2] = sub_100029794;
          v37[3] = &unk_100051D90;
          v37[4] = v38;
          v37[5] = v20;
          dispatch_source_set_mandatory_cancel_handler(v21, v37);
          *(_QWORD *)&buf = _NSConcreteStackBlock;
          *((_QWORD *)&buf + 1) = 3221225472;
          v43 = sub_100029804;
          v44 = &unk_100051DB8;
          v47 = v40;
          v48 = v20;
          v45 = v21;
          v46 = v38;
          v22 = v21;
          dispatch_source_set_event_handler(v22, &buf);
          dispatch_activate(v22);

          _Block_object_dispose(v38, 8);
          _Block_object_dispose(v40, 8);
        }
        goto LABEL_23;
      }
      v34 = Length;
      v35 = sub_100028568();
      v36 = objc_claimAutoreleasedReturnValue(v35);
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
        sub_10003AED8(v34, v36);

    }
    else
    {
      v25 = sub_100028568();
      v26 = objc_claimAutoreleasedReturnValue(v25);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
        sub_10003AF5C(v26, v27, v28, v29, v30, v31, v32, v33);

    }
    CFRelease(v15);
    goto LABEL_23;
  }
  v23 = sub_100028568();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 136446210;
    *(_QWORD *)((char *)&buf + 4) = "remotexpc-bonjour-enabled";
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "cannot find %{public}s property", (uint8_t *)&buf, 0xCu);
  }

LABEL_23:
}

void sub_100028CA4(char *a1, int a2)
{
  char v4;
  dispatch_time_t v5;
  id v6;
  NSObject *v7;
  _QWORD v8[5];
  int v9;

  v4 = sub_100028D74(a1, byte_100057F48);
  if (!a2 || (v4 & 1) != 0)
  {
    if ((v4 & 1) == 0)
    {
      v6 = sub_100028568();
      v7 = objc_claimAutoreleasedReturnValue(v6);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        sub_10003AFCC();

    }
    free(a1);
  }
  else
  {
    v5 = dispatch_time(0, 5000000000);
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_100029988;
    v8[3] = &unk_100051DD8;
    v8[4] = a1;
    v9 = a2;
    dispatch_after(v5, (dispatch_queue_t)qword_100057F58, v8);
  }
}

uint64_t sub_100028D74(const char *a1, char a2)
{
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  id v8;
  uint64_t v9;
  uint64_t v11;
  id v12;
  NSObject *v13;
  RSDNCMInterface *v14;
  void *v15;
  CFStringRef v16;
  CFStringRef v17;
  id v18;
  id v19;
  uint64_t v20;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  int v24;

  v4 = sub_100028568();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_INFO, "enabling bonjour", buf, 2u);
  }

  if (!qword_100057F58)
  {
    v8 = sub_100028568();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10003B02C();
    goto LABEL_9;
  }
  if (qword_100057F60)
  {
    v6 = sub_100028568();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100037D10();
LABEL_9:
    v9 = 0;
    goto LABEL_10;
  }
  if (!a1)
  {
    v19 = sub_100028568();
    v7 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_100037B40();
    goto LABEL_9;
  }
  v11 = if_nametoindex(a1);
  v12 = sub_100028568();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  v7 = v13;
  if (!(_DWORD)v11)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_10003B058();
    goto LABEL_9;
  }
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = a1;
    v23 = 1024;
    v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "enabling bonjour for interface name:%s index:%d", buf, 0x12u);
  }

  byte_100057F48 = a2;
  sub_100029028(v11);
  sub_100029164(v11);
  v14 = objc_alloc_init(RSDNCMInterface);
  v15 = (void *)qword_100057F60;
  qword_100057F60 = (uint64_t)v14;

  objc_msgSend((id)qword_100057F60, "setIndex:", v11);
  objc_msgSend((id)qword_100057F60, "setName:", strdup(a1));
  if ((a2 & 1) == 0)
  {
    v16 = CFStringCreateWithCString(0, a1, 0x8000100u);
    if (!v16)
      sub_10003B0B8(&v20, buf);
    v17 = v16;
    objc_msgSend((id)qword_100057FD8, "setValue:forKey:", v16, CFSTR("bonjour-interface-name"));
    objc_msgSend((id)qword_100057FD8, "synchronize");
    CFRelease(v17);
  }
  v18 = sub_100028568();
  v7 = objc_claimAutoreleasedReturnValue(v18);
  v9 = 1;
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "bonjour enabled", buf, 2u);
  }
LABEL_10:

  return v9;
}

void sub_100029028(uint64_t a1)
{
  NSObject *v1;
  NSObject *v2;
  NSObject *bonjour_service;
  nw_browser_t v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  _OWORD v9[5];

  v1 = sub_1000285A8(a1, 1u);
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (v2)
  {
    bonjour_service = nw_browse_descriptor_create_bonjour_service("_remoted_bp._tcp", "local.");
    if ((id)qword_100057F68)
      sub_10003B188(&v8, v9);
    v4 = nw_browser_create(bonjour_service, v2);
    v5 = (void *)qword_100057F68;
    qword_100057F68 = (uint64_t)v4;

    v6 = (id)qword_100057F68;
    if (!v6)
      sub_10003B120(&v8, v9);

    nw_browser_set_browse_results_changed_handler((nw_browser_t)qword_100057F68, &stru_100051E18);
    nw_browser_set_state_changed_handler((nw_browser_t)qword_100057F68, &stru_100051E80);
    nw_browser_set_queue((nw_browser_t)qword_100057F68, (dispatch_queue_t)qword_100057F58);
    nw_browser_start((nw_browser_t)qword_100057F68);
  }
  else
  {
    v7 = sub_100028568();
    bonjour_service = objc_claimAutoreleasedReturnValue(v7);
    if (os_log_type_enabled(bonjour_service, OS_LOG_TYPE_FAULT))
      sub_10003AD34();
  }

}

void sub_100029164(uint64_t a1)
{
  id v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  nw_listener_t v6;
  void *v7;
  id v8;
  __int128 v9;
  id v10;
  NSObject *v11;
  const unsigned __int8 *uuid;
  id v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *bonjour_service;
  id v18;
  NSObject *v19;
  id v20;
  uint64_t v21;
  uuid_string_t out;
  uuid_t dst;
  uint8_t buf[88];

  v2 = sub_100028568();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "init bonjour listener start", buf, 2u);
  }

  v4 = sub_1000285A8(a1, 1u);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (v5)
  {
    if ((id)qword_100057F70)
      sub_1000399E8(out, buf);
    v6 = nw_listener_create(v5);
    v7 = (void *)qword_100057F70;
    qword_100057F70 = (uint64_t)v6;

    v8 = (id)qword_100057F70;
    if (!v8)
      sub_1000398DC(out, buf);

    *(_QWORD *)&out[29] = 0xAAAAAAAAAAAAAAAALL;
    *(_QWORD *)&v9 = 0xAAAAAAAAAAAAAAAALL;
    *((_QWORD *)&v9 + 1) = 0xAAAAAAAAAAAAAAAALL;
    *(_OWORD *)out = v9;
    *(_OWORD *)&out[16] = v9;
    if (uuid_is_null((const unsigned __int8 *)&xmmword_100057FE8))
      sub_10003B334(dst, buf);
    v10 = sub_100028568();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      sub_1000362BC();

    uuid = xpc_dictionary_get_uuid((xpc_object_t)qword_100057FF8, "BootSessionUUID");
    if (!uuid)
      sub_10003B1FC(dst, buf);
    memset(dst, 170, sizeof(dst));
    uuid_copy(dst, uuid);
    if (uuid_is_null(dst))
      sub_10003B2CC(&v21, buf);
    v13 = sub_100028568();
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      sub_1000361F0();

    xmmword_100057FE8 = (__int128)veorq_s8((int8x16_t)xmmword_100057FE8, *(int8x16_t *)dst);
    v15 = sub_100028568();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_100036180();

    uuid_unparse((const unsigned __int8 *)&xmmword_100057FE8, out);
    if (strlen(out) - 1 >= 0x3F)
      sub_10003B264(dst, buf);
    bonjour_service = nw_advertise_descriptor_create_bonjour_service(out, "_remoted_bp._tcp", "local.");
    nw_advertise_descriptor_set_no_auto_rename(bonjour_service, 1);
    nw_listener_set_advertise_descriptor((nw_listener_t)qword_100057F70, bonjour_service);
    nw_listener_set_new_connection_handler((nw_listener_t)qword_100057F70, &stru_100051EE0);
    nw_listener_set_state_changed_handler((nw_listener_t)qword_100057F70, &stru_100051F00);
    nw_listener_set_advertised_endpoint_changed_handler((nw_listener_t)qword_100057F70, &stru_100051F40);
    nw_listener_set_queue((nw_listener_t)qword_100057F70, (dispatch_queue_t)qword_100057F58);
    nw_listener_start((nw_listener_t)qword_100057F70);
    v18 = sub_100028568();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "init bonjour listener done", buf, 2u);
    }

  }
  else
  {
    v20 = sub_100028568();
    bonjour_service = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(bonjour_service, OS_LOG_TYPE_FAULT))
      sub_10003AD34();
  }

}

void sub_100029494()
{
  id v0;
  NSObject *v1;
  id v2;
  NSObject *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  NSObject *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *v14;
  id v15;
  NSObject *v16;
  void *v17;
  id v18;
  NSObject *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t buf[8];
  _BYTE v26[128];

  v0 = sub_100028568();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "disabling bonjour", buf, 2u);
  }

  if (objc_msgSend((id)qword_100057F60, "name"))
  {
    objc_msgSend((id)qword_100057FD8, "setValue:forKey:", 0, CFSTR("bonjour-interface-name"));
    objc_msgSend((id)qword_100057FD8, "synchronize");
    byte_100057F48 = 0;
    if (qword_100057F68)
    {
      v2 = sub_100028568();
      v3 = objc_claimAutoreleasedReturnValue(v2);
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
        sub_10003B44C();

      nw_browser_cancel((nw_browser_t)qword_100057F68);
      v4 = (void *)qword_100057F68;
      qword_100057F68 = 0;

    }
    if (qword_100057F70)
    {
      v5 = sub_100028568();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        sub_10003B420();

      nw_listener_cancel((nw_listener_t)qword_100057F70);
      v7 = (void *)qword_100057F70;
      qword_100057F70 = 0;

    }
    v8 = sub_100028568();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      sub_10003B3F4();

    v23 = 0u;
    v24 = 0u;
    v21 = 0u;
    v22 = 0u;
    v10 = objc_msgSend((id)qword_100057F40, "copy", 0);
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v22;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v22 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v14), "disconnect");
          v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v12);
    }

    v15 = sub_100028568();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      sub_10003B3C8();

    objc_msgSend((id)qword_100057F50, "removeAllObjects");
    v17 = (void *)qword_100057F60;
    qword_100057F60 = 0;

    v18 = sub_100028568();
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "bonjour disabled", buf, 2u);
    }
  }
  else
  {
    v20 = sub_100028568();
    v19 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_10003B39C();
  }

}

void sub_100029764(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RemoteServiceDiscovery", "BonjourPeer");
  v2 = (void *)qword_100057F78;
  qword_100057F78 = (uint64_t)v1;

}

void sub_100029794(uint64_t a1)
{
  id v2;
  NSObject *v3;

  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    sub_100028CA4(*(char **)(a1 + 40), 5);
  }
  else
  {
    v2 = sub_100028568();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
      sub_10003B478();

    free(*(void **)(a1 + 40));
  }
}

void sub_100029804(uint64_t a1)
{
  CFMutableDictionaryRef v2;
  CFMutableDictionaryRef v3;
  __CFDictionary *v4;
  const __CFDictionary *v5;
  io_service_t MatchingService;
  io_object_t v7;
  id v8;
  NSObject *v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  _OWORD v15[5];

  v2 = IOServiceMatching("AppleUSBDeviceNCMData");
  if (!v2)
    sub_10003B4A4(&v14, v15);
  v3 = v2;
  v4 = IOServiceMatching("IOEthernetInterface");
  if (!v4)
    sub_10003B50C(&v14, v15);
  v5 = v4;
  CFDictionarySetValue(v4, CFSTR("IOParentMatch"), v3);
  CFRelease(v3);
  MatchingService = IOServiceGetMatchingService(kIOMainPortDefault, v5);
  if (MatchingService)
  {
    v7 = MatchingService;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = sub_100010C68(MatchingService, *(char **)(a1 + 56));
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    {
      v8 = sub_100028568();
      v9 = objc_claimAutoreleasedReturnValue(v8);
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10003B5A0();

    }
    IOObjectRelease(v7);
  }
  else
  {
    v10 = sub_100028568();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10003B574();

  }
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24)
    || (v12 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8),
        v13 = *(_DWORD *)(v12 + 24) - 1,
        (*(_DWORD *)(v12 + 24) = v13) == 0))
  {
    dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  }
}

uint64_t sub_100029988(uint64_t a1)
{
  return sub_100028CA4(*(_QWORD *)(a1 + 32), (*(_DWORD *)(a1 + 40) - 1));
}

void sub_10002999C(id a1, OS_nw_browse_result *a2, OS_nw_browse_result *a3, BOOL a4)
{
  OS_nw_browse_result *v5;
  OS_nw_browse_result *v6;
  char changes;
  id v8;
  NSObject *v9;
  OS_nw_browse_result *v10;
  NSObject *v11;
  NSObject *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  NSObject *v17;
  const char *bonjour_service_name;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  id v25;
  void *v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  RSDRemoteBonjourPeerDevice *v31;
  int v32;
  id v33;
  _BOOL4 v34;
  id v35;
  void **v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  NSObject *v40;
  uint64_t v41;
  uuid_t uu;
  uint8_t buf[4];
  _BYTE v44[18];

  v5 = a2;
  v6 = a3;
  changes = nw_browse_result_get_changes((nw_browse_result_t)v5, (nw_browse_result_t)v6);
  v8 = sub_100028568();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)v44 = v5;
    *(_WORD *)&v44[8] = 2112;
    *(_QWORD *)&v44[10] = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "browse_results_changed: %@ -> %@", buf, 0x16u);
  }

  if ((changes & 2) != 0)
    v10 = v6;
  else
    v10 = v5;
  if ((changes & 6) != 0)
  {
    v11 = v10;
    if (!v11)
      sub_10003B5CC(uu, buf);
    v12 = v11;

    v13 = nw_browse_result_copy_endpoint(v12);
    if (!v13)
      sub_100035688(uu, buf);
    v14 = v13;

    v36 = _NSConcreteStackBlock;
    v37 = 3221225472;
    v38 = sub_100029E7C;
    v39 = &unk_100051E40;
    v15 = v14;
    v40 = v15;
    nw_browse_result_enumerate_interfaces(v12, &v36);
    v16 = (void *)nw_endpoint_copy_interface(v15);
    if (!v16)
      sub_10003B634(uu, buf);

    memset(uu, 170, sizeof(uu));
    v17 = v15;
    bonjour_service_name = nw_endpoint_get_bonjour_service_name(v17);
    if (!bonjour_service_name)
      sub_10003B69C(&v41, buf);
    uuid_parse(bonjour_service_name, uu);

    v19 = sub_100028568();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 68157954;
      *(_DWORD *)v44 = 16;
      *(_WORD *)&v44[4] = 2096;
      *(_QWORD *)&v44[6] = &xmmword_100057FE8;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "browser local_device_uuid: %{uuid_t}.16P", buf, 0x12u);
    }

    if (uuid_is_null((const unsigned __int8 *)&xmmword_100057FE8))
      sub_10003B7C4(&v41, buf);
    if (uuid_is_null(uu))
      sub_10003B75C(&v41, buf);
    if (!uuid_compare((const unsigned __int8 *)&xmmword_100057FE8, uu))
    {
      if (!byte_100057F48)
      {
        v35 = sub_100028568();
        v24 = objc_claimAutoreleasedReturnValue(v35);
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "ignoring bonjour event for own uuid", buf, 2u);
        }
        goto LABEL_44;
      }
      sub_100028044((unsigned int *)uu);
      v21 = sub_100028568();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "munging uuid and not ignoring bonjour event for own uuid due to loopback test mode", buf, 2u);
      }

    }
    v23 = objc_alloc((Class)NSUUID);
    v24 = objc_msgSend(v23, "initWithUUIDBytes:", uu, v36, v37, v38, v39);
    if ((changes & 2) != 0)
    {
      if (objc_msgSend((id)qword_100057F50, "containsObject:", v24))
      {
        v27 = sub_100028568();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
          sub_10003B730();

      }
      else
      {
        objc_msgSend((id)qword_100057F50, "addObject:", v24);
      }
      v29 = sub_100029E98(uu);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v29);
      if (v26)
      {
        v30 = sub_100028568();
        v31 = (RSDRemoteBonjourPeerDevice *)objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(&v31->super.super, OS_LOG_TYPE_DEBUG))
          sub_10003B704();
      }
      else
      {
        v32 = uuid_compare((const unsigned __int8 *)&xmmword_100057FE8, uu);
        v33 = sub_100028568();
        v31 = (RSDRemoteBonjourPeerDevice *)objc_claimAutoreleasedReturnValue(v33);
        v34 = os_log_type_enabled(&v31->super.super, OS_LOG_TYPE_DEFAULT);
        if (v32 < 1)
        {
          if (v34)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, &v31->super.super, OS_LOG_TYPE_DEFAULT, "uuid policy: other side will connect", buf, 2u);
          }
        }
        else
        {
          if (v34)
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, &v31->super.super, OS_LOG_TYPE_DEFAULT, "uuid policy: create new device and connect", buf, 2u);
          }

          v31 = -[RSDRemoteBonjourPeerDevice initWithBrowsedEndpointUUID:uuid:]([RSDRemoteBonjourPeerDevice alloc], "initWithBrowsedEndpointUUID:uuid:", v17, uu);
          -[RSDRemoteBonjourPeerDevice attach](v31, "attach");
        }
      }

    }
    else
    {
      if ((changes & 4) == 0)
      {
LABEL_44:

        goto LABEL_45;
      }
      v25 = sub_100029E98(uu);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      objc_msgSend((id)qword_100057F50, "removeObject:", v24);
      if (v26)
      {
        if (objc_msgSend(v26, "state") == 3)
          objc_msgSend(v26, "heartbeatWithCallback:", &stru_100051E60);
        else
          objc_msgSend(v26, "disconnect");
      }
    }

    goto LABEL_44;
  }
LABEL_45:

}

uint64_t sub_100029E7C(uint64_t a1)
{
  nw_endpoint_set_interface(*(_QWORD *)(a1 + 32));
  return 0;
}

id sub_100029E98(const unsigned __int8 *a1)
{
  id v2;
  NSObject *v3;
  id v4;
  id v5;
  id v6;
  void *v7;
  int v8;
  uint64_t v9;
  void *i;
  void *v11;
  id v12;
  NSObject *v13;
  const unsigned __int8 *v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t v23[128];
  uint8_t buf[4];
  int v25;
  __int16 v26;
  const unsigned __int8 *v27;

  v2 = sub_100028568();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 68157954;
    v25 = 16;
    v26 = 2096;
    v27 = a1;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "checking for existing device %{uuid_t}.16P", buf, 0x12u);
  }

  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v4 = (id)qword_100057F40;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v20 != v9)
          objc_enumerationMutation(v4);
        v11 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)i);
        v12 = sub_100028568();
        v13 = objc_claimAutoreleasedReturnValue(v12);
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          v14 = (const unsigned __int8 *)objc_msgSend(v11, "remoteUUID");
          *(_DWORD *)buf = 68157954;
          v25 = 16;
          v26 = 2096;
          v27 = v14;
          _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "comparing against device uuid %{uuid_t}.16P", buf, 0x12u);
        }

        if (!uuid_compare((const unsigned __int8 *)objc_msgSend(v11, "remoteUUID"), a1))
        {
          v15 = v11;

          ++v8;
          v7 = v15;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v6);

    if (v7 && v8 >= 2)
      sub_100035E4C(v16, v17);
  }
  else
  {

    v7 = 0;
  }
  return v7;
}

void sub_10002A0B8(id a1, BOOL a2)
{
  id v3;
  NSObject *v4;

  v3 = sub_100028568();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
    sub_100035E64(a2, v4);

}

void sub_10002A100(id a1, int a2, OS_nw_error *a3)
{
  OS_nw_error *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  id v10;
  id v11;
  NSObject *v12;
  nw_error_domain_t error_domain;
  int error_code;
  void *v15;
  dispatch_time_t v16;
  id v17;
  NSObject *v18;
  id v19;
  int v20;
  OS_nw_error *v21;

  v4 = a3;
  switch(a2)
  {
    case 4:
      v10 = sub_100028568();
      v6 = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        v20 = 138412290;
        v21 = v4;
        v7 = "nw_browser_state_waiting: %@";
        v8 = v6;
        v9 = 12;
        goto LABEL_8;
      }
LABEL_20:

      break;
    case 2:
      v11 = sub_100028568();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10003B8FC();

      error_domain = nw_error_get_error_domain((nw_error_t)v4);
      error_code = nw_error_get_error_code((nw_error_t)v4);
      if (error_domain == nw_error_domain_dns && (error_code == -65563 || error_code == -65568))
      {
        nw_browser_cancel((nw_browser_t)qword_100057F68);
        v15 = (void *)qword_100057F68;
        qword_100057F68 = 0;

        v16 = dispatch_time(0, 5000000000);
        dispatch_after(v16, (dispatch_queue_t)qword_100057F58, &stru_100051EA0);
      }
      break;
    case 1:
      v5 = sub_100028568();
      v6 = objc_claimAutoreleasedReturnValue(v5);
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v20) = 0;
        v7 = "browsing for other bonjour remoted instances";
        v8 = v6;
        v9 = 2;
LABEL_8:
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, v7, (uint8_t *)&v20, v9);
        goto LABEL_20;
      }
      goto LABEL_20;
    default:
      v17 = sub_100028568();
      v18 = objc_claimAutoreleasedReturnValue(v17);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10003B88C(a2, v18);

      if (v4)
      {
        v19 = sub_100028568();
        v6 = objc_claimAutoreleasedReturnValue(v19);
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
          sub_10003B82C();
        goto LABEL_20;
      }
      break;
  }

}

void sub_10002A314(id a1)
{
  BOOL v1;

  if (qword_100057F60)
    v1 = qword_100057F68 == 0;
  else
    v1 = 0;
  if (v1)
    sub_100029028((uint64_t)objc_msgSend((id)qword_100057F60, "index"));
}

void sub_10002A34C(id a1, OS_nw_connection *a2)
{
  OS_nw_connection *v2;
  id v3;
  NSObject *v4;
  NSObject *v5;
  NSObject *v6;
  id v7;
  NSObject *v8;
  uint64_t description;
  const sockaddr *address;
  void *address_with_port;
  id v12;
  NSObject *v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  void *v23;
  uint64_t v24;
  void *v25;
  NSObject *v26;
  nw_endpoint_type_t type;
  NSObject *v28;
  const sockaddr *v29;
  void *v30;
  const sockaddr *v31;
  void *v32;
  id v33;
  NSObject *v34;
  id v35;
  NSObject *v36;
  void *v37;
  id v38;
  NSObject *v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  id v44;
  NSObject *v45;
  void *v46;
  id v47;
  NSObject *v48;
  void *v49;
  NSObject *v50;
  void *v51;
  id v52;
  NSObject *v53;
  id v54;
  RSDRemoteBonjourPeerDevice *v55;
  NSObject *v56;
  NSObject *v57;
  OS_nw_connection *v58;
  int v59;
  void *v60;
  uint8_t v61;
  char v62[15];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  uint8_t buf[4];
  OS_nw_connection *v68;
  __int16 v69;
  uint64_t v70;
  uint8_t v71[4];
  uint64_t v72;

  v2 = a2;
  v3 = sub_100028568();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v68 = v2;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@> got incoming remoted connection", buf, 0xCu);
  }

  v5 = nw_connection_copy_current_path((nw_connection_t)v2);
  v6 = nw_path_copy_effective_remote_endpoint(v5);
  v7 = sub_100028568();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    description = nw_endpoint_get_description(v6);
    *(_DWORD *)buf = 138543618;
    v68 = v2;
    v69 = 2080;
    v70 = description;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%{public}@> remote endpoint: %s", buf, 0x16u);
  }

  if (nw_endpoint_get_type(v6) != nw_endpoint_type_address)
    sub_10003BAB4(&v63, buf);
  address = nw_endpoint_get_address(v6);
  address_with_port = (void *)nw_endpoint_create_address_with_port(address, "0");
  v12 = sub_100028568();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    sub_10003BA18((uint64_t)v2, (uint64_t)address_with_port, v13);

  v14 = address_with_port;
  v15 = sub_100028568();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = nw_endpoint_get_description(v14);
    *(_DWORD *)v71 = 136315138;
    v72 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "checking for existing device endpoint %s", v71, 0xCu);
  }

  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v18 = (id)qword_100057F40;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, buf, 16);
  if (v19)
  {
    v20 = v19;
    v56 = v6;
    v57 = v5;
    v60 = 0;
    v59 = 0;
    v21 = *(_QWORD *)v64;
    v58 = v2;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(_QWORD *)v64 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v63 + 1) + 8 * (_QWORD)i);
        v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "address_endpoint", v56, v57, v58));
        if (v24)
        {
          v25 = (void *)v24;
          v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "address_endpoint"));
          type = nw_endpoint_get_type(v26);

          if (type == nw_endpoint_type_address)
          {
            v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "address_endpoint"));
            v29 = nw_endpoint_get_address(v28);
            v30 = (void *)nw_endpoint_create_address_with_port(v29, "0");

            v31 = nw_endpoint_get_address(v14);
            v32 = (void *)nw_endpoint_create_address_with_port(v31, "0");
            v33 = sub_100028568();
            v34 = objc_claimAutoreleasedReturnValue(v33);
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v71 = 138412290;
              v72 = (uint64_t)v30;
              _os_log_debug_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEBUG, "stripped current endpoint %@", v71, 0xCu);
            }

            v35 = sub_100028568();
            v36 = objc_claimAutoreleasedReturnValue(v35);
            if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)v71 = 138412290;
              v72 = (uint64_t)v32;
              _os_log_debug_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEBUG, "stripped target  endpoint %@", v71, 0xCu);
            }

            if (objc_msgSend(v30, "isEqual:", v32))
            {
              if (byte_100057F48
                && (v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "bonjour_endpoint")),
                    v37,
                    v37))
              {
                v38 = sub_100028568();
                v39 = objc_claimAutoreleasedReturnValue(v38);
                if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
                  sub_10003B9DC(&v61, v62, v39);

              }
              else
              {
                v40 = v23;

                ++v59;
                v60 = v40;
              }
            }

          }
        }
      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v63, buf, 16);
    }
    while (v20);

    v43 = v60;
    if (v60 && v59 >= 2)
      sub_10003B9C4(v41, v42);

    v5 = v57;
    v2 = v58;
    v6 = v56;
    if (v60)
    {
      v44 = sub_100028568();
      v45 = objc_claimAutoreleasedReturnValue(v44);
      if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v68 = (OS_nw_connection *)v60;
        _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "%{public}@> reusing existing device for incoming connection endpoint", buf, 0xCu);
      }

      v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "connection"));
      if (v46)
      {
        v47 = sub_100028568();
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v68 = (OS_nw_connection *)v60;
          _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "%{public}@> canceling existing connection to replace it", buf, 0xCu);
        }

        v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "peerconn"));
        if (v49)
        {
          v50 = objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "peerconn"));
          nw_connection_cancel(v50);

        }
        v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "connection"));
        xpc_remote_connection_cancel(v51);

        objc_msgSend(v60, "setPeerconn:", v58);
      }
      else
      {
        objc_msgSend(v60, "setPeerconn:", v58);
        objc_msgSend(v60, "needsConnect");
      }
      goto LABEL_47;
    }
  }
  else
  {

  }
  v52 = sub_100028568();
  v53 = objc_claimAutoreleasedReturnValue(v52);
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v68 = v2;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "%{public}@> did not find existing device, creating new device for incoming connection endpoint", buf, 0xCu);
  }

  v54 = (id)nw_path_copy_interface(v5);
  if (!v54)
    sub_10003B95C(&v63, buf);
  v43 = v54;

  nw_endpoint_set_interface(v14);
  v55 = -[RSDRemoteBonjourPeerDevice initWithIncomingEndpoint:]([RSDRemoteBonjourPeerDevice alloc], "initWithIncomingEndpoint:", v14);
  -[RSDRemoteBonjourPeerDevice setPeerconn:](v55, "setPeerconn:", v2);
  -[RSDRemoteBonjourPeerDevice attach](v55, "attach");

LABEL_47:
}

void sub_10002A9D0(id a1, int a2, OS_nw_error *a3)
{
  OS_nw_error *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  void *v8;
  int port;
  int v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  uint64_t description;
  uint64_t v16;
  id v17;
  NSObject *v18;
  id v19;
  NSObject *v20;
  nw_error_domain_t error_domain;
  int error_code;
  void *v23;
  dispatch_time_t v24;
  id v25;
  int v26;
  uint64_t v27;
  __int16 v28;
  int v29;
  __int16 v30;
  NSObject *v31;

  v4 = a3;
  v5 = v4;
  if (a2 == 3)
  {
    v19 = sub_100028568();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_10003BB7C();

    error_domain = nw_error_get_error_domain(v5);
    error_code = nw_error_get_error_code(v5);
    if (error_domain == nw_error_domain_dns && (error_code == -65563 || error_code == -65568))
    {
      nw_listener_cancel((nw_listener_t)qword_100057F70);
      v23 = (void *)qword_100057F70;
      qword_100057F70 = 0;

      v24 = dispatch_time(0, 5000000000);
      dispatch_after(v24, (dispatch_queue_t)qword_100057F58, &stru_100051F20);
    }
  }
  else if (a2 == 2)
  {
    v6 = sub_100028568();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = (void *)nw_listener_copy_local_endpoint(qword_100057F70);
      v26 = 138412802;
      v27 = (uint64_t)v8;
      v28 = 1024;
      v29 = 2;
      v30 = 2112;
      v31 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "listening on %@ (state %u, error %@)", (uint8_t *)&v26, 0x1Cu);

    }
    port = nw_listener_get_port((nw_listener_t)qword_100057F70);
    if (port)
    {
      v10 = port;
      v11 = sub_100028568();
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v26 = 67109120;
        LODWORD(v27) = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "listener port: %u", (uint8_t *)&v26, 8u);
      }

      v13 = nw_listener_copy_local_endpoint(qword_100057F70);
      v14 = v13;
      if (v13)
      {
        description = nw_endpoint_get_description(v13);
        if (description)
        {
          v16 = description;
          v17 = sub_100028568();
          v18 = objc_claimAutoreleasedReturnValue(v17);
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            v26 = 136315138;
            v27 = v16;
            _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "listener local endpoint: %s", (uint8_t *)&v26, 0xCu);
          }

        }
      }
LABEL_22:

    }
  }
  else if (v4)
  {
    v25 = sub_100028568();
    v14 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      sub_10003BB1C();
    goto LABEL_22;
  }

}

void sub_10002AC74(id a1)
{
  BOOL v1;

  if (qword_100057F60)
    v1 = qword_100057F70 == 0;
  else
    v1 = 0;
  if (v1)
    sub_100029164((uint64_t)objc_msgSend((id)qword_100057F60, "index"));
}

void sub_10002ACAC(id a1, OS_nw_endpoint *a2, BOOL a3)
{
  _BOOL4 v3;
  OS_nw_endpoint *v4;
  id v5;
  NSObject *v6;
  const char *v7;
  int v8;
  OS_nw_endpoint *v9;
  __int16 v10;
  const char *v11;

  v3 = a3;
  v4 = a2;
  v5 = sub_100028568();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = "removed";
    if (v3)
      v7 = "added";
    v8 = 138412546;
    v9 = v4;
    v10 = 2080;
    v11 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "advertised endpoint %@ %s", (uint8_t *)&v8, 0x16u);
  }

}

void sub_10002AD84(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

NSObject *sub_10002AD94(uint64_t a1, int a2)
{
  nw_parameters_t secure_tcp;
  NSObject *v5;
  NSObject *v6;
  NSObject *v7;
  id v8;
  NSObject *v9;
  uint64_t v11;
  __int128 v12[5];

  secure_tcp = nw_parameters_create_secure_tcp(_nw_parameters_configure_protocol_disable, _nw_parameters_configure_protocol_default_configuration);
  if (!(_DWORD)a1)
    sub_100039838(&v11, v12);
  v5 = secure_tcp;
  v6 = nw_interface_create_with_index(a1);
  if (v6)
  {
    nw_parameters_require_interface(v5, v6);
    nw_parameters_set_local_only(v5, 1);
    nw_parameters_set_required_address_family(v5, 30);
    nw_parameters_set_required_interface_type(v5, nw_interface_type_wired);
    nw_parameters_set_no_fallback(v5, 1);
    nw_parameters_set_indefinite(v5, 0);
    xpc_remote_connection_setup_nw_parameters(v5, a2);
    v7 = v5;
  }
  else
  {
    v8 = sub_10002AEC8();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_1000399AC(v9);

    v7 = 0;
  }

  return v7;
}

id sub_10002AEC8()
{
  if (qword_100057FA0 != -1)
    dispatch_once(&qword_100057FA0, &stru_100051FA8);
  return (id)qword_100057F98;
}

void sub_10002AF08(void *a1)
{
  id v1;
  void *v2;
  id v3;

  v1 = a1;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "interface"));
  objc_msgSend(v1, "setBackendProperty:withUint:", "InterfaceIndex", objc_msgSend(v2, "index"));

  v3 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "interface"));
  objc_msgSend(v1, "setBackendProperty:withString:", "InterfaceName", objc_msgSend(v3, "name"));

}

BOOL sub_10002AF88()
{
  if (qword_100057F90 != -1)
    dispatch_once(&qword_100057F90, &stru_100051F60);
  return (byte_100057F88 & 1) == 0;
}

void sub_10002AFD0(id a1)
{
  uint64_t v1;

  v1 = 0;
  if (os_parse_boot_arg_int("rsd_no_bonjour", &v1))
    byte_100057F88 = 1;
}

uint64_t sub_10002B308(uint64_t a1)
{
  uint64_t v2;
  _OWORD v3[5];

  if (!a1)
    sub_10003BC3C(&v2, v3);
  return 33022;
}

void sub_10002B7F0(void *a1, uint64_t a2, int a3)
{
  id v5;
  NSObject *v6;
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  id v12;
  NSObject *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint8_t buf[88];

  v5 = sub_10002AEC8();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    sub_10003BDD4(a3, v6);

  v7 = a1;
  if (!v7)
    sub_10003ACCC(&v16, buf);
  v8 = v7;

  switch(a3)
  {
    case -536870896:
      v12 = sub_10002AEC8();
      v13 = objc_claimAutoreleasedReturnValue(v12);
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "[%p] kIOMessageServiceIsTerminated", buf, 0xCu);
      }

      objc_msgSend(v8, "deactivate");
      v11 = 3;
      goto LABEL_18;
    case -536771840:
      v14 = sub_10002AEC8();
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[%p] kIONetworkLinkStateActive", buf, 0xCu);
      }

      if (!objc_msgSend(v8, "state"))
      {
        v11 = 1;
        goto LABEL_18;
      }
      break;
    case -536771839:
      v9 = sub_10002AEC8();
      v10 = objc_claimAutoreleasedReturnValue(v9);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        *(_QWORD *)&buf[4] = v8;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "[%p] kIONetworkLinkStateInactive", buf, 0xCu);
      }

      if (objc_msgSend(v8, "state") != (id)3)
      {
        v11 = 0;
LABEL_18:
        objc_msgSend(v8, "advanceState:", v11);
      }
      break;
  }

}

id sub_10002BE68(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addressWithRetry");
}

id sub_10002C1DC(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "addressWithRetry");
}

uint64_t sub_10002C1E4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_10002C1F4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

uint64_t sub_10002C204(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void sub_10002C42C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.RemoteServiceDiscovery", "ncm_common");
  v2 = (void *)qword_100057F98;
  qword_100057F98 = (uint64_t)v1;

}

void sub_10002C45C()
{
  id v0;
  NSObject *v1;
  RSDRemoteLoopbackDevice *v2;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint8_t buf[88];

  v0 = (id)qword_100057FA8;
  if (!v0)
    sub_100037AD8(&v5, buf);

  if (dword_100057C3C == 3)
  {
    if (qword_100057FB8)
      sub_10003C244(&v5, buf);
    v1 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Attaching loopback device.", buf, 2u);
    }
    v2 = -[RSDRemoteDevice initWithName:]([RSDRemoteLoopbackDevice alloc], "initWithName:", "localhost");
    v3 = (void *)qword_100057FB8;
    qword_100057FB8 = (uint64_t)v2;

    dword_100057C3C = 1;
    objc_msgSend((id)qword_100057FB8, "setBackendProperty:withBool:", "IsLoopback", 1);
    objc_msgSend((id)qword_100057FB8, "attach");
  }
  else
  {
    v4 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = dword_100057C3C;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Cannot attach loopback, state = %d", buf, 8u);
    }
  }
}

void sub_10002C5D4()
{
  void *v0;
  id v1;

  v1 = (id)objc_claimAutoreleasedReturnValue(+[RSDRemoteDevice tlsOidsRequiredOfPeer](RSDRemoteLoopbackDevice, "tlsOidsRequiredOfPeer"));
  v0 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "allObjects"));
  sub_100019018(v0, &stru_100051FE0);

}

void sub_10002C628(id a1)
{
  id v1;
  int v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t version_flags;
  void *v6;
  id v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[88];

  v1 = (id)qword_100057FA8;
  if (!v1)
    sub_100037AD8(&v14, buf);

  v2 = dword_100057C3C;
  if (dword_100057C3C == 1)
  {
    v3 = qword_100057FB8;
    if (!qword_100057FB8)
      sub_10003C2AC(&v14, buf);
    v4 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = v3;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "%{public}@> Connecting to loopback device", buf, 0xCu);
    }
    version_flags = xpc_remote_connection_get_version_flags();
    v14 = 0;
    *(_QWORD *)buf = 0;
    xpc_remote_connection_create_connected_ipv6_pair(buf, &v14, qword_100057FA8, version_flags, 0);
    v6 = *(void **)buf;
    v7 = *(id *)buf;
    v8 = v14;
    v9 = v14;
    objc_storeStrong((id *)&qword_100057FC0, v6);
    objc_storeStrong((id *)&qword_100057FC8, v8);
    byte_100057FD1 = 0;
    objc_msgSend((id)qword_100057FB8, "connect:", qword_100057FC8);
    xpc_remote_connection_set_event_handler(qword_100057FC0, &stru_100052020);
    if (objc_msgSend((id)qword_100057FB8, "tlsEnabled"))
    {
      v10 = sub_1000194E4();
      if (!v10)
        sub_1000316D8(0, v11);
      v12 = v10;
      xpc_remote_connection_set_tls(qword_100057FC0, v10, &stru_100052080, qword_100057FA8);

    }
    xpc_remote_connection_activate(qword_100057FC0);
    dword_100057C3C = 2;

  }
  else
  {
    v13 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = v2;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Cannot connect loopback, state = %d", buf, 8u);
    }
  }
}

void sub_10002C848()
{
  id v0;
  NSObject *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint8_t buf[88];

  v0 = (id)qword_100057FA8;
  if (!v0)
    sub_100037AD8(&v7, buf);

  if (dword_100057C3C == 3)
  {
    v1 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = dword_100057C3C;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Cannot disconnect loopback, state = %d", buf, 8u);
    }
  }
  else
  {
    if (!qword_100057FB8)
      sub_10003C2AC(&v7, buf);
    v2 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = qword_100057FB8;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%{public}@> Disconnecting loopback device", buf, 0xCu);
    }
    if (dword_100057C3C == 2)
    {
      if (!qword_100057FC0)
        sub_10003C314(&v7, buf);
      xpc_remote_connection_cancel();
      v3 = (void *)qword_100057FC0;
      qword_100057FC0 = 0;

      v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057FB8, "connection"));
      if (v4)
      {
        v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_100057FB8, "connection"));
        xpc_remote_connection_cancel();

        objc_msgSend((id)qword_100057FB8, "setConnection:", 0);
      }
      v6 = (void *)qword_100057FC8;
      if (!qword_100057FC8)
        sub_10003C37C(&v7, buf);
      qword_100057FC8 = 0;

    }
    dword_100057C3C = 3;
    byte_100057FD0 = 0;
  }
}

void sub_10002CA28()
{
  id v0;
  NSObject *v1;
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint8_t buf[88];

  v0 = (id)qword_100057FA8;
  if (!v0)
    sub_100037AD8(&v4, buf);

  if (dword_100057C3C == 3)
  {
    v1 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = dword_100057C3C;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_DEFAULT, "Cannot detach loopback, state = %d", buf, 8u);
    }
  }
  else
  {
    if (!qword_100057FB8)
      sub_10003C2AC(&v4, buf);
    v2 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = qword_100057FB8;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "%{public}@> Detaching loopback device", buf, 0xCu);
    }
    sub_10002C848();
    objc_msgSend((id)qword_100057FB8, "disconnect");
    v3 = (void *)qword_100057FB8;
    qword_100057FB8 = 0;

  }
}

void sub_10002CB78()
{
  id v0;
  NSObject *v1;
  NSObject *v2;
  uint64_t v3;
  uint8_t buf[88];

  v0 = (id)qword_100057FA8;
  if (!v0)
    sub_100037AD8(&v3, buf);

  if (dword_100057C3C == 2)
  {
    if (!qword_100057FB8)
      sub_10003C2AC(&v3, buf);
    v1 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = qword_100057FB8;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%{public}@> Suspending loopback device", buf, 0xCu);
    }
    byte_100057FD0 = 1;
  }
  else
  {
    v2 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = dword_100057C3C;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cannot suspend loopback, state = %d", buf, 8u);
    }
  }
}

void sub_10002CCC4()
{
  id v0;
  NSObject *v1;
  NSObject *v2;
  uint64_t v3;
  uint8_t buf[88];

  v0 = (id)qword_100057FA8;
  if (!v0)
    sub_100037AD8(&v3, buf);

  if (dword_100057C3C == 2)
  {
    if (!qword_100057FB8)
      sub_10003C2AC(&v3, buf);
    v1 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = qword_100057FB8;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%{public}@> Resuming loopback device", buf, 0xCu);
    }
    byte_100057FD0 = 0;
    objc_msgSend((id)qword_100057FB8, "drainPendedRequests");
  }
  else
  {
    v2 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = dword_100057C3C;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Cannot resume loopback, state = %d", buf, 8u);
    }
  }
}

void sub_10002CE0C()
{
  id v0;
  NSObject *v1;
  xpc_object_t v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t buf[88];

  v0 = (id)qword_100057FA8;
  if (!v0)
    sub_100037AD8(&v4, buf);

  if (dword_100057C3C == 2)
  {
    if (!qword_100057FB8)
      sub_10003C2AC(&v4, buf);
    if (!qword_100057FC0)
      sub_10003C314(&v4, buf);
    v1 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      *(_QWORD *)&buf[4] = qword_100057FB8;
      _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "%{public}@> Resetting loopback device", buf, 0xCu);
    }
    v2 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_string(v2, "MessageType", "Reset");
    xpc_remote_connection_send_message_with_reply(qword_100057FC0, v2, qword_100057FA8, &stru_100052000);

  }
  else
  {
    v3 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)&buf[4] = dword_100057C3C;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Cannot reset loopback, state = %d", buf, 8u);
    }
  }
}

void sub_10002CFA8(id a1, OS_xpc_object *a2)
{
  id v2;

  byte_100057FD1 = 1;
  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "MessageType", "ResetGoahead");
  xpc_remote_connection_send_message(qword_100057FC0, v2);

}

void sub_10002D008(id obj)
{
  os_log_t v2;
  void *v3;
  id v4;

  objc_storeStrong((id *)&qword_100057FA8, obj);
  v4 = obj;
  v2 = os_log_create("com.apple.RemoteServiceDiscovery", "loopback");
  v3 = (void *)qword_100057FB0;
  qword_100057FB0 = (uint64_t)v2;

}

void sub_10002D680(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  const char *string;
  const char *v4;
  xpc_object_t value;
  id v6;
  xpc_object_t reply;
  id v8;
  id v9;
  void *v10;
  xpc_object_t v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t reply_msg_id;
  uint64_t v21;
  _QWORD v22[5];
  _OWORD v23[5];

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_error)
  {
    if (byte_100057FD1 != 1)
      goto LABEL_18;
    goto LABEL_13;
  }
  string = xpc_dictionary_get_string(v2, "MessageType");
  if (!string)
  {
    v12 = qword_100057FB0;
    if (os_log_type_enabled((os_log_t)qword_100057FB0, OS_LOG_TYPE_ERROR))
      sub_10003C7C0(v12, v13, v14, v15, v16, v17, v18, v19);
    sub_10002CA28();
    goto LABEL_18;
  }
  v4 = string;
  if (!strcmp(string, "Handshake") || !strcmp(v4, "StartTls"))
  {
    xpc_remote_connection_send_message(qword_100057FC0, v2);
    goto LABEL_18;
  }
  if (!strcmp(v4, "Heartbeat"))
  {
    reply_msg_id = _xpc_dictionary_get_reply_msg_id(v2);
    _xpc_dictionary_set_reply_msg_id(v2, 0);
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10002D90C;
    v22[3] = &unk_100052040;
    v22[4] = reply_msg_id;
    xpc_remote_connection_send_message_with_reply(qword_100057FC0, v2, qword_100057FA8, v22);
    goto LABEL_18;
  }
  if (!strcmp(v4, "Reset"))
  {
    reply = xpc_dictionary_create_reply(v2);
    xpc_dictionary_set_string(reply, "Result", "Ok");
    xpc_dictionary_send_reply(reply);
LABEL_21:

    goto LABEL_18;
  }
  if (!strcmp(v4, "ResetGoahead"))
  {
LABEL_13:
    sub_10002C848();
    dword_100057C3C = 1;
    sub_10002C5D4();
    goto LABEL_18;
  }
  if (!strcmp(v4, "Timesync"))
  {
    value = xpc_dictionary_get_value(v2, "TimesyncPayload");
    v6 = (id)objc_claimAutoreleasedReturnValue(value);
    if (!v6)
      sub_10003C830(&v21, v23);
    reply = v6;

    v8 = sub_10000E3A0(reply, (void *)qword_100057FB0);
    v9 = (id)objc_claimAutoreleasedReturnValue(v8);
    if (!v9)
      sub_10003C898(&v21, v23);
    v10 = v9;

    v11 = xpc_dictionary_create_reply(v2);
    xpc_dictionary_set_value(v11, "TimesyncPayload", v10);
    xpc_dictionary_send_reply(v11);

    goto LABEL_21;
  }
LABEL_18:

}

void sub_10002D90C(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_error)
  {
    _xpc_dictionary_set_reply_msg_id(v3, *(_QWORD *)(a1 + 32));
    _xpc_dictionary_set_remote_connection(v3, qword_100057FC0);
    xpc_dictionary_send_reply(v3);
  }

}

void sub_10002D974(id a1, OS_sec_protocol_metadata *a2, OS_sec_trust *a3, id a4)
{
  void *v5;
  uint64_t v6;
  void (**v7)(id, uint64_t);

  v5 = (void *)qword_100057FB8;
  v7 = (void (**)(id, uint64_t))a4;
  v6 = sub_100019990(v5, a3);
  v7[2](v7, v6);

}

void sub_10002D9C8(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0x12u);
}

int *sub_10002D9F4()
{
  return __error();
}

uint64_t sntp_shortstamp_ntoh(unsigned int a1)
{
  return __rev16(a1);
}

unint64_t sntp_timestamp_hton(unint64_t a1)
{
  return __rev32(a1);
}

unint64_t sntp_timestamp_ntoh(unint64_t a1)
{
  return __rev32(a1);
}

uint64_t sntp_timestamp_to_datestamp(uint64_t result)
{
  return result;
}

unint64_t sntp_timestamp_from_datestamp(unsigned int a1, uint64_t a2)
{
  return a2 & 0xFFFFFFFF00000000 | a1;
}

uint64_t sntp_datestamp_to_nsec(unint64_t a1, unint64_t a2)
{
  return 1000000000 * a1
       + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
       + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64);
}

uint64_t sntp_datestamp_to_timespec(unint64_t a1, unint64_t a2)
{
  return (uint64_t)(1000000000 * a1
                 + __CFADD__(1000000000 * a2, (uint64_t)((__PAIR128__(a1, a2) * 0x3B9ACA00) >> 64) >> 63)
                 + ((a2 * (unsigned __int128)0x3B9ACA00uLL) >> 64))
       / 1000000000;
}

uint64_t sntp_datestamp_from_timespec(uint64_t a1, uint64_t a2)
{
  __udivti3(499999744, a2, 1000000000, 0);
  return a1;
}

uint64_t sntp_calc_offset(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unsigned __int128 v14;

  v2 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 4));
  v4 = v3;
  v5 = -v2;
  v6 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 12));
  v8 = v7;
  v9 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 20));
  v11 = v10;
  v12 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 28));
  v14 = __PAIR128__(v5 - (v4 != 0) + __CFADD__(-v4, v8) + v6 + (unint64_t)__CFADD__(v8 - v4, v11) + v9, v8 - v4 + v11)- v13;
  return (__CFADD__((_QWORD)v14, (unint64_t)(*((_QWORD *)&v14 + 1) - v12) >> 63) + *((_QWORD *)&v14 + 1) - v12) >> 1;
}

uint64_t sntp_calc_delay(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unint64_t v14;

  v2 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 4));
  v4 = v3;
  v5 = -v2;
  v6 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 12));
  v8 = v7;
  v9 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 20));
  v11 = v10;
  v12 = -v9;
  v13 = sntp_timestamp_to_datestamp(*(_QWORD *)(a1 + 28));
  return v13
       + ((__PAIR128__(v5 - (v4 != 0) + (unint64_t)__CFADD__(-v4, v8) + v6, v8 - v4) - v11 + __PAIR128__(v12, v14)) >> 64);
}

unint64_t sntp_packet_ntoh@<X0>(__int128 *a1@<X0>, uint64_t a2@<X8>)
{
  unint64_t result;
  __int128 v5;
  uint64_t v6;

  *(_OWORD *)(a2 + 16) = 0u;
  *(_OWORD *)(a2 + 32) = 0u;
  *(_OWORD *)a2 = 0u;
  v5 = *a1;
  v6 = *((_QWORD *)a1 + 2);
  sntp_header_ntoh((int *)&v5, a2);
  *(_QWORD *)(a2 + 24) = sntp_timestamp_ntoh(*((_QWORD *)a1 + 3));
  *(_QWORD *)(a2 + 32) = sntp_timestamp_ntoh(*((_QWORD *)a1 + 4));
  result = sntp_timestamp_ntoh(*((_QWORD *)a1 + 5));
  *(_QWORD *)(a2 + 40) = result;
  return result;
}

unint64_t sntp_header_ntoh@<X0>(int *a1@<X0>, uint64_t a2@<X8>)
{
  unsigned int v4;
  int v5;
  int v6;
  unsigned int v7;
  unint64_t result;

  v5 = *a1;
  v4 = a1[1];
  *(_DWORD *)a2 = v5;
  *(_DWORD *)(a2 + 4) = sntp_shortstamp_ntoh(v4);
  v6 = sntp_shortstamp_ntoh(a1[2]);
  v7 = bswap32(a1[3]);
  *(_DWORD *)(a2 + 8) = v6;
  *(_DWORD *)(a2 + 12) = v7;
  result = sntp_timestamp_ntoh(*((_QWORD *)a1 + 2));
  *(_QWORD *)(a2 + 16) = result;
  return result;
}

unint64_t sntp_server_respond@<X0>(uint64_t a1@<X0>, uint64_t a2@<X1>, uint64_t (*a3)(void)@<X2>, uint64_t a4@<X8>)
{
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t result;

  v8 = a3();
  *(_OWORD *)a4 = *(_OWORD *)a2;
  v9 = *(_QWORD *)(a1 + 40);
  *(_QWORD *)(a4 + 16) = *(_QWORD *)(a2 + 16);
  *(_QWORD *)(a4 + 24) = v9;
  *(_QWORD *)(a4 + 32) = sntp_timestamp_hton(v8);
  v10 = a3();
  result = sntp_timestamp_hton(v10);
  *(_QWORD *)(a4 + 40) = result;
  if (__ROR8__(v10, 32) < __ROR8__(v8, 32))
  {
    *(_BYTE *)(a4 + 1) = 0;
    *(_DWORD *)(a4 + 12) = 1398031696;
  }
  return result;
}

unint64_t sntp_client_process_response@<X0>(unsigned __int8 *a1@<X0>, unint64_t *a2@<X1>, _QWORD *a3@<X2>, uint64_t a4@<X8>)
{
  unint64_t v8;
  unint64_t v9;
  __int128 v10;
  unint64_t result;
  __int128 v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  __int128 v16[3];
  _OWORD v17[3];

  *(_OWORD *)(a4 + 48) = 0u;
  *(_OWORD *)(a4 + 64) = 0u;
  *(_OWORD *)(a4 + 16) = 0u;
  *(_OWORD *)(a4 + 32) = 0u;
  *(_OWORD *)a4 = 0u;
  if (a2)
  {
    v8 = *a2;
    *(_QWORD *)(a4 + 4) = *a2;
    v9 = HIDWORD(v8);
    if (!a3)
      goto LABEL_4;
    goto LABEL_3;
  }
  LODWORD(v9) = 0;
  LODWORD(v8) = 0;
  if (a3)
LABEL_3:
    *(_QWORD *)(a4 + 28) = *a3;
LABEL_4:
  v10 = *((_OWORD *)a1 + 1);
  v16[0] = *(_OWORD *)a1;
  v16[1] = v10;
  v16[2] = *((_OWORD *)a1 + 2);
  result = sntp_packet_ntoh(v16, (uint64_t)v17);
  v12 = v17[1];
  *(_OWORD *)a1 = v17[0];
  *((_OWORD *)a1 + 1) = v12;
  *((_OWORD *)a1 + 2) = v17[2];
  *(_OWORD *)(a4 + 36) = *(_OWORD *)a1;
  *(_QWORD *)(a4 + 52) = *((_QWORD *)a1 + 2);
  v13 = *((_QWORD *)a1 + 4);
  v14 = *((_QWORD *)a1 + 5);
  *(_QWORD *)(a4 + 12) = v13;
  *(_QWORD *)(a4 + 20) = v14;
  if (*a1 <= 0xBFu)
  {
    if (a1[1])
    {
      if (__ROR8__(v14, 32) >= __ROR8__(v13, 32))
      {
        if (a2)
        {
          if (*((_DWORD *)a1 + 6) != (_DWORD)v8 || *((_DWORD *)a1 + 7) != (_DWORD)v9)
          {
            v15 = 10;
            goto LABEL_19;
          }
          if (a3)
          {
            result = sntp_calc_delay(a4);
            if ((result & 0x8000000000000000) != 0)
            {
              v15 = 11;
              goto LABEL_19;
            }
          }
        }
        v15 = 0;
      }
      else
      {
        v15 = 12;
      }
    }
    else
    {
      v15 = 8;
    }
  }
  else
  {
    v15 = 9;
  }
LABEL_19:
  *(_DWORD *)a4 = v15;
  return result;
}

uint64_t X509PolicyCheckForBlockedKeys(uint64_t a1)
{
  uint64_t result;

  result = compare_octet_string(a1 + 88, (uint64_t)&BlockedYonkersSPKI);
  if (!(_DWORD)result)
    *(_QWORD *)(a1 + 240) &= 0xFFFFFFFFFFF3FFFFLL;
  return result;
}

uint64_t compare_octet_string(uint64_t a1, uint64_t a2)
{
  size_t v2;
  size_t v3;

  v2 = *(_QWORD *)(a1 + 8);
  v3 = *(_QWORD *)(a2 + 8);
  if (v2 == v3)
    return memcmp(*(const void **)a1, *(const void **)a2, v2);
  if (v2 > v3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t compare_octet_string_raw(uint64_t a1, const void *a2, size_t a3)
{
  size_t v3;

  v3 = *(_QWORD *)(a1 + 8);
  if (v3 == a3)
    return memcmp(*(const void **)a1, a2, a3);
  if (v3 > a3)
    return 0xFFFFFFFFLL;
  return 1;
}

uint64_t ccder_blob_decode_AlgorithmIdentifierNULL(unint64_t *a1, unint64_t *a2)
{
  uint64_t result;
  unint64_t v5;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  uint64_t v16;

  v16 = 0;
  v15 = 0;
  result = ccder_blob_decode_tl(a1, 0x2000000000000010, &v16);
  if ((_DWORD)result)
  {
    v13 = 0xAAAAAAAAAAAAAAAALL;
    v14 = 0xAAAAAAAAAAAAAAAALL;
    v5 = *a1;
    if (!__CFADD__(*a1, v16))
    {
      if (v5 > v5 + v16 || v5 + v16 > a1[1])
        goto LABEL_28;
      v13 = *a1;
      v14 = v5 + v16;
      result = ccder_blob_decode_tl(&v13, 6, &v15);
      if (!(_DWORD)result)
        return result;
      v7 = v15;
      v8 = v13;
      if (a2)
      {
        if (v14 < v13 || v15 > v14 - v13)
          goto LABEL_28;
        *a2 = v13;
        a2[1] = v7;
      }
      if (!__CFADD__(v8, v7))
      {
        v9 = v8 + v7;
        if (v9 == v14)
        {
          if (v9 <= a1[1] && *a1 <= v9)
          {
            *a1 = v9;
            return 1;
          }
LABEL_28:
          __break(0x5519u);
        }
        v11 = 0xAAAAAAAAAAAAAAAALL;
        v12 = 0xAAAAAAAAAAAAAAAALL;
        if (v8 > v9 || v9 > v14)
          goto LABEL_28;
        v11 = v9;
        v12 = v14;
        result = ccder_blob_decode_tl(&v11, 5, &v15);
        if (!(_DWORD)result)
          return result;
        if (v11 != v14)
          return 0;
        if (!__CFADD__(v11, v15))
        {
          v10 = v11 + v15;
          if (v11 + v15 <= a1[1] && *a1 <= v10)
          {
            *a1 = v10;
            return 1;
          }
          goto LABEL_28;
        }
      }
    }
    __break(0x5513u);
  }
  return result;
}

uint64_t ccder_blob_check_null(uint64_t a1)
{
  uint64_t result;
  uint64_t v2;

  v2 = 0;
  LODWORD(result) = ccder_blob_decode_tl(a1, 5, &v2);
  if (v2)
    return 0;
  else
    return result;
}

uint64_t CTParseCertificateSet(unint64_t a1, unint64_t a2, _OWORD *a3, uint64_t a4, _QWORD *a5)
{
  uint64_t v6;
  uint64_t v8;
  uint64_t v9;
  _OWORD *v10;
  unint64_t v11;
  __int128 v12;
  uint64_t result;
  unint64_t v15;
  unint64_t v16;
  _OWORD v17[19];

  v6 = 0;
  if (a1 < a2 && a4)
  {
    v8 = 0;
    v9 = a4 - 1;
    v10 = a3;
    v11 = (unint64_t)&a3[a4];
    while (1)
    {
      *(_QWORD *)&v12 = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v12 + 1) = 0xAAAAAAAAAAAAAAAALL;
      v17[17] = v12;
      v17[18] = v12;
      v17[15] = v12;
      v17[16] = v12;
      v17[13] = v12;
      v17[14] = v12;
      v17[11] = v12;
      v17[12] = v12;
      v17[9] = v12;
      v17[10] = v12;
      v17[7] = v12;
      v17[8] = v12;
      v17[5] = v12;
      v17[6] = v12;
      v17[3] = v12;
      v17[4] = v12;
      v17[1] = v12;
      v17[2] = v12;
      v17[0] = v12;
      v15 = a1;
      v16 = a2;
      result = X509CertificateParse((unint64_t *)v17, &v15);
      if ((_DWORD)result)
        break;
      a1 = v15;
      a2 = v16;
      if (v15 > v16 || (unint64_t)v10 >= v11 || v10 < a3)
        __break(0x5519u);
      *v10 = v17[0];
      v6 = v8 + 1;
      if (a1 < a2)
      {
        ++v10;
        if (v9 != v8++)
          continue;
      }
      goto LABEL_11;
    }
  }
  else
  {
LABEL_11:
    result = 0;
    if (a5)
      *a5 = v6;
  }
  return result;
}

uint64_t X509CertificateParseImplicit(uint64_t a1, unint64_t *a2, const void *a3, size_t a4)
{
  unint64_t v4;
  unint64_t v5;
  uint64_t v10;
  uint64_t result;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  unint64_t v17;
  uint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  unint64_t v22;
  unint64_t v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  unint64_t v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  unint64_t v34;
  unint64_t v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  BOOL v41;
  int v42;
  int v43;
  unint64_t v45;
  unint64_t v53;
  unint64_t v54;
  unsigned __int8 v55;
  unint64_t v56;
  unint64_t v57;
  uint64_t v58;
  BOOL v59;
  unint64_t v60;
  unint64_t v61;
  unint64_t v62;
  unint64_t v63;
  unint64_t v64;
  unint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  unint64_t v69;
  unint64_t v70;
  uint64_t v71;
  _OWORD v72[10];

  v70 = 0;
  v71 = 0;
  v68 = 0xAAAAAAAAAAAAAAAALL;
  v69 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a2;
  v5 = a2[1];
  if (*a2 > v5)
    goto LABEL_186;
  v10 = 720915;
  v68 = *a2;
  v69 = v5;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  *(_OWORD *)(a1 + 32) = 0u;
  *(_OWORD *)(a1 + 48) = 0u;
  *(_OWORD *)(a1 + 64) = 0u;
  *(_OWORD *)(a1 + 80) = 0u;
  *(_OWORD *)(a1 + 96) = 0u;
  *(_OWORD *)(a1 + 112) = 0u;
  *(_OWORD *)(a1 + 128) = 0u;
  *(_OWORD *)(a1 + 144) = 0u;
  *(_OWORD *)(a1 + 160) = 0u;
  *(_OWORD *)(a1 + 176) = 0u;
  *(_OWORD *)(a1 + 192) = 0u;
  *(_OWORD *)(a1 + 208) = 0u;
  *(_OWORD *)(a1 + 224) = 0u;
  *(_OWORD *)(a1 + 240) = 0u;
  *(_OWORD *)(a1 + 256) = 0u;
  *(_OWORD *)(a1 + 272) = 0u;
  *(_OWORD *)(a1 + 288) = 0u;
  result = ccder_blob_decode_tl(&v68, 0x2000000000000010, &v71);
  if (!(_DWORD)result)
    return v10;
  v12 = v71;
  v13 = v68;
  v14 = v71 + v68 - v4;
  if (__CFADD__(v71, v68 - v4))
    goto LABEL_188;
  if (v14 > v5 - v4)
    goto LABEL_186;
  *(_QWORD *)(a1 + 16) = v4;
  *(_QWORD *)(a1 + 24) = v14;
  v66 = 0xAAAAAAAAAAAAAAAALL;
  v67 = 0xAAAAAAAAAAAAAAAALL;
  if (__CFADD__(v13, v12))
    goto LABEL_187;
  v15 = v13 + v12;
  if (v13 > v15 || v15 > v69)
    goto LABEL_186;
  v66 = v13;
  v67 = v15;
  v64 = v13;
  v65 = v15;
  if (ccder_blob_decode_tl(&v64, 0xA000000000000000, &v70))
  {
    v16 = v70;
    v17 = v64;
    if (__CFADD__(v64, v70))
      goto LABEL_187;
    v18 = 720916;
    if (ccder_blob_decode_uint64(&v64, a1 + 32) && v64 == v17 + v16)
    {
      if (v17 + v16 > v65)
        goto LABEL_186;
      v66 = v17 + v16;
      v67 = v65;
      goto LABEL_14;
    }
    return v18;
  }
LABEL_14:
  if (!ccder_blob_decode_tl(&v66, 2, &v70))
    return 720917;
  v20 = v66;
  v19 = v67;
  if (v67 < v66)
    goto LABEL_186;
  v21 = v70;
  if (v70 > v67 - v66)
    goto LABEL_186;
  *(_QWORD *)(a1 + 136) = v66;
  *(_QWORD *)(a1 + 144) = v21;
  if (__CFADD__(v20, v21))
    goto LABEL_187;
  v22 = v20 + v21;
  if (v20 > v22 || v22 > v19)
    goto LABEL_186;
  v66 = v22;
  if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v66, (unint64_t *)(a1 + 152)))
    return 720918;
  if (!ccder_blob_decode_tl(&v66, 0x2000000000000010, &v70))
    return 720919;
  v24 = v66;
  v23 = v67;
  if (v67 < v66)
    goto LABEL_186;
  v25 = v70;
  if (v70 > v67 - v66)
    goto LABEL_186;
  *(_QWORD *)(a1 + 120) = v66;
  *(_QWORD *)(a1 + 128) = v25;
  if (__CFADD__(v24, v25))
    goto LABEL_187;
  v26 = v24 + v25;
  if (v24 > v26 || v26 > v23)
    goto LABEL_186;
  v66 = v26;
  if (!ccder_blob_decode_tl(&v66, 0x2000000000000010, &v70))
    return 720920;
  v28 = v66;
  v27 = v67;
  if (v67 < v66)
    goto LABEL_186;
  v29 = v70;
  if (v70 > v67 - v66)
    goto LABEL_186;
  *(_QWORD *)(a1 + 72) = v66;
  *(_QWORD *)(a1 + 80) = v29;
  if (__CFADD__(v28, v29))
    goto LABEL_187;
  v30 = v28 + v29;
  if (v28 > v30 || v30 > v27)
    goto LABEL_186;
  v66 = v30;
  if (!ccder_blob_decode_tl(&v66, 0x2000000000000010, &v70))
    return 720921;
  v31 = v66;
  v32 = v67;
  if (v67 < v66)
    goto LABEL_186;
  v33 = v70;
  if (v70 > v67 - v66)
    goto LABEL_186;
  *(_QWORD *)(a1 + 104) = v66;
  *(_QWORD *)(a1 + 112) = v33;
  if (__CFADD__(v31, v33))
    goto LABEL_187;
  v34 = v31 + v33;
  if (v31 > v31 + v33 || v34 > v32)
    goto LABEL_186;
  v66 = v31 + v33;
  result = ccder_blob_decode_tl(&v66, 0x2000000000000010, &v70);
  if (!(_DWORD)result)
    return 720922;
  v35 = v66;
  v36 = v70;
  v37 = v66 - v34 + v70;
  if (!__CFADD__(v66 - v34, v70))
  {
    if (v37 > v32 - v34)
      goto LABEL_186;
    *(_QWORD *)(a1 + 88) = v34;
    *(_QWORD *)(a1 + 96) = v37;
    if (__CFADD__(v35, v36))
      goto LABEL_187;
    v38 = v35 + v36;
    if (v35 > v38 || v38 > v67)
      goto LABEL_186;
    v65 = v67;
    v66 = v38;
    v64 = v38;
    if ((ccder_blob_decode_tl(&v64, 0x8000000000000001, &v70) & 1) != 0)
      return 720923;
    if (v66 > v67)
      goto LABEL_186;
    v64 = v66;
    v65 = v67;
    if ((ccder_blob_decode_tl(&v64, 0x8000000000000002, &v70) & 1) != 0)
      return 720924;
    if (v66 > v67)
      goto LABEL_186;
    v64 = v66;
    v65 = v67;
    if (ccder_blob_decode_tl(&v64, 0xA000000000000003, &v70))
    {
      v62 = 0xAAAAAAAAAAAAAAAALL;
      v63 = 0xAAAAAAAAAAAAAAAALL;
      if (__CFADD__(v64, v70))
        goto LABEL_187;
      if (v64 > v64 + v70 || v64 + v70 > v65)
        goto LABEL_186;
      v62 = v64;
      v63 = v64 + v70;
      if (!ccder_blob_decode_tl(&v62, 0x2000000000000010, &v70) || !v70)
        return 720925;
      v39 = v62;
      if (__CFADD__(v62, v70))
LABEL_187:
        __break(0x5513u);
      v40 = v62 + v70;
      if (v62 > v62 + v70 || v40 > v63)
        goto LABEL_186;
      v63 = v62 + v70;
      *(_BYTE *)(a1 + 266) = 0;
      memset(&v72[2], 0, 128);
      if (a3)
        v41 = a4 == 0;
      else
        v41 = 1;
      v42 = !v41;
      memset(v72, 0, 32);
      if (v39 < v40)
      {
        v55 = 0;
        v43 = 0;
        do
        {
          v60 = 0xAAAAAAAAAAAAAAAALL;
          v61 = 0xAAAAAAAAAAAAAAAALL;
          v59 = 0;
          v58 = 0;
          if ((ccder_blob_decode_tl(&v62, 0x2000000000000010, &v58) & 1) == 0)
            return 720926;
          v56 = 0xAAAAAAAAAAAAAAAALL;
          v57 = 0xAAAAAAAAAAAAAAAALL;
          if (__CFADD__(v62, v58))
            goto LABEL_187;
          if (v62 > v62 + v58 || v62 + v58 > v63)
            goto LABEL_186;
          v56 = v62;
          v57 = v62 + v58;
          if (!ccder_blob_decode_tl(&v56, 6, &v70))
            return 720927;
          if (v57 < v56 || v70 > v57 - v56)
            goto LABEL_186;
          v60 = v56;
          v61 = v70;
          if (__CFADD__(v56, v70))
            goto LABEL_187;
          if (v56 > v56 + v70 || v56 + v70 > v57)
            goto LABEL_186;
          v56 += v70;
          if (!sub_10002EBE0(&v56, 1, &v59))
            return 720928;
          if (!ccder_blob_decode_tl(&v56, 4, &v70))
            return 720929;
          if (__CFADD__(v56, v70))
            goto LABEL_187;
          if (v57 != v56 + v70)
            return 720929;
          if (v42 && !compare_octet_string_raw((uint64_t)&v60, a3, a4))
          {
            if (v57 < v56)
              goto LABEL_186;
            v45 = v70;
            if (v70 > v57 - v56)
              goto LABEL_186;
            *(_QWORD *)(a1 + 248) = v56;
            *(_QWORD *)(a1 + 256) = v45;
          }
          if (v61 == 3)
          {
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 15)
            {
              v18 = 720930;
              if ((v43 & 1) != 0 || (sub_10002ECF4((uint64_t)&v56, (_BYTE *)(a1 + 264)) & 1) == 0)
                return v18;
              v43 |= 1u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 19)
            {
              v18 = 720931;
              if ((v43 & 2) != 0 || (sub_10002EDC0(&v56, (unint64_t *)(a1 + 200), (BOOL *)(a1 + 265)) & 1) == 0)
                return v18;
              v43 |= 2u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 35)
            {
              v18 = 720932;
              if ((v43 & 4) != 0
                || (sub_10002EE8C(&v56, (unint64_t *)(a1 + 168), (unint64_t *)(a1 + 176)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 4u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 14)
            {
              v18 = 720933;
              if ((v43 & 8) != 0
                || (sub_10002EFB0(&v56, (unint64_t *)(a1 + 184), (unint64_t *)(a1 + 192)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 8u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 37)
            {
              v18 = 720934;
              if ((v43 & 0x10) != 0
                || (sub_10002F070(&v56, (unint64_t *)(a1 + 208), (unint64_t *)(a1 + 216)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 0x10u;
              goto LABEL_155;
            }
            if (*(_WORD *)v60 == 7509 && *(_BYTE *)(v60 + 2) == 17)
            {
              v18 = 720935;
              if ((v43 & 0x20) != 0
                || (sub_10002F17C(&v56, (unint64_t *)(a1 + 224), (unint64_t *)(a1 + 232)) & 1) == 0)
              {
                return v18;
              }
              v43 |= 0x20u;
              goto LABEL_155;
            }
          }
          else if (v61 >= 8 && *(_DWORD *)v60 == -2042067414 && *(_DWORD *)(v60 + 3) == 1684273030)
          {
            v18 = 720936;
            if (!sub_10002F24C((uint64_t)&v60, (uint64_t)v72, v55))
              return v18;
            result = sub_10002F2D4((uint64_t)&v56, v60, v61, (unint64_t *)(a1 + 240), (unint64_t *)(a1 + 248), v42);
            if (!(_DWORD)result)
              return v18;
            if (v55 == 0xFF)
              goto LABEL_189;
            ++v55;
            goto LABEL_155;
          }
          if (__CFADD__(v56, v70))
            goto LABEL_187;
          if (v56 > v56 + v70 || v56 + v70 > v57)
            goto LABEL_186;
          v56 += v70;
          if (v59)
            *(_BYTE *)(a1 + 266) = 1;
LABEL_155:
          if (v56 != v57)
            return 720926;
          if (__CFADD__(v62, v58))
            goto LABEL_187;
          v39 = v62 + v58;
          if (v62 > v62 + v58)
            goto LABEL_186;
          v40 = v63;
          if (v39 > v63)
            goto LABEL_186;
          v62 += v58;
        }
        while (v39 < v63);
      }
      if (v39 != v40)
        return 720925;
      if (v39 > v67 || v66 > v39)
        goto LABEL_186;
      v66 = v39;
    }
    if (*(_QWORD *)(a1 + 32) < 3uLL)
    {
      v18 = 720915;
      if (v66 != v67)
        return v18;
LABEL_170:
      if (__CFADD__(v68, v71))
        goto LABEL_187;
      if (v68 > v68 + v71 || v68 + v71 > v69)
        goto LABEL_186;
      v68 += v71;
      if (!ccder_blob_decode_AlgorithmIdentifierNULL(&v68, (unint64_t *)(a1 + 40)))
        return 720937;
      *(_QWORD *)&v72[0] = 0xAAAAAAAAAAAAAAAALL;
      *((_QWORD *)&v72[0] + 1) = 0xAAAAAAAAAAAAAAAALL;
      v62 = 0;
      result = ccder_blob_decode_bitstring(&v68, v72, &v62);
      if (!(_DWORD)result)
        return 720938;
      if (v62 < 0xFFFFFFFFFFFFFFF9)
      {
        if (*((_QWORD *)&v72[0] + 1) >= *(_QWORD *)&v72[0])
        {
          v53 = (v62 + 7) >> 3;
          if (v53 <= *((_QWORD *)&v72[0] + 1) - *(_QWORD *)&v72[0])
          {
            *(_QWORD *)(a1 + 56) = *(_QWORD *)&v72[0];
            *(_QWORD *)(a1 + 64) = v53;
            v54 = v69;
            if (v68 <= v69)
            {
              v18 = 0;
              *a2 = v68;
              a2[1] = v54;
              return v18;
            }
          }
        }
        goto LABEL_186;
      }
      goto LABEL_188;
    }
    if (v67 <= a2[1] && *a2 <= v67)
    {
      *a2 = v67;
      goto LABEL_170;
    }
LABEL_186:
    __break(0x5519u);
    goto LABEL_187;
  }
LABEL_188:
  __break(0x5500u);
LABEL_189:
  __break(0x5507u);
  return result;
}

uint64_t sub_10002EBE0(unint64_t *a1, int a2, BOOL *a3)
{
  unint64_t v3;
  uint64_t result;
  unsigned __int8 *v8;
  int v9;
  unsigned __int8 *v11;
  uint64_t v12;
  unsigned __int8 *v13;
  unint64_t v14;

  v13 = (unsigned __int8 *)0xAAAAAAAAAAAAAAAALL;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v3 = a1[1];
  if (*a1 > v3)
    goto LABEL_22;
  v13 = (unsigned __int8 *)*a1;
  v14 = v3;
  v12 = 0;
  result = ccder_blob_decode_tl(&v13, 1, &v12);
  if ((result & 1) != 0)
  {
    if (v12 == 1)
    {
      v8 = v13;
      if ((unint64_t)v13 < v14)
      {
        v9 = *v13;
        if (v9 != 255 && v9 != 0)
          return 0;
        if (a3)
          *a3 = v9 != 0;
        if (v8 == (unsigned __int8 *)-1)
        {
          __break(0x5513u);
          return result;
        }
        v11 = v8 + 1;
        if ((unint64_t)v11 <= a1[1] && *a1 <= (unint64_t)v11)
        {
          *a1 = (unint64_t)v11;
          return 1;
        }
      }
LABEL_22:
      __break(0x5519u);
    }
  }
  else if (a2)
  {
    if (a3)
      *a3 = 0;
    return 1;
  }
  return 0;
}

uint64_t sub_10002ECF4(uint64_t a1, _BYTE *a2)
{
  uint64_t result;
  unint64_t v5;
  _BYTE *v6;
  unint64_t v7;

  v6 = (_BYTE *)0xAAAAAAAAAAAAAAAALL;
  v7 = 0xAAAAAAAAAAAAAAAALL;
  v5 = 0;
  result = ccder_blob_decode_bitstring(a1, &v6, &v5);
  if ((_DWORD)result)
  {
    if (v7 != *(_QWORD *)(a1 + 8) || v6 == (_BYTE *)v7 || v5 > 8)
    {
      return 0;
    }
    else if ((unint64_t)v6 >= v7)
    {
      __break(0x5519u);
    }
    else
    {
      *a2 = *v6 & (-1 << (8 - v5));
      return 1;
    }
  }
  return result;
}

uint64_t sub_10002EDC0(unint64_t *a1, unint64_t *a2, BOOL *a3)
{
  uint64_t result;
  unint64_t v7;
  BOOL v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;

  v10 = 0xAAAAAAAAAAAAAAAALL;
  v11 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 0x2000000000000010, &v11);
  if ((_DWORD)result)
  {
    result = sub_10002EBE0(a1, 1, a3);
    if ((_DWORD)result)
    {
      result = ccder_blob_decode_uint64(a1, &v10);
      if ((_DWORD)result)
      {
        if (!*a3)
          return 0;
        v7 = v10;
        *a2 = v10;
        v8 = __CFADD__(v7, 1);
        v9 = v7 + 1;
        if (v8)
        {
          __break(0x5500u);
          return result;
        }
        *a2 = v9;
      }
      return 1;
    }
  }
  return result;
}

uint64_t sub_10002EE8C(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v13 = 0xAAAAAAAAAAAAAAAALL;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 0x2000000000000010, &v14);
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (__CFADD__(*a1, v14))
      goto LABEL_15;
    if (v7 + v14 != a1[1])
      return 0;
    v11 = 0xAAAAAAAAAAAAAAAALL;
    v12 = 0xAAAAAAAAAAAAAAAALL;
    if (v7 > v7 + v14)
      goto LABEL_16;
    v11 = v7;
    v12 = v7 + v14;
    result = ccder_blob_decode_tl(&v11, 0x8000000000000000, &v13);
    if ((_DWORD)result)
    {
      if (v12 < v11)
        goto LABEL_16;
      v8 = v13;
      if (v13 > v12 - v11)
        goto LABEL_16;
      *a2 = v11;
      *a3 = v8;
    }
    v9 = *a1;
    if (__CFADD__(*a1, v14))
    {
LABEL_15:
      __break(0x5513u);
    }
    else
    {
      v10 = v9 + v14;
      if (v9 <= v9 + v14 && v10 <= a1[1])
      {
        *a1 = v10;
        return 1;
      }
    }
LABEL_16:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_10002EFB0(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  BOOL v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  BOOL v15;
  BOOL v16;
  unint64_t v17;

  v17 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 4, &v17);
  if ((_DWORD)result)
  {
    v7 = a1[1];
    v8 = v17;
    v10 = v7 >= *a1;
    v9 = v7 - *a1;
    if (v10)
    {
      v10 = v17 >= v9;
      v11 = v17 == v9;
    }
    else
    {
      v10 = 1;
      v11 = 0;
    }
    if (!v11 && v10)
      goto LABEL_13;
    *a2 = *a1;
    *a3 = v8;
    v12 = *a1;
    if (__CFADD__(*a1, v8))
    {
      __break(0x5513u);
      return result;
    }
    v13 = v12 + v8;
    v14 = a1[1];
    if (v12 <= v13)
    {
      v15 = v13 >= v14;
      v16 = v13 == v14;
    }
    else
    {
      v15 = 1;
      v16 = 0;
    }
    if (!v16 && v15)
LABEL_13:
      __break(0x5519u);
    *a1 = v13;
  }
  return result;
}

uint64_t sub_10002F070(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v14 = 0xAAAAAAAAAAAAAAAALL;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  v6 = ccder_blob_decode_tl(a1, 0x2000000000000010, &v15);
  result = 0;
  if (v6 && v15)
  {
    v12 = 0xAAAAAAAAAAAAAAAALL;
    v13 = 0xAAAAAAAAAAAAAAAALL;
    v8 = a1[1];
    if (*a1 > v8)
      goto LABEL_12;
    v12 = *a1;
    v13 = v8;
    result = ccder_blob_decode_tl(&v12, 6, &v14);
    if (!(_DWORD)result)
      return result;
    if (v13 < v12)
      goto LABEL_12;
    v9 = v14;
    if (v14 > v13 - v12)
      goto LABEL_12;
    *a2 = v12;
    *a3 = v9;
    v10 = *a1;
    if (__CFADD__(*a1, v15))
    {
      __break(0x5513u);
      return result;
    }
    v11 = v10 + v15;
    if (v10 > v10 + v15 || v11 > a1[1])
LABEL_12:
      __break(0x5519u);
    *a1 = v11;
  }
  return result;
}

uint64_t sub_10002F17C(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  BOOL v9;
  unint64_t v10;
  unint64_t v12;
  unint64_t v13;
  unint64_t v15;

  v15 = 0xAAAAAAAAAAAAAAAALL;
  LODWORD(result) = ccder_blob_decode_tl(a1, 0x2000000000000010, &v15);
  v7 = v15;
  if (v15)
    result = result;
  else
    result = 0;
  if ((_DWORD)result == 1)
  {
    v8 = a1[1];
    v9 = v8 >= *a1;
    v10 = v8 - *a1;
    if (!v9 || v15 > v10)
      goto LABEL_16;
    *a2 = *a1;
    *a3 = v7;
    v12 = *a1;
    if (__CFADD__(*a1, v7))
    {
      __break(0x5513u);
      return result;
    }
    v13 = v12 + v7;
    if (v12 > v13 || v13 > a1[1])
LABEL_16:
      __break(0x5519u);
    *a1 = v13;
  }
  return result;
}

uint64_t sub_10002F24C(uint64_t result, uint64_t a2, unsigned int a3)
{
  _QWORD *v5;
  unsigned __int8 v6;
  unint64_t v7;
  uint64_t v9;
  _QWORD *v10;

  if (a3 > 9)
    return 0;
  v5 = (_QWORD *)result;
  v6 = 0;
  v7 = ~a2;
  while (v7 >= 16 * (char)v6)
  {
    result = compare_octet_string((uint64_t)v5, a2 + 16 * v6);
    if (!(_DWORD)result)
      return result;
    if (a3 <= v6++)
    {
      v9 = v5[1];
      v10 = (_QWORD *)(a2 + 16 * a3);
      *v10 = *v5;
      v10[1] = v9;
      return 1;
    }
  }
  __break(0x5513u);
  return result;
}

uint64_t sub_10002F2D4(uint64_t result, unint64_t a2, unint64_t a3, unint64_t *a4, unint64_t *a5, int a6)
{
  uint64_t v24;
  int v44;
  unint64_t v51;
  unint64_t v52;
  uint64_t v53;
  unint64_t v54;
  uint64_t v55;
  BOOL v56;

  if (a6)
    a5 = 0;
  if (a3 == 11)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10901066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10301066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x200;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x10601066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x800;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11801066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x12401066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x11901066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_QWORD *)(a2 + 3) == 0x21901066463F786)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x8000;
      goto LABEL_261;
    }
LABEL_157:
    v44 = 0;
LABEL_158:
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 27)
      return sub_1000303D4(result, a2, a3, a4, a5);
    if (!v44)
      goto LABEL_232;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 832)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3586)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 37748736;
    }
    else
    {
      if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_WORD *)(a2 + 8) != 4354)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 327)
          return (uint64_t)sub_1000305F0((unint64_t *)result, a4, a5);
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3841)
        {
          v52 = *(_QWORD *)result;
          v51 = *(_QWORD *)(result + 8);
          if (a5)
          {
            if (v52 > v51)
              goto LABEL_265;
            *a5 = v52;
            a5[1] = v51 - v52;
          }
          *a4 |= 0x80000000uLL;
LABEL_233:
          if (v52 <= v51)
          {
            *(_QWORD *)result = v51;
            return 1;
          }
LABEL_265:
          __break(0x5519u);
          return result;
        }
        goto LABEL_232;
      }
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x8004000000;
    }
LABEL_201:
    v24 = v54 | v55;
    goto LABEL_261;
  }
  if (a3 == 10)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 5122)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 258)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v54 = *a4;
      v55 = 0x58600003F0D0;
      goto LABEL_201;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1538)
      goto LABEL_203;
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 4610)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0xF00;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3073)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1793)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3329)
    {
LABEL_203:
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x20;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 2305)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x40;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 513)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1025)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x10000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 769)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x100;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 1537)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x400;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 6145)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x1000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 9217)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x80000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8193)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x2000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 8705)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x4000000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 315)
      return sub_10003016C((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 3074)
    {
      result = ccder_blob_check_null(result);
      if (!(_DWORD)result)
        return result;
      v24 = *a4 | 0x300000000;
      goto LABEL_261;
    }
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_WORD *)(a2 + 8) == 304)
      return sub_10003024C((unint64_t *)result, a4, a5);
    v44 = 1;
    goto LABEL_158;
  }
  if (a3 != 9)
  {
    if (a3 < 0xA)
      goto LABEL_232;
    goto LABEL_157;
  }
  if (*(_QWORD *)a2 == 0xB6463F78648862ALL && *(_BYTE *)(a2 + 8) == 1)
    return sub_10002FDB8((unint64_t *)result, a4, a5);
  if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 49)
  {
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 44)
      return sub_10002FEF0((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 36)
      return sub_100030084((unint64_t *)result, a4, a5);
    if (*(_QWORD *)a2 != 0x66463F78648862ALL || *(_BYTE *)(a2 + 8) != 22)
    {
      if (*(_QWORD *)a2 == 0xC6463F78648862ALL && *(_BYTE *)(a2 + 8) == 19)
      {
        result = ccder_blob_check_null(result);
        if (!(_DWORD)result)
          return result;
        v24 = *a4 | 0x8000000000;
        goto LABEL_261;
      }
      if (*(_QWORD *)a2 != 0xA6463F78648862ALL || *(_BYTE *)(a2 + 8) != 1)
      {
        if (*(_QWORD *)a2 == 0x66463F78648862ALL && *(_BYTE *)(a2 + 8) == 29)
        {
          result = ccder_blob_check_null(result);
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x2000000;
        }
        else
        {
          if (*(_QWORD *)a2 != 0xC6463F78648862ALL || *(_BYTE *)(a2 + 8) != 14)
          {
            if (*(_QWORD *)a2 == 0x86463F78648862ALL && *(_BYTE *)(a2 + 8) == 3)
              return sub_1000304A0((unint64_t *)result, a4, a5);
            goto LABEL_232;
          }
          result = ccder_blob_check_null(result);
          if (!(_DWORD)result)
            return result;
          v24 = *a4 | 0x4000000;
        }
LABEL_261:
        *a4 = v24;
        return 1;
      }
      *a4 |= 0x1000000uLL;
LABEL_232:
      v52 = *(_QWORD *)result;
      v51 = *(_QWORD *)(result + 8);
      goto LABEL_233;
    }
    result = ccder_blob_check_null(result);
    if (!(_DWORD)result)
      return result;
    v54 = *a4;
    v55 = 1048584;
    goto LABEL_201;
  }
  v56 = 0;
  result = sub_10002EBE0((unint64_t *)result, 0, &v56);
  if ((_DWORD)result)
  {
    v53 = 0x10000080002;
    if (!v56)
      v53 = 0x20000040001;
    *a4 |= v53;
  }
  return result;
}

uint64_t X509CertificateParseWithExtension(unint64_t *a1, unint64_t *a2, const void *a3, size_t a4)
{
  uint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  uint64_t result;
  unint64_t v13;
  unint64_t v14;

  v8 = 720939;
  v9 = *a2;
  v10 = a2[1];
  v14 = 0xAAAAAAAAAAAAAAAALL;
  if (!ccder_blob_decode_tl(a2, 0x2000000000000010, &v14))
    return v8;
  v11 = *a2;
  result = X509CertificateParseImplicit((uint64_t)a1, a2, a3, a4);
  v8 = result;
  if ((_DWORD)result)
    return v8;
  if (__CFADD__(v11, v14))
  {
    __break(0x5513u);
LABEL_11:
    __break(0x5500u);
    goto LABEL_12;
  }
  v8 = 720939;
  if (*a2 != v11 + v14)
    return v8;
  v13 = v14 + v11 - v9;
  if (__CFADD__(v14, v11 - v9))
    goto LABEL_11;
  if (v10 >= v9 && v13 <= v10 - v9)
  {
    *a1 = v9;
    a1[1] = v13;
    X509PolicyCheckForBlockedKeys((uint64_t)a1);
    return 0;
  }
LABEL_12:
  __break(0x5519u);
  return result;
}

uint64_t X509CertificateParse(unint64_t *a1, unint64_t *a2)
{
  return X509CertificateParseWithExtension(a1, a2, 0, 0);
}

BOOL sub_10002FDB8(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;

  v14 = 0xAAAAAAAAAAAAAAAALL;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  v4 = *a1;
  v3 = a1[1];
  if (*a1 > v3)
    goto LABEL_19;
  v14 = *a1;
  v15 = v3;
  v13 = v3 - v4;
  if ((ccder_blob_decode_tl(&v14, 22, &v13) & 1) != 0)
    goto LABEL_5;
  v8 = a1[1];
  if (*a1 > v8)
    goto LABEL_19;
  v14 = *a1;
  v15 = v8;
  if (ccder_blob_decode_tl(&v14, 12, &v13))
  {
LABEL_5:
    v10 = v14;
    v9 = v15;
    if (v14 > v15)
      goto LABEL_19;
    *a1 = v14;
    a1[1] = v9;
    v11 = v13;
  }
  else
  {
    v10 = *a1;
    v9 = a1[1];
    v11 = v9 - *a1;
    v13 = v11;
  }
  if (__CFADD__(v10, v11))
    goto LABEL_20;
  if (v9 == v10 + v11)
  {
    if (!v11)
      goto LABEL_16;
    if (!a3)
    {
LABEL_15:
      *a2 |= 0x40000000uLL;
LABEL_16:
      if (v10 <= v9)
      {
        *a1 = v9;
        return v9 == v10 + v11;
      }
      goto LABEL_19;
    }
    if (v10 <= v9 && v11 <= v9 - v10)
    {
      *a3 = v10;
      a3[1] = v11;
      goto LABEL_15;
    }
LABEL_19:
    __break(0x5519u);
LABEL_20:
    __break(0x5513u);
  }
  return v9 == v10 + v11;
}

uint64_t sub_10002FEF0(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  uint64_t v12;
  unint64_t v13;
  unint64_t v16;

  v16 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 22, &v16);
  if ((_DWORD)result)
  {
    v7 = v16;
    v8 = *a1;
    if (__CFADD__(*a1, v16))
    {
      __break(0x5513u);
      goto LABEL_34;
    }
    v9 = v8 + v16;
    if (a1[1] != v8 + v16)
      return 0;
    v10 = *a2;
    *a2 |= 0x30000000000uLL;
    if (a3)
    {
      if (v8 > v9)
        goto LABEL_34;
      *a3 = v8;
      a3[1] = v7;
    }
    if (v7 == 4)
    {
      if (*(_DWORD *)v8 != 1953653621)
        goto LABEL_30;
      v13 = 0x30001000000;
    }
    else
    {
      if (v7 == 17)
      {
        if (*(_QWORD *)v8 != 0x207372656B6E6F59
          || *(_QWORD *)(v8 + 8) != 0x726F74636146202DLL
          || *(_BYTE *)(v8 + 16) != 121)
        {
LABEL_30:
          if (v8 <= v9)
          {
            *a1 = v9;
            return 1;
          }
LABEL_34:
          __break(0x5519u);
          return result;
        }
        v12 = 786432;
      }
      else
      {
        if (v7 != 16)
          goto LABEL_30;
        if (*(_QWORD *)v8 != 0x2D20656761766153 || *(_QWORD *)(v8 + 8) != 0x79726F7463614620)
          goto LABEL_30;
        v12 = 3;
      }
      v13 = v12 & 0xFFFF0000FFFFFFFFLL | 0x30000000000;
    }
    *a2 = v10 | v13;
    goto LABEL_30;
  }
  return result;
}

uint64_t sub_100030084(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;

  v9 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 4, &v9);
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (__CFADD__(*a1, v9))
    {
      __break(0x5513u);
    }
    else
    {
      v8 = a1[1];
      if (v8 != v7 + v9)
        return 0;
      if (v9 == 32)
      {
        if (a3)
        {
          if (v8 < v7 || v8 - v7 <= 0x1F)
            goto LABEL_15;
          *a3 = v7;
          a3[1] = 32;
        }
        *a2 |= 4uLL;
      }
      if (v7 <= v8)
      {
        *a1 = v8;
        return 1;
      }
    }
LABEL_15:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_10003016C(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;

  v10 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 4, &v10);
  if ((_DWORD)result)
  {
    v7 = v10;
    v8 = *a1;
    if (__CFADD__(*a1, v10))
    {
      __break(0x5513u);
    }
    else
    {
      v9 = a1[1];
      if (v9 != v8 + v10)
        return 0;
      if (v10)
      {
        if (a3)
        {
          if (v9 < v8 || v10 > v9 - v8)
            goto LABEL_15;
          *a3 = v8;
          a3[1] = v7;
        }
        *a2 |= 0x30000000uLL;
      }
      if (v8 <= v9)
      {
        *a1 = v9;
        return 1;
      }
    }
LABEL_15:
    __break(0x5519u);
  }
  return result;
}

uint64_t sub_10003024C(unint64_t *a1, unint64_t *a2, unint64_t *a3)
{
  int v6;
  uint64_t result;
  unint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v13;
  unsigned __int8 *v14;
  BOOL v15;
  unint64_t v16;
  unint64_t v17;

  v17 = 0;
  v6 = ccder_blob_decode_tl(a1, 12, &v17);
  result = 0;
  if (v6)
  {
    v8 = v17;
    if (v17 >= 0x19)
    {
      v9 = *a1;
      v10 = *(_QWORD *)*a1 == 0x2E3034382E322E31 && *(_QWORD *)(*a1 + 8) == 0x312E353336333131;
      v11 = 0x2E37322E362E3030;
      if (!v10 || *(_QWORD *)(*a1 + 16) != 0x2E37322E362E3030)
        return 0;
      if (v9 < 0xFFFFFFFFFFFFFFE8)
      {
        v13 = v9 + 24;
        if (v9 >= v9 + 24)
          goto LABEL_21;
        v11 = a1[1];
        if (v13 > v11)
          goto LABEL_21;
        v14 = (unsigned __int8 *)(v9 + 24);
        do
        {
          if ((unint64_t)v14 >= v11)
            goto LABEL_22;
          if (*v14 - 58 < 0xFFFFFFF6)
            return 0;
          if ((unint64_t)(v14 + 1) > v11)
            break;
          v15 = v14 > v14 + 1;
          ++v14;
        }
        while (!v15);
        while (1)
        {
LABEL_21:
          __break(0x5519u);
LABEL_22:
          if (!a3)
            goto LABEL_26;
          v16 = v8 - 24;
          if (v8 < 0x18)
            goto LABEL_31;
          if (v16 <= v11 - v13)
          {
            *a3 = v13;
            a3[1] = v16;
LABEL_26:
            v13 = *a2 | 0x200000000;
            *a2 = v13;
            if (__CFADD__(v9, v8))
              break;
            v8 += v9;
            if (v9 <= v8 && v8 <= v11)
            {
              *a1 = v8;
              return 1;
            }
          }
        }
      }
      __break(0x5513u);
LABEL_31:
      __break(0x5515u);
    }
  }
  return result;
}

uint64_t sub_1000303D4(uint64_t a1, unint64_t a2, uint64_t a3, _QWORD *a4, unint64_t *a5)
{
  uint64_t result;
  unint64_t v10;
  unint64_t v11;
  char *v12;
  BOOL v13;
  _BOOL4 v14;
  int v15;

  result = ccder_blob_check_null(a1);
  if ((_DWORD)result)
  {
    if (a2 > 0xFFFFFFFFFFFFFFF6)
      goto LABEL_26;
    if (__CFADD__(a2, a3))
      goto LABEL_26;
    v10 = a2 + a3;
    if (a2 + a3 == -1)
      goto LABEL_26;
    v11 = a2 + 9;
    v12 = (char *)(a2 + 9);
    while (1)
    {
      v13 = (unint64_t)v12 < v10 && (unint64_t)v12 >= a2;
      v14 = v13;
      if ((unint64_t)v12 >= v10 - 1)
        break;
      if (!v14)
        goto LABEL_25;
      v15 = *v12++;
      if ((v15 & 0x80000000) == 0)
        return 0;
    }
    if (!v14)
    {
LABEL_25:
      __break(0x5519u);
LABEL_26:
      __break(0x5513u);
      return result;
    }
    if ((*v12 & 0x80000000) == 0)
    {
      if (!a5)
      {
LABEL_22:
        *a4 |= (unint64_t)&_mh_execute_header;
        return 1;
      }
      if (v11 >= a2 && v11 <= v10)
      {
        *a5 = v11;
        a5[1] = a3 - 9;
        goto LABEL_22;
      }
      goto LABEL_25;
    }
    return 0;
  }
  return result;
}

uint64_t sub_1000304A0(unint64_t *a1, _QWORD *a2, unint64_t *a3)
{
  uint64_t result;
  unint64_t v7;
  unint64_t v8;
  unint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  v13 = 0xAAAAAAAAAAAAAAAALL;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  result = ccder_blob_decode_tl(a1, 0x2000000000000010, &v14);
  if ((_DWORD)result)
  {
    v7 = *a1;
    if (__CFADD__(*a1, v14))
      goto LABEL_17;
    if (a1[1] != v7 + v14)
      return 0;
    v11 = 0xAAAAAAAAAAAAAAAALL;
    v12 = 0xAAAAAAAAAAAAAAAALL;
    if (v7 > v7 + v14)
      goto LABEL_18;
    v11 = v7;
    v12 = v7 + v14;
    result = ccder_blob_decode_tl(&v11, 0xA000000000000002, &v13);
    if ((_DWORD)result)
    {
      result = ccder_blob_decode_tl(&v11, 4, &v13);
      if ((_DWORD)result)
      {
        if (a3)
        {
          if (v12 < v11)
            goto LABEL_18;
          v8 = v13;
          if (v13 > v12 - v11)
            goto LABEL_18;
          *a3 = v11;
          a3[1] = v8;
        }
        *a2 |= 0x240000800000uLL;
        v9 = *a1;
        if (!__CFADD__(*a1, v14))
        {
          v10 = v9 + v14;
          if (v9 <= v9 + v14 && v10 <= a1[1])
          {
            *a1 = v10;
            return 1;
          }
LABEL_18:
          __break(0x5519u);
          return result;
        }
LABEL_17:
        __break(0x5513u);
        goto LABEL_18;
      }
    }
  }
  return result;
}

unint64_t *sub_1000305F0(unint64_t *result, _QWORD *a2, unint64_t *a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v4 = *result;
  v3 = result[1];
  v5 = v3 - *result;
  if (v5 != 32)
    return (unint64_t *)(v5 == 32);
  if (a3)
  {
    if (v4 > v3)
    {
LABEL_12:
      __break(0x5519u);
      goto LABEL_13;
    }
    *a3 = v4;
    a3[1] = 32;
  }
  *a2 |= 0xC00000000uLL;
  if (v4 < 0xFFFFFFFFFFFFFFE0)
  {
    v6 = v4 + 32;
    if (v4 + 32 <= v3 && v4 <= v6)
    {
      *result = v6;
      return (unint64_t *)(v5 == 32);
    }
    goto LABEL_12;
  }
LABEL_13:
  __break(0x5513u);
  return result;
}

void sub_100030650(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000023CC())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_1000023A8(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000306D4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000023CC())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_1000023A8(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100030758(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "rsd_events publisher received error %d\n", (uint8_t *)v2, 8u);
}

void sub_1000307CC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_100030874()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Control message missing command", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000308A0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10003094C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "The address cannot be parsed as a valid IPv6 address", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030978(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "inet_pton: %{darwin.errno}d", (uint8_t *)v3, 8u);
  sub_100002CF4();
}

void sub_1000309EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Control message with unexpected command", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030A18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Control interface is not available", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030A44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Bogus control request: client doesn't expect reply", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030A70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100004C4C((void *)&_mh_execute_header, v0, v1, "failed to copy remote endpoint", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030A9C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100004C4C((void *)&_mh_execute_header, v0, v1, "Missing client endpoint", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030AC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100004C4C((void *)&_mh_execute_header, v0, v1, "Failed to create connection parameters", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030AF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Unable to determine index for interface: %{public}s", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100030B54()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_100004C74();
  v3 = 2082;
  v4 = v0;
  _os_log_fault_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_FAULT, "nw_interface created with %{public}s, but we expect to use %{public}s", v2, 0x16u);
  sub_100004C6C();
}

void sub_100030BD0()
{
  uint64_t v0;
  os_log_t v1;

  sub_100004C74();
  sub_100004C80((void *)&_mh_execute_header, v0, v1, "%{public}@> network_copy_interface_address_in6: %{darwin.errno}d");
  sub_100004C6C();
}

void sub_100030C3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Bogus request: client missing entitlement", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030C68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Missing required listener interface name parameter", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030C94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100004C4C((void *)&_mh_execute_header, v0, v1, "Failed to create listener", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030CC0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100004C4C((void *)&_mh_execute_header, v0, v1, "Failed to create remote device or generate device name", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030CEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Missing required client device parameter(s)", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030D18()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Unable to create client device endpoint", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030D44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Missing required device name parameter to remove", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030D70()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Unable to find device to remove: %{public}s", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100030DD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Bogus request: client doesn't expect reply", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100030DFC(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v3;
  __int128 v4;

  LODWORD(v3) = 67109378;
  HIDWORD(v3) = a2;
  LOWORD(v4) = 2114;
  *(_QWORD *)((char *)&v4 + 2) = a1;
  sub_100004C80((void *)&_mh_execute_header, a2, a3, "nw_listener state %d received error: %{public}@", v3, (_QWORD)v4, WORD4(v4));
  sub_100004C6C();
}

void sub_100030E6C(uint64_t a1, NSObject *a2)
{
  uint8_t v3[24];

  objc_msgSend(*(id *)(a1 + 40), "device_name");
  sub_100004C74();
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "listener ready with no port for device: %{public}s", v3, 0xCu);
}

void sub_100030EF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "nw_listener_state_failed: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100030F54(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  const char *v6;

  v3 = 136315394;
  v4 = a1;
  v5 = 2080;
  v6 = "RequireEntitlement";
  sub_10000DF48((void *)&_mh_execute_header, a2, a3, "RemoteService definition '%s' is missing the required key '%s'", (uint8_t *)&v3);
  sub_100004C6C();
}

void sub_100030FD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "RemoteService '%s': Failed to set expose policy", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031030(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100031098(void *a1, uint64_t a2, const _xpc_type_s *a3)
{
  NSObject *v3;
  id v5;
  uint64_t v6;
  uint8_t v7[24];

  v5 = a1;
  sub_10000DFE4();
  xpc_type_get_name(a3);
  sub_10000DF84();
  sub_10000DF48((void *)&_mh_execute_header, v3, v6, "RemoteService definition '%s' has unsupported expose policy type '%s'", v7);

  sub_10000DF2C();
}

void sub_100031128(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = a1;
  objc_msgSend(a2, "name");
  sub_100004C74();

  sub_10000DFCC();
}

void sub_1000311AC(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  const _xpc_type_s *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = a2;
  sub_10000DFE4();
  v4 = sub_10000DFB8();
  xpc_type_get_name(v4);
  sub_10000DF84();
  sub_10000DF48((void *)&_mh_execute_header, v2, v5, "RemoteService definition '%s' has \t\t\t\t\t\t\tunsupported expose policy item type '%s'", v6);

  sub_10000DF2C();
}

void sub_100031238(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000312A0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100031308(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100031370(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  int *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_10000DEE8(a1, a2);
  if (sub_1000023CC())
    v2 = 3;
  else
    v2 = 2;
  v3 = __error();
  sub_10000DFC4(v3);
  v7 = sub_1000023A8(v2, v4, v5, v6, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v7);
  __break(1u);
}

void sub_1000313F0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100031458(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  sub_10000DF9C();
  sub_10000DF60((void *)&_mh_execute_header, v1, v2, "%{public}@> Public Properties: %s", (_QWORD)v3, DWORD2(v3));
  sub_100004C6C();
}

void sub_1000314C0(uint64_t a1)
{
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = a1;
  sub_10000DF9C();
  sub_10000DF60((void *)&_mh_execute_header, v1, v2, "%{public}@> Properties: %s", (_QWORD)v3, DWORD2(v3));
  sub_100004C6C();
}

void sub_100031528()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> No local identity available to do TLS with.", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031588()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Peer is missing OIDs required for TLS: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000315E8(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  int v5;
  void *v6;
  __int16 v7;
  unsigned int v8;

  v3 = sub_10000DFFC((uint64_t)a1, a2);
  v5 = 138543618;
  v6 = a1;
  v7 = 1024;
  v8 = objc_msgSend(a1, "state");
  sub_10000DFD8((void *)&_mh_execute_header, v3, v4, "%{public}@> Cannot negotiate TLS in state %d.", (uint8_t *)&v5);

  sub_10000DFCC();
}

void sub_100031678()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a reset request expecting no reply", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000316D8(uint64_t a1, uint64_t a2)
{
  _os_crash("No identity available.", a2);
  __break(1u);
}

void sub_1000316F0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100031758()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  sub_10000DF54(__stack_chk_guard);
  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  sub_10000DF9C();
  sub_10000DF60((void *)&_mh_execute_header, v1, v2, "%{public}@> Public Properties: %s", (_QWORD)v3, DWORD2(v3));
  sub_100004C6C();
}

void sub_1000317C0()
{
  uint64_t v0;
  uint64_t v1;
  os_log_t v2;
  __int128 v3;

  sub_10000DF54(__stack_chk_guard);
  LODWORD(v3) = 138543618;
  *(_QWORD *)((char *)&v3 + 4) = v0;
  sub_10000DF9C();
  sub_10000DF60((void *)&_mh_execute_header, v1, v2, "%{public}@> Properties: %s", (_QWORD)v3, DWORD2(v3));
  sub_100004C6C();
}

void sub_100031828()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Unexpected properties type in handshake message.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100031854()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a handshake message with a wrong or missing type", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000318B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Got an unexpected message after handshake from a version 0 peer", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031914()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a message with no type", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031974()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Got an unexpected message during TLS negotiation.", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000319D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a heartbeat request expecting no reply", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031A34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a timesync request without payload", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031A94()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> create_sntp_response_payload failed", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031AF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a timesync request expecting no reply", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031B54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Received a goodbye request expecting no reply", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031BB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Got an unexpected message after handshake.", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031C14(_QWORD *a1, _OWORD *a2, id *a3)
{
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_10000DFF0())
    v6 = 3;
  else
    v6 = 2;
  objc_msgSend(*a3, "state");
  v7 = sub_10000DF24(v6, (uint64_t)a1, (uint64_t)a2, 80, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100031CD4()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  v3 = 2082;
  v4 = v0;
  sub_10000DF48((void *)&_mh_execute_header, v1, (uint64_t)v1, "%{public}@> Skipping remote service \"%{public}s\" with invalid description", v2);
  sub_100004C6C();
}

void sub_100031D48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Unexpected type for service in handshake message.", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031DAC()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;

  sub_100004C74();
  v3 = 1024;
  v4 = 1;
  sub_10000DFD8((void *)&_mh_execute_header, v0, v1, "%{public}@> Unable to heartbeat peer with version %d - faking success", v2);
  sub_100004C6C();
}

void sub_100031E20()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  v3 = 2048;
  v4 = v0;
  sub_10000DF48((void *)&_mh_execute_header, v1, (uint64_t)v1, "%{public}@> Heartbeat %llu failed - error on connection", v2);
  sub_100004C6C();
}

void sub_100031E98()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> timesync failed: device not connected", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031EF8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> timesync failed: remote device doesn't support timesync", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031F58()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> time sync request failed: error on connection", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100031FBC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> time sync failed: invalid sntp response payload", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100032020()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> goodbye failed: device not connected", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100032080()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> goodbye failed: the device type doesn't support goodbye", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000320E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Device gone, not attempting to reset", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100032140()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Remote peer doesn't support reset", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000321A0(uint64_t a1, void *a2, void *a3)
{
  NSObject *v4;
  uint64_t v5;
  uint8_t v6[24];

  v4 = sub_10000DFFC(a1, a2);
  objc_msgSend(a3, "name");
  sub_10000DF84();
  sub_10000DF48((void *)&_mh_execute_header, v4, v5, "%{public}@> Unable to listen for \"%s\"", v6);

  sub_10000DF2C();
}

void sub_100032228(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  if (sub_1000023CC())
    v2 = 3;
  else
    v2 = 2;
  __error();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000322A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_10000DF74((void *)&_mh_execute_header, v0, v1, "%{public}@> can't find device udid, not able to fetch alias", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100032308()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_10000DF74((void *)&_mh_execute_header, v0, v1, "%{public}@> device udid is not a string", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100032368(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_1000023CC())
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  sub_10000DFC4(v5);
  v6 = sub_10000DF24(v4, (uint64_t)a1, (uint64_t)a2, 80, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  sub_10000DFAC(v6);
  __break(1u);
}

void sub_10003242C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> device alias is invalid", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003248C(const char *a1, _QWORD *a2, _OWORD *a3)
{
  uint64_t v5;
  int *v6;
  uint64_t v7;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  if (sub_10000DFF0())
    v5 = 3;
  else
    v5 = 2;
  v6 = __error();
  sub_10000DFC4(v6);
  v7 = sub_10000DF24(v5, (uint64_t)a2, (uint64_t)a3, 80, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  sub_10000DFAC(v7);
  __break(1u);
}

void sub_100032558()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> Unexpected or missing entitlement in service definition", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000325B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Unexpected properties type in service description.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000325E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Unexpected port type in service description.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100032610(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100032678(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000326E0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100032748(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000327B0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100032818(uint64_t a1, void *a2, const void *a3)
{
  NSObject *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  CFTypeID v10;

  v5 = sub_10000DFFC(a1, a2);
  v7 = 136315394;
  v8 = a1;
  v9 = 2048;
  v10 = CFGetTypeID(a3);
  sub_10000DF48((void *)&_mh_execute_header, v5, v6, "Cannot convert key \"%s\", unsupported type: %lu", (uint8_t *)&v7);

  sub_10000DF2C();
}

void sub_1000328B0(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  const _xpc_type_s *v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  const char *name;

  v3 = *(_QWORD *)(a1 + 40);
  v4 = a2;
  v5 = sub_10000DFB8();
  v7 = 136315394;
  v8 = v3;
  v9 = 2080;
  name = xpc_type_get_name(v5);
  sub_10000DF48((void *)&_mh_execute_header, v2, v6, "RemoteService definition '%s' has \t\t\t\t\t\tinvliad LimitExposedToDeviceType item type '%s'", (uint8_t *)&v7);

  sub_10000DF2C();
}

void sub_100032948(int *a1, NSObject *a2)
{
  int v2;
  _DWORD v3[2];

  v2 = *a1;
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to fetch InDiagnosticsMode status, error %d", (uint8_t *)v3, 8u);
  sub_100002CF4();
}

void sub_1000329BC(void *a1, NSObject *a2)
{
  id v2;
  uint64_t v5;
  uint8_t v6[24];

  if (a1)
  {
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "description")));
    objc_msgSend(v2, "UTF8String");
  }
  sub_100004C74();
  sub_10000DEDC((void *)&_mh_execute_header, a2, v5, "failed to load RestoreVersion.plist: %{public}s", v6);
  if (a1)

  sub_10000DF2C();
}

void sub_100032A64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to retrieve RestoreLongVersion from RestoreVersion dict", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100032A90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to unparse current bridge version", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100032ABC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100032B2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100032B9C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100032C0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100032C7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100032CEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100032D5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100032DCC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100032E3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100032EAC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100032F1C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100032F8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100032FFC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003306C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_1000330DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003314C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_1000331BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003322C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003329C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003330C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003337C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_1000333EC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003345C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_1000334CC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003353C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_1000335AC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003361C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003368C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_1000336FC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003376C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_1000337DC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003384C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_1000338BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003392C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003399C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100033A0C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100033A7C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100033AEC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100033B5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100033BCC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100033C3C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "Unable to fetch MG property: %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100033CAC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100033D18(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_10000E82C(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_100033DC4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_10000E82C(&_os_log_default))
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_1000023A8(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100033E4C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002CE4((void *)&_mh_execute_header, a1, a3, "invalid sntp response payload size", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_100033E7C(NSObject *a1)
{
  int v2;
  uint64_t v3;
  _DWORD v4[2];

  v2 = *__error();
  v4[0] = 67109120;
  v4[1] = v2;
  sub_10000E820((void *)&_mh_execute_header, a1, v3, "clock_settime: %{errno}d", (uint8_t *)v4);
}

void sub_100033F00(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = a1;
  sub_10000E820((void *)&_mh_execute_header, a2, a3, "ntp_adjtime returned error: %d", (uint8_t *)v3);
  sub_100002CF4();
}

void sub_100033F68(int a1, NSObject *a2, uint64_t a3)
{
  _DWORD v3[2];

  v3[0] = 67109120;
  v3[1] = a1;
  sub_10000E820((void *)&_mh_execute_header, a2, a3, "sntp exchange failed: %d", (uint8_t *)v3);
  sub_100002CF4();
}

void sub_100033FD0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002CE4((void *)&_mh_execute_header, a1, a3, "invalid sntp response payload", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_100034000(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003408C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100034118(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000341A4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100034230(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000342BC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_100010B18(a1, a2);
  if (sub_10000E82C(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  v5 = sub_10000DF24(v4, (uint64_t)a1, (uint64_t)a2, 80, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_10003436C(_BYTE *a1, _BYTE *a2)
{
  os_log_t v2;
  uint8_t *v3;

  sub_100010B40(a1, a2);
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "Ignore NCM interface for display backend", v3, 2u);
}

void sub_1000343A0(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_100010B40(a1, a2);
  sub_100010B30((void *)&_mh_execute_header, v2, v3, "Unsupported interface", v4);
}

void sub_1000343C8(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_100010B40(a1, a2);
  sub_100010B30((void *)&_mh_execute_header, v2, v3, "Interface gone before inspection", v4);
}

void sub_1000343F0(_BYTE *a1, _BYTE *a2)
{
  int v2;
  os_log_t v3;
  uint8_t *v4;

  sub_100010B40(a1, a2);
  sub_100010B30((void *)&_mh_execute_header, v2, v3, "Service entry gone during inspection", v4);
}

void sub_100034418(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Fail to extract USB Serial Number", v1, 2u);
}

void sub_100034458(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_100010B18(a1, a2);
  if (sub_10000E82C(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  v5 = sub_10000DF24(v4, (uint64_t)a1, (uint64_t)a2, 80, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  sub_100010B50(v5);
  __break(1u);
}

void sub_1000344EC(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;

  v2 = *a1;
  v3 = 138543362;
  v4 = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@> Connection timeout, retrying", (uint8_t *)&v3, 0xCu);
  sub_100004C6C();
}

void sub_100034560(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[18];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_100004C80((void *)&_mh_execute_header, a2, a3, "%{public}@> network_connect_in6: %{errno}d", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_WORD *)&v3[16]);
  sub_100004C6C();
}

void sub_1000345D0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100034640(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to create bonjour connection parameters", v1, 2u);
}

void sub_100034680(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000346F0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100034760(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[18];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_100004C80((void *)&_mh_execute_header, a2, a3, "%{public}@> ncm failed to connect with %{errno}d", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_WORD *)&v3[16]);
  sub_100004C6C();
}

void sub_1000347D4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  sub_100010B18(a1, a2);
  if (sub_10000E82C(&_os_log_default))
    v4 = 3;
  else
    v4 = 2;
  v5 = sub_10000DF24(v4, (uint64_t)a1, (uint64_t)a2, 80, (uint64_t)&_mh_execute_header, (uint64_t)&_os_log_default);
  sub_100010B50(v5);
  __break(1u);
}

void sub_100034868(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000348D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to find IOLinkStatus property", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100034904()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to find BSD Name property", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100034930()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to find USB Serial Number property", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003495C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to find locationID property", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100034988()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to find NetworkInterfaceFlags property", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000349B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to find idProduct property", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000349E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to find HostState property", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100034A0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to find IOMACAddress property", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100034A38(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100034AA0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100034B08(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100034B70(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011978((void *)&_mh_execute_header, a2, a3, "IOServiceAddMatchingNotification returned 0x%08x", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_100034BD4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100011978((void *)&_mh_execute_header, a2, a3, "calling apply_io_iterator iterator: %d", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_100034C40(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_100034CEC(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a2, a3, "failed to find ioreg path: %{public}s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100034D50(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "IORegistryEntryCreateIterator: %d", (uint8_t *)v2, 8u);
  sub_100002CF4();
}

void sub_100034DC0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100034E4C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100034ED8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100034F64(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100034FF0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003507C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  if (sub_10000DFF0())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_1000136BC(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100035118(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100035188(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000351F8(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2112;
  *(_QWORD *)&v3[14] = a2;
  sub_1000136D4((void *)&_mh_execute_header, a2, a3, "%{public}@> received error: %@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_100004C6C();
}

void sub_10003526C(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 2114;
  *(_QWORD *)&v3[14] = a2;
  sub_1000136D4((void *)&_mh_execute_header, a2, a3, "%{public}@> nw_listener_state_failed: %{public}@", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16]);
  sub_100004C6C();
}

void sub_1000352E0(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@> Unable to start remoted listener: %{darwin.errno}d", (uint8_t *)&v3, 0x12u);
  sub_100004C6C();
}

void sub_100035360(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  if (sub_10000DFF0())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_1000136BC(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_1000353E8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  uint64_t v5;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a1, v5);
  __break(1u);
}

void sub_100035490(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create interface with index", v1, 2u);
}

void sub_1000354D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "failed to remove device on %{public}s: endpoint not found", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100035530(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  sub_100004C74();
  sub_10000DEDC((void *)&_mh_execute_header, v3, v5, "failed to create RSDNetworkInterface: %{public}@", v6);

  sub_10000DFCC();
}

void sub_1000355C0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100035628()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "failed to convert address to string: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100035688(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000356F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "failed to add device on %{public}s: endpoint already exists", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100035750(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000357B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "failed to init browser: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100035818(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100035880(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C4C((void *)&_mh_execute_header, a1, a3, "Failed to create bonjour connection parameters", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_1000358B0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "failed to listen on %{public}s: listener already exist", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100035910()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "failed to cancel browse on %{public}s: browser not found", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100035970(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000359D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> failed to copy remote address, the connection may have broken", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100035A38()
{
  uint64_t v0;
  os_log_t v1;

  sub_100015B80();
  sub_100004C80((void *)&_mh_execute_header, v0, v1, "%{public}@> network_connect_in6: %{errno}d");
  sub_100004C6C();
}

void sub_100035A9C()
{
  uint64_t v0;
  os_log_t v1;

  sub_100015B80();
  sub_100004C80((void *)&_mh_execute_header, v0, v1, "%{public}@> can't create bonjour parameters: %{darwin.errno}d");
  sub_100004C6C();
}

void sub_100035B00()
{
  uint64_t v0;
  os_log_t v1;

  sub_100015B80();
  sub_100004C80((void *)&_mh_execute_header, v0, v1, "%{public}@> ncm failed to connect with %{errno}d");
  sub_100004C6C();
}

void sub_100035B64(const char *a1, _QWORD *a2, _OWORD *a3)
{
  uint64_t v5;
  int *v6;
  uint64_t v7;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v5 = 3;
  else
    v5 = 2;
  v6 = __error();
  strerror(*v6);
  v7 = _os_log_send_and_compose_impl(v5, a2, a3, 80, &_mh_execute_header, &_os_log_default, 16);
  _os_crash_msg(*a2, v7);
  __break(1u);
}

void sub_100035C48()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "failed to send goodbye to peer: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100035CA8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100035D10(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100035D78(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "existing device found, skipping creating", v1, 2u);
  sub_100002CF4();
}

void sub_100035DB4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C4C((void *)&_mh_execute_header, a1, a3, "unexpected duplicate bonjour uuid", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_100035DE4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100035E4C(uint64_t a1, uint64_t a2)
{
  _os_crash("impossible became possible: more than one RSD device with the same uuid", a2);
  __break(1u);
}

void sub_100035E64(char a1, NSObject *a2)
{
  const char *v2;
  int v3;
  const char *v4;

  v2 = "failed";
  if ((a1 & 1) != 0)
    v2 = "succeeded";
  v3 = 136315138;
  v4 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "heartbeat %s", (uint8_t *)&v3, 0xCu);
  sub_100004C6C();
}

void sub_100035EEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "received bonjour browser error: %@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100035F4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "unexpected bonjour browser state: %d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100035FAC()
{
  os_log_t v0;
  uint8_t v1[24];

  sub_100004C74();
  _os_log_fault_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_FAULT, "nw_browser_state_failed: %@", v1, 0xCu);
  sub_100004C6C();
}

void sub_100036018(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100015B70((void *)&_mh_execute_header, a2, a3, "failed to init listener: %{darwin.errno}d", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_10003607C(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;

  v3 = a1;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "localizedDescription"));
  v6 = 138543362;
  v7 = v4;
  sub_10000DEDC((void *)&_mh_execute_header, v3, v5, "failed to create RSDNetworkInterface: %{public}@", (uint8_t *)&v6);

}

void sub_100036118(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100036180()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100016F3C();
  sub_100016F54((void *)&_mh_execute_header, v0, v1, "listener xor-ed device uuid: %{uuid_t}.16P", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000361F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100016F3C();
  sub_100016F54((void *)&_mh_execute_header, v0, v1, "listener boot session uuid: %{uuid_t}.16P", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100036254(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000362BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100016F3C();
  sub_100016F54((void *)&_mh_execute_header, v0, v1, "listener device uuid: %{uuid_t}.16P", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003632C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100036394(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 136446210;
  v4 = a1;
  sub_10000DEDC((void *)&_mh_execute_header, a2, a3, "failed to listen on %{public}s: listener already exist", (uint8_t *)&v3);
  sub_100004C6C();
}

void sub_1000363FC(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 136446210;
  v4 = a1;
  sub_10000DEDC((void *)&_mh_execute_header, a2, a3, "failed to cancel listen on %{public}s: listener not found", (uint8_t *)&v3);
  sub_100004C6C();
}

void sub_100036464(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100015B70((void *)&_mh_execute_header, a2, a3, "failed to send goodbye to peer: %{darwin.errno}d", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_1000364C8(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100015B70((void *)&_mh_execute_header, a2, a3, "network_copy_socket_remote_address_in6: %{darwin.errno}d", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_10003652C(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_100016F64((void *)&_mh_execute_header, a3, (uint64_t)a3, "failed to create controller device", a1);
}

void sub_100036560(NSObject *a1, uint64_t a2, uint64_t a3)
{
  uint8_t v3[16];

  *(_WORD *)v3 = 0;
  sub_100016F64((void *)&_mh_execute_header, a1, a3, "failed to create controller device", v3);
  sub_100002CF4();
}

void sub_100036594(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000365FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Client is lack of entitlement", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036628()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Compute platform message missing command", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036654()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Bogus request: no interface name", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036680()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Bogus request: no address", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000366AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Bogus request: interface is not valid", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000366D8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Unexpected command", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036704()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Bogus request: no TLS requirement", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036730()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Boot arg '%{public}@' contains invalid TLS requirement", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100036790()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Pref '%{public}@' contains invalid TLS requirement", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000367F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100004C4C((void *)&_mh_execute_header, v0, v1, "Identity creation failed.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003681C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to create ACL: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003687C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to create keypair: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000368DC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to create self-signed certificate.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036908()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to create identity.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036934()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to wrap identity", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036960()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "SecItemAdd failed with: %d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000369C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to get chassis manifest with error: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100036A20()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "DCRT chain is unavailable: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100036A80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to attest key with DAK.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036AAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to get DAK: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100036B0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to attest key with DAK: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100036B6C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to delete identity: %d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036BCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to copy certificate from identity: %d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036C2C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to copy identity: %d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036C8C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to issue DCRT: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100036CEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to issue DCRT after %d attempt(s)", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036D4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to copy certificate chain.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036D78()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to get cert chain's leaf certificate.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036DA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to copy leaf certificate public key.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036DD0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to copy leaf certificate public key data with error: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100036E30()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "No DCRT chain present in peer TLS certificate.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036E5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to parse DCRT chain data.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036E88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "No DAK attestation present in peer TLS certificate.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036EB4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to verify cnode peer with chassis manifest", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036EE0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to verify cctrl peer with chassis manifest", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036F0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to verify DAK attestation", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036F38()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to verify DCRT cert chain", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036F64()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to parse DAK attestation with aks error: 0x%08x", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100036FC4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to parse certificate set: 0x%08x", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037024()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to trust DCRT with either the SCRT or UCRT root CA.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037050()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "DCRT not trusted with the SCRT root CA.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003707C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to get DCRT leaf cert.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000370A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to extract public key from DCRT.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000370D4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to extract DCRT public key data with error: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100037134()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to verify DAK attestation with aks error: 0x%08x", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037194()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to get local chassis manifest with error: %{public}@. Will skip validating that peer is a cnode in the same chassis.", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000371F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100004C4C((void *)&_mh_execute_header, v0, v1, "Self failed to match the cctrl in the chassis manifest", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037220()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to get own chipID and/or ECID", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003724C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Peer failed to authenticate as any compute node in the chassis", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037278()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to extract hardware identifiers from peer's DAK attestation.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000372A4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "No chassis manifest present in peer TLS certificate.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000372D0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to validate chassis manifest from peer cert with error: %{public}@.", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100037330()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Self failed to match any compute node in the chassis", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003735C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Peer failed to authenticate as cctrl", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037388()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to load BAA SCRT root CA cert data.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000373B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to create system BAA trust policy.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000373E0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to parse BAA root CA cert.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003740C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_10000DF54(__stack_chk_guard);
  sub_10000DF3C();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Peer's DCRT failed trust evaluation with error: %{public}@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003746C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to read trust result with status: %d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000374CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to set anchor cert: 0x%08x", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003752C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to create DCRT trust object: 0x%08x", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003758C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to load BAA UCRT root CA cert data.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000375B8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to create user BAA trust policy.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000375E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to create NSData", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037610()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to create NSString from NSData", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003763C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to split identity string into 4 components", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037668(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = sub_10001BB30(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectAtIndexedSubscript:", 1));
  sub_100004C74();
  sub_10000DEDC((void *)&_mh_execute_header, v3, v5, "Failed to parse ecid: %{public}@", v6);

  sub_10000DFCC();
}

void sub_1000376F8(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = sub_10001BB30(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectAtIndexedSubscript:", 0));
  sub_100004C74();
  sub_10000DEDC((void *)&_mh_execute_header, v3, v5, "Failed to parse chipId: %{public}@", v6);

  sub_10000DFCC();
}

void sub_100037788()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to extract identity param from attestation with error: %08x", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000377E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to read ChipID", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037814()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to read UniqueChipID", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037840()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to extract HW identifiers from cctrl UDID '%{public}@'", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000378A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Chassis manifest contained unexpected type for cctrl UDID", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000378CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to split UDID string '%{public}@' into 2 components", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003792C(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = sub_10001BB30(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectAtIndexedSubscript:", 1));
  sub_100004C74();
  sub_10000DEDC((void *)&_mh_execute_header, v3, v5, "Failed to parse cnode Ecid: %{public}@", v6);

  sub_10000DFCC();
}

void sub_1000379BC(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  uint8_t v6[24];

  v3 = sub_10001BB30(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a2, "objectAtIndexedSubscript:", 0));
  sub_100004C74();
  sub_10000DEDC((void *)&_mh_execute_header, v3, v5, "Failed to parse cnode ChipId: %{public}@", v6);

  sub_10000DFCC();
}

void sub_100037A4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "copy_socket_remote_address: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037AAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "@{public}@> invalid peer socket, not replacing", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037AD8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100037B40()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to enable bonjour due to invalid interface name", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037B6C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 136446210;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to find interface index for name %{public}s", (uint8_t *)&v2, 0xCu);
  sub_100004C6C();
}

void sub_100037BDC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10001CE84(a1, a2);
  if (sub_10000DFF0())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_1000136BC(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100010B50(v6);
  __break(1u);
}

void sub_100037C50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "init_peer_listener: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037CB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "network_copy_interface_address_in6: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037D10()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to enable bonjour as it's already enabled", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037D3C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "network peer isn't enabled, ignore disabling request", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037D68(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100037DD0()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_100002CFC();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "disconnecting all devices", v1, 2u);
  sub_100002CF4();
}

void sub_100037E08()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "network peer isn't enabled, ignore connection request", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037E34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to create client peer device from address", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037E60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "already has a peer with the same address, not connecting", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100037E8C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10001CE84(a1, a2);
  if (sub_10000DFF0())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_1000136BC(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100010B50(v6);
  __break(1u);
}

void sub_100037F14(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "failed to create server device", buf, 2u);
}

void sub_100037F50(int *a1, int a2, os_log_t log)
{
  int v3;
  _DWORD v4[2];
  __int16 v5;
  int v6;

  v3 = *a1;
  v4[0] = 67109376;
  v4[1] = v3;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "connect(fd: %d, ...) failed with %{darwin.errno}d\n", (uint8_t *)v4, 0xEu);
  sub_100004C6C();
}

void sub_100037FD4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003803C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "network_init_socket_in6: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003809C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002CE4((void *)&_mh_execute_header, a1, a3, "invalid interface index for link local address", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_1000380CC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "socket(2): %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003812C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "failed to set tcp options: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003818C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "setsockopt(IPV6_BOUND_IF) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

float sub_1000381EC(int *a1, NSObject *a2)
{
  int v2;
  float result;
  _DWORD v4[2];
  __int16 v5;
  int v6;
  __int16 v7;
  int v8;
  __int16 v9;
  int v10;

  v2 = *a1;
  v4[0] = 67109888;
  v4[1] = 30;
  v5 = 1024;
  v6 = 1;
  v7 = 1024;
  v8 = 0;
  v9 = 1024;
  v10 = v2;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "socket(domain: %d, type: %d, protocol: %d) ret: %d", (uint8_t *)v4, 0x1Au);
  return result;
}

void sub_100038284(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000382EC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "setsockopt(SO_REUSEADDR) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003834C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "bind(2): %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000383AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "listen(2): %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003840C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "getsockname(2): %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003846C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002CE4((void *)&_mh_execute_header, a1, a3, "invalid addr", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_10003849C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a2, a3, "Cannot find sockaddr_in6 for %s", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100038500(NSObject *a1)
{
  int v2;
  _DWORD v3[2];

  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "getifaddrs(2): %{errno}d", (uint8_t *)v3, 8u);
  sub_100004C6C();
}

void sub_100038588(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000385F0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "getpeername: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100038650(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a2, a3, "interface %{public}s is invalid: no index found", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_1000386B4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a2, a3, "interface %{public}s is invalid: can't find valid IPv6 address", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_100038718()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to accept peer socket: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100038778()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "Failed to set tcp options on accepted peer socket: %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000387D8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100038840()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "setsockopt(TCP_KEEPINTVL) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000388A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "setsockopt(TCP_KEEPCNT) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100038900()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "setsockopt(TCP_KEEPALIVE) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100038960()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "setsockopt(SO_KEEPALIVE) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000389C0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100015B98();
  sub_100015B70((void *)&_mh_execute_header, v0, v1, "setsockopt(TCP_CONNECTIONTIMEOUT) failed %{darwin.errno}d", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100038A20(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100023690(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100038AA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Service message with missing or unexpected command", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100038AD4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100023690(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100038B5C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Bogus service request: client doesn't expect reply", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100038B88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_10000DF74((void *)&_mh_execute_header, v0, v1, "%{public}@> Returning full properties set", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100038BE8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100038C50()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_10000DF74((void *)&_mh_execute_header, v0, v1, "%{public}@> Returning only public properties", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100038CB0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Device message missing command", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100038CDC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1000236AC(a1, a2, a3, 4.8752e-34);
  sub_10002366C((void *)&_mh_execute_header, v5, v3, "Listing services on %{public}s (client=\"%s\")", v4);
}

void sub_100038D18(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3;
  uint8_t *v4;
  NSObject *v5;

  sub_1000236AC(a1, a2, a3, 4.8752e-34);
  sub_10002366C((void *)&_mh_execute_header, v5, v3, "Listing local services exposed to %{public}s (client=\"%s\")", v4);
}

void sub_100038D54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "device_get_service: GET query with no name key", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100038D80()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "device_check_service: CHECK query with no name key", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100038DAC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100023690(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100038E34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Bogus request: doesn't contain alias", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100038E60(void *a1, void *a2)
{
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[24];

  v3 = a1;
  remote_device_type_get_description(objc_msgSend(a2, "type"));
  sub_100004C74();
  sub_10000DEDC((void *)&_mh_execute_header, v3, v4, "device type %{public}s cannot be disconnected manually", v5);

  sub_10000DFCC();
}

void sub_100038EEC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "device_authenticate: No certificate data (client=\"%s\")", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100038F4C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "device_authenticate: Failed to create cert from data (client=\"%s\")", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100038FAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "device_authenticate: Failed to authenticate peer cert (client=\"%s\")", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003900C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Device message with unexpected command", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100039038()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Bogus device request: client doesn't expect reply", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100039064()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Unexpected message on browse connection - unregistering client browse.", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100039090(char a1, uint64_t a2, NSObject *a3)
{
  const char *v3;
  int v4;
  const char *v5;
  __int16 v6;
  uint64_t v7;

  v3 = "with";
  if ((a1 & 1) == 0)
    v3 = "without";
  v4 = 136446466;
  v5 = v3;
  v6 = 2080;
  v7 = a2;
  sub_10002366C((void *)&_mh_execute_header, a3, (uint64_t)a3, "Sending device note %{public}s sensitive properties (client=\"%s\")", (uint8_t *)&v4);
  sub_100004C6C();
}

void sub_100039120()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_10000DF74((void *)&_mh_execute_header, v0, v1, "Canceling client browse. (client=\"%s\")", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100039180(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000391E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Peer message missing command", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_100039214(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003927C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Peer message with unexpected command", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000392A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Bogus peer request: client doesn't expect reply", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_1000392D4(void **a1, void *a2)
{
  void *v2;
  NSObject *v3;
  uint64_t v4;
  uint8_t v5[24];

  v2 = *a1;
  v3 = a2;
  objc_msgSend(v2, "name");
  sub_100004C74();
  sub_10000DEDC((void *)&_mh_execute_header, v3, v4, "%{public}s> Connect failed", v5);

  sub_10000DFCC();
}

void sub_10003935C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000393C4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003942C(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "failed to send goodbye to peer: %{darwin.errno}d", (uint8_t *)v2, 8u);
  sub_100002CF4();
}

void sub_10003949C(char a1, int a2, os_log_t log)
{
  _DWORD v3[2];
  __int16 v4;
  int v5;

  v3[0] = 67109376;
  v3[1] = a1 & 1;
  v4 = 1024;
  v5 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "GET query with invalid criteria (trust:%d u:%d)", (uint8_t *)v3, 0xEu);
  sub_100004C6C();
}

void sub_100039520(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100039588()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "No local identity available. (client=\"%s\")", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000395E8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to copy key attributes. (client=\"%s\")", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100039648()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to copy key data. (client=\"%s\")", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_1000396A8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "Failed to copy certificate data. (client=\"%s\")", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_100039708()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;

  sub_100023678();
  sub_100004C80((void *)&_mh_execute_header, v0, v1, "Failed to copy certificate from identity: %d (client=\"%s\")", v2, v3);
  sub_100004C6C();
}

void sub_100039768()
{
  uint64_t v0;
  os_log_t v1;
  int v2;
  const char *v3;

  sub_100023678();
  sub_100004C80((void *)&_mh_execute_header, v0, v1, "Failed to copy private key from identity: %d (client=\"%s\")", v2, v3);
  sub_100004C6C();
}

void sub_1000397C8(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Unable to start remoted listener: %{darwin.errno}d", (uint8_t *)v2, 8u);
  sub_100002CF4();
}

void sub_100039838(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000398A0(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "Failed to create bonjour connection parameters", v1, 2u);
  sub_100002CF4();
}

void sub_1000398DC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_100039944(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_1000399AC(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to create interface with index", v1, 2u);
  sub_100002CF4();
}

void sub_1000399E8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10001CE84(a1, a2);
  if (sub_10000DFF0())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_1000136BC(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100010B50(v6);
  __break(1u);
}

void sub_100039A5C(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a2, a3, "received error: %@", a5, a6, a7, a8, 2u);
}

void sub_100039AC4(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a2, a3, "nw_listener_state_failed: %{public}@", a5, a6, a7, a8, 2u);
}

void sub_100039B2C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v4;
  int *v5;
  uint64_t v6;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = __error();
  strerror(*v5);
  v6 = _os_log_send_and_compose_impl(v4, a1, a2, 80, &_mh_execute_header, &_os_log_default, 16);
  sub_10000DFAC(v6);
  __break(1u);
}

void sub_100039C04(const char *a1, _QWORD *a2, _OWORD *a3)
{
  uint64_t v5;
  int *v6;
  uint64_t v7;

  strlen(a1);
  *a2 = 0;
  *a3 = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  a3[3] = 0u;
  a3[4] = 0u;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v5 = 3;
  else
    v5 = 2;
  v6 = __error();
  strerror(*v6);
  v7 = _os_log_send_and_compose_impl(v5, a2, a3, 80, &_mh_execute_header, &_os_log_default, 16);
  sub_10000DFAC(v7);
  __break(1u);
}

void sub_100039CE0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100039D6C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100039DF8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100039E84(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100039F10(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_100039F9C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003A028(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003A0B4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100010B18(a1, a2);
  if (sub_10000DFF0())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_1000136BC(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003A150(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003A1C0(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "%{public}@> Unable to start remoted listener: %{errno}d", (uint8_t *)&v3, 0x12u);
}

void sub_10003A244(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_100010B18(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003A2B4(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "extract_io_property_hoststate failed", v1, 2u);
}

void sub_10003A2F4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100023690(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003A37C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100023690(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003A404(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100023690(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003A48C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100023690(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003A514(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  sub_100023690(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v7 = sub_1000023A8(v3, v4, v5, v6, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003A59C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_10000DFF0())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_1000136BC(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003A640(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[18];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_100004C80((void *)&_mh_execute_header, a2, a3, "%{public}@> network_connect_in6: %{errno}d", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_WORD *)&v3[16]);
}

void sub_10003A6B4(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[18];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = *(_QWORD *)(a1 + 32);
  *(_WORD *)&v3[12] = 1024;
  *(_DWORD *)&v3[14] = a2;
  sub_100004C80((void *)&_mh_execute_header, a2, a3, "%{public}@> ncm failed to connect with %{errno}d", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_WORD *)&v3[16]);
}

void sub_10003A72C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a1 = 0;
  a2[3] = 0u;
  a2[4] = 0u;
  a2[1] = 0u;
  a2[2] = 0u;
  *a2 = 0u;
  if (sub_10000DFF0())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_1000136BC(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  _os_crash_msg(*a1, v7);
  __break(1u);
}

void sub_10003A7BC(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 136446210;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "failed to listen on %{public}s in publisher", (uint8_t *)&v2, 0xCu);
  sub_100004C6C();
}

void sub_10003A82C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 136446210;
  v3 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unknown event name: %{public}s", (uint8_t *)&v2, 0xCu);
  sub_100004C6C();
}

void sub_10003A89C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002CE4((void *)&_mh_execute_header, a1, a3, "unknown event, skipping", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_10003A8CC(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;

  v3 = 136446466;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_fault_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_FAULT, "failed to start browsing on %{public}s in publisher: %{darwin.errno}d", (uint8_t *)&v3, 0x12u);
  sub_100004C6C();
}

void sub_10003A94C(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "unexpected return value %d for inet_pton", (uint8_t *)v2, 8u);
  sub_100002CF4();
}

void sub_10003A9BC(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002CE4((void *)&_mh_execute_header, a1, a3, "The address cannot be parsed as a valid IPv6 address", a5, a6, a7, a8, 0);
  sub_100002CF4();
}

void sub_10003A9EC(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "inet_pton: %{darwin.errno}d", (uint8_t *)v2, 8u);
  sub_100002CF4();
}

void sub_10003AA5C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003AAC4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003AB2C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003AB94(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003ABFC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003AC64(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003ACCC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003AD34()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100004C4C((void *)&_mh_execute_header, v0, v1, "Failed to create bonjour connection parameters", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003AD60()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "Failed to create interface with index", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003AD8C()
{
  int v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  int v4;

  sub_100004C74();
  v3 = 1024;
  v4 = v0;
  _os_log_error_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_ERROR, "%{public}@> network_copy_interface_address_in6: %{darwin.errno}d", v2, 0x12u);
  sub_100004C6C();
}

void sub_10003AE08(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003AE70(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003AED8(uint64_t a1, NSObject *a2)
{
  int v2;
  const char *v3;
  __int16 v4;
  uint64_t v5;

  v2 = 136446466;
  v3 = "remotexpc-bonjour-enabled";
  v4 = 2048;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, " %{public}s wrong data length: %lu", (uint8_t *)&v2, 0x16u);
  sub_100004C6C();
}

void sub_10003AF5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, " %{public}s not a CFData", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003AFCC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "enable bonjour peer on %s failed after maximum retries", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003B02C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "bonjour peer not initialized on this platform, bailing", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003B058()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "failed to find interface index for name %s", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003B0B8(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B120(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B188(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10001CE84(a1, a2);
  if (sub_10000DFF0())
    v5 = 3;
  else
    v5 = 2;
  v6 = sub_1000136BC(v5, v2, v3, v4, (uint64_t)&_mh_execute_header);
  sub_100010B50(v6);
  __break(1u);
}

void sub_10003B1FC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B264(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B2CC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B334(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B39C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "bonjour wasn't enabled, ignore disabling request", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003B3C8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_10002AD84((void *)&_mh_execute_header, v0, v1, "removing all endpoint uuids", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003B3F4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_10002AD84((void *)&_mh_execute_header, v0, v1, "disconnecting all devices", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003B420()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_10002AD84((void *)&_mh_execute_header, v0, v1, "cancelling listener", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003B44C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_10002AD84((void *)&_mh_execute_header, v0, v1, "cancelling browser", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003B478()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to enable bonjour peer", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003B4A4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B50C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B574()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to get matching service", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003B5A0()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100002CE4((void *)&_mh_execute_header, v0, v1, "failed to extract bonjour interface name", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003B5CC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B634(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B69C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B704()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_10002AD84((void *)&_mh_execute_header, v0, v1, "existing device found, skipping creating", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003B730()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100002CFC();
  sub_100004C4C((void *)&_mh_execute_header, v0, v1, "unexpected duplicate bonjour uuid", v2, v3, v4, v5, v6);
  sub_100002CF4();
}

void sub_10003B75C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B7C4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B82C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "received bonjour browser error: %@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003B88C(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "unexpected bonjour browser state: %d", (uint8_t *)v2, 8u);
  sub_100002CF4();
}

void sub_10003B8FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "nw_browser_state_failed: %@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003B95C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003B9C4(uint64_t a1, uint64_t a2)
{
  _os_crash("impossible became possible: more than one RSD device with the same endpoint", a2);
  __break(1u);
}

void sub_10003B9DC(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "skip browsed loopback peer", buf, 2u);
}

void sub_10003BA18(uint64_t a1, uint64_t a2, NSObject *a3)
{
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t description;

  v4 = 138543618;
  v5 = a1;
  v6 = 2080;
  description = nw_endpoint_get_description(a2);
  _os_log_debug_impl((void *)&_mh_execute_header, a3, OS_LOG_TYPE_DEBUG, "%{public}@> search endpoint: %s", (uint8_t *)&v4, 0x16u);
}

void sub_10003BAB4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003BB1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "received error: %@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003BB7C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "nw_listener_state_failed: %@", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003BBDC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> xpc_remote_connection_copy_remote_endpoint failed. Connection may have broken", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003BC3C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003BCA4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> nw_endpoint_get_address failed", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003BD04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "%{public}@> cannot know remote inet6 before device is connected", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003BD64(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "IOServiceAddInterestNotification on ncm interface: 0x%x", (uint8_t *)v2, 8u);
  sub_100002CF4();
}

void sub_10003BDD4(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "IOServiceAddInterestNotification match: type = 0x%08x", (uint8_t *)v2, 8u);
  sub_100002CF4();
}

void sub_10003BE44(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003BEAC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "[%p] failed to copy interface MAC address", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003BF0C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003BF74()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_100004C5C((void *)&_mh_execute_header, v0, v1, "[%p] failed to copy interface name", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003BFD4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_10000DF74((void *)&_mh_execute_header, v0, v1, "[%p] addressing", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003C034()
{
  const void *vars0;

  _os_crash("[%p] can't address interface after max retries", vars0);
  __break(1u);
}

void sub_10003C04C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003C0B4(uint64_t a1, _QWORD *a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a2 = 0;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  *a3 = 0u;
  if (sub_1000023CC())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_1000023A8(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v7);
  __break(1u);
}

void sub_10003C140(uint64_t a1, _QWORD *a2, _OWORD *a3)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  *a2 = 0;
  a3[3] = 0u;
  a3[4] = 0u;
  a3[1] = 0u;
  a3[2] = 0u;
  *a3 = 0u;
  if (sub_1000023CC())
    v6 = 3;
  else
    v6 = 2;
  v7 = sub_1000023A8(v6, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v7);
  __break(1u);
}

void sub_10003C1CC()
{
  _os_crash("Invalid forward transition from DETACHED");
  __break(1u);
}

void sub_10003C1E4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_100004C74();
  sub_10000DF74((void *)&_mh_execute_header, v0, v1, "[%p] Releasing", v2, v3, v4, v5, v6);
  sub_100004C6C();
}

void sub_10003C244(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003C2AC(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003C314(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003C37C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003C3E4(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = a1;
  sub_10002D9F4();
  sub_10002D9DC();
  sub_10002D9C8((void *)&_mh_execute_header, v3, v4, "%{public}@> socket(2): %{errno}d", v5, v6, v7, v8, v9);

  sub_10000DFCC();
}

void sub_10003C460(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = a1;
  sub_10002D9F4();
  sub_10002D9DC();
  sub_10002D9C8((void *)&_mh_execute_header, v3, v4, "%{public}@> bind(2): %{errno}d", v5, v6, v7, v8, v9);

  sub_10000DFCC();
}

void sub_10003C4DC(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = a1;
  sub_10002D9F4();
  sub_10002D9DC();
  sub_10002D9C8((void *)&_mh_execute_header, v3, v4, "%{public}@> listen(2): %{errno}d", v5, v6, v7, v8, v9);

  sub_10000DFCC();
}

void sub_10003C558(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = a1;
  sub_10002D9F4();
  sub_10002D9DC();
  sub_10002D9C8((void *)&_mh_execute_header, v3, v4, "%{public}@> getsockname(2): %{errno}d", v5, v6, v7, v8, v9);

  sub_10000DFCC();
}

void sub_10003C5D4(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "%{public}@> loopback is suspended, faking a failed connect", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003C644(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = a1;
  sub_10002D9F4();
  sub_10002D9DC();
  sub_10002D9C8((void *)&_mh_execute_header, v3, v4, "%{public}@> fcntl(2): Failed to set O_NONBLOCK: %{errno}d", v5, v6, v7, v8, v9);

  sub_10000DFCC();
}

void sub_10003C6C0(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  __int16 v4;
  uint64_t v5;

  v2 = 138543618;
  v3 = qword_100057FB8;
  v4 = 2082;
  v5 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}@> invalid port %{public}s", (uint8_t *)&v2, 0x16u);
  sub_100004C6C();
}

void sub_10003C744(void *a1)
{
  void *v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint8_t v9;

  v2 = a1;
  sub_10002D9F4();
  sub_10002D9DC();
  sub_10002D9C8((void *)&_mh_execute_header, v3, v4, "%{public}@> connectx(2): %{errno}d", v5, v6, v7, v8, v9);

  sub_10000DFCC();
}

void sub_10003C7C0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100004C5C((void *)&_mh_execute_header, a1, a3, "%{public}@> Received a message with no type", a5, a6, a7, a8, 2u);
  sub_100004C6C();
}

void sub_10003C830(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  sub_1000023C0(v6);
  __break(1u);
}

void sub_10003C898(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  sub_10000DEE8(a1, a2);
  sub_1000023CC();
  sub_10000DF08();
  v6 = sub_1000023A8(v2, v3, v4, v5, (uint64_t)&_mh_execute_header);
  v7 = sub_1000023C0(v6);
  __break(1u);
  AMFDRSealingMapCopyDictFromCombinedData(v7, v8, v9, v10, v11, v12);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend__resetNow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "_resetNow");
}

id objc_msgSend_activate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "activate");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address");
}

id objc_msgSend_address_endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "address_endpoint");
}

id objc_msgSend_addressed_callback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addressed_callback");
}

id objc_msgSend_advanceState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "advanceState:");
}

id objc_msgSend_allObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allObjects");
}

id objc_msgSend_array(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "array");
}

id objc_msgSend_arrayWithObjects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "arrayWithObjects:count:");
}

id objc_msgSend_attach(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "attach");
}

id objc_msgSend_base64EncodedStringWithOptions_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "base64EncodedStringWithOptions:");
}

id objc_msgSend_bonjourUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bonjourUUID");
}

id objc_msgSend_bonjour_endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bonjour_endpoint");
}

id objc_msgSend_BOOLValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "BOOLValue");
}

id objc_msgSend_browser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "browser");
}

id objc_msgSend_bytes(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "bytes");
}

id objc_msgSend_cancel(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancel");
}

id objc_msgSend_cancelBrowsing(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelBrowsing");
}

id objc_msgSend_cancelListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "cancelListener");
}

id objc_msgSend_canceled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "canceled");
}

id objc_msgSend_characterAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "characterAtIndex:");
}

id objc_msgSend_client_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "client_connection");
}

id objc_msgSend_client_endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "client_endpoint");
}

id objc_msgSend_code(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "code");
}

id objc_msgSend_compare_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "compare:");
}

id objc_msgSend_componentsSeparatedByString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "componentsSeparatedByString:");
}

id objc_msgSend_connect_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connect:");
}

id objc_msgSend_connectToService_withTcpOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectToService:withTcpOption:");
}

id objc_msgSend_connectable(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connectable");
}

id objc_msgSend_connected(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connected");
}

id objc_msgSend_connection(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "connection");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_control_peer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "control_peer");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_copyClientDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyClientDescription");
}

id objc_msgSend_copyClientDescriptionWithSensitiveProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyClientDescriptionWithSensitiveProperties:");
}

id objc_msgSend_copyServiceDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyServiceDescription");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createBonjourListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createBonjourListener");
}

id objc_msgSend_createPortListener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createPortListener");
}

id objc_msgSend_deactivate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deactivate");
}

id objc_msgSend_deliverDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "deliverDevice:");
}

id objc_msgSend_description(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "description");
}

id objc_msgSend_detached_callback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "detached_callback");
}

id objc_msgSend_device(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device");
}

id objc_msgSend_device_alias(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device_alias");
}

id objc_msgSend_device_id(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device_id");
}

id objc_msgSend_device_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device_listener");
}

id objc_msgSend_device_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device_name");
}

id objc_msgSend_device_peers(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "device_peers");
}

id objc_msgSend_dictionaryWithContentsOfURL_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithContentsOfURL:error:");
}

id objc_msgSend_dictionaryWithObjects_forKeys_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dictionaryWithObjects:forKeys:count:");
}

id objc_msgSend_disconnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "disconnect");
}

id objc_msgSend_dontRestartBrowse(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "dontRestartBrowse");
}

id objc_msgSend_drainPendedRequests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "drainPendedRequests");
}

id objc_msgSend_endpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "endpoint");
}

id objc_msgSend_entitlement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "entitlement");
}

id objc_msgSend_eraseAll(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "eraseAll");
}

id objc_msgSend_fetchDeviceAlias(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fetchDeviceAlias");
}

id objc_msgSend_fileURLWithPath_isDirectory_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileURLWithPath:isDirectory:");
}

id objc_msgSend_fireDevice_fd_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fireDevice:fd:");
}

id objc_msgSend_getSocketWithTcpOption_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getSocketWithTcpOption:");
}

id objc_msgSend_getTcpOptions(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "getTcpOptions");
}

id objc_msgSend_goodByeWithCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "goodByeWithCallback:");
}

id objc_msgSend_handleReset_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleReset:");
}

id objc_msgSend_handleResetGoAhead(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handleResetGoAhead");
}

id objc_msgSend_handshakeCompleted_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handshakeCompleted:");
}

id objc_msgSend_hasPrefix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasPrefix:");
}

id objc_msgSend_hasSuffix_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "hasSuffix:");
}

id objc_msgSend_heartbeatWithCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heartbeatWithCallback:");
}

id objc_msgSend_heartbeat_requests(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heartbeat_requests");
}

id objc_msgSend_heartbeat_sequence_number(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heartbeat_sequence_number");
}

id objc_msgSend_heartbeat_stats(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "heartbeat_stats");
}

id objc_msgSend_if_index(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "if_index");
}

id objc_msgSend_if_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "if_name");
}

id objc_msgSend_inactive_callback(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "inactive_callback");
}

id objc_msgSend_index(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "index");
}

id objc_msgSend_init(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "init");
}

id objc_msgSend_initClientWithRemoteAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initClientWithRemoteAddress:");
}

id objc_msgSend_initServerWithPeerSocket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initServerWithPeerSocket:");
}

id objc_msgSend_initWithAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithAddress:");
}

id objc_msgSend_initWithBrowsedEndpointUUID_uuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBrowsedEndpointUUID:uuid:");
}

id objc_msgSend_initWithBytes_length_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithBytes:length:");
}

id objc_msgSend_initWithClientEndpoint_controlPeer_interfaceName_connectTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClientEndpoint:controlPeer:interfaceName:connectTimeout:");
}

id objc_msgSend_initWithData_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithData:encoding:");
}

id objc_msgSend_initWithDomain_code_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithDomain:code:userInfo:");
}

id objc_msgSend_initWithGeneratedName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithGeneratedName");
}

id objc_msgSend_initWithGeneratedName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithGeneratedName:");
}

id objc_msgSend_initWithIncomingEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithIncomingEndpoint:");
}

id objc_msgSend_initWithInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInterface:");
}

id objc_msgSend_initWithInterface_address_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInterface:address:");
}

id objc_msgSend_initWithInterface_endpoint_bonjourUUID_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInterface:endpoint:bonjourUUID:");
}

id objc_msgSend_initWithInterface_peerConnection_endpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInterface:peerConnection:endpoint:");
}

id objc_msgSend_initWithInterface_peerSocket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInterface:peerSocket:");
}

id objc_msgSend_initWithInterface_targetQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithInterface:targetQueue:");
}

id objc_msgSend_initWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:");
}

id objc_msgSend_initWithName_description_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:description:");
}

id objc_msgSend_initWithName_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithName:error:");
}

id objc_msgSend_initWithPrefDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPrefDomain:");
}

id objc_msgSend_initWithRequest_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithRequest:");
}

id objc_msgSend_initWithServerListener_controlPeer_interfaceName_interfaceIndex_connectTimeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithServerListener:controlPeer:interfaceName:interfaceIndex:connectTimeout:");
}

id objc_msgSend_initWithService_forDevice_withPort_onSocket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:forDevice:withPort:onSocket:");
}

id objc_msgSend_initWithService_notificationPort_queue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithService:notificationPort:queue:");
}

id objc_msgSend_initWithToken_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithToken:name:");
}

id objc_msgSend_initWithToken_name_event_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithToken:name:event:");
}

id objc_msgSend_initWithUSBSerialNumber_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUSBSerialNumber:");
}

id objc_msgSend_initWithUUIDBytes_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUUIDBytes:");
}

id objc_msgSend_interface(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interface");
}

id objc_msgSend_interface_index(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "interface_index");
}

id objc_msgSend_invokeWhenConnectable_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invokeWhenConnectable:");
}

id objc_msgSend_isEqual_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isEqual:");
}

id objc_msgSend_isHost(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isHost");
}

id objc_msgSend_is_exposed_to_untrusted_devices(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_exposed_to_untrusted_devices");
}

id objc_msgSend_is_exposed_to_untrusted_devices_internal(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_exposed_to_untrusted_devices_internal");
}

id objc_msgSend_is_exposed_to_untrusted_devices_presetup(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_exposed_to_untrusted_devices_presetup");
}

id objc_msgSend_is_private(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "is_private");
}

id objc_msgSend_lastObject(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "lastObject");
}

id objc_msgSend_latestConnectError(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "latestConnectError");
}

id objc_msgSend_legacy_port(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "legacy_port");
}

id objc_msgSend_length(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "length");
}

id objc_msgSend_limit_load_from_device_types(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "limit_load_from_device_types");
}

id objc_msgSend_limit_load_to_device_types(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "limit_load_to_device_types");
}

id objc_msgSend_listenForService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listenForService:");
}

id objc_msgSend_listenForService_port_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listenForService:port:");
}

id objc_msgSend_listenOnBonjourName_type_domain_configureTLS_connectionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listenOnBonjourName:type:domain:configureTLS:connectionHandler:");
}

id objc_msgSend_listenOnPort_connectionHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "listenOnPort:connectionHandler:");
}

id objc_msgSend_local_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "local_address");
}

id objc_msgSend_localizedDescription(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "localizedDescription");
}

id objc_msgSend_longValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "longValue");
}

id objc_msgSend_mac_addr(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mac_addr");
}

id objc_msgSend_messaging_protocol_version(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "messaging_protocol_version");
}

id objc_msgSend_migrateContentsOnDisk(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "migrateContentsOnDisk");
}

id objc_msgSend_minusSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "minusSet:");
}

id objc_msgSend_mutableCopy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "mutableCopy");
}

id objc_msgSend_name(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "name");
}

id objc_msgSend_needsConnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "needsConnect");
}

id objc_msgSend_negotiateTls(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "negotiateTls");
}

id objc_msgSend_notification(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notification");
}

id objc_msgSend_notification_port(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "notification_port");
}

id objc_msgSend_numberWithUnsignedInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithUnsignedInt:");
}

id objc_msgSend_nw_browser(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "nw_browser");
}

id objc_msgSend_objectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndex:");
}

id objc_msgSend_objectAtIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectAtIndexedSubscript:");
}

id objc_msgSend_objectForKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "objectForKeyedSubscript:");
}

id objc_msgSend_peerconn(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "peerconn");
}

id objc_msgSend_pollConnect_onQueue_withLog_completion_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "pollConnect:onQueue:withLog:completion:");
}

id objc_msgSend_port(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "port");
}

id objc_msgSend_prefDomain(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "prefDomain");
}

id objc_msgSend_properties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "properties");
}

id objc_msgSend_public_properties(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "public_properties");
}

id objc_msgSend_queue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "queue");
}

id objc_msgSend_refreshServiceListeners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "refreshServiceListeners");
}

id objc_msgSend_remoteUUID(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remoteUUID");
}

id objc_msgSend_remote_address(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "remote_address");
}

id objc_msgSend_removeAllObjects(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeAllObjects");
}

id objc_msgSend_removeObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObject:");
}

id objc_msgSend_removeObjectAtIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectAtIndex:");
}

id objc_msgSend_removeObjectForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "removeObjectForKey:");
}

id objc_msgSend_replacePeerConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replacePeerConnection:");
}

id objc_msgSend_replacePeerSocket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "replacePeerSocket:");
}

id objc_msgSend_reset(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "reset");
}

id objc_msgSend_scanHexLongLong_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scanHexLongLong:");
}

id objc_msgSend_scannerWithString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "scannerWithString:");
}

id objc_msgSend_serverReplacePeerSocket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serverReplacePeerSocket:");
}

id objc_msgSend_server_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "server_listener");
}

id objc_msgSend_service(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service");
}

id objc_msgSend_serviceWithName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "serviceWithName:");
}

id objc_msgSend_service_listener(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service_listener");
}

id objc_msgSend_service_listeners(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "service_listeners");
}

id objc_msgSend_services(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "services");
}

id objc_msgSend_setAddress_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddress:");
}

id objc_msgSend_setAddress_endpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddress_endpoint:");
}

id objc_msgSend_setAddressed_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setAddressed_callback:");
}

id objc_msgSend_setBackendProperty_withBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackendProperty:withBool:");
}

id objc_msgSend_setBackendProperty_withString_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackendProperty:withString:");
}

id objc_msgSend_setBackendProperty_withUint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBackendProperty:withUint:");
}

id objc_msgSend_setBonjour_endpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBonjour_endpoint:");
}

id objc_msgSend_setBrowser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrowser:");
}

id objc_msgSend_setBrowser_tx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setBrowser_tx:");
}

id objc_msgSend_setCanceled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setCanceled:");
}

id objc_msgSend_setClient_connection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClient_connection:");
}

id objc_msgSend_setClient_endpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setClient_endpoint:");
}

id objc_msgSend_setConnect_timeout_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnect_timeout:");
}

id objc_msgSend_setConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setConnection:");
}

id objc_msgSend_setControl_peer_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setControl_peer:");
}

id objc_msgSend_setDetached_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDetached_callback:");
}

id objc_msgSend_setDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice:");
}

id objc_msgSend_setDevice_alias_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice_alias:");
}

id objc_msgSend_setDevice_id_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice_id:");
}

id objc_msgSend_setDevice_listener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice_listener:");
}

id objc_msgSend_setDevice_peers_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDevice_peers:");
}

id objc_msgSend_setDontRestartBrowse_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setDontRestartBrowse:");
}

id objc_msgSend_setEndpoint_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndpoint:");
}

id objc_msgSend_setEndpoint_tx_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEndpoint_tx:");
}

id objc_msgSend_setEntitlement_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setEntitlement:");
}

id objc_msgSend_setExposePolicy_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setExposePolicy:");
}

id objc_msgSend_setHeartbeat_requests_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeartbeat_requests:");
}

id objc_msgSend_setHeartbeat_sequence_number_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHeartbeat_sequence_number:");
}

id objc_msgSend_setIf_index_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIf_index:");
}

id objc_msgSend_setIf_name_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIf_name:");
}

id objc_msgSend_setInactive_callback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInactive_callback:");
}

id objc_msgSend_setIndex_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIndex:");
}

id objc_msgSend_setInterface_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setInterface:");
}

id objc_msgSend_setIs_exposed_to_untrusted_devices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIs_exposed_to_untrusted_devices:");
}

id objc_msgSend_setIs_exposed_to_untrusted_devices_internal_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIs_exposed_to_untrusted_devices_internal:");
}

id objc_msgSend_setIs_exposed_to_untrusted_devices_presetup_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIs_exposed_to_untrusted_devices_presetup:");
}

id objc_msgSend_setIs_private_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setIs_private:");
}

id objc_msgSend_setLatestConnectError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLatestConnectError:");
}

id objc_msgSend_setLegacy_port_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLegacy_port:");
}

id objc_msgSend_setLimit_load_from_device_types_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLimit_load_from_device_types:");
}

id objc_msgSend_setLimit_load_to_device_types_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setLimit_load_to_device_types:");
}

id objc_msgSend_setMac_addr_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMac_addr:");
}

id objc_msgSend_setMessaging_protocol_version_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMessaging_protocol_version:");
}

id objc_msgSend_setName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setName:");
}

id objc_msgSend_setNotification_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotification:");
}

id objc_msgSend_setNotification_port_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNotification_port:");
}

id objc_msgSend_setNw_browser_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setNw_browser:");
}

id objc_msgSend_setObject_atIndexedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:atIndexedSubscript:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_setPeerconn_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPeerconn:");
}

id objc_msgSend_setPort_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPort:");
}

id objc_msgSend_setProperties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setProperties:");
}

id objc_msgSend_setPublic_properties_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPublic_properties:");
}

id objc_msgSend_setQueue_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setQueue:");
}

id objc_msgSend_setServer_listener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServer_listener:");
}

id objc_msgSend_setService_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService:");
}

id objc_msgSend_setService_listener_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService_listener:");
}

id objc_msgSend_setService_listeners_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setService_listeners:");
}

id objc_msgSend_setServices_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServices:");
}

id objc_msgSend_setSocket_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSocket:");
}

id objc_msgSend_setSocket_source_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSocket_source:");
}

id objc_msgSend_setState_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setState:");
}

id objc_msgSend_setSuspended_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setSuspended:");
}

id objc_msgSend_setTlsEnabled_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setTlsEnabled:");
}

id objc_msgSend_setToken_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setToken:");
}

id objc_msgSend_setType_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setType:");
}

id objc_msgSend_setUuid_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setUuid:");
}

id objc_msgSend_setValue_forKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setValue:forKey:");
}

id objc_msgSend_setWithArray_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithArray:");
}

id objc_msgSend_setWithSet_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setWithSet:");
}

id objc_msgSend_setupConnectionTimer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setupConnectionTimer");
}

id objc_msgSend_sha256(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sha256");
}

id objc_msgSend_shouldBeExposedToDevice_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shouldBeExposedToDevice:");
}

id objc_msgSend_socket(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "socket");
}

id objc_msgSend_socket_source(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "socket_source");
}

id objc_msgSend_startBrowsing_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "startBrowsing:");
}

id objc_msgSend_state(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "state");
}

id objc_msgSend_stringWithCString_encoding_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithCString:encoding:");
}

id objc_msgSend_stringWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithFormat:");
}

id objc_msgSend_stringWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stringWithUTF8String:");
}

id objc_msgSend_synchronize(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "synchronize");
}

id objc_msgSend_timesyncWithCallback_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "timesyncWithCallback:");
}

id objc_msgSend_tlsEnabled(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlsEnabled");
}

id objc_msgSend_tlsOidsPopulatedOnPeer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlsOidsPopulatedOnPeer");
}

id objc_msgSend_tlsOidsRequiredOfPeer(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlsOidsRequiredOfPeer");
}

id objc_msgSend_tlsRequirement(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "tlsRequirement");
}

id objc_msgSend_token(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "token");
}

id objc_msgSend_triggerNeedsConnect(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "triggerNeedsConnect");
}

id objc_msgSend_type(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "type");
}

id objc_msgSend_unsignedIntValue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "unsignedIntValue");
}

id objc_msgSend_updateWithDescription_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "updateWithDescription:");
}

id objc_msgSend_uuid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuid");
}

id objc_msgSend_uuidString(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "uuidString");
}

id objc_msgSend_valueForKey_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "valueForKey:");
}
