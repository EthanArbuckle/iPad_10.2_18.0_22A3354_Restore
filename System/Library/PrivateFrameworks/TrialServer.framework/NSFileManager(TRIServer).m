@implementation NSFileManager(TRIServer)

- (uint64_t)triRemoveDirectoryForPath:()TRIServer isDirectory:error:
{
  id v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;

  v8 = a3;
  v9 = v8;
  if (a4)
  {
    v10 = v8;
  }
  else
  {
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v10;
  if (objc_msgSend(a1, "fileExistsAtPath:isDirectory:", v10, 0))
    v12 = objc_msgSend(a1, "removeItemAtPath:error:", v11, a5);
  else
    v12 = 1;

  return v12;
}

- (uint64_t)triForceRemoveItemAtPath:()TRIServer error:
{
  id v6;
  char v7;
  id v8;
  NSObject *v9;
  uint64_t v10;
  id v12;
  uint8_t buf[4];
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v12 = 0;
  v7 = objc_msgSend(a1, "triRemoveCachedANEBinariesForModelsFromPath:error:", v6, &v12);
  v8 = v12;
  if ((v7 & 1) == 0)
  {
    TRILogCategory_ClientFramework();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v14 = v8;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Failed to purge ANE cache during GC: %{public}@", buf, 0xCu);
    }

  }
  v10 = objc_msgSend(a1, "triRemoveItemAtPath:error:", v6, a4);

  return v10;
}

+ (id)triPostOrderDescendantDirectoryPathsAtPath:()TRIServer
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  id v15;
  id v16;
  int v17;
  void *v18;
  int v19;
  id v20;
  NSObject *v21;
  void *v23;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  void *v28;
  __int16 v29;
  id v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v3, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = *MEMORY[0x1E0C999D0];
  v31[0] = *MEMORY[0x1E0C999D0];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v5, v8, 8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)objc_opt_new();
  if (v10)
  {
    v23 = v4;
    v24 = v3;
    v11 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v9, "nextObject");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v12)
    {
      v13 = (void *)v12;
      while (1)
      {
        v25 = 0;
        v26 = 0;
        v14 = objc_msgSend(v13, "getResourceValue:forKey:error:", &v26, v7, &v25);
        v15 = v26;
        v16 = v25;
        if ((v14 & 1) == 0)
          break;
        v17 = objc_msgSend(v15, "BOOLValue");
        if (!v17 || objc_msgSend(v9, "isEnumeratingDirectoryPostOrder"))
        {
          objc_msgSend(v13, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v18)
            v19 = v17;
          else
            v19 = 0;
          if (v19 == 1 && !objc_msgSend(v10, "addString:", v18))
          {

            goto LABEL_20;
          }

        }
        objc_autoreleasePoolPop(v11);
        v11 = (void *)MEMORY[0x1D8232A5C]();
        objc_msgSend(v9, "nextObject");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
          goto LABEL_14;
      }
      TRILogCategory_ClientFramework();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v28 = v13;
        v29 = 2114;
        v30 = v16;
        _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Failed to determine if url %@ is a directory: %{public}@", buf, 0x16u);
      }

LABEL_20:
      objc_autoreleasePoolPop(v11);
      v20 = 0;
    }
    else
    {
LABEL_14:
      objc_autoreleasePoolPop(v11);
      v20 = v10;
    }
    v4 = v23;
    v3 = v24;
  }
  else
  {
    v20 = 0;
  }

  objc_autoreleasePoolPop(v4);
  return v20;
}

