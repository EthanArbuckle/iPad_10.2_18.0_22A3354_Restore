@implementation WBSLPLinkMetadataSQLiteStore

- (int)_createFreshDatabaseSchema
{
  void *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  -[WBSSQLiteStore database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __58__WBSLPLinkMetadataSQLiteStore__createFreshDatabaseSchema__block_invoke;
  v5[3] = &unk_1E5441A88;
  v5[4] = self;
  v5[5] = &v6;
  objc_msgSend(v3, "tryToPerformTransactionInBlock:", v5);

  LODWORD(v3) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v3;
}

BOOL __58__WBSLPLinkMetadataSQLiteStore__createFreshDatabaseSchema__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v2, 0, CFSTR("CREATE TABLE page_url (url TEXT PRIMARY KEY NOT NULL,uuid TEXT NOT NULL ON CONFLICT FAIL)"));

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 101)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, CFSTR("CREATE INDEX UUIDIndex ON page_url (uuid)"));

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 101)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v4, 0, CFSTR("CREATE TABLE uuid_info (uuid TEXT PRIMARY KEY NOT NULL,timestamp INTEGER)"));

  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) != 101)
    return 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, CFSTR("CREATE INDEX TimestampIndex ON uuid_info (timestamp)"));

  return *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) == 101;
}

- (void)linkAndUpdateTimestampForMetadataWithURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __97__WBSLPLinkMetadataSQLiteStore_linkAndUpdateTimestampForMetadataWithURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __97__WBSLPLinkMetadataSQLiteStore_linkAndUpdateTimestampForMetadataWithURLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  _QWORD *v7;
  _QWORD v8[5];
  id v9;

  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x3032000000;
  v8[3] = __Block_byref_object_copy__1;
  v8[4] = __Block_byref_object_dispose__1;
  v9 = 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__WBSLPLinkMetadataSQLiteStore_linkAndUpdateTimestampForMetadataWithURLString_completionHandler___block_invoke_30;
  v5[3] = &unk_1E5441AB0;
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(a1 + 40);
  v7 = v8;
  v5[4] = v3;
  v6 = v4;
  objc_msgSend(v2, "tryToPerformTransactionInBlock:", v5);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _Block_object_dispose(v8, 8);

}

uint64_t __97__WBSLPLinkMetadataSQLiteStore_linkAndUpdateTimestampForMetadataWithURLString_completionHandler___block_invoke_30(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  WBSLPLinkMetadataInfo *v8;
  uint64_t v9;
  void *v10;

  objc_msgSend(*(id *)(a1 + 32), "_fetchMetadataInfoForURLString:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "uuidString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setTimestampToNowForUUID:", v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "_setUUID:forURLString:", v5, *(_QWORD *)(a1 + 40));
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = -[WBSLPLinkMetadataInfo initWithURLString:uuidString:date:]([WBSLPLinkMetadataInfo alloc], "initWithURLString:uuidString:date:", *(_QWORD *)(a1 + 40), v5, v7);
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v10 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v8;

  }
  return 1;
}

- (void)linkURLString:(id)a3 withUUIDForURLString:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __85__WBSLPLinkMetadataSQLiteStore_linkURLString_withUUIDForURLString_completionHandler___block_invoke;
  v15[3] = &unk_1E5441B28;
  v15[4] = self;
  v16 = v9;
  v17 = v8;
  v18 = v10;
  v12 = v10;
  v13 = v8;
  v14 = v9;
  dispatch_async(v11, v15);

}

void __85__WBSLPLinkMetadataSQLiteStore_linkURLString_withUUIDForURLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  _QWORD v7[5];
  id v8;
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __85__WBSLPLinkMetadataSQLiteStore_linkURLString_withUUIDForURLString_completionHandler___block_invoke_2;
  v7[3] = &unk_1E5441B00;
  v3 = *(void **)(a1 + 40);
  v7[4] = *(_QWORD *)(a1 + 32);
  v8 = v3;
  v10 = &v11;
  v9 = *(id *)(a1 + 48);
  objc_msgSend(v2, "tryToPerformTransactionInBlock:", v7);

  (*(void (**)(_QWORD, _QWORD, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 56) + 16))(*(_QWORD *)(a1 + 56), *((unsigned __int8 *)v12 + 24), v4, v5, v6);
  _Block_object_dispose(&v11, 8);
}

uint64_t __85__WBSLPLinkMetadataSQLiteStore_linkURLString_withUUIDForURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_fetchMetadataInfoForURLString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "uuidString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_setUUID:forURLString:", v3, *(_QWORD *)(a1 + 48));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v4 != 0;

  }
  return 1;
}

