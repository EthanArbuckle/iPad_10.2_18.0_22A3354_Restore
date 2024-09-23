@implementation PVDocumentCacheManager

+ (id)sharedInstance
{
  id result;

  result = (id)s_sharedInstance;
  if (!s_sharedInstance)
  {
    if ((s_wasReleased & 1) != 0)
    {
      return 0;
    }
    else
    {
      objc_sync_enter(a1);
      if (!s_sharedInstance)
        s_sharedInstance = objc_alloc_init(PVDocumentCacheManager);
      objc_sync_exit(a1);
      return (id)s_sharedInstance;
    }
  }
  return result;
}

+ (void)releaseSharedInstance
{
  s_wasReleased = 1;

  s_sharedInstance = 0;
}

+ (void)removeAllEffects
{
  objc_msgSend((id)s_sharedInstance, "removeAllObjects");
}

- (PVDocumentCacheManager)init
{
  PVDocumentCacheManager *v2;
  NSCache *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PVDocumentCacheManager;
  v2 = -[PVDocumentCacheManager init](&v5, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    v2->_cache = v3;
    -[NSCache setCountLimit:](v3, "setCountLimit:", 30);
    -[NSCache setTotalCostLimit:](v2->_cache, "setTotalCostLimit:", 300000000);
    -[NSCache setEvictsObjectsWithDiscardedContent:](v2->_cache, "setEvictsObjectsWithDiscardedContent:", 1);
    -[NSCache setDelegate:](v2->_cache, "setDelegate:", v2);
  }
  return v2;
}

- (void)setCountLimit:(unint64_t)a3
{
  -[NSCache setCountLimit:](self->_cache, "setCountLimit:", a3);
}

- (void)setTotalCostLimit:(unint64_t)a3
{
  -[NSCache setTotalCostLimit:](self->_cache, "setTotalCostLimit:", a3);
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PVDocumentCacheManager;
  -[PVDocumentCacheManager dealloc](&v3, sel_dealloc);
}

- (void)removeAllObjects
{
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
}

- (id)generateKeyFromFilePathString:(id)a3
{
  void *v4;

  v4 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager"), "attributesOfItemAtPath:error:", a3, 0);
  if (v4)
    return (id)objc_msgSend(a3, "stringByAppendingString:", objc_msgSend((id)objc_msgSend(v4, "fileModificationDate"), "description"));
  else
    return a3;
}

- (void)cacheOZXDocument:(void *)a3 forKey:(id)a4 timeElapsed:(double)a5 memoryInfo:(unint64_t)a6
{
  PVDocumentWrapper *v9;
  PVDocumentWrapper *v10;
  PVDocumentWrapper *v11;
  uint64_t v12;

  v12 = 0;
  if (a3)
  {
    OZXCopyDocument((const OZDocument **)a3, &v12);
    v9 = [PVDocumentWrapper alloc];
    v10 = -[PVDocumentWrapper initWithOZXDocument:forKey:](v9, "initWithOZXDocument:forKey:", v12, a4);
    v11 = v10;
    -[NSCache setObject:forKey:cost:](self->_cache, "setObject:forKey:cost:", v10, -[PVDocumentCacheManager generateKeyFromFilePathString:](self, "generateKeyFromFilePathString:", a4), a6);
  }
}

- (void)newOZXDocumentForKey:(id)a3
{
  void *result;
  void *v4;

  v4 = 0;
  result = -[NSCache objectForKey:](self->_cache, "objectForKey:", -[PVDocumentCacheManager generateKeyFromFilePathString:](self, "generateKeyFromFilePathString:", a3));
  if (result)
  {
    OZXCopyDocument((const OZDocument **)objc_msgSend(result, "ozxDocument"), &v4);
    return v4;
  }
  return result;
}

- (void)getOZXDocumentForKey:(id)a3
{
  void *result;

  result = -[NSCache objectForKey:](self->_cache, "objectForKey:", -[PVDocumentCacheManager generateKeyFromFilePathString:](self, "generateKeyFromFilePathString:", a3));
  if (result)
    return (void *)objc_msgSend(result, "ozxDocument");
  return result;
}

@end
