@implementation SDResourceManager

+ (id)sharedResourceManager
{
  if (qword_1000B9750 != -1)
    dispatch_once(&qword_1000B9750, &stru_1000990E0);
  return (id)qword_1000B9748;
}

- (SDResourceManager)init
{
  SDResourceManager *v2;
  SDResourceManager *v3;
  uint64_t v4;
  NSMutableDictionary *idManager;
  uint64_t v6;
  NSMutableDictionary *fdManager;
  uint64_t v8;
  NSMutableDictionary *cliManager;
  uint64_t v10;
  NSMutableDictionary *diagnosticManager;
  uint64_t v12;
  NSMutableDictionary *pidManager;
  uint64_t v14;
  NSMutableDictionary *progressManager;
  uint64_t v16;
  NSMutableDictionary *peerManager;
  NSString *possibleClient;
  NSString *currentClient;
  NSDateFormatter *v20;
  NSDateFormatter *dateFormatter;
  objc_super v23;

  v23.receiver = self;
  v23.super_class = (Class)SDResourceManager;
  v2 = -[SDResourceManager init](&v23, "init");
  v3 = v2;
  if (v2)
  {
    v2->_count = 0;
    v4 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    idManager = v3->_idManager;
    v3->_idManager = (NSMutableDictionary *)v4;

    v6 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    fdManager = v3->_fdManager;
    v3->_fdManager = (NSMutableDictionary *)v6;

    v8 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    cliManager = v3->_cliManager;
    v3->_cliManager = (NSMutableDictionary *)v8;

    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    diagnosticManager = v3->_diagnosticManager;
    v3->_diagnosticManager = (NSMutableDictionary *)v10;

    v12 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    pidManager = v3->_pidManager;
    v3->_pidManager = (NSMutableDictionary *)v12;

    v14 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    progressManager = v3->_progressManager;
    v3->_progressManager = (NSMutableDictionary *)v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    peerManager = v3->_peerManager;
    v3->_peerManager = (NSMutableDictionary *)v16;

    possibleClient = v3->_possibleClient;
    v3->_possibleClient = (NSString *)CFSTR("(NONE)");

    currentClient = v3->_currentClient;
    v3->_currentClient = (NSString *)CFSTR("(NONE)");

    v20 = (NSDateFormatter *)objc_alloc_init((Class)NSDateFormatter);
    dateFormatter = v3->_dateFormatter;
    v3->_dateFormatter = v20;

    -[NSDateFormatter setDateFormat:](v3->_dateFormatter, "setDateFormat:", CFSTR("yyyy-MM-dd HH:mm:ss"));
  }
  return v3;
}

- (BOOL)registerDiagnosticObject:(id)a3
{
  id v4;
  void *v5;
  SDResourceManager *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "diagnosticID"));
  if (v5)
  {
    v6 = self;
    objc_sync_enter(v6);
    -[NSMutableDictionary setObject:forKey:](v6->_diagnosticManager, "setObject:forKey:", v4, v5);
    objc_sync_exit(v6);

  }
  return v5 != 0;
}

- (id)diagnosticObjectForDiagnosticID:(id)a3
{
  id v4;
  SDResourceManager *v5;
  void *v6;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_diagnosticManager, "objectForKey:", v4));
    objc_sync_exit(v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)checkAndIncreaseDiagnosticCountForDiagnosticID:(id)a3 collectingLocalLogs:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  SDResourceManager *v7;
  void *v8;
  id v9;
  void *v10;
  BOOL v11;
  id v12;
  int64_t v13;
  int v15;
  int64_t v16;

  v4 = a4;
  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (!v4)
  {
LABEL_12:
    -[SDResourceManager setCount:](v7, "setCount:", (char *)-[SDResourceManager count](v7, "count") + 1);
    v12 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v13 = -[SDResourceManager count](v7, "count");
      v15 = 134217984;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Increased diagnostic atomic count to %ld.", (uint8_t *)&v15, 0xCu);
    }

    v11 = 1;
    goto LABEL_15;
  }
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager localLogCollectionDiagnosticID](v7, "localLogCollectionDiagnosticID"));

    if (v8)
    {
      v9 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager localLogCollectionDiagnosticID](v7, "localLogCollectionDiagnosticID"));
        v15 = 138412290;
        v16 = (int64_t)v10;
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Rejected request for new diagnostic with local logs. Already collecting local logs for %@", (uint8_t *)&v15, 0xCu);

      }
      goto LABEL_9;
    }
    -[SDResourceManager setLocalLogCollectionDiagnosticID:](v7, "setLocalLogCollectionDiagnosticID:", v6);
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v15 = 138412290;
      v16 = (int64_t)v6;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Increasing diagnostic count for local log collection for diagnosticID: %@", (uint8_t *)&v15, 0xCu);
    }
    goto LABEL_12;
  }
  v11 = 0;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v15) = 0;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Rejected request for new diagnostic with local logs - given nil diagnosticID!", (uint8_t *)&v15, 2u);
