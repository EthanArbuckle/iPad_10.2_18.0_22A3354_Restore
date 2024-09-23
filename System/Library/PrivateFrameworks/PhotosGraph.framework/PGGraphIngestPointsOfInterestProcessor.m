@implementation PGGraphIngestPointsOfInterestProcessor

- (PGGraphIngestPointsOfInterestProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestPointsOfInterestProcessor *v6;
  PGGraphIngestPointsOfInterestProcessor *v7;
  id v8;
  void *v9;
  uint64_t v10;
  CLSBusinessCacheUpdater *businessCacheUpdater;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGGraphIngestPointsOfInterestProcessor;
  v6 = -[PGGraphIngestPointsOfInterestProcessor init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    v8 = objc_alloc(MEMORY[0x1E0D4B118]);
    objc_msgSend(v5, "poiCache");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithBusinessCategoryCache:", v9);
    businessCacheUpdater = v7->_businessCacheUpdater;
    v7->_businessCacheUpdater = (CLSBusinessCacheUpdater *)v10;

  }
  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v6;

  v3 = a3;
  if ((objc_msgSend(v3, "isResumingFullAnalysis") & 1) != 0
    || (objc_msgSend(v3, "hasMomentsToInsert") & 1) != 0
    || (objc_msgSend(v3, "hasMomentsToDelete") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v6 = objc_msgSend(v3, "momentUpdateTypes");
    v4 = (objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes") & v6) != 0;
  }

  return v4;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint32_t denom;
  uint32_t numer;
  NSObject *v18;
  NSObject *v19;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGGraphIngestPointsOfInterestProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v12 = mach_absolute_time();
  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v13, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v14, "count"))
    -[PGGraphIngestPointsOfInterestProcessor disambiguatePointsOfInterestWithMomentNodes:graphUpdate:progress:](self, "disambiguatePointsOfInterestWithMomentNodes:graphUpdate:progress:", v14, v6, v7);
  v15 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v18 = v11;
  v19 = v18;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_END, v9, "PGGraphIngestPointsOfInterestProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "PGGraphIngestPointsOfInterestProcessor";
    v23 = 2048;
    v24 = (float)((float)((float)((float)(v15 - v12) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)disambiguatePointsOfInterestWithMomentNodes:(id)a3 graphUpdate:(id)a4 progress:(id)a5
{
  double v8;
  char v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  CLSBusinessCacheUpdater *businessCacheUpdater;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  uint64_t i;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double Current;
  char v28;
  NSObject *v29;
  void *v30;
  id v31;
  _BOOL4 v32;
  id v33;
  void *v34;
  unint64_t v35;
  id v36;
  int v37;
  double v38;
  char v39;
  void *v40;
  NSDictionary *v41;
  id v42;
  id v43;
  id v44;
  void *v45;
  NSDictionary *v46;
  void *v47;
  void *v48;
  _QWORD v49[4];
  id v50;
  PGGraphIngestPointsOfInterestProcessor *v51;
  id v52;
  id v53;
  id v54;
  uint8_t *v55;
  uint64_t *v56;
  uint64_t *v57;
  double v58;
  __int128 v59;
  _QWORD v60[4];
  id v61;
  uint64_t *v62;
  uint64_t *v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[4];
  id v70;
  uint64_t *v71;
  uint64_t *v72;
  __int128 v73;
  _QWORD v74[4];
  id v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t v79;
  double *v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t *v84;
  uint64_t v85;
  char v86;
  uint8_t v87[4];
  int v88;
  __int16 v89;
  const char *v90;
  uint8_t buf[8];
  __int128 v92;
  uint64_t v93;
  void *v94;
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v43 = a3;
  v44 = a4;
  v42 = a5;
  v82 = 0;
  v83 = 0;
  v84 = &v83;
  v85 = 0x2020000000;
  v86 = 0;
  v79 = 0;
  v80 = (double *)&v79;
  v81 = 0x2020000000;
  v45 = _Block_copy(v42);
  if (!v45
    || (v8 = CFAbsoluteTimeGetCurrent(), v8 - v80[3] < 0.01)
    || (v80[3] = v8,
        v87[0] = 0,
        (*((void (**)(void *, uint8_t *, double))v45 + 2))(v45, v87, 0.0),
        v9 = *((_BYTE *)v84 + 24) | v87[0],
        (*((_BYTE *)v84 + 24) = v9) == 0))
  {
    -[PGGraphBuilder graph](self->_graphBuilder, "graph");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v74[0] = MEMORY[0x1E0C809B0];
    v74[1] = 3221225472;
    v74[2] = __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke;
    v74[3] = &unk_1E8434F30;
    v10 = v45;
    v75 = v10;
    v76 = &v79;
    v77 = &v83;
    v78 = 0x3F847AE147AE147BLL;
    -[PGGraphIngestPointsOfInterestProcessor _collectPOIsToResolveWithMomentNodes:graphUpdate:progress:](self, "_collectPOIsToResolveWithMomentNodes:graphUpdate:progress:", v43, v44, v74);
    if (*((_BYTE *)v84 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)&buf[4] = 103;
        LOWORD(v92) = 2080;
        *(_QWORD *)((char *)&v92 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Phot"
                                        "osGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      goto LABEL_43;
    }
    v41 = self->_momentNodesToResolvePOIByRegion;
    v46 = self->_momentNodesToResolvePOIAndEnrichByBusinessItemMuid;
    if (-[NSDictionary count](v46, "count"))
    {
      v40 = v10;
      v11 = objc_alloc(MEMORY[0x1E0C99E60]);
      -[NSDictionary allKeys](v46, "allKeys");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithArray:", v12);

      businessCacheUpdater = self->_businessCacheUpdater;
      v69[0] = MEMORY[0x1E0C809B0];
      v69[1] = 3221225472;
      v69[2] = __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke_173;
      v69[3] = &unk_1E8434F58;
      v70 = v40;
      v71 = &v79;
      v73 = xmmword_1CA8EDAF0;
      v72 = &v83;
      -[CLSBusinessCacheUpdater enrichedBusinessItemsByMuidsForMuids:progressBlock:](businessCacheUpdater, "enrichedBusinessItemsByMuidsForMuids:progressBlock:", v13, v69);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v16 = v13;
      v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v95, 16);
      if (v17)
      {
        v18 = *(_QWORD *)v66;
        v19 = *MEMORY[0x1E0C9E500];
        v20 = *(double *)(MEMORY[0x1E0C9E500] + 8);
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(_QWORD *)v66 != v18)
              objc_enumerationMutation(v16);
            v22 = *(_QWORD *)(*((_QWORD *)&v65 + 1) + 8 * i);
            objc_msgSend(v15, "objectForKeyedSubscript:", v22);
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            if (v23)
            {
              -[NSDictionary objectForKeyedSubscript:](v46, "objectForKeyedSubscript:", v22);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              v94 = v23;
              objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v94, 1);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              -[PGGraphIngestPointsOfInterestProcessor _pointOfInterestTypeStringsFromBusinessItems:withOriginalCoordinate:](self, "_pointOfInterestTypeStringsFromBusinessItems:withOriginalCoordinate:", v25, v19, v20);
              v26 = (void *)objc_claimAutoreleasedReturnValue();

              -[PGGraphIngestPointsOfInterestProcessor _insertPointOfInterestTypeStrings:graph:withMomentNodes:loggingConnection:](self, "_insertPointOfInterestTypeStrings:graph:withMomentNodes:loggingConnection:", v26, v47, v24, v48);
            }

          }
          v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v65, v95, 16);
        }
        while (v17);
      }

      v10 = v40;
    }
    if (v45)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v80[3] >= 0.01)
      {
        v80[3] = Current;
        v87[0] = 0;
        (*((void (**)(id, uint8_t *, double))v10 + 2))(v10, v87, 0.6);
        v28 = *((_BYTE *)v84 + 24) | v87[0];
        *((_BYTE *)v84 + 24) = v28;
        if (v28)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = 129;
            LOWORD(v92) = 2080;
            *(_QWORD *)((char *)&v92 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPointsOfIn"
                                            "terestProcessor.m";
            v29 = MEMORY[0x1E0C81028];
LABEL_41:
            _os_log_impl(&dword_1CA237000, v29, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
LABEL_42:

LABEL_43:
          goto LABEL_44;
        }
      }
    }
    if (-[NSDictionary count](v41, "count"))
    {
      -[NSDictionary allKeys](v41, "allKeys");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v60[0] = MEMORY[0x1E0C809B0];
      v60[1] = 3221225472;
      v60[2] = __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke_175;
      v60[3] = &unk_1E8434F58;
      v31 = v10;
      v61 = v31;
      v62 = &v79;
      v64 = xmmword_1CA8EDB00;
      v63 = &v83;
      v32 = -[PGGraphIngestPointsOfInterestProcessor _fetchPointsOfInterestForRegions:loggingConnection:progress:](self, "_fetchPointsOfInterestForRegions:loggingConnection:progress:", v30, v48, v60);
      if (*((_BYTE *)v84 + 24))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 138;
          LOWORD(v92) = 2080;
          *(_QWORD *)((char *)&v92 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
LABEL_34:

        goto LABEL_42;
      }
      v33 = v10;
      if (v32)
      {
        -[PGGraphBuilder poiCache](self->_graphBuilder, "poiCache");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_QWORD *)buf = 0;
        *(_QWORD *)&v92 = buf;
        *((_QWORD *)&v92 + 1) = 0x2020000000;
        v93 = 0;
        v35 = -[NSDictionary count](v41, "count");
        v49[0] = MEMORY[0x1E0C809B0];
        v49[1] = 3221225472;
        v49[2] = __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke_176;
        v49[3] = &unk_1E8434F80;
        v55 = buf;
        v58 = 1.0 / (double)v35;
        v54 = v31;
        v56 = &v79;
        v59 = xmmword_1CA8EDB10;
        v57 = &v83;
        v36 = v34;
        v50 = v36;
        v51 = self;
        v52 = v47;
        v53 = v48;
        -[NSDictionary enumerateKeysAndObjectsUsingBlock:](v41, "enumerateKeysAndObjectsUsingBlock:", v49);
        v37 = *((unsigned __int8 *)v84 + 24);
        if (*((_BYTE *)v84 + 24) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v87 = 67109378;
          v88 = 159;
          v89 = 2080;
          v90 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/"
                "Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v87, 0x12u);
        }

        _Block_object_dispose(buf, 8);
        if (v37)
          goto LABEL_34;
      }

      v10 = v33;
    }
    if (!v45)
      goto LABEL_42;
    v38 = CFAbsoluteTimeGetCurrent();
    if (v38 - v80[3] < 0.01)
      goto LABEL_42;
    v80[3] = v38;
    v87[0] = 0;
    (*((void (**)(id, uint8_t *, double))v10 + 2))(v10, v87, 1.0);
    v39 = *((_BYTE *)v84 + 24) | v87[0];
    *((_BYTE *)v84 + 24) = v39;
    if (!v39 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_42;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 163;
    LOWORD(v92) = 2080;
    *(_QWORD *)((char *)&v92 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
    v29 = MEMORY[0x1E0C81028];
    goto LABEL_41;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 88;
    LOWORD(v92) = 2080;
    *(_QWORD *)((char *)&v92 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_44:
  _Block_object_dispose(&v79, 8);
  _Block_object_dispose(&v83, 8);

}

- (void)deletePOIEdgesWithMomentNodes:(id)a3 inGraph:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (objc_class *)MEMORY[0x1E0D42A30];
  v6 = a4;
  v7 = a3;
  v10 = objc_alloc_init(v5);
  objc_msgSend(v7, "poiNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPOIEdgeCollection, "edgesFromNodes:toNodes:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeEdges:", v9);
  objc_msgSend(v6, "executeGraphChangeRequest:", v10);

}

- (void)_insertPointOfInterestTypeStrings:(id)a3 graph:(id)a4 withMomentNodes:(id)a5 loggingConnection:(id)a6
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  PGGraphMomentNodeCollection *v17;
  void *v18;
  PGGraphMomentNodeCollection *v19;
  void *v20;
  unint64_t v21;
  PGGraphPOINode *v22;
  void *v23;
  PGGraphMomentNodeCollection *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  uint64_t v33;
  id v34;
  id v35;
  id obj;
  void *v37;
  void *v38;
  PGGraphMomentNodeCollection *v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _QWORD v48[4];
  id v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  _BYTE v54[128];
  _BYTE v55[128];
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v50 = 0u;
  v51 = 0u;
  v52 = 0u;
  v53 = 0u;
  obj = v8;
  v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v51;
    v41 = *(_QWORD *)v51;
    v42 = v9;
    v35 = v10;
    do
    {
      v14 = 0;
      v40 = v12;
      do
      {
        if (*(_QWORD *)v51 != v13)
          objc_enumerationMutation(obj);
        +[PGGraph poiLabelForPOIType:](PGGraph, "poiLabelForPOIType:", *(_QWORD *)(*((_QWORD *)&v50 + 1) + 8 * v14));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        if (v15)
        {
          v16 = objc_alloc_init(MEMORY[0x1E0D42A30]);
          v17 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v10, v9);
          +[PGGraphPOINodeCollection poiNodesForLabel:inGraph:](PGGraphPOINodeCollection, "poiNodesForLabel:inGraph:", v15, v9);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v18, "count"))
          {
            v19 = v17;
            +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPOIEdgeCollection, "edgesFromNodes:toNodes:", v17, v18);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "count");
            if (v21 >= objc_msgSend(v10, "count"))
            {
              v17 = v19;
              v23 = v20;
              v13 = v41;
              v9 = v42;
            }
            else
            {
              v43 = v15;
              objc_msgSend(v18, "anyNode");
              v22 = (PGGraphPOINode *)objc_claimAutoreleasedReturnValue();
              v17 = v19;
              v23 = v20;
              v13 = v41;
              v9 = v42;
              if (!v22)
                goto LABEL_10;
LABEL_12:
              v38 = v18;
              v39 = v17;
              v24 = v17;
              v37 = v23;
              if (objc_msgSend(v23, "count"))
              {
                objc_msgSend(v23, "elementIdentifiers");
                v25 = (void *)objc_claimAutoreleasedReturnValue();
                v48[0] = MEMORY[0x1E0C809B0];
                v48[1] = 3221225472;
                v48[2] = __116__PGGraphIngestPointsOfInterestProcessor__insertPointOfInterestTypeStrings_graph_withMomentNodes_loggingConnection___block_invoke;
                v48[3] = &unk_1E8434FA8;
                v49 = v9;
                objc_msgSend(v25, "enumerateIdentifiersWithBlock:", v48);

                +[MANodeCollection sourceNodesOfEdges:](PGGraphMomentNodeCollection, "sourceNodesOfEdges:", v23);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                -[MAElementCollection collectionBySubtracting:](v24, "collectionBySubtracting:", v26);
                v27 = objc_claimAutoreleasedReturnValue();

                v24 = (PGGraphMomentNodeCollection *)v27;
              }
              v46 = 0u;
              v47 = 0u;
              v44 = 0u;
              v45 = 0u;
              v28 = v10;
              v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
              if (v29)
              {
                v30 = v29;
                v31 = *(_QWORD *)v45;
                do
                {
                  for (i = 0; i != v30; ++i)
                  {
                    if (*(_QWORD *)v45 != v31)
                      objc_enumerationMutation(v28);
                    v33 = *(_QWORD *)(*((_QWORD *)&v44 + 1) + 8 * i);
                    if (-[MANodeCollection containsNode:](v24, "containsNode:", v33))
                    {
                      v34 = -[PGGraphPOIEdge initFromMomentNode:toPOINode:confidence:poiIsImproved:poiIsSpecial:]([PGGraphPOIEdge alloc], "initFromMomentNode:toPOINode:confidence:poiIsImproved:poiIsSpecial:", v33, v22, 1, 0, 1.0);
                      objc_msgSend(v16, "addEdge:", v34);

                    }
                  }
                  v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v44, v54, 16);
                }
                while (v30);
              }

              v9 = v42;
              objc_msgSend(v42, "executeGraphChangeRequest:", v16);

              v10 = v35;
              v13 = v41;
              v15 = v43;
              v18 = v38;
              v17 = v39;
              v23 = v37;
            }
          }
          else
          {
            v43 = v15;
            v22 = -[PGGraphPOINode initWithLabel:]([PGGraphPOINode alloc], "initWithLabel:", v15);
            objc_msgSend(v16, "addNode:", v22);
            v23 = 0;
            if (v22)
              goto LABEL_12;
LABEL_10:
            v15 = v43;
          }

          v12 = v40;
        }

        ++v14;
      }
      while (v14 != v12);
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v50, v55, 16);
    }
    while (v12);
  }

}

