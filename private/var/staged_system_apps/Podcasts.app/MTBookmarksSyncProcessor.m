@implementation MTBookmarksSyncProcessor

- (MTBookmarksSyncProcessor)initWithStorageProvider:(id)a3 cloudSyncBugReporter:(id)a4
{
  id v6;
  id v7;
  MTBookmarksSyncProcessor *v8;
  MTBookmarksSyncProcessor *v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  NSObject *v14;
  NSObject *v15;
  os_signpost_id_t signpostID;
  uint8_t v18[16];
  objc_super v19;

  v6 = a3;
  v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)MTBookmarksSyncProcessor;
  v8 = -[MTBookmarksSyncProcessor init](&v19, "init");
  v9 = v8;
  if (v8)
  {
    -[MTBookmarksSyncProcessor setStorageProvider:](v8, "setStorageProvider:", v6);
    v10 = _MTLogCategoryCloudSync(-[MTBookmarksSyncProcessor setCloudSyncBugReporter:](v9, "setCloudSyncBugReporter:", v7));
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v9->_signpostID = os_signpost_id_generate(v11);

    v13 = _MTLogCategoryCloudSync(v12);
    v14 = objc_claimAutoreleasedReturnValue(v13);
    v15 = v14;
    signpostID = v9->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)v18 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v15, OS_SIGNPOST_EVENT, signpostID, "MTBookmarksSyncProcessor.created", ", v18, 2u);
    }

  }
  return v9;
}

- (int64_t)operationTypeForSET
{
  return 11;
}

- (BOOL)hasLocalChanges
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
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
  int v17;
  id v18;
  __int16 v19;
  id v20;
  __int16 v21;
  void *v22;

  v5 = a4;
  v6 = _MTLogCategoryCloudSync(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 138412290;
    v18 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTBookmarksSyncProcessor.GET", "key: %@", (uint8_t *)&v17, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "syncVersion"));

  v13 = _MTLogCategoryCloudSync(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    v17 = 138412802;
    v18 = v15;
    v19 = 2112;
    v20 = v5;
    v21 = 2112;
    v22 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ Version for GET transaction key: %@, vers: %@", (uint8_t *)&v17, 0x20u);

  }
  return v11;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t signpostID;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSMutableArray *v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  NSMutableArray *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  NSObject *v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id v40;
  id *v41;
  void *v42;
  void *v43;
  void *v44;
  uint64_t v45;
  void *v46;
  void *v47;
  MZKeyValueStoreNode *v48;
  NSObject *v50;
  _QWORD v51[4];
  NSObject *v52;
  id v53;
  NSMutableArray *v54;
  uint8_t buf[4];
  id v56;
  __int16 v57;
  id v58;
  __int16 v59;
  void *v60;
  __int16 v61;
  id v62;
  __int16 v63;
  void *v64;

  v7 = a4;
  v8 = _MTLogCategoryCloudSync(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412290;
    v56 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTBookmarksSyncProcessor.SET", "key: %@", buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  if (objc_msgSend(v12, "syncDirtyFlag"))
  {

LABEL_10:
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "importContext"));

    v26 = objc_opt_new(NSMutableArray);
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForAllBookmarkedEpisodes](MTEpisode, "predicateForAllBookmarkedEpisodes"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor predicateForBookmarksSyncType](self, "predicateForBookmarksSyncType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "AND:", v28));

    v51[0] = _NSConcreteStackBlock;
    v51[1] = 3221225472;
    v51[2] = sub_100090FD0;
    v51[3] = &unk_1004A7398;
    v17 = v25;
    v52 = v17;
    v30 = v29;
    v53 = v30;
    v31 = v26;
    v54 = v31;
    -[NSObject performBlockAndWait:](v17, "performBlockAndWait:", v51);
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "syncVersion"));

    v34 = _MTLogCategoryCloudSync(v33);
    v35 = objc_claimAutoreleasedReturnValue(v34);
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
      v37 = v7;
      v38 = *a5;
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", -[NSMutableArray count](v31, "count")));
      v50 = v17;
      v40 = v30;
      v41 = a5;
      v42 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray description](v31, "description"));
      *(_DWORD *)buf = 138413314;
      v56 = v36;
      v57 = 2112;
      v58 = v38;
      v7 = v37;
      v59 = 2112;
      v60 = v37;
      v61 = 2112;
      v62 = v39;
      v63 = 2112;
      v64 = v42;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@ Providing data for SET transaction [%@] key: %@ : count %@, data: %@", buf, 0x34u);

      a5 = v41;
      v30 = v40;
      v17 = v50;

    }
    v43 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "syncVersion"));
    v45 = (uint64_t)objc_msgSend(v44, "integerValue");

    if (!-[NSMutableArray count](v31, "count") && *a5 && v45 >= 11)
    {
      v46 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor cloudSyncBugReporter](self, "cloudSyncBugReporter"));
      v47 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
      objc_msgSend(v46, "reportBookmarksSyncIssue:bookmarksSyncType:version:userInfo:", 0, objc_msgSend(v47, "syncType"), *a5, 0);

    }
    v48 = objc_alloc_init(MZKeyValueStoreNode);
    -[MZKeyValueStoreNode setArrayValue:](v48, "setArrayValue:", v31);
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](v48, "value"));

    goto LABEL_17;
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "syncVersion"));

  if (!v14)
    goto LABEL_10;
  v16 = _MTLogCategoryCloudSync(v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", objc_msgSend(v19, "syncDirtyFlag")));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "syncVersion"));
    *(_DWORD *)buf = 138413058;
    v56 = v18;
    v57 = 2112;
    v58 = v20;
    v59 = 2112;
    v60 = v22;
    v61 = 2112;
    v62 = v7;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_INFO, "%@ No data for SET transaction. bookmarksSyncDirtyFlag: %@, bookmarksSyncVersion: %@, key: %@", buf, 0x2Au);

  }
  v23 = 0;