LABEL_9:
    v11 = 0;
  }
LABEL_15:
  objc_sync_exit(v7);

  return v11;
}

- (BOOL)decreaseDiagnosticCountForDiagnosticID:(id)a3
{
  id v4;
  SDResourceManager *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _BOOL4 v16;
  void *v17;
  _BOOL4 v18;
  id v19;
  void *v20;
  int v22;
  int64_t v23;
  uint8_t buf[24];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[SDResourceManager setCount:](v5, "setCount:", (char *)-[SDResourceManager count](v5, "count") - 1);
  v6 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v22 = 134217984;
    v23 = -[SDResourceManager count](v5, "count");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Decreased diagnostic atomic count to %ld.", (uint8_t *)&v22, 0xCu);
  }

  v7 = &_os_log_default;
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager currentClient](v5, "currentClient"));
    v22 = 138412290;
    v23 = (int64_t)v8;
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Current client %@", (uint8_t *)&v22, 0xCu);

  }
  v9 = -[SDResourceManager count](v5, "count");
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager fdManager](v5, "fdManager"));
  LOBYTE(v9) = v9 == objc_msgSend(v10, "count");

  if ((v9 & 1) == 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager fdManager](v5, "fdManager"));
    -[SDResourceManager setCount:](v5, "setCount:", objc_msgSend(v11, "count"));

    v12 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      sub_10005E76C(buf, -[SDResourceManager count](v5, "count"));

    v13 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager fdManager](v5, "fdManager"));
      v22 = 138412290;
      v23 = (int64_t)v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Current fds: %@", (uint8_t *)&v22, 0xCu);

    }
  }
  v15 = (id)objc_claimAutoreleasedReturnValue(-[SDResourceManager localLogCollectionDiagnosticID](v5, "localLogCollectionDiagnosticID"));
  v16 = v15 == v4;

  if (v16)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = (int64_t)v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Resetting local log collection ID for caller: %@", (uint8_t *)&v22, 0xCu);
    }
    -[SDResourceManager setLocalLogCollectionDiagnosticID:](v5, "setLocalLogCollectionDiagnosticID:", 0);
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager localLogCollectionDiagnosticID](v5, "localLogCollectionDiagnosticID"));
  if (v17)
  {
    v18 = -[SDResourceManager count](v5, "count") == 0;

    if (v18)
    {
      v19 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager localLogCollectionDiagnosticID](v5, "localLogCollectionDiagnosticID"));
        sub_10005E708(v20, (uint64_t)v4, (uint8_t *)&v22);
      }

      -[SDResourceManager setLocalLogCollectionDiagnosticID:](v5, "setLocalLogCollectionDiagnosticID:", 0);
    }
  }
  objc_sync_exit(v5);

  return 1;
}

- (BOOL)decreaseDiagnosticCount
{
  SDResourceManager *v2;
  void *v3;

  v2 = self;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  LOBYTE(v2) = -[SDResourceManager decreaseDiagnosticCountForDiagnosticID:](v2, "decreaseDiagnosticCountForDiagnosticID:", v3);

  return (char)v2;
}

- (BOOL)areDiagnosticsInFlight
{
  SDResourceManager *v2;
  BOOL v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[SDResourceManager count](v2, "count") > 0;
  objc_sync_exit(v2);

  return v3;
}

- (int64_t)numberDiagnosticsInflight
{
  SDResourceManager *v2;
  id v3;

  v2 = self;
  objc_sync_enter(v2);
  v3 = -[NSMutableDictionary count](v2->_fdManager, "count");
  objc_sync_exit(v2);

  return (int64_t)v3;
}

- (id)getCurrentInflightLocalDiagnostic
{
  SDResourceManager *v2;
  void *v3;
  void *v4;
  id v6;
  int v7;
  int64_t v8;

  v2 = self;
  objc_sync_enter(v2);
  if ((id)-[SDResourceManager numberDiagnosticsInflight](v2, "numberDiagnosticsInflight") == (id)1)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allValues](v2->_idManager, "allValues"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));

    objc_sync_exit(v2);
    return v4;
  }
  else
  {
    v6 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 134217984;
      v8 = -[SDResourceManager numberDiagnosticsInflight](v2, "numberDiagnosticsInflight");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Number of sysdiagnoses in flight are %ld when should be 1 -- ABORT", (uint8_t *)&v7, 0xCu);
    }

    objc_sync_exit(v2);
    return 0;
  }
}

