_QWORD *sub_100002208(_QWORD *a1)
{
  sub_10000260C(a1);
  return a1;
}

uint64_t sub_10000222C(uint64_t a1)
{
  sub_1000035F0(a1, *(_QWORD **)(a1 + 8));
  return a1;
}

void start()
{
  _xpc_connection_s *mach_service;
  _xpc_connection_s *v1;

  mach_service = xpc_connection_create_mach_service("com.apple.gpumemd.client", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  xpc_connection_set_event_handler(mach_service, &stru_1000041A0);
  xpc_connection_resume(mach_service);
  v1 = xpc_connection_create_mach_service("com.apple.gpumemd.source", (dispatch_queue_t)&_dispatch_main_q, 1uLL);
  xpc_connection_set_event_handler(v1, &stru_1000041E0);
  xpc_connection_resume(v1);
  dispatch_main();
}

void sub_1000022C4(id a1, void *a2)
{
  __SecTask *v3;
  __SecTask *v4;
  CFTypeRef v5;
  CFTypeID v6;
  int Value;
  pid_t pid;
  const char *string;
  CFErrorRef error;
  audit_token_t token;
  audit_token_t handler;
  void *v13;
  pid_t v14;

  sub_100002444("client listener event handler called", a2);
  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    syslog(5, "client_listener error: %s", string);
    return;
  }
  xpc_connection_get_audit_token(a2, &handler);
  token = handler;
  v3 = SecTaskCreateWithAuditToken(0, &token);
  if (v3)
  {
    v4 = v3;
    error = 0;
    v5 = SecTaskCopyValueForEntitlement(v3, CFSTR("com.apple.private.ioaccelmemoryinfo"), &error);
    if (error)
      CFRelease(error);
    if (v5)
    {
      v6 = CFGetTypeID(v5);
      if (v6 == CFBooleanGetTypeID())
      {
        Value = CFBooleanGetValue((CFBooleanRef)v5);
        CFRelease(v5);
        CFRelease(v4);
        if (Value)
        {
          pid = xpc_connection_get_pid((xpc_connection_t)a2);
          *(_QWORD *)handler.val = _NSConcreteStackBlock;
          *(_QWORD *)&handler.val[2] = 0x40000000;
          *(_QWORD *)&handler.val[4] = sub_10000266C;
          *(_QWORD *)&handler.val[6] = &unk_100004200;
          v13 = a2;
          v14 = pid;
          xpc_connection_set_event_handler((xpc_connection_t)a2, &handler);
          xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)&_dispatch_main_q);
          xpc_connection_resume((xpc_connection_t)a2);
          return;
        }
        goto LABEL_12;
      }
      CFRelease(v5);
    }
    CFRelease(v4);
  }
LABEL_12:
  xpc_connection_cancel((xpc_connection_t)a2);
}

void sub_100002444(const char *a1, xpc_object_t object)
{
  char *v3;

  v3 = xpc_copy_description(object);
  syslog(7, "%s: %s", a1, v3);
  free(v3);
}

