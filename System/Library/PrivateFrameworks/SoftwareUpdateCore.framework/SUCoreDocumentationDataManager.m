@implementation SUCoreDocumentationDataManager

- (SUCoreDocumentationDataManager)init
{
  return -[SUCoreDocumentationDataManager initWithStashPath:](self, "initWithStashPath:", CFSTR("/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore/Documentation"));
}

- (SUCoreDocumentationDataManager)initWithStashPath:(id)a3
{
  __CFString *v4;
  SUCoreDocumentationDataManager *v5;
  NSObject *v6;
  dispatch_queue_t v7;
  OS_dispatch_queue *stateQueue;
  __CFString *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  objc_super v14;
  uint8_t buf[4];
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v14.receiver = self;
  v14.super_class = (Class)SUCoreDocumentationDataManager;
  v5 = -[SUCoreDocumentationDataManager init](&v14, sel_init);
  if (v5)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = dispatch_queue_create("com.apple.su.installedDocManager", v6);
    stateQueue = v5->_stateQueue;
    v5->_stateQueue = (OS_dispatch_queue *)v7;

    if (v4)
      v9 = v4;
    else
      v9 = CFSTR("/var/MobileSoftwareUpdate/Controller/SoftwareUpdateCore/Documentation");
    objc_storeStrong((id *)&v5->_documentationPath, v9);
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "oslog");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreDocumentationDataManager documentationPath](v5, "documentationPath");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v16 = v12;
    _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Created SUCoreDocumentationDataManager with stash path: %{public}@", buf, 0xCu);

  }
  return v5;
}

+ (id)sharedManager
{
  return +[SUCoreDocumentationDataManager _sharedManagerInitWithPath:](SUCoreDocumentationDataManager, "_sharedManagerInitWithPath:", 0);
}

+ (void)setupSharedManagerWithStashPath:(id)a3
{
  id v3;

  v3 = +[SUCoreDocumentationDataManager _sharedManagerInitWithPath:](SUCoreDocumentationDataManager, "_sharedManagerInitWithPath:", a3);
}

+ (id)_sharedManagerInitWithPath:(id)a3
{
  id v3;
  uint64_t v4;
  id v5;
  id v6;
  _QWORD block[4];
  id v9;

  v3 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __61__SUCoreDocumentationDataManager__sharedManagerInitWithPath___block_invoke;
  block[3] = &unk_1EA877EF8;
  v9 = v3;
  v4 = _sharedManagerInitWithPath__onceDocumentationDataManager;
  v5 = v3;
  if (v4 != -1)
    dispatch_once(&_sharedManagerInitWithPath__onceDocumentationDataManager, block);
  v6 = (id)_sharedManagerInitWithPath____dataManager;

  return v6;
}

void __61__SUCoreDocumentationDataManager__sharedManagerInitWithPath___block_invoke(uint64_t a1)
{
  SUCoreDocumentationDataManager *v1;
  void *v2;

  v1 = -[SUCoreDocumentationDataManager initWithStashPath:]([SUCoreDocumentationDataManager alloc], "initWithStashPath:", *(_QWORD *)(a1 + 32));
  v2 = (void *)_sharedManagerInitWithPath____dataManager;
  _sharedManagerInitWithPath____dataManager = (uint64_t)v1;

}

- (BOOL)stashDocumentationAssetData:(id)a3 forBuildVersion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSObject *stateQueue;
  id v11;
  id v12;
  char v13;
  _QWORD block[5];
  id v16;
  id v17;
  uint64_t *v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t (*v23)(uint64_t, uint64_t);
  void (*v24)(uint64_t);
  id v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  char v29;

  v8 = a3;
  v9 = a4;
  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v20 = 0;
  v21 = &v20;
  v22 = 0x3032000000;
  v23 = __Block_byref_object_copy__7;
  v24 = __Block_byref_object_dispose__7;
  v25 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  if (a5)
    *a5 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __84__SUCoreDocumentationDataManager_stashDocumentationAssetData_forBuildVersion_error___block_invoke;
  block[3] = &unk_1EA8795B8;
  v18 = &v26;
  block[4] = self;
  v11 = v8;
  v16 = v11;
  v12 = v9;
  v17 = v12;
  v19 = &v20;
  dispatch_sync(stateQueue, block);
  if (a5)
    *a5 = objc_retainAutorelease((id)v21[5]);
  v13 = *((_BYTE *)v27 + 24);

  _Block_object_dispose(&v20, 8);
  _Block_object_dispose(&v26, 8);

  return v13;
}

void __84__SUCoreDocumentationDataManager_stashDocumentationAssetData_forBuildVersion_error___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  char v6;
  id obj;

  v2 = (void *)a1[4];
  v3 = a1[5];
  v4 = a1[6];
  v5 = *(_QWORD *)(a1[8] + 8);
  obj = *(id *)(v5 + 40);
  v6 = objc_msgSend(v2, "queue_stashDocumentationAssetData:forBuildVersion:error:", v3, v4, &obj);
  objc_storeStrong((id *)(v5 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[7] + 8) + 24) = v6;
}

