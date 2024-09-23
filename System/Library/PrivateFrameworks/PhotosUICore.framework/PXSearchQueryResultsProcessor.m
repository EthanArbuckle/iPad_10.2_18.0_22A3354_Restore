@implementation PXSearchQueryResultsProcessor

- (id)initForUnitTesting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXSearchQueryResultsProcessor;
  return -[PXSearchQueryResultsProcessor init](&v3, sel_init);
}

- (PXSearchQueryResultsProcessor)initWithPhotoLibrary:(id)a3 dispatchQueue:(id)a4 resultsProcessingHandler:(id)a5
{
  id v10;
  id v11;
  id v12;
  PXSearchQueryResultsProcessor *v13;
  PXSearchQueryResultsProcessor *v14;
  void *v15;
  id processingHandler;
  void *v18;
  void *v19;
  void *v20;
  objc_super v21;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v10)
  {
    if (v11)
      goto LABEL_3;
LABEL_8:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryResultsProcessor.m"), 46, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("dispatchQueue"));

    if (v12)
      goto LABEL_4;
    goto LABEL_9;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryResultsProcessor.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("photoLibrary"));

  if (!v11)
    goto LABEL_8;
LABEL_3:
  if (v12)
    goto LABEL_4;
LABEL_9:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryResultsProcessor.m"), 47, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("processingHandler"));

LABEL_4:
  v21.receiver = self;
  v21.super_class = (Class)PXSearchQueryResultsProcessor;
  v13 = -[PXSearchQueryResultsProcessor init](&v21, sel_init);
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_photoLibrary, a3);
    v15 = _Block_copy(v12);
    processingHandler = v14->_processingHandler;
    v14->_processingHandler = v15;

    objc_storeStrong((id *)&v14->_workQueue, a4);
    -[PXSearchQueryResultsProcessor addObserverForCuratedAssetsLibraryChanges](v14, "addObserverForCuratedAssetsLibraryChanges");
    -[PXSearchQueryResultsProcessor addObserverForPeopleChangeHandlingNotifications](v14, "addObserverForPeopleChangeHandlingNotifications");
  }

  return v14;
}

- (void)processCollectionSearchResults:(id)a3 assetSearchResults:(id)a4 personSearchResults:(id)a5 searchSuggestions:(id)a6 searchQueryMatchInfo:(id)a7 forSearchQuery:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  void *v35;
  void *v36;
  void *v38;
  _QWORD v39[4];
  id v40;
  id v41;
  id v42;
  id v43;
  id v44;
  id v45;
  PXSearchQueryResultsProcessor *v46;
  uint8_t buf[4];
  uint64_t v48;
  __int16 v49;
  id v50;
  uint64_t v51;

  v51 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a4;
  v16 = a6;
  v17 = a7;
  v18 = a8;
  v19 = a5;
  -[PXSearchQueryResultsProcessor photoLibrary](self, "photoLibrary");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "searchIndex");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "sceneTaxonomyProvider");
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  if (!+[PXSearchQueryResultsProcessor _verifyExpectedWorkQueue](PXSearchQueryResultsProcessor, "_verifyExpectedWorkQueue"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXSearchQueryResultsProcessor.m"), 72, CFSTR("Performing work on unexpected queue instead of queue with label: com.apple.photos.search.results_processing"));

  }
  v38 = v14;
  v22 = (void *)objc_msgSend(v14, "mutableCopy");
  -[PXSearchQueryResultsProcessor photoLibrary](self, "photoLibrary");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  +[PXSearchQueryResultsProcessor _fetchPersonsForPersonSearchResults:photoLibrary:](PXSearchQueryResultsProcessor, "_fetchPersonsForPersonSearchResults:photoLibrary:", v19, v23);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "fetchedObjects");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSearchQueryResultsProcessor _generateUpdatedPersonSearchResultsFromPersonSearchResults:persons:](self, "_generateUpdatedPersonSearchResultsFromPersonSearchResults:persons:", v19, v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v22, "addObjectsFromArray:", v26);
  PLPhotosSearchGetLog();
  v27 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    v48 = objc_msgSend(v26, "count");
    v49 = 2112;
    v50 = v18;
    _os_log_impl(&dword_1A6789000, v27, OS_LOG_TYPE_DEFAULT, "Photos Search Results Processor: returning %lu processed person search results for query: %@", buf, 0x16u);
  }

  objc_msgSend(v17, "sceneIdentifiers");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v39[0] = MEMORY[0x1E0C809B0];
  v39[1] = 3221225472;
  v39[2] = __157__PXSearchQueryResultsProcessor_processCollectionSearchResults_assetSearchResults_personSearchResults_searchSuggestions_searchQueryMatchInfo_forSearchQuery___block_invoke;
  v39[3] = &unk_1E51256D8;
  v40 = v22;
  v41 = v15;
  v42 = v16;
  v43 = v28;
  v44 = v18;
  v45 = v17;
  v46 = self;
  v29 = v17;
  v30 = v18;
  v31 = v28;
  v32 = v16;
  v33 = v15;
  v34 = v22;
  +[PXSearchResultsAssetCurator performCurationForAssetResults:sceneIdentifiers:searchQuery:sceneTaxonomyProvider:completion:](PXSearchResultsAssetCurator, "performCurationForAssetResults:sceneIdentifiers:searchQuery:sceneTaxonomyProvider:completion:", v33, v31, v30, v36, v39);

}

