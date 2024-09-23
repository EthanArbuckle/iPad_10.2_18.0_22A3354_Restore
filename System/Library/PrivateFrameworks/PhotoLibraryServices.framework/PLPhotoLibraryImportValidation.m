@implementation PLPhotoLibraryImportValidation

- (PLPhotoLibraryImportValidation)initWithLibraryManager:(id)a3
{
  id v6;
  PLPhotoLibraryImportValidation *v7;
  PLPhotoLibraryImportValidation *v8;
  uint64_t v9;
  NSFileManager *fm;
  uint64_t v11;
  PLPhotoLibraryPathManager *pm;
  void *v14;
  objc_super v15;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PLPhotoLibraryImportValidation.m"), 32, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("manager"));

  }
  v15.receiver = self;
  v15.super_class = (Class)PLPhotoLibraryImportValidation;
  v7 = -[PLPhotoLibraryImportValidation init](&v15, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_libraryServicesManager, a3);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = objc_claimAutoreleasedReturnValue();
    fm = v8->_fm;
    v8->_fm = (NSFileManager *)v9;

    -[PLLibraryServicesManager pathManager](v8->_libraryServicesManager, "pathManager");
    v11 = objc_claimAutoreleasedReturnValue();
    pm = v8->_pm;
    v8->_pm = (PLPhotoLibraryPathManager *)v11;

  }
  return v8;
}

- (BOOL)isLibraryValidForImportWithError:(id *)a3
{
  void *v4;
  NSObject *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 72002, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  PLBackendGetLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v7 = 138412290;
    v8 = v4;
    _os_log_impl(&dword_199541000, v5, OS_LOG_TYPE_ERROR, "[ImportLibraryValidation] Library is invalid for import. Error: %@", (uint8_t *)&v7, 0xCu);
  }

  if (a3)
    *a3 = objc_retainAutorelease(v4);

  return 0;
}

- (BOOL)checkLibraryCPLStatusWithError:(id *)a3
{
  void *v5;
  int v6;
  void *v7;
  BOOL v8;
  NSFileManager *fm;
  void *v10;
  _BOOL4 v11;
  _BOOL4 v12;
  char v14;

  -[PLPhotoLibraryPathManager libraryURL](self->_pm, "libraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PLIsCloudPhotoLibraryEnabledForPhotoLibraryURL(v5);

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 72006, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 0;
    if (!a3)
      goto LABEL_12;
    goto LABEL_11;
  }
  v14 = 0;
  fm = self->_fm;
  -[PLPhotoLibraryPathManager disableICloudPhotosFilePath](self->_pm, "disableICloudPhotosFilePath");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = -[NSFileManager fileExistsAtPath:isDirectory:](fm, "fileExistsAtPath:isDirectory:", v10, &v14);
  if (v14)
    v12 = 0;
  else
    v12 = v11;

  if (v12)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 72007, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  v8 = !v12;
  if (a3)
LABEL_11:
    *a3 = objc_retainAutorelease(v7);
LABEL_12:

  return v8;
}

