@implementation KTContextStore

- (KTContextStore)initWithDataStore:(id)a3 staticKeyStore:(id)a4 keyStore:(id)a5 cloudRecords:(id)a6 accountKeyServer:(id)a7 stateMachine:(id)a8 kvs:(id)a9 followup:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  KTContextStore *v24;
  KTContextStore *v25;
  void *v26;
  objc_super v28;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = a9;
  v23 = a10;
  v28.receiver = self;
  v28.super_class = (Class)KTContextStore;
  v24 = -[KTContextStore init](&v28, "init");
  v25 = v24;
  if (v24)
  {
    -[KTContextStore setKeyStore:](v24, "setKeyStore:", v18);
    -[KTContextStore setDataStore:](v25, "setDataStore:", v16);
    -[KTContextStore setStaticKeyStore:](v25, "setStaticKeyStore:", v17);
    -[KTContextStore setAccountKeyServer:](v25, "setAccountKeyServer:", v20);
    -[KTContextStore setStateMachine:](v25, "setStateMachine:", v21);
    -[KTContextStore setKvs:](v25, "setKvs:", v22);
    -[KTContextStore setCloudRecords:](v25, "setCloudRecords:", v19);
    -[KTContextStore setFollowup:](v25, "setFollowup:", v23);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[KTContextStore set_contexts:](v25, "set_contexts:", v26);

  }
  return v25;
}

- (KTContextStore)initWithDataStore:(id)a3 staticKeyStore:(id)a4 keyStore:(id)a5 cloudRecords:(id)a6 accountKeyServer:(id)a7 followup:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  KTContextStore *v21;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = a3;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[KTKVSSoftStore sharedStore](KTKVSSoftStore, "sharedStore"));
  v21 = -[KTContextStore initWithDataStore:staticKeyStore:keyStore:cloudRecords:accountKeyServer:stateMachine:kvs:followup:](self, "initWithDataStore:staticKeyStore:keyStore:cloudRecords:accountKeyServer:stateMachine:kvs:followup:", v19, v18, v17, v16, v15, 0, v20, v14);

  return v21;
}

- (NSDictionary)contexts
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
  objc_sync_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithDictionary:](NSDictionary, "dictionaryWithDictionary:", v4));

  objc_sync_exit(v3);
  return (NSDictionary *)v5;
}

- (void)setContext:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
  objc_sync_enter(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, v6);

  objc_sync_exit(v7);
}

- (void)forcedConfigure:(BOOL)a3 logClient:(id)a4 applicationHandler:(id)a5 completionHandler:(id)a6
{
  _BOOL4 v8;
  id v10;
  id v11;
  void (**v12)(id, _QWORD);
  void *v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  void *i;
  NSObject *v23;
  void *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint8_t v30[128];
  uint8_t buf[4];
  id v32;
  __int16 v33;
  unsigned int v34;
  __int16 v35;
  _BOOL4 v36;

  v8 = a3;
  v10 = a4;
  v11 = a5;
  v12 = (void (**)(id, _QWORD))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore"));
  v14 = objc_msgSend(v13, "ready");

  if (!v14 || v8)
  {
    if (qword_1002A4600 != -1)
      dispatch_once(&qword_1002A4600, &stru_10023EAE0);
    v23 = qword_1002A4608;
    if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      v32 = v10;
      v33 = 1024;
      v34 = v14;
      v35 = 1024;
      v36 = v8;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Configuring key store with log client %@, ready = %d, forced = %d", buf, 0x18u);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore"));
    objc_msgSend(v24, "configureWithClient:ignoreCachedKeys:dataStore:contextStore:applicationHandler:completionHandler:", v10, 1, v25, self, v11, v12);

  }
  else
  {
    if (qword_1002A4600 != -1)
      dispatch_once(&qword_1002A4600, &stru_10023EB00);
    v15 = qword_1002A4608;
    if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Key store configuration skipped. Using existing key stores.", buf, 2u);
    }
    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore", 0));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "applicationKeyStores"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "allKeys"));

    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v20; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v21)
            objc_enumerationMutation(v18);
          if (v11)
            (*((void (**)(id, _QWORD, _QWORD))v11 + 2))(v11, *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), 0);
        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
      }
      while (v20);
    }

    if (v12)
      v12[2](v12, 0);
  }

}

