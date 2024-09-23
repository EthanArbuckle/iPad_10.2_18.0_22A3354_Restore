@implementation SRUIFTreeNode

+ (id)absoluteIndexPathsForTreeNodes:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "absoluteIndexPath", (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (SRUIFTreeNode)init
{
  SRUIFTreeNode *v2;
  uint64_t v3;
  NSMutableArray *childNodes;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SRUIFTreeNode;
  v2 = -[SRUIFTreeNode init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = objc_claimAutoreleasedReturnValue();
    childNodes = v2->_childNodes;
    v2->_childNodes = (NSMutableArray *)v3;

  }
  return v2;
}

- (void)_appendDescriptionToString:(id)a3 withIndentation:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  SRUIFTreeNode *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "appendString:", v7);
  v8 = objc_opt_class();
  -[SRUIFTreeNode item](self, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFTreeNode _childNodes](self, "_childNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("<%@ %p: item=%@; %lu children=("), v8, self, v9, objc_msgSend(v10, "count"));

  -[SRUIFTreeNode _childNodes](self, "_childNodes");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    objc_msgSend(v7, "stringByAppendingString:", CFSTR("  "));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v14 = self;
    v15 = -[SRUIFTreeNode countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        v18 = 0;
        do
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * v18);
          objc_msgSend(v6, "appendString:", CFSTR("\n"));
          objc_msgSend(v19, "_appendDescriptionToString:withIndentation:", v6, v13);
          ++v18;
        }
        while (v16 != v18);
        v16 = -[SRUIFTreeNode countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
      }
      while (v16);
    }

    objc_msgSend(v6, "appendString:", v7);
    objc_msgSend(v6, "appendString:", CFSTR("\n)>"));

  }
  else
  {
    objc_msgSend(v6, "appendString:", CFSTR("none)>"));
  }

}

- (id)description
{
  void *v3;

  objc_msgSend(MEMORY[0x24BDD16A8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFTreeNode _appendDescriptionToString:withIndentation:](self, "_appendDescriptionToString:withIndentation:", v3, &stru_24DC1C4B0);
  return v3;
}

- (id)indexPathFromAncestorNode:(id)a3
{
  SRUIFTreeNode *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v11;
  uint64_t v12;
  void *v13;
  id v14;

  v4 = (SRUIFTreeNode *)a3;
  if (self == v4)
  {
    v9 = objc_alloc_init(MEMORY[0x24BDD15D8]);
  }
  else
  {
    -[SRUIFTreeNode parentNode](self, "parentNode");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v11 = (void *)MEMORY[0x24BDBCE88];
      v12 = *MEMORY[0x24BDBCAB8];
      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("Cannot generate an index path relative to node %@, which isn't an ancestor"), v4);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "exceptionWithName:reason:userInfo:", v12, v13, 0);
      v14 = (id)objc_claimAutoreleasedReturnValue();

      objc_exception_throw(v14);
    }
    -[SRUIFTreeNode parentNode](self, "parentNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "indexPathFromAncestorNode:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFTreeNode parentNode](self, "parentNode");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "indexPathByAddingIndex:", objc_msgSend(v8, "indexOfChildNode:", self));
    v9 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v9;
}

- (id)absoluteIndexPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[SRUIFTreeNode parentNode](self, "parentNode");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SRUIFTreeNode parentNode](self, "parentNode");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "absoluteIndexPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SRUIFTreeNode parentNode](self, "parentNode");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "indexPathByAddingIndex:", objc_msgSend(v6, "indexOfChildNode:", self));
    v7 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = objc_alloc_init(MEMORY[0x24BDD15D8]);
  }
  return v7;
}

- (BOOL)containsNodeAtIndexPath:(id)a3
{
  id v4;
  SRUIFTreeNode *v5;
  uint64_t v6;
  BOOL v7;
  unint64_t v8;
  uint64_t v9;
  SRUIFTreeNode *v10;
  unint64_t v11;

  v4 = a3;
  v5 = self;
  v6 = objc_msgSend(v4, "length");
  v7 = v6 == 0;
  if (v6)
  {
    v8 = 0;
    while (1)
    {
      v9 = objc_msgSend(v4, "indexAtPosition:", v8);
      if (v9 >= -[SRUIFTreeNode numberOfChildNodes](v5, "numberOfChildNodes"))
        break;
      -[SRUIFTreeNode childNodeAtIndex:](v5, "childNodeAtIndex:", v9);
      v10 = (SRUIFTreeNode *)objc_claimAutoreleasedReturnValue();

      ++v8;
      v11 = objc_msgSend(v4, "length");
      v5 = v10;
      v7 = v8 >= v11;
      if (v8 >= v11)
        goto LABEL_7;
    }
  }
  v10 = v5;
LABEL_7:

  return v7;
}