- (id)getDocumentationDataForInstalledUpdateType:(unint64_t)a3 withError:(id *)a4
{
  NSObject *stateQueue;
  id v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  v16 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  if (a4)
    *a4 = 0;
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __87__SUCoreDocumentationDataManager_getDocumentationDataForInstalledUpdateType_withError___block_invoke;
  v10[3] = &unk_1EA8795E0;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  v10[7] = a3;
  dispatch_sync(stateQueue, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __87__SUCoreDocumentationDataManager_getDocumentationDataForInstalledUpdateType_withError___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id obj;

  v1 = (void *)a1[4];
  v2 = *(_QWORD *)(a1[5] + 8);
  v3 = *(void **)(v2 + 40);
  v4 = a1[7];
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(id *)(v5 + 40);
  obj = v3;
  objc_msgSend(v1, "queue_getDocumentation:documentationData:forInstalledUpdateType:withError:", 0, &obj, v4, &v6);
  objc_storeStrong((id *)(v2 + 40), obj);
  objc_storeStrong((id *)(v5 + 40), v6);
}

- (id)getDocumentationForInstalledUpdateType:(unint64_t)a3 withError:(id *)a4
{
  NSObject *stateQueue;
  id v8;
  _QWORD v10[8];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__7;
  v21 = __Block_byref_object_dispose__7;
  v22 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__7;
  v15 = __Block_byref_object_dispose__7;
  v16 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  if (a4)
    *a4 = 0;
  stateQueue = self->_stateQueue;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __83__SUCoreDocumentationDataManager_getDocumentationForInstalledUpdateType_withError___block_invoke;
  v10[3] = &unk_1EA8795E0;
  v10[4] = self;
  v10[5] = &v11;
  v10[6] = &v17;
  v10[7] = a3;
  dispatch_sync(stateQueue, v10);
  if (a4)
    *a4 = objc_retainAutorelease((id)v18[5]);
  v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  _Block_object_dispose(&v17, 8);
  return v8;
}

void __83__SUCoreDocumentationDataManager_getDocumentationForInstalledUpdateType_withError___block_invoke(_QWORD *a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  id obj;

  v1 = (void *)a1[4];
  v2 = *(_QWORD *)(a1[5] + 8);
  v3 = *(void **)(v2 + 40);
  v4 = a1[7];
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(id *)(v5 + 40);
  obj = v3;
  objc_msgSend(v1, "queue_getDocumentation:documentationData:forInstalledUpdateType:withError:", &obj, 0, v4, &v6);
  objc_storeStrong((id *)(v2 + 40), obj);
  objc_storeStrong((id *)(v5 + 40), v6);
}

- (BOOL)cleanupNonInstalledDocumentationWithError:(id *)a3
{
  NSObject *stateQueue;
  char v6;
  _QWORD block[7];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy__7;
  v13 = __Block_byref_object_dispose__7;
  v14 = 0;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  if (a3)
    *a3 = 0;
  stateQueue = self->_stateQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __76__SUCoreDocumentationDataManager_cleanupNonInstalledDocumentationWithError___block_invoke;
  block[3] = &unk_1EA878BA8;
  block[4] = self;
  block[5] = &v15;
  block[6] = &v9;
  dispatch_sync(stateQueue, block);
  if (a3)
    *a3 = objc_retainAutorelease((id)v10[5]);
  v6 = *((_BYTE *)v16 + 24);
  _Block_object_dispose(&v9, 8);

  _Block_object_dispose(&v15, 8);
  return v6;
}

void __76__SUCoreDocumentationDataManager_cleanupNonInstalledDocumentationWithError___block_invoke(_QWORD *a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id obj;

  v2 = (void *)a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  v4 = objc_msgSend(v2, "queue_cleanupNonInstalledDocumentationWithError:", &obj);
  objc_storeStrong((id *)(v3 + 40), obj);
  *(_BYTE *)(*(_QWORD *)(a1[5] + 8) + 24) = v4;
}

- (BOOL)queue_stashDocumentationAssetData:(id)a3 forBuildVersion:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  void *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  NSObject *v19;
  id v20;
  char v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  id v26;
  BOOL v27;
  id v28;
  void *v29;
  NSObject *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  char v37;
  id v38;
  void *v39;
  void *v40;
  void *v41;
  uint64_t v42;
  void *v43;
  void *v44;
  NSObject *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  uint64_t v51;
  void *v53;
  id v54;
  id v55;
  id v56;
  uint8_t buf[4];
  id v58;
  __int16 v59;
  id v60;
  __int16 v61;
  void *v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a5)
    *a5 = 0;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "oslog");
  v11 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v58 = v8;
    v59 = 2114;
    v60 = v9;
    _os_log_impl(&dword_1DDFDD000, v11, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Stashing documentation asset: %{public}@ for build version: %{public}@", buf, 0x16u);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v12)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = CFSTR("Failed to create NSFileManager");
    v24 = 9000;
LABEL_13:
    objc_msgSend(v22, "buildAndLogCheckedSUCoreError:underlying:description:", v24, 0, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v25;
    if (!a5)
    {
      v21 = 0;
      v15 = 0;
      goto LABEL_33;
    }
    v26 = objc_retainAutorelease(v25);
    v20 = v26;
    v21 = 0;
    v15 = 0;
LABEL_32:
    *a5 = v26;
    goto LABEL_33;
  }
  v13 = (void *)MEMORY[0x1E0C99E98];
  -[SUCoreDocumentationDataManager stashedDataDirectoryForBuildVersion:](self, "stashedDataDirectoryForBuildVersion:", v9);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "fileURLWithPath:", v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v15)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = CFSTR("Failed to create stashURL");
    v24 = 9004;
    goto LABEL_13;
  }
  objc_msgSend(v15, "path");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v12, "fileExistsAtPath:", v16);

  if (v17)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "oslog");
    v19 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v58 = v9;
      _os_log_impl(&dword_1DDFDD000, v19, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Documentation data already stashed for build version %@", buf, 0xCu);
    }

    v20 = 0;
    v21 = 1;
    goto LABEL_33;
  }
  v56 = 0;
  v27 = -[SUCoreDocumentationDataManager queue_evictStashIfNecessary:](self, "queue_evictStashIfNecessary:", &v56);
  v28 = v56;
  if (!v27)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "oslog");
    v30 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
      -[SUCoreDocumentationDataManager queue_stashDocumentationAssetData:forBuildVersion:error:].cold.1((uint64_t)v28, v30, v31, v32, v33, v34, v35, v36);

  }
  if ((objc_msgSend(v8, "refreshState") & 1) == 0)
  {
    v49 = (void *)MEMORY[0x1E0CB35C8];
    v50 = CFSTR("Failed to refresh documentation asset");
    v51 = 9011;
    goto LABEL_30;
  }
  if ((objc_msgSend(v8, "wasLocal") & 1) == 0)
  {
    v49 = (void *)MEMORY[0x1E0CB35C8];
    v50 = CFSTR("Documentation asset is not local");
    v51 = 9012;
LABEL_30:
    objc_msgSend(v49, "buildAndLogCheckedSUCoreError:underlying:description:", v51, v28, v50);
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!a5)
    {
LABEL_35:
      v21 = 0;
      goto LABEL_33;
    }
    goto LABEL_31;
  }
  v55 = v28;
  v37 = objc_msgSend(v12, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v15, 1, 0, &v55);
  v38 = v55;

  if ((v37 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "buildAndLogCheckedSUCoreError:underlying:description:", 9004, v38, CFSTR("Failed to create documentation data stash directory"));
    v20 = (id)objc_claimAutoreleasedReturnValue();

    if (!a5)
      goto LABEL_35;
LABEL_31:
    v26 = objc_retainAutorelease(v20);
    v20 = v26;
    v21 = 0;
    goto LABEL_32;
  }
  objc_msgSend(v8, "getLocalUrl");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "URLByDeletingLastPathComponent");
  v40 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v40, "lastPathComponent");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "URLByAppendingPathComponent:", v41);
  v42 = objc_claimAutoreleasedReturnValue();

  v43 = (void *)v42;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "oslog");
  v45 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v58 = v9;
    v59 = 2114;
    v60 = v40;
    v61 = 2114;
    v62 = v43;
    _os_log_impl(&dword_1DDFDD000, v45, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Copying documentation asset for %{public}@ from %{public}@ to %{public}@", buf, 0x20u);
  }

  v54 = v38;
  v21 = objc_msgSend(v12, "copyItemAtURL:toURL:error:", v40, v43, &v54);
  v20 = v54;

  if ((v21 & 1) == 0)
  {
    v46 = (void *)MEMORY[0x1E0CB35C8];
    v53 = v43;
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to copy from \"%@\" to \"%@\"), 0, v15);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "buildAndLogCheckedSUCoreError:underlying:description:", 9002, v20, v47);
    v48 = (void *)objc_claimAutoreleasedReturnValue();

    if (a5)
    {
      v20 = objc_retainAutorelease(v48);
      *a5 = v20;
    }
    else
    {
      v20 = v48;
    }
    v43 = v53;
  }

