@implementation MTEpisodeSyncProcessor

- (MTEpisodeSyncProcessor)initWithStorageProvider:(id)a3
{
  id v4;
  MTEpisodeSyncProcessor *v5;
  MTEpisodeSyncProcessor *v6;
  uint64_t v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t signpostID;
  uint8_t v15[16];
  objc_super v16;

  v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)MTEpisodeSyncProcessor;
  v5 = -[MTEpisodeSyncProcessor init](&v16, "init");
  v6 = v5;
  if (v5)
  {
    v7 = _MTLogCategoryCloudSync(-[MTEpisodeSyncProcessor setStorageProvider:](v5, "setStorageProvider:", v4));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v6->_signpostID = os_signpost_id_generate(v8);

    v10 = _MTLogCategoryCloudSync(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    signpostID = v6->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, signpostID, "MTEpisodeSyncProcessor.created", ", v15, 2u);
    }

  }
  return v6;
}

- (int64_t)operationTypeForSET
{
  return 7;
}

- (BOOL)hasLocalChanges
{
  return 0;
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
  uint64_t v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  void *v20;

  v5 = a4;
  v6 = _MTLogCategoryCloudSync(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v17 = 138412290;
    v18 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTEpisodeSyncProcessor.GET", "key: %@", (uint8_t *)&v17, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "versionForKey:", v5));

  v14 = _MTLogCategoryUPPSync(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v17 = 138543618;
    v18 = v5;
    v19 = 2114;
    v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Episode Sync] key: %{public}@, version: %{public}@", (uint8_t *)&v17, 0x16u);
  }

  return v11;
}

- (id)dataForSetTransaction:(id)a3 key:(id)a4 version:(id *)a5
{
  id v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  NSObject *v12;
  os_signpost_id_t signpostID;
  void *v14;
  void *v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  MZKeyValueStoreNode *v24;
  void *v25;
  void **v27;
  uint64_t v28;
  void (*v29)(uint64_t);
  void *v30;
  MTEpisodeSyncProcessor *v31;
  id v32;
  id v33;
  __int128 *p_buf;
  uint8_t v35[4];
  uint64_t v36;
  __int128 buf;
  uint64_t v38;
  uint64_t (*v39)(uint64_t, uint64_t);
  void (*v40)(uint64_t);
  id v41;

  v8 = a3;
  v9 = a4;
  v10 = _MTLogCategoryCloudSync(v9);
  v11 = objc_claimAutoreleasedReturnValue(v10);
  v12 = v11;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    LODWORD(buf) = 138412290;
    *(_QWORD *)((char *)&buf + 4) = v9;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTEpisodeSyncProcessor.SET", "key: %@", (uint8_t *)&buf, 0xCu);
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "importContext"));

  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v38 = 0x3032000000;
  v39 = sub_100046904;
  v40 = sub_100046AEC;
  v41 = (id)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v27 = _NSConcreteStackBlock;
  v28 = 3221225472;
  v29 = sub_10012F3D4;
  v30 = &unk_1004A6D10;
  v31 = self;
  v16 = v9;
  v32 = v16;
  v17 = v15;
  v33 = v17;
  p_buf = &buf;
  v18 = objc_msgSend(v17, "performBlockAndWait:", &v27);
  v20 = _MTLogCategoryUPPSync(v18, v19);
  v21 = objc_claimAutoreleasedReturnValue(v20);
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
    *(_DWORD *)v35 = 138543362;
    v36 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Syncing Episodes: %{public}@", v35, 0xCu);
  }

  if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count", v27, v28, v29, v30, v31))
  {
    v23 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
    *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "versionForKey:", v16));

    v24 = objc_alloc_init(MZKeyValueStoreNode);
    -[MZKeyValueStoreNode setArrayValue:](v24, "setArrayValue:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
    v25 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](v24, "value"));

  }
  else
  {
    v25 = 0;
  }

  _Block_object_dispose(&buf, 8);
  return v25;
}