- (void)metadataInfoForURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__WBSLPLinkMetadataSQLiteStore_metadataInfoForURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5441B50;
  v12 = v6;
  v13 = v7;
  block[4] = self;
  v9 = v6;
  v10 = v7;
  dispatch_async(v8, block);

}

void __75__WBSLPLinkMetadataSQLiteStore_metadataInfoForURLString_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "_fetchMetadataInfoForURLString:", *(_QWORD *)(a1 + 40));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t))(v1 + 16))(v1);

}

- (void)removeMetadataInfoForURLString:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __81__WBSLPLinkMetadataSQLiteStore_removeMetadataInfoForURLString_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __81__WBSLPLinkMetadataSQLiteStore_removeMetadataInfoForURLString_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[5];
  id v5;
  _QWORD *v6;
  _QWORD v7[5];
  id v8;

  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x3032000000;
  v7[3] = __Block_byref_object_copy__1;
  v7[4] = __Block_byref_object_dispose__1;
  v8 = 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __81__WBSLPLinkMetadataSQLiteStore_removeMetadataInfoForURLString_completionHandler___block_invoke_2;
  v4[3] = &unk_1E5441B78;
  v3 = *(void **)(a1 + 40);
  v4[4] = *(_QWORD *)(a1 + 32);
  v5 = v3;
  v6 = v7;
  objc_msgSend(v2, "tryToPerformTransactionInBlock:", v4);

  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  _Block_object_dispose(v7, 8);

}

uint64_t __81__WBSLPLinkMetadataSQLiteStore_removeMetadataInfoForURLString_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;

  objc_msgSend(*(id *)(a1 + 32), "_fetchMetadataInfoForURLString:", *(_QWORD *)(a1 + 40));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = *(void **)(a1 + 32);
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v2, "uuidString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_deleteMetadataInfoForURLString:uuid:", v5, v6);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
  return 1;
}

- (void)removeAllMetadataInfoWithUUID:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[5];
  id v12;
  id v13;

  v6 = a3;
  v7 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __80__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithUUID_completionHandler___block_invoke;
  block[3] = &unk_1E5441AD8;
  block[4] = self;
  v12 = v6;
  v13 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_async(v8, block);

}

void __80__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithUUID_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _QWORD v8[5];
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __80__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithUUID_completionHandler___block_invoke_2;
  v8[3] = &unk_1E5441BA0;
  v3 = *(void **)(a1 + 40);
  v8[4] = *(_QWORD *)(a1 + 32);
  v9 = v3;
  objc_msgSend(v2, "tryToPerformTransactionInBlock:", v8);

  (*(void (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v4, v5, v6, v7);
}

uint64_t __80__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithUUID_completionHandler___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_deleteMetadataInfoWithUUID:", *(_QWORD *)(a1 + 40));
  return 1;
}

- (void)removeAllMetadataInfoWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __75__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E5441BC8;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __75__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithCompletionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  _QWORD v3[6];
  _QWORD v4[3];
  char v5;

  v4[0] = 0;
  v4[1] = v4;
  v4[2] = 0x2020000000;
  v5 = 0;
  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3[0] = MEMORY[0x1E0C809B0];
  v3[1] = 3221225472;
  v3[2] = __75__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithCompletionHandler___block_invoke_2;
  v3[3] = &unk_1E5441A88;
  v3[4] = *(_QWORD *)(a1 + 32);
  v3[5] = v4;
  objc_msgSend(v2, "tryToPerformTransactionInBlock:", v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  _Block_object_dispose(v4, 8);
}

uint64_t __75__WBSLPLinkMetadataSQLiteStore_removeAllMetadataInfoWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(*(id *)(a1 + 32), "_deleteAllMetadataInfo");
  return 1;
}

- (void)performLRUEvictionIfNecessaryWithMaximumNumberOfEntries:(unint64_t)a3 completionHandler:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[5];
  id v10;
  unint64_t v11;

  v6 = a4;
  -[WBSSQLiteStore databaseQueue](self, "databaseQueue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __106__WBSLPLinkMetadataSQLiteStore_performLRUEvictionIfNecessaryWithMaximumNumberOfEntries_completionHandler___block_invoke;
  block[3] = &unk_1E5441C18;
  v10 = v6;
  v11 = a3;
  block[4] = self;
  v8 = v6;
  dispatch_async(v7, block);

}

void __106__WBSLPLinkMetadataSQLiteStore_performLRUEvictionIfNecessaryWithMaximumNumberOfEntries_completionHandler___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  _QWORD v5[5];
  id v6;
  uint64_t v7;

  objc_msgSend(*(id *)(a1 + 32), "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __106__WBSLPLinkMetadataSQLiteStore_performLRUEvictionIfNecessaryWithMaximumNumberOfEntries_completionHandler___block_invoke_2;
  v5[3] = &unk_1E5441BF0;
  v4 = *(void **)(a1 + 40);
  v3 = *(_QWORD *)(a1 + 48);
  v5[4] = *(_QWORD *)(a1 + 32);
  v7 = v3;
  v6 = v4;
  objc_msgSend(v2, "tryToPerformTransactionInBlock:", v5);

}

