@implementation PLModelMigrationAction_ResetClusterSequenceNumberForRejectedFaces

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;
  id v12;
  id v13;
  int64_t v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  _BOOL4 v18;
  NSObject *v19;
  objc_class *v20;
  void *v21;
  _OWORD *v22;
  void *v23;
  id v24;
  uint64_t v26;
  id v27;
  int v28;
  void *v29;
  __int16 v30;
  id v31;
  _OWORD v32[32];
  const __CFString *v33;
  _QWORD v34[2];

  v34[1] = *MEMORY[0x1E0C80C00];
  v6 = (void *)MEMORY[0x1E0CB3880];
  v7 = a3;
  objc_msgSend(v6, "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("trainingType"), 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = CFSTR("clusterSequenceNumber");
  v34[0] = &unk_1E375E568;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v34, &v33, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLDetectedFace entityName](PLDetectedFace, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v11 = +[PLModelMigrator executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:](PLModelMigrator, "executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:", v10, v8, v9, v7, &v27);

  v12 = v27;
  if (v11)
  {
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v13 = v12;
    v14 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      PLMigrationGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

      if (v18)
      {
        memset(v32, 0, sizeof(v32));
        PLMigrationGetLog();
        v19 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v19, OS_LOG_TYPE_ERROR);
        v20 = (objc_class *)objc_opt_class();
        NSStringFromClass(v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v28 = 138543618;
        v29 = v21;
        v30 = 2114;
        v31 = v12;
        LODWORD(v26) = 22;
        v22 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v28, v26);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "logWithMessage:fromCodeLocation:type:", v22, "PLModelMigrationActions_16000.m", 841, 16);

        if (v22 != v32)
          free(v22);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v24 = v12;
    if (a4)
      *a4 = objc_retainAutorelease(v24);
    v14 = 3;
  }

  return v14;
}

@end
