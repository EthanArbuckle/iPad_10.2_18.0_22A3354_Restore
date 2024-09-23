@implementation PGGraphIngestPublicEventsProcessor

- (PGGraphIngestPublicEventsProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestPublicEventsProcessor *v6;
  PGGraphIngestPublicEventsProcessor *v7;
  PGPublicEventDisambiguator *v8;
  void *v9;
  uint64_t v10;
  PGPublicEventDisambiguator *disambiguator;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)PGGraphIngestPublicEventsProcessor;
  v6 = -[PGGraphIngestPublicEventsProcessor init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    v8 = [PGPublicEventDisambiguator alloc];
    objc_msgSend(v5, "sceneTaxonomy");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PGPublicEventDisambiguator initWithSceneTaxonomy:](v8, "initWithSceneTaxonomy:", v9);
    disambiguator = v7->_disambiguator;
    v7->_disambiguator = (PGPublicEventDisambiguator *)v10;

  }
  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v6;

  v3 = a3;
  if (+[PGUserDefaults isPublicEventsEnabled](PGUserDefaults, "isPublicEventsEnabled"))
  {
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
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void *v8;
  NSObject *v9;
  os_signpost_id_t v10;
  NSObject *v11;
  NSObject *v12;
  uint64_t v13;
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
  if (+[PGUserDefaults isPublicEventsEnabled](PGUserDefaults, "isPublicEventsEnabled"))
  {
    -[PGGraphBuilder graph](self->_graphBuilder, "graph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_signpost_id_generate(v9);
    v11 = v9;
    v12 = v11;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestPublicEventsProcessor", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v13 = mach_absolute_time();
    objc_msgSend(v6, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v8, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      -[PGGraphIngestPublicEventsProcessor deletePublicEventEdgesWithMomentNodes:inGraph:](self, "deletePublicEventEdgesWithMomentNodes:inGraph:", v14, v8);
      -[PGGraphIngestPublicEventsProcessor _insertPublicEventsFromMomentNodes:graphUpdate:progressBlock:](self, "_insertPublicEventsFromMomentNodes:graphUpdate:progressBlock:", v14, v6, v7);
    }
    -[PGGraphIngestPublicEventsProcessor deletePublicEventNodesWithNoInEdgesInGraph:](self, "deletePublicEventNodesWithNoInEdgesInGraph:", v8);
    -[PGGraphIngestPublicEventsProcessor deletePublicEventCategoryWithNoEdgesInGraph:](self, "deletePublicEventCategoryWithNoEdgesInGraph:", v8);
    -[PGGraphIngestPublicEventsProcessor deletePerformerNodeWithNoEdgesInGraph:](self, "deletePerformerNodeWithNoEdgesInGraph:", v8);
    v15 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v18 = v12;
    v19 = v18;
    if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestPublicEventsProcessor", ", buf, 2u);
    }

    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v22 = "PGGraphIngestPublicEventsProcessor";
      v23 = 2048;
      v24 = (float)((float)((float)((float)(v15 - v13) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

  }
}

- (void)deletePublicEventEdgesWithMomentNodes:(id)a3 inGraph:(id)a4
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
  objc_msgSend(v7, "publicEventNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphPublicEventEdgeCollection, "edgesFromNodes:toNodes:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "removeEdges:", v9);
  objc_msgSend(v6, "executeGraphChangeRequest:", v10);

}

- (void)deletePublicEventNodesWithNoInEdgesInGraph:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  int v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[PGGraphPublicEventNode filter](PGGraphPublicEventNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWhereNoInEdges:", 1);
  objc_msgSend(v4, "nodeIdentifiersMatchingFilter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      v9 = 134217984;
      v10 = objc_msgSend(v6, "count");
      _os_log_debug_impl(&dword_1CA237000, v8, OS_LOG_TYPE_DEBUG, "[PublicEvents] Deleted %lu public event nodes from the graph", (uint8_t *)&v9, 0xCu);
    }

    v8 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    -[NSObject removeNodesForIdentifiers:](v8, "removeNodesForIdentifiers:", v6);
    objc_msgSend(v4, "executeGraphChangeRequest:", v8);
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
  {
    v9 = 138412290;
    v10 = (uint64_t)v5;
    _os_log_fault_impl(&dword_1CA237000, v8, OS_LOG_TYPE_FAULT, "unexpected nil return from MAGraph nodeIdentifiersMatchingFilter:%@", (uint8_t *)&v9, 0xCu);
  }

}

- (void)deletePublicEventCategoryWithNoEdgesInGraph:(id)a3
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
  +[PGGraphNodeCollection nodesInGraph:](PGGraphPublicEventCategoryNodeCollection, "nodesInGraph:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "categories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphPublicEventCategoryNode filterWithCategories:](PGGraphPublicEventCategoryNode, "filterWithCategories:", v6);
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
    _os_log_debug_impl(&dword_1CA237000, v9, OS_LOG_TYPE_DEBUG, "[PublicEvents] Deleted %lu public event category nodes from the graph", (uint8_t *)&v11, 0xCu);
  }

  v10 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  objc_msgSend(v10, "removeNodesForIdentifiers:", v8);
  objc_msgSend(v4, "executeGraphChangeRequest:", v10);

}

