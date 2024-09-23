@implementation KTLogClient

+ (id)requiredBagKeys
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD v12[10];
  _QWORD v13[10];

  v12[0] = CFSTR("build-version");
  v13[0] = objc_opt_class(NSString, a2);
  v12[1] = CFSTR("rest-query");
  v13[1] = objc_opt_class(NSString, v2);
  v12[2] = CFSTR("rest-batch-query");
  v13[2] = objc_opt_class(NSString, v3);
  v12[3] = CFSTR("batch-query-max-uris");
  v13[3] = objc_opt_class(NSNumber, v4);
  v12[4] = CFSTR("batch-log-inclusion-max-proofs");
  v13[4] = objc_opt_class(NSNumber, v5);
  v12[5] = CFSTR("batch-consistency-max-proofs");
  v13[5] = objc_opt_class(NSNumber, v6);
  v12[6] = CFSTR("rest-consistency-proof");
  v13[6] = objc_opt_class(NSString, v7);
  v12[7] = CFSTR("rest-public-keys");
  v13[7] = objc_opt_class(NSString, v8);
  v12[8] = CFSTR("rest-revision-log-inclusion-proof");
  v13[8] = objc_opt_class(NSString, v9);
  v12[9] = CFSTR("rest-report-to-apple");
  v13[9] = objc_opt_class(NSString, v10);
  return (id)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 10));
}

- (KTLogClient)init
{
  id v3;
  KTLogClient *v4;

  v3 = objc_alloc_init((Class)TransparencySettings);
  v4 = -[KTLogClient initWithSettings:](self, "initWithSettings:", v3);

  return v4;
}

- (KTLogClient)initWithSettings:(id)a3
{
  id v4;
  KTLogClient *v5;
  KTLogClient *v6;
  void *v7;
  TransparencyConfigBag *v8;
  void *v9;
  void *v10;
  void *v11;
  TransparencyConfigBag *v12;
  objc_super v14;

  v4 = a3;
  v14.receiver = self;
  v14.super_class = (Class)KTLogClient;
  v5 = -[KTLogClient init](&v14, "init");
  v6 = v5;
  if (v5)
  {
    -[KTLogClient setOverrideIDMSFetchTime:](v5, "setOverrideIDMSFetchTime:", 604800.0);
    -[TransparencyLogClient setSettings:](v6, "setSettings:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient settings](v6, "settings"));
    -[KTLogClient setCurrentEnvironment:](v6, "setCurrentEnvironment:", objc_msgSend(v7, "getEnvironment"));

    v8 = [TransparencyConfigBag alloc];
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[KTLogClient requiredBagKeys](KTLogClient, "requiredBagKeys"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient settings](v6, "settings"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport transparencyFilesPath:](TransparencyFileSupport, "transparencyFilesPath:", 0));
    v12 = -[TransparencyConfigBag initWithRequiredKeys:settings:directory:configApp:](v8, "initWithRequiredKeys:settings:directory:configApp:", v9, v10, v11, 1);
    -[KTLogClient setConfigBag:](v6, "setConfigBag:", v12);

  }
  return v6;
}

- (KTLogClient)initWithBackgroundSession:(id)a3 transparencyAnalytics:(id)a4 dataStore:(id)a5 settings:(id)a6
{
  id v10;
  KTLogClient *v11;
  KTLogClient *v12;
  void *v13;
  TransparencyConfigBag *v14;
  void *v15;
  void *v16;
  TransparencyConfigBag *v17;
  objc_super v19;

  v10 = a6;
  v19.receiver = self;
  v19.super_class = (Class)KTLogClient;
  v11 = -[TransparencyLogClient initWithBackgroundSession:transparencyAnalytics:dataStore:settings:](&v19, "initWithBackgroundSession:transparencyAnalytics:dataStore:settings:", a3, a4, a5, v10);
  v12 = v11;
  if (v11)
  {
    -[KTLogClient setOverrideIDMSFetchTime:](v11, "setOverrideIDMSFetchTime:", 604800.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient settings](v12, "settings"));
    -[KTLogClient setCurrentEnvironment:](v12, "setCurrentEnvironment:", objc_msgSend(v13, "getEnvironment"));

    v14 = [TransparencyConfigBag alloc];
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[KTLogClient requiredBagKeys](KTLogClient, "requiredBagKeys"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyFileSupport transparencyFilesPath:](TransparencyFileSupport, "transparencyFilesPath:", 0));
    v17 = -[TransparencyConfigBag initWithRequiredKeys:settings:directory:configApp:](v14, "initWithRequiredKeys:settings:directory:configApp:", v15, v10, v16, 1);
    -[KTLogClient setConfigBag:](v12, "setConfigBag:", v17);

  }
  return v12;
}

