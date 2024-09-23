@implementation PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos

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
  objc_class *v24;
  void *v25;
  uint64_t v26;
  _OWORD *v27;
  void *v28;
  int64_t v29;
  uint64_t v31;
  id obj;
  _QWORD v33[8];
  _QWORD v34[6];
  _QWORD v35[4];
  id v36;
  _QWORD v37[5];
  id v38;
  uint64_t v39;
  uint64_t *v40;
  uint64_t v41;
  uint64_t (*v42)(uint64_t, uint64_t);
  void (*v43)(uint64_t);
  id v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  uint64_t v48;
  int v49;
  void *v50;
  __int16 v51;
  uint64_t v52;
  _OWORD v53[32];
  _QWORD v54[5];

  v54[4] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2020000000;
  v48 = 1;
  v39 = 0;
  v40 = &v39;
  v41 = 0x3032000000;
  v42 = __Block_byref_object_copy__46832;
  v43 = __Block_byref_object_dispose__46833;
  v44 = 0;
  v7 = (void *)MEMORY[0x1E0C97B48];
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil || %K != nil"), CFSTR("assetForTorso"), CFSTR("personForTorso"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setPredicate:", v10);

  v54[0] = CFSTR("assetForTorso");
  v54[1] = CFSTR("personForTorso");
  v54[2] = CFSTR("assetForFace");
  v54[3] = CFSTR("personForFace");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRelationshipKeyPathsForPrefetching:", v11);

  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x3032000000;
  v37[3] = __Block_byref_object_copy__46832;
  v37[4] = __Block_byref_object_dispose__46833;
  v38 = 0;
  v12 = [PLEnumerateAndSaveController alloc];
  v13 = (objc_class *)objc_opt_class();
  NSStringFromClass(v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __106__PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos_performActionWithManagedObjectContext_error___block_invoke;
  v35[3] = &unk_1E36700D0;
  v17 = v6;
  v36 = v17;
  v34[0] = v16;
  v34[1] = 3221225472;
  v34[2] = __106__PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos_performActionWithManagedObjectContext_error___block_invoke_2;
  v34[3] = &unk_1E3670818;
  v34[4] = self;
  v34[5] = v37;
  v33[0] = v16;
  v33[1] = 3221225472;
  v33[2] = __106__PLModelMigrationAction_MergeDetectedFacesAndDetectedTorsos_performActionWithManagedObjectContext_error___block_invoke_3;
  v33[3] = &unk_1E366AD90;
  v33[4] = self;
  v33[5] = &v39;
  v33[6] = &v45;
  v33[7] = v37;
  v18 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v12, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v14, v9, v17, v15, 0, 1, v35, v34, v33);

  v19 = (id *)(v40 + 5);
  obj = (id)v40[5];
  LOBYTE(v15) = -[PLEnumerateAndSaveController processObjectsWithError:](v18, "processObjectsWithError:", &obj);
  objc_storeStrong(v19, obj);
  if ((v15 & 1) == 0)
  {
    v46[3] = 3;
    -[PLModelMigrationActionCore logger](self, "logger");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      PLMigrationGetLog();
      v21 = objc_claimAutoreleasedReturnValue();
      v22 = os_log_type_enabled(v21, OS_LOG_TYPE_ERROR);

      if (v22)
      {
        memset(v53, 0, sizeof(v53));
        PLMigrationGetLog();
        v23 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v23, OS_LOG_TYPE_ERROR);
        v24 = (objc_class *)objc_opt_class();
        NSStringFromClass(v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = v40[5];
        v49 = 138543618;
        v50 = v25;
        v51 = 2114;
        v52 = v26;
        LODWORD(v31) = 22;
        v27 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v49, v31);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "logWithMessage:fromCodeLocation:type:", v27, "PLModelMigrationActions_17000.m", 397, 16);

        if (v27 != v53)
          free(v27);
      }
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  if (a4)
    *a4 = objc_retainAutorelease((id)v40[5]);
  v29 = v46[3];

  _Block_object_dispose(v37, 8);
  _Block_object_dispose(&v39, 8);

  _Block_object_dispose(&v45, 8);
  return v29;
}

@end
