@implementation PGPeopleWallpaperSuggester

- (PGPeopleWallpaperSuggester)initWithSession:(id)a3
{
  id v4;
  PGPeopleWallpaperSuggester *v5;
  PGWallpaperSuggestionAssetGater *v6;
  void *v7;
  uint64_t v8;
  PGWallpaperSuggestionAssetGater *assetGater;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGPeopleWallpaperSuggester;
  v5 = -[PGAbstractSuggester initWithSession:](&v11, sel_initWithSession_, v4);
  if (v5)
  {
    if (objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions"))
    {
      v6 = [PGWallpaperSuggestionAssetGater alloc];
      objc_msgSend(v4, "loggingConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PGWallpaperSuggestionAssetGater initWithType:loggingConnection:](v6, "initWithType:loggingConnection:", 1, v7);
      assetGater = v5->_assetGater;
      v5->_assetGater = (PGWallpaperSuggestionAssetGater *)v8;

      -[PGWallpaperSuggestionAssetGater setEnableSettlingEffect:](v5->_assetGater, "setEnableSettlingEffect:", objc_msgSend((id)objc_opt_class(), "enableSettlingEffect"));
    }
    -[PGPeopleWallpaperSuggester setupFilteringContexts](v5, "setupFilteringContexts");
  }

  return v5;
}

- (void)setupFilteringContexts
{
  PGPeopleWallpaperSuggester *v2;
  objc_class *v3;
  int IsIPad;
  PGPeopleWallpaperSuggesterFilteringContext *v5;
  uint64_t v6;
  PGPeopleWallpaperSuggesterFilteringContext *primaryFilteringContext;
  PGPeopleWallpaperSuggesterFilteringContext *v8;
  PGPeopleWallpaperSuggesterFilteringContext *secondaryFilteringContext;
  uint64_t v10;
  PGPeopleWallpaperSuggesterFilteringContext *v11;
  objc_class *v12;
  objc_class *v13;
  PGPeopleWallpaperSuggester *v14;
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
    v14 = (PGPeopleWallpaperSuggester *)_PFAssertFailHandler();
    -[PGPeopleWallpaperSuggester suggestionsWithOptions:progress:](v14, v15, v16, v17);
    return;
  }
  if ((-[PGPeopleWallpaperSuggester isMemberOfClass:](v2, "isMemberOfClass:", v3) & 1) == 0)
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
  v5 = [PGPeopleWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    v6 = -[PGPeopleWallpaperSuggesterFilteringContext initForPeopleInOrientation:](v5, "initForPeopleInOrientation:", 2);
    primaryFilteringContext = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGPeopleWallpaperSuggesterFilteringContext *)v6;

    v8 = -[PGPeopleWallpaperSuggesterFilteringContext initForPeopleInOrientation:]([PGPeopleWallpaperSuggesterFilteringContext alloc], "initForPeopleInOrientation:", 1);
    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = v8;
  }
  else
  {
    v10 = -[PGPeopleWallpaperSuggesterFilteringContext initForPeopleInOrientation:](v5, "initForPeopleInOrientation:", 1);
    v11 = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGPeopleWallpaperSuggesterFilteringContext *)v10;

    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = 0;
  }

}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  double v8;
  char v9;
  id v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  PGSinglePersonWallpaperAssetSuggesterScoringContext *v16;
  void *v17;
  PGSinglePersonWallpaperAssetSuggesterScoringContext *v18;
  PGSinglePersonWallpaperAssetSuggesterScoringContext *scoringContext;
  PGSinglePersonWallpaperAssetSuggesterDistancingContext *v20;
  void *v21;
  PGSinglePersonWallpaperAssetSuggesterDistancingContext *v22;
  PGSinglePersonWallpaperAssetSuggesterDistancingContext *distancingContext;
  NSObject *v24;
  NSObject *v25;
  os_signpost_id_t v26;
  NSObject *v27;
  NSObject *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  __int16 v32;
  void *v33;
  __int16 v34;
  NSUInteger v35;
  unint64_t v36;
  double v37;
  NSDictionary *suggesterByPersonLocalIdentifier;
  NSObject *v39;
  id v40;
  id v41;
  NSObject *v42;
  uint64_t v43;
  uint32_t denom;
  uint32_t numer;
  NSObject *v46;
  NSObject *v47;
  uint64_t v48;
  uint32_t v49;
  uint32_t v50;
  NSObject *v51;
  NSObject *v52;
  double Current;
  char v54;
  uint64_t v56;
  os_signpost_id_t v57;
  unint64_t v58;
  uint64_t v59;
  unint64_t v60;
  os_signpost_id_t spid;
  void *v62;
  void *v63;
  id v64;
  uint64_t v65;
  void *v66;
  void *v67;
  NSObject *oslog;
  void *v69;
  char v70;
  _QWORD v71[4];
  NSObject *v72;
  PGPeopleWallpaperSuggester *v73;
  id v74;
  id v75;
  uint64_t *p_buf;
  uint64_t *v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  double v82;
  uint64_t v83;
  __int16 v84;
  __int16 v85;
  mach_timebase_info v86;
  _QWORD v87[4];
  NSObject *v88;
  uint64_t *v89;
  uint64_t *v90;
  uint64_t v91;
  mach_timebase_info info;
  uint64_t v93;
  double *v94;
  uint64_t v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t *v98;
  uint64_t v99;
  char v100;
  int v101;
  _QWORD v102[3];
  uint64_t buf;
  __int128 v104;
  uint64_t v105;
  uint64_t v106;

  v106 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v97 = 0;
  v98 = &v97;
  v99 = 0x2020000000;
  v100 = 0;
  v93 = 0;
  v94 = (double *)&v93;
  v95 = 0x2020000000;
  v96 = 0;
  v69 = _Block_copy(v7);
  v63 = v7;
  if (!v69
    || (v8 = CFAbsoluteTimeGetCurrent(), v8 - v94[3] < 0.01)
    || (v94[3] = v8,
        LOBYTE(v101) = 0,
        (*((void (**)(void *, int *, double))v69 + 2))(v69, &v101, 0.0),
        v9 = *((_BYTE *)v98 + 24) | v101,
        (*((_BYTE *)v98 + 24) = v9) == 0))
  {
    -[PGAbstractSuggester session](self, "session");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v62 = v11;
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v12);
    v14 = v12;
    v15 = v14;
    v60 = v13 - 1;
    spid = v13;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGPeopleWallpaperSuggester", ", (uint8_t *)&buf, 2u);
    }
    oslog = v15;

    info = 0;
    mach_timebase_info(&info);
    v59 = mach_absolute_time();
    v65 = objc_msgSend(v6, "maximumNumberOfSuggestions");
    objc_msgSend(v6, "additionalOptions");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("filteringContext"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGPeopleWallpaperSuggesterFilteringContext updateFilteringContextWithDictionary:](self->_primaryFilteringContext, "updateFilteringContextWithDictionary:", v67);
    -[PGPeopleWallpaperSuggesterFilteringContext updateFilteringContextWithDictionary:](self->_secondaryFilteringContext, "updateFilteringContextWithDictionary:", v67);
    v16 = [PGSinglePersonWallpaperAssetSuggesterScoringContext alloc];
    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("scoringContext"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PGSinglePersonWallpaperAssetSuggesterScoringContext initWithDictionary:](v16, "initWithDictionary:", v17);
    scoringContext = self->_scoringContext;
    self->_scoringContext = v18;

    v20 = [PGSinglePersonWallpaperAssetSuggesterDistancingContext alloc];
    objc_msgSend(v66, "objectForKeyedSubscript:", CFSTR("distancingContext"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = -[PGSinglePersonWallpaperAssetSuggesterDistancingContext initWithDictionary:](v20, "initWithDictionary:", v21);
    distancingContext = self->_distancingContext;
    self->_distancingContext = v22;

    v24 = oslog;
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 67109120;
      HIDWORD(buf) = v65;
      _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Starting to generate %d suggestions per person.", (uint8_t *)&buf, 8u);
    }
    v64 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (!self->_suggesterByPersonLocalIdentifier)
    {
      v87[0] = MEMORY[0x1E0C809B0];
      v87[1] = 3221225472;
      v87[2] = __62__PGPeopleWallpaperSuggester_suggestionsWithOptions_progress___block_invoke;
      v87[3] = &unk_1E8434F30;
      v88 = v69;
      v89 = &v93;
      v90 = &v97;
      v91 = 0x3F847AE147AE147BLL;
      -[PGPeopleWallpaperSuggester _buildSuggestersWithProgress:](self, "_buildSuggestersWithProgress:", v87);
      if (*((_BYTE *)v98 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          buf = 0x8104000202;
          LOWORD(v104) = 2080;
          *(_QWORD *)((char *)&v104 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/P"
                                           "hotosGraph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }
        v10 = (id)MEMORY[0x1E0C9AA60];
        v39 = v88;
        goto LABEL_51;
      }

      v24 = oslog;
    }
    v25 = v24;
    v26 = os_signpost_id_generate(v25);
    v27 = v25;
    v28 = v27;
    v57 = v26;
    v58 = v26 - 1;
    if (v26 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v28, OS_SIGNPOST_INTERVAL_BEGIN, v26, "PGPeopleWallpaperSuggesterSuggestionAccumulation", ", (uint8_t *)&buf, 2u);
    }

    v86 = 0;
    mach_timebase_info(&v86);
    v56 = mach_absolute_time();
    if (self->_assetGater)
      v29 = 5;
    else
      v29 = 0;
    if (self->_assetGater)
      v30 = 2 * v65;
    else
      v30 = 0;
    objc_msgSend((id)objc_opt_class(), "suggestionTypes");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "firstIndex");

    objc_msgSend((id)objc_opt_class(), "suggestionSubtypes");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "firstIndex");

    v35 = -[NSDictionary count](self->_suggesterByPersonLocalIdentifier, "count");
    if (v35 <= 1)
      v36 = 1;
    else
      v36 = v35;
    v37 = 0.25 / (double)v36;
    buf = 0;
    *(_QWORD *)&v104 = &buf;
    *((_QWORD *)&v104 + 1) = 0x2020000000;
    v105 = 0;
    suggesterByPersonLocalIdentifier = self->_suggesterByPersonLocalIdentifier;
    v71[0] = MEMORY[0x1E0C809B0];
    v71[1] = 3221225472;
    v71[2] = __62__PGPeopleWallpaperSuggester_suggestionsWithOptions_progress___block_invoke_169;
    v71[3] = &unk_1E8431AA8;
    v39 = v28;
    v80 = v29;
    v81 = v30;
    v79 = v65;
    p_buf = &buf;
    v82 = v37;
    v84 = v32;
    v85 = v34;
    v72 = v39;
    v73 = self;
    v40 = v69;
    v75 = v40;
    v77 = &v93;
    v83 = 0x3F847AE147AE147BLL;
    v78 = &v97;
    v41 = v64;
    v74 = v41;
    -[NSDictionary enumerateKeysAndObjectsUsingBlock:](suggesterByPersonLocalIdentifier, "enumerateKeysAndObjectsUsingBlock:", v71);
    if (*((_BYTE *)v98 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v101 = 67109378;
        LODWORD(v102[0]) = 220;
        WORD2(v102[0]) = 2080;
        *(_QWORD *)((char *)v102 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
        v42 = MEMORY[0x1E0C81028];
LABEL_28:
        _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v101, 0x12u);
      }
    }
    else
    {
      v43 = mach_absolute_time();
      numer = v86.numer;
      denom = v86.denom;
      v46 = v39;
      v47 = v46;
      if (v58 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v46))
      {
        LOWORD(v101) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v47, OS_SIGNPOST_INTERVAL_END, v57, "PGPeopleWallpaperSuggesterSuggestionAccumulation", ", (uint8_t *)&v101, 2u);
      }

      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        v101 = 136315394;
        v102[0] = "PGPeopleWallpaperSuggesterSuggestionAccumulation";
        LOWORD(v102[1]) = 2048;
        *(double *)((char *)&v102[1] + 2) = (float)((float)((float)((float)(v43 - v56) * (float)numer) / (float)denom)
                                                  / 1000000.0);
        _os_log_impl(&dword_1CA237000, v47, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v101, 0x16u);
      }
      v48 = mach_absolute_time();
      v50 = info.numer;
      v49 = info.denom;
      v51 = v47;
      v52 = v51;
      if (v60 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v51))
      {
        LOWORD(v101) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v52, OS_SIGNPOST_INTERVAL_END, spid, "PGPeopleWallpaperSuggester", ", (uint8_t *)&v101, 2u);
      }

      if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
      {
        v101 = 136315394;
        v102[0] = "PGPeopleWallpaperSuggester";
        LOWORD(v102[1]) = 2048;
        *(double *)((char *)&v102[1] + 2) = (float)((float)((float)((float)(v48 - v59) * (float)v50) / (float)v49)
                                                  / 1000000.0);
        _os_log_impl(&dword_1CA237000, v52, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v101, 0x16u);
      }
      if (!v69
        || (Current = CFAbsoluteTimeGetCurrent(), Current - v94[3] < 0.01)
        || (v94[3] = Current,
            v70 = 0,
            (*((void (**)(id, char *, double))v40 + 2))(v40, &v70, 1.0),
            v54 = *((_BYTE *)v98 + 24) | v70,
            (*((_BYTE *)v98 + 24) = v54) == 0))
      {
        v10 = v41;
        goto LABEL_50;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v101 = 67109378;
        LODWORD(v102[0]) = 226;
        WORD2(v102[0]) = 2080;
        *(_QWORD *)((char *)v102 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
        v42 = MEMORY[0x1E0C81028];
        goto LABEL_28;
      }
    }
    v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_50:

    _Block_object_dispose(&buf, 8);
