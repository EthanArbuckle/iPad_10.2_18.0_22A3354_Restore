@implementation TRAPreferencesTree

+ (TRAPreferencesTree)treeWithNodesSpecifications:(id)a3 traversalType:(int64_t)a4 debugName:(id)a5
{
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  char v15;
  uint64_t i;
  void *v17;
  void *v18;
  TRAPreferencesTreeNode *v19;
  void *v20;
  TRAPreferencesTreeNode *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  id v27;
  uint64_t v28;
  void *v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  void *v35;
  void *v36;
  void *v37;
  TRAPreferencesTreeNode *v38;
  void *v39;
  TRAPreferencesTreeNode *v40;
  NSObject *v41;
  void *v43;
  void *v44;
  id v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id obj;
  uint64_t v51;
  void *v52;
  void *v53;
  uint64_t v54;
  void *v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _BYTE v69[128];
  _BYTE v70[128];
  _BYTE v71[128];
  uint64_t v72;

  v72 = *MEMORY[0x24BDAC8D0];
  v9 = a3;
  v10 = a5;
  v11 = v10;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRAPreferencesTree.m"), 160, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("nodesSpecifications"));

    if (v11)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("TRAPreferencesTree.m"), 161, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("debugName"));

LABEL_3:
  v46 = v11;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v9);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v9, "count"));
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", objc_msgSend(v9, "count"));
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v65 = 0u;
  v66 = 0u;
  v67 = 0u;
  v68 = 0u;
  obj = v9;
  v12 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v66;
    v15 = 1;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v66 != v14)
          objc_enumerationMutation(obj);
        v17 = *(void **)(*((_QWORD *)&v65 + 1) + 8 * i);
        objc_msgSend(v17, "parentParticipant");
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          v15 = 0;
        }
        else
        {
          v19 = [TRAPreferencesTreeNode alloc];
          objc_msgSend(v17, "participant");
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          v21 = -[TRAPreferencesTreeNode initWithParticipant:](v19, "initWithParticipant:", v20);

          objc_msgSend(v17, "order");
          -[TRAPreferencesTreeNode setOrder:](v21, "setOrder:");
          objc_msgSend(v49, "addObject:", v21);
          objc_msgSend(v55, "removeObject:", v17);
          -[TRAPreferencesTreeNode uniqueIdentifier](v21, "uniqueIdentifier");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v48, "setObject:forKey:", v21, v22);

        }
      }
      v13 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v71, 16);
    }
    while (v13);
  }
  else
  {
    v15 = 1;
  }

  v23 = v46;
  v24 = -[TRAPreferencesTree _initWithRootChildren:traversalType:debugName:]([TRAPreferencesTree alloc], "_initWithRootChildren:traversalType:debugName:", v49, a4, v46);
  if ((v15 & 1) == 0 && objc_msgSend(v49, "count"))
  {
    v45 = v24;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithArray:", v49);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v25, "count"));
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = v25;
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v25, "count"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    do
    {
      v63 = 0u;
      v64 = 0u;
      v61 = 0u;
      v62 = 0u;
      v27 = v47;
      v54 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
      if (v54)
      {
        v51 = *(_QWORD *)v62;
        v52 = v27;
        do
        {
          v28 = 0;
          do
          {
            if (*(_QWORD *)v62 != v51)
              objc_enumerationMutation(v27);
            v56 = v28;
            v29 = *(void **)(*((_QWORD *)&v61 + 1) + 8 * v28);
            v57 = 0u;
            v58 = 0u;
            v59 = 0u;
            v60 = 0u;
            v30 = v55;
            v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
            if (v31)
            {
              v32 = v31;
              v33 = *(_QWORD *)v58;
              do
              {
                for (j = 0; j != v32; ++j)
                {
                  if (*(_QWORD *)v58 != v33)
                    objc_enumerationMutation(v30);
                  v35 = *(void **)(*((_QWORD *)&v57 + 1) + 8 * j);
                  objc_msgSend(v35, "parentParticipant");
                  v36 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v29, "participant");
                  v37 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v36 == v37)
                  {
                    v38 = [TRAPreferencesTreeNode alloc];
                    objc_msgSend(v35, "participant");
                    v39 = (void *)objc_claimAutoreleasedReturnValue();
                    v40 = -[TRAPreferencesTreeNode initWithParticipant:](v38, "initWithParticipant:", v39);

                    objc_msgSend(v35, "order");
                    -[TRAPreferencesTreeNode setOrder:](v40, "setOrder:");
                    objc_msgSend(v29, "addChild:", v40);
                    objc_msgSend(v26, "addObject:", v40);

                  }
                }
                v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v57, v69, 16);
              }
              while (v32);
            }

            objc_msgSend(v53, "addObject:", v29);
            v28 = v56 + 1;
            v27 = v52;
          }
          while (v56 + 1 != v54);
          v54 = objc_msgSend(v52, "countByEnumeratingWithState:objects:count:", &v61, v70, 16);
        }
        while (v54);
      }

      objc_msgSend(v27, "removeObjectsInArray:", v53);
      objc_msgSend(v27, "addObjectsFromArray:", v26);
      objc_msgSend(v26, "removeAllObjects");
      objc_msgSend(v53, "removeAllObjects");
    }
    while (objc_msgSend(v27, "count"));

    v24 = v45;
    v23 = v46;
  }
  TRALogCommon();
  v41 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
    +[TRAPreferencesTree treeWithNodesSpecifications:traversalType:debugName:].cold.1(v24, v41);

  return (TRAPreferencesTree *)v24;
}

