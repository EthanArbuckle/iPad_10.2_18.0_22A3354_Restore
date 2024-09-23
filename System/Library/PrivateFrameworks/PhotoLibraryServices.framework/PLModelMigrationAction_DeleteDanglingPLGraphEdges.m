@implementation PLModelMigrationAction_DeleteDanglingPLGraphEdges

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  PLEnumerateAndSaveController *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  id v24;
  PLEnumerateAndSaveController *v25;
  id v26;
  void *v27;
  NSObject *v28;
  _BOOL4 v29;
  NSObject *v30;
  uint64_t v31;
  __int128 *v32;
  void *v33;
  int64_t v34;
  void *v35;
  NSObject *v36;
  _BOOL4 v37;
  NSObject *v38;
  objc_class *v39;
  void *v40;
  __int128 *v41;
  void *v42;
  uint64_t v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  _QWORD v52[5];
  _QWORD v53[6];
  _QWORD v54[4];
  id v55;
  uint64_t v56;
  uint64_t *v57;
  uint64_t v58;
  uint64_t (*v59)(uint64_t, uint64_t);
  void (*v60)(uint64_t);
  id v61;
  int v62;
  uint64_t v63;
  __int16 v64;
  id v65;
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
  __int128 v97;
  _QWORD v98[4];
  _QWORD v99[4];
  _QWORD v100[5];

  v100[2] = *MEMORY[0x1E0C80C00];
  v45 = a3;
  v4 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("sourceNode"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v99[0] = v49;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("sourceAsset"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v99[1] = v48;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("sourceMoment"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v99[2] = v47;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("sourcePerson"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v99[3] = v46;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v99, 4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "andPredicateWithSubpredicates:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v100[0] = v6;
  v7 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("targetNode"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v98[0] = v8;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("targetAsset"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v98[1] = v9;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("targetMoment"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v98[2] = v10;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == nil"), CFSTR("targetPerson"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v98[3] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v98, 4);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "andPredicateWithSubpredicates:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v100[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v100, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orPredicateWithSubpredicates:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v56 = 0;
  v57 = &v56;
  v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__38433;
  v60 = __Block_byref_object_dispose__38434;
  v61 = 0;
  v16 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphEdge entityName](PLGraphEdge, "entityName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "fetchRequestWithEntityName:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v18, "setPredicate:", v15);
  v19 = [PLEnumerateAndSaveController alloc];
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = MEMORY[0x1E0C809B0];
  v54[0] = MEMORY[0x1E0C809B0];
  v54[1] = 3221225472;
  v54[2] = __97__PLModelMigrationAction_DeleteDanglingPLGraphEdges_performActionWithManagedObjectContext_error___block_invoke;
  v54[3] = &unk_1E36700D0;
  v24 = v45;
  v55 = v24;
  v53[1] = 3221225472;
  v53[2] = __97__PLModelMigrationAction_DeleteDanglingPLGraphEdges_performActionWithManagedObjectContext_error___block_invoke_2;
  v53[3] = &unk_1E3670818;
  v53[4] = self;
  v53[5] = &v56;
  v52[0] = v23;
  v52[1] = 3221225472;
  v52[2] = __97__PLModelMigrationAction_DeleteDanglingPLGraphEdges_performActionWithManagedObjectContext_error___block_invoke_3;
  v52[3] = &unk_1E3669518;
  v52[4] = &v56;
  v53[0] = v23;
  v25 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v19, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v21, v18, v24, v22, 0, 0, v54, v53, v52);

  v51 = 0;
  LODWORD(v21) = -[PLEnumerateAndSaveController processObjectsWithError:](v25, "processObjectsWithError:", &v51);
  v26 = v51;
  if ((_DWORD)v21)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      PLMigrationGetLog();
      v28 = objc_claimAutoreleasedReturnValue();
      v29 = os_log_type_enabled(v28, OS_LOG_TYPE_INFO);

      if (v29)
      {
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
        v66 = 0u;
        v67 = 0u;
        PLMigrationGetLog();
        v30 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v30, OS_LOG_TYPE_INFO);
        v31 = objc_msgSend((id)v57[5], "completedUnitCount");
        v62 = 134217984;
        v63 = v31;
        LODWORD(v44) = 12;
        v32 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v62, v44);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigrationActions_18000.m", 820, 1);

        if (v32 != &v66)
          free(v32);
      }
    }
    v34 = 1;
  }
  else
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      PLMigrationGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      v37 = os_log_type_enabled(v36, OS_LOG_TYPE_ERROR);

      if (v37)
      {
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
        v66 = 0u;
        v67 = 0u;
        PLMigrationGetLog();
        v38 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v38, OS_LOG_TYPE_ERROR);
        v39 = (objc_class *)objc_opt_class();
        NSStringFromClass(v39);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        v62 = 138543618;
        v63 = (uint64_t)v40;
        v64 = 2112;
        v65 = v26;
        LODWORD(v44) = 22;
        v41 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v62, v44);
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v42, "logWithMessage:fromCodeLocation:type:", v41, "PLModelMigrationActions_18000.m", 823, 16);

        if (v41 != &v66)
          free(v41);
      }
    }
    v34 = 3;
  }

  _Block_object_dispose(&v56, 8);
  return v34;
}

+ (int64_t)actionProgressWeight
{
  return 200;
}

@end