uint64_t __106__WBSLPLinkMetadataSQLiteStore_performLRUEvictionIfNecessaryWithMaximumNumberOfEntries_completionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;

  if ((unint64_t)objc_msgSend(*(id *)(a1 + 32), "_uuidCount") <= *(_QWORD *)(a1 + 48))
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_deleteUUIDWithOldestTimestamp");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

  return 1;
}

- (id)_fetchMetadataInfoForURLString:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  WBSLPLinkMetadataInfo *v11;
  WBSLPLinkMetadataInfo *v12;
  NSObject *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v15 = a3;
  -[WBSSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v4, CFSTR("SELECT p.uuid, u.timestamp FROM page_url p join uuid_info u on p.uuid = u.uuid WHERE p.url = ?"), &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "nextObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringAtIndex:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0C99D68];
  objc_msgSend(v6, "doubleAtIndex:", 1);
  objc_msgSend(v8, "dateWithTimeIntervalSinceReferenceDate:");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "statement");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "invalidate");

  if (v7)
  {
    v11 = [WBSLPLinkMetadataInfo alloc];
    v12 = -[WBSLPLinkMetadataInfo initWithURLString:uuidString:date:](v11, "initWithURLString:uuidString:date:", v15, v7, v9);
  }
  else
  {
    v13 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138739971;
      v17 = v15;
      _os_log_impl(&dword_1A840B000, v13, OS_LOG_TYPE_INFO, "No UUID found for URL: %{sensitive}@.", buf, 0xCu);
    }
    v12 = 0;
  }

  return v12;
}

- (id)_setUUID:(id)a3 forURLString:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  int v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  uint64_t v16;
  id v17;
  id v18;

  v18 = a3;
  v17 = a4;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSQLiteStore database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceReferenceDate");
  v16 = v8;
  v9 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,double>(v7, 0, CFSTR("REPLACE INTO uuid_info (uuid, timestamp) VALUES (?, ?)"), &v18, (double *)&v16);

  if (v9 != 101)
  {
    v13 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[WBSLPLinkMetadataSQLiteStore _setUUID:forURLString:].cold.2();
    goto LABEL_8;
  }
  -[WBSSQLiteStore database](self, "database");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&,NSString * {__strong}&>(v10, 0, CFSTR("REPLACE INTO page_url (url, uuid) VALUES (?, ?)"), &v17, &v18);

  if (v11 != 101)
  {
    v14 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      -[WBSLPLinkMetadataSQLiteStore _setUUID:forURLString:].cold.1();
LABEL_8:
    v12 = 0;
    goto LABEL_9;
  }
  v12 = v6;
LABEL_9:

  return v12;
}

- (id)_setTimestampToNowForUUID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  NSObject *v8;
  uint64_t v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[WBSSQLiteStore database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeIntervalSinceReferenceDate");
  v10 = v6;
  LODWORD(self) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<double,NSString * {__strong}&>(v5, 0, CFSTR("UPDATE uuid_info SET timestamp = ? WHERE uuid = ?"), (double *)&v10, &v11);

  if ((_DWORD)self == 101)
  {
    v7 = v4;
  }
  else
  {
    v8 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[WBSLPLinkMetadataSQLiteStore _setTimestampToNowForUUID:].cold.1();
    v7 = 0;
  }

  return v7;
}

- (id)_deleteMetadataInfoForURLString:(id)a3 uuid:(id)a4
{
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  NSObject *v16;
  id v18;
  id v19;

  v19 = a3;
  v18 = a4;
  -[WBSSQLiteStore database](self, "database");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a4) = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v6, 0, CFSTR("DELETE FROM page_url WHERE url = ?"), &v19);

  if ((_DWORD)a4 != 101)
  {
    v7 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      -[WBSLPLinkMetadataSQLiteStore _deleteMetadataInfoForURLString:uuid:].cold.2();
  }
  -[WBSSQLiteStore database](self, "database");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<NSString * {__strong}&>(v8, CFSTR("SELECT EXISTS(SELECT 1 FROM page_url WHERE uuid = ?)"), &v18);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "nextObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLAtIndex:", 0);
  objc_msgSend(v9, "statement");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "invalidate");

  if ((v11 & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    -[WBSSQLiteStore database](self, "database");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v14, 0, CFSTR("DELETE FROM uuid_info WHERE uuid = ?"), &v18);

    if (v15 != 101)
    {
      v16 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        -[WBSLPLinkMetadataSQLiteStore _deleteMetadataInfoForURLString:uuid:].cold.1();
    }
    v13 = v18;
  }

  return v13;
}

