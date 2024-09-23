@implementation PLModelMigrationAction_UpdateEditSuggestionImageRecipeID

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  int64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  _QWORD v16[5];
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t v21;
  uint8_t buf[4];
  uint64_t v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  +[PLInternalResource fetchRequest](PLInternalResource, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("recipeID"), 66136);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v16[4] = &v18;
  v17 = 0;
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __104__PLModelMigrationAction_UpdateEditSuggestionImageRecipeID_performActionWithManagedObjectContext_error___block_invoke;
  v16[3] = &unk_1E36696D0;
  v9 = +[PLModelMigrationActionUtility processManagedObjectsWithAction:managedObjectContext:fetchRequest:pendingParentUnitCount:error:processingBlock:](PLModelMigrationActionUtility, "processManagedObjectsWithAction:managedObjectContext:fetchRequest:pendingParentUnitCount:error:processingBlock:", self, v6, v7, 0, &v17, v16);
  v10 = v17;
  PLMigrationGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    v12 = v19[3];
    *(_DWORD *)buf = 134217984;
    v23 = v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_DEFAULT, "PLModelMigrationAction_UpdateEditSuggestionImageRecipeID: updated %ld resources.", buf, 0xCu);
  }

  v13 = v10;
  v14 = v13;
  if (v9 != 1 && a4)
    *a4 = objc_retainAutorelease(v13);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  _Block_object_dispose(&v18, 8);

  return v9;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end
