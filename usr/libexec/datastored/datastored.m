void sub_100000830(uint64_t a1)
{
  os_unfair_lock_s *v2;

  v2 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  sub_10000086C(a1);
  os_unfair_lock_unlock(v2);
  sub_100000958((_QWORD *)a1);
}

void sub_10000086C(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;
  void *v4;
  id v5;
  xpc_object_t v6;
  void *v7;
  _QWORD v8[4];
  id v9;
  uint64_t v10;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v2, "ds_data_invalid", 1);
  v3 = (void *)qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG))
    sub_1000027F4(a1, v3);
  v4 = *(void **)(a1 + 56);
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100001E2C;
  v8[3] = &unk_100004450;
  v5 = v2;
  v9 = v5;
  v10 = a1;
  if (!xpc_array_apply(v4, v8))
    sub_1000027E0();
  v6 = xpc_array_create(0, 0);
  v7 = *(void **)(a1 + 56);
  *(_QWORD *)(a1 + 56) = v6;

}

void sub_100000958(_QWORD *a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  _QWORD *v9;

  if (a1)
  {
    v2 = qword_100008028;
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
    {
      v8 = 136315138;
      v9 = a1 + 13;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[%s] Freeing up datastore object", (uint8_t *)&v8, 0xCu);
    }
    v3 = (void *)a1[5];
    if (v3)
    {
      if (a1[10] == 1)
        free(v3);
      else
        munmap(v3, a1[6]);
    }
    v4 = (void *)a1[12];
    if (v4)
      free(v4);
    v5 = (void *)a1[7];
    a1[7] = 0;

    v6 = (void *)a1[2];
    a1[2] = 0;

    v7 = (void *)a1[3];
    a1[3] = 0;

    free(a1);
  }
}

void sub_100000A58(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 8);
  *(_QWORD *)(a1 + 8) = 0;

}

void sub_100000A64(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *string;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  xpc_object_t reply;
  xpc_endpoint_t v12;
  int v13;
  const char *v14;

  v3 = a1;
  v4 = a2;
  string = xpc_dictionary_get_string(v3, "ds_name");
  v6 = sub_100000C50((uint64_t)string);
  v7 = qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
  {
    v13 = 136315138;
    v14 = string;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%s] Initial subscriber handshake ", (uint8_t *)&v13, 0xCu);
  }
  if (v6)
  {
    if (*(_QWORD *)(v6 + 96))
    {
      v8 = (void *)xpc_connection_copy_entitlement_value(v4);
      v9 = v8;
      if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v9))
      {
        v10 = 0;
      }
      else
      {
        if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
          sub_1000028FC();
        v10 = 1;
      }

    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
      sub_10000289C();
    v10 = 22;
  }
  reply = xpc_dictionary_create_reply(v3);
  xpc_dictionary_set_uint64(reply, "ds_status", v10);
  if (!v10)
  {
    xpc_dictionary_set_uint64(reply, "ds_type", *(_QWORD *)(v6 + 80));
    v12 = xpc_endpoint_create(*(xpc_connection_t *)(v6 + 16));
    xpc_dictionary_set_value(reply, "endpoint", v12);

  }
  xpc_dictionary_send_reply(reply);

}

uint64_t sub_100000C50(uint64_t a1)
{
  uint64_t pointer;

  os_unfair_lock_lock((os_unfair_lock_t)&dword_100008018);
  pointer = xpc_dictionary_get_pointer(qword_100008020, a1);
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_100008018);
  return pointer;
}

