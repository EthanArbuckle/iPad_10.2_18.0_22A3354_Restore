@implementation APPromotedContentLegacyInterface

- (void)requestPromotedContentOfTypes:(id)a3 forContext:(id)a4 withToken:(id)a5 andBundleID:(id)a6 clientInfo:(id)a7 idAccount:(id)a8 completionHandler:(id)a9
{
  -[APPromotedContentLegacyInterface requestPromotedContentOfTypesWithoutAccumulating:forContext:withToken:andBundleID:clientInfo:idAccount:completionHandler:](self, "requestPromotedContentOfTypesWithoutAccumulating:forContext:withToken:andBundleID:clientInfo:idAccount:completionHandler:", a3, a4, a5, a6, a7, a8);
}

- (void)requestPromotedContentOfTypesWithoutAccumulating:(id)a3 forContext:(id)a4 withToken:(id)a5 andBundleID:(id)a6 clientInfo:(id)a7 idAccount:(id)a8 completionHandler:(id)a9
{
  id v14;
  id v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  NSObject *v20;
  id v21;
  id v22;
  id v23;
  uint64_t v24;
  void *i;
  void *v26;
  APAdRequestParameters *v27;
  void *v28;
  APAdRequestParameters *v29;
  void *v30;
  void *v31;
  APAdRequester *v32;
  APAdRequester *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  uint64_t v38;
  APPromotedContentLegacyInterface *v39;
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t v49[128];
  uint8_t buf[4];
  const char *v51;
  __int16 v52;
  void *v53;
  __int16 v54;
  id v55;

  v14 = a3;
  v43 = a4;
  v44 = a6;
  v15 = a7;
  v16 = a8;
  v42 = a9;
  v17 = APLogForCategory(21);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "identifier"));
    *(_DWORD *)buf = 136315650;
    v51 = "-[APPromotedContentLegacyInterface requestPromotedContentOfTypesWithoutAccumulating:forContext:withToken:andBu"
          "ndleID:clientInfo:idAccount:completionHandler:]";
    v52 = 2114;
    v53 = v19;
    v54 = 2114;
    v55 = v44;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_INFO, "%s: bundleID for context %{public}@ is %{public}@.", buf, 0x20u);

  }
  if (objc_msgSend(v14, "count"))
  {
    v39 = self;
    v40 = v15;
    v20 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", objc_msgSend(v14, "count")));
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v41 = v14;
    v21 = v14;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
    if (v22)
    {
      v23 = v22;
      v24 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v23; i = (char *)i + 1)
        {
          if (*(_QWORD *)v46 != v24)
            objc_enumerationMutation(v21);
          v26 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * (_QWORD)i);
          v27 = [APAdRequestParameters alloc];
          v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
          v29 = -[APAdRequestParameters initWithContext:bundleID:identifier:placement:completionHandler:](v27, "initWithContext:bundleID:identifier:placement:completionHandler:", v43, v44, v28, objc_msgSend(v26, "integerValue"), v42);

          -[NSObject addObject:](v20, "addObject:", v29);
        }
        v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v45, v49, 16);
      }
      while (v23);
    }

    v30 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface adRequesterLock](v39, "adRequesterLock"));
    objc_msgSend(v30, "lock");

    v31 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface adRequesters](v39, "adRequesters"));
    v32 = (APAdRequester *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "objectForKeyedSubscript:", v44));

    v15 = v40;
    if (!v32)
    {
      v33 = [APAdRequester alloc];
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
      v32 = -[APAdRequester initWithBundleID:identifier:clientInfo:idAccount:accumulateRequests:](v33, "initWithBundleID:identifier:clientInfo:idAccount:accumulateRequests:", v44, v34, v40, v16, 0);

      v35 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface adRequesters](v39, "adRequesters"));
      objc_msgSend(v35, "setObject:forKeyedSubscript:", v32, v44);

    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface adRequesterLock](v39, "adRequesterLock"));
    objc_msgSend(v36, "unlock");

    v37 = -[NSObject copy](v20, "copy");
    -[APAdRequester requestAds:](v32, "requestAds:", v37);

    v14 = v41;
  }
  else
  {
    v38 = APLogForCategory(21);
    v20 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Placement types list is empty, nothing to request.", buf, 2u);
    }
  }

}

- (NSMutableDictionary)adRequesters
{
  return self->_adRequesters;
}

- (APUnfairLock)adRequesterLock
{
  return self->_adRequesterLock;
}

+ (id)sharedInstance
{
  if (qword_100269748 != -1)
    dispatch_once(&qword_100269748, &stru_1002146E0);
  return (id)qword_100269740;
}