LABEL_33:
  return v21;
}

- (BOOL)queue_getDocumentation:(id *)a3 documentationData:(id *)a4 forInstalledUpdateType:(unint64_t)a5 withError:(id *)a6
{
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  void *v15;
  void *v16;
  void *v17;
  SUCoreDocumentation *v18;
  SUCoreDocumentationData *v19;
  uint64_t v20;
  SUCoreDocumentation *v21;
  SUCoreDocumentationData *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SUCoreDocumentation *v31;
  SUCoreDocumentationData *v32;
  void *v33;
  NSObject *v34;
  id v35;
  id v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  id v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  char v51;
  id v52;
  void *v53;
  void *v54;
  id v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  NSObject *v64;
  id v65;
  BOOL v66;
  BOOL v67;
  void *v68;
  NSObject *v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  id v80;
  id *v81;
  id *v82;
  void *v83;
  uint64_t v84;
  uint64_t v85;
  id obj;
  SUCoreDocumentationData *v87;
  uint64_t v88;
  uint64_t v89;
  void *v91;
  SUCoreDocumentationData *v92;
  id v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  uint8_t buf[4];
  SUCoreDocumentation *v99;
  __int16 v100;
  SUCoreDocumentationData *v101;
  _QWORD v102[3];
  _QWORD v103[3];
  _BYTE v104[128];
  uint64_t v105;

  v105 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a3)
    *a3 = 0;
  if (a4)
    *a4 = 0;
  v82 = a4;
  if (a6)
    *a6 = 0;
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (a5 == 1)
  {
    if (objc_msgSend(v10, "hasSplatOnlyUpdateInstalled"))
    {

    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "hasSemiSplatActive");

      if ((v14 & 1) == 0)
      {
        objc_msgSend(MEMORY[0x1E0CB35C8], "buildAndLogCheckedSUCoreError:underlying:description:", 9009, 0, CFSTR("Splat update not installed. No documentation data found for splat update"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        v65 = v78;
        if (a6)
        {
          v65 = objc_retainAutorelease(v78);
          v67 = 0;
          *a6 = v65;
        }
        else
        {
          v67 = 0;
        }
        goto LABEL_52;
      }
    }
    objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "splatCryptex1BuildVersion");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v10, "buildVersion");
    v12 = objc_claimAutoreleasedReturnValue();
  }
  v15 = (void *)v12;

  -[SUCoreDocumentationDataManager stashedDataDirectoryForBuildVersion:](self, "stashedDataDirectoryForBuildVersion:", v15);
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  if (v91)
  {
    v81 = a3;
    v83 = v15;
    v96 = 0u;
    v97 = 0u;
    v94 = 0u;
    v95 = 0u;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v93 = 0;
    objc_msgSend(v16, "contentsOfDirectoryAtPath:error:", v91, &v93);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v80 = v93;

    obj = v17;
    v89 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
    v18 = 0;
    v19 = 0;
    if (!v89)
      goto LABEL_31;
    v88 = *(_QWORD *)v95;
    v84 = *MEMORY[0x1E0DA89C8];
    v85 = *MEMORY[0x1E0DA8A10];
    while (1)
    {
      v20 = 0;
      v21 = v18;
      v22 = v19;
      do
      {
        if (*(_QWORD *)v95 != v88)
          objc_enumerationMutation(obj);
        v23 = *(_QWORD *)(*((_QWORD *)&v94 + 1) + 8 * v20);
        v24 = (void *)MEMORY[0x1E0C99E98];
        v103[0] = v91;
        v103[1] = v23;
        v103[2] = CFSTR("AssetData");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v103, 3);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "fileURLWithPathComponents:", v25);
        v26 = objc_claimAutoreleasedReturnValue();

        v27 = (void *)MEMORY[0x1E0C99E98];
        v102[0] = v91;
        v102[1] = v23;
        v102[2] = CFSTR("Info.plist");
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v102, 3);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "fileURLWithPathComponents:", v28);
        v29 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v29);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v31 = (SUCoreDocumentation *)v26;
        objc_msgSend(v30, "safeObjectForKey:ofClass:", CFSTR("MobileAssetProperties"), objc_opt_class());
        v32 = (SUCoreDocumentationData *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "oslog");
        v34 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v99 = v31;
          v100 = 2114;
          v101 = v32;
          _os_log_impl(&dword_1DDFDD000, v34, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Initializing documentation with assetBundleURL: %{public}@, assetAttributes: %{public}@", buf, 0x16u);
        }

        v18 = -[SUCoreDocumentation initWithLocalBundleURL:attributes:]([SUCoreDocumentation alloc], "initWithLocalBundleURL:attributes:", v31, v32);
        v35 = -[SUCoreDocumentation extendDocumentationProperties](v18, "extendDocumentationProperties");
        if (a5 == 1)
        {
          v36 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[SUCoreDocumentation humanReadableUpdateName](v18, "humanReadableUpdateName");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
          v87 = v32;
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v38, "splatCryptex1ProductVersion");
          v39 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
          v92 = v22;
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "splatCryptex1ProductVersionExtra");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          v42 = (void *)objc_msgSend(v36, "initWithFormat:", CFSTR("%@ %@ %@"), v37, v39, v41);
          -[SUCoreDocumentation setHumanReadableUpdateName:](v18, "setHumanReadableUpdateName:", v42);

          v43 = objc_alloc(MEMORY[0x1E0CB3940]);
          objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "splatCryptex1ProductVersion");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
          v46 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v46, "splatCryptex1ProductVersionExtra");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          v48 = (void *)objc_msgSend(v43, "initWithFormat:", CFSTR("%@ %@"), v45, v47);
          -[SUCoreDocumentation setHumanReadableUpdateVersion:](v18, "setHumanReadableUpdateVersion:", v48);

          v22 = v92;
          v32 = v87;

        }
        objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        if (!objc_msgSend(v49, "isBootedOSSecureInternal"))
          goto LABEL_26;
        v50 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DA8928]), "initWithProjectName:", v85);
        v51 = objc_msgSend(v50, "getBoolConfigForKey:", v84);

        if ((v51 & 1) == 0)
        {
          v52 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[SUCoreDocumentation humanReadableUpdateName](v18, "humanReadableUpdateName");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          v54 = (void *)objc_msgSend(v52, "initWithFormat:", CFSTR("%@ (%@)"), v53, v83);
          -[SUCoreDocumentation setHumanReadableUpdateName:](v18, "setHumanReadableUpdateName:", v54);

          v55 = objc_alloc(MEMORY[0x1E0CB3940]);
          -[SUCoreDocumentation humanReadableUpdateVersion](v18, "humanReadableUpdateVersion");
          v49 = (void *)objc_claimAutoreleasedReturnValue();
          v56 = (void *)objc_msgSend(v55, "initWithFormat:", CFSTR("%@ (%@)"), v49, v83);
          -[SUCoreDocumentation setHumanReadableUpdateVersion:](v18, "setHumanReadableUpdateVersion:", v56);

LABEL_26:
        }
        v19 = objc_alloc_init(SUCoreDocumentationData);

        -[SUCoreDocumentation humanReadableUpdateName](v18, "humanReadableUpdateName");
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentationData setHumanReadableUpdateName:](v19, "setHumanReadableUpdateName:", v57);

        -[SUCoreDocumentation humanReadableUpdateTitle](v18, "humanReadableUpdateTitle");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentationData setHumanReadableUpdateTitle:](v19, "setHumanReadableUpdateTitle:", v58);

        -[SUCoreDocumentation humanReadableUpdateVersion](v18, "humanReadableUpdateVersion");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentationData setHumanReadableUpdateVersion:](v19, "setHumanReadableUpdateVersion:", v59);

        -[SUCoreDocumentation releaseNotes](v18, "releaseNotes");
        v60 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentationData setReadme:](v19, "setReadme:", v60);

        -[SUCoreDocumentation releaseNotesSummary](v18, "releaseNotesSummary");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentationData setReadmeSummary:](v19, "setReadmeSummary:", v61);

        -[SUCoreDocumentation licenseAgreement](v18, "licenseAgreement");
        v62 = (void *)objc_claimAutoreleasedReturnValue();
        -[SUCoreDocumentationData setLicense:](v19, "setLicense:", v62);

        if (v18 && v19)
          goto LABEL_31;
        ++v20;
        v21 = v18;
        v22 = v19;
      }
      while (v89 != v20);
      v89 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v94, v104, 16);
      if (!v89)
      {
LABEL_31:

        objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
        v63 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v63, "oslog");
        v64 = objc_claimAutoreleasedReturnValue();

        if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543618;
          v99 = v18;
          v100 = 2114;
          v101 = v19;
          _os_log_impl(&dword_1DDFDD000, v64, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Returning documentation: %{public}@, documentation data: %{public}@", buf, 0x16u);
        }

        v15 = v83;
        v65 = v80;
        if (v81)
          *v81 = objc_retainAutorelease(v18);
        if (v82)
          *v82 = objc_retainAutorelease(v19);
        if (v18)
          v66 = v19 == 0;
        else
          v66 = 1;
        v67 = !v66;

        goto LABEL_51;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v68 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v68, "oslog");
  v69 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
    -[SUCoreDocumentationDataManager queue_getDocumentation:documentationData:forInstalledUpdateType:withError:].cold.1((uint64_t)v15, v69, v70, v71, v72, v73, v74, v75);

  v76 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("No available stashed documentation path for provided build version (%@)"), v15);
  v77 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v76, "buildAndLogCheckedSUCoreError:underlying:description:", 9004, 0, v77);
  v65 = (id)objc_claimAutoreleasedReturnValue();

  if (a6)
  {
    v65 = objc_retainAutorelease(v65);
    v67 = 0;
    *a6 = v65;
  }
  else
  {
    v67 = 0;
  }
