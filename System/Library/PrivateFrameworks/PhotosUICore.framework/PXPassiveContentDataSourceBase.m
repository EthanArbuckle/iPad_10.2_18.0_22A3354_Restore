@implementation PXPassiveContentDataSourceBase

- (PXPassiveContentDataSourceBase)initWithPhotoLibrary:(id)a3 changeObserver:(id)a4
{
  id v7;
  id v8;
  PXPassiveContentDataSourceBase *v9;
  PXPassiveContentDataSourceBase *v10;
  uint64_t v11;
  OS_dispatch_queue *workQueue;
  uint64_t v13;
  NSHashTable *changeObservers;
  uint64_t v15;
  OS_os_log *log;
  NSMutableDictionary *v17;
  NSMutableDictionary *keyAssetBySuggestionUUID;
  NSMutableDictionary *v19;
  NSMutableDictionary *personSuggestionsByPersonLocalIdentifier;
  objc_super v22;

  v7 = a3;
  v8 = a4;
  v22.receiver = self;
  v22.super_class = (Class)PXPassiveContentDataSourceBase;
  v9 = -[PXPassiveContentDataSourceBase init](&v22, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_photoLibrary, a3);
    v10->_selectedTypes = 0;
    px_dispatch_queue_create_serial();
    v11 = objc_claimAutoreleasedReturnValue();
    workQueue = v10->_workQueue;
    v10->_workQueue = (OS_dispatch_queue *)v11;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v13 = objc_claimAutoreleasedReturnValue();
    changeObservers = v10->_changeObservers;
    v10->_changeObservers = (NSHashTable *)v13;

    if (v8)
      -[NSHashTable addObject:](v10->_changeObservers, "addObject:", v8);
    PLWallpaperGetLog();
    v15 = objc_claimAutoreleasedReturnValue();
    log = v10->_log;
    v10->_log = (OS_os_log *)v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    keyAssetBySuggestionUUID = v10->_keyAssetBySuggestionUUID;
    v10->_keyAssetBySuggestionUUID = v17;

    v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    personSuggestionsByPersonLocalIdentifier = v10->_personSuggestionsByPersonLocalIdentifier;
    v10->_personSuggestionsByPersonLocalIdentifier = v19;

    -[PXPassiveContentDataSourceBase fetchSuggestionsAndAssets](v10, "fetchSuggestionsAndAssets");
  }

  return v10;
}

- (void)fetchSuggestionsAndAssets
{
  NSObject *v3;
  _QWORD block[5];

  -[PXPassiveContentDataSourceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PXPassiveContentDataSourceBase_fetchSuggestionsAndAssets__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)setSelectedTypes:(unint64_t)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (self->_selectedTypes != a3)
  {
    self->_selectedTypes = a3;
    PLWallpaperGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      PFPosterShuffleSmartAlbumsDescription();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = 138412290;
      v8 = v5;
      _os_log_impl(&dword_1A6789000, v4, OS_LOG_TYPE_INFO, "[PXPassiveContentDataSourceBase] Set selected types: %@", (uint8_t *)&v7, 0xCu);

    }
    if ((self->_selectedTypes & 1) == 0
      || (-[PXPassiveContentDataSourceBase peopleLocalIdentifiers](self, "peopleLocalIdentifiers"),
          v6 = (void *)objc_claimAutoreleasedReturnValue(),
          v6,
          v6))
    {
      -[PXPassiveContentDataSourceBase setupPreviewAssets](self, "setupPreviewAssets");
    }
  }
}

- (void)setPeopleLocalIdentifiers:(id)a3
{
  id v4;
  NSArray *v5;
  NSArray *peopleLocalIdentifiers;
  NSObject *v7;
  NSArray *v8;
  int v9;
  NSArray *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!-[NSArray isEqualToArray:](self->_peopleLocalIdentifiers, "isEqualToArray:", v4))
  {
    v5 = (NSArray *)objc_msgSend(v4, "copy");
    peopleLocalIdentifiers = self->_peopleLocalIdentifiers;
    self->_peopleLocalIdentifiers = v5;

    if (-[NSArray count](self->_peopleLocalIdentifiers, "count"))
      -[PXPassiveContentDataSourceBase cacheSuggestionsAndKeyAssetsForPersons:](self, "cacheSuggestionsAndKeyAssetsForPersons:", self->_peopleLocalIdentifiers);
    PLWallpaperGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      v8 = self->_peopleLocalIdentifiers;
      v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1A6789000, v7, OS_LOG_TYPE_INFO, "[PXPassiveContentDataSourceBase] Set custom people: %@", (uint8_t *)&v9, 0xCu);
    }

    if ((-[PXPassiveContentDataSourceBase selectedTypes](self, "selectedTypes") & 1) != 0)
      -[PXPassiveContentDataSourceBase setupPreviewAssets](self, "setupPreviewAssets");
  }

}

