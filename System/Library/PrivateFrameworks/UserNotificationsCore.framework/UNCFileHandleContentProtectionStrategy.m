@implementation UNCFileHandleContentProtectionStrategy

- (UNCFileHandleContentProtectionStrategy)initWithFileProtectionType:(id)a3 excludeFromBackup:(BOOL)a4
{
  id v7;
  UNCFileHandleContentProtectionStrategy *v8;
  UNCFileHandleContentProtectionStrategy *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *keyedFileHandles;
  objc_super v13;

  v7 = a3;
  v13.receiver = self;
  v13.super_class = (Class)UNCFileHandleContentProtectionStrategy;
  v8 = -[UNCFileHandleContentProtectionStrategy init](&v13, sel_init);
  v9 = v8;
  if (v8)
  {
    v8->_excludeFromBackup = a4;
    objc_storeStrong((id *)&v8->_fileProtectionType, a3);
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    keyedFileHandles = v9->_keyedFileHandles;
    v9->_keyedFileHandles = v10;

  }
  return v9;
}

- (id)allPaths
{
  return (id)-[NSMutableDictionary allKeys](self->_keyedFileHandles, "allKeys");
}

- (id)allDataAtPath:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  char v19;
  void *v20;
  id v21;
  NSObject *v22;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  id v28;
  id v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  id v34;
  uint8_t buf[4];
  id v36;
  __int16 v37;
  id v38;
  _BYTE v39[128];
  uint64_t v40;

  v40 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[UNCFileHandleContentProtectionStrategy dataAtPath:](self, "dataAtPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByDeletingPathExtension");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByDeletingLastPathComponent");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", CFSTR("staging"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v6, "fileExistsAtPath:", v9))
  {
    v26 = v6;
    v27 = v5;
    v34 = 0;
    v25 = v9;
    objc_msgSend(v6, "unc_contentsSortedByLastModificationDateOfDirectoryAtPath:error:", v9, &v34);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v34;
    v30 = 0u;
    v31 = 0u;
    v32 = 0u;
    v33 = 0u;
    v11 = v10;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v31;
      do
      {
        v15 = 0;
        do
        {
          if (*(_QWORD *)v31 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15);
          -[NSMutableDictionary objectForKey:](self->_keyedFileHandles, "objectForKey:", v4, v24);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "path");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          v19 = objc_msgSend(v16, "isEqualToString:", v18);

          if ((v19 & 1) == 0)
          {
            v29 = 0;
            objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:options:error:", v16, 0, &v29);
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = v29;
            if (v20)
            {
              objc_msgSend(v28, "addObject:", v20);
            }
            else
            {
              v22 = *MEMORY[0x24BDF89B8];
              if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138543618;
                v36 = v4;
                v37 = 2114;
                v38 = v21;
                _os_log_error_impl(&dword_2499A5000, v22, OS_LOG_TYPE_ERROR, "Could not access data at %{public}@: %{public}@", buf, 0x16u);
              }
            }

          }
          ++v15;
        }
        while (v13 != v15);
        v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v39, 16);
      }
      while (v13);
    }

    v6 = v26;
    v5 = v27;
    v9 = v25;
  }
  if (v5)
    objc_msgSend(v28, "addObject:", v5);

  return v28;
}

- (BOOL)removeAllDataAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  BOOL v11;

  v6 = a3;
  if (-[UNCFileHandleContentProtectionStrategy removeItemAtPath:error:](self, "removeItemAtPath:error:", v6, a4))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByDeletingPathExtension");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingLastPathComponent");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByAppendingPathComponent:", CFSTR("staging"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "fileExistsAtPath:", v10)
      && (objc_msgSend(v7, "removeItemAtPath:error:", v10, a4) & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
        -[UNCFileHandleContentProtectionStrategy removeAllDataAtPath:error:].cold.1();
      v11 = 0;
    }
    else
    {
      v11 = 1;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)dataIsAvailableAtPath:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMutableDictionary objectForKey:](self->_keyedFileHandles, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)dataAtPath:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[NSMutableDictionary objectForKey:](self->_keyedFileHandles, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "fileHandle");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "seekToFileOffset:", 0);
  objc_msgSend(v4, "availableData");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "length"))
    v6 = v5;
  else
    v6 = 0;
  v7 = v6;

  return v7;
}

