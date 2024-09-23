@implementation RAPTablePartsDataSource

- (RAPTablePartsDataSource)init
{
  RAPTablePartsDataSource *result;

  result = (RAPTablePartsDataSource *)+[NSException raise:format:](NSException, "raise:format:", CFSTR("GEOMethodNotAvailableException"), CFSTR("This method is unavailable."));
  __break(1u);
  return result;
}

- (RAPTablePartsDataSource)initWithPresentingViewController:(id)a3
{
  id v4;
  RAPTablePartsDataSource *v5;
  RAPTablePartsDataSource *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RAPTablePartsDataSource;
  v5 = -[RAPTablePartsDataSource init](&v8, "init");
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_presentingViewController, v4);

  return v6;
}

- (void)dealloc
{
  RAPTablePartsDataSource *v3;
  objc_super v4;

  -[RAPTablePartsDataSource _clearPartsAndSections](self, "_clearPartsAndSections");
  v3 = (RAPTablePartsDataSource *)objc_claimAutoreleasedReturnValue(-[UITableView dataSource](self->_tableView, "dataSource"));

  if (v3 == self)
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", 0);
  v4.receiver = self;
  v4.super_class = (Class)RAPTablePartsDataSource;
  -[RAPTablePartsDataSource dealloc](&v4, "dealloc");
}

- (void)_clearPartsAndSections
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  NSMutableArray *v8;
  id v9;
  id v10;
  uint64_t v11;
  void *j;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];

  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v3 = self->_tableSections;
  v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v6)
          objc_enumerationMutation(v3);
        objc_setAssociatedObject(*(id *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i), off_1014A6A18, 0, (void *)3);
      }
      v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    }
    while (v5);
  }

  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v8 = self->_tableParts;
  v9 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (j = 0; j != v10; j = (char *)j + 1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)j);
        objc_msgSend(v13, "setTableView:", 0, (_QWORD)v14);
        objc_msgSend(v13, "setPresentingViewController:", 0);
      }
      v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v8, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
    }
    while (v10);
  }

}

- (void)_updateTableAppearance
{
  NSMutableArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  if (sub_1002A8AA0(self->_tableView) == 5)
  {
    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v3 = self->_tableParts;
    v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v4)
    {
      v5 = v4;
      v6 = *(_QWORD *)v14;
      v7 = 2;
LABEL_4:
      v8 = 0;
      while (1)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v9 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v8);
        v10 = objc_opt_class(RAPUserInfoPart);
        if ((objc_opt_isKindOfClass(v9, v10) & 1) != 0)
          break;
        if (v5 == (id)++v8)
        {
          v5 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
          if (v5)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:
      v7 = 1;
    }

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource tableView](self, "tableView"));
    objc_msgSend(v11, "_maps_initializeRAPAppearanceWithStyle:", v7);

  }
  else
  {
    v12 = (id)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource tableView](self, "tableView"));
    objc_msgSend(v12, "_maps_initializeRAPAppearance");

  }
}

- (void)setTableView:(id)a3
{
  UITableView *v5;
  UITableView *tableView;
  UITableView **p_tableView;
  RAPTablePartsDataSource *v8;
  NSMutableArray *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v5 = (UITableView *)a3;
  p_tableView = &self->_tableView;
  tableView = self->_tableView;
  if (tableView != v5)
  {
    v8 = (RAPTablePartsDataSource *)objc_claimAutoreleasedReturnValue(-[UITableView dataSource](tableView, "dataSource"));

    if (v8 == self)
      -[UITableView setDataSource:](*p_tableView, "setDataSource:", 0);
    objc_storeStrong((id *)&self->_tableView, a3);
    -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
    v16 = 0u;
    v17 = 0u;
    v14 = 0u;
    v15 = 0u;
    v9 = self->_tableParts;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
          objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)v13), "_setTableView:", *p_tableView, (_QWORD)v14);
          v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      }
      while (v11);
    }

    -[RAPTablePartsDataSource _updateTableAppearance](self, "_updateTableAppearance");
  }

}

- (void)setTableParts:(id)a3
{
  -[RAPTablePartsDataSource setTableParts:withRowAnimation:](self, "setTableParts:withRowAnimation:", a3, 0);
}

