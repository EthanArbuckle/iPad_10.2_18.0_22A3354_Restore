@implementation TRIReferenceManagedDir

+ (id)_metadataDirForManagedDir:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("_refs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);

  return v5;
}

+ (id)_reverseLinksDirForManagedDir:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(a1, "_metadataDirForManagedDir:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("revlinks"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v5);
  return v7;
}

+ ($A5A652246548B43F8BC05201A1C72A70)_acquireLockOnDir:(id)a3 withLockingMode:(int)a4 andRunBlock:(id)a5
{
  id v7;
  void (**v8)(id, int *);
  void *v9;
  id v10;
  int v11;
  int v12;
  $A5A652246548B43F8BC05201A1C72A70 v13;
  NSObject *v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int *v19;
  char *v20;
  int v21;
  int *v22;
  char *v23;
  int v24;
  int *v25;
  char *v26;
  int v27;
  int v28;
  id v29;
  __int16 v30;
  char *v31;
  __int16 v32;
  int v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void (**)(id, int *))a5;
  v9 = (void *)MEMORY[0x1D8232A5C]();
  v10 = objc_retainAutorelease(v7);
  v11 = open((const char *)objc_msgSend(v10, "fileSystemRepresentation"), 0);
  if (v11 < 0)
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v19 = __error();
      v20 = strerror(*v19);
      v21 = *__error();
      v28 = 138543874;
      v29 = v10;
      v30 = 2080;
      v31 = v20;
      v32 = 1024;
      v33 = v21;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failed to open lock dir %{public}@: %s (%d)", (uint8_t *)&v28, 0x1Cu);
    }

    v13.var0 = 2;
  }
  else
  {
    v12 = v11;
    if (flock(v11, a4))
    {
      if (*__error() == 35)
      {
        v13.var0 = 1;
      }
      else
      {
        TRILogCategory_Server();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          v22 = __error();
          v23 = strerror(*v22);
          v24 = *__error();
          v28 = 138543874;
          v29 = v10;
          v30 = 2080;
          v31 = v23;
          v32 = 1024;
          v33 = v24;
          _os_log_error_impl(&dword_1D207F000, v17, OS_LOG_TYPE_ERROR, "Failed to acquire lock dir %{public}@: %s (%d)", (uint8_t *)&v28, 0x1Cu);
        }

        v13.var0 = 2;
      }
    }
    else
    {
      v15 = (void *)MEMORY[0x1D8232A5C]();
      v28 = v12;
      v8[2](v8, &v28);
      objc_autoreleasePoolPop(v15);
      if (flock(v12, 8))
      {
        TRILogCategory_Server();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v25 = __error();
          v26 = strerror(*v25);
          v27 = *__error();
          v28 = 138543874;
          v29 = v10;
          v30 = 2080;
          v31 = v26;
          v32 = 1024;
          v33 = v27;
          _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Failed to unlock lock dir %{public}@: %s (%d)", (uint8_t *)&v28, 0x1Cu);
        }

      }
      v13.var0 = 0;
    }
    close(v12);
  }
  objc_autoreleasePoolPop(v9);

  return v13;
}

+ (id)_containingManagedDirForPath:(id)a3 resolvedAbsPath:(id *)a4
{
  id v6;
  id v7;
  char *v8;
  char *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  int v15;
  int v16;
  int *v18;
  char *v19;
  int v20;
  NSObject *v21;
  int *v23;
  char *v24;
  int v25;
  unsigned __int8 v26;
  uint8_t v27[4];
  id v28;
  __int16 v29;
  char *v30;
  __int16 v31;
  int v32;
  uint8_t buf[4];
  id v34;
  __int16 v35;
  char *v36;
  __int16 v37;
  int v38;
  unsigned __int16 v39[512];
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  bzero(v39, 0x400uLL);
  v7 = objc_retainAutorelease(v6);
  v8 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v7, "fileSystemRepresentation"), (char *)v39);
  if (v8)
  {
    v9 = v8;
    if (a4)
    {
      stringForUTF8Path((uint64_t)v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *a4;
      *a4 = v10;

    }
    while (1)
    {
      stringForUTF8Path((uint64_t)v9);
      v12 = objc_claimAutoreleasedReturnValue();
      v26 = 0;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(a1, "_metadataDirForManagedDir:", v12);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "fileExistsAtPath:isDirectory:", v14, &v26);
      v16 = v26;

      if (v15 && v16 != 0)
        break;
      if (!dirname_r(v9, (char *)buf))
      {
        TRILogCategory_Server();
        v21 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          v23 = __error();
          v24 = strerror(*v23);
          v25 = *__error();
          *(_DWORD *)v27 = 138543874;
          v28 = v7;
          v29 = 2080;
          v30 = v24;
          v31 = 1024;
          v32 = v25;
          _os_log_error_impl(&dword_1D207F000, v21, OS_LOG_TYPE_ERROR, "dirname_r() failure on upward-traversal of path \"%{public}@\": %s (%d)", v27, 0x1Cu);
        }

        goto LABEL_17;
      }
      v9 = (char *)v39;
      __strcpy_chk();

      if (v39[0] == 47)
        goto LABEL_18;
    }
  }
  else
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      v18 = __error();
      v19 = strerror(*v18);
      v20 = *__error();
      *(_DWORD *)buf = 138543874;
      v34 = v7;
      v35 = 2080;
      v36 = v19;
      v37 = 1024;
      v38 = v20;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failed to resolve absolute path for possibly-managed path \"%{public}@\": %s (%d)", buf, 0x1Cu);
    }
LABEL_17:

LABEL_18:
    v12 = 0;
  }

  return v12;
}

