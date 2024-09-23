@implementation PGShareBackSuggester

- (PGShareBackSuggester)initWithSources:(id)a3 positiveProcessingValue:(unsigned __int16)a4 loggingConnection:(id)a5 photoLibrary:(id)a6 graph:(id)a7
{
  NSArray *v12;
  NSObject *v13;
  id v14;
  id v15;
  PGShareBackSuggester *v16;
  PGShareBackSuggester *v17;
  NSArray *v18;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  NSArray *sources;
  id v28;
  NSArray *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  objc_super v34;
  uint8_t v35[128];
  uint8_t buf[4];
  NSArray *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v12 = (NSArray *)a3;
  v13 = a5;
  v14 = a6;
  v15 = a7;
  v34.receiver = self;
  v34.super_class = (Class)PGShareBackSuggester;
  v16 = -[PGShareBackSuggester init](&v34, sel_init);
  v17 = v16;
  if (v16)
  {
    v28 = v14;
    objc_storeStrong((id *)&v16->_photoLibrary, a6);
    v17->_positiveProcessingValue = a4;
    objc_storeStrong((id *)&v17->_loggingConnection, a5);
    v18 = (NSArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v12;
      _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_DEFAULT, "[PGShareBackSuggester] Initialized suggester with sources: %@", buf, 0xCu);
    }
    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v29 = v12;
    v19 = v12;
    v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v23);
          v25 = (void *)MEMORY[0x1CAA4EB2C]();
          if (objc_msgSend(v24, "prepareSourceWithGraph:", v15))
            -[NSArray addObject:](v18, "addObject:", v24);
          objc_autoreleasePoolPop(v25);
          ++v23;
        }
        while (v21 != v23);
        v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v21);
    }

    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v37 = v18;
      _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_DEFAULT, "[PGShareBackSuggester] Available sources: %@", buf, 0xCu);
    }
    sources = v17->_sources;
    v17->_sources = v18;

    v14 = v28;
    v12 = v29;
  }

  return v17;
}