- (void)configure:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10015E844;
  v7[3] = &unk_10023D588;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "configureWithFetcher:completionHandler:", self, v7);

}

- (void)configureFromNetwork:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10015E94C;
  v7[3] = &unk_10023D588;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "configureFromNetworkWithFetcher:completionHandler:", self, v7);

}

- (BOOL)configured
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v3 = objc_msgSend(v2, "configured");

  return v3;
}

- (void)clearState:(id *)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  objc_msgSend(v4, "clearState:", a3);

}

- (void)fetchConfigBag:(id)a3 completionHandler:(id)a4
{
  id v6;
  _QWORD v7[4];
  id v8;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10015EAB8;
  v7[3] = &unk_100249060;
  v8 = a4;
  v6 = v8;
  -[TransparencyLogClient fetch:allowEmptyData:useReversePush:completionHandler:](self, "fetch:allowEmptyData:useReversePush:completionHandler:", a3, 0, 0, v7);

}

- (void)triggerConfigBagFetch:(double)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[KTLogClient triggerInterface](self, "triggerInterface"));
  objc_msgSend(v4, "triggerConfigBagFetch:", a3);

}

+ (id)formatEventName:(id)a3 state:(id)a4
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-%@"), a3, a4);
}

+ (id)formatEventName:(id)a3 application:(id)a4 state:(id)a5
{
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("kt%@%@-%@"), a4, a3, a5);
}

- (double)idmsFetchTime
{
  double result;

  -[KTLogClient overrideIDMSFetchTime](self, "overrideIDMSFetchTime");
  return result;
}

- (id)copyConfigurationBag:(id *)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v5 = objc_msgSend(v4, "copyConfigurationBag:", a3);

  return v5;
}

- (unint64_t)userReversePushPercentage
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v4 = objc_msgSend(v3, "overrideReversePushConfig");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v6 = v5;
  if (v4)
    v7 = objc_msgSend(v5, "overrideReversePushPercentage");
  else
    v7 = objc_msgSend(v5, "percentageForKey:", CFSTR("reverse-push-user-action-percent"));
  v8 = (unint64_t)v7;

  return v8;
}

- (unint64_t)xpcActivityReversePushPercentage
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v4 = objc_msgSend(v3, "overrideReversePushConfig");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v6 = v5;
  if (v4)
    v7 = objc_msgSend(v5, "overrideReversePushPercentage");
  else
    v7 = objc_msgSend(v5, "percentageForKey:", CFSTR("reverse-push-nightly-task-percent"));
  v8 = (unint64_t)v7;

  return v8;
}

- (unint64_t)batchQueryMaxURIs
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v3 = objc_msgSend(v2, "uintegerForKey:", CFSTR("batch-query-max-uris"));

  return (unint64_t)v3;
}

- (unint64_t)consistencyMaxProofs
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v3 = objc_msgSend(v2, "uintegerForKey:", CFSTR("batch-consistency-max-proofs"));

  return (unint64_t)v3;
}

- (unint64_t)revisionLogMaxProofs
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v3 = objc_msgSend(v2, "uintegerForKey:", CFSTR("batch-log-inclusion-max-proofs"));

  return (unint64_t)v3;
}

- (id)queryURI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "urlForKey:", CFSTR("rest-query")));

  return v3;
}

- (id)batchQueryURI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "urlForKey:", CFSTR("rest-batch-query")));

  return v3;
}

- (NSURL)consistencyProofURI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "urlForKey:", CFSTR("rest-consistency-proof")));

  return (NSURL *)v3;
}

- (NSURL)publicKeysURI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "urlForKey:", CFSTR("rest-public-keys")));

  return (NSURL *)v3;
}

- (id)revisionLogProofURI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "urlForKey:", CFSTR("rest-revision-log-inclusion-proof")));

  return v3;
}

