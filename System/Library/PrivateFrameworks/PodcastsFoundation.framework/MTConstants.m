@implementation MTConstants

+ (id)libraryDirectory
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "cachesDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByDeletingLastPathComponent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)cachesDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)managedAssetsDirectoryURL
{
  return (id)objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", CFSTR("/private/var/mobile/Media/Podcasts"), 1);
}

+ (id)streamedMediaAssetURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "preferredAssetCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("StreamedMedia"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void __33__MTConstants_sharedContainerURL__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_DEFAULT, "%@ MTConstants reporting sharedContainerURL: %@", (uint8_t *)&v6, 0x16u);

  }
}

void __39__MTConstants_sharedDocumentsDirectory__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 40), "repairPermissionsOfDirectoryIfNeeded:", *(_QWORD *)(a1 + 32));
  _MTLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_DEFAULT, "%@ MTConstants reporting sharedDocumentsDirectory: %@", (uint8_t *)&v6, 0x16u);

  }
}

void __35__MTConstants_sharedCacheDirectory__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  if (*(_BYTE *)(a1 + 48))
    objc_msgSend(*(id *)(a1 + 40), "repairPermissionsOfDirectoryIfNeeded:", *(_QWORD *)(a1 + 32));
  _MTLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_DEFAULT, "%@ MTConstants reporting sharedCacheDirectory: %@", (uint8_t *)&v6, 0x16u);

  }
}

+ (void)repairPermissionsOfDirectoryIfNeeded:(id)a3
{
  NSObject *v4;
  void *v5;
  void *v6;
  int v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSObject *v18;
  NSObject *v19;
  void *v20;
  void *v21;
  char v22;
  NSObject *v23;
  NSObject *v24;
  NSObject *v25;
  const char *v26;
  NSObject *v27;
  os_log_type_t v28;
  uint32_t v29;
  void *v30;
  void *v31;
  NSObject *v32;
  id v33;
  uint8_t buf[4];
  NSObject *v35;
  __int16 v36;
  void *v37;
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (!getuid())
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSObject path](v4, "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

    if (v7)
    {
      _MTLogCategoryDefault();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v4;
        _os_log_impl(&dword_1A904E000, v8, OS_LOG_TYPE_DEFAULT, "Checking if file permissions need repairing for %@", buf, 0xCu);
      }

      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject path](v4, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v33 = 0;
      objc_msgSend(v9, "attributesOfItemAtPath:error:", v10, &v33);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = v33;

      if (!v11)
      {
        _MTLogCategoryDefault();
        v13 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v12;
          _os_log_impl(&dword_1A904E000, v13, OS_LOG_TYPE_DEFAULT, "Error while reading file attributes: %@", buf, 0xCu);
        }
        goto LABEL_24;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A98]);
      v13 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A58]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A90]);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2A50]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v15, "isEqual:", &unk_1E5538C30) & 1) == 0
        && (objc_msgSend(v16, "isEqual:", &unk_1E5538C30) & 1) == 0)
      {
        _MTLogCategoryDefault();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          v35 = v13;
          v36 = 2112;
          v37 = v14;
          _os_log_impl(&dword_1A904E000, v19, OS_LOG_TYPE_DEFAULT, "Permissions do not need repair. (File owner: %@, File Group Owner: %@)", buf, 0x16u);
        }
        v23 = v12;
        goto LABEL_23;
      }
      v30 = v16;
      v31 = v15;
      v17 = v14;
      _MTLogCategoryDefault();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v35 = v4;
        _os_log_impl(&dword_1A904E000, v18, OS_LOG_TYPE_DEFAULT, "Attempting to repair file permissions for %@", buf, 0xCu);
      }

      objc_msgSend(a1, "attributesForNewDirectory");
      v19 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSObject path](v4, "path");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = v12;
      v22 = objc_msgSend(v20, "setAttributes:ofItemAtPath:error:", v19, v21, &v32);
      v23 = v32;

      _MTLogCategoryDefault();
      v24 = objc_claimAutoreleasedReturnValue();
      v25 = v24;
      if (v23 || (v22 & 1) == 0)
      {
        v14 = v17;
        v16 = v30;
        v15 = v31;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v35 = v23;
          v26 = "Error fixing file permissions: %@";
          v27 = v25;
          v28 = OS_LOG_TYPE_ERROR;
          v29 = 12;
          goto LABEL_18;
        }
      }
      else
      {
        v14 = v17;
        v16 = v30;
        v15 = v31;
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          v26 = "Successfully repaired file permissions.";
          v27 = v25;
          v28 = OS_LOG_TYPE_DEFAULT;
          v29 = 2;
LABEL_18:
          _os_log_impl(&dword_1A904E000, v27, v28, v26, buf, v29);
        }
      }

