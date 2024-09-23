@implementation PLModelMigrationActionUtility

+ (int64_t)removeOrphanedObjectsWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  objc_class *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  uint64_t v16;
  void *v17;
  NSObject *v18;
  int64_t v19;
  _BOOL4 v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 *v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  void *v29;
  __int128 *v30;
  void *v31;
  uint64_t v33;
  id *v34;
  id v35;
  int v36;
  void *v37;
  __int16 v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  uint64_t v72;

  v72 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a5;
  v11 = (objc_class *)MEMORY[0x1E0C97A90];
  v12 = a4;
  v13 = (void *)objc_msgSend([v11 alloc], "initWithFetchRequest:", v10);
  objc_msgSend(v13, "setResultType:", 2);
  v35 = 0;
  objc_msgSend(v12, "executeRequest:error:", v13, &v35);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = v35;
  objc_msgSend(v9, "logger");
  v16 = objc_claimAutoreleasedReturnValue();
  v17 = (void *)v16;
  if (v14)
  {
    if (v16)
    {
      v34 = a6;
      PLMigrationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      v19 = 1;
      v20 = os_log_type_enabled(v18, OS_LOG_TYPE_INFO);

      if (v20)
      {
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        v54 = 0u;
        v55 = 0u;
        v52 = 0u;
        v53 = 0u;
        v50 = 0u;
        v51 = 0u;
        v48 = 0u;
        v49 = 0u;
        v46 = 0u;
        v47 = 0u;
        v44 = 0u;
        v45 = 0u;
        v42 = 0u;
        v43 = 0u;
        v40 = 0u;
        v41 = 0u;
        PLMigrationGetLog();
        v21 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
        objc_msgSend(v14, "result");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "entityName");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = 138543618;
        v37 = v22;
        v38 = 2114;
        v39 = v23;
        LODWORD(v33) = 22;
        v24 = (__int128 *)_os_log_send_and_compose_impl();

        objc_msgSend(v9, "logger", &v36, v33);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActionUtility.m", 52, 1);

        if (v24 != &v40)
          free(v24);
        v19 = 1;
      }
      a6 = v34;
      if (!v34)
        goto LABEL_15;
    }
    else
    {
      v19 = 1;
      if (!a6)
        goto LABEL_15;
    }
LABEL_14:
    *a6 = objc_retainAutorelease(v15);
    goto LABEL_15;
  }
  if (v16)
  {
    PLMigrationGetLog();
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);

    if (v27)
    {
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      v54 = 0u;
      v55 = 0u;
      v52 = 0u;
      v53 = 0u;
      v50 = 0u;
      v51 = 0u;
      v48 = 0u;
      v49 = 0u;
      v46 = 0u;
      v47 = 0u;
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      v40 = 0u;
      v41 = 0u;
      PLMigrationGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v28, OS_LOG_TYPE_ERROR);
      objc_msgSend(v10, "entityName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = 138543618;
      v37 = v29;
      v38 = 2112;
      v39 = v15;
      LODWORD(v33) = 22;
      v30 = (__int128 *)_os_log_send_and_compose_impl();

      objc_msgSend(v9, "logger", &v36, v33);
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActionUtility.m", 55, 16);

      if (v30 != &v40)
        free(v30);
    }
  }
  v19 = 3;
  if (a6)
    goto LABEL_14;
LABEL_15:

  return v19;
}

+ (int64_t)updateExtendedAttributesWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 useObjectIDResumeMarker:(BOOL)a6 error:(id *)a7
{
  _BOOL8 v8;
  id v12;
  id v13;
  id v14;
  void *v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  _QWORD v21[4];
  id v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _QWORD v31[5];

  v8 = a6;
  v31[4] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  objc_msgSend(v14, "setFetchBatchSize:", 100);
  v31[0] = CFSTR("extendedAttributes");
  v31[1] = CFSTR("master");
  v31[2] = CFSTR("master.mediaMetadata");
  v31[3] = CFSTR("modernResources");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setRelationshipKeyPathsForPrefetching:", v15);

  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy__15048;
  v29 = __Block_byref_object_dispose__15049;
  v30 = 0;
  v21[0] = MEMORY[0x1E0C809B0];
  v21[1] = 3221225472;
  v21[2] = __132__PLModelMigrationActionUtility_updateExtendedAttributesWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error___block_invoke;
  v21[3] = &unk_1E3663F78;
  v24 = a1;
  v16 = v12;
  v22 = v16;
  v23 = &v25;
  v17 = objc_msgSend(a1, "processAssetWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:processingBlock:", v16, v13, v14, v8, a7, v21);
  v18 = (id)v26[5];
  v19 = v18;
  if (!v17 && a7)
    *a7 = objc_retainAutorelease(v18);

  _Block_object_dispose(&v25, 8);
  return v17 != 0;
}

