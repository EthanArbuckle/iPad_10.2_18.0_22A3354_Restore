@implementation SSAppIconDatabaseCache

+ (id)newDefaultDatabaseCache
{
  SSDatabaseCache *v2;
  SSDatabaseCache *v3;
  uint64_t v4;

  v2 = +[SSAppPurchaseHistoryDatabase newDefaultInstance](SSAppPurchaseHistoryDatabase, "newDefaultInstance");
  v3 = v2;
  if (v2)
  {
    v4 = -[SSDatabaseCache database](v2, "database");

    v3 = -[SSDatabaseCache initWithIdentifier:cacheName:database:cacheEntryClass:]([SSDatabaseCache alloc], "initWithIdentifier:cacheName:database:cacheEntryClass:", CFSTR("com.apple.storeservices"), CFSTR("SSAppImageDatabaseCacheEntry"), v4, objc_opt_class());
    -[SSDatabaseCache setMaximumInlineBlobSize:](v3, "setMaximumInlineBlobSize:", 1024);
  }
  return v3;
}

@end
