@implementation UIGestureGraphNode

- (BOOL)hasEdgeFromNode:(id)a3
{
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_inEdges;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "sourceNode", (_QWORD)v12);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9 == a3)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (id)edgesForLabel:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  if (a3)
  {
    v3 = (void *)MEMORY[0x1E0C99E60];
    -[NSMapTable objectForKey:](self->_edgesByLabel, "objectForKey:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setWithSet:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[UIGestureGraphNode allEdges](self, "allEdges");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (void)_removeEdge:(id)a3
{
  NSMapTable *edgesByLabel;
  void *v6;
  void *v7;
  id v8;

  -[UIGestureGraphNode _edgesForType:createIfNeeded:](self, "_edgesForType:createIfNeeded:", -[UIGestureGraphNode typeOfEdge:](self, "typeOfEdge:"), 0);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  edgesByLabel = self->_edgesByLabel;
  objc_msgSend(a3, "label");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMapTable objectForKey:](edgesByLabel, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
    objc_msgSend(v7, "removeObject:", a3);
  objc_msgSend(v8, "removeObject:", a3);

}

- (void)_addEdge:(id)a3
{
  NSMapTable *edgesByLabel;
  NSMapTable *v6;
  NSMapTable *v7;
  void *v8;
  void *v9;
  NSMapTable *v10;
  void *v11;
  id v12;

  -[UIGestureGraphNode _edgesForType:createIfNeeded:](self, "_edgesForType:createIfNeeded:", -[UIGestureGraphNode typeOfEdge:](self, "typeOfEdge:"), 1);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  edgesByLabel = self->_edgesByLabel;
  if (!edgesByLabel)
  {
    objc_msgSend(MEMORY[0x1E0CB3748], "strongToStrongObjectsMapTable");
    v6 = (NSMapTable *)objc_claimAutoreleasedReturnValue();
    v7 = self->_edgesByLabel;
    self->_edgesByLabel = v6;

    edgesByLabel = self->_edgesByLabel;
  }
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
  objc_msgSend(v12, "addObject:", a3);

}

- (unint64_t)typeOfEdge:(id)a3
{
  if (-[UIGestureGraphNode isInEdge:](self, "isInEdge:"))
    return 0;
  if (-[UIGestureGraphNode isOutEdge:](self, "isOutEdge:", a3))
    return 2;
  return 1;
}

- (id)_edgesForType:(unint64_t)a3 createIfNeeded:(BOOL)a4
{
  uint64_t v4;
  NSMutableSet **p_outEdges;
  NSMutableSet *outEdges;
  BOOL v7;
  uint64_t v8;
  NSMutableSet *v9;
  NSMutableSet *v10;

  if (a3 == 2)
  {
    p_outEdges = &self->_outEdges;
    outEdges = self->_outEdges;
    if (outEdges)
      v7 = 1;
    else
      v7 = !a4;
    if (v7)
      goto LABEL_15;
    goto LABEL_14;
  }
  if (a3 == 1)
  {
    v4 = 40;
  }
  else
  {
    if (a3)
    {
      v10 = 0;
      return v10;
    }
    v4 = 24;
  }
  p_outEdges = (NSMutableSet **)((char *)self + v4);
  outEdges = *(NSMutableSet **)((char *)&self->super.super.isa + v4);
  if (!outEdges && a4)
  {
LABEL_14:
    v8 = objc_opt_new();
    v9 = *p_outEdges;
    *p_outEdges = (NSMutableSet *)v8;

    outEdges = *p_outEdges;
  }
LABEL_15:
  v10 = outEdges;
  return v10;
}

- (NSSet)outEdges
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_outEdges);
}

- (BOOL)isInEdge:(id)a3
{
  UIGestureGraphNode *v5;
  char v6;

  objc_msgSend(a3, "targetNode");
  v5 = (UIGestureGraphNode *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
    v6 = objc_msgSend(a3, "isDirected");
  else
    v6 = 0;

  return v6;
}

- (NSSet)inOutEdges
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_inOutEdges);
}

- (BOOL)isOutEdge:(id)a3
{
  UIGestureGraphNode *v5;
  char v6;

  objc_msgSend(a3, "sourceNode");
  v5 = (UIGestureGraphNode *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
    v6 = objc_msgSend(a3, "isDirected");
  else
    v6 = 0;

  return v6;
}

- (NSSet)inEdges
{
  return (NSSet *)objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", self->_inEdges);
}

- (NSSet)allEdges
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E20], "setWithSet:", self->_inEdges);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", self->_inOutEdges);
  objc_msgSend(v3, "unionSet:", self->_outEdges);
  return (NSSet *)v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_edgesByLabel, 0);
  objc_storeStrong((id *)&self->_inOutEdges, 0);
  objc_storeStrong((id *)&self->_outEdges, 0);
  objc_storeStrong((id *)&self->_inEdges, 0);
}

