@implementation PGGraphIngestRelationshipProcessor

- (PGGraphIngestRelationshipProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestRelationshipProcessor *v6;
  PGGraphIngestRelationshipProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestRelationshipProcessor;
  v6 = -[PGGraphIngestRelationshipProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v4;
  BOOL v5;
  void *v6;
  void *v7;

  v4 = a3;
  if (((objc_msgSend(v4, "isResumingFullAnalysis") & 1) != 0 || objc_msgSend(v4, "hasUpdatedPersonNodes"))
    && !+[PGUserDefaults isRelationshipInferenceDisabled](PGUserDefaults, "isRelationshipInferenceDisabled"))
  {
    -[PGGraphBuilder graph](self->_graphBuilder, "graph");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "meNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  else
  {
    v5 = 0;
  }

  return v5;
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
  PGGraphPersonNodeCollection *v13;
  PGGraphPersonNodeCollection *v14;
  void *v15;
  PGGraphRelationshipProcessor *v16;
  void *v17;
  PGGraphRelationshipProcessor *v18;
  void *v19;
  BOOL v20;
  void *v21;
  void *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  uint64_t v33;
  uint32_t denom;
  uint32_t numer;
  NSObject *v36;
  NSObject *v37;
  uint64_t v38;
  uint32_t v39;
  uint32_t v40;
  NSObject *v41;
  NSObject *v42;
  os_signpost_id_t spid;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  PGGraphRelationshipProcessor *v48;
  void *v49;
  unint64_t v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  PGGraphIngestRelationshipProcessor *v56;
  id v57;
  id v58;
  BOOL v59;
  char v60;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v63;
  __int16 v64;
  double v65;
  uint64_t v66;

  v66 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  v50 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestRelationshipProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v47 = mach_absolute_time();
  if (objc_msgSend(v6, "isResumingFullAnalysis"))
  {
    -[PGGraphIngestRelationshipProcessor _personNodesToAnalyzeInGraph:](self, "_personNodesToAnalyzeInGraph:", v8);
    v13 = (PGGraphPersonNodeCollection *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v14 = [PGGraphPersonNodeCollection alloc];
    objc_msgSend(v6, "insertedAndUpdatedPersonNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[MAElementCollection initWithSet:graph:](v14, "initWithSet:graph:", v15, v8);

  }
  if (-[MAElementCollection count](v13, "count"))
  {
    spid = v10;
    v46 = v6;
    -[PGGraphIngestRelationshipProcessor removeInferredRelationshipEdgesForPersonNodes:inGraph:](self, "removeInferredRelationshipEdgesForPersonNodes:inGraph:", v13, v8);
    v16 = [PGGraphRelationshipProcessor alloc];
    -[PGGraphBuilder serviceManager](self->_graphBuilder, "serviceManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = -[PGGraphRelationshipProcessor initWithPersonNodes:runOptions:serviceManager:](v16, "initWithPersonNodes:runOptions:serviceManager:", v13, 8190, v17);

    v45 = v7;
    -[PGGraphRelationshipProcessor runRelationshipAnalysisWithLoggingConnection:progressBlock:](v18, "runRelationshipAnalysisWithLoggingConnection:progressBlock:", v12, v7);
    objc_msgSend(v8, "meNode");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v17) = +[PGUserDefaults isRelationshipSignalPropertiesIngestAllowed](PGUserDefaults, "isRelationshipSignalPropertiesIngestAllowed");
    v20 = +[PGUserDefaults isRelationshipFilteredOutInferencesIngestAllowed](PGUserDefaults, "isRelationshipFilteredOutInferencesIngestAllowed");
    v49 = v8;
    +[PGGraphNodeCollection nodesInGraph:](PGGraphPersonNodeCollection, "nodesInGraph:", v8);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "personNodeByLocalIdentifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphIngestRelationshipProcessor tagRelationshipByPersonForPersonNodes:](self, "tagRelationshipByPersonForPersonNodes:", v13);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v54[0] = MEMORY[0x1E0C809B0];
    v54[1] = 3221225472;
    v54[2] = __71__PGGraphIngestRelationshipProcessor_runWithGraphUpdate_progressBlock___block_invoke;
    v54[3] = &unk_1E8430BF8;
    v23 = v21;
    v59 = v20;
    v60 = (char)v17;
    v55 = v23;
    v56 = self;
    v24 = v19;
    v57 = v24;
    v25 = v22;
    v58 = v25;
    v48 = v18;
    -[PGGraphRelationshipProcessor enumerateInferredRelationshipsUsingBlock:](v18, "enumerateInferredRelationshipsUsingBlock:", v54);
    if (objc_msgSend(v25, "count"))
      -[PGGraphIngestRelationshipProcessor insertRelationshipEdgesForRelationshipTags:meNode:](self, "insertRelationshipEdgesForRelationshipTags:meNode:", v25, v24);
    v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    objc_msgSend(v24, "collection");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "relatedPersonNodes");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[MAElementCollection collectionByIntersecting:](v13, "collectionByIntersecting:", v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    -[PGGraphBuilder insertStorytellingRelationshipsWithRelationshipsForPersonNodes:meNode:](self->_graphBuilder, "insertStorytellingRelationshipsWithRelationshipsForPersonNodes:meNode:", v29, v24);
    -[MAElementCollection collectionBySubtracting:](v13, "collectionBySubtracting:", v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphIngestRelationshipProcessor removeStorytellingRelationshipEdgesForPersonNodes:inGraph:](self, "removeStorytellingRelationshipEdgesForPersonNodes:inGraph:", v30, v49);
    v51[0] = MEMORY[0x1E0C809B0];
    v51[1] = 3221225472;
    v51[2] = __71__PGGraphIngestRelationshipProcessor_runWithGraphUpdate_progressBlock___block_invoke_2;
    v51[3] = &unk_1E8430C20;
    v31 = v23;
    v52 = v31;
    v32 = v26;
    v53 = v32;
    -[PGGraphRelationshipProcessor enumerateHighRecallInferredRelationshipsExcludingPersonNodes:usingBlock:](v48, "enumerateHighRecallInferredRelationshipsExcludingPersonNodes:usingBlock:", v29, v51);
    -[PGGraphBuilder addStorytellingRelationshipsToMeNode:relationshipByPerson:](self->_graphBuilder, "addStorytellingRelationshipsToMeNode:relationshipByPerson:", v24, v32);
    v33 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v36 = v12;
    v37 = v36;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v36))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v37, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestRelationshipProcessor", ", buf, 2u);
    }

    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v63 = "PGGraphIngestRelationshipProcessor";
      v64 = 2048;
      v65 = (float)((float)((float)((float)(v33 - v47) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

    v7 = v45;
    v6 = v46;
    v8 = v49;
  }
  else
  {
    v38 = mach_absolute_time();
    v40 = info.numer;
    v39 = info.denom;
    v41 = v12;
    v42 = v41;
    if (v50 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v42, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestRelationshipProcessor", ", buf, 2u);
    }

    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      v63 = "PGGraphIngestRelationshipProcessor";
      v64 = 2048;
      v65 = (float)((float)((float)((float)(v38 - v47) * (float)v40) / (float)v39) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

}

- (void)insertRelationshipEdgesForRelationshipTags:(id)a3 meNode:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[5];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __88__PGGraphIngestRelationshipProcessor_insertRelationshipEdgesForRelationshipTags_meNode___block_invoke;
  v8[3] = &unk_1E8430C48;
  v8[4] = self;
  v9 = v6;
  v7 = v6;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v8);

}

- (id)tagRelationshipByPersonForPersonNodes:(id)a3
{
  id v4;
  id v5;
  _QWORD v7[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t (*v11)(uint64_t, uint64_t);
  void (*v12)(uint64_t);
  id v13;

  v4 = a3;
  v8 = 0;
  v9 = &v8;
  v10 = 0x3032000000;
  v11 = __Block_byref_object_copy__50343;
  v12 = __Block_byref_object_dispose__50344;
  v13 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __76__PGGraphIngestRelationshipProcessor_tagRelationshipByPersonForPersonNodes___block_invoke;
  v7[3] = &unk_1E84341D8;
  v7[4] = self;
  v7[5] = &v8;
  objc_msgSend(v4, "enumerateNodesUsingBlock:", v7);
  v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (unint64_t)relationshipForRelationshipTag:(unint64_t)a3
{
  unint64_t v4;
  void *v5;
  NSObject *v6;
  void *v7;
  int v9;
  unint64_t v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v4 = a3 - 1;
  if (a3 - 1 < 0xD && ((0x1EFFu >> v4) & 1) != 0)
    return qword_1CA8ED1F8[v4];
  +[PGLogging sharedLogging](PGLogging, "sharedLogging");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    +[PGGraphPersonRelationshipTagNode labelForRelationshipTag:](PGGraphPersonRelationshipTagNode, "labelForRelationshipTag:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 134218242;
    v10 = a3;
    v11 = 2112;
    v12 = v7;
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_INFO, "[PGGraphIngestRelationshipProcessor] Encountered unmapped entity tag %lu (%@) during relationship ingest", (uint8_t *)&v9, 0x16u);

  }
  return 0;
}

- (void)removeInferredRelationshipEdgesForPersonNodes:(id)a3 inGraph:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v5 = a4;
  objc_msgSend(a3, "relationshipEdges");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphRelationshipEdge confirmedRelationshipFilter](PGGraphRelationshipEdge, "confirmedRelationshipFilter");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "edgesMatchingFilter:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "collectionBySubtracting:", v8);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  v9 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  objc_msgSend(v9, "removeEdges:", v10);
  objc_msgSend(v5, "executeGraphChangeRequest:", v9);

}

- (void)removeStorytellingRelationshipEdgesForPersonNodes:(id)a3 inGraph:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v10 = a4;
  v5 = (objc_class *)MEMORY[0x1E0D42A30];
  v6 = a3;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v6, "storytellingRelationshipEdges");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__PGGraphIngestRelationshipProcessor_removeStorytellingRelationshipEdgesForPersonNodes_inGraph___block_invoke;
  v11[3] = &unk_1E8430C98;
  v9 = v7;
  v12 = v9;
  objc_msgSend(v8, "enumerateEdgesUsingBlock:", v11);

  if (objc_msgSend(v9, "numberOfChanges"))
    objc_msgSend(v10, "executeGraphChangeRequest:", v9);

}

