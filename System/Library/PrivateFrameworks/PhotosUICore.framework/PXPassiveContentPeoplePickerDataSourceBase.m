@implementation PXPassiveContentPeoplePickerDataSourceBase

- (PXPassiveContentPeoplePickerDataSourceBase)initWithPhotoLibrary:(id)a3
{
  id v5;
  PXPassiveContentPeoplePickerDataSourceBase *v6;
  PXPassiveContentPeoplePickerDataSourceBase *v7;
  uint64_t v8;
  OS_dispatch_queue *workQueue;
  uint64_t v10;
  NSHashTable *changeObservers;
  uint64_t v12;
  OS_os_log *log;
  uint64_t v14;
  PHUserFeedbackCalculator *userFeedbackCalculator;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXPassiveContentPeoplePickerDataSourceBase;
  v6 = -[PXPassiveContentPeoplePickerDataSourceBase init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_photoLibrary, a3);
    objc_msgSend(v5, "registerChangeObserver:", v7);
    px_dispatch_queue_create_serial();
    v8 = objc_claimAutoreleasedReturnValue();
    workQueue = v7->_workQueue;
    v7->_workQueue = (OS_dispatch_queue *)v8;

    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v10 = objc_claimAutoreleasedReturnValue();
    changeObservers = v7->_changeObservers;
    v7->_changeObservers = (NSHashTable *)v10;

    PLWallpaperGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    log = v7->_log;
    v7->_log = (OS_os_log *)v12;

    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F8]), "initWithPhotoLibrary:", v5);
    userFeedbackCalculator = v7->_userFeedbackCalculator;
    v7->_userFeedbackCalculator = (PHUserFeedbackCalculator *)v14;

  }
  return v7;
}

- (void)startBackgroundFetch
{
  -[PXPassiveContentPeoplePickerDataSourceBase _fetchPeopleWallpaperSuggestions](self, "_fetchPeopleWallpaperSuggestions");
  -[PXPassiveContentPeoplePickerDataSourceBase _fetchPeople](self, "_fetchPeople");
  -[PXPassiveContentPeoplePickerDataSourceBase notifyChanges](self, "notifyChanges");
}

- (id)peopleSuggestionSubtypes
{
  void *v4;
  objc_class *v5;
  void *v6;

  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPassiveContentPeoplePickerDataSourceBase.m"), 49, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXPassiveContentPeoplePickerDataSourceBase peopleSuggestionSubtypes]", v6);

  abort();
}

- (void)computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:(id)a3
{
  id v5;
  void *v6;
  objc_class *v7;
  void *v8;

  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXPassiveContentPeoplePickerDataSourceBase.m"), 53, CFSTR("Method %s is a responsibility of subclass %@"), "-[PXPassiveContentPeoplePickerDataSourceBase computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:]", v8);

  abort();
}

- (unint64_t)requiredFeature
{
  return 0;
}

- (void)_fetchPeopleWallpaperSuggestions
{
  NSObject *v4;
  _QWORD v5[6];

  -[PXPassiveContentPeoplePickerDataSourceBase workQueue](self, "workQueue");
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __78__PXPassiveContentPeoplePickerDataSourceBase__fetchPeopleWallpaperSuggestions__block_invoke;
  v5[3] = &unk_1E5144EB8;
  v5[4] = self;
  v5[5] = a2;
  dispatch_async(v4, v5);

}

