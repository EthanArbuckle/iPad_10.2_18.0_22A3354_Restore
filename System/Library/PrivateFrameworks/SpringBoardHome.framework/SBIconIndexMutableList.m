@implementation SBIconIndexMutableList

- (id)nodes
{
  return (id)-[NSMutableArray copy](self->_nodes, "copy");
}

- (unint64_t)count
{
  return -[NSMutableArray count](self->_nodes, "count");
}

- (id)nodeAtIndex:(unint64_t)a3
{
  return (id)-[NSMutableArray objectAtIndex:](self->_nodes, "objectAtIndex:", a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  return -[NSMutableArray countByEnumeratingWithState:objects:count:](self->_nodes, "countByEnumeratingWithState:objects:count:", a3, a4, a5);
}

- (id)nodesAtIndexes:(id)a3
{
  return (id)-[NSMutableArray objectsAtIndexes:](self->_nodes, "objectsAtIndexes:", a3);
}

- (void)enumerateNodesAtIndexes:(id)a3 options:(unint64_t)a4 usingBlock:(id)a5
{
  -[NSMutableArray enumerateObjectsAtIndexes:options:usingBlock:](self->_nodes, "enumerateObjectsAtIndexes:options:usingBlock:", a3, a4, a5);
}

- (id)indexPathsForContainedNodeIdentifier:(id)a3 prefixPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  unint64_t v14;
  NSObject *v15;
  void *v16;
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint8_t buf[4];
  id v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v18 = a4;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  -[NSMapTable objectForKey:](self->_index, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (!v8)
  {

LABEL_17:
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v9 = v8;
  v10 = 0;
  v11 = *(_QWORD *)v20;
  do
  {
    for (i = 0; i != v9; ++i)
    {
      if (*(_QWORD *)v20 != v11)
        objc_enumerationMutation(v7);
      v13 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
      v14 = -[SBIconIndexMutableList indexOfNode:](self, "indexOfNode:", v13);
      if (v14 == 0x7FFFFFFFFFFFFFFFLL)
      {
        NSLog(CFSTR("Node is not in list that the index says it is in. Node: %@"), v6);
        SBLogIcon();
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138412290;
          v24 = v6;
          _os_log_error_impl(&dword_1CFEF3000, v15, OS_LOG_TYPE_ERROR, "Index believes node is in list but we didn't find it in the real array: %@", buf, 0xCu);
        }
      }
      else
      {
        objc_msgSend(v18, "indexPathByAddingIndex:", v14);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "indexPathsForContainedNodeIdentifier:prefixPath:", v6, v16);
        v15 = objc_claimAutoreleasedReturnValue();

        if (v10)
        {
          objc_msgSend(v10, "unionSet:", v15);
        }
        else
        {
          v15 = v15;
          v10 = v15;
        }
      }

    }
    v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  }
  while (v9);

  if (!v10)
    goto LABEL_17;
LABEL_18:

  return v10;
}

- (unint64_t)indexOfNode:(id)a3
{
  return -[NSMutableArray indexOfObject:](self->_nodes, "indexOfObject:", a3);
}

- (BOOL)containsNodeIdentifier:(id)a3
{
  void *v3;
  BOOL v4;

  -[NSMapTable objectForKey:](self->_index, "objectForKey:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") != 0;

  return v4;
}

- (unint64_t)indexOfNodeWithOptions:(unint64_t)a3 passingTest:(id)a4
{
  return -[NSMutableArray indexOfObjectWithOptions:passingTest:](self->_nodes, "indexOfObjectWithOptions:passingTest:", a3, a4);
}

- (id)nodesContainingNodeIdentifier:(id)a3
{
  return -[NSMapTable objectForKey:](self->_index, "objectForKey:", a3);
}

- (void)enumerateNodesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  -[NSMutableArray enumerateObjectsWithOptions:usingBlock:](self->_nodes, "enumerateObjectsWithOptions:usingBlock:", a3, a4);
}

- (void)removeNodesAtIndexes:(id)a3
{
  NSMutableArray *nodes;
  id v5;
  id v6;

  if (a3)
  {
    nodes = self->_nodes;
    v5 = a3;
    -[NSMutableArray objectsAtIndexes:](nodes, "objectsAtIndexes:", v5);
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObjectsAtIndexes:](self->_nodes, "removeObjectsAtIndexes:", v5);

    -[SBIconIndexMutableList didRemoveNodes:](self, "didRemoveNodes:", v6);
  }
}