void sub_10000248C(id a1, void *a2)
{
  pid_t pid;
  uint64_t v4;
  uint64_t *v5;
  pid_t v6;
  BOOL v7;
  uint64_t *v8;
  const char *string;
  _QWORD handler[5];
  pid_t v11;
  pid_t v12;
  int *v13;

  if (xpc_get_type(a2) == (xpc_type_t)&_xpc_type_error)
  {
    string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
    syslog(5, "source_listener error: %s", string);
  }
  else
  {
    pid = xpc_connection_get_pid((xpc_connection_t)a2);
    v12 = pid;
    syslog(7, "registering new source connection %p for pid %d", a2, pid);
    v4 = qword_100008020;
    if (!qword_100008020)
      goto LABEL_12;
    v5 = &qword_100008020;
    do
    {
      v6 = *(_DWORD *)(v4 + 32);
      v7 = v6 < pid;
      if (v6 >= pid)
        v8 = (uint64_t *)v4;
      else
        v8 = (uint64_t *)(v4 + 8);
      if (!v7)
        v5 = (uint64_t *)v4;
      v4 = *v8;
    }
    while (*v8);
    if (v5 != &qword_100008020 && pid >= *((_DWORD *)v5 + 8))
    {
      syslog(7, "redundant checkin for PID %d, ignoring", pid);
      xpc_connection_cancel((xpc_connection_t)a2);
    }
    else
    {
LABEL_12:
      xpc_connection_set_target_queue((xpc_connection_t)a2, (dispatch_queue_t)&_dispatch_main_q);
      handler[0] = _NSConcreteStackBlock;
      handler[1] = 0x40000000;
      handler[2] = sub_100002E10;
      handler[3] = &unk_100004280;
      handler[4] = a2;
      v11 = pid;
      xpc_connection_set_event_handler((xpc_connection_t)a2, handler);
      xpc_retain(a2);
      xpc_connection_resume((xpc_connection_t)a2);
      v13 = &v12;
      sub_100003344((uint64_t **)&qword_100008018, &v12, (uint64_t)&unk_100003940, &v13)[5] = (uint64_t *)a2;
    }
  }
}

_QWORD *sub_10000260C(_QWORD *result)
{
  _QWORD *v1;
  uint64_t v2;
  uint64_t v3;
  _QWORD *v4;

  if (result[2])
  {
    v1 = result;
    result = (_QWORD *)result[1];
    v2 = *v1;
    v3 = *result;
    *(_QWORD *)(v3 + 8) = *(_QWORD *)(*v1 + 8);
    **(_QWORD **)(v2 + 8) = v3;
    v1[2] = 0;
    if (result != v1)
    {
      do
      {
        v4 = (_QWORD *)result[1];
        operator delete(result);
        result = v4;
      }
      while (v4 != v1);
    }
  }
  return result;
}

void sub_10000266C(uint64_t a1, void *a2)
{
  xpc_object_t value;
  void *v5;
  const void *v6;
  const char *string;
  uint64_t *i;
  xpc_object_t *v9;
  uint64_t v10;

  sub_100002444("client connection event handler called", a2);
  if (xpc_get_type(a2) != (xpc_type_t)&_xpc_type_error)
  {
    value = xpc_dictionary_get_value(a2, "TargetProcess");
    if (value)
    {
      v5 = value;
      if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_uint64)
      {
        xpc_uint64_get_value(v5);
        operator new();
      }
      sub_1000036BC();
    }
    sub_100003694();
  }
  v6 = *(const void **)(a1 + 32);
  string = xpc_dictionary_get_string(a2, _xpc_error_key_description);
  syslog(7, "client connection %p error delivered: %s", v6, string);
  for (i = (uint64_t *)qword_100008008; i != &qword_100008000; i = (uint64_t *)i[1])
  {
    v9 = (xpc_object_t *)i[2];
    if (v9[1] == *(xpc_object_t *)(a1 + 32))
    {
      syslog(7, "%s: deleting outstanding request %p", "void register_new_client(xpc_connection_t)_block_invoke", v9);
      v10 = *i;
      *(_QWORD *)(v10 + 8) = i[1];
      *(_QWORD *)i[1] = v10;
      --qword_100008010;
      operator delete(i);
      sub_100002B84(v9);
    }
  }
  syslog(7, "%s: %zu outstanding requests left", "void register_new_client(xpc_connection_t)_block_invoke", qword_100008010);
}

