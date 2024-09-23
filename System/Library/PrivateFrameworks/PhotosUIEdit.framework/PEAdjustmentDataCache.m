@implementation PEAdjustmentDataCache

+ (void)initialize
{
  id v2;
  void *v3;

  if ((id)objc_opt_class() == a1)
  {
    v2 = objc_alloc_init(MEMORY[0x24BDBCE40]);
    v3 = (void *)sCache;
    sCache = (uint64_t)v2;

    objc_msgSend((id)sCache, "setCountLimit:", 30);
  }
}

+ (void)requestCompositionControllerForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 queue:(id)a5 completion:(id)a6
{
  _BOOL8 v8;
  id v9;
  id v10;
  id v11;
  PEAdjustmentDataCacheKey *v12;
  PEAdjustmentDataCacheEntry *v13;
  id v14;
  _QWORD v15[4];
  id v16;

  v8 = a4;
  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = -[PEAdjustmentDataCacheKey initWithAsset:originalAdjustmentData:]([PEAdjustmentDataCacheKey alloc], "initWithAsset:originalAdjustmentData:", v9, 0);
  objc_msgSend((id)sCache, "objectForKey:", v12);
  v13 = (PEAdjustmentDataCacheEntry *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    v13 = -[PEAdjustmentDataCacheEntry initWithAsset:networkAccessAllowed:originalAdjustmentData:]([PEAdjustmentDataCacheEntry alloc], "initWithAsset:networkAccessAllowed:originalAdjustmentData:", v9, v8, 0);
    objc_msgSend((id)sCache, "setObject:forKey:", v13, v12);
  }
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __100__PEAdjustmentDataCache_requestCompositionControllerForAsset_networkAccessAllowed_queue_completion___block_invoke;
  v15[3] = &unk_24C6188B0;
  v16 = v11;
  v14 = v11;
  -[PEAdjustmentDataCacheEntry deliverOn:completion:](v13, "deliverOn:completion:", v10, v15);

}

+ (id)compositionControllerForAssetIfLoaded:(id)a3 disposition:(int64_t *)a4
{
  id v5;
  PEAdjustmentDataCacheKey *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;

  v5 = a3;
  v6 = -[PEAdjustmentDataCacheKey initWithAsset:originalAdjustmentData:]([PEAdjustmentDataCacheKey alloc], "initWithAsset:originalAdjustmentData:", v5, 0);
  objc_msgSend((id)sCache, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (a4)
  {
    if (v7)
      v9 = objc_msgSend(v7, "disposition");
    else
      v9 = objc_msgSend(v5, "hasAdjustments") ^ 1;
    *a4 = v9;
  }
  objc_msgSend(v8, "compositionController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)synchronousCompositionControllerForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 disposition:(int64_t *)a5 originalComposition:(BOOL)a6
{
  void *v6;
  void *v7;

  +[PEAdjustmentDataCache entryForAsset:networkAccessAllowed:disposition:originalAdjustmentData:](PEAdjustmentDataCache, "entryForAsset:networkAccessAllowed:disposition:originalAdjustmentData:", a3, a4, a5, a6);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "compositionController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)synchronousEditorBundleIDForAsset:(id)a3
{
  void *v3;
  void *v4;
  uint64_t v6;

  v6 = 0;
  +[PEAdjustmentDataCache entryForAsset:networkAccessAllowed:disposition:originalAdjustmentData:](PEAdjustmentDataCache, "entryForAsset:networkAccessAllowed:disposition:originalAdjustmentData:", a3, 0, &v6, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "editorBundleID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (CGSize)synchronousInputSizeForAsset:(id)a3 disposition:(int64_t *)a4
{
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  +[PEAdjustmentDataCache entryForAsset:networkAccessAllowed:disposition:originalAdjustmentData:](PEAdjustmentDataCache, "entryForAsset:networkAccessAllowed:disposition:originalAdjustmentData:", a3, 1, a4, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "inputSize");
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

+ (id)entryForAsset:(id)a3 networkAccessAllowed:(BOOL)a4 disposition:(int64_t *)a5 originalAdjustmentData:(BOOL)a6
{
  _BOOL8 v6;
  _BOOL8 v8;
  id v9;
  PEAdjustmentDataCacheKey *v10;
  PEAdjustmentDataCacheEntry *v11;
  int64_t v12;

  v6 = a6;
  v8 = a4;
  v9 = a3;
  v10 = -[PEAdjustmentDataCacheKey initWithAsset:originalAdjustmentData:]([PEAdjustmentDataCacheKey alloc], "initWithAsset:originalAdjustmentData:", v9, v6);
  objc_msgSend((id)sCache, "objectForKey:", v10);
  v11 = (PEAdjustmentDataCacheEntry *)objc_claimAutoreleasedReturnValue();
  if (!v11)
  {
    v11 = -[PEAdjustmentDataCacheEntry initWithAsset:networkAccessAllowed:originalAdjustmentData:]([PEAdjustmentDataCacheEntry alloc], "initWithAsset:networkAccessAllowed:originalAdjustmentData:", v9, v8, v6);
    objc_msgSend((id)sCache, "setObject:forKey:", v11, v10);
  }
  -[PEAdjustmentDataCacheEntry waitForResultsWithTimeout](v11, "waitForResultsWithTimeout");
  if (a5)
  {
    if (v11)
      v12 = -[PEAdjustmentDataCacheEntry disposition](v11, "disposition");
    else
      v12 = objc_msgSend(v9, "hasAdjustments") ^ 1;
    *a5 = v12;
  }

  return v11;
}

void __100__PEAdjustmentDataCache_requestCompositionControllerForAsset_networkAccessAllowed_queue_completion___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "compositionController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "disposition");

  (*(void (**)(uint64_t, id, uint64_t))(v2 + 16))(v2, v5, v4);
}

@end
