@implementation TSKTreeNode

- (TSKTreeNode)initWithContext:(id)a3
{
  TSKTreeNode *v3;
  TSKTreeNode *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSKTreeNode;
  v3 = -[TSPObject initWithContext:](&v6, sel_initWithContext_, a3);
  v4 = v3;
  if (v3)
  {
    v3->mObject = 0;
    v3->mDisplayName = 0;
    v3->mChildren = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)TSKTreeNode;
  -[TSKTreeNode dealloc](&v3, sel_dealloc);
}

- (NSString)name
{
  return self->mDisplayName;
}

- (void)setName:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mDisplayName = (NSString *)a3;
}

- (NSMutableArray)children
{
  return self->mChildren;
}

- (void)setChildren:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mChildren = (NSMutableArray *)a3;
}

- (id)dataObject
{
  return self->mObject;
}

- (void)setDataObject:(id)a3
{
  id v5;

  -[TSPObject willModify](self, "willModify");
  v5 = a3;

  self->mObject = a3;
}

- (id)objectAtIndex:(unint64_t)a3
{
  void *v3;

  v3 = (void *)-[NSMutableArray objectAtIndex:](self->mChildren, "objectAtIndex:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    return (id)objc_msgSend(v3, "dataObject");
  else
    return 0;
}

- (id)nodeAtIndex:(unint64_t)a3
{
  void *v3;
  void *v4;
  uint64_t v5;

  v3 = (void *)-[NSMutableArray objectAtIndex:](self->mChildren, "objectAtIndex:", a3);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v4 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v5 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKTreeNode nodeAtIndex:]");
    objc_msgSend(v4, "handleFailureInFunction:file:lineNumber:description:", v5, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKTreeNode.mm"), 119, CFSTR("Not a tree node where there should be one!"));
  }
  return v3;
}

- (TSKTreeNode)nodeWithObject:(id)a3
{
  NSMutableArray *mChildren;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  TSKTreeNode *v9;
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
  mChildren = self->mChildren;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (!v5)
    return 0;
  v6 = v5;
  v7 = *(_QWORD *)v12;
LABEL_3:
  v8 = 0;
  while (1)
  {
    if (*(_QWORD *)v12 != v7)
      objc_enumerationMutation(mChildren);
    v9 = *(TSKTreeNode **)(*((_QWORD *)&v11 + 1) + 8 * v8);
    if ((objc_msgSend(-[TSKTreeNode dataObject](v9, "dataObject"), "isEqual:", a3) & 1) != 0)
      return v9;
    if (v6 == ++v8)
    {
      v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v6)
        goto LABEL_3;
      return 0;
    }
  }
}

- (int64_t)indexOfNodeWithObject:(id)a3
{
  uint64_t v5;
  uint64_t v6;
  int64_t v7;

  v5 = -[NSMutableArray count](self->mChildren, "count");
  if (v5 < 1)
    return 0x7FFFFFFFFFFFFFFFLL;
  v6 = v5;
  v7 = 0;
  while ((objc_msgSend((id)objc_msgSend((id)-[NSMutableArray objectAtIndex:](self->mChildren, "objectAtIndex:", v7), "dataObject"), "isEqual:", a3) & 1) == 0)
  {
    if (v6 == ++v7)
      return 0x7FFFFFFFFFFFFFFFLL;
  }
  return v7;
}

- (BOOL)hasChildWithName:(id)a3
{
  NSMutableArray *mChildren;
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

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  mChildren = self->mChildren;
  v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    while (2)
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(mChildren);
        if ((objc_msgSend((id)objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v8), "name"), "isEqualToString:", a3) & 1) != 0)
        {
          LOBYTE(v5) = 1;
          return v5;
        }
        ++v8;
      }
      while (v6 != v8);
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      v6 = v5;
      if (v5)
        continue;
      break;
    }
  }
  return v5;
}

- (void)addChildWithName:(id)a3 object:(id)a4
{
  NSMutableArray *mChildren;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  TSKTreeNode *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  mChildren = self->mChildren;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(mChildren);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend((id)objc_msgSend(v12, "name"), "isEqualToString:", a3) & 1) != 0)
        {
          objc_msgSend(v12, "setDataObject:", a4);
          return;
        }
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v9)
        continue;
      break;
    }
  }
  -[TSPObject willModify](self, "willModify");
  v13 = -[TSKTreeNode initWithContext:]([TSKTreeNode alloc], "initWithContext:", -[TSPObject context](self, "context"));
  -[TSKTreeNode setName:](v13, "setName:", a3);
  -[TSKTreeNode setDataObject:](v13, "setDataObject:", a4);
  -[NSMutableArray addObject:](self->mChildren, "addObject:", v13);

}

