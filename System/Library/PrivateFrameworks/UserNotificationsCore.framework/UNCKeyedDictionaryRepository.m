@implementation UNCKeyedDictionaryRepository

- (void)setDictionary:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[UNCKeyedDictionaryRepository _pathForKey:](self, "_pathForKey:", a4);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCKeyedDictionaryRepository _saveDictionary:atPath:](self, "_saveDictionary:atPath:", v6, v7);

}

- (id)dictionaryForKey:(id)a3
{
  void *v4;
  void *v5;

  -[UNCKeyedDictionaryRepository _pathForKey:](self, "_pathForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UNCKeyedDictionaryRepository _dictionaryAtPath:](self, "_dictionaryAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_pathForKey:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  -[UNCKeyedDictionaryRepository _directoryForKey:](self, "_directoryForKey:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", self->_fileName);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringByAppendingPathExtension:", self->_pathExtension);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
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

- (id)_dictionaryAtPath:(id)a3
{
  id v4;
  void *v5;
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
  void *v16;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;

  v4 = a3;
  -[UNCKeyedDictionaryRepository _dataAtPath:](self, "_dataAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
LABEL_7:
    v15 = 0;
    goto LABEL_8;
  }
  v20 = (void *)MEMORY[0x24BDD1620];
  v22 = (void *)MEMORY[0x24BDBCF20];
  v21 = objc_opt_class();
  v19 = objc_opt_class();
  v18 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  v9 = objc_opt_class();
  v10 = objc_opt_class();
  v11 = objc_opt_class();
  v12 = objc_opt_class();
  v13 = objc_opt_class();
  objc_msgSend(v22, "setWithObjects:", v21, v19, v18, v6, v7, v8, v9, v10, v11, v12, v13, objc_opt_class(), 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "unarchivedObjectOfClasses:fromData:error:", v14, v5, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      v16 = (void *)*MEMORY[0x24BDF89B8];
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
        -[UNCKeyedDictionaryRepository _dictionaryAtPath:].cold.1(v16, (uint64_t)v15, (uint64_t)v4);

      goto LABEL_7;
    }
  }
LABEL_8:

  return v15;
}

- (id)_dataAtPath:(id)a3
{
  id v3;
  void *v4;
  NSObject *v5;
  uint64_t v6;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    v5 = *MEMORY[0x24BDF89B8];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
      -[UNCKeyedDictionaryRepository _dataAtPath:].cold.1((uint64_t)v3, v5, v6);
  }

  return v4;
}

- (void)_dataAtPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_2499A5000, a2, a3, "No data found at %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

- (BOOL)_saveDictionary:(id)a3 atPath:(id)a4
{
  id v5;
  id v6;
  os_log_t *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  void *v11;
  char v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  char v17;
  id v18;
  BOOL v19;
  NSObject *v20;
  uint64_t v21;
  id v23;
  id v24;
  id v25;
  uint8_t buf[4];
  id v27;
  __int16 v28;
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  v7 = (os_log_t *)MEMORY[0x24BDF89B8];
  v8 = (void *)*MEMORY[0x24BDF89B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_DEFAULT))
  {
    v9 = v8;
    *(_DWORD *)buf = 138543618;
    v27 = v6;
    v28 = 2048;
    v29 = objc_msgSend(v5, "count");
    _os_log_impl(&dword_2499A5000, v9, OS_LOG_TYPE_DEFAULT, "Saving file at %{public}@ with %lu items", buf, 0x16u);

  }
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByDeletingLastPathComponent");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v10, "fileExistsAtPath:", v11) & 1) == 0)
  {
    v25 = 0;
    v12 = objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v11, 1, 0, &v25);
    v13 = v25;
    if ((v12 & 1) == 0 && os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      -[UNCKeyedDictionaryRepository _saveDictionary:atPath:].cold.4();

  }
  v24 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v5, 1, &v24);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v24;
  v16 = v15;
  if (v14)
  {
    v23 = v15;
    v17 = objc_msgSend(v14, "writeToFile:options:error:", v6, 268435457, &v23);
    v18 = v23;

    if ((v17 & 1) != 0)
    {
      v19 = 1;
    }
    else
    {
      if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
        -[UNCKeyedDictionaryRepository _saveDictionary:atPath:].cold.2();
      v19 = 0;
    }
    v16 = v18;
  }
  else
  {
    v20 = *v7;
    if (os_log_type_enabled(*v7, OS_LOG_TYPE_ERROR))
      -[UNCKeyedDictionaryRepository _saveDictionary:atPath:].cold.1((uint64_t)v16, v20, v21);
    v19 = 0;
  }

  return v19;
}

