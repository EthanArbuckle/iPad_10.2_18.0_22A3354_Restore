@implementation PXStoryPHAssetCollectionAssetsProducer

- (PXStoryPHAssetCollectionAssetsProducer)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXStoryPHAssetCollectionAssetsProducer.m"), 37, CFSTR("%s is not available as initializer"), "-[PXStoryPHAssetCollectionAssetsProducer init]");

  abort();
}

- (PXStoryPHAssetCollectionAssetsProducer)initWithAssetCollection:(id)a3 keyAsset:(id)a4 referencePersons:(id)a5 curationKind:(int64_t)a6 options:(unint64_t)a7
{
  id v13;
  id v14;
  id v15;
  PXStoryPHAssetCollectionAssetsProducer *v16;
  PXStoryPHAssetCollectionAssetsProducer *v17;
  uint64_t v18;
  NSArray *referencePersons;
  objc_super v21;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v21.receiver = self;
  v21.super_class = (Class)PXStoryPHAssetCollectionAssetsProducer;
  v16 = -[PXStoryPHAssetCollectionAssetsProducer init](&v21, sel_init);
  v17 = v16;
  if (v16)
  {
    objc_storeStrong((id *)&v16->_assetCollection, a3);
    objc_storeStrong((id *)&v17->_keyAsset, a4);
    v18 = objc_msgSend(v15, "copy");
    referencePersons = v17->_referencePersons;
    v17->_referencePersons = (NSArray *)v18;

    v17->_curationKind = a6;
    v17->_options = a7;
  }

  return v17;
}

- (id)requestAssetsWithOptions:(unint64_t)a3 storyQueue:(id)a4 resultHandler:(id)a5
{
  char v6;
  id v8;
  uint64_t v9;
  void (**v10)(id, PXStoryProducerResult *);
  unint64_t v11;
  void *v12;
  int v13;
  unint64_t v14;
  PXPhotosDataSourceConfiguration *v15;
  void *v16;
  PXPhotosDataSourceConfiguration *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  PXPhotosDataSource *v28;
  PXPhotosDataSource *v29;
  void *v30;
  PXPhotoKitAssetsDataSourceManager *v31;
  PXStoryProducerResult *v32;
  _QWORD v34[4];
  PXPhotosDataSource *v35;
  _QWORD v36[2];
  void *v37;
  _QWORD v38[2];

  v6 = a3;
  v38[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  if ((v6 & 2) != 0)
    v9 = 712742;
  else
    v9 = 712738;
  v10 = (void (**)(id, PXStoryProducerResult *))a5;
  v11 = v9 & 0xFFFFFFFFFFFFFFBFLL | ((-[PXStoryPHAssetCollectionAssetsProducer options](self, "options") & 1) << 6);
  -[PXStoryPHAssetCollectionAssetsProducer assetCollection](self, "assetCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend((id)objc_opt_class(), "shouldEnableCurationForAssetCollection:", v12);
  if (v13)
    v11 |= 0x10uLL;
  if (+[PXStoryPHAssetCollectionAssetsProducer shouldApplyDetailsViewContextForAssetCollection:](PXStoryPHAssetCollectionAssetsProducer, "shouldApplyDetailsViewContextForAssetCollection:", v12))
  {
    v11 |= 0x100000uLL;
  }
  if (-[PXStoryPHAssetCollectionAssetsProducer curationKind](self, "curationKind") == 3)
    v14 = v11 | 0x200010;
  else
    v14 = v11;
  v15 = [PXPhotosDataSourceConfiguration alloc];
  -[PXStoryPHAssetCollectionAssetsProducer assetCollection](self, "assetCollection");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = -[PXPhotosDataSourceConfiguration initWithAssetCollection:options:](v15, "initWithAssetCollection:options:", v16, v14);

  -[PXPhotosDataSourceConfiguration setCurationKind:](v17, "setCurationKind:", -[PXStoryPHAssetCollectionAssetsProducer curationKind](self, "curationKind"));
  if (v13)
    -[PXPhotosDataSourceConfiguration setCurationType:](v17, "setCurationType:", 1);
  if ((-[PXStoryPHAssetCollectionAssetsProducer options](self, "options") & 2) != 0)
  {
    -[PXPhotosDataSourceConfiguration setLibraryFilterState:](v17, "setLibraryFilterState:", 0);
    -[PXPhotosDataSourceConfiguration setLibraryFilter:](v17, "setLibraryFilter:", 0);
  }
  -[PXStoryPHAssetCollectionAssetsProducer referencePersons](self, "referencePersons");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSourceConfiguration setFilterPersons:](v17, "setFilterPersons:", v18);
  -[PXStoryPHAssetCollectionAssetsProducer keyAsset](self, "keyAsset");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "count");

  if (v20)
  {
    -[PXStoryPHAssetCollectionAssetsProducer assetCollection](self, "assetCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v21;
    -[PXStoryPHAssetCollectionAssetsProducer keyAsset](self, "keyAsset");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v22;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, &v37, 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSourceConfiguration setExistingKeyAssetsFetchResults:](v17, "setExistingKeyAssetsFetchResults:", v23);

  }
  objc_msgSend(v12, "photoLibrary");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v18, "count"))
  {
    +[PXContentSyndicationConfigurationProvider contentSyndicationConfigurationProviderWithPhotoLibrary:](PXContentSyndicationConfigurationProvider, "contentSyndicationConfigurationProviderWithPhotoLibrary:", v24);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXPhotosDataSourceConfiguration setCanIncludeUnsavedSyndicatedAssets:](v17, "setCanIncludeUnsavedSyndicatedAssets:", objc_msgSend(v25, "showUnsavedSyndicatedContentInMemories"));

  }
  -[PXPhotosDataSourceConfiguration setClientQueue:](v17, "setClientQueue:", v8);
  -[PXPhotosDataSourceConfiguration setWantsCurationByDefault:](v17, "setWantsCurationByDefault:", (v14 >> 4) & 1);
  v26 = *MEMORY[0x1E0CD1A78];
  v36[0] = *MEMORY[0x1E0CD1960];
  v36[1] = v26;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSourceConfiguration setFetchPropertySets:](v17, "setFetchPropertySets:", v27);

  v28 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v17);
  v29 = v28;
  if ((v6 & 2) != 0)
  {
    -[PXPhotosDataSource setAllowSlowFetchesOnClientQueue:](v28, "setAllowSlowFetchesOnClientQueue:", 1);
    if ((v6 & 1) != 0)
      goto LABEL_24;
  }
  else if ((v6 & 1) != 0)
  {
    -[PXPhotosDataSource forceAccurateAllSectionsIfNeeded](v28, "forceAccurateAllSectionsIfNeeded");
LABEL_24:
    -[PXPhotosDataSource startBackgroundFetchIfNeeded](v29, "startBackgroundFetchIfNeeded");
    goto LABEL_25;
  }
  +[PXPreloadScheduler sharedScheduler](PXPreloadScheduler, "sharedScheduler");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v34[0] = MEMORY[0x1E0C809B0];
  v34[1] = 3221225472;
  v34[2] = __92__PXStoryPHAssetCollectionAssetsProducer_requestAssetsWithOptions_storyQueue_resultHandler___block_invoke;
  v34[3] = &unk_1E5149198;
  v35 = v29;
  objc_msgSend(v30, "scheduleMainQueueTask:", v34);

