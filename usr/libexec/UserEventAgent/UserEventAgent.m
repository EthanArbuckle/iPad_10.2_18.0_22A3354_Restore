uint64_t sub_100000C74(uint64_t result, int a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  _OWORD v5[5];

  if (a2 == 1)
  {
    if (a4)
      sub_100002E3C(&v4, v5);
    return (*(uint64_t (**)(uint64_t, uint64_t, _QWORD, _QWORD))(*(_QWORD *)(result + 32) + 24))(2, a3, 0, *(_QWORD *)(*(_QWORD *)(result + 32) + 32));
  }
  else if (!a2)
  {
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD))(*(_QWORD *)(result + 32) + 24))(1, a3, a4, *(_QWORD *)(*(_QWORD *)(result + 32) + 32));
  }
  return result;
}

BOOL xpc_event_provider_token_fire(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return xpc_event_provider_token_fire_with_reply(a1, a2, a3, 0);
}

BOOL xpc_event_provider_token_set_state(uint64_t a1)
{
  uint64_t v2;
  _OWORD v3[5];

  if (!*(_QWORD *)(a1 + 16))
    sub_100002DD4(&v2, v3);
  return xpc_event_publisher_set_subscriber_keepalive() == 0;
}

BOOL xpc_event_provider_token_fire_with_reply(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  int v4;
  uint64_t v6;
  _OWORD v7[5];

  if (!*(_QWORD *)(a1 + 16))
    sub_100002DD4(&v6, v7);
  if (a4)
  {
    v4 = xpc_event_publisher_fire_with_reply();
  }
  else if (*(_BYTE *)(a1 + 48))
  {
    v4 = xpc_event_publisher_fire_noboost();
  }
  else
  {
    v4 = xpc_event_publisher_fire();
  }
  return v4 == 0;
}

void start(int a1, uint64_t a2)
{
  const char *v4;
  int v5;
  NSObject *v6;
  const char *v7;
  NSObject *global_queue;
  NSObject *v9;
  const char *v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  uint64_t v14;
  int v15;
  int *v16;
  char *v17;
  uint64_t v18;
  char *v19;
  NSObject *v20;
  uint64_t v21;
  char *__s1;
  uint64_t v23;
  _DWORD v24[2];
  __int16 v25;
  char *v26;
  uint8_t buf[16];
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;

  qword_100008040 = (uint64_t)os_log_create("com.apple.UserEventAgent", "Daemon");
  __s1 = 0;
  v23 = 0;
  if (setiopolicy_np(9, 0, 1))
  {
    v21 = 0;
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    *(_OWORD *)buf = 0u;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      v14 = 3;
    else
      v14 = 2;
    v15 = *__error();
    v16 = __error();
    v17 = strerror(*v16);
    v24[0] = 67109378;
    v24[1] = v15;
    v25 = 2082;
    v26 = v17;
    v18 = _os_log_send_and_compose_impl(v14, &v21, buf, 80, &_mh_execute_header, &_os_log_default, 16, "Error setting low space io policy: %d (%{public}s)", v24, 18);
    _os_crash_msg(v21, v18);
    __break(1u);
  }
  else
  {
    if (qword_100008070 != -1)
      dispatch_once(&qword_100008070, &stru_1000043B0);
    qword_100008048 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
    if (qword_100008048)
    {
      qword_100008050 = (uint64_t)objc_alloc_init((Class)NSMutableSet);
      if (!qword_100008050)
      {
        v12 = qword_100008040;
        if (!os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
          goto LABEL_35;
        *(_WORD *)buf = 0;
        v13 = "Failed to create a set.";
        goto LABEL_34;
      }
      CFBundleGetMainBundle();
      if (qword_100008078 != -1)
        dispatch_once(&qword_100008078, &stru_1000043D0);
      if (a1 < 4 || !byte_100008080)
      {
LABEL_23:
        vproc_swap_integer(0, 5, 0, &v23);
        if (!v23)
        {
          fwrite("This program is not meant to be run directly.\n", 0x2EuLL, 1uLL, __stderrp);
          goto LABEL_35;
        }
        vproc_swap_string(0, 6, 0, &__s1);
        if (__s1)
        {
          signal(15, (void (__cdecl *)(int))1);
          global_queue = dispatch_get_global_queue(21, 0);
          if (!global_queue)
          {
            v9 = qword_100008040;
            if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v10 = "Unable to get queue";
LABEL_31:
              _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, v10, buf, 2u);
              goto LABEL_32;
            }
            goto LABEL_32;
          }
          v11 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, global_queue);
          qword_100008088 = (uint64_t)v11;
          if (!v11)
          {
            v9 = qword_100008040;
            if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
            {
              *(_WORD *)buf = 0;
              v10 = "Unable to create dispatch source.";
              goto LABEL_31;
            }
LABEL_32:
            v12 = qword_100008040;
            if (!os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
              goto LABEL_35;
            *(_WORD *)buf = 0;
            v13 = "Failed to configure SIGTERM handler.";
            goto LABEL_34;
          }
          dispatch_source_set_event_handler(v11, &stru_1000043F0);
          dispatch_activate((dispatch_object_t)qword_100008088);
          if (&_CTTelephonyCenterGetDefault)
            CTTelephonyCenterGetDefault();
          sub_1000023B4(0);
          qword_100008068 = 0;
          sub_100001398(1);
          sub_100001398(0);
          v19 = __s1;
          if (strcmp(__s1, "LoginWindow"))
          {
            sub_1000023B4(1);
            v19 = __s1;
          }
          free(v19);

          v20 = qword_100008040;
          if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Starting runloop", buf, 2u);
          }
          -[NSRunLoop run](+[NSRunLoop currentRunLoop](NSRunLoop, "currentRunLoop"), "run");
LABEL_35:
          exit(1);
        }
        v12 = qword_100008040;
        if (!os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
          goto LABEL_35;
        *(_WORD *)buf = 0;
        v13 = "unable to determine session";
LABEL_34:
        _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, v13, buf, 2u);
        goto LABEL_35;
      }
      v4 = *(const char **)(a2 + 16);
      if (!strncmp(v4, "r", 2uLL))
      {
        v5 = a1 - 3;
        dword_100008058 = a1 - 3;
        byte_10000805C = 1;
        v6 = qword_100008040;
        if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v7 = "Running specific plugin in UserEventAgent";
LABEL_16:
          _os_log_debug_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, v7, buf, 2u);
LABEL_17:
          v5 = dword_100008058;
          qword_100008060 = a2 + 24;
          if (dword_100008058 < 1)
          {
LABEL_22:
            byte_10000805C = 0;
            byte_10000805D = 0;
            qword_100008060 = 0;
            goto LABEL_23;
          }
LABEL_20:
          if (byte_10000805C != 1 || v5 == 1)
            goto LABEL_23;
          goto LABEL_22;
        }
      }
      else
      {
        if (strncmp(v4, "d", 2uLL))
          goto LABEL_17;
        v5 = a1 - 3;
        dword_100008058 = a1 - 3;
        byte_10000805D = 1;
        v6 = qword_100008040;
        if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          v7 = "Not running some plugin in original UserEventAgent";
          goto LABEL_16;
        }
      }
      qword_100008060 = a2 + 24;
      goto LABEL_20;
    }
  }
  v12 = qword_100008040;
  if (!os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
    goto LABEL_35;
  *(_WORD *)buf = 0;
  v13 = "Failed to create a set.";
  goto LABEL_34;
}