- (id)_generateUpdatedPersonSearchResultsFromPersonSearchResults:(id)a3 persons:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t j;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  _BOOL8 v22;
  uint64_t v23;
  PXSearchResultPersonOrPet *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  PXSearchResultPersonOrPet *v28;
  void *v29;
  void *v30;
  PXSearchQueryResultsProcessor *v32;
  id v33;
  id v34;
  id obj;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "count"))
  {
    v32 = self;
    v39 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v45;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v45 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v44 + 1) + 8 * i);
          objc_msgSend(v13, "personUUID", v32);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "setObject:forKeyedSubscript:", v13, v14);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v44, v49, 16);
      }
      while (v10);
    }
    v34 = v6;

    v37 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v33 = v7;
    obj = v7;
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
    if (v38)
    {
      v36 = *(_QWORD *)v41;
      do
      {
        for (j = 0; j != v38; ++j)
        {
          if (*(_QWORD *)v41 != v36)
            objc_enumerationMutation(obj);
          v16 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * j);
          objc_msgSend(v16, "uuid", v32);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "px_localizedName");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          +[PXSearchResultPersonOrPet uniqueIdentiferFromPersonUUID:displayName:](PXSearchResultPersonOrPet, "uniqueIdentiferFromPersonUUID:displayName:", v17, v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();

          LODWORD(v18) = objc_msgSend(v16, "detectionType");
          objc_msgSend(v16, "uuid");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v39, "objectForKeyedSubscript:", v20);
          v21 = (void *)objc_claimAutoreleasedReturnValue();

          v22 = objc_msgSend(v21, "subtype") == 1;
          v23 = objc_msgSend(v21, "assetCount");
          v24 = [PXSearchResultPersonOrPet alloc];
          objc_msgSend(v16, "px_localizedName");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "uuid");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          if ((_DWORD)v18 == 1)
            v27 = 3;
          else
            v27 = 4;
          v28 = -[PXSearchResultPersonOrPet initWithTitle:assetCount:personUUID:identifier:type:subtype:](v24, "initWithTitle:assetCount:personUUID:identifier:type:subtype:", v25, v23, v26, v19, v27, v22);

          objc_msgSend(v16, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v37, "setObject:forKeyedSubscript:", v28, v29);

        }
        v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v48, 16);
      }
      while (v38);
    }

    -[PXSearchQueryResultsProcessor setPersonSearchResultsMap:](v32, "setPersonSearchResultsMap:", v37);
    objc_msgSend(v37, "allValues");
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v33;
    v6 = v34;
  }
  else
  {
    v30 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v30;
}

- (void)_executeResultsHandlerForUpdatedSearchQueryResult:(id)a3 curatedAssetsSearchResults:(id)a4
{
  id v6;
  id v7;
  void (**v8)(id, uint64_t, id);

  v6 = a4;
  v7 = a3;
  -[PXSearchQueryResultsProcessor setCurrentSearchQueryResult:](self, "setCurrentSearchQueryResult:", v7);
  -[PXSearchQueryResultsProcessor setCuratedAssetsSearchResults:](self, "setCuratedAssetsSearchResults:", v6);

  -[PXSearchQueryResultsProcessor processingHandler](self, "processingHandler");
  v8 = (void (**)(id, uint64_t, id))objc_claimAutoreleasedReturnValue();
  v8[2](v8, 1, v7);

}

- (id)processingHandler
{
  return self->_processingHandler;
}

- (PXSearchQueryResult)currentSearchQueryResult
{
  return self->_currentSearchQueryResult;
}

- (void)setCurrentSearchQueryResult:(id)a3
{
  objc_storeStrong((id *)&self->_currentSearchQueryResult, a3);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSDictionary)personSearchResultsMap
{
  return self->_personSearchResultsMap;
}

- (void)setPersonSearchResultsMap:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (NSArray)curatedAssetsSearchResults
{
  return self->_curatedAssetsSearchResults;
}

- (void)setCuratedAssetsSearchResults:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSArray)removedObjects
{
  return self->_removedObjects;
}

- (void)setRemovedObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSArray)hiddenObjects
{
  return self->_hiddenObjects;
}

- (void)setHiddenObjects:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hiddenObjects, 0);
  objc_storeStrong((id *)&self->_removedObjects, 0);
  objc_storeStrong((id *)&self->_curatedAssetsSearchResults, 0);
  objc_storeStrong((id *)&self->_personSearchResultsMap, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_currentSearchQueryResult, 0);
  objc_storeStrong(&self->_processingHandler, 0);
}