LABEL_51:

    goto LABEL_52;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x6904000202;
    LOWORD(v104) = 2080;
    *(_QWORD *)((char *)&v104 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  v10 = (id)MEMORY[0x1E0C9AA60];
LABEL_52:
  _Block_object_dispose(&v93, 8);
  _Block_object_dispose(&v97, 8);

  return v10;
}

- (void)_buildSuggestersWithProgress:(id)a3
{
  void *v4;
  double v5;
  char v6;
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint32_t denom;
  uint32_t numer;
  NSObject *v18;
  NSObject *v19;
  double Current;
  char v21;
  NSObject *v22;
  os_signpost_id_t v23;
  NSObject *v24;
  NSObject *v25;
  unint64_t v26;
  void *v27;
  void *v28;
  double v29;
  NSObject *v30;
  id v31;
  id v32;
  id v33;
  NSObject *v34;
  uint64_t v35;
  uint32_t v36;
  uint32_t v37;
  NSObject *v38;
  NSObject *v39;
  double v40;
  char v41;
  os_signpost_id_t spid;
  uint64_t v43;
  unint64_t v44;
  id v45;
  id obj;
  void *v47;
  void *v48;
  id v49;
  void *v50;
  char v51;
  _QWORD v52[4];
  id v53;
  NSObject *v54;
  PGPeopleWallpaperSuggester *v55;
  id v56;
  id v57;
  id v58;
  id v59;
  uint64_t *v60;
  _QWORD *v61;
  uint64_t *v62;
  uint64_t v63;
  double v64;
  mach_timebase_info v65;
  _QWORD v66[4];
  id v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t v70;
  mach_timebase_info info;
  uint64_t v72;
  double *v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  char v79;
  int v80;
  _QWORD v81[3];
  _QWORD buf[8];

  buf[5] = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v4 = _Block_copy(v49);
  v76 = 0;
  v77 = &v76;
  v78 = 0x2020000000;
  v79 = 0;
  v72 = 0;
  v73 = (double *)&v72;
  v74 = 0x2020000000;
  v75 = 0;
  if (!v4
    || (v5 = CFAbsoluteTimeGetCurrent(), v5 - v73[3] < 0.01)
    || (v73[3] = v5,
        LOBYTE(v80) = 0,
        (*((void (**)(void *, int *, double))v4 + 2))(v4, &v80, 0.0),
        v6 = *((_BYTE *)v77 + 24) | v80,
        (*((_BYTE *)v77 + 24) = v6) == 0))
  {
    -[PGAbstractSuggester session](self, "session");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "curationContext");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v7;
    objc_msgSend(v7, "loggingConnection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_generate(v8);
    v10 = v8;
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGPeopleWallpaperSuggesterAnalyzer", ", (uint8_t *)buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v12 = mach_absolute_time();
    v66[0] = MEMORY[0x1E0C809B0];
    v66[1] = 3221225472;
    v66[2] = __59__PGPeopleWallpaperSuggester__buildSuggestersWithProgress___block_invoke;
    v66[3] = &unk_1E8434F30;
    v13 = v4;
    v67 = v13;
    v68 = &v72;
    v69 = &v76;
    v70 = 0x3F847AE147AE147BLL;
    -[PGPeopleWallpaperSuggester personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:](self, "personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:", v66);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v77 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_41:

        goto LABEL_42;
      }
      buf[0] = 0xF304000202;
      LOWORD(buf[1]) = 2080;
      *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
      v14 = MEMORY[0x1E0C81028];
LABEL_12:
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
      goto LABEL_41;
    }
    v15 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v18 = v11;
    v19 = v18;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_END, v9, "PGPeopleWallpaperSuggesterAnalyzer", ", (uint8_t *)buf, 2u);
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf[0]) = 136315394;
      *(_QWORD *)((char *)buf + 4) = "PGPeopleWallpaperSuggesterAnalyzer";
      WORD2(buf[1]) = 2048;
      *(double *)((char *)&buf[1] + 6) = (float)((float)((float)((float)(v15 - v12) * (float)numer) / (float)denom)
                                               / 1000000.0);
      _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)buf, 0x16u);
    }
    if (v4)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v73[3] >= 0.01)
      {
        v73[3] = Current;
        LOBYTE(v80) = 0;
        (*((void (**)(id, int *, double))v13 + 2))(v13, &v80, 0.5);
        v21 = *((_BYTE *)v77 + 24) | v80;
        *((_BYTE *)v77 + 24) = v21;
        if (v21)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_41;
          buf[0] = 0xF604000202;
          LOWORD(buf[1]) = 2080;
          *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
          v14 = MEMORY[0x1E0C81028];
          goto LABEL_12;
        }
      }
    }
    v22 = v19;
    v23 = os_signpost_id_generate(v22);
    v24 = v22;
    v25 = v24;
    if (v23 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      LOWORD(buf[0]) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v25, OS_SIGNPOST_INTERVAL_BEGIN, v23, "PGPeopleWallpaperSuggesterCandidateComputation", ", (uint8_t *)buf, 2u);
    }

    v65 = 0;
    mach_timebase_info(&v65);
    v43 = mach_absolute_time();
    v44 = v23 - 1;
    buf[0] = 0;
    buf[1] = buf;
    buf[2] = 0x2020000000;
    buf[3] = 0x3FE0000000000000;
    v26 = objc_msgSend(v50, "count");
    obj = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v50, "count"));
    spid = v23;
    +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:](PGWallpaperSuggestionUtilities, "assetFetchPropertySetsIncludingGating:", objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "forbiddenAssetUUIDs");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 0.5 / (double)v26;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __59__PGPeopleWallpaperSuggester__buildSuggestersWithProgress___block_invoke_191;
    v52[3] = &unk_1E8431AD0;
    v53 = v48;
    v30 = v25;
    v54 = v30;
    v55 = self;
    v45 = v27;
    v56 = v45;
    v31 = v28;
    v57 = v31;
    v32 = v13;
    v59 = v32;
    v60 = &v72;
    v63 = 0x3F847AE147AE147BLL;
    v64 = v29;
    v61 = buf;
    v62 = &v76;
    v33 = obj;
    v58 = v33;
    objc_msgSend(v50, "enumerateKeysAndObjectsUsingBlock:", v52);
    if (*((_BYTE *)v77 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_40:

        _Block_object_dispose(buf, 8);
        goto LABEL_41;
      }
      v80 = 67109378;
      LODWORD(v81[0]) = 282;
      WORD2(v81[0]) = 2080;
      *(_QWORD *)((char *)v81 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
      v34 = MEMORY[0x1E0C81028];
    }
    else
    {
      v35 = mach_absolute_time();
      v37 = v65.numer;
      v36 = v65.denom;
      v38 = v30;
      v39 = v38;
      if (v44 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
      {
        LOWORD(v80) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v39, OS_SIGNPOST_INTERVAL_END, spid, "PGPeopleWallpaperSuggesterCandidateComputation", ", (uint8_t *)&v80, 2u);
      }

      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        v80 = 136315394;
        v81[0] = "PGPeopleWallpaperSuggesterCandidateComputation";
        LOWORD(v81[1]) = 2048;
        *(double *)((char *)&v81[1] + 2) = (float)((float)((float)((float)(v35 - v43) * (float)v37) / (float)v36)
                                                 / 1000000.0);
        _os_log_impl(&dword_1CA237000, v39, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v80, 0x16u);
      }
      objc_storeStrong((id *)&self->_suggesterByPersonLocalIdentifier, obj);
      if (!v4)
        goto LABEL_40;
      v40 = CFAbsoluteTimeGetCurrent();
      if (v40 - v73[3] < 0.01)
        goto LABEL_40;
      v73[3] = v40;
      v51 = 0;
      (*((void (**)(id, char *, double))v32 + 2))(v32, &v51, 1.0);
      v41 = *((_BYTE *)v77 + 24) | v51;
      *((_BYTE *)v77 + 24) = v41;
      if (!v41 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_40;
      v80 = 67109378;
      LODWORD(v81[0]) = 287;
      WORD2(v81[0]) = 2080;
      *(_QWORD *)((char *)v81 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
      v34 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v80, 0x12u);
    goto LABEL_40;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf[0] = 0xE904000202;
    LOWORD(buf[1]) = 2080;
    *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Suggestions/Suggesters/Autobahn/PGPeopleWallpaperSuggester.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
  }
LABEL_42:
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&v76, 8);

}

