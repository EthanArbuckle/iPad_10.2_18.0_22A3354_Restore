@implementation PHASuggestionController

- (PHASuggestionController)initWithGraphManager:(id)a3
{
  id v5;
  PHASuggestionController *v6;
  PHASuggestionController *v7;
  uint64_t v8;
  PHPhotoLibrary *photoLibrary;
  os_log_t v10;
  OS_os_log *loggingConnection;
  NSMutableSet *v12;
  NSMutableSet *deletedSuggestionLocalIdentifiers;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHASuggestionController;
  v6 = -[PHASuggestionController init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphManager, a3);
    objc_msgSend(v5, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

    v10 = os_log_create("com.apple.photoanalysisd", "suggestions");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v10;

    v7->_newFeaturedSuggestionsCount = 0;
    v12 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E0C99E20]);
    deletedSuggestionLocalIdentifiers = v7->_deletedSuggestionLocalIdentifiers;
    v7->_deletedSuggestionLocalIdentifiers = v12;

  }
  return v7;
}

- (NSArray)existingSuggestions
{
  return (NSArray *)objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithArray:", self->_existingSuggestions);
}

- (void)ingestExistingSuggestionsWithOptions:(id)a3
{
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
  _QWORD v14[4];

  v14[3] = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "localToday");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    objc_msgSend(MEMORY[0x1E0D4B130], "universalDateFromLocalDate:", v4);
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("activationDate"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setSortDescriptors:", v10);

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate < %@"), v5);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setPredicate:", v11);

  }
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "fetchedObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASuggestionController ingestSuggestions:atDate:](self, "ingestSuggestions:atDate:", v13, v5);

}

- (id)_existingSuggestionsForProfile:(unsigned __int8)a3
{
  NSMutableArray *v4;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  if ((a3 - 3) >= 3)
  {
    if (a3 == 1)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v4 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D76258], "suggestionTypesWithProfile:", 1);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = 0u;
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v7 = self->_existingSuggestions;
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v8)
      {
        v9 = v8;
        v10 = *(_QWORD *)v14;
        do
        {
          for (i = 0; i != v9; ++i)
          {
            if (*(_QWORD *)v14 != v10)
              objc_enumerationMutation(v7);
            v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
            if (objc_msgSend(v6, "containsIndex:", objc_msgSend(v12, "type", (_QWORD)v13)))
              -[NSMutableArray addObject:](v4, "addObject:", v12);
          }
          v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        }
        while (v9);
      }

      return v4;
    }
    if (a3)
      return MEMORY[0x1E0C9AA60];
  }
  v4 = self->_existingSuggestions;
  return v4;
}

- (id)deniedSuggestionsForProfile:(unsigned __int8)a3
{
  uint64_t v4;
  id v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  id v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t j;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t k;
  void *v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  if ((a3 & 0xFFFFFFFB) == 2)
    return MEMORY[0x1E0C9AA60];
  v4 = a3;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v7 = self->_existingSuggestions;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v36 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (objc_msgSend(v12, "state") == 4)
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v35, v41, 16);
    }
    while (v9);
  }

  if (objc_msgSend(v6, "count"))
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v4 <= 4 && ((1 << v4) & 0x19) != 0)
    {
      v33 = 0u;
      v34 = 0u;
      v31 = 0u;
      v32 = 0u;
      v14 = v6;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
      if (v15)
      {
        v16 = v15;
        v17 = *(_QWORD *)v32;
        do
        {
          for (j = 0; j != v16; ++j)
          {
            if (*(_QWORD *)v32 != v17)
              objc_enumerationMutation(v14);
            v19 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * j);
            if (-[PHASuggestionController _canFeatureSuggestion:](self, "_canFeatureSuggestion:", v19))
              objc_msgSend(v13, "addObject:", v19);
          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v31, v40, 16);
        }
        while (v16);
      }
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0D76258], "suggestionTypesWithProfile:", v4);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0D76258], "suggestionSubtypesWithProfile:", v4);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0u;
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v21 = v6;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v28;
        do
        {
          for (k = 0; k != v23; ++k)
          {
            if (*(_QWORD *)v28 != v24)
              objc_enumerationMutation(v21);
            v26 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * k);
            if (objc_msgSend(v14, "containsIndex:", objc_msgSend(v26, "type", (_QWORD)v27))
              && objc_msgSend(v20, "containsIndex:", objc_msgSend(v26, "subtype")))
            {
              objc_msgSend(v13, "addObject:", v26);
            }
          }
          v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v27, v39, 16);
        }
        while (v23);
      }

    }
  }
  else
  {
    v13 = v6;
  }

  return v13;
}

- (BOOL)shouldRetireSuggestion:(id)a3 atDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  BOOL v11;

  v5 = a3;
  v6 = a4;
  objc_msgSend(v5, "relevantUntilDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v8);
  v10 = v9;
  if (objc_msgSend(v5, "state") != 4)
  {
    if (objc_msgSend(v6, "compare:", v7) == 1)
    {
      v11 = 1;
      goto LABEL_7;
    }
    if (v8)
    {
      v11 = v10 > (double)(unint64_t)objc_msgSend((id)objc_opt_class(), "_retirementDelayInDaysForSuggestionType:andSubtype:", objc_msgSend(v5, "type"), objc_msgSend(v5, "subtype"))* 86400.0;
      goto LABEL_7;
    }
  }
  v11 = 0;
LABEL_7:

  return v11;
}

- (BOOL)shouldDeleteSuggestion:(id)a3 atDate:(id)a4
{
  id v5;
  id v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  double v13;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "activationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "timeIntervalSinceDate:", v7);
  v9 = v8;

  v10 = (void *)objc_opt_class();
  v11 = objc_msgSend(v6, "type");
  v12 = objc_msgSend(v6, "subtype");

  objc_msgSend(v10, "_maximumDurationBeforeDeletionForSuggestionType:andSubtype:", v11, v12);
  LOBYTE(v6) = v9 > v13;

  return (char)v6;
}

- (void)ingestSuggestions:(id)a3 atDate:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *v8;
  NSMutableArray *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  _BOOL4 v16;
  NSMutableArray *v17;
  NSObject *loggingConnection;
  NSObject *v19;
  uint64_t v20;
  NSMutableArray *existingSuggestions;
  NSMutableArray *v22;
  NSMutableArray *suggestionsToRetire;
  NSMutableArray *v24;
  NSMutableArray *suggestionsToDelete;
  NSMutableArray *v26;
  NSMutableArray *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint8_t buf[4];
  uint64_t v33;
  __int16 v34;
  NSMutableArray *v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v9 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v26 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v10 = v6;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v29;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v29 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * i);
        if (!-[PHASuggestionController _filterExistingSuggestion:](self, "_filterExistingSuggestion:", v15, v26))
        {
          switch(objc_msgSend(v15, "state"))
          {
            case 0u:
              -[NSMutableArray addObject:](v9, "addObject:", v15);
              v17 = v26;
              goto LABEL_14;
            case 1u:
            case 3u:
            case 4u:
              v16 = -[PHASuggestionController shouldRetireSuggestion:atDate:](self, "shouldRetireSuggestion:atDate:", v15, v7);
              v17 = v8;
              if (v16)
              {
                -[NSMutableArray addObject:](v27, "addObject:", v15);
                v17 = v8;
              }
              goto LABEL_14;
            case 2u:
              if (-[PHASuggestionController shouldDeleteSuggestion:atDate:](self, "shouldDeleteSuggestion:atDate:", v15, v7))
              {
                v17 = v9;
              }
              else
              {
                v17 = v8;
              }
LABEL_14:
              -[NSMutableArray addObject:](v17, "addObject:", v15);
              break;
            default:
              continue;
          }
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v12);
  }

  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v19 = loggingConnection;
    v20 = -[NSMutableArray count](v26, "count");
    *(_DWORD *)buf = 134218242;
    v33 = v20;
    v34 = 2112;
    v35 = v26;
    _os_log_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_DEFAULT, "Found %lu existing pending suggestions: %@", buf, 0x16u);

  }
  existingSuggestions = self->_existingSuggestions;
  self->_existingSuggestions = v8;
  v22 = v8;

  suggestionsToRetire = self->_suggestionsToRetire;
  self->_suggestionsToRetire = v27;
  v24 = v27;

  suggestionsToDelete = self->_suggestionsToDelete;
  self->_suggestionsToDelete = v9;

}

