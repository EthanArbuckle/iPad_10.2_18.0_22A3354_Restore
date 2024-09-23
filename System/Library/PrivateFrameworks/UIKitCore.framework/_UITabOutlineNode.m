@implementation _UITabOutlineNode

- (_UITabOutlineNode)initWithIdentifier:(id)a3
{
  id v5;
  _UITabOutlineNode *v6;
  _UITabOutlineNode *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UITabOutlineNode;
  v6 = -[_UITabOutlineNode init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_identifier, a3);

  return v7;
}

- (void)addChild:(id)a3
{
  NSMutableArray *children;
  NSMutableArray *v5;
  NSMutableArray *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "setParent:", self);
  children = self->_children;
  if (children)
  {
    -[NSMutableArray addObject:](children, "addObject:", v7);
  }
  else
  {
    v5 = (NSMutableArray *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithObjects:", v7, 0);
    v6 = self->_children;
    self->_children = v5;

  }
}

- (void)removeChild:(id)a3
{
  NSMutableArray *children;
  id v4;

  children = self->_children;
  v4 = a3;
  -[NSMutableArray removeObject:](children, "removeObject:", v4);
  objc_msgSend(v4, "setParent:", 0);

}

- (void)addActionIdentifier:(id)a3
{
  NSMutableArray *actions;
  NSMutableArray *v5;
  NSMutableArray *v6;

  actions = self->_actions;
  if (actions)
  {
    -[NSMutableArray addObject:](actions, "addObject:", a3);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", a3);
    v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
    v6 = self->_actions;
    self->_actions = v5;

  }
}

- (id)description
{
  return -[_UITabOutlineNode _descriptionWithIndentationLevel:](self, "_descriptionWithIndentationLevel:", 0);
}

- (id)_descriptionWithIndentationLevel:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  int64_t v13;
  uint64_t v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  objc_msgSend(&stru_1E16EDF20, "stringByPaddingToLength:withString:startingAtIndex:", 2 * a3, CFSTR(" "), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@%@ (%lu actions)"), v5, self->_identifier, -[NSMutableArray count](self->_actions, "count"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_UITabOutlineNode children](self, "children");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");

  if (v8)
  {
    objc_msgSend(v6, "appendString:", CFSTR(" {\n"));
    v19 = 0u;
    v20 = 0u;
    v17 = 0u;
    v18 = 0u;
    -[_UITabOutlineNode children](self, "children");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v18;
      v13 = a3 + 1;
      do
      {
        v14 = 0;
        do
        {
          if (*(_QWORD *)v18 != v12)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v17 + 1) + 8 * v14), "_descriptionWithIndentationLevel:", v13);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v6, "appendString:", v15);
          objc_msgSend(v6, "appendString:", CFSTR("\n"));

          ++v14;
        }
        while (v11 != v14);
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v11);
    }

    objc_msgSend(v6, "appendString:", v5);
    objc_msgSend(v6, "appendString:", CFSTR("}\n"));
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  _UITabOutlineNode *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  void *v9;
  char v10;
  char v11;
  void *v12;
  void *v13;
  id v14;

  v4 = (_UITabOutlineNode *)a3;
  if (self == v4)
  {
    v10 = 1;
    goto LABEL_16;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[_UITabOutlineNode identifier](self, "identifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabOutlineNode identifier](v4, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5;
    v8 = v6;
    if (v7 == v8)
    {

    }
    else
    {
      v9 = v8;
      v10 = 0;
      if (!v7 || !v8)
      {
LABEL_15:

        goto LABEL_16;
      }
      v11 = objc_msgSend(v7, "isEqual:", v8);

      if ((v11 & 1) == 0)
        goto LABEL_7;
    }
    -[_UITabOutlineNode children](self, "children");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[_UITabOutlineNode children](v4, "children");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v12;
    v14 = v13;
    if (v7 == v14)
    {
      v10 = 1;
      v9 = v7;
    }
    else
    {
      v9 = v14;
      v10 = 0;
      if (v7 && v14)
        v10 = objc_msgSend(v7, "isEqual:", v14);
    }
    goto LABEL_15;
  }
LABEL_7:
  v10 = 0;
LABEL_16:

  return v10;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (NSMutableArray)actions
{
  return self->_actions;
}

- (_UITabOutlineNode)parent
{
  return (_UITabOutlineNode *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (BOOL)isGroup
{
  return self->_isGroup;
}

- (void)setIsGroup:(BOOL)a3
{
  self->_isGroup = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_actions, 0);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

@end
