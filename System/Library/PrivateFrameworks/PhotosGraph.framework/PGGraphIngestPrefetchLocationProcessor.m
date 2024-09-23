@implementation PGGraphIngestPrefetchLocationProcessor

- (PGGraphIngestPrefetchLocationProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestPrefetchLocationProcessor *v6;
  PGGraphIngestPrefetchLocationProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPrefetchLocationProcessor;
  v6 = -[PGGraphIngestPrefetchLocationProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  id v3;
  unint64_t v4;
  void *v5;

  v3 = a3;
  if ((objc_msgSend(v3, "hasMomentsToInsert") & 1) != 0)
  {
    LOBYTE(v4) = 1;
  }
  else
  {
    objc_msgSend(v3, "additionalLocationsToPrefetch");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
      LOBYTE(v4) = 1;
    else
      v4 = ((unint64_t)objc_msgSend(v3, "momentUpdateTypes") >> 2) & 1;

  }
  return v4;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  double v6;
  char v7;
  NSObject *v8;
  os_signpost_id_t v9;
  NSObject *v10;
  NSObject *v11;
  unint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  _BOOL8 v20;
  NSObject *v21;
  _BOOL8 v22;
  uint64_t v23;
  uint32_t denom;
  uint32_t numer;
  NSObject *v26;
  NSObject *v27;
  double Current;
  char v29;
  uint64_t v30;
  void *v31;
  os_signpost_id_t spid;
  void *v33;
  id v34;
  void *v35;
  id v36;
  char v37;
  _QWORD v38[4];
  id v39;
  uint64_t *v40;
  uint64_t *v41;
  uint64_t v42;
  _QWORD v43[4];
  id v44;
  uint64_t *v45;
  uint64_t *v46;
  uint64_t v47;
  mach_timebase_info info;
  uint64_t v49;
  double *v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t *v54;
  uint64_t v55;
  char v56;
  int buf;
  _QWORD v58[5];

  *(_QWORD *)((char *)&v58[2] + 4) = *MEMORY[0x1E0C80C00];
  v36 = a3;
  v34 = a4;
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x2020000000;
  v52 = 0;
  v35 = _Block_copy(v34);
  if (!v35
    || (v6 = CFAbsoluteTimeGetCurrent(), v6 - v50[3] < 0.01)
    || (v50[3] = v6,
        LOBYTE(info.numer) = 0,
        (*((void (**)(void *, mach_timebase_info *, double))v35 + 2))(v35, &info, 0.0),
        v7 = *((_BYTE *)v54 + 24) | LOBYTE(info.numer),
        (*((_BYTE *)v54 + 24) = v7) == 0))
  {
    -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    v9 = os_signpost_id_generate(v8);
    v10 = v8;
    v11 = v10;
    spid = v9;
    v12 = v9 - 1;
    if (v9 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v10))
    {
      LOWORD(buf) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "PGGraphIngestPrefetchLocationProcessor", ", (uint8_t *)&buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v30 = mach_absolute_time();
    objc_msgSend(v36, "momentsToProcessForMomentUpdateTypes:includeMomentsToIngest:", 4, 1);
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = MEMORY[0x1E0C809B0];
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __75__PGGraphIngestPrefetchLocationProcessor_runWithGraphUpdate_progressBlock___block_invoke;
    v43[3] = &unk_1E8434F30;
    v15 = v35;
    v44 = v15;
    v45 = &v49;
    v46 = &v53;
    v47 = 0x3F847AE147AE147BLL;
    v33 = (void *)v13;
    -[PGGraphIngestPrefetchLocationProcessor regionsWithMoments:progressBlock:](self, "regionsWithMoments:progressBlock:", v13, v43);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (*((_BYTE *)v54 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        buf = 67109378;
        LODWORD(v58[0]) = 73;
        WORD2(v58[0]) = 2080;
        *(_QWORD *)((char *)v58 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
      }
      goto LABEL_31;
    }
    objc_msgSend(v36, "additionalLocationsToPrefetch");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      objc_msgSend(v36, "additionalLocationsToPrefetch");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setByAddingObjectsFromSet:", v17);
      v18 = objc_claimAutoreleasedReturnValue();

      v16 = (void *)v18;
    }
    v38[0] = v14;
    v38[1] = 3221225472;
    v38[2] = __75__PGGraphIngestPrefetchLocationProcessor_runWithGraphUpdate_progressBlock___block_invoke_157;
    v38[3] = &unk_1E8434F30;
    v19 = v15;
    v39 = v19;
    v40 = &v49;
    v41 = &v53;
    v42 = 0x3F847AE147AE147BLL;
    v20 = -[PGGraphIngestPrefetchLocationProcessor prefetchLocationsWithRegions:loggingConnection:progressBlock:](self, "prefetchLocationsWithRegions:loggingConnection:progressBlock:", v16, v11, v38);
    if (*((_BYTE *)v54 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_30:

LABEL_31:
        goto LABEL_32;
      }
      buf = 67109378;
      LODWORD(v58[0]) = 85;
      WORD2(v58[0]) = 2080;
      *(_QWORD *)((char *)v58 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
      v21 = MEMORY[0x1E0C81028];
    }
    else
    {
      v22 = v20;
      if (objc_msgSend(v36, "isResumingFullAnalysis"))
        -[PGGraphBuilder setCanUseLocationDomain:](self->_graphBuilder, "setCanUseLocationDomain:", v22);
      v23 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v26 = v11;
      v27 = v26;
      if (v12 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v26))
      {
        LOWORD(buf) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v27, OS_SIGNPOST_INTERVAL_END, spid, "PGGraphIngestPrefetchLocationProcessor", ", (uint8_t *)&buf, 2u);
      }

      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        buf = 136315394;
        v58[0] = "PGGraphIngestPrefetchLocationProcessor";
        LOWORD(v58[1]) = 2048;
        *(double *)((char *)&v58[1] + 2) = (float)((float)((float)((float)(v23 - v30) * (float)numer) / (float)denom)
                                                 / 1000000.0);
        _os_log_impl(&dword_1CA237000, v27, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&buf, 0x16u);
      }
      if (!v35)
        goto LABEL_30;
      Current = CFAbsoluteTimeGetCurrent();
      if (Current - v50[3] < 0.01)
        goto LABEL_30;
      v50[3] = Current;
      v37 = 0;
      (*((void (**)(id, char *, double))v19 + 2))(v19, &v37, 1.0);
      v29 = *((_BYTE *)v54 + 24) | v37;
      *((_BYTE *)v54 + 24) = v29;
      if (!v29 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_30;
      buf = 67109378;
      LODWORD(v58[0]) = 93;
      WORD2(v58[0]) = 2080;
      *(_QWORD *)((char *)v58 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosG"
                                     "raph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
      v21 = MEMORY[0x1E0C81028];
    }
    _os_log_impl(&dword_1CA237000, v21, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 67109378;
    LODWORD(v58[0]) = 57;
    WORD2(v58[0]) = 2080;
    *(_QWORD *)((char *)v58 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
LABEL_32:
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

}

- (id)regionsWithMoments:(id)a3 progressBlock:(id)a4
{
  NSObject *v6;
  double v7;
  char v8;
  id v9;
  NSObject *v10;
  os_signpost_id_t v11;
  NSObject *v12;
  NSObject *v13;
  unint64_t v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  unint64_t v20;
  double v21;
  NSObject *v22;
  id v23;
  id v24;
  id v25;
  id v26;
  id v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  uint64_t v32;
  uint32_t denom;
  uint32_t numer;
  NSObject *v35;
  NSObject *v36;
  NSObject *v37;
  id v38;
  double v39;
  char v40;
  void (**v42)(id, _BYTE *, double);
  uint64_t v43;
  os_signpost_id_t spid;
  void *v45;
  void *v46;
  id aBlock;
  id v48;
  void *v49;
  char v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  _QWORD v55[4];
  NSObject *v56;
  id v57;
  id v58;
  id v59;
  id v60;
  _QWORD *v61;
  _QWORD *v62;
  uint64_t *v63;
  uint64_t *v64;
  uint64_t *v65;
  uint64_t v66;
  double v67;
  _QWORD v68[3];
  CFAbsoluteTime Current;
  _QWORD v70[4];
  mach_timebase_info info;
  uint64_t v72;
  double *v73;
  uint64_t v74;
  uint64_t v75;
  int v76;
  _QWORD v77[3];
  _BYTE v78[128];
  uint64_t v79;
  __int128 v80;
  uint64_t v81;
  uint64_t buf;
  uint64_t *p_buf;
  uint64_t v84;
  char v85;
  uint64_t v86;

  v86 = *MEMORY[0x1E0C80C00];
  v48 = a3;
  aBlock = a4;
  -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 67109120;
    HIDWORD(buf) = objc_msgSend(v48, "count");
    _os_log_impl(&dword_1CA237000, v6, OS_LOG_TYPE_DEFAULT, "[PGGraphIngestPrefetchLocationProcessor] Starting to cluster %d moments", (uint8_t *)&buf, 8u);
  }

  v49 = _Block_copy(aBlock);
  objc_msgSend(MEMORY[0x1E0C99E60], "set");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  buf = 0;
  p_buf = &buf;
  v84 = 0x2020000000;
  v85 = 0;
  v72 = 0;
  v73 = (double *)&v72;
  v74 = 0x2020000000;
  v75 = 0;
  if (!v49
    || (v7 = CFAbsoluteTimeGetCurrent(), v7 - v73[3] < 0.01)
    || (v73[3] = v7,
        LOBYTE(v70[0]) = 0,
        (*((void (**)(void *, _QWORD *, double))v49 + 2))(v49, v70, 0.0),
        v8 = *((_BYTE *)p_buf + 24) | LOBYTE(v70[0]),
        (*((_BYTE *)p_buf + 24) = v8) == 0))
  {
    -[PGGraphBuilder loggingConnection](self->_graphBuilder, "loggingConnection");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = os_signpost_id_generate(v10);
    v12 = v10;
    v13 = v12;
    spid = v11;
    v14 = v11 - 1;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v12))
    {
      LOWORD(v79) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v13, OS_SIGNPOST_INTERVAL_BEGIN, spid, "RegionsWithMoments", ", (uint8_t *)&v79, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v43 = mach_absolute_time();
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_alloc(MEMORY[0x1E0D77E08]);
    -[PGGraphBuilder photoLibrary](self->_graphBuilder, "photoLibrary");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v16, "initWithPhotoLibrary:", v17);

    -[PGGraphBuilder serviceManager](self->_graphBuilder, "serviceManager");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
      __assert_rtn("-[PGGraphIngestPrefetchLocationProcessor regionsWithMoments:progressBlock:]", "PGGraphIngestPrefetchLocationProcessor.m", 110, "serviceManager != nil");
    v79 = 0;
    *(_QWORD *)&v80 = &v79;
    *((_QWORD *)&v80 + 1) = 0x2020000000;
    v81 = 0;
    v20 = objc_msgSend(v48, "count");
    v70[0] = 0;
    v70[1] = v70;
    v70[2] = 0x2020000000;
    v70[3] = 0;
    v68[0] = 0;
    v68[1] = v68;
    v68[2] = 0x2020000000;
    Current = 0.0;
    v21 = 1.0 / (double)v20;
    Current = CFAbsoluteTimeGetCurrent();
    v55[0] = MEMORY[0x1E0C809B0];
    v55[1] = 3221225472;
    v55[2] = __75__PGGraphIngestPrefetchLocationProcessor_regionsWithMoments_progressBlock___block_invoke;
    v55[3] = &unk_1E8434F08;
    v61 = v70;
    v22 = v13;
    v56 = v22;
    v62 = v68;
    v23 = v49;
    v60 = v23;
    v63 = &v72;
    v64 = &v79;
    v65 = &buf;
    v66 = 0x3F847AE147AE147BLL;
    v24 = v18;
    v57 = v24;
    v67 = v21;
    v25 = v15;
    v58 = v25;
    v26 = v19;
    v59 = v26;
    objc_msgSend(v48, "enumerateObjectsUsingBlock:", v55);
    v42 = (void (**)(id, _BYTE *, double))v23;
    objc_msgSend(v26, "fetchImportantLocationsOfInterest");
    v53 = 0u;
    v54 = 0u;
    v51 = 0u;
    v52 = 0u;
    v27 = (id)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v78, 16);
    v45 = v24;
    if (v28)
    {
      v29 = *(_QWORD *)v52;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v52 != v29)
            objc_enumerationMutation(v27);
          objc_msgSend(*(id *)(*((_QWORD *)&v51 + 1) + 8 * i), "placemarkRegion");
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          if (v31)
            objc_msgSend(v25, "addObject:", v31);

        }
        v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v51, v78, 16);
      }
      while (v28);
    }

    v32 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v35 = v22;
    v36 = v35;
    if (v14 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v35))
    {
      LOWORD(v76) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v36, OS_SIGNPOST_INTERVAL_END, spid, "RegionsWithMoments", ", (uint8_t *)&v76, 2u);
    }

    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      v76 = 136315394;
      v77[0] = "RegionsWithMoments";
      LOWORD(v77[1]) = 2048;
      *(double *)((char *)&v77[1] + 2) = (float)((float)((float)((float)(v32 - v43) * (float)numer) / (float)denom)
                                               / 1000000.0);
      _os_log_impl(&dword_1CA237000, v36, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v76, 0x16u);
    }
    if (*((_BYTE *)p_buf + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v76 = 67109378;
        LODWORD(v77[0]) = 205;
        WORD2(v77[0]) = 2080;
        *(_QWORD *)((char *)v77 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
        v37 = MEMORY[0x1E0C81028];
LABEL_30:
        _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v76, 0x12u);
      }
    }
    else
    {
      if (!v49
        || (v39 = CFAbsoluteTimeGetCurrent(), v39 - v73[3] < 0.01)
        || (v73[3] = v39,
            v50 = 0,
            v42[2](v42, &v50, 1.0),
            v40 = *((_BYTE *)p_buf + 24) | v50,
            (*((_BYTE *)p_buf + 24) = v40) == 0))
      {
        v38 = v25;
        goto LABEL_38;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v76 = 67109378;
        LODWORD(v77[0]) = 207;
        WORD2(v77[0]) = 2080;
        *(_QWORD *)((char *)v77 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
        v37 = MEMORY[0x1E0C81028];
        goto LABEL_30;
      }
    }
    v38 = v46;
LABEL_38:
    v9 = v38;

    _Block_object_dispose(v68, 8);
    _Block_object_dispose(v70, 8);
    _Block_object_dispose(&v79, 8);

    goto LABEL_39;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    v79 = 0x6504000202;
    LOWORD(v80) = 2080;
    *(_QWORD *)((char *)&v80 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v79, 0x12u);
  }
  v9 = v46;
