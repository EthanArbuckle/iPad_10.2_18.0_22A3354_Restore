@implementation PGGraphIngestBusinessProcessor

- (PGGraphIngestBusinessProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestBusinessProcessor *v6;
  PGGraphIngestBusinessProcessor *v7;
  id v8;
  void *v9;
  uint64_t v10;
  CLSBusinessCacheUpdater *businessCacheUpdater;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGGraphIngestBusinessProcessor;
  v6 = -[PGGraphIngestBusinessProcessor init](&v13, sel_init);
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
  void *v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  id v19;
  os_signpost_id_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint32_t denom;
  uint32_t numer;
  NSObject *v26;
  NSObject *v27;
  NSObject *v28;
  id v29;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  double v34;
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v29 = a4;
  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = os_signpost_id_generate(v8);
  v10 = v8;
  v11 = v10;
  v12 = v9 - 1;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGGraphIngestBusinessProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v13 = mach_absolute_time();
  objc_msgSend(v6, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v7, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphIngestBusinessProcessor deleteBusinessEdgesWithMomentNodes:inGraph:](self, "deleteBusinessEdgesWithMomentNodes:inGraph:", v14, v7);
  objc_msgSend(v6, "registeredResolvableItemsByBusinessItemMuid");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
    -[PGGraphIngestBusinessProcessor _insertBusinessItemsForMomentNodesToResolvedBusinessItems:graph:progressBlock:](self, "_insertBusinessItemsForMomentNodesToResolvedBusinessItems:graph:progressBlock:", v15, v7, v29);
  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v6, "registeredLocationOfInterestVisitsToResolveByMomentUUID");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphIngestBusinessProcessor requiredCriteriaByPOIIdentifierForGraph:](self, "requiredCriteriaByPOIIdentifierForGraph:", v7);
    v28 = v11;
    v17 = v15;
    v18 = v9 - 1;
    v19 = v6;
    v20 = v9;
    v21 = v13;
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphIngestBusinessProcessor _insertBusinessItemsFromMomentNodes:graph:withLocationOfInterestVisitsToResolveByMomentUUID:requiredCriteriaByPOIIdentifier:progressBlock:](self, "_insertBusinessItemsFromMomentNodes:graph:withLocationOfInterestVisitsToResolveByMomentUUID:requiredCriteriaByPOIIdentifier:progressBlock:", v14, v7, v16, v22, v29);

    v13 = v21;
    v9 = v20;
    v6 = v19;
    v12 = v18;
    v15 = v17;
    v11 = v28;

  }
  -[PGGraphIngestBusinessProcessor deleteBusinessNodesWithNoInEdgesInGraph:](self, "deleteBusinessNodesWithNoInEdgesInGraph:", v7);
  -[PGGraphIngestBusinessProcessor deleteBusinessCategoryNodesWithNoEdges:](self, "deleteBusinessCategoryNodesWithNoEdges:", v7);
  v23 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v26 = v11;
  v27 = v26;
  if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v27, OS_SIGNPOST_INTERVAL_END, v9, "PGGraphIngestBusinessProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v32 = "PGGraphIngestBusinessProcessor";
    v33 = 2048;
    v34 = (float)((float)((float)((float)(v23 - v13) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)deleteBusinessEdgesWithMomentNodes:(id)a3 inGraph:(id)a4
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
  objc_msgSend(v7, "businessNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPlaceBusinessEdgeCollection, "edgesFromNodes:toNodes:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeEdges:", v9);
  objc_msgSend(v6, "executeGraphChangeRequest:", v10);

}

- (void)deleteBusinessNodesWithNoInEdgesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PGGraphBusinessNode filter](PGGraphBusinessNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWhereNoInEdges:", 1);
  objc_msgSend(v4, "nodeIdentifiersMatchingFilter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v6, "count");
    _os_log_debug_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEBUG, "[IngestBusiness] Deleted %lu business item nodes from the graph", (uint8_t *)&v9, 0xCu);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  objc_msgSend(v8, "removeNodesForIdentifiers:", v6);
  objc_msgSend(v4, "executeGraphChangeRequest:", v8);

}

- (void)deleteBusinessCategoryNodesWithNoEdges:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  id v10;
  int v11;
  uint64_t v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphBusinessCategoryNodeCollection, "nodesInGraph:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphBusinessCategoryNode filterWithCategories:](PGGraphBusinessCategoryNode, "filterWithCategories:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setWhereNoInAndOutEdges:", 1);
  objc_msgSend(v4, "nodeIdentifiersMatchingFilter:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    v11 = 134217984;
    v12 = objc_msgSend(v8, "count");
    _os_log_debug_impl(&dword_1CA237000, v9, OS_LOG_TYPE_DEBUG, "[IngestBusiness] Deleted %lu business category nodes from the graph", (uint8_t *)&v11, 0xCu);
  }

  v10 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  objc_msgSend(v10, "removeNodesForIdentifiers:", v8);
  objc_msgSend(v4, "executeGraphChangeRequest:", v10);

}

