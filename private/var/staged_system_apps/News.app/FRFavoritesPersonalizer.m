@implementation FRFavoritesPersonalizer

- (void)setAutofavorites:(id)a3
{
  id v5;
  id v6;

  objc_storeStrong((id *)&self->_autofavorites, a3);
  v5 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer configurationStore](self, "configurationStore"));
  objc_msgSend(v6, "setAutoFavorites:", v5);

}

- (FRFavoritesPersonalizer)initWithCloudContext:(id)a3
{
  id v4;
  id v5;
  void *v6;
  FRFavoritesPersonalizer *v7;

  v4 = a3;
  if (!v4 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_10007AE04();
  v5 = FRURLForNewsPersonalizationDirectory();
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = -[FRFavoritesPersonalizer initWithCloudContext:storePath:](self, "initWithCloudContext:storePath:", v4, v6);

  return v7;
}

- (void)setLocationManager:(id)a3
{
  TSLocationDetectionManagerType *v4;
  TSLocationDetectionManagerType *v5;
  void *v6;
  void *v7;
  void *v8;
  TSLocationDetectionManagerType *locationManager;
  _QWORD v10[5];

  v4 = (TSLocationDetectionManagerType *)a3;
  v5 = v4;
  if (v4)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[TSLocationDetectionManagerType observableMostFrequentLocation](v4, "observableMostFrequentLocation"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_100030A74;
    v10[3] = &unk_1000DB078;
    v10[4] = self;
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "observe:", v10));
    -[FRFavoritesPersonalizer setLocationObserver:](self, "setLocationObserver:", v7);

  }
  else
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer locationObserver](self, "locationObserver"));
    objc_msgSend(v8, "dispose");

    -[FRFavoritesPersonalizer setLocationObserver:](self, "setLocationObserver:", 0);
  }
  locationManager = self->_locationManager;
  self->_locationManager = v5;

}

- (void)maybeRemovePersonalizationEngineData
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;

  v2 = FRURLForNewsAppCachesDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "path"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("PersonalizationStore")));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
  LODWORD(v4) = objc_msgSend(v6, "fileExistsAtPath:", v5);

  if ((_DWORD)v4)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v10 = 0;
    objc_msgSend(v7, "removeItemAtPath:error:", v5, &v10);
    v8 = v10;

    v9 = (void *)FCDefaultLog;
    if (os_log_type_enabled(FCDefaultLog, OS_LOG_TYPE_ERROR))
      sub_10007BC74(v9, v8);

  }
}

- (void)refreshAutoFavoritesInBackgroundDisregardingCache:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned __int8 v14;
  uint64_t v15;
  NSObject *v16;
  _QWORD block[5];
  BOOL v18;
  _QWORD v19[5];

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer cloudContext](self, "cloudContext"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "appConfigurationManager"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "possiblyUnfetchedAppConfiguration"));
  v8 = objc_msgSend(v7, "enableNewsPersonalizationAutoFavorites");

  if (v8)
  {
    sub_100032E0C();
  }
  else
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer cloudContext](self, "cloudContext"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "userInfo"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "canonicalLanguage"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "primaryLanguageCode"));
    v14 = objc_msgSend(v11, "isEqualToString:", v13);

    if ((v14 & 1) != 0)
    {
      objc_msgSend((id)objc_opt_class(self, v15), "logPPMessage:", &stru_1000DB4A0);
      v16 = objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer storeQueue](self, "storeQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100005D60;
      block[3] = &unk_1000DB580;
      block[4] = self;
      v18 = a3;
      dispatch_async(v16, block);

    }
    else
    {
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100032E70;
      v19[3] = &unk_1000D9758;
      v19[4] = self;
      sub_100032E70((uint64_t)v19);
    }
  }
}

