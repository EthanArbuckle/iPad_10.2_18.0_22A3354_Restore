@implementation TSUTemporaryDirectory

- (TSUTemporaryDirectory)init
{
  return -[TSUTemporaryDirectory initWithSignature:subdirectory:](self, "initWithSignature:subdirectory:", &stru_24D61C228, 0);
}

- (TSUTemporaryDirectory)initWithSignature:(id)a3
{
  return -[TSUTemporaryDirectory initWithSignature:subdirectory:](self, "initWithSignature:subdirectory:", a3, 0);
}

- (TSUTemporaryDirectory)initWithSignature:(id)a3 subdirectory:(id)a4
{
  TSUTemporaryDirectory *v6;
  TSUTemporaryDirectory *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSUTemporaryDirectory;
  v6 = -[TSUTemporaryDirectory init](&v9, sel_init);
  v7 = v6;
  if (v6)
    -[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:](v6, "_createDirectoryWithSignature:subdirectory:", a3, a4);
  return v7;
}

- (void)dealloc
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  id v9;

  if (!self->_leak)
  {
    v9 = 0;
    if ((objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtPath:error:", self->_path, &v9) & 1) == 0)
    {
      if (objc_msgSend(v9, "code") != 4
        || (v7 = (void *)objc_msgSend(v9, "domain"),
            (objc_msgSend(v7, "isEqualToString:", *MEMORY[0x24BDD0B88]) & 1) == 0))
      {
        TSULogErrorInFunction((uint64_t)"-[TSUTemporaryDirectory dealloc]", (uint64_t)"/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUTemporaryDirectory.mm", 65, (uint64_t)CFSTR("Failed to remove TSUTemporaryDirectory. Error: %@, path: %@"), v3, v4, v5, v6, (uint64_t)v9);
      }
    }
  }

  v8.receiver = self;
  v8.super_class = (Class)TSUTemporaryDirectory;
  -[TSUTemporaryDirectory dealloc](&v8, sel_dealloc);
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

- (void)_createDirectoryWithSignature:(id)a3 subdirectory:(id)a4
{
  const __CFString *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  const __CFString *v10;
  uint64_t v11;
  id v12;
  uint64_t v13;
  double Current;
  void *v15;
  unsigned int v16;
  uint64_t v17;
  void *v18;
  char *v19;
  NSString *v20;
  NSString *v21;
  uint64_t v22;

  if (a3)
    v6 = (const __CFString *)a3;
  else
    v6 = &stru_24D61C228;
  if (!-[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]::secretSubdirectoryNameBase)
  {
    objc_sync_enter(self);
    if (!-[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]::secretSubdirectoryNameBase)
    {
      v7 = objc_msgSend((id)SFUBundle(), "bundleIdentifier");
      v8 = objc_alloc(MEMORY[0x24BDD17C8]);
      v9 = getpid();
      v10 = CFSTR("com.apple.Unknown");
      if (v7)
        v10 = (const __CFString *)v7;
      v11 = objc_msgSend(v8, "initWithFormat:", CFSTR("%@_%d"), v10, v9);
      __dmb(0xBu);
      -[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]::secretSubdirectoryNameBase = v11;
      if (!v11)
      {
        v12 = +[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler");
        v13 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]");
        objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/utility/TSUTemporaryDirectory.mm"), 105, CFSTR("Couldn't initialize lazy variable %s"), "secretSubdirectoryNameBase");
      }
    }
    objc_sync_exit(self);
  }
  Current = CFAbsoluteTimeGetCurrent();
  v15 = (void *)-[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]::secretSubdirectoryNameBase;
  do
  {
    v16 = __ldaxr((unsigned int *)&-[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]::secretSubdirectoryIndex);
    v17 = v16 + 1;
  }
  while (__stlxr(v17, (unsigned int *)&-[TSUTemporaryDirectory _createDirectoryWithSignature:subdirectory:]::secretSubdirectoryIndex));
  v18 = (void *)objc_msgSend(v15, "stringByAppendingFormat:", CFSTR("_%@_%d_%d"), v6, (int)Current, v17);
  if ((unint64_t)objc_msgSend(v18, "length") >= 0x100)
    v18 = (void *)objc_msgSend(v18, "substringToIndex:", 255);
  v19 = getenv("CIRRUSEXPORTERTEMPDIR");
  if (v19)
  {
    v20 = (NSString *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", v19);
    if (!a4)
      goto LABEL_18;
    goto LABEL_17;
  }
  v20 = NSTemporaryDirectory();
  if (a4)
LABEL_17:
    v20 = -[NSString stringByAppendingPathComponent:](v20, "stringByAppendingPathComponent:", a4);
LABEL_18:
  v21 = -[NSString stringByAppendingPathComponent:](v20, "stringByAppendingPathComponent:", v18);
  v22 = 0;
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v21, 1, 0, &v22))self->_path = v21;
  else
    objc_msgSend(MEMORY[0x24BDBCE88], "tsu_raiseWithError:", v22);
}

@end
