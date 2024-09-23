@implementation APMetricsLegacyInterface

- (void)processMetric:(id)a3 environmentProvider:(id)a4
{
  id v6;
  uint64_t (**v7)(_QWORD);
  unsigned int v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  id v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  unsigned int v21;
  void *v22;
  unsigned __int8 v23;
  uint64_t v24;
  id v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  NSObject *v33;
  uint64_t v34;
  uint64_t v35;
  NSObject *v36;
  uint64_t v37;
  NSObject *v38;
  uint64_t v39;
  id v40;
  NSObject *v41;
  const char *v42;
  NSObject *v43;
  uint32_t v44;
  uint64_t v45;
  NSObject *v46;
  uint64_t v47;
  NSObject *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  NSObject *v52;
  uint64_t v53;
  NSObject *v54;
  uint64_t v55;
  NSObject *v56;
  uint64_t v57;
  NSObject *v58;
  uint64_t v59;
  NSObject *v60;
  id v61;
  NSObject *v62;
  NSObject *v63;
  uint64_t v64;
  NSObject *v65;
  uint64_t v66;
  NSObject *v67;
  uint64_t v68;
  id v69;
  uint64_t v70;
  NSObject *v71;
  uint64_t v72;
  NSObject *v73;
  uint64_t v74;
  NSObject *v75;
  uint64_t v76;
  NSObject *v77;
  int v78;
  id v79;
  __int16 v80;
  NSObject *v81;
  __int16 v82;
  NSObject *v83;

  v6 = a3;
  v7 = (uint64_t (**)(_QWORD))a4;
  v8 = -[APMetricsLegacyInterface shouldIgnoreMetric:](self, "shouldIgnoreMetric:", v6);
  v9 = APLogForCategory(21);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_INFO);
  if (v8)
  {
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
      v78 = 138412290;
      v79 = v12;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Ignoring metric from client %@", (uint8_t *)&v78, 0xCu);

    }
    goto LABEL_72;
  }
  if (v11)
  {
    v13 = objc_msgSend(v6, "metric");
    v14 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "handle"));
    v15 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentIdentifier"));
    v78 = 134218498;
    v79 = v13;
    v80 = 2114;
    v81 = v14;
    v82 = 2114;
    v83 = v15;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_INFO, "Received metric %ld with ID %{public}@ for adOpID %{public}@ from PCCD", (uint8_t *)&v78, 0x20u);

  }
  v16 = metricPropertyValue(v6, (void *)0x13);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
  {
    v19 = metricPropertyValue(v6, (void *)0x13);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    v21 = objc_msgSend(v20, "BOOLValue");

    if (!v21)
      goto LABEL_12;
  }
  else
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentIdentifier"));
    v23 = +[APContentDataInternal isPlaceholderIdentifier:](APContentDataInternal, "isPlaceholderIdentifier:", v22);

    if ((v23 & 1) == 0)
      goto LABEL_12;
  }
  if (objc_msgSend(v6, "metric") != (id)1405 && objc_msgSend(v6, "metric") != (id)1202)
  {
    v39 = APLogForCategory(21);
    v10 = objc_claimAutoreleasedReturnValue(v39);
    if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
LABEL_72:

      goto LABEL_73;
    }
    v40 = objc_msgSend(v6, "metric");
    v36 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentIdentifier"));
    v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contextIdentifier"));
    v78 = 134218498;
    v79 = v40;
    v80 = 2114;
    v81 = v36;
    v82 = 2114;
    v83 = v41;
    v42 = "A placeholder APContentData is reporting metric %ld and will not be processed. content: %{public}@ context: %{public}@.";
    v43 = v10;
    v44 = 32;
    goto LABEL_70;
  }
LABEL_12:
  if (objc_msgSend(v6, "purpose") != (id)100)
  {
    if (objc_msgSend(v6, "purpose") == (id)101)
    {
      v25 = objc_msgSend(v6, "metric");
      if (v25 == (id)2503)
      {
LABEL_42:
        v47 = v7[2](v7);
        v48 = objc_claimAutoreleasedReturnValue(v47);
        if (v48)
        {
          v10 = v48;
          v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v48, "internalContent"));
          v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
          v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject clientInfo](v10, "clientInfo"));
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
          v50 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleVideoMetric:internalContent:context:clientInfo:idAccount:](self, "handleVideoMetric:internalContent:context:clientInfo:idAccount:", v6, v28, v29, v30, v49));
LABEL_44:
          v36 = v50;

LABEL_64:
LABEL_65:

LABEL_66:
          if (v36)
          {
            -[APMetricsLegacyInterface sendLegacyMetric:](self, "sendLegacyMetric:", v36);
            goto LABEL_71;
          }
LABEL_68:
          v68 = APLogForCategory(21);
          v36 = objc_claimAutoreleasedReturnValue(v68);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            v69 = objc_msgSend(v6, "metric");
            v41 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentIdentifier"));
            v78 = 134218242;
            v79 = v69;
            v80 = 2114;
            v81 = v41;
            v42 = "Metric %ld for content %{public}@ does not send a metric request.";
            v43 = v36;
            v44 = 22;
LABEL_70:
            _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, v42, (uint8_t *)&v78, v44);

          }
LABEL_71:

          goto LABEL_72;
        }
        goto LABEL_73;
      }
      if (v25 != (id)2501)
      {
LABEL_58:
        v10 = 0;
        goto LABEL_68;
      }
      v26 = v7[2](v7);
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (!v27)
        goto LABEL_73;
      v10 = v27;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v27, "internalContent"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
      v31 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleLoadFailed:internalContent:context:idAccount:](self, "handleLoadFailed:internalContent:context:idAccount:", v6, v28, v29, v30));
    }
    else
    {
      if (objc_msgSend(v6, "purpose") == (id)-1)
      {
        switch((unint64_t)objc_msgSend(v6, "metric"))
        {
          case 0x12CC9uLL:
            v45 = v7[2](v7);
            v46 = objc_claimAutoreleasedReturnValue(v45);
            if (!v46)
              goto LABEL_73;
            v10 = v46;
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v46, "internalContent"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
            v31 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleArticleLoadFailure:internalContent:context:idAccount:](self, "handleArticleLoadFailure:internalContent:context:idAccount:", v6, v28, v29, v30));
            goto LABEL_63;
          case 0x12CCAuLL:
            v36 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleSubscription:](self, "handleSubscription:", v6));
            v10 = 0;
            goto LABEL_66;
          case 0x12CCBuLL:
            v53 = v7[2](v7);
            v54 = objc_claimAutoreleasedReturnValue(v53);
            if (!v54)
              goto LABEL_73;
            v10 = v54;
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v54, "internalContent"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject clientInfo](v10, "clientInfo"));
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
            v50 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleMediaComplete:internalContent:context:clientInfo:idAccount:](self, "handleMediaComplete:internalContent:context:clientInfo:idAccount:", v6, v28, v29, v30, v49));
            goto LABEL_44;
          case 0x12CCCuLL:
            v57 = v7[2](v7);
            v58 = objc_claimAutoreleasedReturnValue(v57);
            if (!v58)
              goto LABEL_73;
            v10 = v58;
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v58, "internalContent"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
            v31 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleInterfaceExceededContainer:internalContent:context:idAccount:](self, "handleInterfaceExceededContainer:internalContent:context:idAccount:", v6, v28, v29, v30));
            goto LABEL_63;
          case 0x12CCDuLL:
            v55 = v7[2](v7);
            v56 = objc_claimAutoreleasedReturnValue(v55);
            if (!v56)
              goto LABEL_73;
            v10 = v56;
            v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v56, "internalContent"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
            v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
            v31 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleInterstitialOnScreen:internalContent:context:idAccount:](self, "handleInterstitialOnScreen:internalContent:context:idAccount:", v6, v28, v29, v30));
            goto LABEL_63;
          default:
            goto LABEL_58;
        }
      }
      if (objc_msgSend(v6, "purpose") != (id)-105 || objc_msgSend(v6, "metric") != (id)77500)
        goto LABEL_58;
      v32 = v7[2](v7);
      v33 = objc_claimAutoreleasedReturnValue(v32);
      if (!v33)
        goto LABEL_73;
      v10 = v33;
      v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v33, "internalContent"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
      v31 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleValidationFailed:internalContent:context:idAccount:](self, "handleValidationFailed:internalContent:context:idAccount:", v6, v28, v29, v30));
    }
LABEL_63:
    v36 = v31;
    goto LABEL_64;
  }
  v24 = (uint64_t)objc_msgSend(v6, "metric");
  v10 = 0;
  if (v24 > 1201)
  {
    switch(v24)
    {
      case 1400:
      case 1402:
      case 1403:
      case 1410:
      case 1411:
        goto LABEL_68;
      case 1401:
        v34 = v7[2](v7);
        v35 = objc_claimAutoreleasedReturnValue(v34);
        if (!v35)
          goto LABEL_73;
        v10 = v35;
        v36 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleInterfaceReplaced:metricEnvironment:](self, "handleInterfaceReplaced:metricEnvironment:", v6, v35));
        goto LABEL_66;
      case 1404:
        v64 = v7[2](v7);
        v65 = objc_claimAutoreleasedReturnValue(v64);
        if (!v65)
          goto LABEL_73;
        v10 = v65;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v65, "internalContent"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject clientInfo](v10, "clientInfo"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
        v50 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleInterfaceReady:internalContent:context:clientInfo:idAccount:](self, "handleInterfaceReady:internalContent:context:clientInfo:idAccount:", v6, v28, v29, v30, v49));
        goto LABEL_44;
      case 1405:
        v66 = v7[2](v7);
        v67 = objc_claimAutoreleasedReturnValue(v66);
        if (!v67)
          goto LABEL_73;
        v10 = v67;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v67, "internalContent"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
        v31 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleInterfaceOnScreen:internalContent:context:idAccount:](self, "handleInterfaceOnScreen:internalContent:context:idAccount:", v6, v28, v29, v30));
        goto LABEL_63;
      case 1406:
        v70 = v7[2](v7);
        v71 = objc_claimAutoreleasedReturnValue(v70);
        if (!v71)
          goto LABEL_73;
        v10 = v71;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v71, "internalContent"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject clientInfo](v10, "clientInfo"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
        v50 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleInterfaceVisible:internalContent:context:clientInfo:idAccount:](self, "handleInterfaceVisible:internalContent:context:clientInfo:idAccount:", v6, v28, v29, v30, v49));
        goto LABEL_44;
      case 1407:
        v72 = v7[2](v7);
        v73 = objc_claimAutoreleasedReturnValue(v72);
        if (!v73)
          goto LABEL_73;
        v10 = v73;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v73, "internalContent"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject clientInfo](v10, "clientInfo"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
        v50 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleInterfaceOffScreen:internalContent:context:clientInfo:idAccount:](self, "handleInterfaceOffScreen:internalContent:context:clientInfo:idAccount:", v6, v28, v29, v30, v49));
        goto LABEL_44;
      case 1408:
        v74 = v7[2](v7);
        v75 = objc_claimAutoreleasedReturnValue(v74);
        if (!v75)
          goto LABEL_73;
        v10 = v75;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v75, "internalContent"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject clientInfo](v10, "clientInfo"));
        v49 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
        v50 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleInterfaceInteracted:internalContent:context:clientInfo:idAccount:](self, "handleInterfaceInteracted:internalContent:context:clientInfo:idAccount:", v6, v28, v29, v30, v49));
        goto LABEL_44;
      case 1409:
        v76 = v7[2](v7);
        v77 = objc_claimAutoreleasedReturnValue(v76);
        if (!v77)
          goto LABEL_73;
        v10 = v77;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v77, "internalContent"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
        v36 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleQuickReturn:internalContent:context:](self, "handleQuickReturn:internalContent:context:", v6, v28, v29));
        goto LABEL_65;
      default:
        if ((unint64_t)(v24 - 1600) <= 9 && v24 != 1601)
          goto LABEL_42;
        if (v24 != 1202)
          goto LABEL_55;
        goto LABEL_68;
    }
  }
  if (v24 <= 1003)
  {
    if ((unint64_t)(v24 - 1000) < 4)
      goto LABEL_68;
LABEL_55:
    v59 = APLogForCategory(21);
    v60 = objc_claimAutoreleasedReturnValue(v59);
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      v61 = objc_msgSend(v6, "metric");
      v62 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentIdentifier"));
      v63 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "bundleIdentifier"));
      v78 = 134218498;
      v79 = v61;
      v80 = 2114;
      v81 = v62;
      v82 = 2114;
      v83 = v63;
      _os_log_impl((void *)&_mh_execute_header, v60, OS_LOG_TYPE_INFO, "Ignoring metric %ld for Content %{public}@ received from %{public}@", (uint8_t *)&v78, 0x20u);

    }
    goto LABEL_58;
  }
  switch(v24)
  {
    case 1004:
      v51 = v7[2](v7);
      v52 = objc_claimAutoreleasedReturnValue(v51);
      if (v52)
      {
        v10 = v52;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v52, "internalContent"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
        v31 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleDaemonRequestFailed:internalContent:context:idAccount:](self, "handleDaemonRequestFailed:internalContent:context:idAccount:", v6, v28, v29, v30));
        goto LABEL_63;
      }
      break;
    case 1200:
      goto LABEL_68;
    case 1201:
      v37 = v7[2](v7);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (v38)
      {
        v10 = v38;
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject internalContent](v38, "internalContent"));
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject context](v10, "context"));
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject idAccount](v10, "idAccount"));
        v31 = objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handleClientDiscarded:internalContent:context:idAccount:](self, "handleClientDiscarded:internalContent:context:idAccount:", v6, v28, v29, v30));
        goto LABEL_63;
      }
      break;
    default:
      goto LABEL_55;
  }