- (void)fetchMappingResourcesWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void **v13;
  uint64_t v14;
  id (*v15)(uint64_t);
  void *v16;
  FRFavoritesPersonalizer *v17;
  id v18;
  __int128 v19;
  uint8_t buf[4];
  void *v21;

  v4 = a3;
  +[NSThread isMainThread](NSThread, "isMainThread");
  objc_msgSend((id)objc_opt_class(self, v5), "logPPMessage:", &stru_1000DB098);
  v13 = _NSConcreteStackBlock;
  v14 = 3221225472;
  v15 = sub_1000115B0;
  v16 = &unk_1000DB200;
  v17 = self;
  v19 = xmmword_1000D0AE0;
  v6 = v4;
  v18 = v6;
  v7 = sub_1000115B0((uint64_t)&v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  v9 = (void *)FCPersonalizationLog;
  if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "shortOperationDescription", v13, v14, v15, v16, v17));
    *(_DWORD *)buf = 138543362;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Will issue fetch operation %{public}@ for mapping resources", buf, 0xCu);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSOperationQueue fc_sharedConcurrentQueue](NSOperationQueue, "fc_sharedConcurrentQueue", v13, v14, v15, v16, v17));
  objc_msgSend(v12, "addOperation:", v8);

}

- (void)_saveReadableAllowlist
{
  _QWORD v3[5];

  if (NFInternalBuild(self))
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_10003053C;
    v3[3] = &unk_1000D9758;
    v3[4] = self;
    +[FCTaskScheduler scheduleLowPriorityBlock:](FCTaskScheduler, "scheduleLowPriorityBlock:", v3);
  }
}

+ (void)logPPMessage:(id)a3
{
  void *v4;
  uint64_t (*v5)(id);
  NSObject *v6;
  uint64_t v7;
  void *v8;
  int v9;
  void *v10;

  v4 = (void *)FCProgressivePersonalizationLog;
  if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEBUG))
  {
    v5 = (uint64_t (*)(id))*((_QWORD *)a3 + 2);
    v6 = v4;
    v7 = v5(a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v9 = 138412290;
    v10 = v8;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEBUG, "%@", (uint8_t *)&v9, 0xCu);

  }
}

- (id)_createNewAutoFavoritesOperation
{
  FRPersonalizationAutoFavoritesOperation *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;

  v3 = objc_alloc_init(FRPersonalizationAutoFavoritesOperation);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer autoFavoritesCursor](self, "autoFavoritesCursor"));
  -[FRPersonalizationAutoFavoritesOperation setCursor:](v3, "setCursor:", v4);

  -[FRPersonalizationAutoFavoritesOperation setSignalProcessingTimeInterval:](v3, "setSignalProcessingTimeInterval:", 21600.0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer configurableValues](self, "configurableValues"));
  -[FRPersonalizationAutoFavoritesOperation setConfigurableValues:](v3, "setConfigurableValues:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer configurationStore](self, "configurationStore"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "urlMapping"));
  -[FRPersonalizationAutoFavoritesOperation setUrlMapping:](v3, "setUrlMapping:", v7);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer configurationStore](self, "configurationStore"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "bundleIDMapping"));
  -[FRPersonalizationAutoFavoritesOperation setBundleIDMapping:](v3, "setBundleIDMapping:", v9);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer configurationStore](self, "configurationStore"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "whitelist"));
  -[FRPersonalizationAutoFavoritesOperation setWhitelist:](v3, "setWhitelist:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer configurationStore](self, "configurationStore"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "favorabilityScores"));
  -[FRPersonalizationAutoFavoritesOperation setFavorabilityScores:](v3, "setFavorabilityScores:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer cloudContext](self, "cloudContext"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "localAreasManager"));
  -[FRPersonalizationAutoFavoritesOperation setLocalAreasManager:](v3, "setLocalAreasManager:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer subscriptionController](self, "subscriptionController"));
  -[FRPersonalizationAutoFavoritesOperation setSubscriptionController:](v3, "setSubscriptionController:", v16);

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer cloudContext](self, "cloudContext"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "tagController"));
  -[FRPersonalizationAutoFavoritesOperation setTagController:](v3, "setTagController:", v18);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer userInfo](self, "userInfo"));
  -[FRPersonalizationAutoFavoritesOperation setUserInfo:](v3, "setUserInfo:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer tagRanker](self, "tagRanker"));
  -[FRPersonalizationAutoFavoritesOperation setTagRanker:](v3, "setTagRanker:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer aggregateStoreProvider](self, "aggregateStoreProvider"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "aggregateStore"));
  -[FRPersonalizationAutoFavoritesOperation setAggregateStore:](v3, "setAggregateStore:", v22);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer locationManager](self, "locationManager"));
  -[FRPersonalizationAutoFavoritesOperation setLocationManager:](v3, "setLocationManager:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer cloudContext](self, "cloudContext"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "appConfigurationManager"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "appConfiguration"));
  -[FRPersonalizationAutoFavoritesOperation setAppConfiguration:](v3, "setAppConfiguration:", v26);

  return v3;
}

