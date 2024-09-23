@implementation SBRootFolder

- (BOOL)isRootFolder
{
  return 1;
}

- (unint64_t)indexOfList:(id)a3
{
  id v4;
  id v5;
  objc_super v7;

  v4 = a3;
  v5 = -[SBRootFolder _specialIndexOfList:](self, "_specialIndexOfList:", v4);
  if (v5 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v7.receiver = self;
    v7.super_class = (Class)SBRootFolder;
    v5 = -[SBFolder indexOfList:](&v7, sel_indexOfList_, v4);
  }

  return (unint64_t)v5;
}

- (unint64_t)visibleIndexOfList:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v7;

  v4 = a3;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if ((objc_msgSend(v4, "isHidden") & 1) == 0)
  {
    v5 = -[SBRootFolder _specialIndexOfList:](self, "_specialIndexOfList:", v4);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7.receiver = self;
      v7.super_class = (Class)SBRootFolder;
      v5 = -[SBFolder visibleIndexOfList:](&v7, sel_visibleIndexOfList_, v4);
    }
  }

  return v5;
}

- (unint64_t)_specialIndexOfList:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  unint64_t v9;

  v4 = a3;
  -[SBRootFolder dock](self, "dock");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  if (v5 == v4)
  {
    v9 = 10000;
  }
  else
  {
    -[SBRootFolder todayList](self, "todayList");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    if (v6 == v4)
    {
      v9 = 20000;
    }
    else
    {
      -[SBRootFolder favoriteTodayList](self, "favoriteTodayList");
      v7 = (id)objc_claimAutoreleasedReturnValue();

      if (v7 == v4)
      {
        v9 = 40000;
      }
      else
      {
        -[SBRootFolder ignoredList](self, "ignoredList");
        v8 = (id)objc_claimAutoreleasedReturnValue();

        if (v8 == v4)
          v9 = 30000;
        else
          v9 = 0x7FFFFFFFFFFFFFFFLL;
      }
    }
  }

  return v9;
}

- (SBIconListModel)dock
{
  SBIconListModel *dock;
  void *v4;
  SBIconListModel *v5;

  dock = self->_dock;
  if (!dock)
  {
    -[SBFolder iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBIconListModel initWithFolder:gridSize:gridSizeClassSizes:]([SBIconListModel alloc], "initWithFolder:gridSize:gridSizeClassSizes:", self, (unsigned __int16)-[SBRootFolder maxIconCountForDock](self, "maxIconCountForDock") | 0x10000, v4);
    -[SBRootFolder _setDock:](self, "_setDock:", v5);

    dock = self->_dock;
  }
  return dock;
}

- (SBIconListModel)ignoredList
{
  SBIconListModel *ignoredList;
  void *v4;
  SBIconListModel *v5;

  ignoredList = self->_ignoredList;
  if (!ignoredList)
  {
    -[SBFolder iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBIconListModel initWithFolder:gridSize:gridSizeClassSizes:]([SBIconListModel alloc], "initWithFolder:gridSize:gridSizeClassSizes:", self, 0xFFFFFFFFLL, v4);
    -[SBIconListModel setFixedIconLocationBehavior:](v5, "setFixedIconLocationBehavior:", 0);
    -[SBRootFolder _setIgnoredList:](self, "_setIgnoredList:", v5);

    ignoredList = self->_ignoredList;
  }
  return ignoredList;
}

- (SBIconListModel)todayList
{
  SBIconListModel *todayList;
  void *v4;
  SBIconListModel *v5;

  todayList = self->_todayList;
  if (!todayList)
  {
    -[SBFolder iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBIconListModel initWithFolder:gridSize:gridSizeClassSizes:]([SBIconListModel alloc], "initWithFolder:gridSize:gridSizeClassSizes:", self, (unsigned __int16)-[SBRootFolder columnCountForTodayList](self, "columnCountForTodayList") | 0xFFFF0000, v4);
    -[SBIconListModel setFixedIconLocationBehavior:](v5, "setFixedIconLocationBehavior:", 0);
    -[SBRootFolder _setTodayList:](self, "_setTodayList:", v5);

    todayList = self->_todayList;
  }
  return todayList;
}

- (SBIconListModel)favoriteTodayList
{
  SBIconListModel *favoriteTodayList;
  void *v4;
  SBIconListModel *v5;

  favoriteTodayList = self->_favoriteTodayList;
  if (!favoriteTodayList)
  {
    -[SBFolder iconGridSizeClassSizes](self, "iconGridSizeClassSizes");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[SBIconListModel initWithFolder:gridSize:gridSizeClassSizes:]([SBIconListModel alloc], "initWithFolder:gridSize:gridSizeClassSizes:", self, (unsigned __int16)-[SBRootFolder columnCountForTodayList](self, "columnCountForTodayList") | 0xFFFF0000, v4);
    -[SBIconListModel setFixedIconLocationBehavior:](v5, "setFixedIconLocationBehavior:", 0);
    -[SBRootFolder _setFavoriteTodayList:](self, "_setFavoriteTodayList:", v5);

    favoriteTodayList = self->_favoriteTodayList;
  }
  return favoriteTodayList;
}

