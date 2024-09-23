@implementation PGSinglePersonWallpaperAssetSuggester

- (PGSinglePersonWallpaperAssetSuggester)initWithPersonLocalIdentifiers:(id)a3 curationContext:(id)a4 loggingConnection:(id)a5
{
  id v9;
  id v10;
  id v11;
  PGSinglePersonWallpaperAssetSuggester *v12;
  PGSinglePersonWallpaperAssetSuggester *v13;
  PGSinglePersonWallpaperAssetSuggesterScoringContext *v14;
  PGSinglePersonWallpaperAssetSuggesterScoringContext *scoringContext;
  PGSinglePersonWallpaperAssetSuggesterDistancingContext *v16;
  PGSinglePersonWallpaperAssetSuggesterDistancingContext *distancingContext;
  objc_super v19;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v19.receiver = self;
  v19.super_class = (Class)PGSinglePersonWallpaperAssetSuggester;
  v12 = -[PGSinglePersonWallpaperAssetSuggester init](&v19, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_personLocalIdentifiers, a3);
    objc_storeStrong((id *)&v13->_curationContext, a4);
    objc_storeStrong((id *)&v13->_loggingConnection, a5);
    v14 = objc_alloc_init(PGSinglePersonWallpaperAssetSuggesterScoringContext);
    scoringContext = v13->_scoringContext;
    v13->_scoringContext = v14;

    v16 = objc_alloc_init(PGSinglePersonWallpaperAssetSuggesterDistancingContext);
    distancingContext = v13->_distancingContext;
    v13->_distancingContext = v16;

  }
  return v13;
}

- (id)nextSuggestedAsset
{
  return -[NSEnumerator nextObject](self->_suggestedAssetEnumerator, "nextObject");
}

- (unint64_t)expectedNumberOfSuggestedAssets
{
  return self->_numberOfSuggestedAssets;
}