- (FCCloudContext)cloudContext
{
  return self->_cloudContext;
}

- (FRPersonalizationConfiguration)configurationStore
{
  return self->_configurationStore;
}

- (FRFavoritesPersonalizer)initWithCloudContext:(id)a3 storePath:(id)a4
{
  id v7;
  id v8;
  FRFavoritesPersonalizer *v9;
  FRFavoritesPersonalizer *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  unsigned int v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  FCSubscriptionController *subscriptionController;
  uint64_t v22;
  FCPurchaseController *purchaseController;
  uint64_t v24;
  FCBundleSubscriptionManagerType *bundleSubscriptionManager;
  uint64_t v26;
  FCUserInfo *userInfo;
  uint64_t v28;
  FCNewsAppConfigurationManager *appConfigurationManager;
  dispatch_queue_t v30;
  OS_dispatch_queue *storeQueue;
  NSObject *v32;
  id v33;
  FRFavoritesPersonalizer *v34;
  uint64_t v35;
  FCPersonalizationAggregateStore *aggregateStore;
  id v37;
  void *v38;
  FCKeyValueStore *v39;
  FCKeyValueStore *hourlyFlowRateHighWaterMarkValueStore;
  FCAsyncSerialQueue *v41;
  FCAsyncSerialQueue *autoFavoritesQueue;
  void *v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  void *v47;
  FRFavoritesPersonalizer *v48;
  NSObject *v49;
  void *v50;
  FRFavoritesPersonalizer *v51;
  _QWORD v53[4];
  FRFavoritesPersonalizer *v54;
  _QWORD v55[4];
  FRFavoritesPersonalizer *v56;
  _QWORD v57[4];
  FRFavoritesPersonalizer *v58;
  uint8_t buf[8];
  _QWORD block[4];
  id v61;
  FRFavoritesPersonalizer *v62;
  objc_super v63;

  v7 = a3;
  v8 = a4;
  v63.receiver = self;
  v63.super_class = (Class)FRFavoritesPersonalizer;
  v9 = -[FRFavoritesPersonalizer init](&v63, "init");
  v10 = v9;
  if (v9)
  {
    if (NFInternalBuild(v9))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
      v12 = FRURLForNewsPersonalizationDirectory();
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "URLByAppendingPathComponent:", CFSTR("knowledgeC.db")));
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "path"));
      v16 = objc_msgSend(v11, "fileExistsAtPath:", v15);

      if (v16)
      {
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
        v18 = FRURLForNewsPersonalizationDirectory();
        v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
        objc_msgSend(v17, "fc_quicklyClearDirectory:callbackQueue:completion:", v19, &_dispatch_main_q, &stru_1000DAF00);

      }
    }
    objc_storeStrong((id *)&v10->_cloudContext, a3);
    v20 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subscriptionController"));
    subscriptionController = v10->_subscriptionController;
    v10->_subscriptionController = (FCSubscriptionController *)v20;

    -[FCSubscriptionController addObserver:](v10->_subscriptionController, "addObserver:", v10);
    v22 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "purchaseController"));
    purchaseController = v10->_purchaseController;
    v10->_purchaseController = (FCPurchaseController *)v22;

    v24 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "bundleSubscriptionManager"));
    bundleSubscriptionManager = v10->_bundleSubscriptionManager;
    v10->_bundleSubscriptionManager = (FCBundleSubscriptionManagerType *)v24;

    v26 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
    userInfo = v10->_userInfo;
    v10->_userInfo = (FCUserInfo *)v26;

    v28 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "appConfigurationManager"));
    appConfigurationManager = v10->_appConfigurationManager;
    v10->_appConfigurationManager = (FCNewsAppConfigurationManager *)v28;

    v30 = dispatch_queue_create("FRPersonalizationDataSource.store", 0);
    storeQueue = v10->_storeQueue;
    v10->_storeQueue = (OS_dispatch_queue *)v30;

    v32 = objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer storeQueue](v10, "storeQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10002FD7C;
    block[3] = &unk_1000D97A8;
    v33 = v8;
    v61 = v33;
    v34 = v10;
    v62 = v34;
    dispatch_async(v32, block);

    -[FCNewsAppConfigurationManager addAppConfigObserver:](v10->_appConfigurationManager, "addAppConfigObserver:", v34);
    v35 = objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "personalizationData"));
    aggregateStore = v34->_aggregateStore;
    v34->_aggregateStore = (FCPersonalizationAggregateStore *)v35;

    v37 = objc_alloc((Class)FCKeyValueStore);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "path"));
    v39 = (FCKeyValueStore *)objc_msgSend(v37, "initWithName:directory:version:options:classRegistry:", CFSTR("HourlyFlowRateHighWaterMarks"), v38, 1, 0, 0);
    hourlyFlowRateHighWaterMarkValueStore = v34->_hourlyFlowRateHighWaterMarkValueStore;
    v34->_hourlyFlowRateHighWaterMarkValueStore = v39;

    v41 = (FCAsyncSerialQueue *)objc_msgSend(objc_alloc((Class)FCAsyncSerialQueue), "initWithQualityOfService:", 25);
    autoFavoritesQueue = v34->_autoFavoritesQueue;
    v34->_autoFavoritesQueue = v41;

    v43 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    LODWORD(v38) = objc_msgSend(v43, "BOOLForKey:", FCPersonalizationClearSuggestions);

    if ((_DWORD)v38)
    {
      v44 = FCPersonalizationLog;
      if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Will clear suggestions", buf, 2u);
      }
      v45 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer autoFavoritesQueue](v34, "autoFavoritesQueue"));
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_10002FF14;
      v57[3] = &unk_1000DAF78;
      v58 = v34;
      objc_msgSend(v45, "enqueueBlockForMainThread:", v57);

    }
    v46 = FCPersonalizationLog;
    if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Will fetch mapping resources", buf, 2u);
    }
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer autoFavoritesQueue](v34, "autoFavoritesQueue"));
    v55[0] = _NSConcreteStackBlock;
    v55[1] = 3221225472;
    v55[2] = sub_1000300F0;
    v55[3] = &unk_1000DAF78;
    v48 = v34;
    v56 = v48;
    objc_msgSend(v47, "enqueueBlock:", v55);

    v49 = FCPersonalizationLog;
    if (os_log_type_enabled(FCPersonalizationLog, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Will process events from Today widget", buf, 2u);
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer autoFavoritesQueue](v48, "autoFavoritesQueue"));
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_100030274;
    v53[3] = &unk_1000DAF78;
    v51 = v48;
    v54 = v51;
    objc_msgSend(v50, "enqueueBlock:", v53);

    -[FRFavoritesPersonalizer processExistingData](v51, "processExistingData");
  }

  return v10;
}