- (void)setRateLimitsLastUpdatedOn:(double)a3
{
  self->_rateLimitsLastUpdatedOn = a3;
}

- (void)setRateLimits:(id)a3
{
  objc_storeStrong((id *)&self->_rateLimits, a3);
}

- (void)setRateLimitRequestsInFeed:(float)a3 inArticle:(float)a4 betweenArticle:(float)a5 videoInArticle:(float)a6 nativeInFeed:(float)a7 nativeInArticle:(float)a8
{
  void *v15;
  void *v16;
  APRateLimits *v17;
  double v18;
  void *v19;
  APRateLimitSettings *v20;
  id *v21;

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (v21 = (id *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface _loadRateLimitsFromUserDefaults](self, "_loadRateLimitsFromUserDefaults"))) != 0)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface rateLimitLock](self, "rateLimitLock"));
    objc_msgSend(v15, "lock");
    -[APPromotedContentLegacyInterface setRateLimits:](self, "setRateLimits:", v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    objc_msgSend(v16, "timeIntervalSince1970");
    -[APPromotedContentLegacyInterface setRateLimitsLastUpdatedOn:](self, "setRateLimitsLastUpdatedOn:");

    objc_msgSend(v15, "unlock");
  }
  else
  {
    v17 = [APRateLimits alloc];
    *(float *)&v18 = a3;
    v21 = sub_1000044D0((id *)&v17->super.isa, v18, a4, a5, a6, a7, a8);
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface rateLimitLock](self, "rateLimitLock"));
    objc_msgSend(v19, "lock");
    v20 = objc_alloc_init(APRateLimitSettings);
    -[APRateLimitSettings setLastUpdated:](v20, "setLastUpdated:", v15);
    -[APRateLimitSettings setRateLimitsObject:](v20, "setRateLimitsObject:", v21);
    objc_msgSend(v15, "timeIntervalSince1970");
    -[APPromotedContentLegacyInterface setRateLimitsLastUpdatedOn:](self, "setRateLimitsLastUpdatedOn:");
    -[APPromotedContentLegacyInterface setRateLimits:](self, "setRateLimits:", v21);
    objc_msgSend(v19, "unlock");

  }
}

- (APUnfairLock)rateLimitLock
{
  return self->_rateLimitLock;
}

- (id)_loadRateLimitsFromUserDefaults
{
  id v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  id *v7;
  _QWORD v9[4];
  id v10;
  id v11;
  _QWORD v12[6];
  _QWORD v13[6];

  v2 = objc_alloc((Class)NSUserDefaults);
  v3 = objc_msgSend(v2, "initWithSuiteName:", APDefaultsBundleID);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "dictionaryForKey:", CFSTR("RateLimits")));
  if (v4)
  {
    v12[0] = kAPMetricInternalMessageInFeedRateKey;
    v12[1] = kAPMetricInternalMessageInArticleRateKey;
    v13[0] = &off_100229060;
    v13[1] = &off_100229078;
    v12[2] = kAPMetricInternalMessageBetweenArticleRateKey;
    v12[3] = kAPMetricInternalMessageVideoInArticleRateKey;
    v13[2] = &off_100229090;
    v13[3] = &off_1002290A8;
    v12[4] = kAPMetricInternalMessageNativeInFeedRateKey;
    v12[5] = kAPMetricInternalMessageNativeInArticleRateKey;
    v13[4] = &off_1002290C0;
    v13[5] = &off_1002290D8;
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v13, v12, 6));
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_1000D097C;
    v9[3] = &unk_100214708;
    v10 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v5, "count")));
    v11 = v4;
    v6 = v10;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v9);
    v7 = sub_1000028C0((id *)[APRateLimits alloc], v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (APPromotedContentLegacyInterface)init
{
  APPromotedContentLegacyInterface *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  APUnfairLock *v5;
  APUnfairLock *rateLimitLock;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)APPromotedContentLegacyInterface;
  v2 = -[APPromotedContentLegacyInterface init](&v8, "init");
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.ap.pclegacyinterface", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = (APUnfairLock *)objc_msgSend(objc_alloc((Class)APUnfairLock), "initWithOptions:", 1);
    rateLimitLock = v2->_rateLimitLock;
    v2->_rateLimitLock = v5;

    -[APPromotedContentLegacyInterface _loadRateLimitSettings](v2, "_loadRateLimitSettings");
  }
  return v2;
}

