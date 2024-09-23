@implementation PLModelMigrationAction_DeletePetPersonsAndDetectedFaces

- (int64_t)deleteManagedObjectsWithManagedObjectContext:(id)a3 entity:(Class)a4 predicate:(id)a5 pendingParentUnitCount:(int64_t)a6 deletedIdentifiers:(id *)a7 entityIdentifierKeyPath:(id)a8 error:(id *)a9
{
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  BOOL v27;
  char v28;
  int64_t v29;
  id *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  NSObject *v34;
  _BOOL4 v35;
  NSObject *v36;
  objc_class *v37;
  void *v38;
  __int128 *v39;
  void *v40;
  id v41;
  uint64_t v42;
  void *v43;
  NSObject *v44;
  _BOOL4 v45;
  NSObject *v46;
  objc_class *v47;
  void *v48;
  __int128 *v49;
  void *v50;
  uint64_t v52;
  void *v53;
  char v54;
  void *v55;
  _QWORD v57[4];
  id v58;
  id v59;
  id v60;
  id v61;
  Class v62;
  id v63;
  int v64;
  void *v65;
  __int16 v66;
  id v67;
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
  __int128 v97;
  __int128 v98;
  __int128 v99;
  uint64_t v100;

  v100 = *MEMORY[0x1E0C80C00];
  v14 = a3;
  v15 = a8;
  v16 = (void *)MEMORY[0x1E0C97B48];
  v17 = a5;
  -[objc_class entityName](a4, "entityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchRequestWithEntityName:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "setPredicate:", v17);
  v20 = v14;
  objc_msgSend(v19, "setFetchBatchSize:", 100);
  v63 = 0;
  objc_msgSend(v14, "executeFetchRequest:error:", v19, &v63);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = v63;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", objc_msgSend(v21, "count"), a6);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v21, "count"));
  v55 = v23;
  if (v21)
  {
    v57[0] = MEMORY[0x1E0C809B0];
    v57[1] = 3221225472;
    v57[2] = __193__PLModelMigrationAction_DeletePetPersonsAndDetectedFaces_deleteManagedObjectsWithManagedObjectContext_entity_predicate_pendingParentUnitCount_deletedIdentifiers_entityIdentifierKeyPath_error___block_invoke;
    v57[3] = &unk_1E366AD40;
    v58 = v15;
    v62 = a4;
    v59 = v24;
    v60 = v20;
    v61 = v23;
    objc_msgSend(v60, "enumerateWithIncrementalSaveUsingObjects:withBlock:", v21, v57);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = v25;
    if (v25)
      v27 = v22 == 0;
    else
      v27 = 0;
    v28 = !v27;
    if (v27)
    {
      v54 = v28;
      v22 = v25;
      -[PLModelMigrationActionCore logger](self, "logger");
      v42 = objc_claimAutoreleasedReturnValue();
      if (v42)
      {
        v43 = (void *)v42;
        v53 = v20;
        PLMigrationGetLog();
        v44 = objc_claimAutoreleasedReturnValue();
        v45 = os_log_type_enabled(v44, OS_LOG_TYPE_ERROR);

        if (v45)
        {
          v98 = 0u;
          v99 = 0u;
          v96 = 0u;
          v97 = 0u;
          v94 = 0u;
          v95 = 0u;
          v92 = 0u;
          v93 = 0u;
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
          PLMigrationGetLog();
          v46 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v46, OS_LOG_TYPE_ERROR);
          v47 = (objc_class *)objc_opt_class();
          NSStringFromClass(v47);
          v48 = (void *)objc_claimAutoreleasedReturnValue();
          v64 = 138543618;
          v65 = v48;
          v66 = 2114;
          v67 = v22;
          LODWORD(v52) = 22;
          v49 = (__int128 *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v64, v52);
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v50, "logWithMessage:fromCodeLocation:type:", v49, "PLModelMigrationActions_17000.m", 196, 16);

          if (v49 != &v68)
            free(v49);
        }
        v29 = 3;
        v20 = v53;
      }
      else
      {
        v29 = 3;
      }
      v30 = a7;
      v28 = v54;
    }
    else
    {
      v29 = 1;
      v30 = a7;
    }

    v41 = v22;
    if ((v28 & 1) != 0)
    {
      v29 = 1;
      goto LABEL_27;
    }
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v31 = objc_claimAutoreleasedReturnValue();
    if (v31)
    {
      v32 = (void *)v31;
      PLMigrationGetLog();
      v33 = v20;
      v34 = objc_claimAutoreleasedReturnValue();
      v35 = os_log_type_enabled(v34, OS_LOG_TYPE_ERROR);

      v20 = v33;
      if (v35)
      {
        v98 = 0u;
        v99 = 0u;
        v96 = 0u;
        v97 = 0u;
        v94 = 0u;
        v95 = 0u;
        v92 = 0u;
        v93 = 0u;
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
        PLMigrationGetLog();
        v36 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);
        v37 = (objc_class *)objc_opt_class();
        NSStringFromClass(v37);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        v64 = 138543618;
        v65 = v38;
        v66 = 2114;
        v67 = v22;
        LODWORD(v52) = 22;
        v39 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v64, v52);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v40, "logWithMessage:fromCodeLocation:type:", v39, "PLModelMigrationActions_17000.m", 200, 16);

        if (v39 != &v68)
          free(v39);
        v20 = v33;
      }
    }
    v41 = v22;
    v29 = 3;
    v30 = a7;
  }
  if (a9)
  {
    v41 = objc_retainAutorelease(v41);
    *a9 = v41;
  }