- (id)suggesterResultsForInputs:(id)a3 inGraph:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  OS_os_log *v10;
  id v11;
  void *v12;
  void *v13;
  PHPhotoLibrary *photoLibrary;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
  void *v29;
  void *v30;
  id v31;
  id v32;
  PGShareBackSuggesterResult *v33;
  NSObject *oslog;
  id v36;
  void *v37;
  id *v38;
  id v39;
  id v40;
  NSArray *obj;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *context;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  id v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  uint8_t v56[128];
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  _BYTE v61[128];
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = self->_loggingConnection;
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = (void *)objc_msgSend(v8, "mutableCopy");
  +[PGShareBackSuggesterInput universalDateIntervalForSuggesterInputs:withTimeIntervalPadding:](PGShareBackSuggesterInput, "universalDateIntervalForSuggesterInputs:withTimeIntervalPadding:", v8, 7200.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  photoLibrary = self->_photoLibrary;
  v38 = a5;
  if (photoLibrary)
  {
    -[PHPhotoLibrary librarySpecificFetchOptions](photoLibrary, "librarySpecificFetchOptions");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGShareBackSuggester momentUUIDsForExtendedUniversalDateInterval:suggesterInputs:momentFetchOptions:](PGShareBackSuggester, "momentUUIDsForExtendedUniversalDateInterval:suggesterInputs:momentFetchOptions:", v13, v8, v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", v16, v9);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "set");
    v45 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1CA237000, (os_log_t)v10, OS_LOG_TYPE_ERROR, "[PGShareBackSuggester] No photo library available, this should only be hit during unit testing", buf, 2u);
    }
    +[PGShareBackSuggesterInput localDateIntervalForSuggesterInputs:withTimeIntervalPadding:](PGShareBackSuggesterInput, "localDateIntervalForSuggesterInputs:withTimeIntervalPadding:", v8, 7200.0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "momentNodesOverlappingLocalDateInterval:", v16);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
  }

  -[NSArray lastObject](self->_sources, "lastObject");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = self->_sources;
  v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
  if (v43)
  {
    v42 = *(_QWORD *)v53;
    oslog = v10;
    v36 = v8;
    v39 = v11;
    v40 = v9;
    v37 = v13;
LABEL_8:
    v18 = 0;
    while (1)
    {
      if (*(_QWORD *)v53 != v42)
        objc_enumerationMutation(obj);
      v19 = *(void **)(*((_QWORD *)&v52 + 1) + 8 * v18);
      v20 = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(v19, "validInputsForSource:givenSuggesterResults:", v12, v11);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = 0;
      objc_msgSend(v19, "suggesterResultsForInputs:momentNodes:inGraph:error:", v21, v45, v9, &v51);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v51;
      if (v23)
        break;
      objc_msgSend(v11, "addObjectsFromArray:", v22);
      if (v19 != v44)
      {
        context = v20;
        v49 = 0u;
        v50 = 0u;
        v47 = 0u;
        v48 = 0u;
        v24 = v22;
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
        if (v25)
        {
          v26 = v25;
          v27 = *(_QWORD *)v48;
          do
          {
            for (i = 0; i != v26; ++i)
            {
              if (*(_QWORD *)v48 != v27)
                objc_enumerationMutation(v24);
              v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
              if ((self->_positiveProcessingValue & objc_msgSend(v29, "processingValue", oslog)) != 0)
              {
                objc_msgSend(v29, "suggesterInputs");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v12, "removeObjectsInArray:", v30);

              }
            }
            v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v56, 16);
          }
          while (v26);
        }

        v11 = v39;
        v9 = v40;
        v20 = context;
        if (!objc_msgSend(v12, "count"))
        {
          v31 = 0;
          v22 = v24;
          v10 = (OS_os_log *)oslog;
          v8 = v36;
          goto LABEL_30;
        }
      }

      objc_autoreleasePoolPop(v20);
      if (++v18 == v43)
      {
        v10 = (OS_os_log *)oslog;
        v8 = v36;
        v13 = v37;
        v43 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v52, v61, 16);
        if (v43)
          goto LABEL_8;
        goto LABEL_25;
      }
    }
    v31 = v23;
    context = v20;
    v10 = (OS_os_log *)oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v8 = v36;
      v58 = v36;
      v59 = 2112;
      v60 = v31;
      _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "[PGShareBackSuggester] Stopping due to error for suggester inputs: %@ - %@", buf, 0x16u);
    }
    else
    {
      v8 = v36;
    }
LABEL_30:

    objc_autoreleasePoolPop(context);
    v13 = v37;
    if (!v31)
      goto LABEL_33;
    if (v38)
    {
      v31 = objc_retainAutorelease(v31);
      v32 = 0;
      *v38 = v31;
    }
    else
    {
      v32 = 0;
    }
  }
  else
  {
LABEL_25:

LABEL_33:
    if (!objc_msgSend(v11, "count", oslog) && !objc_msgSend(v45, "count"))
    {
      v33 = -[PGShareBackSuggesterResult initWithInputs:processingValue:momentNodes:]([PGShareBackSuggesterResult alloc], "initWithInputs:processingValue:momentNodes:", v8, 1, v45);
      objc_msgSend(v11, "addObject:", v33);
      if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v58 = v13;
        _os_log_impl(&dword_1CA237000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "[PGShareBackLocationSource] No moments for universal date interval %@", buf, 0xCu);
      }

    }
    if (os_log_type_enabled((os_log_t)v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v58 = v8;
      v59 = 2112;
      v60 = v11;
      _os_log_impl(&dword_1CA237000, (os_log_t)v10, OS_LOG_TYPE_DEFAULT, "[PGShareBackSuggester] Results for suggester inputs: %@ - %@", buf, 0x16u);
    }
    v32 = v11;
    v31 = 0;
  }

  return v32;
}