- (void)didRemoveNodes:(id)a3
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
        -[SBIconIndexMutableList didRemoveNode:](self, "didRemoveNode:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)enumerateNodesUsingBlock:(id)a3
{
  -[NSMutableArray enumerateObjectsUsingBlock:](self->_nodes, "enumerateObjectsUsingBlock:", a3);
}

- (SBIconIndexMutableList)init
{
  SBIconIndexMutableList *v2;
  NSMutableArray *v3;
  NSMutableArray *nodes;
  uint64_t v5;
  NSMapTable *index;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBIconIndexMutableList;
  v2 = -[SBIconIndexMutableList init](&v8, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
    nodes = v2->_nodes;
    v2->_nodes = v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    index = v2->_index;
    v2->_index = (NSMapTable *)v5;

  }
  return v2;
}

- (SBIconIndexMutableList)initWithList:(id)a3 copyNodes:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  SBIconIndexMutableList *v7;
  uint64_t v8;
  NSMutableArray *nodes;
  uint64_t v10;
  NSMapTable *index;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  uint64_t v19;
  NSMapTable *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t j;
  uint64_t v26;
  void *v27;
  void *v28;
  id v30;
  uint64_t v31;
  uint64_t v32;
  NSMutableArray *obj;
  uint64_t v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  objc_super v47;
  _BYTE v48[128];
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v4 = a4;
  v51 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v47.receiver = self;
  v47.super_class = (Class)SBIconIndexMutableList;
  v7 = -[SBIconIndexMutableList init](&v47, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithArray:copyItems:", *((_QWORD *)v6 + 1), v4);
    nodes = v7->_nodes;
    v7->_nodes = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v10 = objc_claimAutoreleasedReturnValue();
    index = v7->_index;
    v7->_index = (NSMapTable *)v10;

    if (v4)
    {
      v45 = 0uLL;
      v46 = 0uLL;
      v43 = 0uLL;
      v44 = 0uLL;
      obj = v7->_nodes;
      v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      if (v32)
      {
        v30 = v6;
        v31 = *(_QWORD *)v44;
        do
        {
          v12 = 0;
          do
          {
            if (*(_QWORD *)v44 != v31)
              objc_enumerationMutation(obj);
            v34 = v12;
            v13 = *(void **)(*((_QWORD *)&v43 + 1) + 8 * v12);
            objc_msgSend(v13, "containedNodeIdentifiers");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v39 = 0u;
            v40 = 0u;
            v41 = 0u;
            v42 = 0u;
            v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
            if (v15)
            {
              v16 = v15;
              v17 = *(_QWORD *)v40;
              do
              {
                for (i = 0; i != v16; ++i)
                {
                  if (*(_QWORD *)v40 != v17)
                    objc_enumerationMutation(v14);
                  v19 = *(_QWORD *)(*((_QWORD *)&v39 + 1) + 8 * i);
                  v20 = v7->_index;
                  objc_msgSend(MEMORY[0x1E0CB3550], "setWithObject:", v13);
                  v21 = (void *)objc_claimAutoreleasedReturnValue();
                  -[NSMapTable setObject:forKey:](v20, "setObject:forKey:", v21, v19);

                }
                v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v39, v49, 16);
              }
              while (v16);
            }

            v12 = v34 + 1;
          }
          while (v34 + 1 != v32);
          v32 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        }
        while (v32);
        v6 = v30;
      }
    }
    else
    {
      v37 = 0uLL;
      v38 = 0uLL;
      v35 = 0uLL;
      v36 = 0uLL;
      obj = (NSMutableArray *)*((id *)v6 + 2);
      v22 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
      if (v22)
      {
        v23 = v22;
        v24 = *(_QWORD *)v36;
        do
        {
          for (j = 0; j != v23; ++j)
          {
            if (*(_QWORD *)v36 != v24)
              objc_enumerationMutation(obj);
            v26 = *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * j);
            objc_msgSend(*((id *)v6 + 2), "objectForKey:", v26);
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            v28 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithSet:", v27);
            -[NSMapTable setObject:forKey:](v7->_index, "setObject:forKey:", v28, v26);

          }
          v23 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v35, v48, 16);
        }
        while (v23);
      }
    }

  }
  return v7;
}

- (void)dealloc
{
  NSMutableArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_nodes;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * v7++), "removeNodeObserver:", self);
      }
      while (v5 != v7);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)SBIconIndexMutableList;
  -[SBIconIndexMutableList dealloc](&v8, sel_dealloc);
}

- (BOOL)directlyContainsNode:(id)a3
{
  return -[NSMutableArray containsObject:](self->_nodes, "containsObject:", a3);
}

- (BOOL)directlyContainsNodeIdentifier:(id)a3
{
  id v4;
  NSMutableArray *nodes;
  id v6;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  nodes = self->_nodes;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __57__SBIconIndexMutableList_directlyContainsNodeIdentifier___block_invoke;
  v8[3] = &unk_1E8D87458;
  v9 = v4;
  v6 = v4;
  LOBYTE(nodes) = -[NSMutableArray bs_containsObjectPassingTest:](nodes, "bs_containsObjectPassingTest:", v8);

  return (char)nodes;
}