- (id)predicateForFilteringEpisodesWithEmptyPlayState
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForPlayStateManuallySet:](MTEpisode, "predicateForPlayStateManuallySet:", 1));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForBacklog:](MTEpisode, "predicateForBacklog:", 0));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "AND:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForNilLastDatePlayed](MTEpisode, "predicateForNilLastDatePlayed"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "AND:", v5));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForNilLastUserMarkedAsPlayedDate](MTEpisode, "predicateForNilLastUserMarkedAsPlayedDate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "AND:", v7));

  v9 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForNonNilLastDatePlayed](MTEpisode, "predicateForNonNilLastDatePlayed"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[MTEpisode predicateForNonNilLastUserMarkedAsPlayedDate](MTEpisode, "predicateForNonNilLastUserMarkedAsPlayedDate"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "OR:", v10));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "OR:", v8));

  return v12;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v6, "setPodcastsDomainVersion:", v5);

}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;

  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a4;
  v16 = _MTLogCategoryUPPSync(v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543618;
    v19 = v12;
    v20 = 2114;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Successful GET transaction [%{public}@] key: %{public}@", (uint8_t *)&v18, 0x16u);
  }

  -[MTEpisodeSyncProcessor mergeData:forKey:](self, "mergeData:forKey:", v14, v11);
  -[MTEpisodeSyncProcessor completeTransactionWithNewVersion:key:finishedBlock:](self, "completeTransactionWithNewVersion:key:finishedBlock:", v12, v11, v13);

}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;

  v10 = a5;
  v11 = a6;
  v12 = a7;
  v14 = _MTLogCategoryUPPSync(v12, v13);
  v15 = objc_claimAutoreleasedReturnValue(v14);
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    v16 = 138543618;
    v17 = v11;
    v18 = 2114;
    v19 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Successful SET transaction [%{public}@] key: %{public}@ mismatch:NO", (uint8_t *)&v16, 0x16u);
  }

  -[MTEpisodeSyncProcessor completeTransactionWithNewVersion:key:finishedBlock:](self, "completeTransactionWithNewVersion:key:finishedBlock:", v11, v10, v12);
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  int v18;
  id v19;
  __int16 v20;
  id v21;

  v11 = a5;
  v12 = a6;
  v13 = a7;
  v14 = a4;
  v16 = _MTLogCategoryUPPSync(v14, v15);
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    v18 = 138543618;
    v19 = v12;
    v20 = 2114;
    v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Conflict for SET transaction [%{public}@] key: %{public}@", (uint8_t *)&v18, 0x16u);
  }

  -[MTEpisodeSyncProcessor mergeData:forKey:](self, "mergeData:forKey:", v14, v11);
  -[MTEpisodeSyncProcessor rescheduleTransactionWithNewVersion:key:finishedBlock:](self, "rescheduleTransactionWithNewVersion:key:finishedBlock:", v12, v11, v13);

}

- (void)completeTransactionWithNewVersion:(id)a3 key:(id)a4 finishedBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t signpostID;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  NSObject *v23;
  void *v24;
  void *v25;
  int v26;
  id v27;
  __int16 v28;
  id v29;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = _MTLogCategoryCloudSync(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v26) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, signpostID, "MTSubscriptionSyncProcessor.completed", ", (uint8_t *)&v26, 2u);
  }

  v17 = _MTLogCategoryUPPSync(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138543618;
    v27 = v8;
    v28 = 2114;
    v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Completing transaction [%{public}@] key: %{public}@", (uint8_t *)&v26, 0x16u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v19, "setVersion:forKey:", v8, v9);

  v10[2](v10, 0);
  v22 = _MTLogCategoryUPPSync(v20, v21);
  v23 = objc_claimAutoreleasedReturnValue(v22);
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    v26 = 138543618;
    v27 = v8;
    v28 = 2114;
    v29 = v9;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Completing transaction [%{public}@] key: %{public}@, now reculating Up Next", (uint8_t *)&v26, 0x16u);
  }

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "feedUrlFromModernKey:", v9));

  -[MTEpisodeSyncProcessor recalculateUpNextForShowWithFeedUrl:](self, "recalculateUpNextForShowWithFeedUrl:", v25);
}

