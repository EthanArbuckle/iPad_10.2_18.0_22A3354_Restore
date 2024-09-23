@implementation PXStoryDefaultAssetsProducerFactory

- (id)assetsProducerForConfiguration:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  PXStaticDisplayAssetsDataSource *v10;
  PXStaticDisplayAssetsDataSource *v11;
  PXStaticDisplayAssetsDataSource *v12;
  void *v13;
  PXPassthroughAssetsDataSourceManager *v14;
  unint64_t v15;
  PXStoryPHAssetCollectionAssetsProducer *v16;
  id v17;
  PXStaticDisplayAssetsDataSource *v18;
  PXStaticDisplayAssetsDataSource *v19;
  void *v20;
  void *v21;
  void *v22;
  PXStoryPassthroughAssetsProducer *v23;
  PXPassthroughAssetsDataSourceManager *v24;
  PXStoryPersistableRecipeAssetsProducer *v25;
  PXStoryPassthroughAssetsProducer *v26;
  PXPassthroughAssetsDataSourceManager *v27;
  PXStoryPassthroughAssetsProducer *v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  void *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "options");
  objc_msgSend(v3, "assetCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "keyAsset");
  v6 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "assets");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "referencePersons");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "persistableRecipe");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v4 & 2) == 0 || !v6)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v15 = (v4 >> 8) & 2 | ((v4 & 2) >> 1);
      v16 = [PXStoryPHAssetCollectionAssetsProducer alloc];
      v17 = (id)v6;
      if (objc_opt_class() && (objc_opt_isKindOfClass() & 1) != 0)
        v18 = (PXStaticDisplayAssetsDataSource *)v17;
      else
        v18 = 0;

      v25 = -[PXStoryPHAssetCollectionAssetsProducer initWithAssetCollection:keyAsset:referencePersons:curationKind:options:](v16, "initWithAssetCollection:keyAsset:referencePersons:curationKind:options:", v5, v18, v8, objc_msgSend(v3, "curationKind"), v15);
LABEL_23:

      goto LABEL_24;
    }
    if (!(v6 | v7))
    {
      if (v9)
      {
        v25 = -[PXStoryPersistableRecipeAssetsProducer initWithPersistableRecipe:]([PXStoryPersistableRecipeAssetsProducer alloc], "initWithPersistableRecipe:", v9);
        goto LABEL_24;
      }
      v10 = objc_alloc_init(PXStaticDisplayAssetsDataSource);
      v29 = [PXStoryPassthroughAssetsProducer alloc];
      v14 = -[PXPassthroughAssetsDataSourceManager initWithDataSource:]([PXPassthroughAssetsDataSourceManager alloc], "initWithDataSource:", v10);
      v25 = -[PXStoryPassthroughAssetsProducer initWithAssetsDataSourceManager:](v29, "initWithAssetsDataSourceManager:", v14);
      goto LABEL_20;
    }
    v19 = [PXStaticDisplayAssetsDataSource alloc];
    if (v5)
    {
      v32 = v5;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v32, 1);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7)
        goto LABEL_12;
    }
    else
    {
      v20 = 0;
      if (v7)
      {
LABEL_12:
        v31 = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v31, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v6)
          goto LABEL_13;
        goto LABEL_29;
      }
    }
    v21 = 0;
    if (v6)
    {
LABEL_13:
      v30 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = -[PXStaticDisplayAssetsDataSource initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:](v19, "initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:", v20, v21, 0, v22, 0);

      if (!v7)
      {
LABEL_15:
        if (v5)

        v23 = [PXStoryPassthroughAssetsProducer alloc];
        v24 = -[PXPassthroughAssetsDataSourceManager initWithDataSource:]([PXPassthroughAssetsDataSourceManager alloc], "initWithDataSource:", v18);
        v25 = -[PXStoryPassthroughAssetsProducer initWithAssetsDataSourceManager:](v23, "initWithAssetsDataSourceManager:", v24);

        goto LABEL_23;
      }
LABEL_14:

      goto LABEL_15;
    }
LABEL_29:
    v18 = -[PXStaticDisplayAssetsDataSource initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:](v19, "initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:", v20, v21, 0, 0, 0);
    if (!v7)
      goto LABEL_15;
    goto LABEL_14;
  }
  v34[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
  v10 = (PXStaticDisplayAssetsDataSource *)objc_claimAutoreleasedReturnValue();
  v11 = [PXStaticDisplayAssetsDataSource alloc];
  v12 = v11;
  if (v5)
  {
    v33 = v5;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v33, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PXStaticDisplayAssetsDataSource initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:](v12, "initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:", v13, 0, 0, v10, 0);

  }
  else
  {
    v14 = -[PXStaticDisplayAssetsDataSource initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:](v11, "initWithAssetCollectionBySection:assetsBySection:curatedAssetsBySection:keyAssetsBySection:sectionContent:", 0, 0, 0, v10, 0);
  }
  v26 = [PXStoryPassthroughAssetsProducer alloc];
  v27 = -[PXPassthroughAssetsDataSourceManager initWithDataSource:]([PXPassthroughAssetsDataSourceManager alloc], "initWithDataSource:", v14);
  v25 = -[PXStoryPassthroughAssetsProducer initWithAssetsDataSourceManager:](v26, "initWithAssetsDataSourceManager:", v27);

LABEL_20:
LABEL_24:

  return v25;
}

@end
