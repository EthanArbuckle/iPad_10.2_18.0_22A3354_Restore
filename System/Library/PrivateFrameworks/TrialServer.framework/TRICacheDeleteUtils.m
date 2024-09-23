@implementation TRICacheDeleteUtils

+ (id)getFreeDiskSpace
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  NSObject *v7;
  NSObject *v8;
  NSObject *v9;
  id v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSHomeDirectory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  objc_msgSend(v2, "attributesOfFileSystemForPath:error:", v3, &v11);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v11;

  if (!v4)
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v13 = v5;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Error reading attributes: %{public}@", buf, 0xCu);
    }
    goto LABEL_9;
  }
  objc_msgSend(v4, "objectForKeyedSubscript:", *MEMORY[0x1E0CB2B00]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    TRILogCategory_Server();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_error_impl(&dword_1D207F000, v9, OS_LOG_TYPE_ERROR, "Filesystem attributes are missing attribute NSFileSystemFreeSize.", buf, 2u);
    }

    v7 = 0;
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v7 = v6;
  v8 = v7;
LABEL_10:

  return v8;
}

+ (id)getPurgeableDiskSpace
{
  NSObject *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  int v10;
  NSObject *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v2 = CacheDeleteCopyPurgeableSpaceWithInfo();
  if (v2)
  {
    v3 = v2;
    -[NSObject objectForKeyedSubscript:](v2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_TOTAL_PURGEABLE"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("/private/var"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      TRILogCategory_Server();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        v10 = 138412290;
        v11 = v3;
        _os_log_error_impl(&dword_1D207F000, v8, OS_LOG_TYPE_ERROR, "Failed to locate purgeable bytes in Cache Delete Info: %@", (uint8_t *)&v10, 0xCu);
      }

    }
  }
  else
  {
    TRILogCategory_Server();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v10) = 0;
      _os_log_error_impl(&dword_1D207F000, v3, OS_LOG_TYPE_ERROR, "Failed to retrieve Cache Delete Info.", (uint8_t *)&v10, 2u);
    }
    v6 = 0;
  }

  return v6;
}

+ (BOOL)hasSufficientDiskSpaceForDownload:(unint64_t)a3
{
  void *v4;
  unint64_t v5;
  unint64_t v6;
  BOOL v7;
  unint64_t v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  NSObject *v12;
  _BOOL4 v13;
  void *v14;
  dispatch_semaphore_t v15;
  NSObject *v16;
  NSObject *v17;
  __int16 v20[8];
  uint64_t v21;
  uint64_t v22;
  void (*v23)(uint64_t, void *);
  void *v24;
  NSObject *v25;
  _BYTE *v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD v29[2];
  _QWORD v30[2];
  _BYTE buf[24];
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[TRICacheDeleteUtils getFreeDiskSpace](TRICacheDeleteUtils, "getFreeDiskSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "unsignedLongLongValue");

  v6 = 2 * a3;
  v7 = 2 * a3 >= v5;
  v8 = 2 * a3 - v5;
  if (v8 != 0 && v7)
  {
    +[TRICacheDeleteUtils getPurgeableDiskSpace](TRICacheDeleteUtils, "getPurgeableDiskSpace");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "unsignedLongLongValue");

    v11 = v10 + v5;
    TRILogCategory_Server();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT);
    if (v10 + v5 < v6)
    {
      if (v13)
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2048;
        v32 = v10;
        _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Insufficient disk space. Free space: %llu, required space: %llu, purgeable space: %llu", buf, 0x20u);
      }

    }
    else
    {
      if (v13)
      {
        *(_DWORD *)buf = 134218496;
        *(_QWORD *)&buf[4] = v5;
        *(_WORD *)&buf[12] = 2048;
        *(_QWORD *)&buf[14] = v6;
        *(_WORD *)&buf[22] = 2048;
        v32 = v10;
        _os_log_impl(&dword_1D207F000, v12, OS_LOG_TYPE_DEFAULT, "Sufficient disk space, if we purge the cache. Free space: %llu, required space: %llu, purgeable space: %llu", buf, 0x20u);
      }

      v29[0] = CFSTR("CACHE_DELETE_VOLUME");
      v29[1] = CFSTR("CACHE_DELETE_AMOUNT");
      v30[0] = 0x1E9343000;
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v8);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v14;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v30, v29, 2);

      *(_QWORD *)buf = 0;
      *(_QWORD *)&buf[8] = buf;
      *(_QWORD *)&buf[16] = 0x2020000000;
      LOBYTE(v32) = 1;
      v15 = dispatch_semaphore_create(0);
      v21 = MEMORY[0x1E0C809B0];
      v22 = 3221225472;
      v23 = __57__TRICacheDeleteUtils_hasSufficientDiskSpaceForDownload___block_invoke;
      v24 = &unk_1E9336230;
      v16 = v15;
      v25 = v16;
      v26 = buf;
      v27 = v5;
      v28 = v6;
      CacheDeletePurgeSpaceWithInfo();
      if (objc_msgSend(MEMORY[0x1E0D81598], "waitForSemaphore:timeoutSeconds:", v16, 120.0))
      {
        TRILogCategory_Server();
        v5 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR))
        {
          v20[0] = 0;
          _os_log_error_impl(&dword_1D207F000, (os_log_t)v5, OS_LOG_TYPE_ERROR, "Timeout while attempting to have CacheDelete purge data before starting download.", (uint8_t *)v20, 2u);
        }

        LOBYTE(v5) = 0;
      }
      else
      {
        LOBYTE(v5) = *(_BYTE *)(*(_QWORD *)&buf[8] + 24) != 0;
      }

      _Block_object_dispose(buf, 8);
    }
    return (v11 >= v6) & v5;
  }
  else
  {
    TRILogCategory_Server();
    v17 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218240;
      *(_QWORD *)&buf[4] = v5;
      *(_WORD *)&buf[12] = 2048;
      *(_QWORD *)&buf[14] = v6;
      _os_log_impl(&dword_1D207F000, v17, OS_LOG_TYPE_DEFAULT, "Sufficient disk space. Free space: %llu, required space: %llu", buf, 0x16u);
    }

    return 1;
  }
}

void __57__TRICacheDeleteUtils_hasSufficientDiskSpaceForDownload___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  uint64_t v17;
  __int16 v18;
  const __CFString *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("CACHE_DELETE_AMOUNT"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v6 = *(_QWORD *)(a1 + 48);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (unint64_t)(objc_msgSend(v4, "unsignedLongLongValue")+ v6) >= *(_QWORD *)(a1 + 56);
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v8 = objc_msgSend(v5, "unsignedLongLongValue");
      v10 = *(_QWORD *)(a1 + 48);
      v9 = *(_QWORD *)(a1 + 56);
      if (*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        v11 = CFSTR("YES");
      else
        v11 = CFSTR("NO");
      v12 = 134218754;
      v13 = v8;
      v14 = 2048;
      v15 = v10;
      v16 = 2048;
      v17 = v9;
      v18 = 2112;
      v19 = v11;
      _os_log_impl(&dword_1D207F000, v7, OS_LOG_TYPE_DEFAULT, "Managed to purge %llu bytes. Free space: %llu, required space: %llu. Sufficient: %@", (uint8_t *)&v12, 0x2Au);
    }
  }
  else
  {
    TRILogCategory_Server();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v12 = 138412290;
      v13 = (uint64_t)a2;
      _os_log_error_impl(&dword_1D207F000, v7, OS_LOG_TYPE_ERROR, "Failed to locate purged bytes in Cache Delete result: %@", (uint8_t *)&v12, 0xCu);
    }
  }

  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

@end
