@implementation PGPetWallpaperSuggester

- (PGPetWallpaperSuggester)initWithSession:(id)a3
{
  id v4;
  PGPetWallpaperSuggester *v5;
  PGWallpaperSuggestionAssetGater *v6;
  void *v7;
  uint64_t v8;
  PGWallpaperSuggestionAssetGater *assetGater;
  uint64_t v10;
  CLSSceneConfidenceThresholdHelper *peopleSceneConfidenceThresholdHelper;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGPetWallpaperSuggester;
  v5 = -[PGAbstractSuggester initWithSession:](&v13, sel_initWithSession_, v4);
  if (v5)
  {
    if (objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions"))
    {
      v6 = [PGWallpaperSuggestionAssetGater alloc];
      objc_msgSend(v4, "loggingConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PGWallpaperSuggestionAssetGater initWithType:loggingConnection:](v6, "initWithType:loggingConnection:", 2, v7);
      assetGater = v5->_assetGater;
      v5->_assetGater = (PGWallpaperSuggestionAssetGater *)v8;

    }
    +[PGWallpaperSuggestionUtilities peopleSceneConfidenceThresholdHelper](PGWallpaperSuggestionUtilities, "peopleSceneConfidenceThresholdHelper");
    v10 = objc_claimAutoreleasedReturnValue();
    peopleSceneConfidenceThresholdHelper = v5->_peopleSceneConfidenceThresholdHelper;
    v5->_peopleSceneConfidenceThresholdHelper = (CLSSceneConfidenceThresholdHelper *)v10;

    -[PGPetWallpaperSuggester setupFilteringContexts](v5, "setupFilteringContexts");
  }

  return v5;
}

- (void)setupFilteringContexts
{
  PGPetWallpaperSuggester *v2;
  objc_class *v3;
  int IsIPad;
  PGPetWallpaperSuggesterFilteringContext *v5;
  uint64_t v6;
  PGPetWallpaperSuggesterFilteringContext *primaryFilteringContext;
  PGPetWallpaperSuggesterFilteringContext *v8;
  PGPetWallpaperSuggesterFilteringContext *secondaryFilteringContext;
  uint64_t v10;
  PGPetWallpaperSuggesterFilteringContext *v11;
  objc_class *v12;
  objc_class *v13;
  PGPetWallpaperSuggester *v14;
  SEL v15;
  id v16;
  id v17;

  v2 = self;
  v3 = (objc_class *)objc_opt_class();
  if (!v2)
  {
    NSStringFromClass(v3);
    objc_claimAutoreleasedReturnValue();
LABEL_9:
    v14 = (PGPetWallpaperSuggester *)_PFAssertFailHandler();
    -[PGPetWallpaperSuggester suggestionsWithOptions:progress:](v14, v15, v16, v17);
    return;
  }
  if ((-[PGPetWallpaperSuggester isMemberOfClass:](v2, "isMemberOfClass:", v3) & 1) == 0)
  {
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    objc_claimAutoreleasedReturnValue();
    v13 = (objc_class *)objc_opt_class();
    NSStringFromClass(v13);
    objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }

  IsIPad = PLPhysicalDeviceIsIPad();
  v5 = [PGPetWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    v6 = -[PGPetWallpaperSuggesterFilteringContext initForPetsInOrientation:](v5, "initForPetsInOrientation:", 2);
    primaryFilteringContext = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGPetWallpaperSuggesterFilteringContext *)v6;

    v8 = -[PGPetWallpaperSuggesterFilteringContext initForPetsInOrientation:]([PGPetWallpaperSuggesterFilteringContext alloc], "initForPetsInOrientation:", 1);
    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = v8;
  }
  else
  {
    v10 = -[PGPetWallpaperSuggesterFilteringContext initForPetsInOrientation:](v5, "initForPetsInOrientation:", 1);
    v11 = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGPetWallpaperSuggesterFilteringContext *)v10;

    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = 0;
  }

}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  id v8;
  int v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  void *v18;
  char v19;
  char v21;
  BOOL v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  char v27;
  uint32_t denom;
  uint32_t numer;
  NSObject *v30;
  NSObject *v31;
  __int16 v32;
  __int16 v33;
  id v34;
  uint64_t v35;
  void *v36;
  void *v37;
  NSObject *v38;
  void *v39;
  void *v40;
  uint64_t v41;
  _QWORD v42[4];
  NSObject *v43;
  id v44;
  PGPetWallpaperSuggester *v45;
  id v46;
  uint64_t *v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  __int16 v51;
  __int16 v52;
  mach_timebase_info info;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  uint8_t buf[4];
  _BYTE v59[18];
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", v7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v9 = objc_msgSend(v8, "isCancelledWithProgress:", 0.0);
  *((_BYTE *)v55 + 24) = v9;
  if (!v9)
  {
    -[PGAbstractSuggester session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v6, "maximumNumberOfSuggestions");
    v14 = v12;
    v15 = os_signpost_id_generate(v14);
    v16 = v14;
    v17 = v16;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PGPetWallpaperSuggester", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v41 = mach_absolute_time();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      *(_DWORD *)v59 = v13;
      _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Starting to generate %d suggestions.", buf, 8u);
    }
    -[PGPetWallpaperSuggester fetchPets](self, "fetchPets");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v55 + 24))
    {
      *((_BYTE *)v55 + 24) = 1;
LABEL_13:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v59 = 101;
        *(_WORD *)&v59[4] = 2080;
        *(_QWORD *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Autobahn/PGPetWallpaperSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_16;
    }
    v19 = objc_msgSend(v8, "isCancelledWithProgress:", 0.2);
    *((_BYTE *)v55 + 24) = v19;
    if ((v19 & 1) != 0)
      goto LABEL_13;
    objc_msgSend(v8, "childProgressReporterFromStart:toEnd:", 0.2, 0.79);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPetWallpaperSuggester sortedCandidatesByPetLocalIdentifierFromPets:progressReporter:](self, "sortedCandidatesByPetLocalIdentifierFromPets:progressReporter:", v18);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v55 + 24))
    {
      *((_BYTE *)v55 + 24) = 1;
LABEL_21:
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v59 = 106;
        *(_WORD *)&v59[4] = 2080;
        *(_QWORD *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Autobahn/PGPetWallpaperSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = (id)MEMORY[0x1E0C9AA60];
      goto LABEL_24;
    }
    v21 = objc_msgSend(v8, "isCancelledWithProgress:", 0.8);
    *((_BYTE *)v55 + 24) = v21;
    if ((v21 & 1) != 0)
      goto LABEL_21;
    v34 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    objc_msgSend((id)objc_opt_class(), "suggestionTypes");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = objc_msgSend(v36, "firstIndex");

    objc_msgSend((id)objc_opt_class(), "suggestionSubtypes");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v37, "firstIndex");

    v22 = self->_assetGater == 0;
    v23 = 5;
    if (!self->_assetGater)
      v23 = 0;
    v24 = 2 * v13;
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    if (v22)
      v24 = 0;
    v42[2] = __59__PGPetWallpaperSuggester_suggestionsWithOptions_progress___block_invoke;
    v42[3] = &unk_1E8427538;
    v48 = v13;
    v49 = v23;
    v50 = v24;
    v38 = v17;
    v43 = v38;
    v47 = &v54;
    v25 = v8;
    v51 = v33;
    v52 = v32;
    v44 = v25;
    v45 = self;
    v26 = v34;
    v46 = v26;
    objc_msgSend(v40, "enumerateKeysAndObjectsUsingBlock:", v42);
    if (*((_BYTE *)v55 + 24))
    {
      *((_BYTE *)v55 + 24) = 1;
    }
    else
    {
      v27 = objc_msgSend(v25, "isCancelledWithProgress:", 1.0);
      *((_BYTE *)v55 + 24) = v27;
      if ((v27 & 1) == 0)
      {
        v35 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v30 = v38;
        v31 = v30;
        if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v31, OS_SIGNPOST_INTERVAL_END, v15, "PGPetWallpaperSuggester", ", buf, 2u);
        }

        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          *(_QWORD *)v59 = "PGPetWallpaperSuggester";
          *(_WORD *)&v59[8] = 2048;
          *(double *)&v59[10] = (float)((float)((float)((float)(v35 - v41) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
        }
        v10 = v26;
        goto LABEL_35;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v59 = 188;
      *(_WORD *)&v59[4] = 2080;
      *(_QWORD *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Autobahn/PGPetWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_35:

LABEL_24:
LABEL_16:

    goto LABEL_17;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v59 = 90;
    *(_WORD *)&v59[4] = 2080;
    *(_QWORD *)&v59[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Suggestions/Suggesters/Autobahn/PGPetWallpaperSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_17:
  _Block_object_dispose(&v54, 8);

  return v10;
}

- (id)fetchPets
{
  void *v2;
  NSObject *v3;
  os_signpost_id_t v4;
  NSObject *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint32_t denom;
  uint32_t numer;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint64_t v17;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v21;
  __int16 v22;
  double v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  -[PGAbstractSuggester session](self, "session");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "loggingConnection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = os_signpost_id_generate(v3);
  v5 = v3;
  v6 = v5;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v5))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PGPetWallpaperSuggesterFetchPets", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v7 = mach_absolute_time();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Fetching inferred user's pets and user-verified pets... (Pets Parity enabled)", buf, 2u);
  }
  objc_msgSend(v2, "workingContext");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "curationContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPetIdentityProcessor fetchInterestingEligiblePetsForWallpaperWithWorkingContext:curationContext:](PGGraphPetIdentityProcessor, "fetchInterestingEligiblePetsForWallpaperWithWorkingContext:curationContext:", v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v14 = v6;
  v15 = v14;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_END, v4, "PGPetWallpaperSuggesterFetchPets", ", buf, 2u);
  }

  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v21 = "PGPetWallpaperSuggesterFetchPets";
    v22 = 2048;
    v23 = (float)((float)((float)((float)(v11 - v7) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v16 = v15;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    v21 = (const char *)v17;
    _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Found %lu pets", buf, 0xCu);
  }

  return v10;
}

- (id)sortedCandidatesByPetLocalIdentifierFromPets:(id)a3 progressReporter:(id)a4
{
  id v6;
  id v7;
  id v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint32_t denom;
  uint32_t numer;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t spid;
  uint64_t v35;
  unint64_t v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v47[18];
  _BYTE v48[128];
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v7, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v47 = 208;
      *(_WORD *)&v47[4] = 2080;
      *(_QWORD *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Autobahn/PGPetWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v8 = (id)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v38 = v7;
    -[PGAbstractSuggester session](self, "session");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "loggingConnection");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);
    v11 = v9;
    v12 = v11;
    v36 = v10 - 1;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGPetWallpaperSuggesterFindCandidateForAllPets", ", buf, 2u);
    }
    spid = v10;

    info = 0;
    mach_timebase_info(&info);
    v35 = mach_absolute_time();
    v40 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v39 = v6;
    v13 = v6;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v42;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v42 != v16)
            objc_enumerationMutation(v13);
          v18 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * v17);
          v19 = (void *)MEMORY[0x1CAA4EB2C](v14);
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            v20 = v12;
            objc_msgSend(v18, "uuid", spid);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v47 = v21;
            _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Finding candidates for Pet %@", buf, 0xCu);

          }
          -[PGPetWallpaperSuggester candidatesForPet:](self, "candidatesForPet:", v18, spid);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[PGPetWallpaperSuggester rankedAndDedupedCandidatesFromCandidates:](self, "rankedAndDedupedCandidatesFromCandidates:", v22);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v22, "count"))
          {
            objc_msgSend(v18, "localIdentifier");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v40, "setObject:forKeyedSubscript:", v23, v24);

            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              v25 = v12;
              v26 = objc_msgSend(v22, "count");
              *(_DWORD *)buf = 134217984;
              *(_QWORD *)v47 = v26;
              _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Found %lu candidates.", buf, 0xCu);

            }
          }

          objc_autoreleasePoolPop(v19);
          ++v17;
        }
        while (v15 != v17);
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v48, 16);
        v15 = v14;
      }
      while (v14);
    }

    v7 = v38;
    if (objc_msgSend(v38, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v47 = 227;
        *(_WORD *)&v47[4] = 2080;
        *(_QWORD *)&v47[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Autobahn/PGPetWallpaperSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v8 = (id)MEMORY[0x1E0C9AA70];
      v6 = v39;
      v27 = v40;
    }
    else
    {
      v28 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v31 = v12;
      v32 = v31;
      if (v36 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v32, OS_SIGNPOST_INTERVAL_END, spid, "PGPetWallpaperSuggesterFindCandidateForAllPets", ", buf, 2u);
      }

      v27 = v40;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v47 = "PGPetWallpaperSuggesterFindCandidateForAllPets";
        *(_WORD *)&v47[8] = 2048;
        *(double *)&v47[10] = (float)((float)((float)((float)(v28 - v35) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v8 = v40;
      v6 = v39;
    }

  }
  return v8;
}

- (id)candidatesForPet:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  NSObject *v21;
  uint64_t v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t i;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  int v32;
  PGPetWallpaperSuggestionCandidate *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint32_t numer;
  uint32_t denom;
  NSObject *v42;
  NSObject *v43;
  NSObject *v44;
  int v45;
  void *v46;
  os_signpost_id_t spid;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;
  NSObject *v57;
  void *v58;
  void *v59;
  id obj;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  _OWORD v72[2];
  mach_timebase_info info;
  _BYTE v74[32];
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  _OWORD v80[2];
  uint8_t v81[128];
  uint8_t buf[16];
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _OWORD v89[2];
  uint64_t v90;

  v90 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "curationContext");
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  v50 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PGPetWallpaperFindCandidateForPet", ", buf, 2u);
  }
  spid = v8;

  info = 0;
  mach_timebase_info(&info);
  v49 = mach_absolute_time();
  v53 = v6;
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIncludedDetectionTypes:", &unk_1E84E9490);
  v12 = (void *)objc_opt_class();
  -[PGPetWallpaperSuggester primaryFilteringContext](self, "primaryFilteringContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "prefilteringInternalPredicateWithContext:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setInternalPredicate:", v14);

  v52 = v11;
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesForPerson:options:", v4, v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v10;
  if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
  {
    v17 = objc_msgSend(v15, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v17;
    _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Found %lu faces.", buf, 0xCu);
  }
  v55 = v4;

  +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:](PGWallpaperSuggestionUtilities, "assetFetchPropertySetsIncludingGating:", objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions"));
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsGroupedByFaceUUIDForFaces:fetchPropertySets:", v15);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x1E0CD1390];
  objc_msgSend(v18, "allValues");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "prefetchOnAssets:options:curationContext:", v20, 14, v59);

  v21 = v16;
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    v22 = objc_msgSend(v18, "count");
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)&buf[4] = v22;
    _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Found %lu assets.", buf, 0xCu);
  }
  v57 = v21;

  v56 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v54 = v5;
  objc_msgSend(v5, "forbiddenAssetUUIDs");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  memset(v89, 0, 28);
  v86 = 0u;
  v87 = 0u;
  v84 = 0u;
  v85 = 0u;
  *(_OWORD *)buf = 0u;
  v83 = 0u;
  v71 = 0u;
  memset(v72, 0, 28);
  v69 = 0u;
  v70 = 0u;
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v15;
  v24 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
  v58 = v23;
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v25; ++i)
      {
        if (*(_QWORD *)v62 != v26)
          objc_enumerationMutation(obj);
        v28 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(v28, "uuid");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "objectForKeyedSubscript:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();

        if (v30)
        {
          objc_msgSend(v30, "uuid");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          v32 = objc_msgSend(v23, "containsObject:", v31);

          if (v32)
          {
            v33 = v57;
            if (os_log_type_enabled(&v33->super, OS_LOG_TYPE_INFO))
            {
              objc_msgSend(v30, "uuid");
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)v74 = 138412290;
              *(_QWORD *)&v74[4] = v34;
              _os_log_impl(&dword_1CA237000, &v33->super, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Avoiding asset %@ because it has been rejected by the user", v74, 0xCu);

            }
          }
          else
          {
            v33 = -[PGPetWallpaperSuggestionCandidate initWithFace:inAsset:]([PGPetWallpaperSuggestionCandidate alloc], "initWithFace:inAsset:", v28, v30);
            v35 = (void *)objc_opt_class();
            -[PGPetWallpaperSuggester primaryFilteringContext](self, "primaryFilteringContext");
            v36 = (void *)objc_claimAutoreleasedReturnValue();
            LODWORD(v35) = objc_msgSend(v35, "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v33, v36, v59, self->_peopleSceneConfidenceThresholdHelper, buf);

            if ((_DWORD)v35)
            {
              if (!self->_secondaryFilteringContext
                || (v37 = (void *)objc_opt_class(),
                    -[PGPetWallpaperSuggester secondaryFilteringContext](self, "secondaryFilteringContext"),
                    v38 = (void *)objc_claimAutoreleasedReturnValue(),
                    LODWORD(v37) = objc_msgSend(v37, "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v33, v38, v59, self->_peopleSceneConfidenceThresholdHelper, &v65), v38, (_DWORD)v37))
              {
                objc_msgSend(v56, "addObject:", v33);
              }
            }
            v23 = v58;
          }

        }
      }
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v61, v81, 16);
    }
    while (v25);
  }

  v39 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v42 = v57;
  v43 = v42;
  if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v42))
  {
    *(_WORD *)v74 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v43, OS_SIGNPOST_INTERVAL_END, spid, "PGPetWallpaperFindCandidateForPet", ", v74, 2u);
  }

  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v74 = 136315394;
    *(_QWORD *)&v74[4] = "PGPetWallpaperFindCandidateForPet";
    *(_WORD *)&v74[12] = 2048;
    *(double *)&v74[14] = (float)((float)((float)((float)(v39 - v49) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v43, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v74, 0x16u);
  }
  v44 = v43;
  if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
  {
    v45 = objc_msgSend(v56, "count");
    objc_msgSend(v55, "localIdentifier");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)v74 = 67109378;
    *(_DWORD *)&v74[4] = v45;
    *(_WORD *)&v74[8] = 2112;
    *(_QWORD *)&v74[10] = v46;
    _os_log_impl(&dword_1CA237000, v44, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Found %d candidates after postfiltering for Pet %@", v74, 0x12u);

  }
  v79 = v88;
  v80[0] = v89[0];
  *(_OWORD *)((char *)v80 + 12) = *(_OWORD *)((char *)v89 + 12);
  v75 = v84;
  v76 = v85;
  v77 = v86;
  v78 = v87;
  *(_OWORD *)v74 = *(_OWORD *)buf;
  *(_OWORD *)&v74[16] = v83;
  -[PGPetWallpaperSuggester logPosterFilteringStatistics:](self, "logPosterFilteringStatistics:", v74);
  if (self->_secondaryFilteringContext)
  {
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v74 = 0;
      _os_log_impl(&dword_1CA237000, v44, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Secondary filtering...", v74, 2u);
    }
    v79 = v71;
    v80[0] = v72[0];
    *(_OWORD *)((char *)v80 + 12) = *(_OWORD *)((char *)v72 + 12);
    v75 = v67;
    v76 = v68;
    v77 = v69;
    v78 = v70;
    *(_OWORD *)v74 = v65;
    *(_OWORD *)&v74[16] = v66;
    -[PGPetWallpaperSuggester logPosterFilteringStatistics:](self, "logPosterFilteringStatistics:", v74);
  }
  if (*(int *)&buf[4] >= 1)
    objc_msgSend(MEMORY[0x1E0D77E10], "logInfo:prefix:avoidForKeyAssetStatistics:", v44, CFSTR("[PGPetWallpaperSuggester]"), (char *)&v84 + 12);

  return v56;
}

