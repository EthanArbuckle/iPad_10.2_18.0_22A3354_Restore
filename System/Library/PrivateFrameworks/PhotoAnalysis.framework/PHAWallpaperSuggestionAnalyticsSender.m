@implementation PHAWallpaperSuggestionAnalyticsSender

- (PHAWallpaperSuggestionAnalyticsSender)initWithGraphManager:(id)a3 libraryAnalysisSummary:(id)a4
{
  id v6;
  id v7;
  PHAWallpaperSuggestionAnalyticsSender *v8;
  uint64_t v9;
  PGManagerWorkingContext *workingContext;
  uint64_t v11;
  PHPhotoLibrary *photoLibrary;
  void *v13;
  uint64_t v14;
  OS_os_log *loggingConnection;
  uint64_t v16;
  CPAnalytics *analytics;
  uint64_t v18;
  PGWallpaperSuggestionInformer *informer;
  uint64_t v20;
  NSSet *topPeopleLocalIdentifiers;
  uint64_t v22;
  NSSet *shufflePeopleLocalIdentifiers;
  uint64_t v24;
  CLSCurationContext *curationContext;
  void *v26;
  objc_super v28;

  v6 = a3;
  v7 = a4;
  v28.receiver = self;
  v28.super_class = (Class)PHAWallpaperSuggestionAnalyticsSender;
  v8 = -[PHAWallpaperSuggestionAnalyticsSender init](&v28, sel_init);
  if (v8)
  {
    objc_msgSend(v6, "workingContext");
    v9 = objc_claimAutoreleasedReturnValue();
    workingContext = v8->_workingContext;
    v8->_workingContext = (PGManagerWorkingContext *)v9;

    objc_msgSend(v6, "photoLibrary");
    v11 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v8->_photoLibrary;
    v8->_photoLibrary = (PHPhotoLibrary *)v11;

    objc_msgSend(v6, "workingContext");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();
    loggingConnection = v8->_loggingConnection;
    v8->_loggingConnection = (OS_os_log *)v14;

    objc_msgSend(v6, "analytics");
    v16 = objc_claimAutoreleasedReturnValue();
    analytics = v8->_analytics;
    v8->_analytics = (CPAnalytics *)v16;

    objc_storeStrong((id *)&v8->_libraryAnalysisSummary, a4);
    if (objc_msgSend(v6, "isReady"))
    {
      v18 = objc_msgSend(objc_alloc(MEMORY[0x1E0D762B0]), "initWithWorkingContext:", v8->_workingContext);
      informer = v8->_informer;
      v8->_informer = (PGWallpaperSuggestionInformer *)v18;

      -[PGWallpaperSuggestionInformer personLocalIdentifiersForTopPeople:](v8->_informer, "personLocalIdentifiersForTopPeople:", 1);
      v20 = objc_claimAutoreleasedReturnValue();
      topPeopleLocalIdentifiers = v8->_topPeopleLocalIdentifiers;
      v8->_topPeopleLocalIdentifiers = (NSSet *)v20;

      -[PGWallpaperSuggestionInformer personLocalIdentifiersForTopPeople:](v8->_informer, "personLocalIdentifiersForTopPeople:", 0);
      v22 = objc_claimAutoreleasedReturnValue();
      shufflePeopleLocalIdentifiers = v8->_shufflePeopleLocalIdentifiers;
      v8->_shufflePeopleLocalIdentifiers = (NSSet *)v22;

    }
    v24 = objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v8->_photoLibrary);
    curationContext = v8->_curationContext;
    v8->_curationContext = (CLSCurationContext *)v24;

    objc_msgSend(MEMORY[0x1E0D75FF0], "fetchInterestingEligiblePetsForWallpaperWithWorkingContext:curationContext:", v8->_workingContext, v8->_curationContext);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v8->_eligiblePetsCount = objc_msgSend(v26, "count");

  }
  return v8;
}