- (id)_pointOfInterestTypeStringsFromBusinessItems:(id)a3 withOriginalCoordinate:(CLLocationCoordinate2D)a4
{
  CLLocationDegrees longitude;
  CLLocationDegrees latitude;
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  double v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  id v24;
  id obj;
  _BOOL4 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint64_t v31;
  uint64_t v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  CLLocationCoordinate2D v37;
  _BYTE v38[128];
  _BYTE v39[128];
  uint64_t v40;
  CLLocationCoordinate2D v41;

  longitude = a4.longitude;
  latitude = a4.latitude;
  v40 = *MEMORY[0x1E0C80C00];
  v37 = a4;
  v6 = a3;
  if (objc_msgSend(v6, "count"))
  {
    v41.latitude = latitude;
    v41.longitude = longitude;
    v26 = CLLocationCoordinate2DIsValid(v41);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v33 = 0u;
    v34 = 0u;
    v35 = 0u;
    v36 = 0u;
    v24 = v6;
    obj = v6;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v34 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          if (!v26)
            goto LABEL_9;
          v31 = 0;
          v32 = 0;
          objc_msgSend(v12, "region");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v13, "center");
          v31 = v14;
          v32 = v15;

          CLLocationCoordinate2DGetDistanceFrom();
          if (v16 <= 0.1)
          {
LABEL_9:
            objc_msgSend(v12, "categories");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v27 = 0u;
            v28 = 0u;
            v29 = 0u;
            v30 = 0u;
            v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
            if (v18)
            {
              v19 = v18;
              v20 = *(_QWORD *)v28;
              do
              {
                for (j = 0; j != v19; ++j)
                {
                  if (*(_QWORD *)v28 != v20)
                    objc_enumerationMutation(v17);
                  +[PGGraphPlacesResolver poiStringFromSpatialLookupCategory:](PGGraphPlacesResolver, "poiStringFromSpatialLookupCategory:", objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * j), "integerValue"));
                  v22 = (void *)objc_claimAutoreleasedReturnValue();
                  if (v22)
                    objc_msgSend(v7, "addObject:", v22);

                }
                v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v27, v38, 16);
              }
              while (v19);
            }

          }
        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v39, 16);
      }
      while (v9);
    }

    v6 = v24;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v7;
}