- (id)listAtIndex:(unint64_t)a3
{
  void *v3;
  objc_super v5;

  if ((uint64_t)a3 > 29999)
  {
    if (a3 == 30000)
    {
      -[SBRootFolder ignoredList](self, "ignoredList");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
    if (a3 == 40000)
    {
      -[SBRootFolder favoriteTodayList](self, "favoriteTodayList");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      return v3;
    }
LABEL_8:
    v5.receiver = self;
    v5.super_class = (Class)SBRootFolder;
    -[SBFolder listAtIndex:](&v5, sel_listAtIndex_);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (a3 == 10000)
  {
    -[SBRootFolder dock](self, "dock");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    return v3;
  }
  if (a3 != 20000)
    goto LABEL_8;
  -[SBRootFolder todayList](self, "todayList");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  return v3;
}

- (id)nodeIdentifier
{
  return 0;
}

- (void)enumerateExtraListsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (void (**)(id, void *, uint64_t, _BYTE *))a3;
  v9 = 0;
  -[SBRootFolder _dockIfExists](self, "_dockIfExists");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (v4[2](v4, v5, 10000, &v9), !v9))
  {
    -[SBRootFolder _todayListIfExists](self, "_todayListIfExists");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6 || (v4[2](v4, v6, 20000, &v9), !v9))
    {
      -[SBRootFolder _favoriteTodayListIfExists](self, "_favoriteTodayListIfExists");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v7 || (v4[2](v4, v7, 40000, &v9), !v9))
      {
        -[SBRootFolder _ignoredListIfExists](self, "_ignoredListIfExists");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (v8)
          v4[2](v4, v8, 30000, &v9);

      }
    }

  }
}

- (id)_dockIfExists
{
  return self->_dock;
}

- (id)_todayListIfExists
{
  return self->_todayList;
}

- (id)_ignoredListIfExists
{
  return self->_ignoredList;
}

- (id)_favoriteTodayListIfExists
{
  return self->_favoriteTodayList;
}

- (BOOL)isExtraListIndex:(unint64_t)a3
{
  uint64_t v3;
  uint64_t v4;
  BOOL result;
  uint64_t v7;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;

  result = 1;
  if ((uint64_t)a3 > 29999)
  {
    if (a3 == 30000)
      return result;
    v7 = 40000;
  }
  else
  {
    if (a3 == 10000)
      return result;
    v7 = 20000;
  }
  if (a3 != v7)
  {
    v9 = v3;
    v10 = v4;
    v8.receiver = self;
    v8.super_class = (Class)SBRootFolder;
    return -[SBFolder isExtraListIndex:](&v8, sel_isExtraListIndex_);
  }
  return result;
}

- (BOOL)supportsBadging
{
  return 1;
}

- (SBRootFolderDelegate)delegate
{
  return (SBRootFolderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)_compactsFirstList
{
  return 0;
}

- (SBRootFolder)initWithFolder:(id)a3 options:(unint64_t)a4
{
  id v6;
  SBRootFolder *v7;
  void *v8;
  char isKindOfClass;
  _QWORD *v10;
  _QWORD *v11;
  SBIconListModel *v12;
  SBIconListModel *v13;
  SBIconListModel *v14;
  SBIconListModel *v15;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)SBRootFolder;
  v7 = -[SBFolder initWithFolder:options:](&v17, sel_initWithFolder_options_, v6, a4);
  if (v7)
  {
    objc_opt_self();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    isKindOfClass = objc_opt_isKindOfClass();

    if ((isKindOfClass & 1) != 0)
    {
      v10 = v6;
      v11 = v10;
      if ((a4 & 0xA) == 0)
      {
        if (v10[29])
        {
          v12 = -[SBIconListModel initWithIconListModel:copyLeafIcons:]([SBIconListModel alloc], "initWithIconListModel:copyLeafIcons:", v10[29], a4 & 1);
          -[SBIconListModel _changeFolderDuringCopy:](v12, "_changeFolderDuringCopy:", v7);
          -[SBRootFolder _setDock:](v7, "_setDock:", v12);

        }
        if (v11[30])
        {
          v13 = -[SBIconListModel initWithIconListModel:copyLeafIcons:]([SBIconListModel alloc], "initWithIconListModel:copyLeafIcons:", v11[30], a4 & 1);
          -[SBIconListModel _changeFolderDuringCopy:](v13, "_changeFolderDuringCopy:", v7);
          -[SBRootFolder _setTodayList:](v7, "_setTodayList:", v13);

        }
        if (v11[31])
        {
          v14 = -[SBIconListModel initWithIconListModel:copyLeafIcons:]([SBIconListModel alloc], "initWithIconListModel:copyLeafIcons:", v11[31], a4 & 1);
          -[SBIconListModel _changeFolderDuringCopy:](v14, "_changeFolderDuringCopy:", v7);
          -[SBRootFolder _setFavoriteTodayList:](v7, "_setFavoriteTodayList:", v14);

        }
        if ((a4 & 0xE) == 0 && v11[32])
        {
          v15 = -[SBIconListModel initWithIconListModel:copyLeafIcons:]([SBIconListModel alloc], "initWithIconListModel:copyLeafIcons:", v11[32], a4 & 1);
          -[SBIconListModel _changeFolderDuringCopy:](v15, "_changeFolderDuringCopy:", v7);
          -[SBRootFolder _setIgnoredList:](v7, "_setIgnoredList:", v15);

        }
      }

    }
  }

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[SBRootFolder _tearDownIgnoredListConsistencyCheckRunLoopObserverIfNeeded](self, "_tearDownIgnoredListConsistencyCheckRunLoopObserverIfNeeded");
  v3.receiver = self;
  v3.super_class = (Class)SBRootFolder;
  -[SBRootFolder dealloc](&v3, sel_dealloc);
}

- (BOOL)canRemoveIcons
{
  return 0;
}

- (BOOL)canEditDisplayName
{
  return 0;
}

- (id)badge
{
  return 0;
}

- (unint64_t)maxIconCountForDock
{
  void *v3;
  uint64_t v4;
  SBIconListModel *dock;
  unint64_t v6;

  -[SBRootFolder delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "maxIconCountForDockForRootFolder:", self);
  }
  else
  {
    dock = self->_dock;
    if (!dock)
    {
      v6 = 4;
      goto LABEL_7;
    }
    v4 = -[SBIconListModel maxNumberOfIcons](dock, "maxNumberOfIcons");
  }
  v6 = v4;
LABEL_7:

  return v6;
}

