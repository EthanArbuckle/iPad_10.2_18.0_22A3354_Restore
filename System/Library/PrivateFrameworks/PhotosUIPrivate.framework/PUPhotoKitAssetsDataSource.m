@implementation PUPhotoKitAssetsDataSource

- (PUPhotoKitAssetsDataSource)initWithImmutablePhotosDataSource:(id)a3 withChange:(id)a4 fromDataSourceIdentifier:(id)a5
{
  id v10;
  id v11;
  id v12;
  PUPhotoKitAssetsDataSource *v13;
  NSCache *v14;
  NSCache *assetReferenceByIndexPathCache;
  void *v17;
  void *v18;
  objc_super v19;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (!v10)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetsDataSource.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("immutablePhotosDataSource != nil"));

  }
  v19.receiver = self;
  v19.super_class = (Class)PUPhotoKitAssetsDataSource;
  v13 = -[PUTilingDataSource init](&v19, sel_init);
  if (v13)
  {
    if ((objc_msgSend(v10, "options") & 4) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, v13, CFSTR("PUPhotoKitAssetsDataSource.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("([immutablePhotosDataSource options] & PXPhotosDataSourceOptionDisableChangeHandling) == PXPhotosDataSourceOptionDisableChangeHandling"));

    }
    objc_storeStrong((id *)&v13->_photosDataSource, a3);
    objc_storeStrong((id *)&v13->_change, a4);
    objc_storeStrong((id *)&v13->_changeFromDataSourceIdentifier, a5);
    v14 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    assetReferenceByIndexPathCache = v13->__assetReferenceByIndexPathCache;
    v13->__assetReferenceByIndexPathCache = v14;

  }
  return v13;
}

- (int64_t)numberOfSubItemsAtIndexPath:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  int64_t v9;

  v5 = a3;
  v6 = objc_msgSend(v5, "length");
  if (v6 == 1)
  {
    -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfItemsInSection:", objc_msgSend(v5, "section"));
  }
  else
  {
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetsDataSource.m"), 63, CFSTR("invalid indexPath %@"), v5);
      v9 = 0;
      goto LABEL_7;
    }
    -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "numberOfSections");
  }
  v9 = v8;
LABEL_7:

  return v9;
}

- (id)assetReferenceAtIndexPath:(id)a3
{
  id v5;
  PUAssetReference *v6;
  void *v7;
  void *v8;
  void *v9;
  PUAssetReference *v10;
  void *v11;
  void *v13;

  v5 = a3;
  if (objc_msgSend(v5, "length") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetsDataSource.m"), 72, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[indexPath length] == 2"));

  }
  -[NSCache objectForKey:](self->__assetReferenceByIndexPathCache, "objectForKey:", v5);
  v6 = (PUAssetReference *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetAtIndexPath:", v5);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "assetCollectionForSection:", objc_msgSend(v5, "section"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = [PUAssetReference alloc];
    -[PUTilingDataSource identifier](self, "identifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[PUAssetReference initWithAsset:assetCollection:indexPath:dataSourceIdentifier:](v10, "initWithAsset:assetCollection:indexPath:dataSourceIdentifier:", v8, v9, v5, v11);

    -[NSCache setObject:forKey:](self->__assetReferenceByIndexPathCache, "setObject:forKey:", v6, v5);
  }

  return v6;
}

