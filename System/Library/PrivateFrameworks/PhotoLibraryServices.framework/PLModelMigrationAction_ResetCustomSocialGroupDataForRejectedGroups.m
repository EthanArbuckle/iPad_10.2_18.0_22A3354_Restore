@implementation PLModelMigrationAction_ResetCustomSocialGroupDataForRejectedGroups

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  id *v9;
  int64_t v10;
  id v11;
  void *v12;
  _QWORD v14[6];
  id obj;
  _QWORD v16[4];
  uint64_t v17;
  id *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v6 = a3;
  v17 = 0;
  v18 = (id *)&v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__38433;
  v21 = __Block_byref_object_dispose__38434;
  v22 = 0;
  +[PLGraphNode fetchRequest](PLGraphNode, "fetchRequest");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %d"), CFSTR("primaryLabelCode"), 1000);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setPredicate:", v8);

  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  +[PLGraphLabel ensureLabelsAreUpdatedInContext:](PLGraphLabel, "ensureLabelsAreUpdatedInContext:", v6);
  v9 = v18;
  obj = v18[5];
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __114__PLModelMigrationAction_ResetCustomSocialGroupDataForRejectedGroups_performActionWithManagedObjectContext_error___block_invoke;
  v14[3] = &unk_1E36696A8;
  v14[4] = &v17;
  v14[5] = v16;
  v10 = +[PLModelMigrationActionUtility processManagedObjectsWithAction:managedObjectContext:fetchRequest:pendingParentUnitCount:error:processingBlock:](PLModelMigrationActionUtility, "processManagedObjectsWithAction:managedObjectContext:fetchRequest:pendingParentUnitCount:error:processingBlock:", self, v6, v7, 0, &obj, v14);
  objc_storeStrong(v9 + 5, obj);
  v11 = v18[5];
  v12 = v11;
  if (v10 != 1 && a4)
    *a4 = objc_retainAutorelease(v11);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  _Block_object_dispose(v16, 8);

  _Block_object_dispose(&v17, 8);
  return v10;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end
