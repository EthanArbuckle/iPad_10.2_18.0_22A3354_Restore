@implementation WBSAutoFillAssociatedDomainsManager

- (WBSAutoFillAssociatedDomainsManager)init
{

  return 0;
}

- (WBSAutoFillAssociatedDomainsManager)initWithDomainsWithAssociatedCredentials:(id)a3
{
  return -[WBSAutoFillAssociatedDomainsManager initWithDomainsWithAssociatedCredentials:domainsToConsiderIdentical:](self, "initWithDomainsWithAssociatedCredentials:domainsToConsiderIdentical:", a3, 0);
}

- (WBSAutoFillAssociatedDomainsManager)initWithDomainsWithAssociatedCredentials:(id)a3 domainsToConsiderIdentical:(id)a4
{
  id v6;
  id v7;
  WBSAutoFillAssociatedDomainsManager *v8;
  NSObject *v9;
  void *v10;
  objc_class *v11;
  void *v12;
  id v13;
  dispatch_queue_t v14;
  OS_dispatch_queue *queue;
  WBSAutoFillAssociatedDomainsManager *v16;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v18.receiver = self;
  v18.super_class = (Class)WBSAutoFillAssociatedDomainsManager;
  v8 = -[WBSAutoFillAssociatedDomainsManager init](&v18, sel_init);
  if (v8)
  {
    dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x1E0CB3940];
    v11 = (objc_class *)objc_opt_class();
    NSStringFromClass(v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("com.apple.SafariCore.%@.%p"), v12, v8);
    v13 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v14 = dispatch_queue_create((const char *)objc_msgSend(v13, "UTF8String"), v9);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v14;

    -[WBSAutoFillAssociatedDomainsManager setDomainsWithAssociatedCredentials:](v8, "setDomainsWithAssociatedCredentials:", v6);
    -[WBSAutoFillAssociatedDomainsManager setDomainsToConsiderIdentical:](v8, "setDomainsToConsiderIdentical:", v7);
    v16 = v8;

  }
  return v8;
}

- (void)setDomainsWithAssociatedCredentials:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __75__WBSAutoFillAssociatedDomainsManager_setDomainsWithAssociatedCredentials___block_invoke;
  block[3] = &unk_1E649B6D8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __75__WBSAutoFillAssociatedDomainsManager_setDomainsWithAssociatedCredentials___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 32);
  *(_QWORD *)(v3 + 32) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_updateDomainToDomainsWithAssociatedCredentials");
}

- (void)setDomainsToConsiderIdentical:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v8;

  v4 = a3;
  queue = self->_queue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __69__WBSAutoFillAssociatedDomainsManager_setDomainsToConsiderIdentical___block_invoke;
  block[3] = &unk_1E649B6D8;
  block[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_sync(queue, block);

}

uint64_t __69__WBSAutoFillAssociatedDomainsManager_setDomainsToConsiderIdentical___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(*(id *)(a1 + 40), "copy");
  v3 = *(_QWORD *)(a1 + 32);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  return objc_msgSend(*(id *)(a1 + 32), "_updateDomainToDomainsToConsiderIdentical");
}

- (id)domainsWithAssociatedCredentialsForDomain:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    v16 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __81__WBSAutoFillAssociatedDomainsManager_domainsWithAssociatedCredentialsForDomain___block_invoke;
    block[3] = &unk_1E649B700;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(queue, block);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __81__WBSAutoFillAssociatedDomainsManager_domainsWithAssociatedCredentialsForDomain___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

  if (!*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40))
  {
    objc_msgSend(*(id *)(a1 + 40), "safari_highLevelDomainFromHost");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "objectForKeyedSubscript:", v8);
      v5 = objc_claimAutoreleasedReturnValue();
      v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
      v7 = *(void **)(v6 + 40);
      *(_QWORD *)(v6 + 40) = v5;

    }
  }
}

- (id)domainsToConsiderIdenticalToDomain:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[5];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  if (objc_msgSend(v4, "length"))
  {
    v11 = 0;
    v12 = &v11;
    v13 = 0x3032000000;
    v14 = __Block_byref_object_copy_;
    v15 = __Block_byref_object_dispose_;
    v16 = 0;
    queue = self->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __74__WBSAutoFillAssociatedDomainsManager_domainsToConsiderIdenticalToDomain___block_invoke;
    block[3] = &unk_1E649B700;
    v10 = &v11;
    block[4] = self;
    v9 = v4;
    dispatch_sync(queue, block);
    v6 = (id)v12[5];

    _Block_object_dispose(&v11, 8);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

void __74__WBSAutoFillAssociatedDomainsManager_domainsToConsiderIdenticalToDomain___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1[4] + 24), "objectForKeyedSubscript:", a1[5]);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_updateDomainToDomainsWithAssociatedCredentials
{
  NSMutableDictionary *v3;
  NSMutableDictionary *domainToDomainsWithAssociatedCredentials;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  NSArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  domainToDomainsWithAssociatedCredentials = self->_domainToDomainsWithAssociatedCredentials;
  self->_domainToDomainsWithAssociatedCredentials = v3;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_domainsWithAssociatedCredentials;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = v9;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              if (objc_msgSend(v16, "length"))
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_domainToDomainsWithAssociatedCredentials, "setObject:forKeyedSubscript:", v10, v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v13);
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

}

- (void)_updateDomainToDomainsToConsiderIdentical
{
  NSMutableDictionary *v3;
  NSMutableDictionary *domainsToDomainsToConsiderIdentical;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  void *v16;
  NSArray *obj;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (NSMutableDictionary *)objc_claimAutoreleasedReturnValue();
  domainsToDomainsToConsiderIdentical = self->_domainsToDomainsToConsiderIdentical;
  self->_domainsToDomainsToConsiderIdentical = v3;

  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = self->_domainsToConsiderIdentical;
  v5 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v23 != v7)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithArray:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v21 = 0u;
        v11 = v9;
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v19;
          do
          {
            for (j = 0; j != v13; ++j)
            {
              if (*(_QWORD *)v19 != v14)
                objc_enumerationMutation(v11);
              v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
              if (objc_msgSend(v16, "length"))
                -[NSMutableDictionary setObject:forKeyedSubscript:](self->_domainsToDomainsToConsiderIdentical, "setObject:forKeyedSubscript:", v10, v16);
            }
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
          }
          while (v13);
        }

      }
      v6 = -[NSArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v6);
  }

}

- (NSArray)domainsWithAssociatedCredentials
{
  return self->_domainsWithAssociatedCredentials;
}

- (NSArray)domainsToConsiderIdentical
{
  return self->_domainsToConsiderIdentical;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_domainsToConsiderIdentical, 0);
  objc_storeStrong((id *)&self->_domainsWithAssociatedCredentials, 0);
  objc_storeStrong((id *)&self->_domainsToDomainsToConsiderIdentical, 0);
  objc_storeStrong((id *)&self->_domainToDomainsWithAssociatedCredentials, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end
