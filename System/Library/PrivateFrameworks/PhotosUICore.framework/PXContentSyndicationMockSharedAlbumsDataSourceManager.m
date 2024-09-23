@implementation PXContentSyndicationMockSharedAlbumsDataSourceManager

- (PXContentSyndicationMockSharedAlbumsDataSourceManager)init
{
  PXContentSyndicationMockSharedAlbumsDataSourceManager *v2;
  uint64_t v3;
  PHPhotoLibrary *photoLibrary;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXContentSyndicationMockSharedAlbumsDataSourceManager;
  v2 = -[PXSectionedDataSourceManager init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_deprecated_appPhotoLibrary");
    v3 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v2->_photoLibrary;
    v2->_photoLibrary = (PHPhotoLibrary *)v3;

  }
  return v2;
}

- (id)allAssetsFetchResult
{
  void *v2;
  void *v3;

  -[PXContentSyndicationMockSharedAlbumsDataSourceManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  _AllPhotosFetchResultForPhotoLibrary(v2, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
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
    -[PXContentSyndicationMockSharedAlbumsDataSourceManager photoLibrary](self, "photoLibrary");
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
    -[PXContentSyndicationMockSharedAlbumsDataSourceManager photoLibrary](self, "photoLibrary");
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
    v4 = -[PXContentSyndicationPhotoKitSocialLayerHighlightProvider initWithHighlightFetchBlock:]([PXContentSyndicationPhotoKitSocialLayerHighlightProvider alloc], "initWithHighlightFetchBlock:", &__block_literal_global);
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

  -[PXContentSyndicationMockSharedAlbumsDataSourceManager photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "px_virtualCollections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sharedAlbumsCollectionList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  PXContentSyndicationAssetsDataSourceManagerForAssetCollectionFetchResult(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)createInitialDataSource
{
  void *v3;
  void *v4;
  void *v5;
  PXPhotoKitCollectionsDataSourceManagerConfiguration *v6;
  PXPhotoKitCollectionsDataSourceManager *v7;
  PXCollectionsDataSourceManager *sharedAlbumsDataSourceManager;
  PXPhotoKitCollectionsDataSourceManager *v9;
  void *v10;
  void *v11;
  PXContentSyndicationMockSharedAlbumsDataSource *v12;
  PXContentSyndicationMockSharedAlbumsDataSource *v13;

  -[PXContentSyndicationMockSharedAlbumsDataSourceManager photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "px_virtualCollections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sharedAlbumsCollectionList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PXPhotoKitCollectionsDataSourceManagerConfiguration initWithCollectionList:]([PXPhotoKitCollectionsDataSourceManagerConfiguration alloc], "initWithCollectionList:", v5);
  v7 = -[PXPhotoKitCollectionsDataSourceManager initWithConfiguration:]([PXPhotoKitCollectionsDataSourceManager alloc], "initWithConfiguration:", v6);
  sharedAlbumsDataSourceManager = self->_sharedAlbumsDataSourceManager;
  self->_sharedAlbumsDataSourceManager = &v7->super;
  v9 = v7;

  -[PXCollectionsDataSourceManager registerChangeObserver:context:](self->_sharedAlbumsDataSourceManager, "registerChangeObserver:context:", self, PXContentSyndicationMockSharedAlbumsDataSourceManagerContext);
  -[PXContentSyndicationMockSharedAlbumsDataSourceManager sharedAlbumsDataSourceManager](self, "sharedAlbumsDataSourceManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataSource");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [PXContentSyndicationMockSharedAlbumsDataSource alloc];
  v13 = -[PXContentSyndicationMockSharedAlbumsDataSource initWithSharedAlbumsDataSource:](v12, "initWithSharedAlbumsDataSource:", v11);

  return v13;
}

- (void)_handleDataSourceChange
{
  void *v3;
  PXContentSyndicationMockSharedAlbumsDataSource *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  -[PXContentSyndicationMockSharedAlbumsDataSourceManager sharedAlbumsDataSourceManager](self, "sharedAlbumsDataSourceManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dataSource");
  v12 = (id)objc_claimAutoreleasedReturnValue();

  v4 = -[PXContentSyndicationMockSharedAlbumsDataSource initWithSharedAlbumsDataSource:]([PXContentSyndicationMockSharedAlbumsDataSource alloc], "initWithSharedAlbumsDataSource:", v12);
  -[PXContentSyndicationMockSharedAlbumsDataSourceManager sharedAlbumsDataSourceManager](self, "sharedAlbumsDataSourceManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sharedAlbumsDataSource");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "changeDetailsFromDataSource:toDataSource:", v7, v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc((Class)off_1E50B4A18);
  -[PXSectionedDataSourceManager dataSource](self, "dataSource");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v9, "initWithSectionedDataSourceChangeDetails:withFromDataSourceIdentifier:toDataSourceIdentifier:", v8, objc_msgSend(v10, "identifier"), -[PXContentSyndicationMockSharedAlbumsDataSource identifier](v4, "identifier"));

  -[PXSectionedDataSourceManager setDataSource:changeDetails:](self, "setDataSource:changeDetails:", v4, v11);
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  if ((a4 & 1) != 0 && (void *)PXContentSyndicationMockSharedAlbumsDataSourceManagerContext == a5)
    -[PXContentSyndicationMockSharedAlbumsDataSourceManager _handleDataSourceChange](self, "_handleDataSourceChange", a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (PXCollectionsDataSourceManager)sharedAlbumsDataSourceManager
{
  return self->_sharedAlbumsDataSourceManager;
}

- (void)setSharedAlbumsDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_sharedAlbumsDataSourceManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sharedAlbumsDataSourceManager, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_highlightProvider, 0);
  objc_storeStrong((id *)&self->_imageProvider, 0);
  objc_storeStrong((id *)&self->_assetFetchResultProvider, 0);
}

uint64_t __85__PXContentSyndicationMockSharedAlbumsDataSourceManager_socialLayerHighlightProvider__block_invoke()
{
  return 0;
}

+ (id)createCountsController
{
  return objc_alloc_init(PXContentSyndicationPhotoKitCountsController);
}

@end