LABEL_73:

}

- (NSSet)ignoredClientIdentifiers
{
  return (NSSet *)objc_getProperty(self, a2, 56, 1);
}

- (NSSet)ignoredClientIdentifierSuffixes
{
  return (NSSet *)objc_getProperty(self, a2, 48, 1);
}

- (APMetricsLegacyInterface)init
{
  APMetricsLegacyInterface *v2;
  void *v3;
  unsigned __int8 v4;
  APLegacyMetricRetryManager *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)APMetricsLegacyInterface;
  v2 = -[APMetricsLegacyInterface init](&v7, "init");
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
    v4 = objc_msgSend(v3, "isRunningTests");

    if ((v4 & 1) == 0)
    {
      v5 = objc_alloc_init(APLegacyMetricRetryManager);
      v2 = -[APMetricsLegacyInterface initWithRetryManager:](v2, "initWithRetryManager:", v5);

    }
  }
  return v2;
}

- (APMetricsLegacyInterface)initWithRetryManager:(id)a3
{
  id v4;
  void *v5;
  APMetricsLegacyInterface *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[APDatabaseManager mainDatabase](APDatabaseManager, "mainDatabase"));
  v6 = -[APMetricsLegacyInterface initWithRetryManager:databaseManager:](self, "initWithRetryManager:databaseManager:", v4, v5);

  return v6;
}

- (APMetricsLegacyInterface)initWithRetryManager:(id)a3 databaseManager:(id)a4
{
  id v7;
  id v8;
  APMetricsLegacyInterface *v9;
  uint64_t v10;
  NSMutableDictionary *pendingDelayedRequests;
  APUnfairRecursiveLock *v12;
  APUnfairRecursiveLock *delayedRequestLock;
  APUnfairRecursiveLock *v14;
  APUnfairRecursiveLock *confirmedClickLock;
  uint64_t v16;
  NSSet *bundleIdentifierAllowList;
  objc_super v19;

  v7 = a3;
  v8 = a4;
  v19.receiver = self;
  v19.super_class = (Class)APMetricsLegacyInterface;
  v9 = -[APMetricsLegacyInterface init](&v19, "init");
  if (v9)
  {
    v10 = objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    pendingDelayedRequests = v9->_pendingDelayedRequests;
    v9->_pendingDelayedRequests = (NSMutableDictionary *)v10;

    v12 = (APUnfairRecursiveLock *)objc_alloc_init((Class)APUnfairRecursiveLock);
    delayedRequestLock = v9->_delayedRequestLock;
    v9->_delayedRequestLock = v12;

    v14 = (APUnfairRecursiveLock *)objc_alloc_init((Class)APUnfairRecursiveLock);
    confirmedClickLock = v9->_confirmedClickLock;
    v9->_confirmedClickLock = v14;

    v16 = objc_claimAutoreleasedReturnValue(+[NSSet setWithObjects:](NSSet, "setWithObjects:", CFSTR("com.apple.news"), CFSTR("com.apple.stocks"), CFSTR("com.apple.ap.promotedcontentd"), 0));
    bundleIdentifierAllowList = v9->_bundleIdentifierAllowList;
    v9->_bundleIdentifierAllowList = (NSSet *)v16;

    objc_storeStrong((id *)&v9->_metricRetryManager, a3);
    -[APLegacyMetricRetryManagerProtocol start](v9->_metricRetryManager, "start");
    objc_storeStrong((id *)&v9->_databaseManager, a4);
  }

  return v9;
}

- (id)timeSpentProcessor
{
  APTimeSpentLegacyInterface *v3;
  void *v4;
  void *v5;
  APTimeSpentLegacyInterface *v6;

  v3 = [APTimeSpentLegacyInterface alloc];
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface databaseManager](self, "databaseManager"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface metricRetryManager](self, "metricRetryManager"));
  v6 = -[APTimeSpentLegacyInterface initWithDbManager:retryManager:](v3, "initWithDbManager:retryManager:", v4, v5);

  return v6;
}

- (void)sendLegacyMetric:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id v13;
  id location;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface metricRetryManager](self, "metricRetryManager"));
  objc_msgSend(v4, "setRetryManager:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "internalContent"));
  objc_msgSend(v6, "eventSent");

  objc_initWeak(&location, self);
  v7 = (void *)os_transaction_create("com.apple.ap.promotedcontentd.send-legacy-metric");
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000E4E9C;
  v10[3] = &unk_100214C38;
  objc_copyWeak(&v13, &location);
  v8 = v4;
  v11 = v8;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "makeRequest:", v10);

  objc_destroyWeak(&v13);
  objc_destroyWeak(&location);

}

- (void)sendLegacyMetricWithDelay:(double)a3 legacyMetric:(id)a4 requestSentHandler:(id)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  _QWORD v20[5];
  id v21;
  _BYTE *v22;
  _QWORD v23[5];
  id v24;
  id v25;
  _BYTE *v26;
  _BYTE buf[24];
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;

  v8 = a4;
  v9 = a5;
  v10 = APLogForCategory(21);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "metric"));
    *(_DWORD *)buf = 134218242;
    *(double *)&buf[4] = a3;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_INFO, "Delaying send of metric by %.2f seconds for metric:\n%{public}@", buf, 0x16u);

  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface delayedRequestLock](self, "delayedRequestLock"));
  objc_msgSend(v13, "lock");

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface pendingDelayedRequests](self, "pendingDelayedRequests"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "requestIdentifier"));
  objc_msgSend(v14, "setObject:forKey:", v8, v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface delayedRequestLock](self, "delayedRequestLock"));
  objc_msgSend(v16, "unlock");

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface metricRetryManager](self, "metricRetryManager"));
  objc_msgSend(v8, "setRetryManager:", v17);

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v28 = sub_10002D3A0;
  v29 = sub_10002D360;
  v30 = 0;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000E518C;
  v23[3] = &unk_100214C60;
  v23[4] = self;
  v24 = v8;
  v26 = buf;
  v18 = v9;
  v25 = v18;
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000E521C;
  v20[3] = &unk_100214C88;
  v20[4] = self;
  v19 = v24;
  v21 = v19;
  v22 = buf;
  objc_msgSend(v19, "makeDelayedRequest:requestSentHandler:responseCallback:", v23, v20, a3);

  _Block_object_dispose(buf, 8);
}

- (void)removeDelayedRequest:(id)a3 cancel:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v4 = a4;
  v11 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface delayedRequestLock](self, "delayedRequestLock"));
  objc_msgSend(v6, "lock");

  if (v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface pendingDelayedRequests](self, "pendingDelayedRequests"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v11));

    objc_msgSend(v8, "cancelDelayedRequest");
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface pendingDelayedRequests](self, "pendingDelayedRequests"));
  objc_msgSend(v9, "removeObjectForKey:", v11);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface delayedRequestLock](self, "delayedRequestLock"));
  objc_msgSend(v10, "unlock");

}

- (id)pendingRequestsForContent:(id)a3 filterPredicate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t *v20;
  uint64_t v21;
  uint64_t (*v22)(uint64_t, uint64_t);
  void (*v23)(uint64_t);
  id v24;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface delayedRequestLock](self, "delayedRequestLock"));
  objc_msgSend(v8, "lock");

  v19 = 0;
  v20 = &v19;
  v21 = 0x3032000000;
  v22 = sub_10002D3A0;
  v23 = sub_10002D360;
  v24 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface pendingDelayedRequests](self, "pendingDelayedRequests"));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000E54CC;
  v15[3] = &unk_100214CB0;
  v10 = v6;
  v16 = v10;
  v18 = &v19;
  v11 = v7;
  v17 = v11;
  objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v15);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface delayedRequestLock](self, "delayedRequestLock"));
  objc_msgSend(v12, "unlock");

  v13 = objc_msgSend((id)v20[5], "copy");
  _Block_object_dispose(&v19, 8);

  return v13;
}

- (BOOL)shouldIgnoreMetric:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface bundleIdentifierAllowList](self, "bundleIdentifierAllowList"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "bundleIdentifier"));

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6) ^ 1;
  return (char)v4;
}

