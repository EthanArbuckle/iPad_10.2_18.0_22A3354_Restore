@implementation WFValueListViewController

- (WFValueListViewController)initWithTitles:(id)a3 switchTitle:(id)a4
{
  return -[WFValueListViewController initWithTitles:switchTitle:sublist:](self, "initWithTitles:switchTitle:sublist:", a3, a4, 0);
}

- (WFValueListViewController)initWithTitles:(id)a3 switchTitle:(id)a4 sublist:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  WFValueListViewController *v12;

  v8 = a5;
  v9 = a4;
  v10 = a3;
  +[WFAppearanceProxy defaultAppearanceProxy](WFAppearanceProxy, "defaultAppearanceProxy");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[WFValueListViewController initWithTitles:switchTitle:sublist:appearanceProxy:](self, "initWithTitles:switchTitle:sublist:appearanceProxy:", v10, v9, v8, v11);

  return v12;
}

- (WFValueListViewController)initWithTitles:(id)a3 switchTitle:(id)a4 sublist:(id)a5 appearanceProxy:(id)a6
{
  id v11;
  id v12;
  id v13;
  WFValueListViewController *v14;
  WFValueListViewController *v15;
  NSMutableArray *v16;
  NSMutableArray *sections;
  id v18;
  uint64_t v19;
  UISwitch *configSwitch;
  _QWORD v22[4];
  WFValueListViewController *v23;
  objc_super v24;

  v11 = a3;
  v12 = a4;
  v13 = a5;
  v24.receiver = self;
  v24.super_class = (Class)WFValueListViewController;
  v14 = -[WFValueListViewController initWithStyle:](&v24, sel_initWithStyle_, objc_msgSend(a6, "tableViewStyle"));
  v15 = v14;
  if (v14)
  {
    objc_storeStrong((id *)&v14->_titles, a3);
    v15->_hasSwitch = v12 != 0;
    v16 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sections = v15->_sections;
    v15->_sections = v16;

    objc_storeStrong((id *)&v15->_switchTitle, a4);
    if (v15->_hasSwitch)
    {
      -[NSMutableArray addObject:](v15->_sections, "addObject:", &unk_24DB59848);
      v18 = objc_alloc(MEMORY[0x24BEBD9B8]);
      v19 = objc_msgSend(v18, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
      configSwitch = v15->_configSwitch;
      v15->_configSwitch = (UISwitch *)v19;

      -[UISwitch setOn:](v15->_configSwitch, "setOn:", 1);
    }
    if (v13)
    {
      -[NSMutableArray addObject:](v15->_sections, "addObject:", &unk_24DB59860);
      -[WFValueListViewController setSublist:](v15, "setSublist:", v13);
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __80__WFValueListViewController_initWithTitles_switchTitle_sublist_appearanceProxy___block_invoke;
      v22[3] = &unk_24DB375A8;
      v23 = v15;
      objc_msgSend(v13, "setCompletionHandler:", v22);

    }
    if (-[NSArray count](v15->_titles, "count"))
      -[NSMutableArray addObject:](v15->_sections, "addObject:", &unk_24DB59878);
  }

  return v15;
}

void __80__WFValueListViewController_initWithTitles_switchTitle_sublist_appearanceProxy___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "sections");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "indexOfObject:", &unk_24DB59860);

  if (v3 != 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(*(id *)(a1 + 32), "tableView");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "reloadSections:withRowAnimation:", v4, 5);

  }
}

