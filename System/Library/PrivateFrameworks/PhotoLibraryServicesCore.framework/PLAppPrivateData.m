@implementation PLAppPrivateData

- (PLAppPrivateData)initWithLibraryURL:(id)a3
{
  id v5;
  PLAppPrivateData *v6;
  PLAppPrivateData *v7;
  PLPhotoLibraryPathManager *v8;
  PLPhotoLibraryPathManager *pathManager;
  objc_super v11;

  v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PLAppPrivateData;
  v6 = -[PLAppPrivateData init](&v11, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_libraryURL, a3);
    v8 = -[PLPhotoLibraryPathManager initWithLibraryURL:]([PLPhotoLibraryPathManager alloc], "initWithLibraryURL:", v7->_libraryURL);
    pathManager = v7->_pathManager;
    v7->_pathManager = v8;

    -[PLAppPrivateData _readFromFilesystem](v7, "_readFromFilesystem");
  }

  return v7;
}

- (id)debugDescription
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppPrivateData _dictionaryStorageURL](self, "_dictionaryStorageURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "path");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@<%p> (%@): %@"), v5, self, v7, self->_backingDictionary);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (id)_dictionaryStorageURL
{
  return -[PLAppPrivateData _dictionaryStorageURLPreparedForWriting:](self, "_dictionaryStorageURLPreparedForWriting:", 0);
}

- (id)_dictionaryStorageURLPreparedForWriting:(BOOL)a3
{
  void *v3;
  void *v4;

  -[PLAppPrivateData _appPrivateDataFolderURLCreateIfNeeded:](self, "_appPrivateDataFolderURLCreateIfNeeded:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("appPrivateData.plist"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_saveToFilesystemWithError:(id *)a3
{
  PLAppPrivateData *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  int v10;
  id v11;
  NSObject *v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  _BOOL8 v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  unsigned __int8 v30;
  id v31;
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  __int16 v35;
  id v36;
  __int16 v37;
  void *v38;
  __int16 v39;
  void *v40;
  _QWORD v41[2];

  v41[1] = *MEMORY[0x1E0C80C00];
  v4 = self;
  objc_sync_enter(v4);
  v5 = (void *)MEMORY[0x1E0CB38B0];
  -[PLAppPrivateData backingDictionary](v4, "backingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0;
  objc_msgSend(v5, "dataWithPropertyList:format:options:error:", v6, 100, 0, &v32);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v32;

  if (v7)
  {
    -[PLAppPrivateData _dictionaryStorageURLPreparedForWriting:](v4, "_dictionaryStorageURLPreparedForWriting:", 1);
    v9 = objc_claimAutoreleasedReturnValue();
    v31 = v8;
    v10 = objc_msgSend(v7, "writeToURL:options:error:", v9, 1, &v31);
    v11 = v31;

    PLBackendGetLog();
    v12 = objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v10)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        v14 = objc_msgSend(v7, "length");
        -[NSObject path](v9, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 134218242;
        v34 = v14;
        v35 = 2112;
        v36 = v15;
        _os_log_impl(&dword_199DF7000, v13, OS_LOG_TYPE_DEBUG, "%ld bytes written to %@", buf, 0x16u);

      }
      v16 = 1;
    }
    else
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        -[NSObject path](v9, "path");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412546;
        v34 = (uint64_t)v17;
        v35 = 2112;
        v36 = v11;
        _os_log_impl(&dword_199DF7000, v13, OS_LOG_TYPE_ERROR, "Failed to write property list to %@. Error: %@", buf, 0x16u);

      }
      if (PLIsErrorEqualToCode(v11, (void *)*MEMORY[0x1E0CB28A8], 513))
      {
        v30 = 0;
        objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject path](v9, "path");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v18, "fileExistsAtPath:isDirectory:", v19, &v30);

        v41[0] = *MEMORY[0x1E0C99A50];
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v41, 1);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSObject resourceValuesForKeys:error:](v9, "resourceValuesForKeys:error:", v21, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSObject path](v9, "path");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = +[PLSandboxHelper processCanWriteSandboxForPath:](PLSandboxHelper, "processCanWriteSandboxForPath:", v23);

        PLBackendGetLog();
        v25 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v20);
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v30);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v24);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138413058;
          v34 = (uint64_t)v26;
          v35 = 2112;
          v36 = v27;
          v37 = 2112;
          v38 = v28;
          v39 = 2112;
          v40 = v22;
          _os_log_impl(&dword_199DF7000, v25, OS_LOG_TYPE_ERROR, "_saveToFilesystem: exists? %@ isDirectory? %@ sandboxCanWrite? %@ properties: %@", buf, 0x2Au);

        }
      }
      v16 = 0;
    }
  }
  else
  {
    PLBackendGetLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      v34 = (uint64_t)v8;
      _os_log_impl(&dword_199DF7000, v9, OS_LOG_TYPE_ERROR, "Failed to serialize backingDictionary. Error: %@", buf, 0xCu);
    }
    v16 = 0;
    v11 = v8;
  }

  if (a3)
    *a3 = objc_retainAutorelease(v11);

  objc_sync_exit(v4);
  return v16;
}

