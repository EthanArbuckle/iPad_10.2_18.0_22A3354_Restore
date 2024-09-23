@implementation RAPTablePart

- (RAPTablePart)init
{
  return -[RAPTablePart initWithSections:](self, "initWithSections:", &__NSArray0__struct);
}

- (id)_dataSource
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePart tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataSource"));

  v4 = objc_opt_class(RAPTablePartsDataSource);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;
  v6 = v5;

  return v6;
}

- (RAPTablePart)initWithSections:(id)a3
{
  id v4;
  RAPTablePart *v5;
  id v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RAPTablePart;
  v5 = -[RAPTablePart init](&v8, "init");
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    -[RAPTablePart setSections:](v5, "setSections:", v6);

  }
  return v5;
}

- (void)dealloc
{
  NSArray *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  objc_super v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v3 = self->_sections;
  v4 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)v7), "_setPartController:", 0);
        v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      v5 = -[NSArray countByEnumeratingWithState:objects:count:](v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

  v8.receiver = self;
  v8.super_class = (Class)RAPTablePart;
  -[RAPTablePart dealloc](&v8, "dealloc");
}

+ (void)holdChangesAffectingTableView:(id)a3 withinBlock:(id)a4
{
  void (**v5)(_QWORD);
  id v6;
  void (**v7)(_QWORD);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a3;
  v5 = (void (**)(_QWORD))a4;
  v6 = v12;
  v7 = v5;
  if (v12)
  {
    v8 = (void *)qword_1014D2248;
    if (!qword_1014D2248)
    {
      v9 = objc_alloc_init((Class)NSCountedSet);
      v10 = (void *)qword_1014D2248;
      qword_1014D2248 = (uint64_t)v9;

      v6 = v12;
      v8 = (void *)qword_1014D2248;
    }
    objc_msgSend(v8, "addObject:", v6);
    v7[2](v7);
    objc_msgSend((id)qword_1014D2248, "removeObject:", v12);
    if (!objc_msgSend((id)qword_1014D2248, "count"))
    {
      v11 = (void *)qword_1014D2248;
      qword_1014D2248 = 0;

    }
    if ((objc_msgSend((id)qword_1014D2248, "containsObject:", v12) & 1) == 0)
      objc_msgSend(v12, "reloadData");
  }
  else
  {
    v5[2](v5);
  }

}

+ (BOOL)isHoldingChangesAffectingTableView:(id)a3
{
  return objc_msgSend((id)qword_1014D2248, "containsObject:", a3);
}

- (void)holdChangesAffectingTableViewWithinBlock:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_opt_class(self);
  v6 = (id)objc_claimAutoreleasedReturnValue(-[RAPTablePart tableView](self, "tableView"));
  objc_msgSend(v5, "holdChangesAffectingTableView:withinBlock:", v6, v4);

}

- (void)setSections:(id)a3
{
  NSArray *v4;
  NSArray *sections;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  NSArray *v11;
  NSArray *v12;
  void *v13;
  NSArray *v14;
  id v15;
  id v16;
  uint64_t v17;
  void *j;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  _BYTE v29[128];

  v4 = (NSArray *)a3;
  sections = self->_sections;
  if (sections != v4)
  {
    v26 = 0u;
    v27 = 0u;
    v24 = 0u;
    v25 = 0u;
    v6 = sections;
    v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(_QWORD *)v25 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * (_QWORD)i), "_setPartController:", 0);
        }
        v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      }
      while (v8);
    }

    v11 = (NSArray *)-[NSArray copy](v4, "copy");
    v12 = self->_sections;
    self->_sections = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePart tableView](self, "tableView"));
    v22 = 0u;
    v23 = 0u;
    v20 = 0u;
    v21 = 0u;
    v14 = self->_sections;
    v15 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
    if (v15)
    {
      v16 = v15;
      v17 = *(_QWORD *)v21;
      do
      {
        for (j = 0; j != v16; j = (char *)j + 1)
        {
          if (*(_QWORD *)v21 != v17)
            objc_enumerationMutation(v14);
          v19 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)j);
          objc_msgSend(v19, "_setPartController:", self, (_QWORD)v20);
          if (v13)
            objc_msgSend(v19, "_registerReuseIdentifiersIfNeeded");
        }
        v16 = -[NSArray countByEnumeratingWithState:objects:count:](v14, "countByEnumeratingWithState:objects:count:", &v20, v28, 16);
      }
      while (v16);
    }

    -[RAPTablePart didChange](self, "didChange");
  }

}

- (void)_setTableView:(id)a3
{
  UITableView *v5;
  NSArray *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *i;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  v5 = (UITableView *)a3;
  if (self->_tableView != v5)
  {
    objc_storeStrong((id *)&self->_tableView, a3);
    if (self->_tableView)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = self->_sections;
      v7 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          for (i = 0; i != v8; i = (char *)i + 1)
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)i), "_registerReuseIdentifiersIfNeeded", (_QWORD)v11);
          }
          v8 = -[NSArray countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }

}

- (RAPTablePartsDataSource)dataSource
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[RAPTablePart tableView](self, "tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "dataSource"));

  v4 = objc_opt_class(RAPTablePartsDataSource);
  if ((objc_opt_isKindOfClass(v3, v4) & 1) != 0)
    v5 = v3;
  else
    v5 = 0;

  return (RAPTablePartsDataSource *)v5;
}

- (void)presentingViewControllerViewDidLayoutSubviews
{
  NSArray *v2;
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];

  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v2 = self->_sections;
  v3 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v8;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v8 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * (_QWORD)v6), "presentingViewControllerViewDidLayoutSubviews", (_QWORD)v7);
        v6 = (char *)v6 + 1;
      }
      while (v4 != v6);
      v4 = -[NSArray countByEnumeratingWithState:objects:count:](v2, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v4);
  }

}

- (void)didChange
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[RAPTablePart _dataSource](self, "_dataSource"));
  objc_msgSend(v3, "tablePartDidChange:", self);

}

- (UITableView)tableView
{
  return self->_tableView;
}

- (void)setTableView:(id)a3
{
  objc_storeStrong((id *)&self->_tableView, a3);
}

- (NSArray)sections
{
  return self->_sections;
}

- (RAPPresentingViewController)presentingViewController
{
  return (RAPPresentingViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_presentingViewController);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
