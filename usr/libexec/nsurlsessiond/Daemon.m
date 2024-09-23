@implementation Daemon

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6;
  void *v7;
  BOOL v8;
  int v9;
  void *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  NSObject *v17;
  id v18;
  void *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  const char *v28;
  NSObject *v29;
  BOOL v30;
  void *v31;
  BOOL v32;
  NDSessionManager *v33;
  NDSessionManager *v34;
  void *v35;
  void *v36;
  id v37;
  _QWORD *v38;
  _QWORD *v39;
  unsigned int v41;
  char isKindOfClass;
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _OWORD v51[2];
  void *v52;
  __int128 v53;
  __int128 v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;

  v43 = a3;
  v6 = a4;
  v7 = v6;
  v53 = 0u;
  v54 = 0u;
  if (v6)
    objc_msgSend(v6, "auditToken");
  v52 = 0;
  v51[0] = v53;
  v51[1] = v54;
  v8 = CPCopyBundleIdentifierAndTeamFromAuditToken(v51, &v52, 0) != 0;
  v9 = v8 && v52 != 0;
  if (v8 && v52 != 0)
    v10 = v52;
  else
    v10 = 0;
  v11 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v56 = v7;
    v57 = 2112;
    v58 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Evaluating new XPC connection %@ with client bundle identifier %@", buf, 0x16u);
  }
  if ((v9 & 1) != 0)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", v10, 0, 0));
    v13 = objc_opt_class(LSApplicationRecord);
    if ((objc_opt_isKindOfClass(v12, v13) & 1) != 0)
    {
      isKindOfClass = 1;
    }
    else
    {
      v14 = objc_opt_class(LSApplicationExtensionRecord);
      isKindOfClass = objc_opt_isKindOfClass(v12, v14);
    }

  }
  else
  {
    isKindOfClass = 0;
  }
  v41 = objc_msgSend(v7, "processIdentifier");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "_xpcConnection"));
  if ((v9 & xpc_connection_is_extension()) == 1)
  {
    v16 = v10;
    v17 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Client is a PlugIn with bundle identifier %@", buf, 0xCu);
    }
    v18 = objc_msgSend(objc_alloc((Class)LSApplicationExtensionRecord), "initWithBundleIdentifier:error:", v16, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "containingBundleRecord"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "bundleIdentifier"));

    v21 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v56 = v20;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Containing app for PlugIn is %@", buf, 0xCu);
    }
    if ((sub_10001FE28(v18) & 1) != 0)
    {
      v22 = qword_1000C7158;
      v23 = v16;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Client is an independent extension", buf, 2u);
        v23 = v16;
      }
    }
    else
    {
      v23 = v20;

      v24 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Client is an extension", buf, 2u);
      }
    }
    v25 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v56 = v23;
      v57 = 2112;
      v58 = v16;
      v59 = 2112;
      v60 = v20;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Using identifier %@ for PlugIn %@ with containing app %@", buf, 0x20u);
    }

  }
  else
  {
    v23 = v10;
  }
  if (v23)
  {
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities bundleManagerPath:](NDFileUtilities, "bundleManagerPath:", v23));
    if (v26)
    {
      if (!sub_1000131C4(v7, CFSTR("com.apple.developer.on-demand-install-capable")))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_clients, "objectForKeyedSubscript:", v23));
        v32 = v31 == 0;

        if (v32)
        {
          v34 = -[NDSessionManager initWithDelegate:bundleID:isSpringBoardApp:forPersona:dataSeparatedPath:db:]([NDSessionManager alloc], "initWithDelegate:bundleID:isSpringBoardApp:forPersona:dataSeparatedPath:db:", self, v23, isKindOfClass & 1, 0, 0, self->_sessionTasksDB);
          -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clients, "setObject:forKeyedSubscript:", v34, v23);
          v33 = v34;
          -[Daemon archiveState](self, "archiveState");
        }
        else
        {
          v33 = (NDSessionManager *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](self->_clients, "objectForKeyedSubscript:", v23));
        }
        v35 = (void *)objc_claimAutoreleasedReturnValue(+[__NSCFURLSessionXPC bgSessionManagerInterface](__NSCFURLSessionXPC, "bgSessionManagerInterface"));
        objc_msgSend(v7, "setExportedInterface:", v35);

        objc_msgSend(v7, "setExportedObject:", v33);
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[NDSessionManager queue](v33, "queue"));
        objc_msgSend(v7, "_setQueue:", v36);

        v48[0] = _NSConcreteStackBlock;
        v48[1] = 3221225472;
        v48[2] = sub_10005FD3C;
        v48[3] = &unk_1000B1E90;
        v37 = v7;
        v49 = v37;
        v50 = v23;
        v46[0] = _NSConcreteStackBlock;
        v46[1] = 3221225472;
        v46[2] = sub_10005FF14;
        v46[3] = &unk_1000B1EB8;
        v38 = objc_retainBlock(v48);
        v47 = v38;
        objc_msgSend(v37, "setInvalidationHandler:", v46);
        v44[0] = _NSConcreteStackBlock;
        v44[1] = 3221225472;
        v44[2] = sub_10005FF24;
        v44[3] = &unk_1000B1EB8;
        v39 = v38;
        v45 = v39;
        objc_msgSend(v37, "setInterruptionHandler:", v44);
        objc_msgSend(v37, "resume");

        v30 = 1;
        goto LABEL_42;
      }
      v27 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v56 = v23;
        v57 = 1024;
        LODWORD(v58) = v41;
        v28 = "Process with bundleID %@ [pid %d] is an app clip, rejecting connection";