LABEL_17:

  return v23;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
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
  int v18;
  void *v19;
  __int16 v20;
  id v21;
  __int16 v22;
  id v23;

  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a4;
  v15 = _MTLogCategoryCloudSync(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    v18 = 138412802;
    v19 = v17;
    v20 = 2112;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ Updating local cache after GET transaction for key %@, new version: [%{public}@]", (uint8_t *)&v18, 0x20u);

  }
  -[MTBookmarksSyncProcessor updateLocalCacheIfNeededWithData:version:](self, "updateLocalCacheIfNeededWithData:version:", v14, v12);

  -[MTBookmarksSyncProcessor finishSuccessfulTransactionWithNewVersion:finishedBlock:](self, "finishSuccessfulTransactionWithNewVersion:finishedBlock:", v12, v13);
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

  v10 = a5;
  v11 = a7;
  v12 = a6;
  v13 = _MTLogCategoryCloudSync(v12);
  v14 = objc_claimAutoreleasedReturnValue(v13);
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    v16 = 138412546;
    v17 = v15;
    v18 = 2112;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%@ Successful SET transaction for key %@, marking everything as synced and finishing normally", (uint8_t *)&v16, 0x16u);

  }
  -[MTBookmarksSyncProcessor finishSuccessfulTransactionWithNewVersion:finishedBlock:](self, "finishSuccessfulTransactionWithNewVersion:finishedBlock:", v12, v11);

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
  int v18;
  void *v19;
  __int16 v20;
  id v21;

  v11 = a5;
  v12 = a7;
  v13 = a6;
  v14 = a4;
  v15 = _MTLogCategoryCloudSync(v14);
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    v18 = 138412546;
    v19 = v17;
    v20 = 2112;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%@ Failure on SET transaction for key %@. Bookkeeper copy has diverged from local copy, we must merge both", (uint8_t *)&v18, 0x16u);

  }
  -[MTBookmarksSyncProcessor updateLocalCacheIfNeededWithData:version:](self, "updateLocalCacheIfNeededWithData:version:", v14, v13);

  -[MTBookmarksSyncProcessor bumpBookmarksSyncVersionToVersion:](self, "bumpBookmarksSyncVersionToVersion:", v13);
  -[MTBookmarksSyncProcessor rescheduleTransactionWithFinishedBlock:](self, "rescheduleTransactionWithFinishedBlock:", v12);

}

