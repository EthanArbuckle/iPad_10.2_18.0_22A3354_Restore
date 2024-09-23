@implementation RBProcessStateChangeSet

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateChangesByIdentity, 0);
}

- (id)processStateChangeForIdentity:(id)a3
{
  return (id)-[NSMutableDictionary objectForKeyedSubscript:](self->_stateChangesByIdentity, "objectForKeyedSubscript:", a3);
}

- (id)processIdentities
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x24BDBCF20];
  -[NSMutableDictionary allKeys](self->_stateChangesByIdentity, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)hasChanges
{
  return -[NSMutableDictionary count](self->_stateChangesByIdentity, "count") != 0;
}

- (RBProcessStateChangeSet)initWithChanges:(id)a3
{
  id v4;
  RBProcessStateChangeSet *v5;
  uint64_t v6;
  NSMutableDictionary *stateChangesByIdentity;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  objc_super v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)RBProcessStateChangeSet;
  v5 = -[RBProcessStateChangeSet init](&v21, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v6 = objc_claimAutoreleasedReturnValue();
    stateChangesByIdentity = v5->_stateChangesByIdentity;
    v5->_stateChangesByIdentity = (NSMutableDictionary *)v6;

    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v18;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v18 != v11)
            objc_enumerationMutation(v8);
          v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
          v14 = v5->_stateChangesByIdentity;
          objc_msgSend(v13, "identity", (_QWORD)v17);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13, v15);

        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v22, 16);
      }
      while (v10);
    }

  }
  return v5;
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[NSMutableDictionary allValues](self->_stateChangesByIdentity, "allValues");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (void)applyChanges:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  NSMutableDictionary *stateChangesByIdentity;
  void *v11;
  void *v12;
  void *v13;
  NSMutableDictionary *v14;
  void *v15;
  NSMutableDictionary *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v18 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        stateChangesByIdentity = self->_stateChangesByIdentity;
        objc_msgSend(v9, "identity");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSMutableDictionary objectForKey:](stateChangesByIdentity, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        if (v12)
        {
          objc_msgSend(v12, "changeByApplyingChange:", v9);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = self->_stateChangesByIdentity;
          objc_msgSend(v9, "identity");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          if (v13)
            -[NSMutableDictionary setObject:forKey:](v14, "setObject:forKey:", v13, v15);
          else
            -[NSMutableDictionary removeObjectForKey:](v14, "removeObjectForKey:", v15);

        }
        else
        {
          v16 = self->_stateChangesByIdentity;
          objc_msgSend(v9, "identity");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMutableDictionary setObject:forKey:](v16, "setObject:forKey:", v9, v13);
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v6);
  }

}

- (RBProcessStateChangeSet)initWithOriginalStatesByIdentity:(id)a3 updatedStatesByIdentity:(id)a4
{
  id v6;
  id v7;
  RBProcessStateChangeSet *v8;
  uint64_t v9;
  NSMutableDictionary *stateChangesByIdentity;
  objc_super v12;

  v6 = a3;
  v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)RBProcessStateChangeSet;
  v8 = -[RBProcessStateChangeSet init](&v12, sel_init);
  if (v8)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    stateChangesByIdentity = v8->_stateChangesByIdentity;
    v8->_stateChangesByIdentity = (NSMutableDictionary *)v9;

    -[RBProcessStateChangeSet _diffOriginalStatesByIdentity:withUpdatedStatesByIdentity:]((uint64_t)v8, v6, v7);
  }

  return v8;
}

- (void)_diffOriginalStatesByIdentity:(void *)a3 withUpdatedStatesByIdentity:
{
  void *v5;
  uint64_t v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  uint64_t v11;
  _QWORD v12[4];
  id v13;
  uint64_t v14;

  v8 = a2;
  if (a1)
  {
    v5 = (void *)objc_msgSend(a3, "mutableCopy");
    v6 = MEMORY[0x24BDAC760];
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __85__RBProcessStateChangeSet__diffOriginalStatesByIdentity_withUpdatedStatesByIdentity___block_invoke;
    v12[3] = &unk_24DD46CA8;
    v13 = v5;
    v14 = a1;
    v7 = v5;
    objc_msgSend(v8, "enumerateKeysAndObjectsUsingBlock:", v12);
    v9[0] = v6;
    v9[1] = 3221225472;
    v9[2] = __85__RBProcessStateChangeSet__diffOriginalStatesByIdentity_withUpdatedStatesByIdentity___block_invoke_2;
    v9[3] = &unk_24DD46CA8;
    v10 = v8;
    v11 = a1;
    objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

  }
}

void __85__RBProcessStateChangeSet__diffOriginalStatesByIdentity_withUpdatedStatesByIdentity___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  RBProcessStateChange *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v8);
  if (!v6 || (objc_msgSend(v6, "isEqual:", v5) & 1) == 0)
  {
    v7 = -[RBProcessStateChange initWithIdentity:originalState:updatedState:]([RBProcessStateChange alloc], "initWithIdentity:originalState:updatedState:", v8, v5, v6);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", v7, v8);

  }
}

void __85__RBProcessStateChangeSet__diffOriginalStatesByIdentity_withUpdatedStatesByIdentity___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  RBProcessStateChange *v7;
  id v8;

  v8 = a2;
  v5 = a3;
  objc_msgSend(*(id *)(a1 + 32), "objectForKeyedSubscript:", v8);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v6)
  {
    v7 = -[RBProcessStateChange initWithIdentity:originalState:updatedState:]([RBProcessStateChange alloc], "initWithIdentity:originalState:updatedState:", v8, 0, v5);
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "setObject:forKeyedSubscript:", v7, v8);

  }
}

@end
