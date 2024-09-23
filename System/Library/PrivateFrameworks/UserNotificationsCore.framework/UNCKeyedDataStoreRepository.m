@implementation UNCKeyedDataStoreRepository

- (UNCKeyedDataStoreRepository)initWithDirectory:(id)a3 fileName:(id)a4 pathExtension:(id)a5 librarian:(id)a6 repositoryProtectionStrategy:(id)a7 objectIdentifierKey:(id)a8 maxObjectsPerKey:(int64_t)a9
{
  id v15;
  id v16;
  id v17;
  id v18;
  id v19;
  id v20;
  UNCKeyedDataStoreRepository *v21;
  uint64_t v22;
  NSString *directory;
  uint64_t v24;
  NSString *fileName;
  uint64_t v26;
  NSString *pathExtension;
  uint64_t v28;
  NSString *objectIdentifierKey;
  objc_super v31;

  v15 = a3;
  v16 = a4;
  v17 = a5;
  v18 = a6;
  v19 = a7;
  v20 = a8;
  v31.receiver = self;
  v31.super_class = (Class)UNCKeyedDataStoreRepository;
  v21 = -[UNCKeyedDataStoreRepository init](&v31, sel_init);
  if (v21)
  {
    v22 = objc_msgSend(v15, "copy");
    directory = v21->_directory;
    v21->_directory = (NSString *)v22;

    v24 = objc_msgSend(v16, "copy");
    fileName = v21->_fileName;
    v21->_fileName = (NSString *)v24;

    v26 = objc_msgSend(v17, "copy");
    pathExtension = v21->_pathExtension;
    v21->_pathExtension = (NSString *)v26;

    objc_storeStrong((id *)&v21->_librarian, a6);
    objc_storeStrong((id *)&v21->_protectionStrategy, a7);
    v28 = objc_msgSend(v20, "copy");
    objectIdentifierKey = v21->_objectIdentifierKey;
    v21->_objectIdentifierKey = (NSString *)v28;

    v21->_maxObjectsPerKey = a9;
  }

  return v21;
}

- (id)allKeys
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  UNSContentProtectionStrategy *protectionStrategy;
  void *v15;
  UNCBundleLibrarian *librarian;
  void *v17;
  void *v18;
  void *v19;
  NSObject *v20;
  void *v21;
  void *v22;
  NSObject *v23;
  void *v24;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  _BYTE v35[128];
  _QWORD v36[3];

  v36[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v26 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", self->_directory);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = *MEMORY[0x24BDBCC60];
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v36, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "enumeratorAtURL:includingPropertiesForKeys:options:errorHandler:", v4, v5, 1, &__block_literal_global_21);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v28 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x24BCFE9BC]();
        protectionStrategy = self->_protectionStrategy;
        objc_msgSend(v12, "path");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(protectionStrategy) = -[UNSContentProtectionStrategy dataIsAvailableAtPath:](protectionStrategy, "dataIsAvailableAtPath:", v15);

        if ((protectionStrategy & 1) != 0)
        {
          librarian = self->_librarian;
          objc_msgSend(v12, "lastPathComponent");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          -[UNCBundleLibrarian bundleIdentifierForUniqueIdentifier:](librarian, "bundleIdentifierForUniqueIdentifier:", v17);
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          v19 = (void *)*MEMORY[0x24BDF89B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
          {
            v20 = v19;
            objc_msgSend(v12, "path");
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412546;
            v32 = v21;
            v33 = 2112;
            v34 = v18;
            _os_log_impl(&dword_2499A5000, v20, OS_LOG_TYPE_DEFAULT, "UNCKeyedDataStoreRepository allKeys: Loading: %@ bundleIdentifier: %@", buf, 0x16u);

          }
          if (v18)
            objc_msgSend(v26, "addObject:", v18);

        }
        else
        {
          v22 = (void *)*MEMORY[0x24BDF89B8];
          if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
          {
            v23 = v22;
            objc_msgSend(v12, "path");
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138412290;
            v32 = v24;
            _os_log_impl(&dword_2499A5000, v23, OS_LOG_TYPE_DEFAULT, "UNCKeyedDataStoreRepository allKeys: !dataIsAvailableAtPath: %@", buf, 0xCu);

          }
        }
        objc_autoreleasePoolPop(v13);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v27, v35, 16);
    }
    while (v9);
  }

  return v26;
}

