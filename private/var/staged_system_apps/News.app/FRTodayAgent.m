@implementation FRTodayAgent

- (void)_didBecomeActive
{
  NSObject *v3;
  void *v4;
  NSObject *v5;
  id v6;
  void **v7;
  uint64_t v8;
  void (*v9)(uint64_t, void *);
  void *v10;
  id v11;
  NSObject *v12;

  v3 = dispatch_group_create();
  dispatch_group_enter(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRTodayAgent fileCoordinatedTodayPrivateDataTransactionQueue](self, "fileCoordinatedTodayPrivateDataTransactionQueue"));
  v7 = _NSConcreteStackBlock;
  v8 = 3221225472;
  v9 = sub_100009524;
  v10 = &unk_1000DDA50;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[FRTodayAgent privateDataContext](self, "privateDataContext"));
  v12 = v3;
  v5 = v3;
  v6 = v11;
  objc_msgSend(v4, "dequeueTransactionsWithCompletion:", &v7);
  -[FRTodayAgent _markDirtyWithFlags:](self, "_markDirtyWithFlags:", 32, v7, v8, v9, v10);
  -[FRTodayAgent _markPurchasesDirty](self, "_markPurchasesDirty");
  -[FRTodayAgent _updateSuspensionState](self, "_updateSuspensionState");

}

- (void)_updateSuspensionState
{
  uint64_t v3;
  id v4;

  if (-[FRTodayAgent isEnabled](self, "isEnabled"))
    v3 = -[FRTodayAgent _mayWidgetsBeVisible](self, "_mayWidgetsBeVisible") ^ 1;
  else
    v3 = 1;
  v4 = (id)objc_claimAutoreleasedReturnValue(-[FRTodayAgent operationThrottler](self, "operationThrottler"));
  objc_msgSend(v4, "setSuspended:", v3);

}

- (BOOL)isEnabled
{
  return self->_enabled;
}

- (void)_markDirtyWithFlags:(unint64_t)a3
{
  -[FRTodayAgent _markDirtyWithFlags:qualityOfService:](self, "_markDirtyWithFlags:qualityOfService:", a3, 9);
}

- (FCBoostableOperationThrottler)operationThrottler
{
  return self->_operationThrottler;
}

