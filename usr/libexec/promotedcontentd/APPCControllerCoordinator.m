@implementation APPCControllerCoordinator

- (void)handleNewPromotedContent:(id)a3 adsReceived:(unint64_t *)a4 adsRequested:(unint64_t)a5 token:(id)a6 context:(id)a7 lastInBatch:(BOOL)a8 deliverEntireBatch:(BOOL)a9 completionHandler:(id)a10
{
  id v14;
  id v15;
  void (**v16)(_QWORD);
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  void (**v21)(_QWORD, _QWORD);
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void (**v28)(_QWORD);
  void *v29;
  unint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void (**v33)(_QWORD);
  void *v34;
  void *v35;
  void *v36;
  _BOOL4 v37;
  uint8_t buf[4];
  void *v40;
  __int16 v41;
  id v42;
  __int16 v43;
  unint64_t v44;
  __int16 v45;
  unint64_t v46;
  void *v47;

  v37 = a8;
  v14 = a3;
  v15 = a6;
  v16 = (void (**)(_QWORD))a10;
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[APPCControllerCoordinator _addToCacheContentData:context:](APPCControllerCoordinator, "_addToCacheContentData:context:", v14, a7));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerCoordinator bundleID](self, "bundleID"));
  objc_msgSend(v17, "markInUseByClientWithId:", v18);

  v19 = APLogForCategory(34);
  v20 = objc_claimAutoreleasedReturnValue(v19);
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Send one promoted content", buf, 2u);
  }

  v21 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[APPCControllerCoordinator deliveryBlock](self, "deliveryBlock"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "content"));
  v47 = v22;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v47, 1));
  ((void (**)(_QWORD, void *))v21)[2](v21, v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerCoordinator lock](self, "lock"));
  objc_msgSend(v24, "lock");
  ++*a4;
  v25 = APLogForCategory(34);
  v26 = objc_claimAutoreleasedReturnValue(v25);
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "content"));
    v36 = v17;
    v28 = v16;
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "identifier"));
    v30 = *a4;
    *(_DWORD *)buf = 138544130;
    v40 = v29;
    v41 = 2114;
    v42 = v15;
    v43 = 2050;
    v44 = v30;
    v45 = 2050;
    v46 = a5;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Received one promoted content %{public}@ for the request %{public}@. Progress %{public}lu/%{public}lu.", buf, 0x2Au);

    v16 = v28;
    v17 = v36;

  }
  if (a9)
  {
    if (!v37)
      goto LABEL_12;
  }
  else if (*a4 != a5)
  {
    goto LABEL_12;
  }
  v31 = APLogForCategory(34);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = v16;
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "UUIDString"));
    *(_DWORD *)buf = 138543362;
    v40 = v34;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "All responses for the request %{public}@ have been received.", buf, 0xCu);

    v16 = v33;
  }

  v16[2](v16);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerCoordinator tokens](self, "tokens"));
  objc_msgSend(v35, "removeObject:", v15);

LABEL_12:
  objc_msgSend(v24, "unlock");

}

- (id)deliveryBlock
{
  return self->_deliveryBlock;
}

- (NSString)bundleID
{
  return self->_bundleID;
}

+ (id)_addToCacheContentData:(id)a3 context:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fingerprint"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContext findManagedContextByFingerprint:](APManagedContext, "findManagedContextByFingerprint:", v7));

  if (!v8)
  {
    v9 = APLogForCategory(34);
    v10 = objc_claimAutoreleasedReturnValue(v9);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "content"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "fingerprint"));
      v17 = 138543618;
      v18 = v12;
      v19 = 2114;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received promoted content %{public}@ for context %{public}@ but managed content does not exist. Creating new managed context.", (uint8_t *)&v17, 0x16u);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[APIDAccountProvider privateUserAccount](APIDAccountProvider, "privateUserAccount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[APManagedContext createManagedContextWithContext:idAccount:](APManagedContext, "createManagedContextWithContext:idAccount:", v6, v14));

  }
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "addContentData:", v5));

  return v15;
}

- (NSMutableSet)tokens
{
  return self->_tokens;
}

- (APUnfairRecursiveLock)lock
{
  return self->_lock;
}

