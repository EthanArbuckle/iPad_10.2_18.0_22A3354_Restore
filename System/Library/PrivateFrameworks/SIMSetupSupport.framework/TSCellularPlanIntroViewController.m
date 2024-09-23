@implementation TSCellularPlanIntroViewController

- (TSCellularPlanIntroViewController)initWithShowTransferOption:(BOOL)a3 requireDelayBluetoothConnection:(BOOL)a4
{
  void *v7;
  uint64_t v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  TSCellularPlanIntroViewController *v16;
  TSCellularPlanIntroViewController *v17;
  objc_super v19;

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "getSupportedFlowTypes");

  if (v8)
  {
    v9 = -[TSCellularPlanIntroViewController _hideQRCodeOption](self, "_hideQRCodeOption");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v9)
      v12 = CFSTR("CELLULAR_PLAN_INTRO_DETAIL_NO_QR_CODE");
    else
      v12 = CFSTR("CELLULAR_PLAN_INTRO_DETAIL");
    objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_24DEF4290, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("SET_UP_CELLULAR"), &stru_24DEF4290, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v19.receiver = self;
    v19.super_class = (Class)TSCellularPlanIntroViewController;
    v16 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v19, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v15, v13, CFSTR("antenna.radiowaves.left.and.right"), 1);

    if (v16)
    {
      v16->_showTransferOption = a3;
      v16->_requireDelayBluetoothConnection = a4;
    }
    self = v16;

    v17 = self;
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (TSCellularPlanIntroViewController)initWithTransferBackPlan:(id)a3
{
  id v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TSCellularPlanIntroViewController *v12;
  TSCellularPlanIntroViewController *v13;
  objc_super v15;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "getSupportedFlowTypes");

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_INTRO_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SET_UP_CELLULAR"), &stru_24DEF4290, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v15.receiver = self;
    v15.super_class = (Class)TSCellularPlanIntroViewController;
    v12 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v15, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v11, v9, CFSTR("antenna.radiowaves.left.and.right"), 1);

    if (v12)
    {
      v12->_showTransferOption = 1;
      v12->_requireDelayBluetoothConnection = 0;
      objc_storeStrong(&v12->_transferBackPlan, a3);
    }
    self = v12;

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  OBLinkTrayButton *v6;
  OBLinkTrayButton *laterButton;
  OBLinkTrayButton *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _BOOL4 v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)TSCellularPlanIntroViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v34, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanIntroViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v6 = (OBLinkTrayButton *)objc_claimAutoreleasedReturnValue();
    laterButton = self->_laterButton;
    self->_laterButton = v6;

    v8 = self->_laterButton;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER_IN_SETTINGS"), &stru_24DEF4290, CFSTR("Localizable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBLinkTrayButton setTitle:forState:](v8, "setTitle:forState:", v10, 0);

    -[OBLinkTrayButton addTarget:action:forControlEvents:](self->_laterButton, "addTarget:action:forControlEvents:", self, sel__laterButtonTapped, 64);
    -[TSCellularPlanIntroViewController buttonTray](self, "buttonTray");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addButton:", self->_laterButton);

    -[OBLinkTrayButton setEnabled:](self->_laterButton, "setEnabled:", 1);
    goto LABEL_14;
  }
  v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__laterButtonTapped);
  if (+[TSUtilities isPad](TSUtilities, "isPad"))
  {
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setRightBarButtonItem:", v12);
    goto LABEL_10;
  }
  -[TSCellularPlanIntroViewController navigationController](self, "navigationController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "viewControllers");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v15, "count") < 2)
  {

  }
  else
  {
    v16 = +[TSUtilities isBackAllowed:](TSUtilities, "isBackAllowed:", self);

    if (v16)
    {
      -[OBBaseWelcomeController navigationItem](self, "navigationItem");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setHidesBackButton:animated:", 0, 0);
      goto LABEL_10;
    }
  }
  v13 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__laterButtonTapped);
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setLeftBarButtonItem:", v13);

