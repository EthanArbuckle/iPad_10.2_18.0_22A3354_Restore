@implementation MTAVAssetCache

- (MTAVAssetCache)init
{
  MTAVAssetCache *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  AVAssetCache *assetCache;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)MTAVAssetCache;
  v2 = -[MTAVAssetCache init](&v16, sel_init);
  if (v2)
  {
    v3 = +[MTAVAssetCachePlatformConfiguration platformConfiguration](MTAVAssetCachePlatformConfiguration, "platformConfiguration");
    v5 = v4;
    NSTemporaryDirectory();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("PodcastsAVAssetCache"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "fileExistsAtPath:", v7);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v7, 1, 0, 0);

    }
    v11 = (void *)MEMORY[0x1E0C8AF98];
    objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:", v7);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "assetCacheWithURL:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    assetCache = v2->_assetCache;
    v2->_assetCache = (AVAssetCache *)v13;

    -[AVAssetCache setMaxEntrySize:](v2->_assetCache, "setMaxEntrySize:", v3);
    -[AVAssetCache setMaxSize:](v2->_assetCache, "setMaxSize:", v5);

  }
  return v2;
}

- (AVAssetCache)assetCache
{
  return self->_assetCache;
}

+ (void)_asyncPrewarm
{
  NSObject *v2;

  dispatch_get_global_queue(21, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  dispatch_async(v2, &__block_literal_global_3);

}

id __31__MTAVAssetCache__asyncPrewarm__block_invoke()
{
  return +[MTSingleton sharedInstance](MTAVAssetCache, "sharedInstance");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetCache, 0);
}

@end