LABEL_51:

LABEL_52:
  return v67;
}

- (BOOL)queue_cleanupNonInstalledDocumentationWithError:(id *)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  char v21;
  id v22;
  void *v23;
  id v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  id *v33;
  void *v35;
  void *v36;
  id *v37;
  void *v38;
  id v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  id v44;
  id v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_stateQueue);
  if (a3)
    *a3 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v38)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "buildAndLogCheckedSUCoreError:underlying:description:", 9000, 0, CFSTR("Failed to create NSFileManager for cleanup"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v23;
    if (!a3)
    {
      v25 = 0;
      v9 = 0;
      v5 = 0;
      goto LABEL_36;
    }
    v24 = objc_retainAutorelease(v23);
    v13 = v24;
    v25 = 0;
    v9 = 0;
    v5 = 0;
    goto LABEL_26;
  }
  v45 = 0;
  -[SUCoreDocumentationDataManager installedBuildVersionsWithError:](self, "installedBuildVersionsWithError:", &v45);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v45;
  v7 = v6;
  if (!v5 || v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "buildAndLogCheckedSUCoreError:underlying:description:", 9005, v6, CFSTR("Failed to create installedBuildVersions array for cleanup"));
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
      v25 = 0;
      v9 = 0;
      goto LABEL_36;
    }
    v24 = objc_retainAutorelease(v13);
    v13 = v24;
    v25 = 0;
    v9 = 0;
    goto LABEL_26;
  }
  -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v44 = 0;
  objc_msgSend(v38, "contentsOfDirectoryAtPath:error:", v8, &v44);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v10 = v44;

  if (!v9 || v10)
  {
    v26 = (void *)MEMORY[0x1E0CB35C8];
    v27 = (void *)MEMORY[0x1E0CB3940];
    -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("Failed to read contents of %@ for cleanup: %@"), v28, v10);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "buildAndLogCheckedSUCoreError:underlying:description:", 9003, v10, v29);
    v13 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
      v25 = 0;
      goto LABEL_36;
    }
    v24 = objc_retainAutorelease(v13);
    v13 = v24;
    v25 = 0;