- (id)commitSuggestions:(id)a3 retiringSuggestions:(id)a4 deletingSuggestions:(id)a5 withOptions:(id)a6 error:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  NSObject *loggingConnection;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  int v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  void *v31;
  NSMutableSet *deletedSuggestionLocalIdentifiers;
  void *v33;
  PHPhotoLibrary *photoLibrary;
  id v35;
  id v36;
  id v37;
  PHANotificationController *v38;
  id v39;
  id v40;
  id v41;
  NSObject *v42;
  NSObject *v43;
  int v44;
  PHANotificationController *v45;
  void *v46;
  PHANotificationController *v47;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  void *v57;
  void *v58;
  id v60;
  _QWORD v61[4];
  id v62;
  PHASuggestionController *v63;
  id v64;
  id v65;
  id v66;
  id v67;
  PHANotificationController *v68;
  id v69;
  id v70;
  id v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  uint8_t v76[4];
  _BYTE v77[14];
  _BYTE v78[128];
  utsname buf;
  uint64_t v80;

  v80 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  loggingConnection = self->_loggingConnection;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v16 = loggingConnection;
    *(_DWORD *)buf.sysname = 67109120;
    *(_DWORD *)&buf.sysname[4] = objc_msgSend(v11, "count");
    _os_log_impl(&dword_1CAC16000, v16, OS_LOG_TYPE_DEFAULT, "Committing %d new suggestions", (uint8_t *)&buf, 8u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v17 = loggingConnection;
    v18 = objc_msgSend(v12, "count");
    *(_DWORD *)buf.sysname = 67109120;
    *(_DWORD *)&buf.sysname[4] = v18;
    _os_log_impl(&dword_1CAC16000, v17, OS_LOG_TYPE_DEFAULT, "Retiring %d suggestions", (uint8_t *)&buf, 8u);

    loggingConnection = self->_loggingConnection;
  }
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
  {
    v19 = loggingConnection;
    v20 = objc_msgSend(v13, "count");
    *(_DWORD *)buf.sysname = 67109120;
    *(_DWORD *)&buf.sysname[4] = v20;
    _os_log_impl(&dword_1CAC16000, v19, OS_LOG_TYPE_DEFAULT, "Deleting %d suggestions", (uint8_t *)&buf, 8u);

  }
  v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v11, "count"));
  v52 = (void *)objc_opt_new();
  memset(&buf, 0, 512);
  uname(&buf);
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", buf.machine, 4);
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "operatingSystemVersionString");
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "localToday");
  v22 = objc_claimAutoreleasedReturnValue();
  v58 = v12;
  v54 = (void *)v22;
  v55 = v11;
  if (v22)
    objc_msgSend(MEMORY[0x1E0D4B130], "universalDateFromLocalDate:", v22);
  else
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = v14;
  v74 = 0u;
  v75 = 0u;
  v72 = 0u;
  v73 = 0u;
  v23 = v13;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v73;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v73 != v26)
          objc_enumerationMutation(v23);
        v28 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
        v29 = self->_loggingConnection;
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          v30 = v29;
          objc_msgSend(v28, "localIdentifier", v49, v50);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)v76 = 138412290;
          *(_QWORD *)v77 = v31;
          _os_log_impl(&dword_1CAC16000, v30, OS_LOG_TYPE_DEFAULT, "Delete suggestion: %@", v76, 0xCu);

        }
        deletedSuggestionLocalIdentifiers = self->_deletedSuggestionLocalIdentifiers;
        objc_msgSend(v28, "localIdentifier", v49);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableSet addObject:](deletedSuggestionLocalIdentifiers, "addObject:", v33);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v72, v78, 16);
    }
    while (v25);
  }

  photoLibrary = self->_photoLibrary;
  v61[0] = MEMORY[0x1E0C809B0];
  v61[1] = 3221225472;
  v61[2] = __103__PHASuggestionController_commitSuggestions_retiringSuggestions_deletingSuggestions_withOptions_error___block_invoke;
  v61[3] = &unk_1E8520040;
  v60 = v55;
  v62 = v60;
  v63 = self;
  v35 = v49;
  v64 = v35;
  v56 = v51;
  v65 = v56;
  v36 = v50;
  v66 = v36;
  v37 = v52;
  v67 = v37;
  v38 = v53;
  v68 = v38;
  v39 = v57;
  v69 = v39;
  v40 = v58;
  v70 = v40;
  v41 = v23;
  v71 = v41;
  if (!-[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v61, a7))
  {
    v45 = v38;
    v38 = 0;
LABEL_25:

    goto LABEL_26;
  }
  if (objc_msgSend(v37, "count"))
  {
    v42 = self->_loggingConnection;
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      v43 = v42;
      v44 = objc_msgSend(v37, "count");
      *(_DWORD *)v76 = 67109378;
      *(_DWORD *)v77 = v44;
      *(_WORD *)&v77[4] = 2112;
      *(_QWORD *)&v77[6] = v37;
      _os_log_impl(&dword_1CAC16000, v43, OS_LOG_TYPE_DEFAULT, "Firing notification for %d suggestions: %@", v76, 0x12u);

    }
    v45 = -[PHANotificationController initWithGraphManager:]([PHANotificationController alloc], "initWithGraphManager:", self->_graphManager);
    -[PHANotificationController fireNotificationForSuggestionIdentifiers:](v45, "fireNotificationForSuggestionIdentifiers:", v37);
    goto LABEL_25;
  }
LABEL_26:
  v46 = v71;
  v47 = v38;

  return v47;
}

- (unint64_t)newFeaturedSuggestionsCount
{
  return self->_newFeaturedSuggestionsCount;
}

- (id)collidableMemoriesWithReferenceDate:(id)a3 andDelay:(double)a4
{
  id v6;
  void *v7;
  NSArray *existingMemories;
  void *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  _QWORD v15[4];
  id v16;
  id v17;
  double v18;

  v6 = a3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3788]), "initWithIndex:", 201);
  objc_msgSend(v7, "addIndex:", 302);
  objc_msgSend(v7, "addIndex:", 211);
  objc_msgSend(v7, "addIndex:", 215);
  objc_msgSend(v7, "addIndex:", 216);
  objc_msgSend(v7, "addIndex:", 217);
  objc_msgSend(v7, "addIndex:", 218);
  objc_msgSend(v7, "addIndex:", 220);
  objc_msgSend(v7, "addIndex:", 221);
  objc_msgSend(v7, "addIndex:", 301);
  objc_msgSend(v7, "addIndex:", 302);
  existingMemories = self->_existingMemories;
  v9 = (void *)MEMORY[0x1E0CB3880];
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __72__PHASuggestionController_collidableMemoriesWithReferenceDate_andDelay___block_invoke;
  v15[3] = &unk_1E8520068;
  v16 = v7;
  v17 = v6;
  v18 = a4;
  v10 = v6;
  v11 = v7;
  objc_msgSend(v9, "predicateWithBlock:", v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray filteredArrayUsingPredicate:](existingMemories, "filteredArrayUsingPredicate:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)generateSingleAssetSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return -[PHASuggestionController generateSuggestionsWithProfile:options:progress:](self, "generateSuggestionsWithProfile:options:progress:", 0, a3, a4);
}

- (id)generateOnThisDayAssetSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return -[PHASuggestionController generateSuggestionsWithProfile:options:progress:](self, "generateSuggestionsWithProfile:options:progress:", 4, a3, a4);
}

- (id)generateSharingSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return -[PHASuggestionController generateSuggestionsWithProfile:options:progress:](self, "generateSuggestionsWithProfile:options:progress:", 1, a3, a4);
}

- (id)generateWallpaperSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return -[PHASuggestionController generateSuggestionsWithProfile:options:progress:](self, "generateSuggestionsWithProfile:options:progress:", 2, a3, a4);
}

- (id)generateWidgetSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return -[PHASuggestionController generateSuggestionsWithProfile:options:progress:](self, "generateSuggestionsWithProfile:options:progress:", 3, a3, a4);
}

- (id)generateAmbientSuggestionsWithOptions:(id)a3 progress:(id)a4
{
  return -[PHASuggestionController generateSuggestionsWithProfile:options:progress:](self, "generateSuggestionsWithProfile:options:progress:", 6, a3, a4);
}

