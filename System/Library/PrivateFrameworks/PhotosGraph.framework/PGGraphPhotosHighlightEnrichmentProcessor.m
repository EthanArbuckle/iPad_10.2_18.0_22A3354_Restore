@implementation PGGraphPhotosHighlightEnrichmentProcessor

- (PGGraphPhotosHighlightEnrichmentProcessor)init
{
  return -[PGGraphPhotosHighlightEnrichmentProcessor initWithHighlightTailorOptions:](self, "initWithHighlightTailorOptions:", 255);
}

- (PGGraphPhotosHighlightEnrichmentProcessor)initWithHighlightTailorOptions:(unint64_t)a3
{
  PGGraphPhotosHighlightEnrichmentProcessor *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PGGraphPhotosHighlightEnrichmentProcessor;
  result = -[PGGraphPhotosHighlightEnrichmentProcessor init](&v5, sel_init);
  if (result)
  {
    result->_highlightTailorOptions = a3;
    result->_curatedLibraryFTEIsReady = 0;
  }
  return result;
}

- (void)enrichDataModelWithManager:(id)a3 curationContext:(id)a4 graphUpdateInventory:(id)a5 progressBlock:(id)a6
{
  id v10;
  void *v11;
  double v12;
  char v13;
  NSObject *v14;
  os_signpost_id_t v15;
  NSObject *v16;
  NSObject *v17;
  PGHighlightTailor *v18;
  void *v19;
  uint64_t v20;
  int v21;
  int v22;
  unint64_t highlightTailorOptions;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  unint64_t v30;
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint32_t denom;
  uint32_t numer;
  NSObject *v37;
  NSObject *v38;
  double Current;
  char v40;
  uint64_t v41;
  unint64_t v42;
  os_signpost_id_t spid;
  id v44;
  id v45;
  PGHighlightTailor *v46;
  id v47;
  char v48;
  _QWORD v49[4];
  id v50;
  uint64_t *v51;
  uint64_t *v52;
  uint64_t v53;
  _QWORD v54[4];
  id v55;
  uint64_t *v56;
  uint64_t *v57;
  uint64_t v58;
  _QWORD v59[4];
  id v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t v63;
  mach_timebase_info info;
  uint64_t v65;
  double *v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  char v72;
  int buf;
  _QWORD v74[5];

  *(_QWORD *)((char *)&v74[2] + 4) = *MEMORY[0x1E0C80C00];
  v47 = a3;
  v44 = a4;
  v10 = a5;
  v45 = a6;
  v11 = _Block_copy(v45);
  v69 = 0;
  v70 = &v69;
  v71 = 0x2020000000;
  v72 = 0;
  v65 = 0;
  v66 = (double *)&v65;
  v67 = 0x2020000000;
  v68 = 0;
  if (!v11
    || (v12 = CFAbsoluteTimeGetCurrent(), v12 - v66[3] < 0.01)
    || (v66[3] = v12,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v11 + 2))(v11, &info, 0.0),
        v13 = *((_BYTE *)v70 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v70 + 24) = v13) == 0))
  {
    objc_msgSend(v47, "enrichmentLoggingConnection");
    v14 = (id)objc_claimAutoreleasedReturnValue();
    v15 = os_signpost_id_generate(v14);
    v16 = v14;
    v17 = v16;
    v42 = v15 - 1;
    spid = v15;
    if (v15 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v16))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v17, OS_SIGNPOST_INTERVAL_BEGIN, v15, "PGGraphPhotosHighlightEnrichmentProcessor", ", (uint8_t *)&buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v41 = mach_absolute_time();
    v18 = [PGHighlightTailor alloc];
    objc_msgSend(v47, "workingContextForEnrichment");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = -[PGHighlightTailor initWithWorkingContext:](v18, "initWithWorkingContext:", v19);

    v20 = objc_msgSend(v10, "updateType");
    v21 = objc_msgSend(v10, "isResumingFullAnalysis");
    if (v20 == 4)
      v22 = 1;
    else
      v22 = v21;
    if (v22 == 1)
    {
      highlightTailorOptions = self->_highlightTailorOptions;
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __123__PGGraphPhotosHighlightEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke;
      v59[3] = &unk_1E8434F30;
      v60 = v11;
      v61 = &v65;
      v62 = &v69;
      v63 = 0x3F847AE147AE147BLL;
      -[PGHighlightTailor enrichAllHighlightsWithOptions:progressBlock:](v46, "enrichAllHighlightsWithOptions:progressBlock:", highlightTailorOptions, v59);
      if (*((_BYTE *)v70 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          buf = 67109378;
          LODWORD(v74[0]) = 68;
          WORD2(v74[0]) = 2080;
          *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Graph/Data Model Enrichment/PGGraphPhotosHighlightEnrichmentProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }

        goto LABEL_42;
      }
      -[PGGraphPhotosHighlightEnrichmentProcessor _logFirstTimeExperienceMetricsIfNeededWithManager:](self, "_logFirstTimeExperienceMetricsIfNeededWithManager:", v47);
      v26 = v60;
LABEL_32:

      v34 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v37 = v17;
      v38 = v37;
      if (v42 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v38, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphPhotosHighlightEnrichmentProcessor", ", (uint8_t *)&buf, 2u);
      }

      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        buf = 136315394;
        v74[0] = "PGGraphPhotosHighlightEnrichmentProcessor";
        LOWORD(v74[1]) = 2048;
        *(double *)((char *)&v74[1] + 2) = (float)((float)((float)((float)(v34 - v41) * (float)numer) / (float)denom)
                                                 / 1000000.0);
        _os_log_impl(&dword_1CA237000, v38, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
      }
      if (v11)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v66[3] >= 0.01)
        {
          v66[3] = Current;
          v48 = 0;
          (*((void (**)(void *, char *, double))v11 + 2))(v11, &v48, 1.0);
          v40 = *((_BYTE *)v70 + 24) | v48;
          *((_BYTE *)v70 + 24) = v40;
          if (v40)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              buf = 67109378;
              LODWORD(v74[0]) = 106;
              WORD2(v74[0]) = 2080;
              *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Graph/Data Model Enrichment/PGGraphPhotosHighlightEn"
                                             "richmentProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_42;
    }
    if (v20 == 2)
      v24 = 127;
    else
      v24 = 4;
    objc_msgSend(v10, "highlightsToProcessForKind:withHighlightUpdateTypes:includeHighlightsToIngest:", 0, v24, v20 == 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "allObjects");
    v26 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "highlightsToProcessForKind:withHighlightUpdateTypes:includeHighlightsToIngest:", 3, v24, v20 == 2);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "allObjects");
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGGraphPhotosHighlightEnrichmentProcessor _dayGroupHighlightsToEnrichForDayHighlights:dayGroupHighlights:](self, "_dayGroupHighlightsToEnrichForDayHighlights:dayGroupHighlights:", v26, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    v30 = self->_highlightTailorOptions;
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __123__PGGraphPhotosHighlightEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke_165;
    v54[3] = &unk_1E8434F30;
    v31 = v11;
    v55 = v31;
    v56 = &v65;
    v57 = &v69;
    v58 = 0x3F847AE147AE147BLL;
    -[PGHighlightTailor enrichDayHighlights:dayGroupHighlights:withOptions:progressBlock:](v46, "enrichDayHighlights:dayGroupHighlights:withOptions:progressBlock:", v26, v29, v30, v54);
    if (*((_BYTE *)v70 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        LODWORD(v74[0]) = 88;
        WORD2(v74[0]) = 2080;
        *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Data Model Enrichment/PGGraphPhotosHighlightEnrichmentProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
LABEL_29:

LABEL_42:
      goto LABEL_43;
    }
    if ((~LODWORD(self->_highlightTailorOptions) & 0x26) != 0)
    {
      objc_msgSend(v10, "highlightsToProcessForKind:withHighlightUpdateTypes:includeHighlightsToIngest:", 0, 123, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "allObjects");
      v33 = (void *)objc_claimAutoreleasedReturnValue();

      v49[0] = MEMORY[0x1E0C809B0];
      v49[1] = 3221225472;
      v49[2] = __123__PGGraphPhotosHighlightEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke_166;
      v49[3] = &unk_1E8434F30;
      v50 = v31;
      v51 = &v65;
      v52 = &v69;
      v53 = 0x3F847AE147AE147BLL;
      -[PGHighlightTailor enrichHighlights:options:progressBlock:](v46, "enrichHighlights:options:progressBlock:", v33, -1073741786, v49);
      if (*((_BYTE *)v70 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          buf = 67109378;
          LODWORD(v74[0]) = 101;
          WORD2(v74[0]) = 2080;
          *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Graph/Data Model Enrichment/PGGraphPhotosHighlightEnrichmentProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
        }

        goto LABEL_29;
      }

    }
    goto LABEL_32;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 67109378;
    LODWORD(v74[0]) = 56;
    WORD2(v74[0]) = 2080;
    *(_QWORD *)((char *)v74 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Data Model Enrichment/PGGraphPhotosHighlightEnrichmentProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_43:
  _Block_object_dispose(&v65, 8);
  _Block_object_dispose(&v69, 8);

}

- (id)_dayGroupHighlightsToEnrichForDayHighlights:(id)a3 dayGroupHighlights:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = a3;
  v6 = a4;
  if (!objc_msgSend(v5, "count"))
    goto LABEL_5;
  objc_msgSend(v5, "firstObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "fetchParentDayGroupHighlightsForDayHighlights:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v8, "count"))
  {

LABEL_5:
    v10 = v6;
    goto LABEL_6;
  }
  objc_msgSend(MEMORY[0x1E0C99E20], "setWithArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v6);
  objc_msgSend(v9, "allObjects");
  v10 = (id)objc_claimAutoreleasedReturnValue();

LABEL_6:
  return v10;
}

- (void)_logFirstTimeExperienceMetricsIfNeededWithManager:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;

  v12 = a3;
  objc_msgSend(v12, "photoLibrary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "pg_urlForGraphApplicationData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("ftemetrics"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

  if (v9)
  {
    self->_curatedLibraryFTEIsReady = 1;
  }
  else if (objc_msgSend((id)objc_opt_class(), "hasCompletedFirstTimeExperienceForLibrary:", v4))
  {
    v13[0] = MEMORY[0x1E0C809B0];
    v13[1] = 3221225472;
    v13[2] = __95__PGGraphPhotosHighlightEnrichmentProcessor__logFirstTimeExperienceMetricsIfNeededWithManager___block_invoke;
    v13[3] = &unk_1E8435640;
    v14 = v4;
    v15 = v12;
    objc_msgSend(v15, "performSynchronousConcurrentGraphReadUsingBlock:", v13);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D50], "data");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "createFileAtPath:contents:attributes:", v7, v11, 0);

    self->_curatedLibraryFTEIsReady = 1;
  }

}

