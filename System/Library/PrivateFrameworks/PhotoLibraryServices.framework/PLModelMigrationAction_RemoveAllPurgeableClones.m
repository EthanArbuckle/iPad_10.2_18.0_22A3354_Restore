@implementation PLModelMigrationAction_RemoveAllPurgeableClones

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  uint64_t v17;
  id v18;
  void *v19;
  int64_t v20;
  uint64_t v22;
  uint64_t v23;
  BOOL (*v24)(_QWORD *, void *);
  void *v25;
  PLModelMigrationAction_RemoveAllPurgeableClones *v26;
  id v27;
  id v28;
  uint64_t *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  uint64_t v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t v41;
  _QWORD v42[2];

  v42[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38 = 0;
  v39 = &v38;
  v40 = 0x2020000000;
  v41 = 1;
  v32 = 0;
  v33 = &v32;
  v34 = 0x3032000000;
  v35 = __Block_byref_object_copy__1109;
  v36 = __Block_byref_object_dispose__1110;
  v37 = 0;
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  v10 = objc_alloc(MEMORY[0x1E0D73210]);
  -[PLModelMigrationActionBackground pathManager](self, "pathManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "photoDirectoryWithType:", 26);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v10, "initWithFilePath:", v12);

  v42[0] = *MEMORY[0x1E0C99A08];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = MEMORY[0x1E0C809B0];
  v23 = 3221225472;
  v24 = __95__PLModelMigrationAction_RemoveAllPurgeableClones_performActionWithManagedObjectContext_error___block_invoke;
  v25 = &unk_1E365FFA8;
  v26 = self;
  v29 = &v38;
  v30 = &v32;
  v15 = v14;
  v27 = v15;
  v31 = v9;
  v16 = v6;
  v28 = v16;
  objc_msgSend(v13, "visitURLsLoadingPropertiesForKeys:withBlock:", v15, &v22);
  -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress", v22, v23, v24, v25, v26);
  v17 = v39[3];
  v18 = (id)v33[5];
  v19 = v18;
  if (v17 != 1 && a4)
    *a4 = objc_retainAutorelease(v18);

  v20 = v39[3];
  _Block_object_dispose(&v32, 8);

  _Block_object_dispose(&v38, 8);
  return v20;
}

- (int64_t)removePurgableClonesForAssetUUID:(id)a3 withMOC:(id)a4 error:(id *)a5
{
  void *v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  int64_t v17;
  id v19;

  v7 = (void *)MEMORY[0x1E0C97B48];
  v8 = a4;
  v9 = a3;
  +[PLManagedAsset entityName](PLManagedAsset, "entityName");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "fetchRequestWithEntityName:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == %@"), CFSTR("uuid"), v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "setPredicate:", v12);
  v19 = 0;
  objc_msgSend(v8, "executeFetchRequest:error:", v11, &v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = v19;
  v15 = v14;
  if (v13)
  {
    objc_msgSend(v13, "firstObject");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "isReadyForPurgeSyndicationResources"))
      objc_msgSend(v16, "purgeSyndicationResourcesAfterMediaAnalysisProcessing");

    v17 = 1;
  }
  else
  {
    if (a5)
      *a5 = objc_retainAutorelease(v14);
    v17 = 3;
  }

  return v17;
}

+ (int64_t)actionProgressWeight
{
  return 400;
}

@end
