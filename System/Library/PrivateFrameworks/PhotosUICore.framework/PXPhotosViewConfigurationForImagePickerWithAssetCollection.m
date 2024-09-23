@implementation PXPhotosViewConfigurationForImagePickerWithAssetCollection

id __PXPhotosViewConfigurationForImagePickerWithAssetCollection_block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v5;

  v1 = *(_QWORD *)(a1 + 48);
  v2 = 1027;
  if (v1 == 1)
    v2 = 1049603;
  if (v1 == 2)
    v3 = 4195331;
  else
    v3 = v2;
  BYTE1(v5) = *(_BYTE *)(a1 + 56);
  LOBYTE(v5) = 0;
  return +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:reverseSortOrder:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:reverseSortOrder:", *(_QWORD *)(a1 + 32), 0, 0, 0, *(_QWORD *)(a1 + 40), v3, v5);
}

@end
