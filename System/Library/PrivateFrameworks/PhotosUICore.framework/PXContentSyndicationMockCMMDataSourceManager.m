@implementation PXContentSyndicationMockCMMDataSourceManager

+ (id)createCountsController
{
  return objc_alloc_init(PXContentSyndicationPhotoKitCountsController);
}

- (id)allAssetsFetchResult
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "PHFetchResult<PHAsset *> *_AllPhotosFetchResultForPhotoLibrary(PHPhotoLibrary *__strong)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("PXContentSyndicationMockCMMDataSource.m"), 138, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  }
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setInternalSortDescriptors:", v5);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)assetFetchResultProvider
{
  PXContentSyndicationAssetFetchResultProvider *assetFetchResultProvider;
  void *v4;
  PXContentSyndicationAssetFetchResultProvider *v5;
  PXContentSyndicationAssetFetchResultProvider *v6;

  assetFetchResultProvider = self->_assetFetchResultProvider;
  if (!assetFetchResultProvider)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXContentSyndicationAssetFetchResultProviderForPhotoLibrary(v4);
    v5 = (PXContentSyndicationAssetFetchResultProvider *)objc_claimAutoreleasedReturnValue();
    v6 = self->_assetFetchResultProvider;
    self->_assetFetchResultProvider = v5;

    assetFetchResultProvider = self->_assetFetchResultProvider;
  }
  return assetFetchResultProvider;
}

- (id)imageProvider
{
  PXUIImageProvider *imageProvider;
  void *v4;
  PXUIImageProvider *v5;
  PXUIImageProvider *v6;

  imageProvider = self->_imageProvider;
  if (!imageProvider)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PXContentSyndicationImageProviderForPhotoLibrary(v4);
    v5 = (PXUIImageProvider *)objc_claimAutoreleasedReturnValue();
    v6 = self->_imageProvider;
    self->_imageProvider = v5;

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
    v4 = -[PXContentSyndicationPhotoKitSocialLayerHighlightProvider initWithHighlightFetchBlock:]([PXContentSyndicationPhotoKitSocialLayerHighlightProvider alloc], "initWithHighlightFetchBlock:", &__block_literal_global_286322);
    v5 = self->_highlightProvider;
    self->_highlightProvider = (PXContentSyndicationSocialLayerHighlightProvider *)v4;

    highlightProvider = self->_highlightProvider;
  }
  return highlightProvider;
}

- (id)createAssetsDataSourceManager
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "sharedMomentSharePhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v5);

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 7, 0x7FFFFFFFFFFFFFFFLL, v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  PXContentSyndicationAssetsDataSourceManagerForAssetCollectionFetchResult(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)createInitialDataSource
{
  PXCMMInvitationsDataSourceManager *v3;
  PXCMMInvitationsDataSourceManager *cmmDataSourceManager;
  void *v5;
  void *v6;
  PXContentSyndicationMockCMMDataSource *v7;

  +[PXCMMInvitationsDataSourceManager currentDataSourceManager](PXCMMInvitationsDataSourceManager, "currentDataSourceManager");
  v3 = (PXCMMInvitationsDataSourceManager *)objc_claimAutoreleasedReturnValue();
  cmmDataSourceManager = self->_cmmDataSourceManager;
  self->_cmmDataSourceManager = v3;

  -[PXSectionedDataSourceManager registerChangeObserver:context:](self->_cmmDataSourceManager, "registerChangeObserver:context:", self, PXContentSyndicationMockCMMDataSourceManagerContext);
  -[PXContentSyndicationMockCMMDataSourceManager cmmDataSourceManager](self, "cmmDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[PXContentSyndicationMockCMMDataSource initWithCMMDataSource:]([PXContentSyndicationMockCMMDataSource alloc], "initWithCMMDataSource:", v6);
  return v7;
}

- (void)_handleDataSourceChange
{
  void *v3;
  PXContentSyndicationMockCMMDataSource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  -[PXContentSyndicationMockCMMDataSourceManager cmmDataSourceManager](self, "cmmDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[PXContentSyndicationMockCMMDataSource initWithCMMDataSource:]([PXContentSyndicationMockCMMDataSource alloc], "initWithCMMDataSource:", v12);
  -[PXContentSyndicationMockCMMDataSourceManager cmmDataSourceManager](self, "cmmDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cmmDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeDetailsFromDataSource:toDataSource:", v7, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc((Class)off_1E50B4A18);
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithSectionedDataSourceChangeDetails:withFromDataSourceIdentifier:toDataSourceIdentifier:", v8, objc_msgSend(v10, "identifier"), -[PXContentSyndicationMockCMMDataSource identifier](v4, "identifier"));

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v4, v11);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXContentSyndicationMockCMMDataSourceManagerContext == a5)
    -[PXContentSyndicationMockCMMDataSourceManager _handleDataSourceChange](self, "_handleDataSourceChange", a3);
}

- (PXCMMInvitationsDataSourceManager)cmmDataSourceManager
{
  return self->_cmmDataSourceManager;
}

- (void)setCmmDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_cmmDataSourceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cmmDataSourceManager, 0);
  objc_storeStrong((id *)&self->_highlightProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_assetFetchResultProvider, 0);
}

uint64_t __76__PXContentSyndicationMockCMMDataSourceManager_socialLayerHighlightProvider__block_invoke()
{
  return 0;
}

@end