void sub_100001398(int a1)
{
  CFLocaleRef v2;
  NSObject *v3;
  size_t i;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const char *string;
  id v10;
  unsigned __int8 v11;
  NSObject *v12;
  char *v13;
  NSObject *v14;
  uint64_t path;
  NSObject *v16;
  int v17;
  char v18;
  size_t v19;
  NSObject *v20;
  uint64_t v21;
  const char **v22;
  const char *v23;
  size_t v24;
  const char *v25;
  void *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  void *v30;
  const char *v31;
  char *v32;
  dispatch_block_t v33;
  void *v34;
  xpc_object_t value;
  void *v36;
  const char *v37;
  uint64_t (*v38)(const CFAllocatorRef, CFUUIDRef);
  CFUUIDRef v39;
  uint64_t v40;
  uint64_t v41;
  void (*v42)(uint64_t, _QWORD, _QWORD, uint64_t *);
  const __CFUUID *v43;
  CFUUIDBytes v44;
  NSObject *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  uint64_t v50;
  double v51;
  double v52;
  double v53;
  double v54;
  _QWORD *v55;
  uint64_t v56;
  NSObject *v57;
  NSObject *v58;
  NSObject *v59;
  uint64_t v60;
  uint64_t v61;
  NSObject *v62;
  const char *v63;
  NSObject *v64;
  const char *v65;
  const __CFLocale *v66;
  NSObject *group;
  glob_t v68;
  uint8_t v69;
  _BYTE v70[7];
  uint64_t v71;
  char v72[1024];
  _BYTE buf[24];
  void *v74;
  char *v75;
  void *v76;
  void *v77;

  memset(&v68, 0, sizeof(v68));
  v2 = CFLocaleCopyCurrent();
  v3 = dispatch_group_create();
  __snprintf_chk(v72, 0x400uLL, 0, 0x400uLL, "%s/%s/*.plugin", (const char *)&unk_1000035CD, "System/Library/UserEventPlugins");
  if (!glob(v72, 0, 0, &v68))
  {
    group = v3;
    v66 = v2;
    if (v68.gl_pathc)
    {
      for (i = 0; i < v68.gl_pathc; ++i)
      {
        v5 = xpc_bundle_create(v68.gl_pathv[i], 1);
        v6 = (void *)v5;
        if (!v5)
        {
          v12 = qword_100008040;
          if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
          {
            v13 = v68.gl_pathv[i];
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "failed to create bundle: %{public}s", buf, 0xCu);
          }
          continue;
        }
        v7 = (void *)xpc_bundle_copy_info_dictionary(v5);
        v8 = v7;
        if (!v7)
        {
          v14 = qword_100008040;
          if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
          {
            path = xpc_bundle_get_path(v6);
            *(_DWORD *)buf = 136446210;
            *(_QWORD *)&buf[4] = path;
            _os_log_error_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to copy info dictionary for bundle %{public}s", buf, 0xCu);
          }
          goto LABEL_55;
        }
        string = xpc_dictionary_get_string(v7, "CFBundleIdentifier");
        v10 = objc_msgSend(objc_alloc((Class)NSString), "initWithUTF8String:", string);
        v11 = objc_msgSend((id)qword_100008048, "containsObject:", v10);
        if (a1)
        {
          if ((v11 & 1) == 0)
            goto LABEL_17;
        }
        else if ((v11 & 1) != 0)
        {
          goto LABEL_17;
        }
        if (objc_msgSend((id)qword_100008050, "containsObject:", v10))
        {
          v16 = qword_100008040;
          v17 = 0;
          if (!os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
            goto LABEL_19;
          *(_DWORD *)buf = 136446210;
          *(_QWORD *)&buf[4] = string;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Not loading plugin with bundleID: %{public}s as it's already loaded.", buf, 0xCu);
LABEL_17:
          v17 = 0;
          goto LABEL_19;
        }
        objc_msgSend((id)qword_100008050, "addObject:", v10);
        v17 = 1;
LABEL_19:

        if (qword_100008078 != -1)
          dispatch_once(&qword_100008078, &stru_1000043D0);
        v18 = v17 ^ 1;
        if (!byte_100008080)
          v18 = 1;
        if ((v18 & 1) != 0)
          goto LABEL_35;
        if ((byte_10000805C & 1) == 0)
        {
          if (byte_10000805D == 1)
          {
            if (string)
            {
              v21 = dword_100008058;
              if (dword_100008058 >= 1)
              {
                v22 = (const char **)qword_100008060;
                while (1)
                {
                  v23 = *v22;
                  v24 = strlen(*v22);
                  if (!strncmp(string, *v22, v24 + 1))
                    break;
                  ++v22;
                  if (!--v21)
                    goto LABEL_35;
                }
                v58 = qword_100008040;
                if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 136446210;
                  *(_QWORD *)&buf[4] = v23;
                  _os_log_debug_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEBUG, "Blocked a plugin: %{public}s from running in the original UEA.", buf, 0xCu);
                }
                goto LABEL_54;
              }
            }
          }
LABEL_35:
          if (v17)
          {
            v25 = xpc_dictionary_get_string(v8, "XPCEventModuleInitializer");
            if (v25)
            {
              v26 = malloc_type_calloc(1uLL, 0x28uLL, 0xF0040D69E7C16uLL);
              *((_QWORD *)v26 + 1) = sub_100001EF0();
              v27 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
              v28 = dispatch_queue_attr_make_with_qos_class(v27, QOS_CLASS_UTILITY, 0);
              *((_QWORD *)v26 + 2) = dispatch_queue_create(string, v28);
              v29 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("%s UserEventAgent plugin"), string);
              *((_QWORD *)v26 + 3) = strdup((const char *)objc_msgSend(v29, "UTF8String"));
              *(_QWORD *)v26 = qword_100008068;
              qword_100008068 = (uint64_t)v26;
              v30 = dlsym(*((void **)v26 + 1), v25);
              if (v30)
              {
                v31 = (const char *)xpc_bundle_get_path(v6);
                v32 = strdup(v31);
                *(_QWORD *)buf = _NSConcreteStackBlock;
                *(_QWORD *)&buf[8] = 3221225472;
                *(_QWORD *)&buf[16] = sub_100001F70;
                v74 = &unk_100004410;
                v75 = v32;
                v76 = v26;
                v77 = v30;
                v33 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_DEFAULT, 0, buf);
                dispatch_group_async(group, *((dispatch_queue_t *)v26 + 2), v33);
                _Block_release(v33);
              }
              else
              {
                v57 = qword_100008040;
                if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
                {
                  v61 = xpc_bundle_get_path(v6);
                  *(_DWORD *)buf = 136446466;
                  *(_QWORD *)&buf[4] = v61;
                  *(_WORD *)&buf[12] = 2082;
                  *(_QWORD *)&buf[14] = v25;
                  _os_log_error_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_ERROR, "%{public}s: dlsym(%{public}s) failed", buf, 0x16u);
                }
              }

            }
            else
            {
              v71 = 0;
              v34 = sub_100001EF0();
              if (v34)
              {
                value = xpc_dictionary_get_value(v8, "CFPlugInFactories");
                v36 = value;
                if (value)
                {
                  if (xpc_get_type(value) == (xpc_type_t)&_xpc_type_dictionary)
                  {
                    v37 = xpc_dictionary_get_string(v36, "FB86416D-6164-2070-726F-70735C216EC0");
                    if (v37)
                    {
                      v38 = (uint64_t (*)(const CFAllocatorRef, CFUUIDRef))dlsym(v34, v37);
                      if (!v38)
                        goto LABEL_60;
                      v39 = CFUUIDGetConstantUUIDWithBytes(0, 0xFCu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
                      v40 = v38(kCFAllocatorDefault, v39);
                      v41 = v40;
                      if (!v40)
                        goto LABEL_60;
                      v42 = *(void (**)(uint64_t, _QWORD, _QWORD, uint64_t *))(*(_QWORD *)v40 + 8);
                      v43 = CFUUIDGetConstantUUIDWithBytes(0, 0xFDu, 0x86u, 0x41u, 0x6Du, 0x61u, 0x64u, 0x20u, 0x70u, 0x72u, 0x6Fu, 0x70u, 0x73u, 0x5Cu, 0x21u, 0x6Eu, 0xC0u);
                      v44 = CFUUIDGetUUIDBytes(v43);
                      v42(v41, *(_QWORD *)&v44.byte0, *(_QWORD *)&v44.byte8, &v71);
                      (*(void (**)(uint64_t))(*(_QWORD *)v41 + 24))(v41);
                      if (v71)
                      {
                        v45 = qword_100008040;
                        if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
                        {
                          v46 = xpc_bundle_get_path(v6);
                          *(_DWORD *)buf = 136446210;
                          *(_QWORD *)&buf[4] = v46;
                          _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Calling initializer for %{public}s", buf, 0xCu);
                        }
                        v47 = mach_absolute_time();
                        (*(void (**)(uint64_t))(*(_QWORD *)v71 + 32))(v71);
                        v48 = mach_absolute_time();
                        v49 = qword_100008040;
                        if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
                        {
                          v50 = xpc_bundle_get_path(v6);
                          v54 = sub_100002164(v48 - v47, v51, v52, v53);
                          *(_DWORD *)buf = 136446466;
                          *(_QWORD *)&buf[4] = v50;
                          *(_WORD *)&buf[12] = 2048;
                          *(double *)&buf[14] = v54;
                          _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Initializer for %{public}s finished (took %f seconds)", buf, 0x16u);
                        }
                        v55 = malloc_type_calloc(1uLL, 0x28uLL, 0xF0040D69E7C16uLL);
                        v56 = v71;
                        *v55 = qword_100008068;
                        v55[1] = v56;
                        qword_100008068 = (uint64_t)v55;
                      }
                      else
                      {
LABEL_60:
                        v59 = qword_100008040;
                        if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
                        {
                          v60 = xpc_bundle_get_path(v6);
                          *(_DWORD *)buf = 136446210;
                          *(_QWORD *)&buf[4] = v60;
                          _os_log_error_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "error: %{public}s does not support IUserEventAgent interface\n", buf, 0xCu);
                        }
                      }
                    }
                  }
                }
              }
            }
          }
          goto LABEL_54;
        }
        if (!string)
          goto LABEL_35;
        v19 = strlen(*(const char **)qword_100008060);
        if (!strncmp(string, *(const char **)qword_100008060, v19 + 1))
          goto LABEL_35;
        v20 = qword_100008040;
        if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEBUG))
          sub_100002920(&v69, v70, v20);