void sub_100000C98(void *a1, void *a2)
{
  id v3;
  id v4;
  const char *string;
  uint64_t v6;
  NSObject *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  xpc_object_t reply;
  xpc_endpoint_t v12;
  NSObject *v13;
  int v14;
  const char *v15;

  v3 = a2;
  v4 = a1;
  string = xpc_dictionary_get_string(v4, "ds_name");
  v6 = sub_100000C50((uint64_t)string);
  v7 = qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
  {
    v14 = 136315138;
    v15 = string;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%s] Publisher registering for datastore", (uint8_t *)&v14, 0xCu);
  }
  if (v6)
  {
    v8 = (void *)xpc_connection_copy_entitlement_value(v3);
    v9 = v8;
    if (v8 && xpc_get_type(v8) == (xpc_type_t)&_xpc_type_BOOL && xpc_BOOL_get_value(v9))
    {
      v10 = 0;
    }
    else
    {
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
        sub_100002A1C();
      v10 = 1;
    }
    if ((*(_BYTE *)(v6 + 64) & 1) != 0)
    {
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
        sub_1000029BC();
      v10 = 37;
    }

  }
  else
  {
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
      sub_10000295C();
    v10 = 22;
  }
  reply = xpc_dictionary_create_reply(v4);

  xpc_dictionary_set_uint64(reply, "ds_status", v10);
  if (!v10)
  {
    *(_BYTE *)(v6 + 64) |= 1u;
    xpc_dictionary_set_uint64(reply, "ds_type", *(_QWORD *)(v6 + 80));
    xpc_dictionary_set_uint64(reply, "max_size", *(_QWORD *)(v6 + 88));
    v12 = xpc_endpoint_create(*(xpc_connection_t *)(v6 + 24));
    xpc_dictionary_set_value(reply, "endpoint", v12);

    v13 = qword_100008028;
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
    {
      v14 = 136315138;
      v15 = (const char *)(v6 + 104);
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "[%s] Invalidating data from producer's previous lifetime", (uint8_t *)&v14, 0xCu);
    }
    sub_100000F28(v6);
  }
  xpc_dictionary_send_reply(reply);

}

void sub_100000F28(uint64_t a1)
{
  os_unfair_lock_s *v2;
  unint64_t *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[5];

  v2 = (os_unfair_lock_s *)(a1 + 32);
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  v3 = (unint64_t *)(a1 + 40);
  do
    v4 = (void *)__ldxr(v3);
  while (__stxr(0, v3));
  if (v4)
  {
    if (*(_QWORD *)(a1 + 80) == 1)
      free(v4);
    else
      munmap(v4, *(_QWORD *)(a1 + 48));
    *(_QWORD *)(a1 + 48) = 0;
    sub_10000086C(a1);
  }
  os_unfair_lock_unlock(v2);
  v5 = *(NSObject **)(a1 + 8);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100001F48;
  block[3] = &unk_100004470;
  block[4] = a1;
  dispatch_async(v5, block);
}

void sub_100000FD8(void *a1, _QWORD *a2)
{
  id v3;
  const void *v4;
  uint64_t v5;
  void *readonly;
  xpc_object_t xdict;

  v3 = a1;
  v4 = (const void *)a2[5];
  xdict = v3;
  if (v4)
  {
    if (a2[10] == 1)
    {
      xpc_dictionary_set_data(v3, "ds_data", v4, a2[6]);
    }
    else
    {
      readonly = (void *)xpc_shmem_create_readonly(v4, a2[6]);
      xpc_dictionary_set_value(xdict, "ds_ool_data", readonly);

    }
    xpc_dictionary_set_uint64(xdict, "ds_type", a2[10]);
    v5 = 0;
    v3 = xdict;
  }
  else
  {
    v5 = 96;
  }
  xpc_dictionary_set_uint64(v3, "ds_status", v5);

}

id sub_100001088(uint64_t a1)
{
  xpc_object_t v2;
  void *v3;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v2, "ds_name", (const char *)(a1 + 104));
  v3 = (void *)xpc_event_publisher_fire_with_reply_sync(qword_100008008, *(_QWORD *)(a1 + 72), v2);

  return v3;
}