- (void)_readFromFilesystem
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  objc_class *v9;
  NSObject *v10;
  NSObject *v11;
  const char *v12;
  NSObject *v13;
  os_log_type_t v14;
  uint32_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  uint8_t buf[4];
  NSObject *v23;
  __int16 v24;
  NSObject *v25;
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  -[PLAppPrivateData _dictionaryStorageURL](self, "_dictionaryStorageURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "open");
    v21 = 0;
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithStream:options:format:error:", v5, 1, 0, &v21);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v21;
    objc_msgSend(v5, "close");
    if (v6)
    {
      -[PLAppPrivateData setBackingDictionary:](self, "setBackingDictionary:", v6);
      PLBackendGetLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
      {
LABEL_13:

        goto LABEL_14;
      }
      v9 = (objc_class *)objc_opt_class();
      NSStringFromClass(v9);
      v10 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "path");
      v11 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v23 = v10;
      v24 = 2112;
      v25 = v11;
      v12 = "Successfully read %@ from file %@";
      v13 = v8;
      v14 = OS_LOG_TYPE_DEBUG;
      v15 = 22;
    }
    else
    {
      objc_msgSend(v7, "userInfo");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "objectForKeyedSubscript:", *MEMORY[0x1E0CB3388]);
      v8 = objc_claimAutoreleasedReturnValue();

      -[NSObject domain](v8, "domain");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v17, "isEqualToString:", *MEMORY[0x1E0CB2FE0]))
      {
        v18 = -[NSObject code](v8, "code");

        if (v18 == 2)
          goto LABEL_13;
      }
      else
      {

      }
      PLBackendGetLog();
      v10 = objc_claimAutoreleasedReturnValue();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
        goto LABEL_12;
      objc_msgSend(v3, "path");
      v11 = objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412290;
      v23 = v11;
      v12 = "Error reading property list from %@";
      v13 = v10;
      v14 = OS_LOG_TYPE_ERROR;
      v15 = 12;
    }
    _os_log_impl(&dword_199DF7000, v13, v14, v12, buf, v15);

LABEL_12:
    goto LABEL_13;
  }
LABEL_14:
  -[PLAppPrivateData backingDictionary](self, "backingDictionary");
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v19)
  {
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PLAppPrivateData setBackingDictionary:](self, "setBackingDictionary:", v20);

  }
}

- (id)_appPrivateDataFolderURLCreateIfNeeded:(BOOL)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x1E0C99E98];
  -[PLPhotoLibraryPathManager photoDirectoryWithType:createIfNeeded:error:](self->_pathManager, "photoDirectoryWithType:createIfNeeded:error:", 5, a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileURLWithPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)valueForKey:(id)a3
{
  id v4;
  PLAppPrivateData *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[PLAppPrivateData backingDictionary](v5, "backingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)setValue:(id)a3 forKey:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  PLAppPrivateData *v10;
  void *v11;

  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  -[PLAppPrivateData backingDictionary](v10, "backingDictionary");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setValue:forKey:", v8, v9);

  LOBYTE(a5) = -[PLAppPrivateData _saveToFilesystemWithError:](v10, "_saveToFilesystemWithError:", a5);
  objc_sync_exit(v10);

  return (char)a5;
}

- (void)setValue:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11 = 0;
  LOBYTE(self) = -[PLAppPrivateData setValue:forKey:error:](self, "setValue:forKey:error:", v6, v7, &v11);
  v8 = v11;
  if ((self & 1) == 0)
  {
    if (v8)
    {
      v12 = *MEMORY[0x1E0CB3388];
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed setting value on app private data"), v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }

}

- (id)valueForKeyPath:(id)a3
{
  id v4;
  PLAppPrivateData *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[PLAppPrivateData backingDictionary](v5, "backingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "valueForKeyPath:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (void)_recursiveCreateSubDictionariesIfMissing:(id)a3 index:(unint64_t)a4 parentDictionary:(id)a5
{
  id v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  id v14;

  v14 = a3;
  v8 = a5;
  v9 = a4 + 1;
  if (objc_msgSend(v14, "count") > a4 + 1)
  {
    objc_msgSend(v14, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "objectForKey:", v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v12)
    {
      objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
      v13 = objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "setObject:forKey:", v13, v10);
      v11 = (void *)v13;
    }
    -[PLAppPrivateData _recursiveCreateSubDictionariesIfMissing:index:parentDictionary:](self, "_recursiveCreateSubDictionariesIfMissing:index:parentDictionary:", v14, v9, v11);

  }
}

- (BOOL)setValue:(id)a3 forKeyPath:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  PLAppPrivateData *v10;
  void *v11;
  void *v12;
  void *v13;

  v8 = a3;
  v9 = a4;
  v10 = self;
  objc_sync_enter(v10);
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR("."));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppPrivateData backingDictionary](v10, "backingDictionary");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PLAppPrivateData _recursiveCreateSubDictionariesIfMissing:index:parentDictionary:](v10, "_recursiveCreateSubDictionariesIfMissing:index:parentDictionary:", v11, 0, v12);

  -[PLAppPrivateData backingDictionary](v10, "backingDictionary");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setValue:forKeyPath:", v8, v9);

  LOBYTE(a5) = -[PLAppPrivateData _saveToFilesystemWithError:](v10, "_saveToFilesystemWithError:", a5);
  objc_sync_exit(v10);

  return (char)a5;
}