- (void)_insertBusinessItemsForMomentNodesToResolvedBusinessItems:(id)a3 graph:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  double v12;
  char v13;
  void *v14;
  void *v15;
  void *v16;
  CLSBusinessCacheUpdater *businessCacheUpdater;
  uint64_t v18;
  id v19;
  double v20;
  char v21;
  id v22;
  id v23;
  double Current;
  char v25;
  _QWORD v26[4];
  id v27;
  PGGraphIngestBusinessProcessor *v28;
  id v29;
  uint8_t *v30;
  uint64_t *v31;
  _QWORD *v32;
  uint64_t *v33;
  uint64_t *v34;
  uint64_t v35;
  char v36;
  _QWORD v37[3];
  double v38;
  uint64_t v39;
  double *v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  __int128 v47;
  uint64_t v48;
  double *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  char v55;
  uint8_t v56[4];
  int v57;
  __int16 v58;
  const char *v59;
  uint8_t buf[8];
  __int128 v61;
  uint64_t (*v62)(uint64_t, uint64_t);
  void (*v63)(uint64_t);
  id v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = _Block_copy(v10);
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 0;
  v48 = 0;
  v49 = (double *)&v48;
  v50 = 0x2020000000;
  v51 = 0;
  if (v11
    && (v12 = CFAbsoluteTimeGetCurrent(), v12 - v49[3] >= 0.01)
    && (v49[3] = v12,
        LOBYTE(v39) = 0,
        (*((void (**)(void *, uint64_t *, double))v11 + 2))(v11, &v39, 0.0),
        v13 = *((_BYTE *)v53 + 24) | v39,
        (*((_BYTE *)v53 + 24) = v13) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 185;
      LOWORD(v61) = 2080;
      *(_QWORD *)((char *)&v61 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestBusinessProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
  }
  else
  {
    v14 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v8, "allKeys");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setWithArray:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    *(_QWORD *)buf = 0;
    *(_QWORD *)&v61 = buf;
    *((_QWORD *)&v61 + 1) = 0x3032000000;
    v62 = __Block_byref_object_copy__15066;
    v63 = __Block_byref_object_dispose__15067;
    businessCacheUpdater = self->_businessCacheUpdater;
    v18 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __112__PGGraphIngestBusinessProcessor__insertBusinessItemsForMomentNodesToResolvedBusinessItems_graph_progressBlock___block_invoke;
    v43[3] = &unk_1E8434F58;
    v19 = v11;
    v44 = v19;
    v45 = &v48;
    v47 = xmmword_1CA8ED960;
    v46 = &v52;
    -[CLSBusinessCacheUpdater enrichedBusinessItemsByMuidsForMuids:progressBlock:](businessCacheUpdater, "enrichedBusinessItemsByMuidsForMuids:progressBlock:", v16, v43);
    v64 = (id)objc_claimAutoreleasedReturnValue();
    v39 = 0;
    v40 = (double *)&v39;
    v41 = 0x2020000000;
    v42 = 0x3FDCCCCCCCCCCCCDLL;
    v37[0] = 0;
    v37[1] = v37;
    v37[2] = 0x2020000000;
    v38 = 0.0;
    v38 = 0.05 / (double)(unint64_t)objc_msgSend(v8, "count");
    if (v11
      && (v20 = CFAbsoluteTimeGetCurrent(), v20 - v49[3] >= 0.01)
      && (v49[3] = v20,
          v36 = 0,
          (*((void (**)(id, char *, double))v19 + 2))(v19, &v36, v40[3]),
          v21 = *((_BYTE *)v53 + 24) | v36,
          (*((_BYTE *)v53 + 24) = v21) != 0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v56 = 67109378;
        v57 = 197;
        v58 = 2080;
        v59 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/In"
              "gest/Ingest Processing/PGGraphIngestBusinessProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v56, 0x12u);
      }
    }
    else
    {
      -[PGGraphBuilder publicEventManager](self->_graphBuilder, "publicEventManager");
      v26[0] = v18;
      v26[1] = 3221225472;
      v26[2] = __112__PGGraphIngestBusinessProcessor__insertBusinessItemsForMomentNodesToResolvedBusinessItems_graph_progressBlock___block_invoke_215;
      v26[3] = &unk_1E8429750;
      v30 = buf;
      v22 = (id)objc_claimAutoreleasedReturnValue();
      v27 = v22;
      v28 = self;
      v31 = &v39;
      v32 = v37;
      v23 = v19;
      v29 = v23;
      v33 = &v48;
      v34 = &v52;
      v35 = 0x3F847AE147AE147BLL;
      objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v26);
      if (v11)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v49[3] >= 0.01)
        {
          v49[3] = Current;
          v36 = 0;
          (*((void (**)(id, char *, double))v23 + 2))(v23, &v36, 0.5);
          v25 = *((_BYTE *)v53 + 24) | v36;
          *((_BYTE *)v53 + 24) = v25;
          if (v25)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v56 = 67109378;
              v57 = 244;
              v58 = 2080;
              v59 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gr"
                    "aph/Ingest/Ingest Processing/PGGraphIngestBusinessProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v56, 0x12u);
            }
          }
        }
      }

    }
    _Block_object_dispose(v37, 8);
    _Block_object_dispose(&v39, 8);
    _Block_object_dispose(buf, 8);

  }
  _Block_object_dispose(&v48, 8);
  _Block_object_dispose(&v52, 8);

}