void sub_1000010E8(uint64_t a1)
{
  NSObject *v2;
  id v3;
  void *v4;
  id v5;
  void *v6;
  const void *data;
  void *v8;
  xpc_object_t value;
  void *v10;
  NSObject *v11;
  void *region;
  uint8_t buf[4];
  uint64_t v14;

  dispatch_assert_queue_V2(*(dispatch_queue_t *)(a1 + 8));
  if (!*(_QWORD *)(a1 + 40))
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
    v2 = qword_100008028;
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      v14 = a1 + 104;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "[%s] Requesting data from producer", buf, 0xCu);
    }
    v3 = sub_100001088(a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
    if (!v4 || xpc_get_type(v4) == (xpc_type_t)&_xpc_type_error)
    {
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
        sub_100002A90();
    }
    else
    {
      v5 = v4;
      if ((*(_BYTE *)(a1 + 64) & 1) == 0)
        sub_1000027E0();
      v4 = v5;
      if (xpc_dictionary_get_uint64(v5, "request_type") != 5)
        sub_1000027E0();
      region = 0;
      v6 = *(void **)(a1 + 40);
      if (*(_QWORD *)(a1 + 80) == 1)
      {
        free(v6);
        data = xpc_dictionary_get_data(v4, "ds_data", (size_t *)(a1 + 48));
        v8 = malloc_type_malloc(*(_QWORD *)(a1 + 48), 0x857ABE1DuLL);
        region = v8;
        memcpy(v8, data, *(_QWORD *)(a1 + 48));
      }
      else
      {
        munmap(v6, *(_QWORD *)(a1 + 48));
        value = xpc_dictionary_get_value(v4, "ds_ool_data");
        v10 = (void *)objc_claimAutoreleasedReturnValue(value);
        *(_QWORD *)(a1 + 48) = xpc_shmem_map(v10, &region);

        v8 = region;
      }
      *(_QWORD *)(a1 + 40) = v8;
      v11 = qword_100008028;
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v14 = a1 + 104;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "[%s] Populated with data", buf, 0xCu);
      }

    }
  }
}

void sub_10000131C(void *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t uint64;

  v3 = a1;
  v4 = a2;
  uint64 = xpc_dictionary_get_uint64(v3, "request_type");
  if (uint64 == 6)
  {
    sub_100000C98(v3, v4);
  }
  else if (uint64 == 1)
  {
    sub_100000A64(v3, v4);
  }
  else if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
  {
    sub_100002AF4();
  }

}

void sub_1000013C4(uint64_t a1)
{
  void *v2;

  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG))
    sub_100002E04();
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG))
    sub_100002D88();
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG))
    sub_100002D0C();
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG))
    sub_100002CA8();
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG))
    sub_100002C44();
  v2 = (void *)qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG))
    sub_100002BB8(a1, v2);
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG))
    sub_100002B54();
}

void sub_1000014E8()
{
  NSObject *v0;
  NSObject *v1;
  uint8_t v2[16];
  uint8_t buf[16];

  v0 = qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_INFO, "Printing out registered datastores...\n", buf, 2u);
  }
  xpc_dictionary_apply((xpc_object_t)qword_100008020, &stru_1000043A0);
  v1 = qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v2 = 0;
    _os_log_impl((void *)&_mh_execute_header, v1, OS_LOG_TYPE_INFO, "Done", v2, 2u);
  }
}

BOOL sub_10000159C(id a1, const char *a2, OS_xpc_object *a3)
{
  OS_xpc_object *v3;
  uint64_t value;

  v3 = a3;
  if (xpc_get_type(v3) != (xpc_type_t)&_xpc_type_pointer)
    sub_1000027E0();
  value = xpc_pointer_get_value(v3);
  sub_1000013C4(value);

  return 1;
}

