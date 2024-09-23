@implementation PLDeviceRestoreMigrationPostProcessingSupport

- (PLDeviceRestoreMigrationPostProcessingSupport)initWithModelMigrator:(id)a3
{
  id v4;
  PLDeviceRestoreMigrationPostProcessingSupport *v5;
  PLDeviceRestoreMigrationPostProcessingSupport *v6;
  uint64_t v7;
  PLPhotoLibraryPathManager *pathManager;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PLDeviceRestoreMigrationPostProcessingSupport;
  v5 = -[PLDeviceRestoreMigrationPostProcessingSupport init](&v10, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_modelMigrator, v4);
    objc_msgSend(v4, "pathManager");
    v7 = objc_claimAutoreleasedReturnValue();
    pathManager = v6->_pathManager;
    v6->_pathManager = (PLPhotoLibraryPathManager *)v7;

    v6->_tokenLock._os_unfair_lock_opaque = 0;
  }

  return v6;
}

- (BOOL)foregroundRestoreFromCloudBackupCompleteTokenExists
{
  char v2;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  -[PLPhotoLibraryPathManager cloudRestoreForegroundPhaseCompleteTokenPath](self->_pathManager, "cloudRestoreForegroundPhaseCompleteTokenPath");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  PLSafeRunWithUnfairLock();
  v2 = *((_BYTE *)v6 + 24);

  _Block_object_dispose(&v5, 8);
  return v2;
}