- (BOOL)checkLibraryVersionStatusWithError:(id *)a3
{
  NSFileManager *fm;
  void *v6;
  int v7;
  BOOL v8;
  BOOL v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v15;
  void *v16;
  void *v17;
  unsigned __int8 v18;

  v18 = 0;
  fm = self->_fm;
  -[PLPhotoLibraryPathManager photosDatabasePath](self->_pm, "photosDatabasePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(fm) = -[NSFileManager fileExistsAtPath:isDirectory:](fm, "fileExistsAtPath:isDirectory:", v6, &v18);
  v7 = v18;

  if ((_DWORD)fm)
    v8 = v7 == 0;
  else
    v8 = 0;
  if (v8)
  {
    -[PLLibraryServicesManager modelMigrator](self->_libraryServicesManager, "modelMigrator");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "legacyMigrationState");

    switch(v12)
    {
      case 0:
        objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 72001, 0);
        v13 = (id)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
      case 3:
      case 4:
        v17 = 0;
        v9 = -[PLPhotoLibraryImportValidation checkLegacyLibraryVersionStatusWithError:](self, "checkLegacyLibraryVersionStatusWithError:", &v17);
        v10 = v17;
        goto LABEL_13;
      case 2:
        v16 = 0;
        v9 = -[PLPhotoLibraryImportValidation checkLegacyLibraryRequiresRepairWithError:](self, "checkLegacyLibraryRequiresRepairWithError:", &v16);
        v10 = v16;
        goto LABEL_13;
      default:
        v13 = 0;
        break;
    }
    v9 = 0;
    if (a3)
      goto LABEL_14;
  }
  else
  {
    v15 = 0;
    v9 = -[PLPhotoLibraryImportValidation checkLegacyLibraryVersionStatusWithError:](self, "checkLegacyLibraryVersionStatusWithError:", &v15);
    v10 = v15;
LABEL_13:
    v13 = v10;
    if (a3)
LABEL_14:
      *a3 = objc_retainAutorelease(v13);
  }

  return v9;
}

- (BOOL)checkLegacyLibraryVersionStatusWithError:(id *)a3
{
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  uint64_t v23;
  uint64_t *v24;
  void *v25;
  id *v26;
  BOOL v27;
  id obj;
  _QWORD v30[5];
  _QWORD v31[5];
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  uint64_t v39;
  const __CFString *v40;
  uint8_t buf[4];
  uint64_t v42;
  uint64_t v43;
  _QWORD v44[2];

  v44[1] = *MEMORY[0x1E0C80C00];
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy__94165;
  v37 = __Block_byref_object_dispose__94166;
  v38 = 0;
  -[PLPhotoLibraryPathManager libraryURL](self->_pm, "libraryURL");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v5, "bookmarkDataWithOptions:includingResourceValuesForKeys:relativeToURL:error:", 0, 0, 0, &v32);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v32;

  if (v6)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.Photos.Migration"));
    objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE44D5F0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject setRemoteObjectInterface:](v8, "setRemoteObjectInterface:", v9);

    -[NSObject resume](v8, "resume");
    v10 = MEMORY[0x1E0C809B0];
    v31[0] = MEMORY[0x1E0C809B0];
    v31[1] = 3221225472;
    v31[2] = __75__PLPhotoLibraryImportValidation_checkLegacyLibraryVersionStatusWithError___block_invoke;
    v31[3] = &unk_1E36767E0;
    v31[4] = &v33;
    -[NSObject synchronousRemoteObjectProxyWithErrorHandler:](v8, "synchronousRemoteObjectProxyWithErrorHandler:", v31);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v11)
    {
      v30[0] = v10;
      v30[1] = 3221225472;
      v30[2] = __75__PLPhotoLibraryImportValidation_checkLegacyLibraryVersionStatusWithError___block_invoke_68;
      v30[3] = &unk_1E3675918;
      v30[4] = &v33;
      objc_msgSend(v11, "getMigrationStateForLibraryBookmark:withReply:", v6, v30);
    }
    else
    {
      v18 = (void *)MEMORY[0x1E0CB35C8];
      v43 = *MEMORY[0x1E0CB2D50];
      v44[0] = CFSTR("Failed to establish connection to the migration service");
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v44, &v43, 1);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 72008, v19);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = (void *)v34[5];
      v34[5] = v20;

      PLBackendGetLog();
      v22 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
      {
        v23 = v34[5];
        *(_DWORD *)buf = 138543362;
        v42 = v23;
        _os_log_impl(&dword_199541000, v22, OS_LOG_TYPE_ERROR, "[ImportLibraryValidation] Processing error: %{public}@", buf, 0xCu);
      }

    }
    -[NSObject invalidate](v8, "invalidate");

  }
  else
  {
    v13 = (void *)MEMORY[0x1E0CB35C8];
    v39 = *MEMORY[0x1E0CB2D50];
    v40 = CFSTR("Missing bookmark data");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v40, &v39, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0D74498], 72008, v14);
    v15 = objc_claimAutoreleasedReturnValue();
    v16 = (void *)v34[5];
    v34[5] = v15;

    PLBackendGetLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      v17 = v34[5];
      *(_DWORD *)buf = 138543362;
      v42 = v17;
      _os_log_impl(&dword_199541000, v8, OS_LOG_TYPE_ERROR, "[ImportLibraryValidation] Processing error: %{public}@", buf, 0xCu);
    }
  }

  v24 = v34;
  v26 = (id *)(v34 + 5);
  v25 = (void *)v34[5];
  if (v25)
  {
    if (!a3)
      goto LABEL_15;
    goto LABEL_14;
  }
  obj = 0;
  -[PLPhotoLibraryImportValidation checkLegacyLibraryRequiresRepairWithError:](self, "checkLegacyLibraryRequiresRepairWithError:", &obj);
  objc_storeStrong(v26, obj);
  v24 = v34;
  v25 = (void *)v34[5];
  if (a3)
  {
LABEL_14:
    *a3 = objc_retainAutorelease(v25);
    v24 = v34;
  }
