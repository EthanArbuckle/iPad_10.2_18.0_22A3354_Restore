@implementation BKBookletMigrationManager

- (BKBookletMigrationManager)initWithPurchaseItemMigrationController:(id)a3
{
  id v4;
  BKBookletMigrationManager *v5;
  BKBookletMigrationManager *v6;
  BKBookletMigrationStore *v7;
  BKBookletMigrationStore *store;
  BKBookletMigrationDownloadFlowState *v9;
  BKBookletMigrationDownloadFlowState *flowState;
  BKBookletMigrationDownloadQueue *v11;
  BKBookletMigrationDownloadQueue *migrationDownloadQueue;
  uint64_t v13;
  NSMutableDictionary *migrationInfos;
  dispatch_queue_attr_t v15;
  NSObject *v16;
  dispatch_queue_attr_t v17;
  NSObject *v18;
  dispatch_queue_t v19;
  OS_dispatch_queue *workQueue;
  objc_super v22;

  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BKBookletMigrationManager;
  v5 = -[BKBookletMigrationManager init](&v22, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_purchaseItemMigrationController, v4);
    v7 = objc_alloc_init(BKBookletMigrationStore);
    store = v6->_store;
    v6->_store = v7;

    v9 = -[BKBookletMigrationDownloadFlowState initWithStage:]([BKBookletMigrationDownloadFlowState alloc], "initWithStage:", 0);
    flowState = v6->_flowState;
    v6->_flowState = v9;

    v11 = -[BKBookletMigrationDownloadQueue initWithStore:]([BKBookletMigrationDownloadQueue alloc], "initWithStore:", v6->_store);
    migrationDownloadQueue = v6->_migrationDownloadQueue;
    v6->_migrationDownloadQueue = v11;

    -[BKBookletMigrationDownloadQueue setObserver:](v6->_migrationDownloadQueue, "setObserver:", v6);
    v13 = objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager _loadMigrationInfos](v6, "_loadMigrationInfos"));
    migrationInfos = v6->_migrationInfos;
    v6->_migrationInfos = (NSMutableDictionary *)v13;

    v6->_accessLock._os_unfair_lock_opaque = 0;
    v15 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_UTILITY, 0);
    v18 = objc_claimAutoreleasedReturnValue(v17);

    v19 = dispatch_queue_create("BKBookletMigrationManager.workQueue", v18);
    workQueue = v6->_workQueue;
    v6->_workQueue = (OS_dispatch_queue *)v19;

  }
  return v6;
}

- (id)_loadMigrationInfos
{
  void *v2;
  void *v3;
  id v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKey:", CFSTR("BKBookletMigration.infos")));
  v4 = objc_msgSend(v3, "mutableCopy");

  if (!v4)
    v4 = objc_alloc_init((Class)NSMutableDictionary);
  return v4;
}

- (void)migrateIfNeeded
{
  id v3;

  -[BKBookletMigrationManager _resetEverythingIfNeeded](self, "_resetEverythingIfNeeded");
  if (-[BKBookletMigrationManager _shouldStart](self, "_shouldStart"))
  {
    v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager _downloadFlowState](self, "_downloadFlowState"));
    -[BKBookletMigrationManager _setDownloadFlowState:persist:](self, "_setDownloadFlowState:persist:", v3, 0);

  }
}

- (void)_resetEverythingIfNeeded
{
  void *v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  id v7;
  void *v8;
  unsigned int v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  const char *v14;
  NSObject *v15;
  uint32_t v16;
  id v17;
  uint8_t buf[4];
  id v19;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  if (objc_msgSend(v3, "BOOLForKey:", CFSTR("BKBookletMigration.resetEverything")))
  {
    v4 = BKBookletMigrationLog();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Reset everything", buf, 2u);
    }

    objc_msgSend(v3, "removeObjectForKey:", CFSTR("BKBookletMigration.infos"));
    objc_msgSend(v3, "removeObjectForKey:", CFSTR("BKBookletMigration.resetEverything"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager _loadMigrationInfos](self, "_loadMigrationInfos"));
    -[BKBookletMigrationManager setMigrationInfos:](self, "setMigrationInfos:", v6);

    v7 = objc_alloc_init((Class)NSSet);
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager store](self, "store"));
    v17 = 0;
    v9 = objc_msgSend(v8, "removeAllMigrationInfosExcludingStates:error:", v7, &v17);
    v10 = v17;

    v11 = BKBookletMigrationLog();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v13)
      {
        *(_WORD *)buf = 0;
        v14 = "Removed all booklet migration infos";
        v15 = v12;
        v16 = 2;
LABEL_9:
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, v14, buf, v16);
      }
    }
    else if (v13)
    {
      *(_DWORD *)buf = 138412290;
      v19 = v10;
      v14 = "Error removing all booklet migration infos, error: %@";
      v15 = v12;
      v16 = 12;
      goto LABEL_9;
    }

  }
}

