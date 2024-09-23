void start()
{
  id v0;
  NSObject *v1;
  _xpc_connection_s *mach_service;
  dispatch_time_t v3;
  id v4;
  NSObject *v5;

  sub_1000013D4();
  v0 = sub_1000013FC();
  v1 = objc_claimAutoreleasedReturnValue(v0);
  mach_service = xpc_connection_create_mach_service("com.apple.hangtelemetryd", v1, 1uLL);

  xpc_connection_set_event_handler(mach_service, &stru_100004270);
  xpc_connection_activate(mach_service);
  v3 = dispatch_time(0, 10000000000);
  v4 = sub_1000013FC();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  dispatch_after(v3, v5, &stru_1000042B0);

  dispatch_main();
}

void sub_1000013D4()
{
  if (qword_100008098 != -1)
    dispatch_once(&qword_100008098, &stru_1000042D0);
}

id sub_1000013FC()
{
  if (qword_1000080B0 != -1)
    dispatch_once(&qword_1000080B0, &stru_100004310);
  return (id)qword_1000080A8;
}

void sub_10000143C(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  id v3;
  NSObject *v4;
  _xpc_connection_s *v5;
  id v6;
  NSObject *v7;
  _DWORD v8[2];

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_connection)
  {
    v3 = sub_10000291C();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = xpc_connection_get_pid(v2);
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "XPC: Client started new connection: pid %d", (uint8_t *)v8, 8u);
    }

    v5 = v2;
    v6 = sub_1000013FC();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    xpc_connection_set_target_queue(v5, v7);

    xpc_connection_set_event_handler(v5, &stru_100004330);
    xpc_connection_activate(v5);

  }
}

void sub_100001548(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_10000291C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Calling xpc_transaction_exit_clean() now", v3, 2u);
  }

  xpc_transaction_exit_clean();
}

void sub_1000015B0(id a1)
{
  dispatch_queue_global_t global_queue;
  NSObject *v2;
  dispatch_source_t v3;
  void *v4;

  global_queue = dispatch_get_global_queue(25, 0);
  v2 = objc_claimAutoreleasedReturnValue(global_queue);
  v3 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_signal, 0xFuLL, 0, v2);
  v4 = (void *)qword_1000080A0;
  qword_1000080A0 = (uint64_t)v3;

  dispatch_source_set_event_handler((dispatch_source_t)qword_1000080A0, &stru_1000042F0);
  dispatch_activate((dispatch_object_t)qword_1000080A0);
}

void sub_10000161C(id a1)
{
  id v1;
  NSObject *v2;
  uint8_t v3[16];

  v1 = sub_10000291C();
  v2 = objc_claimAutoreleasedReturnValue(v1);
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_INFO, "Received SIGTERM, exiting", v3, 2u);
  }

  exit(0);
}

void sub_100001678(id a1)
{
  dispatch_queue_t v1;
  void *v2;

  v1 = dispatch_queue_create("com.apple.hangtelemetry", 0);
  v2 = (void *)qword_1000080A8;
  qword_1000080A8 = (uint64_t)v1;

}

void sub_1000016A4(id a1, OS_xpc_object *a2)
{
  OS_xpc_object *v2;
  OS_xpc_object *v3;
  uint64_t uint64;
  NSObject *reply;
  xpc_connection_t remote_connection;
  _xpc_connection_s *v7;
  _xpc_connection_s *v8;
  uint64_t v9;
  id v10;
  id v11;
  NSObject *v12;

  v2 = a2;
  if (xpc_get_type(v2) == (xpc_type_t)&_xpc_type_dictionary)
  {
    v3 = v2;
    uint64 = xpc_dictionary_get_uint64(v3, "command");
    if (uint64 == 1)
    {
      if (qword_1000080B8 != -1)
        dispatch_once(&qword_1000080B8, &stru_100004350);
      reply = xpc_dictionary_create_reply(v3);
      remote_connection = xpc_dictionary_get_remote_connection(v3);
      v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(remote_connection);
      v8 = v7;
      if (reply && v7)
      {
        xpc_connection_send_message(v7, reply);
      }
      else
      {
        v11 = sub_10000291C();
        v12 = objc_claimAutoreleasedReturnValue(v11);
        if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
          sub_10000298C(reply != 0, v12);

      }
    }
    else
    {
      v9 = uint64;
      v10 = sub_10000291C();
      reply = objc_claimAutoreleasedReturnValue(v10);
      if (os_log_type_enabled(reply, OS_LOG_TYPE_FAULT))
        sub_100002A1C(v9, reply);
    }

  }
}

