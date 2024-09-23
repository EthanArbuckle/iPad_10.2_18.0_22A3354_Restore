@implementation MSDHMessageResponder

+ (id)sharedInstance
{
  if (qword_100053ED0 != -1)
    dispatch_once(&qword_100053ED0, &stru_100049190);
  return (id)qword_100053EC8;
}

- (MSDHMessageResponder)init
{
  MSDHMessageResponder *v2;
  dispatch_queue_t v3;
  MSDHMessageResponder *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MSDHMessageResponder;
  v2 = -[MSDHMessageResponder init](&v6, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.msdmessage", (dispatch_queue_attr_t)&_dispatch_queue_attr_concurrent);
    -[MSDHMessageResponder setMessageHandlerQueue:](v2, "setMessageHandlerQueue:", v3);

    v4 = v2;
  }

  return v2;
}

- (BOOL)hasEntitlementMobileStoreDemod:(id)a3
{
  __SecTask *v3;
  __SecTask *v4;
  const __CFBoolean *v5;
  const __CFBoolean *v6;
  CFTypeID v7;
  BOOL v8;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;
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
  audit_token_t v30;
  audit_token_t v31;

  memset(&v31, 0, sizeof(v31));
  xpc_connection_get_audit_token(a3, &v31);
  v30 = v31;
  v3 = SecTaskCreateWithAuditToken(0, &v30);
  if (!v3)
  {
    v10 = sub_100024A40();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10002FFD4(v11, v12, v13, v14, v15, v16, v17, v18);

    return 0;
  }
  v4 = v3;
  v5 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v3, CFSTR("com.apple.private.mobilestoredemo.helper"), 0);
  if (!v5)
  {
    v19 = sub_100024A40();
    v20 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      sub_100030044(v20, v21, v22, v23, v24, v25, v26, v27);

    CFRelease(v4);
    return 0;
  }
  v6 = v5;
  v7 = CFGetTypeID(v5);
  if (v7 == CFBooleanGetTypeID())
  {
    v8 = CFBooleanGetValue(v6) != 0;
  }
  else
  {
    v28 = sub_100024A40();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      sub_1000300B4();

    v8 = 0;
  }
  CFRelease(v4);
  CFRelease(v6);
  return v8;
}

- (BOOL)isCommandAllowed:(id)a3
{
  uint64_t v3;
  id v4;
  unsigned __int8 v5;

  v3 = qword_100053EE0;
  v4 = a3;
  if (v3 != -1)
    dispatch_once(&qword_100053EE0, &stru_1000491B0);
  v5 = objc_msgSend((id)qword_100053ED8, "containsObject:", v4);

  return v5;
}

- (void)handleXPCMessage:(id)a3 fromConnection:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v8 = objc_claimAutoreleasedReturnValue(-[MSDHMessageResponder messageHandlerQueue](self, "messageHandlerQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002590C;
  block[3] = &unk_1000491D8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

- (void)sendResponse:(BOOL)a3 withPayload:(id)a4 forRequest:(id)a5 fromConnection:(id)a6
{
  _xpc_connection_s *v9;
  xpc_object_t reply;
  id v11;

  v11 = a4;
  v9 = (_xpc_connection_s *)a6;
  reply = xpc_dictionary_create_reply(a5);
  if (!reply)
    reply = xpc_dictionary_create(0, 0, 0);
  if (v11)
    a3 &= objc_msgSend(v11, "saveAsDataInXPCDictionary:forKey:", reply, "payload");
  xpc_dictionary_set_BOOL(reply, "result", a3);
  xpc_connection_send_message(v9, reply);

}

- (BOOL)updateSignedManifest
{
  id v2;
  NSObject *v3;
  void *v4;
  unsigned __int8 v5;
  int v7;
  const char *v8;

  v2 = sub_100024A40();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 136315138;
    v8 = "-[MSDHMessageResponder updateSignedManifest]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter:", (uint8_t *)&v7, 0xCu);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v5 = objc_msgSend(v4, "updateSignedManifest");

  return v5;
}

- (BOOL)migratePreferencesFile:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[MSDHMessageResponder migratePreferencesFile:]";
    v11 = 2114;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v7 = objc_msgSend(v6, "migratePreferencesFile");

  return v7;
}

