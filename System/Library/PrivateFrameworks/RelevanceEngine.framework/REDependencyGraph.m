@implementation REDependencyGraph

- (BOOL)containsItem:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)markItem:(id)a3 dependentOnItem:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  __CFString *v18;
  uint64_t v19;
  id v20;

  v20 = a3;
  v6 = a4;
  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v20);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v6);
  v8 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v8;
  if (!v7)
  {
    v17 = (void *)*MEMORY[0x24BDBCAB8];
    v19 = (uint64_t)v20;
LABEL_7:
    v18 = CFSTR("Item %@ not in dependency graph %@");
LABEL_9:
    RERaiseInternalException(v17, v18, v9, v10, v11, v12, v13, v14, v19);
    goto LABEL_10;
  }
  if (!v8)
  {
    v17 = (void *)*MEMORY[0x24BDBCAB8];
    v19 = (uint64_t)v6;
    goto LABEL_7;
  }
  if (v7 == (void *)v8)
  {
    v17 = (void *)*MEMORY[0x24BDBCAB8];
    v19 = (uint64_t)v20;
    v18 = CFSTR("Cannot make item %@ not in dependency of itself");
    goto LABEL_9;
  }
  objc_msgSend(v7, "connections");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "addObject:", v15);

LABEL_10:
}

- (void)addItem:(id)a3
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  REDependencyGraphNode *v10;
  id v11;

  v11 = a3;
  if (-[REDependencyGraph containsItem:](self, "containsItem:"))
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Item %@ already in dependency graph %@"), v4, v5, v6, v7, v8, v9, (uint64_t)v11);
  v10 = -[REDependencyGraphNode initWithItem:]([REDependencyGraphNode alloc], "initWithItem:", v11);
  -[NSMapTable setObject:forKey:](self->_nodes, "setObject:forKey:", v10, v11);

}

- (void)_enumerateSortedFirstLevelDependenciesOfItem:(id)a3 usingComparator:(id)a4 withBlock:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  void *v18;
  NSMapTable *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  id v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  char v45;
  _BYTE v46[128];
  _BYTE v47[128];
  uint64_t v48;

  v48 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a4;
  v10 = a5;
  if (v10)
  {
    -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v8);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (v17)
    {
      v34 = v10;
      v35 = v9;
      v36 = v8;
      v45 = 0;
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = 0u;
      v42 = 0u;
      v43 = 0u;
      v44 = 0u;
      v19 = self->_nodes;
      v20 = -[NSMapTable countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
      if (v20)
      {
        v21 = v20;
        v22 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v21; ++i)
          {
            if (*(_QWORD *)v42 != v22)
              objc_enumerationMutation(v19);
            -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            v25 = v24;
            if (v17 != v24)
            {
              objc_msgSend(v24, "connections");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v27 = objc_msgSend(v26, "containsObject:", v17);

              if (v27)
              {
                objc_msgSend(v25, "item");
                v28 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v18, "addObject:", v28);

              }
            }

          }
          v21 = -[NSMapTable countByEnumeratingWithState:objects:count:](v19, "countByEnumeratingWithState:objects:count:", &v41, v47, 16);
        }
        while (v21);
      }

      v9 = v35;
      if (v35)
        objc_msgSend(v18, "sortUsingComparator:", v35);
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v29 = v18;
      v30 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
      v10 = v34;
      if (v30)
      {
        v31 = v30;
        v32 = *(_QWORD *)v38;
LABEL_17:
        v33 = 0;
        while (1)
        {
          if (*(_QWORD *)v38 != v32)
            objc_enumerationMutation(v29);
          (*((void (**)(id, _QWORD, char *))v34 + 2))(v34, *(_QWORD *)(*((_QWORD *)&v37 + 1) + 8 * v33), &v45);
          if (v45)
            break;
          if (v31 == ++v33)
          {
            v31 = objc_msgSend(v29, "countByEnumeratingWithState:objects:count:", &v37, v46, 16);
            if (v31)
              goto LABEL_17;
            break;
          }
        }
      }

      v8 = v36;
    }
    else
    {
      RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Item %@ not in dependency graph %@"), v11, v12, v13, v14, v15, v16, (uint64_t)v8);
    }

  }
}

