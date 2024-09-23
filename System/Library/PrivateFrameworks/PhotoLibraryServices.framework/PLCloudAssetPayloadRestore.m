@implementation PLCloudAssetPayloadRestore

- (PLCloudAssetPayloadRestore)initWithDelegate:(id)a3 batchSize:(unint64_t)a4
{
  id v7;
  PLCloudAssetPayloadRestore *v8;
  PLCloudAssetPayloadRestore *v9;
  unint64_t v10;
  uint64_t v11;
  NSMutableArray *batchToRestore;
  NSMutableDictionary *v13;
  NSMutableDictionary *payloadsWithUnresolvedAssets;
  objc_super v16;

  v7 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PLCloudAssetPayloadRestore;
  v8 = -[PLCloudAssetPayloadRestore init](&v16, sel_init);
  v9 = v8;
  if (v8)
  {
    objc_storeStrong((id *)&v8->_delegate, a3);
    v10 = 50;
    if (a4)
      v10 = a4;
    v9->_batchSize = v10;
    v11 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", v9->_batchSize);
    batchToRestore = v9->_batchToRestore;
    v9->_batchToRestore = (NSMutableArray *)v11;

    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    payloadsWithUnresolvedAssets = v9->_payloadsWithUnresolvedAssets;
    v9->_payloadsWithUnresolvedAssets = v13;

  }
  return v9;
}

- (void)addPayload:(id)a3
{
  -[NSMutableArray addObject:](self->_batchToRestore, "addObject:", a3);
  if (-[NSMutableArray count](self->_batchToRestore, "count") >= self->_batchSize)
    -[PLCloudAssetPayloadRestore _insertBatchToRestore](self, "_insertBatchToRestore");
  if (-[NSMutableDictionary count](self->_payloadsWithUnresolvedAssets, "count") >= self->_batchSize)
    -[PLCloudAssetPayloadRestore _insertBatchOfUnresolvedCloudIdentifiers](self, "_insertBatchOfUnresolvedCloudIdentifiers");
}

- (void)insertRemainingPayloads
{
  if (-[NSMutableArray count](self->_batchToRestore, "count"))
    -[PLCloudAssetPayloadRestore _insertBatchToRestore](self, "_insertBatchToRestore");
  if (-[NSMutableDictionary count](self->_payloadsWithUnresolvedAssets, "count"))
    -[PLCloudAssetPayloadRestore _insertBatchOfUnresolvedCloudIdentifiers](self, "_insertBatchOfUnresolvedCloudIdentifiers");
}

- (void)_insertBatchToRestore
{
  PLCloudAssetPayloadRestoreDelegate *delegate;
  _QWORD v3[5];

  delegate = self->_delegate;
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __51__PLCloudAssetPayloadRestore__insertBatchToRestore__block_invoke;
  v3[3] = &unk_1E3677AA0;
  v3[4] = self;
  -[PLCloudAssetPayloadRestoreDelegate performTransactionAndWait:](delegate, "performTransactionAndWait:", v3);
}

- (void)_insertBatchOfUnresolvedCloudIdentifiers
{
  void *v3;
  void *v4;
  PLCloudAssetPayloadRestoreDelegate *delegate;
  uint64_t v6;
  uint64_t v7;
  void (*v8)(uint64_t);
  void *v9;
  PLCloudAssetPayloadRestore *v10;
  id v11;

  -[PLCloudAssetPayloadRestore _resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs](self, "_resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    delegate = self->_delegate;
    v6 = MEMORY[0x1E0C809B0];
    v7 = 3221225472;
    v8 = __70__PLCloudAssetPayloadRestore__insertBatchOfUnresolvedCloudIdentifiers__block_invoke;
    v9 = &unk_1E3677C18;
    v10 = self;
    v11 = v3;
    -[PLCloudAssetPayloadRestoreDelegate performTransactionAndWait:](delegate, "performTransactionAndWait:", &v6);
    -[NSMutableDictionary removeAllObjects](self->_payloadsWithUnresolvedAssets, "removeAllObjects", v6, v7, v8, v9, v10);

  }
  else
  {
    -[NSMutableDictionary removeAllObjects](self->_payloadsWithUnresolvedAssets, "removeAllObjects");
  }

}