- (id)getActivityID
{
  return +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", os_activity_get_identifier((os_activity_t)&_os_activity_current, 0));
}

- (id)getDiagnosticIDSimple
{
  void *v3;
  SDResourceManager *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getActivityID](self, "getActivityID"));
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4->_idManager, "objectForKey:", v3));
  objc_sync_exit(v4);

  return v5;
}

- (id)getDiagnosticID
{
  void *v3;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticIDSimple](self, "getDiagnosticIDSimple"));
  if (!v3)
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager registerActivity](self, "registerActivity"));
  return v3;
}

- (BOOL)diagnosticIDExists:(id)a3
{
  id v4;
  void *v5;
  unsigned __int8 v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticIDSimple](self, "getDiagnosticIDSimple"));
  v6 = objc_msgSend(v5, "isEqualToString:", v4);

  return v6;
}

- (BOOL)setUpLibClient:(id)a3 clientPid:(id)a4
{
  id v6;
  id v7;
  SDResourceManager *v8;
  _DWORD v10[2];
  __int16 v11;
  id v12;

  v6 = a3;
  v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  -[NSMutableDictionary setObject:forKey:](v8->_pidManager, "setObject:forKey:", v6, v7);
  objc_sync_exit(v8);

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
  {
    v10[0] = 67109378;
    v10[1] = objc_msgSend(v7, "intValue");
    v11 = 2080;
    v12 = objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Set up pid %d with diagnosticID %s", (uint8_t *)v10, 0x12u);
  }

  return 1;
}

- (BOOL)setUpDiagnosticID:(id)a3
{
  id v4;
  void *v5;
  SDResourceManager *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getActivityID](self, "getActivityID"));
  v6 = self;
  objc_sync_enter(v6);
  -[NSMutableDictionary setObject:forKey:](v6->_idManager, "setObject:forKey:", v4, v5);
  objc_sync_exit(v6);

  return 1;
}

- (BOOL)setUpSysdiagnoseSession:(id)a3 clientPid:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager fdManager](self, "fdManager"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

  if (!v9)
    -[SDResourceManager setUpDiagnosticID:](self, "setUpDiagnosticID:", v6);
  -[SDResourceManager setUpLibClient:clientPid:](self, "setUpLibClient:clientPid:", v6, v7);

  return 1;
}

- (id)getDiagnosticIDForPid:(id)a3
{
  id v4;
  SDResourceManager *v5;
  void *v6;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_pidManager, "objectForKey:", v4));
  objc_sync_exit(v5);

  return v6;
}

- (BOOL)registerActivityWithID:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  SDResourceManager *v8;
  void *v9;
  id *v10;
  int v12;
  id v13;
  __int16 v14;
  id v15;

  v4 = a3;
  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getActivityID](self, "getActivityID"));
    if (objc_msgSend(v5, "isEqual:", &off_1000ACD40))
    {
      v6 = 0;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        v12 = 134218242;
        v13 = objc_msgSend(v5, "longLongValue");
        v14 = 2080;
        v15 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
        _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Activity %016llX requested to register with diagnostic ID %s -- ABORT", (uint8_t *)&v12, 0x16u);
        v6 = 0;
      }
    }
    else
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticIDSimple](self, "getDiagnosticIDSimple"));

      if (v7)
      {
        v6 = 1;
      }
      else
      {
        v8 = self;
        objc_sync_enter(v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v8->_fdManager, "objectForKey:", v4));
        objc_sync_exit(v8);

        v6 = v9 != 0;
        if (v9)
        {
          v10 = v8;
          objc_sync_enter(v10);
          objc_msgSend(v10[6], "setObject:forKey:", v4, v5);
          objc_sync_exit(v10);

        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v12 = 134218242;
          v13 = objc_msgSend(v5, "longLongValue");
          v14 = 2080;
          v15 = objc_msgSend(objc_retainAutorelease(v4), "UTF8String");
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Did not find CLI file descriptors -- Activity %016llX not registered with diagnostic ID %s", (uint8_t *)&v12, 0x16u);
        }

      }
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)registerActivity
{
  void *v3;
  id v4;
  os_activity_id_t identifier;
  SDResourceManager *v6;
  NSMutableDictionary *idManager;
  void *v8;
  void *v9;
  SDResourceManager *v10;
  id v11;
  os_activity_id_t parent_id;
  uint8_t buf[4];
  os_activity_id_t v15;
  __int16 v16;
  os_activity_id_t v17;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticIDSimple](self, "getDiagnosticIDSimple"));
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    parent_id = 0;
    identifier = os_activity_get_identifier((os_activity_t)&_os_activity_current, &parent_id);
    v6 = self;
    objc_sync_enter(v6);
    idManager = v6->_idManager;
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", parent_id));
    v4 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](idManager, "objectForKey:", v8));

    objc_sync_exit(v6);
    if (v4)
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", identifier));
      v10 = v6;
      objc_sync_enter(v10);
      -[NSMutableDictionary setObject:forKey:](v6->_idManager, "setObject:forKey:", v4, v9);
      objc_sync_exit(v10);

      v11 = v4;
    }
    else if (identifier
           && -[SDResourceManager numberDiagnosticsInflight](v6, "numberDiagnosticsInflight")
           && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      v15 = identifier;
      v16 = 2048;
      v17 = parent_id;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "SDResourceManager failed to register activity %016llX due to missing parent %016llX.", buf, 0x16u);
    }
  }

  return v4;
}