- (BOOL)needsToPrepareForBackgroundRestore
{
  void *v3;
  char v4;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  char v11;

  v8 = 0;
  v9 = &v8;
  v10 = 0x2020000000;
  v11 = 0;
  -[PLPhotoLibraryPathManager cloudRestoreForegroundPhaseCompleteTokenPath](self->_pathManager, "cloudRestoreForegroundPhaseCompleteTokenPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager cloudRestoreCompleteTokenPath](self->_pathManager, "cloudRestoreCompleteTokenPath");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  v7 = v3;
  PLSafeRunWithUnfairLock();
  v4 = *((_BYTE *)v9 + 24);

  _Block_object_dispose(&v8, 8);
  return v4;
}

- (BOOL)isBackgroundRestorePostProcessingInProgressTokenValid
{
  char v2;
  uint64_t v4;
  uint64_t *v5;
  uint64_t v6;
  char v7;

  v4 = 0;
  v5 = &v4;
  v6 = 0x2020000000;
  v7 = 1;
  PLSafeRunWithUnfairLock();
  v2 = *((_BYTE *)v5 + 24);
  _Block_object_dispose(&v4, 8);
  return v2;
}

- (BOOL)writeBackgroundRestorePostProcessingInProgressToken
{
  char v2;
  id v4;
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;
  _QWORD v9[3];
  int v10;
  _QWORD v11[5];
  id v12;

  -[PLPhotoLibraryPathManager cloudRestoreBackgroundPhaseInProgressTokenPath](self->_pathManager, "cloudRestoreBackgroundPhaseInProgressTokenPath");
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = __Block_byref_object_copy__33483;
  v11[4] = __Block_byref_object_dispose__33484;
  v12 = 0;
  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 1;
  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4 = (id)objc_claimAutoreleasedReturnValue();
  PLSafeRunWithUnfairLock();
  v2 = *((_BYTE *)v6 + 24);

  _Block_object_dispose(&v5, 8);
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(v11, 8);

  return v2;
}

- (BOOL)writeBackgroundRestorePostProcessingCompleteAndArchiveTokens
{
  PLDeviceRestoreMigrationPostProcessingSupport *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  char v16;

  v2 = self;
  -[PLPhotoLibraryPathManager cloudRestoreForegroundPhaseCompleteTokenPath](self->_pathManager, "cloudRestoreForegroundPhaseCompleteTokenPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager cloudRestoreBackgroundPhaseInProgressTokenPath](v2->_pathManager, "cloudRestoreBackgroundPhaseInProgressTokenPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLPhotoLibraryPathManager cloudRestoreCompleteTokenPath](v2->_pathManager, "cloudRestoreCompleteTokenPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0D73188], "currentBuildVersionString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR("_%@"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = 0;
  v14 = &v13;
  v15 = 0x2020000000;
  v16 = 1;
  v9 = v3;
  v10 = v7;
  v11 = v4;
  v12 = v5;
  PLSafeRunWithUnfairLock();
  LOBYTE(v2) = *((_BYTE *)v14 + 24);

  _Block_object_dispose(&v13, 8);
  return (char)v2;
}

- (BOOL)writeModelMigrationRestorePostProcessingCompleteToken
{
  void *v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  char v10;
  __CFString *v12;
  id v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  -[PLPhotoLibraryPathManager modelRestorePostProcessingCompleteTokenPath](self->_pathManager, "modelRestorePostProcessingCompleteTokenPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  WeakRetained = objc_loadWeakRetained((id *)&self->_modelMigrator);
  objc_msgSend(WeakRetained, "deviceRestoreMigrationSupport");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "restoreTypeDescription");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = CFSTR("error");
  if (v6)
    v8 = (__CFString *)v6;
  v9 = v8;

  v12 = v9;
  v13 = v3;
  PLSafeRunWithUnfairLock();
  v10 = *((_BYTE *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v10;
}

- (BOOL)isModelMigrationRestorePostProcessingComplete
{
  char v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  char v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  if (-[PLPhotoLibraryPathManager isDeviceRestoreSupported](self->_pathManager, "isDeviceRestoreSupported"))
  {
    -[PLPhotoLibraryPathManager modelRestorePostProcessingCompleteTokenPath](self->_pathManager, "modelRestorePostProcessingCompleteTokenPath");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    PLSafeRunWithUnfairLock();

  }
  v3 = *((_BYTE *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_destroyWeak((id *)&self->_modelMigrator);
}

void __94__PLDeviceRestoreMigrationPostProcessingSupport_isModelMigrationRestorePostProcessingComplete__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", *(_QWORD *)(a1 + 32), 0);

}

void __102__PLDeviceRestoreMigrationPostProcessingSupport_writeModelMigrationRestorePostProcessingCompleteToken__block_invoke(_QWORD *a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  char v14;
  id v15;
  NSObject *v16;
  void *v17;
  void *v18;
  id v19;
  uint8_t buf[4];
  id v21;
  _QWORD v22[6];
  _QWORD v23[7];

  v23[6] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("Date");
  PLCompleteDateFormatter();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringFromDate:", v17);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v2;
  v22[1] = CFSTR("Build");
  objc_msgSend(MEMORY[0x1E0D73188], "currentBuildVersionString");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v23[1] = v3;
  v22[2] = CFSTR("Process");
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "processName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v5;
  v22[3] = CFSTR("PID");
  v6 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "processIdentifier"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = a1[4];
  v23[3] = v8;
  v23[4] = v9;
  v22[4] = CFSTR("RestoreType");
  v22[5] = CFSTR("ModelVersion");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", +[PLModelMigrator currentModelVersion](PLModelMigrator, "currentModelVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v10;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = (void *)objc_opt_class();
  v13 = a1[6];
  v19 = 0;
  v14 = objc_msgSend(v12, "_writeTokenToPath:withInfo:allowOverwrite:error:", v13, v11, 0, &v19);
  v15 = v19;
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v14;
  if (!*(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24))
  {
    PLMigrationGetLog();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v21 = v15;
      _os_log_impl(&dword_199541000, v16, OS_LOG_TYPE_ERROR, "Failed to write ModelRestorePostProcessingCompleteToken %@", buf, 0xCu);
    }

  }
}

void __109__PLDeviceRestoreMigrationPostProcessingSupport_writeBackgroundRestorePostProcessingCompleteAndArchiveTokens__block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  char v5;
  id v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  uint64_t v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  const char *v16;
  NSObject *v17;
  os_log_type_t v18;
  uint32_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  char v23;
  id v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  NSObject *v36;
  void *v37;
  uint64_t v38;
  int v39;
  id v40;
  NSObject *v41;
  _BOOL4 v42;
  void *v43;
  void *v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  id v49;
  _QWORD v50[5];
  _QWORD v51[5];
  uint8_t buf[4];
  void *v53;
  __int16 v54;
  id v55;
  uint64_t v56;

  v56 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = a1[4];
  v4 = a1[5];
  v49 = 0;
  v5 = objc_msgSend(v2, "moveItemAtPath:toPath:error:", v3, v4, &v49);
  v6 = v49;
  v7 = v6;
  if ((v5 & 1) != 0)
  {
    v8 = v6;
    goto LABEL_12;
  }
  *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 0;
  PLMigrationGetLog();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
  {
    v10 = (void *)a1[5];
    *(_DWORD *)buf = 138543618;
    v53 = v10;
    v54 = 2112;
    v55 = v7;
    _os_log_impl(&dword_199541000, v9, OS_LOG_TYPE_ERROR, "Failed to archive foreground token to %{public}@: %@", buf, 0x16u);
  }

  v11 = a1[4];
  v48 = v7;
  v12 = objc_msgSend(v2, "removeItemAtPath:error:", v11, &v48);
  v8 = v48;

  PLMigrationGetLog();
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if ((v12 & 1) != 0)
  {
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v15 = (void *)a1[4];
      *(_DWORD *)buf = 138543362;
      v53 = v15;
      v16 = "Removed foreground token %{public}@";
      v17 = v14;
      v18 = OS_LOG_TYPE_DEFAULT;
      v19 = 12;
LABEL_10:
      _os_log_impl(&dword_199541000, v17, v18, v16, buf, v19);
    }
  }
  else if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
  {
    v20 = (void *)a1[4];
    *(_DWORD *)buf = 138543618;
    v53 = v20;
    v54 = 2112;
    v55 = v8;
    v16 = "Failed to remove foreground token %{public}@: %@";
    v17 = v14;
    v18 = OS_LOG_TYPE_ERROR;
    v19 = 22;
    goto LABEL_10;
  }

LABEL_12:
  v21 = a1[6];
  v22 = a1[7];
  v47 = v8;
  v23 = objc_msgSend(v2, "moveItemAtPath:toPath:error:", v21, v22, &v47);
  v24 = v47;

  if ((v23 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 0;
    PLMigrationGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      v26 = (void *)a1[7];
      *(_DWORD *)buf = 138543618;
      v53 = v26;
      v54 = 2112;
      v55 = v24;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Failed to create restore complete token by archiving in progress to %{public}@: %@", buf, 0x16u);
    }

    if (objc_msgSend(v2, "fileExistsAtPath:isDirectory:", a1[7], 0))
    {
      PLMigrationGetLog();
      v27 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Found existing restore complete token", buf, 2u);
      }

      *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
    }
    else
    {
      v50[0] = CFSTR("Date");
      PLCompleteDateFormatter();
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "stringFromDate:", v44);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v51[0] = v28;
      v50[1] = CFSTR("Build");
      objc_msgSend(MEMORY[0x1E0D73188], "currentBuildVersionString");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v51[1] = v29;
      v50[2] = CFSTR("Process");
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "processName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v51[2] = v31;
      v50[3] = CFSTR("PID");
      v32 = (void *)MEMORY[0x1E0CB37E8];
      objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v32, "numberWithInt:", objc_msgSend(v33, "processIdentifier"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v50[4] = CFSTR("InProgressCounter");
      v51[3] = v34;
      v51[4] = &unk_1E375E7C0;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v51, v50, 5);
      v35 = (void *)objc_claimAutoreleasedReturnValue();

      PLMigrationGetLog();
      v36 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v53 = v35;
        _os_log_impl(&dword_199541000, v36, OS_LOG_TYPE_ERROR, "Creating new restore complete token with data %{public}@", buf, 0xCu);
      }

      v37 = (void *)objc_opt_class();
      v38 = a1[7];
      v46 = v24;
      v39 = objc_msgSend(v37, "_writeTokenToPath:withInfo:allowOverwrite:error:", v38, v35, 1, &v46);
      v40 = v46;

      PLMigrationGetLog();
      v41 = objc_claimAutoreleasedReturnValue();
      v42 = os_log_type_enabled(v41, OS_LOG_TYPE_ERROR);
      if (v39)
      {
        if (v42)
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_ERROR, "Created new restore complete token", buf, 2u);
        }

        *(_BYTE *)(*(_QWORD *)(a1[9] + 8) + 24) = 1;
      }
      else
      {
        if (v42)
        {
          v43 = (void *)a1[7];
          *(_DWORD *)buf = 138543618;
          v53 = v43;
          v54 = 2112;
          v55 = v40;
          _os_log_impl(&dword_199541000, v41, OS_LOG_TYPE_ERROR, "Failed to create new restore complete token %{public}@: %@", buf, 0x16u);
        }

      }
      v24 = v40;
    }
  }

}