- (BOOL)triRemoveNestedEmptyDirectoriesAtPath:()TRIServer
{
  id v3;
  void *v4;
  void *v5;
  _BOOL8 v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "triPostOrderDescendantDirectoryPathsAtPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v9 = 0;
    v10 = &v9;
    v11 = 0x2020000000;
    v12 = 1;
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __66__NSFileManager_TRIServer__triRemoveNestedEmptyDirectoriesAtPath___block_invoke;
    v8[3] = &unk_1E93368C8;
    v8[4] = &v9;
    if (objc_msgSend(v4, "enumerateStringsWithBlock:", v8))
      v6 = *((_BYTE *)v10 + 24) != 0;
    else
      v6 = 0;
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (uint64_t)triRemoveCachedANEBinariesForModelsFromPath:()TRIServer error:
{
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  const __CFString *v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  id v21;
  id v22;
  void *v23;
  int v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  int v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  const __CFString *v37;
  id v38;
  id v39;
  void *v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  _QWORD *v48;
  id v49;
  void *v50;
  void *v51;
  void *context;
  void (**v53)(_QWORD);
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  _QWORD v59[5];
  uint64_t v60;
  uint64_t *v61;
  uint64_t v62;
  uint64_t (*v63)(uint64_t, uint64_t);
  void (*v64)(uint64_t);
  id v65;
  id v66;
  id v67;
  _QWORD v68[5];
  uint64_t v69;
  uint64_t *v70;
  uint64_t v71;
  uint64_t (*v72)(uint64_t, uint64_t);
  void (*v73)(uint64_t);
  id v74;
  _QWORD v75[4];
  id v76;

  v5 = a3;
  v6 = MEMORY[0x1D8232A5C]();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3B38]), "initWithServiceName:", CFSTR("com.apple.trial.TrialArchivingService"));
  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EFC9D248);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRemoteObjectInterface:", v9);

  objc_msgSend(v8, "resume");
  v10 = MEMORY[0x1E0C809B0];
  v75[0] = MEMORY[0x1E0C809B0];
  v75[1] = 3221225472;
  v75[2] = __78__NSFileManager_TRIServer__triRemoveCachedANEBinariesForModelsFromPath_error___block_invoke;
  v75[3] = &unk_1E932F918;
  v11 = v8;
  v76 = v11;
  v53 = (void (**)(_QWORD))MEMORY[0x1D8232C48](v75);
  v69 = 0;
  v70 = &v69;
  v71 = 0x3032000000;
  v72 = __Block_byref_object_copy__55;
  v73 = __Block_byref_object_dispose__55;
  v74 = 0;
  v68[0] = v10;
  v68[1] = 3221225472;
  v68[2] = __78__NSFileManager_TRIServer__triRemoveCachedANEBinariesForModelsFromPath_error___block_invoke_22;
  v68[3] = &unk_1E9333890;
  v68[4] = &v69;
  v12 = MEMORY[0x1D8232C48](v68);
  objc_msgSend(v11, "synchronousRemoteObjectProxyWithErrorHandler:", v12);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = (void *)v12;
  v51 = v11;
  context = (void *)v6;
  v48 = a4;
  v49 = v5;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v7, 0, 16, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0;
  v16 = CFSTR(".espresso.net");
  v58 = *MEMORY[0x1E0C999D0];
  v54 = v7;
  do
  {
    v17 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v14, "nextObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (!v18)
    {
      v30 = 2;
      goto LABEL_19;
    }
    v66 = 0;
    v67 = 0;
    v20 = objc_msgSend(v18, "getResourceValue:forKey:error:", &v67, v58, &v66);
    v21 = v67;
    v22 = v66;

    if ((v20 & 1) != 0 && (objc_msgSend(v21, "BOOLValue") & 1) == 0)
    {
      objc_msgSend(v19, "lastPathComponent");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = objc_msgSend(v23, "hasSuffix:", v16);

      if (v24)
      {
        objc_msgSend(v19, "relativePath");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v25)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v40 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v40, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileManager+Server.m"), 153, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("currentURL.relativePath"));

        }
        objc_msgSend(v7, "URLByAppendingPathComponent:isDirectory:", v25, 0);
        v26 = objc_claimAutoreleasedReturnValue();
        if (!v26)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v41 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileManager+Server.m"), 155, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[topLevelURL URLByAppendingPathComponent:currentRelativePath isDirectory:NO]"));

        }
        objc_msgSend(v7, "path");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v27)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v42, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileManager+Server.m"), 157, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("topLevelURL.path"));

        }
        +[TRISandboxExtensionFactory extensionTokenForPath:extensionClass:](TRISandboxExtensionFactory, "extensionTokenForPath:extensionClass:", v27, 0);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v28)
        {
          objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v57, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileManager+Server.m"), 159, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("[TRISandboxExtensionFactory extensionTokenForPath:pathToExtend extensionClass:TRISandboxExtensionClassRead]"));

        }
        v60 = 0;
        v61 = &v60;
        v62 = 0x3032000000;
        v63 = __Block_byref_object_copy__55;
        v64 = __Block_byref_object_dispose__55;
        v65 = 0;
        v59[0] = MEMORY[0x1E0C809B0];
        v59[1] = 3221225472;
        v59[2] = __78__NSFileManager_TRIServer__triRemoveCachedANEBinariesForModelsFromPath_error___block_invoke_2;
        v59[3] = &unk_1E9333890;
        v59[4] = &v60;
        objc_msgSend(v55, "removeCachedANESegmentsForModelAtURL:pathExtension:completion:", v26, v28, v59);
        v56 = (void *)v26;
        v29 = (void *)v70[5];
        if (v29)
        {
          v30 = 1;
        }
        else
        {
          v30 = 0;
          v29 = (void *)v61[5];
          if (!v29)
          {
LABEL_24:
            _Block_object_dispose(&v60, 8);

            v7 = v54;
            goto LABEL_17;
          }
        }
        v31 = v29;
        v32 = v22;
        v33 = v28;
        v34 = v27;
        v35 = v14;
        v36 = v25;
        v37 = v16;
        v38 = v31;

        v39 = v38;
        v16 = v37;
        v25 = v36;
        v14 = v35;
        v27 = v34;
        v28 = v33;
        v22 = v39;
        goto LABEL_24;
      }
    }
    v30 = 3;
