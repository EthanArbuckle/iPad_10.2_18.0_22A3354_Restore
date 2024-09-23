@implementation SBModifierTimelineModifierDetailViewController

- (void)viewDidLoad
{
  id v3;
  UITableView *v4;
  UITableView *tableView;
  void *v6;
  SBModifierTimelineTextDetailViewController *v7;
  SBModifierTimelineTextDetailViewController *textViewController;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SBModifierTimelineModifierDetailViewController;
  -[SBModifierTimelineModifierDetailViewController viewDidLoad](&v9, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x1E0CEAA58]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  tableView = self->_tableView;
  self->_tableView = v4;

  -[UITableView setDataSource:](self->_tableView, "setDataSource:", self);
  -[UITableView setDelegate:](self->_tableView, "setDelegate:", self);
  -[SBModifierTimelineModifierDetailViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", self->_tableView);

  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("NoValueCell"));
  -[UITableView registerClass:forCellReuseIdentifier:](self->_tableView, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ValueCell"));
  -[UITableView contentInset](self->_tableView, "contentInset");
  -[UITableView setContentInset:](self->_tableView, "setContentInset:");
  v7 = -[SBModifierTimelineTextDetailViewController initWithNibName:bundle:]([SBModifierTimelineTextDetailViewController alloc], "initWithNibName:bundle:", 0, 0);
  textViewController = self->_textViewController;
  self->_textViewController = v7;

}

- (void)setStackSnapshot:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_stackSnapshot, a3);
  v5 = a3;
  -[SBModifierTimelineModifierDetailViewController loadViewIfNeeded](self, "loadViewIfNeeded");
  -[UITableView reloadData](self->_tableView, "reloadData");

}

- (void)viewWillLayoutSubviews
{
  UITableView *tableView;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBModifierTimelineModifierDetailViewController;
  -[SBModifierTimelineModifierDetailViewController viewWillLayoutSubviews](&v5, sel_viewWillLayoutSubviews);
  tableView = self->_tableView;
  -[SBModifierTimelineModifierDetailViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  -[UITableView setFrame:](tableView, "setFrame:");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  id v6;
  int64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  v7 = 1;
  switch(a4)
  {
    case 0:
      break;
    case 1:
      -[SBSwitcherModifierStackSnapshot querySnapshot](self->_stackSnapshot, "querySnapshot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "contextMethods");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 2:
      -[SBSwitcherModifierStackSnapshot querySnapshot](self->_stackSnapshot, "querySnapshot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "implementingQueryMethods");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    case 3:
      -[SBSwitcherModifierStackSnapshot querySnapshot](self->_stackSnapshot, "querySnapshot");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "nonImplementingQueryMethods");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:
      v10 = v9;
      v7 = objc_msgSend(v9, "count");

      break;
    default:
      v7 = 0;
      break;
  }

  return v7;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;

  v6 = a4;
  v7 = a3;
  if (objc_msgSend(v6, "section"))
    v8 = CFSTR("ValueCell");
  else
    v8 = CFSTR("NoValueCell");
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 13.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setFont:", v11);

  objc_msgSend(v9, "detailTextLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA5E8], "systemFontOfSize:", 12.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFont:", v13);

  -[SBSwitcherModifierStackSnapshot querySnapshot](self->_stackSnapshot, "querySnapshot");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v6, "section"))
  {
    objc_msgSend(v9, "textLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherModifierStackSnapshot modifierDescription](self->_stackSnapshot, "modifierDescription");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v20);

    objc_msgSend(v9, "setAccessoryType:", 1);
    goto LABEL_18;
  }
  if (objc_msgSend(v6, "section") == 1)
  {
    objc_msgSend(v14, "contextMethods");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v6, "row"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setText:", v16);

    objc_msgSend(v14, "contextMethodsToDescriptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v6, "section") != 2 && objc_msgSend(v6, "section") != 3)
      goto LABEL_18;
    if (objc_msgSend(v6, "section") == 2)
      objc_msgSend(v14, "implementingQueryMethods");
    else
      objc_msgSend(v14, "nonImplementingQueryMethods");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "objectAtIndex:", objc_msgSend(v6, "row"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "textLabel");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setText:", v16);

    objc_msgSend(v14, "queryMethodsToDescriptions");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v22 = v18;
  objc_msgSend(v18, "objectForKey:", v16);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "description");
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "detailTextLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v24)
  {
    objc_msgSend(v24, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\n"), CFSTR(" "));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setText:", v27);

    v28 = 1;
  }
  else
  {
    objc_msgSend(v25, "setText:", 0);
    v28 = 0;
  }

  objc_msgSend(v9, "setAccessoryType:", v28);
LABEL_18:

  return v9;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  if ((unint64_t)a4 > 3)
    return &stru_1E8EC7EC0;
  else
    return off_1E8EA34A0[a4];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return 30.0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v16 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v16, 1);
  -[SBSwitcherModifierStackSnapshot querySnapshot](self->_stackSnapshot, "querySnapshot");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "section"))
  {
    -[SBSwitcherModifierStackSnapshot modifierName](self->_stackSnapshot, "modifierName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SBSwitcherModifierStackSnapshot modifierDescription](self->_stackSnapshot, "modifierDescription");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_13;
LABEL_12:
    -[SBModifierTimelineTextDetailViewController setTitle:](self->_textViewController, "setTitle:", v8);
    -[SBModifierTimelineTextDetailViewController setText:](self->_textViewController, "setText:", v10);
    -[SBModifierTimelineModifierDetailViewController navigationController](self, "navigationController");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "pushViewController:animated:", self->_textViewController, 1);

    goto LABEL_13;
  }
  if (objc_msgSend(v16, "section") == 1)
  {
    objc_msgSend(v6, "contextMethods");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectAtIndex:", objc_msgSend(v16, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "contextMethodsToDescriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (objc_msgSend(v16, "section") == 2)
    {
      objc_msgSend(v6, "implementingQueryMethods");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (objc_msgSend(v16, "section") != 3)
      {
        v8 = 0;
        goto LABEL_13;
      }
      objc_msgSend(v6, "nonImplementingQueryMethods");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v12 = v11;
    objc_msgSend(v11, "objectAtIndex:", objc_msgSend(v16, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "queryMethodsToDescriptions");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v13 = v9;
  objc_msgSend(v9, "objectForKey:", v8);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "description");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
    goto LABEL_12;
LABEL_13:

}

- (SBSwitcherModifierStackSnapshot)stackSnapshot
{
  return self->_stackSnapshot;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stackSnapshot, 0);
  objc_storeStrong((id *)&self->_textViewController, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
}

@end
