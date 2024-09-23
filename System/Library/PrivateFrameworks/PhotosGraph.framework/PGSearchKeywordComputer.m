@implementation PGSearchKeywordComputer

- (PGSearchKeywordComputer)initWithGraph:(id)a3 searchComputationCache:(id)a4
{
  id v7;
  id v8;
  PGSearchKeywordComputer *v9;
  PGSearchKeywordComputer *v10;
  uint64_t v11;
  NSLocale *userLocale;
  uint64_t v13;
  CLSHolidayCalendarEventService *holidayService;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PGSearchKeywordComputer;
  v9 = -[PGSearchKeywordComputer init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_graph, a3);
    objc_storeStrong((id *)&v10->_searchComputationCache, a4);
    objc_msgSend(MEMORY[0x1E0C99DC8], "currentLocale");
    v11 = objc_claimAutoreleasedReturnValue();
    userLocale = v10->_userLocale;
    v10->_userLocale = (NSLocale *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0D4B180]), "initWithLocale:", v10->_userLocale);
    holidayService = v10->_holidayService;
    v10->_holidayService = (CLSHolidayCalendarEventService *)v13;

  }
  return v10;
}

- (id)searchKeywordsByEventWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 photoLibrary:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  char v15;
  id v16;
  void *v17;
  void *v18;
  unint64_t v19;
  id v20;
  id v21;
  id v22;
  double Current;
  char v24;
  char v26;
  _QWORD v27[5];
  id v28;
  id v29;
  id v30;
  id v31;
  uint64_t *p_buf;
  uint64_t *v33;
  uint64_t *v34;
  double v35;
  uint64_t v36;
  unint64_t v37;
  uint64_t v38;
  double *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t *v43;
  uint64_t v44;
  char v45;
  _DWORD v46[2];
  __int16 v47;
  const char *v48;
  uint64_t buf;
  __int128 v50;
  uint64_t v51;
  uint64_t v52;

  v52 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = a6;
  v13 = _Block_copy(v12);
  v42 = 0;
  v43 = &v42;
  v44 = 0x2020000000;
  v45 = 0;
  v38 = 0;
  v39 = (double *)&v38;
  v40 = 0x2020000000;
  v41 = 0;
  if (v13
    && (v14 = CFAbsoluteTimeGetCurrent(), v14 - v39[3] >= 0.01)
    && (v39[3] = v14,
        LOBYTE(v46[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v13 + 2))(v13, v46, 0.0),
        v15 = *((_BYTE *)v43 + 24) | LOBYTE(v46[0]),
        (*((_BYTE *)v43 + 24) = v15) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 0x4B04000202;
      LOWORD(v50) = 2080;
      *(_QWORD *)((char *)&v50 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Search/PGSearchKeywordComputer.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
    v16 = (id)MEMORY[0x1E0C9AA70];
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", objc_msgSend(v10, "count"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraph meNodeCollection](self->_graph, "meNodeCollection");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 0;
    *(_QWORD *)&v50 = &buf;
    *((_QWORD *)&v50 + 1) = 0x2020000000;
    v51 = 0;
    v19 = objc_msgSend(v10, "count");
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke;
    v27[3] = &unk_1E842D8D8;
    p_buf = &buf;
    v35 = 1.0 / (double)v19;
    v20 = v13;
    v36 = 0x3F847AE147AE147BLL;
    v33 = &v38;
    v34 = &v42;
    v31 = v20;
    v27[4] = self;
    v28 = v11;
    v37 = a4;
    v21 = v18;
    v29 = v21;
    v22 = v17;
    v30 = v22;
    -[PGSearchKeywordComputer _enumerateEventNodesForUUIDs:ofType:usingBlock:](self, "_enumerateEventNodesForUUIDs:ofType:usingBlock:", v10, a4, v27);
    if (v13
      && (Current = CFAbsoluteTimeGetCurrent(), Current - v39[3] >= 0.01)
      && (v39[3] = Current,
          v26 = 0,
          (*((void (**)(id, char *, double))v20 + 2))(v20, &v26, 1.0),
          v24 = *((_BYTE *)v43 + 24) | v26,
          (*((_BYTE *)v43 + 24) = v24) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v46[0] = 67109378;
        v46[1] = 347;
        v47 = 2080;
        v48 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/P"
              "GSearchKeywordComputer.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v46, 0x12u);
      }
      v16 = (id)MEMORY[0x1E0C9AA70];
    }
    else
    {
      v16 = v22;
    }

    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v38, 8);
  _Block_object_dispose(&v42, 8);

  return v16;
}

- (id)assetSearchKeywordsByMomentUUIDWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 progressBlock:(id)a5
{
  return -[PGSearchKeywordComputer assetSearchKeywordsByMomentUUIDWithEventUUIDs:ofType:searchEntityAccumulator:progressBlock:](self, "assetSearchKeywordsByMomentUUIDWithEventUUIDs:ofType:searchEntityAccumulator:progressBlock:", a3, a4, 0, a5);
}

- (id)assetSearchKeywordsByMomentUUIDWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 searchEntityAccumulator:(id)a5 progressBlock:(id)a6
{
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  double v15;
  char v16;
  void *v17;
  PGSearchKeywordComputerKeywordAggregator *v18;
  void *v19;
  double v20;
  id v21;
  PGSearchKeywordComputerKeywordAggregator *v22;
  id v23;
  double Current;
  char v25;
  NSObject *v26;
  NSObject *v27;
  id v29;
  id aBlock;
  id v31;
  char v32;
  _QWORD v33[5];
  PGSearchKeywordComputerKeywordAggregator *v34;
  id v35;
  id v36;
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t *v40;
  uint64_t v41;
  double v42;
  unint64_t v43;
  uint64_t v44;
  double *v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t buf;
  uint64_t *p_buf;
  uint64_t v50;
  char v51;
  _DWORD v52[2];
  __int16 v53;
  const char *v54;
  uint64_t v55;
  __int128 v56;
  uint64_t v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v31 = a3;
  v29 = a5;
  aBlock = a6;
  CreateSearchLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_signpost_id_generate(v10);
  v12 = v10;
  v13 = v12;
  if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
  {
    LOWORD(buf) = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v13, OS_SIGNPOST_INTERVAL_BEGIN, v11, "assetSearchKeywordsByMomentUUIDWithEventUUIDs", ", (uint8_t *)&buf, 2u);
  }

  v14 = _Block_copy(aBlock);
  buf = 0;
  p_buf = &buf;
  v50 = 0x2020000000;
  v51 = 0;
  v44 = 0;
  v45 = (double *)&v44;
  v46 = 0x2020000000;
  v47 = 0;
  if (v14
    && (v15 = CFAbsoluteTimeGetCurrent(), v15 - v45[3] >= 0.01)
    && (v45[3] = v15,
        LOBYTE(v52[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v14 + 2))(v14, v52, 0.0),
        v16 = *((_BYTE *)p_buf + 24) | LOBYTE(v52[0]),
        (*((_BYTE *)p_buf + 24) = v16) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      v55 = 0x16C04000202;
      LOWORD(v56) = 2080;
      *(_QWORD *)((char *)&v56 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Search/PGSearchKeywordComputer.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v55, 0x12u);
    }
    v17 = (void *)MEMORY[0x1E0C9AA70];
  }
  else
  {
    v18 = objc_alloc_init(PGSearchKeywordComputerKeywordAggregator);
    -[PGGraph meNodeCollection](self->_graph, "meNodeCollection");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v55 = 0;
    *(_QWORD *)&v56 = &v55;
    *((_QWORD *)&v56 + 1) = 0x2020000000;
    v57 = 0;
    v20 = 1.0 / (double)(unint64_t)objc_msgSend(v31, "count");
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke;
    v33[3] = &unk_1E842D8D8;
    v21 = v14;
    v38 = &v44;
    v39 = &v55;
    v40 = &buf;
    v41 = 0x3F847AE147AE147BLL;
    v42 = v20;
    v37 = v21;
    v33[4] = self;
    v22 = v18;
    v34 = v22;
    v35 = v29;
    v43 = a4;
    v23 = v19;
    v36 = v23;
    -[PGSearchKeywordComputer _enumerateEventNodesForUUIDs:ofType:usingBlock:](self, "_enumerateEventNodesForUUIDs:ofType:usingBlock:", v31, a4, v33);
    if (v14
      && (Current = CFAbsoluteTimeGetCurrent(), Current - v45[3] >= 0.01)
      && (v45[3] = Current,
          v32 = 0,
          (*((void (**)(id, char *, double))v21 + 2))(v21, &v32, 1.0),
          v25 = *((_BYTE *)p_buf + 24) | v32,
          (*((_BYTE *)p_buf + 24) = v25) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v52[0] = 67109378;
        v52[1] = 556;
        v53 = 2080;
        v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/P"
              "GSearchKeywordComputer.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v52, 0x12u);
      }
      v17 = (void *)MEMORY[0x1E0C9AA70];
    }
    else
    {
      v26 = v13;
      v27 = v26;
      if (v11 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        LOWORD(v52[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v27, OS_SIGNPOST_INTERVAL_END, v11, "assetSearchKeywordsByMomentUUIDWithEventUUIDs", ", (uint8_t *)v52, 2u);
      }

      -[PGSearchKeywordComputerKeywordAggregator aggregatedKeywords](v22, "aggregatedKeywords");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
    }

    _Block_object_dispose(&v55, 8);
  }
  _Block_object_dispose(&v44, 8);
  _Block_object_dispose(&buf, 8);

  return v17;
}

- (id)searchableAssetUUIDsBySocialGroupWithEventUUIDs:(id)a3 ofType:(unint64_t)a4 inPhotoLibrary:(id)a5 isFullAnalysis:(BOOL)a6 progressBlock:(id)a7
{
  uint64_t v8;
  id v12;
  id v13;
  id v14;
  void (**v15)(void *, int *, double);
  double v16;
  char v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  double Current;
  char v24;
  PGGraph *graph;
  void (**v26)(void *, int *, double);
  id v27;
  id v28;
  double v29;
  char v30;
  void *v32;
  void *v33;
  char v34;
  _QWORD v35[5];
  id v36;
  id v37;
  id v38;
  id v39;
  id v40;
  void (**v41)(void *, int *, double);
  uint64_t *v42;
  uint64_t *v43;
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _QWORD v48[4];
  id v49;
  uint64_t *p_buf;
  uint64_t v51;
  double *v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  char v58;
  int v59;
  int v60;
  __int16 v61;
  const char *v62;
  uint64_t v63;
  __int128 v64;
  uint64_t v65;
  uint64_t buf;
  __int128 v67;
  uint64_t v68;
  _QWORD v69[4];

  v8 = a6;
  v69[1] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a5;
  v14 = a7;
  v15 = (void (**)(void *, int *, double))_Block_copy(v14);
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 0;
  v51 = 0;
  v52 = (double *)&v51;
  v53 = 0x2020000000;
  v54 = 0;
  if (!v15
    || (v16 = CFAbsoluteTimeGetCurrent(), v16 - v52[3] < 0.01)
    || (v52[3] = v16,
        LOBYTE(v63) = 0,
        v15[2](v15, (int *)&v63, 0.0),
        v17 = *((_BYTE *)v56 + 24) | v63,
        (*((_BYTE *)v56 + 24) = v17) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v69[0] = *MEMORY[0x1E0CD19C0];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v69, 1);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setFetchPropertySets:", v19);

    v20 = 0;
    buf = 0;
    *(_QWORD *)&v67 = &buf;
    *((_QWORD *)&v67 + 1) = 0x2020000000;
    v68 = v8 << 63 >> 63;
    if ((v8 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v48[0] = MEMORY[0x1E0C809B0];
      v48[1] = 3221225472;
      v48[2] = __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke;
      v48[3] = &unk_1E842D900;
      v20 = v21;
      v49 = v20;
      p_buf = &buf;
      -[PGSearchKeywordComputer _enumerateEventNodesForUUIDs:ofType:usingBlock:](self, "_enumerateEventNodesForUUIDs:ofType:usingBlock:", v22, a4, v48);

    }
    if (v15)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v52[3] >= 0.01)
      {
        v52[3] = Current;
        LOBYTE(v59) = 0;
        v15[2](v15, &v59, 0.5);
        v24 = *((_BYTE *)v56 + 24) | v59;
        *((_BYTE *)v56 + 24) = v24;
        if (v24)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v63 = 0x24F04000202;
            LOWORD(v64) = 2080;
            *(_QWORD *)((char *)&v64 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Search/PGSearchKeywordComputer.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v63, 0x12u);
          }
          v18 = (id)MEMORY[0x1E0C9AA70];
          goto LABEL_28;
        }
      }
    }
    v63 = 0;
    *(_QWORD *)&v64 = &v63;
    *((_QWORD *)&v64 + 1) = 0x2020000000;
    v65 = 0x3FE0000000000000;
    graph = self->_graph;
    v35[0] = MEMORY[0x1E0C809B0];
    v35[1] = 3221225472;
    v35[2] = __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke_217;
    v35[3] = &unk_1E842D950;
    v26 = v15;
    v42 = &v51;
    v43 = &v63;
    v46 = 0x3F847AE147AE147BLL;
    v44 = &v55;
    v41 = v26;
    v35[4] = self;
    v36 = v13;
    v45 = &buf;
    v47 = v8;
    v37 = v33;
    v38 = &unk_1E84E9CB8;
    v39 = v20;
    v27 = v32;
    v40 = v27;
    -[MAGraph enumerateNodesWithLabel:domain:usingBlock:](graph, "enumerateNodesWithLabel:domain:usingBlock:", CFSTR("SocialGroup"), 302, v35);
    if (*((_BYTE *)v56 + 24))
    {
      v28 = v12;
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v59 = 67109378;
        v60 = 645;
        v61 = 2080;
        v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Search/P"
              "GSearchKeywordComputer.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v59, 0x12u);
      }
      v18 = (id)MEMORY[0x1E0C9AA70];
    }
    else
    {
      v28 = v12;
      if (v15)
      {
        v29 = CFAbsoluteTimeGetCurrent();
        if (v29 - v52[3] >= 0.01)
        {
          v52[3] = v29;
          v34 = 0;
          v26[2](v26, (int *)&v34, 1.0);
          v30 = *((_BYTE *)v56 + 24) | v34;
          *((_BYTE *)v56 + 24) = v30;
          if (v30)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v59 = 67109378;
              v60 = 647;
              v61 = 2080;
              v62 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Se"
                    "arch/PGSearchKeywordComputer.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v59, 0x12u);
            }
            v18 = (id)MEMORY[0x1E0C9AA70];
            goto LABEL_27;
          }
        }
      }
      v18 = v27;
    }
    v12 = v28;