- (UNCKeyedDictionaryRepository)initWithDirectory:(id)a3 fileName:(id)a4 pathExtension:(id)a5 librarian:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  UNCKeyedDictionaryRepository *v14;
  uint64_t v15;
  NSString *directory;
  uint64_t v17;
  NSString *fileName;
  uint64_t v19;
  NSString *pathExtension;
  objc_super v22;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  v22.receiver = self;
  v22.super_class = (Class)UNCKeyedDictionaryRepository;
  v14 = -[UNCKeyedDictionaryRepository init](&v22, sel_init);
  if (v14)
  {
    v15 = objc_msgSend(v10, "copy");
    directory = v14->_directory;
    v14->_directory = (NSString *)v15;

    v17 = objc_msgSend(v11, "copy");
    fileName = v14->_fileName;
    v14->_fileName = (NSString *)v17;

    v19 = objc_msgSend(v12, "copy");
    pathExtension = v14->_pathExtension;
    v14->_pathExtension = (NSString *)v19;

    objc_storeStrong((id *)&v14->_librarian, a6);
  }

  return v14;
}

- (id)allKeys
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(v3, "enumeratorAtPath:", self->_directory);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
        -[NSString stringByAppendingPathComponent:](self->_directory, "stringByAppendingPathComponent:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "stringByAppendingPathComponent:", self->_fileName);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "stringByAppendingPathExtension:", self->_pathExtension);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (objc_msgSend(v3, "fileExistsAtPath:", v12))
        {
          -[UNCBundleLibrarian bundleIdentifierForUniqueIdentifier:](self->_librarian, "bundleIdentifierForUniqueIdentifier:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            objc_msgSend(v15, "addObject:", v13);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  return v15;
}

- (void)removeDictionaryForKey:(id)a3
{
  id v4;

  -[UNCKeyedDictionaryRepository _pathForKey:](self, "_pathForKey:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[UNCKeyedDictionaryRepository _removeDictionaryAtPath:](self, "_removeDictionaryAtPath:", v4);

}

- (void)_removeDictionaryAtPath:(id)a3
{
  id v3;
  void *v4;
  char v5;
  id v6;
  id v7;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "fileExistsAtPath:", v3))
  {
    v7 = 0;
    v5 = objc_msgSend(v4, "removeItemAtPath:error:", v3, &v7);
    v6 = v7;
    if ((v5 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
      -[UNCKeyedDictionaryRepository _removeDictionaryAtPath:].cold.1();

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_librarian, 0);
  objc_storeStrong((id *)&self->_pathExtension, 0);
  objc_storeStrong((id *)&self->_fileName, 0);
  objc_storeStrong((id *)&self->_directory, 0);
}

- (void)_dictionaryAtPath:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  NSObject *v4;
  id v5;
  uint64_t v6;
  int v7;
  id v8;
  __int16 v9;
  uint64_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v7 = 138543618;
  v8 = (id)objc_opt_class();
  v9 = 2114;
  v10 = a3;
  v5 = v8;
  OUTLINED_FUNCTION_2(&dword_2499A5000, v4, v6, "Unexpected class %{public}@ decocded at %{public}@", (uint8_t *)&v7);

  OUTLINED_FUNCTION_1();
}

- (void)_dictionaryAtPath:(void *)a1 .cold.2(void *a1, uint64_t a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  v4 = *MEMORY[0x24BDF89B8];
  if (OUTLINED_FUNCTION_5_1())
  {
    v6 = 138543618;
    v7 = a2;
    v8 = 2114;
    v9 = v3;
    OUTLINED_FUNCTION_2(&dword_2499A5000, v4, v5, "Exception caught data at %{public}@; exception: %{public}@",
      (uint8_t *)&v6);
  }

  objc_end_catch();
  OUTLINED_FUNCTION_1();
}

- (void)_saveDictionary:(uint64_t)a3 atPath:.cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  v3 = 138543362;
  v4 = a1;
  OUTLINED_FUNCTION_0(&dword_2499A5000, a2, a3, "Could not encode object data: %{public}@", (uint8_t *)&v3);
  OUTLINED_FUNCTION_6();
}

- (void)_saveDictionary:atPath:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_2499A5000, v0, (uint64_t)v0, "Could not write objects to %{public}@; error: %{public}@", v1);
  OUTLINED_FUNCTION_6();
}

- (void)_saveDictionary:(void *)a1 atPath:.cold.3(void *a1)
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

- (void)_saveDictionary:atPath:.cold.4()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_2499A5000, v0, (uint64_t)v0, "Could not create directory at %{public}@; error: %{public}@",
    v1);
  OUTLINED_FUNCTION_6();
}

- (void)_removeDictionaryAtPath:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_2(&dword_2499A5000, v0, (uint64_t)v0, "Could not delete %{public}@: %{public}@", v1);
  OUTLINED_FUNCTION_6();
}

@end