- (void)configureWithClient:(id)a3 applicationHandler:(id)a4 completionHandler:(id)a5
{
  -[KTContextStore forcedConfigure:logClient:applicationHandler:completionHandler:](self, "forcedConfigure:logClient:applicationHandler:completionHandler:", 0, a3, a4, a5);
}

- (void)configureWithClient:(id)a3 force:(BOOL)a4 applicationHandler:(id)a5 completionHandler:(id)a6
{
  -[KTContextStore forcedConfigure:logClient:applicationHandler:completionHandler:](self, "forcedConfigure:logClient:applicationHandler:completionHandler:", a4, a3, a5, a6);
}

- (void)storeContext:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;

  v6 = a3;
  v7 = a4;
  if (v6)
  {
    if (qword_1002A4600 != -1)
      dispatch_once(&qword_1002A4600, &stru_10023EB20);
    v8 = qword_1002A4608;
    if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 138543362;
      v12 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "KTContext initialization for application %{public}@ success", (uint8_t *)&v11, 0xCu);
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
    objc_sync_enter(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
    objc_msgSend(v10, "setValue:forKey:", v6, v7);

    objc_sync_exit(v9);
  }

}

- (id)createContextForApplication:(id)a3 dataStore:(id)a4 staticKeyStore:(id)a5 logClient:(id)a6 stateMachine:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  KTContext *v19;
  void *v20;
  void *v21;
  KTContextDependencies *v22;
  void *v23;
  id v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v33;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "applicationKeyStores"));
  v19 = (KTContext *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectForKey:", v12));

  if (v19)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "applicationKeyStores"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "objectForKeyedSubscript:", v12));

    v22 = objc_alloc_init(KTContextDependencies);
    -[KTContextDependencies setApplicationKeyStore:](v22, "setApplicationKeyStore:", v33);
    -[KTContextDependencies setDataStore:](v22, "setDataStore:", v13);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore stateMachine](self, "stateMachine"));
    v24 = v14;
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "deps"));
    v26 = v13;
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "smDataStore"));
    -[KTContextDependencies setSmDataStore:](v22, "setSmDataStore:", v27);

    v14 = v24;
    -[KTContextDependencies setLogClient:](v22, "setLogClient:", v15);
    -[KTContextDependencies setStateMachine:](v22, "setStateMachine:", v16);
    -[KTContextDependencies setContextStore:](v22, "setContextStore:", self);
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore accountKeyServer](self, "accountKeyServer"));
    -[KTContextDependencies setAccountKeyServer:](v22, "setAccountKeyServer:", v28);

    -[KTContextDependencies setStaticKeyStore:](v22, "setStaticKeyStore:", v24);
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore kvs](self, "kvs"));
    -[KTContextDependencies setKvs:](v22, "setKvs:", v29);

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore cloudRecords](self, "cloudRecords"));
    -[KTContextDependencies setCloudRecords:](v22, "setCloudRecords:", v30);

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore followup](self, "followup"));
    -[KTContextDependencies setFollowup:](v22, "setFollowup:", v31);

    v13 = v26;
    v19 = -[KTContext initWithApplicationID:dependencies:]([KTContext alloc], "initWithApplicationID:dependencies:", v12, v22);
    -[KTContextStore storeContext:application:](self, "storeContext:application:", v19, v12);

  }
  return v19;
}