- (void)logPosterFilteringStatistics:(id *)a3
{
  void *v4;
  NSObject *v5;
  int var0;
  int var1;
  int var2;
  int var3;
  int var4;
  int var5;
  int var6;
  int var7;
  int var8;
  int var9;
  int var10;
  _DWORD v17[2];
  __int16 v18;
  int v19;
  __int16 v20;
  int v21;
  __int16 v22;
  int v23;
  __int16 v24;
  int v25;
  __int16 v26;
  int v27;
  __int16 v28;
  int v29;
  __int16 v30;
  int v31;
  __int16 v32;
  int v33;
  __int16 v34;
  int v35;
  __int16 v36;
  int v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  -[PGAbstractSuggester session](self, "session");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "loggingConnection");
  v5 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    var0 = a3->var0;
    var1 = a3->var1;
    var2 = a3->var2;
    var3 = a3->var3;
    var4 = a3->var4;
    var5 = a3->var5;
    var6 = a3->var6;
    var7 = a3->var7;
    var8 = a3->var8;
    var9 = a3->var9;
    var10 = a3->var10;
    v17[0] = 67111680;
    v17[1] = var0;
    v18 = 1024;
    v19 = var1;
    v20 = 1024;
    v21 = var2;
    v22 = 1024;
    v23 = var3;
    v24 = 1024;
    v25 = var4;
    v26 = 1024;
    v27 = var5;
    v28 = 1024;
    v29 = var6;
    v30 = 1024;
    v31 = var7;
    v32 = 1024;
    v33 = var8;
    v34 = 1024;
    v35 = var9;
    v36 = 1024;
    v37 = var10;
    _os_log_impl(&dword_1CA237000, v5, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Filtered out %d for isUtility, %d for avoidForKeyAsset, %d for aesthetics, %d for wallpaper score, %d for clock overlap, %d for low resolution, %d for crop score, %d for not safe for display, %d for positive people scene, %d for low light, %d for sensitive location", (uint8_t *)v17, 0x44u);
  }

}

