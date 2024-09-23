@implementation MTSubscriptionSyncProcessor

- (MTSubscriptionSyncProcessor)initWithStorage:(id)a3 config:(id)a4 cloudSyncBugReporter:(id)a5
{
  id v8;
  id v9;
  id v10;
  MTSubscriptionSyncProcessor *v11;
  MTSubscriptionSyncProcessor *v12;
  dispatch_queue_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  NSObject *v19;
  NSObject *v20;
  os_signpost_id_t signpostID;
  uint8_t v23[16];
  objc_super v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v24.receiver = self;
  v24.super_class = (Class)MTSubscriptionSyncProcessor;
  v11 = -[MTSubscriptionSyncProcessor init](&v24, "init");
  v12 = v11;
  if (v11)
  {
    -[MTSubscriptionSyncProcessor setConfig:](v11, "setConfig:", v9);
    -[MTSubscriptionSyncProcessor setStorageProvider:](v12, "setStorageProvider:", v8);
    -[MTSubscriptionSyncProcessor setCloudSyncBugReporter:](v12, "setCloudSyncBugReporter:", v10);
    v13 = dispatch_queue_create("MTSubscriptionSyncProcessor.workQueue", 0);
    -[MTSubscriptionSyncProcessor setWorkQueue:](v12, "setWorkQueue:", v13);

    v15 = _MTLogCategoryCloudSync(v14);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v12->_signpostID = os_signpost_id_generate(v16);

    v18 = _MTLogCategoryCloudSync(v17);
    v19 = objc_claimAutoreleasedReturnValue(v18);
    v20 = v19;
    signpostID = v12->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
    {
      *(_WORD *)v23 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v20, OS_SIGNPOST_EVENT, signpostID, "MTSubscriptionSyncProcessor.created", ", v23, 2u);
    }

  }
  return v12;
}

+ (id)subscriptionSyncProcessorSyncKeys
{
  if (qword_1005675D8 != -1)
    dispatch_once(&qword_1005675D8, &stru_1004ABF48);
  return (id)qword_1005675D0;
}

- (id)context
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "importContext"));

  return v3;
}

- (int64_t)operationTypeForSET
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v3 = objc_msgSend(v2, "syncType");

  if (v3 == (id)1)
    return 13;
  else
    return 1;
}

- (BOOL)hasLocalChanges
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v3 = objc_msgSend(v2, "syncDirtyFlag");

  return v3;
}

- (BOOL)requiresNextGetTransaction
{
  return 1;
}

- (id)versionForGetTransaction:(id)a3 key:(id)a4
{
  id v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  os_signpost_id_t signpostID;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  void *v20;
  int v22;
  id v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  id v27;

  v5 = a4;
  v6 = _MTLogCategoryCloudSync(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v22 = 138412290;
    v23 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTSubscriptionSyncProcessor.GET", "key: %@", (uint8_t *)&v22, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "syncVersion"));

  v13 = _MTLogCategoryCloudSync(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v22 = 138543874;
    v23 = v15;
    v24 = 2114;
    v25 = v11;
    v26 = 2114;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Version for GET transaction [%{public}@] key: %{public}@", (uint8_t *)&v22, 0x20u);

  }
  v17 = _MTLogCategoryCloudSync(v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v22 = 138543874;
    v23 = v19;
    v24 = 2114;
    v25 = v11;
    v26 = 2114;
    v27 = v5;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%{public}@ Gathering addedSubscriptions for GET transaction [%{public}@] key: %{public}@", (uint8_t *)&v22, 0x20u);

  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor _addedSubscriptions](self, "_addedSubscriptions"));
  -[MTSubscriptionSyncProcessor setAddedSubscriptions:](self, "setAddedSubscriptions:", v20);

  -[MTSubscriptionSyncProcessor setInitialSubscribedPodcastsCount:](self, "setInitialSubscribedPodcastsCount:", -[MTSubscriptionSyncProcessor _subscribedPodcastsCount](self, "_subscribedPodcastsCount"));
  return v11;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  NSObject *v16;
  os_signpost_id_t signpostID;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  NSObject *v32;
  void *v33;
  id v34;
  void *v35;
  id v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  id v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  void *v50;
  MZKeyValueStoreNode *v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  NSObject *v55;
  void *v56;
  void *v57;
  int v59;
  id v60;
  __int16 v61;
  id v62;
  __int16 v63;
  id v64;
  __int16 v65;
  id v66;
  __int16 v67;
  void *v68;

  v7 = a4;
  v8 = +[SyncKeysRepository shouldSyncInReadOnlyMode](_TtC18PodcastsFoundation18SyncKeysRepository, "shouldSyncInReadOnlyMode");
  if ((_DWORD)v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor cloudSyncBugReporter](self, "cloudSyncBugReporter"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v11 = objc_msgSend(v10, "syncType");
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "syncVersion"));
    objc_msgSend(v9, "reportSubscriptionsSyncIssue:subscriptionSyncType:version:userInfo:", 4, v11, v13, 0);

  }
  v14 = _MTLogCategoryCloudSync(v8);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  v16 = v15;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    v59 = 138412290;
    v60 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v16, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTSubscriptionSyncProcessor.SET", "key: %@", (uint8_t *)&v59, 0xCu);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  if (objc_msgSend(v18, "syncDirtyFlag"))
  {

  }
  else
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "syncVersion"));

    if (v20)
    {
      v22 = _MTLogCategoryCloudSync(v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
        v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v25, "syncDirtyFlag")));
        v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
        v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "syncVersion"));
        v59 = 138544130;
        v60 = v24;
        v61 = 2114;
        v62 = v26;
        v63 = 2114;
        v64 = v28;
        v65 = 2114;
        v66 = v7;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "%{public}@ No data for SET transaction. syncDirtyFlag: %{public}@, podcastSyncVersion: %{public}@, key: %{public}@", (uint8_t *)&v59, 0x2Au);

      }
      goto LABEL_21;
    }
  }
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "syncVersion"));

  v31 = _MTLogCategoryCloudSync(v30);
  v32 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v34 = *a5;
    v59 = 138543874;
    v60 = v33;
    v61 = 2114;
    v62 = v34;
    v63 = 2114;
    v64 = v7;
    _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "%{public}@ Gathering data for SET transaction [%{public}@] key: %{public}@", (uint8_t *)&v59, 0x20u);

  }
  v23 = objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor _podcastSubscriptions](self, "_podcastSubscriptions"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor _addedSubscriptions](self, "_addedSubscriptions"));
  -[MTSubscriptionSyncProcessor setAddedSubscriptions:](self, "setAddedSubscriptions:", v35);

  v36 = -[MTSubscriptionSyncProcessor setInitialSubscribedPodcastsCount:](self, "setInitialSubscribedPodcastsCount:", -[MTSubscriptionSyncProcessor _subscribedPodcastsCount](self, "_subscribedPodcastsCount"));
  if (!v23)
  {
LABEL_21:
    v52 = 0;
    goto LABEL_22;
  }
  v37 = _MTLogCategoryCloudSync(v36);
  v38 = objc_claimAutoreleasedReturnValue(v37);
  if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
  {
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v40 = *a5;
    v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSObject count](v23, "count")));
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSObject description](v23, "description"));
    v59 = 138544387;
    v60 = v39;
    v61 = 2114;
    v62 = v40;
    v63 = 2114;
    v64 = v7;
    v65 = 2114;
    v66 = v41;
    v67 = 2113;
    v68 = v42;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "%{public}@ Providing data for SET transaction [%{public}@] key: %{public}@ : count %{public}@, data: %{private}@", (uint8_t *)&v59, 0x34u);

  }
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "syncVersion"));
  v45 = (uint64_t)objc_msgSend(v44, "integerValue");

  if (!-[NSObject count](v23, "count") && *a5 && v45 >= 11)
  {
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor cloudSyncBugReporter](self, "cloudSyncBugReporter"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v48 = objc_msgSend(v47, "syncType");
    v49 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "syncVersion"));
    objc_msgSend(v46, "reportSubscriptionsSyncIssue:subscriptionSyncType:version:userInfo:", 0, v48, v50, 0);

  }
  v51 = objc_alloc_init(MZKeyValueStoreNode);
  -[MZKeyValueStoreNode setArrayValue:](v51, "setArrayValue:", v23);
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](v51, "value"));

