@implementation PGGraphIngestNextEdgesProcessor

- (PGGraphIngestNextEdgesProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestNextEdgesProcessor *v6;
  PGGraphIngestNextEdgesProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestNextEdgesProcessor;
  v6 = -[PGGraphIngestNextEdgesProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v4;
  uint64_t v5;
  BOOL v6;
  void *v8;
  uint64_t v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isResumingFullAnalysis") & 1) != 0
    || (v5 = objc_msgSend(v4, "momentUpdateTypes"),
        (objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes") & v5) != 0))
  {
    v6 = 1;
  }
  else if ((objc_msgSend(v4, "hasDeletedMomentNodes") & 1) != 0
         || objc_msgSend(v4, "hasInsertedMomentNodes"))
  {
    -[PGGraphBuilder graph](self->_graphBuilder, "graph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "edgesCountForLabel:domain:", CFSTR("NEXT"), 101);
    v6 = v9 != objc_msgSend(v8, "numberOfMomentNodes") - 1;

  }
  else
  {
    v6 = 0;
  }

  return v6;
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
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint32_t denom;
  uint32_t numer;
  NSObject *v29;
  NSObject *v30;
  uint64_t v31;
  uint32_t v32;
  uint32_t v33;
  NSObject *v34;
  NSObject *v35;
  os_signpost_id_t spid;
  uint64_t v37;
  void *v38;
  id v39;
  mach_timebase_info info;
  _BYTE buf[24];
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestNextEdgesProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v14 = mach_absolute_time();
  objc_msgSend(v8, "momentNodes");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v15, "count"))
  {
    spid = v10;
    v37 = v14;
    v38 = v15;
    v39 = v7;
    objc_msgSend(v15, "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalStartDate"), 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)buf = v17;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("universalEndDate"), 1);
    v18 = v8;
    v19 = v6;
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf[8] = v20;
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("UUID"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    *(_QWORD *)&buf[16] = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", buf, 3);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v19;
    v8 = v18;

    objc_msgSend(v16, "sortedArrayUsingDescriptors:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "isResumingFullAnalysis"))
    {
      +[PGGraphEdgeCollection edgesInGraph:](PGGraphMomentNextEdgeCollection, "edgesInGraph:", v18);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v25 = objc_alloc_init(MEMORY[0x1E0D42A30]);
      objc_msgSend(v25, "removeEdges:", v24);
      objc_msgSend(v18, "executeGraphChangeRequest:", v25);

    }
    v7 = v39;
    -[PGGraphIngestNextEdgesProcessor processNextEdgesWithSortedMomentNodes:graph:progressBlock:](self, "processNextEdgesWithSortedMomentNodes:graph:progressBlock:", v23, v18, v39);
    v26 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v29 = v12;
    v30 = v29;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v30, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestNextEdgesProcessor", ", buf, 2u);
    }

    v15 = v38;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "PGGraphIngestNextEdgesProcessor";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v26 - v37) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

  }
  else
  {
    v31 = mach_absolute_time();
    v33 = info.numer;
    v32 = info.denom;
    v34 = v12;
    v35 = v34;
    if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v34))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v35, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestNextEdgesProcessor", ", buf, 2u);
    }

    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "PGGraphIngestNextEdgesProcessor";
      *(_WORD *)&buf[12] = 2048;
      *(double *)&buf[14] = (float)((float)((float)((float)(v31 - v14) * (float)v33) / (float)v32) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
  }

}