- (id)rankedAndDedupedCandidatesFromCandidates:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint32_t numer;
  uint32_t denom;
  NSObject *v36;
  NSObject *v37;
  os_signpost_id_t spid;
  uint64_t v40;
  NSObject *v41;
  unint64_t v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id obj;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  uint64_t v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v62;
  __int16 v63;
  double v64;
  _BYTE v65[128];
  _BYTE v66[128];
  _QWORD v67[8];

  v67[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "loggingConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  v42 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PGPetWallpaperRankAndDedupeForPet", ", buf, 2u);
  }
  spid = v6;

  info = 0;
  mach_timebase_info(&info);
  v40 = mach_absolute_time();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", &__block_literal_global);
  -[PGPetWallpaperSuggesterFilteringContext timeIntervalForCandidateDeduping](self->_primaryFilteringContext, "timeIntervalForCandidateDeduping");
  objc_msgSend(v9, "setMaximumDistance:");
  objc_msgSend(v9, "setMinimumNumberOfObjects:", 1);
  v43 = v9;
  v45 = v4;
  objc_msgSend(v9, "performWithDataset:progressBlock:", v4, &__block_literal_global_283);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v11 = v8;
    v12 = objc_msgSend(v10, "count");
    *(_DWORD *)buf = 134217984;
    v62 = (const char *)v12;
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Deduped to %lu clusters", buf, 0xCu);

  }
  v41 = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.favorite"), 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v67[0] = v13;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.mediaAnalysisProperties.wallpaperScore"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v67[1] = v14;
  objc_msgSend(MEMORY[0x1E0D77F20], "cropScoreSortDescriptorForOrientation:", -[PGPetWallpaperSuggesterFilteringContext orientation](self->_primaryFilteringContext, "orientation"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v67[2] = v15;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.creationDate"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v67[3] = v16;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.uuid"), 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v67[4] = v17;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v67, 5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v46 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v10;
  v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
  if (v49)
  {
    v48 = *(_QWORD *)v57;
    do
    {
      for (i = 0; i != v49; ++i)
      {
        if (*(_QWORD *)v57 != v48)
          objc_enumerationMutation(obj);
        v20 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
        v21 = (void *)MEMORY[0x1CAA4EB2C]();
        v52 = 0u;
        v53 = 0u;
        v54 = 0u;
        v55 = 0u;
        objc_msgSend(v20, "objects");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
        if (!v23)
        {
          v25 = v22;
          goto LABEL_21;
        }
        v24 = v23;
        v50 = v21;
        v51 = i;
        v25 = 0;
        v26 = *(_QWORD *)v53;
        do
        {
          v27 = 0;
          v28 = v25;
          do
          {
            if (*(_QWORD *)v53 != v26)
              objc_enumerationMutation(v22);
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *(_QWORD *)(*((_QWORD *)&v52 + 1) + 8 * v27), v28, 0);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "sortedArrayUsingDescriptors:", v18);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "firstObject");
            v25 = (void *)objc_claimAutoreleasedReturnValue();

            ++v27;
            v28 = v25;
          }
          while (v24 != v27);
          v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v52, v65, 16);
        }
        while (v24);

        v21 = v50;
        i = v51;
        if (v25)
        {
          objc_msgSend(v46, "addObject:", v25);
LABEL_21:

        }
        objc_autoreleasePoolPop(v21);
      }
      v49 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v66, 16);
    }
    while (v49);
  }

  objc_msgSend(v46, "sortUsingDescriptors:", v18);
  v31 = v41;
  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    v32 = objc_msgSend(v46, "count");
    *(_DWORD *)buf = 134217984;
    v62 = (const char *)v32;
    _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] %lu ranked candidates after deduped.", buf, 0xCu);
  }

  v33 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v36 = v31;
  v37 = v36;
  if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v37, OS_SIGNPOST_INTERVAL_END, spid, "PGPetWallpaperRankAndDedupeForPet", ", buf, 2u);
  }

  if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v62 = "PGPetWallpaperRankAndDedupeForPet";
    v63 = 2048;
    v64 = (float)((float)((float)((float)(v33 - v40) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v46;
}

- (PGPetWallpaperSuggesterFilteringContext)primaryFilteringContext
{
  return self->_primaryFilteringContext;
}

- (void)setPrimaryFilteringContext:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFilteringContext, a3);
}

