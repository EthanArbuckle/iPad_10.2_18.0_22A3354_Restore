@implementation PXGEntityManager

- (PXGEntityManager)initWithQueue:(id)a3
{
  id v5;
  PXGEntityManager *v6;
  PXGEntityManager *v7;
  uint64_t v8;
  NSMapTable *observersByComponent;
  uint64_t v10;
  NSMapTable *componentByClass;
  NSMutableArray *v12;
  NSMutableArray *components;
  NSMutableIndexSet *v14;
  NSMutableIndexSet *reusableEntityIDs;
  objc_super v17;

  v5 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PXGEntityManager;
  v6 = -[PXGEntityManager init](&v17, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    observersByComponent = v7->_observersByComponent;
    v7->_observersByComponent = (NSMapTable *)v8;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    componentByClass = v7->_componentByClass;
    v7->_componentByClass = (NSMapTable *)v10;

    v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    components = v7->_components;
    v7->_components = v12;

    v14 = (NSMutableIndexSet *)objc_alloc_init(MEMORY[0x24BDD1698]);
    reusableEntityIDs = v7->_reusableEntityIDs;
    v7->_reusableEntityIDs = v14;

    -[PXGEntityManager setCapacity:](v7, "setCapacity:", 2);
    -[NSMutableIndexSet removeIndex:](v7->_reusableEntityIDs, "removeIndex:", 0);
  }

  return v7;
}

- (PXGLoadingStatusComponent)loadingStatus
{
  return (PXGLoadingStatusComponent *)-[PXGEntityManager componentForClass:](self, "componentForClass:", objc_opt_class());
}

- (void)cleanupUnusedObjects
{
  NSMutableArray *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x24BDAC8D0];
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_components;
  v3 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v6++), "cleanupUnusedObjects", (_QWORD)v7);
      }
      while (v4 != v6);
      v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)componentWillPerformChanges:(id)a3
{
  ++self->_componentsPerformingChangesCount;
}

- (void)_configureComponent:(id)a3
{
  id v4;
  int64_t v5;
  void *v6;
  int64_t v7;
  id v8;

  v4 = a3;
  v5 = -[PXGEntityManager capacity](self, "capacity");
  objc_msgSend(v4, "dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setCapacity:", v5);

  v7 = -[PXGEntityManager capacity](self, "capacity");
  objc_msgSend(v4, "previousDataStore");
  v8 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setCapacity:", v7);
}

- (int64_t)capacity
{
  return self->_capacity;
}

- (void)componentDidPerformChanges:(id)a3
{
  _BOOL4 v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  id v10;

  v10 = a3;
  --self->_componentsPerformingChangesCount;
  v4 = -[PXGEntityManager _hasObserversForComponent:](self, "_hasObserversForComponent:", v10);
  objc_msgSend(v10, "previousDataStore");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "dataStore");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      objc_msgSend(v10, "previousDataStore");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "dataStore");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setContentsFrom:", v9);

      -[PXGEntityManager _notifyChangesForComponent:](self, "_notifyChangesForComponent:", v10);
    }
  }
  else
  {
    objc_msgSend(v5, "setContentsFrom:", v6);

  }
}

- (BOOL)_hasObserversForComponent:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_observersByComponent, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (id)componentForClass:(Class)a3
{
  void *v5;

  -[NSMapTable objectForKey:](self->_componentByClass, "objectForKey:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    -[objc_class createWithDefaultDataStore](a3, "createWithDefaultDataStore");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObserver:", self);
    -[PXGEntityManager _configureComponent:](self, "_configureComponent:", v5);
    -[NSMapTable setObject:forKey:](self->_componentByClass, "setObject:forKey:", v5, a3);
    -[NSMutableArray addObject:](self->_components, "addObject:", v5);
  }
  return v5;
}

