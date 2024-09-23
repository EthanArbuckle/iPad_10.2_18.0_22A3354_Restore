@implementation PGGraphIngestTripProcessor

- (PGGraphIngestTripProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestTripProcessor *v6;
  PGGraphIngestTripProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestTripProcessor;
  v6 = -[PGGraphIngestTripProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (id)allTripNodes
{
  PGGraphHighlightGroupNodeCollection *allTripNodes;
  void *v4;
  void *v5;
  PGGraphHighlightGroupNodeCollection *v6;
  PGGraphHighlightGroupNodeCollection *v7;

  allTripNodes = self->_allTripNodes;
  if (!allTripNodes)
  {
    -[PGGraphBuilder graph](self->_graphBuilder, "graph");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphHighlightTypeNodeCollection tripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "tripTypeNodesInGraph:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "highlightGroupNodes");
    v6 = (PGGraphHighlightGroupNodeCollection *)objc_claimAutoreleasedReturnValue();
    v7 = self->_allTripNodes;
    self->_allTripNodes = v6;

    allTripNodes = self->_allTripNodes;
  }
  return allTripNodes;
}

- (id)featuredLocationNodesByHighlightGroupNode
{
  MABinaryAdjacency *featuredLocationNodesByHighlightGroupNode;
  void *v4;
  void *v5;
  void *v6;
  MABinaryAdjacency *v7;
  MABinaryAdjacency *v8;

  featuredLocationNodesByHighlightGroupNode = self->_featuredLocationNodesByHighlightGroupNode;
  if (!featuredLocationNodesByHighlightGroupNode)
  {
    v4 = (void *)MEMORY[0x1E0D429D8];
    -[PGGraphIngestTripProcessor allTripNodes](self, "allTripNodes");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphHighlightGroupNodeCollection locationFeatureOfHighlightGroup](PGGraphHighlightGroupNodeCollection, "locationFeatureOfHighlightGroup");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "adjacencyWithSources:relation:targetsClass:", v5, v6, objc_opt_class());
    v7 = (MABinaryAdjacency *)objc_claimAutoreleasedReturnValue();
    v8 = self->_featuredLocationNodesByHighlightGroupNode;
    self->_featuredLocationNodesByHighlightGroupNode = v7;

    featuredLocationNodesByHighlightGroupNode = self->_featuredLocationNodesByHighlightGroupNode;
  }
  return featuredLocationNodesByHighlightGroupNode;
}