LABEL_25:
  v31 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v29);
  v32 = -[PXStoryProducerResult initWithObject:]([PXStoryProducerResult alloc], "initWithObject:", v31);
  v10[2](v10, v32);

  return 0;
}

- (PHAssetCollection)assetCollection
{
  return self->_assetCollection;
}

- (NSArray)referencePersons
{
  return self->_referencePersons;
}

- (PHFetchResult)keyAsset
{
  return self->_keyAsset;
}

- (int64_t)curationKind
{
  return self->_curationKind;
}

- (unint64_t)options
{
  return self->_options;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyAsset, 0);
  objc_storeStrong((id *)&self->_referencePersons, 0);
  objc_storeStrong((id *)&self->_assetCollection, 0);
}

uint64_t __92__PXStoryPHAssetCollectionAssetsProducer_requestAssetsWithOptions_storyQueue_resultHandler___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startBackgroundFetchIfNeeded");
}

+ (BOOL)shouldApplyDetailsViewContextForAssetCollection:(id)a3
{
  return objc_msgSend(a3, "assetCollectionType") != 4;
}

+ (BOOL)shouldEnableCurationForAssetCollection:(id)a3
{
  id v3;
  int v4;

  v3 = a3;
  v4 = (unint64_t)(objc_msgSend(v3, "assetCollectionType") - 4) < 3
    || +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled")
    && (objc_msgSend(v3, "px_isRegularAlbum") & 1) != 0;
  if (objc_msgSend(v3, "assetCollectionType") == 2)
    v4 |= objc_msgSend(v3, "isUserSmartAlbum") ^ 1;

  return v4;
}

@end