+ (BOOL)processExtendedAttributesWithAction:(id)a3 asset:(id)a4 metadata:(id)a5 error:(id *)a6
{
  id v9;
  id v10;
  int v11;
  id v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  NSObject *v19;
  _BOOL4 v20;
  NSObject *v21;
  _OWORD *v22;
  void *v23;
  void *v24;
  uint64_t v26;
  id v27;
  int v28;
  id v29;
  _OWORD v30[32];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v27 = 0;
  v11 = objc_msgSend(v10, "updateExtendedAttributesWithMetadata:error:", a5, &v27);
  v12 = v27;
  if (v11)
  {
    objc_msgSend(v10, "extendedAttributes");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "dateCreated");
    v14 = objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      v15 = (void *)v14;
      objc_msgSend(v13, "timezoneName");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {

LABEL_14:
        goto LABEL_15;
      }
      objc_msgSend(v13, "timezoneOffset");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v24)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    objc_msgSend(v10, "master");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      +[PLManagedAsset fixMissingOriginalDateCreatedIfNeededForAsset:withCloudMaster:](PLManagedAsset, "fixMissingOriginalDateCreatedIfNeededForAsset:withCloudMaster:", v10, v15);
      +[PLManagedAsset fixMissingOriginalTimezoneIfNeededForAsset:](PLManagedAsset, "fixMissingOriginalTimezoneIfNeededForAsset:", v10);
    }
    goto LABEL_14;
  }
  objc_msgSend(v9, "logger");
  v17 = objc_claimAutoreleasedReturnValue();
  if (v17)
  {
    v18 = (void *)v17;
    PLMigrationGetLog();
    v19 = objc_claimAutoreleasedReturnValue();
    v20 = os_log_type_enabled(v19, OS_LOG_TYPE_INFO);

    if (v20)
    {
      memset(v30, 0, sizeof(v30));
      PLMigrationGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v21, OS_LOG_TYPE_INFO);
      v28 = 138412290;
      v29 = v12;
      LODWORD(v26) = 12;
      v22 = (_OWORD *)_os_log_send_and_compose_impl();

      objc_msgSend(v9, "logger", &v28, v26);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActionUtility.m", 102, 1);

      if (v22 != v30)
        free(v22);
    }
  }
  if (a6)
    *a6 = objc_retainAutorelease(v12);
LABEL_16:

  return v11;
}

+ (int64_t)removeFromDuplicatesWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 requiresTokenReset:(BOOL)a6 error:(id *)a7
{
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  int v20;
  __int128 *v21;
  void *v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  id v29;
  void *v30;
  int64_t v31;
  id v32;
  uint64_t v33;
  id v34;
  void *v35;
  int64_t v36;
  uint64_t v38;
  id v39;
  _BOOL4 v40;
  id v42;
  _QWORD v43[4];
  id v44;
  id v45;
  uint64_t *v46;
  uint64_t *v47;
  id obj;
  uint64_t v49;
  id *v50;
  uint64_t v51;
  uint64_t (*v52)(uint64_t, uint64_t);
  void (*v53)(uint64_t);
  id v54;
  uint64_t v55;
  uint64_t *v56;
  uint64_t v57;
  uint64_t v58;
  int v59;
  void *v60;
  __int16 v61;
  id v62;
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
  uint64_t v95;

  v40 = a6;
  v95 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  v55 = 0;
  v56 = &v55;
  v57 = 0x2020000000;
  v58 = 1;
  v49 = 0;
  v50 = (id *)&v49;
  v51 = 0x3032000000;
  v52 = __Block_byref_object_copy__15048;
  v53 = __Block_byref_object_dispose__15049;
  v54 = 0;
  obj = 0;
  objc_msgSend(v10, "executeFetchRequest:error:", v11, &obj);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(&v54, obj);
  if (objc_msgSend(v12, "count"))
  {
    objc_msgSend(v9, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v12, "count"), 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x1E0C809B0];
    v43[1] = 3221225472;
    v43[2] = __123__PLModelMigrationActionUtility_removeFromDuplicatesWithAction_managedObjectContext_fetchRequest_requiresTokenReset_error___block_invoke;
    v43[3] = &unk_1E366AC60;
    v14 = v9;
    v44 = v14;
    v46 = &v49;
    v47 = &v55;
    v39 = v13;
    v45 = v39;
    objc_msgSend(v10, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v12, v43);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15 && !v50[5])
    {
      objc_storeStrong(v50 + 5, v15);
      v56[3] = 3;
    }
    if (v56[3] == 1)
    {
      objc_msgSend(v14, "logger");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if (v16)
      {
        PLMigrationGetLog();
        v17 = objc_claimAutoreleasedReturnValue();
        v18 = os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT);

        if (v18)
        {
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
          v63 = 0u;
          v64 = 0u;
          PLMigrationGetLog();
          v19 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
          v20 = objc_msgSend(v12, "count");
          v59 = 67109120;
          LODWORD(v60) = v20;
          LODWORD(v38) = 8;
          v21 = (__int128 *)_os_log_send_and_compose_impl();

          objc_msgSend(v14, "logger", &v59, v38);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActionUtility.m", 130, 0);

          goto LABEL_14;
        }
      }
    }
    else
    {
      objc_msgSend(v14, "logger");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      if (v23)
      {
        PLMigrationGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

        if (v25)
        {
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
          v63 = 0u;
          v64 = 0u;
          PLMigrationGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
          v27 = (objc_class *)objc_opt_class();
          NSStringFromClass(v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v29 = v50[5];
          v59 = 138543618;
          v60 = v28;
          v61 = 2114;
          v62 = v29;
          LODWORD(v38) = 22;
          v21 = (__int128 *)_os_log_send_and_compose_impl();

          objc_msgSend(v14, "logger", &v59, v38);
          v30 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActionUtility.m", 132, 16);

LABEL_14:
          if (v21 != &v63)
            free(v21);
        }
      }
    }

    if (v40 && v56[3] == 1 && (MEMORY[0x19AEC0720]() & 1) == 0)
    {
      v42 = 0;
      v31 = +[PLModelMigrationActionUtility resetDuplicateProcessingWithAction:managedObjectContext:error:](PLModelMigrationActionUtility, "resetDuplicateProcessingWithAction:managedObjectContext:error:", v14, v10, &v42);
      v32 = v42;
      v56[3] = v31;

    }
    goto LABEL_20;
  }
  if (!v12)
    v56[3] = 3;
