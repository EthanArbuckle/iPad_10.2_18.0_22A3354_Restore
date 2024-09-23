@implementation APPCControllerMetricCoordinator

- (void)metricReceived:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.received-metric");
  v6 = qword_10026D128;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100012978;
  block[3] = &unk_1002159F0;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

- (void)processMetric:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerMetricCoordinator legacyMetrics](self, "legacyMetrics"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100171FC0;
  v7[3] = &unk_100218CF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "processMetric:environmentProvider:", v6, v7);

}

- (APMetricsLegacyInterface)legacyMetrics
{
  return (APMetricsLegacyInterface *)objc_getProperty(self, a2, 8, 1);
}

- (void)_setRateLimit:(id)a3
{
  id v4;
  void *v5;
  float v6;
  float v7;
  float v8;
  float v9;
  float v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  id v17;

  v4 = a3;
  v17 = (id)objc_claimAutoreleasedReturnValue(+[APPromotedContentLegacyInterface sharedInstance](APPromotedContentLegacyInterface, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "properties"));

  v6 = sub_100022924((uint64_t)self, kAPMetricInternalMessageInFeedRateKey, v5);
  v7 = sub_100022924((uint64_t)self, kAPMetricInternalMessageInArticleRateKey, v5);
  v8 = sub_100022924((uint64_t)self, kAPMetricInternalMessageBetweenArticleRateKey, v5);
  v9 = sub_100022924((uint64_t)self, kAPMetricInternalMessageVideoInArticleRateKey, v5);
  v10 = sub_100022924((uint64_t)self, kAPMetricInternalMessageNativeInFeedRateKey, v5);
  LODWORD(v11) = sub_100022924((uint64_t)self, kAPMetricInternalMessageNativeInArticleRateKey, v5);
  *(float *)&v12 = v6;
  *(float *)&v13 = v7;
  *(float *)&v14 = v8;
  *(float *)&v15 = v9;
  *(float *)&v16 = v10;
  objc_msgSend(v17, "setRateLimitRequestsInFeed:inArticle:betweenArticle:videoInArticle:nativeInFeed:nativeInArticle:", v12, v13, v14, v15, v16, v11);

}

- (void)processInternalMetric:(id)a3
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  if (objc_msgSend(v4, "metric") == (id)77000)
    -[APPCControllerMetricCoordinator _setRateLimit:](self, "_setRateLimit:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerMetricCoordinator legacyMetrics](self, "legacyMetrics"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100171978;
  v7[3] = &unk_100218CF0;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "processMetric:environmentProvider:", v6, v7);

}

- (void)internalMetricReceived:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.received-internal-metric");
  v6 = qword_10026D128;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002D590;
  block[3] = &unk_1002159F0;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

+ (void)startWithLegacyInterface:(id)a3
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _QWORD *v7;
  id v8;
  id v9;
  void *v10;
  dispatch_queue_t v11;
  void *v12;
  APPCControllerMetricCoordinator *v13;
  void *v14;
  APPCControllerMetricCoordinator *v15;
  void *v16;
  dispatch_queue_t v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v3 = a3;
  v4 = APLogForCategory(29);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Starting APPCMetricCoordinator interface handler", buf, 2u);
  }

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001711F4;
  v19[3] = &unk_100218BC0;
  v6 = objc_alloc_init((Class)NSMutableArray);
  v20 = v6;
  v7 = objc_retainBlock(v19);
  ((void (*)(_QWORD *, uint64_t, Block_layout *))v7[2])(v7, 100, &stru_100218BE0);
  ((void (*)(_QWORD *, uint64_t, Block_layout *))v7[2])(v7, -1, &stru_100218C00);
  ((void (*)(_QWORD *, uint64_t, Block_layout *))v7[2])(v7, 101, &stru_100218C20);
  ((void (*)(_QWORD *, uint64_t, Block_layout *))v7[2])(v7, -104, &stru_100218C40);
  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))
  {
    v8 = objc_alloc((Class)NSUserDefaults);
    v9 = objc_msgSend(v8, "initWithSuiteName:", APDefaultsBundleID);
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", CFSTR("APMetricListener.enableConnection")));
    if (v10)
    {
      ((void (*)(_QWORD *, uint64_t, Block_layout *))v7[2])(v7, 100, &stru_100218C80);
      ((void (*)(_QWORD *, uint64_t, Block_layout *))v7[2])(v7, 1234, &stru_100218CA0);
      v11 = dispatch_queue_create("com.apple.ap.promotedcontent.metrics.clientConnection", 0);
      v12 = (void *)qword_10026D130;
      qword_10026D130 = (uint64_t)v11;

    }
  }
  v13 = [APPCControllerMetricCoordinator alloc];
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v6));
  v15 = -[APPCControllerMetricCoordinator initWithTokens:legacyInterface:](v13, "initWithTokens:legacyInterface:", v14, v3);

  v16 = (void *)qword_10026D120;
  qword_10026D120 = (uint64_t)v15;

  v17 = dispatch_queue_create("com.apple.ap.promotedcontent.legacyinterface.metrics", 0);
  v18 = (void *)qword_10026D128;
  qword_10026D128 = (uint64_t)v17;

}