void sub_1000017CC(id a1)
{
  int v1;
  id v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int v12;
  uint64_t v13;
  int v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  id v19;
  unsigned __int8 v20;
  id v21;
  id v22;
  void *v23;
  id v24;
  NSObject *v25;
  NSObject *v26;
  const char *v27;
  unsigned int v28;
  id v29;
  unsigned int v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  sem_t *v36;
  int v37;
  id v38;
  NSObject *v39;
  NSObject *v40;
  id v41;
  id v42;
  size_t v43;
  void *v44;
  uint8_t buf[4];
  id v46;

  v1 = sub_10000283C();
  v2 = sub_10000291C();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  v4 = v3;
  if (v1)
  {
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      sub_100002A8C(v4, v5, v6, v7, v8, v9, v10, v11);
    goto LABEL_54;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "New boot: Refreshing telemetry metadata and saving in settings", buf, 2u);
  }

  if (qword_1000080C8 != -1)
    dispatch_once(&qword_1000080C8, &stru_100004370);
  v12 = (unsigned __int16)word_1000080C0;
  if (qword_1000080D0 != -1)
    dispatch_once(&qword_1000080D0, &stru_100004390);
  v13 = dword_1000080D8;
  v43 = 8;
  v44 = 0;
  v14 = sysctlbyname("kern.roots_installed", &v44, &v43, 0, 0);
  v15 = sub_10000291C();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  v17 = v16;
  if (v14)
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v46) = v18;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Unable to get installed root info kern.roots_installed: %{errno}d", buf, 8u);
    }

  }
  else
  {
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v46 = v44;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Installed root info kern.roots_installed: %llu", buf, 0xCu);
    }

    if (v44)
    {
      v28 = 257;
      word_1000080DC = 257;
      goto LABEL_33;
    }
  }
  if (objc_opt_class(DUSession))
  {
    v19 = objc_alloc_init((Class)DUSession);
    v42 = 0;
    v20 = objc_msgSend(v19, "openAndReturnError:", &v42);
    v21 = v42;
    v22 = v21;
    if ((v20 & 1) == 0)
    {
      v29 = sub_10000291C();
      v26 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v22;
        v27 = "Unable to open darwinup: %@";
        goto LABEL_27;
      }
LABEL_28:

      v28 = (unsigned __int16)word_1000080DC;
      goto LABEL_33;
    }

    v41 = 0;
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "allInstalledRootsAndReturnError:", &v41));
    v22 = v41;
    v24 = sub_10000291C();
    v25 = objc_claimAutoreleasedReturnValue(v24);
    v26 = v25;
    if (!v23 && v22)
    {
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v22;
        v27 = "Unable to get all installed roots via darwinup: %@";
LABEL_27:
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, v27, buf, 0xCu);
        goto LABEL_28;
      }
      goto LABEL_28;
    }
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      sub_100002B44(v23, v26);

    LOBYTE(word_1000080DC) = 1;
    HIBYTE(word_1000080DC) = objc_msgSend(v23, "count") != 0;

  }
  else
  {
    word_1000080DC = 1;
  }
  v28 = (unsigned __int16)word_1000080DC;
