@implementation SABinaryLocator

- (id)mappings
{
  id *v1;
  id v2;
  id v3;
  void *v5;
  uint64_t v6;
  id v7;
  const __CFDictionary *v8;
  const __CFDictionary *v9;
  uint64_t v10;
  id v11;
  int v12;
  NSObject *v13;
  __CFString *v14;
  id v15;
  const char *v16;
  int v17;
  NSObject *v18;
  int v19;
  NSObject *v20;
  int v21;
  NSObject *v22;
  int v23;
  NSObject *v24;
  int v25;
  uint64_t v26;
  const __CFString *v27;
  int v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  char v36;
  _QWORD v37[5];
  uint8_t buf[4];
  const __CFString *v39;
  __int16 v40;
  uint64_t v41;
  uint64_t v42;

  v42 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_sync_enter(v1);
  v2 = v1[1];
  if (v2 || !*((_BYTE *)v1 + 25))
  {
LABEL_2:
    v3 = v2;
    goto LABEL_3;
  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D80]), "initWithContentsOfFile:", CFSTR("/var/db/spindump/UUIDToBinaryLocations"));
  v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v5, "count"));
  v7 = v1[1];
  v1[1] = (id)v6;

  if (!v1[2])
  {
    v8 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
    v9 = v8;
    if (!v8)
    {
      v19 = *__error();
      _sa_logt();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1B9BE0000, v20, OS_LOG_TYPE_FAULT, "No system version", buf, 2u);
      }

      *__error() = v19;
      if (v5)
        goto LABEL_13;
      goto LABEL_25;
    }
    CFDictionaryGetValue(v8, (const void *)*MEMORY[0x1E0C9AB90]);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v1[2];
    v1[2] = (id)v10;

    if (!v1[2])
    {
      v12 = *__error();
      _sa_logt();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_fault_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_FAULT, "No build number", buf, 2u);
      }

      *__error() = v12;
    }
    CFRelease(v9);
  }
  if (!v5)
  {
LABEL_25:
    v21 = *__error();
    _sa_logt();
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B9BE0000, v22, OS_LOG_TYPE_DEFAULT, "WARNING: Unable to open binary locator database", buf, 2u);
    }

    *__error() = v21;
    v2 = v1[1];
    goto LABEL_2;
  }
LABEL_13:
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("build_number"));
  v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
  v15 = v1[2];
  if (!v15 || v14 && (objc_msgSend(v15, "isEqualToString:", v14) & 1) != 0)
  {
    v37[0] = MEMORY[0x1E0C809B0];
    v37[1] = 3221225472;
    v37[2] = __27__SABinaryLocator_mappings__block_invoke;
    v37[3] = &unk_1E71473E8;
    v37[4] = v1;
    objc_msgSend(v5, "enumerateKeysAndObjectsUsingBlock:", v37);
    v3 = v1[1];

  }
  else
  {
    v16 = (const char *)objc_msgSend(CFSTR("/var/db/spindump/UUIDToBinaryLocations"), "UTF8String");
    if (!v16)
    {
      v28 = *__error();
      _sa_logt();
      v29 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)buf = 0;
        _os_log_error_impl(&dword_1B9BE0000, v29, OS_LOG_TYPE_ERROR, "No cstring path for nsstring path", buf, 2u);
      }

      *__error() = v28;
      _SASetCrashLogMessage(110, "No cstring path for nsstring path", v30, v31, v32, v33, v34, v35, v36);
      _os_crash();
      __break(1u);
    }
    if (unlink(v16))
    {
      v17 = *__error();
      _sa_logt();
      v18 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        v25 = *__error();
        *(_DWORD *)buf = 138412546;
        v39 = CFSTR("/var/db/spindump/UUIDToBinaryLocations");
        v40 = 1024;
        LODWORD(v41) = v25;
        _os_log_error_impl(&dword_1B9BE0000, v18, OS_LOG_TYPE_ERROR, "Unable to unlink old binary locator file %@: %{errno}d", buf, 0x12u);
      }

      *__error() = v17;
    }
    else
    {
      v23 = *__error();
      _sa_logt();
      v24 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        v26 = objc_msgSend(v5, "count");
        v27 = CFSTR("unknown");
        if (v14)
          v27 = v14;
        *(_DWORD *)buf = 138412546;
        v39 = v27;
        v40 = 2048;
        v41 = v26;
        _os_log_debug_impl(&dword_1B9BE0000, v24, OS_LOG_TYPE_DEBUG, "Deleted old binary locator file from old build %@ with %ld items", buf, 0x16u);
      }

      *__error() = v23;
    }

    v3 = v1[1];
  }

