@implementation MSDHelperAgent

+ (MSDHelperAgent)sharedInstance
{
  if (qword_1001755D8 != -1)
    dispatch_once(&qword_1001755D8, &stru_10013FCE0);
  return (MSDHelperAgent *)(id)qword_1001755D0;
}

- (MSDHelperAgent)init
{
  MSDHelperAgent *v2;
  dispatch_semaphore_t v3;
  xpc_connection_t mach_service;
  void *v5;
  _xpc_connection_s *v6;
  _xpc_connection_s *v7;
  MSDHelperAgent *v8;
  id v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)MSDHelperAgent;
  v2 = -[MSDHelperAgent init](&v19, "init");
  if (!v2)
  {
LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  v3 = dispatch_semaphore_create(5);
  -[MSDHelperAgent setXpc_sema:](v2, "setXpc_sema:", v3);

  mach_service = xpc_connection_create_mach_service("com.apple.mobilestoredemodhelper", 0, 0);
  -[MSDHelperAgent setXpc_conn:](v2, "setXpc_conn:", mach_service);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent xpc_conn](v2, "xpc_conn"));
  if (!v5)
  {
    v9 = sub_1000604F0();
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_1000CAEC0(v10, v11, v12, v13, v14, v15, v16, v17);

    goto LABEL_7;
  }
  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent xpc_conn](v2, "xpc_conn"));
  xpc_connection_set_event_handler(v6, &stru_10013FD00);

  v7 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent xpc_conn](v2, "xpc_conn"));
  xpc_connection_resume(v7);

  v8 = v2;
LABEL_8:

  return v8;
}

- (BOOL)updateSignedManifest
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent updateSignedManifest]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v11, 0xCu);
  }

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "updateSignedManifest");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent updateSignedManifest]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)migratePreferencesFile
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent migratePreferencesFile]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v11, 0xCu);
  }

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "migratePreferencesFile:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent migratePreferencesFile]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)stageDeviceForUpdateProcess:(BOOL)a3
{
  id v5;
  NSObject *v6;
  xpc_object_t v7;
  xpc_object_t v8;
  void *v9;
  id v10;
  NSObject *v11;
  BOOL v12;
  int v14;
  const char *v15;

  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[MSDHelperAgent stageDeviceForUpdateProcess:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v14, 0xCu);
  }

  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_BOOL(v7, "ForBackgroundDownload", a3);
  v8 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v8, "command", "stageDeviceForUpdateProcess:");
  xpc_dictionary_set_value(v8, "payload", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v8));
  v10 = sub_1000604F0();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315138;
    v15 = "-[MSDHelperAgent stageDeviceForUpdateProcess:]";
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v14, 0xCu);
  }

  v12 = xpc_dictionary_get_BOOL(v9, "result");
  return v12;
}

- (BOOL)clearStagedDeviceAfterUpdateProcess
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent clearStagedDeviceAfterUpdateProcess]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v11, 0xCu);
  }

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "clearStagedDeviceAfterUpdateProcess");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent clearStagedDeviceAfterUpdateProcess]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)prepareWorkDirectory:(id)a3 writableByNonRoot:(BOOL)a4
{
  id v6;
  id v7;
  NSObject *v8;
  xpc_object_t v9;
  id v10;
  const char *v11;
  xpc_object_t v12;
  void *v13;
  id v14;
  NSObject *v15;
  BOOL v16;
  int v18;
  const char *v19;

  v6 = a3;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[MSDHelperAgent prepareWorkDirectory:writableByNonRoot:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v18, 0xCu);
  }

  v9 = xpc_dictionary_create(0, 0, 0);
  v10 = objc_retainAutorelease(v6);
  v11 = (const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v9, "Path", v11);
  xpc_dictionary_set_BOOL(v9, "WritableByNonRoot", a4);
  v12 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v12, "command", "prepareWorkDirectory:");
  xpc_dictionary_set_value(v12, "payload", v9);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v12));
  v14 = sub_1000604F0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 136315138;
    v19 = "-[MSDHelperAgent prepareWorkDirectory:writableByNonRoot:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v18, 0xCu);
  }

  v16 = xpc_dictionary_get_BOOL(v13, "result");
  return v16;
}