- (id)_migrationInfo
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  unsigned int v10;
  id v11;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "activeStoreAccount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "ams_DSID"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "stringValue"));

  if (!v6
    || (v7 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager migrationInfos](self, "migrationInfos")),
        v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v6)),
        v7,
        !v8))
  {
    v8 = objc_alloc_init((Class)NSDictionary);
  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("stage")));
  v10 = objc_msgSend(v9, "unsignedIntValue");

  if (!v10)
  {
    v11 = objc_alloc_init((Class)NSDictionary);

    v8 = v11;
  }

  return v8;
}

- (id)_downloadFlowState
{
  void *v2;
  void *v3;
  int v4;
  BKBookletMigrationDownloadFlowState *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  BKBookletMigrationDownloadFlowState *v9;
  uint64_t v10;
  NSObject *v11;
  int v13;
  BKBookletMigrationDownloadFlowState *v14;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager _migrationInfo](self, "_migrationInfo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("stage")));
  v4 = objc_msgSend(v3, "unsignedIntValue");
  v5 = (BKBookletMigrationDownloadFlowState *)v4;

  if (v4 > 399)
  {
    if (v4 != 400 && v4 != 800 && v4 != 600)
      goto LABEL_11;
  }
  else if (v4 && v4 != 200 && v4 != 300)
  {
LABEL_11:
    v8 = BKBookletMigrationLog();
    v7 = objc_claimAutoreleasedReturnValue(v8);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v13 = 134217984;
      v14 = v5;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Loaded flow state: Encountered unknown value: %lu", (uint8_t *)&v13, 0xCu);
    }
    v5 = 0;
    goto LABEL_14;
  }
  v6 = BKBookletMigrationLog();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 134217984;
    v14 = v5;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Loaded flow state: Loaded value: %lu", (uint8_t *)&v13, 0xCu);
  }
LABEL_14:

  v9 = -[BKBookletMigrationDownloadFlowState initWithStage:]([BKBookletMigrationDownloadFlowState alloc], "initWithStage:", v5);
  v10 = BKBookletMigrationLog();
  v11 = objc_claimAutoreleasedReturnValue(v10);
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v13 = 138543362;
    v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Loaded flow state: %{public}@", (uint8_t *)&v13, 0xCu);
  }

  return v9;
}

- (void)_persistMigrationInfo:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "activeStoreAccount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "ams_DSID"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringValue"));

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager migrationInfos](self, "migrationInfos"));
    objc_msgSend(v9, "setObject:forKeyedSubscript:", v4, v8);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager migrationInfos](self, "migrationInfos"));
    objc_msgSend(v10, "setObject:forKey:", v11, CFSTR("BKBookletMigration.infos"));

  }
  else
  {
    v12 = BKBookletMigrationLog();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      sub_1006A1100(v13, v14, v15, v16, v17, v18, v19, v20);

  }
}

- (void)_persistDownloadFlowState:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  void *v8;
  _QWORD v9[2];
  _QWORD v10[2];
  uint8_t buf[4];
  id v12;

  v4 = a3;
  v5 = BKBookletMigrationLog();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v12 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Persisting flow state: %{public}@", buf, 0xCu);
  }

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v4, "stage", CFSTR("stage"))));
  v9[1] = CFSTR("version");
  v10[0] = v7;
  v10[1] = &off_10092EDD8;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v10, v9, 2));

  -[BKBookletMigrationManager _persistMigrationInfo:](self, "_persistMigrationInfo:", v8);
}

