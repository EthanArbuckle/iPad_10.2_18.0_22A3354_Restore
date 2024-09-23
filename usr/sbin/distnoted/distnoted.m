void sub_100001B2C(uint64_t a1, xpc_object_t object)
{
  char *v4;
  xpc_object_t reply;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  _xpc_connection_s *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    if (xpc_dictionary_get_BOOL(object, "com.apple.NSXPC.msg_needs_ack"))
    {
      xpc_dictionary_set_value(object, "com.apple.NSXPC.msg_needs_ack", 0);
      reply = xpc_dictionary_create_reply(object);
      if (reply)
      {
        v6 = reply;
        xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
        xpc_release(v6);
      }
    }
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
    if (v7)
      (*(void (**)(uint64_t, xpc_object_t))(v7 + 16))(v7, object);
  }
  else if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_error)
  {
    if (object == &_xpc_error_connection_invalid)
    {
      ++*(_DWORD *)(*(_QWORD *)(a1 + 40) + 52);
      v8 = *(_QWORD *)(a1 + 40);
      v9 = *(void **)(v8 + 8);
      if (v9)
      {
        xpc_release(v9);
        v8 = *(_QWORD *)(a1 + 40);
      }
      *(_QWORD *)(v8 + 8) = 0;
      v10 = objc_msgSend(*(id *)(a1 + 40), "__invalidate");
      v16 = 0u;
      v17 = 0u;
      v18 = 0u;
      v19 = 0u;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v17;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v17 != v13)
              objc_enumerationMutation(v10);
            (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i) + 16))();
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        }
        while (v12);
      }

    }
    else if (object == &_xpc_error_connection_interrupted)
    {
      if ((*(_DWORD *)(a1 + 48) & 0xFFFFFFFE) == 4)
      {
        v15 = *(_xpc_connection_s **)(*(_QWORD *)(a1 + 40) + 8);
        if (v15)
          xpc_connection_cancel(v15);
      }
    }
    else if (object == &_xpc_error_termination_imminent)
    {
      objc_msgSend(*(id *)(a1 + 40), "__terminationImminent");
      CFLog(6, CFSTR("Connection %p received termination imminent"));
    }
    else
    {
      v4 = xpc_copy_description(object);
      CFLog(3, CFSTR("Unknown or mysterious error received: %s"));
      if (v4)
        free(v4);
    }
  }
  else
  {
    __break(1u);
  }
}

void sub_100001E14(uint64_t a1, _xpc_connection_s *object)
{
  char *v4;
  BOOL v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _QWORD v20[6];
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  void (*v24)(uint64_t, uint64_t);
  void (*v25)(uint64_t);
  uint64_t v26;
  _BYTE v27[128];

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24);
    v21 = 0;
    v22 = &v21;
    v23 = 0x3052000000;
    v24 = sub_100003150;
    v25 = sub_100004730;
    v26 = 0;
    v7 = (void *)(*(uint64_t (**)(void))(v6 + 16))();
    v22[5] = (uint64_t)v7;
    v8 = v7;
    if (v22[5])
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "addObject:");
      v9 = (void *)v22[5];
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_10000473C;
      v20[3] = &unk_100008520;
      v20[4] = *(_QWORD *)(a1 + 32);
      v20[5] = &v21;
      objc_msgSend(v9, "addInvalidationHandler:", v20);
      objc_msgSend((id)v22[5], "start:", *(_QWORD *)(a1 + 40));

    }
    else
    {
      xpc_connection_cancel(object);
    }
    _Block_object_dispose(&v21, 8);
  }
  else
  {
    if (xpc_get_type(object) != (xpc_type_t)&_xpc_type_error)
    {
      v4 = xpc_copy_description(object);
      v5 = v4 == 0;
      CFLog(3, CFSTR("Error: Received mysterious event type: %s"));
LABEL_4:
      if (!v5)
        free(v4);
      return;
    }
    if (object != (_xpc_connection_s *)&_xpc_error_connection_invalid)
    {
      if (object == (_xpc_connection_s *)&_xpc_error_termination_imminent)
        return;
      v4 = xpc_copy_description(object);
      v5 = v4 == 0;
      CFLog(3, CFSTR("Unknown or mysterious error received: %s"));
      goto LABEL_4;
    }
    ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 52);
    v10 = *(_QWORD *)(a1 + 32);
    v11 = *(void **)(v10 + 8);
    if (v11)
    {
      xpc_release(v11);
      v10 = *(_QWORD *)(a1 + 32);
    }
    *(_QWORD *)(v10 + 8) = 0;
    v12 = objc_msgSend(*(id *)(a1 + 32), "__invalidate");
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(_QWORD *)v17 != v14)
            objc_enumerationMutation(v12);
          (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i) + 16))();
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v16, v27, 16);
      }
      while (v13);
    }

  }
}