void __100__PLDeviceRestoreMigrationPostProcessingSupport_writeBackgroundRestorePostProcessingInProgressToken__block_invoke(_QWORD *a1)
{
  uint64_t v1;
  uint64_t v2;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  char v21;
  id v22;
  NSObject *v23;
  void *v24;
  void *v25;
  id v27;
  uint8_t buf[4];
  id v29;
  _QWORD v30[5];
  _QWORD v31[6];

  v31[5] = *MEMORY[0x1E0C80C00];
  objc_msgSend((id)objc_opt_class(), "_readTokenAtPath:allowNotExists:error:", a1[5], 1, 0);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = *(_QWORD *)(a1[6] + 8);
  v3 = *(void **)(v2 + 40);
  *(_QWORD *)(v2 + 40) = v1;

  objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectForKeyedSubscript:", CFSTR("InProgressCounter"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(a1[7] + 8) + 24) = objc_msgSend(v4, "intValue") + 1;

  v30[0] = CFSTR("Date");
  PLCompleteDateFormatter();
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringFromDate:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v31[0] = v6;
  v30[1] = CFSTR("Build");
  objc_msgSend(MEMORY[0x1E0D73188], "currentBuildVersionString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31[1] = v7;
  v30[2] = CFSTR("Process");
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "processName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v31[2] = v9;
  v30[3] = CFSTR("PID");
  v10 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "numberWithInt:", objc_msgSend(v11, "processIdentifier"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31[3] = v12;
  v30[4] = CFSTR("InProgressCounter");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *(unsigned int *)(*(_QWORD *)(a1[7] + 8) + 24));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v31[4] = v13;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v31, v30, 5);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "count"))
  {
    v14 = v24;
    v15 = (void *)objc_msgSend(v24, "mutableCopy");
    v16 = (void *)objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "mutableCopy");
    objc_msgSend(v16, "removeObjectForKey:", CFSTR("History"));
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 40), "objectForKeyedSubscript:", CFSTR("History"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "count"))
      objc_msgSend(v17, "addObjectsFromArray:", v18);
    objc_msgSend(v17, "addObject:", v16, v24);
    objc_msgSend(v15, "setObject:forKeyedSubscript:", v17, CFSTR("History"));

  }
  else
  {
    v15 = v24;
  }
  v19 = (void *)objc_opt_class();
  v20 = a1[5];
  v27 = 0;
  v21 = objc_msgSend(v19, "_writeTokenToPath:withInfo:allowOverwrite:error:", v20, v15, 1, &v27);
  v22 = v27;
  *(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24) = v21;
  if (!*(_BYTE *)(*(_QWORD *)(a1[8] + 8) + 24))
  {
    PLMigrationGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v22;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Failed to write BackgroundPhaseInProgressToken %@", buf, 0xCu);
    }

  }
}