- (void)processNextEdgesWithSortedMomentNodes:(id)a3 graph:(id)a4 progressBlock:(id)a5
{
  id v7;
  id v8;
  void (**v9)(void *, _BYTE *, double);
  double v10;
  double Current;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  PGGraphMomentNodeCollection *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  uint64_t v36;
  id v37;
  id v38;
  void *v39;
  void *v40;
  PGGraphMomentNodeCollection *v41;
  void *v42;
  PGGraphMomentNodeCollection *v43;
  void *v44;
  id v45;
  id v46;
  PGGraphMomentNodeCollection *v47;
  void (**v48)(void *, _BYTE *, double);
  id v49;
  void *v50;
  _QWORD v51[4];
  id v52;
  id v53;
  _QWORD v54[4];
  id v55;
  id v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  char v65;
  _BYTE v66[128];
  uint8_t v67[128];
  uint8_t buf[4];
  int v69;
  __int16 v70;
  const char *v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(void *, _BYTE *, double))_Block_copy(a5);
  v10 = 0.0;
  if (v9)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v65 = 0;
      v9[2](v9, &v65, 0.0);
      if (v65)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v69 = 92;
          v70 = 2080;
          v71 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/"
                "Ingest/Ingest Processing/PGGraphIngestNextEdgesProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        goto LABEL_30;
      }
      v10 = Current;
    }
  }
  v48 = v9;
  v12 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v61 = 0u;
  v62 = 0u;
  v63 = 0u;
  v64 = 0u;
  v49 = v7;
  v13 = v7;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v62;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v62 != v16)
          objc_enumerationMutation(v13);
        v18 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v18, "identifier"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKeyedSubscript:", v18, v19);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v61, v67, 16);
    }
    while (v15);
  }

  v50 = v8;
  v20 = -[MAElementCollection initWithArray:graph:]([PGGraphMomentNodeCollection alloc], "initWithArray:graph:", v13, v8);
  v21 = (void *)MEMORY[0x1E0D429D8];
  +[PGGraphMomentNode nextMomentOfMoment](PGGraphMomentNode, "nextMomentOfMoment");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v20;
  objc_msgSend(v21, "adjacencyWithSources:relation:targetsClass:", v20, v22, objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  v24 = objc_alloc_init(MEMORY[0x1E0D429A8]);
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v25 = v13;
  v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
  if (v26)
  {
    v27 = v26;
    v28 = 0;
    v29 = *(_QWORD *)v58;
    do
    {
      v30 = 0;
      v31 = v28;
      do
      {
        if (*(_QWORD *)v58 != v29)
          objc_enumerationMutation(v25);
        v32 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * v30);
        if (v31)
          objc_msgSend(v24, "insertSource:target:", objc_msgSend(v31, "identifier"), objc_msgSend(v32, "identifier"));
        v28 = v32;

        ++v30;
        v31 = v28;
      }
      while (v27 != v30);
      v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v57, v66, 16);
    }
    while (v27);

  }
  v33 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  objc_msgSend(v23, "adjacency");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "differenceWith:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue();

  v36 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __93__PGGraphIngestNextEdgesProcessor_processNextEdgesWithSortedMomentNodes_graph_progressBlock___block_invoke;
  v54[3] = &unk_1E84296B8;
  v37 = v12;
  v55 = v37;
  v38 = v33;
  v56 = v38;
  objc_msgSend(v35, "enumerateTargetsBySourceWith:", v54);
  objc_msgSend(v23, "adjacency");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "differenceWith:", v24);
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  v41 = [PGGraphMomentNodeCollection alloc];
  objc_msgSend(v40, "sources");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = -[MAElementCollection initWithGraph:elementIdentifiers:](v41, "initWithGraph:elementIdentifiers:", v8, v42);

  +[PGGraphEdgeCollection edgesFromNodes:](PGGraphMomentNextEdgeCollection, "edgesFromNodes:", v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  v51[0] = v36;
  v51[1] = 3221225472;
  v51[2] = __93__PGGraphIngestNextEdgesProcessor_processNextEdgesWithSortedMomentNodes_graph_progressBlock___block_invoke_3;
  v51[3] = &unk_1E84296E0;
  v52 = v40;
  v45 = v38;
  v53 = v45;
  v46 = v40;
  objc_msgSend(v44, "enumerateEdgesUsingBlock:", v51);
  objc_msgSend(v50, "executeGraphChangeRequest:", v45);
  v9 = v48;
  v7 = v49;
  if (v48)
  {
    if (CFAbsoluteTimeGetCurrent() - v10 >= 0.01)
    {
      v65 = 0;
      v48[2](v48, &v65, 1.0);
      if (v65)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          v69 = 145;
          v70 = 2080;
          v71 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Graph/"
                "Ingest/Ingest Processing/PGGraphIngestNextEdgesProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
      }
    }
  }

  v8 = v50;
LABEL_30:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __93__PGGraphIngestNextEdgesProcessor_processNextEdgesWithSortedMomentNodes_graph_progressBlock___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;

  v5 = *(void **)(a1 + 32);
  v6 = (void *)MEMORY[0x1E0CB37E8];
  v7 = a3;
  objc_msgSend(v6, "numberWithUnsignedInteger:", a2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __93__PGGraphIngestNextEdgesProcessor_processNextEdgesWithSortedMomentNodes_graph_progressBlock___block_invoke_2;
  v11[3] = &unk_1E8429690;
  v12 = *(id *)(a1 + 32);
  v13 = v9;
  v14 = *(id *)(a1 + 40);
  v10 = v9;
  objc_msgSend(v7, "enumerateIdentifiersWithBlock:", v11);

}

void __93__PGGraphIngestNextEdgesProcessor_processNextEdgesWithSortedMomentNodes_graph_progressBlock___block_invoke_3(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v7 = a2;
  v3 = *(void **)(a1 + 32);
  objc_msgSend(v7, "sourceNode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "identifier");
  objc_msgSend(v7, "targetNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v3) = objc_msgSend(v3, "containsSource:target:", v5, objc_msgSend(v6, "identifier"));

  if ((_DWORD)v3)
    objc_msgSend(*(id *)(a1 + 40), "removeEdge:", v7);

}

void __93__PGGraphIngestNextEdgesProcessor_processNextEdgesWithSortedMomentNodes_graph_progressBlock___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v5 = -[PGGraphMomentNextEdge initFromMomentNode:toMomentNode:]([PGGraphMomentNextEdge alloc], "initFromMomentNode:toMomentNode:", *(_QWORD *)(a1 + 40), v6);
  objc_msgSend(*(id *)(a1 + 48), "addEdge:", v5);

}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 2;
}

@end
