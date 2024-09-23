@implementation PPXPCNamedEntityStore

- (id)_init
{
  _QWORD *v2;
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  PPClientFeedbackHelper *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PPXPCNamedEntityStore;
  v2 = -[PPNamedEntityStore _initFromSubclass](&v10, sel__initFromSubclass);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x1E0D815F0]);
    v4 = (void *)objc_opt_new();
    v5 = objc_msgSend(v3, "initWithGuardedData:", v4);
    v6 = (void *)v2[2];
    v2[2] = v5;

    v7 = -[PPClientFeedbackHelper initWithParentObject:]([PPClientFeedbackHelper alloc], "initWithParentObject:", v2);
    v8 = (void *)v2[1];
    v2[1] = v7;

  }
  return v2;
}

- (BOOL)iterRankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v7 = a5;
  v8 = a3;
  pp_entities_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  pp_entities_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPXPCNamedEntityStore.iterRankedNamedEntitiesWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPNamedEntityReadOnlyClient sharedInstance](PPNamedEntityReadOnlyClient, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __70__PPXPCNamedEntityStore_iterRankedNamedEntitiesWithQuery_error_block___block_invoke;
  v19[3] = &unk_1E226C1F0;
  v20 = v7;
  v14 = v7;
  v15 = objc_msgSend(v13, "rankedNamedEntitiesWithQuery:error:handleBatch:", v8, a4, v19);

  pp_entities_signpost_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PPXPCNamedEntityStore.iterRankedNamedEntitiesWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  return v15;
}

- (id)rankedNamedEntitiesWithQuery:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint8_t buf[8];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  pp_entities_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  pp_entities_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPXPCNamedEntityStore.rankedNamedEntitiesWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPNamedEntityReadOnlyClient sharedInstance](PPNamedEntityReadOnlyClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __60__PPXPCNamedEntityStore_rankedNamedEntitiesWithQuery_error___block_invoke;
  v27[3] = &unk_1E226A2F0;
  v12 = v6;
  v28 = v12;
  v29 = &v31;
  v13 = objc_msgSend(v11, "rankedNamedEntitiesWithQuery:error:handleBatch:", v5, a4, v27);

  pp_entities_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPXPCNamedEntityStore.rankedNamedEntitiesWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  if (v13)
  {
    v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v17 = (void *)objc_msgSend(v16, "initWithCapacity:", v32[3]);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), (_QWORD)v23);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      }
      while (v19);
    }

  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v17;
}

- (BOOL)iterNamedEntityRecordsWithQuery:(id)a3 error:(id *)a4 block:(id)a5
{
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  void *v13;
  id v14;
  char v15;
  NSObject *v16;
  NSObject *v17;
  _QWORD v19[4];
  id v20;
  uint8_t buf[16];

  v7 = a5;
  v8 = a3;
  pp_entities_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);

  pp_entities_signpost_handle();
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PPXPCNamedEntityStore.iterNamedEntityRecordsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPNamedEntityReadOnlyClient sharedInstance](PPNamedEntityReadOnlyClient, "sharedInstance");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __69__PPXPCNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke;
  v19[3] = &unk_1E226C1F0;
  v20 = v7;
  v14 = v7;
  v15 = objc_msgSend(v13, "namedEntityRecordsWithQuery:error:handleBatch:", v8, a4, v19);

  pp_entities_signpost_handle();
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v17, OS_SIGNPOST_INTERVAL_END, v10, "PPXPCNamedEntityStore.iterNamedEntityRecordsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  return v15;
}