void __102__PLDeviceRestoreMigrationPostProcessingSupport_isBackgroundRestorePostProcessingInProgressTokenValid__block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = (void *)objc_opt_class();
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "cloudRestoreBackgroundPhaseInProgressTokenPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_readTokenAtPath:allowNotExists:error:", v3, 1, 0);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v4 = v6;
  if (v6)
  {
    objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("InProgressCounter"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (int)objc_msgSend(v5, "intValue") < 11;

    v4 = v6;
  }

}

void __83__PLDeviceRestoreMigrationPostProcessingSupport_needsToPrepareForBackgroundRestore__block_invoke(_QWORD *a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v2, "fileExistsAtPath:isDirectory:", a1[4], 0) & 1) == 0)
    *(_BYTE *)(*(_QWORD *)(a1[6] + 8) + 24) = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", a1[5], 0);

}

void __100__PLDeviceRestoreMigrationPostProcessingSupport_foregroundRestoreFromCloudBackupCompleteTokenExists__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "fileExistsAtPath:isDirectory:", *(_QWORD *)(a1 + 32), 0);

}

+ (BOOL)createForegroundRestoreFromCloudBackupCompleteTokenWithPathManager:(id)a3 error:(id *)a4
{
  void *v4;
  void *v5;
  int v6;
  NSObject *v7;
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
  char v19;
  id v20;
  NSObject *v21;
  id v25;
  _QWORD v26[4];
  _QWORD v27[4];
  uint8_t buf[4];
  id v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "cloudRestoreForegroundPhaseCompleteTokenPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "fileExistsAtPath:isDirectory:", v4, 0);

  if (v6)
  {
    PLMigrationGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v29 = v8;
      _os_log_impl(&dword_199541000, v7, OS_LOG_TYPE_FAULT, "Foreground restore token already exists!  Should only be possible if MobileSlideShow datamigrator plugin has run twice: %{public}@", buf, 0xCu);

    }
  }
  v26[0] = CFSTR("Date");
  PLCompleteDateFormatter();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringFromDate:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v11;
  v26[1] = CFSTR("Build");
  objc_msgSend(MEMORY[0x1E0D73188], "currentBuildVersionString");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27[1] = v12;
  v26[2] = CFSTR("Process");
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "processName");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v27[2] = v14;
  v26[3] = CFSTR("PID");
  v15 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "numberWithInt:", objc_msgSend(v16, "processIdentifier"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v27[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v27, v26, 4);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0;
  v19 = objc_msgSend(a1, "_writeTokenToPath:withInfo:allowOverwrite:error:", v4, v18, 1, &v25);
  v20 = v25;
  if ((v19 & 1) == 0)
  {
    PLMigrationGetLog();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v29 = v20;
      _os_log_impl(&dword_199541000, v21, OS_LOG_TYPE_ERROR, "Failed to write ForegroundRestoreFromCloudBackupCompleteToken %@", buf, 0xCu);
    }

    if (a4)
      *a4 = objc_retainAutorelease(v20);
  }

  return v19;
}