LABEL_17:

    v15 = v22;
LABEL_19:

    objc_autoreleasePoolPop(v17);
  }
  while (!v30 || v30 == 3);
  if (v30 == 2)
    v30 = 0;

  _Block_object_dispose(&v69, 8);
  if (v53)
    v53[2](v53);

  objc_autoreleasePoolPop(context);
  if (v30)
  {
    v43 = 0;
    goto LABEL_31;
  }
  if (v15)
  {
    v44 = v49;
    v43 = 0;
    if (v48)
      *v48 = objc_retainAutorelease(v15);
  }
  else
  {
    v43 = 1;
LABEL_31:
    v44 = v49;
  }

  return v43;
}

+ (uint64_t)triRenameOrFaultWithSourcePath:()TRIServer destPath:
{
  id v5;
  id v6;
  id v7;
  const std::__fs::filesystem::path *v8;
  id v9;
  const std::__fs::filesystem::path *v10;
  std::error_code *v11;
  int v12;
  NSObject *v13;
  int *v14;
  char *v15;
  int v16;
  void *v17;
  char v18;
  id v19;
  uint64_t v20;
  NSObject *v21;
  id v23;
  uint8_t buf[4];
  id v25;
  __int16 v26;
  id v27;
  __int16 v28;
  char *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v7 = objc_retainAutorelease(v5);
  v8 = (const std::__fs::filesystem::path *)objc_msgSend(v7, "fileSystemRepresentation");
  v9 = objc_retainAutorelease(v6);
  v10 = (const std::__fs::filesystem::path *)objc_msgSend(v9, "fileSystemRepresentation");
  rename(v8, v10, v11);
  if (v12)
  {
    TRILogCategory_ClientFramework();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      v14 = __error();
      v15 = strerror(*v14);
      v16 = *__error();
      *(_DWORD *)buf = 138544130;
      v25 = v7;
      v26 = 2114;
      v27 = v9;
      v28 = 2080;
      v29 = v15;
      v30 = 1024;
      v31 = v16;
      _os_log_impl(&dword_1D207F000, v13, OS_LOG_TYPE_INFO, "Failed to rename %{public}@ --> %{public}@: %s (%d), attempting moveItemAtPath", buf, 0x26u);
    }

    if (v7)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = 0;
      v18 = objc_msgSend(v17, "moveItemAtPath:toPath:error:", v7, v9, &v23);
      v19 = v23;

      if ((v18 & 1) != 0)
      {
        v20 = 1;
LABEL_14:

        goto LABEL_15;
      }
      TRILogCategory_ClientFramework();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138543874;
        v25 = v7;
        v26 = 2114;
        v27 = v9;
        v28 = 2112;
        v29 = (char *)v19;
        _os_log_fault_impl(&dword_1D207F000, v21, OS_LOG_TYPE_FAULT, "Failed to move item: %{public}@ --> %{public}@: %@", buf, 0x20u);
      }
    }
    else
    {
      TRILogCategory_ClientFramework();
      v21 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v25 = 0;
        v26 = 2114;
        v27 = v9;
        _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "Skipping moveItemAtPath request for %{public}@ --> %{public}@, source path does not exist", buf, 0x16u);
      }
      v19 = 0;
    }

    v20 = 0;
    goto LABEL_14;
  }
  v20 = 1;