LABEL_15:
  v27 = v24[5] == 0;

  _Block_object_dispose(&v33, 8);
  return v27;
}

- (BOOL)checkLegacyLibraryRequiresRepairWithError:(id *)a3
{
  if (a3)
    *a3 = 0;
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pm, 0);
  objc_storeStrong((id *)&self->_fm, 0);
  objc_storeStrong((id *)&self->_libraryServicesManager, 0);
}

void __75__PLPhotoLibraryImportValidation_checkLegacyLibraryVersionStatusWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  int v13;
  uint64_t v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = (void *)MEMORY[0x1E0CB35C8];
  v6 = *MEMORY[0x1E0D74498];
  if (v3)
  {
    v15 = *MEMORY[0x1E0CB3388];
    v16[0] = v3;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(v5, "errorWithDomain:code:userInfo:", v6, 72008, v7);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v10 = *(void **)(v9 + 40);
  *(_QWORD *)(v9 + 40) = v8;

  if (v4)
  PLBackendGetLog();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
  {
    v12 = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40);
    v13 = 138543362;
    v14 = v12;
    _os_log_impl(&dword_199541000, v11, OS_LOG_TYPE_ERROR, "[ImportLibraryValidation] Error detected connecting to the service. Error: %{public}@", (uint8_t *)&v13, 0xCu);
  }

}

void __75__PLPhotoLibraryImportValidation_checkLegacyLibraryVersionStatusWithError___block_invoke_68(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  id v21;
  uint64_t v22;
  _QWORD v23[2];

  v23[1] = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = v5;
  if ((unint64_t)(a2 - 1) < 3)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D74498];
    if (v5)
    {
      v20 = *MEMORY[0x1E0CB3388];
      v21 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v21, &v20, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v12 = 72003;
LABEL_14:
    v13 = v7;
    v14 = v8;
    goto LABEL_15;
  }
  if (a2 == 5)
  {
    v7 = (void *)MEMORY[0x1E0CB35C8];
    v8 = *MEMORY[0x1E0D74498];
    if (v5)
    {
      v18 = *MEMORY[0x1E0CB3388];
      v19 = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v19, &v18, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    v12 = 72009;
    goto LABEL_14;
  }
  if (a2)
    goto LABEL_17;
  v10 = (void *)MEMORY[0x1E0CB35C8];
  v11 = *MEMORY[0x1E0D74498];
  if (v5)
  {
    v22 = *MEMORY[0x1E0CB3388];
    v23[0] = v5;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, &v22, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }
  v13 = v10;
  v14 = v11;
  v12 = 72001;
LABEL_15:
  objc_msgSend(v13, "errorWithDomain:code:userInfo:", v14, v12, v9);
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v17 = *(void **)(v16 + 40);
  *(_QWORD *)(v16 + 40) = v15;

  if (v6)
LABEL_17:

}

@end
