@implementation NSURL(_QL_Utilities)

- (uint64_t)_QLIsPackageURL
{
  uint64_t v2;
  char v3;
  id v4;
  id v5;
  NSObject **v6;
  NSObject *v7;
  uint64_t v8;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v2 = *MEMORY[0x1E0C99A00];
  v10 = 0;
  v3 = objc_msgSend(a1, "getResourceValue:forKey:error:", &v11, v2, &v10);
  v4 = v11;
  v5 = v10;
  if ((v3 & 1) == 0)
  {
    v6 = (NSObject **)MEMORY[0x1E0D83678];
    v7 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v7 = *v6;
    }
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a1;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1D936E000, v7, OS_LOG_TYPE_ERROR, "Failed to determine if url is package: %@ (%@) #Generic", buf, 0x16u);
    }
  }
  v8 = objc_msgSend(v4, "BOOLValue");

  return v8;
}

- (uint64_t)_QLDownloadingStatusIsNotCurrent
{
  uint64_t v2;
  char v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject **v7;
  NSObject *v8;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v2 = *MEMORY[0x1E0C99B00];
  v10 = 0;
  v3 = objc_msgSend(a1, "getPromisedItemResourceValue:forKey:error:", &v11, v2, &v10);
  v4 = v11;
  v5 = v10;
  if ((v3 & 1) == 0)
  {
    v7 = (NSObject **)MEMORY[0x1E0D83678];
    v8 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a1;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1D936E000, v8, OS_LOG_TYPE_ERROR, "Failed to get download status for url:%@ error:%@ #Generic", buf, 0x16u);
    }
    goto LABEL_9;
  }
  if (!v4 || objc_msgSend(v4, "isEqualToString:", *MEMORY[0x1E0C99AF0]))
  {
LABEL_9:
    v6 = 0;
    goto LABEL_10;
  }
  v6 = 1;
LABEL_10:

  return v6;
}

- (uint64_t)_QLIsHiddenFile
{
  uint64_t v2;
  char v3;
  id v4;
  id v5;
  uint64_t v6;
  NSObject **v7;
  NSObject *v8;
  id v10;
  id v11;
  uint8_t buf[4];
  void *v13;
  __int16 v14;
  id v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0;
  v2 = *MEMORY[0x1E0C999F0];
  v10 = 0;
  v3 = objc_msgSend(a1, "getPromisedItemResourceValue:forKey:error:", &v11, v2, &v10);
  v4 = v11;
  v5 = v10;
  if ((v3 & 1) != 0)
  {
    v6 = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    v7 = (NSObject **)MEMORY[0x1E0D83678];
    v8 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v8 = *v7;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v13 = a1;
      v14 = 2112;
      v15 = v5;
      _os_log_impl(&dword_1D936E000, v8, OS_LOG_TYPE_ERROR, "Failed to determine if file is hidden for url: %@ error: %@ #Generic", buf, 0x16u);
    }
    v6 = 0;
  }

  return v6;
}

- (id)_QLSingleFileSizeForURL:()_QL_Utilities
{
  id v3;
  uint64_t v4;
  char v5;
  id v6;
  id v7;
  NSObject **v8;
  NSObject *v9;
  id v11;
  id v12;
  uint8_t buf[4];
  id v14;
  __int16 v15;
  id v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v12 = 0;
  v4 = *MEMORY[0x1E0C99998];
  v11 = 0;
  v5 = objc_msgSend(v3, "getPromisedItemResourceValue:forKey:error:", &v12, v4, &v11);
  v6 = v12;
  v7 = v11;
  if ((v5 & 1) == 0)
  {
    v8 = (NSObject **)MEMORY[0x1E0D83678];
    v9 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v9 = *v8;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v14 = v3;
      v15 = 2112;
      v16 = v7;
      _os_log_impl(&dword_1D936E000, v9, OS_LOG_TYPE_ERROR, "Error getting the size of file(%@) with error (%@) #Generic", buf, 0x16u);
    }
  }

  return v6;
}

