@implementation UIGestureGraph

- (id)addUniqueEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 directed:(BOOL)a6 properties:(id)a7
{
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  id v18;
  int v19;
  uint64_t v20;
  UIGestureGraphEdge *v21;
  id v23;
  unsigned int v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v25 = a6;
  v31 = *MEMORY[0x1E0C80C00];
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[UIGestureGraph _edgesForLabel:](self, "_edgesForLabel:");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v27;
LABEL_3:
    v15 = 0;
    while (1)
    {
      if (*(_QWORD *)v27 != v14)
        objc_enumerationMutation(v11);
      v16 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v15);
      objc_msgSend(v16, "sourceNode");
      v17 = (id)objc_claimAutoreleasedReturnValue();
      if (v17 == a4)
      {
        objc_msgSend(v16, "targetNode");
        v18 = (id)objc_claimAutoreleasedReturnValue();
        if (v18 == a5)
        {
          v19 = objc_msgSend(v16, "hasProperties:", a7);

          if (v19)
          {
            if (objc_msgSend(v16, "isDirected") == v25)
              v23 = v16;
            else
              v23 = 0;

            return v23;
          }
          goto LABEL_10;
        }

        v17 = a4;
      }

LABEL_10:
      if (v13 == ++v15)
      {
        v20 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
        v13 = v20;
        if (v20)
          goto LABEL_3;
        break;
      }
    }
  }

  v21 = -[UIGestureGraphEdge initWithLabel:sourceNode:targetNode:directed:]([UIGestureGraphEdge alloc], "initWithLabel:sourceNode:targetNode:directed:", a3, a4, a5, v25);
  -[UIGestureGraphElement setProperties:](v21, "setProperties:", a7);
  -[UIGestureGraph _addEdge:](self, "_addEdge:", v21);
  return v21;
}

- (id)_edgesForLabel:(id)a3
{
  if (a3)
    -[NSMapTable objectForKey:](self->_edgesByLabel, "objectForKey:");
  else
    -[UIGestureGraph _allEdges](self, "_allEdges");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)addNodeWithLabel:(id)a3 properties:(id)a4
{
  UIGestureGraphNode *v6;

  v6 = -[UIGestureGraphElement initWithLabel:]([UIGestureGraphNode alloc], "initWithLabel:", a3);
  -[UIGestureGraphElement setProperties:](v6, "setProperties:", a4);
  -[UIGestureGraph _addNode:](self, "_addNode:", v6);
  return v6;
}

- (void)_addNode:(id)a3
{
  NSMapTable *nodesByLabel;
  void *v6;
  NSMapTable *v7;
  void *v8;
  id v9;

  nodesByLabel = self->_nodesByLabel;
  objc_msgSend(a3, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](nodesByLabel, "objectForKey:", v6);
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7 = self->_nodesByLabel;
    objc_msgSend(a3, "label");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v7, "setObject:forKey:", v9, v8);

  }
  objc_msgSend(v9, "addObject:", a3);

}

