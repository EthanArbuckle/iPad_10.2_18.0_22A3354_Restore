@implementation PGSyndicationProcessor

- (PGSyndicationProcessor)initWithWorkingContext:(id)a3
{
  id v5;
  PGSyndicationProcessor *v6;
  PGSyndicationProcessor *v7;
  CLSCurationSession *v8;
  CLSCurationSession *curationSession;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGSyndicationProcessor;
  v6 = -[PGSyndicationProcessor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workingContext, a3);
    v8 = (CLSCurationSession *)objc_alloc_init(MEMORY[0x1E0D77E18]);
    curationSession = v7->_curationSession;
    v7->_curationSession = v8;

  }
  return v7;
}

- (PGSyndicationProcessor)initWithWorkingContext:(id)a3 syndicationLibrary:(id)a4
{
  id v7;
  PGSyndicationProcessor *v8;
  PGSyndicationProcessor *v9;

  v7 = a4;
  v8 = -[PGSyndicationProcessor initWithWorkingContext:](self, "initWithWorkingContext:", a3);
  v9 = v8;
  if (v8)
    objc_storeStrong((id *)&v8->_syndicationLibrary, a4);

  return v9;
}

- (id)syndicationPhotoLibraryWithError:(id *)a3
{
  PHPhotoLibrary *syndicationLibrary;
  PHPhotoLibrary *v6;
  id v7;
  BOOL v8;
  void *v9;
  NSObject *v10;
  PHPhotoLibrary *v12;
  id v13;
  uint8_t buf[4];
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  syndicationLibrary = self->_syndicationLibrary;
  if (syndicationLibrary)
    return syndicationLibrary;
  v13 = 0;
  objc_msgSend(MEMORY[0x1E0CD16F8], "openPhotoLibraryWithWellKnownIdentifier:error:", 3, &v13);
  v6 = (PHPhotoLibrary *)objc_claimAutoreleasedReturnValue();
  v7 = v13;
  if (v6)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    v12 = self->_syndicationLibrary;
    self->_syndicationLibrary = v6;

    syndicationLibrary = self->_syndicationLibrary;
    return syndicationLibrary;
  }
  v9 = v7;
  -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v15 = v9;
    _os_log_error_impl(&dword_1CA237000, v10, OS_LOG_TYPE_ERROR, "PGSyndicationProcessor: Failed to open syndicated library: %@", buf, 0xCu);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v9);

  return 0;
}

- (BOOL)processSyndicatedAssetCurationWithError:(id *)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, mach_timebase_info *, double);
  double v8;
  double Current;
  BOOL v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  unint64_t v18;
  _BOOL4 v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  double v24;
  unint64_t v25;
  double v26;
  double v27;
  unint64_t v28;
  uint64_t v29;
  void *v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  char v36;
  double v37;
  void *v38;
  double v39;
  uint64_t v40;
  uint32_t denom;
  uint32_t numer;
  NSObject *v43;
  NSObject *v44;
  NSObject *v45;
  os_signpost_id_t spid;
  uint64_t v48;
  unint64_t v49;
  NSObject *v50;
  void *v51;
  NSObject *v52;
  id v53;
  unint64_t v54;
  PGSyndicationProcessor *v55;
  void *v56;
  void *v57;
  void *v58;
  void *context;
  char v60;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v63[18];
  uint64_t v64;

  v64 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(void *, mach_timebase_info *, double))_Block_copy(v6);
  v8 = 0.0;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      LOBYTE(info.numer) = 0;
      v7[2](v7, &info, 0.0);
      if (LOBYTE(info.numer))
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)v63 = 87;
          *(_WORD *)&v63[4] = 2080;
          *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/F"
                               "ramework/Syndication/PGSyndicationProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = 0;
        goto LABEL_61;
      }
      v8 = Current;
    }
  }
  -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
  v11 = objc_claimAutoreleasedReturnValue();
  -[PGSyndicationProcessor syndicationPhotoLibraryWithError:](self, "syndicationPhotoLibraryWithError:", a3);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
  {
    if (v7)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        LOBYTE(info.numer) = 0;
        v7[2](v7, &info, 1.0);
        if (LOBYTE(info.numer))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v63 = 93;
            *(_WORD *)&v63[4] = 2080;
            *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Syndication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    v10 = 0;
    goto LABEL_60;
  }
  objc_msgSend(v12, "librarySpecificFetchOptions");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D77E50], "internalPredicateToFilterSyndicatedAssetsEligibleForCurationProcessing");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setInternalPredicate:", v15);

  +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFetchPropertySets:", v16);

  objc_msgSend(v14, "setIncludeGuestAssets:", 1);
  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");
  v19 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (!v18)
  {
    if (v19)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: No asset eligible for curation processing", buf, 2u);
    }
    if (v7
      && CFAbsoluteTimeGetCurrent() - v8 >= 0.01
      && (LOBYTE(info.numer) = 0, v7[2](v7, &info, 1.0), LOBYTE(info.numer)))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v63 = 106;
        *(_WORD *)&v63[4] = 2080;
        *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/Syndication/PGSyndicationProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      v10 = 0;
    }
    else
    {
      v10 = 1;
    }
    goto LABEL_59;
  }
  if (v19)
  {
    *(_DWORD *)buf = 134217984;
    *(_QWORD *)v63 = v18;
    _os_log_impl(&dword_1CA237000, v11, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: %tu asset(s) eligible for curation processing", buf, 0xCu);
  }
  v52 = v11;
  v53 = v6;
  v20 = v11;
  v21 = os_signpost_id_generate(v20);
  v22 = v20;
  v23 = v22;
  v49 = v21 - 1;
  if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v22))
  {
    *(_WORD *)buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1CA237000, v23, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PGSyndicationProcessorAssetCuration", ", buf, 2u);
  }
  spid = v21;
  v50 = v23;

  info = 0;
  mach_timebase_info(&info);
  v48 = mach_absolute_time();
  v58 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D77E08]), "initWithPhotoLibrary:", v13);
  v24 = 1.0 / (double)v18;
  v51 = v17;
  objc_msgSend(v17, "fetchedObjects");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = 0;
  v26 = *MEMORY[0x1E0D77DF0];
  v27 = 0.0;
  v55 = self;
  v56 = v13;
  v54 = v18;
  while (1)
  {
    context = (void *)MEMORY[0x1CAA4EB2C]();
    v28 = v25 + 200;
    v29 = v25 + 200 <= v18 ? 200 : v18 - v25;
    objc_msgSend(v57, "subarrayWithRange:", v25, v29, spid);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1390], "prefetchOnAssets:options:curationContext:", v30, 13, v58);
    if (objc_msgSend(v30, "count"))
      break;
LABEL_28:
    v13 = v56;
    -[PGSyndicationProcessor _persistCurationScores:inPhotoLibrary:](v55, "_persistCurationScores:inPhotoLibrary:", v31, v56);

    objc_autoreleasePoolPop(context);
    v25 = v28;
    v18 = v54;
    if (v28 >= v54)
    {
      v40 = mach_absolute_time();
      numer = info.numer;
      denom = info.denom;
      v43 = v50;
      v44 = v50;
      v45 = v44;
      if (v49 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v45, OS_SIGNPOST_INTERVAL_END, spid, "PGSyndicationProcessorAssetCuration", ", buf, 2u);
      }

      v11 = v52;
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        *(_QWORD *)v63 = "PGSyndicationProcessorAssetCuration";
        *(_WORD *)&v63[8] = 2048;
        *(double *)&v63[10] = (float)((float)((float)((float)(v40 - v48) * (float)numer) / (float)denom) / 1000000.0);
        _os_log_impl(&dword_1CA237000, v45, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
      }
      v17 = v51;
      if (v7)
      {
        v6 = v53;
        if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01 && (v60 = 0, v7[2](v7, (mach_timebase_info *)&v60, 1.0), v60))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)v63 = 154;
            *(_WORD *)&v63[4] = 2080;
            *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph"
                                 "/Framework/Syndication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
          v10 = 0;
        }
        else
        {
          v10 = 1;
        }
      }
      else
      {
        v10 = 1;
        v6 = v53;
      }
      goto LABEL_49;
    }
  }
  v32 = 0;
  while (1)
  {
    v33 = (void *)MEMORY[0x1CAA4EB2C]();
    objc_msgSend(v30, "objectAtIndexedSubscript:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "curationModel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v36 = objc_msgSend(v35, "isUtilityForSyndicationWithAsset:", v34);
    v37 = v26;
    if ((v36 & 1) == 0)
      objc_msgSend(v34, "scoreInContext:", 0, v26);
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "setObject:forKeyedSubscript:", v38, v34);

    v27 = v24 + v27;
    if (!v7)
      goto LABEL_27;
    v39 = CFAbsoluteTimeGetCurrent();
    if (v39 - v8 < 0.01)
      goto LABEL_27;
    v60 = 0;
    v7[2](v7, (mach_timebase_info *)&v60, v27);
    if (v60)
      break;
    v8 = v39;
LABEL_27:

    objc_autoreleasePoolPop(v33);
    if (++v32 >= (unint64_t)objc_msgSend(v30, "count"))
      goto LABEL_28;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v63 = 147;
    *(_WORD *)&v63[4] = 2080;
    *(_QWORD *)&v63[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/Syndication/PGSyndicationProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }

  objc_autoreleasePoolPop(v33);
  objc_autoreleasePoolPop(context);
  v10 = 0;
  v11 = v52;
  v6 = v53;
  v13 = v56;
  v17 = v51;
  v43 = v50;
LABEL_49:

LABEL_59:
LABEL_60:

LABEL_61:
  return v10;
}

