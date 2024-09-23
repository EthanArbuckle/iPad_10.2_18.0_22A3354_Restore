@implementation PGExternalAssetProcessor

- (PGExternalAssetProcessor)initWithWorkingContext:(id)a3
{
  id v5;
  PGExternalAssetProcessor *v6;
  PGExternalAssetProcessor *v7;
  uint64_t v8;
  PHPhotoLibrary *photoLibrary;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PGExternalAssetProcessor;
  v6 = -[PGExternalAssetProcessor init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_workingContext, a3);
    -[PGManagerWorkingContext photoLibrary](v7->_workingContext, "photoLibrary");
    v8 = objc_claimAutoreleasedReturnValue();
    photoLibrary = v7->_photoLibrary;
    v7->_photoLibrary = (PHPhotoLibrary *)v8;

  }
  return v7;
}

- (BOOL)processExternalAssetRelevanceInferenceWithError:(id *)a3 progressReporter:(id)a4
{
  return -[PGExternalAssetProcessor processExternalAssetRelevanceInferenceWithError:progressReporter:shareBackSuggester:](self, "processExternalAssetRelevanceInferenceWithError:progressReporter:shareBackSuggester:", a3, a4, 0);
}

- (BOOL)processExternalAssetRelevanceInferenceWithError:(id *)a3 progressReporter:(id)a4 shareBackSuggester:(id)a5
{
  id v8;
  id v9;
  id v10;
  char v11;
  NSObject *v12;
  os_signpost_id_t v13;
  NSObject *v14;
  NSObject *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  PGManagerWorkingContext *workingContext;
  NSObject *v26;
  id v27;
  id v28;
  id v29;
  NSObject *v30;
  uint64_t v31;
  NSObject *v32;
  uint64_t v33;
  PHPhotoLibrary *photoLibrary;
  id v35;
  uint64_t v36;
  uint32_t denom;
  uint32_t numer;
  NSObject *v39;
  NSObject *v40;
  os_signpost_id_t spid;
  void *v43;
  uint64_t v44;
  id v45;
  id v46;
  id v47;
  void *v48;
  NSObject *v49;
  id v50;
  void *v51;
  id v52;
  uint64_t v53;
  unint64_t v54;
  id v55;
  _QWORD v56[4];
  id v57;
  id v58;
  uint64_t v59;
  _QWORD v60[4];
  id v61;
  id v62;
  NSObject *v63;
  PGExternalAssetProcessor *v64;
  id v65;
  id v66;
  id v67;
  id v68;
  mach_timebase_info info;
  uint8_t buf[4];
  _BYTE v71[18];
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = a5;
  v10 = v8;
  if (!objc_msgSend(v10, "isCancelledWithProgress:", 0.0))
  {
    -[PGManagerWorkingContext loggingConnection](self->_workingContext, "loggingConnection");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = os_signpost_id_generate(v12);
    v14 = v12;
    v15 = v14;
    v54 = v13 - 1;
    if (v13 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v14))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v15, OS_SIGNPOST_INTERVAL_BEGIN, v13, "ExternalAssetRelevance", ", buf, 2u);
    }

    info = 0;
    mach_timebase_info(&info);
    v53 = mach_absolute_time();
    -[PHPhotoLibrary librarySpecificFetchOptions](self->_photoLibrary, "librarySpecificFetchOptions");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setIncludeGuestAssets:", 0);
    +[PGCurationManager assetPropertySetsForCuration](PGCurationManager, "assetPropertySetsForCuration");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setFetchPropertySets:", v17);

    objc_msgSend(MEMORY[0x1E0D77E80], "internalPredicateToIncludeExternalAssetsNeedingProcessing");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setInternalPredicate:", v18);

    objc_msgSend(MEMORY[0x1E0CD1390], "fetchAssetsWithOptions:", v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "isCancelledWithProgress:", 0.1))
    {
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
LABEL_14:
        if (a3 && !*a3)
        {
          objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
          v11 = 0;
          *a3 = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          v11 = 0;
        }
LABEL_47:

        goto LABEL_48;
      }
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v71 = 58;
      *(_WORD *)&v71[4] = 2080;
      *(_QWORD *)&v71[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/ExternalAssetProcessing/PGExternalAssetProcessor.m";
      v20 = MEMORY[0x1E0C81028];
LABEL_13:
      _os_log_impl(&dword_1CA237000, v20, OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      goto LABEL_14;
    }
    v21 = objc_msgSend(v19, "count");
    if (!v21)
    {
      if (!objc_msgSend(v10, "isCancelledWithProgress:", 1.0))
      {
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1CA237000, v15, OS_LOG_TYPE_DEFAULT, "No asset eligible for relevance processing", buf, 2u);
        }
        v11 = 1;
        goto LABEL_47;
      }
      if (!os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
        goto LABEL_14;
      *(_DWORD *)buf = 67109378;
      *(_DWORD *)v71 = 62;
      *(_WORD *)&v71[4] = 2080;
      *(_QWORD *)&v71[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Frame"
                           "work/ExternalAssetProcessing/PGExternalAssetProcessor.m";
      v20 = MEMORY[0x1E0C81028];
      goto LABEL_13;
    }
    v44 = v21;
    spid = v13;
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D42A60]), "initWithProgressReporter:", v10);
    objc_msgSend(v48, "childProgressReporterToCheckpoint:", 0.9);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[PGManagerWorkingContext serviceManager](self->_workingContext, "serviceManager");
    v23 = v19;
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    workingContext = self->_workingContext;
    v60[0] = MEMORY[0x1E0C809B0];
    v60[1] = 3221225472;
    v60[2] = __112__PGExternalAssetProcessor_processExternalAssetRelevanceInferenceWithError_progressReporter_shareBackSuggester___block_invoke;
    v60[3] = &unk_1E8434880;
    v47 = v22;
    v61 = v47;
    v50 = v9;
    v62 = v9;
    v49 = v15;
    v26 = v15;
    v63 = v26;
    v64 = self;
    v27 = v24;
    v19 = v23;
    v46 = v27;
    v65 = v27;
    v28 = v23;
    v66 = v28;
    v52 = v51;
    v67 = v52;
    v29 = v43;
    v68 = v29;
    -[PGManagerWorkingContext performSynchronousConcurrentGraphReadUsingBlock:](workingContext, "performSynchronousConcurrentGraphReadUsingBlock:", v60);
    v30 = v26;
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      v31 = objc_msgSend(v28, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v71 = v31;
      _os_log_impl(&dword_1CA237000, v30, OS_LOG_TYPE_DEFAULT, "%lu external assets processed", buf, 0xCu);
    }

    v32 = v30;
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      v33 = objc_msgSend(v52, "count");
      *(_DWORD *)buf = 134217984;
      *(_QWORD *)v71 = v33;
      _os_log_impl(&dword_1CA237000, v32, OS_LOG_TYPE_DEFAULT, "%lu external assets inferred as relevant", buf, 0xCu);
    }

    photoLibrary = self->_photoLibrary;
    v56[0] = MEMORY[0x1E0C809B0];
    v56[1] = 3221225472;
    v56[2] = __112__PGExternalAssetProcessor_processExternalAssetRelevanceInferenceWithError_progressReporter_shareBackSuggester___block_invoke_183;
    v56[3] = &unk_1E84348A8;
    v59 = v44;
    v57 = v28;
    v45 = v29;
    v58 = v45;
    v55 = 0;
    v11 = -[PHPhotoLibrary performChangesAndWait:error:](photoLibrary, "performChangesAndWait:error:", v56, &v55);
    v35 = v55;
    v9 = v50;
    if ((v11 & 1) == 0)
    {
      if (!os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        if (!a3)
          goto LABEL_26;
        goto LABEL_25;
      }
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v71 = v35;
      _os_log_error_impl(&dword_1CA237000, v32, OS_LOG_TYPE_ERROR, "Error saving external asset inference to database: %@", buf, 0xCu);
      if (a3)
LABEL_25:
        *a3 = objc_retainAutorelease(v35);
    }