- (void)deletePerformerNodeWithNoEdgesInGraph:(id)a3
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
  +[PGGraphPerformerNode filter](PGGraphPerformerNode, "filter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWhereNoInAndOutEdges:", 1);
  objc_msgSend(v4, "nodeIdentifiersMatchingFilter:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    v9 = 134217984;
    v10 = objc_msgSend(v6, "count");
    _os_log_debug_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEBUG, "[PublicEvents] Deleted %lu public event performer nodes from the graph", (uint8_t *)&v9, 0xCu);
  }

  v8 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  objc_msgSend(v8, "removeNodesForIdentifiers:", v6);
  objc_msgSend(v4, "executeGraphChangeRequest:", v8);

}

- (void)_insertPublicEventsFromMomentNodes:(id)a3 graphUpdate:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  _QWORD *v14;
  _QWORD v15[5];
  id v16;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x3032000000;
  v15[3] = __Block_byref_object_copy__35689;
  v15[4] = __Block_byref_object_dispose__35690;
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __99__PGGraphIngestPublicEventsProcessor__insertPublicEventsFromMomentNodes_graphUpdate_progressBlock___block_invoke;
  v12[3] = &unk_1E842DAC0;
  v14 = v15;
  v12[4] = self;
  v11 = v9;
  v13 = v11;
  -[PGGraphIngestPublicEventsProcessor _enumeratePublicEventsFromMomentNodes:progressBlock:usingBlock:](self, "_enumeratePublicEventsFromMomentNodes:progressBlock:usingBlock:", v8, v10, v12);

  _Block_object_dispose(v15, 8);
}