- (void)_persistCurationScores:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  char v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  uint8_t buf[4];
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  if (objc_msgSend(v6, "count"))
  {
    -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
    v8 = objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __64__PGSyndicationProcessor__persistCurationScores_inPhotoLibrary___block_invoke;
    v12[3] = &unk_1E8435668;
    v13 = v6;
    v11 = 0;
    v9 = objc_msgSend(v7, "performChangesAndWait:error:", v12, &v11);
    v10 = v11;
    if ((v9 & 1) == 0 && os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v15 = v10;
      _os_log_error_impl(&dword_1CA237000, v8, OS_LOG_TYPE_ERROR, "PGSyndicationProcessor: Error saving curation scores to database: %@", buf, 0xCu);
    }

  }
}

- (BOOL)processSavedSyndicatedAssetsWithError:(id *)a3 progressBlock:(id)a4
{
  id v6;
  void *v7;
  double v8;
  char v9;
  BOOL v10;
  void *v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  _BOOL4 v35;
  unint64_t v36;
  void *v37;
  double v38;
  char v39;
  id v40;
  uint64_t v41;
  uint32_t denom;
  uint32_t numer;
  NSObject *v44;
  NSObject *v45;
  double Current;
  char v47;
  double v48;
  char v49;
  double v50;
  char v51;
  uint64_t v53;
  uint32_t v54;
  uint32_t v55;
  NSObject *v56;
  NSObject *v57;
  double v58;
  char v59;
  uint64_t v60;
  uint32_t v61;
  uint32_t v62;
  NSObject *v63;
  NSObject *v64;
  id *v65;
  uint64_t v66;
  os_signpost_id_t spid;
  void *v68;
  void *v69;
  void *v70;
  unint64_t v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  NSObject *oslog;
  void *v77;
  char v78;
  id v79;
  _QWORD v80[4];
  id v81;
  id v82;
  _QWORD *v83;
  uint64_t *v84;
  uint64_t *v85;
  unint64_t v86;
  double v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  mach_timebase_info info;
  uint64_t v94;
  double *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t v98;
  uint64_t *v99;
  uint64_t v100;
  char v101;
  int v102;
  _QWORD v103[3];
  _QWORD buf[5];
  _QWORD v105[4];
  uint64_t v106;
  _BYTE v107[128];
  _QWORD v108[4];

  v108[1] = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = _Block_copy(v6);
  v98 = 0;
  v99 = &v98;
  v100 = 0x2020000000;
  v101 = 0;
  v94 = 0;
  v95 = (double *)&v94;
  v96 = 0x2020000000;
  v97 = 0;
  v74 = v6;
  if (v7
    && (v8 = CFAbsoluteTimeGetCurrent(), v8 - v95[3] >= 0.01)
    && (v95[3] = v8,
        LOBYTE(v102) = 0,
        (*((void (**)(void *, int *, double))v7 + 2))(v7, &v102, 0.0),
        v9 = *((_BYTE *)v99 + 24) | v102,
        (*((_BYTE *)v99 + 24) = v9) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf[0] = 0xB904000202;
      LOWORD(buf[1]) = 2080;
      *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Syndication/PGSyndicationProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
    }
    v10 = 0;
  }
  else
  {
    -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGSyndicationProcessor syndicationPhotoLibraryWithError:](self, "syndicationPhotoLibraryWithError:", a3);
    v75 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v11;
    if (v75)
    {
      v65 = a3;
      v12 = v11;
      v13 = os_signpost_id_generate(v12);
      v14 = v12;
      v15 = v14;
      spid = v13;
      v71 = v13 - 1;
      if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
      {
        LOWORD(buf[0]) = 0;
        _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "PGSyndicationSavedSyndicatedAssets", ", (uint8_t *)buf, 2u);
      }
      oslog = v15;

      info = 0;
      mach_timebase_info(&info);
      v66 = mach_absolute_time();
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("additionalAttributes.syndicationIdentifier != nil"));
      v72 = (void *)objc_claimAutoreleasedReturnValue();
      -[PGManagerWorkingContext photoLibrary](self->_workingContext, "photoLibrary");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "librarySpecificFetchOptions");
      v77 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v77, "setInternalPredicate:", v72);
      v17 = *MEMORY[0x1E0CD1978];
      v108[0] = *MEMORY[0x1E0CD1978];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v108, 1);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v77, "setFetchPropertySets:", v18);

      objc_msgSend(v77, "setIncludeGuestAssets:", 0);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v77);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      v91 = 0u;
      v92 = 0u;
      v89 = 0u;
      v90 = 0u;
      v21 = v19;
      v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v89, v107, 16);
      if (v22)
      {
        v23 = *(_QWORD *)v90;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v90 != v23)
              objc_enumerationMutation(v21);
            objc_msgSend(*(id *)(*((_QWORD *)&v89 + 1) + 8 * i), "curationProperties");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "syndicationIdentifier");
            v26 = (void *)objc_claimAutoreleasedReturnValue();

            if (objc_msgSend(v26, "length"))
              objc_msgSend(v20, "addObject:", v26);

          }
          v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v89, v107, 16);
        }
        while (v22);
      }

      if (objc_msgSend(v20, "count"))
      {
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("additionalAttributes.syndicationIdentifier IN %@"), v20);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0D73310], "predicateForExcludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CD1390], "filterPredicateToIncludeOnlyReceivedSyndicatedAssets");
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K >= %d"), CFSTR("thumbnailIndex"), *MEMORY[0x1E0D71F40]);
        v69 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v75, "librarySpecificFetchOptions");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v106 = v17;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v106, 1);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setFetchPropertySets:", v29);

        v30 = (void *)MEMORY[0x1E0CB3528];
        v105[0] = v27;
        v105[1] = v70;
        v105[2] = v68;
        v105[3] = v69;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v105, 4);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "andPredicateWithSubpredicates:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "setInternalPredicate:", v32);

        objc_msgSend(v28, "setIncludeGuestAssets:", 0);
        objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v28);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "count");
        v35 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
        if (v34)
        {
          if (v35)
          {
            LODWORD(buf[0]) = 134217984;
            *(_QWORD *)((char *)buf + 4) = v34;
            _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: Promoting %tu saved syndicated asset(s) as guest", (uint8_t *)buf, 0xCu);
          }
          v36 = objc_msgSend(v33, "count");
          buf[0] = 0;
          buf[1] = buf;
          buf[2] = 0x2020000000;
          buf[3] = 0;
          if (v36)
          {
            v37 = v27;
            v38 = 1.0 / (double)v36;
            v80[0] = MEMORY[0x1E0C809B0];
            v80[1] = 3221225472;
            v80[2] = __78__PGSyndicationProcessor_processSavedSyndicatedAssetsWithError_progressBlock___block_invoke;
            v80[3] = &unk_1E8429C00;
            v86 = v36;
            v81 = v33;
            v83 = buf;
            v87 = v38;
            v82 = v7;
            v84 = &v94;
            v88 = 0x3F847AE147AE147BLL;
            v85 = &v98;
            v79 = 0;
            v39 = objc_msgSend(v75, "performChangesAndWait:error:", v80, &v79);
            v40 = v79;
            if ((v39 & 1) == 0)
            {
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_ERROR))
              {
                v102 = 138412290;
                v103[0] = v40;
                _os_log_error_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_ERROR, "PGSyndicationProcessor: Error saving guest asset to database: %@", (uint8_t *)&v102, 0xCu);
              }
              if (v65)
                *v65 = objc_retainAutorelease(v40);
            }

            v27 = v37;
          }
          v41 = mach_absolute_time();
          numer = info.numer;
          denom = info.denom;
          v44 = oslog;
          v45 = v44;
          if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v44))
          {
            LOWORD(v102) = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v45, OS_SIGNPOST_INTERVAL_END, spid, "PGSyndicationSavedSyndicatedAssets", ", (uint8_t *)&v102, 2u);
          }

          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            v102 = 136315394;
            v103[0] = "PGSyndicationSavedSyndicatedAssets";
            LOWORD(v103[1]) = 2048;
            *(double *)((char *)&v103[1] + 2) = (float)((float)((float)((float)(v41 - v66) * (float)numer) / (float)denom)
                                                      / 1000000.0);
            _os_log_impl(&dword_1CA237000, v45, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v102, 0x16u);
          }
          if (v7
            && (Current = CFAbsoluteTimeGetCurrent(), Current - v95[3] >= 0.01)
            && (v95[3] = Current,
                v78 = 0,
                (*((void (**)(void *, char *, double))v7 + 2))(v7, &v78, 1.0),
                v47 = *((_BYTE *)v99 + 24) | v78,
                (*((_BYTE *)v99 + 24) = v47) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v102 = 67109378;
              LODWORD(v103[0]) = 278;
              WORD2(v103[0]) = 2080;
              *(_QWORD *)((char *)v103 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysi"
                                              "s/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v102, 0x12u);
            }
            v10 = 0;
          }
          else
          {
            v10 = 1;
          }
          _Block_object_dispose(buf, 8);
        }
        else
        {
          if (v35)
          {
            LOWORD(buf[0]) = 0;
            _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: No saved syndicated asset eligible for guest promoting", (uint8_t *)buf, 2u);
          }
          if (v7
            && (v58 = CFAbsoluteTimeGetCurrent(), v58 - v95[3] >= 0.01)
            && (v95[3] = v58,
                LOBYTE(v102) = 0,
                (*((void (**)(void *, int *, double))v7 + 2))(v7, &v102, 1.0),
                v59 = *((_BYTE *)v99 + 24) | v102,
                (*((_BYTE *)v99 + 24) = v59) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              buf[0] = 0xEF04000202;
              LOWORD(buf[1]) = 2080;
              *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
            }
            v10 = 0;
          }
          else
          {
            v60 = mach_absolute_time();
            v62 = info.numer;
            v61 = info.denom;
            v63 = oslog;
            v64 = v63;
            if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v63))
            {
              LOWORD(buf[0]) = 0;
              _os_signpost_emit_with_name_impl(&dword_1CA237000, v64, OS_SIGNPOST_INTERVAL_END, spid, "PGSyndicationSavedSyndicatedAssets", ", (uint8_t *)buf, 2u);
            }

            v10 = 1;
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              LODWORD(buf[0]) = 136315394;
              *(_QWORD *)((char *)buf + 4) = "PGSyndicationSavedSyndicatedAssets";
              WORD2(buf[1]) = 2048;
              *(double *)((char *)&buf[1] + 6) = (float)((float)((float)((float)(v60 - v66) * (float)v62) / (float)v61)
                                                       / 1000000.0);
              _os_log_impl(&dword_1CA237000, v64, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)buf, 0x16u);
            }
          }
        }

      }
      else
      {
        if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: No saved asset with syndication identifiers", (uint8_t *)buf, 2u);
        }
        if (v7
          && (v50 = CFAbsoluteTimeGetCurrent(), v50 - v95[3] >= 0.01)
          && (v95[3] = v50,
              LOBYTE(v102) = 0,
              (*((void (**)(void *, int *, double))v7 + 2))(v7, &v102, 1.0),
              v51 = *((_BYTE *)v99 + 24) | v102,
              (*((_BYTE *)v99 + 24) = v51) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            buf[0] = 0xDA04000202;
            LOWORD(buf[1]) = 2080;
            *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
          }
          v10 = 0;
        }
        else
        {
          v53 = mach_absolute_time();
          v55 = info.numer;
          v54 = info.denom;
          v56 = oslog;
          v57 = v56;
          if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v56))
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v57, OS_SIGNPOST_INTERVAL_END, spid, "PGSyndicationSavedSyndicatedAssets", ", (uint8_t *)buf, 2u);
          }

          v10 = 1;
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            LODWORD(buf[0]) = 136315394;
            *(_QWORD *)((char *)buf + 4) = "PGSyndicationSavedSyndicatedAssets";
            WORD2(buf[1]) = 2048;
            *(double *)((char *)&buf[1] + 6) = (float)((float)((float)((float)(v53 - v66) * (float)v55) / (float)v54)
                                                     / 1000000.0);
            _os_log_impl(&dword_1CA237000, v57, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)buf, 0x16u);
          }
        }
      }

    }
    else
    {
      if (v7)
      {
        v48 = CFAbsoluteTimeGetCurrent();
        if (v48 - v95[3] >= 0.01)
        {
          v95[3] = v48;
          LOBYTE(v102) = 0;
          (*((void (**)(void *, int *, double))v7 + 2))(v7, &v102, 1.0);
          v49 = *((_BYTE *)v99 + 24) | v102;
          *((_BYTE *)v99 + 24) = v49;
          if (v49)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              buf[0] = 0xBF04000202;
              LOWORD(buf[1]) = 2080;
              *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
            }
          }
        }
      }
      v10 = 0;
    }

  }
  _Block_object_dispose(&v94, 8);
  _Block_object_dispose(&v98, 8);

  return v10;
}

