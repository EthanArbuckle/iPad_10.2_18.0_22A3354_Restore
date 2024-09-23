@implementation SUImageCache

- (SUImageCache)init
{
  return -[SUImageCache initWithMaximumCapacity:](self, "initWithMaximumCapacity:", 40);
}

- (SUImageCache)initWithMaximumCapacity:(int64_t)a3
{
  SUImageCache *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SUImageCache;
  v4 = -[SUImageCache init](&v6, sel_init);
  if (v4)
    v4->_dictionary = (CPLRUDictionary *)objc_msgSend(objc_alloc(MEMORY[0x24BE04770]), "initWithMaximumCapacity:", a3);
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SUImageCache;
  -[SUImageCache dealloc](&v3, sel_dealloc);
}

- (void)addImage:(id)a3 forURL:(id)a4 dataProvider:(id)a5
{
  SUImageCacheKey *v9;

  v9 = objc_alloc_init(SUImageCacheKey);
  v9->_dataProvider = (SUImageDataProvider *)a5;
  v9->_url = (NSURL *)a4;
  -[CPLRUDictionary setObject:forKey:](self->_dictionary, "setObject:forKey:", a3);

}

- (id)imageForURL:(id)a3 dataProvider:(id)a4
{
  SUImageCacheKey *v7;
  void *v8;

  v7 = objc_alloc_init(SUImageCacheKey);
  v7->_dataProvider = (SUImageDataProvider *)a4;
  v7->_url = (NSURL *)a3;
  v8 = (void *)-[CPLRUDictionary objectForKey:](self->_dictionary, "objectForKey:", v7);

  return v8;
}

- (void)removeAllCachedImages
{
  -[CPLRUDictionary removeAllObjects](self->_dictionary, "removeAllObjects");
}

@end