- (void)fetchSuggestions
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPassiveContentDataSourceBase.m"), 128, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXPassiveContentDataSourceBase fetchSuggestions]", v6);

  abort();
}

- (void)setupPreviewAssets
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPassiveContentDataSourceBase.m"), 132, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXPassiveContentDataSourceBase setupPreviewAssets]", v6);

  abort();
}

- (void)cacheSuggestionsAndKeyAssetsForPersons:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PXPassiveContentDataSourceBase *v9;

  v4 = a3;
  -[PXPassiveContentDataSourceBase workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __73__PXPassiveContentDataSourceBase_cacheSuggestionsAndKeyAssetsForPersons___block_invoke;
  v7[3] = &unk_1E5148D08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (id)fetchSuggestionsForPersonLocalIdentifier:(id)a3
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
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = (void *)objc_opt_class();
  -[PXPassiveContentDataSourceBase photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "baseSuggestionFetchOptionsForPhotoLibrary:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(v7, "internalPredicate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "suggestionPredicateForSmartAlbumTypes:", 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("suggestionContext"), v4, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v16[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInternalPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)keyAssetFetchOptions
{
  void *v2;
  void *v3;

  -[PXPassiveContentDataSourceBase photoLibrary](self, "photoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setIncludeGuestAssets:", 1);
  return v3;
}

- (void)cacheKeyAssetForSuggestionOids:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v4 = (void *)MEMORY[0x1A85CE17C]();
  v5 = objc_alloc(MEMORY[0x1E0CD1620]);
  -[PXPassiveContentDataSourceBase photoLibrary](self, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithOids:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v10, v6, *MEMORY[0x1E0CD1BD0], 0, 0, 0);

  -[PXPassiveContentDataSourceBase keyAssetFetchOptions](self, "keyAssetFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary addEntriesFromDictionary:](self->_keyAssetBySuggestionUUID, "addEntriesFromDictionary:", v9);

  objc_autoreleasePoolPop(v4);
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

- (id)combineSuggestionsForSelectedTypes:(unint64_t)a3 maxCount:(int64_t)a4
{
  char v5;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  unint64_t v17;
  _BOOL4 v18;
  void *v19;
  NSObject *v20;
  void *v21;
  id v22;
  uint64_t v23;
  _BOOL4 v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  void *v37;
  char *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint8_t buf[4];
  void *v47;
  __int16 v48;
  uint64_t v49;
  __int16 v50;
  uint64_t v51;
  __int16 v52;
  uint64_t v53;
  __int16 v54;
  uint64_t v55;
  __int16 v56;
  uint64_t v57;
  uint64_t v58;

  v5 = a3;
  v58 = *MEMORY[0x1E0C80C00];
  -[PXPassiveContentDataSourceBase petSuggestions](self, "petSuggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  -[PXPassiveContentDataSourceBase landscapeSuggestions](self, "landscapeSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  -[PXPassiveContentDataSourceBase cityscapeSuggestions](self, "cityscapeSuggestions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  -[PXPassiveContentDataSourceBase featuredSuggestions](self, "featuredSuggestions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  -[PXPassiveContentDataSourceBase customPeopleSuggestions](self, "customPeopleSuggestions");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v37, "count");
  v16 = v15;
  v44 = v10;
  v45 = v8;
  v43 = v12;
  if (v10 + v8 + v12 + v14 + v15 >= a4)
    v17 = a4;
  else
    v17 = v10 + v8 + v12 + v14 + v15;
  if ((v5 & 1) != 0)
  {
    -[PXPassiveContentDataSourceBase peopleLocalIdentifiers](self, "peopleLocalIdentifiers");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v19, "count") != 0;

  }
  else
  {
    v18 = 0;
  }
  PLWallpaperGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    PFPosterShuffleSmartAlbumsDescription();
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v47 = v21;
    _os_log_impl(&dword_1A6789000, v20, OS_LOG_TYPE_INFO, "[PXPassiveContentDataSourceBase] Selecting types: %@", buf, 0xCu);

  }
  v22 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if ((uint64_t)v17 < 1)
  {
    v39 = 0;
    v40 = 0;
    v41 = 0;
    v42 = 0;
    v38 = 0;
  }
  else
  {
    v23 = 0;
    v41 = 0;
    v42 = 0;
    v38 = 0;
    v39 = 0;
    v40 = 0;
    do
    {
      v24 = v23 < v16 && v18;
      if (v24 && objc_msgSend(v22, "count") < v17)
      {
        objc_msgSend(v37, "objectAtIndex:", v23);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v25);

        ++v38;
      }
      if ((v5 & 2) != 0 && v23 < v45 && objc_msgSend(v22, "count") < v17)
      {
        -[PXPassiveContentDataSourceBase petSuggestions](self, "petSuggestions");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "objectAtIndex:", v23);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v27);

        ++v39;
      }
      if ((v5 & 4) != 0 && v23 < v44 && objc_msgSend(v22, "count") < v17)
      {
        -[PXPassiveContentDataSourceBase landscapeSuggestions](self, "landscapeSuggestions");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "objectAtIndex:", v23);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v29);

        ++v40;
      }
      if ((v5 & 8) != 0 && v23 < v43 && objc_msgSend(v22, "count") < v17)
      {
        -[PXPassiveContentDataSourceBase cityscapeSuggestions](self, "cityscapeSuggestions");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "objectAtIndex:", v23);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v31);

        ++v41;
      }
      if ((v5 & 0x10) != 0 && v23 < v14 && objc_msgSend(v22, "count") < v17)
      {
        -[PXPassiveContentDataSourceBase featuredSuggestions](self, "featuredSuggestions");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "objectAtIndex:", v23);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "addObject:", v33);

        ++v42;
      }
      ++v23;
    }
    while (v17 != v23);
  }
  PLWallpaperGetLog();
  v34 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = objc_msgSend(v22, "count");
    *(_DWORD *)buf = 134219264;
    v47 = v38;
    v48 = 2048;
    v49 = v39;
    v50 = 2048;
    v51 = v40;
    v52 = 2048;
    v53 = v41;
    v54 = 2048;
    v55 = v42;
    v56 = 2048;
    v57 = v35;
    _os_log_impl(&dword_1A6789000, v34, OS_LOG_TYPE_INFO, "[PXPassiveContentDataSourceBase] Selected %lu people, %lu pet, %lu landscape, %lu cityscape, %lu featured. Total: %lu", buf, 0x3Eu);
  }

  return v22;
}

