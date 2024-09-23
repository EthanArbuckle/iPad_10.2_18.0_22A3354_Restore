@implementation PLModelMigrationAction_RenameSearchEntityGraphNodeValueNames_Label_Type_Identifier

- (int64_t)_renameSearchEntityGraphNodeValueName:(id)a3 toName:(id)a4 inContext:(id)a5 error:(id *)a6
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  int64_t v21;
  void *v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  NSObject *v27;
  _BOOL4 v28;
  NSObject *v29;
  objc_class *v30;
  void *v31;
  __int128 *v32;
  void *v33;
  uint64_t v35;
  void *v36;
  NSObject *v37;
  _BOOL4 v38;
  NSObject *v39;
  __int128 *v40;
  void *v41;
  uint64_t v42;
  uint64_t v43;
  id v45;
  id v46;
  id v47;
  int v48;
  id v49;
  __int16 v50;
  id v51;
  const __CFString *v52;
  id v53;
  _QWORD v54[2];
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
  __int128 v85;
  __int128 v86;
  uint64_t v87;

  v87 = *MEMORY[0x1E0C80C00];
  v45 = a4;
  v8 = a5;
  v9 = (void *)MEMORY[0x1E0C97B48];
  v10 = a3;
  +[PLGraphNode entityName](PLGraphNode, "entityName");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fetchRequestWithEntityName:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %d"), CFSTR("primaryLabelCode"), 1100);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setPredicate:", v13);

  objc_msgSend(v12, "setResultType:", 1);
  v47 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v12, &v47);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v47;
  if (!v14)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v35 = objc_claimAutoreleasedReturnValue();
    if (v35)
    {
      v36 = (void *)v35;
      PLMigrationGetLog();
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = os_log_type_enabled(v37, OS_LOG_TYPE_ERROR);

      if (v38)
      {
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
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        PLMigrationGetLog();
        v39 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v39, OS_LOG_TYPE_ERROR);
        v48 = 138412290;
        v49 = v15;
        LODWORD(v42) = 12;
        v40 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v48, v42);
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v41, "logWithMessage:fromCodeLocation:type:", v40, "PLModelMigrationActions_18000.m", 1179, 16);

        if (v40 != &v55)
          free(v40);
      }
    }
  }
  v16 = (void *)MEMORY[0x1E0CB3528];
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K IN %@"), CFSTR("node"), v14);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v54[0] = v17;
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("valueName"), v10);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v54[1] = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v54, 2);
  v19 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "andPredicateWithSubpredicates:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  v52 = CFSTR("valueName");
  v53 = v45;
  v21 = 1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v53, &v52, 1);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLGraphNodeValue entityName](PLGraphNodeValue, "entityName");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = v15;
  LOBYTE(v19) = +[PLModelMigrator executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:](PLModelMigrator, "executeBatchUpdateWithEntityName:predicate:propertiesToUpdate:managedObjectContext:error:", v23, v20, v22, v8, &v46);
  v24 = v46;

  if ((v19 & 1) == 0)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v25 = objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v26 = (void *)v25;
      PLMigrationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      v28 = os_log_type_enabled(v27, OS_LOG_TYPE_ERROR);

      if (v28)
      {
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
        v61 = 0u;
        v62 = 0u;
        v59 = 0u;
        v60 = 0u;
        v57 = 0u;
        v58 = 0u;
        v55 = 0u;
        v56 = 0u;
        PLMigrationGetLog();
        v29 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v29, OS_LOG_TYPE_ERROR);
        v30 = (objc_class *)objc_opt_class();
        NSStringFromClass(v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v48 = 138543618;
        v49 = v31;
        v50 = 2112;
        v51 = v24;
        LODWORD(v43) = 22;
        v32 = (__int128 *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionCore logger](self, "logger", &v48, v43);
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "logWithMessage:fromCodeLocation:type:", v32, "PLModelMigrationActions_18000.m", 1190, 16);

        if (v32 != &v55)
          free(v32);
      }
    }
    v21 = 3;
  }

  return v21;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v14;
  id v15;
  id v16;

  v6 = a3;
  v16 = 0;
  v7 = -[PLModelMigrationAction_RenameSearchEntityGraphNodeValueNames_Label_Type_Identifier _renameSearchEntityGraphNodeValueName:toName:inContext:error:](self, "_renameSearchEntityGraphNodeValueName:toName:inContext:error:", CFSTR("Label"), CFSTR("searchEntityLabel"), v6, &v16);
  v8 = v16;
  v9 = v8;
  if (v7 == 1)
  {
    v15 = v8;
    v7 = -[PLModelMigrationAction_RenameSearchEntityGraphNodeValueNames_Label_Type_Identifier _renameSearchEntityGraphNodeValueName:toName:inContext:error:](self, "_renameSearchEntityGraphNodeValueName:toName:inContext:error:", CFSTR("Type"), CFSTR("searchEntityType"), v6, &v15);
    v10 = v15;

    if (v7 == 1)
    {
      v14 = v10;
      v7 = -[PLModelMigrationAction_RenameSearchEntityGraphNodeValueNames_Label_Type_Identifier _renameSearchEntityGraphNodeValueName:toName:inContext:error:](self, "_renameSearchEntityGraphNodeValueName:toName:inContext:error:", CFSTR("Identifier"), CFSTR("searchEntityIdentifier"), v6, &v14);
      v9 = v14;

    }
    else
    {
      v9 = v10;
    }
  }
  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v11 = v9;
  v12 = v11;
  if (v7 != 1 && a4)
    *a4 = objc_retainAutorelease(v11);

  return v7;
}

@end
