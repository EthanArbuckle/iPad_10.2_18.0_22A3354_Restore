@implementation PXContentSyndicationMockSingleAssetsDataSourceManager

- (PXContentSyndicationMockSingleAssetsDataSourceManager)init
{
  PXContentSyndicationMockSingleAssetsDataSourceManager *v2;
  void *v3;
  PHPhotoLibrary *v4;
  id v5;
  PHPhotoLibrary *photoLibrary;
  PHPhotoLibrary *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  PHFetchResult *allPhotosFetchResult;
  PXContentSyndicationMockSingleAssetsDataSourceManager *v12;
  NSObject *v13;
  id v15;
  objc_super v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v16.receiver = self;
  v16.super_class = (Class)PXContentSyndicationMockSingleAssetsDataSourceManager;
  v2 = -[PXSectionedDataSourceManager init](&v16, sel_init);
  if (!v2)
    goto LABEL_5;
  +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "useUserLibraryForSyndicatedAssets"))
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v4 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
    v5 = 0;
    if (v4)
    {
LABEL_4:
      photoLibrary = v2->_photoLibrary;
      v2->_photoLibrary = v4;
      v7 = v4;

      +[PXContentSyndicationSettings sharedInstance](PXContentSyndicationSettings, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "maxNumberOfBatches");

      PXContentSyndicationMockSingleAssetsFetchResult(v2->_photoLibrary, 0, v9);
      v10 = objc_claimAutoreleasedReturnValue();
      allPhotosFetchResult = v2->_allPhotosFetchResult;
      v2->_allPhotosFetchResult = (PHFetchResult *)v10;

LABEL_5:
      v12 = v2;
      goto LABEL_10;
    }
  }
  else
  {
    v15 = 0;
    objc_msgSend(MEMORY[0x1E0CD16F8], "openPhotoLibraryWithWellKnownIdentifier:error:", 3, &v15);
    v4 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
    v5 = v15;
    if (v4)
      goto LABEL_4;
  }
  PLUIGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v18 = v5;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "Error opening syndication library: %@", buf, 0xCu);
  }

  v12 = 0;
LABEL_10:

  return v12;
}

- (id)createInitialDataSource
{
  void *v3;
  PXContentSyndicationMockSingleAssetsDataSource *v4;

  -[PHFetchResult photoLibrary](self->_allPhotosFetchResult, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_registerChangeObserver:", self);
  v4 = -[PXContentSyndicationMockSingleAssetsDataSource initWithFetchResult:]([PXContentSyndicationMockSingleAssetsDataSource alloc], "initWithFetchResult:", self->_allPhotosFetchResult);

  return v4;
}

- (id)allAssetsFetchResult
{
  return PXContentSyndicationMockSingleAssetsFetchResult(self->_photoLibrary, 1, 0);
}

- (id)assetFetchResultProvider
{
  PXContentSyndicationAssetFetchResultProvider *assetFetchResultProvider;
  PXContentSyndicationAssetFetchResultProvider *v4;
  PXContentSyndicationAssetFetchResultProvider *v5;

  assetFetchResultProvider = self->_assetFetchResultProvider;
  if (!assetFetchResultProvider)
  {
    PXContentSyndicationAssetFetchResultProviderForPhotoLibrary(self->_photoLibrary);
    v4 = (PXContentSyndicationAssetFetchResultProvider *)objc_claimAutoreleasedReturnValue();
    v5 = self->_assetFetchResultProvider;
    self->_assetFetchResultProvider = v4;

    assetFetchResultProvider = self->_assetFetchResultProvider;
  }
  return assetFetchResultProvider;
}

- (id)imageProvider
{
  PXUIImageProvider *imageProvider;
  PXUIImageProvider *v4;
  PXUIImageProvider *v5;

  imageProvider = self->_imageProvider;
  if (!imageProvider)
  {
    PXContentSyndicationImageProviderForPhotoLibrary(self->_photoLibrary);
    v4 = (PXUIImageProvider *)objc_claimAutoreleasedReturnValue();
    v5 = self->_imageProvider;
    self->_imageProvider = v4;

    imageProvider = self->_imageProvider;
  }
  return imageProvider;
}

- (id)socialLayerHighlightProvider
{
  PXContentSyndicationSocialLayerHighlightProvider *highlightProvider;
  PXContentSyndicationPhotoKitSocialLayerHighlightProvider *v4;
  PXContentSyndicationSocialLayerHighlightProvider *v5;

  highlightProvider = self->_highlightProvider;
  if (!highlightProvider)
  {
    v4 = -[PXContentSyndicationPhotoKitSocialLayerHighlightProvider initWithHighlightFetchBlock:]([PXContentSyndicationPhotoKitSocialLayerHighlightProvider alloc], "initWithHighlightFetchBlock:", &__block_literal_global_6066);
    v5 = self->_highlightProvider;
    self->_highlightProvider = (PXContentSyndicationSocialLayerHighlightProvider *)v4;

    highlightProvider = self->_highlightProvider;
  }
  return highlightProvider;
}

- (id)createAssetsDataSourceManager
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v12;
  uint64_t v13;
  void (*v14)(uint64_t, _OWORD *);
  void *v15;
  id v16;
  id v17;
  _OWORD v18[2];

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    objc_msgSend(v4, "firstItemIndexPath");
  else
    memset(v18, 0, sizeof(v18));
  v12 = MEMORY[0x1E0C809B0];
  v13 = 3221225472;
  v14 = __86__PXContentSyndicationMockSingleAssetsDataSourceManager_createAssetsDataSourceManager__block_invoke;
  v15 = &unk_1E5142450;
  v16 = v5;
  v17 = v3;
  v6 = v3;
  v7 = v5;
  objc_msgSend(v7, "enumerateItemIndexPathsStartingAtIndexPath:reverseDirection:usingBlock:", v18, 0, &v12);
  v8 = objc_alloc(MEMORY[0x1E0CD1620]);
  v9 = (void *)objc_msgSend(v8, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v6, self->_photoLibrary, *MEMORY[0x1E0CD1B98], 0, 0, 1, v12, v13, v14, v15);
  PXContentSyndicationAssetsDataSourceManagerForAssetCollectionFetchResult(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)prepareForPhotoLibraryChange:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v12;
  _QWORD block[7];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;
  _QWORD v20[3];
  _QWORD v21[4];

  v21[3] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v14 = 0;
  v15 = &v14;
  v16 = 0x3032000000;
  v17 = __Block_byref_object_copy__6060;
  v18 = __Block_byref_object_dispose__6061;
  v19 = 0;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __86__PXContentSyndicationMockSingleAssetsDataSourceManager_prepareForPhotoLibraryChange___block_invoke;
  block[3] = &unk_1E5141AE0;
  block[4] = self;
  block[5] = &v14;
  block[6] = a2;
  dispatch_sync(MEMORY[0x1E0C80D38], block);
  v6 = (void *)v15[5];
  v12 = 0;
  objc_msgSend(v6, "dataSourceUpdatedWithChange:changeDetails:", v5, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  v9 = v15[5];
  v20[0] = CFSTR("currentDataSource");
  v20[1] = CFSTR("preparedDataSource");
  v21[0] = v9;
  v21[1] = v7;
  v20[2] = CFSTR("preparedChangeDetails");
  v21[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v21, v20, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v14, 8);
  return v10;
}

- (void)photoLibraryDidChangeOnMainQueue:(id)a3 withPreparedInfo:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  id v14;
  uint64_t v15;
  PXContentSyndicationMockSingleAssetsDataSourceManager *v16;
  id v17;
  uint64_t v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  PXContentSyndicationMockSingleAssetsDataSourceManager *v23;
  void *v24;
  objc_class *v25;
  void *v26;
  objc_class *v27;
  void *v28;
  id v29;
  id v30;
  void *v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_3;
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (objc_class *)objc_opt_class();
    NSStringFromClass(v27);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "px_descriptionForAssertionMessage");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 265, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.dataSource"), v26, v28);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = (objc_class *)objc_opt_class();
    NSStringFromClass(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 265, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.dataSource"), v26);
  }

