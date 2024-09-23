@implementation PGLandscapeWallpaperSuggester

- (PGLandscapeWallpaperSuggester)initWithSession:(id)a3
{
  id v4;
  PGLandscapeWallpaperSuggester *v5;
  PGWallpaperSuggestionAssetGater *v6;
  void *v7;
  uint64_t v8;
  PGWallpaperSuggestionAssetGater *assetGater;
  uint64_t v10;
  CLSSceneConfidenceThresholdHelper *peopleSceneConfidenceThresholdHelper;
  objc_super v13;

  v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGLandscapeWallpaperSuggester;
  v5 = -[PGAbstractSuggester initWithSession:](&v13, sel_initWithSession_, v4);
  if (v5)
  {
    if (objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions"))
    {
      v6 = [PGWallpaperSuggestionAssetGater alloc];
      objc_msgSend(v4, "loggingConnection");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = -[PGWallpaperSuggestionAssetGater initWithType:loggingConnection:](v6, "initWithType:loggingConnection:", 3, v7);
      assetGater = v5->_assetGater;
      v5->_assetGater = (PGWallpaperSuggestionAssetGater *)v8;

    }
    +[PGWallpaperSuggestionUtilities peopleSceneConfidenceThresholdHelper](PGWallpaperSuggestionUtilities, "peopleSceneConfidenceThresholdHelper");
    v10 = objc_claimAutoreleasedReturnValue();
    peopleSceneConfidenceThresholdHelper = v5->_peopleSceneConfidenceThresholdHelper;
    v5->_peopleSceneConfidenceThresholdHelper = (CLSSceneConfidenceThresholdHelper *)v10;

    -[PGLandscapeWallpaperSuggester setupFilteringContexts](v5, "setupFilteringContexts");
  }

  return v5;
}

- (void)setupFilteringContexts
{
  PGLandscapeWallpaperSuggester *v2;
  objc_class *v3;
  int IsIPad;
  PGLandscapeWallpaperSuggesterFilteringContext *v5;
  uint64_t v6;
  PGLandscapeWallpaperSuggesterFilteringContext *primaryFilteringContext;
  PGLandscapeWallpaperSuggesterFilteringContext *v8;
  PGLandscapeWallpaperSuggesterFilteringContext *secondaryFilteringContext;
  uint64_t v10;
  PGLandscapeWallpaperSuggesterFilteringContext *v11;
  objc_class *v12;
  objc_class *v13;
  PGLandscapeWallpaperSuggester *v14;
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
    v14 = (PGLandscapeWallpaperSuggester *)_PFAssertFailHandler();
    -[PGLandscapeWallpaperSuggester suggestionsWithOptions:progress:](v14, v15, v16, v17);
    return;
  }
  if ((-[PGLandscapeWallpaperSuggester isMemberOfClass:](v2, "isMemberOfClass:", v3) & 1) == 0)
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
  v5 = [PGLandscapeWallpaperSuggesterFilteringContext alloc];
  if (IsIPad)
  {
    v6 = -[PGLandscapeWallpaperSuggesterFilteringContext initForLandscapesInOrientation:](v5, "initForLandscapesInOrientation:", 2);
    primaryFilteringContext = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGLandscapeWallpaperSuggesterFilteringContext *)v6;

    v8 = -[PGLandscapeWallpaperSuggesterFilteringContext initForLandscapesInOrientation:]([PGLandscapeWallpaperSuggesterFilteringContext alloc], "initForLandscapesInOrientation:", 1);
    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = v8;
  }
  else
  {
    v10 = -[PGLandscapeWallpaperSuggesterFilteringContext initForLandscapesInOrientation:](v5, "initForLandscapesInOrientation:", 1);
    v11 = v2->_primaryFilteringContext;
    v2->_primaryFilteringContext = (PGLandscapeWallpaperSuggesterFilteringContext *)v10;

    secondaryFilteringContext = v2->_secondaryFilteringContext;
    v2->_secondaryFilteringContext = 0;
  }

}