LABEL_15:

  return v20;
}

+ (uint64_t)triForceRenameWithSourcePath:()TRIServer destPath:
{
  id v6;
  id v7;
  void *v8;
  char v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  v9 = objc_msgSend(v8, "triForceRemoveItemAtPath:error:", v7, &v14);
  v10 = v14;

  if ((v9 & 1) != 0)
  {
    v11 = objc_msgSend(a1, "triRenameOrFaultWithSourcePath:destPath:", v6, v7);
  }
  else
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v16 = v7;
      v17 = 2114;
      v18 = v10;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failed to remove item at destination %{public}@: %{public}@", buf, 0x16u);
    }

    v11 = 0;
  }

  return v11;
}

+ (NSObject)triTargetPathForSymlink:()TRIServer
{
  id v3;
  id v4;
  unint64_t v5;
  NSObject *v6;
  const char *v7;
  NSObject *v8;
  uint32_t v9;
  int *v10;
  char *v11;
  int v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  int v17;
  id v18;
  __int16 v19;
  char *v20;
  __int16 v21;
  int v22;
  char v23[1024];
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  bzero(v23, 0x400uLL);
  v4 = objc_retainAutorelease(v3);
  v5 = readlink((const char *)objc_msgSend(v4, "fileSystemRepresentation"), v23, 0x400uLL);
  if ((v5 & 0x8000000000000000) != 0)
  {
    TRILogCategory_ClientFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v10 = __error();
      v11 = strerror(*v10);
      v12 = *__error();
      v17 = 138543874;
      v18 = v4;
      v19 = 2080;
      v20 = v11;
      v21 = 1024;
      v22 = v12;
      v7 = "Failed to resolve symlink %{public}@: %s (%d)";
      v8 = v6;
      v9 = 28;
      goto LABEL_7;
    }
LABEL_13:
    v14 = 0;
    goto LABEL_14;
  }
  if (v5 >= 0x400)
  {
    TRILogCategory_ClientFramework();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543362;
      v18 = v4;
      v7 = "Target of symlink %{public}@ exceeds maximum length.";
      v8 = v6;
      v9 = 12;
LABEL_7:
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, v7, (uint8_t *)&v17, v9);
      goto LABEL_13;
    }
    goto LABEL_13;
  }
  v23[v5] = 0;
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v23);
  if (!v13)
  {
    TRILogCategory_ClientFramework();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      v17 = 138543362;
      v18 = v4;
      _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "Target of symlink %{public}@ contains non-UTF-8 content.", (uint8_t *)&v17, 0xCu);
    }

    v6 = 0;
    goto LABEL_13;
  }
  v6 = v13;
  v14 = v6;
LABEL_14:

  return v14;
}