void sub_1000028A0()
{
  uint64_t *v0;
  uint64_t *v1;
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  const char *v5;
  _DWORD *v6;
  uint64_t v7;
  int v8;
  uint64_t *v9;
  int v10;
  BOOL v11;
  uint64_t *v12;
  double v13;
  uint64_t v14;
  _xpc_connection_s *remote_connection;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  const char *v19;
  uint64_t *v20;
  _xpc_connection_s *v21;
  xpc_object_t v22;
  int32x2_t v23;
  _xpc_connection_s *v24;
  BOOL v25;
  dispatch_time_t v26;
  _QWORD handler[5];

  v0 = (uint64_t *)qword_100008008;
  v1 = &qword_100008000;
  if ((uint64_t *)qword_100008008 != &qword_100008000)
  {
    v2 = 0;
    v3 = &qword_100008000;
    v4 = &qword_100008020;
    v5 = "%s: request %p timed out (now %f, last progress %f)";
    while (1)
    {
      v6 = (_DWORD *)v0[2];
      if (*((_BYTE *)v6 + 25))
        break;
      v7 = v3[4];
      if (!v7)
        goto LABEL_31;
      v8 = *v6;
      v9 = v4;
      do
      {
        v10 = *(_DWORD *)(v7 + 32);
        v11 = v10 < v8;
        if (v10 >= v8)
          v12 = (uint64_t *)v7;
        else
          v12 = (uint64_t *)(v7 + 8);
        if (!v11)
          v9 = (uint64_t *)v7;
        v7 = *v12;
      }
      while (*v12);
      if (v9 != v4 && v8 >= *((_DWORD *)v9 + 8))
      {
        v16 = v1;
        v17 = v2;
        v18 = v4;
        v19 = v5;
        v20 = v3;
        v21 = (_xpc_connection_s *)v9[5];
        syslog(7, "%s: request %p sending message to source pid %d for client pid %d", "void process_outstanding_requests()", v6, *v6, v6[1]);
        v22 = xpc_dictionary_create(0, 0, 0);
        xpc_dictionary_set_BOOL(v22, "MemoryListRequest", 1);
        v23 = *(int32x2_t *)v6;
        handler[0] = _NSConcreteStackBlock;
        handler[1] = 0x40000000;
        handler[2] = sub_100002BE0;
        handler[3] = &unk_100004220;
        handler[4] = vrev64_s32(v23);
        v24 = v21;
        v3 = v20;
        v5 = v19;
        v4 = v18;
        v2 = v17;
        v1 = v16;
        xpc_connection_send_message_with_reply(v24, v22, (dispatch_queue_t)&_dispatch_main_q, handler);
        xpc_release(v22);
        *((_BYTE *)v6 + 25) = 1;
      }
      else
      {
LABEL_31:
        if (*((_BYTE *)v6 + 24))
          break;
        syslog(7, "%s: request %p did not find a connection to source pid %d sending check-in broadcast", "void process_outstanding_requests()", (const void *)v0[2], *v6);
        if ((v2 & 1) == 0)
          notify_post("com.apple.gpumemd.check_in_request");
        v2 = 1;
        *((_BYTE *)v6 + 24) = 1;
      }
      *((double *)v6 + 4) = sub_100002DB4();
LABEL_22:
      v0 = (uint64_t *)v0[1];
      if (v0 == &qword_100008000)
        goto LABEL_23;
    }
    if (sub_100002DB4() - *((double *)v6 + 4) > 1.0)
    {
      v13 = sub_100002DB4();
      syslog(5, v5, "void process_outstanding_requests()", v6, *(_QWORD *)&v13, *((_QWORD *)v6 + 4));
      v14 = *v0;
      *(_QWORD *)(v14 + 8) = v0[1];
      *(_QWORD *)v0[1] = v14;
      --v1[2];
      operator delete(v0);
      xpc_dictionary_set_BOOL(*((xpc_object_t *)v6 + 2), "Timeout", 1);
      remote_connection = xpc_dictionary_get_remote_connection(*((xpc_object_t *)v6 + 2));
      xpc_connection_send_message(remote_connection, *((xpc_object_t *)v6 + 2));
      xpc_release(*((xpc_object_t *)v6 + 1));
      xpc_release(*((xpc_object_t *)v6 + 2));
      operator delete();
    }
    goto LABEL_22;
  }
LABEL_23:
  if (v1[2])
    v25 = byte_100008030 == 0;
  else
    v25 = 0;
  if (v25)
  {
    v26 = dispatch_time(0, 250000000);
    dispatch_after(v26, (dispatch_queue_t)&_dispatch_main_q, &stru_100004260);
    byte_100008030 = 1;
  }
}