LABEL_20:
  v33 = v56[3];
  v34 = v50[5];
  v35 = v34;
  if (v33 != 1 && a7)
    *a7 = objc_retainAutorelease(v34);

  v36 = v56[3];
  _Block_object_dispose(&v49, 8);

  _Block_object_dispose(&v55, 8);
  return v36;
}

+ (int64_t)resetDuplicateProcessingWithAction:(id)a3 managedObjectContext:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  PLGlobalValues *v10;
  char v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  int64_t v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  _BOOL4 v24;
  NSObject *v25;
  objc_class *v26;
  void *v27;
  __int128 *v28;
  void *v29;
  id v30;
  uint64_t v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  objc_class *v36;
  void *v37;
  __int128 *v38;
  void *v39;
  uint64_t v40;
  void *v41;
  NSObject *v42;
  _BOOL4 v43;
  NSObject *v44;
  __int128 *v45;
  void *v46;
  uint64_t v48;
  id *v49;
  id v50;
  id v51;
  int v52;
  void *v53;
  __int16 v54;
  id v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
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
  uint64_t v88;

  v88 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  objc_msgSend(v7, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[PLGlobalValues initWithManagedObjectContext:]([PLGlobalValues alloc], "initWithManagedObjectContext:", v8);
  -[PLGlobalValues setLastDuplicateDetectorProcessingToken:](v10, "setLastDuplicateDetectorProcessingToken:", 0);
  -[PLGlobalValues setLastInitialDuplicateDetectorProcessingCompletedToken:](v10, "setLastInitialDuplicateDetectorProcessingCompletedToken:", 0);
  v51 = 0;
  v11 = objc_msgSend(v8, "save:", &v51);

  v12 = v51;
  if ((v11 & 1) != 0)
  {
    v13 = (void *)MEMORY[0x1E0D73158];
    objc_msgSend(v7, "pathManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "libraryURL");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "appPrivateDataForLibraryURL:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v50 = v12;
    v17 = objc_msgSend(v16, "setValue:forKey:error:", 0, CFSTR("DuplicateProcessingLibraryInterruptMarker"), &v50);
    v18 = v50;

    v49 = a5;
    if ((v17 & 1) != 0)
    {
      v19 = v18;
      v20 = 1;
    }
    else
    {
      objc_msgSend(v7, "logger");
      v31 = objc_claimAutoreleasedReturnValue();
      if (v31
        && (v32 = (void *)v31,
            PLMigrationGetLog(),
            v33 = objc_claimAutoreleasedReturnValue(),
            v34 = os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT),
            v33,
            v32,
            v34))
      {
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        PLMigrationGetLog();
        v35 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT);
        v36 = (objc_class *)objc_opt_class();
        NSStringFromClass(v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        v52 = 138543618;
        v53 = v37;
        v54 = 2112;
        v19 = v18;
        v55 = v18;
        LODWORD(v48) = 22;
        v38 = (__int128 *)_os_log_send_and_compose_impl();

        objc_msgSend(v7, "logger", &v52, v48);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "logWithMessage:fromCodeLocation:type:", v38, "PLModelMigrationActionUtility.m", 165, 0);

        if (v38 != &v56)
          free(v38);
      }
      else
      {
        v19 = v18;
      }
      v20 = 3;
    }
    objc_msgSend(v9, "setCompletedUnitCount:", 1);
    objc_msgSend(v7, "logger");
    v40 = objc_claimAutoreleasedReturnValue();
    if (v40)
    {
      v41 = (void *)v40;
      PLMigrationGetLog();
      v42 = objc_claimAutoreleasedReturnValue();
      v43 = os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT);

      if (v43)
      {
        v86 = 0u;
        v87 = 0u;
        v84 = 0u;
        v85 = 0u;
        v82 = 0u;
        v83 = 0u;
        v80 = 0u;
        v81 = 0u;
        v78 = 0u;
        v79 = 0u;
        v76 = 0u;
        v77 = 0u;
        v74 = 0u;
        v75 = 0u;
        v72 = 0u;
        v73 = 0u;
        v70 = 0u;
        v71 = 0u;
        v68 = 0u;
        v69 = 0u;
        v66 = 0u;
        v67 = 0u;
        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        v60 = 0u;
        v61 = 0u;
        v58 = 0u;
        v59 = 0u;
        v56 = 0u;
        v57 = 0u;
        PLMigrationGetLog();
        v44 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT);
        LOWORD(v52) = 0;
        LODWORD(v48) = 2;
        v45 = (__int128 *)_os_log_send_and_compose_impl();

        objc_msgSend(v7, "logger", &v52, v48);
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v46, "logWithMessage:fromCodeLocation:type:", v45, "PLModelMigrationActionUtility.m", 168, 0);

        if (v45 != &v56)
          free(v45);
      }
    }

    v30 = v19;
    if ((v17 & 1) != 0)
    {
      v20 = 1;
      goto LABEL_24;
    }
    a5 = v49;
    if (!v49)
      goto LABEL_24;