- (id)namedEntityRecordsWithQuery:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  id v12;
  int v13;
  NSObject *v14;
  NSObject *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t i;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[4];
  id v28;
  uint64_t *v29;
  uint8_t buf[8];
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)objc_opt_new();
  v31 = 0;
  v32 = &v31;
  v33 = 0x2020000000;
  v34 = 0;
  pp_entities_signpost_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);

  pp_entities_signpost_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PPXPCNamedEntityStore.namedEntityRecordsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPNamedEntityReadOnlyClient sharedInstance](PPNamedEntityReadOnlyClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = MEMORY[0x1E0C809B0];
  v27[1] = 3221225472;
  v27[2] = __59__PPXPCNamedEntityStore_namedEntityRecordsWithQuery_error___block_invoke;
  v27[3] = &unk_1E226A2F0;
  v12 = v6;
  v28 = v12;
  v29 = &v31;
  v13 = objc_msgSend(v11, "namedEntityRecordsWithQuery:error:handleBatch:", v5, a4, v27);

  pp_entities_signpost_handle();
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = v14;
  if (v8 - 1 < 0xFFFFFFFFFFFFFFFELL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v15, OS_SIGNPOST_INTERVAL_END, v8, "PPXPCNamedEntityStore.namedEntityRecordsWithQuery", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  if (v13)
  {
    v16 = objc_alloc(MEMORY[0x1E0C99DE8]);
    v17 = (void *)objc_msgSend(v16, "initWithCapacity:", v32[3]);
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    v18 = v12;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
    if (v19)
    {
      v20 = *(_QWORD *)v24;
      do
      {
        for (i = 0; i != v19; ++i)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v18);
          objc_msgSend(v17, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i), (_QWORD)v23);
        }
        v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v35, 16);
      }
      while (v19);
    }

  }
  else
  {
    v17 = 0;
  }

  _Block_object_dispose(&v31, 8);
  return v17;
}

- (BOOL)donateNamedEntities:(id)a3 source:(id)a4 algorithm:(unint64_t)a5 cloudSync:(BOOL)a6 sentimentScore:(double)a7 error:(id *)a8
{
  _BOOL8 v10;
  id v15;
  id v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  char v23;
  NSObject *v24;
  NSObject *v25;
  void *v27;
  void *v28;
  uint8_t v29[16];
  uint8_t buf[16];

  v10 = a6;
  v15 = a3;
  v16 = a4;
  v17 = v16;
  if (!v15)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPXPCNamedEntityStore.m"), 173, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("entities"));

    if (v17)
      goto LABEL_3;
LABEL_11:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPXPCNamedEntityStore.m"), 174, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("source"));

    goto LABEL_3;
  }
  if (!v16)
    goto LABEL_11;
LABEL_3:
  pp_entities_signpost_handle();
  v18 = objc_claimAutoreleasedReturnValue();
  v19 = os_signpost_id_generate(v18);

  pp_entities_signpost_handle();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "PPXPCNamedEntityStore.donateNamedEntities", (const char *)&unk_18BE9F21B, buf, 2u);
  }

  +[PPNamedEntityReadWriteClient sharedInstance](PPNamedEntityReadWriteClient, "sharedInstance");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = objc_msgSend(v22, "donateNamedEntities:source:algorithm:cloudSync:sentimentScore:error:", v15, v17, a5, v10, a8, a7);

  pp_entities_signpost_handle();
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = v24;
  if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
  {
    *(_WORD *)v29 = 0;
    _os_signpost_emit_with_name_impl(&dword_18BE3A000, v25, OS_SIGNPOST_INTERVAL_END, v19, "PPXPCNamedEntityStore.donateNamedEntities", (const char *)&unk_18BE9F21B, v29, 2u);
  }

  return v23;
}

