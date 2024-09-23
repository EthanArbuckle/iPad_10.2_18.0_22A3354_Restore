@implementation STExecutableIdentityResolutionSession

- (void)resolveIdentities:(id)a3
{
  id v4;
  STReferenceCountedCache *v5;
  STExecutableIdentityResolving *resolver;
  STExecutableIdentityResolving *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  NSArray *cachedIdentities;
  NSArray *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  const char *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
  {
    v5 = self->_cache;
    resolver = self->_resolver;
  }
  else
  {
    v5 = 0;
    resolver = 0;
  }
  v7 = resolver;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v8 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v26 != v10)
          objc_enumerationMutation(v4);
        v12 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * i);
        -[STReferenceCountedCache cachedObjectForKey:](v5, "cachedObjectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          -[STExecutableIdentityResolving resolvedIdentityForIdentity:](v7, "resolvedIdentityForIdentity:", v12);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
          {
            -[STReferenceCountedCache cacheObject:forKey:](v5, "cacheObject:forKey:", v13, v12);
            -[STReferenceCountedCache incrementReferenceCountForKey:](v5, "incrementReferenceCountForKey:", v12);
          }
        }
        -[STReferenceCountedCache incrementReferenceCountForKey:](v5, "incrementReferenceCountForKey:", v12);

      }
      v9 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v9);
  }
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  if (self)
    cachedIdentities = self->_cachedIdentities;
  else
    cachedIdentities = 0;
  v15 = cachedIdentities;
  v16 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v22;
    do
    {
      for (j = 0; j != v17; ++j)
      {
        if (*(_QWORD *)v22 != v18)
          objc_enumerationMutation(v15);
        -[STReferenceCountedCache decrementReferenceCountForKey:](v5, "decrementReferenceCountForKey:", *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * j), (_QWORD)v21);
      }
      v17 = -[NSArray countByEnumeratingWithState:objects:count:](v15, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
    }
    while (v17);
  }

  if (self)
    objc_setProperty_nonatomic_copy(self, v20, v4, 32);

}

- (id)resolvedIdentityForIdentity:(id)a3
{
  id v4;
  STReferenceCountedCache *cache;
  STReferenceCountedCache *v6;
  void *v7;
  void *v8;
  id v9;
  STExecutableIdentityResolving *resolver;
  void *v11;

  v4 = a3;
  if (self)
    cache = self->_cache;
  else
    cache = 0;
  v6 = cache;
  -[STReferenceCountedCache cachedObjectForKey:](v6, "cachedObjectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7)
  {
    v9 = v7;
  }
  else
  {
    if (self)
      resolver = self->_resolver;
    else
      resolver = 0;
    -[STExecutableIdentityResolving resolvedIdentityForIdentity:](resolver, "resolvedIdentityForIdentity:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  return v11;
}

- (STExecutableIdentityResolutionSession)initWithResolver:(id)a3 cache:(id)a4
{
  id v7;
  id v8;
  STExecutableIdentityResolutionSession *v9;
  STExecutableIdentityResolutionSession *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)STExecutableIdentityResolutionSession;
  v9 = -[STExecutableIdentityResolutionSession init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_resolver, a3);
    objc_storeStrong((id *)&v10->_cache, a4);
  }

  return v10;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)STExecutableIdentityResolutionSession;
  -[STExecutableIdentityResolutionSession dealloc](&v2, sel_dealloc);
}

- (void)invalidate
{
  NSArray *cachedIdentities;
  NSArray *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  STReferenceCountedCache *cache;
  uint64_t v10;
  const char *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  if (self)
  {
    self->_invalidated = 1;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    cachedIdentities = self->_cachedIdentities;
  }
  else
  {
    cachedIdentities = 0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
  }
  v4 = cachedIdentities;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        if (self)
          cache = self->_cache;
        else
          cache = 0;
        -[STReferenceCountedCache decrementReferenceCountForKey:](cache, "decrementReferenceCountForKey:", *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * v8++), (_QWORD)v12);
      }
      while (v6 != v8);
      v10 = -[NSArray countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v6 = v10;
    }
    while (v10);
  }

  if (self)
  {
    objc_setProperty_nonatomic_copy(self, v11, 0, 32);
    objc_storeStrong((id *)&self->_resolver, 0);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedIdentities, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_resolver, 0);
}

@end