LABEL_33:
  if (qword_1000080E0 != -1)
    dispatch_once(&qword_1000080E0, &stru_1000043B0);
  v30 = (unsigned __int16)word_1000080DE;
  v4 = objc_alloc_init((Class)NSMutableDictionary);
  v31 = objc_alloc_init((Class)NSMutableArray);
  objc_msgSend(v31, "addObject:", CFSTR("HangTracerTelemetryBootSessionUUID"));
  if ((v30 & 1) != 0)
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (v30 >> 8) & 1));
    -[NSObject setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v33, CFSTR("HangTracerTelemetryHaveNonDefaultFeatureFlags"));

    if ((v12 & 1) != 0)
      goto LABEL_37;
  }
  else
  {
    objc_msgSend(v31, "addObject:", CFSTR("HangTracerTelemetryHaveNonDefaultFeatureFlags"));
    if ((v12 & 1) != 0)
    {
LABEL_37:
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (v12 >> 8) & 1));
      -[NSObject setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v32, CFSTR("HangTracerTelemetrySerialLoggingEnabled"));

      goto LABEL_40;
    }
  }
  objc_msgSend(v31, "addObject:", CFSTR("HangTracerTelemetrySerialLoggingEnabled"));
LABEL_40:
  if ((int)v13 < 1)
  {
    objc_msgSend(v31, "addObject:", CFSTR("HangTracerTelemetryNumOSCryptexFileExtents"));
    if ((v28 & 1) == 0)
      goto LABEL_42;
LABEL_44:
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", (v28 >> 8) & 1));
    -[NSObject setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v35, CFSTR("HangTracerTelemetryHaveRootsInstalled"));

    goto LABEL_45;
  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v13));
  -[NSObject setObject:forKeyedSubscript:](v4, "setObject:forKeyedSubscript:", v34, CFSTR("HangTracerTelemetryNumOSCryptexFileExtents"));

  if ((v28 & 1) != 0)
    goto LABEL_44;
LABEL_42:
  objc_msgSend(v31, "addObject:", CFSTR("HangTracerTelemetryHaveRootsInstalled"));
LABEL_45:
  CFPreferencesSetMultiple((CFDictionaryRef)v4, (CFArrayRef)v31, CFSTR("com.apple.da"), CFSTR("mobile"), kCFPreferencesAnyHost);
  v36 = sem_open("hangtelemetryd.onceatboot", 2560, 292, 1);
  if (v36 == (sem_t *)-1)
  {
    v37 = *__error();
    v38 = sub_10000291C();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    v40 = v39;
    if (v37 == 17)
    {
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "HTTelemetrySetRanThisBoot called twice", buf, 2u);
      }
    }
    else if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      sub_100002ABC(v40);
    }

  }
  else
  {
    sem_close(v36);
  }
  notify_post(off_100008090);

LABEL_54:
}