- (id)allowedGridSizeClassesForDock
{
  void *v3;
  uint64_t v4;
  SBIconListModel *dock;
  void *v6;

  -[SBRootFolder delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "allowedGridSizeClassesForDockForRootFolder:", self);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    dock = self->_dock;
    if (dock)
      -[SBIconListModel allowedGridSizeClasses](dock, "allowedGridSizeClasses");
    else
      +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass](SBHIconGridSizeClassSet, "gridSizeClassSetForDefaultGridSizeClass");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v4;

  return v6;
}

- (unint64_t)columnCountForTodayList
{
  void *v3;
  unint64_t v4;
  SBIconListModel *todayList;

  -[SBRootFolder delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v4 = objc_msgSend(v3, "columnCountForTodayListForRootFolder:", self);
  }
  else
  {
    todayList = self->_todayList;
    if (todayList)
      v4 = (unsigned __int16)-[SBIconListModel gridSize](todayList, "gridSize");
    else
      v4 = 4;
  }

  return v4;
}

- (id)allowedGridSizeClassesForTodayList
{
  void *v3;
  uint64_t v4;
  SBIconListModel *todayList;
  SBHIconGridSizeClassSet *v6;
  SBHIconGridSizeClassSet *v7;
  void *v8;

  -[SBRootFolder delegate](self, "delegate");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "allowedGridSizeClassesForTodayListForRootFolder:", self);
    v4 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    todayList = self->_todayList;
    if (!todayList)
    {
      v7 = [SBHIconGridSizeClassSet alloc];
      objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("SBHIconGridSizeClassSmall"), CFSTR("SBHIconGridSizeClassMedium"), CFSTR("SBHIconGridSizeClassLarge"), 0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = -[SBHIconGridSizeClassSet initWithGridSizeClasses:](v7, "initWithGridSizeClasses:", v8);

      goto LABEL_7;
    }
    -[SBIconListModel allowedGridSizeClasses](todayList, "allowedGridSizeClasses");
    v4 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (SBHIconGridSizeClassSet *)v4;
LABEL_7:

  return v6;
}

- (void)_setDock:(id)a3
{
  SBIconListModel *v5;
  SBIconListModel **p_dock;
  SBIconListModel *dock;
  void *v8;
  SBIconListModel *v9;

  v5 = (SBIconListModel *)a3;
  p_dock = &self->_dock;
  dock = self->_dock;
  v9 = v5;
  if (dock != v5)
  {
    if (dock)
    {
      -[SBFolder _willRemoveList:atIndex:informObservers:](self, "_willRemoveList:atIndex:informObservers:", dock, 10000, 0);
      -[SBFolder _didRemoveList:atIndex:informObservers:](self, "_didRemoveList:atIndex:informObservers:", *p_dock, 10000, 0);
      -[SBIconListModel removeNodeObserver:](*p_dock, "removeNodeObserver:", self);
    }
    objc_storeStrong((id *)&self->_dock, a3);
    if (*p_dock)
    {
      -[SBRootFolder allowedGridSizeClassesForDock](self, "allowedGridSizeClassesForDock");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListModel setAllowedGridSizeClasses:](*p_dock, "setAllowedGridSizeClasses:", v8);
      -[SBIconListModel setFixedIconLocationBehavior:](*p_dock, "setFixedIconLocationBehavior:", 0);
      -[SBFolder _didAddList:informObservers:](self, "_didAddList:informObservers:", *p_dock, 0);
      -[SBIconListModel addNodeObserver:](*p_dock, "addNodeObserver:", self);

    }
  }

}

- (void)setDelegate:(id)a3
{
  id WeakRetained;
  id v5;
  id obj;

  obj = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    v5 = objc_loadWeakRetained((id *)&self->_delegate);
    objc_storeWeak((id *)&self->_delegate, obj);
    -[SBRootFolder delegateDidChange:](self, "delegateDidChange:", v5);

  }
}

