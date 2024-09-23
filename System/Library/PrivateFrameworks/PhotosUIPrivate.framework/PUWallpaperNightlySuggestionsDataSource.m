@implementation PUWallpaperNightlySuggestionsDataSource

- (PUWallpaperNightlySuggestionsDataSource)initWithPhotoLibrary:(id)a3
{
  id v5;
  PUWallpaperNightlySuggestionsDataSource *v6;
  PUWallpaperNightlySuggestionsDataSource *v7;
  NSDateFormatter *v8;
  NSDateFormatter *dateFormatter;
  uint64_t v10;
  NSPointerArray *delegates;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PUWallpaperNightlySuggestionsDataSource;
  v6 = -[PUWallpaperNightlySuggestionsDataSource init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    v8 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v7->_dateFormatter;
    v7->_dateFormatter = v8;

    -[NSDateFormatter setTimeStyle:](v7->_dateFormatter, "setTimeStyle:", 0);
    -[NSDateFormatter setDateStyle:](v7->_dateFormatter, "setDateStyle:", 3);
    objc_msgSend(MEMORY[0x1E0CB3868], "weakObjectsPointerArray");
    v10 = objc_claimAutoreleasedReturnValue();
    delegates = v7->_delegates;
    v7->_delegates = (NSPointerArray *)v10;

  }
  return v7;
}

- (id)title
{
  return -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", self->_date);
}

- (unsigned)subtype
{
  return 0;
}

- (id)objectAtIndexPath:(id)a3
{
  return -[PHFetchResult objectAtIndex:](self->_fetchResult, "objectAtIndex:", objc_msgSend(a3, "row"));
}

- (void)setDate:(id)a3
{
  NSDate *v5;
  NSDate *v6;

  v5 = (NSDate *)a3;
  if (self->_date != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_date, a3);
    -[PUWallpaperNightlySuggestionsDataSource refresh](self, "refresh");
    v5 = v6;
  }

}

- (void)setPosterConfiguration:(id)a3
{
  PUWallpaperNightlySuggestionsPosterConfiguration *v5;
  PUWallpaperNightlySuggestionsPosterConfiguration *v6;

  v5 = (PUWallpaperNightlySuggestionsPosterConfiguration *)a3;
  if (self->_posterConfiguration != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_posterConfiguration, a3);
    -[PUWallpaperNightlySuggestionsDataSource refresh](self, "refresh");
    v5 = v6;
  }

}

- (void)refresh
{
  void *v3;
  void *v4;
  NSDate *date;
  void *v6;
  id v7;
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
  void *v18;
  id v19;
  PHFetchResult *v20;
  PHFetchResult *fetchResult;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  id v27;
  void *v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[4];
  id v34;
  id v35;
  _BYTE v36[128];
  _QWORD v37[4];

  v37[2] = *MEMORY[0x1E0C80C00];
  if (self->_date && self->_posterConfiguration)
  {
    -[PUWallpaperNightlySuggestionsDataSource _dictionaryWithPosterConfiguration:](self, "_dictionaryWithPosterConfiguration:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHPhotoLibrary photoAnalysisClient](self->_photoLibrary, "photoAnalysisClient");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    date = self->_date;
    v35 = 0;
    objc_msgSend(v4, "requestNightlySuggestionsForPosterConfiguration:atDate:error:", v3, date, &v35);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v35;

    objc_msgSend(v6, "objectForKeyedSubscript:", *MEMORY[0x1E0D722E0]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (v8)
    {
      v27 = v7;
      v28 = v3;
      -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MEMORY[0x1E0CB3528];
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v37[0] = v11;
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("localIdentifier IN %@"), v8);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v37[1] = v12;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "andPredicateWithSubpredicates:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setPredicate:", v14);

      objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "fetchedObjects");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = (void *)objc_msgSend(v16, "copy");
      v33[0] = MEMORY[0x1E0C809B0];
      v33[1] = 3221225472;
      v33[2] = __50__PUWallpaperNightlySuggestionsDataSource_refresh__block_invoke;
      v33[3] = &unk_1E58A59C8;
      v34 = v8;
      objc_msgSend(v17, "sortedArrayUsingComparator:", v33);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      v19 = objc_alloc(MEMORY[0x1E0CD1620]);
      v20 = (PHFetchResult *)objc_msgSend(v19, "initWithObjects:photoLibrary:fetchType:fetchPropertySets:identifier:registerIfNeeded:", v18, self->_photoLibrary, *MEMORY[0x1E0CD1BD0], 0, 0, 0);
      fetchResult = self->_fetchResult;
      self->_fetchResult = v20;

      v31 = 0u;
      v32 = 0u;
      v29 = 0u;
      v30 = 0u;
      -[PUWallpaperNightlySuggestionsDataSource delegates](self, "delegates");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
      if (v23)
      {
        v24 = v23;
        v25 = *(_QWORD *)v30;
        do
        {
          for (i = 0; i != v24; ++i)
          {
            if (*(_QWORD *)v30 != v25)
              objc_enumerationMutation(v22);
            objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * i), "dataSourceChanged:", self);
          }
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v29, v36, 16);
        }
        while (v24);
      }

      v7 = v27;
      v3 = v28;
    }

  }
}

- (id)_dictionaryWithPosterConfiguration:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  _QWORD v14[5];

  v14[4] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("personLocalIdentifiers");
  v3 = a3;
  objc_msgSend(v3, "personLocalIdentifiers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "allObjects");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v5;
  v13[1] = CFSTR("includePets");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "includePets"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v6;
  v13[2] = CFSTR("includeLandscapes");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v3, "includeLandscapes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v7;
  v13[3] = CFSTR("includeCityscapes");
  v8 = (void *)MEMORY[0x1E0CB37E8];
  v9 = objc_msgSend(v3, "includeCityscapes");

  objc_msgSend(v8, "numberWithBool:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v14[3] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)fetchResult
{
  return self->_fetchResult;
}

- (id)delegates
{
  return self->_delegates;
}

- (PUWallpaperNightlySuggestionsPosterConfiguration)posterConfiguration
{
  return self->_posterConfiguration;
}

- (NSDate)date
{
  return self->_date;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_date, 0);
  objc_storeStrong((id *)&self->_posterConfiguration, 0);
  objc_storeStrong((id *)&self->_delegates, 0);
  objc_storeStrong((id *)&self->_fetchResult, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
}

uint64_t __50__PUWallpaperNightlySuggestionsDataSource_refresh__block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;

  v5 = (void *)MEMORY[0x1E0CB37E8];
  v6 = *(void **)(a1 + 32);
  v7 = a3;
  objc_msgSend(a2, "localIdentifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "indexOfObject:", v8));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = *(void **)(a1 + 32);
  objc_msgSend(v7, "localIdentifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v11, "indexOfObject:", v12));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v9, "compare:", v13);

  return v14;
}

@end
