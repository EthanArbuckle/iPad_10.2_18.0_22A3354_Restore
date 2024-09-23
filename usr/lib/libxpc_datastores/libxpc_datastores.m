id _xpc_datastores_service_connection()
{
  if (qword_2554D8AF0 != -1)
    dispatch_once(&qword_2554D8AF0, &unk_24E44EDC8);
  return (id)qword_2554D8AF8;
}

void sub_21F639F00()
{
  xpc_connection_t mach_service;
  void *v1;

  mach_service = xpc_connection_create_mach_service("com.apple.xpc.datastore", 0, 0);
  v1 = (void *)qword_2554D8AF8;
  qword_2554D8AF8 = (uint64_t)mach_service;

  xpc_connection_set_event_handler((xpc_connection_t)qword_2554D8AF8, &unk_24E44EE08);
  xpc_connection_activate((xpc_connection_t)qword_2554D8AF8);
}

void sub_21F639F50(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  void *v5;

  v3 = MEMORY[0x2207CB110](a2);
  if (a2 == MEMORY[0x24BDACF38] && v3 == MEMORY[0x24BDACFB8])
  {
    v5 = (void *)qword_2554D8AF8;
    qword_2554D8AF8 = 0;

  }
}

id _xdo_fetch_ds_data_req_serialize(const char *a1, uint64_t a2, uint64_t a3)
{
  xpc_object_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = xpc_dictionary_create(0, 0, 0);
  v6 = v5;
  if (a3 == 1)
    v7 = 3;
  else
    v7 = 2;
  xpc_dictionary_set_uint64(v5, "request_type", v7);
  xpc_dictionary_set_string(v6, "ds_name", a1);
  v8 = (void *)xpc_mach_send_create();
  xpc_dictionary_set_value(v6, "ds_data_invalid_notify", v8);

  return v6;
}

uint64_t _xdo_fetch_ds_data_resp_deserialize(void *a1, void *a2)
{
  id v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  uint64_t uint64;
  uint64_t v7;
  OS_xds_local_cache *v8;
  OS_xds_local_cache *v9;
  const void *data;
  void *v11;
  os_unfair_lock_s *v12;
  void *v13;
  void *v14;
  size_t v15;
  os_unfair_lock_s *v16;
  OS_xds_local_cache *v17;
  void *v18;
  size_t length;

  v3 = a1;
  v4 = a2;
  if (!v4)
    sub_21F63B430();
  if (!v3)
    sub_21F63B430();
  v5 = v4;
  if (MEMORY[0x2207CB110](v3) == MEMORY[0x24BDACFB8])
  {
    uint64 = 96;
    goto LABEL_9;
  }
  uint64 = xpc_dictionary_get_uint64(v3, "ds_status");
  if ((_DWORD)uint64)
  {
LABEL_9:
    v12 = v5;
    os_unfair_lock_lock_with_options();
    v13 = *(void **)&v12[10]._os_unfair_lock_opaque;
    *(_QWORD *)&v12[10]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v5 + 8);
    goto LABEL_12;
  }
  v7 = *(_QWORD *)&v5[2]._os_unfair_lock_opaque;
  if (v7 != xpc_dictionary_get_uint64(v3, "ds_type"))
    sub_21F63B430();
  v8 = objc_alloc_init(OS_xds_local_cache);
  v9 = v8;
  if (v7 == 1)
  {
    v8->ds_type = 1;
    length = 0;
    data = xpc_dictionary_get_data(v3, "ds_data", &length);
    v11 = malloc_type_malloc(length, 0x6938E89FuLL);
    v9->data = v11;
    memcpy(v11, data, length);
    v9->size = length;
  }
  else
  {
    v8->ds_type = 2;
    xpc_dictionary_get_value(v3, "ds_ool_data");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    length = 0;
    v15 = xpc_shmem_map(v14, (void **)&length);
    v9->data = (void *)length;
    v9->size = v15;

  }
  v16 = v5;
  v17 = v9;
  os_unfair_lock_lock_with_options();
  v18 = *(void **)&v16[10]._os_unfair_lock_opaque;
  *(_QWORD *)&v16[10]._os_unfair_lock_opaque = v17;

  os_unfair_lock_unlock(v5 + 8);
  uint64 = 0;