LABEL_54:
        xpc_release(v8);
LABEL_55:
        xpc_release(v6);
      }
    }
    v2 = v66;
    globfree(&v68);
    v3 = group;
  }
  v62 = qword_100008040;
  if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
  {
    if (a1)
      v63 = (const char *)&unk_1000035CD;
    else
      v63 = "non";
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v63;
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v72;
    _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Waiting for %{public}s system critical plugins to finish initializing from path: %{public}s", buf, 0x16u);
  }
  dispatch_group_wait(v3, 0xFFFFFFFFFFFFFFFFLL);
  v64 = qword_100008040;
  if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
  {
    if (a1)
      v65 = (const char *)&unk_1000035CD;
    else
      v65 = "non";
    *(_DWORD *)buf = 136446466;
    *(_QWORD *)&buf[4] = v65;
    *(_WORD *)&buf[12] = 2082;
    *(_QWORD *)&buf[14] = v72;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "All %{public}s system critical plugins finished initializing from path: %{public}s", buf, 0x16u);
  }
  dispatch_release(v3);
  if (v2)
    CFRelease(v2);
}

void sub_100001D0C(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, CFTypeRef cf)
{
  _Unwind_Resume(exception_object);
}

uint64_t xpc_event_module_get_queue(uint64_t a1)
{
  return *(_QWORD *)(a1 + 16);
}