- (FCAsyncSerialQueue)autoFavoritesQueue
{
  return self->_autoFavoritesQueue;
}

- (FCUserInfo)userInfo
{
  return self->_userInfo;
}

- (FCTagRanking)tagRanker
{
  return self->_tagRanker;
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (OS_dispatch_queue)storeQueue
{
  return self->_storeQueue;
}

- (void)setTagRanker:(id)a3
{
  objc_storeStrong((id *)&self->_tagRanker, a3);
}

- (void)setLocationObserver:(id)a3
{
  objc_storeStrong((id *)&self->_locationObserver, a3);
}

- (void)setConfigurationStore:(id)a3
{
  objc_storeStrong((id *)&self->_configurationStore, a3);
}

- (void)setConfigurableValues:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setAutoFavoritesCursor:(id)a3
{
  objc_storeStrong((id *)&self->_autoFavoritesCursor, a3);
}

- (void)setAggregateStoreProvider:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateStoreProvider, a3);
}

- (void)processExistingData
{
  -[FRFavoritesPersonalizer maybeRemovePersonalizationEngineData](self, "maybeRemovePersonalizationEngineData");
}

- (TSLocationDetectionManagerType)locationManager
{
  return self->_locationManager;
}

- (FCPersonalizationTreatment)configurableValues
{
  return (FCPersonalizationTreatment *)objc_getProperty(self, a2, 56, 1);
}

