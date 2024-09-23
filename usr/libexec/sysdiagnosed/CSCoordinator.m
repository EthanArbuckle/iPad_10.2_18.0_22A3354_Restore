@implementation CSCoordinator

+ (id)sharedInstance
{
  if (qword_1000B9760 != -1)
    dispatch_once(&qword_1000B9760, &stru_1000991C8);
  return (id)qword_1000B9758;
}

- (CSCoordinator)init
{
  CSCoordinator *v2;
  CSCoordinator *v3;
  OS_dispatch_group *hostWaitGroup;
  NSDictionary *v5;
  NSDictionary *sessionConfigs;
  os_log_t v7;
  OS_os_log *logSubsystem;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CSCoordinator;
  v2 = -[CSCoordinator init](&v10, "init");
  v3 = v2;
  if (v2)
  {
    *(_WORD *)&v2->_isRemoteInitiated = 0;
    hostWaitGroup = v2->_hostWaitGroup;
    v2->_hostWaitGroup = 0;

    v5 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    sessionConfigs = v3->_sessionConfigs;
    v3->_sessionConfigs = v5;

    v7 = os_log_create("com.apple.sysdiagnose", "co-sysdiagnose");
    logSubsystem = v3->_logSubsystem;
    v3->_logSubsystem = (OS_os_log *)v7;

  }
  return v3;
}

- (BOOL)isHost
{
  void *v2;
  NSObject *v3;
  uint8_t v5[16];

  if (!-[CSCoordinator initiatedByRemoteHost](self, "initiatedByRemoteHost"))
    return +[CSRemoteXPCProxy isHost](CSRemoteXPCProxy, "isHost");
  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v3 = objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "logSubsystem"));

  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "CSCoordinator: forced to return no for isHost", v5, 2u);
  }

  return 0;
}

- (id)getRemoteUUIDsForDiagnosticID:(id)a3
{
  id v4;
  CSCoordinator *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject remoteUUIDs](v7, "remoteUUIDs"));
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "logSubsystem"));

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10005E910();

      v8 = 0;
    }
    objc_sync_exit(v5);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logSubsystem"));

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005E8A0(v7, v10, v11, v12, v13, v14, v15, v16);
    v8 = 0;
  }

  return v8;
}

- (BOOL)setRemoteUUIDs:(id)a3 forDiagnosticID:(id)a4
{
  id v6;
  id v7;
  CSCoordinator *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  -[CSCoordinator tryCreateSessionConfigForDiagnosticID:](self, "tryCreateSessionConfigForDiagnosticID:", v7);
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v8, "sessionConfigs"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));

    v11 = v10 != 0;
    if (v10)
    {
      v12 = objc_msgSend(v6, "copy");
      -[NSObject setRemoteUUIDs:](v10, "setRemoteUUIDs:", v12);
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "logSubsystem"));

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10005E9EC();
    }

    objc_sync_exit(v8);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "logSubsystem"));

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10005E97C(v10, v14, v15, v16, v17, v18, v19, v20);
    v11 = 0;
  }

  return v11;
}

- (BOOL)getCollectAllTrustedForDiagnosticID:(id)a3
{
  id v4;
  CSCoordinator *v5;
  void *v6;
  NSObject *v7;
  unsigned __int8 v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

    if (v7)
    {
      v8 = -[NSObject shouldCollectAllTrusted](v7, "shouldCollectAllTrusted");
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "logSubsystem"));

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10005EAC8();

      v8 = 0;
    }
    objc_sync_exit(v5);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logSubsystem"));

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005EA58(v7, v10, v11, v12, v13, v14, v15, v16);
    v8 = 0;
  }

  return v8;
}

- (BOOL)setCollectAllTrusted:(BOOL)a3 forDiagnosticID:(id)a4
{
  _BOOL8 v4;
  id v6;
  CSCoordinator *v7;
  void *v8;
  NSObject *v9;
  BOOL v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  NSObject *v20;

  v4 = a3;
  v6 = a4;
  -[CSCoordinator tryCreateSessionConfigForDiagnosticID:](self, "tryCreateSessionConfigForDiagnosticID:", v6);
  if (v6)
  {
    v7 = self;
    objc_sync_enter(v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v7, "sessionConfigs"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", v6));

    v10 = v9 != 0;
    if (v9)
    {
      -[NSObject setShouldCollectAllTrusted:](v9, "setShouldCollectAllTrusted:", v4);
    }
    else
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "logSubsystem"));

      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        sub_10005EBA4();

    }
    objc_sync_exit(v7);

  }
  else
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "logSubsystem"));

    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10005EB34(v9, v12, v13, v14, v15, v16, v17, v18);
    v10 = 0;
  }

  return v10;
}