- (id)generateSuggestionsWithProfile:(unsigned __int8)a3 options:(id)a4 progress:(id)a5
{
  uint64_t i;
  OS_os_log *v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  NSMutableArray *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  NSMutableArray *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  unint64_t v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  uint64_t v39;
  void *v40;
  NSObject *loggingConnection;
  NSObject *v42;
  int v43;
  void *v44;
  uint64_t v45;
  id v46;
  id v47;
  OS_os_log *v48;
  int v49;
  OS_os_log *v50;
  int v51;
  OS_os_log *v52;
  int v53;
  NSObject *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t j;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  void *v66;
  uint64_t v67;
  uint32_t numer;
  uint32_t denom;
  NSObject *v70;
  NSObject *v71;
  NSObject *v72;
  id result;
  uint64_t v74;
  void *v75;
  void *v76;
  uint64_t v77;
  id v78;
  void *v79;
  void *v80;
  id obj;
  id obja;
  uint64_t v83;
  void *v84;
  NSObject *v85;
  os_signpost_id_t spid;
  id v87;
  unsigned int v88;
  id v89;
  void (**v90)(id, _BYTE *, double);
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  id v95;
  _QWORD v96[5];
  id v97;
  __int128 *p_buf;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  _QWORD v111[5];
  _QWORD v112[5];
  _QWORD v113[5];
  _QWORD v114[5];
  _QWORD v115[5];
  char v116;
  mach_timebase_info info;
  _QWORD v118[3];
  _QWORD v119[3];
  uint8_t v120[128];
  uint8_t v121[4];
  _BYTE v122[18];
  __int128 buf;
  uint64_t v124;
  uint64_t (*v125)(uint64_t, uint64_t);
  void (*v126)(uint64_t);
  id v127;
  _BYTE v128[128];
  _BYTE v129[128];
  _BYTE v130[128];
  uint64_t v131;

  v88 = a3;
  v131 = *MEMORY[0x1E0C80C00];
  v87 = a4;
  v90 = (void (**)(id, _BYTE *, double))a5;
  v8 = self->_loggingConnection;
  spid = os_signpost_id_generate((os_log_t)v8);
  info = 0;
  mach_timebase_info(&info);
  v9 = v8;
  v10 = v9;
  if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v10, OS_SIGNPOST_INTERVAL_BEGIN, spid, "SuggestionGeneration", ", (uint8_t *)&buf, 2u);
  }
  v85 = v10;

  v83 = mach_absolute_time();
  v116 = 0;
  v90[2](v90, &v116, 0.0);
  if (v116)
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_124:

    return v11;
  }
  -[PHASuggestionController _createSuggestionSessionWithProfile:](self, "_createSuggestionSessionWithProfile:", v88);
  v84 = (void *)objc_claimAutoreleasedReturnValue();
  -[PHASuggestionController _existingSuggestionsForProfile:](self, "_existingSuggestionsForProfile:", v88);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setExistingSuggestions:", v12);

  -[PHASuggestionController deniedSuggestionsForProfile:](self, "deniedSuggestionsForProfile:", v88);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v84, "setDeniedSuggestions:", v13);

  v90[2](v90, &v116, 0.1);
  if (v116)
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
LABEL_123:

    goto LABEL_124;
  }
  switch(v88)
  {
    case 0u:
    case 5u:
      if (objc_msgSend(v87, "maximumNumberOfSuggestions") == 1)
      {
        v115[0] = MEMORY[0x1E0C809B0];
        v115[1] = 3221225472;
        v115[2] = __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke;
        v115[3] = &unk_1E8520090;
        v14 = v115;
        v115[4] = v90;
        objc_msgSend(v84, "coordinatedSuggestionsWithOptions:progress:", v87, v115);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v114[0] = MEMORY[0x1E0C809B0];
        v114[1] = 3221225472;
        v114[2] = __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_2;
        v114[3] = &unk_1E8520090;
        v14 = v114;
        v114[4] = v90;
        objc_msgSend(v84, "uncoordinatedSuggestionsWithOptions:progress:", v87, v114);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
      }
      goto LABEL_17;
    case 1u:
      goto LABEL_15;
    case 2u:
    case 6u:
      -[PHASuggestionController _forbiddenAssetUUIDs](self, "_forbiddenAssetUUIDs");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setForbiddenAssetUUIDs:", v15);

      v113[0] = MEMORY[0x1E0C809B0];
      v113[1] = 3221225472;
      v113[2] = __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_3;
      v113[3] = &unk_1E8520090;
      v14 = v113;
      v113[4] = v90;
      objc_msgSend(v84, "suggestionsWithOptions:progress:", v87, v113);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 3u:
      v111[0] = MEMORY[0x1E0C809B0];
      v111[1] = 3221225472;
      v111[2] = __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_5;
      v111[3] = &unk_1E8520090;
      v14 = v111;
      v111[4] = v90;
      objc_msgSend(v84, "uncoordinatedSuggestionsWithOptions:progress:", v87, v111);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_17;
    case 4u:
      -[PHASuggestionController pendingOnThisDayMemories](self, "pendingOnThisDayMemories");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v84, "setCollidableMemories:", v16);

LABEL_15:
      v112[0] = MEMORY[0x1E0C809B0];
      v112[1] = 3221225472;
      v112[2] = __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_4;
      v112[3] = &unk_1E8520090;
      v14 = v112;
      v112[4] = v90;
      objc_msgSend(v84, "suggestionsWithOptions:progress:", v87, v112);
      v79 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_17:

      break;
    default:
      v79 = 0;
      break;
  }
  v90[2](v90, &v116, 0.6);
  if (v116)
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
    v17 = v79;