- (id)personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  PGPeopleWallpaperSuggesterFilteringContext *primaryFilteringContext;
  PGPeopleWallpaperSuggesterFilteringContext *v10;
  PGPeopleWallpaperSuggesterFilteringContext *v11;
  uint64_t v12;
  int64_t v13;
  PGPeopleWallpaperSuggesterFilteringContext *v14;
  void *v15;
  id v16;
  id v17;
  PGPeopleWallpaperSuggesterFilteringContext *v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[4];
  id v25;
  id v26;
  PGPeopleWallpaperSuggesterFilteringContext *v27;
  id v28;
  id v29;

  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "curationContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  primaryFilteringContext = self->_primaryFilteringContext;
  if (primaryFilteringContext)
  {
    v10 = primaryFilteringContext;
  }
  else
  {
    v11 = [PGPeopleWallpaperSuggesterFilteringContext alloc];
    v12 = objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions");
    v13 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext orientation](self->_primaryFilteringContext, "orientation");
    v10 = -[PGPeopleWallpaperSuggesterFilteringContext initForTopPeople:withDictionary:orientation:](v11, "initForTopPeople:withDictionary:orientation:", v12, MEMORY[0x1E0C9AA70], v13);
  }
  v14 = v10;
  objc_msgSend(v5, "workingContext");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __96__PGPeopleWallpaperSuggester_personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress___block_invoke;
  v24[3] = &unk_1E8431B40;
  v25 = v6;
  v26 = v7;
  v27 = v14;
  v29 = v4;
  v16 = v8;
  v28 = v16;
  v17 = v4;
  v18 = v14;
  v19 = v7;
  v20 = v6;
  objc_msgSend(v15, "performSynchronousConcurrentGraphReadUsingBlock:", v24);

  v21 = v28;
  v22 = v16;

  return v22;
}