- (void)removeEdges:(id)a3
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = a3;
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
        -[UIGestureGraph removeEdge:](self, "removeEdge:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)removeEdge:(id)a3
{
  NSMapTable *edgesByLabel;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  edgesByLabel = self->_edgesByLabel;
  objc_msgSend(a3, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](edgesByLabel, "objectForKey:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
    objc_msgSend(v8, "removeObject:", a3);
  objc_msgSend(a3, "sourceNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_removeEdge:", a3);

  if ((objc_msgSend(a3, "isLoop") & 1) == 0)
  {
    objc_msgSend(a3, "targetNode");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "_removeEdge:", a3);

  }
}

- (void)_addEdge:(id)a3
{
  void *v5;
  void *v6;
  NSMapTable *edgesByLabel;
  void *v8;
  void *v9;
  NSMapTable *v10;
  void *v11;
  unint64_t v12;
  unint64_t v13;
  NSObject *v14;
  NSObject *v15;
  int v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a3, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_addEdge:", a3);

  if ((objc_msgSend(a3, "isLoop") & 1) == 0)
  {
    objc_msgSend(a3, "targetNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_addEdge:", a3);

  }
  edgesByLabel = self->_edgesByLabel;
  objc_msgSend(a3, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](edgesByLabel, "objectForKey:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = self->_edgesByLabel;
    objc_msgSend(a3, "label");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMapTable setObject:forKey:](v10, "setObject:forKey:", v9, v11);

  }
  objc_msgSend(v9, "addObject:", a3);
  v12 = objc_msgSend(v9, "count");
  if (v12 >= UIGestureGraphEdgeLimit)
  {
    v13 = _addEdge____s_category[0];
    if (!_addEdge____s_category[0])
    {
      v13 = __UILogCategoryGetNode("Gesture", (uint64_t)&g_UILogCategories, (uint64_t (*)(_BYTE *))__UILogCategoryNewNode)- 16;
      atomic_store(v13, _addEdge____s_category);
    }
    v14 = *(NSObject **)(v13 + 8);
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      v15 = v14;
      v16 = 134217984;
      v17 = objc_msgSend(v9, "count");
      _os_log_impl(&dword_185066000, v15, OS_LOG_TYPE_ERROR, "Abnormal number of gesture recognizer dependencies: %lu. System performance may be affected. Please investigate reducing gesture recognizers and/or their dependencies.", (uint8_t *)&v16, 0xCu);

    }
    UIGestureGraphEdgeLimit += 50;
  }

}

- (void)traverseGraphDepthFirstFromNode:(id)a3 directed:(BOOL)a4 usingBlock:(id)a5
{
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  int v11;
  int v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t j;
  void *v24;
  void *v25;
  int v26;
  void *v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t k;
  void *v33;
  id v34;
  void *v36;
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
  __int128 v47;
  __int128 v48;
  char v49;
  _BYTE v50[128];
  _BYTE v51[128];
  _BYTE v52[128];
  uint64_t v53;

  v53 = *MEMORY[0x1E0C80C00];
  v7 = (void *)objc_opt_new();
  v8 = (void *)objc_opt_new();
  v49 = 0;
  objc_msgSend(v7, "addObject:", a3);
  if (objc_msgSend(v7, "count"))
  {
    v34 = a5;
    v36 = v8;
    while (1)
    {
      objc_msgSend(v7, "lastObject");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v7, "count");
      if ((objc_msgSend(v8, "containsObject:", v9) & 1) != 0)
        goto LABEL_4;
      v11 = (*((uint64_t (**)(id, void *, char *))a5 + 2))(a5, v9, &v49);
      if (v49)
      {

        goto LABEL_36;
      }
      v12 = v11;
      objc_msgSend(v8, "addObject:", v9);
      if (v12)
        break;
LABEL_33:

      if (!objc_msgSend(v7, "count"))
        goto LABEL_36;
    }
    v47 = 0u;
    v48 = 0u;
    v45 = 0u;
    v46 = 0u;
    objc_msgSend(v9, "outEdges");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v46;
      do
      {
        for (i = 0; i != v15; ++i)
        {
          if (*(_QWORD *)v46 != v16)
            objc_enumerationMutation(v13);
          objc_msgSend(*(id *)(*((_QWORD *)&v45 + 1) + 8 * i), "targetNode");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v18);

        }
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v45, v52, 16);
      }
      while (v15);
    }

    v43 = 0u;
    v44 = 0u;
    v41 = 0u;
    v42 = 0u;
    objc_msgSend(v9, "inOutEdges");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v42;
      do
      {
        for (j = 0; j != v21; ++j)
        {
          if (*(_QWORD *)v42 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * j);
          objc_msgSend(v24, "targetNode");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          v26 = objc_msgSend(v9, "isEqual:", v25);

          if (v26)
            objc_msgSend(v24, "sourceNode");
          else
            objc_msgSend(v24, "targetNode");
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObject:", v27);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v41, v51, 16);
      }
      while (v21);
    }

    a5 = v34;
    v8 = v36;
    if (!a4)
    {
      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      objc_msgSend(v9, "inEdges");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v38;
        do
        {
          for (k = 0; k != v30; ++k)
          {
            if (*(_QWORD *)v38 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * k), "sourceNode");
            v33 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v7, "addObject:", v33);

          }
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v50, 16);
        }
        while (v30);
      }

      v8 = v36;
    }
