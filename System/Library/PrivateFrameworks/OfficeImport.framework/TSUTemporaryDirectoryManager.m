@implementation TSUTemporaryDirectoryManager

+ (id)baseDirectoryURL
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUTemporaryDirectoryManager baseDirectoryURL]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 51, 0, "Abstract method not overridden by %@", v5);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v10, "+[TSUTemporaryDirectoryManager baseDirectoryURL]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

+ (Class)managedTemporaryDirectoryClass
{
  return (Class)objc_opt_class();
}

+ (id)sharedManager
{
  void *v2;
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_class *v9;
  void *v10;
  void *v11;
  id v12;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUTemporaryDirectoryManager sharedManager]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 59, 0, "Abstract method not overridden by %@", v5);

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v6 = (void *)MEMORY[0x24BDBCE88];
  v7 = *MEMORY[0x24BDBCAB0];
  v8 = (void *)MEMORY[0x24BDD17C8];
  v9 = (objc_class *)objc_opt_class();
  NSStringFromClass(v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringWithFormat:", CFSTR("Abstract method not overridden by %@: %s"), v10, "+[TSUTemporaryDirectoryManager sharedManager]");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "exceptionWithName:reason:userInfo:", v7, v11, 0);
  v12 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v12);
}

+ (id)makeUniqueDirectoryWithBaseDirectory:(id)a3 filename:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  const char *v13;
  size_t v14;
  char *v15;
  char *v16;
  char *v17;
  char *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v26;

  v5 = a3;
  v6 = a4;
  v7 = v6;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUTemporaryDirectoryManager makeUniqueDirectoryWithBaseDirectory:filename:]");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v21, v22, 63, 0, "invalid nil value for '%{public}s'", "baseDirectory");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    if (v7)
      goto LABEL_3;
LABEL_13:
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "+[TSUTemporaryDirectoryManager makeUniqueDirectoryWithBaseDirectory:filename:]");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v23, v24, 64, 0, "invalid nil value for '%{public}s'", "filename");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    goto LABEL_3;
  }
  if (!v6)
    goto LABEL_13;
LABEL_3:
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0;
  v9 = objc_msgSend(v8, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v5, 1, 0, &v26);

  if ((v9 & 1) == 0 && TSUDefaultCat_init_token != -1)
    dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_30);
  v10 = 0;
  if (v5 && v7)
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR(".XXXXXX"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "stringByAppendingPathComponent:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v5 = objc_retainAutorelease(v12);
    v13 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
    if (v13 && (v14 = strlen(v13), (v15 = (char *)malloc_type_calloc(v14 + 1, 1uLL, 0x100004077774924uLL)) != 0))
    {
      v16 = v15;
      v5 = objc_retainAutorelease(v5);
      v17 = strncpy(v16, (const char *)objc_msgSend(v5, "fileSystemRepresentation"), v14);
      v16[v14] = 0;
      v18 = mkdtemp(v17);
      if (v18)
      {
        v19 = (void *)MEMORY[0x24BDBCF48];
        objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "tsu_fileURLWithPath:", v20);
        v10 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v10 = 0;
      }
      free(v16);
    }
    else
    {
      v10 = 0;
    }
  }

  return v10;
}

void __78__TSUTemporaryDirectoryManager_makeUniqueDirectoryWithBaseDirectory_filename___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (TSUTemporaryDirectoryManager)init
{
  TSUTemporaryDirectoryManager *v2;
  void *v3;
  uint64_t v4;
  NSURL *baseDirectoryURL;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  _QWORD block[4];
  id v12;
  TSUTemporaryDirectoryManager *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)TSUTemporaryDirectoryManager;
  v2 = -[TSUTemporaryDirectoryManager init](&v14, sel_init);
  if (v2)
  {
    objc_msgSend((id)objc_opt_class(), "baseDirectoryURL");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "copy");
    baseDirectoryURL = v2->_baseDirectoryURL;
    v2->_baseDirectoryURL = (NSURL *)v4;

    if (!v2->_baseDirectoryURL)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUTemporaryDirectoryManager init]");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v6, v7, 101, 0, "invalid nil value for '%{public}s'", "_baseDirectoryURL");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    }
    -[TSUTemporaryDirectoryManager _readDirectories](v2, "_readDirectories");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "count"))
    {
      dispatch_get_global_queue(-32768, 0);
      v9 = objc_claimAutoreleasedReturnValue();
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __36__TSUTemporaryDirectoryManager_init__block_invoke;
      block[3] = &unk_24F39B500;
      v12 = v8;
      v13 = v2;
      dispatch_async(v9, block);

    }
  }
  return v2;
}

uint64_t __36__TSUTemporaryDirectoryManager_init__block_invoke(uint64_t a1)
{
  if (TSUManagedTemporaryLogCat_init_token != -1)
    dispatch_once(&TSUManagedTemporaryLogCat_init_token, &__block_literal_global_36);
  return objc_msgSend(*(id *)(a1 + 40), "_clearDirectories:", *(_QWORD *)(a1 + 32));
}

void __36__TSUTemporaryDirectoryManager_init__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUManagedTemporaryLogCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUManagedTemporaryLogCat_log_t;
  TSUManagedTemporaryLogCat_log_t = v0;

}

- (id)_readDirectories
{
  void *v3;
  NSURL *baseDirectoryURL;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  _QWORD v20[2];

  v20[1] = *MEMORY[0x24BDAC8D0];
  if (self->_baseDirectoryURL)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    baseDirectoryURL = self->_baseDirectoryURL;
    v20[0] = *MEMORY[0x24BDBCCD8];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v20, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "contentsOfDirectoryAtURL:includingPropertiesForKeys:options:error:", baseDirectoryURL, v5, 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v6, "count"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v6;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v16;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v16 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v12), "path", (_QWORD)v15);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v13);

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v10);
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

- (void)_clearDirectories:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "removeItemAtPath:error:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++), 0, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (id)newDirectoryWithFilename:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSURL *baseDirectoryURL;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  objc_class *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;

  v4 = a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUTemporaryDirectoryManager newDirectoryWithFilename:]");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v5, v6, 139, 0, "invalid nil value for '%{public}s'", "filename");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "UUIDString");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  v8 = (void *)objc_opt_class();
  -[NSURL path](self->_baseDirectoryURL, "path");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "makeUniqueDirectoryWithBaseDirectory:filename:", v9, v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
  {
    if (TSUDefaultCat_init_token != -1)
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_40);
    baseDirectoryURL = self->_baseDirectoryURL;
    objc_msgSend(MEMORY[0x24BDD1880], "UUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSURL URLByAppendingPathComponent:](baseDirectoryURL, "URLByAppendingPathComponent:", v13);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUTemporaryDirectoryManager newDirectoryWithFilename:]");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v14, v15, 151, 0, "invalid nil value for '%{public}s'", "URL");

      +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
      v10 = 0;
    }
  }
  v16 = (objc_class *)objc_msgSend((id)objc_opt_class(), "managedTemporaryDirectoryClass");
  if ((-[objc_class isSubclassOfClass:](v16, "isSubclassOfClass:", objc_opt_class()) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUTemporaryDirectoryManager newDirectoryWithFilename:]");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    NSStringFromClass(v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v17, v18, 154, 0, "Invalid managed temporary directory class: %{public}@", v19);

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }
  v20 = (void *)objc_msgSend([v16 alloc], "initWithURL:", v10);

  return v20;
}

void __57__TSUTemporaryDirectoryManager_newDirectoryWithFilename___block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseDirectoryURL, 0);
}

@end
