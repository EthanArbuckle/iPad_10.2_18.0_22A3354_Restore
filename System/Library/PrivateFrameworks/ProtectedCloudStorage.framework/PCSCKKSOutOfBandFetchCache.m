@implementation PCSCKKSOutOfBandFetchCache

+ (id)cache
{
  if (cache_once != -1)
    dispatch_once(&cache_once, &__block_literal_global_12);
  return (id)cache_cache;
}

void __35__PCSCKKSOutOfBandFetchCache_cache__block_invoke()
{
  PCSCKKSOutOfBandFetchCache *v0;
  void *v1;

  v0 = objc_alloc_init(PCSCKKSOutOfBandFetchCache);
  v1 = (void *)cache_cache;
  cache_cache = (uint64_t)v0;

}

- (PCSCKKSOutOfBandFetchCache)init
{
  PCSCKKSOutOfBandFetchCache *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PCSCKKSOutOfBandFetchCache;
  v2 = -[PCSCKKSOutOfBandFetchCache init](&v6, sel_init);
  if (v2)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(MEMORY[0x1E0C80D50], DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = dispatch_queue_create("com.apple.ProtectedCloudStorage.CKKSOutOfBandFetchCache", v3);
    -[PCSCKKSOutOfBandFetchCache setQueue:](v2, "setQueue:", v4);

  }
  return v2;
}

- (void)dealloc
{
  _PCSIdentitySetData *identities;
  objc_super v4;

  identities = self->_identities;
  if (identities)
  {
    self->_identities = 0;
    CFRelease(identities);
  }
  v4.receiver = self;
  v4.super_class = (Class)PCSCKKSOutOfBandFetchCache;
  -[PCSCKKSOutOfBandFetchCache dealloc](&v4, sel_dealloc);
}

- (void)getCurrentIdentities:(id)a3 result:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  id v9;
  id v10;
  _QWORD block[4];
  id v12;
  PCSCKKSOutOfBandFetchCache *v13;
  id v14;

  v6 = a3;
  v7 = a4;
  -[PCSCKKSOutOfBandFetchCache queue](self, "queue");
  v8 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__PCSCKKSOutOfBandFetchCache_getCurrentIdentities_result___block_invoke;
  block[3] = &unk_1E553E8E0;
  v12 = v6;
  v13 = self;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  dispatch_sync(v8, block);

}

void __58__PCSCKKSOutOfBandFetchCache_getCurrentIdentities_result___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  CFTypeRef Mutable;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  const void *v10;
  const void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 40), "identities"))
  {
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    if (v4)
    {
      v5 = v4;
      Mutable = 0;
      v7 = *(_QWORD *)v15;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v15 != v7)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
          v10 = PCSIdentitySetCopyCurrentIdentityWithError(objc_msgSend(*(id *)(a1 + 40), "identities", (_QWORD)v14), v9, 0);
          if (v10)
          {
            v11 = v10;
            objc_msgSend(v2, "removeObject:", v9);
            if (!Mutable)
              Mutable = PCSIdentitySetCreateMutable(0);
            PCSIdentitySetAddIdentity((uint64_t)Mutable, (uint64_t)v11);
            PCSIdentitySetSetCurrentIdentity((uint64_t)Mutable, (uint64_t)v11);
            CFRelease(v11);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v5);
    }
    else
    {
      Mutable = 0;
    }

  }
  else
  {
    Mutable = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "currentItemNegativeCache", (_QWORD)v14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "currentItemNegativeCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "minusSet:", v13);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (Mutable)
    CFRelease(Mutable);

}