- (id)reportToAppleURI
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[KTLogClient configBag](self, "configBag"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "urlForKey:", CFSTR("rest-report-to-apple")));

  return v3;
}

- (BOOL)shouldUseReversePush:(BOOL)a3
{
  unint64_t v3;
  unint64_t v4;
  NSObject *v5;
  BOOL v6;
  NSObject *v7;
  uint32_t v8;
  double v9;
  NSObject *v10;
  int v12;
  unint64_t v13;
  __int16 v14;
  uint32_t v15;
  __int16 v16;
  _BOOL4 v17;

  if (a3)
    v3 = -[KTLogClient userReversePushPercentage](self, "userReversePushPercentage");
  else
    v3 = -[KTLogClient xpcActivityReversePushPercentage](self, "xpcActivityReversePushPercentage");
  v4 = v3;
  if (v3 == 100)
  {
    if (qword_1002A7918 != -1)
      dispatch_once(&qword_1002A7918, &stru_1002490A0);
    v7 = qword_1002A7920;
    if (os_log_type_enabled((os_log_t)qword_1002A7920, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Reverse push enabled by config bag", (uint8_t *)&v12, 2u);
    }
    return 1;
  }
  else if (v3)
  {
    v8 = arc4random();
    v9 = (double)v4 * 4294967300.0 / 100.0;
    v6 = v9 > (double)v8;
    if (qword_1002A7918 != -1)
      dispatch_once(&qword_1002A7918, &stru_1002490C0);
    v10 = qword_1002A7920;
    if (os_log_type_enabled((os_log_t)qword_1002A7920, OS_LOG_TYPE_DEBUG))
    {
      v12 = 134218496;
      v13 = v4;
      v14 = 1024;
      v15 = v8;
      v16 = 1024;
      v17 = v9 > (double)v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Reverse push percentage: %lu; die roll: %u; decision: %d",
        (uint8_t *)&v12,
        0x18u);
    }
  }
  else
  {
    if (qword_1002A7918 != -1)
      dispatch_once(&qword_1002A7918, &stru_100249080);
    v5 = qword_1002A7920;
    if (os_log_type_enabled((os_log_t)qword_1002A7920, OS_LOG_TYPE_DEBUG))
    {
      LOWORD(v12) = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Reverse push disabled by config bag", (uint8_t *)&v12, 2u);
    }
    return 0;
  }
  return v6;
}

- (void)fetchPublicKeys:(id)a3 completionHandler:(id)a4
{
  id v6;
  void (**v7)(id, _QWORD, void *);
  void *v8;
  unsigned int v9;
  void *v10;
  _QWORD v11[4];
  id v12;
  KTLogClient *v13;
  void (**v14)(id, _QWORD, void *);

  v6 = a3;
  v7 = (void (**)(id, _QWORD, void *))a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  v9 = objc_msgSend(v8, "ktDisable");

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorKTDisabled, -390, CFSTR("fetchPublicKeys not permitted when kt disabled")));
    v7[2](v7, 0, v10);

  }
  else
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10015F28C;
    v11[3] = &unk_100249150;
    v14 = v7;
    v12 = v6;
    v13 = self;
    -[KTLogClient configure:](self, "configure:", v11);

  }
}

- (void)postReport:(id)a3 uuid:(id)a4 application:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void (**v13)(id, void *);
  void *v14;
  unsigned int v15;
  NSObject *v16;
  void (**v17)(id, void *);
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;
  void (**v22)(id, void *);
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = (void (**)(id, void *))a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  v15 = objc_msgSend(v14, "ktDisable");

  if (v15)
  {
    if (qword_1002A7918 != -1)
      dispatch_once(&qword_1002A7918, &stru_100249170);
    v16 = qword_1002A7920;
    if (os_log_type_enabled((os_log_t)qword_1002A7920, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "postReport not permitted when kt disabled", buf, 2u);
    }
    v17 = (void (**)(id, void *))objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorKTDisabled, -390, CFSTR("postReport not permitted when kt disabled")));
    v13[2](v13, v17);
  }
  else
  {
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_10015FAB4;
    v18[3] = &unk_1002491C0;
    v22 = v13;
    v18[4] = self;
    v19 = v10;
    v20 = v11;
    v21 = v12;
    -[KTLogClient configure:](self, "configure:", v18);

    v17 = v22;
  }

}