- (BOOL)removeWorkDirectory:(id)a3
{
  id v4;
  void *v5;
  id v7;

  v7 = a3;
  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v7, 1));

  LOBYTE(self) = -[MSDHelperAgent removeWorkDirectories:](self, "removeWorkDirectories:", v5, v7);
  return (char)self;
}

- (BOOL)removeWorkDirectories:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  xpc_object_t v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  id v13;
  xpc_object_t v14;
  xpc_object_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  BOOL v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint8_t v25[128];
  uint8_t buf[4];
  const char *v27;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[MSDHelperAgent removeWorkDirectories:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", buf, 0xCu);
  }

  v7 = xpc_array_create(0, 0);
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v11)
          objc_enumerationMutation(v8);
        v13 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i));
        v14 = xpc_string_create((const char *)objc_msgSend(v13, "UTF8String", (_QWORD)v21));
        xpc_array_append_value(v7, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v10);
  }

  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v15, "command", "removeWorkDirectory:");
  xpc_dictionary_set_value(v15, "payload", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v15));
  v17 = sub_1000604F0();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v27 = "-[MSDHelperAgent removeWorkDirectories:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: will return.", buf, 0xCu);
  }

  v19 = xpc_dictionary_get_BOOL(v16, "result");
  return v19;
}

- (id)createDeviceManifestForComponent:(id)a3 ofType:(id)a4 withRootPath:(id)a5 userHomePath:(id)a6 andSavePath:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  unsigned int v20;
  id v21;
  NSObject *v22;
  xpc_object_t v23;
  xpc_object_t v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  void *v31;
  id v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  MSDManifest *v41;
  id v42;
  NSObject *v43;
  id v45;
  void *v46;
  id v47;
  void *v48;
  id v49;
  void *v50;
  void *v51;
  id v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  id v60;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = sub_1000604F0();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315906;
    v54 = "-[MSDHelperAgent createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:]";
    v55 = 2114;
    v56 = v12;
    v57 = 2114;
    v58 = v13;
    v59 = 2114;
    v60 = v14;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: entered for component: %{public}@ of type: %{public}@ root path: %{public}@", buf, 0x2Au);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v20 = objc_msgSend(v19, "fileExistsAtPath:", v16);

  v50 = v12;
  v51 = v16;
  if (v20)
  {
    v49 = v14;
    v21 = sub_1000604F0();
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v54 = (const char *)v16;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Device manifest already exists at path: %{public}@; Skipping XPC request.",
        buf,
        0xCu);
    }
    v45 = v13;
    v47 = v15;

    v23 = 0;
    v24 = 0;
    v25 = 0;
    goto LABEL_9;
  }
  v24 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v24, "ComponentID", (const char *)objc_msgSend(objc_retainAutorelease(v12), "cStringUsingEncoding:", 4));
  xpc_dictionary_set_string(v24, "ComponentType", (const char *)objc_msgSend(objc_retainAutorelease(v13), "cStringUsingEncoding:", 4));
  xpc_dictionary_set_string(v24, "RootPath", (const char *)objc_msgSend(objc_retainAutorelease(v14), "cStringUsingEncoding:", 4));
  xpc_dictionary_set_string(v24, "UserHomePath", (const char *)objc_msgSend(objc_retainAutorelease(v15), "cStringUsingEncoding:", 4));
  xpc_dictionary_set_string(v24, "SavePath", (const char *)objc_msgSend(objc_retainAutorelease(v16), "cStringUsingEncoding:", 4));
  v23 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v23, "command", "createDeviceManifest:");
  xpc_dictionary_set_value(v23, "payload", v24);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v23));
  if (xpc_dictionary_get_BOOL(v25, "result"))
  {
    v47 = v15;
    v49 = v14;
    v45 = v13;
LABEL_9:
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v16, v45, v47));
    v52 = 0;
    v27 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithContentsOfURL:error:](NSDictionary, "dictionaryWithContentsOfURL:error:", v26, &v52));
    v28 = v52;

    if (!v27)
    {
      v29 = sub_1000604F0();
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        sub_1000CAF78((uint64_t)v51, v28, v30);

      v27 = objc_alloc_init((Class)NSDictionary);
    }

    v13 = v46;
    v31 = v48;
    v14 = v49;
    goto LABEL_17;
  }
  v32 = sub_1000604F0();
  v33 = objc_claimAutoreleasedReturnValue(v32);
  if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    sub_1000CB038(v33, v34, v35, v36, v37, v38, v39, v40);
  v31 = v15;

  v27 = objc_alloc_init((Class)NSDictionary);
