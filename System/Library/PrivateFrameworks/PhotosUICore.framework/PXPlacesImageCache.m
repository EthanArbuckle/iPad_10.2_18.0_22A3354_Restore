@implementation PXPlacesImageCache

- (PXPlacesImageCache)init
{
  PXPlacesImageCache *v2;
  NSCache *v3;
  NSCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PXPlacesImageCache;
  v2 = -[PXPlacesImageCache init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSCache *)objc_alloc_init(MEMORY[0x1E0C99D38]);
    cache = v2->_cache;
    v2->_cache = v3;

    -[NSCache setCountLimit:](v2->_cache, "setCountLimit:", 100);
  }
  return v2;
}

- (void)removeAllObjects
{
  -[NSCache removeAllObjects](self->_cache, "removeAllObjects");
}

- (void)removeCachedRenderedImageForGeotaggble:(id)a3 andKey:(id)a4
{
  id v6;
  id v7;
  _PXPlacesImageCacheKey *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[_PXPlacesImageCacheKey initWithGeotaggable:andKey:]([_PXPlacesImageCacheKey alloc], "initWithGeotaggable:andKey:", v7, v6);

  -[NSCache removeObjectForKey:](self->_cache, "removeObjectForKey:", v8);
}

- (id)cachedRenderedImageForGeotaggble:(id)a3 andKey:(id)a4
{
  id v6;
  id v7;
  _PXPlacesImageCacheKey *v8;
  void *v9;

  v6 = a4;
  v7 = a3;
  v8 = -[_PXPlacesImageCacheKey initWithGeotaggable:andKey:]([_PXPlacesImageCacheKey alloc], "initWithGeotaggable:andKey:", v7, v6);

  -[NSCache objectForKey:](self->_cache, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)cacheRenderedImage:(id)a3 forGeotaggble:(id)a4 andKey:(id)a5
{
  id v8;
  id v9;
  id v10;
  _PXPlacesImageCacheKey *v11;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  v11 = -[_PXPlacesImageCacheKey initWithGeotaggable:andKey:]([_PXPlacesImageCacheKey alloc], "initWithGeotaggable:andKey:", v9, v8);

  -[NSCache setObject:forKey:](self->_cache, "setObject:forKey:", v10, v11);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
