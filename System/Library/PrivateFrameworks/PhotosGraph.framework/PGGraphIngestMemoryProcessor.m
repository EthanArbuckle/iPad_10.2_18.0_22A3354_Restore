@implementation PGGraphIngestMemoryProcessor

- (PGGraphIngestMemoryProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestMemoryProcessor *v6;
  PGGraphIngestMemoryProcessor *v7;
  PGMemoryController *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  PGMemoryController *memoryController;
  uint64_t v14;
  NSDate *localDate;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PGGraphIngestMemoryProcessor;
  v6 = -[PGGraphIngestMemoryProcessor init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    v8 = [PGMemoryController alloc];
    objc_msgSend(v5, "graph");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "photoLibrary");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "loggingConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PGMemoryController initWithGraph:photoLibrary:loggingConnection:](v8, "initWithGraph:photoLibrary:loggingConnection:", v9, v10, v11);
    memoryController = v7->_memoryController;
    v7->_memoryController = (PGMemoryController *)v12;

    objc_msgSend(MEMORY[0x1E0D4B130], "currentLocalDate");
    v14 = objc_claimAutoreleasedReturnValue();
    localDate = v7->_localDate;
    v7->_localDate = (NSDate *)v14;

  }
  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isResumingFullAnalysis") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasAnythingToDo");

  return v4;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  void *v6;
  double v7;
  char v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  PGGraphBuilder *graphBuilder;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  uint32_t denom;
  uint32_t numer;
  NSObject *v27;
  NSObject *v28;
  double Current;
  char v30;
  uint64_t v31;
  void *v32;
  id v33;
  void *v34;
  id v35;
  char v36;
  _QWORD v37[4];
  id v38;
  uint64_t *v39;
  uint64_t *v40;
  double v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  _QWORD v48[4];
  id v49;
  uint64_t *v50;
  uint64_t *v51;
  uint64_t v52;
  mach_timebase_info info;
  uint64_t v54;
  double *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t *v59;
  uint64_t v60;
  char v61;
  int buf;
  _QWORD v63[5];

  *(_QWORD *)((char *)&v63[2] + 4) = *MEMORY[0x1E0C80C00];
  v35 = a3;
  v33 = a4;
  v6 = _Block_copy(v33);
  v58 = 0;
  v59 = &v58;
  v60 = 0x2020000000;
  v61 = 0;
  v54 = 0;
  v55 = (double *)&v54;
  v56 = 0x2020000000;
  v57 = 0;
  if (!v6
    || (v7 = CFAbsoluteTimeGetCurrent(), v7 - v55[3] < 0.01)
    || (v55[3] = v7,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v6 + 2))(v6, &info, 0.0),
        v8 = *((_BYTE *)v59 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v59 + 24) = v8) == 0))
  {
    -[PGGraphBuilder graph](self->_graphBuilder, "graph");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "memoryCategoriesWithGraphUpdate:", v35);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphIngestMemoryProcessor deleteWithMemoryCategories:](self, "deleteWithMemoryCategories:", v34);
    -[PGGraphIngestMemoryProcessor insertSingletonFeatureNodes](self, "insertSingletonFeatureNodes");
    -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);
    v11 = v9;
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestMemoryProcessor", ", (uint8_t *)&buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v31 = mach_absolute_time();
    graphBuilder = self->_graphBuilder;
    v14 = MEMORY[0x1E0C809B0];
    v48[0] = MEMORY[0x1E0C809B0];
    v48[1] = 3221225472;
    v48[2] = __65__PGGraphIngestMemoryProcessor_runWithGraphUpdate_progressBlock___block_invoke;
    v48[3] = &unk_1E8434F30;
    v15 = v6;
    v49 = v15;
    v50 = &v54;
    v51 = &v58;
    v52 = 0x3F847AE147AE147BLL;
    -[PGGraphBuilder featureProviderWithProgressBlock:](graphBuilder, "featureProviderWithProgressBlock:", v48);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v59 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        LODWORD(v63[0]) = 115;
        WORD2(v63[0]) = 2080;
        *(_QWORD *)((char *)v63 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
      goto LABEL_36;
    }
    objc_msgSend(v35, "insertedMomentNodes");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = v14;
    v43[1] = 3221225472;
    v43[2] = __65__PGGraphIngestMemoryProcessor_runWithGraphUpdate_progressBlock___block_invoke_154;
    v43[3] = &unk_1E8434F30;
    v18 = v15;
    v44 = v18;
    v45 = &v54;
    v47 = 0x3F847AE147AE147BLL;
    v46 = &v58;
    -[PGGraphIngestMemoryProcessor insertProcessorDependentMomentFeaturesForMomentNodes:featureProvider:progressBlock:](self, "insertProcessorDependentMomentFeaturesForMomentNodes:featureProvider:progressBlock:", v17, v16, v43);

    if (*((_BYTE *)v59 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        LODWORD(v63[0]) = 121;
        WORD2(v63[0]) = 2080;
        *(_QWORD *)((char *)v63 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
      goto LABEL_35;
    }
    v37[0] = v14;
    v37[1] = 3221225472;
    v37[2] = __65__PGGraphIngestMemoryProcessor_runWithGraphUpdate_progressBlock___block_invoke_155;
    v37[3] = &unk_1E8434F58;
    v41 = 0.6 / (double)(unint64_t)objc_msgSend(v34, "count");
    v19 = v18;
    v38 = v19;
    v39 = &v54;
    v42 = 0x3F847AE147AE147BLL;
    v40 = &v58;
    -[PGGraphIngestMemoryProcessor insertMemoriesForCategories:loggingConnection:progressBlock:](self, "insertMemoriesForCategories:loggingConnection:progressBlock:", v34, v12, v37);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v59 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_34:

LABEL_35:
LABEL_36:

        goto LABEL_37;
      }
      buf = 67109378;
      LODWORD(v63[0]) = 128;
      WORD2(v63[0]) = 2080;
      *(_QWORD *)((char *)v63 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
      v21 = MEMORY[0x1E0C81028];
    }
    else
    {
      if (v35 && (objc_msgSend(v35, "isResumingFullAnalysis") & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v20);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v35, "hasDeletedMomentNodes"))
        {
          objc_msgSend(v35, "identifiersForMemoriesRelatedToDeletedMoments");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "unionSet:", v23);

        }
        -[PGGraphIngestMemoryProcessor resetMemoryNodesWithMemoryUniqueIdentifiers:loggingConnection:](self, "resetMemoryNodesWithMemoryUniqueIdentifiers:loggingConnection:", v22, v12);

      }
      v24 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v27 = v12;
      v28 = v27;
      if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v28, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestMemoryProcessor", ", (uint8_t *)&buf, 2u);
      }

      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        buf = 136315394;
        v63[0] = "PGGraphIngestMemoryProcessor";
        LOWORD(v63[1]) = 2048;
        *(double *)((char *)&v63[1] + 2) = (float)((float)((float)((float)(v24 - v31) * (float)numer) / (float)denom)
                                                 / 1000000.0);
        _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
      }
      if (!v6)
        goto LABEL_34;
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v55[3] < 0.01)
        goto LABEL_34;
      v55[3] = Current;
      v36 = 0;
      (*((void (**)(id, char *, double))v19 + 2))(v19, &v36, 1.0);
      v30 = *((_BYTE *)v59 + 24) | v36;
      *((_BYTE *)v59 + 24) = v30;
      if (!v30 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_34;
      buf = 67109378;
      LODWORD(v63[0]) = 142;
      WORD2(v63[0]) = 2080;
      *(_QWORD *)((char *)v63 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
      v21 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    goto LABEL_34;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 67109378;
    LODWORD(v63[0]) = 94;
    WORD2(v63[0]) = 2080;
    *(_QWORD *)((char *)v63 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_37:
  _Block_object_dispose(&v54, 8);
  _Block_object_dispose(&v58, 8);

}

- (void)insertSingletonFeatureNodes
{
  id v2;

  v2 = -[PGGraphBuilder insertOverTheYearsNode](self->_graphBuilder, "insertOverTheYearsNode");
}

- (void)insertProcessorDependentMomentFeaturesForMomentNodes:(id)a3 featureProvider:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  double v11;
  double Current;
  NSObject *v13;
  unint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  unint64_t v18;
  double v19;
  double v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t v23;
  void *v24;
  double v25;
  double v26;
  PGGraphBuilder *graphBuilder;
  void *v28;
  void *v29;
  uint64_t v30;
  id v31;
  id v32;
  NSObject *oslog;
  id obj;
  uint64_t v35;
  id v36;
  void (**v37)(void *, _BYTE *, double);
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  char v42;
  uint8_t buf[4];
  int v44;
  __int16 v45;
  _QWORD v46[2];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v36 = a4;
  v9 = a5;
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v44 = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_DEFAULT, "[PGGraphIngestMemoryProcessor] Starting to insert processor-dependent features for %d moments", buf, 8u);
  }

  v11 = 0.0;
  v37 = (void (**)(void *, _BYTE *, double))_Block_copy(v9);
  if (v37)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v42 = 0;
      v37[2](v37, &v42, 0.0);
      if (v42)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v44 = 154;
          v45 = 2080;
          v46[0] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
          v13 = MEMORY[0x1E0C81028];