LABEL_26:
    v36 = mach_absolute_time();
    numer = info.numer;
    denom = info.denom;
    v39 = v32;
    v40 = v39;
    if (v54 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v39))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1CA237000, v40, OS_SIGNPOST_INTERVAL_END, spid, "ExternalAssetRelevance", ", buf, 2u);
    }

    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)v71 = "ExternalAssetRelevance";
      *(_WORD *)&v71[8] = 2048;
      *(double *)&v71[10] = (float)((float)((float)((float)(v36 - v53) * (float)numer) / (float)denom) / 1000000.0);
      _os_log_impl(&dword_1CA237000, v40, OS_LOG_TYPE_INFO, "[Performance] %s: %f ms", buf, 0x16u);
    }
    v15 = v49;
    if (objc_msgSend(v10, "isCancelledWithProgress:", 1.0))
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)v71 = 154;
        *(_WORD *)&v71[4] = 2080;
        *(_QWORD *)&v71[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Fra"
                             "mework/ExternalAssetProcessing/PGExternalAssetProcessor.m";
        _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
      }
      if (a3 && !*a3)
      {
        objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
        v11 = 0;
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v11 = 0;
      }
    }

    goto LABEL_47;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v71 = 46;
    *(_WORD *)&v71[4] = 2080;
    *(_QWORD *)&v71[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/ExternalAssetProcessing/PGExternalAssetProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }
  if (a3 && !*a3)
  {
    objc_msgSend(MEMORY[0x1E0D42A08], "errorForCode:", -4);
    v11 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v11 = 0;
  }