- (BOOL)flushDonationsWithError:(id *)a3
{
  void *v4;

  +[PPNamedEntityReadWriteClient sharedInstance](PPNamedEntityReadWriteClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "flushDonationsWithError:", a3);

  return (char)a3;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 deletedCount:(unint64_t *)a4 error:(id *)a5
{
  id v7;
  void *v8;

  v7 = a3;
  +[PPNamedEntityReadWriteClient sharedInstance](PPNamedEntityReadWriteClient, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v8, "deleteAllNamedEntitiesFromSourcesWithBundleId:deletedCount:error:", v7, a4, a5);

  return (char)a5;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 documentIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a4;
  v10 = a3;
  +[PPNamedEntityReadWriteClient sharedInstance](PPNamedEntityReadWriteClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v11, "deleteAllNamedEntitiesFromSourcesWithBundleId:documentIds:deletedCount:error:", v10, v9, a5, a6);

  return (char)a6;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupIds:(id)a4 deletedCount:(unint64_t *)a5 error:(id *)a6
{
  id v9;
  id v10;
  void *v11;

  v9 = a4;
  v10 = a3;
  +[PPNamedEntityReadWriteClient sharedInstance](PPNamedEntityReadWriteClient, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v11, "deleteAllNamedEntitiesFromSourcesWithBundleId:groupIds:deletedCount:error:", v10, v9, a5, a6);

  return (char)a6;
}

- (BOOL)deleteAllNamedEntitiesFromSourcesWithBundleId:(id)a3 groupId:(id)a4 olderThan:(id)a5 deletedCount:(unint64_t *)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;

  v11 = a5;
  v12 = a4;
  v13 = a3;
  +[PPNamedEntityReadWriteClient sharedInstance](PPNamedEntityReadWriteClient, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a7) = objc_msgSend(v14, "deleteAllNamedEntitiesFromSourcesWithBundleId:groupId:olderThanDate:deletedCount:error:", v13, v12, v11, a6, a7);

  return (char)a7;
}

- (BOOL)donateMapItem:(id)a3 forPlaceName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a4;
  v8 = a3;
  +[PPNamedEntityReadWriteClient sharedInstance](PPNamedEntityReadWriteClient, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a5) = objc_msgSend(v9, "donateMapItem:forPlaceName:error:", v8, v7, a5);

  return (char)a5;
}

- (id)mapItemForPlaceName:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  +[PPNamedEntityReadOnlyClient sharedInstance](PPNamedEntityReadOnlyClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mapItemForPlaceName:error:", v5, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)removeMapItemForPlaceName:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  +[PPNamedEntityReadWriteClient sharedInstance](PPNamedEntityReadWriteClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "removeMapItemForPlaceName:error:", v5, a4);

  return (char)a4;
}

- (BOOL)removeMapItemsBeforeCutoffDate:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;

  v5 = a3;
  +[PPNamedEntityReadWriteClient sharedInstance](PPNamedEntityReadWriteClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "removeMapItemsBeforeDate:error:", v5, a4);

  return (char)a4;
}

- (BOOL)cloudSyncWithError:(id *)a3
{
  void *v4;

  +[PPNamedEntityReadWriteClient sharedInstance](PPNamedEntityReadWriteClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "cloudSyncWithError:", a3);

  return (char)a3;
}

- (BOOL)clearWithError:(id *)a3 deletedCount:(unint64_t *)a4
{
  void *v6;

  +[PPNamedEntityReadWriteClient sharedInstance](PPNamedEntityReadWriteClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a4) = objc_msgSend(v6, "clearWithError:deletedCount:", a3, a4);

  return (char)a4;
}

- (BOOL)donateLocationNamedEntities:(id)a3 bundleId:(id)a4 groupId:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  id v11;
  void *v12;

  v9 = a5;
  v10 = a4;
  v11 = a3;
  +[PPNamedEntityReadWriteClient sharedInstance](PPNamedEntityReadWriteClient, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a6) = objc_msgSend(v12, "donateLocationNamedEntities:bundleId:groupId:error:", v11, v10, v9, a6);

  return (char)a6;
}

- (id)_lastCallDateForQuery:(id)a3
{
  id v4;
  _PASLock *monitoringSessionsLock;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__1193;
  v16 = __Block_byref_object_dispose__1194;
  monitoringSessionsLock = self->_monitoringSessionsLock;
  v17 = 0;
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __47__PPXPCNamedEntityStore__lastCallDateForQuery___block_invoke;
  v9[3] = &unk_1E2269FA0;
  v11 = &v12;
  v6 = v4;
  v10 = v6;
  -[_PASLock runWithLockAcquired:](monitoringSessionsLock, "runWithLockAcquired:", v9);
  v7 = (id)v13[5];

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)_setLastCallDateForQuery:(id)a3
{
  id v4;
  _PASLock *monitoringSessionsLock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  monitoringSessionsLock = self->_monitoringSessionsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PPXPCNamedEntityStore__setLastCallDateForQuery___block_invoke;
  v7[3] = &unk_1E226A3A0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](monitoringSessionsLock, "runWithLockAcquired:", v7);

}