- (BOOL)stageDeviceForUpdateProcess:(id)a3
{
  id v3;
  void *v4;
  unsigned int v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  _UNKNOWN **v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *i;
  uint64_t v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  uint64_t v23;
  void *j;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  unsigned __int8 v29;
  BOOL v30;
  void *v31;
  id v32;
  NSObject *v33;
  NSObject *v34;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  unsigned int v44;
  id v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  uint8_t v55[128];
  uint8_t buf[4];
  const char *v57;
  __int16 v58;
  id v59;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("ForBackgroundDownload")));
  v5 = objc_msgSend(v4, "BOOLValue");

  v6 = sub_100024A40();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v57 = "-[MSDHMessageResponder stageDeviceForUpdateProcess:]";
    v58 = 2114;
    v59 = v3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", buf, 0x16u);
  }
  v45 = v3;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v44 = v5;
  if (v5)
  {
    objc_msgSend(v8, "addObjectsFromArray:", &off_10004E078);
    v11 = &off_10004E090;
    v12 = v9;
  }
  else
  {
    objc_msgSend(v8, "addObjectsFromArray:", &off_10004E0A8);
    objc_msgSend(v9, "addObjectsFromArray:", &off_10004E0C0);
    v11 = &off_10004E0D8;
    v12 = v10;
  }
  objc_msgSend(v12, "addObjectsFromArray:", v11);
  v52 = 0u;
  v53 = 0u;
  v50 = 0u;
  v51 = 0u;
  v13 = v9;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v51;
    do
    {
      for (i = 0; i != v15; i = (char *)i + 1)
      {
        if (*(_QWORD *)v51 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * (_QWORD)i);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
        objc_msgSend(v19, "removeDirectory:", v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v15);
  }

  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  v20 = v8;
  v21 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
  if (v21)
  {
    v22 = v21;
    v23 = *(_QWORD *)v47;
    while (2)
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(_QWORD *)v47 != v23)
          objc_enumerationMutation(v20);
        v25 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * (_QWORD)j);
        v26 = objc_msgSend(v10, "containsObject:", v25) ^ 1;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
        LOBYTE(v26) = objc_msgSend(v27, "prepareDirectory:writableByNonRoot:", v25, v26);

        if ((v26 & 1) == 0)
        {
          v32 = sub_100024A40();
          v33 = objc_claimAutoreleasedReturnValue(v32);
          if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
            sub_100030154();

          v34 = v20;
          v31 = v45;
          goto LABEL_26;
        }
      }
      v22 = -[NSObject countByEnumeratingWithState:objects:count:](v20, "countByEnumeratingWithState:objects:count:", &v46, v54, 16);
      if (v22)
        continue;
      break;
    }
  }

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v29 = objc_msgSend(v28, "prepareWorkContainerInUserHome:", v44);

  if ((v29 & 1) != 0)
  {
    v30 = 1;
    v31 = v45;
  }
  else
  {
    v36 = sub_100024A40();
    v34 = objc_claimAutoreleasedReturnValue(v36);
    v31 = v45;
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      sub_100030124(v34, v37, v38, v39, v40, v41, v42, v43);
LABEL_26:

    v30 = 0;
  }

  return v30;
}