- (void)requestPromotedContentOfTypesAccumulating:(id)a3 forContext:(id)a4 withToken:(id)a5 andBundleID:(id)a6 clientInfo:(id)a7 idAccount:(id)a8 completionHandler:(id)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  APAdRequester *v27;
  APAdRequester *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  id v34;
  id v35;
  uint64_t v36;
  void *i;
  APAdRequestParameters *v38;
  id v39;
  APAdRequester *v40;
  uint64_t v41;
  uint64_t v42;
  NSObject *v43;
  NSObject *v44;
  char *v45;
  void *v46;
  void *v47;
  APAdRequester *v48;
  id v49;
  id v50;
  NSObject *v51;
  id v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _QWORD block[5];
  uint8_t v58[128];
  uint8_t buf[4];
  const char *v60;
  __int16 v61;
  void *v62;
  __int16 v63;
  id v64;

  v15 = a3;
  v52 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = a9;
  v21 = APLogForCategory(21);
  v22 = objc_claimAutoreleasedReturnValue(v21);
  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "identifier"));
    *(_DWORD *)buf = 136315650;
    v60 = "-[APPromotedContentLegacyInterface requestPromotedContentOfTypesAccumulating:forContext:withToken:andBundleID:"
          "clientInfo:idAccount:completionHandler:]";
    v61 = 2114;
    v62 = v23;
    v63 = 2114;
    v64 = v17;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_INFO, "%s: bundleID for context %{public}@ is %{public}@.", buf, 0x20u);

  }
  if (objc_msgSend(v15, "count"))
  {
    v24 = objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface _rateLimitPlacementTypes:context:token:completionHandler:](self, "_rateLimitPlacementTypes:context:token:completionHandler:", v15, v52, v16, v20));
    if (-[NSObject count](v24, "count"))
    {
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000D088C;
      block[3] = &unk_100212FE0;
      block[4] = self;
      v51 = v24;
      if (qword_100269750 != -1)
        dispatch_once(&qword_100269750, block);
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface adRequesterLock](self, "adRequesterLock"));
      objc_msgSend(v25, "lock");

      v26 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface adRequesters](self, "adRequesters"));
      v27 = (APAdRequester *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "objectForKeyedSubscript:", v17));

      if (!v27)
      {
        if (!v17)
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface adRequesterLock](self, "adRequesterLock"));
          objc_msgSend(v46, "unlock");

          v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "identifier"));
          v40 = (APAdRequester *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Request from context %@ is missing the bundle identifier. Cannot create ad requester."), v47));

          APSimulateCrash(5, v40, 0);
          (*((void (**)(id, _QWORD, _QWORD))v20 + 2))(v20, 0, 0);
LABEL_18:

          v24 = v51;
          goto LABEL_24;
        }
        v28 = [APAdRequester alloc];
        v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSUUID UUID](NSUUID, "UUID"));
        v27 = -[APAdRequester initWithBundleID:identifier:clientInfo:idAccount:accumulateRequests:](v28, "initWithBundleID:identifier:clientInfo:idAccount:accumulateRequests:", v17, v29, v18, v19, 1);

        v30 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface adRequesters](self, "adRequesters"));
        objc_msgSend(v30, "setObject:forKeyedSubscript:", v27, v17);

      }
      v48 = v27;
      v49 = v18;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface adRequesterLock](self, "adRequesterLock"));
      objc_msgSend(v31, "unlock");

      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v53 = 0u;
      v54 = 0u;
      v55 = 0u;
      v56 = 0u;
      v50 = v15;
      v33 = v15;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v54;
        do
        {
          for (i = 0; i != v35; i = (char *)i + 1)
          {
            if (*(_QWORD *)v54 != v36)
              objc_enumerationMutation(v33);
            v38 = -[APAdRequestParameters initWithContext:bundleID:identifier:placement:completionHandler:]([APAdRequestParameters alloc], "initWithContext:bundleID:identifier:placement:completionHandler:", v52, v17, v16, objc_msgSend(*(id *)(*((_QWORD *)&v53 + 1) + 8 * (_QWORD)i), "unsignedIntValue"), v20);
            objc_msgSend(v32, "addObject:", v38);

          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
        }
        while (v35);
      }

      v39 = objc_msgSend(v32, "copy");
      v40 = v48;
      -[APAdRequester accumulateAdRequests:](v48, "accumulateAdRequests:", v39);

      v18 = v49;
      v15 = v50;
      goto LABEL_18;
    }
    v42 = APLogForCategory(21);
    v43 = objc_claimAutoreleasedReturnValue(v42);
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      v44 = v24;
      v45 = (char *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "identifier"));
      *(_DWORD *)buf = 138543362;
      v60 = v45;
      _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_INFO, "All content types filtered out for context %{public}@", buf, 0xCu);

      v24 = v44;
    }

  }
  else
  {
    v41 = APLogForCategory(21);
    v24 = objc_claimAutoreleasedReturnValue(v41);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Placement types list is empty, nothing to request.", buf, 2u);
    }
  }