LABEL_3:
  objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("currentDataSource"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v9)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("preparedDataSource"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("preparedChangeDetails"));
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v30 = 0;
    objc_msgSend(v9, "dataSourceUpdatedWithChange:changeDetails:", v7, &v30);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v30;
  }
  v13 = v12;
  if (v11 != v9)
  {
    v14 = objc_alloc((Class)off_1E50B4A18);
    v15 = objc_msgSend(v9, "identifier");
    v29 = v8;
    v16 = self;
    v17 = v7;
    v18 = objc_msgSend(v11, "identifier");
    objc_msgSend(off_1E50B1608, "changeDetailsWithNoChanges");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = &unk_1E53EAE48;
    v32[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v18;
    v7 = v17;
    v22 = (void *)objc_msgSend(v14, "initWithFromDataSourceIdentifier:toDataSourceIdentifier:sectionChanges:itemChangeDetailsBySection:subitemChangeDetailsByItemBySection:", v15, v21, v19, v20, 0);

    v23 = v16;
    v8 = v29;
    -[PXSectionedDataSourceManager setDataSource:changeDetails:](v23, "setDataSource:changeDetails:", v11, v22);

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_highlightProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_assetFetchResultProvider, 0);
  objc_storeStrong((id *)&self->_allPhotosFetchResult, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

void __86__PXContentSyndicationMockSingleAssetsDataSourceManager_prepareForPhotoLibraryChange___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  objc_class *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  objc_class *v12;
  void *v13;

  objc_msgSend(*(id *)(a1 + 32), "dataSource");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1 + 48);
    v7 = *(_QWORD *)(a1 + 32);
    v8 = (objc_class *)objc_opt_class();
    NSStringFromClass(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v6, v7, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 251, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("self.dataSource"), v9);
LABEL_6:

    goto LABEL_3;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(a1 + 48);
    v11 = *(_QWORD *)(a1 + 32);
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "px_descriptionForAssertionMessage");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", v10, v11, CFSTR("PXContentSyndicationMockSingleAssetsDataSource.m"), 251, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("self.dataSource"), v9, v13);

    goto LABEL_6;
  }
LABEL_3:
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __86__PXContentSyndicationMockSingleAssetsDataSourceManager_createAssetsDataSourceManager__block_invoke(uint64_t a1, _OWORD *a2)
{
  void *v3;
  __int128 v4;
  void *v5;
  _OWORD v6[2];

  v3 = *(void **)(a1 + 32);
  v4 = a2[1];
  v6[0] = *a2;
  v6[1] = v4;
  objc_msgSend(v3, "assetCollectionAtItemIndexPath:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "addObject:", v5);

}

id __85__PXContentSyndicationMockSingleAssetsDataSourceManager_socialLayerHighlightProvider__block_invoke(uint64_t a1, void *a2)
{
  return PXContentSyndicationSocialLayerHighlightForAsset(a2);
}

+ (id)createCountsController
{
  return objc_alloc_init(PXContentSyndicationPhotoKitCountsController);
}

@end
