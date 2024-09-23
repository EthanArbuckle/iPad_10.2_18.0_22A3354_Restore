@implementation PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  PLEnumerateAndSaveController *v12;
  objc_class *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  id v17;
  PLEnumerateAndSaveController *v18;
  id *v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  void *v24;
  __int128 *v25;
  void *v26;
  __int128 *v27;
  void *v28;
  NSObject *v29;
  _BOOL4 v30;
  NSObject *v31;
  objc_class *v32;
  void *v33;
  uint64_t v34;
  __int128 *v35;
  void *v36;
  int64_t v37;
  uint64_t v39;
  id obj;
  _QWORD v41[9];
  _QWORD v42[6];
  _QWORD v43[4];
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  _QWORD v49[5];
  id v50;
  uint64_t v51;
  uint64_t *v52;
  uint64_t v53;
  uint64_t (*v54)(uint64_t, uint64_t);
  void (*v55)(uint64_t);
  id v56;
  uint64_t v57;
  uint64_t *v58;
  uint64_t v59;
  uint64_t v60;
  int v61;
  void *v62;
  __int16 v63;
  uint64_t v64;
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
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  _QWORD v97[2];

  v97[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v57 = 0;
  v58 = &v57;
  v59 = 0x2020000000;
  v60 = 1;
  v51 = 0;
  v52 = &v51;
  v53 = 0x3032000000;
  v54 = __Block_byref_object_copy__46832;
  v55 = __Block_byref_object_dispose__46833;
  v56 = 0;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("(%K < 0) AND (%K > 0) AND (%K >= 0)"), CFSTR("stickerConfidenceScore"), CFSTR("mediaAnalysisAttributes.visualSearchAttributes.algorithmVersion"), CFSTR("mediaAnalysisAttributes.visualSearchAttributes.stickerConfidenceScore"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v97[0] = CFSTR("mediaAnalysisAttributes.visualSearchAttributes.stickerConfidenceScore");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v97, 1);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v11);

  v49[0] = 0;
  v49[1] = v49;
  v49[2] = 0x3032000000;
  v49[3] = __Block_byref_object_copy__46832;
  v49[4] = __Block_byref_object_dispose__46833;
  v50 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 0;
  v12 = [PLEnumerateAndSaveController alloc];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v43[0] = MEMORY[0x1E0C809B0];
  v43[1] = 3221225472;
  v43[2] = __109__PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable_performActionWithManagedObjectContext_error___block_invoke;
  v43[3] = &unk_1E36700D0;
  v17 = v6;
  v44 = v17;
  v42[0] = v16;
  v42[1] = 3221225472;
  v42[2] = __109__PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable_performActionWithManagedObjectContext_error___block_invoke_2;
  v42[3] = &unk_1E3670818;
  v42[4] = self;
  v42[5] = v49;
  v41[0] = v16;
  v41[1] = 3221225472;
  v41[2] = __109__PLModelMigrationAction_CopyStickerConfidenceScoreToAssetTable_performActionWithManagedObjectContext_error___block_invoke_3;
  v41[3] = &unk_1E366ADB8;
  v41[4] = self;
  v41[5] = &v45;
  v41[6] = &v51;
  v41[7] = &v57;
  v41[8] = v49;
  v18 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v12, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v14, v9, v17, v15, 0, 1, v43, v42, v41);

  v19 = (id *)(v52 + 5);
  obj = (id)v52[5];
  LOBYTE(v15) = -[PLEnumerateAndSaveController processObjectsWithError:](v18, "processObjectsWithError:", &obj);
  objc_storeStrong(v19, obj);
  if ((v15 & 1) != 0)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      PLMigrationGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT);

      if (v22)
      {
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        PLMigrationGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT);
        v24 = (void *)v46[3];
        v61 = 134217984;
        v62 = v24;
        LODWORD(v39) = 12;
        v25 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v61, v39);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v26, "logWithMessage:fromCodeLocation:type:", v25, "PLModelMigrationActions_17000.m", 442, 0);

        if (v25 != &v65)
        {
          v27 = v25;
LABEL_10:
          free(v27);
        }
      }
    }
  }
  else
  {
    v58[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      PLMigrationGetLog();
      v29 = objc_claimAutoreleasedReturnValue();
      v30 = os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);

      if (v30)
      {
        v95 = 0u;
        v96 = 0u;
        v93 = 0u;
        v94 = 0u;
        v91 = 0u;
        v92 = 0u;
        v89 = 0u;
        v90 = 0u;
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v79 = 0u;
        v80 = 0u;
        v77 = 0u;
        v78 = 0u;
        v75 = 0u;
        v76 = 0u;
        v73 = 0u;
        v74 = 0u;
        v71 = 0u;
        v72 = 0u;
        v69 = 0u;
        v70 = 0u;
        v67 = 0u;
        v68 = 0u;
        v65 = 0u;
        v66 = 0u;
        PLMigrationGetLog();
        v31 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);
        v32 = (objc_class *)objc_opt_class();
        NSStringFromClass(v32);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = v52[5];
        v61 = 138543618;
        v62 = v33;
        v63 = 2114;
        v64 = v34;
        LODWORD(v39) = 22;
        v35 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v61, v39);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logWithMessage:fromCodeLocation:type:", v35, "PLModelMigrationActions_17000.m", 440, 16);

        if (v35 != &v65)
        {
          v27 = v35;
          goto LABEL_10;
        }
      }
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease((id)v52[5]);
  v37 = v58[3];

  _Block_object_dispose(&v45, 8);
  _Block_object_dispose(v49, 8);

  _Block_object_dispose(&v51, 8);
  _Block_object_dispose(&v57, 8);

  return v37;
}

@end