- (PGPetWallpaperSuggesterFilteringContext)secondaryFilteringContext
{
  return self->_secondaryFilteringContext;
}

- (void)setSecondaryFilteringContext:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryFilteringContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_primaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_peopleSceneConfidenceThresholdHelper, 0);
  objc_storeStrong((id *)&self->_assetGater, 0);
}

double __68__PGPetWallpaperSuggester_rankedAndDedupedCandidatesFromCandidates___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  v4 = a3;
  objc_msgSend(a2, "asset");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asset");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "creationDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "timeIntervalSinceDate:", v8);
  v10 = fabs(v9);

  return v10;
}

void __59__PGPetWallpaperSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  int v11;
  int v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  char v16;
  PGPetWallpaperSuggestion *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  PGPetWallpaperSuggestion *v21;
  void *v22;
  _BOOL8 v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  int v30;
  int v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  const __CFString *v41;
  NSObject *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  uint64_t v46;
  NSObject *v47;
  _BOOL4 v48;
  NSObject *v49;
  int v50;
  int v51;
  const char *v52;
  NSObject *v53;
  uint32_t v54;
  int v55;
  NSObject *v56;
  _BYTE *v57;
  uint64_t v58;
  uint64_t v59;
  id obj;
  PGWallpaperSuggestionAccumulator *v61;
  uint64_t v62;
  id v63;
  char v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  uint8_t buf[4];
  _BYTE v70[22];
  __int16 v71;
  int v72;
  __int16 v73;
  int v74;
  _BYTE v75[128];
  uint64_t v76;

  v76 = *MEMORY[0x1E0C80C00];
  v63 = a2;
  v7 = a3;
  v61 = -[PGWallpaperSuggestionAccumulator initWithTargetNumberOfSuggestions:targetMinimumNumberOfGatedSuggestions:maximumNumberOfSuggestionsToTryForGating:loggingConnection:]([PGWallpaperSuggestionAccumulator alloc], "initWithTargetNumberOfSuggestions:targetMinimumNumberOfGatedSuggestions:maximumNumberOfSuggestionsToTryForGating:loggingConnection:", *(_QWORD *)(a1 + 72), *(_QWORD *)(a1 + 80), *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 32));
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
  if (!v9)
  {
    v58 = 0;
    v59 = 0;
    v11 = 0;
    v12 = 0;
    goto LABEL_45;
  }
  v10 = v9;
  v57 = a4;
  v58 = 0;
  v59 = 0;
  v11 = 0;
  v12 = 0;
  v62 = *(_QWORD *)v66;
  obj = v8;
  do
  {
    v13 = 0;
    do
    {
      if (*(_QWORD *)v66 != v62)
        objc_enumerationMutation(obj);
      v14 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * v13);
      v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      if (*(_BYTE *)(v15 + 24))
      {
        v16 = 1;
      }
      else
      {
        v16 = objc_msgSend(*(id *)(a1 + 40), "isCancelledWithProgress:", 0.85);
        v15 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
      }
      *(_BYTE *)(v15 + 24) = v16;
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
      {
        *v57 = 1;
        v44 = obj;
        v45 = obj;
        goto LABEL_53;
      }
      v17 = [PGPetWallpaperSuggestion alloc];
      v18 = *(unsigned __int16 *)(a1 + 96);
      v19 = *(unsigned __int16 *)(a1 + 98);
      objc_msgSend(v14, "asset");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = -[PGPetWallpaperSuggestion initWithPetLocalIdentifier:type:subtype:asset:](v17, "initWithPetLocalIdentifier:type:subtype:asset:", v63, v18, v19, v20);

      v64 = 1;
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 48) + 48))
      {
        ++v12;
LABEL_20:
        v32 = 1;
        goto LABEL_26;
      }
      objc_msgSend(v14, "asset");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = +[PGSettlingEffectWallpaperSuggesterFilteringContext shouldRunSettlingEffectForAsset:subtype:](PGSettlingEffectWallpaperSuggesterFilteringContext, "shouldRunSettlingEffectForAsset:subtype:", v22, 603);

      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 48), "setEnableSettlingEffect:", v23);
      v24 = *(void **)(*(_QWORD *)(a1 + 48) + 48);
      objc_msgSend(v14, "asset");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "gateAsset:hasPetFace:", v25, &v64);
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      -[PGSingleAssetSuggestion setAvailableFeatures:](v21, "setAvailableFeatures:", objc_msgSend(v26, "availableFeatures"));
      v27 = objc_msgSend(v26, "passesAnyGating");

      ++v12;
      if (!v64 || (v27 & 1) != 0)
      {
        if (v64)
          v31 = v27;
        else
          v31 = 0;
        if (v31 != 1)
        {
          if (!v64)
          {
LABEL_36:
            LODWORD(v59) = v59 + 1;
            v41 = CFSTR("no pet face");
            goto LABEL_37;
          }
LABEL_35:
          ++HIDWORD(v59);
          v41 = CFSTR("clock overlap");
          goto LABEL_37;
        }
        goto LABEL_20;
      }
      objc_msgSend(v14, "cropResult");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "cropForOrientation:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "orientation"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "ignoreClockOverlap") & 1) != 0)
        v30 = 1;
      else
        v30 = objc_msgSend(v29, "passesClockOverlap");
      objc_msgSend(v29, "cropZoomRatio", v57);
      v34 = v33;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "maximumCropZoomRatio");
      v36 = v35;
      objc_msgSend(v29, "cropScore");
      v38 = v37;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 64), "minimumCropScore");
      v40 = v39;

      if (!v30 || v34 > v36 || v38 < v40)
      {
        if (!v64)
          goto LABEL_36;
        if ((v30 & 1) != 0)
        {
          if (v34 > v36)
          {
            LODWORD(v58) = v58 + 1;
            v41 = CFSTR("low resolution");
          }
          else
          {
            ++HIDWORD(v58);
            v41 = CFSTR("low cropScore");
          }
LABEL_37:
          v42 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(_QWORD *)v70 = v41;
            _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Rejecting non-gated suggestion because of %@.", buf, 0xCu);
          }
          goto LABEL_27;
        }
        goto LABEL_35;
      }
      v32 = 0;