- (id)getProxiesForDiagnosticID:(id)a3
{
  id v4;
  CSCoordinator *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject proxies](v7, "proxies"));
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "logSubsystem"));

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10005EC80();

      v8 = 0;
    }
    objc_sync_exit(v5);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logSubsystem"));

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005EC10(v7, v10, v11, v12, v13, v14, v15, v16);
    v8 = 0;
  }

  return v8;
}

- (BOOL)setProxies:(id)a3 forDiagnosticID:(id)a4
{
  id v6;
  id v7;
  CSCoordinator *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v8, "sessionConfigs"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));

    v11 = v10 != 0;
    if (v10)
    {
      v12 = objc_msgSend(v6, "copy");
      -[NSObject setProxies:](v10, "setProxies:", v12);
    }
    else
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v12 = objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "logSubsystem"));

      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        sub_10005ED5C();
    }

    objc_sync_exit(v8);
  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "logSubsystem"));

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10005ECEC(v10, v14, v15, v16, v17, v18, v19, v20);
    v11 = 0;
  }

  return v11;
}

- (id)getReceiveFileSemaForDiagnosticID:(id)a3
{
  id v4;
  CSCoordinator *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;

  v4 = a3;
  if (v4)
  {
    v5 = self;
    objc_sync_enter(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject receiveFileSema](v7, "receiveFileSema"));
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "logSubsystem"));

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10005EE38();

      v8 = 0;
    }
    objc_sync_exit(v5);

  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logSubsystem"));

    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      sub_10005EDC8(v7, v10, v11, v12, v13, v14, v15, v16);
    v8 = 0;
  }

  return v8;
}

- (BOOL)setHostOutputDir:(id)a3 forDiagnosticID:(id)a4
{
  id v6;
  id v7;
  CSCoordinator *v8;
  void *v9;
  NSObject *v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;

  v6 = a3;
  v7 = a4;
  if (v7)
  {
    v8 = self;
    objc_sync_enter(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v8, "sessionConfigs"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v7));

    v11 = v10 != 0;
    if (v10)
    {
      -[NSObject setHostOutputDir:](v10, "setHostOutputDir:", v6);
    }
    else
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "logSubsystem"));

      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        sub_10005EF14();

    }
    objc_sync_exit(v8);

  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "logSubsystem"));

    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      sub_10005EEA4(v10, v13, v14, v15, v16, v17, v18, v19);
    v11 = 0;
  }

  return v11;
}

- (void)addSessionConfig:(id)a3 forDiagnosticID:(id)a4
{
  id v6;
  CSCoordinator *v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = self;
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v7, "sessionConfigs"));
  v9 = objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v9, "setObject:forKey:", v11, v6);
  v10 = objc_msgSend(v9, "copy");
  -[CSCoordinator setSessionConfigs:](v7, "setSessionConfigs:", v10);

  objc_sync_exit(v7);
}

- (void)removeSessionConfigForDiagnosticID:(id)a3
{
  CSCoordinator *v4;
  void *v5;
  id v6;
  id v7;
  id v8;

  v8 = a3;
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v4, "sessionConfigs"));
  v6 = objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v6, "removeObjectForKey:", v8);
  v7 = objc_msgSend(v6, "copy");
  -[CSCoordinator setSessionConfigs:](v4, "setSessionConfigs:", v7);

  objc_sync_exit(v4);
}

- (void)tryCreateSessionConfigForDiagnosticID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CSSessionConfig *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](self, "sessionConfigs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKey:", v4));

  if (!v6)
  {
    v7 = objc_alloc_init(CSSessionConfig);
    if (v7)
    {
      -[CSCoordinator addSessionConfig:forDiagnosticID:](self, "addSessionConfig:forDiagnosticID:", v7, v4);
    }
    else
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "logSubsystem"));

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        sub_10005EF80(v9, v10, v11, v12, v13, v14, v15, v16);

    }
  }

}

