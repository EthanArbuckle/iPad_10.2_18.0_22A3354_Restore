@implementation SSAppPurchaseHistoryCache

- (SSAppPurchaseHistoryCache)init
{
  SSAppPurchaseHistoryCache *v2;
  void *v3;
  SSAppPurchaseHistoryDatabase *v4;
  SSAppPurchaseHistoryDatabase *purchaseHistoryDatabase;
  SSDatabaseCache *v6;
  SSDatabaseCache *databaseCache;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SSAppPurchaseHistoryCache;
  v2 = -[SSAppPurchaseHistoryCache init](&v9, sel_init);
  if (v2)
  {
    v3 = (void *)MEMORY[0x1A8585BF8]();
    v4 = +[SSAppPurchaseHistoryDatabase newDefaultInstance](SSAppPurchaseHistoryDatabase, "newDefaultInstance");
    purchaseHistoryDatabase = v2->_purchaseHistoryDatabase;
    v2->_purchaseHistoryDatabase = v4;

    v6 = +[SSAppIconDatabaseCache newDefaultDatabaseCache](SSAppIconDatabaseCache, "newDefaultDatabaseCache");
    databaseCache = v2->_databaseCache;
    v2->_databaseCache = v6;

    objc_autoreleasePoolPop(v3);
    if (!v2->_purchaseHistoryDatabase || !v2->_databaseCache)
    {

      return 0;
    }
  }
  return v2;
}

- (SSAppPurchaseHistoryCache)initWithAccount:(id)a3
{
  id v5;
  SSAppPurchaseHistoryCache *v6;
  SSAppPurchaseHistoryCache *v7;

  v5 = a3;
  v6 = -[SSAppPurchaseHistoryCache init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_account, a3);

  return v7;
}

- (id)allUncachedImages:(id)a3
{
  id v4;
  void *v5;
  SSAppPurchaseHistoryDatabase *purchaseHistoryDatabase;
  _QWORD v8[5];
  id v9;
  id v10;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_account)
  {
    purchaseHistoryDatabase = self->_purchaseHistoryDatabase;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __47__SSAppPurchaseHistoryCache_allUncachedImages___block_invoke;
    v8[3] = &unk_1E47C0050;
    v8[4] = self;
    v9 = v4;
    v10 = v5;
    -[SSAppPurchaseHistoryDatabase readUsingTransactionBlock:](purchaseHistoryDatabase, "readUsingTransactionBlock:", v8);

  }
  return v5;
}

uint64_t __47__SSAppPurchaseHistoryCache_allUncachedImages___block_invoke(uint64_t a1, void *a2)
{
  double v3;
  void *v4;
  void *v5;
  uint64_t v6;
  __CFString *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  void *context;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v34 = a2;
  v33 = (void *)MEMORY[0x1A8585BF8]();
  objc_msgSend(MEMORY[0x1E0C99D68], "timeIntervalSinceReferenceDate");
  v30 = (uint64_t)v3;
  +[SSAppPurchaseHistoryEntry databaseTable](SSAppPurchaseHistoryEntry, "databaseTable");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[SSAppImageDatabaseCacheEntry databaseTable](SSAppImageDatabaseCacheEntry, "databaseTable");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)MEMORY[0x1E0CB3940];
  v6 = SSDatabaseCacheEntryLookupKey;
  v7 = SSDatabaseCacheEntryDataBlobSize;
  v8 = SSDatabaseCacheEntryDateExpired;
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "uniqueIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "stringWithFormat:", CFSTR("SELECT %@.%@,%@.%@,%@.%@,%@.%@,%@.%@,%@.%@,%@.%@ FROM %@ LEFT OUTER JOIN %@ ON %@.%@ = %@.%@ WHERE (%@.%@ IS NULL OR %@.%@ <= %lld) AND (%@ = %@)"), v4, CFSTR("store_id"), v4, CFSTR("bundle_id"), v4, CFSTR("icon_url"), v4, CFSTR("icon_token"), v4, CFSTR("oval_icon_url"), v4, CFSTR("oval_icon_token"), v4, CFSTR("pid"), v4, v5,
    v4,
    CFSTR("store_id"),
    v5,
    v6,
    v5,
    v7,
    v5,
    v8,
    v30,
    CFSTR("account_unique_identifier"),
    v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(a1 + 40), "count"))
  {
    v11 = (void *)MEMORY[0x1A8585BF8]();
    v12 = objc_msgSend(*(id *)(a1 + 40), "count");
    v13 = objc_alloc(MEMORY[0x1E0CB3940]);
    v14 = v13;
    if (v12 < 2)
    {
      objc_msgSend(*(id *)(a1 + 40), "lastObject");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = (void *)objc_msgSend(v14, "initWithFormat:", CFSTR(" AND %@.%@ = \"%@\" "), v4, CFSTR("store_id"), v24);

      objc_msgSend(v10, "stringByAppendingString:", v25);
      v23 = objc_claimAutoreleasedReturnValue();

    }
    else
    {
      context = v11;
      v15 = (void *)objc_msgSend(v13, "initWithFormat:", CFSTR(" AND (%@.%@ IN (\"XX\"), v4, CFSTR("store_id"));
      v38 = 0u;
      v39 = 0u;
      v40 = 0u;
      v41 = 0u;
      v31 = a1;
      v16 = *(id *)(a1 + 40);
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      if (v17)
      {
        v18 = v17;
        v19 = *(_QWORD *)v39;
        do
        {
          v20 = 0;
          v21 = v15;
          do
          {
            if (*(_QWORD *)v39 != v19)
              objc_enumerationMutation(v16);
            v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%@,\"%@\"), v21, *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v20));

            ++v20;
            v21 = v15;
          }
          while (v18 != v20);
          v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
        }
        while (v18);
      }

      objc_msgSend(v15, "stringByAppendingString:", CFSTR("))"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByAppendingString:", v22);
      v23 = objc_claimAutoreleasedReturnValue();

      a1 = v31;
      v11 = context;
    }
    objc_autoreleasePoolPop(v11);
    v10 = (void *)v23;
  }
  objc_msgSend(v34, "database");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __47__SSAppPurchaseHistoryCache_allUncachedImages___block_invoke_2;
  v35[3] = &unk_1E47C0028;
  v36 = v26;
  v37 = *(id *)(a1 + 48);
  v27 = v26;
  objc_msgSend(v27, "prepareStatementForSQL:cache:usingBlock:", v10, 0, v35);

  objc_autoreleasePoolPop(v33);
  return 1;
}

uint64_t __47__SSAppPurchaseHistoryCache_allUncachedImages___block_invoke_2(uint64_t a1, sqlite3_stmt *a2)
{
  uint64_t result;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;

  result = objc_msgSend(*(id *)(a1 + 32), "statementHasRowAfterStepping:", a2);
  if ((_DWORD)result)
  {
    do
    {
      v5 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 0);
      v6 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 1);
      v7 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 2);
      v8 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 3);
      v9 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 4);
      v10 = (void *)SSSQLiteCopyFoundationValueForStatementColumn(a2, 5);
      v11 = SSSQLiteCopyFoundationValueForStatementColumn(a2, 6);
      v12 = (void *)v11;
      if (v5 && v7 && v8 && v6)
      {
        if (v11)
        {
          v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithObjectsAndKeys:", v5, CFSTR("store_id"), v6, CFSTR("bundle_id"), v7, CFSTR("icon_url"), v8, CFSTR("icon_token"), v9, CFSTR("oval_icon_url"), v10, CFSTR("oval_icon_token"), v11, CFSTR("pid"), 0);
          objc_msgSend(*(id *)(a1 + 40), "addObject:", v13);

        }
      }

      result = objc_msgSend(*(id *)(a1 + 32), "statementHasRowAfterStepping:", a2);
    }
    while ((result & 1) != 0);
  }
  return result;
}

