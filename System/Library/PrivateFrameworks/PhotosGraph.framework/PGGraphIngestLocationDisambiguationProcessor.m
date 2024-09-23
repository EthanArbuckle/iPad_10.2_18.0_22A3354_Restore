@implementation PGGraphIngestLocationDisambiguationProcessor

- (PGGraphIngestLocationDisambiguationProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestLocationDisambiguationProcessor *v6;
  PGGraphIngestLocationDisambiguationProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestLocationDisambiguationProcessor;
  v6 = -[PGGraphIngestLocationDisambiguationProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3;
  BOOL v4;
  uint64_t v5;

  v3 = a3;
  if ((objc_msgSend(v3, "isResumingFullAnalysis") & 1) != 0 || (objc_msgSend(v3, "hasInsertedMomentNodes") & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    v5 = objc_msgSend(v3, "momentUpdateTypes");
    v4 = (objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes") & v5) != 0;
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
  void *v15;
  uint64_t v16;
  uint32_t denom;
  uint32_t numer;
  NSObject *v19;
  NSObject *v20;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  double v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestLocationDisambiguationProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v13 = mach_absolute_time();
  if (objc_msgSend(v6, "isResumingFullAnalysis"))
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphLocationCityNodeCollection, "nodesInGraph:", v8);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v8, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "cityNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v14, "count"))
    -[PGGraphIngestLocationDisambiguationProcessor removeDuplicateCityNodes:graph:loggingConnection:progressBlock:](self, "removeDuplicateCityNodes:graph:loggingConnection:progressBlock:", v14, v8, v12, v7);
  v16 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v19 = v12;
  v20 = v19;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v19))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v20, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestLocationDisambiguationProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v23 = "PGGraphIngestLocationDisambiguationProcessor";
    v24 = 2048;
    v25 = (float)((float)((float)((float)(v16 - v13) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)removeDuplicateCityNodes:(id)a3 graph:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  char v15;
  void *v16;
  uint64_t v17;
  id v18;
  unint64_t v19;
  id v20;
  double Current;
  char v22;
  char v23;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  uint64_t *p_buf;
  uint64_t *v29;
  uint64_t *v30;
  double v31;
  uint64_t v32;
  _QWORD v33[4];
  id v34;
  uint64_t v35;
  double *v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  char v42;
  _DWORD v43[2];
  __int16 v44;
  const char *v45;
  uint64_t buf;
  __int128 v47;
  uint64_t v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = _Block_copy(v12);
  v39 = 0;
  v40 = &v39;
  v41 = 0x2020000000;
  v42 = 0;
  v35 = 0;
  v36 = (double *)&v35;
  v37 = 0x2020000000;
  v38 = 0;
  if (v13
    && (v14 = CFAbsoluteTimeGetCurrent(), v14 - v36[3] >= 0.01)
    && (v36[3] = v14,
        LOBYTE(v43[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v13 + 2))(v13, v43, 0.0),
        v15 = *((_BYTE *)v40 + 24) | LOBYTE(v43[0]),
        (*((_BYTE *)v40 + 24) = v15) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 0x4804000202;
      LOWORD(v47) = 2080;
      *(_QWORD *)((char *)&v47 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestLocationDisambiguationProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke;
    v33[3] = &unk_1E842FF60;
    v18 = v16;
    v34 = v18;
    objc_msgSend(v9, "enumerateNodesUsingBlock:", v33);
    v19 = objc_msgSend(v18, "count");
    buf = 0;
    *(_QWORD *)&v47 = &buf;
    *((_QWORD *)&v47 + 1) = 0x2020000000;
    v48 = 0;
    v24[0] = v17;
    v24[1] = 3221225472;
    v24[2] = __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_2;
    v24[3] = &unk_1E842C408;
    p_buf = &buf;
    v31 = 1.0 / (double)v19;
    v20 = v13;
    v27 = v20;
    v29 = &v35;
    v32 = 0x3F847AE147AE147BLL;
    v30 = &v39;
    v25 = v11;
    v26 = v10;
    objc_msgSend(v18, "enumerateKeysAndObjectsUsingBlock:", v24);
    if (v13)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v36[3] >= 0.01)
      {
        v36[3] = Current;
        v23 = 0;
        (*((void (**)(id, char *, double))v20 + 2))(v20, &v23, 1.0);
        v22 = *((_BYTE *)v40 + 24) | v23;
        *((_BYTE *)v40 + 24) = v22;
        if (v22)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v43[0] = 67109378;
            v43[1] = 218;
            v44 = 2080;
            v45 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Ingest/Ingest Processing/PGGraphIngestLocationDisambiguationProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v43, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v35, 8);
  _Block_object_dispose(&v39, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a2;
  objc_msgSend(v3, "name");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    objc_msgSend(v4, "addObject:", v3);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, v6);
  }

}

void __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  double Current;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  id v26;
  id v27;
  id v28;
  id v29;
  id v30;
  id v31;
  id obj;
  _QWORD v33[4];
  id v34;
  id v35;
  id v36;
  _QWORD v37[4];
  id v38;
  id v39;
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v7 = a2;
  v8 = a3;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(double *)(a1 + 80)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                          + 24);
  if (*(_QWORD *)(a1 + 48)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8),
        Current - *(double *)(v10 + 24) >= *(double *)(a1 + 88))
    && (*(double *)(v10 + 24) = Current,
        v45 = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 48) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                               + 24)) != 0))
  {
    *a4 = 1;
  }
  else if ((unint64_t)objc_msgSend(v8, "count") >= 2)
  {
    v31 = v7;
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v44 = 0u;
    v30 = v8;
    obj = v8;
    v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v42;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v42 != v15)
            objc_enumerationMutation(obj);
          v17 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(v17, "identifier"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "setObject:forKeyedSubscript:", v17, v18);
          objc_msgSend(v17, "collection");
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v19, "addressNodes");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = objc_msgSend(v20, "count");

          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "setObject:forKeyedSubscript:", v22, v18);

        }
        v14 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
      }
      while (v14);
    }

    objc_msgSend(v12, "keysSortedByValueUsingComparator:", &__block_literal_global_28827);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = MEMORY[0x1E0C809B0];
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_4;
    v37[3] = &unk_1E842C3B8;
    v26 = v11;
    v38 = v26;
    v39 = v23;
    v40 = v24;
    v27 = v24;
    v28 = v23;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", v37);
    v33[0] = v25;
    v33[1] = 3221225472;
    v33[2] = __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_7;
    v33[3] = &unk_1E842C3E0;
    v34 = v26;
    v35 = *(id *)(a1 + 32);
    v36 = *(id *)(a1 + 40);
    v29 = v26;
    objc_msgSend(v27, "enumerateKeysAndObjectsUsingBlock:", v33);

    v8 = v30;
    v7 = v31;
  }

}