void start()
{
  xpc_object_t v0;
  void *v1;
  os_log_t v2;
  void *v3;
  dispatch_workloop_t v4;
  _xpc_connection_s *mach_service;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  _QWORD handler[5];

  dword_100008018 = 0;
  v0 = xpc_dictionary_create(0, 0, 0);
  v1 = (void *)qword_100008020;
  qword_100008020 = (uint64_t)v0;

  v2 = os_log_create("com.apple.xpc.datastore", "datastored");
  v3 = (void *)qword_100008028;
  qword_100008028 = (uint64_t)v2;

  v4 = dispatch_workloop_create("com.apple.datastored.ipc_wl");
  mach_service = xpc_connection_create_mach_service("com.apple.xpc.datastore", 0, 1uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_100001748;
  handler[3] = &unk_1000043C8;
  v6 = v4;
  handler[4] = v6;
  xpc_connection_set_event_handler(mach_service, handler);
  objc_storeStrong(&qword_100008010, mach_service);
  objc_storeStrong((id *)&qword_100008000, v4);
  v7 = xpc_event_publisher_create("com.apple.xpc.datastores.publish", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100001888;
  v9[3] = &unk_1000043E8;
  v9[4] = &qword_100008000;
  xpc_event_publisher_set_handler(v8, v9);
  xpc_event_publisher_set_error_handler(v8, &stru_100004428);
  objc_storeStrong((id *)&qword_100008008, v8);
  xpc_event_publisher_activate(v8);
  signal(30, (void (__cdecl *)(int))sub_1000014E8);
  dispatch_main();
}

void sub_100001748(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD handler[4];
  id v6;

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_1000017F0;
    handler[3] = &unk_1000043C8;
    v4 = v3;
    v6 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
    xpc_connection_set_target_queue((xpc_connection_t)v4, *(dispatch_queue_t *)(a1 + 32));
    xpc_connection_resume((xpc_connection_t)v4);

  }
}

void sub_1000017F0(uint64_t a1, void *a2)
{
  xpc_type_t type;
  xpc_object_t object;

  object = a2;
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    sub_10000131C(object, *(void **)(a1 + 32));

  }
  else
  {
    type = xpc_get_type(object);

    if (type == (xpc_type_t)&_xpc_type_error)
      xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
}

void sub_100001888(uint64_t a1, int a2, uint64_t a3, void *a4)
{
  id v7;
  char event_name;
  NSObject *v9;
  id v10;
  size_t v11;
  void *v12;
  void **v13;
  id v14;
  int64_t int64;
  const char *string;
  xpc_object_t v17;
  void *v18;
  NSObject *v19;
  void *v20;
  NSObject *v21;
  void *v22;
  NSObject *v23;
  _xpc_connection_s *v24;
  void *v25;
  _xpc_connection_s *v26;
  _xpc_connection_s *v27;
  void *v28;
  _xpc_connection_s *v29;
  uint64_t pointer;
  uint64_t v31;
  NSObject *v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  char *label;
  char __s[16];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 handler;
  void (*v52)(uint64_t, void *);
  void *v53;
  void **v54;
  __int128 buf;
  uint64_t v56;
  void *v57;
  void **v58;

  v7 = a4;
  switch(a2)
  {
    case 2:
      xpc_connection_resume(*(xpc_connection_t *)(*(_QWORD *)(a1 + 32) + 16));
      break;
    case 1:
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v56 = 0x2020000000;
      v57 = 0;
      os_unfair_lock_lock((os_unfair_lock_t)&dword_100008018);
      *(_QWORD *)__s = _NSConcreteStackBlock;
      *(_QWORD *)&__s[8] = 3221225472;
      *(_QWORD *)&v44 = sub_100002728;
      *((_QWORD *)&v44 + 1) = &unk_1000044E0;
      *(_QWORD *)&v45 = &buf;
      *((_QWORD *)&v45 + 1) = a3;
      xpc_dictionary_apply((xpc_object_t)qword_100008020, __s);
      v31 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
      if (v31)
      {
        v32 = qword_100008028;
        if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
        {
          LODWORD(handler) = 136315138;
          *(_QWORD *)((char *)&handler + 4) = v31 + 104;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_INFO, "[%s] Removing datastore from registered list", (uint8_t *)&handler, 0xCu);
          v31 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 24);
        }
        xpc_dictionary_set_value((xpc_object_t)qword_100008020, (const char *)(v31 + 104), 0);
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_100008018);
        sub_100001F80(*(_QWORD *)(*((_QWORD *)&buf + 1) + 24));
      }
      else
      {
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_100008018);
        v33 = qword_100008028;
        if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
          sub_100002F28(a3, v33, v34, v35, v36, v37, v38, v39);
      }
      _Block_object_dispose(&buf, 8);
      break;
    case 0:
      v49 = 0u;
      v50 = 0u;
      v47 = 0u;
      v48 = 0u;
      v45 = 0u;
      v46 = 0u;
      *(_OWORD *)__s = 0u;
      v44 = 0u;
      event_name = xpc_get_event_name("com.apple.xpc.datastores.publish", a3, __s);
      v9 = qword_100008028;
      if ((event_name & 1) != 0)
      {
        if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
        {
          LODWORD(buf) = 136315138;
          *(_QWORD *)((char *)&buf + 4) = __s;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "[%s] Adding info for datastore", (uint8_t *)&buf, 0xCu);
        }
        v10 = v7;
        v11 = strlen(__s);
        v12 = malloc_type_calloc(1uLL, v11 + 105, 0xBE055987uLL);
        v13 = (void **)v12;
        if (v12)
        {
          strcpy((char *)v12 + 104, __s);
          v14 = v10;
          v13[9] = (void *)a3;
          int64 = xpc_dictionary_get_int64(v14, "SizeLimit");
          v13[11] = (void *)int64;
          if (int64)
          {
            v13[10] = (void *)1;
            string = xpc_dictionary_get_string(v14, "RequiresEntitlement");
            if (string)
              v13[12] = strdup(string);
            *((_DWORD *)v13 + 8) = 0;
            v17 = xpc_array_create(0, 0);
            v18 = v13[7];
            v13[7] = v17;

            *((_BYTE *)v13 + 64) &= ~1u;
            label = 0;
            asprintf(&label, "%s.ipc_dq", (const char *)v13 + 104);
            v19 = dispatch_queue_create_with_target_V2(label, 0, (dispatch_queue_t)qword_100008000);
            dispatch_set_finalizer_f(v19, (dispatch_function_t)sub_100000A58);
            dispatch_set_context(v19, v13);
            v20 = *v13;
            *v13 = v19;
            v41 = v19;

            free(label);
            asprintf(&label, "%s.launch_pub_dq", (const char *)v13 + 104);
            v21 = dispatch_queue_create(label, 0);
            dispatch_set_finalizer_f(v21, (dispatch_function_t)sub_100000830);
            dispatch_set_context(v21, v13);
            v22 = v13[1];
            v13[1] = v21;
            v23 = v21;

            free(label);
            v24 = xpc_connection_create(0, 0);
            *(_QWORD *)&buf = _NSConcreteStackBlock;
            *((_QWORD *)&buf + 1) = 3221225472;
            v56 = (uint64_t)sub_100001FC8;
            v57 = &unk_100004490;
            v58 = v13;
            xpc_connection_set_event_handler(v24, &buf);
            v25 = v13[2];
            v13[2] = v24;
            v26 = v24;

            xpc_connection_activate(v26);
            v27 = xpc_connection_create(0, 0);
            *(_QWORD *)&handler = _NSConcreteStackBlock;
            *((_QWORD *)&handler + 1) = 3221225472;
            v52 = sub_100002394;
            v53 = &unk_100004490;
            v54 = v13;
            xpc_connection_set_event_handler(v27, &handler);
            v28 = v13[3];
            v13[3] = v27;
            v29 = v27;

            xpc_connection_activate(v29);
            os_unfair_lock_lock((os_unfair_lock_t)&dword_100008018);
            pointer = xpc_dictionary_get_pointer(qword_100008020, __s);
            if (pointer)
            {
              xpc_dictionary_set_pointer(qword_100008020, __s, 0);
              sub_100001F80(pointer);
              sub_100000958(v13);
              if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
                sub_100002E68();
            }
            else
            {
              xpc_dictionary_set_pointer(qword_100008020, __s, v13);
            }
            os_unfair_lock_unlock((os_unfair_lock_t)&dword_100008018);
            goto LABEL_28;
          }
        }
        else
        {
          v40 = v10;
        }