- (BOOL)writeData:(id)a3 atPath:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v24;

  v7 = a3;
  v8 = a4;
  -[NSMutableDictionary objectForKey:](self->_keyedFileHandles, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByDeletingPathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByDeletingLastPathComponent");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingPathComponent:", CFSTR("staging"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v10, "fileExistsAtPath:", v13) & 1) == 0)
    {
      v24 = 0;
      objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v13, 1, 0, &v24);
      v14 = v24;
      if (v14 && os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
        -[UNCFileHandleContentProtectionStrategy writeData:atPath:error:].cold.2();

    }
    if (self->_excludeFromBackup)
      -[UNCFileHandleContentProtectionStrategy _excludeItemFromBackupAtPath:](self, "_excludeItemFromBackupAtPath:", v13);
    objc_msgSend(v8, "lastPathComponent");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "stringByDeletingPathExtension");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "stringByAppendingString:", CFSTR("XXXXXX"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "stringByAppendingPathComponent:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[UNCFileHandleContentProtectionStrategy _fileHandleForCreatingStoreAtPath:protectionType:](self, "_fileHandleForCreatingStoreAtPath:protectionType:", v18, self->_fileProtectionType);
    v19 = objc_claimAutoreleasedReturnValue();
    if (!v19)
    {

      v22 = 0;
      v9 = v10;
      goto LABEL_14;
    }
    v9 = (void *)v19;
    -[NSMutableDictionary setObject:forKey:](self->_keyedFileHandles, "setObject:forKey:", v19, v8);
    if (self->_excludeFromBackup)
    {
      objc_msgSend(v9, "path");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UNCFileHandleContentProtectionStrategy _excludeItemFromBackupAtPath:](self, "_excludeItemFromBackupAtPath:", v20);

    }
  }
  objc_msgSend(v9, "fileHandle");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "truncateFileAtOffset:", 0);
  objc_msgSend(v13, "writeData:", v7);
  objc_msgSend(v9, "fileHandle");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "synchronizeFile");

  v22 = 1;
LABEL_14:

  return v22;
}

- (BOOL)removeItemAtPath:(id)a3 error:(id *)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;

  v6 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableDictionary objectForKey:](self->_keyedFileHandles, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_keyedFileHandles, "removeObjectForKey:", v6);
    objc_msgSend(v8, "fileHandle");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "synchronizeFile");

    objc_msgSend(v8, "fileHandle");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "closeFile");

    objc_msgSend(v8, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "fileExistsAtPath:", v11)
      && (objc_msgSend(v7, "removeItemAtPath:error:", v11, a4) & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
        -[UNCFileHandleContentProtectionStrategy removeAllDataAtPath:error:].cold.1();
      v12 = 0;
    }
    else
    {
      v12 = 1;
    }
  }
  else
  {
    if (objc_msgSend(v7, "fileExistsAtPath:", v6)
      && (objc_msgSend(v7, "removeItemAtPath:error:", v6, a4) & 1) == 0)
    {
      if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
        -[UNCFileHandleContentProtectionStrategy removeAllDataAtPath:error:].cold.1();
      v12 = 0;
    }
    else
    {
      v12 = 1;
    }
    v11 = v6;
  }

  return v12;
}

- (void)migrateDataAtPath:(id)a3 toPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;
  __int16 v19;
  void *v20;
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(MEMORY[0x24BDBCE50], "dataWithContentsOfFile:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0;
  -[UNCFileHandleContentProtectionStrategy writeData:atPath:error:](self, "writeData:atPath:error:", v8, v7, &v14);
  v9 = v14;
  if (v9)
  {
    v10 = v9;
    v11 = *MEMORY[0x24BDF89D0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D0], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543874;
      v16 = v6;
      v17 = 2114;
      v18 = v7;
      v19 = 2114;
      v20 = v10;
      _os_log_error_impl(&dword_2499A5000, v11, OS_LOG_TYPE_ERROR, "Migrating repository from: %{public}@ to: %{public}@ failed %{public}@", buf, 0x20u);
    }
LABEL_7:

    goto LABEL_8;
  }
  v13 = 0;
  -[UNCFileHandleContentProtectionStrategy removeItemAtPath:error:](self, "removeItemAtPath:error:", v6, &v13);
  v12 = v13;
  if (v12)
  {
    v10 = v12;
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89D0], OS_LOG_TYPE_ERROR))
      -[UNCFileHandleContentProtectionStrategy migrateDataAtPath:toPath:].cold.1();
    goto LABEL_7;
  }