void sub_100002108(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

ClientOfLocalNoteServer *sub_100002128(uint64_t a1, uint64_t a2)
{
  return -[ClientOfLocalNoteServer initWithClientConnection:configuration:]([ClientOfLocalNoteServer alloc], "initWithClientConnection:configuration:", a2, *(_QWORD *)(a1 + 32));
}

void sub_100002354(uint64_t a1, void *a2)
{
  id *v4;
  uint64_t v5;
  const void *v6;
  const char *string;
  const char *v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  const char *v12;
  const char *v13;
  CFStringRef v14;
  CFStringRef v15;
  xpc_object_t value;
  void *v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  id v23;
  void *v24;
  const __CFString *v25;
  const __CFString *v26;
  uint64_t v27;
  uint64_t uint64;
  NSObject *v29;
  int v30;
  char v31;
  uint64_t v32;
  _QWORD v33[5];
  _QWORD applier[5];
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint8_t buf[4];
  CFStringRef v40;
  __int16 v41;
  CFStringRef v42;
  __int16 v43;
  uint64_t v44;
  __int16 v45;
  int v46;
  _BYTE v47[128];

  v4 = (id *)(a1 + 32);
  if (objc_msgSend(*(id *)(a1 + 32), "isLoginWindow"))
  {
    v5 = _CFXPCCreateCFObjectFromXPCObject(a2);
    if (v5)
    {
      v6 = (const void *)v5;
      v32 = v5;
      CFLog(4, CFSTR("loginwindow msg = %@"));
      CFRelease(v6);
    }
  }
  string = xpc_dictionary_get_string(a2, "method");
  if (string)
  {
    v8 = string;
    if (strcmp(string, "post"))
    {
      if (strcmp(v8, "register"))
      {
        if (!strcmp(v8, "unregister"))
        {
          if (xpc_dictionary_get_uint64(a2, "version") == 1)
          {
            value = xpc_dictionary_get_value(a2, "tokens");
            if (value)
            {
              v17 = value;
              -[ClientOfLocalNoteServer forward:](+[ClientOfLocalNoteServer monitor](ClientOfLocalNoteServer, "monitor"), "forward:", a2);
              applier[0] = _NSConcreteStackBlock;
              applier[1] = 3221225472;
              applier[2] = sub_100004104;
              applier[3] = &unk_100008488;
              applier[4] = *v4;
              xpc_array_apply(v17, applier);
            }
          }
        }
        else if (!strcmp(v8, "suspend"))
        {
          if (xpc_dictionary_get_uint64(a2, "version") == 1)
            *((_BYTE *)*v4 + 40) = 1;
        }
        else if (!strcmp(v8, "unsuspend"))
        {
          if (xpc_dictionary_get_uint64(a2, "version") == 1)
          {
            *((_BYTE *)*v4 + 40) = 0;
            v23 = *v4;
            v24 = (void *)*((_QWORD *)*v4 + 4);
            v33[0] = _NSConcreteStackBlock;
            v33[1] = 3221225472;
            v33[2] = sub_100004204;
            v33[3] = &unk_100008488;
            v33[4] = v23;
            xpc_array_apply(v24, v33);
            xpc_release(*((xpc_object_t *)*v4 + 4));
            *((_QWORD *)*v4 + 4) = xpc_array_create(0, 0);
          }
        }
        else if (!strcmp(v8, "monitor"))
        {
          objc_msgSend(*v4, "startMonitoring");
        }
        else if (!strcmp(v8, "dump"))
        {
          objc_msgSend(*v4, "dump");
        }
        return;
      }
      if (xpc_dictionary_get_uint64(a2, "version") != 1)
        return;
      -[ClientOfLocalNoteServer forward:](+[ClientOfLocalNoteServer monitor](ClientOfLocalNoteServer, "monitor"), "forward:", a2);
      v11 = xpc_dictionary_get_string(a2, "name");
      v12 = xpc_dictionary_get_string(a2, "object");
      v13 = v12;
      if (v11)
      {
        v14 = CFStringCreateWithCString(kCFAllocatorSystemDefault, v11, 0x8000100u);
        if (v13)
          goto LABEL_24;
      }
      else
      {
        v14 = (CFStringRef)kCFNotificationAnyName;
        if (v12)
        {
LABEL_24:
          v15 = CFStringCreateWithCString(kCFAllocatorSystemDefault, v13, 0x8000100u);
          if (!v14)
            goto LABEL_53;
LABEL_43:
          if (v15)
          {
            v25 = (const __CFString *)kCFNotificationAnyName;
            if (CFEqual(v14, kCFNotificationAnyName))
            {
              CFRelease(v14);
              v14 = v25;
            }
            v26 = (const __CFString *)kCFNotificationAnyObject;
            if (CFEqual(v15, kCFNotificationAnyObject))
            {
              CFRelease(v15);
              v15 = v26;
            }
            v27 = *((_QWORD *)*v4 + 8);
            if (v27 < 0 || sandbox_check_by_reference(v27) || v14 != v25 || v15 != v26)
            {
              uint64 = xpc_dictionary_get_uint64(a2, "token");
              if (qword_10000CDF8 != -1)
                dispatch_once(&qword_10000CDF8, &stru_100008588);
              v29 = qword_10000CE00;
              if (os_log_type_enabled((os_log_t)qword_10000CE00, OS_LOG_TYPE_DEFAULT))
              {
                v30 = *((_DWORD *)*v4 + 18);
                *(_DWORD *)buf = 138544130;
                v40 = v14;
                v41 = 2114;
                v42 = v15;
                v43 = 2048;
                v44 = uint64;
                v45 = 1024;
                v46 = v30;
                _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "register name: %{public}@ object: %{public}@ token: %llx pid: %d", buf, 0x26u);
              }
              v31 = xpc_dictionary_get_uint64(a2, "options");
              CFXNotificationRegistrarAddRemoteToken(*((_QWORD *)*v4 + 3), uint64, v14, v15, kCFNotificationAnyObserver, v31 & 0xF | 0x20000, kCFXNotificationEmptyHandler[0], kCFXNotificationEmptyHandler[1], v32);
              CFRelease(v14);
              CFRelease(v15);
            }
            else
            {
              CFRelease(v25);
              CFRelease(v26);
            }
            return;
          }
LABEL_53:
          if (v14)
            CFRelease(v14);
          if (v15)
            CFRelease(v15);
          return;
        }
      }
      v15 = (CFStringRef)kCFNotificationAnyName;
      if (!v14)
        goto LABEL_53;
      goto LABEL_43;
    }
    if (xpc_dictionary_get_uint64(a2, "version") == 1)
    {
      if (xpc_dictionary_get_value(a2, "userinfo")
        && (v9 = *((_QWORD *)*v4 + 8), (v9 & 0x8000000000000000) == 0)
        && sandbox_check_by_reference(v9))
      {
        if (qword_10000CDE8 != -1)
          dispatch_once(&qword_10000CDE8, &stru_100008568);
        v10 = qword_10000CDF0;
        if (os_log_type_enabled((os_log_t)qword_10000CDF0, OS_LOG_TYPE_ERROR))
          sub_100005140((id *)(a1 + 32), v10);
      }
      else
      {
        v18 = objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "allClients", v32);
        v37 = 0u;
        v38 = 0u;
        v35 = 0u;
        v36 = 0u;
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
        if (v19)
        {
          v20 = v19;
          v21 = *(_QWORD *)v36;
          do
          {
            for (i = 0; i != v20; i = (char *)i + 1)
            {
              if (*(_QWORD *)v36 != v21)
                objc_enumerationMutation(v18);
              objc_msgSend(*(id *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i), "handlePost:", a2);
            }
            v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v35, v47, 16);
          }
          while (v20);
        }
      }
    }
  }
}