asl_object_t xpc_event_module_get_aslclient(uint64_t a1)
{
  asl_object_t result;
  const char *label;

  result = *(asl_object_t *)(a1 + 32);
  if (!result)
  {
    label = dispatch_queue_get_label(*(dispatch_queue_t *)(a1 + 16));
    result = asl_open(label, "com.apple.XPCEventAgent", 0);
    *(_QWORD *)(a1 + 32) = result;
  }
  return result;
}

void sub_100001D8C(id a1)
{
  NSObject *v1;
  rlim_t rlim_cur;
  int v3;
  NSObject *v4;
  rlimit v5;
  uint8_t buf[4];
  rlim_t v7;
  __int16 v8;
  rlim_t v9;

  v5.rlim_cur = 0;
  v5.rlim_max = 0;
  if (getrlimit(8, &v5))
  {
    v1 = qword_100008040;
    if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
      sub_1000029F0(v1);
  }
  else
  {
    rlim_cur = v5.rlim_cur;
    if (v5.rlim_cur <= 0x9FF)
    {
      v5.rlim_cur = 2560;
      v3 = setrlimit(8, &v5);
      v4 = qword_100008040;
      if (v3)
      {
        if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
          sub_10000295C(rlim_cur, v4);
      }
      else if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134218240;
        v7 = rlim_cur;
        v8 = 2048;
        v9 = v5.rlim_cur;
        _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Successfully setrlimit(): Previous = %llu, Current limit = %llu", buf, 0x16u);
      }
    }
  }
}

