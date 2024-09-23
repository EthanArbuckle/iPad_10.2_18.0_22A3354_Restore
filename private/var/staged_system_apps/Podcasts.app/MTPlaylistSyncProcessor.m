@implementation MTPlaylistSyncProcessor

- (MTPlaylistSyncProcessor)initWithStorageProvider:(id)a3
{
  id v4;
  MTPlaylistSyncProcessor *v5;
  MTPlaylistSyncProcessor *v6;
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
  v16.super_class = (Class)MTPlaylistSyncProcessor;
  v5 = -[MTPlaylistSyncProcessor init](&v16, "init");
  v6 = v5;
  if (v5)
  {
    v7 = _MTLogCategoryCloudSync(-[MTPlaylistSyncProcessor setStorageProvider:](v5, "setStorageProvider:", v4));
    v8 = objc_claimAutoreleasedReturnValue(v7);
    v6->_signpostID = os_signpost_id_generate(v8);

    v10 = _MTLogCategoryCloudSync(v9);
    v11 = objc_claimAutoreleasedReturnValue(v10);
    v12 = v11;
    signpostID = v6->_signpostID;
    if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)v15 = 0;
      _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v12, OS_SIGNPOST_EVENT, signpostID, "MTPlaylistSyncProcessor.created", ", v15, 2u);
    }

  }
  return v6;
}

- (int64_t)operationTypeForSET
{
  return 3;
}

- (BOOL)hasLocalChanges
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  v3 = objc_msgSend(v2, "playlistSyncDirtyFlag");

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
  int v13;
  id v14;

  v5 = a4;
  v6 = _MTLogCategoryCloudSync(v5);
  v7 = objc_claimAutoreleasedReturnValue(v6);
  v8 = v7;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    v13 = 138412290;
    v14 = v5;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v8, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTPlaylistSyncProcessor.GET", "key: %@", (uint8_t *)&v13, 0xCu);
  }

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "playlistSyncVersion"));

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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  NSMutableArray *v19;
  id v20;
  NSMutableArray *v21;
  MZKeyValueStoreNode *v22;
  _QWORD v24[4];
  id v25;
  MTPlaylistSyncProcessor *v26;
  NSMutableArray *v27;
  uint8_t buf[4];
  id v29;

  v7 = a4;
  v8 = _MTLogCategoryCloudSync(v7);
  v9 = objc_claimAutoreleasedReturnValue(v8);
  v10 = v9;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_DWORD *)buf = 138412290;
    v29 = v7;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v10, OS_SIGNPOST_INTERVAL_BEGIN, signpostID, "MTPlaylistSyncProcessor.SET", "key: %@", buf, 0xCu);
  }

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  if (objc_msgSend(v12, "playlistSyncDirtyFlag"))
  {

  }
  else
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "playlistSyncVersion"));

    if (v14)
    {
      v15 = 0;
      goto LABEL_12;
    }
  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  *a5 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "playlistSyncVersion"));

  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "importContext"));

  v19 = objc_opt_new(NSMutableArray);
  v24[0] = _NSConcreteStackBlock;
  v24[1] = 3221225472;
  v24[2] = sub_100131ECC;
  v24[3] = &unk_1004A7398;
  v20 = v18;
  v25 = v20;
  v26 = self;
  v21 = v19;
  v27 = v21;
  objc_msgSend(v20, "performBlockAndWait:", v24);
  if (v21)
  {
    v22 = objc_alloc_init(MZKeyValueStoreNode);
    -[MZKeyValueStoreNode setArrayValue:](v22, "setArrayValue:", v21);
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode value](v22, "value"));

  }
  else
  {
    v15 = 0;
  }

LABEL_12:
  return v15;
}

- (void)transaction:(id)a3 didProcessResponseWithDomainVersion:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v6, "setPodcastsDomainVersion:", v5);

}

- (void)successfulGetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11;
  id v12;

  v11 = a7;
  v12 = a6;
  -[MTPlaylistSyncProcessor completeTransactionWithNewVersion:isGetTransaction:mismatch:finishedBlock:](self, "completeTransactionWithNewVersion:isGetTransaction:mismatch:finishedBlock:", v12, 1, -[MTPlaylistSyncProcessor mergeData:forKey:version:mismatch:isGetTransaction:](self, "mergeData:forKey:version:mismatch:isGetTransaction:", a4, a5, v12, 0, 1), v11);

}

