@implementation PPPaths

+ (id)subdirectory:(id)a3
{
  return +[PPPaths subdirectory:createIfNeeded:]((uint64_t)a1, a3);
}

+ (id)filename:(id)a3 subdirectory:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_self();
  v8 = (void *)MEMORY[0x1C3BD6630]();
  +[PPPaths subdirectory:createIfNeeded:](v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v10;
}

+ (id)logSubdirectory:(id)a3
{
  return +[PPPaths logSubdirectory:createIfNeeded:]((uint64_t)a1, a3);
}

+ (id)filename:(id)a3 logSubdirectory:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a3;
  v6 = a4;
  v7 = objc_opt_self();
  v8 = (void *)MEMORY[0x1C3BD6630]();
  +[PPPaths logSubdirectory:createIfNeeded:](v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v10;
}

+ (id)resourcesDirectory
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v5, "resourcePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("PPPaths.m"), 313, CFSTR("Error: Unable to find resource directory"));

  }
  return v6;
}

+ (id)defaultAssetPathForNamespaceId:(unsigned int)a3 factorName:(id)a4
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = *(_QWORD *)&a3;
  v5 = a4;
  v6 = (void *)MEMORY[0x1C3BD6630]();
  +[PPPaths resourcesDirectory](PPPaths, "resourcesDirectory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("assets_%u"), v4);
  objc_msgSend(v7, "stringByAppendingPathComponent:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "stringByAppendingPathComponent:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v6);
  return v10;
}

+ (id)logSubdirectory:(uint64_t)a1 createIfNeeded:(void *)a2
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v11;
  id v12;

  v2 = a2;
  v3 = (void *)objc_opt_self();
  v4 = (void *)MEMORY[0x1C3BD6630]();
  +[PPPaths logDirectoryCreateIfNeeded:]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  v7 = v3;
  objc_sync_enter(v7);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v12);
  v9 = v12;

  objc_sync_exit(v7);
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", sel_logSubdirectory_createIfNeeded_, v7, CFSTR("PPPaths.m"), 291, CFSTR("Error creating subdirectory for Portrait logs: %@"), v9);

  }
  return v6;
}

+ (id)logDirectoryCreateIfNeeded:
{
  uint64_t v0;
  _QWORD block[6];
  char v3;

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PPPaths_logDirectoryCreateIfNeeded___block_invoke;
  block[3] = &__block_descriptor_49_e5_v8__0l;
  block[4] = sel_logDirectoryCreateIfNeeded_;
  block[5] = v0;
  v3 = 1;
  if (logDirectoryCreateIfNeeded__onceToken != -1)
    dispatch_once(&logDirectoryCreateIfNeeded__onceToken, block);
  return (id)logDirectoryCreateIfNeeded__dir;
}

void __38__PPPaths_logDirectoryCreateIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  NSObject *v17;
  NSObject *v18;
  id v19;
  uint8_t buf[4];
  uint64_t v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("Logs"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);

  if (!v5 || !objc_msgSend(v5, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPPaths.m"), 244, CFSTR("failed to construct the log root path"));

  }
  v6 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v5, "stringByAppendingPathComponent:", CFSTR("PersonalizationPortrait"));
  v7 = objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v6);
  v8 = (void *)logDirectoryCreateIfNeeded__dir;
  logDirectoryCreateIfNeeded__dir = v7;

  pp_default_log_handle();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v21 = logDirectoryCreateIfNeeded__dir;
    _os_log_debug_impl(&dword_1C392E000, v9, OS_LOG_TYPE_DEBUG, "using log directory: %@", buf, 0xCu);
  }

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = 0;
    objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", logDirectoryCreateIfNeeded__dir, 1, 0, &v19);
    v11 = v19;
    v12 = v11;
    if (v11)
    {
      if (objc_msgSend(v11, "code") == 640)
      {
        objc_msgSend(v12, "domain");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

        if (v14)
        {
          pp_default_log_handle();
          v18 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v21 = logDirectoryCreateIfNeeded__dir;
            _os_log_error_impl(&dword_1C392E000, v18, OS_LOG_TYPE_ERROR, "Portrait exiting due to lack of disk space while creating %@", buf, 0xCu);
          }

          PPExit(2002);
        }
      }
      if (objc_msgSend(v12, "code") == 513)
      {
        pp_default_log_handle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v21 = logDirectoryCreateIfNeeded__dir;
          _os_log_error_impl(&dword_1C392E000, v17, OS_LOG_TYPE_ERROR, "Portrait exiting due to lack of write permissions to directory %@", buf, 0xCu);
        }

        PPExit(2003);
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPPaths.m"), 262, CFSTR("Error creating directory for PersonalizationPortrait: %@"), v12);

    }
  }

}