- (void)createEntitiesWithCount:(int64_t)a3 addingToArray:(id *)a4
{
  uint64_t v7;
  NSMutableIndexSet *v8;
  uint64_t v9;
  void *v11;
  NSMutableIndexSet *v12;

  if (self->_componentsPerformingChangesCount)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGEntityManager.m"), 77, CFSTR("Creating entity while changing components, this is not supported."));

  }
  v7 = -[NSMutableIndexSet count](self->_reusableEntityIDs, "count");
  -[PXGEntityManager setCapacity:](self, "setCapacity:", ((a3 - v7) & ~((a3 - v7) >> 63)) + -[PXGEntityManager capacity](self, "capacity"));
  v8 = self->_reusableEntityIDs;
  if (a3 >= 1)
  {
    v12 = v8;
    do
    {
      v9 = -[NSMutableIndexSet firstIndex](v12, "firstIndex");
      -[NSMutableIndexSet removeIndex:](v12, "removeIndex:", v9);
      v8 = v12;
      a4->var0 = v9;
      ++a4;
      --a3;
    }
    while (a3);
  }

}

- (void)setCapacity:(int64_t)a3
{
  int64_t capacity;
  NSMutableArray *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  capacity = self->_capacity;
  if (capacity != a3)
  {
    if (capacity >= a3)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGEntityManager.m"), 60, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("capacity > _capacity"));

      capacity = self->_capacity;
    }
    self->_capacity = a3;
    -[NSMutableIndexSet addIndexesInRange:](self->_reusableEntityIDs, "addIndexesInRange:", capacity, a3 - capacity);
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v6 = self->_components;
    v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v14;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v14 != v9)
            objc_enumerationMutation(v6);
          -[PXGEntityManager _configureComponent:](self, "_configureComponent:", *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v8);
    }

  }
}

- (PXGEffectComponent)effectComponent
{
  return (PXGEffectComponent *)-[PXGEntityManager componentForClass:](self, "componentForClass:", objc_opt_class());
}

- (PXGEntityManager)init
{
  void *v4;

  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGEntityManager.m"), 47, CFSTR("%s is not available as initializer"), "-[PXGEntityManager init]");

  abort();
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  int64_t v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[PXGEntityManager capacity](self, "capacity");
  -[NSMutableIndexSet px_shortDescription](self->_reusableEntityIDs, "px_shortDescription");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p, capacity:%ld, reusable:%@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- ($738B17BD11CC339B30296C0EA03CEC2B)createEntity
{
  $738B17BD11CC339B30296C0EA03CEC2B v3;

  v3.var0 = 0;
  -[PXGEntityManager createEntitiesWithCount:addingToArray:](self, "createEntitiesWithCount:addingToArray:", 1, &v3);
  return v3;
}

- (void)destroyEntity:(id)a3
{
  unsigned int var0;

  var0 = a3.var0;
  -[PXGEntityManager destroyEntities:count:](self, "destroyEntities:count:", &var0, 1);
}

- (void)destroyEntities:(id *)a3 count:(int64_t)a4
{
  int64_t v4;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  unsigned int var0;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  if (a4)
  {
    v4 = a4;
    if (self->_componentsPerformingChangesCount)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("PXGEntityManager.m"), 99, CFSTR("Destroying entity while changing components, this is not supported."));

    }
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v7 = self->_components;
    v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v16;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v16 != v10)
            objc_enumerationMutation(v7);
          objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * v11++), "willDestroyEntities:count:", a3, v4, (_QWORD)v15);
        }
        while (v9 != v11);
        v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v9);
    }

    if (v4 >= 1)
    {
      do
      {
        var0 = a3->var0;
        ++a3;
        -[NSMutableIndexSet addIndex:](self->_reusableEntityIDs, "addIndex:", var0, (_QWORD)v15);
        --v4;
      }
      while (v4);
    }
  }
}

- (id)componentsForComponentClasses:(id)a3
{
  PFMap();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)_notifyChangesForComponent:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_observersByComponent, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "entityManager:componentDidChange:", self, v4);
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void)registerObserver:(id)a3 forComponents:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_observersByComponent, "objectForKey:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        if (!v13)
        {
          objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](self->_observersByComponent, "setObject:forKey:", v13, v12);
        }
        objc_msgSend(v13, "addObject:", v6);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_reusableEntityIDs, 0);
  objc_storeStrong((id *)&self->_componentByDataStore, 0);
  objc_storeStrong((id *)&self->_components, 0);
  objc_storeStrong((id *)&self->_componentByClass, 0);
  objc_storeStrong((id *)&self->_observersByComponent, 0);
}

uint64_t __50__PXGEntityManager_componentsForComponentClasses___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "componentForClass:", a2);
}

@end