- (FRTodayAgent)initWithFeedPersonalizer:(id)a3 purchaseController:(id)a4 subscriptionController:(id)a5 localNewsChannelService:(id)a6 bundleSubscriptionManager:(id)a7 personalizationDataGenerator:(id)a8 privateDataContext:(id)a9 userEmbeddingGenerator:(id)a10
{
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  void *v23;
  FRTodayAgent *v24;
  FRTodayAgent *v25;
  dispatch_group_t v26;
  OS_dispatch_group *transactionProcessingGroup;
  id v28;
  uint64_t v29;
  void *v30;
  FCFileCoordinatedTodayPrivateDataTransactionQueue *v31;
  FCFileCoordinatedTodayPrivateDataTransactionQueue *fileCoordinatedTodayPrivateDataTransactionQueue;
  id v33;
  uint64_t v34;
  void *v35;
  FCFileCoordinatedTodayDropbox *v36;
  FCFileCoordinatedTodayDropbox *fileCoordinatedTodayDropbox;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  NSMutableArray *seenArticlesTransactions;
  FCBoostableOperationThrottler *v45;
  FCBoostableOperationThrottler *operationThrottler;
  id v48;
  id obj;
  id v50;
  id v51;
  id v52;
  void *v53;
  id v54;
  id v55;
  id v56;
  objc_super v57;

  v17 = a3;
  obj = a4;
  v18 = a4;
  v50 = a5;
  v19 = a5;
  v51 = a6;
  v20 = a6;
  v52 = a7;
  v54 = a7;
  v56 = a8;
  v21 = a9;
  v55 = a10;
  if (!v17 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100081068();
  v53 = v18;
  if (!v18 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080FB0();
  v22 = v19;
  if (!v19 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080EF8();
  v23 = v20;
  if (!v20 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080E40();
  if (!v56 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_100080D88();
    if (v21)
      goto LABEL_18;
  }
  else if (v21)
  {
    goto LABEL_18;
  }
  if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080CD0();
LABEL_18:
  if (!v55 && os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    sub_100080C18();
  v57.receiver = self;
  v57.super_class = (Class)FRTodayAgent;
  v24 = -[FRTodayAgent init](&v57, "init");
  v25 = v24;
  if (v24)
  {
    v48 = v17;
    objc_storeStrong((id *)&v24->_feedPersonalizer, a3);
    v26 = dispatch_group_create();
    transactionProcessingGroup = v25->_transactionProcessingGroup;
    v25->_transactionProcessingGroup = (OS_dispatch_group *)v26;

    v28 = objc_alloc((Class)FCFileCoordinatedTodayPrivateDataTransactionQueue);
    v29 = FCURLForTodayPrivateDataTransactionQueue();
    v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
    v31 = (FCFileCoordinatedTodayPrivateDataTransactionQueue *)objc_msgSend(v28, "initWithFileURL:", v30);
    fileCoordinatedTodayPrivateDataTransactionQueue = v25->_fileCoordinatedTodayPrivateDataTransactionQueue;
    v25->_fileCoordinatedTodayPrivateDataTransactionQueue = v31;

    v33 = objc_alloc((Class)FCFileCoordinatedTodayDropbox);
    v34 = FCURLForTodayDropbox();
    v35 = (void *)objc_claimAutoreleasedReturnValue(v34);
    v36 = (FCFileCoordinatedTodayDropbox *)objc_msgSend(v33, "initWithFileURL:", v35);
    fileCoordinatedTodayDropbox = v25->_fileCoordinatedTodayDropbox;
    v25->_fileCoordinatedTodayDropbox = v36;

    objc_storeStrong((id *)&v25->_personalizationDataGenerator, a8);
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "personalizationData"));
    objc_msgSend(v38, "addStateObserver:", v25);
    objc_storeStrong((id *)&v25->_purchaseController, obj);
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v39, "addObserver:selector:name:object:", v25, "_markPurchasesDirty", FCPurchaseListChangedNotificationName, 0);
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "readingHistory"));
    objc_msgSend(v40, "addObserver:", v25);
    objc_msgSend(v40, "addStateObserver:", v25);
    objc_storeStrong((id *)&v25->_subscriptionController, v50);
    objc_msgSend(v22, "addObserver:", v25);
    objc_storeStrong((id *)&v25->_localNewsChannelService, v51);
    objc_storeStrong((id *)&v25->_bundleSubscriptionManager, v52);
    objc_msgSend(v54, "addObserver:", v25);
    objc_storeStrong((id *)&v25->_privateDataContext, a9);
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "userInfo"));
    objc_msgSend(v41, "addObserver:", v25);

    objc_storeStrong((id *)&v25->_userEmbeddingGenerator, a10);
    objc_msgSend(v39, "addObserver:selector:name:object:", v25, "_didBecomeActive", UIApplicationDidBecomeActiveNotification, 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v25, "_willResignActive", UIApplicationWillResignActiveNotification, 0);
    objc_msgSend(v39, "addObserver:selector:name:object:", v25, "_didEnterBackground", UIApplicationDidEnterBackgroundNotification, 0);
    v42 = (void *)objc_claimAutoreleasedReturnValue(+[FCFileCoordinatedTodayDropboxTransaction transactionOfIdentity](FCFileCoordinatedTodayDropboxTransaction, "transactionOfIdentity"));
    if (v42)
      v43 = objc_claimAutoreleasedReturnValue(+[NSMutableArray arrayWithObject:](NSMutableArray, "arrayWithObject:", v42));
    else
      v43 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    seenArticlesTransactions = v25->_seenArticlesTransactions;
    v25->_seenArticlesTransactions = (NSMutableArray *)v43;

    v45 = (FCBoostableOperationThrottler *)objc_msgSend(objc_alloc((Class)FCBoostableOperationThrottler), "initWithDelegate:", v25);
    operationThrottler = v25->_operationThrottler;
    v25->_operationThrottler = v45;

    -[FRTodayAgent _updateSuspensionState](v25, "_updateSuspensionState");
    -[FRTodayAgent _markDirtyWithFlags:](v25, "_markDirtyWithFlags:", 72);

    v17 = v48;
  }

  return v25;
}