- (BOOL)clearStagedDeviceAfterUpdateProcess
{
  void *v2;
  unsigned int v3;
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned __int8 v13;
  void *v14;
  unsigned __int8 v15;
  id v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  int v50;
  const char *v51;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = objc_msgSend(v2, "fileExistsAtPath:", CFSTR("/var/MSDWorkContainer/.MSD_cache_manifest"));

  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v50 = 136315138;
    v51 = "-[MSDHMessageResponder clearStagedDeviceAfterUpdateProcess]";
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter", (uint8_t *)&v50, 0xCu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v7 = objc_msgSend(v6, "removeDirectory:", CFSTR("/private/var/mnt/com.apple.mobilestoredemo.storage/com.apple.mobilestoredemo.blob/Metadata/MSDWorkContainer"));

  if ((v7 & 1) == 0)
  {
    v17 = sub_100024A40();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000302C4(v18, v19, v20, v21, v22, v23, v24, v25);
    goto LABEL_20;
  }
  if (v3)
  {
    v8 = sub_100024A40();
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v50 = 138543362;
      v51 = CFSTR("/var/MSDWorkContainer");
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Factory cache exists so spare the work container: %{public}@", (uint8_t *)&v50, 0xCu);
    }

  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
    v11 = objc_msgSend(v10, "removeDirectory:", CFSTR("/var/MSDWorkContainer"));

    if ((v11 & 1) == 0)
    {
      v42 = sub_100024A40();
      v18 = objc_claimAutoreleasedReturnValue(v42);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_100030254(v18, v43, v44, v45, v46, v47, v48, v49);
      goto LABEL_20;
    }
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v13 = objc_msgSend(v12, "removeDirectory:", CFSTR("/private/var/.backup"));

  if ((v13 & 1) != 0)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
    v15 = objc_msgSend(v14, "destroyWorkContainerInUserHome");

    if ((v15 & 1) != 0)
      return 1;
    v34 = sub_100024A40();
    v18 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000301B4(v18, v35, v36, v37, v38, v39, v40, v41);
  }
  else
  {
    v26 = sub_100024A40();
    v18 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1000301E4(v18, v27, v28, v29, v30, v31, v32, v33);
  }
LABEL_20:

  return 0;
}

- (BOOL)prepareWorkDirectory:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[MSDHMessageResponder prepareWorkDirectory:]";
    v13 = 2114;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Path")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("WritableByNonRoot")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v9 = objc_msgSend(v8, "prepareDirectory:writableByNonRoot:", v6, objc_msgSend(v7, "BOOLValue"));

  return v9;
}

- (BOOL)removeWorkDirectory:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  int v10;
  void *i;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  id v23;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "-[MSDHMessageResponder removeWorkDirectory:]";
    v22 = 2114;
    v23 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", buf, 0x16u);
  }

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v3;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    v10 = 1;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance", (_QWORD)v15));
        v10 &= objc_msgSend(v13, "removeDirectory:", v12);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }
  else
  {
    LOBYTE(v10) = 1;
  }

  return v10;
}

- (BOOL)createDeviceManifest:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[MSDHMessageResponder createDeviceManifest:]";
    v16 = 2114;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("ComponentID")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("ComponentType")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("RootPath")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("UserHomePath")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("SavePath")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v12 = objc_msgSend(v11, "createDeviceManifestForComponent:ofType:withRootPath:userHomePath:andSavePath:", v6, v7, v8, v9, v10);

  return v12;
}

- (BOOL)fileExistsAtPath:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[MSDHMessageResponder fileExistsAtPath:]";
    v11 = 2114;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v7 = objc_msgSend(v6, "fileExistsAtPath:", v3);

  return v7;
}

- (BOOL)readPlistFile:(id)a3 outContent:(id *)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v5 = a3;
  v6 = sub_100024A40();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[MSDHMessageResponder readPlistFile:outContent:]";
    v13 = 2114;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "readPlistFile:", v5));

  if (a4)
    *a4 = objc_retainAutorelease(v9);

  return v9 != 0;
}

- (BOOL)touchFile:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[MSDHMessageResponder touchFile:]";
    v16 = 2114;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("FilePath")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("FileOwnerName")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("FileGroupOwnerName")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("FilePosixPermissions")));
  if (v8)
    objc_msgSend(v6, "setObject:forKey:", v8, NSFileOwnerAccountName);
  if (v9)
    objc_msgSend(v6, "setObject:forKey:", v9, NSFileGroupOwnerAccountName);
  if (v10)
    objc_msgSend(v6, "setObject:forKey:", v10, NSFilePosixPermissions);
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v12 = objc_msgSend(v11, "touchFile:fileAttributes:", v7, v6);

  return v12;
}