LABEL_28:
        break;
      }
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
        sub_100002EC8();
      break;
  }

}

void sub_100001DC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 160), 8);
  _Unwind_Resume(a1);
}

void sub_100001DE8(id a1, int a2)
{
  NSObject *v3;

  v3 = qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
    sub_100002FA0(a2, v3);
}

uint64_t sub_100001E2C(uint64_t a1, uint64_t a2, uint64_t a3)
{
  mach_port_name_t v4;
  mach_port_name_t v5;
  void *v6;
  int v7;
  int v8;
  NSObject *v9;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  mach_port_name_t v15;
  __int16 v16;
  int v17;

  v4 = xpc_mach_send_copy_right(a3);
  if (v4 - 1 <= 0xFFFFFFFD)
  {
    v5 = v4;
    v6 = (void *)xpc_pipe_create_from_port();
    v7 = xpc_pipe_simpleroutine(v6, *(_QWORD *)(a1 + 32));
    if (v7)
    {
      v8 = v7;
      v9 = qword_100008028;
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
      {
        v11 = *(_QWORD *)(a1 + 40) + 104;
        v12 = 136315650;
        v13 = v11;
        v14 = 1024;
        v15 = v5;
        v16 = 1024;
        v17 = v8;
        _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "[%s] Unable to send invalidation to client %#x: %d", (uint8_t *)&v12, 0x18u);
      }
    }
    mach_port_deallocate(mach_task_self_, v5);

  }
  return 1;
}