LABEL_10:
  if (_os_feature_enabled_impl() && !+[TSUtilities isPad](TSUtilities, "isPad"))
  {
    objc_msgSend(MEMORY[0x24BE6E400], "accessoryButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("LEARN_MORE"), &stru_24DEF4290, CFSTR("Localizable"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setTitle:forState:", v20, 0);

    objc_msgSend(v18, "addTarget:action:forControlEvents:", self, sel__learnMoreButtonTapped, 64);
    -[TSCellularPlanIntroViewController headerView](self, "headerView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "addAccessoryButton:", v18);

  }
LABEL_14:
  v22 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v23 = (void *)objc_msgSend(v22, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v23);

  -[OBTableWelcomeController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setDirectionalLayoutMargins:", 1.0, 1.0, 1.0, 1.0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "setBackgroundColor:", v27);

  -[OBTableWelcomeController tableView](self, "tableView");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setScrollEnabled:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setAllowsMultipleSelection:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "reloadData");

  -[OBTableWelcomeController tableView](self, "tableView");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "layoutIfNeeded");

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSCellularPlanIntroViewController;
  -[OBTableWelcomeController viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[TSCellularPlanIntroViewController _viewWillAppear](self, "_viewWillAppear");
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  objc_super v5;
  objc_super v6;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[TSCellularPlanIntroViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  v6.receiver = self;
  v6.super_class = (Class)TSCellularPlanIntroViewController;
  -[TSCellularPlanIntroViewController updateViewConstraints](&v6, sel_updateViewConstraints);
  v5.receiver = self;
  v5.super_class = (Class)TSCellularPlanIntroViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v5, sel_viewDidLayoutSubviews);
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (-[TSCellularPlanIntroViewController _hideQRCodeOption](self, "_hideQRCodeOption", a3, a4)
    || !self->_showTransferOption
    || self->_transferBackPlan)
  {
    return 1;
  }
  else
  {
    return 2;
  }
}