LABEL_39:
  _Block_object_dispose(&v72, 8);
  _Block_object_dispose(&buf, 8);

  return v9;
}

- (BOOL)prefetchLocationsWithRegions:(id)a3 loggingConnection:(id)a4 progressBlock:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void (**v11)(void *, int *, double);
  double Current;
  char v13;
  BOOL v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void (**v23)(void *, int *, double);
  char v24;
  id v25;
  NSObject *v26;
  uint8_t *v27;
  void *v29;
  void *v30;
  double v31;
  double v32;
  char v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id aBlock;
  char v40;
  id v41;
  _QWORD v42[4];
  void (**v43)(void *, int *, double);
  uint64_t *v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;
  double *v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  char v54;
  int v55;
  _QWORD v56[3];
  _QWORD buf[4];
  uint64_t v58;
  _QWORD v59[8];

  v59[5] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  aBlock = a5;
  v10 = v9;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf[0]) = 67109120;
    HIDWORD(buf[0]) = objc_msgSend(v8, "count");
    _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_DEFAULT, "[PGGraphIngestPrefetchLocationProcessor] Starting to prefetch locations for %d regions", (uint8_t *)buf, 8u);
  }

  v11 = (void (**)(void *, int *, double))_Block_copy(aBlock);
  v51 = 0;
  v52 = &v51;
  v53 = 0x2020000000;
  v54 = 0;
  v47 = 0;
  v48 = (double *)&v47;
  v49 = 0x2020000000;
  v50 = 0;
  if (v11)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current - v48[3] >= 0.01)
    {
      v48[3] = Current;
      LOBYTE(v55) = 0;
      v11[2](v11, &v55, 0.0);
      v13 = *((_BYTE *)v52 + 24) | v55;
      *((_BYTE *)v52 + 24) = v13;
      if (v13)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          buf[0] = 0xD904000202;
          LOWORD(buf[1]) = 2080;
          *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetch"
                                             "LocationProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
        }
        v14 = 0;
        goto LABEL_18;
      }
    }
  }
  if (objc_msgSend(v8, "count"))
  {
    -[PGGraphBuilder locationCache](self->_graphBuilder, "locationCache");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder aoiCache](self->_graphBuilder, "aoiCache");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder poiCache](self->_graphBuilder, "poiCache");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder roiCache](self->_graphBuilder, "roiCache");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGGraphBuilder natureCache](self->_graphBuilder, "natureCache");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B1C8]), "initWithLocationCache:", v15);
    v59[0] = v16;
    v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B108]), "initWithAOICache:locationCache:", v37, v15);
    v59[1] = v17;
    v18 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B220]), "initWithPOICache:locationCache:", v36, v15);
    v59[2] = v18;
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B250]), "initWithROICache:locationCache:", v35, v15);
    v59[3] = v19;
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B1F0]), "initWithNatureCache:locationCache:", v34, v15);
    v59[4] = v20;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v59, 5);
    v38 = (void *)objc_claimAutoreleasedReturnValue();

    v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B248]), "initWithQueryPerformers:", v38);
    objc_msgSend(v21, "setLoggingConnection:", v10);
    objc_msgSend(v8, "allObjects");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v42[0] = MEMORY[0x1E0C809B0];
    v42[1] = 3221225472;
    v42[2] = __103__PGGraphIngestPrefetchLocationProcessor_prefetchLocationsWithRegions_loggingConnection_progressBlock___block_invoke;
    v42[3] = &unk_1E8434F30;
    v23 = v11;
    v43 = v23;
    v44 = &v47;
    v45 = &v51;
    v46 = 0x3F847AE147AE147BLL;
    v41 = 0;
    v24 = objc_msgSend(v21, "createCacheForRegions:progressBlock:error:", v22, v42, &v41);
    v25 = v41;

    if (*((_BYTE *)v52 + 24))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_14:
        v14 = 0;