LABEL_26:
      -[PGWallpaperSuggestionAccumulator addSuggestion:passingGating:](v61, "addSuggestion:passingGating:", v21, v32, v57);
      ++v11;
      if (-[PGWallpaperSuggestionAccumulator accumulationIsComplete](v61, "accumulationIsComplete"))
      {

        v8 = obj;
        goto LABEL_45;
      }
LABEL_27:

      ++v13;
    }
    while (v10 != v13);
    v8 = obj;
    v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v75, 16);
    v10 = v43;
  }
  while (v43);
LABEL_45:
  v44 = v8;

  -[PGWallpaperSuggestionAccumulator suggestions](v61, "suggestions");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "addObjectsFromArray:", v45);
  v46 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 48);
  v47 = *(NSObject **)(a1 + 32);
  v48 = os_log_type_enabled(v47, OS_LOG_TYPE_INFO);
  if (v46)
  {
    if (v48)
    {
      v49 = v47;
      v50 = objc_msgSend(v45, "count");
      v51 = -[PGWallpaperSuggestionAccumulator numberOfGatedSuggestions](v61, "numberOfGatedSuggestions");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v70 = v50;
      *(_WORD *)&v70[4] = 1024;
      *(_DWORD *)&v70[6] = v51;
      *(_WORD *)&v70[10] = 2112;
      *(_QWORD *)&v70[12] = v63;
      v52 = "[PGPetWallpaperSuggester] Generated %d suggestions (%d gated) for pet %@";
      v53 = v49;
      v54 = 24;
      goto LABEL_50;
    }
  }
  else if (v48)
  {
    v49 = v47;
    v55 = objc_msgSend(v45, "count");
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v70 = v55;
    *(_WORD *)&v70[4] = 2112;
    *(_QWORD *)&v70[6] = v63;
    v52 = "[PGPetWallpaperSuggester] Generated %d suggestions for pet %@";
    v53 = v49;
    v54 = 18;
LABEL_50:
    _os_log_impl(&dword_1CA237000, v53, OS_LOG_TYPE_INFO, v52, buf, v54);

  }
  v56 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110400;
    *(_DWORD *)v70 = v12;
    *(_WORD *)&v70[4] = 1024;
    *(_DWORD *)&v70[6] = v11;
    *(_WORD *)&v70[10] = 1024;
    *(_DWORD *)&v70[12] = v59;
    *(_WORD *)&v70[16] = 1024;
    *(_DWORD *)&v70[18] = HIDWORD(v59);
    v71 = 1024;
    v72 = v58;
    v73 = 1024;
    v74 = HIDWORD(v58);
    _os_log_impl(&dword_1CA237000, v56, OS_LOG_TYPE_INFO, "[PGPetWallpaperSuggester] Tried %d assets, %d passed, rejected %d for no pet face, %d for clock overlap, %d for low resolution, %d for low crop score.", buf, 0x26u);
  }
