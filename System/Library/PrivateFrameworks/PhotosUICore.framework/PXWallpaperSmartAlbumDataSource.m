@implementation PXWallpaperSmartAlbumDataSource

- (PXWallpaperSmartAlbumDataSource)initWithPhotoLibrary:(id)a3 changeObserver:(id)a4 centerMedia:(id)a5
{
  return -[PXWallpaperSmartAlbumDataSource initWithPhotoLibrary:changeObserver:registerForPhotoLibraryChanges:centerMedia:](self, "initWithPhotoLibrary:changeObserver:registerForPhotoLibraryChanges:centerMedia:", a3, a4, 1, a5);
}

- (PXWallpaperSmartAlbumDataSource)initWithPhotoLibrary:(id)a3 changeObserver:(id)a4 registerForPhotoLibraryChanges:(BOOL)a5 centerMedia:(id)a6
{
  _BOOL4 v7;
  id v10;
  id v11;
  PXWallpaperSmartAlbumDataSource *v12;
  PXWallpaperSmartAlbumDataSource *v13;
  objc_super v15;

  v7 = a5;
  v10 = a3;
  v11 = a6;
  v15.receiver = self;
  v15.super_class = (Class)PXWallpaperSmartAlbumDataSource;
  v12 = -[PXPassiveContentDataSourceBase initWithPhotoLibrary:changeObserver:](&v15, sel_initWithPhotoLibrary_changeObserver_, v10, a4);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_centerMedia, a6);
    if (v7)
      objc_msgSend(v10, "registerChangeObserver:", v13);
  }

  return v13;
}

- (void)fetchSuggestions
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = (void *)objc_opt_class();
  -[PXPassiveContentDataSourceBase photoLibrary](self, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "baseSuggestionFetchOptionsForPhotoLibrary:", v4);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend((id)objc_opt_class(), "fetchSuggestionsWithSubtype:options:", 652, v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = *MEMORY[0x1E0D78190];
  objc_msgSend(MEMORY[0x1E0D77EF8], "randomizedSuggestionsFromSuggestions:limit:", v5, *MEMORY[0x1E0D78190]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPassiveContentDataSourceBase setPeopleSuggestions:](self, "setPeopleSuggestions:", v7);

  objc_msgSend((id)objc_opt_class(), "fetchSuggestionsWithSubtype:options:", 653, v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77EF8], "randomizedSuggestionsFromSuggestions:limit:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPassiveContentDataSourceBase setPetSuggestions:](self, "setPetSuggestions:", v9);

  objc_msgSend((id)objc_opt_class(), "fetchSuggestionsWithSubtype:options:", 654, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77EF8], "randomizedSuggestionsFromSuggestions:limit:", v10, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPassiveContentDataSourceBase setLandscapeSuggestions:](self, "setLandscapeSuggestions:", v11);

  objc_msgSend((id)objc_opt_class(), "fetchSuggestionsWithSubtype:options:", 655, v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77EF8], "randomizedSuggestionsFromSuggestions:limit:", v12, v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPassiveContentDataSourceBase setCityscapeSuggestions:](self, "setCityscapeSuggestions:", v13);

}

- (id)fetchSuggestionsForPersonLocalIdentifier:(id)a3
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXWallpaperSmartAlbumDataSource;
  -[PXPassiveContentDataSourceBase fetchSuggestionsForPersonLocalIdentifier:](&v6, sel_fetchSuggestionsForPersonLocalIdentifier_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77EF8], "randomizedSuggestionsFromSuggestions:limit:", v3, *MEMORY[0x1E0D78190]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setupPreviewAssets
{
  NSObject *v3;
  _QWORD block[5];

  -[PXPassiveContentDataSourceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __53__PXWallpaperSmartAlbumDataSource_setupPreviewAssets__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v3, block);

}