LABEL_15:

        goto LABEL_18;
      }
      buf[0] = 0xF504000202;
      LOWORD(buf[1]) = 2080;
      *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
      v26 = MEMORY[0x1E0C81028];
      v27 = (uint8_t *)buf;
LABEL_13:
      _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v27, 0x12u);
      goto LABEL_14;
    }
    v58 = 0;
    memset(buf, 0, sizeof(buf));
    objc_msgSend(v38, "firstObject");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
    {
      objc_msgSend(v29, "statistics");
    }
    else
    {
      v58 = 0;
      memset(buf, 0, sizeof(buf));
    }

    if (buf[0])
    {
      v31 = (double)(unint64_t)(buf[2] + buf[1]) / (double)buf[0];
      if (v31 >= 0.95)
      {
        v14 = 1;
        if ((v24 & 1) != 0)
          goto LABEL_31;
LABEL_30:
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        {
          v55 = 138412290;
          v56[0] = v25;
          _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "error creating the location cache: %@", (uint8_t *)&v55, 0xCu);
          if (!v11)
            goto LABEL_15;
LABEL_32:
          v32 = CFAbsoluteTimeGetCurrent();
          if (v32 - v48[3] < 0.01)
            goto LABEL_15;
          v48[3] = v32;
          v40 = 0;
          v23[2](v23, (int *)&v40, 1.0);
          v33 = *((_BYTE *)v52 + 24) | v40;
          *((_BYTE *)v52 + 24) = v33;
          if (!v33)
            goto LABEL_15;
          if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            goto LABEL_14;
          v55 = 67109378;
          LODWORD(v56[0]) = 266;
          WORD2(v56[0]) = 2080;
          *(_QWORD *)((char *)v56 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPrefetchLocationProcessor.m";
          v26 = MEMORY[0x1E0C81028];
          v27 = (uint8_t *)&v55;
          goto LABEL_13;
        }
LABEL_31:
        if (!v11)
          goto LABEL_15;
        goto LABEL_32;
      }
    }
    else
    {
      v31 = 0.0;
    }
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v55 = 134218240;
      *(double *)v56 = v31;
      LOWORD(v56[1]) = 2048;
      *(_QWORD *)((char *)&v56[1] + 2) = 0x3FEE666666666666;
      _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "Cannot use the domain location because the resolved location ratio is too small: %f <= %f", (uint8_t *)&v55, 0x16u);
    }
    v14 = 0;
    if ((v24 & 1) != 0)
      goto LABEL_31;
    goto LABEL_30;
  }
  v14 = 1;
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LOWORD(buf[0]) = 0;
    _os_log_impl(&dword_1CA237000, v10, OS_LOG_TYPE_INFO, "No location to resolve, returning YES to prefetch location succeeded", (uint8_t *)buf, 2u);
  }
