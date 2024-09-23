@implementation PLModelMigrationAction_RemoveInvalidExtendedAttributesDateTimezone

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  int64_t v21;
  uint64_t v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  _OWORD *v29;
  void *v30;
  id v31;
  uint64_t v33;
  id v36;
  int v37;
  void *v38;
  __int16 v39;
  id v40;
  _OWORD v41[32];
  _QWORD v42[2];
  _QWORD v43[2];
  _QWORD v44[2];
  _QWORD v45[5];

  v45[2] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0CB3528];
  v5 = (void *)MEMORY[0x1E0CB3880];
  v6 = a3;
  objc_msgSend(v5, "predicateWithFormat:", CFSTR("%K = nil"), CFSTR("dateCreated"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v45[0] = v7;
  v8 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("timezoneName"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v44[0] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K != nil"), CFSTR("timezoneOffset"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v44[1] = v10;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "orPredicateWithSubpredicates:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v45[1] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v45, 2);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v42[0] = CFSTR("timezoneName");
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v15 = objc_claimAutoreleasedReturnValue();
  v42[1] = CFSTR("timezoneOffset");
  v43[0] = v15;
  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v43[1] = v16;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v43, v42, 2);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  +[PLExtendedAttributes entityName](PLExtendedAttributes, "entityName");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = 0;
  LOBYTE(v15) = +[PLModelMigrator executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:](PLModelMigrator, "executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:", v18, v14, v17, v6, &v36);

  v19 = v36;
  if ((v15 & 1) != 0)
  {
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v20 = v19;
    if (a4)
      *a4 = objc_retainAutorelease(v20);
    v21 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      v23 = (void *)v22;
      PLMigrationGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

      if (v25)
      {
        memset(v41, 0, sizeof(v41));
        PLMigrationGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v37 = 138543618;
        v38 = v28;
        v39 = 2114;
        v40 = v19;
        LODWORD(v33) = 22;
        v29 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v37, v33);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_16000.m", 294, 16);

        if (v29 != v41)
          free(v29);
      }
    }
    -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
    v31 = v19;
    v21 = 3;
  }

  return v21;
}

@end
