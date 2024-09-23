@implementation PUPassiveContentDataSource

- (id)initForAmbientFeatured
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  void *v24;
  PUPassiveContentDataSource *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  NSString *title;
  void *v31;
  void *v33;
  void *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _QWORD v40[3];
  _QWORD v41[4];

  v41[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v41[0] = v5;
  objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllFeaturedStateEnabledSuggestionTypesForWidget");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v41[1] = v6;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPredicate:", v8);

  v33 = v3;
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v2;
  objc_msgSend(v2, "librarySpecificFetchOptions");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setIncludeGuestAssets:", 1);
  v11 = *MEMORY[0x1E0CD1A50];
  v40[0] = *MEMORY[0x1E0CD19F0];
  v40[1] = v11;
  v40[2] = *MEMORY[0x1E0CD1978];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v40, 3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFetchPropertySets:", v12);

  v31 = v10;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v9, v10);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v15 = v9;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        objc_msgSend(v20, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKeyedSubscript:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        if (!objc_msgSend(MEMORY[0x1E0D77E40], "suggestionIsEligibleForDisplay:asset:modelSet:", v20, v22, 0))
          objc_msgSend(v14, "addObject:", v20);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v17);
  }

  v23 = objc_alloc(MEMORY[0x1E0CD1620]);
  v24 = (void *)objc_msgSend(v23, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v14, v34, *MEMORY[0x1E0CD1BD0], 0, 0, 0);
  v25 = -[PUPassiveContentDataSource initWithFetchResult:](self, "initWithFetchResult:", v24);
  v26 = (void *)MEMORY[0x1E0CB3940];
  -[PUPassiveContentDataSource fetchResult](v25, "fetchResult");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "stringWithFormat:", CFSTR("Featured Photo - %lu"), objc_msgSend(v27, "count"));
  v28 = objc_claimAutoreleasedReturnValue();
  title = v25->_title;
  v25->_title = (NSString *)v28;

  return v25;
}