LABEL_18:
  _Block_object_dispose(&v47, 8);
  _Block_object_dispose(&v51, 8);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

void __103__PGGraphIngestPrefetchLocationProcessor_prefetchLocationsWithRegions_loggingConnection_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.75);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __75__PGGraphIngestPrefetchLocationProcessor_regionsWithMoments_progressBlock___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  double Current;
  NSObject *v9;
  void *v10;
  double v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  char v25;
  uint64_t v26;
  double v27;
  _QWORD v28[4];
  id v29;
  id v30;
  char v31;
  _QWORD v32[4];
  id v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  _QWORD v39[4];
  uint8_t buf[4];
  int v41;
  __int16 v42;
  int v43;
  __int16 v44;
  double v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
  v7 = *(_QWORD *)(v6 + 24);
  if (0x8F5C28F5C28F5C29 * v7 <= 0xA3D70A3D70A3D70)
  {
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(NSObject **)(a1 + 32);
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      v26 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24);
      v27 = Current - *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24);
      *(_DWORD *)buf = 67109632;
      v41 = v26;
      v42 = 1024;
      v43 = 25;
      v44 = 2048;
      v45 = v27;
      _os_log_debug_impl(&dword_1CA237000, v9, OS_LOG_TYPE_DEBUG, "[PGGraphIngestPrefetchLocationProcessor] Clustered %d moments, batch of %d took %.2f seconds", buf, 0x18u);
    }
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = Current;
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
    v7 = *(_QWORD *)(v6 + 24);
  }
  *(_QWORD *)(v6 + 24) = v7 + 1;
  v10 = (void *)MEMORY[0x1CAA4EB2C]();
  if (*(_QWORD *)(a1 + 64)
    && (v11 = CFAbsoluteTimeGetCurrent(),
        v12 = *(_QWORD *)(*(_QWORD *)(a1 + 88) + 8),
        v11 - *(double *)(v12 + 24) >= *(double *)(a1 + 112))
    && (*(double *)(v12 + 24) = v11,
        buf[0] = 0,
        (*(void (**)(double))(*(_QWORD *)(a1 + 64) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                                 + 24)),
        (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24) |= buf[0]) != 0))
  {
    *a3 = 1;
  }
  else
  {
    objc_msgSend(v5, "photoLibrary");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "librarySpecificFetchOptions");
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = *MEMORY[0x1E0CD1A40];
    v39[0] = *MEMORY[0x1E0CD1960];
    v39[1] = v15;
    v16 = *MEMORY[0x1E0CD1958];
    v39[2] = *MEMORY[0x1E0CD19E0];
    v39[3] = v16;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v39, 4);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setFetchPropertySets:", v17);

    objc_msgSend(MEMORY[0x1E0D4B160], "feederPrefetchOptionsWithDefaultMode:", 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setLocationPrefetchMode:", 2);
    objc_msgSend(MEMORY[0x1E0D4B1B8], "feederForAssetCollection:options:feederPrefetchOptions:curationContext:", v5, v14, v18, *(_QWORD *)(a1 + 40));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLocationClusteringAlgorithm:", 0);
    v20 = MEMORY[0x1E0C809B0];
    v32[0] = MEMORY[0x1E0C809B0];
    v32[1] = 3221225472;
    v32[2] = __75__PGGraphIngestPrefetchLocationProcessor_regionsWithMoments_progressBlock___block_invoke_166;
    v32[3] = &unk_1E8434EB8;
    v34 = *(_QWORD *)(a1 + 96);
    v37 = *(_QWORD *)(a1 + 120);
    v21 = *(id *)(a1 + 64);
    v22 = *(_QWORD *)(a1 + 88);
    v33 = v21;
    v38 = *(_QWORD *)(a1 + 112);
    v23 = *(_QWORD *)(a1 + 104);
    v35 = v22;
    v36 = v23;
    objc_msgSend(v19, "locationClustersWithProgressBlock:", v32);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 104) + 8) + 24))
    {
      *a3 = 1;
    }
    else
    {
      objc_msgSend(v5, "gpsHorizontalAccuracy");
      v25 = objc_msgSend(MEMORY[0x1E0D71860], "horizontalAccuracyIsCoarse:") ^ 1;
      v28[0] = v20;
      v28[1] = 3221225472;
      v28[2] = __75__PGGraphIngestPrefetchLocationProcessor_regionsWithMoments_progressBlock___block_invoke_2;
      v28[3] = &unk_1E8434EE0;
      v29 = *(id *)(a1 + 48);
      v31 = v25;
      v30 = *(id *)(a1 + 56);
      objc_msgSend(v24, "enumerateKeysAndObjectsUsingBlock:", v28);
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8) + 24) = *(double *)(a1 + 120)
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 96) + 8)
                                                                              + 24);

    }
  }
  objc_autoreleasePoolPop(v10);

}