void sub_100002B84(xpc_object_t *a1)
{
  syslog(7, "deallocating request %p", a1);
  xpc_release(a1[1]);
  xpc_release(a1[2]);
  operator delete();
}

void sub_100002BE0(uint64_t a1, xpc_object_t object)
{
  int v3;
  int v4;
  xpc_type_t type;
  _xpc_connection_s *remote_connection;
  _xpc_connection_s *v7;
  const char *string;
  xpc_object_t value;
  int v10;
  xpc_connection_t v11;
  uint64_t *i;
  _DWORD *v13;
  uint64_t v14;

  v3 = *(_DWORD *)(a1 + 32);
  v4 = *(_DWORD *)(a1 + 36);
  type = xpc_get_type(object);
  remote_connection = xpc_dictionary_get_remote_connection(object);
  v7 = remote_connection;
  if (type != (xpc_type_t)&_xpc_type_dictionary)
  {
    string = xpc_dictionary_get_string(object, _xpc_error_key_description);
    syslog(5, "source connection %p reply error: %s", v7, string);
    value = 0;
LABEL_3:
    v10 = 0;
    goto LABEL_7;
  }
  if (xpc_connection_get_pid(remote_connection) != v4)
    sub_1000036E4();
  value = xpc_dictionary_get_value(object, "Payload");
  v11 = xpc_dictionary_get_remote_connection(object);
  if (!value)
  {
    syslog(5, "source connection %p reply error: Payload missing", v11);
    goto LABEL_3;
  }
  syslog(7, "source connection %p reply received", v11);
  v10 = 1;
LABEL_7:
  for (i = (uint64_t *)qword_100008008; i != &qword_100008000; i = (uint64_t *)i[1])
  {
    v13 = (_DWORD *)i[2];
    if (v13[1] == v3 && *v13 == v4)
    {
      if (v10)
      {
        syslog(7, "completing request %p, sending reply for source %d to client %d", v13, v4, v3);
        xpc_dictionary_set_value(*((xpc_object_t *)v13 + 2), "Payload", value);
        xpc_connection_send_message(*((xpc_connection_t *)v13 + 1), *((xpc_object_t *)v13 + 2));
      }
      else
      {
        syslog(7, "discarding request %p for source %d to client %d", v13, v4, v3);
      }
      v14 = *i;
      *(_QWORD *)(v14 + 8) = i[1];
      *(_QWORD *)i[1] = v14;
      --qword_100008010;
      operator delete(i);
      sub_100002B84((xpc_object_t *)v13);
    }
  }
}

double sub_100002DB4()
{
  uint64_t v0;
  unint64_t v1;
  unint64_t v2;
  mach_timebase_info info;

  if (mach_timebase_info(&info))
    sub_10000370C();
  v0 = mach_absolute_time();
  LODWORD(v1) = info.numer;
  LODWORD(v2) = info.denom;
  return (double)v0 * (double)v1 / (double)v2 / 1000000000.0;
}

void sub_100002E04(id a1)
{
  byte_100008030 = 0;
  sub_1000028A0();
}

void sub_100002E10(uint64_t a1, xpc_object_t object)
{
  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    syslog(5, "source connection %p error received", *(const void **)(a1 + 32));
    sub_100002ED8((uint64_t)&qword_100008018, (int *)(a1 + 40));
    xpc_connection_cancel(*(xpc_connection_t *)(a1 + 32));
    xpc_release(*(xpc_object_t *)(a1 + 32));
  }
  else if (xpc_dictionary_get_BOOL(object, "CheckIn"))
  {
    syslog(7, "source connection %p for pid %d checked in");
  }
  else
  {
    syslog(5, "unexpected message from source connection %p");
  }
}