- (void)_collectPOIsToResolveWithMomentNodes:(id)a3 graphUpdate:(id)a4 progress:(id)a5
{
  id v8;
  id v9;
  void *v10;
  double v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  id v18;
  id v19;
  id v20;
  double Current;
  char v22;
  id v23;
  id v24;
  id v25;
  id v26;
  char v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id v32;
  id v33;
  id v34;
  uint64_t *v35;
  uint64_t *p_buf;
  uint64_t *v37;
  uint64_t v38;
  double v39;
  uint64_t v40;
  double *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  _DWORD v48[2];
  __int16 v49;
  const char *v50;
  uint64_t buf;
  __int128 v52;
  uint64_t v53;
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v26 = a4;
  v9 = a5;
  v10 = _Block_copy(v9);
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = (double *)&v40;
  v42 = 0x2020000000;
  v43 = 0;
  if (v10
    && (v11 = CFAbsoluteTimeGetCurrent(), v11 - v41[3] >= 0.01)
    && (v41[3] = v11,
        LOBYTE(v48[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v10 + 2))(v10, v48, 0.0),
        v12 = *((_BYTE *)v45 + 24) | LOBYTE(v48[0]),
        (*((_BYTE *)v45 + 24) = v12) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 0x10804000202;
      LOWORD(v52) = 2080;
      *(_QWORD *)((char *)&v52 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    -[PGGraphBuilder serviceManager](self->_graphBuilder, "serviceManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v9;
    -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 0;
    *(_QWORD *)&v52 = &buf;
    *((_QWORD *)&v52 + 1) = 0x2020000000;
    v53 = 0;
    v17 = 1.0 / (double)(unint64_t)objc_msgSend(v8, "count");
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __100__PGGraphIngestPointsOfInterestProcessor__collectPOIsToResolveWithMomentNodes_graphUpdate_progress___block_invoke;
    v28[3] = &unk_1E8435000;
    v18 = v10;
    v34 = v18;
    v35 = &v40;
    v38 = 0x3F847AE147AE147BLL;
    p_buf = &buf;
    v37 = &v44;
    v24 = v15;
    v29 = v24;
    v23 = v13;
    v30 = v23;
    v19 = v16;
    v31 = v19;
    v32 = v26;
    v20 = v14;
    v33 = v20;
    v39 = v17;
    objc_msgSend(v8, "enumerateNodesUsingBlock:", v28);
    objc_storeStrong((id *)&self->_momentNodesToResolvePOIByRegion, v15);
    v9 = v25;
    objc_storeStrong((id *)&self->_momentNodesToResolvePOIAndEnrichByBusinessItemMuid, v16);
    if (v10)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v41[3] >= 0.01)
      {
        v41[3] = Current;
        v27 = 0;
        (*((void (**)(id, char *, double))v18 + 2))(v18, &v27, 1.0);
        v22 = *((_BYTE *)v45 + 24) | v27;
        *((_BYTE *)v45 + 24) = v22;
        if (v22)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v48[0] = 67109378;
            v48[1] = 347;
            v49 = 2080;
            v50 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Ingest/Ingest Processing/PGGraphIngestPointsOfInterestProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v48, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

}

- (BOOL)_fetchPointsOfInterestForRegions:(id)a3 loggingConnection:(id)a4 progress:(id)a5
{
  NSObject *v8;
  id v9;
  objc_class *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  char v20;
  id v21;
  id v23;
  _QWORD v24[4];
  id v25;
  uint8_t buf[4];
  id v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = (objc_class *)MEMORY[0x1E0D4B220];
  v11 = a3;
  v12 = [v10 alloc];
  -[PGGraphBuilder poiCache](self->_graphBuilder, "poiCache");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder locationCache](self->_graphBuilder, "locationCache");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v12, "initWithPOICache:locationCache:", v13, v14);

  objc_msgSend(v15, "setPrecision:", 0.1);
  v16 = objc_alloc(MEMORY[0x1E0D4B248]);
  v28[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v28, 1);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(v16, "initWithQueryPerformers:", v17);

  objc_msgSend(v18, "setLoggingConnection:", v8);
  v24[0] = MEMORY[0x1E0C809B0];
  v24[1] = 3221225472;
  v24[2] = __102__PGGraphIngestPointsOfInterestProcessor__fetchPointsOfInterestForRegions_loggingConnection_progress___block_invoke;
  v24[3] = &unk_1E8435028;
  v19 = v9;
  v25 = v19;
  v23 = 0;
  v20 = objc_msgSend(v18, "createCacheForRegions:progressBlock:error:", v11, v24, &v23);

  v21 = v23;
  if ((v20 & 1) == 0 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v27 = v21;
    _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "Failed caching pois: %@", buf, 0xCu);
  }

  return v20;
}

- (NSDictionary)momentNodesToResolvePOIByRegion
{
  return self->_momentNodesToResolvePOIByRegion;
}

- (NSDictionary)momentNodesToResolvePOIAndEnrichByBusinessItemMuid
{
  return self->_momentNodesToResolvePOIAndEnrichByBusinessItemMuid;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_momentNodesToResolvePOIAndEnrichByBusinessItemMuid, 0);
  objc_storeStrong((id *)&self->_momentNodesToResolvePOIByRegion, 0);
  objc_storeStrong((id *)&self->_businessCacheUpdater, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

uint64_t __102__PGGraphIngestPointsOfInterestProcessor__fetchPointsOfInterestForRegions_loggingConnection_progress___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __100__PGGraphIngestPointsOfInterestProcessor__collectPOIsToResolveWithMomentNodes_graphUpdate_progress___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  double Current;
  uint64_t v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  char v16;

  v5 = a2;
  if (*(_QWORD *)(a1 + 72)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
        Current - *(double *)(v7 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v7 + 24) = Current,
        v16 = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 72) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    v8 = (void *)MEMORY[0x1CAA4EB2C]();
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __100__PGGraphIngestPointsOfInterestProcessor__collectPOIsToResolveWithMomentNodes_graphUpdate_progress___block_invoke_2;
    v9[3] = &unk_1E8434FD8;
    v10 = *(id *)(a1 + 32);
    v11 = v5;
    v12 = *(id *)(a1 + 40);
    v13 = *(id *)(a1 + 48);
    v14 = *(id *)(a1 + 56);
    v15 = *(id *)(a1 + 64);
    objc_msgSend(v11, "enumeratePreciseAddressNodesUsingBlock:", v9);

    objc_autoreleasePoolPop(v8);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(double *)(a1 + 112)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 24);
  }

}

