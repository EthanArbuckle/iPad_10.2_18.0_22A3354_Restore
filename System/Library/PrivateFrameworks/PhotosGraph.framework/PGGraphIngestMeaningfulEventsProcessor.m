@implementation PGGraphIngestMeaningfulEventsProcessor

- (PGGraphIngestMeaningfulEventsProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestMeaningfulEventsProcessor *v6;
  PGGraphIngestMeaningfulEventsProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestMeaningfulEventsProcessor;
  v6 = -[PGGraphIngestMeaningfulEventsProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3;
  char v4;

  v3 = a3;
  if ((objc_msgSend(v3, "isResumingFullAnalysis") & 1) != 0 || (objc_msgSend(v3, "hasMomentsToInsert") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasMomentsToUpdate");

  return v4;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  PGGraphBuilder *graphBuilder;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a4;
  graphBuilder = self->_graphBuilder;
  v7 = a3;
  -[PGGraphBuilder graph](graphBuilder, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v8, 31, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "count"))
    -[PGGraphIngestMeaningfulEventsProcessor processMeaningfulEventsWithMomentNodes:graph:progressBlock:](self, "processMeaningfulEventsWithMomentNodes:graph:progressBlock:", v9, v8, v10);

}

- (void)processMeaningfulEventsWithMomentNodes:(id)a3 graph:(id)a4 progressBlock:(id)a5
{
  PGGraphBuilder *graphBuilder;
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  unint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  mach_timebase_info v22;
  NSObject *v23;
  NSObject *v24;
  os_signpost_id_t spid;
  uint64_t v26;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v29;
  __int16 v30;
  double v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  graphBuilder = self->_graphBuilder;
  v9 = a5;
  v10 = a4;
  v11 = a3;
  -[PGGraphBuilder loggingConnection](graphBuilder, "loggingConnection");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = os_signpost_id_generate(v12);
  v14 = v12;
  v15 = v14;
  v16 = v13 - 1;
  if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGGraphIngestMeaningfulEventsProcessor", ", buf, 2u);
  }
  spid = v13;

  info = 0;
  mach_timebase_info(&info);
  v26 = mach_absolute_time();
  +[PGMeaningfulEventRequiredCriteriaFactory availableMeaningLabels](PGMeaningfulEventRequiredCriteriaFactory, "availableMeaningLabels");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:", v17);
  -[PGGraphBuilder sceneTaxonomy](self->_graphBuilder, "sceneTaxonomy");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMeaningfulEventRequiredCriteriaFactory requiredCriteriaForIdentifiers:inferenceType:graph:sceneTaxonomy:](PGMeaningfulEventRequiredCriteriaFactory, "requiredCriteriaForIdentifiers:inferenceType:graph:sceneTaxonomy:", v18, 0, v10, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphIngestMeaningfulEventsProcessor processMeaningfulEventsWithMomentNodes:graph:requiredMeaningfulEventCriteriaByIdentifier:progressBlock:](self, "processMeaningfulEventsWithMomentNodes:graph:requiredMeaningfulEventCriteriaByIdentifier:progressBlock:", v11, v10, v20, v9);

  v21 = mach_absolute_time();
  v22 = info;
  v23 = v15;
  v24 = v23;
  if (v16 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v23))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v24, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestMeaningfulEventsProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v29 = "PGGraphIngestMeaningfulEventsProcessor";
    v30 = 2048;
    v31 = (float)((float)((float)((float)(v21 - v26) * (float)v22.numer) / (float)v22.denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v24, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)processMeaningfulEventsWithMomentNodes:(id)a3 graph:(id)a4 requiredMeaningfulEventCriteriaByIdentifier:(id)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  char v16;
  PGGraphIngestMeaningfulEventsProcessor *v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  double Current;
  char v25;
  void *v26;
  char v27;
  _QWORD v28[5];
  id v29;
  id v30;
  id v31;
  id v32;
  _QWORD *v33;
  uint64_t *p_buf;
  _QWORD *v35;
  uint64_t *v36;
  uint64_t *v37;
  uint64_t v38;
  _QWORD v39[5];
  PGMeaningfulEventProcessorCache *v40;
  _QWORD v41[4];
  uint64_t v42;
  double *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t *v47;
  uint64_t v48;
  char v49;
  _DWORD v50[2];
  __int16 v51;
  const char *v52;
  uint64_t buf;
  __int128 v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;

  v58 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v14 = _Block_copy(v13);
  v46 = 0;
  v47 = &v46;
  v48 = 0x2020000000;
  v49 = 0;
  v42 = 0;
  v43 = (double *)&v42;
  v44 = 0x2020000000;
  v45 = 0;
  if (v14
    && (v15 = CFAbsoluteTimeGetCurrent(), v15 - v43[3] >= 0.01)
    && (v43[3] = v15,
        LOBYTE(v39[0]) = 0,
        (*((void (**)(void *, _QWORD *, double))v14 + 2))(v14, v39, 0.0),
        v16 = *((_BYTE *)v47 + 24) | LOBYTE(v39[0]),
        (*((_BYTE *)v47 + 24) = v16) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 0x5304000202;
      LOWORD(v54) = 2080;
      *(_QWORD *)((char *)&v54 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestMeaningfulEventsProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    v26 = v14;
    v17 = self;
    v18 = v10;
    v19 = v13;
    v20 = v11;
    buf = 0;
    *(_QWORD *)&v54 = &buf;
    *((_QWORD *)&v54 + 1) = 0x3032000000;
    v55 = __Block_byref_object_copy__44400;
    v56 = __Block_byref_object_dispose__44401;
    v21 = objc_alloc(MEMORY[0x1E0C99E60]);
    objc_msgSend(v12, "allKeys");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = (id)objc_msgSend(v21, "initWithArray:", v22);

    v11 = v20;
    v13 = v19;
    v10 = v18;
    v41[0] = 0;
    v41[1] = v41;
    v41[2] = 0x2020000000;
    v41[3] = 0;
    v39[0] = 0;
    v39[1] = v39;
    v39[2] = 0x3032000000;
    v39[3] = __Block_byref_object_copy__44400;
    v39[4] = __Block_byref_object_dispose__44401;
    v40 = -[PGMeaningfulEventProcessorCache initWithMomentNodes:]([PGMeaningfulEventProcessorCache alloc], "initWithMomentNodes:", v18);
    v28[0] = MEMORY[0x1E0C809B0];
    v28[1] = 3221225472;
    v28[2] = __145__PGGraphIngestMeaningfulEventsProcessor_processMeaningfulEventsWithMomentNodes_graph_requiredMeaningfulEventCriteriaByIdentifier_progressBlock___block_invoke;
    v28[3] = &unk_1E842EFA8;
    v28[4] = v17;
    v29 = v12;
    v33 = v39;
    v30 = v11;
    p_buf = &buf;
    v35 = v41;
    v31 = v18;
    v23 = v26;
    v32 = v23;
    v36 = &v42;
    v37 = &v46;
    v38 = 0x3F847AE147AE147BLL;
    objc_msgSend(v31, "enumerateNodesUsingBlock:", v28);
    if (v26)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v43[3] >= 0.01)
      {
        v43[3] = Current;
        v27 = 0;
        (*((void (**)(id, char *, double))v23 + 2))(v23, &v27, 1.0);
        v25 = *((_BYTE *)v47 + 24) | v27;
        *((_BYTE *)v47 + 24) = v25;
        if (v25)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v50[0] = 67109378;
            v50[1] = 105;
            v51 = 2080;
            v52 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Ingest/Ingest Processing/PGGraphIngestMeaningfulEventsProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v50, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(v39, 8);
    _Block_object_dispose(v41, 8);
    _Block_object_dispose(&buf, 8);

    v14 = v26;
  }
  _Block_object_dispose(&v42, 8);
  _Block_object_dispose(&v46, 8);

}

- (id)meaningfulEventMatchingResultsForMomentNode:(id)a3 withRequiredMeaningfulEventCriteriaByIdentifier:(id)a4 andMeaningfulEventProcessorCache:(id)a5
{
  PGGraphBuilder *graphBuilder;
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;

  graphBuilder = self->_graphBuilder;
  v8 = a5;
  v9 = a4;
  v10 = a3;
  -[PGGraphBuilder serviceManager](graphBuilder, "serviceManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGMeaningfulEventProcessor processRequiredCriteria:forMoment:meaningfulEventProcessorCache:serviceManager:](PGMeaningfulEventProcessor, "processRequiredCriteria:forMoment:meaningfulEventProcessorCache:serviceManager:", v9, v10, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (void)updateMeaningsOfMomentNode:(id)a3 graph:(id)a4 affectedMeaningLabels:(id)a5 withMatchedResults:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v24 = a4;
  v23 = a5;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v26 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        objc_msgSend(v18, "requiredCriteria", v23);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "meaningNodeLabel");
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        -[PGGraphBuilder addMeaningToMeaningfulEventNode:meaningLabel:meaningIsReliable:](self->_graphBuilder, "addMeaningToMeaningfulEventNode:meaningLabel:meaningIsReliable:", v10, v20, objc_msgSend(v18, "isReliable"));
        objc_msgSend(v12, "addObject:", v20);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
    }
    while (v15);
  }

  -[PGGraphIngestMeaningfulEventsProcessor _removeInvalidMeaningEdgesWithDomain:momentNode:validMeaningLabels:legacyMeaningLabels:](self, "_removeInvalidMeaningEdgesWithDomain:momentNode:validMeaningLabels:legacyMeaningLabels:", 700, v10, v12, v23);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphIngestMeaningfulEventsProcessor _removeInvalidMeaningEdgesWithDomain:momentNode:validMeaningLabels:legacyMeaningLabels:](self, "_removeInvalidMeaningEdgesWithDomain:momentNode:validMeaningLabels:legacyMeaningLabels:", 702, v10, v12, v23);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unionSet:", v22);
  objc_msgSend(v24, "legacyRemoveEdges:", v21);

}