uint64_t sub_100002ED8(uint64_t a1, int *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  int v5;
  BOOL v6;
  uint64_t *v7;

  v2 = *(_QWORD *)(a1 + 8);
  if (!v2)
    return 0;
  v3 = *a2;
  v4 = a1 + 8;
  do
  {
    v5 = *(_DWORD *)(v2 + 32);
    v6 = v5 < v3;
    if (v5 >= v3)
      v7 = (uint64_t *)v2;
    else
      v7 = (uint64_t *)(v2 + 8);
    if (!v6)
      v4 = v2;
    v2 = *v7;
  }
  while (*v7);
  if (v4 == a1 + 8 || v3 < *(_DWORD *)(v4 + 32))
    return 0;
  sub_100002F50((uint64_t **)a1, (uint64_t *)v4);
  operator delete((void *)v4);
  return 1;
}

uint64_t *sub_100002F50(uint64_t **a1, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  BOOL v5;
  uint64_t *v6;

  v2 = (uint64_t *)a2[1];
  if (v2)
  {
    do
    {
      v3 = v2;
      v2 = (uint64_t *)*v2;
    }
    while (v2);
  }
  else
  {
    v4 = a2;
    do
    {
      v3 = (uint64_t *)v4[2];
      v5 = *v3 == (_QWORD)v4;
      v4 = v3;
    }
    while (!v5);
  }
  if (*a1 == a2)
    *a1 = v3;
  v6 = a1[1];
  a1[2] = (uint64_t *)((char *)a1[2] - 1);
  sub_100002FC0(v6, a2);
  return v3;
}

