@implementation PTUIModuleController

- (PTUIModuleController)initWithSettings:(id)a3
{
  return -[PTUIModuleController initWithSettings:presentingRow:](self, "initWithSettings:presentingRow:", a3, 0);
}

- (PTUIModuleController)initWithSettings:(id)a3 presentingRow:(id)a4
{
  void *v6;
  id v7;
  void *v8;
  PTUIModuleController *v9;

  v6 = (void *)MEMORY[0x24BE7B338];
  v7 = a4;
  objc_msgSend(v6, "moduleWithSettings:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PTUIModuleController _initWithModule:presentingRow:](self, "_initWithModule:presentingRow:", v8, v7);

  return v9;
}

- (id)_initWithModule:(id)a3 presentingRow:(id)a4
{
  id v7;
  id v8;
  PTUIModuleController *v9;
  id *p_isa;
  id *p_module;
  void *v12;
  void *v13;
  objc_super v15;

  v7 = a3;
  v8 = a4;
  v15.receiver = self;
  v15.super_class = (Class)PTUIModuleController;
  v9 = -[PTUIModuleController initWithStyle:](&v15, sel_initWithStyle_, 2);
  p_isa = (id *)&v9->super.super.super.super.isa;
  if (v9)
  {
    p_module = (id *)&v9->_module;
    objc_storeStrong((id *)&v9->_module, a3);
    objc_msgSend(*p_module, "addObserver:", p_isa);
    objc_msgSend(v8, "title");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (!v12)
    {
      objc_msgSend(*p_module, "title");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_storeStrong(p_isa + 128, v13);
    if (!v12)

    objc_msgSend(p_isa, "_updateTitle");
  }

  return p_isa;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewDidLayoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PTUIModuleController;
  -[PTUIModuleController viewDidLayoutSubviews](&v3, sel_viewDidLayoutSubviews);
  -[PTUIModuleController _updateTitle](self, "_updateTitle");
}

- (PTSettings)settings
{
  return (PTSettings *)-[PTModule settings](self->_module, "settings");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PTUIModuleController;
  -[PTUIModuleController viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[PTUIModuleController setEditing:animated:](self, "setEditing:animated:", 0, 0);
}

- (void)_reloadWithModule:(id)a3
{
  PTModule *v4;
  PTModule *module;
  PTModule *v6;
  NSString *v7;
  NSString *title;
  id v9;

  v4 = (PTModule *)a3;
  -[PTModule removeObserver:](self->_module, "removeObserver:", self);
  module = self->_module;
  self->_module = v4;
  v6 = v4;

  -[PTModule title](self->_module, "title");
  v7 = (NSString *)objc_claimAutoreleasedReturnValue();
  title = self->_title;
  self->_title = v7;

  -[PTUIModuleController _updateTitle](self, "_updateTitle");
  -[PTModule addObserver:](self->_module, "addObserver:", self);

  -[PTUIModuleController tableView](self, "tableView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "reloadData");

}

- (void)_updateTitle
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[PTUIModuleController navigationItem](self, "navigationItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTitle:", self->_title);

  -[PTUIModuleController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "windowScene");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v7)
  {
    objc_msgSend(v7, "setTitle:", self->_title);
    v6 = v7;
  }

}

- (void)module:(id)a3 didInsertSections:(id)a4 deleteSections:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  -[PTUIModuleController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginUpdates");

  -[PTUIModuleController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertSections:withRowAnimation:", v8, 100);

  -[PTUIModuleController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteSections:withRowAnimation:", v7, 100);

  -[PTUIModuleController tableView](self, "tableView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endUpdates");

}

- (void)module:(id)a3 didInsertRows:(id)a4 deleteRows:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a5;
  v8 = a4;
  -[PTUIModuleController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "beginUpdates");

  -[PTUIModuleController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "insertRowsAtIndexPaths:withRowAnimation:", v8, 100);

  -[PTUIModuleController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "deleteRowsAtIndexPaths:withRowAnimation:", v7, 100);

  -[PTUIModuleController tableView](self, "tableView");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "endUpdates");

}

- (void)moduleDidReload:(id)a3
{
  id v3;

  -[PTUIModuleController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[PTModule numberOfSections](self->_module, "numberOfSections", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  int64_t v5;

  -[PTModule sectionAtIndex:](self->_module, "sectionAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "numberOfRows");

  return v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[PTModule sectionAtIndex:](self->_module, "sectionAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "title");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    v6 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v7);

    objc_msgSend(v6, "setText:", v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void (**v5)(_QWORD);
  void *v6;

  -[PTModule sectionAtIndex:](self->_module, "sectionAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerTextGetter");
  v5 = (void (**)(_QWORD))objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v5[2](v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  PTModule *module;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  module = self->_module;
  v6 = a3;
  -[PTModule rowAtIndexPath:](module, "rowAtIndexPath:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "tableViewCellClass");
  objc_msgSend(v8, "reuseIdentifierForRow:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = (void *)objc_msgSend(objc_alloc((Class)v8), "initWithStyle:reuseIdentifier:", objc_msgSend(v8, "cellStyleForRow:", v7), v9);
  objc_msgSend(v10, "setRow:", v7);

  return v10;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  void *v4;
  double v5;
  double v6;

  -[PTModule rowAtIndexPath:](self->_module, "rowAtIndexPath:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_msgSend(v4, "tableViewCellClass"), "cellHeightForRow:", v4);
  v6 = v5;

  return v6;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  char v10;
  uint64_t (**v11)(_QWORD, _QWORD, _QWORD);
  int v12;
  void *v13;
  id v14;

  v14 = a3;
  v6 = a4;
  -[PTModule rowAtIndexPath:](self->_module, "rowAtIndexPath:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "action");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    objc_msgSend(v7, "defaultUIAction");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v8)
      goto LABEL_6;
  }
  objc_msgSend(v14, "cellForRowAtIndexPath:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isEditing");

  if ((v10 & 1) != 0
    || (objc_msgSend(v8, "handler"),
        v11 = (uint64_t (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue(),
        v12 = ((uint64_t (**)(_QWORD, void *, PTUIModuleController *))v11)[2](v11, v7, self),
        v11,
        !v12)
    || objc_msgSend(v8, "deselectsRowOnSuccess"))
  {
LABEL_6:
    -[PTModule indexPathForRow:](self->_module, "indexPathForRow:", v7);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "deselectRowAtIndexPath:animated:", v13, 1);

  }
}

- (void)showActionsForRowTableViewCell:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = objc_alloc(MEMORY[0x24BDF67E0]);
    objc_msgSend(v4, "row");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v7;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v6, "initWithActivityItems:applicationActivities:", v8, v5);

    -[PTUIModuleController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v9, 1, 0);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowTitle, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_module, 0);
}

@end