- (void)cacheCurrentIdentityFetchResult:(_PCSIdentitySetData *)a3 notFound:(id)a4
{
  id v6;
  NSObject *v7;
  id v8;
  _QWORD block[4];
  id v10;
  PCSCKKSOutOfBandFetchCache *v11;
  _PCSIdentitySetData *v12;

  v6 = a4;
  -[PCSCKKSOutOfBandFetchCache queue](self, "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __71__PCSCKKSOutOfBandFetchCache_cacheCurrentIdentityFetchResult_notFound___block_invoke;
  block[3] = &unk_1E553E930;
  v10 = v6;
  v11 = self;
  v12 = a3;
  v8 = v6;
  dispatch_barrier_async(v7, block);

}

uint64_t __71__PCSCKKSOutOfBandFetchCache_cacheCurrentIdentityFetchResult_notFound___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  uint64_t result;
  _QWORD v6[5];

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "currentItemNegativeCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(*(id *)(a1 + 40), "setCurrentItemNegativeCache:", v3);

    }
    objc_msgSend(*(id *)(a1 + 40), "currentItemNegativeCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unionSet:", *(_QWORD *)(a1 + 32));

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
  {
    v6[0] = MEMORY[0x1E0C809B0];
    v6[1] = 3221225472;
    v6[2] = __71__PCSCKKSOutOfBandFetchCache_cacheCurrentIdentityFetchResult_notFound___block_invoke_2;
    v6[3] = &unk_1E553E908;
    v6[4] = *(_QWORD *)(a1 + 40);
    return PCSIdentitySetEnumerateIdentities(result, 0, v6);
  }
  return result;
}

uint64_t __71__PCSCKKSOutOfBandFetchCache_cacheCurrentIdentityFetchResult_notFound___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(*(id *)(a1 + 32), "currentItemNegativeCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    PCSIdentityGetServiceName(a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 32), "currentItemNegativeCache");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "removeObject:", v5);

  }
  if (!objc_msgSend(*(id *)(a1 + 32), "identities"))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = PCSIdentitySetCreateMutable(0);
  PCSIdentitySetAddIdentity(objc_msgSend(*(id *)(a1 + 32), "identities"), a2);
  return PCSIdentitySetSetCurrentIdentity(objc_msgSend(*(id *)(a1 + 32), "identities"), a2);
}

- (void)getPCSIdentities:(id)a3 forServiceID:(unsigned int)a4 result:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  id v11;
  id v12;
  _QWORD block[4];
  id v14;
  PCSCKKSOutOfBandFetchCache *v15;
  id v16;
  unsigned int v17;

  v8 = a3;
  v9 = a5;
  -[PCSCKKSOutOfBandFetchCache queue](self, "queue");
  v10 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __67__PCSCKKSOutOfBandFetchCache_getPCSIdentities_forServiceID_result___block_invoke;
  block[3] = &unk_1E553E958;
  v14 = v8;
  v15 = self;
  v17 = a4;
  v16 = v9;
  v11 = v9;
  v12 = v8;
  dispatch_sync(v10, block);

}

void __67__PCSCKKSOutOfBandFetchCache_getPCSIdentities_forServiceID_result___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  CFTypeRef Mutable;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  uint64_t v10;
  const void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithSet:", *(_QWORD *)(a1 + 32));
  if (objc_msgSend(*(id *)(a1 + 40), "identities"))
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v3 = *(id *)(a1 + 32);
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v4)
    {
      v5 = v4;
      Mutable = 0;
      v7 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v5; ++i)
        {
          if (*(_QWORD *)v17 != v7)
            objc_enumerationMutation(v3);
          v9 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          v10 = PCSIdentitySetCopyIdentity(objc_msgSend(*(id *)(a1 + 40), "identities", (_QWORD)v16), v9);
          if (v10)
          {
            v11 = (const void *)v10;
            if (PCSIdentityGetServiceID(v10) == *(_DWORD *)(a1 + 56))
            {
              objc_msgSend(v2, "removeObject:", v9);
              if (!Mutable)
                Mutable = PCSIdentitySetCreateMutable(0);
              PCSIdentitySetAddIdentity((uint64_t)Mutable, (uint64_t)v11);
            }
            CFRelease(v11);
          }
        }
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v5);
    }
    else
    {
      Mutable = 0;
    }

  }
  else
  {
    Mutable = 0;
  }
  objc_msgSend(*(id *)(a1 + 40), "identityNegativeCache", (_QWORD)v16);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    objc_msgSend(*(id *)(a1 + 40), "identityNegativeCache");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
      objc_msgSend(v2, "minusSet:", v15);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  if (Mutable)
    CFRelease(Mutable);

}

