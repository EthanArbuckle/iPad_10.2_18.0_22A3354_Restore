@implementation TRIDiffableAssetBuilder

+ (id)buildAndSaveDiffableAssetsWithAssetIds:(id)a3 metadataForAssetId:(id)a4 artifactProvider:(id)a5 options:(id)a6 paths:(id)a7 assetsDownloadSize:(unint64_t *)a8 perAssetIdCompletionBlockOnSuccess:(id)a9 perAssetIdCompletionBlockOnError:(id)a10 retryAfter:(id *)a11 error:(id *)a12
{
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  TRIAssetStore *v26;
  void *v27;
  void *v28;
  TRIAssetStore *v29;
  uint64_t v30;
  TRIAssetStore *v31;
  uint64_t v32;
  dispatch_semaphore_t v33;
  id v34;
  id v35;
  TRIAssetStore *v36;
  NSObject *v37;
  void *v38;
  void *v39;
  NSObject *v40;
  id v41;
  id v42;
  id v43;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  void *v52;
  id v53;
  id v54;
  id v55;
  id v56;
  void *v58;
  _QWORD v59[4];
  NSObject *v60;
  id v61;
  id *v62;
  id *v63;
  _QWORD v64[4];
  id v65;
  id v66;
  id v67;
  TRIAssetStore *v68;
  NSObject *v69;
  id v70;
  id v71;
  uint64_t *v72;
  id *v73;
  id *v74;
  SEL v75;
  id v76;
  unint64_t *v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  _QWORD v84[4];
  TRIAssetStore *v85;

  v18 = a3;
  v19 = a4;
  v20 = a5;
  v21 = a6;
  v22 = a7;
  v53 = a9;
  v55 = a10;
  v58 = v18;
  if (!v18)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIDiffableAssetBuilder.m"), 39, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetIds"));

  }
  v23 = v19;
  if (v19)
  {
    if (v20)
      goto LABEL_5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIDiffableAssetBuilder.m"), 40, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("metadataForAssetId"));

    if (v20)
    {
LABEL_5:
      if (a8)
        goto LABEL_6;
LABEL_12:
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v48, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIDiffableAssetBuilder.m"), 42, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("assetsDownloadSize"));

      if (v21)
        goto LABEL_7;
      goto LABEL_13;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIDiffableAssetBuilder.m"), 41, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("artifactProvider"));

  if (!a8)
    goto LABEL_12;
LABEL_6:
  if (v21)
    goto LABEL_7;
LABEL_13:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIDiffableAssetBuilder.m"), 43, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("options"));

LABEL_7:
  v24 = v20;
  v25 = v22;
  if (!v22)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIDiffableAssetBuilder.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("paths"));

  }
  *a8 = 0;
  v26 = [TRIAssetStore alloc];
  objc_msgSend(v21, "downloadOptions");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "activity");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v52 = v25;
  v29 = -[TRIAssetStore initWithPaths:monitoredActivity:](v26, "initWithPaths:monitoredActivity:", v25, v28);

  v84[0] = MEMORY[0x1E0C809B0];
  v30 = MEMORY[0x1E0C809B0];
  v84[1] = 3221225472;
  v84[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke;
  v84[3] = &unk_1E9330E78;
  v31 = v29;
  v85 = v31;
  v32 = MEMORY[0x1D8232C48](v84);
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__9;
  v82 = __Block_byref_object_dispose__9;
  v83 = 0;
  v33 = dispatch_semaphore_create(0);
  v64[0] = v30;
  v64[1] = 3221225472;
  v64[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_23;
  v64[3] = &unk_1E9330F90;
  v34 = v24;
  v65 = v34;
  v35 = v21;
  v66 = v35;
  v54 = v53;
  v70 = v54;
  v51 = v55;
  v71 = v51;
  v73 = a11;
  v74 = a12;
  v56 = v23;
  v67 = v56;
  v75 = a2;
  v76 = a1;
  v36 = v31;
  v77 = a8;
  v68 = v36;
  v72 = &v78;
  v37 = v33;
  v69 = v37;
  v38 = (void *)MEMORY[0x1D8232C48](v64);
  v59[0] = MEMORY[0x1E0C809B0];
  v59[1] = 3221225472;
  v59[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_39;
  v59[3] = &unk_1E9330FB8;
  v62 = a11;
  v63 = a12;
  v39 = (void *)v32;
  v40 = v37;
  v60 = v40;
  v41 = v38;
  v61 = v41;
  v42 = (id)objc_msgSend(v34, "fetchDiffSourceRecordIdsWithTargetAssetIds:isAcceptableSourceAssetId:options:completion:", v58, v32, v35, v59);
  objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:", v40);
  v43 = (id)v79[5];

  _Block_object_dispose(&v78, 8);
  return v43;
}

uint64_t __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "hasAssetWithIdentifier:type:", a2, 0);
}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_23(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;
  id v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  uint64_t v18;
  _QWORD v19[4];
  id v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  v5 = *(_QWORD *)(a1 + 40);
  v6 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_2;
  v22[3] = &unk_1E9330EC8;
  v23 = v3;
  v24 = *(id *)(a1 + 72);
  v19[0] = v6;
  v19[1] = 3221225472;
  v19[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_4;
  v19[3] = &unk_1E9330F18;
  v20 = v23;
  v21 = *(id *)(a1 + 80);
  v11[0] = v6;
  v11[1] = 3221225472;
  v11[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_6;
  v11[3] = &unk_1E9330F68;
  v16 = *(_OWORD *)(a1 + 96);
  v12 = *(id *)(a1 + 48);
  v17 = *(_OWORD *)(a1 + 112);
  v7 = *(id *)(a1 + 56);
  v18 = *(_QWORD *)(a1 + 128);
  v8 = *(_QWORD *)(a1 + 88);
  v13 = v7;
  v15 = v8;
  v14 = *(id *)(a1 + 64);
  v9 = v23;
  v10 = (id)objc_msgSend(v4, "fetchDiffsWithRecordIds:options:perRecordProgress:perRecordCompletionBlockOnSuccess:perRecordCompletionBlockOnError:completion:", v9, v5, 0, v22, v19, v11);

}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  id v9;

  v4 = a3;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_3;
  v7[3] = &unk_1E9330EA0;
  v8 = v4;
  v5 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v6 = v4;
  objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v7);

}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_3(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = *(void **)(a1 + 32);
  objc_msgSend(a3, "recordId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8);

  v9 = v11;
  if ((_DWORD)v7)
  {
    v10 = *(_QWORD *)(a1 + 40);
    if (v10)
      (*(void (**)(uint64_t, id))(v10 + 16))(v10, v11);
    *a4 = 1;
    v9 = v11;
  }

}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_4(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  _QWORD v12[4];
  id v13;
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_5;
  v12[3] = &unk_1E9330EF0;
  v13 = v6;
  v8 = *(void **)(a1 + 32);
  v9 = *(id *)(a1 + 40);
  v14 = v7;
  v15 = v9;
  v10 = v7;
  v11 = v6;
  objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);

}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_5(_QWORD *a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = (void *)a1[4];
  objc_msgSend(a3, "recordId");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v7) = objc_msgSend(v7, "isEqual:", v8);

  v9 = v11;
  if ((_DWORD)v7)
  {
    v10 = a1[6];
    if (v10)
      (*(void (**)(uint64_t, id, _QWORD))(v10 + 16))(v10, v11, a1[5]);
    *a4 = 1;
    v9 = v11;
  }

}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_6(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  NSObject *v12;
  id *v13;
  NSObject *v14;
  id *v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  id v21;
  _QWORD v22[4];
  id v23;
  id v24;
  id v25;
  __int128 *p_buf;
  __int128 v27;
  uint64_t v28;
  uint64_t v29;
  __int128 buf;
  uint64_t v31;
  char v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  switch(a2)
  {
    case 0:
    case 1:
    case 3:
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failing request for asset diff records without retry: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      v13 = *(id **)(a1 + 72);
      if (v13)
        goto LABEL_5;
      break;
    case 2:
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v11;
        _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failing request for asset diff records with retry: %{public}@", (uint8_t *)&buf, 0xCu);
      }

      v15 = *(id **)(a1 + 64);
      if (v15)
        objc_storeStrong(v15, a4);
      v13 = *(id **)(a1 + 72);
      if (v13)
LABEL_5:
        objc_storeStrong(v13, a5);
      break;
    case 4:
      if (v9)
      {
        v16 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v9, "count"));
        *(_QWORD *)&buf = 0;
        *((_QWORD *)&buf + 1) = &buf;
        v31 = 0x2020000000;
        v32 = 1;
        v22[0] = MEMORY[0x1E0C809B0];
        v22[1] = 3221225472;
        v22[2] = __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_28;
        v22[3] = &unk_1E9330F40;
        v23 = *(id *)(a1 + 32);
        v27 = *(_OWORD *)(a1 + 80);
        v24 = *(id *)(a1 + 40);
        v17 = v16;
        v18 = *(_QWORD *)(a1 + 72);
        v28 = *(_QWORD *)(a1 + 96);
        v29 = v18;
        v25 = v17;
        p_buf = &buf;
        objc_msgSend(v9, "enumerateKeysAndObjectsUsingBlock:", v22);
        v19 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
        v20 = *(void **)(v19 + 40);
        *(_QWORD *)(v19 + 40) = v17;
        v21 = v17;

        _Block_object_dispose(&buf, 8);
      }
      break;
    default:
      break;
  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));

}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_28(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  id *v16;
  void *v17;
  void *v18;
  char v19;
  id v20;
  void *v21;
  void *v22;
  uint64_t v23;
  int v24;
  NSObject *v25;
  _BOOL4 v26;
  void *v27;
  void *v28;
  void *v29;
  id v30;
  id obj;
  uint8_t buf[4];
  void *v33;
  __int16 v34;
  id v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = *(void **)(a1 + 32);
  objc_msgSend(v4, "destAssetId");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), CFSTR("TRIDiffableAssetBuilder.m"), 109, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("metadataForAssetId[artifact.destAssetId]"));

  }
  obj = 0;
  v8 = *(void **)(a1 + 40);
  objc_msgSend(v4, "destAssetId");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "sourceAssetId");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diff");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "path");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 72), CFSTR("TRIDiffableAssetBuilder.m"), 113, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("artifact.diff.path"));

  }
  v13 = objc_msgSend(v8, "saveAssetWithIdentifier:builtFromAssetWithIdentifier:patchFilename:metadata:error:", v9, v10, v12, v7, &obj);

  if (v13)
  {
    v14 = *(void **)(a1 + 48);
    objc_msgSend(v4, "destAssetId");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObject:", v15);

    **(_QWORD **)(a1 + 80) += objc_msgSend(v4, "diffSize");
  }
  else
  {
    v16 = *(id **)(a1 + 88);
    if (v16)
      objc_storeStrong(v16, obj);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "diff");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0;
  v19 = objc_msgSend(v17, "removeItemAtURL:error:", v18, &v30);
  v20 = v30;

  if ((v19 & 1) == 0)
  {
    objc_msgSend(v20, "domain");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v21;
    if (v21 != (void *)*MEMORY[0x1E0CB28A8])
    {

      goto LABEL_13;
    }
    v23 = objc_msgSend(v20, "code");

    if (v23 != 4)
    {
LABEL_13:
      v24 = *(unsigned __int8 *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      TRILogCategory_Server();
      v25 = objc_claimAutoreleasedReturnValue();
      v26 = os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      if (v24)
      {
        if (v26)
          goto LABEL_19;
      }
      else if (v26)
      {
LABEL_19:
        objc_msgSend(v4, "diff");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v33 = v27;
        v34 = 2114;
        v35 = v20;
        _os_log_error_impl(&dword_1D207F000, v25, OS_LOG_TYPE_ERROR, "Failed to clean up CK cached asset %@: %{public}@", buf, 0x16u);

      }
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
    }
  }

}

void __220__TRIDiffableAssetBuilder_buildAndSaveDiffableAssetsWithAssetIds_metadataForAssetId_artifactProvider_options_paths_assetsDownloadSize_perAssetIdCompletionBlockOnSuccess_perAssetIdCompletionBlockOnError_retryAfter_error___block_invoke_39(uint64_t a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id *v11;
  id *v12;
  id v13;

  v13 = a3;
  v9 = a4;
  v10 = a5;
  switch(a2)
  {
    case 0:
    case 1:
    case 3:
      goto LABEL_2;
    case 2:
      v12 = *(id **)(a1 + 48);
      if (v12)
        objc_storeStrong(v12, a4);
LABEL_2:
      v11 = *(id **)(a1 + 56);
      if (v11)
        objc_storeStrong(v11, a5);
      goto LABEL_4;
    case 4:
      if (v13)
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      else
LABEL_4:
        dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
      break;
    default:
      break;
  }

}

@end