LABEL_17:
  v41 = -[MSDManifest initWithDictionary:]([MSDManifest alloc], "initWithDictionary:", v27);
  -[MSDManifest setRootPath:](v41, "setRootPath:", v14);
  v42 = sub_1000604F0();
  v43 = objc_claimAutoreleasedReturnValue(v42);
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v54 = "-[MSDHelperAgent createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:]";
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "%s: will return.", buf, 0xCu);
  }

  return v41;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  xpc_object_t v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  int v15;
  const char *v16;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[MSDHelperAgent fileExistsAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v15, 0xCu);
  }

  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "command", "fileExistsAtPath:");
  v8 = objc_retainAutorelease(v4);
  v9 = (const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v7, "payload", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v7));
  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[MSDHelperAgent fileExistsAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v15, 0xCu);
  }

  v13 = xpc_dictionary_get_BOOL(v10, "result");
  return v13;
}

- (BOOL)removeFileAtPath:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  BOOL v7;
  int v9;
  const char *v10;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315138;
    v10 = "-[MSDHelperAgent removeFileAtPath:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v9, 0xCu);
  }

  v7 = -[MSDHelperAgent removeWorkDirectory:](self, "removeWorkDirectory:", v4);
  return v7;
}

- (id)readPlistFile:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  xpc_object_t v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  int v15;
  const char *v16;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[MSDHelperAgent readPlistFile:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v15, 0xCu);
  }

  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "command", "readPlistFile:outContent:");
  v8 = objc_retainAutorelease(v4);
  v9 = (const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v7, "payload", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v7));
  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[MSDHelperAgent readPlistFile:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v15, 0xCu);
  }

  if (xpc_dictionary_get_BOOL(v10, "result"))
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryFromXPCDictionary:withDataFromKey:](NSDictionary, "dictionaryFromXPCDictionary:withDataFromKey:", v10, "payload"));
  else
    v13 = 0;

  return v13;
}

- (BOOL)touchFile:(id)a3 fileAttributes:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  xpc_object_t v10;
  id v11;
  const char *v12;
  void *v13;
  void *v14;
  void *v15;
  xpc_object_t v16;
  void *v17;
  id v18;
  NSObject *v19;
  BOOL v20;
  int v22;
  const char *v23;

  v6 = a4;
  v7 = a3;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315138;
    v23 = "-[MSDHelperAgent touchFile:fileAttributes:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v22, 0xCu);
  }

  v10 = xpc_dictionary_create(0, 0, 0);
  v11 = objc_retainAutorelease(v7);
  v12 = (const char *)objc_msgSend(v11, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v10, "FilePath", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("FileOwnerName")));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("FileGroupOwnerName")));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", CFSTR("FilePosixPermissions")));

  if (v13)
    xpc_dictionary_set_string(v10, "FileOwnerName", (const char *)objc_msgSend(objc_retainAutorelease(v13), "UTF8String"));
  if (v14)
    xpc_dictionary_set_string(v10, "FileGroupOwnerName", (const char *)objc_msgSend(objc_retainAutorelease(v14), "UTF8String"));
  if (v15)
    xpc_dictionary_set_int64(v10, "FilePosixPermissions", (int)objc_msgSend(v15, "shortValue"));
  v16 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v16, "command", "touchFile:");
  xpc_dictionary_set_value(v16, "payload", v10);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v16));
  v18 = sub_1000604F0();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 136315138;
    v23 = "-[MSDHelperAgent touchFile:fileAttributes:]";
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v22, 0xCu);
  }

  v20 = xpc_dictionary_get_BOOL(v17, "result");
  return v20;
}

