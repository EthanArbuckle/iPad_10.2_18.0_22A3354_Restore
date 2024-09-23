@implementation WLTipsListViewController

- (WLTipsListViewController)initWithItems
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  __CFString *v9;
  __CFString *v10;
  WLTipsListViewController *v11;
  uint64_t v12;
  NSArray *tips;
  objc_super v15;

  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("TIPS_TITLE"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("TIPS_DESCRIPTION"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");
  v9 = CFSTR("ipad");
  if (!v8)
    v9 = CFSTR("iphone");
  v10 = v9;

  v15.receiver = self;
  v15.super_class = (Class)WLTipsListViewController;
  v11 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v15, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v4, v6, v10, 1);

  if (v11)
  {
    +[WLTips tips](WLTips, "tips");
    v12 = objc_claimAutoreleasedReturnValue();
    tips = v11->_tips;
    v11->_tips = (NSArray *)v12;

  }
  return v11;
}

- (void)viewDidLoad
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  objc_super v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x24BDAC8D0];
  v14.receiver = self;
  v14.super_class = (Class)WLTipsListViewController;
  -[OBTableWelcomeController viewDidLoad](&v14, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDF6E58]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 0, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WLTipsListViewCell"));

  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  -[OBTableWelcomeController tableView](self, "tableView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_opt_self();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v15, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (id)-[WLTipsListViewController registerForTraitChanges:withAction:](self, "registerForTraitChanges:withAction:", v12, sel_userInterfaceStyleDidChange);

}

- (void)userInterfaceStyleDidChange
{
  id v2;

  -[OBTableWelcomeController tableView](self, "tableView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reloadData");

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_tips, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *tips;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
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
  void *v28;
  void *v29;
  void *v30;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WLTipsListViewCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  objc_msgSend(v7, "setAccessoryType:", 1);
  objc_msgSend(v7, "imageView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemLightGrayColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setBackgroundColor:", v10);

  tips = self->_tips;
  v12 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](tips, "objectAtIndexedSubscript:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "userInterfaceStyle");

  objc_msgSend(MEMORY[0x24BDF6B80], "valueCellConfiguration");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(v13, "thumbnail");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  if (v16 == 2)
    objc_msgSend(v19, "dark");
  else
    objc_msgSend(v19, "light");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "localFile");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "imageNamed:", v22);
  v23 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v17, "setImage:", v23);
  objc_msgSend(v17, "imageProperties");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setMaximumSize:", 100.0, 100.0);

  objc_msgSend(v13, "title");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setText:", v25);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "textProperties");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "setFont:", v26);

  objc_msgSend(v13, "desc");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setSecondaryText:", v28);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "secondaryTextProperties");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFont:", v29);

  objc_msgSend(v7, "setContentConfiguration:", v17);
  return v7;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  id v4;
  void *v5;

  v4 = objc_alloc(MEMORY[0x24BDF6F90]);
  v5 = (void *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  objc_msgSend(v5, "setUserInteractionEnabled:", 0);
  return v5;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  double result;

  +[WLProgressBar height](WLProgressBar, "height", a3, a4);
  return result;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  NSArray *tips;
  uint64_t v8;
  WLTipsViewController *v9;
  void *v10;
  id v11;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  tips = self->_tips;
  v8 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](tips, "objectAtIndexedSubscript:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  v9 = -[WLTipsViewController initWithTips:]([WLTipsViewController alloc], "initWithTips:", v11);
  -[WLTipsListViewController navigationController](self, "navigationController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "pushViewController:animated:", v9, 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tips, 0);
}

@end