LABEL_26:
    *a3 = v24;
    goto LABEL_36;
  }
  v42 = 0u;
  v43 = 0u;
  v40 = 0u;
  v41 = 0u;
  v9 = v9;
  v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
  if (v11)
  {
    v12 = v11;
    v37 = a3;
    v13 = 0;
    v14 = *(_QWORD *)v41;
LABEL_10:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v41 != v14)
        objc_enumerationMutation(v9);
      v16 = *(_QWORD *)(*((_QWORD *)&v40 + 1) + 8 * v15);
      if ((objc_msgSend(v5, "containsObject:", v16) & 1) == 0)
      {
        -[SUCoreDocumentationDataManager stashedDataDirectoryForBuildVersion:](self, "stashedDataDirectoryForBuildVersion:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          v30 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create build version path for cleanup with build version (%@)"), v16);
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v30, "buildAndLogCheckedSUCoreError:underlying:description:", 9004, 0, v31);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = v32;
          v33 = v37;
          if (v37)
            goto LABEL_33;
          goto LABEL_34;
        }
        v18 = v5;
        v19 = v9;
        v20 = v13;
        v39 = v13;
        v21 = objc_msgSend(v38, "removeItemAtPath:error:", v17, &v39);
        v22 = v39;

        if ((v21 & 1) == 0)
        {
          v35 = (void *)MEMORY[0x1E0CB35C8];
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to remove directory %@: %@"), v17, v22);
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "buildAndLogCheckedSUCoreError:underlying:description:", 90007, v22, v36);
          v32 = (void *)objc_claimAutoreleasedReturnValue();

          v13 = v32;
          v33 = v37;
          v9 = v19;
          v5 = v18;
          if (!v37)
            goto LABEL_34;