- (void)setTableParts:(id)a3 withRowAnimation:(int64_t)a4
{
  id v6;
  id v7;
  _BYTE *v8;
  _BYTE *v9;
  void *v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  id v15;
  _BYTE *v16;
  void *v17;
  id v18;
  id v19;
  uint64_t v20;
  void *j;
  NSMutableArray *v22;
  NSMutableArray *tableParts;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];

  v6 = a3;
  if ((-[NSMutableArray isEqual:](self->_tableParts, "isEqual:", v6) & 1) == 0)
  {
    if (-[NSMutableArray _maps_isPrefixOfArray:](self->_tableParts, "_maps_isPrefixOfArray:", v6))
    {
      v7 = -[NSMutableArray count](self->_tableParts, "count");
      v8 = objc_msgSend(v6, "count");
      v9 = -[NSMutableArray count](self->_tableParts, "count");
      v28 = 0u;
      v29 = 0u;
      v30 = 0u;
      v31 = 0u;
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "subarrayWithRange:", v7, v8 - v9));
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v29;
        do
        {
          for (i = 0; i != v12; i = (char *)i + 1)
          {
            if (*(_QWORD *)v29 != v13)
              objc_enumerationMutation(v10);
            -[RAPTablePartsDataSource pushTablePart:withRowAnimation:](self, "pushTablePart:withRowAnimation:", *(_QWORD *)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)i), a4);
          }
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
        }
        while (v12);
      }
    }
    else
    {
      if (!objc_msgSend(v6, "_maps_isPrefixOfArray:", self->_tableParts))
      {
        -[RAPTablePartsDataSource _clearPartsAndSections](self, "_clearPartsAndSections");
        v22 = (NSMutableArray *)objc_msgSend(v6, "mutableCopy");
        tableParts = self->_tableParts;
        self->_tableParts = v22;

        -[RAPTablePartsDataSource _rebuildTableSections](self, "_rebuildTableSections");
        -[RAPTablePartsDataSource _updateTableAppearance](self, "_updateTableAppearance");
        goto LABEL_21;
      }
      v15 = objc_msgSend(v6, "count");
      v16 = -[NSMutableArray count](self->_tableParts, "count");
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[NSMutableArray subarrayWithRange:](self->_tableParts, "subarrayWithRange:", v15, v16 - (_BYTE *)objc_msgSend(v6, "count"), 0));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "reverseObjectEnumerator"));

      v18 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v25;
        do
        {
          for (j = 0; j != v19; j = (char *)j + 1)
          {
            if (*(_QWORD *)v25 != v20)
              objc_enumerationMutation(v10);
            -[RAPTablePartsDataSource popTablePart:withRowAnimation:](self, "popTablePart:withRowAnimation:", *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)j), a4);
          }
          v19 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
        }
        while (v19);
      }
    }

  }
LABEL_21:

}

- (void)_rebuildTableSections
{
  id v3;
  uint64_t v4;
  void *i;
  void *v6;
  void *v7;
  id WeakRetained;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *j;
  void *v14;
  const void *v15;
  void *v16;
  NSMutableArray *v17;
  NSMutableArray *tableSections;
  void *v19;
  unsigned __int8 v20;
  void *v21;
  id obj;
  RAPTablePartsDataSource *v23;
  id *location;
  uint64_t v25;
  id v26;
  void *v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];

  v3 = objc_alloc_init((Class)NSMutableArray);
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  obj = (id)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource tableParts](self, "tableParts"));
  v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v26)
  {
    v4 = 0;
    location = (id *)&self->_presentingViewController;
    v25 = *(_QWORD *)v33;
    v23 = self;
    do
    {
      for (i = 0; i != v26; i = (char *)i + 1)
      {
        if (*(_QWORD *)v33 != v25)
          objc_enumerationMutation(obj);
        v6 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * (_QWORD)i);
        v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource tableView](self, "tableView"));
        objc_msgSend(v6, "_setTableView:", v7);

        WeakRetained = objc_loadWeakRetained(location);
        objc_msgSend(v6, "setPresentingViewController:", WeakRetained);

        v30 = 0u;
        v31 = 0u;
        v28 = 0u;
        v29 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sections"));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
        if (v10)
        {
          v11 = v10;
          v27 = i;
          v12 = *(_QWORD *)v29;
          do
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(_QWORD *)v29 != v12)
                objc_enumerationMutation(v9);
              v14 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * (_QWORD)j);
              objc_msgSend(v3, "addObject:", v14);
              v15 = off_1014A6A18;
              v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)j + v4));
              objc_setAssociatedObject(v14, v15, v16, (void *)3);

            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
            v4 += (uint64_t)j;
          }
          while (v11);
          self = v23;
          i = v27;
        }

      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v26);
  }

  v17 = (NSMutableArray *)objc_msgSend(v3, "mutableCopy");
  tableSections = self->_tableSections;
  self->_tableSections = v17;

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource tableView](self, "tableView"));
  v20 = +[RAPTablePart isHoldingChangesAffectingTableView:](RAPTablePart, "isHoldingChangesAffectingTableView:", v19);

  if ((v20 & 1) == 0)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource tableView](self, "tableView"));
    objc_msgSend(v21, "reloadData");

  }
}

- (void)_createPartAndSectionArraysIfNeeded
{
  NSMutableArray *v3;
  NSMutableArray *tableParts;
  NSMutableArray *v5;
  NSMutableArray *tableSections;

  if (!self->_tableParts)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tableParts = self->_tableParts;
    self->_tableParts = v3;

  }
  if (!self->_tableSections)
  {
    v5 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    tableSections = self->_tableSections;
    self->_tableSections = v5;

  }
}