- (void)computeSuggestedAssetsWithProgress:(id)a3
{
  void *v4;
  double v5;
  char v6;
  NSObject *v7;
  OS_os_log *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  NSSet *personLocalIdentifiers;
  id v14;
  int v15;
  uint64_t v16;
  uint32_t denom;
  uint32_t numer;
  NSObject *v19;
  NSObject *v20;
  double Current;
  char v22;
  OS_os_log *v23;
  os_signpost_id_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint32_t v30;
  uint32_t v31;
  NSObject *v32;
  NSObject *v33;
  void *v34;
  NSEnumerator *v35;
  NSEnumerator *suggestedAssetEnumerator;
  double v37;
  char v38;
  uint64_t v39;
  void *context;
  void *v41;
  id v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  mach_timebase_info v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  mach_timebase_info info;
  uint64_t v55;
  double *v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t *v60;
  uint64_t v61;
  char v62;
  uint8_t buf[4];
  _BYTE v64[18];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v42 = a3;
  v4 = _Block_copy(v42);
  v59 = 0;
  v60 = &v59;
  v61 = 0x2020000000;
  v62 = 0;
  v55 = 0;
  v56 = (double *)&v55;
  v57 = 0x2020000000;
  v58 = 0;
  if (v4
    && (v5 = CFAbsoluteTimeGetCurrent(), v5 - v56[3] >= 0.01)
    && (v56[3] = v5,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v4 + 2))(v4, &info, 0.0),
        v6 = *((_BYTE *)v60 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v60 + 24) = v6) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v64 = 80;
      *(_WORD *)&v64[4] = 2080;
      *(_QWORD *)&v64[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
      v7 = MEMORY[0x1E0C81028];
LABEL_42:
      _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    context = (void *)MEMORY[0x1CAA4EB2C]();
    v8 = self->_loggingConnection;
    v9 = os_signpost_id_generate((os_log_t)v8);
    v10 = v8;
    v11 = v10;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGSinglePersonWallpaperAssetSuggesterCandidateFiltering", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v12 = mach_absolute_time();
    personLocalIdentifiers = self->_personLocalIdentifiers;
    v49[0] = MEMORY[0x1E0C809B0];
    v49[1] = 3221225472;
    v49[2] = __76__PGSinglePersonWallpaperAssetSuggester_computeSuggestedAssetsWithProgress___block_invoke;
    v49[3] = &unk_1E8434F30;
    v14 = v4;
    v50 = v14;
    v51 = &v55;
    v52 = &v59;
    v53 = 0x3F847AE147AE147BLL;
    -[PGSinglePersonWallpaperAssetSuggester unsortedCandidatesFromPersonLocalIdentifiers:progressBlock:](self, "unsortedCandidatesFromPersonLocalIdentifiers:progressBlock:", personLocalIdentifiers, v49);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v60 + 24))
    {
      v15 = 1;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v64 = 87;
        *(_WORD *)&v64[4] = 2080;
        *(_QWORD *)&v64[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      v16 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v19 = v11;
      v20 = v19;
      if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_END, v9, "PGSinglePersonWallpaperAssetSuggesterCandidateFiltering", ", buf, 2u);
      }

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v64 = "PGSinglePersonWallpaperAssetSuggesterCandidateFiltering";
        *(_WORD *)&v64[8] = 2048;
        *(double *)&v64[10] = (float)((float)((float)((float)(v16 - v12) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (v4
        && (Current = CFAbsoluteTimeGetCurrent(), Current - v56[3] >= 0.01)
        && (v56[3] = Current,
            LOBYTE(v48.numer) = 0,
            (*((void (**)(id, mach_timebase_info *, double))v14 + 2))(v14, &v48, 0.5),
            v22 = *((_BYTE *)v60 + 24) | LOBYTE(v48.numer),
            (*((_BYTE *)v60 + 24) = v22) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v64 = 90;
          *(_WORD *)&v64[4] = 2080;
          *(_QWORD *)&v64[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v15 = 1;
      }
      else
      {
        v23 = self->_loggingConnection;
        v24 = os_signpost_id_generate((os_log_t)v23);
        v25 = v23;
        v26 = v25;
        if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v25))
        {
          *(_WORD *)buf = 0;
          _os_signpost_emit_with_name_impl(&dword_1CA237000, v26, OS_SIGNPOST_INTERVAL_BEGIN, v24, "PGSinglePersonWallpaperAssetSuggesterCandidateDeduping", ", buf, 2u);
        }

        v48 = 0;
        mach_timebase_info(&v48);
        v27 = mach_absolute_time();
        v43[0] = MEMORY[0x1E0C809B0];
        v43[1] = 3221225472;
        v43[2] = __76__PGSinglePersonWallpaperAssetSuggester_computeSuggestedAssetsWithProgress___block_invoke_155;
        v43[3] = &unk_1E8434F30;
        v44 = v14;
        v45 = &v55;
        v46 = &v59;
        v47 = 0x3F847AE147AE147BLL;
        -[PGSinglePersonWallpaperAssetSuggester _sortedDedupedCandidatesFromCandidates:progressBlock:](self, "_sortedDedupedCandidatesFromCandidates:progressBlock:", v41, v43);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (*((_BYTE *)v60 + 24))
        {
          v15 = 1;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v64 = 96;
            *(_WORD *)&v64[4] = 2080;
            *(_QWORD *)&v64[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
        else
        {
          v29 = v27;
          v39 = mach_absolute_time();
          v31 = v48.numer;
          v30 = v48.denom;
          v32 = v26;
          v33 = v32;
          if (v24 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
          {
            *(_WORD *)buf = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v33, OS_SIGNPOST_INTERVAL_END, v24, "PGSinglePersonWallpaperAssetSuggesterCandidateDeduping", ", buf, 2u);
          }

          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 136315394;
            *(_QWORD *)v64 = "PGSinglePersonWallpaperAssetSuggesterCandidateDeduping";
            *(_WORD *)&v64[8] = 2048;
            *(double *)&v64[10] = (float)((float)((float)((float)(v39 - v29) * (float)v31) / (float)v30) / 1000000.0);
            _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
          }
          -[PGSinglePersonWallpaperAssetSuggester assetsFromCandidates:](self, "assetsFromCandidates:", v28, v39, context);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "objectEnumerator");
          v35 = (NSEnumerator *)objc_claimAutoreleasedReturnValue();
          suggestedAssetEnumerator = self->_suggestedAssetEnumerator;
          self->_suggestedAssetEnumerator = v35;

          v15 = 0;
          self->_numberOfSuggestedAssets = objc_msgSend(v28, "count");
        }

      }
    }

    objc_autoreleasePoolPop(context);
    if (v4)
    {
      if (!v15)
      {
        v37 = CFAbsoluteTimeGetCurrent();
        if (v37 - v56[3] >= 0.01)
        {
          v56[3] = v37;
          LOBYTE(info.numer) = 0;
          (*((void (**)(id, mach_timebase_info *, double))v14 + 2))(v14, &info, 1.0);
          v38 = *((_BYTE *)v60 + 24) | LOBYTE(info.numer);
          *((_BYTE *)v60 + 24) = v38;
          if (v38)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v64 = 103;
              *(_WORD *)&v64[4] = 2080;
              *(_QWORD *)&v64[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
              v7 = MEMORY[0x1E0C81028];
              goto LABEL_42;
            }
          }
        }
      }
    }
  }
  _Block_object_dispose(&v55, 8);
  _Block_object_dispose(&v59, 8);

}

- (id)unsortedCandidatesFromPersonLocalIdentifiers:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _OWORD *, double);
  double v8;
  double Current;
  id v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  BOOL v16;
  double v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  OS_os_log *v29;
  os_signpost_id_t v30;
  NSObject *v31;
  NSObject *v32;
  uint64_t v33;
  uint64_t v34;
  mach_timebase_info v35;
  NSObject *v36;
  NSObject *v37;
  _BOOL4 v38;
  NSObject *v39;
  NSObject *loggingConnection;
  void *v41;
  NSObject *v42;
  int v43;
  double v44;
  void *v45;
  void *v46;
  void *v47;
  unint64_t v48;
  unint64_t v49;
  double v50;
  double v51;
  unint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  double v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t j;
  void *v70;
  void *v71;
  void *v72;
  NSSet *forbiddenAssetUUIDs;
  void *v74;
  NSObject *v75;
  PGSinglePersonWallpaperAssetCandidate *v76;
  void *v77;
  double v78;
  unint64_t v79;
  NSObject *v80;
  void *v81;
  NSObject *v82;
  int v83;
  void *v84;
  NSObject *v85;
  NSObject *v86;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  id v93;
  NSObject *log;
  void (**v95)(void *, _OWORD *, double);
  void *v96;
  void *v97;
  unint64_t v98;
  void *v99;
  id v100;
  void *v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  char v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  mach_timebase_info info;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _BYTE v121[32];
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  _BYTE v129[128];
  uint8_t buf[32];
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  _QWORD v138[2];
  _BYTE v139[128];
  uint64_t v140;

  v140 = *MEMORY[0x1E0C80C00];
  v93 = a3;
  v6 = a4;
  v7 = (void (**)(void *, _OWORD *, double))_Block_copy(v6);
  v8 = 0.0;
  v90 = v6;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(v107) = 0;
      v7[2](v7, &v107, 0.0);
      if ((_BYTE)v107)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 172;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (id)MEMORY[0x1E0C9AA60];
        goto LABEL_103;
      }
      v8 = Current;
    }
  }
  -[CLSCurationContext photoLibrary](self->_curationContext, "photoLibrary");
  v89 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "librarySpecificFetchOptions");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  PFDeviceScreenSize();
  v14 = v12;
  v15 = v13;
  if (v12 == 0.0
    || v13 == 0.0
    || (v12 == *MEMORY[0x1E0D71130] ? (v16 = v13 == *(double *)(MEMORY[0x1E0D71130] + 8)) : (v16 = 0), v16))
  {
    v17 = 1.0;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 134218496;
      *(double *)&buf[4] = v14;
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = v15;
      *(_WORD *)&buf[22] = 2048;
      *(_QWORD *)&buf[24] = 0x3FF0000000000000;
      _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[Performance] %s: %f ms", buf, 0x20u);
    }
  }
  else
  {
    v17 = fabs(v12 / v13);
  }
  objc_msgSend(v11, "setChunkSizeForFetch:", 200);
  v91 = v11;
  objc_msgSend(v11, "setCacheSizeForFetch:", 200);
  objc_msgSend((id)objc_opt_class(), "prefilteringInternalPredicateWithContext:forTargetAspectRatio:", self->_primaryFilteringContext, v17);
  v92 = (void *)objc_claimAutoreleasedReturnValue();
  v100 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v117 = 0u;
  v118 = 0u;
  v119 = 0u;
  v120 = 0u;
  v18 = v93;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v117, v139, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v118;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v118 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v117 + 1) + 8 * i));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        if (v23)
          objc_msgSend(v100, "addObject:", v23);

      }
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v117, v139, 16);
    }
    while (v20);
  }

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K in %@"), CFSTR("personForFace.personUUID"), v100);
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CB3528];
  v88 = (void *)v24;
  v138[0] = v24;
  v138[1] = v92;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v138, 2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "andPredicateWithSubpredicates:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v91;
  objc_msgSend(v91, "setInternalPredicate:", v27);

  v29 = self->_loggingConnection;
  v30 = os_signpost_id_generate((os_log_t)v29);
  v31 = v29;
  v32 = v31;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v32, OS_SIGNPOST_INTERVAL_BEGIN, v30, "PGSinglePersonWallpaperAssetSuggesterFaceFetch", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v33 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesWithOptions:", v91);
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = mach_absolute_time();
  v35 = info;
  v36 = v32;
  v37 = v36;
  log = v36;
  if (v30 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v38 = os_signpost_enabled(v36);
    v37 = log;
    if (v38)
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, log, OS_SIGNPOST_INTERVAL_END, v30, "PGSinglePersonWallpaperAssetSuggesterFaceFetch", ", buf, 2u);
      v37 = log;
    }
  }
  v39 = v37;

  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)&buf[4] = "PGSinglePersonWallpaperAssetSuggesterFaceFetch";
    *(_WORD *)&buf[12] = 2048;
    *(double *)&buf[14] = (float)((float)((float)((float)(v34 - v33) * (float)v35.numer) / (float)v35.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, log, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  loggingConnection = self->_loggingConnection;
  v41 = v97;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v42 = loggingConnection;
    v43 = objc_msgSend(v97, "count");
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = v43;
    _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_INFO, "[PGSinglePersonWallpaperAssetSuggester] Found %d candidates after prefiltering", buf, 8u);

  }
  if (v7)
  {
    v44 = CFAbsoluteTimeGetCurrent();
    if (v44 - v8 >= 0.01)
    {
      LOBYTE(v107) = 0;
      v7[2](v7, &v107, 0.2);
      if ((_BYTE)v107)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 202;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = (id)MEMORY[0x1E0C9AA60];
        v46 = v88;
        v45 = v89;
        goto LABEL_102;
      }
      v8 = v44;
    }
  }
  v101 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v97, "count"));
  v136 = 0u;
  v137 = 0u;
  v134 = 0u;
  v135 = 0u;
  v132 = 0u;
  v133 = 0u;
  v131 = 0u;
  memset(buf, 0, sizeof(buf));
  v114 = 0u;
  v115 = 0u;
  v112 = 0u;
  v113 = 0u;
  v110 = 0u;
  v111 = 0u;
  v108 = 0u;
  v109 = 0u;
  v107 = 0u;
  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "arrayByAddingObject:", *MEMORY[0x1E0CD1A10]);
  v96 = (void *)objc_claimAutoreleasedReturnValue();

  v48 = objc_msgSend(v97, "count");
  if (!objc_msgSend(v97, "count"))
    goto LABEL_78;
  v49 = 0;
  v50 = 0.75 / (double)v48;
  v51 = 0.2;
  v52 = 0x1E0CD1000uLL;
  v95 = v7;