void __157__PXSearchQueryResultsProcessor_processCollectionSearchResults_assetSearchResults_personSearchResults_searchSuggestions_searchQueryMatchInfo_forSearchQuery___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  PXSearchQueryResult *v15;
  PXSearchQueryResult *v16;
  uint8_t buf[4];
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  __int16 v23;
  uint64_t v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  int v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = *(void **)(a1 + 32);
  v7 = a2;
  objc_msgSend(v6, "addObjectsFromArray:", v7);
  PLPhotosSearchGetLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = objc_msgSend(*(id *)(a1 + 32), "count");
    v10 = objc_msgSend(*(id *)(a1 + 40), "count");
    v11 = objc_msgSend(v5, "count");
    v12 = objc_msgSend(*(id *)(a1 + 48), "count");
    v13 = objc_msgSend(*(id *)(a1 + 56), "count");
    v14 = *(_QWORD *)(a1 + 64);
    *(_DWORD *)buf = 134219522;
    v18 = v9;
    v19 = 2048;
    v20 = v10;
    v21 = 2048;
    v22 = v11;
    v23 = 2048;
    v24 = v12;
    v25 = 2048;
    v26 = v13;
    v27 = 1024;
    v28 = 0;
    v29 = 2112;
    v30 = v14;
    _os_log_impl(&dword_1A6789000, v8, OS_LOG_TYPE_DEFAULT, "Photos Search Results Processor: returning %lu processed search results, %lu asset search results, %lu curated assets search results, %lu search suggestions, %lu scene identifiers, %i reloadItemIdentifiers for query: %@", buf, 0x44u);
  }

  v15 = [PXSearchQueryResult alloc];
  v16 = -[PXSearchQueryResult initWithSearchQuery:searchResults:searchAssetResults:curatedAssetsFetchResult:searchSuggestions:searchQueryMatchInfo:reloadItemIdentifiers:](v15, "initWithSearchQuery:searchResults:searchAssetResults:curatedAssetsFetchResult:searchSuggestions:searchQueryMatchInfo:reloadItemIdentifiers:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 72), MEMORY[0x1E0C9AA60]);
  objc_msgSend(*(id *)(a1 + 80), "_executeResultsHandlerForUpdatedSearchQueryResult:curatedAssetsSearchResults:", v16, v7);

}

+ (id)_fetchPersonsForPersonSearchResults:(id)a3 photoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    PXMap();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1570], "fetchOptionsWithPhotoLibrary:orObject:", v6, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1570], "px_defaultDetectionTypes");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setIncludedDetectionTypes:", v9);

    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchPersonsWithLocalIdentifiers:options:", v7, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (BOOL)_verifyExpectedWorkQueue
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", dispatch_queue_get_label(0));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(CFSTR("com.apple.photos.search.results_processing"), "isEqualToString:", v2);

  return v3;
}

uint64_t __82__PXSearchQueryResultsProcessor__fetchPersonsForPersonSearchResults_photoLibrary___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "personUUID");
}

- (id)_localIdentifierForPersonUUID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", a3);
}

- (void)addObserverForPeopleChangeHandlingNotifications
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__processPeopleChangesFromNotification_, CFSTR("PXPeopleConfirmationDidFinish"), 0);

}

- (void)_processPeopleChangesFromNotification:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[16];

  v4 = a3;
  -[PXSearchQueryResultsProcessor currentSearchQueryResult](self, "currentSearchQueryResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "wantsLibraryChanges");

  if ((v8 & 1) != 0)
  {
    -[PXSearchQueryResultsProcessor workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __93__PXSearchQueryResultsProcessor_PeopleChangeHandling___processPeopleChangesFromNotification___block_invoke;
    v11[3] = &unk_1E5148D08;
    v11[4] = self;
    v12 = v4;
    dispatch_async(v9, v11);

  }
  else
  {
    PLPhotosSearchGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Photos Search Query Results Processor: library change detected for people, ignoring change as library change handling is disabled for this query.", buf, 2u);
    }

  }
}

- (void)_processPersonMergeFromNotification:(id)a3 searchQueryResult:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  NSObject *v20;
  id v21;
  uint8_t buf[4];
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sourcePerson");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetPerson");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "otherPersons");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PXMap();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithArray:", v11);
  if (objc_msgSend(v9, "verifiedType"))
    goto LABEL_6;
  v21 = v6;
  PLUIGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v9;
    _os_log_impl(&dword_1A6789000, v13, OS_LOG_TYPE_ERROR, "The notification for bootstrap / confirmation flow provided an invalid target person: %@", buf, 0xCu);
  }

  -[PXSearchQueryResultsProcessor photoLibrary](self, "photoLibrary");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "librarySpecificFetchOptions");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "uuid");
  v16 = objc_claimAutoreleasedReturnValue();
  if (v16)
  {
    v17 = (void *)v16;
    objc_msgSend(MEMORY[0x1E0CD16C0], "fetchFinalMergeTargetPersonsForPersonWithUUID:options:", v16, v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "firstObject");
    v19 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v19;
    v6 = v21;
LABEL_6:
    -[PXSearchQueryResultsProcessor _updatePersonSearchResultsForSearchQueryResult:withMergeTargetPerson:sourcePerson:tombstonedCandidatesLocalIdentifiers:](self, "_updatePersonSearchResultsForSearchQueryResult:withMergeTargetPerson:sourcePerson:tombstonedCandidatesLocalIdentifiers:", v6, v9, v8, v12);
    goto LABEL_7;
  }
  PXAssertGetLog();
  v20 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v23 = v8;
    _os_log_error_impl(&dword_1A6789000, v20, OS_LOG_TYPE_ERROR, "The notification for bootstrap / confirmation flow provided an invalid source person: %@", buf, 0xCu);
  }