- (id)_QLUrlFileSize
{
  void *v1;
  uint64_t v2;
  char v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  NSObject **v10;
  NSObject *v11;
  void *v12;
  NSObject **v13;
  NSObject *v14;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t i;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  id v32;
  id obj;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  id v38;
  id v39;
  id v40;
  uint8_t v41[128];
  uint8_t buf[4];
  void *v43;
  __int16 v44;
  id v45;
  uint64_t v46;

  v1 = a1;
  v46 = *MEMORY[0x1E0C80C00];
  if ((objc_msgSend(a1, "_QLDownloadingStatusIsNotCurrent") & 1) != 0)
    goto LABEL_15;
  v40 = 0;
  v2 = *MEMORY[0x1E0C999D0];
  v39 = 0;
  v3 = objc_msgSend(v1, "getResourceValue:forKey:error:", &v40, v2, &v39);
  v4 = v40;
  v5 = v39;
  if ((v3 & 1) == 0)
  {
    v13 = (NSObject **)MEMORY[0x1E0D83678];
    v14 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v1;
      v44 = 2112;
      v45 = v5;
      _os_log_impl(&dword_1D936E000, v14, OS_LOG_TYPE_ERROR, "Failed to determine if the URL (%@) is a directory error: %@ #Generic", buf, 0x16u);
    }
    goto LABEL_14;
  }
  if (!objc_msgSend(v4, "BOOLValue"))
  {
LABEL_14:

LABEL_15:
    objc_msgSend(v1, "_QLSingleFileSizeForURL:", v1, v28, v29, v30, v31, v32);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    return v12;
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0;
  objc_msgSend(v6, "contentsOfDirectoryAtPath:error:", v7, &v38);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v38;

  if (v9)
  {
    v10 = (NSObject **)MEMORY[0x1E0D83678];
    v11 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v43 = v1;
      v44 = 2112;
      v45 = v9;
      _os_log_impl(&dword_1D936E000, v11, OS_LOG_TYPE_ERROR, "Failed to get the contents of folder at URL (%@) with error: %@ #Generic", buf, 0x16u);
    }
    v12 = 0;
  }
  else
  {
    v28 = 0;
    v29 = v8;
    v30 = v6;
    v31 = v5;
    v32 = v4;
    v36 = 0u;
    v37 = 0u;
    v34 = 0u;
    v35 = 0u;
    obj = v8;
    v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
    if (v16)
    {
      v17 = v16;
      v18 = 0;
      v19 = *(_QWORD *)v35;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v35 != v19)
            objc_enumerationMutation(obj);
          v21 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
          v22 = (void *)MEMORY[0x1E0C99E98];
          objc_msgSend(v1, "path", v28, v29, v30, v31, v32);
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringByAppendingPathComponent:", v21);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "fileURLWithPath:", v24);
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "_QLUrlFileSize");
          v26 = v1;
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          v18 += objc_msgSend(v27, "unsignedLongLongValue");

          v1 = v26;
        }
        v17 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v34, v41, 16);
      }
      while (v17);
    }
    else
    {
      v18 = 0;
    }

    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", v18);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v31;
    v4 = v32;
    v8 = v29;
    v6 = v30;
    v9 = v28;
  }

  if (!v12)
    goto LABEL_15;
  return v12;
}

+ (id)_QLCreateTemporaryDirectory:()_QL_Utilities
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  id v12;
  NSObject **v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  void *v18;
  __int16 v19;
  id v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "fileURLWithPath:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3A28], "UUID");
  v7 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v7, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "URLByAppendingPathComponent:isDirectory:", v8, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0;
  LOBYTE(v7) = objc_msgSend(v10, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v9, 1, 0, &v16);
  v11 = v16;

  if ((v7 & 1) != 0)
  {
    v12 = v9;
  }
  else
  {
    v13 = (NSObject **)MEMORY[0x1E0D83678];
    v14 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v14 = *v13;
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v18 = v9;
      v19 = 2112;
      v20 = v11;
      _os_log_impl(&dword_1D936E000, v14, OS_LOG_TYPE_ERROR, "Failed to create a temporary directory URL for URL: %@. Error: %@ #Generic", buf, 0x16u);
    }
    v12 = 0;
    if (a3)
      *a3 = objc_retainAutorelease(v11);
  }

  return v12;
}