- (void)successfulSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  -[MTPlaylistSyncProcessor completeTransactionWithNewVersion:isGetTransaction:mismatch:finishedBlock:](self, "completeTransactionWithNewVersion:isGetTransaction:mismatch:finishedBlock:", a6, 0, 0, a7);
}

- (void)conflictForSetTransaction:(id)a3 withData:(id)a4 forKey:(id)a5 version:(id)a6 finishedBlock:(id)a7
{
  id v11;
  id v12;

  v11 = a7;
  v12 = a6;
  -[MTPlaylistSyncProcessor completeTransactionWithNewVersion:isGetTransaction:mismatch:finishedBlock:](self, "completeTransactionWithNewVersion:isGetTransaction:mismatch:finishedBlock:", v12, 0, -[MTPlaylistSyncProcessor mergeData:forKey:version:mismatch:isGetTransaction:](self, "mergeData:forKey:version:mismatch:isGetTransaction:", a4, a5, v12, 1, 0), v11);

}

- (BOOL)mergeData:(id)a3 forKey:(id)a4 version:(id)a5 mismatch:(BOOL)a6 isGetTransaction:(BOOL)a7
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  MZKeyValueStoreNode *v15;
  void *v16;
  void *v17;
  void *v18;
  MTPlaylistSyncDictionaryMerge *v19;
  uint64_t v20;
  void *v21;
  MTPlaylistSyncDictionaryMerge *v22;
  _QWORD v24[5];

  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "playlistSyncVersion"));

  if (!v13)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
    objc_msgSend(v14, "setPlaylistSyncDirtyFlag:", 1);

  }
  v15 = objc_alloc_init(MZKeyValueStoreNode);
  -[MZKeyValueStoreNode setKey:](v15, "setKey:", v10);

  -[MZKeyValueStoreNode setValue:](v15, "setValue:", v11);
  if (-[MZKeyValueStoreNode hasData](v15, "hasData"))
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[MZKeyValueStoreNode arrayValue](v15, "arrayValue"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "importContext"));

    v19 = [MTPlaylistSyncDictionaryMerge alloc];
    v20 = _MTLogCategoryCloudSync(v19);
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    v22 = -[MTPlaylistSyncDictionaryMerge initWithLoggingCategory:dictionariesToMerge:](v19, "initWithLoggingCategory:dictionariesToMerge:", v21, v16);

    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_100132A30;
    v24[3] = &unk_1004AB4B8;
    v24[4] = self;
    -[MTPlaylistSyncDictionaryMerge setCanDeletePlaylistUUIDBlock:](v22, "setCanDeletePlaylistUUIDBlock:", v24);
    -[MTPlaylistSyncDictionaryMerge performAndWaitWithContext:save:](v22, "performAndWaitWithContext:save:", v18, 1);

  }
  return a6;
}

- (void)completeTransactionWithNewVersion:(id)a3 isGetTransaction:(BOOL)a4 mismatch:(BOOL)a5 finishedBlock:(id)a6
{
  _BOOL8 v6;
  void (**v9)(id, _BOOL8);
  id v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  os_signpost_id_t signpostID;
  const __CFString *v15;
  void *v16;
  void *v17;
  int v18;
  const __CFString *v19;

  v6 = a5;
  v9 = (void (**)(id, _BOOL8))a6;
  v10 = a3;
  v11 = _MTLogCategoryCloudSync(v10);
  v12 = objc_claimAutoreleasedReturnValue(v11);
  v13 = v12;
  signpostID = self->_signpostID;
  if (signpostID - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    v15 = CFSTR("NO");
    if (v6)
      v15 = CFSTR("YES");
    v18 = 138412290;
    v19 = v15;
    _os_signpost_emit_with_name_impl((void *)&_mh_execute_header, v13, OS_SIGNPOST_INTERVAL_END, signpostID, "MTPlaylistSyncProcessor.completed", "mismatch %@", (uint8_t *)&v18, 0xCu);
  }

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v16, "setPlaylistSyncDirtyFlag:", v6);

  v9[2](v9, v6);
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[MTPlaylistSyncProcessor storageProvider](self, "storageProvider"));
  objc_msgSend(v17, "setPlaylistSyncVersion:", v10);

}

- (NSMutableSet)addedPlaylists
{
  return self->_addedPlaylists;
}

- (void)setAddedPlaylists:(id)a3
{
  objc_storeStrong((id *)&self->_addedPlaylists, a3);
}

- (MTPlaylistSyncStorageProviding)storageProvider
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
  objc_storeStrong((id *)&self->_addedPlaylists, 0);
}

@end
