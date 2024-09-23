@implementation BSUIMappedImageCache(PBUCacheManagerAdditions)

- (id)pui_cacheIdentifier
{
  return objc_getAssociatedObject(a1, CFSTR("pbuiMappedImageCacheKey"));
}

- (void)pbui_setCacheManager:()PBUCacheManagerAdditions cacheIdentifier:
{
  id v6;
  id v7;
  _BSUIMappedImageCacheCanary *value;

  v6 = a4;
  v7 = a3;
  value = -[_BSUIMappedImageCacheCanary initWithCacheManager:key:]([_BSUIMappedImageCacheCanary alloc], "initWithCacheManager:key:", v7, v6);

  objc_setAssociatedObject(a1, CFSTR("pbuiMappedImageCacheCanary"), value, (void *)1);
  objc_setAssociatedObject(a1, CFSTR("pbuiMappedImageCacheKey"), v6, (void *)3);

}

@end