- (id)suggestionsWithOptions:(id)a3 progress:(id)a4
{
  id v6;
  id v7;
  int v8;
  id v9;
  uint64_t v10;
  NSObject *v11;
  os_signpost_id_t v12;
  NSObject *v13;
  NSObject *v14;
  char v15;
  NSObject *v16;
  const char *v17;
  char v18;
  uint32_t v19;
  uint64_t v21;
  uint32_t numer;
  uint32_t denom;
  NSObject *v24;
  NSObject *v25;
  char v26;
  void *v27;
  unsigned __int16 v28;
  void *v29;
  unsigned __int16 v30;
  PGWallpaperSuggestionAssetGater *assetGater;
  PGWallpaperSuggestionAccumulator *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  unint64_t v36;
  unint64_t v37;
  uint64_t v38;
  __int128 v39;
  double v40;
  uint64_t v41;
  void *v42;
  PGSingleAssetSuggestion *v43;
  void *v44;
  PGSingleAssetSuggestion *v45;
  void *v46;
  _BOOL8 v47;
  PGWallpaperSuggestionAssetGater *v48;
  void *v49;
  void *v50;
  uint64_t v51;
  void *v52;
  char v53;
  NSObject *v54;
  int v55;
  int v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  void *v67;
  double v68;
  BOOL v69;
  const __CFString *v70;
  void *v71;
  PGWallpaperSuggestionAssetGater *v72;
  NSObject *v73;
  _BOOL4 v74;
  int v75;
  int v76;
  const char *v77;
  NSObject *v78;
  uint32_t v79;
  int v80;
  char v81;
  uint64_t v82;
  uint32_t v83;
  uint32_t v84;
  NSObject *v85;
  NSObject *v86;
  __int128 v87;
  int v88;
  uint64_t v89;
  unsigned __int8 v90;
  int v91;
  void *v92;
  int v93;
  void *v94;
  id obj;
  unsigned int v96;
  unsigned int v97;
  uint64_t v98;
  uint64_t v99;
  uint64_t v100;
  void *v101;
  void *context;
  uint64_t v103;
  unint64_t v104;
  os_signpost_id_t spid;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  _QWORD v110[4];
  id v111;
  uint64_t *v112;
  double v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  mach_timebase_info info;
  uint64_t v119;
  uint64_t *v120;
  uint64_t v121;
  char v122;
  uint8_t buf[4];
  _BYTE v124[18];
  int v125;
  __int16 v126;
  int v127;
  _BYTE v128[128];
  uint64_t v129;

  v129 = *MEMORY[0x1E0C80C00];
  v109 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v119 = 0;
  v120 = &v119;
  v121 = 0x2020000000;
  v122 = 0;
  v8 = objc_msgSend(v7, "isCancelledWithProgress:", 0.0);
  *((_BYTE *)v120 + 24) = v8;
  if (v8)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v124 = 100;
      *(_WORD *)&v124[4] = 2080;
      *(_QWORD *)&v124[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_25;
  }
  v10 = objc_msgSend(v109, "maximumNumberOfSuggestions");
  -[PGAbstractSuggester session](self, "session");
  v107 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v107, "loggingConnection");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v12 = os_signpost_id_generate(v11);
  v13 = v11;
  v14 = v13;
  v104 = v12 - 1;
  spid = v12;
  if (v12 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v13))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v14, OS_SIGNPOST_INTERVAL_BEGIN, v12, "PGLandscapeWallpaperSuggester", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v103 = mach_absolute_time();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v124 = v10;
    _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Starting to generate %d suggestions.", buf, 8u);
  }
  objc_msgSend(v7, "childProgressReporterFromStart:toEnd:", 0.0, 0.39);
  v106 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGLandscapeWallpaperSuggester fetchUnsortedCandidatesWithProgressReporter:](self, "fetchUnsortedCandidatesWithProgressReporter:");
  v108 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v108, "count"))
  {
    if (*((_BYTE *)v120 + 24))
    {
      *((_BYTE *)v120 + 24) = 1;
    }
    else
    {
      v18 = objc_msgSend(v7, "isCancelledWithProgress:", 1.0);
      *((_BYTE *)v120 + 24) = v18;
      if ((v18 & 1) == 0)
      {
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Found 0 unsorted candidate.", buf, 2u);
        }
        v21 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v24 = v14;
        v25 = v24;
        if (v104 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v25, OS_SIGNPOST_INTERVAL_END, v12, "PGLandscapeWallpaperSuggester", ", buf, 2u);
        }

        if (!os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          goto LABEL_23;
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v124 = "PGLandscapeWallpaperSuggester";
        *(_WORD *)&v124[8] = 2048;
        *(double *)&v124[10] = (float)((float)((float)((float)(v21 - v103) * (float)numer) / (float)denom) / 1000000.0);
        v17 = "[Performance] %s: %f ms";
        v16 = v25;
        v19 = 22;
        goto LABEL_22;
      }
    }
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v124 = 114;
      *(_WORD *)&v124[4] = 2080;
      *(_QWORD *)&v124[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
      v16 = MEMORY[0x1E0C81028];
      v17 = "Cancelled at line %d in file %s";
      goto LABEL_21;
    }
LABEL_23:
    v9 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_24;
  }
  if (*((_BYTE *)v120 + 24))
  {
    *((_BYTE *)v120 + 24) = 1;
    goto LABEL_16;
  }
  v15 = objc_msgSend(v7, "isCancelledWithProgress:", 0.4);
  *((_BYTE *)v120 + 24) = v15;
  if ((v15 & 1) != 0)
  {
LABEL_16:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v124 = 121;
      *(_WORD *)&v124[4] = 2080;
      *(_QWORD *)&v124[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
      v16 = MEMORY[0x1E0C81028];
      v17 = "Cancelled at line %d in file %s";
LABEL_21:
      v19 = 18;
LABEL_22:
      _os_log_impl(&dword_1CA237000, v16, OS_LOG_TYPE_INFO, v17, buf, v19);
      goto LABEL_23;
    }
    goto LABEL_23;
  }
  -[PGLandscapeWallpaperSuggester sortedDedupedCandidatesFromCandidates:](self, "sortedDedupedCandidatesFromCandidates:", v108);
  v94 = (void *)objc_claimAutoreleasedReturnValue();
  if (*((_BYTE *)v120 + 24))
  {
    *((_BYTE *)v120 + 24) = 1;
LABEL_36:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v124 = 125;
      *(_WORD *)&v124[4] = 2080;
      *(_QWORD *)&v124[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
    goto LABEL_39;
  }
  v26 = objc_msgSend(v7, "isCancelledWithProgress:", 0.8);
  *((_BYTE *)v120 + 24) = v26;
  if ((v26 & 1) != 0)
    goto LABEL_36;
  objc_msgSend((id)objc_opt_class(), "suggestionTypes");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = objc_msgSend(v27, "firstIndex");

  objc_msgSend((id)objc_opt_class(), "suggestionSubtypes");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = objc_msgSend(v29, "firstIndex");

  assetGater = self->_assetGater;
  v32 = [PGWallpaperSuggestionAccumulator alloc];
  if (assetGater)
    v33 = 2 * v10;
  else
    v33 = 0;
  if (assetGater)
    v34 = 5;
  else
    v34 = 0;
  v35 = -[PGWallpaperSuggestionAccumulator initWithTargetNumberOfSuggestions:targetMinimumNumberOfGatedSuggestions:maximumNumberOfSuggestionsToTryForGating:loggingConnection:](v32, "initWithTargetNumberOfSuggestions:targetMinimumNumberOfGatedSuggestions:maximumNumberOfSuggestionsToTryForGating:loggingConnection:", v10, v34, v33, v14);
  v36 = objc_msgSend(v94, "count");
  if (v36 <= 1)
    v37 = 1;
  else
    v37 = v36;
  v116 = 0u;
  v117 = 0u;
  v114 = 0u;
  v115 = 0u;
  obj = v94;
  v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v128, 16);
  v101 = (void *)v35;
  if (!v38)
  {
    v93 = 0;
    v91 = 0;
    v89 = 0;
    v88 = 0;
    goto LABEL_86;
  }
  v93 = 0;
  v91 = 0;
  v89 = 0;
  v88 = 0;
  v100 = 0;
  v40 = 0.1 / (double)v37;
  v96 = v30;
  v97 = v28;
  v98 = *(_QWORD *)v115;
  *(_QWORD *)&v39 = 138412290;
  v87 = v39;
  while (2)
  {
    v41 = 0;
    v99 = v38;
    do
    {
      if (*(_QWORD *)v115 != v98)
        objc_enumerationMutation(obj);
      v42 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * v41);
      context = (void *)MEMORY[0x1CAA4EB2C]();
      v43 = [PGSingleAssetSuggestion alloc];
      objc_msgSend(v42, "asset");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v45 = -[PGSingleAssetSuggestion initWithType:subtype:asset:](v43, "initWithType:subtype:asset:", v97, v96, v44);

      if (self->_assetGater)
      {
        objc_msgSend(v42, "asset");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        v47 = +[PGSettlingEffectWallpaperSuggesterFilteringContext shouldRunSettlingEffectForAsset:subtype:](PGSettlingEffectWallpaperSuggesterFilteringContext, "shouldRunSettlingEffectForAsset:subtype:", v46, 604);

        -[PGWallpaperSuggestionAssetGater setEnableSettlingEffect:](self->_assetGater, "setEnableSettlingEffect:", v47);
        v48 = self->_assetGater;
        objc_msgSend(v42, "asset");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v110[0] = MEMORY[0x1E0C809B0];
        v110[1] = 3221225472;
        v110[2] = __65__PGLandscapeWallpaperSuggester_suggestionsWithOptions_progress___block_invoke;
        v110[3] = &unk_1E8428630;
        v112 = &v119;
        v111 = v7;
        v113 = v40 * (double)(unint64_t)(v100 + v41);
        -[PGWallpaperSuggestionAssetGater gateAsset:progressBlock:](v48, "gateAsset:progressBlock:", v49, v110);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        -[PGSingleAssetSuggestion setAvailableFeatures:](v45, "setAvailableFeatures:", objc_msgSend(v50, "availableFeatures"));
        v51 = objc_msgSend(v50, "passesAnyGating");

      }
      else
      {
        v51 = 1;
      }
      v52 = v101;
      if (*((_BYTE *)v120 + 24))
      {
        *((_BYTE *)v120 + 24) = 1;
LABEL_60:
        v54 = MEMORY[0x1E0C81028];
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v124 = 156;
          *(_WORD *)&v124[4] = 2080;
          *(_QWORD *)&v124[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
          _os_log_impl(&dword_1CA237000, v54, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v55 = 0;
        v56 = 0;
        goto LABEL_63;
      }
      v53 = objc_msgSend(v7, "isCancelledWithProgress:", v40 * (double)(unint64_t)(v100 + v41) + 0.9);
      *((_BYTE *)v120 + 24) = v53;
      if ((v53 & 1) != 0)
        goto LABEL_60;
      ++v93;
      if ((v51 & 1) != 0)
        goto LABEL_71;
      objc_msgSend(v42, "cropResult");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGLandscapeWallpaperSuggester primaryFilteringContext](self, "primaryFilteringContext");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "cropForOrientation:", objc_msgSend(v58, "orientation"));
      v92 = (void *)objc_claimAutoreleasedReturnValue();

      -[PGLandscapeWallpaperSuggester primaryFilteringContext](self, "primaryFilteringContext");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      v90 = (objc_msgSend(v59, "ignoreClockOverlap") & 1) != 0 ? 1 : objc_msgSend(v92, "passesClockOverlap");

      objc_msgSend(v92, "cropZoomRatio");
      v61 = v60;
      -[PGLandscapeWallpaperSuggester primaryFilteringContext](self, "primaryFilteringContext");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v62, "maximumCropZoomRatio");
      v64 = v63;

      objc_msgSend(v92, "cropScore");
      v66 = v65;
      -[PGLandscapeWallpaperSuggester primaryFilteringContext](self, "primaryFilteringContext");
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v67, "minimumCropScore");
      v69 = v66 >= v68;

      v52 = v101;
      if ((v90 & (v61 <= v64) & v69) != 0)
      {
LABEL_71:
        objc_msgSend(v52, "addSuggestion:passingGating:", v45, v51, v87);
        ++v91;
        if ((objc_msgSend(v52, "accumulationIsComplete") & 1) != 0)
        {
          v55 = 0;
          v56 = 1;
          goto LABEL_63;
        }
      }
      else
      {
        if ((v90 & 1) != 0)
        {
          if (v61 > v64)
          {
            ++v88;
            v70 = CFSTR("low resolution");
          }
          else
          {
            LODWORD(v89) = v89 + 1;
            v70 = CFSTR("low cropScore");
          }
        }
        else
        {
          ++HIDWORD(v89);
          v70 = CFSTR("clock overlap");
        }
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = v87;
          *(_QWORD *)v124 = v70;
          _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Rejecting non-gated suggestion because of %@.", buf, 0xCu);
        }
      }
      v56 = 0;
      v55 = 1;