- (NSDictionary)keyAssetBySuggestionUUID
{
  return (NSDictionary *)self->_keyAssetBySuggestionUUID;
}

- (NSDictionary)personSuggestionsByPersonLocalIdentifier
{
  return (NSDictionary *)self->_personSuggestionsByPersonLocalIdentifier;
}

- (void)notifyPreviewAssetsDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PXPassiveContentDataSourceBase changeObservers](self, "changeObservers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "passiveContentDataSourcePreviewAssetsDidChange:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)notifyAvailableTypeDidChange
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  -[PXPassiveContentDataSourceBase changeObservers](self, "changeObservers", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v9;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v9 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "passiveContentDataSourceAvailableTypesDidChange:", self);
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v5);
  }

}

- (void)addChangeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXPassiveContentDataSourceBase workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__PXPassiveContentDataSourceBase_addChangeObserver___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)removeChangeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXPassiveContentDataSourceBase workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __55__PXPassiveContentDataSourceBase_removeChangeObserver___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (unint64_t)selectedTypes
{
  return self->_selectedTypes;
}

- (NSArray)peopleLocalIdentifiers
{
  return self->_peopleLocalIdentifiers;
}

- (unint64_t)availableTypes
{
  return self->_availableTypes;
}

- (void)setAvailableTypes:(unint64_t)a3
{
  self->_availableTypes = a3;
}

