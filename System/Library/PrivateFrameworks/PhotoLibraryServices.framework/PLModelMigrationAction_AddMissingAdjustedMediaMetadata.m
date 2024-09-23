@implementation PLModelMigrationAction_AddMissingAdjustedMediaMetadata

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
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
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  int64_t v24;
  id v25;
  id v26;
  void *v27;
  uint64_t v28;
  void *v29;
  NSObject *v30;
  _BOOL4 v31;
  NSObject *v32;
  objc_class *v33;
  void *v34;
  _OWORD *v35;
  void *v36;
  uint64_t v38;
  void *v39;
  id v40;
  id v41;
  _QWORD v42[2];
  void *v43;
  _QWORD v44[3];
  int v45;
  void *v46;
  _OWORD v47[32];
  uint64_t v48;

  v48 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  -[PLModelMigrationActionBackground databaseContext](self, "databaseContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "newShortLivedLibraryWithName:", "-[PLModelMigrationAction_AddMissingAdjustedMediaMetadata performActionWithManagedObjectContext:error:]");

  objc_msgSend(v8, "libraryServicesManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "isCloudPhotoLibraryEnabled") & 1) != 0
    || -[PLModelMigrationAction_AddMissingAdjustedMediaMetadata isUnitTestingWithLibraryServiceManager:](self, "isUnitTestingWithLibraryServiceManager:", v9))
  {
    -[PLModelMigrationActionBackground resumeMarker](self, "resumeMarker");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = v6;
    PLModelMigrationActionUtilityConvertObjectIDResumeMarkerString(v6, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x1E0C97B48];
    +[PLManagedAsset entityName](PLManagedAsset, "entityName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "fetchRequestWithEntityName:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)MEMORY[0x1E0CB3528];
    +[PLManagedAsset predicateForAdjustedAssetsWithKeyPathToAsset:](PLManagedAsset, "predicateForAdjustedAssetsWithKeyPathToAsset:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v44[0] = v16;
    v39 = v8;
    if (v11)
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("self >= %@"), v11);
    else
      objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithValue:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v44[1] = v17;
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K == NULL"), CFSTR("additionalAttributes.mediaMetadata"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v44[2] = v18;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v44, 3);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "andPredicateWithSubpredicates:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setPredicate:", v20);

    objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("objectID"), 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v43 = v21;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setSortDescriptors:", v22);

    v42[0] = CFSTR("additionalAttributes");
    v42[1] = CFSTR("additionalAttributes.mediaMetadata");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v42, 2);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRelationshipKeyPathsForPrefetching:", v23);

    v41 = 0;
    v6 = v40;
    v24 = +[PLModelMigrationActionUtility processAssetWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:processingBlock:](PLModelMigrationActionUtility, "processAssetWithAction:managedObjectContext:fetchRequest:useObjectIDResumeMarker:error:processingBlock:", self, v40, v14, 1, &v41, &__block_literal_global_301);
    v25 = v41;
    -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
    v26 = v25;
    v27 = v26;
    if (v24 != 1 && a4)
      *a4 = objc_retainAutorelease(v26);

    v8 = v39;
  }
  else
  {
    -[PLModelMigrationActionBackground logger](self, "logger");
    v28 = objc_claimAutoreleasedReturnValue();
    if (v28)
    {
      v29 = (void *)v28;
      PLMigrationGetLog();
      v30 = objc_claimAutoreleasedReturnValue();
      v31 = os_log_type_enabled(v30, OS_LOG_TYPE_INFO);

      if (v31)
      {
        memset(v47, 0, sizeof(v47));
        PLMigrationGetLog();
        v32 = objc_claimAutoreleasedReturnValue();
        os_log_type_enabled(v32, OS_LOG_TYPE_INFO);
        v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        v45 = 138543362;
        v46 = v34;
        LODWORD(v38) = 12;
        v35 = (_OWORD *)_os_log_send_and_compose_impl();

        -[PLModelMigrationActionBackground logger](self, "logger", &v45, v38);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "logWithMessage:fromCodeLocation:type:", v35, "PLModelMigrationActionBackground.m", 1329, 1);

        if (v35 != v47)
          free(v35);
      }
    }
    -[PLModelMigrationActionBackground finalizeProgress](self, "finalizeProgress");
    v24 = 1;
  }

  return v24;
}

+ (int64_t)actionProgressWeight
{
  return 100;
}

@end
