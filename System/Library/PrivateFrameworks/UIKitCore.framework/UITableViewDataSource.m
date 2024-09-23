@implementation UITableViewDataSource

+ (id)staticDataSourceWithSections:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  v4 = objc_alloc_init((Class)objc_opt_class());
  objc_msgSend(v4, "setSections:", v3);

  return v4;
}

- (UITableViewDataSource)initWithCoder:(id)a3
{
  id v4;
  UITableViewDataSource *v5;
  uint64_t v6;
  NSArray *sections;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)UITableViewDataSource;
  v5 = -[UITableViewDataSource init](&v9, sel_init);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectForKey:", CFSTR("UITableSections"));
    v6 = objc_claimAutoreleasedReturnValue();
    sections = v5->_sections;
    v5->_sections = (NSArray *)v6;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *sections;

  sections = self->_sections;
  if (sections)
    objc_msgSend(a3, "encodeObject:forKey:", sections, CFSTR("UITableSections"));
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSArray count](self->_sections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  int64_t v6;

  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "rows");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "count");

  return v6;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSArray *sections;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  UITableViewCell *v10;

  sections = self->_sections;
  v5 = a4;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cell");
  v10 = (UITableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = -[UITableViewCell initWithStyle:reuseIdentifier:]([UITableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("blank-cell"));
  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "footerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "frame");
    v7 = v6;
  }
  else
  {
    v7 = -1.0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;
  double v6;
  double v7;

  -[NSArray objectAtIndex:](self->_sections, "objectAtIndex:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "headerView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "frame");
    v7 = v6;
  }
  else
  {
    v7 = -1.0;
  }

  return v7;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  NSArray *sections;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  double v15;

  v6 = a3;
  sections = self->_sections;
  v8 = a4;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v8, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rows");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v8, "row");

  objc_msgSend(v10, "objectAtIndex:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "height");
  v14 = v13;

  if (v14 == -1.0)
  {
    objc_msgSend(v6, "rowHeight");
    v14 = v15;
  }

  return v14;
}

- (BOOL)tableView:(id)a3 canEditRowAtIndexPath:(id)a4
{
  return 0;
}

- (BOOL)tableView:(id)a3 canMoveRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 0;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  NSArray *sections;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int64_t v11;

  sections = self->_sections;
  v5 = a4;
  -[NSArray objectAtIndex:](sections, "objectAtIndex:", objc_msgSend(v5, "section"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "rows");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "cell");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "indentationLevel");

  return v11;
}

- (NSArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sections, 0);
}

@end