void sub_100001EB0(id a1)
{
  byte_100008080 = os_variant_has_internal_diagnostics("com.apple.UserEventAgent");
}

void sub_100001ED4(id a1)
{
  xpc_transaction_exit_clean(a1);
  dispatch_source_cancel((dispatch_source_t)qword_100008088);
}

void *sub_100001EF0()
{
  const char *executable_path;
  void *result;

  executable_path = (const char *)xpc_bundle_get_executable_path();
  if (executable_path)
  {
    result = dlopen(executable_path, 5);
    if (result)
      return result;
    if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
      sub_100002AEC();
  }
  else if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
  {
    sub_100002A7C();
  }
  return 0;
}

void sub_100001F70(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  CFMutableArrayRef Mutable;
  CFMutableArrayRef v7;
  uint64_t v8;
  NSObject *v9;
  double v10;
  double v11;
  double v12;
  uint64_t v13;
  double v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  os_activity_scope_state_s v23;
  uint8_t buf[4];
  uint64_t v25;
  __int16 v26;
  double v27;

  v2 = qword_100008040;
  if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_INFO))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 136446210;
    v25 = v3;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Calling initializer for %{public}s", buf, 0xCu);
  }
  v4 = _os_activity_create((void *)&_mh_execute_header, *(const char **)(*(_QWORD *)(a1 + 40) + 24), (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  v23.opaque[0] = 0;
  v23.opaque[1] = 0;
  os_activity_scope_enter(v4, &v23);
  v5 = mach_absolute_time();
  Mutable = CFArrayCreateMutable(0, 0, 0);
  if (!Mutable)
  {
    v15 = qword_100008040;
    if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
      sub_100002B5C(v15, v16, v17, v18, v19, v20, v21, v22);
    exit(1);
  }
  v7 = Mutable;
  dispatch_queue_set_specific(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 40) + 16), off_100008038, Mutable, 0);
  (*(void (**)(_QWORD))(a1 + 48))(*(_QWORD *)(a1 + 40));
  v8 = mach_absolute_time();
  v9 = qword_100008040;
  if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_INFO))
  {
    v13 = *(_QWORD *)(a1 + 32);
    v14 = sub_100002164(v8 - v5, v10, v11, v12);
    *(_DWORD *)buf = 136446466;
    v25 = v13;
    v26 = 2048;
    v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Initializer for %{public}s finished (took %f seconds)", buf, 0x16u);
  }
  sub_100002260();
  dispatch_queue_set_specific(*(dispatch_queue_t *)(*(_QWORD *)(a1 + 40) + 16), off_100008038, 0, 0);
  CFRelease(v7);
  free(*(void **)(a1 + 32));
  os_activity_scope_leave(&v23);

}