- (BOOL)_shouldStart
{
  uint64_t v2;
  NSObject *v3;
  const char *v4;
  uint8_t *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v10;
  __int16 v11;
  __int16 v12;

  if (+[BKReachability isOffline](BKReachability, "isOffline"))
  {
    v2 = BKBookletMigrationLog();
    v3 = objc_claimAutoreleasedReturnValue(v2);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v12 = 0;
      v4 = "Device is offline, skipping booklet migration";
      v5 = (uint8_t *)&v12;
LABEL_8:
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, v4, v5, 2u);
    }
  }
  else
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[BUAccountsProvider sharedProvider](BUAccountsProvider, "sharedProvider"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "activeStoreAccount"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "ams_DSID"));

    if (v8)
      return 1;
    v10 = BKBookletMigrationLog();
    v3 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      v11 = 0;
      v4 = "Not signed in to store, skipping booklet migration";
      v5 = (uint8_t *)&v11;
      goto LABEL_8;
    }
  }

  return 0;
}

- (BOOL)_shouldRunDownloadFlowState:(id)a3
{
  id v4;
  BOOL v5;
  uint64_t v6;
  NSObject *v7;
  int v9;
  id v10;

  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "stage") >= 0xC9)
  {
    v6 = BKBookletMigrationLog();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9 = 134217984;
      v10 = objc_msgSend(v4, "stage");
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "stopping booklet migration download at stage: %lu", (uint8_t *)&v9, 0xCu);
    }

    v5 = 0;
  }
  else
  {
    v5 = -[BKBookletMigrationManager _shouldStart](self, "_shouldStart");
  }

  return v5;
}

- (void)_setDownloadFlowStage:(unint64_t)a3
{
  BKBookletMigrationDownloadFlowState *v4;

  v4 = -[BKBookletMigrationDownloadFlowState initWithStage:]([BKBookletMigrationDownloadFlowState alloc], "initWithStage:", a3);
  -[BKBookletMigrationManager _setDownloadFlowState:persist:](self, "_setDownloadFlowState:persist:", v4, 1);

}

- (void)_setDownloadFlowState:(id)a3 persist:(BOOL)a4
{
  id v6;
  _QWORD v7[4];
  BKBookletMigrationManager *v8;
  id v9;
  BOOL v10;

  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010D5A4;
  v7[3] = &unk_1008E7D78;
  v8 = self;
  v6 = a3;
  v9 = v6;
  v10 = a4;
  os_unfair_lock_lock(&v8->_accessLock);
  sub_10010D5A4((uint64_t)v7);
  os_unfair_lock_unlock(&self->_accessLock);
  if (-[BKBookletMigrationManager _shouldRunDownloadFlowState:](self, "_shouldRunDownloadFlowState:", v6))
    -[BKBookletMigrationManager _runDownloadFlowFromState:](self, "_runDownloadFlowFromState:", v6);

}

- (void)_runDownloadFlowFromState:(id)a3
{
  id v4;
  NSObject *workQueue;
  id v6;
  _QWORD v7[4];
  id v8;
  BKBookletMigrationManager *v9;

  v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10010D65C;
  v7[3] = &unk_1008E7338;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(workQueue, v7);

}

- (void)wq_runDownloadFlowStageInitial
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  -[BKBookletMigrationManager _setDownloadFlowStage:](self, "_setDownloadFlowStage:", 150);
}

- (void)wq_runDownloadFlowStageWaitGDPRPrivacyAcknowledgement
{
  void *v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "addObserver:selector:name:object:", self, "_privacyAcknowledgementChanged:", BAPrivacyAcknowledgementChanged, 0);

  -[BKBookletMigrationManager wq_checkGDPRPrivacyAcknowledgementBeforeForceReloadPurchaseItems](self, "wq_checkGDPRPrivacyAcknowledgementBeforeForceReloadPurchaseItems");
}

- (void)wq_checkGDPRPrivacyAcknowledgementBeforeForceReloadPurchaseItems
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  uint8_t v6[16];

  if (BUIsGDPRAcknowledgementNeededForBooks(self, a2))
  {
    v3 = BKBookletMigrationLog();
    v4 = objc_claimAutoreleasedReturnValue(v3);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "GDPR privacy acknowledgement needed", v6, 2u);
    }

  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v5, "removeObserver:name:object:", self, BAPrivacyAcknowledgementChanged, 0);

    -[BKBookletMigrationManager _setDownloadFlowStage:](self, "_setDownloadFlowStage:", 200);
  }
}

- (void)_privacyAcknowledgementChanged:(id)a3
{
  uint64_t v4;
  NSObject *v5;
  NSObject *workQueue;
  _QWORD block[5];
  uint8_t buf[16];

  v4 = BKBookletMigrationLog(self, a2, a3);
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "GDPR privacy acknowledgement changed", buf, 2u);
  }

  workQueue = self->_workQueue;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10010DB08;
  block[3] = &unk_1008E72C0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

