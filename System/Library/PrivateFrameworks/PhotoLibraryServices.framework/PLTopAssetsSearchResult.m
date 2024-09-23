@implementation PLTopAssetsSearchResult

- (PLTopAssetsSearchResult)initWithTopAssetsResult:(id)a3
{
  id v5;
  PLTopAssetsSearchResult *v6;
  PLTopAssetsSearchResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLTopAssetsSearchResult;
  v6 = -[PLTopAssetsSearchResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_topAssetsResults, a3);

  return v7;
}

- (PLTopAssetsSearchResult)initWithAssetUUIDs:(id)a3
{
  id v5;
  PLTopAssetsSearchResult *v6;
  PLTopAssetsSearchResult *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PLTopAssetsSearchResult;
  v6 = -[PLTopAssetsSearchResult init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_assetUUIDsV2, a3);

  return v7;
}

- (unint64_t)assetCount
{
  void *v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;

  -[PLTopAssetsSearchResult assetUUIDsV2](self, "assetUUIDsV2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[PLTopAssetsSearchResult assetUUIDsV2](self, "assetUUIDsV2");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
  }
  else
  {
    -[PLTopAssetsSearchResult topAssetsResults](self, "topAssetsResults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "assetMatchCount");
  }
  v6 = v5;

  return v6;
}

- (NSArray)assetUUIDs
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  unint64_t Count;
  dispatch_block_t v10;
  void *v11;
  void *v12;

  -[PLTopAssetsSearchResult assetUUIDsV2](self, "assetUUIDsV2");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[PLTopAssetsSearchResult assetUUIDsV2](self, "assetUUIDsV2");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[PLTopAssetsSearchResult topAssetsResults](self, "topAssetsResults");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "assetUUIDs");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "count");
    -[PLTopAssetsSearchResult topAssetsResults](self, "topAssetsResults");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    Count = CFArrayGetCount((CFArrayRef)objc_msgSend(v8, "assetIds"));

    if (v7 < Count)
    {
      v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &__block_literal_global_58013);
      -[PLTopAssetsSearchResult topAssetsResults](self, "topAssetsResults");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "fetchAssetUUIDsWithCompletionHandler:", v10);

      dispatch_block_wait(v10, 0xFFFFFFFFFFFFFFFFLL);
    }
    -[PLTopAssetsSearchResult topAssetsResults](self, "topAssetsResults");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "assetUUIDs");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSArray *)v4;
}

- (NSArray)assetUUIDsV2
{
  return self->_assetUUIDsV2;
}

- (PSITopAssetsResult)topAssetsResults
{
  return self->_topAssetsResults;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_topAssetsResults, 0);
  objc_storeStrong((id *)&self->_assetUUIDsV2, 0);
}

@end