LABEL_22:
  v54 = _MTLogCategoryCloudSync(v53);
  v55 = objc_claimAutoreleasedReturnValue(v54);
  if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
  {
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v59 = 138543362;
    v60 = v56;
    _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting subscriptions sync dirty = NO", (uint8_t *)&v59, 0xCu);

  }
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v57, "setSyncDirtyFlag:", 0);

  return v52;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v6, "setPodcastsDomainVersion:", v5);

}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _BOOL8 v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a4;
  v15 = _MTLogCategoryCloudSync(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v19 = 138543874;
    v20 = v17;
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Successful GET transaction for key: %{public}@, new version: [%{public}@]", (uint8_t *)&v19, 0x20u);

  }
  v18 = -[MTSubscriptionSyncProcessor mergeData:forKey:version:mismatch:](self, "mergeData:forKey:version:mismatch:", v14, v11, v12, 0);

  -[MTSubscriptionSyncProcessor completeTransactionWithNewVersion:mismatch:finishedBlock:](self, "completeTransactionWithNewVersion:mismatch:finishedBlock:", v12, v18, v13);
}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  id v19;
  __int16 v20;
  id v21;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  v13 = _MTLogCategoryCloudSync(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v16 = 138543874;
    v17 = v15;
    v18 = 2114;
    v19 = v10;
    v20 = 2114;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Successful SET transaction for key: %{public}@, new version: [%{public}@]", (uint8_t *)&v16, 0x20u);

  }
  -[MTSubscriptionSyncProcessor markAddedSubscriptionsAsSynced](self, "markAddedSubscriptionsAsSynced");
  -[MTSubscriptionSyncProcessor completeTransactionWithNewVersion:mismatch:finishedBlock:](self, "completeTransactionWithNewVersion:mismatch:finishedBlock:", v11, 0, v12);

}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _BOOL8 v18;
  int v19;
  void *v20;
  __int16 v21;
  id v22;
  __int16 v23;
  id v24;

  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a4;
  v15 = _MTLogCategoryCloudSync(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v19 = 138543874;
    v20 = v17;
    v21 = 2114;
    v22 = v11;
    v23 = 2114;
    v24 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Conflict on SET transaction for key: %{public}@, new version: [%{public}@]", (uint8_t *)&v19, 0x20u);

  }
  v18 = -[MTSubscriptionSyncProcessor mergeData:forKey:version:mismatch:](self, "mergeData:forKey:version:mismatch:", v14, v11, v12, 1);

  -[MTSubscriptionSyncProcessor completeTransactionWithNewVersion:mismatch:finishedBlock:](self, "completeTransactionWithNewVersion:mismatch:finishedBlock:", v12, v18, v13);
}

- (BOOL)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  id v12;
  unsigned __int8 v13;
  BOOL v14;

  v6 = a6;
  v10 = a5;
  v11 = a4;
  v12 = a3;
  if (+[SyncKeysRepository shouldSyncInReadOnlyMode](_TtC18PodcastsFoundation18SyncKeysRepository, "shouldSyncInReadOnlyMode"))v13 = -[MTSubscriptionSyncProcessor overrideLocalWithRemoteData:forKey:version:mismatch:](self, "overrideLocalWithRemoteData:forKey:version:mismatch:", v12, v11, v10, v6);
  else
    v13 = -[MTSubscriptionSyncProcessor mergeLocalAndRemoteData:forKey:version:mismatch:](self, "mergeLocalAndRemoteData:forKey:version:mismatch:", v12, v11, v10, v6);
  v14 = v13;

  return v14;
}

- (BOOL)overrideLocalWithRemoteData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6
{
  _BOOL4 v6;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  _BOOL4 v23;
  MZKeyValueStoreNode *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  const __CFString *v31;
  void *v32;
  id v34;
  void *v35;
  _QWORD v36[5];
  id v37;
  id v38;
  id v39;
  _BYTE *v40;
  BOOL v41;
  _QWORD v42[2];
  _QWORD v43[2];
  uint8_t v44[4];
  void *v45;
  _BYTE buf[24];
  char v47;

  v6 = a6;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = _MTLogCategoryCloudSync(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor addedSubscriptions](self, "addedSubscriptions"));
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v15;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v16;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%{public}@ Read-only sync mode -> Overriding all local data. Local shows that will be overriden: %@; Also, deletin"
      "g all Hidden podcasts synchronously.",
      buf,
      0x16u);

  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  *(_QWORD *)buf = 0;
  *(_QWORD *)&buf[8] = buf;
  *(_QWORD *)&buf[16] = 0x2020000000;
  v47 = 0;
  v36[0] = _NSConcreteStackBlock;
  v36[1] = 3221225472;
  v36[2] = sub_100128148;
  v36[3] = &unk_1004ABF70;
  v36[4] = self;
  v40 = buf;
  v17 = v10;
  v37 = v17;
  v18 = v11;
  v38 = v18;
  v34 = v12;
  v39 = v34;
  v41 = v6;
  v19 = objc_msgSend(v35, "performBlockAndWaitWithSave:", v36);
  if (*(_BYTE *)(*(_QWORD *)&buf[8] + 24))
  {
    v20 = _MTLogCategoryCloudSync(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      *(_DWORD *)v44 = 138543362;
      v45 = v22;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "%{public}@ Found a merge conflict on read-only sync mode!", v44, 0xCu);

    }
    v23 = v6;
    v24 = objc_alloc_init(MZKeyValueStoreNode);
    -[MZKeyValueStoreNode setKey:](v24, "setKey:", v18);
    -[MZKeyValueStoreNode setValue:](v24, "setValue:", v17);
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode arrayValue](v24, "arrayValue"));
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor cloudSyncBugReporter](self, "cloudSyncBugReporter"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v28 = objc_msgSend(v27, "syncType");
    v29 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "syncVersion"));
    v42[0] = CFSTR("remoteData");
    v42[1] = CFSTR("remoteMismatch");
    v31 = CFSTR("false");
    if (v23)
      v31 = CFSTR("true");
    v43[0] = v25;
    v43[1] = v31;
    v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v43, v42, 2));
    objc_msgSend(v26, "reportSubscriptionsSyncIssue:subscriptionSyncType:version:userInfo:", 3, v28, v30, v32);

  }
  _Block_object_dispose(buf, 8);

  return 0;
}