- (void)sendWallpaperGenerationSummaryEventWithGeneratedSuggestionLocalIdentifiers:(id)a3
{
  NSObject *loggingConnection;
  id v5;
  os_signpost_id_t v6;
  OS_os_log *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  loggingConnection = self->_loggingConnection;
  v5 = a3;
  v6 = os_signpost_id_generate(loggingConnection);
  v7 = self->_loggingConnection;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "sendGenerationSummary", ", buf, 2u);
  }

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PHAWallpaperSuggestionAnalyticsSender wallpaperGenerationSummaryWithGeneratedSuggestionLocalIdentifiers:](self, "wallpaperGenerationSummaryWithGeneratedSuggestionLocalIdentifiers:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addEntriesFromDictionary:", v10);
  -[PHAWallpaperSuggestionAnalyticsSender existingWallpaperSuggestionSummary](self, "existingWallpaperSuggestionSummary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v11);

  -[PHAWallpaperSuggestionAnalyticsSender wallpaperPeoplePetSummary](self, "wallpaperPeoplePetSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v12);

  objc_msgSend((id)objc_opt_class(), "analyticsPayloadForLibraryAnalysisSummary:", self->_libraryAnalysisSummary);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v13);

  -[CPAnalytics sendEvent:withPayload:](self->_analytics, "sendEvent:withPayload:", CFSTR("com.apple.photos.wallpaper.generationSummary"), v9);
  v14 = self->_loggingConnection;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionAnalyticsSender] Sent Wallpaper Generation Summary Event", v18, 2u);
    v14 = self->_loggingConnection;
  }
  v15 = v14;
  v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v16, OS_SIGNPOST_INTERVAL_END, v6, "sendGenerationSummary", ", v17, 2u);
  }

}

- (void)sendRefreshSummaryEventWithPosterConfiguration:(id)a3
{
  NSObject *loggingConnection;
  id v5;
  os_signpost_id_t v6;
  OS_os_log *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  loggingConnection = self->_loggingConnection;
  v5 = a3;
  v6 = os_signpost_id_generate(loggingConnection);
  v7 = self->_loggingConnection;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "sendRefreshSummary", ", buf, 2u);
  }

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PHAWallpaperSuggestionAnalyticsSender existingWallpaperSuggestionSummary](self, "existingWallpaperSuggestionSummary");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v10);

  -[PHAWallpaperSuggestionAnalyticsSender wallpaperPeoplePetSummary](self, "wallpaperPeoplePetSummary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v11);

  objc_msgSend((id)objc_opt_class(), "analyticsPayloadForLibraryAnalysisSummary:", self->_libraryAnalysisSummary);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v12);

  objc_msgSend(v5, "analyticsPayload");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addEntriesFromDictionary:", v13);
  -[CPAnalytics sendEvent:withPayload:](self->_analytics, "sendEvent:withPayload:", CFSTR("com.apple.photos.wallpaper.refreshSummary"), v9);
  v14 = self->_loggingConnection;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionAnalyticsSender] Sent Refresh Summary Event", v18, 2u);
    v14 = self->_loggingConnection;
  }
  v15 = v14;
  v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v16, OS_SIGNPOST_INTERVAL_END, v6, "sendRefreshSummary", ", v17, 2u);
  }

}

