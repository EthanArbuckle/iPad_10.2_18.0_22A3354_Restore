@implementation PLCPLPlistHandler

+ (void)initialize
{
  if (initialize_onceToken != -1)
    dispatch_once(&initialize_onceToken, &__block_literal_global_2958);
}

+ (id)_cplPlistURLWithPathManager:(id)a3 verb:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  NSObject *v11;
  id v13;
  uint8_t buf[4];
  id v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  v13 = 0;
  objc_msgSend(v5, "photoDirectoryWithType:leafType:createIfNeeded:error:", 13, 3, 1, &v13);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v13;
  objc_msgSend(v7, "stringByAppendingPathComponent:", CFSTR("mobileCPL.plist"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v9, 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138543874;
      v15 = v6;
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = v8;
      _os_log_impl(&dword_199DF7000, v11, OS_LOG_TYPE_FAULT, "Error %{public}@ mobileCPL.plist, path is nil, pathManager: %@, error: %@", buf, 0x20u);
    }

    v10 = 0;
  }

  return v10;
}

+ (BOOL)CPLPlistFileExistsWithPathManager:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  objc_msgSend(a1, "_cplPlistURLWithPathManager:verb:", a3, CFSTR("checking existence of"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "path");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v4, "fileExistsAtPath:", v5);

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)_readCPLPlistWithPathManager:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  NSObject *v7;
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *v12;
  const char *v13;
  NSObject *v14;
  os_log_type_t v15;
  uint32_t v16;
  id v17;
  uint64_t v18;
  _QWORD block[4];
  id v21;
  uint64_t *v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t (*v33)(uint64_t, uint64_t);
  void (*v34)(uint64_t);
  id v35;
  uint8_t buf[4];
  const char *v37;
  __int16 v38;
  id v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "_cplPlistURLWithPathManager:verb:", v4, CFSTR("reading"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    v30 = 0;
    v31 = &v30;
    v32 = 0x3032000000;
    v33 = __Block_byref_object_copy__2947;
    v34 = __Block_byref_object_dispose__2948;
    v35 = 0;
    v24 = 0;
    v25 = &v24;
    v26 = 0x3032000000;
    v27 = __Block_byref_object_copy__2947;
    v28 = __Block_byref_object_dispose__2948;
    v29 = 0;
    v7 = cplPlistQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __50__PLCPLPlistHandler__readCPLPlistWithPathManager___block_invoke;
    block[3] = &unk_1E3769640;
    v22 = &v24;
    v8 = v5;
    v21 = v8;
    v23 = &v30;
    dispatch_sync(v7, block);
    v9 = (void *)v25[5];
    if (v9)
    {
LABEL_11:
      v17 = v9;

      _Block_object_dispose(&v24, 8);
      _Block_object_dispose(&v30, 8);

      goto LABEL_12;
    }
    v10 = PLIsErrorFileNotFound((void *)v31[5]);
    PLBackendGetLog();
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = v11;
    if (v10)
    {
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 136446466;
        v37 = "+[PLCPLPlistHandler _readCPLPlistWithPathManager:]";
        v38 = 2112;
        v39 = v8;
        v13 = "%{public}s: Could not read mobileCPL.plist at path %@: File doesn't exist";
        v14 = v12;
        v15 = OS_LOG_TYPE_DEFAULT;
        v16 = 22;
LABEL_9:
        _os_log_impl(&dword_199DF7000, v14, v15, v13, buf, v16);
      }
    }
    else if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      v18 = v31[5];
      *(_DWORD *)buf = 136446722;
      v37 = "+[PLCPLPlistHandler _readCPLPlistWithPathManager:]";
      v38 = 2112;
      v39 = v8;
      v40 = 2112;
      v41 = v18;
      v13 = "%{public}s: Error reading mobileCPL.plist at path %@: %@";
      v14 = v12;
      v15 = OS_LOG_TYPE_ERROR;
      v16 = 32;
      goto LABEL_9;
    }

    v9 = (void *)v25[5];
    goto LABEL_11;
  }
  v17 = 0;
LABEL_12:

  return v17;
}

+ (id)readCPLPlistObjectWithKey:(id)a3 pathManager:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v12;
  id v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  objc_msgSend(a1, "_readCPLPlistWithPathManager:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", v6);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PLBackendGetLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      v12 = 138412546;
      v13 = v6;
      v14 = 2112;
      v15 = v9;
      _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_DEBUG, "Reading %@ from mobileCPL.plist: %@", (uint8_t *)&v12, 0x16u);
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (void)saveCPLPlistObject:(id)a3 forKey:(id)a4 pathManager:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  NSObject *v12;
  _QWORD block[4];
  id v14;
  id v15;
  id v16;

  v8 = a3;
  v9 = a4;
  objc_msgSend(a1, "_cplPlistURLWithPathManager:verb:", a5, CFSTR("writing"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v10)
  {
    v12 = cplPlistQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __59__PLCPLPlistHandler_saveCPLPlistObject_forKey_pathManager___block_invoke;
    block[3] = &unk_1E376BBE8;
    v14 = v10;
    v15 = v8;
    v16 = v9;
    dispatch_async(v12, block);

  }
}

