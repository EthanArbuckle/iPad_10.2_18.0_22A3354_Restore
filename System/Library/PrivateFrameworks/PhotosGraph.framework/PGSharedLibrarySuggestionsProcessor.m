@implementation PGSharedLibrarySuggestionsProcessor

- (PGSharedLibrarySuggestionsProcessor)initWithWorkingContext:(id)a3 libraryScope:(id)a4
{
  id v7;
  id v8;
  PGSharedLibrarySuggestionsProcessor *v9;
  PGSharedLibrarySuggestionsProcessor *v10;
  uint64_t v11;
  NSArray *libraryScopeRules;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)PGSharedLibrarySuggestionsProcessor;
  v9 = -[PGSharedLibrarySuggestionsProcessor init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_workingContext, a3);
    objc_storeStrong((id *)&v10->_libraryScope, a4);
    -[PGSharedLibrarySuggestionsProcessor _rulesForLibraryScope:](v10, "_rulesForLibraryScope:", v8);
    v11 = objc_claimAutoreleasedReturnValue();
    libraryScopeRules = v10->_libraryScopeRules;
    v10->_libraryScopeRules = (NSArray *)v11;

  }
  return v10;
}

- (BOOL)processSuggestionsFromStartDate:(id)a3 toDate:(id)a4 withError:(id *)a5 progressBlock:(id)a6
{
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  char v15;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  PGManagerWorkingContext *workingContext;
  NSObject *v24;
  id v25;
  NSObject *v26;
  uint32_t denom;
  uint32_t numer;
  NSObject *v29;
  NSObject *v30;
  double Current;
  char v32;
  uint64_t v34;
  uint64_t v35;
  os_signpost_id_t spid;
  NSObject *v37;
  char v38;
  _QWORD v39[5];
  id v40;
  id v41;
  NSObject *v42;
  id v43;
  uint8_t *v44;
  uint64_t *v45;
  uint64_t *v46;
  id *v47;
  uint64_t v48;
  mach_timebase_info info;
  uint64_t v50;
  double *v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t *v55;
  uint64_t v56;
  char v57;
  int v58;
  _QWORD v59[3];
  uint8_t buf[40];
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v13 = _Block_copy(v12);
  v54 = 0;
  v55 = &v54;
  v56 = 0x2020000000;
  v57 = 0;
  v50 = 0;
  v51 = (double *)&v50;
  v52 = 0x2020000000;
  v53 = 0;
  if (!v13
    || (v14 = CFAbsoluteTimeGetCurrent(), v14 - v51[3] < 0.01)
    || (v51[3] = v14,
        LOBYTE(v58) = 0,
        (*((void (**)(void *, int *, double))v13 + 2))(v13, &v58, 0.0),
        v15 = *((_BYTE *)v55 + 24) | v58,
        (*((_BYTE *)v55 + 24) = v15) == 0))
  {
    if (!-[NSArray count](self->_libraryScopeRules, "count"))
    {
      LOBYTE(a5) = 1;
      goto LABEL_34;
    }
    -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
    v16 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "compare:", v11) != -1)
    {
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)&buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(_QWORD *)&buf[14] = v11;
        _os_log_error_impl(&dword_1CA237000, v16, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] Invalid start date or end date: %@ - %@", buf, 0x16u);
        if (!a5)
          goto LABEL_33;
      }
      else if (!a5)
      {
LABEL_33:

        goto LABEL_34;
      }
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Invalid start date or end date: %@ - %@"), v10, v11);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      +[PGError errorWithCode:description:](PGError, "errorWithCode:description:", -1, v17);
      *a5 = (id)objc_claimAutoreleasedReturnValue();

      LOBYTE(a5) = 0;
      goto LABEL_33;
    }
    *(_QWORD *)buf = 0;
    *(_QWORD *)&buf[8] = buf;
    *(_QWORD *)&buf[16] = 0x2020000000;
    buf[24] = 1;
    v37 = v16;
    v18 = v16;
    v19 = os_signpost_id_generate(v18);
    v20 = v18;
    v21 = v20;
    spid = v19;
    v22 = v19 - 1;
    if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(v58) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v21, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PGSharedLibrarySuggestionsProcessor", ", (uint8_t *)&v58, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v35 = mach_absolute_time();
    workingContext = self->_workingContext;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsFromStartDate_toDate_withError_progressBlock___block_invoke;
    v39[3] = &unk_1E842E2B0;
    v39[4] = self;
    v40 = v10;
    v41 = v11;
    v24 = v21;
    v42 = v24;
    v44 = buf;
    v47 = a5;
    v25 = v13;
    v43 = v25;
    v45 = &v50;
    v48 = 0x3F847AE147AE147BLL;
    v46 = &v54;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v39);
    v16 = v37;
    if (*((_BYTE *)v55 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v58 = 67109378;
        LODWORD(v59[0]) = 104;
        WORD2(v59[0]) = 2080;
        *(_QWORD *)((char *)v59 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
        v26 = MEMORY[0x1E0C81028];
LABEL_19:
        _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v58, 0x12u);
      }
    }
    else
    {
      v34 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v29 = v24;
      v30 = v29;
      if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v29))
      {
        LOWORD(v58) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v30, OS_SIGNPOST_INTERVAL_END, spid, "PGSharedLibrarySuggestionsProcessor", ", (uint8_t *)&v58, 2u);
      }

      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        v58 = 136315394;
        v59[0] = "PGSharedLibrarySuggestionsProcessor";
        LOWORD(v59[1]) = 2048;
        *(double *)((char *)&v59[1] + 2) = (float)((float)((float)((float)(v34 - v35) * (float)numer) / (float)denom)
                                                 / 1000000.0);
        _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v58, 0x16u);
      }
      if (!v13
        || (Current = CFAbsoluteTimeGetCurrent(), Current - v51[3] < 0.01)
        || (v51[3] = Current,
            v38 = 0,
            (*((void (**)(id, char *, double))v25 + 2))(v25, &v38, 1.0),
            v32 = *((_BYTE *)v55 + 24) | v38,
            (*((_BYTE *)v55 + 24) = v32) == 0))
      {
        LOBYTE(a5) = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
        goto LABEL_32;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v58 = 67109378;
        LODWORD(v59[0]) = 107;
        WORD2(v59[0]) = 2080;
        *(_QWORD *)((char *)v59 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
        v26 = MEMORY[0x1E0C81028];
        goto LABEL_19;
      }
    }
    LOBYTE(a5) = 0;
