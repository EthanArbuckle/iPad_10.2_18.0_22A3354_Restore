@implementation STLocations

+ (NSURL)applicationSupportDirectory
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 14, 1, 0, 0, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;

  if (v5)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.remotemanagementd"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[STLog persistence](STLog, "persistence");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[STLocations applicationSupportDirectory].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("STLocations.m"), 28, CFSTR("applicationSupportDirectory must not be nil"));

    v7 = 0;
  }

  return (NSURL *)v7;
}

+ (NSURL)cachesDirectory
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v17;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  objc_msgSend(v4, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 0, &v17);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v17;

  if (v5)
  {
    objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.ScreenTimeAgent"), 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    +[STLog persistence](STLog, "persistence");
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[STLocations cachesDirectory].cold.1((uint64_t)v6, v8, v9, v10, v11, v12, v13, v14);

    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("STLocations.m"), 41, CFSTR("cachesDirectory must not be nil"));

    v7 = 0;
  }

  return (NSURL *)v7;
}

+ (NSURL)familyPhotosCacheDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "cachesDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("FamilyPhotos"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSURL *)v3;
}

+ (void)applicationSupportDirectory
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Unable to determine data directory: %@", a5, a6, a7, a8, 2u);
}

+ (void)cachesDirectory
{
  OUTLINED_FUNCTION_0(&dword_1D22E7000, a2, a3, "Unable to determine caches directory: %@", a5, a6, a7, a8, 2u);
}

@end