uint64_t __68__TRAPreferencesTree__initWithRootChildren_traversalType_debugName___block_invoke(uint64_t a1, void *a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  void *v10;
  uint64_t v11;

  v4 = (void *)MEMORY[0x24BDD16E0];
  v5 = a3;
  objc_msgSend(a2, "order");
  objc_msgSend(v4, "numberWithDouble:");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v5, "order");
  v9 = v8;

  objc_msgSend(v7, "numberWithDouble:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v6, "compare:", v10);

  return v11;
}

- (id)_initWithRootChildren:(id)a3 traversalType:(int64_t)a4 debugName:(id)a5
{
  id v8;
  id v9;
  TRAPreferencesTree *v10;
  uint64_t v11;
  NSArray *rootChildren;
  objc_super v14;

  v8 = a3;
  v9 = a5;
  v14.receiver = self;
  v14.super_class = (Class)TRAPreferencesTree;
  v10 = -[TRAPreferencesTree init](&v14, sel_init);
  if (v10)
  {
    objc_msgSend(v8, "sortedArrayUsingComparator:", &__block_literal_global_129);
    v11 = objc_claimAutoreleasedReturnValue();
    rootChildren = v10->_rootChildren;
    v10->_rootChildren = (NSArray *)v11;

    v10->_traversalType = a4;
    objc_storeStrong((id *)&v10->_debugName, a5);
  }

  return v10;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rootChildren, 0);
  objc_storeStrong((id *)&self->_debugName, 0);
}

- (id)participantsTopologicalSort
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  -[TRAPreferencesTree topologicalSort](self, "topologicalSort");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * v8), "participant", (_QWORD)v11);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "addObject:", v9);

        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  return v3;
}

- (id)topologicalSort
{
  NSArray *v3;

  if (self->_isFlatTree)
  {
    v3 = self->_rootChildren;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", -[NSArray count](self->_rootChildren, "count"));
    v3 = (NSArray *)objc_claimAutoreleasedReturnValue();
    preOrder(0, self->_rootChildren, v3, self->_traversalType);
  }
  return v3;
}

- (id)recursiveDescription
{
  return -[TRAPreferencesTree _recursiveDescriptionWithChildrenInZOrder:](self, "_recursiveDescriptionWithChildrenInZOrder:", 0);
}

- (NSString)debugDescription
{
  return (NSString *)-[TRAPreferencesTree descriptionWithMultilinePrefix:](self, "descriptionWithMultilinePrefix:", 0);
}

- (id)succinctDescription
{
  void *v2;
  void *v3;

  -[TRAPreferencesTree succinctDescriptionBuilder](self, "succinctDescriptionBuilder");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "build");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)succinctDescriptionBuilder
{
  void *v3;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendString:withName:", self->_debugName, CFSTR("name"));
  return v3;
}

- (id)descriptionWithMultilinePrefix:(id)a3
{
  void *v3;
  void *v4;

  -[TRAPreferencesTree descriptionBuilderWithMultilinePrefix:](self, "descriptionBuilderWithMultilinePrefix:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "build");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_recursiveDescriptionWithChildrenInZOrder:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = a3;
  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  -[TRAPreferencesTree debugName](self, "debugName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", CFSTR("   ◼︎ %@ Root"), v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "appendString:", v8);

  appendDescription(0, self->_rootChildren, v5, 0, self->_traversalType, v3);
  objc_msgSend(v5, "appendString:", CFSTR("   "));
  return v5;
}

- (NSString)debugName
{
  return self->_debugName;
}

- (int64_t)traversalType
{
  return self->_traversalType;
}

- (void)setTraversalType:(int64_t)a3
{
  self->_traversalType = a3;
}

- (BOOL)isFlatTree
{
  return self->_isFlatTree;
}

- (void)setIsFlatTree:(BOOL)a3
{
  self->_isFlatTree = a3;
}

+ (void)treeWithNodesSpecifications:(void *)a1 traversalType:(NSObject *)a2 debugName:.cold.1(void *a1, NSObject *a2)
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  __int16 v8;
  void *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "debugName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "recursiveDescription");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138543618;
  v7 = v4;
  v8 = 2114;
  v9 = v5;
  _os_log_debug_impl(&dword_249196000, a2, OS_LOG_TYPE_DEBUG, "%{public}@ %{public}@", (uint8_t *)&v6, 0x16u);

}

@end