void sub_100003150(uint64_t a1, uint64_t a2)
{
  _Block_object_assign((void *)(a1 + 40), *(const void **)(a2 + 40), 131);
}

id sub_100003748(NSObject *a1, uint64_t a2)
{
  id v3;
  id result;
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  int v15;
  id obj;
  uint8_t v17;
  char v18[15];
  uint8_t v19;
  char v20[7];
  _QWORD v21[5];
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  int v29;
  _BYTE v30[128];

  v3 = objc_msgSend(*(id *)(a2 + 8), "allClients");
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  obj = v3;
  result = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
  if (result)
  {
    v5 = result;
    v6 = *(_QWORD *)v23;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)v7);
        if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
        {
          v14 = objc_msgSend(objc_msgSend((id)v8, "processName"), "UTF8String");
          v15 = *(_DWORD *)(v8 + 72);
          *(_DWORD *)buf = 136446466;
          v27 = v14;
          v28 = 1024;
          v29 = v15;
          _os_log_debug_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "Registrations: <%{public}s (%d)>", buf, 0x12u);
        }
        v9 = *(_QWORD *)(v8 + 24);
        v21[0] = _NSConcreteStackBlock;
        v21[1] = 3221225472;
        v21[2] = sub_100003A0C;
        v21[3] = &unk_1000083E8;
        v21[4] = a1;
        CFXNotificationRegistrarEnumerate(v9, v21);
        if (xpc_array_get_count(*(xpc_object_t *)(v8 + 32)))
        {
          v10 = _CFXPCCreateCFObjectFromXPCObject(*(_QWORD *)(v8 + 32));
          if (v10)
          {
            v11 = (void *)v10;
            if (os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138543362;
              v27 = v11;
              _os_log_debug_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_DEBUG, "    Message Queue: %{public}@", buf, 0xCu);
            }
            CFRelease(v11);
          }
        }
        v12 = *(_QWORD *)(v8 + 64);
        if ((v12 & 0x8000000000000000) == 0)
        {
          if (sandbox_check_by_reference(v12) && os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
            sub_100005070(&v19, v20, a1);
          v13 = *(_QWORD *)(v8 + 64);
          if ((v13 & 0x8000000000000000) == 0
            && !sandbox_check_by_reference(v13)
            && os_log_type_enabled(a1, OS_LOG_TYPE_DEBUG))
          {
            sub_100005040(&v17, v18, a1);
          }
        }
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      result = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      v5 = result;
    }
    while (result);
  }
  return result;
}