void __100__PGGraphIngestPointsOfInterestProcessor__collectPOIsToResolveWithMomentNodes_graphUpdate_progress___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSObject *v25;
  NSObject *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  NSObject *v38;
  NSObject *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  id v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  __int16 v63;
  void *v64;
  _BYTE v65[128];
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if ((objc_msgSend(v3, "hasEdgeWithLabel:domain:", CFSTR("IS_HOME_WORK"), 202) & 1) == 0)
  {
    objc_msgSend(v3, "location");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "coordinate");
    v6 = v5;
    v8 = v7;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%f,%f"), *(_QWORD *)&v5, *(_QWORD *)&v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v53 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C9E368]), "initWithCenter:radius:identifier:", v9, v6, v8, 0.1);
    objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = *(void **)(a1 + 40);
    if (v10)
    {
      v12 = v10;
      objc_msgSend(v10, "addObject:", v11);
    }
    else
    {
      v48 = v9;
      v49 = v3;
      objc_msgSend(v11, "universalStartDate");
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "universalEndDate");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      v47 = (void *)v13;
      v52 = v4;
      v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v13, v46);
      objc_msgSend(*(id *)(a1 + 48), "fetchLocationOfInterestVisitsAtLocation:inDateInterval:", v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = 0u;
      v56 = 0u;
      v57 = 0u;
      v58 = 0u;
      v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
      if (v15)
      {
        v16 = v15;
        v12 = 0;
        v17 = *(_QWORD *)v56;
        v18 = *MEMORY[0x1E0D4B0C0];
        v50 = *MEMORY[0x1E0D4B0C0];
        v51 = v14;
        do
        {
          for (i = 0; i != v16; ++i)
          {
            if (*(_QWORD *)v56 != v17)
              objc_enumerationMutation(v14);
            v20 = *(void **)(*((_QWORD *)&v55 + 1) + 8 * i);
            objc_msgSend(v20, "locationOfInterest");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = v21;
            if (v21 && objc_msgSend(v21, "type") && objc_msgSend(v22, "type") != 1)
            {
              v23 = objc_msgSend(v22, "businessItemMuid");
              if (v23 == v18)
              {
                objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", *(_QWORD *)(a1 + 40));
                v24 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v24, v53);
                v25 = *(NSObject **)(a1 + 72);
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  v26 = v25;
                  objc_msgSend(v52, "coordinate");
                  v28 = v27;
                  objc_msgSend(v52, "coordinate");
                  v30 = v29;
                  objc_msgSend(*(id *)(a1 + 40), "name");
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134284035;
                  v60 = v28;
                  v61 = 2049;
                  v62 = v30;
                  v63 = 2112;
                  v64 = v31;
                  _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "Should fetch POI for location {%{private}f, %{private}f} in Moment \"%@\" from Routine", buf, 0x20u);

                }
                v12 = (void *)v24;
              }
              else
              {
                v54 = v12;
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v23);
                v32 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v32);
                v33 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v33)
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v33 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v33, v32);
                }
                objc_msgSend(v33, "addObject:", *(_QWORD *)(a1 + 40));
                v34 = a1;
                v35 = *(void **)(a1 + 64);
                objc_msgSend(*(id *)(v34 + 40), "uuid");
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                v37 = v35;
                a1 = v34;
                objc_msgSend(v37, "registerLocationOfInterestVisitToResolve:forMomentUUID:", v20, v36);

                v38 = *(NSObject **)(v34 + 72);
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  v39 = v38;
                  objc_msgSend(v52, "coordinate");
                  v41 = v40;
                  objc_msgSend(v52, "coordinate");
                  v43 = v42;
                  objc_msgSend(*(id *)(v34 + 40), "name");
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 134284035;
                  v60 = v41;
                  v61 = 2049;
                  v62 = v43;
                  v63 = 2112;
                  v64 = v44;
                  _os_log_impl(&dword_1CA237000, v39, OS_LOG_TYPE_INFO, "Should fetch POI and enrich for location {%{private}f, %{private}f} in Moment \"%@\" from Routine", buf, 0x20u);

                  a1 = v34;
                }

                v18 = v50;
                v14 = v51;
                v12 = v54;
              }
            }

          }
          v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v55, v65, 16);
        }
        while (v16);
      }
      else
      {
        v12 = 0;
      }

      v9 = v48;
      v3 = v49;
      v4 = v52;
    }

  }
}

