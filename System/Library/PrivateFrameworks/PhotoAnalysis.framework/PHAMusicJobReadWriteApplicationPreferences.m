@implementation PHAMusicJobReadWriteApplicationPreferences

+ (void)updateLibraryScopedMusicWorkerPreferencesWithEntriesFromDictionary:(id)a3 keysToRemove:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  char v19;
  NSObject *v20;
  NSObject *v21;
  id v22;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  musicPersistentStorageDirectoryURLForLibrary(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathComponent:", CFSTR("PhotoAnalysisMusicPreferences.plist"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = a1;
    objc_sync_enter(v13);
    +[PHAMusicJobReadWriteApplicationPreferences libraryScopedMusicWorkerPreferencesForLibrary:](PHAMusicJobReadWriteApplicationPreferences, "libraryScopedMusicWorkerPreferencesForLibrary:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v14, "count"))
      objc_msgSend(v15, "addEntriesFromDictionary:", v14);
    if (objc_msgSend(v8, "count"))
      objc_msgSend(v15, "addEntriesFromDictionary:", v8);
    if (objc_msgSend(v9, "count"))
      objc_msgSend(v15, "removeObjectsForKeys:", v9);
    if ((objc_msgSend(v15, "isEqual:", v14) & 1) == 0)
    {
      v24 = 0;
      objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v15, 100, 0, &v24);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = v24;
      v18 = v17;
      if (v16)
      {
        v23 = v17;
        v19 = objc_msgSend(v16, "writeToURL:options:error:", v12, 1073741825, &v23);
        v22 = v23;

        if ((v19 & 1) != 0)
          goto LABEL_14;
        if (__PXLog_genericOnceToken != -1)
          dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_11);
        v20 = __PXLog_genericOSLog;
        if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v22;
          _os_log_error_impl(&dword_1CAC16000, v20, OS_LOG_TYPE_ERROR, "Unable to write library-scoped service preferences for music activity: %{public}@", buf, 0xCu);
          v18 = v22;
        }
        else
        {
LABEL_14:
          v18 = v22;
        }
      }
      else
      {
        if (__PXLog_genericOnceToken != -1)
          dispatch_once(&__PXLog_genericOnceToken, &__block_literal_global_9);
        v21 = __PXLog_genericOSLog;
        if (os_log_type_enabled((os_log_t)__PXLog_genericOSLog, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v26 = v18;
          _os_log_error_impl(&dword_1CAC16000, v21, OS_LOG_TYPE_ERROR, "Unable to serialize library-scoped service preferences for music activity: %{public}@", buf, 0xCu);
        }
      }

    }
    objc_sync_exit(v13);

  }
}

+ (id)libraryScopedMusicWorkerPreferencesForLibrary:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;

  v4 = a3;
  musicPersistentStorageDirectoryURLForLibrary(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:", CFSTR("PhotoAnalysisMusicPreferences.plist"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = a1;
  objc_sync_enter(v7);
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = 0;
  }
  objc_sync_exit(v7);

  return v8;
}

void __139__PHAMusicJobReadWriteApplicationPreferences_updateLibraryScopedMusicWorkerPreferencesWithEntriesFromDictionary_keysToRemove_photoLibrary___block_invoke_10()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

void __139__PHAMusicJobReadWriteApplicationPreferences_updateLibraryScopedMusicWorkerPreferencesWithEntriesFromDictionary_keysToRemove_photoLibrary___block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.photoanalysisd", "generic");
  v1 = (void *)__PXLog_genericOSLog;
  __PXLog_genericOSLog = (uint64_t)v0;

}

@end
