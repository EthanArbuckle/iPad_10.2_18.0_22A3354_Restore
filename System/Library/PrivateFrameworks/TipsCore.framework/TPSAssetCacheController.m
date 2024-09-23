@implementation TPSAssetCacheController

+ (id)sharedInstance
{
  if (sharedInstance_predicate_6 != -1)
    dispatch_once(&sharedInstance_predicate_6, &__block_literal_global_21);
  return (id)sharedInstance_gTPSAssetCacheController;
}

void __41__TPSAssetCacheController_sharedInstance__block_invoke()
{
  TPSAssetCacheController *v0;
  void *v1;

  v0 = -[TPSDataCacheController initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:]([TPSAssetCacheController alloc], "initWithIdentifier:directoryName:maxCacheSize:URLSessionDataType:", CFSTR("TPSAssetCacheIdentifier"), CFSTR("Assets"), 125829120, 2);
  v1 = (void *)sharedInstance_gTPSAssetCacheController;
  sharedInstance_gTPSAssetCacheController = (uint64_t)v0;

}

- (id)newDataCache
{
  TPSDataCache *v2;

  v2 = objc_alloc_init(TPSDataCache);
  -[TPSDataCache setCacheType:](v2, "setCacheType:", 2);
  -[TPSDataCache setMaxAge:](v2, "setMaxAge:", 21600);
  return v2;
}

@end
