@implementation STExecutableIdentityResolver

- (id)resolvedIdentityForIdentity:(id)a3
{
  id v4;
  STReferenceCountedCache *cache;
  void *v6;

  v4 = a3;
  if (self)
    cache = self->_cache;
  else
    cache = 0;
  -[STReferenceCountedCache cachedObjectForKey:](cache, "cachedObjectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    _STExecutableIdentityResolvedIdentityForIdentity(v4, 0, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

+ (id)responsibleIdentityForAuditToken:(id *)a3
{
  id v4;
  __int128 v5;
  void *v6;
  void *v7;
  _OWORD v9[2];

  v4 = objc_alloc(MEMORY[0x1E0DB08D8]);
  v5 = *(_OWORD *)&a3->var0[4];
  v9[0] = *(_OWORD *)a3->var0;
  v9[1] = v5;
  v6 = (void *)objc_msgSend(v4, "initWithAuditToken:", v9);
  _STExecutableIdentityResolvedIdentityForIdentity(v6, 1, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (STExecutableIdentityResolver)init
{
  STExecutableIdentityResolver *v2;
  STReferenceCountedCache *v3;
  STReferenceCountedCache *cache;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)STExecutableIdentityResolver;
  v2 = -[STExecutableIdentityResolver init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(STReferenceCountedCache);
    cache = v2->_cache;
    v2->_cache = v3;

  }
  return v2;
}

- (id)beginBatchResolutionSession
{
  STExecutableIdentityResolutionSession *v3;
  STReferenceCountedCache *cache;

  v3 = [STExecutableIdentityResolutionSession alloc];
  if (self)
    cache = self->_cache;
  else
    cache = 0;
  return -[STExecutableIdentityResolutionSession initWithResolver:cache:](v3, "initWithResolver:cache:", self, cache);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cache, 0);
}

@end