LABEL_122:

    goto LABEL_123;
  }
  v18 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (objc_msgSend(v87, "shouldProcessExistingSuggestions"))
  {
    objc_msgSend(MEMORY[0x1E0D76258], "suggestionTypesWithProfile:", v88);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D76258], "suggestionSubtypesWithProfile:", v88);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v109 = 0u;
    v110 = 0u;
    v107 = 0u;
    v108 = 0u;
    v22 = self->_suggestionsToRetire;
    v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v107, v130, 16);
    if (v23)
    {
      v24 = *(_QWORD *)v108;
      do
      {
        for (i = 0; i != v23; ++i)
        {
          if (*(_QWORD *)v108 != v24)
            objc_enumerationMutation(v22);
          v25 = *(void **)(*((_QWORD *)&v107 + 1) + 8 * i);
          if (objc_msgSend(v20, "containsIndex:", objc_msgSend(v25, "type"))
            && objc_msgSend(v21, "containsIndex:", objc_msgSend(v25, "subtype")))
          {
            objc_msgSend(v18, "addObject:", v25);
          }
        }
        v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v22, "countByEnumeratingWithState:objects:count:", &v107, v130, 16);
      }
      while (v23);
    }

    v105 = 0u;
    v106 = 0u;
    v103 = 0u;
    v104 = 0u;
    v26 = self->_suggestionsToDelete;
    v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v103, v129, 16);
    if (v27)
    {
      v28 = *(_QWORD *)v104;
      do
      {
        for (i = 0; i != v27; ++i)
        {
          if (*(_QWORD *)v104 != v28)
            objc_enumerationMutation(v26);
          v29 = *(void **)(*((_QWORD *)&v103 + 1) + 8 * i);
          if (objc_msgSend(v20, "containsIndex:", objc_msgSend(v29, "type"))
            && objc_msgSend(v21, "containsIndex:", objc_msgSend(v29, "subtype")))
          {
            objc_msgSend(v19, "addObject:", v29);
          }
        }
        v27 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v26, "countByEnumeratingWithState:objects:count:", &v103, v129, 16);
      }
      while (v27);
    }

    if (v88 == 3 && (v30 = objc_msgSend(v87, "maximumNumberOfSuggestions"), v30 > objc_msgSend(v79, "count")))
    {
      obj = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      objc_msgSend(v84, "existingSuggestions");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v99, v128, 16);
      if (v32)
      {
        v33 = *(_QWORD *)v100;
        do
        {
          for (i = 0; i != v32; ++i)
          {
            if (*(_QWORD *)v100 != v33)
              objc_enumerationMutation(v31);
            v34 = *(void **)(*((_QWORD *)&v99 + 1) + 8 * i);
            if (objc_msgSend(v34, "state") != 4
              && objc_msgSend(v20, "containsIndex:", objc_msgSend(v34, "type"))
              && objc_msgSend(v21, "containsIndex:", objc_msgSend(v34, "subtype")))
            {
              objc_msgSend(obj, "addObject:", v34);
            }
          }
          v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v99, v128, 16);
        }
        while (v32);
      }

      if (objc_msgSend(obj, "count"))
      {
        objc_msgSend(obj, "pha_shuffle");
        v35 = (void *)objc_msgSend(v79, "mutableCopy");
        v36 = objc_msgSend(v87, "maximumNumberOfSuggestions");
        v37 = objc_msgSend(v79, "count");
        v38 = objc_msgSend(obj, "count");
        if (v38 >= v36 - v37)
          v39 = v36 - v37;
        else
          v39 = v38;
        if (v39 - 1 >= 0)
        {
          do
          {
            objc_msgSend(obj, "objectAtIndexedSubscript:", --v39);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            loggingConnection = self->_loggingConnection;
            if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_DEFAULT))
            {
              v42 = loggingConnection;
              objc_msgSend(v40, "localIdentifier");
              i = objc_claimAutoreleasedReturnValue();
              LODWORD(buf) = 138412290;
              *(_QWORD *)((char *)&buf + 4) = i;
              _os_log_impl(&dword_1CAC16000, v42, OS_LOG_TYPE_DEFAULT, "Reusing widget suggestion: %@", (uint8_t *)&buf, 0xCu);

            }
            objc_msgSend(v35, "addObject:", v40);
            objc_msgSend(v19, "addObject:", v40);

          }
          while (v39 > 0);
        }
        v78 = v35;

      }
      else
      {
        v78 = v79;
      }

    }
    else
    {
      v78 = v79;
    }

  }
  else
  {
    v78 = v79;
  }
  v90[2](v90, &v116, 0.7);
  v11 = (void *)MEMORY[0x1E0C9AA60];
  if (v116)
  {
LABEL_121:

    v17 = v78;
    goto LABEL_122;
  }
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v124 = 0x3032000000;
  v125 = __Block_byref_object_copy__2664;
  v126 = __Block_byref_object_dispose__2665;
  v43 = objc_msgSend(v87, "discardGeneratedSuggestions");
  v44 = v78;
  if (v43)
    v44 = v11;
  v127 = v44;
  if (!objc_msgSend((id)objc_opt_class(), "_shouldCheckSuggestionRecylingForProfile:", v88)
    || !objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count"))
  {
LABEL_73:
    if (objc_msgSend(*(id *)(*((_QWORD *)&buf + 1) + 40), "count")
      || objc_msgSend(v18, "count")
      || objc_msgSend(v19, "count"))
    {
      v45 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      v95 = 0;
      -[PHASuggestionController commitSuggestions:retiringSuggestions:deletingSuggestions:withOptions:error:](self, "commitSuggestions:retiringSuggestions:deletingSuggestions:withOptions:error:", v45, v18, v19, v87, &v95);
      v46 = (id)objc_claimAutoreleasedReturnValue();
      v47 = v95;
      v90[2](v90, &v116, 0.8);
      if (v116)
      {

LABEL_120:
        _Block_object_dispose(&buf, 8);

        goto LABEL_121;
      }
      if (v46)
      {
        if (objc_msgSend(v46, "count"))
        {
          v48 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v48, OS_LOG_TYPE_DEFAULT))
          {
            v49 = objc_msgSend(v46, "count");
            *(_DWORD *)v121 = 67109378;
            *(_DWORD *)v122 = v49;
            *(_WORD *)&v122[4] = 2112;
            *(_QWORD *)&v122[6] = v46;
            _os_log_impl(&dword_1CAC16000, (os_log_t)v48, OS_LOG_TYPE_DEFAULT, "Successfully committed %d suggestions: %@", v121, 0x12u);
          }

          -[NSMutableArray addObjectsFromArray:](self->_existingSuggestions, "addObjectsFromArray:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40));
          -[PHASuggestionController recordCreatedSuggestions:duringSession:](self, "recordCreatedSuggestions:duringSession:", *(_QWORD *)(*((_QWORD *)&buf + 1) + 40), v84);
        }
        if (objc_msgSend(v18, "count"))
        {
          v50 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v50, OS_LOG_TYPE_DEFAULT))
          {
            v51 = objc_msgSend(v18, "count");
            *(_DWORD *)v121 = 67109120;
            *(_DWORD *)v122 = v51;
            _os_log_impl(&dword_1CAC16000, (os_log_t)v50, OS_LOG_TYPE_DEFAULT, "Successfully retired %d suggestions", v121, 8u);
          }

          -[NSMutableArray removeObjectsInArray:](self->_suggestionsToRetire, "removeObjectsInArray:", v18);
          -[PHASuggestionController recordRetiredSuggestions:](self, "recordRetiredSuggestions:", v18);
        }
        if (objc_msgSend(v19, "count"))
        {
          v52 = self->_loggingConnection;
          if (os_log_type_enabled((os_log_t)v52, OS_LOG_TYPE_DEFAULT))
          {
            v53 = objc_msgSend(v19, "count");
            *(_DWORD *)v121 = 67109120;
            *(_DWORD *)v122 = v53;
            _os_log_impl(&dword_1CAC16000, (os_log_t)v52, OS_LOG_TYPE_DEFAULT, "Successfully deleted %d suggestions", v121, 8u);
          }

          -[NSMutableArray removeObjectsInArray:](self->_suggestionsToDelete, "removeObjectsInArray:", v19);
          -[PHASuggestionController recordDeletedSuggestions:](self, "recordDeletedSuggestions:", v19);
        }
      }
      else
      {
        v54 = self->_loggingConnection;
        if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)v121 = 136315394;
          *(_QWORD *)v122 = "-[PHASuggestionController generateSuggestionsWithProfile:options:progress:]";
          *(_WORD *)&v122[8] = 2112;
          *(_QWORD *)&v122[10] = v47;
          _os_log_error_impl(&dword_1CAC16000, v54, OS_LOG_TYPE_ERROR, "%s: Failed to commit changes due to error: %@", v121, 0x16u);
        }
        v46 = (id)MEMORY[0x1E0C9AA60];
      }

    }
    else
    {
      v46 = (id)MEMORY[0x1E0C9AA60];
    }
    v90[2](v90, &v116, 0.9);
    if (!v116)
    {
      if (objc_msgSend(v87, "discardGeneratedSuggestions") && objc_msgSend(v78, "count"))
      {
        v89 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        obja = v78;
        v55 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v91, v120, 16);
        v80 = v46;
        if (v55)
        {
          v56 = *(_QWORD *)v92;
          do
          {
            for (j = 0; j != v55; ++j)
            {
              if (*(_QWORD *)v92 != v56)
                objc_enumerationMutation(obja);
              v58 = *(void **)(*((_QWORD *)&v91 + 1) + 8 * j);
              objc_msgSend(v58, "keyAssets");
              v59 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v59, "firstObject");
              v60 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v60, "localIdentifier");
              v61 = (void *)objc_claimAutoreleasedReturnValue();

              if (v61)
              {
                v119[0] = v61;
                v118[0] = CFSTR("assetLocalIdentifier");
                v118[1] = CFSTR("score");
                v62 = (void *)MEMORY[0x1E0CB37E8];
                objc_msgSend(v58, "score");
                objc_msgSend(v62, "numberWithDouble:");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                v119[1] = v63;
                v118[2] = CFSTR("reasons");
                objc_msgSend(v58, "reasons");
                v64 = (void *)objc_claimAutoreleasedReturnValue();
                v65 = (uint64_t)v64;
                if (!v64)
                {
                  objc_msgSend(MEMORY[0x1E0C99E60], "set");
                  i = objc_claimAutoreleasedReturnValue();
                  v65 = i;
                }
                v119[2] = v65;
                objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v119, v118, 3);
                v66 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v64)

                objc_msgSend(v89, "addObject:", v66);
              }

            }
            v55 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v91, v120, 16);
          }
          while (v55);
        }

        v46 = v89;
      }
      v67 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v70 = v85;
      v71 = v70;
      if (spid - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v70))
      {
        *(_WORD *)v121 = 0;
        _os_signpost_emit_with_name_impl(&dword_1CAC16000, v71, OS_SIGNPOST_INTERVAL_END, spid, "SuggestionGeneration", ", v121, 2u);
      }

      v72 = v71;
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v121 = 136315394;
        *(_QWORD *)v122 = "SuggestionGeneration";
        *(_WORD *)&v122[8] = 2048;
        *(double *)&v122[10] = (float)((float)((float)((float)(v67 - v83) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CAC16000, v72, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v121, 0x16u);
      }

      v90[2](v90, &v116, 1.0);
      if (v116)
      {
        v11 = (void *)MEMORY[0x1E0C9AA60];
      }
      else
      {
        v46 = v46;
        v11 = v46;
      }
    }
    goto LABEL_120;
  }
  if (v88 == 2)
  {
    v74 = 6;
    goto LABEL_130;
  }
  if (v88 == 6)
  {
    v74 = 8;
LABEL_130:
    objc_msgSend(v87, "suggestionSubtypeWhitelist");
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    -[PHASuggestionController existingSuggestionByKeyAssetUUIDWithType:subtypes:](self, "existingSuggestionByKeyAssetUUIDWithType:subtypes:", v74, v75);
    v76 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v76, "count"))
    {
      v77 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
      v96[0] = MEMORY[0x1E0C809B0];
      v96[1] = 3221225472;
      v96[2] = __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_198;
      v96[3] = &unk_1E85200B8;
      v96[4] = self;
      p_buf = &buf;
      v97 = v19;
      -[PHASuggestionController processSuggestions:forRecyclingWithExistingSuggestionByKeyAssetUUID:resultBlock:](self, "processSuggestions:forRecyclingWithExistingSuggestionByKeyAssetUUID:resultBlock:", v77, v76, v96);

    }
    goto LABEL_73;
  }
  result = (id)_PFAssertFailHandler();
  __break(1u);
  return result;
}

- (id)_forbiddenAssetUUIDs
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v19[0] = *MEMORY[0x1E0CD19C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setFetchPropertySets:", v3);

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K CONTAINS %d"), CFSTR("suggestionsBeingKeyAssets"), CFSTR("state"), 4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setInternalPredicate:", v4);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v11), "uuid");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "addObject:", v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  return v6;
}

- (id)collidableSuggestionsWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;

  v4 = (void *)MEMORY[0x1E0D4B130];
  objc_msgSend(a3, "localToday");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "universalDateFromLocalDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[PHASuggestionController _existingSuggestionsForProfile:](self, "_existingSuggestionsForProfile:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3880];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __60__PHASuggestionController_collidableSuggestionsWithOptions___block_invoke;
  v13[3] = &unk_1E85200E0;
  v14 = v6;
  v9 = v6;
  objc_msgSend(v8, "predicateWithBlock:", v13);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "filteredArrayUsingPredicate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_suggestionsToReuseWithSuggestionSession:(id)a3 numberOfSuggestionsToReuse:(unint64_t)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v5 = a3;
  objc_msgSend(v5, "existingSuggestionsWithState:count:", 0, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count") == a4)
  {
    v7 = v6;
  }
  else
  {
    objc_msgSend(v5, "existingSuggestionsWithState:count:", 1, a4 - objc_msgSend(v6, "count"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      objc_msgSend(v6, "arrayByAddingObjectsFromArray:", v8);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = v6;
    }
    v7 = v9;

  }
  return v7;
}

- (id)_createSuggestionSessionWithProfile:(unsigned __int8)a3
{
  uint64_t v3;
  void *v4;
  void *v5;

  v3 = a3;
  -[PGManager workingContextForSuggestions](self->_graphManager, "workingContextForSuggestions");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76258]), "initWithProfile:workingContext:", v3, v4);

  return v5;
}