LABEL_3:
  objc_sync_exit(v1);

  return v3;
}

- (void)done
{
  NSMutableDictionary *mappings;
  SABinaryLocator *obj;

  obj = self;
  objc_sync_enter(obj);
  if (!--_MergedGlobals_10)
  {
    if (obj->_enabled)
      -[SABinaryLocator _saveMappings](obj);
    mappings = obj->_mappings;
    obj->_mappings = 0;

  }
  objc_sync_exit(obj);

}

- (SABinaryLocator)init
{
  id v2;

  objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", CFSTR("You must call sharedBinaryLocator"), 0, 0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v2);
}

+ (id)sharedBinaryLocator
{
  id v2;

  if (qword_1ED1DD960 != -1)
    dispatch_once(&qword_1ED1DD960, &__block_literal_global_14);
  v2 = (id)qword_1ED1DD958;
  objc_sync_enter(v2);
  ++_MergedGlobals_10;
  objc_sync_exit(v2);

  return (id)qword_1ED1DD958;
}

void __38__SABinaryLocator_sharedBinaryLocator__block_invoke()
{
  SABinaryLocator *v0;
  void *v1;
  objc_super v2;

  v0 = [SABinaryLocator alloc];
  if (v0)
  {
    v2.receiver = v0;
    v2.super_class = (Class)SABinaryLocator;
    v0 = (SABinaryLocator *)objc_msgSendSuper2(&v2, sel_init);
    if (v0)
      v0->_enabled = 1;
  }
  v1 = (void *)qword_1ED1DD958;
  qword_1ED1DD958 = (uint64_t)v0;

}

