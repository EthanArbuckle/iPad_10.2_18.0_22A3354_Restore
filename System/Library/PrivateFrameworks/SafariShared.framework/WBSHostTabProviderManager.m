@implementation WBSHostTabProviderManager

+ (WBSHostTabProviderManager)sharedManager
{
  if (sharedManager_onceToken_1 != -1)
    dispatch_once(&sharedManager_onceToken_1, &__block_literal_global_68);
  return (WBSHostTabProviderManager *)(id)sharedManager_sharedManager_0;
}

void __42__WBSHostTabProviderManager_sharedManager__block_invoke()
{
  WBSHostTabProviderManager *v0;
  void *v1;

  v0 = objc_alloc_init(WBSHostTabProviderManager);
  v1 = (void *)sharedManager_sharedManager_0;
  sharedManager_sharedManager_0 = (uint64_t)v0;

}

- (WBSHostTabProviderManager)init
{
  WBSHostTabProviderManager *v2;
  uint64_t v3;
  NSMapTable *providerMapTable;
  uint64_t v5;
  NSMapTable *hostTabMapTable;
  WBSHostTabProviderManager *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)WBSHostTabProviderManager;
  v2 = -[WBSHostTabProviderManager init](&v9, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    providerMapTable = v2->_providerMapTable;
    v2->_providerMapTable = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    hostTabMapTable = v2->_hostTabMapTable;
    v2->_hostTabMapTable = (NSMapTable *)v5;

    v7 = v2;
  }

  return v2;
}

- (id)providerForContentUUID:(id)a3
{
  id v4;
  WBSHostTabProvider *v5;
  void *v6;
  WBSHostTabProvider *v7;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_providerMapTable, "objectForKey:", v4);
  v5 = (WBSHostTabProvider *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = objc_alloc_init(WBSHostTabProvider);
    -[WBSHostTabProviderManager _hostTabForContentUUID:](self, "_hostTabForContentUUID:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WBSHostTabProvider _setHostTab:](v5, "_setHostTab:", v6);

    -[NSMapTable setObject:forKey:](self->_providerMapTable, "setObject:forKey:", v5, v4);
  }
  v7 = v5;

  return v7;
}

- (void)registerHostTab:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  objc_msgSend(v4, "contentUUID");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](self->_hostTabMapTable, "setObject:forKey:", v4, v6);
  -[WBSHostTabProviderManager providerForContentUUID:](self, "providerForContentUUID:", v6);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_setHostTab:", v4);

}

- (void)unregisterHostTab:(id)a3
{
  id v4;

  objc_msgSend(a3, "contentUUID");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](self->_hostTabMapTable, "removeObjectForKey:", v4);

}

- (id)_hostTabForContentUUID:(id)a3
{
  return -[NSMapTable objectForKey:](self->_hostTabMapTable, "objectForKey:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostTabMapTable, 0);
  objc_storeStrong((id *)&self->_providerMapTable, 0);
}

@end