- (id)handleClientDiscarded:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  signed int v16;
  int v17;
  int v18;
  int v19;
  int v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  int v28;
  void *v29;
  int v30;
  int v31;
  int v32;
  id v33;
  id v34;
  id v35;
  void *v36;
  uint64_t v37;
  NSObject *v38;
  id v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  APAdSpaceEventRequester *v44;
  id v46;
  void *v47;
  APMetricsLegacyInterface *v48;
  uint64_t v49;
  void *v50;
  uint8_t buf[4];
  void *v52;
  __int16 v53;
  void *v54;
  __int16 v55;
  void *v56;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "properties"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("code")));

  if (v15)
  {
    v16 = objc_msgSend(v15, "intValue");
    v50 = (void *)v16;
    v48 = self;
    switch(v16)
    {
      case 2601:
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v49 = 3007;
        v20 = 1;
        break;
      case 2602:
        v20 = 0;
        v18 = 0;
        v19 = 0;
        v49 = 3008;
        v17 = 1;
        break;
      case 2603:
        v20 = 0;
        v17 = 0;
        v19 = 0;
        v49 = 3009;
        v18 = 1;
        break;
      case 2604:
        v20 = 0;
        v17 = 0;
        v18 = 0;
        v49 = 3010;
        v19 = 1;
        break;
      default:
        v20 = 0;
        v17 = 0;
        v18 = 0;
        v19 = 0;
        v49 = 0xFFFFFFFFLL;
        break;
    }
    v25 = APLogForCategory(21);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
      v46 = v11;
      v47 = v15;
      v28 = v20;
      v29 = v27;
      v30 = v19;
      v31 = v18;
      v32 = v17;
      v33 = v13;
      v34 = v10;
      v35 = v12;
      v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
      *(_DWORD *)buf = 138543618;
      v52 = v36;
      v53 = 2048;
      v54 = v50;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "Content %{public}@ is being discarded with reason code %ld.", buf, 0x16u);

      v12 = v35;
      v10 = v34;
      v13 = v33;
      v17 = v32;
      v18 = v31;
      v19 = v30;

      v20 = v28;
      v11 = v46;
      v15 = v47;
    }

    if ((v20 | v17 | v18 | v19) == 1)
    {
      v37 = APLogForCategory(21);
      v38 = objc_claimAutoreleasedReturnValue(v37);
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        v39 = v13;
        v40 = v12;
        v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "identifier"));
        if ((v49 - 3000) >= 0xB)
          v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("(unknown: %i)"), v49));
        else
          v43 = *(&off_100214E08 + (int)v49 - 3000);
        *(_DWORD *)buf = 138543874;
        v52 = v42;
        v53 = 2114;
        v54 = v43;
        v55 = 2048;
        v56 = v50;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_INFO, "Content %{public}@ is allowed to send %{public}@ for discard code %ld.", buf, 0x20u);

        v12 = v40;
        v13 = v39;
      }

      v44 = -[APAdSpaceEventRequester initWithMetric:internalContent:andContext:idAccount:]([APAdSpaceEventRequester alloc], "initWithMetric:internalContent:andContext:idAccount:", v10, v11, v12, v13);
      -[APAdSpaceEventRequester setStatusCode:](v44, "setStatusCode:", v49);
      -[APMetricsLegacyInterface sendLegacyMetric:](v48, "sendLegacyMetric:", v44);

    }
    objc_msgSend(v11, "discarded");
  }
  else
  {
    v21 = APLogForCategory(21);
    v22 = objc_claimAutoreleasedReturnValue(v21);
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
      *(_DWORD *)buf = 138543362;
      v52 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Content %{public}@ is reporting clientDiscarded with no discard code. No ASE sent.", buf, 0xCu);

    }
  }

  return 0;
}

- (id)handleInterfaceReady:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v12;
  void *v13;

  v12 = a4;
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface _unconfirmedImpressionRequest:internalContent:context:clientInfo:idAccount:](self, "_unconfirmedImpressionRequest:internalContent:context:clientInfo:idAccount:", a3, v12, a5, a6, a7));
  objc_msgSend(v12, "interfaceReady");

  return v13;
}

- (id)handleInterfaceInteracted:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  __CFString *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  uint64_t v18;
  double v19;
  double v20;
  id v21;
  void *v22;
  double v23;
  id v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  double v29;
  id v30;
  void *v31;
  uint64_t v32;
  id v33;
  void *v34;
  uint64_t v35;
  id v36;
  void *v37;
  uint64_t v38;
  id v39;
  __CFString *v40;
  id v41;
  void *v42;
  uint64_t v43;
  id v44;
  void *v45;
  unsigned int v46;
  BOOL v47;
  id v48;
  NSObject *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  __CFString *v54;
  uint64_t v55;
  NSObject *v56;
  void *v57;
  __CFString *v58;
  void *v59;
  double v60;
  double v61;
  double v62;
  double v63;
  uint64_t v64;
  int v65;
  id v66;
  uint64_t v67;
  NSObject *v68;
  void *v69;
  __CFString *v70;
  void *v71;
  unsigned int v72;
  uint64_t v73;
  NSObject *v74;
  void *v75;
  uint64_t v76;
  NSObject *v77;
  void *v78;
  void *v79;
  unsigned int v80;
  void *v81;
  unsigned int v82;
  uint64_t v83;
  NSObject *v84;
  const __CFString *v85;
  const __CFString *v86;
  const __CFString *v87;
  void *v88;
  uint64_t v89;
  NSObject *p_super;
  void *v91;
  __CFString *v92;
  void *v93;
  void *v94;
  void **p_vtable;
  APLogSysEventRequester *v96;
  void *v97;
  void *v98;
  double v99;
  double v100;
  APLogSysEventRequester *v101;
  void *v103;
  __CFString *v104;
  void *v105;
  id v106;
  id v107;
  _QWORD v109[5];
  APLogSysEventRequester *v110;
  uint8_t buf[4];
  const __CFString *v112;
  __int16 v113;
  const __CFString *v114;
  __int16 v115;
  const __CFString *v116;

  v11 = (__CFString *)a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = metricPropertyValue(v11, (void *)0x2F);
  v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
  v18 = objc_opt_class(NSNumber);
  v19 = -1.0;
  v20 = -1.0;
  if ((objc_opt_isKindOfClass(v17, v18) & 1) != 0)
  {
    v21 = metricPropertyValue(v11, (void *)0x2F);
    v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
    objc_msgSend(v22, "doubleValue");
    v20 = v23;

  }
  v24 = metricPropertyValue(v11, (void *)0x30);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  v26 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v25, v26) & 1) != 0)
  {
    v27 = metricPropertyValue(v11, (void *)0x30);
    v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
    objc_msgSend(v28, "doubleValue");
    v19 = v29;

  }
  v30 = metricPropertyValue(v11, (void *)9);
  v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
  v32 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v31, v32) & 1) != 0)
  {
    v33 = metricPropertyValue(v11, (void *)9);
    v34 = (void *)objc_claimAutoreleasedReturnValue(v33);
    v35 = (uint64_t)objc_msgSend(v34, "intValue");

  }
  else
  {
    v35 = 0xFFFFFFFFLL;
  }

  v36 = metricPropertyValue(v11, (void *)0x1A);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0)
  {
    v39 = metricPropertyValue(v11, (void *)0x1A);
    v40 = (__CFString *)objc_claimAutoreleasedReturnValue(v39);
  }
  else
  {
    v40 = 0;
  }

  v41 = metricPropertyValue(v11, (void *)0x29);
  v42 = (void *)objc_claimAutoreleasedReturnValue(v41);
  v43 = objc_opt_class(NSNumber);
  v107 = v13;
  if ((objc_opt_isKindOfClass(v42, v43) & 1) != 0)
  {
    v44 = metricPropertyValue(v11, (void *)0x29);
    v45 = (void *)objc_claimAutoreleasedReturnValue(v44);
    v46 = objc_msgSend(v45, "intValue");

    v47 = v46 == 7302;
    v13 = v107;
    if (v47)
    {
      v48 = (id)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface handlePrivacyAdMetric:internalContent:context:clientInfo:idAccount:](self, "handlePrivacyAdMetric:internalContent:context:clientInfo:idAccount:", v11, v12, v107, v14, v15));
      goto LABEL_61;
    }
  }
  else
  {

  }
  v106 = v14;
  v104 = v40;
  if (!v40)
  {
    v52 = APLogForCategory(21);
    v49 = objc_claimAutoreleasedReturnValue(v52);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_ERROR))
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "content"));
      v54 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "identifier"));
      *(_DWORD *)buf = 138543618;
      v112 = v54;
      v113 = 2114;
      v114 = v11;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_ERROR, "RepresentationIdentifier missing for content %{public}@ in metric %{public}@", buf, 0x16u);

    }
    goto LABEL_28;
  }
  v49 = objc_msgSend(objc_alloc((Class)NSUUID), "initWithUUIDString:", v40);
  if (v49)
  {
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "content"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "representationWithIdentifier:", v49));

    if (v51)
      goto LABEL_26;
  }
  else
  {
    v55 = APLogForCategory(21);
    v56 = objc_claimAutoreleasedReturnValue(v55);
    if (os_log_type_enabled(v56, OS_LOG_TYPE_ERROR))
    {
      v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "content"));
      v58 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "identifier"));
      *(_DWORD *)buf = 138543618;
      v112 = v40;
      v113 = 2114;
      v114 = v58;
      _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_ERROR, "Representation %{public}@ for content %{public}@ is not a valid UUID.", buf, 0x16u);

      v13 = v107;
    }

  }
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "content"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "getRepresentation"));

  if (!v51)
  {
LABEL_28:

    v61 = -1.0;
    v63 = -1.0;
    goto LABEL_29;
  }
LABEL_26:
  objc_msgSend(v51, "size");
  v61 = v20 * v60;
  objc_msgSend(v51, "size");
  v63 = v19 * v62;
  v64 = objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "tapAction"));

  if (!v64)
  {
LABEL_29:
    v66 = v106;
    v67 = APLogForCategory(21);
    v68 = objc_claimAutoreleasedReturnValue(v67);
    if (os_log_type_enabled(v68, OS_LOG_TYPE_ERROR))
    {
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "content"));
      v70 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "identifier"));
      *(_DWORD *)buf = 138543618;
      v112 = v40;
      v113 = 2114;
      v114 = v70;
      _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_ERROR, "Representation %{public}@ in content %{public}@ has no tap action.", buf, 0x16u);

      v13 = v107;
    }

    v103 = 0;
    v65 = 1;
    goto LABEL_32;
  }
  v103 = (void *)v64;
  v65 = 0;
  v66 = v106;