LABEL_45:
  v53 = (void *)MEMORY[0x1CAA4EB2C]();
  v54 = (void *)MEMORY[0x1E0CB36B8];
  v55 = objc_msgSend(v41, "count");
  if (v55 - v49 >= 0xC8)
    v56 = 200;
  else
    v56 = v55 - v49;
  objc_msgSend(v54, "indexSetWithIndexesInRange:", v49, v56);
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "objectsAtIndexes:", v57);
  v58 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(v52 + 912), "fetchAssetsGroupedByFaceUUIDForFaces:fetchPropertySets:", v58, v96);
  v59 = (void *)objc_claimAutoreleasedReturnValue();
  v60 = v51 + v50 * 0.3;
  if (v7)
  {
    v61 = CFAbsoluteTimeGetCurrent();
    if (v61 - v8 >= 0.01)
    {
      v106 = 0;
      ((void (**)(void *, char *, double))v7)[2](v7, &v106, v60);
      if (v106)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v121 = 67109378;
          *(_DWORD *)&v121[4] = 217;
          *(_WORD *)&v121[8] = 2080;
          *(_QWORD *)&v121[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
          v86 = MEMORY[0x1E0C81028];
          goto LABEL_99;
        }
        goto LABEL_100;
      }
      v8 = v61;
    }
  }
  v62 = *(void **)(v52 + 912);
  objc_msgSend(v59, "allValues");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "prefetchOnAssets:options:curationContext:", v63, 14, self->_curationContext);

  v64 = v60 + v50 * 0.3;
  if (!v7)
    goto LABEL_56;
  v65 = CFAbsoluteTimeGetCurrent();
  if (v65 - v8 < 0.01)
    goto LABEL_56;
  v106 = 0;
  ((void (**)(void *, char *, double))v7)[2](v7, &v106, v64);
  if (!v106)
  {
    v8 = v65;
LABEL_56:
    v98 = v49;
    v99 = v53;
    v104 = 0u;
    v105 = 0u;
    v102 = 0u;
    v103 = 0u;
    v58 = v58;
    v66 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v102, v129, 16);
    if (!v66)
      goto LABEL_72;
    v67 = v66;
    v68 = *(_QWORD *)v103;
    while (1)
    {
      for (j = 0; j != v67; ++j)
      {
        if (*(_QWORD *)v103 != v68)
          objc_enumerationMutation(v58);
        v70 = *(void **)(*((_QWORD *)&v102 + 1) + 8 * j);
        objc_msgSend(v70, "uuid");
        v71 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v59, "objectForKeyedSubscript:", v71);
        v72 = (void *)objc_claimAutoreleasedReturnValue();

        if (v72)
        {
          forbiddenAssetUUIDs = self->_forbiddenAssetUUIDs;
          objc_msgSend(v72, "uuid");
          v74 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(forbiddenAssetUUIDs) = -[NSSet containsObject:](forbiddenAssetUUIDs, "containsObject:", v74);

          if ((_DWORD)forbiddenAssetUUIDs)
          {
            v75 = self->_loggingConnection;
            if (!os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
              goto LABEL_70;
            v76 = v75;
            objc_msgSend(v72, "uuid");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)v121 = 138412290;
            *(_QWORD *)&v121[4] = v77;
            _os_log_impl(&dword_1CA237000, &v76->super, OS_LOG_TYPE_INFO, "[PGSinglePersonWallpaperAssetSuggester] Avoiding asset %@ because it has been rejected by the user", v121, 0xCu);

            goto LABEL_69;
          }
          if (objc_msgSend((id)objc_opt_class(), "candidateAsset:andFace:passesPostfilteringWithContext:curationContext:statistics:", v72, v70, self->_primaryFilteringContext, self->_curationContext, buf)&& (!self->_secondaryFilteringContext|| objc_msgSend((id)objc_opt_class(), "candidateAsset:andFace:passesPostfilteringWithContext:curationContext:statistics:", v72, v70, self->_secondaryFilteringContext, self->_curationContext, &v107)))
          {
            v76 = -[PGSinglePersonWallpaperAssetCandidate initWithFace:inAsset:]([PGSinglePersonWallpaperAssetCandidate alloc], "initWithFace:inAsset:", v70, v72);
            objc_msgSend(v101, "addObject:", v76);
LABEL_69:

          }
        }
LABEL_70:

      }
      v67 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v102, v129, 16);
      if (!v67)
      {
LABEL_72:

        v51 = v64 + v50 * 0.4;
        v7 = v95;
        if (v95)
        {
          v78 = CFAbsoluteTimeGetCurrent();
          v41 = v97;
          v79 = v98;
          v53 = v99;
          v52 = 0x1E0CD1000;
          if (v78 - v8 < 0.01)
            goto LABEL_77;
          v106 = 0;
          ((void (**)(void *, char *, double))v95)[2](v95, &v106, v51);
          if (!v106)
          {
            v8 = v78;
            goto LABEL_77;
          }
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v121 = 67109378;
            *(_DWORD *)&v121[4] = 245;
            *(_WORD *)&v121[8] = 2080;
            *(_QWORD *)&v121[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
            v86 = MEMORY[0x1E0C81028];
LABEL_99:
            _os_log_impl(&dword_1CA237000, v86, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v121, 0x12u);
          }
          goto LABEL_100;
        }
        v41 = v97;
        v79 = v98;
        v53 = v99;
        v52 = 0x1E0CD1000;
LABEL_77:

        objc_autoreleasePoolPop(v53);
        v49 = v79 + 200;
        if (v49 >= objc_msgSend(v41, "count"))
        {
LABEL_78:
          v80 = self->_loggingConnection;
          v81 = v101;
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            v82 = v80;
            v83 = objc_msgSend(v101, "count");
            *(_DWORD *)v121 = 67109120;
            *(_DWORD *)&v121[4] = v83;
            _os_log_impl(&dword_1CA237000, v82, OS_LOG_TYPE_INFO, "[PGSinglePersonWallpaperAssetSuggester] Found %d candidates after postfiltering", v121, 8u);

          }
          v126 = v135;
          v127 = v136;
          v128 = v137;
          v122 = v131;
          v123 = v132;
          v124 = v133;
          v125 = v134;
          *(_OWORD *)v121 = *(_OWORD *)buf;
          *(_OWORD *)&v121[16] = *(_OWORD *)&buf[16];
          -[PGSinglePersonWallpaperAssetSuggester logPosterFilteringStatistics:](self, "logPosterFilteringStatistics:", v121);
          -[PGSinglePersonWallpaperAssetSuggester secondaryFilteringContext](self, "secondaryFilteringContext");
          v84 = (void *)objc_claimAutoreleasedReturnValue();

          v28 = v91;
          if (v84)
          {
            v85 = self->_loggingConnection;
            if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v121 = 0;
              _os_log_impl(&dword_1CA237000, v85, OS_LOG_TYPE_INFO, "[PGSinglePersonWallpaperAssetSuggester] Secondary filtering...", v121, 2u);
            }
            v126 = v113;
            v127 = v114;
            v128 = v115;
            v122 = v109;
            v123 = v110;
            v124 = v111;
            v125 = v112;
            *(_OWORD *)v121 = v107;
            *(_OWORD *)&v121[16] = v108;
            -[PGSinglePersonWallpaperAssetSuggester logPosterFilteringStatistics:](self, "logPosterFilteringStatistics:", v121);
          }
          if (*(int *)&buf[4] >= 1)
            objc_msgSend(MEMORY[0x1E0D77E10], "logInfo:prefix:avoidForKeyAssetStatistics:", self->_loggingConnection, CFSTR("[PGSinglePersonWallpaperAssetSuggester]"), &v132);
          v46 = v88;
          v45 = v89;
          if (v7
            && CFAbsoluteTimeGetCurrent() - v8 >= 0.01
            && (v106 = 0, ((void (**)(void *, char *, double))v7)[2](v7, &v106, 1.0), v106))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v121 = 67109378;
              *(_DWORD *)&v121[4] = 259;
              *(_WORD *)&v121[8] = 2080;
              *(_QWORD *)&v121[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v121, 0x12u);
            }
            v10 = (id)MEMORY[0x1E0C9AA60];
          }
          else
          {
            v10 = v101;
          }
          goto LABEL_101;
        }
        goto LABEL_45;
      }
    }
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)v121 = 67109378;
    *(_DWORD *)&v121[4] = 223;
    *(_WORD *)&v121[8] = 2080;
    *(_QWORD *)&v121[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/Suggestions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
    v86 = MEMORY[0x1E0C81028];
    goto LABEL_99;
  }
