@implementation PLSyndicationDeleteEngine

- (PLSyndicationDeleteEngine)initWithDelegate:(id)a3 path:(id)a4 logPrefix:(id)a5
{
  id v8;
  id v9;
  id v10;
  PLSyndicationDeleteEngine *v11;
  PLSyndicationDeleteEngine *v12;
  dispatch_queue_t v13;
  OS_dispatch_queue *queue;
  objc_super v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)PLSyndicationDeleteEngine;
  v11 = -[PLSyndicationDeleteEngine init](&v16, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v8);
    objc_storeStrong((id *)&v12->_logPrefix, a5);
    objc_storeStrong((id *)&v12->_path, a4);
    v13 = dispatch_queue_create("com.apple.photos.syndicationDeleteManager", 0);
    queue = v12->_queue;
    v12->_queue = (OS_dispatch_queue *)v13;

    v12->_wellKnownPhotoLibraryIdentifier = objc_msgSend(v8, "wellKnownPhotoLibraryIdentifier");
  }

  return v12;
}

- (PLSyndicationDeleteEngine)initWithLibraryServicesManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  PLSyndicationDeleteEngine *v9;

  v4 = a3;
  objc_msgSend(v4, "pathManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoDirectoryWithType:", 5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("SyndicationDeleteJournal"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("[sync.delete] L%td"), objc_msgSend(v4, "wellKnownPhotoLibraryIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLSyndicationDeleteEngine initWithDelegate:path:logPrefix:](self, "initWithDelegate:path:logPrefix:", v4, v7, v8);

  return v9;
}

- (BOOL)_processDeletesForBundleID:(id)a3 unprefixedIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  uint64_t v24;
  __int16 v25;
  void *v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PLSyndicationDeleteEngine delegate](self, "delegate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __78__PLSyndicationDeleteEngine__processDeletesForBundleID_unprefixedIdentifiers___block_invoke;
  v19[3] = &unk_1E36720E0;
  v10 = v7;
  v20 = v10;
  v21 = v6;
  v11 = v8;
  v22 = v11;
  v12 = v6;
  objc_msgSend(v9, "performTransactionForSyndicationDeleteManager:name:transaction:", self, "-[PLSyndicationDeleteEngine _processDeletesForBundleID:unprefixedIdentifiers:]", v19);

  v18 = 0;
  PLSyndicationGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
  {
    v14 = objc_msgSend(v11, "count");
    objc_msgSend(v10, "componentsJoinedByString:", CFSTR(","));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v24 = v14;
    v25 = 2114;
    v26 = v15;
    _os_log_impl(&dword_199541000, v13, OS_LOG_TYPE_INFO, "Found %tu asset(s) for deletion using unprefixed identifiers: %{public}@", buf, 0x16u);

  }
  -[PLSyndicationDeleteEngine _deleteSyndicationAssetsWithBundleID:syndicationIdentifiers:deleteCount:](self, "_deleteSyndicationAssetsWithBundleID:syndicationIdentifiers:deleteCount:", v12, v11, &v18);
  v16 = v18 > 0;

  return v16;
}

- (BOOL)_deleteSyndicationAssetsWithBundleID:(id)a3 syndicationIdentifiers:(id)a4 deleteCount:(int64_t *)a5
{
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  PLSyndicationDeleteEngine *v17;
  int64_t *v18;

  v8 = a3;
  v9 = a4;
  -[PLSyndicationDeleteEngine delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __101__PLSyndicationDeleteEngine__deleteSyndicationAssetsWithBundleID_syndicationIdentifiers_deleteCount___block_invoke;
  v14[3] = &unk_1E3672108;
  v15 = v9;
  v16 = v8;
  v17 = self;
  v18 = a5;
  v11 = v8;
  v12 = v9;
  objc_msgSend(v10, "performTransactionForSyndicationDeleteManager:name:transaction:", self, "-[PLSyndicationDeleteEngine _deleteSyndicationAssetsWithBundleID:syndicationIdentifiers:deleteCount:]", v14);

  return 0;
}

- (BOOL)_deleteConversationWithBundleID:(id)a3 syndicationIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  PLSyndicationDeleteEngine *v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[PLSyndicationDeleteEngine delegate](self, "delegate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __84__PLSyndicationDeleteEngine__deleteConversationWithBundleID_syndicationIdentifiers___block_invoke;
  v12[3] = &unk_1E36720E0;
  v13 = v7;
  v14 = self;
  v15 = v6;
  v9 = v6;
  v10 = v7;
  objc_msgSend(v8, "performTransactionForSyndicationDeleteManager:name:transaction:", self, "-[PLSyndicationDeleteEngine _deleteConversationWithBundleID:syndicationIdentifiers:]", v12);

  return 0;
}

- (void)_inqueueProcessDeletesForBundleID:(id)a3 identifiers:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  __int16 v12;
  uint64_t v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  PLSyndicationGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    -[PLSyndicationDeleteEngine logPrefix](self, "logPrefix");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 138543874;
    v11 = v9;
    v12 = 2048;
    v13 = objc_msgSend(v7, "count");
    v14 = 2114;
    v15 = v7;
    _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_DEFAULT, "%{public}@ Going to delete %lu items with identifiers: %{public}@", (uint8_t *)&v10, 0x20u);

  }
  -[PLSyndicationDeleteEngine _processDeletesForBundleID:unprefixedIdentifiers:](self, "_processDeletesForBundleID:unprefixedIdentifiers:", v6, v7);
  if (objc_msgSend(v6, "isEqualToString:", CFSTR("com.apple.MobileSMS")))
    -[PLSyndicationDeleteEngine _deleteConversationWithBundleID:syndicationIdentifiers:](self, "_deleteConversationWithBundleID:syndicationIdentifiers:", v6, v7);

}