LABEL_32:
  if (v61 < 0.0 || v63 < 0.0)
  {
    v61 = 0.0;
    v63 = 0.0;
  }
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "privateContent"));
  v72 = objc_msgSend(v71, "isCarouselAd");

  if (v72)
    objc_msgSend(v12, "carouselElementClicked:element:", v35, v61, v63);
  else
    objc_msgSend(v12, "clicked:", v61, v63);
  v105 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface _confirmedImpressionRequest:internalContent:context:clientInfo:idAccount:forClickInteraction:](self, "_confirmedImpressionRequest:internalContent:context:clientInfo:idAccount:forClickInteraction:", v11, v12, v13, v66, v15, 1));
  if (v105)
  {
    v73 = APLogForCategory(21);
    v74 = objc_claimAutoreleasedReturnValue(v73);
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_INFO, "APMetricsLegacyInterface sending impression request due to interaction event.", buf, 2u);
    }

    -[APMetricsLegacyInterface sendLegacyMetric:](self, "sendLegacyMetric:", v105);
  }
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface _confirmed50PercentImpressionRequest:internalContent:context:clientInfo:idAccount:forClickInteraction:](self, "_confirmed50PercentImpressionRequest:internalContent:context:clientInfo:idAccount:forClickInteraction:", v11, v12, v13, v66, v15, 1));
  if (v75)
  {
    v76 = APLogForCategory(21);
    v77 = objc_claimAutoreleasedReturnValue(v76);
    if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "APMetricsLegacyInterface sending impression request due to interaction event.", buf, 2u);
    }

    -[APMetricsLegacyInterface sendLegacyMetric:](self, "sendLegacyMetric:", v75);
  }
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface confirmedClickLock](self, "confirmedClickLock"));
  objc_msgSend(v78, "lock");

  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transientContent"));
  v80 = objc_msgSend(v79, "pendingConfirmedClick");

  v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "transientContent"));
  v82 = objc_msgSend(v81, "hasConfirmedClick");

  v83 = APLogForCategory(21);
  v84 = objc_claimAutoreleasedReturnValue(v83);
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
  {
    v85 = CFSTR("YES");
    if (v65)
      v86 = CFSTR("NO");
    else
      v86 = CFSTR("YES");
    if (v80)
      v87 = CFSTR("YES");
    else
      v87 = CFSTR("NO");
    *(_DWORD *)buf = 138543874;
    v112 = v86;
    v113 = 2114;
    v114 = v87;
    if (!v82)
      v85 = CFSTR("NO");
    v115 = 2114;
    v116 = v85;
    _os_log_impl((void *)&_mh_execute_header, v84, OS_LOG_TYPE_DEBUG, "Action exists: %{public}@, pending confirmed click: %{public}@, confirmed click: %{public}@", buf, 0x20u);
  }

  if (((v65 | v80 | v82) & 1) != 0)
  {
    v88 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface confirmedClickLock](self, "confirmedClickLock"));
    objc_msgSend(v88, "unlock");

    v89 = APLogForCategory(21);
    p_super = objc_claimAutoreleasedReturnValue(v89);
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_INFO))
    {
      v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "content"));
      v92 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v91, "identifier"));
      *(_DWORD *)buf = 138543362;
      v112 = v92;
      _os_log_impl((void *)&_mh_execute_header, p_super, OS_LOG_TYPE_INFO, "%{public}@ already has a confirmed click or a pending confirmed click request. Not posting another one.", buf, 0xCu);

      v14 = v106;
      v93 = v107;
      v94 = v103;
      p_vtable = (void **)(APPBAdFrequencyCapData + 24);
    }
    else
    {
      v14 = v106;
      v93 = v107;
      v94 = v103;
      p_vtable = APPBAdFrequencyCapData.vtable;
    }
  }
  else
  {
    v14 = v106;
    v93 = v107;
    v96 = -[APLegacyMetricRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:]([APLogSysEventRequester alloc], "initWithMetric:internalContent:andContext:clientInfo:idAccount:", v11, v12, v107, v106, v15);
    -[APLogSysEventRequester setEventType:](v96, "setEventType:", 6);
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester internalContent](v96, "internalContent"));
    objc_msgSend(v97, "pendingConfirmedClick:", 1);

    v98 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface confirmedClickLock](self, "confirmedClickLock"));
    objc_msgSend(v98, "unlock");

    v94 = v103;
    objc_msgSend(v103, "confirmedClickInterval");
    v100 = v99;
    v109[0] = _NSConcreteStackBlock;
    v109[1] = 3221225472;
    v109[2] = sub_1000E6434;
    v109[3] = &unk_100214CD8;
    v109[4] = self;
    v110 = v96;
    v101 = v96;
    p_vtable = APPBAdFrequencyCapData.vtable;
    p_super = &v101->super.super.super;
    -[APMetricsLegacyInterface sendLegacyMetricWithDelay:legacyMetric:requestSentHandler:](self, "sendLegacyMetricWithDelay:legacyMetric:requestSentHandler:", v101, v109, v100);

  }
  v48 = objc_msgSend(objc_alloc((Class)(p_vtable + 407)), "initWithMetric:internalContent:andContext:clientInfo:idAccount:", v11, v12, v93, v14, v15);
  objc_msgSend(v48, "setEventType:", 1);

  v13 = v93;
  v40 = v104;
LABEL_61:

  return v48;
}

- (id)handleQuickReturn:(id)a3 internalContent:(id)a4 context:(id)a5
{
  id v7;
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *i;
  void *v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v34;
  uint64_t v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  uint8_t buf[4];
  void *v41;
  __int16 v42;
  uint64_t v43;
  __int16 v44;
  uint64_t v45;
  _BYTE v46[128];

  v7 = a3;
  v8 = a4;
  v9 = metricPropertyValue(v7, (void *)0x1B);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v10, v11) & 1) != 0)
  {
    v12 = metricPropertyValue(v7, (void *)0x1B);
    v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
    v35 = (int)objc_msgSend(v13, "intValue");

    if ((unint64_t)(v35 - 8101) <= 4)
    {
      v34 = v7;
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "identifier"));
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface pendingRequestsForContent:filterPredicate:](self, "pendingRequestsForContent:filterPredicate:", v15, &stru_100214D18));

      v38 = 0u;
      v39 = 0u;
      v36 = 0u;
      v37 = 0u;
      v17 = v16;
      v18 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v37;
        do
        {
          for (i = 0; i != v19; i = (char *)i + 1)
          {
            if (*(_QWORD *)v37 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * (_QWORD)i);
            v23 = APLogForCategory(21);
            v24 = objc_claimAutoreleasedReturnValue(v23);
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
              v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "identifier"));
              *(_DWORD *)buf = 138412802;
              v41 = v22;
              v42 = 2112;
              v43 = (uint64_t)v26;
              v44 = 2048;
              v45 = v35;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_INFO, "Cancelling LogSysEventRequest %@ for content %@ due to quick return time %lu.", buf, 0x20u);

            }
            objc_msgSend(v22, "cancelDelayedRequest");
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface confirmedClickLock](self, "confirmedClickLock"));
            objc_msgSend(v27, "lock");

            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "internalContent"));
            objc_msgSend(v28, "pendingConfirmedClick:", 0);

            v29 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface confirmedClickLock](self, "confirmedClickLock"));
            objc_msgSend(v29, "unlock");

          }
          v19 = -[NSObject countByEnumeratingWithState:objects:count:](v17, "countByEnumeratingWithState:objects:count:", &v36, v46, 16);
        }
        while (v19);
      }

      v7 = v34;
      goto LABEL_16;
    }
  }
  else
  {

    v35 = 10;
  }
  v30 = APLogForCategory(21);
  v17 = objc_claimAutoreleasedReturnValue(v30);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "content"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
    *(_DWORD *)buf = 138412546;
    v41 = v32;
    v42 = 2048;
    v43 = v35;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Ignoring quick return metric for content %@ due to quick return time %lu. Confirmed click was already sent.", buf, 0x16u);

  }
LABEL_16:

  return 0;
}

- (id)handleInterfaceOnScreen:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "internalProperties"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKeyedSubscript:", CFSTR("type")));

  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "internalProperties"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("reason")));

  if (objc_msgSend(v15, "intValue") != 1)
    goto LABEL_4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
  if (!objc_msgSend(v18, "serverUnfilledReason"))
  {
    if (v17)
    {
      v21 = objc_msgSend(v17, "count");

      if (v21)
        goto LABEL_4;
    }
    else
    {

    }
    v19 = 0;
    goto LABEL_5;
  }

LABEL_4:
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface baseHandleInterfaceOnScreen:internalContent:context:idAccount:](self, "baseHandleInterfaceOnScreen:internalContent:context:idAccount:", v10, v11, v12, v13));
LABEL_5:

  return v19;
}

- (id)baseHandleInterfaceOnScreen:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  APMetricsLegacyInterface *v15;
  void *v16;
  uint64_t v17;
  APAdSpaceEventRequester *v18;
  int v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  APAdSpaceEventRequester *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  unsigned int v31;
  void *v32;
  void *v33;
  uint64_t v34;
  NSObject *v35;
  int v36;
  void *v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  uint64_t v41;
  NSObject *v42;
  void *v43;
  void *v44;
  NSObject *v45;
  uint64_t v46;
  NSObject *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  unsigned int v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  NSObject *v59;
  uint64_t v60;
  void *v61;
  unsigned int v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  NSObject *v67;
  const __CFString *v68;
  unsigned int v69;
  const __CFString *v70;
  unsigned int v71;
  const __CFString *v72;
  unsigned int v73;
  const __CFString *v74;
  void *v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  uint64_t v79;
  void *v80;
  void *v81;
  unsigned int v82;
  void *v83;
  void *v84;
  void *v85;
  id v86;
  id v87;
  uint64_t v88;
  void *i;
  void *v90;
  void *v91;
  uint64_t v92;
  NSObject *v93;
  void *v95;
  uint64_t v96;
  const __CFString *v97;
  const __CFString *v98;
  const __CFString *v99;
  const __CFString *v100;
  void *v101;
  void *v102;
  unsigned int v103;
  void *v104;
  unsigned int v105;
  void *v106;
  void *v107;
  uint64_t v108;
  uint64_t v109;
  unsigned __int8 v110;
  void *v111;
  void *v112;
  void *v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  uint8_t v118[128];
  uint8_t buf[4];
  uint64_t v120;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v11)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));

    if (v14)
    {
      v15 = self;
      objc_sync_enter(v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
      v17 = (uint64_t)objc_msgSend(v16, "serverUnfilledReason");

      if ((unint64_t)(v17 - 1021) < 3)
      {
        v18 = 0;
        v19 = 1;
        goto LABEL_101;
      }
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "properties"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "objectForKeyedSubscript:", CFSTR("collapsed")));

      if (!v25 || (v26 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v25, v26) & 1) == 0))
      {
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentIdentifier"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("OnScreen metric with content identifier %@ does not have a valid collapsed property %@."), v37, v25));

        v38 = APLogForCategory(21);
        v39 = objc_claimAutoreleasedReturnValue(v38);
        if (os_log_type_enabled(v39, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v120 = (uint64_t)v28;
          _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))APSimulateCrash(5, v28, 0);
        v18 = 0;
        v19 = 1;
        goto LABEL_100;
      }
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "internalProperties"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "objectForKeyedSubscript:", CFSTR("placeholder")));

      if (!v28 || (v29 = objc_opt_class(NSNumber), (objc_opt_isKindOfClass(v28, v29) & 1) == 0))
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentIdentifier"));
        v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("OnScreen metric with content identifier %@ does not have a valid placeholder value %@."), v40, v28));

        v41 = APLogForCategory(21);
        v42 = objc_claimAutoreleasedReturnValue(v41);
        if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v120 = (uint64_t)v113;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))APSimulateCrash(5, v113, 0);
        goto LABEL_97;
      }
      v105 = objc_msgSend(v25, "BOOLValue");
      v103 = objc_msgSend(v28, "BOOLValue");
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "internalProperties"));
      v113 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "objectForKeyedSubscript:", CFSTR("type")));

      if (v17 >= 1)
      {
        v109 = +[APLegacyTypeTranslator unfilledReasonCodeToASEStatusCode:](APLegacyTypeTranslator, "unfilledReasonCodeToASEStatusCode:", v17);
        if ((_DWORD)v109 == 3001)
          v31 = 0;
        else
          v31 = v103;
        if (v31 == 1)
        {
          v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentIdentifier"));
          v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("OnScreen metric with content identifier %@ for placeholder is not reporting AdNotAvailable (ASE 3001)! Instead is ASE: %d Unfilled Reason: %ld"), v32, v109, v17));

          v34 = APLogForCategory(21);
          v35 = objc_claimAutoreleasedReturnValue(v34);
          if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v120 = (uint64_t)v33;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }

          if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))APSimulateCrash(5, v33, 0);
          v36 = 0;
