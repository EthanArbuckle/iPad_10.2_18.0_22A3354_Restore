@implementation PGGraphIngestPersonalAestheticsProcessor

- (PGGraphIngestPersonalAestheticsProcessor)initWithGraphBuilder:(id)a3
{
  id v5;
  PGGraphIngestPersonalAestheticsProcessor *v6;
  PGGraphIngestPersonalAestheticsProcessor *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PGGraphIngestPersonalAestheticsProcessor;
  v6 = -[PGGraphIngestPersonalAestheticsProcessor init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_graphBuilder, a3);

  return v7;
}

- (BOOL)shouldRunWithGraphUpdate:(id)a3
{
  int v3;

  v3 = objc_msgSend(a3, "isResumingFullAnalysis");
  if (v3)
    LOBYTE(v3) = +[PGUserDefaults isBehavioralCurationEnabled](PGUserDefaults, "isBehavioralCurationEnabled");
  return v3;
}

- (void)runWithGraphUpdate:(id)a3 progressBlock:(id)a4
{
  PGGraphBuilder *graphBuilder;
  id v6;
  NSObject *v7;
  os_signpost_id_t v8;
  NSObject *v9;
  NSObject *v10;
  unint64_t v11;
  uint64_t v12;
  void (**v13)(void *, _BYTE *, double);
  double v14;
  double v15;
  void *v16;
  void *v17;
  unint64_t v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint32_t denom;
  uint32_t numer;
  NSObject *v24;
  NSObject *v25;
  double v26;
  unint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double Current;
  NSObject *v35;
  void *v36;
  NSObject *v37;
  uint64_t v38;
  uint32_t v39;
  uint32_t v40;
  NSObject *v41;
  NSObject *v42;
  void *v43;
  void *v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  NSObject *v52;
  _BOOL4 v53;
  void *v55;
  NSObject *v56;
  uint64_t v57;
  uint32_t v58;
  uint32_t v59;
  NSObject *v60;
  NSObject *v61;
  void *v62;
  void *v63;
  void *v64;
  uint64_t v65;
  char v66;
  mach_timebase_info info;
  void *v68;
  uint8_t buf[4];
  _BYTE v70[18];
  uint64_t v71;

  v71 = *MEMORY[0x1E0C80C00];
  graphBuilder = self->_graphBuilder;
  v6 = a4;
  -[PGGraphBuilder loggingConnection](graphBuilder, "loggingConnection");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = os_signpost_id_generate(v7);
  v9 = v7;
  v10 = v9;
  v11 = v8 - 1;
  if (v8 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v9))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v10, OS_SIGNPOST_INTERVAL_BEGIN, v8, "PGGraphIngestPersonalAestheticsProcessor", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v12 = mach_absolute_time();
  v13 = (void (**)(void *, _BYTE *, double))_Block_copy(v6);

  v14 = 0.0;
  if (!v13 || (v15 = CFAbsoluteTimeGetCurrent(), v15 < 0.01))
  {
LABEL_10:
    -[PGGraphBuilder graph](self->_graphBuilder, "graph");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "infoNode");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "numberOfAssets");

    if (v18 <= 0x63)
    {
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "loggingConnection");
      v20 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "[Ingest Personal Aesthetics] Not enough assets in library, early exit", buf, 2u);
      }

      v21 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v24 = v10;
      v25 = v24;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v24))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v25, OS_SIGNPOST_INTERVAL_END, v8, "PGGraphIngestPersonalAestheticsProcessor", ", buf, 2u);
      }

      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v70 = "PGGraphIngestPersonalAestheticsProcessor";
        *(_WORD *)&v70[8] = 2048;
        *(double *)&v70[10] = (float)((float)((float)((float)(v21 - v12) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v25, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (v13)
      {
        if (CFAbsoluteTimeGetCurrent() - v14 >= 0.01)
        {
          v66 = 0;
          v13[2](v13, &v66, 1.0);
          if (v66)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v70 = 60;
              *(_WORD *)&v70[4] = 2080;
              *(_QWORD *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonalAestheticsProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }
      goto LABEL_67;
    }
    v65 = v12;
    v26 = (double)v18;
    v27 = (unint64_t)((double)v18 * 0.2);
    -[PGGraphBuilder photoLibrary](self->_graphBuilder, "photoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "librarySpecificFetchOptions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("overallAestheticScore != %f"), *MEMORY[0x1E0D781A0]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setInternalPredicate:", v30);

    objc_msgSend(v29, "setFetchLimit:", v27 + 1);
    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("overallAestheticScore"), 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v68 = v31;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v68, 1);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setSortDescriptors:", v32);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v29);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v33, "count") > v27)
    {
      if (v13)
      {
        Current = CFAbsoluteTimeGetCurrent();
        if (Current - v14 >= 0.01)
        {
          v66 = 0;
          v13[2](v13, &v66, 0.5);
          if (v66)
          {
            if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
LABEL_66:

LABEL_67:
              goto LABEL_68;
            }
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v70 = 81;
            *(_WORD *)&v70[4] = 2080;
            *(_QWORD *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonalAestheticsProcessor.m";
            v35 = MEMORY[0x1E0C81028];
LABEL_41:
            _os_log_impl(&dword_1CA237000, v35, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            goto LABEL_66;
          }
          v14 = Current;
        }
      }
      objc_msgSend(v33, "objectAtIndex:", (unint64_t)(v26 * 0.05));
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v64 = v33;
      objc_msgSend(v33, "objectAtIndex:", v27);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = v43;
      objc_msgSend(v43, "clsAestheticScore");
      v46 = v45;
      v62 = v44;
      objc_msgSend(v44, "clsAestheticScore");
      v48 = v47;
      objc_msgSend(MEMORY[0x1E0D77E18], "legacyAestheticScoreThresholdToNotBeJunk");
      v50 = v49;
      +[PGLogging sharedLogging](PGLogging, "sharedLogging");
      v51 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "loggingConnection");
      v52 = objc_claimAutoreleasedReturnValue();

      v53 = os_log_type_enabled(v52, OS_LOG_TYPE_INFO);
      if (v46 > v50 && v48 > v50)
      {
        if (v53)
        {
          *(_DWORD *)buf = 134217984;
          *(double *)v70 = v46;
          _os_log_impl(&dword_1CA237000, v52, OS_LOG_TYPE_INFO, "Personal High Aesthetics threshold is: %f", buf, 0xCu);
        }

        +[PGLogging sharedLogging](PGLogging, "sharedLogging");
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "loggingConnection");
        v56 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(double *)v70 = v48;
          _os_log_impl(&dword_1CA237000, v56, OS_LOG_TYPE_INFO, "Personal Good Aesthetics threshold is: %f", buf, 0xCu);
        }

        -[PGGraphBuilder persistPersonalHighAestheticsThreshold:personalGoodAestheticsThreshold:](self->_graphBuilder, "persistPersonalHighAestheticsThreshold:personalGoodAestheticsThreshold:", v46, v48);
      }
      else
      {
        if (v53)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v52, OS_LOG_TYPE_INFO, "High and Good Personal Aesthetics Score cannot be inferior to Utility Threshold -> can't save personal aesthetics thresholds", buf, 2u);
        }

      }
      v33 = v64;
      v57 = mach_absolute_time();
      v59 = info.numer;
      v58 = info.denom;
      v60 = v10;
      v61 = v60;
      if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v60))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v61, OS_SIGNPOST_INTERVAL_END, v8, "PGGraphIngestPersonalAestheticsProcessor", ", buf, 2u);
      }

      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v70 = "PGGraphIngestPersonalAestheticsProcessor";
        *(_WORD *)&v70[8] = 2048;
        *(double *)&v70[10] = (float)((float)((float)((float)(v57 - v65) * (float)v59) / (float)v58) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v61, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      if (v13)
      {
        if (CFAbsoluteTimeGetCurrent() - v14 >= 0.01)
        {
          v66 = 0;
          v13[2](v13, &v66, 1.0);
          if (v66)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 67109378;
              *(_DWORD *)v70 = 104;
              *(_WORD *)&v70[4] = 2080;
              *(_QWORD *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/Graph/Ingest/Ingest Processing/PGGraphIngestPersonalAestheticsProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
            }
          }
        }
      }

      goto LABEL_66;
    }
    +[PGLogging sharedLogging](PGLogging, "sharedLogging");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "loggingConnection");
    v37 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v37, OS_LOG_TYPE_INFO, "Ingest Personal Aesthetics]Not enough assets with aesthetic score, early exit", buf, 2u);
    }

    v38 = mach_absolute_time();
    v40 = info.numer;
    v39 = info.denom;
    v41 = v10;
    v42 = v41;
    if (v11 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v41))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v42, OS_SIGNPOST_INTERVAL_END, v8, "PGGraphIngestPersonalAestheticsProcessor", ", buf, 2u);
    }

    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v70 = "PGGraphIngestPersonalAestheticsProcessor";
      *(_WORD *)&v70[8] = 2048;
      *(double *)&v70[10] = (float)((float)((float)((float)(v38 - v65) * (float)v40) / (float)v39) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v42, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    if (!v13)
      goto LABEL_66;
    if (CFAbsoluteTimeGetCurrent() - v14 < 0.01)
      goto LABEL_66;
    v66 = 0;
    v13[2](v13, &v66, 1.0);
    if (!v66 || !os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      goto LABEL_66;
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v70 = 77;
    *(_WORD *)&v70[4] = 2080;
    *(_QWORD *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Ingest/Ingest Processing/PGGraphIngestPersonalAestheticsProcessor.m";
    v35 = MEMORY[0x1E0C81028];
    goto LABEL_41;
  }
  v66 = 0;
  v13[2](v13, &v66, 0.0);
  if (!v66)
  {
    v14 = v15;
    goto LABEL_10;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v70 = 51;
    *(_WORD *)&v70[4] = 2080;
    *(_QWORD *)&v70[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Graph/Ingest/Ingest Processing/PGGraphIngestPersonalAestheticsProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_68:

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_graphBuilder, 0);
}

@end