LABEL_32:

    _Block_object_dispose(buf, 8);
    goto LABEL_33;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)&buf[4] = 64;
    *(_WORD *)&buf[8] = 2080;
    *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framew"
                          "ork/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  LOBYTE(a5) = 0;
LABEL_34:
  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(&v54, 8);

  return (char)a5;
}

- (BOOL)processSuggestionsForIncrementalChange:(id)a3 withError:(id *)a4 progressBlock:(id)a5
{
  id v8;
  void *v9;
  double v10;
  char v11;
  BOOL v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  os_signpost_id_t v19;
  NSObject *v20;
  NSObject *v21;
  unint64_t v22;
  PGManagerWorkingContext *workingContext;
  NSObject *v24;
  id v25;
  NSObject *v26;
  uint64_t v27;
  uint32_t denom;
  uint32_t numer;
  NSObject *v30;
  NSObject *v31;
  double Current;
  char v33;
  uint64_t v35;
  os_signpost_id_t spid;
  id v37;
  char v38;
  _QWORD v39[5];
  NSObject *v40;
  id v41;
  id v42;
  uint64_t *p_buf;
  uint64_t *v44;
  uint64_t *v45;
  id *v46;
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
  int v57;
  _QWORD v58[3];
  uint64_t buf;
  __int128 v60;
  char v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  v37 = a3;
  v8 = a5;
  v9 = _Block_copy(v8);
  v53 = 0;
  v54 = &v53;
  v55 = 0x2020000000;
  v56 = 0;
  v49 = 0;
  v50 = (double *)&v49;
  v51 = 0x2020000000;
  v52 = 0;
  if (!v9
    || (v10 = CFAbsoluteTimeGetCurrent(), v10 - v50[3] < 0.01)
    || (v50[3] = v10,
        LOBYTE(v57) = 0,
        (*((void (**)(void *, int *, double))v9 + 2))(v9, &v57, 0.0),
        v11 = *((_BYTE *)v54 + 24) | v57,
        (*((_BYTE *)v54 + 24) = v11) == 0))
  {
    -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (!-[NSArray count](self->_libraryScopeRules, "count"))
    {
      v12 = 1;
LABEL_31:

      goto LABEL_32;
    }
    v14 = objc_alloc_init(MEMORY[0x1E0C99E20]);
    objc_msgSend(v37, "uuidsOfMomentsToInsert");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unionSet:", v15);

    objc_msgSend(v37, "uuidsOfMomentsToUpdate");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "unionSet:", v16);

    v12 = 1;
    if (!objc_msgSend(v14, "count"))
    {
LABEL_30:

      goto LABEL_31;
    }
    buf = 0;
    *(_QWORD *)&v60 = &buf;
    *((_QWORD *)&v60 + 1) = 0x2020000000;
    v61 = 1;
    v17 = v13;
    v18 = v13;
    v19 = os_signpost_id_generate(v18);
    v20 = v18;
    v21 = v20;
    spid = v19;
    v22 = v19 - 1;
    if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v20))
    {
      LOWORD(v57) = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v21, OS_SIGNPOST_INTERVAL_BEGIN, spid, "PGSharedLibrarySuggestionsProcessorIncremental", ", (uint8_t *)&v57, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v35 = mach_absolute_time();
    workingContext = self->_workingContext;
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsForIncrementalChange_withError_progressBlock___block_invoke;
    v39[3] = &unk_1E842E2D8;
    v39[4] = self;
    v24 = v21;
    v40 = v24;
    v41 = v14;
    p_buf = &buf;
    v46 = a4;
    v25 = v9;
    v42 = v25;
    v44 = &v49;
    v47 = 0x3F847AE147AE147BLL;
    v45 = &v53;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v39);
    v13 = v17;
    if (*((_BYTE *)v54 + 24))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v57 = 67109378;
        LODWORD(v58[0]) = 164;
        WORD2(v58[0]) = 2080;
        *(_QWORD *)((char *)v58 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
        v26 = MEMORY[0x1E0C81028];
LABEL_15:
        _os_log_impl(&dword_1CA237000, v26, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v57, 0x12u);
      }
    }
    else
    {
      v27 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v30 = v24;
      v31 = v30;
      if (v22 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
      {
        LOWORD(v57) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v31, OS_SIGNPOST_INTERVAL_END, spid, "PGSharedLibrarySuggestionsProcessorIncremental", ", (uint8_t *)&v57, 2u);
      }

      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        v57 = 136315394;
        v58[0] = "PGSharedLibrarySuggestionsProcessorIncremental";
        LOWORD(v58[1]) = 2048;
        *(double *)((char *)&v58[1] + 2) = (float)((float)((float)((float)(v27 - v35) * (float)numer) / (float)denom)
                                                 / 1000000.0);
        _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v57, 0x16u);
      }
      if (!v9
        || (Current = CFAbsoluteTimeGetCurrent(), Current - v50[3] < 0.01)
        || (v50[3] = Current,
            v38 = 0,
            (*((void (**)(id, char *, double))v25 + 2))(v25, &v38, 1.0),
            v33 = *((_BYTE *)v54 + 24) | v38,
            (*((_BYTE *)v54 + 24) = v33) == 0))
      {
        v12 = *(_BYTE *)(v60 + 24) != 0;
        goto LABEL_29;
      }
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        v57 = 67109378;
        LODWORD(v58[0]) = 167;
        WORD2(v58[0]) = 2080;
        *(_QWORD *)((char *)v58 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Photo"
                                       "sGraph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
        v26 = MEMORY[0x1E0C81028];
        goto LABEL_15;
      }
    }
    v12 = 0;