LABEL_41:
          if (((v105 | v36) & 1) == 0)
          {
            if (-[APMetricsLegacyInterface handleExpandedPlaceholderWithUnfilledReason:metric:internalContent:context:idAccount:](v15, "handleExpandedPlaceholderWithUnfilledReason:metric:internalContent:context:idAccount:", v109, v10, v11, v12, v13))
            {
              v49 = APLogForCategory(21);
              v45 = objc_claimAutoreleasedReturnValue(v49);
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
                v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "identifier"));
                *(_DWORD *)buf = 138543362;
                v120 = (uint64_t)v51;
                _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_INFO, "Delaying ASE AdNotAvailable for preroll video placeholder %{public}@, waiting for preroll timeout before sending.", buf, 0xCu);

              }
              goto LABEL_96;
            }
            v111 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentIdentifier"));
            v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
            v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "identifier"));
            v45 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("OnScreen metric %@ for expanded placeholder %@ with unfilled reason code %ld is in an unexpected state"), v111, v65, v17));

            v66 = APLogForCategory(21);
            v67 = objc_claimAutoreleasedReturnValue(v66);
            if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v120 = (uint64_t)v45;
              _os_log_impl((void *)&_mh_execute_header, v67, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
            }

            if (!+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))goto LABEL_96;
LABEL_58:
            APSimulateCrash(5, v45, 0);
LABEL_96:

            goto LABEL_97;
          }
LABEL_80:
          v81 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateContent"));
          v82 = objc_msgSend(v81, "isCarouselAd");

          if (v82)
          {
            v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
            v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "identifier"));
            v85 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface pendingRequestsForContent:filterPredicate:](v15, "pendingRequestsForContent:filterPredicate:", v84, &stru_100214D38));

            v107 = v28;
            v116 = 0u;
            v117 = 0u;
            v114 = 0u;
            v115 = 0u;
            v86 = v85;
            v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v114, v118, 16);
            if (v87)
            {
              v88 = *(_QWORD *)v115;
              do
              {
                for (i = 0; i != v87; i = (char *)i + 1)
                {
                  if (*(_QWORD *)v115 != v88)
                    objc_enumerationMutation(v86);
                  objc_msgSend(*(id *)(*((_QWORD *)&v114 + 1) + 8 * (_QWORD)i), "cancelDelayedRequest");
                }
                v87 = objc_msgSend(v86, "countByEnumeratingWithState:objects:count:", &v114, v118, 16);
              }
              while (v87);
            }

            v28 = v107;
          }
          if (!objc_msgSend(v11, "shouldSendAdSpaceStatusEvent:", v109))
          {
            v19 = 0;
            v18 = 0;
LABEL_99:

LABEL_100:
LABEL_101:
            objc_sync_exit(v15);

            if (v19)
              v23 = v18;
            else
              v23 = 0;
            goto LABEL_104;
          }
          objc_msgSend(v11, "appearedOnScreenWithStatus:", v109);
          v18 = -[APAdSpaceEventRequester initWithMetric:internalContent:andContext:idAccount:]([APAdSpaceEventRequester alloc], "initWithMetric:internalContent:andContext:idAccount:", v10, v11, v12, v13);
          -[APAdSpaceEventRequester setStatusCode:](v18, "setStatusCode:", v109);
LABEL_98:
          v19 = 1;
          goto LABEL_99;
        }
        v36 = v103 ^ 1;
        if ((v103 & 1) != 0 || (_DWORD)v109 != 3001 || v17 == 1010)
          goto LABEL_41;
        v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentIdentifier"));
        v45 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("OnScreen metric with content identifier %@ for non-placeholder that was not an unfilled network error is reporting AdNotAvailable (ASE 3001)! Instead is ASE %d Unfilled Reason: %ld"), v44, 3001, v17));

        v46 = APLogForCategory(21);
        v47 = objc_claimAutoreleasedReturnValue(v46);
        if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v120 = (uint64_t)v45;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
        }

        if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))APSimulateCrash(5, v45, 0);
        v48 = 3001;
        goto LABEL_78;
      }
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transientContent"));
      if (objc_msgSend(v43, "interfaceReady"))
      {

      }
      else
      {
        v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateContent"));
        v110 = objc_msgSend(v52, "isClientRenderedAd");

        if ((v110 & 1) == 0)
        {
          if ((v105 & 1) == 0)
          {
            v79 = APLogForCategory(21);
            v45 = objc_claimAutoreleasedReturnValue(v79);
            if (os_log_type_enabled(v45, OS_LOG_TYPE_ERROR))
            {
              v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentIdentifier"));
              *(_DWORD *)buf = 138543362;
              v120 = (uint64_t)v80;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_ERROR, "OnScreen metric with content identifier %{public}@ is reporting as expanded but a ready metric has not been received.", buf, 0xCu);

            }
            v48 = 10;
LABEL_78:
            v109 = v48;
LABEL_79:

            goto LABEL_80;
          }
          v63 = 10;
LABEL_61:
          v109 = v63;
          goto LABEL_80;
        }
      }
      if ((v105 & 1) != 0)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transientContent"));
        v54 = objc_msgSend(v53, "interfaceReady");

        if (!v54)
        {
          v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentIdentifier"));
          if (v103)
            v68 = CFSTR("YES");
          else
            v68 = CFSTR("NO");
          v100 = v68;
          v112 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transientContent"));
          v69 = objc_msgSend(v112, "interfaceReady");
          v70 = CFSTR("YES");
          if (!v69)
            v70 = CFSTR("NO");
          v99 = v70;
          v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateContent"));
          v71 = objc_msgSend(v106, "isClientRenderedAd");
          v72 = CFSTR("YES");
          if (!v71)
            v72 = CFSTR("NO");
          v98 = v72;
          v104 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateContent"));
          v73 = objc_msgSend(v104, "isNativeAd");
          v74 = CFSTR("YES");
          if (!v73)
            v74 = CFSTR("NO");
          v97 = v74;
          v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "description"));
          v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
          v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "uniqueIdentifier"));
          v45 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__O.[Diagnostic].OnScreen metric with content identifier %@ occurred without reporting an ASE. collapsed: %@ placeholder: %@ unfilled reason: %ld ready: %@ client rendered: %@ is Native ad: %@ metric: %@ ad identifier: %@"), v102, CFSTR("YES"), v100, v17, v99, v98, v97, v101, v76));

          v77 = APLogForCategory(21);
          v78 = objc_claimAutoreleasedReturnValue(v77);
          if (os_log_type_enabled(v78, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v120 = (uint64_t)v45;
            _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }

          if (!+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall"))goto LABEL_96;
          goto LABEL_58;
        }
        v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "internalProperties"));
        v45 = objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "objectForKeyedSubscript:", CFSTR("reason")));

        if (v45 && -[NSObject count](v45, "count"))
        {
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentIdentifier"));
          v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_OnScreen metric with content identifier %@ for placeholder is reporting AdNotAvailable (ASE 3001)!"), v56));

          v58 = APLogForCategory(21);
          v59 = objc_claimAutoreleasedReturnValue(v58);
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v120 = (uint64_t)v57;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }
          v60 = 3001;
        }
        else
        {
          if (objc_msgSend(v113, "intValue") == 7)
          {
            v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentIdentifier"));
            v91 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("_OnScreen metric with content identifier %@ for sponsorship Ad is attempting to report onScreen but is collapsed."), v90));

            v92 = APLogForCategory(21);
            v93 = objc_claimAutoreleasedReturnValue(v92);
            if (os_log_type_enabled(v93, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138543362;
              v120 = (uint64_t)v91;
              _os_log_impl((void *)&_mh_execute_header, v93, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
            }

            goto LABEL_96;
          }
          v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentIdentifier"));
          v108 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("__*.[Diagnostic].3004 OnScreen metric with content identifier %@ is reporting on screen and ready but is still collapsed!"), v95));

          v96 = APLogForCategory(21);
          v59 = objc_claimAutoreleasedReturnValue(v96);
          v57 = (void *)v108;
          if (os_log_type_enabled(v59, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138543362;
            v120 = v108;
            _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
          }
          v60 = 3004;
        }
        v109 = v60;

        goto LABEL_79;
      }
      v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "privateContent"));
      v62 = objc_msgSend(v61, "isPrerollVideo");

      if (((v62 ^ 1 | v103) & 1) == 0)
      {
LABEL_97:
        v18 = 0;
        goto LABEL_98;
      }
      v63 = 3000;
      goto LABEL_61;
    }
  }
  v20 = APLogForCategory(21);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "contentIdentifier"));
    *(_DWORD *)buf = 138543362;
    v120 = (uint64_t)v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Missing required parameters to handle on screen for content identifier %{public}@!", buf, 0xCu);

  }
  v23 = 0;
LABEL_104:

  return v23;
}

- (id)handleInterfaceExceededContainer:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  APMetricsLegacyInterface *v14;
  void *v15;
  unsigned __int8 v16;
  APAdSpaceEventRequester *v17;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = self;
  objc_sync_enter(v14);
  if ((objc_msgSend(v11, "shouldSendAdSpaceStatusEvent:", 3005) & 1) != 0
    || (v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "transientContent")),
        v16 = objc_msgSend(v15, "hasBeenOnScreen"),
        v15,
        (v16 & 1) == 0))
  {
    objc_msgSend(v11, "appearedOnScreenWithStatus:", 3005);
    v17 = -[APAdSpaceEventRequester initWithMetric:internalContent:andContext:idAccount:]([APAdSpaceEventRequester alloc], "initWithMetric:internalContent:andContext:idAccount:", v10, v11, v12, v13);
    -[APAdSpaceEventRequester setStatusCode:](v17, "setStatusCode:", 3005);
  }
  else
  {
    v17 = 0;
  }
  objc_sync_exit(v14);

  return v17;
}