- (id)createContextForTLT:(id)a3 staticKeyStore:(id)a4 logClient:(id)a5 stateMachine:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  KTContextDependencies *v16;
  void *v17;
  KTContext *v18;
  uint64_t v19;
  KTContext *v20;

  v10 = a6;
  v11 = a5;
  v12 = a4;
  v13 = a3;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "tltKeyStore"));

  v16 = objc_alloc_init(KTContextDependencies);
  -[KTContextDependencies setApplicationKeyStore:](v16, "setApplicationKeyStore:", v15);
  -[KTContextDependencies setDataStore:](v16, "setDataStore:", v13);

  -[KTContextDependencies setLogClient:](v16, "setLogClient:", v11);
  -[KTContextDependencies setStateMachine:](v16, "setStateMachine:", v10);

  -[KTContextDependencies setContextStore:](v16, "setContextStore:", self);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore accountKeyServer](self, "accountKeyServer"));
  -[KTContextDependencies setAccountKeyServer:](v16, "setAccountKeyServer:", v17);

  -[KTContextDependencies setStaticKeyStore:](v16, "setStaticKeyStore:", v12);
  v18 = [KTContext alloc];
  v19 = kKTApplicationIdentifierTLT;
  v20 = -[KTContext initWithApplicationID:dependencies:](v18, "initWithApplicationID:dependencies:", kKTApplicationIdentifierTLT, v16);
  -[KTContextStore storeContext:application:](self, "storeContext:application:", v20, v19);

  return v20;
}

- (void)contextForApplication:(id)a3 logClient:(id)a4 fetchState:(BOOL)a5 completionHandler:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  void (**v12)(id, void *, _QWORD);
  void *v13;
  void *v14;
  NSObject *v15;
  NSObject *v16;
  _QWORD v17[5];
  id v18;
  id v19;
  void (**v20)(id, void *, _QWORD);
  __int128 *v21;
  _QWORD v22[4];
  id v23;
  KTContextStore *v24;
  id v25;
  __int128 *p_buf;
  __int128 buf;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  v7 = a5;
  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, void *, _QWORD))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore contexts](self, "contexts"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v10));

  if (v14 && objc_msgSend(v14, "ready:", 0))
  {
    v12[2](v12, v14, 0);
  }
  else if (v7)
  {
    if (qword_1002A4600 != -1)
      dispatch_once(&qword_1002A4600, &stru_10023EB40);
    v15 = qword_1002A4608;
    if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_INFO, "Fetching state needed for application %@", (uint8_t *)&buf, 0xCu);
    }
    *(_QWORD *)&buf = 0;
    *((_QWORD *)&buf + 1) = &buf;
    v28 = 0x3032000000;
    v29 = sub_100051304;
    v30 = sub_100051314;
    v31 = 0;
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_10005131C;
    v22[3] = &unk_10023EB88;
    p_buf = &buf;
    v23 = v10;
    v24 = self;
    v25 = v11;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000514E0;
    v17[3] = &unk_10023EBB0;
    v17[4] = self;
    v18 = v25;
    v21 = &buf;
    v20 = v12;
    v19 = v23;
    -[KTContextStore configureWithClient:applicationHandler:completionHandler:](self, "configureWithClient:applicationHandler:completionHandler:", v18, v22, v17);

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    if (qword_1002A4600 != -1)
      dispatch_once(&qword_1002A4600, &stru_10023EBD0);
    v16 = qword_1002A4608;
    if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(_QWORD *)((char *)&buf + 4) = v10;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Not fetching state needed for application %@", (uint8_t *)&buf, 0xCu);
    }
    v12[2](v12, 0, 0);
  }

}

- (void)validatePeerRequestId:(id)a3 uri:(id)a4 application:(id)a5 logClient:(id)a6 revalidate:(BOOL)a7 fetchNow:(BOOL)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  BOOL v27;
  BOOL v28;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a9;
  if ((objc_msgSend(v18, "ready") & 1) != 0)
  {
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_100051824;
    v22[3] = &unk_10023EBF8;
    v26 = v19;
    v23 = v16;
    v24 = v17;
    v25 = v15;
    v27 = a7;
    v28 = a8;
    -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v24, v18, 1, v22);

  }
  else
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -229, CFSTR("log client not ready")));
    v21 = objc_msgSend(objc_alloc((Class)KTVerifierResult), "initWithUri:application:ktResult:", v16, v17, 2);
    (*((void (**)(id, id, void *))v19 + 2))(v19, v21, v20);

  }
}

- (void)validatePeerRequestId:(id)a3 uri:(id)a4 application:(id)a5 logClient:(id)a6 completionHandler:(id)a7
{
  -[KTContextStore validatePeerRequestId:uri:application:logClient:revalidate:fetchNow:completionHandler:](self, "validatePeerRequestId:uri:application:logClient:revalidate:fetchNow:completionHandler:", a3, a4, a5, a6, 0, 0, a7);
}

