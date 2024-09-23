@implementation IIPaths

+ (id)topDirectory
{
  return (id)objc_msgSend(a1, "topDirectoryCreateIfNeeded:", 1);
}

+ (id)topDirectoryCreateIfNeeded:(BOOL)a3
{
  _QWORD v4[5];
  BOOL v5;

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __38__IIPaths_topDirectoryCreateIfNeeded___block_invoke;
  v4[3] = &__block_descriptor_41_e5_v8__0l;
  v4[4] = a1;
  v5 = a3;
  if (topDirectoryCreateIfNeeded___pasOnceToken2[0] != -1)
    dispatch_once(topDirectoryCreateIfNeeded___pasOnceToken2, v4);
  return (id)topDirectoryCreateIfNeeded___pasExprOnceResult;
}

+ (id)topDirectoryWithName:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  id v20;
  void *v22;
  NSObject *v23;
  NSObject *v24;
  id v25;
  uint8_t buf[4];
  uint64_t v27;
  uint64_t v28;

  v4 = a4;
  v28 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || !objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("IIPaths.m"), 47, CFSTR("failed to construct the root path"));

  }
  v10 = (void *)MEMORY[0x1C3BD74CC]();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v7);
  v11 = objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v10);
  v12 = (void *)topDirectoryWithName_createIfNeeded__dir;
  topDirectoryWithName_createIfNeeded__dir = v11;

  ii_default_log_handle();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    v27 = topDirectoryWithName_createIfNeeded__dir;
    _os_log_debug_impl(&dword_1C3B51000, v13, OS_LOG_TYPE_DEBUG, "using top directory: %@", buf, 0xCu);
  }

  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = 0;
    objc_msgSend(v14, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", topDirectoryWithName_createIfNeeded__dir, 1, 0, &v25);
    v15 = v25;
    v16 = v15;
    if (v15)
    {
      if (objc_msgSend(v15, "code") == 640)
      {
        objc_msgSend(v16, "domain");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

        if (v18)
        {
          ii_default_log_handle();
          v24 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v27 = (uint64_t)v16;
            _os_log_error_impl(&dword_1C3B51000, v24, OS_LOG_TYPE_ERROR, "IIPaths: failed to create directory due to lack of space: %@", buf, 0xCu);
          }

          IIExit(4002);
        }
      }
      if (objc_msgSend(v16, "code") == 513)
      {
        ii_default_log_handle();
        v23 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v27 = (uint64_t)v16;
          _os_log_error_impl(&dword_1C3B51000, v23, OS_LOG_TYPE_ERROR, "IIPaths: failed to create directory due to lack of permissions: %@", buf, 0xCu);
        }

        IIExit(4003);
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("IIPaths.m"), 65, CFSTR("Error creating directory for %@: %@"), v7, v16);

    }
  }
  v20 = (id)topDirectoryWithName_createIfNeeded__dir;

  return v20;
}

+ (id)filename:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x1C3BD74CC]();
  objc_msgSend(a1, "topDirectoryCreateIfNeeded:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return v9;
}

+ (id)suggestionsDirectoryFile:(id)a3
{
  return (id)objc_msgSend(a1, "filename:createIfNeeded:", a3, 1);
}

+ (id)subdirectory:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  void *v16;
  NSObject *v18;
  NSObject *v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  uint8_t buf[4];
  id v24;
  uint64_t v25;

  v4 = a4;
  v25 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  v8 = (void *)MEMORY[0x1C3BD74CC]();
  objc_msgSend(a1, "topDirectoryCreateIfNeeded:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  if (v4)
  {
    v11 = a1;
    objc_sync_enter(v11);
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = 0;
    objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v22);
    v13 = v22;

    objc_sync_exit(v11);
    if (v13)
    {
      if (objc_msgSend(v13, "code") == 640)
      {
        objc_msgSend(v13, "domain");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x1E0CB28A8]);

        if (v15)
        {
          ii_default_log_handle();
          v20 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 138412290;
            v24 = v13;
            _os_log_error_impl(&dword_1C3B51000, v20, OS_LOG_TYPE_ERROR, "IIPaths: failed to create subdirectory due to lack of space: %@", buf, 0xCu);
          }

          if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
          {
            ii_default_log_handle();
            v21 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_fault_impl(&dword_1C3B51000, v21, OS_LOG_TYPE_FAULT, "IIPaths: unable to create directory due to lack of space.", buf, 2u);
            }

          }
          IIExit(4002);
        }
      }
      if (objc_msgSend(v13, "code") == 513)
      {
        ii_default_log_handle();
        v18 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v13;
          _os_log_error_impl(&dword_1C3B51000, v18, OS_LOG_TYPE_ERROR, "IIPaths: failed to create subdirectory due to lack of permissions: %@", buf, 0xCu);
        }

        if (objc_msgSend(MEMORY[0x1E0D81588], "isInternalBuild"))
        {
          ii_default_log_handle();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_1C3B51000, v19, OS_LOG_TYPE_FAULT, "IIPaths: unable to create directory due to lack of permissions.", buf, 2u);
          }

        }
        IIExit(4003);
      }
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, v11, CFSTR("IIPaths.m"), 134, CFSTR("Error creating subdirectory: %@"), v13);

    }
  }

  return v10;
}

+ (id)suggestionsSubdirectory:(id)a3
{
  return (id)objc_msgSend(a1, "subdirectory:createIfNeeded:", a3, 1);
}

+ (id)resourcesDirectory
{
  void *v4;
  void *v5;
  void *v6;
  void *v8;

  v4 = (void *)MEMORY[0x1C3BD74CC]();
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);
  objc_msgSend(v5, "resourcePath");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("IIPaths.m"), 161, CFSTR("Error: Unable to find resource directory"));

  }
  return v6;
}

void __38__IIPaths_topDirectoryCreateIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)MEMORY[0x1C3BD74CC]();
  objc_msgSend(*(id *)(a1 + 32), "topDirectoryWithName:createIfNeeded:", CFSTR("Suggestions"), *(unsigned __int8 *)(a1 + 40));
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)topDirectoryCreateIfNeeded___pasExprOnceResult;
  topDirectoryCreateIfNeeded___pasExprOnceResult = v3;

  objc_autoreleasePoolPop(v2);
}

@end
