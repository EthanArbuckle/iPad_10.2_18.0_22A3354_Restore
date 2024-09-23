@implementation PGGraphIngestAOIBlockingProcessor

- (PGGraphIngestAOIBlockingProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestAOIBlockingProcessor *v6;
  PGGraphIngestAOIBlockingProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestAOIBlockingProcessor;
  v6 = -[PGGraphIngestAOIBlockingProcessor init](&v9, sel_init);
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
  if ((objc_msgSend(v3, "isResumingFullAnalysis") & 1) != 0 || (objc_msgSend(v3, "hasMomentsToInsert") & 1) != 0)
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
  unint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  unint64_t v17;
  void *v18;
  os_signpost_id_t v19;
  id v20;
  uint64_t v21;
  id v22;
  void *v23;
  uint64_t v24;
  uint32_t denom;
  uint32_t numer;
  NSObject *v27;
  NSObject *v28;
  PGGraphIngestAOIBlockingProcessor *v29;
  void *v30;
  mach_timebase_info info;
  uint8_t buf[4];
  const char *v33;
  __int16 v34;
  double v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGGraphBuilder graph](self->_graphBuilder, "graph");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = os_signpost_id_generate(v9);
  v11 = v9;
  v12 = v11;
  v13 = v10 - 1;
  if (v10 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v11))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v10, "PGGraphIngestAOIBlockingProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v14 = mach_absolute_time();
  v29 = self;
  if (objc_msgSend(v6, "isResumingFullAnalysis"))
  {
    +[PGGraphNodeCollection nodesInGraph:](PGGraphAreaNodeCollection, "nodesInGraph:", v8);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v6, "momentNodesToProcessInGraph:forMomentUpdateTypes:includeInsertedNodes:", v8, objc_msgSend((id)objc_opt_class(), "requiredMomentUpdateTypes"), 1);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addressNodes");
    v17 = v10 - 1;
    v18 = v8;
    v19 = v10;
    v20 = v6;
    v21 = v14;
    v22 = v7;
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "areaNodes");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = v22;
    v14 = v21;
    v6 = v20;
    v10 = v19;
    v8 = v18;
    v13 = v17;

  }
  if (objc_msgSend(v15, "count", v29))
    objc_msgSend(v30, "processAOIBlockingWithAOINodes:graph:loggingConnection:progressBlock:", v15, v8, v12, v7);
  v24 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v27 = v12;
  v28 = v27;
  if (v13 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v27))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v28, OS_SIGNPOST_INTERVAL_END, v10, "PGGraphIngestAOIBlockingProcessor", ", buf, 2u);
  }

  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    v33 = "PGGraphIngestAOIBlockingProcessor";
    v34 = 2048;
    v35 = (float)((float)((float)((float)(v24 - v14) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }

}

- (void)processAOIBlockingWithAOINodes:(id)a3 graph:(id)a4 loggingConnection:(id)a5 progressBlock:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  char v15;
  void *v16;
  unint64_t v17;
  id v18;
  id v19;
  double Current;
  char v21;
  char v22;
  _QWORD v23[4];
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t *p_buf;
  uint64_t *v29;
  uint64_t *v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  double *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  _DWORD v41[2];
  __int16 v42;
  const char *v43;
  uint64_t buf;
  __int128 v45;
  uint64_t v46;
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v12 = a6;
  v13 = _Block_copy(v12);
  v37 = 0;
  v38 = &v37;
  v39 = 0x2020000000;
  v40 = 0;
  v33 = 0;
  v34 = (double *)&v33;
  v35 = 0x2020000000;
  v36 = 0;
  if (v13
    && (v14 = CFAbsoluteTimeGetCurrent(), v14 - v34[3] >= 0.01)
    && (v34[3] = v14,
        LOBYTE(v41[0]) = 0,
        (*((void (**)(void *, _DWORD *, double))v13 + 2))(v13, v41, 0.0),
        v15 = *((_BYTE *)v38 + 24) | LOBYTE(v41[0]),
        (*((_BYTE *)v38 + 24) = v15) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf = 0x4C04000202;
      LOWORD(v45) = 2080;
      *(_QWORD *)((char *)&v45 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photos"
                                      "Graph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestAOIBlockingProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    buf = 0;
    *(_QWORD *)&v45 = &buf;
    *((_QWORD *)&v45 + 1) = 0x2020000000;
    v46 = 0;
    v17 = objc_msgSend(v9, "count");
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke;
    v23[3] = &unk_1E84325F0;
    p_buf = &buf;
    v31 = (double)v17;
    v18 = v13;
    v27 = v18;
    v29 = &v33;
    v32 = 0x3F847AE147AE147BLL;
    v30 = &v37;
    v19 = v16;
    v24 = v19;
    v25 = v10;
    v26 = v11;
    objc_msgSend(v9, "enumerateNodesUsingBlock:", v23);
    if (v13)
    {
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v34[3] >= 0.01)
      {
        v34[3] = Current;
        v22 = 0;
        (*((void (**)(id, char *, double))v18 + 2))(v18, &v22, 1.0);
        v21 = *((_BYTE *)v38 + 24) | v22;
        *((_BYTE *)v38 + 24) = v21;
        if (v21)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            v41[0] = 67109378;
            v41[1] = 238;
            v42 = 2080;
            v43 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Grap"
                  "h/Ingest/Ingest Processing/PGGraphIngestAOIBlockingProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)v41, 0x12u);
          }
        }
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  double v7;
  double v8;
  double Current;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  unint64_t v15;
  uint64_t v16;
  id v17;
  id v18;
  id v19;
  id v20;
  unint64_t v21;
  unint64_t v22;
  double v23;
  BOOL v24;
  int v25;
  BOOL v26;
  BOOL v27;
  int v28;
  unsigned __int8 v29;
  BOOL v30;
  char v31;
  char v32;
  NSObject *v33;
  uint64_t v34;
  void *v35;
  const __CFString *v36;
  const __CFString *v37;
  const __CFString *v38;
  const __CFString *v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const __CFString *v44;
  const __CFString *v45;
  const __CFString *v46;
  const __CFString *v47;
  uint64_t v48;
  uint64_t v49;
  __int128 v50;
  int v51;
  _QWORD v52[4];
  id v53;
  id v54;
  id v55;
  id v56;
  __int128 v57;
  _QWORD *v58;
  __int128 v59;
  uint64_t *v60;
  uint64_t *v61;
  uint64_t *v62;
  uint64_t *v63;
  uint64_t *v64;
  double v65;
  uint64_t v66;
  uint64_t v67;
  _QWORD v68[4];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t *v74;
  uint64_t v75;
  char v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  char v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  uint64_t *v86;
  uint64_t v87;
  uint64_t v88;
  uint8_t buf[4];
  uint64_t v90;
  __int16 v91;
  const __CFString *v92;
  __int16 v93;
  const __CFString *v94;
  __int16 v95;
  const __CFString *v96;
  __int16 v97;
  const __CFString *v98;
  __int16 v99;
  const __CFString *v100;
  __int16 v101;
  uint64_t v102;
  __int16 v103;
  uint64_t v104;
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
  v7 = *(double *)(v6 + 24);
  v8 = *(double *)(a1 + 88);
  *(double *)(v6 + 24) = v7 + 1.0;
  if (!*(_QWORD *)(a1 + 56)
    || (Current = CFAbsoluteTimeGetCurrent(),
        v10 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8),
        Current - *(double *)(v10 + 24) < *(double *)(a1 + 96))
    || (*(double *)(v10 + 24) = Current,
        buf[0] = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))(v7 / v8),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8)
                                                                               + 24)) == 0))
  {
    if ((objc_msgSend(v5, "isBlocked") & 1) != 0)
      goto LABEL_49;
    v11 = (void *)MEMORY[0x1CAA4EB2C]();
    v85 = 0;
    v86 = &v85;
    v87 = 0x2020000000;
    v88 = 0;
    v81 = 0;
    v82 = &v81;
    v83 = 0x2020000000;
    v84 = 0;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v77 = 0;
    v78 = &v77;
    v79 = 0x2020000000;
    v80 = 0;
    v73 = 0;
    v74 = &v73;
    v75 = 0x2020000000;
    v76 = 0;
    v69 = 0;
    v70 = &v69;
    v71 = 0x2020000000;
    v72 = 0;
    objc_msgSend(v5, "collection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addressNodes");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_msgSend(v14, "count");
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    v68[3] = 0;
    v52[0] = MEMORY[0x1E0C809B0];
    v52[1] = 3221225472;
    v52[2] = __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke_2;
    v52[3] = &unk_1E84325C8;
    v58 = v68;
    v16 = *(_QWORD *)(a1 + 88);
    v65 = (double)v15;
    v66 = v16;
    v50 = *(_OWORD *)(a1 + 56);
    v17 = (id)v50;
    v57 = v50;
    v67 = *(_QWORD *)(a1 + 96);
    v59 = *(_OWORD *)(a1 + 72);
    v18 = v14;
    v53 = v18;
    v60 = &v77;
    v61 = &v73;
    v19 = v5;
    v54 = v19;
    v62 = &v69;
    v20 = v12;
    v55 = v20;
    v56 = *(id *)(a1 + 32);
    v63 = &v81;
    v64 = &v85;
    objc_msgSend(v18, "enumerateNodesUsingBlock:", v52);
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
    {
      *a3 = 1;
LABEL_48:

      _Block_object_dispose(v68, 8);
      _Block_object_dispose(&v69, 8);
      _Block_object_dispose(&v73, 8);
      _Block_object_dispose(&v77, 8);

      _Block_object_dispose(&v81, 8);
      _Block_object_dispose(&v85, 8);
      objc_autoreleasePoolPop(v11);
      goto LABEL_49;
    }
    v21 = v86[3];
    v22 = v82[3];
    v23 = (double)v21 / (double)v22;
    v24 = (double)(unint64_t)v70[3] / (double)v21 >= 0.4 && v21 > 1;
    v25 = v24;
    v26 = v24 || *((_BYTE *)v74 + 24) != 0;
    v27 = v23 < 0.95 || v22 == 0;
    v28 = !v27;
    LODWORD(v50) = v28;
    v29 = *((_BYTE *)v78 + 24);
    v30 = !v27 && v26;
    v31 = objc_msgSend(v19, "isBlocked", (_QWORD)v50);
    if (v29 | v30)
      v32 = v31;
    else
      v32 = 1;
    if ((v32 & 1) != 0)
    {
      if (!(v29 | v30))
      {
        v33 = *(id *)(a1 + 48);
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v19, "name");
          v42 = objc_claimAutoreleasedReturnValue();
          v43 = (void *)v42;
          v44 = CFSTR("YES");
          if (*((_BYTE *)v78 + 24))
            v45 = CFSTR("YES");
          else
            v45 = CFSTR("NO");
          if (*((_BYTE *)v74 + 24))
            v46 = CFSTR("YES");
          else
            v46 = CFSTR("NO");
          if (v25)
            v47 = CFSTR("YES");
          else
            v47 = CFSTR("NO");
          v48 = v86[3];
          if (!v51)
            v44 = CFSTR("NO");
          v49 = v82[3];
          *(_DWORD *)buf = 138414082;
          v90 = v42;
          v91 = 2112;
          v92 = CFSTR("NO");
          v93 = 2112;
          v94 = v45;
          v95 = 2112;
          v96 = v46;
          v97 = 2112;
          v98 = v47;
          v99 = 2112;
          v100 = v44;
          v101 = 2048;
          v102 = v48;
          v103 = 2048;
          v104 = v49;
          _os_log_debug_impl(&dword_1CA237000, v33, OS_LOG_TYPE_DEBUG, "Not blocking AOI %@: %@ (isVeryLarge %@, isUrban %@, hasManyAOIsAtSharedAddresses %@, isMatchingAddressRatio %@ (#AOI:%lu #Country:%lu))", buf, 0x52u);

        }
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {
      +[PGGraphAreaNode setIsBlocked:onNodeForIdentifier:inGraph:](PGGraphAreaNode, "setIsBlocked:onNodeForIdentifier:inGraph:", 1, objc_msgSend(v19, "identifier"), *(_QWORD *)(a1 + 40));
    }
    v33 = *(id *)(a1 + 48);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v19, "name");
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = (void *)v34;
      v36 = CFSTR("NO");
      if (*((_BYTE *)v78 + 24))
        v37 = CFSTR("YES");
      else
        v37 = CFSTR("NO");
      if (*((_BYTE *)v74 + 24))
        v38 = CFSTR("YES");
      else
        v38 = CFSTR("NO");
      if (v25)
        v39 = CFSTR("YES");
      else
        v39 = CFSTR("NO");
      v40 = v86[3];
      if (v51)
        v36 = CFSTR("YES");
      v41 = v82[3];
      *(_DWORD *)buf = 138414082;
      v90 = v34;
      v91 = 2112;
      v92 = CFSTR("YES");
      v93 = 2112;
      v94 = v37;
      v95 = 2112;
      v96 = v38;
      v97 = 2112;
      v98 = v39;
      v99 = 2112;
      v100 = v36;
      v101 = 2048;
      v102 = v40;
      v103 = 2048;
      v104 = v41;
      _os_log_impl(&dword_1CA237000, v33, OS_LOG_TYPE_INFO, "Blocking AOI %@: %@ (isVeryLarge %@, isUrban %@, hasManyAOIsAtSharedAddresses %@, isMatchingAddressRatio %@ (#AOI:%lu #Country:%lu))", buf, 0x52u);

    }
    goto LABEL_47;
  }
  *a3 = 1;