- (void)sendAmbientGenerationSummaryEventWithGeneratedSuggestionLocalIdentifiers:(id)a3
{
  NSObject *loggingConnection;
  id v5;
  os_signpost_id_t v6;
  OS_os_log *v7;
  NSObject *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  uint8_t v17[16];
  uint8_t v18[16];
  uint8_t buf[16];

  loggingConnection = self->_loggingConnection;
  v5 = a3;
  v6 = os_signpost_id_generate(loggingConnection);
  v7 = self->_loggingConnection;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "sendAmbientGenerationSummary", ", buf, 2u);
  }

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  -[PHAWallpaperSuggestionAnalyticsSender ambientGenerationSummaryWithGeneratedSuggestionLocalIdentifiers:](self, "ambientGenerationSummaryWithGeneratedSuggestionLocalIdentifiers:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "addEntriesFromDictionary:", v10);
  -[PHAWallpaperSuggestionAnalyticsSender existingAmbientSuggestionSummary](self, "existingAmbientSuggestionSummary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v11);

  -[PHAWallpaperSuggestionAnalyticsSender ambientPeoplePetSummary](self, "ambientPeoplePetSummary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v12);

  objc_msgSend((id)objc_opt_class(), "analyticsPayloadForLibraryAnalysisSummary:", self->_libraryAnalysisSummary);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addEntriesFromDictionary:", v13);

  -[CPAnalytics sendEvent:withPayload:](self->_analytics, "sendEvent:withPayload:", CFSTR("com.apple.photos.ambient.generationSummary"), v9);
  v14 = self->_loggingConnection;
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v18 = 0;
    _os_log_impl(&dword_1CAC16000, v14, OS_LOG_TYPE_INFO, "[PHAWallpaperSuggestionAnalyticsSender] Sent Ambient Generation Summary Event", v18, 2u);
    v14 = self->_loggingConnection;
  }
  v15 = v14;
  v16 = v15;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
  {
    *(_WORD *)v17 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v16, OS_SIGNPOST_INTERVAL_END, v6, "sendAmbientGenerationSummary", ", v17, 2u);
  }

}

- (id)suggestionFetchOptionsWithLocalIdentifiers:(id)a3
{
  PHPhotoLibrary *photoLibrary;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v12[3];

  v12[2] = *MEMORY[0x1E0C80C00];
  photoLibrary = self->_photoLibrary;
  v4 = a3;
  -[PHPhotoLibrary librarySpecificFetchOptions](photoLibrary, "librarySpecificFetchOptions");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("localIdentifier"), v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v12[1] = v8;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v12, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v10);

  return v5;
}