- (id)_monitoringHelperForQuery:(id)a3 createIfNeeded:(BOOL)a4
{
  id v6;
  _PASLock *monitoringSessionsLock;
  id v8;
  id v9;
  _QWORD v11[4];
  id v12;
  uint64_t *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  v6 = a3;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy__1193;
  v19 = __Block_byref_object_dispose__1194;
  v20 = 0;
  monitoringSessionsLock = self->_monitoringSessionsLock;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __66__PPXPCNamedEntityStore__monitoringHelperForQuery_createIfNeeded___block_invoke;
  v11[3] = &unk_1E2269FC8;
  v8 = v6;
  v14 = a4;
  v12 = v8;
  v13 = &v15;
  -[_PASLock runWithLockAcquired:](monitoringSessionsLock, "runWithLockAcquired:", v11);
  v9 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v9;
}

- (id)_recordGeneratorForQuery:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v4 = a3;
  location = 0;
  objc_initWeak(&location, self);
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__PPXPCNamedEntityStore__recordGeneratorForQuery___block_invoke;
  v8[3] = &unk_1E2269FF0;
  v9 = v4;
  v5 = v4;
  objc_copyWeak(&v10, &location);
  v6 = (void *)MEMORY[0x18D780768](v8);
  objc_destroyWeak(&v10);

  objc_destroyWeak(&location);
  return v6;
}

- (void)_sendResetToAllDelegatesForQuery:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  -[PPXPCNamedEntityStore _monitoringHelperForQuery:createIfNeeded:](self, "_monitoringHelperForQuery:createIfNeeded:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[PPXPCNamedEntityStore _recordGeneratorForQuery:](self, "_recordGeneratorForQuery:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "sendResetToAllDelegatesWithRecordGenerator:", v5);

  }
}

- (void)_sendChangesToDelegatesForQuery:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  -[PPXPCNamedEntityStore _monitoringHelperForQuery:createIfNeeded:](self, "_monitoringHelperForQuery:createIfNeeded:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    location = 0;
    objc_initWeak(&location, self);
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __57__PPXPCNamedEntityStore__sendChangesToDelegatesForQuery___block_invoke;
    v7[3] = &unk_1E226A018;
    objc_copyWeak(&v9, &location);
    v8 = v4;
    -[PPXPCNamedEntityStore _recordGeneratorForQuery:](self, "_recordGeneratorForQuery:", v8);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sendChangesToDelegatesWithChangeGenerator:recordGenerator:", v7, v6);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (void)_loadNamedEntityRecordsForQuery:(id)a3 withDelegate:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a4;
  v7 = a3;
  -[PPXPCNamedEntityStore _monitoringHelperForQuery:createIfNeeded:](self, "_monitoringHelperForQuery:createIfNeeded:", v7, 1);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[PPXPCNamedEntityStore _recordGeneratorForQuery:](self, "_recordGeneratorForQuery:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "loadRecordsWithDelegate:recordGenerator:", v6, v8);
}

- (BOOL)loadNamedEntityRecordsAndMonitorChangesWithDelegate:(id)a3 query:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  char v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;

  v7 = a3;
  v8 = a4;
  location = 0;
  objc_initWeak(&location, self);
  -[PPXPCNamedEntityStore _monitoringHelperForQuery:createIfNeeded:](self, "_monitoringHelperForQuery:createIfNeeded:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PPXPCNamedEntityStore _recordGeneratorForQuery:](self, "_recordGeneratorForQuery:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __89__PPXPCNamedEntityStore_loadNamedEntityRecordsAndMonitorChangesWithDelegate_query_error___block_invoke;
  v14[3] = &unk_1E226A040;
  objc_copyWeak(&v16, &location);
  v11 = v8;
  v15 = v11;
  v12 = objc_msgSend(v9, "loadRecordsAndMonitorChangesWithDelegate:recordGenerator:notificationRegistrationBlock:", v7, v10, v14);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

  return v12;
}

- (BOOL)loadNamedEntityRecordsAndMonitorChangesWithDelegate:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;

  v6 = a3;
  v7 = (void *)objc_opt_new();
  LOBYTE(a4) = -[PPXPCNamedEntityStore loadNamedEntityRecordsAndMonitorChangesWithDelegate:query:error:](self, "loadNamedEntityRecordsAndMonitorChangesWithDelegate:query:error:", v6, v7, a4);

  return (char)a4;
}

