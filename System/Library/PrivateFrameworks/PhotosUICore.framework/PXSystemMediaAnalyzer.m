@implementation PXSystemMediaAnalyzer

- (id)requestAnalysisForAssets:(id)a3 options:(unint64_t)a4 contexts:(id)a5 resultHandler:(id)a6
{
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  double v14;
  id v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  unint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  id v23;
  id v24;
  id v25;
  void *v26;
  id v27;
  _QWORD v29[4];
  void *v30;
  int v31;
  _QWORD v32[4];
  id v33;
  id v34;
  double v35;
  _QWORD v36[4];
  id v37;
  double v38;

  v9 = a3;
  v10 = a5;
  v11 = a6;
  v12 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
  objc_msgSend(MEMORY[0x1E0D475C8], "sharedMediaAnalyzer");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (double)(unint64_t)(100 * objc_msgSend(v9, "count")) + 1.0;
  objc_msgSend(v12, "setTotalUnitCount:", (uint64_t)v14);
  v15 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  v16 = v15;
  if ((a4 & 2) != 0)
  {
    objc_msgSend(v15, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D47678]);
    v17 = 0x40000;
    if ((a4 & 1) == 0)
      goto LABEL_6;
    goto LABEL_5;
  }
  v17 = 0;
  if ((a4 & 1) != 0)
LABEL_5:
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D47648]);
LABEL_6:
  if ((a4 & 0x10) != 0)
    objc_msgSend(v16, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D47650]);
  v18 = objc_msgSend(v10, "count");
  if (v18 == objc_msgSend(v9, "count"))
    objc_msgSend(v16, "setObject:forKeyedSubscript:", v10, *MEMORY[0x1E0D47660]);
  v19 = v17 & 0xFFFFFFFF7FFFFFFFLL | (((a4 >> 5) & 1) << 31);
  v20 = v19 | 0xA00018;
  if ((a4 & 4) == 0)
    v20 = v19;
  v21 = v20 | ((_DWORD)a4 << 20) & 0x800000;
  v22 = MEMORY[0x1E0C809B0];
  v36[0] = MEMORY[0x1E0C809B0];
  v36[1] = 3221225472;
  v36[2] = __81__PXSystemMediaAnalyzer_requestAnalysisForAssets_options_contexts_resultHandler___block_invoke;
  v36[3] = &unk_1E5125DC8;
  v37 = v12;
  v38 = v14;
  v32[0] = v22;
  v32[1] = 3221225472;
  v32[2] = __81__PXSystemMediaAnalyzer_requestAnalysisForAssets_options_contexts_resultHandler___block_invoke_2;
  v32[3] = &unk_1E5125DF0;
  v23 = v37;
  v35 = v14;
  v33 = v23;
  v34 = v11;
  v24 = v11;
  LODWORD(v21) = objc_msgSend(v13, "requestAnalysis:forAssets:withOptions:andProgressHandler:andCompletionHandler:", v21, v9, v16, v36, v32);
  objc_msgSend(v23, "setCancellable:", 1);
  v29[0] = v22;
  v29[1] = 3221225472;
  v29[2] = __81__PXSystemMediaAnalyzer_requestAnalysisForAssets_options_contexts_resultHandler___block_invoke_3;
  v29[3] = &unk_1E5144680;
  v30 = v13;
  v31 = v21;
  v25 = v13;
  objc_msgSend(v23, "setCancellationHandler:", v29);
  v26 = v30;
  v27 = v23;

  return v27;
}