- (id)pendingOnThisDayMemories
{
  id v3;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  uint64_t v10;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = self->_existingMemories;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v9, "pendingState", (_QWORD)v13) == 1)
        {
          v10 = objc_msgSend(v9, "category");
          if ((unint64_t)(v10 - 202) <= 0xB && ((1 << (v10 + 54)) & 0xC01) != 0)
            objc_msgSend(v3, "addObject:", v9);
        }
      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)existingSuggestionByKeyAssetUUIDWithType:(unsigned __int16)a3 subtypes:(id)a4
{
  unsigned int v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *loggingConnection;
  NSObject *v34;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  id obj;
  PHASuggestionController *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id v48;
  uint8_t buf[4];
  void *v50;
  __int16 v51;
  void *v52;
  __int16 v53;
  void *v54;
  _BYTE v55[128];
  uint64_t v56;
  _QWORD v57[2];
  _QWORD v58[4];

  v4 = a3;
  v58[2] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v42 = self;
  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v58[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("type == %d"), v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v58[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v58, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v13 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v47[0] = MEMORY[0x1E0C809B0];
    v47[1] = 3221225472;
    v47[2] = __77__PHASuggestionController_existingSuggestionByKeyAssetUUIDWithType_subtypes___block_invoke;
    v47[3] = &unk_1E8520108;
    v48 = v13;
    v14 = v13;
    objc_msgSend(v6, "enumerateIndexesUsingBlock:", v47);
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("subtype IN %@"), v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x1E0CB3528];
    v57[0] = v12;
    v57[1] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v57, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "andPredicateWithSubpredicates:", v17);
    v18 = objc_claimAutoreleasedReturnValue();

    v12 = (void *)v18;
  }
  objc_msgSend(v7, "setPredicate:", v12);
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v7);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count"))
  {
    v38 = v12;
    v39 = v7;
    v40 = v6;
    -[PHPhotoLibrary librarySpecificFetchOptions](v42->_photoLibrary, "librarySpecificFetchOptions");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v56 = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v56, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setFetchPropertySets:", v21);

    v36 = v20;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchKeyAssetBySuggestionUUIDForSuggestions:options:", v19, v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v43 = 0u;
    v44 = 0u;
    v45 = 0u;
    v46 = 0u;
    v37 = v19;
    obj = v19;
    v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
    if (v24)
    {
      v25 = v24;
      v26 = *(_QWORD *)v44;
      do
      {
        for (i = 0; i != v25; ++i)
        {
          if (*(_QWORD *)v44 != v26)
            objc_enumerationMutation(obj);
          v28 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * i);
          objc_msgSend(v28, "uuid");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "objectForKeyedSubscript:", v29);
          v30 = (void *)objc_claimAutoreleasedReturnValue();

          if (v30)
          {
            objc_msgSend(v30, "uuid");
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v23, "objectForKeyedSubscript:", v31);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            if (v32)
            {
              loggingConnection = v42->_loggingConnection;
              if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412802;
                v50 = v32;
                v51 = 2112;
                v52 = v28;
                v53 = 2112;
                v54 = v30;
                _os_log_error_impl(&dword_1CAC16000, loggingConnection, OS_LOG_TYPE_ERROR, "Two suggestions (%@, %@) using the same asset (%@)", buf, 0x20u);
              }
            }
            else
            {
              objc_msgSend(v23, "setObject:forKeyedSubscript:", v28, v31);
            }

          }
          else
          {
            v34 = v42->_loggingConnection;
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v50 = v28;
              _os_log_error_impl(&dword_1CAC16000, v34, OS_LOG_TYPE_ERROR, "Could not find key asset for suggestion %@", buf, 0xCu);
            }
          }

        }
        v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v55, 16);
      }
      while (v25);
    }

    v7 = v39;
    v6 = v40;
    v19 = v37;
    v12 = v38;
  }
  else
  {
    v23 = (id)MEMORY[0x1E0C9AA70];
  }

  return v23;
}

- (BOOL)existingSuggestion:(id)a3 matchesSuggestion:(id)a4
{
  id v5;
  id v6;
  int v7;
  int v8;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;
  char v13;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  int v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  void *v27;
  void *v28;
  id v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  unsigned __int8 v36;
  uint64_t v37;
  void *v38;

  v5 = a3;
  v6 = a4;
  v7 = objc_msgSend(v5, "type");
  if (v7 == objc_msgSend(v6, "type")
    && (v8 = objc_msgSend(v5, "subtype"), v8 == objc_msgSend(v6, "subtype"))
    && (v9 = objc_msgSend(v5, "version"), v9 == objc_msgSend(v6, "version")))
  {
    objc_msgSend(v5, "features");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      v12 = v10;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v12 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v12;

    objc_msgSend(v6, "features");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E60], "set");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v19 = v18;

    v20 = objc_msgSend(v15, "isEqualToSet:", v19);
    objc_msgSend(v5, "suggestedPersonLocalIdentifiers");
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)v21;
    v23 = (void *)MEMORY[0x1E0C9AA60];
    if (v21)
      v24 = (void *)v21;
    else
      v24 = (void *)MEMORY[0x1E0C9AA60];
    v25 = v24;

    objc_msgSend(v6, "suggestedPersonLocalIdentifiers");
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)v26;
    if (v26)
      v28 = (void *)v26;
    else
      v28 = v23;
    v29 = v28;

    if (v20)
    {
      if (objc_msgSend(v25, "isEqualToArray:", v29))
      {
        objc_msgSend(v5, "recipe");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "recipe");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30 == v31)
        {
          v20 = 1;
        }
        else
        {
          objc_msgSend(v5, "recipe");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "recipe");
          v38 = v30;
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v20 = objc_msgSend(v32, "isEqual:", v33);

          v30 = v38;
        }

      }
      else
      {
        v20 = 0;
      }
    }
    objc_msgSend(MEMORY[0x1E0CD17D0], "allTopWallpaperSuggestionSubtypes");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v6, "subtype"));
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v34, "containsObject:", v35);

    v13 = (v36 ^ 1) & v20;
    if (((v36 ^ 1) & 1) == 0 && v20)
    {
      v37 = objc_msgSend(v5, "availableFeatures");
      v13 = v37 == objc_msgSend(v6, "availableFeatures");
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)processSuggestions:(id)a3 forRecyclingWithExistingSuggestionByKeyAssetUUID:(id)a4 resultBlock:(id)a5
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(id, id, void *);
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v23 = (void (**)(id, id, void *))a5;
  v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v10 = objc_alloc(MEMORY[0x1E0C99E20]);
  objc_msgSend(v8, "allValues");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v10, "initWithArray:", v11);

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v12 = v7;
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v12);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v17, "keyAssets");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "firstObject");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "uuid");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectForKeyedSubscript:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21
          && -[PHASuggestionController existingSuggestion:matchesSuggestion:](self, "existingSuggestion:matchesSuggestion:", v21, v17))
        {
          objc_msgSend(v24, "removeObject:", v21);
        }
        else
        {
          objc_msgSend(v9, "addObject:", v17);
        }

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v14);
  }

  objc_msgSend(v24, "allObjects");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2](v23, v9, v22);

}

- (void)cacheWidgetSuggestionsWithCurrentlyFeaturedState
{
  void *v3;
  uint64_t v4;
  void *v5;
  NSArray *v6;
  NSArray *cachedFeaturedSuggestions;
  id v8;

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchWidgetSuggestionsWithFeaturedState:withOptions:", 1, v8);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", 0, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "objectsAtIndexes:", v5);
    v6 = (NSArray *)objc_claimAutoreleasedReturnValue();
    cachedFeaturedSuggestions = self->_cachedFeaturedSuggestions;
    self->_cachedFeaturedSuggestions = v6;

  }
}

- (BOOL)_filterExistingSuggestion:(id)a3
{
  unsigned int v3;

  v3 = objc_msgSend(a3, "type");
  return (v3 < 0xB) & (0x740u >> v3);
}

- (BOOL)_canFeatureSuggestion:(id)a3
{
  return objc_msgSend(a3, "type") - 3 < 3;
}

