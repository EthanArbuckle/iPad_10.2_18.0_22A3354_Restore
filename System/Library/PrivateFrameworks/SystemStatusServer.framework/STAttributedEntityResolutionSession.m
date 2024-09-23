@implementation STAttributedEntityResolutionSession

uint64_t __55__STAttributedEntityResolutionSession_resolveEntities___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "executableIdentity");
}

- (void)resolveEntities:(id)a3
{
  id v4;
  STReferenceCountedCache *cache;
  STReferenceCountedCache *v6;
  uint64_t v7;
  STAttributedEntityResolving *entityResolver;
  STAttributedEntityResolving *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  NSArray *cachedEntities;
  NSArray *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  if (self)
    cache = self->_cache;
  else
    cache = 0;
  v6 = cache;
  objc_msgSend(v4, "bs_map:", &__block_literal_global_5);
  v7 = objc_claimAutoreleasedReturnValue();
  v25 = (void *)v7;
  if (self)
  {
    -[STExecutableIdentityBatchResolving resolveIdentities:](self->_identityResolver, "resolveIdentities:", v7);
    entityResolver = self->_entityResolver;
  }
  else
  {
    objc_msgSend(0, "resolveIdentities:", v7);
    entityResolver = 0;
  }
  v9 = entityResolver;
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v11 = v4;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v31;
    do
    {
      v15 = 0;
      do
      {
        if (*(_QWORD *)v31 != v14)
          objc_enumerationMutation(v11);
        -[STAttributedEntityResolutionSession _entityWithResolvedIdentityForEntity:]((uint64_t)self, *(void **)(*((_QWORD *)&v30 + 1) + 8 * v15));
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "addObject:", v16);
        -[STReferenceCountedCache cachedObjectForKey:](v6, "cachedObjectForKey:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v17)
        {
          -[STAttributedEntityResolving resolveEntity:](v9, "resolveEntity:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
          {
            -[STReferenceCountedCache cacheObject:forKey:](v6, "cacheObject:forKey:", v17, v16);
            -[STReferenceCountedCache incrementReferenceCountForKey:](v6, "incrementReferenceCountForKey:", v16);
          }
        }
        -[STReferenceCountedCache incrementReferenceCountForKey:](v6, "incrementReferenceCountForKey:", v16);

        ++v15;
      }
      while (v13 != v15);
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v13);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  if (self)
    cachedEntities = self->_cachedEntities;
  else
    cachedEntities = 0;
  v19 = cachedEntities;
  v20 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v27;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v27 != v22)
          objc_enumerationMutation(v19);
        -[STReferenceCountedCache decrementReferenceCountForKey:](v6, "decrementReferenceCountForKey:", *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * v23++));
      }
      while (v21 != v23);
      v21 = -[NSArray countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v21);
  }

  if (self)
    objc_setProperty_nonatomic_copy(self, v24, v10, 40);

}

- (id)resolveEntity:(id)a3
{
  void *v4;
  STReferenceCountedCache *cache;
  STReferenceCountedCache *v6;
  void *v7;
  void *v8;
  id v9;
  STAttributedEntityResolving *entityResolver;
  void *v11;

  -[STAttributedEntityResolutionSession _entityWithResolvedIdentityForEntity:]((uint64_t)self, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
      entityResolver = self->_entityResolver;
    else
      entityResolver = 0;
    -[STAttributedEntityResolving resolveEntity:](entityResolver, "resolveEntity:", v4);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v11 = v9;

  return v11;
}

- (id)_entityWithResolvedIdentityForEntity:(uint64_t)a1
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;

  if (a1)
  {
    v3 = *(id *)(a1 + 24);
    v4 = a2;
    objc_msgSend(v4, "executableIdentity");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "resolvedIdentityForIdentity:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "website");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v4, "isSystemService");
    objc_msgSend(v4, "localizedDisplayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedExecutableDisplayName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DB0860]), "initWithExecutableIdentity:website:systemService:localizedDisplayName:localizedExecutableDisplayName:", v6, v7, v8, v9, v10);
  }
  else
  {
    v11 = 0;
  }
  return v11;
}

- (STAttributedEntityResolutionSession)initWithEntityResolver:(id)a3 identityResolver:(id)a4 cache:(id)a5
{
  id v9;
  id v10;
  id v11;
  STAttributedEntityResolutionSession *v12;
  STAttributedEntityResolutionSession *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)STAttributedEntityResolutionSession;
  v12 = -[STAttributedEntityResolutionSession init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_entityResolver, a3);
    objc_storeStrong((id *)&v13->_identityResolver, a4);
    objc_storeStrong((id *)&v13->_cache, a5);
  }

  return v13;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)STAttributedEntityResolutionSession;
  -[STAttributedEntityResolutionSession dealloc](&v2, sel_dealloc);
}

- (void)invalidate
{
  NSArray *cachedEntities;
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
    cachedEntities = self->_cachedEntities;
  }
  else
  {
    cachedEntities = 0;
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
  }
  v4 = cachedEntities;
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
    objc_setProperty_nonatomic_copy(self, v11, 0, 40);
    objc_storeStrong((id *)&self->_entityResolver, 0);
    -[STExecutableIdentityBatchResolving invalidate](self->_identityResolver, "invalidate");
    objc_storeStrong((id *)&self->_identityResolver, 0);
  }
  else
  {
    objc_msgSend(0, "invalidate");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_cachedEntities, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_identityResolver, 0);
  objc_storeStrong((id *)&self->_entityResolver, 0);
}

@end