- (void)setValue:(id)a3 forKeyPath:(id)a4
{
  id v6;
  id v7;
  id v8;
  uint64_t v9;
  id v10;
  id v11;
  uint64_t v12;
  _QWORD v13[2];

  v13[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v11 = 0;
  LOBYTE(self) = -[PLAppPrivateData setValue:forKeyPath:error:](self, "setValue:forKeyPath:error:", v6, v7, &v11);
  v8 = v11;
  if ((self & 1) == 0)
  {
    if (v8)
    {
      v12 = *MEMORY[0x1E0CB3388];
      v13[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v13, &v12, 1);
      v9 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed setting value for keypath on app private data"), v9);
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v10);
  }

}

- (id)allKeys
{
  PLAppPrivateData *v2;
  void *v3;
  void *v4;

  v2 = self;
  objc_sync_enter(v2);
  -[PLAppPrivateData backingDictionary](v2, "backingDictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v2);
  return v4;
}

- (id)dictionaryWithValuesForKeys:(id)a3
{
  id v4;
  PLAppPrivateData *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  -[PLAppPrivateData backingDictionary](v5, "backingDictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dictionaryWithValuesForKeys:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_sync_exit(v5);
  return v7;
}

- (BOOL)setValuesForKeysWithDictionary:(id)a3 error:(id *)a4
{
  id v6;
  PLAppPrivateData *v7;
  void *v8;

  v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  -[PLAppPrivateData backingDictionary](v7, "backingDictionary");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setValuesForKeysWithDictionary:", v6);

  LOBYTE(a4) = -[PLAppPrivateData _saveToFilesystemWithError:](v7, "_saveToFilesystemWithError:", a4);
  objc_sync_exit(v7);

  return (char)a4;
}

- (void)setValuesForKeysWithDictionary:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v8 = 0;
  LOBYTE(self) = -[PLAppPrivateData setValuesForKeysWithDictionary:error:](self, "setValuesForKeysWithDictionary:error:", v4, &v8);
  v5 = v8;
  if ((self & 1) == 0)
  {
    if (v5)
    {
      v9 = *MEMORY[0x1E0CB3388];
      v10[0] = v5;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
      v6 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99768], CFSTR("Failed setting keys with dictionary on app private data"), v6);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v7);
  }

}

- (NSMutableDictionary)backingDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 8, 1);
}

- (void)setBackingDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (NSURL)libraryURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLibraryURL:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (PLPhotoLibraryPathManager)pathManager
{
  return (PLPhotoLibraryPathManager *)objc_getProperty(self, a2, 24, 1);
}

- (void)setPathManager:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pathManager, 0);
  objc_storeStrong((id *)&self->_libraryURL, 0);
  objc_storeStrong((id *)&self->_backingDictionary, 0);
}

+ (id)appPrivateDataForLibraryURL:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  void *v8;
  PLAppPrivateData *v9;

  v4 = a3;
  v5 = a1;
  objc_sync_enter(v5);
  if (!sPathToObjectMap)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)sPathToObjectMap;
    sPathToObjectMap = v6;

  }
  objc_msgSend(v4, "path");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)sPathToObjectMap, "objectForKey:", v8);
  v9 = (PLAppPrivateData *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    v9 = -[PLAppPrivateData initWithLibraryURL:]([PLAppPrivateData alloc], "initWithLibraryURL:", v4);
    objc_msgSend((id)sPathToObjectMap, "setObject:forKey:", v9, v8);
  }

  objc_sync_exit(v5);
  return v9;
}

+ (BOOL)accessInstanceVariablesDirectly
{
  return 0;
}

@end
