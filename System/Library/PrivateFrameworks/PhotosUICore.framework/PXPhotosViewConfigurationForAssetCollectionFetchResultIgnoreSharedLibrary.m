@implementation PXPhotosViewConfigurationForAssetCollectionFetchResultIgnoreSharedLibrary

void ___PXPhotosViewConfigurationForAssetCollectionFetchResultIgnoreSharedLibrary_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v3 = a2;
  v10 = v3;
  if (*(_QWORD *)(a1 + 32))
  {
    objc_msgSend(v3, "setPhotoLibrary:");
    v3 = v10;
  }
  v4 = *(unsigned __int8 *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 40);
  objc_msgSend(v3, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXContentFilterState defaultFilterStateForContainerCollection:photoLibrary:](PXContentFilterState, "defaultFilterStateForContainerCollection:photoLibrary:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "predicateForUseCase:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFilterPredicate:", v8);

  objc_msgSend(v10, "setIgnoreSharedLibraryFilters:", *(unsigned __int8 *)(a1 + 65));
  if (*(_BYTE *)(a1 + 65))
  {
    objc_msgSend(v10, "setLibraryFilterState:", 0);
    objc_msgSend(v10, "setLibraryFilter:", 0);
  }
  if (*(_QWORD *)(a1 + 48))
  {
    +[PXPeopleUtilities peopleArrayFromFastEnumeration:](PXPeopleUtilities, "peopleArrayFromFastEnumeration:");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFilterPersons:", v9);

  }
  else
  {
    objc_msgSend(v10, "setFilterPersons:");
  }
  objc_msgSend(v10, "setFilterSocialGroup:", *(_QWORD *)(a1 + 56));

}

PXPhotoKitAssetsDataSourceManager *___PXPhotosViewConfigurationForAssetCollectionFetchResultIgnoreSharedLibrary_block_invoke_2(uint64_t a1)
{
  PXPhotosDataSourceConfiguration *v2;
  PXPhotosDataSource *v3;
  PXPhotoKitAssetsDataSourceManager *v4;

  v2 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:containerCollection:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:containerCollection:options:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 80));
  (*(void (**)(void))(*(_QWORD *)(a1 + 64) + 16))();
  -[PXPhotosDataSourceConfiguration setFetchPropertySets:](v2, "setFetchPropertySets:", *(_QWORD *)(a1 + 48));
  -[PXPhotosDataSourceConfiguration setExistingKeyAssetsFetchResults:](v2, "setExistingKeyAssetsFetchResults:", *(_QWORD *)(a1 + 56));
  -[PXPhotosDataSourceConfiguration setWantsCurationByDefault:](v2, "setWantsCurationByDefault:", *(unsigned __int8 *)(a1 + 88));
  -[PXPhotosDataSourceConfiguration setAssetContainerProvider:](v2, "setAssetContainerProvider:", *(_QWORD *)(a1 + 72));
  -[PXPhotosDataSourceConfiguration setReverseSortOrder:](v2, "setReverseSortOrder:", *(unsigned __int8 *)(a1 + 89));
  v3 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v2);
  v4 = -[PXPhotoKitAssetsDataSourceManager initWithPhotosDataSource:]([PXPhotoKitAssetsDataSourceManager alloc], "initWithPhotosDataSource:", v3);

  return v4;
}

@end