- (void)_insertBusinessItemsFromMomentNodes:(id)a3 graph:(id)a4 withLocationOfInterestVisitsToResolveByMomentUUID:(id)a5 requiredCriteriaByPOIIdentifier:(id)a6 progressBlock:(id)a7
{
  id v11;
  id v12;
  double Current;
  char v14;
  void *v15;
  void *v16;
  unint64_t v17;
  uint64_t v18;
  void *v19;
  CLSBusinessCacheUpdater *businessCacheUpdater;
  void (**v21)(void *, uint8_t *, double);
  void *v22;
  double v23;
  char v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;
  double v38;
  char v39;
  id v40;
  void (**v41)(void *, uint8_t *, double);
  id v42;
  id v43;
  id v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  void (**v49)(void *, uint8_t *, double);
  uint64_t v50;
  uint64_t v51;
  id obj;
  void *context;
  uint64_t v54;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  char v64;
  _QWORD v65[4];
  void (**v66)(void *, uint8_t *, double);
  uint64_t *v67;
  uint64_t *v68;
  uint64_t *v69;
  __int128 v70;
  _QWORD v71[4];
  id v72;
  PGGraphIngestBusinessProcessor *v73;
  id v74;
  id v75;
  void (**v76)(void *, uint8_t *, double);
  uint8_t *v77;
  uint64_t *v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t v81;
  double v82;
  _QWORD aBlock[4];
  id v84;
  id v85;
  uint64_t v86;
  double *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t *v91;
  uint64_t v92;
  char v93;
  uint64_t v94;
  double *v95;
  uint64_t v96;
  uint64_t v97;
  _BYTE v98[128];
  uint8_t v99[128];
  uint8_t v100[4];
  int v101;
  __int16 v102;
  const char *v103;
  uint8_t buf[8];
  __int128 v105;
  uint64_t (*v106)(uint64_t, uint64_t);
  void (*v107)(uint64_t);
  PGMeaningfulEventProcessorCache *v108;
  uint64_t v109;

  v109 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v45 = a4;
  v46 = a5;
  v47 = a6;
  v12 = a7;
  v48 = v11;
  if (objc_msgSend(v11, "count"))
  {
    v94 = 0;
    v95 = (double *)&v94;
    v96 = 0x2020000000;
    v97 = 0x3FE0000000000000;
    v42 = v12;
    v49 = (void (**)(void *, uint8_t *, double))_Block_copy(v12);
    v90 = 0;
    v91 = &v90;
    v92 = 0x2020000000;
    v93 = 0;
    v86 = 0;
    v87 = (double *)&v86;
    v88 = 0x2020000000;
    v89 = 0;
    if (v49)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v87[3] >= 0.01)
      {
        v87[3] = Current;
        v100[0] = 0;
        v49[2](v49, v100, v95[3]);
        v14 = *((_BYTE *)v91 + 24) | v100[0];
        *((_BYTE *)v91 + 24) = v14;
        if (v14)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = 261;
            LOWORD(v105) = 2080;
            *(_QWORD *)((char *)&v105 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestBusinessProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          goto LABEL_37;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = objc_msgSend(v11, "count");
    v18 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __172__PGGraphIngestBusinessProcessor__insertBusinessItemsFromMomentNodes_graph_withLocationOfInterestVisitsToResolveByMomentUUID_requiredCriteriaByPOIIdentifier_progressBlock___block_invoke;
    aBlock[3] = &unk_1E8429778;
    v44 = v15;
    v84 = v44;
    v43 = v16;
    v85 = v43;
    v19 = _Block_copy(aBlock);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v105 = buf;
    *((_QWORD *)&v105 + 1) = 0x3032000000;
    v106 = __Block_byref_object_copy__15066;
    v107 = __Block_byref_object_dispose__15067;
    v108 = -[PGMeaningfulEventProcessorCache initWithMomentNodes:]([PGMeaningfulEventProcessorCache alloc], "initWithMomentNodes:", v11);
    v71[0] = v18;
    v71[1] = 3221225472;
    v71[2] = __172__PGGraphIngestBusinessProcessor__insertBusinessItemsFromMomentNodes_graph_withLocationOfInterestVisitsToResolveByMomentUUID_requiredCriteriaByPOIIdentifier_progressBlock___block_invoke_2;
    v71[3] = &unk_1E84297A0;
    v72 = v46;
    v73 = self;
    v74 = v47;
    v77 = buf;
    v40 = v19;
    v75 = v40;
    v41 = v49;
    v76 = v41;
    v78 = &v86;
    v81 = 0x3F847AE147AE147BLL;
    v79 = &v94;
    v80 = &v90;
    v82 = 0.2 / (double)v17;
    objc_msgSend(v11, "enumerateNodesUsingBlock:", v71);
    if (objc_msgSend(v44, "count"))
    {
      businessCacheUpdater = self->_businessCacheUpdater;
      v65[0] = v18;
      v65[1] = 3221225472;
      v65[2] = __172__PGGraphIngestBusinessProcessor__insertBusinessItemsFromMomentNodes_graph_withLocationOfInterestVisitsToResolveByMomentUUID_requiredCriteriaByPOIIdentifier_progressBlock___block_invoke_3;
      v65[3] = &unk_1E8434EB8;
      v21 = v41;
      v66 = v21;
      v67 = &v86;
      v70 = xmmword_1CA8ED970;
      v68 = &v94;
      v69 = &v90;
      -[CLSBusinessCacheUpdater enrichedBusinessItemsByMuidsForBusinessItems:progressBlock:](businessCacheUpdater, "enrichedBusinessItemsByMuidsForBusinessItems:progressBlock:", v43, v65, v40);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v95[3] = v95[3] + 0.2;
      if (v49)
      {
        v23 = CFAbsoluteTimeGetCurrent();
        if (v23 - v87[3] >= 0.01)
        {
          v87[3] = v23;
          v64 = 0;
          v21[2](v21, (uint8_t *)&v64, v95[3]);
          v24 = *((_BYTE *)v91 + 24) | v64;
          *((_BYTE *)v91 + 24) = v24;
          if (v24)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v100 = 67109378;
              v101 = 314;
              v102 = 2080;
              v103 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/G"
                     "raph/Ingest/Ingest Processing/PGGraphIngestBusinessProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v100, 0x12u);
            }

LABEL_36:
            _Block_object_dispose(buf, 8);

LABEL_37:
            _Block_object_dispose(&v86, 8);
            _Block_object_dispose(&v90, 8);

            _Block_object_dispose(&v94, 8);
            v12 = v42;
            goto LABEL_38;
          }
        }
      }
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      obj = v44;
      v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v99, 16);
      if (v25)
      {
        v50 = *(_QWORD *)v61;
        do
        {
          v26 = 0;
          v51 = v25;
          do
          {
            if (*(_QWORD *)v61 != v50)
              objc_enumerationMutation(obj);
            v54 = v26;
            v27 = *(_QWORD *)(*((_QWORD *)&v60 + 1) + 8 * v26);
            context = (void *)MEMORY[0x1CAA4EB2C]();
            objc_msgSend(obj, "objectForKey:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v58 = 0u;
            v59 = 0u;
            v56 = 0u;
            v57 = 0u;
            v29 = v28;
            v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v98, 16);
            if (v30)
            {
              v31 = *(_QWORD *)v57;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v57 != v31)
                    objc_enumerationMutation(v29);
                  v33 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * i);
                  objc_msgSend(v33, "businessItem");
                  v34 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v34, "muid"));
                  v35 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v22, "objectForKeyedSubscript:", v35);
                  v36 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v36)
                  {
                    objc_msgSend(v33, "updateBusinessItem:", v36);
                    v37 = -[PGGraphBuilder insertBusiness:fromMomentNode:](self->_graphBuilder, "insertBusiness:fromMomentNode:", v33, v27);
                  }

                }
                v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v56, v98, 16);
              }
              while (v30);
            }

            objc_autoreleasePoolPop(context);
            v26 = v54 + 1;
          }
          while (v54 + 1 != v51);
          v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v60, v99, 16);
        }
        while (v25);
      }

    }
    if (v49)
    {
      v38 = CFAbsoluteTimeGetCurrent();
      if (v38 - v87[3] >= 0.01)
      {
        v87[3] = v38;
        v64 = 0;
        v41[2](v41, (uint8_t *)&v64, 1.0);
        v39 = *((_BYTE *)v91 + 24) | v64;
        *((_BYTE *)v91 + 24) = v39;
        if (v39)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v100 = 67109378;
            v101 = 331;
            v102 = 2080;
            v103 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/Ingest Processing/PGGraphIngestBusinessProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v100, 0x12u);
          }
        }
      }
    }
    goto LABEL_36;
  }