- (id)_fetchOwnedAudiobookAssetIDsIncludeLocalOnly:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v6 = objc_alloc((Class)NSMutableArray);
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager predicateForAllOwnedAudiobooks](BKLibraryManager, "predicateForAllOwnedAudiobooks"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager _predicateForRedownloadableAssets](self, "_predicateForRedownloadableAssets"));
  v9 = objc_msgSend(v6, "initWithObjects:", v7, v8, 0);

  if (v3)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "predicateForLocalLibraryAssets"));
    objc_msgSend(v9, "addObject:", v10);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSCompoundPredicate andPredicateWithSubpredicates:](NSCompoundPredicate, "andPredicateWithSubpredicates:", v9));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "assetIDsOfStoreAssetsWithPredicate:", v11));

  return v12;
}

- (id)_predicateForRedownloadableAssets
{
  return +[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K == NULL) AND (%K == YES)"), CFSTR("expectedDate"), CFSTR("canRedownload"));
}

- (void)wq_runDownloadFlowStageForceReloadPurchaseItems
{
  void *v3;
  _QWORD *v4;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  uint64_t v18;
  NSObject *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  NSObject *v28;
  _QWORD v29[4];
  _QWORD *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[5];
  _QWORD v34[5];
  uint8_t buf[4];
  void *v36;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager purchaseItemMigrationController](self, "purchaseItemMigrationController"));
  v34[0] = _NSConcreteStackBlock;
  v34[1] = 3221225472;
  v34[2] = sub_10010DECC;
  v34[3] = &unk_1008E72C0;
  v34[4] = self;
  v4 = objc_retainBlock(v34);
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_10010DED8;
  v33[3] = &unk_1008E72C0;
  v33[4] = self;
  v5 = objc_retainBlock(v33);
  v8 = v5;
  if (v3)
  {
    v9 = objc_opt_respondsToSelector(v3, "reloadPurchaseItemStoreIDs:completion:");
    if ((v9 & 1) != 0)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager _fetchOwnedAudiobookAssetIDsIncludeLocalOnly:](self, "_fetchOwnedAudiobookAssetIDsIncludeLocalOnly:", 0));
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v12));
      v16 = BKBookletMigrationLog(v13, v14, v15);
      v17 = objc_claimAutoreleasedReturnValue(v16);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v36 = v13;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "About to update purchase items with assetIDs: %@", buf, 0xCu);
      }

      v29[0] = _NSConcreteStackBlock;
      v29[1] = 3221225472;
      v29[2] = sub_10010DFE0;
      v29[3] = &unk_1008E7B98;
      v30 = v4;
      objc_msgSend(v3, "reloadPurchaseItemStoreIDs:completion:", v13, v29);

    }
    else
    {
      v27 = BKBookletMigrationLog(v9, v10, v11);
      v28 = objc_claimAutoreleasedReturnValue(v27);
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "About to update purchase items", buf, 2u);
      }

      v31[0] = _NSConcreteStackBlock;
      v31[1] = 3221225472;
      v31[2] = sub_10010DFD4;
      v31[3] = &unk_1008E7B98;
      v32 = v8;
      objc_msgSend(v3, "updatePurchaseItemsWithCompletion:", v31);

    }
  }
  else
  {
    v18 = BKBookletMigrationLog(v5, v6, v7);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      sub_1006A1130(v19, v20, v21, v22, v23, v24, v25, v26);

    ((void (*)(_QWORD *))v4[2])(v4);
  }

}

- (void)wq_runDownloadFlowStageWait
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  _BOOL4 v15;
  int v16;
  double v17;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
  objc_msgSend(v3, "doubleForKey:", CFSTR("BKBookletMigration.stopAndWaitStartTime"));
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
  objc_msgSend(v6, "timeIntervalSince1970");
  v8 = v7;

  v9 = v8 - v5;
  v13 = BKBookletMigrationLog(v10, v11, v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v9 <= 150.0)
  {
    if (v15)
    {
      v16 = 134217984;
      v17 = 150.0 - v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Stopping migration download for now. Will retry stage query on next launch after %.1f seconds.", (uint8_t *)&v16, 0xCu);
    }

  }
  else
  {
    if (v15)
    {
      LOWORD(v16) = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Finished waiting. Resuming migration download", (uint8_t *)&v16, 2u);
    }

    objc_msgSend(v3, "removeObjectForKey:", CFSTR("BKBookletMigration.stopAndWaitStartTime"));
    -[BKBookletMigrationManager _setDownloadFlowStage:](self, "_setDownloadFlowStage:", 400);
  }

}