- (BOOL)cloneFile:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    sub_100030334();

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("FilePath")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("StatingPath")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("ExpectedHash")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("CorrectOwnership")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v11 = objc_msgSend(v10, "cloneFile:to:expectingHash:correctOwnership:", v6, v7, v8, objc_msgSend(v9, "BOOLValue"));

  return v11;
}

- (BOOL)restoreBackupAttributes:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v15 = 136315394;
    v16 = "-[MSDHMessageResponder restoreBackupAttributes:]";
    v17 = 2114;
    v18 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v15, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("StagingRootPath")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Location")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Length")));
  v9 = objc_msgSend(v7, "integerValue");
  v10 = objc_msgSend(v8, "integerValue");
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("ManifestUID")));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("DeviceUID")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  LOBYTE(v9) = objc_msgSend(v13, "restoreBackupAttributesUnder:range:manifestUID:deviceUID:", v6, v9, v10, v11, v12);

  return (char)v9;
}

- (BOOL)restoreAppDataAttributes:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[MSDHMessageResponder restoreAppDataAttributes:]";
    v16 = 2114;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("StagingRootPath")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("ContentType")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Identifier")));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("ManifestUID")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("DeviceUID")));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v12 = objc_msgSend(v11, "restoreAppDataAttributesUnder:containerType:identifier:manifestUID:deviceUID:", v6, v7, v8, v9, v10);

  return v12;
}

- (BOOL)deleteNvram:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[MSDHMessageResponder deleteNvram:]";
    v11 = 2114;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v7 = objc_msgSend(v6, "deleteNvram:", v3);

  return v7;
}

- (BOOL)writeNvram:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  int v11;
  const char *v12;
  __int16 v13;
  id v14;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 136315394;
    v12 = "-[MSDHMessageResponder writeNvram:]";
    v13 = 2114;
    v14 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v11, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Name")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Value")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v9 = objc_msgSend(v8, "writeNVRam:withValue:", v6, v7);

  return v9;
}

- (BOOL)manageVolume:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  unsigned __int8 v9;
  unsigned __int8 v10;
  void *v12;
  id v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[MSDHMessageResponder manageVolume:]";
    v16 = 2114;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v14, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Target")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Operation")));
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Data")))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
    v9 = -[NSObject manageDataVolume:](v8, "manageDataVolume:", v7);
LABEL_7:
    v10 = v9;
    goto LABEL_8;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("Demo")))
  {
    v8 = objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
    v9 = -[NSObject manageDemoVolume:](v8, "manageDemoVolume:", v7);
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("User")))
  {
    v8 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("UserName")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
    v10 = objc_msgSend(v12, "manageUserVolume:forUser:", v7, v8);

  }
  else
  {
    v13 = sub_100024A40();
    v8 = objc_claimAutoreleasedReturnValue(v13);
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      v14 = 138543362;
      v15 = (const char *)v6;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Unknown volume target: %{public}@", (uint8_t *)&v14, 0xCu);
    }
    v10 = 0;
  }
LABEL_8:

  return v10;
}

- (BOOL)moveStagingToFinal:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  unsigned __int8 v15;
  void *v16;
  unsigned int v17;
  BOOL v18;
  MSDHMessageResponder *obj;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const char *v28;
  __int16 v29;
  id v30;

  v21 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v28 = "-[MSDHMessageResponder moveStagingToFinal:]";
    v29 = 2114;
    v30 = v21;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", buf, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("StagingPaths")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKey:", CFSTR("FinalPath")));
  obj = self;
  objc_sync_enter(obj);
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v23;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v10)
          objc_enumerationMutation(v8);
        v12 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v13 = objc_autoreleasePoolPush();
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
        v15 = objc_msgSend(v14, "moveUserHomeStagingToFinal:finalPath:", v12, v7);

        if ((v15 & 1) != 0)
        {
          v16 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
          v17 = objc_msgSend(v16, "moveStagingToFinal:finalPath:", v12, v7);

        }
        else
        {
          v17 = 0;
        }
        objc_autoreleasePoolPop(v13);
        if (!v17)
        {
          v18 = 0;
          goto LABEL_16;
        }
      }
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      if (v9)
        continue;
      break;
    }
  }
  v18 = 1;