- (BOOL)mergeLocalAndRemoteData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6
{
  uint64_t v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  NSObject *v13;
  void *v14;
  id v15;
  id v16;
  id v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  void *v23;
  uint64_t v24;
  NSObject *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  NSMutableSet *v32;
  NSMutableSet *v33;
  void *v34;
  id v35;
  NSObject *v36;
  NSMutableSet *v37;
  NSMutableSet *v38;
  id v39;
  id v40;
  uint64_t v41;
  NSObject *v42;
  id v43;
  id v44;
  id v45;
  uint64_t v46;
  NSObject *v47;
  id v48;
  id v49;
  void *v50;
  void *v51;
  void *v52;
  uint64_t v53;
  void *v54;
  id v56;
  id v57;
  id v58;
  _BOOL4 v59;
  MZKeyValueStoreNode *v60;
  id obj;
  _QWORD v63[5];
  id v64;
  NSObject *v65;
  NSMutableSet *v66;
  NSMutableSet *v67;
  id v68;
  _BYTE *v69;
  BOOL v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  uint8_t v75[4];
  id v76;
  __int16 v77;
  id v78;
  uint8_t v79[128];
  _BYTE buf[24];
  id v81;
  __int16 v82;
  _BOOL4 v83;

  v59 = a6;
  v56 = a3;
  v58 = a4;
  v57 = a5;
  v8 = _MTLogCategoryCloudSync(v57);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    *(_DWORD *)buf = 138544130;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v58;
    *(_WORD *)&buf[22] = 2114;
    v81 = v57;
    v82 = 1026;
    v83 = v59;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Merging data for key: %{public}@; newVersion: [%{public}@]; mismatch: %{public}d",
      buf,
      0x26u);

  }
  v60 = objc_alloc_init(MZKeyValueStoreNode);
  -[MZKeyValueStoreNode setKey:](v60, "setKey:", v58);
  -[MZKeyValueStoreNode setValue:](v60, "setValue:", v56);
  if (-[MZKeyValueStoreNode hasData](v60, "hasData"))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode arrayValue](v60, "arrayValue"));
    v12 = _MTLogCategoryCloudSync(v11);
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      v15 = objc_msgSend(v11, "count");
      *(_DWORD *)buf = 138543618;
      *(_QWORD *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v15;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "%{public}@ Merging %lu remote dictionaries:", buf, 0x16u);

    }
    v73 = 0u;
    v74 = 0u;
    v71 = 0u;
    v72 = 0u;
    obj = v11;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
    v17 = v16;
    if (v16)
    {
      v18 = *(_QWORD *)v72;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v72 != v18)
            objc_enumerationMutation(obj);
          v20 = *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * (_QWORD)v19);
          v21 = _MTLogCategoryCloudSync(v16);
          v22 = objc_claimAutoreleasedReturnValue(v21);
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
          {
            v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
            *(_DWORD *)buf = 138543619;
            *(_QWORD *)&buf[4] = v23;
            *(_WORD *)&buf[12] = 2113;
            *(_QWORD *)&buf[14] = v20;
            _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "%{public}@ %{private}@", buf, 0x16u);

          }
          v19 = (char *)v19 + 1;
        }
        while (v17 != v19);
        v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v79, 16);
        v17 = v16;
      }
      while (v16);
    }

    if (!objc_msgSend(obj, "count"))
    {
      v24 = _MTLogCategoryCloudSync(0);
      v25 = objc_claimAutoreleasedReturnValue(v24);
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
        *(_DWORD *)buf = 138543362;
        *(_QWORD *)&buf[4] = v26;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%{public}@ Nothing to merge: Store node has data, but there are no podcast items.", buf, 0xCu);

      }
      v28 = _MTLogCategoryCloudSync(v27);
      v29 = objc_claimAutoreleasedReturnValue(v28);
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
        v31 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode debugDescription](v60, "debugDescription"));
        *(_DWORD *)buf = 138543619;
        *(_QWORD *)&buf[4] = v30;
        *(_WORD *)&buf[12] = 2113;
        *(_QWORD *)&buf[14] = v31;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%{public}@ Node data: %{private}@", buf, 0x16u);

      }
    }
    v32 = objc_opt_new(NSMutableSet);
    v33 = objc_opt_new(NSMutableSet);
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    LOBYTE(v81) = v59;
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100128988;
    v63[3] = &unk_1004ABF98;
    v63[4] = self;
    v35 = v34;
    v64 = v35;
    v36 = obj;
    v65 = v36;
    v37 = v32;
    v66 = v37;
    v38 = v33;
    v67 = v38;
    v70 = v59;
    v39 = v57;
    v68 = v39;
    v69 = buf;
    objc_msgSend(v35, "performBlockAndWaitWithSave:", v63);
    LOBYTE(v59) = (*(unsigned __int8 *)(*(_QWORD *)&buf[8] + 24) | v59) != 0;
    v40 = -[NSMutableSet count](v37, "count");
    if (v40)
    {
      v41 = _MTLogCategoryCloudSync(v40);
      v42 = objc_claimAutoreleasedReturnValue(v41);
      if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
      {
        v43 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
        v44 = -[NSMutableSet count](v37, "count");
        *(_DWORD *)v75 = 138543618;
        v76 = v43;
        v77 = 2050;
        v78 = v44;
        _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "%{public}@ Subscribing to %{public}lu podcasts from cloud sync", v75, 0x16u);

      }
      -[MTSubscriptionSyncProcessor subscribeFromCloudToPodcasts:](self, "subscribeFromCloudToPodcasts:", v37);
    }
    v45 = -[NSMutableSet count](v38, "count");
    if (v45)
    {
      v46 = _MTLogCategoryCloudSync(v45);
      v47 = objc_claimAutoreleasedReturnValue(v46);
      if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
      {
        v48 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
        v49 = -[NSMutableSet count](v38, "count");
        *(_DWORD *)v75 = 138543618;
        v76 = v48;
        v77 = 2050;
        v78 = v49;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_ERROR, "%{public}@ Unsubscribing %{public}lu podcasts from cloud sync (will be also deleted if they need to)", v75, 0x16u);

      }
      v50 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
      v51 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableSet allObjects](v38, "allObjects"));
      v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
      objc_msgSend(v50, "disableSubscriptionsWithUuids:ctx:", v51, v52);

      -[MTSubscriptionSyncProcessor checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:podcastsToUnsubscribeCount:newVersion:](self, "checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:podcastsToUnsubscribeCount:newVersion:", -[MTSubscriptionSyncProcessor initialSubscribedPodcastsCount](self, "initialSubscribedPodcastsCount"), -[NSMutableSet count](v38, "count"), v39);
    }
    -[MTSubscriptionSyncProcessor reorderLocalPodcastsToMatchRemote:](self, "reorderLocalPodcastsToMatchRemote:", v36);

    _Block_object_dispose(buf, 8);
  }
  else
  {
    v53 = _MTLogCategoryCloudSync(-[MTSubscriptionSyncProcessor markAddedSubscriptionsAsSynced](self, "markAddedSubscriptionsAsSynced"));
    v36 = objc_claimAutoreleasedReturnValue(v53);
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      v54 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      *(_DWORD *)buf = 138544130;
      *(_QWORD *)&buf[4] = v54;
      *(_WORD *)&buf[12] = 2114;
      *(_QWORD *)&buf[14] = v57;
      *(_WORD *)&buf[22] = 2114;
      v81 = v58;
      v82 = 1024;
      v83 = v59;
      _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "%{public}@ Nothing to merge: No data in the cloud node version: [%{public}@] key: %{public}@ mismatch:%d", buf, 0x26u);

    }
  }

  return v59;
}