uint64_t __116__PGGraphIngestPointsOfInterestProcessor__insertPointOfInterestTypeStrings_graph_withMomentNodes_loggingConnection___block_invoke(uint64_t a1, uint64_t a2)
{
  return +[PGGraphPOIEdge setPOIIsImproved:onEdgeForIdentifier:inGraph:](PGGraphPOIEdge, "setPOIIsImproved:onEdgeForIdentifier:inGraph:", 1, a2, *(_QWORD *)(a1 + 32));
}

void __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke_173(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + a3 * 0.3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke_175(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + a3 * 0.3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __107__PGGraphIngestPointsOfInterestProcessor_disambiguatePointsOfInterestWithMomentNodes_graphUpdate_progress___block_invoke_176(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  void *v9;
  double v10;
  double v11;
  double Current;
  uint64_t v13;
  void *v14;
  void *v15;

  v7 = a2;
  v8 = a3;
  v9 = (void *)MEMORY[0x1CAA4EB2C]();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(double *)(a1 + 96)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24);
  if (*(_QWORD *)(a1 + 64)
    && (v10 = *(double *)(a1 + 104),
        v11 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24),
        Current = CFAbsoluteTimeGetCurrent(),
        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
        Current - *(double *)(v13 + 24) >= *(double *)(a1 + 112))
    && (*(double *)(v13 + 24) = Current,
        (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(v10 + v11 * 0.1),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "businessItemsForRegion:", v7);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "center");
    objc_msgSend(*(id *)(a1 + 40), "_pointOfInterestTypeStringsFromBusinessItems:withOriginalCoordinate:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 40), "_insertPointOfInterestTypeStrings:graph:withMomentNodes:loggingConnection:", v15, *(_QWORD *)(a1 + 48), v8, *(_QWORD *)(a1 + 56));

  }
  objc_autoreleasePoolPop(v9);

}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 6;
}

@end