+ (uint64_t)triCompressedSizeForFileAtPath:()TRIServer shouldFault:
{
  id v5;
  id v6;
  int v7;
  void *v8;
  int v9;
  NSObject *v10;
  _BOOL4 v11;
  uint64_t v12;
  void *v14;
  unsigned int v15;
  int v16;
  uint64_t v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  MEMORY[0x1D823263C]();
  v17 = 0;
  v15 = 0;
  v16 = -1;
  v6 = objc_retainAutorelease(v5);
  objc_msgSend(v6, "fileSystemRepresentation");
  v7 = ParallelCompressionAFSCGetMetadata();
  v14 = 0;
  MEMORY[0x1D8232648](&v14, 0, 0);
  v8 = v14;
  if (v7)
  {
    v9 = *a4;
    TRILogCategory_Server();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
    if (v9)
    {
      if (v11)
        goto LABEL_11;
    }
    else if (v11)
    {
LABEL_11:
      *(_DWORD *)buf = 138543618;
      v19 = v6;
      v20 = 2114;
      v21 = v8;
      _os_log_error_impl(&dword_1D207F000, v10, OS_LOG_TYPE_ERROR, "Unable to query compressed size for \"%{public}@\": %{public}@", buf, 0x16u);
    }

    *a4 = 0;
    goto LABEL_9;
  }
  if (v16 == -1)
  {
LABEL_9:
    v12 = -1;
    goto LABEL_10;
  }
  v12 = v15;
LABEL_10:

  return v12;
}

+ (TRIDiskUsage)triDiskUsageForDirectory:()TRIServer
{
  void *v3;
  char v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  int v21;
  int v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  TRIDiskUsage *v28;
  NSObject *v29;
  uint64_t v31;
  void *v32;
  void *v33;
  uint64_t v34;
  os_log_t log;
  void *context;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  void *v48;
  id v49;
  id v50;
  id v51;
  id v52;
  id v53;
  id v54;
  id v55;
  id v56;
  id v57;
  id v58;
  _QWORD v59[5];
  uint8_t v60[4];
  id v61;
  __int16 v62;
  uint64_t v63;
  _QWORD v64[4];
  __int128 buf;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;

  v70 = *MEMORY[0x1E0C80C00];
  v39 = a3;
  context = (void *)MEMORY[0x1D8232A5C]();
  v60[0] = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "fileExistsAtPath:isDirectory:", v39, v60);

  if ((v4 & 1) != 0)
  {
    if (v60[0])
    {
      v32 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v39, 1);
      *(_QWORD *)&buf = 0;
      *((_QWORD *)&buf + 1) = &buf;
      v66 = 0x3032000000;
      v67 = __Block_byref_object_copy__55;
      v68 = __Block_byref_object_dispose__55;
      v69 = 0;
      v43 = *MEMORY[0x1E0C99998];
      v5 = *MEMORY[0x1E0C99998];
      v44 = *MEMORY[0x1E0C999D0];
      v64[0] = *MEMORY[0x1E0C999D0];
      v64[1] = v5;
      v6 = *MEMORY[0x1E0C99A18];
      v64[2] = *MEMORY[0x1E0C99AC0];
      v64[3] = v6;
      v42 = v6;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v64, 4);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = MEMORY[0x1E0C809B0];
      v59[1] = 3221225472;
      v59[2] = __53__NSFileManager_TRIServer__triDiskUsageForDirectory___block_invoke;
      v59[3] = &unk_1E93336B8;
      v59[4] = &buf;
      objc_msgSend(v7, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v32, v33, 24, v59);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        log = (os_log_t)objc_opt_new();
        v46 = 0;
        v47 = 0;
        v45 = 0;
        v60[0] = 1;
        v41 = *MEMORY[0x1E0C99A60];
        v40 = *MEMORY[0x1E0C99948];
        while (1)
        {
          v8 = (void *)MEMORY[0x1D8232A5C]();
          objc_msgSend(v48, "nextObject");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = v9;
          if (v9)
            break;
          v21 = 2;
LABEL_17:

          objc_autoreleasePoolPop(v8);
          if (v21 == 2)
          {
            v28 = -[TRIDiskUsage initWithNaiveSum:deduplicatedSum:compressedSum:]([TRIDiskUsage alloc], "initWithNaiveSum:deduplicatedSum:compressedSum:", v47, v45, v46);
            goto LABEL_35;
          }
        }
        v57 = 0;
        v58 = 0;
        objc_msgSend(v9, "getResourceValue:forKey:error:", &v58, v44, &v57);
        v11 = v58;
        v12 = v57;
        v55 = 0;
        v56 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v56, v43, &v55);
        v13 = v56;
        v14 = v55;

        v53 = 0;
        v54 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v54, v42, &v53);
        v15 = v54;
        v16 = v53;

        v51 = 0;
        v52 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v52, v41, &v51);
        v17 = v52;
        v18 = v51;

        v49 = 0;
        v50 = 0;
        objc_msgSend(v10, "getResourceValue:forKey:error:", &v50, v40, &v49);
        v19 = v50;
        v20 = v49;

        if (objc_msgSend(v11, "BOOLValue"))
        {
          v47 += objc_msgSend(v13, "unsignedLongValue");
          v45 += objc_msgSend(v13, "unsignedLongValue");
          v46 += objc_msgSend(v13, "unsignedLongValue");
LABEL_15:
          v21 = 3;
LABEL_16:

          goto LABEL_17;
        }
        if (!objc_msgSend(v15, "BOOLValue"))
          goto LABEL_15;
        if ((unint64_t)objc_msgSend(v17, "unsignedLongValue") >= 2)
        {
          if (!v19)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v26, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileManager+Server.m"), 373, CFSTR("no resource identifier for regular file"));

          }
          if ((-[NSObject containsObject:](log, "containsObject:", v19) & 1) != 0)
          {
            v22 = 0;
            goto LABEL_21;
          }
          -[NSObject addObject:](log, "addObject:", v19);
        }
        v22 = 1;