LABEL_27:

    _Block_object_dispose(&v63, 8);
LABEL_28:

    _Block_object_dispose(&buf, 8);
    goto LABEL_29;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x23604000202;
    LOWORD(v67) = 2080;
    *(_QWORD *)((char *)&v67 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Search/PGSearchKeywordComputer.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  v18 = (id)MEMORY[0x1E0C9AA70];
LABEL_29:
  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v55, 8);

  return v18;
}

- (void)_enumerateEventNodesForUUIDs:(id)a3 ofType:(unint64_t)a4 usingBlock:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  _QWORD v14[4];
  id v15;
  _QWORD v16[4];
  id v17;
  uint8_t buf[4];
  unint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a5;
  if (a4 == 1)
  {
    +[PGGraphHighlightNodeCollection highlightNodesForUUIDs:inGraph:](PGGraphHighlightNodeCollection, "highlightNodesForUUIDs:inGraph:", v8, self->_graph);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __74__PGSearchKeywordComputer__enumerateEventNodesForUUIDs_ofType_usingBlock___block_invoke_2;
    v14[3] = &unk_1E842D9A0;
    v15 = v9;
    objc_msgSend(v10, "enumerateNodesUsingBlock:", v14);
    v11 = v15;
    goto LABEL_5;
  }
  if (!a4)
  {
    +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", v8, self->_graph);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v16[0] = MEMORY[0x1E0C809B0];
    v16[1] = 3221225472;
    v16[2] = __74__PGSearchKeywordComputer__enumerateEventNodesForUUIDs_ofType_usingBlock___block_invoke;
    v16[3] = &unk_1E842D978;
    v17 = v9;
    objc_msgSend(v10, "enumerateNodesUsingBlock:", v16);
    v11 = v17;
LABEL_5:

    goto LABEL_9;
  }
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "loggingConnection");
  v13 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 134217984;
    v19 = a4;
    _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "Cannot get graph node for uuid of unsupported asset collection type %ld", buf, 0xCu);
  }

LABEL_9:
}