- (BOOL)shouldIncludeCenterMediaWithPreviewAssets:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  unint64_t v8;
  int v9;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  -[PXWallpaperSmartAlbumDataSource centerMedia](self, "centerMedia");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v7 = v5;
    v16 = v7;
    if ((PXExists() & 1) != 0)
    {
      LOBYTE(self) = 1;
    }
    else
    {
      v8 = -[PXPassiveContentDataSourceBase selectedTypes](self, "selectedTypes");
      v9 = objc_msgSend(v7, "suggestionSubtype");
      switch(v9)
      {
        case 602:
LABEL_8:
          if ((v8 & 1) != 0)
          {
            -[PXWallpaperSmartAlbumDataSource workQueue_centerSuggestion](self, "workQueue_centerSuggestion");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v11;
            if (v11
              && (objc_msgSend(v11, "context"), v13 = (void *)objc_claimAutoreleasedReturnValue(),
                                                v13,
                                                v13))
            {
              -[PXPassiveContentDataSourceBase peopleLocalIdentifiers](self, "peopleLocalIdentifiers");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v12, "context");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              LOBYTE(self) = objc_msgSend(v14, "containsObject:", v15);

            }
            else
            {
              LOBYTE(self) = 0;
            }

          }
          else
          {
LABEL_9:
            LOBYTE(self) = 0;
          }
          break;
        case 603:
LABEL_10:
          self = (PXWallpaperSmartAlbumDataSource *)((v8 >> 1) & 1);
          break;
        case 604:
LABEL_11:
          self = (PXWallpaperSmartAlbumDataSource *)((v8 >> 2) & 1);
          break;
        case 605:
LABEL_12:
          self = (PXWallpaperSmartAlbumDataSource *)((v8 >> 3) & 1);
          break;
        default:
          switch(v9)
          {
            case 652:
              goto LABEL_8;
            case 653:
              goto LABEL_10;
            case 654:
              goto LABEL_11;
            case 655:
              goto LABEL_12;
            default:
              goto LABEL_9;
          }
      }
    }

  }
  else
  {
    LOBYTE(self) = 0;
  }

  return (char)self;
}

- (PHSuggestion)workQueue_centerSuggestion
{
  NSObject *v3;
  void *v4;
  PHSuggestion *workQueue_centerSuggestion;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  PHSuggestion *v13;
  PHSuggestion *v14;
  NSObject *v15;
  void *v16;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[PXPassiveContentDataSourceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v3);

  -[PXWallpaperSmartAlbumDataSource centerMedia](self, "centerMedia");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    return (PHSuggestion *)0;
  workQueue_centerSuggestion = self->_workQueue_centerSuggestion;
  if (!workQueue_centerSuggestion)
  {
    -[PXPassiveContentDataSourceBase photoLibrary](self, "photoLibrary");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "librarySpecificFetchOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x1E0CB3880];
    -[PXWallpaperSmartAlbumDataSource centerMedia](self, "centerMedia");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "suggestionUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("uuid"), v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPredicate:", v11);

    objc_msgSend(v7, "setFetchLimit:", 1);
    objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "firstObject");
    v13 = (PHSuggestion *)objc_claimAutoreleasedReturnValue();
    v14 = self->_workQueue_centerSuggestion;
    self->_workQueue_centerSuggestion = v13;

    if (!self->_workQueue_centerSuggestion)
    {
      PLWallpaperGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        -[PXWallpaperSmartAlbumDataSource centerMedia](self, "centerMedia");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        v19 = v16;
        _os_log_impl(&dword_1A6789000, v15, OS_LOG_TYPE_ERROR, "[PXWallpaperSmartAlbumDataSource] Cannot find suggestion for centerMedia %@", buf, 0xCu);

      }
    }

    workQueue_centerSuggestion = self->_workQueue_centerSuggestion;
  }
  return workQueue_centerSuggestion;
}