LABEL_53:

}

+ (id)suggestionTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 6);
}

+ (id)suggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 653);
}

+ (BOOL)filtersForTopSuggestions
{
  return 0;
}

+ (id)prefilteringInternalPredicateWithContext:(id)a3
{
  objc_class *v3;
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;

  v3 = (objc_class *)MEMORY[0x1E0C99DE8];
  v4 = a3;
  v5 = objc_alloc_init(v3);
  v6 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v4, "minimumFaceSize");
  v8 = v7;
  objc_msgSend(v4, "maximumFaceSize");
  v10 = v9;

  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K >= %f AND %K < %f"), CFSTR("size"), v8, CFSTR("size"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v11);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K == %d"), CFSTR("assetForFace"), CFSTR("kind"), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v12);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K.%K IN %@)"), CFSTR("assetForFace"), CFSTR("playbackStyle"), &unk_1E84E94A8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v13);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K != %d"), CFSTR("assetForFace"), CFSTR("kindSubtype"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v14);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K.@count == %d"), CFSTR("assetForFace"), CFSTR("detectedFaces"), 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v15);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K == NO AND %K.%K == %d"), CFSTR("assetForFace"), CFSTR("hidden"), CFSTR("assetForFace"), CFSTR("trashedState"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v16);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K.%K >= %d"), CFSTR("assetForFace"), CFSTR("additionalAttributes"), CFSTR("sceneAnalysisVersion"), 77);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObject:", v17);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v5);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  return v18;
}