void sub_100001DD0(id a1)
{
  vm_size_t v1;
  char *v2;
  int v3;
  size_t v4;
  BOOL v5;
  id v6;
  NSObject *v7;
  int v8;
  size_t v9;
  char *v10;
  unsigned int v11;
  BOOL v12;
  uint64_t v13;
  unsigned int v15;
  uint64_t v16;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  BOOL v27;
  char *v28;
  unint64_t v29;
  int v30;
  id v31;
  NSObject *v32;
  NSObject *v33;
  int v34;
  uint64_t v35;
  uint64_t v36;
  size_t v37;
  uint8_t buf[4];
  char *v39;
  __int16 v40;
  int v41;

  v1 = vm_page_size;
  __chkstk_darwin(a1);
  v2 = (char *)&v36 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  v37 = v1;
  v3 = sysctlbyname("kern.bootargs", v2, &v37, 0, 0);
  v4 = v37;
  if (v3)
    v5 = 1;
  else
    v5 = v37 >= v1;
  if (v5)
  {
    v6 = sub_10000291C();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = *__error();
      *(_DWORD *)buf = 67109120;
      LODWORD(v39) = v8;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Unable to get kern.bootargs: %{errno}d", buf, 8u);
    }

  }
  else
  {
    v2[v37] = 0;
    LOBYTE(word_1000080C0) = 1;
    if (v4 < 9)
    {
LABEL_28:
      v18 = sub_10000291C();
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
        sub_100002C2C(v19, v20, v21, v22, v23, v24, v25, v26);

      v27 = 0;
    }
    else
    {
      v9 = 0;
      while (1)
      {
        v10 = &v2[v9];
        if (!strncmp(&v2[v9], "serial=", 7uLL))
          break;
        if (v9 < v4)
        {
          while (1)
          {
            v11 = v2[v9];
            v12 = v11 > 0x20;
            v13 = (1 << v11) & 0x100000201;
            if (!v12 && v13 != 0)
              break;
            if (v4 == ++v9)
            {
LABEL_26:
              v9 = v4;
              goto LABEL_27;
            }
          }
        }
        if (v9 < v4)
        {
          while (1)
          {
            v15 = v2[v9];
            v12 = v15 > 0x20;
            v16 = (1 << v15) & 0x100000201;
            if (v12 || v16 == 0)
              break;
            if (v4 == ++v9)
              goto LABEL_26;
          }
        }
LABEL_27:
        if (v9 + 8 >= v4)
          goto LABEL_28;
      }
      *__error() = 0;
      v28 = v10 + 7;
      v29 = strtoull(v10 + 7, 0, 0);
      v30 = *__error();
      v31 = sub_10000291C();
      v32 = objc_claimAutoreleasedReturnValue(v31);
      v33 = v32;
      if (v30)
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          v34 = *__error();
          *(_DWORD *)buf = 136315394;
          v39 = v28;
          v40 = 1024;
          v41 = v34;
          _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Non-integer serial=%s (error %{errno}d), assuming enabled", buf, 0x12u);
        }

        v27 = 1;
      }
      else
      {
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
          sub_100002BC4(v29, v33, v35);

        v27 = v29 != 0;
      }
    }
    HIBYTE(word_1000080C0) = v27;
  }
}