LABEL_33:
          v13 = objc_retainAutorelease(v32);
          *v33 = v13;
LABEL_34:

          v25 = 0;
          goto LABEL_35;
        }

        v13 = v22;
        v9 = v19;
        v5 = v18;
      }
      if (v12 == ++v15)
      {
        v12 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
        if (v12)
          goto LABEL_10;
        goto LABEL_31;
      }
    }
  }
  v13 = 0;
LABEL_31:
  v25 = 1;
LABEL_35:

LABEL_36:
  return v25;
}

- (BOOL)queue_evictStashIfNecessary:(id *)a3
{
  NSObject *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  BOOL v21;
  void *v22;
  const __CFString *v23;
  uint64_t v24;
  void *v25;
  id v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  unint64_t v34;
  uint64_t v35;
  uint64_t v36;
  void *v37;
  void *v38;
  NSObject *v39;
  id v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  char v53;
  void *v54;
  void *v55;
  id v56;
  id v57;
  id v58;
  uint8_t buf[4];
  uint64_t v60;
  __int16 v61;
  uint64_t v62;
  uint64_t v63;

  v63 = *MEMORY[0x1E0C80C00];
  -[SUCoreDocumentationDataManager stateQueue](self, "stateQueue");
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_assert_queue_V2(v5);

  if (a3)
    *a3 = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = CFSTR("Failed to create NSFileManager");
    v24 = 9000;
LABEL_16:
    objc_msgSend(v22, "buildAndLogCheckedSUCoreError:underlying:description:", v24, 0, v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = v25;
    if (a3)
    {
      v26 = objc_retainAutorelease(v25);
      v18 = v26;
      v21 = 0;
      v13 = 0;
LABEL_21:
      v19 = 0;
      v20 = 0;
LABEL_22:
      *a3 = v26;
      goto LABEL_40;
    }
    v21 = 0;
    v13 = 0;
LABEL_39:
    v19 = 0;
    v20 = 0;
    goto LABEL_40;
  }
  v7 = 0x1E0DA8000uLL;
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "oslog");
  v9 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v60 = (uint64_t)v10;
    _os_log_impl(&dword_1DDFDD000, v9, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Preparing to evict stashed documentation assets at directory %{public}@", buf, 0xCu);

  }
  -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v11)
  {
    v22 = (void *)MEMORY[0x1E0CB35C8];
    v23 = CFSTR("Missing documentation path when attempting to evict documentation stash");
    v24 = 9004;
    goto LABEL_16;
  }
  -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = 0;
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v12, &v58);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v58;

  if (!v13 || v14)
  {
    v27 = (void *)MEMORY[0x1E0CB35C8];
    v28 = (void *)MEMORY[0x1E0CB3940];
    -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "stringWithFormat:", CFSTR("Failed to read contents of %@: %@"), v29, v14);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "buildAndLogCheckedSUCoreError:underlying:description:", 9003, v14, v30);
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (a3)
    {
      v26 = objc_retainAutorelease(v18);
      v18 = v26;
      v21 = 0;
      goto LABEL_21;
    }
    v21 = 0;
    goto LABEL_39;
  }
  if ((unint64_t)objc_msgSend(v13, "count") <= 4)
  {
    objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "oslog");
    v16 = objc_claimAutoreleasedReturnValue();

    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v17 = objc_msgSend(v13, "count");
      *(_DWORD *)buf = 134218240;
      v60 = v17;
      v61 = 2048;
      v62 = 5;
      _os_log_impl(&dword_1DDFDD000, v16, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Stashed assets (%lld) is below the minimum threshold (%lld), not evicting any assets", buf, 0x16u);
    }

    v18 = 0;
    v19 = 0;
    v20 = 0;
    goto LABEL_13;
  }
  v57 = 0;
  -[SUCoreDocumentationDataManager installedBuildVersionsWithError:](self, "installedBuildVersionsWithError:", &v57);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = v57;
  v32 = v31;
  if (!v20 || v31)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "buildAndLogCheckedSUCoreError:underlying:description:", 9005, v31, CFSTR("Failed to create installedBuildVersions array"));
    v18 = (id)objc_claimAutoreleasedReturnValue();

    if (!a3)
    {
LABEL_44:
      v21 = 0;
      v19 = 0;
      goto LABEL_40;
    }
    goto LABEL_42;
  }
  objc_msgSend(v13, "sortedArrayUsingComparator:", &__block_literal_global_5);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v33)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "buildAndLogCheckedSUCoreError:underlying:description:", 90007, 0, CFSTR("Failed to create sorted build version directory"));
    v18 = (id)objc_claimAutoreleasedReturnValue();
    if (!a3)
      goto LABEL_44;