- (FRPersonalizationAutoFavoritesCursor)autoFavoritesCursor
{
  return self->_autoFavoritesCursor;
}

- (FCNewsAppConfigurationManager)appConfigurationManager
{
  return self->_appConfigurationManager;
}

- (FCReadonlyAggregateStoreProviderType)aggregateStoreProvider
{
  return self->_aggregateStoreProvider;
}

+ (BOOL)frozen
{
  if (qword_10010A508 != -1)
    dispatch_once(&qword_10010A508, &stru_1000DAEC0);
  return byte_10010A510;
}

- (FRFavoritesPersonalizer)init
{
  id v2;
  void *v3;
  id v4;
  uint8_t buf[4];
  const char *v6;
  __int16 v7;
  char *v8;
  __int16 v9;
  int v10;
  __int16 v11;
  id v12;

  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    v2 = objc_msgSend(objc_alloc((Class)NSString), "initWithFormat:", CFSTR("Do not call method"));
    *(_DWORD *)buf = 136315906;
    v6 = "-[FRFavoritesPersonalizer init]";
    v7 = 2080;
    v8 = "FRFavoritesPersonalizer.m";
    v9 = 1024;
    v10 = 277;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRFavoritesPersonalizer init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)prepareForUseWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  dispatch_block_t v7;
  void *v8;
  id v9;
  _QWORD v10[5];
  id v11;
  _QWORD block[4];
  id v13;
  uint8_t buf[16];

  v4 = a3;
  if (+[NSThread isMainThread](NSThread, "isMainThread")
    && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_10007B814();
  }
  v5 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Preparing personalization data source for use", buf, 2u);
  }
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100030FD8;
  block[3] = &unk_1000DAF28;
  v13 = v4;
  v6 = v4;
  v7 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer aggregateStore](self, "aggregateStore"));
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100031050;
  v10[3] = &unk_1000D9AA8;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  objc_msgSend(v8, "prepareAggregatesForUseWithCompletionHandler:", v10);

}

