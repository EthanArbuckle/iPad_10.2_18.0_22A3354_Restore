@implementation QLCacheFileProviderVersionedFileIdentifier(SQLRequests)

- (uint64_t)initWithSteppedStatement:()SQLRequests database:
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v27;

  v6 = (void *)MEMORY[0x1E0CD3280];
  v7 = a4;
  objc_msgSend(v6, "knownFileProviderIdentifiersSoFar");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "newStringFromColumn:inStatement:uniqueInStringTable:", 1, a3, v8);

  objc_msgSend(MEMORY[0x1E0CD3280], "knownFileProviderIdentifiersSoFar");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v7, "newStringFromColumn:inStatement:uniqueInStringTable:", 2, a3, v10);

  v12 = (void *)objc_msgSend(v7, "newDataFromColumn:inStatement:copyBytes:", 3, a3, 0);
  v27 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", objc_opt_class(), v12, &v27);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v27;
  if (!v13)
  {
    _log();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[QLCacheFileProviderVersionedFileIdentifier(SQLRequests) initWithSteppedStatement:database:].cold.1((uint64_t)v14, v15, v16, v17, v18, v19, v20, v21);

  }
  v22 = objc_alloc(MEMORY[0x1E0CD3280]);
  v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CAAC70]), "initWithProviderDomainID:itemIdentifier:", v9, v11);
  v24 = (void *)objc_msgSend(v22, "initWithItemID:", v23);
  v25 = objc_msgSend(a1, "initWithFileIdentifier:version:", v24, v13);

  return v25;
}

- (uint64_t)statementToInsertIntoDatabase:()SQLRequests
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;

  v4 = a3;
  v5 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(a1, "version");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v5, "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fileIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v4, "prepareStatement:", "INSERT INTO provider_files (fileProviderId, itemId, version) VALUES (?, ?, ?)");
  if (v9)
  {
    objc_msgSend(v8, "itemID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "providerDomainID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bindObject:atIndex:inStatement:", v11, 1, v9);

    objc_msgSend(v8, "itemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "identifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "bindObject:atIndex:inStatement:", v13, 2, v9);

    objc_msgSend(v4, "bindObject:atIndex:inStatement:", v7, 3, v9);
  }

  return v9;
}

- (uint64_t)statementToUpdateRecordWithCacheIdentifier:()SQLRequests inDatabase:
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v17;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0CB36F8];
  objc_msgSend(a1, "version");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v7, "archivedDataWithRootObject:requiringSecureCoding:error:", v8, 1, &v17);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "fileIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "prepareStatement:", "UPDATE provider_files SET fileProviderId=?, itemId=?, version=? WHERE rowid=?");
  if (v11)
  {
    objc_msgSend(v10, "itemID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "providerDomainID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bindObject:atIndex:inStatement:", v13, 1, v11);

    objc_msgSend(v10, "itemID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "bindObject:atIndex:inStatement:", v15, 2, v11);

    objc_msgSend(v6, "bindObject:atIndex:inStatement:", v9, 3, v11);
    objc_msgSend(v6, "bindUnsignedLongLong:atIndex:inStatement:", a3, 4, v11);
  }

  return v11;
}

- (void)initWithSteppedStatement:()SQLRequests database:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_6(&dword_1D54AE000, a2, a3, "Failed to unarchive version: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_5();
}

@end