LABEL_24:

}

- (void)_handleAdRequesterResponseForToken:(id)a3 internalContent:(id)a4 completionHandler:(id)a5
{
  id v8;
  void (**v9)(id, id);
  APPromotedContentLegacyInterface *v10;
  id v11;

  v11 = a3;
  v8 = a4;
  v9 = (void (**)(id, id))a5;
  v10 = self;
  objc_sync_enter(v10);
  v9[2](v9, v8);
  objc_sync_exit(v10);

}

- (void)_loadRateLimitSettings
{
  APRateLimits *v3;
  APRateLimits *rateLimits;
  APRateLimits *v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  APRateLimitSettings *v13;

  if (+[APSystemInternal isAppleInternalInstall](APSystemInternal, "isAppleInternalInstall")&& (v3 = (APRateLimits *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface _loadRateLimitsFromUserDefaults](self, "_loadRateLimitsFromUserDefaults"))) != 0)
  {
    rateLimits = self->_rateLimits;
    self->_rateLimits = v3;
    v5 = v3;

    v13 = (APRateLimitSettings *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
    -[APRateLimitSettings timeIntervalSince1970](v13, "timeIntervalSince1970");
    self->_rateLimitsLastUpdatedOn = v6;
  }
  else
  {
    v13 = objc_alloc_init(APRateLimitSettings);
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[APRateLimitSettings lastUpdated](v13, "lastUpdated"));
    if (v7)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
      objc_msgSend(v8, "timeIntervalSinceDate:", v7);
      v10 = v9;

      if (v10 <= 86400.0)
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[APRateLimitSettings rateLimitsObject](v13, "rateLimitsObject"));
        if (v13)
        {
          objc_storeStrong((id *)&self->_rateLimits, v11);
          objc_msgSend(v7, "timeIntervalSince1970");
          self->_rateLimitsLastUpdatedOn = v12;
        }

      }
      else
      {
        -[APRateLimitSettings setLastUpdated:](v13, "setLastUpdated:", 0);
        -[APRateLimitSettings setRateLimitsObject:](v13, "setRateLimitsObject:", 0);
      }
    }

  }
}

- (id)_currentRateLimits
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  APRateLimitSettings *v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  uint8_t v15[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v3, "timeIntervalSince1970");
  v5 = v4;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface rateLimitLock](self, "rateLimitLock"));
  objc_msgSend(v6, "lock");
  -[APPromotedContentLegacyInterface rateLimitsLastUpdatedOn](self, "rateLimitsLastUpdatedOn");
  v8 = v7;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface rateLimits](self, "rateLimits"));
  if (!v9 || v8 == 0.0)
  {

  }
  else
  {

    if (v5 - v8 > 86400.0)
    {
      v10 = objc_alloc_init(APRateLimitSettings);
      -[APRateLimitSettings setLastUpdated:](v10, "setLastUpdated:", 0);
      -[APRateLimitSettings setRateLimitsObject:](v10, "setRateLimitsObject:", 0);
      -[APPromotedContentLegacyInterface setRateLimits:](self, "setRateLimits:", 0);
      -[APPromotedContentLegacyInterface setRateLimitsLastUpdatedOn:](self, "setRateLimitsLastUpdatedOn:", 0.0);
      v11 = APLogForCategory(21);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_INFO, "Rate limit was expired. Setting it to 1.0.", v15, 2u);
      }

    }
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface rateLimits](self, "rateLimits"));
  objc_msgSend(v6, "unlock");

  return v13;
}

- (id)_rateLimitPlacementTypes:(id)a3 context:(id)a4 token:(id)a5 completionHandler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  float v14;
  float v15;
  uint64_t v16;
  NSObject *v17;
  id v18;
  const __CFString *v19;
  void *v20;
  id v21;
  id v22;
  id v23;
  id v24;
  uint64_t v25;
  void *i;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  _BYTE *v31;
  uint64_t v32;
  double v33;
  id v34;
  uint64_t v35;
  NSObject *v36;
  const char *v37;
  uint64_t v38;
  void *v40;
  id v41;
  id v42;
  double v43;
  _QWORD block[5];
  id v45;
  id v46;
  id v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  uint8_t v52[128];
  uint8_t buf[4];
  uint64_t v54;
  __int16 v55;
  double v56;
  __int16 v57;
  uint64_t v58;
  __int16 v59;
  uint64_t v60;
  __int16 v61;
  double v62;

  v10 = a3;
  v11 = a4;
  v43 = COERCE_DOUBLE(a5);
  v42 = a6;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface _currentRateLimits](self, "_currentRateLimits"));
  if (!v12)
  {
    v35 = APLogForCategory(21);
    v36 = objc_claimAutoreleasedReturnValue(v35);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 141558274;
      v54 = 1752392040;
      v55 = 2112;
      v56 = v43;
      v37 = "No rate limits set, sending all requests. Token: %{mask.hash}@";
LABEL_25:
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_INFO, v37, buf, 0x16u);
    }