- (id)suggestionInfosWithOptions:(id)a3
{
  id v4;
  void *v5;
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

  v4 = a3;
  -[PGManager workingContextForSuggestions](self->_graphManager, "workingContextForSuggestions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D76258]), "initWithProfile:workingContext:", 0, v5);
  v7 = objc_alloc_init(MEMORY[0x1E0D76250]);
  v8 = (void *)MEMORY[0x1E0CB36B8];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("type"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "indexSetWithIndex:", objc_msgSend(v9, "unsignedIntegerValue"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSuggestionTypeWhitelist:", v10);

  v11 = (void *)MEMORY[0x1E0CB36B8];
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("subtype"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "indexSetWithIndex:", objc_msgSend(v12, "unsignedIntegerValue"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSuggestionSubtypeWhitelist:", v13);

  objc_msgSend(v7, "setGenerateInvalidSuggestions:", 1);
  objc_msgSend(v7, "setComputeReasons:", 1);
  objc_msgSend(v7, "setIgnoreCollisionsWithExistingSuggestions:", 1);
  objc_msgSend(v7, "setIgnoreCollisionsWithSameBatchSuggestions:", 1);
  objc_msgSend(v7, "setShouldProcessExistingSuggestions:", 0);
  objc_msgSend(v7, "setDiscardGeneratedSuggestions:", 1);
  objc_msgSend(v7, "setAllowNotification:", 0);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("localDate"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v7, "setLocalToday:", v14);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("universalStartDate"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v7, "setUniversalStartDate:", v15);
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("universalEndDate"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v16)
    objc_msgSend(v7, "setUniversalEndDate:", v16);
  objc_msgSend(v7, "setDefaultStartAndEndDatesIfNeeded");
  -[PHASuggestionController ingestExistingSuggestionsWithOptions:](self, "ingestExistingSuggestionsWithOptions:", v7);
  objc_msgSend(v6, "setExistingSuggestions:", self->_existingSuggestions);
  objc_msgSend(v6, "suggestionsWithOptions:progress:", v7, &__block_literal_global_2630);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "infosWithSuggestions:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

- (NSArray)existingMemories
{
  return self->_existingMemories;
}

- (void)setExistingMemories:(id)a3
{
  objc_storeStrong((id *)&self->_existingMemories, a3);
}

- (PGManager)graphManager
{
  return self->_graphManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphManager, 0);
  objc_storeStrong((id *)&self->_existingMemories, 0);
  objc_storeStrong((id *)&self->_deletedSuggestionLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_cachedFeaturedSuggestions, 0);
  objc_storeStrong((id *)&self->_suggestionsToDelete, 0);
  objc_storeStrong((id *)&self->_suggestionsToRetire, 0);
  objc_storeStrong((id *)&self->_existingSuggestions, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
}

void __77__PHASuggestionController_existingSuggestionByKeyAssetUUIDWithType_subtypes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

BOOL __60__PHASuggestionController_collidableSuggestionsWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  double v4;
  double v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "creationDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceDate:", v3);
  v5 = v4;

  return v5 <= 604800.0 && v5 >= 0.0;
}

uint64_t __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a2 * 0.5 + 0.1);
}

uint64_t __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_2(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a2 * 0.5 + 0.1);
}

uint64_t __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_3(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a2 * 0.5 + 0.1);
}

uint64_t __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_4(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a2 * 0.5 + 0.1);
}

uint64_t __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_5(uint64_t a1, double a2)
{
  return (*(uint64_t (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a2 * 0.5 + 0.1);
}

void __75__PHASuggestionController_generateSuggestionsWithProfile_options_progress___block_invoke_198(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  int v10;
  uint64_t v11;
  void *v12;
  id v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    v8 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    v9 = v7;
    LODWORD(v8) = objc_msgSend(v8, "count");
    v10 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "count");
    v14[0] = 67109888;
    v14[1] = (_DWORD)v8;
    v15 = 1024;
    v16 = v10 - objc_msgSend(v5, "count");
    v17 = 1024;
    v18 = objc_msgSend(v5, "count");
    v19 = 1024;
    v20 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_1CAC16000, v9, OS_LOG_TYPE_DEFAULT, "Generated %d wallpaper suggestions, %d already existing, about to commit %d new PHSuggestions, delete %d old PHSuggestions", (uint8_t *)v14, 0x1Au);

  }
  v11 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v12 = *(void **)(v11 + 40);
  *(_QWORD *)(v11 + 40) = v5;
  v13 = v5;

  objc_msgSend(*(id *)(a1 + 40), "addObjectsFromArray:", v6);
}

BOOL __72__PHASuggestionController_collidableMemoriesWithReferenceDate_andDelay___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  _BOOL8 v8;

  v3 = a2;
  v8 = (objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(v3, "category")) & 1) == 0
    && (v4 = *(void **)(a1 + 40),
        objc_msgSend(v3, "creationDate"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "timeIntervalSinceDate:", v5),
        v7 = v6,
        v5,
        v7 >= 0.0)
    && v7 <= *(double *)(a1 + 48);

  return v8;
}