LABEL_29:
          _os_log_impl(&dword_1CA237000, v13, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_33;
        }
        goto LABEL_33;
      }
      v11 = Current;
    }
  }
  oslog = v10;
  v31 = v9;
  v14 = objc_msgSend(v8, "count");
  v15 = CFAbsoluteTimeGetCurrent();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v32 = v8;
  obj = v8;
  v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
  if (v16)
  {
    v17 = v16;
    v18 = 0;
    v19 = 1.0 / (double)v14;
    v35 = *(_QWORD *)v39;
    v20 = 0.0;
    v30 = 67109632;
    while (2)
    {
      v21 = 0;
      v22 = v18;
      do
      {
        if (*(_QWORD *)v39 != v35)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * v21);
        v24 = (void *)MEMORY[0x1CAA4EB2C]();
        if (v37)
        {
          v25 = CFAbsoluteTimeGetCurrent();
          if (v25 - v11 >= 0.01)
          {
            v42 = 0;
            v37[2](v37, &v42, v20);
            if (v42)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                v44 = 162;
                v45 = 2080;
                v46[0] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
              objc_autoreleasePoolPop(v24);

              v9 = v31;
              v8 = v32;
              v10 = oslog;
              goto LABEL_33;
            }
            v11 = v25;
          }
        }
        if (v18 + v21 == 25 * (v22 / 0x19))
        {
          v26 = CFAbsoluteTimeGetCurrent();
          if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = v30;
            v44 = v18 + v21;
            v45 = 1024;
            LODWORD(v46[0]) = 25;
            WORD2(v46[0]) = 2048;
            *(double *)((char *)v46 + 6) = v26 - v15;
            _os_log_debug_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEBUG, "[PGGraphIngestMemoryProcessor] Processed %d moments, batch of %d took %.2f seconds", buf, 0x18u);
          }
          v15 = v26;
        }
        v20 = v19 + v20;
        ++v22;
        graphBuilder = self->_graphBuilder;
        -[PGGraphBuilder photoLibrary](graphBuilder, "photoLibrary", v30);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGGraphBuilder curationContext](self->_graphBuilder, "curationContext");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGGraphBuilder insertMomentFeaturesForMomentNode:momentEnvelope:photoLibrary:featureProvider:atMomentIngest:curationContext:](graphBuilder, "insertMomentFeaturesForMomentNode:momentEnvelope:photoLibrary:featureProvider:atMomentIngest:curationContext:", v23, 0, v28, v36, 0, v29);

        objc_autoreleasePoolPop(v24);
        ++v21;
      }
      while (v17 != v21);
      v18 += v21;
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v38, v47, 16);
      if (v17)
        continue;
      break;
    }
  }

  v9 = v31;
  v8 = v32;
  v10 = oslog;
  if (v37)
  {
    if (CFAbsoluteTimeGetCurrent() - v11 >= 0.01)
    {
      v42 = 0;
      v37[2](v37, &v42, 1.0);
      if (v42)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v44 = 175;
          v45 = 2080;
          v46[0] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
          v13 = MEMORY[0x1E0C81028];
          goto LABEL_29;
        }
      }
    }
  }