- (PGPeopleWallpaperSuggesterFilteringContext)primaryFilteringContext
{
  return self->_primaryFilteringContext;
}

- (void)setPrimaryFilteringContext:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFilteringContext, a3);
}

- (PGPeopleWallpaperSuggesterFilteringContext)secondaryFilteringContext
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
  objc_storeStrong((id *)&self->_assetGater, 0);
  objc_storeStrong((id *)&self->_distancingContext, 0);
  objc_storeStrong((id *)&self->_scoringContext, 0);
  objc_storeStrong((id *)&self->_suggesterByPersonLocalIdentifier, 0);
}

void __96__PGPeopleWallpaperSuggester_personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  PGPeopleWallpaperSuggesterPersonImportanceAnalyzer *v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v3 = a2;
  v4 = [PGPeopleWallpaperSuggesterPersonImportanceAnalyzer alloc];
  objc_msgSend(v3, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer initWithGraph:curationContext:loggingConnection:](v4, "initWithGraph:curationContext:loggingConnection:", v5, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 48), "normalizedDeviationForVeryImportantPersons");
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer setNormalizedDeviationForVeryImportantPersons:](v8, "setNormalizedDeviationForVeryImportantPersons:");
  objc_msgSend(*(id *)(a1 + 48), "normalizedDeviationForImportantPersons");
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer setNormalizedDeviationForImportantPersons:](v8, "setNormalizedDeviationForImportantPersons:");
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer setFavoritePersonsAreVIPs:](v8, "setFavoritePersonsAreVIPs:", objc_msgSend(*(id *)(a1 + 48), "favoritePersonsAreVIPs"));
  -[PGPeopleWallpaperSuggesterPersonImportanceAnalyzer personInformationsWithProgress:](v8, "personInformationsWithProgress:", *(_QWORD *)(a1 + 64));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(*(id *)(a1 + 48), "minimumPersonImportance");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __96__PGPeopleWallpaperSuggester_personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress___block_invoke_2;
  v9[3] = &unk_1E8431B18;
  v11 = v7;
  v10 = *(id *)(a1 + 56);
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", v9);

}