LABEL_63:

      objc_autoreleasePoolPop(context);
      if (!v55)
      {

        if (v56)
          goto LABEL_87;
        v9 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_102;
      }
      ++v41;
    }
    while (v99 != v41);
    v38 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v128, 16);
    v100 += v41;
    if (v38)
      continue;
    break;
  }
LABEL_86:

LABEL_87:
  objc_msgSend(v101, "suggestions", v87);
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = self->_assetGater;
  v73 = v14;
  v74 = os_log_type_enabled(v73, OS_LOG_TYPE_INFO);
  if (v72)
  {
    if (v74)
    {
      v75 = objc_msgSend(v71, "count");
      v76 = objc_msgSend(v101, "numberOfGatedSuggestions");
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)v124 = v75;
      *(_WORD *)&v124[4] = 1024;
      *(_DWORD *)&v124[6] = v76;
      v77 = "[PGLandscapeWallpaperSuggester] Generated %d suggestions (%d gated)";
      v78 = v73;
      v79 = 14;
      goto LABEL_92;
    }
  }
  else if (v74)
  {
    v80 = objc_msgSend(v71, "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)v124 = v80;
    v77 = "[PGLandscapeWallpaperSuggester] Generated %d suggestions";
    v78 = v73;
    v79 = 8;
LABEL_92:
    _os_log_impl(&dword_1CA237000, v78, OS_LOG_TYPE_INFO, v77, buf, v79);
  }

  if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67110144;
    *(_DWORD *)v124 = v93;
    *(_WORD *)&v124[4] = 1024;
    *(_DWORD *)&v124[6] = v91;
    *(_WORD *)&v124[10] = 1024;
    *(_DWORD *)&v124[12] = HIDWORD(v89);
    *(_WORD *)&v124[16] = 1024;
    v125 = v88;
    v126 = 1024;
    v127 = v89;
    _os_log_impl(&dword_1CA237000, v73, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Tried %d assets, %d passed, rejected %d for clock overlap, %d for low resolution, %d for low crop score.", buf, 0x20u);
  }
  if (*((_BYTE *)v120 + 24))
  {
    *((_BYTE *)v120 + 24) = 1;
    goto LABEL_98;
  }
  v81 = objc_msgSend(v7, "isCancelledWithProgress:", 1.0);
  *((_BYTE *)v120 + 24) = v81;
  if ((v81 & 1) != 0)
  {
LABEL_98:
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v124 = 199;
      *(_WORD *)&v124[4] = 2080;
      *(_QWORD *)&v124[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v9 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    v82 = mach_absolute_time();
    v83 = info.numer;
    v84 = info.denom;
    v85 = v73;
    v86 = v85;
    if (v104 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v85))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v86, OS_SIGNPOST_INTERVAL_END, spid, "PGLandscapeWallpaperSuggester", ", buf, 2u);
    }

    if (os_log_type_enabled(v86, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v124 = "PGLandscapeWallpaperSuggester";
      *(_WORD *)&v124[8] = 2048;
      *(double *)&v124[10] = (float)((float)((float)((float)(v82 - v103) * (float)v83) / (float)v84) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v86, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v9 = v71;
  }

LABEL_102:
LABEL_39:

LABEL_24:
LABEL_25:
  _Block_object_dispose(&v119, 8);

  return v9;
}

- (id)fetchCandidateAssets
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
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  NSObject *v17;
  uint64_t v18;
  uint64_t v19;
  uint32_t denom;
  uint32_t numer;
  NSObject *v22;
  NSObject *v23;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v27;
  __int16 v28;
  double v29;
  _QWORD v30[2];

  v30[1] = *MEMORY[0x1E0C80C00];
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
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v6, OS_SIGNPOST_INTERVAL_BEGIN, v4, "PGLandscapeWallpaperSuggesterFetchCandidates", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v7 = mach_absolute_time();
  objc_msgSend(v2, "photoLibrary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "librarySpecificFetchOptions");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setCacheSizeForFetch:", 200);
  objc_msgSend(v9, "setChunkSizeForFetch:", 200);
  +[PGWallpaperSuggestionUtilities assetFetchPropertySetsIncludingGating:](PGWallpaperSuggestionUtilities, "assetFetchPropertySetsIncludingGating:", objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFetchPropertySets:", v10);

  v11 = (void *)objc_opt_class();
  objc_msgSend(v2, "forbiddenAssetUUIDs");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "prefilteringInternalPredicateWithForbiddenAssetUUIDs:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInternalPredicate:", v13);

  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("uuid"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v30, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setSortDescriptors:", v15);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v9);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v6;
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    v18 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 134217984;
    v27 = (const char *)v18;
    _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Fetched %lu candidate assets.", buf, 0xCu);
  }

  v19 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v22 = v17;
  v23 = v22;
  if (v4 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_END, v4, "PGLandscapeWallpaperSuggesterFetchCandidates", ", buf, 2u);
  }

  if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v27 = "PGLandscapeWallpaperSuggesterFetchCandidates";
    v28 = 2048;
    v29 = (float)((float)((float)((float)(v19 - v7) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v16;
}

- (id)fetchUnsortedCandidatesWithProgressReporter:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  unint64_t v13;
  void *v14;
  __int128 v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint32_t numer;
  uint32_t denom;
  NSObject *v21;
  NSObject *v22;
  NSObject *v23;
  int v24;
  void *v25;
  unint64_t v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  __objc2_class **v31;
  uint64_t i;
  uint64_t v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  void *v40;
  id v41;
  void *v42;
  NSObject *v43;
  uint64_t v44;
  uint64_t v45;
  __int128 v47;
  os_signpost_id_t spid;
  uint64_t v49;
  unint64_t v50;
  void *v51;
  unint64_t v52;
  os_log_t oslog;
  void *v54;
  int v55;
  void *v56;
  void *v57;
  void *v58;
  void *context;
  unint64_t v60;
  id obj;
  uint64_t v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _OWORD v75[2];
  mach_timebase_info info;
  _BYTE v77[32];
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  _OWORD v83[2];
  _BYTE v84[128];
  uint8_t buf[32];
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  _OWORD v91[2];
  uint64_t v92;

  v92 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "isCancelledWithProgress:", 0.0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 273;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v5 = (id)MEMORY[0x1E0C9AA60];
  }
  else
  {
    -[PGAbstractSuggester session](self, "session");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "loggingConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGLandscapeWallpaperSuggester fetchCandidateAssets](self, "fetchCandidateAssets");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v6;
    if (objc_msgSend(v4, "isCancelledWithProgress:", 0.2))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 279;
        *(_WORD *)&buf[8] = 2080;
        *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v5 = (id)MEMORY[0x1E0C9AA60];
    }
    else
    {
      v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v8 = v6;
      v9 = os_signpost_id_generate(v8);
      v10 = v8;
      v11 = v10;
      v50 = v9 - 1;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGLandscapeWallpaperSuggesterFilterCandidates", ", buf, 2u);
      }
      spid = v9;

      info = 0;
      mach_timebase_info(&info);
      v49 = mach_absolute_time();
      v12 = objc_msgSend(v56, "count");
      v55 = v12;
      v13 = v12 + 199;
      v90 = 0u;
      memset(v91, 0, 28);
      v88 = 0u;
      v89 = 0u;
      v86 = 0u;
      v87 = 0u;
      memset(buf, 0, sizeof(buf));
      v74 = 0u;
      memset(v75, 0, 28);
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      objc_msgSend(v57, "curationContext");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      if (v13 >= 0xC8)
      {
        v26 = 0;
        v52 = v13 / 0xC8;
        v27 = 1.0 / (double)(v13 / 0xC8) * 0.8;
        *(_QWORD *)&v15 = 134218240;
        v47 = v15;
        oslog = v11;
        v54 = v4;
        while (1)
        {
          context = (void *)MEMORY[0x1CAA4EB2C]();
          v60 = v26;
          objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndexesInRange:", v47, spid);
          v58 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "objectsAtIndexes:");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = (void *)MEMORY[0x1E0CD1390];
          objc_msgSend(v57, "curationContext");
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "prefetchOnAssets:options:curationContext:", v28, 14, v30);

          v66 = 0u;
          v67 = 0u;
          v64 = 0u;
          v65 = 0u;
          obj = v28;
          v31 = off_1E83FA000;
          v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
          if (v63)
          {
            v62 = *(_QWORD *)v65;
            do
            {
              for (i = 0; i != v63; ++i)
              {
                if (*(_QWORD *)v65 != v62)
                  objc_enumerationMutation(obj);
                v33 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
                v34 = (void *)MEMORY[0x1CAA4EB2C]();
                v35 = (void *)objc_msgSend(objc_alloc(v31[307]), "initWithAsset:", v33);
                v36 = (void *)objc_opt_class();
                -[PGLandscapeWallpaperSuggester primaryFilteringContext](self, "primaryFilteringContext");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                LODWORD(v36) = objc_msgSend(v36, "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v35, v37, v14, self->_peopleSceneConfidenceThresholdHelper, buf);

                if ((_DWORD)v36)
                {
                  -[PGLandscapeWallpaperSuggester secondaryFilteringContext](self, "secondaryFilteringContext");
                  v38 = objc_claimAutoreleasedReturnValue();
                  if (!v38)
                    goto LABEL_38;
                  v39 = (void *)v38;
                  v40 = (void *)objc_opt_class();
                  -[PGLandscapeWallpaperSuggester secondaryFilteringContext](self, "secondaryFilteringContext");
                  v41 = v7;
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  LODWORD(v40) = objc_msgSend(v40, "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v35, v42, v14, self->_peopleSceneConfidenceThresholdHelper, &v68);

                  v7 = v41;
                  v31 = off_1E83FA000;

                  if ((_DWORD)v40)
LABEL_38:
                    objc_msgSend(v7, "addObject:", v35);
                }

                objc_autoreleasePoolPop(v34);
              }
              v63 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v64, v84, 16);
            }
            while (v63);
          }

          v11 = oslog;
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            v43 = oslog;
            v44 = objc_msgSend(v58, "firstIndex");
            v45 = objc_msgSend(v58, "lastIndex");
            *(_DWORD *)v77 = v47;
            *(_QWORD *)&v77[4] = v44;
            *(_WORD *)&v77[12] = 2048;
            *(_QWORD *)&v77[14] = v45;
            _os_log_debug_impl(&dword_1CA237000, v43, OS_LOG_TYPE_DEBUG, "[PGLandscapeWallpaperSuggester] processed candidates from %lu to %lu", v77, 0x16u);

          }
          v4 = v54;
          if (objc_msgSend(v54, "isCancelledWithProgress:", v27 * (double)v60 + 0.2))
            break;

          objc_autoreleasePoolPop(context);
          v26 = v60 + 1;
          if (v60 + 1 == v52)
            goto LABEL_13;
        }
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v77 = 67109378;
          *(_DWORD *)&v77[4] = 313;
          *(_WORD *)&v77[8] = 2080;
          *(_QWORD *)&v77[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/Suggesters/Autobahn/PGLandscapeWallpaperSuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v77, 0x12u);
        }

        objc_autoreleasePoolPop(context);
        v5 = (id)MEMORY[0x1E0C9AA60];
      }
      else
      {
LABEL_13:
        v16 = v14;
        v17 = v7;
        v18 = mach_absolute_time();
        numer = info.numer;
        denom = info.denom;
        v21 = v11;
        v22 = v21;
        if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
        {
          *(_WORD *)v77 = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v22, OS_SIGNPOST_INTERVAL_END, spid, "PGLandscapeWallpaperSuggesterFilterCandidates", ", v77, 2u);
        }

        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v77 = 136315394;
          *(_QWORD *)&v77[4] = "PGLandscapeWallpaperSuggesterFilterCandidates";
          *(_WORD *)&v77[12] = 2048;
          *(double *)&v77[14] = (float)((float)((float)((float)(v18 - v49) * (float)numer) / (float)denom) / 1000000.0);
          _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v77, 0x16u);
        }
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v77 = 67109120;
          *(_DWORD *)&v77[4] = v55;
          _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Found %d positive landscape assets", v77, 8u);
        }
        v23 = v22;
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          v24 = objc_msgSend(v17, "count");
          *(_DWORD *)v77 = 67109120;
          *(_DWORD *)&v77[4] = v24;
          _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Found %d candidates after postfiltering", v77, 8u);
        }

        v82 = v90;
        v83[0] = v91[0];
        *(_OWORD *)((char *)v83 + 12) = *(_OWORD *)((char *)v91 + 12);
        v78 = v86;
        v79 = v87;
        v80 = v88;
        v81 = v89;
        *(_OWORD *)v77 = *(_OWORD *)buf;
        *(_OWORD *)&v77[16] = *(_OWORD *)&buf[16];
        -[PGLandscapeWallpaperSuggester logPosterFilteringStatistics:](self, "logPosterFilteringStatistics:", v77);
        -[PGLandscapeWallpaperSuggester secondaryFilteringContext](self, "secondaryFilteringContext");
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v77 = 0;
            _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Secondary filtering...", v77, 2u);
          }
          v82 = v74;
          v83[0] = v75[0];
          *(_OWORD *)((char *)v83 + 12) = *(_OWORD *)((char *)v75 + 12);
          v78 = v70;
          v79 = v71;
          v80 = v72;
          v81 = v73;
          *(_OWORD *)v77 = v68;
          *(_OWORD *)&v77[16] = v69;
          -[PGLandscapeWallpaperSuggester logPosterFilteringStatistics:](self, "logPosterFilteringStatistics:", v77);
        }
        if (*(int *)&buf[4] >= 1)
          objc_msgSend(MEMORY[0x1E0D77E10], "logInfo:prefix:avoidForKeyAssetStatistics:", v23, CFSTR("[PGLandscapeWallpaperSuggester]"), (char *)&v86 + 12);
        v7 = v17;
        v5 = v17;
        v14 = v16;
      }

    }
  }

  return v5;
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
    _os_log_impl(&dword_1CA237000, v5, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Filtered out %d for isUtility, %d for avoidForKeyAsset, %d for aesthetics, %d for wallpaper score, %d for clock overlap, %d for low resolution, %d for crop score, %d for not safe for display, %d for positive people scene, %d for low light, %d for sensitive location", (uint8_t *)v17, 0x44u);
  }

}