- (FCPrivateDataContext)privateDataContext
{
  return self->_privateDataContext;
}

- (FCFileCoordinatedTodayPrivateDataTransactionQueue)fileCoordinatedTodayPrivateDataTransactionQueue
{
  return self->_fileCoordinatedTodayPrivateDataTransactionQueue;
}

- (void)_markPurchasesDirty
{
  +[NSThread isMainThread](NSThread, "isMainThread");
  -[FRTodayAgent _markDirtyWithFlags:](self, "_markDirtyWithFlags:", 16);
}

- (FRTodayAgent)init
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
    v6 = "-[FRTodayAgent init]";
    v7 = 2080;
    v8 = "FRTodayAgent.m";
    v9 = 1024;
    v10 = 58;
    v11 = 2114;
    v12 = v2;
    _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "*** Assertion failure (Identifier: catch-all) : %s %s:%d %{public}@", buf, 0x26u);

  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@: %s"), CFSTR("Do not call method"), "-[FRTodayAgent init]"));
  v4 = (id)objc_claimAutoreleasedReturnValue(+[NSException exceptionWithName:reason:userInfo:](NSException, "exceptionWithName:reason:userInfo:", NSInternalInconsistencyException, v3, 0));

  objc_exception_throw(v4);
}

- (void)enable
{
  -[FRTodayAgent setEnabled:](self, "setEnabled:", 1);
  -[FRTodayAgent _updateSuspensionState](self, "_updateSuspensionState");
}

- (void)serviceWidgetIfNeededWithCompletion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[FRTodayAgent operationThrottler](self, "operationThrottler"));
  objc_msgSend(v5, "tickleWithCompletion:", v4);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationDidBecomeActiveNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationWillResignActiveNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, UIApplicationDidEnterBackgroundNotification, 0);
  objc_msgSend(v3, "removeObserver:name:object:", self, FCPurchaseListChangedNotificationName, 0);

  v4.receiver = self;
  v4.super_class = (Class)FRTodayAgent;
  -[FRTodayAgent dealloc](&v4, "dealloc");
}

- (void)subscriptionController:(id)a3 didAddTags:(id)a4 changeTags:(id)a5 moveTags:(id)a6 removeTags:(id)a7 subscriptionType:(unint64_t)a8
{
  id v12;
  id v13;
  id v14;

  v14 = a5;
  v12 = a6;
  v13 = a7;
  if (objc_msgSend(a4, "count")
    || objc_msgSend(v14, "count")
    || objc_msgSend(v12, "count")
    || objc_msgSend(v13, "count"))
  {
    -[FRTodayAgent _markDirtyWithFlags:](self, "_markDirtyWithFlags:", 4);
  }

}

- (void)readingHistory:(id)a3 didChangeFeaturesForArticles:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSMutableArray *v9;
  NSMutableSet *v10;
  id v11;
  NSMutableArray *v12;
  NSMutableSet *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  __int16 v18;
  _QWORD v19[4];
  id v20;
  NSMutableArray *v21;
  NSMutableSet *v22;
  uint64_t *v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  char v32;

  v6 = a3;
  v7 = a4;
  +[NSThread isMainThread](NSThread, "isMainThread");
  v29 = 0;
  v30 = &v29;
  v31 = 0x2020000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2020000000;
  v28 = 9;
  v8 = objc_msgSend(v7, "copy");
  v9 = objc_opt_new(NSMutableArray);
  v10 = objc_opt_new(NSMutableSet);
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10005F7C8;
  v19[3] = &unk_1000DDA28;
  v23 = &v29;
  v24 = &v25;
  v11 = v6;
  v20 = v11;
  v12 = v9;
  v21 = v12;
  v13 = v10;
  v22 = v13;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v19);
  if (-[NSMutableArray count](v12, "count") || -[NSMutableSet count](v13, "count"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "historyItemsForArticleIDs:", v12));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FCFileCoordinatedTodayDropboxTransaction transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:deletedArticleIDs:](FCFileCoordinatedTodayDropboxTransaction, "transactionToMutateSeenArticlesWithInsertedOrUpdatedHistoryItems:deletedArticleIDs:", v14, v13));
    if (v15)
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[FRTodayAgent seenArticlesTransactions](self, "seenArticlesTransactions"));
      objc_msgSend(v16, "addObject:", v15);

    }
  }
  if (*((_BYTE *)v30 + 24))
  {
    v17 = FRTodayAgentLog;
    if (os_log_type_enabled((os_log_t)FRTodayAgentLog, OS_LOG_TYPE_DEFAULT))
    {
      v18 = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Marking reading history as dirty", (uint8_t *)&v18, 2u);
    }
    -[FRTodayAgent _markDirtyWithFlags:qualityOfService:](self, "_markDirtyWithFlags:qualityOfService:", 2, v26[3]);
  }

  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);

}