LABEL_7:
}

- (void)_processPersonNameChangeFromConfirmationInfo:(id)a3 searchQueryResult:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXSearchResultPersonOrPet *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  PXSearchResultPersonOrPet *v23;
  NSObject *v24;
  void *v25;
  void *v26;
  void *v27;
  PXSearchQueryResultsProcessor *v28;
  id v29;
  uint8_t buf[4];
  void *v31;
  __int16 v32;
  void *v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "targetPerson");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourcePerson");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v29 = v7;
    objc_msgSend(v9, "uuid");
    v10 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "uuid");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = self;
    -[PXSearchQueryResultsProcessor personSearchResultsMap](self, "personSearchResultsMap");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(v11, "mutableCopy");

    objc_msgSend(v12, "objectForKeyedSubscript:", v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", 0, v10);
    v26 = (void *)v10;
    objc_msgSend(v8, "uuid");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedName");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchResultPersonOrPet uniqueIdentiferFromPersonUUID:displayName:](PXSearchResultPersonOrPet, "uniqueIdentiferFromPersonUUID:displayName:", v14, v15);
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "uuid");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    v18 = [PXSearchResultPersonOrPet alloc];
    objc_msgSend(v6, "localizedName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v8, "numberOfAssets");
    objc_msgSend(v8, "uuid");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "detectionType") == 1)
      v22 = 3;
    else
      v22 = 4;
    v23 = -[PXSearchResultPersonOrPet initWithTitle:assetCount:personUUID:identifier:type:subtype:](v18, "initWithTitle:assetCount:personUUID:identifier:type:subtype:", v19, v20, v21, v25, v22, objc_msgSend(v17, "subtype"));

    objc_msgSend(v12, "setObject:forKeyedSubscript:", v23, v27);
    v7 = v29;
    -[PXSearchQueryResultsProcessor _updateSearchQueryResult:updatedPersonSearchResultsMap:](v28, "_updateSearchQueryResult:updatedPersonSearchResultsMap:", v29, v12);

  }
  else
  {
    PXAssertGetLog();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v31 = v8;
      v32 = 2112;
      v33 = v9;
      _os_log_error_impl(&dword_1A6789000, v24, OS_LOG_TYPE_ERROR, "The notification for bootstrap rename flow provided a payload object with an unexpected target: %@ or source: %@ person type", buf, 0x16u);
    }

  }
}

- (void)_updatePersonSearchResultsForSearchQueryResult:(id)a3 withMergeTargetPerson:(id)a4 sourcePerson:(id)a5 tombstonedCandidatesLocalIdentifiers:(id)a6
{
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  int v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  PXSearchQueryResultsProcessor *v23;
  void *v24;
  void *v25;
  NSObject *v26;
  char v27;
  uint64_t v28;
  NSObject *v29;
  void *v30;
  void *v31;
  PXSearchResultPersonOrPet *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  void *v38;
  void *v39;
  uint64_t v40;
  PXSearchResultPersonOrPet *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  void *v45;
  PXSearchResultPersonOrPet *v46;
  void *v47;
  uint64_t v48;
  id v49;
  id v50;
  id v51;
  int v52;
  uint64_t v53;
  void *v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  id v61;
  _BYTE v62[128];
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v55 = a4;
  v51 = a5;
  v50 = a6;
  -[PXSearchQueryResultsProcessor personSearchResultsMap](self, "personSearchResultsMap");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v54 = (void *)objc_msgSend(v11, "mutableCopy");

  v58 = 0u;
  v59 = 0u;
  v56 = 0u;
  v57 = 0u;
  -[PXSearchQueryResultsProcessor personSearchResultsMap](self, "personSearchResultsMap");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allValues");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
  if (!v14)
    goto LABEL_24;
  v15 = v14;
  v49 = v10;
  v16 = 0;
  v17 = *(_QWORD *)v57;
  do
  {
    v18 = 0;
    do
    {
      if (*(_QWORD *)v57 != v17)
        objc_enumerationMutation(v13);
      objc_msgSend(*(id *)(*((_QWORD *)&v56 + 1) + 8 * v18), "personUUID");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[PXSearchQueryResultsProcessor _localIdentifierForPersonUUID:](self, "_localIdentifierForPersonUUID:", v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v55, "localIdentifier");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v20, "isEqualToString:", v21) & 1) == 0)
      {
        v52 = v16;
        v22 = v17;
        v23 = self;
        v24 = v13;
        objc_msgSend(v51, "localIdentifier");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v20, "isEqualToString:", v25))
        {
          v27 = objc_msgSend(v50, "containsObject:", v20);

          v13 = v24;
          self = v23;
          v17 = v22;
          v16 = v52;
          if ((v27 & 1) == 0)
            goto LABEL_13;
          goto LABEL_10;
        }

        v13 = v24;
        self = v23;
        v17 = v22;
      }

