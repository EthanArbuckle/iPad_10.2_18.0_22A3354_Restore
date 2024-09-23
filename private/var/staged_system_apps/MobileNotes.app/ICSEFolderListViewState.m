@implementation ICSEFolderListViewState

- (ICSEFolderListViewState)init
{
  ICSEFolderListViewState *v2;
  NSMutableArray *v3;
  NSMutableArray *accounts;
  NSMutableSet *v5;
  NSMutableSet *expandedFolderIdentifiers;
  NSMutableSet *v7;
  NSMutableSet *collapsedAccountIdentifiers;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ICSEFolderListViewState;
  v2 = -[ICSEFolderListViewState init](&v10, "init");
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    accounts = v2->_accounts;
    v2->_accounts = v3;

    v5 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    expandedFolderIdentifiers = v2->_expandedFolderIdentifiers;
    v2->_expandedFolderIdentifiers = v5;

    v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    collapsedAccountIdentifiers = v2->_collapsedAccountIdentifiers;
    v2->_collapsedAccountIdentifiers = v7;

  }
  return v2;
}

- (id)description
{
  id v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = objc_alloc_init((Class)NSMutableString);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListViewState accounts](self, "accounts"));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = 0;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v4);
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("\nAccount %lu\n%@\n"), (char *)v9 + v7, *(_QWORD *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v9)));
        objc_msgSend(v3, "appendString:", v10);

        v9 = (char *)v9 + 1;
      }
      while (v6 != v9);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v7 += (uint64_t)v9;
    }
    while (v6);
  }

  return v3;
}

- (void)addAccount:(id)a3
{
  id v4;
  ICSEFolderListItem *v5;
  ICSEFolderListViewState *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  ICSEFolderListItem *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id obj;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];

  v4 = a3;
  v5 = -[ICSEFolderListItem initWithViewState:]([ICSEFolderListItem alloc], "initWithViewState:", self);
  -[ICSEFolderListItem setIsAccount:](v5, "setIsAccount:", 1);
  -[ICSEFolderListItem setNoteContainer:](v5, "setNoteContainer:", v4);
  -[ICSEFolderListItem setParent:](v5, "setParent:", 0);
  -[ICSEFolderListItem setFolderListItemAccountType:](v5, "setFolderListItemAccountType:", -[ICSEFolderListViewState getModernAccountFolderListType:](self, "getModernAccountFolderListType:", v4));
  v6 = self;
  -[ICSEFolderListViewState addFolderListItem:](self, "addFolderListItem:", v5);
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "visibleNoteContainerChildren"));
  v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(obj);
        v11 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v12 = objc_opt_class(ICAccountProxy);
        v13 = ICDynamicCast(v12, v11);
        v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
        if (v14)
        {
          v15 = -[ICSEFolderListItem initWithViewState:]([ICSEFolderListItem alloc], "initWithViewState:", v6);
          -[ICSEFolderListItem setIsAccount:](v15, "setIsAccount:", 1);
          -[ICSEFolderListItem setNoteContainer:](v15, "setNoteContainer:", v4);
          -[ICSEFolderListItem setParent:](v15, "setParent:", v5);
          -[ICSEFolderListItem addChildItem:](v5, "addChildItem:", v15);

        }
        v16 = objc_opt_class(ICFolder);
        v17 = ICDynamicCast(v16, v11);
        v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
        if (objc_msgSend(v18, "isVisible") && (objc_msgSend(v18, "isTrashFolder") & 1) == 0)
          -[ICSEFolderListItem recursivelyAddChildFolder:](v5, "recursivelyAddChildFolder:", v18);

      }
      v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v8);
  }

}

- (unint64_t)getModernAccountFolderListType:(id)a3
{
  id v3;
  unint64_t v4;
  NSObject *v5;

  v3 = a3;
  if (objc_msgSend(v3, "accountType") == 1)
  {
    v4 = objc_msgSend(v3, "isManaged");
  }
  else if (objc_msgSend(v3, "accountType") == 3)
  {
    v4 = 2;
  }
  else
  {
    v5 = os_log_create("com.apple.notes", "UI");
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      sub_100404A44((uint64_t)v3, v5);

    v4 = 3;
  }

  return v4;
}