- (void)readingHistoryLikelyClearedRemotely:(id)a3
{
  -[FRTodayAgent _historyDidClear](self, "_historyDidClear", a3);
}

- (void)readingHistoryDidClear:(id)a3
{
  -[FRTodayAgent _historyDidClear](self, "_historyDidClear", a3);
}

- (void)_historyDidClear
{
  void *v3;
  id v4;

  +[NSThread isMainThread](NSThread, "isMainThread");
  v4 = (id)objc_claimAutoreleasedReturnValue(+[FCFileCoordinatedTodayDropboxTransaction transactionToClearSeenArticles](FCFileCoordinatedTodayDropboxTransaction, "transactionToClearSeenArticles"));
  if (v4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FRTodayAgent seenArticlesTransactions](self, "seenArticlesTransactions"));
    objc_msgSend(v3, "addObject:", v4);

  }
  -[FRTodayAgent _markDirtyWithFlags:](self, "_markDirtyWithFlags:", 2);

}

- (void)privateDataControllerDidBecomeClean:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FRTodayAgent privateDataContext](self, "privateDataContext"));
  v5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "personalizationData"));

  if (v5 == v10)
  {
    v9 = 32;
    goto LABEL_5;
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FRTodayAgent privateDataContext](self, "privateDataContext"));
  v7 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "readingHistory"));

  v8 = v10;
  if (v7 == v10)
  {
    v9 = 2;
LABEL_5:
    -[FRTodayAgent _markDirtyWithFlags:](self, "_markDirtyWithFlags:", v9);
    v8 = v10;
  }

}

- (void)userInfoDidChangeOnboardingStatus:(id)a3
{
  -[FRTodayAgent _markDirtyWithFlags:](self, "_markDirtyWithFlags:", 8);
}

- (void)bundleSubscriptionDidSubscribe:(id)a3
{
  -[FRTodayAgent _markDirtyWithFlags:](self, "_markDirtyWithFlags:", 16);
}

- (void)bundleSubscriptionDidExpire:(id)a3
{
  -[FRTodayAgent _markDirtyWithFlags:](self, "_markDirtyWithFlags:", 16);
}

- (void)bundleSubscriptionDidChange:(id)a3 previousBundleSubscription:(id)a4
{
  -[FRTodayAgent _markDirtyWithFlags:](self, "_markDirtyWithFlags:", 16, a4);
}

- (BOOL)_mayWidgetsBeVisible
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v3 = objc_msgSend(v2, "applicationState") != 0;

  return v3;
}

- (void)_markDirtyWithFlags:(unint64_t)a3 qualityOfService:(int64_t)a4
{
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[FRTodayAgent operationThrottler](self, "operationThrottler"));
  objc_msgSend(v6, "tickleWithQualityOfService:data:completion:", a4, a3, 0);

}

- (void)operationThrottler:(id)a3 performAsyncOperationWithQualityOfService:(int64_t)a4 completion:(id)a5
{
  id v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;
  int64_t v15;

  v7 = a5;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FRTodayAgent operationThrottler](self, "operationThrottler"));
  v9 = objc_msgSend(v8, "mergedData");

  v10 = objc_claimAutoreleasedReturnValue(-[FRTodayAgent transactionProcessingGroup](self, "transactionProcessingGroup"));
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_10005FB9C;
  v12[3] = &unk_1000DDC20;
  v12[4] = self;
  v13 = v7;
  v14 = v9;
  v15 = a4;
  v11 = v7;
  dispatch_group_notify(v10, (dispatch_queue_t)&_dispatch_main_q, v12);

}

