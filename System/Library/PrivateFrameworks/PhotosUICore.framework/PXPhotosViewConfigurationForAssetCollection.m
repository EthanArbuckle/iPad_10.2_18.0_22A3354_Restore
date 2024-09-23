@implementation PXPhotosViewConfigurationForAssetCollection

id ___PXPhotosViewConfigurationForAssetCollection_block_invoke(uint64_t a1)
{
  id v2;
  int v3;
  uint64_t v4;
  _BOOL4 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v11;

  v2 = *(id *)(a1 + 32);
  if (objc_msgSend(v2, "px_isRegularAlbum"))
  {

LABEL_4:
    v4 = 32;
    goto LABEL_6;
  }
  v3 = objc_msgSend(v2, "px_isMemory");

  if (v3)
    goto LABEL_4;
  v4 = 0;
LABEL_6:
  v5 = +[PXLemonadeSettings isLemonadeUIEnabled](PXLemonadeSettings, "isLemonadeUIEnabled");
  v6 = v4 | 0x1010;
  if (!v5)
    v6 = v4;
  v7 = *(_QWORD *)(a1 + 64);
  v8 = v6 | 0x400000;
  if (v7 == 1)
    v6 |= 0x100000uLL;
  if (v7 == 2)
    v9 = v8;
  else
    v9 = v6;
  LOWORD(v11) = *(_WORD *)(a1 + 72);
  return +[PXPhotoKitAssetsDataSourceManager dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:reverseSortOrder:](PXPhotoKitAssetsDataSourceManager, "dataSourceManagerForAssetCollection:existingAssetsFetchResult:existingKeyAssetsFetchResult:fetchPropertySets:basePredicate:options:ignoreSharedLibraryFilters:reverseSortOrder:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), 0, v9, v11);
}

@end