LABEL_38:

}

- (BOOL)_momentNode:(id)a3 hasValidConstraintsForLocationOfInterestVisit:(id)a4 requiredCriteriaByPOIIdentifier:(id)a5 meaningfulEventProcessorCache:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  BOOL v17;
  void *v18;
  double v19;
  double v20;
  int v21;
  double v22;
  void *v23;
  id v24;
  _QWORD v26[4];
  id v27;
  id v28;
  id v29;
  id v30;
  uint64_t *v31;
  _QWORD v32[6];
  _QWORD v33[4];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  char v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  char v41;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  objc_msgSend(v11, "locationOfInterest");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "businessItemMuid");
  objc_msgSend(v10, "name");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15 != *MEMORY[0x1E0D4B0C0])
  {
    v38 = 0;
    v39 = &v38;
    v40 = 0x2020000000;
    v41 = 0;
    objc_msgSend(v11, "visitInterval");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "duration");
    v20 = v19;

    if (v20 >= 3600.0)
    {
      objc_msgSend(v11, "confidence");
      if (v22 >= 0.6)
      {
        v17 = 1;
        *((_BYTE *)v39 + 24) = 1;
        goto LABEL_10;
      }
    }
    else if (v20 < 1800.0)
    {
      v34 = 0;
      v35 = &v34;
      v36 = 0x2020000000;
      v37 = 0;
      v33[0] = 0;
      v33[1] = v33;
      v33[2] = 0x2020000000;
      v33[3] = 0;
      v32[0] = MEMORY[0x1E0C809B0];
      v32[1] = 3221225472;
      v32[2] = __154__PGGraphIngestBusinessProcessor__momentNode_hasValidConstraintsForLocationOfInterestVisit_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke;
      v32[3] = &unk_1E84297C8;
      v32[4] = v33;
      v32[5] = &v34;
      objc_msgSend(v10, "enumerateConsolidatedAddressesUsingBlock:", v32);
      v21 = *((unsigned __int8 *)v35 + 24);
      _Block_object_dispose(v33, 8);
      _Block_object_dispose(&v34, 8);
      if (!v21)
      {
        v17 = 0;
LABEL_10:
        _Block_object_dispose(&v38, 8);
        goto LABEL_11;
      }
    }
    -[PGGraphBuilder serviceManager](self->_graphBuilder, "serviceManager");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __154__PGGraphIngestBusinessProcessor__momentNode_hasValidConstraintsForLocationOfInterestVisit_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_2;
    v26[3] = &unk_1E84297F0;
    v27 = v12;
    v28 = v10;
    v29 = v13;
    v24 = v23;
    v30 = v24;
    v31 = &v38;
    objc_msgSend(v28, "enumeratePOINodesUsingBlock:", v26);

    v17 = *((_BYTE *)v39 + 24) != 0;
    goto LABEL_10;
  }
  v17 = 0;
LABEL_11:

  return v17;
}

- (id)_businessItemContainersToEnrichForLowConfidenceDisambiguation:(id)a3 requiredCriteriaByPOIIdentifier:(id)a4 meaningfulEventProcessorCache:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  id v32;
  id v33;
  id v34;
  id v35;
  id v36;
  id v37;
  id v38;
  id v39;
  _QWORD *v40;
  char v41;
  _QWORD v42[5];
  id v43;
  _QWORD v44[4];
  id v45;
  _QWORD v46[4];
  id v47;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v46[0] = MEMORY[0x1E0C809B0];
  v46[1] = 3221225472;
  v46[2] = __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke;
  v46[3] = &unk_1E8432098;
  v13 = v11;
  v47 = v13;
  objc_msgSend(v8, "enumeratePOINodesUsingBlock:", v46);
  objc_msgSend(v8, "name");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (PGIsAppleInternal_onceToken != -1)
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8044);
  v15 = PGIsAppleInternal_isAppleInternal;
  if (objc_msgSend(v13, "count"))
  {
    v28 = v10;
    v29 = v9;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder poiCache](self->_graphBuilder, "poiCache");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)objc_opt_class(), "_spatialMapCategoriesByMeaningIdentifier");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = 0;
    v42[1] = v42;
    v42[2] = 0x3032000000;
    v42[3] = __Block_byref_object_copy__15066;
    v42[4] = __Block_byref_object_dispose__15067;
    v43 = 0;
    -[PGGraphBuilder serviceManager](self->_graphBuilder, "serviceManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v30[0] = v12;
    v30[1] = 3221225472;
    v30[2] = __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_3;
    v30[3] = &unk_1E8429860;
    v31 = v13;
    v32 = v29;
    v40 = v42;
    v33 = v8;
    v34 = v10;
    v20 = v19;
    v35 = v20;
    v21 = v18;
    v36 = v21;
    v22 = v17;
    v37 = v22;
    v23 = v16;
    v38 = v23;
    v41 = v15;
    v39 = v14;
    objc_msgSend(v33, "enumerateConsolidatedAddressesUsingBlock:", v30);
    v24 = v39;
    v25 = v23;

    _Block_object_dispose(v42, 8);
    v10 = v28;
    v9 = v29;
  }
  else
  {
    if (v15)
    {
      objc_msgSend(MEMORY[0x1E0C99DE8], "array");
      v44[0] = v12;
      v44[1] = 3221225472;
      v44[2] = __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_2;
      v44[3] = &unk_1E8429818;
      v45 = (id)objc_claimAutoreleasedReturnValue();
      v26 = v45;
      objc_msgSend(v8, "enumerateConsolidatedAddressesUsingBlock:", v44);

    }
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v25 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v25;
}

