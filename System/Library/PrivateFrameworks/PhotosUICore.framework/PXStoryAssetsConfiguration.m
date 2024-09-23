@implementation PXStoryAssetsConfiguration

- (PXStoryAssetsConfiguration)initWithKeyAsset:(id)a3 curatedAssets:(id)a4 allAssets:(id)a5
{
  id v9;
  id v10;
  id v11;
  PXStoryAssetsConfiguration *v12;
  PXStoryAssetsConfiguration *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)PXStoryAssetsConfiguration;
  v12 = -[PXStoryAssetsConfiguration init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_keyAsset, a3);
    objc_storeStrong((id *)&v13->_curatedAssets, a4);
    objc_storeStrong((id *)&v13->_allAssets, a5);
  }

  return v13;
}

- (PXStoryAssetsConfiguration)init
{
  return -[PXStoryAssetsConfiguration initWithKeyAsset:curatedAssets:allAssets:](self, "initWithKeyAsset:curatedAssets:allAssets:", 0, 0, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  int v8;
  char v9;
  id v10;
  id v11;
  int v12;
  void *v13;
  void *v14;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    -[PXStoryAssetsConfiguration keyAsset](self, "keyAsset");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "keyAsset");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v7)
    {

    }
    else
    {
      v8 = objc_msgSend(v6, "isEqual:", v7);

      if (!v8)
      {
        v9 = 0;
LABEL_16:

        goto LABEL_17;
      }
    }
    -[PXStoryAssetsConfiguration curatedAssets](self, "curatedAssets");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "curatedAssets");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    if (v10 == v11)
    {

    }
    else
    {
      v12 = objc_msgSend(v10, "isEqual:", v11);

      if (!v12)
      {
        v9 = 0;
LABEL_15:

        goto LABEL_16;
      }
    }
    -[PXStoryAssetsConfiguration allAssets](self, "allAssets");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "allAssets");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13 == v14)
      v9 = 1;
    else
      v9 = objc_msgSend(v13, "isEqual:", v14);

    goto LABEL_15;
  }
  v9 = 0;
LABEL_17:

  return v9;
}

- (unint64_t)hash
{
  void *v3;
  uint64_t v4;
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;

  -[PXStoryAssetsConfiguration keyAsset](self, "keyAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "hash");
  -[PXStoryAssetsConfiguration curatedAssets](self, "curatedAssets");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "hash") ^ v4;
  -[PXStoryAssetsConfiguration allAssets](self, "allAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v6 ^ objc_msgSend(v7, "hash");

  return v8;
}

- (id)description
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;

  v3 = objc_alloc(MEMORY[0x1E0CB3940]);
  v4 = objc_opt_class();
  -[PXStoryAssetsConfiguration keyAsset](self, "keyAsset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXStoryAssetsConfiguration curatedAssets](self, "curatedAssets");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  -[PXStoryAssetsConfiguration allAssets](self, "allAssets");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<%@ %p; key: %@; curated count: %ld; all count: %ld>"),
                  v4,
                  self,
                  v6,
                  v8,
                  objc_msgSend(v9, "count"));

  return v10;
}

- (PXDisplayAssetFetchResult)keyAsset
{
  return self->_keyAsset;
}

- (PXDisplayAssetFetchResult)curatedAssets
{
  return self->_curatedAssets;
}

- (PXDisplayAssetFetchResult)allAssets
{
  return self->_allAssets;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allAssets, 0);
  objc_storeStrong((id *)&self->_curatedAssets, 0);
  objc_storeStrong((id *)&self->_keyAsset, 0);
}

@end
