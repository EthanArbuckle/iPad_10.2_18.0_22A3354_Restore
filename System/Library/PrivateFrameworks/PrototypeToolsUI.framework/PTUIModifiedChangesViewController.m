@implementation PTUIModifiedChangesViewController

- (void)_populateTableDataAndChildren
{
  NSMutableArray *v3;
  NSMutableArray *tableData;
  NSMutableArray *v5;
  NSMutableArray *children;
  void *v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;

  v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  tableData = self->_tableData;
  self->_tableData = v3;

  v5 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
  children = self->_children;
  self->_children = v5;

  -[PTParameterRecords recordDictionary](self->_parameterRecords, "recordDictionary");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "allKeys");
  v19 = (id)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v19, "count"))
  {
    v8 = 0;
    do
    {
      objc_msgSend(v19, "objectAtIndexedSubscript:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PTParameterRecords recordDictionary](self->_parameterRecords, "recordDictionary");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKey:", v9);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithObjects:", v9, 0);
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        while (1)
        {
          objc_msgSend(v11, "allKeys");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "count");

          if (v14 != 1)
            break;
          objc_msgSend(v11, "allKeys");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "firstObject");
          v16 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v12, "addObject:", v16);
          objc_msgSend(v11, "objectForKey:", v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          objc_opt_class();
          v11 = v17;
          if ((objc_opt_isKindOfClass() & 1) == 0)
            goto LABEL_8;
        }
      }
      v17 = v11;
LABEL_8:
      objc_msgSend(v12, "componentsJoinedByString:", CFSTR("."));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSMutableArray addObject:](self->_tableData, "addObject:", v18);
      -[NSMutableArray addObject:](self->_children, "addObject:", v17);

      ++v8;
    }
    while (objc_msgSend(v19, "count") > v8);
  }

}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PTUIModifiedChangesViewController;
  -[PTUIModifiedChangesViewController viewDidLoad](&v7, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDF6E58]);
  -[PTUIModifiedChangesViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "bounds");
  v5 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2);

  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("ParameterRecordStandardCell"));
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setDataSource:", self);
  objc_msgSend(v5, "reloadData");
  -[PTUIModifiedChangesViewController view](self, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addSubview:", v5);

}

- (PTUIModifiedChangesViewController)initWithParameterRecords:(id)a3 withTitle:(id)a4
{
  id v7;
  id v8;
  PTUIModifiedChangesViewController *v9;
  PTUIModifiedChangesViewController *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PTUIModifiedChangesViewController;
  v9 = -[PTUIModifiedChangesViewController init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_parameterRecords, a3);
    -[PTUIModifiedChangesViewController _populateTableDataAndChildren](v10, "_populateTableDataAndChildren");
    -[PTUIModifiedChangesViewController setTitle:](v10, "setTitle:", v8);
  }

  return v10;
}

- (int64_t)tableView:(id)a3 indentationLevelForRowAtIndexPath:(id)a4
{
  return 0;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  PTUIModifiedChangesViewController *v10;
  void *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  -[NSMutableArray objectAtIndex:](self->_tableData, "objectAtIndex:", objc_msgSend(v6, "row"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray objectAtIndex:](self->_children, "objectAtIndex:", objc_msgSend(v6, "row"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);
      v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BE7B340]), "initWithDictionary:", v8);
      v10 = -[PTUIModifiedChangesViewController initWithParameterRecords:withTitle:]([PTUIModifiedChangesViewController alloc], "initWithParameterRecords:withTitle:", v9, v7);
      -[PTUIModifiedChangesViewController navigationController](self, "navigationController");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "pushViewController:animated:", v10, 1);

    }
  }

}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  int64_t result;

  result = -[NSMutableArray count](self->_tableData, "count", a3, a4);
  if ((unint64_t)result <= 1)
    return 1;
  return result;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:", CFSTR("ParameterRecordStandardCell"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "defaultContentConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_tableData, "count"))
  {
    -[NSMutableArray objectAtIndex:](self->_tableData, "objectAtIndex:", objc_msgSend(v6, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setText:", v9);
    -[NSMutableArray objectAtIndex:](self->_children, "objectAtIndex:", objc_msgSend(v6, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v7, "setAccessoryType:", 1);
    }
    else
    {
      objc_msgSend(v7, "setSelectionStyle:", 0);
      objc_msgSend(v10, "changedValue");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;

      objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%.3f"), v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "setSecondaryText:", v14);

    }
  }
  else
  {
    objc_msgSend(v8, "setText:", CFSTR("Hey there! 👋 It looks like you haven't changed any parameters from their default values in this prototyping session.\n\nAny settings changes that you make will eventually be viewable here. Feel free to consult this section later whenever you're curious about how your new settings differ from default settings. 😊"));
  }
  objc_msgSend(v7, "setContentConfiguration:", v8);

  return v7;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_children, 0);
  objc_storeStrong((id *)&self->_tableData, 0);
  objc_storeStrong((id *)&self->_parameterRecords, 0);
}

@end
