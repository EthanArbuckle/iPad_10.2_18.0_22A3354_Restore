@implementation PXPhotosViewConfigurationForImagePickerWithAssetCollectionFetchResult

PXPhotoKitAssetsDataSourceManager *__PXPhotosViewConfigurationForImagePickerWithAssetCollectionFetchResult_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  PXPhotosDataSourceConfiguration *v6;
  PXPhotosDataSource *v7;
  PXPhotoKitAssetsDataSourceManager *v8;

  v2 = 1027;
  if (!*(_BYTE *)(a1 + 80))
    v2 = 3;
  if (*(_BYTE *)(a1 + 81))
    v2 = 66563;
  v3 = *(_QWORD *)(a1 + 72);
  v4 = v2 | 0x400000;
  if (v3 == 1)
    v2 |= 0x100000uLL;
  if (v3 == 2)
    v5 = v4;
  else
    v5 = v2;
  v6 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:containerCollection:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:containerCollection:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5);
  -[PXPhotosDataSourceConfiguration setReverseSortOrder:](v6, "setReverseSortOrder:", *(unsigned __int8 *)(a1 + 82));
  -[PXPhotosDataSourceConfiguration setBasePredicate:](v6, "setBasePredicate:", *(_QWORD *)(a1 + 48));
  -[PXPhotosDataSourceConfiguration setFilterPredicate:](v6, "setFilterPredicate:", *(_QWORD *)(a1 + 56));
  v7 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v6);
  if (objc_msgSend(*(id *)(a1 + 64), "count"))
    -[PXPhotosDataSource setSortDescriptors:](v7, "setSortDescriptors:", *(_QWORD *)(a1 + 64));
  v8 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v7);

  return v8;
}

@end