- (void)requestFromLegacyInterfaceForPromotedContents:(id)a3 context:(id)a4 withToken:(id)a5 andBundleID:(id)a6 clientInfo:(id)a7 idAccount:(id)a8 deliverEntireBatch:(BOOL)a9 completionHandler:(id)a10
{
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  void (**v24)(_QWORD);
  uint64_t v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  void (**v34)(_QWORD);
  _BYTE *v35;
  id v36;
  BOOL v37;
  id location;
  _BYTE buf[24];
  id v40;

  v16 = a3;
  v17 = a4;
  v18 = a5;
  v19 = a6;
  v20 = a7;
  v21 = a8;
  v22 = v20;
  v23 = v21;
  v24 = (void (**)(_QWORD))a10;
  if (v22)
  {
    v25 = APLogForCategory(34);
    v26 = objc_claimAutoreleasedReturnValue(v25);
    v27 = v16;
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
      *(_DWORD *)buf = 136643331;
      *(_QWORD *)&buf[4] = "-[APPCControllerCoordinator requestFromLegacyInterfaceForPromotedContents:context:withToken:a"
                           "ndBundleID:clientInfo:idAccount:deliverEntireBatch:completionHandler:]";
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v28;
      *(_WORD *)&buf[22] = 2114;
      v40 = v19;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_INFO, "%{sensitive}s: bundleID for context %{public}@ is %{public}@.", buf, 0x20u);

    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v40 = 0;
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[APPromotedContentLegacyInterface sharedInstance](APPromotedContentLegacyInterface, "sharedInstance"));
    objc_initWeak(&location, self);
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_100016EB4;
    v30[3] = &unk_100218760;
    objc_copyWeak(&v36, &location);
    v35 = buf;
    v31 = v27;
    v32 = v18;
    v33 = v17;
    v37 = a9;
    v34 = v24;
    objc_msgSend(v29, "requestPromotedContentOfTypes:forContext:withToken:andBundleID:clientInfo:idAccount:completionHandler:", v31, v33, v32, v19, v22, v23, v30);

    v16 = v27;
    objc_destroyWeak(&v36);
    objc_destroyWeak(&location);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    -[APPCControllerCoordinator _handleMissingClientInfoForRequestOfTypes:forContext:](self, "_handleMissingClientInfoForRequestOfTypes:forContext:", v16, v17);
    v24[2](v24);
  }

}

- (BOOL)isBlockedForNewsSubscriber:(id)a3 bundleID:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.news")) & 1) != 0
    || objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.stocks")))
  {
    v7 = +[APConfigurationMediator configurationForClass:](APConfigurationMediator, "configurationForClass:", objc_opt_class(APCSPolicyAppleSubscriptions));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "blockAdsForSubscribers"));

    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "blockAdsForSubscribers"));
      v11 = objc_msgSend(v10, "BOOLValue");

    }
    else
    {
      v11 = 1;
    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "supplementalContext"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "objectForKey:", APSupplementalContextFeedMetadataContentProviderIdKey));

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "supplementalContext"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectForKey:", APSupplementalContextPlacementKey));

    if (v11)
      LOBYTE(v11) = +[APPCPolicyEngine isSubscriber](APPCPolicyEngine, "isSubscriber")
                 && ((objc_msgSend(v15, "isEqualToString:", APSupplementalContextInFeedKey) & 1) != 0
                  || objc_msgSend(v15, "isEqualToString:", APSupplementalContextNativeInFeedKey))
                 && objc_msgSend(v13, "intValue") == 1;

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)setMediaServiceSession:(id)a3
{
  objc_storeWeak(&self->_mediaServiceSession, a3);
}

- (id)mediaServiceSession
{
  return objc_loadWeakRetained(&self->_mediaServiceSession);
}

- (Class)mediaServiceRequestClass
{
  return self->_mediaServiceRequestClass;
}

- (void)dealloc
{
  uint64_t v3;
  NSObject *v4;
  NSUUID *requesterID;
  objc_super v6;
  uint8_t buf[4];
  NSUUID *v8;

  v3 = APLogForCategory(34);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    if (self)
      requesterID = self->_requesterID;
    else
      requesterID = 0;
    *(_DWORD *)buf = 138543362;
    v8 = requesterID;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_INFO, "Destroyed APPCControllerCoordinator for requester ID %{public}@", buf, 0xCu);
  }

  v6.receiver = self;
  v6.super_class = (Class)APPCControllerCoordinator;
  -[APPCControllerCoordinator dealloc](&v6, "dealloc");
}

- (void)_requestFromMediaWithParams:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  if (-[APPCControllerCoordinator mediaServiceRequestClass](self, "mediaServiceRequestClass"))
    v8 = -[APPCControllerCoordinator mediaServiceRequestClass](self, "mediaServiceRequestClass");
  else
    v8 = (objc_class *)APMediaServiceRequest;
  v9 = objc_alloc_init(v8);
  -[APPCControllerCoordinator _requestFromMediaApi:params:completionHandler:](self, "_requestFromMediaApi:params:completionHandler:", v9, v7, v6);

}