- (BOOL)cloneFile:(id)a3 to:(id)a4 expectingHash:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  xpc_object_t v20;
  id v21;
  id v22;
  const char *v23;
  id v24;
  xpc_object_t v25;
  void *v26;
  BOOL v27;
  id v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  id v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;

  v8 = a3;
  v9 = a5;
  v10 = a4;
  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    sub_1000CB17C(v12, v13, v14, v15, v16, v17, v18, v19);

  v20 = xpc_dictionary_create(0, 0, 0);
  v21 = objc_retainAutorelease(v8);
  xpc_dictionary_set_string(v20, "FilePath", (const char *)objc_msgSend(v21, "cStringUsingEncoding:", 4));
  v22 = objc_retainAutorelease(v10);
  v23 = (const char *)objc_msgSend(v22, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v20, "StatingPath", v23);
  if (v9 && objc_msgSend(v9, "length"))
  {
    v24 = objc_retainAutorelease(v9);
    xpc_dictionary_set_data(v20, "ExpectedHash", objc_msgSend(v24, "bytes"), (size_t)objc_msgSend(v24, "length"));
  }
  xpc_dictionary_set_BOOL(v20, "CorrectOwnership", 1);
  v25 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v25, "command", "cloneFile:");
  xpc_dictionary_set_value(v25, "payload", v20);
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v25));
  v27 = xpc_dictionary_get_BOOL(v26, "result");
  if (!v27)
  {
    v38 = sub_1000604F0();
    v39 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
      sub_1000CB118((uint64_t)v21, v39, v40, v41, v42, v43, v44, v45);

  }
  v28 = sub_1000604F0();
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    sub_1000CB0A8(v29, v30, v31, v32, v33, v34, v35, v36);

  return v27;
}

- (BOOL)restoreBackupAttributesUnder:(id)a3 range:(_NSRange)a4 manifestUID:(id)a5 deviceUID:(id)a6
{
  int64_t length;
  int64_t location;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  xpc_object_t v16;
  id v17;
  const char *v18;
  id v19;
  id v20;
  xpc_object_t v21;
  void *v22;
  id v23;
  NSObject *v24;
  BOOL v25;
  int v27;
  const char *v28;

  length = a4.length;
  location = a4.location;
  v11 = a6;
  v12 = a5;
  v13 = a3;
  v14 = sub_1000604F0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315138;
    v28 = "-[MSDHelperAgent restoreBackupAttributesUnder:range:manifestUID:deviceUID:]";
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v27, 0xCu);
  }

  v16 = xpc_dictionary_create(0, 0, 0);
  v17 = objc_retainAutorelease(v13);
  v18 = (const char *)objc_msgSend(v17, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v16, "StagingRootPath", v18);
  xpc_dictionary_set_int64(v16, "Location", location);
  xpc_dictionary_set_int64(v16, "Length", length);
  v19 = objc_msgSend(v12, "integerValue");

  xpc_dictionary_set_int64(v16, "ManifestUID", (int64_t)v19);
  v20 = objc_msgSend(v11, "integerValue");

  xpc_dictionary_set_int64(v16, "DeviceUID", (int64_t)v20);
  v21 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v21, "command", "restoreBackupAttributes:");
  xpc_dictionary_set_value(v21, "payload", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v21));
  v23 = sub_1000604F0();
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315138;
    v28 = "-[MSDHelperAgent restoreBackupAttributesUnder:range:manifestUID:deviceUID:]";
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v27, 0xCu);
  }

  v25 = xpc_dictionary_get_BOOL(v22, "result");
  return v25;
}

- (BOOL)restoreAppDataAttributesUnder:(id)a3 containerType:(id)a4 identifier:(id)a5 manifestUID:(id)a6 deviceUID:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  NSObject *v18;
  xpc_object_t v19;
  id v20;
  const char *v21;
  id v22;
  const char *v23;
  id v24;
  const char *v25;
  id v26;
  id v27;
  xpc_object_t v28;
  void *v29;
  id v30;
  NSObject *v31;
  BOOL v32;
  int v34;
  const char *v35;

  v12 = a7;
  v13 = a6;
  v14 = a5;
  v15 = a4;
  v16 = a3;
  v17 = sub_1000604F0();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 136315138;
    v35 = "-[MSDHelperAgent restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v34, 0xCu);
  }

  v19 = xpc_dictionary_create(0, 0, 0);
  v20 = objc_retainAutorelease(v16);
  v21 = (const char *)objc_msgSend(v20, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v19, "StagingRootPath", v21);
  v22 = objc_retainAutorelease(v15);
  v23 = (const char *)objc_msgSend(v22, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v19, "ContentType", v23);
  v24 = objc_retainAutorelease(v14);
  v25 = (const char *)objc_msgSend(v24, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v19, "Identifier", v25);
  v26 = objc_msgSend(v13, "integerValue");

  xpc_dictionary_set_int64(v19, "ManifestUID", (int64_t)v26);
  v27 = objc_msgSend(v12, "integerValue");

  xpc_dictionary_set_int64(v19, "DeviceUID", (int64_t)v27);
  v28 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v28, "command", "restoreAppDataAttributes:");
  xpc_dictionary_set_value(v28, "payload", v19);
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v28));
  v30 = sub_1000604F0();
  v31 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v34 = 136315138;
    v35 = "-[MSDHelperAgent restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:]";
    _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v34, 0xCu);
  }

  v32 = xpc_dictionary_get_BOOL(v29, "result");
  return v32;
}