- (void)updateLocalCacheIfNeededWithData:(id)a3 version:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  MZKeyValueStoreNode *v11;
  _BOOL8 v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  void *v16;
  id v17;
  uint64_t v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  unsigned __int8 v26;
  void *v27;
  void *v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  _QWORD v32[4];
  id v33;
  MTBookmarksSyncProcessor *v34;
  id v35;
  id v36;
  unsigned __int8 v37;
  uint8_t buf[4];
  id v39;
  __int16 v40;
  id v41;

  v6 = a4;
  v7 = a3;
  v8 = _MTLogCategoryCloudSync(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    *(_DWORD *)buf = 138543618;
    v39 = v10;
    v40 = 2114;
    v41 = v6;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%{public}@ Merging data for newVersion: [%{public}@];",
      buf,
      0x16u);

  }
  v11 = objc_alloc_init(MZKeyValueStoreNode);
  -[MZKeyValueStoreNode setValue:](v11, "setValue:", v7);

  v12 = -[MZKeyValueStoreNode hasData](v11, "hasData");
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode arrayValue](v11, "arrayValue"));
    v14 = _MTLogCategoryCloudSync(v13);
    v15 = objc_claimAutoreleasedReturnValue(v14);
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
      v17 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 138543618;
      v39 = v16;
      v40 = 2048;
      v41 = v17;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "%{public}@ Merging %lu remote dictionaries:", buf, 0x16u);

    }
    if (!objc_msgSend(v13, "count"))
    {
      v18 = _MTLogCategoryCloudSync(0);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
        *(_DWORD *)buf = 138543362;
        v39 = v20;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%{public}@ Nothing to merge: Store node has data, but there are no bookmark items.", buf, 0xCu);

      }
      v22 = _MTLogCategoryCloudSync(v21);
      v23 = objc_claimAutoreleasedReturnValue(v22);
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode debugDescription](v11, "debugDescription"));
        *(_DWORD *)buf = 138543619;
        v39 = v24;
        v40 = 2113;
        v41 = v25;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%{public}@ Node data: %{private}@", buf, 0x16u);

      }
    }
    v26 = +[PFNotificationSettings canSendNotification](PFNotificationSettings, "canSendNotification");
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "importContext"));

    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_100091950;
    v32[3] = &unk_1004A8B38;
    v33 = v13;
    v34 = self;
    v35 = v28;
    v37 = v26;
    v36 = v6;
    v29 = v28;
    v30 = v13;
    objc_msgSend(v29, "performBlockAndWaitWithSave:", v32);

    goto LABEL_15;
  }
  v31 = _MTLogCategoryCloudSync(v12);
  v30 = objc_claimAutoreleasedReturnValue(v31);
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
  {
    v29 = (id)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
    *(_DWORD *)buf = 138543618;
    v39 = v29;
    v40 = 2114;
    v41 = v6;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "%{public}@ Nothing to merge: No data in the cloud node version: [%{public}@]", buf, 0x16u);
LABEL_15:

  }
}

- (void)checkPotentialLibraryDeletionIssueForRemoteBookmarksCount:(unint64_t)a3 episodesToUnbookmarkCount:(unint64_t)a4 newVersion:(id)a5
{
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[2];
  _QWORD v21[2];
  uint8_t buf[4];
  void *v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  unint64_t v27;

  v8 = _MTLogCategoryCloudSync(self);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  if (a3 || a4 < 0xA)
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
      *(_DWORD *)buf = 138543874;
      v23 = v19;
      v24 = 2048;
      v25 = a4;
      v26 = 2048;
      v27 = a3;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "%{public}@ %lu local bookmarks removed, and %lu new bookmarks added", buf, 0x20u);

    }
  }
  else
  {
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor logPrefix](self, "logPrefix"));
      *(_DWORD *)buf = 138543874;
      v23 = v11;
      v24 = 2048;
      v25 = 0;
      v26 = 2048;
      v27 = a4;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, "%{public}@ Big library unbookmarking detected: remoteBookmarksCount: %lu, episodesToUnbookmarkCount: %lu", buf, 0x20u);

    }
    v10 = objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor cloudSyncBugReporter](self, "cloudSyncBugReporter"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    v13 = objc_msgSend(v12, "syncType");
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "syncVersion"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", 0, CFSTR("remoteBookmarksCount")));
    v20[1] = CFSTR("episodesToUnbookmarkCount");
    v21[0] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", a4));
    v21[1] = v17;
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
    -[NSObject reportBookmarksSyncIssue:bookmarksSyncType:version:userInfo:](v10, "reportBookmarksSyncIssue:bookmarksSyncType:version:userInfo:", 1, v13, v15, v18);

  }
}

- (id)findEpisodeByStoreID:(int64_t)a3 inContext:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor predicateForBookmarksSyncType](self, "predicateForBookmarksSyncType"));
  v8 = kMTEpisodeEntityName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeStoreTrackId:](MTEpisode, "predicateForEpisodeStoreTrackId:", a3));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "AND:", v7));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectInEntity:predicate:", v8, v10));

  return v11;
}