- (id)_personLocalIdentifiersBySocialGroupUUIDWithPhotoLibrary:(id)a3 graph:(id)a4
{
  NSDictionary *personLocalIdentifiersBySocialGroupUUID;
  PGGraph *graph;
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSDictionary *v12;
  NSDictionary *v13;
  NSDictionary *v14;
  NSDictionary *v15;

  personLocalIdentifiersBySocialGroupUUID = self->_personLocalIdentifiersBySocialGroupUUID;
  if (!personLocalIdentifiersBySocialGroupUUID)
  {
    graph = self->_graph;
    v8 = a4;
    v9 = a3;
    +[PGGraphNodeCollection nodesInGraph:](PGGraphSocialGroupNodeCollection, "nodesInGraph:", graph);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "fetchMemberNodesBySocialGroupNodeForSocialGroups:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraph memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:shouldIncludeMeNode:simulateMeNodeNotSet:](self->_graph, "memberLocalIdentifiersBySocialGroupUUIDWithMemberNodesBySocialGroupNode:shouldIncludeMeNode:simulateMeNodeNotSet:", v11, 1, 0);
    v12 = (NSDictionary *)objc_claimAutoreleasedReturnValue();
    v13 = self->_personLocalIdentifiersBySocialGroupUUID;
    self->_personLocalIdentifiersBySocialGroupUUID = v12;

    +[PGPeopleUtilities validateKeyedSocialGroups:withPhotoLibrary:graph:](PGPeopleUtilities, "validateKeyedSocialGroups:withPhotoLibrary:graph:", self->_personLocalIdentifiersBySocialGroupUUID, v9, v8);
    v14 = (NSDictionary *)objc_claimAutoreleasedReturnValue();

    v15 = self->_personLocalIdentifiersBySocialGroupUUID;
    self->_personLocalIdentifiersBySocialGroupUUID = v14;

    personLocalIdentifiersBySocialGroupUUID = self->_personLocalIdentifiersBySocialGroupUUID;
  }
  return personLocalIdentifiersBySocialGroupUUID;
}

- (void)_enumerateBusinessAndPublicEventKeywordsForEvent:(id)a3 usingBlock:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;

  v5 = a4;
  v6 = (void *)MEMORY[0x1E0C99E08];
  v7 = a3;
  objc_msgSend(v6, "dictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = MEMORY[0x1E0C809B0];
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __87__PGSearchKeywordComputer__enumerateBusinessAndPublicEventKeywordsForEvent_usingBlock___block_invoke;
  v17[3] = &unk_1E842D9C8;
  v18 = v8;
  v10 = v8;
  objc_msgSend(v7, "enumerateBusinessesUsingBlock:", v17);
  objc_msgSend(v7, "publicEventNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __87__PGSearchKeywordComputer__enumerateBusinessAndPublicEventKeywordsForEvent_usingBlock___block_invoke_2;
  v14[3] = &unk_1E842D9F0;
  v15 = v11;
  v16 = v5;
  v12 = v5;
  v13 = v11;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v14);

}

- (id)_personUUIDsInSocialGroupNode:(id)a3 photoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGSearchKeywordComputer _personLocalIdentifiersBySocialGroupUUIDWithPhotoLibrary:graph:](self, "_personLocalIdentifiersBySocialGroupUUIDWithPhotoLibrary:graph:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v11, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v21;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v21 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(MEMORY[0x1E0CD16C0], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v17), (_QWORD)v20);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (v18)
          objc_msgSend(v12, "addObject:", v18);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v15);
  }

  return v12;
}

- (id)_holidayNodesForTimedEvent:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  unint64_t v28;
  uint64_t v29;
  BOOL v30;
  uint64_t v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  PGSearchKeywordComputer *v36;
  void *v37;
  id v38;
  uint64_t v39;
  void *v40;
  void *v41;
  id obj;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  _BYTE v52[128];
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(v4, "celebratedHolidayNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (id)objc_msgSend(v5, "mutableCopy");

  objc_msgSend(v4, "holidayNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = self;
  -[NSLocale countryCode](self->_userLocale, "countryCode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0u;
  v49 = 0u;
  v50 = 0u;
  v51 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v49;
    v12 = 0x1E0D4B000uLL;
    v32 = *(_QWORD *)v49;
    v33 = v8;
    do
    {
      v13 = 0;
      v34 = v10;
      do
      {
        if (*(_QWORD *)v49 != v11)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * v13);
        if ((objc_msgSend(v38, "containsObject:", v14, v32, v33) & 1) == 0)
        {
          v41 = v14;
          objc_msgSend(v14, "name");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          -[CLSHolidayCalendarEventService eventRuleForHolidayName:](v36->_holidayService, "eventRuleForHolidayName:");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = v15;
          if (v15)
          {
            objc_msgSend(v15, "commonCelebratedCountryCodes");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "objectForKeyedSubscript:", v7);
            v18 = (void *)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              v35 = v13;
              v46 = 0u;
              v47 = 0u;
              v44 = 0u;
              v45 = 0u;
              objc_msgSend(v4, "dateNodes");
              obj = (id)objc_claimAutoreleasedReturnValue();
              v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
              if (v43)
              {
                v19 = *(_QWORD *)v45;
                v39 = *(_QWORD *)v45;
                v40 = v16;
                do
                {
                  for (i = 0; i != v43; ++i)
                  {
                    if (*(_QWORD *)v45 != v19)
                      objc_enumerationMutation(obj);
                    objc_msgSend(v16, "localDateByEvaluatingRuleForYear:countryCode:", objc_msgSend(*(id *)(*((_QWORD *)&v44 + 1) + 8 * i), "year"), v7);
                    v21 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v12 + 304), "startOfDayForDate:", v21);
                    v22 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(*(id *)(v12 + 304), "endOfDayForDate:", v21);
                    v23 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v4, "localStartDate");
                    v24 = (void *)objc_claimAutoreleasedReturnValue();
                    if (objc_msgSend(v24, "compare:", v22) == 1)
                    {
                      objc_msgSend(v4, "localEndDate");
                      v25 = v7;
                      v26 = v4;
                      v27 = (void *)objc_claimAutoreleasedReturnValue();
                      v28 = v12;
                      v29 = objc_msgSend(v27, "compare:", v23);

                      v4 = v26;
                      v7 = v25;
                      v19 = v39;

                      v30 = v29 == -1;
                      v12 = v28;
                      v16 = v40;
                      if (v30)
                        objc_msgSend(v38, "addObject:", v41);
                    }
                    else
                    {

                    }
                  }
                  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v44, v52, 16);
                }
                while (v43);
              }

              v11 = v32;
              v8 = v33;
              v10 = v34;
              v13 = v35;
            }
          }

        }
        ++v13;
      }
      while (v13 != v10);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v48, v53, 16);
    }
    while (v10);
  }

  return v38;
}

- (PGSearchComputationCache)searchComputationCache
{
  return self->_searchComputationCache;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_searchComputationCache, 0);
  objc_storeStrong((id *)&self->_holidayService, 0);
  objc_storeStrong((id *)&self->_userLocale, 0);
  objc_storeStrong((id *)&self->_personLocalIdentifiersBySocialGroupUUID, 0);
  objc_storeStrong((id *)&self->_graph, 0);
}

void __87__PGSearchKeywordComputer__enumerateBusinessAndPublicEventKeywordsForEvent_usingBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  objc_msgSend(v8, "universalStartDate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v7, v6);
  }
  objc_msgSend(v7, "addObject:", v8);

}

void __87__PGSearchKeywordComputer__enumerateBusinessAndPublicEventKeywordsForEvent_usingBlock___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  uint64_t i;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  void *v26;
  void *v27;
  int v28;
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
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  void *v46;
  void *v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  _BYTE v56[128];
  _BYTE v57[128];
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(*(id *)(a1 + 32), "count");
  v40 = a1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = 0u;
  v53 = 0u;
  v54 = 0u;
  v55 = 0u;
  v11 = v4;
  v43 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  v39 = v11;
  if (!v43)
  {

    objc_msgSend(v5, "setObject:forKeyedSubscript:", v6, &unk_1E84E4250);
LABEL_26:
    objc_msgSend(v7, "allObjects");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v32, &unk_1E84E4268);

    goto LABEL_27;
  }
  v12 = v6;
  v37 = v5;
  v38 = v8;
  v13 = v5;
  v41 = *(_QWORD *)v53;
  v14 = 1;
  v15 = v11;
  v35 = v7;
  v36 = v6;
  v47 = v10;
  do
  {
    for (i = 0; i != v43; ++i)
    {
      if (*(_QWORD *)v53 != v41)
        objc_enumerationMutation(v15);
      objc_msgSend(*(id *)(*((_QWORD *)&v52 + 1) + 8 * i), "targetNode");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v18, "length"))
        objc_msgSend(v12, "addObject:", v18);
      v46 = v18;
      objc_msgSend(v17, "businessCategories");
      v19 = objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "count"))
        v14 &= objc_msgSend(v7, "intersectsSet:", v19);
      v45 = (void *)v19;
      objc_msgSend(v7, "unionSet:", v19);
      if (v42)
      {
        v44 = i;
        v20 = v9;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v21 = *(id *)(v40 + 32);
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
        if (v22)
        {
          v23 = v22;
          v24 = *(_QWORD *)v49;
          do
          {
            for (j = 0; j != v23; ++j)
            {
              if (*(_QWORD *)v49 != v24)
                objc_enumerationMutation(v21);
              v26 = *(void **)(*((_QWORD *)&v48 + 1) + 8 * j);
              objc_msgSend(v26, "businessNode");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "isSameNodeAsNode:", v17);

              if (v28)
              {
                objc_msgSend(v26, "name");
                v29 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "addObject:", v29);

                objc_msgSend(v26, "performers");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v47, "unionSet:", v30);

                objc_msgSend(v26, "localizedCategories");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v20, "unionSet:", v31);

              }
            }
            v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v48, v56, 16);
          }
          while (v23);
        }

        v12 = v36;
        v13 = v37;
        v7 = v35;
        v15 = v39;
        v9 = v20;
        v10 = v47;
        i = v44;
      }

    }
    v43 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v52, v57, 16);
  }
  while (v43);

  v5 = v13;
  v6 = v12;
  objc_msgSend(v13, "setObject:forKeyedSubscript:", v12, &unk_1E84E4250);
  v8 = v38;
  if ((v14 & 1) != 0)
    goto LABEL_26;