- (id)allUncachedImages
{
  return -[SSAppPurchaseHistoryCache allUncachedImages:](self, "allUncachedImages:", 0);
}

- (void)clearCacheForAdamID:(id)a3
{
  SSDatabaseCache *databaseCache;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "unsignedLongLongValue"))
  {
    databaseCache = self->_databaseCache;
    objc_msgSend(v6, "stringValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSDatabaseCache clearCacheForLookupKey:](databaseCache, "clearCacheForLookupKey:", v5);

  }
}

- (BOOL)setImageData:(id)a3 forAdamID:(id)a4 imageToken:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  SSDatabaseCache *databaseCache;
  void *v16;
  void *v17;
  BOOL v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (self->_account)
  {
    v11 = (void *)MEMORY[0x1A8585BF8]();
    if (objc_msgSend(v8, "length") && objc_msgSend(v9, "unsignedLongLongValue"))
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "timeIntervalSinceReferenceDate");
      v14 = v13;

      databaseCache = self->_databaseCache;
      objc_msgSend(v9, "stringValue");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[SSDatabaseCache setData:expiring:retiring:lookupKey:userInfo:](databaseCache, "setData:expiring:retiring:lookupKey:userInfo:", v8, v16, v10, v14, v14);
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      v18 = v17 != 0;
    }
    else
    {
      v18 = 0;
    }
    objc_autoreleasePoolPop(v11);
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

- (id)imageDataForAdamID:(id)a3
{
  id v4;
  void *v5;
  SSDatabaseCache *databaseCache;
  void *v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = (void *)MEMORY[0x1A8585BF8]();
  if (objc_msgSend(v4, "unsignedLongLongValue"))
  {
    databaseCache = self->_databaseCache;
    objc_msgSend(v4, "stringValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SSDatabaseCache cacheEntryForLookupKey:](databaseCache, "cacheEntryForLookupKey:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "dataBlob:", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  objc_autoreleasePoolPop(v5);

  return v9;
}

- (unint64_t)purgeableSpace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;

  v3 = (void *)MEMORY[0x1A8585BF8](self, a2);
  -[SSDatabaseCache statistics](self->_databaseCache, "statistics");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", CFSTR("total"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("bytes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedLongLongValue");

  objc_autoreleasePoolPop(v3);
  return v7;
}

- (unint64_t)purge:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;

  if (!a3)
    return 0;
  v4 = (void *)MEMORY[0x1A8585BF8](self, a2);
  -[SSDatabaseCache statistics](self->_databaseCache, "statistics");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKey:", CFSTR("total"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("bytes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedLongLongValue");
  -[SSDatabaseCache clear](self->_databaseCache, "clear");

  objc_autoreleasePoolPop(v4);
  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purchaseHistoryDatabase, 0);
  objc_storeStrong((id *)&self->_databaseCache, 0);
  objc_storeStrong((id *)&self->_account, 0);
}

@end