- (void)pushTablePart:(id)a3 withRowAnimation:(int64_t)a4
{
  id v5;
  void *v6;
  void *v7;
  id WeakRetained;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  char *v13;
  void *v14;
  void *v15;
  const void *v16;
  void *v17;
  void *v18;
  void *v19;
  RAPTablePartsDataSource *v20;
  void *v22;
  char *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];

  v5 = a3;
  -[RAPTablePartsDataSource _createPartAndSectionArraysIfNeeded](self, "_createPartAndSectionArraysIfNeeded");
  v23 = (char *)-[NSMutableArray count](self->_tableSections, "count");
  -[NSMutableArray addObject:](self->_tableParts, "addObject:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "sections"));
  -[NSMutableArray addObjectsFromArray:](self->_tableSections, "addObjectsFromArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource tableView](self, "tableView"));
  objc_msgSend(v5, "_setTableView:", v7);

  v20 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingViewController);
  v22 = v5;
  objc_msgSend(v5, "setPresentingViewController:", WeakRetained);

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v9 = v6;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v25;
    v13 = v23;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v25 != v12)
          objc_enumerationMutation(v9);
        v15 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)v14);
        v16 = off_1014A6A18;
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (char *)v14 + (_QWORD)v13, v20));
        objc_setAssociatedObject(v15, v16, v17, (void *)3);

        v14 = (char *)v14 + 1;
      }
      while (v11 != v14);
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v13 = (char *)v14 + (_QWORD)v13;
    }
    while (v11);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource tableView](v20, "tableView"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v23, objc_msgSend(v9, "count")));
  objc_msgSend(v18, "insertSections:withRowAnimation:", v19, a4);

}

- (void)popTablePart:(id)a3 withRowAnimation:(int64_t)a4
{
  id v6;
  id v7;
  void *v8;
  NSMutableArray *tableSections;
  void *v10;
  id v11;
  void *v12;
  id v13;
  id v14;
  id v15;
  uint64_t v16;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[NSMutableArray lastObject](self->_tableParts, "lastObject"));

  if (v7 == v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "sections"));
    tableSections = self->_tableSections;
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "firstObject"));
    v11 = -[NSMutableArray indexOfObject:](tableSections, "indexOfObject:", v10);

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSIndexSet indexSetWithIndexesInRange:](NSIndexSet, "indexSetWithIndexesInRange:", v11, objc_msgSend(v8, "count")));
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v13 = v8;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v14)
    {
      v15 = v14;
      v16 = *(_QWORD *)v20;
      do
      {
        v17 = 0;
        do
        {
          if (*(_QWORD *)v20 != v16)
            objc_enumerationMutation(v13);
          objc_setAssociatedObject(*(id *)(*((_QWORD *)&v19 + 1) + 8 * (_QWORD)v17), off_1014A6A18, 0, (void *)3);
          v17 = (char *)v17 + 1;
        }
        while (v15 != v17);
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v15);
    }

    objc_msgSend(v6, "_setTableView:", 0, (_QWORD)v19);
    objc_msgSend(v6, "setPresentingViewController:", 0);
    -[NSMutableArray removeLastObject](self->_tableParts, "removeLastObject");
    -[NSMutableArray removeObjectsAtIndexes:](self->_tableSections, "removeObjectsAtIndexes:", v12);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource tableView](self, "tableView"));
    objc_msgSend(v18, "deleteSections:withRowAnimation:", v12, a4);

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return (int64_t)-[NSMutableArray count](self->_tableSections, "count", a3);
}

- (int64_t)indexOfSection:(id)a3
{
  id AssociatedObject;
  void *v4;
  id v5;

  AssociatedObject = objc_getAssociatedObject(a3, off_1014A6A18);
  v4 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  v5 = objc_msgSend(v4, "integerValue");

  return (int64_t)v5;
}

- (id)sectionAtIndex:(int64_t)a3
{
  return -[NSMutableArray objectAtIndexedSubscript:](self->_tableSections, "objectAtIndexedSubscript:", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource sectionAtIndex:](self, "sectionAtIndex:", a4));
  v5 = objc_msgSend(v4, "rowsCount");

  return (int64_t)v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;
  void *v8;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(v5, "section")));
  v7 = objc_msgSend(v5, "row");

  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "cellForRowAtIndex:", v7));
  return v8;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource sectionAtIndex:](self, "sectionAtIndex:", a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "footerTitle"));

  return v5;
}

- (id)indexPathForRow:(int64_t)a3 ofSection:(id)a4
{
  return +[NSIndexPath indexPathForRow:inSection:](NSIndexPath, "indexPathForRow:inSection:", a3, -[RAPTablePartsDataSource indexOfSection:](self, "indexOfSection:", a4));
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  id v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(v5, "section")));
  v7 = objc_msgSend(v5, "row");

  LOBYTE(v5) = objc_msgSend(v6, "canEditRowAtIndex:", v7);
  return (char)v5;
}

- (void)tableView:(id)a3 commitEditingStyle:(int64_t)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  id v8;

  v7 = a5;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[RAPTablePartsDataSource sectionAtIndex:](self, "sectionAtIndex:", objc_msgSend(v7, "section")));
  objc_msgSend(v8, "commitEdit:forRowAtIndex:tableViewIndexPath:", a4, objc_msgSend(v7, "row"), v7);

}

- (NSArray)tableParts
{
  return &self->_tableParts->super;
}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_tableSections, 0);
  objc_storeStrong((id *)&self->_tableParts, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

@end