- (void)_fetchPeople
{
  NSObject *v3;
  _QWORD block[5];

  -[PXPassiveContentPeoplePickerDataSourceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PXPassiveContentPeoplePickerDataSourceBase__fetchPeople__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)notifyChanges
{
  NSObject *v3;
  _QWORD block[5];

  -[PXPassiveContentPeoplePickerDataSourceBase workQueue](self, "workQueue");
  v3 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __59__PXPassiveContentPeoplePickerDataSourceBase_notifyChanges__block_invoke;
  block[3] = &unk_1E5149198;
  block[4] = self;
  dispatch_async(v3, block);

}

- (void)addChangeObserver:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[PXPassiveContentPeoplePickerDataSourceBase workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __64__PXPassiveContentPeoplePickerDataSourceBase_addChangeObserver___block_invoke;
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
  -[PXPassiveContentPeoplePickerDataSourceBase workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __67__PXPassiveContentPeoplePickerDataSourceBase_removeChangeObserver___block_invoke;
  v7[3] = &unk_1E5148D08;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  PXPassiveContentPeoplePickerDataSourceBase *v9;

  v4 = a3;
  -[PXPassiveContentPeoplePickerDataSourceBase workQueue](self, "workQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __68__PXPassiveContentPeoplePickerDataSourceBase_photoLibraryDidChange___block_invoke;
  v7[3] = &unk_1E5148D08;
  v8 = v4;
  v9 = self;
  v6 = v4;
  dispatch_async(v5, v7);

}

- (NSArray)vipPersons
{
  return (NSArray *)objc_getProperty(self, a2, 8, 1);
}

- (void)setVipPersons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSArray)nonVIPPersons
{
  return (NSArray *)objc_getProperty(self, a2, 16, 1);
}

- (void)setNonVIPPersons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (OS_os_log)log
{
  return self->_log;
}

- (PHUserFeedbackCalculator)userFeedbackCalculator
{
  return self->_userFeedbackCalculator;
}

- (NSHashTable)changeObservers
{
  return self->_changeObservers;
}

- (PHFetchResult)peopleSuggestions
{
  return self->_peopleSuggestions;
}

- (void)setPeopleSuggestions:(id)a3
{
  objc_storeStrong((id *)&self->_peopleSuggestions, a3);
}

- (PHFetchResult)vipPersonsFetchResult
{
  return self->_vipPersonsFetchResult;
}

- (void)setVipPersonsFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_vipPersonsFetchResult, a3);
}

- (PHFetchResult)nonVIPPersonsFetchResult
{
  return self->_nonVIPPersonsFetchResult;
}

- (void)setNonVIPPersonsFetchResult:(id)a3
{
  objc_storeStrong((id *)&self->_nonVIPPersonsFetchResult, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nonVIPPersonsFetchResult, 0);
  objc_storeStrong((id *)&self->_vipPersonsFetchResult, 0);
  objc_storeStrong((id *)&self->_peopleSuggestions, 0);
  objc_storeStrong((id *)&self->_changeObservers, 0);
  objc_storeStrong((id *)&self->_userFeedbackCalculator, 0);
  objc_storeStrong((id *)&self->_log, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_nonVIPPersons, 0);
  objc_storeStrong((id *)&self->_vipPersons, 0);
}

void __68__PXPassiveContentPeoplePickerDataSourceBase_photoLibraryDidChange___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  _BOOL4 v5;
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
  void *v17;
  void *v18;
  void *v19;
  id v20;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "peopleSuggestions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "changeDetailsForFetchResult:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = v4 != 0;
  if (v4)
  {
    objc_msgSend(v4, "fetchResultAfterChanges");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setPeopleSuggestions:", v6);
    objc_msgSend(*(id *)(a1 + 40), "_fetchPeople");

  }
  v7 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "vipPersonsFetchResult");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "changeDetailsForFetchResult:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(v9, "fetchResultAfterChanges");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setVipPersonsFetchResult:", v10);
    objc_msgSend(*(id *)(a1 + 40), "vipPersonsFetchResult");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fetchedObjects");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "copy");
    objc_msgSend(*(id *)(a1 + 40), "setVipPersons:", v13);

    v5 = 1;
  }
  v14 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "nonVIPPersonsFetchResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "changeDetailsForFetchResult:", v15);
  v20 = (id)objc_claimAutoreleasedReturnValue();

  if (v20)
  {
    objc_msgSend(v20, "fetchResultAfterChanges");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "setNonVIPPersonsFetchResult:", v16);
    objc_msgSend(*(id *)(a1 + 40), "nonVIPPersonsFetchResult");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "fetchedObjects");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "copy");
    objc_msgSend(*(id *)(a1 + 40), "setNonVIPPersons:", v19);

LABEL_8:
    objc_msgSend(*(id *)(a1 + 40), "notifyChanges");
    goto LABEL_9;
  }
  if (v5)
    goto LABEL_8;
LABEL_9:

}

void __67__PXPassiveContentPeoplePickerDataSourceBase_removeChangeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "changeObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObject:", *(_QWORD *)(a1 + 40));

}

void __64__PXPassiveContentPeoplePickerDataSourceBase_addChangeObserver___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "changeObservers");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", *(_QWORD *)(a1 + 40));

}