- (id)initForSettlingEffect
{
  void *v3;
  void *v4;
  void *v5;
  PUPassiveContentDataSource *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSString *title;

  v3 = (void *)MEMORY[0x1E0D77EF8];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchSettlingEffectSuggestionsInPhotoLibrary:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = -[PUPassiveContentDataSource initWithFetchResult:](self, "initWithFetchResult:", v5);
  v7 = (void *)MEMORY[0x1E0CB3940];
  -[PUPassiveContentDataSource fetchResult](v6, "fetchResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("Settling Effect - %lu"), objc_msgSend(v8, "count"));
  v9 = objc_claimAutoreleasedReturnValue();
  title = v6->_title;
  v6->_title = (NSString *)v9;

  return v6;
}

- (PUPassiveContentDataSource)initWithSuggestionSubtype:(unsigned __int16)a3
{
  return -[PUPassiveContentDataSource initWithSuggestionSubtype:includingSingleFeature:](self, "initWithSuggestionSubtype:includingSingleFeature:", a3, 0);
}

- (PUPassiveContentDataSource)initWithSuggestionSubtype:(unsigned __int16)a3 includingSingleFeature:(unint64_t)a4
{
  uint64_t v5;
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
  void *v17;
  uint64_t v18;
  PUPassiveContentDataSource *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  NSString *title;
  _QWORD v26[2];
  _QWORD v27[3];

  v5 = a3;
  v27[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("subtype"), v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v27, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v26[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v26[1] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v26, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSortDescriptors:", v16);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4)
  {
    objc_msgSend(MEMORY[0x1E0D77EF8], "filterSuggestions:includingSingleFeature:", v17, a4);
    v18 = objc_claimAutoreleasedReturnValue();

    v17 = (void *)v18;
  }
  v19 = -[PUPassiveContentDataSource initWithFetchResult:](self, "initWithFetchResult:", v17);
  objc_msgSend((id)objc_opt_class(), "_subtypeTitleFromSubtype:", v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)MEMORY[0x1E0CB3940];
  -[PUPassiveContentDataSource fetchResult](v19, "fetchResult");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringWithFormat:", CFSTR("%@ - %lu"), v20, objc_msgSend(v22, "count"));
  v23 = objc_claimAutoreleasedReturnValue();
  title = v19->_title;
  v19->_title = (NSString *)v23;

  return v19;
}

- (PUPassiveContentDataSource)initWithFetchResult:(id)a3
{
  id v5;
  PUPassiveContentDataSource *v6;
  uint64_t v7;
  NSPointerArray *delegates;
  void *v9;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PUPassiveContentDataSource;
  v6 = -[PUPassiveContentDataSource init](&v11, sel_init);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v7 = objc_claimAutoreleasedReturnValue();
    delegates = v6->_delegates;
    v6->_delegates = (NSPointerArray *)v7;

    objc_storeStrong((id *)&v6->_fetchResult, a3);
    objc_msgSend(v5, "photoLibrary");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "registerChangeObserver:", v6);

    -[PUPassiveContentDataSource _setupContextDataSourcesIfNeeded](v6, "_setupContextDataSourcesIfNeeded");
  }

  return v6;
}

- (void)_setupContextDataSourcesIfNeeded
{
  NSMutableArray *v3;
  NSMutableArray *contextDataSources;
  void *v5;
  void *v6;
  id v7;
  PHFetchResult *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  __CFString *v16;
  id v17;
  void *v18;
  id v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t j;
  uint64_t v25;
  void *v26;
  _PUPassiveContentContextDataSource *v27;
  id v28;
  void *v29;
  uint64_t v30;
  PHFetchResult *fetchResult;
  _PUPassiveContentContextDataSource *v32;
  void *v33;
  _PUPassiveContentContextDataSource *v34;
  PUPassiveContentDataSource *v35;
  _PUPassiveContentContextDataSource *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  contextDataSources = self->_contextDataSources;
  self->_contextDataSources = v3;

  -[PHFetchResult firstObject](self->_fetchResult, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "context");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v35 = self;
    v8 = self->_fetchResult;
    v9 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v42 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          v14 = (void *)MEMORY[0x1AF42B2C0]();
          objc_msgSend(v13, "context");
          v15 = objc_claimAutoreleasedReturnValue();
          if (v15)
            v16 = (__CFString *)v15;
          else
            v16 = CFSTR("No Context Suggestions, please file a radar");
          objc_msgSend(v7, "objectForKeyedSubscript:", v16);
          v17 = (id)objc_claimAutoreleasedReturnValue();
          if (!v17)
          {
            v17 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
            objc_msgSend(v7, "setObject:forKeyedSubscript:", v17, v16);
          }
          objc_msgSend(v17, "addObject:", v13);

          objc_autoreleasePoolPop(v14);
        }
        v10 = -[PHFetchResult countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v10);
    }

    objc_msgSend(v7, "keysSortedByValueUsingComparator:", &__block_literal_global_96894);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v37 = 0u;
    v38 = 0u;
    v39 = 0u;
    v40 = 0u;
    v20 = v18;
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v38;
      do
      {
        for (j = 0; j != v22; ++j)
        {
          if (*(_QWORD *)v38 != v23)
            objc_enumerationMutation(v20);
          v25 = *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * j);
          objc_msgSend(v7, "objectForKeyedSubscript:", v25);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addObjectsFromArray:", v26);
          v27 = -[_PUPassiveContentContextDataSource initWithContext:suggestions:]([_PUPassiveContentContextDataSource alloc], "initWithContext:suggestions:", v25, v26);
          if (v27)
            -[NSMutableArray addObject:](v35->_contextDataSources, "addObject:", v27);

        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
      }
      while (v22);
    }

    v28 = objc_alloc(MEMORY[0x1E0CD1620]);
    objc_msgSend(MEMORY[0x1E0CD16F8], "px_systemPhotoLibrary");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v19, v29, *MEMORY[0x1E0CD1BD0], 0, 0, 1);

    fetchResult = v35->_fetchResult;
    v35->_fetchResult = (PHFetchResult *)v30;

  }
  else
  {
    v32 = [_PUPassiveContentContextDataSource alloc];
    -[PHFetchResult fetchedObjects](self->_fetchResult, "fetchedObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = -[_PUPassiveContentContextDataSource initWithContext:suggestions:](v32, "initWithContext:suggestions:", 0, v33);

    v34 = v36;
    if (v36)
    {
      -[NSMutableArray addObject:](self->_contextDataSources, "addObject:", v36);
      v34 = v36;
    }

  }
}