LABEL_23:
      v12 = v23;
LABEL_24:

    }
  }

}

void __46__MTConstants_managedObjectModelDefinitionURL__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  __int16 v9;
  void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "processName");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "path");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412802;
    v8 = v3;
    v9 = 2112;
    v10 = v5;
    v11 = 2112;
    v12 = v6;
    _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_DEFAULT, "%@ [%@] MTConstants reporting managedObjectModelDefinitionURL as %@", (uint8_t *)&v7, 0x20u);

  }
}

+ (id)ttmlAssetURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "preferredAssetCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("TTML"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)alignmentAssetURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "preferredAssetCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Alignments"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)shazamSignatureAssetURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "preferredAssetCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("ShazamSignatures"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)documentsDirectory
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 9, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "lastObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)artworkAssetURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "preferredAssetCacheURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Artwork"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)preferredAssetCacheURL
{
  void *v3;
  void *v4;
  id v5;
  void *v6;

  objc_msgSend(a1, "sharedAssetsCacheURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = v3;
  }
  else
  {
    objc_msgSend(a1, "dataAssetsCacheURL");
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

+ (id)sharedAssetsCacheURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "sharedCacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Assets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)sharedDocumentsDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v14;
  _QWORD v16[4];
  id v17;
  id v18;
  char v19;
  id v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sharedContainerURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Documents"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "path");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "fileExistsAtPath:", v6);

  v8 = 0;
  if (v4 && (v7 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attributesForNewDirectory");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    v7 = objc_msgSend(v9, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v4, 1, v10, &v20);
    v8 = v20;

  }
  if (!v4 || v8)
  {
    _MTLogCategoryDefault();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v22 = v8;
      _os_log_impl(&dword_1A904E000, v11, OS_LOG_TYPE_ERROR, "Error retrieving shared documents directory: %@", buf, 0xCu);
    }

  }
  v16[0] = MEMORY[0x1E0C809B0];
  v16[1] = 3221225472;
  v16[2] = __39__MTConstants_sharedDocumentsDirectory__block_invoke;
  v16[3] = &unk_1E54D1CD8;
  v19 = v7;
  v18 = a1;
  v12 = v4;
  v17 = v12;
  if (sharedDocumentsDirectory_onceToken != -1)
    dispatch_once(&sharedDocumentsDirectory_onceToken, v16);
  v13 = v17;
  v14 = v12;

  return v14;
}

+ (id)sharedCacheDirectory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  id v9;
  char v10;
  void *v11;
  void *v12;
  int v13;
  NSObject *v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v19[4];
  id v20;
  id v21;
  char v22;
  id v23;
  uint8_t buf[4];
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("243LU875E5.groups.com.apple.podcasts"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("Cache"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v6, "fileExistsAtPath:", v7);

    if ((v8 & 1) != 0)
    {
      v9 = 0;
      goto LABEL_6;
    }
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "attributesForNewDirectory");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = 0;
    v13 = objc_msgSend(v11, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v5, 1, v12, &v23);
    v9 = v23;

    if (v13)
    {
LABEL_6:
      objc_msgSend((id)objc_opt_class(), "excludeDirectoryFromBackup:", v5);
      v10 = 1;
      if (!v9)
        goto LABEL_12;
      goto LABEL_9;
    }
    v10 = 0;
    if (!v9)
      goto LABEL_12;
  }
  else
  {
    v10 = 0;
    v9 = 0;
  }
