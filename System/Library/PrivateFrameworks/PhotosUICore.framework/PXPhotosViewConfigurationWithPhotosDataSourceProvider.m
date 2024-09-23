@implementation PXPhotosViewConfigurationWithPhotosDataSourceProvider

PXPhotoKitAssetsDataSourceManager *___PXPhotosViewConfigurationWithPhotosDataSourceProvider_block_invoke(uint64_t a1)
{
  PXPhotoKitAssetsDataSourceManager *v2;
  id v3;
  uint64_t v4;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v2 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSourceProvider:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSourceProvider:", *(_QWORD *)(a1 + 32));
  -[PXPhotoKitAssetsDataSourceManager setLibraryFilter:](v2, "setLibraryFilter:", *(_QWORD *)(a1 + 48));
  -[PXPhotoKitAssetsDataSourceManager setIgnoreSharedLibraryFilters:](v2, "setIgnoreSharedLibraryFilters:", *(unsigned __int8 *)(a1 + 64));
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = ___PXPhotosViewConfigurationWithPhotosDataSourceProvider_block_invoke_2;
  v6[3] = &unk_1E5145FB0;
  v3 = *(id *)(a1 + 40);
  v4 = *(_QWORD *)(a1 + 56);
  v7 = v3;
  v8 = v4;
  -[PXPhotoKitAssetsDataSourceManager performChanges:](v2, "performChanges:", v6);

  return v2;
}

void ___PXPhotosViewConfigurationWithPhotosDataSourceProvider_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  id v4;
  void *v5;
  id v6;

  v3 = *(_QWORD *)(a1 + 32);
  v4 = a2;
  +[PXContentFilterState defaultFilterStateForContainerCollection:photoLibrary:](PXContentFilterState, "defaultFilterStateForContainerCollection:photoLibrary:", 0, v3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "predicateForUseCase:", *(_QWORD *)(a1 + 40));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setFilterPredicate:", v5);

}

@end
