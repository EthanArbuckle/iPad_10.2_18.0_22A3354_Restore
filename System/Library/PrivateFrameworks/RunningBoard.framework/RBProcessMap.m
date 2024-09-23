@implementation RBProcessMap

- (unint64_t)count
{
  os_unfair_lock_s *p_lock;
  unint64_t v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = -[NSMutableDictionary count](self->_valueMap, "count");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)allValue
{
  os_unfair_lock_s *p_lock;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[NSMutableDictionary allValues](self->_valueMap, "allValues", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if (v10)
        {
          objc_msgSend(MEMORY[0x24BDBCEF8], "null");
          v11 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10 != v11)
            objc_msgSend(v4, "addObject:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)removeAllObjects
{
  os_unfair_lock_s *p_lock;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeAllObjects](self->_valueMap, "removeAllObjects");
  os_unfair_lock_unlock(p_lock);
}

- (id)valueForIdentity:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  void *v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (!v4)
    goto LABEL_5;
  -[NSMutableDictionary objectForKey:](self->_valueMap, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6 == v7)
    {

LABEL_5:
      v6 = 0;
    }
  }
  os_unfair_lock_unlock(p_lock);

  return v6;
}

- (id)setValue:(id)a3 forIdentity:(id)a4
{
  id v7;
  id v8;
  os_unfair_lock_s *p_lock;
  void *v10;
  void *v11;
  NSMutableDictionary *valueMap;
  void *v13;
  void *v15;
  void *v16;

  v7 = a3;
  v8 = a4;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessMap.m"), 128, CFSTR("identity cannot be nil %@"), v16);

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_valueMap, "objectForKey:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10 == v11)
    {

      v10 = 0;
    }
  }
  valueMap = self->_valueMap;
  if (v7)
  {
    -[NSMutableDictionary setObject:forKey:](valueMap, "setObject:forKey:", v7, v8);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](valueMap, "setObject:forKey:", v13, v8);

  }
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)enumerateWithBlock:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  v6 = (id)-[NSMutableDictionary copy](self->_valueMap, "copy");
  os_unfair_lock_unlock(&self->_lock);
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __35__RBProcessMap_enumerateWithBlock___block_invoke;
  v7[3] = &unk_24DD46DE8;
  v8 = v4;
  v5 = v4;
  objc_msgSend(v6, "enumerateKeysAndObjectsUsingBlock:", v7);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_valueMap, 0);
}

- (BOOL)containsIdentity:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  void *v6;
  BOOL v7;

  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_valueMap, "objectForKey:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6 != 0;

  }
  else
  {
    v7 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v7;
}

- (id)allIdentities
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary allKeys](self->_valueMap, "allKeys");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (RBProcessMap)init
{
  RBProcessMap *v2;
  RBProcessMap *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *valueMap;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)RBProcessMap;
  v2 = -[RBProcessMap init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    valueMap = v3->_valueMap;
    v3->_valueMap = v4;

  }
  return v3;
}

- (void)removeIdentity:(id)a3
{
  void *v5;
  id v6;

  v6 = a3;
  if (!v6)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessMap.m"), 57, CFSTR("identity cannot be nil"));

  }
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary removeObjectForKey:](self->_valueMap, "removeObjectForKey:", v6);
  os_unfair_lock_unlock(&self->_lock);

}

- (id)removeValueForIdentity:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  if (!v4)
    goto LABEL_6;
  -[NSMutableDictionary objectForKey:](self->_valueMap, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 != v6)
    {
      -[NSMutableDictionary removeObjectForKey:](self->_valueMap, "removeObjectForKey:", v4);
      goto LABEL_7;
    }

LABEL_6:
    v5 = 0;
  }
LABEL_7:
  os_unfair_lock_unlock(&self->_lock);

  return v5;
}

- (void)addIdentity:(id)a3
{
  os_unfair_lock_s *p_lock;
  void *v6;
  NSMutableDictionary *valueMap;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (!v11)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD17F0], "callStackSymbols");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("RBProcessMap.m"), 47, CFSTR("identity cannot be nil %@"), v10);

  }
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary objectForKey:](self->_valueMap, "objectForKey:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    valueMap = self->_valueMap;
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](valueMap, "setObject:forKey:", v8, v11);

  }
  os_unfair_lock_unlock(p_lock);

}

- (id)removeValueForIdentity:(id)a3 withPredicate:(id)a4
{
  id v6;
  unsigned int (**v7)(id, void *);
  void *v8;
  void *v9;

  v6 = a3;
  v7 = (unsigned int (**)(id, void *))a4;
  os_unfair_lock_lock_with_options();
  if (!v6)
    goto LABEL_7;
  -[NSMutableDictionary objectForKey:](self->_valueMap, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
    goto LABEL_8;
  objc_msgSend(MEMORY[0x24BDBCEF8], "null");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8 == v9)
  {

LABEL_7:
    v8 = 0;
    goto LABEL_8;
  }
  if (v7[2](v7, v8))
    -[NSMutableDictionary removeObjectForKey:](self->_valueMap, "removeObjectForKey:", v6);
LABEL_8:
  os_unfair_lock_unlock(&self->_lock);

  return v8;
}

void __35__RBProcessMap_enumerateWithBlock___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4)
{
  uint64_t v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  id v11;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = (void *)MEMORY[0x24BDBCEF8];
  v8 = a3;
  v9 = a2;
  objc_msgSend(v7, "null");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (v11 == v8)
    v10 = 0;
  else
    v10 = v8;
  (*(void (**)(uint64_t, id, id, uint64_t))(v6 + 16))(v6, v9, v10, a4);

}

- (id)dictionary
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v4 = (void *)-[NSMutableDictionary copy](self->_valueMap, "copy");
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  RBProcessMap *v4;

  v4 = objc_alloc_init(RBProcessMap);
  os_unfair_lock_lock_with_options();
  -[NSMutableDictionary addEntriesFromDictionary:](v4->_valueMap, "addEntriesFromDictionary:", self->_valueMap);
  os_unfair_lock_unlock(&self->_lock);
  return v4;
}

@end
