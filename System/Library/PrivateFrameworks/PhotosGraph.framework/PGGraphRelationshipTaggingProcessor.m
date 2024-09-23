@implementation PGGraphRelationshipTaggingProcessor

- (PGGraphRelationshipTaggingProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphRelationshipTaggingProcessor *v6;
  PGGraphRelationshipTaggingProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphRelationshipTaggingProcessor;
  v6 = -[PGGraphRelationshipTaggingProcessor init](&v9, sel_init);
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
  if ((objc_msgSend(v3, "isResumingFullAnalysis") & 1) != 0)
    v4 = 1;
  else
    v4 = objc_msgSend(v3, "hasUpdatedPersonNodes");

  return v4;
}

- (void)processRelationshipTagsForPersonNodes:(id)a3 progressBlock:(id)a4
{
  id v6;
  id v7;
  void (**v8)(void *, uint8_t *, double);
  double v9;
  char v10;
  void *v11;
  PGGraphEntityTaggingServiceClient *v12;
  void *v13;
  PGGraphEntityTaggingServiceClient *v14;
  double v15;
  char v16;
  NSObject *v17;
  id v18;
  void *v19;
  unint64_t v20;
  double v21;
  char v22;
  id v23;
  dispatch_group_t v24;
  PGUnfairLock *v25;
  double v26;
  NSObject *v27;
  PGUnfairLock *v28;
  id v29;
  void (**v30)(void *, uint8_t *, double);
  double v31;
  char v32;
  NSObject *v33;
  void *v34;
  NSObject *v35;
  double Current;
  char v37;
  void *v38;
  double v39;
  char v40;
  void *v41;
  id v42;
  void *v43;
  _QWORD v44[4];
  NSObject *v45;
  PGGraphEntityTaggingServiceClient *v46;
  id v47;
  PGUnfairLock *v48;
  id v49;
  void (**v50)(void *, uint8_t *, double);
  _BYTE *v51;
  uint64_t *v52;
  uint64_t *v53;
  double v54;
  uint64_t v55;
  char v56;
  id v57;
  uint64_t v58;
  double *v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t *v63;
  uint64_t v64;
  char v65;
  uint8_t v66[4];
  int v67;
  __int16 v68;
  const char *v69;
  _BYTE buf[24];
  uint64_t v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = (void (**)(void *, uint8_t *, double))_Block_copy(v7);
  v62 = 0;
  v63 = &v62;
  v64 = 0x2020000000;
  v65 = 0;
  v58 = 0;
  v59 = (double *)&v58;
  v60 = 0x2020000000;
  v61 = 0;
  v43 = v7;
  if (!v8
    || (v9 = CFAbsoluteTimeGetCurrent(), v9 - v59[3] < 0.01)
    || (v59[3] = v9,
        v66[0] = 0,
        v8[2](v8, v66, 0.0),
        v10 = *((_BYTE *)v63 + 24) | v66[0],
        (*((_BYTE *)v63 + 24) = v10) == 0))
  {
    +[PGGraphPersonRelationshipTagNode supportedTagsAsStrings](PGGraphPersonRelationshipTagNode, "supportedTagsAsStrings");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = [PGGraphEntityTaggingServiceClient alloc];
    -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v57 = 0;
    v14 = -[PGGraphEntityTaggingServiceClient initWithSupportedTagsAsStrings:log:error:](v12, "initWithSupportedTagsAsStrings:log:error:", v11, v13, &v57);
    v42 = v57;

    if (!v14)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "loggingConnection");
      v35 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        *(_QWORD *)&buf[4] = v42;
        _os_log_error_impl(&dword_1CA237000, v35, OS_LOG_TYPE_ERROR, "[RelationshipTags] Error accessing entity tagging service: %@", buf, 0xCu);
      }

      if (!v8)
        goto LABEL_40;
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v59[3] < 0.01)
        goto LABEL_40;
      v59[3] = Current;
      v66[0] = 0;
      v8[2](v8, v66, 1.0);
      v37 = *((_BYTE *)v63 + 24) | v66[0];
      *((_BYTE *)v63 + 24) = v37;
      if (!v37 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_40;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 51;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/Graph/People Inferences/Relationship/PGGraphRelationshipTaggingProcessor.m";
      v17 = MEMORY[0x1E0C81028];
      goto LABEL_31;
    }
    if (v8)
    {
      v15 = CFAbsoluteTimeGetCurrent();
      if (v15 - v59[3] >= 0.01)
      {
        v59[3] = v15;
        v66[0] = 0;
        v8[2](v8, v66, 0.1);
        v16 = *((_BYTE *)v63 + 24) | v66[0];
        *((_BYTE *)v63 + 24) = v16;
        if (v16)
        {
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
LABEL_40:

            goto LABEL_41;
          }
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 55;
          *(_WORD *)&buf[8] = 2080;
          *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/"
                                "Framework/Graph/People Inferences/Relationship/PGGraphRelationshipTaggingProcessor.m";
          v17 = MEMORY[0x1E0C81028];
LABEL_31:
          _os_log_impl(&dword_1CA237000, v17, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          goto LABEL_40;
        }
      }
    }
    v18 = objc_alloc_init(MEMORY[0x1E0D42A30]);
    objc_msgSend(v6, "relationshipTagEdges");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
      objc_msgSend(v18, "removeEdges:", v19);
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    v71 = 0x3FC999999999999ALL;
    v20 = objc_msgSend(v6, "count");
    if (v8)
    {
      v21 = CFAbsoluteTimeGetCurrent();
      if (v21 - v59[3] >= 0.01)
      {
        v59[3] = v21;
        v56 = 0;
        v8[2](v8, (uint8_t *)&v56, *(double *)(*(_QWORD *)&buf[8] + 24));
        v22 = *((_BYTE *)v63 + 24) | v56;
        *((_BYTE *)v63 + 24) = v22;
        if (v22)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v66 = 67109378;
            v67 = 64;
            v68 = 2080;
            v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/People Inferences/Relationship/PGGraphRelationshipTaggingProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v66, 0x12u);
          }
          goto LABEL_39;
        }
      }
    }
    v41 = v19;
    v23 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v24 = dispatch_group_create();
    v25 = objc_alloc_init(PGUnfairLock);
    v26 = 0.8 / (double)v20;
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __91__PGGraphRelationshipTaggingProcessor_processRelationshipTagsForPersonNodes_progressBlock___block_invoke;
    v44[3] = &unk_1E8427A40;
    v27 = v24;
    v45 = v27;
    v46 = v14;
    v47 = v11;
    v28 = v25;
    v48 = v28;
    v29 = v23;
    v49 = v29;
    v51 = buf;
    v54 = v26;
    v30 = v8;
    v50 = v30;
    v52 = &v58;
    v55 = 0x3F847AE147AE147BLL;
    v53 = &v62;
    objc_msgSend(v6, "enumerateNodesUsingBlock:", v44);
    dispatch_group_wait(v27, 0xFFFFFFFFFFFFFFFFLL);
    if (v8
      && (v31 = CFAbsoluteTimeGetCurrent(), v31 - v59[3] >= 0.01)
      && (v59[3] = v31,
          v56 = 0,
          v30[2](v30, (uint8_t *)&v56, 0.9),
          v32 = *((_BYTE *)v63 + 24) | v56,
          (*((_BYTE *)v63 + 24) = v32) != 0))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_38:

        v19 = v41;