- (void)_updateMeaningsOfMomentNode:(id)a3 graph:(id)a4 withValidMeaningLabels:(id)a5 legacyLabels:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v23;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v23 != v16)
          objc_enumerationMutation(v12);
        -[PGGraphBuilder addMeaningToMeaningfulEventNode:meaningLabel:meaningIsReliable:](self->_graphBuilder, "addMeaningToMeaningfulEventNode:meaningLabel:meaningIsReliable:", v10, *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v17++), 1);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v15);
  }
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphIngestMeaningfulEventsProcessor _removeInvalidMeaningEdgesWithDomain:momentNode:validMeaningLabels:legacyMeaningLabels:](self, "_removeInvalidMeaningEdgesWithDomain:momentNode:validMeaningLabels:legacyMeaningLabels:", 700, v10, v18, v13);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v12);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphIngestMeaningfulEventsProcessor _removeInvalidMeaningEdgesWithDomain:momentNode:validMeaningLabels:legacyMeaningLabels:](self, "_removeInvalidMeaningEdgesWithDomain:momentNode:validMeaningLabels:legacyMeaningLabels:", 702, v10, v20, v13);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "unionSet:", v21);
  objc_msgSend(v11, "legacyRemoveEdges:", v19);

}

- (id)_removeInvalidMeaningEdgesWithDomain:(unsigned __int16)a3 momentNode:(id)a4 validMeaningLabels:(id)a5 legacyMeaningLabels:(id)a6
{
  uint64_t v8;
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v20[4];
  id v21;
  id v22;
  id v23;

  v8 = a3;
  v9 = a5;
  v10 = a6;
  v11 = (objc_class *)MEMORY[0x1E0C99E20];
  v12 = a4;
  v13 = objc_alloc_init(v11);
  v20[0] = MEMORY[0x1E0C809B0];
  v20[1] = 3221225472;
  v20[2] = __129__PGGraphIngestMeaningfulEventsProcessor__removeInvalidMeaningEdgesWithDomain_momentNode_validMeaningLabels_legacyMeaningLabels___block_invoke;
  v20[3] = &unk_1E842EFD0;
  v21 = v9;
  v22 = v10;
  v14 = v13;
  v23 = v14;
  v15 = v10;
  v16 = v9;
  objc_msgSend(v12, "enumerateMeaningEdgesAndNodesWithDomain:block:", v8, v20);

  v17 = v23;
  v18 = v14;

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __129__PGGraphIngestMeaningfulEventsProcessor__removeInvalidMeaningEdgesWithDomain_momentNode_validMeaningLabels_legacyMeaningLabels___block_invoke(id *a1, void *a2, void *a3)
{
  void *v5;
  id v6;

  v6 = a2;
  objc_msgSend(a3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1[4], "containsObject:", v5) & 1) == 0 && objc_msgSend(a1[5], "containsObject:", v5))
    objc_msgSend(a1[6], "addObject:", v6);

}