LABEL_4:
    objc_msgSend(v7, "removeObjectAtIndex:", v10 - 1);
    goto LABEL_33;
  }
LABEL_36:

}

- (void)removeNode:(id)a3
{
  NSMapTable *nodesByLabel;
  void *v6;
  void *v7;
  id v8;

  -[UIGestureGraph removeNodeEdges:](self, "removeNodeEdges:");
  nodesByLabel = self->_nodesByLabel;
  objc_msgSend(a3, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](nodesByLabel, "objectForKey:", v6);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = v8;
  if (v8)
  {
    objc_msgSend(v8, "removeObject:", a3);
    v7 = v8;
  }

}

- (void)removeNodeEdges:(id)a3
{
  void *v4;
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  objc_msgSend(a3, "allEdges", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
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
        -[UIGestureGraph removeEdge:](self, "removeEdge:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (UIGestureGraph)init
{
  UIGestureGraph *v2;
  uint64_t v3;
  NSMapTable *nodesByLabel;
  uint64_t v5;
  NSMapTable *edgesByLabel;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)UIGestureGraph;
  v2 = -[UIGestureGraph init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v3 = objc_claimAutoreleasedReturnValue();
    nodesByLabel = v2->_nodesByLabel;
    v2->_nodesByLabel = (NSMapTable *)v3;

    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    edgesByLabel = v2->_edgesByLabel;
    v2->_edgesByLabel = (NSMapTable *)v5;

  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  objc_class *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[UIGestureGraph nodeLabels](self, "nodeLabels");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v29;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v29 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(v3, "appendFormat:", CFSTR("[%@](%ld), "), *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v8), -[UIGestureGraph nodeCountForLabel:](self, "nodeCountForLabel:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * v8)));
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v6);
  }

  -[UIGestureGraph nodeLabels](self, "nodeLabels");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "count");

  if (v10)
    objc_msgSend(v3, "deleteCharactersInRange:", objc_msgSend(v3, "length") - 2, 2);
  v11 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[UIGestureGraph edgeLabels](self, "edgeLabels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v13)
  {
    v14 = v13;
    v15 = *(_QWORD *)v25;
    do
    {
      v16 = 0;
      do
      {
        if (*(_QWORD *)v25 != v15)
          objc_enumerationMutation(v12);
        objc_msgSend(v11, "appendFormat:", CFSTR("[%@](%ld), "), *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16), -[UIGestureGraph edgeCountForLabel:](self, "edgeCountForLabel:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * v16)));
        ++v16;
      }
      while (v14 != v16);
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v14);
  }

  -[UIGestureGraph edgeLabels](self, "edgeLabels");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "count");

  if (v18)
    objc_msgSend(v11, "deleteCharactersInRange:", objc_msgSend(v11, "length") - 2, 2);
  v19 = (void *)MEMORY[0x1E0CB3940];
  v20 = (objc_class *)objc_opt_class();
  NSStringFromClass(v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringWithFormat:", CFSTR("[%@] nodeCount:[%ld] edgesCount:[%ld]\n\tnodesLabels:[%@]\n\tedgesLabels:[%@]"), v21, -[UIGestureGraph nodeCount](self, "nodeCount"), -[UIGestureGraph edgeCount](self, "edgeCount"), v3, v11);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (id)addNodeWithLabel:(id)a3
{
  UIGestureGraphNode *v4;

  v4 = -[UIGestureGraphElement initWithLabel:]([UIGestureGraphNode alloc], "initWithLabel:", a3);
  -[UIGestureGraph _addNode:](self, "_addNode:", v4);
  return v4;
}

- (void)removeNodes:(id)a3
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
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = a3;
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
        -[UIGestureGraph removeNode:](self, "removeNode:", *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * v8++), (_QWORD)v9);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (unint64_t)nodeCountForLabel:(id)a3
{
  void *v3;
  unint64_t v4;

  -[UIGestureGraph _nodesForLabel:](self, "_nodesForLabel:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (id)nodesForLabel:(id)a3 properties:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UIGestureGraph _nodesForLabel:](self, "_nodesForLabel:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasProperties:", a4, (_QWORD)v15))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)addUniqueNodeWithLabel:(id)a3 properties:(id)a4
{
  void *v7;
  UIGestureGraphNode *v8;

  -[UIGestureGraph nodesForLabel:properties:](self, "nodesForLabel:properties:");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count") == 1)
  {
    objc_msgSend(v7, "anyObject");
    v8 = (UIGestureGraphNode *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "count"))
  {
    v8 = 0;
  }
  else
  {
    v8 = -[UIGestureGraphElement initWithLabel:]([UIGestureGraphNode alloc], "initWithLabel:", a3);
    -[UIGestureGraphElement setProperties:](v8, "setProperties:", a4);
    -[UIGestureGraph _addNode:](self, "_addNode:", v8);
  }

  return v8;
}

- (unint64_t)nodeCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  -[NSMapTable objectEnumerator](self->_nodesByLabel, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (NSSet)nodeLabels
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  NSAllMapTableKeys(self->_nodesByLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)enumerateNodesWithLabel:(id)a3 usingBlock:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[UIGestureGraph _nodesForLabel:](self, "_nodesForLabel:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v8);
      (*((void (**)(id, _QWORD, char *))a4 + 2))(a4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12), &v17);
      if (v17)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateNodesWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  NSAllMapTableValues(self->_nodesByLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              (*((void (**)(id, _QWORD, char *))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), &v23);
              if (v23)
              {

                goto LABEL_18;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }
LABEL_18:

}

- (id)_allNodes
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
  NSAllMapTableValues(self->_nodesByLabel);
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
        objc_msgSend(v3, "unionSet:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)_nodesForLabel:(id)a3
{
  if (a3)
    -[NSMapTable objectForKey:](self->_nodesByLabel, "objectForKey:");
  else
    -[UIGestureGraph _allNodes](self, "_allNodes");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)addEdgeWithLabel:(id)a3 sourceNode:(id)a4 targetNode:(id)a5 directed:(BOOL)a6
{
  UIGestureGraphEdge *v7;

  v7 = -[UIGestureGraphEdge initWithLabel:sourceNode:targetNode:directed:]([UIGestureGraphEdge alloc], "initWithLabel:sourceNode:targetNode:directed:", a3, a4, a5, a6);
  -[UIGestureGraph _addEdge:](self, "_addEdge:", v7);
  return v7;
}

- (id)edgesForLabel:(id)a3
{
  void *v3;
  void *v4;

  -[UIGestureGraph _edgesForLabel:](self, "_edgesForLabel:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)edgesForLabel:(id)a3 properties:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[UIGestureGraph _edgesForLabel:](self, "_edgesForLabel:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v16 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        if (objc_msgSend(v12, "hasProperties:", a4, (_QWORD)v15))
          objc_msgSend(v6, "addObject:", v12);
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v9);
  }

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v6);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (unint64_t)edgeCount
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  unint64_t v5;
  uint64_t v6;
  uint64_t i;
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
  -[NSMapTable objectEnumerator](self->_edgesByLabel, "objectEnumerator", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v3)
  {
    v4 = v3;
    v5 = 0;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        v5 += objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * i), "count");
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)edgeCountForLabel:(id)a3
{
  void *v3;
  unint64_t v4;

  -[UIGestureGraph _edgesForLabel:](self, "_edgesForLabel:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (NSSet)edgeLabels
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  NSAllMapTableKeys(self->_edgesByLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setWithArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSSet *)v4;
}

- (void)enumerateEdgesWithLabel:(id)a3 usingBlock:(id)a4
{
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v5 = (void *)MEMORY[0x1E0C99E60];
  -[UIGestureGraph _edgesForLabel:](self, "_edgesForLabel:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setWithSet:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v8 = v7;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v8);
      (*((void (**)(id, _QWORD, char *))a4 + 2))(a4, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12), &v17);
      if (v17)
        break;
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (void)enumerateEdgesWithBlock:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v23 = 0;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  NSAllMapTableValues(self->_edgesByLabel);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v20 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = 0u;
        v16 = 0u;
        v17 = 0u;
        v18 = 0u;
        v10 = v9;
        v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
        if (v11)
        {
          v12 = v11;
          v13 = *(_QWORD *)v16;
          while (2)
          {
            for (j = 0; j != v12; ++j)
            {
              if (*(_QWORD *)v16 != v13)
                objc_enumerationMutation(v10);
              (*((void (**)(id, _QWORD, char *))a3 + 2))(a3, *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * j), &v23);
              if (v23)
              {

                goto LABEL_18;
              }
            }
            v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v24, 16);
            if (v12)
              continue;
            break;
          }
        }

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v19, v25, 16);
    }
    while (v6);
  }
LABEL_18:

}