void __96__PGPeopleWallpaperSuggester_personLocalIdentifiersByOriginalPersonLocalIdentifierWithProgress___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v6 = a2;
  if (objc_msgSend(v6, "importance") >= *(_QWORD *)(a1 + 40) && objc_msgSend(v6, "importance") != 3)
  {
    objc_msgSend(v6, "personLocalIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "dupedPersonLocalIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setByAddingObject:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v3);
  }

}

void __59__PGPeopleWallpaperSuggester__buildSuggestersWithProgress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __59__PGPeopleWallpaperSuggester__buildSuggestersWithProgress___block_invoke_191(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  PGSinglePersonWallpaperAssetSuggester *v9;
  NSObject *v10;
  double Current;
  uint64_t v12;
  unint64_t v13;
  NSObject *v14;
  const char *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, _BYTE *, double);
  void *v19;
  id v20;
  __int128 v21;
  uint64_t v22;
  __int128 v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  v9 = -[PGSinglePersonWallpaperAssetSuggester initWithPersonLocalIdentifiers:curationContext:loggingConnection:]([PGSinglePersonWallpaperAssetSuggester alloc], "initWithPersonLocalIdentifiers:curationContext:loggingConnection:", v8, *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40));

  -[PGSinglePersonWallpaperAssetSuggester setPrimaryFilteringContext:](v9, "setPrimaryFilteringContext:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 80));
  -[PGSinglePersonWallpaperAssetSuggester setSecondaryFilteringContext:](v9, "setSecondaryFilteringContext:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 88));
  -[PGSinglePersonWallpaperAssetSuggester setScoringContext:](v9, "setScoringContext:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 56));
  -[PGSinglePersonWallpaperAssetSuggester setDistancingContext:](v9, "setDistancingContext:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 64));
  -[PGSinglePersonWallpaperAssetSuggester setAssetFetchPropertySets:](v9, "setAssetFetchPropertySets:", *(_QWORD *)(a1 + 56));
  -[PGSinglePersonWallpaperAssetSuggester setForbiddenAssetUUIDs:](v9, "setForbiddenAssetUUIDs:", *(_QWORD *)(a1 + 64));
  v10 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v7;
    _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_DEFAULT, "[PGPeopleWallpaperSuggester] Processing person %@", buf, 0xCu);
  }
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __59__PGPeopleWallpaperSuggester__buildSuggestersWithProgress___block_invoke_193;
  v19 = &unk_1E8434EB8;
  v20 = *(id *)(a1 + 80);
  v21 = *(_OWORD *)(a1 + 88);
  v23 = *(_OWORD *)(a1 + 112);
  v22 = *(_QWORD *)(a1 + 104);
  -[PGSinglePersonWallpaperAssetSuggester computeSuggestedAssetsWithProgress:](v9, "computeSuggestedAssetsWithProgress:", &v16);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24)
    || (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(double *)(a1 + 120)
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                                + 24),
        *(_QWORD *)(a1 + 80))
    && (Current = CFAbsoluteTimeGetCurrent(),
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8),
        Current - *(double *)(v12 + 24) >= *(double *)(a1 + 112))
    && (*(double *)(v12 + 24) = Current,
        buf[0] = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) |= buf[0]) != 0))
  {
    *a4 = 1;
  }
  else
  {
    v13 = -[PGSinglePersonWallpaperAssetSuggester expectedNumberOfSuggestedAssets](v9, "expectedNumberOfSuggestedAssets", v16, v17, v18, v19);
    if (v13 >= objc_msgSend(*(id *)(*(_QWORD *)(a1 + 48) + 80), "minimumNumberOfCandidatesForEligiblePerson"))
    {
      objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v9, v7);
      v14 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v13;
        v15 = "[PGPeopleWallpaperSuggester] Found %d candidates";
        goto LABEL_14;
      }
    }
    else
    {
      v14 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v25) = v13;
        v15 = "[PGPeopleWallpaperSuggester] Found only %d candidates, dropping";