LABEL_39:
        _Block_object_dispose(buf, 8);

        goto LABEL_40;
      }
      *(_DWORD *)v66 = 67109378;
      v67 = 97;
      v68 = 2080;
      v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peop"
            "le Inferences/Relationship/PGGraphRelationshipTaggingProcessor.m";
      v33 = MEMORY[0x1E0C81028];
    }
    else
    {
      -[PGGraphRelationshipTaggingProcessor _insertTagNodesWithEdgesForPersonsTagsWithConfidence:withChangeRequest:](self, "_insertTagNodesWithEdgesForPersonsTagsWithConfidence:withChangeRequest:", v29, v18);
      -[PGGraphBuilder graph](self->_graphBuilder, "graph");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "executeGraphChangeRequest:", v18);

      if (!v8)
        goto LABEL_38;
      v39 = CFAbsoluteTimeGetCurrent();
      if (v39 - v59[3] < 0.01)
        goto LABEL_38;
      v59[3] = v39;
      v56 = 0;
      v30[2](v30, (uint8_t *)&v56, 1.0);
      v40 = *((_BYTE *)v63 + 24) | v56;
      *((_BYTE *)v63 + 24) = v40;
      if (!v40 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_38;
      *(_DWORD *)v66 = 67109378;
      v67 = 101;
      v68 = 2080;
      v69 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/Peop"
            "le Inferences/Relationship/PGGraphRelationshipTaggingProcessor.m";
      v33 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v66, 0x12u);
    goto LABEL_38;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 44;
    *(_WORD *)&buf[8] = 2080;
    *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/Graph/People Inferences/Relationship/PGGraphRelationshipTaggingProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_41:
  _Block_object_dispose(&v58, 8);
  _Block_object_dispose(&v62, 8);

}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  id v5;
  NSObject *v6;
  os_signpost_id_t v7;
  NSObject *v8;
  NSObject *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  NSObject *v14;
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
  v5 = a4;
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = os_signpost_id_generate(v6);
  v8 = v6;
  v9 = v8;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v8))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v9, OS_SIGNPOST_INTERVAL_BEGIN, v7, "PGGraphRelationshipTaggingProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v10 = mach_absolute_time();
  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphPersonNodeCollection, "nodesInGraph:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "count"))
  {
    -[PGGraphRelationshipTaggingProcessor processRelationshipTagsForPersonNodes:progressBlock:](self, "processRelationshipTagsForPersonNodes:progressBlock:", v12, v5);
  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "loggingConnection");
    v14 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_INFO, "[RelationshipTags] Skipping relationship tag ingest, no persons to process", buf, 2u);
    }

  }
  v15 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v18 = v9;
  v19 = v18;
  if (v7 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_END, v7, "PGGraphRelationshipTaggingProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v22 = "PGGraphRelationshipTaggingProcessor";
    v23 = 2048;
    v24 = (float)((float)((float)((float)(v15 - v10) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v19, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)_insertTagNodesWithEdgesForPersonsTagsWithConfidence:(id)a3 withChangeRequest:(id)a4
{
  id v6;
  objc_class *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;

  v6 = a4;
  v7 = (objc_class *)MEMORY[0x1E0C99E08];
  v8 = a3;
  v9 = objc_alloc_init(v7);
  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGGraphNodeCollection nodesInGraph:](PGGraphPersonRelationshipTagNodeCollection, "nodesInGraph:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x1E0C809B0];
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __110__PGGraphRelationshipTaggingProcessor__insertTagNodesWithEdgesForPersonsTagsWithConfidence_withChangeRequest___block_invoke;
  v19[3] = &unk_1E8431BE8;
  v13 = v9;
  v20 = v13;
  objc_msgSend(v11, "enumerateNodesUsingBlock:", v19);

  v16[0] = v12;
  v16[1] = 3221225472;
  v16[2] = __110__PGGraphRelationshipTaggingProcessor__insertTagNodesWithEdgesForPersonsTagsWithConfidence_withChangeRequest___block_invoke_2;
  v16[3] = &unk_1E8427A90;
  v17 = v13;
  v18 = v6;
  v14 = v6;
  v15 = v13;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v16);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __110__PGGraphRelationshipTaggingProcessor__insertTagNodesWithEdgesForPersonsTagsWithConfidence_withChangeRequest___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "label");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

void __110__PGGraphRelationshipTaggingProcessor__insertTagNodesWithEdgesForPersonsTagsWithConfidence_withChangeRequest___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id v10;

  v5 = a2;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __110__PGGraphRelationshipTaggingProcessor__insertTagNodesWithEdgesForPersonsTagsWithConfidence_withChangeRequest___block_invoke_3;
  v7[3] = &unk_1E8427A68;
  v8 = *(id *)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __110__PGGraphRelationshipTaggingProcessor__insertTagNodesWithEdgesForPersonsTagsWithConfidence_withChangeRequest___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  PGGraphPersonRelationshipTagNode *v6;
  double v7;
  id v8;
  id v9;

  v9 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v9);
  v6 = (PGGraphPersonRelationshipTagNode *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v6 = -[PGGraphPersonRelationshipTagNode initWithPersonRelationshipTag:]([PGGraphPersonRelationshipTagNode alloc], "initWithPersonRelationshipTag:", +[PGGraphPersonRelationshipTagNode relationshipTagFromString:](PGGraphPersonRelationshipTagNode, "relationshipTagFromString:", v9));
    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v9);
    objc_msgSend(*(id *)(a1 + 40), "addNode:", v6);
  }
  objc_msgSend(v5, "doubleValue");
  v8 = -[PGGraphRelationshipTagEdge initFromPersonNode:toRelationshipTagNode:withConfidence:]([PGGraphRelationshipTagEdge alloc], "initFromPersonNode:toRelationshipTagNode:withConfidence:", *(_QWORD *)(a1 + 48), v6, v7);
  objc_msgSend(*(id *)(a1 + 40), "addEdge:", v8);

}

