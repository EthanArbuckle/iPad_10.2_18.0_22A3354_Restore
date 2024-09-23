void start()
{
  NSObject *v0;
  _xpc_connection_s *mach_service;
  _QWORD handler[5];

  xpc_track_activity();
  v0 = dispatch_queue_create("com.apple.tzlink", 0);
  mach_service = xpc_connection_create_mach_service("com.apple.tzlink", v0, 1uLL);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 0x40000000;
  handler[2] = sub_1000037B0;
  handler[3] = &unk_100004128;
  handler[4] = v0;
  xpc_connection_set_event_handler(mach_service, handler);
  xpc_connection_resume(mach_service);
  dispatch_main();
}

void sub_1000037B0(uint64_t a1, _xpc_connection_s *object)
{
  _QWORD handler[5];

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_connection)
  {
    xpc_connection_set_target_queue(object, *(dispatch_queue_t *)(a1 + 32));
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 0x40000000;
    handler[2] = sub_100003840;
    handler[3] = &unk_100004108;
    handler[4] = object;
    xpc_connection_set_event_handler(object, handler);
    xpc_connection_resume(object);
  }
}

void sub_100003840(uint64_t a1, xpc_object_t object)
{
  void *v4;
  void *v5;
  _BOOL4 value;
  const char *string;
  const char *v8;
  int v9;
  xpc_object_t reply;
  char *v11;
  char *v12;
  char *v13;
  stat v14;
  char v15[1024];

  if (xpc_get_type(object) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v4 = (void *)xpc_connection_copy_entitlement_value(*(_QWORD *)(a1 + 32), "com.apple.tzlink.allow");
    if (!v4 || (v5 = v4, value = xpc_BOOL_get_value(v4), xpc_release(v5), !value))
    {
      v9 = 1;
      goto LABEL_8;
    }
    string = xpc_dictionary_get_string(object, "tz");
    if (!string)
    {
      v9 = 22;
      goto LABEL_8;
    }
    v8 = string;
    if ((unint64_t)__strlcpy_chk(v15, "/var/db/timezone/zoneinfo", 1024, 1024) >= 0x400)
    {
      v9 = 63;
LABEL_8:
      reply = xpc_dictionary_create_reply(object);
      xpc_dictionary_set_uint64(reply, "error", v9);
      xpc_connection_send_message(*(xpc_connection_t *)(a1 + 32), reply);
      xpc_release(reply);
      return;
    }
    v11 = strdup(v8);
    *(_QWORD *)&v14.st_dev = v11;
    while (1)
    {
      v12 = strsep((char **)&v14, "/");
      if (!v12)
        break;
      v13 = v12;
      v9 = 22;
      if (!*v12 || *v12 == 46)
        goto LABEL_18;
      if ((unint64_t)__strlcat_chk(v15, "/", 1024, 1024) > 0x3FF
        || (unint64_t)__strlcat_chk(v15, v13, 1024, 1024) >= 0x400)
      {
        v9 = 63;
LABEL_18:
        free(v11);
        goto LABEL_8;
      }
    }
    free(v11);
    memset(&v14, 0, sizeof(v14));
    if (lstat(v15, &v14))
    {
      if (!*__error())
        goto LABEL_34;
      v9 = *__error();
      if (v9)
        goto LABEL_8;
LABEL_31:
      unlink("/var/db/timezone/localtime");
      if (!symlink(v15, "/var/db/timezone/localtime"))
      {
        notify_post("SignificantTimeChangeNotification");
        v9 = 0;
        goto LABEL_8;
      }
      if (*__error())
      {
        v9 = *__error();
        goto LABEL_8;
      }
LABEL_34:
      v9 = 14;
      goto LABEL_8;
    }
    if ((v14.st_mode & 0xF000) == 0x8000)
    {
      if (*(_QWORD *)&v14.st_uid)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          sub_100003B50();
      }
      else
      {
        if ((v14.st_mode & 0x1FF) == 0x1A4)
          goto LABEL_31;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
          sub_100003BCC();
      }
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
    {
      sub_100003C40((uint64_t)v15);
    }
    v9 = 2;
    goto LABEL_8;
  }
}

void sub_100003B50()
{
  __int16 v0;
  int v1;
  uint8_t v2[18];
  __int16 v3;
  int v4;

  sub_100003B30();
  v3 = v0;
  v4 = v1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "tzlink failed; \"%{public}s\" is owned by %d:%d",
    v2,
    0x18u);
  sub_100003B48();
}

void sub_100003BCC()
{
  uint8_t v0[24];

  sub_100003B30();
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "tzlink failed; \"%{public}s\" has access permissions %o",
    v0,
    0x12u);
  sub_100003B48();
}

void sub_100003C40(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 136446210;
  v2 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "tzlink failed; \"%{public}s\" is not a regular file",
    (uint8_t *)&v1,
    0xCu);
  sub_100003B48();
}