- (void)processDeletesForBundleID:(id)a3 identifiers:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *queue;
  id v17;
  id v18;
  id v19;
  id v20;
  _QWORD block[5];
  id v22;
  id v23;
  id v24;
  id v25;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = (void *)MEMORY[0x1E0D73348];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_wellKnownPhotoLibraryIdentifier);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("PLSyndicationDeleteEngine-processDeletes-"), "stringByAppendingString:", v13);
  v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v11, "transaction:", objc_msgSend(v14, "UTF8String"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __78__PLSyndicationDeleteEngine_processDeletesForBundleID_identifiers_completion___block_invoke;
  block[3] = &unk_1E3676240;
  block[4] = self;
  v22 = v8;
  v24 = v15;
  v25 = v10;
  v23 = v9;
  v17 = v15;
  v18 = v10;
  v19 = v9;
  v20 = v8;
  dispatch_async(queue, block);

}

- (PLSyndicationDeleteEngineDelegate)delegate
{
  return (PLSyndicationDeleteEngineDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (NSString)logPrefix
{
  return self->_logPrefix;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_logPrefix, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_path, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __78__PLSyndicationDeleteEngine_processDeletesForBundleID_identifiers_completion___block_invoke(uint64_t a1)
{
  uint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "_inqueueProcessDeletesForBundleID:identifiers:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 64);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  return objc_msgSend(*(id *)(a1 + 56), "stillAlive");
}

void __84__PLSyndicationDeleteEngine__deleteConversationWithBundleID_syndicationIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  __CFString *v10;
  __CFString *v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  __CFString *v25;
  __int16 v26;
  uint64_t v27;
  __int16 v28;
  void *v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C97B48];
  +[PLConversation entityName](PLConversation, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("importSessionID"), *(_QWORD *)(a1 + 32));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v7);
  v19 = 0;
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __84__PLSyndicationDeleteEngine__deleteConversationWithBundleID_syndicationIdentifiers___block_invoke_2;
  v17[3] = &unk_1E3672130;
  v8 = v3;
  v18 = v8;
  v9 = (id)objc_msgSend(v8, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v6, &v19, v17);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 40) + 24) == 3)
    v10 = CFSTR("syndicationLibrary");
  else
    v10 = CFSTR("SPL");
  v11 = v10;
  PLSyndicationGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 40), "logPrefix");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v19;
    v15 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(","));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v21 = v13;
    v22 = 2048;
    v23 = v14;
    v24 = 2112;
    v25 = v11;
    v26 = 2114;
    v27 = v15;
    v28 = 2114;
    v29 = v16;
    _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleted %lu conversation(s) in %@ for bundleID: %{public}@, identifiers: %{public}@", buf, 0x34u);

  }
}

uint64_t __84__PLSyndicationDeleteEngine__deleteConversationWithBundleID_syndicationIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