- (BOOL)processSyndicatedAssetGuestInferenceWithError:(id *)a3 progressBlock:(id)a4
{
  return -[PGSyndicationProcessor processSyndicatedAssetGuestInferenceWithError:progressBlock:shareBackSuggester:](self, "processSyndicatedAssetGuestInferenceWithError:progressBlock:shareBackSuggester:", a3, a4, 0);
}

- (BOOL)processSyndicatedAssetGuestInferenceWithError:(id *)a3 progressBlock:(id)a4 shareBackSuggester:(id)a5
{
  id v8;
  double v9;
  char v10;
  BOOL v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  _BOOL4 v19;
  NSObject *v20;
  os_signpost_id_t v21;
  NSObject *v22;
  NSObject *v23;
  _BOOL4 v24;
  uint64_t v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t i;
  void *v30;
  void *v31;
  void *v32;
  __CFString *v33;
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  PGManagerWorkingContext *workingContext;
  NSObject *v44;
  id v45;
  id v46;
  id v47;
  id v48;
  id v49;
  NSObject *v50;
  double v51;
  char v52;
  double v53;
  char v54;
  NSObject *v55;
  uint64_t v56;
  unint64_t v57;
  double v58;
  char v59;
  id v60;
  uint64_t v61;
  uint32_t denom;
  uint32_t numer;
  NSObject *v64;
  NSObject *v65;
  double Current;
  char v67;
  uint64_t v69;
  os_signpost_id_t spid;
  unint64_t v71;
  id *v72;
  PGSyndicationProcessor *v73;
  void *v74;
  void *v75;
  void *v76;
  id v77;
  NSObject *oslog;
  void *v79;
  void *v80;
  id v81;
  NSObject *log;
  os_log_t loga;
  id obj;
  void *v85;
  void *v86;
  char v87;
  id v88;
  _QWORD v89[4];
  id v90;
  id v91;
  id v92;
  id v93;
  _QWORD *v94;
  uint64_t *v95;
  uint64_t *v96;
  unint64_t v97;
  double v98;
  uint64_t v99;
  _QWORD v100[4];
  id v101;
  NSObject *v102;
  id v103;
  PGSyndicationProcessor *v104;
  os_log_t v105;
  id v106;
  id v107;
  id v108;
  id v109;
  id v110;
  uint64_t *v111;
  uint64_t *v112;
  uint64_t v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  mach_timebase_info info;
  uint64_t v119;
  double *v120;
  uint64_t v121;
  uint64_t v122;
  uint64_t v123;
  uint64_t *v124;
  uint64_t v125;
  char v126;
  int v127;
  _QWORD v128[3];
  _QWORD buf[4];
  _BYTE v130[128];
  _QWORD v131[10];

  v131[7] = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v77 = a5;
  v75 = v8;
  v123 = 0;
  v124 = &v123;
  v125 = 0x2020000000;
  v126 = 0;
  v119 = 0;
  v120 = (double *)&v119;
  v121 = 0x2020000000;
  v122 = 0;
  v80 = _Block_copy(v8);
  if (v80
    && (v9 = CFAbsoluteTimeGetCurrent(), v9 - v120[3] >= 0.01)
    && (v120[3] = v9,
        LOBYTE(v127) = 0,
        (*((void (**)(void *, int *, double))v80 + 2))(v80, &v127, 0.0),
        v10 = *((_BYTE *)v124 + 24) | v127,
        (*((_BYTE *)v124 + 24) = v10) != 0))
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
    {
      buf[0] = 0x12004000202;
      LOWORD(buf[1]) = 2080;
      *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Pho"
                                         "tosGraph/Framework/Syndication/PGSyndicationProcessor.m";
      _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
    }
    v11 = 0;
  }
  else
  {
    -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
    oslog = objc_claimAutoreleasedReturnValue();
    -[PGSyndicationProcessor syndicationPhotoLibraryWithError:](self, "syndicationPhotoLibraryWithError:", a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = v12;
    if (v12)
    {
      v72 = a3;
      v73 = self;
      objc_msgSend(v12, "librarySpecificFetchOptions");
      v79 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = *MEMORY[0x1E0CD1958];
      v131[0] = *MEMORY[0x1E0CD1960];
      v131[1] = v13;
      v14 = *MEMORY[0x1E0CD1978];
      v131[2] = *MEMORY[0x1E0CD19F0];
      v131[3] = v14;
      v15 = *MEMORY[0x1E0CD1A50];
      v131[4] = *MEMORY[0x1E0CD1A60];
      v131[5] = v15;
      v131[6] = *MEMORY[0x1E0CD19E0];
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v131, 7);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setFetchPropertySets:", v16);

      objc_msgSend(MEMORY[0x1E0D77E50], "internalPredicateToFilterSyndicatedAssetsEligibleForGuestInferenceProcessing");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v79, "setInternalPredicate:", v17);

      objc_msgSend(v79, "setIncludeGuestAssets:", 1);
      objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v79);
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v74, "count");
      v19 = os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT);
      if (v18)
      {
        if (v19)
        {
          LODWORD(buf[0]) = 134217984;
          *(_QWORD *)((char *)buf + 4) = v18;
          _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: %tu asset(s) eligible for guest processing", (uint8_t *)buf, 0xCu);
        }
        v20 = oslog;
        v21 = os_signpost_id_generate(v20);
        v22 = v20;
        v23 = v22;
        spid = v21;
        v71 = v21 - 1;
        log = v22;
        if (v21 - 1 <= 0xFFFFFFFFFFFFFFFDLL)
        {
          v24 = os_signpost_enabled(v22);
          v23 = log;
          if (v24)
          {
            LOWORD(buf[0]) = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, log, OS_SIGNPOST_INTERVAL_BEGIN, v21, "PGSyndicationProcessorAssetGuestInference", ", (uint8_t *)buf, 2u);
            v23 = log;
          }
        }

        info = 0;
        mach_timebase_info(&info);
        v25 = mach_absolute_time();
        objc_msgSend(MEMORY[0x1E0CD1390], "senderIdentifierByAssetUUIDForAssets:", v74);
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        v69 = v25;
        objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentUUIDByAssetUUIDForAssets:options:", v74, 0);
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = objc_alloc_init(MEMORY[0x1E0C99E08]);
        v117 = 0u;
        v116 = 0u;
        v115 = 0u;
        v114 = 0u;
        obj = v74;
        v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
        if (v27)
        {
          v28 = *(_QWORD *)v115;
          do
          {
            for (i = 0; i != v27; ++i)
            {
              if (*(_QWORD *)v115 != v28)
                objc_enumerationMutation(obj);
              v30 = *(void **)(*((_QWORD *)&v114 + 1) + 8 * i);
              objc_msgSend(v30, "uuid");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v86, "objectForKeyedSubscript:", v31);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v85, "objectForKeyedSubscript:", v31);
              v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
              if (!v33)
              {
                v33 = &stru_1E8436F28;
                if (os_log_type_enabled(log, OS_LOG_TYPE_FAULT))
                {
                  LODWORD(buf[0]) = 138412290;
                  *(_QWORD *)((char *)buf + 4) = v31;
                  _os_log_fault_impl(&dword_1CA237000, log, OS_LOG_TYPE_FAULT, "No sender identifier for %@, see: rdar://74551611 ([Hubble] Some syndicated assets have the same syndication identifier but different uuids)", (uint8_t *)buf, 0xCu);
                }
              }
              objc_msgSend(v26, "objectForKeyedSubscript:", v32);
              v34 = (id)objc_claimAutoreleasedReturnValue();
              if (!v34)
              {
                v34 = objc_alloc_init(MEMORY[0x1E0C99E08]);
                objc_msgSend(v26, "setObject:forKeyedSubscript:", v34, v32);
              }
              objc_msgSend(v34, "objectForKeyedSubscript:", v33);
              v35 = (void *)objc_claimAutoreleasedReturnValue();
              v36 = v35;
              if (v35)
              {
                objc_msgSend(v35, "addObject:", v30);
              }
              else
              {
                objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", v30);
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v34, "setObject:forKeyedSubscript:", v37, v33);

              }
            }
            v27 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v114, v130, 16);
          }
          while (v27);
        }

        objc_msgSend(MEMORY[0x1E0C99E20], "set");
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v86, "allValues");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        -[PGSyndicationProcessor guestAssetSenderIdentifiersByMomentUUIDForMomentUUIDs:inPhotoLibrary:](v73, "guestAssetSenderIdentifiersByMomentUUIDForMomentUUIDs:inPhotoLibrary:", v40, v76);
        v41 = (void *)objc_claimAutoreleasedReturnValue();

        -[PGManagerWorkingContext serviceManager](v73->_workingContext, "serviceManager");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        workingContext = v73->_workingContext;
        v100[0] = MEMORY[0x1E0C809B0];
        v100[1] = 3221225472;
        v100[2] = __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke;
        v100[3] = &unk_1E8429C78;
        v101 = v77;
        v44 = log;
        v102 = v44;
        v45 = v76;
        v103 = v45;
        v104 = v73;
        loga = v42;
        v105 = loga;
        v46 = v26;
        v106 = v46;
        v47 = v39;
        v107 = v47;
        v81 = v41;
        v108 = v81;
        v48 = v38;
        v109 = v48;
        v49 = v80;
        v110 = v49;
        v111 = &v119;
        v112 = &v123;
        v113 = 0x3F847AE147AE147BLL;
        -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v100);
        if (*((_BYTE *)v124 + 24))
        {
          v50 = v44;
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            buf[0] = 0x1B604000202;
            LOWORD(buf[1]) = 2080;
            *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
          }
          v11 = 0;
        }
        else
        {
          v50 = v44;
          v55 = v44;
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            v56 = objc_msgSend(v48, "count");
            LODWORD(buf[0]) = 134217984;
            *(_QWORD *)((char *)buf + 4) = v56;
            _os_log_impl(&dword_1CA237000, v55, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: Promoting %tu asset(s) as guest", (uint8_t *)buf, 0xCu);
          }

          v57 = objc_msgSend(obj, "count");
          buf[0] = 0;
          buf[1] = buf;
          buf[2] = 0x2020000000;
          buf[3] = 0;
          if (v57)
          {
            v58 = 1.0 / (double)v57;
            v89[0] = MEMORY[0x1E0C809B0];
            v89[1] = 3221225472;
            v89[2] = __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_213;
            v89[3] = &unk_1E8429CA0;
            v97 = v57;
            v90 = obj;
            v91 = v47;
            v92 = v48;
            v94 = buf;
            v98 = v58;
            v93 = v49;
            v95 = &v119;
            v99 = 0x3F847AE147AE147BLL;
            v96 = &v123;
            v88 = 0;
            v59 = objc_msgSend(v45, "performChangesAndWait:error:", v89, &v88);
            v60 = v88;
            if ((v59 & 1) == 0)
            {
              if (os_log_type_enabled(v55, OS_LOG_TYPE_ERROR))
              {
                v127 = 138412290;
                v128[0] = v60;
                _os_log_error_impl(&dword_1CA237000, v55, OS_LOG_TYPE_ERROR, "PGSyndicationProcessor: Error saving guest asset inference to database: %@", (uint8_t *)&v127, 0xCu);
              }
              if (v72)
                *v72 = objc_retainAutorelease(v60);
            }

          }
          v61 = mach_absolute_time();
          numer = info.numer;
          denom = info.denom;
          v64 = v55;
          v65 = v64;
          if (v71 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v64))
          {
            LOWORD(v127) = 0;
            _os_signpost_emit_with_name_impl(&dword_1CA237000, v65, OS_SIGNPOST_INTERVAL_END, spid, "PGSyndicationProcessorAssetGuestInference", ", (uint8_t *)&v127, 2u);
          }

          if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
          {
            v127 = 136315394;
            v128[0] = "PGSyndicationProcessorAssetGuestInference";
            LOWORD(v128[1]) = 2048;
            *(double *)((char *)&v128[1] + 2) = (float)((float)((float)((float)(v61 - v69) * (float)numer) / (float)denom)
                                                      / 1000000.0);
            _os_log_impl(&dword_1CA237000, v65, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", (uint8_t *)&v127, 0x16u);
          }
          if (v80
            && (Current = CFAbsoluteTimeGetCurrent(), Current - v120[3] >= 0.01)
            && (v120[3] = Current,
                v87 = 0,
                (*((void (**)(id, char *, double))v49 + 2))(v49, &v87, 1.0),
                v67 = *((_BYTE *)v124 + 24) | v87,
                (*((_BYTE *)v124 + 24) = v67) != 0))
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              v127 = 67109378;
              LODWORD(v128[0]) = 497;
              WORD2(v128[0]) = 2080;
              *(_QWORD *)((char *)v128 + 6) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysi"
                                              "s/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)&v127, 0x12u);
            }
            v11 = 0;
          }
          else
          {
            v11 = 1;
          }
          _Block_object_dispose(buf, 8);
        }

      }
      else
      {
        if (v19)
        {
          LOWORD(buf[0]) = 0;
          _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: No asset eligible for guest processing", (uint8_t *)buf, 2u);
        }
        if (v80
          && (v53 = CFAbsoluteTimeGetCurrent(), v53 - v120[3] >= 0.01)
          && (v120[3] = v53,
              LOBYTE(v127) = 0,
              (*((void (**)(void *, int *, double))v80 + 2))(v80, &v127, 1.0),
              v54 = *((_BYTE *)v124 + 24) | v127,
              (*((_BYTE *)v124 + 24) = v54) != 0))
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            buf[0] = 0x13304000202;
            LOWORD(buf[1]) = 2080;
            *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalys"
                                               "is/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
          }
          v11 = 0;
        }
        else
        {
          v11 = 1;
        }
      }

    }
    else
    {
      if (v80)
      {
        v51 = CFAbsoluteTimeGetCurrent();
        if (v51 - v120[3] >= 0.01)
        {
          v120[3] = v51;
          LOBYTE(v127) = 0;
          (*((void (**)(void *, int *, double))v80 + 2))(v80, &v127, 1.0);
          v52 = *((_BYTE *)v124 + 24) | v127;
          *((_BYTE *)v124 + 24) = v52;
          if (v52)
          {
            if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
            {
              buf[0] = 0x12604000202;
              LOWORD(buf[1]) = 2080;
              *(_QWORD *)((char *)&buf[1] + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanal"
                                                 "ysis/PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
              _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", (uint8_t *)buf, 0x12u);
            }
          }
        }
      }
      v11 = 0;
    }

  }
  _Block_object_dispose(&v119, 8);
  _Block_object_dispose(&v123, 8);

  return v11;
}