uint64_t __57__SBIconIndexMutableList_directlyContainsNodeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "nodeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (BOOL)directlyContainsNodeIdentifier:(id)a3 passingTest:(id)a4
{
  id v6;
  id v7;
  NSMutableArray *nodes;
  id v9;
  id v10;
  _QWORD v12[4];
  id v13;
  id v14;

  v6 = a3;
  v7 = a4;
  nodes = self->_nodes;
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __69__SBIconIndexMutableList_directlyContainsNodeIdentifier_passingTest___block_invoke;
  v12[3] = &unk_1E8D87480;
  v13 = v6;
  v14 = v7;
  v9 = v7;
  v10 = v6;
  LOBYTE(nodes) = -[NSMutableArray bs_containsObjectPassingTest:](nodes, "bs_containsObjectPassingTest:", v12);

  return (char)nodes;
}

uint64_t __69__SBIconIndexMutableList_directlyContainsNodeIdentifier_passingTest___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  v4 = *(void **)(a1 + 32);
  objc_msgSend(v3, "nodeIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isEqual:", v5))
    v6 = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  else
    v6 = 0;

  return v6;
}

- (id)directlyContainedNodeIdentifier:(id)a3
{
  id v4;
  NSMutableArray *nodes;
  id v6;
  uint64_t v7;
  void *v8;
  _QWORD v10[4];
  id v11;

  v4 = a3;
  nodes = self->_nodes;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __58__SBIconIndexMutableList_directlyContainedNodeIdentifier___block_invoke;
  v10[3] = &unk_1E8D874A8;
  v6 = v4;
  v11 = v6;
  v7 = -[NSMutableArray indexOfObjectPassingTest:](nodes, "indexOfObjectPassingTest:", v10);
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = 0;
  }
  else
  {
    -[NSMutableArray objectAtIndex:](self->_nodes, "objectAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

uint64_t __58__SBIconIndexMutableList_directlyContainedNodeIdentifier___block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;
  uint64_t v4;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(a2, "nodeIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "isEqual:", v3);

  return v4;
}

- (id)containedNodeIdentifiers
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[NSMapTable keyEnumerator](self->_index, "keyEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "addObject:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)nodesAlongIndexPath:(id)a3 consumedIndexes:(unint64_t)a4
{
  id v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v6 = a3;
  if (objc_msgSend(v6, "length") <= a4
    || (v7 = objc_msgSend(v6, "indexAtPosition:", a4), v7 >= -[SBIconIndexMutableList count](self, "count")))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", a4 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SBIconIndexMutableList nodeAtIndex:](self, "nodeAtIndex:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "nodesAlongIndexPath:consumedIndexes:", v6, a4 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (unint64_t)indexOfNodePassingTest:(id)a3
{
  return -[NSMutableArray indexOfObjectPassingTest:](self->_nodes, "indexOfObjectPassingTest:", a3);
}

- (unint64_t)indexOfNodeAtIndexes:(id)a3 options:(unint64_t)a4 passingTest:(id)a5
{
  return -[NSMutableArray indexOfObjectAtIndexes:options:passingTest:](self->_nodes, "indexOfObjectAtIndexes:options:passingTest:", a3, a4, a5);
}

- (id)indexesOfNodesPassingTest:(id)a3
{
  return (id)-[NSMutableArray indexesOfObjectsPassingTest:](self->_nodes, "indexesOfObjectsPassingTest:", a3);
}

- (BOOL)containsNode:(id)a3
{
  void *v4;

  objc_msgSend(a3, "nodeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(self) = -[SBIconIndexMutableList containsNodeIdentifier:](self, "containsNodeIdentifier:", v4);

  return (char)self;
}

- (SBIconIndexNode)firstNode
{
  return (SBIconIndexNode *)-[NSMutableArray firstObject](self->_nodes, "firstObject");
}

- (SBIconIndexNode)lastNode
{
  return (SBIconIndexNode *)-[NSMutableArray lastObject](self->_nodes, "lastObject");
}

- (id)nodesInRange:(_NSRange)a3
{
  return (id)-[NSMutableArray subarrayWithRange:](self->_nodes, "subarrayWithRange:", a3.location, a3.length);
}

- (void)insertNode:(id)a3 atIndex:(unint64_t)a4
{
  NSMutableArray *nodes;
  id v7;

  nodes = self->_nodes;
  v7 = a3;
  -[NSMutableArray insertObject:atIndex:](nodes, "insertObject:atIndex:", v7, a4);
  -[SBIconIndexMutableList didAddNode:](self, "didAddNode:", v7);

}

- (void)insertNodes:(id)a3 atIndexes:(id)a4
{
  NSMutableArray *nodes;
  id v7;

  nodes = self->_nodes;
  v7 = a3;
  -[NSMutableArray insertObjects:atIndexes:](nodes, "insertObjects:atIndexes:", v7, a4);
  -[SBIconIndexMutableList didAddNodes:](self, "didAddNodes:", v7);

}

- (void)addNode:(id)a3
{
  id v4;

  v4 = a3;
  -[SBIconIndexMutableList insertNode:atIndex:](self, "insertNode:atIndex:", v4, -[SBIconIndexMutableList count](self, "count"));

}

- (void)replaceNodeAtIndex:(unint64_t)a3 withNode:(id)a4
{
  id v6;
  id v7;

  v6 = a4;
  -[SBIconIndexMutableList nodeAtIndex:](self, "nodeAtIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray replaceObjectAtIndex:withObject:](self->_nodes, "replaceObjectAtIndex:withObject:", a3, v6);
  -[SBIconIndexMutableList didAddNode:](self, "didAddNode:", v6);

  -[SBIconIndexMutableList didRemoveNode:](self, "didRemoveNode:", v7);
}

- (void)removeNode:(id)a3
{
  NSMutableArray *nodes;
  id v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v8 = a3;
  if (-[NSMutableArray containsObject:](self->_nodes, "containsObject:"))
  {
    nodes = self->_nodes;
    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = __37__SBIconIndexMutableList_removeNode___block_invoke;
    v9[3] = &unk_1E8D874A8;
    v5 = v8;
    v10 = v5;
    -[NSMutableArray indexesOfObjectsPassingTest:](nodes, "indexesOfObjectsPassingTest:", v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectsAtIndexes:](self->_nodes, "objectsAtIndexes:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](self->_nodes, "removeObject:", v5);
    -[SBIconIndexMutableList didRemoveNodes:](self, "didRemoveNodes:", v7);

  }
}

uint64_t __37__SBIconIndexMutableList_removeNode___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isEqual:", *(_QWORD *)(a1 + 32));
}

- (void)removeNodeIdenticalTo:(id)a3
{
  id v4;

  v4 = a3;
  if (-[NSMutableArray containsObject:](self->_nodes, "containsObject:"))
  {
    -[NSMutableArray removeObjectIdenticalTo:](self->_nodes, "removeObjectIdenticalTo:", v4);
    -[SBIconIndexMutableList didRemoveNode:](self, "didRemoveNode:", v4);
  }

}

- (void)removeNodeAtIndex:(unint64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x1E0CB36B8], "indexSetWithIndex:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconIndexMutableList removeNodesAtIndexes:](self, "removeNodesAtIndexes:", v4);

}

- (void)removeNodesInRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  id v6;

  length = a3.length;
  location = a3.location;
  -[NSMutableArray subarrayWithRange:](self->_nodes, "subarrayWithRange:");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeObjectsInRange:](self->_nodes, "removeObjectsInRange:", location, length);
  -[SBIconIndexMutableList didRemoveNodes:](self, "didRemoveNodes:", v6);

}

- (void)removeNodesInArray:(id)a3
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
        -[SBIconIndexMutableList removeNode:](self, "removeNode:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeLastNode
{
  id v3;

  -[NSMutableArray lastObject](self->_nodes, "lastObject");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray removeLastObject](self->_nodes, "removeLastObject");
  -[SBIconIndexMutableList didRemoveNode:](self, "didRemoveNode:", v3);

}

- (void)removeAllNodes
{
  -[SBIconIndexMutableList removeNodesInRange:](self, "removeNodesInRange:", 0, -[NSMutableArray count](self->_nodes, "count"));
}

- (void)setNodes:(id)a3
{
  id v4;
  NSMutableArray *v5;
  NSMutableArray *v6;
  NSMutableArray *nodes;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = self->_nodes;
  v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  nodes = self->_nodes;
  self->_nodes = v6;

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = v4;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (-[NSMutableArray containsObject:](v5, "containsObject:", v13, (_QWORD)v14))
          -[NSMutableArray removeObject:](v5, "removeObject:", v13);
        else
          -[SBIconIndexMutableList didAddNode:](self, "didAddNode:", v13);
        -[NSMutableArray addObject:](self->_nodes, "addObject:", v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  -[SBIconIndexMutableList didRemoveNodes:](self, "didRemoveNodes:", v5);
}

- (void)moveNode:(id)a3 toIndex:(unint64_t)a4
{
  void *v6;
  id v7;
  void *v8;
  id v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  v9 = a3;
  v6 = (void *)MEMORY[0x1E0C99D20];
  v7 = a3;
  objc_msgSend(v6, "arrayWithObjects:count:", &v9, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[SBIconIndexMutableList moveNodes:toContiguousIndicesStartingAt:](self, "moveNodes:toContiguousIndicesStartingAt:", v8, a4, v9, v10);
}

- (void)moveNodes:(id)a3 toContiguousIndicesStartingAt:(unint64_t)a4
{
  id v6;
  uint64_t v7;
  uint64_t v8;
  char v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  id v20;
  uint64_t v21;
  uint64_t v22;
  unint64_t v23;
  uint64_t v24;
  unint64_t v25;
  uint64_t k;
  uint64_t v27;
  NSMutableArray *nodes;
  id WeakRetained;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  _BYTE v43[128];
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v39;
    v11 = a4;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v39 != v10)
          objc_enumerationMutation(v6);
        v9 |= v11 + i != -[SBIconIndexMutableList indexOfNode:](self, "indexOfNode:", *(_QWORD *)(*((_QWORD *)&v38 + 1) + 8 * i));
      }
      v11 += v8;
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v38, v44, 16);
    }
    while (v8);
    if ((v9 & 1) != 0)
    {
      v13 = -[NSMutableArray count](self->_nodes, "count");
      v14 = objc_msgSend(v6, "count");
      v34 = 0u;
      v35 = 0u;
      v36 = 0u;
      v37 = 0u;
      v15 = v6;
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
      if (v16)
      {
        v17 = v16;
        v18 = *(_QWORD *)v35;
        do
        {
          for (j = 0; j != v17; ++j)
          {
            if (*(_QWORD *)v35 != v18)
              objc_enumerationMutation(v15);
            -[NSMutableArray removeObject:](self->_nodes, "removeObject:", *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * j));
          }
          v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v34, v43, 16);
        }
        while (v17);
      }

      v32 = 0u;
      v33 = 0u;
      v30 = 0u;
      v31 = 0u;
      v20 = v15;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
      if (v21)
      {
        v22 = v21;
        v23 = v13 - v14;
        v24 = *(_QWORD *)v31;
        v25 = a4;
        do
        {
          for (k = 0; k != v22; ++k)
          {
            if (*(_QWORD *)v31 != v24)
              objc_enumerationMutation(v20);
            v27 = *(_QWORD *)(*((_QWORD *)&v30 + 1) + 8 * k);
            nodes = self->_nodes;
            if (v23 <= a4)
              -[NSMutableArray addObject:](nodes, "addObject:", v27, (_QWORD)v30);
            else
              -[NSMutableArray insertObject:atIndex:](nodes, "insertObject:atIndex:", v27, v25++);
          }
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v30, v42, 16);
        }
        while (v22);
      }

      WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
      objc_msgSend(WeakRetained, "listDidMoveNodes:", self);

    }
  }

}

