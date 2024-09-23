@implementation APFileSystemAdapter

- (BOOL)writeData:(id)a3 toFile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  unsigned int v16;
  BOOL v17;
  uint64_t v18;
  NSObject *v19;
  const char *v20;
  uint64_t v21;
  id v23;
  id v24;
  uint8_t buf[4];
  id v26;
  __int16 v27;
  id v28;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ name cannot be nil"), objc_opt_class(self));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    APSimulateCrash(5, v11, 1);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter fileToFilePath:error:](self, "fileToFilePath:error:", v9, a5));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter secureFileManager](self, "secureFileManager"));
    v24 = 0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "fileForWritingAtKeyPath:error:", v12, &v24));
    v15 = v24;

    if (!v14 || v15)
    {
      if (a5)
      {
LABEL_14:
        v15 = objc_retainAutorelease(v15);
        *a5 = v15;
LABEL_19:

        v17 = 0;
        goto LABEL_20;
      }
      v18 = APLogForCategory(32);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543619;
        v26 = v9;
        v27 = 2113;
        v28 = v15;
        v20 = "Failed to open (w) file for object '%{public}@'. %{private}@";
LABEL_17:
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, v20, buf, 0x16u);
      }
    }
    else
    {
      v23 = 0;
      v16 = objc_msgSend(v14, "addData:error:", v8, &v23);
      v15 = v23;
      objc_msgSend(v14, "close");
      if (v16 && !v15)
      {
        v17 = 1;
LABEL_20:

        goto LABEL_21;
      }
      if (a5)
        goto LABEL_14;
      v21 = APLogForCategory(32);
      v19 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543619;
        v26 = v9;
        v27 = 2113;
        v28 = v15;
        v20 = "Failed to write file for object '%{public}@'. %{private}@";
        goto LABEL_17;
      }
    }

    goto LABEL_19;
  }
  v17 = 0;
LABEL_21:

  return v17;
}

- (APStorageManager)secureFileManager
{
  return self->_secureFileManager;
}

- (id)fileToFilePath:(id)a3 error:(id *)a4
{
  return sub_10000EEE8((uint64_t)APFileNameConverter, a3, (uint64_t)a4);
}

- (id)readDataFromFile:(id)a3 error:(id *)a4
{
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSObject *v15;
  uint64_t v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v6 = a3;
  if (!v6)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ name cannot be nil"), objc_opt_class(self));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    APSimulateCrash(5, v8, 1);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter fileToFilePath:error:](self, "fileToFilePath:error:", v6, a4));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter secureFileManager](self, "secureFileManager"));
    v19 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "fileForReadingAtKeyPath:error:", v9, &v19));
    v12 = v19;

    if (!v11 || v12)
    {
      if (a4)
      {
        v13 = 0;
        *a4 = objc_retainAutorelease(v12);
      }
      else
      {
        v16 = APLogForCategory(32);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543619;
          v21 = v6;
          v22 = 2113;
          v23 = v12;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to open (r) file for object '%{public}@'. %{private}@", buf, 0x16u);
        }

        v13 = 0;
      }
    }
    else
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "nextObjectData"));
      objc_msgSend(v11, "close");
      if (!v13)
      {
        v14 = APLogForCategory(32);
        v15 = objc_claimAutoreleasedReturnValue(v14);
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          v21 = v6;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Failed to read file for object '%{public}@'.", buf, 0xCu);
        }

      }
    }

  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (APFileSystemAdapter)init
{
  APFileSystemAdapter *v2;
  APStorageManager *v3;
  APStorageManager *secureFileManager;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)APFileSystemAdapter;
  v2 = -[APFileSystemAdapter init](&v6, "init");
  if (v2)
  {
    v3 = (APStorageManager *)objc_msgSend(objc_alloc((Class)APStorageManager), "initWithPathPrefix:", CFSTR("y"));
    secureFileManager = v2->_secureFileManager;
    v2->_secureFileManager = v3;

  }
  return v2;
}