void sub_100003A0C(uint64_t a1, uint64_t *a2)
{
  NSObject *v3;

  v3 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    sub_1000050A0(a2, v3);
}

void sub_100003CD0(uint64_t a1, uint64_t a2)
{
  xpc_object_t v4;
  void *v5;

  v4 = xpc_dictionary_create(0, 0, 0);
  if (*(_QWORD *)a2)
    xpc_dictionary_set_string(v4, "name", (const char *)objc_msgSend(*(id *)a2, "UTF8String"));
  v5 = *(void **)(a2 + 8);
  if (v5)
    xpc_dictionary_set_string(v4, "object", (const char *)objc_msgSend(v5, "UTF8String"));
  xpc_dictionary_set_int64(v4, "token", *(_QWORD *)(a2 + 48));
  xpc_dictionary_set_int64(v4, "options", *(_QWORD *)(a2 + 24));
  xpc_array_append_value(*(xpc_object_t *)(a1 + 32), v4);
  xpc_release(v4);
}

id sub_100003D84(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "invalidate");
}

void sub_100003D8C(id a1)
{
  CFLog(4, CFSTR("Interruption - exiting now."));
  exit(0);
}

char *sub_100003DAC(void *a1)
{
  const char *string;
  const char *v3;
  xpc_object_t value;
  char *v5;
  const char *v6;
  uint64_t uint64;
  char *v9;

  v9 = 0;
  string = xpc_dictionary_get_string(a1, "method");
  if (!string)
    goto LABEL_10;
  v3 = string;
  if (!strcmp(string, "post") || !strcmp(v3, "post_all"))
  {
    xpc_dictionary_get_uint64(a1, "options");
    xpc_dictionary_get_string(a1, "method");
    xpc_dictionary_get_uint64(a1, "version");
    xpc_dictionary_get_string(a1, "name");
    xpc_dictionary_get_string(a1, "object");
    asprintf(&v9, "[ %s v%llu '%s' '%s' %s ]");
  }
  else if (!strcmp(v3, "post_token") || !strcmp(v3, "register"))
  {
    xpc_dictionary_get_uint64(a1, "options");
    strcmp(v3, "register");
    xpc_dictionary_get_string(a1, "method");
    xpc_dictionary_get_uint64(a1, "version");
    xpc_dictionary_get_string(a1, "name");
    xpc_dictionary_get_string(a1, "object");
    xpc_dictionary_get_uint64(a1, "token");
    asprintf(&v9, "[ %s v%llu '%s' '%s' %s %llu ]");
  }
  else if (!strcmp(v3, "unregister"))
  {
    value = xpc_dictionary_get_value(a1, "tokens");
    v5 = xpc_copy_description(value);
    v6 = xpc_dictionary_get_string(a1, "method");
    uint64 = xpc_dictionary_get_uint64(a1, "version");
    asprintf(&v9, "[ %s v%llu %s ]", v6, uint64, v5);
    free(v5);
  }
  else
  {
    if (strcmp(v3, "ping") && strcmp(v3, "suspend") && strcmp(v3, "unsuspend"))
    {
LABEL_10:
      v9 = xpc_copy_description(a1);
      goto LABEL_15;
    }
    xpc_dictionary_get_string(a1, "method");
    xpc_dictionary_get_uint64(a1, "version");
    asprintf(&v9, "[ %s v%llu ]");
  }
LABEL_15:
  if (v9)
    return v9;
  else
    return "[ ??? ]";
}