- (void)sortUsingSelector:(SEL)a3
{
  -[NSMutableArray sortUsingSelector:](self->_nodes, "sortUsingSelector:", a3);
}

- (void)sortUsingComparator:(id)a3
{
  -[NSMutableArray sortUsingComparator:](self->_nodes, "sortUsingComparator:", a3);
}

- (void)didAddNode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "addNodeObserver:", self);
  objc_msgSend(v4, "containedNodeIdentifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconIndexMutableList node:didAddContainedNodeIdentifiers:](self, "node:didAddContainedNodeIdentifiers:", v4, v5);

}

- (void)didAddNodes:(id)a3
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
        -[SBIconIndexMutableList didAddNode:](self, "didAddNode:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)didRemoveNode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  objc_msgSend(v4, "removeNodeObserver:", self);
  objc_msgSend(v4, "containedNodeIdentifiers");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBIconIndexMutableList node:didRemoveContainedNodeIdentifiers:](self, "node:didRemoveContainedNodeIdentifiers:", v4, v5);

}

- (void)node:(id)a3 didAddContainedNodeIdentifiers:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  NSMapTable *index;
  void *v19;
  id WeakRetained;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  if (WeakRetained)
    v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v7, "count"));
  else
    v8 = 0;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = v7;
  v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v23 != v11)
          objc_enumerationMutation(obj);
        v13 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_index, "objectForKey:", v13, WeakRetained);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = v14;
        if (v14)
        {
          if ((objc_msgSend(v14, "containsObject:", v6) & 1) == 0)
            objc_msgSend(v8, "addObject:", v13);
          v16 = v15;
          v17 = v6;
        }
        else
        {
          index = self->_index;
          objc_msgSend(MEMORY[0x1E0CB3550], "setWithObject:", v6);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSMapTable setObject:forKey:](index, "setObject:forKey:", v19, v13);

          v16 = v8;
          v17 = v13;
        }
        objc_msgSend(v16, "addObject:", v17);

      }
      v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    }
    while (v10);
  }

  objc_msgSend(WeakRetained, "list:didAddContainedNodeIdentifiers:", self, v8);
}

- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  id v6;
  id v7;
  id WeakRetained;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  uint64_t v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  if (WeakRetained)
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3550]), "initWithCapacity:", objc_msgSend(v7, "count"));
  else
    v9 = 0;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v10 = v7;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v18 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMapTable objectForKey:](self->_index, "objectForKey:", v15, (_QWORD)v17);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "removeObject:", v6);
        if (!objc_msgSend(v16, "count"))
        {
          -[NSMapTable removeObjectForKey:](self->_index, "removeObjectForKey:", v15);
          objc_msgSend(v9, "addObject:", v15);
        }

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v12);
  }

  objc_msgSend(WeakRetained, "list:didRemoveContainedNodeIdentifiers:", self, v9);
}

- (void)nodeDidMoveContainedNodes:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_observer);
  objc_msgSend(WeakRetained, "listDidMoveNodes:", self);

}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  uint64_t v14;
  void *v15;
  void *v16;
  id v17;
  NSMapTable *obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  if (v5)
  {
    v6 = -[NSMutableArray mutableCopyWithZone:](self->_nodes, "mutableCopyWithZone:", a3);
    v7 = *(void **)(v5 + 8);
    *(_QWORD *)(v5 + 8) = v6;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = v8;

    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    obj = self->_index;
    v10 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v21;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v21 != v12)
            objc_enumerationMutation(obj);
          v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * i);
          -[NSMapTable objectForKey:](self->_index, "objectForKey:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          v16 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x1E0CB3550], "allocWithZone:", a3), "initWithSet:", v15);
          objc_msgSend(*(id *)(v5 + 16), "setObject:forKey:", v16, v14);

        }
        v11 = -[NSMapTable countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v11);
    }

    v17 = (id)v5;
  }

  return (id)v5;
}