void sub_10000209C(id a1)
{
  void *v1;
  id v2;
  id v3;
  id v4;
  const char *v5;
  uint64_t v6;
  int v7;
  int v8;
  id v9;
  NSObject *v10;
  int v11;
  const char *v12;
  NSObject *v13;
  uint32_t v14;
  int v15;
  id v16;
  NSObject *v17;
  const char *v18;
  id v19;
  id v20;
  NSObject *v21;
  int v22;
  id v23;
  off_t st_size;
  off_t v25;
  id v26;
  id v27;
  NSObject *v28;
  int v29;
  const char *v30;
  NSObject *v31;
  uint32_t v32;
  id v33;
  id v34;
  int v35;
  off_t v36;
  off_t v37;
  uint8_t buf[4];
  uint64_t v39;
  __int16 v40;
  off_t v41;
  stat v42;

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[MSUDataAccessor sharedDataAccessor](MSUDataAccessor, "sharedDataAccessor"));
  v34 = 0;
  v2 = objc_msgSend(v1, "copyPathForPersonalizedData:error:", 11, &v34);
  v3 = v34;

  if (!v2)
  {
    v16 = sub_10000291C();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v42.st_dev = 138412290;
    *(_QWORD *)&v42.st_mode = v3;
    v18 = "Unable to get path for MSUDA_CRYPTEX1_OS_CRYPTEX: (%@)";
LABEL_15:
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, v18, (uint8_t *)&v42, 0xCu);
    goto LABEL_21;
  }
  v4 = objc_retainAutorelease(v2);
  v5 = (const char *)objc_msgSend(v4, "fileSystemRepresentation");
  if (!v5)
  {
    v19 = sub_10000291C();
    v17 = objc_claimAutoreleasedReturnValue(v19);
    if (!os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      goto LABEL_21;
    v42.st_dev = 138412290;
    *(_QWORD *)&v42.st_mode = v4;
    v18 = "Unable to get fileSystemRepresentation for cryptex path %@";
    goto LABEL_15;
  }
  v6 = (uint64_t)v5;
  v7 = open(v5, 0, 0);
  if (v7 < 0)
  {
    v20 = sub_10000291C();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = *__error();
      v42.st_dev = 136315394;
      *(_QWORD *)&v42.st_mode = v6;
      WORD2(v42.st_ino) = 1024;
      *(_DWORD *)((char *)&v42.st_ino + 6) = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "FileExtent: error opening \"%s\": %{errno}d", (uint8_t *)&v42, 0x12u);
    }

    v15 = 0;
    goto LABEL_19;
  }
  v8 = v7;
  memset(&v42, 0, sizeof(v42));
  if (fstat(v7, &v42))
  {
    v9 = sub_10000291C();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
LABEL_8:

      goto LABEL_9;
    }
    v11 = *__error();
    *(_DWORD *)buf = 136315394;
    v39 = v6;
    v40 = 1024;
    LODWORD(v41) = v11;
    v12 = "FileExtent: failed to get file size for \"%s\": %{errno}d";
    v13 = v10;
    v14 = 18;
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, v12, buf, v14);
    goto LABEL_8;
  }
  st_size = v42.st_size;
  if (!v42.st_size)
  {
    v26 = sub_10000291C();
    v10 = objc_claimAutoreleasedReturnValue(v26);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      goto LABEL_8;
    *(_DWORD *)buf = 136315138;
    v39 = v6;
    v12 = "FileExtent: no extents for \"%s\" (empty file)\n";
    v13 = v10;
    v14 = 12;
    goto LABEL_7;
  }
  if (v42.st_size >= 1)
  {
    v25 = 0;
    v15 = 0;
    while (1)
    {
      v35 = 0;
      v36 = st_size - v25;
      v37 = v25;
      if (fcntl(v8, 65, &v35))
      {
        v27 = sub_10000291C();
        v28 = objc_claimAutoreleasedReturnValue(v27);
        if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
          goto LABEL_36;
        v29 = *__error();
        *(_DWORD *)buf = 67109120;
        LODWORD(v39) = v29;
        v30 = "FileExtent: error in fcntl(): %{errno}d";
        v31 = v28;
        v32 = 8;
        goto LABEL_35;
      }
      if (!v36)
        break;
      v25 += v36;
      ++v15;
      if (v25 >= st_size)
        goto LABEL_10;
    }
    v33 = sub_10000291C();
    v28 = objc_claimAutoreleasedReturnValue(v33);
    if (!os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      goto LABEL_36;
    *(_DWORD *)buf = 134218240;
    v39 = v25;
    v40 = 2048;
    v41 = st_size;
    v30 = "FileExtent: 0 contigbytes fcntl() at offset %lld out of %lld";
    v31 = v28;
    v32 = 22;
LABEL_35:
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, v30, buf, v32);
LABEL_36:

    goto LABEL_10;
  }
LABEL_9:
  v15 = 0;
LABEL_10:
  close(v8);
LABEL_19:
  dword_1000080D8 = v15;
  v23 = sub_10000291C();
  v17 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    sub_100002C5C(v6, v17);
LABEL_21:

}