- (BOOL)setUpCLI:(id)a3 stdoutfd:(int)a4 stderrfd:(int)a5
{
  uint64_t v5;
  uint64_t v6;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  SDResourceManager *v13;
  id v14;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;

  v5 = *(_QWORD *)&a5;
  v6 = *(_QWORD *)&a4;
  v8 = a3;
  if (v8)
  {
    if (!-[SDResourceManager diagnosticIDExists:](self, "diagnosticIDExists:", v8)
      && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315138;
      v17 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "ERROR: Trying to set up CLI streaming for a non-existent :D diagnosticID %s", buf, 0xCu);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getActivityID](self, "getActivityID"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager setUpFH:](self, "setUpFH:", v6));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager setUpFH:](self, "setUpFH:", v5));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", v10, v11, 0));
    v13 = self;
    objc_sync_enter(v13);
    -[NSMutableDictionary setObject:forKey:](v13->_cliManager, "setObject:forKey:", v12, v8);
    objc_sync_exit(v13);

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v14 = objc_msgSend(v9, "longLongValue");
      *(_DWORD *)buf = 138412546;
      v17 = v8;
      v18 = 2048;
      v19 = v14;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Set up CLI with diagnostic: %@, activity %016llX", buf, 0x16u);
    }

  }
  return v8 != 0;
}

- (void)cliWrite:(int)a3 logStr:(id)a4 withParameters:(char *)a5
{
  void *v8;
  id v9;
  void *v10;
  SDResourceManager *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  const char *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  FILE **v22;
  id v23;

  v23 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v8 || !-[SDResourceManager isDaemon](self, "isDaemon"))
  {
    v9 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v23, a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", CFSTR("\n")));

    if (-[SDResourceManager isDaemon](self, "isDaemon"))
    {
      v11 = self;
      objc_sync_enter(v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11->_cliManager, "objectForKey:", v8));
      v13 = v12;
      if (v12)
      {
        v14 = a3;
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectAtIndexedSubscript:", a3));
        v16 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v11->_fdManager, "objectForKey:", v8));
        v17 = "STDERR";
        if (!a3)
          v17 = "STDOUT";
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("writing to %s. Resetting file descriptor to /dev/null."), v17));
        if ((sub_100026870(v15, v16, v10, v18) & 1) == 0)
        {
          objc_msgSend(v15, "closeFile");
          v19 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager setUpFH:](v11, "setUpFH:", 0xFFFFFFFFLL));
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndex:](NSIndexSet, "indexSetWithIndex:", v14));
          v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObject:](NSArray, "arrayWithObject:", v19));
          objc_msgSend(v13, "replaceObjectsAtIndexes:withObjects:", v20, v21);

        }
      }

      objc_sync_exit(v11);
    }
    else
    {
      v22 = &__stdoutp;
      if (a3)
        v22 = &__stderrp;
      fputs((const char *)objc_msgSend(objc_retainAutorelease(v10), "UTF8String"), *v22);
    }

  }
}

- (void)stdoutWrite:(id)a3
{
  uint64_t v3;

  -[SDResourceManager cliWrite:logStr:withParameters:](self, "cliWrite:logStr:withParameters:", 0, a3, &v3);
}

- (void)stderrWrite:(id)a3
{
  uint64_t v3;

  -[SDResourceManager cliWrite:logStr:withParameters:](self, "cliWrite:logStr:withParameters:", 1, a3, &v3);
}

- (void)_log:(id)a3
{
  void *v4;
  SDResourceManager *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_fdManager, "objectForKey:", v4));
    sub_100026870(v6, 0, v7, 0);

    objc_sync_exit(v5);
  }

}

- (id)setUpFH:(int)a3
{
  uint64_t v3;
  id v4;

  v3 = *(_QWORD *)&a3;
  if (a3 == -1)
  {
    v3 = open("/dev/null", 1);
    if ((_DWORD)v3 == -1)
      sub_10005E7B4();
  }
  v4 = objc_msgSend(objc_alloc((Class)NSFileHandle), "initWithFileDescriptor:closeOnDealloc:", v3, 1);
  if (!v4)
    sub_10005E7DC();
  return v4;
}