uint64_t __103__PHASuggestionController_commitSuggestions_retiringSuggestions_deletingSuggestions_withOptions_error___block_invoke(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  double v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  const char *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  NSObject *v18;
  char *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  void *v41;
  NSObject *v42;
  uint64_t v43;
  NSObject *v44;
  void *v45;
  NSObject *v46;
  uint64_t v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t j;
  void *v53;
  void *v54;
  void *v55;
  int v56;
  NSObject *v57;
  NSObject *v58;
  char *v59;
  NSObject *v60;
  char *v61;
  uint64_t v62;
  void *v63;
  id v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  uint64_t result;
  id obj;
  uint64_t v72;
  uint64_t v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  uint64_t v80;
  void *v81;
  void *v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  _BYTE v99[128];
  uint8_t v100[128];
  uint8_t buf[4];
  const char *v102;
  __int16 v103;
  void *v104;
  _BYTE v105[128];
  _BYTE v106[128];
  uint64_t v107;

  v1 = a1;
  v107 = *MEMORY[0x1E0C80C00];
  v95 = 0u;
  v96 = 0u;
  v97 = 0u;
  v98 = 0u;
  obj = *(id *)(a1 + 32);
  v2 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
  v80 = v1;
  if (v2)
  {
    v3 = v2;
    v73 = *(_QWORD *)v96;
    v4 = 0.0;
    do
    {
      v5 = 0;
      v72 = v3;
      do
      {
        if (*(_QWORD *)v96 != v73)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v95 + 1) + 8 * v5);
        v7 = (void *)MEMORY[0x1D1798448]();
        objc_msgSend(v6, "keyAssets");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "representativeAssets");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v8, "count"))
        {
          v12 = *(NSObject **)(*(_QWORD *)(v1 + 40) + 8);
          if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
            goto LABEL_57;
          *(_DWORD *)buf = 138412290;
          v102 = (const char *)v6;
          v13 = v12;
          v14 = "Trying to persist a suggestion without key assets: %@";
LABEL_44:
          _os_log_error_impl(&dword_1CAC16000, v13, OS_LOG_TYPE_ERROR, v14, buf, 0xCu);
          goto LABEL_57;
        }
        if (objc_msgSend(v6, "type") == 1 && !objc_msgSend(v9, "count"))
        {
          v36 = *(NSObject **)(*(_QWORD *)(v1 + 40) + 8);
          if (!os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            goto LABEL_57;
          *(_DWORD *)buf = 138412290;
          v102 = (const char *)v6;
          v13 = v36;
          v14 = "Trying to persist a cmm suggestion without representative assets: %@";
          goto LABEL_44;
        }
        v10 = objc_msgSend(v6, "relevanceDurationInDays");
        v79 = v7;
        if (v10)
        {
          objc_msgSend(MEMORY[0x1E0D4B130], "dateByAddingDays:toDate:", v10, *(_QWORD *)(v1 + 48));
          v11 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
        objc_msgSend(*(id *)(v1 + 48), "dateByAddingTimeInterval:", v4);
        v77 = v9;
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD17D8], "creationRequestForSuggestionWithType:subtype:keyAssets:representativeAssets:creationDate:relevantUntilDate:version:", objc_msgSend(v6, "type"), objc_msgSend(v6, "subtype"), v8, v9, v75, v11, objc_msgSend(v6, "version"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "recipe");
        v16 = objc_claimAutoreleasedReturnValue();
        if (v16)
          objc_msgSend(v15, "setActionProperties:", v16);
        v74 = (void *)v16;
        v1 = v80;
        if (objc_msgSend(*(id *)(v80 + 40), "_canFeatureSuggestion:", v6))
        {
          v17 = *(NSObject **)(*(_QWORD *)(v80 + 40) + 8);
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            v18 = v17;
            objc_msgSend(v15, "uuid");
            v19 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v102 = v19;
            _os_log_impl(&dword_1CAC16000, v18, OS_LOG_TYPE_INFO, "Set currentlyFeatured state on suggestion: %@", buf, 0xCu);

          }
          objc_msgSend(v15, "setFeaturedState:", 1);
          ++*(_QWORD *)(*(_QWORD *)(v80 + 40) + 56);
        }
        v78 = v8;
        v20 = (void *)objc_opt_new();
        objc_msgSend(v6, "features");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = (void *)v11;
        v82 = v20;
        if (objc_msgSend(v81, "count"))
        {
          v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v81, "count"));
          v91 = 0u;
          v92 = 0u;
          v93 = 0u;
          v94 = 0u;
          v22 = v81;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v92;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v92 != v25)
                  objc_enumerationMutation(v22);
                objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", *(_QWORD *)(*((_QWORD *)&v91 + 1) + 8 * i), 1, 0);
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                if (v27)
                  objc_msgSend(v21, "addObject:", v27);

              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v91, v105, 16);
            }
            while (v24);
          }

          v20 = v82;
          objc_msgSend(v82, "setObject:forKeyedSubscript:", v21, CFSTR("features"));

          v1 = v80;
        }
        if (objc_msgSend(v6, "type") == 1)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", objc_msgSend(v6, "containsUnverifiedPersons"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v28, CFSTR("containsUnverifiedPersons"));

        }
        objc_msgSend(v6, "suggestedPersonLocalIdentifiers");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v29, "count"))
          objc_msgSend(v20, "setObject:forKeyedSubscript:", v29, CFSTR("suggestedPersonLocalIdentifiers"));
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ - %@"), *(_QWORD *)(v1 + 56), *(_QWORD *)(v1 + 64));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setObject:forKeyedSubscript:", v30, CFSTR("deviceInformation"));

        objc_msgSend(v15, "setFeaturesProperties:", v20);
        objc_msgSend(v6, "title");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        if (v31)
          objc_msgSend(v15, "setTitle:", v31);
        objc_msgSend(v6, "subtitle");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32)
          objc_msgSend(v15, "setSubtitle:", v32);
        v33 = objc_msgSend(v6, "subtype");
        if (objc_msgSend(MEMORY[0x1E0CD17D0], "hasPersonLocalIdentifierInContextForSuggestionSubype:", v33))
        {
          objc_msgSend(v6, "suggestedPersonLocalIdentifiers");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "firstObject");
          v35 = (void *)objc_claimAutoreleasedReturnValue();

          if (v35)
          {
            objc_msgSend(v15, "setContext:", v35);
          }
          else
          {
            v37 = *(NSObject **)(*(_QWORD *)(v1 + 40) + 8);
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              v102 = (const char *)v6;
              _os_log_error_impl(&dword_1CAC16000, v37, OS_LOG_TYPE_ERROR, "Unexpected 'nil' personLocalIdentifier for People/Pet Wallpaper Suggestion %@", buf, 0xCu);
            }
          }

        }
        v38 = objc_msgSend(v6, "availableFeatures");
        if (v38)
          objc_msgSend(v15, "setAvailableFeatures:", v38);
        objc_msgSend(v15, "placeholderForCreatedSuggestion");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "localIdentifier");
        v40 = (void *)objc_claimAutoreleasedReturnValue();

        if (v40)
        {
          v41 = v76;
          if (objc_msgSend(v6, "notificationState") == 1)
          {
            objc_msgSend(v15, "setNotificationState:", 1);
            objc_msgSend(*(id *)(v1 + 72), "addObject:", v40);
          }
          objc_msgSend(*(id *)(v1 + 80), "addObject:", v40);
        }
        else
        {
          v42 = *(NSObject **)(*(_QWORD *)(v1 + 40) + 8);
          v41 = v76;
          if (os_log_type_enabled(v42, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 136315394;
            v102 = "-[PHASuggestionController commitSuggestions:retiringSuggestions:deletingSuggestions:withOptions:error:]_block_invoke";
            v103 = 2112;
            v104 = v15;
            _os_log_error_impl(&dword_1CAC16000, v42, OS_LOG_TYPE_ERROR, "%s: Getting a nil placeholder for created suggestion: %@", buf, 0x16u);
          }
        }
        v4 = v4 + 1.0;

        v3 = v72;
        v8 = v78;
        v7 = v79;
        v9 = v77;
LABEL_57:

        objc_autoreleasePoolPop(v7);
        ++v5;
      }
      while (v5 != v3);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v95, v106, 16);
    }
    while (v3);
  }

  if (objc_msgSend(*(id *)(v1 + 88), "clearFeaturedSuggestions")
    && objc_msgSend(*(id *)(*(_QWORD *)(v1 + 40) + 48), "count"))
  {
    v43 = *(_QWORD *)(v1 + 40);
    v44 = *(NSObject **)(v43 + 8);
    if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
    {
      v45 = *(void **)(v43 + 48);
      v46 = v44;
      v47 = objc_msgSend(v45, "count");
      *(_DWORD *)buf = 134217984;
      v102 = (const char *)v47;
      _os_log_impl(&dword_1CAC16000, v46, OS_LOG_TYPE_DEFAULT, "Clearing featured state for %lu suggestions", buf, 0xCu);

      v43 = *(_QWORD *)(v1 + 40);
    }
    v89 = 0u;
    v90 = 0u;
    v87 = 0u;
    v88 = 0u;
    v48 = *(id *)(v43 + 48);
    v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
    if (v49)
    {
      v50 = v49;
      v51 = *(_QWORD *)v88;
      do
      {
        for (j = 0; j != v50; ++j)
        {
          if (*(_QWORD *)v88 != v51)
            objc_enumerationMutation(v48);
          v53 = *(void **)(*((_QWORD *)&v87 + 1) + 8 * j);
          v54 = *(void **)(*(_QWORD *)(v80 + 40) + 64);
          objc_msgSend(v53, "localIdentifier");
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = objc_msgSend(v54, "containsObject:", v55);

          v57 = *(NSObject **)(*(_QWORD *)(v80 + 40) + 8);
          if (v56)
          {
            if (!os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              continue;
            v58 = v57;
            objc_msgSend(v53, "localIdentifier");
            v59 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v102 = v59;
            _os_log_impl(&dword_1CAC16000, v58, OS_LOG_TYPE_INFO, "Skip unfeaturing deleted suggestion: %@", buf, 0xCu);

          }
          else
          {
            if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
            {
              v60 = v57;
              objc_msgSend(v53, "localIdentifier");
              v61 = (char *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              v102 = v61;
              _os_log_impl(&dword_1CAC16000, v60, OS_LOG_TYPE_DEFAULT, "Unfeature suggestion: %@", buf, 0xCu);

            }
            objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", v53);
            v58 = objc_claimAutoreleasedReturnValue();
            -[NSObject setFeaturedState:](v58, "setFeaturedState:", 0);
          }

        }
        v50 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v87, v100, 16);
      }
      while (v50);
    }

    v1 = v80;
    v62 = *(_QWORD *)(v80 + 40);
    v63 = *(void **)(v62 + 48);
    *(_QWORD *)(v62 + 48) = 0;

  }
  v85 = 0u;
  v86 = 0u;
  v83 = 0u;
  v84 = 0u;
  v64 = *(id *)(v1 + 96);
  v65 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
  if (v65)
  {
    v66 = v65;
    v67 = *(_QWORD *)v84;
    do
    {
      for (k = 0; k != v66; ++k)
      {
        if (*(_QWORD *)v84 != v67)
          objc_enumerationMutation(v64);
        objc_msgSend(MEMORY[0x1E0CD17D8], "changeRequestForSuggestion:", *(_QWORD *)(*((_QWORD *)&v83 + 1) + 8 * k));
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v69, "markRetired");

      }
      v66 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v83, v99, 16);
    }
    while (v66);
  }

  result = objc_msgSend(*(id *)(v80 + 104), "count");
  if (result)
    return objc_msgSend(MEMORY[0x1E0CD17D8], "deleteSuggestions:", *(_QWORD *)(v80 + 104));
  return result;
}

+ (BOOL)_shouldCheckSuggestionRecylingForProfile:(unsigned __int8)a3
{
  return ((a3 - 2) & 0xFB) == 0;
}

+ (unint64_t)_retirementDelayInDaysForSuggestionType:(unsigned __int16)a3 andSubtype:(unsigned __int16)a4
{
  if (a4 == 502)
    return 15;
  if ((unsigned __int16)(a3 - 1) > 7u)
    return 0;
  return qword_1CADD06D0[(unsigned __int16)(a3 - 1)];
}

+ (double)_maximumDurationBeforeDeletionForSuggestionType:(unsigned __int16)a3 andSubtype:(unsigned __int16)a4
{
  return dbl_1CADD05E0[a4 == 502];
}

+ (id)availableSuggestionTypeInfosWithProfile:(unsigned __int8)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0D76258], "availableSuggestionTypeInfosWithProfile:", a3);
}

- (void)recordRetiredSuggestions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  int v13;
  int v14;
  int v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _QWORD v27[3];
  _QWORD v28[3];
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = 0;
    v9 = 0;
    v10 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v24 != v10)
          objc_enumerationMutation(v4);
        v12 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "type");
        v14 = objc_msgSend(v12, "state");
        if (v13 == 1 && v14 == 1)
        {
          v16 = objc_msgSend(v12, "notificationState");
          if (v16 == 2)
          {
            ++v8;
          }
          else if (v16 == 1)
          {
            ++v9;
          }
          else
          {
            ++v7;
          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v23, v29, 16);
    }
    while (v6);
    if (v9)
      goto LABEL_23;
  }
  else
  {
    v7 = 0;
    v8 = 0;
    v9 = 0;
  }
  if (v8 || v7)
  {
LABEL_23:
    -[PHASuggestionController graphManager](self, "graphManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "analytics");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = CFSTR("ignoredNotifications");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v9);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v28[0] = v19;
    v27[1] = CFSTR("ignoredNotifiedSuggestion");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v28[1] = v20;
    v27[2] = CFSTR("sharingSuggestionIgnored");
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v28[2] = v21;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "sendEvent:withPayload:", CFSTR("com.apple.Photos.suggestion.retired"), v22);

  }
}

- (void)recordDeletedSuggestions:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  const __CFString *v19;
  void *v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v4);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v10, "type") != 1 && !objc_msgSend(v10, "state"))
          ++v7;
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v21, 16);
    }
    while (v6);
    if (v7)
    {
      -[PHASuggestionController graphManager](self, "graphManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "analytics");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = CFSTR("singleAssetSuggestionNotConsumed");
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v13;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "sendEvent:withPayload:", CFSTR("com.apple.Photos.suggestion.singleAssetSuggestionNotConsumed"), v14);

    }
  }

}