- (void)delegateDidChange:(id)a3
{
  void *v4;
  id v5;

  -[SBRootFolder allowedGridSizeClassesForDock](self, "allowedGridSizeClassesForDock", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SBRootFolder allowedGridSizeClassesForTodayList](self, "allowedGridSizeClassesForTodayList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBIconListModel setAllowedGridSizeClasses:](self->_dock, "setAllowedGridSizeClasses:", v5);
  -[SBIconListModel setAllowedGridSizeClasses:](self->_todayList, "setAllowedGridSizeClasses:", v4);
  -[SBIconListModel setAllowedGridSizeClasses:](self->_favoriteTodayList, "setAllowedGridSizeClasses:", v4);

}

- (BOOL)isIconAtIndexPathInDock:(id)a3
{
  return -[SBRootFolder isIconAtIndexPathInDock:includingDockFolders:](self, "isIconAtIndexPathInDock:includingDockFolders:", a3, 0);
}

- (BOOL)isIconAtIndexPathInDock:(id)a3 includingDockFolders:(BOOL)a4
{
  id v5;
  uint64_t v6;
  BOOL v7;

  v5 = a3;
  v6 = objc_msgSend(v5, "sbListIndex");
  v7 = v6 == 10000 && a4;
  if (!a4 && v6 == 10000)
    v7 = objc_msgSend(v5, "sb_iconPathCount") == 1;

  return v7;
}

- (void)_setTodayList:(id)a3
{
  SBIconListModel *v5;
  SBIconListModel **p_todayList;
  SBIconListModel *todayList;
  void *v8;
  SBIconListModel *v9;

  v5 = (SBIconListModel *)a3;
  p_todayList = &self->_todayList;
  todayList = self->_todayList;
  v9 = v5;
  if (todayList != v5)
  {
    if (todayList)
    {
      -[SBFolder _willRemoveList:atIndex:informObservers:](self, "_willRemoveList:atIndex:informObservers:", todayList, 20000, 0);
      -[SBFolder _didRemoveList:atIndex:informObservers:](self, "_didRemoveList:atIndex:informObservers:", *p_todayList, 20000, 0);
      -[SBIconListModel removeNodeObserver:](*p_todayList, "removeNodeObserver:", self);
    }
    objc_storeStrong((id *)&self->_todayList, a3);
    -[SBIconListModel setDelegate:](*p_todayList, "setDelegate:", self);
    if (*p_todayList)
    {
      -[SBRootFolder allowedGridSizeClassesForTodayList](self, "allowedGridSizeClassesForTodayList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListModel setAllowedGridSizeClasses:](*p_todayList, "setAllowedGridSizeClasses:", v8);
      -[SBIconListModel setIconLayoutBehavior:](*p_todayList, "setIconLayoutBehavior:", 1);
      -[SBIconListModel setFixedIconLocationBehavior:](*p_todayList, "setFixedIconLocationBehavior:", 0);
      -[SBFolder _didAddList:informObservers:](self, "_didAddList:informObservers:", *p_todayList, 0);
      -[SBIconListModel addNodeObserver:](*p_todayList, "addNodeObserver:", self);

    }
  }

}

- (BOOL)isIconAtIndexPathInTodayList:(id)a3
{
  return objc_msgSend(a3, "sbListIndex") == 20000;
}

- (void)_setFavoriteTodayList:(id)a3
{
  SBIconListModel *v5;
  SBIconListModel **p_favoriteTodayList;
  SBIconListModel *favoriteTodayList;
  void *v8;
  SBIconListModel *v9;

  v5 = (SBIconListModel *)a3;
  p_favoriteTodayList = &self->_favoriteTodayList;
  favoriteTodayList = self->_favoriteTodayList;
  v9 = v5;
  if (favoriteTodayList != v5)
  {
    if (favoriteTodayList)
    {
      -[SBFolder _willRemoveList:atIndex:informObservers:](self, "_willRemoveList:atIndex:informObservers:", favoriteTodayList, 40000, 0);
      -[SBFolder _didRemoveList:atIndex:informObservers:](self, "_didRemoveList:atIndex:informObservers:", *p_favoriteTodayList, 40000, 0);
      -[SBIconListModel removeNodeObserver:](*p_favoriteTodayList, "removeNodeObserver:", self);
    }
    objc_storeStrong((id *)&self->_favoriteTodayList, a3);
    -[SBIconListModel setDelegate:](*p_favoriteTodayList, "setDelegate:", self);
    if (*p_favoriteTodayList)
    {
      -[SBRootFolder allowedGridSizeClassesForTodayList](self, "allowedGridSizeClassesForTodayList");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListModel setAllowedGridSizeClasses:](*p_favoriteTodayList, "setAllowedGridSizeClasses:", v8);
      -[SBIconListModel setIconLayoutBehavior:](*p_favoriteTodayList, "setIconLayoutBehavior:", 1);
      -[SBIconListModel setFixedIconLocationBehavior:](*p_favoriteTodayList, "setFixedIconLocationBehavior:", 0);
      -[SBFolder _didAddList:informObservers:](self, "_didAddList:informObservers:", *p_favoriteTodayList, 0);
      -[SBIconListModel addNodeObserver:](*p_favoriteTodayList, "addNodeObserver:", self);

    }
  }

}

- (BOOL)isIconAtIndexPathInFavoriteTodayList:(id)a3
{
  return objc_msgSend(a3, "sbListIndex") == 40000;
}

- (void)enumerateTodayListsUsingBlock:(id)a3
{
  void (**v4)(id, void *, uint64_t, _BYTE *);
  void *v5;
  void *v6;
  char v7;
  char v8;

  v4 = (void (**)(id, void *, uint64_t, _BYTE *))a3;
  -[SBRootFolder todayList](self, "todayList");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5 || (v8 = 0, v4[2](v4, v5, 20000, &v8), !v8))
  {
    -[SBRootFolder favoriteTodayList](self, "favoriteTodayList");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v7 = 0;
      v4[2](v4, v6, 40000, &v7);
    }

  }
}

- (void)enumerateTodayListIconsUsingBlock:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SBRootFolder_enumerateTodayListIconsUsingBlock___block_invoke;
  v6[3] = &unk_1E8D8E458;
  v7 = v4;
  v5 = v4;
  -[SBRootFolder enumerateTodayListsUsingBlock:](self, "enumerateTodayListsUsingBlock:", v6);

}

void __50__SBRootFolder_enumerateTodayListIconsUsingBlock___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  _QWORD v6[4];
  id v7;
  uint64_t v8;
  uint64_t v9;

  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__SBRootFolder_enumerateTodayListIconsUsingBlock___block_invoke_2;
  v6[3] = &unk_1E8D8E430;
  v8 = a3;
  v7 = *(id *)(a1 + 32);
  v9 = a4;
  objc_msgSend(a2, "enumerateIconsUsingBlock:", v6);

}