- (void)unloadMonitoringDelegate:(id)a3
{
  id v4;
  _PASLock *monitoringSessionsLock;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  monitoringSessionsLock = self->_monitoringSessionsLock;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __50__PPXPCNamedEntityStore_unloadMonitoringDelegate___block_invoke;
  v7[3] = &unk_1E226A3A0;
  v8 = v4;
  v6 = v4;
  -[_PASLock runWithLockAcquired:](monitoringSessionsLock, "runWithLockAcquired:", v7);

}

- (void)registerFeedback:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v16[5];
  id v17;

  v7 = a4;
  v8 = a3;
  if (objc_msgSend(v8, "isMapped"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPXPCNamedEntityStore.m"), 435, CFSTR("You cannot send mapped feedback on named entities. Please use PPFeedback to create the feedback for named entities."));

  }
  -[PPXPCNamedEntityStore clientIdentifier](self, "clientIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "length");

  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PPXPCNamedEntityStore.m"), 436, CFSTR("The clientIdentifier property must be set on the PPNamedEntityStore in order to send feedback."));

  }
  -[PPXPCNamedEntityStore clientIdentifier](self, "clientIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setClientIdentifier:", v11);

  +[PPNamedEntityReadOnlyClient sharedInstance](PPNamedEntityReadOnlyClient, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __53__PPXPCNamedEntityStore_registerFeedback_completion___block_invoke;
  v16[3] = &unk_1E226C218;
  v16[4] = self;
  v17 = v7;
  v13 = v7;
  objc_msgSend(v12, "registerFeedback:completion:", v8, v16);

}

- (id)clientIdentifier
{
  return -[PPClientFeedbackHelper clientIdentifier](self->_clientFeedbackHelper, "clientIdentifier");
}

- (void)setClientIdentifier:(id)a3
{
  -[PPClientFeedbackHelper setClientIdentifier:](self->_clientFeedbackHelper, "setClientIdentifier:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_monitoringSessionsLock, 0);
  objc_storeStrong((id *)&self->_clientFeedbackHelper, 0);
}

void __53__PPXPCNamedEntityStore_registerFeedback_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  if (v7)
  {
    v8 = v6;
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2, a3);
    v6 = v8;
  }

}

void __50__PPXPCNamedEntityStore_unloadMonitoringDelegate___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a2, "objectEnumerator", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7), "monitoringHelper");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "unloadDelegate:", *(_QWORD *)(a1 + 32));

        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

void __89__PPXPCNamedEntityStore_loadNamedEntityRecordsAndMonitorChangesWithDelegate_query_error___block_invoke(uint64_t a1)
{
  id *v2;
  id WeakRetained;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;

  v2 = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v4 = MEMORY[0x1E0C809B0];
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __89__PPXPCNamedEntityStore_loadNamedEntityRecordsAndMonitorChangesWithDelegate_query_error___block_invoke_2;
    v8[3] = &unk_1E226A040;
    objc_copyWeak(&v10, v2);
    v9 = *(id *)(a1 + 32);
    +[PPNotificationManager addPortraitChangeObserverForLifetimeOfObject:block:](PPNotificationManager, "addPortraitChangeObserverForLifetimeOfObject:block:", WeakRetained, v8);
    v5[0] = v4;
    v5[1] = 3221225472;
    v5[2] = __89__PPXPCNamedEntityStore_loadNamedEntityRecordsAndMonitorChangesWithDelegate_query_error___block_invoke_41;
    v5[3] = &unk_1E226A040;
    objc_copyWeak(&v7, v2);
    v6 = *(id *)(a1 + 32);
    +[PPNotificationManager addPortraitInvalidationObserverForLifetimeOfObject:block:](PPNotificationManager, "addPortraitInvalidationObserverForLifetimeOfObject:block:", WeakRetained, v5);

    objc_destroyWeak(&v7);
    objc_destroyWeak(&v10);
  }

}