- (BOOL)setUpSysdiagnoseLog:(id)a3 withID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  SDResourceManager *v9;
  void *v10;
  BOOL v11;
  const char *v12;
  uint32_t v13;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  void *v19;
  SDResourceManager *v20;
  const char *v21;
  uint32_t v22;
  int v23;
  id v24;
  __int16 v25;
  void *v26;
  NSFileAttributeKey v27;
  _UNKNOWN **v28;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    if (-[SDResourceManager diagnosticIDExists:](self, "diagnosticIDExists:", v7))
    {
      v9 = self;
      objc_sync_enter(v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v9->_fdManager, "objectForKey:", v8));

      if (v10)
      {
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Error: diagnosticID already set up by another process.", (uint8_t *)&v23, 2u);
        }
        objc_sync_exit(v9);

        goto LABEL_13;
      }
      objc_sync_exit(v9);

      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("sysdiagnose.log")));
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v27 = NSFilePosixPermissions;
      v28 = &off_1000ACD58;
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
      v18 = objc_msgSend(v16, "createFileAtPath:contents:attributes:", v15, 0, v17);

      if ((v18 & 1) == 0)
      {
        v11 = 0;
        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v23) = 0;
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Bad sysdiagnosePath, unable to create sysdiagnose.log.", (uint8_t *)&v23, 2u);
          v11 = 0;
        }
        goto LABEL_25;
      }
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileHandle fileHandleForWritingAtPath:](NSFileHandle, "fileHandleForWritingAtPath:", v15));
      v11 = v19 != 0;
      if (v19)
      {
        v20 = v9;
        objc_sync_enter(v20);
        -[NSMutableDictionary setObject:forKey:](v9->_fdManager, "setObject:forKey:", v19, v8);
        objc_sync_exit(v20);

        if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
        {
          v23 = 138412546;
          v24 = v8;
          v25 = 2112;
          v26 = v19;
          v21 = "Set up sysdiagnose.log with diagnostic ID %@, filehandle: %@";
          v22 = 22;
LABEL_23:
          _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v21, (uint8_t *)&v23, v22);
        }
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        v21 = "Failed to create file handle for sysdiagnose.log";
        v22 = 2;
        goto LABEL_23;
      }

LABEL_25:
      goto LABEL_14;
    }
    v11 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v23 = 136315138;
      v24 = objc_msgSend(objc_retainAutorelease(v8), "UTF8String");
      v12 = "ERROR: Trying to set up log for non-existent diagnosticID %s";
      v13 = 12;
      goto LABEL_12;
    }
  }
  else
  {
    v11 = 0;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      v12 = "sysdiagnose path or diagnosticID was null while trying to set up sysdiagnose.log.";
      v13 = 2;
LABEL_12:
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v23, v13);
LABEL_13:
      v11 = 0;
    }
  }
LABEL_14:

  return v11;
}

- (void)closeSysdiagnoseLog
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v3)
  {
    v4 = v3;
    -[SDResourceManager removeFds:](self, "removeFds:", v3);
    v3 = v4;
  }

}

- (void)log:(id)a3
{
  NSDateFormatter *dateFormatter;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;

  dateFormatter = self->_dateFormatter;
  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v6));
  v8 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v5, &v10);

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %@\n"), v7, v8));
  -[SDResourceManager _log:](self, "_log:", v9);

}

- (void)logWithSubsystem:(const char *)a3 category:(const char *)a4 msg:(id)a5
{
  NSDateFormatter *dateFormatter;
  id v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;

  dateFormatter = self->_dateFormatter;
  v9 = a5;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSDateFormatter stringFromDate:](dateFormatter, "stringFromDate:", v10));
  v12 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:arguments:", v9, &v14);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: [Subsystem %s, Category: %s] Log: %@\n"), v11, a3, a4, v12));
  -[SDResourceManager _log:](self, "_log:", v13);

}

- (void)removeDiagnosticObject:(id)a3
{
  SDResourceManager *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4->_diagnosticManager, "objectForKey:", v6));
  if (v5)
    -[NSMutableDictionary removeObjectForKey:](v4->_diagnosticManager, "removeObjectForKey:", v6);

  objc_sync_exit(v4);
}