- (id)podcastCacheInContext:(id)a3
{
  id v4;
  MTEntityUpdaterCache *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  MTEntityUpdaterCache *v10;
  _QWORD v12[3];

  v4 = a3;
  v5 = [MTEntityUpdaterCache alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForSyncablePodcastsForSyncType:](MTPodcast, "predicateForSyncablePodcastsForSyncType:", objc_msgSend(v6, "syncType")));
  v8 = kMTPodcastEntityName;
  v12[0] = kPodcastStoreCollectionId;
  v12[1] = kPodcastFeedUrl;
  v12[2] = kPodcastUuid;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v12, 3));
  v10 = -[MTEntityUpdaterCache initWithPredicate:entityName:ctx:properties:fetchProperties:](v5, "initWithPredicate:entityName:ctx:properties:fetchProperties:", v7, v8, v4, v9, 0);

  -[MTEntityUpdaterCache setAllowKeyForValue:](v10, "setAllowKeyForValue:", &stru_1004ABFD8);
  return v10;
}

- (void)importRemotePodcastDicts:(id)a3 inContext:(id)a4 visitingPodcastsInCache:(id)a5 updatingPodcastsToAdd:(id)a6 updatingPodcastsToUnsubscribe:(id)a7 mismatch:(BOOL)a8 version:(id)a9
{
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  _BOOL8 v34;
  _BOOL8 v35;
  _BOOL8 v36;
  uint64_t v37;
  NSObject *v38;
  void *v39;
  MTSubscriptionSyncProcessor *v40;
  uint64_t v41;
  uint64_t v42;
  id obj;
  _BOOL4 v44;
  id v45;
  id v46;
  id v47;
  id v48;
  void *v49;
  uint64_t v50;
  id v51;
  id v52;
  uint64_t v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint8_t buf[4];
  void *v59;
  __int16 v60;
  const __CFString *v61;
  __int16 v62;
  void *v63;
  __int16 v64;
  void *v65;
  __int16 v66;
  id v67;
  _BYTE v68[128];

  v44 = a8;
  v14 = a3;
  v48 = a4;
  v51 = a5;
  v47 = a6;
  v46 = a7;
  v45 = a9;
  v54 = 0u;
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  obj = v14;
  v52 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
  if (v52)
  {
    v15 = *(_QWORD *)v55;
    v53 = kPodcastFeedUrl;
    v42 = kPodcastTitle;
    v41 = kPodcastStoreCollectionId;
    v50 = kPodcastUuid;
    v40 = self;
    do
    {
      for (i = 0; i != v52; i = (char *)i + 1)
      {
        if (*(_QWORD *)v55 != v15)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)i);
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v53));
        v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "propertyDictionaryForSearchItem:", v17));
        v20 = _MTLogCategoryCloudSync(v19);
        v21 = objc_claimAutoreleasedReturnValue(v20);
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
          v23 = v15;
          if (v19)
            v24 = CFSTR("Found");
          else
            v24 = CFSTR("Didn't find");
          v49 = v18;
          v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v42));
          v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v53));
          v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectForKey:", v41));
          v28 = objc_msgSend(v27, "unsignedLongLongValue");
          *(_DWORD *)buf = 138544387;
          v59 = v22;
          v60 = 2114;
          v61 = v24;
          v15 = v23;
          v62 = 2113;
          v63 = v25;
          v64 = 2113;
          v65 = v26;
          v66 = 2049;
          v67 = v28;
          _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ %{public}@ local match for podcast \"%{private}@\", %{private}@, %{private}lld", buf, 0x34u);

          self = v40;
          v18 = v49;

        }
        v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "objectForKeyedSubscript:", v50));
        v30 = (void *)v29;
        if (v19)
        {
          v29 = objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "podcastForUuid:", v29));
          v31 = (void *)v29;
          if (v18)
            goto LABEL_13;
        }
        else
        {
          v31 = 0;
          if (v18)
          {
LABEL_13:
            v32 = -[MTSubscriptionSyncProcessor updatePodcastsToUnsubscribe:remotePodcast:localPodcast:](self, "updatePodcastsToUnsubscribe:remotePodcast:localPodcast:", v46, v17, v31);
            v33 = v18;
            v34 = -[MTSubscriptionSyncProcessor updateSettingsIfNeededForLocalPodcast:remotePodcast:](self, "updateSettingsIfNeededForLocalPodcast:remotePodcast:", v31, v17);
            v35 = -[MTSubscriptionSyncProcessor updatePodcastsToAdd:addingPodcastIfNeeded:hasLocalPodcast:](self, "updatePodcastsToAdd:addingPodcastIfNeeded:hasLocalPodcast:", v47, v17, v31 != 0);
            v36 = v34;
            v18 = v33;
            -[MTSubscriptionSyncProcessor reportImportingRemotePodcast:withLocalPodcast:shouldAddPodcast:shouldUnsubscribeLocalPodcast:shouldUpdateSettings:mismatch:version:](self, "reportImportingRemotePodcast:withLocalPodcast:shouldAddPodcast:shouldUnsubscribeLocalPodcast:shouldUpdateSettings:mismatch:version:", v17, v31, v35, v32, v36, v44, v45);
            goto LABEL_18;
          }
        }
        v37 = _MTLogCategoryCloudSync(v29);
        v38 = objc_claimAutoreleasedReturnValue(v37);
        if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
        {
          v39 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
          *(_DWORD *)buf = 138543362;
          v59 = v39;
          _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "%{public}@ Found podcast in BK with nil feedURL. Can't follow it. Continuing to next one.", buf, 0xCu);

        }