LABEL_29:

    _Block_object_dispose(&buf, 8);
    goto LABEL_30;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    buf = 0x7104000202;
    LOWORD(v60) = 2080;
    *(_QWORD *)((char *)&v60 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGr"
                                    "aph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&buf, 0x12u);
  }
  v12 = 0;
LABEL_32:
  _Block_object_dispose(&v49, 8);
  _Block_object_dispose(&v53, 8);

  return v12;
}

- (BOOL)_processMomentNodes:(id)a3 withGraph:(id)a4 error:(id *)a5 progressBlock:(id)a6
{
  id v9;
  void *v10;
  double v11;
  char v12;
  BOOL v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  unint64_t v18;
  double v19;
  char v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  NSObject *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  uint64_t v33;
  void *v34;
  unint64_t v35;
  uint64_t v36;
  id v37;
  double v38;
  void *v39;
  double Current;
  char v41;
  int v42;
  uint64_t v43;
  void *v44;
  PHLibraryScope *libraryScope;
  _BOOL4 v46;
  id v47;
  uint64_t v48;
  double v49;
  char v50;
  void *v52;
  PGGraphMomentNodeCollection *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  id v60;
  void *v61;
  void *v62;
  void *v63;
  void *v65;
  void *v66;
  id v67;
  id v68;
  NSObject *oslog;
  id v70;
  _QWORD v71[4];
  id v72;
  uint64_t *v73;
  _QWORD v74[4];
  id v75;
  uint64_t *v76;
  uint64_t *v77;
  uint64_t *v78;
  _BYTE *v79;
  double v80;
  uint64_t v81;
  char v82;
  uint64_t v83;
  double *v84;
  uint64_t v85;
  uint64_t v86;
  uint64_t v87;
  double *v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t v91;
  uint64_t *v92;
  uint64_t v93;
  char v94;
  uint8_t v95[4];
  _BYTE v96[14];
  _BYTE buf[24];
  char v98;
  uint64_t v99;

  v99 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v67 = a4;
  v68 = a6;
  v10 = _Block_copy(v68);
  v91 = 0;
  v92 = &v91;
  v93 = 0x2020000000;
  v94 = 0;
  v87 = 0;
  v88 = (double *)&v87;
  v89 = 0x2020000000;
  v90 = 0;
  v65 = v9;
  if (v10
    && (v11 = CFAbsoluteTimeGetCurrent(), v11 - v88[3] >= 0.01)
    && (v88[3] = v11,
        LOBYTE(v83) = 0,
        (*((void (**)(void *, uint64_t *, double))v10 + 2))(v10, &v83, 0.0),
        v12 = *((_BYTE *)v92 + 24) | v83,
        (*((_BYTE *)v92 + 24) = v12) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)&buf[4] = 173;
      *(_WORD *)&buf[8] = 2080;
      *(_QWORD *)&buf[10] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fram"
                            "ework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
    }
    v13 = 0;
  }
  else
  {
    -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
    oslog = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "subsetWithEnoughFacesProcessed");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "subsetWithEnoughScenesProcessed");
    v66 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = v66;
    v16 = objc_msgSend(v66, "count");
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)&buf[4] = v16;
      _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Number of moment to evaluate with enough scene and faces processed: %zu", buf, 0xCu);
    }
    if (v16)
    {
      -[PGSharedLibrarySuggestionsProcessor evaluatorWithGraph:](self, "evaluatorWithGraph:", v67);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        *(_QWORD *)buf = 0;
        *(_QWORD *)&buf[8] = buf;
        *(_QWORD *)&buf[16] = 0x2020000000;
        v98 = 0;
        v83 = 0;
        v84 = (double *)&v83;
        v85 = 0x2020000000;
        v86 = 0x3FC999999999999ALL;
        v18 = objc_msgSend(v66, "count");
        if (v10
          && (v19 = CFAbsoluteTimeGetCurrent(), v19 - v88[3] >= 0.01)
          && (v88[3] = v19,
              v82 = 0,
              (*((void (**)(void *, char *, double))v10 + 2))(v10, &v82, v84[3]),
              v20 = *((_BYTE *)v92 + 24) | v82,
              (*((_BYTE *)v92 + 24) = v20) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v95 = 67109378;
            *(_DWORD *)v96 = 196;
            *(_WORD *)&v96[4] = 2080;
            *(_QWORD *)&v96[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v95, 0x12u);
          }
          v13 = 0;
        }
        else
        {
          objc_msgSend(v66, "temporarySet");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          v74[0] = MEMORY[0x1E0C809B0];
          v74[1] = 3221225472;
          v74[2] = __89__PGSharedLibrarySuggestionsProcessor__processMomentNodes_withGraph_error_progressBlock___block_invoke;
          v74[3] = &unk_1E842E300;
          v76 = &v83;
          v80 = 0.3 / (double)v18;
          v60 = v10;
          v75 = v60;
          v77 = &v87;
          v81 = 0x3F847AE147AE147BLL;
          v78 = &v91;
          v79 = buf;
          objc_msgSend(v17, "evaluateObjects:withResultEnumerationBlock:", v21, v74);
          v61 = (void *)objc_claimAutoreleasedReturnValue();
          v59 = v17;

          if (*((_BYTE *)v92 + 24))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v95 = 67109378;
              *(_DWORD *)v96 = 201;
              *(_WORD *)&v96[4] = 2080;
              *(_QWORD *)&v96[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGra"
                                   "ph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v95, 0x12u);
            }
            v13 = 0;
          }
          else
          {
            objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", v61);
            v58 = (void *)objc_claimAutoreleasedReturnValue();
            v22 = oslog;
            if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
            {
              v23 = objc_msgSend(v61, "count");
              *(_DWORD *)v95 = 134217984;
              *(_QWORD *)v96 = v23;
              _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Number of moments matched by evaluator: %zu", v95, 0xCu);
            }

            if (objc_msgSend(v58, "count"))
            {
              +[PGGraphHighlightTypeNodeCollection tripTypeNodesInGraph:](PGGraphHighlightTypeNodeCollection, "tripTypeNodesInGraph:", v67);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "highlightGroupNodes");
              v57 = (void *)objc_claimAutoreleasedReturnValue();
              v52 = v24;
              v53 = -[MAElementCollection initWithSet:graph:]([PGGraphMomentNodeCollection alloc], "initWithSet:graph:", v61, v67);
              -[PGGraphMomentNodeCollection highlightNodes](v53, "highlightNodes");
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v25, "highlightGroupNodes");
              v56 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v57, "collectionByIntersecting:", v56);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "count");
              v54 = v26;
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)v95 = 134217984;
                *(_QWORD *)v96 = v27;
                _os_log_impl(&dword_1CA237000, v22, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Number of matched trip highlights: %zu", v95, 0xCu);
              }
              if (v27)
              {
                v28 = v22;
                if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
                {
                  v29 = objc_msgSend(v58, "count");
                  *(_DWORD *)v95 = 134217984;
                  *(_QWORD *)v96 = v29;
                  _os_log_impl(&dword_1CA237000, v28, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Number of moments before trip matching: %zu", v95, 0xCu);
                }

                objc_msgSend(v26, "momentNodes");
                v30 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v30, "temporarySet");
                v31 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v58, "unionSet:", v31);

              }
              v32 = v22;
              if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
              {
                v33 = objc_msgSend(v58, "count");
                *(_DWORD *)v95 = 134217984;
                *(_QWORD *)v96 = v33;
                _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Total number of moments to suggest: %zu", v95, 0xCu);
              }

              -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
              v55 = (void *)objc_claimAutoreleasedReturnValue();
              -[PGSharedLibrarySuggestionsProcessor _momentsForMomentNodes:inPhotoLibrary:](self, "_momentsForMomentNodes:inPhotoLibrary:", v58);
              v34 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v34, "fetchedObjects");
              v63 = (void *)objc_claimAutoreleasedReturnValue();

              v35 = objc_msgSend(v63, "count");
              v84[3] = 0.5;
              v62 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v55);
              v36 = 0;
              v37 = 0;
              v38 = 0.4 / ((double)(v35 / 0x14) + 1.0);
              while (v35)
              {
                v39 = (void *)MEMORY[0x1CAA4EB2C]();
                v84[3] = v38 + v84[3];
                if (v10
                  && (Current = CFAbsoluteTimeGetCurrent(), Current - v88[3] >= 0.01)
                  && (v88[3] = Current,
                      v82 = 0,
                      (*((void (**)(id, char *, double))v60 + 2))(v60, &v82, v84[3]),
                      v41 = *((_BYTE *)v92 + 24) | v82,
                      (*((_BYTE *)v92 + 24) = v41) != 0))
                {
                  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v95 = 67109378;
                    *(_DWORD *)v96 = 239;
                    *(_WORD *)&v96[4] = 2080;
                    *(_QWORD *)&v96[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
                    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v95, 0x12u);
                  }
                  v42 = 1;
                }
                else
                {
                  if (v35 >= 0x14)
                    v43 = 20;
                  else
                    v43 = v35;
                  objc_msgSend(v63, "subarrayWithRange:", v36, v43);
                  v44 = (void *)objc_claimAutoreleasedReturnValue();
                  libraryScope = self->_libraryScope;
                  v71[0] = MEMORY[0x1E0C809B0];
                  v71[1] = 3221225472;
                  v71[2] = __89__PGSharedLibrarySuggestionsProcessor__processMomentNodes_withGraph_error_progressBlock___block_invoke_144;
                  v71[3] = &unk_1E842E328;
                  v72 = v68;
                  v73 = &v83;
                  v70 = v37;
                  v46 = -[PGSharedLibrarySuggestionsProcessor _suggestAssetsFromMoments:libraryScope:curationContext:progressBlock:error:](self, "_suggestAssetsFromMoments:libraryScope:curationContext:progressBlock:error:", v44, libraryScope, v62, v71, &v70);
                  v47 = v70;

                  if (v46)
                    v48 = v43;
                  else
                    v48 = 0;

                  v35 -= v48;
                  v36 += v48;
                  v42 = !v46;
                  v37 = v47;
                }
                objc_autoreleasePoolPop(v39);
                if (v42)
                  goto LABEL_50;
              }
              if (a5 && v37)
              {
                v37 = objc_retainAutorelease(v37);
                v13 = 0;
                *a5 = v37;
              }
              else
              {
                if (v10)
                {
                  v49 = CFAbsoluteTimeGetCurrent();
                  if (v49 - v88[3] >= 0.01)
                  {
                    v88[3] = v49;
                    v82 = 0;
                    (*((void (**)(id, char *, double))v60 + 2))(v60, &v82, 1.0);
                    v50 = *((_BYTE *)v92 + 24) | v82;
                    *((_BYTE *)v92 + 24) = v50;
                    if (v50)
                    {
                      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)v95 = 67109378;
                        *(_DWORD *)v96 = 256;
                        *(_WORD *)&v96[4] = 2080;
                        *(_QWORD *)&v96[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis"
                                             "/PhotosGraph/Framework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
                        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v95, 0x12u);
                      }
LABEL_50:
                      v13 = 0;
                      goto LABEL_61;
                    }
                  }
                }
                v13 = 1;
              }