LABEL_27:
  if (v42)
  {
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v8, &unk_1E84E4280);
    objc_msgSend(v10, "allObjects");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v33, &unk_1E84E4298);

    objc_msgSend(v9, "allObjects");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKeyedSubscript:", v34, &unk_1E84E42B0);

  }
  (*(void (**)(void))(*(_QWORD *)(v40 + 40) + 16))();

}

uint64_t __74__PGSearchKeywordComputer__enumerateEventNodesForUUIDs_ofType_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

uint64_t __74__PGSearchKeywordComputer__enumerateEventNodesForUUIDs_ofType_usingBlock___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;

  v8 = a2;
  v3 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(v8, "eventCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "eventMomentNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke_2;
  v9[3] = &unk_1E8433E30;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v6;
  v11 = v7;
  objc_msgSend(v5, "enumerateNodesUsingBlock:", v9);

  objc_autoreleasePoolPop(v3);
}

void __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke_217(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  double Current;
  uint64_t v7;
  void *v8;
  unint64_t v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[4];
  id v28;
  unint64_t v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  char v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  if (*(_QWORD *)(a1 + 80)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8),
        Current - *(double *)(v7 + 24) >= *(double *)(a1 + 120))
    && (*(double *)(v7 + 24) = Current,
        v34 = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8)
                                                                                + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = (*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                             + 24)
                                                                 + 1.0)
                                                                * 0.5;
    objc_msgSend(*(id *)(a1 + 32), "_personUUIDsInSocialGroupNode:photoLibrary:", v5, *(_QWORD *)(a1 + 40));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9 >= 2)
    {
      v10 = v9 > 3 ? (v9 >> 1) + 1 : v9;
      if (v10 < v9 && *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) >= v10)
      {
        if (*(_BYTE *)(a1 + 128))
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K.@count >= %lu AND SUBQUERY(%K, $f, $f.%K IN %@ AND $f.%K IN %@).@count >= %lu"), CFSTR("detectedFaces"), v10, CFSTR("detectedFaces"), CFSTR("personForFace.verifiedType"), *(_QWORD *)(a1 + 56), CFSTR("personForFace.personUUID"), v8, v10, v25, v26);
        else
          objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@ AND %K.@count >= %lu AND SUBQUERY(%K, $f, $f.%K IN %@ AND $f.%K IN %@).@count >= %lu"), CFSTR("moment.uuid"), *(_QWORD *)(a1 + 64), CFSTR("detectedFaces"), v10, CFSTR("detectedFaces"), CFSTR("personForFace.verifiedType"), *(_QWORD *)(a1 + 56), CFSTR("personForFace.personUUID"), v8, v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 48), "setInternalPredicate:", v11);

        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", *(_QWORD *)(a1 + 48));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v12, "count"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = 0u;
        v31 = 0u;
        v32 = 0u;
        v33 = 0u;
        v14 = v12;
        v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
        if (v15)
        {
          v16 = v15;
          v17 = *(_QWORD *)v31;
          do
          {
            for (i = 0; i != v16; ++i)
            {
              if (*(_QWORD *)v31 != v17)
                objc_enumerationMutation(v14);
              objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * i), "uuid");
              v19 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v13, "addObject:", v19);

            }
            v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
          }
          while (v16);
        }

        objc_msgSend(*(id *)(a1 + 40), "librarySpecificFetchOptions");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setIncludedDetectionTypes:", &unk_1E84E9CD0);
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("personForFace.personUUID"), v8);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "setInternalPredicate:", v21);

        objc_msgSend(MEMORY[0x1E0CD16C0], "fetchVerifiedPersonUUIDsGroupedByAssetUUIDForAssetUUIDs:options:", v13, v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v13, "count"));
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v27[0] = MEMORY[0x1E0C809B0];
        v27[1] = 3221225472;
        v27[2] = __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke_240;
        v27[3] = &unk_1E842D928;
        v28 = v23;
        v29 = v10;
        v24 = v23;
        objc_msgSend(v22, "enumerateKeysAndObjectsUsingBlock:", v27);
        objc_msgSend(*(id *)(a1 + 72), "setObject:forKeyedSubscript:", v24, v8);

      }
    }

  }
}