- (BOOL)deleteNvram:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  xpc_object_t v7;
  id v8;
  const char *v9;
  void *v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  int v15;
  const char *v16;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[MSDHelperAgent deleteNvram:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v15, 0xCu);
  }

  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "command", "deleteNvram:");
  v8 = objc_retainAutorelease(v4);
  v9 = (const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v7, "payload", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v7));
  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[MSDHelperAgent deleteNvram:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v15, 0xCu);
  }

  v13 = xpc_dictionary_get_BOOL(v10, "result");
  return v13;
}

- (BOOL)writeNvram:(id)a3 withValue:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  xpc_object_t v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  xpc_object_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  BOOL v19;
  int v21;
  const char *v22;

  v6 = a4;
  v7 = a3;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[MSDHelperAgent writeNvram:withValue:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v21, 0xCu);
  }

  v10 = xpc_dictionary_create(0, 0, 0);
  v11 = objc_retainAutorelease(v7);
  v12 = (const char *)objc_msgSend(v11, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v10, "Name", v12);
  v13 = objc_retainAutorelease(v6);
  v14 = (const char *)objc_msgSend(v13, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v10, "Value", v14);
  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v15, "command", "writeNvram:");
  xpc_dictionary_set_value(v15, "payload", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v15));
  v17 = sub_1000604F0();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[MSDHelperAgent writeNvram:withValue:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v21, 0xCu);
  }

  v19 = xpc_dictionary_get_BOOL(v16, "result");
  return v19;
}

- (BOOL)manageDataVolume:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  xpc_object_t v7;
  id v8;
  const char *v9;
  xpc_object_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  int v16;
  const char *v17;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[MSDHelperAgent manageDataVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v16, 0xCu);
  }

  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "Target", "Data");
  v8 = objc_retainAutorelease(v4);
  v9 = (const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v7, "Operation", v9);
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "command", "manageVolume:");
  xpc_dictionary_set_value(v10, "payload", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v10));
  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[MSDHelperAgent manageDataVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v16, 0xCu);
  }

  v14 = xpc_dictionary_get_BOOL(v11, "result");
  return v14;
}

- (BOOL)manageDemoVolume:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  xpc_object_t v7;
  id v8;
  const char *v9;
  xpc_object_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  int v16;
  const char *v17;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[MSDHelperAgent manageDemoVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v16, 0xCu);
  }

  v7 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v7, "Target", "Demo");
  v8 = objc_retainAutorelease(v4);
  v9 = (const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v7, "Operation", v9);
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "command", "manageVolume:");
  xpc_dictionary_set_value(v10, "payload", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v10));
  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[MSDHelperAgent manageDemoVolume:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v16, 0xCu);
  }

  v14 = xpc_dictionary_get_BOOL(v11, "result");
  return v14;
}

- (BOOL)manageUserVolume:(id)a3 forUser:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  xpc_object_t v10;
  id v11;
  const char *v12;
  id v13;
  const char *v14;
  xpc_object_t v15;
  void *v16;
  id v17;
  NSObject *v18;
  BOOL v19;
  int v21;
  const char *v22;

  v6 = a4;
  v7 = a3;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[MSDHelperAgent manageUserVolume:forUser:]";
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v21, 0xCu);
  }

  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "Target", "User");
  v11 = objc_retainAutorelease(v7);
  v12 = (const char *)objc_msgSend(v11, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v10, "Operation", v12);
  v13 = objc_retainAutorelease(v6);
  v14 = (const char *)objc_msgSend(v13, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v10, "UserName", v14);
  v15 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v15, "command", "manageVolume:");
  xpc_dictionary_set_value(v15, "payload", v10);
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v15));
  v17 = sub_1000604F0();
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v21 = 136315138;
    v22 = "-[MSDHelperAgent manageUserVolume:forUser:]";
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v21, 0xCu);
  }

  v19 = xpc_dictionary_get_BOOL(v16, "result");
  return v19;
}