uint64_t sub_100004104(uint64_t a1, int a2, xpc_object_t xuint)
{
  uint64_t value;
  NSObject *v5;
  int v6;
  int v8;
  uint64_t v9;
  __int16 v10;
  int v11;

  value = xpc_uint64_get_value(xuint);
  if (qword_10000CDF8 != -1)
    dispatch_once(&qword_10000CDF8, &stru_100008588);
  v5 = qword_10000CE00;
  if (os_log_type_enabled((os_log_t)qword_10000CE00, OS_LOG_TYPE_DEFAULT))
  {
    v6 = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 72);
    v8 = 134218240;
    v9 = value;
    v10 = 1024;
    v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "unregister token: %llx pid: %d", (uint8_t *)&v8, 0x12u);
  }
  CFXNotificationRegistrarRemoveRemoteToken(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), value);
  return 1;
}

uint64_t sub_100004204(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessage:", a3);
  return 1;
}

uint64_t sub_1000044F4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "sendMessage:", a3);
  return 1;
}

uint64_t sub_1000045BC(uint64_t a1, int a2, xpc_object_t xdict)
{
  const char *string;
  const char *v6;

  if (*(_QWORD *)(a1 + 48) != xpc_dictionary_get_uint64(xdict, "token")
    || (string = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "name")) == 0
    || strcmp(*(const char **)(a1 + 56), string)
    || (v6 = xpc_dictionary_get_string(*(xpc_object_t *)(a1 + 32), "object"), strcmp(*(const char **)(a1 + 64), v6)))
  {
    xpc_array_append_value(*(xpc_object_t *)(a1 + 40), xdict);
  }
  return 1;
}