LABEL_61:

            }
            else
            {
              v13 = 1;
            }

          }
          v17 = v59;
        }
        _Block_object_dispose(&v83, 8);
        _Block_object_dispose(buf, 8);
      }
      else
      {
        v13 = 1;
      }

      v15 = v66;
    }
    else
    {
      v13 = 1;
    }

  }
  _Block_object_dispose(&v87, 8);
  _Block_object_dispose(&v91, 8);

  return v13;
}

- (BOOL)_suggestAssetsFromMoments:(id)a3 libraryScope:(id)a4 curationContext:(id)a5 progressBlock:(id)a6 error:(id *)a7
{
  id v11;
  void (**v12)(void *, mach_timebase_info *, double);
  double v13;
  double Current;
  BOOL v15;
  NSObject *v16;
  os_signpost_id_t v17;
  NSObject *v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint32_t denom;
  uint32_t numer;
  NSObject *v30;
  NSObject *v31;
  id v32;
  id v33;
  double v34;
  void *v35;
  void *v36;
  unint64_t v37;
  double v38;
  void *v39;
  id v40;
  double v41;
  NSObject *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v49;
  id v50;
  char v51;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v54[18];
  uint64_t v55;

  v55 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v49 = a4;
  v50 = a5;
  v12 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(a6);
  v13 = 0.0;
  if (v12)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(info.numer) = 0;
      v12[2](v12, &info, 0.0);
      if (LOBYTE(info.numer))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v54 = 333;
          *(_WORD *)&v54[4] = 2080;
          *(_QWORD *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v15 = 0;
        goto LABEL_50;
      }
      v13 = Current;
    }
  }
  -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  v17 = os_signpost_id_generate(v16);
  v18 = v16;
  v19 = v18;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v18))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v19, OS_SIGNPOST_INTERVAL_BEGIN, v17, "PGSharedLibrarySuggestionsProcessorFetchAssetsFromMomentsBatch", ", buf, 2u);
  }

  info = 0;
  mach_timebase_info(&info);
  v20 = mach_absolute_time();
  objc_msgSend(v49, "photoLibrary");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "librarySpecificFetchOptions");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setFetchPropertySets:", v22);

  PLManagedAssetPredicateToFetchAssetsToEvaluateSuggestionsForLibraryScope();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setInternalPredicate:", v23);

  objc_msgSend(v21, "setWantsIncrementalChangeDetails:", 0);
  v15 = 1;
  objc_msgSend(v21, "setIncludeDuplicateAssetVisibilityStateMostRelevant:", 1);
  v45 = v21;
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsInAssetCollections:options:", v11, v21);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = v24;
  if (!objc_msgSend(v24, "count"))
  {
    v36 = v45;
    v35 = v46;
    goto LABEL_49;
  }
  v44 = v11;
  v25 = v20;
  objc_msgSend(MEMORY[0x1E0CD1390], "clsAllAssetsFromFetchResult:prefetchOptions:curationContext:", v24, 31, v50);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = mach_absolute_time();
  numer = info.numer;
  denom = info.denom;
  v30 = v19;
  v31 = v30;
  if (v17 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v30))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v31, OS_SIGNPOST_INTERVAL_END, v17, "PGSharedLibrarySuggestionsProcessorFetchAssetsFromMomentsBatch", ", buf, 2u);
  }
  v43 = v19;

  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 136315394;
    *(_QWORD *)v54 = "PGSharedLibrarySuggestionsProcessorFetchAssetsFromMomentsBatch";
    *(_WORD *)&v54[8] = 2048;
    *(double *)&v54[10] = (float)((float)((float)((float)(v27 - v25) * (float)numer) / (float)denom) / 1000000.0);
    _os_log_impl(&dword_1CA237000, v31, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
  }
  v32 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v33 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  if (v12)
  {
    v34 = CFAbsoluteTimeGetCurrent();
    v11 = v44;
    if (v34 - v13 >= 0.01)
    {
      v51 = 0;
      v12[2](v12, (mach_timebase_info *)&v51, 0.1);
      if (v51)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v54 = 355;
          *(_WORD *)&v54[4] = 2080;
          *(_QWORD *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v15 = 0;
        goto LABEL_47;
      }
      v13 = v34;
    }
  }
  if (!objc_msgSend(v26, "count", v19))
  {
LABEL_37:
    v15 = -[PGSharedLibrarySuggestionsProcessor _commitSuggestedAssets:rejectedAssets:libraryScope:error:](self, "_commitSuggestedAssets:rejectedAssets:libraryScope:error:", v32, v33, v49, a7);
    if (!v12)
      goto LABEL_46;
    v19 = v43;
    v11 = v44;
    v36 = v45;
    v35 = v46;
    if (CFAbsoluteTimeGetCurrent() - v13 >= 0.01)
    {
      v51 = 0;
      v12[2](v12, (mach_timebase_info *)&v51, 1.0);
      if (v51)
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v54 = 376;
          *(_WORD *)&v54[4] = 2080;
          *(_QWORD *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v15 = 0;
      }
    }
    goto LABEL_48;
  }
  v37 = 0;
  v38 = 0.1;
  while (1)
  {
    objc_msgSend(v26, "objectAtIndexedSubscript:", v37);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = objc_msgSend((id)objc_opt_class(), "shouldIncludeAsset:curationContext:rejectionReason:", v39, v50, 0)? v32: v33;
    objc_msgSend(v40, "addObject:", v39);
    if (50 * (v37 / 0x32) == v37)
    {
      if (!-[PGSharedLibrarySuggestionsProcessor _commitSuggestedAssets:rejectedAssets:libraryScope:error:](self, "_commitSuggestedAssets:rejectedAssets:libraryScope:error:", v32, v33, v49, a7))goto LABEL_45;
      objc_msgSend(v32, "removeAllObjects");
      objc_msgSend(v33, "removeAllObjects");
      v38 = v38 + 0.01;
      if (v12)
      {
        v41 = CFAbsoluteTimeGetCurrent();
        if (v41 - v13 >= 0.01)
          break;
      }
    }
LABEL_36:

    if (++v37 >= objc_msgSend(v26, "count"))
      goto LABEL_37;
  }
  v51 = 0;
  v12[2](v12, (mach_timebase_info *)&v51, v38);
  if (!v51)
  {
    v13 = v41;
    goto LABEL_36;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v54 = 372;
    *(_WORD *)&v54[4] = 2080;
    *(_QWORD *)&v54[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/SharedLibrary/PGSharedLibrarySuggestionsProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
LABEL_45:

  v15 = 0;
LABEL_46:
  v11 = v44;
LABEL_47:
  v19 = v43;
  v36 = v45;
  v35 = v46;
LABEL_48:

LABEL_49:
LABEL_50:

  return v15;
}

- (BOOL)_commitSuggestedAssets:(id)a3 rejectedAssets:(id)a4 libraryScope:(id)a5 error:(id *)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  os_signpost_id_t v14;
  NSObject *v15;
  NSObject *v16;
  unint64_t v17;
  void *v18;
  id v19;
  id v20;
  id v21;
  int v22;
  NSObject *v23;
  int v24;
  int v25;
  void *v26;
  NSObject *v27;
  uint64_t v28;
  uint32_t denom;
  uint32_t numer;
  NSObject *v31;
  NSObject *v32;
  void *v34;
  os_signpost_id_t spid;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  _QWORD v40[4];
  id v41;
  id v42;
  id v43;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v46[10];
  double v47[4];

  *(double *)((char *)&v47[2] + 2) = *(double *)MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (objc_msgSend(v10, "count") || objc_msgSend(v11, "count"))
  {
    -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
    v13 = (id)objc_claimAutoreleasedReturnValue();
    v14 = os_signpost_id_generate(v13);
    v15 = v13;
    v16 = v15;
    v17 = v14 - 1;
    if (v14 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v15))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v16, OS_SIGNPOST_INTERVAL_BEGIN, v14, "PGSharedLibrarySuggestionsProcessorPersistFromMomentsBatch", ", buf, 2u);
    }
    spid = v14;

    info = 0;
    mach_timebase_info(&info);
    v36 = mach_absolute_time();
    objc_msgSend(v12, "photoLibrary");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = MEMORY[0x1E0C809B0];
    v40[1] = 3221225472;
    v40[2] = __96__PGSharedLibrarySuggestionsProcessor__commitSuggestedAssets_rejectedAssets_libraryScope_error___block_invoke;
    v40[3] = &unk_1E842E350;
    v19 = v12;
    v41 = v19;
    v20 = v10;
    v42 = v20;
    v37 = v11;
    v21 = v11;
    v43 = v21;
    v39 = 0;
    v22 = objc_msgSend(v18, "performChangesAndWait:error:", v40, &v39);
    v38 = v39;
    if (v22)
    {
      v23 = v16;
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        v24 = objc_msgSend(v20, "count");
        v25 = objc_msgSend(v21, "count");
        objc_msgSend(v19, "localIdentifier");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v46 = v24;
        *(_WORD *)&v46[4] = 1024;
        *(_DWORD *)&v46[6] = v25;
        LOWORD(v47[0]) = 2112;
        *(_QWORD *)((char *)v47 + 2) = v26;
        _os_log_impl(&dword_1CA237000, v23, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] suggested %d, rejected %d assets for scope %@", buf, 0x18u);

      }
    }
    else
    {
      if (a6)
        *a6 = objc_retainAutorelease(v38);
      v27 = v16;
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        objc_msgSend(v19, "localIdentifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        *(_QWORD *)v46 = v34;
        *(_WORD *)&v46[8] = 2112;
        *(_QWORD *)&v47[0] = v38;
        _os_log_error_impl(&dword_1CA237000, v27, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] failed to suggestion assets for scope %@: %@", buf, 0x16u);

      }
    }

    v28 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v31 = v16;
    v32 = v31;
    if (v17 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v31))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v32, OS_SIGNPOST_INTERVAL_END, spid, "PGSharedLibrarySuggestionsProcessorPersistFromMomentsBatch", ", buf, 2u);
    }

    v11 = v37;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v46 = "PGSharedLibrarySuggestionsProcessorPersistFromMomentsBatch";
      *(_WORD *)&v46[8] = 2048;
      v47[0] = (float)((float)((float)((float)(v28 - v36) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }

  }
  else
  {
    LOBYTE(v22) = 1;
  }

  return v22;
}