- (void)prepareFavorites:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  id *v16;
  id *v17;
  id *v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  char v23;
  _QWORD v24[2];
  uint64_t (*v25)(uint64_t);
  void *v26;
  id v27;
  id v28;
  id v29;
  char v30;
  _QWORD v31[4];
  NSObject *v32;
  _QWORD v33[4];
  NSObject *v34;
  uint8_t buf[4];
  void *v36;
  __int16 v37;
  void *v38;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringForKey:", FCPrimaryLanguageKey));

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "primaryLanguageCode"));

  v9 = FCTranslationLog;
  if (os_log_type_enabled(FCTranslationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v36 = v6;
    v37 = 2114;
    v38 = v8;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Preparing favorites with last seen language %{public}@, current language %{public}@", buf, 0x16u);
  }
  v10 = dispatch_group_create();
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer userInfo](self, "userInfo"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "canonicalLanguage"));
  if (v12)
    v13 = objc_msgSend(v6, "isEqualToString:", v8) ^ 1;
  else
    v13 = 1;

  dispatch_group_enter(v10);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_1000313D8;
  v33[3] = &unk_1000D9758;
  v14 = v10;
  v34 = v14;
  -[FRFavoritesPersonalizer prepareFavoritesWithLanguageChange:completionHandler:](self, "prepareFavoritesWithLanguageChange:completionHandler:", v13, v33);
  dispatch_group_enter(v14);
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_1000313E0;
  v31[3] = &unk_1000D9758;
  v15 = v14;
  v32 = v15;
  -[FRFavoritesPersonalizer prepareAutoFavoritesWithLanguageChange:completionHandler:](self, "prepareAutoFavoritesWithLanguageChange:completionHandler:", v13, v31);
  objc_initWeak((id *)buf, self);
  if (FCDispatchGroupIsEmpty(v15))
  {
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v25 = sub_1000313E8;
    v26 = &unk_1000DB250;
    v30 = v13;
    v16 = &v29;
    objc_copyWeak(&v29, (id *)buf);
    v27 = v8;
    v28 = v4;
    v25((uint64_t)v24);
    v17 = &v27;
    v18 = &v28;
  }
  else
  {
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_100031550;
    v19[3] = &unk_1000DB250;
    v23 = v13;
    v16 = &v22;
    objc_copyWeak(&v22, (id *)buf);
    v17 = &v20;
    v20 = v8;
    v18 = &v21;
    v21 = v4;
    dispatch_group_notify(v15, (dispatch_queue_t)&_dispatch_main_q, v19);
  }

  objc_destroyWeak(v16);
  objc_destroyWeak((id *)buf);

}

- (void)prepareFavoritesWithLanguageChange:(BOOL)a3 completionHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;
  _QWORD v14[5];

  v6 = a4;
  v7 = v6;
  if (a3)
  {
    objc_initWeak(&location, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer cloudContext](self, "cloudContext"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "translationManager"));
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10003186C;
    v10[3] = &unk_1000DB3B8;
    objc_copyWeak(&v12, &location);
    v11 = v7;
    objc_msgSend(v9, "fetchTranslationProvider:", v10);

    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  else
  {
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1000317F4;
    v14[3] = &unk_1000DAF28;
    v14[4] = v6;
    sub_1000317F4((uint64_t)v14);
  }

}