- (id)handleInterfaceReplaced:(id)a3 metricEnvironment:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;
  NSObject *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  unsigned int v21;
  id v22;
  id v23;
  void *i;
  void *v25;
  uint64_t v26;
  NSObject *v27;
  void *v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  uint64_t v38;
  NSObject *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  NSObject *v49;
  APAdSpaceEventRequester *v51;
  void *v52;
  void *v53;
  APAdSpaceEventRequester *v54;
  APAdSpaceEventRequester *v55;
  void *v56;
  NSObject *v57;
  id v58;
  id obj;
  uint64_t v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  uint8_t v65[128];
  uint8_t buf[4];
  NSObject *v67;
  __int16 v68;
  id v69;

  v6 = a3;
  v7 = a4;
  v8 = metricPropertyValue(v6, (void *)0x14);
  v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
  v10 = objc_opt_class(NSString);
  if ((objc_opt_isKindOfClass(v9, v10) & 1) == 0)
  {

LABEL_25:
    v48 = APLogForCategory(21);
    v12 = objc_claimAutoreleasedReturnValue(v48);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v49 = objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "contentIdentifier"));
      *(_DWORD *)buf = 138543362;
      v67 = v49;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "InterfaceReplaced metric sent for content %{public}@ with no placeholder. Ignoring.", buf, 0xCu);

    }
    goto LABEL_27;
  }
  v11 = metricPropertyValue(v6, (void *)0x14);
  v12 = objc_claimAutoreleasedReturnValue(v11);

  if (!v12)
    goto LABEL_25;
  v13 = APLogForCategory(21);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "internalContent"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "content"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "identifier"));
    *(_DWORD *)buf = 138543618;
    v67 = v12;
    v68 = 2114;
    v69 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_INFO, "Replacing %{public}@ with %{public}@", buf, 0x16u);

  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "findInternalContentDataById:", v12));
  objc_msgSend(v18, "interfaceReplaced");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "internalContent"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "privateContent"));
  v21 = objc_msgSend(v20, "isPrerollVideo");

  if (v21)
  {
    v56 = v18;
    v57 = v12;
    v58 = v6;
    v61 = 0u;
    v62 = 0u;
    v63 = 0u;
    v64 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface pendingRequestsForContent:filterPredicate:](self, "pendingRequestsForContent:filterPredicate:", v12, &stru_100214D58));
    v22 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
    if (v22)
    {
      v23 = v22;
      v60 = *(_QWORD *)v62;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v62 != v60)
            objc_enumerationMutation(obj);
          v25 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * (_QWORD)i);
          v26 = APLogForCategory(21);
          v27 = objc_claimAutoreleasedReturnValue(v26);
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "internalContent"));
            v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "content"));
            v30 = objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "identifier"));
            v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "internalContent"));
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "content"));
            v33 = objc_msgSend(v32, "serverUnfilledReason");
            *(_DWORD *)buf = 138543618;
            v67 = v30;
            v68 = 2048;
            v69 = v33;
            _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_INFO, "Content %{public}@: has unfilled reason code %ld", buf, 0x16u);

          }
          objc_msgSend(v25, "cancelDelayedRequest");
          v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "internalContent"));
          v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "content"));
          if ((uint64_t)objc_msgSend(v35, "serverUnfilledReason") <= 200)
          {

          }
          else
          {
            v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "content"));
            v37 = (uint64_t)objc_msgSend(v36, "serverUnfilledReason");

            if (v37 <= 205)
            {
              v38 = APLogForCategory(21);
              v39 = objc_claimAutoreleasedReturnValue(v38);
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "internalContent"));
                v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "content"));
                v42 = objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "identifier"));
                v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "internalContent"));
                v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "content"));
                v45 = objc_msgSend(v44, "serverUnfilledReason");
                *(_DWORD *)buf = 138543618;
                v67 = v42;
                v68 = 2048;
                v69 = v45;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_INFO, "Content %{public}@: has unfilled reason code %ld. Sending an ASE with the unfilled reason code.", buf, 0x16u);

              }
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "content"));
              v47 = +[APLegacyTypeTranslator AdDataUnfilledReasonCodeToASECode:](APLegacyTypeTranslator, "AdDataUnfilledReasonCodeToASECode:", objc_msgSend(v46, "serverUnfilledReason"));

              if ((objc_msgSend(v34, "shouldSendAdSpaceStatusEvent:", v47) & 1) != 0)
              {
                objc_msgSend(v34, "appearedOnScreenWithStatus:", v47);
                v51 = [APAdSpaceEventRequester alloc];
                v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "context"));
                v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "idAccount"));
                v54 = v51;
                v6 = v58;
                v55 = -[APAdSpaceEventRequester initWithMetric:internalContent:andContext:idAccount:](v54, "initWithMetric:internalContent:andContext:idAccount:", v58, v34, v52, v53);

                -[APAdSpaceEventRequester setStatusCode:](v55, "setStatusCode:", v47);
                v12 = v57;
                goto LABEL_28;
              }
            }
          }

        }
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v65, 16);
      }
      while (v23);
    }

    v12 = v57;
    v6 = v58;
    v18 = v56;
  }

LABEL_27:
  v55 = 0;
LABEL_28:

  return v55;
}

- (id)handleInterfaceVisible:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  unsigned __int8 v22;
  id v23;
  void *v24;
  uint64_t v25;
  id v26;
  void *v27;
  int v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  const char *v33;
  void *v34;
  id v36;
  void *v37;
  uint64_t v38;
  double v39;
  id v40;
  void *v41;
  double v42;
  double v43;
  void *v44;
  unsigned int v45;
  id v46;
  void *v47;
  uint64_t v48;
  id v49;
  APTimeSpentStoreDatabase *v50;
  void *v51;
  unsigned int v52;
  APTimeSpentStoreDatabase *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  uint64_t v58;
  id v59;
  void *v60;
  unsigned int v61;
  id v62;
  void *v63;
  uint64_t v64;
  id v65;
  void *v66;
  APLogVideoAnalyticsEventRequester *v67;
  void *v68;
  unsigned int v69;
  double v70;
  APLogVideoAnalyticsEventRequester *v71;
  void *v72;
  void *v73;
  unsigned int v74;
  uint64_t v75;
  void *v76;
  uint64_t v77;
  NSObject *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  uint64_t v82;
  int v83;
  uint8_t buf[4];
  void *v85;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = metricPropertyValue(v12, (void *)5);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v18, v19) & 1) == 0)
  {

    goto LABEL_6;
  }
  v20 = metricPropertyValue(v12, (void *)5);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  v22 = objc_msgSend(v21, "BOOLValue");

  if ((v22 & 1) != 0)
  {
LABEL_6:
    v29 = APLogForCategory(21);
    v30 = objc_claimAutoreleasedReturnValue(v29);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
LABEL_9:

      v34 = 0;
      goto LABEL_10;
    }
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "content"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
    *(_DWORD *)buf = 138543362;
    v85 = v32;
    v33 = "Content %{public}@ reporting visible but is collapsed.";
LABEL_8:
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, v33, buf, 0xCu);

    goto LABEL_9;
  }
  v23 = metricPropertyValue(v12, (void *)0x12);
  v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
  v25 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v24, v25) & 1) != 0)
  {
    v26 = metricPropertyValue(v12, (void *)0x12);
    v27 = (void *)objc_claimAutoreleasedReturnValue(v26);
    v28 = objc_msgSend(v27, "intValue");
    v81 = v28;

  }
  else
  {
    v81 = 0;
    v28 = 0;
  }

  v36 = metricPropertyValue(v12, (void *)8);
  v37 = (void *)objc_claimAutoreleasedReturnValue(v36);
  v38 = objc_opt_class(NSNumber);
  v39 = 0.0;
  if ((objc_opt_isKindOfClass(v37, v38) & 1) != 0)
  {
    v40 = metricPropertyValue(v12, (void *)8);
    v41 = (void *)objc_claimAutoreleasedReturnValue(v40);
    objc_msgSend(v41, "doubleValue");
    v39 = v42;

  }
  if (v28 >= 100)
    objc_msgSend(v13, "wasFullyVisible");
  v83 = v28;
  v43 = v39 / 1000.0;
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privateContent", v81));
  v45 = objc_msgSend(v44, "isCarouselAd");

  if (v45)
  {
    v46 = metricPropertyValue(v12, (void *)0xB);
    v47 = (void *)objc_claimAutoreleasedReturnValue(v46);
    v48 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v47, v48) & 1) != 0)
    {
      v49 = metricPropertyValue(v12, (void *)0xB);
      v50 = (APTimeSpentStoreDatabase *)objc_claimAutoreleasedReturnValue(v49);
    }
    else
    {
      v50 = 0;
    }

    v56 = metricPropertyValue(v12, (void *)0xA);
    v57 = (void *)objc_claimAutoreleasedReturnValue(v56);
    v58 = objc_opt_class(NSArray);
    if ((objc_opt_isKindOfClass(v57, v58) & 1) != 0)
    {
      v59 = metricPropertyValue(v12, (void *)0xA);
      v55 = (void *)objc_claimAutoreleasedReturnValue(v59);
    }
    else
    {
      v55 = 0;
    }

    objc_msgSend(v13, "carouselVisibleStateChanged:duration:elements:partialElements:", v82, v50, v55, v43);
    goto LABEL_26;
  }
  objc_msgSend(v13, "visibleStateChanged:duration:", v82, v43);
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privateContent"));
  v52 = objc_msgSend(v51, "isSponsorshipAd");

  if (v52)
  {
    v53 = [APTimeSpentStoreDatabase alloc];
    v54 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface databaseManager](self, "databaseManager"));
    v50 = -[APTimeSpentStoreDatabase initWithDatabase:](v53, "initWithDatabase:", v54);

    v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentIdentifier"));
    -[APTimeSpentStoreDatabase storeEntryForContentId:](v50, "storeEntryForContentId:", v55);