- (BOOL)disableLaunchdServicesForWatch
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent disableLaunchdServicesForWatch]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v11, 0xCu);
  }

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "disableLaunchdServicesForWatch:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent disableLaunchdServicesForWatch]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)moveStagingToFinal:(id)a3 finalPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v10;

  v10 = a3;
  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));

  LOBYTE(v7) = -[MSDHelperAgent moveStagingsToFinal:finalPath:](self, "moveStagingsToFinal:finalPath:", v8, v6, v10);
  return (char)v7;
}

- (BOOL)moveStagingsToFinal:(id)a3 finalPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  xpc_object_t v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  void *i;
  id v16;
  xpc_object_t v17;
  xpc_object_t v18;
  id v19;
  xpc_object_t v20;
  void *v21;
  id v22;
  NSObject *v23;
  BOOL v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;

  v6 = a3;
  v7 = a4;
  v8 = sub_1000604F0();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315650;
    v32 = "-[MSDHelperAgent moveStagingsToFinal:finalPath:]";
    v33 = 2114;
    v34 = v6;
    v35 = 2114;
    v36 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s entered.  stagingPaths:  %{public}@ - finalPath:  %{public}@", buf, 0x20u);
  }

  v10 = xpc_array_create(0, 0);
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v11 = v6;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v11);
        v16 = objc_retainAutorelease(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i));
        v17 = xpc_string_create((const char *)objc_msgSend(v16, "UTF8String", (_QWORD)v26));
        xpc_array_append_value(v10, v17);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
  }

  v18 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v18, "StagingPaths", v10);
  v19 = objc_retainAutorelease(v7);
  xpc_dictionary_set_string(v18, "FinalPath", (const char *)objc_msgSend(v19, "cStringUsingEncoding:", 4));
  v20 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v20, "command", "moveStagingToFinal:");
  xpc_dictionary_set_value(v20, "payload", v18);
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v20));
  v22 = sub_1000604F0();
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315138;
    v32 = "-[MSDHelperAgent moveStagingsToFinal:finalPath:]";
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%s: will return.", buf, 0xCu);
  }

  v24 = xpc_dictionary_get_BOOL(v21, "result");
  return v24;
}

- (BOOL)switchToBackupFolder
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent switchToBackupFolder]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s entered.", (uint8_t *)&v11, 0xCu);
  }

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "switchToBackupFolder:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent switchToBackupFolder]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)reboot
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent reboot]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v11, 0xCu);
  }

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "reboot:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent reboot]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)quitHelper
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v10;
  int v12;
  const char *v13;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[MSDHelperAgent quitHelper]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v12, 0xCu);
  }

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "quitHelper:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v12 = 136315138;
    v13 = "-[MSDHelperAgent quitHelper]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v12, 0xCu);
  }

  v10 = v6 == &_xpc_error_connection_invalid || v6 == &_xpc_error_connection_interrupted;
  return v10;
}

- (BOOL)collectDemoLogsToFolder:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  xpc_object_t v7;
  id v8;
  const char *v9;
  xpc_object_t v10;
  void *v11;
  id v12;
  NSObject *v13;
  BOOL v14;
  int v16;
  const char *v17;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[MSDHelperAgent collectDemoLogsToFolder:]";
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v16, 0xCu);
  }

  v7 = xpc_dictionary_create(0, 0, 0);
  v8 = objc_retainAutorelease(v4);
  v9 = (const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4);

  xpc_dictionary_set_string(v7, "logFileDirectory", v9);
  v10 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v10, "command", "collectDemoLogsToFolder:");
  xpc_dictionary_set_value(v10, "payload", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v10));
  v12 = sub_1000604F0();
  v13 = objc_claimAutoreleasedReturnValue(v12);
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315138;
    v17 = "-[MSDHelperAgent collectDemoLogsToFolder:]";
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v16, 0xCu);
  }

  v14 = xpc_dictionary_get_BOOL(v11, "result");
  return v14;
}