LABEL_12:

  return uint64;
}

uint64_t xpc_datastore_copy_state(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x24BEDD108](a1, sel_copyCurrentStateWithReqType_, a2);
}

id _xpc_datastore_publisher_alloc(uint64_t a1)
{
  OS_xpc_datastore_publisher *v2;
  const char *v3;

  v2 = [OS_xpc_datastore_publisher alloc];
  return (id)objc_msgSend_initWithName_(v2, v3, a1);
}

id _xpc_datastore_publisher_create_suspended(const char *a1)
{
  char *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_xpc_datastore_publisher *v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  char *v11;

  v11 = 0;
  if (asprintf(&v11, "%s.pending_work_dq", a1) < 0)
    return 0;
  v2 = v11;
  dispatch_queue_attr_make_initially_inactive(0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create(v2, v3);

  v5 = [OS_xpc_datastore_publisher alloc];
  v7 = objc_msgSend_initWithName_(v5, v6, (uint64_t)a1);
  objc_storeStrong((id *)(v7 + 64), v4);
  v8 = *(void **)(v7 + 56);
  *(_QWORD *)(v7 + 56) = v4;
  v9 = v4;

  free(v11);
  return (id)v7;
}

void _xpc_datastore_publisher_resume(void *a1)
{
  id v1;
  char v2;
  dispatch_queue_t *v3;
  NSObject *v4;
  dispatch_queue_t *v5;

  v1 = a1;
  v2 = *((_BYTE *)v1 + 80);
  if ((v2 & 1) != 0)
    sub_21F63B430();
  v3 = (dispatch_queue_t *)v1;
  v4 = *((_QWORD *)v1 + 7);
  if (v4)
  {
    v5 = v3;
    dispatch_set_target_queue(v4, v3[8]);
    dispatch_activate(v5[7]);
    v3 = v5;
    v2 = *((_BYTE *)v5 + 80);
  }
  *((_BYTE *)v3 + 80) = v2 | 1;

}

void _xdp_set_ds_data_req_serialize(void *a1, void *a2)
{
  const char **v3;
  os_unfair_lock_s *v4;
  const char **v5;
  char *v6;
  void *readonly;
  xpc_object_t xdict;

  xdict = a1;
  v3 = a2;
  xpc_dictionary_set_uint64(xdict, "request_type", 5uLL);
  xpc_dictionary_set_string(xdict, "ds_name", v3[3]);
  v4 = (os_unfair_lock_s *)(v3 + 4);
  v5 = v3;
  os_unfair_lock_lock_with_options();
  v6 = (id)v5[5];
  os_unfair_lock_unlock(v4);

  if (v5[1] == (const char *)1)
  {
    xpc_dictionary_set_data(xdict, "ds_data", *((const void **)v6 + 2), *((_QWORD *)v6 + 3));
  }
  else
  {
    readonly = (void *)xpc_shmem_create_readonly();

    xpc_dictionary_set_value(xdict, "ds_ool_data", readonly);
    v6 = (char *)readonly;
  }

}

id _xdp_register_ds_req_serialize(const char *a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "request_type", 6uLL);
  xpc_dictionary_set_string(v2, "ds_name", a1);
  return v2;
}

void _xdp_register_ds_resp_deserialize(void *a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _xpc_endpoint_s *v5;
  xpc_connection_t v6;
  _xpc_connection_s *v7;
  _QWORD *v8;
  void *v9;
  _xpc_connection_s *v10;
  _QWORD *v11;
  xpc_object_t v12;
  _xpc_connection_s *v13;
  _QWORD handler[4];
  id v15;

  v3 = a1;
  v4 = a2;
  v4[1] = xpc_dictionary_get_uint64(v3, "ds_type");
  v4[2] = xpc_dictionary_get_uint64(v3, "max_size");
  xpc_dictionary_get_value(v3, "endpoint");
  v5 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
  if (MEMORY[0x2207CB110]() != MEMORY[0x24BDACFB0])
    sub_21F63B430();
  v6 = xpc_connection_create_from_endpoint(v5);
  if (!v6)
    sub_21F63B430();
  v7 = v6;
  handler[0] = MEMORY[0x24BDAC760];
  handler[1] = 3221225472;
  handler[2] = sub_21F63A714;
  handler[3] = &unk_24E44EE30;
  v8 = v4;
  v15 = v8;
  xpc_connection_set_event_handler(v7, handler);
  v9 = (void *)v8[6];
  v8[6] = v7;
  v10 = v7;

  xpc_connection_activate(v10);
  v11 = v8;
  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v12, "request_type", 7uLL);
  v13 = (_xpc_connection_s *)v8[6];

  xpc_connection_send_message(v13, v12);
}