LABEL_45:
        _os_log_error_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, v28, buf, 0x12u);
      }
    }
    else
    {
      v27 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v56 = v23;
        v57 = 1024;
        LODWORD(v58) = v41;
        v28 = "Process with bundleID %@ [pid %d] does not have a bundle path, rejecting connection";
        goto LABEL_45;
      }
    }
    v30 = 0;
LABEL_42:

    goto LABEL_43;
  }
  v29 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v56) = v41;
    _os_log_error_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "Process with pid %d does not have a bundle ID, rejecting connection", buf, 8u);
  }
  v30 = 0;
LABEL_43:

  return v30;
}

+ (id)sharedDaemon
{
  if (qword_1000C7128 != -1)
    dispatch_once(&qword_1000C7128, &stru_1000B1DC0);
  return (id)qword_1000C7130;
}

- (BOOL)isInSyncBubble
{
  return self->_inSyncBubble;
}

- (BOOL)isPrivileged
{
  return self->_privileged;
}

- (void)addTransaction
{
  dispatch_async((dispatch_queue_t)self->_transactionQueue, &stru_1000B1F28);
}

- (void)archiveState
{
  void *v3;
  void *v4;
  NSMutableDictionary *clients;
  id v6;
  void *v7;
  unsigned __int8 v8;
  NSObject *v9;
  _QWORD v10[4];
  id v11;
  uint8_t buf[4];
  void *v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon archivePath](self, "archivePath"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  clients = self->_clients;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10001AC74;
  v10[3] = &unk_1000B1E28;
  v6 = v4;
  v11 = v6;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](clients, "enumerateKeysAndObjectsUsingBlock:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSKeyedArchiver archivedDataWithRootObject:requiringSecureCoding:error:](NSKeyedArchiver, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, 0));
  v8 = objc_msgSend(v7, "writeToFile:atomically:", v3, 1);

  if ((v8 & 1) == 0)
  {
    v9 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v13 = v3;
      _os_log_error_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to write archive to path: %@", buf, 0xCu);
    }
  }

}

- (id)archivePath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](NDFileUtilities, "nsurlsessiondPath"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("bundles.plist")));

  return v3;
}