void __75__PGGraphIngestPrefetchLocationProcessor_regionsWithMoments_progressBlock___block_invoke_166(uint64_t a1, _BYTE *a2, double a3)
{
  double v6;
  double v7;
  double Current;
  uint64_t v9;

  if (*(_QWORD *)(a1 + 32))
  {
    v6 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
    v7 = *(double *)(a1 + 64);
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 72))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6 + v7 * a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __75__PGGraphIngestPrefetchLocationProcessor_regionsWithMoments_progressBlock___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "addObject:", v5);
  if (*(_BYTE *)(a1 + 48) && objc_msgSend(v6, "count"))
  {
    v27 = v5;
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "cls_universalDate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v8;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v31 = 0u;
    v26 = v6;
    v10 = v6;
    v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v29;
      v14 = v9;
      do
      {
        v15 = 0;
        v16 = v9;
        v17 = v14;
        do
        {
          if (*(_QWORD *)v29 != v13)
            objc_enumerationMutation(v10);
          objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v15), "cls_universalDate", v26);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "earlierDate:", v18);
          v14 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v16, "laterDate:", v18);
          v9 = (id)objc_claimAutoreleasedReturnValue();

          ++v15;
          v16 = v9;
          v17 = v14;
        }
        while (v12 != v15);
        v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v12);
    }
    else
    {
      v14 = v9;
    }

    v6 = v26;
    v5 = v27;
    if (v14 && v9)
    {
      v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v14, v9);
      v20 = objc_alloc(MEMORY[0x1E0C9E3B8]);
      objc_msgSend(v27, "center");
      v22 = v21;
      objc_msgSend(v27, "center");
      v23 = (void *)objc_msgSend(v20, "initWithLatitude:longitude:", v22);
      objc_msgSend(*(id *)(a1 + 40), "locationOfInterestCloseToLocation:inDateInterval:", v23, v19);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "placemarkRegion");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (v25)
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v25);

    }
  }

}

void __75__PGGraphIngestPrefetchLocationProcessor_runWithGraphUpdate_progressBlock___block_invoke(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __75__PGGraphIngestPrefetchLocationProcessor_runWithGraphUpdate_progressBlock___block_invoke_157(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3 * 0.8 + 0.2);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

@end
