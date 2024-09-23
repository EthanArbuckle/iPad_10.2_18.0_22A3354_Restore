@implementation RBBundlePropertiesBSXPCProvider

- (id)propertiesForIdentifier:(id)a3
{
  id v4;
  RBXPCBundleProperties *v5;

  v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  -[NSMapTable objectForKey:](self->_propertiesByIdentifier, "objectForKey:", v4);
  v5 = (RBXPCBundleProperties *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    v5 = -[RBXPCBundleProperties initWithPID:]([RBXPCBundleProperties alloc], "initWithPID:", objc_msgSend(v4, "pid"));
    -[NSMapTable setObject:forKey:](self->_propertiesByIdentifier, "setObject:forKey:", v5, v4);
  }
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (void)removePropertiesForIdentifier:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  -[NSMapTable removeObjectForKey:](self->_propertiesByIdentifier, "removeObjectForKey:", v5);

  os_unfair_lock_unlock(p_lock);
}

- (RBBundlePropertiesBSXPCProvider)init
{
  RBBundlePropertiesBSXPCProvider *v2;
  RBBundlePropertiesBSXPCProvider *v3;
  uint64_t v4;
  NSMapTable *propertiesByIdentifier;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RBBundlePropertiesBSXPCProvider;
  v2 = -[RBBundlePropertiesBSXPCProvider init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD1650], "weakToStrongObjectsMapTable");
    v4 = objc_claimAutoreleasedReturnValue();
    propertiesByIdentifier = v3->_propertiesByIdentifier;
    v3->_propertiesByIdentifier = (NSMapTable *)v4;

  }
  return v3;
}

- (id)debugDescription
{
  id v3;
  NSMapTable *v4;
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
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = self->_propertiesByIdentifier;
  v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
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
        -[NSMapTable objectForKey:](self->_propertiesByIdentifier, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          objc_msgSend(v9, "description");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "appendFormat:", CFSTR("%@=%@\n\t\t"), v11, v10, (_QWORD)v16);

        }
      }
      v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

  os_unfair_lock_unlock(&self->_lock);
  v12 = objc_alloc(MEMORY[0x24BDD17C8]);
  objc_msgSend((id)objc_opt_class(), "description");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v12, "initWithFormat:", CFSTR("<%@| propertiesByIdentifier:{\n\t\t%@}>"), v13, v3);

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_propertiesByIdentifier, 0);
}

@end