- (void)setEnabled:(BOOL)a3
{
  self->_enabled = a3;
}

- (NSMutableArray)seenArticlesTransactions
{
  return self->_seenArticlesTransactions;
}

- (FCFeedPersonalizing)feedPersonalizer
{
  return self->_feedPersonalizer;
}

- (void)setFeedPersonalizer:(id)a3
{
  objc_storeStrong((id *)&self->_feedPersonalizer, a3);
}

- (FCPurchaseController)purchaseController
{
  return self->_purchaseController;
}

- (void)setPurchaseController:(id)a3
{
  objc_storeStrong((id *)&self->_purchaseController, a3);
}

- (FCSubscriptionController)subscriptionController
{
  return self->_subscriptionController;
}

- (void)setSubscriptionController:(id)a3
{
  objc_storeStrong((id *)&self->_subscriptionController, a3);
}

- (TSWidgetLocalNewsChannelServiceType)localNewsChannelService
{
  return self->_localNewsChannelService;
}

- (void)setLocalNewsChannelService:(id)a3
{
  objc_storeStrong((id *)&self->_localNewsChannelService, a3);
}

- (FCBundleSubscriptionManagerType)bundleSubscriptionManager
{
  return self->_bundleSubscriptionManager;
}

- (void)setBundleSubscriptionManager:(id)a3
{
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, a3);
}

- (FRLimitedPersonalizationDataGeneratorType)personalizationDataGenerator
{
  return self->_personalizationDataGenerator;
}

- (void)setPersonalizationDataGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_personalizationDataGenerator, a3);
}

- (void)setPrivateDataContext:(id)a3
{
  objc_storeStrong((id *)&self->_privateDataContext, a3);
}

- (NPUserEmbeddingGeneratorType)userEmbeddingGenerator
{
  return self->_userEmbeddingGenerator;
}

- (void)setUserEmbeddingGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_userEmbeddingGenerator, a3);
}

- (OS_dispatch_group)transactionProcessingGroup
{
  return self->_transactionProcessingGroup;
}

- (void)setTransactionProcessingGroup:(id)a3
{
  objc_storeStrong((id *)&self->_transactionProcessingGroup, a3);
}

- (void)setFileCoordinatedTodayPrivateDataTransactionQueue:(id)a3
{
  objc_storeStrong((id *)&self->_fileCoordinatedTodayPrivateDataTransactionQueue, a3);
}

- (FCFileCoordinatedTodayDropbox)fileCoordinatedTodayDropbox
{
  return self->_fileCoordinatedTodayDropbox;
}

- (void)setFileCoordinatedTodayDropbox:(id)a3
{
  objc_storeStrong((id *)&self->_fileCoordinatedTodayDropbox, a3);
}

- (void)setOperationThrottler:(id)a3
{
  objc_storeStrong((id *)&self->_operationThrottler, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operationThrottler, 0);
  objc_storeStrong((id *)&self->_fileCoordinatedTodayDropbox, 0);
  objc_storeStrong((id *)&self->_fileCoordinatedTodayPrivateDataTransactionQueue, 0);
  objc_storeStrong((id *)&self->_transactionProcessingGroup, 0);
  objc_storeStrong((id *)&self->_userEmbeddingGenerator, 0);
  objc_storeStrong((id *)&self->_privateDataContext, 0);
  objc_storeStrong((id *)&self->_personalizationDataGenerator, 0);
  objc_storeStrong((id *)&self->_bundleSubscriptionManager, 0);
  objc_storeStrong((id *)&self->_localNewsChannelService, 0);
  objc_storeStrong((id *)&self->_subscriptionController, 0);
  objc_storeStrong((id *)&self->_purchaseController, 0);
  objc_storeStrong((id *)&self->_feedPersonalizer, 0);
  objc_storeStrong((id *)&self->_seenArticlesTransactions, 0);
}

@end