- (id)requestMatchedTimeRangesForAsset:(id)a3 searchQueryMatchInfo:(id)a4 resultHandler:(id)a5
{
  id v9;
  id v10;
  void (**v11)(id, _QWORD);
  id v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  NSObject *v34;
  id v35;
  void *v37;
  uint64_t v38;
  id v39;
  id v40;
  int v41;
  id v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;
  void *v55;
  id v56;
  void *v57;
  _QWORD v58[4];
  id v59;
  void *v60;
  int v61;
  _QWORD v62[4];
  id v63;
  id v64;
  void (**v65)(id, _QWORD);
  uint64_t v66;
  _QWORD v67[4];
  id v68;
  uint64_t v69;
  void *v70;
  _QWORD v71[5];
  _QWORD v72[5];
  uint8_t buf[4];
  id v74;
  __int16 v75;
  id v76;
  uint64_t v77;

  v77 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void (**)(id, _QWORD))a5;
  v12 = v9;
  if (!objc_opt_class() || (objc_opt_isKindOfClass() & 1) == 0)
  {

    goto LABEL_31;
  }
  v13 = v12;

  if (!v13)
  {
LABEL_31:
    PLUIGetLog();
    v34 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v74 = v12;
      _os_log_impl(&dword_1A6789000, v34, OS_LOG_TYPE_INFO, "PXSystemMediaAnalyzer: Unable to analyze unsupported asset: %@", buf, 0xCu);
    }

    v11[2](v11, MEMORY[0x1E0C9AA60]);
    v13 = 0;
    goto LABEL_34;
  }
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXMediaAnalyzer.m"), 107, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("resultHandler"));

  }
  objc_msgSend(v10, "personLocalIdentifiers");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "count"))
    goto LABEL_13;
  objc_msgSend(v10, "sceneIdentifiers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v15, "count"))
  {
    objc_msgSend(v10, "audioIdentifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "count"))
    {
LABEL_11:

      goto LABEL_12;
    }
    objc_msgSend(v10, "humanActionIdentifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "count"))
    {

      goto LABEL_11;
    }
    objc_msgSend(v10, "queryEmbedding");
    v44 = (void *)objc_claimAutoreleasedReturnValue();

    if (v44)
      goto LABEL_14;
    PLUIGetLog();
    v45 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(v13, "localIdentifier");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v74 = v46;
      _os_log_impl(&dword_1A6789000, v45, OS_LOG_TYPE_INFO, "PXSystemMediaAnalyzer: No identifiers provided. Skipping matched time range request for asset: %@", buf, 0xCu);

    }
    v11[2](v11, MEMORY[0x1E0C9AA60]);
LABEL_34:
    v35 = 0;
    goto LABEL_35;
  }
LABEL_12:

LABEL_13:
LABEL_14:
  PLUIGetLog();
  v18 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(v13, "localIdentifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    v74 = v19;
    v75 = 2112;
    v76 = v10;
    _os_log_impl(&dword_1A6789000, v18, OS_LOG_TYPE_INFO, "PXSystemMediaAnalyzer: Requesting matched time ranges for asset: %@, searchQueryMatchInfo: %@", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x1E0D475C8], "sharedMediaAnalyzer");
  v20 = objc_claimAutoreleasedReturnValue();
  v56 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
  objc_msgSend(v56, "setTotalUnitCount:", 101);
  v54 = objc_alloc(MEMORY[0x1E0D475D0]);
  v71[0] = &unk_1E53ED068;
  objc_msgSend(v10, "sceneIdentifiers");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v53, "allObjects");
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)MEMORY[0x1E0C9AA60];
  v52 = (void *)v21;
  if (v21)
    v23 = v21;
  else
    v23 = MEMORY[0x1E0C9AA60];
  v72[0] = v23;
  v71[1] = &unk_1E53ED080;
  objc_msgSend(v10, "personLocalIdentifiers");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "allObjects");
  v24 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v24;
  if (v24)
    v26 = v24;
  else
    v26 = (uint64_t)v22;
  v72[1] = v26;
  v71[2] = &unk_1E53ED098;
  objc_msgSend(v10, "humanActionIdentifiers");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "allObjects");
  v27 = objc_claimAutoreleasedReturnValue();
  v28 = (void *)v27;
  if (v27)
    v29 = v27;
  else
    v29 = (uint64_t)v22;
  v72[2] = v29;
  v71[3] = &unk_1E53ED0B0;
  objc_msgSend(v10, "audioIdentifiers");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "allObjects");
  v30 = objc_claimAutoreleasedReturnValue();
  v31 = (void *)v30;
  if (v30)
    v32 = v30;
  else
    v32 = (uint64_t)v22;
  v72[3] = v32;
  v71[4] = &unk_1E53ED0C8;
  objc_msgSend(v10, "queryEmbedding");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v57 = (void *)v20;
  if (v33)
  {
    objc_msgSend(v10, "queryEmbedding");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v70 = v48;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v70, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v72[4] = v22;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v72, v71, 5);
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v55 = (void *)objc_msgSend(v54, "initWithEntities:", v37);

  if (v33)
  {

  }
  v38 = MEMORY[0x1E0C809B0];
  v67[0] = MEMORY[0x1E0C809B0];
  v67[1] = 3221225472;
  v67[2] = __93__PXSystemMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke;
  v67[3] = &unk_1E5125E18;
  v68 = v56;
  v69 = 0x4059400000000000;
  v62[0] = v38;
  v62[1] = 3221225472;
  v62[2] = __93__PXSystemMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke_2;
  v62[3] = &unk_1E513AC78;
  v39 = v13;
  v63 = v39;
  v40 = v68;
  v64 = v40;
  v66 = 0x4059400000000000;
  v65 = v11;
  v41 = objc_msgSend(v57, "findTimeRangesWithContext:inAsset:withOptions:andProgressHandler:andCompletionHandler:", v55, v39, 0, v67, v62);
  v58[0] = v38;
  v58[1] = 3221225472;
  v58[2] = __93__PXSystemMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke_174;
  v58[3] = &unk_1E513A5E0;
  v13 = v39;
  v61 = v41;
  v59 = v13;
  v60 = v57;
  v42 = v57;
  objc_msgSend(v40, "setCancellationHandler:", v58);
  v43 = v60;
  v35 = v40;