LABEL_18:

      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v68, 16);
    }
    while (v52);
  }

}

- (BOOL)updatePodcastsToUnsubscribe:(id)a3 remotePodcast:(id)a4 localPodcast:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  unsigned int v12;
  id v13;
  BOOL v14;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  int v25;
  void *v26;
  __int16 v27;
  void *v28;
  __int16 v29;
  void *v30;
  __int16 v31;
  id v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kPodcastSubscribed));
  v12 = objc_msgSend(v11, "BOOLValue");

  if (v10 && (v13 = objc_msgSend(v10, "subscribed"), ((v13 ^ 1 | v12) & 1) == 0))
  {
    v15 = _MTLogCategoryCloudSync(v13);
    v16 = objc_claimAutoreleasedReturnValue(v15);
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "title"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "feedURL"));
      v20 = objc_msgSend(v10, "storeCollectionId");
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
      v25 = 138544643;
      v26 = v17;
      v27 = 2113;
      v28 = v18;
      v29 = 2113;
      v30 = v19;
      v31 = 2049;
      v32 = v20;
      v33 = 2114;
      v34 = v21;
      v35 = 2113;
      v36 = v22;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%{public}@ Marking local podcast for unsubscribe: \"%{private}@\", %{private}@, %{private}lld, %{public}@. Remote dict: %{private}@", (uint8_t *)&v25, 0x3Eu);

    }
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "uuid"));
    objc_msgSend(v8, "addObject:", v23);

    v14 = 1;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (BOOL)updateSettingsIfNeededForLocalPodcast:(id)a3 remotePodcast:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  if (v6)
    -[MTSubscriptionSyncProcessor updateSettingsForLocalPodcast:remotePodcast:ctx:](self, "updateSettingsForLocalPodcast:remotePodcast:ctx:", v6, v7, v8);

  return v6 != 0;
}

- (BOOL)updatePodcastsToAdd:(id)a3 addingPodcastIfNeeded:(id)a4 hasLocalPodcast:(BOOL)a5
{
  int v5;
  id v8;
  id v9;
  void *v10;
  unsigned int v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  void *v17;
  int v19;
  void *v20;
  __int16 v21;
  void *v22;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", kPodcastSubscribed));
  v11 = objc_msgSend(v10, "BOOLValue");

  v13 = v11 & ~v5;
  if (v13 == 1)
  {
    v14 = _MTLogCategoryCloudSync(v12);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "description"));
      v19 = 138543619;
      v20 = v16;
      v21 = 2113;
      v22 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Marking remote podcast for insertion in local DB [reason: not in local DB and subscribed]: %{private}@", (uint8_t *)&v19, 0x16u);

    }
    objc_msgSend(v8, "addObject:", v9);
  }

  return v13;
}

- (void)reportImportingRemotePodcast:(id)a3 withLocalPodcast:(id)a4 shouldAddPodcast:(BOOL)a5 shouldUnsubscribeLocalPodcast:(BOOL)a6 shouldUpdateSettings:(BOOL)a7 mismatch:(BOOL)a8 version:(id)a9
{
  _BOOL8 v9;
  _BOOL4 v10;
  _BOOL4 v11;
  _BOOL4 v12;
  id v15;
  id v16;
  id v17;
  void *v18;
  unsigned int v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  _QWORD v28[2];
  _QWORD v29[2];

  v9 = a8;
  v10 = a7;
  v11 = a6;
  v12 = a5;
  v15 = a3;
  v16 = a4;
  v17 = a9;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor config](self, "config"));
  v19 = objc_msgSend(v18, "supportsMetrics");

  if (v19)
  {
    v20 = objc_msgSend(v15, "mutableCopy");
    objc_msgSend(v20, "setValue:forKey:", v17, CFSTR("version"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
    objc_msgSend(v20, "setValue:forKey:", v21, CFSTR("mismatch"));

    v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor syncDictionaryToMetricsDictionary:](self, "syncDictionaryToMetricsDictionary:", v15));
    objc_msgSend(v20, "setValue:forKey:", v22, CFSTR("sync_data"));

    if (v10)
    {
      v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
      objc_msgSend(v24, "recordUserAction:dataSource:withData:", CFSTR("cloud_sync_update_podcast"), v16, v20);

      if (!v11)
      {
LABEL_4:
        if (!v12)
        {
LABEL_6:

          goto LABEL_7;
        }
LABEL_5:
        v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
        objc_msgSend(v23, "recordUserAction:dataSource:withData:", CFSTR("cloud_sync_add_podcast"), 0, v20);

        goto LABEL_6;
      }
    }
    else if (!v11)
    {
      goto LABEL_4;
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v28[0] = CFSTR("version");
    v28[1] = CFSTR("mismatch");
    v29[0] = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v9));
    v29[1] = v26;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v29, v28, 2));
    objc_msgSend(v25, "recordUserAction:dataSource:withData:", CFSTR("cloud_sync_delete_podcast"), v16, v27);

    if (!v12)
      goto LABEL_6;
    goto LABEL_5;
  }
LABEL_7:

}

- (id)unvisitedPodcastsToUnsubscribeIn:(id)a3 mismatch:(BOOL *)a4 version:(id)a5
{
  id v8;
  id v9;
  NSMutableSet *v10;
  id v11;
  id v12;
  NSMutableSet *v13;
  NSMutableSet *v14;
  _QWORD v16[4];
  id v17;
  MTSubscriptionSyncProcessor *v18;
  id v19;
  NSMutableSet *v20;
  BOOL *v21;

  v8 = a5;
  v9 = a3;
  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100129780;
  v16[3] = &unk_1004AC000;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  v18 = self;
  v19 = v8;
  v21 = a4;
  v10 = objc_opt_new(NSMutableSet);
  v20 = v10;
  v11 = v8;
  v12 = v17;
  objc_msgSend(v9, "enumerateUnvisitedItemUuids:", v16);

  v13 = v20;
  v14 = v10;

  return v14;
}