+ (id)subdirectory:(uint64_t)a1 createIfNeeded:(void *)a2
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  int v11;
  void *v12;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  NSObject *v17;
  id v18;
  uint8_t buf[4];
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = a2;
  v3 = (void *)objc_opt_self();
  v4 = (void *)MEMORY[0x1C3BD6630]();
  +[PPPaths topDirectoryCreateIfNeeded:]();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathComponent:", v2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  v7 = v3;
  objc_sync_enter(v7);
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0;
  objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v6, 1, 0, &v18);
  v9 = v18;

  objc_sync_exit(v7);
  if (v9)
  {
    if (objc_msgSend(v9, "code") == 640)
    {
      objc_msgSend(v9, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

      if (v11)
      {
        pp_default_log_handle();
        v16 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v20 = v9;
          _os_log_error_impl(&dword_1C392E000, v16, OS_LOG_TYPE_ERROR, "PPPaths: failed to create subdirectory due to lack of space: %@", buf, 0xCu);
        }

        if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
        {
          pp_default_log_handle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1C392E000, v17, OS_LOG_TYPE_FAULT, "PPPaths: unable to create directory due to lack of space.", buf, 2u);
          }

        }
        PPExit(2002);
      }
    }
    if (objc_msgSend(v9, "code") == 513)
    {
      pp_default_log_handle();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v20 = v9;
        _os_log_error_impl(&dword_1C392E000, v14, OS_LOG_TYPE_ERROR, "PPPaths: failed to create subdirectory due to lack of permissions: %@", buf, 0xCu);
      }

      if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
      {
        pp_default_log_handle();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_1C392E000, v15, OS_LOG_TYPE_FAULT, "PPPaths: unable to create directory due to lack of permissions.", buf, 2u);
        }

      }
      PPExit(2003);
    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", sel_subdirectory_createIfNeeded_, v7, CFSTR("PPPaths.m"), 201, CFSTR("Error creating subdirectory for Portrait info: %@"), v9);

  }
  return v6;
}

+ (id)topDirectoryCreateIfNeeded:
{
  uint64_t v0;
  _QWORD block[6];
  char v3;

  v0 = objc_opt_self();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__PPPaths_topDirectoryCreateIfNeeded___block_invoke;
  block[3] = &__block_descriptor_49_e5_v8__0l;
  block[4] = sel_topDirectoryCreateIfNeeded_;
  block[5] = v0;
  v3 = 1;
  if (topDirectoryCreateIfNeeded__onceToken != -1)
    dispatch_once(&topDirectoryCreateIfNeeded__onceToken, block);
  return (id)topDirectoryCreateIfNeeded__dir;
}

void __38__PPPaths_topDirectoryCreateIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  char v10;
  __int128 v11;
  char v12;
  id v13;
  void *v14;
  void *v15;
  int v16;
  NSObject *v17;
  id v18;
  void *v19;
  NSObject *v20;
  const char *v21;
  NSObject *v22;
  uint32_t v23;
  id v24;
  NSObject *v25;
  __int128 v26;
  id v27;
  id v28;
  uint8_t buf[4];
  uint64_t v30;
  __int16 v31;
  void *v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndexedSubscript:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3 || !objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 40), CFSTR("PPPaths.m"), 124, CFSTR("failed to construct the root path"));

  }
  v4 = (void *)MEMORY[0x1C3BD6630]();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("PersonalizationPortrait"));
  v5 = objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  v6 = (void *)topDirectoryCreateIfNeeded__dir;
  topDirectoryCreateIfNeeded__dir = v5;

  pp_default_log_handle();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v30 = topDirectoryCreateIfNeeded__dir;
    _os_log_debug_impl(&dword_1C392E000, v7, OS_LOG_TYPE_DEBUG, "using top directory: %@", buf, 0xCu);
  }

  if (*(_BYTE *)(a1 + 48))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *MEMORY[0x1E0CB28A8];
    v10 = 1;
    *(_QWORD *)&v11 = 138412546;
    v26 = v11;
    while (1)
    {
      v12 = v10;
      v28 = 0;
      objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", topDirectoryCreateIfNeeded__dir, 1, 0, &v28, v26);
      v13 = v28;
      v14 = v13;
      if (!v13)
        goto LABEL_18;
      if (objc_msgSend(v13, "code") == 640)
      {
        objc_msgSend(v14, "domain");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        v16 = objc_msgSend(v15, "isEqualToString:", v9);

        if (v16)
        {
          pp_default_log_handle();
          v25 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v30 = topDirectoryCreateIfNeeded__dir;
            _os_log_error_impl(&dword_1C392E000, v25, OS_LOG_TYPE_ERROR, "Portrait exiting due to lack of disk space while creating %@", buf, 0xCu);
          }

          PPExit(2002);
        }
      }
      if (objc_msgSend(v14, "code") == 513)
      {
        pp_default_log_handle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v30 = topDirectoryCreateIfNeeded__dir;
          v21 = "Portrait exiting due to lack of write permissions to directory %@";
          v22 = v20;
          v23 = 12;
          goto LABEL_25;
        }
LABEL_26:

        PPExit(2003);
      }
      if (objc_msgSend(v14, "code") != 516)
        break;
      pp_default_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = v26;
        v30 = topDirectoryCreateIfNeeded__dir;
        v31 = 2112;
        v32 = v14;
        _os_log_error_impl(&dword_1C392E000, v17, OS_LOG_TYPE_ERROR, "Portrait deleting file squatting at %@ due to error %@", buf, 0x16u);
      }

      v27 = 0;
      objc_msgSend(v8, "removeItemAtPath:error:", topDirectoryCreateIfNeeded__dir, &v27);
      v18 = v27;
      if (v18)
      {
        v24 = v18;
        pp_default_log_handle();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v26;
          v30 = topDirectoryCreateIfNeeded__dir;
          v31 = 2112;
          v32 = v24;
          v21 = "Portrait exiting due to failure to delete squatter file %@ due to error %@";
          v22 = v20;
          v23 = 22;
LABEL_25:
          _os_log_error_impl(&dword_1C392E000, v22, OS_LOG_TYPE_ERROR, v21, buf, v23);
        }
        goto LABEL_26;
      }
      v10 = 0;
      if ((v12 & 1) == 0)
      {
        v14 = 0;
        goto LABEL_18;
      }
    }
    +[PPFileErrorCode handleError:](PPFileErrorCode, "handleError:", v14);
LABEL_18:

  }
}

@end