- (void)validateEnrollmentRequestId:(id)a3 application:(id)a4 logClient:(id)a5 cloudOptIn:(id)a6 completionHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  id v22;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if ((objc_msgSend(v14, "ready") & 1) != 0)
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100051A98;
    v18[3] = &unk_10023EC20;
    v22 = v16;
    v19 = v13;
    v20 = v12;
    v21 = v15;
    -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v19, v14, 1, v18);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorInternal, -229, CFSTR("log client not ready")));
    (*((void (**)(id, uint64_t, _QWORD, _QWORD, void *))v16 + 2))(v16, 2, 0, 0, v17);

  }
}

- (void)ignoreFailure:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  NSObject *v12;
  id v13;
  void *v14;
  int v15;
  id v16;

  v6 = a3;
  if (qword_1002A4600 != -1)
    dispatch_once(&qword_1002A4600, &stru_10023EC40);
  v7 = (void *)qword_1002A4608;
  if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_DEFAULT))
  {
    v8 = v7;
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "requestId"));
    v15 = 138543362;
    v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Saving ignored failure for requestId %{public}@", (uint8_t *)&v15, 0xCu);

  }
  objc_msgSend(v6, "setVerificationResult:", 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore"));
  v11 = objc_msgSend(v10, "persistWithError:", a4);

  if ((v11 & 1) == 0)
  {
    if (qword_1002A4600 != -1)
      dispatch_once(&qword_1002A4600, &stru_10023EC60);
    v12 = qword_1002A4608;
    if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_ERROR))
    {
      if (a4)
        v13 = *a4;
      else
        v13 = 0;
      v15 = 138412290;
      v16 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "failed to save updated request: %@", (uint8_t *)&v15, 0xCu);
    }
    if (a4 && *a4)
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore"));
      objc_msgSend(v14, "reportCoreDataPersistEventForLocation:underlyingError:", CFSTR("updateRequest"), *a4);

    }
  }

}

- (void)clearApplicationState:(id)a3 logClient:(id)a4 completionBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (qword_1002A4600 != -1)
    dispatch_once(&qword_1002A4600, &stru_10023EC80);
  v11 = qword_1002A4608;
  if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Clearing KT context for application '%@'", buf, 0xCu);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore"));
  v17 = 0;
  objc_msgSend(v12, "clearStateForApplication:error:", v8, &v17);
  v13 = v17;

  if (v13)
  {
    if (qword_1002A4600 != -1)
      dispatch_once(&qword_1002A4600, &stru_10023ECA0);
    v14 = qword_1002A4608;
    if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed clearing managed data store: %@", buf, 0xCu);
    }
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore keyStore](self, "keyStore"));
  v16 = 0;
  objc_msgSend(v15, "clearApplicationState:error:", v8, &v16);

  -[KTContextStore configureWithClient:force:applicationHandler:completionHandler:](self, "configureWithClient:force:applicationHandler:completionHandler:", v9, 1, &stru_10023ECE0, v10);
}

- (void)clearContextForApplication:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
  objc_sync_enter(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore _contexts](self, "_contexts"));
  objc_msgSend(v5, "setObject:forKeyedSubscript:", 0, v6);

  objc_sync_exit(v4);
}

- (void)verifyHeadInclusionDownload:(id)a3 application:(id)a4 logClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000522B0;
  v11[3] = &unk_10023ED48;
  v12 = a4;
  v13 = v8;
  v9 = v8;
  v10 = v12;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v10, a5, 1, v11);

}

- (void)verifyHeadConsistencyDownload:(id)a3 application:(id)a4 logClient:(id)a5
{
  id v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v8 = a3;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000524F8;
  v11[3] = &unk_10023ED48;
  v12 = a4;
  v13 = v8;
  v9 = v8;
  v10 = v12;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v10, a5, 1, v11);

}