- (void)_saveMappings
{
  id *v1;
  void *v2;
  id v3;
  id v4;
  int v5;
  NSObject *v6;
  int v7;
  NSObject *v8;
  int *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  int v14;
  NSObject *v15;
  int v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  int v20;
  int *v21;
  char *v22;
  int v23;
  int *v24;
  char *v25;
  char *v26;
  id v27;
  stat v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  const char *v32;
  __int16 v33;
  int v34;
  __int16 v35;
  char *v36;
  uint64_t v37;

  v37 = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = a1;
    objc_sync_enter(v1);
    if (!*((_BYTE *)v1 + 24) || geteuid())
      goto LABEL_29;
    if (v1[1])
    {
      v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(v1[1], "count") + 1);
      v3 = v1[1];
      v29[0] = MEMORY[0x1E0C809B0];
      v29[1] = 3221225472;
      v29[2] = __32__SABinaryLocator__saveMappings__block_invoke;
      v29[3] = &unk_1E7149F40;
      v4 = v2;
      v30 = v4;
      objc_msgSend(v3, "enumerateKeysAndObjectsUsingBlock:", v29);
      objc_msgSend(v4, "setObject:forKeyedSubscript:", v1[2], CFSTR("build_number"));
      memset(&v28, 0, sizeof(v28));
      if (stat("/var/db/spindump", &v28))
      {
        if (*__error() != 2)
        {
          v7 = *__error();
          _sa_logt();
          v15 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
          {
            v20 = *__error();
            v21 = __error();
            v22 = strerror(*v21);
            *(_DWORD *)buf = 136315650;
            v32 = "/var/db/spindump";
            v33 = 1024;
            v34 = v20;
            v35 = 2080;
            v36 = v22;
            _os_log_error_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_ERROR, "Unable to stat %s: %d %s", buf, 0x1Cu);
          }

          v9 = __error();
          goto LABEL_19;
        }
        v5 = *__error();
        _sa_logt();
        v6 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 136315138;
          v32 = "/var/db/spindump";
          _os_log_debug_impl(&dword_1B9BE0000, v6, OS_LOG_TYPE_DEBUG, "Creating nugget directory %s", buf, 0xCu);
        }

        *__error() = v5;
        if (mkdir("/var/db/spindump", 0x1EDu))
        {
          v7 = *__error();
          _sa_logt();
          v8 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
          {
            v23 = *__error();
            v24 = __error();
            v25 = strerror(*v24);
            *(_DWORD *)buf = 136315650;
            v32 = "/var/db/spindump";
            v33 = 1024;
            v34 = v23;
            v35 = 2080;
            v36 = v25;
            _os_log_error_impl(&dword_1B9BE0000, v8, OS_LOG_TYPE_ERROR, "Unable to create %s: %d %s", buf, 0x1Cu);
          }

          v9 = __error();
LABEL_19:
          *v9 = v7;

LABEL_29:
          objc_sync_exit(v1);

          return;
        }
      }
      v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E48]), "initToFileAtPath:append:", CFSTR("/var/db/spindump/UUIDToBinaryLocations"), 0);
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "open");
        v27 = 0;
        v12 = objc_msgSend(MEMORY[0x1E0CB38B0], "writePropertyList:toStream:format:options:error:", v4, v11, 200, 0, &v27);
        v13 = v27;
        objc_msgSend(v11, "close");
        if (v12)
        {
          v14 = 0;
        }
        else
        {
          v18 = *__error();
          _sa_logt();
          v19 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            objc_msgSend(v13, "debugDescription");
            v26 = (char *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v32 = v26;
            _os_log_error_impl(&dword_1B9BE0000, v19, OS_LOG_TYPE_ERROR, "Unable to save mappings: %@", buf, 0xCu);

          }
          *__error() = v18;
          v14 = 1;
        }

      }
      else
      {
        v16 = *__error();
        _sa_logt();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_WORD *)buf = 0;
          _os_log_error_impl(&dword_1B9BE0000, v17, OS_LOG_TYPE_ERROR, "Unable to create stream for binary locator path", buf, 2u);
        }

        *__error() = v16;
        v14 = 1;
      }

      if (v14)
        goto LABEL_29;
    }
    *((_BYTE *)v1 + 24) = 0;
    goto LABEL_29;
  }
}

void __27__SABinaryLocator_mappings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("build_number")) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    uuidForString(v8);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 8), "setObject:forKey:", v6, v7);

  }
}

void __32__SABinaryLocator__saveMappings__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  NSObject *v12;
  int v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v7 = (id)objc_claimAutoreleasedReturnValue();

    if (v7 != v6)
    {
      objc_msgSend(v6, "path");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        v9 = *(void **)(a1 + 32);
        objc_msgSend(v5, "UUIDString");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "setObject:forKey:", v8, v10);

      }
      else
      {
        v11 = *__error();
        _sa_logt();
        v12 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          v13 = 136315138;
          v14 = objc_msgSend(objc_retainAutorelease(v6), "fileSystemRepresentation");
          _os_log_impl(&dword_1B9BE0000, v12, OS_LOG_TYPE_DEFAULT, "WARNING: Unable to get path for %s", (uint8_t *)&v13, 0xCu);
        }

        *__error() = v11;
      }

    }
  }

}