- (id)indexDescriptionWithPrefix:(id)a3
{
  unint64_t v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  void *v17;
  void *v18;
  void *v19;
  _QWORD *v20;
  _QWORD *v21;
  unint64_t v22;
  void *v23;
  void *v24;
  uint64_t v25;
  NSUInteger v26;
  unint64_t v27;
  unint64_t v28;
  _QWORD *v29;
  uint64_t v30;
  unint64_t v31;
  void *v32;
  unint64_t v33;
  unint64_t v34;
  void *v35;
  unint64_t v36;
  unint64_t v37;
  unint64_t v38;
  uint64_t k;
  void *v40;
  unint64_t v41;
  unint64_t v42;
  uint64_t v43;
  _QWORD *v44;
  unint64_t v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  uint64_t v49;
  void *v50;
  unint64_t m;
  void *v52;
  void *v53;
  __CFString *v54;
  void *v55;
  unint64_t v56;
  const __CFString *v57;
  uint64_t v58;
  void *v59;
  void *v60;
  unint64_t v61;
  uint64_t v62;
  void *v63;
  unint64_t n;
  unint64_t v65;
  void *v66;
  uint64_t ii;
  void *v68;
  __CFString *v70;
  unint64_t v71;
  uint64_t v72;
  unint64_t v73;
  unint64_t v74;
  __CFString *v75;
  _QWORD *v76;
  _QWORD *v77;
  void *v78;
  uint64_t v79;
  unint64_t v80;
  void *v81;
  uint64_t v82;
  id obj;
  unint64_t obja;
  id objb;
  NSUInteger v86;
  void *v87;
  uint64_t v88;
  unint64_t v89;
  void *v90;
  SBIconIndexMutableList *v91;
  uint64_t v92;
  void *v93;
  __int128 v94;
  __int128 v95;
  __int128 v96;
  __int128 v97;
  __int128 v98;
  __int128 v99;
  __int128 v100;
  __int128 v101;
  _BYTE v102[128];
  _BYTE v103[128];
  uint64_t v104;

  v104 = *MEMORY[0x1E0C80C00];
  v70 = (__CFString *)a3;
  v4 = 0x1E0C99000uLL;
  v86 = -[NSMapTable count](self->_index, "count");
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v98 = 0u;
  v99 = 0u;
  v100 = 0u;
  v101 = 0u;
  v91 = self;
  -[NSMapTable keyEnumerator](self->_index, "keyEnumerator");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
  v93 = v5;
  if (v6)
  {
    v7 = v6;
    v88 = *(_QWORD *)v99;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v99 != v88)
          objc_enumerationMutation(obj);
        v9 = *(void **)(*((_QWORD *)&v98 + 1) + 8 * i);
        -[NSMapTable objectForKey:](v91->_index, "objectForKey:", v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(v4 + 3560), "arrayWithCapacity:", objc_msgSend(v10, "count"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v94 = 0u;
        v95 = 0u;
        v96 = 0u;
        v97 = 0u;
        v12 = v10;
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v95;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v95 != v15)
                objc_enumerationMutation(v12);
              objc_msgSend(*(id *)(*((_QWORD *)&v94 + 1) + 8 * j), "nodeIdentifier");
              v17 = (void *)objc_claimAutoreleasedReturnValue();
              SBIconIndexDebugStringForNodeIdentifier(v17);
              v18 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "addObject:", v18);

            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v94, v102, 16);
          }
          while (v14);
        }

        objc_msgSend(v11, "sortUsingComparator:", &__block_literal_global_20);
        SBIconIndexDebugStringForNodeIdentifier(v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "insertObject:atIndex:", v19, 0);

        v5 = v93;
        objc_msgSend(v93, "addObject:", v11);

        v4 = 0x1E0C99000;
      }
      v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v98, v103, 16);
    }
    while (v7);
  }

  objc_msgSend(v5, "sortUsingComparator:", &__block_literal_global_11_1);
  v92 = objc_msgSend(CFSTR(" -> "), "length");
  v82 = objc_msgSend(CFSTR(", "), "length");
  v72 = objc_msgSend(CFSTR("  |  "), "length");
  v20 = 0;
  v21 = 0;
  v89 = 0;
  v22 = 0;
  v23 = 0;
  v24 = 0;
  v25 = 1;
  v26 = v86;
  do
  {
    v71 = v89;
    v76 = v20;
    v78 = v21;
    obja = v22;
    v27 = v22 + 1;
    v28 = v26 / (v22 + 1);
    if (v26 % (v22 + 1))
      ++v28;
    v74 = v28;
    if (v28 <= 1)
      v28 = 1;
    v89 = v28;
    if (v24)
      free(v24);
    v21 = malloc_type_malloc(8 * v27, 0x100004000313F17uLL);
    if (v23)
      free(v23);
    v29 = malloc_type_malloc(8 * v27, 0x100004000313F17uLL);
    v20 = v29;
    v80 = v27;
    if (v27)
    {
      v30 = 0;
      do
      {
        v29[v30] = 0;
        v21[v30++] = 0;
      }
      while (v25 != v30);
    }
    if (v26)
    {
      v31 = 0;
      do
      {
        objc_msgSend(v5, "objectAtIndex:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "count");
        v34 = v31 / v89;
        objc_msgSend(v32, "objectAtIndex:", 0);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "length");

        v37 = v21[v31 / v89];
        if (v37 <= v36)
          v37 = v36;
        v21[v34] = v37;
        v38 = v36 + v92;
        if (v33 >= 2)
        {
          for (k = 1; k != v33; ++k)
          {
            objc_msgSend(v32, "objectAtIndex:", k);
            v40 = (void *)objc_claimAutoreleasedReturnValue();
            v38 += objc_msgSend(v40, "length");

          }
        }
        v41 = v20[v34];
        if (v41 <= v38)
          v41 = v38;
        v20[v34] = v41;

        ++v31;
        v26 = v86;
        v5 = v93;
      }
      while (v31 != v86);
    }
    v42 = *v20 + obja * v72;
    v22 = v80;
    if (v80 >= 2)
    {
      v43 = 0;
      do
        v42 += v20[++v43];
      while (obja != v43);
    }
    if (v74 < 2)
      break;
    ++v25;
    v23 = v76;
    v24 = v78;
  }
  while (v42 < 0xC8);
  if (obja)
  {
    v20 = v76;
    v44 = v78;
  }
  else
  {
    v44 = v21;
  }
  if (obja)
    v45 = v71;
  else
    v45 = v89;
  if (obja)
    v46 = obja;
  else
    v46 = 1;
  objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v46);
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  if (obja <= 1)
    v48 = 1;
  else
    v48 = obja;
  v49 = v48;
  do
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", v45);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "addObject:", v50);

    --v49;
  }
  while (v49);
  if (v26)
  {
    for (m = 0; m != v26; ++m)
    {
      objc_msgSend(v47, "objectAtIndex:", m / v45);
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectAtIndex:", m);
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v52, "addObject:", v53);

    }
  }
  v54 = &stru_1E8D8E958;
  if (v70)
    v54 = v70;
  v75 = v54;

  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  if (v45)
  {
    v56 = 0;
    v73 = v45;
    v79 = v48;
    v81 = v47;
    v77 = v20;
    do
    {
      if (v56)
      {
        objc_msgSend(v55, "appendString:", CFSTR("\n"));
        v57 = CFSTR("       ");
      }
      else
      {
        v57 = CFSTR("Index: ");
      }
      objc_msgSend(v55, "appendString:", v75);
      objc_msgSend(v55, "appendString:", v57);
      v58 = 0;
      objb = (id)v56;
      do
      {
        objc_msgSend(v47, "objectAtIndex:", v58);
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        if (v56 < objc_msgSend(v59, "count"))
        {
          if (v58)
            objc_msgSend(v55, "appendString:", CFSTR("  |  "));
          v90 = v59;
          objc_msgSend(v59, "objectAtIndex:", v56);
          v60 = (void *)objc_claimAutoreleasedReturnValue();
          v61 = objc_msgSend(v60, "count");
          v62 = v44[v58];
          objc_msgSend(v60, "objectAtIndex:", 0);
          v63 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v55, "appendString:", v63);
          v87 = v63;
          for (n = objc_msgSend(v63, "length"); n < v44[v58]; ++n)
            objc_msgSend(v55, "appendString:", CFSTR(" "));
          v65 = v62 + v92 + (v61 - 2) * v82;
          objc_msgSend(v55, "appendString:", CFSTR(" -> "));
          if (v61 > 1)
          {
            objc_msgSend(v60, "objectAtIndex:", 1);
            v66 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v55, "appendString:", v66);
            v65 += objc_msgSend(v66, "length");

            if (v61 != 2)
            {
              for (ii = 2; ii != v61; ++ii)
              {
                objc_msgSend(v60, "objectAtIndex:", ii);
                v68 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v55, "appendString:", CFSTR(", "));
                objc_msgSend(v55, "appendString:", v68);
                v65 += objc_msgSend(v68, "length");

              }
            }
          }
          v20 = v77;
          while (v65 < v77[v58])
          {
            objc_msgSend(v55, "appendString:", CFSTR(" "));
            ++v65;
          }

          v48 = v79;
          v47 = v81;
          v56 = (unint64_t)objb;
          v59 = v90;
        }

        ++v58;
      }
      while (v58 != v48);
      ++v56;
    }
    while (v56 != v73);
  }
  if (v44)
    free(v44);
  if (v20)
    free(v20);

  return v55;
}