- (void)_enumeratePublicEventsFromMomentNodes:(id)a3 progressBlock:(id)a4 usingBlock:(id)a5
{
  id v8;
  void (**v9)(id, void *, _QWORD, void *);
  double v10;
  char v11;
  void *v12;
  PGGraphIngestPublicEventsProcessor *v13;
  uint64_t v14;
  PGPublicEventDisambiguator *disambiguator;
  uint64_t v16;
  id v17;
  id v18;
  void *v19;
  uint64_t v20;
  double Current;
  char v22;
  double v23;
  unint64_t v24;
  PGMeaningfulEventProcessorCache *v25;
  PGGraphMomentNodeCollection *v26;
  uint64_t v27;
  __int128 v28;
  double v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  id v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t i;
  double v45;
  char v46;
  int v47;
  double v48;
  char v49;
  __int128 v50;
  void *v51;
  void *v52;
  id v53;
  uint64_t v54;
  void *v55;
  id obj;
  uint64_t v57;
  id v58;
  void *context;
  uint64_t v60;
  id v61;
  id v62;
  void *v63;
  id v64;
  PGMeaningfulEventProcessorCache *v65;
  void *v66;
  PGGraphIngestPublicEventsProcessor *v67;
  uint64_t v68;
  uint64_t v69;
  void *v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  char v83;
  _QWORD v84[4];
  id v85;
  uint8_t *v86;
  uint64_t *v87;
  uint64_t *v88;
  uint64_t v89;
  _QWORD v90[4];
  id v91;
  uint8_t *v92;
  uint64_t *v93;
  uint64_t *v94;
  uint64_t v95;
  id v96;
  id v97;
  id v98;
  uint64_t v99;
  double *v100;
  uint64_t v101;
  uint64_t v102;
  uint64_t v103;
  uint64_t *v104;
  uint64_t v105;
  char v106;
  _BYTE v107[128];
  _BYTE v108[128];
  uint8_t v109[128];
  uint8_t v110[4];
  int v111;
  __int16 v112;
  const char *v113;
  uint8_t buf[8];
  __int128 v115;
  uint64_t v116;
  uint64_t v117;

  v117 = *MEMORY[0x1E0C80C00];
  v58 = a3;
  v8 = a4;
  v9 = (void (**)(id, void *, _QWORD, void *))a5;
  v55 = v8;
  v103 = 0;
  v104 = &v103;
  v105 = 0x2020000000;
  v106 = 0;
  v99 = 0;
  v100 = (double *)&v99;
  v101 = 0x2020000000;
  v102 = 0;
  v63 = _Block_copy(v8);
  if (!v63
    || (v10 = CFAbsoluteTimeGetCurrent(), v10 - v100[3] < 0.01)
    || (v100[3] = v10,
        v110[0] = 0,
        (*((void (**)(void *, uint8_t *, double))v63 + 2))(v63, v110, 0.0),
        v11 = *((_BYTE *)v104 + 24) | v110[0],
        (*((_BYTE *)v104 + 24) = v11) == 0))
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v115 = buf;
    *((_QWORD *)&v115 + 1) = 0x2020000000;
    v116 = 0;
    v67 = self;
    -[PGGraphBuilder graph](self->_graphBuilder, "graph");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "largeFrequentLocationNodes");
    v13 = self;
    v14 = objc_claimAutoreleasedReturnValue();
    disambiguator = self->_disambiguator;
    v98 = 0;
    v97 = 0;
    v96 = 0;
    v16 = MEMORY[0x1E0C809B0];
    v90[0] = MEMORY[0x1E0C809B0];
    v90[1] = 3221225472;
    v90[2] = __101__PGGraphIngestPublicEventsProcessor__enumeratePublicEventsFromMomentNodes_progressBlock_usingBlock___block_invoke;
    v90[3] = &unk_1E842F560;
    v92 = buf;
    v17 = v63;
    v91 = v17;
    v93 = &v99;
    v94 = &v103;
    v95 = 0x3F847AE147AE147BLL;
    -[PGPublicEventDisambiguator collectConsolidatedAddressesForMomentNodes:largeFrequentLocationNodes:consolidatedAddresses:consolidatedAddressesByMomentIdentifier:momentNodesForConsolidatedAddresses:progressBlock:](disambiguator, "collectConsolidatedAddressesForMomentNodes:largeFrequentLocationNodes:consolidatedAddresses:consolidatedAddressesByMomentIdentifier:momentNodesForConsolidatedAddresses:progressBlock:", v58, v14, &v98, &v97, &v96, v90);
    v52 = (void *)v14;
    v18 = v98;
    v61 = v97;
    v62 = v96;
    -[PGGraphBuilder publicEventManager](v13->_graphBuilder, "publicEventManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v84[0] = v16;
    v84[1] = 3221225472;
    v84[2] = __101__PGGraphIngestPublicEventsProcessor__enumeratePublicEventsFromMomentNodes_progressBlock_usingBlock___block_invoke_2;
    v84[3] = &unk_1E842F560;
    v86 = buf;
    v53 = v17;
    v85 = v53;
    v87 = &v99;
    v88 = &v103;
    v89 = 0x3F847AE147AE147BLL;
    objc_msgSend(v19, "publicEventsByTimeLocationTupleIdentifierForTimeLocationTuples:progressBlock:", v18, v84);
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    v51 = v18;

    v20 = v115;
    *(_QWORD *)(v115 + 24) = 0x3FE3333333333333;
    if (v63)
    {
      Current = CFAbsoluteTimeGetCurrent();
      v20 = v115;
      if (Current - v100[3] >= 0.01)
      {
        v100[3] = Current;
        v83 = 0;
        (*((void (**)(id, char *, double))v53 + 2))(v53, &v83, *(double *)(v20 + 24));
        v22 = *((_BYTE *)v104 + 24) | v83;
        *((_BYTE *)v104 + 24) = v22;
        if (v22)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v110 = 67109378;
            v111 = 203;
            v112 = 2080;
            v113 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/Ingest Processing/PGGraphIngestPublicEventsProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v110, 0x12u);
          }
LABEL_50:

          _Block_object_dispose(buf, 8);
          goto LABEL_51;
        }
        v20 = v115;
      }
    }
    v23 = *(double *)(v20 + 24);
    v24 = objc_msgSend(v62, "count");
    -[PGGraphBuilder serviceManager](v67->_graphBuilder, "serviceManager");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = [PGMeaningfulEventProcessorCache alloc];
    v26 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v62, v12);
    v65 = -[PGMeaningfulEventProcessorCache initWithMomentNodes:](v25, "initWithMomentNodes:", v26);

    v81 = 0u;
    v82 = 0u;
    v79 = 0u;
    v80 = 0u;
    obj = v62;
    v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v109, 16);
    if (v27)
    {
      v29 = (0.9 - v23) / (double)v24;
      v57 = *(_QWORD *)v80;
      *(_QWORD *)&v28 = 67109378;
      v50 = v28;
      while (2)
      {
        v30 = 0;
        v54 = v27;
        do
        {
          if (*(_QWORD *)v80 != v57)
            objc_enumerationMutation(obj);
          v60 = v30;
          v31 = *(void **)(*((_QWORD *)&v79 + 1) + 8 * v30);
          context = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v31, "identifier"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v61, "objectForKeyedSubscript:", v32);
          v33 = (void *)objc_claimAutoreleasedReturnValue();

          v77 = 0u;
          v78 = 0u;
          v75 = 0u;
          v76 = 0u;
          v64 = v33;
          v34 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v75, v108, 16);
          if (v34)
          {
            v69 = *(_QWORD *)v76;
            do
            {
              v35 = 0;
              v68 = v34;
              do
              {
                if (*(_QWORD *)v76 != v69)
                  objc_enumerationMutation(v64);
                v36 = *(void **)(*((_QWORD *)&v75 + 1) + 8 * v35);
                objc_msgSend(v36, "timeLocationIdentifier", v50, v51, v52);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v70, "objectForKeyedSubscript:", v37);
                v38 = (void *)objc_claimAutoreleasedReturnValue();

                if (objc_msgSend(v38, "count"))
                {
                  -[PGPublicEventDisambiguator disambiguateEvents:forTimeLocationTuple:momentNode:graph:meaningfulEventProcessorCache:serviceManager:](v67->_disambiguator, "disambiguateEvents:forTimeLocationTuple:momentNode:graph:meaningfulEventProcessorCache:serviceManager:", v38, v36, v31, v12, v65, v66);
                  v39 = (void *)objc_claimAutoreleasedReturnValue();
                  v73 = 0u;
                  v74 = 0u;
                  v71 = 0u;
                  v72 = 0u;
                  v40 = v39;
                  v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v71, v107, 16);
                  v42 = v12;
                  if (v41)
                  {
                    v43 = *(_QWORD *)v72;
                    do
                    {
                      for (i = 0; i != v41; ++i)
                      {
                        if (*(_QWORD *)v72 != v43)
                          objc_enumerationMutation(v40);
                        v9[2](v9, v31, *(_QWORD *)(*((_QWORD *)&v71 + 1) + 8 * i), v36);
                      }
                      v41 = objc_msgSend(v40, "countByEnumeratingWithState:objects:count:", &v71, v107, 16);
                    }
                    while (v41);
                  }

                  v34 = v68;
                  v12 = v42;

                }
                ++v35;
              }
              while (v35 != v34);
              v34 = objc_msgSend(v64, "countByEnumeratingWithState:objects:count:", &v75, v108, 16);
            }
            while (v34);
          }

          *(double *)(v115 + 24) = v29 + *(double *)(v115 + 24);
          if (v63
            && (v45 = CFAbsoluteTimeGetCurrent(), v45 - v100[3] >= 0.01)
            && (v100[3] = v45,
                v83 = 0,
                (*((void (**)(id, char *, double))v53 + 2))(v53, &v83, *(double *)(v115 + 24)),
                v46 = *((_BYTE *)v104 + 24) | v83,
                (*((_BYTE *)v104 + 24) = v46) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v110 = v50;
              v111 = 230;
              v112 = 2080;
              v113 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/G"
                     "raph/Ingest/Ingest Processing/PGGraphIngestPublicEventsProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v110, 0x12u);
            }
            v47 = 0;
          }
          else
          {
            v47 = 1;
          }

          objc_autoreleasePoolPop(context);
          if (!v47)
          {

            goto LABEL_49;
          }
          v30 = v60 + 1;
        }
        while (v60 + 1 != v54);
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v79, v109, 16);
        if (v27)
          continue;
        break;
      }
    }

    if (v63)
    {
      v48 = CFAbsoluteTimeGetCurrent();
      if (v48 - v100[3] >= 0.01)
      {
        v100[3] = v48;
        v83 = 0;
        (*((void (**)(id, char *, double))v53 + 2))(v53, &v83, 1.0);
        v49 = *((_BYTE *)v104 + 24) | v83;
        *((_BYTE *)v104 + 24) = v49;
        if (v49)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v110 = 67109378;
            v111 = 233;
            v112 = 2080;
            v113 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Gra"
                   "ph/Ingest/Ingest Processing/PGGraphIngestPublicEventsProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v110, 0x12u);
          }
        }
      }
    }