- (void)createDaemonDirectory
{
  void *v3;
  void *v4;
  void *v5;
  unsigned int v6;
  void *v7;
  unsigned __int8 v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NDTaskStorageDB *v16;
  NDTaskStorageDB *sessionTasksDB;
  void *v18;
  void *v19;
  id v20;
  id v21;
  char v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  id v26;
  __int16 v27;
  id v28;
  NSFileAttributeKey v29;
  NSFileProtectionType v30;

  v29 = NSFileProtectionKey;
  v30 = NSFileProtectionCompleteUntilFirstUserAuthentication;
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v30, &v29, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v22 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](NDFileUtilities, "nsurlsessiondPath"));
  v6 = objc_msgSend(v4, "fileExistsAtPath:isDirectory:", v5, &v22);

  if (v6)
  {
    if (v22)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](NDFileUtilities, "nsurlsessiondPath"));
      v21 = 0;
      v8 = objc_msgSend(v4, "setAttributes:ofItemAtPath:error:", v3, v7, &v21);
      v9 = v21;

      if ((v8 & 1) == 0)
      {
        v10 = (id)qword_1000C7158;
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](NDFileUtilities, "nsurlsessiondPath"));
          v20 = objc_msgSend(v9, "code");
          *(_DWORD *)buf = 138412802;
          v24 = v19;
          v25 = 2112;
          v26 = v9;
          v27 = 2048;
          v28 = v20;
          _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Could not set attributes of directory at %@, error: %@ [%ld]", buf, 0x20u);

        }
      }
    }
    else
    {
      v11 = (id)qword_1000C7158;
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](NDFileUtilities, "nsurlsessiondPath"));
        *(_DWORD *)buf = 138412290;
        v24 = v18;
        _os_log_error_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Non-directory file exists at: %@. Removing it.", buf, 0xCu);

      }
      v9 = (id)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](NDFileUtilities, "nsurlsessiondPath"));
      +[NDFileUtilities removeItemAtPath:](NDFileUtilities, "removeItemAtPath:", v9);
    }

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](NDFileUtilities, "nsurlsessiondPath"));
  self->_createdDataVault = +[NDFileUtilities createDataVaultDirectoryAtPath:](NDFileUtilities, "createDataVaultDirectoryAtPath:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondLaunchdPath](NDFileUtilities, "nsurlsessiondLaunchdPath"));
  +[NDFileUtilities createDirectoryAtPath:](NDFileUtilities, "createDirectoryAtPath:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities nsurlsessiondPath](NDFileUtilities, "nsurlsessiondPath"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:](NSURL, "fileURLWithPath:", v14));

  v16 = -[NDTaskStorageDB _initDB:]([NDTaskStorageDB alloc], "_initDB:", v15);
  sessionTasksDB = self->_sessionTasksDB;
  self->_sessionTasksDB = v16;

}

- (Daemon)init
{
  Daemon *v2;
  uint64_t v3;
  NSMutableDictionary *clients;
  dispatch_queue_attr_t v5;
  NSObject *v6;
  dispatch_queue_attr_t v7;
  NSObject *v8;
  dispatch_queue_t v9;
  OS_dispatch_queue *queue;
  dispatch_queue_attr_t v11;
  NSObject *v12;
  dispatch_queue_attr_t v13;
  NSObject *v14;
  dispatch_queue_t v15;
  OS_dispatch_queue *transactionQueue;
  void *v17;
  id v18;
  OS_dispatch_source *archiveTimer;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)Daemon;
  v2 = -[Daemon init](&v21, "init");
  if (v2)
  {
    v3 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    clients = v2->_clients;
    v2->_clients = (NSMutableDictionary *)v3;

    v5 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    v7 = dispatch_queue_attr_make_with_qos_class(v6, QOS_CLASS_UTILITY, 0);
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v9 = dispatch_queue_create("com.apple.nsurlsessiond.daemon-queue", v8);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v9;

    v11 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = dispatch_queue_attr_make_with_qos_class(v12, QOS_CLASS_UTILITY, 0);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = dispatch_queue_create("com.apple.nsurlsessiond-xpc-transaction-queue", v14);
    transactionQueue = v2->_transactionQueue;
    v2->_transactionQueue = (OS_dispatch_queue *)v15;

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[LSApplicationWorkspace defaultWorkspace](LSApplicationWorkspace, "defaultWorkspace"));
    objc_msgSend(v17, "addObserver:", v2);

    v18 = +[NDUserSyncStakeholder sharedStakeholder](NDUserSyncStakeholder, "sharedStakeholder");
    archiveTimer = v2->_archiveTimer;
    v2->_archiveTimer = 0;

  }
  return v2;
}

- (BOOL)applicationIsInstalled:(id)a3
{
  void *v3;
  BOOL v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[LSBundleRecord bundleRecordWithBundleIdentifier:allowPlaceholder:error:](LSBundleRecord, "bundleRecordWithBundleIdentifier:allowPlaceholder:error:", a3, 0, 0));
  v4 = v3 != 0;

  return v4;
}

- (void)setupNewClassMappingsForUnarchiver
{
  uint64_t v2;

  v2 = objc_opt_class(__NSCFURLSessionTaskInfo);
  +[NSKeyedUnarchiver setClass:forClassName:](NSKeyedUnarchiver, "setClass:forClassName:", v2, CFSTR("NDTaskInfo"));
}