LABEL_42:
    v26 = objc_retainAutorelease(v18);
    v18 = v26;
    v21 = 0;
    v19 = 0;
    goto LABEL_22;
  }
  v19 = v33;
  if ((unint64_t)objc_msgSend(v33, "count") < 5)
  {
    v18 = 0;
LABEL_13:
    v21 = 1;
    goto LABEL_40;
  }
  v52 = v13;
  v34 = 0;
  v35 = 0;
  v18 = 0;
  while (1)
  {
    if (objc_msgSend(v19, "count") <= v34)
    {
      v21 = 1;
LABEL_52:
      v13 = v52;
      goto LABEL_40;
    }
    objc_msgSend(v19, "objectAtIndex:", v34);
    v36 = objc_claimAutoreleasedReturnValue();
    if (!v36)
      break;
    v37 = (void *)v36;
    if ((objc_msgSend(v20, "containsObject:", v36) & 1) == 0)
    {
      -[SUCoreDocumentationDataManager stashedDataDirectoryForBuildVersion:](self, "stashedDataDirectoryForBuildVersion:", v37);
      v55 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v55)
      {
        v45 = (void *)MEMORY[0x1E0CB35C8];
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create deletePath"));
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "buildAndLogCheckedSUCoreError:underlying:description:", 90007, 0, v46);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v47;
        if (!a3)
          goto LABEL_51;
        goto LABEL_50;
      }
      v54 = v37;
      objc_msgSend(*(id *)(v7 + 2400), "sharedLogger");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "oslog");
      v39 = objc_claimAutoreleasedReturnValue();

      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v60 = (uint64_t)v55;
        _os_log_impl(&dword_1DDFDD000, v39, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Removing documentation asset at path %{public}@", buf, 0xCu);
      }

      v56 = v18;
      v53 = objc_msgSend(v6, "removeItemAtPath:error:", v55, &v56);
      v40 = v56;

      if ((v53 & 1) == 0)
      {
        v48 = (void *)MEMORY[0x1E0CB35C8];
        v49 = (void *)MEMORY[0x1E0CB3940];
        -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
        v50 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "stringWithFormat:", CFSTR("Failed to remove directory %@: %@"), v50, v40);
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "buildAndLogCheckedSUCoreError:underlying:description:", 90007, v40, v51);
        v47 = (void *)objc_claimAutoreleasedReturnValue();

        v18 = v47;
        v37 = v54;
        if (!a3)
        {
LABEL_51:

          v21 = 0;
          goto LABEL_52;
        }