LABEL_35:
  return v35;
}

uint64_t __93__PXSystemMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke(uint64_t a1, double a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", vcvtad_u64_f64(*(double *)(a1 + 40) * a2));
}

void __93__PXSystemMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  const char *v10;
  NSObject *v11;
  os_log_type_t v12;
  uint64_t v13;
  uint64_t v14;
  int v15;
  void *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  PLUIGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = 138412546;
      v16 = v9;
      v17 = 2112;
      v18 = v5;
      v10 = "PXSystemMediaAnalyzer: Returning time ranges for asset: %@. TimeRanges: %@";
      v11 = v8;
      v12 = OS_LOG_TYPE_INFO;
LABEL_6:
      _os_log_impl(&dword_1A6789000, v11, v12, v10, (uint8_t *)&v15, 0x16u);

    }
  }
  else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 138412546;
    v16 = v9;
    v17 = 2112;
    v18 = v6;
    v10 = "PXSystemMediaAnalyzer: Failed to get timeRanges for asset: %@, error: %@";
    v11 = v8;
    v12 = OS_LOG_TYPE_ERROR;
    goto LABEL_6;
  }

  objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", (uint64_t)*(double *)(a1 + 56));
  (*(void (**)(_QWORD, id, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v5, v13, v14);

}

uint64_t __93__PXSystemMediaAnalyzer_requestMatchedTimeRangesForAsset_searchQueryMatchInfo_resultHandler___block_invoke_174(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  int v4;
  int v6;
  void *v7;
  __int16 v8;
  int v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  PLUIGetLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    objc_msgSend(*(id *)(a1 + 32), "localIdentifier");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_DWORD *)(a1 + 48);
    v6 = 138412546;
    v7 = v3;
    v8 = 1024;
    v9 = v4;
    _os_log_impl(&dword_1A6789000, v2, OS_LOG_TYPE_INFO, "PXSystemMediaAnalyzer: Canceling time range request for asset: %@, requestID: %d", (uint8_t *)&v6, 0x12u);

  }
  return objc_msgSend(*(id *)(a1 + 40), "cancelAnalysisWithRequestID:", *(unsigned int *)(a1 + 48));
}

uint64_t __81__PXSystemMediaAnalyzer_requestAnalysisForAssets_options_contexts_resultHandler___block_invoke(uint64_t a1, double a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "setCompletedUnitCount:", vcvtad_u64_f64(*(double *)(a1 + 40) * a2));
}

void __81__PXSystemMediaAnalyzer_requestAnalysisForAssets_options_contexts_resultHandler___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = (uint64_t)*(double *)(a1 + 48);
  v4 = *(void **)(a1 + 32);
  v5 = a2;
  objc_msgSend(v4, "setCompletedUnitCount:", v3);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

uint64_t __81__PXSystemMediaAnalyzer_requestAnalysisForAssets_options_contexts_resultHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "cancelAnalysisWithRequestID:", *(unsigned int *)(a1 + 40));
}

@end