- (void)addFolderListItem:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListViewState accounts](self, "accounts"));
  objc_msgSend(v5, "addObject:", v4);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[ICSEFolderListViewState accounts](self, "accounts"));
  objc_msgSend(v6, "sortUsingComparator:", &stru_100550D28);

}

- (unint64_t)countOfAccounts
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListViewState accounts](self, "accounts"));
  v3 = objc_msgSend(v2, "count");

  return (unint64_t)v3;
}

- (void)removeAccounts
{
  id v2;

  v2 = (id)objc_claimAutoreleasedReturnValue(-[ICSEFolderListViewState accounts](self, "accounts"));
  objc_msgSend(v2, "removeAllObjects");

}

- (unint64_t)countOfItemsInAccountAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListViewState accounts](self, "accounts"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
    return 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListViewState accounts](self, "accounts"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a3));

  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flattenedChildItems"));
  v10 = objc_msgSend(v9, "count");

  return (unint64_t)v10;
}

- (id)accountItemAtIndex:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListViewState accounts](self, "accounts"));
  v6 = objc_msgSend(v5, "count");

  if ((unint64_t)v6 <= a3)
  {
    +[ICAssert handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:](ICAssert, "handleFailedAssertWithCondition:functionName:simulateCrash:showAlert:format:", "0", "-[ICSEFolderListViewState accountItemAtIndex:]", 1, 0, CFSTR("Index %lu out of range for accounts"), a3);
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListViewState accounts](self, "accounts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", a3));

  }
  return v8;
}

- (id)itemAtIndexPath:(id)a3
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "section");
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListViewState accounts](self, "accounts"));
  if (v5 >= objc_msgSend(v6, "count"))
  {
    v8 = 0;
  }
  else
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ICSEFolderListViewState accounts](self, "accounts"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v4, "section")));

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "flattenedChildItems"));
  if (v9 && (v10 = objc_msgSend(v4, "row"), v10 < objc_msgSend(v9, "count")))
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v4, "row")));
  else
    v11 = 0;

  return v11;
}

- (void)setOverrideCollapsed:(BOOL)a3
{
  self->_overrideCollapsed = a3;
  -[ICSEFolderListViewState setOverrideCollapsedFolder:](self, "setOverrideCollapsedFolder:", 0);
}

- (NSMutableSet)expandedFolderIdentifiers
{
  return self->_expandedFolderIdentifiers;
}

- (void)setExpandedFolderIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_expandedFolderIdentifiers, a3);
}

- (NSMutableSet)collapsedAccountIdentifiers
{
  return self->_collapsedAccountIdentifiers;
}

- (void)setCollapsedAccountIdentifiers:(id)a3
{
  objc_storeStrong((id *)&self->_collapsedAccountIdentifiers, a3);
}

- (BOOL)overrideCollapsed
{
  return self->_overrideCollapsed;
}

- (NSString)overrideCollapsedFolder
{
  return self->_overrideCollapsedFolder;
}

- (void)setOverrideCollapsedFolder:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSMutableArray)accounts
{
  return self->_accounts;
}

- (void)setAccounts:(id)a3
{
  objc_storeStrong((id *)&self->_accounts, a3);
}

- (NSCountedSet)folderNamesCountedSet
{
  return self->_folderNamesCountedSet;
}

- (void)setFolderNamesCountedSet:(id)a3
{
  objc_storeStrong((id *)&self->_folderNamesCountedSet, a3);
}

- (NSNumber)customFoldersExistValue
{
  return self->_customFoldersExistValue;
}

- (void)setCustomFoldersExistValue:(id)a3
{
  objc_storeStrong((id *)&self->_customFoldersExistValue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customFoldersExistValue, 0);
  objc_storeStrong((id *)&self->_folderNamesCountedSet, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_overrideCollapsedFolder, 0);
  objc_storeStrong((id *)&self->_collapsedAccountIdentifiers, 0);
  objc_storeStrong((id *)&self->_expandedFolderIdentifiers, 0);
}

@end