- (void)removeActivityIDs:(id)a3
{
  id v4;
  SDResourceManager *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5->_idManager, "allKeys", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_idManager, "objectForKey:", v10));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
          -[NSMutableDictionary removeObjectForKey:](v5->_idManager, "removeObjectForKey:", v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)removeFds:(id)a3
{
  id v4;
  SDResourceManager *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  id v10;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_fdManager, "objectForKey:", v4));
  if (v6)
  {
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT))
    {
      v7 = 138412546;
      v8 = v6;
      v9 = 2112;
      v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_DEFAULT, "Closing fd %@ for diagnosticid %@", (uint8_t *)&v7, 0x16u);
    }
    -[NSMutableDictionary removeObjectForKey:](v5->_fdManager, "removeObjectForKey:", v4);
    objc_msgSend(v6, "closeFile");
  }

  objc_sync_exit(v5);
}

- (void)removeCLI:(id)a3
{
  SDResourceManager *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v4->_cliManager, "objectForKey:", v11));
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 0));
      objc_msgSend(v8, "closeFile");

    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", 1));
      objc_msgSend(v10, "closeFile");

    }
    -[NSMutableDictionary removeObjectForKey:](v4->_cliManager, "removeObjectForKey:", v11);
  }

  objc_sync_exit(v4);
}

- (void)removeLibClient:(id)a3
{
  id v4;
  SDResourceManager *v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *i;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v5->_pidManager, "allKeys", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v6);
        v10 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_pidManager, "objectForKey:", v10));
        v12 = objc_msgSend(v11, "isEqualToString:", v4);

        if (v12)
          -[NSMutableDictionary removeObjectForKey:](v5->_pidManager, "removeObjectForKey:", v10);
      }
      v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_sync_exit(v5);
}

- (void)removeProgressTracking:(id)a3
{
  SDResourceManager *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager progressManager](v4, "progressManager"));
  objc_msgSend(v5, "removeObjectForKey:", v7);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager peerManager](v4, "peerManager"));
  objc_msgSend(v6, "removeObjectForKey:", v7);

  objc_sync_exit(v4);
}

- (void)_closeSysdiagnoseSessionHelper:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[SDResourceManager decreaseDiagnosticCountForDiagnosticID:](self, "decreaseDiagnosticCountForDiagnosticID:");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v4)
  {
    -[SDResourceManager removeDiagnosticObject:](self, "removeDiagnosticObject:", v5);
    -[SDResourceManager removeActivityIDs:](self, "removeActivityIDs:", v4);
    -[SDResourceManager removeLibClient:](self, "removeLibClient:", v4);
    -[SDResourceManager removeProgressTracking:](self, "removeProgressTracking:", v4);
  }

}

- (void)closeSysdiagnoseSession
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  -[SDResourceManager _closeSysdiagnoseSessionHelper:](self, "_closeSysdiagnoseSessionHelper:", v3);

}

- (void)closeCLI
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v3)
  {
    v4 = v3;
    -[SDResourceManager removeCLI:](self, "removeCLI:", v3);
    v3 = v4;
  }

}

- (void)clearAllResources
{
  SDResourceManager *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  uint64_t v8;
  SDPromptDelegate *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];

  v2 = self;
  objc_sync_enter(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary allKeys](v2->_fdManager, "allKeys"));
  objc_sync_exit(v2);

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  v4 = v3;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v11 != v6)
          objc_enumerationMutation(v4);
        v8 = *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * (_QWORD)i);
        -[SDResourceManager cancelAll:](v2, "cancelAll:", v8, (_QWORD)v10);
        v9 = objc_alloc_init(SDPromptDelegate);
        -[SDPromptDelegate setDiagnosticID:](v9, "setDiagnosticID:", v8);
        -[SDPromptDelegate setOpenIssueFiler:](v9, "setOpenIssueFiler:", 0);
        -[SDPromptDelegate setDidPartnerTimeout:](v9, "setDidPartnerTimeout:", 0);
        sub_1000297AC(v9);
        -[SDResourceManager removeDiagnosticObject:](v2, "removeDiagnosticObject:", v8);
        -[SDResourceManager removeActivityIDs:](v2, "removeActivityIDs:", v8);
        -[SDResourceManager removeFds:](v2, "removeFds:", v8);
        -[SDResourceManager removeCLI:](v2, "removeCLI:", v8);
        -[SDResourceManager removeLibClient:](v2, "removeLibClient:", v8);

      }
      v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v5);
  }

}

- (BOOL)initProgressTrackerWithConnection:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  BOOL v8;
  SDResourceManager *v9;
  ProgressTracker *v10;
  uint64_t i;
  void *v12;
  id v14;

  v4 = a3;
  v5 = objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  v6 = (void *)v5;
  if (v4)
    v7 = v5 == 0;
  else
    v7 = 1;
  v8 = !v7;
  if (!v7)
  {
    v9 = self;
    objc_sync_enter(v9);
    v10 = objc_alloc_init(ProgressTracker);
    for (i = 0; i != 64; i += 8)
      *(_QWORD *)((char *)-[ProgressTracker phaseTracker](v10, "phaseTracker") + i) = 0;
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_progressManager, "setObject:forKeyedSubscript:", v10, v6);
    v14 = v4;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v14, 1));
    -[NSMutableDictionary setObject:forKeyedSubscript:](v9->_peerManager, "setObject:forKeyedSubscript:", v12, v6);

    objc_sync_exit(v9);
  }

  return v8;
}

