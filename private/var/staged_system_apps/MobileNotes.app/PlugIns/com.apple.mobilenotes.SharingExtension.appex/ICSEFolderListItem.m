@implementation ICSEFolderListItem

- (ICSEFolderListItem)initWithViewState:(id)a3
{
  id v4;
  ICSEFolderListItem *v5;
  ICSEFolderListItem *v6;
  NSMutableArray *v7;
  NSMutableArray *children;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)ICSEFolderListItem;
  v5 = -[ICSEFolderListItem init](&v10, "init");
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_viewState, v4);
    v7 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    children = v6->_children;
    v6->_children = v7;

  }
  return v6;
}

- (id)description
{
  id v3;
  unint64_t v4;
  id v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  if (-[ICSEFolderListItem level](self, "level"))
  {
    v4 = 0;
    do
    {
      objc_msgSend(v3, "appendString:", CFSTR("    "));
      ++v4;
    }
    while (v4 < -[ICSEFolderListItem level](self, "level"));
  }
  v5 = objc_alloc_init((Class)NSMutableString);
  if (-[ICSEFolderListItem isCollapsed](self, "isCollapsed"))
    v6 = CFSTR("-");
  else
    v6 = CFSTR("+");
  objc_msgSend(v5, "appendString:", v6);
  objc_msgSend(v5, "appendString:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem noteContainer](self, "noteContainer"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleForTableViewCell"));
  objc_msgSend(v5, "appendString:", v8);

  objc_msgSend(v5, "appendString:", CFSTR("\n"));
  v18 = 0u;
  v19 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem children](self, "children", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v17;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v9);
        v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)v13), "debugDescription"));
        objc_msgSend(v5, "appendString:", v14);

        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v11);
  }

  return v5;
}

- (unint64_t)level
{
  void *v3;
  void *v4;
  char *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem parent](self, "parent"));

  if (!v3)
    return 0;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem parent](self, "parent"));
  v5 = (char *)objc_msgSend(v4, "level") + 1;

  return (unint64_t)v5;
}

- (BOOL)isCollapsible
{
  void *v3;
  void *v4;
  BOOL v5;

  if (-[ICSEFolderListItem isAccount](self, "isAccount"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem parent](self, "parent"));

    if (!v3)
      return 1;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem children](self, "children"));
  v5 = objc_msgSend(v4, "count") != 0;

  return v5;
}

- (BOOL)isCollapsed
{
  ICSEFolderListItem *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  unsigned int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;

  v2 = self;
  if (!-[ICSEFolderListItem isCollapsible](self, "isCollapsible"))
    goto LABEL_6;
  if (-[ICSEFolderListItem isAccount](v2, "isAccount"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem parent](v2, "parent"));

    if (!v3)
    {
      v13 = objc_opt_class(ICAccount, v4);
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem noteContainer](v2, "noteContainer"));
      v15 = ICDynamicCast(v13, v14);
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);

      if (!v16)
        +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((((ICAccount*)ICDynamicCast([ICAccount class], self.noteContainer))) != nil)", "-[ICSEFolderListItem isCollapsed]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "ICCastAsClass(ICAccount, self.noteContainer)");
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem viewState](v2, "viewState"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "collapsedAccountIdentifiers"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem noteContainer](v2, "noteContainer"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
      LOBYTE(v2) = objc_msgSend(v8, "containsObject:", v10);
      goto LABEL_13;
    }
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem viewState](v2, "viewState"));
  v6 = objc_msgSend(v5, "overrideCollapsed");

  if (!v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem viewState](v2, "viewState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "expandedFolderIdentifiers"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem noteContainer](v2, "noteContainer"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
    LODWORD(v2) = objc_msgSend(v8, "containsObject:", v10) ^ 1;
    goto LABEL_13;
  }
  if (!-[ICSEFolderListItem isAccount](v2, "isAccount"))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem viewState](v2, "viewState"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "overrideCollapsedFolder"));
    if (!v8)
    {
      LOBYTE(v2) = 0;
      goto LABEL_14;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem viewState](v2, "viewState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "overrideCollapsedFolder"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem noteContainer](v2, "noteContainer"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "identifier"));
    LOBYTE(v2) = objc_msgSend(v10, "isEqualToString:", v12);

LABEL_13:
LABEL_14:

    return (char)v2;
  }
LABEL_6:
  LOBYTE(v2) = 0;
  return (char)v2;
}