uint64_t *sub_100002FC0(uint64_t *result, uint64_t *a2)
{
  uint64_t v2;
  uint64_t *v3;
  uint64_t *v4;
  int v5;
  uint64_t **v6;
  uint64_t *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  _QWORD *v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t v18;
  _QWORD *v19;
  uint64_t *v20;
  BOOL v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;

  v2 = *a2;
  v3 = a2;
  if (*a2)
  {
    v4 = (uint64_t *)a2[1];
    if (!v4)
    {
      v3 = a2;
      goto LABEL_7;
    }
    do
    {
      v3 = v4;
      v4 = (uint64_t *)*v4;
    }
    while (v4);
  }
  v2 = v3[1];
  if (v2)
  {
LABEL_7:
    v5 = 0;
    *(_QWORD *)(v2 + 16) = v3[2];
    goto LABEL_8;
  }
  v5 = 1;
LABEL_8:
  v6 = (uint64_t **)v3[2];
  v7 = *v6;
  if (*v6 == v3)
  {
    *v6 = (uint64_t *)v2;
    if (v3 == result)
    {
      v7 = 0;
      result = (uint64_t *)v2;
    }
    else
    {
      v7 = v6[1];
    }
  }
  else
  {
    v6[1] = (uint64_t *)v2;
  }
  v8 = *((unsigned __int8 *)v3 + 24);
  if (v3 != a2)
  {
    v9 = a2[2];
    v3[2] = v9;
    *(_QWORD *)(v9 + 8 * (*(_QWORD *)a2[2] != (_QWORD)a2)) = v3;
    v11 = *a2;
    v10 = a2[1];
    *(_QWORD *)(v11 + 16) = v3;
    *v3 = v11;
    v3[1] = v10;
    if (v10)
      *(_QWORD *)(v10 + 16) = v3;
    *((_BYTE *)v3 + 24) = *((_BYTE *)a2 + 24);
    if (result == a2)
      result = v3;
  }
  if (!v8 || !result)
    return result;
  if (!v5)
  {
    *(_BYTE *)(v2 + 24) = 1;
    return result;
  }
  while (1)
  {
    v12 = v7[2];
    if (*(uint64_t **)v12 == v7)
      break;
    if (!*((_BYTE *)v7 + 24))
    {
      *((_BYTE *)v7 + 24) = 1;
      *(_BYTE *)(v12 + 24) = 0;
      v13 = *(uint64_t **)(v12 + 8);
      v14 = *v13;
      *(_QWORD *)(v12 + 8) = *v13;
      if (v14)
        *(_QWORD *)(v14 + 16) = v12;
      v13[2] = *(_QWORD *)(v12 + 16);
      *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v13;
      *v13 = v12;
      *(_QWORD *)(v12 + 16) = v13;
      if (result == (uint64_t *)*v7)
        result = v7;
      v7 = *(uint64_t **)(*v7 + 8);
    }
    v15 = (_QWORD *)*v7;
    if (*v7 && !*((_BYTE *)v15 + 24))
    {
      v16 = (uint64_t *)v7[1];
      if (!v16)
        goto LABEL_56;
LABEL_55:
      if (*((_BYTE *)v16 + 24))
      {
LABEL_56:
        *((_BYTE *)v15 + 24) = 1;
        *((_BYTE *)v7 + 24) = 0;
        v22 = v15[1];
        *v7 = v22;
        if (v22)
          *(_QWORD *)(v22 + 16) = v7;
        v15[2] = v7[2];
        *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v15;
        v15[1] = v7;
        v7[2] = (uint64_t)v15;
        v16 = v7;
      }
      else
      {
        v15 = v7;
      }
      v23 = v15[2];
      *((_BYTE *)v15 + 24) = *(_BYTE *)(v23 + 24);
      *(_BYTE *)(v23 + 24) = 1;
      *((_BYTE *)v16 + 24) = 1;
      v24 = *(uint64_t **)(v23 + 8);
      v25 = *v24;
      *(_QWORD *)(v23 + 8) = *v24;
      if (v25)
        *(_QWORD *)(v25 + 16) = v23;
      v24[2] = *(_QWORD *)(v23 + 16);
      *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
      *v24 = v23;
      goto LABEL_72;
    }
    v16 = (uint64_t *)v7[1];
    if (v16 && !*((_BYTE *)v16 + 24))
      goto LABEL_55;
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (v17 == result)
    {
      v17 = result;
LABEL_53:
      *((_BYTE *)v17 + 24) = 1;
      return result;
    }
    if (!*((_BYTE *)v17 + 24))
      goto LABEL_53;
LABEL_49:
    v7 = *(uint64_t **)(v17[2] + 8 * (*(_QWORD *)v17[2] == (_QWORD)v17));
  }
  if (!*((_BYTE *)v7 + 24))
  {
    *((_BYTE *)v7 + 24) = 1;
    *(_BYTE *)(v12 + 24) = 0;
    v18 = v7[1];
    *(_QWORD *)v12 = v18;
    if (v18)
      *(_QWORD *)(v18 + 16) = v12;
    v7[2] = *(_QWORD *)(v12 + 16);
    *(_QWORD *)(*(_QWORD *)(v12 + 16) + 8 * (**(_QWORD **)(v12 + 16) != v12)) = v7;
    v7[1] = v12;
    *(_QWORD *)(v12 + 16) = v7;
    if (result == (uint64_t *)v12)
      result = v7;
    v7 = *(uint64_t **)v12;
  }
  v19 = (_QWORD *)*v7;
  if (*v7 && !*((_BYTE *)v19 + 24))
    goto LABEL_68;
  v20 = (uint64_t *)v7[1];
  if (!v20 || *((_BYTE *)v20 + 24))
  {
    *((_BYTE *)v7 + 24) = 0;
    v17 = (uint64_t *)v7[2];
    if (*((_BYTE *)v17 + 24))
      v21 = v17 == result;
    else
      v21 = 1;
    if (v21)
      goto LABEL_53;
    goto LABEL_49;
  }
  if (v19 && !*((_BYTE *)v19 + 24))
  {
LABEL_68:
    v20 = v7;
  }
  else
  {
    *((_BYTE *)v20 + 24) = 1;
    *((_BYTE *)v7 + 24) = 0;
    v26 = *v20;
    v7[1] = *v20;
    if (v26)
      *(_QWORD *)(v26 + 16) = v7;
    v20[2] = v7[2];
    *(_QWORD *)(v7[2] + 8 * (*(_QWORD *)v7[2] != (_QWORD)v7)) = v20;
    *v20 = (uint64_t)v7;
    v7[2] = (uint64_t)v20;
    v19 = v7;
  }
  v23 = v20[2];
  *((_BYTE *)v20 + 24) = *(_BYTE *)(v23 + 24);
  *(_BYTE *)(v23 + 24) = 1;
  *((_BYTE *)v19 + 24) = 1;
  v24 = *(uint64_t **)v23;
  v27 = *(_QWORD *)(*(_QWORD *)v23 + 8);
  *(_QWORD *)v23 = v27;
  if (v27)
    *(_QWORD *)(v27 + 16) = v23;
  v24[2] = *(_QWORD *)(v23 + 16);
  *(_QWORD *)(*(_QWORD *)(v23 + 16) + 8 * (**(_QWORD **)(v23 + 16) != v23)) = v24;
  v24[1] = v23;
LABEL_72:
  *(_QWORD *)(v23 + 16) = v24;
  return result;
}