void __50__SBRootFolder_enumerateTodayListIconsUsingBlock___block_invoke_2(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  char v11;

  v7 = (void *)MEMORY[0x1E0CB36B0];
  v8 = *(_QWORD *)(a1 + 40);
  v9 = a2;
  objc_msgSend(v7, "indexPathWithIconIndex:listIndex:", a3, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 0;
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  if (v11)
  {
    *a4 = 1;
    **(_BYTE **)(a1 + 48) = 1;
  }

}

- (void)_setIgnoredList:(id)a3
{
  SBIconListModel *v5;
  SBIconListModel **p_ignoredList;
  SBIconListModel *ignoredList;
  SBIconListModel *v8;
  void *v9;
  SBIconListModel *v10;
  void *v11;
  SBIconListModel *v12;

  v5 = (SBIconListModel *)a3;
  p_ignoredList = &self->_ignoredList;
  ignoredList = self->_ignoredList;
  v12 = v5;
  if (ignoredList != v5)
  {
    if (ignoredList)
    {
      -[SBFolder _willRemoveList:atIndex:informObservers:](self, "_willRemoveList:atIndex:informObservers:", ignoredList, 30000, 0);
      -[SBFolder _didRemoveList:atIndex:informObservers:](self, "_didRemoveList:atIndex:informObservers:", *p_ignoredList, 30000, 0);
      -[SBIconListModel removeNodeObserver:](*p_ignoredList, "removeNodeObserver:", self);
    }
    objc_storeStrong((id *)&self->_ignoredList, a3);
    v8 = *p_ignoredList;
    if (*p_ignoredList)
    {
      +[SBHIconGridSizeClassSet gridSizeClassSetForDefaultGridSizeClass](SBHIconGridSizeClassSet, "gridSizeClassSetForDefaultGridSizeClass");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListModel setAllowedGridSizeClasses:](v8, "setAllowedGridSizeClasses:", v9);

      v10 = *p_ignoredList;
      objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[SBIconListModel setHidden:byUser:hiddenDate:](v10, "setHidden:byUser:hiddenDate:", 1, 1, v11);

      -[SBIconListModel setFixedIconLocationBehavior:](*p_ignoredList, "setFixedIconLocationBehavior:", 0);
      -[SBFolder _didAddList:informObservers:](self, "_didAddList:informObservers:", *p_ignoredList, 0);
      -[SBIconListModel addNodeObserver:](*p_ignoredList, "addNodeObserver:", self);
    }
  }

}

- (BOOL)isIconAtIndexPathInIgnoredList:(id)a3
{
  return objc_msgSend(a3, "sbListIndex") == 30000;
}

- (BOOL)isIconInIgnoredList:(id)a3
{
  SBRootFolder *v3;
  void *v4;

  v3 = self;
  -[SBFolder indexPathForIcon:](self, "indexPathForIcon:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = -[SBRootFolder isIconAtIndexPathInIgnoredList:](v3, "isIconAtIndexPathInIgnoredList:", v4);

  return (char)v3;
}

- (void)scheduleIgnoredListConsistencyCheck
{
  const __CFAllocator *v3;
  __CFRunLoop *Main;
  _QWORD v5[4];
  id v6;
  id location;

  if (!self->_checkIgnoredListRunLoopObserver)
  {
    objc_initWeak(&location, self);
    v3 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __51__SBRootFolder_scheduleIgnoredListConsistencyCheck__block_invoke;
    v5[3] = &unk_1E8D856A8;
    objc_copyWeak(&v6, &location);
    self->_checkIgnoredListRunLoopObserver = CFRunLoopObserverCreateWithHandler(v3, 0xA0uLL, 0, 1999800, v5);
    Main = CFRunLoopGetMain();
    CFRunLoopAddObserver(Main, self->_checkIgnoredListRunLoopObserver, (CFRunLoopMode)*MEMORY[0x1E0C9B270]);
    objc_destroyWeak(&v6);
    objc_destroyWeak(&location);
  }
}

void __51__SBRootFolder_scheduleIgnoredListConsistencyCheck__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "checkIgnoredListConsistency");

}

- (void)_tearDownIgnoredListConsistencyCheckRunLoopObserverIfNeeded
{
  __CFRunLoopObserver *checkIgnoredListRunLoopObserver;

  checkIgnoredListRunLoopObserver = self->_checkIgnoredListRunLoopObserver;
  if (checkIgnoredListRunLoopObserver)
  {
    CFRunLoopObserverInvalidate(checkIgnoredListRunLoopObserver);
    CFRelease(self->_checkIgnoredListRunLoopObserver);
    self->_checkIgnoredListRunLoopObserver = 0;
  }
}

- (void)checkIgnoredListConsistency
{
  uint64_t v3;
  unint64_t v4;
  unint64_t i;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id *v12;
  id v13;
  id v14;
  _QWORD v15[4];
  void *v16;
  _QWORD v17[4];
  void *v18;

  -[SBRootFolder _tearDownIgnoredListConsistencyCheckRunLoopObserverIfNeeded](self, "_tearDownIgnoredListConsistencyCheckRunLoopObserverIfNeeded");
  -[SBRootFolder setCheckingIgnoredListConsistency:](self, "setCheckingIgnoredListConsistency:", 1);
  -[SBRootFolder ignoredList](self, "ignoredList");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v14, "numberOfIcons");
  if (v3)
  {
    v4 = v3;
    for (i = 0; i < v4; ++i)
    {
      objc_msgSend(v14, "iconAtIndex:", i);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "isApplicationIcon"))
      {
        v7 = v6;
        objc_msgSend(v7, "applicationBundleID");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "leafIdentifierAndApplicationBundleIDMatches"))
        {
          v17[0] = MEMORY[0x1E0C809B0];
          v17[1] = 3221225472;
          v17[2] = __43__SBRootFolder_checkIgnoredListConsistency__block_invoke;
          v17[3] = &unk_1E8D857D8;
          v18 = v8;
          v9 = v8;
          -[SBFolder indexPathForIconWithOptions:passingTest:](self, "indexPathForIconWithOptions:passingTest:", 1, v17);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            -[SBFolder iconAtIndexPath:](self, "iconAtIndexPath:", v10);
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            if (!-[SBRootFolder isIconInIgnoredList:](self, "isIconInIgnoredList:", v11))
            {
              objc_msgSend(v14, "removeIconAtIndex:", i--);
              --v4;
              if (!-[SBFolder replaceIcon:withIcon:options:](self, "replaceIcon:withIcon:options:", v11, v7, 0))
                objc_msgSend(v14, "addIcon:", v7);
            }

          }
          v12 = &v18;
        }
        else
        {
          v15[0] = MEMORY[0x1E0C809B0];
          v15[1] = 3221225472;
          v15[2] = __43__SBRootFolder_checkIgnoredListConsistency__block_invoke_2;
          v15[3] = &unk_1E8D857D8;
          v16 = v8;
          v13 = v8;
          -[SBFolder indexPathForIconWithOptions:passingTest:](self, "indexPathForIconWithOptions:passingTest:", 1, v15);
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          if (v10)
          {
            objc_msgSend(v14, "removeIconAtIndex:", i--);
            --v4;
          }
          v12 = &v16;
        }

      }
    }
  }
  -[SBRootFolder setCheckingIgnoredListConsistency:](self, "setCheckingIgnoredListConsistency:", 0);

}