LABEL_100:
  v46 = v88;
  v45 = v89;

  objc_autoreleasePoolPop(v53);
  v10 = (id)MEMORY[0x1E0C9AA60];
  v28 = v91;
  v81 = v101;
LABEL_101:

LABEL_102:
LABEL_103:

  return v10;
}

- (void)logPosterFilteringStatistics:(id *)a3
{
  void *v5;
  int v6;
  NSObject *loggingConnection;
  _BOOL4 v8;
  int var0;
  int var1;
  int var2;
  int var3;
  int var4;
  int var9;
  int var8;
  int var10;
  int var11;
  const char *v18;
  NSObject *v19;
  uint32_t v20;
  int v21;
  int v22;
  int v23;
  int v24;
  int v25;
  int var5;
  int var6;
  int var7;
  int v29;
  int v30;
  int v31;
  int v32;
  int v33;
  int v34;
  __int16 v35;
  int v36;
  __int16 v37;
  int v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  int v46;
  __int16 v47;
  int v48;
  __int16 v49;
  int v50;
  __int16 v51;
  int v52;
  __int16 v53;
  int v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  -[PGSinglePersonWallpaperAssetSuggester primaryFilteringContext](self, "primaryFilteringContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "bypassCropScoreCheck");

  loggingConnection = self->_loggingConnection;
  v8 = os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO);
  if (v6)
  {
    if (!v8)
      return;
    var0 = a3->var0;
    var1 = a3->var1;
    var2 = a3->var2;
    var3 = a3->var3;
    var4 = a3->var4;
    var8 = a3->var8;
    var9 = a3->var9;
    var10 = a3->var10;
    var11 = a3->var11;
    v33 = 67111168;
    v34 = var0;
    v35 = 1024;
    v36 = var1;
    v37 = 1024;
    v38 = var2;
    v39 = 1024;
    v40 = var3;
    v41 = 1024;
    v42 = var9;
    v43 = 1024;
    v44 = var4;
    v45 = 1024;
    v46 = var8;
    v47 = 1024;
    v48 = var10;
    v49 = 1024;
    v50 = var11;
    v18 = "[PGSinglePersonWallpaperAssetSuggester] Filtered out %d for isUtility, %d for avoidForKeyAsset, %d for aesthet"
          "ics, %d for wallpaper score, %d for aesthetics+wallpaper, %d for face quality, %d for not safe for display, %d"
          " for low light, %d for sensitive location";
    v19 = loggingConnection;
    v20 = 56;
  }
  else
  {
    if (!v8)
      return;
    v21 = a3->var0;
    v22 = a3->var1;
    v23 = a3->var2;
    v24 = a3->var3;
    v25 = a3->var4;
    var5 = a3->var5;
    var6 = a3->var6;
    var7 = a3->var7;
    v30 = a3->var8;
    v29 = a3->var9;
    v31 = a3->var10;
    v32 = a3->var11;
    v33 = 67111936;
    v34 = v21;
    v35 = 1024;
    v36 = v22;
    v37 = 1024;
    v38 = v23;
    v39 = 1024;
    v40 = v24;
    v41 = 1024;
    v42 = v29;
    v43 = 1024;
    v44 = v25;
    v45 = 1024;
    v46 = var5;
    v47 = 1024;
    v48 = var6;
    v49 = 1024;
    v50 = var7;
    v51 = 1024;
    v52 = v30;
    v53 = 1024;
    v54 = v31;
    v55 = 1024;
    v56 = v32;
    v18 = "[PGSinglePersonWallpaperAssetSuggester] Filtered out %d for isUtility, %d for avoidForKeyAsset, %d for aesthet"
          "ics, %d for wallpaper score, %d for aesthetics+wallpaper, %d for face quality, %d for clock overlap, %d for lo"
          "w resolution, %d for crop score, %d for not safe for display, %d for low light, %d for sensitive location";
    v19 = loggingConnection;
    v20 = 74;
  }
  _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, v18, (uint8_t *)&v33, v20);
}