LABEL_50:
        v18 = objc_retainAutorelease(v47);
        *a3 = v18;
        goto LABEL_51;
      }
      ++v35;

      v18 = v40;
      v7 = 0x1E0DA8000;
      v37 = v54;
    }
    ++v34;

    v21 = 1;
    if ((unint64_t)(objc_msgSend(v19, "count") - v35) <= 4)
      goto LABEL_52;
  }
  v42 = (void *)MEMORY[0x1E0CB35C8];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Failed to create deletePath"));
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "buildAndLogCheckedSUCoreError:underlying:description:", 9005, 0, v43);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = v52;
  if (a3)
  {
    v26 = objc_retainAutorelease(v44);
    v18 = v26;
    v21 = 0;
    goto LABEL_22;
  }
  v21 = 0;
  v18 = v44;
LABEL_40:

  return v21;
}

uint64_t __62__SUCoreDocumentationDataManager_queue_evictStashIfNecessary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return objc_msgSend(a2, "compare:options:", a3, 65);
}

- (id)installedBuildVersionsWithError:(id *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  uint64_t v11;
  void *v12;
  id v13;
  id v14;
  void *v15;
  const __CFString *v16;
  uint64_t v17;
  void *v18;
  int v20;
  uint64_t v21;
  __int16 v22;
  void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  if (a3)
    *a3 = 0;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  if (!v4)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = CFSTR("Failed to allocate installed build version array");
    v17 = 9000;
    goto LABEL_13;
  }
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "buildVersion");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v15 = (void *)MEMORY[0x1E0CB35C8];
    v16 = CFSTR("No OS build version found");
    v17 = 9006;
LABEL_13:
    objc_msgSend(v15, "buildAndLogCheckedSUCoreError:underlying:description:", v17, 0, v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v18;
    if (a3)
    {
      v14 = objc_retainAutorelease(v18);
      v13 = 0;
      *a3 = v14;
    }
    else
    {
      v13 = 0;
    }
    goto LABEL_16;
  }
  objc_msgSend(v4, "addObject:", v6);
  objc_msgSend(MEMORY[0x1E0DA8930], "sharedDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "splatCryptex1BuildVersion");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 && (objc_msgSend(v8, "isEqualToString:", v6) & 1) == 0)
    objc_msgSend(v4, "addObject:", v8);
  objc_msgSend(MEMORY[0x1E0DA8960], "sharedLogger");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "oslog");
  v10 = objc_claimAutoreleasedReturnValue();

  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = objc_msgSend(v4, "count");
    objc_msgSend(v4, "componentsJoinedByString:", CFSTR(", "));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 134218242;
    v21 = v11;
    v22 = 2114;
    v23 = v12;
    _os_log_impl(&dword_1DDFDD000, v10, OS_LOG_TYPE_DEFAULT, "[SUCoreDocumentationDataManager] Found %lld installed build versions: %{public}@", (uint8_t *)&v20, 0x16u);

  }
  v13 = v4;

  v14 = 0;
LABEL_16:

  return v13;
}

- (id)stashedDataDirectoryForBuildVersion:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    if (v4)
    {
      -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringByAppendingPathComponent:", v4);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreDocumentationDataManager"), CFSTR("Missing build version to construct documentation path"), 8116, 0);
      v5 = 0;
    }
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DA8938], "sharedDiag");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trackAnomaly:forReason:withResult:withError:", CFSTR("SUCoreDocumentationDataManager"), CFSTR("Missing base path to construct documentation path"), 8116, 0);
  }

  return v5;
}

- (id)description
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  -[SUCoreDocumentationDataManager documentationPath](self, "documentationPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("SUCoreDocumentationDataManager(%@)"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (OS_dispatch_queue)stateQueue
{
  return self->_stateQueue;
}

- (NSString)documentationPath
{
  return self->_documentationPath;
}

- (void)setDocumentationPath:(id)a3
{
  objc_storeStrong((id *)&self->_documentationPath, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_documentationPath, 0);
  objc_storeStrong((id *)&self->_stateQueue, 0);
}

- (void)queue_stashDocumentationAssetData:(uint64_t)a3 forBuildVersion:(uint64_t)a4 error:(uint64_t)a5 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, a2, a3, "[SUCoreDocumentationDataManager] Failed to create evict stash directories: %@", a5, a6, a7, a8, 2u);
}

- (void)queue_getDocumentation:(uint64_t)a3 documentationData:(uint64_t)a4 forInstalledUpdateType:(uint64_t)a5 withError:(uint64_t)a6 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_1_1(&dword_1DDFDD000, a2, a3, "[SUCoreDocumentationDataManager] No available stashedDocumentationPath for build version: %{public}@", a5, a6, a7, a8, 2u);
}

@end
