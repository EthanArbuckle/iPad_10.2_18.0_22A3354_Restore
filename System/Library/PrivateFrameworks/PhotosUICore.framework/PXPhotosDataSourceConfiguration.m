@implementation PXPhotosDataSourceConfiguration

- (void)setLibraryFilterState:(id)a3
{
  objc_storeStrong((id *)&self->_libraryFilterState, a3);
}

- (void)setLibraryFilter:(int64_t)a3
{
  self->_libraryFilter = a3;
}

- (void)setFilterPredicate:(id)a3
{
  objc_storeStrong((id *)&self->_filterPredicate, a3);
}

- (void)setCanIncludeUnsavedSyndicatedAssets:(BOOL)a3
{
  self->_canIncludeUnsavedSyndicatedAssets = a3;
}

- (PXPhotosDataSourceConfiguration)initWithCollectionListFetchResult:(id)a3 options:(unint64_t)a4
{
  return -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:containerCollection:options:](self, "initWithCollectionListFetchResult:containerCollection:options:", a3, 0, a4);
}

- (BOOL)wantsCurationByDefault
{
  return self->_wantsCurationByDefault;
}

- (BOOL)reverseSortOrder
{
  return self->_reverseSortOrder;
}

- (PHAsset)referenceAsset
{
  return self->_referenceAsset;
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (unint64_t)options
{
  return self->_options;
}

- (int64_t)libraryFilter
{
  return self->_libraryFilter;
}

- (PXLibraryFilterState)libraryFilterState
{
  return self->_libraryFilterState;
}

- (BOOL)ignoreSharedLibraryFilters
{
  return self->_ignoreSharedLibraryFilters;
}

- (BOOL)hideHiddenAssets
{
  return self->_hideHiddenAssets;
}

- (NSPredicate)filterPredicate
{
  return self->_filterPredicate;
}

- (NSArray)filterPersons
{
  return self->_filterPersons;
}

- (NSArray)fetchPropertySets
{
  return self->_fetchPropertySets;
}

- (NSDictionary)existingKeyAssetsFetchResults
{
  return self->_existingKeyAssetsFetchResults;
}

- (NSDictionary)existingAssetCollectionFetchResults
{
  return self->_existingAssetCollectionFetchResults;
}

- (int64_t)curationType
{
  return self->_curationType;
}

- (PHCollection)containerCollection
{
  return self->_containerCollection;
}

- (PHFetchResult)collectionListFetchResult
{
  return self->_collectionListFetchResult;
}

- (OS_dispatch_queue)clientQueue
{
  return self->_clientQueue;
}

- (BOOL)canIncludeUnsavedSyndicatedAssets
{
  return self->_canIncludeUnsavedSyndicatedAssets;
}

- (NSPredicate)basePredicate
{
  return self->_basePredicate;
}

- (NSSet)allowedUUIDs
{
  return self->_allowedUUIDs;
}

- (NSSet)allowedOIDs
{
  return self->_allowedOIDs;
}

- (void)setWantsCurationByDefault:(BOOL)a3
{
  self->_wantsCurationByDefault = a3;
}

- (void)setFetchPropertySets:(id)a3
{
  objc_storeStrong((id *)&self->_fetchPropertySets, a3);
}

- (PXPhotosDataSourceConfiguration)initWithCollectionListFetchResult:(id)a3 containerCollection:(id)a4 options:(unint64_t)a5
{
  id v9;
  id v10;
  PXPhotosDataSourceConfiguration *v11;
  PXPhotosDataSourceConfiguration *v12;
  void *v13;
  void *v14;
  PHPhotoLibrary *v15;
  PHPhotoLibrary *photoLibrary;
  void *v17;
  PXLibraryFilterState *v18;
  PXLibraryFilterState *libraryFilterState;
  objc_super v21;

  v9 = a3;
  v10 = a4;
  v21.receiver = self;
  v21.super_class = (Class)PXPhotosDataSourceConfiguration;
  v11 = -[PXPhotosDataSourceConfiguration init](&v21, sel_init);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_collectionListFetchResult, a3);
    objc_storeStrong((id *)&v12->_containerCollection, a4);
    v12->_options = a5;
    objc_msgSend(v9, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v13)
    {
      v15 = v13;
    }
    else
    {
      objc_msgSend(v10, "photoLibrary");
      v15 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
    }
    photoLibrary = v12->_photoLibrary;
    v12->_photoLibrary = v15;

    v12->_ignoreSharedLibraryFilters = 0;
    +[PXSharedLibraryStatusProvider sharedLibraryStatusProviderWithPhotoLibrary:](PXSharedLibraryStatusProvider, "sharedLibraryStatusProviderWithPhotoLibrary:", v12->_photoLibrary);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PXLibraryFilterState initWithSharedLibraryStatusProvider:]([PXLibraryFilterState alloc], "initWithSharedLibraryStatusProvider:", v17);
    libraryFilterState = v12->_libraryFilterState;
    v12->_libraryFilterState = v18;

    v12->_libraryFilter = 0;
    v12->_curationKind = 1;

  }
  return v12;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_assetContainerProvider, 0);
  objc_storeStrong((id *)&self->_libraryFilterState, 0);
  objc_storeStrong((id *)&self->_clientQueue, 0);
  objc_storeStrong((id *)&self->_fetchPropertySets, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_filterSocialGroup, 0);
  objc_storeStrong((id *)&self->_filterPersons, 0);
  objc_storeStrong((id *)&self->_allowedOIDs, 0);
  objc_storeStrong((id *)&self->_allowedUUIDs, 0);
  objc_storeStrong((id *)&self->_sortDescriptors, 0);
  objc_storeStrong((id *)&self->_filterPredicate, 0);
  objc_storeStrong((id *)&self->_basePredicate, 0);
  objc_storeStrong((id *)&self->_referenceAsset, 0);
  objc_storeStrong((id *)&self->_existingKeyAssetsFetchResults, 0);
  objc_storeStrong((id *)&self->_existingAssetCollectionFetchResults, 0);
  objc_storeStrong((id *)&self->_containerCollection, 0);
  objc_storeStrong((id *)&self->_collectionListFetchResult, 0);
}

