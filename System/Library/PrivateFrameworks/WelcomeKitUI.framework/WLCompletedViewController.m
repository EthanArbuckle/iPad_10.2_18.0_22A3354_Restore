@implementation WLCompletedViewController

- (WLCompletedViewController)initWithWelcomeController:(id)a3 context:(id)a4 imported:(BOOL)a5
{
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  const __CFString *v24;
  BOOL v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  WLCompletedViewController *v33;
  uint64_t v34;
  NSArray *items;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  char v42;
  id obj;
  objc_super v44;

  v8 = a3;
  v9 = a4;
  WLLocalizedString();
  v10 = objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "album");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "importErrorCount");

  objc_msgSend(v9, "image");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  obj = a3;
  v14 = (void *)v10;
  v15 = v8;
  if (objc_msgSend(v13, "importErrorCount"))
  {
    v16 = 1;
  }
  else
  {
    objc_msgSend(v9, "video");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v17, "importErrorCount") != 0;

  }
  objc_msgSend(v9, "voiceMemo");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "importErrorCount");

  objc_msgSend(MEMORY[0x24BDF69C8], "modelSpecificLocalizedStringKeyForKey:", CFSTR("COMPLETED_DESCRIPTION"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  WLLocalizedString();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    WLLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingFormat:", CFSTR("\n\n%@"), v22);
    v23 = objc_claimAutoreleasedReturnValue();

    v24 = CFSTR(" ");
    v21 = (void *)v23;
    if (!v16)
      goto LABEL_9;
  }
  else
  {
    v24 = CFSTR("\n\n");
    if (!v16)
      goto LABEL_9;
  }
  if (v19)
  {
LABEL_13:
    v26 = v15;
    v27 = v14;
LABEL_14:
    WLLocalizedString();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringByAppendingFormat:", CFSTR("%@%@"), v24, v28);
    v29 = objc_claimAutoreleasedReturnValue();

    v21 = (void *)v29;
    goto LABEL_15;
  }
LABEL_9:
  if (v19)
    v25 = 0;
  else
    v25 = v16;
  if (v25)
    goto LABEL_13;
  if (v19)
    v42 = v16;
  else
    v42 = 1;
  v26 = v15;
  v27 = v14;
  if ((v42 & 1) == 0)
    goto LABEL_14;
LABEL_15:
  v30 = (void *)MEMORY[0x24BDF6AC8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "imageNamed:inBundle:", CFSTR("MoveToiOS"), v31);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v44.receiver = self;
  v44.super_class = (Class)WLCompletedViewController;
  v33 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v44, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v27, v21, v32, 1);

  if (v33)
  {
    objc_storeStrong((id *)&v33->_welcomeController, obj);
    if (objc_msgSend(v9, "isEnabled"))
    {
      +[WLDetailItem items:](WLDetailItem, "items:", v9);
      v34 = objc_claimAutoreleasedReturnValue();
      items = v33->_items;
      v33->_items = (NSArray *)v34;

    }
    objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    WLLocalizedString();
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "setTitle:forState:", v37, 0);

    objc_msgSend(v36, "addTarget:action:forControlEvents:", v33, sel__continueTapped_, 64);
    -[WLCompletedViewController buttonTray](v33, "buttonTray");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "addButton:", v36);

    -[OBBaseWelcomeController navigationItem](v33, "navigationItem");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "setTitle:", &stru_24E1499D0);

    -[OBBaseWelcomeController navigationItem](v33, "navigationItem");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "setHidesBackButton:animated:", 1, 0);

  }
  return v33;
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
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)WLCompletedViewController;
  -[OBTableWelcomeController viewDidLoad](&v11, sel_viewDidLoad);
  v3 = objc_alloc(MEMORY[0x24BDF6E58]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v4);

  -[OBTableWelcomeController tableView](self, "tableView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("WLCompletedViewCell"));

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

}

- (void)_continueTapped:(id)a3
{
  void (**continueHandler)(void);

  continueHandler = (void (**)(void))self->_continueHandler;
  if (continueHandler)
    continueHandler[2]();
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_items, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  NSArray *items;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;

  v6 = a4;
  objc_msgSend(a3, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("WLCompletedViewCell"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF6950], "systemBackgroundColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v8);

  items = self->_items;
  v10 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](items, "objectAtIndexedSubscript:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "showDetailDiscloureButton"))
    v12 = 2;
  else
    v12 = 3;
  objc_msgSend(v7, "setAccessoryType:", v12);
  objc_msgSend(MEMORY[0x24BDF6B80], "cellConfiguration");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "text");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v14);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF77E8]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "textProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v15);

  objc_msgSend(v11, "secondaryText");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setSecondaryText:", v17);

  objc_msgSend(MEMORY[0x24BDF6A70], "preferredFontForTextStyle:", *MEMORY[0x24BDF7810]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "secondaryTextProperties");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFont:", v18);

  objc_msgSend(v7, "setContentConfiguration:", v13);
  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  NSArray *items;
  uint64_t v8;
  WLDetailWarningViewController *v9;
  void *v10;
  id v11;

  v6 = a4;
  objc_msgSend(a3, "deselectRowAtIndexPath:animated:", v6, 1);
  items = self->_items;
  v8 = objc_msgSend(v6, "row");

  -[NSArray objectAtIndexedSubscript:](items, "objectAtIndexedSubscript:", v8);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "showDetailDiscloureButton"))
  {
    v9 = -[WLDetailWarningViewController initWithWLDetailItem:]([WLDetailWarningViewController alloc], "initWithWLDetailItem:", v11);
    -[WLCompletedViewController navigationController](self, "navigationController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pushViewController:animated:", v9, 1);

  }
}

- (id)continueHandler
{
  return self->_continueHandler;
}

- (void)setContinueHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1240);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_continueHandler, 0);
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_welcomeController, 0);
}

@end
