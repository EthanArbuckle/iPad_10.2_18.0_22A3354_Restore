@implementation SSKNullTransformerRegistry

- (SSKNullTransformerRegistry)init
{
  SSKNullTransformerRegistry *v2;
  SSKNullTransformerRegistry *v3;
  uint64_t v4;
  NSMutableDictionary *lock_identifierToTransformers;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SSKNullTransformerRegistry;
  v2 = -[SSKNullTransformerRegistry init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v4 = objc_claimAutoreleasedReturnValue();
    lock_identifierToTransformers = v3->_lock_identifierToTransformers;
    v3->_lock_identifierToTransformers = (NSMutableDictionary *)v4;

  }
  return v3;
}

- (id)addTransformer:(id)a3 withIdentifier:(id)a4
{
  id v6;
  os_unfair_lock_s *p_lock;
  id v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[5];
  id v14;

  v6 = a4;
  p_lock = &self->_lock;
  v8 = a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  -[NSMutableDictionary setObject:forKey:](self->_lock_identifierToTransformers, "setObject:forKey:", v8, v6);

  v9 = objc_alloc(MEMORY[0x24BE0BE98]);
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __60__SSKNullTransformerRegistry_addTransformer_withIdentifier___block_invoke;
  v13[3] = &unk_25171C328;
  v13[4] = self;
  v14 = v6;
  v10 = v6;
  v11 = (void *)objc_msgSend(v9, "initWithIdentifier:forReason:queue:invalidationBlock:", v10, CFSTR("testing"), MEMORY[0x24BDAC9B8], v13);
  os_unfair_lock_unlock(p_lock);

  return v11;
}

void __60__SSKNullTransformerRegistry_addTransformer_withIdentifier___block_invoke(uint64_t a1)
{
  os_unfair_lock_assert_not_owner((const os_unfair_lock *)(*(_QWORD *)(a1 + 32) + 8));
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObjectForKey:", *(_QWORD *)(a1 + 40));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

- (id)transformDisplayConfiguration:(id)a3
{
  id v4;
  void *v5;
  NSMutableDictionary *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_lock_identifierToTransformers;
  v7 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        -[NSMutableDictionary objectForKey:](self->_lock_identifierToTransformers, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10), (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "transformDisplayConfiguration:", v4);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "unionSet:", v12);

        ++v10;
      }
      while (v8 != v10);
      v8 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  os_unfair_lock_unlock(&self->_lock);
  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lock_identifierToTransformers, 0);
}

@end