- (id)_allEdges
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
  NSAllMapTableValues(self->_edgesByLabel);
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
        objc_msgSend(v3, "unionSet:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++), (_QWORD)v10);
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)removeAllObjects
{
  -[NSMapTable removeAllObjects](self->_nodesByLabel, "removeAllObjects");
  -[NSMapTable removeAllObjects](self->_edgesByLabel, "removeAllObjects");
}

- (void)traverseGraphBreadthFirstFromNode:(id)a3 directed:(BOOL)a4 usingBlock:(id)a5
{
  void *v6;
  void *v7;
  void *v8;
  int v9;
  int v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t k;
  void *v31;
  __int128 v34;
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
  char v46;
  _BYTE v47[128];
  _BYTE v48[128];
  _BYTE v49[128];
  uint64_t v50;

  v50 = *MEMORY[0x1E0C80C00];
  v6 = (void *)objc_opt_new();
  v7 = (void *)objc_opt_new();
  v46 = 0;
  objc_msgSend(v6, "addObject:", a3);
  while (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v8) & 1) != 0)
      goto LABEL_4;
    v9 = (*((uint64_t (**)(id, void *, char *))a5 + 2))(a5, v8, &v46);
    if (v46)
    {

      break;
    }
    v10 = v9;
    objc_msgSend(v7, "addObject:", v8);
    if (v10)
    {
      v44 = 0u;
      v45 = 0u;
      v42 = 0u;
      v43 = 0u;
      objc_msgSend(v8, "outEdges");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v43;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v43 != v14)
              objc_enumerationMutation(v11);
            objc_msgSend(*(id *)(*((_QWORD *)&v42 + 1) + 8 * i), "targetNode");
            v16 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v16);

          }
          v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v42, v49, 16);
        }
        while (v13);
      }

      v40 = 0u;
      v41 = 0u;
      v38 = 0u;
      v39 = 0u;
      objc_msgSend(v8, "inOutEdges");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v39;
        do
        {
          for (j = 0; j != v19; ++j)
          {
            if (*(_QWORD *)v39 != v20)
              objc_enumerationMutation(v17);
            v22 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * j);
            objc_msgSend(v22, "targetNode");
            v23 = (void *)objc_claimAutoreleasedReturnValue();
            v24 = objc_msgSend(v8, "isEqual:", v23);

            if (v24)
              objc_msgSend(v22, "sourceNode");
            else
              objc_msgSend(v22, "targetNode");
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v25);

          }
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v38, v48, 16);
        }
        while (v19);
      }

      if (!a4)
      {
        v36 = 0u;
        v37 = 0u;
        v34 = 0u;
        v35 = 0u;
        objc_msgSend(v8, "inEdges");
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
        if (v27)
        {
          v28 = v27;
          v29 = *(_QWORD *)v35;
          do
          {
            for (k = 0; k != v28; ++k)
            {
              if (*(_QWORD *)v35 != v29)
                objc_enumerationMutation(v26);
              objc_msgSend(*(id *)(*((_QWORD *)&v34 + 1) + 8 * k), "sourceNode");
              v31 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v6, "addObject:", v31);

            }
            v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v34, v47, 16);
          }
          while (v28);
        }

      }
LABEL_4:
      objc_msgSend(v6, "removeObject:", v8);
    }

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgesByLabel, 0);
  objc_storeStrong((id *)&self->_nodesByLabel, 0);
}

@end
