@implementation REUpNextSetNode

- (REUpNextSetNode)initWithItem:(id)a3
{
  id v5;
  REUpNextSetNode *v6;
  REUpNextSetNode *v7;
  uint64_t v8;
  NSMutableArray *children;
  REUpNextSetNode *parent;
  objc_super v12;

  v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)REUpNextSetNode;
  v6 = -[REUpNextSetNode init](&v12, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong(&v6->_item, a3);
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    children = v7->_children;
    v7->_children = (NSMutableArray *)v8;

    v7->_rank = 0;
    parent = v7->_parent;
    v7->_parent = 0;

  }
  return v7;
}

- (id)rootNode
{
  REUpNextSetNode *parent;
  REUpNextSetNode **p_parent;
  id *v5;
  REUpNextSetNode *v6;
  REUpNextSetNode *v7;

  p_parent = &self->_parent;
  parent = self->_parent;
  if (parent)
  {
    -[REUpNextSetNode rootNode](parent, "rootNode");
    v5 = (id *)objc_claimAutoreleasedReturnValue();
    v6 = (REUpNextSetNode *)v5;
    if (*p_parent != (REUpNextSetNode *)v5)
    {
      -[NSMutableArray removeObject:]((*p_parent)->_children, "removeObject:", self);
      objc_storeStrong((id *)p_parent, v5);
      objc_msgSend(v5[3], "addObject:", self);
      v6 = self->_parent;
    }
    v7 = v6;

  }
  else
  {
    v7 = self;
  }
  return v7;
}

- (void)join:(id)a3
{
  id v4;
  id *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  id *v9;

  v4 = a3;
  -[REUpNextSetNode rootNode](self, "rootNode");
  v9 = (id *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rootNode");
  v5 = (id *)objc_claimAutoreleasedReturnValue();

  if (v9 != v5)
  {
    v6 = objc_msgSend(v9, "rank");
    if (v6 >= objc_msgSend(v5, "rank"))
    {
      v7 = objc_msgSend(v9, "rank");
      v8 = objc_msgSend(v5, "rank");
      objc_msgSend(v5, "setParent:", v9);
      if (v7 <= v8)
        v9[4] = (char *)v9[4] + 1;
    }
    else
    {
      objc_msgSend(v9, "setParent:", v5);
      objc_msgSend(v5[3], "addObject:", v9);
    }
  }

}

- (void)remove
{
  uint64_t v3;
  REUpNextSetNode *parent;
  uint64_t v5;
  void *v6;
  NSMutableArray *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  if (self->_parent)
  {
    -[REUpNextSetNode rootNode](self, "rootNode");
    v3 = objc_claimAutoreleasedReturnValue();
    -[NSMutableArray removeObject:](self->_parent->_children, "removeObject:", self);
    parent = self->_parent;
    self->_parent = 0;

    if (!v3)
      goto LABEL_14;
  }
  else
  {
    -[NSMutableArray lastObject](self->_children, "lastObject");
    v5 = objc_claimAutoreleasedReturnValue();
    v3 = v5;
    if (!v5)
      goto LABEL_14;
    v6 = *(void **)(v5 + 16);
    *(_QWORD *)(v5 + 16) = 0;

    *(_QWORD *)(v3 + 32) = self->_rank - 1;
    -[NSMutableArray removeLastObject](self->_children, "removeLastObject");
  }
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = self->_children;
  v8 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(*(id *)(v3 + 24), "addObject:", v12, (_QWORD)v13);
        objc_storeStrong((id *)(v12 + 16), (id)v3);
      }
      v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

LABEL_14:
  -[NSMutableArray removeAllObjects](self->_children, "removeAllObjects", (_QWORD)v13);

}

- (id)item
{
  return self->_item;
}

- (REUpNextSetNode)parent
{
  return self->_parent;
}

- (void)setParent:(id)a3
{
  objc_storeStrong((id *)&self->_parent, a3);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (unint64_t)rank
{
  return self->_rank;
}

- (void)setRank:(unint64_t)a3
{
  self->_rank = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_parent, 0);
  objc_storeStrong(&self->_item, 0);
}

@end
