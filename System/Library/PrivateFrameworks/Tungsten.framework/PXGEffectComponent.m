@implementation PXGEffectComponent

- (PXGEffectComponent)initWithDataStore:(id)a3
{
  PXGEffectComponent *v3;
  PXGEffectComponent *v4;
  uint64_t v5;
  NSMapTable *lock_effectById;
  NSMutableSet *v7;
  NSMutableSet *allEffects;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PXGEffectComponent;
  v3 = -[PXGComponent initWithDataStore:](&v10, sel_initWithDataStore_, a3);
  v4 = v3;
  if (v3)
  {
    v3->_lock._os_unfair_lock_opaque = 0;
    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    lock_effectById = v4->_lock_effectById;
    v4->_lock_effectById = (NSMapTable *)v5;

    v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x24BDBCEF0]);
    allEffects = v4->_allEffects;
    v4->_allEffects = v7;

  }
  return v4;
}

- (void)setContentsFrom:(id)a3
{
  PXGEffectComponent *v4;
  NSMapTable *v5;
  NSMapTable *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  os_unfair_lock_s *lock;
  os_unfair_lock_t p_lock;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = (PXGEffectComponent *)a3;
  if (self != v4)
  {
    p_lock = &self->_lock;
    os_unfair_lock_lock(&self->_lock);
    lock = &v4->_lock;
    os_unfair_lock_lock(&v4->_lock);
    v5 = self->_lock_effectById;
    v6 = v4->_lock_effectById;
    -[NSMapTable removeAllObjects](v5, "removeAllObjects");
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[NSMapTable keyEnumerator](v6, "keyEnumerator");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
          -[NSMapTable objectForKey:](v6, "objectForKey:", v12, lock, p_lock);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            -[NSMapTable setObject:forKey:](v5, "setObject:forKey:", v13, v12);

        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    -[PXGComponent mutableDataStore](self, "mutableDataStore");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[PXGComponent dataStore](v4, "dataStore");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setContentsFrom:", v15);

    -[NSMutableSet setSet:](self->_allEffects, "setSet:", v4->_allEffects);
    os_unfair_lock_unlock(lock);
    os_unfair_lock_unlock(p_lock);

  }
}

- (void)performChanges:(id)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXGEffectComponent;
  -[PXGComponent performChanges:](&v3, sel_performChanges_, a3);
}

- (const)effectIds
{
  id v2;
  const unsigned int *v3;

  -[PXGComponent dataStore](self, "dataStore");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (const unsigned int *)objc_msgSend(v2, "contents");

  return v3;
}

- (unsigned)mutableEffectIds
{
  id v2;
  unsigned int *v3;

  -[PXGComponent mutableDataStore](self, "mutableDataStore");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v3 = (unsigned int *)objc_msgSend(v2, "mutableContents");

  return v3;
}

- (void)willDestroyEntities:(id *)a3 count:(int64_t)a4
{
  objc_super v7;
  _QWORD v8[6];

  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __48__PXGEffectComponent_willDestroyEntities_count___block_invoke;
  v8[3] = &__block_descriptor_48_e55_v16__0__PXGEffectComponent_PXGMutableEffectComponent__8l;
  v8[4] = a4;
  v8[5] = a3;
  -[PXGEffectComponent performChanges:](self, "performChanges:", v8);
  v7.receiver = self;
  v7.super_class = (Class)PXGEffectComponent;
  -[PXGComponent willDestroyEntities:count:](&v7, sel_willDestroyEntities_count_, a3, a4);
}

- (void)registerEffect:(id)a3 withEffectId:(unsigned int)a4
{
  uint64_t v4;
  os_unfair_lock_s *p_lock;
  id v7;
  NSMapTable *lock_effectById;
  void *v9;

  v4 = *(_QWORD *)&a4;
  p_lock = &self->_lock;
  v7 = a3;
  os_unfair_lock_lock(p_lock);
  lock_effectById = self->_lock_effectById;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable setObject:forKey:](lock_effectById, "setObject:forKey:", v7, v9);

  -[NSMutableSet addObject:](self->_allEffects, "addObject:", v7);
  os_unfair_lock_unlock(p_lock);
}

- (void)unregisterEffectId:(unsigned int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  NSMapTable *lock_effectById;
  void *v7;

  v3 = *(_QWORD *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_effectById = self->_lock_effectById;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable removeObjectForKey:](lock_effectById, "removeObjectForKey:", v7);

  os_unfair_lock_unlock(p_lock);
}

- (id)effectForId:(unsigned int)a3
{
  uint64_t v3;
  os_unfair_lock_s *p_lock;
  NSMapTable *lock_effectById;
  void *v7;
  void *v8;

  v3 = *(_QWORD *)&a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lock_effectById = self->_lock_effectById;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](lock_effectById, "objectForKey:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8;
}

- (void)didUseEffect:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[PXGEffectComponent delegate](self, "delegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "effectComponent:prepareForEffect:", self, v4);

}

- (void)cleanupUnusedObjects
{
  id v3;
  void *v4;
  uint64_t v5;
  PXGEffectComponent *v6;
  uint64_t v7;
  _DWORD *v8;
  NSMutableSet *allEffects;
  void *v11;
  id v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PXGEffectComponent;
  -[PXGComponent cleanupUnusedObjects](&v16, sel_cleanupUnusedObjects);
  v3 = objc_alloc_init(MEMORY[0x24BDD1698]);
  -[PXGComponent dataStore](self, "dataStore");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "capacity");

  v6 = objc_retainAutorelease(self);
  v7 = -[PXGEffectComponent effectIds](v6, "effectIds");
  if (v5 >= 1)
  {
    v8 = (_DWORD *)v7;
    do
    {
      if (*v8++)
        objc_msgSend(v3, "addIndex:");
      --v5;
    }
    while (v5);
  }
  allEffects = v6->_allEffects;
  v11 = (void *)MEMORY[0x24BDD1758];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __42__PXGEffectComponent_cleanupUnusedObjects__block_invoke;
  v14[3] = &unk_251A6E430;
  v15 = v3;
  v12 = v3;
  objc_msgSend(v11, "predicateWithBlock:", v14);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet filterUsingPredicate:](allEffects, "filterUsingPredicate:", v13);

}

- (PXGEffectComponentDelegate)delegate
{
  return (PXGEffectComponentDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_allEffects, 0);
  objc_storeStrong((id *)&self->_lock_effectById, 0);
}

uint64_t __42__PXGEffectComponent_cleanupUnusedObjects__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "containsIndex:", objc_msgSend(a2, "effectId"));
}

uint64_t __48__PXGEffectComponent_willDestroyEntities_count___block_invoke(uint64_t a1, id a2)
{
  uint64_t result;
  uint64_t v4;
  unsigned int *v5;
  unsigned int v6;

  result = objc_msgSend(objc_retainAutorelease(a2), "mutableEffectIds");
  v4 = *(_QWORD *)(a1 + 32);
  if (v4 >= 1)
  {
    v5 = *(unsigned int **)(a1 + 40);
    do
    {
      v6 = *v5++;
      *(_DWORD *)(result + 4 * v6) = 0;
      --v4;
    }
    while (v4);
  }
  return result;
}

+ (unint64_t)elementSize
{
  return 4;
}

@end