- (void)rescheduleTransactionWithNewVersion:(id)a3 key:(id)a4 finishedBlock:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, uint64_t);
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t signpostID;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;
  void *v19;
  int v20;
  id v21;
  __int16 v22;
  id v23;

  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, uint64_t))a5;
  v11 = _MTLogCategoryCloudSync(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(v20) = 0;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, signpostID, "MTSubscriptionSyncProcessor.mismatch", ", (uint8_t *)&v20, 2u);
  }

  v17 = _MTLogCategoryUPPSync(v15, v16);
  v18 = objc_claimAutoreleasedReturnValue(v17);
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    v20 = 138543618;
    v21 = v8;
    v22 = 2114;
    v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Rescheduling SET transaction after solving conflict [%{public}@] key: %{public}@", (uint8_t *)&v20, 0x16u);
  }

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v19, "setVersion:forKey:", v8, v9);

  v10[2](v10, 1);
}

- (void)mergeData:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  MZKeyValueStoreNode *v8;
  _BOOL8 v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  id v23;
  id v24;
  _QWORD v25[5];
  id v26;
  id v27;
  id v28;
  id v29;
  uint8_t buf[4];
  id v31;

  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MZKeyValueStoreNode);
  -[MZKeyValueStoreNode setKey:](v8, "setKey:", v7);
  -[MZKeyValueStoreNode setValue:](v8, "setValue:", v6);
  v9 = -[MZKeyValueStoreNode hasData](v8, "hasData");
  if (v9)
  {
    v11 = _MTLogCategoryUPPSync(v9, v10);
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v7;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Merging data for key %{public}@", buf, 0xCu);
    }

    v13 = objc_autoreleasePoolPush();
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode arrayValue](v8, "arrayValue"));
    v16 = _MTLogCategoryUPPSync(v14, v15);
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v31 = v14;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Getting Episodes: %{public}@", buf, 0xCu);
    }

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor _searchDictionaryFromArray:withKey:](self, "_searchDictionaryFromArray:withKey:", v14, kEpisodeGuid));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor _searchDictionaryFromArray:withKey:](self, "_searchDictionaryFromArray:withKey:", v14, kEpisodeMetadataIdentifier));

    objc_autoreleasePoolPop(v13);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[MTEpisodeSyncProcessor storageProvider](self, "storageProvider"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "importContext"));

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100130350;
    v25[3] = &unk_1004A8AE8;
    v25[4] = self;
    v26 = v7;
    v27 = v21;
    v28 = v18;
    v29 = v19;
    v22 = v19;
    v23 = v18;
    v24 = v21;
    objc_msgSend(v24, "performBlockAndWait:", v25);

  }
}