LABEL_33:

}

- (void)deleteWithMemoryCategories:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (objc_msgSend(v4, "containsObject:", &unk_1E84E38C0))
  {
    -[PGGraphBuilder deleteAllMemoryNodesAndEdges](self->_graphBuilder, "deleteAllMemoryNodesAndEdges");
  }
  else
  {
    v5 = objc_alloc_init(MEMORY[0x1E0CB3788]);
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(v5, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v10++), "unsignedIntValue", (_QWORD)v11));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

    -[PGGraphBuilder deleteAllMemoryNodesAndEdgesForMemoryCategories:](self->_graphBuilder, "deleteAllMemoryNodesAndEdgesForMemoryCategories:", v5);
  }

}

- (void)resetMemoryNodesWithMemoryUniqueIdentifiers:(id)a3 loggingConnection:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  if (objc_msgSend(v9, "count"))
  {
    -[PGGraphBuilder photoLibrary](self->_graphBuilder, "photoLibrary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allObjects");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMemoryProcessorHelper localMemoryByUniqueIdentifierWithGraphMemoryIdentifiers:inPhotoLibrary:](PGGraphMemoryProcessorHelper, "localMemoryByUniqueIdentifierWithGraphMemoryIdentifiers:inPhotoLibrary:", v6, v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "count"))
    {
      objc_msgSend(v7, "allValues");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGGraphMemoryProcessorHelper resetLocalMemoryLastEnrichmentDateOfMemoriesWithLocalMemories:inPhotoLibrary:](PGGraphMemoryProcessorHelper, "resetLocalMemoryLastEnrichmentDateOfMemoriesWithLocalMemories:inPhotoLibrary:", v8, v5);

    }
  }

}