- (id)indexPathForAssetReference:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  char isKindOfClass;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  objc_class *v46;
  void *v47;
  objc_class *v48;
  void *v49;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "dataSourceIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[PUTilingDataSource identifier](self, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "isEqual:", v8);

    if (!v9)
    {
      -[PUPhotoKitAssetsDataSource change](self, "change");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v11, "hasIncrementalChanges") & 1) != 0)
      {
        -[PUPhotoKitAssetsDataSource changeFromDataSourceIdentifier](self, "changeFromDataSourceIdentifier");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dataSourceIdentifier");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "isEqual:", v13);

        if (v14)
        {
          objc_msgSend(v6, "indexPath");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[PUPhotoKitAssetsDataSource change](self, "change");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "indexPathAfterApplyingIncrementalChangesToIndexPath:", v15);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          v18 = v17;
          v19 = v18;
          if (v18)
          {
            v20 = objc_msgSend(v18, "section");
            -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = objc_msgSend(v21, "numberOfSections");

            if (v20 >= v22)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              -[PUPhotoKitAssetsDataSource change](self, "change");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetsDataSource.m"), 122, CFSTR("Index path %@ converted using change %@ is invalid, section out of data source bounds: %@"), v15, v42, v19);

            }
            v23 = objc_msgSend(v19, "item");
            -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = objc_msgSend(v24, "numberOfItemsInSection:", objc_msgSend(v19, "section"));

            if (v23 >= v25)
            {
              objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              -[PUPhotoKitAssetsDataSource change](self, "change");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetsDataSource.m"), 123, CFSTR("Index path %@ converted using change %@ is invalid, outside section bounds: %@"), v15, v44, v19);

            }
            objc_msgSend(v6, "asset");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "assetAtIndexPath:", v19);
            v28 = (id)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v26, "isEqual:", v28) & 1) != 0)
            {
              v10 = v19;
LABEL_24:

LABEL_25:
              goto LABEL_26;
            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v37 = (id)objc_claimAutoreleasedReturnValue();
            -[PUPhotoKitAssetsDataSource change](self, "change");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetsDataSource.m"), 126, CFSTR("Index path %@ converted using change %@ is invalid:%@ asset does not match: %@!=%@"), v15, v39, v19, v26, v28);
            v10 = v19;
LABEL_36:

            goto LABEL_24;
          }
          objc_msgSend(v6, "asset");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_opt_respondsToSelector() & 1) == 0 || !objc_msgSend(v26, "isGuestAsset"))
          {
            v19 = 0;
            v10 = 0;
            goto LABEL_25;
          }
          v28 = v26;
          if (v28)
          {
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
            {
LABEL_31:
              v37 = v15;
              objc_msgSend(v28, "fetchPropertySetsIfNeeded");
              objc_msgSend(v28, "curationProperties");
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v38, "syndicationIdentifier");
              v39 = (void *)objc_claimAutoreleasedReturnValue();

              if (v39)
              {
                -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
                v40 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v40, "indexPathForAssetWithUUID:orSyndicationIdentifier:hintIndexPath:hintCollection:", 0, v39, v37, 0);
                v10 = (void *)objc_claimAutoreleasedReturnValue();

              }
              else
              {
                v10 = 0;
              }
              v26 = v28;
              goto LABEL_36;
            }
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v48 = (objc_class *)objc_opt_class();
            NSStringFromClass(v48);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v28, "px_descriptionForAssertionMessage");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetsDataSource.m"), 105, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("displayAsset"), v47, v49);

          }
          else
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (objc_class *)objc_opt_class();
            NSStringFromClass(v46);
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetsDataSource.m"), 105, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("displayAsset"), v47);
          }

          goto LABEL_31;
        }
      }
      else
      {

      }
      objc_msgSend(v6, "asset");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      isKindOfClass = objc_opt_isKindOfClass();

      if ((isKindOfClass & 1) != 0)
      {
        -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "asset");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "indexPath");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "assetCollection");
        v28 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "indexPathForAsset:hintIndexPath:hintCollection:", v19, v26, v28);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(v6, "asset");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "uuid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v32)
        {
          v10 = 0;
          goto LABEL_26;
        }
        objc_msgSend(v6, "asset");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "asset");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "uuid");
        v19 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_opt_respondsToSelector() & 1) != 0)
        {
          objc_msgSend(v15, "burstIdentifier");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v26 = 0;
        }
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v26 = 0;
        }
        -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v34, "indexPathForLastAsset");
        v28 = (id)objc_claimAutoreleasedReturnValue();

        -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v35, "indexPathForAssetWithUUID:orBurstIdentifier:hintIndexPath:hintCollection:", v19, v26, v28, 0);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      goto LABEL_24;
    }
  }
  objc_msgSend(v6, "indexPath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_26:

  return v10;
}