LABEL_14:
        _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_DEFAULT, v15, buf, 8u);
      }
    }
  }

}

void __59__PGPeopleWallpaperSuggester__buildSuggestersWithProgress___block_invoke_193(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                               + 24) + *(double *)(a1 + 72) * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __62__PGPeopleWallpaperSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __62__PGPeopleWallpaperSuggester_suggestionsWithOptions_progress___block_invoke_169(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  PGWallpaperSuggestionAccumulator *v11;
  uint64_t v12;
  unint64_t v13;
  double v14;
  int v15;
  int v16;
  void *v17;
  NSObject *v18;
  uint64_t v19;
  _BOOL4 v20;
  NSObject *v21;
  int v22;
  int v23;
  double v24;
  uint64_t v25;
  PGPeopleWallpaperSuggestion *v26;
  void *v27;
  void *v28;
  char v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  BOOL v35;
  double v36;
  int v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  uint64_t v45;
  double Current;
  uint64_t v47;
  const __CFString *v48;
  NSObject *v49;
  NSObject *v50;
  int v51;
  _BYTE *v52;
  int v53;
  uint64_t v54;
  id v55;
  double v56;
  unsigned __int8 v57;
  _QWORD v58[4];
  id v59;
  __int128 v60;
  uint64_t v61;
  double v62;
  uint8_t buf[4];
  _BYTE v64[22];
  __int16 v65;
  int v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v55 = a3;
  v8 = *(NSObject **)(a1 + 32);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v9 = *(_QWORD *)(a1 + 88);
    v10 = *(_QWORD *)(a1 + 96);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v64 = v9;
    *(_WORD *)&v64[4] = 1024;
    *(_DWORD *)&v64[6] = v10;
    *(_WORD *)&v64[10] = 2112;
    *(_QWORD *)&v64[12] = v7;
    _os_log_impl(&dword_1CA237000, v8, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Starting to generate %d suggestions (%d gated) for person %@.", buf, 0x18u);
  }
  v11 = -[PGWallpaperSuggestionAccumulator initWithTargetNumberOfSuggestions:targetMinimumNumberOfGatedSuggestions:maximumNumberOfSuggestionsToTryForGating:loggingConnection:]([PGWallpaperSuggestionAccumulator alloc], "initWithTargetNumberOfSuggestions:targetMinimumNumberOfGatedSuggestions:maximumNumberOfSuggestionsToTryForGating:loggingConnection:", *(_QWORD *)(a1 + 88), *(_QWORD *)(a1 + 96), *(_QWORD *)(a1 + 104), *(_QWORD *)(a1 + 32));
  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v13 = *(_QWORD *)(v12 + 24);
  v14 = *(double *)(a1 + 112);
  *(_QWORD *)(v12 + 24) = v13 + 1;
  if (!-[PGWallpaperSuggestionAccumulator accumulationIsComplete](v11, "accumulationIsComplete"))
  {
    v52 = a4;
    v16 = 0;
    v15 = 0;
    v54 = 0;
    v53 = 0;
    v24 = v14 * (double)v13;
    while (1)
    {
      objc_msgSend(v55, "nextSuggestedAsset");
      v25 = objc_claimAutoreleasedReturnValue();
      if (!v25)
        goto LABEL_5;
      v17 = (void *)v25;
      v26 = -[PGPeopleWallpaperSuggestion initWithPersonLocalIdentifier:type:subtype:asset:]([PGPeopleWallpaperSuggestion alloc], "initWithPersonLocalIdentifier:type:subtype:asset:", v7, *(unsigned __int16 *)(a1 + 128), *(unsigned __int16 *)(a1 + 130), v25);
      if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 72))
        break;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 72), "setEnableSettlingEffect:", +[PGSettlingEffectWallpaperSuggesterFilteringContext shouldRunSettlingEffectForAsset:subtype:](PGSettlingEffectWallpaperSuggesterFilteringContext, "shouldRunSettlingEffectForAsset:subtype:", v17, 602));
      v27 = *(void **)(*(_QWORD *)(a1 + 40) + 72);
      v58[0] = MEMORY[0x1E0C809B0];
      v58[1] = 3221225472;
      v58[2] = __62__PGPeopleWallpaperSuggester_suggestionsWithOptions_progress___block_invoke_173;
      v58[3] = &unk_1E8434F58;
      v59 = *(id *)(a1 + 56);
      v61 = *(_QWORD *)(a1 + 120);
      v62 = v24;
      v60 = *(_OWORD *)(a1 + 72);
      objc_msgSend(v27, "gateAsset:progressBlock:", v17, v58);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGSingleAssetSuggestion setAvailableFeatures:](v26, "setAvailableFeatures:", objc_msgSend(v28, "availableFeatures"));
      v29 = objc_msgSend(v28, "passesAnyGating");

      ++v16;
      v57 = 0;
      v56 = 1.0;
      if ((v29 & 1) != 0)
        goto LABEL_23;
      objc_msgSend(MEMORY[0x1E0D77EF8], "cropScoreWithAsset:classification:passesClockOverlap:cropZoomRatio:orientation:", v17, 1, &v57, &v56, objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "orientation"));
      v31 = v30;
      v32 = v56;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "maximumCropZoomRatio");
      v34 = v33;
      v35 = v32 <= v33;
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 80), "minimumCropScore");
      v37 = v57;
      if (v57)
      {
        if (v32 <= v34 && v31 >= v36)
        {
          v38 = *(void **)(*(_QWORD *)(a1 + 40) + 88);
          if (!v38)
            goto LABEL_21;
          objc_msgSend(MEMORY[0x1E0D77EF8], "cropScoreWithAsset:classification:passesClockOverlap:cropZoomRatio:orientation:", v17, 1, &v57, &v56, objc_msgSend(v38, "orientation"));
          v40 = v39;
          v41 = v56;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "maximumCropZoomRatio");
          v43 = v42;
          v35 = v41 <= v42;
          objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 88), "minimumCropScore");
          v37 = v57;
          if (v57)
          {
            if (v41 <= v43 && v40 >= v44)
            {
LABEL_21:
              v45 = 0;
              goto LABEL_24;
            }
          }
        }
      }
      if (v37)
      {
        if (v35)
        {
          LODWORD(v54) = v54 + 1;
          v48 = CFSTR("low crop score");
        }
        else
        {
          ++v53;
          v48 = CFSTR("low resolution");
        }
      }
      else
      {
        ++HIDWORD(v54);
        v48 = CFSTR("clock overlap");
      }
      v49 = *(NSObject **)(a1 + 32);
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v64 = CFSTR("non-gated");
        *(_WORD *)&v64[8] = 2112;
        *(_QWORD *)&v64[10] = v48;
        _os_log_impl(&dword_1CA237000, v49, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Rejecting %@ suggestion because of %@.", buf, 0x16u);
      }
