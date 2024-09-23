@implementation OITSUTemporaryDirectory

- (OITSUTemporaryDirectory)init
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUTemporaryDirectory init]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectory.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 26, 0, "Do not call method");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[OITSUTemporaryDirectory init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (OITSUTemporaryDirectory)initWithError:(id *)a3
{
  return -[OITSUTemporaryDirectory initWithSignature:subdirectory:error:](self, "initWithSignature:subdirectory:error:", &stru_24F3BFFF8, 0, a3);
}

- (OITSUTemporaryDirectory)initWithSignature:(id)a3 error:(id *)a4
{
  return -[OITSUTemporaryDirectory initWithSignature:subdirectory:error:](self, "initWithSignature:subdirectory:error:", a3, 0, a4);
}

- (OITSUTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  OITSUTemporaryDirectory *v10;
  OITSUTemporaryDirectory *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)OITSUTemporaryDirectory;
  v10 = -[OITSUTemporaryDirectory init](&v13, sel_init);
  v11 = v10;
  if (v10
    && !-[OITSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:error:](v10, "_createDirectoryWithSignature:subdirectory:error:", v8, v9, a5))
  {

    v11 = 0;
  }

  return v11;
}

- (id)initForWritingToURL:(id)a3 error:(id *)a4
{
  id v6;
  OITSUTemporaryDirectory *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  NSString *path;
  objc_super v13;

  v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)OITSUTemporaryDirectory;
  v7 = -[OITSUTemporaryDirectory init](&v13, sel_init);
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "URLForDirectory:inDomain:appropriateForURL:create:error:", 99, 1, v6, 1, a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "path");
    v10 = objc_claimAutoreleasedReturnValue();
    path = v7->_path;
    v7->_path = (NSString *)v10;

    if (!v9)
    {

      v7 = 0;
    }

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  NSString *path;
  char v5;
  id v6;
  void *v7;
  char v8;
  objc_super v9;
  id v10;

  if (!self->_leak)
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    path = self->_path;
    v10 = 0;
    v5 = objc_msgSend(v3, "removeItemAtPath:error:", path, &v10);
    v6 = v10;
    v7 = v6;
    if ((v5 & 1) != 0)
    {

    }
    else
    {
      v8 = objc_msgSend(v6, "tsu_isNoSuchFileError");

      if ((v8 & 1) == 0 && TSUDefaultCat_init_token != -1)
        dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_8);
    }

  }
  v9.receiver = self;
  v9.super_class = (Class)OITSUTemporaryDirectory;
  -[OITSUTemporaryDirectory dealloc](&v9, sel_dealloc);
}

void __34__OITSUTemporaryDirectory_dealloc__block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (id)path
{
  return self->_path;
}

- (id)URL
{
  return (id)objc_msgSend(MEMORY[0x24BDBCF48], "fileURLWithPath:isDirectory:", self->_path, 1);
}

- (void)leakTemporaryDirectory
{
  self->_leak = 1;
}

- (BOOL)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4 error:(id *)a5
{
  __CFString *v8;
  id v9;
  __CFString *v10;
  double Current;
  void *v12;
  unsigned int v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  char *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  char v23;
  id v24;
  id v25;
  id v27;

  v8 = (__CFString *)a3;
  v9 = a4;
  if (v8)
    v10 = v8;
  else
    v10 = &stru_24F3BFFF8;
  if (_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryNameBaseToken != -1)
    dispatch_once(&_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryNameBaseToken, &__block_literal_global_13);
  Current = CFAbsoluteTimeGetCurrent();
  v12 = (void *)_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryNameBase;
  do
  {
    v13 = __ldaxr((unsigned int *)&_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryIndex);
    v14 = v13 + 1;
  }
  while (__stlxr(v14, (unsigned int *)&_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryIndex));
  objc_msgSend(v12, "stringByAppendingFormat:", CFSTR("_%@_%d_%d"), v10, (int)Current, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v15, "length") >= 0x100)
  {
    objc_msgSend(v15, "substringToIndex:", 255);
    v16 = objc_claimAutoreleasedReturnValue();

    v15 = (void *)v16;
  }
  v17 = getenv("CIRRUSEXPORTERTEMPDIR");
  if (v17)
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v17);
  else
    NSTemporaryDirectory();
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v9)
  {
    objc_msgSend(v18, "stringByAppendingPathComponent:", v9);
    v20 = objc_claimAutoreleasedReturnValue();

    v19 = (void *)v20;
  }
  objc_msgSend(v19, "stringByAppendingPathComponent:", v15);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  v23 = objc_msgSend(v22, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v27);
  v24 = v27;

  objc_storeStrong((id *)&self->_path, v21);
  if (a5 && (v23 & 1) == 0)
  {
    if (v24)
    {
      *a5 = objc_retainAutorelease(v24);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1540], "tsu_fileWriteUnknownErrorWithUserInfo:", 0);
      v25 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      *a5 = v25;

    }
  }

  return v23;
}

void __76__OITSUTemporaryDirectory__createDirectoryWithSignature_subdirectory_error___block_invoke()
{
  void *v0;
  id v1;
  const __CFString *v2;
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;

  SFUBundle();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  v1 = objc_alloc(MEMORY[0x24BDD17C8]);
  if (v6)
    v2 = v6;
  else
    v2 = CFSTR("com.apple.Unknown");
  v3 = (void *)objc_msgSend(v1, "initWithFormat:", CFSTR("%@_%d"), v2, getpid());
  objc_storeStrong((id *)&_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryNameBase, v3);
  if (!_createDirectoryWithSignature_subdirectory_error__secretSubdirectoryNameBase)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[OITSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:error:]_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectory.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v4, v5, 102, 0, "invalid nil value for '%{public}s'", "secretSubdirectoryNameBase");

    +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_path, 0);
}

@end
