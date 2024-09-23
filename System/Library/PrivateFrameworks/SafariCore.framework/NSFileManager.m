@implementation NSFileManager

void __71__NSFileManager_SafariNSFileManagerExtras__safari_settingsDirectoryURL__block_invoke(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "safari_safariLibraryDirectory");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "safari_settingsDirectoryForLibraryDirectory:");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_settingsDirectoryURL]::settingsDirectory;
  -[NSFileManager(SafariNSFileManagerExtras) safari_settingsDirectoryURL]::settingsDirectory = v2;

}

void __71__NSFileManager_SafariNSFileManagerExtras__safari_profilesDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "safari_settingsDirectoryURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("Profiles"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_profilesDirectoryURL]::profilesDirectory;
  -[NSFileManager(SafariNSFileManagerExtras) safari_profilesDirectoryURL]::profilesDirectory = v1;

}

void __84__NSFileManager_SafariNSFileManagerExtras__safari_webExtensionsSettingsDirectoryURL__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "safari_settingsDirectoryURL");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("WebExtensions"));
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_webExtensionsSettingsDirectoryURL]::settingsDirectory;
  -[NSFileManager(SafariNSFileManagerExtras) safari_webExtensionsSettingsDirectoryURL]::settingsDirectory = v1;

}

void __73__NSFileManager_SafariNSFileManagerExtras__safari_safariLibraryDirectory__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  objc_msgSend(*(id *)(a1 + 32), "safari_mobileSafariContainerDirectoryURL");
  v2 = objc_claimAutoreleasedReturnValue();
  v9 = (id)v2;
  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_safari_libraryDirectoryForHomeDirectory:", v2);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::safariLibraryDirectory;
    -[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::safariLibraryDirectory = v3;
  }
  else
  {
    v5 = (void *)MEMORY[0x1E0C99E98];
    NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "fileURLWithPath:isDirectory:", v6, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::safariLibraryDirectory;
    -[NSFileManager(SafariNSFileManagerExtras) safari_safariLibraryDirectory]::safariLibraryDirectory = v7;

  }
}

void __105__NSFileManager_SafariNSFileManagerExtras___safari_getMobileSafariContainerDirectoryURL_isContainerized___block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  NSObject *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  uint8_t buf[24];
  _BYTE v10[1024];
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  getpid();
  if (sandbox_container_path_for_pid())
  {
    v8 = 0;
    v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.mobilesafari"), 0, &v8);
    v1 = v8;
    objc_msgSend(v0, "dataContainerURL");
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = (void *)-[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::containerURL;
    -[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::containerURL = v2;

    if (!-[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::containerURL)
    {
      v4 = (id)WBS_LOG_CHANNEL_PREFIXOther();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
      {
        objc_msgSend(v1, "safari_privacyPreservingDescription");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        __105__NSFileManager_SafariNSFileManagerExtras___safari_getMobileSafariContainerDirectoryURL_isContainerized___block_invoke_cold_1(v5, buf, v4);
      }

    }
  }
  else
  {
    v1 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v10);
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v1, 1);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)-[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::containerURL;
    -[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::containerURL = v6;

    -[NSFileManager(SafariNSFileManagerExtras) _safari_getMobileSafariContainerDirectoryURL:isContainerized:]::isContainerized = 1;
  }

}

void __116__NSFileManager_SafariNSFileManagerExtras__safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer__block_invoke()
{
  void *v0;
  id v1;
  uint64_t v2;
  void *v3;
  id v4;

  v4 = 0;
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.mobilesafari"), 0, &v4);
  v1 = v4;
  objc_msgSend(v0, "dataContainerURL");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer]::containerURL;
  -[NSFileManager(SafariNSFileManagerExtras) safari_mobileSafariAppContainerDirectoryURLFromOutsideSafariAppContainer]::containerURL = v2;

}