- (void)_insertPayload:(id)a3 forAssets:(id)a4 skipMessage:(id)a5
{
  id v8;
  id v9;
  PLCloudAssetPayloadRestoreDelegate *delegate;
  id v11;
  void *v12;
  char v13;
  uint64_t v14;
  NSObject *v15;
  int v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  delegate = self->_delegate;
  v11 = a4;
  -[PLCloudAssetPayloadRestoreDelegate managedObjectContext](delegate, "managedObjectContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v8, "insertWithAssets:inManagedObjectContext:", v11, v12);

  if ((v13 & 1) != 0)
  {
    v14 = 40;
  }
  else
  {
    PLMigrationGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = 138412546;
      v17 = v9;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_INFO, "ComputeCache BatchRestore: Skipped payload (%@): %@\n", (uint8_t *)&v16, 0x16u);
    }

    v14 = 48;
  }
  ++*(Class *)((char *)&self->super.isa + v14);

}

- (id)_resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs
{
  id v3;
  id v4;
  id v5;
  NSMutableDictionary *payloadsWithUnresolvedAssets;
  uint64_t v7;
  id v8;
  id v9;
  PLCloudAssetPayloadRestoreDelegate *delegate;
  void *v11;
  id v12;
  void *v13;
  NSObject *v14;
  id *v15;
  id v16;
  id v17;
  NSMutableDictionary *v18;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  _QWORD v24[2];
  id v25;
  _QWORD v26[4];
  id v27;
  id v28;
  uint8_t buf[4];
  void *v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  payloadsWithUnresolvedAssets = self->_payloadsWithUnresolvedAssets;
  v7 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __86__PLCloudAssetPayloadRestore__resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs__block_invoke;
  v26[3] = &unk_1E3677AC8;
  v8 = v3;
  v27 = v8;
  v9 = v4;
  v28 = v9;
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](payloadsWithUnresolvedAssets, "enumerateKeysAndObjectsUsingBlock:", v26);
  delegate = self->_delegate;
  v25 = 0;
  -[PLCloudAssetPayloadRestoreDelegate resolveLocalIdentifiersForCloudIdentifiers:error:](delegate, "resolveLocalIdentifiersForCloudIdentifiers:error:", v8, &v25);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v25;
  v13 = v12;
  if (v11)
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v30 = v11;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_INFO, "ComputeCache BatchRestore: Resolved remapped cloud identifiers: %@\n", buf, 0xCu);
    }

    v20[0] = v7;
    v20[1] = 3221225472;
    v20[2] = __86__PLCloudAssetPayloadRestore__resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs__block_invoke_44;
    v20[3] = &unk_1E3677AF0;
    v15 = &v21;
    v21 = v9;
    v16 = v5;
    v22 = v16;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v20);
    v17 = v16;

  }
  else
  {
    v18 = self->_payloadsWithUnresolvedAssets;
    v23[0] = v7;
    v23[1] = 3221225472;
    v23[2] = __86__PLCloudAssetPayloadRestore__resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs__block_invoke_2;
    v23[3] = &unk_1E3677AC8;
    v15 = (id *)v24;
    v24[0] = v12;
    v24[1] = self;
    -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](v18, "enumerateKeysAndObjectsUsingBlock:", v23);
    v17 = 0;
  }

  return v17;
}

- (unint64_t)batchSize
{
  return self->_batchSize;
}

- (unint64_t)totalRestored
{
  return self->_totalRestored;
}

- (unint64_t)totalSkipped
{
  return self->_totalSkipped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_payloadsWithUnresolvedAssets, 0);
  objc_storeStrong((id *)&self->_batchToRestore, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
}

void __86__PLCloudAssetPayloadRestore__resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a3, "assetIdentifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v11);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v11);
        v12 = (id)objc_claimAutoreleasedReturnValue();
        if (!v12)
        {
          v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v12, v11);
        }
        objc_msgSend(v12, "addObject:", v5);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

void __86__PLCloudAssetPayloadRestore__resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  PLMigrationGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = *(_QWORD *)(a1 + 32);
    v7 = 138412546;
    v8 = v4;
    v9 = 2112;
    v10 = v6;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_INFO, "ComputeCache BatchRestore: Skipped payload (resolve cloud identifiers failed): %@, %@\n", (uint8_t *)&v7, 0x16u);
  }

  ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
}

void __86__PLCloudAssetPayloadRestore__resolveLocalIdentifiersForCloudIdentifiersForPayloadIDs__block_invoke_44(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v12);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
          objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v13, v12);
        }
        objc_msgSend(v13, "setObject:forKeyedSubscript:", v6, v5);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