uint64_t __92__REDependencyGraph_REGraphExtensions___visitNode_visited_temporary_result_comparator_warn___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_visitNode:visited:temporary:result:comparator:warn:", a2, *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(unsigned __int8 *)(a1 + 72));
}

- (id)topologicalSortedItemsWithComparator:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSMapTable *v9;
  NSMapTable *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[REDependencyGraph count](self, "count"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 512, -[REDependencyGraph count](self, "count"));
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD15C0]), "initWithOptions:capacity:", 512, -[REDependencyGraph count](self, "count"));
  if (v4)
  {
    -[REDependencyGraph allItems](self, "allItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "sortedArrayUsingComparator:", v4);
    v9 = (NSMapTable *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = self->_nodes;
  }
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v9;
  v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        -[REDependencyGraph _visitNode:visited:temporary:result:comparator:warn:](self, "_visitNode:visited:temporary:result:comparator:warn:", *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v14++), v6, v7, v5, v4, v4 == 0, (_QWORD)v17);
      }
      while (v12 != v14);
      v12 = -[NSMapTable countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  v15 = (void *)objc_msgSend(v5, "copy");
  return v15;
}

- (void)_visitNode:(id)a3 visited:(id)a4 temporary:(id)a5 result:(id)a6 comparator:(id)a7 warn:(BOOL)a8
{
  _BOOL4 v8;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void *v30;
  REDependencyGraph *v31;
  id v32;
  id v33;
  id v34;
  id v35;
  BOOL v36;

  v8 = a8;
  v14 = a3;
  v15 = a4;
  v16 = a5;
  v17 = a6;
  v18 = a7;
  if ((objc_msgSend(v15, "containsObject:", v14) & 1) == 0)
  {
    if (objc_msgSend(v16, "containsObject:", v14))
    {
      if (v8)
        RERaiseInternalException((void *)*MEMORY[0x24BDBCAB0], CFSTR("A cycle was detected in the graph. Cannot run topoligcal sort"), v19, v20, v21, v22, v23, v24, v27);
    }
    else
    {
      objc_msgSend(v16, "addObject:", v14);
      v27 = MEMORY[0x24BDAC760];
      v28 = 3221225472;
      v29 = __92__REDependencyGraph_REGraphExtensions___visitNode_visited_temporary_result_comparator_warn___block_invoke;
      v30 = &unk_24CF8AF18;
      v31 = self;
      v25 = v15;
      v32 = v25;
      v33 = v16;
      v26 = v17;
      v34 = v26;
      v35 = v18;
      v36 = v8;
      -[REDependencyGraph _enumerateSortedFirstLevelDependenciesOfItem:usingComparator:withBlock:](self, "_enumerateSortedFirstLevelDependenciesOfItem:usingComparator:withBlock:", v14, v35, &v27);
      objc_msgSend(v25, "addObject:", v14, v27, v28, v29, v30, v31);
      objc_msgSend(v26, "insertObject:atIndex:", v14, 0);

    }
  }

}

- (unint64_t)count
{
  return -[NSMapTable count](self->_nodes, "count");
}

- (void)enumerateDependenciesOfItem:(id)a3 usingBlock:(id)a4
{
  -[REDependencyGraph _enumerateSortedFirstLevelDependenciesOfItem:usingComparator:withBlock:](self, "_enumerateSortedFirstLevelDependenciesOfItem:usingComparator:withBlock:", a3, 0, a4);
}