LABEL_26:

    v34 = v10;
    goto LABEL_27;
  }
  v13 = objc_msgSend(v11, "adPosition");
  v14 = sub_1000BFFC0(v12, (uint64_t)v13);
  if (v14 >= 1.0)
  {
    v38 = APLogForCategory(21);
    v36 = objc_claimAutoreleasedReturnValue(v38);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 141558274;
      v54 = 1752392040;
      v55 = 2112;
      v56 = v43;
      v37 = "Rate limit is 1.0, sending all requests. Token: %{mask.hash}@";
      goto LABEL_25;
    }
    goto LABEL_26;
  }
  v40 = v12;
  if (v14 >= 0.0)
    v15 = v14;
  else
    v15 = 0.0;
  v16 = APLogForCategory(21);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = objc_msgSend(v10, "count");
    v19 = adPositionToString((unint64_t)v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue(v19);
    *(_DWORD *)buf = 134219010;
    v54 = (uint64_t)v18;
    v55 = 2048;
    v56 = v15;
    v57 = 2114;
    v58 = (uint64_t)v20;
    v59 = 2160;
    v60 = 1752392040;
    v61 = 2112;
    v62 = v43;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "Rate limiting %lu request(s) using %f rate. Ad position: %{public}@. Token: %{mask.hash}@", buf, 0x34u);

  }
  v21 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v10, "count"));
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v41 = v10;
  v22 = v10;
  v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
  if (v23)
  {
    v24 = v23;
    v25 = *(_QWORD *)v49;
    do
    {
      for (i = 0; i != v24; i = (char *)i + 1)
      {
        if (*(_QWORD *)v49 != v25)
          objc_enumerationMutation(v22);
        v27 = *(_QWORD *)(*((_QWORD *)&v48 + 1) + 8 * (_QWORD)i);
        if (arc4random_uniform(0x3E8u) >= (float)(v15 * 1000.0))
        {
          v28 = objc_claimAutoreleasedReturnValue(-[APPromotedContentLegacyInterface queue](self, "queue"));
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1000D1138;
          block[3] = &unk_100214730;
          block[4] = v27;
          v45 = v11;
          v46 = *(id *)&v43;
          v47 = v42;
          dispatch_async(v28, block);

        }
        else
        {
          objc_msgSend(v21, "addObject:", v27);
        }
      }
      v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v48, v52, 16);
    }
    while (v24);
  }

  v29 = APLogForCategory(21);
  v30 = objc_claimAutoreleasedReturnValue(v29);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
  {
    v31 = objc_msgSend(v22, "count");
    v32 = v31 - (_BYTE *)objc_msgSend(v21, "count");
    v33 = COERCE_DOUBLE(objc_msgSend(v21, "count"));
    *(_DWORD *)buf = 134218754;
    v54 = v32;
    v55 = 2048;
    v56 = v33;
    v57 = 2160;
    v58 = 1752392040;
    v59 = 2112;
    v60 = *(_QWORD *)&v43;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_INFO, "Rate limited: %ld request(s). Going to send: %ld request(s). Token: %{mask.hash}@", buf, 0x2Au);
  }

  v34 = objc_msgSend(v21, "copy");
  v10 = v41;
  v12 = v40;
LABEL_27:

  return v34;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (APRateLimits)rateLimits
{
  return self->_rateLimits;
}

- (double)rateLimitsLastUpdatedOn
{
  return self->_rateLimitsLastUpdatedOn;
}

- (void)setAdRequesters:(id)a3
{
  objc_storeStrong((id *)&self->_adRequesters, a3);
}

- (void)setAdRequesterLock:(id)a3
{
  objc_storeStrong((id *)&self->_adRequesterLock, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_adRequesterLock, 0);
  objc_storeStrong((id *)&self->_adRequesters, 0);
  objc_storeStrong((id *)&self->_rateLimits, 0);
  objc_storeStrong((id *)&self->_rateLimitLock, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
