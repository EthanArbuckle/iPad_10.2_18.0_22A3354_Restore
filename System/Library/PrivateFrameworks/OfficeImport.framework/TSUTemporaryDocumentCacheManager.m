@implementation TSUTemporaryDocumentCacheManager

+ (id)baseDirectoryURL
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v6;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v2, "URLForDirectory:inDomain:appropriateForURL:create:error:", 13, 1, 0, 1, &v6);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    objc_msgSend(v3, "URLByAppendingPathComponent:", CFSTR("DocumentCaches"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (TSUDefaultCat_init_token != -1)
      dispatch_once(&TSUDefaultCat_init_token, &__block_literal_global_19);
    v4 = 0;
  }

  return v4;
}

void __52__TSUTemporaryDocumentCacheManager_baseDirectoryURL__block_invoke()
{
  uint64_t v0;
  void *v1;

  TSULogCreateCategory("TSUDefaultCat");
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)TSUDefaultCat_log_t;
  TSUDefaultCat_log_t = v0;

}

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __49__TSUTemporaryDocumentCacheManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_sharedManager;
}

void __49__TSUTemporaryDocumentCacheManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = v0;

}

- (id)newDirectoryForDocumentUUID:(id)a3
{
  void *v4;
  id v5;

  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[TSUTemporaryDirectoryManager newDirectoryWithFilename:](self, "newDirectoryWithFilename:", v4);

  return v5;
}

@end