void __89__PPXPCNamedEntityStore_loadNamedEntityRecordsAndMonitorChangesWithDelegate_query_error___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  pp_entities_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_18BE3A000, v3, OS_LOG_TYPE_DEFAULT, "loadNamedEntityRecordsAndMonitorChanges change block being called for query %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(WeakRetained, "_sendChangesToDelegatesForQuery:", *(_QWORD *)(a1 + 32));
}

void __89__PPXPCNamedEntityStore_loadNamedEntityRecordsAndMonitorChangesWithDelegate_query_error___block_invoke_41(uint64_t a1)
{
  id WeakRetained;
  NSObject *v3;
  uint64_t v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  pp_entities_log_handle();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v4;
    _os_log_impl(&dword_18BE3A000, v3, OS_LOG_TYPE_DEFAULT, "loadNamedEntityRecordsAndMonitorChanges invalidation block being called for query %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(WeakRetained, "_sendResetToAllDelegatesForQuery:", *(_QWORD *)(a1 + 32));
}

id __57__PPXPCNamedEntityStore__sendChangesToDelegatesForQuery___block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  int v10;
  id v11;
  NSObject *v12;
  void *v13;
  id v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t, _BYTE *);
  void *v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = (void *)objc_opt_new();
  +[PPNamedEntityReadOnlyClient sharedInstance](PPNamedEntityReadOnlyClient, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyForMonitoring");
  v6 = objc_msgSend(v5, "limit");
  if (v6 >= 0x1F4)
    v7 = 500;
  else
    v7 = v6;
  objc_msgSend(v5, "setLimit:", v7);
  objc_msgSend(WeakRetained, "_lastCallDateForQuery:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFromDate:", v8);

  v22 = 0;
  v17 = MEMORY[0x1E0C809B0];
  v18 = 3221225472;
  v19 = __57__PPXPCNamedEntityStore__sendChangesToDelegatesForQuery___block_invoke_2;
  v20 = &unk_1E226AC10;
  v9 = v3;
  v21 = v9;
  v10 = objc_msgSend(v4, "namedEntityRecordsWithQuery:error:handleBatch:", v5, &v22, &v17);
  v11 = v22;

  if (v10)
  {
    objc_msgSend(WeakRetained, "_setLastCallDateForQuery:", *(_QWORD *)(a1 + 32), v17, v18, v19, v20);
  }
  else
  {
    pp_entities_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v16 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v24 = v16;
      v25 = 2112;
      v26 = v11;
      _os_log_error_impl(&dword_18BE3A000, v12, OS_LOG_TYPE_ERROR, "namedEntityRecordsWithQuery query: %@, returned error: %@", buf, 0x16u);
    }

  }
  v13 = v21;
  v14 = v9;

  return v14;
}

uint64_t __57__PPXPCNamedEntityStore__sendChangesToDelegatesForQuery___block_invoke_2(uint64_t result, uint64_t a2, _BYTE *a3)
{
  if (!*a3)
    return objc_msgSend(*(id *)(result + 32), "addObjectsFromArray:", a2);
  return result;
}