LABEL_26:

  }
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privateContent"));
  v61 = objc_msgSend(v60, "isVideo");

  if (v61 && v83 == 50)
  {
    v62 = metricPropertyValue(v12, (void *)0x1E);
    v63 = (void *)objc_claimAutoreleasedReturnValue(v62);
    v64 = objc_opt_class(NSDate);
    if ((objc_opt_isKindOfClass(v63, v64) & 1) != 0)
    {
      v65 = metricPropertyValue(v12, (void *)0x1E);
      v66 = (void *)objc_claimAutoreleasedReturnValue(v65);
    }
    else
    {
      v66 = 0;
    }

    v67 = -[APLogVideoAnalyticsEventRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:]([APLogVideoAnalyticsEventRequester alloc], "initWithMetric:internalContent:andContext:clientInfo:idAccount:", v12, v13, v14, v15, v16);
    v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transientContent"));
    v69 = objc_msgSend(v68, "wasFullyVisible");

    v70 = 0.51;
    if (v69)
      v70 = 1.0;
    -[APLogVideoAnalyticsEventRequester setVideoVisibility:](v67, "setVideoVisibility:", v70);
    objc_msgSend(v66, "timeIntervalSince1970");
    -[APLogVideoAnalyticsEventRequester setVisibilityTimestamp:](v67, "setVisibilityTimestamp:");
    -[APMetricsLegacyInterface sendLegacyMetric:](self, "sendLegacyMetric:", v67);
    v71 = -[APLogVideoAnalyticsEventRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:]([APLogVideoAnalyticsEventRequester alloc], "initWithMetric:internalContent:andContext:clientInfo:idAccount:", v12, v13, v14, v15, v16);
    -[APLogVideoAnalyticsEventRequester setVideoVisibility:](v71, "setVideoVisibility:", 0.49);
    v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "dateByAddingTimeInterval:", v43));
    objc_msgSend(v72, "timeIntervalSince1970");
    -[APLogVideoAnalyticsEventRequester setVisibilityTimestamp:](v71, "setVisibilityTimestamp:");
    -[APMetricsLegacyInterface sendLegacyMetric:](self, "sendLegacyMetric:", v71);

  }
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transientContent"));
  v74 = objc_msgSend(v73, "playbackInProgress");

  if (v74)
  {
    v75 = APLogForCategory(21);
    v30 = objc_claimAutoreleasedReturnValue(v75);
    if (!os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      goto LABEL_9;
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "content"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "identifier"));
    *(_DWORD *)buf = 138543362;
    v85 = v32;
    v33 = "Ignoring impression request for %{public}@: playback is in progress.";
    goto LABEL_8;
  }
  if (v83 >= 50)
  {
    v76 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface _confirmed50PercentImpressionRequest:internalContent:context:clientInfo:idAccount:forClickInteraction:](self, "_confirmed50PercentImpressionRequest:internalContent:context:clientInfo:idAccount:forClickInteraction:", v12, v13, v14, v15, v16, 0));
    if (v76)
    {
      v77 = APLogForCategory(21);
      v78 = objc_claimAutoreleasedReturnValue(v77);
      if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
      {
        v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "content"));
        v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "identifier"));
        *(_DWORD *)buf = 138543362;
        v85 = v80;
        _os_log_impl((void *)&_mh_execute_header, v78, OS_LOG_TYPE_INFO, "Sending 50%% impression request for %{public}@", buf, 0xCu);

      }
      -[APMetricsLegacyInterface sendLegacyMetric:](self, "sendLegacyMetric:", v76);
    }

  }
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface _confirmedImpressionRequest:internalContent:context:clientInfo:idAccount:forClickInteraction:](self, "_confirmedImpressionRequest:internalContent:context:clientInfo:idAccount:forClickInteraction:", v12, v13, v14, v15, v16, 0));
LABEL_10:

  return v34;
}

- (id)handleInterfaceOffScreen:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  unsigned int v18;
  void *v19;
  void *v20;
  unsigned __int8 v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  APLogSysEventRequester *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSObject *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  NSObject *v36;
  void *v37;
  void *v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  void *v46;
  id v47;
  void *v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  uint64_t v53;
  NSObject *v54;
  void *v55;
  void *v56;
  double v57;
  void *v58;
  unsigned int v59;
  _QWORD *v61;
  void *v62;
  void *v63;
  void *v64;
  _QWORD v65[4];
  id v66;
  double v67;
  _QWORD v68[5];
  uint8_t v69[4];
  void *v70;
  __int128 buf;
  uint64_t v72;
  uint64_t (*v73)(uint64_t, uint64_t);
  void (*v74)(uint64_t);
  id v75;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privateContent"));
  v18 = objc_msgSend(v17, "isCarouselAd");

  if (v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transientContent"));
    if ((objc_msgSend(v19, "hasConfirmedImpression") & 1) != 0)
    {
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transientContent"));
      v21 = objc_msgSend(v20, "carouselFinishedSent");

      if ((v21 & 1) == 0)
      {
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transientContent"));
        objc_msgSend(v22, "carouselVisibleTime");
        v24 = v23;

        v25 = floor(v24 * 10.0 + 0.5) / 10.0;
        if (v25 <= 30.0)
          v26 = v25;
        else
          v26 = 30.0;
        v27 = -[APLegacyMetricRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:]([APLogSysEventRequester alloc], "initWithMetric:internalContent:andContext:clientInfo:idAccount:", v12, v13, v14, v15, v16);
        -[APLogSysEventRequester setEventType:](v27, "setEventType:", 908);
        v28 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester logMetadata](v27, "logMetadata"));
        objc_msgSend(v28, "setTimeSinceAppResume:", v26);

        v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transientContent"));
        v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "carouselElementsVisible"));

        if (!v64)
        {
          v30 = APLogForCategory(21);
          v31 = objc_claimAutoreleasedReturnValue(v30);
          if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
          {
            v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "content"));
            v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "identifier"));
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v33;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "carouselElementsVisible is nil for content %{public}@", (uint8_t *)&buf, 0xCu);

          }
        }
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transientContent"));
        v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "carouselElementsPartiallyVisible"));

        if (!v63)
        {
          v35 = APLogForCategory(21);
          v36 = objc_claimAutoreleasedReturnValue(v35);
          if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
          {
            v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "content"));
            v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "identifier"));
            LODWORD(buf) = 138543362;
            *(_QWORD *)((char *)&buf + 4) = v38;
            _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_ERROR, "carouselElementsPartiallyVisible is nil for content %{public}@", (uint8_t *)&buf, 0xCu);

          }
        }
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v72 = 0x3032000000;
        v73 = sub_10002D3A0;
        v74 = sub_10002D360;
        v75 = objc_alloc_init((Class)NSMutableData);
        v68[0] = _NSConcreteStackBlock;
        v68[1] = 3221225472;
        v68[2] = sub_1000E8BE4;
        v68[3] = &unk_100214D80;
        v68[4] = &buf;
        v61 = objc_retainBlock(v68);
        if (v64)
        {
          objc_msgSend(v64, "enumerateObjectsUsingBlock:", v61);
          v39 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "copy");
          v40 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester logMetadata](v27, "logMetadata"));
          objc_msgSend(v40, "setTiltStationBlob:", v39);

          v41 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester logMetadata](v27, "logMetadata"));
          v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "tiltStationBlob"));
          LODWORD(v40) = v42 == 0;

          if ((_DWORD)v40)
          {
            v43 = APLogForCategory(21);
            v44 = objc_claimAutoreleasedReturnValue(v43);
            if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
            {
              v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "content"));
              v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "identifier"));
              *(_DWORD *)v69 = 138543362;
              v70 = v46;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "tiltStationBlob is nil for content %{public}@", v69, 0xCu);

            }
          }
        }
        v47 = objc_alloc_init((Class)NSMutableData);
        v48 = *(void **)(*((_QWORD *)&buf + 1) + 40);
        *(_QWORD *)(*((_QWORD *)&buf + 1) + 40) = v47;

        if (v63)
        {
          objc_msgSend(v63, "enumerateObjectsUsingBlock:", v61);
          v49 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester logMetadata](v27, "logMetadata"));
          v50 = objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "copy");
          objc_msgSend(v49, "addTiltTrackBlob:", v50);

          v51 = (void *)objc_claimAutoreleasedReturnValue(-[APLegacyMetricRequester logMetadata](v27, "logMetadata"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "tiltTrackBlobs"));
          LODWORD(v50) = v52 == 0;

          if ((_DWORD)v50)
          {
            v53 = APLogForCategory(21);
            v54 = objc_claimAutoreleasedReturnValue(v53);
            if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
            {
              v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "content"));
              v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "identifier"));
              *(_DWORD *)v69 = 138543362;
              v70 = v56;
              _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "tiltTrackBlobs is nil for content after checking partially visible cells %{public}@", v69, 0xCu);

            }
          }
        }
        v57 = 30.0;
        if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall", v61))
        {
          v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSProcessInfo processInfo](NSProcessInfo, "processInfo"));
          v59 = objc_msgSend(v58, "isRunningTests");

          if (v59)
            v57 = 1.0;
          else
            v57 = 30.0;
        }
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_1000E8C2C;
        v65[3] = &unk_100214DA8;
        v66 = v13;
        v67 = v57;
        -[APMetricsLegacyInterface sendLegacyMetricWithDelay:legacyMetric:requestSentHandler:](self, "sendLegacyMetricWithDelay:legacyMetric:requestSentHandler:", v27, v65, v57);

        _Block_object_dispose(&buf, 8);
      }
    }
    else
    {

    }
  }

  return 0;
}

- (id)_unconfirmedImpressionRequest:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  APLogImpressionRequester *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[APLegacyMetricRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:]([APLogImpressionRequester alloc], "initWithMetric:internalContent:andContext:clientInfo:idAccount:", v15, v14, v13, v12, v11);

  -[APLogImpressionRequester setType:](v16, "setType:", 1);
  return v16;
}

- (id)_confirmedImpressionRequest:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7 forClickInteraction:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  APLogImpressionRequester *v18;

  v8 = a8;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (objc_msgSend(v14, "canSendImpression:", v8))
  {
    objc_msgSend(v14, "confirmImpression");
    v18 = -[APLegacyMetricRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:]([APLogImpressionRequester alloc], "initWithMetric:internalContent:andContext:clientInfo:idAccount:", v13, v14, v15, v16, v17);
    -[APLogImpressionRequester setType:](v18, "setType:", 2);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)_confirmed50PercentImpressionRequest:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7 forClickInteraction:(BOOL)a8
{
  _BOOL8 v8;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  APLogImpressionRequester *v18;

  v8 = a8;
  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  if (objc_msgSend(v14, "canSend50PercentImpression:", v8))
  {
    objc_msgSend(v14, "confirm50PercentImpression");
    v18 = -[APLegacyMetricRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:]([APLogImpressionRequester alloc], "initWithMetric:internalContent:andContext:clientInfo:idAccount:", v13, v14, v15, v16, v17);
    -[APLogImpressionRequester setType:](v18, "setType:", 3);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)handleLoadFailed:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  unsigned int v18;
  APAdSpaceEventRequester *v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = metricPropertyValue(v9, (void *)0x32);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v14, v15) & 1) != 0)
  {
    v16 = metricPropertyValue(v9, (void *)0x32);
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    v18 = objc_msgSend(v17, "BOOLValue");

    if (!v18 || !objc_msgSend(v10, "shouldSendAdSpaceStatusEvent:", 8))
    {
      v19 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v10, "loadFailed");
    v19 = -[APAdSpaceEventRequester initWithMetric:internalContent:andContext:idAccount:]([APAdSpaceEventRequester alloc], "initWithMetric:internalContent:andContext:idAccount:", v9, v10, v11, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "transientContent"));
    -[APAdSpaceEventRequester setStatusCode:](v19, "setStatusCode:", objc_msgSend(v14, "lastStatusCode"));
  }
  else
  {
    v19 = 0;
  }

LABEL_8:
  return v19;
}

