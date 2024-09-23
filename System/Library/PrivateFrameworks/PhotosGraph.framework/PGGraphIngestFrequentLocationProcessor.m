@implementation PGGraphIngestFrequentLocationProcessor

- (PGGraphIngestFrequentLocationProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestFrequentLocationProcessor *v6;
  PGGraphIngestFrequentLocationProcessor *v7;
  os_log_t v8;
  OS_os_log *loggingConnection;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGGraphIngestFrequentLocationProcessor;
  v6 = -[PGGraphIngestFrequentLocationProcessor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_graphBuilder, a3);
    v8 = os_log_create("com.apple.PhotosGraph", "FrequentLocationProcessor");
    loggingConnection = v7->_loggingConnection;
    v7->_loggingConnection = (OS_os_log *)v8;

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
  PGGraphBuilder *graphBuilder;
  id v6;
  void *v7;
  OS_os_log *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *loggingConnection;
  id v17;
  uint64_t v18;
  uint32_t denom;
  uint32_t numer;
  NSObject *v21;
  NSObject *v22;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v25;
  __int16 v26;
  double v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  graphBuilder = self->_graphBuilder;
  v6 = a4;
  -[PGGraphBuilder graph](graphBuilder, "graph");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = self->_loggingConnection;
  v9 = os_signpost_id_generate((os_log_t)v8);
  v10 = v8;
  v11 = v10;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGGraphIngestFrequentLocationProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v12 = mach_absolute_time();
  objc_msgSend(v7, "invalidateSupersetCaches");
  +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[PGGraphBuilder isSharedLibraryEnabled](self->_graphBuilder, "isSharedLibraryEnabled"))
  {
    -[PGGraphBuilder momentNodesWhereMeIsPresent](self->_graphBuilder, "momentNodesWhereMeIsPresent");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
    {
      v15 = v14;

      v13 = v15;
    }
    else
    {
      loggingConnection = self->_loggingConnection;
      if (os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "No moments in library where Me is present. Not applying presence filtering", buf, 2u);
      }
    }

  }
  v17 = objc_alloc_init(MEMORY[0x1E0D42A30]);
  -[PGGraphIngestFrequentLocationProcessor deleteFrequentLocationNodesInGraph:changeRequest:](self, "deleteFrequentLocationNodesInGraph:changeRequest:", v7, v17);
  -[PGGraphIngestFrequentLocationProcessor processAndInsertFrequentLocationWithMomentNodes:inGraph:changeRequest:progressBlock:](self, "processAndInsertFrequentLocationWithMomentNodes:inGraph:changeRequest:progressBlock:", v13, v7, v17, v6);

  objc_msgSend(v7, "executeGraphChangeRequest:", v17);
  v18 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v21 = v11;
  v22 = v21;
  if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v21))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v22, OS_SIGNPOST_INTERVAL_END, v9, "PGGraphIngestFrequentLocationProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v25 = "PGGraphIngestFrequentLocationProcessor";
    v26 = 2048;
    v27 = (float)((float)((float)((float)(v18 - v12) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)deleteFrequentLocationNodesInGraph:(id)a3 changeRequest:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  +[PGGraphNodeCollection nodesInGraph:](PGGraphFrequentLocationNodeCollection, "nodesInGraph:", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeNodes:", v6);

}

- (void)processAndInsertFrequentLocationWithMomentNodes:(id)a3 inGraph:(id)a4 changeRequest:(id)a5 progressBlock:(id)a6
{
  double v9;
  char v10;
  uint64_t v11;
  NSObject *v12;
  unint64_t v13;
  NSObject *loggingConnection;
  _BOOL4 v15;
  id v16;
  double v17;
  double v18;
  PGGraphFrequentLocationNode *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  id v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t j;
  void *v32;
  void *v33;
  id v34;
  NSObject *v35;
  id v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t k;
  id v40;
  double Current;
  char v42;
  NSObject *v43;
  double v44;
  char v45;
  double v46;
  char v47;
  void *v48;
  id v49;
  id v50;
  void *v51;
  id v52;
  id v53;
  id obj;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t i;
  void *v60;
  id v61;
  PGGraphFrequentLocationNode *v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  _QWORD v75[4];
  id v76;
  _QWORD v77[4];
  id v78;
  uint64_t *v79;
  uint64_t *v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  double *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  char v90;
  uint8_t v91[128];
  uint8_t buf[4];
  _BYTE v93[18];
  _BYTE v94[128];
  _BYTE v95[128];
  uint64_t v96;

  v96 = *MEMORY[0x1E0C80C00];
  v49 = a3;
  v53 = a4;
  v61 = a5;
  v50 = a6;
  v86 = 0;
  v87 = 0;
  v88 = &v87;
  v89 = 0x2020000000;
  v90 = 0;
  v83 = 0;
  v84 = (double *)&v83;
  v85 = 0x2020000000;
  v55 = _Block_copy(v50);
  if (!v55
    || (v9 = CFAbsoluteTimeGetCurrent(), v9 - v84[3] < 0.01)
    || (v84[3] = v9,
        v82 = 0,
        (*((void (**)(void *, char *, double))v55 + 2))(v55, &v82, 0.0),
        v10 = *((_BYTE *)v88 + 24) | v82,
        (*((_BYTE *)v88 + 24) = v10) == 0))
  {
    v11 = MEMORY[0x1E0C809B0];
    v77[0] = MEMORY[0x1E0C809B0];
    v77[1] = 3221225472;
    v77[2] = __126__PGGraphIngestFrequentLocationProcessor_processAndInsertFrequentLocationWithMomentNodes_inGraph_changeRequest_progressBlock___block_invoke;
    v77[3] = &unk_1E8434F30;
    v52 = v55;
    v78 = v52;
    v79 = &v83;
    v80 = &v87;
    v81 = 0x3F847AE147AE147BLL;
    -[PGGraphIngestFrequentLocationProcessor processFrequentLocationWithGraph:progressBlock:](self, "processFrequentLocationWithGraph:progressBlock:", v53, v77);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v88 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v93 = 102;
        *(_WORD *)&v93[4] = 2080;
        *(_QWORD *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
        v12 = MEMORY[0x1E0C81028];
LABEL_9:
        _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      v13 = objc_msgSend(v51, "count");
      loggingConnection = self->_loggingConnection;
      v15 = os_log_type_enabled(loggingConnection, OS_LOG_TYPE_INFO);
      if (v13)
      {
        if (v15)
        {
          *(_DWORD *)buf = 134217984;
          *(_QWORD *)v93 = v13;
          _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "Ingesting %tu frequent locations", buf, 0xCu);
        }
        +[PGGraphNodeCollection nodesInGraph:](PGGraphMomentNodeCollection, "nodesInGraph:", v53);
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        v75[0] = v11;
        v75[1] = 3221225472;
        v75[2] = __126__PGGraphIngestFrequentLocationProcessor_processAndInsertFrequentLocationWithMomentNodes_inGraph_changeRequest_progressBlock___block_invoke_159;
        v75[3] = &unk_1E8436408;
        v16 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v48, "count"));
        v76 = v16;
        objc_msgSend(v48, "enumerateNodesUsingBlock:", v75);
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        obj = v51;
        v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v95, 16);
        if (v57)
        {
          v17 = 1.0 / (double)v13;
          v56 = *(_QWORD *)v72;
          v18 = 0.0;
          while (2)
          {
            for (i = 0; i != v57; ++i)
            {
              if (*(_QWORD *)v72 != v56)
                objc_enumerationMutation(obj);
              v60 = *(void **)(*((_QWORD *)&v71 + 1) + 8 * i);
              v19 = [PGGraphFrequentLocationNode alloc];
              objc_msgSend(v60, "dateInterval");
              v20 = (void *)objc_claimAutoreleasedReturnValue();
              v62 = -[PGGraphFrequentLocationNode initWithUniversalDateInterval:](v19, "initWithUniversalDateInterval:", v20);

              objc_msgSend(v60, "centroid");
              v21 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "pl_uuid");
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v16, "objectForKeyedSubscript:", v22);
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "bestAddressNode");
              v24 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v24)
              {
                v25 = self->_loggingConnection;
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v93 = v60;
                  _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "Failed to retrieve centroid address node for frequent location: %@. Will pick from another moment instead.", buf, 0xCu);
                }
              }
              v26 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              v69 = 0u;
              v70 = 0u;
              v67 = 0u;
              v68 = 0u;
              objc_msgSend(v60, "sortedMoments");
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v67, v94, 16);
              if (v28)
              {
                v29 = 0;
                v30 = *(_QWORD *)v68;
                do
                {
                  for (j = 0; j != v28; ++j)
                  {
                    if (*(_QWORD *)v68 != v30)
                      objc_enumerationMutation(v27);
                    objc_msgSend(*(id *)(*((_QWORD *)&v67 + 1) + 8 * j), "pl_uuid");
                    v32 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v16, "objectForKeyedSubscript:", v32);
                    v33 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v33)
                    {
                      if (!v24)
                      {
                        objc_msgSend(v33, "bestAddressNode");
                        v24 = (void *)objc_claimAutoreleasedReturnValue();
                      }
                      v34 = -[PGGraphFrequentLocationInEdge initFromMomentNode:toFrequentLocationNode:]([PGGraphFrequentLocationInEdge alloc], "initFromMomentNode:toFrequentLocationNode:", v33, v62);
                      objc_msgSend(v26, "addObject:", v34);

                    }
                    else
                    {
                      ++v29;
                    }

                  }
                  v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v67, v94, 16);
                }
                while (v28);

                if (v29)
                {
                  v35 = self->_loggingConnection;
                  if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 134218242;
                    *(_QWORD *)v93 = v29;
                    *(_WORD *)&v93[8] = 2112;
                    *(_QWORD *)&v93[10] = v60;
                    _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_INFO, "Failed to retrieve %tu moments for frequent location: %@", buf, 0x16u);
                  }
                }
              }
              else
              {

              }
              if (v24)
              {
                objc_msgSend(v61, "addNode:", v62);
                v65 = 0u;
                v66 = 0u;
                v63 = 0u;
                v64 = 0u;
                v36 = v26;
                v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v63, v91, 16);
                if (v37)
                {
                  v38 = *(_QWORD *)v64;
                  do
                  {
                    for (k = 0; k != v37; ++k)
                    {
                      if (*(_QWORD *)v64 != v38)
                        objc_enumerationMutation(v36);
                      objc_msgSend(v61, "addEdge:", *(_QWORD *)(*((_QWORD *)&v63 + 1) + 8 * k));
                    }
                    v37 = objc_msgSend(v36, "countByEnumeratingWithState:objects:count:", &v63, v91, 16);
                  }
                  while (v37);
                }

                v40 = -[PGGraphFrequentLocationAtEdge initFromFrequentLocationNode:toAddressNode:]([PGGraphFrequentLocationAtEdge alloc], "initFromFrequentLocationNode:toAddressNode:", v62, v24);
                objc_msgSend(v61, "addEdge:", v40);
                v18 = v17 + v18;
                if (v55)
                {
                  Current = CFAbsoluteTimeGetCurrent();
                  if (Current - v84[3] >= 0.01)
                  {
                    v84[3] = Current;
                    buf[0] = 0;
                    (*((void (**)(id, uint8_t *, double))v52 + 2))(v52, buf, v18 * 0.1 + 0.9);
                    v42 = *((_BYTE *)v88 + 24) | buf[0];
                    *((_BYTE *)v88 + 24) = v42;
                    if (v42)
                    {

                      goto LABEL_63;
                    }
                  }
                }

                v26 = v24;
              }
              else
              {
                v43 = self->_loggingConnection;
                if (os_log_type_enabled(v43, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  *(_QWORD *)v93 = v60;
                  _os_log_error_impl(&dword_1CA237000, v43, OS_LOG_TYPE_ERROR, "Failed to retrieve any centroid address node for frequent location: %@; Skipping ingest",
                    buf,
                    0xCu);
                }
              }

            }
            v57 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v71, v95, 16);
            if (v57)
              continue;
            break;
          }
        }

        if (v55)
        {
LABEL_63:
          v46 = CFAbsoluteTimeGetCurrent();
          if (v46 - v84[3] >= 0.01)
          {
            v84[3] = v46;
            v82 = 0;
            (*((void (**)(id, char *, double))v52 + 2))(v52, &v82, 1.0);
            v47 = *((_BYTE *)v88 + 24) | v82;
            *((_BYTE *)v88 + 24) = v47;
            if (v47)
            {
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 67109378;
                *(_DWORD *)v93 = 164;
                *(_WORD *)&v93[4] = 2080;
                *(_QWORD *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
                _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
              }
            }
          }
        }

        goto LABEL_68;
      }
      if (v15)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, loggingConnection, OS_LOG_TYPE_INFO, "No frequent location to ingest", buf, 2u);
      }
      if (v55)
      {
        v44 = CFAbsoluteTimeGetCurrent();
        if (v44 - v84[3] >= 0.01)
        {
          v84[3] = v44;
          v82 = 0;
          (*((void (**)(id, char *, double))v52 + 2))(v52, &v82, 1.0);
          v45 = *((_BYTE *)v88 + 24) | v82;
          *((_BYTE *)v88 + 24) = v45;
          if (v45)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v93 = 107;
              *(_WORD *)&v93[4] = 2080;
              *(_QWORD *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
              v12 = MEMORY[0x1E0C81028];
              goto LABEL_9;
            }
          }
        }
      }
    }