+ (void)stop
{
  void *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)qword_10026D120, "registrationTokens", 0));
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v13;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v13 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v6);
        v8 = (void *)objc_claimAutoreleasedReturnValue(+[MetricsModule storage](MetricsModule, "storage"));
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "notificationRegistrar"));
        objc_msgSend(v9, "removeHandlerWithIdentifier:", objc_msgSend(v7, "integerValue"));

        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v4);
  }

  v10 = (void *)qword_10026D120;
  qword_10026D120 = 0;

  v11 = (void *)qword_10026D128;
  qword_10026D128 = 0;

}

- (APPCControllerMetricCoordinator)initWithTokens:(id)a3 legacyInterface:(id)a4
{
  id v7;
  id v8;
  APPCControllerMetricCoordinator *v9;
  APPCControllerMetricCoordinator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)APPCControllerMetricCoordinator;
  v9 = -[APPCControllerMetricCoordinator init](&v12, "init");
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_registrationTokens, a3);
    objc_storeStrong((id *)&v10->_legacyMetrics, a4);
  }

  return v10;
}

- (void)internalSignalReceived:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  id v8;
  _QWORD block[5];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.internal-signal");
  v6 = qword_10026D128;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100171598;
  block[3] = &unk_1002159F0;
  block[4] = self;
  v10 = v4;
  v11 = v5;
  v7 = v5;
  v8 = v4;
  dispatch_async(v6, block);

}

- (void)handleMetricForTesting:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  NSObject *v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  uint8_t buf[16];

  v4 = a3;
  v5 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.received-metric-for-client");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerMetricCoordinator host](self, "host"));

  if (!v6)
  {
    v7 = objc_alloc((Class)NSUserDefaults);
    v8 = objc_msgSend(v7, "initWithSuiteName:", APDefaultsBundleID);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", CFSTR("APMetricListener.enableConnection")));
    -[APPCControllerMetricCoordinator setHost:](self, "setHost:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerMetricCoordinator host](self, "host"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "componentsSeparatedByString:", CFSTR(":")));

  if ((unint64_t)objc_msgSend(v11, "count") > 1)
  {
    v14 = qword_10026D130;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100171754;
    v15[3] = &unk_100218CC8;
    v15[4] = self;
    v16 = v11;
    v17 = v4;
    v18 = v5;
    dispatch_async(v14, v15);

  }
  else
  {
    v12 = APLogForCategory(23);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Error extracting host and port. The format should be host:port", buf, 2u);
    }

  }
}