void __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_4(id *a1, void *a2, uint64_t a3)
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  void *v21;
  id v22;
  double v23;
  uint64_t v24;
  void *v25;
  unint64_t v26;
  unint64_t v27;
  unint64_t v28;
  double v29;
  double v30;
  id v31;
  void *v32;
  void *v33;
  id *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _QWORD v38[4];
  id v39;
  _QWORD v40[4];
  id v41;

  v31 = a2;
  objc_msgSend(a1[4], "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationNodeCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deepParentLocationNodes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = v5;
  objc_msgSend(v5, "fullname");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (!a3)
    goto LABEL_18;
  v8 = 0;
  v35 = a3;
  v36 = v7;
  v34 = a1;
  while (1)
  {
    v9 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(a1[5], "objectAtIndexedSubscript:", v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[6], "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
      goto LABEL_14;
    objc_msgSend(a1[4], "objectForKeyedSubscript:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "locationNodeCollection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "deepParentLocationNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v7, "count");
    objc_msgSend(v12, "fullname");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v14, "isEqual:", v7) & 1) != 0)
      break;
    if (v15)
    {
      v17 = objc_msgSend(v7, "count");
      if (v17 == objc_msgSend(v14, "count") && (objc_msgSend(v32, "isEqualToString:", v16) & 1) != 0)
        break;
    }
    v37 = v9;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_5;
    v40[3] = &unk_1E842C390;
    v20 = v18;
    v41 = v20;
    objc_msgSend(v7, "enumerateNodesUsingBlock:", v40);
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v38[0] = v19;
    v38[1] = 3221225472;
    v38[2] = __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_6;
    v38[3] = &unk_1E842C390;
    v22 = v21;
    v39 = v22;
    objc_msgSend(v14, "enumerateNodesUsingBlock:", v38);
    objc_msgSend(v22, "intersectSet:", v20);
    v23 = (double)(unint64_t)objc_msgSend(v22, "count");
    v24 = objc_msgSend(v14, "count");
    v25 = v7;
    v26 = v24;
    v27 = objc_msgSend(v25, "count");
    if (v26 <= v27)
      v28 = v27;
    else
      v28 = v26;
    if (v23 / (double)v28 >= 0.6)
    {
      objc_msgSend(v33, "coordinate");
      objc_msgSend(v12, "coordinate");
      CLLocationCoordinate2DGetDistanceFrom();
      v30 = v29;

      a3 = v35;
      v7 = v36;
      v9 = v37;
      a1 = v34;
      if (v30 <= 50000.0)
        goto LABEL_17;
    }
    else
    {

      a3 = v35;
      v7 = v36;
      v9 = v37;
      a1 = v34;
    }
LABEL_14:

    objc_autoreleasePoolPop(v9);
    if (a3 == ++v8)
      goto LABEL_18;
  }