LABEL_68:

    goto LABEL_69;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v93 = 97;
    *(_WORD *)&v93[4] = 2080;
    *(_QWORD *)&v93[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_69:
  _Block_object_dispose(&v83, 8);
  _Block_object_dispose(&v87, 8);

}

- (id)processFrequentLocationWithGraph:(id)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, _BYTE *, double);
  double v8;
  char v9;
  id v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;
  double Current;
  char v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  OS_os_log *v23;
  uint64_t v24;
  void *v25;
  void (**v26)(void *, _BYTE *, double);
  void *v27;
  NSObject *v28;
  id v29;
  double v30;
  char v31;
  void *v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t *v37;
  uint64_t *v38;
  uint64_t v39;
  _QWORD v40[4];
  id v41;
  char v42;
  uint64_t v43;
  double *v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t *v48;
  uint64_t v49;
  char v50;
  uint8_t buf[4];
  _BYTE v52[14];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v34 = a3;
  v6 = a4;
  v7 = (void (**)(void *, _BYTE *, double))_Block_copy(v6);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = 0;
  v48 = &v47;
  v49 = 0x2020000000;
  v50 = 0;
  v43 = 0;
  v44 = (double *)&v43;
  v45 = 0x2020000000;
  v46 = 0;
  if (!v7
    || (v8 = CFAbsoluteTimeGetCurrent(), v8 - v44[3] < 0.01)
    || (v44[3] = v8, v42 = 0, v7[2](v7, &v42, 0.0), v9 = *((_BYTE *)v48 + 24) | v42, (*((_BYTE *)v48 + 24) = v9) == 0))
  {
    v11 = (void *)objc_opt_new();
    objc_msgSend(v34, "meNode");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = MEMORY[0x1E0C809B0];
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __89__PGGraphIngestFrequentLocationProcessor_processFrequentLocationWithGraph_progressBlock___block_invoke;
    v40[3] = &unk_1E84283C0;
    v14 = v11;
    v41 = v14;
    objc_msgSend(v12, "enumerateHomeOrWorkAddressNodesUsingBlock:", v40);
    if (v7)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v44[3] >= 0.01)
      {
        v44[3] = Current;
        v42 = 0;
        v7[2](v7, &v42, 0.1);
        v16 = *((_BYTE *)v48 + 24) | v42;
        *((_BYTE *)v48 + 24) = v16;
        if (v16)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v52 = 182;
            *(_WORD *)&v52[4] = 2080;
            *(_QWORD *)&v52[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v10 = v33;
          goto LABEL_27;
        }
      }
    }
    -[PGGraphBuilder photoLibrary](self->_graphBuilder, "photoLibrary", v33);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "librarySpecificFetchOptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentsWithOptions:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)MEMORY[0x1E0C99E60];
    objc_msgSend(v19, "fetchedObjects");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setWithArray:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    v23 = self->_loggingConnection;
    if (os_log_type_enabled((os_log_t)v23, OS_LOG_TYPE_INFO))
    {
      v24 = objc_msgSend(v22, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v52 = v24;
      _os_log_impl(&dword_1CA237000, (os_log_t)v23, OS_LOG_TYPE_INFO, "Processing frequent location for %tu moments", buf, 0xCu);
    }

    v25 = (void *)MEMORY[0x1E0D71768];
    v35[0] = v13;
    v35[1] = 3221225472;
    v35[2] = __89__PGGraphIngestFrequentLocationProcessor_processFrequentLocationWithGraph_progressBlock___block_invoke_173;
    v35[3] = &unk_1E8434F30;
    v26 = v7;
    v36 = v26;
    v37 = &v43;
    v38 = &v47;
    v39 = 0x3F847AE147AE147BLL;
    objc_msgSend(v25, "processFrequentLocationsWithItems:locationsOfInterest:progressBlock:", v22, v14, v35);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v48 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v52 = 193;
        *(_WORD *)&v52[4] = 2080;
        *(_QWORD *)&v52[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
        v28 = MEMORY[0x1E0C81028];
LABEL_18:
        _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
    }
    else
    {
      if (!v7
        || (v30 = CFAbsoluteTimeGetCurrent(), v30 - v44[3] < 0.01)
        || (v44[3] = v30,
            v42 = 0,
            v26[2](v26, &v42, 1.0),
            v31 = *((_BYTE *)v48 + 24) | v42,
            (*((_BYTE *)v48 + 24) = v31) == 0))
      {
        v29 = v27;
        goto LABEL_26;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v52 = 195;
        *(_WORD *)&v52[4] = 2080;
        *(_QWORD *)&v52[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
        v28 = MEMORY[0x1E0C81028];
        goto LABEL_18;
      }
    }
    v29 = v33;
LABEL_26:
    v10 = v29;

LABEL_27:
    goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v52 = 169;
    *(_WORD *)&v52[4] = 2080;
    *(_QWORD *)&v52[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Ingest/Ingest Processing/PGGraphIngestFrequentLocationProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  v10 = v33;
LABEL_28:
  _Block_object_dispose(&v43, 8);
  _Block_object_dispose(&v47, 8);

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_loggingConnection, 0);
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __89__PGGraphIngestFrequentLocationProcessor_processFrequentLocationWithGraph_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v5 = a2;
  v6 = objc_msgSend(a3, "isHome") ^ 1;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v7 = objc_alloc(MEMORY[0x1E0D71858]);
  objc_msgSend(v5, "location");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)objc_msgSend(v7, "initWithLocation:uncertainty:", v8, *MEMORY[0x1E0D71F18]);
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71850]), "initWithIdentifier:locationOfInterestType:typeRadius:routineLocation:mapItemLocation:", v11, v6, 0, v9, 250.0);
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v10);

}

void __89__PGGraphIngestFrequentLocationProcessor_processFrequentLocationWithGraph_progressBlock___block_invoke_173(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.9 + 0.1);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __126__PGGraphIngestFrequentLocationProcessor_processAndInsertFrequentLocationWithMomentNodes_inGraph_changeRequest_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.9);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __126__PGGraphIngestFrequentLocationProcessor_processAndInsertFrequentLocationWithMomentNodes_inGraph_changeRequest_progressBlock___block_invoke_159(uint64_t a1, void *a2)
{
  void *v2;
  id v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = a2;
  objc_msgSend(v3, "uuid");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, v4);

}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 6;
}

@end