- (id)guestAssetSenderIdentifiersByMomentUUIDForMomentUUIDs:(id)a3 inPhotoLibrary:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t i;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  __CFString *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  id v40;
  NSObject *oslog;
  id obj;
  void *v43;
  void *v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  uint8_t buf[4];
  void *v50;
  _BYTE v51[128];
  _QWORD v52[3];
  _QWORD v53[4];

  v53[2] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
  oslog = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "librarySpecificFetchOptions");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("moment.uuid"), v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %lu OR %K == %lu"), CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion"), *MEMORY[0x1E0CD1A98], CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion"), *MEMORY[0x1E0CD1AA0]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setIncludeGuestAssets:", 1);
  v12 = *MEMORY[0x1E0CD19F0];
  v53[0] = *MEMORY[0x1E0CD1978];
  v53[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v53, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFetchPropertySets:", v13);

  v14 = (void *)MEMORY[0x1E0CB3528];
  v52[0] = v9;
  v52[1] = v10;
  v52[2] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v52, 3);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "andPredicateWithSubpredicates:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setInternalPredicate:", v16);

  objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v8);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v17, "count"))
  {
    v35 = v11;
    v36 = v10;
    v37 = v9;
    v38 = v8;
    v39 = v7;
    v40 = v6;
    objc_msgSend(MEMORY[0x1E0CD1390], "senderIdentifierByAssetUUIDForAssets:", v17);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD1670], "fetchMomentUUIDByAssetUUIDForAssets:options:", v17, 0);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    v45 = 0u;
    v46 = 0u;
    v47 = 0u;
    v48 = 0u;
    v34 = v17;
    obj = v17;
    v19 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
    if (v19)
    {
      v20 = v19;
      v21 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v20; ++i)
        {
          if (*(_QWORD *)v46 != v21)
            objc_enumerationMutation(obj);
          v23 = *(void **)(*((_QWORD *)&v45 + 1) + 8 * i);
          v24 = (void *)MEMORY[0x1CAA4EB2C]();
          objc_msgSend(v23, "mediaAnalysisProperties");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v25, "syndicationProcessingValue") & 0x6EF0;

          if (v26)
          {
            objc_msgSend(v23, "uuid");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v43, "objectForKeyedSubscript:", v27);
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v44, "objectForKeyedSubscript:", v27);
            v29 = (__CFString *)objc_claimAutoreleasedReturnValue();
            if (!v29)
            {
              v29 = &stru_1E8436F28;
              if (os_log_type_enabled(oslog, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v50 = v27;
                _os_log_fault_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_FAULT, "No sender identifier for %@, see: rdar://74551611 ([Hubble] Some syndicated assets have the same syndication identifier but different uuids)", buf, 0xCu);
              }
            }
            objc_msgSend(v18, "objectForKeyedSubscript:", v28);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            v31 = v30;
            if (v30)
            {
              objc_msgSend(v30, "addObject:", v29);
            }
            else
            {
              objc_msgSend(MEMORY[0x1E0C99E20], "setWithObject:", v29);
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v18, "setObject:forKeyedSubscript:", v32, v28);

            }
          }
          objc_autoreleasePoolPop(v24);
        }
        v20 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v45, v51, 16);
      }
      while (v20);
    }

    v7 = v39;
    v6 = v40;
    v9 = v37;
    v8 = v38;
    v11 = v35;
    v10 = v36;
    v17 = v34;
  }
  else
  {
    v18 = (id)MEMORY[0x1E0C9AA70];
  }

  return v18;
}