LABEL_17:
  objc_msgSend(a1[6], "setObject:forKeyedSubscript:", v10, v31);

  objc_autoreleasePoolPop(v9);
LABEL_18:

}

void __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_7(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  id obj;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  _BYTE v58[128];
  _BYTE v59[128];
  uint8_t v60[128];
  uint8_t buf[4];
  void *v62;
  __int16 v63;
  void *v64;
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", a3);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = v5;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *(NSObject **)(a1 + 40);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    v62 = v6;
    v63 = 2112;
    v64 = v45;
    _os_log_impl(&dword_1CA237000, v7, OS_LOG_TYPE_DEFAULT, "Location Disambiguation [City] Node %@ is a duplicate of node %@", buf, 0x16u);
  }
  objc_msgSend(v6, "locationNodeCollection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "deepChildLocationNodes");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "temporarySet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  obj = v10;
  v42 = v6;
  v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
  if (v43)
  {
    v41 = *(_QWORD *)v55;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v55 != v41)
          objc_enumerationMutation(obj);
        v44 = v11;
        v12 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * v11);
        objc_msgSend(v12, "edgesTowardNode:", v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v50 = 0u;
        v51 = 0u;
        v52 = 0u;
        v53 = 0u;
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
        if (v14)
        {
          v15 = v14;
          v16 = *(_QWORD *)v51;
          do
          {
            for (i = 0; i != v15; ++i)
            {
              if (*(_QWORD *)v51 != v16)
                objc_enumerationMutation(v13);
              v18 = *(void **)(*((_QWORD *)&v50 + 1) + 8 * i);
              v19 = *(void **)(a1 + 48);
              objc_msgSend(v18, "label");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v21 = objc_msgSend(v18, "domain");
              objc_msgSend(v18, "propertyDictionary");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              v23 = (id)objc_msgSend(v19, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", v20, v12, v45, v21, v22);

            }
            v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v50, v59, 16);
          }
          while (v15);
        }

        v11 = v44 + 1;
        v6 = v42;
      }
      while (v44 + 1 != v43);
      v43 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v54, v60, 16);
    }
    while (v43);
  }

  objc_msgSend(v6, "locationNodeCollection");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "parentLocationNodes");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "anyNode");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  if (v26)
  {
    objc_msgSend(v6, "edgesTowardNode:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v49 = 0u;
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v47;
      do
      {
        for (j = 0; j != v29; ++j)
        {
          if (*(_QWORD *)v47 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v46 + 1) + 8 * j);
          v33 = *(void **)(a1 + 48);
          objc_msgSend(v32, "label");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v32, "domain");
          objc_msgSend(v32, "propertyDictionary");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          v37 = (id)objc_msgSend(v33, "addUniqueEdgeWithLabel:sourceNode:targetNode:domain:properties:", v34, v45, v26, v35, v36);

        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v46, v58, 16);
      }
      while (v29);
    }

    v6 = v42;
  }
  v38 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  objc_msgSend(v38, "removeNode:", v6);
  objc_msgSend(*(id *)(a1 + 48), "executeGraphChangeRequest:", v38);

}

void __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

void __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_6(uint64_t a1, void *a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "name");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v3);

}

uint64_t __111__PGGraphIngestLocationDisambiguationProcessor_removeDuplicateCityNodes_graph_loggingConnection_progressBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "compare:", a2);
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 4;
}

@end