- (void)addObject:(id)a3 atIndex:(unint64_t)a4
{
  void *v7;
  uint64_t v8;
  TSKTreeNode *v9;

  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    v7 = (void *)objc_msgSend(MEMORY[0x24BEB3C28], "currentHandler");
    v8 = objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "-[TSKTreeNode addObject:atIndex:]");
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/AlderShared/kit/TSKTreeNode.mm"), 184, CFSTR("Can't get a name for this object!"));
  }
  -[TSPObject willModify](self, "willModify");
  v9 = -[TSKTreeNode initWithContext:]([TSKTreeNode alloc], "initWithContext:", -[TSPObject context](self, "context"));
  -[TSKTreeNode setName:](v9, "setName:", objc_msgSend(a3, "name"));
  -[TSKTreeNode setDataObject:](v9, "setDataObject:", a3);
  -[NSMutableArray insertObject:atIndex:](self->mChildren, "insertObject:atIndex:", v9, a4);

}

- (void)addNode:(id)a3 atIndex:(unint64_t)a4
{
  -[TSPObject willModify](self, "willModify");
  -[NSMutableArray insertObject:atIndex:](self->mChildren, "insertObject:atIndex:", a3, a4);
}

- (void)removeChildWithName:(id)a3
{
  id v5;
  NSMutableArray *mChildren;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  mChildren = self->mChildren;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(mChildren);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "name"), "isEqualToString:", a3))
        {
          -[TSPObject willModify](self, "willModify");
          -[NSMutableArray removeObject:](self->mChildren, "removeObject:", v11);
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v5);
        -[NSMutableArray removeObject:](self->mChildren, "removeObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)removeChildWithDataObject:(id)a3
{
  id v5;
  NSMutableArray *mChildren;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t j;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  v5 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  mChildren = self->mChildren;
  v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(mChildren);
        v11 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend((id)objc_msgSend(v11, "dataObject"), "isEqual:", a3))
        {
          -[TSPObject willModify](self, "willModify");
          objc_msgSend(v5, "addObject:", v11);
        }
      }
      v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v20, v25, 16);
    }
    while (v8);
  }
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v12 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v17;
    do
    {
      for (j = 0; j != v13; ++j)
      {
        if (*(_QWORD *)v17 != v14)
          objc_enumerationMutation(v5);
        -[NSMutableArray removeObject:](self->mChildren, "removeObject:", *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * j));
      }
      v13 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v16, v24, 16);
    }
    while (v13);
  }

}

- (void)removeChildAtIndex:(unint64_t)a3
{
  -[TSPObject willModify](self, "willModify");
  -[NSMutableArray removeObjectAtIndex:](self->mChildren, "removeObjectAtIndex:", a3);
}

- (void)removeAllChildren
{
  -[TSPObject willModify](self, "willModify");
  -[NSMutableArray removeAllObjects](self->mChildren, "removeAllObjects");
}

- (id)childEnumerator
{
  return (id)-[NSMutableArray objectEnumerator](self->mChildren, "objectEnumerator");
}

- (void)enumerateAllChildrenWithBlock:(id)a3
{
  NSMutableArray *mChildren;
  _QWORD v4[5];

  mChildren = self->mChildren;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __45__TSKTreeNode_enumerateAllChildrenWithBlock___block_invoke;
  v4[3] = &unk_24D82A5F0;
  v4[4] = a3;
  -[NSMutableArray enumerateObjectsUsingBlock:](mChildren, "enumerateObjectsUsingBlock:", v4);
}

uint64_t __45__TSKTreeNode_enumerateAllChildrenWithBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  uint64_t result;

  if ((*(unsigned int (**)(_QWORD, uint64_t))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), objc_msgSend(a2, "dataObject")))
  {
    *a4 = 1;
  }
  result = objc_msgSend(a2, "children");
  if (result)
    return objc_msgSend(a2, "enumerateAllChildrenWithBlock:", *(_QWORD *)(a1 + 32));
  return result;
}

- (id)shallowCopy
{
  TSKTreeNode *v3;
  id v4;
  NSMutableArray *mChildren;
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
  v3 = -[TSKTreeNode initWithContext:]([TSKTreeNode alloc], "initWithContext:", -[TSPObject context](self, "context"));
  -[TSKTreeNode setName:](v3, "setName:", self->mDisplayName);
  -[TSKTreeNode setDataObject:](v3, "setDataObject:", self->mObject);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  mChildren = self->mChildren;
  v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
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
          objc_enumerationMutation(mChildren);
        v10 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "shallowCopy");
        objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](mChildren, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }
  -[TSKTreeNode setChildren:](v3, "setChildren:", v4);

  return v3;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("node(%p): %@, children: %@"), self, self->mDisplayName, self->mChildren);
}

@end