LABEL_23:
    v30 = objc_retainAutorelease(v30);
    *a5 = v30;
    goto LABEL_24;
  }
  objc_msgSend(v7, "logger");
  v21 = objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    v22 = (void *)v21;
    PLMigrationGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    v24 = os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);

    if (v24)
    {
      v86 = 0u;
      v87 = 0u;
      v84 = 0u;
      v85 = 0u;
      v82 = 0u;
      v83 = 0u;
      v80 = 0u;
      v81 = 0u;
      v78 = 0u;
      v79 = 0u;
      v76 = 0u;
      v77 = 0u;
      v74 = 0u;
      v75 = 0u;
      v72 = 0u;
      v73 = 0u;
      v70 = 0u;
      v71 = 0u;
      v68 = 0u;
      v69 = 0u;
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v62 = 0u;
      v63 = 0u;
      v60 = 0u;
      v61 = 0u;
      v58 = 0u;
      v59 = 0u;
      v56 = 0u;
      v57 = 0u;
      PLMigrationGetLog();
      v25 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v25, OS_LOG_TYPE_ERROR);
      v26 = (objc_class *)objc_opt_class();
      NSStringFromClass(v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v52 = 138543618;
      v53 = v27;
      v54 = 2112;
      v55 = v12;
      LODWORD(v48) = 22;
      v28 = (__int128 *)_os_log_send_and_compose_impl();

      objc_msgSend(v7, "logger", &v52, v48);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActionUtility.m", 159, 16);

      if (v28 != &v56)
        free(v28);
    }
  }
  v30 = v12;
  v20 = 3;
  if (a5)
    goto LABEL_23;
LABEL_24:

  return v20;
}

+ (int64_t)processAssetWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 useObjectIDResumeMarker:(BOOL)a6 error:(id *)a7 processingBlock:(id)a8
{
  id v11;
  id v12;
  id v13;
  PLEnumerateAndSaveController *v14;
  objc_class *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  id v19;
  PLEnumerateAndSaveController *v20;
  _BOOL4 v21;
  id v22;
  id v23;
  void *v24;
  NSObject *v25;
  _BOOL4 v26;
  NSObject *v27;
  uint64_t v28;
  __int128 *v29;
  void *v30;
  void *v31;
  NSObject *v32;
  _BOOL4 v33;
  NSObject *v34;
  objc_class *v35;
  void *v36;
  __int128 *v37;
  void *v38;
  int64_t v39;
  void *v40;
  NSObject *v41;
  _BOOL4 v42;
  NSObject *v43;
  objc_class *v44;
  void *v45;
  __int128 *v46;
  void *v47;
  void *v48;
  NSObject *v49;
  _BOOL4 v50;
  NSObject *v51;
  uint64_t v52;
  void *v53;
  uint64_t *v54;
  uint64_t v55;
  id v56;
  void *v57;
  uint64_t v59;
  uint64_t v60;
  _BOOL4 v62;
  id v63;
  id v64;
  _QWORD v65[4];
  id v66;
  id v67;
  uint64_t *v68;
  uint64_t *v69;
  uint64_t *v70;
  BOOL v71;
  _QWORD v72[4];
  id v73;
  uint64_t *v74;
  _QWORD v75[4];
  id v76;
  uint64_t v77;
  uint64_t *v78;
  uint64_t v79;
  uint64_t v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  uint64_t (*v84)(uint64_t, uint64_t);
  void (*v85)(uint64_t);
  id v86;
  uint64_t v87;
  uint64_t *v88;
  uint64_t v89;
  uint64_t (*v90)(uint64_t, uint64_t);
  void (*v91)(uint64_t);
  id v92;
  int v93;
  uint64_t v94;
  __int16 v95;
  id v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  __int128 v126;
  __int128 v127;
  __int128 v128;
  uint64_t v129;

  v62 = a6;
  v129 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v63 = a4;
  v12 = a5;
  v13 = a8;
  v87 = 0;
  v88 = &v87;
  v89 = 0x3032000000;
  v90 = __Block_byref_object_copy__15048;
  v91 = __Block_byref_object_dispose__15049;
  v92 = 0;
  v81 = 0;
  v82 = &v81;
  v83 = 0x3032000000;
  v84 = __Block_byref_object_copy__15048;
  v85 = __Block_byref_object_dispose__15049;
  v86 = 0;
  v77 = 0;
  v78 = &v77;
  v79 = 0x2020000000;
  v80 = 1;
  if (v13)
  {
    objc_msgSend(v12, "setFetchBatchSize:", 100);
    v14 = [PLEnumerateAndSaveController alloc];
    v15 = (objc_class *)objc_opt_class();
    NSStringFromClass(v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "pathManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x1E0C809B0];
    v75[0] = MEMORY[0x1E0C809B0];
    v75[1] = 3221225472;
    v75[2] = __136__PLModelMigrationActionUtility_processAssetWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke;
    v75[3] = &unk_1E36700D0;
    v76 = v63;
    v72[0] = v18;
    v72[1] = 3221225472;
    v72[2] = __136__PLModelMigrationActionUtility_processAssetWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_2;
    v72[3] = &unk_1E3670818;
    v74 = &v81;
    v73 = v11;
    v65[0] = v18;
    v65[1] = 3221225472;
    v65[2] = __136__PLModelMigrationActionUtility_processAssetWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_3;
    v65[3] = &unk_1E3663FA8;
    v67 = v13;
    v68 = &v81;
    v19 = v73;
    v66 = v19;
    v69 = &v77;
    v71 = v62;
    v70 = &v87;
    v20 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v14, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v16, v12, v76, v17, 0, 1, v75, v72, v65);

    v64 = 0;
    v21 = -[PLEnumerateAndSaveController processObjectsWithError:](v20, "processObjectsWithError:", &v64);
    v22 = v64;
    if (v21)
    {
      if (-[PLEnumerateAndSaveController isCancelled](v20, "isCancelled"))
      {
        v23 = (id)v88[5];

        objc_msgSend(v19, "logger");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          PLMigrationGetLog();
          v25 = objc_claimAutoreleasedReturnValue();
          v26 = os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT);

          if (v26)
          {
            v127 = 0u;
            v128 = 0u;
            v125 = 0u;
            v126 = 0u;
            v123 = 0u;
            v124 = 0u;
            v121 = 0u;
            v122 = 0u;
            v119 = 0u;
            v120 = 0u;
            v117 = 0u;
            v118 = 0u;
            v115 = 0u;
            v116 = 0u;
            v113 = 0u;
            v114 = 0u;
            v111 = 0u;
            v112 = 0u;
            v109 = 0u;
            v110 = 0u;
            v107 = 0u;
            v108 = 0u;
            v105 = 0u;
            v106 = 0u;
            v103 = 0u;
            v104 = 0u;
            v101 = 0u;
            v102 = 0u;
            v99 = 0u;
            v100 = 0u;
            v97 = 0u;
            v98 = 0u;
            PLMigrationGetLog();
            v27 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT);
            v28 = objc_msgSend((id)v82[5], "completedUnitCount");
            v93 = 134218242;
            v94 = v28;
            v95 = 2112;
            v96 = v23;
            LODWORD(v60) = 22;
            v29 = (__int128 *)_os_log_send_and_compose_impl();

            objc_msgSend(v19, "logger", &v93, v60);
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActionUtility.m", 221, 0);

            if (v29 != &v97)
              free(v29);
          }
        }
        goto LABEL_23;
      }
      objc_msgSend(v19, "logger");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      if (v48)
      {
        PLMigrationGetLog();
        v49 = objc_claimAutoreleasedReturnValue();
        v50 = os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);

        if (v50)
        {
          v127 = 0u;
          v128 = 0u;
          v125 = 0u;
          v126 = 0u;
          v123 = 0u;
          v124 = 0u;
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          v117 = 0u;
          v118 = 0u;
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          v111 = 0u;
          v112 = 0u;
          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          PLMigrationGetLog();
          v51 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT);
          v52 = objc_msgSend((id)v82[5], "completedUnitCount");
          v93 = 134217984;
          v94 = v52;
          LODWORD(v60) = 12;
          v46 = (__int128 *)_os_log_send_and_compose_impl();

          objc_msgSend(v19, "logger", &v93, v60);
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "logWithMessage:fromCodeLocation:type:", v46, "PLModelMigrationActionUtility.m", 223, 0);