- (id)_predominantVisitForMomentNode:(id)a3 publicEventBusinessItemMuid:(unint64_t)a4
{
  id v6;
  BOOL v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  void *v14;
  id v15;
  _QWORD v17[4];
  id v18;
  id v19;
  uint64_t *v20;
  _QWORD *v21;
  uint64_t *v22;
  _QWORD *v23;
  unint64_t v24;
  BOOL v25;
  _QWORD v26[4];
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  _QWORD v33[4];
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;

  v6 = a3;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__15066;
  v38 = __Block_byref_object_dispose__15067;
  v39 = 0;
  v33[0] = 0;
  v33[1] = v33;
  v33[2] = 0x2020000000;
  v33[3] = 0;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__15066;
  v31 = __Block_byref_object_dispose__15067;
  v32 = 0;
  v26[0] = 0;
  v26[1] = v26;
  v26[2] = 0x2020000000;
  v26[3] = 0;
  v7 = *MEMORY[0x1E0D4B0C0] != a4;
  -[PGGraphBuilder serviceManager](self->_graphBuilder, "serviceManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    __assert_rtn("-[PGGraphIngestBusinessProcessor _predominantVisitForMomentNode:publicEventBusinessItemMuid:]", "PGGraphIngestBusinessProcessor.m", 546, "serviceManager != nil");
  objc_msgSend(v6, "universalStartDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "universalEndDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v9, v10);
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __93__PGGraphIngestBusinessProcessor__predominantVisitForMomentNode_publicEventBusinessItemMuid___block_invoke;
  v17[3] = &unk_1E8429888;
  v12 = v8;
  v18 = v12;
  v13 = v11;
  v19 = v13;
  v20 = &v34;
  v25 = v7;
  v21 = v33;
  v22 = &v27;
  v23 = v26;
  v24 = a4;
  objc_msgSend(v6, "enumeratePreciseAddressNodesUsingBlock:", v17);
  v14 = (void *)v28[5];
  if (!v14)
    v14 = (void *)v35[5];
  v15 = v14;

  _Block_object_dispose(v26, 8);
  _Block_object_dispose(&v27, 8);

  _Block_object_dispose(v33, 8);
  _Block_object_dispose(&v34, 8);

  return v15;
}

- (id)requiredCriteriaByPOIIdentifierForGraph:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  _QWORD v14[11];

  v14[10] = *MEMORY[0x1E0C80C00];
  v14[0] = CFSTR("Performance");
  v14[1] = CFSTR("SportEvent");
  v14[2] = CFSTR("Lunch");
  v14[3] = CFSTR("Dinner");
  v14[4] = CFSTR("Breakfast");
  v14[5] = CFSTR("NightOut");
  v14[6] = CFSTR("Entertainment");
  v14[7] = CFSTR("AmusementPark");
  v14[8] = CFSTR("Museum");
  v14[9] = CFSTR("Concert");
  v4 = (void *)MEMORY[0x1E0C99D20];
  v5 = a3;
  objc_msgSend(v4, "arrayWithObjects:count:", v14, 10);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder sceneTaxonomy](self->_graphBuilder, "sceneTaxonomy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMeaningfulEventRequiredCriteriaFactory requiredCriteriaForIdentifiers:inferenceType:graph:sceneTaxonomy:](PGMeaningfulEventRequiredCriteriaFactory, "requiredCriteriaForIdentifiers:inferenceType:graph:sceneTaxonomy:", v6, 0, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __74__PGGraphIngestBusinessProcessor_requiredCriteriaByPOIIdentifierForGraph___block_invoke;
  v12[3] = &unk_1E84298B0;
  v10 = v9;
  v13 = v10;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_businessCacheUpdater, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __74__PGGraphIngestBusinessProcessor_requiredCriteriaByPOIIdentifierForGraph___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t i;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t j;
  uint64_t v13;
  void *v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  obj = a3;
  v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v17)
  {
    v16 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v24 != v16)
          objc_enumerationMutation(obj);
        v5 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v5, "poisTrait");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "nodes");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v7, "count"))
        {
          v21 = 0u;
          v22 = 0u;
          v19 = 0u;
          v20 = 0u;
          v18 = v7;
          objc_msgSend(v7, "labels");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
          if (v9)
          {
            v10 = v9;
            v11 = *(_QWORD *)v20;
            do
            {
              for (j = 0; j != v10; ++j)
              {
                if (*(_QWORD *)v20 != v11)
                  objc_enumerationMutation(v8);
                v13 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * j);
                objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v13);
                v14 = (void *)objc_claimAutoreleasedReturnValue();
                if (!v14)
                {
                  objc_msgSend(MEMORY[0x1E0C99E20], "set");
                  v14 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v14, v13);
                }
                objc_msgSend(v14, "addObject:", v5);

              }
              v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v19, v27, 16);
            }
            while (v10);
          }

          v7 = v18;
        }

      }
      v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
    }
    while (v17);
  }

}

void __93__PGGraphIngestBusinessProcessor__predominantVisitForMomentNode_publicEventBusinessItemMuid___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  double v11;
  double v12;
  uint64_t v13;
  id *v14;
  uint64_t v15;
  void *v16;
  double v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "location");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "fetchLocationOfInterestVisitsAtLocation:inDateInterval:", v3, *(_QWORD *)(a1 + 40));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (!v5)
      goto LABEL_20;
    v6 = v5;
    v7 = *(_QWORD *)v19;
    while (1)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v19 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v9, "visitInterval");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "duration");
        v12 = v11;

        v13 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
        v15 = *(_QWORD *)(v13 + 40);
        v14 = (id *)(v13 + 40);
        if (!v15 || v12 > *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        {
          objc_storeStrong(v14, v9);
          *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v12;
        }
        if (*(_BYTE *)(a1 + 88))
        {
          objc_msgSend(v9, "locationOfInterest");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v16, "businessItemMuid") != *(_QWORD *)(a1 + 80))
          {

            continue;
          }
          if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40))
          {

LABEL_17:
            objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40), v9);
            *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = v12;
            continue;
          }
          v17 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);

          if (v12 > v17)
            goto LABEL_17;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      if (!v6)
      {
LABEL_20:

        break;
      }
    }
  }

}

