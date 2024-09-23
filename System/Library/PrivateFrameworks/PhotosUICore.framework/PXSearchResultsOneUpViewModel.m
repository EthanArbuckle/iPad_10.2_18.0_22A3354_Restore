@implementation PXSearchResultsOneUpViewModel

- (PXSearchResultsOneUpViewModel)initWithOneUpWithAsset:(id)a3 atIndex:(unint64_t)a4 inAssetCollection:(id)a5 searchQueryMatchInfo:(id)a6
{
  id v10;
  id v11;
  id v12;
  PXSearchResultsOneUpViewModel *v13;
  void *v14;
  void *v15;
  void *v16;
  PXPhotosDataSourceConfiguration *v17;
  PXPhotosDataSource *v18;
  PXPhotosDataSource *dataSource;
  PXPhotoKitAssetsDataSourceManager *v20;
  id v21;
  unint64_t v22;
  void *v23;
  uint64_t v24;
  PXAssetsDataSourceManager *dataSourceManager;
  PXPhotoKitUIMediaProvider *v26;
  PXPhotoKitUIMediaProvider *mediaProvider;
  uint64_t v28;
  PXAssetReference *initialAssetReference;
  void *v31;
  _QWORD v32[4];
  objc_super v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v33.receiver = self;
  v33.super_class = (Class)PXSearchResultsOneUpViewModel;
  v13 = -[PXSearchResultsOneUpViewModel init](&v33, sel_init);
  if (v13)
  {
    v14 = (void *)MEMORY[0x1E0CD14E0];
    v34[0] = v11;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "transientCollectionListWithCollections:title:", v15, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v31, 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:options:", v16, 0);
    -[PXPhotosDataSourceConfiguration setLibraryFilterState:](v17, "setLibraryFilterState:", 0);
    -[PXPhotosDataSourceConfiguration setLibraryFilter:](v17, "setLibraryFilter:", 0);
    v18 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v17);
    dataSource = v13->_dataSource;
    v13->_dataSource = v18;

    v20 = [PXPhotoKitAssetsDataSourceManager alloc];
    -[PXSearchResultsOneUpViewModel dataSource](v13, "dataSource");
    v21 = v12;
    v22 = a4;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:](v20, "initWithPhotosDataSource:", v23);
    dataSourceManager = v13->_dataSourceManager;
    v13->_dataSourceManager = (PXAssetsDataSourceManager *)v24;

    v26 = objc_alloc_init(PXPhotoKitUIMediaProvider);
    mediaProvider = v13->_mediaProvider;
    v13->_mediaProvider = v26;

    v32[0] = -[PXPhotosDataSource versionIdentifier](v13->_dataSource, "versionIdentifier");
    v32[1] = 0;
    v32[2] = v22;
    v32[3] = 0x7FFFFFFFFFFFFFFFLL;
    v12 = v21;
    v28 = objc_msgSend(objc_alloc((Class)off_1E50B1688), "initWithSectionObject:itemObject:subitemObject:indexPath:", 0, v10, 0, v32);
    initialAssetReference = v13->_initialAssetReference;
    v13->_initialAssetReference = (PXAssetReference *)v28;

    objc_storeStrong((id *)&v13->_searchQueryMatchInfo, a6);
  }

  return v13;
}

- (void)updateDataSourceWithFetchResult:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXSearchResultsOneUpViewModel dataSource](self, "dataSource");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setCollectionListFetchResult:", v4);

}

- (PXPhotoKitUIMediaProvider)mediaProvider
{
  return self->_mediaProvider;
}

- (void)setMediaProvider:(id)a3
{
  objc_storeStrong((id *)&self->_mediaProvider, a3);
}

- (PXAssetsDataSourceManager)dataSourceManager
{
  return self->_dataSourceManager;
}

- (void)setDataSourceManager:(id)a3
{
  objc_storeStrong((id *)&self->_dataSourceManager, a3);
}

- (PXPhotosDataSource)dataSource
{
  return self->_dataSource;
}

- (void)setDataSource:(id)a3
{
  objc_storeStrong((id *)&self->_dataSource, a3);
}

- (PXAssetReference)initialAssetReference
{
  return self->_initialAssetReference;
}

- (void)setInitialAssetReference:(id)a3
{
  objc_storeStrong((id *)&self->_initialAssetReference, a3);
}

- (PXSearchQueryMatchInfo)searchQueryMatchInfo
{
  return self->_searchQueryMatchInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchQueryMatchInfo, 0);
  objc_storeStrong((id *)&self->_initialAssetReference, 0);
  objc_storeStrong((id *)&self->_dataSource, 0);
  objc_storeStrong((id *)&self->_dataSourceManager, 0);
  objc_storeStrong((id *)&self->_mediaProvider, 0);
}

@end
