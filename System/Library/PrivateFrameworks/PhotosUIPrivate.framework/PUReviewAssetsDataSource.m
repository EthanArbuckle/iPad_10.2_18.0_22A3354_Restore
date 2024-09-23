@implementation PUReviewAssetsDataSource

- (PUReviewAssetsDataSource)initWithAssetsByIdentifier:(id)a3 usingOrdering:(id)a4 inAssetCollection:(id)a5
{
  id v8;
  id v9;
  id v10;
  PUReviewAssetsDataSource *v11;
  uint64_t v12;
  NSDictionary *assetsByIdentifier;
  uint64_t v14;
  NSArray *assetIdentifiers;
  PUReviewAssetsDataSource *v16;
  objc_super v18;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v18.receiver = self;
  v18.super_class = (Class)PUReviewAssetsDataSource;
  v11 = -[PUTilingDataSource init](&v18, sel_init);
  if (v11)
  {
    v12 = objc_msgSend(v8, "copy");
    assetsByIdentifier = v11->__assetsByIdentifier;
    v11->__assetsByIdentifier = (NSDictionary *)v12;

    v14 = objc_msgSend(v9, "copy");
    assetIdentifiers = v11->__assetIdentifiers;
    v11->__assetIdentifiers = (NSArray *)v14;

    objc_storeStrong((id *)&v11->__reviewAssetCollection, a5);
    v16 = v11;
  }

  return v11;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  int64_t v8;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (v6 == 1)
  {
    -[PUReviewAssetsDataSource _assetIdentifiers](self, "_assetIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
  }
  else if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUReviewAssetsDataSource.m"), 57, CFSTR("invalid indexPath %@"), v5);
    v8 = 0;
  }
  else
  {
    -[PUReviewAssetsDataSource _assetIdentifiers](self, "_assetIdentifiers");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count") != 0;
  }

  return v8;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  PUAssetReference *v10;
  void *v11;
  PUAssetReference *v12;

  v4 = a3;
  -[PUReviewAssetsDataSource _assetIdentifiers](self, "_assetIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAssetsDataSource _assetsByIdentifier](self, "_assetsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "item"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAssetsDataSource _reviewAssetCollection](self, "_reviewAssetCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [PUAssetReference alloc];
  -[PUTilingDataSource identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:](v10, "initWithAsset:assetCollection:indexPath:dataSourceIdentifier:", v8, v9, v4, v11);

  return v12;
}

- (id)indexPathForAssetReference:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  void *v11;

  v4 = a3;
  v5 = v4;
  if (v4
    && (objc_msgSend(v4, "dataSourceIdentifier"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        -[PUTilingDataSource identifier](self, "identifier"),
        v7 = (void *)objc_claimAutoreleasedReturnValue(),
        v8 = objc_msgSend(v6, "isEqual:", v7),
        v7,
        v6,
        !v8))
  {
    objc_msgSend(v5, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUReviewAssetsDataSource indexPathForAssetWithIdentifier:](self, "indexPathForAssetWithIdentifier:", v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "indexPath");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v9;
}

- (id)indexPathForAssetWithIdentifier:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  -[PUReviewAssetsDataSource _assetIdentifiers](self, "_assetIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)indexPathForAssetCollection:(id)a3
{
  id v4;
  id v5;
  void *v6;

  v4 = a3;
  -[PUReviewAssetsDataSource _reviewAssetCollection](self, "_reviewAssetCollection");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _BOOL4 v16;
  _BOOL4 v17;
  BOOL v18;
  uint64_t v19;
  unint64_t v20;
  uint64_t v21;
  PUBadgeInfoPromise *v22;
  _QWORD v24[4];

  v4 = a3;
  -[PUReviewAssetsDataSource _assetIdentifiers](self, "_assetIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAssetsDataSource _assetsByIdentifier](self, "_assetsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isHDR");
  v11 = objc_msgSend(v9, "canPlayPhotoIris");
  objc_msgSend(v9, "burstIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v9, "numberOfRepresentedAssets");
  v14 = *(_QWORD *)(MEMORY[0x1E0D7CE00] + 8);
  v15 = *(_QWORD *)(MEMORY[0x1E0D7CE00] + 24);
  v16 = v12 != 0;
  v17 = v13 > 1;
  v18 = !v16 || !v17;
  if (v16 && v17)
    v19 = *MEMORY[0x1E0D7CE00] | 8;
  else
    v19 = *MEMORY[0x1E0D7CE00];
  if (v18)
    v20 = *(_QWORD *)(MEMORY[0x1E0D7CE00] + 16);
  else
    v20 = v13;
  if (v11)
    v19 |= 0x40uLL;
  if (v10)
    v21 = v19 | 4;
  else
    v21 = v19;
  v24[0] = ((unint64_t)objc_msgSend(v9, "mediaSubtypes") >> 10) & 0x400 | v21;
  v24[1] = v14;
  v24[2] = v20;
  v24[3] = v15;
  v22 = -[PUBadgeInfoPromise initWithBadgeInfo:]([PUBadgeInfoPromise alloc], "initWithBadgeInfo:", v24);

  return v22;
}

- (id)assetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  -[PUReviewAssetsDataSource _assetIdentifiers](self, "_assetIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAssetsDataSource _assetsByIdentifier](self, "_assetsByIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "item");

  objc_msgSend(v5, "objectAtIndex:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)assetReferenceForAssetReference:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PUAssetReference *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  PUAssetReference *v13;
  void *v14;
  void *v15;

  objc_msgSend(a3, "asset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUReviewAssetsDataSource _assetIdentifiers](self, "_assetIdentifiers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "indexOfObject:", v5);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    v9 = v7;
    -[PUReviewAssetsDataSource _assetsByIdentifier](self, "_assetsByIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "objectForKey:", v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v9, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = [PUAssetReference alloc];
    -[PUReviewAssetsDataSource _reviewAssetCollection](self, "_reviewAssetCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTilingDataSource identifier](self, "identifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:](v13, "initWithAsset:assetCollection:indexPath:dataSourceIdentifier:", v11, v14, v12, v15);

  }
  return v8;
}

- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  objc_super v13;

  v6 = a4;
  v7 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v6, "_identifierAtIndexPath:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[PUReviewAssetsDataSource _assetIdentifiers](self, "_assetIdentifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "indexOfObject:", v8);
      if (v10 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v11 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v10, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v13.receiver = self;
    v13.super_class = (Class)PUReviewAssetsDataSource;
    -[PUAssetsDataSource convertIndexPath:fromAssetsDataSource:](&v13, sel_convertIndexPath_fromAssetsDataSource_, v7, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v11;
}

- (id)startingAssetReference
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;

  -[PUReviewAssetsDataSource _assetIdentifiers](self, "_assetIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForItem:inSection:", v4 - 1, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUReviewAssetsDataSource assetReferenceAtIndexPath:](self, "assetReferenceAtIndexPath:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isEmpty
{
  void *v2;
  BOOL v3;

  -[PUReviewAssetsDataSource _assetIdentifiers](self, "_assetIdentifiers");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") == 0;

  return v3;
}

- (id)_identifierAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;

  v4 = a3;
  -[PUReviewAssetsDataSource _assetIdentifiers](self, "_assetIdentifiers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "item");

  if (v6 >= objc_msgSend(v5, "count") - 1)
  {
    v7 = 0;
  }
  else
  {
    objc_msgSend(v5, "objectAtIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (PUDisplayAssetCollection)_reviewAssetCollection
{
  return self->__reviewAssetCollection;
}

- (NSDictionary)_assetsByIdentifier
{
  return self->__assetsByIdentifier;
}

- (NSArray)_assetIdentifiers
{
  return self->__assetIdentifiers;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__assetIdentifiers, 0);
  objc_storeStrong((id *)&self->__assetsByIdentifier, 0);
  objc_storeStrong((id *)&self->__reviewAssetCollection, 0);
}

@end