- (id)_rulesForLibraryScope:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  id v13;
  void *v15;
  int v16;
  void *v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CD1600], "fetchLibraryScopeRulesForLibraryScope:options:", v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "count");
  v10 = v5;
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v4, "localIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412546;
      v17 = v12;
      v18 = 2048;
      v19 = objc_msgSend(v8, "count");
      _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] scope: %@, with %lu rules", (uint8_t *)&v16, 0x16u);

    }
    v13 = v8;
  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v4, "localIdentifier");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = 138412290;
      v17 = v15;
      _os_log_error_impl(&dword_1CA237000, v11, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] No rules in scope: %@", (uint8_t *)&v16, 0xCu);

    }
    v13 = 0;
  }

  return v13;
}

- (id)evaluatorWithGraph:(id)a3
{
  id v4;
  void *v5;
  NSArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  PGMomentNodeRuleInterpreter *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (-[NSArray count](self->_libraryScopeRules, "count"))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", -[NSArray count](self->_libraryScopeRules, "count"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v6 = self->_libraryScopeRules;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v16;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v10), "plRepresentation", (_QWORD)v15);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v11);

          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v8);
    }

    v12 = -[PGMomentNodeRuleInterpreter initWithGraph:]([PGMomentNodeRuleInterpreter alloc], "initWithGraph:", v4);
    v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71830]), "initWithRules:andInterpreter:", v5, v12);

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (id)_startDateFromLibraryScopeRules:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * i), "dateRangeCondition", (_QWORD)v14);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10 && objc_msgSend(v10, "criteria") == 2)
        {
          objc_msgSend(v11, "endDate");
          v12 = objc_claimAutoreleasedReturnValue();

          v4 = (void *)v12;
          goto LABEL_12;
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_12:

  return v4;
}