- (void)prepareAutoFavoritesWithLanguageChange:(BOOL)a3 completionHandler:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  unsigned __int8 v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  _QWORD v17[5];
  void (**v18)(_QWORD);
  BOOL v19;
  uint8_t v20[16];
  _QWORD block[6];
  uint8_t buf[8];
  uint8_t *v23;
  uint64_t v24;
  char v25;
  _QWORD v26[6];

  v6 = (void (**)(_QWORD))a4;
  if (!a3)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer cloudContext](self, "cloudContext"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "userInfo"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "canonicalLanguage"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[FCAppleAccount sharedAccount](FCAppleAccount, "sharedAccount"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "primaryLanguageCode"));
    v12 = objc_msgSend(v9, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_100032860;
      v26[3] = &unk_1000D9AA8;
      v26[4] = self;
      v26[5] = v6;
      sub_100032860((uint64_t)v26);
      goto LABEL_14;
    }
  }
  v13 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Getting in line to prepare personalization auto-favorites for use", buf, 2u);
  }
  if (+[NSThread isMainThread](NSThread, "isMainThread") || a3)
  {
LABEL_13:
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer storeQueue](self, "storeQueue"));
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_1000329DC;
    v17[3] = &unk_1000DB480;
    v19 = a3;
    v17[4] = self;
    v18 = v6;
    FCDispatchAsyncWithQoSPropagation(v16, v17);

    goto LABEL_14;
  }
  *(_QWORD *)buf = 0;
  v23 = buf;
  v24 = 0x2020000000;
  v25 = 0;
  v14 = objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer storeQueue](self, "storeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000329A0;
  block[3] = &unk_1000DB3E0;
  block[4] = self;
  block[5] = buf;
  dispatch_sync(v14, block);

  if (!v23[24])
  {
    _Block_object_dispose(buf, 8);
    goto LABEL_13;
  }
  v15 = FCProgressivePersonalizationLog;
  if (os_log_type_enabled(FCProgressivePersonalizationLog, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v20 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Auto-favorites have been generated in the past so nothing to prepare", v20, 2u);
  }
  v6[2](v6);
  _Block_object_dispose(buf, 8);
LABEL_14:

}

- (void)_processAutoFavoritesOperationResult:(id)a3 cursor:(id)a4 error:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void (**v12)(_QWORD);
  NSObject *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  _QWORD block[5];
  id v19;

  v10 = a3;
  v11 = a4;
  v12 = (void (**)(_QWORD))a6;
  -[FRFavoritesPersonalizer setAutofavorites:](self, "setAutofavorites:", v10);
  if (a5)
  {
    v12[2](v12);
  }
  else
  {
    -[FRFavoritesPersonalizer setAutoFavoritesCursor:](self, "setAutoFavoritesCursor:", v11);
    v13 = objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer storeQueue](self, "storeQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100033318;
    block[3] = &unk_1000D97A8;
    block[4] = self;
    v19 = v11;
    dispatch_sync(v13, block);

    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "autoFavoriteTagIDs"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "groupableFavoriteTagIDs"));
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1000333A4;
    v16[3] = &unk_1000DB5A8;
    v17 = v10;
    -[FRFavoritesPersonalizer addProgressivePersonalizationAutoFavorites:groupableSubscriptionForTagIDs:originProvider:completion:](self, "addProgressivePersonalizationAutoFavorites:groupableSubscriptionForTagIDs:originProvider:completion:", v14, v15, v16, v12);

  }
}

- (FCPersonalizationWhitelist)whitelist
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer configurationStore](self, "configurationStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "whitelist"));

  return (FCPersonalizationWhitelist *)v3;
}

- (FCPersonalizationWhitelist)allowlist
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer configurationStore](self, "configurationStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "whitelist"));

  return (FCPersonalizationWhitelist *)v3;
}

- (unint64_t)whitelistLevelForTagID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 2;
  v5 = objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer storeQueue](self, "storeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000336A8;
  block[3] = &unk_1000DB5D0;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (unint64_t)allowlistLevelForTagID:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  unint64_t v7;
  _QWORD block[5];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 2;
  v5 = objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer storeQueue](self, "storeQueue"));
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100033844;
  block[3] = &unk_1000DB5D0;
  block[4] = self;
  v10 = v4;
  v11 = &v12;
  v6 = v4;
  dispatch_sync(v5, block);

  v7 = v13[3];
  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)addProgressivePersonalizationAutoFavorites:(id)a3 groupableSubscriptionForTagIDs:(id)a4 originProvider:(id)a5 completion:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  _QWORD v13[5];
  id v14;
  id v15;
  id v16;
  id v17;

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000339E4;
  v13[3] = &unk_1000DB620;
  v13[4] = self;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v9 = v17;
  v10 = v16;
  v11 = v15;
  v12 = v14;
  FCPerformBlockOnMainThread(v13);

}