- (id)sortedDedupedCandidatesFromCandidates:(id)a3
{
  id v4;
  NSObject *v5;
  os_signpost_id_t v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint32_t numer;
  uint32_t denom;
  NSObject *v39;
  NSObject *v40;
  os_signpost_id_t spid;
  uint64_t v43;
  NSObject *v44;
  unint64_t v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  id obj;
  uint64_t v51;
  uint64_t v52;
  void *v53;
  uint64_t v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v65;
  __int16 v66;
  double v67;
  _BYTE v68[128];
  _BYTE v69[128];
  _QWORD v70[8];

  v70[5] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGAbstractSuggester session](self, "session");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "loggingConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v6 = os_signpost_id_generate(v5);
  v7 = v5;
  v8 = v7;
  v45 = v6 - 1;
  if (v6 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v7))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v8, OS_SIGNPOST_INTERVAL_BEGIN, v6, "PGLandscapeWallpaperSuggesterDedupeAndRank", ", buf, 2u);
  }
  spid = v6;

  info = 0;
  mach_timebase_info(&info);
  v43 = mach_absolute_time();
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", &__block_literal_global_278);
  -[PGLandscapeWallpaperSuggester primaryFilteringContext](self, "primaryFilteringContext");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "timeIntervalForCandidateDeduping");
  objc_msgSend(v9, "setMaximumDistance:");

  objc_msgSend(v9, "setMinimumNumberOfObjects:", 1);
  v46 = v9;
  v48 = v4;
  objc_msgSend(v9, "performWithDataset:progressBlock:", v4, &__block_literal_global_279);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    v12 = v8;
    v13 = objc_msgSend(v11, "count");
    *(_DWORD *)buf = 134217984;
    v65 = (const char *)v13;
    _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Deduped to %lu clusters", buf, 0xCu);

  }
  v44 = v8;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.favorite"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v70[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.mediaAnalysisProperties.wallpaperScore"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v70[1] = v15;
  v16 = (void *)MEMORY[0x1E0D77F20];
  -[PGLandscapeWallpaperSuggester primaryFilteringContext](self, "primaryFilteringContext");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "cropScoreSortDescriptorForOrientation:", objc_msgSend(v17, "orientation"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v70[2] = v18;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.creationDate"), 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v70[3] = v19;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("asset.uuid"), 1);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v70[4] = v20;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v70, 5);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  v49 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v62 = 0u;
  obj = v11;
  v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
  if (v52)
  {
    v51 = *(_QWORD *)v60;
    do
    {
      for (i = 0; i != v52; ++i)
      {
        if (*(_QWORD *)v60 != v51)
          objc_enumerationMutation(obj);
        v23 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * i);
        v24 = (void *)MEMORY[0x1CAA4EB2C]();
        v55 = 0u;
        v56 = 0u;
        v57 = 0u;
        v58 = 0u;
        objc_msgSend(v23, "objects");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
        if (!v26)
        {
          v28 = v25;
          goto LABEL_21;
        }
        v27 = v26;
        v53 = v24;
        v54 = i;
        v28 = 0;
        v29 = *(_QWORD *)v56;
        do
        {
          v30 = 0;
          v31 = v28;
          do
          {
            if (*(_QWORD *)v56 != v29)
              objc_enumerationMutation(v25);
            objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *(_QWORD *)(*((_QWORD *)&v55 + 1) + 8 * v30), v31, 0);
            v32 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v32, "sortedArrayUsingDescriptors:", v21);
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v33, "firstObject");
            v28 = (void *)objc_claimAutoreleasedReturnValue();

            ++v30;
            v31 = v28;
          }
          while (v27 != v30);
          v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v55, v68, 16);
        }
        while (v27);

        v24 = v53;
        i = v54;
        if (v28)
        {
          objc_msgSend(v49, "addObject:", v28);
LABEL_21:

        }
        objc_autoreleasePoolPop(v24);
      }
      v52 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    }
    while (v52);
  }

  objc_msgSend(v49, "sortUsingDescriptors:", v21);
  v34 = v44;
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    v35 = objc_msgSend(v49, "count");
    *(_DWORD *)buf = 134217984;
    v65 = (const char *)v35;
    _os_log_impl(&dword_1CA237000, v34, OS_LOG_TYPE_INFO, "[PGLandscapeWallpaperSuggester] Ranked & deduped to %lu candidates", buf, 0xCu);
  }

  v36 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v39 = v34;
  v40 = v39;
  if (v45 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v40, OS_SIGNPOST_INTERVAL_END, spid, "PGLandscapeWallpaperSuggesterDedupeAndRank", ", buf, 2u);
  }

  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v65 = "PGLandscapeWallpaperSuggesterDedupeAndRank";
    v66 = 2048;
    v67 = (float)((float)((float)((float)(v36 - v43) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

  return v49;
}

- (PGLandscapeWallpaperSuggesterFilteringContext)primaryFilteringContext
{
  return self->_primaryFilteringContext;
}

- (void)setPrimaryFilteringContext:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFilteringContext, a3);
}

