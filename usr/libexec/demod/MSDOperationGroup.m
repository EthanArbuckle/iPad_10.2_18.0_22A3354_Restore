@implementation MSDOperationGroup

- (MSDOperationGroup)init
{
  MSDOperationGroup *v2;
  NSMutableSet *v3;
  NSMutableSet *rootOperations;
  NSMutableSet *v5;
  NSMutableSet *leafOperations;
  id v7;
  MSDOperationGroup *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MSDOperationGroup;
  v2 = -[MSDOperationGroup init](&v10, "init");
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    rootOperations = v2->_rootOperations;
    v2->_rootOperations = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    leafOperations = v2->_leafOperations;
    v2->_leafOperations = v5;

    v7 = objc_alloc_init((Class)NSMutableSet);
    -[MSDOperationGroup setAllOperations:](v2, "setAllOperations:", v7);

    -[MSDOperationGroup setIsRoot:](v2, "setIsRoot:", 1);
    -[MSDOperationGroup setIsLeaf:](v2, "setIsLeaf:", 1);
    v8 = v2;
  }

  return v2;
}

- (MSDOperationGroup)initWithOperations:(id)a3
{
  id v4;
  MSDOperationGroup *v5;
  MSDOperationGroup *v6;
  MSDOperationGroup *v7;

  v4 = a3;
  v5 = -[MSDOperationGroup init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDOperationGroup _addOperations:](v5, "_addOperations:", v4);
    v7 = v6;
  }

  return v6;
}

- (MSDOperationGroup)initWithOperationGroups:(id)a3
{
  id v4;
  MSDOperationGroup *v5;
  MSDOperationGroup *v6;
  MSDOperationGroup *v7;

  v4 = a3;
  v5 = -[MSDOperationGroup init](self, "init");
  v6 = v5;
  if (v5)
  {
    -[MSDOperationGroup _addOperationGroups:](v5, "_addOperationGroups:", v4);
    v7 = v6;
  }

  return v6;
}

- (void)addDependency:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;
  uint64_t v14;
  void *v15;
  void *v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _BYTE v26[128];

  v4 = a3;
  objc_msgSend(v4, "setIsLeaf:", 0);
  -[MSDOperationGroup setIsRoot:](self, "setIsRoot:", 0);
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v16 = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "leafOperations"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v22;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v22 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)v9);
        v17 = 0u;
        v18 = 0u;
        v19 = 0u;
        v20 = 0u;
        v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationGroup rootOperations](self, "rootOperations"));
        v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
        if (v12)
        {
          v13 = v12;
          v14 = *(_QWORD *)v18;
          do
          {
            v15 = 0;
            do
            {
              if (*(_QWORD *)v18 != v14)
                objc_enumerationMutation(v11);
              objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * (_QWORD)v15), "addDependency:", v10);
              v15 = (char *)v15 + 1;
            }
            while (v13 != v15);
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v17, v25, 16);
          }
          while (v13);
        }

        v9 = (char *)v9 + 1;
      }
      while (v9 != v7);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    }
    while (v7);
  }

}

- (void)_addOperations:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isRoot"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationGroup rootOperations](self, "rootOperations"));
          objc_msgSend(v10, "addObject:", v9);

        }
        if (objc_msgSend(v9, "isLeaf"))
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationGroup leafOperations](self, "leafOperations"));
          objc_msgSend(v11, "addObject:", v9);

        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v6);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationGroup allOperations](self, "allOperations"));
  objc_msgSend(v12, "addObjectsFromArray:", v4);

}

- (void)_addOperationGroups:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v4 = a3;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "isRoot"))
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationGroup rootOperations](self, "rootOperations"));
          v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "rootOperations"));
          objc_msgSend(v10, "unionSet:", v11);

        }
        if (objc_msgSend(v9, "isLeaf"))
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationGroup leafOperations](self, "leafOperations"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leafOperations"));
          objc_msgSend(v12, "unionSet:", v13);

        }
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[MSDOperationGroup allOperations](self, "allOperations"));
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "operations"));
        objc_msgSend(v14, "unionSet:", v15);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v6);
  }

}

- (NSMutableSet)rootOperations
{
  return self->_rootOperations;
}

- (void)setRootOperations:(id)a3
{
  objc_storeStrong((id *)&self->_rootOperations, a3);
}

- (NSMutableSet)leafOperations
{
  return self->_leafOperations;
}

- (void)setLeafOperations:(id)a3
{
  objc_storeStrong((id *)&self->_leafOperations, a3);
}

- (NSMutableSet)allOperations
{
  return self->_allOperations;
}

- (void)setAllOperations:(id)a3
{
  objc_storeStrong((id *)&self->_allOperations, a3);
}

- (BOOL)isRoot
{
  return self->_isRoot;
}

- (void)setIsRoot:(BOOL)a3
{
  self->_isRoot = a3;
}

- (BOOL)isLeaf
{
  return self->_isLeaf;
}

- (void)setIsLeaf:(BOOL)a3
{
  self->_isLeaf = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allOperations, 0);
  objc_storeStrong((id *)&self->_leafOperations, 0);
  objc_storeStrong((id *)&self->_rootOperations, 0);
}

@end