- (void)restoreState
{
  void *v3;
  id v4;
  uint64_t v5;
  id v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  uint64_t v10;
  __objc2_meth_list **p_opt_inst_meths;
  void *i;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  unsigned int v17;
  unsigned int v18;
  NDSessionManager *v19;
  void *v20;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  id v24;
  id v25;
  uint64_t v26;
  void *j;
  void *v28;
  void *v29;
  double v30;
  _BOOL4 v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id obj;
  void *v41;
  id v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  char v47;
  char v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  _BYTE v53[128];
  uint8_t v54[128];
  uint8_t buf[4];
  void *v56;

  -[Daemon setupNewClassMappingsForUnarchiver](self, "setupNewClassMappingsForUnarchiver");
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon archivePath](self, "archivePath"));
  v4 = sub_10001F820((uint64_t)NSKeyedUnarchiver, v3);
  v38 = (void *)objc_claimAutoreleasedReturnValue(v4);

  v5 = objc_opt_class(NSDictionary);
  if ((objc_opt_isKindOfClass(v38, v5) & 1) != 0)
  {
    v42 = v38;
    v6 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "allKeys"));
  }
  else
  {
    v7 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v38, v7) & 1) != 0)
    {
      v6 = v38;
    }
    else
    {
      if (v38)
      {
        v8 = qword_1000C7158;
        if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v56 = v38;
          _os_log_error_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Bundle ID Archive %@ has unexpected format", buf, 0xCu);
        }
      }
      v6 = 0;
    }
    v42 = 0;
  }
  v51 = 0u;
  v52 = 0u;
  v49 = 0u;
  v50 = 0u;
  obj = v6;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v50;
    p_opt_inst_meths = &OBJC_PROTOCOL___NSCopying.opt_inst_meths;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v50 != v10)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v49 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NDFileUtilities bundleManagerPath:](NDFileUtilities, "bundleManagerPath:", v13, v38));
        if (v42)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "objectForKeyedSubscript:", v13));
          v16 = (uint64_t)objc_msgSend(v15, "BOOLValue");

        }
        else
        {
          v16 = 1;
        }
        v48 = 0;
        v17 = objc_msgSend(v41, "fileExistsAtPath:isDirectory:", v14, &v48);
        if (v48)
          v18 = v17;
        else
          v18 = 0;
        if (v18 == 1)
        {
          if ((_DWORD)v16 && !-[Daemon applicationIsInstalled:](self, "applicationIsInstalled:", v13))
          {
            v23 = p_opt_inst_meths[43];
            if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v13;
              _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Application %@ is not installed, removing directory", buf, 0xCu);
            }
            +[NDFileUtilities removeItemAtPath:](NDFileUtilities, "removeItemAtPath:", v14);
          }
          else
          {
            v19 = -[NDSessionManager initWithDelegate:bundleID:isSpringBoardApp:forPersona:dataSeparatedPath:db:]([NDSessionManager alloc], "initWithDelegate:bundleID:isSpringBoardApp:forPersona:dataSeparatedPath:db:", self, v13, v16, 0, 0, self->_sessionTasksDB);
            v47 = 0;
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[NDSessionManager restoreState:](v19, "restoreState:", &v47));
            if (v47)
            {
              v21 = p_opt_inst_meths[43];
              if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v56 = v13;
                _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "NDSessionManager for client %@ was empty, not restoring", buf, 0xCu);
              }
            }
            else
            {
              objc_msgSend(v39, "addObjectsFromArray:", v20);
              -[NSMutableDictionary setObject:forKeyedSubscript:](self->_clients, "setObject:forKeyedSubscript:", v19, v13);
            }

            p_opt_inst_meths = (__objc2_meth_list **)(&OBJC_PROTOCOL___NSCopying + 40);
          }
        }
        else
        {
          v22 = p_opt_inst_meths[43];
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v56 = v13;
            _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "No directory for bundleID: %@", buf, 0xCu);
          }
        }

      }
      v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v49, v54, 16);
    }
    while (v9);
  }

  -[Daemon archiveState](self, "archiveState");
  v45 = 0u;
  v46 = 0u;
  v43 = 0u;
  v44 = 0u;
  v24 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "sortedArrayUsingComparator:", &stru_1000B1E00));
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
  if (v25)
  {
    v26 = *(_QWORD *)v44;
    do
    {
      for (j = 0; j != v25; j = (char *)j + 1)
      {
        if (*(_QWORD *)v44 != v26)
          objc_enumerationMutation(v24);
        v28 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * (_QWORD)j);
        if (-[Daemon isInSyncBubble](self, "isInSyncBubble", v38))
        {
          if (objc_msgSend(v28, "taskKind") != (id)1)
            continue;
          v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "originalRequest"));
          objc_msgSend(v29, "_timeWindowDelay");
          v31 = v30 == 0.0;

          if (!v31)
            continue;
        }
        v32 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserSyncStakeholder sharedStakeholder](NDUserSyncStakeholder, "sharedStakeholder"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "uniqueIdentifier"));
        objc_msgSend(v32, "restoredTaskEnqueued:", v33);

        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "sessionID"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bundleID"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[Daemon getSessionWithIdentifier:forBundleID:](self, "getSessionWithIdentifier:forBundleID:", v34, v35));

        objc_msgSend(v36, "requeueTask:", objc_msgSend(v28, "identifier"));
      }
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v43, v53, 16);
    }
    while (v25);
  }

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserSyncStakeholder sharedStakeholder](NDUserSyncStakeholder, "sharedStakeholder"));
  objc_msgSend(v37, "tasksHaveBeenEnqueued");

}