LABEL_27:

  if (v30)
    *v30 = (id)objc_msgSend(v24, "copy");

  return v29;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  int64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  NSObject *v21;
  _BOOL4 v22;
  NSObject *v23;
  _OWORD *v24;
  void *v25;
  uint64_t v27;
  void *v28;
  id v29;
  int v30;
  void *v31;
  _OWORD v32[32];
  const __CFString *v33;
  _QWORD v34[4];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLModelMigrationActionCore progress](self, "progress");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "totalUnitCount");
  if (v8 >= 0)
    v9 = v8;
  else
    v9 = v8 + 1;
  v10 = v9 >> 1;

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("detectionType"), &unk_1E3763BF0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = 0;
  v12 = -[PLModelMigrationAction_DeletePetPersonsAndDetectedFaces deleteManagedObjectsWithManagedObjectContext:entity:predicate:pendingParentUnitCount:deletedIdentifiers:entityIdentifierKeyPath:error:](self, "deleteManagedObjectsWithManagedObjectContext:entity:predicate:pendingParentUnitCount:deletedIdentifiers:entityIdentifierKeyPath:error:", v6, objc_opt_class(), v11, v10, &v29, CFSTR("personUUID"), a4);
  v13 = v29;
  if (v12 == 1)
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("detectionType"), &unk_1E3763C08);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[PLModelMigrationAction_DeletePetPersonsAndDetectedFaces deleteManagedObjectsWithManagedObjectContext:entity:predicate:pendingParentUnitCount:deletedIdentifiers:entityIdentifierKeyPath:error:](self, "deleteManagedObjectsWithManagedObjectContext:entity:predicate:pendingParentUnitCount:deletedIdentifiers:entityIdentifierKeyPath:error:", v6, objc_opt_class(), v14, v10, 0, 0, a4);

  }
  if (objc_msgSend(v13, "count"))
  {
    v33 = CFSTR("RKPerson");
    v34[0] = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigrationActionCore pathManager](self, "pathManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "photoDirectoryWithType:leafType:createIfNeeded:error:", 13, 3, 1, 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "stringByAppendingPathComponent:", CFSTR("recordstodelete.plist"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v15, "writeToFile:atomically:", v18, 1) & 1) == 0)
    {
      -[PLModelMigrationActionCore logger](self, "logger");
      v19 = objc_claimAutoreleasedReturnValue();
      if (v19)
      {
        v20 = (void *)v19;
        PLMigrationGetLog();
        v28 = v15;
        v21 = objc_claimAutoreleasedReturnValue();
        v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

        v15 = v28;
        if (v22)
        {
          memset(v32, 0, sizeof(v32));
          PLMigrationGetLog();
          v23 = objc_claimAutoreleasedReturnValue();
          os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
          v30 = 138412290;
          v31 = v28;
          LODWORD(v27) = 12;
          v24 = (_OWORD *)_os_log_send_and_compose_impl();

          -[PLModelMigrationActionCore logger](self, "logger", &v30, v27);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "logWithMessage:fromCodeLocation:type:", v24, "PLModelMigrationActions_17000.m", 233, 16);

          if (v24 != v32)
            free(v24);
          v15 = v28;
        }
      }
    }

  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");

  return v12;
}

@end
