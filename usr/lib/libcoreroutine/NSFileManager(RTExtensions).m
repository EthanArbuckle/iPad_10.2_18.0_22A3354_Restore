@implementation NSFileManager(RTExtensions)

+ (id)userCacheDirectoryPath
{
  void *v0;
  void *v1;

  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "count"))
  {
    objc_msgSend(v0, "firstObject");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

+ (NSObject)routineCacheDirectoryPath
{
  uint64_t v1;
  void *v2;
  uint64_t v3;
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  NSObject *v9;
  NSObject *v11;
  id v12;
  uint8_t buf[4];
  NSObject *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "userCacheDirectoryPath");
  v1 = objc_claimAutoreleasedReturnValue();
  if (!v1)
    return 0;
  v2 = (void *)v1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultsDomain");
  v3 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
  v4 = objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v5, "fileExistsAtPath:", v4);

  if ((v3 & 1) != 0
    || (objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v12 = 0,
        v7 = objc_msgSend(v6, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v4, 1, 0, &v12),
        v8 = v12,
        v6,
        v7)
    && !v8)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      v14 = v4;
      _os_log_debug_impl(&dword_1D1A22000, v9, OS_LOG_TYPE_DEBUG, "routine cache directory path, %@", buf, 0xCu);
    }
  }
  else
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v4;
      v15 = 2112;
      v16 = v8;
      _os_log_error_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_ERROR, "failed to create %@, error, %@", buf, 0x16u);
    }

    v9 = v4;
    v4 = 0;
  }

  return v4;
}

+ (const)defaultsDomain
{
  return CFSTR("com.apple.routined");
}

+ (uint64_t)frameworkBundle
{
  return objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.CoreRoutine"));
}

+ (id)frameworkDirectoryPath
{
  void *v0;
  void *v1;
  void *v2;

  objc_msgSend(MEMORY[0x1E0CB3620], "frameworkBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleURL");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "absoluteString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (id)pathInCacheDirectory:()RTExtensions
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  NSObject *v16;
  NSObject *v17;
  NSObject *v18;
  NSObject *v19;
  char *v21;
  int v22;
  const char *v23;
  __int16 v24;
  int v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  if (!v3)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v22 = 136315394;
      v23 = "+[NSFileManager(RTExtensions) pathInCacheDirectory:]";
      v24 = 1024;
      v25 = 160;
      _os_log_error_impl(&dword_1D1A22000, v4, OS_LOG_TYPE_ERROR, "Invalid parameter not satisfying: path (in %s:%d)", (uint8_t *)&v22, 0x12u);
    }

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "routineCacheDirectoryPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v3)
  {
    if (v5)
    {
      v7 = (void *)MEMORY[0x1E0C99E98];
      objc_msgSend(v5, "stringByAppendingPathComponent:", v3);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "fileURLWithPath:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "standardizedURL");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "absoluteString");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "absoluteString");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v11, "isEqualToString:", v12);

      if (v13)
      {
        _rt_log_facility_get_os_log(RTLogFacilityGeneral);
        v14 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          objc_msgSend(v10, "path");
          v21 = (char *)objc_claimAutoreleasedReturnValue();
          v22 = 138412290;
          v23 = v21;
          _os_log_debug_impl(&dword_1D1A22000, v14, OS_LOG_TYPE_DEBUG, "path in cache directory, %@", (uint8_t *)&v22, 0xCu);

        }
        objc_msgSend(v10, "path");
        v15 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v15 = 0;
      }

    }
    else
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315394;
        v23 = "+[NSFileManager(RTExtensions) pathInCacheDirectory:]";
        v24 = 1024;
        v25 = 172;
        _os_log_error_impl(&dword_1D1A22000, v18, OS_LOG_TYPE_ERROR, "Cache path was nil (in %s:%d)", (uint8_t *)&v22, 0x12u);
      }

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v19 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_error_impl(&dword_1D1A22000, v19, OS_LOG_TYPE_ERROR, "Cache path was nil", (uint8_t *)&v22, 2u);
      }

      v15 = 0;
    }
  }
  else
  {
    if (!v5)
    {
      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v22 = 136315394;
        v23 = "+[NSFileManager(RTExtensions) pathInCacheDirectory:]";
        v24 = 1024;
        v25 = 164;
        _os_log_error_impl(&dword_1D1A22000, v16, OS_LOG_TYPE_ERROR, "Cache path was nil (in %s:%d)", (uint8_t *)&v22, 0x12u);
      }

      _rt_log_facility_get_os_log(RTLogFacilityGeneral);
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        LOWORD(v22) = 0;
        _os_log_error_impl(&dword_1D1A22000, v17, OS_LOG_TYPE_ERROR, "Cache path was nil", (uint8_t *)&v22, 2u);
      }

    }
    v15 = v6;
  }

  return v15;
}

+ (id)userLibraryPath
{
  void *v0;
  void *v1;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v0, "count"))
  {
    objc_msgSend(v0, "firstObject");
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v1 = 0;
  }

  return v1;
}

+ (id)userPreferencesPath
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "userLibraryPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = v1;
  if (v1)
  {
    objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Preferences"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)routinePreferencesPath
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(a1, "userPreferencesPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "defaultsDomain");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "stringByAppendingPathComponent:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathExtension:", CFSTR("plist"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (id)crashReporterPath
{
  void *v1;
  void *v2;
  void *v3;

  objc_msgSend(a1, "userLibraryPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1)
  {
    objc_msgSend(&unk_1E932C208, "componentsJoinedByString:", CFSTR("/"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "stringByAppendingPathComponent:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v3 = 0;
  }

  return v3;
}

+ (id)sortedContentsOfDirectoryAtURL:()RTExtensions withExtension:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v8, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", v6, 0, 3, &v15);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v15;

  if (v10)
  {
    _rt_log_facility_get_os_log(RTLogFacilityGeneral);
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v6;
      v18 = 2112;
      v19 = v10;
      _os_log_impl(&dword_1D1A22000, v11, OS_LOG_TYPE_INFO, "encountered error getting contents of directory, %@, error, %@", buf, 0x16u);
    }
    v12 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3880], "predicateWithFormat:", CFSTR("%K = %@"), CFSTR("pathExtension"), v7);
    v11 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "filteredArrayUsingPredicate:", v11);
    v13 = objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "sortFilesByName:", v13);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)v13;
  }

  return v12;
}

+ (uint64_t)sortFilesByName:()RTExtensions
{
  return objc_msgSend(a3, "sortedArrayUsingComparator:", &__block_literal_global_27);
}

@end