- (id)_sortedDedupedCandidatesFromCandidates:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, _BYTE *, double);
  double v9;
  double Current;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t i;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *loggingConnection;
  NSObject *v35;
  int v36;
  int v37;
  PGSinglePersonWallpaperAssetSuggester *v39;
  void *v40;
  void (**v41)(void *, _BYTE *, double);
  id v42;
  void *v43;
  void *v44;
  id v45;
  id obj;
  uint64_t v47;
  uint64_t v48;
  void *v49;
  uint64_t v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  char v59;
  _BYTE v60[128];
  _BYTE v61[128];
  _QWORD v62[6];
  uint8_t buf[4];
  int v64;
  __int16 v65;
  const char *v66;
  uint64_t v67;

  v67 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(void *, _BYTE *, double))_Block_copy(v7);
  v9 = 0.0;
  if (v8)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v59 = 0;
      v8[2](v8, &v59, 0.0);
      if (v59)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v64 = 274;
          v65 = 2080;
          v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v11 = 0;
        goto LABEL_44;
      }
      v9 = Current;
    }
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", &__block_literal_global_23304);
  -[PGSinglePersonWallpaperAssetSuggesterFilteringContext timeIntervalForCandidateDeduping](self->_primaryFilteringContext, "timeIntervalForCandidateDeduping");
  objc_msgSend(v12, "setMaximumDistance:");
  objc_msgSend(v12, "setMinimumNumberOfObjects:", 1);
  objc_msgSend(v12, "performWithDataset:progressBlock:", v6, &__block_literal_global_255);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v13 = CFAbsoluteTimeGetCurrent();
    if (v13 - v9 >= 0.01)
    {
      v59 = 0;
      v8[2](v8, &v59, 0.5);
      if (v59)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v64 = 286;
          v65 = 2080;
          v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Sugges"
                "tions/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v11 = 0;
        goto LABEL_43;
      }
      v9 = v13;
    }
  }
  v39 = self;
  v40 = v12;
  v41 = v8;
  v42 = v7;
  v43 = v6;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("isFavorite"), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v62[0] = v14;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("score"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v62[1] = v15;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("wallpaperScore"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v62[2] = v16;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("aestheticScore"), 0);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v62[3] = v17;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("creationDate"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v62[4] = v18;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("assetUUID"), 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v62[5] = v19;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v55 = 0u;
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  obj = v44;
  v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  if (!v48)
    goto LABEL_33;
  v47 = *(_QWORD *)v56;
  do
  {
    for (i = 0; i != v48; ++i)
    {
      if (*(_QWORD *)v56 != v47)
        objc_enumerationMutation(obj);
      v22 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
      v23 = (void *)MEMORY[0x1CAA4EB2C]();
      v51 = 0u;
      v52 = 0u;
      v53 = 0u;
      v54 = 0u;
      objc_msgSend(v22, "objects");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      if (!v25)
      {
        v27 = v24;
        goto LABEL_30;
      }
      v26 = v25;
      v49 = v23;
      v50 = i;
      v27 = 0;
      v28 = *(_QWORD *)v52;
      do
      {
        v29 = 0;
        v30 = v27;
        do
        {
          if (*(_QWORD *)v52 != v28)
            objc_enumerationMutation(v24);
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", *(_QWORD *)(*((_QWORD *)&v51 + 1) + 8 * v29), v30, 0);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v31, "sortedArrayUsingDescriptors:", v20);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "firstObject");
          v27 = (void *)objc_claimAutoreleasedReturnValue();

          ++v29;
          v30 = v27;
        }
        while (v26 != v29);
        v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v51, v60, 16);
      }
      while (v26);

      v23 = v49;
      i = v50;
      if (v27)
      {
        objc_msgSend(v45, "addObject:", v27);
LABEL_30:

      }
      objc_autoreleasePoolPop(v23);
    }
    v48 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v55, v61, 16);
  }
  while (v48);
LABEL_33:

  objc_msgSend(v45, "sortedArrayUsingDescriptors:", v20);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  loggingConnection = v39->_loggingConnection;
  v6 = v43;
  v8 = v41;
  if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
  {
    v35 = loggingConnection;
    v36 = objc_msgSend(v43, "count");
    v37 = objc_msgSend(v33, "count");
    *(_DWORD *)buf = 67109376;
    v64 = v36;
    v65 = 1024;
    LODWORD(v66) = v37;
    _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_INFO, "[PGSinglePersonWallpaperAssetSuggester] Deduped %d candidates to %d", buf, 0xEu);

  }
  v7 = v42;
  v12 = v40;
  if (v41 && CFAbsoluteTimeGetCurrent() - v9 >= 0.01 && (v59 = 0, v41[2](v41, &v59, 1.0), v59))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      v64 = 314;
      v65 = 2080;
      v66 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Suggestion"
            "s/Suggesters/Autobahn/PGSinglePersonWallpaperAssetSuggester.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v11 = 0;
  }
  else
  {
    v11 = v33;
  }

LABEL_43:
LABEL_44:

  return v11;
}

- (id)assetsFromCandidates:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t k;
  void *v28;
  void *context;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  _BYTE v44[128];
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v4, "count"));
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v42 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v40 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v39 + 1) + 8 * i), "assetUUID");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "addObject:", v11);

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v39, v45, 16);
    }
    while (v8);
  }

  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  -[CLSCurationContext photoLibrary](self->_curationContext, "photoLibrary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v14, "setFetchPropertySets:", self->_assetFetchPropertySets);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithUUIDs:options:", v5, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v36;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v36 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * j);
        objc_msgSend(v20, "uuid");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v20, v21);

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v35, v44, 16);
    }
    while (v17);
  }
  v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v23 = v5;
  v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
  if (v24)
  {
    v25 = v24;
    v26 = *(_QWORD *)v32;
    do
    {
      for (k = 0; k != v25; ++k)
      {
        if (*(_QWORD *)v32 != v26)
          objc_enumerationMutation(v23);
        objc_msgSend(v12, "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * k));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (v28)
          objc_msgSend(v22, "addObject:", v28);

      }
      v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v31, v43, 16);
    }
    while (v25);
  }

  objc_autoreleasePoolPop(context);
  return v22;
}

- (PGSinglePersonWallpaperAssetSuggesterFilteringContext)primaryFilteringContext
{
  return self->_primaryFilteringContext;
}

- (void)setPrimaryFilteringContext:(id)a3
{
  objc_storeStrong((id *)&self->_primaryFilteringContext, a3);
}

- (PGSinglePersonWallpaperAssetSuggesterFilteringContext)secondaryFilteringContext
{
  return self->_secondaryFilteringContext;
}

- (void)setSecondaryFilteringContext:(id)a3
{
  objc_storeStrong((id *)&self->_secondaryFilteringContext, a3);
}

- (PGSinglePersonWallpaperAssetSuggesterScoringContext)scoringContext
{
  return self->_scoringContext;
}

- (void)setScoringContext:(id)a3
{
  objc_storeStrong((id *)&self->_scoringContext, a3);
}