- (BOOL)preserveBluetoothFileToShelter:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  xpc_object_t v7;
  id v8;
  xpc_object_t v9;
  void *v10;
  id v11;
  NSObject *v12;
  BOOL v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;

  v4 = a3;
  v5 = sub_1000604F0();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[MSDHelperAgent preserveBluetoothFileToShelter:]";
    v17 = 2114;
    v18 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%s entered.  sourcePath:  %{public}@", (uint8_t *)&v15, 0x16u);
  }

  v7 = xpc_dictionary_create(0, 0, 0);
  v8 = objc_retainAutorelease(v4);
  xpc_dictionary_set_string(v7, "SourcePath", (const char *)objc_msgSend(v8, "cStringUsingEncoding:", 4));
  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "command", "preserveBluetoothFileToShelter:");
  xpc_dictionary_set_value(v9, "payload", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v9));
  v11 = sub_1000604F0();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315138;
    v16 = "-[MSDHelperAgent preserveBluetoothFileToShelter:]";
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v15, 0xCu);
  }

  v13 = xpc_dictionary_get_BOOL(v10, "result");
  return v13;
}

- (BOOL)restartBluetooth
{
  id v3;
  NSObject *v4;
  xpc_object_t v5;
  void *v6;
  id v7;
  NSObject *v8;
  BOOL v9;
  int v11;
  const char *v12;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent restartBluetooth]";
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%s: entered.", (uint8_t *)&v11, 0xCu);
  }

  v5 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v5, "command", "restartBluetooth:");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v5));
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315138;
    v12 = "-[MSDHelperAgent restartBluetooth]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v11, 0xCu);
  }

  v9 = xpc_dictionary_get_BOOL(v6, "result");
  return v9;
}

- (BOOL)setComputerNameAndHostname:(id)a3 encoding:(unsigned int)a4
{
  id v6;
  id v7;
  NSObject *v8;
  xpc_object_t v9;
  id v10;
  xpc_object_t v11;
  void *v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  int v17;
  const char *v18;
  __int16 v19;
  id v20;
  __int16 v21;
  unsigned int v22;

  v6 = a3;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315650;
    v18 = "-[MSDHelperAgent setComputerNameAndHostname:encoding:]";
    v19 = 2114;
    v20 = v6;
    v21 = 1026;
    v22 = a4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:  entered - computerName:  %{public}@ - encoding:  %{public}x", (uint8_t *)&v17, 0x1Cu);
  }

  v9 = xpc_dictionary_create(0, 0, 0);
  v10 = objc_retainAutorelease(v6);
  xpc_dictionary_set_string(v9, "ComputerName", (const char *)objc_msgSend(v10, "cStringUsingEncoding:", 4));
  xpc_dictionary_set_uint64(v9, "Encoding", a4);
  v11 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v11, "command", "setComputerNameAndHostname:");
  xpc_dictionary_set_value(v11, "payload", v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v11));
  v13 = sub_1000604F0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 136315138;
    v18 = "-[MSDHelperAgent setComputerNameAndHostname:encoding:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v17, 0xCu);
  }

  v15 = xpc_dictionary_get_BOOL(v12, "result");
  return v15;
}

- (BOOL)executeTestScriptOfIdentifier:(id)a3
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;

  v3 = sub_1000604F0();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    sub_1000CB1EC(v4, v5, v6, v7, v8, v9, v10, v11);

  return 0;
}

- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 withReturnErrorMsg:(id *)a4
{
  id v6;
  id v7;
  NSObject *v8;
  xpc_object_t v9;
  id v10;
  const char *v11;
  void *v12;
  id v13;
  NSObject *v14;
  BOOL v15;
  BOOL v16;
  void *v17;
  void *v18;
  int v20;
  const char *v21;

  v6 = a3;
  v7 = sub_1000604F0();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315138;
    v21 = "-[MSDHelperAgent preserveSecondPartyAppDataToShelter:withReturnErrorMsg:]";
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "%s:  entered.", (uint8_t *)&v20, 0xCu);
  }

  v9 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v9, "command", "preserveSecondPartyAppDataToShelter:outErrorDict:");
  v10 = objc_retainAutorelease(v6);
  v11 = (const char *)objc_msgSend(v10, "UTF8String");

  xpc_dictionary_set_string(v9, "payload", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v9));
  v13 = sub_1000604F0();
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 136315138;
    v21 = "-[MSDHelperAgent preserveSecondPartyAppDataToShelter:withReturnErrorMsg:]";
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: will return.", (uint8_t *)&v20, 0xCu);
  }

  v15 = xpc_dictionary_get_BOOL(v12, "result");
  v16 = v15;
  if (a4 && !v15)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryFromXPCDictionary:withDataFromKey:](NSDictionary, "dictionaryFromXPCDictionary:withDataFromKey:", v12, "payload"));
    v18 = v17;
    if (v17)
      *a4 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", CFSTR("ErrorMsg")));

  }
  return v16;
}