- (id)suggesterResultsForUnclusteredSuggesterInputs:(id)a3 inGraph:(id)a4 error:(id *)a5
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v26;
  id obj;
  id v28;
  id v29;
  id v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _QWORD v36[4];

  v36[2] = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v29 = a4;
  v26 = v7;
  +[PGShareBackLocationSource suggesterInputsByDateIntervalForInputs:](PGShareBackLocationSource, "suggesterInputsByDateIntervalForInputs:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "allKeys");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("startDate"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v10;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("endDate"), 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v36[1] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sortedArrayUsingDescriptors:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v28 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  obj = v13;
  v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v32;
    do
    {
      v18 = 0;
      v19 = v16;
      do
      {
        if (*(_QWORD *)v32 != v17)
          objc_enumerationMutation(obj);
        v20 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v18);
        v21 = (void *)MEMORY[0x1CAA4EB2C]();
        objc_msgSend(v8, "objectForKeyedSubscript:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = v19;
        -[PGShareBackSuggester suggesterResultsForInputs:inGraph:error:](self, "suggesterResultsForInputs:inGraph:error:", v22, v29, &v30);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = v30;

        if (v23)
          objc_msgSend(v28, "addObjectsFromArray:", v23);

        objc_autoreleasePoolPop(v21);
        ++v18;
        v19 = v16;
      }
      while (v15 != v18);
      v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    }
    while (v15);
  }
  else
  {
    v16 = 0;
  }

  if (a5)
    *a5 = objc_retainAutorelease(v16);

  return v28;
}

- (unsigned)positiveProcessingValue
{
  return self->_positiveProcessingValue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_sources, 0);
}