void sub_21F63A714(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  _xpc_connection_s *v7;
  void *v8;
  xpc_object_t v9;
  id v10;

  v10 = a2;
  v3 = MEMORY[0x2207CB110]();
  v4 = MEMORY[0x24BDACFB8];
  if (v3 != MEMORY[0x24BDACFB8])
    sub_21F63B45C();
  v5 = v10;
  if (v10 == (id)MEMORY[0x24BDACF30])
  {
    _xpc_datastores_service_connection();
    v6 = objc_claimAutoreleasedReturnValue();
    if (!v6)
      sub_21F63B430();
    v7 = (_xpc_connection_s *)v6;
    _xdp_register_ds_req_serialize(*(const char **)(*(_QWORD *)(a1 + 32) + 24));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = xpc_connection_send_message_with_reply_sync(v7, v8);
    if (MEMORY[0x2207CB110]() != v4)
      _xdp_register_ds_resp_deserialize(v9, *(_QWORD *)(a1 + 32));

    v5 = v10;
  }

}

uint64_t xpc_datastore_publisher_create(const char *a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  xpc_object_t v11;
  int v12;
  uint64_t v13;
  OS_xpc_datastore_publisher *v14;
  const char *v15;
  uint64_t v16;
  void *v17;

  v6 = a3;
  v7 = a4;
  if (qword_2554D8B10 != -1)
    dispatch_once(&qword_2554D8B10, &unk_24E44EE50);
  v8 = (void *)xpc_copy_event();

  if (v8)
  {
    if (!v6)
    {
      dispatch_get_global_queue(0, 0);
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    _xpc_datastores_service_connection();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v9)
    {
      v13 = 0;
      *__error() = 45;
LABEL_18:

      goto LABEL_19;
    }
    _xdp_register_ds_req_serialize(a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = xpc_connection_send_message_with_reply_sync((xpc_connection_t)v9, v10);
    if (MEMORY[0x2207CB110]() == MEMORY[0x24BDACFB8])
    {
      v12 = 54;
    }
    else
    {
      if (!xpc_dictionary_get_uint64(v11, "ds_status"))
      {
        os_unfair_lock_lock((os_unfair_lock_t)&dword_2554D8B00);
        xpc_dictionary_get_pointer();
        v13 = objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v14 = [OS_xpc_datastore_publisher alloc];
          v13 = objc_msgSend_initWithName_(v14, v15, (uint64_t)a1);
        }
        v16 = MEMORY[0x2207CAF54](v7);
        v17 = *(void **)(v13 + 72);
        *(_QWORD *)(v13 + 72) = v16;

        objc_storeStrong((id *)(v13 + 64), v6);
        _xdp_register_ds_resp_deserialize(v11, (void *)v13);
        xpc_dictionary_set_pointer();
        _xpc_datastore_publisher_resume((void *)v13);
        os_unfair_lock_unlock((os_unfair_lock_t)&dword_2554D8B00);
        goto LABEL_17;
      }
      v12 = 1;
    }
    v13 = 0;
    *__error() = v12;
LABEL_17:

    goto LABEL_18;
  }
  v13 = 0;
  *__error() = 22;
LABEL_19:

  return v13;
}

void xpc_datastore_publisher_invalidate_state(void *a1)
{
  id v1;
  void *v2;
  xpc_object_t v3;
  const char *v4;
  xpc_object_t v5;
  void *v6;
  id v7;

  v1 = a1;
  os_unfair_lock_lock_with_options();
  v2 = (void *)*((_QWORD *)v1 + 5);
  *((_QWORD *)v1 + 5) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)v1 + 8);
  v7 = v1;
  v3 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v3, "request_type", 4uLL);
  v4 = (const char *)*((_QWORD *)v7 + 3);

  xpc_dictionary_set_string(v3, "ds_name", v4);
  v5 = xpc_connection_send_message_with_reply_sync(*((xpc_connection_t *)v7 + 6), v3);
  v6 = v5;
  if (v5 != (xpc_object_t)MEMORY[0x24BDACF30] && xpc_dictionary_get_uint64(v5, "ds_status"))
    sub_21F63B430();

}