uint64_t **sub_100003344(uint64_t **a1, int *a2, uint64_t a3, _DWORD **a4)
{
  uint64_t *v6;
  uint64_t **v7;
  int v8;
  uint64_t **v9;
  int v10;
  _DWORD *v11;

  v7 = a1 + 1;
  v6 = a1[1];
  if (v6)
  {
    v8 = *a2;
    while (1)
    {
      while (1)
      {
        v9 = (uint64_t **)v6;
        v10 = *((_DWORD *)v6 + 8);
        if (v8 >= v10)
          break;
        v6 = *v9;
        v7 = v9;
        if (!*v9)
          goto LABEL_10;
      }
      if (v10 >= v8)
        break;
      v6 = v9[1];
      if (!v6)
      {
        v7 = v9 + 1;
        goto LABEL_10;
      }
    }
  }
  else
  {
    v9 = a1 + 1;
LABEL_10:
    v11 = operator new(0x30uLL);
    v11[8] = **a4;
    *((_QWORD *)v11 + 5) = 0;
    sub_100003404(a1, (uint64_t)v9, v7, (uint64_t *)v11);
    return (uint64_t **)v11;
  }
  return v9;
}

uint64_t *sub_100003404(uint64_t **a1, uint64_t a2, uint64_t **a3, uint64_t *a4)
{
  uint64_t *v5;
  uint64_t *result;

  *a4 = 0;
  a4[1] = 0;
  a4[2] = a2;
  *a3 = a4;
  v5 = (uint64_t *)**a1;
  if (v5)
  {
    *a1 = v5;
    a4 = *a3;
  }
  result = sub_100003458(a1[1], a4);
  a1[2] = (uint64_t *)((char *)a1[2] + 1);
  return result;
}