- (void)checkPotentialLibraryDeletionIssueForPreviouslySubscribedPodcastsCount:(unint64_t)a3 podcastsToUnsubscribeCount:(unint64_t)a4 newVersion:(id)a5
{
  double v8;
  uint64_t v9;
  NSObject *v10;
  _BOOL4 v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  __int16 v23;
  unint64_t v24;
  __int16 v25;
  unint64_t v26;
  __int16 v27;
  double v28;
  _QWORD v29[3];
  _QWORD v30[3];

  v8 = (double)a4 / (double)a3;
  v9 = _MTLogCategoryCloudSync(self);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (a3 >= 0xA && v8 >= 0.8)
  {
    if (v11)
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      v21 = 138543874;
      v22 = v12;
      v23 = 2048;
      v24 = a4;
      v25 = 2048;
      v26 = *(_QWORD *)&v8;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Big library unsubscription detected: podcastsToUnsubscribeCount: %lu, unsubscribedRatio: %f", (uint8_t *)&v21, 0x20u);

    }
    v10 = objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor cloudSyncBugReporter](self, "cloudSyncBugReporter"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v14 = objc_msgSend(v13, "syncType");
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "syncVersion"));
    v29[0] = CFSTR("previouslyFollowedShowsCount");
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a3));
    v30[0] = v17;
    v29[1] = CFSTR("showsToUnfollowCount");
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v30[1] = v18;
    v29[2] = CFSTR("unfollowRatio");
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v8));
    v30[2] = v19;
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v30, v29, 3));
    -[NSObject reportSubscriptionsSyncIssue:subscriptionSyncType:version:userInfo:](v10, "reportSubscriptionsSyncIssue:subscriptionSyncType:version:userInfo:", 1, v14, v16, v20);

    goto LABEL_8;
  }
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v21 = 138544130;
    v22 = v13;
    v23 = 2048;
    v24 = a4;
    v25 = 2048;
    v26 = a3;
    v27 = 2048;
    v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %ld unsubscriptions detected out of %ld total subscribed shows, unsubscriptionRatio: %f", (uint8_t *)&v21, 0x2Au);
LABEL_8:

  }
}

- (void)completeTransactionWithNewVersion:(id)a3 mismatch:(BOOL)a4 finishedBlock:(id)a5
{
  _BOOL8 v6;
  __CFString *v8;
  void (**v9)(id, _BOOL8);
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t signpostID;
  const __CFString *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  NSObject *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  NSObject *v29;
  uint64_t v30;
  void *v31;
  const __CFString *v32;
  void *v33;
  void *v34;
  int v35;
  uint64_t v36;
  __int16 v37;
  const __CFString *v38;
  __int16 v39;
  void *v40;
  __int16 v41;
  _BOOL4 v42;

  v6 = a4;
  v8 = (__CFString *)a3;
  v9 = (void (**)(id, _BOOL8))a5;
  v10 = _MTLogCategoryCloudSync(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    v14 = CFSTR("NO");
    if (v6)
      v14 = CFSTR("YES");
    v35 = 138412290;
    v36 = (uint64_t)v14;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_END, signpostID, "MTSubscriptionSyncProcessor.completed", "mismatch %@", (uint8_t *)&v35, 0xCu);
  }

  v16 = _MTLogCategoryCloudSync(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "syncVersion"));
    v35 = 138544130;
    v36 = (uint64_t)v18;
    v37 = 2114;
    v38 = v8;
    v39 = 2114;
    v40 = v20;
    v41 = 1024;
    v42 = v6;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "%{public}@ Transaction complete: Updating sync version to %{public}@ (from %{public}@), mismatch %d", (uint8_t *)&v35, 0x26u);

  }
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v21, "setSyncVersion:", v8);

  v23 = _MTLogCategoryCloudSync(v22);
  v24 = objc_claimAutoreleasedReturnValue(v23);
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v35 = 138543362;
    v36 = (uint64_t)v25;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "%{public}@ Cleaning up old hidden podcasts after successful transaction", (uint8_t *)&v35, 0xCu);

  }
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v26, "cleanUpOldHiddenPodcasts");

  v28 = _MTLogCategoryCloudSync(v27);
  v29 = objc_claimAutoreleasedReturnValue(v28);
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
  {
    v30 = objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v31 = (void *)v30;
    v32 = CFSTR("NO");
    if (v6)
      v32 = CFSTR("YES");
    v35 = 138543618;
    v36 = v30;
    v37 = 2114;
    v38 = v32;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting subscriptions sync dirty = %{public}@", (uint8_t *)&v35, 0x16u);

  }
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v33, "setSyncDirtyFlag:", v6);

  if (!v6)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    objc_msgSend(v34, "updateSubscriptionsLastSyncTimestamp");

  }
  v9[2](v9, v6);

}

- (void)reorderLocalPodcastsToMatchRemote:(id)a3
{
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  MTSubscriptionSyncProcessor *v13;
  uint8_t buf[4];
  void *v15;

  v4 = a3;
  v5 = _MTLogCategoryCloudSync(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    *(_DWORD *)buf = 138543362;
    v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "%{public}@ Reordering local podcasts to match remote dictionaries:", buf, 0xCu);

  }
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10012A358;
  v10[3] = &unk_1004A7398;
  v11 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  v12 = v4;
  v13 = self;
  v8 = v4;
  v9 = v11;
  objc_msgSend(v9, "performBlockAndWaitWithSave:", v10);

}

- (id)syncDictionaryToMetricsDictionary:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = objc_msgSend((id)objc_opt_class(self), "subscriptionSyncProcessorSyncKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "dictionaryWithValuesForKeys:", v6));

  return v7;
}

- (id)_addedSubscriptions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableSet *v10;
  id v11;
  id v12;
  NSMutableSet *v13;
  NSMutableSet *v14;
  _QWORD v16[4];
  id v17;
  id v18;
  MTSubscriptionSyncProcessor *v19;
  NSMutableSet *v20;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForSyncablePodcastsForSyncType:](MTPodcast, "predicateForSyncablePodcastsForSyncType:", objc_msgSend(v4, "syncType")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), kPodcastFeedUrl));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "AND:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForHasBeenSynced:](MTPodcast, "predicateForHasBeenSynced:", 0));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "AND:", v8));

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_10012A9A4;
  v16[3] = &unk_1004A6C78;
  v17 = v3;
  v18 = v9;
  v19 = self;
  v10 = objc_opt_new(NSMutableSet);
  v20 = v10;
  v11 = v9;
  v12 = v3;
  objc_msgSend(v12, "performBlockAndWait:", v16);
  v13 = v20;
  v14 = v10;

  return v14;
}

- (unint64_t)_subscribedPodcastsCount
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  unint64_t v12;
  _QWORD v14[4];
  id v15;
  id v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForSyncablePodcastsForSyncType:](MTPodcast, "predicateForSyncablePodcastsForSyncType:", objc_msgSend(v4, "syncType")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("%K != NULL"), kPodcastFeedUrl));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "AND:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForSubscribedPodcasts](MTPodcast, "predicateForSubscribedPodcasts"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "AND:", v8));

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10012AD54;
  v14[3] = &unk_1004A6F10;
  v17 = &v18;
  v10 = v3;
  v15 = v10;
  v11 = v9;
  v16 = v11;
  objc_msgSend(v10, "performBlockAndWait:", v14);
  v12 = v19[3];

  _Block_object_dispose(&v18, 8);
  return v12;
}

