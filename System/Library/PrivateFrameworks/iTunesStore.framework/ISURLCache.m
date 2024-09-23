@implementation ISURLCache

- (ISURLCache)init
{
  return -[ISURLCache initWithCacheConfiguration:](self, "initWithCacheConfiguration:", 0);
}

- (ISURLCache)initWithCacheConfiguration:(id)a3
{
  ISURLCache *v5;
  ISURLCache *v6;
  objc_super v8;

  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Must provide a configuration"));
  v8.receiver = self;
  v8.super_class = (Class)ISURLCache;
  v5 = -[ISURLCache init](&v8, sel_init);
  v6 = v5;
  if (v5)
    -[ISURLCache reloadWithCacheConfiguration:](v5, "reloadWithCacheConfiguration:", a3);
  return v6;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ISURLCache;
  -[ISURLCache dealloc](&v3, sel_dealloc);
}

+ (id)cacheDirectoryPath
{
  id result;
  void *v3;
  void *v4;

  result = (id)cacheDirectoryPath_sCacheDirectoryPath;
  if (!cacheDirectoryPath_sCacheDirectoryPath)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", -[NSArray lastObject](NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1), "lastObject"), CFSTR("com.apple.iTunesStore"), CFSTR("URLCache"), 0);
    v4 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "pathWithComponents:", v3);
    if (objc_msgSend(MEMORY[0x24BDD1580], "ensureDirectoryExists:", v4))
      cacheDirectoryPath_sCacheDirectoryPath = v4;

    return (id)cacheDirectoryPath_sCacheDirectoryPath;
  }
  return result;
}

- (NSString)persistentIdentifier
{
  return -[ISURLCacheConfiguration persistentIdentifier](self->_configuration, "persistentIdentifier");
}

- (void)reloadWithCacheConfiguration:(id)a3
{
  uint64_t v5;
  BOOL v6;
  NSURLCache *cache;
  NSURLCache *v8;
  void *v9;
  int v10;
  int v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  int v15;
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  __int16 v19;
  uint64_t v20;
  __int16 v21;
  uint64_t v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  if (!a3)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Must provide a configuration"));
  if (self->_configuration != a3)
  {
    v5 = objc_msgSend(a3, "persistentIdentifier");
    if (self->_cache)
    {
      v6 = -[NSString isEqualToString:](-[ISURLCache persistentIdentifier](self, "persistentIdentifier"), "isEqualToString:", v5);
      cache = self->_cache;
      if (v6)
      {
        -[NSURLCache setDiskCapacity:](cache, "setDiskCapacity:", objc_msgSend(a3, "diskCapacity"));
        -[NSURLCache setMemoryCapacity:](self->_cache, "setMemoryCapacity:", objc_msgSend(a3, "memoryCapacity"));
LABEL_9:

        self->_configuration = (ISURLCacheConfiguration *)objc_msgSend(a3, "copy");
        v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharediTunesStoreConfig");
        if (!v9)
          v9 = (void *)objc_msgSend(MEMORY[0x24BEB1E98], "sharedConfig");
        v10 = objc_msgSend(v9, "shouldLog");
        if (objc_msgSend(v9, "shouldLogToDisk"))
          v11 = v10 | 2;
        else
          v11 = v10;
        if (!os_log_type_enabled((os_log_t)objc_msgSend(v9, "OSLogObject"), OS_LOG_TYPE_INFO))
          v11 &= 2u;
        if (v11)
        {
          v15 = 138413058;
          v16 = objc_opt_class();
          v17 = 2112;
          v18 = v5;
          v19 = 2048;
          v20 = objc_msgSend(a3, "diskCapacity");
          v21 = 2048;
          v22 = objc_msgSend(a3, "memoryCapacity");
          LODWORD(v14) = 42;
          v12 = _os_log_send_and_compose_impl();
          if (v12)
          {
            v13 = (void *)v12;
            objc_msgSend(MEMORY[0x24BDD17C8], "stringWithCString:encoding:", v12, 4, &v15, v14);
            free(v13);
            SSFileLog();
          }
        }
        return;
      }
    }
    else
    {
      cache = 0;
    }

    v8 = (NSURLCache *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1800]), "initWithMemoryCapacity:diskCapacity:diskPath:", objc_msgSend(a3, "memoryCapacity"), objc_msgSend(a3, "diskCapacity"), v5);
    self->_cache = v8;
    -[NSURLCache _CFURLCache](v8, "_CFURLCache");
    _CFURLCacheLoadMemoryFromDiskNow();
    goto LABEL_9;
  }
}

- (id)cachedResponseForRequest:(id)a3
{
  return -[NSURLCache cachedResponseForRequest:](self->_cache, "cachedResponseForRequest:", a3);
}

- (unint64_t)currentDiskUsage
{
  return -[NSURLCache currentDiskUsage](self->_cache, "currentDiskUsage");
}

- (unint64_t)currentMemoryUsage
{
  return -[NSURLCache currentMemoryUsage](self->_cache, "currentMemoryUsage");
}

- (unint64_t)diskCapacity
{
  return -[NSURLCache diskCapacity](self->_cache, "diskCapacity");
}

- (unint64_t)memoryCapacity
{
  return -[NSURLCache memoryCapacity](self->_cache, "memoryCapacity");
}

- (void)purgeMemoryCache
{
  -[NSURLCache _CFURLCache](self->_cache, "_CFURLCache");
  _CFURLCachePurgeMemoryCache();
}

- (void)removeAllCachedResponses
{
  -[NSURLCache removeAllCachedResponses](self->_cache, "removeAllCachedResponses");
}

- (void)removeCachedResponseForRequest:(id)a3
{
  -[NSURLCache removeCachedResponseForRequest:](self->_cache, "removeCachedResponseForRequest:", a3);
}

- (void)saveMemoryCacheToDisk
{
  -[NSURLCache _CFURLCache](self->_cache, "_CFURLCache");
  _CFURLCachePersistMemoryToDiskNow();
}

- (void)storeCachedResponse:(id)a3 forRequest:(id)a4
{
  -[NSURLCache storeCachedResponse:forRequest:](self->_cache, "storeCachedResponse:forRequest:", a3, a4);
}

@end