- (id)_momentsForMomentNodes:(id)a3 inPhotoLibrary:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  uint64_t v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v19;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v19 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v12), "localIdentifier", (_QWORD)v18);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (v13)
          objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v10);
  }

  objc_msgSend(v6, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = *MEMORY[0x1E0CD19C0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v22, 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFetchPropertySets:", v15);

  objc_msgSend(v14, "setWantsIncrementalChangeDetails:", 0);
  objc_msgSend(MEMORY[0x1E0CD13B8], "fetchAssetCollectionsWithLocalIdentifiers:options:", v7, v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_libraryScopeRules, 0);
  objc_storeStrong((id *)&self->_libraryScope, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

void __96__PGSharedLibrarySuggestionsProcessor__commitSuggestedAssets_rejectedAssets_libraryScope_error___block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CD15E8], "changeRequestForLibraryScope:", a1[4]);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addPreviewAssetsSuggestedByPhotos:", a1[5]);
  objc_msgSend(v2, "markAssetsAsRejectedByPhotosSuggester:", a1[6]);

}

void __89__PGSharedLibrarySuggestionsProcessor__processMomentNodes_withGraph_error_progressBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  double Current;
  uint64_t v9;

  v6 = a2;
  v7 = a4;
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = *(double *)(a1 + 72)
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                          + 24);
  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
    if (Current - *(double *)(v9 + 24) >= *(double *)(a1 + 80))
    {
      *(double *)(v9 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                               + 24));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 1;
    }
  }

}