- (id)getHostOutputDirForDiagnosticID:(id)a3
{
  id v4;
  CSCoordinator *v5;
  void *v6;
  CSCoordinator *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  id v26;
  uint64_t v27;
  void *i;
  uint64_t v29;
  void *v30;
  NSObject *v31;
  CSCoordinator *obj;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _OWORD v39[4];
  uint8_t buf[4];
  uint64_t v41;
  _BYTE v42[128];
  char v43[128];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  v34 = v4;
  if (!v4)
  {
    obj = v5;
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
    v10 = objc_msgSend(v9, "count");

    if (v10)
    {
      if (v10 == (id)1)
      {
        memset(v39, 0, sizeof(v39));
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
        if (objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", v39, v43, 16))
        {
          v12 = **((_QWORD **)&v39[0] + 1);
          v13 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
          v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v12));
          v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "hostOutputDir"));

LABEL_26:
          v7 = obj;
          objc_sync_exit(obj);
          goto LABEL_27;
        }

      }
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v18 = objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "logSubsystem"));

      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10005EFB4((uint64_t)v10, v18, v19, v20, v21, v22, v23, v24);

      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
      v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
      if (v26)
      {
        v27 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v26; i = (char *)i + 1)
          {
            if (*(_QWORD *)v36 != v27)
              objc_enumerationMutation(v25);
            v29 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * (_QWORD)i);
            v30 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
            v31 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "logSubsystem"));

            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              v41 = v29;
              _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "CSCoordinator: %@", buf, 0xCu);
            }

          }
          v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v35, v42, 16);
        }
        while (v26);
      }

      v8 = (void *)objc_claimAutoreleasedReturnValue(+[SDCacheEnumerator sysdiagnoseDirectory](SDCacheEnumerator, "sysdiagnoseDirectory"));
      goto LABEL_26;
    }
    v8 = 0;
    goto LABEL_26;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator sessionConfigs](v5, "sessionConfigs"));
  v7 = (CSCoordinator *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKey:", v4));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator hostOutputDir](v7, "hostOutputDir"));
  }
  else
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "logSubsystem"));

    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      sub_10005F02C();

    v8 = 0;
  }
  objc_sync_exit(v5);

LABEL_27:
  return v8;
}

- (BOOL)isAutomaticCoSysdiagnosePossible
{
  if (-[CSCoordinator isRemoteInitiated](self, "isRemoteInitiated"))
    return 1;
  else
    return +[CSDisplayProxy isAutomaticCoSysdiagnosePossible](CSDisplayProxy, "isAutomaticCoSysdiagnosePossible");
}

- (void)initRemoteServers
{
  +[CSRemoteXPCProxy initRemoteServers](CSRemoteXPCProxy, "initRemoteServers");
  +[CSCoreDeviceProxy initRemoteServers](CSCoreDeviceProxy, "initRemoteServers");
}

- (BOOL)initProxiesForDiagnosticID:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  v4 = a3;
  if (v4)
  {
    v5 = objc_alloc_init((Class)NSMutableArray);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSRemoteXPCProxy getProxiesForDiagnosticID:](CSRemoteXPCProxy, "getProxiesForDiagnosticID:", v4));
    objc_msgSend(v5, "addObjectsFromArray:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoreDeviceProxy getProxiesForDiagnosticID:](CSCoreDeviceProxy, "getProxiesForDiagnosticID:", v4));
    objc_msgSend(v5, "addObjectsFromArray:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSDisplayProxy getProxiesForDiagnosticID:](CSDisplayProxy, "getProxiesForDiagnosticID:", v4));
    objc_msgSend(v5, "addObjectsFromArray:", v8);

    v9 = -[CSCoordinator setProxies:forDiagnosticID:](self, "setProxies:forDiagnosticID:", v5, v4);
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "logSubsystem"));

    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      sub_10005F098(v11, v12, v13, v14, v15, v16, v17, v18);

    v9 = 0;
  }

  return v9;
}