- (void)fetchMessage:(id)a3 uri:(id)a4 uuid:(id)a5 application:(id)a6 userInitiated:(BOOL)a7 completionHandler:(id)a8
{
  _BOOL8 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  CFAbsoluteTime Current;
  KTLogNetworkRequest *v20;
  void *v21;
  id v22;
  _BOOL8 v23;
  id v24;
  id v25;
  id v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  CFAbsoluteTime v31;
  BOOL v32;

  v9 = a7;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = a4;
  v18 = a3;
  Current = CFAbsoluteTimeGetCurrent();
  v20 = [KTLogNetworkRequest alloc];
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "data"));

  v22 = -[KTLogNetworkRequest initPOSTWithURL:data:uuid:application:](v20, "initPOSTWithURL:data:uuid:application:", v17, v21, v14, v15);
  objc_msgSend(v22, "setAdditionalHeaders:", &off_10025C5F8);
  v23 = -[KTLogClient shouldUseReversePush:](self, "shouldUseReversePush:", v9);
  objc_msgSend(v22, "setAuthenticated:", 1);
  objc_msgSend(v22, "setUseReversePush:", v23);
  if (v9)
    +[TransparencySettings defaultNetworkTimeout](TransparencySettings, "defaultNetworkTimeout");
  else
    +[TransparencySettings backgroundNetworkTimeout](TransparencySettings, "backgroundNetworkTimeout");
  objc_msgSend(v22, "setTimeout:");
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10015FE90;
  v27[3] = &unk_100249250;
  v32 = v23;
  v27[4] = self;
  v28 = v15;
  v29 = v14;
  v30 = v16;
  v31 = Current;
  v24 = v16;
  v25 = v14;
  v26 = v15;
  -[TransparencyLogClient fetchRequest:completionHandler:](self, "fetchRequest:completionHandler:", v22, v27);

}

- (void)fetchBatchQuery:(id)a3 uuid:(id)a4 userInitiated:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  KTLogClient *v19;
  id v20;
  id v21;
  BOOL v22;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  v14 = objc_msgSend(v13, "ktDisable");

  if (v14)
  {
    if (qword_1002A7918 != -1)
      dispatch_once(&qword_1002A7918, &stru_100249270);
    v15 = qword_1002A7920;
    if (os_log_type_enabled((os_log_t)qword_1002A7920, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "fetchBatchQuery not permitted when kt disabled", buf, 2u);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorKTDisabled, -390, CFSTR("fetchBatchQuery not permitted when kt disabled")));
    (*((void (**)(id, _QWORD, _QWORD, void *))v12 + 2))(v12, 0, 0, v16);
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001606D8;
    v17[3] = &unk_10023BB88;
    v21 = v12;
    v18 = v10;
    v19 = self;
    v20 = v11;
    v22 = a5;
    -[KTLogClient configure:](self, "configure:", v17);

    v16 = v21;
  }

}

