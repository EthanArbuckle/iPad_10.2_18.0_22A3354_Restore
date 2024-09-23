@implementation UIPrintOptionListViewController

- (UIPrintOptionListViewController)initWithListDelegate:(id)a3
{
  id v4;
  UIPrintOptionListViewController *v5;
  UIPrintOptionListViewController *v6;
  uint64_t v7;
  NSArray *itemList;
  void *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)UIPrintOptionListViewController;
  v5 = -[UIPrintOptionListViewController initWithStyle:](&v11, sel_initWithStyle_, 2);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_listDelegate, v4);
    objc_msgSend(v4, "itemList");
    v7 = objc_claimAutoreleasedReturnValue();
    itemList = v6->_itemList;
    v6->_itemList = (NSArray *)v7;

    -[UIPrintOptionListViewController tableView](v6, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setEstimatedSectionHeaderHeight:", 8.0);

  }
  return v6;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[UIPrintOptionListViewController itemList](self, "itemList", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int64_t v7;

  -[UIPrintOptionListViewController itemList](self, "itemList", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndex:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "count");
  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("PrintOptionListViewCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D50]), "initWithStyle:reuseIdentifier:", 3, CFSTR("PrintOptionListViewCell"));
  -[UIPrintOptionListViewController itemList](self, "itemList");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "objectAtIndex:", objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v6, "row"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39A8], "cellConfiguration");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("Title"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  objc_msgSend(v10, "objectForKey:", CFSTR("Image"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setImage:", v13);

  objc_msgSend(v10, "objectForKey:", CFSTR("SubTitle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setSecondaryText:", v14);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "secondaryTextProperties");
  v16 = objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v16, "setColor:", v15);

  objc_msgSend(v7, "setContentConfiguration:", v11);
  -[UIPrintOptionListViewController listDelegate](self, "listDelegate");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v16) = objc_opt_respondsToSelector();

  -[UIPrintOptionListViewController listDelegate](self, "listDelegate");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if ((v16 & 1) != 0)
  {
    objc_msgSend(v18, "selectedItems");
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v21 = v20;
    v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v22)
    {
      v23 = *(_QWORD *)v32;
      while (2)
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v32 != v23)
            objc_enumerationMutation(v21);
          v25 = *(void **)(*((_QWORD *)&v31 + 1) + 8 * i);
          v26 = objc_msgSend(v6, "section", (_QWORD)v31);
          if (v26 == objc_msgSend(v25, "section"))
          {
            v27 = objc_msgSend(v6, "row");
            if (v27 == objc_msgSend(v25, "row"))
            {
              LODWORD(v22) = 1;
              goto LABEL_19;
            }
          }
        }
        v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v22)
          continue;
        break;
      }
    }
LABEL_19:

  }
  else
  {
    objc_msgSend(v18, "selectedItem");
    v21 = (id)objc_claimAutoreleasedReturnValue();

    if (v21 && (v28 = objc_msgSend(v6, "section"), v28 == objc_msgSend(v21, "section")))
    {
      v22 = objc_msgSend(v6, "row");
      LODWORD(v22) = v22 == objc_msgSend(v21, "row");
    }
    else
    {
      LODWORD(v22) = 0;
    }
  }

  if ((_DWORD)v22)
    v29 = 3;
  else
    v29 = 0;
  objc_msgSend(v7, "setAccessoryType:", v29, (_QWORD)v31);
  objc_msgSend(v7, "setSelectionStyle:", 3);

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  UIPrintOptionListViewController *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  id v12;
  id v13;

  v13 = a3;
  v6 = a4;
  -[UIPrintOptionListViewController navigationController](self, "navigationController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "topViewController");
  v8 = (UIPrintOptionListViewController *)objc_claimAutoreleasedReturnValue();

  if (v8 == self)
  {
    -[UIPrintOptionListViewController listDelegate](self, "listDelegate");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "listItemSelected:", v6);

    if (v10)
    {
      objc_msgSend(v13, "reloadData");
    }
    else
    {
      -[UIPrintOptionListViewController navigationController](self, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = (id)objc_msgSend(v11, "popViewControllerAnimated:", 1);

    }
  }

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;

  -[UIPrintOptionListViewController listDelegate](self, "listDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[UIPrintOptionListViewController listDelegate](self, "listDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleForHeaderInSection:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v6;
  char v7;
  void *v8;
  void *v9;

  -[UIPrintOptionListViewController listDelegate](self, "listDelegate", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_opt_respondsToSelector();

  if ((v7 & 1) != 0)
  {
    -[UIPrintOptionListViewController listDelegate](self, "listDelegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "titleForFooterInSection:", a4);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void (**v4)(void);
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)UIPrintOptionListViewController;
  -[UIPrintOptionListViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  -[UIPrintOptionListViewController onDoneBlock](self, "onDoneBlock");
  v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
  v4[2]();

}

- (UIPrintOptionListDelegate)listDelegate
{
  return (UIPrintOptionListDelegate *)objc_loadWeakRetained((id *)&self->_listDelegate);
}

- (void)setListDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listDelegate, a3);
}

- (NSArray)itemList
{
  return self->_itemList;
}

- (void)setItemList:(id)a3
{
  objc_storeStrong((id *)&self->_itemList, a3);
}

- (id)onDoneBlock
{
  return objc_getProperty(self, a2, 1032, 1);
}

- (void)setOnDoneBlock:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1032);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_onDoneBlock, 0);
  objc_storeStrong((id *)&self->_itemList, 0);
  objc_destroyWeak((id *)&self->_listDelegate);
}

@end