- (BOOL)tryStartRemoteInitiatedFlowForMsg:(id)a3
{
  id v4;
  CSCoordinator *v5;
  void *v6;
  NSObject *v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  dispatch_group_t v11;
  void *v12;
  NSObject *v13;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  _DWORD v23[2];

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (!-[CSCoordinator isRemoteInitiated](v5, "isRemoteInitiated"))
  {
    -[CSCoordinator setInitiatedByRemoteHost:](v5, "setInitiatedByRemoteHost:", xpc_dictionary_get_BOOL(v4, "initiatedByRemoteHost"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "logSubsystem"));

    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v23[0] = 67109120;
      v23[1] = -[CSCoordinator initiatedByRemoteHost](v5, "initiatedByRemoteHost");
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Starting remote initiated flow with initiatedByRemoteHost: %d", (uint8_t *)v23, 8u);
    }

    if (-[CSCoordinator isHost](v5, "isHost"))
    {
      v11 = dispatch_group_create();
      -[CSCoordinator setHostWaitGroup:](v5, "setHostWaitGroup:", v11);

      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator hostWaitGroup](v5, "hostWaitGroup"));
      LODWORD(v11) = v12 == 0;

      if ((_DWORD)v11)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
        v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "logSubsystem"));

        if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
          sub_10005F108(v7, v16, v17, v18, v19, v20, v21, v22);
        goto LABEL_4;
      }
      v13 = objc_claimAutoreleasedReturnValue(-[CSCoordinator hostWaitGroup](v5, "hostWaitGroup"));
      dispatch_group_enter(v13);

    }
    v8 = 1;
    -[CSCoordinator setIsRemoteInitiated:](v5, "setIsRemoteInitiated:", 1);
    goto LABEL_11;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "logSubsystem"));

  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v23[0]) = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Already remote initiated. Failing to startRemoteInitiatedFlow", (uint8_t *)v23, 2u);
  }
LABEL_4:

  v8 = 0;
LABEL_11:
  objc_sync_exit(v5);

  return v8;
}

- (id)gatherLocalSysdiagnoseForMsg:(id)a3 withReply:(id)a4
{
  return sub_100032FC0(0, a3, a4);
}

- (void)endRemoteInitiatedFlow
{
  CSCoordinator *obj;

  obj = self;
  objc_sync_enter(obj);
  if (-[CSCoordinator isHost](obj, "isHost"))
    -[CSCoordinator safeLeaveHostWaitGroup](obj, "safeLeaveHostWaitGroup");
  -[CSCoordinator setInitiatedByRemoteHost:](obj, "setInitiatedByRemoteHost:", 0);
  -[CSCoordinator setIsRemoteInitiated:](obj, "setIsRemoteInitiated:", 0);
  objc_sync_exit(obj);

}

- (BOOL)shouldGatherCoSysdiagnoses
{
  unsigned int v3;

  v3 = -[CSCoordinator isRemoteInitiated](self, "isRemoteInitiated");
  if (v3)
    -[CSCoordinator initiatedByRemoteHost](self, "initiatedByRemoteHost");
  return v3 ^ 1;
}

- (BOOL)triggerCoSysdiagnosesWithParams:(id)a3 forDiagnosticID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  void *v15;
  NSObject *v16;
  BOOL v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  void *v33;
  _BYTE v34[128];

  v6 = a3;
  v7 = a4;
  -[CSCoordinator tryCreateSessionConfigForDiagnosticID:](self, "tryCreateSessionConfigForDiagnosticID:", v7);
  if (!-[CSCoordinator shouldGatherCoSysdiagnoses](self, "shouldGatherCoSysdiagnoses"))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "logSubsystem"));

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Not triggering co-sysdiagnoses", buf, 2u);
    }
    goto LABEL_21;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "logSubsystem"));

  if (!v7)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      sub_10005F13C(v9, v19, v20, v21, v22, v23, v24, v25);
LABEL_21:
    v17 = 0;
    goto LABEL_22;
  }
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Triggering co-sysdiagnoses", buf, 2u);
  }

  -[CSCoordinator initProxiesForDiagnosticID:](self, "initProxiesForDiagnosticID:", v7);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v9 = objc_claimAutoreleasedReturnValue(-[CSCoordinator getProxiesForDiagnosticID:](self, "getProxiesForDiagnosticID:", v7));
  v10 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
  if (v10)
  {
    v11 = v10;
    v27 = v7;
    v12 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v29 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v14, "triggerCoSysdiagnoseWithParams:", v6) & 1) == 0)
        {
          v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
          v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "logSubsystem"));

          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            v33 = v14;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Failed to trigger co-sysdiagnose for %@", buf, 0xCu);
          }

        }
      }
      v11 = -[NSObject countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v28, v34, 16);
    }
    while (v11);
    v17 = 1;
    v7 = v27;
  }
  else
  {
    v17 = 1;
  }
LABEL_22:

  return v17;
}