LABEL_16:

  objc_sync_exit(obj);
  return v18;
}

- (BOOL)switchToBackupFolder:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[MSDHMessageResponder switchToBackupFolder:]";
    v11 = 2114;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v7 = objc_msgSend(v6, "switchToBackupFolder");

  return v7;
}

- (BOOL)disableLaunchdServicesForWatch:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[MSDHMessageResponder disableLaunchdServicesForWatch:]";
    v11 = 2114;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v7 = objc_msgSend(v6, "disableLaunchdServicesForWatch");

  return v7;
}

- (BOOL)reboot:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[MSDHMessageResponder reboot:]";
    v11 = 2114;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v7 = objc_msgSend(v6, "reboot");

  return v7;
}

- (BOOL)quitHelper:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  unsigned __int8 v7;
  int v9;
  const char *v10;
  __int16 v11;
  id v12;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v9 = 136315394;
    v10 = "-[MSDHMessageResponder quitHelper:]";
    v11 = 2114;
    v12 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v9, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v7 = objc_msgSend(v6, "quitHelper");

  return v7;
}

- (BOOL)collectDemoLogsToFolder:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  unsigned __int8 v8;
  int v10;
  const char *v11;
  __int16 v12;
  id v13;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v10 = 136315394;
    v11 = "-[MSDHMessageResponder collectDemoLogsToFolder:]";
    v12 = 2114;
    v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v10, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("logFileDirectory")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v8 = objc_msgSend(v7, "collectDemoLogsToFolder:", v6);

  return v8;
}

- (BOOL)preserveBluetoothFileToShelter:(id)a3
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "objectForKey:", CFSTR("SourcePath")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v5 = objc_msgSend(v4, "preserveBluetoothFileToShelter:", v3);

  return v5;
}

- (BOOL)restartBluetooth:(id)a3
{
  void *v3;
  unsigned __int8 v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance", a3));
  v4 = objc_msgSend(v3, "restartBluetooth");

  return v4;
}

- (BOOL)setComputerNameAndHostname:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  unsigned __int8 v12;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v14 = 136315394;
    v15 = "-[MSDHMessageResponder setComputerNameAndHostname:]";
    v16 = 2114;
    v17 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "%s - request:  %{public}@", (uint8_t *)&v14, 0x16u);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("ComputerName")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Encoding")));
  v8 = objc_msgSend(v7, "unsignedIntValue");

  v9 = sub_100024A40();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    sub_1000303AC();

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v12 = objc_msgSend(v11, "setComputerNameAndHostname:encoding:", v6, v8);

  return v12;
}

- (BOOL)executeTestScriptOfIdentifier:(id)a3
{
  id v3;
  id v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  int v16;
  const char *v17;
  __int16 v18;
  id v19;

  v3 = a3;
  v4 = sub_100024A40();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 136315394;
    v17 = "-[MSDHMessageResponder executeTestScriptOfIdentifier:]";
    v18 = 2114;
    v19 = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", (uint8_t *)&v16, 0x16u);
  }

  v6 = sub_100024A40();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    sub_100030428(v7, v8, v9, v10, v11, v12, v13, v14);

  return 0;
}

- (BOOL)preserveSecondPartyAppDataToShelter:(id)a3 outErrorDict:(id *)a4
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  id v12;
  const __CFString *v13;
  id v14;
  uint8_t buf[4];
  const char *v16;
  __int16 v17;
  id v18;

  v5 = a3;
  v6 = sub_100024A40();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 136315394;
    v16 = "-[MSDHMessageResponder preserveSecondPartyAppDataToShelter:outErrorDict:]";
    v17 = 2114;
    v18 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Entering %s with parameter: %{public}@", buf, 0x16u);
  }

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v12 = 0;
  v9 = objc_msgSend(v8, "preserveSecondPartyAppDataToShelter:withReturnErrorMsg:", v5, &v12);
  v10 = v12;

  if ((v9 & 1) == 0 && a4 && v10)
  {
    v13 = CFSTR("ErrorMsg");
    v14 = v10;
    *a4 = (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1));
  }

  return v9;
}