- (id)tripsMissingFeaturedLocations
{
  PGGraphHighlightGroupNodeCollection *tripsMissingFeaturedLocations;
  void *v4;
  void *v5;
  void *v6;
  PGGraphHighlightGroupNodeCollection *v7;
  PGGraphHighlightGroupNodeCollection *v8;

  tripsMissingFeaturedLocations = self->_tripsMissingFeaturedLocations;
  if (!tripsMissingFeaturedLocations)
  {
    -[PGGraphIngestTripProcessor allTripNodes](self, "allTripNodes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphIngestTripProcessor featuredLocationNodesByHighlightGroupNode](self, "featuredLocationNodesByHighlightGroupNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "sources");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "collectionBySubtracting:", v6);
    v7 = (PGGraphHighlightGroupNodeCollection *)objc_claimAutoreleasedReturnValue();
    v8 = self->_tripsMissingFeaturedLocations;
    self->_tripsMissingFeaturedLocations = v7;

    tripsMissingFeaturedLocations = self->_tripsMissingFeaturedLocations;
  }
  return tripsMissingFeaturedLocations;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v4;
  void *v5;
  char v6;
  BOOL v7;
  char v8;
  uint64_t v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isResumingFullAnalysis") & 1) != 0
    || (-[PGGraphIngestTripProcessor tripsMissingFeaturedLocations](self, "tripsMissingFeaturedLocations"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v6 = objc_msgSend(v5, "isEmpty"),
        v5,
        (objc_msgSend(v4, "hasMomentsToInsert") & 1) != 0))
  {
    v7 = 1;
  }
  else
  {
    v8 = v6 ^ 1;
    v9 = objc_msgSend(v4, "momentUpdateTypes");
    if ((objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes") & v9) != 0)
      v7 = 1;
    else
      v7 = v8;
  }

  return v7;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  uint64_t v21;
  uint32_t denom;
  uint32_t numer;
  NSObject *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint32_t v30;
  uint32_t v31;
  NSObject *v32;
  NSObject *v33;
  unint64_t v34;
  NSObject *v35;
  os_signpost_id_t spida;
  os_signpost_id_t spid;
  uint64_t v38;
  id v39;
  void *v40;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v39 = a4;
  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PGGraphIngestTripProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v38 = mach_absolute_time();
  v12 = objc_msgSend(v6, "isResumingFullAnalysis");
  if ((_DWORD)v12)
  {
    -[PGGraphIngestTripProcessor allTripNodes](self, "allTripNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v40, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphIngestTripProcessor tripsMissingFeaturedLocations](self, "tripsMissingFeaturedLocations");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      objc_msgSend(v14, "highlightNodes");
      v35 = v10;
      v15 = v13;
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "highlightGroupNodes");
      v34 = v8 - 1;
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGGraphIngestTripProcessor allTripNodes](self, "allTripNodes");
      v18 = v6;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "collectionByIntersecting:", v19);
      spida = v8;
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v18;
      objc_msgSend(v15, "collectionByFormingUnionWith:", v20);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = v35;
      v8 = spida;
      v11 = v34;
    }

  }
  if (objc_msgSend(v13, "isEmpty"))
  {
    v21 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v24 = v10;
    v25 = v24;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v25, OS_SIGNPOST_INTERVAL_END, v8, "PGGraphIngestTripProcessor", ", buf, 2u);
    }

    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "PGGraphIngestTripProcessor";
      v44 = 2048;
      v45 = (float)((float)((float)((float)(v21 - v38) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }
  else
  {
    spid = v8;
    v26 = (void *)MEMORY[0x1E0D429D8];
    +[PGGraphHighlightGroupNode momentInHighlight](PGGraphHighlightGroupNode, "momentInHighlight");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "adjacencyWithSources:relation:targetsClass:", v13, v27, objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGGraphIngestTripProcessor ingestLocationFeaturesForTripNodes:graph:loggingConnection:progressBlock:isResumingFullAnalysis:](self, "ingestLocationFeaturesForTripNodes:graph:loggingConnection:progressBlock:isResumingFullAnalysis:", v28, v40, v10, v39, v12);
    v29 = mach_absolute_time();
    v31 = info.numer;
    v30 = info.denom;
    v32 = v10;
    v33 = v32;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v32))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v33, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestTripProcessor", ", buf, 2u);
    }

    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v43 = "PGGraphIngestTripProcessor";
      v44 = 2048;
      v45 = (float)((float)((float)((float)(v29 - v38) * (float)v31) / (float)v30) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

  }
}

- (void)ingestLocationFeaturesForTripNodes:(id)a3 graph:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6 isResumingFullAnalysis:(BOOL)a7
{
  id v12;
  id v13;
  NSObject *v14;
  id v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  unint64_t v21;
  PGGraphLocationHelper *v22;
  id v23;
  id v24;
  PGGraphLocationHelper *v25;
  id v26;
  NSObject *v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  void (*v31)(uint64_t, void *, void *, _BYTE *);
  void *v32;
  id v33;
  id v34;
  PGGraphLocationHelper *v35;
  NSObject *v36;
  id v37;
  PGGraphIngestTripProcessor *v38;
  uint8_t *v39;
  uint64_t *v40;
  double v41;
  BOOL v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  char v46;
  uint8_t buf[8];
  uint8_t *v48;
  uint64_t v49;
  uint64_t v50;
  uint8_t v51[4];
  int v52;
  __int16 v53;
  const char *v54;
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  objc_msgSend(v12, "targets");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "count");

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0D42A58], "progressReporterWithProgressBlock:", v15);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A60]), "initWithProgressReporter:", v18);
    *(_QWORD *)buf = 0;
    v48 = buf;
    v49 = 0x2020000000;
    v50 = 0;
    objc_msgSend(v12, "targets");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count");

    v22 = -[PGGraphLocationHelper initWithGraph:]([PGGraphLocationHelper alloc], "initWithGraph:", v13);
    v23 = v18;
    v43 = 0;
    v44 = &v43;
    v45 = 0x2020000000;
    v46 = 0;
    v29 = MEMORY[0x1E0C809B0];
    v30 = 3221225472;
    v31 = __126__PGGraphIngestTripProcessor_ingestLocationFeaturesForTripNodes_graph_loggingConnection_progressBlock_isResumingFullAnalysis___block_invoke;
    v32 = &unk_1E84341B0;
    v24 = v19;
    v33 = v24;
    v39 = buf;
    v41 = 1.0 / (double)v21;
    v34 = v13;
    v25 = v22;
    v35 = v25;
    v36 = v14;
    v40 = &v43;
    v26 = v23;
    v42 = a7;
    v37 = v26;
    v38 = self;
    objc_msgSend(v12, "enumerateTargetsBySourceWithBlock:", &v29);
    if (*((_BYTE *)v44 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_11:

        _Block_object_dispose(&v43, 8);
        _Block_object_dispose(buf, 8);

        goto LABEL_12;
      }
      *(_DWORD *)v51 = 67109378;
      v52 = 175;
      v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGGraphIngestTripProcessor.m";
      v27 = MEMORY[0x1E0C81028];
    }
    else
    {
      v28 = objc_msgSend(v26, "isCancelledWithProgress:", 1.0, v29, v30, v31, v32, v33, v34, v35, v36);
      *((_BYTE *)v44 + 24) = v28;
      if (!v28 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_11;
      *(_DWORD *)v51 = 67109378;
      v52 = 176;
      v53 = 2080;
      v54 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Inge"
            "st/Ingest Processing/PGGraphIngestTripProcessor.m";
      v27 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v51, 0x12u);
    goto LABEL_11;
  }
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[PGGraphIngestTripProcessor] No highlight to be ingest.", buf, 2u);
  }