- (BOOL)waitForCoSysdiagnosesForDiagnosticID:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  void *v7;
  unint64_t v8;
  id v9;
  uint64_t v10;
  void *i;
  id v12;
  id v13;
  unsigned __int8 v14;
  void *v15;
  NSObject *v16;
  void *v17;
  id v18;
  uint64_t v19;
  void *j;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  _BOOL4 v29;
  NSObject *v30;
  dispatch_time_t v31;
  intptr_t v32;
  void *v33;
  NSObject *v34;
  void *v35;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[5];
  id v42;
  uint8_t *v43;
  uint8_t buf[8];
  uint8_t *v45;
  uint64_t v46;
  char v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t v53[4];
  unint64_t v54;
  _BYTE v55[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
  v6 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "logSubsystem"));

  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Waiting for co-sysdiagnoses...", buf, 2u);
    }

    if (-[CSCoordinator shouldGatherCoSysdiagnoses](self, "shouldGatherCoSysdiagnoses"))
    {
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator getProxiesForDiagnosticID:](self, "getProxiesForDiagnosticID:", v4));
      v8 = 0;
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
      if (v9)
      {
        v10 = *(_QWORD *)v49;
        do
        {
          for (i = 0; i != v9; i = (char *)i + 1)
          {
            if (*(_QWORD *)v49 != v10)
              objc_enumerationMutation(v7);
            v12 = objc_msgSend(*(id *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i), "getTimeoutSec");
            if ((unint64_t)v12 > v8)
              v8 = (unint64_t)v12;
          }
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v48, v55, 16);
        }
        while (v9);
      }

      *(_QWORD *)buf = 0;
      v45 = buf;
      v46 = 0x2020000000;
      v47 = 1;
      v41[0] = _NSConcreteStackBlock;
      v41[1] = 3221225472;
      v41[2] = sub_10001877C;
      v41[3] = &unk_1000991F0;
      v41[4] = self;
      v13 = v4;
      v42 = v13;
      v43 = buf;
      v14 = +[SystemDiagnostic _runBlock:withTimeout:](SystemDiagnostic, "_runBlock:withTimeout:", v41, (double)v8);
      v45[24] = v14;
      if ((v14 & 1) == 0)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
        v16 = objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "logSubsystem"));

        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)v53 = 134217984;
          v54 = v8;
          _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Timed out waiting on proxies for %lus, canceling connections", v53, 0xCu);
        }

      }
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator getProxiesForDiagnosticID:](self, "getProxiesForDiagnosticID:", v13, 0));
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v38;
        do
        {
          for (j = 0; j != v18; j = (char *)j + 1)
          {
            if (*(_QWORD *)v38 != v19)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * (_QWORD)j), "cancelConnection");
          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v37, v52, 16);
        }
        while (v18);
      }

      _Block_object_dispose(buf, 8);
      goto LABEL_37;
    }
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator hostWaitGroup](self, "hostWaitGroup"));
    v29 = v28 == 0;

    if (v29)
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "logSubsystem"));

      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Trying to wait on NULL hostWaitGroup. File transfer probably already finished", buf, 2u);
      }
    }
    else
    {
      v30 = objc_claimAutoreleasedReturnValue(-[CSCoordinator hostWaitGroup](self, "hostWaitGroup"));
      v31 = dispatch_time(0, 30000000000);
      v32 = dispatch_group_wait(v30, v31);

      if (!v32)
      {
LABEL_37:
        -[CSCoordinator removeSessionConfigForDiagnosticID:](self, "removeSessionConfigForDiagnosticID:", v4);
        goto LABEL_38;
      }
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v34 = objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "logSubsystem"));

      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "CSCoordinator: While remote-initiated, timed out waiting for remote co-sysdiagnose (hostWaitGroup)", buf, 2u);
      }
    }

    goto LABEL_37;
  }
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    sub_10005F1AC(v6, v21, v22, v23, v24, v25, v26, v27);

LABEL_38:
  return v4 != 0;
}

- (void)readyToReceiveCoSysdiagnosesAtDir:(id)a3 forDiagnosticID:(id)a4
{
  id v6;
  id v7;
  NSObject *dsema;

  v6 = a4;
  v7 = a3;
  -[CSCoordinator tryCreateSessionConfigForDiagnosticID:](self, "tryCreateSessionConfigForDiagnosticID:", v6);
  -[CSCoordinator setHostOutputDir:forDiagnosticID:](self, "setHostOutputDir:forDiagnosticID:", v7, v6);

  dsema = objc_claimAutoreleasedReturnValue(-[CSCoordinator getReceiveFileSemaForDiagnosticID:](self, "getReceiveFileSemaForDiagnosticID:", v6));
  dispatch_semaphore_signal(dsema);

}