void __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a2, "label");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    objc_msgSend(*(id *)(a1 + 32), "addObject:", v3);
    v3 = v4;
  }

}

void __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_2(uint64_t a1, void *a2)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  id v5;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "centerCoordinates");
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%.8f, %.8f}"), v3, v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v5);

}

void __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  id v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  PGMeaningfulEventMatchingCriteria *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  unint64_t v32;
  id v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  PGGraphIngestBusinessItemContainer *v48;
  uint64_t v49;
  uint64_t v50;
  id obj;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  uint64_t v62;
  id v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[6];
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  uint8_t buf[4];
  uint64_t v78;
  __int16 v79;
  uint64_t v80;
  _BYTE v81[128];
  void *v82;
  _BYTE v83[128];
  _BYTE v84[128];
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "duration");
  if (v4 >= 1800.0)
  {
    objc_msgSend(v3, "centerCoordinates");
    v6 = v5;
    v8 = v7;
    v9 = objc_alloc(MEMORY[0x1E0C9E368]);
    objc_msgSend(MEMORY[0x1E0D4B220], "defaultPrecision");
    v11 = v10;
    objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (void *)objc_msgSend(v9, "initWithCenter:radius:identifier:", v13, v6, v8, v11);

    v75 = 0u;
    v76 = 0u;
    v73 = 0u;
    v74 = 0u;
    obj = *(id *)(a1 + 32);
    v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
    if (v53)
    {
      v52 = *(_QWORD *)v74;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v74 != v52)
            objc_enumerationMutation(obj);
          v54 = v14;
          objc_msgSend(*(id *)(a1 + 40), "objectForKeyedSubscript:", *(_QWORD *)(*((_QWORD *)&v73 + 1) + 8 * v14));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v69 = 0u;
          v70 = 0u;
          v71 = 0u;
          v72 = 0u;
          v58 = v15;
          v16 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
          if (v16)
          {
            v17 = v16;
            v18 = *(_QWORD *)v70;
            v55 = *(_QWORD *)v70;
            do
            {
              v19 = 0;
              v56 = v17;
              do
              {
                if (*(_QWORD *)v70 != v18)
                  objc_enumerationMutation(v58);
                v20 = *(void **)(*((_QWORD *)&v69 + 1) + 8 * v19);
                v21 = (void *)MEMORY[0x1CAA4EB2C]();
                v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
                if (!v22)
                {
                  v23 = -[PGMeaningfulEventMatchingCriteria initWithMoment:cache:serviceManager:]([PGMeaningfulEventMatchingCriteria alloc], "initWithMoment:cache:serviceManager:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
                  v24 = *(_QWORD *)(*(_QWORD *)(a1 + 104) + 8);
                  v25 = *(void **)(v24 + 40);
                  *(_QWORD *)(v24 + 40) = v23;

                  v22 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 40);
                }
                objc_msgSend(v22, "matchingResultWithCriteria:", v20);
                v26 = (void *)objc_claimAutoreleasedReturnValue();
                v27 = objc_msgSend(v26, "isMatching");

                if (v27)
                {
                  v28 = *(void **)(a1 + 72);
                  objc_msgSend(v20, "identifier");
                  v29 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v28, "objectForKeyedSubscript:", v29);
                  v30 = (void *)objc_claimAutoreleasedReturnValue();

                  objc_msgSend(*(id *)(a1 + 80), "businessItemsInRegion:categories:maximumDistance:", v57, v30, 50.0);
                  v31 = (void *)objc_claimAutoreleasedReturnValue();
                  v32 = objc_msgSend(v31, "count");
                  if (v32)
                  {
                    v61 = v21;
                    v62 = v19;
                    v59 = v31;
                    v60 = v30;
                    if (v32 > 3)
                    {
                      v68[0] = MEMORY[0x1E0C809B0];
                      v68[1] = 3221225472;
                      v68[2] = __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_4;
                      v68[3] = &__block_descriptor_48_e45_q24__0__CLSBusinessItem_8__CLSBusinessItem_16l;
                      *(double *)&v68[4] = v6;
                      *(double *)&v68[5] = v8;
                      objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:comparator:", 0, 1, v68);
                      v34 = (void *)objc_claimAutoreleasedReturnValue();
                      v82 = v34;
                      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v82, 1);
                      v35 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v31, "sortedArrayUsingDescriptors:", v35);
                      v36 = (void *)objc_claimAutoreleasedReturnValue();

                      objc_msgSend(v36, "subarrayWithRange:", 0, 3);
                      v37 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v37);
                      v33 = (id)objc_claimAutoreleasedReturnValue();

                    }
                    else
                    {
                      v33 = v31;
                    }
                    v66 = 0u;
                    v67 = 0u;
                    v64 = 0u;
                    v65 = 0u;
                    v63 = v33;
                    v38 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
                    if (v38)
                    {
                      v39 = v38;
                      v40 = *(_QWORD *)v65;
                      do
                      {
                        v41 = 0;
                        do
                        {
                          if (*(_QWORD *)v65 != v40)
                            objc_enumerationMutation(v63);
                          v42 = *(void **)(*((_QWORD *)&v64 + 1) + 8 * v41);
                          v43 = (void *)MEMORY[0x1CAA4EB2C]();
                          v44 = objc_alloc(MEMORY[0x1E0CB3588]);
                          objc_msgSend(v3, "startDate");
                          v45 = (void *)objc_claimAutoreleasedReturnValue();
                          objc_msgSend(v3, "endDate");
                          v46 = (void *)objc_claimAutoreleasedReturnValue();
                          v47 = (void *)objc_msgSend(v44, "initWithStartDate:endDate:", v45, v46);

                          v48 = -[PGGraphIngestBusinessItemContainer initWithBusinessItem:dateInterval:]([PGGraphIngestBusinessItemContainer alloc], "initWithBusinessItem:dateInterval:", v42, v47);
                          objc_msgSend(*(id *)(a1 + 88), "addObject:", v48);
                          if (*(_BYTE *)(a1 + 112) && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
                          {
                            v49 = *(_QWORD *)(a1 + 96);
                            v50 = objc_msgSend(v42, "muid");
                            *(_DWORD *)buf = 138412546;
                            v78 = v49;
                            v79 = 2048;
                            v80 = v50;
                            _os_log_debug_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[IngestBusiness] [%@] Matching constraints for business %lu.", buf, 0x16u);
                          }

                          objc_autoreleasePoolPop(v43);
                          ++v41;
                        }
                        while (v39 != v41);
                        v39 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v64, v81, 16);
                      }
                      while (v39);
                    }

                    v18 = v55;
                    v17 = v56;
                    v21 = v61;
                    v19 = v62;
                    v31 = v59;
                    v30 = v60;
                  }

                }
                objc_autoreleasePoolPop(v21);
                ++v19;
              }
              while (v19 != v17);
              v17 = objc_msgSend(v58, "countByEnumeratingWithState:objects:count:", &v69, v83, 16);
            }
            while (v17);
          }

          v14 = v54 + 1;
        }
        while (v54 + 1 != v53);
        v53 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v73, v84, 16);
      }
      while (v53);
    }

  }
}