LABEL_20:
          if (v46 != &v97)
            free(v46);
        }
      }
    }
    else if (v78[3] != 2)
    {
      v78[3] = 3;
      objc_msgSend(v19, "logger");
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      if (v40)
      {
        PLMigrationGetLog();
        v41 = objc_claimAutoreleasedReturnValue();
        v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);

        if (v42)
        {
          v127 = 0u;
          v128 = 0u;
          v125 = 0u;
          v126 = 0u;
          v123 = 0u;
          v124 = 0u;
          v121 = 0u;
          v122 = 0u;
          v119 = 0u;
          v120 = 0u;
          v117 = 0u;
          v118 = 0u;
          v115 = 0u;
          v116 = 0u;
          v113 = 0u;
          v114 = 0u;
          v111 = 0u;
          v112 = 0u;
          v109 = 0u;
          v110 = 0u;
          v107 = 0u;
          v108 = 0u;
          v105 = 0u;
          v106 = 0u;
          v103 = 0u;
          v104 = 0u;
          v101 = 0u;
          v102 = 0u;
          v99 = 0u;
          v100 = 0u;
          v97 = 0u;
          v98 = 0u;
          PLMigrationGetLog();
          v43 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v43, OS_LOG_TYPE_ERROR);
          v44 = (objc_class *)objc_opt_class();
          NSStringFromClass(v44);
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v93 = 138543618;
          v94 = (uint64_t)v45;
          v95 = 2112;
          v96 = v22;
          LODWORD(v60) = 22;
          v46 = (__int128 *)_os_log_send_and_compose_impl();

          objc_msgSend(v19, "logger", &v93, v60);
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v47, "logWithMessage:fromCodeLocation:type:", v46, "PLModelMigrationActionUtility.m", 227, 16);

          goto LABEL_20;
        }
      }
    }
    v23 = v22;
LABEL_23:
    v54 = v78;
    if (v62 && v78[3] == 1)
    {
      objc_msgSend(v19, "setResumeMarkerValue:", 0);
      v54 = v78;
    }
    v55 = v54[3];
    v56 = v23;
    v57 = v56;
    if (v55 != 1 && a7)
      *a7 = objc_retainAutorelease(v56);

    v39 = v78[3];
    goto LABEL_30;
  }
  objc_msgSend(v11, "logger");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  if (v31)
  {
    PLMigrationGetLog();
    v32 = objc_claimAutoreleasedReturnValue();
    v33 = os_log_type_enabled(v32, OS_LOG_TYPE_INFO);

    if (v33)
    {
      v127 = 0u;
      v128 = 0u;
      v125 = 0u;
      v126 = 0u;
      v123 = 0u;
      v124 = 0u;
      v121 = 0u;
      v122 = 0u;
      v119 = 0u;
      v120 = 0u;
      v117 = 0u;
      v118 = 0u;
      v115 = 0u;
      v116 = 0u;
      v113 = 0u;
      v114 = 0u;
      v111 = 0u;
      v112 = 0u;
      v109 = 0u;
      v110 = 0u;
      v107 = 0u;
      v108 = 0u;
      v105 = 0u;
      v106 = 0u;
      v103 = 0u;
      v104 = 0u;
      v101 = 0u;
      v102 = 0u;
      v99 = 0u;
      v100 = 0u;
      v97 = 0u;
      v98 = 0u;
      PLMigrationGetLog();
      v34 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v34, OS_LOG_TYPE_INFO);
      v35 = (objc_class *)objc_opt_class();
      NSStringFromClass(v35);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v93 = 138543362;
      v94 = (uint64_t)v36;
      LODWORD(v59) = 12;
      v37 = (__int128 *)_os_log_send_and_compose_impl();

      objc_msgSend(v11, "logger", &v93, v59);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "logWithMessage:fromCodeLocation:type:", v37, "PLModelMigrationActionUtility.m", 183, 1);

      if (v37 != &v97)
        free(v37);
    }
  }
  v39 = v78[3];