- (id)waitForHostOutputDirForDiagnosticID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  dispatch_time_t v9;
  void *v10;
  NSObject *v11;
  uint8_t v13[16];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator getHostOutputDirForDiagnosticID:](self, "getHostOutputDirForDiagnosticID:", v4));
  v6 = v5;
  if (v5)
  {
    v7 = v5;
  }
  else
  {
    v8 = objc_claimAutoreleasedReturnValue(-[CSCoordinator getReceiveFileSemaForDiagnosticID:](self, "getReceiveFileSemaForDiagnosticID:", v4));
    v9 = dispatch_time(0, 30000000000);
    if (dispatch_semaphore_wait(v8, v9))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "logSubsystem"));

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v13 = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Timed out waiting for host to set output directory", v13, 2u);
      }

      v7 = 0;
    }
    else
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[CSCoordinator getHostOutputDirForDiagnosticID:](self, "getHostOutputDirForDiagnosticID:", v4));
    }

  }
  return v7;
}

- (void)safeLeaveHostWaitGroup
{
  void *v3;
  NSObject *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator hostWaitGroup](self, "hostWaitGroup"));

  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[CSCoordinator hostWaitGroup](self, "hostWaitGroup"));
    dispatch_group_leave(v4);

    -[CSCoordinator setHostWaitGroup:](self, "setHostWaitGroup:", 0);
  }
}

- (void)transferFileToHostIfNecessary:(id)a3 forDiagnosticID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  NSObject *v19;
  CSCoordinator *v20;
  id v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  uint64_t v26;
  uint8_t v27[128];
  uint8_t buf[80];

  v6 = a3;
  v7 = a4;
  if (-[CSCoordinator isHost](self, "isHost"))
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
    v9 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "logSubsystem"));

    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "CSCoordinator: On host, so file transfer not necessary. Skipping transfer", buf, 2u);
    }

  }
  else
  {
    if (-[CSCoordinator isRemoteInitiated](self, "isRemoteInitiated"))
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance"));
      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "logSubsystem"));

      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Not transferring file to host in transferFileToHostIfNecessary, because we are already remote initiated", buf, 2u);
      }
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[CSCoordinator getProxiesForDiagnosticID:](self, "getProxiesForDiagnosticID:", v7));
      if ((unint64_t)objc_msgSend(v12, "count") >= 2)
        sub_10005F21C(&v26, buf);
      v20 = self;
      v21 = v7;
      v24 = 0u;
      v25 = 0u;
      v22 = 0u;
      v23 = 0u;
      v11 = v12;
      v13 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v23;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(_QWORD *)v23 != v15)
              objc_enumerationMutation(v11);
            v17 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * (_QWORD)i);
            v18 = (void *)objc_claimAutoreleasedReturnValue(+[CSCoordinator sharedInstance](CSCoordinator, "sharedInstance", v20, v21));
            v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "logSubsystem"));

            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              *(_QWORD *)&buf[4] = v6;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "CSCoordinator: Transferring file from remote to host: %@", buf, 0xCu);
            }

            objc_msgSend(v17, "transferFileToHost:", v6);
          }
          v14 = -[NSObject countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
        }
        while (v14);
      }

      self = v20;
      v7 = v21;
    }

    -[CSCoordinator removeSessionConfigForDiagnosticID:](self, "removeSessionConfigForDiagnosticID:", v7);
  }

}

- (OS_os_log)logSubsystem
{
  return (OS_os_log *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogSubsystem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (BOOL)isRemoteInitiated
{
  return self->_isRemoteInitiated;
}

- (void)setIsRemoteInitiated:(BOOL)a3
{
  self->_isRemoteInitiated = a3;
}

- (BOOL)initiatedByRemoteHost
{
  return self->_initiatedByRemoteHost;
}

- (void)setInitiatedByRemoteHost:(BOOL)a3
{
  self->_initiatedByRemoteHost = a3;
}

- (NSDictionary)sessionConfigs
{
  return self->_sessionConfigs;
}

- (void)setSessionConfigs:(id)a3
{
  objc_storeStrong((id *)&self->_sessionConfigs, a3);
}

- (OS_dispatch_group)hostWaitGroup
{
  return self->_hostWaitGroup;
}

- (void)setHostWaitGroup:(id)a3
{
  objc_storeStrong((id *)&self->_hostWaitGroup, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostWaitGroup, 0);
  objc_storeStrong((id *)&self->_sessionConfigs, 0);
  objc_storeStrong((id *)&self->_logSubsystem, 0);
}

@end
