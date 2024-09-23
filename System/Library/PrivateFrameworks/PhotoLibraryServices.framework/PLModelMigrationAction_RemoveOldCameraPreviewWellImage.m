@implementation PLModelMigrationAction_RemoveOldCameraPreviewWellImage

- (int64_t)performActionWithManagedObjectContext:(id)a3 error:(id *)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  _BOOL4 v14;
  uint64_t v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  objc_class *v19;
  void *v20;
  _OWORD *v21;
  void *v22;
  PLCameraPreviewWellManager *v23;
  id v24;
  void *v25;
  uint64_t v27;
  id v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  _OWORD v33[32];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = 1;
  -[PLModelMigrationActionCore cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:](self, "cancellableDiscreteProgressWithTotalUnitCount:pendingParentUnitCount:", 1, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "becomeCurrentWithPendingUnitCount:", 1);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73138], "photoDataMiscDirectory");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "stringByAppendingPathComponent:", CFSTR("PreviewWellImage.tiff"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "fileExistsAtPath:", v11))
  {
    v13 = 0;
    LOBYTE(v14) = 1;
    goto LABEL_11;
  }
  v28 = 0;
  v12 = objc_msgSend(v9, "removeItemAtPath:error:", v11, &v28);
  v13 = v28;
  if ((v12 & 1) == 0)
  {
    -[PLModelMigrationActionCore logger](self, "logger");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      PLMigrationGetLog();
      v17 = objc_claimAutoreleasedReturnValue();
      v14 = os_log_type_enabled(v17, OS_LOG_TYPE_ERROR);

      if (!v14)
      {
LABEL_10:
        v7 = 3;
        goto LABEL_11;
      }
      memset(v33, 0, sizeof(v33));
      PLMigrationGetLog();
      v18 = objc_claimAutoreleasedReturnValue();
      os_log_type_enabled(v18, OS_LOG_TYPE_ERROR);
      v19 = (objc_class *)objc_opt_class();
      NSStringFromClass(v19);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = 138543618;
      v30 = v20;
      v31 = 2112;
      v32 = v13;
      LODWORD(v27) = 22;
      v21 = (_OWORD *)_os_log_send_and_compose_impl();

      -[PLModelMigrationActionCore logger](self, "logger", &v29, v27);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "logWithMessage:fromCodeLocation:type:", v21, "PLModelMigrationActions_18000.m", 481, 16);

      if (v21 != v33)
        free(v21);
    }
    LOBYTE(v14) = 0;
    goto LABEL_10;
  }
  LOBYTE(v14) = 1;
  v7 = 1;
LABEL_11:
  v23 = objc_alloc_init(PLCameraPreviewWellManager);
  -[PLCameraPreviewWellManager refreshPreviewWellImageWithContext:avoidNotificationIfLinkIsAlreadySet:](v23, "refreshPreviewWellImageWithContext:avoidNotificationIfLinkIsAlreadySet:", v6, 0);

  objc_msgSend(v8, "resignCurrent");
  v24 = v13;
  v25 = v24;
  if (!v14 && a4)
    *a4 = objc_retainAutorelease(v24);

  -[PLModelMigrationActionCore finalizeProgress](self, "finalizeProgress");
  return v7;
}

@end