uint64_t __158__PGGraphIngestBusinessProcessor__businessItemContainersToEnrichForLowConfidenceDisambiguation_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_4(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;
  double v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a2;
  v5 = a3;
  objc_msgSend(v4, "region");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "center");
  v21 = v7;
  v22 = v8;

  objc_msgSend(v5, "region");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "center");
  v19 = v10;
  v20 = v11;

  CLLocationCoordinate2DGetDistanceFrom();
  v13 = v12;
  CLLocationCoordinate2DGetDistanceFrom();
  if (v13 <= v14)
  {
    if (v13 < v14)
    {
      v15 = -1;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v4, "muid", v19, v20, v21, v22));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v5, "muid"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v16, "compare:", v17);

    }
  }
  else
  {
    v15 = 1;
  }

  return v15;
}

uint64_t __154__PGGraphIngestBusinessProcessor__momentNode_hasValidConstraintsForLocationOfInterestVisit_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;
  uint64_t v6;

  result = objc_msgSend(a2, "duration");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v6;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) >= 1800.0;
  *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

void __154__PGGraphIngestBusinessProcessor__momentNode_hasValidConstraintsForLocationOfInterestVisit_requiredCriteriaByPOIIdentifier_meaningfulEventProcessorCache___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  PGMeaningfulEventMatchingCriteria *v14;
  PGMeaningfulEventMatchingCriteria *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)a1[4];
  objc_msgSend(a2, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v18 != v11)
        objc_enumerationMutation(v8);
      v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
      v14 = [PGMeaningfulEventMatchingCriteria alloc];
      v15 = -[PGMeaningfulEventMatchingCriteria initWithMoment:cache:serviceManager:](v14, "initWithMoment:cache:serviceManager:", a1[5], a1[6], a1[7], (_QWORD)v17);
      -[PGMeaningfulEventMatchingCriteria matchingResultWithCriteria:](v15, "matchingResultWithCriteria:", v13);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = objc_msgSend(v16, "isMatching");

      LODWORD(v16) = *(unsigned __int8 *)(*(_QWORD *)(a1[8] + 8) + 24);
      if ((_DWORD)v16)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

  *a3 = *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24);
}

void __172__PGGraphIngestBusinessProcessor__insertBusinessItemsFromMomentNodes_graph_withLocationOfInterestVisitsToResolveByMomentUUID_requiredCriteriaByPOIIdentifier_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectForKey:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v7, v10);
  }
  objc_msgSend(v7, "addObject:", v6);
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v6, "businessItem");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "addObject:", v9);
}

void __172__PGGraphIngestBusinessProcessor__insertBusinessItemsFromMomentNodes_graph_withLocationOfInterestVisitsToResolveByMomentUUID_requiredCriteriaByPOIIdentifier_progressBlock___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  id v15;
  void *v16;
  PGGraphIngestBusinessItemContainer *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  double Current;
  uint64_t v23;
  void *v24;
  void *v25;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  v5 = (void *)MEMORY[0x1CAA4EB2C]();
  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "uuid");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v8, "count"))
  {
    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v9 = v8;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
    if (v10)
    {
      v11 = v10;
      v24 = v8;
      v25 = v5;
      v12 = *(_QWORD *)v32;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v32 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          if (objc_msgSend(*(id *)(a1 + 40), "_momentNode:hasValidConstraintsForLocationOfInterestVisit:requiredCriteriaByPOIIdentifier:meaningfulEventProcessorCache:", v4, v14, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40), v24, v25))
          {
            v15 = objc_alloc_init(MEMORY[0x1E0D4B120]);
            objc_msgSend(v14, "locationOfInterest");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "setMuid:", objc_msgSend(v16, "businessItemMuid"));

            v17 = -[PGGraphIngestBusinessItemContainer initWithBusinessItem:visit:]([PGGraphIngestBusinessItemContainer alloc], "initWithBusinessItem:visit:", v15, v14);
            (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();

          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v31, v36, 16);
      }
      while (v11);
      v8 = v24;
      v5 = v25;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "_businessItemContainersToEnrichForLowConfidenceDisambiguation:requiredCriteriaByPOIIdentifier:meaningfulEventProcessorCache:", v4, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v18 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v28;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v28 != v20)
            objc_enumerationMutation(v9);
          (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
        }
        v19 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
      }
      while (v19);
    }
  }

  if (*(_QWORD *)(a1 + 64)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v23 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8),
        Current - *(double *)(v23 + 24) >= *(double *)(a1 + 104))
    && (*(double *)(v23 + 24) = Current,
        (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(double *)(a1 + 112)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 24);
  }

  objc_autoreleasePoolPop(v5);
}