+ (id)_readTokenAtPath:(id)a3 allowNotExists:(BOOL)a4 error:(id *)a5
{
  _BOOL4 v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  id v17;
  id v18;
  uint8_t buf[4];
  id v20;
  __int16 v21;
  id v22;
  uint64_t v23;

  v6 = a4;
  v23 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v18 = 0;
  objc_msgSend(MEMORY[0x1E0C99D50], "dataWithContentsOfFile:options:error:", v7, 0, &v18);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v18;
  if (!objc_msgSend(v8, "length"))
  {
    if (v6
      && (PLUnderlyingPOSIXError(),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "code"),
          v13,
          v14 == 2))
    {
      v10 = (void *)MEMORY[0x1E0C9AA70];
    }
    else
    {
      PLMigrationGetLog();
      v15 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v20 = v7;
        v21 = 2112;
        v22 = v9;
        _os_log_impl(&dword_199541000, v15, OS_LOG_TYPE_ERROR, "Failed to read data for token %{public}@: %@", buf, 0x16u);
      }

      if (a5)
      {
        v11 = v9;
        goto LABEL_14;
      }
      v10 = 0;
    }
    v11 = v9;
    goto LABEL_17;
  }
  v17 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v8, 0, 0, &v17);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v17;

  if (!v10)
  {
    PLMigrationGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v20 = v7;
      v21 = 2112;
      v22 = v11;
      _os_log_impl(&dword_199541000, v12, OS_LOG_TYPE_ERROR, "Failed to extract info from token data %{public}@: %@", buf, 0x16u);
    }

    if (!a5)
    {
      v10 = 0;
      goto LABEL_17;
    }