void sub_100001F48(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
  sub_1000010E8(*(_QWORD *)(a1 + 32));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 32));
}

void sub_100001F80(uint64_t a1)
{
  void *v2;

  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 16));
  xpc_connection_cancel(*(xpc_connection_t *)(a1 + 24));
  os_unfair_lock_lock((os_unfair_lock_t)(a1 + 32));
  v2 = *(void **)a1;
  *(_QWORD *)a1 = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 32));
}

void sub_100001FC8(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  _QWORD handler[4];
  id v6;

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100002074;
    handler[3] = &unk_1000043C8;
    v4 = v3;
    v6 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
    xpc_connection_set_target_queue((xpc_connection_t)v4, **(dispatch_queue_t **)(a1 + 32));
    xpc_connection_activate((xpc_connection_t)v4);

  }
}

void sub_100002074(uint64_t a1, void *a2)
{
  id v3;
  uint64_t uint64;
  void *v5;
  int v6;
  NSObject *v7;

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64 = xpc_dictionary_get_uint64(v3, "request_type");
    if (uint64 == 3)
    {
      v5 = v3;
      v6 = 1;
      goto LABEL_6;
    }
    if (uint64 == 2)
    {
      v5 = v3;
      v6 = 0;
LABEL_6:
      sub_100002120(v5, v6);
      goto LABEL_10;
    }
    v7 = qword_100008028;
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
      sub_100003014(v7);
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
  }
LABEL_10:

}

void sub_100002120(void *a1, int a2)
{
  id v3;
  xpc_object_t reply;
  const char *string;
  uint64_t v6;
  NSObject *v7;
  xpc_object_t value;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  const char *v17;

  v3 = a1;
  reply = xpc_dictionary_create_reply(v3);
  string = xpc_dictionary_get_string(v3, "ds_name");
  v6 = sub_100000C50((uint64_t)string);
  v7 = qword_100008028;
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315138;
    v17 = string;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "[%s] Requesting datastore data", buf, 0xCu);
  }
  if (v6)
  {
    value = xpc_dictionary_get_value(v3, "ds_data_invalid_notify");
    v9 = (void *)objc_claimAutoreleasedReturnValue(value);
    if (*(_QWORD *)(v6 + 40))
    {
      os_unfair_lock_lock((os_unfair_lock_t)(v6 + 32));
      sub_100000FD8(reply, (_QWORD *)v6);
      xpc_array_append_value(*(xpc_object_t *)(v6 + 56), v9);
      os_unfair_lock_unlock((os_unfair_lock_t)(v6 + 32));
    }
    else
    {
      v10 = qword_100008028;
      if (!a2)
      {
        if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_DEBUG))
          sub_1000030B4();
        v11 = *(_QWORD *)(v6 + 8);
        v12[0] = _NSConcreteStackBlock;
        v12[1] = 3221225472;
        v12[2] = sub_1000026D0;
        v12[3] = &unk_1000044B8;
        v15 = v6;
        v13 = reply;
        v14 = v9;
        xpc_dictionary_handoff_reply(v13, v11, v12);

        goto LABEL_14;
      }
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315138;
        v17 = string;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "[%s] Datastore not populated but soft demand request - returning ENODATA", buf, 0xCu);
      }
      xpc_dictionary_set_uint64(reply, "ds_status", 0x60uLL);
    }
    xpc_dictionary_send_reply(reply);
LABEL_14:

    goto LABEL_15;
  }
  if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
    sub_100003054();
  xpc_dictionary_set_uint64(reply, "ds_status", 0x16uLL);
  xpc_dictionary_send_reply(reply);
LABEL_15:

}

