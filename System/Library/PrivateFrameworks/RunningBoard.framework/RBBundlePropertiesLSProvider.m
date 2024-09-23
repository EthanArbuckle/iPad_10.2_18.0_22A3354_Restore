@implementation RBBundlePropertiesLSProvider

- (id)propertiesForIdentity:(id)a3
{
  id v4;
  void *v5;
  RBLSBundleProperties *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(v4, "embeddedApplicationIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {

  }
  else
  {
    objc_msgSend(v4, "xpcServiceIdentifier");
    v6 = (RBLSBundleProperties *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_12;
  }
  -[NSCache objectForKey:](self->_propertiesByIdentity, "objectForKey:", v4);
  v6 = (RBLSBundleProperties *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    if (objc_msgSend(v4, "isEmbeddedApplication"))
    {
      v7 = (void *)MEMORY[0x24BDC1538];
      objc_msgSend(v4, "embeddedApplicationIdentifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "applicationProxyForIdentifier:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = -[RBLSBundleProperties initWithApplicationProxy:]((uint64_t)[RBLSBundleProperties alloc], v9);
    }
    else
    {
      if (!objc_msgSend(v4, "isXPCService"))
      {
        v6 = objc_alloc_init(RBLSBundleProperties);
        goto LABEL_11;
      }
      v11 = (void *)MEMORY[0x24BDC1550];
      objc_msgSend(v4, "xpcServiceIdentifier");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "bundleProxyForIdentifier:", v12);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = -[RBLSBundleProperties initWithBundleProxy:]((uint64_t)[RBLSBundleProperties alloc], v9);
    }
    v6 = (RBLSBundleProperties *)v10;

LABEL_11:
    -[NSCache setObject:forKey:](self->_propertiesByIdentity, "setObject:forKey:", v6, v4);
  }
LABEL_12:
  os_unfair_lock_unlock(&self->_lock);

  return v6;
}

- (RBBundlePropertiesLSProvider)init
{
  RBBundlePropertiesLSProvider *v2;
  RBBundlePropertiesLSProvider *v3;
  NSCache *v4;
  NSCache *propertiesByIdentity;
  NSObject *v6;
  _QWORD block[4];
  RBBundlePropertiesLSProvider *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)RBBundlePropertiesLSProvider;
  v2 = -[RBBundlePropertiesLSProvider init](&v10, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSCache *)objc_alloc_init(MEMORY[0x24BDBCE40]);
    propertiesByIdentity = v3->_propertiesByIdentity;
    v3->_propertiesByIdentity = v4;

    -[NSCache setCountLimit:](v3->_propertiesByIdentity, "setCountLimit:", 5);
    dispatch_get_global_queue(25, 0);
    v6 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __36__RBBundlePropertiesLSProvider_init__block_invoke;
    block[3] = &unk_24DD46160;
    v9 = v3;
    dispatch_async(v6, block);

  }
  return v3;
}

void __36__RBBundlePropertiesLSProvider_init__block_invoke(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDC1538], "applicationProxyForIdentifier:", CFSTR("test"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObserver:", *(_QWORD *)(a1 + 32));

}

- (RBBundlePropertiesLSProviderDelegate)delegate
{
  os_unfair_lock_s *p_lock;
  id WeakRetained;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (RBBundlePropertiesLSProviderDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)RBBundlePropertiesLSProvider;
  -[RBBundlePropertiesLSProvider dealloc](&v4, sel_dealloc);
}

- (NSString)debugDescription
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDD16A8]);
  os_unfair_lock_lock(&self->_lock);
  -[NSCache mapTableRepresentation](self->_propertiesByIdentity, "mapTableRepresentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * i);
        objc_msgSend(v4, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "description");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@\n\t\t"), v11, v10);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }
  os_unfair_lock_unlock(&self->_lock);
  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("<%@| propertiesByIdentity:{\n\t\t%@}>"), v13, v3);

  return (NSString *)v14;
}

- (void)applicationsDidInstall:(id)a3
{
  -[RBBundlePropertiesLSProvider _removeCachedValuesForAppProxies:]((uint64_t)self, a3);
}

- (void)_removeCachedValuesForAppProxies:(uint64_t)a1
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id WeakRetained;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  if (a1)
  {
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    os_unfair_lock_lock((os_unfair_lock_t)(a1 + 24));
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v14 = v3;
    v5 = v3;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = (void *)MEMORY[0x24BE80C98];
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v9), "bundleIdentifier");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "identityForEmbeddedApplicationIdentifier:", v11);
          v12 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(*(id *)(a1 + 8), "removeObjectForKey:", v12);
          objc_msgSend(v4, "addObject:", v12);

          ++v9;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    WeakRetained = objc_loadWeakRetained((id *)(a1 + 16));
    os_unfair_lock_unlock((os_unfair_lock_t)(a1 + 24));
    objc_msgSend(WeakRetained, "bundlePropertiesProvider:didChangePropertiesForProcessIdentities:", a1, v4);

    v3 = v14;
  }

}

- (void)applicationsDidUninstall:(id)a3
{
  -[RBBundlePropertiesLSProvider _removeCachedValuesForAppProxies:]((uint64_t)self, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_propertiesByIdentity, 0);
}

@end
