@implementation PRUISPosterSnapshotFilesystemCache

- (PRUISPosterSnapshotFilesystemCache)initWithURL:(id)a3
{
  id v4;
  PRUISPosterSnapshotFilesystemCache *v5;
  uint64_t v6;
  PUIPosterSnapshotFilesystemCache *underlyingCache;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PRUISPosterSnapshotFilesystemCache;
  v5 = -[PRUISPosterSnapshotFilesystemCache init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x24BE74EE0]), "initWithURL:", v4);
    underlyingCache = v5->_underlyingCache;
    v5->_underlyingCache = (PUIPosterSnapshotFilesystemCache *)v6;

  }
  return v5;
}

- (BOOL)checkCacheIsReachable:(id *)a3
{
  return -[PUIPosterSnapshotFilesystemCache checkCacheIsReachable:](self->_underlyingCache, "checkCacheIsReachable:", a3);
}

- (id)latestSnapshotBundleForRequest:(id)a3 error:(id *)a4
{
  void *v6;
  void *v7;
  void *v8;

  -[PRUISPosterSnapshotFilesystemCache puirequestForPRUISRequest:error:](self, "puirequestForPRUISRequest:error:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    -[PUIPosterSnapshotFilesystemCache latestSnapshotBundleForRequest:error:](self->_underlyingCache, "latestSnapshotBundleForRequest:error:", v6, a4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PRUISPosterSnapshotBundle snapshotBundleWithPUIPosterSnapshotBundle:](PRUISPosterSnapshotBundle, "snapshotBundleWithPUIPosterSnapshotBundle:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (BOOL)cacheSnapshotBundle:(id)a3 forRequest:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  char v9;

  v6 = a3;
  -[PRUISPosterSnapshotFilesystemCache puirequestForPRUISRequest:error:](self, "puirequestForPRUISRequest:error:", a4, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "underlyingSnapshotBundle");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[PUIPosterSnapshotFilesystemCache cacheSnapshotBundle:forRequest:](self->_underlyingCache, "cacheSnapshotBundle:forRequest:", v8, v7);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)cacheSnapshotBundle:(id)a3 forRequest:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(id, id);
  void *v10;
  id v11;
  void *v12;
  void *v13;
  char v14;
  id v16;

  v8 = a3;
  v9 = (void (**)(id, id))a5;
  v16 = 0;
  -[PRUISPosterSnapshotFilesystemCache puirequestForPRUISRequest:error:](self, "puirequestForPRUISRequest:error:", a4, &v16);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v16;
  v12 = v11;
  if (!v10 || v11)
  {
    if (v9)
      v9[2](v9, v11);
    v14 = 0;
  }
  else
  {
    objc_msgSend(v8, "underlyingSnapshotBundle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = -[PUIPosterSnapshotFilesystemCache cacheSnapshotBundle:forRequest:completion:](self->_underlyingCache, "cacheSnapshotBundle:forRequest:completion:", v13, v10, v9);

  }
  return v14;
}

- (void)discardSnapshotsForPostersMatchingPredicate:(id)a3
{
  -[PUIPosterSnapshotFilesystemCache discardSnapshotsForPostersMatchingPredicate:](self->_underlyingCache, "discardSnapshotsForPostersMatchingPredicate:", a3);
}

- (void)cleanup
{
  -[PUIPosterSnapshotFilesystemCache cleanup](self->_underlyingCache, "cleanup");
}

- (void)invalidate
{
  -[PUIPosterSnapshotFilesystemCache invalidate](self->_underlyingCache, "invalidate");
}

- (id)puirequestForPRUISRequest:(id)a3 error:(id *)a4
{
  return (id)objc_msgSend(a3, "buildPosterKitSnapshotRequestForOutput:priority:sceneAttachments:error:", 1, 0, 0, a4);
}

- (PUIPosterSnapshotFilesystemCache)underlyingCache
{
  return self->_underlyingCache;
}

- (NSURL)cacheURL
{
  return self->_cacheURL;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cacheURL, 0);
  objc_storeStrong((id *)&self->_underlyingCache, 0);
}

+ (id)_defaultCacheLocationURL
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "URLsForDirectory:inDomains:", 13, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "URLByAppendingPathComponent:isDirectory:", CFSTR("com.apple.ShareNameAndPhoto"), 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)incomingCallSnapshotCache
{
  void *v2;
  void *v3;
  void *v4;
  char v5;
  id v6;
  PRUISPosterSnapshotFilesystemCache *v7;
  NSObject *v8;
  id v10;

  objc_msgSend(a1, "_defaultCacheLocationURL");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  PFFileProtectionNoneAttributes();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0;
  v5 = objc_msgSend(v3, "createDirectoryAtURL:withIntermediateDirectories:attributes:error:", v2, 1, v4, &v10);
  v6 = v10;

  if ((v5 & 1) != 0)
  {
    v7 = -[PRUISPosterSnapshotFilesystemCache initWithURL:]([PRUISPosterSnapshotFilesystemCache alloc], "initWithURL:", v2);
  }
  else
  {
    PRUISLogSnapshotting();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      +[PRUISPosterSnapshotFilesystemCache(IncomingCallAdditions) incomingCallSnapshotCache].cold.1((uint64_t)v2, (uint64_t)v6, v8);

    v7 = 0;
  }

  return v7;
}

@end