LABEL_30:
  _Block_object_dispose(&v77, 8);
  _Block_object_dispose(&v81, 8);

  _Block_object_dispose(&v87, 8);
  return v39;
}

+ (int64_t)processManagedObjectsWithAction:(id)a3 managedObjectContext:(id)a4 fetchRequest:(id)a5 pendingParentUnitCount:(int64_t)a6 error:(id *)a7 processingBlock:(id)a8
{
  id v12;
  id v13;
  id v14;
  id v15;
  objc_class *v16;
  PLEnumerateAndSaveController *v17;
  void *v18;
  uint64_t v19;
  id v20;
  PLEnumerateAndSaveController *v21;
  _BOOL4 v22;
  id v23;
  id v24;
  void *v25;
  NSObject *v26;
  _BOOL4 v27;
  NSObject *v28;
  uint64_t v29;
  __int128 *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  _BOOL4 v34;
  NSObject *v35;
  __int128 *v36;
  void *v37;
  int64_t v38;
  void *v39;
  NSObject *v40;
  _BOOL4 v41;
  NSObject *v42;
  __int128 *v43;
  void *v44;
  __int128 *v45;
  void *v46;
  NSObject *v47;
  _BOOL4 v48;
  NSObject *v49;
  uint64_t v50;
  __int128 *v51;
  void *v52;
  uint64_t v53;
  id v54;
  void *v55;
  uint64_t v57;
  uint64_t v58;
  void *v60;
  id v61;
  _QWORD v62[4];
  id v63;
  id v64;
  uint64_t *v65;
  uint64_t *v66;
  uint64_t *v67;
  _QWORD v68[4];
  id v69;
  uint64_t *v70;
  int64_t v71;
  _QWORD v72[4];
  id v73;
  uint64_t v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t v77;
  uint64_t v78;
  uint64_t *v79;
  uint64_t v80;
  uint64_t (*v81)(uint64_t, uint64_t);
  void (*v82)(uint64_t);
  id v83;
  uint64_t v84;
  uint64_t *v85;
  uint64_t v86;
  uint64_t (*v87)(uint64_t, uint64_t);
  void (*v88)(uint64_t);
  id v89;
  int v90;
  uint64_t v91;
  __int16 v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  __int128 v102;
  __int128 v103;
  __int128 v104;
  __int128 v105;
  __int128 v106;
  __int128 v107;
  __int128 v108;
  __int128 v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  __int128 v121;
  __int128 v122;
  __int128 v123;
  __int128 v124;
  __int128 v125;
  uint64_t v126;

  v126 = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a8;
  v84 = 0;
  v85 = &v84;
  v86 = 0x3032000000;
  v87 = __Block_byref_object_copy__15048;
  v88 = __Block_byref_object_dispose__15049;
  v89 = 0;
  v78 = 0;
  v79 = &v78;
  v80 = 0x3032000000;
  v81 = __Block_byref_object_copy__15048;
  v82 = __Block_byref_object_dispose__15049;
  v83 = 0;
  v74 = 0;
  v75 = &v74;
  v76 = 0x2020000000;
  v77 = 1;
  v16 = (objc_class *)objc_opt_class();
  NSStringFromClass(v16);
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    objc_msgSend(v14, "setFetchBatchSize:", 100);
    v17 = [PLEnumerateAndSaveController alloc];
    objc_msgSend(v12, "pathManager");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = MEMORY[0x1E0C809B0];
    v72[0] = MEMORY[0x1E0C809B0];
    v72[1] = 3221225472;
    v72[2] = __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke;
    v72[3] = &unk_1E36700D0;
    v73 = v13;
    v68[0] = v19;
    v68[1] = 3221225472;
    v68[2] = __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_2;
    v68[3] = &unk_1E3663FD0;
    v70 = &v78;
    v69 = v12;
    v71 = a6;
    v62[0] = v19;
    v62[1] = 3221225472;
    v62[2] = __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_3;
    v62[3] = &unk_1E3663FF8;
    v64 = v15;
    v65 = &v78;
    v20 = v69;
    v63 = v20;
    v66 = &v74;
    v67 = &v84;
    v21 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v17, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v60, v14, v73, v18, 0, 1, v72, v68, v62);

    v61 = 0;
    v22 = -[PLEnumerateAndSaveController processObjectsWithError:](v21, "processObjectsWithError:", &v61);
    v23 = v61;
    if (v22)
    {
      if (-[PLEnumerateAndSaveController isCancelled](v21, "isCancelled"))
      {
        v24 = (id)v85[5];

        objc_msgSend(v20, "logger");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (v25)
        {
          PLMigrationGetLog();
          v26 = objc_claimAutoreleasedReturnValue();
          v27 = os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT);

          if (v27)
          {
            v124 = 0u;
            v125 = 0u;
            v122 = 0u;
            v123 = 0u;
            v120 = 0u;
            v121 = 0u;
            v118 = 0u;
            v119 = 0u;
            v116 = 0u;
            v117 = 0u;
            v114 = 0u;
            v115 = 0u;
            v112 = 0u;
            v113 = 0u;
            v110 = 0u;
            v111 = 0u;
            v108 = 0u;
            v109 = 0u;
            v106 = 0u;
            v107 = 0u;
            v104 = 0u;
            v105 = 0u;
            v102 = 0u;
            v103 = 0u;
            v100 = 0u;
            v101 = 0u;
            v98 = 0u;
            v99 = 0u;
            v96 = 0u;
            v97 = 0u;
            v94 = 0u;
            v95 = 0u;
            PLMigrationGetLog();
            v28 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT);
            v29 = objc_msgSend((id)v79[5], "completedUnitCount");
            v90 = 134218242;
            v91 = v29;
            v92 = 2112;
            v93 = v24;
            LODWORD(v58) = 22;
            v30 = (__int128 *)_os_log_send_and_compose_impl();

            objc_msgSend(v20, "logger", &v90, v58);
            v31 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v31, "logWithMessage:fromCodeLocation:type:", v30, "PLModelMigrationActionUtility.m", 280, 0);

            if (v30 != &v94)
              free(v30);
          }
        }
        goto LABEL_24;
      }
      objc_msgSend(v20, "logger");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v46)
        goto LABEL_23;
      PLMigrationGetLog();
      v47 = objc_claimAutoreleasedReturnValue();
      v48 = os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT);

      if (!v48)
        goto LABEL_23;
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      PLMigrationGetLog();
      v49 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT);
      v50 = objc_msgSend((id)v79[5], "completedUnitCount");
      v90 = 134217984;
      v91 = v50;
      LODWORD(v58) = 12;
      v51 = (__int128 *)_os_log_send_and_compose_impl();

      objc_msgSend(v20, "logger", &v90, v58);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "logWithMessage:fromCodeLocation:type:", v51, "PLModelMigrationActionUtility.m", 282, 0);

      if (v51 == &v94)
      {
LABEL_23:
        v24 = v23;
LABEL_24:
        v53 = v75[3];
        v54 = v24;
        v55 = v54;
        if (v53 != 1 && a7)
          *a7 = objc_retainAutorelease(v54);

        v38 = v75[3];
        goto LABEL_28;
      }
      v45 = v51;
    }
    else
    {
      if (v75[3] == 2)
        goto LABEL_23;
      v75[3] = 3;
      objc_msgSend(v20, "logger");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v39)
        goto LABEL_23;
      PLMigrationGetLog();
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = os_log_type_enabled(v40, OS_LOG_TYPE_ERROR);

      if (!v41)
        goto LABEL_23;
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      PLMigrationGetLog();
      v42 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v42, OS_LOG_TYPE_ERROR);
      v90 = 138543618;
      v91 = (uint64_t)v60;
      v92 = 2112;
      v93 = v23;
      LODWORD(v58) = 22;
      v43 = (__int128 *)_os_log_send_and_compose_impl();

      objc_msgSend(v20, "logger", &v90, v58);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "logWithMessage:fromCodeLocation:type:", v43, "PLModelMigrationActionUtility.m", 286, 16);

      if (v43 == &v94)
        goto LABEL_23;
      v45 = v43;
    }
    free(v45);
    goto LABEL_23;
  }
  objc_msgSend(v12, "logger");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  if (v32)
  {
    PLMigrationGetLog();
    v33 = objc_claimAutoreleasedReturnValue();
    v34 = os_log_type_enabled(v33, OS_LOG_TYPE_INFO);

    if (v34)
    {
      v124 = 0u;
      v125 = 0u;
      v122 = 0u;
      v123 = 0u;
      v120 = 0u;
      v121 = 0u;
      v118 = 0u;
      v119 = 0u;
      v116 = 0u;
      v117 = 0u;
      v114 = 0u;
      v115 = 0u;
      v112 = 0u;
      v113 = 0u;
      v110 = 0u;
      v111 = 0u;
      v108 = 0u;
      v109 = 0u;
      v106 = 0u;
      v107 = 0u;
      v104 = 0u;
      v105 = 0u;
      v102 = 0u;
      v103 = 0u;
      v100 = 0u;
      v101 = 0u;
      v98 = 0u;
      v99 = 0u;
      v96 = 0u;
      v97 = 0u;
      v94 = 0u;
      v95 = 0u;
      PLMigrationGetLog();
      v35 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v35, OS_LOG_TYPE_INFO);
      v90 = 138543362;
      v91 = (uint64_t)v60;
      LODWORD(v57) = 12;
      v36 = (__int128 *)_os_log_send_and_compose_impl();

      objc_msgSend(v12, "logger", &v90, v57);
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActionUtility.m", 247, 1);

      if (v36 != &v94)
        free(v36);
    }
  }
  v38 = v75[3];