void sub_100002394(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  char *v5;
  _QWORD handler[4];
  id v7;

  v3 = a2;
  if (xpc_get_type(v3) == (xpc_type_t)&_xpc_type_connection)
  {
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_100002468;
    handler[3] = &unk_1000043C8;
    v4 = v3;
    v7 = v4;
    xpc_connection_set_event_handler((xpc_connection_t)v4, handler);
    xpc_connection_set_target_queue((xpc_connection_t)v4, **(dispatch_queue_t **)(a1 + 32));
    v5 = strdup((const char *)(*(_QWORD *)(a1 + 32) + 104));
    xpc_connection_set_context((xpc_connection_t)v4, v5);
    xpc_connection_set_finalizer_f((xpc_connection_t)v4, (xpc_finalizer_t)&_free);
    xpc_connection_activate((xpc_connection_t)v4);

  }
}

void sub_100002468(uint64_t a1, void *a2)
{
  id v3;
  xpc_type_t type;
  const char *context;
  NSObject *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t uint64;
  id v10;
  const char *string;
  NSObject *v12;
  xpc_object_t reply;
  uint64_t v14;
  uint64_t v15;
  int v16;
  const char *v17;

  v3 = a2;
  type = xpc_get_type(v3);
  if (type == (xpc_type_t)&_xpc_type_dictionary)
  {
    uint64 = xpc_dictionary_get_uint64(v3, "request_type");
    if (uint64 != 7)
    {
      if (uint64 == 4)
      {
        v10 = v3;
        string = xpc_dictionary_get_string(v10, "ds_name");
        v12 = qword_100008028;
        if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
        {
          v16 = 136315138;
          v17 = string;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "[%s] Invalidating data", (uint8_t *)&v16, 0xCu);
        }
        reply = xpc_dictionary_create_reply(v10);

        v14 = sub_100000C50((uint64_t)string);
        if (v14)
        {
          sub_100000F28(v14);
          v15 = 0;
        }
        else
        {
          v15 = 22;
        }
        xpc_dictionary_set_uint64(reply, "ds_status", v15);
        xpc_dictionary_send_reply(reply);

      }
      else if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
      {
        sub_100002AF4();
      }
    }
  }
  else if (type == (xpc_type_t)&_xpc_type_error)
  {
    context = (const char *)xpc_connection_get_context(*(xpc_connection_t *)(a1 + 32));
    v6 = qword_100008028;
    if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
    {
      v16 = 136315138;
      v17 = context;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_INFO, "[%s] Publisher gone - relinquishing datastore", (uint8_t *)&v16, 0xCu);
    }
    v7 = sub_100000C50((uint64_t)context);
    if (v7)
    {
      if ((*(_BYTE *)(v7 + 64) & 1) == 0)
        sub_1000027E0();
      *(_BYTE *)(v7 + 64) &= ~1u;
      v8 = qword_100008028;
      if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_INFO))
      {
        v16 = 136315138;
        v17 = context;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_INFO, "[%s] Clearing ownership of datastore", (uint8_t *)&v16, 0xCu);
      }
    }
    else if (os_log_type_enabled((os_log_t)qword_100008028, OS_LOG_TYPE_ERROR))
    {
      sub_100003114();
    }
  }

}

uint64_t sub_1000026D0(uint64_t a1)
{
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 32));
  sub_1000010E8(*(_QWORD *)(a1 + 48));
  sub_100000FD8(*(void **)(a1 + 32), *(_QWORD **)(a1 + 48));
  xpc_array_append_value(*(xpc_object_t *)(*(_QWORD *)(a1 + 48) + 56), *(xpc_object_t *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 48) + 32));
  return xpc_dictionary_send_reply(*(_QWORD *)(a1 + 32));
}