void __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke_240(uint64_t a1, void *a2, void *a3)
{
  id v5;

  v5 = a2;
  if ((unint64_t)objc_msgSend(a3, "count") >= *(_QWORD *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);

}

void __126__PGSearchKeywordComputer_searchableAssetUUIDsBySocialGroupWithEventUUIDs_ofType_inPhotoLibrary_isFullAnalysis_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  unint64_t v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "uuid");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v5);

  v6 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  objc_msgSend(v4, "personNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "count");
  if (v6 <= v8)
    v9 = v8;
  else
    v9 = v6;
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v9;
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  double Current;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  id v44;
  void *v45;
  int v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  _QWORD v55[4];
  id v56;
  uint64_t v57;
  id v58;
  id v59;
  _QWORD v60[4];
  id v61;
  id v62;
  id v63;
  id v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  id v71;
  id v72;
  id v73;
  _QWORD v74[4];
  id v75;
  uint64_t v76;
  _QWORD v77[4];
  id v78;
  id v79;
  id v80;
  id v81;
  _QWORD v82[4];
  id v83;
  id v84;
  char v85;
  void *v86;
  void *v87;
  _BYTE v88[128];
  void *v89;
  id v90;
  void *v91;
  void *v92;
  _QWORD v93[3];

  v93[1] = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = (void *)MEMORY[0x1CAA4EB2C]();
  if (*(_QWORD *)(a1 + 64)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8),
        Current - *(double *)(v8 + 24) >= *(double *)(a1 + 96))
    && (*(double *)(v8 + 24) = Current,
        v85 = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(double *)(a1 + 104)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                            + 24);
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v5, "businessedEvent");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = MEMORY[0x1E0C809B0];
    v82[0] = MEMORY[0x1E0C809B0];
    v82[1] = 3221225472;
    v82[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_2;
    v82[3] = &unk_1E842D888;
    v83 = *(id *)(a1 + 40);
    v84 = *(id *)(a1 + 48);
    objc_msgSend(v9, "_enumerateBusinessAndPublicEventKeywordsForEvent:usingBlock:", v10, v82);

    if (!*(_QWORD *)(a1 + 112) && objc_msgSend(v5, "isPartOfTrip"))
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("PGHighlightTripSearchableText"), CFSTR("PGHighlightTripSearchableText"), CFSTR("Localizable"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v93[0] = v13;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v91 = &unk_1E84E4130;
      v92 = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v92, &v91, 1);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventCollection");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "eventMomentNodes");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v77[0] = v11;
      v77[1] = 3221225472;
      v77[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_202;
      v77[3] = &unk_1E842D8B0;
      v78 = *(id *)(a1 + 40);
      v79 = v15;
      v80 = *(id *)(a1 + 48);
      v81 = v13;
      v18 = v13;
      v19 = v15;
      objc_msgSend(v17, "enumerateNodesUsingBlock:", v77);

    }
    v20 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v5, "meaningfulEvent");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "meaningNodes");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v74[0] = v11;
    v74[1] = 3221225472;
    v74[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_203;
    v74[3] = &unk_1E842D7C0;
    v23 = v20;
    v24 = *(_QWORD *)(a1 + 32);
    v75 = v23;
    v76 = v24;
    v54 = v22;
    objc_msgSend(v22, "enumerateNodesUsingBlock:", v74);
    if (objc_msgSend(v23, "count"))
    {
      v89 = &unk_1E84E4148;
      v90 = v23;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v90, &v89, 1);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "eventCollection");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "eventMomentNodes");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v69[0] = v11;
      v69[1] = 3221225472;
      v69[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_205;
      v69[3] = &unk_1E842D8B0;
      v70 = *(id *)(a1 + 40);
      v71 = v25;
      v72 = *(id *)(a1 + 48);
      v73 = v23;
      v28 = v25;
      objc_msgSend(v27, "enumerateNodesUsingBlock:", v69);

    }
    v29 = *(void **)(a1 + 32);
    objc_msgSend(v5, "timedEvent");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "_holidayNodesForTimedEvent:", v30);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v31, "count"))
    {
      v52 = v6;
      v53 = v5;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v31, "count"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v65 = 0u;
      v66 = 0u;
      v67 = 0u;
      v68 = 0u;
      v33 = v31;
      v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v65, v88, 16);
      if (v34)
      {
        v35 = v34;
        v36 = *(_QWORD *)v66;
        do
        {
          for (i = 0; i != v35; ++i)
          {
            if (*(_QWORD *)v66 != v36)
              objc_enumerationMutation(v33);
            objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "name");
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v38, "length"))
            {
              objc_msgSend(MEMORY[0x1E0D4B170], "localizedNameForName:", v38);
              v39 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v32, "addObject:", v39);

            }
          }
          v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v65, v88, 16);
        }
        while (v35);
      }

      v86 = &unk_1E84E4160;
      v87 = v32;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v87, &v86, 1);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v53;
      objc_msgSend(v53, "eventCollection");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "eventMomentNodes");
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = MEMORY[0x1E0C809B0];
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_206;
      v60[3] = &unk_1E842D8B0;
      v61 = *(id *)(a1 + 40);
      v62 = v40;
      v63 = *(id *)(a1 + 48);
      v64 = v32;
      v43 = v32;
      v44 = v40;
      objc_msgSend(v42, "enumerateNodesUsingBlock:", v60);

      v6 = v52;
    }
    objc_msgSend(v5, "locatedEvent");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = objc_msgSend(v45, "happensPartiallyAtHomeOrWorkOfPersonNodes:", *(_QWORD *)(a1 + 56));

    if (v46)
    {
      objc_msgSend(v5, "eventCollection");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "eventMomentNodes");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      v55[0] = v11;
      v55[1] = 3221225472;
      v55[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_207;
      v55[3] = &unk_1E842D8B0;
      v49 = *(id *)(a1 + 56);
      v50 = *(_QWORD *)(a1 + 32);
      v51 = *(void **)(a1 + 40);
      v56 = v49;
      v57 = v50;
      v58 = v51;
      v59 = *(id *)(a1 + 48);
      objc_msgSend(v48, "enumerateNodesUsingBlock:", v55);

    }
  }
  objc_autoreleasePoolPop(v6);

}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  NSObject *v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(a2, "anyObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sourceNode");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)MEMORY[0x1E0CD1698];
  objc_msgSend(v7, "localIdentifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "uuidFromLocalIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "hasRoutineInfo"))
  {
    objc_msgSend(v6, "universalStartDate");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v13 = v11;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v13 = (id)objc_claimAutoreleasedReturnValue();
    }
    v14 = v13;

    objc_msgSend(v6, "universalEndDate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if (v16)
    {
      v18 = v16;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
      v18 = (id)objc_claimAutoreleasedReturnValue();
    }
    v15 = v18;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(*(id *)(a1 + 32), "aggregateKeywordArraysByCategoryMask:forMomentUUID:fromUniversalStartDate:toEndDate:", v5, v10, v14, v15);
  v19 = *(void **)(a1 + 40);
  v23 = 0;
  objc_msgSend(v19, "accumulatePublicEventsInPublicEventKeywords:forMomentUUID:error:", v5, v10, &v23);

  v20 = v23;
  if (v20)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "loggingConnection");
    v22 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v25 = v20;
      _os_log_error_impl(&dword_1CA237000, v22, OS_LOG_TYPE_ERROR, "Error returned by accumulatePublicEventsInPublicEventKeywords(): (%@)", buf, 0xCu);
    }

  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_202(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "aggregateKeywordsByCategoryMask:forMomentNode:", v4, v5);
  v6 = (void *)MEMORY[0x1E0CD1698];
  objc_msgSend(v5, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "uuidFromLocalIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)a1[6];
  v10 = a1[7];
  v14 = 0;
  objc_msgSend(v9, "accumulateTrip:forMomentUUID:error:", v10, v8, &v14);
  v11 = v14;
  if (v11)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "Error returned by accumulateTrip(): (%@)", buf, 0xCu);
    }

  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_203(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  id v11;
  uint64_t v12;
  _QWORD v13[4];
  id v14;
  uint64_t v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Gathering")) & 1) == 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      localizationKeyForMeaningLabel(v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
        objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "localizedStringForKey:value:table:", v6, v6, CFSTR("Localizable"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v8, v4);
      }
      else
      {
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "loggingConnection");
        v10 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v17 = v4;
          _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "No localization key for meaning label: (%@)", buf, 0xCu);
        }

      }
    }
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_204;
    v13[3] = &unk_1E842D7C0;
    v11 = *(id *)(a1 + 32);
    v12 = *(_QWORD *)(a1 + 40);
    v14 = v11;
    v15 = v12;
    objc_msgSend(v3, "traverseParentMeaningHierarchyUsingBlock:", v13);

  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_205(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "aggregateKeywordsByCategoryMask:forMomentNode:", v4, v5);
  v6 = (void *)MEMORY[0x1E0CD1698];
  objc_msgSend(v5, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "uuidFromLocalIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)a1[6];
  v10 = a1[7];
  v14 = 0;
  objc_msgSend(v9, "accumulateMeanings:forMomentUUID:error:", v10, v8, &v14);
  v11 = v14;
  if (v11)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "Error returned by accumulateMeanings(): (%@)", buf, 0xCu);
    }

  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_206(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  NSObject *v13;
  id v14;
  uint8_t buf[4];
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a2;
  objc_msgSend(v3, "aggregateKeywordsByCategoryMask:forMomentNode:", v4, v5);
  v6 = (void *)MEMORY[0x1E0CD1698];
  objc_msgSend(v5, "localIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "uuidFromLocalIdentifier:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)a1[6];
  v10 = a1[7];
  v14 = 0;
  objc_msgSend(v9, "accumulateHolidays:forMomentUUID:error:", v10, v8, &v14);
  v11 = v14;
  if (v11)
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "loggingConnection");
    v13 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v16 = v11;
      _os_log_error_impl(&dword_1CA237000, v13, OS_LOG_TYPE_ERROR, "Error returned by accumulateHolidays(): (%@)", buf, 0xCu);
    }

  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_207(uint64_t a1, void *a2)
{
  id v3;
  _QWORD v4[5];
  id v5;
  id v6;
  id v7;

  v3 = a2;
  if (objc_msgSend(v3, "happensPartiallyAtHomeOrWorkOfPersonNodes:", *(_QWORD *)(a1 + 32)))
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_2_208;
    v4[3] = &unk_1E8430558;
    v4[4] = *(_QWORD *)(a1 + 40);
    v5 = v3;
    v6 = *(id *)(a1 + 48);
    v7 = *(id *)(a1 + 56);
    objc_msgSend(v5, "enumeratePreciseAddressEdgesAndNodesUsingBlock:", v4);

  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_2_208(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  void *v29;
  NSObject *v30;
  void *v31;
  void *v32;
  id v33;
  _QWORD v34[4];
  id v35;
  uint64_t v36;
  uint8_t buf[4];
  id v38;
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "homeWorkNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(v6, "graph");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphNodeCollection nodesInGraph:](PGGraphMeNodeCollection, "nodesInGraph:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "homeOrWorkNodes");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "collectionByIntersecting:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v34[0] = MEMORY[0x1E0C809B0];
    v34[1] = 3221225472;
    v34[2] = __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_3;
    v34[3] = &unk_1E8432898;
    v14 = v7;
    v15 = *(_QWORD *)(a1 + 32);
    v35 = v14;
    v36 = v15;
    objc_msgSend(v13, "enumerateNodesUsingBlock:", v34);
    if (objc_msgSend(v14, "count"))
    {
      v16 = (void *)MEMORY[0x1E0CD1698];
      objc_msgSend(*(id *)(a1 + 40), "localIdentifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "uuidFromLocalIdentifier:", v17);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "universalStartDate");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = v19;
      if (v19)
      {
        v21 = v19;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
        v21 = (id)objc_claimAutoreleasedReturnValue();
      }
      v32 = v21;

      objc_msgSend(v5, "universalEndDate");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v22)
      {
        v24 = v22;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
        v24 = (id)objc_claimAutoreleasedReturnValue();
      }
      v25 = v24;

      v26 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v32, v25);
      objc_msgSend(*(id *)(a1 + 48), "aggregateKeywordsByCategoryMask:forMomentUUID:duringDateInterval:", v14, v18, v26);
      v27 = *(void **)(a1 + 56);
      v33 = 0;
      objc_msgSend(v27, "accumulateHomeAndWorkWithHomeAndWorkKeywords:forMomentUUID:error:", v14, v18, &v33);
      v28 = v33;
      if (v28)
      {
        v31 = v11;
        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "loggingConnection");
        v30 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v38 = v28;
          _os_log_error_impl(&dword_1CA237000, v30, OS_LOG_TYPE_ERROR, "Error returned by accumulateHomeAndWorkWithomeAndWorkKeywords(): (%@)", buf, 0xCu);
        }

        v11 = v31;
      }

    }
    v9 = v13;
  }

}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a2, "label");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("Home")))
  {
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], &unk_1E84E4190);
  }
  else if (objc_msgSend(v5, "isEqualToString:", CFSTR("Work")))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("PGWorkSearchableText"), CFSTR("PGWorkSearchableText"), CFSTR("Localizable"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v4, &unk_1E84E41A8);

  }
}