+ (BOOL)createFromDir:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  id v14;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v15 = 0;
  objc_msgSend(a1, "_containingManagedDirForPath:resolvedAbsPath:", v4, &v15);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    LODWORD(a1) = objc_msgSend(v5, "isEqualToString:", v15);
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if ((_DWORD)a1)
    {
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v6;
        _os_log_impl(&dword_1D207F000, v8, OS_LOG_TYPE_DEFAULT, "Reference-managed directory already exists at %{public}@", buf, 0xCu);
      }
    }
    else if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v17 = v4;
      v18 = 2114;
      v19 = v6;
      _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Cannot create reference-managed directory \"%{public}@\" because it is nested in reference-managed directory: %{public}@", buf, 0x16u);
    }

  }
  else
  {

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "_metadataDirForManagedDir:", v4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    LOBYTE(a1) = objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 0, 0, &v14);
    v11 = v14;

    if ((a1 & 1) == 0)
    {
      TRILogCategory_Server();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543618;
        v17 = v4;
        v18 = 2114;
        v19 = v11;
        _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Failed to create reference-managed directory from %{public}@: %{public}@", buf, 0x16u);
      }

    }
  }

  return (char)a1;
}

+ (BOOL)symlinkFromPath:(id)a3 toManagedPath:(id)a4
{
  return objc_msgSend(a1, "symlinkFromCurrentPath:withFuturePath:toManagedPath:", a3, a3, a4);
}

+ (BOOL)symlinkFromCurrentPath:(id)a3 withFuturePath:(id)a4 toManagedPath:(id)a5
{
  id v9;
  id v10;
  id v11;
  void *v12;
  int v13;
  NSObject *v14;
  char v15;
  id v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  char v25;
  NSObject *v26;
  NSObject *v27;
  const char *v28;
  char *v29;
  NSObject *v30;
  void *v31;
  int *v32;
  char *v33;
  int v34;
  id v35;
  void *v36;
  void *v37;
  void *v38;
  id v39;
  int *v40;
  char *v41;
  int v42;
  void *v43;
  void *v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _BYTE *v48;
  id v49;
  id v50;
  _BYTE v51[24];
  int v52;
  uint8_t buf[4];
  const char *v54;
  __int16 v55;
  id v56;
  __int16 v57;
  char *v58;
  __int16 v59;
  int v60;
  uint64_t v61;

  v61 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_52:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIReferenceManagedDir.m"), 185, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("symlinkFuturePath"));

    if (v11)
      goto LABEL_4;
    goto LABEL_53;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIReferenceManagedDir.m"), 184, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("symlinkCurrentPath"));

  if (!v10)
    goto LABEL_52;
LABEL_3:
  if (v11)
    goto LABEL_4;
LABEL_53:
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIReferenceManagedDir.m"), 186, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("managedPath"));

LABEL_4:
  if (!objc_msgSend(v9, "length"))
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "+[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:]";
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: symlinkCurrentPath", buf, 0xCu);
    }
    goto LABEL_23;
  }
  if (!objc_msgSend(v10, "length"))
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "+[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:]";
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: symlinkFuturePath", buf, 0xCu);
    }
    goto LABEL_23;
  }
  if (!objc_msgSend(v11, "length"))
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      v54 = "+[TRIReferenceManagedDir symlinkFromCurrentPath:withFuturePath:toManagedPath:]";
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "%s has empty path arg: managedPath", buf, 0xCu);
    }
    goto LABEL_23;
  }
  if ((objc_msgSend(v10, "isAbsolutePath") & 1) == 0)
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v54 = (const char *)v10;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "symlinkFuturePath \"%{public}@\" is not absolute.", buf, 0xCu);
    }
    goto LABEL_23;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "fileExistsAtPath:", v9);

  if (v13)
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v54 = (const char *)v9;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Unable to create symlink at \"%{public}@\": file already exists", buf, 0xCu);
    }
LABEL_23:

LABEL_24:
    v15 = 0;
    goto LABEL_25;
  }
  bzero(buf, 0x400uLL);
  objc_msgSend(v9, "stringByDeletingLastPathComponent");
  v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v18 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v17, "fileSystemRepresentation"), (char *)buf);

  if (!v18)
  {
    TRILogCategory_Server();
    v26 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      v32 = __error();
      v33 = strerror(*v32);
      v34 = *__error();
      *(_DWORD *)v51 = 138543874;
      *(_QWORD *)&v51[4] = v9;
      *(_WORD *)&v51[12] = 2080;
      *(_QWORD *)&v51[14] = v33;
      *(_WORD *)&v51[22] = 1024;
      v52 = v34;
      _os_log_error_impl(&dword_1D207F000, v26, OS_LOG_TYPE_ERROR, "Unable to resolve parent dir for \"%{public}@\": %s (%d)", v51, 0x1Cu);
    }

    goto LABEL_24;
  }
  stringForUTF8Path((uint64_t)v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "lastPathComponent");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByAppendingPathComponent:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v21)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIReferenceManagedDir.m"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("absSymlinkCurrentPath"));

  }
  v50 = 0;
  objc_msgSend(a1, "_containingManagedDirForPath:resolvedAbsPath:", v11, &v50);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  if (v22)
  {
    if (!v50)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIReferenceManagedDir.m"), 228, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("absLinkTarget"));

    }
    *(_QWORD *)v51 = 0;
    *(_QWORD *)&v51[8] = v51;
    *(_QWORD *)&v51[16] = 0x2020000000;
    LOBYTE(v52) = 1;
    objc_msgSend(a1, "_metadataDirForManagedDir:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v45[0] = MEMORY[0x1E0C809B0];
    v45[1] = 3221225472;
    v45[2] = __78__TRIReferenceManagedDir_symlinkFromCurrentPath_withFuturePath_toManagedPath___block_invoke;
    v45[3] = &unk_1E9335370;
    v49 = a1;
    v24 = v22;
    v46 = v24;
    v47 = v10;
    v48 = v51;
    v25 = objc_msgSend(a1, "_acquireLockOnDir:withLockingMode:andRunBlock:", v23, 2, v45);

    if (v25 || !*(_BYTE *)(*(_QWORD *)&v51[8] + 24))
    {
      v15 = 0;
    }
    else
    {
      v28 = (const char *)objc_msgSend(objc_retainAutorelease(v50), "fileSystemRepresentation");
      v29 = objc_retainAutorelease(v21);
      if (symlink(v28, (const char *)objc_msgSend(v29, "fileSystemRepresentation")))
      {
        TRILogCategory_Server();
        v30 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR))
        {
          v39 = v50;
          v40 = __error();
          v41 = strerror(*v40);
          v42 = *__error();
          *(_DWORD *)buf = 138544130;
          v54 = v29;
          v55 = 2114;
          v56 = v39;
          v57 = 2080;
          v58 = v41;
          v59 = 1024;
          v60 = v42;
          _os_log_error_impl(&dword_1D207F000, v30, OS_LOG_TYPE_ERROR, "Failed to create symlink %{public}@ --> %{public}@: %s (%d)", buf, 0x26u);
        }
        v15 = 0;
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "triPath:relativeToParentPath:", v11, v24);
        v30 = objc_claimAutoreleasedReturnValue();

        if ((-[NSObject isEqualToString:](v30, "isEqualToString:", CFSTR(".")) & 1) != 0)
        {
          v15 = 1;
        }
        else
        {
          v35 = -[TRIDeferredDeleter initForRootDir:]([TRIDeferredDeleter alloc], "initForRootDir:", v24);
          v15 = objc_msgSend(v35, "unmarkItemAtRelativePath:", v30);

        }
      }

    }
    _Block_object_dispose(v51, 8);
  }
  else
  {
    TRILogCategory_Server();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v54 = (const char *)v11;
      _os_log_error_impl(&dword_1D207F000, v27, OS_LOG_TYPE_ERROR, "Attempting to symlink to a non-managed path: %{public}@", buf, 0xCu);
    }

    v15 = 0;
  }