- (id)insertMemoriesForCategories:(id)a3 loggingConnection:(id)a4 progressBlock:(id)a5
{
  id v8;
  NSObject *v9;
  PGMemoryGenerationContext *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  uint8_t v16;
  id v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  unint64_t v28;
  NSObject *v29;
  double v30;
  double v31;
  void *v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  NSObject *v36;
  os_signpost_id_t v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  mach_timebase_info v42;
  NSObject *v43;
  NSObject *v44;
  objc_class *v45;
  void *v46;
  NSObject *v47;
  void *v48;
  objc_class *v49;
  void *v50;
  void *v51;
  id v52;
  NSObject *v53;
  objc_class *v54;
  id v55;
  int v56;
  id v57;
  id v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t j;
  void *v62;
  void *v63;
  int v64;
  uint64_t v65;
  uint32_t numer;
  uint32_t denom;
  NSObject *v68;
  NSObject *v69;
  double Current;
  uint8_t v71;
  id v72;
  uint64_t v74;
  unint64_t v75;
  os_signpost_id_t spid;
  void *v77;
  id v78;
  id aBlock;
  id obj;
  NSObject *v81;
  void *v82;
  uint64_t v83;
  uint64_t v84;
  PGMemoryGenerationContext *v85;
  PGMemoryController *v86;
  void *context;
  void *v88;
  uint64_t v89;
  id v90;
  void *v91;
  void *v92;
  id v93;
  uint64_t v94;
  uint64_t v95;
  NSObject *oslog;
  void *v97;
  int v98;
  void *v99;
  uint64_t i;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  _QWORD v105[4];
  id v106;
  uint64_t *v107;
  uint8_t *v108;
  double v109;
  double v110;
  uint64_t v111;
  mach_timebase_info v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  _QWORD v121[4];
  id v122;
  uint64_t *v123;
  uint8_t *v124;
  uint64_t v125;
  mach_timebase_info info;
  uint64_t v127;
  double *v128;
  uint64_t v129;
  uint64_t v130;
  uint8_t v131[128];
  uint8_t v132[4];
  _BYTE v133[18];
  __int16 v134;
  double v135;
  _BYTE v136[128];
  uint8_t v137[128];
  uint8_t buf[8];
  uint8_t *v139;
  uint64_t v140;
  char v141;
  uint64_t v142;

  v142 = *MEMORY[0x1E0C80C00];
  v78 = a3;
  v8 = a4;
  aBlock = a5;
  v9 = v8;
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    *(_DWORD *)&buf[4] = objc_msgSend(v78, "count");
    _os_log_impl(&dword_1CA237000, v9, OS_LOG_TYPE_DEFAULT, "[PGGraphIngestMemoryProcessor] Starting to insert memories for %d categories", buf, 8u);
  }
  v81 = v9;

  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v97 = (void *)objc_claimAutoreleasedReturnValue();
  v86 = self->_memoryController;
  v10 = [PGMemoryGenerationContext alloc];
  -[PGMemoryController photoLibrary](v86, "photoLibrary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder curationContext](self->_graphBuilder, "curationContext");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "userFeedbackCalculator");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder serviceManager](self->_graphBuilder, "serviceManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v85 = -[PGMemoryGenerationContext initWithPhotoLibrary:userFeedbackCalculator:graph:serviceManager:loggingConnection:](v10, "initWithPhotoLibrary:userFeedbackCalculator:graph:serviceManager:loggingConnection:", v11, v13, v97, v14, v81);

  -[PGMemoryController setMemoryGenerationContext:](v86, "setMemoryGenerationContext:", v85);
  v82 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)buf = 0;
  v139 = buf;
  v140 = 0x2020000000;
  v141 = 0;
  v127 = 0;
  v128 = (double *)&v127;
  v129 = 0x2020000000;
  v130 = 0;
  if (v82
    && (v15 = CFAbsoluteTimeGetCurrent(), v15 - v128[3] >= 0.01)
    && (v128[3] = v15,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v82 + 2))(v82, &info, 0.0),
        v16 = v139[24] | LOBYTE(info.numer),
        (v139[24] = v16) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)v132 = 67109378;
      *(_DWORD *)v133 = 292;
      *(_WORD *)&v133[4] = 2080;
      *(_QWORD *)&v133[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v132, 0x12u);
    }
    v17 = v91;
  }
  else
  {
    v18 = v81;
    v19 = os_signpost_id_generate(v18);
    v20 = v18;
    v21 = v20;
    v75 = v19 - 1;
    spid = v19;
    if (v19 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      *(_WORD *)v132 = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v21, OS_SIGNPOST_INTERVAL_BEGIN, v19, "InsertMemories", ", v132, 2u);
    }
    oslog = v21;

    info = 0;
    mach_timebase_info(&info);
    v74 = mach_absolute_time();
    v22 = (void *)MEMORY[0x1E0D42A58];
    v121[0] = MEMORY[0x1E0C809B0];
    v121[1] = 3221225472;
    v121[2] = __92__PGGraphIngestMemoryProcessor_insertMemoriesForCategories_loggingConnection_progressBlock___block_invoke;
    v121[3] = &unk_1E8434F30;
    v93 = v82;
    v122 = v93;
    v123 = &v127;
    v125 = 0x3F847AE147AE147BLL;
    v124 = buf;
    objc_msgSend(v22, "progressReporterWithProgressBlock:", v121);
    v77 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGMemoryGenerationContext momentNodesWithBlockedFeatureCache](v85, "momentNodesWithBlockedFeatureCache");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "prefetchMomentNodesWithBlockedFeatureIfNeededInGraph:progressReporter:", v97, v77);

    if (v139[24])
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v132 = 67109378;
        *(_DWORD *)v133 = 300;
        *(_WORD *)&v133[4] = 2080;
        *(_QWORD *)&v133[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fr"
                              "amework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v132, 0x12u);
      }
      v17 = v91;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E20], "set");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      obj = v78;
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v137, 16);
      if (v25)
      {
        v84 = *(_QWORD *)v118;
        while (2)
        {
          v89 = 0;
          v83 = v25;
          do
          {
            if (*(_QWORD *)v118 != v84)
              objc_enumerationMutation(obj);
            v26 = *(void **)(*((_QWORD *)&v117 + 1) + 8 * v89);
            context = (void *)MEMORY[0x1CAA4EB2C]();
            v27 = objc_msgSend(v26, "unsignedIntValue");
            objc_msgSend(MEMORY[0x1E0CD1630], "stringForCategory:", v27);
            v92 = (void *)objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)v132 = 138412290;
              *(_QWORD *)v133 = v92;
              _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "[PGGraphIngestMemoryProcessor] Starting to insert memories for category %@", v132, 0xCu);
            }
            -[PGGraphIngestMemoryProcessor memoryGeneratorsForMemoryCategory:memoryGenerationContext:controller:](self, "memoryGeneratorsForMemoryCategory:memoryGenerationContext:controller:", v27, v85, v86);
            v88 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = objc_msgSend(v88, "count");
            if (v28)
            {
              v115 = 0u;
              v116 = 0u;
              v113 = 0u;
              v114 = 0u;
              v90 = v88;
              v29 = oslog;
              v95 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v113, v136, 16);
              if (v95)
              {
                v30 = 0.9 / (double)v28;
                v94 = *(_QWORD *)v114;
                v31 = 0.1;
                while (2)
                {
                  for (i = 0; i != v95; ++i)
                  {
                    if (*(_QWORD *)v114 != v94)
                      objc_enumerationMutation(v90);
                    v32 = *(void **)(*((_QWORD *)&v113 + 1) + 8 * i);
                    v33 = v29;
                    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
                    {
                      v34 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v34);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v132 = 138412546;
                      *(_QWORD *)v133 = v35;
                      *(_WORD *)&v133[8] = 2112;
                      *(_QWORD *)&v133[10] = v92;
                      _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "[PGGraphIngestMemoryProcessor] Starting to generate memories with %@ for category %@", v132, 0x16u);

                    }
                    v36 = v33;
                    v37 = os_signpost_id_generate(v36);
                    v38 = v36;
                    v39 = v38;
                    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v38))
                    {
                      *(_WORD *)v132 = 0;
                      _os_signpost_emit_with_name_impl(&dword_1CA237000, v39, OS_SIGNPOST_INTERVAL_BEGIN, v37, "MemoryGeneration", ", v132, 2u);
                    }

                    v112 = 0;
                    mach_timebase_info(&v112);
                    v40 = mach_absolute_time();
                    v105[0] = MEMORY[0x1E0C809B0];
                    v105[1] = 3221225472;
                    v105[2] = __92__PGGraphIngestMemoryProcessor_insertMemoriesForCategories_loggingConnection_progressBlock___block_invoke_197;
                    v105[3] = &unk_1E84311C8;
                    v109 = v31;
                    v110 = v30;
                    v106 = v93;
                    v107 = &v127;
                    v111 = 0x3F847AE147AE147BLL;
                    v108 = buf;
                    objc_msgSend(v32, "generateAllPotentialMemoriesWithGraph:progressBlock:", v97, v105);
                    v99 = (void *)objc_claimAutoreleasedReturnValue();
                    v41 = mach_absolute_time();
                    v42 = v112;
                    v43 = v39;
                    v44 = v43;
                    if (v37 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v43))
                    {
                      v45 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v45);
                      v46 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v132 = 138412290;
                      *(_QWORD *)v133 = v46;
                      _os_signpost_emit_with_name_impl(&dword_1CA237000, v44, OS_SIGNPOST_INTERVAL_END, v37, "MemoryGeneration", "Memory Generator: %@", v132, 0xCu);

                    }
                    v47 = v44;
                    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                    {
                      v48 = (void *)MEMORY[0x1E0CB3940];
                      v49 = (objc_class *)objc_opt_class();
                      NSStringFromClass(v49);
                      v50 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v48, "stringWithFormat:", CFSTR("Memory Generator: %@"), v50);
                      v51 = (void *)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)v132 = 136315650;
                      *(_QWORD *)v133 = "MemoryGeneration";
                      *(_WORD *)&v133[8] = 2112;
                      *(_QWORD *)&v133[10] = v51;
                      v134 = 2048;
                      v135 = (float)((float)((float)((float)(v41 - v40) * (float)v42.numer) / (float)v42.denom)
                                   / 1000000.0);
                      _os_log_impl(&dword_1CA237000, v47, OS_LOG_TYPE_INFO, "[Performance] %s - %@: %f ms", v132, 0x20u);

                    }
                    v98 = v139[24];
                    if (v139[24])
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)v132 = 67109378;
                        *(_DWORD *)v133 = 326;
                        *(_WORD *)&v133[4] = 2080;
                        *(_QWORD *)&v133[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysi"
                                              "s/PhotosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
                        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v132, 0x12u);
                      }
                      v52 = v91;
                    }
                    else
                    {
                      v53 = v47;
                      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
                      {
                        v54 = (objc_class *)objc_opt_class();
                        NSStringFromClass(v54);
                        v55 = (id)objc_claimAutoreleasedReturnValue();
                        v56 = objc_msgSend(v99, "count");
                        *(_DWORD *)v132 = 138412546;
                        *(_QWORD *)v133 = v55;
                        *(_WORD *)&v133[8] = 1024;
                        *(_DWORD *)&v133[10] = v56;
                        _os_log_impl(&dword_1CA237000, v53, OS_LOG_TYPE_DEFAULT, "[PGGraphIngestMemoryProcessor] %@ generated %d potential Memories", v132, 0x12u);

                      }
                      v57 = objc_alloc_init(MEMORY[0x1E0D42A30]);
                      v103 = 0u;
                      v104 = 0u;
                      v101 = 0u;
                      v102 = 0u;
                      v58 = v99;
                      v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v101, v131, 16);
                      if (v59)
                      {
                        v60 = *(_QWORD *)v102;
                        do
                        {
                          for (j = 0; j != v59; ++j)
                          {
                            if (*(_QWORD *)v102 != v60)
                              objc_enumerationMutation(v58);
                            -[PGGraphBuilder insertMemoryNodeFromMemory:changeRequest:](self->_graphBuilder, "insertMemoryNodeFromMemory:changeRequest:", *(_QWORD *)(*((_QWORD *)&v101 + 1) + 8 * j), v57);
                            v62 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v62, "uniqueMemoryIdentifier");
                            v63 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v24, "addObject:", v63);

                          }
                          v59 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v101, v131, 16);
                        }
                        while (v59);
                      }

                      objc_msgSend(v97, "executeGraphChangeRequest:", v57);
                      v31 = v30 + v31;
                    }

                    if (v98)
                    {
                      v64 = 1;
                      goto LABEL_61;
                    }
                    v29 = oslog;
                  }
                  v95 = objc_msgSend(v90, "countByEnumeratingWithState:objects:count:", &v113, v136, 16);
                  if (v95)
                    continue;
                  break;
                }
              }
              v64 = 0;