- (id)customPeopleSuggestions
{
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t j;
  void *v23;
  void *v24;
  uint64_t v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  -[PXPassiveContentDataSourceBase peopleLocalIdentifiers](self, "peopleLocalIdentifiers");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v32;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v32 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * i);
        -[PXPassiveContentDataSourceBase personSuggestionsByPersonLocalIdentifier](self, "personSuggestionsByPersonLocalIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v12, "count"))
        {
          v13 = objc_alloc(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v12, "fetchedObjects");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          v15 = (void *)objc_msgSend(v13, "initWithArray:", v14);

          objc_msgSend(v4, "addObject:", v15);
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    }
    while (v7);
  }

  v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  do
  {
    v17 = (void *)objc_msgSend(v4, "copy");
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = v17;
    v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v20; ++j)
        {
          if (*(_QWORD *)v28 != v21)
            objc_enumerationMutation(v18);
          v23 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * j);
          objc_msgSend(v23, "firstObject");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            objc_msgSend(v16, "addObject:", v24);
            objc_msgSend(v23, "removeObject:", v24);
          }
          if (!objc_msgSend(v23, "count"))
            objc_msgSend(v4, "removeObject:", v23);

        }
        v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v20);
    }

    v25 = objc_msgSend(v4, "count");
  }
  while (v25);

  return v16;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PXWallpaperSmartAlbumDataSource *v9;

  v4 = a3;
  -[PXPassiveContentDataSourceBase workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __57__PXWallpaperSmartAlbumDataSource_photoLibraryDidChange___block_invoke;
  v7[3] = &unk_1E5148D08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)fetchAssetIfNeededForAssetUUID:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  NSObject *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint8_t buf[4];
  id v29;
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPassiveContentDataSourceBase keyAssetBySuggestionUUID](self, "keyAssetBySuggestionUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allValues");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v6, "copy");

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v8 = v7;
  v9 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v25;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v25 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v13, "uuid", (_QWORD)v24);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", v4);

        if ((v15 & 1) != 0)
        {
          v21 = v13;
          v22 = v8;
          goto LABEL_14;
        }
      }
      v10 = -[NSObject countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
      if (v10)
        continue;
      break;
    }
  }

  v16 = (void *)MEMORY[0x1E0CD1390];
  v30 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v30, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXPassiveContentDataSourceBase photoLibrary](self, "photoLibrary");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "librarySpecificFetchOptions");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchAssetsWithUUIDs:options:", v17, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "firstObject");
  v21 = (id)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    PLWallpaperGetLog();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v4;
      _os_log_impl(&dword_1A6789000, v22, OS_LOG_TYPE_ERROR, "[PXWallpaperSmartAlbumDataSource] Missing Key Asset for CenterMedia %@", buf, 0xCu);
    }
    v21 = 0;
LABEL_14:

  }
  return v21;
}

- (id)fetchShuffleSuggestionContainingAsset:(id)a3
{
  id v4;
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
  NSObject *v16;
  uint8_t buf[4];
  id v19;
  id v20;
  _QWORD v21[3];

  v21[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PXPassiveContentDataSourceBase photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v8;
  objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllShuffleWallpaperSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v11);

  v12 = (void *)MEMORY[0x1E0CD13B8];
  v20 = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v20, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchAssetCollectionsContainingAssets:withType:options:", v13, 8, v6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "firstObject");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    PLWallpaperGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v19 = v4;
      _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_ERROR, "[PXWallpaperSmartAlbumDataSource] Cannot find suggestion with asset: %@", buf, 0xCu);
    }

  }
  return v15;
}

- (NSDictionary)classificationByPreviewAssetUUID
{
  return (NSDictionary *)objc_getProperty(self, a2, 128, 1);
}

- (void)setClassificationByPreviewAssetUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (NSDictionary)shuffleSuggestionByKeyAssetUUID
{
  return (NSDictionary *)objc_getProperty(self, a2, 136, 1);
}

- (void)setShuffleSuggestionByKeyAssetUUID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 136);
}

- (PFPosterMediaSuggestion)centerMedia
{
  return self->_centerMedia;
}

- (void)setWorkQueue_centerSuggestion:(id)a3
{
  objc_storeStrong((id *)&self->_workQueue_centerSuggestion, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_workQueue_centerSuggestion, 0);
  objc_storeStrong((id *)&self->_centerMedia, 0);
  objc_storeStrong((id *)&self->_shuffleSuggestionByKeyAssetUUID, 0);
  objc_storeStrong((id *)&self->_classificationByPreviewAssetUUID, 0);
}

void __57__PXWallpaperSmartAlbumDataSource_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "peopleSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeDetailsForFetchResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(v4, "fetchResultAfterChanges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setPeopleSuggestions:", v5);

    v6 = 1;
  }
  else
  {
    v6 = 0;
  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "petSuggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeDetailsForFetchResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "fetchResultAfterChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setPetSuggestions:", v10);

    v6 = 1;
  }
  v11 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "landscapeSuggestions");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "changeDetailsForFetchResult:", v12);
  v14 = (id)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    objc_msgSend(v14, "fetchResultAfterChanges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setLandscapeSuggestions:", v13);

LABEL_9:
    objc_msgSend(*(id *)(a1 + 40), "setupPreviewAssets");
    goto LABEL_10;
  }
  if (v6)
    goto LABEL_9;
LABEL_10:

}

uint64_t __77__PXWallpaperSmartAlbumDataSource_shouldIncludeCenterMediaWithPreviewAssets___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a2, "uuid");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "assetUUID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", v4);

  return v5;
}