+ (id)_QLTemporaryFileURLWithType:()_QL_Utilities filename:
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a4;
  objc_msgSend(a3, "preferredFilenameExtension");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0C99E98];
  NSTemporaryDirectory();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "fileURLWithPath:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "URLByAppendingPathComponent:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "URLByAppendingPathExtension:", v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)_QLTemporaryFileURLWithType:()_QL_Utilities uuid:
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)MEMORY[0x1E0C99E98];
  v6 = a3;
  objc_msgSend(a4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_QLTemporaryFileURLWithType:filename:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (void)_QLTemporaryFileURLWithType:()_QL_Utilities forOriginalFileAtURL:temporaryFileURL:temporaryDirectoryURL:fallbackUUID:
{
  id v11;
  id v12;
  id v13;
  void *v14;
  void *v15;
  NSObject **v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  id v21;
  void *v22;
  NSObject *v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v11 = a3;
  v12 = a4;
  v13 = a7;
  objc_msgSend(v11, "preferredFilenameExtension");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = *a6;
  if (*a6)
    goto LABEL_9;
  v16 = (NSObject **)MEMORY[0x1E0D83678];
  v17 = *MEMORY[0x1E0D83678];
  if (!*MEMORY[0x1E0D83678])
  {
    QLSInitLogging();
    v17 = *v16;
  }
  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1D936E000, v17, OS_LOG_TYPE_INFO, "No temporary directory passed from host #Generic", buf, 2u);
  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0;
  objc_msgSend(v18, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v12, 1, &v24);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v24;

  if (v19 && !v20)
  {
    v21 = objc_retainAutorelease(v19);
    *a6 = v21;

    v15 = *a6;
LABEL_9:
    objc_msgSend(v12, "URLByDeletingPathExtension");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "lastPathComponent");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "URLByAppendingPathComponent:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "URLByAppendingPathExtension:", v14);
    *a5 = (id)objc_claimAutoreleasedReturnValue();

    goto LABEL_10;
  }
  v23 = *v16;
  if (!*v16)
  {
    QLSInitLogging();
    v23 = *v16;
  }
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)buf = 138412546;
    v26 = v12;
    v27 = 2112;
    v28 = v20;
    _os_log_impl(&dword_1D936E000, v23, OS_LOG_TYPE_ERROR, "Failed to create a temporary directory URL for URL: %@. Error: %@ #Generic", buf, 0x16u);
  }
  if (a5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "_QLTemporaryFileURLWithType:uuid:", v11, v13);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_10:

}

+ (id)_QLCreateTemporaryDirectoryForOriginalFileAtURL:()_QL_Utilities error:
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  BOOL v9;
  NSObject **v10;
  NSObject *v11;
  id v12;
  void *v13;
  id v15;
  uint8_t buf[4];
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_msgSend(v6, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v5, 1, &v15);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v15;

  if (v7)
    v9 = v8 == 0;
  else
    v9 = 0;
  if (v9)
  {
    v12 = v7;
  }
  else
  {
    v10 = (NSObject **)MEMORY[0x1E0D83678];
    v11 = *MEMORY[0x1E0D83678];
    if (!*MEMORY[0x1E0D83678])
    {
      QLSInitLogging();
      v11 = *v10;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v17 = v5;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_1D936E000, v11, OS_LOG_TYPE_ERROR, "Failed to create a temporary directory URL for URL: %@. Error: %@ #Generic", buf, 0x16u);
    }
    objc_msgSend(MEMORY[0x1E0C99E98], "_QLCreateTemporaryDirectory:", a4);
    v12 = (id)objc_claimAutoreleasedReturnValue();
  }
  v13 = v12;

  return v13;
}

@end