- (void)unsafeUpdateEpisode:(id)a3 forRemoteEpisodeDictionary:(id)a4
{
  id v6;
  id v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;
  uint64_t v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  int v44;
  void *v45;
  __int16 v46;
  void *v47;
  __int16 v48;
  id v49;
  __int16 v50;
  void *v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  double v55;
  __int16 v56;
  void *v57;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "metadataTimestamp");
  v9 = v8;
  v10 = kEpisodePlayStateManuallySet;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", kEpisodePlayStateManuallySet));

  if (v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v10));
    v13 = objc_msgSend(v12, "BOOLValue");

    v14 = objc_msgSend(v6, "backCatalog");
    objc_msgSend(v6, "setPlayState:manually:source:", objc_msgSend(v6, "playState"), v13, 4);
    objc_msgSend(v6, "setBackCatalog:", v14);
  }
  v15 = kEpisodeIsNew;
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", kEpisodeIsNew));

  if (v16)
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v15));
    v18 = objc_msgSend(v17, "BOOLValue");

    if ((v18 & 1) == 0)
      objc_msgSend(v6, "setIsNew:", 0);
  }
  v19 = kEpisodeLastDatePlayed;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", kEpisodeLastDatePlayed));

  if (v20)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v19));
    -[MTEpisodeSyncProcessor _sanitisedTimeIntervalForObject:](self, "_sanitisedTimeIntervalForObject:", v21);
    v23 = v22;

    objc_msgSend(v6, "lastDatePlayed");
    if (v23 > v24)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(+[FutureDateChecker sharedInstance](_TtC18PodcastsFoundation17FutureDateChecker, "sharedInstance"));
      v26 = objc_msgSend(v25, "isFutureWithTimestamp:", v23);

      v29 = _MTLogCategoryUPPSync(v27, v28);
      v30 = objc_claimAutoreleasedReturnValue(v29);
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "title"));
        v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
        v33 = objc_msgSend(v6, "storeTrackId");
        v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "metadataIdentifier"));
        objc_msgSend(v6, "lastDatePlayed");
        v36 = v35;
        v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v26));
        v44 = 138544899;
        v45 = v31;
        v46 = 2114;
        v47 = v32;
        v48 = 2049;
        v49 = v33;
        v50 = 2114;
        v51 = v34;
        v52 = 2050;
        v53 = v36;
        v54 = 2050;
        v55 = v23;
        v56 = 2114;
        v57 = v37;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "[Episode Sync] Changing last date played for %{public}@, %{public}@, %{private}lld, %{public}@, from %{public}lf to %{public}lf. Is future: %{public}@", (uint8_t *)&v44, 0x48u);

      }
      objc_msgSend(v6, "setLastDatePlayed:", v23);
    }
  }
  v38 = kEpisodeLastUserMarkedAsPlayedDate;
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", kEpisodeLastUserMarkedAsPlayedDate));

  if (v39)
  {
    v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v38));
    objc_msgSend(v40, "doubleValue");
    v42 = v41;

    objc_msgSend(v6, "lastUserMarkedAsPlayedDate");
    if (v42 > v43)
      objc_msgSend(v6, "setLastUserMarkedAsPlayedDate:", v42);
  }
  objc_msgSend(v6, "setMetadataTimestamp:", v9);

}

- (void)recalculateUpNextForShowWithFeedUrl:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[MTDB sharedInstance](MTDB, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "privateQueueContext"));

  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100130B0C;
  v8[3] = &unk_1004A6640;
  v9 = v5;
  v10 = v3;
  v6 = v3;
  v7 = v5;
  objc_msgSend(v7, "performBlock:", v8);

}

- (double)_sanitisedTimeIntervalForObject:(id)a3
{
  id v3;
  uint64_t v4;
  double v5;
  uint64_t v6;
  double v7;

  v3 = a3;
  v4 = objc_opt_class(NSNumber);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
  {
    objc_msgSend(v3, "doubleValue");
LABEL_5:
    v7 = v5;
    goto LABEL_6;
  }
  v6 = objc_opt_class(NSDate);
  v7 = 0.0;
  if ((objc_opt_isKindOfClass(v3, v6) & 1) != 0)
  {
    objc_msgSend(v3, "timeIntervalSinceReferenceDate");
    goto LABEL_5;
  }
LABEL_6:

  return v7;
}

- (id)_searchDictionaryFromArray:(id)a3 withKey:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *i;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionaryWithCapacity:](NSMutableDictionary, "dictionaryWithCapacity:", objc_msgSend(v5, "count")));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKey:", v6, (_QWORD)v16));
        if (v14)
          objc_msgSend(v7, "setObject:forKey:", v13, v14);

      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }

  return v7;
}

- (id)_propertiesToFetch
{
  _QWORD v3[12];

  v3[0] = kEpisodeGuid;
  v3[1] = kEpisodeMetadataIdentifier;
  v3[2] = kEpisodeMetadataTimestamp;
  v3[3] = kEpisodeBackCatalog;
  v3[4] = kEpisodePlayState;
  v3[5] = kEpisodeDownloadBehavior;
  v3[6] = kEpisodeIsNew;
  v3[7] = kEpisodePlayhead;
  v3[8] = kEpisodePlayStateManuallySet;
  v3[9] = kEpisodeLastUserMarkedAsPlayedDate;
  v3[10] = kEpisodePodcast;
  v3[11] = kEpisodeLastDatePlayed;
  return (id)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v3, 12));
}

- (MTEpisodeSyncProcessorStorageProviding)storageProvider
{
  return self->_storageProvider;
}

- (void)setStorageProvider:(id)a3
{
  objc_storeStrong((id *)&self->_storageProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_storageProvider, 0);
}

@end