LABEL_25:

      if (*(_QWORD *)(a1 + 56))
      {
        Current = CFAbsoluteTimeGetCurrent();
        v47 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
        if (Current - *(double *)(v47 + 24) >= *(double *)(a1 + 120))
        {
          *(double *)(v47 + 24) = Current;
          buf[0] = 0;
          (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))(v24 + 0.75);
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) |= buf[0];
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
          {
            *v52 = 1;
            goto LABEL_40;
          }
        }
      }

      if (-[PGWallpaperSuggestionAccumulator accumulationIsComplete](v11, "accumulationIsComplete"))
        goto LABEL_5;
    }
    ++v16;
    v57 = 0;
    v56 = 1.0;
LABEL_23:
    v45 = 1;
LABEL_24:
    -[PGWallpaperSuggestionAccumulator addSuggestion:passingGating:](v11, "addSuggestion:passingGating:", v26, v45);
    ++v15;
    goto LABEL_25;
  }
  v54 = 0;
  v53 = 0;
  v15 = 0;
  v16 = 0;
LABEL_5:
  -[PGWallpaperSuggestionAccumulator suggestions](v11, "suggestions");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 48), "addObjectsFromArray:", v17);
  v18 = *(NSObject **)(a1 + 32);
  v19 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 72);
  v20 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
  if (v19)
  {
    if (v20)
    {
      v21 = v18;
      v22 = objc_msgSend(v17, "count");
      v23 = -[PGWallpaperSuggestionAccumulator numberOfGatedSuggestions](v11, "numberOfGatedSuggestions");
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v64 = v22;
      *(_WORD *)&v64[4] = 1024;
      *(_DWORD *)&v64[6] = v23;
      *(_WORD *)&v64[10] = 2112;
      *(_QWORD *)&v64[12] = v7;
      _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Generated %d suggestions (%d gated) for person %@.", buf, 0x18u);

      v18 = *(NSObject **)(a1 + 32);
    }
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67110144;
      *(_DWORD *)v64 = v16;
      *(_WORD *)&v64[4] = 1024;
      *(_DWORD *)&v64[6] = v15;
      *(_WORD *)&v64[10] = 1024;
      *(_DWORD *)&v64[12] = HIDWORD(v54);
      *(_WORD *)&v64[16] = 1024;
      *(_DWORD *)&v64[18] = v53;
      v65 = 1024;
      v66 = v54;
      _os_log_impl(&dword_1CA237000, v18, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Tried %d assets, %d passed, rejected %d for clock overlap, %d for low resolution, %d for low crop score.", buf, 0x20u);
    }
  }
  else if (v20)
  {
    v50 = v18;
    v51 = objc_msgSend(v17, "count");
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v64 = v51;
    *(_WORD *)&v64[4] = 2112;
    *(_QWORD *)&v64[6] = v7;
    _os_log_impl(&dword_1CA237000, v50, OS_LOG_TYPE_INFO, "[PGPeopleWallpaperSuggester] Generated %d suggestions for person %@.", buf, 0x12u);

  }