+ (id)shareBackSuggesterForSyndicationWithLoggingConnection:(id)a3 syndicationPhotoLibrary:(id)a4 systemPhotoLibrary:(id)a5 graph:(id)a6 serviceManager:(id)a7
{
  objc_class *v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;

  v12 = (objc_class *)MEMORY[0x1E0D4B158];
  v13 = a7;
  v14 = a6;
  v15 = a5;
  v16 = a4;
  v17 = a3;
  v18 = objc_alloc_init(v12);
  objc_msgSend(a1, "shareBackSuggesterForSyndicationWithLoggingConnection:syndicationPhotoLibrary:systemPhotoLibrary:graph:faceIdentification:serviceManager:", v17, v16, v15, v14, v18, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

+ (id)shareBackSuggesterForSyndicationWithLoggingConnection:(id)a3 syndicationPhotoLibrary:(id)a4 systemPhotoLibrary:(id)a5 graph:(id)a6 faceIdentification:(id)a7 serviceManager:(id)a8
{
  objc_class *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  PGShareBackLocationSource *v22;
  PGShareBackSignificantLocationSource *v23;
  PGShareBackCoreRoutineSource *v24;
  void *v25;
  PGShareBackCoreRoutineSource *v26;
  PGShareBackSceneprintSource *v27;
  PGShareBackFacesSource *v28;
  PGShareBackPetSource *v29;
  void *v30;

  v14 = (objc_class *)MEMORY[0x1E0C99DE8];
  v15 = a8;
  v16 = a7;
  v17 = a6;
  v18 = a5;
  v19 = a4;
  v20 = a3;
  v21 = objc_alloc_init(v14);
  v22 = -[PGShareBackSource initWithLoggingConnection:]([PGShareBackLocationSource alloc], "initWithLoggingConnection:", v20);
  objc_msgSend(v21, "addObject:", v22);

  v23 = -[PGShareBackSource initWithLoggingConnection:]([PGShareBackSignificantLocationSource alloc], "initWithLoggingConnection:", v20);
  objc_msgSend(v21, "addObject:", v23);

  v24 = [PGShareBackCoreRoutineSource alloc];
  objc_msgSend(v15, "routineService");
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = -[PGShareBackCoreRoutineSource initWithRoutineService:loggingConnection:](v24, "initWithRoutineService:loggingConnection:", v25, v20);
  objc_msgSend(v21, "addObject:", v26);

  v27 = -[PGShareBackSceneprintSource initWithLoggingConnection:photoLibrary:]([PGShareBackSceneprintSource alloc], "initWithLoggingConnection:photoLibrary:", v20, v18);
  objc_msgSend(v21, "addObject:", v27);

  v28 = -[PGShareBackFacesSource initWithLoggingConnection:photoLibrary:faceIdentification:]([PGShareBackFacesSource alloc], "initWithLoggingConnection:photoLibrary:faceIdentification:", v20, v19, v16);
  objc_msgSend(v21, "addObject:", v28);

  v29 = -[PGShareBackPetSource initWithLoggingConnection:photoLibrary:faceIdentification:]([PGShareBackPetSource alloc], "initWithLoggingConnection:photoLibrary:faceIdentification:", v20, v19, v16);
  objc_msgSend(v21, "addObject:", v29);

  v30 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSources:positiveProcessingValue:loggingConnection:photoLibrary:graph:", v21, 32496, v20, v18, v17);
  return v30;
}

+ (id)shareBackSuggesterForExternalAssetProcessingWithLoggingConnection:(id)a3 photoLibrary:(id)a4 graph:(id)a5 serviceManager:(id)a6
{
  objc_class *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  PGShareBackLocationSource *v16;
  PGShareBackSignificantLocationSource *v17;
  PGShareBackCoreRoutineSource *v18;
  void *v19;
  PGShareBackCoreRoutineSource *v20;
  PGShareBackSceneprintSource *v21;
  id v22;
  PGShareBackFacesSource *v23;
  PGShareBackPetSource *v24;
  void *v25;

  v10 = (objc_class *)MEMORY[0x1E0C99DE8];
  v11 = a6;
  v12 = a5;
  v13 = a4;
  v14 = a3;
  v15 = objc_alloc_init(v10);
  v16 = -[PGShareBackSource initWithLoggingConnection:]([PGShareBackLocationSource alloc], "initWithLoggingConnection:", v14);
  objc_msgSend(v15, "addObject:", v16);

  v17 = -[PGShareBackSource initWithLoggingConnection:]([PGShareBackSignificantLocationSource alloc], "initWithLoggingConnection:", v14);
  objc_msgSend(v15, "addObject:", v17);

  v18 = [PGShareBackCoreRoutineSource alloc];
  objc_msgSend(v11, "routineService");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = -[PGShareBackCoreRoutineSource initWithRoutineService:loggingConnection:](v18, "initWithRoutineService:loggingConnection:", v19, v14);
  objc_msgSend(v15, "addObject:", v20);

  v21 = -[PGShareBackSceneprintSource initWithLoggingConnection:photoLibrary:]([PGShareBackSceneprintSource alloc], "initWithLoggingConnection:photoLibrary:", v14, v13);
  objc_msgSend(v15, "addObject:", v21);

  v22 = objc_alloc_init(MEMORY[0x1E0D4B150]);
  v23 = -[PGShareBackFacesSource initWithLoggingConnection:photoLibrary:faceIdentification:]([PGShareBackFacesSource alloc], "initWithLoggingConnection:photoLibrary:faceIdentification:", v14, v13, v22);
  objc_msgSend(v15, "addObject:", v23);

  v24 = -[PGShareBackPetSource initWithLoggingConnection:photoLibrary:faceIdentification:]([PGShareBackPetSource alloc], "initWithLoggingConnection:photoLibrary:faceIdentification:", v14, v13, v22);
  objc_msgSend(v15, "addObject:", v24);

  v25 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSources:positiveProcessingValue:loggingConnection:photoLibrary:graph:", v15, 15601, v14, v13, v12);
  return v25;
}

+ (id)shareBackSuggesterForCMMWithLoggingConnection:(id)a3 photoLibrary:(id)a4 graph:(id)a5
{
  id v8;
  id v9;
  id v10;
  PGShareBackLocationSource *v11;
  void *v12;
  void *v13;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[PGShareBackSource initWithLoggingConnection:]([PGShareBackLocationSource alloc], "initWithLoggingConnection:", v10);
  v15[0] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithSources:positiveProcessingValue:loggingConnection:photoLibrary:graph:", v12, 18, v10, v9, v8);
  return v13;
}

+ (id)momentUUIDsForExtendedUniversalDateInterval:(id)a3 suggesterInputs:(id)a4 momentFetchOptions:(id)a5
{
  id v6;
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
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _QWORD v30[4];

  v30[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a5;
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "startDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "endDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K >= %@ AND %K <= %@"), CFSTR("endDate"), v9, CFSTR("startDate"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0D718E8], "fetchPredicateForExcludingOriginatorState:", 24);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)MEMORY[0x1E0CB3528];
  v30[0] = v11;
  v30[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "andPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setInternalPredicate:", v15);

  objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentsWithOptions:", v7);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v18 = v16;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v26;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v26 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * v22), "uuid");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObject:", v23);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v20);
  }

  return v17;
}

@end