uint64_t __89__PGSharedLibrarySuggestionsProcessor__processMomentNodes_withGraph_error_progressBlock___block_invoke_144(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, double))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24));
}

void __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsForIncrementalChange_withError_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  NSObject *v17;
  void *v18;
  _QWORD v19[4];
  id v20;
  __int128 v21;
  uint64_t v22;
  uint8_t buf[4];
  void *v24;
  __int16 v25;
  void *v26;
  __int16 v27;
  uint64_t v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_startDateFromLibraryScopeRules:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "compare:", v5) == -1)
  {
    objc_msgSend(v3, "graph");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGGraphMomentNodeCollection momentNodesForUUIDs:inGraph:](PGGraphMomentNodeCollection, "momentNodesForUUIDs:inGraph:", *(_QWORD *)(a1 + 48), v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");
    if (v9 == objc_msgSend(*(id *)(a1 + 48), "count"))
    {
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v4, v5);
      +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:", v10, v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "collectionByIntersecting:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v13 = objc_msgSend(v12, "count");
      v14 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v24 = v4;
        v25 = 2112;
        v26 = v5;
        v27 = 2048;
        v28 = v13;
        _os_log_impl(&dword_1CA237000, v14, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Number of incremental moment to evaluate between %@ and %@: %zu", buf, 0x20u);
      }
      if (v13)
      {
        v15 = *(void **)(a1 + 32);
        v16 = *(_QWORD *)(a1 + 88);
        v19[0] = MEMORY[0x1E0C809B0];
        v19[1] = 3221225472;
        v19[2] = __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsForIncrementalChange_withError_progressBlock___block_invoke_139;
        v19[3] = &unk_1E8434F30;
        v20 = *(id *)(a1 + 56);
        v22 = *(_QWORD *)(a1 + 96);
        v21 = *(_OWORD *)(a1 + 72);
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = objc_msgSend(v15, "_processMomentNodes:withGraph:error:progressBlock:", v12, v7, v16, v19);

      }
      v8 = v12;
    }
    else
    {
      v17 = *(NSObject **)(a1 + 40);
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        v18 = *(void **)(a1 + 48);
        *(_DWORD *)buf = 138412546;
        v24 = v18;
        v25 = 2112;
        v26 = v8;
        _os_log_error_impl(&dword_1CA237000, v17, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] Failed to fetch moment nodes for %@, fetched: %@. Stopping the task", buf, 0x16u);
      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = 0;
    }

  }
  else
  {
    v6 = *(NSObject **)(a1 + 40);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v24 = v4;
      v25 = 2112;
      v26 = v5;
      _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] Library start date is after end date: %@ - %@", buf, 0x16u);
    }
  }

}

