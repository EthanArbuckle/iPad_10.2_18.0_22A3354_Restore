@implementation TRISQLiteMAAutoAsset

- (TRISQLiteMAAutoAsset)initWithAssetId:(id)a3 decryptionKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  TRISQLiteMAAutoAsset *v10;
  TRISQLiteMAAutoAsset *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  MAAutoAssetSelector *assetSelector;
  objc_super v19;

  v8 = a3;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)TRISQLiteMAAutoAsset;
  v10 = -[TRISQLiteMAAutoAsset init](&v19, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->assetId, a3);
    v12 = objc_alloc(MEMORY[0x1E0D4E078]);
    objc_msgSend(v8, "type");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "specifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "version");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:", v13, v14, v15, v9);
    assetSelector = v11->assetSelector;
    v11->assetSelector = (MAAutoAssetSelector *)v16;

  }
  return v11;
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
  -[TRISQLiteMAAutoAsset lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:](self, "lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:", a3, a4, a5, 0, a6);
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  void (**v11)(id, MAAutoAssetSelector *, BOOL, void *, id, id);
  void *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;

  v17 = 0;
  v18 = 0;
  v16 = 0;
  v11 = (void (**)(id, MAAutoAssetSelector *, BOOL, void *, id, id))a7;
  -[TRISQLiteMAAutoAsset lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:](self, "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:", a3, a4, a5, &v18, &v17, &v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v18;
  v14 = v17;
  v15 = v16;
  v11[2](v11, self->assetSelector, v12 != 0, v12, v14, v15);

}

- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8
{
  id v14;
  id v15;
  void *v16;
  void *v17;

  v14 = a4;
  v15 = a3;
  -[TRISQLiteMAAutoAsset _sqliteMADatabase](self, "_sqliteMADatabase");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "lockContentSync:forAssetSelector:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:", v15, self->assetSelector, v14, a5, a6, a7, a8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (id)determineIfAvailableSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  -[TRISQLiteMAAutoAsset _sqliteMADatabase](self, "_sqliteMADatabase", a3, a4, a5, a6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "assetSizeForSelector:", self->assetSelector);

  if (a5)
  {
    v14 = *MEMORY[0x1E0D4DEF8];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_retainAutorelease(v11);
    *a5 = v12;

  }
  return self->assetSelector;
}

- (id)currentLocksSync:(id *)a3
{
  void *v4;
  void *v5;

  -[TRISQLiteMAAutoAsset _sqliteMADatabase](self, "_sqliteMADatabase", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "locksForSelector:", self->assetSelector);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)endLockUsageSync:(id)a3
{
  id v4;
  void *v5;

  if (a3)
  {
    v4 = a3;
    -[TRISQLiteMAAutoAsset _sqliteMADatabase](self, "_sqliteMADatabase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "endAllPreviousLocksOfReasonSync:forAssetSelector:", v4, self->assetSelector);

  }
  return 0;
}

- (id)currentAssetSizeOnDiskUsingStatus:(id *)a3
{
  void *v4;
  void *v5;
  void *v6;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  -[TRISQLiteMAAutoAsset _sqliteMADatabase](self, "_sqliteMADatabase", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "numberWithLong:", objc_msgSend(v5, "assetSizeForSelector:", self->assetSelector));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_sqliteMADatabase
{
  TRISQLiteMADatabase *db;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TRISQLiteMADatabase *v10;
  TRISQLiteMADatabase *v11;
  void *v13;

  db = self->_db;
  if (!db)
  {
    if (sqliteMADatabasePaths)
    {
      v5 = (id)sqliteMADatabasePaths;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC0B78], "sharedSystemPaths");
      v5 = (id)objc_claimAutoreleasedReturnValue();
    }
    v6 = v5;
    objc_msgSend(v5, "trialRootDir");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("MASQLiteMock"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("Database"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[TRISQLiteMADatabase initWithParentDir:]([TRISQLiteMADatabase alloc], "initWithParentDir:", v9);
    if (!v10)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("TRIMAProviding.m"), 139, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[[TRISQLiteMADatabase alloc] initWithParentDir:parentDir]"));

    }
    v11 = self->_db;
    self->_db = v10;

    db = self->_db;
  }
  return db;
}

- (NSString)description
{
  id v3;
  TRIFullMAAssetId *assetId;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  assetId = self->assetId;
  if (!assetId)
    assetId = (TRIFullMAAssetId *)CFSTR("no asset id");
  return (NSString *)(id)objc_msgSend(v3, "initWithFormat:", CFSTR("<TRISQLiteMAAutoAsset | id:%@>"), assetId);
}

+ (void)setPaths:(id)a3
{
  objc_storeStrong((id *)&sqliteMADatabasePaths, a3);
}

- (TRIFullMAAssetId)assetId
{
  return self->assetId;
}

- (void)setAssetId:(id)a3
{
  objc_storeStrong((id *)&self->assetId, a3);
}

- (MAAutoAssetSelector)assetSelector
{
  return self->assetSelector;
}

- (void)setAssetSelector:(id)a3
{
  objc_storeStrong((id *)&self->assetSelector, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->assetSelector, 0);
  objc_storeStrong((id *)&self->assetId, 0);
  objc_storeStrong((id *)&self->_db, 0);
}

@end