LABEL_12:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tripsMissingFeaturedLocations, 0);
  objc_storeStrong((id *)&self->_featuredLocationNodesByHighlightGroupNode, 0);
  objc_storeStrong((id *)&self->_allTripNodes, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __126__PGGraphIngestTripProcessor_ingestLocationFeaturesForTripNodes_graph_loggingConnection_progressBlock_isResumingFullAnalysis___block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  void *v8;
  double v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  PGTripFeatureProcessor *v14;
  uint64_t v15;
  uint64_t v16;
  PGTripFeatureProcessor *v17;
  id v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  char v23;
  NSObject *v24;
  uint64_t v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  uint64_t v29;
  NSObject *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  void *v39;
  NSObject *v40;
  NSObject *v41;
  uint64_t v42;
  void *v43;
  uint64_t v44;
  char v45;
  void *v46;
  void *v47;
  PGGraphFeatureNodeCollection *v48;
  id v49;
  _BYTE *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  id v54;
  id v55;
  uint8_t buf[4];
  uint64_t v57;
  __int16 v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = *(void **)(a1 + 32);
  v9 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) + *(double *)(a1 + 96) * 0.9;
  v10 = a3;
  objc_msgSend(v8, "childProgressReporterToCheckpoint:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(double *)(a1 + 96)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                          + 24);
  objc_msgSend(v7, "anyNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "uuid");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = [PGTripFeatureProcessor alloc];
  v15 = *(_QWORD *)(a1 + 40);
  v16 = *(_QWORD *)(a1 + 48);
  v55 = 0;
  v17 = -[PGTripFeatureProcessor initWithMomentNodes:graph:locationHelper:error:](v14, "initWithMomentNodes:graph:locationHelper:error:", v10, v15, v16, &v55);

  v18 = v55;
  v19 = v18;
  if (v17)
  {
    v50 = a4;
    v54 = v18;
    -[PGTripFeatureProcessor processTripLocationsWithReporter:error:](v17, "processTripLocationsWithReporter:error:", v11, &v54);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v54;

    v22 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    if (*(_BYTE *)(v22 + 24))
    {
      v23 = 1;
    }
    else
    {
      v23 = objc_msgSend(*(id *)(a1 + 64), "isCancelledWithProgress:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
      v22 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
    }
    *(_BYTE *)(v22 + 24) = v23;
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
    {
      *v50 = 1;
    }
    else
    {
      if (*(_BYTE *)(a1 + 104))
        -[PGTripFeatureProcessor sendAnalyticsEvent](v17, "sendAnalyticsEvent");
      if (v20)
      {
        v25 = objc_msgSend(v20, "count");
        v26 = *(NSObject **)(a1 + 56);
        v27 = os_log_type_enabled(v26, OS_LOG_TYPE_INFO);
        if (v25)
        {
          if (v27)
          {
            v28 = v26;
            v29 = objc_msgSend(v20, "count");
            *(_DWORD *)buf = 138412546;
            v57 = (uint64_t)v13;
            v58 = 2048;
            v59 = v29;
            _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "[PGGraphIngestTripProcessor] Trip with uuid %@ does have %lu featuredLocationNodes retrieved from processor.", buf, 0x16u);

          }
        }
        else if (v27)
        {
          *(_DWORD *)buf = 138412290;
          v57 = (uint64_t)v13;
          _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "[PGGraphIngestTripProcessor] Trip with uuid %@ does not have any featuredLocationNodes.", buf, 0xCu);
        }
        v49 = objc_alloc_init(MEMORY[0x1E0D42A30]);
        objc_msgSend(*(id *)(a1 + 72), "featuredLocationNodesByHighlightGroupNode");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "targetsForSources:", v7);
        v32 = objc_claimAutoreleasedReturnValue();

        v33 = (void *)v32;
        v48 = -[MAElementCollection initWithArray:graph:]([PGGraphFeatureNodeCollection alloc], "initWithArray:graph:", v20, *(_QWORD *)(a1 + 40));
        -[MAElementCollection collectionBySubtracting:](v48, "collectionBySubtracting:", v32);
        v47 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v47, "count"))
        {
          v34 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            v35 = v34;
            v36 = v33;
            v37 = v35;
            v38 = objc_msgSend(v47, "count");
            *(_DWORD *)buf = 134218242;
            v57 = v38;
            v58 = 2112;
            v59 = (uint64_t)v13;
            _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "[PGGraphIngestTripProcessor] adding %lu featured location nodes to trip with uuid @\"%@\", buf, 0x16u);

            v33 = v36;
          }
          v51[0] = MEMORY[0x1E0C809B0];
          v51[1] = 3221225472;
          v51[2] = __126__PGGraphIngestTripProcessor_ingestLocationFeaturesForTripNodes_graph_loggingConnection_progressBlock_isResumingFullAnalysis___block_invoke_163;
          v51[3] = &unk_1E8434188;
          v52 = v12;
          v53 = v49;
          objc_msgSend(v47, "enumerateNodesUsingBlock:", v51);

        }
        objc_msgSend(v33, "collectionBySubtracting:", v48);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v39, "count"))
        {
          v46 = v33;
          v40 = *(NSObject **)(a1 + 56);
          if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
          {
            v41 = v40;
            v42 = objc_msgSend(v39, "count");
            *(_DWORD *)buf = 134218242;
            v57 = v42;
            v58 = 2112;
            v59 = (uint64_t)v13;
            _os_log_impl(&dword_1CA237000, v41, OS_LOG_TYPE_INFO, "[PGGraphIngestTripProcessor] removing %lu featured location nodes to trip with uuid @\"%@\", buf, 0x16u);

          }
          +[PGGraphEdgeCollection edgesFromNodes:toNodes:](PGGraphTripFeatureEdgeCollection, "edgesFromNodes:toNodes:", v7, v39);
          v43 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v49, "removeEdges:", v43);

          v33 = v46;
        }
        objc_msgSend(*(id *)(a1 + 40), "executeGraphChangeRequest:", v49);
        v44 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        if (*(_BYTE *)(v44 + 24))
        {
          v45 = 1;
        }
        else
        {
          v45 = objc_msgSend(*(id *)(a1 + 64), "isCancelledWithProgress:", *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24));
          v44 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8);
        }
        *(_BYTE *)(v44 + 24) = v45;
        if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24))
          *v50 = 1;

      }
      else
      {
        v30 = *(NSObject **)(a1 + 56);
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412546;
          v57 = (uint64_t)v21;
          v58 = 2112;
          v59 = (uint64_t)v13;
          _os_log_error_impl(&dword_1CA237000, v30, OS_LOG_TYPE_ERROR, "[PGGraphIngestTripProcessor] Cannot retrieve featuredLocationNodes with error %@ on trip with uuid %@", buf, 0x16u);
        }
      }
    }

  }
  else
  {
    v24 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v57 = (uint64_t)v19;
      v58 = 2112;
      v59 = (uint64_t)v13;
      _os_log_error_impl(&dword_1CA237000, v24, OS_LOG_TYPE_ERROR, "[PGGraphIngestTripProcessor] PGTripFeatureProcessor init failed with error %@ on trip with uuid %@", buf, 0x16u);
    }
    v21 = v19;
  }

}

void __126__PGGraphIngestTripProcessor_ingestLocationFeaturesForTripNodes_graph_loggingConnection_progressBlock_isResumingFullAnalysis___block_invoke_163(uint64_t a1, void *a2)
{
  id v3;
  id v4;

  v3 = a2;
  v4 = -[PGGraphTripFeatureEdge initFromHighlightGroupNode:toFeatureNode:]([PGGraphTripFeatureEdge alloc], "initFromHighlightGroupNode:toFeatureNode:", *(_QWORD *)(a1 + 32), v3);

  objc_msgSend(*(id *)(a1 + 40), "addEdge:", v4);
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 4;
}

@end
