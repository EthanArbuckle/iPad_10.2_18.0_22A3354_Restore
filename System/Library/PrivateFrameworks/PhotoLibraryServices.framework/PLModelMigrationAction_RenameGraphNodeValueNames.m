@implementation PLModelMigrationAction_RenameGraphNodeValueNames

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  objc_class *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  PLEnumerateAndSaveController *v16;
  id v17;
  uint64_t v18;
  id v19;
  void *v20;
  int64_t v21;
  PLEnumerateAndSaveController *v23;
  void *v24;
  void *v25;
  id v26;
  _QWORD v27[4];
  id v28;
  id v29;
  uint64_t *v30;
  _QWORD v31[4];
  id v32;
  _QWORD v33[4];
  id v34;
  id v35;
  uint64_t v36;
  uint64_t *v37;
  uint64_t v38;
  uint64_t v39;
  _QWORD v40[9];
  _QWORD v41[11];

  v41[9] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v36 = 0;
  v37 = &v36;
  v38 = 0x2020000000;
  v39 = 1;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 2, 2);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = CFSTR("CustomTitle");
  v40[1] = CFSTR("ManualOrder");
  v41[0] = CFSTR("customTitle");
  v41[1] = CFSTR("manualOrder");
  v40[2] = CFSTR("AutomaticOrder");
  v40[3] = CFSTR("VerifiedType");
  v41[2] = CFSTR("automaticOrder");
  v41[3] = CFSTR("socialGroupVerifiedType");
  v40[4] = CFSTR("Label");
  v40[5] = CFSTR("Identifier");
  v41[4] = CFSTR("label");
  v41[5] = CFSTR("identifier");
  v40[6] = CFSTR("Type");
  v40[7] = CFSTR("RankingScore");
  v41[6] = CFSTR("type");
  v41[7] = CFSTR("rankingScore");
  v40[8] = CFSTR("SynonymsString");
  v41[8] = CFSTR("synonymsString");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v41, v40, 9);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "becomeCurrentWithPendingUnitCount:", 1);
  v8 = (void *)MEMORY[0x1E0C97B48];
  +[PLGraphNodeValue entityName](PLGraphNodeValue, "entityName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fetchRequestWithEntityName:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = 0;
  objc_msgSend(v6, "executeFetchRequest:error:", v10, &v35);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35;
  if (v25)
  {
    v23 = [PLEnumerateAndSaveController alloc];
    v12 = (objc_class *)objc_opt_class();
    NSStringFromClass(v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLModelMigrationActionCore pathManager](self, "pathManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = MEMORY[0x1E0C809B0];
    v33[0] = MEMORY[0x1E0C809B0];
    v33[1] = 3221225472;
    v33[2] = __96__PLModelMigrationAction_RenameGraphNodeValueNames_performActionWithManagedObjectContext_error___block_invoke;
    v33[3] = &unk_1E36700D0;
    v34 = v6;
    v31[0] = v15;
    v31[1] = 3221225472;
    v31[2] = __96__PLModelMigrationAction_RenameGraphNodeValueNames_performActionWithManagedObjectContext_error___block_invoke_2;
    v31[3] = &unk_1E366A108;
    v32 = v7;
    v27[0] = v15;
    v27[1] = 3221225472;
    v27[2] = __96__PLModelMigrationAction_RenameGraphNodeValueNames_performActionWithManagedObjectContext_error___block_invoke_3;
    v27[3] = &unk_1E3669400;
    v28 = v32;
    v30 = &v36;
    v29 = v24;
    v16 = -[PLEnumerateAndSaveController initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:](v23, "initWithName:fetchRequest:context:pathManager:concurrent:refreshAllAfterSave:generateContextBlock:didFetchObjectIDsBlock:processResultBlock:", v13, v10, v34, v14, 0, 0, v33, v31, v27);

    v26 = v11;
    -[PLEnumerateAndSaveController processObjectsWithError:](v16, "processObjectsWithError:", &v26);
    v17 = v26;

    v11 = v17;
  }
  else
  {
    v37[3] = 3;
  }
  objc_msgSend(v7, "resignCurrent");
  v18 = v37[3];
  v19 = v11;
  v20 = v19;
  if (v18 != 1 && a4)
    *a4 = objc_retainAutorelease(v19);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  v21 = v37[3];

  _Block_object_dispose(&v36, 8);
  return v21;
}

@end