- (BOOL)setPreferencesForKey:(id)a3 withValue:(id)a4 forApplication:(id)a5 andUser:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *v15;
  xpc_object_t v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  xpc_object_t v21;
  void *v22;
  _BOOL4 v23;
  id v24;
  NSObject *v25;
  int v27;
  const char *v28;
  __int16 v29;
  id v30;
  __int16 v31;
  id v32;
  __int16 v33;
  id v34;
  __int16 v35;
  id v36;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = sub_1000604F0();
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136316162;
    v28 = "-[MSDHelperAgent setPreferencesForKey:withValue:forApplication:andUser:]";
    v29 = 2114;
    v30 = v10;
    v31 = 2114;
    v32 = v11;
    v33 = 2114;
    v34 = v12;
    v35 = 2114;
    v36 = v13;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%s: entered - key:  %{public}@ - value:  %{public}@ - appId:  %{public}@ - user:  %{public}@", (uint8_t *)&v27, 0x34u);
  }

  v16 = xpc_dictionary_create(0, 0, 0);
  v17 = objc_retainAutorelease(v10);
  xpc_dictionary_set_string(v16, "Key", (const char *)objc_msgSend(v17, "cStringUsingEncoding:", 4));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "createXPCDictionary"));
  xpc_dictionary_set_value(v16, "Value", v18);

  v19 = objc_retainAutorelease(v12);
  xpc_dictionary_set_string(v16, "ApplicationId", (const char *)objc_msgSend(v19, "cStringUsingEncoding:", 4));
  v20 = objc_retainAutorelease(v13);
  xpc_dictionary_set_string(v16, "UserName", (const char *)objc_msgSend(v20, "cStringUsingEncoding:", 4));
  v21 = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_string(v21, "command", "setPreferences:");
  xpc_dictionary_set_value(v21, "payload", v16);
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent sendXPCRequest:](self, "sendXPCRequest:", v21));
  v23 = xpc_dictionary_get_BOOL(v22, "result");
  v24 = sub_1000604F0();
  v25 = objc_claimAutoreleasedReturnValue(v24);
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    v27 = 136315394;
    v28 = "-[MSDHelperAgent setPreferencesForKey:withValue:forApplication:andUser:]";
    v29 = 1024;
    LODWORD(v30) = v23;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "%s: will return with rval %d", (uint8_t *)&v27, 0x12u);
  }

  return v23;
}

- (id)sendXPCRequest:(id)a3
{
  id v4;
  NSObject *v5;
  _xpc_connection_s *v6;
  xpc_object_t v7;
  NSObject *v8;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[MSDHelperAgent xpc_sema](self, "xpc_sema"));
  dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);

  v6 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue(-[MSDHelperAgent xpc_conn](self, "xpc_conn"));
  v7 = xpc_connection_send_message_with_reply_sync(v6, v4);

  v8 = objc_claimAutoreleasedReturnValue(-[MSDHelperAgent xpc_sema](self, "xpc_sema"));
  dispatch_semaphore_signal(v8);

  return v7;
}

- (OS_xpc_object)xpc_conn
{
  return self->_xpc_conn;
}

- (void)setXpc_conn:(id)a3
{
  objc_storeStrong((id *)&self->_xpc_conn, a3);
}

- (OS_dispatch_semaphore)xpc_sema
{
  return self->_xpc_sema;
}

- (void)setXpc_sema:(id)a3
{
  objc_storeStrong((id *)&self->_xpc_sema, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_xpc_sema, 0);
  objc_storeStrong((id *)&self->_xpc_conn, 0);
}

@end