uint64_t sub_100002728(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t value;
  uint64_t v5;
  uint64_t result;

  value = xpc_pointer_get_value(a3);
  if (!value)
    return 1;
  v5 = value;
  if (*(_QWORD *)(value + 72) != *(_QWORD *)(a1 + 40))
    return 1;
  result = 0;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

void sub_10000277C(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002794(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

uint64_t sub_1000027BC()
{
  return _os_assert_log(0);
}

void sub_1000027C4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 0x16u);
}

size_t sub_1000027D4()
{
  void *v0;

  return xpc_array_get_count(v0);
}

void sub_1000027E0()
{
  uint64_t v0;

  v0 = sub_1000027BC();
  _os_crash(v0);
  __break(1u);
}

void sub_1000027F4(uint64_t a1, void *a2)
{
  NSObject *v2;
  uint64_t v3;
  id v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  size_t v8;

  v3 = a1 + 104;
  v4 = a2;
  v5 = 136315394;
  v6 = v3;
  v7 = 2048;
  v8 = sub_1000027D4();
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "[%s] Notifying %zu subscribers of data invalidation", (uint8_t *)&v5, 0x16u);

}

void sub_10000289C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027A4();
  sub_10000277C((void *)&_mh_execute_header, v0, v1, "[%s] No such datastore present", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_1000028FC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027A4();
  sub_10000277C((void *)&_mh_execute_header, v0, v1, "[%s] Client does not have valid entitlement to query datastore", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_10000295C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027A4();
  sub_10000277C((void *)&_mh_execute_header, v0, v1, "[%s] Rejected registration - datastore not statically declared", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_1000029BC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027A4();
  sub_10000277C((void *)&_mh_execute_header, v0, v1, "[%s] Rejecting registration since datastore has already been claimed", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002A1C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027A4();
  sub_1000027C4((void *)&_mh_execute_header, v0, v1, "[%s] Rejected registration - publisher doesn't have %s entitlement", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002A90()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027B0();
  sub_10000277C((void *)&_mh_execute_header, v0, v1, "[%s] Received no data from producer", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002AF4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027A4();
  sub_10000277C((void *)&_mh_execute_header, v0, v1, "Unknown request %llu, ignoring", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002B54()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027B0();
  sub_100002794((void *)&_mh_execute_header, v0, v1, "\tdata_size     = %zu\n", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002BB8(uint64_t a1, void *a2)
{
  NSObject *v2;
  id v3;
  uint8_t v4[24];

  v3 = a2;
  sub_1000027D4();
  sub_1000027A4();
  _os_log_debug_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEBUG, "\t#subscribers  = %zu", v4, 0xCu);

}

void sub_100002C44()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027B0();
  sub_100002794((void *)&_mh_execute_header, v0, v1, "\tentitlement   = %s", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002CA8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027B0();
  sub_100002794((void *)&_mh_execute_header, v0, v1, "\tmax_size      = %llu", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002D0C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027B0();
  sub_100002794((void *)&_mh_execute_header, v0, v1, "\tds_type       = %s", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002D88()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027B0();
  sub_100002794((void *)&_mh_execute_header, v0, v1, "\tchecked in    = %s", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002E04()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027B0();
  sub_100002794((void *)&_mh_execute_header, v0, v1, "datastore: %s", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002E68()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027A4();
  sub_10000277C((void *)&_mh_execute_header, v0, v1, "[%s] Datastore is being registered for twice - dropping both on the ground", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002EC8()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027A4();
  sub_10000277C((void *)&_mh_execute_header, v0, v1, "Failed for find datastore name for event token %#llx", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100002F28(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1000027C4((void *)&_mh_execute_header, a2, a3, "[%s] Could not find a datastore tracking the specified token = %#llx", a5, a6, a7, a8, 2u);
  sub_10000278C();
}

void sub_100002FA0(int a1, NSObject *a2)
{
  _DWORD v2[2];

  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "datastored received error %d\n", (uint8_t *)v2, 8u);
}

void sub_100003014(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Received unknown datastore request type on subscriber connection", v1, 2u);
}

void sub_100003054()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027A4();
  sub_10000277C((void *)&_mh_execute_header, v0, v1, "[%s] Datastore not present - returning EINVAL", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_1000030B4()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027A4();
  sub_100002794((void *)&_mh_execute_header, v0, v1, "[%s] Datastore not populated, handing off to slow queue", v2, v3, v4, v5, v6);
  sub_10000278C();
}

void sub_100003114()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1000027A4();
  sub_10000277C((void *)&_mh_execute_header, v0, v1, "[%s] Could not find datastore", v2, v3, v4, v5, v6);
  sub_10000278C();
}