uint64_t __43__SBRootFolder_checkIgnoredListConsistency__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;

  v3 = a2;
  if (objc_msgSend(v3, "isApplicationIcon")
    && (objc_msgSend(v3, "leafIdentifierAndApplicationBundleIDMatches") & 1) == 0)
  {
    objc_msgSend(v3, "applicationBundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t __43__SBRootFolder_checkIgnoredListConsistency__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(v3, "isApplicationIcon")
    && objc_msgSend(v3, "leafIdentifierAndApplicationBundleIDMatches"))
  {
    objc_msgSend(v3, "applicationBundleID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *(_QWORD *)(a1 + 32));

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)canBounceIcon:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;

  v4 = a3;
  if (objc_msgSend(v4, "isLeafIcon"))
  {
    -[SBRootFolder model](self, "model");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "leafIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "desiredIndexPathForIconWithIdentifier:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      -[SBFolder indexPathForIcon:](self, "indexPathForIcon:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8 && objc_msgSend(v8, "isEqual:", v7))
      {
        -[SBRootFolder delegate](self, "delegate");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = v10;
        if (v10)
          v12 = objc_msgSend(v10, "rootFolder:canBounceIcon:", self, v4);
        else
          v12 = 0;

      }
      else
      {
        v12 = 1;
      }

    }
    else
    {
      v12 = 1;
    }

  }
  else
  {
    v12 = 1;
  }

  return v12;
}

- (id)icons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBRootFolder;
  -[SBFolder icons](&v9, sel_icons);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBRootFolder dock](self, "dock");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "icons");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "arrayByAddingObjectsFromArray:", v6);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }

  return v3;
}

- (BOOL)containsWidgetIconExcludingTodayList
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__SBRootFolder_containsWidgetIconExcludingTodayList__block_invoke;
  v4[3] = &unk_1E8D8CCD8;
  v4[4] = self;
  v4[5] = &v5;
  -[SBFolder enumerateAllIconsWithOptions:usingBlock:](self, "enumerateAllIconsWithOptions:usingBlock:", 1, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __52__SBRootFolder_containsWidgetIconExcludingTodayList__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;

  v7 = a3;
  if (objc_msgSend(a2, "isWidgetIcon")
    && (objc_msgSend(*(id *)(a1 + 32), "isIconAtIndexPathInTodayList:", v7) & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }

}

- (BOOL)containsVisibleWidgetIconExcludingTodayList
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = -[SBFolder visibleWidgetIconCount](self, "visibleWidgetIconCount");
  -[SBRootFolder todayList](self, "todayList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfIcons");

  -[SBRootFolder favoriteTodayList](self, "favoriteTodayList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfIcons");

  return v3 > v7 + v5;
}

- (BOOL)containsNonDefaultSizedIconExcludingTodayList
{
  char v2;
  _QWORD v4[6];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__SBRootFolder_containsNonDefaultSizedIconExcludingTodayList__block_invoke;
  v4[3] = &unk_1E8D8CCD8;
  v4[4] = self;
  v4[5] = &v5;
  -[SBFolder enumerateAllIconsWithOptions:usingBlock:](self, "enumerateAllIconsWithOptions:usingBlock:", 1, v4);
  v2 = *((_BYTE *)v6 + 24);
  _Block_object_dispose(&v5, 8);
  return v2;
}

void __61__SBRootFolder_containsNonDefaultSizedIconExcludingTodayList__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  id v7;
  __CFString *v8;
  void *v9;
  char v10;
  id v11;

  v11 = a2;
  v7 = a3;
  objc_msgSend(v11, "gridSizeClass");
  v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v8 == CFSTR("SBHIconGridSizeClassDefault"))
    goto LABEL_4;
  objc_msgSend(v11, "gridSizeClass");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", CFSTR("SBHIconGridSizeClassDefault")))
  {

LABEL_4:
    goto LABEL_5;
  }
  v10 = objc_msgSend(*(id *)(a1 + 32), "isIconAtIndexPathInTodayList:", v7);

  if ((v10 & 1) == 0)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
LABEL_5:

}

- (BOOL)containsVisibleNonDefaultSizedIconExcludingTodayList
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;

  v3 = -[SBFolder visibleWidgetIconCount](self, "visibleWidgetIconCount");
  -[SBRootFolder todayList](self, "todayList");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfIcons");

  -[SBRootFolder favoriteTodayList](self, "favoriteTodayList");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "numberOfIcons");

  return v3 > v7 + v5;
}

- (void)_didExplicitlyRemoveHiddenLists:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)SBRootFolder;
  -[SBFolder _didExplicitlyRemoveHiddenLists:](&v18, sel__didExplicitlyRemoveHiddenLists_, v4);
  v5 = objc_alloc_init(MEMORY[0x1E0C99E20]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v10++), "addIconsPassingTest:toSet:", &__block_literal_global_80, v5, (_QWORD)v14);
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v8);
  }

  -[SBRootFolder ignoredList](self, "ignoredList");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)objc_msgSend(v11, "addIcons:", v12);

}