- (id)nodeAtIndexPath:(id)a3
{
  id v4;
  SRUIFTreeNode *v5;
  unint64_t v6;
  SRUIFTreeNode *v7;

  v4 = a3;
  v5 = self;
  if (objc_msgSend(v4, "length"))
  {
    v6 = 0;
    do
    {
      -[SRUIFTreeNode childNodeAtIndex:](v5, "childNodeAtIndex:", objc_msgSend(v4, "indexAtPosition:", v6));
      v7 = (SRUIFTreeNode *)objc_claimAutoreleasedReturnValue();

      ++v6;
      v5 = v7;
    }
    while (v6 < objc_msgSend(v4, "length"));
  }
  else
  {
    v7 = v5;
  }

  return v7;
}

- (id)indexPathOfNodeWithItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  unsigned int (**v7)(_QWORD, _QWORD);
  id v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  unsigned int (**v13)(_QWORD, _QWORD);
  uint64_t *v14;
  _QWORD v15[4];
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v4 = a3;
  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy__5;
  v21 = __Block_byref_object_dispose__5;
  v22 = 0;
  v5 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __41__SRUIFTreeNode_indexPathOfNodeWithItem___block_invoke;
  v15[3] = &unk_24DC1B690;
  v6 = v4;
  v16 = v6;
  v7 = (unsigned int (**)(_QWORD, _QWORD))MEMORY[0x220736DE0](v15);
  if (((unsigned int (**)(_QWORD, SRUIFTreeNode *))v7)[2](v7, self))
  {
    v8 = objc_alloc_init(MEMORY[0x24BDD15D8]);
    v9 = (void *)v18[5];
    v18[5] = (uint64_t)v8;
  }
  else
  {
    v12[0] = v5;
    v12[1] = 3221225472;
    v12[2] = __41__SRUIFTreeNode_indexPathOfNodeWithItem___block_invoke_2;
    v12[3] = &unk_24DC1B6B8;
    v13 = v7;
    v14 = &v17;
    v12[4] = self;
    -[SRUIFTreeNode enumerateDescendentNodesUsingBlock:](self, "enumerateDescendentNodesUsingBlock:", v12);
    v9 = v13;
  }

  v10 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v10;
}

uint64_t __41__SRUIFTreeNode_indexPathOfNodeWithItem___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;

  v3 = a2;
  objc_msgSend(v3, "item");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 == *(void **)(a1 + 32))
  {
    v6 = 1;
  }
  else
  {
    objc_msgSend(v3, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32));

  }
  return v6;
}

void __41__SRUIFTreeNode_indexPathOfNodeWithItem___block_invoke_2(_QWORD *a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a2;
  if ((*(unsigned int (**)(void))(a1[5] + 16))())
  {
    objc_msgSend(v8, "indexPathFromAncestorNode:", a1[4]);
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = *(_QWORD *)(a1[6] + 8);
    v7 = *(void **)(v6 + 40);
    *(_QWORD *)(v6 + 40) = v5;

    *a3 = 1;
  }

}

- (void)removeFromParentNode
{
  id v3;

  -[SRUIFTreeNode parentNode](self, "parentNode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeChildNode:", self);

}

- (int64_t)numberOfChildNodes
{
  void *v2;
  int64_t v3;

  -[SRUIFTreeNode _childNodes](self, "_childNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  return v3;
}

- (int64_t)indexOfChildNode:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;

  v4 = a3;
  -[SRUIFTreeNode _childNodes](self, "_childNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  return v6;
}

- (id)childNodeAtIndex:(int64_t)a3
{
  void *v4;
  void *v5;

  -[SRUIFTreeNode _childNodes](self, "_childNodes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndex:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)lastChildNode
{
  void *v2;
  void *v3;

  -[SRUIFTreeNode _childNodes](self, "_childNodes");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)insertChildNode:(id)a3 atIndex:(int64_t)a4
{
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;

  v11 = a3;
  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", self);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SRUIFTreeNode parentNode](self, "parentNode");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      objc_msgSend(v6, "addObject:", v8);
      objc_msgSend(v8, "parentNode");
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v9;
    }
    while (v9);
  }
  objc_msgSend(v11, "enumerateDescendentNodesUsingBlock:", &__block_literal_global_4);
  objc_msgSend(v11, "removeFromParentNode");
  -[SRUIFTreeNode _childNodes](self, "_childNodes");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertObject:atIndex:", v11, a4);

  objc_msgSend(v11, "_setParentNode:", self);
}

- (void)addChildNode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[SRUIFTreeNode _childNodes](self, "_childNodes");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SRUIFTreeNode insertChildNode:atIndex:](self, "insertChildNode:atIndex:", v4, objc_msgSend(v5, "count"));

}