- (id)objectAtIndexPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v4 = a3;
  -[PUPassiveContentDataSource contextDataSources](self, "contextDataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", objc_msgSend(v4, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "suggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v4, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)titleForSection:(unint64_t)a3
{
  void *v5;
  __CFString *v6;

  if (-[NSMutableArray count](self->_contextDataSources, "count") <= a3)
  {
    v6 = &stru_1E58AD278;
  }
  else
  {
    -[NSMutableArray objectAtIndexedSubscript:](self->_contextDataSources, "objectAtIndexedSubscript:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "context");
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (unint64_t)countInSection:(unint64_t)a3
{
  void *v5;
  void *v6;
  unint64_t v7;

  if (-[NSMutableArray count](self->_contextDataSources, "count") <= a3)
    return 0;
  -[NSMutableArray objectAtIndexedSubscript:](self->_contextDataSources, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "suggestions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  return v7;
}

- (unint64_t)count
{
  void *v2;
  unint64_t v3;

  -[PUPassiveContentDataSource fetchResult](self, "fetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (unint64_t)sectionCount
{
  return -[NSMutableArray count](self->_contextDataSources, "count");
}

- (id)indexPathForSuggestionUUID:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t (*v15)(uint64_t, uint64_t);
  void (*v16)(uint64_t);
  id v17;

  v4 = a3;
  v12 = 0;
  v13 = &v12;
  v14 = 0x3032000000;
  v15 = __Block_byref_object_copy__96883;
  v16 = __Block_byref_object_dispose__96884;
  v17 = 0;
  -[PUPassiveContentDataSource contextDataSources](self, "contextDataSources");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __57__PUPassiveContentDataSource_indexPathForSuggestionUUID___block_invoke;
  v9[3] = &unk_1E58A9C20;
  v6 = v4;
  v10 = v6;
  v11 = &v12;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v9);

  v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PUPassiveContentDataSource fetchResult](self, "fetchResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "changeDetailsForFetchResult:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "fetchResultAfterChanges");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_fetchResult, v8);
    -[PUPassiveContentDataSource _setupContextDataSourcesIfNeeded](self, "_setupContextDataSourcesIfNeeded");
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    -[PUPassiveContentDataSource delegates](self, "delegates", 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v15;
      do
      {
        v13 = 0;
        do
        {
          if (*(_QWORD *)v15 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v13++), "dataSourceChanged:", self);
        }
        while (v11 != v13);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

  }
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
  objc_storeStrong((id *)&self->_title, a3);
}

- (PHFetchResult)fetchResult
{
  return self->_fetchResult;
}

- (NSPointerArray)delegates
{
  return self->_delegates;
}

- (NSMutableArray)contextDataSources
{
  return self->_contextDataSources;
}

- (void)setContextDataSources:(id)a3
{
  objc_storeStrong((id *)&self->_contextDataSources, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contextDataSources, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_title, 0);
}

void __57__PUPassiveContentDataSource_indexPathForSuggestionUUID___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  void *v7;
  id v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;

  objc_msgSend(a2, "suggestions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __57__PUPassiveContentDataSource_indexPathForSuggestionUUID___block_invoke_2;
  v10[3] = &unk_1E58A9BF8;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 40);
  v11 = v8;
  v12 = v9;
  v13 = a3;
  v14 = a4;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v10);

}

void __57__PUPassiveContentDataSource_indexPathForSuggestionUUID___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;

  objc_msgSend(a2, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isEqualToString:", *(_QWORD *)(a1 + 32));

  if (v8)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", a3, *(_QWORD *)(a1 + 48));
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v11 = *(void **)(v10 + 40);
    *(_QWORD *)(v10 + 40) = v9;

    *a4 = 1;
    **(_BYTE **)(a1 + 56) = 1;
  }
}

uint64_t __62__PUPassiveContentDataSource__setupContextDataSourcesIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;

  v4 = (void *)MEMORY[0x1E0CB37E8];
  v5 = a2;
  objc_msgSend(v4, "numberWithUnsignedInteger:", objc_msgSend(a3, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = objc_msgSend(v5, "count");

  objc_msgSend(v7, "numberWithUnsignedInteger:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v6, "compare:", v9);

  return v10;
}

+ (id)_subtypeTitleFromSubtype:(unsigned __int16)a3
{
  __CFString *v3;
  id result;

  v3 = CFSTR("Top People");
  switch(a3)
  {
    case 0x25Au:
LABEL_4:
      result = v3;
      break;
    case 0x25Bu:
      result = CFSTR("Top Pet");
      break;
    case 0x25Cu:
      result = CFSTR("Top Landscape");
      break;
    case 0x25Du:
      result = CFSTR("Top Cityscape");
      break;
    default:
      switch(a3)
      {
        case 0x28Cu:
          v3 = CFSTR("People (Shuffle)");
          goto LABEL_4;
        case 0x28Du:
          result = CFSTR("Pet (Shuffle)");
          break;
        case 0x28Eu:
          result = CFSTR("Landscape (Shuffle)");
          break;
        case 0x28Fu:
          result = CFSTR("Cityscape (Shuffle)");
          break;
        default:
          PHSuggestionStringWithSubtype();
          v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_4;
      }
      break;
  }
  return result;
}

+ (id)wallpaperDataSource
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  PUPassiveContentDataSource *v15;
  PUPassiveContentDataSource *v16;
  id v17;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CD17D0], "allTopWallpaperSuggestionSubtypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ascendingSortedArrayFromSet:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v6);

  objc_msgSend(MEMORY[0x1E0CD17D0], "allShuffleWallpaperSuggestionSubtypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ascendingSortedArrayFromSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObjectsFromArray:", v8);

  objc_msgSend(v4, "addObject:", &unk_1E59BC348);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v9 = v4;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * v13);
        v15 = [PUPassiveContentDataSource alloc];
        v16 = -[PUPassiveContentDataSource initWithSuggestionSubtype:](v15, "initWithSuggestionSubtype:", (unsigned __int16)objc_msgSend(v14, "unsignedIntValue", (_QWORD)v19));
        objc_msgSend(v3, "addObject:", v16);

        ++v13;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  v17 = -[PUPassiveContentDataSource initForSettlingEffect]([PUPassiveContentDataSource alloc], "initForSettlingEffect");
  objc_msgSend(v3, "addObject:", v17);

  return v3;
}