LABEL_10:
      PLPhotosSearchGetLog();
      v26 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A6789000, v26, OS_LOG_TYPE_DEFAULT, "Photos Search Query Results Processor: Found matching target, source or tombstoned person for existing search result; will create new search result with target person",
          buf,
          2u);
      }

      objc_msgSend(v54, "removeObjectForKey:", v19);
      v16 = 1;
LABEL_13:

      ++v18;
    }
    while (v15 != v18);
    v28 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v56, v62, 16);
    v15 = v28;
  }
  while (v28);

  v10 = v49;
  if ((v16 & 1) != 0)
  {
    PLPhotosSearchGetLog();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v61 = v55;
      _os_log_impl(&dword_1A6789000, v29, OS_LOG_TYPE_DEFAULT, "Photos Search Query Results Processor: Creating new search result for person: %@", buf, 0xCu);
    }

    objc_msgSend(v55, "uuid");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "px_localizedName");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    +[PXSearchResultPersonOrPet uniqueIdentiferFromPersonUUID:displayName:](PXSearchResultPersonOrPet, "uniqueIdentiferFromPersonUUID:displayName:", v30, v31);
    v53 = objc_claimAutoreleasedReturnValue();

    v32 = [PXSearchResultPersonOrPet alloc];
    objc_msgSend(v55, "px_localizedName");
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v55, "numberOfAssets");
    objc_msgSend(v55, "uuid");
    v35 = objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v55, "detectionType");
    v37 = 3;
    if (v36 != 1)
      v37 = 4;
    v48 = v37;
    objc_msgSend(v55, "uuid");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "objectForKeyedSubscript:", v38);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend(v39, "subtype");
    v41 = v32;
    v42 = v33;
    v43 = (void *)v33;
    v44 = v34;
    v45 = (void *)v35;
    v13 = (void *)v53;
    v46 = -[PXSearchResultPersonOrPet initWithTitle:assetCount:personUUID:identifier:type:subtype:](v41, "initWithTitle:assetCount:personUUID:identifier:type:subtype:", v42, v44, v35, v53, v48, v40);

    objc_msgSend(v55, "uuid");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "setObject:forKeyedSubscript:", v46, v47);

LABEL_24:
  }
  -[PXSearchQueryResultsProcessor _updateSearchQueryResult:updatedPersonSearchResultsMap:](self, "_updateSearchQueryResult:updatedPersonSearchResultsMap:", v10, v54);

}

- (void)_updateSearchQueryResult:(id)a3 updatedPersonSearchResultsMap:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PXSearchQueryResult *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  PXSearchQueryResult *v18;
  void *v19;
  id v20;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "searchResults");
  v20 = (id)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v20, "mutableCopy");
  -[PXSearchQueryResultsProcessor personSearchResultsMap](self, "personSearchResultsMap");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "allValues");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObjectsInArray:", v10);
  objc_msgSend(v6, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addObjectsFromArray:", v11);

  -[PXSearchQueryResultsProcessor setPersonSearchResultsMap:](self, "setPersonSearchResultsMap:", v6);
  v12 = [PXSearchQueryResult alloc];
  objc_msgSend(v7, "searchQuery");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchAssetResults");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "curatedAssetsFetchResult");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchSuggestions");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchQueryMatchInfo");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = -[PXSearchQueryResult initWithSearchQuery:searchResults:searchAssetResults:curatedAssetsFetchResult:searchSuggestions:searchQueryMatchInfo:reloadItemIdentifiers:](v12, "initWithSearchQuery:searchResults:searchAssetResults:curatedAssetsFetchResult:searchSuggestions:searchQueryMatchInfo:reloadItemIdentifiers:", v13, v8, v14, v15, v16, v17, MEMORY[0x1E0C9AA60]);
  -[PXSearchQueryResultsProcessor curatedAssetsSearchResults](self, "curatedAssetsSearchResults");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[PXSearchQueryResultsProcessor _executeResultsHandlerForUpdatedSearchQueryResult:curatedAssetsSearchResults:](self, "_executeResultsHandlerForUpdatedSearchQueryResult:curatedAssetsSearchResults:", v18, v19);

}

uint64_t __109__PXSearchQueryResultsProcessor_PeopleChangeHandling___processPersonMergeFromNotification_searchQueryResult___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "localIdentifier");
}