uint64_t __38__UNCKeyedDataStoreRepository_allKeys__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  NSObject *v6;
  int v8;
  id v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v4 = a2;
  v5 = a3;
  v6 = *MEMORY[0x24BDF89B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
  {
    v8 = 138412546;
    v9 = v4;
    v10 = 2112;
    v11 = v5;
    _os_log_impl(&dword_2499A5000, v6, OS_LOG_TYPE_DEFAULT, "UNCKeyedDataStoreRepository allKeys: enumeratorAtURL failed url: %@ error: %@", (uint8_t *)&v8, 0x16u);
  }

  return 1;
}

- (id)_directoryForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UNCBundleLibrarian uniqueIdentifierForBundleIdentifier:](self->_librarian, "uniqueIdentifierForBundleIdentifier:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByReplacingOccurrencesOfString:withString:", CFSTR("/"), &stru_251AE68F0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)directoryPath
{
  return self->_directory;
}

- (id)_pathForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UNCKeyedDataStoreRepository _directoryForKey:](self, "_directoryForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", self->_fileName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathExtension:", self->_pathExtension);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)objectsForKey:(id)a3
{
  void *v4;
  void *v5;

  -[UNCKeyedDataStoreRepository _pathForKey:](self, "_pathForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCKeyedDataStoreRepository _objectsAtPath:](self, "_objectsAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_objectsAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[UNCKeyedDataStoreRepository _dataAtPath:](self, "_dataAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[UNCKeyedDataStoreRepository _objectsForData:identifier:](self, "_objectsForData:identifier:", v5, v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)objectsPassingTest:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v6 = a3;
    -[UNCKeyedDataStoreRepository _pathForKey:](self, "_pathForKey:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCKeyedDataStoreRepository _objectsPassingTest:atPath:](self, "_objectsPassingTest:atPath:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_objectsPassingTest:(id)a3 atPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = a4;
  -[UNCKeyedDataStoreRepository _dataAtPath:](self, "_dataAtPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[UNCKeyedDataStoreRepository _objectsForData:identifier:](self, "_objectsForData:identifier:", v8, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "bs_filter:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

- (id)_objectsForData:(id)a3 identifier:(id)a4
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  NSObject *v16;
  void *v17;
  void *context;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  id v24;
  id v25;
  _BYTE v26[32];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v25 = a3;
  v24 = a4;
  context = (void *)MEMORY[0x24BCFE9BC]();
  v21 = (void *)MEMORY[0x24BDD1620];
  v23 = (void *)MEMORY[0x24BDBCF20];
  v22 = objc_opt_class();
  v20 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v23, "setWithObjects:", v22, v20, v5, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "unarchivedObjectOfClasses:fromData:error:", v14, v25, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(context);
  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = (id)*MEMORY[0x24BDF89B8];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        v17 = (void *)objc_opt_class();
        -[UNCKeyedDataStoreRepository _objectsForData:identifier:].cold.1(v17, (uint64_t)v24, (uint64_t)v26, v16);
      }

      v15 = 0;
    }
  }

  return v15;
}

- (id)_dataAtPath:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;

  v4 = a3;
  -[UNSContentProtectionStrategy dataAtPath:](self->_protectionStrategy, "dataAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v6 = *MEMORY[0x24BDF89B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
      -[UNCKeyedDictionaryRepository _dataAtPath:].cold.1((uint64_t)v4, v6, v7);
  }

  return v5;
}

- (BOOL)_saveObjects:(id)a3 atPath:(id)a4
{
  id v6;
  id v7;
  os_log_t *v8;
  void *v9;
  NSObject *v10;
  void *v11;
  void *v12;
  char v13;
  id v14;
  void *v15;
  id v16;
  UNSContentProtectionStrategy *protectionStrategy;
  char v18;
  id v19;
  BOOL v20;
  NSObject *v21;
  uint64_t v22;
  id v24;
  id v25;
  id v26;
  uint8_t buf[4];
  id v28;
  __int16 v29;
  uint64_t v30;
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = (os_log_t *)MEMORY[0x24BDF89B8];
  v9 = (void *)*MEMORY[0x24BDF89B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
  {
    v10 = v9;
    *(_DWORD *)buf = 138543618;
    v28 = v7;
    v29 = 2048;
    v30 = objc_msgSend(v6, "count");
    _os_log_impl(&dword_2499A5000, v10, OS_LOG_TYPE_DEFAULT, "Saving file at %{public}@ with %lu items", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingLastPathComponent");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v11, "fileExistsAtPath:", v12) & 1) == 0)
  {
    v26 = 0;
    v13 = objc_msgSend(v11, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v12, 1, 0, &v26);
    v14 = v26;
    if ((v13 & 1) == 0 && os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[UNCBundleLibrarian _queue_saveDictionary:atPath:].cold.4();

  }
  v25 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v25);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v25;
  if (v15)
  {
    protectionStrategy = self->_protectionStrategy;
    v24 = v16;
    v18 = -[UNSContentProtectionStrategy writeData:atPath:error:](protectionStrategy, "writeData:atPath:error:", v15, v7, &v24);
    v19 = v24;

    if ((v18 & 1) != 0)
    {
      v20 = 1;
    }
    else
    {
      if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
        -[UNCBundleLibrarian _queue_saveDictionary:atPath:].cold.2();
      v20 = 0;
    }
    v16 = v19;
  }
  else
  {
    v21 = *v8;
    if (os_log_type_enabled(*v8, OS_LOG_TYPE_ERROR))
      -[UNCKeyedDictionaryRepository _saveDictionary:atPath:].cold.1((uint64_t)v16, v21, v22);
    v20 = 0;
  }

  return v20;
}

- (void)removeAllObjectsForKey:(id)a3
{
  id v4;

  -[UNCKeyedDataStoreRepository _pathForKey:](self, "_pathForKey:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCKeyedDataStoreRepository _saveObjects:atPath:](self, "_saveObjects:atPath:", MEMORY[0x24BDBD1A8], v4);

}

- (id)removeObjectsPassingTest:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v6 = a3;
    -[UNCKeyedDataStoreRepository _pathForKey:](self, "_pathForKey:", a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCKeyedDataStoreRepository _removeObjectsPassingTest:atPath:](self, "_removeObjectsPassingTest:atPath:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (id)_removeObjectsPassingTest:(id)a3 atPath:(id)a4
{
  unsigned int (**v6)(id, _QWORD);
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  void *v17;
  UNCKeyedDataStoreRepository *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = (unsigned int (**)(id, _QWORD))a3;
  v7 = a4;
  v19 = self;
  -[UNCKeyedDataStoreRepository _objectsAtPath:](self, "_objectsAtPath:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = 0;
    v13 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v13)
          objc_enumerationMutation(v8);
        v15 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (v6[2](v6, v15))
        {
          if (v12)
          {
            v16 = v12;
          }
          else
          {
            objc_msgSend(MEMORY[0x24BDBCEB8], "array");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            v12 = v16;
          }
        }
        else if (v11)
        {
          v16 = v11;
        }
        else
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v11 = v16;
        }
        objc_msgSend(v16, "addObject:", v15);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }
  else
  {
    v11 = 0;
    v12 = 0;
  }
  -[UNCKeyedDataStoreRepository _saveObjects:atPath:](v19, "_saveObjects:atPath:", v11, v7);
  +[UNCDataStoreReceipt receiptWithAddedObjects:replacedObjects:replacementObjects:removedObjects:](UNCDataStoreReceipt, "receiptWithAddedObjects:replacedObjects:replacementObjects:removedObjects:", 0, 0, 0, v12);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

- (void)setObjects:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UNCKeyedDataStoreRepository _pathForKey:](self, "_pathForKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCKeyedDataStoreRepository _setObjects:atPath:](self, "_setObjects:atPath:", v6, v7);

}

- (void)_setObjects:(id)a3 atPath:(id)a4
{
  id v6;
  void *v7;
  unint64_t v8;
  unint64_t maxObjectsPerKey;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = (void *)objc_msgSend(v11, "mutableCopy");
  v8 = objc_msgSend(v7, "count");
  maxObjectsPerKey = self->_maxObjectsPerKey;
  if (v8 > maxObjectsPerKey)
    v8 = objc_msgSend(v7, "removeObjectsInRange:", maxObjectsPerKey, objc_msgSend(v7, "count") - self->_maxObjectsPerKey);
  v10 = (void *)MEMORY[0x24BCFE9BC](v8);
  -[UNCKeyedDataStoreRepository _saveObjects:atPath:](self, "_saveObjects:atPath:", v7, v6);
  objc_autoreleasePoolPop(v10);

}

- (id)addObject:(id)a3 forKey:(id)a4
{
  return -[UNCKeyedDataStoreRepository addObject:mustReplace:forKey:](self, "addObject:mustReplace:forKey:", a3, 0, a4);
}

- (id)replaceObject:(id)a3 forKey:(id)a4
{
  return -[UNCKeyedDataStoreRepository addObject:mustReplace:forKey:](self, "addObject:mustReplace:forKey:", a3, 1, a4);
}

- (id)addObject:(id)a3 mustReplace:(BOOL)a4 forKey:(id)a5
{
  void *v5;
  _BOOL8 v7;
  id v9;
  void *v10;

  v5 = 0;
  if (a3 && a5)
  {
    v7 = a4;
    v9 = a3;
    -[UNCKeyedDataStoreRepository _pathForKey:](self, "_pathForKey:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNCKeyedDataStoreRepository _addObject:mustReplace:atPath:](self, "_addObject:mustReplace:atPath:", v9, v7, v10);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)_addObject:(id)a3 mustReplace:(BOOL)a4 atPath:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  id v15;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v10 = (void *)MEMORY[0x24BCFE9BC]();
  -[UNCKeyedDataStoreRepository _objectsAtPath:](self, "_objectsAtPath:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  -[UNCKeyedDataStoreRepository _addObject:toObjects:mustReplace:receipt:](self, "_addObject:toObjects:mustReplace:receipt:", v8, v11, v6, &v15);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v15;
  -[UNCKeyedDataStoreRepository _saveObjects:atPath:](self, "_saveObjects:atPath:", v12, v9);

  objc_autoreleasePoolPop(v10);
  return v13;
}

- (id)_addObject:(id)a3 toObjects:(id)a4 mustReplace:(BOOL)a5 receipt:(id *)a6
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  unint64_t v24;
  unint64_t maxObjectsPerKey;
  id *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  _BOOL4 v31;
  void *v33;
  id obj;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  uint64_t v40;

  v31 = a5;
  v40 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v8;
  objc_msgSend(v10, "addObject:", v8);
  v37 = 0u;
  v38 = 0u;
  v35 = 0u;
  v36 = 0u;
  obj = v9;
  v11 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
  if (v11)
  {
    v12 = v11;
    v13 = 0;
    v14 = *(_QWORD *)v36;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v36 != v14)
          objc_enumerationMutation(obj);
        v16 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
        if (-[UNCKeyedDataStoreRepository _isReplacementSupported](self, "_isReplacementSupported")
          && (objc_msgSend(v16, "objectForKey:", self->_objectIdentifierKey),
              v17 = (void *)objc_claimAutoreleasedReturnValue(),
              objc_msgSend(v33, "objectForKey:", self->_objectIdentifierKey),
              v18 = (void *)objc_claimAutoreleasedReturnValue(),
              v19 = objc_msgSend(v17, "isEqualToString:", v18),
              v18,
              v17,
              v19))
        {
          objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v16);
          v20 = objc_claimAutoreleasedReturnValue();

          v13 = (void *)v20;
        }
        else
        {
          objc_msgSend(v10, "addObject:", v16);
        }
      }
      v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v35, v39, 16);
    }
    while (v12);
  }
  else
  {
    v13 = 0;
  }

  if (v31 && !objc_msgSend(v13, "count"))
  {
    v22 = 0;
    v23 = 0;
    v28 = 0;
    v26 = a6;
    if (!a6)
      goto LABEL_27;
    goto LABEL_26;
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v33);
  v21 = objc_claimAutoreleasedReturnValue();
  if (v13)
    v22 = 0;
  else
    v22 = (void *)v21;
  if (v13)
    v23 = (void *)v21;
  else
    v23 = 0;
  v24 = objc_msgSend(v10, "count");
  maxObjectsPerKey = self->_maxObjectsPerKey;
  v26 = a6;
  if (v24 > maxObjectsPerKey)
  {
    v27 = objc_msgSend(v10, "count") - self->_maxObjectsPerKey;
    objc_msgSend(v10, "subarrayWithRange:", maxObjectsPerKey, v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeObjectsInRange:", maxObjectsPerKey, v27);
    if (!a6)
      goto LABEL_27;
    goto LABEL_26;
  }
  v28 = 0;
  if (a6)
  {
LABEL_26:
    +[UNCDataStoreReceipt receiptWithAddedObjects:replacedObjects:replacementObjects:removedObjects:](UNCDataStoreReceipt, "receiptWithAddedObjects:replacedObjects:replacementObjects:removedObjects:", v22, v13, v23, v28);
    *v26 = (id)objc_claimAutoreleasedReturnValue();
  }
LABEL_27:
  v29 = (void *)objc_msgSend(v10, "copy");

  return v29;
}

- (void)removeStoreForKey:(id)a3
{
  id v4;

  -[UNCKeyedDataStoreRepository _pathForKey:](self, "_pathForKey:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCKeyedDataStoreRepository _removeItemAtPath:](self, "_removeItemAtPath:", v4);

}

- (void)removeDataStoreRepository
{
  -[UNCKeyedDataStoreRepository _removeItemAtPath:](self, "_removeItemAtPath:", self->_directory);
}

- (void)_removeItemAtPath:(id)a3
{
  UNSContentProtectionStrategy *protectionStrategy;
  uint64_t v4;

  protectionStrategy = self->_protectionStrategy;
  v4 = 0;
  -[UNSContentProtectionStrategy removeItemAtPath:error:](protectionStrategy, "removeItemAtPath:error:", a3, &v4);
}

- (void)migrateStoreAtPath:(id)a3 forKey:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  UNSContentProtectionStrategy *protectionStrategy;
  void *v13;
  id v14;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD1580];
  v8 = a3;
  objc_msgSend(v7, "defaultManager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCKeyedDataStoreRepository _directoryForKey:](self, "_directoryForKey:", v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v9, "fileExistsAtPath:", v10) & 1) == 0)
  {
    v14 = 0;
    objc_msgSend(v9, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v10, 1, 0, &v14);
    v11 = v14;
    if (v11 && os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
      -[UNCKeyedDataStoreRepository migrateStoreAtPath:forKey:].cold.1();

  }
  protectionStrategy = self->_protectionStrategy;
  -[UNCKeyedDataStoreRepository _pathForKey:](self, "_pathForKey:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNSContentProtectionStrategy migrateDataAtPath:toPath:](protectionStrategy, "migrateDataAtPath:toPath:", v8, v13);

}

- (BOOL)_isReplacementSupported
{
  return self->_objectIdentifierKey != 0;
}

- (BOOL)_useReplacementToImport:(id)a3 into:(id)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;

  v6 = a4;
  v7 = objc_msgSend(a3, "count");
  v8 = objc_msgSend(v6, "count");

  return v7 && v8 && -[UNCKeyedDataStoreRepository _isReplacementSupported](self, "_isReplacementSupported");
}

- (void)protectionStateChanged
{
  UNSContentProtectionStrategy *protectionStrategy;
  _QWORD v4[5];

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    protectionStrategy = self->_protectionStrategy;
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __53__UNCKeyedDataStoreRepository_protectionStateChanged__block_invoke;
    v4[3] = &unk_251AE1218;
    v4[4] = self;
    -[UNSContentProtectionStrategy importDataWithImportHandler:](protectionStrategy, "importDataWithImportHandler:", v4);
  }
}

id __53__UNCKeyedDataStoreRepository_protectionStateChanged__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  id v21;
  void *v22;
  void *v24;
  id v25;
  uint64_t v26;
  id v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "_objectsForData:identifier:", a2, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_objectsForData:identifier:", v5, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  v9 = (void *)MEMORY[0x24BDBD1A8];
  if (v7)
    v9 = (void *)v7;
  v10 = v9;
  if (objc_msgSend(*(id *)(a1 + 32), "_useReplacementToImport:into:", v6, v8))
  {
    v30 = 0u;
    v31 = 0u;
    v28 = 0u;
    v29 = 0u;
    v11 = v6;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    if (v12)
    {
      v13 = v12;
      v24 = v6;
      v25 = v5;
      v14 = 0;
      v15 = *(_QWORD *)v29;
      do
      {
        v16 = 0;
        v17 = v14;
        v18 = v10;
        do
        {
          if (*(_QWORD *)v29 != v15)
            objc_enumerationMutation(v11);
          v19 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v16);
          v20 = *(void **)(a1 + 32);
          v27 = v17;
          objc_msgSend(v20, "_addObject:toObjects:mustReplace:receipt:", v19, v18, 0, &v27, v24, v25);
          v10 = (id)objc_claimAutoreleasedReturnValue();
          v14 = v27;

          ++v16;
          v17 = v14;
          v18 = v10;
        }
        while (v13 != v16);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
      }
      while (v13);

      v6 = v24;
      v5 = v25;
    }

  }
  else if (objc_msgSend(v6, "count"))
  {
    v21 = v6;

    v10 = v21;
  }
  v26 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v10, 1, &v26);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_objectIdentifierKey, 0);
  objc_storeStrong((id *)&self->_protectionStrategy, 0);
  objc_storeStrong((id *)&self->_librarian, 0);
  objc_storeStrong((id *)&self->_pathExtension, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

- (void)_objectsForData:(uint64_t)a3 identifier:(NSObject *)a4 .cold.1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  id v6;

  *(_DWORD *)a3 = 138543618;
  *(_QWORD *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2114;
  *(_QWORD *)(a3 + 14) = a2;
  v6 = a1;
  _os_log_error_impl(&dword_2499A5000, a4, OS_LOG_TYPE_ERROR, "Unexpected class %{public}@ decocded at %{public}@", (uint8_t *)a3, 0x16u);

}

- (void)_objectsForData:(void *)a1 identifier:(uint64_t)a2 .cold.2(void *a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  int v5;
  uint64_t v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = *MEMORY[0x24BDF89B8];
  if (OUTLINED_FUNCTION_5_1())
  {
    v5 = 138543618;
    v6 = a2;
    v7 = 2114;
    v8 = v3;
    _os_log_error_impl(&dword_2499A5000, v4, OS_LOG_TYPE_ERROR, "Exception caught data at %{public}@; exception: %{public}@",
      (uint8_t *)&v5,
      0x16u);
  }

  objc_end_catch();
}

- (void)_saveObjects:(void *)a1 atPath:.cold.3(void *a1)
{
  id v1;
  NSObject *v2;
  uint64_t v3;
  int v4;
  id v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  v1 = objc_begin_catch(a1);
  v2 = *MEMORY[0x24BDF89B8];
  if (OUTLINED_FUNCTION_5_1())
  {
    v4 = 138543362;
    v5 = v1;
    OUTLINED_FUNCTION_0(&dword_2499A5000, v2, v3, "Unable to archive objects: %{public}@", (uint8_t *)&v4);
  }

  objc_end_catch();
}

- (void)migrateStoreAtPath:forKey:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "Could not create directory at %{public}@; error: %{public}@ for migration");
  OUTLINED_FUNCTION_6();
}

@end