- (void)_deleteMetadataInfoWithUUID:(id)a3
{
  void *v4;
  int v5;
  NSObject *v6;
  void *v7;
  int v8;
  NSObject *v9;
  id v10;

  v10 = a3;
  -[WBSSQLiteStore database](self, "database");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v4, 0, CFSTR("DELETE FROM uuid_info WHERE uuid = ?"), &v10);

  if (v5 != 101)
  {
    v6 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[WBSLPLinkMetadataSQLiteStore _deleteMetadataInfoForURLString:uuid:].cold.1();
  }
  -[WBSSQLiteStore database](self, "database");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<NSString * {__strong}&>(v7, 0, CFSTR("DELETE FROM page_url WHERE uuid = ?"), &v10);

  if (v8 != 101)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WBSLPLinkMetadataSQLiteStore _deleteMetadataInfoForURLString:uuid:].cold.1();
  }

}

- (BOOL)_deleteAllMetadataInfo
{
  void *v3;
  int v4;
  void *v5;
  int v6;
  _BOOL4 v7;
  NSObject *v8;
  NSObject *v9;

  -[WBSSQLiteStore database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v3, 0, CFSTR("DELETE FROM page_url"));

  if (v4 != 101)
  {
    v8 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    v7 = os_log_type_enabled(v8, OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    -[WBSLPLinkMetadataSQLiteStore _deleteAllMetadataInfo].cold.2();
    goto LABEL_9;
  }
  -[WBSSQLiteStore database](self, "database");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = SafariShared::_WBSSQLiteDatabaseExecuteAndReturnError<>(v5, 0, CFSTR("DELETE FROM uuid_info"));

  if (v6 != 101)
  {
    v9 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    v7 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);
    if (!v7)
      return v7;
    -[WBSLPLinkMetadataSQLiteStore _deleteAllMetadataInfo].cold.1();
LABEL_9:
    LOBYTE(v7) = 0;
    return v7;
  }
  LOBYTE(v7) = 1;
  return v7;
}

- (unint64_t)_uuidCount
{
  void *v2;
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;

  -[WBSSQLiteStore database](self, "database");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<>(v2, CFSTR("SELECT COUNT(*) FROM uuid_info"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "nextObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "int64AtIndex:", 0);
  objc_msgSend(v3, "statement");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "invalidate");

  return v5;
}

- (id)_deleteUUIDWithOldestTimestamp
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;

  -[WBSSQLiteStore database](self, "database");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  SafariShared::WBSSQLiteDatabaseFetch<>(v3, CFSTR("SELECT uuid FROM uuid_info WHERE timestamp = (SELECT MIN(timestamp) FROM uuid_info)"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "nextObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "statement");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "invalidate");

  if (v6)
  {
    -[WBSLPLinkMetadataSQLiteStore _deleteMetadataInfoWithUUID:](self, "_deleteMetadataInfoWithUUID:", v6);
    v8 = v6;
  }
  else
  {
    v9 = WBS_LOG_CHANNEL_PREFIXSiteMetadata();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[WBSLPLinkMetadataSQLiteStore _deleteUUIDWithOldestTimestamp].cold.1(v9);
  }

  return v6;
}

- (void)_setUUID:forURLString:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_2(&dword_1A840B000, v0, v1, "Failed to save URL: %{sensitive}@, error code: %d");
  OUTLINED_FUNCTION_1();
}

- (void)_setUUID:forURLString:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_2(&dword_1A840B000, v0, v1, "Failed to save UUID: %{private}@, error code: %d");
  OUTLINED_FUNCTION_1();
}

- (void)_setTimestampToNowForUUID:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_3();
  OUTLINED_FUNCTION_1_2(&dword_1A840B000, v0, v1, "Failed to update timestamp for metadata UUID: %{private}@. Error code: %d");
  OUTLINED_FUNCTION_1();
}

- (void)_deleteMetadataInfoForURLString:uuid:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1A840B000, v0, v1, "Failed to delete uuid. Error code: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_deleteMetadataInfoForURLString:uuid:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1A840B000, v0, v1, "Failed to delete url. Error code: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_deleteAllMetadataInfo
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_4();
  OUTLINED_FUNCTION_0_1(&dword_1A840B000, v0, v1, "Failed to delete all from page_url table. Error code: %d", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_3();
}

- (void)_deleteUUIDWithOldestTimestamp
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A840B000, log, OS_LOG_TYPE_ERROR, "Failed to fetch LRU entry from uuid_info table.", v1, 2u);
  OUTLINED_FUNCTION_3();
}

@end