uint64_t __48__SBRootFolder__didExplicitlyRemoveHiddenLists___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  uint64_t v3;

  v2 = a2;
  if (objc_msgSend(v2, "isLeafIcon"))
    v3 = objc_msgSend(v2, "isWidgetIcon") ^ 1;
  else
    v3 = 0;

  return v3;
}

- (id)_handleBumpedIcons:(id)a3 afterInsertingIconIntoListAtIndex:(unint64_t)a4 listGridCellInfoOptions:(unint64_t)a5 mutationOptions:(unint64_t)a6 didBump:(BOOL *)a7
{
  void *v8;
  unint64_t v9;
  unint64_t v10;
  BOOL v11;
  void *v12;
  id v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SBRootFolder;
  -[SBFolder _handleBumpedIcons:afterInsertingIconIntoListAtIndex:listGridCellInfoOptions:mutationOptions:didBump:](&v15, sel__handleBumpedIcons_afterInsertingIconIntoListAtIndex_listGridCellInfoOptions_mutationOptions_didBump_, a3, a4, a5, a6, a7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[SBFolder visibleListCount](self, "visibleListCount");
  v10 = -[SBFolder maxListCount](self, "maxListCount");
  if (v8)
    v11 = v9 >= v10;
  else
    v11 = 0;
  if (v11)
  {
    -[SBRootFolder ignoredList](self, "ignoredList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (id)objc_msgSend(v12, "addIcons:", v8);

  }
  return v8;
}

- (id)nodeDescriptionWithPrefix:(id)a3
{
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v4 = (void *)MEMORY[0x1E0CB37A0];
  v5 = (__CFString *)a3;
  objc_msgSend(v4, "string");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x1D17DF4E4]();
  v8 = &stru_1E8D8E958;
  if (v5)
    v8 = v5;
  v9 = v8;

  SBIconIndexDebugStringForNodeIdentifier(self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v10);

  -[__CFString stringByAppendingString:](v9, "stringByAppendingString:", CFSTR("   R "));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", CFSTR("\n"));
  objc_msgSend(v6, "appendString:", v11);
  objc_msgSend(v6, "appendString:", CFSTR("Dock:"));
  objc_msgSend(v6, "appendString:", CFSTR("\n"));
  -[SBRootFolder dock](self, "dock");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "nodeDescriptionWithPrefix:", v11);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v13);

  objc_msgSend(v6, "appendString:", CFSTR("\n"));
  objc_msgSend(v6, "appendString:", v11);
  objc_msgSend(v6, "appendString:", CFSTR("Pages:"));
  objc_msgSend(v6, "appendString:", CFSTR("\n"));
  v16.receiver = self;
  v16.super_class = (Class)SBRootFolder;
  -[SBFolder nodeDescriptionWithPrefix:](&v16, sel_nodeDescriptionWithPrefix_, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendString:", v14);

  objc_autoreleasePoolPop(v7);
  return v6;
}

- (void)_notifyIndexChange:(int)a3 identifiers:(id)a4 withValidationBlock:(id)a5
{
  id v8;
  unsigned int (**v9)(id, _QWORD);
  void *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t j;
  void *v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v8 = a4;
  v9 = (unsigned int (**)(id, _QWORD))a5;
  v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E20]), "initWithCapacity:", objc_msgSend(v8, "count"));
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v11 = v8;
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v28 != v14)
          objc_enumerationMutation(v11);
        v16 = *(_QWORD *)(*((_QWORD *)&v27 + 1) + 8 * i);
        if (v9[2](v9, v16))
          objc_msgSend(v10, "addObject:", v16);
      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v13);
  }

  if (objc_msgSend(v10, "count"))
  {
    v25 = 0u;
    v26 = 0u;
    v23 = 0u;
    v24 = 0u;
    -[NSHashTable allObjects](self->super._nodeObservers, "allObjects", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    if (v18)
    {
      v19 = v18;
      v20 = *(_QWORD *)v24;
      do
      {
        for (j = 0; j != v19; ++j)
        {
          if (*(_QWORD *)v24 != v20)
            objc_enumerationMutation(v17);
          v22 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * j);
          if (a3)
            objc_msgSend(v22, "node:didRemoveContainedNodeIdentifiers:", self, v10);
          else
            objc_msgSend(v22, "node:didAddContainedNodeIdentifiers:", self, v10);
        }
        v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
      }
      while (v19);
    }

  }
}

- (void)node:(id)a3 didAddContainedNodeIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SBRootFolder *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __52__SBRootFolder_node_didAddContainedNodeIdentifiers___block_invoke;
  v10[3] = &unk_1E8D87E68;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[SBRootFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v10);

}

uint64_t __52__SBRootFolder_node_didAddContainedNodeIdentifiers___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  if (*(_QWORD *)(result + 32) == a2)
  {
    v2 = result;
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 8), "count");
    if (result)
    {
      v3 = *(void **)(v2 + 40);
      v4 = *(_QWORD *)(v2 + 48);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __52__SBRootFolder_node_didAddContainedNodeIdentifiers___block_invoke_2;
      v5[3] = &unk_1E8D8E480;
      v5[4] = v3;
      return objc_msgSend(v3, "_notifyIndexChange:identifiers:withValidationBlock:", 0, v4, v5);
    }
  }
  return result;
}

uint64_t __52__SBRootFolder_node_didAddContainedNodeIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsNodeIdentifier:", a2) ^ 1;
}

- (void)node:(id)a3 didRemoveContainedNodeIdentifiers:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD v10[4];
  id v11;
  SBRootFolder *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __55__SBRootFolder_node_didRemoveContainedNodeIdentifiers___block_invoke;
  v10[3] = &unk_1E8D87E68;
  v11 = v6;
  v12 = self;
  v13 = v7;
  v8 = v7;
  v9 = v6;
  -[SBRootFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v10);

}