LABEL_49:

}

void __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke_2(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  double v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double Current;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  id v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  _QWORD v39[4];
  id v40;
  uint64_t v41;
  _QWORD v42[4];
  id v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  char v47;

  v5 = a2;
  v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + 8);
  v8 = *(double *)(v7 + 24);
  v10 = *(double *)(a1 + 144);
  v9 = *(double *)(a1 + 152);
  *(double *)(v7 + 24) = v8 + 1.0;
  if (*(_QWORD *)(a1 + 64)
    && (Current = CFAbsoluteTimeGetCurrent(),
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8),
        Current - *(double *)(v12 + 24) >= *(double *)(a1 + 160))
    && (*(double *)(v12 + 24) = Current,
        v47 = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))((v6 + v8 / v10) / v9),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                               + 24)) != 0))
  {
    *a3 = 1;
  }
  else
  {
    v13 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v5, "coordinate");
    v15 = v14;
    v17 = v16;
    v18 = *(void **)(a1 + 32);
    v19 = MEMORY[0x1E0C809B0];
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke_3;
    v42[3] = &unk_1E84325A0;
    v20 = v5;
    v45 = v15;
    v46 = v17;
    v21 = *(_QWORD *)(a1 + 104);
    v43 = v20;
    v44 = v21;
    objc_msgSend(v18, "enumerateNodesUsingBlock:", v42);
    *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24);
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
    {
      if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24))
      {
        objc_msgSend(v20, "collection");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "momentNodes");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "urbanRoiNodes");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 112) + 8) + 24) = objc_msgSend(v24, "isEmpty") ^ 1;

      }
      objc_msgSend(v20, "collection");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "areaNodes");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v39[0] = v19;
      v39[1] = 3221225472;
      v39[2] = __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke_4;
      v39[3] = &unk_1E8432D40;
      v27 = *(id *)(a1 + 40);
      v28 = *(_QWORD *)(a1 + 120);
      v40 = v27;
      v41 = v28;
      objc_msgSend(v26, "enumerateNodesUsingBlock:", v39);

      objc_msgSend(v20, "collection");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "countryNodes");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "anyNode");
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      if (v31 && (objc_msgSend(*(id *)(a1 + 48), "containsObject:", v31) & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 48), "addObject:", v31);
        objc_msgSend(v31, "UUID");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (v32
          && (objc_msgSend(*(id *)(a1 + 56), "objectForKeyedSubscript:", v32),
              v33 = (void *)objc_claimAutoreleasedReturnValue(),
              v34 = objc_msgSend(v33, "unsignedIntegerValue"),
              v33))
        {
          v35 = v34;
        }
        else
        {
          objc_msgSend(v31, "collection");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "addressNodes");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v35 = objc_msgSend(v37, "count");

          if (v32)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v35);
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(*(id *)(a1 + 56), "setObject:forKeyedSubscript:", v38, v32);

          }
          v33 = 0;
        }
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) += v35;

      }
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8) + 24);

    }
    objc_autoreleasePoolPop(v13);
  }

}

void __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke_3(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  void *v6;
  double v7;

  v5 = a2;
  v6 = (void *)MEMORY[0x1CAA4EB2C]();
  if ((objc_msgSend(*(id *)(a1 + 32), "isSameNodeAsNode:", v5) & 1) == 0)
  {
    objc_msgSend(v5, "coordinate");
    CLLocationCoordinate2DGetDistanceFrom();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v7 >= 250000.0;
    *a3 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  }
  objc_autoreleasePoolPop(v6);

}

uint64_t __106__PGGraphIngestAOIBlockingProcessor_processAOIBlockingWithAOINodes_graph_loggingConnection_progressBlock___block_invoke_4(uint64_t a1, void *a2)
{
  uint64_t result;

  result = objc_msgSend(a2, "isSameNodeAsNode:", *(_QWORD *)(a1 + 32));
  if ((result & 1) == 0)
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  return result;
}

+ (unint64_t)requiredMomentUpdateTypes
{
  return 4;
}

@end