LABEL_48:

  return v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_workingContext, 0);
}

void __112__PGExternalAssetProcessor_processExternalAssetRelevanceInferenceWithError_progressReporter_shareBackSuggester___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  void *v5;
  unint64_t v6;
  __int128 v7;
  double v8;
  double v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  unsigned __int16 v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  int v20;
  unsigned __int16 v21;
  id v22;
  NSObject *v23;
  id v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t j;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  __int128 v33;
  void *v34;
  id obj;
  int v36;
  id v37;
  uint64_t v38;
  uint64_t v39;
  id v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  id v45;
  id v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint8_t buf[4];
  _BYTE v61[14];
  _BYTE v62[128];
  _BYTE v63[128];
  _BYTE v64[128];
  uint64_t v65;

  v65 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v37 = *(id *)(a1 + 32);
  v34 = v3;
  objc_msgSend(v3, "graph");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v40 = *(id *)(a1 + 40);
  if (!v40)
  {
    +[PGShareBackSuggester shareBackSuggesterForExternalAssetProcessingWithLoggingConnection:photoLibrary:graph:serviceManager:](PGShareBackSuggester, "shareBackSuggesterForExternalAssetProcessingWithLoggingConnection:photoLibrary:graph:serviceManager:", *(_QWORD *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16), v41, *(_QWORD *)(a1 + 64));
    v40 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = objc_msgSend(*(id *)(a1 + 40), "positiveProcessingValue");
  objc_msgSend((id)objc_opt_class(), "clusterAssetsToProcess:inPhotoLibrary:", *(_QWORD *)(a1 + 72), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 16));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");
  v56 = 0u;
  v57 = 0u;
  v58 = 0u;
  v59 = 0u;
  obj = v5;
  v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
  if (!v39)
    goto LABEL_42;
  v8 = 1.0 / (double)v6;
  v38 = *(_QWORD *)v57;
  v9 = 0.0;
  *(_QWORD *)&v7 = 138412290;
  v33 = v7;
  v36 = v4;
LABEL_5:
  v10 = 0;
  while (1)
  {
    if (*(_QWORD *)v57 != v38)
      objc_enumerationMutation(obj);
    v11 = *(void **)(*((_QWORD *)&v56 + 1) + 8 * v10);
    v12 = (void *)MEMORY[0x1CAA4EB2C]();
    v55 = 0;
    objc_msgSend(v40, "suggesterResultsForInputs:inGraph:error:", v11, v41, &v55);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v46 = v55;
    if (v13)
      break;
    v23 = *(NSObject **)(a1 + 48);
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = v33;
      *(_QWORD *)v61 = v46;
      _os_log_error_impl(&dword_1CA237000, v23, OS_LOG_TYPE_ERROR, "PGShareBackSuggesterResults returned from PGShareBackSuggester is nil: %@", buf, 0xCu);
    }
    v22 = 0;
LABEL_36:

    objc_autoreleasePoolPop(v12);
    if (++v10 == v39)
    {
      v39 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v56, v64, 16);
      if (!v39)
        goto LABEL_42;
      goto LABEL_5;
    }
  }
  v42 = v13;
  v43 = v10;
  v53 = 0u;
  v54 = 0u;
  v51 = 0u;
  v52 = 0u;
  v45 = v13;
  v14 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
  v44 = v12;
  if (v14)
  {
    v15 = v14;
    v16 = 0;
    v17 = *(_QWORD *)v52;
    while (2)
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v52 != v17)
          objc_enumerationMutation(v45);
        v19 = *(void **)(*((_QWORD *)&v51 + 1) + 8 * i);
        v20 = objc_msgSend(v19, "processingValue", v33);
        v21 = v20;
        if ((v20 & v4) != 0)
        {
          v22 = v19;
          v16 = v21;
          goto LABEL_23;
        }
        v16 |= v20;
      }
      v15 = objc_msgSend(v45, "countByEnumeratingWithState:objects:count:", &v51, v63, 16);
      if (v15)
        continue;
      break;
    }
    v22 = 0;
  }
  else
  {
    v22 = 0;
    v16 = 0;
  }