void __93__PXSearchQueryResultsProcessor_PeopleChangeHandling___processPeopleChangesFromNotification___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  NSObject *v5;
  uint64_t v6;
  _BOOL4 v7;
  void *v8;
  void *v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "currentSearchQueryResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "searchResults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    PLPhotosSearchGetLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v6 = *(_QWORD *)(a1 + 40);
      v10 = 138412546;
      v11 = v6;
      v12 = 2112;
      v13 = v2;
      _os_log_impl(&dword_1A6789000, v5, OS_LOG_TYPE_DEFAULT, "Photos Search Query Results Processor: Processing people changes from notification: %@, for search result: %@", (uint8_t *)&v10, 0x16u);
    }

    v7 = +[PXSearchQueryResultsProcessor _isBootstrapNameChange:](PXSearchQueryResultsProcessor, "_isBootstrapNameChange:", *(_QWORD *)(a1 + 40));
    v8 = *(void **)(a1 + 32);
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 40), "object");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_processPersonNameChangeFromConfirmationInfo:searchQueryResult:", v9, v2);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 32), "_processPersonMergeFromNotification:searchQueryResult:", *(_QWORD *)(a1 + 40), v2);
    }
  }

}

+ (BOOL)_isBootstrapNameChange:(id)a3
{
  id v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v11;
  objc_class *v12;
  void *v13;
  objc_class *v14;
  void *v15;

  v5 = a3;
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("PXPeopleConfirmationDidFinish"));

  if (!v7)
  {
    v9 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v5, "object");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchQueryResultsProcessor+PeopleChangeHandling.m"), 32, CFSTR("%@ should be an instance inheriting from %@, but it is nil"), CFSTR("notification.object"), v13);
LABEL_9:

    goto LABEL_4;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "px_descriptionForAssertionMessage");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PXSearchQueryResultsProcessor+PeopleChangeHandling.m"), 32, CFSTR("%@ should be an instance inheriting from %@, but it is %@"), CFSTR("notification.object"), v13, v15);

    goto LABEL_9;
  }
LABEL_4:
  v9 = objc_msgSend(v8, "wasNaming");

LABEL_6:
  return v9;
}

- (void)addObserverForCuratedAssetsLibraryChanges
{
  id v3;

  -[PXSearchQueryResultsProcessor photoLibrary](self, "photoLibrary");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerChangeObserver:", self);

}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[PXSearchQueryResultsProcessor photoLibrary](self, "photoLibrary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unregisterChangeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PXSearchQueryResultsProcessor;
  -[PXSearchQueryResultsProcessor dealloc](&v4, sel_dealloc);
}

- (void)photoLibraryDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  NSObject *v10;
  _QWORD block[4];
  NSObject *v12;
  id v13;
  PXSearchQueryResultsProcessor *v14;
  uint8_t buf[16];

  v4 = a3;
  -[PXSearchQueryResultsProcessor currentSearchQueryResult](self, "currentSearchQueryResult");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchQuery");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "options");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "wantsLibraryChanges");

  if ((v8 & 1) != 0)
  {
    -[PXSearchQueryResultsProcessor workQueue](self, "workQueue");
    v9 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __84__PXSearchQueryResultsProcessor_CuratedAssetsChangeHandling__photoLibraryDidChange___block_invoke;
    block[3] = &unk_1E51457C8;
    v12 = v5;
    v13 = v4;
    v14 = self;
    dispatch_async(v9, block);

    v10 = v12;
  }
  else
  {
    PLPhotosSearchGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v10, OS_LOG_TYPE_DEFAULT, "Photos Search Query Results Processor: library change detected for curated assets, ignoring change as library change handling is disabled for this query.", buf, 2u);
    }
  }

}

- (BOOL)_shouldRecurateForChangeDetails:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  unint64_t v12;
  char v13;
  void *v14;
  uint64_t v15;
  void *v16;
  int v17;
  void *v18;

  v4 = a3;
  objc_msgSend(v4, "fetchResultBeforeChanges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fetchedObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "fetchResultAfterChanges");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchedObjects");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[PXSearchQueryResultsProcessor hiddenObjects](self, "hiddenObjects");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    -[PXSearchQueryResultsProcessor hiddenObjects](self, "hiddenObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v10, "mutableCopy");

  }
  else
  {
    v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }

  if (objc_msgSend(v6, "count"))
  {
    v12 = 0;
    v13 = 0;
    do
    {
      if (v12 >= objc_msgSend(v6, "count"))
      {
        v14 = 0;
      }
      else
      {
        objc_msgSend(v6, "objectAtIndexedSubscript:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
      }
      if (v12 >= objc_msgSend(v8, "count"))
      {
        v16 = 0;
      }
      else
      {
        objc_msgSend(v8, "objectAtIndexedSubscript:", v12);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v14)
        {
          if (v15)
          {
            v17 = objc_msgSend(v14, "isHidden");
            if (v17 != objc_msgSend(v16, "isHidden"))
            {
              objc_msgSend(v11, "addObject:", v16);
              v13 = 1;
            }
          }
        }
      }

      ++v12;
    }
    while (v12 < objc_msgSend(v6, "count"));
  }
  else
  {
    v13 = 0;
  }
  v18 = (void *)objc_msgSend(v11, "copy");
  -[PXSearchQueryResultsProcessor setHiddenObjects:](self, "setHiddenObjects:", v18);

  return v13 & 1;
}