uint64_t _xpc_datastore_subscriber_refresh(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  _BOOL4 v5;
  ipc_space_t *v6;
  mach_port_name_t v7;
  void *v8;
  xpc_object_t v9;
  uint64_t ds_data_resp_deserialize;

  v3 = a1;
  os_unfair_lock_lock_with_options();
  v4 = *((id *)v3 + 5);
  os_unfair_lock_unlock((os_unfair_lock_t)v3 + 8);
  if (v4 && (v5 = _xpc_datastore_subscriber_invalidated(v3), v4, !v5))
  {
    ds_data_resp_deserialize = 0;
  }
  else
  {
    v6 = (ipc_space_t *)MEMORY[0x24BDAEC58];
    if (mach_port_insert_right(*MEMORY[0x24BDAEC58], *((_DWORD *)v3 + 14), *((_DWORD *)v3 + 14), 0x14u))
      _os_assumes_log();
    v7 = *((_DWORD *)v3 + 14);
    _xdo_fetch_ds_data_req_serialize(*((const char **)v3 + 3), v7, a2);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = xpc_connection_send_message_with_reply_sync(*((xpc_connection_t *)v3 + 6), v8);
    ds_data_resp_deserialize = _xdo_fetch_ds_data_resp_deserialize(v9, v3);
    mach_port_deallocate(*v6, v7);

  }
  return ds_data_resp_deserialize;
}

id _xpc_datastore_subscriber_alloc(uint64_t a1)
{
  OS_xpc_datastore_subscriber *v2;
  const char *v3;

  v2 = [OS_xpc_datastore_subscriber alloc];
  return (id)objc_msgSend_initWithName_(v2, v3, a1);
}

id _xds_fetch_ds_info_req_serialize(const char *a1)
{
  xpc_object_t v2;

  v2 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_uint64(v2, "request_type", 1uLL);
  xpc_dictionary_set_string(v2, "ds_name", a1);
  return v2;
}

uint64_t _xds_fetch_ds_info_resp_deserialize(void *a1, void *a2)
{
  id v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  _xpc_endpoint_s *v7;
  xpc_connection_t v8;
  _xpc_connection_s *v9;
  _QWORD *v10;
  void *v11;
  _xpc_connection_s *v12;
  _QWORD handler[4];
  id v15;

  v3 = a1;
  v4 = a2;
  if (!v3)
    sub_21F63B430();
  v5 = v4;
  if (!v4)
    sub_21F63B430();
  if (MEMORY[0x2207CB110](v3) == MEMORY[0x24BDACFB8])
  {
    v6 = 96;
  }
  else if (xpc_dictionary_get_uint64(v3, "ds_status"))
  {
    v6 = 1;
  }
  else
  {
    v5[1] = xpc_dictionary_get_uint64(v3, "ds_type");
    xpc_dictionary_get_value(v3, "endpoint");
    v7 = (_xpc_endpoint_s *)objc_claimAutoreleasedReturnValue();
    if (MEMORY[0x2207CB110]() != MEMORY[0x24BDACFB0])
      sub_21F63B430();
    v8 = xpc_connection_create_from_endpoint(v7);
    if (!v8)
      sub_21F63B430();
    v9 = v8;
    handler[0] = MEMORY[0x24BDAC760];
    handler[1] = 3221225472;
    handler[2] = sub_21F63AEB4;
    handler[3] = &unk_24E44EE30;
    v10 = v5;
    v15 = v10;
    xpc_connection_set_event_handler(v9, handler);
    v11 = (void *)v10[6];
    v10[6] = v9;
    v12 = v9;

    xpc_connection_activate(v12);
    v6 = 0;
  }

  return v6;
}

