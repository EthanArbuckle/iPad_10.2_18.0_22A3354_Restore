@implementation HVPathsBase

+ (id)topDirectory
{
  return (id)objc_msgSend(a1, "topDirectoryCreateIfNeeded:", 1);
}

+ (id)topDirectoryWithName:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL4 v4;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  void *v14;
  int v15;
  void *v16;
  uint64_t v17;

  v4 = a4;
  v17 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || !objc_msgSend(v9, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("HVPaths.m"), 118, CFSTR("failed to construct the root path"));

  }
  v10 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(v9, "stringByAppendingPathComponent:", v7);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v10);
  hv_default_log_handle();
  v12 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    v15 = 138412290;
    v16 = v11;
    _os_log_debug_impl(&dword_21AA1D000, v12, OS_LOG_TYPE_DEBUG, "using top directory: %@", (uint8_t *)&v15, 0xCu);
  }

  if (v4)
    +[HVPathsBase _createDirectoryAtPath:]((uint64_t)a1, v11);

  return v11;
}

+ (id)subdirectory:(id)a3
{
  return (id)objc_msgSend(a1, "subdirectory:createIfNeeded:", a3, 1);
}

+ (id)subdirectory:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(a1, "topDirectoryCreateIfNeeded:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  if (v4)
    +[HVPathsBase _createDirectoryAtPath:]((uint64_t)a1, v9);

  return v9;
}

+ (id)filename:(id)a3
{
  return (id)objc_msgSend(a1, "filename:createIfNeeded:", a3, 1);
}

+ (id)filename:(id)a3 createIfNeeded:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = a4;
  v6 = a3;
  v7 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(a1, "topDirectoryCreateIfNeeded:", v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v7);
  return v9;
}

+ (id)filename:(id)a3 subdirectory:(id)a4
{
  return (id)objc_msgSend(a1, "filename:subdirectory:createIfNeeded:", a3, a4, 1);
}

+ (id)filename:(id)a3 subdirectory:(id)a4 createIfNeeded:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = a5;
  v8 = a3;
  v9 = a4;
  v10 = (void *)MEMORY[0x22074FDF0]();
  objc_msgSend(a1, "subdirectory:createIfNeeded:", v9, v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingPathComponent:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v10);
  return v12;
}

+ (void)_createDirectoryAtPath:(uint64_t)a1
{
  id v2;
  id v3;
  uint64_t v4;
  char v5;
  char v6;
  void *v7;
  char v8;
  id v9;
  void *v10;
  int v11;
  NSObject *v12;
  void *v13;
  id v14;
  void *v15;
  NSObject *v16;
  NSObject *v17;
  int v18;
  NSObject *v19;
  id v20;
  id v21;
  uint8_t buf[4];
  id v23;
  __int16 v24;
  id v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v2 = a2;
  v3 = (id)objc_opt_self();
  objc_sync_enter(v3);
  v4 = *MEMORY[0x24BDD0B88];
  v5 = 1;
  while (1)
  {
    v6 = v5;
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0;
    v8 = objc_msgSend(v7, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v2, 1, 0, &v21);
    v9 = v21;

    if ((v8 & 1) != 0)
      break;
    if (objc_msgSend(v9, "code") == 640)
    {
      objc_msgSend(v9, "domain");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "isEqualToString:", v4);

      if (v11)
      {
        hv_default_log_handle();
        v19 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v23 = v2;
          _os_log_error_impl(&dword_21AA1D000, v19, OS_LOG_TYPE_ERROR, "HVPathBase: _createDirectoryAtPath: exiting due to lack of disk space while creating %@", buf, 0xCu);
        }

        if (objc_msgSend(MEMORY[0x24BE7A5C8], "isInternalBuild"))
        {
          hv_default_log_handle();
          v17 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_fault_impl(&dword_21AA1D000, v17, OS_LOG_TYPE_FAULT, "HVPathBase: unable to create directory due to lack of space.", buf, 2u);
          }
          v18 = 4002;
          goto LABEL_31;
        }
        v18 = 4002;
LABEL_32:
        HVExit(v18);
      }
    }
    if (objc_msgSend(v9, "code") == 513)
    {
      hv_default_log_handle();
      v16 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        v23 = v2;
        _os_log_error_impl(&dword_21AA1D000, v16, OS_LOG_TYPE_ERROR, "HVPathBase: _createDirectoryAtPath: exiting due to lack of write permissions to directory %@", buf, 0xCu);
      }

      if (objc_msgSend(MEMORY[0x24BE7A5C8], "isInternalBuild"))
      {
        hv_default_log_handle();
        v17 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_fault_impl(&dword_21AA1D000, v17, OS_LOG_TYPE_FAULT, "HVPathBase: unable to create directory due to lack of permissions.", buf, 2u);
        }
LABEL_24:
        v18 = 4003;
LABEL_31:

      }
      else
      {
        v18 = 4003;
      }
      goto LABEL_32;
    }
    if (objc_msgSend(v9, "code") != 516)
      break;
    hv_default_log_handle();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      v23 = v2;
      v24 = 2112;
      v25 = v9;
      _os_log_error_impl(&dword_21AA1D000, v12, OS_LOG_TYPE_ERROR, "HVPathBase: deleting file squatting at %@ due to error %@", buf, 0x16u);
    }

    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0;
    objc_msgSend(v13, "removeItemAtPath:error:", v2, &v20);
    v14 = v20;

    if (v14)
    {
      hv_default_log_handle();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        v23 = v2;
        v24 = 2112;
        v25 = v14;
        _os_log_error_impl(&dword_21AA1D000, v17, OS_LOG_TYPE_ERROR, "HVPathBase: exiting due to failure to delete squatter file %@ due to error %@", buf, 0x16u);
      }
      goto LABEL_24;
    }
    v5 = 0;
    if ((v6 & 1) == 0)
    {
      v9 = 0;
      goto LABEL_15;
    }
  }
  if (v9)
    +[HVFileErrorCode handleError:](HVFileErrorCode, "handleError:", v9);
  if ((v8 & 1) == 0)
  {
LABEL_15:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", sel__createDirectoryAtPath_, v3, CFSTR("HVPaths.m"), 224, CFSTR("HVPathBase: _createDirectoryAtPath: %@ error: %@"), v2, v9);

  }
  objc_sync_exit(v3);

}

@end