- (id)wallpaperGenerationSummaryWithGeneratedSuggestionLocalIdentifiers:(id)a3
{
  NSObject *loggingConnection;
  id v5;
  os_signpost_id_t v6;
  OS_os_log *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  OS_os_log *v22;
  NSObject *v23;
  os_signpost_id_t spid;
  id v26;
  void *v27;
  void *v28;
  unint64_t v29;
  uint8_t v30[16];
  uint8_t buf[16];
  __int128 v32;
  unsigned int v33;
  _QWORD v34[9];
  _QWORD v35[11];

  v35[9] = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  v5 = a3;
  v6 = os_signpost_id_generate(loggingConnection);
  v7 = self->_loggingConnection;
  v8 = v7;
  v29 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "fetchGeneratedSuggesstionSummary", ", buf, 2u);
  }

  -[PHAWallpaperSuggestionAnalyticsSender suggestionFetchOptionsWithLocalIdentifiers:](self, "suggestionFetchOptionsWithLocalIdentifiers:", v5);
  v9 = objc_claimAutoreleasedReturnValue();

  v28 = (void *)v9;
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v9);
  v10 = objc_claimAutoreleasedReturnValue();
  v33 = 0;
  *(_OWORD *)buf = 0u;
  v32 = 0u;
  v11 = (void *)objc_opt_class();
  spid = v6;
  v27 = (void *)v10;
  if (v11)
  {
    objc_msgSend(v11, "wallpaperSuggestionStatisticsFromSuggestions:", v10);
    v12 = *(unsigned int *)buf;
  }
  else
  {
    v12 = 0;
    v33 = 0;
    *(_OWORD *)buf = 0u;
    v32 = 0u;
  }
  v34[0] = CFSTR("top_people_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = v13;
  v34[1] = CFSTR("people_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&buf[4]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35[1] = v14;
  v34[2] = CFSTR("top_pet_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&buf[8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35[2] = v15;
  v34[3] = CFSTR("pet_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&buf[12]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v35[3] = v16;
  v34[4] = CFSTR("top_nature_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v32);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v35[4] = v17;
  v34[5] = CFSTR("nature_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", DWORD1(v32));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v35[5] = v18;
  v34[6] = CFSTR("top_urban_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", DWORD2(v32));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v35[6] = v19;
  v34[7] = CFSTR("urban_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v32));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v35[7] = v20;
  v34[8] = CFSTR("me_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v33);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v35[8] = v21;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v35, v34, 9);
  v26 = (id)objc_claimAutoreleasedReturnValue();

  v22 = self->_loggingConnection;
  v23 = v22;
  if (v29 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v22))
  {
    *(_WORD *)v30 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v23, OS_SIGNPOST_INTERVAL_END, spid, "fetchGeneratedSuggesstionSummary", ", v30, 2u);
  }

  return v26;
}

- (id)existingWallpaperSuggestionSummary
{
  os_signpost_id_t v3;
  OS_os_log *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  _BOOL8 v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  NSObject *v32;
  os_signpost_id_t spid;
  _BOOL4 v35;
  _BOOL4 v36;
  id v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  unint64_t v43;
  PHAWallpaperSuggestionAnalyticsSender *v44;
  uint8_t v45[16];
  uint8_t buf[16];
  __int128 v47;
  unsigned int v48;
  _QWORD v49[13];
  _QWORD v50[13];
  _QWORD v51[4];

  v51[2] = *MEMORY[0x1E0C80C00];
  v3 = os_signpost_id_generate((os_log_t)self->_loggingConnection);
  v4 = self->_loggingConnection;
  v5 = v4;
  v43 = v3 - 1;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "fetchExistingSuggesstionSummary", ", buf, 2u);
  }
  spid = v3;

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v8;
  objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllFeaturedStateEnabledSuggestionTypesForWallpaper");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v51[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v51, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v11);

  v42 = v6;
  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v6);
  v12 = objc_claimAutoreleasedReturnValue();
  v48 = 0;
  *(_OWORD *)buf = 0u;
  v47 = 0u;
  v13 = (void *)objc_opt_class();
  v44 = self;
  v41 = (void *)v12;
  if (v13)
  {
    objc_msgSend(v13, "wallpaperSuggestionStatisticsFromSuggestions:", v12);
    v14 = *(int *)&buf[12];
    v15 = SDWORD1(v47);
    v16 = SHIDWORD(v47);
    v17 = *(unsigned int *)buf;
    v18 = *(int *)&buf[4];
  }
  else
  {
    v17 = 0;
    v16 = 0;
    v15 = 0;
    v14 = 0;
    v18 = 0;
    v48 = 0;
    *(_OWORD *)buf = 0u;
    v47 = 0u;
  }
  v19 = *MEMORY[0x1E0D78190] <= v18;
  v20 = *MEMORY[0x1E0D78190] <= v14;
  v35 = *MEMORY[0x1E0D78190] <= v15;
  v36 = *MEMORY[0x1E0D78190] <= v16;
  v49[0] = CFSTR("top_people_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v17);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v50[0] = v40;
  v49[1] = CFSTR("people_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&buf[4]);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v50[1] = v39;
  v49[2] = CFSTR("top_pet_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&buf[8]);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v50[2] = v38;
  v49[3] = CFSTR("pet_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)&buf[12]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v50[3] = v21;
  v49[4] = CFSTR("top_nature_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v47);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v50[4] = v22;
  v49[5] = CFSTR("nature_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", DWORD1(v47));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v50[5] = v23;
  v49[6] = CFSTR("top_urban_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", DWORD2(v47));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v50[6] = v24;
  v49[7] = CFSTR("urban_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v47));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v50[7] = v25;
  v49[8] = CFSTR("me_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v48);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v50[8] = v26;
  v49[9] = CFSTR("found_min_shuffle_people_suggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v19);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v50[9] = v27;
  v49[10] = CFSTR("found_min_shuffle_pet_suggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v50[10] = v28;
  v49[11] = CFSTR("found_min_shuffle_nature_suggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v35);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v50[11] = v29;
  v49[12] = CFSTR("found_min_shuffle_city_suggestion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v36);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v50[12] = v30;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v50, v49, 13);
  v37 = (id)objc_claimAutoreleasedReturnValue();

  v31 = v44->_loggingConnection;
  v32 = v31;
  if (v43 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)v45 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v32, OS_SIGNPOST_INTERVAL_END, spid, "fetchExistingSuggesstionSummary", ", v45, 2u);
  }

  return v37;
}

- (id)wallpaperPeoplePetSummary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  _QWORD v10[5];

  v10[4] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("eligible_pets_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_eligiblePetsCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10[0] = v3;
  v9[1] = CFSTR("gallery_eligible_people_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSSet count](self->_topPeopleLocalIdentifiers, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10[1] = v4;
  v9[2] = CFSTR("shuffle_eligible_people_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSSet count](self->_shufflePeopleLocalIdentifiers, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10[2] = v5;
  v9[3] = CFSTR("shuffle_picker_people_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", -[PHAWallpaperSuggestionAnalyticsSender shufflePickerVisiblePeopleCount](self, "shufflePickerVisiblePeopleCount"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v10[3] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, v9, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (int64_t)shufflePickerVisiblePeopleCount
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  int64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CD17F8]), "initWithPhotoLibrary:", self->_photoLibrary);
  objc_msgSend(v3, "personUUIDsWithNegativeFeedback");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = v4;
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
        objc_msgSend(MEMORY[0x1E0CD16C0], "localIdentifierWithUUID:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v10), (_QWORD)v16);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v8);
  }

  objc_msgSend(MEMORY[0x1E0D77EF8], "fetchPersonLocalIdentifiersForSuggestionSubtype:photoLibrary:", 652, self->_photoLibrary);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", v12);
  objc_msgSend(v13, "minusSet:", v5);
  v14 = objc_msgSend(v13, "count");

  return v14;
}

- (id)ambientGenerationSummaryWithGeneratedSuggestionLocalIdentifiers:(id)a3
{
  NSObject *loggingConnection;
  id v5;
  os_signpost_id_t v6;
  OS_os_log *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  OS_os_log *v20;
  NSObject *v21;
  uint8_t v23[8];
  _QWORD v24[4];
  _QWORD v25[5];

  v25[4] = *MEMORY[0x1E0C80C00];
  loggingConnection = self->_loggingConnection;
  v5 = a3;
  v6 = os_signpost_id_generate(loggingConnection);
  v7 = self->_loggingConnection;
  v8 = v7;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v7))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "fetchAmbientGenerationSummary", ", v23, 2u);
  }

  -[PHAWallpaperSuggestionAnalyticsSender suggestionFetchOptionsWithLocalIdentifiers:](self, "suggestionFetchOptionsWithLocalIdentifiers:", v5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend((id)objc_opt_class(), "ambientSuggestionStatisticsFromSuggestions:", v10);
  v13 = v12;
  v14 = HIDWORD(v11);
  v24[0] = CFSTR("nature_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v11);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v25[0] = v15;
  v24[1] = CFSTR("city_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v25[1] = v16;
  v24[2] = CFSTR("people_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v13));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25[2] = v17;
  v24[3] = CFSTR("pet_suggestions_generated");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v25[3] = v18;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v25, v24, 4);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = self->_loggingConnection;
  v21 = v20;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v20))
  {
    *(_WORD *)v23 = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v21, OS_SIGNPOST_INTERVAL_END, v6, "fetchAmbientGenerationSummary", ", v23, 2u);
  }

  return v19;
}

- (id)existingAmbientSuggestionSummary
{
  os_signpost_id_t v3;
  OS_os_log *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  OS_os_log *v22;
  NSObject *v23;
  uint8_t buf[8];
  _QWORD v26[4];
  _QWORD v27[4];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  v3 = os_signpost_id_generate((os_log_t)self->_loggingConnection);
  v4 = self->_loggingConnection;
  v5 = v4;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v4))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v5, OS_SIGNPOST_INTERVAL_BEGIN, v3, "fetchExistingAmbientSuggesstionSummary", ", buf, 2u);
  }

  -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("state"), 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v8;
  objc_msgSend(MEMORY[0x1E0CD17D0], "predicateForAllAmbientSuggestions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setPredicate:", v11);

  objc_msgSend(MEMORY[0x1E0CD17D0], "fetchSuggestionsWithOptions:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend((id)objc_opt_class(), "ambientSuggestionStatisticsFromSuggestions:", v12);
  v15 = v14;
  v16 = HIDWORD(v13);
  v26[0] = CFSTR("nature_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v13);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v17;
  v26[1] = CFSTR("city_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v18;
  v26[2] = CFSTR("people_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", HIDWORD(v15));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v19;
  v26[3] = CFSTR("pet_suggestion_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", v15);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v20;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = self->_loggingConnection;
  v23 = v22;
  if (v3 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled((os_log_t)v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CAC16000, v23, OS_SIGNPOST_INTERVAL_END, v3, "fetchExistingAmbientSuggesstionSummary", ", buf, 2u);
  }

  return v21;
}

- (id)ambientPeoplePetSummary
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];
  _QWORD v8[3];

  v8[2] = *MEMORY[0x1E0C80C00];
  v7[0] = CFSTR("eligible_pets_count");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", self->_eligiblePetsCount);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = CFSTR("eligible_people_count");
  v8[0] = v3;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSSet count](self->_shufflePeopleLocalIdentifiers, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v8, v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_shufflePeopleLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_topPeopleLocalIdentifiers, 0);
  objc_storeStrong((id *)&self->_informer, 0);
  objc_storeStrong((id *)&self->_libraryAnalysisSummary, 0);
  objc_storeStrong((id *)&self->_analytics, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

+ ($1A9BA35ACF7822FDDDE3BD6714E1EA81)wallpaperSuggestionStatisticsFromSuggestions:(SEL)a3
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  int v8;
  int v9;
  int v10;
  int v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  $1A9BA35ACF7822FDDDE3BD6714E1EA81 *result;
  int v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a4;
  *(_OWORD *)&retstr->var0 = 0u;
  *(_OWORD *)&retstr->var4 = 0u;
  retstr->var8 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0;
    v10 = 0;
    v17 = 0;
    v18 = 0;
    v16 = 0;
    v11 = 0;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v5);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        if (objc_msgSend(v14, "subtype") == 602)
        {
          retstr->var0 = ++v11;
        }
        else if (objc_msgSend(v14, "subtype") == 652)
        {
          retstr->var1 = ++v8;
        }
        else if (objc_msgSend(v14, "subtype") == 603)
        {
          retstr->var2 = ++v9;
        }
        else if (objc_msgSend(v14, "subtype") == 653)
        {
          retstr->var3 = ++v10;
        }
        else if (objc_msgSend(v14, "subtype") == 604)
        {
          retstr->var4 = ++HIDWORD(v18);
        }
        else if (objc_msgSend(v14, "subtype") == 654)
        {
          LODWORD(v18) = v18 + 1;
          retstr->var5 = v18;
        }
        else if (objc_msgSend(v14, "subtype") == 605)
        {
          retstr->var6 = ++HIDWORD(v17);
        }
        else if (objc_msgSend(v14, "subtype") == 655)
        {
          LODWORD(v17) = v17 + 1;
          retstr->var7 = v17;
        }
        else if (objc_msgSend(v14, "subtype") == 901)
        {
          retstr->var8 = ++v16;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v7);
  }

  return result;
}

+ (id)analyticsPayloadForLibraryAnalysisSummary:(id)a3
{
  id v3;
  double v4;
  uint64_t v5;
  double v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "ratioOfAssetsAtOrAboveSceneAnalysisVersion");
  v5 = (uint64_t)(v4 * 100.0);
  objc_msgSend(v3, "ratioOfAssetsAtOrAboveFaceAnalysisVersion");
  v7 = (uint64_t)(v6 * 100.0);
  v15[0] = CFSTR("percentage_of_assets_at_or_above_scene_analysis_version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v8;
  v15[1] = CFSTR("percentage_of_assets_at_or_above_face_analysis_version");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v9;
  v15[2] = CFSTR("library_is_processed_enough");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  v11 = objc_msgSend(v3, "libraryIsProcessedEnough");

  objc_msgSend(v10, "numberWithBool:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v12;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ ($A3B2E143E1A03423F9FC703C010436DC)ambientSuggestionStatisticsFromSuggestions:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;
  $A3B2E143E1A03423F9FC703C010436DC result;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = 0;
    v8 = 0;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v11, "subtype") == 801)
        {
          ++v8;
        }
        else if (objc_msgSend(v11, "subtype") == 802)
        {
          v7 = (v7 + 1);
        }
        else if (objc_msgSend(v11, "subtype") == 803)
        {
          v6 = (v6 + 1) | v6 & 0xFFFFFFFF00000000;
        }
        else if (objc_msgSend(v11, "subtype") == 804)
        {
          v6 += 0x100000000;
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
    v7 = 0;
    v8 = 0;
  }

  v12 = v8 | (unint64_t)(v7 << 32);
  v13 = v6;
  result.var2 = v13;
  result.var3 = HIDWORD(v13);
  result.var0 = v12;
  result.var1 = HIDWORD(v12);
  return result;
}

@end