- (void)_performCurationAndUpdateChangedObjects:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  PXSearchQueryResultsProcessor *v17;
  id v18;

  v4 = a3;
  -[PXSearchQueryResultsProcessor photoLibrary](self, "photoLibrary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "searchIndex");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sceneTaxonomyProvider");
  v14 = (id)objc_claimAutoreleasedReturnValue();

  -[PXSearchQueryResultsProcessor currentSearchQueryResult](self, "currentSearchQueryResult");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchAssetResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchQueryMatchInfo");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sceneIdentifiers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "searchQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __102__PXSearchQueryResultsProcessor_CuratedAssetsChangeHandling___performCurationAndUpdateChangedObjects___block_invoke;
  v15[3] = &unk_1E51418F8;
  v16 = v7;
  v17 = self;
  v18 = v4;
  v12 = v4;
  v13 = v7;
  +[PXSearchResultsAssetCurator performCurationForAssetResults:sceneIdentifiers:searchQuery:sceneTaxonomyProvider:completion:](PXSearchResultsAssetCurator, "performCurationForAssetResults:sceneIdentifiers:searchQuery:sceneTaxonomyProvider:completion:", v8, v10, v11, v14, v15);

}

void __102__PXSearchQueryResultsProcessor_CuratedAssetsChangeHandling___performCurationAndUpdateChangedObjects___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  PXSearchQueryResult *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  PXSearchQueryResult *v16;
  void *v17;
  id v18;

  v5 = *(void **)(a1 + 32);
  v6 = a3;
  v7 = a2;
  objc_msgSend(v5, "searchResults");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(*(id *)(a1 + 40), "curatedAssetsSearchResults");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "removeObjectsInArray:", v17);
  objc_msgSend(v18, "addObjectsFromArray:", v7);
  +[PXSearchQueryResultsProcessor _reloadItemIdentifiersForChangedObjects:inAssetSearchResults:](PXSearchQueryResultsProcessor, "_reloadItemIdentifiersForChangedObjects:inAssetSearchResults:", *(_QWORD *)(a1 + 48), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = [PXSearchQueryResult alloc];
  objc_msgSend(*(id *)(a1 + 32), "searchQuery");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v18, "copy");
  objc_msgSend(*(id *)(a1 + 32), "searchAssetResults");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "searchSuggestions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "searchQueryMatchInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = -[PXSearchQueryResult initWithSearchQuery:searchResults:searchAssetResults:curatedAssetsFetchResult:searchSuggestions:searchQueryMatchInfo:reloadItemIdentifiers:](v10, "initWithSearchQuery:searchResults:searchAssetResults:curatedAssetsFetchResult:searchSuggestions:searchQueryMatchInfo:reloadItemIdentifiers:", v11, v12, v13, v6, v14, v15, v9);

  objc_msgSend(*(id *)(a1 + 40), "_executeResultsHandlerForUpdatedSearchQueryResult:curatedAssetsSearchResults:", v16, v7);
}