- (BOOL)initConnectionWithPeer:(id)a3 forDiagnosticID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  BOOL v9;
  SDResourceManager *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  v9 = 0;
  if (v6 && v7)
  {
    v10 = self;
    objc_sync_enter(v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10->_peerManager, "objectForKeyedSubscript:", v8));

    v9 = v11 != 0;
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v10->_peerManager, "objectForKeyedSubscript:", v8));
      v13 = objc_msgSend(v12, "mutableCopy");

      objc_msgSend(v13, "addObject:", v6);
      v14 = objc_msgSend(v13, "copy");
      -[NSMutableDictionary setObject:forKeyedSubscript:](v10->_peerManager, "setObject:forKeyedSubscript:", v14, v8);

    }
    objc_sync_exit(v10);

  }
  return v9;
}

- (BOOL)setupProgressTotal:(unint64_t)a3 forPhase:(int)a4
{
  void *v7;
  SDResourceManager *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_progressManager, "objectForKeyedSubscript:", v7));
    v10 = v9;
    v11 = v9 != 0;
    if (v9)
      *((double *)objc_msgSend(v9, "phaseTracker") + a4) = (double)a3;

    objc_sync_exit(v8);
  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)sendProgress:(double)a3 phase:(unint64_t)a4 toPeers:(id)a5
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  xpc_object_t v12;
  SDResourceManager *v13;
  _BOOL8 v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  _BOOL8 v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  id v30;
  id v31;
  uint64_t v32;
  void *i;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v8 = a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  v10 = v8;
  v11 = v10;
  if (v10)
    goto LABEL_2;
  if (!v9)
    goto LABEL_18;
  v13 = self;
  objc_sync_enter(v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v13->_peerManager, "objectForKeyedSubscript:", v9));
  objc_sync_exit(v13);

  if (v11)
  {
LABEL_2:
    v12 = xpc_dictionary_create(0, 0, 0);
    xpc_dictionary_set_double(v12, (const char *)objc_msgSend(sdProgressPercent, "UTF8String"), a3);
    xpc_dictionary_set_uint64(v12, (const char *)objc_msgSend(sdProgressPhase, "UTF8String"), a4);
    if (v9)
    {
      xpc_dictionary_set_string(v12, (const char *)objc_msgSend(sdProgressDiagnosticId, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v9), "UTF8String"));
    }
    else
    {
      v22 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v22)
        sub_10005E838(v22, v23, v24, v25, v26, v27, v28, v29);
    }
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    v30 = v11;
    v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    if (v31)
    {
      v32 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v31; i = (char *)i + 1)
        {
          if (*(_QWORD *)v35 != v32)
            objc_enumerationMutation(v30);
          xpc_connection_send_message(*(xpc_connection_t *)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i), v12);
        }
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
      }
      while (v31);
    }

  }
  else
  {
    v14 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
    if (v14)
      sub_10005E804(v14, v15, v16, v17, v18, v19, v20, v21);
  }
LABEL_18:

}

- (BOOL)finishedItemForPhaseAndUpdatePeer:(int)a3
{
  uint64_t v3;
  void *v5;
  void *v6;
  BOOL v7;
  SDResourceManager *v8;
  void *v9;
  double v10;
  double v11;
  _BOOL8 v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v3 = *(_QWORD *)&a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v5)
  {
    if ((int)v3 <= 3)
    {
      v8 = self;
      objc_sync_enter(v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_progressManager, "objectForKeyedSubscript:", v5));
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v8->_peerManager, "objectForKeyedSubscript:", v5));
      if (v9)
      {
        objc_msgSend(v9, "increaseCountForPhase:", v3);
        objc_msgSend(v9, "getProgress");
        v11 = v10;
      }
      else
      {
        v11 = 0.0;
      }

      objc_sync_exit(v8);
      if (!v9)
        goto LABEL_11;
      if (v6)
      {
        -[SDResourceManager sendProgress:phase:toPeers:](v8, "sendProgress:phase:toPeers:", 2, v6, v11);
        v7 = 1;
LABEL_12:

        goto LABEL_13;
      }
      v13 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v13)
        sub_10005E86C(v13, v14, v15, v16, v17, v18, v19, v20);
    }
    v6 = 0;
LABEL_11:
    v7 = 0;
    goto LABEL_12;
  }
  v7 = 0;
LABEL_13:

  return v7;
}