LABEL_9:
  _MTLogCategoryDefault();
  v14 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v25 = v9;
    _os_log_impl(&dword_1A904E000, v14, OS_LOG_TYPE_ERROR, "Error retrieving shared cache directory: %@", buf, 0xCu);
  }

LABEL_12:
  v19[0] = MEMORY[0x1E0C809B0];
  v19[1] = 3221225472;
  v19[2] = __35__MTConstants_sharedCacheDirectory__block_invoke;
  v19[3] = &unk_1E54D1CD8;
  v22 = v10;
  v21 = a1;
  v15 = v5;
  v20 = v15;
  if (sharedCacheDirectory_onceToken != -1)
    dispatch_once(&sharedCacheDirectory_onceToken, v19);
  v16 = v20;
  v17 = v15;

  return v17;
}

+ (BOOL)excludeDirectoryFromBackup:(id)a3
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  NSObject *v7;
  id v9;
  uint8_t buf[4];
  id v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = *MEMORY[0x1E0C999D8];
  v9 = 0;
  v5 = objc_msgSend(v3, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAB0], v4, &v9);
  v6 = v9;
  if ((v5 & 1) == 0)
  {
    _MTLogCategoryDefault();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v11 = v3;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_1A904E000, v7, OS_LOG_TYPE_ERROR, "Error excluding %@ from backup %@", buf, 0x16u);
    }

  }
  return v5;
}

+ (id)sharedContainerURL
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  _QWORD v10[4];
  id v11;
  id v12;
  uint8_t buf[4];
  const __CFString *v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "containerURLForSecurityApplicationGroupIdentifier:", CFSTR("243LU875E5.groups.com.apple.podcasts"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v12 = 0;
    objc_msgSend(MEMORY[0x1E0CA5898], "bundleRecordWithApplicationIdentifier:error:", CFSTR("com.apple.podcasts"), &v12);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v12;
    if (v5)
    {
      _MTLogCategoryDefault();
      v6 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v14 = CFSTR("com.apple.podcasts");
        v15 = 2112;
        v16 = v5;
        _os_log_impl(&dword_1A904E000, v6, OS_LOG_TYPE_ERROR, "Error creating bundle record with identifier %@: %@", buf, 0x16u);
      }

    }
    objc_msgSend(v4, "groupContainerURLs");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKey:", CFSTR("243LU875E5.groups.com.apple.podcasts"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __33__MTConstants_sharedContainerURL__block_invoke;
  v10[3] = &unk_1E54D0DE0;
  v8 = v3;
  v11 = v8;
  if (sharedContainerURL_onceToken != -1)
    dispatch_once(&sharedContainerURL_onceToken, v10);

  return v8;
}

+ (id)managedObjectModelDefinitionURL
{
  void *v2;
  void *v3;
  id v4;
  _QWORD block[4];
  id v7;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLForResource:withExtension:", CFSTR("MTLibrary"), CFSTR("momd"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __46__MTConstants_managedObjectModelDefinitionURL__block_invoke;
  block[3] = &unk_1E54D0DE0;
  v4 = v3;
  v7 = v4;
  if (managedObjectModelDefinitionURL_onceToken != -1)
    dispatch_once(&managedObjectModelDefinitionURL_onceToken, block);

  return v4;
}

+ (void)_repairFilePermissionsIfNeeded
{
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "sharedContainerURL");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Documents"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "repairPermissionsOfDirectoryIfNeeded:", v3);
  objc_msgSend(v5, "URLByAppendingPathComponent:isDirectory:", CFSTR("Cache"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "repairPermissionsOfDirectoryIfNeeded:", v4);

}