- (id)_personNodesToAnalyzeInGraph:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (PGIsAppleInternal_onceToken != -1)
    dispatch_once(&PGIsAppleInternal_onceToken, &__block_literal_global_8044);
  -[PGGraphIngestRelationshipProcessor personNodesToAnalyzeInGraph:forAppleInternal:](self, "personNodesToAnalyzeInGraph:forAppleInternal:", v4, PGIsAppleInternal_isAppleInternal);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)personNodesToAnalyzeInGraph:(id)a3 forAppleInternal:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  uint8_t v16[16];

  v4 = a4;
  v6 = a3;
  if (!-[PGGraphBuilder isSharedLibraryEnabled](self->_graphBuilder, "isSharedLibraryEnabled"))
    goto LABEL_9;
  -[PGGraphBuilder momentNodesWhereMeIsPresent](self->_graphBuilder, "momentNodesWhereMeIsPresent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v7, "count"))
  {
    -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v16 = 0;
      _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_INFO, "No moments in library where Me is present. Not applying presence filtering", v16, 2u);
    }

LABEL_9:
    +[PGGraphPersonNodeCollection personNodesExcludingMeInGraph:](PGGraphPersonNodeCollection, "personNodesExcludingMeInGraph:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_5;
LABEL_10:
    objc_msgSend(v6, "meNodeCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "relatedPersonNodes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "collectionBySubtracting:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v10 = v14;
    goto LABEL_11;
  }
  objc_msgSend(v7, "presentPersonNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "subsetExcludingMe");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
    goto LABEL_9;
  if (!v4)
    goto LABEL_10;
LABEL_5:
  v10 = v9;
LABEL_11:

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

uint64_t __96__PGGraphIngestRelationshipProcessor_removeStorytellingRelationshipEdgesForPersonNodes_inGraph___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeEdge:", a2);
}

void __76__PGGraphIngestRelationshipProcessor_tagRelationshipByPersonForPersonNodes___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  _QWORD v9[5];
  id v10;
  uint64_t v11;

  v3 = a2;
  objc_msgSend(v3, "collection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "relationshipTagEdges");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __76__PGGraphIngestRelationshipProcessor_tagRelationshipByPersonForPersonNodes___block_invoke_2;
  v9[3] = &unk_1E8430C70;
  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v10 = v3;
  v11 = v7;
  v9[4] = v6;
  v8 = v3;
  objc_msgSend(v5, "enumerateEdgesUsingBlock:", v9);

}

void __76__PGGraphIngestRelationshipProcessor_tagRelationshipByPersonForPersonNodes___block_invoke_2(_QWORD *a1, void *a2)
{
  void *v3;
  double v4;
  void *v5;
  void *v6;
  uint64_t v7;
  id v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(v10, "confidence");
  v3 = v10;
  if (v4 >= 0.9)
  {
    v5 = (void *)a1[4];
    objc_msgSend(v10, "tagNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "relationshipForRelationshipTag:", objc_msgSend(v6, "tag"));

    v3 = v10;
    if (v7)
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectForKeyedSubscript:", a1[5]);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      if (!v8)
        v8 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObject:", v9);

      objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "setObject:forKeyedSubscript:", v8, a1[5]);
      v3 = v10;
    }
  }

}

void __88__PGGraphIngestRelationshipProcessor_insertRelationshipEdgesForRelationshipTags_meNode___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * v10), "unsignedIntegerValue");
        +[PGGraphRelationshipEdge propertiesWithRelationshipSource:](PGGraphRelationshipEdge, "propertiesWithRelationshipSource:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "addRelationshipEdgesBetweenPersonNode:andPersonNode:forRelationship:confidence:properties:", *(_QWORD *)(a1 + 40), v5, v11, v12, 0.99);

        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }

}

void __71__PGGraphIngestRelationshipProcessor_runWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4, double a5)
{
  void *v9;
  double v10;
  id v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (a5 > 0.0 || *(_BYTE *)(a1 + 64))
  {
    v10 = 0.99;
    if (a5 < 1.0)
      v10 = a5;
    if (*(_BYTE *)(a1 + 65))
      v11 = v14;
    else
      v11 = 0;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "addRelationshipEdgesBetweenPersonNode:andPersonNode:forRelationship:confidence:properties:", *(_QWORD *)(a1 + 48), v9, a3, v11, v10);
    objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v9);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "removeObject:", v13);

  }
}

void __71__PGGraphIngestRelationshipProcessor_runWithGraphUpdate_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a2);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

@end