LABEL_40:

}

void __62__PGPeopleWallpaperSuggester_suggestionsWithOptions_progress___block_invoke_173(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v7;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v7 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v7 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 64) * a3 + 0.75);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

+ (id)suggestionTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 6);
}

+ (id)suggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 652);
}

+ (BOOL)enableSettlingEffect
{
  return 1;
}

+ (BOOL)filtersForTopSuggestions
{
  return 0;
}

+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6
{
  id v9;
  id v10;
  uint64_t v11;
  _BOOL4 v12;
  PGWallpaperSuggestionAssetGater *v13;
  PGWallpaperSuggestionAssetGater *v14;
  void *v15;
  __CFString *v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v25;
  char v26;

  v9 = a3;
  v10 = a4;
  v11 = objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions");
  v12 = +[PGSinglePersonWallpaperAssetSuggester passesFilteringWithAsset:forTopWallpaperSuggestions:curationContext:orientation:reason:](PGSinglePersonWallpaperAssetSuggester, "passesFilteringWithAsset:forTopWallpaperSuggestions:curationContext:orientation:reason:", v9, v11, v10, a5, a6);

  if ((_DWORD)v11 && v12)
  {
    v13 = [PGWallpaperSuggestionAssetGater alloc];
    LOBYTE(v12) = 1;
    v14 = -[PGWallpaperSuggestionAssetGater initWithType:loggingConnection:](v13, "initWithType:loggingConnection:", 1, MEMORY[0x1E0C81028]);
    -[PGWallpaperSuggestionAssetGater setCoversTracks:](v14, "setCoversTracks:", 1);
    -[PGWallpaperSuggestionAssetGater setIsUserInitiated:](v14, "setIsUserInitiated:", 1);
    -[PGWallpaperSuggestionAssetGater gateAsset:progressBlock:](v14, "gateAsset:progressBlock:", v9, &__block_literal_global_53503);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "passesAnyGating") & 1) != 0)
    {
      v16 = CFSTR("Pass Segmented");
      if (!a6)
        goto LABEL_15;
    }
    else
    {
      v26 = 0;
      v25 = 1.0;
      objc_msgSend(MEMORY[0x1E0D77EF8], "cropScoreWithAsset:classification:passesClockOverlap:cropZoomRatio:orientation:", v9, 1, &v26, &v25, a5);
      v18 = v17;
      v19 = -[PGPeopleWallpaperSuggesterFilteringContext initForTopPeopleInOrientation:]([PGPeopleWallpaperSuggesterFilteringContext alloc], "initForTopPeopleInOrientation:", a5);
      v20 = v19;
      if (v26)
      {
        v21 = v25;
        objc_msgSend(v19, "maximumCropZoomRatio");
        if (v21 <= v22)
        {
          objc_msgSend(v20, "minimumCropScore");
          LOBYTE(v12) = v18 >= v23;
          if (v18 < v23)
            v16 = CFSTR("Low Crop Score");
          else
            v16 = CFSTR("Pass Unsegmented");
        }
        else
        {
          LOBYTE(v12) = 0;
          v16 = CFSTR("Low Resolution");
        }
      }
      else
      {
        LOBYTE(v12) = 0;
        v16 = CFSTR("Clock Overlap");
      }

      if (!a6)
        goto LABEL_15;
    }
    *a6 = v16;
LABEL_15:

  }
  return v12;
}

@end