void __53__PXWallpaperSmartAlbumDataSource_setupPreviewAssets__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  void *v7;
  id v8;
  void (**v9)(void *, void *, void *);
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  char *v18;
  char *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  NSObject *v25;
  int v26;
  unint64_t v27;
  NSObject *v28;
  const char *v29;
  NSObject *v30;
  os_log_type_t v31;
  uint32_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint32_t numer;
  uint32_t denom;
  NSObject *v39;
  NSObject *v40;
  uint64_t v41;
  os_signpost_id_t spid;
  NSObject *v43;
  unint64_t v44;
  id obj;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  _QWORD aBlock[6];
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint8_t buf[8];
  uint8_t *v58;
  uint64_t v59;
  uint64_t (*v60)(uint64_t, uint64_t);
  void (*v61)(uint64_t);
  id v62;
  mach_timebase_info info;
  uint8_t v64[4];
  const char *v65;
  __int16 v66;
  double v67;
  _BYTE v68[128];
  uint64_t v69;

  v69 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  spid = v3;
  v44 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "SetupPreviewAssets", ", buf, 2u);
  }
  v43 = v5;

  info = 0;
  mach_timebase_info(&info);
  v41 = mach_absolute_time();
  v6 = objc_msgSend(*(id *)(a1 + 32), "selectedTypes");
  objc_msgSend(*(id *)(a1 + 32), "combineSuggestionsForSelectedTypes:maxCount:", v6, *MEMORY[0x1E0D78190]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  *(_QWORD *)buf = 0;
  v58 = buf;
  v59 = 0x3032000000;
  v60 = __Block_byref_object_copy__144324;
  v61 = __Block_byref_object_dispose__144325;
  v62 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__144324;
  v55 = __Block_byref_object_dispose__144325;
  v56 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __53__PXWallpaperSmartAlbumDataSource_setupPreviewAssets__block_invoke_165;
  aBlock[3] = &unk_1E512D4F8;
  aBlock[4] = buf;
  aBlock[5] = &v51;
  v9 = (void (**)(void *, void *, void *))_Block_copy(aBlock);
  v48 = 0u;
  v49 = 0u;
  v46 = 0u;
  v47 = 0u;
  obj = v7;
  v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v68, 16);
  if (v10)
  {
    v11 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v47 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * i);
        objc_msgSend(*(id *)(a1 + 32), "keyAssetBySuggestionUUID");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "uuid");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "objectForKeyedSubscript:", v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();

        if (v16)
        {
          objc_msgSend(v8, "addObject:", v16);
          v9[2](v9, v13, v16);
        }
        else
        {
          PLWallpaperGetLog();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "uuid");
            v18 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v64 = 138412290;
            v65 = v18;
            _os_log_impl(&dword_1A6789000, v17, OS_LOG_TYPE_ERROR, "[PXWallpaperSmartAlbumDataSource] Missing Key Asset for Suggestion %@", v64, 0xCu);

          }
        }

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v46, v68, 16);
    }
    while (v10);
  }

  objc_msgSend(*(id *)(a1 + 32), "centerMedia");
  v19 = (char *)objc_claimAutoreleasedReturnValue();
  PLWallpaperGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v64 = 138412290;
    v65 = v19;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumDataSource] CenterMedia %@", v64, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "shouldIncludeCenterMediaWithPreviewAssets:", v8))
  {
    v21 = *(void **)(a1 + 32);
    objc_msgSend(v19, "assetUUID");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "fetchAssetIfNeededForAssetUUID:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v23)
    {
      PLWallpaperGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)v64 = 138412290;
        v65 = v19;
        _os_log_impl(&dword_1A6789000, v24, OS_LOG_TYPE_ERROR, "[PXWallpaperSmartAlbumDataSource] Cannot find asset for centerMedia %@", v64, 0xCu);
      }
      goto LABEL_34;
    }
    objc_msgSend(*(id *)(a1 + 32), "fetchShuffleSuggestionContainingAsset:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    if (v24)
    {
      v9[2](v9, v24, v23);
      objc_msgSend(v8, "removeObject:", v23);
      PLWallpaperGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        v26 = objc_msgSend(v8, "count");
        *(_DWORD *)v64 = 67109120;
        LODWORD(v65) = v26;
        _os_log_impl(&dword_1A6789000, v25, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumDataSource] %d previewAssets before inserting", v64, 8u);
      }

      if ((unint64_t)objc_msgSend(v8, "count") <= 5)
        v27 = (unint64_t)objc_msgSend(v8, "count") >> 1;
      else
        v27 = 3;
      objc_msgSend(v8, "insertObject:atIndex:", v23, v27);
      PLWallpaperGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        goto LABEL_33;
      *(_DWORD *)v64 = 138412546;
      v65 = v19;
      v66 = 1024;
      LODWORD(v67) = v27;
      v29 = "[PXWallpaperSmartAlbumDataSource] Setting CenterMedia %@ at index %d";
      v30 = v28;
      v31 = OS_LOG_TYPE_INFO;
      v32 = 18;
    }
    else
    {
      PLWallpaperGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
      {
LABEL_33:

LABEL_34:
        goto LABEL_35;
      }
      *(_DWORD *)v64 = 138412290;
      v65 = v19;
      v29 = "[PXWallpaperSmartAlbumDataSource] Cannot find suggestion for centerMedia %@";
      v30 = v28;
      v31 = OS_LOG_TYPE_ERROR;
      v32 = 12;
    }
    _os_log_impl(&dword_1A6789000, v30, v31, v29, v64, v32);
    goto LABEL_33;
  }