- (unint64_t)highlightTailorOptions
{
  return self->_highlightTailorOptions;
}

- (void)setHighlightTailorOptions:(unint64_t)a3
{
  self->_highlightTailorOptions = a3;
}

- (BOOL)curatedLibraryFTEIsReady
{
  return self->_curatedLibraryFTEIsReady;
}

void __95__PGGraphPhotosHighlightEnrichmentProcessor__logFirstTimeExperienceMetricsIfNeededWithManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  PGCuratedLibraryFTEMetricEvent *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  PGCuratedLibraryFTEMetricEvent *v11;

  v3 = a2;
  v4 = [PGCuratedLibraryFTEMetricEvent alloc];
  objc_msgSend(v3, "graph");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = objc_msgSend(v5, "librarySizeRange");
  objc_msgSend(*(id *)(a1 + 32), "migrationDate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[PGCuratedLibraryFTEMetricEvent initWithLibrarySizeRange:migrationDate:](v4, "initWithLibrarySizeRange:migrationDate:", v6, v7);

  -[PGAbstractMetricEvent gatherMetricsWithProgressBlock:](v11, "gatherMetricsWithProgressBlock:", 0);
  objc_msgSend(*(id *)(a1 + 40), "analytics");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCuratedLibraryFTEMetricEvent identifier](v11, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGCuratedLibraryFTEMetricEvent payload](v11, "payload");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendEvent:withPayload:", v9, v10);

}

void __123__PGGraphPhotosHighlightEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __123__PGGraphPhotosHighlightEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke_165(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.9);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __123__PGGraphPhotosHighlightEnrichmentProcessor_enrichDataModelWithManager_curationContext_graphUpdateInventory_progressBlock___block_invoke_166(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1 + 0.9);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

+ (BOOL)hasCompletedFirstTimeExperienceForLibrary:(id)a3
{
  return objc_msgSend(a1, "_hasEnoughHighlightsInPhotoLibrary:atEnrichmentState:aboveThreshold:", a3, 3, 0.9);
}

+ (BOOL)hasCompletedEnrichmentForLibrary:(id)a3
{
  return objc_msgSend(a1, "_hasEnoughHighlightsInPhotoLibrary:atEnrichmentState:aboveThreshold:", a3, 4, 0.95);
}

+ (BOOL)_hasEnoughHighlightsInPhotoLibrary:(id)a3 atEnrichmentState:(unsigned __int16)a4 aboveThreshold:(double)a5
{
  unsigned int v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  double v16;
  void *v17;
  BOOL v18;
  uint8_t buf[4];
  double v21;
  __int16 v22;
  unint64_t v23;
  __int16 v24;
  unint64_t v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v6 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setShouldPrefetchCount:", 1);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 0x7FFFFFFFFFFFFFFFLL, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");
  if (v10)
  {
    v11 = v10;
    objc_msgSend(v7, "librarySpecificFetchOptions");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %d"), CFSTR("enrichmentState"), v6);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setInternalPredicate:", v13);

    objc_msgSend(v12, "setShouldPrefetchCount:", 1);
    objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithType:subtype:options:", 6, 0x7FFFFFFFFFFFFFFFLL, v12);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v14, "count");
    v16 = (double)v15 / (double)v11;
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
    {
      PHShortDescriptionForPhotosHighlightEnrichmentState();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 134218754;
      v21 = v16 * 100.0;
      v22 = 2048;
      v23 = v15;
      v24 = 2048;
      v25 = v11;
      v26 = 2112;
      v27 = v17;
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Enriched %.2f%% highlights (%tu/%tu in total) at state %@", buf, 0x2Au);

    }
    v18 = v16 >= a5;

  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end