+ (void)deleteCPLPlistWithPathManager:(id)a3
{
  void *v3;
  void *v4;
  NSObject *v5;
  _QWORD block[4];
  id v7;

  objc_msgSend(a1, "_cplPlistURLWithPathManager:verb:", a3, CFSTR("deleting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = cplPlistQueue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __51__PLCPLPlistHandler_deleteCPLPlistWithPathManager___block_invoke;
    block[3] = &unk_1E376C6E0;
    v7 = v3;
    dispatch_async(v5, block);

  }
}

void __51__PLCPLPlistHandler_deleteCPLPlistWithPathManager___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  char v4;
  id v5;
  void *v6;
  NSObject *v7;
  uint64_t v8;
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  __int16 v12;
  void *v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1 + 32);
  v9 = 0;
  v4 = objc_msgSend(v2, "removeItemAtURL:error:", v3, &v9);
  v5 = v9;
  v6 = v5;
  if ((v4 & 1) == 0 && (PLIsErrorFileNotFound(v5) & 1) == 0)
  {
    PLBackendGetLog();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      *(_DWORD *)buf = 138412546;
      v11 = v8;
      v12 = 2112;
      v13 = v6;
      _os_log_impl(&dword_199DF7000, v7, OS_LOG_TYPE_ERROR, "Error trying to remove mobileCPL.plist at path %@: %@", buf, 0x16u);
    }

  }
}

void __59__PLCPLPlistHandler_saveCPLPlistObject_forKey_pathManager___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  void *v3;
  id v4;
  NSObject *v5;
  int v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  NSObject *v10;
  const char *v11;
  void *v12;
  id v13;
  uint64_t v14;
  char v15;
  NSObject *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  id v21;
  id v22;
  uint8_t buf[4];
  const char *v24;
  __int16 v25;
  uint64_t v26;
  __int16 v27;
  id v28;
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v2 = a1[4];
  v22 = 0;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v2, &v22);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v22;
  v5 = objc_msgSend(v3, "mutableCopy");

  if (v5)
    goto LABEL_6;
  v6 = PLIsErrorFileNotFound(v4);
  PLBackendGetLog();
  v7 = objc_claimAutoreleasedReturnValue();
  v5 = v7;
  if (v6)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = a1[4];
      *(_DWORD *)buf = 136446466;
      v24 = "+[PLCPLPlistHandler saveCPLPlistObject:forKey:pathManager:]_block_invoke";
      v25 = 2112;
      v26 = v8;
      _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_DEFAULT, "%{public}s: Could not read mobileCPL.plist at path %@: File doesn't exist", buf, 0x16u);
    }

    v5 = objc_alloc_init(MEMORY[0x1E0C99E08]);
LABEL_6:
    v9 = a1[5];
    if (v9)
    {
      -[NSObject setObject:forKey:](v5, "setObject:forKey:", v9, a1[6]);
    }
    else
    {
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        v11 = (const char *)a1[6];
        *(_DWORD *)buf = 138412290;
        v24 = v11;
        _os_log_impl(&dword_199DF7000, v10, OS_LOG_TYPE_DEBUG, "Object is nil, deleting key %@ from mobileCPL.plist", buf, 0xCu);
      }

      -[NSObject removeObjectForKey:](v5, "removeObjectForKey:", a1[6]);
    }
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v5, 100, 0, &v21);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v21;

    if (v12)
    {
      v14 = a1[4];
      v20 = v13;
      v15 = objc_msgSend(v12, "writeToURL:options:error:", v14, 1073741825, &v20);
      v4 = v20;

      if ((v15 & 1) != 0)
      {
LABEL_19:

        goto LABEL_20;
      }
      PLBackendGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = a1[4];
        *(_DWORD *)buf = 138412802;
        v24 = (const char *)v5;
        v25 = 2112;
        v26 = v17;
        v27 = 2112;
        v28 = v4;
        _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_ERROR, "Error saving mobileCPL.plist: %@ at path %@: %@", buf, 0x20u);
      }
      v13 = v4;
    }
    else
    {
      PLBackendGetLog();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v18 = a1[4];
        *(_DWORD *)buf = 138412802;
        v24 = (const char *)v5;
        v25 = 2112;
        v26 = v18;
        v27 = 2112;
        v28 = v13;
        _os_log_impl(&dword_199DF7000, v16, OS_LOG_TYPE_ERROR, "Error trying to serialize data: %@ to write to mobileCPL.plist at path %@: %@", buf, 0x20u);
      }
    }

    v4 = v13;
    goto LABEL_19;
  }
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v19 = a1[4];
    *(_DWORD *)buf = 136446722;
    v24 = "+[PLCPLPlistHandler saveCPLPlistObject:forKey:pathManager:]_block_invoke";
    v25 = 2112;
    v26 = v19;
    v27 = 2112;
    v28 = v4;
    _os_log_impl(&dword_199DF7000, v5, OS_LOG_TYPE_ERROR, "%{public}s: Error reading mobileCPL.plist at path %@: %@", buf, 0x20u);
  }
LABEL_20:

}

void __50__PLCPLPlistHandler__readCPLPlistWithPathManager___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id obj;

  v2 = a1[4];
  v3 = *(_QWORD *)(a1[6] + 8);
  obj = *(id *)(v3 + 40);
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfURL:error:", v2, &obj);
  v4 = objc_claimAutoreleasedReturnValue();
  objc_storeStrong((id *)(v3 + 40), obj);
  v5 = *(_QWORD *)(a1[5] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

void __31__PLCPLPlistHandler_initialize__block_invoke()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_BACKGROUND, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("com.apple.assetsd.PLCPLPlistHandler.cplPlistQueue", v2);
  v1 = (void *)cplPlistQueue;
  cplPlistQueue = (uint64_t)v0;

}

@end