- (void)setCollapsed:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;

  v3 = a3;
  if (-[ICSEFolderListItem isCollapsible](self, "isCollapsible"))
  {
    if (-[ICSEFolderListItem isAccount](self, "isAccount"))
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem parent](self, "parent"));

      if (!v5)
      {
        v12 = objc_opt_class(ICAccount, v6);
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem noteContainer](self, "noteContainer"));
        v14 = ICDynamicCast(v12, v13);
        v15 = (void *)objc_claimAutoreleasedReturnValue(v14);

        if (!v15)
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "((((ICAccount*)ICDynamicCast([ICAccount class], self.noteContainer))) != nil)", "-[ICSEFolderListItem setCollapsed:]", 1, 0, CFSTR("Expected non-nil value for '%s'"), "ICCastAsClass(ICAccount, self.noteContainer)");
        v21 = (id)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem viewState](self, "viewState"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "collapsedAccountIdentifiers"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem noteContainer](self, "noteContainer"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
        if (!v3)
          goto LABEL_26;
LABEL_28:
        objc_msgSend(v16, "addObject:", v18);
        goto LABEL_29;
      }
    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem viewState](self, "viewState"));
    v8 = objc_msgSend(v7, "overrideCollapsed");

    if (!v8)
    {
      if (v3)
      {
LABEL_25:
        v21 = (id)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem viewState](self, "viewState"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "expandedFolderIdentifiers"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem noteContainer](self, "noteContainer"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
LABEL_26:
        objc_msgSend(v16, "removeObject:", v18);
LABEL_29:

        return;
      }
      goto LABEL_27;
    }
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem viewState](self, "viewState"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "overrideCollapsedFolder"));
    v11 = v10;
    if (v3)
    {
      if (!v10)
      {

LABEL_18:
        if (-[ICSEFolderListItem isAccount](self, "isAccount"))
          +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "!self.isAccount", "-[ICSEFolderListItem setCollapsed:]", 1, 0, CFSTR("Can't collapse a legacy or account node in edit mode"));
        if (v3)
        {
          v9 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem noteContainer](self, "noteContainer"));
          v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "identifier"));
        }
        else
        {
          v19 = 0;
        }
        v20 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem viewState](self, "viewState"));
        objc_msgSend(v20, "setOverrideCollapsedFolder:", v19);

        if (v3)
        {

          goto LABEL_25;
        }
LABEL_27:
        v21 = (id)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem viewState](self, "viewState"));
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "expandedFolderIdentifiers"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem noteContainer](self, "noteContainer"));
        v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "identifier"));
        goto LABEL_28;
      }

    }
    else
    {

      if (v11)
        goto LABEL_18;
    }
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "(collapsed && !self.viewState.overrideCollapsedFolder) || (!collapsed && self.viewState.overrideCollapsedFolder)", "-[ICSEFolderListItem setCollapsed:]", 1, 0, CFSTR("Can't collapse or expand more than one folder in edit mode"));
    goto LABEL_18;
  }
}

- (id)flattenedChildItems
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  if (!-[ICSEFolderListItem isCollapsed](self, "isCollapsed"))
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem children](self, "children", 0));
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v13;
      do
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(_QWORD *)v13 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
          objc_msgSend(v3, "addObject:", v9);
          v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "flattenedChildItems"));
          objc_msgSend(v3, "addObjectsFromArray:", v10);

        }
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v6);
    }

  }
  return v3;
}

- (unint64_t)countOfVisibleDescendants
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem flattenedChildItems](self, "flattenedChildItems"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem noteContainer](self, "noteContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "titleForTableViewCell"));

  return (NSString *)v3;
}

- (void)recursivelyAddChildFolder:(id)a3
{
  id v4;
  ICSEFolderListItem *v5;
  void *v6;
  ICSEFolderListItem *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v4 = a3;
  v5 = [ICSEFolderListItem alloc];
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem viewState](self, "viewState"));
  v7 = -[ICSEFolderListItem initWithViewState:](v5, "initWithViewState:", v6);

  -[ICSEFolderListItem setNoteContainer:](v7, "setNoteContainer:", v4);
  -[ICSEFolderListItem setIsDefaultFolder:](v7, "setIsDefaultFolder:", objc_msgSend(v4, "isDefaultFolderForAccount"));
  -[ICSEFolderListItem setParent:](v7, "setParent:", self);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem children](self, "children"));
  objc_msgSend(v8, "addObject:", v7);

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleNoteContainerChildren", 0));
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v15;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v15 != v12)
          objc_enumerationMutation(v9);
        -[ICSEFolderListItem recursivelyAddChildFolder:](v7, "recursivelyAddChildFolder:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13));
        v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v11);
  }

}

- (void)addChildItem:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem children](self, "children"));
  objc_msgSend(v4, "addObject:", v5);

  objc_msgSend(v5, "setParent:", self);
}

- (void)insertChildItem:(id)a3 atIndex:(unint64_t)a4
{
  void *v6;
  id v7;

  v7 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListItem children](self, "children"));
  objc_msgSend(v6, "insertObject:atIndex:", v7, a4);

  objc_msgSend(v7, "setParent:", self);
}

- (BOOL)isAccount
{
  return self->_isAccount;
}

- (void)setIsAccount:(BOOL)a3
{
  self->_isAccount = a3;
}

- (BOOL)isDefaultFolder
{
  return self->_isDefaultFolder;
}

- (void)setIsDefaultFolder:(BOOL)a3
{
  self->_isDefaultFolder = a3;
}

- (ICNoteContainer)noteContainer
{
  return self->_noteContainer;
}

- (void)setNoteContainer:(id)a3
{
  objc_storeStrong((id *)&self->_noteContainer, a3);
}

- (NSMutableArray)children
{
  return self->_children;
}

- (void)setChildren:(id)a3
{
  objc_storeStrong((id *)&self->_children, a3);
}

- (ICSEFolderListItem)parent
{
  return (ICSEFolderListItem *)objc_loadWeakRetained((id *)&self->_parent);
}

- (void)setParent:(id)a3
{
  objc_storeWeak((id *)&self->_parent, a3);
}

- (ICSEFolderListViewState)viewState
{
  return (ICSEFolderListViewState *)objc_loadWeakRetained((id *)&self->_viewState);
}

- (void)setViewState:(id)a3
{
  objc_storeWeak((id *)&self->_viewState, a3);
}

- (unint64_t)folderListItemAccountType
{
  return self->_folderListItemAccountType;
}

- (void)setFolderListItemAccountType:(unint64_t)a3
{
  self->_folderListItemAccountType = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_viewState);
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_noteContainer, 0);
}

@end