+ (BOOL)candidate:(id)a3 passesFilteringWithContext:(id)a4 curationContext:(id)a5 thresholdHelper:(id)a6 statistics:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  double v17;
  double v18;
  void *v19;
  void *v20;
  int v21;
  void *v22;
  void *v23;
  double v24;
  void *v25;
  float v26;
  double v27;
  BOOL v28;
  void *v29;
  int v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  int *p_var6;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  void *v43;
  void *v44;
  double v45;
  void *v46;
  float v47;
  double v48;
  void *v50;
  _BOOL4 v51;
  uint8_t v52[16];

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "asset");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "curationModel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "minimumWallpaperScore");
  v18 = v17;
  if (v17 < 0.0)
  {
    objc_msgSend(v16, "wallpaperScoreModel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "face");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "detectionType");

    switch(v21)
    {
      case 0:
      case 1:
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)v52 = 0;
          _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "This is supposed to be a pet!!!", v52, 2u);
        }
        goto LABEL_5;
      case 2:
        objc_msgSend(v19, "petNode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 3:
        objc_msgSend(v19, "dogNode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      case 4:
        objc_msgSend(v19, "catNode");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
        v23 = v22;
        objc_msgSend(v22, "highPrecisionOperatingPoint");
        v18 = v24;

        break;
      default:
LABEL_5:
        v18 = 1.79769313e308;
        break;
    }

  }
  objc_msgSend(v15, "mediaAnalysisProperties");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "wallpaperScore");
  v27 = v26;

  if (v18 > v27)
  {
    v28 = 0;
    ++a7->var3;
    goto LABEL_36;
  }
  objc_msgSend(v13, "userFeedbackCalculator");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v16, "isUtilityForMemoriesWithAsset:userFeedbackCalculator:", v15, v29);

  if (v30)
  {
    v28 = 0;
    ++a7->var0;
    goto LABEL_36;
  }
  if (objc_msgSend(v16, "avoidIfPossibleForKeyAssetWithAsset:statistics:", v15, &a7->var11))
  {
    v28 = 0;
    ++a7->var1;
    goto LABEL_36;
  }
  if ((objc_msgSend(v16, "isAestheticallyPrettyGoodWithAsset:", v15) & 1) == 0)
  {
    v28 = 0;
    ++a7->var2;
    goto LABEL_36;
  }
  if ((objc_msgSend(v12, "bypassCropScoreCheck") & 1) == 0)
  {
    objc_msgSend(v11, "cropResult");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "cropForOrientation:", objc_msgSend(v12, "orientation"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "ignoreClockOverlap") & 1) != 0 || objc_msgSend(v32, "passesClockOverlap"))
    {
      objc_msgSend(v32, "cropZoomRatio");
      v34 = v33;
      objc_msgSend(v12, "maximumCropZoomRatio");
      if (v34 <= v35)
      {
        objc_msgSend(v32, "cropScore");
        v38 = v37;
        objc_msgSend(v12, "minimumCropScore");
        if (v38 >= v39)
        {

          goto LABEL_19;
        }
        p_var6 = &a7->var6;
      }
      else
      {
        p_var6 = &a7->var5;
      }
    }
    else
    {
      p_var6 = &a7->var4;
    }
    ++*p_var6;

    v28 = 0;
    goto LABEL_36;
  }
LABEL_19:
  if ((objc_msgSend(MEMORY[0x1E0D77E50], "assetIsSafeForWidgetDisplay:", v15) & 1) != 0)
  {
    if (+[PGWallpaperSuggestionUtilities foundDominantPeopleSceneInAsset:withConfidenceThresholdHelper:](PGWallpaperSuggestionUtilities, "foundDominantPeopleSceneInAsset:withConfidenceThresholdHelper:", v15, v14))
    {
      v28 = 0;
      ++a7->var8;
    }
    else
    {
      objc_msgSend(v12, "maximumLowLightScore");
      v41 = v40;
      if (v40 < 0.0)
      {
        objc_msgSend(v15, "curationModel");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "aestheticsModel");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "lowLightNode");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "operatingPoint");
        v41 = v45;

      }
      objc_msgSend(v15, "aestheticProperties");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "lowLight");
      v48 = v47;

      if (v41 >= v48)
      {
        objc_msgSend(v11, "asset");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        v51 = +[PGSensitiveLocationBlocklistConfiguration isAssetAtSensitiveLocationAndDate:](PGSensitiveLocationBlocklistConfiguration, "isAssetAtSensitiveLocationAndDate:", v50);

        if (v51)
        {
          v28 = 0;
          ++a7->var10;
        }
        else
        {
          v28 = 1;
        }
      }
      else
      {
        v28 = 0;
        ++a7->var9;
      }
    }
  }
  else
  {
    v28 = 0;
    ++a7->var7;
  }
LABEL_36:

  return v28;
}