- (void)setupArchiveTimer
{
  OS_dispatch_source *v3;
  OS_dispatch_source *archiveTimer;
  NSObject *v5;
  NSObject *v6;
  dispatch_time_t v7;
  _QWORD handler[5];

  if (!self->_archiveTimer)
  {
    v3 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)self->_queue);
    archiveTimer = self->_archiveTimer;
    self->_archiveTimer = v3;

    v5 = self->_archiveTimer;
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10001AC60;
    handler[3] = &unk_1000B23A0;
    handler[4] = self;
    dispatch_source_set_event_handler(v5, handler);
    v6 = self->_archiveTimer;
    v7 = dispatch_time(0, 10000000000);
    dispatch_source_set_timer(v6, v7, 0x2540BE400uLL, 0x3B9ACA00uLL);
    dispatch_resume((dispatch_object_t)self->_archiveTimer);
  }
}

- (id)getSessionWithIdentifier:(id)a3 forBundleID:(id)a4
{
  id v6;
  id v7;
  NSObject *queue;
  id v9;
  id v10;
  id v11;
  _QWORD v13[5];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v7 = a4;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = sub_10005FCB4;
  v21 = sub_10005FCC4;
  v22 = 0;
  queue = self->_queue;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10005FCCC;
  v13[3] = &unk_1000B1EE0;
  v13[4] = self;
  v14 = v7;
  v15 = v6;
  v16 = &v17;
  v9 = v6;
  v10 = v7;
  dispatch_sync(queue, v13);
  v11 = (id)v18[5];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (void)managerBecameEmpty:(id)a3 bundleID:(id)a4 withCompletionHandler:(id)a5
{
  id v7;
  id v8;
  NSObject *queue;
  id v10;
  id v11;
  _QWORD block[5];
  id v13;
  id v14;

  v7 = a4;
  v8 = a5;
  queue = self->_queue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10005FC14;
  block[3] = &unk_1000B1F08;
  block[4] = self;
  v13 = v7;
  v14 = v8;
  v10 = v8;
  v11 = v7;
  dispatch_async(queue, block);

}

- (void)releaseTransaction
{
  dispatch_async((dispatch_queue_t)self->_transactionQueue, &stru_1000B1F48);
}

- (id)bundleIDsForAppProxies:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *j;
  void *v15;
  id obj;
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

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableSet set](NSMutableSet, "set", v3));
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v3;
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v23 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIdentifier"));
        objc_msgSend(v4, "addObject:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "plugInKitPlugins"));
        v20 = 0u;
        v21 = 0u;
        v18 = 0u;
        v19 = 0u;
        v11 = v10;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v12; j = (char *)j + 1)
            {
              if (*(_QWORD *)v19 != v13)
                objc_enumerationMutation(v11);
              v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1)
                                                                                 + 8 * (_QWORD)j), "pluginIdentifier"));
              objc_msgSend(v4, "addObject:", v15);

            }
            v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v12);
        }

      }
      v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v5);
  }

  return v4;
}

- (void)applicationsDidInstall:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005FA30;
  v7[3] = &unk_1000B23F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)applicationsDidUninstall:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10005F858;
  v7[3] = &unk_1000B23F0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, v7);

}

