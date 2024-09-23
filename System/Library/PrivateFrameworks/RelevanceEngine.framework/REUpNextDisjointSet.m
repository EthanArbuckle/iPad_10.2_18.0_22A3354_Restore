@implementation REUpNextDisjointSet

- (REUpNextDisjointSet)init
{
  REUpNextDisjointSet *v2;
  uint64_t v3;
  NSMapTable *nodes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)REUpNextDisjointSet;
  v2 = -[REUpNextDisjointSet init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", 512, 0, 0);
    nodes = v2->_nodes;
    v2->_nodes = (NSMapTable *)v3;

  }
  return v2;
}

- (void)dealloc
{
  NSMapTable *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  objc_super v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = self->_nodes;
  v4 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v7));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setParent:", 0);
        objc_msgSend(v8, "children");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "removeAllObjects");

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMapTable countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }

  v10.receiver = self;
  v10.super_class = (Class)REUpNextDisjointSet;
  -[REUpNextDisjointSet dealloc](&v10, sel_dealloc);
}

- (id)copyWithZone:(_NSZone *)a3
{
  REUpNextDisjointSet *v4;
  id *v5;
  void (**v6)(_QWORD, _QWORD, _QWORD);
  NSMapTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  _BOOL4 v13;
  void *v14;
  void *v15;
  id *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _QWORD v22[4];
  id *v23;
  uint64_t *v24;
  uint64_t v25;
  id *v26;
  uint64_t v27;
  void (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = -[REUpNextDisjointSet init](+[REUpNextDisjointSet allocWithZone:](REUpNextDisjointSet, "allocWithZone:", a3), "init");
  v25 = 0;
  v26 = (id *)&v25;
  v27 = 0x3042000000;
  v28 = __Block_byref_object_copy__9;
  v29 = __Block_byref_object_dispose__9;
  v30 = 0;
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __36__REUpNextDisjointSet_copyWithZone___block_invoke;
  v22[3] = &unk_24CF8D018;
  v5 = v4;
  v23 = v5;
  v24 = &v25;
  v6 = (void (**)(_QWORD, _QWORD, _QWORD))MEMORY[0x2199B2434](v22);
  objc_storeWeak(v26 + 5, v6);
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v7 = self->_nodes;
  v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v19 != v9)
          objc_enumerationMutation(v7);
        v11 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v5[1], "objectForKey:", v11, (_QWORD)v18);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = v12 == 0;

        if (v13)
        {
          -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "rootNode");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          ((void (**)(_QWORD, void *, _QWORD))v6)[2](v6, v15, 0);

        }
      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v18, v31, 16);
    }
    while (v8);
  }

  v16 = v5;
  _Block_object_dispose(&v25, 8);
  objc_destroyWeak(&v30);
  return v16;
}

void __36__REUpNextDisjointSet_copyWithZone___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  REUpNextSetNode *v10;
  void *v11;
  REUpNextSetNode *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void (**WeakRetained)(id, _QWORD, void *);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v5, "item");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v10 = [REUpNextSetNode alloc];
    objc_msgSend(v5, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = -[REUpNextSetNode initWithItem:](v10, "initWithItem:", v11);

    v13 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v5, "item");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setObject:forKey:", v12, v14);

    if (v6)
      -[REUpNextSetNode join:](v12, "join:", v6);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    objc_msgSend(v5, "children", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        v19 = 0;
        do
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v15);
          v20 = *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * v19);
          WeakRetained = (void (**)(id, _QWORD, void *))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                                              + 40));
          WeakRetained[2](WeakRetained, v20, v12);

          ++v19;
        }
        while (v17 != v19);
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v17);
    }

  }
}

- (void)addItem:(id)a3
{
  REUpNextSetNode *v4;
  id v5;

  v5 = a3;
  if (-[REUpNextDisjointSet containsItem:](self, "containsItem:"))
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Item %@ already in disjoint set %@"), v5, self);
  v4 = -[REUpNextSetNode initWithItem:]([REUpNextSetNode alloc], "initWithItem:", v5);
  -[NSMapTable setObject:forKey:](self->_nodes, "setObject:forKey:", v4, v5);

}

- (void)removeItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Item %@ not in disjoint set %@"), v5, self);
  objc_msgSend(v4, "remove");
  -[NSMapTable removeObjectForKey:](self->_nodes, "removeObjectForKey:", v5);

}

- (void)connectItem:(id)a3 withItem:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Item %@ not in disjoint set %@"), v10, self);
    if (v9)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Item %@ not in disjoint set %@"), v6, self);
    goto LABEL_3;
  }
  if (!v8)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v7, "join:", v9);

}

- (unint64_t)count
{
  return -[NSMapTable count](self->_nodes, "count");
}

- (BOOL)containsItem:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (id)allItemsConnectedToItem:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void (**v9)(_QWORD, _QWORD);
  void *v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;
  uint64_t *v16;
  uint64_t v17;
  id *v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Item %@ not in disjoint set %@"), v4, self);
  objc_msgSend(MEMORY[0x24BDBCEF0], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0;
  v18 = (id *)&v17;
  v19 = 0x3042000000;
  v20 = __Block_byref_object_copy__9;
  v21 = __Block_byref_object_dispose__9;
  v22 = 0;
  v13[0] = MEMORY[0x24BDAC760];
  v13[1] = 3221225472;
  v13[2] = __47__REUpNextDisjointSet_allItemsConnectedToItem___block_invoke;
  v13[3] = &unk_24CF8D040;
  v7 = v5;
  v14 = v7;
  v8 = v6;
  v15 = v8;
  v16 = &v17;
  v9 = (void (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v13);
  objc_storeWeak(v18 + 5, v9);
  objc_msgSend(v7, "rootNode");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  ((void (**)(_QWORD, void *))v9)[2](v9, v10);
  v11 = (void *)objc_msgSend(v8, "copy");

  _Block_object_dispose(&v17, 8);
  objc_destroyWeak(&v22);

  return v11;
}

void __47__REUpNextDisjointSet_allItemsConnectedToItem___block_invoke(_QWORD *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void (**WeakRetained)(id, _QWORD);
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = v3;
  if ((id)a1[4] != v3)
  {
    v5 = (void *)a1[5];
    objc_msgSend(v3, "item");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v6);

  }
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(v4, "children", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v11);
        WeakRetained = (void (**)(id, _QWORD))objc_loadWeakRetained((id *)(*(_QWORD *)(a1[6] + 8) + 40));
        WeakRetained[2](WeakRetained, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

}

- (BOOL)isItem:(id)a3 connectedToItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;

  v6 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = (void *)v9;
  if (!v8)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Item %@ not in disjoint set %@"), v6, self);
    if (v10)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x24BDBCE88], "raise:format:", *MEMORY[0x24BDBCAB8], CFSTR("Item %@ not in disjoint set %@"), v7, self);
    goto LABEL_3;
  }
  if (!v9)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v8, "rootNode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "rootNode");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isEqual:", v12);

  return v13;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REUpNextDisjointSet;
  -[REUpNextDisjointSet description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable description](self->_nodes, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
