@implementation SBCountedMap

- (BOOL)checkinValue:(id)a3
{
  id v4;
  void *v5;
  id v6;
  BOOL v7;

  v4 = a3;
  objc_msgSend(v4, "sbh_countedMapKey");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[NSMutableDictionary objectForKey:](self->_map, "objectForKey:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6 == v4
      && (-[NSCountedSet removeObject:](self->_countedKeys, "removeObject:", v5),
          (-[NSCountedSet containsObject:](self->_countedKeys, "containsObject:", v5) & 1) == 0))
    {
      -[NSMutableDictionary removeObjectForKey:](self->_map, "removeObjectForKey:", v5);
      v7 = 1;
      v6 = v4;
    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (id)checkoutValueForKey:(id)a3 creationBlock:(id)a4
{
  id v6;
  void (**v7)(id, id);
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (!v6)
    goto LABEL_8;
  -[NSMutableDictionary objectForKey:](self->_map, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    objc_msgSend(v8, "sbh_countedMapKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet addObject:](self->_countedKeys, "addObject:", v10);
LABEL_7:

    goto LABEL_9;
  }
  if (!v7)
  {
LABEL_8:
    v9 = 0;
    goto LABEL_9;
  }
  v7[2](v7, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v11;
  if (v11)
  {
    objc_msgSend(v11, "sbh_countedMapKey");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSCountedSet addObject:](self->_countedKeys, "addObject:", v10);
    -[NSMutableDictionary setObject:forKey:](self->_map, "setObject:forKey:", v9, v10);
    goto LABEL_7;
  }
LABEL_9:

  return v9;
}

- (SBCountedMap)init
{
  SBCountedMap *v2;
  NSCountedSet *v3;
  NSCountedSet *countedKeys;
  NSMutableDictionary *v5;
  NSMutableDictionary *map;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBCountedMap;
  v2 = -[SBCountedMap init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSCountedSet *)objc_alloc_init(MEMORY[0x1E0CB3550]);
    countedKeys = v2->_countedKeys;
    v2->_countedKeys = v3;

    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    map = v2->_map;
    v2->_map = v5;

  }
  return v2;
}

- (id)description
{
  void *v3;
  id v4;
  void *v5;
  NSCountedSet *countedKeys;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, void *);
  void *v14;
  id v15;
  SBCountedMap *v16;

  objc_msgSend(MEMORY[0x1E0D01748], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendObject:withName:", self->_map, CFSTR("map"));
  v5 = (void *)objc_opt_new();
  countedKeys = self->_countedKeys;
  v11 = MEMORY[0x1E0C809B0];
  v12 = 3221225472;
  v13 = __27__SBCountedMap_description__block_invoke;
  v14 = &unk_1E8D87598;
  v15 = v5;
  v16 = self;
  v7 = v5;
  -[NSCountedSet enumerateObjectsUsingBlock:](countedKeys, "enumerateObjectsUsingBlock:", &v11);
  v8 = (id)objc_msgSend(v3, "appendObject:withName:", v7, CFSTR("countedKeys w/ count"), v11, v12, v13, v14);
  objc_msgSend(v3, "build");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

void __27__SBCountedMap_description__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  id v5;
  id v6;

  v3 = (void *)MEMORY[0x1E0CB37E8];
  v4 = *(void **)(*(_QWORD *)(a1 + 40) + 8);
  v5 = a2;
  objc_msgSend(v3, "numberWithUnsignedInteger:", objc_msgSend(v4, "countForObject:", v5));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v6, v5);

}

- (void)checkinValues:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        -[SBCountedMap checkinValue:](self, "checkinValue:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (BOOL)containsKey:(id)a3
{
  return -[NSCountedSet containsObject:](self->_countedKeys, "containsObject:", a3);
}

- (BOOL)containsValue:(id)a3
{
  void *v4;
  char v5;

  objc_msgSend(a3, "sbh_countedMapKey");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    v5 = -[NSCountedSet containsObject:](self->_countedKeys, "containsObject:", v4);
  else
    v5 = 0;

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_map, 0);
  objc_storeStrong((id *)&self->_countedKeys, 0);
}

@end
