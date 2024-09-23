@implementation PLModelMigrationAction_ResetHighlights

+ (int64_t)actionProgressWeight
{
  return 500;
}

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  PLMomentGenerationDataManager *v7;
  void *v8;
  PLMomentGenerationDataManager *v9;
  void *v10;
  int64_t v11;
  id v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  _QWORD v19[4];
  NSObject *v20;
  uint64_t v21;
  const __CFString *v22;
  uint64_t v23;
  _QWORD v24[2];

  v24[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = [PLMomentGenerationDataManager alloc];
  -[PLModelMigrationActionCore pathManager](self, "pathManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PLMomentGenerationDataManager initWithManagedObjectContext:pathManagerForLightweightMigration:](v7, "initWithManagedObjectContext:pathManagerForLightweightMigration:", v6, v8);

  -[PLMomentGenerationDataManager generator](v9, "generator");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  +[PLMomentGenerationDataManager setManagerMomentarilyBlessed:](PLMomentGenerationDataManager, "setManagerMomentarilyBlessed:", v9);
  if (v10)
  {
    v23 = PLMomentGenerationShouldDeleteAllHighlightsKey;
    v24[0] = MEMORY[0x1E0C9AAB0];
    v11 = 1;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v24, &v23, 1);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v13 = dispatch_group_create();
    dispatch_group_enter(v13);
    v19[0] = MEMORY[0x1E0C809B0];
    v19[1] = 3221225472;
    v19[2] = __86__PLModelMigrationAction_ResetHighlights_performActionWithManagedObjectContext_error___block_invoke;
    v19[3] = &unk_1E3677AA0;
    v20 = v13;
    v14 = v13;
    objc_msgSend(v10, "rebuildAllHighlightsWithOptions:completionHandler:", v12, v19);
    dispatch_group_wait(v14, 0xFFFFFFFFFFFFFFFFLL);

  }
  else
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = *MEMORY[0x1E0D74498];
    v21 = *MEMORY[0x1E0CB2D50];
    v22 = CFSTR("Failed to obtain moment generator");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v22, &v21, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "errorWithDomain:code:userInfo:", v16, 41001, v17);
    v12 = (id)objc_claimAutoreleasedReturnValue();

    if (a4)
    {
      v12 = objc_retainAutorelease(v12);
      *a4 = v12;
    }
    v11 = 3;
  }

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  return v11;
}

@end