void __59__PXPassiveContentPeoplePickerDataSourceBase_notifyChanges__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "changeObservers", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "passiveContentPeoplePickerDataSourceChanged:", *(_QWORD *)(a1 + 32));
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

void __58__PXPassiveContentPeoplePickerDataSourceBase__fetchPeople__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
  unint64_t v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  uint32_t denom;
  uint32_t numer;
  NSObject *v20;
  NSObject *v21;
  os_signpost_id_t spid;
  uint64_t v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v30;
  __int16 v31;
  double v32;
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  v6 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "fetchPeople", ", buf, 2u);
  }
  spid = v3;

  info = 0;
  mach_timebase_info(&info);
  v23 = mach_absolute_time();
  objc_msgSend(*(id *)(a1 + 32), "userFeedbackCalculator");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "personUUIDsWithNegativeFeedback");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v25;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v13)
          objc_enumerationMutation(v10);
        objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v14), spid);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v33, 16);
    }
    while (v12);
  }

  PLWallpaperGetLog();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138543362;
    v30 = (const char *)v10;
    _os_log_impl(&dword_1A6789000, v16, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumPeoplePickerDataSource] Avoid Person with negative feedback %{public}@", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "computeAndCachePersonsWithPersonLocalIdentifierWithNegativeFeedback:", v9);
  v17 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v20 = v5;
  v21 = v20;
  if (v6 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v21, OS_SIGNPOST_INTERVAL_END, spid, "fetchPeople", ", buf, 2u);
  }

  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v30 = "fetchPeople";
    v31 = 2048;
    v32 = (float)((float)((float)((float)(v17 - v23) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1A6789000, v21, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

void __78__PXPassiveContentPeoplePickerDataSourceBase__fetchPeopleWallpaperSuggestions__block_invoke(uint64_t a1)
{
  NSObject *v2;
  os_signpost_id_t v3;
  NSObject *v4;
  NSObject *v5;
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
  void *v17;
  void *v18;
  int8x8_t v19;
  int8x8_t v20;
  uint8x8_t v21;
  uint64_t v22;
  NSObject *v23;
  uint64_t v24;
  uint64_t v25;
  uint32_t denom;
  uint32_t numer;
  NSObject *v28;
  NSObject *v29;
  void *v30;
  uint64_t v31;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v34;
  __int16 v35;
  double v36;
  _QWORD v37[2];
  _QWORD v38[3];

  v38[2] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "log");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = os_signpost_id_generate(v2);
  v4 = v2;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "FetchTopPeopleWallpaperSuggestions", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v31 = mach_absolute_time();
  objc_msgSend(*(id *)(a1 + 32), "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v9;
  v10 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(*(id *)(a1 + 32), "peopleSuggestionSubtypes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("subtype"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v14);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v37[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v37[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSortDescriptors:", v17);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v7);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (int8x8_t)objc_msgSend(*(id *)(a1 + 32), "requiredFeature");
  if (v19)
  {
    v20 = v19;
    v21 = (uint8x8_t)vcnt_s8(v19);
    v21.i16[0] = vaddlv_u8(v21);
    if (v21.u32[0] != 1)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), CFSTR("PXPassiveContentPeoplePickerDataSourceBase.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("__builtin_popcountll(requiredFeature) == 1"));

    }
    objc_msgSend(MEMORY[0x1E0D77EF8], "filterSuggestions:includingSingleFeature:", v18, *(_QWORD *)&v20);
    v22 = objc_claimAutoreleasedReturnValue();

    v18 = (void *)v22;
  }
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 64), v18);
  PLWallpaperGetLog();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    v24 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 134217984;
    v34 = (const char *)v24;
    _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_INFO, "[PXWallpaperSmartAlbumPeoplePickerDataSource] found %lu TopPeople/People suggestions", buf, 0xCu);
  }

  v25 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v28 = v5;
  v29 = v28;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v28))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A6789000, v29, OS_SIGNPOST_INTERVAL_END, v3, "FetchTopPeopleWallpaperSuggestions", ", buf, 2u);
  }

  if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v34 = "FetchTopPeopleWallpaperSuggestions";
    v35 = 2048;
    v36 = (float)((float)((float)((float)(v25 - v31) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

@end