- (id)assetCollectionAtIndexPath:(id)a3
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v10;

  v5 = a3;
  if (objc_msgSend(v5, "length") != 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetsDataSource.m"), 148, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[indexPath length] == 1"));

  }
  v6 = objc_msgSend(v5, "indexAtPosition:", 0);
  -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "assetCollectionForSection:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)indexPathForAssetCollection:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (-[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "sectionForAssetCollection:", v4),
        v5,
        v6 != 0x7FFFFFFFFFFFFFFFLL))
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathWithIndex:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)convertIndexPath:(id)a3 fromAssetsDataSource:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || objc_msgSend(v6, "length") != 2)
    goto LABEL_8;
  v8 = v7;
  objc_msgSend(v8, "change");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "hasIncrementalChanges") & 1) == 0)
  {

    goto LABEL_7;
  }
  objc_msgSend(v8, "changeFromDataSourceIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PUTilingDataSource identifier](self, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v10, "isEqualToString:", v11);

  if ((v12 & 1) == 0)
  {
LABEL_7:

LABEL_8:
    v16.receiver = self;
    v16.super_class = (Class)PUPhotoKitAssetsDataSource;
    -[PUAssetsDataSource convertIndexPath:fromAssetsDataSource:](&v16, sel_convertIndexPath_fromAssetsDataSource_, v6, v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  objc_msgSend(v8, "change");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "indexPathAfterRevertingIncrementalChangeDetailsFromIndexPath:", v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
  return v14;
}

- (id)startingAssetReference
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "numberOfSections") < 1)
  {
    v5 = 0;
    v6 = 0;
  }
  else
  {
    objc_msgSend(v3, "assetCollectionForSection:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "keyAssetsAtEnd"))
      objc_msgSend(v3, "indexPathForLastAsset");
    else
      objc_msgSend(v3, "indexPathForFirstAsset");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      -[PUPhotoKitAssetsDataSource assetReferenceAtIndexPath:](self, "assetReferenceAtIndexPath:", v6);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v5 = 0;
    }
  }

  return v5;
}

- (id)badgeInfoPromiseForAssetAtIndexPath:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v13;

  v5 = a3;
  if (objc_msgSend(v5, "length") != 2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PUPhotoKitAssetsDataSource.m"), 208, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[indexPath length] == 2"));

  }
  -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "assetAtIndexPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v5, "section");

  objc_msgSend(v8, "assetCollectionForSection:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "badgeInfoPromiseForAsset:assetCollection:", v7, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (BOOL)isEmpty
{
  void *v2;
  char v3;

  -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEmpty");

  return v3;
}

- (int64_t)numberOfAssetsWithMaximum:(int64_t)a3
{
  int64_t v3;
  void *v5;
  char v6;
  void *v7;
  void *v8;
  int v9;
  objc_super v11;

  v3 = a3;
  if (a3)
  {
    if (a3 == 1)
    {
      -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v7, "isEmpty") ^ 1;

    }
    else if (a3 == 2)
    {
      -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "containsMultipleAssets");

      if ((v6 & 1) != 0)
      {
        return 2;
      }
      else
      {
        -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = objc_msgSend(v8, "isEmpty");

        return v9 ^ 1u;
      }
    }
    else
    {
      v11.receiver = self;
      v11.super_class = (Class)PUPhotoKitAssetsDataSource;
      return -[PUAssetsDataSource numberOfAssetsWithMaximum:](&v11, sel_numberOfAssetsWithMaximum_, a3);
    }
  }
  return v3;
}

- (BOOL)couldAssetReferenceAppear:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  char v8;
  void *v10;
  char v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;

  v4 = a3;
  -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v8 = 1;
LABEL_5:

    goto LABEL_6;
  }
  v7 = objc_msgSend(v5, "isEmpty");

  if ((v7 & 1) == 0)
  {
    objc_msgSend(v4, "asset");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "isCloudSharedAsset");

    v12 = objc_msgSend(v5, "numberOfSections");
    if (v12 < 1)
    {
      v8 = 0;
      goto LABEL_6;
    }
    v13 = v12;
    v6 = 0;
    v14 = 1;
    do
    {
      v15 = v6;
      objc_msgSend(v5, "assetCollectionForSection:", v14 - 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v8 = v11 ^ (objc_msgSend(v6, "assetCollectionSubtype") != 101);
      if ((v8 & 1) != 0)
        break;
    }
    while (v14++ < v13);
    goto LABEL_5;
  }
  v8 = 1;
LABEL_6:

  return v8;
}

- (id)assetAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[PUPhotoKitAssetsDataSource photosDataSource](self, "photosDataSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "assetAtIndexPath:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (PXPhotosDataSource)photosDataSource
{
  return self->_photosDataSource;
}

- (PXPhotosDataSourceChange)change
{
  return self->_change;
}

- (NSString)changeFromDataSourceIdentifier
{
  return self->_changeFromDataSourceIdentifier;
}

- (NSCache)_assetReferenceByIndexPathCache
{
  return self->__assetReferenceByIndexPathCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__assetReferenceByIndexPathCache, 0);
  objc_storeStrong((id *)&self->_changeFromDataSourceIdentifier, 0);
  objc_storeStrong((id *)&self->_change, 0);
  objc_storeStrong((id *)&self->_photosDataSource, 0);
}