LABEL_61:

            }
            else
            {
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)v132 = 134217984;
                *(_QWORD *)v133 = v27;
                _os_log_error_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_ERROR, "[PGGraphIngestMemoryProcessor] No memory generators found for memory category %lu", v132, 0xCu);
              }
              v64 = 3;
            }

            objc_autoreleasePoolPop(context);
            if (v64 != 3 && v64)
            {

              v17 = v91;
              goto LABEL_80;
            }
            ++v89;
          }
          while (v89 != v83);
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v117, v137, 16);
          if (v25)
            continue;
          break;
        }
      }

      v65 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v68 = oslog;
      v69 = v68;
      if (v75 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v68))
      {
        *(_WORD *)v132 = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v69, OS_SIGNPOST_INTERVAL_END, spid, "InsertMemories", ", v132, 2u);
      }

      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v132 = 136315394;
        *(_QWORD *)v133 = "InsertMemories";
        *(_WORD *)&v133[8] = 2048;
        *(double *)&v133[10] = (float)((float)((float)((float)(v65 - v74) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v69, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", v132, 0x16u);
      }
      if (v82
        && (Current = CFAbsoluteTimeGetCurrent(), Current - v128[3] >= 0.01)
        && (v128[3] = Current,
            LOBYTE(v112.numer) = 0,
            (*((void (**)(id, mach_timebase_info *, double))v93 + 2))(v93, &v112, 1.0),
            v71 = v139[24] | LOBYTE(v112.numer),
            (v139[24] = v71) != 0))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v132 = 67109378;
          *(_DWORD *)v133 = 342;
          *(_WORD *)&v133[4] = 2080;
          *(_QWORD *)&v133[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMemoryProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v132, 0x12u);
        }
        v72 = v91;
      }
      else
      {
        v72 = v24;
      }
      v17 = v72;
LABEL_80:

    }
  }
  _Block_object_dispose(&v127, 8);
  _Block_object_dispose(buf, 8);

  return v17;
}