- (void)initPeerProgressHandler
{
  void *v3;
  SDResourceManager *v4;
  void *v5;
  xpc_object_t v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  _BOOL8 v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[SDResourceManager getDiagnosticID](self, "getDiagnosticID"));
  if (v3)
  {
    v4 = self;
    objc_sync_enter(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKeyedSubscript:](v4->_peerManager, "objectForKeyedSubscript:", v3));
    objc_sync_exit(v4);

    if (v5)
    {
      v6 = xpc_dictionary_create(0, 0, 0);
      xpc_dictionary_set_double(v6, (const char *)objc_msgSend(sdProgressPercent, "UTF8String"), 0.0);
      xpc_dictionary_set_uint64(v6, (const char *)objc_msgSend(sdProgressPhase, "UTF8String"), 1uLL);
      xpc_dictionary_set_string(v6, (const char *)objc_msgSend(sdProgressDiagnosticId, "UTF8String"), (const char *)objc_msgSend(objc_retainAutorelease(v3), "UTF8String"));
      v21 = 0u;
      v22 = 0u;
      v19 = 0u;
      v20 = 0u;
      v7 = v5;
      v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      if (v8)
      {
        v9 = *(_QWORD *)v20;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v20 != v9)
              objc_enumerationMutation(v7);
            xpc_connection_send_message(*(xpc_connection_t *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v10), v6);
            v10 = (char *)v10 + 1;
          }
          while (v8 != v10);
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
        }
        while (v8);
      }

    }
    else
    {
      v11 = os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR);
      if (v11)
        sub_10005E86C(v11, v12, v13, v14, v15, v16, v17, v18);
    }

  }
}

- (BOOL)cancelAll:(id)a3
{
  id v4;
  SDResourceManager *v5;
  void *v6;
  BOOL v7;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableDictionary objectForKey:](v5->_cliManager, "objectForKey:", v4));
    objc_sync_exit(v5);

    v7 = v6 != 0;
    if (v6)
      -[SDResourceManager removeCLI:](v5, "removeCLI:", v4);

  }
  else
  {
    v7 = 1;
  }

  return v7;
}

- (id)stringForPhaseID:(int)a3
{
  if (a3 > 3)
    return CFSTR("Unknown phase");
  else
    return off_100099100[a3];
}

- (id)elapsedMetricForPhaseID:(int)a3
{
  if (a3 > 3)
    return CFSTR("Unknown metric");
  else
    return *(id *)*(&off_100099120 + a3);
}

- (id)getContainersMetricForPhaseId:(int)a3
{
  if (a3 > 3)
    return CFSTR("Unknown get container metric");
  else
    return *(id *)*(&off_100099140 + a3);
}

- (double)getMinimumTimeBeforeTimeoutsForPhaseID:(int)a3
{
  double result;

  result = 0.0;
  if (a3 <= 3)
    return dbl_100070860[a3];
  return result;
}

- (NSString)possibleClient
{
  return self->_possibleClient;
}

- (void)setPossibleClient:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)currentClient
{
  return self->_currentClient;
}

- (void)setCurrentClient:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (BOOL)isDaemon
{
  return self->_isDaemon;
}

- (void)setIsDaemon:(BOOL)a3
{
  self->_isDaemon = a3;
}

- (int64_t)count
{
  return self->_count;
}

- (void)setCount:(int64_t)a3
{
  self->_count = a3;
}

- (NSMutableDictionary)idManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 48, 1);
}

- (void)setIdManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)fdManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)setFdManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSMutableDictionary)cliManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCliManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (NSMutableDictionary)peerManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 72, 1);
}

- (void)setPeerManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (NSMutableDictionary)progressManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 80, 1);
}

- (void)setProgressManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (NSMutableDictionary)diagnosticManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 88, 1);
}

- (void)setDiagnosticManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSMutableDictionary)pidManager
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 96, 1);
}

- (void)setPidManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (NSString)localLogCollectionDiagnosticID
{
  return (NSString *)objc_getProperty(self, a2, 104, 1);
}

- (void)setLocalLogCollectionDiagnosticID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 104);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localLogCollectionDiagnosticID, 0);
  objc_storeStrong((id *)&self->_pidManager, 0);
  objc_storeStrong((id *)&self->_diagnosticManager, 0);
  objc_storeStrong((id *)&self->_progressManager, 0);
  objc_storeStrong((id *)&self->_peerManager, 0);
  objc_storeStrong((id *)&self->_cliManager, 0);
  objc_storeStrong((id *)&self->_fdManager, 0);
  objc_storeStrong((id *)&self->_idManager, 0);
  objc_storeStrong((id *)&self->_currentClient, 0);
  objc_storeStrong((id *)&self->_possibleClient, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
}

@end