+ (id)badgeInfoPromiseForAsset:(id)a3 assetCollection:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  PUBadgeInfoPromise *v15;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t);
  void *v20;
  id v21;
  id v22;
  _QWORD aBlock[4];
  id v24;
  id v25;

  v5 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __71__PUPhotoKitAssetsDataSource_badgeInfoPromiseForAsset_assetCollection___block_invoke;
  aBlock[3] = &unk_1E58A5360;
  v8 = v5;
  v24 = v8;
  v9 = v6;
  v25 = v9;
  v10 = _Block_copy(aBlock);
  v17 = v7;
  v18 = 3221225472;
  v19 = __71__PUPhotoKitAssetsDataSource_badgeInfoPromiseForAsset_assetCollection___block_invoke_2;
  v20 = &unk_1E58A5388;
  v11 = v8;
  v21 = v11;
  v12 = v9;
  v22 = v12;
  v13 = _Block_copy(&v17);
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance", v17, v18, v19, v20);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "debuggingBadges") || objc_msgSend(v14, "debuggingBadgesWhenFavorite"))
  {

    v13 = 0;
  }
  v15 = -[PUBadgeInfoPromise initWithBadgeInfoProvider:countProvider:]([PUBadgeInfoPromise alloc], "initWithBadgeInfoProvider:countProvider:", v10, v13);

  return v15;
}

void __71__PUPhotoKitAssetsDataSource_badgeInfoPromiseForAsset_assetCollection___block_invoke(uint64_t a1@<X0>, _OWORD *a2@<X8>)
{
  uint64_t v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  uint64_t v10;
  __int128 v11;
  char v12;
  void *v13;
  int v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  id v26;

  v4 = objc_msgSend(*(id *)(a1 + 32), "mediaType");
  if (v4 == 1)
  {
    v6 = objc_msgSend(*(id *)(a1 + 32), "isMediaSubtype:", 2);
    v7 = objc_msgSend(*(id *)(a1 + 32), "isMediaSubtype:", 16);
    v5 = 0;
  }
  else
  {
    if (v4 == 2)
      v5 = objc_msgSend(*(id *)(a1 + 32), "isMediaSubtype:", 0x100000);
    else
      v5 = 0;
    v6 = 0;
    v7 = 0;
  }
  v8 = objc_msgSend(*(id *)(a1 + 32), "hasEditableDepth");
  if (objc_msgSend(*(id *)(a1 + 32), "representsBurst"))
    v9 = objc_msgSend(*(id *)(a1 + 40), "canShowAvalancheStacks");
  else
    v9 = 0;
  v10 = objc_msgSend(*(id *)(a1 + 32), "RAWBadgeAttributes");
  v11 = *(_OWORD *)(MEMORY[0x1E0D7CE00] + 16);
  *a2 = *MEMORY[0x1E0D7CE00];
  a2[1] = v11;
  if (v6)
  {
    *(_QWORD *)a2 |= 4uLL;
    if (!v7)
    {
LABEL_12:
      if (!v9)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  else if (!v7)
  {
    goto LABEL_12;
  }
  *(_QWORD *)a2 |= 0x10uLL;
  if (v9)
LABEL_13:
    *(_QWORD *)a2 |= 8uLL;
LABEL_14:
  if (objc_msgSend(*(id *)(a1 + 32), "isCinematicVideo"))
  {
    *(_QWORD *)a2 |= 0x800000000uLL;
    v12 = v5;
  }
  else
  {
    v12 = 0;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isProRes")
    && (objc_msgSend(*(id *)(a1 + 32), "isCinematicVideo") & 1) == 0)
  {
    *(_QWORD *)a2 |= 0x400000000uLL;
    v12 |= v5;
  }
  if (objc_msgSend(*(id *)(a1 + 32), "isSpatialMedia"))
  {
    *(_QWORD *)a2 |= 0x20000000000uLL;
    v12 |= v5;
  }
  if (v5 && (v12 & 1) == 0)
    *(_QWORD *)a2 |= 0x400uLL;
  if (objc_msgSend(*(id *)(a1 + 32), "isPhotoIris"))
  {
    objc_msgSend(MEMORY[0x1E0D7B7C8], "sharedInstance");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "showActionableLivePhotosBadge");

    if (v14)
      *(_QWORD *)a2 |= 0x2000uLL;
    if (objc_msgSend(*(id *)(a1 + 32), "playbackVariation") == 1
      && objc_msgSend(*(id *)(a1 + 32), "playbackStyle") == 5)
    {
      v15 = 128;
    }
    else if (objc_msgSend(*(id *)(a1 + 32), "playbackVariation") == 2
           && objc_msgSend(*(id *)(a1 + 32), "playbackStyle") == 5)
    {
      v15 = 256;
    }
    else if ((objc_msgSend(*(id *)(a1 + 32), "canPlayLongExposure") & 1) != 0)
    {
      v15 = 512;
    }
    else if ((objc_msgSend(*(id *)(a1 + 32), "canPlayPhotoIris") & 1) != 0
           || (objc_msgSend(*(id *)(a1 + 32), "isPhotoIrisPlaceholder") & 1) != 0)
    {
      v15 = 64;
    }
    else
    {
      if ((objc_msgSend(*(id *)(a1 + 32), "isPhotoIrisPlaceholder") & 1) != 0)
        goto LABEL_43;
      v15 = 16777280;
    }
    *(_QWORD *)a2 |= v15;
  }
LABEL_43:
  if (v8 && ((v7 & 1) != 0 || objc_msgSend(*(id *)(a1 + 32), "isPhotoIris")))
    *(_QWORD *)a2 |= 0x40000000000uLL;
  if ((unint64_t)(v10 - 1) <= 2)
    *(_QWORD *)a2 |= qword_1AB0EFEC8[v10 - 1];
  v16 = (void *)MEMORY[0x1E0D7B970];
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "sharedLibraryStatusProviderWithPhotoLibrary:", v17);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v26, "hasSharedLibrary"))
  {
    objc_msgSend(MEMORY[0x1E0D7B968], "sharedInstance");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "enableOneUpBadge");

    if (v19)
    {
      if (objc_msgSend(*(id *)(a1 + 32), "participatesInLibraryScope")
        && (objc_msgSend(*(id *)(a1 + 32), "canPerformEditOperation:", 103) & 1) != 0)
      {
        v20 = 0xA000000000;
LABEL_57:
        *(_QWORD *)a2 |= v20;
        goto LABEL_58;
      }
      if ((objc_msgSend(*(id *)(a1 + 32), "participatesInLibraryScope") & 1) == 0
        && objc_msgSend(*(id *)(a1 + 32), "canPerformEditOperation:", 102))
      {
        v20 = 0x6000000000;
        goto LABEL_57;
      }
    }
  }