double sub_100002164(unint64_t a1, double a2, double a3, double a4)
{
  if (qword_100008098 != -1)
    dispatch_once(&qword_100008098, &stru_100004430);
  LODWORD(a4) = HIDWORD(qword_100008090);
  LODWORD(a3) = qword_100008090;
  return (double)a1 * (double)*(unint64_t *)&a3 / (double)*(unint64_t *)&a4 / 1000000000.0;
}

void sub_1000021D4(id a1)
{
  NSObject *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  if (mach_timebase_info((mach_timebase_info_t)&qword_100008090))
  {
    v1 = qword_100008040;
    if (os_log_type_enabled((os_log_t)qword_100008040, OS_LOG_TYPE_ERROR))
      sub_100002B90(v1, v2, v3, v4, v5, v6, v7, v8);
    qword_100008090 = (uint64_t)&_mh_execute_header;
  }
}

void sub_10000223C(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_error_impl(a1, v9, OS_LOG_TYPE_ERROR, a4, &a9, 0xCu);
}

void sub_100002250(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_error_impl(a1, a2, OS_LOG_TYPE_ERROR, a4, &a9, 2u);
}

void sub_100002260()
{
  const __CFArray *specific;
  const __CFArray *v1;
  CFTypeID TypeID;
  CFIndex Count;
  CFIndex v4;
  CFIndex i;
  uint64_t *ValueAtIndex;
  uint64_t *v7;
  uint64_t v8;
  uint8_t buf[4];
  uint64_t v10;

  specific = (const __CFArray *)dispatch_get_specific(off_100008038);
  if (specific && (v1 = specific, TypeID = CFArrayGetTypeID(), TypeID == CFGetTypeID(v1)))
  {
    Count = CFArrayGetCount(v1);
    if (Count >= 1)
    {
      v4 = Count;
      for (i = 0; i != v4; ++i)
      {
        ValueAtIndex = (uint64_t *)CFArrayGetValueAtIndex(v1, i);
        if (ValueAtIndex)
        {
          v7 = ValueAtIndex;
          if (ValueAtIndex[2])
          {
            xpc_event_publisher_activate();
            if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
            {
              v8 = *v7;
              *(_DWORD *)buf = 136315138;
              v10 = v8;
              _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Successfully activated the xpc_provider with name: %s", buf, 0xCu);
            }
          }
        }
      }
    }
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
  {
    sub_100002BC4();
  }
}

void sub_1000023B4(int a1)
{
  int v2;
  uint64_t i;

  os_unfair_lock_lock_with_options(&stru_1000080A0, 0x10000);
  v2 = dword_1000080A4;
  dword_1000080A4 = a1;
  if (v2 != a1)
  {
    if (a1 == 1)
    {
      for (i = qword_1000080A8; i; i = *(_QWORD *)(i + 40))
        xpc_event_publisher_activate(*(_QWORD *)(i + 16));
    }
    else if (!a1)
    {
      sub_100002C08();
    }
  }
  os_unfair_lock_unlock(&stru_1000080A0);
}

_BYTE *xpc_event_provider_create(const char *a1, uint64_t a2, uint64_t a3)
{
  _BYTE *v6;
  char *v7;
  const char *v8;
  NSObject *v9;
  NSObject *v10;
  dispatch_queue_t v11;
  uint64_t v12;
  __CFArray *specific;
  __CFArray *v14;
  CFTypeID TypeID;
  uint64_t v16;
  _QWORD v18[5];
  __int128 v19;
  uint64_t (*v20)(uint64_t, int, uint64_t, uint64_t);
  void *v21;
  _BYTE *v22;

  v6 = malloc_type_calloc(1uLL, 0x38uLL, 0x10B0040BE157AC1uLL);
  if (v6)
  {
    v7 = strdup(a1);
    *(_QWORD *)v6 = v7;
    if (!v7)
      sub_100002C20(v18, &v19);
    v8 = v7;
    if (!strcmp(v7, "com.apple.cts")
      || !strcmp(v8, "com.apple.distnoted.matching")
      || !strcmp(v8, "com.apple.xpc.activity"))
    {
      v6[48] = 1;
    }
    v9 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v10 = dispatch_queue_attr_make_with_qos_class(v9, QOS_CLASS_UTILITY, 0);
    v11 = dispatch_queue_create(v8, v10);
    *((_QWORD *)v6 + 1) = v11;
    if (!v11)
      sub_100002C88(v18, &v19);
    *((_QWORD *)v6 + 3) = a2;
    if (!a2)
      sub_100002CF0(v18, &v19);
    *((_QWORD *)v6 + 4) = a3;
    *((_QWORD *)v6 + 2) = xpc_event_publisher_create(*(_QWORD *)v6, v11);
    *(_QWORD *)&v19 = _NSConcreteStackBlock;
    *((_QWORD *)&v19 + 1) = 0x40000000;
    v20 = sub_100000C74;
    v21 = &unk_100004450;
    v22 = v6;
    xpc_event_publisher_set_handler();
    v12 = *((_QWORD *)v6 + 2);
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 0x40000000;
    v18[2] = sub_1000026A0;
    v18[3] = &unk_100004470;
    v18[4] = v6;
    xpc_event_publisher_set_error_handler(v12, v18);
    os_unfair_lock_lock_with_options(&stru_1000080A0, 0x10000);
    *((_QWORD *)v6 + 5) = qword_1000080A8;
    qword_1000080A8 = (uint64_t)v6;
    if (dword_1000080A4 == 1)
      xpc_event_publisher_activate(*((_QWORD *)v6 + 2));
    os_unfair_lock_unlock(&stru_1000080A0);
    specific = (__CFArray *)dispatch_get_specific(off_100008038);
    if (specific && (v14 = specific, TypeID = CFArrayGetTypeID(), TypeID == CFGetTypeID(v14)))
    {
      CFArrayAppendValue(v14, v6);
    }
    else
    {
      v16 = *(_QWORD *)v6;
      if (strncmp("com.apple.bonjour.events", *(const char **)v6, 0x19uLL)
        && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT))
      {
        sub_100002D58(v16);
      }
    }
  }
  return v6;
}