LABEL_28:

  _Block_object_dispose(&v74, 8);
  _Block_object_dispose(&v78, 8);

  _Block_object_dispose(&v84, 8);
  return v38;
}

id __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), *(_QWORD *)(a1 + 48));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3, _BYTE *a4)
{
  unint64_t v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  int v11;
  void *v12;
  id obj;
  _QWORD v14[6];

  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v6 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "completedUnitCount");
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_4;
  v14[3] = &unk_1E3677C68;
  v7 = *(id *)(a1 + 32);
  v8 = *(_QWORD *)(a1 + 48);
  v14[4] = v7;
  v14[5] = v8;
  if (v6 && !(v6 % 0x3E8))
    __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_4((uint64_t)v14);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1)
  {
    v9 = *(void **)(a1 + 32);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v10 + 40);
    v11 = objc_msgSend(v9, "isCancelledWithError:", &obj);
    objc_storeStrong((id *)(v10 + 40), obj);
    if (v11)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
      *a4 = 1;
    }
  }
  v12 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v12, "setCompletedUnitCount:", objc_msgSend(v12, "completedUnitCount") + 1);

}

void __144__PLModelMigrationActionUtility_processManagedObjectsWithAction_managedObjectContext_fetchRequest_pendingParentUnitCount_error_processingBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  _OWORD *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _OWORD v13[32];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    PLMigrationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (v5)
    {
      memset(v13, 0, sizeof(v13));
      PLMigrationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "completedUnitCount");
      v11 = 134217984;
      v12 = v7;
      LODWORD(v10) = 12;
      v8 = (_OWORD *)_os_log_send_and_compose_impl();

      objc_msgSend(*(id *)(a1 + 32), "logger", &v11, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logWithMessage:fromCodeLocation:type:", v8, "PLModelMigrationActionUtility.m", 262, 1);

      if (v8 != v13)
        free(v8);
    }
  }
}