- (void)fetchBatchQueries:(id)a3 userInitiated:(BOOL)a4 responseHandler:(id)a5 completionHandler:(id)a6
{
  _BOOL8 v8;
  id v10;
  void (**v11)(_QWORD);
  void *v12;
  unsigned int v13;
  NSObject *v14;
  NSObject *v15;
  dispatch_queue_attr_t v16;
  NSObject *v17;
  id v18;
  void **v19;
  id v20;
  uint64_t v21;
  _UNKNOWN **v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  NSObject *v27;
  id v28;
  uint64_t v29;
  KTLogClient *v30;
  _BOOL8 v31;
  void **v32;
  void *v33;
  id v34;
  NSObject *queue;
  void (**v36)(_QWORD);
  id v37;
  id obj;
  id v39;
  void *v40;
  _QWORD block[4];
  void (**v42)(_QWORD);
  _QWORD v43[4];
  id v44;
  NSObject *v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  uint64_t v54;
  __int16 v55;
  void *v56;
  _BYTE v57[128];

  v8 = a4;
  v10 = a3;
  v39 = a5;
  v11 = (void (**)(_QWORD))a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  v13 = objc_msgSend(v12, "ktDisable");

  if (v13)
  {
    if (qword_1002A7918 != -1)
      dispatch_once(&qword_1002A7918, &stru_1002492B8);
    v14 = qword_1002A7920;
    if (os_log_type_enabled((os_log_t)qword_1002A7920, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "fetchBatchQueries not permitted when kt disabled", buf, 2u);
    }
    v11[2](v11);
  }
  else
  {
    v36 = v11;
    v15 = dispatch_group_create();
    v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    queue = dispatch_queue_create("com.apple.transparencyd.batchQueue", v17);

    v49 = 0u;
    v50 = 0u;
    v47 = 0u;
    v48 = 0u;
    v37 = v10;
    obj = v10;
    v18 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
    v19 = _NSConcreteStackBlock;
    if (v18)
    {
      v20 = v18;
      v21 = *(_QWORD *)v48;
      v22 = NSSet_ptr;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v48 != v21)
            objc_enumerationMutation(obj);
          v40 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * (_QWORD)v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22[10], "UUID"));
          if (qword_1002A7918 != -1)
            dispatch_once(&qword_1002A7918, &stru_1002492D8);
          v25 = (void *)qword_1002A7920;
          if (os_log_type_enabled((os_log_t)qword_1002A7920, OS_LOG_TYPE_DEFAULT))
          {
            v26 = v25;
            v27 = v15;
            v28 = v20;
            v29 = v21;
            v30 = self;
            v31 = v8;
            v32 = v19;
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "uriArray"));
            *(_DWORD *)buf = 138543874;
            v52 = v24;
            v53 = 2160;
            v54 = 1752392040;
            v55 = 2112;
            v56 = v33;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Fetching batch query response with fetchId %{public}@ for uris %{mask.hash}@", buf, 0x20u);

            v19 = v32;
            v8 = v31;
            self = v30;
            v21 = v29;
            v20 = v28;
            v15 = v27;
            v22 = NSSet_ptr;

          }
          dispatch_group_enter(v15);
          v43[0] = v19;
          v43[1] = 3221225472;
          v43[2] = sub_100160E10;
          v43[3] = &unk_100249300;
          v46 = v39;
          v44 = v24;
          v45 = v15;
          v34 = v24;
          -[KTLogClient fetchBatchQuery:uuid:userInitiated:completionHandler:](self, "fetchBatchQuery:uuid:userInitiated:completionHandler:", v40, v34, v8, v43);

          v23 = (char *)v23 + 1;
        }
        while (v20 != v23);
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
      }
      while (v20);
    }

    block[0] = v19;
    block[1] = 3221225472;
    block[2] = sub_100160E44;
    block[3] = &unk_1002474B0;
    v11 = v36;
    v42 = v36;
    dispatch_group_notify(v15, queue, block);

    v10 = v37;
  }

}

- (void)fetchBatchQuery:(id)a3 uuid:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  v12 = objc_msgSend(v11, "ktDisable");

  if (v12)
  {
    if (qword_1002A7918 != -1)
      dispatch_once(&qword_1002A7918, &stru_100249320);
    v13 = qword_1002A7920;
    if (os_log_type_enabled((os_log_t)qword_1002A7920, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "fetchBatchQuery not permitted when kt disabled", v15, 2u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorKTDisabled, -390, CFSTR("fetchBatchQuery not permitted when kt disabled")));
    (*((void (**)(id, _QWORD, _QWORD, void *))v10 + 2))(v10, 0, 0, v14);

  }
  else
  {
    -[KTLogClient fetchBatchQuery:uuid:userInitiated:completionHandler:](self, "fetchBatchQuery:uuid:userInitiated:completionHandler:", v8, v9, 0, v10);
  }

}

- (void)fetchQuery:(id)a3 uuid:(id)a4 userInitiated:(BOOL)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void (**v12)(id, _QWORD, void *);
  void *v13;
  unsigned int v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  KTLogClient *v19;
  id v20;
  void (**v21)(id, _QWORD, void *);
  BOOL v22;
  uint8_t buf[16];

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(id, _QWORD, void *))a6;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  v14 = objc_msgSend(v13, "ktDisable");

  if (v14)
  {
    if (qword_1002A7918 != -1)
      dispatch_once(&qword_1002A7918, &stru_100249340);
    v15 = qword_1002A7920;
    if (os_log_type_enabled((os_log_t)qword_1002A7920, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "fetchQuery not permitted when kt disabled", buf, 2u);
    }
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorKTDisabled, -390, CFSTR("fetchQuery not permitted when kt disabled")));
    v12[2](v12, 0, v16);
  }
  else
  {
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1001611A0;
    v17[3] = &unk_10023BB88;
    v21 = v12;
    v18 = v10;
    v19 = self;
    v20 = v11;
    v22 = a5;
    -[KTLogClient configure:](self, "configure:", v17);

    v16 = v21;
  }

}