- (id)_provideEnvironmentForMetric:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  APContentDataInternal *v24;
  id v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  void *v29;
  APContentDataInternal *v30;
  APMetricEnvironment *v31;
  void *v32;
  void *v33;
  void *v35;
  uint64_t v36;
  NSObject *v37;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  id v45;
  int v46;
  id v47;
  __int16 v48;
  void *v49;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "internalProperties"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectForKeyedSubscript:", kAPMetricClientInfoKey));

  if (v6)
    v7 = v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contextIdentifier"));

  if (v8
    && (v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contextIdentifier")),
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContext findManagedContextByFingerprint:](APManagedContext, "findManagedContextByFingerprint:", v9)), v9, v10))
  {
    v11 = APLogForCategory(21);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contextIdentifier"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentIdentifier"));
      v46 = 138543618;
      v47 = v13;
      v48 = 2114;
      v49 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Successfully retrieved cached context data %{public}@ for content identifier %{public}@.", (uint8_t *)&v46, 0x16u);

    }
    v15 = 0;
  }
  else
  {
    v16 = APLogForCategory(21);
    v12 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contextIdentifier"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentIdentifier"));
      v46 = 138543618;
      v47 = v17;
      v48 = 2114;
      v49 = v18;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Unable to find context with identifier %{public}@ for content %{public}@. Metric may not contain all required fields.", (uint8_t *)&v46, 0x16u);

    }
    v10 = 0;
    v15 = 1;
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "idAccount"));
  if (!v19)
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentIdentifier"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContentData findById:](APManagedContentData, "findById:", v20));

  if (!v21)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "handle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContentData findById:](APManagedContentData, "findById:", v22));

    if (!v21)
    {
      if (!-[APPCControllerMetricCoordinator _processContentIdOverrideIfNecessaryForMetric:](self, "_processContentIdOverrideIfNecessaryForMetric:", v4)|| (v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentIdentifier")), v21 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContentData findById:](APManagedContentData, "findById:", v35)), v35, !v21))
      {
        v36 = APLogForCategory(21);
        v37 = objc_claimAutoreleasedReturnValue(v36);
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentIdentifier"));
          v46 = 138543362;
          v47 = v38;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "No managed content found for content identifier %{public}@. Assuming there was no response from server for ad request with that identifier.", (uint8_t *)&v46, 0xCu);

        }
        if (v15)
        {
          v39 = APLogForCategory(21);
          v30 = (APContentDataInternal *)objc_claimAutoreleasedReturnValue(v39);
          if (os_log_type_enabled(&v30->super, OS_LOG_TYPE_ERROR))
          {
            v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contextIdentifier"));
            v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentIdentifier"));
            v46 = 138543618;
            v47 = v40;
            v48 = 2114;
            v49 = v41;
            _os_log_impl((void *)&_mh_execute_header, &v30->super, OS_LOG_TYPE_ERROR, "Unable to find managed context %{public}@ for content %{public}@. Cannot continue, metric ignored.", (uint8_t *)&v46, 0x16u);

          }
          v31 = 0;
          goto LABEL_28;
        }
        v25 = objc_alloc_init((Class)APContentData);
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentIdentifier"));
        objc_msgSend(v25, "setIdentifier:", v42);

        v43 = objc_alloc((Class)NSUUID);
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contextIdentifier"));
        v45 = objc_msgSend(v43, "initWithUUIDString:", v44);
        objc_msgSend(v25, "setContextIdentifier:", v45);

        objc_msgSend(v25, "setServerUnfilledReason:", 1010);
        v24 = -[APContentDataInternal initWithContent:]([APContentDataInternal alloc], "initWithContent:", v25);
        v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "addContentData:", v24));
        goto LABEL_17;
      }
    }
  }
  v23 = APLogForCategory(21);
  v24 = (APContentDataInternal *)objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentIdentifier"));
    v46 = 138543362;
    v47 = v25;
    _os_log_impl((void *)&_mh_execute_header, &v24->super, OS_LOG_TYPE_DEFAULT, "Successfully retrieved cached content data for identifier %{public}@.", (uint8_t *)&v46, 0xCu);
LABEL_17:

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerMetricCoordinator _loadOverrideContextForMetric:](self, "_loadOverrideContextForMetric:", v4));
  if (v26)
  {
    v27 = APLogForCategory(21);
    v28 = objc_claimAutoreleasedReturnValue(v27);
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "contentIdentifier"));
      v46 = 138543362;
      v47 = v29;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Successfully loaded override context for metric %{public}@", (uint8_t *)&v46, 0xCu);

    }
  }
  v30 = -[APContentDataInternal initWithContentDataProvider:]([APContentDataInternal alloc], "initWithContentDataProvider:", v21);
  v31 = objc_alloc_init(APMetricEnvironment);
  -[APMetricEnvironment setInternalContent:](v31, "setInternalContent:", v30);
  if (v26)
  {
    -[APMetricEnvironment setContext:](v31, "setContext:", v26);
  }
  else
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "context"));
    -[APMetricEnvironment setContext:](v31, "setContext:", v32);

  }
  -[APMetricEnvironment setClientInfo:](v31, "setClientInfo:", v6);
  -[APMetricEnvironment setIdAccount:](v31, "setIdAccount:", v19);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricEnvironment idAccount](v31, "idAccount"));

  if (!v33)
    CreateDiagnosticReport(CFSTR("Metric environment account id is nil"), 0, CFSTR("ASE"));