uint64_t __53__SBIconIndexMutableList_indexDescriptionWithPrefix___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "caseInsensitiveCompare:");
}

uint64_t __53__SBIconIndexMutableList_indexDescriptionWithPrefix___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectAtIndex:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "caseInsensitiveCompare:", v6);
  return v7;
}

- (void)assertIndexCoherent
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t j;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  SBIconIndexMutableList *v22;
  NSMutableArray *obj;
  uint64_t v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];
  _BYTE v34[128];
  uint64_t v35;

  v35 = *MEMORY[0x1E0C80C00];
  -[NSMapTable keyEnumerator](self->_index, "keyEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v22 = self;
  obj = self->_nodes;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
  if (v7)
  {
    v8 = v7;
    v24 = *(_QWORD *)v30;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v30 != v24)
          objc_enumerationMutation(obj);
        v10 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
        objc_msgSend(v10, "nodeIdentifier");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "removeObject:", v11);
        objc_msgSend(v6, "addObject:", v11);
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        objc_msgSend(v10, "containedNodeIdentifiers");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
        if (v13)
        {
          v14 = v13;
          v15 = *(_QWORD *)v26;
          do
          {
            for (j = 0; j != v14; ++j)
            {
              if (*(_QWORD *)v26 != v15)
                objc_enumerationMutation(v12);
              v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * j);
              objc_msgSend(v5, "removeObject:", v17);
              objc_msgSend(v6, "addObject:", v17);
            }
            v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v33, 16);
          }
          while (v14);
        }

      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    }
    while (v8);
  }

  -[NSMapTable keyEnumerator](v22->_index, "keyEnumerator");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "nextObject");
  v19 = objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    v20 = (void *)v19;
    do
    {
      objc_msgSend(v6, "removeObject:", v20);
      objc_msgSend(v18, "nextObject");
      v21 = objc_claimAutoreleasedReturnValue();

      v20 = (void *)v21;
    }
    while (v21);
  }

}

- (SBIconIndexMutableListObserver)observer
{
  return (SBIconIndexMutableListObserver *)objc_loadWeakRetained((id *)&self->_observer);
}

- (void)setObserver:(id)a3
{
  objc_storeWeak((id *)&self->_observer, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_observer);
  objc_storeStrong((id *)&self->_index, 0);
  objc_storeStrong((id *)&self->_nodes, 0);
}

@end