void __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsForIncrementalChange_withError_progressBlock___block_invoke_139(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsFromStartDate_toDate_withError_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSObject *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  __int128 v18;
  uint64_t v19;
  uint8_t buf[4];
  void *v21;
  __int16 v22;
  uint64_t v23;
  __int16 v24;
  uint64_t v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_startDateFromLibraryScopeRules:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "laterDate:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "compare:", *(_QWORD *)(a1 + 48)) == -1)
  {
    objc_msgSend(v3, "graph");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3588]), "initWithStartDate:endDate:", v5, *(_QWORD *)(a1 + 48));
    +[PGGraphMomentNodeCollection momentNodesForLocalDateInterval:inGraph:](PGGraphMomentNodeCollection, "momentNodesForLocalDateInterval:inGraph:", v9, v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");
    v12 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      v21 = v5;
      v22 = 2112;
      v23 = v13;
      v24 = 2048;
      v25 = v11;
      _os_log_impl(&dword_1CA237000, v12, OS_LOG_TYPE_DEFAULT, "[PGSharedLibrarySuggestionsProcessor] Number of moment to evaluate between %@ and %@: %zu", buf, 0x20u);
    }
    if (v11)
    {
      v14 = *(void **)(a1 + 32);
      v15 = *(_QWORD *)(a1 + 96);
      v16[0] = MEMORY[0x1E0C809B0];
      v16[1] = 3221225472;
      v16[2] = __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsFromStartDate_toDate_withError_progressBlock___block_invoke_133;
      v16[3] = &unk_1E8434F30;
      v17 = *(id *)(a1 + 64);
      v19 = *(_QWORD *)(a1 + 104);
      v18 = *(_OWORD *)(a1 + 80);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8) + 24) = objc_msgSend(v14, "_processMomentNodes:withGraph:error:progressBlock:", v10, v8, v15, v16);

    }
  }
  else
  {
    v6 = *(NSObject **)(a1 + 56);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v7 = *(_QWORD *)(a1 + 48);
      *(_DWORD *)buf = 138412546;
      v21 = v5;
      v22 = 2112;
      v23 = v7;
      _os_log_error_impl(&dword_1CA237000, v6, OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] Interval start date is after end date: %@ - %@", buf, 0x16u);
    }
  }

}

void __102__PGSharedLibrarySuggestionsProcessor_processSuggestionsFromStartDate_toDate_withError_progressBlock___block_invoke_133(uint64_t a1, _BYTE *a2, double a3)
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
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(a3);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

+ (BOOL)shouldIncludeAsset:(id)a3 curationContext:(id)a4 rejectionReason:(id *)a5
{
  id v7;
  id v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  __CFString *v14;
  void *v16;
  char v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  int v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  void *v40;
  id v41;
  void *v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "curationScore");
  if (v9 < *MEMORY[0x1E0D77DE0])
  {
    v13 = 0;
    v14 = CFSTR("Utility Asset");
  }
  else
  {
    v10 = (void *)MEMORY[0x1E0D77E20];
    objc_msgSend(v7, "curationProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "importedByBundleIdentifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v10) = objc_msgSend(v10, "isBlocklistedImportedByBundleIdentifier:", v12);

    if ((v10 & 1) != 0)
    {
      v13 = 0;
      v14 = CFSTR("Imported Asset");
    }
    else if (objc_msgSend(v7, "isFavorite") && (objc_msgSend(v7, "clsIsUtility") & 1) != 0)
    {
      v13 = 0;
      v14 = CFSTR("Favorited Utility Asset");
    }
    else
    {
      objc_msgSend(v7, "curationModel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "isMemeWithAsset:", v7);

      if ((v17 & 1) != 0)
      {
        v13 = 0;
        v14 = CFSTR("Meme Asset");
      }
      else
      {
        objc_msgSend(v7, "clsConsolidatedPersonLocalIdentifiers");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "clsPetLocalIdentifiers");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "arrayByAddingObjectsFromArray:", v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v20, "count"))
        {
          v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          v36 = 0u;
          v37 = 0u;
          v38 = 0u;
          v39 = 0u;
          v35 = v20;
          v22 = v20;
          v23 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
          if (v23)
          {
            v24 = v23;
            v25 = *(_QWORD *)v37;
            do
            {
              for (i = 0; i != v24; ++i)
              {
                if (*(_QWORD *)v37 != v25)
                  objc_enumerationMutation(v22);
                objc_msgSend(MEMORY[0x1E0CD1698], "uuidFromLocalIdentifier:", *(_QWORD *)(*((_QWORD *)&v36 + 1) + 8 * i));
                v27 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v21, "addObject:", v27);

              }
              v24 = objc_msgSend(v22, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
            }
            while (v24);
          }

          objc_msgSend(v7, "uuid");
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "userFeedbackCalculator");
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = v28;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v42, 1);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          v40 = v28;
          v41 = v21;
          objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v41, &v40, 1);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v29, "scoreForAssetUUIDs:personsUUIDsByAssetUUIDs:", v30, v31);
          v33 = v32;

          v34 = objc_msgSend(MEMORY[0x1E0CD17F8], "score:meetsScoreThreshold:", v33, *MEMORY[0x1E0CD1E60]);
          if (v34)
            v14 = CFSTR("User Feedback");
          else
            v14 = 0;
          v13 = v34 ^ 1;

          v20 = v35;
        }
        else
        {
          v14 = 0;
          v13 = 1;
        }

      }
    }
  }
  if (a5)
    *a5 = v14;

  return v13;
}

+ (id)libraryScopeToUseWithPhotoLibrary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "librarySpecificFetchOptions");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CD15E0], "fetchActiveLibraryScopeWithOptions:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "firstObject");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v4, "count") >= 2 && os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v5, "localIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 138412290;
      v10 = v8;
      _os_log_error_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[PGSharedLibrarySuggestionsProcessor] more than 1 active scope configured, using first one: %@", (uint8_t *)&v9, 0xCu);

    }
    if (objc_msgSend(v5, "autoSharePolicy") == 2)
    {
      v6 = v5;
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PGSharedLibrarySuggestionsProcessor] active scope does not have rules", (uint8_t *)&v9, 2u);
      }
      v6 = 0;
    }

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "[PGSharedLibrarySuggestionsProcessor] no active scope", (uint8_t *)&v9, 2u);
    }
    v6 = 0;
  }

  return v6;
}

@end