- (void)_requestFromMediaApi:(id)a3 params:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  _QWORD v18[4];
  id v19;
  uint64_t *v20;
  id v21[2];
  id location;
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  APMediaServiceRequester *v28;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_msgSend(v9, "placement");
  if (v11 == (id)7005)
    -[APPCControllerCoordinator setHasRunningLandingPageRequest:](self, "setHasRunningLandingPageRequest:", 1);
  v23 = 0;
  v24 = &v23;
  v25 = 0x3032000000;
  v26 = sub_10002D3D0;
  v27 = sub_10002D378;
  v28 = objc_alloc_init(APMediaServiceRequester);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerCoordinator deliveryBlock](self, "deliveryBlock"));
  objc_msgSend((id)v24[5], "setDeliveryBlock:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerCoordinator bundleID](self, "bundleID"));
  objc_msgSend((id)v24[5], "setBundleID:", v13);

  objc_initWeak(&location, self);
  v14 = (void *)v24[5];
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerCoordinator mediaServiceSession](self, "mediaServiceSession"));
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_10002D40C;
  v18[3] = &unk_100218788;
  v21[1] = v11;
  objc_copyWeak(v21, &location);
  v16 = v10;
  v19 = v16;
  v20 = &v23;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "sendRequest:params:mediaServiceSession:completionHandler:", v8, v9, v15, v18));
  -[APPCControllerCoordinator setMediaServiceSession:](self, "setMediaServiceSession:", v17);

  objc_destroyWeak(v21);
  objc_destroyWeak(&location);
  _Block_object_dispose(&v23, 8);

}

- (unint64_t)_getAppStorePlacement:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  char *v7;
  const __CFString *v8;

  v3 = a3;
  v4 = v3;
  if (!v3)
  {
    v8 = CFSTR("No context found.");
    goto LABEL_6;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "current"));

  if (!v5
    || (v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "current")),
        v7 = (char *)objc_msgSend(v6, "placement"),
        v6,
        (unint64_t)(v7 - 7009) <= 0xFFFFFFFFFFFFFFFBLL))
  {
    v8 = CFSTR("No depiction found.");
LABEL_6:
    APSimulateCrash(5, v8, 0);
    v7 = 0;
  }

  return (unint64_t)v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaServiceRequestClass, 0);
  objc_destroyWeak(&self->_mediaServiceSession);
  objc_storeStrong((id *)&self->_lock, 0);
  objc_storeStrong((id *)&self->_tokens, 0);
  objc_storeStrong(&self->_deliveryBlock, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_requesterID, 0);
}

+ (void)_sendFirstRequestMetricIfRequiredForPlacement:(unint64_t)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[2];
  _QWORD v13[2];

  if ((byte_10026D0F0 & 1) == 0)
  {
    v4 = a1;
    objc_sync_enter(v4);
    if ((byte_10026D0F0 & 1) == 0)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[APPromotedContentControllerDaemonModule daemonStartTime](APPromotedContentControllerDaemonModule, "daemonStartTime"));
      objc_msgSend(v5, "timeIntervalSinceDate:", v6);
      v8 = v7;

      v12[0] = CFSTR("Interval");
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
      v12[1] = CFSTR("Placement");
      v13[0] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
      v13[1] = v10;
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 2));

      +[APAnalytics sendEvent:customPayload:](APAnalytics, "sendEvent:customPayload:", CFSTR("FirstRequestDelay"), v11);
      byte_10026D0F0 = 1;

    }
    objc_sync_exit(v4);

  }
}

- (void)findQualifiedPlacementFromCachedData:(id)a3 forRequests:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  unsigned int v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  APPCControllerCoordinator *v18;
  uint8_t buf[4];
  void *v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "expirationDate"));
  v10 = objc_msgSend(v9, "isEarlierThan:", v8);

  if (v10)
  {
    v11 = APLogForCategory(34);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "identifier"));
      *(_DWORD *)buf = 138543362;
      v20 = v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Promoted content %{public}@ matches a request but is expired.", buf, 0xCu);

    }
  }
  else
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "placementTypes"));
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100169DA0;
    v15[3] = &unk_100218738;
    v16 = v7;
    v17 = v6;
    v18 = self;
    objc_msgSend(v14, "enumerateObjectsUsingBlock:", v15);

  }
}

- (id)queryCacheForRequests:(id)a3 managedContext:(id)a4
{
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSCountedSet setWithArray:](NSCountedSet, "setWithArray:", a3));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "managedContentDataEnumerator"));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v17 != v11)
        objc_enumerationMutation(v8);
      -[APPCControllerCoordinator findQualifiedPlacementFromCachedData:forRequests:](self, "findQualifiedPlacementFromCachedData:forRequests:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v12), v7, (_QWORD)v16);
      if (!objc_msgSend(v7, "count"))
        break;
      if (v10 == (id)++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCountedSet:](NSMutableArray, "arrayWithCountedSet:", v7));
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithArray:](NSArray, "arrayWithArray:", v13));

  return v14;
}