- (REDependencyGraph)initWithPointerFunctions:(unint64_t)a3
{
  REDependencyGraph *v4;
  uint64_t v5;
  NSMapTable *nodes;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)REDependencyGraph;
  v4 = -[REDependencyGraph init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1650]), "initWithKeyOptions:valueOptions:capacity:", a3, a3, 0);
    nodes = v4->_nodes;
    v4->_nodes = (NSMapTable *)v5;

  }
  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nodes, 0);
}

- (REDependencyGraph)init
{
  return -[REDependencyGraph initWithPointerFunctions:](self, "initWithPointerFunctions:", 512);
}

- (void)enumerateObjectsUsingBlock:(id)a3
{
  void (**v4)(id, _QWORD, char *);
  NSMapTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD, char *))a3;
  if (v4)
  {
    v14 = 0;
    v10 = 0u;
    v11 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = self->_nodes;
    v6 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v11;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        v4[2](v4, *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9), &v14);
        if (v14)
          break;
        if (v7 == ++v9)
        {
          v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v15, 16);
          if (v7)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (id)topologicalSortedItems
{
  return -[REDependencyGraph topologicalSortedItemsWithComparator:](self, "topologicalSortedItemsWithComparator:", 0);
}

- (id)copyWithZone:(_NSZone *)a3
{
  REDependencyGraph *v4;
  REDependencyGraph *v5;
  uint64_t (**v6)(_QWORD, _QWORD);
  NSMapTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  id v12;
  REDependencyGraph *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _QWORD v19[4];
  REDependencyGraph *v20;
  uint64_t *v21;
  uint64_t v22;
  id *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = -[REDependencyGraph init](+[REDependencyGraph allocWithZone:](REDependencyGraph, "allocWithZone:", a3), "init");
  v22 = 0;
  v23 = (id *)&v22;
  v24 = 0x3042000000;
  v25 = __Block_byref_object_copy__0;
  v26 = __Block_byref_object_dispose__0;
  v27 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __34__REDependencyGraph_copyWithZone___block_invoke;
  v19[3] = &unk_24CF8AEC8;
  v5 = v4;
  v20 = v5;
  v21 = &v22;
  v6 = (uint64_t (**)(_QWORD, _QWORD))MEMORY[0x2199B2434](v19);
  objc_storeWeak(v23 + 5, v6);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_nodes;
  v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
  if (v8)
  {
    v9 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v16 != v9)
          objc_enumerationMutation(v7);
        -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * i), (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = (id)((uint64_t (**)(_QWORD, void *))v6)[2](v6, v11);

      }
      v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v15, v28, 16);
    }
    while (v8);
  }

  v13 = v5;
  _Block_object_dispose(&v22, 8);
  objc_destroyWeak(&v27);
  return v13;
}

id __34__REDependencyGraph_copyWithZone___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  REDependencyGraphNode *v7;
  void *v8;
  REDependencyGraphNode *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (**WeakRetained)(id, _QWORD);
  void *v23;
  void *v24;
  char v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v3, "item");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKey:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6)
  {
    v7 = [REDependencyGraphNode alloc];
    objc_msgSend(v3, "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[REDependencyGraphNode initWithItem:](v7, "initWithItem:", v8);

    v10 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
    objc_msgSend(v3, "item");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setObject:forKey:", v9, v11);

  }
  v12 = *(void **)(*(_QWORD *)(a1 + 32) + 8);
  objc_msgSend(v3, "item");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "objectForKey:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  objc_msgSend(v3, "connections", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectEnumerator");
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v29;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v29 != v19)
          objc_enumerationMutation(v16);
        v21 = *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v20);
        WeakRetained = (void (**)(id, _QWORD))objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40)
                                                                                                + 8)
                                                                                    + 40));
        WeakRetained[2](WeakRetained, v21);
        v23 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "connections");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        v25 = objc_msgSend(v24, "containsObject:", v23);

        if ((v25 & 1) == 0)
        {
          objc_msgSend(v14, "connections");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "addObject:", v23);

        }
        ++v20;
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v28, v32, 16);
    }
    while (v18);
  }

  return v14;
}