_BYTE *sub_100004654(_BYTE *result)
{
  _BYTE *v1;
  _NSDNXPCServer *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[5];

  if ((*result & 6) != 0)
  {
    v1 = result;
    v2 = -[_NSDNXPCServer initWithConfiguration:]([_NSDNXPCServer alloc], "initWithConfiguration:", result);
    *((_QWORD *)v1 + 1) = v2;
    v3 = 32;
    if ((*(_QWORD *)v1 & 1) == 0)
      v3 = 40;
    -[_NSDNXPCServer setServiceName:](v2, "setServiceName:", *(_QWORD *)&v1[v3]);
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_100002128;
    v6[3] = &unk_1000084F8;
    v6[4] = v1;
    objc_msgSend(*((id *)v1 + 1), "setMakeNewClient:", v6);
    if ((*v1 & 1) != 0)
      objc_msgSend(*((id *)v1 + 1), "setPrivileged:", 1);
    objc_msgSend(*((id *)v1 + 1), "start:", *((_QWORD *)v1 + 10));
    v4 = *(_QWORD *)v1;
    result = objc_msgSend(*((id *)v1 + 1), "createEndpoint");
    v5 = 56;
    if ((v4 & 1) == 0)
      v5 = 64;
    *(_QWORD *)&v1[v5] = result;
  }
  return result;
}

void sub_100004730(uint64_t a1)
{
  _Block_object_dispose(*(const void **)(a1 + 40), 131);
}

id sub_10000473C(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "removeObjectIdenticalTo:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
}

void sub_100004750(id a1)
{
  qword_10000CDF0 = (uint64_t)os_log_create("com.apple.distnoted", "info");
}

void sub_10000477C(id a1)
{
  qword_10000CE00 = (uint64_t)os_log_create("com.apple.distnoted", "diagnostic");
}

void sub_1000047A8(void *a1, int a2, os_log_t log, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, a5, 2u);
}

uint64_t start()
{
  void *v0;
  NSObject *v1;
  NSObject *v2;
  time_t v4;
  char v5[50];

  mach_absolute_time();
  v4 = time(0);
  getuid();
  ctime_r(&v4, v5);
  v5[24] = 0;
  getpid();
  CFLog(4, CFSTR("# distnote server %s  absolute time: %.9f   civil time: %s   pid: %ld uid: %ld  root: %s"));
  v0 = objc_autoreleasePoolPush();
  qword_10000CD88 = 3;
  v1 = dispatch_workloop_create("com.apple.distnoted.work");
  qword_10000CDD8 = (uint64_t)dispatch_queue_create("com.apple.distnote.work.target", 0);
  dispatch_set_target_queue((dispatch_object_t)qword_10000CDD8, v1);
  sub_100004654(&qword_10000CD88);
  signal(30, (void (__cdecl *)(int))1);
  v2 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0x1EuLL, 0, 0);
  dispatch_source_set_event_handler(v2, &stru_1000085E8);
  dispatch_resume(v2);
  CFRunLoopRun();
  dispatch_release(v2);

  objc_autoreleasePoolPop(v0);
  getpid();
  CFLog(4, CFSTR("# exiting at end of run loop: distnote server %s  absolute time: %.9f   civil time: %s   pid: %ld uid: %ld  root: %s"));
  return 0;
}