LABEL_49:

    goto LABEL_50;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 169;
    LOWORD(v115) = 2080;
    *(_QWORD *)((char *)&v115 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPublicEventsProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_51:
  _Block_object_dispose(&v99, 8);
  _Block_object_dispose(&v103, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_disambiguator, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __101__PGGraphIngestPublicEventsProcessor__enumeratePublicEventsFromMomentNodes_progressBlock_usingBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v6;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 * 0.1;
  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                               + 24));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __101__PGGraphIngestPublicEventsProcessor__enumeratePublicEventsFromMomentNodes_progressBlock_usingBlock___block_invoke_2(uint64_t a1, _BYTE *a2, double a3)
{
  double Current;
  uint64_t v6;

  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = a3 * 0.5 + 0.1;
  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (Current - *(double *)(v6 + 24) >= *(double *)(a1 + 64))
    {
      *(double *)(v6 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                               + 24));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __99__PGGraphIngestPublicEventsProcessor__insertPublicEventsFromMomentNodes_graphUpdate_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a2;
  v7 = a3;
  v8 = a4;
  v9 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v16, "UUID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
    objc_msgSend(v16, "UUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v13);

  }
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", objc_msgSend(v7, "muid"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    || (objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "insertPublicEvent:fromEventNode:", v7, v16),
        v15 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v11, "setObject:forKeyedSubscript:", v15, v14),
        v15))
  {
    objc_msgSend(*(id *)(a1 + 40), "registerPublicEventNode:withConsolidatedAddress:toResolveBusinessItemMuid:", v15, v8, objc_msgSend(v7, "businessItemMuid"));

  }
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 6;
}

@end