LABEL_35:
  v33 = (void *)objc_msgSend(v8, "copy");
  objc_msgSend(*(id *)(a1 + 32), "setPreviewAssets:", v33);

  v34 = (void *)objc_msgSend(*((id *)v58 + 5), "copy");
  objc_msgSend(*(id *)(a1 + 32), "setClassificationByPreviewAssetUUID:", v34);

  v35 = (void *)objc_msgSend((id)v52[5], "copy");
  objc_msgSend(*(id *)(a1 + 32), "setShuffleSuggestionByKeyAssetUUID:", v35);

  objc_msgSend(*(id *)(a1 + 32), "notifyPreviewAssetsDidChange");
  v36 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v39 = v43;
  v40 = v39;
  if (v44 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)v64 = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v40, OS_SIGNPOST_INTERVAL_END, spid, "SetupPreviewAssets", ", v64, 2u);
  }

  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v64 = 136315394;
    v65 = "SetupPreviewAssets";
    v66 = 2048;
    v67 = (float)((float)((float)((float)(v36 - v41) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1A6789000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v64, 0x16u);
  }

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(buf, 8);

}

void __53__PXWallpaperSmartAlbumDataSource_setupPreviewAssets__block_invoke_165(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v5 = (void *)MEMORY[0x1E0D77EF8];
  v6 = a3;
  v7 = a2;
  v8 = objc_msgSend(v5, "posterClassificationForSuggestionSubtype:", objc_msgSend(v7, "subtype"));
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
  objc_msgSend(v6, "uuid");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setObject:forKeyedSubscript:", v9, v11);

  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40);
  objc_msgSend(v6, "uuid");
  v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v12, "setObject:forKeyedSubscript:", v7, v13);
}

+ (unint64_t)supportedTypes
{
  return 15;
}

+ (id)suggestionPredicateForSmartAlbumTypes:(unint64_t)a3
{
  char v3;
  id v4;
  void *v5;
  void *v6;
  void *v8;
  void *v9;
  void *v10;

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((v3 & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("subtype"), 652);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v8);

    if ((v3 & 2) == 0)
    {
LABEL_3:
      if ((v3 & 4) == 0)
        goto LABEL_4;
LABEL_9:
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("subtype"), 654);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v10);

      if ((v3 & 8) == 0)
        goto LABEL_6;
      goto LABEL_5;
    }
  }
  else if ((v3 & 2) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("subtype"), 653);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);

  if ((v3 & 4) != 0)
    goto LABEL_9;
LABEL_4:
  if ((v3 & 8) != 0)
  {
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("subtype"), 655);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);

  }
LABEL_6:
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (BOOL)isAnySmartAlbumAvailableInPhotoLibrary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "baseSuggestionFetchOptionsForPhotoLibrary:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setFetchLimit:", 1);
  objc_msgSend(v4, "setShouldPrefetchCount:", 1);
  v5 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v6;
  objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllShuffleWallpaperSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v7;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "andPredicateWithSubpredicates:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInternalPredicate:", v9);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v9) = objc_msgSend(v10, "count") != 0;

  return (char)v9;
}

@end