void sub_100002490(id a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  NSObject *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  id v29;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  uint64_t v34;
  id v35;
  uint64_t v36;
  void *v37;
  void *context;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  id v50;
  __int16 v51;
  id v52;
  _BYTE v53[128];
  _BYTE v54[128];

  v1 = (void *)objc_claimAutoreleasedReturnValue(+[FFConfiguration shared](FFConfiguration, "shared"));
  if (v1)
  {
    v2 = v1;
    v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v1, "domains"));
    v4 = objc_msgSend(v3, "count");

    if (v4)
    {
      LOBYTE(word_1000080DE) = 1;
      v43 = 0u;
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "domains"));
      v35 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
      if (v35)
      {
        v6 = *(_QWORD *)v44;
        v37 = v5;
        v34 = *(_QWORD *)v44;
        do
        {
          v7 = 0;
          do
          {
            if (*(_QWORD *)v44 != v6)
              objc_enumerationMutation(v5);
            v36 = v7;
            v8 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v7);
            context = objc_autoreleasePoolPush();
            v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "featuresForDomain:", v8));
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v10 = v9;
            v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
            if (v11)
            {
              v12 = v11;
              v13 = *(_QWORD *)v40;
              while (2)
              {
                for (i = 0; i != v12; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v40 != v13)
                    objc_enumerationMutation(v10);
                  v15 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * (_QWORD)i);
                  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stateForFeature:domain:level:", v15, v8, 4));
                  if (v16)
                  {
                    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "defaultStateForFeature:domain:", v15, v8));
                    v18 = v17;
                    if (!v17 || (v19 = objc_msgSend(v17, "value"), v19 != objc_msgSend(v16, "value")))
                    {
                      v29 = sub_10000291C();
                      v30 = objc_claimAutoreleasedReturnValue(v29);
                      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                      {
                        v31 = objc_msgSend(v16, "value");
                        v32 = objc_msgSend(v18, "value");
                        *(_DWORD *)buf = 138412802;
                        v48 = v15;
                        v49 = 2048;
                        v50 = v31;
                        v51 = 2048;
                        v52 = v32;
                        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Found non-default feature flag for %@: %ld (default %ld)", buf, 0x20u);
                      }

                      HIBYTE(word_1000080DE) = 1;
                      objc_msgSend(v2, "invalidateCache");

                      objc_autoreleasePoolPop(context);
                      v2 = v37;
                      goto LABEL_29;
                    }

                  }
                }
                v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v39, v53, 16);
                if (v12)
                  continue;
                break;
              }
            }

            objc_autoreleasePoolPop(context);
            v7 = v36 + 1;
            v5 = v37;
            v6 = v34;
          }
          while ((id)(v36 + 1) != v35);
          v35 = objc_msgSend(v37, "countByEnumeratingWithState:objects:count:", &v43, v54, 16);
        }
        while (v35);
      }

      v20 = sub_10000291C();
      v21 = objc_claimAutoreleasedReturnValue(v20);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
        sub_100002CE0(v21, v22, v23, v24, v25, v26, v27, v28);
    }
    else
    {
      v33 = sub_10000291C();
      v21 = objc_claimAutoreleasedReturnValue(v33);
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Unable to get feature flags", buf, 2u);
      }
    }

    objc_msgSend(v2, "invalidateCache");
LABEL_29:

  }
}

void sub_100002810(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, &a9, 2u);
}

void sub_100002830(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_debug_impl(a1, a2, OS_LOG_TYPE_DEBUG, a4, a5, 0xCu);
}

uint64_t sub_10000283C()
{
  sem_t *v0;
  id v2;
  NSObject *v3;
  int v4;
  _DWORD v5[2];

  v0 = sem_open("hangtelemetryd.onceatboot", 0);
  if (v0 == (sem_t *)-1)
  {
    if (*__error() == 2)
      return 0;
    v2 = sub_10000291C();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v4 = *__error();
      v5[0] = 67109120;
      v5[1] = v4;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "sem_open() failed: %{errno}d", (uint8_t *)v5, 8u);
    }

  }
  else
  {
    sem_close(v0);
  }
  return 1;
}

id sub_10000291C()
{
  if (qword_1000080F0 != -1)
    dispatch_once(&qword_1000080F0, &stru_100004400);
  return (id)qword_1000080E8;
}

void sub_10000295C(id a1)
{
  os_log_t v1;
  void *v2;

  v1 = os_log_create("com.apple.hangtracer", (const char *)&unk_1000033BD);
  v2 = (void *)qword_1000080E8;
  qword_1000080E8 = (uint64_t)v1;

}