- (id)urlForUUID:(_BYTE *)a1
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  int v13;
  NSObject *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  NSObject *v20;
  void *v21;
  int v22;
  void *v23;
  int v24;
  NSObject *v25;
  void *v26;
  uint8_t buf[4];
  void *v29;
  __int16 v30;
  _QWORD v31[3];
  _QWORD v32[3];

  v32[2] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (a1 && a1[25])
  {
    -[SABinaryLocator mappings](a1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (id)objc_claimAutoreleasedReturnValue();

      if (v5 == v6)
      {
        v12 = 0;
        goto LABEL_23;
      }
      objc_msgSend(v5, "path");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7)
      {
        v8 = (void *)v7;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "path");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v9, "fileExistsAtPath:", v10);

        if (v11)
        {
          v5 = v5;
          v12 = v5;
LABEL_23:

          goto LABEL_24;
        }
      }
      v13 = *__error();
      _sa_logt();
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        objc_msgSend(v3, "UUIDString");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "path");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v29 = v15;
        v30 = 2112;
        v31[0] = v16;
        _os_log_impl(&dword_1B9BE0000, v14, OS_LOG_TYPE_INFO, "Found stale entry for UUID %@, mapping to non-existent path %@. This will be ignored and evicted from the cache.", buf, 0x16u);

      }
      *__error() = v13;
      a1[24] = 1;
      -[SABinaryLocator mappings](a1);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "removeObjectForKey:", v3);

    }
    v32[0] = 0;
    v32[1] = 0;
    objc_msgSend(v3, "getUUIDBytes:", v32);
    OSLogLookupPathWithUUID();
    SAFilepathForCString(0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v18, "isAbsolutePath"))
    {
      v19 = *__error();
      _sa_logt();
      v20 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v29 = v18;
        v30 = 1040;
        LODWORD(v31[0]) = 16;
        WORD2(v31[0]) = 2096;
        *(_QWORD *)((char *)v31 + 6) = v32;
        _os_log_debug_impl(&dword_1B9BE0000, v20, OS_LOG_TYPE_DEBUG, "Got %@ for %{uuid_t}.16P from libtrace", buf, 0x1Cu);
      }

      *__error() = v19;
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v21, "fileExistsAtPath:", v18);

      if (v22)
      {
        v23 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v18, 0);

        -[SABinaryLocator addURL:ForUUID:](a1, v23, v3);
        v5 = v23;
        v12 = v5;
      }
      else
      {
        v24 = *__error();
        _sa_logt();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(v3, "UUIDString");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412546;
          v29 = v26;
          v30 = 2080;
          v31[0] = 0;
          _os_log_impl(&dword_1B9BE0000, v25, OS_LOG_TYPE_INFO, "OSLogLookupPathWithUUID returned stale entry for UUID %@; path %s doesn't exist. This will be ignored.",
            buf,
            0x16u);

        }
        v12 = 0;
        *__error() = v24;
      }
    }
    else
    {
      v12 = 0;
    }

    goto LABEL_23;
  }
  v12 = 0;
LABEL_24:

  return v12;
}