- (unint64_t)edgeCount
{
  uint64_t v3;
  uint64_t v4;

  v3 = -[NSMutableSet count](self->_inEdges, "count");
  v4 = -[NSMutableSet count](self->_inOutEdges, "count") + v3;
  return v4 + -[NSMutableSet count](self->_outEdges, "count");
}

- (unint64_t)edgeCountForLabel:(id)a3
{
  void *v3;
  unint64_t v4;

  if (!a3)
    return -[UIGestureGraphNode edgeCount](self, "edgeCount");
  -[NSMapTable objectForKey:](self->_edgesByLabel, "objectForKey:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (BOOL)hasEdgeTowardNode:(id)a3
{
  NSMutableSet *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  id v9;
  BOOL v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = self->_outEdges;
  v5 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * i), "targetNode", (_QWORD)v12);
        v9 = (id)objc_claimAutoreleasedReturnValue();

        if (v9 == a3)
        {
          v10 = 1;
          goto LABEL_11;
        }
      }
      v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (BOOL)hasEdgeBetweenNode:(id)a3
{
  NSMutableSet *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  id v10;
  BOOL v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = self->_inOutEdges;
  v6 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "oppositeNode:", self, (_QWORD)v13);
        v10 = (id)objc_claimAutoreleasedReturnValue();

        if (v10 == a3)
        {
          v11 = 1;
          goto LABEL_11;
        }
      }
      v7 = -[NSMutableSet countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (BOOL)isInOutEdge:(id)a3
{
  void *v5;
  void *v6;
  BOOL v7;
  UIGestureGraphNode *v8;

  if (!objc_msgSend(a3, "isDirected"))
    return 1;
  objc_msgSend(a3, "sourceNode");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a3, "targetNode");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5 == v6)
  {
    objc_msgSend(a3, "sourceNode");
    v8 = (UIGestureGraphNode *)objc_claimAutoreleasedReturnValue();
    v7 = v8 == self;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)enumerateEdgesTowardNode:(id)a3 usingBlock:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_outEdges, "count"))
  {
    v18 = 0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSMutableSet allObjects](self->_outEdges, "allObjects", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_msgSend(v12, "targetNode");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == a3)
        {
          (*((void (**)(id, void *, char *))a4 + 2))(a4, v12, &v18);
          if (v18)
            break;
        }
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (void)enumerateEdgesFromNode:(id)a3 usingBlock:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_inEdges, "count"))
  {
    v18 = 0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSMutableSet allObjects](self->_inEdges, "allObjects", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_msgSend(v12, "sourceNode");
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == a3)
        {
          (*((void (**)(id, void *, char *))a4 + 2))(a4, v12, &v18);
          if (v18)
            break;
        }
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (void)enumerateEdgesBetweenNode:(id)a3 usingBlock:(id)a4
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (-[NSMutableSet count](self->_inOutEdges, "count"))
  {
    v18 = 0;
    v14 = 0u;
    v15 = 0u;
    v16 = 0u;
    v17 = 0u;
    -[NSMutableSet allObjects](self->_inOutEdges, "allObjects", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v15;
LABEL_4:
      v11 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        objc_msgSend(v12, "oppositeNode:", self);
        v13 = (id)objc_claimAutoreleasedReturnValue();

        if (v13 == a3)
        {
          (*((void (**)(id, void *, char *))a4 + 2))(a4, v12, &v18);
          if (v18)
            break;
        }
        if (v9 == ++v11)
        {
          v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
          if (v9)
            goto LABEL_4;
          break;
        }
      }
    }

  }
}

- (void)enumerateNeighborNodesUsingBlock:(id)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  char v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v17 = 0;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[UIGestureGraphNode allEdges](self, "allEdges", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v10, "oppositeNode:", self);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = v11;
        if (v11)
        {
          if ((objc_msgSend(v11, "isEqual:", self) & 1) == 0)
          {
            (*((void (**)(id, void *, void *, char *))a3 + 2))(a3, v10, v12, &v17);
            if (v17)
            {

              goto LABEL_13;
            }
          }
        }

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_13:

}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  objc_super v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIGestureGraphNode edgeCount](self, "edgeCount");
  v7 = -[NSMutableSet count](self->_inEdges, "count");
  v8 = -[NSMutableSet count](self->_outEdges, "count");
  v9 = -[NSMutableSet count](self->_inOutEdges, "count");
  v13.receiver = self;
  v13.super_class = (Class)UIGestureGraphNode;
  -[UIGestureGraphElement description](&v13, sel_description);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[<%@ %p>] edgesCount:[%ld] inEdgesCount:[%ld] outEdgesCount:[%ld] inOutEdgesCount:[%ld] %@"), v5, self, v6, v7, v8, v9, v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end