void sub_10000298C(char a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  int v4;
  __int16 v5;
  uint64_t v6;

  v2[0] = 67109632;
  v2[1] = a1 & 1;
  v3 = 1024;
  v4 = 1;
  v5 = 2048;
  v6 = 1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "No reply:%d or no connection:%d for command %llu", (uint8_t *)v2, 0x18u);
  sub_100002820();
}

void sub_100002A1C(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;

  v2 = 134217984;
  v3 = a1;
  _os_log_fault_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_FAULT, "Unknown command %llu", (uint8_t *)&v2, 0xCu);
  sub_100002820();
}

void sub_100002A8C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002810((void *)&_mh_execute_header, a1, a3, "Same boot: Not refreshing telemetry metadata", a5, a6, a7, a8, 0);
  sub_100002828();
}

void sub_100002ABC(NSObject *a1)
{
  int v2;
  _DWORD v3[2];

  v2 = *__error();
  v3[0] = 67109120;
  v3[1] = v2;
  _os_log_fault_impl((void *)&_mh_execute_header, a1, OS_LOG_TYPE_FAULT, "sem_open() creation failed: %{errno}d", (uint8_t *)v3, 8u);
  sub_100002820();
}

void sub_100002B44(void *a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  id v5;

  v4 = 134217984;
  v5 = objc_msgSend(a1, "count");
  sub_100002830((void *)&_mh_execute_header, a2, v3, "%lu darwinup roots are installed", (uint8_t *)&v4);
}

void sub_100002BC4(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;

  v3 = 134217984;
  v4 = a1;
  sub_100002830((void *)&_mh_execute_header, a2, a3, "Found serial=%llu", (uint8_t *)&v3);
  sub_100002820();
}

void sub_100002C2C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002810((void *)&_mh_execute_header, a1, a3, "No serial boot-arg", a5, a6, a7, a8, 0);
  sub_100002828();
}

void sub_100002C5C(uint64_t a1, NSObject *a2)
{
  _DWORD v2[2];
  __int16 v3;
  uint64_t v4;

  v2[0] = 67109378;
  v2[1] = dword_1000080D8;
  v3 = 2080;
  v4 = a1;
  _os_log_debug_impl((void *)&_mh_execute_header, a2, OS_LOG_TYPE_DEBUG, "Shared cache fragmentation OS Cryptex File Extents count is %d for file: (\"%s\")", (uint8_t *)v2, 0x12u);
  sub_100002820();
}

void sub_100002CE0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_100002810((void *)&_mh_execute_header, a1, a3, "Found no non-default feature flags", a5, a6, a7, a8, 0);
  sub_100002828();
}

id objc_msgSend_addObject_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "addObject:");
}

id objc_msgSend_allInstalledRootsAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "allInstalledRootsAndReturnError:");
}

id objc_msgSend_copyPathForPersonalizedData_error_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "copyPathForPersonalizedData:error:");
}

id objc_msgSend_count(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "count");
}

id objc_msgSend_countByEnumeratingWithState_objects_count_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "countByEnumeratingWithState:objects:count:");
}

id objc_msgSend_defaultStateForFeature_domain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "defaultStateForFeature:domain:");
}

id objc_msgSend_domains(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "domains");
}

id objc_msgSend_featuresForDomain_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "featuresForDomain:");
}

id objc_msgSend_fileSystemRepresentation(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "fileSystemRepresentation");
}

id objc_msgSend_invalidateCache(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "invalidateCache");
}

id objc_msgSend_numberWithBool_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithBool:");
}

id objc_msgSend_numberWithInt_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "numberWithInt:");
}

id objc_msgSend_openAndReturnError_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "openAndReturnError:");
}

id objc_msgSend_setObject_forKeyedSubscript_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "setObject:forKeyedSubscript:");
}

id objc_msgSend_shared(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "shared");
}

id objc_msgSend_sharedDataAccessor(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "sharedDataAccessor");
}

id objc_msgSend_stateForFeature_domain_level_(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "stateForFeature:domain:level:");
}

id objc_msgSend_value(void *a1, const char *a2, ...)
{
  return objc_msgSend(a1, "value");
}