- (BOOL)setPreferences:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  unsigned __int8 v11;
  int v13;
  const char *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  void *v22;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Key")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("Value")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("ApplicationId")));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectForKey:", CFSTR("UserName")));

  v8 = sub_100024A40();
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 136316162;
    v14 = "-[MSDHMessageResponder setPreferences:]";
    v15 = 2114;
    v16 = v4;
    v17 = 2114;
    v18 = v5;
    v19 = 2114;
    v20 = v6;
    v21 = 2114;
    v22 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: entered - key:  %{public}@ - value:  %{public}@ - appId:  %{public}@ - user:  %{public}@", (uint8_t *)&v13, 0x34u);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MSDHOperations sharedInstance](MSDHOperations, "sharedInstance"));
  v11 = objc_msgSend(v10, "setPreferencesForKey:withValue:forApplication:andUser:", v4, v5, v6, v7);

  return v11;
}

- (void)_handleXPCMessage:(id)a3 fromConnection:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSString *v11;
  void *v12;
  SEL v13;
  SEL v14;
  uint64_t (*v15)(MSDHMessageResponder *, SEL, void *, id *);
  uint64_t v16;
  id v17;
  id v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  id v27;
  NSObject *v28;
  id v29;
  id v30;
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("readPlistFile:outContent:"), CFSTR("preserveSecondPartyAppDataToShelter:outErrorDict:"), 0));
  if (-[MSDHMessageResponder hasEntitlementMobileStoreDemod:](self, "hasEntitlementMobileStoreDemod:", v7))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithXPCDictionary:](NSDictionary, "dictionaryWithXPCDictionary:", v6));
    v10 = v9;
    if (!v9)
    {
      v16 = 0;
      v17 = 0;
      v11 = 0;
      v12 = 0;
      goto LABEL_10;
    }
    v11 = (NSString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("command")));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKey:", CFSTR("payload")));
    if (-[MSDHMessageResponder isCommandAllowed:](self, "isCommandAllowed:", v11))
    {
      v13 = NSSelectorFromString(v11);
      if (v13)
      {
        v14 = v13;
        if ((objc_opt_respondsToSelector(self, v13) & 1) != 0)
        {
          v15 = (uint64_t (*)(MSDHMessageResponder *, SEL, void *, id *))-[MSDHMessageResponder methodForSelector:](self, "methodForSelector:", v14);
          if (objc_msgSend(v8, "containsObject:", v11))
          {
            v31 = 0;
            v16 = v15(self, v14, v12, &v31);
            v17 = v31;
            goto LABEL_10;
          }
          v16 = ((uint64_t (*)(MSDHMessageResponder *, SEL, void *))v15)(self, v14, v12);
LABEL_9:
          v17 = 0;
          goto LABEL_10;
        }
        v30 = sub_100024A40();
        v28 = objc_claimAutoreleasedReturnValue(v30);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_1000304F8((uint64_t)self, (uint64_t)v11, v28);
      }
      else
      {
        v29 = sub_100024A40();
        v28 = objc_claimAutoreleasedReturnValue(v29);
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          sub_100030498();
      }
    }
    else
    {
      v27 = sub_100024A40();
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
        sub_10003059C();
    }

    v16 = 0;
    goto LABEL_9;
  }
  v18 = sub_100024A40();
  v19 = objc_claimAutoreleasedReturnValue(v18);
  if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    sub_1000305FC(v19, v20, v21, v22, v23, v24, v25, v26);

  v16 = 0;
  v17 = 0;
  v11 = 0;
  v12 = 0;
  v10 = 0;
LABEL_10:
  -[MSDHMessageResponder sendResponse:withPayload:forRequest:fromConnection:](self, "sendResponse:withPayload:forRequest:fromConnection:", v16, v17, v6, v7);

}

- (OS_dispatch_queue)messageHandlerQueue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMessageHandlerQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_messageHandlerQueue, 0);
}

@end