- (void)_handleMissingClientInfoForRequestOfTypes:(id)a3 forContext:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD);
  void *v19;
  id obj;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  void *v25;
  uint8_t v26[128];
  uint8_t buf[4];
  const __CFString *v28;

  v6 = a3;
  v7 = a4;
  v8 = APLogForCategory(34);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v28 = CFSTR("BUG ON INTEGRATOR: This app appears to be integrating with PromotedContentUI, but is making requests for Ads without having already called the [PCUI start] method.");
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "%{public}@", buf, 0xCu);
  }

  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  obj = v6;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v14, "intValue") & 0x80000000) != 0 || (int)objc_msgSend(v14, "intValue") > 9)
          v15 = -1;
        else
          v15 = (int)objc_msgSend(v14, "intValue");
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "identifier"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[APContentData createForServerUnfilledReason:placementType:contextIdentifier:](APContentData, "createForServerUnfilledReason:placementType:contextIdentifier:", 1026, v15, v16));

        v18 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[APPCControllerCoordinator deliveryBlock](self, "deliveryBlock"));
        v25 = v17;
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v25, 1));
        ((void (**)(_QWORD, void *))v18)[2](v18, v19);

      }
      v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v11);
  }

}

- (void)createContentDatasFromContext:(id)a3 unfilledReasonCode:(int64_t)a4 types:(id)a5 diagnosticCode:(int64_t)a6 completionHandler:(id)a7
{
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  _UNKNOWN **v15;
  void *i;
  void *v17;
  uint64_t v18;
  void *v19;
  APContentDataInternal *v20;
  void *v21;
  void *v22;
  _UNKNOWN **v23;
  uint64_t v24;
  void *v25;
  int64_t v26;
  void *v27;
  void (**v28)(_QWORD, _QWORD);
  void (**v29)(_QWORD);
  id v30;
  id obj;
  id v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];

  v11 = a3;
  v12 = a5;
  v29 = (void (**)(_QWORD))a7;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v12, "count")));
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  obj = v12;
  v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v33)
  {
    v14 = *(_QWORD *)v35;
    v15 = &_s10Foundation11JSONDecoderC6decode_4fromxxm_AA4DataVtKSeRzlFTj_ptr;
    v30 = v11;
    do
    {
      for (i = 0; i != v33; i = (char *)i + 1)
      {
        if (*(_QWORD *)v35 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v34 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v17, "intValue") & 0x80000000) != 0 || (int)objc_msgSend(v17, "intValue") > 9)
          v18 = -1;
        else
          v18 = (int)objc_msgSend(v17, "intValue");
        v19 = v15[506];
        v20 = (APContentDataInternal *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
        if (a4 == 1029)
        {
          objc_msgSend(v11, "maxSize");
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "createForServerUnfilledReason:placementType:contextIdentifier:size:", 1029, v18, v20));

          v20 = -[APContentDataInternal initWithContent:]([APContentDataInternal alloc], "initWithContent:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue(+[APPCControllerCoordinator _addToCacheContentData:context:](APPCControllerCoordinator, "_addToCacheContentData:context:", v20, v11));
          v23 = v15;
          v24 = v14;
          v25 = v13;
          v26 = a6;
          v27 = (void *)objc_claimAutoreleasedReturnValue(-[APPCControllerCoordinator bundleID](self, "bundleID"));
          objc_msgSend(v22, "markInUseByClientWithId:", v27);

          a6 = v26;
          v13 = v25;
          v14 = v24;
          v15 = v23;
          a4 = 1029;
          v11 = v30;
          objc_msgSend(v22, "markUsed");

        }
        else
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "createForServerUnfilledReason:placementType:contextIdentifier:", a4, v18, v20));
        }

        objc_msgSend(v21, "setDiagnosticCode:", a6);
        objc_msgSend(v13, "addObject:", v21);

      }
      v33 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v33);
  }

  v28 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[APPCControllerCoordinator deliveryBlock](self, "deliveryBlock"));
  ((void (**)(_QWORD, void *))v28)[2](v28, v13);

  v29[2](v29);
}

- (void)setTokens:(id)a3
{
  objc_storeStrong((id *)&self->_tokens, a3);
}

- (BOOL)hasRunningLandingPageRequest
{
  return self->_hasRunningLandingPageRequest;
}

- (void)setHasRunningLandingPageRequest:(BOOL)a3
{
  self->_hasRunningLandingPageRequest = a3;
}

- (void)setMediaServiceRequestClass:(Class)a3
{
  objc_storeStrong((id *)&self->_mediaServiceRequestClass, a3);
}

@end