- (id)duplicateAssetUUIDsForSuggesterResult:(id)a3 assetsInferredAsGuestAsset:(id)a4 syndicationLibrary:(id)a5 error:(id *)a6 progressBlock:(id)a7
{
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  uint64_t v52;
  void *v53;
  void *v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  void *v60;
  int v61;
  void *v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  void *v75;
  unint64_t v76;
  unint64_t v77;
  void *v78;
  id v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t v82;
  uint64_t j;
  void *v84;
  void *v85;
  uint64_t v86;
  void *v87;
  NSObject *v88;
  void *v89;
  uint64_t v90;
  id v91;
  void *v92;
  uint64_t v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  id v109;
  id v110;
  id obj;
  void *v112;
  uint64_t v113;
  uint64_t v114;
  void *v115;
  id v116;
  uint64_t v117;
  void *context;
  PGSyndicationProcessor *v119;
  void *v120;
  uint64_t v121;
  id v122;
  NSObject *oslog;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  __int128 v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  __int128 v136;
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  uint8_t buf[4];
  uint64_t v145;
  __int16 v146;
  void *v147;
  _BYTE v148[128];
  _BYTE v149[128];
  _BYTE v150[128];
  _BYTE v151[128];
  _QWORD v152[3];
  _QWORD v153[3];
  _QWORD v154[2];
  uint64_t v155;
  _BYTE v156[128];
  uint64_t v157;

  v157 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v110 = a4;
  v109 = a5;
  v116 = a7;
  v119 = self;
  -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
  oslog = objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v120 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantFuture");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v140 = 0u;
  v141 = 0u;
  v142 = 0u;
  v143 = 0u;
  v112 = v11;
  objc_msgSend(v11, "suggesterInputs");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v141;
    do
    {
      for (i = 0; i != v17; ++i)
      {
        if (*(_QWORD *)v141 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v140 + 1) + 8 * i);
        objc_msgSend(v20, "asset");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          objc_msgSend(v14, "addObject:", v21);
          objc_msgSend(v20, "creationDate");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "earlierDate:", v22);
          v23 = objc_claimAutoreleasedReturnValue();

          objc_msgSend(v13, "laterDate:", v22);
          v24 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v24;
          v12 = (void *)v23;
        }

      }
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v140, v156, 16);
    }
    while (v17);
  }

  if (objc_msgSend(v14, "count"))
  {
    objc_msgSend(v12, "dateByAddingTimeInterval:", -1.0);
    v25 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "dateByAddingTimeInterval:", 1.0);
    v26 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("creationDate >= %@ && creationDate <= %@"), v25, v26);
    v27 = objc_claimAutoreleasedReturnValue();
    v95 = v26;
    v96 = (void *)v25;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("dateCreated >= %@ && dateCreated <= %@"), v25, v26);
    v108 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGManagerWorkingContext photoLibrary](v119->_workingContext, "photoLibrary");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "librarySpecificFetchOptions");
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v29, "setIncludeGuestAssets:", 0);
    v31 = *MEMORY[0x1E0CD1A50];
    v154[0] = *MEMORY[0x1E0CD1A60];
    v30 = v154[0];
    v154[1] = v31;
    v155 = *MEMORY[0x1E0CD19F0];
    v32 = v155;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v154, 3);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setFetchPropertySets:", v33);

    objc_msgSend(v29, "setPredicate:", v27);
    v106 = v29;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v29);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v107 = (void *)v27;
    objc_msgSend(v110, "filteredSetUsingPredicate:", v27);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D73310], "predicateForIncludeMask:useIndex:", objc_msgSend(MEMORY[0x1E0D73310], "maskForGuestAsset"), 1);
    v36 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %lu OR %K == %lu"), CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion"), *MEMORY[0x1E0CD1A98], CFSTR("mediaAnalysisAttributes.syndicationProcessingVersion"), *MEMORY[0x1E0CD1AA0]);
    v37 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "librarySpecificFetchOptions");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setIncludeGuestAssets:", 1);
    v153[0] = v30;
    v153[1] = v31;
    v153[2] = v32;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v153, 3);
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setFetchPropertySets:", v39);

    v40 = (void *)MEMORY[0x1E0CB3528];
    v152[0] = v108;
    v102 = (void *)v37;
    v103 = (void *)v36;
    v152[1] = v36;
    v152[2] = v37;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v152, 3);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "andPredicateWithSubpredicates:", v41);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "setInternalPredicate:", v42);

    v101 = v38;
    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v38);
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v44 = (void *)MEMORY[0x1E0C99DE8];
    objc_msgSend(v14, "allObjects");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "arrayWithArray:", v45);
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    v105 = v34;
    objc_msgSend(v34, "fetchedObjects");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObjectsFromArray:", v47);

    v104 = v35;
    objc_msgSend(v35, "allObjects");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObjectsFromArray:", v48);

    v100 = v43;
    objc_msgSend(v43, "fetchedObjects");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "addObjectsFromArray:", v49);

    -[CLSCurationSession prepareAssets:](v119->_curationSession, "prepareAssets:", v46);
    v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D71698]), "initWithDistanceBlock:", &__block_literal_global_230);
    objc_msgSend(v50, "setMaximumDistance:", 1.0);
    objc_msgSend(v50, "setMinimumNumberOfObjects:", 2);
    v98 = v50;
    v99 = v46;
    objc_msgSend(v50, "performWithDataset:progressBlock:", v46, v116);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v97 = v51;
    if (objc_msgSend(v51, "count"))
    {
      -[PGSyndicationProcessor similarStacker](v119, "similarStacker");
      v115 = (void *)objc_claimAutoreleasedReturnValue();
      v136 = 0u;
      v137 = 0u;
      v138 = 0u;
      v139 = 0u;
      obj = v51;
      v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
      if (v114)
      {
        v113 = *(_QWORD *)v137;
        while (2)
        {
          v52 = 0;
          do
          {
            if (*(_QWORD *)v137 != v113)
              objc_enumerationMutation(obj);
            v117 = v52;
            v53 = *(void **)(*((_QWORD *)&v136 + 1) + 8 * v52);
            context = (void *)MEMORY[0x1CAA4EB2C]();
            v132 = 0u;
            v133 = 0u;
            v134 = 0u;
            v135 = 0u;
            objc_msgSend(v53, "objects");
            v54 = (void *)objc_claimAutoreleasedReturnValue();
            v55 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
            if (v55)
            {
              v56 = v55;
              v57 = *(_QWORD *)v133;
LABEL_19:
              v58 = 0;
              while (1)
              {
                if (*(_QWORD *)v133 != v57)
                  objc_enumerationMutation(v54);
                v59 = *(void **)(*((_QWORD *)&v132 + 1) + 8 * v58);
                objc_msgSend(v59, "sceneAnalysisProperties");
                v60 = (void *)objc_claimAutoreleasedReturnValue();
                v61 = objc_msgSend(v60, "sceneAnalysisVersion");

                objc_msgSend(MEMORY[0x1E0D718C8], "currentSceneVersion");
                v62 = (void *)objc_claimAutoreleasedReturnValue();
                v63 = objc_msgSend(v62, "intValue");

                if (v63 > v61)
                  break;
                if (v56 == ++v58)
                {
                  v56 = objc_msgSend(v54, "countByEnumeratingWithState:objects:count:", &v132, v150, 16);
                  if (v56)
                    goto LABEL_19;
                  goto LABEL_25;
                }
              }
              v64 = (void *)MEMORY[0x1E0CB35C8];
              v65 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v59, "uuid");
              v66 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v65, "stringWithFormat:", CFSTR("Asset %@ has no scenes processed: could not dedupe guest asset for %@."), v66, v112);
              v67 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v64, "errorWithDescription:", v67);
              v68 = (void *)objc_claimAutoreleasedReturnValue();

              if (!v68)
                goto LABEL_27;
              objc_autoreleasePoolPop(context);

              v92 = (void *)v95;
              if (a6)
                *a6 = objc_retainAutorelease(v68);

              v91 = 0;
              v89 = v120;
              v12 = v96;
              goto LABEL_64;
            }
LABEL_25:

LABEL_27:
            objc_msgSend(v53, "objects");
            v69 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v115, "stackSimilarItems:withSimilarity:timestampSupport:progressBlock:", v69, 2, 0, v116);
            v70 = (void *)objc_claimAutoreleasedReturnValue();

            v130 = 0u;
            v131 = 0u;
            v128 = 0u;
            v129 = 0u;
            v122 = v70;
            v71 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v128, v149, 16);
            if (v71)
            {
              v72 = v71;
              v73 = *(_QWORD *)v129;
              do
              {
                v74 = 0;
                v121 = v72;
                do
                {
                  if (*(_QWORD *)v129 != v73)
                    objc_enumerationMutation(v122);
                  v75 = *(void **)(*((_QWORD *)&v128 + 1) + 8 * v74);
                  v76 = objc_msgSend(v75, "count");
                  if (v76 >= 2)
                  {
                    v77 = v76;
                    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
                    v78 = (void *)objc_claimAutoreleasedReturnValue();
                    v124 = 0u;
                    v125 = 0u;
                    v126 = 0u;
                    v127 = 0u;
                    v79 = v75;
                    v80 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v124, v148, 16);
                    if (v80)
                    {
                      v81 = v80;
                      v82 = *(_QWORD *)v125;
                      do
                      {
                        for (j = 0; j != v81; ++j)
                        {
                          if (*(_QWORD *)v125 != v82)
                            objc_enumerationMutation(v79);
                          v84 = *(void **)(*((_QWORD *)&v124 + 1) + 8 * j);
                          if (objc_msgSend(v14, "containsObject:", v84))
                          {
                            objc_msgSend(v84, "uuid");
                            v85 = (void *)objc_claimAutoreleasedReturnValue();
                            objc_msgSend(v78, "addObject:", v85);

                          }
                        }
                        v81 = objc_msgSend(v79, "countByEnumeratingWithState:objects:count:", &v124, v148, 16);
                      }
                      while (v81);
                    }

                    v86 = objc_msgSend(v78, "count");
                    if (v86 == v77)
                    {
                      -[PGSyndicationProcessor _bestAssetUUIDInAssetCluster:](v119, "_bestAssetUUIDInAssetCluster:", v79);
                      v87 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v78, "removeObject:", v87);
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        v145 = (uint64_t)v78;
                        v146 = 2112;
                        v147 = v87;
                        _os_log_debug_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEBUG, "PGSyndicationProcessor: Cluster only contains input items %@, selected best item: %@", buf, 0x16u);
                      }

                    }
                    v72 = v121;
                    if (v86)
                    {
                      objc_msgSend(v120, "addObjectsFromArray:", v78);
                      if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412290;
                        v145 = (uint64_t)v78;
                        _os_log_debug_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEBUG, "PGSyndicationProcessor: Found cluster of duplicates %@", buf, 0xCu);
                      }
                    }

                  }
                  ++v74;
                }
                while (v74 != v72);
                v72 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v128, v149, 16);
              }
              while (v72);
            }

            objc_autoreleasePoolPop(context);
            v52 = v117 + 1;
          }
          while (v117 + 1 != v114);
          v114 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v136, v151, 16);
          if (v114)
            continue;
          break;
        }
      }

    }
    v88 = oslog;
    v89 = v120;
    if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
    {
      v90 = objc_msgSend(v120, "count");
      *(_DWORD *)buf = 134218242;
      v145 = v90;
      v146 = 2112;
      v147 = v112;
      _os_log_impl(&dword_1CA237000, v88, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: Found %lu duplicate(s) for : %@", buf, 0x16u);
    }

    v91 = v120;
    v92 = (void *)v95;
    v12 = v96;
LABEL_64:

    v13 = v92;
  }
  else
  {
    if (os_log_type_enabled(oslog, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v145 = (uint64_t)v112;
      _os_log_impl(&dword_1CA237000, oslog, OS_LOG_TYPE_DEFAULT, "PGSyndicationProcessor: No duplicates to find since there are no assets for: %@", buf, 0xCu);
    }
    v89 = v120;
    v91 = v120;
  }

  return v91;
}

