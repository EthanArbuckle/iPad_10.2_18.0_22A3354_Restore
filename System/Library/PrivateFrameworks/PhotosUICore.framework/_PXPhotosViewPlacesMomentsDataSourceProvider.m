@implementation _PXPhotosViewPlacesMomentsDataSourceProvider

- (_PXPhotosViewPlacesMomentsDataSourceProvider)initWithAllowedAssets:(id)a3 photoLibrary:(id)a4
{
  id v7;
  id v8;
  _PXPhotosViewPlacesMomentsDataSourceProvider *v9;
  _PXPhotosViewPlacesMomentsDataSourceProvider *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)_PXPhotosViewPlacesMomentsDataSourceProvider;
  v9 = -[_PXPhotosViewPlacesMomentsDataSourceProvider init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_assets, a3);
    objc_storeStrong((id *)&v10->_photoLibrary, a4);
  }

  return v10;
}

- (id)createInitialPhotosDataSourceForDataSourceManager:(id)a3
{
  id v4;
  PXPhotosDataSourceConfiguration *v5;
  void *v6;
  PXPhotosDataSourceConfiguration *v7;
  void *v8;
  PXPhotosDataSource *v9;

  v4 = a3;
  v5 = [PXPhotosDataSourceConfiguration alloc];
  objc_msgSend(MEMORY[0x1E0CD1620], "emptyFetchResultWithPhotoLibrary:", self->_photoLibrary);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PXPhotosDataSourceConfiguration initWithAssetFetchResult:options:](v5, "initWithAssetFetchResult:options:", v6, 0);

  objc_msgSend(v4, "filterPredicate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPhotosDataSourceConfiguration setFilterPredicate:](v7, "setFilterPredicate:", v8);
  v9 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v7);

  return v9;
}

- (id)loadInitialPhotosDataSourceForDataSourceManager:(id)a3
{
  id v4;
  id v5;
  NSFastEnumeration *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PXPhotosDataSourceConfiguration *v19;
  void *v20;
  PXPhotosDataSource *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v28;
  void *v29;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _QWORD v35[3];
  void *v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v6 = self->_assets;
  v7 = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v32;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v32 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v31 + 1) + 8 * v10), "objectID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSFastEnumeration countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v31, v37, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v5);
  v12 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setIncludePlacesSmartAlbum:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 2, 1000000203, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "firstObject");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("representativeDate"), 1);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = v28;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v36, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInternalSortDescriptors:", v17);

  objc_msgSend(MEMORY[0x1E0CD14D8], "fetchMomentsForAssetsWithOIDs:options:", v5, v14);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = -[PXPhotosDataSourceConfiguration initWithCollectionListFetchResult:containerCollection:options:]([PXPhotosDataSourceConfiguration alloc], "initWithCollectionListFetchResult:containerCollection:options:", v18, v16, 4097);
  v29 = (void *)v12;
  -[PXPhotosDataSourceConfiguration setAllowedOIDs:](v19, "setAllowedOIDs:", v12);
  v30 = v4;
  objc_msgSend(v4, "filterPredicate");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSourceConfiguration setFilterPredicate:](v19, "setFilterPredicate:", v20);

  v21 = -[PXPhotosDataSource initWithPhotosDataSourceConfiguration:]([PXPhotosDataSource alloc], "initWithPhotosDataSourceConfiguration:", v19);
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("dateCreated"), 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v22;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("addedDate"), 1);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v23;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v24;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 3);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPhotosDataSource setSortDescriptors:](v21, "setSortDescriptors:", v25);

  if (-[PXPhotosDataSource numberOfSections](v21, "numberOfSections") >= 1)
  {
    if (objc_msgSend(v16, "keyAssetsAtEnd"))
      v26 = -[PXPhotosDataSource numberOfSections](v21, "numberOfSections") - 1;
    else
      v26 = 0;
    -[PXPhotosDataSource forceAccurateSection:andSectionsBeforeAndAfter:](v21, "forceAccurateSection:andSectionsBeforeAndAfter:", v26, 10);
  }

  return v21;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_assets, 0);
}

@end