- (id)findEpisodeByFeedURL:(id)a3 guid:(id)a4 inContext:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor predicateForBookmarksSyncType](self, "predicateForBookmarksSyncType"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForEpisodeGuid:onFeedURL:](MTEpisode, "predicateForEpisodeGuid:onFeedURL:", v9, v10));

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "AND:", v11));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "objectInEntity:predicate:", kMTEpisodeEntityName, v13));

  return v14;
}

- (void)markEverythingAsSyncedWithVersion:(id)a3
{
  void *v4;
  id v5;

  -[MTBookmarksSyncProcessor bumpBookmarksSyncVersionToVersion:](self, "bumpBookmarksSyncVersionToVersion:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  +[NSDate timeIntervalSinceReferenceDate](NSDate, "timeIntervalSinceReferenceDate");
  objc_msgSend(v4, "setLastSyncTimestamp:");

  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v5, "setSyncDirtyFlag:", 0);

}

- (void)bumpBookmarksSyncVersionToVersion:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v5, "setSyncVersion:", v4);

}

- (id)predicateForBookmarksOnlyInLocalAndBeforeLastSyncWithRemoteBookmarksUUIDs:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v5, "lastSyncTimestamp");
  v7 = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate dateWithTimeIntervalSinceReferenceDate:](NSDate, "dateWithTimeIntervalSinceReferenceDate:", v7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor predicateForBookmarksSyncType](self, "predicateForBookmarksSyncType"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateForDateKey:isLessThanDate:](NSPredicate, "predicateForDateKey:isLessThanDate:", kEpisodeLastBookmarkedDate, v8));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "AND:", v9));

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForBookmarkedEpisodesExcludingUUIDs:](MTEpisode, "predicateForBookmarkedEpisodesExcludingUUIDs:", v4));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "AND:", v11));

  return v13;
}

- (id)predicateForBookmarksSyncType
{
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  _QWORD v16[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForRSSEpisodes](MTEpisode, "predicateForRSSEpisodes"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  v5 = objc_msgSend(v4, "syncType");

  if (v5 == (id)1)
  {
    v6 = kEpisodePriceType;
    v7 = NSPersistentStringForMTEpisodePriceType(2);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    v16[0] = v8;
    v9 = NSPersistentStringForMTEpisodePriceType(3);
    v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
    v16[1] = v10;
    v11 = NSPersistentStringForMTEpisodePriceType(4);
    v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
    v16[2] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v16, 3));
    v14 = (id)objc_claimAutoreleasedReturnValue(+[NSPredicate predicateWithFormat:](NSPredicate, "predicateWithFormat:", CFSTR("(%K IN %@)"), v6, v13));

  }
  else
  {
    v14 = v3;
  }

  return v14;
}

- (void)finishSuccessfulTransactionWithNewVersion:(id)a3 finishedBlock:(id)a4
{
  void (**v6)(id, _QWORD);
  id v7;
  uint64_t v8;
  NSObject *v9;
  NSObject *v10;
  os_signpost_id_t signpostID;
  uint8_t v12[16];

  v6 = (void (**)(id, _QWORD))a4;
  v7 = a3;
  v8 = _MTLogCategoryCloudSync(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)v12 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_END, signpostID, "MTSubscriptionSyncProcessor.completed", ", v12, 2u);
  }

  -[MTBookmarksSyncProcessor markEverythingAsSyncedWithVersion:](self, "markEverythingAsSyncedWithVersion:", v7);
  if (v6)
    v6[2](v6, 0);

}

- (void)rescheduleTransactionWithFinishedBlock:(id)a3
{
  void (**v4)(id, uint64_t);
  uint64_t v5;
  NSObject *v6;
  NSObject *v7;
  os_signpost_id_t signpostID;
  uint8_t v9[16];

  v4 = (void (**)(id, uint64_t))a3;
  v5 = _MTLogCategoryCloudSync(v4);
  v6 = objc_claimAutoreleasedReturnValue(v5);
  v7 = v6;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v6))
  {
    *(_WORD *)v9 = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v7, OS_SIGNPOST_INTERVAL_END, signpostID, "MTSubscriptionSyncProcessor.mismatch", ", v9, 2u);
  }

  if (v4)
    v4[2](v4, 1);

}

- (id)logPrefix
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTBookmarksSyncProcessor storageProvider](self, "storageProvider"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "logPrefix"));

  return v3;
}

- (MTBookmarksSyncStorageProviding)storageProvider
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

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cloudSyncBugReporter, 0);
  objc_storeStrong((id *)&self->_storageProvider, 0);
}

@end