- (void)failHeadDownload:(id)a3 application:(id)a4 failure:(id)a5 retry:(BOOL)a6 logClient:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  KTContextStore *v18;
  id v19;
  id v20;
  id v21;

  v11 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100052788;
  v16[3] = &unk_10023ED90;
  v17 = a4;
  v18 = self;
  v19 = v11;
  v20 = a5;
  v21 = a7;
  v12 = v21;
  v13 = v20;
  v14 = v11;
  v15 = v17;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v15, v12, 1, v16);

}

- (id)serializeTranscripts
{
  id v3;
  void *v4;
  id v5;
  _QWORD v7[4];
  id v8;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore contexts](self, "contexts"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000528D0;
  v7[3] = &unk_10023EDB8;
  v5 = v3;
  v8 = v5;
  objc_msgSend(v4, "enumerateKeysAndObjectsUsingBlock:", v7);

  return v5;
}

- (void)clearGossip
{
  -[KTContextStore setCachedGossip:](self, "setCachedGossip:", 0);
}

- (void)retrieveTLTSTH:(id)a3 block:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  NSObject *v23;
  _QWORD v24[5];
  void (**v25)(id, _QWORD, void *);
  uint8_t buf[8];
  NSErrorUserInfoKey v27;
  const __CFString *v28;

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  if (!-[KTContextStore shouldGossip](self, "shouldGossip"))
  {
    if (qword_1002A4600 != -1)
      dispatch_once(&qword_1002A4600, &stru_10023EDD8);
    v15 = qword_1002A4608;
    if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "All applications have exceeded 30 days since shutting down.", buf, 2u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics formatEventName:application:](TransparencyAnalytics, "formatEventName:application:", CFSTR("GossipAllApplicationsShutDownAfter30Days"), kKTApplicationIdentifierTLT));
    v16 = kTransparencyErrorGossip;
    v27 = NSLocalizedDescriptionKey;
    v28 = CFSTR("All applications have exceeded 30 days since shutting down.");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v28, &v27, 1));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v16, -280, v17));

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyAnalytics logger](TransparencyAnalytics, "logger"));
    objc_msgSend(v19, "logResultForEvent:hardFailure:result:", v14, 0, v18);

    v7[2](v7, 0, v18);
    goto LABEL_14;
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore cachedGossip](self, "cachedGossip"));
  v10 = objc_opt_class(NSData, v9);
  if ((objc_opt_isKindOfClass(v8, v10) & 1) != 0)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore cachedGossip](self, "cachedGossip"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));

    if (v11 != v12)
    {
      if (qword_1002A4600 != -1)
        dispatch_once(&qword_1002A4600, &stru_10023EDF8);
      v13 = qword_1002A4608;
      if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Sending cached gossip", buf, 2u);
      }
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore cachedGossip](self, "cachedGossip"));
      ((void (**)(id, void *, void *))v7)[2](v7, v14, 0);
LABEL_14:

      goto LABEL_23;
    }
  }
  else
  {

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore cachedGossip](self, "cachedGossip"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSData data](NSData, "data"));

  if (v20 == v21)
  {
    if (qword_1002A4600 != -1)
      dispatch_once(&qword_1002A4600, &stru_10023EE18);
    v23 = qword_1002A4608;
    if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_INFO, "Sending empty cached gossip", buf, 2u);
    }
    v7[2](v7, 0, 0);
  }
  else
  {
    v22 = kKTApplicationIdentifierTLT;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100052D94;
    v24[3] = &unk_10023EE80;
    v24[4] = self;
    v25 = v7;
    -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v22, v6, 1, v24);

  }
LABEL_23:

}

- (void)receivedSTHsFromPeers:(id)a3 logClient:(id)a4 verifier:(id)a5 block:(id)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  id v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;

  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = kKTApplicationIdentifierTLT;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_10005311C;
  v17[3] = &unk_10023EEA8;
  v19 = v11;
  v20 = v12;
  v18 = v10;
  v14 = v11;
  v15 = v10;
  v16 = v12;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v13, a4, 1, v17);

}

- (BOOL)shouldGossip
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[5];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v3 = objc_claimAutoreleasedReturnValue(-[KTContextStore contexts](self, "contexts"));
  if (!v3)
    return 1;
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore contexts](self, "contexts"));
  v6 = objc_msgSend(v5, "count");

  if (!v6)
    return 1;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore contexts](self, "contexts"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000532DC;
  v10[3] = &unk_10023EED0;
  v10[4] = &v11;
  objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v10);

  v8 = *((_BYTE *)v12 + 24) != 0;
  _Block_object_dispose(&v11, 8);
  return v8;
}