- (NSArray)previewAssets
{
  return (NSArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setPreviewAssets:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (PHFetchResult)peopleSuggestions
{
  return self->_peopleSuggestions;
}

- (void)setPeopleSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_peopleSuggestions, a3);
}

- (PHFetchResult)petSuggestions
{
  return self->_petSuggestions;
}

- (void)setPetSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_petSuggestions, a3);
}

- (PHFetchResult)landscapeSuggestions
{
  return self->_landscapeSuggestions;
}

- (void)setLandscapeSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_landscapeSuggestions, a3);
}

- (PHFetchResult)cityscapeSuggestions
{
  return self->_cityscapeSuggestions;
}

- (void)setCityscapeSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_cityscapeSuggestions, a3);
}

- (PHFetchResult)featuredSuggestions
{
  return self->_featuredSuggestions;
}

- (void)setFeaturedSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_featuredSuggestions, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSHashTable)changeObservers
{
  return self->_changeObservers;
}

- (OS_os_log)log
{
  return self->_log;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_featuredSuggestions, 0);
  objc_storeStrong((id *)&self->_cityscapeSuggestions, 0);
  objc_storeStrong((id *)&self->_landscapeSuggestions, 0);
  objc_storeStrong((id *)&self->_petSuggestions, 0);
  objc_storeStrong((id *)&self->_peopleSuggestions, 0);
  objc_storeStrong((id *)&self->_previewAssets, 0);
  objc_storeStrong((id *)&self->_peopleLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_personSuggestionsByPersonLocalIdentifier, 0);
  objc_storeStrong((id *)&self->_keyAssetBySuggestionUUID, 0);
}

void __55__PXPassiveContentDataSourceBase_removeChangeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "changeObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __52__PXPassiveContentDataSourceBase_addChangeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "changeObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void __73__PXPassiveContentDataSourceBase_cacheSuggestionsAndKeyAssetsForPersons___block_invoke(uint64_t a1)
{
  id v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v3 = *(id *)(a1 + 32);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v7);
        objc_msgSend(*(id *)(a1 + 40), "personSuggestionsByPersonLocalIdentifier", (_QWORD)v13);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v8);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v10)
        {
          objc_msgSend(*(id *)(a1 + 40), "fetchSuggestionsForPersonLocalIdentifier:", v8);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "setObject:forKeyedSubscript:", v11, v8);
          objc_msgSend(v11, "fetchedObjectIDs");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObjectsFromArray:", v12);

        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  objc_msgSend(*(id *)(a1 + 40), "cacheKeyAssetForSuggestionOids:", v2);
}