+ (id)attributesForNewDirectory
{
  uint64_t v2;
  _QWORD v4[2];
  _QWORD v5[3];

  v5[2] = *MEMORY[0x1E0C80C00];
  v2 = *MEMORY[0x1E0CB2A58];
  v4[0] = *MEMORY[0x1E0CB2A98];
  v4[1] = v2;
  v5[0] = CFSTR("mobile");
  v5[1] = CFSTR("mobile");
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, v4, 2);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (void)removeExcludeFromBackupFlagFromDirectoryIfNeeded:(id)a3
{
  id v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  v3 = a3;
  if (+[PFClientUtil isPodcastsApp](PFClientUtil, "isPodcastsApp"))
  {
    dispatch_get_global_queue(-2, 0);
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __64__MTConstants_removeExcludeFromBackupFlagFromDirectoryIfNeeded___block_invoke;
    block[3] = &unk_1E54D0DE0;
    v6 = v3;
    dispatch_async(v4, block);

  }
}

void __64__MTConstants_removeExcludeFromBackupFlagFromDirectoryIfNeeded___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  int v4;
  id v5;
  NSObject *v6;
  NSObject *v7;
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  os_log_type_t v11;
  uint32_t v12;
  uint64_t v13;
  id v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = *(void **)(a1 + 32);
  v3 = *MEMORY[0x1E0C999D8];
  v14 = 0;
  v4 = objc_msgSend(v2, "setResourceValue:forKey:error:", MEMORY[0x1E0C9AAA0], v3, &v14);
  v5 = v14;
  _MTLogCategoryDefault();
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v4)
  {
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412290;
      v16 = v8;
      v9 = "Removed 'NSURLIsExcludedFromBackupKey' flag from cache directory %@";
      v10 = v7;
      v11 = OS_LOG_TYPE_INFO;
      v12 = 12;
LABEL_6:
      _os_log_impl(&dword_1A904E000, v10, v11, v9, buf, v12);
    }
  }
  else if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
  {
    v13 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412546;
    v16 = v13;
    v17 = 2112;
    v18 = v5;
    v9 = "Unable to remove extended attributed for %@ - %@";
    v10 = v7;
    v11 = OS_LOG_TYPE_ERROR;
    v12 = 22;
    goto LABEL_6;
  }

}

+ (id)dataAssetsCacheURL
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "cachesDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:", CFSTR("Assets"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_watchManagedAssetsDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  void *v8;
  int v9;
  NSObject *v10;
  id v11;
  void *v12;
  id v13;
  _QWORD v15[4];
  id v16;
  id v17;
  uint8_t buf[4];
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "sharedCacheDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLByAppendingPathComponent:isDirectory:", CFSTR("Episodes"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "path");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  if ((v6 & 1) != 0)
  {
    v7 = 0;
    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v3, 1, 0, &v17);
  v7 = v17;

  if (v9)
  {
LABEL_4:
    if (!v7)
      goto LABEL_8;
  }
  _MTLogCategoryDefault();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412290;
    v19 = v7;
    _os_log_impl(&dword_1A904E000, v10, OS_LOG_TYPE_ERROR, "Error retrieving managed assets directory: %@", buf, 0xCu);
  }

LABEL_8:
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = __46__MTConstants__watchManagedAssetsDirectoryURL__block_invoke;
  v15[3] = &unk_1E54D0DE0;
  v11 = v3;
  v16 = v11;
  if (_watchManagedAssetsDirectoryURL_onceToken != -1)
    dispatch_once(&_watchManagedAssetsDirectoryURL_onceToken, v15);
  v12 = v16;
  v13 = v11;

  return v13;
}

void __46__MTConstants__watchManagedAssetsDirectoryURL__block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _MTLogCategoryDefault();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "processName");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 138412546;
    v7 = v4;
    v8 = 2112;
    v9 = v5;
    _os_log_impl(&dword_1A904E000, v2, OS_LOG_TYPE_DEFAULT, "%@ MTConstants reporting managed assets directory: %@", (uint8_t *)&v6, 0x16u);

  }
}

@end