LABEL_25:
  return v15;
}

void __78__TRIReferenceManagedDir_symlinkFromCurrentPath_withFuturePath_toManagedPath___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  char v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  const char *v14;
  id v15;
  NSObject *v16;
  uint64_t v17;
  int *v18;
  char *v19;
  int v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  uint64_t v25;
  __int16 v26;
  char *v27;
  __int16 v28;
  int v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 56), "_reverseLinksDirForManagedDir:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0;
  v4 = objc_msgSend(v2, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v21);
  v5 = v21;

  if ((v4 & 1) == 0)
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v23 = v5;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Failed to create reverse link dir: %{public}@", buf, 0xCu);
    }

  }
  v7 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(*(id *)(a1 + 56), "_reverseLinksDirForManagedDir:", *(_QWORD *)(a1 + 32));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_alloc(MEMORY[0x1E0CB3940]);
  v10 = (void *)objc_opt_new();
  objc_msgSend(v10, "UUIDString");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v9, "initWithFormat:", CFSTR("link-%@"), v11);
  objc_msgSend(v8, "stringByAppendingPathComponent:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  v14 = (const char *)objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 40)), "fileSystemRepresentation");
  v15 = objc_retainAutorelease(v13);
  if (symlink(v14, (const char *)objc_msgSend(v15, "fileSystemRepresentation")))
  {
    TRILogCategory_Server();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      v17 = *(_QWORD *)(a1 + 40);
      v18 = __error();
      v19 = strerror(*v18);
      v20 = *__error();
      *(_DWORD *)buf = 138544130;
      v23 = v15;
      v24 = 2114;
      v25 = v17;
      v26 = 2080;
      v27 = v19;
      v28 = 1024;
      v29 = v20;
      _os_log_error_impl(&dword_1D207F000, v16, OS_LOG_TYPE_ERROR, "Failed to create symlink %{public}@ --> %{public}@: %s (%d)", buf, 0x26u);
    }

    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 0;
  }

}

+ (BOOL)_isTargetOfSymlink:(id)a3 containedInManagedDir:(id)a4
{
  id v7;
  id v8;
  void *v9;
  id v10;
  unint64_t v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  uint32_t v15;
  char *v16;
  id v17;
  char *v18;
  void *v19;
  char v20;
  NSObject *v22;
  uint64_t v23;
  int *v24;
  char *v25;
  int v26;
  int *v27;
  char *v28;
  int v29;
  void *v30;
  void *v31;
  uint8_t buf[4];
  id v33;
  __int16 v34;
  char *v35;
  __int16 v36;
  int v37;
  char v38[1024];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8232A5C]();
  bzero(v38, 0x400uLL);
  *__error() = 0;
  v10 = objc_retainAutorelease(v7);
  v11 = readlink((const char *)objc_msgSend(v10, "fileSystemRepresentation"), v38, 0x400uLL);
  if ((v11 & 0x8000000000000000) != 0)
  {
    if (*__error() == 2)
    {
      v16 = 0;
LABEL_20:
      v20 = 0;
      goto LABEL_21;
    }
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      goto LABEL_16;
    v24 = __error();
    v25 = strerror(*v24);
    v26 = *__error();
    *(_DWORD *)buf = 138543874;
    v33 = v10;
    v34 = 2080;
    v35 = v25;
    v36 = 1024;
    v37 = v26;
    v13 = "Failed to resolve symlink \"%{public}@\": %s (%d)";
    v14 = v12;
    v15 = 28;
    goto LABEL_28;
  }
  if (v11 >= 0x400)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
LABEL_16:
      v16 = 0;
LABEL_19:

      goto LABEL_20;
    }
    *(_DWORD *)buf = 138543362;
    v33 = v10;
    v13 = "Target of symlink \"%{public}@\" exceeds maximum length.";
    v14 = v12;
    v15 = 12;