- (void)waitUntilDeviceIsUnlocked
{
  NSObject *v2;
  dispatch_semaphore_t v3;
  NSObject *v4;
  NSObject *v5;
  _QWORD *v6;
  const char *v7;
  int *v8;
  _QWORD *v9;
  NSObject *v10;
  _QWORD block[5];
  uint8_t v12[8];
  _QWORD handler[4];
  id v14;
  uint8_t *v15;
  _QWORD v16[4];
  NSObject *v17;
  uint8_t buf[8];
  uint8_t *v19;
  uint64_t v20;
  int v21;

  if (MKBDeviceFormattedForContentProtection(self, a2) && MKBDeviceUnlockedSinceBoot() != 1)
  {
    v2 = qword_1000C7158;
    if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Waiting for first unlock", buf, 2u);
    }
    *(_QWORD *)buf = 0;
    v19 = buf;
    v20 = 0x2020000000;
    v21 = 0;
    v3 = dispatch_semaphore_create(0);
    v4 = dispatch_queue_create("com.apple.nsurlsessiond.wait-unlock", 0);
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10005F778;
    v16[3] = &unk_1000B23A0;
    v5 = v3;
    v17 = v5;
    v6 = objc_retainBlock(v16);
    v7 = (const char *)kMobileKeyBagLockStatusNotifyToken;
    v8 = (int *)(v19 + 24);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10005F7FC;
    handler[3] = &unk_1000B1F70;
    v15 = buf;
    v9 = v6;
    v14 = v9;
    if (notify_register_dispatch(v7, v8, v4, handler))
    {
      v10 = qword_1000C7158;
      if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v12 = 0;
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "Failed to regsiter for lock status notification! Calling abort()", v12, 2u);
      }
      abort();
    }
    dispatch_async(v4, v9);
    dispatch_semaphore_wait(v5, 0xFFFFFFFFFFFFFFFFLL);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10005F820;
    block[3] = &unk_1000B1F98;
    block[4] = buf;
    dispatch_sync(v4, block);

    _Block_object_dispose(buf, 8);
  }
}

- (void)start
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  CFIndex AppIntegerValue;
  uint64_t v8;
  void *v9;
  NSString *v10;
  void *v11;
  CFIndex v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[16];

  if (!-[Daemon isInSyncBubble](self, "isInSyncBubble"))
    -[Daemon waitUntilDeviceIsUnlocked](self, "waitUntilDeviceIsUnlocked");
  v3 = qword_1000C7158;
  if (os_log_type_enabled((os_log_t)qword_1000C7158, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "nsurlsessiond started", buf, 2u);
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NDUserEventAgentConnection sharedUserEventAgentConnection](NDUserEventAgentConnection, "sharedUserEventAgentConnection"));
  objc_msgSend(v4, "start");

  -[Daemon createDaemonDirectory](self, "createDaemonDirectory");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NDStatusMonitor sharedMonitor](NDStatusMonitor, "sharedMonitor"));
  objc_msgSend(v5, "start");

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[_DASScheduler sharedScheduler](_DASScheduler, "sharedScheduler"));
  AppIntegerValue = CFPreferencesGetAppIntegerValue(CFSTR("ConnectionPoolLimit"), CFSTR("com.apple.nsurlsessiond"), 0);
  if (AppIntegerValue)
    v8 = AppIntegerValue;
  else
    v8 = 3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityGroup groupWithName:maxConcurrent:](_DASActivityGroup, "groupWithName:maxConcurrent:", CFSTR("NSURLSessionBackgroundPoolName"), v8));
  objc_msgSend(v6, "createActivityGroup:", v9);

  if (-[Daemon isInSyncBubble](self, "isInSyncBubble"))
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("NSURLSessionBackgroundPoolName-sync-%d"), geteuid());
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    v12 = CFPreferencesGetAppIntegerValue(CFSTR("ConnectionPoolLimit"), CFSTR("com.apple.nsurlsessiond"), 0);
    if (v12)
      v13 = v12;
    else
      v13 = 3;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[_DASActivityGroup groupWithName:maxConcurrent:](_DASActivityGroup, "groupWithName:maxConcurrent:", v11, v13));
    objc_msgSend(v6, "createActivityGroup:", v14);

  }
  notify_post("com.apple.nsurlsessiond.started");

}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 56, 1);
}

- (void)setPrivileged:(BOOL)a3
{
  self->_privileged = a3;
}

- (void)setInSyncBubble:(BOOL)a3
{
  self->_inSyncBubble = a3;
}

- (NDUserSyncStakeholder)stakeholder
{
  return (NDUserSyncStakeholder *)objc_getProperty(self, a2, 64, 1);
}

- (void)setStakeholder:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stakeholder, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_sessionTasksDB, 0);
  objc_storeStrong((id *)&self->_archiveTimer, 0);
  objc_storeStrong((id *)&self->_transactionQueue, 0);
  objc_storeStrong((id *)&self->_clients, 0);
}

@end