- (id)handleVideoMetric:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  APAdSpaceEventRequester *v17;
  id v18;
  uint64_t v19;
  APLogVideoAnalyticsEventRequester *v20;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a7;
  v16 = a6;
  v17 = (APAdSpaceEventRequester *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privateContent"));
  if (!-[APAdSpaceEventRequester isPrerollVideo](v17, "isPrerollVideo"))
    goto LABEL_10;
  if (objc_msgSend(v12, "metric") == (id)1600)
  {

  }
  else
  {
    v18 = objc_msgSend(v12, "metric");

    if (v18 != (id)2503)
      goto LABEL_11;
  }
  if (objc_msgSend(v12, "metric") == (id)1600)
    v19 = 3000;
  else
    v19 = 3013;
  if (objc_msgSend(v13, "shouldSendAdSpaceStatusEvent:", v19))
  {
    v17 = -[APAdSpaceEventRequester initWithMetric:internalContent:andContext:idAccount:]([APAdSpaceEventRequester alloc], "initWithMetric:internalContent:andContext:idAccount:", v12, v13, v14, v15);
    -[APAdSpaceEventRequester setStatusCode:](v17, "setStatusCode:", v19);
    -[APMetricsLegacyInterface sendLegacyMetric:](self, "sendLegacyMetric:", v17);
LABEL_10:

  }
LABEL_11:
  v20 = -[APLogVideoAnalyticsEventRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:]([APLogVideoAnalyticsEventRequester alloc], "initWithMetric:internalContent:andContext:clientInfo:idAccount:", v12, v13, v14, v16, v15);

  return v20;
}

- (id)handlePrivacyAdMetric:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  APLogSysEventRequester *v16;

  v11 = a7;
  v12 = a6;
  v13 = a5;
  v14 = a4;
  v15 = a3;
  v16 = -[APLegacyMetricRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:]([APLogSysEventRequester alloc], "initWithMetric:internalContent:andContext:clientInfo:idAccount:", v15, v14, v13, v12, v11);

  -[APLogSysEventRequester setEventType:](v16, "setEventType:", 900);
  return v16;
}

- (id)handleValidationFailed:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  APServerErrorRequester *v14;
  void *v15;
  void *v16;
  APServerErrorRequester *v17;
  APAdSpaceEventRequester *v18;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = [APServerErrorRequester alloc];
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "error"));
  v17 = -[APServerErrorRequester initWithMetric:internalContent:context:idAccount:error:](v14, "initWithMetric:internalContent:context:idAccount:error:", v10, v11, v12, v13, v16);

  -[APMetricsLegacyInterface sendLegacyMetric:](self, "sendLegacyMetric:", v17);
  if (objc_msgSend(v11, "shouldSendAdSpaceStatusEvent:", 9))
  {
    v18 = -[APAdSpaceEventRequester initWithMetric:internalContent:andContext:idAccount:]([APAdSpaceEventRequester alloc], "initWithMetric:internalContent:andContext:idAccount:", v10, v11, v12, v13);
    -[APAdSpaceEventRequester setStatusCode:](v18, "setStatusCode:", 9);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)handleDaemonRequestFailed:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  id v17;
  void *v18;
  signed int v19;
  uint64_t v20;
  APServerErrorRequester *v21;
  void *v22;
  void *v23;
  APServerErrorRequester *v24;
  APAdSpaceEventRequester *v25;
  uint64_t v26;
  NSObject *v27;
  int v29;
  uint64_t v30;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = metricPropertyValue(v10, (void *)4);
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v15, v16) & 1) == 0)
  {

    v20 = -1;
    goto LABEL_6;
  }
  v17 = metricPropertyValue(v10, (void *)4);
  v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
  v19 = objc_msgSend(v18, "intValue");

  if (v19 == 3300)
  {
LABEL_9:
    v25 = 0;
    goto LABEL_10;
  }
  v20 = v19;
  if ((unint64_t)(v19 - 3303) <= 0xFFFFFFFFFFFFFFFDLL)
  {
LABEL_6:
    v26 = APLogForCategory(21);
    v27 = objc_claimAutoreleasedReturnValue(v26);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      v29 = 134217984;
      v30 = v20;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "Unexpected APJourneyMetricRequestFailedReasonCode: %ld", (uint8_t *)&v29, 0xCu);
    }

    goto LABEL_9;
  }
  v21 = [APServerErrorRequester alloc];
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "content"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "error"));
  v24 = -[APServerErrorRequester initWithMetric:internalContent:context:idAccount:error:](v21, "initWithMetric:internalContent:context:idAccount:error:", v10, v11, v12, v13, v23);

  -[APMetricsLegacyInterface sendLegacyMetric:](self, "sendLegacyMetric:", v24);
  v25 = -[APAdSpaceEventRequester initWithMetric:internalContent:andContext:idAccount:]([APAdSpaceEventRequester alloc], "initWithMetric:internalContent:andContext:idAccount:", v10, v11, v12, v13);
  -[APAdSpaceEventRequester setStatusCode:](v25, "setStatusCode:", 1);

LABEL_10:
  return v25;
}

- (id)handleArticleLoadFailure:(id)a3 internalContent:(id)a4 context:(id)a5 idAccount:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  APAdSpaceEventRequester *v13;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  if (objc_msgSend(v10, "shouldSendAdSpaceStatusEvent:", 3012))
  {
    v13 = -[APAdSpaceEventRequester initWithMetric:internalContent:andContext:idAccount:]([APAdSpaceEventRequester alloc], "initWithMetric:internalContent:andContext:idAccount:", v9, v10, v11, v12);
    -[APAdSpaceEventRequester setStatusCode:](v13, "setStatusCode:", 3012);
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)handleMediaComplete:(id)a3 internalContent:(id)a4 context:(id)a5 clientInfo:(id)a6 idAccount:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unsigned int v20;
  APLogVideoAnalyticsEventRequester *v21;
  id v22;
  void *v23;
  void *v24;
  unsigned int v25;
  void *v26;
  double v27;
  double v28;
  void *v29;
  void *v31;
  void *v32;
  void *v33;
  APTimeSpentEventRequester *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "internalProperties"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("type")));

  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privateContent"));
  v20 = objc_msgSend(v19, "isVideo");

  if (!v20)
  {
    if (objc_msgSend(v18, "intValue") == 7)
    {
      v22 = +[APConfigurationMediator configurationForClass:usingCache:](APConfigurationMediator, "configurationForClass:usingCache:", objc_opt_class(APSponsorshipPlacementConfig), 1);
      v23 = (void *)objc_claimAutoreleasedReturnValue(v22);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "sendTimeSpentMetric"));
      v25 = objc_msgSend(v24, "BOOLValue");

      if (v25)
      {
        v34 = [APTimeSpentEventRequester alloc];
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "bundleIdentifier"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contentIdentifier"));
        v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "contextIdentifier"));
        v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privateContent"));
        v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "adResponseIdentifier"));
        v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privateContent"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "batchResponseID"));
        v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "privateContent"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "impressionIdentifier"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transientContent"));
        objc_msgSend(v26, "timeSpent");
        v28 = v27;
        v29 = (void *)objc_claimAutoreleasedReturnValue(-[APMetricsLegacyInterface databaseManager](self, "databaseManager"));
        v21 = -[APTimeSpentEventRequester initWithBundleID:idAccount:contentId:contextId:adDataResponseIdentifier:batchId:impressionIdentifierData:timeSpent:databaseManager:](v34, "initWithBundleID:idAccount:contentId:contextId:adDataResponseIdentifier:batchId:impressionIdentifierData:timeSpent:databaseManager:", v40, v16, v39, v38, v37, v32, v28, v31, v29);

        goto LABEL_8;
      }

    }
    v21 = 0;
    goto LABEL_8;
  }
  v21 = -[APLogVideoAnalyticsEventRequester initWithMetric:internalContent:andContext:clientInfo:idAccount:]([APLogVideoAnalyticsEventRequester alloc], "initWithMetric:internalContent:andContext:clientInfo:idAccount:", v12, v13, v14, v15, v16);
LABEL_8:

  return v21;
}

- (id)handleSubscription:(id)a3
{
  id v3;
  APLogSubscriptionEventRequester *v4;
  void *v5;
  APLogSubscriptionEventRequester *v6;

  v3 = a3;
  v4 = [APLogSubscriptionEventRequester alloc];
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bundleIdentifier"));
  v6 = -[APLogSubscriptionEventRequester initWithMetric:bundleID:](v4, "initWithMetric:bundleID:", v3, v5);

  return v6;
}

- (BOOL)handleExpandedPlaceholderWithUnfilledReason:(int)a3 metric:(id)a4 internalContent:(id)a5 context:(id)a6 idAccount:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  void *v17;
  BOOL v18;
  void *v19;
  unsigned int v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  void *v24;
  APAdSpaceEventRequester *v25;
  int v27;
  void *v28;

  v12 = a4;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "internalProperties"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("type")));

  v18 = 0;
  if (a3 == 3001 && v17)
  {
    if (objc_msgSend(v17, "intValue") == 3)
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "transientContent"));
      v20 = objc_msgSend(v19, "hasBeenOnScreen");

      if (v20)
      {
        v21 = APLogForCategory(21);
        v22 = objc_claimAutoreleasedReturnValue(v21);
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "content"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "identifier"));
          v27 = 138543362;
          v28 = v24;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "Not queuing delayed AdNotAvailable ASE for content %{public}@, it has previously been on screen.", (uint8_t *)&v27, 0xCu);

        }
      }
      else
      {
        objc_msgSend(v13, "appearedOnScreenWithStatus:", 3001);
        v25 = -[APAdSpaceEventRequester initWithMetric:internalContent:andContext:idAccount:]([APAdSpaceEventRequester alloc], "initWithMetric:internalContent:andContext:idAccount:", v12, v13, v14, v15);
        -[APAdSpaceEventRequester setStatusCode:](v25, "setStatusCode:", 3001);
        -[APMetricsLegacyInterface sendLegacyMetricWithDelay:legacyMetric:requestSentHandler:](self, "sendLegacyMetricWithDelay:legacyMetric:requestSentHandler:", v25, &stru_100214DE8, 2.0);

      }
      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
  }

  return v18;
}

- (NSMutableDictionary)pendingDelayedRequests
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (APUnfairRecursiveLock)delayedRequestLock
{
  return (APUnfairRecursiveLock *)objc_getProperty(self, a2, 16, 1);
}

- (APUnfairRecursiveLock)confirmedClickLock
{
  return (APUnfairRecursiveLock *)objc_getProperty(self, a2, 24, 1);
}

- (APLegacyMetricRetryManagerProtocol)metricRetryManager
{
  return (APLegacyMetricRetryManagerProtocol *)objc_getProperty(self, a2, 32, 1);
}

- (NSSet)bundleIdentifierAllowList
{
  return (NSSet *)objc_getProperty(self, a2, 40, 1);
}

- (APDatabaseManager)databaseManager
{
  return self->_databaseManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_databaseManager, 0);
  objc_storeStrong((id *)&self->_ignoredClientIdentifiers, 0);
  objc_storeStrong((id *)&self->_ignoredClientIdentifierSuffixes, 0);
  objc_storeStrong((id *)&self->_bundleIdentifierAllowList, 0);
  objc_storeStrong((id *)&self->_metricRetryManager, 0);
  objc_storeStrong((id *)&self->_confirmedClickLock, 0);
  objc_storeStrong((id *)&self->_delayedRequestLock, 0);
  objc_storeStrong((id *)&self->_pendingDelayedRequests, 0);
}

@end