LABEL_28:
    _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, v13, buf, v15);
    goto LABEL_16;
  }
  v38[v11] = 0;
  stringForUTF8Path((uint64_t)v38);
  v16 = (char *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v16, "hasPrefix:", CFSTR("/")) & 1) == 0)
  {
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v33 = v10;
      v34 = 2114;
      v35 = v16;
      _os_log_error_impl(&dword_1D207F000, v12, OS_LOG_TYPE_ERROR, "Symlink into managed directory is expected to be absolute: %{public}@ --> %{public}@", buf, 0x16u);
    }
    goto LABEL_19;
  }
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIReferenceManagedDir.m"), 314, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("absLinkTarget"));

  }
  bzero(v38, 0x400uLL);
  v17 = objc_retainAutorelease(v8);
  v18 = realpath_DARWIN_EXTSN((const char *)objc_msgSend(v17, "fileSystemRepresentation"), v38);
  if (v18)
  {
    stringForUTF8Path((uint64_t)v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIReferenceManagedDir.m"), 329, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("absManagedDir"));

    }
    if ((objc_msgSend(v16, "isEqualToString:", v19) & 1) != 0)
    {
      v20 = 1;
    }
    else
    {
      objc_msgSend(v19, "stringByAppendingString:", CFSTR("/"));
      v23 = objc_claimAutoreleasedReturnValue();

      v20 = objc_msgSend(v16, "hasPrefix:", v23);
      v19 = (void *)v23;
    }
  }
  else
  {
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v27 = __error();
      v28 = strerror(*v27);
      v29 = *__error();
      *(_DWORD *)buf = 138543874;
      v33 = v17;
      v34 = 2080;
      v35 = v28;
      v36 = 1024;
      v37 = v29;
      _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "Failed to canonicalize reference-managed directory \"%{public}@\": %s (%d)", buf, 0x1Cu);
    }

    v19 = 0;
    v20 = 0;
  }

LABEL_21:
  objc_autoreleasePoolPop(v9);

  return v20;
}

+ (id)_collectDeadSymlinksForManagedDir:(id)a3 withLockWitness:(TRIFlockWitness_ *)a4 liveSymlinkCount:(unsigned int *)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  id v20;
  unint64_t v21;
  NSObject *v22;
  NSObject *v23;
  const char *v24;
  uint32_t v25;
  void *v26;
  int *v27;
  char *v28;
  int v29;
  void *v30;
  id v31;
  void *v33;
  SEL v34;
  void *v35;
  uint8_t buf[4];
  id v37;
  __int16 v38;
  char *v39;
  __int16 v40;
  int v41;
  char v42[1024];
  uint64_t v43;

  v43 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (void *)MEMORY[0x1D8232A5C]();
  *a5 = 0;
  v10 = (void *)objc_opt_new();
  if (!v10)
  {
    v31 = 0;
    goto LABEL_22;
  }
  v34 = a2;
  v11 = (void *)MEMORY[0x1E0C99E98];
  objc_msgSend(a1, "_reverseLinksDirForManagedDir:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "fileURLWithPath:isDirectory:", v12, 1);
  v13 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = (void *)v13;
  objc_msgSend(v14, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v13, 0, 1, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = (void *)MEMORY[0x1D8232A5C]();
  objc_msgSend(v15, "nextObject");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
LABEL_19:
    objc_autoreleasePoolPop(v16);
    v31 = v10;
    goto LABEL_20;
  }
  v18 = (void *)v17;
  while (1)
  {
    ++*a5;
    objc_msgSend(v18, "path");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v19)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "handleFailureInMethod:object:file:lineNumber:description:", v34, a1, CFSTR("TRIReferenceManagedDir.m"), 372, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("reverseLinkPath"));

    }
    bzero(v42, 0x400uLL);
    v20 = objc_retainAutorelease(v19);
    v21 = readlink((const char *)objc_msgSend(v20, "fileSystemRepresentation"), v42, 0x400uLL);
    if ((v21 & 0x8000000000000000) == 0)
      break;
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      v27 = __error();
      v33 = v9;
      v28 = strerror(*v27);
      v29 = *__error();
      *(_DWORD *)buf = 138543874;
      v37 = v20;
      v38 = 2080;
      v39 = v28;
      v9 = v33;
      v40 = 1024;
      v41 = v29;
      v23 = v22;
      v24 = "Failed to resolve reverse-link \"%{public}@\": %s (%d)";
      v25 = 28;
      goto LABEL_18;
    }
LABEL_11:

    v26 = 0;
LABEL_12:

    objc_autoreleasePoolPop(v16);
    v16 = (void *)MEMORY[0x1D8232A5C]();
    objc_msgSend(v15, "nextObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
      goto LABEL_19;
  }
  if (v21 >= 0x400)
  {
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v37 = v20;
      v23 = v22;
      v24 = "Target of reverse-link \"%{public}@\" exceeds max path length.";
      v25 = 12;
LABEL_18:
      _os_log_error_impl(&dword_1D207F000, v23, OS_LOG_TYPE_ERROR, v24, buf, v25);
      goto LABEL_11;
    }
    goto LABEL_11;
  }
  v42[v21] = 0;
  stringForUTF8Path((uint64_t)v42);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(a1, "_isTargetOfSymlink:containedInManagedDir:", v26, v8) & 1) != 0)
    goto LABEL_12;
  if ((objc_msgSend(v10, "addString:", v20) & 1) != 0)
  {
    --*a5;
    goto LABEL_12;
  }

  objc_autoreleasePoolPop(v16);
  v31 = 0;
LABEL_20:

LABEL_22:
  objc_autoreleasePoolPop(v9);

  return v31;
}

+ (BOOL)_removePaths:(id)a3 withLockWitness:(TRIFlockWitness_ *)a4 numRemoved:(unsigned int *)a5
{
  id v6;
  void *v7;
  BOOL v8;
  _QWORD v10[6];
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  char v14;

  v6 = a3;
  v7 = v6;
  if (a5)
    *a5 = 0;
  v11 = 0;
  v12 = &v11;
  v13 = 0x2020000000;
  v14 = 1;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __66__TRIReferenceManagedDir__removePaths_withLockWitness_numRemoved___block_invoke;
  v10[3] = &unk_1E9335398;
  v10[4] = &v11;
  v10[5] = a5;
  if (objc_msgSend(v6, "enumerateStringsWithBlock:", v10))
    v8 = *((_BYTE *)v12 + 24) != 0;
  else
    v8 = 0;
  _Block_object_dispose(&v11, 8);

  return v8;
}