- (PGLandscapeWallpaperSuggesterFilteringContext)secondaryFilteringContext
{
  return self->_secondaryFilteringContext;
}

- (void)setSecondaryFilteringContext:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryFilteringContext, a3);
}

- (PGLandscapeWallpaperSuggesterScoringContext)scoringContext
{
  return self->_scoringContext;
}

- (void)setScoringContext:(id)a3
{
  objc_storeStrong((id *)&self->_scoringContext, a3);
}

- (PGLandscapeWallpaperSuggesterDistancingContext)distancingContext
{
  return self->_distancingContext;
}

- (void)setDistancingContext:(id)a3
{
  objc_storeStrong((id *)&self->_distancingContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_distancingContext, 0);
  objc_storeStrong((id *)&self->_scoringContext, 0);
  objc_storeStrong((id *)&self->_secondaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_primaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_peopleSceneConfidenceThresholdHelper, 0);
  objc_storeStrong((id *)&self->_assetGater, 0);
}

double __71__PGLandscapeWallpaperSuggester_sortedDedupedCandidatesFromCandidates___block_invoke(uint64_t a1, void *a2, void *a3)
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

uint64_t __65__PGLandscapeWallpaperSuggester_suggestionsWithOptions_progress___block_invoke(uint64_t a1, double a2)
{
  uint64_t v2;
  uint64_t result;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v2 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:", *(double *)(a1 + 48) * a2 + 0.9);
    v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v2 + 24) = result;
  return result;
}