- (void)viewDidLoad
{
  double v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFValueListViewController;
  -[WFValueListViewController viewDidLoad](&v8, sel_viewDidLoad);
  v3 = *MEMORY[0x24BEBE770];
  -[WFValueListViewController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setRowHeight:", v3);

  -[WFValueListViewController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setEstimatedRowHeight:", 44.0);

  -[WFValueListViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setEstimatedSectionHeaderHeight:", 0.0);

  -[WFValueListViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setEstimatedSectionFooterHeight:", 0.0);

}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD, _QWORD);
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)WFValueListViewController;
  -[WFValueListViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  -[WFValueListViewController completionHandler](self, "completionHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[WFValueListViewController completionHandler](self, "completionHandler");
    v5 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[WFValueListViewController selectedTitle](self, "selectedTitle");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFValueListViewController configSwitch](self, "configSwitch");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v5)[2](v5, v6, objc_msgSend(v7, "isOn"));

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return -[NSMutableArray count](self->_sections, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  v6 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &unk_24DB59848);
  v7 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &unk_24DB59878);
  v8 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &unk_24DB59860);
  if (v6 == a4)
    return a4 != 0x7FFFFFFFFFFFFFFFLL;
  if (v7 == a4)
  {
    if (a4 == 0x7FFFFFFFFFFFFFFFLL)
      return 0;
    else
      return -[NSArray count](self->_titles, "count");
  }
  else
  {
    return v8 == a4 && a4 != 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
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

  v6 = a3;
  v7 = a4;
  v8 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &unk_24DB59848);
  v9 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &unk_24DB59878);
  v10 = -[NSMutableArray indexOfObject:](self->_sections, "indexOfObject:", &unk_24DB59860);
  if (objc_msgSend(v7, "section") == v8)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("kWFValueListCellRandomMACSwitchCellIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("kWFValueListCellRandomMACSwitchCellIdentifier"));
    -[WFValueListViewController switchTitle](self, "switchTitle");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    objc_msgSend(v11, "setAccessoryView:", self->_configSwitch);
    objc_msgSend(v11, "setSelectionStyle:", 0);
  }
  else if (objc_msgSend(v7, "section") == v9)
  {
    -[WFValueListViewController cellForTitleAtIndexPath:](self, "cellForTitleAtIndexPath:", v7);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (objc_msgSend(v7, "section") == v10)
  {
    objc_msgSend(v6, "dequeueReusableCellWithIdentifier:", CFSTR("kWFValueListCellPrivateAddressCellIdentifier"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v11)
    {
      v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1, CFSTR("kWFValueListCellPrivateAddressCellIdentifier"));
      objc_msgSend(v11, "setSelectionStyle:", 0);
      objc_msgSend(MEMORY[0x24BEBD4B8], "altTextColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "detailTextLabel");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setTextColor:", v14);

      objc_msgSend(v11, "setAccessoryType:", 1);
    }
    -[WFValueListViewController navigationItem](self->_sublist, "navigationItem");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "title");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "textLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setText:", v17);

    -[WFValueListViewController selectedTitle](self->_sublist, "selectedTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "detailTextLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setText:", v19);

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (id)cellForTitleAtIndexPath:(id)a3
{
  objc_class *v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;

  v4 = (objc_class *)MEMORY[0x24BEBD9F8];
  v5 = a3;
  v6 = (void *)objc_msgSend([v4 alloc], "initWithStyle:reuseIdentifier:", 1, 0);
  -[WFValueListViewController titles](self, "titles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "row");

  objc_msgSend(v7, "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "textLabel");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setText:", v9);

  -[WFValueListViewController selectedTitle](self, "selectedTitle");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "isEqualToString:", v11))
    v12 = 3;
  else
    v12 = 0;
  objc_msgSend(v6, "setAccessoryType:", v12);

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  char v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void (**v18)(_QWORD, _QWORD, _QWORD);
  void *v19;
  void *v20;
  id v21;

  v21 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v21, 1);
  -[WFValueListViewController sections](self, "sections");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectAtIndex:", objc_msgSend(v21, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  if (v8 == 1)
  {
    if (!self->_sublist)
      goto LABEL_8;
    -[WFValueListViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", self->_sublist, 1);
  }
  else
  {
    if (v8 != 2)
      goto LABEL_8;
    -[WFValueListViewController titles](self, "titles");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "objectAtIndex:", objc_msgSend(v21, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    -[WFValueListViewController selectedTitle](self, "selectedTitle");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "isEqualToString:", v11);

    if ((v12 & 1) == 0)
    {
      -[WFValueListViewController setSelectedTitle:](self, "setSelectedTitle:", v10);
      -[WFValueListViewController tableView](self, "tableView");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend(v21, "section"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "reloadSections:withRowAnimation:", v14, 5);

      -[WFValueListViewController tableView](self, "tableView");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD15E0], "indexSetWithIndex:", objc_msgSend(v21, "section"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "_reloadSectionHeaderFooters:withRowAnimation:", v16, 5);

    }
  }

LABEL_8:
  -[WFValueListViewController completionHandler](self, "completionHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    -[WFValueListViewController completionHandler](self, "completionHandler");
    v18 = (void (**)(_QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[WFValueListViewController selectedTitle](self, "selectedTitle");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[WFValueListViewController configSwitch](self, "configSwitch");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *, uint64_t))v18)[2](v18, v19, objc_msgSend(v20, "isOn"));

  }
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;

  -[WFValueListViewController footerHandler](self, "footerHandler", a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[WFValueListViewController footerHandler](self, "footerHandler");
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    -[WFValueListViewController selectedTitle](self, "selectedTitle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, void *))v6)[2](v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  return v8;
}

- (NSString)selectedTitle
{
  return self->_selectedTitle;
}

- (void)setSelectedTitle:(id)a3
{
  objc_storeStrong((id *)&self->_selectedTitle, a3);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1040);
}

- (id)footerHandler
{
  return self->_footerHandler;
}

- (void)setFooterHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (BOOL)switchOn
{
  return self->_switchOn;
}

- (void)setSwitchOn:(BOOL)a3
{
  self->_switchOn = a3;
}

- (NSArray)titles
{
  return self->_titles;
}

- (void)setTitles:(id)a3
{
  objc_storeStrong((id *)&self->_titles, a3);
}

- (BOOL)hasSwitch
{
  return self->_hasSwitch;
}

- (void)setHasSwitch:(BOOL)a3
{
  self->_hasSwitch = a3;
}

- (UISwitch)configSwitch
{
  return self->_configSwitch;
}

- (void)setConfigSwitch:(id)a3
{
  objc_storeStrong((id *)&self->_configSwitch, a3);
}

- (NSMutableArray)sections
{
  return self->_sections;
}

- (void)setSections:(id)a3
{
  objc_storeStrong((id *)&self->_sections, a3);
}

- (NSString)switchTitle
{
  return self->_switchTitle;
}

- (void)setSwitchTitle:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1080);
}

- (WFValueListViewController)sublist
{
  return self->_sublist;
}

- (void)setSublist:(id)a3
{
  objc_storeStrong((id *)&self->_sublist, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sublist, 0);
  objc_storeStrong((id *)&self->_switchTitle, 0);
  objc_storeStrong((id *)&self->_sections, 0);
  objc_storeStrong((id *)&self->_configSwitch, 0);
  objc_storeStrong((id *)&self->_titles, 0);
  objc_storeStrong(&self->_footerHandler, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_selectedTitle, 0);
}

@end