+ (id)ambientDataSource
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PUPassiveContentDataSource *v12;
  PUPassiveContentDataSource *v13;
  id v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CD17D0], "allAmbientSuggestionSubtypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ascendingSortedArrayFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        v12 = [PUPassiveContentDataSource alloc];
        v13 = -[PUPassiveContentDataSource initWithSuggestionSubtype:](v12, "initWithSuggestionSubtype:", (unsigned __int16)objc_msgSend(v11, "unsignedIntValue", (_QWORD)v16));
        objc_msgSend(v3, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  v14 = -[PUPassiveContentDataSource initForAmbientFeatured]([PUPassiveContentDataSource alloc], "initForAmbientFeatured");
  objc_msgSend(v3, "addObject:", v14);

  return v3;
}

+ (id)watchFaceDataSource
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PUPassiveContentDataSource *v12;
  PUPassiveContentDataSource *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CD17D0], "allAmbientSuggestionSubtypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_ascendingSortedArrayFromSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = v5;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v16;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v10);
        v12 = [PUPassiveContentDataSource alloc];
        v13 = -[PUPassiveContentDataSource initWithSuggestionSubtype:includingSingleFeature:](v12, "initWithSuggestionSubtype:includingSingleFeature:", (unsigned __int16)objc_msgSend(v11, "unsignedIntValue", (_QWORD)v15), 2);
        objc_msgSend(v3, "addObject:", v13);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v8);
  }

  return v3;
}

+ (id)_ascendingSortedArrayFromSet:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3928];
  v4 = a3;
  objc_msgSend(v3, "sortDescriptorWithKey:ascending:", CFSTR("self"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v10[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v10, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sortedArrayUsingDescriptors:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

@end