LABEL_58:
  +[PUOneUpSettings sharedInstance](PUOneUpSettings, "sharedInstance");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "debuggingBadges");
  v23 = objc_msgSend(v21, "debuggingBadgesWhenFavorite");
  if (v22 | v23)
  {
    v24 = v23;
    if (objc_msgSend(*(id *)(a1 + 32), "isFavorite"))
      v25 = v24;
    else
      v25 = v22;
    *(_QWORD *)a2 = v25;
    *((_QWORD *)a2 + 2) = 42;
  }

}

uint64_t __71__PUPhotoKitAssetsDataSource_badgeInfoPromiseForAsset_assetCollection___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t v16;

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 0;
  if (objc_msgSend(*(id *)(a1 + 32), "representsBurst")
    && objc_msgSend(*(id *)(a1 + 40), "canShowAvalancheStacks"))
  {
    objc_msgSend(*(id *)(a1 + 32), "burstIdentifier");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "photoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __71__PUPhotoKitAssetsDataSource_badgeInfoPromiseForAsset_assetCollection___block_invoke_3;
    v9[3] = &unk_1E58AAD18;
    v12 = &v13;
    v5 = v2;
    v10 = v5;
    v6 = v4;
    v11 = v6;
    objc_msgSend(v6, "performBlockAndWait:", v9);

  }
  v7 = v14[3];
  _Block_object_dispose(&v13, 8);
  return v7;
}

uint64_t __71__PUPhotoKitAssetsDataSource_badgeInfoPromiseForAsset_assetCollection___block_invoke_3(_QWORD *a1)
{
  uint64_t result;

  result = objc_msgSend(MEMORY[0x1E0D715B8], "countForAssetsWithAvalancheUUID:inLibrary:", a1[4], a1[5]);
  *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
  return result;
}

@end