LABEL_8:

}

- (id)_fileHandleForCreatingStoreAtPath:(id)a3 protectionType:(id)a4
{
  id v5;
  id v6;
  int v7;
  size_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  UNSFileHandleWrapper *v12;
  void *v13;

  v5 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDD0CD0]) & 1) != 0)
  {
    v7 = 1;
  }
  else if ((objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDD0CD8]) & 1) != 0)
  {
    v7 = 2;
  }
  else if ((objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDD0CE0]) & 1) != 0)
  {
    v7 = 3;
  }
  else
  {
    if (!objc_msgSend(v6, "isEqual:", *MEMORY[0x24BDD0CF8]))
    {
LABEL_14:
      v12 = 0;
      goto LABEL_17;
    }
    v7 = 4;
  }
  v8 = objc_msgSend(v5, "lengthOfBytesUsingEncoding:", 4) + 1;
  v9 = malloc_type_malloc(v8, 0x94622DD1uLL);
  if ((objc_msgSend(v5, "getCString:maxLength:encoding:", v9, v8, 4) & 1) == 0
    || (v10 = mkstemp_dprotected_np((char *)v9, v7, 0), (v10 & 0x80000000) != 0))
  {
    free(v9);
    goto LABEL_14;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1578]), "initWithFileDescriptor:", v10);
  if (v11)
  {
    v12 = objc_alloc_init(UNSFileHandleWrapper);
    -[UNSFileHandleWrapper setFileHandle:](v12, "setFileHandle:", v11);
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[UNSFileHandleWrapper setPath:](v12, "setPath:", v13);

  }
  else
  {
    v12 = 0;
  }
  free(v9);

LABEL_17:
  return v12;
}

- (BOOL)_isFileProtectionTypeSupported:(id)a3
{
  return (id)*MEMORY[0x24BDD0CF8] == a3
      || *MEMORY[0x24BDD0CE0] == (_QWORD)a3
      || *MEMORY[0x24BDD0CD8] == (_QWORD)a3
      || *MEMORY[0x24BDD0CD0] == (_QWORD)a3;
}

- (void)_excludeItemFromBackupAtPath:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  char v6;
  id v7;
  id v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = *MEMORY[0x24BDBCC68];
  v8 = 0;
  v6 = objc_msgSend(v4, "setResourceValue:forKey:error:", MEMORY[0x24BDBD1C8], v5, &v8);
  v7 = v8;
  if ((v6 & 1) == 0 && os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
    -[UNCFileHandleContentProtectionStrategy _excludeItemFromBackupAtPath:].cold.1();

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_keyedFileHandles, 0);
  objc_storeStrong((id *)&self->_fileProtectionType, 0);
}

- (void)removeAllDataAtPath:error:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "Could not delete %{public}@: %{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)writeData:(void *)a1 atPath:(uint64_t)a2 error:(uint64_t)a3 .cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  id v4;
  NSObject *v5;
  int v6;
  uint64_t v7;
  __int16 v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v4 = objc_begin_catch(a1);
  v5 = *MEMORY[0x24BDF89B8];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BDF89B8], OS_LOG_TYPE_ERROR))
  {
    v6 = 138543618;
    v7 = a3;
    v8 = 2114;
    v9 = v4;
    _os_log_error_impl(&dword_2499A5000, v5, OS_LOG_TYPE_ERROR, "Exception caught data at %{public}@; exception: %{public}@",
      (uint8_t *)&v6,
      0x16u);
  }

  objc_end_catch();
}

- (void)writeData:atPath:error:.cold.2()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "Could not create directory at %{public}@; error: %{public}@ for protection");
  OUTLINED_FUNCTION_6();
}

- (void)migrateDataAtPath:toPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "Removing migrated repository from: %{public}@ failed %{public}@");
  OUTLINED_FUNCTION_6();
}

- (void)_excludeItemFromBackupAtPath:.cold.1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_0_1(&dword_2499A5000, v0, v1, "Could not set 'exclude from backup' key on %{public}@; error: %{public}@");
  OUTLINED_FUNCTION_6();
}

@end