- (void)markAddedSubscriptionsAsSynced
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  __int16 v11;
  void *v12;

  v3 = _MTLogCategoryCloudSync(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor addedSubscriptions](self, "addedSubscriptions"));
    v9 = 138543619;
    v10 = v5;
    v11 = 2113;
    v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Marking new subscriptions as synced: %{private}@", (uint8_t *)&v9, 0x16u);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor addedSubscriptions](self, "addedSubscriptions"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForPodcastUuids:](MTPodcast, "predicateForPodcastUuids:", v7));

  -[MTSubscriptionSyncProcessor markShowsAsSyncedForPredicate:](self, "markShowsAsSyncedForPredicate:", v8);
}

- (void)markAllShowsAsSynced
{
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;

  v3 = _MTLogCategoryCloudSync(self);
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v8 = 138543362;
    v9 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "%{public}@ Marking all shows as synced", (uint8_t *)&v8, 0xCu);

  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTPodcast predicateForSyncablePodcastsForSyncType:](MTPodcast, "predicateForSyncablePodcastsForSyncType:", objc_msgSend(v6, "syncType")));

  -[MTSubscriptionSyncProcessor markShowsAsSyncedForPredicate:](self, "markShowsAsSyncedForPredicate:", v7);
}

- (void)markShowsAsSyncedForPredicate:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10012B04C;
  v7[3] = &unk_1004A6640;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  v9 = v4;
  v5 = v4;
  v6 = v8;
  objc_msgSend(v6, "performBlockAndWaitWithSave:", v7);

}

- (id)_podcastSubscriptions
{
  NSMutableArray *v3;
  id v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  _QWORD v11[4];
  id v12;
  MTSubscriptionSyncProcessor *v13;
  NSMutableArray *v14;
  uint8_t buf[4];
  void *v16;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012B2A4;
  v11[3] = &unk_1004A7398;
  v12 = (id)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  v13 = self;
  v3 = objc_opt_new(NSMutableArray);
  v14 = v3;
  v4 = v12;
  objc_msgSend(v4, "performBlockAndWait:", v11);
  if (!-[NSMutableArray count](v3, "count"))
  {
    v5 = _MTLogCategoryCloudSync(0);
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      *(_DWORD *)buf = 138543362;
      v16 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "%{public}@ WARNING: Syncing up an empty podcast library", buf, 0xCu);

    }
  }
  v8 = v14;
  v9 = v3;

  return v9;
}

- (void)subscribeFromCloudToPodcasts:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  MTSubscriptionSyncProcessor *v13;
  id v14;
  uint64_t v15;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor context](self, "context"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v6, "subscriptionsLastSyncTimestamp");
  v8 = v7;

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10012B7F0;
  v11[3] = &unk_1004A8EA0;
  v12 = v4;
  v13 = self;
  v14 = v5;
  v15 = v8;
  v9 = v5;
  v10 = v4;
  objc_msgSend(v9, "performBlockAndWaitWithSave:", v11);

}

- (void)updateSettingsForLocalPodcast:(id)a3 remotePodcast:(id)a4 ctx:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  unsigned int v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  NSObject *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  NSObject *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  unint64_t v49;
  uint64_t v50;
  NSObject *v51;
  void *v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  id v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  void *v65;
  unsigned __int8 v66;
  uint64_t v67;
  uint64_t v68;
  NSObject *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  id v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  double v80;
  double v81;
  id v82;
  double v83;
  uint64_t v84;
  NSObject *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  id v91;
  void *v92;
  id v93;
  id v94;
  void *v95;
  unsigned int v96;
  void *v97;
  id v98;
  void *v100;
  void *v101;
  uint8_t buf[4];
  void *v103;
  __int16 v104;
  id v105;
  __int16 v106;
  void *v107;
  __int16 v108;
  id v109;
  __int16 v110;
  id v111;
  __int16 v112;
  id v113;
  __int16 v114;
  void *v115;

  v7 = a3;
  v8 = a4;
  v98 = a5;
  v9 = _MTLogCategoryCloudSync(v98);
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedURL"));
    v14 = objc_msgSend(v7, "storeCollectionId");
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "description"));
    *(_DWORD *)buf = 138544643;
    v103 = v11;
    v104 = 2113;
    v105 = v12;
    v106 = 2113;
    v107 = v13;
    v108 = 2049;
    v109 = v14;
    v110 = 2114;
    v111 = v15;
    v112 = 2113;
    v113 = v16;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ Updating settings for podcast: \"%{private}@\", %{private}@, %{private}lld, %{public}@. Remote dictionary: %{private}@", buf, 0x3Eu);

  }
  objc_msgSend(v7, "setHasBeenSynced:", 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kPodcastSubscribed));
  v18 = objc_msgSend(v17, "BOOLValue");

  v19 = objc_msgSend(v7, "subscribed");
  if ((v19 & 1) != 0 || !v18)
  {
    if (((v19 ^ 1 | v18) & 1) != 0)
      goto LABEL_12;
    v29 = _MTLogCategoryCloudSync(v19);
    v27 = objc_claimAutoreleasedReturnValue(v29);
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedURL"));
      v33 = objc_msgSend(v7, "storeCollectionId");
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
      *(_DWORD *)buf = 138544387;
      v103 = v30;
      v104 = 2113;
      v105 = v31;
      v106 = 2113;
      v107 = v32;
      v108 = 2049;
      v109 = v33;
      v110 = 2114;
      v111 = v34;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%{public}@ Skipping unsubscription of remotely unsubscribed podcast [reason: all unsubscriptions should be handled in batch later in the process]: \"%{private}@\", %{private}@, %{private}lld, %{public}@", buf, 0x34u);

    }
  }
  else
  {
    v20 = _MTLogCategoryCloudSync(v19);
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedURL"));
      v25 = objc_msgSend(v7, "storeCollectionId");
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
      *(_DWORD *)buf = 138544387;
      v103 = v22;
      v104 = 2113;
      v105 = v23;
      v106 = 2113;
      v107 = v24;
      v108 = 2049;
      v109 = v25;
      v110 = 2114;
      v111 = v26;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "%{public}@ Enabling subscription for podcast: \"%{private}@\", %{private}@, %{private}lld, %{public}@", buf, 0x34u);

    }
    v27 = objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
    -[NSObject enableSubscriptionOnPodcastUuid:ctx:](v27, "enableSubscriptionOnPodcastUuid:ctx:", v28, v98);

  }