- (BOOL)removeFile:(id)a3 error:(id *)a4
{
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  unsigned int v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v6 = a3;
  if (!v6)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ name cannot be nil"), objc_opt_class(self));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    APSimulateCrash(5, v8, 1);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter fileToFilePath:error:](self, "fileToFilePath:error:", v6, a4));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter secureFileManager](self, "secureFileManager"));
    v16 = 0;
    v11 = objc_msgSend(v10, "removeObjectAtPath:error:", v9, &v16);
    v12 = v16;

    if (!v11 || v12)
    {
      if (a4)
      {
        *a4 = objc_retainAutorelease(v12);
      }
      else
      {
        v13 = APLogForCategory(32);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543618;
          v18 = v6;
          v19 = 2112;
          v20 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to remove file for object '%{public}@'. %{object}@", buf, 0x16u);
        }

      }
    }

  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (id)getFileLastModifiedDate:(id)a3 error:(id *)a4
{
  id v6;
  NSString *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  NSObject *v14;
  id v16;
  uint8_t buf[4];
  id v18;
  __int16 v19;
  id v20;

  v6 = a3;
  if (!v6)
  {
    v7 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ name cannot be nil"), objc_opt_class(self));
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    APSimulateCrash(5, v8, 1);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter fileToFilePath:error:](self, "fileToFilePath:error:", v6, a4));
  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter secureFileManager](self, "secureFileManager"));
    v16 = 0;
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "lastModifiedDateForFileAtPath:error:", v9, &v16));
    v12 = v16;

    if (!v11 || v12)
    {
      if (a4)
      {
        *a4 = objc_retainAutorelease(v12);
      }
      else
      {
        v13 = APLogForCategory(32);
        v14 = objc_claimAutoreleasedReturnValue(v13);
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543619;
          v18 = v6;
          v19 = 2113;
          v20 = v12;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Failed to get last modified date for object '%{public}@'. %{private}@", buf, 0x16u);
        }

      }
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (BOOL)setLastModifiedDate:(id)a3 toFile:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  NSString *v10;
  void *v11;
  void *v12;
  void *v13;
  unsigned int v14;
  id v15;
  uint64_t v16;
  NSObject *v17;
  id v19;
  uint8_t buf[4];
  id v21;
  __int16 v22;
  id v23;

  v8 = a3;
  v9 = a4;
  if (!v9)
  {
    v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ name cannot be nil"), objc_opt_class(self));
    v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
    APSimulateCrash(5, v11, 1);

  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter fileToFilePath:error:](self, "fileToFilePath:error:", v9, a5));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter secureFileManager](self, "secureFileManager"));
    v19 = 0;
    v14 = objc_msgSend(v13, "touchFileAtPath:error:", v12, &v19);
    v15 = v19;

    if (!v14 || v15)
    {
      if (a5)
      {
        *a5 = objc_retainAutorelease(v15);
      }
      else
      {
        v16 = APLogForCategory(32);
        v17 = objc_claimAutoreleasedReturnValue(v16);
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543619;
          v21 = v9;
          v22 = 2113;
          v23 = v15;
          _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Failed to update last modified date for object '%{public}@'. %{private}@", buf, 0x16u);
        }

      }
    }

  }
  else
  {
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (BOOL)fileExists:(id)a3
{
  id v4;
  NSString *v5;
  void *v6;
  void *v7;
  void *v8;
  unsigned __int8 v9;
  id v10;
  uint64_t v11;
  NSObject *v12;
  id v14;
  uint8_t buf[4];
  id v16;
  __int16 v17;
  id v18;

  v4 = a3;
  if (!v4)
  {
    v5 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@ name cannot be nil"), objc_opt_class(self));
    v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
    APSimulateCrash(5, v6, 1);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter fileToFilePath:error:](self, "fileToFilePath:error:", v4, 0));
  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter secureFileManager](self, "secureFileManager"));
    v14 = 0;
    v9 = objc_msgSend(v8, "fileExistsAtPath:error:", v7, &v14);
    v10 = v14;

    if (v10)
    {
      v11 = APLogForCategory(32);
      v12 = objc_claimAutoreleasedReturnValue(v11);
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138543619;
        v16 = v4;
        v17 = 2113;
        v18 = v10;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Failed to get file exists status for object '%{public}@'. %{private}@", buf, 0x16u);
      }

    }
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)enumeratorForFilesWithExtension:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  APFilesEnumerator *v7;
  void *v8;
  APFilesEnumerator *v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter secureFileManager](self, "secureFileManager"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "iterateObjectsIncludingFolders:", 0));

  v7 = [APFilesEnumerator alloc];
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter secureFileManager](self, "secureFileManager"));
  v9 = -[APFilesEnumerator initWithObjectsIterator:fileManager:extension:](v7, "initWithObjectsIterator:fileManager:extension:", v6, v8, v4);

  return v9;
}

- (id)getStorageInfo
{
  void *v3;
  APFileSystemStorageInfo *v4;
  void *v5;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v3 = objc_autoreleasePoolPush();
  v4 = objc_alloc_init(APFileSystemStorageInfo);
  v8 = 0;
  v9 = 0;
  v7 = 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[APFileSystemAdapter secureFileManager](self, "secureFileManager"));
  objc_msgSend(v5, "getStorageSize:allocatedSize:files:", &v9, &v8, &v7);

  -[APFileSystemStorageInfo setTotalSize:](v4, "setTotalSize:", v9);
  -[APFileSystemStorageInfo setAllocatedSize:](v4, "setAllocatedSize:", v8);
  -[APFileSystemStorageInfo setFilesCount:](v4, "setFilesCount:", v7);
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (void)setSecureFileManager:(id)a3
{
  objc_storeStrong((id *)&self->_secureFileManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secureFileManager, 0);
}

@end