void __145__PGGraphIngestMeaningfulEventsProcessor_processMeaningfulEventsWithMomentNodes_graph_requiredMeaningfulEventCriteriaByIdentifier_progressBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  void *v7;
  unint64_t v8;
  uint64_t v9;
  unint64_t v10;
  double Current;
  uint64_t v12;

  v5 = a2;
  v6 = (void *)MEMORY[0x1CAA4EB2C]();
  objc_msgSend(*(id *)(a1 + 32), "meaningfulEventMatchingResultsForMomentNode:withRequiredMeaningfulEventCriteriaByIdentifier:andMeaningfulEventProcessorCache:", v5, *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 40));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "updateMeaningsOfMomentNode:graph:affectedMeaningLabels:withMatchedResults:", v5, *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 40), v7);
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "upsertPeopleEventEdgesOfMomentNode:matchingResults:", v5, v7);
  v8 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  v9 = objc_msgSend(*(id *)(a1 + 56), "count");
  if (*(_QWORD *)(a1 + 64)
    && (v10 = v9,
        Current = CFAbsoluteTimeGetCurrent(),
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8),
        Current - *(double *)(v12 + 24) >= *(double *)(a1 + 112))
    && (*(double *)(v12 + 24) = Current,
        (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))((double)v8 / (double)v10),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8)
                                                                                + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24);
  }

  objc_autoreleasePoolPop(v6);
}

@end
