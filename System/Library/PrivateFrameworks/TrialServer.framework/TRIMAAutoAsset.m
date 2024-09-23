@implementation TRIMAAutoAsset

- (TRIMAAutoAsset)initWithAssetId:(id)a3 decryptionKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  TRIMAAutoAsset *v10;
  TRIMAAutoAsset *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  MAAutoAssetSelector *assetSelector;
  uint64_t v20;
  id v21;
  id v22;
  MAAutoAsset *autoAsset;
  TRIMAAutoAsset *v24;
  id v26;
  objc_super v27;

  v8 = a3;
  v9 = a4;
  v27.receiver = self;
  v27.super_class = (Class)TRIMAAutoAsset;
  v10 = -[TRIMAAutoAsset init](&v27, sel_init);
  v11 = v10;
  if (!v10)
    goto LABEL_4;
  -[TRIMAAutoAsset setAssetId:](v10, "setAssetId:", v8);
  v12 = objc_alloc(MEMORY[0x1E0D4E078]);
  objc_msgSend(v8, "type");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "specifier");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "version");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (void *)objc_msgSend(v12, "initForAssetType:withAssetSpecifier:matchingAssetVersion:usingDecryptionKey:", v13, v14, v15, v9);
  -[TRIMAAutoAsset setAssetSelector:](v11, "setAssetSelector:", v16);

  v17 = objc_alloc(MEMORY[0x1E0D4E060]);
  v18 = *MEMORY[0x1E0DC0E50];
  assetSelector = v11->assetSelector;
  v26 = 0;
  v20 = objc_msgSend(v17, "initForClientName:selectingAsset:error:", v18, assetSelector, &v26);
  v21 = v26;
  v22 = v26;
  autoAsset = v11->_autoAsset;
  v11->_autoAsset = (MAAutoAsset *)v20;

  if (v11->_autoAsset)
  {

LABEL_4:
    v24 = v11;
    goto LABEL_8;
  }
  if (a5)
    objc_storeStrong(a5, v21);

  v24 = 0;
LABEL_8:

  return v24;
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 completion:(id)a6
{
  -[MAAutoAsset lockContent:withUsagePolicy:withTimeout:completion:](self->_autoAsset, "lockContent:withUsagePolicy:withTimeout:completion:", a3, a4, a5, a6);
}

- (void)lockContent:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 reportingProgress:(id)a6 completion:(id)a7
{
  -[MAAutoAsset lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:](self->_autoAsset, "lockContent:withUsagePolicy:withTimeout:reportingProgress:completion:", a3, a4, a5, a6, a7);
}

- (id)lockContentSync:(id)a3 withUsagePolicy:(id)a4 withTimeout:(int64_t)a5 lockedAssetSelector:(id *)a6 newerInProgress:(id *)a7 error:(id *)a8
{
  return (id)-[MAAutoAsset lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:](self->_autoAsset, "lockContentSync:withUsagePolicy:withTimeout:lockedAssetSelector:newerInProgress:error:", a3, a4, a5, a6, a7, a8);
}

- (id)determineIfAvailableSync:(id)a3 withTimeout:(int64_t)a4 discoveredAttributes:(id *)a5 error:(id *)a6
{
  return (id)-[MAAutoAsset determineIfAvailableSync:withTimeout:discoveredAttributes:error:](self->_autoAsset, "determineIfAvailableSync:withTimeout:discoveredAttributes:error:", a3, a4, a5, a6);
}

- (id)endLockUsageSync:(id)a3
{
  return (id)-[MAAutoAsset endLockUsageSync:](self->_autoAsset, "endLockUsageSync:", a3);
}

- (id)currentLocksSync:(id *)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;

  v5 = (void *)objc_opt_new();
  -[MAAutoAsset currentStatusSync:](self->_autoAsset, "currentStatusSync:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "currentLockUsage");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = (void *)v8;
    if (v8)
      v10 = (void *)v8;
    else
      v10 = v5;
    v11 = v10;

  }
  else
  {
    v11 = v5;
  }

  return v11;
}

- (id)currentAssetSizeOnDiskUsingStatus:(id *)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MAAutoAsset currentStatusSync:](self->_autoAsset, "currentStatusSync:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "availableForUseAttributes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "valueForKey:", CFSTR("_UnarchivedSize"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (NSString)description
{
  return (NSString *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("<TRIMAAutoAsset | selector:%@ autoAsset:%@>"), self->assetSelector, self->_autoAsset);
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
  objc_storeStrong((id *)&self->_autoAsset, 0);
}

@end