void __84__PXSearchQueryResultsProcessor_CuratedAssetsChangeHandling__photoLibraryDidChange___block_invoke(id *a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  char v21;
  void *v22;
  NSObject *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  PXSearchQueryResult *v30;
  NSObject *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t j;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  int v43;
  NSObject *v44;
  uint64_t v45;
  uint64_t v46;
  void *v47;
  void *v48;
  void *v49;
  PXSearchQueryResult *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  char v56;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  uint8_t buf[4];
  uint64_t v67;
  __int16 v68;
  uint64_t v69;
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1[4], "curatedAssetsFetchResult");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1[5], "changeDetailsForFetchResult:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "removedObjects");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v55, "count");
    if (v5)
    {
      objc_msgSend(a1[6], "removedObjects");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(a1[6], "removedObjects");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = (id)objc_msgSend(v7, "mutableCopy");

      }
      else
      {
        v8 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      }

      objc_msgSend(v8, "addObjectsFromArray:", v55);
      objc_msgSend(a1[6], "setRemovedObjects:", v8);

    }
    objc_msgSend(v4, "changedObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v22, "count"))
    {
      if (!v5 && (objc_msgSend(a1[6], "_shouldRecurateForChangeDetails:", v4) & 1) == 0)
      {
LABEL_26:
        if (objc_msgSend(v22, "count"))
        {
          PLPhotosSearchGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            v67 = objc_msgSend(v22, "count");
            _os_log_impl(&dword_1A6789000, v23, OS_LOG_TYPE_DEFAULT, "Photos Search Query Results Processor: library change detected for curated assets, updating %lu changed objects.", buf, 0xCu);
          }

          objc_msgSend(a1[6], "currentSearchQueryResult");
          v52 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(a1[6], "curatedAssetsSearchResults");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          +[PXSearchQueryResultsProcessor _reloadItemIdentifiersForChangedObjects:inAssetSearchResults:](PXSearchQueryResultsProcessor, "_reloadItemIdentifiersForChangedObjects:inAssetSearchResults:", v22, v53);
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v50 = [PXSearchQueryResult alloc];
          objc_msgSend(v52, "searchQuery");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "searchResults");
          v24 = objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "searchAssetResults");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "fetchResultAfterChanges");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "searchSuggestions");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v52, "searchQueryMatchInfo");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)v24;
          v30 = -[PXSearchQueryResult initWithSearchQuery:searchResults:searchAssetResults:curatedAssetsFetchResult:searchSuggestions:searchQueryMatchInfo:reloadItemIdentifiers:](v50, "initWithSearchQuery:searchResults:searchAssetResults:curatedAssetsFetchResult:searchSuggestions:searchQueryMatchInfo:reloadItemIdentifiers:", v49, v24, v25, v26, v27, v28, v57);

          objc_msgSend(a1[6], "_executeResultsHandlerForUpdatedSearchQueryResult:curatedAssetsSearchResults:", v30, v53);
        }
        goto LABEL_51;
      }
    }
    else if (!v5)
    {
      goto LABEL_26;
    }
    PLPhotosSearchGetLog();
    v31 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A6789000, v31, OS_LOG_TYPE_DEFAULT, "Photos Search Query Results Processor: library change detected for curated assets, new curation required.", buf, 2u);
    }

    objc_msgSend(a1[6], "_performCurationAndUpdateChangedObjects:", v22);
  }
  else
  {
    v51 = v2;
    objc_msgSend(a1[6], "removedObjects");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = (void *)objc_msgSend(v9, "mutableCopy");

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    objc_msgSend(a1[6], "removedObjects");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
    if (v11)
    {
      v12 = v11;
      v56 = 0;
      v13 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v63 != v13)
            objc_enumerationMutation(v10);
          v15 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
          objc_msgSend(a1[5], "changeDetailsForObject:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = v16;
          if (v16)
          {
            objc_msgSend(v16, "objectAfterChanges");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectBeforeChanges");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v19, "isHidden") & 1) != 0)
              v20 = 0;
            else
              v20 = objc_msgSend(v18, "isHidden");
            v21 = objc_msgSend(v17, "objectWasDeleted");
            if ((v20 & 1) == 0 && (v21 & 1) == 0)
            {
              objc_msgSend(v55, "removeObject:", v15);
              v56 = 1;
            }

          }
        }
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v62, v71, 16);
      }
      while (v12);
    }
    else
    {
      v56 = 0;
    }

    objc_msgSend(a1[6], "hiddenObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    v54 = (void *)objc_msgSend(v32, "mutableCopy");

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    objc_msgSend(a1[6], "hiddenObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
    if (v34)
    {
      v35 = v34;
      v36 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v35; ++j)
        {
          if (*(_QWORD *)v59 != v36)
            objc_enumerationMutation(v33);
          v38 = *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j);
          objc_msgSend(a1[5], "changeDetailsForObject:", v38);
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v39;
          if (v39)
          {
            objc_msgSend(v39, "objectAfterChanges");
            v41 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "objectBeforeChanges");
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v43 = objc_msgSend(v41, "isHidden");
            if (v43 != objc_msgSend(v42, "isHidden"))
            {
              objc_msgSend(v54, "removeObject:", v38);
              v56 = 1;
            }

          }
        }
        v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v58, v70, 16);
      }
      while (v35);
    }

    if ((v56 & 1) != 0)
    {
      PLPhotosSearchGetLog();
      v44 = objc_claimAutoreleasedReturnValue();
      v4 = 0;
      v2 = v51;
      v22 = v54;
      if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
      {
        v45 = objc_msgSend(v54, "count");
        v46 = objc_msgSend(v55, "count");
        *(_DWORD *)buf = 134218240;
        v67 = v45;
        v68 = 2048;
        v69 = v46;
        _os_log_impl(&dword_1A6789000, v44, OS_LOG_TYPE_DEFAULT, "Photos Search Query Results Processor: library change detected for curated assets for the reveral of %lu hidden or %lu deleted objects.", buf, 0x16u);
      }

      objc_msgSend(a1[6], "_performCurationAndUpdateChangedObjects:", MEMORY[0x1E0C9AA60]);
      v47 = (void *)objc_msgSend(v54, "copy");
      objc_msgSend(a1[6], "setHiddenObjects:", v47);

      v48 = (void *)objc_msgSend(v55, "copy");
      objc_msgSend(a1[6], "setRemovedObjects:", v48);

    }
    else
    {
      v4 = 0;
      v2 = v51;
      v22 = v54;
    }
  }
LABEL_51:

}

+ (id)_reloadItemIdentifiersForChangedObjects:(id)a3 inAssetSearchResults:(id)a4
{
  id v4;
  id v5;
  void *v6;
  void *v8;

  v4 = a4;
  PXMap();
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v8;
  PXMap();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id __123__PXSearchQueryResultsProcessor_CuratedAssetsChangeHandling___reloadItemIdentifiersForChangedObjects_inAssetSearchResults___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "assetUUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v4, "containsObject:", v5);

  if ((_DWORD)v4)
  {
    objc_msgSend(v3, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __123__PXSearchQueryResultsProcessor_CuratedAssetsChangeHandling___reloadItemIdentifiersForChangedObjects_inAssetSearchResults___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "uuid");
}

@end