- (id)_bestAssetUUIDInAssetCluster:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  double v8;
  double v9;
  uint64_t i;
  void *v11;
  double v12;
  double v13;
  float v14;
  double v15;
  void *v16;
  void *v17;
  BOOL v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v22;
    v8 = -1.79769313e308;
    v9 = -1.79769313e308;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v22 != v7)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v11, "curationScore");
        if (v12 >= v9)
        {
          v13 = v12;
          objc_msgSend(v11, "overallAestheticScore");
          v15 = v14;
          if (v8 <= v14)
          {
            objc_msgSend(v11, "uuid");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v17 = v16;
            if (!v6 || (v13 == v9 ? (v18 = v8 == v15) : (v18 = 0), !v18 || objc_msgSend(v16, "compare:", v6) == -1))
            {
              v19 = v17;

              v6 = v19;
              v9 = v13;
              v8 = v15;
            }

          }
        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)similarStacker
{
  CLSSimilarStacker *similarStacker;
  CLSSimilarStacker *v4;
  CLSSimilarStacker *v5;

  similarStacker = self->_similarStacker;
  if (!similarStacker)
  {
    v4 = (CLSSimilarStacker *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4B260]), "initWithSimilarityModelClass:", objc_opt_class());
    v5 = self->_similarStacker;
    self->_similarStacker = v4;

    similarStacker = self->_similarStacker;
  }
  return similarStacker;
}