LABEL_21:
        v47 += objc_msgSend(v13, "unsignedLongValue");
        if (v22)
        {
          v34 = objc_msgSend(v13, "unsignedLongValue");
          objc_msgSend(v10, "relativePath");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          if (!v23)
          {
            objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("NSFileManager+Server.m"), 386, CFSTR("Expression was unexpectedly nil/false: %@"), CFSTR("relURL.relativePath"));

          }
          objc_msgSend(v39, "stringByAppendingPathComponent:", v23);
          v24 = (void *)objc_claimAutoreleasedReturnValue();

          v25 = objc_msgSend(a1, "triCompressedSizeForFileAtPath:shouldFault:", v24, v60);
          if (v25 == -1)
            v25 = objc_msgSend(v13, "unsignedLongValue");

          v21 = 0;
          v45 += v34;
          v46 += v25;
        }
        else
        {
          v21 = 0;
        }
        goto LABEL_16;
      }
      TRILogCategory_Server();
      log = (os_log_t)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
      {
        v31 = *(_QWORD *)(*((_QWORD *)&buf + 1) + 40);
        *(_DWORD *)v60 = 138543618;
        v61 = v39;
        v62 = 2114;
        v63 = v31;
        _os_log_error_impl(&dword_1D207F000, log, OS_LOG_TYPE_ERROR, "Failed to create enumerator at path: %{public}@ w/ error: %{public}@", v60, 0x16u);
      }
      v28 = 0;
LABEL_35:

      _Block_object_dispose(&buf, 8);
    }
    else
    {
      TRILogCategory_Server();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138543362;
        *(_QWORD *)((char *)&buf + 4) = v39;
        _os_log_error_impl(&dword_1D207F000, v29, OS_LOG_TYPE_ERROR, "Can't compute disk usage for \"%{public}@\": not a directory", (uint8_t *)&buf, 0xCu);
      }

      v28 = 0;
    }
  }
  else
  {
    v28 = -[TRIDiskUsage initWithNaiveSum:deduplicatedSum:compressedSum:]([TRIDiskUsage alloc], "initWithNaiveSum:deduplicatedSum:compressedSum:", 0, 0, 0);
  }
  objc_autoreleasePoolPop(context);

  return v28;
}

@end