void __66__TRIReferenceManagedDir__removePaths_withLockWitness_numRemoved___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  _DWORD *v6;
  int *v7;
  char *v8;
  int v9;
  int v10;
  id v11;
  __int16 v12;
  char *v13;
  __int16 v14;
  int v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (objc_msgSend(v3, "length"))
  {
    v4 = objc_retainAutorelease(v3);
    if (unlink((const char *)objc_msgSend(v4, "fileSystemRepresentation")))
    {
      TRILogCategory_Server();
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      {
        v7 = __error();
        v8 = strerror(*v7);
        v9 = *__error();
        v10 = 138543874;
        v11 = v4;
        v12 = 2080;
        v13 = v8;
        v14 = 1024;
        v15 = v9;
        _os_log_error_impl(&dword_1D207F000, v5, OS_LOG_TYPE_ERROR, "Failed to unlink %{public}@: %s (%d)", (uint8_t *)&v10, 0x1Cu);
      }

      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 0;
    }
    else
    {
      v6 = *(_DWORD **)(a1 + 40);
      if (v6)
        ++*v6;
    }
  }

}

+ (BOOL)_deleteReferenceManagedDirectory:(id)a3 usingTempDir:(id)a4 managedDirWasDeleted:(BOOL *)a5
{
  NSObject *v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  char v12;
  NSObject *v13;
  NSObject *v14;
  void *v15;
  BOOL *v16;
  void *v17;
  char v18;
  NSObject *v19;
  NSObject *v20;
  id v21;
  void *v22;
  NSObject *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  NSObject *v29;
  const std::__fs::filesystem::path *v30;
  id v31;
  const std::__fs::filesystem::path *v32;
  std::error_code *v33;
  int v34;
  NSObject *v35;
  BOOL v36;
  void *v37;
  char v38;
  void *v39;
  NSObject *v41;
  int *v42;
  char *v43;
  int v44;
  void *v45;
  id v46;
  id v47;
  id v48;
  uint8_t buf[4];
  NSObject *v50;
  __int16 v51;
  id v52;
  __int16 v53;
  char *v54;
  __int16 v55;
  int v56;
  uint64_t v57;

  v57 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x1D8232A5C]();
  TRILogCategory_Server();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    v50 = v7;
    _os_log_impl(&dword_1D207F000, v10, OS_LOG_TYPE_DEFAULT, "GC is deleting reference-managed directory: %{public}@", buf, 0xCu);
  }

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = 0;
  v12 = objc_msgSend(v11, "triRemoveCachedANEBinariesForModelsFromPath:error:", v7, &v48);
  v13 = v48;
  if ((v12 & 1) == 0)
  {
    TRILogCategory_Server();
    v14 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v50 = v13;
      _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Failed to purge ANE cache during GC: %{public}@", buf, 0xCu);
    }

  }
  v45 = v8;
  if (v8)
  {
    v15 = v11;
    v16 = a5;
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = 0;
    v18 = objc_msgSend(v17, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v8, 1, 0, &v47);
    v19 = v47;

    if ((v18 & 1) == 0)
    {
      TRILogCategory_Server();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v50 = v19;
        _os_log_error_impl(&dword_1D207F000, v20, OS_LOG_TYPE_ERROR, "Failed to create local temp directory: %{public}@", buf, 0xCu);
      }

    }
    v21 = objc_alloc(MEMORY[0x1E0CB3940]);
    v22 = (void *)objc_opt_new();
    objc_msgSend(v22, "UUIDString");
    v23 = v13;
    v24 = v9;
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = (void *)objc_msgSend(v21, "initWithFormat:", CFSTR("delete-%@"), v25);
    objc_msgSend(v45, "stringByAppendingPathComponent:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v24;
    v13 = v23;
    a5 = v16;
    v11 = v15;
  }
  else
  {
    v28 = objc_alloc(MEMORY[0x1E0CB3940]);
    v19 = objc_opt_new();
    -[NSObject UUIDString](v19, "UUIDString");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = (void *)objc_msgSend(v28, "initWithFormat:", CFSTR("%@-delete-%@"), v7, v22);
  }

  v29 = objc_retainAutorelease(v7);
  v30 = (const std::__fs::filesystem::path *)-[NSObject fileSystemRepresentation](v29, "fileSystemRepresentation");
  v31 = objc_retainAutorelease(v27);
  v32 = (const std::__fs::filesystem::path *)objc_msgSend(v31, "fileSystemRepresentation");
  rename(v30, v32, v33);
  if (v34)
  {
    TRILogCategory_Server();
    v35 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR))
    {
      v42 = __error();
      v43 = strerror(*v42);
      v44 = *__error();
      *(_DWORD *)buf = 138544130;
      v50 = v29;
      v51 = 2114;
      v52 = v31;
      v53 = 2080;
      v54 = v43;
      v55 = 1024;
      v56 = v44;
      _os_log_error_impl(&dword_1D207F000, v35, OS_LOG_TYPE_ERROR, "Failed to rename %{public}@ --> %{public}@: %s (%d)", buf, 0x26u);
    }
    v36 = 0;
    goto LABEL_22;
  }
  if (a5)
    *a5 = 1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = 0;
  v38 = objc_msgSend(v37, "triForceRemoveItemAtPath:error:", v31, &v46);
  v35 = v46;

  if ((v38 & 1) != 0)
  {
    v36 = 1;
LABEL_22:
    v39 = v45;
    goto LABEL_23;
  }
  TRILogCategory_Server();
  v41 = objc_claimAutoreleasedReturnValue();
  v39 = v45;
  if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138543362;
    v50 = v35;
    _os_log_error_impl(&dword_1D207F000, v41, OS_LOG_TYPE_ERROR, "Failed to remove GC'd reference-managed directory: %{public}@", buf, 0xCu);
  }

  v36 = 0;
LABEL_23:

  objc_autoreleasePoolPop(v9);
  return v36;
}