+ (id)suggestionTypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 6);
}

+ (id)suggestionSubtypes
{
  return (id)objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", 654);
}

+ (BOOL)filtersForTopSuggestions
{
  return 0;
}

+ (BOOL)filtersForAmbientSuggestions
{
  return 0;
}

+ (id)prefilteringInternalPredicateWithForbiddenAssetUUIDs:(id)a3
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[4];

  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("kind"), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v5);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != %d"), CFSTR("kindSubtype"), 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.%K > %d"), CFSTR("additionalAttributes"), CFSTR("faceAnalysisVersion"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v7);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count == %d"), CFSTR("detectedFaces"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v8);
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("playbackStyle"), &unk_1E84E94F0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v9);
  if (objc_msgSend(v3, "count"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT (%K IN %@)"), CFSTR("uuid"), v3);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v10);

  }
  v11 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 32000;
  v12 = (void *)MEMORY[0x1E0D78200];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __86__PGLandscapeWallpaperSuggester_prefilteringInternalPredicateWithForbiddenAssetUUIDs___block_invoke;
  v17[3] = &unk_1E8427608;
  v19 = v20;
  v13 = v11;
  v18 = v13;
  objc_msgSend(v12, "enumerateModelsAscending:usingBlock:", 0, v17);
  objc_msgSend(MEMORY[0x1E0CB3528], "orPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v14);
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(v20, 8);
  return v15;
}

+ (id)candidatesFromAssets:(id)a3
{
  id v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  PGLandscapeWallpaperSuggestionCandidate *v11;
  PGLandscapeWallpaperSuggestionCandidate *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v9);
        v11 = [PGLandscapeWallpaperSuggestionCandidate alloc];
        v12 = -[PGLandscapeWallpaperSuggestionCandidate initWithAsset:](v11, "initWithAsset:", v10, (_QWORD)v14);
        objc_msgSend(v4, "addObject:", v12);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v7);
  }

  return v4;
}