- (id)getCellTextAt:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;

  v4 = a3;
  v5 = v4;
  if (self->_showTransferOption && !objc_msgSend(v4, "row"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("TRANSFER_CATEGORY_TITLE");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = CFSTR("SCAN_CATEGORY_TITLE");
  }
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24DEF4290, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  double v14;
  double v15;

  v6 = a4;
  v7 = a3;
  -[TSCellularPlanIntroViewController getCellTextAt:](self, "getCellTextAt:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = objc_msgSend(v6, "section");

  objc_msgSend(v10, "stringWithFormat:", CFSTR("options%ld"), v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "sizeWithFont:constrainedToSize:lineBreakMode:", v9, 0, 235.0, 3.40282347e38);
  v15 = fmax(v14, 60.0);

  return v15;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  id v8;
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
  id v21;
  void *v22;
  void *v23;
  void *v24;
  const __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  CGFloat v34;
  double v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  void *v42;
  id v43;
  void *v44;
  CGSize v46;

  v6 = a4;
  v7 = (void *)MEMORY[0x24BDD17C8];
  v8 = a3;
  objc_msgSend(v7, "stringWithFormat:", CFSTR("options%ld"), objc_msgSend(v6, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 0, v9);
  objc_msgSend(v10, "contentView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setLayoutMargins:", 10.0, 0.0, 0.0, 0.0);

  objc_msgSend(v10, "setAccessoryType:", 1);
  objc_msgSend(MEMORY[0x24BEBD4B8], "secondarySystemBackgroundColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v12);

  objc_msgSend(v10, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setLineBreakMode:", 0);

  objc_msgSend(v10, "textLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setNumberOfLines:", 0);

  objc_msgSend(v10, "textLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE200]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "textLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v16);

  objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:weight:scale:", 4, 2, 28.0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("iphone.and.arrow.forward"), v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:withConfiguration:", CFSTR("qrcode"), v18);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_showTransferOption && !objc_msgSend(v6, "row"))
  {
    v21 = v19;
    objc_msgSend(v10, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = CFSTR("TRANSFER_CATEGORY_TITLE");
  }
  else
  {
    v21 = v20;
    objc_msgSend(v10, "textLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = v23;
    v25 = CFSTR("SCAN_CATEGORY_TITLE");
  }
  objc_msgSend(v23, "localizedStringForKey:value:table:", v25, &stru_24DEF4290, CFSTR("Localizable"));
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setText:", v26);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "imageWithTintColor:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v19, "size");
  v30 = v29;
  objc_msgSend(v20, "size");
  if (v30 <= v31)
    v32 = v20;
  else
    v32 = v19;
  objc_msgSend(v32, "size");
  v34 = v33;
  objc_msgSend(v19, "size");
  v36 = v35;
  objc_msgSend(v20, "size");
  if (v36 <= v37)
    v38 = v20;
  else
    v38 = v19;
  objc_msgSend(v38, "size");
  v46.width = v34;
  UIGraphicsBeginImageContextWithOptions(v46, 0, 0.0);
  objc_msgSend(v28, "size");
  v40 = v39;
  objc_msgSend(v28, "size");
  objc_msgSend(v28, "drawInRect:", 0.0, 0.0, v40, v41);
  UIGraphicsGetImageFromCurrentImageContext();
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v43 = (id)objc_msgSend(v42, "imageWithRenderingMode:", 1);
  objc_msgSend(v10, "imageView");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setImage:", v42);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  int *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v6 = a4;
  v7 = v6;
  if (self->_showTransferOption && !objc_msgSend(v6, "row"))
    v8 = &OBJC_IVAR___TSCellularPlanIntroViewController__isProximityTransferButtonTapped;
  else
    v8 = &OBJC_IVAR___TSCellularPlanIntroViewController__isScanButtonTapped;
  *((_BYTE *)&self->super.super.super.super.super.super.super.isa + *v8) = 1;
  -[OBTableWelcomeController tableView](self, "tableView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "deselectRowAtIndexPath:animated:", v7, 1);

  -[TSCellularPlanIntroViewController delegate](self, "delegate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "viewControllerDidComplete:", self);

}

- (BOOL)userInteractionEnabled
{
  return 1;
}

- (void)_laterButtonTapped
{
  void *v3;
  char v4;
  void *v5;
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
  void *v16;
  void *v17;
  void *v18;
  id v19;
  _QWORD v20[5];

  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy")
    && (+[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v4 = objc_msgSend(v3, "isEmbeddedSIMOnlyConfig"),
        v3,
        (v4 & 1) != 0))
  {
    v5 = (void *)MEMORY[0x24BEBD3B0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SKIP_SETUP_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SKIP_SETUP_MESSAGE"), &stru_24DEF4290, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "alertControllerWithTitle:message:preferredStyle:", v7, v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SKIP"), &stru_24DEF4290, CFSTR("Localizable"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v20[0] = MEMORY[0x24BDAC760];
    v20[1] = 3221225472;
    v20[2] = __55__TSCellularPlanIntroViewController__laterButtonTapped__block_invoke;
    v20[3] = &unk_24DEF2F40;
    v20[4] = self;
    objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 1, v20);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v14);

    v15 = (void *)MEMORY[0x24BEBD3A8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DEF4290, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, &__block_literal_global_22);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addAction:", v18);

    -[TSCellularPlanIntroViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
  }
  else
  {
    -[TSCellularPlanIntroViewController delegate](self, "delegate");
    v19 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "userDidTapCancel");

  }
}

void __55__TSCellularPlanIntroViewController__laterButtonTapped__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userDidTapCancel");

}

- (void)_learnMoreButtonTapped
{
  +[TSUtilities launchURL:](TSUtilities, "launchURL:", CFSTR("https://support.apple.com/ht212780?cid=mc-ols-esim-article_ht212780-ios_ui-07192022"));
}

- (void)_viewWillAppear
{
  id v3;

  self->_isScanButtonTapped = 0;
  self->_isProximityTransferButtonTapped = 0;
  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    if (!+[TSUtilities isBackAllowed:](TSUtilities, "isBackAllowed:", self))
    {
      -[OBBaseWelcomeController navigationItem](self, "navigationItem");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setHidesBackButton:animated:", 1, 0);

    }
  }
}

- (BOOL)_hideQRCodeOption
{
  char v2;

  v2 = _os_feature_enabled_impl();
  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
    return 0;
  else
    return +[TSUtilities isPad](TSUtilities, "isPad") & v2;
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isProximityTransferButtonTapped
{
  return self->_isProximityTransferButtonTapped;
}

- (void)setIsProximityTransferButtonTapped:(BOOL)a3
{
  self->_isProximityTransferButtonTapped = a3;
}

- (BOOL)isScanButtonTapped
{
  return self->_isScanButtonTapped;
}

- (void)setIsScanButtonTapped:(BOOL)a3
{
  self->_isScanButtonTapped = a3;
}

- (BOOL)requireDelayBluetoothConnection
{
  return self->_requireDelayBluetoothConnection;
}

- (void)setRequireDelayBluetoothConnection:(BOOL)a3
{
  self->_requireDelayBluetoothConnection = a3;
}

- (id)transferBackPlan
{
  return objc_getProperty(self, a2, 1264, 1);
}

- (void)setTransferBackPlan:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1264);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_transferBackPlan, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong(&self->viewController, 0);
  objc_storeStrong((id *)&self->_laterButton, 0);
}

@end