- (void)removeChildNodeAtIndex:(int64_t)a3
{
  void *v5;
  void *v6;
  id v7;

  -[SRUIFTreeNode _childNodes](self, "_childNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[SRUIFTreeNode _childNodes](self, "_childNodes");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObjectAtIndex:", a3);

  objc_msgSend(v7, "_setParentNode:", 0);
}

- (void)removeChildNode:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  -[SRUIFTreeNode _childNodes](self, "_childNodes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);

  -[SRUIFTreeNode removeChildNodeAtIndex:](self, "removeChildNodeAtIndex:", v6);
}

- (void)replaceChildNodeAtIndex:(int64_t)a3 withNode:(id)a4
{
  id v6;

  v6 = a4;
  -[SRUIFTreeNode removeChildNodeAtIndex:](self, "removeChildNodeAtIndex:", a3);
  -[SRUIFTreeNode insertChildNode:atIndex:](self, "insertChildNode:atIndex:", v6, a3);

}

- (void)enumerateChildNodesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v7 = a4;
  if (v7)
  {
    -[SRUIFTreeNode _childNodes](self, "_childNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __59__SRUIFTreeNode_enumerateChildNodesWithOptions_usingBlock___block_invoke;
    v8[3] = &unk_24DC1B720;
    v9 = v7;
    objc_msgSend(v6, "enumerateObjectsWithOptions:usingBlock:", a3, v8);

  }
}

uint64_t __59__SRUIFTreeNode_enumerateChildNodesWithOptions_usingBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)enumerateChildNodesUsingBlock:(id)a3
{
  -[SRUIFTreeNode enumerateChildNodesWithOptions:usingBlock:](self, "enumerateChildNodesWithOptions:usingBlock:", 0, a3);
}

- (unint64_t)countByEnumeratingWithState:(id *)a3 objects:(id *)a4 count:(unint64_t)a5
{
  void *v8;
  unint64_t v9;

  -[SRUIFTreeNode _childNodes](self, "_childNodes");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", a3, a4, a5);

  return v9;
}

- (void)enumerateDescendentNodesUsingBlock:(id)a3
{
  void (**v4)(id, SRUIFTreeNode *, _BYTE *);
  id v5;
  void *v6;
  void *v7;
  SRUIFTreeNode *v8;
  void *v9;
  char v10;

  v4 = (void (**)(id, SRUIFTreeNode *, _BYTE *))a3;
  if (v4)
  {
    v10 = 0;
    v5 = objc_alloc_init(MEMORY[0x24BE09280]);
    -[SRUIFTreeNode _childNodes](self, "_childNodes");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "enqueueObjects:", v6);

    do
    {
      objc_msgSend(v5, "frontObject");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v7)
        break;
      objc_msgSend(v5, "dequeueObject");
      v8 = (SRUIFTreeNode *)objc_claimAutoreleasedReturnValue();
      if (v8 != self)
      {
        v4[2](v4, v8, &v10);
        -[SRUIFTreeNode _childNodes](v8, "_childNodes");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "enqueueObjects:", v9);

      }
    }
    while (!v10);

  }
}

- (id)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong(&self->_item, a3);
}

- (SRUIFTreeNode)parentNode
{
  return (SRUIFTreeNode *)objc_loadWeakRetained((id *)&self->_parentNode);
}

- (void)_setParentNode:(id)a3
{
  objc_storeWeak((id *)&self->_parentNode, a3);
}

- (NSMutableArray)_childNodes
{
  return self->_childNodes;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_childNodes, 0);
  objc_destroyWeak((id *)&self->_parentNode);
  objc_storeStrong(&self->_item, 0);
}

@end