+ (BOOL)isPositiveLandscapeAsset:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  void *i;
  void *v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "clsSceneClassifications");
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v4);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v8, "extendedSceneIdentifier", (_QWORD)v12) == 2147481597)
        {
          objc_msgSend(v3, "curationModel");
          v5 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "cityNatureModel");
          v9 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v9, "natureNode");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          LOBYTE(v5) = objc_msgSend(v10, "passesHighPrecisionWithSignal:", v8);

          goto LABEL_11;
        }
      }
      v5 = (void *)objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v5)
        continue;
      break;
    }
  }
LABEL_11:

  return (char)v5;
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
  int v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  float v25;
  double v26;
  BOOL v27;
  void *v28;
  int v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  int *p_var6;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  void *v45;
  float v46;
  double v47;
  void *v49;
  _BOOL4 v50;

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
    v20 = objc_msgSend((id)objc_opt_class(), "filtersForAmbientSuggestions");
    objc_msgSend(v19, "landscapeNode");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v20)
      objc_msgSend(v21, "highRecallOperatingPoint");
    else
      objc_msgSend(v21, "highPrecisionOperatingPoint");
    v18 = v23;

  }
  objc_msgSend(v15, "mediaAnalysisProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "wallpaperScore");
  v26 = v25;

  if (v18 > v26)
  {
    v27 = 0;
    ++a7->var3;
    goto LABEL_31;
  }
  objc_msgSend(v13, "userFeedbackCalculator");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = objc_msgSend(v16, "isUtilityForMemoriesWithAsset:userFeedbackCalculator:", v15, v28);

  if (v29)
  {
    v27 = 0;
    ++a7->var0;
    goto LABEL_31;
  }
  if (objc_msgSend(v16, "avoidIfPossibleForKeyAssetWithAsset:statistics:", v15, &a7->var11))
  {
    v27 = 0;
    ++a7->var1;
    goto LABEL_31;
  }
  if ((objc_msgSend(v16, "isAestheticallyPrettyGoodWithAsset:", v15) & 1) == 0)
  {
    v27 = 0;
    ++a7->var2;
    goto LABEL_31;
  }
  if ((objc_msgSend(v12, "bypassCropScoreCheck") & 1) == 0)
  {
    objc_msgSend(v11, "cropResult");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "cropForOrientation:", objc_msgSend(v12, "orientation"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v12, "ignoreClockOverlap") & 1) != 0 || objc_msgSend(v31, "passesClockOverlap"))
    {
      objc_msgSend(v31, "cropZoomRatio");
      v33 = v32;
      objc_msgSend(v12, "maximumCropZoomRatio");
      if (v33 <= v34)
      {
        objc_msgSend(v31, "cropScore");
        v37 = v36;
        objc_msgSend(v12, "minimumCropScore");
        if (v37 >= v38)
        {

          goto LABEL_14;
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

    v27 = 0;
    goto LABEL_31;
  }
LABEL_14:
  if ((objc_msgSend(MEMORY[0x1E0D77E50], "assetIsSafeForWidgetDisplay:", v15) & 1) != 0)
  {
    if (+[PGWallpaperSuggestionUtilities foundDominantPeopleSceneInAsset:withConfidenceThresholdHelper:](PGWallpaperSuggestionUtilities, "foundDominantPeopleSceneInAsset:withConfidenceThresholdHelper:", v15, v14))
    {
      v27 = 0;
      ++a7->var8;
    }
    else
    {
      objc_msgSend(v12, "maximumLowLightScore");
      v40 = v39;
      if (v39 < 0.0)
      {
        objc_msgSend(v15, "curationModel");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "aestheticsModel");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "lowLightNode");
        v43 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v43, "operatingPoint");
        v40 = v44;

      }
      objc_msgSend(v15, "aestheticProperties");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "lowLight");
      v47 = v46;

      if (v40 >= v47)
      {
        objc_msgSend(v11, "asset");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = +[PGSensitiveLocationBlocklistConfiguration isAssetAtSensitiveLocationAndDate:](PGSensitiveLocationBlocklistConfiguration, "isAssetAtSensitiveLocationAndDate:", v49);

        if (v50)
        {
          v27 = 0;
          ++a7->var10;
        }
        else
        {
          v27 = 1;
        }
      }
      else
      {
        v27 = 0;
        ++a7->var9;
      }
    }
  }
  else
  {
    v27 = 0;
    ++a7->var7;
  }