- (BOOL)processSyndicatedAssetRevGeoCodingWithError:(id *)a3 progressBlock:(id)a4
{
  id v6;
  void (**v7)(void *, uint8_t *, double);
  double v8;
  double Current;
  BOOL v10;
  void *v11;
  PGManagerWorkingContext *workingContext;
  void *v13;
  PGRevGeocodeProcessor *v14;
  uint64_t v15;
  void *v16;
  PGRevGeocodeProcessor *v17;
  void *v18;
  char v20;
  _QWORD v21[5];
  uint8_t v22[4];
  int v23;
  __int16 v24;
  const char *v25;
  uint8_t buf[8];
  __int128 v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  v7 = (void (**)(void *, uint8_t *, double))_Block_copy(v6);
  v8 = 0.0;
  if (v7)
  {
    Current = CFAbsoluteTimeGetCurrent();
    if (Current >= 0.01)
    {
      v22[0] = 0;
      v7[2](v7, v22, 0.0);
      if (v22[0])
      {
        if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 67109378;
          *(_DWORD *)&buf[4] = 732;
          LOWORD(v27) = 2080;
          *(_QWORD *)((char *)&v27 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/Ph"
                                          "otosGraph/Framework/Syndication/PGSyndicationProcessor.m";
          _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
        }
        v10 = 0;
        goto LABEL_23;
      }
      v8 = Current;
    }
  }
  -[PGSyndicationProcessor syndicationPhotoLibraryWithError:](self, "syndicationPhotoLibraryWithError:", a3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    *(_QWORD *)buf = 0;
    *(_QWORD *)&v27 = buf;
    *((_QWORD *)&v27 + 1) = 0x3032000000;
    v28 = __Block_byref_object_copy__15800;
    v29 = __Block_byref_object_dispose__15801;
    v30 = objc_alloc_init(MEMORY[0x1E0C99D20]);
    workingContext = self->_workingContext;
    v21[0] = MEMORY[0x1E0C809B0];
    v21[1] = 3221225472;
    v21[2] = __84__PGSyndicationProcessor_processSyndicatedAssetRevGeoCodingWithError_progressBlock___block_invoke;
    v21[3] = &unk_1E84355C8;
    v21[4] = buf;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v21);
    -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = [PGRevGeocodeProcessor alloc];
    v15 = *(_QWORD *)(v27 + 40);
    -[PGManagerWorkingContext locationCache](self->_workingContext, "locationCache");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = -[PGRevGeocodeProcessor initWithPhotoLibrary:homeLocations:loggingConnection:locationCache:](v14, "initWithPhotoLibrary:homeLocations:loggingConnection:locationCache:", v11, v15, v13, v16);

    +[PGRevGeocodeProcessor momentsRequiringRevGeocodingWithUUIDs:inPhotoLibrary:defaultToAllAssets:loggingConnection:](PGRevGeocodeProcessor, "momentsRequiringRevGeocodingWithUUIDs:inPhotoLibrary:defaultToAllAssets:loggingConnection:", 0, v11, 1, v13);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[PGRevGeocodeProcessor revGeocodeMoments:progressBlock:](v17, "revGeocodeMoments:progressBlock:", v18, v6);
    if (v7)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        v20 = 0;
        v7[2](v7, (uint8_t *)&v20, 1.0);
        if (v20)
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v22 = 67109378;
            v23 = 750;
            v24 = 2080;
            v25 = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framework/Synd"
                  "ication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", v22, 0x12u);
          }
          v10 = 0;
        }
      }
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v7)
    {
      if (CFAbsoluteTimeGetCurrent() - v8 >= 0.01)
      {
        v22[0] = 0;
        v7[2](v7, v22, 1.0);
        if (v22[0])
        {
          if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109378;
            *(_DWORD *)&buf[4] = 736;
            LOWORD(v27) = 2080;
            *(_QWORD *)((char *)&v27 + 2) = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/"
                                            "PhotosGraph/Framework/Syndication/PGSyndicationProcessor.m";
            _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
          }
        }
      }
    }
    v10 = 0;
  }

LABEL_23:
  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_curationSession, 0);
  objc_storeStrong((id *)&self->_syndicationLibrary, 0);
  objc_storeStrong((id *)&self->_similarStacker, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

void __84__PGSyndicationProcessor_processSyndicatedAssetRevGeoCodingWithError_progressBlock___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(a2, "graph");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "meNodeCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "homeNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addressNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locations");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v8 = *(void **)(v7 + 40);
  *(_QWORD *)(v7 + 40) = v6;

}

void __130__PGSyndicationProcessor_duplicateAssetUUIDsForSuggesterResult_assetsInferredAsGuestAsset_syndicationLibrary_error_progressBlock___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a2, "creationDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "creationDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "timeIntervalSinceDate:", v6);
}

void __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  double v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[4];
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  uint64_t v23;
  id v24;
  id v25;
  id v26;
  __int128 v27;
  _QWORD *v28;
  uint64_t v29;
  double v30;
  _QWORD v31[4];

  v3 = a2;
  objc_msgSend(v3, "graph");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *(id *)(a1 + 32);
  if (!v5)
  {
    v6 = *(_QWORD *)(a1 + 40);
    v7 = *(_QWORD *)(a1 + 48);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 56) + 8), "photoLibrary");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[PGShareBackSuggester shareBackSuggesterForSyndicationWithLoggingConnection:syndicationPhotoLibrary:systemPhotoLibrary:graph:serviceManager:](PGShareBackSuggester, "shareBackSuggesterForSyndicationWithLoggingConnection:syndicationPhotoLibrary:systemPhotoLibrary:graph:serviceManager:", v6, v7, v8, v4, *(_QWORD *)(a1 + 64));
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  v9 = 1.0 / (double)(unint64_t)objc_msgSend(*(id *)(a1 + 72), "count");
  v31[0] = 0;
  v31[1] = v31;
  v31[2] = 0x2020000000;
  v31[3] = 0;
  v10 = *(void **)(a1 + 72);
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_2;
  v16[3] = &unk_1E8429C50;
  v17 = *(id *)(a1 + 40);
  v18 = *(id *)(a1 + 80);
  v19 = *(id *)(a1 + 88);
  v11 = v4;
  v20 = v11;
  v12 = v5;
  v21 = v12;
  v13 = v3;
  v14 = *(_QWORD *)(a1 + 56);
  v22 = v13;
  v23 = v14;
  v24 = *(id *)(a1 + 96);
  v25 = *(id *)(a1 + 48);
  v26 = *(id *)(a1 + 104);
  v15 = *(_QWORD *)(a1 + 128);
  v27 = *(_OWORD *)(a1 + 112);
  v28 = v31;
  v29 = v15;
  v30 = v9;
  objc_msgSend(v10, "enumerateKeysAndObjectsUsingBlock:", v16);

  _Block_object_dispose(v31, 8);
}

void __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_213(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  double Current;
  uint64_t v14;

  if (*(_QWORD *)(a1 + 88))
  {
    v2 = 0;
    v3 = *MEMORY[0x1E0CD1AA0];
    while (1)
    {
      v4 = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = *(void **)(a1 + 40);
      objc_msgSend(v5, "uuid");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "objectForKeyedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9)
      {
        objc_msgSend(v6, "setSyndicationProcessingValue:", objc_msgSend(v9, "unsignedShortValue"));
        v10 = PHAssetSyndicationProcessingCurrentVersionForAsset();
        v11 = objc_msgSend(*(id *)(a1 + 48), "containsObject:", v5);
        v12 = objc_msgSend(v5, "isGuestAsset");
        if (v11)
        {
          v10 = v3;
          if ((v12 & 1) == 0)
          {
            objc_msgSend(v6, "promoteToGuestAsset");
            v10 = v3;
          }
        }
        else if (v12)
        {
          objc_msgSend(v6, "resetGuestAssetPromotion");
        }
        objc_msgSend(v6, "setSyndicationProcessingVersion:", v10);
        *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(double *)(a1 + 96)
                                                                    + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                + 24);
        if (*(_QWORD *)(a1 + 56))
        {
          Current = CFAbsoluteTimeGetCurrent();
          v14 = *(_QWORD *)(*(_QWORD *)(a1 + 72) + 8);
          if (Current - *(double *)(v14 + 24) >= *(double *)(a1 + 104))
          {
            *(double *)(v14 + 24) = Current;
            (*(void (**)(double))(*(_QWORD *)(a1 + 56) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 64)
                                                                                                 + 8)
                                                                                     + 24)
                                                                         * 0.25 + 0.75);
            *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80)
                                                                                              + 8)
                                                                                  + 24);
            if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 80) + 8) + 24))
              break;
          }
        }
      }

      objc_autoreleasePoolPop(v4);
      if ((unint64_t)++v2 >= *(_QWORD *)(a1 + 88))
        return;
    }

    objc_autoreleasePoolPop(v4);
  }
}

void __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_2(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  double Current;
  uint64_t v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  __int128 v26;
  uint64_t v27;
  uint64_t v28;

  v7 = a2;
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_3;
  v14[3] = &unk_1E8429C28;
  v15 = *(id *)(a1 + 32);
  v16 = *(id *)(a1 + 40);
  v17 = *(id *)(a1 + 48);
  v8 = v7;
  v18 = v8;
  v19 = *(id *)(a1 + 56);
  v20 = *(id *)(a1 + 64);
  v9 = *(id *)(a1 + 72);
  v10 = *(_QWORD *)(a1 + 80);
  v11 = *(void **)(a1 + 88);
  v21 = v9;
  v22 = v10;
  v23 = v11;
  v24 = *(id *)(a1 + 96);
  v25 = *(id *)(a1 + 104);
  v28 = *(_QWORD *)(a1 + 136);
  v26 = *(_OWORD *)(a1 + 112);
  v27 = *(_QWORD *)(a1 + 128);
  objc_msgSend(a3, "enumerateKeysAndObjectsUsingBlock:", v14);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) = *(double *)(a1 + 144)
                                                               + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8)
                                                                           + 24);
  if (*(_QWORD *)(a1 + 104))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 112) + 8);
    if (Current - *(double *)(v13 + 24) >= *(double *)(a1 + 136))
    {
      *(double *)(v13 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 104) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8)
                                                                                + 24)
                                                                    * 0.5 + 0.25);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8)
                                                                             + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 120) + 8) + 24))
        *a4 = 1;
    }
  }

}