void sub_21F63AEB4(uint64_t a1, void *a2)
{
  void *v3;
  os_unfair_lock_s *v4;
  os_unfair_lock_s *v5;
  os_unfair_lock_s *v6;
  void *v7;
  os_unfair_lock_s *v8;
  os_unfair_lock_s *v9;
  os_unfair_lock_s *v10;
  void *v11;
  id v12;

  v12 = a2;
  if (MEMORY[0x2207CB110]() != MEMORY[0x24BDACFB8])
    sub_21F63B45C();
  v3 = v12;
  if (v12 == (id)MEMORY[0x24BDACF30])
  {
    v8 = *(os_unfair_lock_s **)(a1 + 32);
    v9 = v8 + 8;
    v10 = v8;
    os_unfair_lock_lock_with_options();
    v11 = *(void **)&v10[10]._os_unfair_lock_opaque;
    *(_QWORD *)&v10[10]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v9);
    _xpc_datastore_subscriber_initial_handshake(*(_QWORD *)(a1 + 32));
    goto LABEL_6;
  }
  if (v12 == (id)MEMORY[0x24BDACF38])
  {
    v4 = *(os_unfair_lock_s **)(a1 + 32);
    v5 = v4 + 8;
    v6 = v4;
    os_unfair_lock_lock_with_options();
    v7 = *(void **)&v6[10]._os_unfair_lock_opaque;
    *(_QWORD *)&v6[10]._os_unfair_lock_opaque = 0;

    os_unfair_lock_unlock(v5);
LABEL_6:
    v3 = v12;
  }

}

uint64_t _xpc_datastore_subscriber_initial_handshake(void *a1)
{
  const char **v1;
  _xpc_connection_s *v2;
  void *v3;
  xpc_object_t v4;
  uint64_t ds_info_resp_deserialize;

  v1 = a1;
  _xpc_datastores_service_connection();
  v2 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    _xds_fetch_ds_info_req_serialize(v1[3]);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = xpc_connection_send_message_with_reply_sync(v2, v3);
    ds_info_resp_deserialize = _xds_fetch_ds_info_resp_deserialize(v4, v1);
    if ((_DWORD)ds_info_resp_deserialize)
      *__error() = ds_info_resp_deserialize;

  }
  else
  {
    ds_info_resp_deserialize = 45;
  }

  return ds_info_resp_deserialize;
}

BOOL _xpc_datastore_subscriber_invalidated(void *a1)
{
  id v1;
  int v2;
  _BOOL8 v3;

  v1 = a1;
  v2 = xpc_pipe_receive();
  if (v2 == 35)
  {
    v3 = 0;
  }
  else
  {
    if (v2)
      sub_21F63B474();
    v3 = xpc_dictionary_get_BOOL(0, "ds_data_invalid");
  }

  return v3;
}

mach_port_name_t *xpc_datastore_subscriber_create(uint64_t a1)
{
  OS_xpc_datastore_subscriber *v2;
  const char *v3;
  mach_port_name_t *v4;
  int v5;
  mach_port_name_t *v6;

  v2 = [OS_xpc_datastore_subscriber alloc];
  v4 = (mach_port_name_t *)objc_msgSend_initWithName_(v2, v3, a1);
  v5 = _xpc_datastore_subscriber_initial_handshake(v4);
  if (v5)
  {
    v6 = 0;
    *__error() = v5;
  }
  else
  {
    if (mach_port_allocate(*MEMORY[0x24BDAEC58], 1u, v4 + 14))
      sub_21F63B430();
    v6 = v4;
  }

  return v6;
}

void sub_21F63B140()
{
  xpc_object_t v0;
  void *v1;

  dword_2554D8B00 = 0;
  v0 = xpc_dictionary_create(0, 0, 0);
  v1 = (void *)qword_2554D8B08;
  qword_2554D8B08 = (uint64_t)v0;

  xpc_set_event_stream_handler("com.apple.xpc.datastores.publish", 0, &unk_24E44EE70);
}

