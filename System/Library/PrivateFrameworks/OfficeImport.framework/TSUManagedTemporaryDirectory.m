@implementation TSUManagedTemporaryDirectory

- (TSUManagedTemporaryDirectory)initWithURL:(id)a3
{
  id v4;
  TSUManagedTemporaryDirectory *v5;
  uint64_t v6;
  NSURL *URL;
  TSUManagedTemporaryDirectory *v8;
  objc_super v10;

  v4 = a3;
  if (v4)
  {
    v10.receiver = self;
    v10.super_class = (Class)TSUManagedTemporaryDirectory;
    v5 = -[TSUManagedTemporaryDirectory init](&v10, sel_init);
    if (v5)
    {
      v6 = objc_msgSend(v4, "copy");
      URL = v5->_URL;
      v5->_URL = (NSURL *)v6;

    }
    self = v5;
    v8 = self;
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (TSUManagedTemporaryDirectory)init
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUManagedTemporaryDirectory init]");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/OfficeImport/OfficeParser/shared/utility/TSUTemporaryDirectoryManager.m");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[OITSUAssertionHandler handleFailureInFunction:file:lineNumber:isFatal:description:](OITSUAssertionHandler, "handleFailureInFunction:file:lineNumber:isFatal:description:", v2, v3, 30, 0, "Do not call method");

  +[OITSUAssertionHandler logBacktraceThrottled](OITSUAssertionHandler, "logBacktraceThrottled");
  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%s: %s"), "Do not call method", "-[TSUManagedTemporaryDirectory init]");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "exceptionWithName:reason:userInfo:", v5, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (void)dealloc
{
  void *v3;
  NSURL *URL;
  char v5;
  objc_super v6;
  uint64_t v7;

  if (TSUManagedTemporaryLogCat_init_token != -1)
    dispatch_once(&TSUManagedTemporaryLogCat_init_token, &__block_literal_global_30);
  if (-[NSURL checkResourceIsReachableAndReturnError:](self->_URL, "checkResourceIsReachableAndReturnError:", 0))
  {
    objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    URL = self->_URL;
    v7 = 0;
    v5 = objc_msgSend(v3, "removeItemAtURL:error:", URL, &v7);

    if ((v5 & 1) == 0 && TSUDefaultCat_init_token != -1)
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_10_0);
  }
  v6.receiver = self;
  v6.super_class = (Class)TSUManagedTemporaryDirectory;
  -[TSUManagedTemporaryDirectory dealloc](&v6, sel_dealloc);
}

void __39__TSUManagedTemporaryDirectory_dealloc__block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUManagedTemporaryLogCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUManagedTemporaryLogCat_log_t;
  TSUManagedTemporaryLogCat_log_t = v0;

}

void __39__TSUManagedTemporaryDirectory_dealloc__block_invoke_2()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

- (NSURL)URL
{
  return self->_URL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_URL, 0);
}

@end