void __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_3(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  PGShareBackSuggesterResult *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  id v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  id v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  void *v41;
  id v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t j;
  void *v47;
  void *v48;
  void *v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t k;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  NSObject *v58;
  double Current;
  uint64_t v60;
  uint64_t v61;
  _BYTE *v62;
  id v63;
  id v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  id obj;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  _QWORD v78[4];
  id v79;
  __int128 v80;
  uint64_t v81;
  id v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  id v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  _BYTE v92[5];
  uint8_t v93[128];
  uint8_t buf[4];
  id v95;
  _BYTE v96[128];
  _BYTE v97[128];
  uint64_t v98;

  v61 = a4;
  v98 = *MEMORY[0x1E0C80C00];
  v67 = a2;
  v6 = a3;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v88 = 0u;
  v89 = 0u;
  v90 = 0u;
  v91 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
  v10 = v7;
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v89;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v89 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v88 + 1) + 8 * i);
        if (objc_msgSend(v14, "creationDateSource", v61) == 3)
        {
          v15 = *(NSObject **)(a1 + 32);
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            *(_WORD *)buf = 0;
            _os_log_error_impl(&dword_1CA237000, v15, OS_LOG_TYPE_ERROR, "PGSyndicationProcessor: Skipping syndicated asset due to invalid creationDateSource", buf, 2u);
          }
          v16 = *(void **)(a1 + 40);
          objc_msgSend(v14, "uuid");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setObject:forKeyedSubscript:", &unk_1E84E32F0, v17);

          v7 = v10;
          objc_msgSend(v10, "addObject:", v14);
        }
      }
      v11 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v88, v97, 16);
    }
    while (v11);
  }

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v8, "arrayByExcludingObjectsInArray:", v7);
    v18 = objc_claimAutoreleasedReturnValue();

    v8 = (id)v18;
  }
  v19 = v67;
  v68 = v8;
  objc_msgSend(*(id *)(a1 + 48), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 56), v61);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v20, "containsObject:", v67))
  {
    +[PGGraphMomentNodeCollection momentNodeForUUID:inGraph:](PGGraphMomentNodeCollection, "momentNodeForUUID:inGraph:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = [PGShareBackSuggesterResult alloc];
    objc_msgSend(v21, "temporarySet");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = 128;
    v25 = -[PGShareBackSuggesterResult initWithInputs:processingValue:momentNodes:](v22, "initWithInputs:processingValue:momentNodes:", v8, 128, v23);

    if (v25)
    {
      v26 = (void *)v25;
      v27 = 0;
LABEL_30:
      v38 = *(void **)(a1 + 88);
      v39 = *(_QWORD *)(a1 + 96);
      v82 = 0;
      v78[0] = MEMORY[0x1E0C809B0];
      v78[1] = 3221225472;
      v78[2] = __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_207;
      v78[3] = &unk_1E8434F30;
      v40 = *(_QWORD *)(a1 + 104);
      v79 = *(id *)(a1 + 112);
      v81 = *(_QWORD *)(a1 + 144);
      v80 = *(_OWORD *)(a1 + 120);
      objc_msgSend(v38, "duplicateAssetUUIDsForSuggesterResult:assetsInferredAsGuestAsset:syndicationLibrary:error:progressBlock:", v26, v39, v40, &v82, v78);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      obj = v82;
      if (v41)
      {
        v64 = v27;
        v65 = v20;
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v42 = v68;
        v43 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v74, v93, 16);
        if (v43)
        {
          v44 = v43;
          v45 = *(_QWORD *)v75;
          do
          {
            for (j = 0; j != v44; ++j)
            {
              if (*(_QWORD *)v75 != v45)
                objc_enumerationMutation(v42);
              v47 = *(void **)(*((_QWORD *)&v74 + 1) + 8 * j);
              objc_msgSend(v47, "uuid");
              v48 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v41, "containsObject:", v48))
              {
                objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", &unk_1E84E3308, v48);
              }
              else
              {
                objc_msgSend(*(id *)(a1 + 96), "addObject:", v47);
                objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", objc_msgSend(v26, "processingValue"));
                v49 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(*(id *)(a1 + 40), "setObject:forKeyedSubscript:", v49, v48);

              }
            }
            v44 = objc_msgSend(v42, "countByEnumeratingWithState:objects:count:", &v74, v93, 16);
          }
          while (v44);
        }

        v20 = v65;
        v19 = v67;
        v27 = v64;
      }
      else
      {
        v58 = *(NSObject **)(a1 + 32);
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v95 = obj;
          _os_log_impl(&dword_1CA237000, v58, OS_LOG_TYPE_DEFAULT, "Issue while running deduping, skipping processing for this batch: %@", buf, 0xCu);
        }
      }

LABEL_55:
      goto LABEL_56;
    }
  }
  else
  {
    v24 = 0;
  }
  v28 = *(void **)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 80), "graph");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  v87 = 0;
  objc_msgSend(v28, "suggesterResultsForInputs:inGraph:error:", v8, v29, &v87);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = v87;

  if (v30)
  {
    v63 = v27;
    v85 = 0u;
    v86 = 0u;
    v83 = 0u;
    v84 = 0u;
    v31 = v30;
    v32 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
    if (v32)
    {
      v33 = v32;
      v34 = *(_QWORD *)v84;
LABEL_21:
      v35 = 0;
      while (1)
      {
        if (*(_QWORD *)v84 != v34)
          objc_enumerationMutation(v31);
        v36 = *(void **)(*((_QWORD *)&v83 + 1) + 8 * v35);
        v24 = objc_msgSend(v36, "processingValue");
        if ((v24 & 0x7EF0) != 0)
          break;
        if (v33 == ++v35)
        {
          v33 = objc_msgSend(v31, "countByEnumeratingWithState:objects:count:", &v83, v96, 16);
          if (v33)
            goto LABEL_21;
          goto LABEL_27;
        }
      }
      v37 = v36;

      v27 = v63;
      if (!v37)
        goto LABEL_42;
      v26 = v37;
      goto LABEL_30;
    }
LABEL_27:

    v27 = v63;
  }
LABEL_42:
  if (!v27)
  {
    v72 = 0u;
    v73 = 0u;
    v70 = 0u;
    v71 = 0u;
    obj = v68;
    v50 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v92, 16);
    if (v50)
    {
      v51 = v50;
      v66 = v20;
      v52 = *(_QWORD *)v71;
      do
      {
        for (k = 0; k != v51; ++k)
        {
          if (*(_QWORD *)v71 != v52)
            objc_enumerationMutation(obj);
          v54 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * k);
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v24);
          v55 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = *(void **)(a1 + 40);
          objc_msgSend(v54, "uuid");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v56, "setObject:forKeyedSubscript:", v55, v57);

        }
        v51 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v92, 16);
      }
      while (v51);
      v26 = 0;
      v27 = 0;
      v20 = v66;
      v19 = v67;
    }
    else
    {
      v26 = 0;
      v27 = 0;
    }
    goto LABEL_55;
  }
  v26 = 0;
LABEL_56:
  if (*(_QWORD *)(a1 + 112))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v60 = *(_QWORD *)(*(_QWORD *)(a1 + 120) + 8);
    if (Current - *(double *)(v60 + 24) >= *(double *)(a1 + 144))
    {
      *(double *)(v60 + 24) = Current;
      buf[0] = 0;
      (*(void (**)(double))(*(_QWORD *)(a1 + 112) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 136) + 8)
                                                                                + 24)
                                                                    * 0.5 + 0.25);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24) |= buf[0];
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 128) + 8) + 24))
        *v62 = 1;
    }
  }

}

void __105__PGSyndicationProcessor_processSyndicatedAssetGuestInferenceWithError_progressBlock_shareBackSuggester___block_invoke_207(uint64_t a1, _BYTE *a2)
{
  double Current;
  uint64_t v5;

  if (*(_QWORD *)(a1 + 32))
  {
    Current = CFAbsoluteTimeGetCurrent();
    v5 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    if (Current - *(double *)(v5 + 24) >= *(double *)(a1 + 56))
    {
      *(double *)(v5 + 24) = Current;
      (*(void (**)(double))(*(_QWORD *)(a1 + 32) + 16))(0.25);
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 24);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
        *a2 = 1;
    }
  }
}

void __78__PGSyndicationProcessor_processSavedSyndicatedAssetsWithError_progressBlock___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  double Current;
  uint64_t v8;

  if (*(_QWORD *)(a1 + 72))
  {
    v2 = 0;
    v3 = *MEMORY[0x1E0CD1AA0];
    while (1)
    {
      v4 = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", v5);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setSyndicationProcessingValue:", 4096);
      objc_msgSend(v6, "setSyndicationProcessingVersion:", v3);
      objc_msgSend(v6, "promoteToGuestAsset");
      *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(double *)(a1 + 80)
                                                                  + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                              + 24);
      if (*(_QWORD *)(a1 + 40))
      {
        Current = CFAbsoluteTimeGetCurrent();
        v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        if (Current - *(double *)(v8 + 24) >= *(double *)(a1 + 88))
        {
          *(double *)(v8 + 24) = Current;
          (*(void (**)(double))(*(_QWORD *)(a1 + 40) + 16))(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48)
                                                                                               + 8)
                                                                                   + 24));
          *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)
                                                                                + 24);
          if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
            break;
        }
      }

      objc_autoreleasePoolPop(v4);
      if ((unint64_t)++v2 >= *(_QWORD *)(a1 + 72))
        return;
    }

    objc_autoreleasePoolPop(v4);
  }
}

uint64_t __64__PGSyndicationProcessor__persistCurationScores_inPhotoLibrary___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_15902);
}

void __64__PGSyndicationProcessor__persistCurationScores_inPhotoLibrary___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0CD13B0];
  v5 = a3;
  v6 = a2;
  objc_msgSend(v4, "changeRequestForAsset:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "doubleValue");
  v8 = v7;

  objc_msgSend(v9, "setCurationScore:", v8);
  LODWORD(v4) = objc_msgSend(v6, "isGuestAsset");

  if ((_DWORD)v4 && v8 <= *MEMORY[0x1E0D77DF0])
    objc_msgSend(v9, "resetGuestAssetPromotion");

}

@end
