@implementation _UIFloatingTabBarListItem

- (_UIFloatingTabBarListItem)initWithTab:(id)a3
{
  id v5;
  _UIFloatingTabBarListItem *v6;
  _UIFloatingTabBarListItem *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_UIFloatingTabBarListItem;
  v6 = -[_UIFloatingTabBarListItem init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_tabForSelection, a3);
    v7->_itemIndex = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v7;
}

+ (id)placeholderItemForTab:(id)a3
{
  UITab *v3;
  _UIFloatingTabBarListItem *v4;
  UITab *contentTab;

  v3 = (UITab *)a3;
  v4 = objc_alloc_init(_UIFloatingTabBarListItem);
  v4->_isPlaceholder = 1;
  contentTab = v4->_contentTab;
  v4->_contentTab = v3;

  return v4;
}

- (_UIFloatingTabBarListItem)initWithChildren:(id)a3
{
  id v6;
  _UIFloatingTabBarListItem *v7;
  uint64_t v8;
  void *v10;
  _QWORD v11[4];
  _UIFloatingTabBarListItem *v12;
  SEL v13;
  objc_super v14;

  v6 = a3;
  v14.receiver = self;
  v14.super_class = (Class)_UIFloatingTabBarListItem;
  v7 = -[_UIFloatingTabBarListItem init](&v14, sel_init);
  if (v7)
  {
    if (!objc_msgSend(v6, "count"))
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, v7, CFSTR("_UIFloatingTabBarListItem.m"), 35, CFSTR("Cannot create list item with 0 chilren."));

    }
    objc_storeStrong((id *)&v7->_children, a3);
    v8 = MEMORY[0x1E0C809B0];
    v7->_itemIndex = 0x7FFFFFFFFFFFFFFFLL;
    v11[0] = v8;
    v11[1] = 3221225472;
    v11[2] = __46___UIFloatingTabBarListItem_initWithChildren___block_invoke;
    v11[3] = &unk_1E16E2768;
    v13 = a2;
    v12 = v7;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v11);

  }
  return v7;
}

- (UITab)contentTab
{
  UITab *contentTab;

  contentTab = self->_contentTab;
  if (!contentTab)
    contentTab = self->_tabForSelection;
  return contentTab;
}

- (BOOL)containsItem:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  char v20;
  uint64_t v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc(MEMORY[0x1E0C99DE8]);
  -[_UIFloatingTabBarListItem tabForSelection](self, "tabForSelection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v5, "initWithObjects:", v7, 0);

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v9 = self->_children;
  v10 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v24 != v12)
          objc_enumerationMutation(v9);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * i), "tabForSelection");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "identifier");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObject:", v15);

      }
      v11 = -[NSArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
    }
    while (v11);
  }

  v16 = v4;
  v17 = v16;
  if (v16)
  {
    v18 = v16;
    do
    {
      objc_msgSend(v18, "identifier");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend(v8, "containsObject:", v19);

      if ((v20 & 1) != 0)
        break;
      objc_msgSend(v18, "_parentGroup");
      v21 = objc_claimAutoreleasedReturnValue();

      v18 = (void *)v21;
    }
    while (v21);

  }
  else
  {
    v20 = 0;
  }

  return v20;
}

- (unint64_t)hash
{
  unint64_t v3;

  v3 = -[UITab hash](self->_contentTab, "hash");
  return -[UITab hash](self->_tabForSelection, "hash") ^ v3 ^ self->_isPlaceholder;
}

- (BOOL)isEqual:(id)a3
{
  _UIFloatingTabBarListItem *v4;
  BOOL v5;

  v4 = (_UIFloatingTabBarListItem *)a3;
  if (v4 == self)
  {
    v5 = 1;
  }
  else
  {
    objc_opt_class();
    v5 = (objc_opt_isKindOfClass() & 1) != 0
      && v4->_tabForSelection == self->_tabForSelection
      && v4->_contentTab == self->_contentTab
      && v4->_isPlaceholder == self->_isPlaceholder;
  }

  return v5;
}

- (_UIFloatingTabBarListItem)parent
{
  return (_UIFloatingTabBarListItem *)objc_loadWeakRetained((id *)&self->_parent);
}

- (int64_t)itemIndex
{
  return self->_itemIndex;
}

- (UITab)tabForSelection
{
  return self->_tabForSelection;
}

- (BOOL)isPlaceholder
{
  return self->_isPlaceholder;
}

- (void)setContentTab:(id)a3
{
  objc_storeStrong((id *)&self->_contentTab, a3);
}

- (NSArray)children
{
  return self->_children;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_contentTab, 0);
  objc_storeStrong((id *)&self->_tabForSelection, 0);
  objc_destroyWeak((id *)&self->_parent);
}

@end