- (void)configurationManager:(id)a3 appConfigurationDidChange:(id)a4
{
  void *v5;
  NSObject *v6;
  _QWORD v7[5];
  id v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "personalizationTreatment", a3));
  if (v5)
  {
    v6 = objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer storeQueue](self, "storeQueue"));
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_100033B40;
    v7[3] = &unk_1000D97A8;
    v7[4] = self;
    v8 = v5;
    dispatch_async(v6, v7);

  }
}

- (void)subscriptionControllerDidResetToEmpty:(id)a3
{
  void *v4;
  _QWORD v5[5];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer autoFavoritesQueue](self, "autoFavoritesQueue", a3));
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_100033BB4;
  v5[3] = &unk_1000DAF78;
  v5[4] = self;
  objc_msgSend(v4, "enqueueBlock:", v5);

}

- (FCPersonalizationBundleIDMapping)bundleIDMapping
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer configurationStore](self, "configurationStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "bundleIDMapping"));

  return (FCPersonalizationBundleIDMapping *)v3;
}

- (FCPersonalizationURLMapping)urlMapping
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[FRFavoritesPersonalizer configurationStore](self, "configurationStore"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "urlMapping"));

  return (FCPersonalizationURLMapping *)v3;
}

- (FRPersonalizationAutoFavorites)autofavorites
{
  return self->_autofavorites;
}

- (FCPersonalizationAggregateStore)aggregateStore
{
  return self->_aggregateStore;
}

- (void)setAggregateStore:(id)a3
{
  objc_storeStrong((id *)&self->_aggregateStore, a3);
}

- (FCKeyValueStore)hourlyFlowRateHighWaterMarkValueStore
{
  return self->_hourlyFlowRateHighWaterMarkValueStore;
}

- (void)setHourlyFlowRateHighWaterMarkValueStore:(id)a3
{
  objc_storeStrong((id *)&self->_hourlyFlowRateHighWaterMarkValueStore, a3);
}

- (FCKeyValueStore)debugKeyValueStore
{
  return self->_debugKeyValueStore;
}

- (void)setDebugKeyValueStore:(id)a3
{
  objc_storeStrong((id *)&self->_debugKeyValueStore, a3);
}

- (void)setCloudContext:(id)a3
{
  objc_storeStrong((id *)&self->_cloudContext, a3);
}

- (void)setAppConfigurationManager:(id)a3
{
  objc_storeStrong((id *)&self->_appConfigurationManager, a3);
}

- (void)setSubscriptionController:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionController, a3);
}

- (FCPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (void)setPurchaseController:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseController, a3);
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  return self->_bundleSubscriptionManager;
}

- (void)setBundleSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, a3);
}

- (void)setUserInfo:(id)a3
{
  objc_storeStrong((id *)&self->_userInfo, a3);
}

- (void)setAutoFavoritesQueue:(id)a3
{
  objc_storeStrong((id *)&self->_autoFavoritesQueue, a3);
}

- (FCDisposable)locationObserver
{
  return self->_locationObserver;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_locationObserver, 0);
  objc_storeStrong((id *)&self->_storeQueue, 0);
  objc_storeStrong((id *)&self->_autoFavoritesCursor, 0);
  objc_storeStrong((id *)&self->_autoFavoritesQueue, 0);
  objc_storeStrong((id *)&self->_userInfo, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_appConfigurationManager, 0);
  objc_storeStrong((id *)&self->_cloudContext, 0);
  objc_storeStrong((id *)&self->_debugKeyValueStore, 0);
  objc_storeStrong((id *)&self->_hourlyFlowRateHighWaterMarkValueStore, 0);
  objc_storeStrong((id *)&self->_configurableValues, 0);
  objc_storeStrong((id *)&self->_configurationStore, 0);
  objc_storeStrong((id *)&self->_aggregateStore, 0);
  objc_storeStrong((id *)&self->_autofavorites, 0);
  objc_storeStrong((id *)&self->_locationManager, 0);
  objc_storeStrong((id *)&self->_tagRanker, 0);
  objc_storeStrong((id *)&self->_aggregateStoreProvider, 0);
}

@end