- (void)signData:(id)a3 application:(id)a4 logClient:(id)a5 completionBlock:(id)a6
{
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v9 = a3;
  v10 = a6;
  v11 = kKTApplicationIdentifierTLT;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000533DC;
  v14[3] = &unk_10023EE80;
  v15 = v9;
  v16 = v10;
  v12 = v9;
  v13 = v10;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v11, a5, 1, v14);

}

- (void)rollKeyForApplication:(id)a3 logClient:(id)a4 completionBlock:(id)a5
{
  id v7;
  uint64_t v8;
  id v9;
  _QWORD v10[4];
  id v11;

  v7 = a5;
  v8 = kKTApplicationIdentifierTLT;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10005351C;
  v10[3] = &unk_10023EEF8;
  v11 = v7;
  v9 = v7;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v8, a4, 1, v10);

}

- (void)getKTOptInState:(id)a3 sync:(BOOL)a4 logClient:(id)a5 completionblock:(id)a6
{
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  BOOL v15;

  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100053678;
  v12[3] = &unk_10023EF20;
  v13 = a3;
  v14 = a6;
  v15 = a4;
  v10 = v14;
  v11 = v13;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v11, a5, 1, v12);

}

- (void)changeOptInState:(unint64_t)a3 application:(id)a4 logClient:(id)a5 completionBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  KTContextStore *v15;
  id v16;
  unint64_t v17;

  v10 = a4;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100053800;
  v13[3] = &unk_10023EF48;
  v16 = a6;
  v17 = a3;
  v14 = v10;
  v15 = self;
  v11 = v16;
  v12 = v10;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v12, a5, 1, v13);

}

- (void)handleBatchQueryResponse:(id)a3 queryRequest:(id)a4 receiptDate:(id)a5 fetchId:(id)a6 application:(id)a7 logClient:(id)a8 transparentDataHandler:(id)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a9;
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100053A3C;
  v27[3] = &unk_10023EF70;
  v28 = v16;
  v29 = v17;
  v30 = v18;
  v31 = v19;
  v32 = a10;
  v33 = v20;
  v21 = v20;
  v22 = v19;
  v23 = v18;
  v24 = v17;
  v25 = v16;
  v26 = v32;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", a7, a8, 1, v27);

}

- (void)queryForUris:(id)a3 application:(id)a4 logClient:(id)a5 userInitiated:(BOOL)a6 cachedYoungerThan:(id)a7 completionHandler:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  id v23;
  BOOL v24;

  v14 = a3;
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_100053BE4;
  v19[3] = &unk_10023EFB8;
  v20 = a4;
  v21 = v14;
  v24 = a6;
  v22 = a7;
  v23 = a8;
  v15 = v22;
  v16 = v14;
  v17 = v23;
  v18 = v20;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v18, a5, 1, v19);

}

- (void)replaySelfValidate:(id)a3 application:(id)a4 pcsAccountKey:(id)a5 queryRequest:(id)a6 queryResponse:(id)a7 responseTime:(id)a8 logClient:(id)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  id v28;

  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_100053EC0;
  v22[3] = &unk_10023EFE0;
  v23 = a3;
  v24 = a5;
  v25 = a6;
  v26 = a7;
  v27 = a8;
  v28 = a10;
  v16 = v27;
  v17 = v26;
  v18 = v25;
  v19 = v24;
  v20 = v23;
  v21 = v28;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", a4, a9, 1, v22);

}

- (void)validatePeers:(id)a3 application:(id)a4 fetchNow:(BOOL)a5 logClient:(id)a6 completionBlock:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  BOOL v20;

  v12 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100053FDC;
  v16[3] = &unk_10023F008;
  v18 = a4;
  v19 = a7;
  v17 = v12;
  v20 = a5;
  v13 = v18;
  v14 = v12;
  v15 = v19;
  -[KTContextStore contextForApplication:logClient:fetchState:completionHandler:](self, "contextForApplication:logClient:fetchState:completionHandler:", v13, a6, 1, v16);

}