void __70__PLCloudAssetPayloadRestore__insertBatchOfUnresolvedCloudIdentifiers__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;
  _QWORD v14[4];
  id v15;
  uint64_t v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;

  v2 = *(void **)(a1 + 40);
  v3 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
  v4 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __70__PLCloudAssetPayloadRestore__insertBatchOfUnresolvedCloudIdentifiers__block_invoke_2;
  v17[3] = &unk_1E3677AC8;
  v5 = v2;
  v6 = *(_QWORD *)(a1 + 32);
  v18 = v5;
  v19 = v6;
  objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v17);
  v7 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "managedObjectContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetsForPayloadIDsWithPayloads:inManagedObjectContext:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = *(_QWORD *)(a1 + 32);
  v12 = *(void **)(v11 + 24);
  v14[0] = v4;
  v14[1] = 3221225472;
  v14[2] = __70__PLCloudAssetPayloadRestore__insertBatchOfUnresolvedCloudIdentifiers__block_invoke_41;
  v14[3] = &unk_1E3677AC8;
  v15 = v10;
  v16 = v11;
  v13 = v10;
  objc_msgSend(v12, "enumerateKeysAndObjectsUsingBlock:", v14);

}

void __70__PLCloudAssetPayloadRestore__insertBatchOfUnresolvedCloudIdentifiers__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v5, "setLocalAssetIdentifierForCloudIdentifiers:", v6);
  }
  else
  {
    PLMigrationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "payloadID");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_INFO, "ComputeCache BatchRestore: Skipped payload (resolved local identifiers not found for unresolved cloud identifiers): %@\n", (uint8_t *)&v9, 0xCu);

    }
    ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  }

}

void __70__PLCloudAssetPayloadRestore__insertBatchOfUnresolvedCloudIdentifiers__block_invoke_41(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  unint64_t v7;
  NSObject *v8;
  void *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");
  if (v7 >= objc_msgSend(v5, "assetIdentifierCount"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_insertPayload:forAssets:skipMessage:", v5, v6, CFSTR("after resolve remapped identifiers"));
  }
  else
  {
    PLMigrationGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v5, "payloadID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = 138412290;
      v11 = v9;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_INFO, "ComputeCache BatchRestore: Skipped payload (missing assets after resolving local identifiers): %@\n", (uint8_t *)&v10, 0xCu);

    }
    ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  }

}

void __51__PLCloudAssetPayloadRestore__insertBatchToRestore__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;

  v2 = (void *)objc_opt_class();
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(_QWORD *)(v3 + 16);
  objc_msgSend(*(id *)(v3 + 8), "managedObjectContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "assetsForPayloadIDsWithPayloads:inManagedObjectContext:", v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = *(_QWORD *)(a1 + 32);
  v8 = *(void **)(v7 + 16);
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __51__PLCloudAssetPayloadRestore__insertBatchToRestore__block_invoke_2;
  v10[3] = &unk_1E3677A50;
  v11 = v6;
  v12 = v7;
  v9 = v6;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v10);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeAllObjects");

}

void __51__PLCloudAssetPayloadRestore__insertBatchToRestore__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  int v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "payloadID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  if (v7 >= objc_msgSend(v3, "assetIdentifierCount"))
  {
    objc_msgSend(*(id *)(a1 + 40), "_insertPayload:forAssets:skipMessage:", v3, v6, CFSTR("existing asset"));
  }
  else if (objc_msgSend(v3, "assetIdentifierType") == 1)
  {
    v8 = *(void **)(*(_QWORD *)(a1 + 40) + 24);
    objc_msgSend(v3, "payloadID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v3, v9);

  }
  else
  {
    PLMigrationGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v3, "payloadID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = 138412290;
      v13 = v11;
      _os_log_impl(&dword_199541000, v10, OS_LOG_TYPE_INFO, "ComputeCache BatchRestore: Skipped payload (missing asset): %@\n", (uint8_t *)&v12, 0xCu);

    }
    ++*(_QWORD *)(*(_QWORD *)(a1 + 40) + 48);
  }

}

+ (id)assetForPayload:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  const __CFString *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "assetIdentifiers");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    v10 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchRequestWithEntityName:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v13 = objc_msgSend(v6, "assetIdentifierType");
    if (v13 == 1)
    {
      v14 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v6, "assetIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "anyObject");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = CFSTR("cloudAssetGUID");
    }
    else
    {
      if (v13)
      {
LABEL_8:
        objc_msgSend(a1, "relationshipKeyPathsForPrefetching");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setRelationshipKeyPathsForPrefetching:", v21);

        objc_msgSend(v7, "executeFetchRequest:error:", v12, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      v14 = (void *)MEMORY[0x1E0CB3880];
      objc_msgSend(v6, "assetIdentifiers");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "anyObject");
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = (void *)v16;
      v18 = CFSTR("uuid");
    }
    objc_msgSend(v14, "predicateWithFormat:", CFSTR("%K == %@"), v18, v16);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPredicate:", v20);

    goto LABEL_8;
  }
  v19 = 0;
LABEL_9:

  return v19;
}

