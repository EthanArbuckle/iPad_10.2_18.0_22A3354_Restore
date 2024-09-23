@implementation WFTimeOffsetPickerViewController

- (WFTimeOffsetPickerViewController)initWithTimeTriggerEvent:(unint64_t)a3 timeOffset:(unint64_t)a4
{
  WFTimeOffsetPickerViewController *v6;
  WFTimeOffsetPickerViewController *v7;
  NSArray *tableViewItems;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_class *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  NSArray *sections;
  WFTimeOffsetPickerViewController *v19;
  objc_super v21;
  _QWORD v22[3];
  _QWORD v23[3];
  _QWORD v24[2];

  v24[1] = *MEMORY[0x24BDAC8D0];
  v21.receiver = self;
  v21.super_class = (Class)WFTimeOffsetPickerViewController;
  v6 = -[WFTimeOffsetPickerViewController initWithNibName:bundle:](&v21, sel_initWithNibName_bundle_, 0, 0);
  v7 = v6;
  if (v6)
  {
    v6->_event = a3;
    v6->_timeOffset = a4;
    tableViewItems = v6->_tableViewItems;
    v6->_tableViewItems = (NSArray *)&unk_24E631910;

    -[WFTimeOffsetPickerViewController navigationItem](v7, "navigationItem");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, v7, sel_cancel_);
    objc_msgSend(v9, "setLeftBarButtonItem:", v10);

    -[WFTimeOffsetPickerViewController navigationItem](v7, "navigationItem");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, v7, sel_done_);
    objc_msgSend(v11, "setRightBarButtonItem:", v12);

    v23[0] = CFSTR("start");
    v22[0] = CFSTR("identifier");
    v22[1] = CFSTR("sectionTitle");
    WFLocalizedString(CFSTR("Offset"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v23[1] = v13;
    v22[2] = CFSTR("cellIdentifier");
    v14 = (objc_class *)objc_opt_class();
    NSStringFromClass(v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v23[2] = v15;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v23, v22, 3);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v24[0] = v16;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v24, 1);
    v17 = objc_claimAutoreleasedReturnValue();
    sections = v7->_sections;
    v7->_sections = (NSArray *)v17;

    v19 = v7;
  }

  return v7;
}

- (void)loadView
{
  id v3;
  UITableView *v4;
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;
  UITableView *tableView;
  UITableView *v10;
  id v11;

  v3 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v4 = (UITableView *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGroupedBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView setBackgroundColor:](v4, "setBackgroundColor:", v5);

  -[UITableView setDataSource:](v4, "setDataSource:", self);
  -[UITableView setDelegate:](v4, "setDelegate:", self);
  v6 = objc_opt_class();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITableView registerClass:forCellReuseIdentifier:](v4, "registerClass:forCellReuseIdentifier:", v6, v8);

  tableView = self->_tableView;
  self->_tableView = v4;
  v10 = v4;

  -[WFTimeOffsetPickerViewController setView:](self, "setView:", v10);
  -[WFTimeOffsetPickerViewController tableView](self, "tableView");
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "reloadData");

}

- (id)infoForSection:(int64_t)a3
{
  void *v4;
  void *v5;

  -[WFTimeOffsetPickerViewController sections](self, "sections");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectAtIndexedSubscript:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  void *v3;
  int64_t v4;

  -[WFTimeOffsetPickerViewController sections](self, "sections", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  int v7;
  void *v8;
  int64_t v9;

  -[WFTimeOffsetPickerViewController infoForSection:](self, "infoForSection:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("identifier"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqual:", CFSTR("start"));

  if (v7)
  {
    -[WFTimeOffsetPickerViewController tableViewItems](self, "tableViewItems");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "count");

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  objc_class *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  uint64_t v14;

  v6 = a4;
  v7 = a3;
  v8 = (objc_class *)objc_opt_class();
  NSStringFromClass(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", v9, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[WFTimeOffsetPickerViewController titleForRow:](self, "titleForRow:", objc_msgSend(v6, "row"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setText:", v11);

  objc_msgSend(v10, "setAccessoryType:", 0);
  v13 = -[WFTimeOffsetPickerViewController timeOffset](self, "timeOffset");
  v14 = objc_msgSend(v6, "row");

  if (v13 == v14)
    objc_msgSend(v10, "setAccessoryType:", 3);
  return v10;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  -[WFTimeOffsetPickerViewController infoForSection:](self, "infoForSection:", a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("sectionTitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  uint64_t v7;
  id v8;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  v7 = objc_msgSend(v6, "row");

  -[WFTimeOffsetPickerViewController setTimeOffset:](self, "setTimeOffset:", v7);
  -[WFTimeOffsetPickerViewController tableView](self, "tableView");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "reloadData");

}

- (void)cancel:(id)a3
{
  id v4;

  -[WFTimeOffsetPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeOffsetPickerViewControllerDidCancel:", self);

}

- (void)done:(id)a3
{
  id v4;

  -[WFTimeOffsetPickerViewController delegate](self, "delegate", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "timeOffsetPickerViewController:didSelectOffset:", self, -[WFTimeOffsetPickerViewController timeOffset](self, "timeOffset"));

}

- (id)titleForRow:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;

  -[WFTimeOffsetPickerViewController tableViewItems](self, "tableViewItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  return (id)objc_msgSend(MEMORY[0x24BEC40E0], "localizedSunriseSunsetDescriptionForTriggerEvent:timeOffset:", -[WFTimeOffsetPickerViewController event](self, "event"), v7);
}

- (WFTimeOffsetPickerViewControllerDelegate)delegate
{
  return (WFTimeOffsetPickerViewControllerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)event
{
  return self->_event;
}

- (UIPickerView)currentPickerView
{
  return self->_currentPickerView;
}

- (void)setCurrentPickerView:(id)a3
{
  objc_storeStrong((id *)&self->_currentPickerView, a3);
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

- (NSArray)tableViewItems
{
  return self->_tableViewItems;
}

- (unint64_t)timeOffset
{
  return self->_timeOffset;
}

- (void)setTimeOffset:(unint64_t)a3
{
  self->_timeOffset = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tableViewItems, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_tableView, 0);
  objc_storeStrong((id *)&self->_currentPickerView, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end