- (PXPhotosDataSourceConfiguration)init
{
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPhotosDataSource.m"), 4126, CFSTR("Use the designated initializer \"-initWithCollectionListFetchResult:options:\"));

  abort();
}

- (PXPhotosDataSourceConfiguration)initWithAssetFetchResult:(id)a3 options:(unint64_t)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PXPhotosDataSourceConfiguration *v11;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD13B8], "transientAssetCollectionWithAssetFetchResult:title:", a3, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CD14E0];
  v13[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "transientCollectionListWithCollections:title:", v8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v9, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:](self, "initWithCollectionListFetchResult:options:", v10, a4);

  return v11;
}

- (PXPhotosDataSourceConfiguration)initWithAssetCollection:(id)a3 options:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  PXPhotosDataSourceConfiguration *v16;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  if (objc_msgSend(v6, "isTransient"))
  {
    v7 = (void *)MEMORY[0x1E0CD14E0];
    v19[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "transientCollectionListWithCollections:title:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchCollectionsInCollectionList:options:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(v6, "objectID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v9;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
    v12 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_opt_class();

    objc_msgSend(v14, "fetchType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(v11, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v12, v13, v15, 0, 0, 1);

    v6 = (id)v12;
  }

  v16 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:options:](self, "initWithCollectionListFetchResult:options:", v10, a4);
  return v16;
}

- (void)setExistingAssetCollectionFetchResults:(id)a3
{
  objc_storeStrong((id *)&self->_existingAssetCollectionFetchResults, a3);
}

- (void)setExistingKeyAssetsFetchResults:(id)a3
{
  objc_storeStrong((id *)&self->_existingKeyAssetsFetchResults, a3);
}

- (void)setReferenceAsset:(id)a3
{
  objc_storeStrong((id *)&self->_referenceAsset, a3);
}

- (void)setBasePredicate:(id)a3
{
  objc_storeStrong((id *)&self->_basePredicate, a3);
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return self->_includeOthersInSocialGroupAssets;
}

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
  self->_includeOthersInSocialGroupAssets = a3;
}

- (NSArray)sortDescriptors
{
  return self->_sortDescriptors;
}

- (void)setSortDescriptors:(id)a3
{
  objc_storeStrong((id *)&self->_sortDescriptors, a3);
}

- (void)setAllowedUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_allowedUUIDs, a3);
}

- (void)setAllowedOIDs:(id)a3
{
  objc_storeStrong((id *)&self->_allowedOIDs, a3);
}

- (void)setFilterPersons:(id)a3
{
  objc_storeStrong((id *)&self->_filterPersons, a3);
}

- (PHSocialGroup)filterSocialGroup
{
  return self->_filterSocialGroup;
}

- (void)setFilterSocialGroup:(id)a3
{
  objc_storeStrong((id *)&self->_filterSocialGroup, a3);
}

- (void)setHideHiddenAssets:(BOOL)a3
{
  self->_hideHiddenAssets = a3;
}

- (void)setPhotoLibrary:(id)a3
{
  objc_storeStrong((id *)&self->_photoLibrary, a3);
}

- (void)setCurationType:(int64_t)a3
{
  self->_curationType = a3;
}

- (int64_t)curationKind
{
  return self->_curationKind;
}

- (void)setCurationKind:(int64_t)a3
{
  self->_curationKind = a3;
}

- (void)setClientQueue:(id)a3
{
  objc_storeStrong((id *)&self->_clientQueue, a3);
}

- (void)setReverseSortOrder:(BOOL)a3
{
  self->_reverseSortOrder = a3;
}

- (void)setIgnoreSharedLibraryFilters:(BOOL)a3
{
  self->_ignoreSharedLibraryFilters = a3;
}

- (BOOL)includeAllBurstAssets
{
  return self->_includeAllBurstAssets;
}

- (void)setIncludeAllBurstAssets:(BOOL)a3
{
  self->_includeAllBurstAssets = a3;
}

- (id)assetContainerProvider
{
  return self->_assetContainerProvider;
}

- (void)setAssetContainerProvider:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 176);
}

@end