uint64_t *sub_100003458(uint64_t *result, uint64_t *a2)
{
  uint64_t *v2;
  uint64_t *v3;
  uint64_t *v4;
  _BYTE *v5;
  int v6;
  uint64_t v7;
  int v8;
  uint64_t **v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;

  *((_BYTE *)a2 + 24) = a2 == result;
  if (a2 != result)
  {
    do
    {
      v2 = (uint64_t *)a2[2];
      if (*((_BYTE *)v2 + 24))
        return result;
      v3 = (uint64_t *)v2[2];
      v4 = (uint64_t *)*v3;
      if ((uint64_t *)*v3 == v2)
      {
        v7 = v3[1];
        if (!v7 || (v8 = *(unsigned __int8 *)(v7 + 24), v5 = (_BYTE *)(v7 + 24), v8))
        {
          if ((uint64_t *)*v2 == a2)
          {
            v9 = (uint64_t **)a2[2];
          }
          else
          {
            v9 = (uint64_t **)v2[1];
            v10 = *v9;
            v2[1] = (uint64_t)*v9;
            if (v10)
            {
              v10[2] = (uint64_t)v2;
              v3 = (uint64_t *)v2[2];
            }
            v9[2] = v3;
            *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = v9;
            *v9 = v2;
            v2[2] = (uint64_t)v9;
            v3 = v9[2];
            v2 = (uint64_t *)*v3;
          }
          *((_BYTE *)v9 + 24) = 1;
          *((_BYTE *)v3 + 24) = 0;
          v13 = v2[1];
          *v3 = v13;
          if (v13)
            *(_QWORD *)(v13 + 16) = v3;
          v2[2] = v3[2];
          *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
          v2[1] = (uint64_t)v3;
          goto LABEL_27;
        }
      }
      else if (!v4 || (v6 = *((unsigned __int8 *)v4 + 24), v5 = v4 + 3, v6))
      {
        if ((uint64_t *)*v2 == a2)
        {
          v11 = a2[1];
          *v2 = v11;
          if (v11)
          {
            *(_QWORD *)(v11 + 16) = v2;
            v3 = (uint64_t *)v2[2];
          }
          a2[2] = (uint64_t)v3;
          *(_QWORD *)(v2[2] + 8 * (*(_QWORD *)v2[2] != (_QWORD)v2)) = a2;
          a2[1] = (uint64_t)v2;
          v2[2] = (uint64_t)a2;
          v3 = (uint64_t *)a2[2];
        }
        else
        {
          a2 = (uint64_t *)a2[2];
        }
        *((_BYTE *)a2 + 24) = 1;
        *((_BYTE *)v3 + 24) = 0;
        v2 = (uint64_t *)v3[1];
        v12 = *v2;
        v3[1] = *v2;
        if (v12)
          *(_QWORD *)(v12 + 16) = v3;
        v2[2] = v3[2];
        *(_QWORD *)(v3[2] + 8 * (*(_QWORD *)v3[2] != (_QWORD)v3)) = v2;
        *v2 = (uint64_t)v3;
LABEL_27:
        v3[2] = (uint64_t)v2;
        return result;
      }
      *((_BYTE *)v2 + 24) = 1;
      a2 = v3;
      *((_BYTE *)v3 + 24) = v3 == result;
      *v5 = 1;
    }
    while (v3 != result);
  }
  return result;
}

void sub_1000035F0(uint64_t a1, _QWORD *a2)
{
  if (a2)
  {
    sub_1000035F0(a1, *a2);
    sub_1000035F0(a1, a2[1]);
    operator delete(a2);
  }
}

uint64_t sub_100003630()
{
  qword_100008000 = (uint64_t)&qword_100008000;
  qword_100008008 = (uint64_t)&qword_100008000;
  qword_100008010 = 0;
  __cxa_atexit((void (*)(void *))sub_100002208, &qword_100008000, (void *)&_mh_execute_header);
  qword_100008028 = 0;
  qword_100008020 = 0;
  qword_100008018 = (uint64_t)&qword_100008020;
  return __cxa_atexit((void (*)(void *))sub_10000222C, &qword_100008018, (void *)&_mh_execute_header);
}

void sub_100003694()
{
  __assert_rtn("register_new_client_block_invoke", "IOAccelMemoryInfoCollector.cpp", 273, "target_pid_obj != NULL");
}

void sub_1000036BC()
{
  __assert_rtn("register_new_client_block_invoke", "IOAccelMemoryInfoCollector.cpp", 274, "xpc_get_type(target_pid_obj) == XPC_TYPE_UINT64");
}

void sub_1000036E4()
{
  __assert_rtn("handle_source_reply", "IOAccelMemoryInfoCollector.cpp", 119, "source_pid == xpc_connection_get_pid(xpc_dictionary_get_remote_connection(reply))");
}

void sub_10000370C()
{
  __assert_rtn("current_time", "IOAccelMemoryInfoCollector.cpp", 85, "r == KERN_SUCCESS");
}

void operator delete(void *__p)
{
  while (1)
    ;
}

void operator delete()
{
  while (1)
    ;
}

void *__cdecl operator new(size_t __sz)
{
  while (1)
    ;
}

void operator new()
{
  while (1)
    ;
}