void __91__PGGraphRelationshipTaggingProcessor_processRelationshipTagsForPersonNodes_progressBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  __int128 v9;
  __int128 v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  __int128 v18;
  __int128 v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v5 = a2;
  objc_msgSend(v5, "localIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length"))
  {
    dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
    v7 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __91__PGGraphRelationshipTaggingProcessor_processRelationshipTagsForPersonNodes_progressBlock___block_invoke_2;
    v11[3] = &unk_1E8427A18;
    v12 = v6;
    v13 = *(id *)(a1 + 32);
    v14 = *(id *)(a1 + 48);
    v15 = *(id *)(a1 + 56);
    v16 = *(id *)(a1 + 64);
    v17 = v5;
    v20 = *(_QWORD *)(a1 + 104);
    v10 = *(_OWORD *)(a1 + 72);
    v8 = (id)v10;
    v21 = *(_QWORD *)(a1 + 112);
    v9 = *(_OWORD *)(a1 + 88);
    v18 = v10;
    v19 = v9;
    v22 = a3;
    objc_msgSend(v7, "entityTagsForPersonWithPersonLocalIdentifier:completionHandler:", v12, v11);

  }
}

void __91__PGGraphRelationshipTaggingProcessor_processRelationshipTagsForPersonNodes_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  double Current;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void (*v16)(uint64_t, void *, void *);
  void *v17;
  id v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  __int16 v22;
  id v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v5)
  {
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v14 = MEMORY[0x1E0C809B0];
    v15 = 3221225472;
    v16 = __91__PGGraphRelationshipTaggingProcessor_processRelationshipTagsForPersonNodes_progressBlock___block_invoke_157;
    v17 = &unk_1E84279F0;
    v18 = *(id *)(a1 + 48);
    v8 = v7;
    v19 = v8;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", &v14);
    objc_msgSend(*(id *)(a1 + 56), "lock", v14, v15, v16, v17);
    objc_msgSend(*(id *)(a1 + 64), "setObject:forKeyedSubscript:", v8, *(_QWORD *)(a1 + 72));
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8) + 24) = *(double *)(a1 + 112)
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88) + 8)
                                                                            + 24);
    if (*(_QWORD *)(a1 + 80)
      && (Current = CFAbsoluteTimeGetCurrent(),
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 96) + 8),
          Current - *(double *)(v10 + 24) >= *(double *)(a1 + 120))
      && (*(double *)(v10 + 24) = Current,
          buf[0] = 0,
          (*(void (**)(double))(*(_QWORD *)(a1 + 80) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 88)
                                                                                               + 8)
                                                                                   + 24)),
          (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) |= buf[0]) != 0))
    {
      **(_BYTE **)(a1 + 128) = 1;
    }
    else
    {
      objc_msgSend(*(id *)(a1 + 56), "unlock");
      dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
    }

  }
  else
  {
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "loggingConnection");
    v12 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v13 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v21 = v13;
      v22 = 2112;
      v23 = v6;
      _os_log_error_impl(&dword_1CA237000, v12, OS_LOG_TYPE_ERROR, "[RelationshipTags] Error querying tags for person %@: %@", buf, 0x16u);
    }

    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }

}

void __91__PGGraphRelationshipTaggingProcessor_processRelationshipTagsForPersonNodes_progressBlock___block_invoke_157(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v6 = a2;
  v5 = a3;
  if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v6))
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v5, v6);

}

@end