void __59__PXPassiveContentDataSourceBase_fetchSuggestionsAndAssets__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  NSObject *v29;
  char *v30;
  uint64_t v31;
  uint32_t denom;
  uint32_t numer;
  NSObject *v34;
  NSObject *v35;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v38;
  __int16 v39;
  double v40;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "FetchSuggestionsAndAssets", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v6 = mach_absolute_time();
  objc_msgSend(*(id *)(a1 + 32), "fetchSuggestions");
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(*(id *)(a1 + 32), "peopleSuggestions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");

  if (v9)
  {
    objc_msgSend(*(id *)(a1 + 32), "peopleSuggestions");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fetchedObjectIDs");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v11);

    v12 = 1;
  }
  else
  {
    v12 = 0;
  }
  objc_msgSend(*(id *)(a1 + 32), "petSuggestions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "count");

  if (v14)
  {
    objc_msgSend(*(id *)(a1 + 32), "petSuggestions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "fetchedObjectIDs");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v16);

    v12 |= 2uLL;
  }
  objc_msgSend(*(id *)(a1 + 32), "landscapeSuggestions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
  {
    objc_msgSend(*(id *)(a1 + 32), "landscapeSuggestions");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fetchedObjectIDs");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v20);

    v12 |= 4uLL;
  }
  objc_msgSend(*(id *)(a1 + 32), "cityscapeSuggestions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "count");

  if (v22)
  {
    objc_msgSend(*(id *)(a1 + 32), "cityscapeSuggestions");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fetchedObjectIDs");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v24);

    v12 |= 8uLL;
  }
  objc_msgSend(*(id *)(a1 + 32), "featuredSuggestions");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    objc_msgSend(*(id *)(a1 + 32), "featuredSuggestions");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "fetchedObjectIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "addObjectsFromArray:", v28);

    v12 |= 0x10uLL;
  }
  objc_msgSend(*(id *)(a1 + 32), "setAvailableTypes:", v12);
  objc_msgSend(*(id *)(a1 + 32), "notifyAvailableTypeDidChange");
  PLWallpaperGetLog();
  v29 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    PFPosterShuffleSmartAlbumsDescription();
    v30 = (char *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v38 = v30;
    _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_INFO, "[PXPassiveContentDataSourceBase] Available types: %@", buf, 0xCu);

  }
  objc_msgSend(*(id *)(a1 + 32), "cacheKeyAssetForSuggestionOids:", v7);
  v31 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v34 = v5;
  v35 = v34;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v35, OS_SIGNPOST_INTERVAL_END, v3, "FetchSuggestionsAndAssets", ", buf, 2u);
  }

  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v38 = "FetchSuggestionsAndAssets";
    v39 = 2048;
    v40 = (float)((float)((float)((float)(v31 - v6) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1A6789000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

+ (unint64_t)supportedTypes
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPassiveContentDataSourceBase.m"), 122, CFSTR("Method %s is a responsibility of subclass %@"), "+[PXPassiveContentDataSourceBase supportedTypes]", v6);

  abort();
}

+ (id)suggestionPredicateForSmartAlbumTypes:(unint64_t)a3
{
  void *v5;
  objc_class *v6;
  void *v7;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXPassiveContentDataSourceBase.m"), 136, CFSTR("Method %s is a responsibility of subclass %@"), "+[PXPassiveContentDataSourceBase suggestionPredicateForSmartAlbumTypes:]", v7);

  abort();
}

+ (id)baseSuggestionFetchOptionsForPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[2];
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v13, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setInternalPredicate:", v7);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setSortDescriptors:", v10);

  return v3;
}

+ (id)fetchSuggestionsWithSubtype:(unsigned __int16)a3 options:(id)a4
{
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint8_t buf[4];
  uint64_t v17;
  __int16 v18;
  void *v19;
  _QWORD v20[3];

  v4 = a3;
  v20[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(a4, "copy");
  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(v5, "internalPredicate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("subtype"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setInternalPredicate:", v10);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PLWallpaperGetLog();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = objc_msgSend(v11, "count");
    PHSuggestionStringWithSubtype();
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 134218242;
    v17 = v13;
    v18 = 2112;
    v19 = v14;
    _os_log_impl(&dword_1A6789000, v12, OS_LOG_TYPE_DEFAULT, "[PXPassiveContentDataSourceBase] found %lu %@", buf, 0x16u);

  }
  return v11;
}

+ (id)systemImageNameForSingleSmartAlbumType:(unint64_t)a3
{
  id result;

  result = 0;
  switch(a3)
  {
    case 1uLL:
      result = CFSTR("person.fill");
      break;
    case 2uLL:
      result = CFSTR("pawprint.fill");
      break;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return result;
    case 4uLL:
      result = CFSTR("leaf.fill");
      break;
    case 8uLL:
      result = CFSTR("building.fill");
      break;
    default:
      if (a3 == 16)
        result = CFSTR("star.fill");
      else
        result = 0;
      break;
  }
  return result;
}

+ (id)localizedTitleForSingleSmartAlbumType:(unint64_t)a3
{
  void *v3;
  __CFString *v4;

  v3 = 0;
  v4 = CFSTR("PXWallpaperPickerDataSourceModeTopPeople");
  switch(a3)
  {
    case 1uLL:
      goto LABEL_7;
    case 2uLL:
      v4 = CFSTR("PXWallpaperPickerDataSourceModePet");
      goto LABEL_7;
    case 3uLL:
    case 5uLL:
    case 6uLL:
    case 7uLL:
      return v3;
    case 4uLL:
      v4 = CFSTR("PXWallpaperPickerDataSourceModeLandscape");
      goto LABEL_7;
    case 8uLL:
      v4 = CFSTR("PXWallpaperPickerDataSourceModeCityscape");
      goto LABEL_7;
    default:
      if (a3 != 16)
        return v3;
      v4 = CFSTR("PXWallpaperPickerDataSourceModeFeatured");
LABEL_7:
      PXLocalizedStringFromTable(v4, CFSTR("PhotosUICore"));
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
  }
}

@end