- (PGSinglePersonWallpaperAssetSuggesterDistancingContext)distancingContext
{
  return self->_distancingContext;
}

- (void)setDistancingContext:(id)a3
{
  objc_storeStrong((id *)&self->_distancingContext, a3);
}

- (NSArray)assetFetchPropertySets
{
  return self->_assetFetchPropertySets;
}

- (void)setAssetFetchPropertySets:(id)a3
{
  objc_storeStrong((id *)&self->_assetFetchPropertySets, a3);
}

- (NSSet)forbiddenAssetUUIDs
{
  return self->_forbiddenAssetUUIDs;
}

- (void)setForbiddenAssetUUIDs:(id)a3
{
  objc_storeStrong((id *)&self->_forbiddenAssetUUIDs, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_forbiddenAssetUUIDs, 0);
  objc_storeStrong((id *)&self->_assetFetchPropertySets, 0);
  objc_storeStrong((id *)&self->_distancingContext, 0);
  objc_storeStrong((id *)&self->_scoringContext, 0);
  objc_storeStrong((id *)&self->_secondaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_primaryFilteringContext, 0);
  objc_storeStrong((id *)&self->_suggestedAssetEnumerator, 0);
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_curationContext, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiers, 0);
}

double __94__PGSinglePersonWallpaperAssetSuggester__sortedDedupedCandidatesFromCandidates_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  v4 = a3;
  objc_msgSend(a2, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
  v8 = fabs(v7);

  return v8;
}

void __76__PGSinglePersonWallpaperAssetSuggester_computeSuggestedAssetsWithProgress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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

void __76__PGSinglePersonWallpaperAssetSuggester_computeSuggestedAssetsWithProgress___block_invoke_155(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.5 + 0.5);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

+ (id)_assetExpression
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
  void *v11;
  void *v12;
  void *v14;
  void *v15;
  _QWORD v16[8];

  v16[7] = *MEMORY[0x1E0C80C00];
  v2 = (void *)MEMORY[0x1E0CB35D0];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForKeyPath:", CFSTR("assetForFace"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("$asset.%K == %d"), CFSTR("kind"), 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v15;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("$asset.%K != %d"), CFSTR("kindSubtype"), 10);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v4;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("$asset.%K != %d"), CFSTR("kindSubtype"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v5;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("NOT ($asset.%K IN %@)"), CFSTR("playbackStyle"), &unk_1E84E9A78);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v6;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("SUBQUERY($asset.%K, $face, $face != NIL).@count == %d"), CFSTR("detectedFaces"), 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("$asset.%K == NO AND $asset.%K == %d"), CFSTR("hidden"), CFSTR("trashedState"), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("$asset.%K >= %d"), CFSTR("additionalAttributes.sceneAnalysisVersion"), 77);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v9;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expressionForSubquery:usingIteratorVariable:predicate:", v3, CFSTR("asset"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)prefilteringSubpredicatesWithContext:(id)a3 forTargetAspectRatio:(double)a4
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v44;
  void *v45;
  _QWORD v46[6];

  v46[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v8 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "maximumFaceRoll");
  v10 = -v9;
  objc_msgSend(v6, "maximumFaceRoll");
  objc_msgSend(v8, "predicateWithFormat:", CFSTR("%K >= %f AND %K <= %f"), CFSTR("roll"), *(_QWORD *)&v10, CFSTR("roll"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "pg_setWallpaperSuggestionReason:", CFSTR("High Face Roll"));
  v45 = v12;
  objc_msgSend(v7, "addObject:", v12);
  if (objc_msgSend(v6, "requiresSmile"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K IN { %d, %d } AND %K != %d AND %K != %d) OR (%K == %d)"), CFSTR("ageType"), 1, 2, CFSTR("faceExpressionType"), 3, CFSTR("faceExpressionType"), 2, CFSTR("smileType"), 2);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "pg_setWallpaperSuggestionReason:", CFSTR("Failed Face Expression"));
    objc_msgSend(v7, "addObject:", v13);

  }
  if (objc_msgSend(v6, "requiresNoBlink"))
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("eyesState"), 2);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "pg_setWallpaperSuggestionReason:", CFSTR("Closed Eyes"));
    objc_msgSend(v7, "addObject:", v14);

  }
  v15 = (void *)MEMORY[0x1E0CB3880];
  if (a4 <= 1.0)
    v16 = a4;
  else
    v16 = 1.0;
  objc_msgSend(v6, "minimumFaceSize");
  v18 = v17;
  objc_msgSend(v6, "maximumFaceSize");
  objc_msgSend(v15, "predicateWithFormat:", CFSTR("%K <= %K * %f AND %K BETWEEN { %f, %f }"), CFSTR("sourceWidth"), CFSTR("sourceHeight"), *(_QWORD *)&v16, CFSTR("size"), v18, v19);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "minimumFaceSize");
  v22 = v21 * a4;
  objc_msgSend(v6, "maximumFaceSize");
  objc_msgSend(v20, "predicateWithFormat:", CFSTR("%K >= %K * %f AND %K BETWEEN { %f, %f }"), CFSTR("sourceWidth"), CFSTR("sourceHeight"), fmax(a4, 1.0), CFSTR("size"), *(_QWORD *)&v22, v23 * a4);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "minimumFaceSize");
  v27 = v26;
  objc_msgSend(v6, "maximumFaceSize");
  objc_msgSend(v25, "predicateWithFormat:", CFSTR("%K >= %K * %f AND %K < %K AND %K >= (%f * %K) / %K AND %K <= (%f * %K) / %K"), CFSTR("sourceWidth"), CFSTR("sourceHeight"), *(_QWORD *)&a4, CFSTR("sourceWidth"), CFSTR("sourceHeight"), CFSTR("size"), v27, CFSTR("sourceWidth"), CFSTR("sourceHeight"), CFSTR("size"), v28, CFSTR("sourceWidth"), CFSTR("sourceHeight"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = (void *)MEMORY[0x1E0CB3880];
  objc_msgSend(v6, "minimumFaceSize");
  v32 = v31 * a4;
  objc_msgSend(v6, "maximumFaceSize");
  objc_msgSend(v30, "predicateWithFormat:", CFSTR("%K > %K AND %K <= %K * %f AND %K >= (%f * %K) / %K AND %K <= (%f * %K)  / %K"), CFSTR("sourceWidth"), CFSTR("sourceHeight"), CFSTR("sourceWidth"), CFSTR("sourceHeight"), *(_QWORD *)&a4, CFSTR("size"), *(_QWORD *)&v32, CFSTR("sourceHeight"), CFSTR("sourceWidth"), CFSTR("size"), v33 * a4, CFSTR("sourceHeight"), CFSTR("sourceWidth"));
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)MEMORY[0x1E0CB3528];
  v46[0] = v44;
  v46[1] = v24;
  v46[2] = v29;
  v46[3] = v34;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v46, 4);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "orPredicateWithSubpredicates:", v36);
  v37 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v37, "pg_setWallpaperSuggestionReason:", CFSTR("Face Size Out of Range"));
  objc_msgSend(v7, "addObject:", v37);
  objc_msgSend(a1, "_assetExpression");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = (void *)MEMORY[0x1E0CB3518];
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionWithFormat:", CFSTR("%@.@count"), v38);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB35D0], "expressionForConstantValue:", &unk_1E84E3848);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "predicateWithLeftExpression:rightExpression:modifier:type:options:", v40, v41, 0, 5, 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v42, "pg_setWallpaperSuggestionReason:", CFSTR("Invalid Asset"));
  objc_msgSend(v7, "addObject:", v42);

  return v7;
}