LABEL_23:

  v49 = 0u;
  v50 = 0u;
  v47 = 0u;
  v48 = 0u;
  v24 = v11;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  if (!v25)
    goto LABEL_34;
  v26 = v25;
  v27 = *(_QWORD *)v48;
  do
  {
    for (j = 0; j != v26; ++j)
    {
      if (*(_QWORD *)v48 != v27)
        objc_enumerationMutation(v24);
      v29 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * j);
      if (v22)
      {
        objc_msgSend(*(id *)(a1 + 80), "addObject:", *(_QWORD *)(*((_QWORD *)&v47 + 1) + 8 * j));
LABEL_30:
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v16, v33);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = *(void **)(a1 + 88);
        objc_msgSend(v29, "uuid");
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setObject:forKeyedSubscript:", v30, v32);

        continue;
      }
      if (!v46)
        goto LABEL_30;
    }
    v26 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v47, v62, 16);
  }
  while (v26);
LABEL_34:

  v9 = v8 + v9;
  if (!objc_msgSend(v37, "isCancelledWithProgress:", v9))
  {
    v4 = v36;
    v10 = v43;
    v12 = v44;
    v13 = v42;
    goto LABEL_36;
  }
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109378;
    *(_DWORD *)v61 = 120;
    *(_WORD *)&v61[4] = 2080;
    *(_QWORD *)&v61[6] = "/Library/Caches/com.apple.xbs/Sources/Photos_Swift/workspaces/photoanalysis/PhotosGraph/Framewo"
                         "rk/ExternalAssetProcessing/PGExternalAssetProcessor.m";
    _os_log_impl(&dword_1CA237000, MEMORY[0x1E0C81028], OS_LOG_TYPE_INFO, "Cancelled at line %d in file %s", buf, 0x12u);
  }

  objc_autoreleasePoolPop(v44);
LABEL_42:

}

void __112__PGExternalAssetProcessor_processExternalAssetRelevanceInferenceWithError_progressReporter_shareBackSuggester___block_invoke_183(uint64_t a1)
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (*(_QWORD *)(a1 + 48))
  {
    v2 = 0;
    v3 = *MEMORY[0x1E0D77F38];
    do
    {
      v4 = (void *)MEMORY[0x1CAA4EB2C]();
      objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", v2);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = *(void **)(a1 + 40);
      objc_msgSend(v5, "uuid");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v8)
      {
        objc_msgSend(MEMORY[0x1E0CD13B0], "changeRequestForAsset:", v5);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setSyndicationProcessingValue:", objc_msgSend(v8, "unsignedShortValue"));
        objc_msgSend(v9, "setSyndicationProcessingVersion:", v3);

      }
      objc_autoreleasePoolPop(v4);
      ++v2;
    }
    while (v2 < *(_QWORD *)(a1 + 48));
  }
}

+ (id)clusterAssetsToProcess:(id)a3 inPhotoLibrary:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  uint64_t v20;
  void *v21;
  __CFString *v22;
  __CFString *v23;
  void *v24;
  id v25;
  void *v26;
  id obj;
  void *v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0CD1670];
  objc_msgSend(a4, "librarySpecificFetchOptions");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchMomentUUIDByAssetUUIDForAssets:options:", v5, v7);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  obj = v5;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v31;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v31 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v13, "uuid");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKeyedSubscript:", v14);
        v15 = objc_claimAutoreleasedReturnValue();
        v16 = (void *)v15;
        if (v15)
          v17 = (void *)v15;
        else
          v17 = v14;
        v18 = v17;

        objc_msgSend(v13, "curationProperties");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "importedByBundleIdentifier");
        v20 = objc_claimAutoreleasedReturnValue();
        v21 = (void *)v20;
        v22 = &stru_1E8436F28;
        if (v20)
          v22 = (__CFString *)v20;
        v23 = v22;

        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@-%@"), v18, v23);
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v8, "objectForKeyedSubscript:", v24);
        v25 = (id)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          v25 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          objc_msgSend(v8, "setObject:forKeyedSubscript:", v25, v24);
        }
        objc_msgSend(v25, "addObject:", v13);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v30, v34, 16);
    }
    while (v10);
  }

  objc_msgSend(v8, "allValues");
  v26 = (void *)objc_claimAutoreleasedReturnValue();

  return v26;
}

@end