void __172__PGGraphIngestBusinessProcessor__insertBusinessItemsFromMomentNodes_graph_withLocationOfInterestVisitsToResolveByMomentUUID_requiredCriteriaByPOIIdentifier_progressBlock___block_invoke_3(uint64_t a1, _BYTE *a2, double a3)
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

void __112__PGGraphIngestBusinessProcessor__insertBusinessItemsForMomentNodesToResolvedBusinessItems_graph_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(a1 + 64) * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __112__PGGraphIngestBusinessProcessor__insertBusinessItemsForMomentNodesToResolvedBusinessItems_graph_progressBlock___block_invoke_215(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  double Current;
  uint64_t v20;
  _BYTE *v21;
  id v22;
  id obj;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  void *v29;
  id v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v21 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "objectForKeyedSubscript:", a2);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if (v26)
  {
    v34 = 0u;
    v35 = 0u;
    v32 = 0u;
    v33 = 0u;
    v22 = v6;
    obj = v6;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    if (v7)
    {
      v8 = v7;
      v25 = *(_QWORD *)v33;
      v24 = *MEMORY[0x1E0D4B0C0];
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v33 != v25)
            objc_enumerationMutation(obj);
          v10 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
          objc_msgSend(v10, "publicEventNode", v21);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(*(id *)(a1 + 32), "cachedPublicEventsForMuid:", objc_msgSend(v11, "muid"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "anyObject");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          v15 = v24;
          if (v13)
            v15 = objc_msgSend(v13, "businessItemMuid");
          objc_msgSend(v11, "collection");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "momentNodes");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v27[0] = MEMORY[0x1E0C809B0];
          v27[1] = 3221225472;
          v27[2] = __112__PGGraphIngestBusinessProcessor__insertBusinessItemsForMomentNodesToResolvedBusinessItems_graph_progressBlock___block_invoke_2;
          v27[3] = &unk_1E8429728;
          v27[4] = *(_QWORD *)(a1 + 40);
          v31 = v15;
          v28 = v26;
          v29 = v10;
          v30 = v11;
          v18 = v11;
          objc_msgSend(v17, "enumerateNodesUsingBlock:", v27);

        }
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
      }
      while (v8);
    }

    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                            + 24)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                            + 24);
    v6 = v22;
    if (*(_QWORD *)(a1 + 48))
    {
      Current = CFAbsoluteTimeGetCurrent();
      v20 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
      if (Current - *(double *)(v20 + 24) >= *(double *)(a1 + 96))
      {
        *(double *)(v20 + 24) = Current;
        (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                 + 24));
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                              + 24);
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
          *v21 = 1;
      }
    }
  }

}

void __112__PGGraphIngestBusinessProcessor__insertBusinessItemsForMomentNodesToResolvedBusinessItems_graph_progressBlock___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  id v5;
  PGGraphIngestBusinessItemContainer *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;

  v3 = *(void **)(a1 + 32);
  v4 = *(_QWORD *)(a1 + 64);
  v5 = a2;
  objc_msgSend(v3, "_predominantVisitForMomentNode:publicEventBusinessItemMuid:", v5, v4);
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v6 = -[PGGraphIngestBusinessItemContainer initWithBusinessItem:visit:]([PGGraphIngestBusinessItemContainer alloc], "initWithBusinessItem:visit:", *(_QWORD *)(a1 + 40), v13);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "consolidatedAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "startDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "endDate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v8, v9);
    v6 = -[PGGraphIngestBusinessItemContainer initWithBusinessItem:dateInterval:]([PGGraphIngestBusinessItemContainer alloc], "initWithBusinessItem:dateInterval:", *(_QWORD *)(a1 + 40), v10);

  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "insertBusiness:fromMomentNode:", v6, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (id)objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "connectPublicEventNode:withBusinessNode:", *(_QWORD *)(a1 + 56), v11);
}

+ (id)_spatialMapCategoriesByMeaningIdentifier
{
  if (_spatialMapCategoriesByMeaningIdentifier_onceToken != -1)
    dispatch_once(&_spatialMapCategoriesByMeaningIdentifier_onceToken, &__block_literal_global_15122);
  return (id)_spatialMapCategoriesByMeaningIdentifier_spatialMapCategoriesByMeaningIdentifier;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 6;
}

void __74__PGGraphIngestBusinessProcessor__spatialMapCategoriesByMeaningIdentifier__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];
  _QWORD v3[13];

  v3[12] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("Performance");
  v2[1] = CFSTR("Concert");
  v3[0] = &unk_1E84E97A8;
  v3[1] = &unk_1E84E97C0;
  v2[2] = CFSTR("SportEvent");
  v2[3] = CFSTR("Lunch");
  v3[2] = &unk_1E84E97D8;
  v3[3] = &unk_1E84E97F0;
  v2[4] = CFSTR("Dinner");
  v2[5] = CFSTR("Breakfast");
  v3[4] = &unk_1E84E9808;
  v3[5] = &unk_1E84E9820;
  v2[6] = CFSTR("NightOut");
  v2[7] = CFSTR("Entertainment");
  v3[6] = &unk_1E84E9838;
  v3[7] = &unk_1E84E9850;
  v2[8] = CFSTR("AmusementPark");
  v2[9] = CFSTR("Museum");
  v3[8] = &unk_1E84E9868;
  v3[9] = &unk_1E84E9880;
  v2[10] = CFSTR("Diving");
  v2[11] = CFSTR("Hiking");
  v3[10] = &unk_1E84E9898;
  v3[11] = &unk_1E84E98B0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, v2, 12);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_spatialMapCategoriesByMeaningIdentifier_spatialMapCategoriesByMeaningIdentifier;
  _spatialMapCategoriesByMeaningIdentifier_spatialMapCategoriesByMeaningIdentifier = v0;

}

@end