+ (id)prefilteringInternalPredicateWithContext:(id)a3 forTargetAspectRatio:(double)a4
{
  void *v4;
  void *v5;

  objc_msgSend(a1, "prefilteringSubpredicatesWithContext:forTargetAspectRatio:", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3528], "andPredicateWithSubpredicates:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (BOOL)candidateAsset:(id)a3 andFace:(id)a4 passesPostfilteringWithContext:(id)a5 curationContext:(id)a6 statistics:(id *)a7
{
  id v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  BOOL v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  float v22;
  double v23;
  double v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  float v29;
  double v30;
  char v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  double v36;
  void *v37;
  float v38;
  double v39;
  char v40;
  double v41;
  double v42;
  void *v43;
  void *v44;
  void *v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  float v61;
  double v62;
  int *p_var6;
  double v65;
  char v66;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v14 = a6;
  objc_msgSend(v11, "curationModel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "userFeedbackCalculator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v14) = objc_msgSend(v15, "isUtilityForMemoriesWithAsset:userFeedbackCalculator:", v11, v16);
  if ((_DWORD)v14)
  {
    v17 = 0;
    ++a7->var0;
  }
  else if (objc_msgSend(v15, "avoidIfPossibleForKeyAssetWithAsset:statistics:", v11, &a7->var12))
  {
    v17 = 0;
    ++a7->var1;
  }
  else
  {
    objc_msgSend(v15, "aestheticsModel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "overallAestheticScoreNode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "highPrecisionOperatingPoint");
    v21 = v20;

    objc_msgSend(v11, "overallAestheticScore");
    if (v21 <= v22)
    {
      objc_msgSend(v13, "absoluteMinimumWallpaperScore");
      v24 = v23;
      if (v23 < 0.0)
      {
        objc_msgSend(v15, "wallpaperScoreModel");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "minimumWallpaperScoreNode");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "operatingPoint");
        v24 = v27;

      }
      objc_msgSend(v11, "mediaAnalysisProperties");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "wallpaperScore");
      v30 = v29;

      if (v24 <= v30)
      {
        v31 = objc_msgSend(v15, "isAestheticallyPrettyGoodWithAsset:", v11);
        objc_msgSend(v13, "minimumWallpaperScore");
        v33 = v32;
        if (v32 < 0.0)
        {
          objc_msgSend(v15, "wallpaperScoreModel");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "peopleNode");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "highPrecisionOperatingPoint");
          v33 = v36;

        }
        objc_msgSend(v11, "mediaAnalysisProperties");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "wallpaperScore");
        v39 = v38;

        if (v33 <= v39)
          v40 = 1;
        else
          v40 = v31;
        if ((v40 & 1) != 0)
        {
          objc_msgSend(v13, "minimumFaceQuality");
          v42 = v41;
          if (v41 < 0.0)
          {
            v42 = 0.5;
            if ((int)objc_msgSend(v11, "faceAnalysisVersion") >= 12)
            {
              objc_msgSend(v11, "curationModel");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v43, "faceModel");
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v44, "qualityNode");
              v45 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v45, "highPrecisionOperatingPoint");
              v42 = v46;

            }
          }
          if ((int)objc_msgSend(v11, "faceAnalysisVersion") < 12)
            +[PGWallpaperSuggestionAssetGater sydneyMD4FaceQualityFromAsset:](PGWallpaperSuggestionAssetGater, "sydneyMD4FaceQualityFromAsset:", v11);
          else
            objc_msgSend(v12, "quality");
          if (v47 >= v42)
          {
            if ((objc_msgSend(v13, "bypassCropScoreCheck") & 1) != 0)
              goto LABEL_30;
            v66 = 0;
            v65 = 1.0;
            objc_msgSend(MEMORY[0x1E0D77EF8], "cropScoreWithAsset:classification:passesClockOverlap:cropZoomRatio:orientation:", v11, 1, &v66, &v65, objc_msgSend(v13, "orientation"));
            v49 = v48;
            v50 = v65;
            objc_msgSend(v13, "maximumCropZoomRatio");
            v52 = v51;
            objc_msgSend(v13, "minimumCropScore");
            if (!v66)
              goto LABEL_36;
            if (v50 <= v52 && v49 >= v53)
            {
LABEL_30:
              if ((objc_msgSend(MEMORY[0x1E0D77E50], "assetIsSafeForWidgetDisplay:", v11) & 1) != 0)
              {
                objc_msgSend(v13, "maximumLowLightScore");
                v55 = v54;
                if (v54 < 0.0)
                {
                  objc_msgSend(v11, "curationModel");
                  v56 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v56, "aestheticsModel");
                  v57 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v57, "lowLightNode");
                  v58 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v58, "operatingPoint");
                  v55 = v59;

                }
                objc_msgSend(v11, "aestheticProperties");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v60, "lowLight");
                v62 = v61;

                if (v55 >= v62)
                {
                  if (+[PGSensitiveLocationBlocklistConfiguration isAssetAtSensitiveLocationAndDate:](PGSensitiveLocationBlocklistConfiguration, "isAssetAtSensitiveLocationAndDate:", v11))
                  {
                    v17 = 0;
                    ++a7->var11;
                  }
                  else
                  {
                    v17 = 1;
                  }
                }
                else
                {
                  v17 = 0;
                  ++a7->var10;
                }
              }
              else
              {
                v17 = 0;
                ++a7->var8;
              }
            }
            else
            {
LABEL_36:
              if (v66)
              {
                if (v50 > v52)
                  p_var6 = &a7->var6;
                else
                  p_var6 = &a7->var7;
              }
              else
              {
                p_var6 = &a7->var5;
              }
              v17 = 0;
              ++*p_var6;
            }
          }
          else
          {
            v17 = 0;
            ++a7->var4;
          }
        }
        else
        {
          v17 = 0;
          ++a7->var9;
        }
      }
      else
      {
        v17 = 0;
        ++a7->var3;
      }
    }
    else
    {
      v17 = 0;
      ++a7->var2;
    }
  }

  return v17;
}