- (void)ignoreFailureForResults:(id)a3 application:(id)a4 completionBlock:(id)a5
{
  void (**v7)(id, id);
  id v8;
  void *v9;
  id v10;
  id v11;

  v7 = (void (**)(id, id))a5;
  v8 = a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore"));
  v11 = 0;
  objc_msgSend(v9, "ignoreFailureForResults:error:", v8, &v11);

  v10 = v11;
  v7[2](v7, v10);

}

- (void)handlePeerStateChange:(id)a3 application:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  int v12;
  void *v13;

  v6 = a3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore getCachedValidatePeerResults:application:](self, "getCachedValidatePeerResults:application:", v6, a4));
  if (qword_1002A4600 != -1)
    dispatch_once(&qword_1002A4600, &stru_10023F028);
  v8 = (void *)qword_1002A4608;
  if (os_log_type_enabled((os_log_t)qword_1002A4608, OS_LOG_TYPE_INFO))
  {
    v9 = v8;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "componentsJoinedByString:", CFSTR(", ")));
    v12 = 138412290;
    v13 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "HandlePeerStateChange will update IDS cache for %@", (uint8_t *)&v12, 0xCu);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore"));
  objc_msgSend(v11, "updateIDSCacheWithResults:", v7);

}

- (id)getCachedValidatePeerResults:(id)a3 application:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v6, "count")));
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(-[KTContextStore dataStore](self, "dataStore", (_QWORD)v19));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "verifierResultForPeer:application:", v14, v7));

        if (v16)
        {
          objc_msgSend(v8, "addObject:", v16);
        }
        else
        {
          v17 = objc_msgSend(objc_alloc((Class)KTVerifierResult), "initUnavailableForUri:application:", v14, v7);
          objc_msgSend(v8, "addObject:", v17);

        }
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v8;
}

- (KTSMManager)stateMachine
{
  return (KTSMManager *)objc_loadWeakRetained((id *)&self->stateMachine);
}

- (void)setStateMachine:(id)a3
{
  objc_storeWeak((id *)&self->stateMachine, a3);
}

- (TransparencyManagedDataStore)dataStore
{
  return (TransparencyManagedDataStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setDataStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (TransparencyStaticKeyStore)staticKeyStore
{
  return (TransparencyStaticKeyStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setStaticKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (KTPublicKeyStore)keyStore
{
  return (KTPublicKeyStore *)objc_getProperty(self, a2, 32, 1);
}

- (void)setKeyStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (KTCloudRecordsProtocol)cloudRecords
{
  return (KTCloudRecordsProtocol *)objc_getProperty(self, a2, 40, 1);
}

- (void)setCloudRecords:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (KTAccountKeyProtocol)accountKeyServer
{
  return (KTAccountKeyProtocol *)objc_getProperty(self, a2, 48, 1);
}

- (void)setAccountKeyServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (NSMutableDictionary)_contexts
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 56, 1);
}

- (void)set_contexts:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (NSData)cachedGossip
{
  return (NSData *)objc_getProperty(self, a2, 64, 1);
}

- (void)setCachedGossip:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (KTKVSProtocol)kvs
{
  return (KTKVSProtocol *)objc_getProperty(self, a2, 72, 1);
}

- (void)setKvs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (TransparencyFollowUpProtocol)followup
{
  return (TransparencyFollowUpProtocol *)objc_getProperty(self, a2, 80, 1);
}

- (void)setFollowup:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_followup, 0);
  objc_storeStrong((id *)&self->_kvs, 0);
  objc_storeStrong((id *)&self->_cachedGossip, 0);
  objc_storeStrong((id *)&self->__contexts, 0);
  objc_storeStrong((id *)&self->_accountKeyServer, 0);
  objc_storeStrong((id *)&self->_cloudRecords, 0);
  objc_storeStrong((id *)&self->_keyStore, 0);
  objc_storeStrong((id *)&self->_staticKeyStore, 0);
  objc_storeStrong((id *)&self->_dataStore, 0);
  objc_destroyWeak((id *)&self->stateMachine);
}

@end
