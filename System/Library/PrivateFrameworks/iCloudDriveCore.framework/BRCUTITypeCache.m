@implementation BRCUTITypeCache

+ (id)defaultCache
{
  if (defaultCache_onceToken != -1)
    dispatch_once(&defaultCache_onceToken, &__block_literal_global_39);
  return (id)defaultCache_defaultCache;
}

void __31__BRCUTITypeCache_defaultCache__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[BRCUTITypeCache _init]([BRCUTITypeCache alloc], "_init");
  v1 = (void *)defaultCache_defaultCache;
  defaultCache_defaultCache = (uint64_t)v0;

}

- (id)_init
{
  BRCUTITypeCache *v2;
  uint64_t v3;
  NSCache *utiCache;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)BRCUTITypeCache;
  v2 = -[BRCUTITypeCache init](&v7, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    utiCache = v2->_utiCache;
    v2->_utiCache = (NSCache *)v3;

    +[BRCUserDefaults defaultsForMangledID:](BRCUserDefaults, "defaultsForMangledID:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCache setCountLimit:](v2->_utiCache, "setCountLimit:", objc_msgSend(v5, "utiCacheSize"));

    -[NSCache setEvictsObjectsWithDiscardedContent:](v2->_utiCache, "setEvictsObjectsWithDiscardedContent:", 1);
  }
  return v2;
}

- (id)_utiForExtension:(id)a3
{
  return (id)(id)UTTypeCreatePreferredIdentifierForTag((CFStringRef)*MEMORY[0x24BDC1658], (CFStringRef)a3, 0);
}

- (id)_getLaunchServicesDatabaseGeneration
{
  void *v2;
  id v3;
  id v5;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 0;
  objc_msgSend(v2, "getKnowledgeUUID:andSequenceNumber:", 0, &v5);
  v3 = v5;

  return v3;
}

- (void)_invalidateCahceIfNeeded
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_debug_impl(&dword_230455000, a2, OS_LOG_TYPE_DEBUG, "[DEBUG] Invalidating UTI cache%@", (uint8_t *)&v2, 0xCu);
}

- (id)UTIForExtension:(id)a3
{
  id v4;
  BRCUTITypeCache *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  BRCUTITypeCache *v10;
  NSCache *utiCache;
  void *v12;

  v4 = a3;
  -[BRCUTITypeCache _invalidateCahceIfNeeded](self, "_invalidateCahceIfNeeded");
  v5 = self;
  objc_sync_enter(v5);
  -[NSCache objectForKey:](v5->_utiCache, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
      v8 = 0;
    else
      v8 = v6;
    objc_sync_exit(v5);

  }
  else
  {
    objc_sync_exit(v5);

    -[BRCUTITypeCache _utiForExtension:](v5, "_utiForExtension:", v4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v5;
    objc_sync_enter(v10);
    utiCache = v5->_utiCache;
    if (v9)
    {
      -[NSCache setObject:forKey:](v5->_utiCache, "setObject:forKey:", v9, v4);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCache setObject:forKey:](utiCache, "setObject:forKey:", v12, v4);

    }
    objc_sync_exit(v10);

    v8 = v9;
    v6 = v8;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_utiCache, 0);
  objc_storeStrong((id *)&self->_lastUTIDatabaseGeneration, 0);
}

@end
