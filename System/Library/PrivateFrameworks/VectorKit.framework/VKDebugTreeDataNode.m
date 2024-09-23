@implementation VKDebugTreeDataNode

- (void)buildChildren
{
  _QWORD *node;
  uint64_t v4;
  uint64_t v5;
  VKDebugTreePropertyNode *v6;
  uint64_t v7;
  uint64_t i;
  VKDebugTreeDataNode *v9;
  id v10;

  v10 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  node = self->_node;
  v4 = node[9];
  v5 = node[10];
  if (v4 != v5)
  {
    do
    {
      v6 = -[VKDebugTreePropertyNode initWithDebugTreeProperty:withParent:]([VKDebugTreePropertyNode alloc], "initWithDebugTreeProperty:withParent:", v4, self);
      objc_msgSend(v10, "addObject:", v6);

      v4 += 80;
    }
    while (v4 != v5);
    node = self->_node;
  }
  v7 = node[6];
  for (i = node[7]; v7 != i; v7 += 96)
  {
    v9 = -[VKDebugTreeDataNode initWithDebugTreeNode:withParent:]([VKDebugTreeDataNode alloc], "initWithDebugTreeNode:withParent:", v7, self);
    -[VKDebugTreeDataNode buildChildren](v9, "buildChildren");
    objc_msgSend(v10, "addObject:", v9);

  }
  -[VKDebugTreeNode setChildren:](self, "setChildren:", v10);

}

- (BOOL)isExpandable
{
  void *v2;
  BOOL v3;

  -[VKDebugTreeNode children](self, "children");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count") != 0;

  return v3;
}

- (id)name
{
  const void **node;

  node = (const void **)self->_node;
  if (*((char *)node + 23) < 0)
    node = (const void **)*node;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", node);
}

- (id)propertyColumn
{
  const void **node;

  node = (const void **)self->_node;
  if (*((char *)node + 23) < 0)
    node = (const void **)*node;
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", node);
}

- (id)valueColumn
{
  return CFSTR(" ");
}

- (id)tagsColumn
{
  return CFSTR(" ");
}

- (void)searchNodes:(id)a3 withParameter:(id)a4
{
  id v6;
  id v7;
  const void **node;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  node = (const void **)self->_node;
  if (*((char *)node + 23) < 0)
    node = (const void **)*node;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", node);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rangeOfString:options:", v7, 1);

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    objc_msgSend(v6, "addObject:", self);
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[VKDebugTreeNode children](self, "children", 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v12)
  {
    v13 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v16 != v13)
          objc_enumerationMutation(v11);
        objc_msgSend(*(id *)(*((_QWORD *)&v15 + 1) + 8 * i), "searchNodes:withParameter:", v6, v7);
      }
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v12);
  }

}

- (int64_t)propertyCount
{
  return 0xCCCCCCCCCCCCCCCDLL * ((uint64_t)(*((_QWORD *)self->_node + 10) - *((_QWORD *)self->_node + 9)) >> 4);
}

- (VKDebugTreeDataNode)initWithDebugTreeNode:(const void *)a3 withParent:(id)a4
{
  VKDebugTreeDataNode *result;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VKDebugTreeDataNode;
  result = -[VKDebugTreeNode initWithParent:](&v6, sel_initWithParent_, a4);
  if (result)
    result->_node = a3;
  return result;
}

@end