LABEL_14:
    v11 = objc_retainAutorelease(v11);
    v10 = 0;
    *a5 = v11;
  }
LABEL_17:

  return v10;
}

+ (BOOL)_writeTokenToPath:(id)a3 withInfo:(id)a4 allowOverwrite:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v7;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  NSObject *v14;
  void *v15;
  void *v16;
  id v17;
  uint64_t v18;
  int v19;
  id v20;
  char v21;
  id v22;
  NSObject *v23;
  BOOL v24;
  NSObject *v25;
  void *v26;
  NSObject *v27;
  id v29;
  id v30;
  id v31;
  id v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  id v36;
  __int16 v37;
  id v38;
  uint64_t v39;

  v7 = a5;
  v39 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = (void *)MEMORY[0x1E0D73208];
  objc_msgSend(v9, "stringByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  LOBYTE(v11) = objc_msgSend(v11, "createDirectoryAtPath:error:", v12, &v32);
  v13 = v32;

  if ((v11 & 1) == 0)
  {
    PLMigrationGetLog();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      objc_msgSend(v9, "stringByDeletingLastPathComponent");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v34 = v15;
      v35 = 2112;
      v36 = v13;
      _os_log_impl(&dword_199541000, v14, OS_LOG_TYPE_ERROR, "Failed to create post processing token directory: %{public}@ %@", buf, 0x16u);

    }
  }
  v31 = 0;
  objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v10, 100, 0, &v31);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = v31;

  if (!v16)
  {
    PLMigrationGetLog();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v34 = v9;
      v35 = 2114;
      v36 = v10;
      v37 = 2112;
      v38 = v17;
      _os_log_impl(&dword_199541000, v27, OS_LOG_TYPE_ERROR, "Failed to encode data for token %{public}@ with info %{public}@: %@", buf, 0x20u);
    }

    if (a6)
    {
      v26 = v17;
LABEL_23:
      v20 = objc_retainAutorelease(v26);
      v24 = 0;
      *a6 = v20;
      goto LABEL_25;
    }
  }
  if (v7)
    v18 = 0x40000000;
  else
    v18 = 1073741826;
  v30 = v17;
  v19 = objc_msgSend(v16, "writeToFile:options:error:", v9, v18, &v30);
  v20 = v30;

  if (!v19)
  {
    PLMigrationGetLog();
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v34 = v9;
      v35 = 2114;
      v36 = v10;
      v37 = 2112;
      v38 = v20;
      _os_log_impl(&dword_199541000, v25, OS_LOG_TYPE_ERROR, "Failed to write token %{public}@ with info %{public}@: %@", buf, 0x20u);
    }

    if (!a6)
    {
      v24 = 0;
      goto LABEL_25;
    }
    v26 = v20;
    goto LABEL_23;
  }
  v29 = 0;
  v21 = objc_msgSend(MEMORY[0x1E0D73208], "changeFileOwnerToMobileAtPath:error:", v9, &v29);
  v22 = v29;
  if ((v21 & 1) == 0)
  {
    PLMigrationGetLog();
    v23 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v34 = v9;
      _os_log_impl(&dword_199541000, v23, OS_LOG_TYPE_ERROR, "Failed to chown token file %{public}@ to mobile", buf, 0xCu);
    }

  }
  v24 = 1;
LABEL_25:

  return v24;
}

@end
