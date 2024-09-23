@implementation PLModelMigrationAction_PushAssetsWithPetSyncableFaces

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int64_t v19;
  void *v21;
  NSObject *v22;
  _BOOL4 v23;
  NSObject *v24;
  objc_class *v25;
  void *v26;
  id v27;
  __int128 *v28;
  void *v29;
  void *v30;
  NSObject *v31;
  _BOOL4 v32;
  NSObject *v33;
  objc_class *v34;
  void *v35;
  __int128 *v36;
  void *v37;
  uint64_t v38;
  void *v40;
  _QWORD v41[5];
  id v42;
  uint64_t *v43;
  uint64_t *v44;
  id obj;
  uint64_t v46;
  id *v47;
  uint64_t v48;
  uint64_t (*v49)(uint64_t, uint64_t);
  void (*v50)(uint64_t);
  id v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t v55;
  int v56;
  void *v57;
  __int16 v58;
  void *v59;
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
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  const __CFString *v92;
  _QWORD v93[5];

  v93[2] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v52 = 0;
  v53 = &v52;
  v54 = 0x2020000000;
  v55 = 1;
  v46 = 0;
  v47 = (id *)&v46;
  v48 = 0x3032000000;
  v49 = __Block_byref_object_copy__46832;
  v50 = __Block_byref_object_dispose__46833;
  v51 = 0;
  v6 = (void *)MEMORY[0x1E0C97B48];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fetchRequestWithEntityName:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("detectionType"), &unk_1E3763C20);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x1E0CB3528];
  v93[0] = v40;
  +[PLDetectedFace syncableFacesPredicate](PLDetectedFace, "syncableFacesPredicate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v93[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v93, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "andPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setPredicate:", v12);

  v92 = CFSTR("assetForFace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v92, 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRelationshipKeyPathsForPrefetching:", v13);

  v14 = v47 + 5;
  obj = v47[5];
  objc_msgSend(v5, "executeFetchRequest:error:", v8, &obj);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_storeStrong(v14, obj);
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v15, "count"), 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v16;
  if (v15)
  {
    v41[0] = MEMORY[0x1E0C809B0];
    v41[1] = 3221225472;
    v41[2] = __101__PLModelMigrationAction_PushAssetsWithPetSyncableFaces_performActionWithManagedObjectContext_error___block_invoke;
    v41[3] = &unk_1E366AD68;
    v41[4] = self;
    v43 = &v46;
    v44 = &v52;
    v42 = v16;
    objc_msgSend(v5, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v15, v41);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      if (!v47[5])
      {
        objc_storeStrong(v47 + 5, v18);
        v53[3] = 3;
        -[PLModelMigrationActionCore logger](self, "logger");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        if (v30)
        {
          PLMigrationGetLog();
          v31 = objc_claimAutoreleasedReturnValue();
          v32 = os_log_type_enabled(v31, OS_LOG_TYPE_ERROR);

          if (v32)
          {
            v90 = 0u;
            v91 = 0u;
            v88 = 0u;
            v89 = 0u;
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
            PLMigrationGetLog();
            v33 = objc_claimAutoreleasedReturnValue();
            os_log_type_enabled(v33, OS_LOG_TYPE_ERROR);
            v34 = (objc_class *)objc_opt_class();
            NSStringFromClass(v34);
            v35 = (void *)objc_claimAutoreleasedReturnValue();
            v56 = 138543618;
            v57 = v35;
            v58 = 2114;
            v59 = v18;
            LODWORD(v38) = 22;
            v36 = (__int128 *)_os_log_send_and_compose_impl();

            -[PLModelMigrationActionCore logger](self, "logger", &v56, v38);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "logWithMessage:fromCodeLocation:type:", v36, "PLModelMigrationActions_17000.m", 347, 16);

            if (v36 != &v60)
              free(v36);
          }
        }
      }
    }

  }
  else
  {
    v53[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (v21)
    {
      PLMigrationGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = os_log_type_enabled(v22, OS_LOG_TYPE_ERROR);

      if (v23)
      {
        v90 = 0u;
        v91 = 0u;
        v88 = 0u;
        v89 = 0u;
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
        PLMigrationGetLog();
        v24 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);
        v25 = (objc_class *)objc_opt_class();
        NSStringFromClass(v25);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = v47[5];
        v56 = 138543618;
        v57 = v26;
        v58 = 2114;
        v59 = v27;
        LODWORD(v38) = 22;
        v28 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v56, v38);
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "logWithMessage:fromCodeLocation:type:", v28, "PLModelMigrationActions_17000.m", 351, 16);

        if (v28 != &v60)
          free(v28);
      }
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease(v47[5]);
  v19 = v53[3];

  _Block_object_dispose(&v46, 8);
  _Block_object_dispose(&v52, 8);

  return v19;
}

@end