void sub_21F63B194(uint64_t a1, void *a2)
{
  id v2;
  const char *string;
  _QWORD *v4;
  NSObject *v5;
  id v6;
  _QWORD *v7;
  _QWORD block[4];
  id v9;
  id v10;

  v2 = a2;
  string = xpc_dictionary_get_string(v2, (const char *)*MEMORY[0x24BDACF50]);
  os_unfair_lock_lock((os_unfair_lock_t)&dword_2554D8B00);
  xpc_dictionary_get_pointer();
  v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    _xpc_datastore_publisher_create_suspended(string);
    v4 = (_QWORD *)objc_claimAutoreleasedReturnValue();
    xpc_dictionary_set_pointer();
  }
  os_unfair_lock_unlock((os_unfair_lock_t)&dword_2554D8B00);
  v5 = v4[8];
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_21F63B2A0;
  block[3] = &unk_24E44EE98;
  v9 = v4;
  v10 = v2;
  v6 = v2;
  v7 = v4;
  dispatch_async_and_wait(v5, block);

}

void sub_21F63B2A0(uint64_t a1)
{
  void *v2;
  os_unfair_lock_s *v3;
  id v4;
  uint64_t serialization;
  void *v6;
  uint64_t v7;
  OS_xds_local_cache *v8;
  OS_xds_local_cache *v9;
  void *v10;
  os_unfair_lock_s *v11;
  OS_xds_local_cache *v12;
  os_unfair_lock_s *v13;
  void *v14;
  xpc_object_t reply;

  v2 = (void *)(*(uint64_t (**)(void))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 72) + 16))();
  v3 = (os_unfair_lock_s *)*(id *)(a1 + 32);
  v4 = v2;
  if (v4)
  {
    serialization = xpc_make_serialization();
    if (!serialization)
      sub_21F63B48C();
    v6 = (void *)serialization;
  }
  else
  {
    v6 = 0;
  }
  v7 = *(_QWORD *)&v3[2]._os_unfair_lock_opaque;
  v8 = objc_alloc_init(OS_xds_local_cache);
  v9 = v8;
  if (v7 == 1)
  {
    v8->ds_type = 1;
    v8->data = v6;
    v8->size = 0;
  }
  else
  {
    v8->ds_type = 2;
    v10 = mmap(0, 0, 3, 4097, -1, 0);
    mprotect(v10, 0, 1);
    v9->data = v10;
    v9->size = 0;
    free(v6);
  }
  v11 = v3 + 8;
  v12 = v9;
  v13 = v3;
  os_unfair_lock_lock_with_options();
  v14 = *(void **)&v13[10]._os_unfair_lock_opaque;
  *(_QWORD *)&v13[10]._os_unfair_lock_opaque = v12;

  os_unfair_lock_unlock(v11);
  reply = xpc_dictionary_create_reply(*(xpc_object_t *)(a1 + 40));
  _xdp_set_ds_data_req_serialize(reply, *(void **)(a1 + 32));
  xpc_dictionary_send_reply();

}

uint64_t sub_21F63B428()
{
  return _os_assert_log();
}

void sub_21F63B430()
{
  sub_21F63B428();
  _os_crash();
  __break(1u);
}

void sub_21F63B444()
{
  _os_crash();
  __break(1u);
}

void sub_21F63B45C()
{
  _os_crash();
  __break(1u);
}

void sub_21F63B474()
{
  _os_crash();
  __break(1u);
}

void sub_21F63B48C()
{
  _os_crash();
  __break(1u);
}

void sub_21F63B4A4()
{
  _os_crash();
  __break(1u);
  __error();
}

int *__error(void)
{
  return (int *)MEMORY[0x24BDAC7D0]();
}

uint64_t _os_assert_log()
{
  return MEMORY[0x24BDACB40]();
}

uint64_t _os_assumes_log()
{
  return MEMORY[0x24BDACB48]();
}

uint64_t _os_crash()
{
  return MEMORY[0x24BDACB50]();
}

int asprintf(char **a1, const char *a2, ...)
{
  return MEMORY[0x24BDAD200](a1, a2);
}

void dispatch_activate(dispatch_object_t object)
{
  MEMORY[0x24BDADC58](object);
}

