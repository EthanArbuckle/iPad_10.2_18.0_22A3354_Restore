@implementation ATXClientModelCacheManagerGuardedData

- (ATXClientModelCacheManagerGuardedData)init
{
  ATXClientModelCacheManagerGuardedData *v2;
  uint64_t v3;
  NSMutableDictionary *clientModelCacheHandlers;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ATXClientModelCacheManagerGuardedData;
  v2 = -[ATXClientModelCacheManagerGuardedData init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_opt_new();
    clientModelCacheHandlers = v2->_clientModelCacheHandlers;
    v2->_clientModelCacheHandlers = (NSMutableDictionary *)v3;

  }
  return v2;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientModelCacheHandlers, 0);
}

@end