- (void)cachePCSIdentityFetchResult:(_PCSIdentitySetData *)a3 notFound:(id)a4 serviceID:(unsigned int)a5
{
  id v8;
  NSObject *v9;
  id v10;
  _QWORD v11[4];
  id v12;
  PCSCKKSOutOfBandFetchCache *v13;
  _PCSIdentitySetData *v14;
  unsigned int v15;

  v8 = a4;
  -[PCSCKKSOutOfBandFetchCache queue](self, "queue");
  v9 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __77__PCSCKKSOutOfBandFetchCache_cachePCSIdentityFetchResult_notFound_serviceID___block_invoke;
  v11[3] = &unk_1E553E9A8;
  v12 = v8;
  v13 = self;
  v15 = a5;
  v14 = a3;
  v10 = v8;
  dispatch_barrier_async(v9, v11);

}

uint64_t __77__PCSCKKSOutOfBandFetchCache_cachePCSIdentityFetchResult_notFound_serviceID___block_invoke(uint64_t a1)
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t result;
  _QWORD v10[5];
  int v11;

  if (objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(*(id *)(a1 + 40), "identityNegativeCache");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v2)
    {
      v3 = objc_alloc_init(MEMORY[0x1E0C99E08]);
      objc_msgSend(*(id *)(a1 + 40), "setIdentityNegativeCache:", v3);

    }
    objc_msgSend(*(id *)(a1 + 40), "identityNegativeCache");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      v6 = objc_alloc_init(MEMORY[0x1E0C99E20]);
      objc_msgSend(*(id *)(a1 + 40), "identityNegativeCache");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 56));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v6, v8);

    }
    objc_msgSend(v6, "unionSet:", *(_QWORD *)(a1 + 32));

  }
  result = *(_QWORD *)(a1 + 48);
  if (result)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __77__PCSCKKSOutOfBandFetchCache_cachePCSIdentityFetchResult_notFound_serviceID___block_invoke_2;
    v10[3] = &unk_1E553E980;
    v10[4] = *(_QWORD *)(a1 + 40);
    v11 = *(_DWORD *)(a1 + 56);
    return PCSIdentitySetEnumerateIdentities(result, 0, v10);
  }
  return result;
}

uint64_t __77__PCSCKKSOutOfBandFetchCache_cachePCSIdentityFetchResult_notFound_serviceID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(*(id *)(a1 + 32), "identityNegativeCache");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    objc_msgSend(*(id *)(a1 + 32), "identityNegativeCache");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *(unsigned int *)(a1 + 40));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      PCSIdentityGetPublicKey(a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "removeObject:", v8);

    }
  }
  if (!objc_msgSend(*(id *)(a1 + 32), "identities"))
    *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16) = PCSIdentitySetCreateMutable(0);
  return PCSIdentitySetAddIdentity(objc_msgSend(*(id *)(a1 + 32), "identities"), a2);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 8, 1);
}

- (void)setQueue:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (_PCSIdentitySetData)identities
{
  return self->_identities;
}

- (NSMutableSet)currentItemNegativeCache
{
  return (NSMutableSet *)objc_getProperty(self, a2, 24, 1);
}

- (void)setCurrentItemNegativeCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (NSMutableDictionary)identityNegativeCache
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setIdentityNegativeCache:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identityNegativeCache, 0);
  objc_storeStrong((id *)&self->_currentItemNegativeCache, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