- (void)removeItem:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  NSMapTable *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v4);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v12 = self->_nodes;
    v13 = -[NSMapTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v13)
    {
      v14 = v13;
      v15 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v20 != v15)
            objc_enumerationMutation(v12);
          -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "connections");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "removeObject:", v11);

        }
        v14 = -[NSMapTable countByEnumeratingWithState:objects:count:](v12, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v14);
    }

    -[NSMapTable removeObjectForKey:](self->_nodes, "removeObjectForKey:", v4);
  }
  else
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Item %@ not in dependency graph %@"), v5, v6, v7, v8, v9, v10, (uint64_t)v4);
  }

}

- (BOOL)item:(id)a3 isDependencyOfItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  char v18;

  v6 = a3;
  v7 = a4;
  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v7);
  v9 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v9;
  if (!v8)
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Item %@ not in dependency graph %@"), v10, v11, v12, v13, v14, v15, (uint64_t)v6);
LABEL_6:
    v18 = 0;
    goto LABEL_7;
  }
  if (!v9)
  {
    RERaiseInternalException((void *)*MEMORY[0x24BDBCAB8], CFSTR("Item %@ not in dependency graph %@"), v10, v11, v12, v13, v14, v15, (uint64_t)v7);
    goto LABEL_6;
  }
  objc_msgSend(v8, "connections");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "containsObject:", v16);

LABEL_7:
  return v18;
}

- (BOOL)isEqual:(id)a3
{
  REDependencyGraph *v4;
  REDependencyGraph *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  int v18;
  BOOL v19;
  NSMapTable *obj;
  id *p_isa;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v4 = (REDependencyGraph *)a3;
  if (self == v4)
  {
    v19 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      v6 = -[REDependencyGraph count](self, "count");
      p_isa = (id *)&v5->super.isa;
      if (v6 == -[REDependencyGraph count](v5, "count"))
      {
        v25 = 0u;
        v26 = 0u;
        v23 = 0u;
        v24 = 0u;
        obj = self->_nodes;
        v7 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v24;
          while (2)
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v24 != v9)
                objc_enumerationMutation(obj);
              v11 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
              -[NSMapTable objectForKey:](self->_nodes, "objectForKey:", v11);
              v12 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(p_isa[1], "objectForKey:", v11);
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = v13;
              if (v12)
                v15 = v13 == 0;
              else
                v15 = 1;
              if (v15)
              {

LABEL_22:
                v19 = 0;
                goto LABEL_23;
              }
              objc_msgSend(v12, "connections");
              v16 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "connections");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              v18 = objc_msgSend(v16, "isEqualToHashTable:", v17);

              if (!v18)
                goto LABEL_22;
            }
            v8 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
            v19 = 1;
            if (v8)
              continue;
            break;
          }
        }
        else
        {
          v19 = 1;
        }
LABEL_23:

      }
      else
      {
        v19 = 0;
      }

    }
    else
    {
      v19 = 0;
    }
  }

  return v19;
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)REDependencyGraph;
  -[REDependencyGraph description](&v7, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable description](self->_nodes, "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingString:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (NSArray)allItems
{
  void *v3;
  id v4;
  void *v5;
  _QWORD v7[4];
  id v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[REDependencyGraph count](self, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __48__REDependencyGraph_REGraphExtensions__allItems__block_invoke;
  v7[3] = &unk_24CF8AEF0;
  v8 = v3;
  v4 = v3;
  -[REDependencyGraph enumerateObjectsUsingBlock:](self, "enumerateObjectsUsingBlock:", v7);
  v5 = (void *)objc_msgSend(v4, "copy");

  return (NSArray *)v5;
}

uint64_t __48__REDependencyGraph_REGraphExtensions__allItems__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

@end