void dispatch_async_and_wait(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC8](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_initially_inactive(dispatch_queue_attr_t attr)
{
  return (dispatch_queue_attr_t)MEMORY[0x24BDADEB0](attr);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_set_target_queue(dispatch_object_t object, dispatch_queue_t queue)
{
  MEMORY[0x24BDADF60](object, queue);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x24BDAEBA0](*(_QWORD *)&task, *(_QWORD *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x24BDAEBB0](*(_QWORD *)&task, *(_QWORD *)&name);
}

kern_return_t mach_port_destruct(ipc_space_t task, mach_port_name_t name, mach_port_delta_t srdelta, mach_port_context_t guard)
{
  return MEMORY[0x24BDAEBC0](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&srdelta, guard);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x24BDAEBE8](*(_QWORD *)&task, *(_QWORD *)&name, *(_QWORD *)&poly, *(_QWORD *)&polyPoly);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x24BDAEE80](__dst, __src, __n);
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x24BDAEFA8](a1, a2, *(_QWORD *)&a3, *(_QWORD *)&a4, *(_QWORD *)&a5, a6);
}

int mprotect(void *a1, size_t a2, int a3)
{
  return MEMORY[0x24BDAEFC8](a1, a2, *(_QWORD *)&a3);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x24BDAEFF0](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD2B0](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF460](lock);
}

uint64_t os_unfair_lock_lock_with_options()
{
  return MEMORY[0x24BDAF470]();
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x24BDAF488](lock);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x24BDAFF10](__s1);
}

void xpc_connection_activate(xpc_connection_t connection)
{
  MEMORY[0x24BDB0710](connection);
}

void xpc_connection_cancel(xpc_connection_t connection)
{
  MEMORY[0x24BDB0718](connection);
}

xpc_connection_t xpc_connection_create_from_endpoint(xpc_endpoint_t endpoint)
{
  return (xpc_connection_t)MEMORY[0x24BDB0738](endpoint);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x24BDB0740](name, targetq, flags);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x24BDB07A8](connection, message);
}

xpc_object_t xpc_connection_send_message_with_reply_sync(xpc_connection_t connection, xpc_object_t message)
{
  return (xpc_object_t)MEMORY[0x24BDB07B8](connection, message);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x24BDB07C8](connection, handler);
}

uint64_t xpc_copy_event()
{
  return MEMORY[0x24BDB0840]();
}

uint64_t xpc_create_from_serialization()
{
  return MEMORY[0x24BDB0858]();
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x24BDB08C0](keys, values, count);
}

xpc_object_t xpc_dictionary_create_reply(xpc_object_t original)
{
  return (xpc_object_t)MEMORY[0x24BDB08D8](original);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0908](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x24BDB0918](xdict, key, length);
}

uint64_t xpc_dictionary_get_pointer()
{
  return MEMORY[0x24BDB0940]();
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x24BDB0950](xdict, key);
}

uint64_t xpc_dictionary_get_uint64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x24BDB0958](xdict, key);
}

xpc_object_t xpc_dictionary_get_value(xpc_object_t xdict, const char *key)
{
  return (xpc_object_t)MEMORY[0x24BDB0968](xdict, key);
}

uint64_t xpc_dictionary_send_reply()
{
  return MEMORY[0x24BDB0970]();
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x24BDB0988](xdict, key, bytes, length);
}

uint64_t xpc_dictionary_set_pointer()
{
  return MEMORY[0x24BDB09C0]();
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x24BDB09C8](xdict, key, string);
}

void xpc_dictionary_set_uint64(xpc_object_t xdict, const char *key, uint64_t value)
{
  MEMORY[0x24BDB09D0](xdict, key, value);
}

void xpc_dictionary_set_value(xpc_object_t xdict, const char *key, xpc_object_t value)
{
  MEMORY[0x24BDB09E0](xdict, key, value);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x24BDB0A70](object);
}

uint64_t xpc_mach_send_create()
{
  return MEMORY[0x24BDB0A98]();
}

uint64_t xpc_make_serialization()
{
  return MEMORY[0x24BDB0AB8]();
}

uint64_t xpc_pipe_receive()
{
  return MEMORY[0x24BDB0AD0]();
}

void xpc_set_event_stream_handler(const char *stream, dispatch_queue_t targetq, xpc_handler_t handler)
{
  MEMORY[0x24BDB0B58](stream, targetq, handler);
}

uint64_t xpc_shmem_create_readonly()
{
  return MEMORY[0x24BDB0B68]();
}

size_t xpc_shmem_map(xpc_object_t xshmem, void **region)
{
  return MEMORY[0x24BDB0B70](xshmem, region);
}