uint64_t __55__SBRootFolder_node_didRemoveContainedNodeIdentifiers___block_invoke(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  void *v3;
  uint64_t v4;
  _QWORD v5[5];

  if (*(_QWORD *)(result + 32) == a2)
  {
    v2 = result;
    result = objc_msgSend(*(id *)(*(_QWORD *)(result + 40) + 8), "count");
    if (result)
    {
      v3 = *(void **)(v2 + 40);
      v4 = *(_QWORD *)(v2 + 48);
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __55__SBRootFolder_node_didRemoveContainedNodeIdentifiers___block_invoke_2;
      v5[3] = &unk_1E8D8E480;
      v5[4] = v3;
      return objc_msgSend(v3, "_notifyIndexChange:identifiers:withValidationBlock:", 1, v4, v5);
    }
  }
  return result;
}

uint64_t __55__SBRootFolder_node_didRemoveContainedNodeIdentifiers___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "containsNodeIdentifier:", a2) ^ 1;
}

- (void)nodeDidMoveContainedNodes:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;
  SBRootFolder *v8;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __42__SBRootFolder_nodeDidMoveContainedNodes___block_invoke;
  v6[3] = &unk_1E8D87B00;
  v7 = v4;
  v8 = self;
  v5 = v4;
  -[SBRootFolder enumerateExtraListsUsingBlock:](self, "enumerateExtraListsUsingBlock:", v6);

}

void __42__SBRootFolder_nodeDidMoveContainedNodes___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (*(_QWORD *)(a1 + 32) == a2)
  {
    v10 = 0u;
    v11 = 0u;
    v8 = 0u;
    v9 = 0u;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 8), "allObjects", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v9;
      do
      {
        v7 = 0;
        do
        {
          if (*(_QWORD *)v9 != v6)
            objc_enumerationMutation(v3);
          objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v7++), "nodeDidMoveContainedNodes:", *(_QWORD *)(a1 + 40));
        }
        while (v5 != v7);
        v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      }
      while (v5);
    }

  }
}

- (void)iconList:(id)a3 didAddIcon:(id)a4
{
  SBIconListModel *v6;
  SBIconListModel *ignoredList;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)SBRootFolder;
  v6 = (SBIconListModel *)a3;
  -[SBFolder iconList:didAddIcon:](&v8, sel_iconList_didAddIcon_, v6, a4);
  ignoredList = self->_ignoredList;

  if (ignoredList == v6
    && !-[SBRootFolder isCheckingIgnoredListConsistency](self, "isCheckingIgnoredListConsistency", v8.receiver, v8.super_class))
  {
    -[SBRootFolder scheduleIgnoredListConsistencyCheck](self, "scheduleIgnoredListConsistencyCheck");
  }
}

- (void)iconList:(id)a3 didReplaceIcon:(id)a4 withIcon:(id)a5
{
  SBIconListModel *v8;
  SBIconListModel *ignoredList;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SBRootFolder;
  v8 = (SBIconListModel *)a3;
  -[SBFolder iconList:didReplaceIcon:withIcon:](&v10, sel_iconList_didReplaceIcon_withIcon_, v8, a4, a5);
  ignoredList = self->_ignoredList;

  if (ignoredList == v8
    && !-[SBRootFolder isCheckingIgnoredListConsistency](self, "isCheckingIgnoredListConsistency", v10.receiver, v10.super_class))
  {
    -[SBRootFolder scheduleIgnoredListConsistencyCheck](self, "scheduleIgnoredListConsistencyCheck");
  }
}

+ (BOOL)isRootFolderClass
{
  return 1;
}

- (BOOL)canAddIconCount:(unint64_t)a3 startingAtList:(id)a4
{
  id v6;
  uint64_t v7;
  void *v8;
  unsigned __int8 v9;
  BOOL v10;
  objc_super v12;

  v6 = a4;
  -[SBRootFolder dock](self, "dock");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && (id)v7 == v6)
  {
    v9 = objc_msgSend(v6, "allowsAddingIconCount:", a3);
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)SBRootFolder;
    v9 = -[SBFolder canAddIconCount:startingAtList:](&v12, sel_canAddIconCount_startingAtList_, a3, v6);
  }
  v10 = v9;

  return v10;
}

- (unint64_t)hiddenIndexOfList:(id)a3
{
  id v4;
  unint64_t v5;
  objc_super v7;

  v4 = a3;
  v5 = 0x7FFFFFFFFFFFFFFFLL;
  if (objc_msgSend(v4, "isHidden"))
  {
    v5 = -[SBRootFolder _specialIndexOfList:](self, "_specialIndexOfList:", v4);
    if (v5 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v7.receiver = self;
      v7.super_class = (Class)SBRootFolder;
      v5 = -[SBFolder hiddenIndexOfList:](&v7, sel_hiddenIndexOfList_, v4);
    }
  }

  return v5;
}

- (void)removeList:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  if (-[SBRootFolder _specialIndexOfList:](self, "_specialIndexOfList:", v4) == 0x7FFFFFFFFFFFFFFFLL)
  {
    v5.receiver = self;
    v5.super_class = (Class)SBRootFolder;
    -[SBFolder removeList:](&v5, sel_removeList_, v4);
  }

}

- (SBHIconModel)model
{
  return (SBHIconModel *)objc_loadWeakRetained((id *)&self->_model);
}

- (void)setModel:(id)a3
{
  objc_storeWeak((id *)&self->_model, a3);
}

- (BOOL)isCheckingIgnoredListConsistency
{
  return self->_checkingIgnoredListConsistency;
}

- (void)setCheckingIgnoredListConsistency:(BOOL)a3
{
  self->_checkingIgnoredListConsistency = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_model);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_ignoredList, 0);
  objc_storeStrong((id *)&self->_favoriteTodayList, 0);
  objc_storeStrong((id *)&self->_todayList, 0);
  objc_storeStrong((id *)&self->_dock, 0);
}

@end