LABEL_31:

  return v27;
}

+ (BOOL)passesFilteringWithAsset:(id)a3 curationContext:(id)a4 orientation:(int64_t)a5 reason:(id *)a6
{
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  PGLandscapeWallpaperSuggestionCandidate *v20;
  PGLandscapeWallpaperSuggesterFilteringContext *v21;
  uint64_t v22;
  BOOL v23;
  void *v24;
  PGWallpaperSuggestionAssetGater *v25;
  PGWallpaperSuggestionAssetGater *v26;
  __CFString *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v35;
  uint64_t v36;
  PGLandscapeWallpaperSuggestionCandidate *v37;
  void *v38;
  _QWORD v39[3];

  v39[1] = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  if ((objc_msgSend(a1, "isPositiveLandscapeAsset:", v10) & 1) != 0)
  {
    objc_msgSend(v10, "photoLibrary");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "prefilteringInternalPredicateWithForbiddenAssetUUIDs:", 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInternalPredicate:", v13);

    v14 = (void *)MEMORY[0x1E0CD1390];
    objc_msgSend(v10, "localIdentifier");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v15;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "fetchAssetsWithLocalIdentifiers:options:", v16, v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "firstObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v18)
    {
      v23 = 0;
      if (a6)
        *a6 = CFSTR("Fails Predicate");
      goto LABEL_29;
    }
    v19 = objc_msgSend((id)objc_opt_class(), "filtersForTopSuggestions");
    v20 = -[PGLandscapeWallpaperSuggestionCandidate initWithAsset:]([PGLandscapeWallpaperSuggestionCandidate alloc], "initWithAsset:", v10);
    v21 = [PGLandscapeWallpaperSuggesterFilteringContext alloc];
    if ((v19 & 1) != 0)
      v22 = -[PGLandscapeWallpaperSuggesterFilteringContext initForTopLandscapesInOrientation:](v21, "initForTopLandscapesInOrientation:", a5);
    else
      v22 = -[PGLandscapeWallpaperSuggesterFilteringContext initForLandscapesInOrientation:](v21, "initForLandscapesInOrientation:", a5);
    v24 = (void *)v22;
    +[PGWallpaperSuggestionUtilities peopleSceneConfidenceThresholdHelper](PGWallpaperSuggestionUtilities, "peopleSceneConfidenceThresholdHelper");
    v36 = objc_claimAutoreleasedReturnValue();
    v37 = v20;
    if ((objc_msgSend(a1, "candidate:passesFilteringWithContext:curationContext:thresholdHelper:statistics:", v20, v24, v11) & 1) != 0)
    {
      if (v19)
      {
        v25 = [PGWallpaperSuggestionAssetGater alloc];
        v26 = -[PGWallpaperSuggestionAssetGater initWithType:loggingConnection:](v25, "initWithType:loggingConnection:", 3, MEMORY[0x1E0C81028]);
        v23 = 1;
        -[PGWallpaperSuggestionAssetGater setCoversTracks:](v26, "setCoversTracks:", 1);
        -[PGWallpaperSuggestionAssetGater setIsUserInitiated:](v26, "setIsUserInitiated:", 1);
        -[PGWallpaperSuggestionAssetGater gateAsset:progressBlock:](v26, "gateAsset:progressBlock:", v10, &__block_literal_global_218);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v35, "passesAnyGating") & 1) != 0)
        {
          v27 = CFSTR("Pass Segmented");
        }
        else
        {
          -[PGLandscapeWallpaperSuggestionCandidate cropResult](v20, "cropResult");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v28, "cropForOrientation:", a5);
          v29 = (void *)objc_claimAutoreleasedReturnValue();

          if ((objc_msgSend(v24, "ignoreClockOverlap") & 1) != 0
            || objc_msgSend(v29, "passesClockOverlap"))
          {
            objc_msgSend(v29, "cropScore");
            v31 = v30;
            objc_msgSend(v24, "minimumCropScore");
            v23 = v31 >= v32;
            if (v31 < v32)
              v27 = CFSTR("Low Crop Score");
            else
              v27 = CFSTR("Pass Unsegmented");
          }
          else
          {
            v23 = 0;
            v27 = CFSTR("Clock Overlap");
          }

        }
      }
      else
      {
        v27 = CFSTR("Pass");
        v23 = 1;
      }
      v33 = (void *)v36;
      if (!a6)
        goto LABEL_28;
    }
    else
    {
      if (!a6)
      {
        v23 = 0;
        v33 = (void *)v36;
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      v23 = 0;
      v27 = CFSTR("Unknown Reason");
      v33 = (void *)v36;
    }
    *a6 = v27;
    goto LABEL_28;
  }
  v23 = 0;
  if (a6)
    *a6 = CFSTR("Not Landscape");
LABEL_30:

  return v23;
}

void __86__PGLandscapeWallpaperSuggester_prefilteringInternalPredicateWithForbiddenAssetUUIDs___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  id v10;

  v3 = (void *)MEMORY[0x1E0CB3880];
  v4 = a2;
  v5 = objc_msgSend(v4, "version");
  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(v4, "natureNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "highPrecisionOperatingPoint");
  objc_msgSend(v3, "predicateWithFormat:", CFSTR("SUBQUERY(additionalAttributes, $a, $a.sceneAnalysisVersion >= %d AND $a.sceneAnalysisVersion < %d AND SUBQUERY($a.sceneClassifications, $s, $s.sceneIdentifier = %d AND $s.confidence >= %f).@count != 0).@count != 0"), v5, v6, 2147481597, v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);
  v9 = objc_msgSend(v4, "version");

  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
}

@end