- (uint64_t)addURL:(void *)a3 ForUUID:
{
  id v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  const char *v10;
  const char *v11;
  int v12;
  NSObject *v13;
  int v14;
  NSObject *v15;
  _BYTE *v16;
  void *v17;
  void *v18;
  int v20;
  stat v21;
  uint8_t buf[4];
  const char *v23;
  __int16 v24;
  int v25;
  statfs v26;
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!a1 || !a1[25])
    goto LABEL_17;
  v8 = 0;
  if (!v5 || !v6)
    goto LABEL_18;
  v9 = objc_retainAutorelease(v5);
  v10 = (const char *)objc_msgSend(v9, "fileSystemRepresentation");
  if (!v10)
  {
LABEL_15:
    v16 = a1;
    objc_sync_enter(v16);
    -[SABinaryLocator mappings](v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "objectForKey:", v7);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v18)
    {
      v16[24] = 1;
      objc_msgSend(v17, "setObject:forKey:", v9, v7);

      objc_sync_exit(v16);
      v8 = 1;
      goto LABEL_18;
    }

    objc_sync_exit(v16);
    goto LABEL_17;
  }
  v11 = v10;
  memset(&v21, 0, sizeof(v21));
  if (stat(v10, &v21))
  {
LABEL_17:
    v8 = 0;
    goto LABEL_18;
  }
  memset(&v26, 0, 512);
  if (statfs(v11, &v26))
  {
    v12 = *__error();
    _sa_logt();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      v20 = *__error();
      *(_DWORD *)buf = 136315394;
      v23 = v11;
      v24 = 1024;
      v25 = v20;
      _os_log_debug_impl(&dword_1B9BE0000, v13, OS_LOG_TYPE_DEBUG, "Unable to statfs %s: %{errno}d", buf, 0x12u);
    }

    *__error() = v12;
    goto LABEL_15;
  }
  if (v26.f_type != 22)
    goto LABEL_15;
  v14 = *__error();
  _sa_logt();
  v15 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 136315138;
    v23 = v11;
    _os_log_debug_impl(&dword_1B9BE0000, v15, OS_LOG_TYPE_DEBUG, "Not caching translocated path %s", buf, 0xCu);
  }

  v8 = 0;
  *__error() = v14;
LABEL_18:

  return v8;
}

- (_BYTE)addURLForSymbolOwner:(_BYTE *)a1
{
  _BYTE *v1;
  uint64_t CFUUIDBytes;
  _BYTE *Path;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v1 = a1;
  if (a1)
  {
    if (a1[25])
    {
      CFUUIDBytes = CSSymbolOwnerGetCFUUIDBytes();
      Path = (_BYTE *)CSSymbolOwnerGetPath();
      SAFilepathForCString(Path);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = v4;
      if (CFUUIDBytes && objc_msgSend(v4, "isAbsolutePath"))
      {
        uuidForBytes(CFUUIDBytes);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SABinaryLocator urlForUUID:](v1, v6);
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v1 = 0;
        }
        else
        {
          v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initFileURLWithPath:isDirectory:", v5, 0);
          v1 = (_BYTE *)-[SABinaryLocator addURL:ForUUID:](v1, v8, v6);

        }
      }
      else
      {
        v1 = 0;
      }

    }
    else
    {
      return 0;
    }
  }
  return v1;
}

- (uint64_t)removeURLForUUID:(_BYTE *)a1
{
  id v3;
  void *v4;
  uint64_t v5;
  int v6;
  NSObject *v7;
  void *v8;
  void *v10;
  _BYTE buf[22];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = v3;
  v5 = 0;
  if (a1)
  {
    if (v3)
    {
      if (a1[25])
      {
        -[SABinaryLocator urlForUUID:](a1, v3);
        v5 = objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          v6 = *__error();
          _sa_logt();
          v7 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            objc_msgSend(v4, "UUIDString");
            v10 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            *(_QWORD *)&buf[4] = v10;
            *(_WORD *)&buf[12] = 2080;
            *(_QWORD *)&buf[14] = objc_msgSend(objc_retainAutorelease((id)v5), "fileSystemRepresentation");
            _os_log_debug_impl(&dword_1B9BE0000, v7, OS_LOG_TYPE_DEBUG, "Deleted %@ -> %s", buf, 0x16u);

          }
          *__error() = v6;
          a1[24] = 1;
          *(_QWORD *)buf = 0;
          *(_QWORD *)&buf[8] = 0;
          objc_msgSend(v4, "getUUIDBytes:", buf);
          OSLogLookupPathWithUUID();
          -[SABinaryLocator mappings](a1);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeObjectForKey:", v4);

          v5 = 1;
        }
      }
    }
  }

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buildNumber, 0);
  objc_storeStrong((id *)&self->_mappings, 0);
}

@end