void __101__PLSyndicationDeleteEngine__deleteSyndicationAssetsWithBundleID_syndicationIdentifiers_deleteCount___block_invoke(uint64_t a1, void *a2)
{
  id v3;
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
  uint64_t v15;
  id v16;
  id v17;
  __CFString *v18;
  __CFString *v19;
  NSObject *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  _QWORD *v25;
  _QWORD v26[4];
  id v27;
  uint64_t v28;
  uint8_t buf[4];
  void *v30;
  __int16 v31;
  uint64_t v32;
  __int16 v33;
  __CFString *v34;
  __int16 v35;
  uint64_t v36;
  __int16 v37;
  void *v38;
  _QWORD v39[2];
  _QWORD v40[4];

  v40[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3528];
  +[PLManagedAsset predicateForSyndicatedAssetIdentifiers:includeRejected:](PLManagedAsset, "predicateForSyndicatedAssetIdentifiers:includeRejected:", *(_QWORD *)(a1 + 32), 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("additionalAttributes.importedByBundleIdentifier"), *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v40[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24) != 3)
  {
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)MEMORY[0x1E0CB3528];
    v39[0] = v11;
    v39[1] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
  objc_msgSend(v6, "setPredicate:", v11);
  v28 = 0;
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __101__PLSyndicationDeleteEngine__deleteSyndicationAssetsWithBundleID_syndicationIdentifiers_deleteCount___block_invoke_2;
  v26[3] = &unk_1E36740E0;
  v16 = v3;
  v27 = v16;
  v17 = (id)objc_msgSend(v16, "enumerateObjectsFromFetchRequest:count:usingDefaultBatchSizeWithBlock:", v6, &v28, v26);
  if (*(_QWORD *)(*(_QWORD *)(a1 + 48) + 24) == 3)
    v18 = CFSTR("syndicationLibrary");
  else
    v18 = CFSTR("SPL");
  v19 = v18;
  PLSyndicationGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(*(id *)(a1 + 48), "logPrefix");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v28;
    v23 = *(_QWORD *)(a1 + 40);
    objc_msgSend(*(id *)(a1 + 32), "componentsJoinedByString:", CFSTR(","));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138544386;
    v30 = v21;
    v31 = 2048;
    v32 = v22;
    v33 = 2112;
    v34 = v19;
    v35 = 2114;
    v36 = v23;
    v37 = 2114;
    v38 = v24;
    _os_log_impl(&dword_199541000, v20, OS_LOG_TYPE_DEFAULT, "%{public}@ Deleted %lu syndication guest asset(s) in %@ for bundleID: %{public}@, identifiers: %{public}@", buf, 0x34u);

  }
  v25 = *(_QWORD **)(a1 + 56);
  if (v25)
    *v25 = v28;

}

uint64_t __101__PLSyndicationDeleteEngine__deleteSyndicationAssetsWithBundleID_syndicationIdentifiers_deleteCount___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteObject:", a2);
}

void __78__PLSyndicationDeleteEngine__processDeletesForBundleID_unprefixedIdentifiers___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  void *v23;
  id v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  id v30;
  uint8_t buf[4];
  void *v32;
  _BYTE v33[128];
  const __CFString *v34;
  _QWORD v35[4];

  v35[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fetchRequestWithEntityName:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3528];
  +[PLManagedAsset predicateForSyndicatedAssetIdentifiersSuffix:](PLManagedAsset, "predicateForSyndicatedAssetIdentifiersSuffix:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("additionalAttributes.importedByBundleIdentifier"), *(_QWORD *)(a1 + 40));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v10);
  v11 = objc_claimAutoreleasedReturnValue();

  v25 = (void *)v11;
  objc_msgSend(v6, "setPredicate:", v11);
  v34 = CFSTR("additionalAttributes");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v34, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setRelationshipKeyPathsForPrefetching:", v12);

  v30 = 0;
  objc_msgSend(v3, "executeFetchRequest:error:", v6, &v30);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = v30;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v14 = v13;
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v27 != v17)
          objc_enumerationMutation(v14);
        v19 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v19, "additionalAttributes");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "syndicationIdentifier");
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        if (v21)
        {
          objc_msgSend(*(id *)(a1 + 48), "addObject:", v21);
        }
        else
        {
          PLSyndicationGetLog();
          v22 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v19, "uuid");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543362;
            v32 = v23;
            _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "Unexpected nil syndicationIdentifier on asset %{public}@", buf, 0xCu);

          }
        }

      }
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, v33, 16);
    }
    while (v16);
  }

}

@end