void sub_100004980(id a1)
{
  if (qword_10000CE10 != -1)
    dispatch_once(&qword_10000CE10, &stru_100008608);
  sub_100003748(qword_10000CE08, (uint64_t)&qword_10000CD88);
}

void sub_1000049C8(id a1)
{
  qword_10000CE08 = (uint64_t)os_log_create("com.apple.distnoted.agent", "debug-info");
}

void sub_100005040(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1000047A8((void *)&_mh_execute_header, (int)a2, a3, "    Register-all Forbidden: true", a1);
}

void sub_100005070(uint8_t *a1, _BYTE *a2, NSObject *a3)
{
  *a1 = 0;
  *a2 = 0;
  sub_1000047A8((void *)&_mh_execute_header, (int)a2, a3, "    Broadcasting Forbidden: true", a1);
}

void sub_1000050A0(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  uint64_t v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  uint64_t v13;

  v2 = *a1;
  v3 = a1[1];
  v4 = a1[7];
  v5 = a1[3];
  v6 = 138544130;
  v7 = v2;
  v8 = 2114;
  v9 = v3;
  v10 = 2048;
  v11 = v4;
  v12 = 2048;
  v13 = v5;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "    name: %{public}@ object: %{public}@ token: %llu options: %lX", (uint8_t *)&v6, 0x2Au);
}

void sub_100005140(id *a1, NSObject *a2)
{
  id v4;
  int v5;
  int v6;
  id v7;
  __int16 v8;
  int v9;

  v4 = objc_msgSend(objc_msgSend(*a1, "processName"), "UTF8String");
  v5 = *((_DWORD *)*a1 + 18);
  v6 = 136446466;
  v7 = v4;
  v8 = 1026;
  v9 = v5;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "%{public}s (%{public}d) restricted from sending userInfo payloads due to sandboxing", (uint8_t *)&v6, 0x12u);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend___invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__invalidate");
}

id objc_msgSend___terminationImminent(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "__terminationImminent");
}

id objc_msgSend_addInvalidationHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addInvalidationHandler:");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_addTerminationImminentHandler_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addTerminationImminentHandler:");
}

id objc_msgSend_allClients(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allClients");
}

id objc_msgSend_copy(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copy");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_createEndpoint(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "createEndpoint");
}

id objc_msgSend_enqueuePost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "enqueuePost:");
}

id objc_msgSend_euid(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "euid");
}

id objc_msgSend_flushQueue(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "flushQueue");
}

id objc_msgSend_forward_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "forward:");
}

id objc_msgSend_handlePost_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "handlePost:");
}

id objc_msgSend_initWithClientConnection_configuration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithClientConnection:configuration:");
}

id objc_msgSend_initWithConfiguration_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithConfiguration:");
}

id objc_msgSend_initWithPeerConnection_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithPeerConnection:");
}

id objc_msgSend_initWithXPCConnection_type_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithXPCConnection:type:");
}

id objc_msgSend_invalidate(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidate");
}

id objc_msgSend_isLoginWindow(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "isLoginWindow");
}

id objc_msgSend_monitor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "monitor");
}

id objc_msgSend_postNotification_object_token_options_immediate_userInfo_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "postNotification:object:token:options:immediate:userInfo:");
}

id objc_msgSend_processName(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "processName");
}

id objc_msgSend_sendMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sendMessage:");
}

id objc_msgSend_setHandleMessage_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setHandleMessage:");
}

id objc_msgSend_setMakeNewClient_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMakeNewClient:");
}

id objc_msgSend_setMonitor_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setMonitor:");
}

id objc_msgSend_setPrivileged_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setPrivileged:");
}

id objc_msgSend_setServiceName_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setServiceName:");
}

id objc_msgSend_start_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "start:");
}
