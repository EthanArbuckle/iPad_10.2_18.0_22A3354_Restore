@implementation MOPersistenceUtilities

+ (id)userCacheDirectoryPath
{
  NSArray *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  unsigned __int8 v7;
  void *v8;
  unsigned int v9;
  id v10;
  id os_log;
  NSObject *v12;
  id v13;
  id v14;
  NSObject *v15;
  id v17;

  v2 = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  if (objc_msgSend(v3, "count"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "firstObject"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("com.apple.momentsd")));

    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v7 = objc_msgSend(v6, "fileExistsAtPath:", v5);

    if ((v7 & 1) != 0
      || (v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager")),
          v17 = 0,
          v9 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v17), v10 = v17, v8, v9)&& !v10)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
      v12 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        +[MOPersistenceUtilities userCacheDirectoryPath].cold.1((uint64_t)v5, v12);

      v13 = v5;
    }
    else
    {
      v14 = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
      v15 = objc_claimAutoreleasedReturnValue(v14);
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
        +[MOPersistenceUtilities userCacheDirectoryPath].cold.2();

      v13 = 0;
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

+ (id)userDataDumpDirectoryPathWithSuffix:(id)a3
{
  id v3;
  NSArray *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned __int8 v11;
  void *v12;
  unsigned int v13;
  id v14;
  id v15;
  id os_log;
  NSObject *v18;
  id v19;

  v3 = a3;
  v4 = NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
  if (objc_msgSend(v5, "count"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "firstObject"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("com.apple.momentsd")));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("Temp")));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "stringByAppendingPathComponent:", v3));

    if (!v9)
      goto LABEL_6;
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v11 = objc_msgSend(v10, "fileExistsAtPath:", v9);

    if ((v11 & 1) != 0)
      goto LABEL_6;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSFileManager defaultManager](NSFileManager, "defaultManager"));
    v19 = 0;
    v13 = objc_msgSend(v12, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v19);
    v14 = v19;

    if (!v13 || v14)
    {
      os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
      v18 = objc_claimAutoreleasedReturnValue(os_log);
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        +[MOPersistenceUtilities userDataDumpDirectoryPathWithSuffix:].cold.1();

      v15 = 0;
    }
    else
    {
LABEL_6:
      v15 = v9;
    }

  }
  else
  {
    v15 = 0;
  }

  return v15;
}

+ (id)getBundlingJSONURLWithDirectorySuffix:(id)a3
{
  void *v3;
  void *v4;
  id os_log;
  NSObject *v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[MOPersistenceUtilities userDataDumpDirectoryPathWithSuffix:](MOPersistenceUtilities, "userDataDumpDirectoryPathWithSuffix:", a3));
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSURL fileURLWithPath:isDirectory:](NSURL, "fileURLWithPath:isDirectory:", v3, 1));
  }
  else
  {
    os_log = _mo_log_facility_get_os_log(&MOLogFacilityPersistenceManager);
    v6 = objc_claimAutoreleasedReturnValue(os_log);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      +[MOPersistenceUtilities getBundlingJSONURLWithDirectorySuffix:].cold.1(v6);

    v4 = 0;
  }

  return v4;
}

+ (void)userCacheDirectoryPath
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_0_7();
  _os_log_debug_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_DEBUG, "failed to create %@, error, %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)userDataDumpDirectoryPathWithSuffix:.cold.1()
{
  os_log_t v0;
  uint8_t v1[24];

  OUTLINED_FUNCTION_0_7();
  _os_log_error_impl((void *)&_mh_execute_header, v0, OS_LOG_TYPE_ERROR, "failed to create %@, error, %@", v1, 0x16u);
  OUTLINED_FUNCTION_1();
}

+ (void)getBundlingJSONURLWithDirectorySuffix:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl((void *)&_mh_execute_header, log, OS_LOG_TYPE_ERROR, "Failed to get bundling data dump directory.", v1, 2u);
}

@end