uint64_t xpc_event_provider_get_queue(uint64_t a1)
{
  return *(_QWORD *)(a1 + 8);
}

void sub_1000026A0(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v8;
  __int16 v9;
  int v10;
  __int16 v11;
  uint64_t v12;
  _OWORD v13[5];
  uint64_t v14;

  v14 = 0;
  memset(v13, 0, sizeof(v13));
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    v4 = 3;
  else
    v4 = 2;
  v5 = **(_QWORD **)(a1 + 32);
  v7 = 136315650;
  v8 = v5;
  v9 = 1024;
  v10 = a2;
  v11 = 2080;
  v12 = xpc_strerror(a2);
  v6 = _os_log_send_and_compose_impl(v4, &v14, v13, 80, &_mh_execute_header, &_os_log_default, 16, "error on event stream %s: %d - %s", (const char *)&v7, 28);
  _os_crash_msg(v14, v6);
  __break(1u);
}

uint64_t sub_100002774(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, const char *a8)
{
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;

  return _os_log_send_and_compose_impl(a1, v9, v8, 80, a5, v10, 16, a8);
}

double sub_10000278C(_QWORD *a1, _OWORD *a2)
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

uint64_t sub_1000027C8(uint64_t a1)
{
  _QWORD *v1;

  return _os_crash_msg(*v1, a1);
}

BOOL sub_1000027D4()
{
  NSObject *v0;

  return os_log_type_enabled(v0, OS_LOG_TYPE_ERROR);
}

_BYTE *UserEventAgentRegisterForLaunchEvents(const char *a1, uint64_t a2, uint64_t a3)
{
  _QWORD *v6;

  v6 = malloc_type_malloc(0x10uLL, 0x80040803F642BuLL);
  *v6 = a2;
  v6[1] = a3;
  return xpc_event_provider_create(a1, (uint64_t)sub_100002838, (uint64_t)v6);
}

void sub_100002838(uint64_t a1, uint64_t a2, const void *a3, uint64_t a4)
{
  uint64_t v6;
  CFNumberRef v7;
  uint64_t valuePtr;

  valuePtr = a2;
  if (a1 == 1)
    v6 = 1;
  else
    v6 = 2;
  v7 = CFNumberCreate(kCFAllocatorDefault, kCFNumberLongLongType, &valuePtr);
  if (a3)
    a3 = (const void *)_CFXPCCreateCFObjectFromXPCObject(a3);
  (*(void (**)(uint64_t, CFNumberRef, const void *, _QWORD))a4)(v6, v7, a3, *(_QWORD *)(a4 + 8));
  CFRelease(v7);
  if (a3)
    CFRelease(a3);
}

uint64_t UserEventAgentSetLaunchEventState(uint64_t a1, CFNumberRef number)
{
  uint64_t result;
  uint64_t valuePtr;

  valuePtr = 0;
  result = CFNumberGetValue(number, kCFNumberLongLongType, &valuePtr);
  if ((_DWORD)result)
    return xpc_event_provider_token_set_state(a1);
  return result;
}