- (void)recordCreatedSuggestions:(id)a3 duringSession:(id)a4
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int v12;
  int v13;
  int v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  int v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  const __CFString *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  unint64_t v66;
  unint64_t v67;
  unint64_t v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  void *v77;
  void *v78;
  id v79;
  unint64_t v80;
  uint64_t v81;
  void *v82;
  uint64_t v83;
  void *v84;
  uint64_t v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  _QWORD v90[12];
  _QWORD v91[12];
  const __CFString *v92;
  void *v93;
  const __CFString *v94;
  void *v95;
  _QWORD v96[12];
  _QWORD v97[12];
  _QWORD v98[2];
  _QWORD v99[2];
  _BYTE v100[128];
  uint64_t v101;

  v101 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v55 = a4;
  v86 = 0u;
  v87 = 0u;
  v88 = 0u;
  v89 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
  v79 = v5;
  if (!v6)
  {
    v74 = 0;
    v76 = 0;
    v8 = 0;
    v57 = 0;
    v58 = 0;
    v59 = 0;
    v60 = 0;
    v61 = 0;
    v62 = 0;
    v56 = 0;
    v80 = 0;
    v83 = 0;
    v67 = 0;
    v68 = 0;
    v71 = 0;
    v65 = 0;
    v66 = 0;
    v63 = 0;
    v64 = 0;
    goto LABEL_37;
  }
  v7 = v6;
  v74 = 0;
  v76 = 0;
  v8 = 0;
  v57 = 0;
  v58 = 0;
  v59 = 0;
  v60 = 0;
  v61 = 0;
  v62 = 0;
  v56 = 0;
  v80 = 0;
  v83 = 0;
  v67 = 0;
  v68 = 0;
  v71 = 0;
  v65 = 0;
  v66 = 0;
  v63 = 0;
  v64 = 0;
  v9 = *(_QWORD *)v87;
LABEL_3:
  v10 = 0;
  while (2)
  {
    if (*(_QWORD *)v87 != v9)
      objc_enumerationMutation(v5);
    v11 = *(void **)(*((_QWORD *)&v86 + 1) + 8 * v10);
    v12 = objc_msgSend(v11, "type");
    v13 = objc_msgSend(v11, "subtype");
    v14 = v13;
    switch(v12)
    {
      case 1:
        v15 = v8;
        objc_msgSend(v11, "features");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = objc_msgSend(v16, "count");

        objc_msgSend(v11, "suggestedPersonLocalIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "count");

        v20 = objc_msgSend(v11, "notificationState");
        v21 = v83;
        if (v20)
          v21 = v83 + 1;
        v83 = v21;
        if (v14 == 101)
        {
          ++v71;
          v66 += v17;
        }
        else
        {
          if (v14 != 102)
            goto LABEL_23;
          v67 += v17;
          ++v68;
        }
        v80 += v19;
LABEL_23:
        v5 = v79;
        v8 = v15;
LABEL_24:
        if (v7 != ++v10)
          continue;
        v22 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v86, v100, 16);
        v7 = v22;
        if (v22)
          goto LABEL_3;
LABEL_37:
        v23 = v55;
        switch(objc_msgSend(v55, "profile"))
        {
          case 0u:
            -[PHASuggestionController graphManager](self, "graphManager");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "analytics");
            v84 = (void *)objc_claimAutoreleasedReturnValue();
            v96[0] = CFSTR("numberOfSingleAssetSuggestionCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v97[0] = v25;
            v96[1] = CFSTR("editLoopCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v62);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v97[1] = v26;
            v96[2] = CFSTR("editLongExposureCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v63);
            v81 = objc_claimAutoreleasedReturnValue();
            v97[2] = v81;
            v96[3] = CFSTR("editBounceCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v64);
            v75 = (void *)objc_claimAutoreleasedReturnValue();
            v97[3] = v75;
            v96[4] = CFSTR("editPortraitStudioLightCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v65);
            v72 = (void *)objc_claimAutoreleasedReturnValue();
            v97[4] = v72;
            v96[5] = CFSTR("outstanderCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v76);
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            v97[5] = v77;
            v96[6] = CFSTR("recentFavoriteCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v57);
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            v97[6] = v69;
            v96[7] = CFSTR("recentEditCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v58);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v97[7] = v27;
            v96[8] = CFSTR("recentAestheticsCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v59);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v97[8] = v28;
            v96[9] = CFSTR("recentPersonCentricCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v60);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v97[9] = v29;
            v96[10] = CFSTR("recentSocialGroupCentricCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v61);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v97[10] = v30;
            v96[11] = CFSTR("recentSyndicatedAssetCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v56);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            v97[11] = v31;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v97, v96, 12);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v84, "sendEvent:withPayload:", CFSTR("com.apple.Photos.suggestion.singleAsset"), v32);

            v23 = v55;
            v5 = v79;

            v33 = v84;
            v34 = (void *)v81;
            goto LABEL_51;
          case 1u:
            v35 = (void *)MEMORY[0x1E0C99E08];
            v98[0] = CFSTR("sentNotifications");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v83);
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            v98[1] = CFSTR("numberOfPersonsSuggested");
            v99[0] = v36;
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v80 / (double)(v71 + v68));
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            v99[1] = v37;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v99, v98, 2);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v35, "dictionaryWithDictionary:", v38);
            v24 = (void *)objc_claimAutoreleasedReturnValue();

            v23 = v55;
            objc_msgSend(v55, "notificationProfile");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v33 = v39;
            if (v39)
            {
              objc_msgSend(v39, "userType");
              PGStringFromSuggestionNotificationUserType();
              v40 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v40, CFSTR("notificationProfile"));

            }
            if (v71)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:");
              v41 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v41, CFSTR("momentShareCreated"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v66 / (double)v71);
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v42, CFSTR("numberOfTextFeaturesPerMoment"));

            }
            if (v68)
            {
              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v68);
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v43, CFSTR("collectionShareCreated"));

              objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", (double)v67 / (double)v68);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "setObject:forKeyedSubscript:", v44, CFSTR("numberOfTextFeaturesPerCollection"));

            }
            -[PHASuggestionController graphManager](self, "graphManager");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "analytics");
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = v45;
            v46 = CFSTR("com.apple.Photos.suggestion.sharing");
            v47 = v24;
            goto LABEL_49;
          case 3u:
            -[PHASuggestionController graphManager](self, "graphManager");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "analytics");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v92 = CFSTR("longtailCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v74);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v93 = v25;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v93, &v92, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = CFSTR("com.apple.Photos.suggestion.widget");
            goto LABEL_48;
          case 4u:
            -[PHASuggestionController graphManager](self, "graphManager");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v24, "analytics");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            v94 = CFSTR("onThisDayCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v8);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v95 = v25;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v95, &v94, 1);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = CFSTR("com.apple.Photos.suggestion.onThisDay");
LABEL_48:
            v45 = v33;
            v47 = v26;
LABEL_49:
            objc_msgSend(v45, "sendEvent:withPayload:", v46, v47);
            goto LABEL_52;
          case 5u:
            v82 = (void *)MEMORY[0x1E0D09910];
            v90[0] = CFSTR("numberOfSingleAssetSuggestionCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v91[0] = v24;
            v90[1] = CFSTR("editLoopCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v62);
            v85 = objc_claimAutoreleasedReturnValue();
            v91[1] = v85;
            v90[2] = CFSTR("editLongExposureCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v63);
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            v91[2] = v25;
            v90[3] = CFSTR("editBounceCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v64);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            v91[3] = v26;
            v90[4] = CFSTR("editPortraitStudioLightCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v65);
            v73 = objc_claimAutoreleasedReturnValue();
            v91[4] = v73;
            v90[5] = CFSTR("outstanderCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v76);
            v78 = (void *)objc_claimAutoreleasedReturnValue();
            v91[5] = v78;
            v90[6] = CFSTR("recentFavoriteCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v57);
            v70 = (void *)objc_claimAutoreleasedReturnValue();
            v91[6] = v70;
            v90[7] = CFSTR("recentEditCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v58);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            v91[7] = v48;
            v90[8] = CFSTR("recentAestheticsCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v59);
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v91[8] = v49;
            v90[9] = CFSTR("recentPersonCentricCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v60);
            v50 = (void *)objc_claimAutoreleasedReturnValue();
            v91[9] = v50;
            v90[10] = CFSTR("recentSocialGroupCentricCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v61);
            v51 = (void *)objc_claimAutoreleasedReturnValue();
            v91[10] = v51;
            v90[11] = CFSTR("longtailCreated");
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v74);
            v52 = (void *)objc_claimAutoreleasedReturnValue();
            v91[11] = v52;
            objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v91, v90, 12);
            v53 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v82, "sendEvent:withPayload:", CFSTR("com.apple.Photos.suggestion.singleAsset"), v53);

            v5 = v79;
            v23 = v55;

            v33 = (void *)v85;
            v34 = (void *)v73;
LABEL_51:

LABEL_52:
            break;
          default:
            break;
        }

        return;
      case 2:
        switch(v13)
        {
          case 201:
            ++v62;
            break;
          case 202:
            ++v63;
            break;
          case 203:
            ++v64;
            break;
          case 204:
            ++v65;
            break;
          default:
            goto LABEL_24;
        }
        goto LABEL_24;
      case 3:
        switch(v13)
        {
          case 301:
            ++v57;
            break;
          case 302:
            ++v58;
            break;
          case 303:
            ++v59;
            break;
          case 304:
            ++v60;
            break;
          case 305:
            ++v61;
            break;
          case 306:
            ++v56;
            break;
          default:
            goto LABEL_24;
        }
        goto LABEL_24;
      case 4:
        ++v8;
        goto LABEL_24;
      case 5:
        if (v13 == 502)
        {
          ++v74;
        }
        else if (v13 == 501)
        {
          ++v76;
        }
        goto LABEL_24;
      default:
        goto LABEL_24;
    }
  }
}

@end