+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  BOOL v16;
  __CFString *v17;
  int v18;
  PGPetWallpaperSuggesterFilteringContext *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  PGPetWallpaperSuggestionCandidate *v28;
  uint64_t v29;
  PGPetWallpaperSuggestionCandidate *v30;
  PGPetWallpaperSuggestionCandidate *v31;
  _QWORD *v32;
  PGWallpaperSuggestionAssetGater *v33;
  PGWallpaperSuggestionAssetGater *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  int64_t v45;
  void *v46;
  void *v47;
  int v48;
  void *v49;
  id v50;
  id *v51;
  void *v52;
  void *v53;
  char v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _DWORD v62[7];
  _QWORD v63[4];

  v63[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  objc_msgSend(v10, "photoLibrary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setIncludedDetectionTypes:", &unk_1E84E94C0);
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAsset:options:", v10, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count") == 1)
  {
    objc_msgSend(v14, "firstObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unsigned __int16)(objc_msgSend(v15, "detectionType") - 5) <= 0xFFFCu)
    {
      v16 = 0;
      if (a6)
        *a6 = CFSTR("No Pet Found");
      goto LABEL_65;
    }
    v51 = a6;
    v53 = v15;
    v18 = objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions");
    v19 = [PGPetWallpaperSuggesterFilteringContext alloc];
    v48 = v18;
    v50 = v11;
    v45 = a5;
    if ((v18 & 1) != 0)
      v20 = -[PGPetWallpaperSuggesterFilteringContext initForTopPetsInOrientation:](v19, "initForTopPetsInOrientation:", a5);
    else
      v20 = -[PGPetWallpaperSuggesterFilteringContext initForPetsInOrientation:](v19, "initForPetsInOrientation:", a5);
    v21 = (void *)v20;
    objc_msgSend(a1, "prefilteringInternalPredicateWithContext:", v20);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setInternalPredicate:", v22);

    v23 = (void *)MEMORY[0x1E0CD1528];
    objc_msgSend(v15, "localIdentifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v63[0] = v24;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v63, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "fetchFacesWithLocalIdentifiers:options:", v25, v13);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "firstObject");
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v52 = v21;
    if (!v27)
    {
      v11 = v50;
      v16 = 0;
      if (v51)
        *v51 = CFSTR("Fails Predicate");
      v15 = v53;
      goto LABEL_64;
    }
    v28 = -[PGPetWallpaperSuggestionCandidate initWithFace:inAsset:]([PGPetWallpaperSuggestionCandidate alloc], "initWithFace:inAsset:", v27, v10);
    +[PGWallpaperSuggestionUtilities peopleSceneConfidenceThresholdHelper](PGWallpaperSuggestionUtilities, "peopleSceneConfidenceThresholdHelper");
    v29 = objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    memset(v62, 0, sizeof(v62));
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    v55 = 0u;
    v56 = 0u;
    v30 = v28;
    v31 = v28;
    v11 = v50;
    v46 = (void *)v29;
    v47 = v27;
    if ((objc_msgSend(a1, "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v31, v21, v50) & 1) != 0)
    {
      v16 = 1;
      v32 = v51;
      if (v48)
      {
        v33 = [PGWallpaperSuggestionAssetGater alloc];
        v34 = -[PGWallpaperSuggestionAssetGater initWithType:loggingConnection:](v33, "initWithType:loggingConnection:", 2, MEMORY[0x1E0C81028]);
        -[PGWallpaperSuggestionAssetGater setCoversTracks:](v34, "setCoversTracks:", 1);
        -[PGWallpaperSuggestionAssetGater setIsUserInitiated:](v34, "setIsUserInitiated:", 1);
        v54 = 1;
        -[PGPetWallpaperSuggestionCandidate asset](v30, "asset");
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGWallpaperSuggestionAssetGater gateAsset:hasPetFace:](v34, "gateAsset:hasPetFace:", v35, &v54);
        v36 = (void *)objc_claimAutoreleasedReturnValue();

        v49 = v36;
        if (v54)
        {
          if ((objc_msgSend(v36, "passesAnyGating") & 1) != 0)
          {
            v37 = CFSTR("Pass Segmented");
            v16 = 1;
          }
          else
          {
            -[PGPetWallpaperSuggestionCandidate cropResult](v30, "cropResult");
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v39, "cropForOrientation:", v45);
            v40 = (void *)objc_claimAutoreleasedReturnValue();

            if ((objc_msgSend(v52, "ignoreClockOverlap") & 1) != 0
              || objc_msgSend(v40, "passesClockOverlap"))
            {
              objc_msgSend(v40, "cropScore");
              v42 = v41;
              objc_msgSend(v52, "minimumCropScore");
              v16 = v42 >= v43;
              if (v42 < v43)
                v37 = CFSTR("Low Crop Score");
              else
                v37 = CFSTR("Pass Unsegmented");
            }
            else
            {
              v16 = 0;
              v37 = CFSTR("Clock Overlap");
            }

            v32 = v51;
          }
        }
        else
        {
          v16 = 0;
          v37 = CFSTR("No Pet Face");
        }

      }
      else
      {
        v37 = CFSTR("Pass");
      }
      v15 = v53;
      v38 = v46;
      if (!v32)
        goto LABEL_63;
    }
    else
    {
      v15 = v53;
      v32 = v51;
      if (!v51)
      {
        v16 = 0;
        v38 = v46;
LABEL_63:

        v27 = v47;
LABEL_64:

LABEL_65:
        goto LABEL_66;
      }
      if ((int)v55 <= 0)
      {
        if (SDWORD1(v55) <= 0)
        {
          if (SDWORD2(v55) <= 0)
          {
            if (SHIDWORD(v55) <= 0)
            {
              if ((int)v56 <= 0)
              {
                if (SDWORD1(v56) <= 0)
                {
                  if (SDWORD2(v56) <= 0)
                  {
                    if (SHIDWORD(v56) <= 0)
                    {
                      if ((int)v57 <= 0)
                      {
                        if (SDWORD1(v57) <= 0)
                        {
                          v16 = 0;
                          if (SDWORD2(v57) <= 0)
                            v37 = CFSTR("Unknown Reason");
                          else
                            v37 = CFSTR("Sensitive Location");
                        }
                        else
                        {
                          v16 = 0;
                          v37 = CFSTR("Low Light");
                        }
                      }
                      else
                      {
                        v16 = 0;
                        v37 = CFSTR("People Scene");
                      }
                    }
                    else
                    {
                      v16 = 0;
                      v37 = CFSTR("Not Safe for Display");
                    }
                    v15 = v53;
                    v32 = v51;
                  }
                  else
                  {
                    v16 = 0;
                    v37 = CFSTR("Low Crop Score");
                  }
                }
                else
                {
                  v16 = 0;
                  v37 = CFSTR("Low Resolution");
                }
              }
              else
              {
                v16 = 0;
                v37 = CFSTR("Clock Overlap");
              }
            }
            else
            {
              v16 = 0;
              v37 = CFSTR("Low Wallpaper Score");
            }
          }
          else
          {
            v16 = 0;
            v37 = CFSTR("Low Aesthetics");
          }
        }
        else
        {
          v16 = 0;
          v37 = CFSTR("Avoid for Key Asset");
        }
      }
      else
      {
        v16 = 0;
        v37 = CFSTR("Is Utility");
      }
      v38 = v46;
    }
    *v32 = v37;
    goto LABEL_63;
  }
  if (a6)
  {
    if ((unint64_t)objc_msgSend(v14, "count") <= 1)
      v17 = CFSTR("No Face");
    else
      v17 = CFSTR("Too Many Faces");
    v16 = 0;
    *a6 = objc_retainAutorelease(v17);
  }
  else
  {
    v16 = 0;
  }
LABEL_66:

  return v16;
}

@end
