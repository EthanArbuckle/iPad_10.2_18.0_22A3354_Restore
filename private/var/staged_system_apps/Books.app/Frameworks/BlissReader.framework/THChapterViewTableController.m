@implementation THChapterViewTableController

- (THChapterViewTableController)initWithChapterTitle:(id)a3 delegate:(id)a4
{
  id v6;
  id v7;
  THChapterViewTableController *v8;
  THChapterViewTableController *v9;
  id v10;
  UINavigationController *v11;
  UINavigationController *navigationController;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  double v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  objc_super v38;

  v6 = a3;
  v7 = a4;
  v38.receiver = self;
  v38.super_class = (Class)THChapterViewTableController;
  v8 = -[THChapterViewTableController init](&v38, "init");
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = objc_msgSend(objc_alloc((Class)UITableViewController), "initWithStyle:", 0);
    v11 = (UINavigationController *)objc_msgSend(objc_alloc((Class)UINavigationController), "initWithRootViewController:", v10);
    navigationController = v9->_navigationController;
    v9->_navigationController = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController view](v9->_navigationController, "view"));
    objc_msgSend(v14, "setBackgroundColor:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](v9->_navigationController, "navigationBar"));
    objc_msgSend(v16, "setBackgroundColor:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](v9->_navigationController, "navigationBar"));
    objc_msgSend(v18, "setBarTintColor:", v17);

    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksKeyColor](UIColor, "bc_booksKeyColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController navigationBar](v9->_navigationController, "navigationBar"));
    objc_msgSend(v20, "setTintColor:", v19);

    objc_msgSend(v10, "setTitle:", v6);
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableView"));
    objc_msgSend(v21, "setDelegate:", v9);

    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableView"));
    objc_msgSend(v22, "setDataSource:", v9);

    if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))v23 = UITableViewAutomaticDimension;
    else
      v23 = 44.0;
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableView"));
    objc_msgSend(v24, "setRowHeight:", v23);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableView"));
    objc_msgSend(v25, "setEstimatedRowHeight:", 44.0);

    v27 = (void *)objc_opt_new(UIView, v26);
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableView"));
    objc_msgSend(v28, "setTableFooterView:", v27);

    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor bc_booksBackground](UIColor, "bc_booksBackground"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableView"));
    objc_msgSend(v30, "setBackgroundColor:", v29);

    v31 = THBundle();
    v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UINib nibWithNibName:bundle:](UINib, "nibWithNibName:bundle:", CFSTR("THChapterViewTableController"), v32));

    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "tableView"));
    objc_msgSend(v34, "registerNib:forCellReuseIdentifier:", v33, CFSTR("THChapterViewTableControllerCell"));

    v35 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, v9, "p_doneButtonPressed:");
    v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "navigationItem"));
    objc_msgSend(v36, "setRightBarButtonItem:", v35);

  }
  return v9;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_storeWeak((id *)&self->_delegate, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_navigationController, "topViewController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableView"));
  objc_msgSend(v4, "setDelegate:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "tableView"));
  objc_msgSend(v5, "setDataSource:", 0);

  v6.receiver = self;
  v6.super_class = (Class)THChapterViewTableController;
  -[THChapterViewTableController dealloc](&v6, "dealloc");
}

- (void)contentSizeCategoryDidChange
{
  void *v2;
  void *v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController topViewController](self->_navigationController, "topViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tableView"));
  if (+[UIFont bc_accessibilityFontSizesEnabled](UIFont, "bc_accessibilityFontSizesEnabled"))v4 = UITableViewAutomaticDimension;
  else
    v4 = 44.0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tableView"));
  objc_msgSend(v5, "setRowHeight:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "tableView"));
  objc_msgSend(v6, "setEstimatedRowHeight:", 44.0);

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "visibleCells", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i), "contentSizeCategoryDidChange");
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

  objc_msgSend(v3, "reloadData");
}

- (void)p_doneButtonPressed:(id)a3
{
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[THChapterViewTableController delegate](self, "delegate", a3));
  objc_msgSend(v4, "chapterViewTableDoneButtonPressed:", self);

}

- (void)presentOnViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL8 v6;
  void (**v8)(_QWORD);
  void *v9;
  id v10;

  v6 = a4;
  v10 = a3;
  v8 = (void (**)(_QWORD))a5;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController presentingViewController](self->_navigationController, "presentingViewController"));

  if (v9)
  {
    if (v8)
      v8[2](v8);
  }
  else
  {
    objc_msgSend(v10, "presentViewController:animated:completion:", self->_navigationController, v6, v8);
  }

}

- (void)dismissAnimated:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void (**v7)(void);

  v4 = a3;
  v7 = (void (**)(void))a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[UINavigationController presentingViewController](self->_navigationController, "presentingViewController"));

  if (v6)
  {
    -[UINavigationController dismissViewControllerAnimated:completion:](self->_navigationController, "dismissViewControllerAnimated:completion:", v4, v7);
  }
  else if (v7)
  {
    v7[2]();
  }

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  id v6;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableController delegate](self, "delegate", a3, a4));
  v6 = objc_msgSend(v5, "chapterViewTableNumberOfEntries:", self);

  return (int64_t)v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  THChapterViewTableControllerCell *v4;

  v4 = (THChapterViewTableControllerCell *)objc_claimAutoreleasedReturnValue(objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("THChapterViewTableControllerCell"), a4));
  if (!v4)
    v4 = -[THChapterViewTableControllerCell initWithStyle:reuseIdentifier:]([THChapterViewTableControllerCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("THChapterViewTableControllerCell"));
  return v4;
}

- (void)tableView:(id)a3 willDisplayCell:(id)a4 forRowAtIndexPath:(id)a5
{
  id v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v19 = a5;
  v7 = a4;
  v8 = objc_opt_class(THChapterViewTableControllerCell);
  TSUDynamicCast(v8, v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);

  if (v10)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[THChapterViewTableController delegate](self, "delegate"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "chapterViewTable:entryForIndex:", self, objc_msgSend(v19, "row")));

    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "title"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "titleLabel"));
    objc_msgSend(v14, "setText:", v13);

    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "sectionIdentifier"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "sectionLabel"));
    objc_msgSend(v16, "setText:", v15);

    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "displayPageNumber"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pageLabel"));
    objc_msgSend(v18, "setText:", v17);

    objc_msgSend(v10, "updateLabels");
  }

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  id v6;
  id v7;

  v5 = a4;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[THChapterViewTableController delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "chapterViewTable:selectedEntryWithIndex:", self, v6);
}

- (THChapterViewTableControllerDelegate)delegate
{
  return (THChapterViewTableControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UINavigationController)navigationController
{
  return self->_navigationController;
}

- (void)setNavigationController:(id)a3
{
  objc_storeStrong((id *)&self->_navigationController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_navigationController, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