void __105__NSFileManager_SafariNSFileManagerExtras___safari_getPasswordsAppContainerDirectoryURL_isContainerized___block_invoke()
{
  void *v0;
  _BOOL4 v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  id v8;
  _BYTE v9[1024];
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v0, "safari_isPasswordsAppBundle"))
  {

    goto LABEL_5;
  }
  getpid();
  v1 = sandbox_container_path_for_pid() == 0;

  if (!v1)
  {
LABEL_5:
    v8 = 0;
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CA5870]), "initWithBundleIdentifier:allowPlaceholder:error:", CFSTR("com.apple.Passwords"), 0, &v8);
    v2 = v8;
    objc_msgSend(v5, "dataContainerURL");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)-[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::containerURL;
    -[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::containerURL = v6;

    goto LABEL_6;
  }
  v2 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v9);
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v2, 1);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = (void *)-[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::containerURL;
  -[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::containerURL = v3;

  -[NSFileManager(SafariNSFileManagerExtras) _safari_getPasswordsAppContainerDirectoryURL:isContainerized:]::isContainerized = 1;
LABEL_6:

}

void __85__NSFileManager_SafariNSFileManagerExtras__safari_nonContaineredSettingsDirectoryURL__block_invoke()
{
  uint64_t v0;
  void *v1;
  id v2;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Safari"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_nonContaineredSettingsDirectoryURL]::nonContaineredSettingsDirectoryURL;
  -[NSFileManager(SafariNSFileManagerExtras) safari_nonContaineredSettingsDirectoryURL]::nonContaineredSettingsDirectoryURL = v0;

}

void __84__NSFileManager_SafariNSFileManagerExtras__safari_productionSafariSettingsDirectory__block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "safari_safariLibraryDirectory");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Safari"), 1);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)-[NSFileManager(SafariNSFileManagerExtras) safari_productionSafariSettingsDirectory]::settingsDirectory;
  -[NSFileManager(SafariNSFileManagerExtras) safari_productionSafariSettingsDirectory]::settingsDirectory = v1;

}

uint64_t __133__NSFileManager_SafariNSFileManagerExtras__safari_moveFileAtSubpath_relativeToFileHandle_toUniqueSubpath_relativeToFileHandle_error___block_invoke()
{
  return 0;
}

uint64_t __77__NSFileManager_SafariNSFileManagerExtras__safari_removeContentsOfDirectory___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_privacyPreservingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543875;
    v12 = v9;
    v13 = 2113;
    v14 = v5;
    v15 = 2114;
    v16 = v10;
    _os_log_error_impl(&dword_1B2621000, v7, OS_LOG_TYPE_ERROR, "%{public}@: error while enumerating %{private}@: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  return 1;
}

void __77__NSFileManager_SafariNSFileManagerExtras__safari_removeContentsOfDirectory___block_invoke_51(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  id v9;
  uint8_t buf[4];
  void *v11;
  __int16 v12;
  void *v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(void **)(a1 + 40);
  v9 = 0;
  objc_msgSend(v4, "removeItemAtURL:error:", v3, &v9);
  v5 = v9;
  if (v5)
  {
    v6 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      NSStringFromSelector(*(SEL *)(a1 + 48));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "safari_privacyPreservingDescription");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543875;
      v11 = v7;
      v12 = 2113;
      v13 = v3;
      v14 = 2114;
      v15 = v8;
      _os_log_error_impl(&dword_1B2621000, v6, OS_LOG_TYPE_ERROR, "%{public}@: error while removing %{private}@: %{public}@", buf, 0x20u);

    }
  }

}

uint64_t __76__NSFileManager_SafariNSFileManagerExtras__safari_topLevelDirectoriesAtURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  id v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = (id)WBS_LOG_CHANNEL_PREFIXFileManager();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    NSStringFromSelector(*(SEL *)(a1 + 32));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safari_privacyPreservingDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = 138543875;
    v12 = v9;
    v13 = 2113;
    v14 = v5;
    v15 = 2114;
    v16 = v10;
    _os_log_error_impl(&dword_1B2621000, v7, OS_LOG_TYPE_ERROR, "%{public}@: error while enumerating %{private}@: %{public}@", (uint8_t *)&v11, 0x20u);

  }
  return 1;
}

void __105__NSFileManager_SafariNSFileManagerExtras___safari_getMobileSafariContainerDirectoryURL_isContainerized___block_invoke_cold_1(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138543362;
  *(_QWORD *)(buf + 4) = a1;
  _os_log_fault_impl(&dword_1B2621000, log, OS_LOG_TYPE_FAULT, "Safari received a nil container URL from LSApplicationRecord which must not happen; Safari or some of its components"
    " will crash as a result of this unrecoverable issue: %{public}@",
    buf,
    0xCu);

  OUTLINED_FUNCTION_0_3();
}

@end
