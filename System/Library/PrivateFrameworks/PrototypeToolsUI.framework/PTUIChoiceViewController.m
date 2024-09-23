@implementation PTUIChoiceViewController

- (PTUIChoiceViewController)initWithPresentingRow:(id)a3
{
  id v5;
  PTUIChoiceViewController *v6;
  PTUIChoiceViewController *v7;
  id *p_row;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  uint64_t v13;
  NSIndexPath *valueIndexPath;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)PTUIChoiceViewController;
  v6 = -[PTUIChoiceViewController initWithStyle:](&v16, sel_initWithStyle_, 2);
  v7 = v6;
  if (v6)
  {
    p_row = (id *)&v6->_row;
    objc_storeStrong((id *)&v6->_row, a3);
    objc_msgSend(*p_row, "addObserver:", v7);
    -[PTUIChoiceViewController navigationItem](v7, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*p_row, "title");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setTitle:", v10);

    v11 = *p_row;
    objc_msgSend(*p_row, "value");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "indexPathForValue:", v12);
    v13 = objc_claimAutoreleasedReturnValue();
    valueIndexPath = v7->_valueIndexPath;
    v7->_valueIndexPath = (NSIndexPath *)v13;

  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PTChoiceRow removeObserver:](self->_row, "removeObserver:", self);
  v3.receiver = self;
  v3.super_class = (Class)PTUIChoiceViewController;
  -[PTUIChoiceViewController dealloc](&v3, sel_dealloc);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)rowDidReload:(id)a3
{
  id v3;

  -[PTUIChoiceViewController tableView](self, "tableView", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[PTChoiceRow numberOfSections](self->_row, "numberOfSections", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[PTChoiceRow numberOfRowsInSection:](self->_row, "numberOfRowsInSection:", a4);
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  void *v6;

  -[PTChoiceRow titleForSection:](self->_row, "titleForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    v5 = (void *)objc_opt_new();
    objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7800]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setFont:", v6);

    objc_msgSend(v5, "setText:", v4);
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  _PTUIChoiceCell *v7;
  void *v8;
  PTChoiceRow *row;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("cell"));
  v7 = (_PTUIChoiceCell *)objc_claimAutoreleasedReturnValue();
  if (!v7)
    v7 = -[_PTUIChoiceCell initWithReuseIdentifier:]([_PTUIChoiceCell alloc], "initWithReuseIdentifier:", CFSTR("cell"));
  -[PTChoiceRow titleForRow:inSection:](self->_row, "titleForRow:inSection:", objc_msgSend(v6, "row"), objc_msgSend(v6, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PTUIChoiceCell setTitle:](v7, "setTitle:", v8);

  row = self->_row;
  v10 = objc_msgSend(v6, "row");
  v11 = objc_msgSend(v6, "section");

  -[PTChoiceRow valueForRow:inSection:](row, "valueForRow:inSection:", v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTChoiceRow value](self->_row, "value");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[_PTUIChoiceCell setChecked:](v7, "setChecked:", objc_msgSend(v13, "isEqual:", v12));

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  PTChoiceRow *row;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  row = self->_row;
  v8 = objc_msgSend(v6, "row");
  v9 = objc_msgSend(v6, "section");

  -[PTChoiceRow valueForRow:inSection:](row, "valueForRow:inSection:", v8, v9);
  v12 = (id)objc_claimAutoreleasedReturnValue();
  -[PTChoiceRow setValue:](self->_row, "setValue:", v12);
  -[PTUIChoiceViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (id)objc_msgSend(v10, "popViewControllerAnimated:", 1);

}

- (void)_checkAppropriateCell
{
  PTChoiceRow *row;
  void *v4;
  NSIndexPath *v5;
  void *v6;
  void *v7;
  void *v8;
  NSIndexPath *valueIndexPath;
  id v10;

  row = self->_row;
  -[PTChoiceRow value](row, "value");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PTChoiceRow indexPathForValue:](row, "indexPathForValue:", v4);
  v5 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();

  -[PTUIChoiceViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cellForRowAtIndexPath:", self->_valueIndexPath);
  v10 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "setChecked:", 0);
  -[PTUIChoiceViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "cellForRowAtIndexPath:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setChecked:", 1);
  valueIndexPath = self->_valueIndexPath;
  self->_valueIndexPath = v5;

}

- (PTChoiceRow)row
{
  return self->_row;
}

- (void)setRow:(id)a3
{
  objc_storeStrong((id *)&self->_row, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_row, 0);
  objc_storeStrong((id *)&self->_valueIndexPath, 0);
}

@end
