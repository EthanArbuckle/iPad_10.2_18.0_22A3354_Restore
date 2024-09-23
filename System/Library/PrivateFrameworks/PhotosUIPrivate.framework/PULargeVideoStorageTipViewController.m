@implementation PULargeVideoStorageTipViewController

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  -[PULargeVideoStorageTipViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_opt_class();
  v7 = objc_opt_class();

  if (v6 != v7)
  {
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "postNotificationName:object:", CFSTR("PUStorageManagementICPLEnableTipSizeRefreshRequired"), 0);

  }
  v9.receiver = self;
  v9.super_class = (Class)PULargeVideoStorageTipViewController;
  -[PULargeVideoStorageTipViewController viewDidDisappear:](&v9, sel_viewDidDisappear_, v3);
}

- (id)photosViewConfigurationWithShouldExpunge:(BOOL)a3
{
  void *v5;
  void *v6;

  PXPhotosViewConfigurationForDataSourceProvider();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  StorageTipPXPhotosViewConfigurationForConfiguration(v5, a3);
  objc_claimAutoreleasedReturnValue();

  -[PULargeVideoStorageTipViewController title](self, "title");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setTitle:", v6);

  return v5;
}

- (id)title
{
  return PULocalizedString(CFSTR("STORAGE_MANAGEMENT_REVIEW_LARGE_VIDEOS_ALBUM_TITLE"));
}

- (id)createInitialPhotosDataSourceForDataSourceManager:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (objc_class *)MEMORY[0x1E0D7B790];
  v5 = a3;
  v6 = [v4 alloc];
  v7 = (void *)MEMORY[0x1E0CD1620];
  -[PUStorageManagementBaseController photoLibrary](self, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "emptyFetchResultWithPhotoLibrary:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v6, "initWithAssetFetchResult:options:", v9, 0);

  objc_msgSend(v5, "filterPredicate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setFilterPredicate:", v11);
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v10);

  return v12;
}

- (id)loadInitialPhotosDataSourceForDataSourceManager:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v18[2];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUStorageManagementUtility storageTipAssetFetchOptionsForType:photoLibrary:](PUStorageManagementUtility, "storageTipAssetFetchOptionsForType:photoLibrary:", 2, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("additionalAttributes.originalFilesize"), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalSortDescriptors:", v7);

  v8 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(v5, "internalPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PUStorageManagementUtility predicateForMinimumVideoSize](PUStorageManagementUtility, "predicateForMinimumVideoSize", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v18[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v18, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v12);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithMediaType:options:", 2, v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B790]), "initWithAssetFetchResult:options:", v13, 4097);
  objc_msgSend(v3, "filterPredicate");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setFilterPredicate:", v15);
  v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D7B788]), "initWithPhotosDataSourceConfiguration:", v14);

  return v16;
}

@end