LABEL_28:
  return v31;
}

- (BOOL)_processContentIdOverrideIfNecessaryForMetric:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  NSObject *v9;
  APSponsorshipAdTransformer *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  const char *v15;
  void *v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  int v23;
  void *v24;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "internalProperties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kAPOriginalContentIdentifier));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "internalProperties"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectForKeyedSubscript:", kAPServerUnfilledReason));

  if (objc_msgSend(v5, "length"))
  {
    v8 = APLogForCategory(21);
    v9 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v23 = 138543362;
      v24 = v5;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Processing a special case for originalContentId: %{public}@.", (uint8_t *)&v23, 0xCu);
    }

    v10 = objc_alloc_init(APSponsorshipAdTransformer);
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentIdentifier"));
    LOBYTE(v12) = -[APSponsorshipAdTransformer copyContentDataId:toNewContentDataId:](v10, "copyContentDataId:toNewContentDataId:", v5, v11);

    if ((v12 & 1) != 0)
      goto LABEL_9;
    v13 = APLogForCategory(21);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
LABEL_8:

LABEL_9:
      goto LABEL_10;
    }
    LOWORD(v23) = 0;
    v15 = "Content override was requested but the copy operation has failed.";
LABEL_7:
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, v15, (uint8_t *)&v23, 2u);
    goto LABEL_8;
  }
  if (!v7)
  {
    LOBYTE(v12) = 0;
    goto LABEL_10;
  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contextIdentifier"));
  v12 = objc_msgSend(v17, "length");

  if (v12)
  {
    v18 = APLogForCategory(21);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      v23 = 138543362;
      v24 = v7;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Processing a special case for serverUnfilledReason: %{public}@", (uint8_t *)&v23, 0xCu);
    }

    v10 = objc_alloc_init(APSponsorshipAdTransformer);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contextIdentifier"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contentIdentifier"));
    LOBYTE(v12) = -[APSponsorshipAdTransformer createContentDataForContextId:contentId:withServerUnfilledReason:](v10, "createContentDataForContextId:contentId:withServerUnfilledReason:", v20, v21, (int)objc_msgSend(v7, "intValue"));

    if ((v12 & 1) != 0)
      goto LABEL_9;
    v22 = APLogForCategory(21);
    v14 = objc_claimAutoreleasedReturnValue(v22);
    if (!os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      goto LABEL_8;
    LOWORD(v23) = 0;
    v15 = "Server unfilled reason was requested but the operation has failed.";
    goto LABEL_7;
  }
LABEL_10:

  return (char)v12;
}

- (id)_loadOverrideContextForMetric:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  id v16;
  int v18;
  void *v19;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "internalProperties"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "objectForKeyedSubscript:", kAPSupplementalContext));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contextIdentifier"));
    v7 = objc_msgSend(v6, "length");

    if (v7)
    {
      v8 = objc_alloc((Class)NSUUID);
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contextIdentifier"));
      v10 = objc_msgSend(v8, "initWithUUIDString:", v9);

      if (v10)
      {
        v11 = objc_alloc((Class)APContext);
LABEL_10:
        v12 = objc_msgSend(v11, "initWithIdentifier:maxSize:requestedAdIdentifier:currentContent:adjacentContent:supplementalContext:", v10, 0, 0, 0, v5, 0.0, 0.0);

        goto LABEL_11;
      }
      v13 = APLogForCategory(21);
      v14 = objc_claimAutoreleasedReturnValue(v13);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "contextIdentifier"));
        v18 = 138543362;
        v19 = v15;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Metric context ID has invalid format. %{public}@", (uint8_t *)&v18, 0xCu);

      }
    }
    v16 = objc_alloc((Class)APContext);
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
    v11 = v16;
    goto LABEL_10;
  }
  v12 = 0;
LABEL_11:

  return v12;
}

- (void)setLegacyMetrics:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)registrationTokens
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setRegistrationTokens:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (APMetricClientConnection)clientConnection
{
  return (APMetricClientConnection *)objc_getProperty(self, a2, 24, 1);
}

- (void)setClientConnection:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSString)host
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setHost:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_host, 0);
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_registrationTokens, 0);
  objc_storeStrong((id *)&self->_legacyMetrics, 0);
}

@end
