@implementation PXWallpaperSmartAlbumPeoplePickerDataSource

- (id)peopleSuggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", &unk_1E53E9750);
}

- (void)computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[2];
  uint8_t buf[4];
  void *v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)MEMORY[0x1E0D77EF8];
  -[PXPassiveContentPeoplePickerDataSourceBase photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchPersonLocalIdentifiersForSuggestionSubtype:photoLibrary:", 602, v6);
  v7 = objc_claimAutoreleasedReturnValue();

  v35 = (void *)v7;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v7);
  objc_msgSend(v8, "minusSet:", v4);
  PLWallpaperGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v8;
    _os_log_impl(&dword_1A6789000, v9, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumPeoplePickerDataSource] TopPeople local identifiers: %{public}@", buf, 0xCu);
  }

  v10 = (void *)MEMORY[0x1E0D77EF8];
  -[PXPassiveContentPeoplePickerDataSourceBase photoLibrary](self, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "fetchPersonLocalIdentifiersForSuggestionSubtype:photoLibrary:", 652, v11);
  v12 = objc_claimAutoreleasedReturnValue();

  v34 = (void *)v12;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v12);
  v36 = v4;
  objc_msgSend(v13, "minusSet:", v4);
  PLWallpaperGetLog();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v13;
    _os_log_impl(&dword_1A6789000, v14, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumPeoplePickerDataSource] Shuffle People local identifiers: %{public}@", buf, 0xCu);
  }

  -[PXPassiveContentPeoplePickerDataSourceBase photoLibrary](self, "photoLibrary");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "librarySpecificFetchOptions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("manualOrder"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("faceCount"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setSortDescriptors:", v19);

  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v8);
  objc_msgSend(v20, "intersectSet:", v13);
  v21 = (void *)MEMORY[0x1E0CD16C0];
  objc_msgSend(v20, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "fetchPersonsWithLocalIdentifiers:options:", v22, v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPassiveContentPeoplePickerDataSourceBase setVipPersonsFetchResult:](self, "setVipPersonsFetchResult:", v23);
  objc_msgSend(v23, "fetchedObjects");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)objc_msgSend(v24, "copy");
  -[PXPassiveContentPeoplePickerDataSourceBase setVipPersons:](self, "setVipPersons:", v25);

  PLWallpaperGetLog();
  v26 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v20;
    _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumPeoplePickerDataSource] VIP: %{public}@", buf, 0xCu);
  }

  v27 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v13);
  objc_msgSend(v27, "minusSet:", v20);
  v28 = (void *)MEMORY[0x1E0CD16C0];
  objc_msgSend(v27, "allObjects");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "fetchPersonsWithLocalIdentifiers:options:", v29, v16);
  v30 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXPassiveContentPeoplePickerDataSourceBase setNonVIPPersonsFetchResult:](self, "setNonVIPPersonsFetchResult:", v30);
  objc_msgSend(v30, "fetchedObjects");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = (void *)objc_msgSend(v31, "copy");
  -[PXPassiveContentPeoplePickerDataSourceBase setNonVIPPersons:](self, "setNonVIPPersons:", v32);

  PLWallpaperGetLog();
  v33 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v39 = v27;
    _os_log_impl(&dword_1A6789000, v33, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumPeoplePickerDataSource] non-VIP: %{public}@", buf, 0xCu);
  }

}

@end