void __118__PGSearchKeywordComputer_assetSearchKeywordsByMomentUUIDWithEventUUIDs_ofType_searchEntityAccumulator_progressBlock___block_invoke_204(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  void *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    localizationKeyForMeaningLabel(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", v5, v5, CFSTR("Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v7, v3);
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "loggingConnection");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v3;
        _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "No localization key for meaning label: (%@)", (uint8_t *)&v10, 0xCu);
      }

    }
  }

}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  uint64_t v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t j;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t k;
  void *v34;
  double v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t m;
  void *v43;
  double v44;
  uint64_t v45;
  void *v46;
  void *v47;
  id v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t n;
  void *v52;
  double Current;
  uint64_t v54;
  void *v55;
  void *v56;
  double v57;
  uint64_t v58;
  id v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  double v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  id v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t ii;
  void *v74;
  void *v75;
  double v76;
  uint64_t v77;
  void *v78;
  void *v79;
  id v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t jj;
  void *v84;
  void *v85;
  char v86;
  void *v87;
  void *v88;
  double v89;
  uint64_t v90;
  void *v91;
  uint64_t v92;
  void *v93;
  int v94;
  void *v95;
  void *v96;
  double v97;
  uint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  double v103;
  uint64_t v104;
  void *v105;
  void *v106;
  void *v107;
  id v108;
  uint64_t v109;
  uint64_t v110;
  uint64_t kk;
  void *v112;
  double v113;
  uint64_t v114;
  void *v115;
  void *v116;
  void *v117;
  id v118;
  double v119;
  uint64_t v120;
  unint64_t v121;
  void *v122;
  id v123;
  double v124;
  uint64_t v125;
  void *v126;
  void *v127;
  id v128;
  void *v129;
  void *v130;
  void *v131;
  id v132;
  void *v133;
  void *context;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  id v141;
  _QWORD v142[4];
  id v143;
  double v144;
  char v145;
  _QWORD v146[4];
  id v147;
  uint64_t *v148;
  uint64_t v149;
  uint64_t *v150;
  uint64_t v151;
  uint64_t v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  _QWORD v157[4];
  id v158;
  _QWORD v159[4];
  id v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  __int128 v168;
  _QWORD v169[5];
  id v170;
  __int128 v171;
  __int128 v172;
  __int128 v173;
  __int128 v174;
  __int128 v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  __int128 v179;
  __int128 v180;
  __int128 v181;
  __int128 v182;
  __int128 v183;
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  __int128 v190;
  _BYTE v191[128];
  _BYTE v192[128];
  _BYTE v193[128];
  _BYTE v194[128];
  _BYTE v195[128];
  _BYTE v196[128];
  _BYTE v197[128];
  _BYTE v198[128];
  uint64_t v199;

  v199 = *MEMORY[0x1E0C80C00];
  v141 = a2;
  context = (void *)MEMORY[0x1CAA4EB2C]();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(a1 + 96)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24);
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v140 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v141, "peopledEvent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "personNodes");
  v139 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v139, "count"))
  {
    v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v187 = 0u;
    v188 = 0u;
    v189 = 0u;
    v190 = 0u;
    v6 = v139;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v187, v198, 16);
    if (v7)
    {
      v8 = *(_QWORD *)v188;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v188 != v8)
            objc_enumerationMutation(v6);
          v10 = (void *)MEMORY[0x1E0CD1698];
          objc_msgSend(*(id *)(*((_QWORD *)&v187 + 1) + 8 * i), "localIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "uuidFromLocalIdentifier:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          if (v12)
            objc_msgSend(v5, "addObject:", v12);

        }
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v187, v198, 16);
      }
      while (v7);
    }

    objc_msgSend(v140, "setObject:forKeyedSubscript:", v5, &unk_1E84E40B8);
  }
  if (*(_QWORD *)(a1 + 64)
    && (v13 = CFAbsoluteTimeGetCurrent(),
        v14 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
        v13 - *(double *)(v14 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v14 + 24) = v13,
        LOBYTE(v149) = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v141, "peopledEvent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "petNodes");
    v138 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v138, "count"))
    {
      v16 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
      v185 = 0u;
      v186 = 0u;
      v183 = 0u;
      v184 = 0u;
      v17 = v138;
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v183, v197, 16);
      if (v18)
      {
        v19 = *(_QWORD *)v184;
        do
        {
          for (j = 0; j != v18; ++j)
          {
            if (*(_QWORD *)v184 != v19)
              objc_enumerationMutation(v17);
            v21 = (void *)MEMORY[0x1E0CD1698];
            objc_msgSend(*(id *)(*((_QWORD *)&v183 + 1) + 8 * j), "localIdentifier");
            v22 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "uuidFromLocalIdentifier:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();

            if (v23)
              objc_msgSend(v16, "addObject:", v23);

          }
          v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v183, v197, 16);
        }
        while (v18);
      }

      objc_msgSend(v140, "setObject:forKeyedSubscript:", v16, &unk_1E84E40D0);
    }
    if (*(_QWORD *)(a1 + 64)
      && (v24 = CFAbsoluteTimeGetCurrent(),
          v25 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
          v24 - *(double *)(v25 + 24) >= *(double *)(a1 + 104))
      && (*(double *)(v25 + 24) = v24,
          LOBYTE(v149) = 0,
          (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72)
                                                                                               + 8)
                                                                                   + 24)),
          (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                 + 24)) != 0))
    {
      *a3 = 1;
    }
    else
    {
      objc_msgSend(v141, "peopledEvent");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "socialGroupNodes");
      v137 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v137, "count"))
      {
        v27 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
        +[PGGraphSocialGroupNode importanceSortDescriptors](PGGraphSocialGroupNode, "importanceSortDescriptors");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v137, "sortedArrayUsingDescriptors:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        v181 = 0u;
        v182 = 0u;
        v179 = 0u;
        v180 = 0u;
        v30 = v29;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v179, v196, 16);
        if (v31)
        {
          v32 = *(_QWORD *)v180;
          do
          {
            for (k = 0; k != v31; ++k)
            {
              if (*(_QWORD *)v180 != v32)
                objc_enumerationMutation(v30);
              objc_msgSend(*(id *)(a1 + 32), "_personUUIDsInSocialGroupNode:photoLibrary:", *(_QWORD *)(*((_QWORD *)&v179 + 1) + 8 * k), *(_QWORD *)(a1 + 40));
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              if ((unint64_t)objc_msgSend(v34, "count") >= 2)
                objc_msgSend(v27, "addObject:", v34);

            }
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v179, v196, 16);
          }
          while (v31);
        }

        if (objc_msgSend(v27, "count"))
          objc_msgSend(v140, "setObject:forKeyedSubscript:", v27, &unk_1E84E40E8);

      }
      if (*(_QWORD *)(a1 + 64)
        && (v35 = CFAbsoluteTimeGetCurrent(),
            v36 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
            v35 - *(double *)(v36 + 24) >= *(double *)(a1 + 104))
        && (*(double *)(v36 + 24) = v35,
            LOBYTE(v149) = 0,
            (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72)
                                                                                                 + 8)
                                                                                     + 24)),
            (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88)
                                                                                               + 8)
                                                                                   + 24)) != 0))
      {
        *a3 = 1;
      }
      else
      {
        objc_msgSend(v141, "locatedEvent");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "addressNodes");
        v136 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v136, "count"))
        {
          objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v136, "count"));
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          v177 = 0u;
          v178 = 0u;
          v175 = 0u;
          v176 = 0u;
          v39 = v136;
          v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v175, v195, 16);
          if (v40)
          {
            v41 = *(_QWORD *)v176;
            do
            {
              for (m = 0; m != v40; ++m)
              {
                if (*(_QWORD *)v176 != v41)
                  objc_enumerationMutation(v39);
                locationNamesByCategoryForAddress(*(void **)(*((_QWORD *)&v175 + 1) + 8 * m));
                v43 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v38, "addObject:", v43);

              }
              v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v175, v195, 16);
            }
            while (v40);
          }

          objc_msgSend(v140, "setObject:forKeyedSubscript:", v38, &unk_1E84E4100);
        }
        if (*(_QWORD *)(a1 + 64)
          && (v44 = CFAbsoluteTimeGetCurrent(),
              v45 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
              v44 - *(double *)(v45 + 24) >= *(double *)(a1 + 104))
          && (*(double *)(v45 + 24) = v44,
              LOBYTE(v149) = 0,
              (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                       + 24)),
              (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88)
                                                                                                 + 8)
                                                                                     + 24)) != 0))
        {
          *a3 = 1;
        }
        else
        {
          objc_msgSend(v141, "timedEvent");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "dateNodes");
          v133 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v133, "count"))
          {
            objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v133, "count"));
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            v173 = 0u;
            v174 = 0u;
            v171 = 0u;
            v172 = 0u;
            v48 = v133;
            v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v171, v194, 16);
            if (v49)
            {
              v50 = *(_QWORD *)v172;
              do
              {
                for (n = 0; n != v49; ++n)
                {
                  if (*(_QWORD *)v172 != v50)
                    objc_enumerationMutation(v48);
                  objc_msgSend(*(id *)(*((_QWORD *)&v171 + 1) + 8 * n), "localDate");
                  v52 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v52)
                    objc_msgSend(v47, "addObject:", v52);

                }
                v49 = objc_msgSend(v48, "countByEnumeratingWithState:objects:count:", &v171, v194, 16);
              }
              while (v49);
            }

            objc_msgSend(v140, "setObject:forKeyedSubscript:", v47, &unk_1E84E4118);
          }
          if (*(_QWORD *)(a1 + 64))
          {
            Current = CFAbsoluteTimeGetCurrent();
            v54 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
            if (Current - *(double *)(v54 + 24) >= *(double *)(a1 + 104))
            {
              *(double *)(v54 + 24) = Current;
              LOBYTE(v149) = 0;
              (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                       + 24));
              *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88)
                                                                                                + 8)
                                                                                    + 24);
              if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
                goto LABEL_81;
            }
          }
          if (*(_QWORD *)(a1 + 112) && objc_msgSend(v141, "isTrip"))
          {
            objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
            v55 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("PGHighlightTripSearchableText"), CFSTR("PGHighlightTripSearchableText"), CFSTR("Localizable"));
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "setObject:forKeyedSubscript:", v56, &unk_1E84E4130);

          }
          if (*(_QWORD *)(a1 + 64)
            && (v57 = CFAbsoluteTimeGetCurrent(),
                v58 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
                v57 - *(double *)(v58 + 24) >= *(double *)(a1 + 104))
            && (*(double *)(v58 + 24) = v57,
                LOBYTE(v149) = 0,
                (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                         + 24)),
                (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                       + 24)) != 0))
          {
LABEL_81:
            *a3 = 1;
          }
          else
          {
            v59 = objc_alloc_init(MEMORY[0x1E0C99E20]);
            objc_msgSend(v141, "meaningfulEvent");
            v60 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v60, "meaningNodes");
            v61 = (void *)objc_claimAutoreleasedReturnValue();

            if (!v61)
            {
              if ((objc_msgSend(v141, "isTrip") & 1) != 0)
              {
                v61 = 0;
              }
              else
              {
                objc_msgSend(v141, "eventCollection");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v62, "eventMomentNodes");
                v63 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v63, "meaningNodes");
                v61 = (void *)objc_claimAutoreleasedReturnValue();

              }
            }
            v169[0] = MEMORY[0x1E0C809B0];
            v169[1] = 3221225472;
            v169[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_172;
            v169[3] = &unk_1E842D7C0;
            v169[4] = *(_QWORD *)(a1 + 32);
            v132 = v59;
            v170 = v132;
            v129 = v61;
            objc_msgSend(v61, "enumerateNodesUsingBlock:", v169);
            if (objc_msgSend(v132, "count"))
            {
              objc_msgSend(v132, "allObjects");
              v64 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v140, "setObject:forKeyedSubscript:", v64, &unk_1E84E4148);

            }
            if (*(_QWORD *)(a1 + 64)
              && (v65 = CFAbsoluteTimeGetCurrent(),
                  v66 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
                  v65 - *(double *)(v66 + 24) >= *(double *)(a1 + 104))
              && (*(double *)(v66 + 24) = v65,
                  LOBYTE(v149) = 0,
                  (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                           + 24)),
                  (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                         + 24)) != 0))
            {
              *a3 = 1;
            }
            else
            {
              v67 = *(void **)(a1 + 32);
              objc_msgSend(v141, "timedEvent");
              v68 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v67, "_holidayNodesForTimedEvent:", v68);
              v131 = (void *)objc_claimAutoreleasedReturnValue();

              if (objc_msgSend(v131, "count"))
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v131, "count"));
                v69 = (void *)objc_claimAutoreleasedReturnValue();
                v167 = 0u;
                v168 = 0u;
                v165 = 0u;
                v166 = 0u;
                v70 = v131;
                v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v165, v193, 16);
                if (v71)
                {
                  v72 = *(_QWORD *)v166;
                  do
                  {
                    for (ii = 0; ii != v71; ++ii)
                    {
                      if (*(_QWORD *)v166 != v72)
                        objc_enumerationMutation(v70);
                      objc_msgSend(*(id *)(*((_QWORD *)&v165 + 1) + 8 * ii), "name");
                      v74 = (void *)objc_claimAutoreleasedReturnValue();
                      if (objc_msgSend(v74, "length"))
                      {
                        objc_msgSend(MEMORY[0x1E0D4B170], "localizedNameForName:", v74);
                        v75 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v69, "addObject:", v75);

                      }
                    }
                    v71 = objc_msgSend(v70, "countByEnumeratingWithState:objects:count:", &v165, v193, 16);
                  }
                  while (v71);
                }

                objc_msgSend(v140, "setObject:forKeyedSubscript:", v69, &unk_1E84E4160);
              }
              if (*(_QWORD *)(a1 + 64)
                && (v76 = CFAbsoluteTimeGetCurrent(),
                    v77 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
                    v76 - *(double *)(v77 + 24) >= *(double *)(a1 + 104))
                && (*(double *)(v77 + 24) = v76,
                    LOBYTE(v149) = 0,
                    (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                             + 24)),
                    (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                           + 24)) != 0))
              {
                *a3 = 1;
              }
              else
              {
                objc_msgSend(v141, "locatedEvent");
                v78 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v78, "roiNodes");
                v130 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v130, "count"))
                {
                  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v130, "count"));
                  v79 = (void *)objc_claimAutoreleasedReturnValue();
                  v163 = 0u;
                  v164 = 0u;
                  v161 = 0u;
                  v162 = 0u;
                  v80 = v130;
                  v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v161, v192, 16);
                  if (v81)
                  {
                    v82 = *(_QWORD *)v162;
                    do
                    {
                      for (jj = 0; jj != v81; ++jj)
                      {
                        if (*(_QWORD *)v162 != v82)
                          objc_enumerationMutation(v80);
                        v84 = *(void **)(*((_QWORD *)&v161 + 1) + 8 * jj);
                        objc_msgSend(v84, "label");
                        v85 = (void *)objc_claimAutoreleasedReturnValue();
                        v86 = objc_msgSend(v85, "isEqualToString:", CFSTR("Urban"));

                        if ((v86 & 1) == 0)
                        {
                          objc_msgSend(v84, "localizedName");
                          v87 = (void *)objc_claimAutoreleasedReturnValue();
                          if (objc_msgSend(v87, "length"))
                            objc_msgSend(v79, "addObject:", v87);

                        }
                      }
                      v81 = objc_msgSend(v80, "countByEnumeratingWithState:objects:count:", &v161, v192, 16);
                    }
                    while (v81);
                  }

                  if (objc_msgSend(v79, "count"))
                    v88 = v79;
                  else
                    v88 = 0;
                  objc_msgSend(v140, "setObject:forKeyedSubscript:", v88, &unk_1E84E4178);

                }
                if (*(_QWORD *)(a1 + 64))
                {
                  v89 = CFAbsoluteTimeGetCurrent();
                  v90 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
                  if (v89 - *(double *)(v90 + 24) >= *(double *)(a1 + 104))
                  {
                    *(double *)(v90 + 24) = v89;
                    LOBYTE(v149) = 0;
                    (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                             + 24));
                    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                          + 24);
                    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
                      goto LABEL_134;
                  }
                }
                objc_msgSend(v141, "locatedEvent");
                v91 = (void *)objc_claimAutoreleasedReturnValue();
                if (objc_msgSend(v91, "happensPartiallyAtHomeOfPersonNodes:", *(_QWORD *)(a1 + 48)))
                  v92 = MEMORY[0x1E0C9AAB0];
                else
                  v92 = 0;
                objc_msgSend(v140, "setObject:forKeyedSubscript:", v92, &unk_1E84E4190);

                objc_msgSend(v141, "locatedEvent");
                v93 = (void *)objc_claimAutoreleasedReturnValue();
                v94 = objc_msgSend(v93, "happensPartiallyAtWorkOfPersonNodes:", *(_QWORD *)(a1 + 48));

                if (v94)
                {
                  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
                  v95 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v95, "localizedStringForKey:value:table:", CFSTR("PGWorkSearchableText"), CFSTR("PGWorkSearchableText"), CFSTR("Localizable"));
                  v96 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v140, "setObject:forKeyedSubscript:", v96, &unk_1E84E41A8);

                }
                if (*(_QWORD *)(a1 + 64)
                  && (v97 = CFAbsoluteTimeGetCurrent(),
                      v98 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
                      v97 - *(double *)(v98 + 24) >= *(double *)(a1 + 104))
                  && (*(double *)(v98 + 24) = v97,
                      LOBYTE(v149) = 0,
                      (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                               + 24)),
                      (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                             + 24)) != 0))
                {
LABEL_134:
                  *a3 = 1;
                }
                else
                {
                  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                  v99 = (void *)objc_claimAutoreleasedReturnValue();
                  v100 = *(void **)(a1 + 32);
                  objc_msgSend(v141, "businessedEvent");
                  v101 = (void *)objc_claimAutoreleasedReturnValue();
                  v159[0] = MEMORY[0x1E0C809B0];
                  v159[1] = 3221225472;
                  v159[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_184;
                  v159[3] = &unk_1E842D7E8;
                  v102 = v99;
                  v160 = v102;
                  objc_msgSend(v100, "_enumerateBusinessAndPublicEventKeywordsForEvent:usingBlock:", v101, v159);

                  v157[0] = MEMORY[0x1E0C809B0];
                  v157[1] = 3221225472;
                  v157[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_3;
                  v157[3] = &unk_1E842D810;
                  v128 = v140;
                  v158 = v128;
                  objc_msgSend(v102, "enumerateKeysAndObjectsUsingBlock:", v157);
                  if (*(_QWORD *)(a1 + 64)
                    && (v103 = CFAbsoluteTimeGetCurrent(),
                        v104 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
                        v103 - *(double *)(v104 + 24) >= *(double *)(a1 + 104))
                    && (*(double *)(v104 + 24) = v103,
                        LOBYTE(v149) = 0,
                        (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                                                 + 24)),
                        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                               + 24)) != 0))
                  {
                    *a3 = 1;
                  }
                  else
                  {
                    objc_msgSend(v141, "timedEvent");
                    v105 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v105, "seasonNodes");
                    v106 = (void *)objc_claimAutoreleasedReturnValue();

                    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v106, "count"));
                    v107 = (void *)objc_claimAutoreleasedReturnValue();
                    v155 = 0u;
                    v156 = 0u;
                    v153 = 0u;
                    v154 = 0u;
                    v108 = v106;
                    v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v153, v191, 16);
                    if (v109)
                    {
                      v110 = *(_QWORD *)v154;
                      do
                      {
                        for (kk = 0; kk != v109; ++kk)
                        {
                          if (*(_QWORD *)v154 != v110)
                            objc_enumerationMutation(v108);
                          objc_msgSend(*(id *)(*((_QWORD *)&v153 + 1) + 8 * kk), "localizedName");
                          v112 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v107, "addObject:", v112);

                        }
                        v109 = objc_msgSend(v108, "countByEnumeratingWithState:objects:count:", &v153, v191, 16);
                      }
                      while (v109);
                    }

                    objc_msgSend(v128, "setObject:forKeyedSubscript:", v107, &unk_1E84E41C0);
                    if (*(_QWORD *)(a1 + 64)
                      && (v113 = CFAbsoluteTimeGetCurrent(),
                          v114 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
                          v113 - *(double *)(v114 + 24) >= *(double *)(a1 + 104))
                      && (*(double *)(v114 + 24) = v113,
                          LOBYTE(v149) = 0,
                          (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)),
                          (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                                 + 24)) != 0))
                    {
                      *a3 = 1;
                    }
                    else
                    {
                      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
                      v115 = (void *)objc_claimAutoreleasedReturnValue();
                      v149 = 0;
                      v150 = &v149;
                      v151 = 0x2020000000;
                      v152 = 0;
                      objc_msgSend(v141, "eventCollection");
                      v116 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v116, "eventMomentNodes");
                      v117 = (void *)objc_claimAutoreleasedReturnValue();
                      v146[0] = MEMORY[0x1E0C809B0];
                      v146[1] = 3221225472;
                      v146[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_189;
                      v146[3] = &unk_1E8433E30;
                      v148 = &v149;
                      v118 = v115;
                      v147 = v118;
                      objc_msgSend(v117, "enumerateNodesUsingBlock:", v146);

                      if (*(_QWORD *)(a1 + 64)
                        && (v119 = CFAbsoluteTimeGetCurrent(),
                            v120 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
                            v119 - *(double *)(v120 + 24) >= *(double *)(a1 + 104))
                        && (*(double *)(v120 + 24) = v119,
                            v145 = 0,
                            (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)),
                            (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24)) != 0))
                      {
                        *a3 = 1;
                      }
                      else
                      {
                        v121 = v150[3];
                        objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v118, "count"));
                        v122 = (void *)objc_claimAutoreleasedReturnValue();
                        v142[0] = MEMORY[0x1E0C809B0];
                        v142[1] = 3221225472;
                        v142[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_3_194;
                        v142[3] = &unk_1E842D860;
                        v144 = (double)v121 * 0.3;
                        v123 = v122;
                        v143 = v123;
                        objc_msgSend(v118, "enumerateKeysAndObjectsUsingBlock:", v142);
                        objc_msgSend(v128, "setObject:forKeyedSubscript:", v123, &unk_1E84E41D8);
                        if (*(_QWORD *)(a1 + 64)
                          && (v124 = CFAbsoluteTimeGetCurrent(),
                              v125 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
                              v124 - *(double *)(v125 + 24) >= *(double *)(a1 + 104))
                          && (*(double *)(v125 + 24) = v124,
                              v145 = 0,
                              (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24)),
                              (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) |= v145) != 0))
                        {
                          *a3 = 1;
                        }
                        else
                        {
                          v126 = *(void **)(a1 + 56);
                          objc_msgSend(v141, "UUID");
                          v127 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v126, "setObject:forKeyedSubscript:", v128, v127);

                        }
                      }

                      _Block_object_dispose(&v149, 8);
                    }

                  }
                }

              }
            }

          }
        }

      }
    }

  }
  objc_autoreleasePoolPop(context);

}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_172(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  uint8_t buf[4];
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "label");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v4, "isEqualToString:", CFSTR("Gathering")) & 1) == 0)
  {
    localizationKeyForMeaningLabel(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "localizedStringForKey:value:table:", v5, v5, CFSTR("Localizable"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(*(id *)(a1 + 40), "addObject:", v7);
    }
    else
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "loggingConnection");
      v9 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v14 = v4;
        _os_log_error_impl(&dword_1CA237000, v9, OS_LOG_TYPE_ERROR, "No localization key for meaning label: (%@)", buf, 0xCu);
      }

    }
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_174;
    v11[3] = &unk_1E842D7C0;
    v10 = *(void **)(a1 + 40);
    v11[4] = *(_QWORD *)(a1 + 32);
    v12 = v10;
    objc_msgSend(v3, "traverseParentMeaningHierarchyUsingBlock:", v11);

  }
}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_184(uint64_t a1, uint64_t a2, void *a3)
{
  _QWORD v4[4];
  id v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_2;
  v4[3] = &unk_1E842F880;
  v5 = *(id *)(a1 + 32);
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v4);

}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  objc_msgSend(a3, "allObjects");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_189(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  _QWORD v6[4];
  id v7;
  uint64_t v8;

  v3 = a2;
  v4 = objc_msgSend(v3, "numberOfAssets");
  v5 = MEMORY[0x1E0C809B0];
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) += v4;
  v6[0] = v5;
  v6[1] = 3221225472;
  v6[2] = __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_2_190;
  v6[3] = &unk_1E842D838;
  v7 = *(id *)(a1 + 32);
  v8 = v4;
  objc_msgSend(v3, "enumerateSceneEdgesAndNodesUsingBlock:", v6);

}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_3_194(uint64_t a1, void *a2, void *a3)
{
  double v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "doubleValue");
  if (v5 >= *(double *)(a1 + 40))
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v6);

}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_2_190(uint64_t a1, void *a2, void *a3)
{
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  if (objc_msgSend(a2, "isSearchableForEvent"))
  {
    if (objc_msgSend(v10, "isIndexed"))
    {
      v5 = objc_msgSend(v10, "sceneIdentifier");
      if (v5)
      {
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "unsignedIntegerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", *(_QWORD *)(a1 + 40) + v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v9, v6);

      }
    }
  }

}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  id v7;

  v7 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v7);
  }
  objc_msgSend(v6, "addObjectsFromArray:", v5);

}

void __97__PGSearchKeywordComputer_searchKeywordsByEventWithEventUUIDs_ofType_photoLibrary_progressBlock___block_invoke_174(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  localizationKeyForMeaningLabel(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", v4, v4, CFSTR("Localizable"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 40), "addObject:", v6);
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v9 = 138412290;
      v10 = v3;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "No localization key for meaning label: (%@)", (uint8_t *)&v9, 0xCu);
    }

  }
}

@end