+ (BOOL)_testDeletionEligibilityForManagedDir:(id)a3 withExternalReferenceStore:(id)a4 flockWitness:(TRIFlockWitness_ *)a5 logPrefix:(id)a6 isEligible:(BOOL *)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  BOOL v18;
  NSObject *v19;
  uint64_t v20;
  void *v21;
  NSObject *v22;
  NSObject *v23;
  NSObject *v24;
  char v25;
  BOOL v26;
  BOOL v28;
  int v29;
  int v30;
  uint8_t buf[4];
  id v32;
  __int16 v33;
  _WORD v34[17];

  *(_QWORD *)&v34[13] = *MEMORY[0x1E0C80C00];
  v12 = a3;
  v13 = a4;
  v14 = a6;
  LOBYTE(v30) = 0;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "_metadataDirForManagedDir:", v12);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v15, "fileExistsAtPath:isDirectory:", v16, &v30);

  if (v17)
    v18 = v30 == 0;
  else
    v18 = 1;
  if (v18)
  {
    TRILogCategory_Server();
    v19 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v14;
      v33 = 2114;
      *(_QWORD *)v34 = v12;
      _os_log_error_impl(&dword_1D207F000, v19, OS_LOG_TYPE_ERROR, "%{public}@Attempted to garbage-collect directory which is not reference-managed: %{public}@", buf, 0x16u);
    }

    goto LABEL_21;
  }
  v30 = 0;
  objc_msgSend(a1, "_collectDeadSymlinksForManagedDir:withLockWitness:liveSymlinkCount:", v12, a5, &v30);
  v20 = objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
LABEL_21:
    v26 = 0;
    goto LABEL_22;
  }
  v21 = (void *)v20;
  TRILogCategory_Server();
  v22 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v32 = v14;
    v33 = 1024;
    *(_DWORD *)v34 = v30;
    v34[2] = 2114;
    *(_QWORD *)&v34[3] = v12;
    _os_log_impl(&dword_1D207F000, v22, OS_LOG_TYPE_DEFAULT, "%{public}@GC scan found %u live symlinks into reference-managed directory: %{public}@", buf, 0x1Cu);
  }

  v29 = 0;
  if (!objc_msgSend(a1, "_removePaths:withLockWitness:numRemoved:", v21, a5, &v29))
  {

    goto LABEL_21;
  }
  TRILogCategory_Server();
  v23 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543874;
    v32 = v14;
    v33 = 1024;
    *(_DWORD *)v34 = v29;
    v34[2] = 2114;
    *(_QWORD *)&v34[3] = v12;
    _os_log_impl(&dword_1D207F000, v23, OS_LOG_TYPE_DEFAULT, "%{public}@Removed %u dead symlinks from reference-managed directory: %{public}@", buf, 0x1Cu);
  }

  if (v13 && objc_msgSend(v13, "hasReferenceToPath:", v12))
  {
    TRILogCategory_Server();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v14;
      v33 = 2114;
      *(_QWORD *)v34 = v12;
      _os_log_impl(&dword_1D207F000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@GC scan found a nonzero external reference count for reference-managed directory: %{public}@", buf, 0x16u);
    }
    v25 = 0;
  }
  else
  {
    TRILogCategory_Server();
    v24 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543618;
      v32 = v14;
      v33 = 2114;
      *(_QWORD *)v34 = v12;
      _os_log_impl(&dword_1D207F000, v24, OS_LOG_TYPE_DEFAULT, "%{public}@GC scan found no external references for reference-managed directory: %{public}@", buf, 0x16u);
    }
    v25 = 1;
  }

  if (v30)
    v28 = 0;
  else
    v28 = v25;
  *a7 = v28;
  v26 = 1;
LABEL_22:

  return v26;
}

+ (BOOL)collectGarbageForManagedDir:(id)a3 withExternalReferenceStore:(id)a4 usingTempDir:(id)a5 managedDirWasDeleted:(BOOL *)a6
{
  id v11;
  id v12;
  id v13;
  uint64_t v14;
  NSObject *v15;
  id v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  BOOL v21;
  NSObject *v22;
  NSObject *v23;
  void *v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;
  id v29;
  uint64_t *v30;
  __int128 *v31;
  id v32;
  BOOL *v33;
  _QWORD v34[4];
  NSObject *v35;
  id v36;
  __int128 *v37;
  uint64_t *v38;
  id v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint8_t buf[4];
  NSObject *v45;
  __int128 v46;
  uint64_t v47;
  char v48;
  uint64_t v49;

  v49 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a5;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIReferenceManagedDir.m"), 543, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("managedDir"));

  }
  if (objc_msgSend(v11, "length"))
  {
    if (!v13 || objc_msgSend(v13, "length"))
    {
      *(_QWORD *)&v46 = 0;
      *((_QWORD *)&v46 + 1) = &v46;
      v47 = 0x2020000000;
      v48 = 1;
      if (a6)
        *a6 = 0;
      v40 = 0;
      v41 = &v40;
      v42 = 0x2020000000;
      v43 = 0;
      v14 = MEMORY[0x1E0C809B0];
      v34[0] = MEMORY[0x1E0C809B0];
      v34[1] = 3221225472;
      v34[2] = __115__TRIReferenceManagedDir_collectGarbageForManagedDir_withExternalReferenceStore_usingTempDir_managedDirWasDeleted___block_invoke;
      v34[3] = &unk_1E93353C0;
      v37 = &v46;
      v39 = a1;
      v15 = v11;
      v35 = v15;
      v16 = v12;
      v36 = v16;
      v38 = &v40;
      v17 = objc_msgSend(a1, "_acquireLockOnDir:withLockingMode:andRunBlock:", v15, 5, v34);
      if (v17 != 1)
      {
        if (v17 == 2 || !*(_BYTE *)(*((_QWORD *)&v46 + 1) + 24))
        {
          v21 = 0;
        }
        else
        {
          if (*((_BYTE *)v41 + 24))
          {
            v26[0] = v14;
            v26[1] = 3221225472;
            v26[2] = __115__TRIReferenceManagedDir_collectGarbageForManagedDir_withExternalReferenceStore_usingTempDir_managedDirWasDeleted___block_invoke_44;
            v26[3] = &unk_1E93353E8;
            v30 = &v40;
            v31 = &v46;
            v32 = a1;
            v18 = v15;
            v27 = v18;
            v28 = v16;
            v29 = v13;
            v33 = a6;
            v19 = objc_msgSend(a1, "_acquireLockOnDir:withLockingMode:andRunBlock:", v18, 6, v26);
            if (v19 == 2)
            {
              v21 = 0;
            }
            else
            {
              if (v19 == 1)
              {
                TRILogCategory_Server();
                v20 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v45 = v18;
                  _os_log_impl(&dword_1D207F000, v20, OS_LOG_TYPE_DEFAULT, "[LOCK_EX] GC scan found active usage of reference-managed directory: %{public}@", buf, 0xCu);
                }

              }
              v21 = *(_BYTE *)(*((_QWORD *)&v46 + 1) + 24) != 0;
            }

            v23 = v27;
LABEL_31:

            goto LABEL_32;
          }
          v21 = 1;
        }
LABEL_32:

        _Block_object_dispose(&v40, 8);
        _Block_object_dispose(&v46, 8);
        goto LABEL_33;
      }
      TRILogCategory_Server();
      v23 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v45 = v15;
        _os_log_impl(&dword_1D207F000, v23, OS_LOG_TYPE_DEFAULT, "[LOCK_SH] GC scan found active usage of reference-managed directory: %{public}@", buf, 0xCu);
      }
      v21 = 1;
      goto LABEL_31;
    }
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v46) = 136315138;
      *(_QWORD *)((char *)&v46 + 4) = "+[TRIReferenceManagedDir collectGarbageForManagedDir:withExternalReferenceStore:us"
                                      "ingTempDir:managedDirWasDeleted:]";
      _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "%s has empty path arg: tempDir", (uint8_t *)&v46, 0xCu);
    }
  }
  else
  {
    TRILogCategory_Server();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      LODWORD(v46) = 136315138;
      *(_QWORD *)((char *)&v46 + 4) = "+[TRIReferenceManagedDir collectGarbageForManagedDir:withExternalReferenceStore:us"
                                      "ingTempDir:managedDirWasDeleted:]";
      _os_log_error_impl(&dword_1D207F000, v22, OS_LOG_TYPE_ERROR, "%s has empty path arg: managedDir", (uint8_t *)&v46, 0xCu);
    }
  }

  v21 = 0;