- (void)wq_runDownloadFlowStageQuery
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  NSObject *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  _QWORD *v29;
  _BYTE *v30;
  uint8_t v31[8];
  _QWORD v32[5];
  id v33;
  _BYTE *v34;
  _BYTE buf[24];
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[BKLibraryManager defaultManager](BKLibraryManager, "defaultManager"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager _fetchOwnedAudiobookAssetIDsIncludeLocalOnly:](self, "_fetchOwnedAudiobookAssetIDsIncludeLocalOnly:", 1));
  v7 = BKBookletMigrationLog(v4, v5, v6);
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    *(_QWORD *)&buf[4] = objc_msgSend(v4, "count");
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v4;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "local audiobooks %lu assetIDs: %@", buf, 0x16u);
  }

  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x3032000000;
  v36 = sub_10004E3C0;
  v37 = sub_10004E260;
  v9 = v4;
  v38 = v9;
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_10010E434;
  v32[3] = &unk_1008EB128;
  v34 = buf;
  v32[4] = self;
  v10 = v3;
  v33 = v10;
  v11 = objc_retainBlock(v32);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager purchaseItemMigrationController](self, "purchaseItemMigrationController"));
  v13 = objc_msgSend(v9, "count");
  if (!v13)
  {
    v17 = BKBookletMigrationLog(0, v14, v15);
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v31 = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "No local audiobooks to consider", v31, 2u);
    }
    goto LABEL_10;
  }
  if (!v12)
  {
    v19 = BKBookletMigrationLog(v13, v14, v15);
    v18 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      sub_1006A1130(v18, v20, v21, v22, v23, v24, v25, v26);
LABEL_10:

    ((void (*)(_QWORD *, uint64_t))v11[2])(v11, 1);
    goto LABEL_11;
  }
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_10010E6A8;
  v27[3] = &unk_1008EB150;
  v30 = buf;
  v16 = (id)objc_claimAutoreleasedReturnValue(+[NSSet setWithArray:](NSSet, "setWithArray:", v9));
  v28 = v16;
  v29 = v11;
  objc_msgSend(v12, "fetchReadyPurchaseItemStoreIDs:completion:", v16, v27);

LABEL_11:
  _Block_object_dispose(buf, 8);

}

- (void)wq_runDownloadFlowStageQueued
{
  id v3;

  dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[BKBookletMigrationManager migrationDownloadQueue](self, "migrationDownloadQueue"));
  objc_msgSend(v3, "reloadFromStore");

}

- (void)bookletMigrationDownloadQueueDidBecomeEmpty
{
  -[BKBookletMigrationManager _setDownloadFlowStage:](self, "_setDownloadFlowStage:", 800);
}

- (BKBookletMigrationStore)store
{
  return self->_store;
}

- (void)setStore:(id)a3
{
  objc_storeStrong((id *)&self->_store, a3);
}

- (BKBookletMigrationDownloadFlowState)flowState
{
  return self->_flowState;
}

- (void)setFlowState:(id)a3
{
  objc_storeStrong((id *)&self->_flowState, a3);
}

- (BKBookletMigrationDownloadQueue)migrationDownloadQueue
{
  return self->_migrationDownloadQueue;
}

- (void)setMigrationDownloadQueue:(id)a3
{
  objc_storeStrong((id *)&self->_migrationDownloadQueue, a3);
}

- (NSMutableDictionary)migrationInfos
{
  return self->_migrationInfos;
}

- (void)setMigrationInfos:(id)a3
{
  objc_storeStrong((id *)&self->_migrationInfos, a3);
}

- (BKPurchaseItemMigrationControlling)purchaseItemMigrationController
{
  return (BKPurchaseItemMigrationControlling *)objc_loadWeakRetained((id *)&self->_purchaseItemMigrationController);
}

- (void)setPurchaseItemMigrationController:(id)a3
{
  objc_storeWeak((id *)&self->_purchaseItemMigrationController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_purchaseItemMigrationController);
  objc_storeStrong((id *)&self->_migrationInfos, 0);
  objc_storeStrong((id *)&self->_migrationDownloadQueue, 0);
  objc_storeStrong((id *)&self->_flowState, 0);
  objc_storeStrong((id *)&self->_store, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end
