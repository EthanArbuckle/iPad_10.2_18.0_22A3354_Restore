@implementation TVRMSNowPlayingArtworkCache

+ (id)sharedArtworkCache
{
  if (sharedArtworkCache_onceToken != -1)
    dispatch_once(&sharedArtworkCache_onceToken, &__block_literal_global_2);
  return (id)sharedArtworkCache_sharedArtworkCache;
}

void __49__TVRMSNowPlayingArtworkCache_sharedArtworkCache__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedArtworkCache_sharedArtworkCache;
  sharedArtworkCache_sharedArtworkCache = v0;

}

- (TVRMSNowPlayingArtworkCache)init
{
  TVRMSNowPlayingArtworkCache *v2;
  uint64_t v3;
  NSCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVRMSNowPlayingArtworkCache;
  v2 = -[TVRMSNowPlayingArtworkCache init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    cache = v2->_cache;
    v2->_cache = (NSCache *)v3;

    -[NSCache setCountLimit:](v2->_cache, "setCountLimit:", 5);
    -[NSCache setEvictsObjectsWithDiscardedContent:](v2->_cache, "setEvictsObjectsWithDiscardedContent:", 0);
  }
  return v2;
}

- (id)artworkDataForIdentifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  int v10;
  void *v11;

  v4 = a3;
  -[NSCache objectForKey:](self->_cache, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "artworkData");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    v8 = v6;
  }
  else
  {
    -[_RMSNowPlayingArtworkCacheItem artworkIdentifier](self->_lastItem, "artworkIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v4, "isEqualToString:", v9);

    if (!v10)
    {
      v11 = 0;
      goto LABEL_7;
    }
    -[_RMSNowPlayingArtworkCacheItem artworkData](self->_lastItem, "artworkData");
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v8;
LABEL_7:

  return v11;
}

- (id)artworkDataForNowPlayingInfo:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "artworkIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVRMSNowPlayingArtworkCache artworkDataForIdentifier:](self, "artworkDataForIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)setArtworkData:(id)a3 forIdentifier:(id)a4
{
  _RMSNowPlayingArtworkCacheItem *lastItem;
  id v7;
  id v8;
  _RMSNowPlayingArtworkCacheItem *v9;
  _RMSNowPlayingArtworkCacheItem *v10;

  if (a3)
  {
    if (a4)
    {
      lastItem = self->_lastItem;
      v7 = a4;
      v8 = a3;
      -[_RMSNowPlayingArtworkCacheItem endContentAccess](lastItem, "endContentAccess");
      v9 = (_RMSNowPlayingArtworkCacheItem *)objc_opt_new();
      -[_RMSNowPlayingArtworkCacheItem setArtworkData:](v9, "setArtworkData:", v8);

      -[_RMSNowPlayingArtworkCacheItem setArtworkIdentifier:](v9, "setArtworkIdentifier:", v7);
      -[_RMSNowPlayingArtworkCacheItem beginContentAccess](v9, "beginContentAccess");
      -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v9, v7);

      v10 = self->_lastItem;
      self->_lastItem = v9;

    }
  }
}

- (void)setArtworkData:(id)a3 forNowPlayingInfo:(id)a4
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a4, "artworkIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[TVRMSNowPlayingArtworkCache setArtworkData:forIdentifier:](self, "setArtworkData:forIdentifier:", v6, v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_lastItem, 0);
}

@end