LABEL_33:

  return v21;
}

void __115__TRIReferenceManagedDir_collectGarbageForManagedDir_withExternalReferenceStore_usingTempDir_managedDirWasDeleted___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(*(id *)(a1 + 64), "_testDeletionEligibilityForManagedDir:withExternalReferenceStore:flockWitness:logPrefix:isEligible:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, CFSTR("[LOCK_SH] "), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      v4 = -[TRIDeferredDeleter initForRootDir:]([TRIDeferredDeleter alloc], "initForRootDir:", *(_QWORD *)(a1 + 32));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v4, "collectGarbageWithRootDirLockWitness:externalReferenceStore:", a2, *(_QWORD *)(a1 + 40));

    }
  }
}

uint64_t __115__TRIReferenceManagedDir_collectGarbageForManagedDir_withExternalReferenceStore_usingTempDir_managedDirWasDeleted___block_invoke_44(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
  result = objc_msgSend(*(id *)(a1 + 72), "_testDeletionEligibilityForManagedDir:withExternalReferenceStore:flockWitness:logPrefix:isEligible:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), a2, CFSTR("[LOCK_EX] "), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
  if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24))
  {
    if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
    {
      result = objc_msgSend(*(id *)(a1 + 72), "_deleteReferenceManagedDirectory:usingTempDir:managedDirWasDeleted:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 80));
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = result;
    }
  }
  return result;
}

+ (BOOL)collectDeferredDeletionItemsWithManagedDir:(id)a3
{
  id v5;
  id v6;
  int v7;
  BOOL v8;
  NSObject *v9;
  void *v11;
  _QWORD v12[4];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIReferenceManagedDir.m"), 634, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("managedDir"));

  }
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 1;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__TRIReferenceManagedDir_collectDeferredDeletionItemsWithManagedDir___block_invoke;
  v12[3] = &unk_1E9335410;
  v6 = v5;
  v13 = v6;
  v14 = &v15;
  v7 = objc_msgSend(a1, "_acquireLockOnDir:withLockingMode:andRunBlock:", v6, 5, v12);
  if (v7 == 1)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v20 = v6;
      _os_log_impl(&dword_1D207F000, v9, OS_LOG_TYPE_DEFAULT, "[LOCK_SH] GC scan found active usage of reference-managed directory: %{public}@", buf, 0xCu);
    }

    v8 = 1;
  }
  else
  {
    v8 = v7 != 2 && *((_BYTE *)v16 + 24) != 0;
  }

  _Block_object_dispose(&v15, 8);
  return v8;
}

void __69__TRIReferenceManagedDir_collectDeferredDeletionItemsWithManagedDir___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4;

  v4 = -[TRIDeferredDeleter initForRootDir:]([TRIDeferredDeleter alloc], "initForRootDir:", *(_QWORD *)(a1 + 32));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v4, "collectGarbageWithRootDirLockWitness:externalReferenceStore:", a2, 0);

}

