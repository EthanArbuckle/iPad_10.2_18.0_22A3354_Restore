@implementation PLModelMigrationAction_FixBlankPhotosFromVideoMode

- (id)buildFetchRequest
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v16[5];

  v16[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0C97B48];
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fetchRequestWithEntityName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("kind"), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v7;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uniformTypeIdentifier"), *MEMORY[0x1E0CEC530]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[1] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("adjustmentsState"), 3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[2] = v9;
  v10 = (void *)MEMORY[0x1E0CB3880];
  -[PLModelMigrationAction_FixBlankPhotosFromVideoMode startDate](self, "startDate");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "predicateWithFormat:", CFSTR("%K >= %@"), CFSTR("dateCreated"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v12;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v16, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "andPredicateWithSubpredicates:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPredicate:", v14);

  objc_msgSend(v5, "setFetchBatchSize:", 100);
  return v5;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v5;
  objc_class *v6;
  void *v7;
  PLEnumerateAndSaveController *v8;
  void *v9;
  uint64_t v10;
  id v11;
  PLEnumerateAndSaveController *v12;
  _BOOL4 v13;
  id v14;
  void *v15;
  NSObject *v16;
  _BOOL4 v17;
  NSObject *v18;
  uint64_t v19;
  __int128 *v20;
  void *v21;
  int64_t v22;
  void *v23;
  NSObject *v24;
  _BOOL4 v25;
  NSObject *v26;
  objc_class *v27;
  void *v28;
  __int128 *v29;
  void *v30;
  id v31;
  void *v32;
  char v33;
  uint64_t v35;
  void *v37;
  id v38;
  _QWORD v39[5];
  _QWORD v40[6];
  _QWORD v41[4];
  id v42;
  uint64_t v43;
  uint64_t *v44;
  uint64_t v45;
  uint64_t (*v46)(uint64_t, uint64_t);
  void (*v47)(uint64_t);
  id v48;
  int v49;
  uint64_t v50;
  __int16 v51;
  id v52;
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
  uint64_t v85;

  v85 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  -[PLModelMigrationAction_FixBlankPhotosFromVideoMode buildFetchRequest](self, "buildFetchRequest");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = 0;
  v44 = &v43;
  v45 = 0x3032000000;
  v46 = __Block_byref_object_copy__38433;
  v47 = __Block_byref_object_dispose__38434;
  v48 = 0;
  v8 = [PLEnumerateAndSaveController alloc];
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x1E0C809B0];
  v41[0] = MEMORY[0x1E0C809B0];
  v41[1] = 3221225472;
  v41[2] = __98__PLModelMigrationAction_FixBlankPhotosFromVideoMode_performActionWithManagedObjectContext_error___block_invoke;
  v41[3] = &unk_1E36700D0;
  v11 = v5;
  v42 = v11;
  v40[1] = 3221225472;
  v40[2] = __98__PLModelMigrationAction_FixBlankPhotosFromVideoMode_performActionWithManagedObjectContext_error___block_invoke_2;
  v40[3] = &unk_1E3670818;
  v40[4] = self;
  v40[5] = &v43;
  v39[0] = v10;
  v39[1] = 3221225472;
  v39[2] = __98__PLModelMigrationAction_FixBlankPhotosFromVideoMode_performActionWithManagedObjectContext_error___block_invoke_3;
  v39[3] = &unk_1E3669450;
  v39[4] = &v43;
  v40[0] = v10;
  v12 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v8, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v7, v37, v11, v9, 0, 1, v41, v40, v39);

  v38 = 0;
  v13 = -[PLEnumerateAndSaveController processObjectsWithError:](v12, "processObjectsWithError:", &v38);
  v14 = v38;
  if (v13)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      PLMigrationGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      v17 = os_log_type_enabled(v16, OS_LOG_TYPE_INFO);

      if (v17)
      {
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
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        PLMigrationGetLog();
        v18 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v18, OS_LOG_TYPE_INFO);
        v19 = objc_msgSend((id)v44[5], "completedUnitCount");
        v49 = 134217984;
        v50 = v19;
        LODWORD(v35) = 12;
        v20 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v49, v35);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "logWithMessage:fromCodeLocation:type:", v20, "PLModelMigrationActions_18000.m", 1476, 1);

        if (v20 != &v53)
          free(v20);
      }
    }
    v22 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      PLMigrationGetLog();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = os_log_type_enabled(v24, OS_LOG_TYPE_ERROR);

      if (v25)
      {
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
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        v53 = 0u;
        v54 = 0u;
        PLMigrationGetLog();
        v26 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v26, OS_LOG_TYPE_ERROR);
        v27 = (objc_class *)objc_opt_class();
        NSStringFromClass(v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v49 = 138543618;
        v50 = (uint64_t)v28;
        v51 = 2114;
        v52 = v14;
        LODWORD(v35) = 22;
        v29 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v49, v35);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "logWithMessage:fromCodeLocation:type:", v29, "PLModelMigrationActions_18000.m", 1479, 16);

        if (v29 != &v53)
          free(v29);
      }
    }
    v22 = 3;
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v31 = v14;
  v32 = v31;
  if (a4)
    v33 = v13;
  else
    v33 = 1;
  if ((v33 & 1) == 0)
    *a4 = objc_retainAutorelease(v31);

  _Block_object_dispose(&v43, 8);
  return v22;
}

- (id)startDate
{
  id v2;
  id v3;
  void *v4;
  void *v5;

  v2 = objc_alloc_init(MEMORY[0x1E0C99D78]);
  objc_msgSend(v2, "setDay:", 3);
  objc_msgSend(v2, "setMonth:", 5);
  objc_msgSend(v2, "setYear:", 2024);
  v3 = objc_alloc(MEMORY[0x1E0C99D48]);
  v4 = (void *)objc_msgSend(v3, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
  objc_msgSend(v4, "dateFromComponents:", v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end