+ (BOOL)passesFilteringWithAsset:(id)a3 forTopWallpaperSuggestions:(BOOL)a4 curationContext:(id)a5 orientation:(int64_t)a6 reason:(id *)a7
{
  id v12;
  id v13;
  PGSinglePersonWallpaperAssetSuggesterFilteringContext *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  __CFString *v25;
  char v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
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
  _QWORD *v44;
  const __CFString *v45;
  void *v46;
  void *v47;
  void *v48;
  id *v50;
  void *v51;
  void *v52;
  id v53;
  id v54;
  void *v55;
  id obj;
  void *v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint8_t buf[32];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  void *v70;
  void *v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = [PGSinglePersonWallpaperAssetSuggesterFilteringContext alloc];
  if (a4)
    v15 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext initForTopPeopleInOrientation:](v14, "initForTopPeopleInOrientation:", a6);
  else
    v15 = -[PGSinglePersonWallpaperAssetSuggesterFilteringContext initForPeopleInOrientation:](v14, "initForPeopleInOrientation:", a6);
  v16 = (void *)v15;
  objc_msgSend(v12, "photoLibrary");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "librarySpecificFetchOptions");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setIncludedDetectionTypes:", &unk_1E84E9A90);
  objc_msgSend(v18, "setIncludeTorsoAndFaceDetectionData:", 1);
  objc_msgSend(MEMORY[0x1E0CD1528], "fetchFacesInAsset:options:", v12, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v19, "count") == 1)
  {
    objc_msgSend(v19, "firstObject");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v57, "detectionType") != 1)
    {
      v26 = 0;
      if (a7)
        *a7 = CFSTR("No Human Face");
      goto LABEL_66;
    }
    PFDeviceScreenSize();
    v22 = v20;
    v23 = v21;
    v53 = v13;
    v54 = v12;
    v51 = v19;
    v52 = v17;
    v50 = a7;
    if (v20 == 0.0 || v21 == 0.0 || v20 == *MEMORY[0x1E0D71130] && v21 == *(double *)(MEMORY[0x1E0D71130] + 8))
    {
      v24 = 1.0;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 134218496;
        *(double *)&buf[4] = v22;
        *(_WORD *)&buf[12] = 2048;
        *(double *)&buf[14] = v23;
        *(_WORD *)&buf[22] = 2048;
        *(_QWORD *)&buf[24] = 0x3FF0000000000000;
        _os_log_fault_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "[Performance] %s: %f ms", buf, 0x20u);
      }
    }
    else
    {
      v24 = fabs(v20 / v21);
    }
    v55 = v16;
    objc_msgSend(a1, "prefilteringSubpredicatesWithContext:forTargetAspectRatio:", v16, v24);
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
    if (v27)
    {
      v28 = v27;
      v29 = *(_QWORD *)v59;
      while (2)
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v59 != v29)
            objc_enumerationMutation(obj);
          v31 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * i);
          objc_msgSend(v18, "setInternalPredicate:", v31);
          v32 = (void *)MEMORY[0x1E0CD1528];
          objc_msgSend(v57, "localIdentifier");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          v71 = v33;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v71, 1);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "fetchFacesWithLocalIdentifiers:options:", v34, v18);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "firstObject");
          v36 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v36)
          {
            objc_msgSend(v31, "pg_wallpaperSuggestionReason");
            v46 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = v46;
            if (v50)
              *v50 = objc_retainAutorelease(v46);
            v13 = v53;
            v12 = v54;
            v16 = v55;
            v37 = obj;
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
            {
              objc_msgSend(v57, "uuid");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              *(_QWORD *)&buf[4] = v48;
              *(_WORD *)&buf[12] = 2112;
              *(_QWORD *)&buf[14] = v47;
              *(_WORD *)&buf[22] = 2112;
              *(_QWORD *)&buf[24] = v31;
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Face %@ fails subpredicate '%@': %@", buf, 0x20u);

            }
            v26 = 0;
            v43 = obj;
            goto LABEL_65;
          }

        }
        v28 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v58, v72, 16);
        if (v28)
          continue;
        break;
      }
    }
    v37 = obj;

    v16 = v55;
    objc_msgSend(a1, "prefilteringInternalPredicateWithContext:forTargetAspectRatio:", v55, v24);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setInternalPredicate:", v38);

    v39 = (void *)MEMORY[0x1E0CD1528];
    objc_msgSend(v57, "localIdentifier");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v40;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "fetchFacesWithLocalIdentifiers:options:", v41, v18);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v42, "firstObject");
    v43 = (void *)objc_claimAutoreleasedReturnValue();

    v68 = 0u;
    v69 = 0u;
    v66 = 0u;
    v67 = 0u;
    v64 = 0u;
    v65 = 0u;
    v63 = 0u;
    memset(buf, 0, sizeof(buf));
    v13 = v53;
    v12 = v54;
    v26 = objc_msgSend(a1, "candidateAsset:andFace:passesPostfilteringWithContext:curationContext:statistics:", v54, v43, v55, v53, buf);
    if ((v26 & 1) != 0)
    {
      v44 = v50;
      if (v50)
      {
        v45 = CFSTR("Pass");
LABEL_64:
        *v44 = v45;
      }
    }
    else
    {
      v44 = v50;
      if (v50)
      {
        if (*(int *)buf <= 0)
        {
          if (*(int *)&buf[4] <= 0)
          {
            if (*(int *)&buf[8] <= 0)
            {
              if (*(int *)&buf[12] <= 0)
              {
                if (*(int *)&buf[16] <= 0)
                {
                  if (*(int *)&buf[20] <= 0)
                  {
                    if (*(int *)&buf[24] <= 0)
                    {
                      if (*(int *)&buf[28] <= 0)
                      {
                        if ((int)v63 <= 0)
                        {
                          if ((uint64_t)v63 <= 0)
                          {
                            if (*(uint64_t *)((char *)&v63 + 4) <= 0)
                            {
                              if (SHIDWORD(v63) <= 0)
                                v45 = CFSTR("Unknown Reason");
                              else
                                v45 = CFSTR("Sensitive Location");
                            }
                            else
                            {
                              v45 = CFSTR("Low Light");
                            }
                          }
                          else
                          {
                            v45 = CFSTR("Low Aesthetic&Wallpaper");
                          }
                        }
                        else
                        {
                          v45 = CFSTR("Not Safe for Display");
                        }
                      }
                      else
                      {
                        v45 = CFSTR("Low Crop Score");
                      }
                      v16 = v55;
                      v37 = obj;
                      v44 = v50;
                    }
                    else
                    {
                      v45 = CFSTR("Low Resolution");
                    }
                  }
                  else
                  {
                    v45 = CFSTR("Clock Overlap");
                  }
                }
                else
                {
                  v45 = CFSTR("Low Face Quality");
                }
              }
              else
              {
                v45 = CFSTR("Low Wallpaper Score");
              }
            }
            else
            {
              v45 = CFSTR("Low Aesthetics");
            }
          }
          else
          {
            v45 = CFSTR("Avoid for Key Asset");
          }
        }
        else
        {
          v45 = CFSTR("Is Utility");
        }
        goto LABEL_64;
      }
    }
LABEL_65:

    v19 = v51;
    v17 = v52;
LABEL_66:

    goto LABEL_67;
  }
  if (a7)
  {
    if ((unint64_t)objc_msgSend(v19, "count") <= 1)
      v25 = CFSTR("No Face");
    else
      v25 = CFSTR("Too Many Faces");
    v26 = 0;
    *a7 = objc_retainAutorelease(v25);
  }
  else
  {
    v26 = 0;
  }
LABEL_67:

  return v26;
}

@end