+ (id)assetsForPayloadIDsWithPayloads:(id)a3 inManagedObjectContext:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  unint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  _QWORD v37[4];
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v11 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __85__PLCloudAssetPayloadRestore_assetsForPayloadIDsWithPayloads_inManagedObjectContext___block_invoke;
  v43[3] = &unk_1E3677A50;
  v13 = v10;
  v44 = v13;
  v14 = v11;
  v45 = v14;
  objc_msgSend(v8, "enumerateObjectsUsingBlock:", v43);

  v15 = 0x1E0C97000;
  if (objc_msgSend(v14, "count"))
  {
    v16 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "fetchRequestWithEntityName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    v19 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v14, "allKeys");
    v20 = v12;
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("cloudAssetGUID"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setPredicate:", v22);

    v12 = v20;
    objc_msgSend(a1, "relationshipKeyPathsForPrefetching");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setRelationshipKeyPathsForPrefetching:", v23);

    objc_msgSend(v6, "executeFetchRequest:error:", v18, 0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v20;
    v40[1] = 3221225472;
    v40[2] = __85__PLCloudAssetPayloadRestore_assetsForPayloadIDsWithPayloads_inManagedObjectContext___block_invoke_2;
    v40[3] = &unk_1E3677A78;
    v41 = v14;
    v42 = v9;
    objc_msgSend(v24, "enumerateObjectsUsingBlock:", v40);

    v15 = 0x1E0C97000uLL;
  }
  if (objc_msgSend(v13, "count"))
  {
    v25 = *(void **)(v15 + 2888);
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "fetchRequestWithEntityName:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x1E0CB3880];
    objc_msgSend(v13, "allKeys");
    v29 = v12;
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("uuid"), v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setPredicate:", v31);

    objc_msgSend(a1, "relationshipKeyPathsForPrefetching");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setRelationshipKeyPathsForPrefetching:", v32);

    objc_msgSend(v6, "executeFetchRequest:error:", v27, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v29;
    v37[1] = 3221225472;
    v37[2] = __85__PLCloudAssetPayloadRestore_assetsForPayloadIDsWithPayloads_inManagedObjectContext___block_invoke_3;
    v37[3] = &unk_1E3677A78;
    v38 = v13;
    v39 = v9;
    objc_msgSend(v33, "enumerateObjectsUsingBlock:", v37);

  }
  v34 = v45;
  v35 = v9;

  return v35;
}

+ (id)relationshipKeyPathsForPrefetching
{
  _QWORD v3[3];

  v3[2] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("additionalAttributes");
  v3[1] = CFSTR("detectedFaces");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

void __85__PLCloudAssetPayloadRestore_assetsForPayloadIDsWithPayloads_inManagedObjectContext___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t j;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  BOOL v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = objc_msgSend(v3, "assetIdentifierType");
  if (v4 == 1)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    objc_msgSend(v3, "assetIdentifiers", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v16; ++i)
        {
          if (*(_QWORD *)v25 != v17)
            objc_enumerationMutation(v5);
          v19 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
          v20 = *(void **)(a1 + 40);
          objc_msgSend(v3, "payloadID");
          v21 = objc_claimAutoreleasedReturnValue();
          v22 = (void *)v21;
          if (v19)
            v23 = v21 == 0;
          else
            v23 = 1;
          if (!v23)
            objc_msgSend(v20, "setObject:forKey:", v21, v19);

        }
        v16 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      }
      while (v16);
    }
    goto LABEL_28;
  }
  if (!v4)
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    objc_msgSend(v3, "assetIdentifiers");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v29;
      do
      {
        for (j = 0; j != v7; ++j)
        {
          if (*(_QWORD *)v29 != v8)
            objc_enumerationMutation(v5);
          v10 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * j);
          v11 = *(void **)(a1 + 32);
          objc_msgSend(v3, "payloadID");
          v12 = objc_claimAutoreleasedReturnValue();
          v13 = (void *)v12;
          if (v10)
            v14 = v12 == 0;
          else
            v14 = 1;
          if (!v14)
            objc_msgSend(v11, "setObject:forKey:", v12, v10);

        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      }
      while (v7);
    }
LABEL_28:

  }
}

void __85__PLCloudAssetPayloadRestore_assetsForPayloadIDsWithPayloads_inManagedObjectContext___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "cloudAssetGUID");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v7);
      }
      objc_msgSend(v8, "addObject:", v9);

    }
  }

}

void __85__PLCloudAssetPayloadRestore_assetsForPayloadIDsWithPayloads_inManagedObjectContext___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  id v9;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v9 = v3;
  objc_msgSend(v3, "uuid");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", v7);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8)
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
        objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v8, v7);
      }
      objc_msgSend(v8, "addObject:", v9);

    }
  }

}

@end