+ (BOOL)isPathInManagedDir:(id)a3
{
  void *v3;
  BOOL v4;

  objc_msgSend(a1, "_containingManagedDirForPath:resolvedAbsPath:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

+ (BOOL)removeFileInManagedDirWithPath:(id)a3 inUseDeletionBehavior:(unsigned __int8)a4 wasDeleted:(BOOL *)a5
{
  int v6;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  NSObject *v14;
  NSObject *v15;
  char v16;
  void *v18;
  char v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v23;
  NSObject *v24;
  NSObject *v25;
  id v26;
  char v27;
  NSObject *v28;
  void *v29;
  _QWORD v30[4];
  id v31;
  __int128 *v32;
  BOOL *v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int128 v37;
  uint64_t v38;
  char v39;
  uint64_t v40;

  v6 = a4;
  v40 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v10 = (void *)MEMORY[0x1D8232A5C]();
  *a5 = 0;
  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRIReferenceManagedDir.m"), 669, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("pathToRemove"));

  }
  if (objc_msgSend(v9, "length"))
  {
    *(_QWORD *)&v37 = 0;
    *((_QWORD *)&v37 + 1) = &v37;
    v38 = 0x2020000000;
    v39 = 0;
    objc_msgSend((id)objc_opt_class(), "_containingManagedDirForPath:resolvedAbsPath:", v9, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "triPath:relativeToParentPath:", v9, v11);
      v13 = objc_claimAutoreleasedReturnValue();

      if (!-[NSObject isEqualToString:](v13, "isEqualToString:", CFSTR(".")))
      {
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        v19 = objc_msgSend(v18, "fileExistsAtPath:", v9);

        if ((v19 & 1) != 0)
        {
          if (v6 == 3)
          {
            objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 0;
            v16 = objc_msgSend(v20, "triForceRemoveItemAtPath:error:", v9, &v34);
            v21 = v34;

            if ((v16 & 1) != 0)
            {
              TRILogCategory_Server();
              v22 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v9;
                _os_log_impl(&dword_1D207F000, v22, OS_LOG_TYPE_DEFAULT, "Successfully removed asset immediately: %@", buf, 0xCu);
              }

              *a5 = 1;
            }
            else
            {
              TRILogCategory_Server();
              v28 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412290;
                v36 = v21;
                _os_log_error_impl(&dword_1D207F000, v28, OS_LOG_TYPE_ERROR, "Failed to remove path: %@", buf, 0xCu);
              }

            }
          }
          else
          {
            v30[0] = MEMORY[0x1E0C809B0];
            v30[1] = 3221225472;
            v30[2] = __90__TRIReferenceManagedDir_removeFileInManagedDirWithPath_inUseDeletionBehavior_wasDeleted___block_invoke;
            v30[3] = &unk_1E9335438;
            v23 = v9;
            v31 = v23;
            v32 = &v37;
            v33 = a5;
            if (objc_msgSend(a1, "_acquireLockOnDir:withLockingMode:andRunBlock:", v11, 6, v30) == 1)
            {
              TRILogCategory_Server();
              v24 = objc_claimAutoreleasedReturnValue();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138543362;
                v36 = v11;
                _os_log_impl(&dword_1D207F000, v24, OS_LOG_TYPE_DEFAULT, "File removal attempt found active usage of reference-managed directory: %{public}@", buf, 0xCu);
              }

              if (v6 == 1)
              {
                TRILogCategory_Server();
                v25 = objc_claimAutoreleasedReturnValue();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138543362;
                  v36 = v23;
                  _os_log_impl(&dword_1D207F000, v25, OS_LOG_TYPE_DEFAULT, "Marking file %{public}@ for deferred deletion", buf, 0xCu);
                }

                v26 = -[TRIDeferredDeleter initForRootDir:]([TRIDeferredDeleter alloc], "initForRootDir:", v11);
                v27 = objc_msgSend(v26, "markItemAtRelativePath:", v13);
                *(_BYTE *)(*((_QWORD *)&v37 + 1) + 24) = v27;

              }
              else
              {
                *(_BYTE *)(*((_QWORD *)&v37 + 1) + 24) = 1;
              }
            }
            v16 = *(_BYTE *)(*((_QWORD *)&v37 + 1) + 24) != 0;

          }
        }
        else
        {
          v16 = 1;
          *a5 = 1;
        }
        goto LABEL_15;
      }
      TRILogCategory_Server();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v36 = v11;
        _os_log_error_impl(&dword_1D207F000, v14, OS_LOG_TYPE_ERROR, "Managed directory file found to be same as root managed directory: %{public}@", buf, 0xCu);
      }

    }
    else
    {
      TRILogCategory_Server();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543362;
        v36 = v9;
        _os_log_error_impl(&dword_1D207F000, v13, OS_LOG_TYPE_ERROR, "Managed directory file at path %{public}@ was not found inside a valid managed directory", buf, 0xCu);
      }
    }
    v16 = 0;
LABEL_15:

    _Block_object_dispose(&v37, 8);
    goto LABEL_16;
  }
  TRILogCategory_Server();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    LODWORD(v37) = 136315138;
    *(_QWORD *)((char *)&v37 + 4) = "+[TRIReferenceManagedDir removeFileInManagedDirWithPath:inUseDeletionBehavior:wasDeleted:]";
    _os_log_error_impl(&dword_1D207F000, v15, OS_LOG_TYPE_ERROR, "%s has empty path arg: pathToRemove", (uint8_t *)&v37, 0xCu);
  }

  v16 = 0;
LABEL_16:
  objc_autoreleasePoolPop(v10);

  return v16;
}

void __90__TRIReferenceManagedDir_removeFileInManagedDirWithPath_inUseDeletionBehavior_wasDeleted___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  NSObject *v6;
  id v7;
  uint8_t buf[4];
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  v4 = objc_msgSend(v2, "triForceRemoveItemAtPath:error:", v3, &v7);
  v5 = v7;

  if ((v4 & 1) != 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    **(_BYTE **)(a1 + 48) = 1;
  }
  else
  {
    TRILogCategory_Server();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v9 = v5;
      _os_log_error_impl(&dword_1D207F000, v6, OS_LOG_TYPE_ERROR, "Failed to remove path: %{public}@", buf, 0xCu);
    }

  }
}

+ (BOOL)saveFromGarbageCollectionItemWithPath:(id)a3
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  NSObject *v9;
  int v11;
  id v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_containingManagedDirForPath:resolvedAbsPath:", v3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[TRIDeferredDeleter initForRootDir:]([TRIDeferredDeleter alloc], "initForRootDir:", v4);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triPath:relativeToParentPath:", v3, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v5, "unmarkItemAtRelativePath:", v7);
  }
  else
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      v11 = 138543362;
      v12 = v3;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Managed directory file at path %{public}@ was not found inside a valid managed directory", (uint8_t *)&v11, 0xCu);
    }

    v8 = 0;
  }

  return v8;
}

@end