void sub_100002920(uint8_t *buf, _BYTE *a2, os_log_t log)
{
  *buf = 0;
  *a2 = 0;
  _os_log_debug_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_DEBUG, "Blocked a plugin from running in case of isolated.", buf, 2u);
}

void sub_10000295C(uint64_t a1, NSObject *a2)
{
  int v4;
  _DWORD v5[2];
  __int16 v6;
  uint64_t v7;

  v4 = *__error();
  v5[0] = 67109376;
  v5[1] = v4;
  v6 = 2048;
  v7 = a1;
  _os_log_error_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_ERROR, "Failed to setrlimit(): %{errno}d. Current limit: %llu", (uint8_t *)v5, 0x12u);
  sub_100002230();
}

void sub_1000029F0(NSObject *a1)
{
  int v2;
  _DWORD v3[2];

  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_error_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_ERROR, "Failed to getrlimit: %{errno}d", (uint8_t *)v3, 8u);
}

void sub_100002A7C()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  xpc_bundle_get_path();
  sub_10000223C((void *)&_mh_execute_header, v0, v1, "%{public}s: missing executable", v2, v3, v4, v5, 2u);
  sub_100002230();
}

void sub_100002AEC()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  dlerror();
  sub_10000223C((void *)&_mh_execute_header, v0, v1, "%{public}s", v2, v3, v4, v5, 2u);
  sub_100002230();
}

void sub_100002B5C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002250((void *)&_mh_execute_header, a1, a3, "Failed to allocate an array.", a5, a6, a7, a8, 0);
}

void sub_100002B90(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002250((void *)&_mh_execute_header, a1, a3, "failed to get timebase info", a5, a6, a7, a8, 0);
}

void sub_100002BC4()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to activate xpc_provider immediately after initializer returned. Context corrupted.", v0, 2u);
}

void sub_100002C08()
{
  _os_crash("active->inactive transition is not supported");
  __break(1u);
}

void sub_100002C20(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_10000278C(a1, a2);
  sub_1000027D4();
  sub_1000027AC();
  v8 = sub_100002774(v2, v3, v4, v5, (uint64_t)&_mh_execute_header, v6, v7, "assertion failure: \"sys->name\" -> %lld");
  sub_1000027C8(v8);
  __break(1u);
}

void sub_100002C88(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_10000278C(a1, a2);
  sub_1000027D4();
  sub_1000027AC();
  v8 = sub_100002774(v2, v3, v4, v5, (uint64_t)&_mh_execute_header, v6, v7, "assertion failure: \"sys->queue\" -> %lld");
  sub_1000027C8(v8);
  __break(1u);
}

void sub_100002CF0(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_10000278C(a1, a2);
  sub_1000027D4();
  sub_1000027AC();
  v8 = sub_100002774(v2, v3, v4, v5, (uint64_t)&_mh_execute_header, v6, v7, "assertion failure: \"sys->callback\" -> %lld");
  sub_1000027C8(v8);
  __break(1u);
}

void sub_100002D58(uint64_t a1)
{
  int v1;
  uint64_t v2;

  v1 = 136315138;
  v2 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_FAULT, "Failed to set the monitor (%s) in the current queue's context.", (uint8_t *)&v1, 0xCu);
}

void sub_100002DD4(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_10000278C(a1, a2);
  sub_1000027D4();
  sub_1000027AC();
  v8 = sub_100002774(v2, v3, v4, v5, (uint64_t)&_mh_execute_header, v6, v7, "assertion failure: \"sys->publisher != ((void *)0)\" -> %lld");
  sub_1000027C8(v8);
  __break(1u);
}

void sub_100002E3C(_QWORD *a1, _OWORD *a2)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __CFArray *v9;
  const void *v10;

  sub_10000278C(a1, a2);
  sub_1000027D4();
  sub_1000027AC();
  v8 = sub_100002774(v2, v3, v4, v5, (uint64_t)&_mh_execute_header, v6, v7, "assertion failure: \"descriptor == ((void *)0)\" -> %lld");
  v9 = (__CFArray *)sub_1000027C8(v8);
  __break(1u);
  CFArrayAppendValue(v9, v10);
}

id objc_msgSend_UTF8String(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "UTF8String");
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_containsObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "containsObject:");
}

id objc_msgSend_currentRunLoop(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "currentRunLoop");
}

id objc_msgSend_initWithFormat_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithFormat:");
}

id objc_msgSend_initWithUTF8String_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "initWithUTF8String:");
}

id objc_msgSend_run(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "run");
}