- (void)fetchQuery:(id)a3 uuid:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  unsigned int v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  v12 = objc_msgSend(v11, "ktDisable");

  if (v12)
  {
    if (qword_1002A7918 != -1)
      dispatch_once(&qword_1002A7918, &stru_100249360);
    v13 = qword_1002A7920;
    if (os_log_type_enabled((os_log_t)qword_1002A7920, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "fetchQuery not permitted when kt disabled", v15, 2u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorKTDisabled, -390, CFSTR("fetchQuery not permitted when kt disabled")));
    v10[2](v10, 0, v14);

  }
  else
  {
    -[KTLogClient fetchQuery:uuid:userInitiated:completionHandler:](self, "fetchQuery:uuid:userInitiated:completionHandler:", v8, v9, 0, v10);
  }

}

- (void)fetchConsistencyProof:(id)a3 uuid:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  unsigned int v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  void (**v18)(id, _QWORD, void *);
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  v12 = objc_msgSend(v11, "ktDisable");

  if (v12)
  {
    if (qword_1002A7918 != -1)
      dispatch_once(&qword_1002A7918, &stru_100249380);
    v13 = qword_1002A7920;
    if (os_log_type_enabled((os_log_t)qword_1002A7920, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "fetchConsistencyProof not permitted when kt disabled", buf, 2u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorKTDisabled, -390, CFSTR("fetchConsistencyProof not permitted when kt disabled")));
    v10[2](v10, 0, v14);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001617A8;
    v15[3] = &unk_1002493A8;
    v18 = v10;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    -[KTLogClient configure:](self, "configure:", v15);

    v14 = v18;
  }

}

- (void)fetchRevisionLogInclusionProof:(id)a3 uuid:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD, void *);
  void *v11;
  unsigned int v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  void (**v18)(id, _QWORD, void *);
  uint8_t buf[16];

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD, void *))a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[TransparencyLogClient idsConfigBag](self, "idsConfigBag"));
  v12 = objc_msgSend(v11, "ktDisable");

  if (v12)
  {
    if (qword_1002A7918 != -1)
      dispatch_once(&qword_1002A7918, &stru_1002493C8);
    v13 = qword_1002A7920;
    if (os_log_type_enabled((os_log_t)qword_1002A7920, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "fetchRevisionLogInclusionProof not permitted when kt disabled", buf, 2u);
    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[TransparencyError errorWithDomain:code:description:](TransparencyError, "errorWithDomain:code:description:", kTransparencyErrorKTDisabled, -390, CFSTR("fetchRevisionLogInclusionProof not permitted when kt disabled")));
    v10[2](v10, 0, v14);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100161BE0;
    v15[3] = &unk_1002493A8;
    v18 = v10;
    v15[4] = self;
    v16 = v8;
    v17 = v9;
    -[KTLogClient configure:](self, "configure:", v15);

    v14 = v18;
  }

}

- (unint64_t)currentEnvironment
{
  return self->currentEnvironment;
}

- (void)setCurrentEnvironment:(unint64_t)a3
{
  self->currentEnvironment = a3;
}

- (KTSMTriggerInterface)triggerInterface
{
  return (KTSMTriggerInterface *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTriggerInterface:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (TransparencyConfigBag)configBag
{
  return (TransparencyConfigBag *)objc_getProperty(self, a2, 64, 1);
}

- (void)setConfigBag:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (double)overrideIDMSFetchTime
{
  return self->_overrideIDMSFetchTime;
}

- (void)setOverrideIDMSFetchTime:(double)a3
{
  self->_overrideIDMSFetchTime = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configBag, 0);
  objc_storeStrong((id *)&self->_triggerInterface, 0);
}

@end