LABEL_12:
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kPodcastShowTypeSetting));
  v36 = v35;
  if (v35)
  {
    v37 = v35;
    v38 = objc_msgSend(v35, "longLongValue");
    v39 = _MTLogCategoryCloudSync(v38);
    v40 = objc_claimAutoreleasedReturnValue(v39);
    if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
    {
      v41 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
      v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedURL"));
      v44 = objc_msgSend(v7, "storeCollectionId");
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
      *(_DWORD *)buf = 138544643;
      v103 = v41;
      v104 = 2050;
      v105 = v38;
      v106 = 2113;
      v107 = v42;
      v108 = 2113;
      v109 = v43;
      v110 = 2049;
      v111 = v44;
      v112 = 2114;
      v113 = v45;
      _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "%{public}@ Subscriptions Sync wants to set show type setting to %{public}lld, for podcast: \"%{private}@\", %{private}@, %{private}lld, %{public}@", buf, 0x3Eu);

    }
    objc_msgSend(v7, "setShowTypeSetting:", v38);
    v36 = v37;
  }
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kPodcastLastTouchDate));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKey:", kPodcastDarkCount));
  if (v46)
  {
    if (v101)
    {
      objc_msgSend(v7, "lastTouchDate");
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:"));
      v48 = objc_msgSend(v47, "compare:", v101);

      if (v48 == (id)-1)
      {
        v49 = (unint64_t)objc_msgSend(v7, "isDark");
        v50 = _MTLogCategoryCloudSync(v49);
        v51 = objc_claimAutoreleasedReturnValue(v50);
        if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
        {
          v52 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
          v93 = objc_msgSend(v46, "longLongValue");
          v96 = v49;
          v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
          v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedURL"));
          v55 = objc_msgSend(v7, "storeCollectionId");
          v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
          *(_DWORD *)buf = 138544643;
          v103 = v52;
          v104 = 2050;
          v105 = v93;
          v106 = 2113;
          v107 = v53;
          v108 = 2113;
          v109 = v54;
          v110 = 2049;
          v111 = v55;
          v112 = 2114;
          v113 = v56;
          _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting darkCount = %{public}lld for podcast: \"%{private}@\", %{private}@, %{private}lld, %{public}@", buf, 0x3Eu);

          v49 = v96;
        }

        objc_msgSend(v7, "setDarkCount:", objc_msgSend(v46, "longLongValue"));
        if ((_DWORD)v49 != objc_msgSend(v7, "isDark"))
        {
          v57 = (id)v49;
          v58 = objc_msgSend(v7, "isDark");
          v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "latestExitFromDarkDownloads"));
          if (v59)
          {
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:](PFAnalyticsEvent, "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:", v57, v58, 6, v59));
          }
          else
          {
            v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate now](NSDate, "now"));
            v60 = (void *)objc_claimAutoreleasedReturnValue(+[PFAnalyticsEvent darkDownloadsChangeWithWasDark:isDark:reason:previousExit:](PFAnalyticsEvent, "darkDownloadsChangeWithWasDark:isDark:reason:previousExit:", v57, v58, 6, v61));

          }
          v62 = (void *)objc_opt_new(PFCoreAnalyticsChannel);
          objc_msgSend(v62, "sendEvent:", v60);

        }
      }
    }
  }
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedURL"));
  v64 = kPodcastFeedUrl;
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kPodcastFeedUrl));
  v66 = objc_msgSend(v63, "isEqualToString:", v65);

  if ((v66 & 1) == 0)
  {
    v68 = _MTLogCategoryCloudSync(v67);
    v69 = objc_claimAutoreleasedReturnValue(v68);
    if (os_log_type_enabled(v69, OS_LOG_TYPE_DEFAULT))
    {
      v70 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v64));
      v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
      v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedURL"));
      v94 = v8;
      v74 = v46;
      v75 = objc_msgSend(v7, "storeCollectionId");
      v97 = v36;
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
      *(_DWORD *)buf = 138544643;
      v103 = v70;
      v104 = 2113;
      v105 = v71;
      v106 = 2113;
      v107 = v72;
      v108 = 2113;
      v109 = v73;
      v110 = 2049;
      v111 = v75;
      v46 = v74;
      v8 = v94;
      v112 = 2114;
      v113 = v76;
      _os_log_impl((void *)&_mh_execute_header, v69, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting feedURL = %{private}@ for podcast: \"%{private}@\", %{private}@, %{private}lld, %{public}@", buf, 0x3Eu);

      v36 = v97;
    }

    v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", v64));
    objc_msgSend(v7, "setFeedURL:", v77);

  }
  v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectForKeyedSubscript:", kPodcastAddedDate));
  v79 = v78;
  if (v78)
  {
    objc_msgSend(v78, "timeIntervalSinceReferenceDate");
    v81 = v80;
    v82 = objc_msgSend(v7, "addedDate");
    if (v81 < v83)
    {
      v84 = _MTLogCategoryCloudSync(v82);
      v85 = objc_claimAutoreleasedReturnValue(v84);
      if (os_log_type_enabled(v85, OS_LOG_TYPE_DEFAULT))
      {
        v86 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor logPrefix](self, "logPrefix"));
        objc_msgSend(v79, "timeIntervalSinceReferenceDate");
        v88 = v87;
        v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "description"));
        v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "title"));
        v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "feedURL"));
        v91 = objc_msgSend(v7, "storeCollectionId");
        v95 = v46;
        v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "uuid"));
        *(_DWORD *)buf = 138544899;
        v103 = v86;
        v104 = 2050;
        v105 = v88;
        v106 = 2114;
        v107 = v100;
        v108 = 2113;
        v109 = v89;
        v110 = 2113;
        v111 = v90;
        v112 = 2049;
        v113 = v91;
        v114 = 2114;
        v115 = v92;
        _os_log_impl((void *)&_mh_execute_header, v85, OS_LOG_TYPE_DEFAULT, "%{public}@ Setting addedDate = %{public}f(%{public}@) for podcast: \"%{private}@\", %{private}@, %{private}lld, %{public}@", buf, 0x48u);

        v46 = v95;
      }

      objc_msgSend(v79, "timeIntervalSinceReferenceDate");
      objc_msgSend(v7, "setAddedDate:");
    }
  }

}

- (id)logPrefix
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTSubscriptionSyncProcessor storageProvider](self, "storageProvider"));
  v3 = objc_msgSend(v2, "syncType");

  if (v3 == (id)1)
    return CFSTR("[Subscription V3 Sync]");
  else
    return CFSTR("[Subscription Sync]");
}

- (NSMutableSet)addedSubscriptions
{
  return self->_addedSubscriptions;
}

- (void)setAddedSubscriptions:(id)a3
{
  objc_storeStrong((id *)&self->_addedSubscriptions, a3);
}

- (MTSubscriptionSyncProcessorConfig)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
  objc_storeStrong((id *)&self->_config, a3);
}

- (MTSubscriptionSyncStorageProviding)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_storageProvider, a3);
}

- (_TtP8Podcasts21CloudSyncBugReporting_)cloudSyncBugReporter
{
  return self->_cloudSyncBugReporter;
}

- (void)setCloudSyncBugReporter:(id)a3
{
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, a3);
}

- (unint64_t)initialSubscribedPodcastsCount
{
  return self->_initialSubscribedPodcastsCount;
}

- (void)setInitialSubscribedPodcastsCount:(unint64_t)a3
{
  self->_initialSubscribedPodcastsCount = a3;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (void)setWorkQueue:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, 0);
  objc_storeStrong((id *)&self->_storageProvider, 0);
  objc_storeStrong((id *)&self->_config, 0);
  objc_storeStrong((id *)&self->_addedSubscriptions, 0);
}

@end