- (id)memoryGeneratorsForMemoryCategory:(unint64_t)a3 memoryGenerationContext:(id)a4 controller:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  PGYearInReviewMemoryGenerator *v12;
  PGFoodieMemoryGenerator *v13;
  PGPersonFoodieMemoryGenerator *v14;
  PGRestaurantFoodieMemoryGenerator *v15;
  PGHomeFoodieMemoryGenerator *v16;
  PGCityFoodieMemoryGenerator *v17;
  PGTripFoodieMemoryGenerator *v18;
  PGMyPetMemoryGenerator *v19;
  PGMyPetAndPersonMemoryGenerator *v20;
  PGMyPetOutdoorMemoryGenerator *v21;
  PGPersonMemoryGenerator *v22;
  PGMePersonMemoryGenerator *v23;
  PGEarlyMomentsWithPeopleMemoryGenerator *v24;
  PGPlaceLocationMemoryGenerator *v25;
  PGPlaceRegionMemoryGenerator *v26;
  PGMeaningfulEventMemoryGenerator *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  PGSocialGroupMemoryGenerator *v34;
  PGRecurrentTripMemoryGenerator *v35;
  PGTripMemoryGenerator *v36;
  PGOngoingTripMemoryGenerator *v37;
  PGPastSupersetMemoryGenerator *v38;
  PGSingleMomentMemoryGenerator *v39;
  PGSeasonMemoryGenerator *v40;
  PGPlaceAreaMemoryGenerator *v41;
  PGChildActivityMemoryGenerator *v42;
  PGExcitingMomentsMemoryGenerator *v43;
  void *v44;
  PGLocationTrendsMemoryGenerator *v45;
  void *v46;
  PGCLIPTrendsMemoryGenerator *v47;
  id v48;
  PGPersonCLIPTrendsMemoryGenerator *v49;
  PGLocationCLIPTrendsMemoryGenerator *v50;
  PGChildAndPersonMemoryGenerator *v51;
  PGChildOutdoorMemoryGenerator *v52;
  __objc2_class *v53;
  PGPersonMemoryGenerator *v54;
  __objc2_class *v55;
  PGEarlyMomentsWithPeopleMemoryGenerator *v56;
  __objc2_class *v57;
  void *v58;
  PGPastSupersetMemoryGenerator *v59;
  PGPersonTrendsMemoryGenerator *v61;
  PGTrendsMemoryGenerator *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _BYTE v67[128];
  uint64_t v68;

  v68 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v11 = 1;
  switch(a3)
  {
    case 0uLL:
      v12 = -[PGYearInReviewMemoryGenerator initWithMemoryGenerationContext:]([PGYearInReviewMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v12);

      v11 = 0;
      goto LABEL_3;
    case 1uLL:
      v53 = PGSingleMomentMemoryGenerator;
      goto LABEL_40;
    case 3uLL:
      v54 = -[PGPersonMemoryGenerator initWithMemoryGenerationContext:]([PGPersonMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v54);
      v55 = PGMePersonMemoryGenerator;
      goto LABEL_23;
    case 4uLL:
      v56 = -[PGMemoryGenerator initWithController:]([PGEarlyMomentsWithPeopleMemoryGenerator alloc], "initWithController:", v9);
      -[PGEarlyMomentsWithPeopleMemoryGenerator setShouldGenerateAllMemories:](v56, "setShouldGenerateAllMemories:", 1);
      goto LABEL_41;
    case 6uLL:
      v57 = PGSocialGroupMemoryGenerator;
      goto LABEL_33;
    case 8uLL:
      v57 = PGYearInReviewMemoryGenerator;
      goto LABEL_33;
    case 9uLL:
LABEL_3:
      v13 = -[PGFoodieMemoryGenerator initWithMemoryGenerationContext:]([PGFoodieMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v13);

      v14 = -[PGPersonFoodieMemoryGenerator initWithMemoryGenerationContext:]([PGPersonFoodieMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v14);

      v15 = -[PGFoodieMemoryGenerator initWithMemoryGenerationContext:]([PGRestaurantFoodieMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v15);

      v16 = -[PGFoodieMemoryGenerator initWithMemoryGenerationContext:]([PGHomeFoodieMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v16);

      v17 = -[PGFoodieMemoryGenerator initWithMemoryGenerationContext:]([PGCityFoodieMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v17);

      v18 = -[PGMemoryGenerator initWithMemoryGenerationContext:]([PGTripFoodieMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v18);

      if ((v11 & 1) != 0)
        goto LABEL_42;
      v19 = -[PGMyPetMemoryGenerator initWithMemoryGenerationContext:]([PGMyPetMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v19);
      v20 = -[PGMyPetAndPersonMemoryGenerator initWithMemoryGenerationContext:]([PGMyPetAndPersonMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v20);

      v21 = -[PGMyPetOutdoorMemoryGenerator initWithMemoryGenerationContext:]([PGMyPetOutdoorMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v21);

      v22 = -[PGPersonMemoryGenerator initWithMemoryGenerationContext:]([PGPersonMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v22);
      v23 = -[PGMePersonMemoryGenerator initWithMemoryGenerationContext:]([PGMePersonMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v23);

      v24 = -[PGMemoryGenerator initWithController:]([PGEarlyMomentsWithPeopleMemoryGenerator alloc], "initWithController:", v9);
      -[PGEarlyMomentsWithPeopleMemoryGenerator setShouldGenerateAllMemories:](v24, "setShouldGenerateAllMemories:", 1);
      objc_msgSend(v10, "addObject:", v24);

      v25 = -[PGPlaceLocationMemoryGenerator initWithMemoryGenerationContext:]([PGPlaceLocationMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v25);

      v26 = -[PGPlaceRegionMemoryGenerator initWithMemoryGenerationContext:]([PGPlaceRegionMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v26);

      v27 = -[PGMemoryGenerator initWithMemoryGenerationContext:]([PGMeaningfulEventMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v27);

      v11 = 0;
      goto LABEL_5;
    case 0xAuLL:
      v54 = -[PGMyPetMemoryGenerator initWithMemoryGenerationContext:]([PGMyPetMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v54);
      v55 = PGMyPetAndPersonMemoryGenerator;
LABEL_23:
      v58 = (void *)objc_msgSend([v55 alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v58);

      goto LABEL_34;
    case 0xCuLL:
      v57 = PGPlaceLocationMemoryGenerator;
      goto LABEL_33;
    case 0xDuLL:
      v53 = PGPlaceRegionMemoryGenerator;
      goto LABEL_40;
    case 0xEuLL:
      v53 = PGPlaceAreaMemoryGenerator;
      goto LABEL_40;
    case 0x10uLL:
      v57 = PGMeaningfulEventMemoryGenerator;
      goto LABEL_33;
    case 0x11uLL:
LABEL_5:
      +[PGMeaningAggregationMemoryGenerator allMeaningAggregationMemoryGeneratorClasses](PGMeaningAggregationMemoryGenerator, "allMeaningAggregationMemoryGeneratorClasses");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v66 = 0u;
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v64;
        do
        {
          v32 = 0;
          do
          {
            if (*(_QWORD *)v64 != v31)
              objc_enumerationMutation(v28);
            v33 = (void *)objc_msgSend(objc_alloc(*(Class *)(*((_QWORD *)&v63 + 1) + 8 * v32)), "initWithMemoryGenerationContext:", v8);
            objc_msgSend(v10, "addObject:", v33);

            ++v32;
          }
          while (v30 != v32);
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v63, v67, 16);
        }
        while (v30);
      }

      if ((v11 & 1) != 0)
        goto LABEL_42;
      v34 = -[PGSocialGroupMemoryGenerator initWithMemoryGenerationContext:]([PGSocialGroupMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v34);

      v35 = -[PGMemoryGenerator initWithMemoryGenerationContext:]([PGRecurrentTripMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v35);

      v36 = -[PGMemoryGenerator initWithMemoryGenerationContext:]([PGTripMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v36);

      v37 = -[PGMemoryGenerator initWithMemoryGenerationContext:]([PGOngoingTripMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v37);

      v38 = -[PGMemoryGenerator initWithController:]([PGPastSupersetMemoryGenerator alloc], "initWithController:", v9);
      -[PGPastSupersetMemoryGenerator setLocalDate:](v38, "setLocalDate:", self->_localDate);
      objc_msgSend(v10, "addObject:", v38);

      v39 = -[PGMemoryGenerator initWithMemoryGenerationContext:]([PGSingleMomentMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v39);

      v40 = -[PGSeasonMemoryGenerator initWithMemoryGenerationContext:]([PGSeasonMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v40);

      v41 = -[PGPlaceAreaMemoryGenerator initWithMemoryGenerationContext:]([PGPlaceAreaMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v41);

      v42 = -[PGChildActivityMemoryGenerator initWithMemoryGenerationContext:]([PGChildActivityMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v42);

      v43 = -[PGExcitingMomentsMemoryGenerator initWithMemoryGenerationContext:]([PGExcitingMomentsMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v43);

      v11 = 0;
      goto LABEL_14;
    case 0x12uLL:
      v53 = PGRecurrentTripMemoryGenerator;
      goto LABEL_40;
    case 0x13uLL:
      v57 = PGTripMemoryGenerator;
      goto LABEL_33;
    case 0x14uLL:
      v59 = -[PGMemoryGenerator initWithController:]([PGPastSupersetMemoryGenerator alloc], "initWithController:", v9);
      -[PGPastSupersetMemoryGenerator setLocalDate:](v59, "setLocalDate:", self->_localDate);
      objc_msgSend(v10, "addObject:", v59);

      goto LABEL_42;
    case 0x15uLL:
      v57 = PGSeasonMemoryGenerator;
      goto LABEL_33;
    case 0x17uLL:
      goto LABEL_16;
    case 0x19uLL:
      v57 = PGChildActivityMemoryGenerator;
LABEL_33:
      v54 = (PGPersonMemoryGenerator *)objc_msgSend([v57 alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v54);
LABEL_34:

      goto LABEL_42;
    case 0x1AuLL:
      v53 = PGExcitingMomentsMemoryGenerator;
      goto LABEL_40;
    case 0x1BuLL:
LABEL_14:
      +[PGTrendsMemoryGenerator trendsConfigurations](PGTrendsMemoryGenerator, "trendsConfigurations");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = -[PGTrendsMemoryGenerator initWithMemoryGenerationContext:configurations:]([PGTrendsMemoryGenerator alloc], "initWithMemoryGenerationContext:configurations:", v8, v44);
      v61 = -[PGPersonTrendsMemoryGenerator initWithMemoryGenerationContext:configurations:]([PGPersonTrendsMemoryGenerator alloc], "initWithMemoryGenerationContext:configurations:", v8, v44);
      v45 = -[PGLocationTrendsMemoryGenerator initWithMemoryGenerationContext:configurations:]([PGLocationTrendsMemoryGenerator alloc], "initWithMemoryGenerationContext:configurations:", v8, v44);
      objc_msgSend(v10, "addObject:", v62);
      objc_msgSend(v10, "addObject:", v61);
      objc_msgSend(v10, "addObject:", v45);
      +[PGCLIPTrendsMemoryGenerator CLIPTrendsConfigurations](PGCLIPTrendsMemoryGenerator, "CLIPTrendsConfigurations");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = -[PGCLIPTrendsMemoryGenerator initWithMemoryGenerationContext:configurations:]([PGCLIPTrendsMemoryGenerator alloc], "initWithMemoryGenerationContext:configurations:", v8, v46);
      v48 = v9;
      v49 = -[PGPersonCLIPTrendsMemoryGenerator initWithMemoryGenerationContext:configurations:]([PGPersonCLIPTrendsMemoryGenerator alloc], "initWithMemoryGenerationContext:configurations:", v8, v46);
      v50 = -[PGLocationCLIPTrendsMemoryGenerator initWithMemoryGenerationContext:configurations:]([PGLocationCLIPTrendsMemoryGenerator alloc], "initWithMemoryGenerationContext:configurations:", v8, v46);
      objc_msgSend(v10, "addObject:", v47);
      objc_msgSend(v10, "addObject:", v49);
      objc_msgSend(v10, "addObject:", v50);

      v9 = v48;
      if ((v11 & 1) != 0)
        goto LABEL_42;
      v51 = -[PGChildAndPersonMemoryGenerator initWithMemoryGenerationContext:]([PGChildAndPersonMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v51);

      v52 = -[PGChildOutdoorMemoryGenerator initWithMemoryGenerationContext:]([PGChildOutdoorMemoryGenerator alloc], "initWithMemoryGenerationContext:", v8);
      objc_msgSend(v10, "addObject:", v52);

LABEL_16:
      v53 = PGDayInHistoryAggregationMemoryGenerator;
LABEL_40:
      v56 = (PGEarlyMomentsWithPeopleMemoryGenerator *)objc_msgSend([v53 alloc], "initWithMemoryGenerationContext:", v8);
LABEL_41:
      objc_msgSend(v10, "addObject:", v56, v61);

LABEL_42:
      return v10;
    case 0x1CuLL:
      v53 = PGMyPetOutdoorMemoryGenerator;
      goto LABEL_40;
    case 0x1DuLL:
      v53 = PGChildAndPersonMemoryGenerator;
      goto LABEL_40;
    case 0x1EuLL:
      v53 = PGChildOutdoorMemoryGenerator;
      goto LABEL_40;
    case 0x1FuLL:
      v53 = PGOngoingTripMemoryGenerator;
      goto LABEL_40;
    default:
      goto LABEL_42;
  }
}

- (NSDate)localDate
{
  return self->_localDate;
}

- (void)setLocalDate:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_localDate, 0);
  objc_storeStrong((id *)&self->_memoryController, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __92__PGGraphIngestMemoryProcessor_insertMemoriesForCategories_loggingConnection_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __92__PGGraphIngestMemoryProcessor_insertMemoriesForCategories_loggingConnection_progressBlock___block_invoke_197(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double v7;
  double Current;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(a1 + 56);
    v7 = *(double *)(a1 + 64);
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + a3 * v7);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __65__PGGraphIngestMemoryProcessor_runWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __65__PGGraphIngestMemoryProcessor_runWithGraphUpdate_progressBlock___block_invoke_154(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.3 + 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __65__PGGraphIngestMemoryProcessor_runWithGraphUpdate_progressBlock___block_invoke_155(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double Current;
  uint64_t v8;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(a1 + 56);
    Current = CFAbsoluteTimeGetCurrent();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v8 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v8 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * v6 + 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

+ (id)memoryCategoriesWithGraphUpdate:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isResumingFullAnalysis") & 1) != 0)
  {
    v4 = &unk_1E84E9AA8;
  }
  else if ((objc_msgSend(v3, "hasInsertedMomentNodes") & 1) != 0
         || (objc_msgSend(v3, "hasDeletedMomentNodes") & 1) != 0)
  {
    v4 = &unk_1E84E9AC0;
  }
  else if ((objc_msgSend(v3, "momentUpdateTypes") & 0x13) != 0)
  {
    v4 = &unk_1E84E9AD8;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v3, "momentUpdateTypes") & 4) != 0)
      objc_msgSend(v4, "addObjectsFromArray:", &unk_1E84E9AF0);
    if ((objc_msgSend(v3, "hasUpdatedPersonNodes") & 1) != 0
      || (objc_msgSend(v3, "hasDeletedPersonNodes") & 1) != 0
      || (objc_msgSend(v3, "momentUpdateTypes") & 8) != 0)
    {
      objc_msgSend(v4, "addObjectsFromArray:", &unk_1E84E9B08);
    }
    if ((objc_msgSend(v3, "hasInsertedHighlightNodes") & 1) != 0
      || (objc_msgSend(v3, "hasUpdatedHighlightNodes") & 1) != 0
      || objc_msgSend(v3, "hasDeletedHighlightNodes"))
    {
      objc_msgSend(v4, "addObjectsFromArray:", &unk_1E84E9B20);
    }
  }

  return v4;
}

+ (void)regenerateMemoriesOfCategory:(unint64_t)a3 withGraphBuilder:(id)a4 progressReporter:(id)a5
{
  id v7;
  id v8;
  PGGraphIngestMemoryProcessor *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  id v16;
  _QWORD *v17;
  _QWORD v18[3];
  char v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v7 = a4;
  v8 = a5;
  v18[0] = 0;
  v18[1] = v18;
  v18[2] = 0x2020000000;
  v19 = 0;
  v9 = -[PGGraphIngestMemoryProcessor initWithGraphBuilder:]([PGGraphIngestMemoryProcessor alloc], "initWithGraphBuilder:", v7);
  if (a3)
    objc_msgSend(v7, "deleteAllMemoryNodesAndEdgesForMemoryCategory:", a3);
  else
    objc_msgSend(v7, "deleteAllMemoryNodesAndEdges");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v20[0] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "loggingConnection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __95__PGGraphIngestMemoryProcessor_regenerateMemoriesOfCategory_withGraphBuilder_progressReporter___block_invoke;
  v15[3] = &unk_1E84301E0;
  v17 = v18;
  v13 = v8;
  v16 = v13;
  v14 = -[PGGraphIngestMemoryProcessor insertMemoriesForCategories:loggingConnection:progressBlock:](v9, "insertMemoriesForCategories:loggingConnection:progressBlock:", v11, v12, v15);

  _Block_object_dispose(v18, 8);
}

uint64_t __95__PGGraphIngestMemoryProcessor_regenerateMemoriesOfCategory_withGraphBuilder_progressReporter___block_invoke(uint64_t a1, _BYTE *a2)
{
  uint64_t v4;
  uint64_t result;

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  if (*(_BYTE *)(v4 + 24))
  {
    result = 1;
  }
  else
  {
    result = objc_msgSend(*(id *)(a1 + 32), "isCancelledWithProgress:");
    v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  }
  *(_BYTE *)(v4 + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
    *a2 = 1;
  return result;
}

@end