id __50__PPXPCNamedEntityStore__recordGeneratorForQuery___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  int v9;
  id v10;
  NSObject *WeakRetained;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, _BYTE *);
  void *v18;
  id v19;
  id v20;
  uint8_t buf[4];
  id v22;
  __int16 v23;
  id v24;
  __int16 v25;
  uint64_t v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)objc_opt_new();
  pp_entities_log_handle();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    v13 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v22 = v3;
    v23 = 2112;
    v24 = v13;
    _os_log_debug_impl(&dword_18BE3A000, v5, OS_LOG_TYPE_DEBUG, "calling rankedNamedEntitiesWithQuery for delegate %@ and query %@", buf, 0x16u);
  }

  +[PPNamedEntityReadOnlyClient sharedInstance](PPNamedEntityReadOnlyClient, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(*(id *)(a1 + 32), "copyForMonitoring");
  v20 = 0;
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __50__PPXPCNamedEntityStore__recordGeneratorForQuery___block_invoke_36;
  v18 = &unk_1E226AC10;
  v8 = v4;
  v19 = v8;
  v9 = objc_msgSend(v6, "rankedNamedEntitiesWithQuery:error:handleBatch:", v7, &v20, &v15);
  v10 = v20;

  if (v9)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    -[NSObject _setLastCallDateForQuery:](WeakRetained, "_setLastCallDateForQuery:", *(_QWORD *)(a1 + 32), v15, v16, v17, v18);
  }
  else
  {
    pp_entities_log_handle();
    WeakRetained = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(WeakRetained, OS_LOG_TYPE_ERROR))
    {
      v14 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      v22 = v10;
      v23 = 2112;
      v24 = v3;
      v25 = 2112;
      v26 = v14;
      _os_log_error_impl(&dword_18BE3A000, WeakRetained, OS_LOG_TYPE_ERROR, "error %@ during rankedNamedEntitiesWithQuery for delegate %@ and query %@", buf, 0x20u);
    }
  }

  return v8;
}

void __50__PPXPCNamedEntityStore__recordGeneratorForQuery___block_invoke_36(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          v13 = (void *)MEMORY[0x18D7805AC](v8);
          v14 = *(void **)(a1 + 32);
          objc_msgSend(v12, "item", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "mostRelevantRecord");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "addObject:", v16);

          objc_autoreleasePoolPop(v13);
          ++v11;
        }
        while (v9 != v11);
        v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        v9 = v8;
      }
      while (v8);
    }

  }
}

void __66__PPXPCNamedEntityStore__monitoringHelperForQuery_createIfNeeded___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  BOOL v5;
  uint64_t v6;
  uint64_t v7;
  PPXPCNamedEntityStoreQueryMonitorSession *v8;
  PPRecordMonitoringHelper *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_msgSend(v14, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (*(_BYTE *)(a1 + 48))
    v5 = v3 == 0;
  else
    v5 = 0;
  if (v5)
  {
    v9 = [PPRecordMonitoringHelper alloc];
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("NamedEntityStore:%@"), *(_QWORD *)(a1 + 32));
    v11 = -[PPRecordMonitoringHelper initWithName:](v9, "initWithName:", v10);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v13 = *(void **)(v12 + 40);
    *(_QWORD *)(v12 + 40) = v11;

    v8 = -[PPXPCNamedEntityStoreQueryMonitorSession initWithMonitoringHelper:]([PPXPCNamedEntityStoreQueryMonitorSession alloc], "initWithMonitoringHelper:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40));
    objc_msgSend(v14, "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 32));
  }
  else
  {
    objc_msgSend(v3, "monitoringHelper");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v8 = *(PPXPCNamedEntityStoreQueryMonitorSession **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }

}

void __50__PPXPCNamedEntityStore__setLastCallDateForQuery___block_invoke(uint64_t a1, void *a2)
{
  id v2;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setLastCallDate");

}

void __47__PPXPCNamedEntityStore__lastCallDateForQuery___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  id v6;

  objc_msgSend(a2, "objectForKeyedSubscript:", *(_QWORD *)(a1 + 32));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "lastCallDate");
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __59__PPXPCNamedEntityStore_namedEntityRecordsWithQuery_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  v5 = objc_msgSend(v4, "count");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
}

void __69__PPXPCNamedEntityStore_iterNamedEntityRecordsWithQuery_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

void __60__PPXPCNamedEntityStore_rankedNamedEntitiesWithQuery_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "addObject:", v4);
  v5 = objc_msgSend(v4, "count");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v5;
}

void __70__PPXPCNamedEntityStore_iterRankedNamedEntitiesWithQuery_error_block___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = v5;
  if (!*a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v13;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32));
        if (*a3)
          break;
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

@end