id __136__PLModelMigrationActionUtility_processAssetWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

void __136__PLModelMigrationActionUtility_processAssetWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(a2, "count"), 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __136__PLModelMigrationActionUtility_processAssetWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_3(uint64_t a1, uint64_t a2, void *a3, _BYTE *a4)
{
  id v6;
  unint64_t v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  id obj;
  _QWORD v16[6];

  v6 = a3;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "completedUnitCount");
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __136__PLModelMigrationActionUtility_processAssetWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_4;
  v16[3] = &unk_1E3677C68;
  v8 = *(id *)(a1 + 32);
  v9 = *(_QWORD *)(a1 + 48);
  v16[4] = v8;
  v16[5] = v9;
  if (v7 && !(v7 % 0x3E8))
    __136__PLModelMigrationActionUtility_processAssetWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_4((uint64_t)v16);
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) == 1)
  {
    if (*(_BYTE *)(a1 + 72))
    {
      objc_msgSend(v6, "objectID");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10 = 0;
    }
    v11 = *(void **)(a1 + 32);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    obj = *(id *)(v12 + 40);
    v13 = objc_msgSend(v11, "isCancelledWithResumeMarker:error:", v10, &obj);
    objc_storeStrong((id *)(v12 + 40), obj);
    if (v13)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
      *a4 = 1;
    }

  }
  v14 = *(void **)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  objc_msgSend(v14, "setCompletedUnitCount:", objc_msgSend(v14, "completedUnitCount") + 1);

}

void __136__PLModelMigrationActionUtility_processAssetWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error_processingBlock___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  NSObject *v4;
  _BOOL4 v5;
  NSObject *v6;
  uint64_t v7;
  _OWORD *v8;
  void *v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  _OWORD v13[32];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "logger");
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = (void *)v2;
    PLMigrationGetLog();
    v4 = objc_claimAutoreleasedReturnValue();
    v5 = os_log_type_enabled(v4, OS_LOG_TYPE_INFO);

    if (v5)
    {
      memset(v13, 0, sizeof(v13));
      PLMigrationGetLog();
      v6 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v6, OS_LOG_TYPE_INFO);
      v7 = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), "completedUnitCount");
      v11 = 134217984;
      v12 = v7;
      LODWORD(v10) = 12;
      v8 = (_OWORD *)_os_log_send_and_compose_impl();

      objc_msgSend(*(id *)(a1 + 32), "logger", &v11, v10);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "logWithMessage:fromCodeLocation:type:", v8, "PLModelMigrationActionUtility.m", 198, 1);

      if (v8 != v13)
        free(v8);
    }
  }
}

uint64_t __123__PLModelMigrationActionUtility_removeFromDuplicatesWithAction_managedObjectContext_fetchRequest_requiresTokenReset_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v6;
  uint64_t v7;
  int v8;
  id obj;

  objc_msgSend(a2, "removeFromDuplicateAlbum");
  v6 = *(void **)(a1 + 32);
  v7 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  obj = *(id *)(v7 + 40);
  v8 = objc_msgSend(v6, "isCancelledWithError:", &obj);
  objc_storeStrong((id *)(v7 + 40), obj);
  if (v8)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 2;
    *a4 = 1;
  }
  return objc_msgSend(*(id *)(a1 + 40), "setCompletedUnitCount:", objc_msgSend(*(id *)(a1 + 40), "completedUnitCount") + 1);
}

void __132__PLModelMigrationActionUtility_updateExtendedAttributesWithAction_managedObjectContext_fetchRequest_useObjectIDResumeMarker_error___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  id obj;

  v3 = a2;
  objc_msgSend(v3, "metadataFromMediaPropertiesOrOriginalResource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)a1[6];
  v6 = a1[4];
  v7 = *(_QWORD *)(a1[5] + 8);
  obj = *(id *)(v7 + 40);
  objc_msgSend(v5, "processExtendedAttributesWithAction:asset:metadata:error:", v6, v3, v4, &obj);

  objc_storeStrong((id *)(v7 + 40), obj);
}

@end
