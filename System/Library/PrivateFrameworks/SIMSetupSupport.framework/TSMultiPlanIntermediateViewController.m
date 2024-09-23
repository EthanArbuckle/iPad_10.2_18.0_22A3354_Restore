@implementation TSMultiPlanIntermediateViewController

- (TSMultiPlanIntermediateViewController)initWithPendingInstallItems:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  TSMultiPlanIntermediateViewController *v10;
  TSMultiPlanIntermediateViewController *v11;
  TSMultiPlanIntermediateViewController *v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  objc_super v22;

  v5 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("SET_UP_CELLULAR"), &stru_24DEF4290, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("MULTI_ALS_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v22.receiver = self;
  v22.super_class = (Class)TSMultiPlanIntermediateViewController;
  v10 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v22, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v7, v9, CFSTR("antenna.radiowaves.left.and.right"), 1);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_pendingInstallItems, a3);
    v11->_showOtherOptions = 1;
    v12 = v11;
  }
  else
  {
    _TSLogDomain();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      -[TSMultiPlanIntermediateViewController initWithPendingInstallItems:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);

  }
  return v11;
}

- (TSMultiPlanIntermediateViewController)initWithTransferItems:(id)a3 showOtherOptions:(BOOL)a4
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  TSMultiPlanIntermediateViewController *v12;
  TSMultiPlanIntermediateViewController *v13;
  TSMultiPlanIntermediateViewController *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  objc_super v24;

  v7 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("SINGLE_ESIM_TRANSFER_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("SINGLE_ESIM_TRANSFER_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v24.receiver = self;
  v24.super_class = (Class)TSMultiPlanIntermediateViewController;
  v12 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v24, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v9, v11, CFSTR("antenna.radiowaves.left.and.right"), 1);
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_transferItems, a3);
    v13->_showOtherOptions = a4;
    v14 = v13;
  }
  else
  {
    _TSLogDomain();
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      -[TSMultiPlanIntermediateViewController initWithTransferItems:showOtherOptions:].cold.1(v15, v16, v17, v18, v19, v20, v21, v22);

  }
  return v13;
}

- (TSMultiPlanIntermediateViewController)initWithTransferItems:(id)a3 pendingInstallItems:(id)a4 carrierSetupItems:(id)a5 showOtherOptions:(BOOL)a6
{
  return -[TSMultiPlanIntermediateViewController initWithTransferItems:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:](self, "initWithTransferItems:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:", a3, a4, a5, a6, 0);
}

- (TSMultiPlanIntermediateViewController)initWithTransferItems:(id)a3 pendingInstallItems:(id)a4 carrierSetupItems:(id)a5 showOtherOptions:(BOOL)a6 isStandaloneProximityFlow:(BOOL)a7
{
  id v11;
  id v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  const __CFString *v21;
  void *v22;
  void *v23;
  TSMultiPlanIntermediateViewController *v24;
  TSMultiPlanIntermediateViewController *v25;
  TSMultiPlanIntermediateViewController *v26;
  NSObject *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  id obj;
  objc_super v39;

  v11 = a3;
  obj = a4;
  v12 = a4;
  v13 = a5;
  objc_msgSend(v12, "plans");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "count");

  if (v15)
  {
    v16 = v11;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("SET_UP_CELLULAR"), &stru_24DEF4290, CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = CFSTR("MULTI_ALS_DETAIL");
LABEL_5:
    objc_msgSend(v19, "localizedStringForKey:value:table:", v21, &stru_24DEF4290, CFSTR("Localizable"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = v16;
    goto LABEL_6;
  }
  if (objc_msgSend(v11, "count"))
  {
    v16 = v11;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("SINGLE_ESIM_TRANSFER_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v19;
    v21 = CFSTR("SINGLE_ESIM_TRANSFER_DETAIL");
    goto LABEL_5;
  }
  v18 = 0;
  v23 = 0;
LABEL_6:
  v39.receiver = self;
  v39.super_class = (Class)TSMultiPlanIntermediateViewController;
  v24 = -[OBTableWelcomeController initWithTitle:detailText:symbolName:adoptTableViewScrollView:](&v39, sel_initWithTitle_detailText_symbolName_adoptTableViewScrollView_, v18, v23, CFSTR("antenna.radiowaves.left.and.right"), 1);
  v25 = v24;
  if (v24)
  {
    objc_storeStrong((id *)&v24->_transferItems, a3);
    objc_storeStrong((id *)&v25->_pendingInstallItems, obj);
    objc_storeStrong((id *)&v25->_carrierSetupItems, a5);
    v25->_showOtherOptions = a6;
    v25->_isStandaloneProximityFlow = a7;
    v26 = v25;
  }
  else
  {
    _TSLogDomain();
    v27 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[TSMultiPlanIntermediateViewController initWithTransferItems:pendingInstallItems:carrierSetupItems:showOtherOptions:isStandaloneProximityFlow:].cold.1(v27, v28, v29, v30, v31, v32, v33, v34);

  }
  return v25;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
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
  NSLayoutConstraint *v22;
  NSLayoutConstraint *tableHeightAnchor;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)TSMultiPlanIntermediateViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v29, sel_viewDidLoad);
  self->_inBuddy = +[TSUtilities inBuddy](TSUtilities, "inBuddy");
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSMultiPlanIntermediateViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  if (!-[NSArray count](self->_transferItems, "count"))
  {
    -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "count"))
    {

    }
    else
    {
      -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "count");

      if (!v8)
        goto LABEL_6;
    }
  }
  v9 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v10 = (void *)objc_msgSend(v9, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v10);

  -[OBTableWelcomeController tableView](self, "tableView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRowHeight:", *MEMORY[0x24BEBE770]);

  -[OBTableWelcomeController tableView](self, "tableView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setEstimatedRowHeight:", 1.0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsMultipleSelection:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setScrollEnabled:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setBackgroundColor:", v17);

  -[OBTableWelcomeController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "reloadData");

  -[OBTableWelcomeController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "heightAnchor");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSMultiPlanIntermediateViewController _heightAnchorConstant](self, "_heightAnchorConstant");
  objc_msgSend(v21, "constraintEqualToConstant:");
  v22 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
  tableHeightAnchor = self->_tableHeightAnchor;
  self->_tableHeightAnchor = v22;

  -[NSLayoutConstraint setActive:](self->_tableHeightAnchor, "setActive:", 1);
LABEL_6:
  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy") && self->_showOtherOptions)
  {
    objc_msgSend(MEMORY[0x24BE6E418], "linkButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "addTarget:action:forControlEvents:", self, sel__otherButtonTapped, 64);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OTHER_OPTIONS"), &stru_24DEF4290, CFSTR("Localizable"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setTitle:forState:", v26, 0);

    -[TSMultiPlanIntermediateViewController buttonTray](self, "buttonTray");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "addButton:", v24);

  }
  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    if (!self->_isStandaloneProximityFlow)
      return;
    -[OBBaseWelcomeController navigationItem](self, "navigationItem");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setHidesBackButton:", 1);
  }
  else
  {
    -[TSMultiPlanIntermediateViewController delegate](self, "delegate");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setDefaultNavigationItems:", self);
  }

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSMultiPlanIntermediateViewController;
  -[OBBaseWelcomeController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  self->_isOtherButtonTapped = 0;
  self->_isTransferListCellTapped = 0;
}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)TSMultiPlanIntermediateViewController;
  -[TSMultiPlanIntermediateViewController viewDidDisappear:](&v5, sel_viewDidDisappear_, a3);
  if (-[TSMultiPlanIntermediateViewController showSIMSetup](self, "showSIMSetup"))
  {
    -[TSMultiPlanIntermediateViewController delegate](self, "delegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "receivedResponse");

  }
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy", a3))
    return 2;
  else
    return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x24BEBE770];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x24BEBE770];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  void *v6;
  id v7;
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
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  const __CFString *v29;
  NSUInteger v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  _BOOL4 v36;
  void *v37;
  void *v38;
  void *v39;
  const __CFString *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  void *v55;
  id v56;
  void *v57;
  CGSize v59;

  v6 = (void *)MEMORY[0x24BDD17C8];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "stringWithFormat:", CFSTR("options%ld"), objc_msgSend(v7, "section"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "dequeueReusableCellWithIdentifier:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v10)
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 3, v9);
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

  objc_msgSend(v10, "detailTextLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setLineBreakMode:", 0);

  objc_msgSend(v10, "detailTextLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setNumberOfLines:", 0);

  objc_msgSend(v10, "detailTextLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  objc_msgSend(MEMORY[0x24BEBB520], "preferredFontForTextStyle:", *MEMORY[0x24BEBE220]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "detailTextLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFont:", v21);

  v23 = objc_msgSend(v7, "section");
  if (!v23)
  {
    v30 = -[NSArray count](self->_transferItems, "count");
    -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "count");

    -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = objc_msgSend(v33, "count");

    if (!v30 || v32 || v34)
    {
      if (!v30 && !v32 && !v34)
      {
        v27 = 0;
        v25 = 0;
LABEL_20:
        v28 = (void *)MEMORY[0x24BEBD640];
        v29 = CFSTR("iphone.and.arrow.forward");
        goto LABEL_21;
      }
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "localizedStringForKey:value:table:", CFSTR("MULTI_ALS_TEXT"), &stru_24DEF4290, CFSTR("Localizable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v44 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("MULTI_ALS_SUBTEXT_WITH_COUNT_%lu"), &stru_24DEF4290, CFSTR("Plurals"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "localizedStringWithFormat:", v42, v32 + v30 + v34);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "localizedStringForKey:value:table:", CFSTR("TRANSFER_PLAN_ITEM_TITLE_MULTIPLE"), &stru_24DEF4290, CFSTR("Localizable"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();

      v36 = +[TSUtilities isPad](TSUtilities, "isPad");
      v37 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v39 = v38;
      if (v36)
        v40 = CFSTR("IPAD_MULTI_TRANSFER_SUBTEXT_%lu");
      else
        v40 = CFSTR("MULTI_TRANSFER_SUBTEXT_%lu");
      objc_msgSend(v38, "localizedStringForKey:value:table:", v40, &stru_24DEF4290, CFSTR("Plurals"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "localizedStringWithFormat:", v42, v30);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_20;
  }
  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER_IN_SETTINGS"), &stru_24DEF4290, CFSTR("Localizable"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("SET_UP_LATER_IN_SETTINGS_SUB"), &stru_24DEF4290, CFSTR("Localizable"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)MEMORY[0x24BEBD640];
    v29 = CFSTR("gear");
LABEL_21:
    objc_msgSend(v28, "systemImageNamed:", v29);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "textLabel");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "setText:", v25);

    objc_msgSend(v10, "detailTextLabel");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "setText:", v27);

    goto LABEL_22;
  }
  v27 = 0;
  v25 = 0;
  v41 = 0;
LABEL_22:
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBlueColor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "imageWithTintColor:", v47);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v48, "size");
  v50 = v49 * 1.5;
  objc_msgSend(v48, "size");
  v59.height = v51 * 1.5;
  v59.width = v50;
  UIGraphicsBeginImageContextWithOptions(v59, 0, 0.0);
  objc_msgSend(v48, "size");
  v53 = v52 * 1.5;
  objc_msgSend(v48, "size");
  objc_msgSend(v48, "drawInRect:", 0.0, 0.0, v53, v54 * 1.5);
  UIGraphicsGetImageFromCurrentImageContext();
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  UIGraphicsEndImageContext();
  v56 = (id)objc_msgSend(v55, "imageWithRenderingMode:", 1);
  objc_msgSend(v10, "imageView");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "setImage:", v55);

  return v10;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  void *v5;
  void *v6;
  id v7;

  v7 = a4;
  if (objc_msgSend(v7, "section"))
  {
    if (objc_msgSend(v7, "section") == 1)
      -[TSMultiPlanIntermediateViewController _skipButtonTapped](self, "_skipButtonTapped");
  }
  else
  {
    self->_isTransferListCellTapped = 1;
    -[TSMultiPlanIntermediateViewController delegate](self, "delegate");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "viewControllerDidComplete:", self);

  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "deselectRowAtIndexPath:animated:", v7, 1);

}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return 0.100000001;
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  return 0.0;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  id v4;

  v4 = objc_alloc(MEMORY[0x24BEBDB00]);
  return (id)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
}

- (void)_otherButtonTapped
{
  id v3;

  self->_isOtherButtonTapped = 1;
  -[TSMultiPlanIntermediateViewController delegate](self, "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerDidComplete:", self);

}

- (void)_skipButtonTapped
{
  void *v3;
  void *v4;
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
  void *v19;
  char v20;
  id v21;
  _QWORD v22[5];

  if (+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[CTDisplayPlanList plans](self->_pendingInstallItems, "plans");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
LABEL_5:

LABEL_6:
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
      v22[0] = MEMORY[0x24BDAC760];
      v22[1] = 3221225472;
      v22[2] = __58__TSMultiPlanIntermediateViewController__skipButtonTapped__block_invoke;
      v22[3] = &unk_24DEF2F40;
      v22[4] = self;
      objc_msgSend(v11, "actionWithTitle:style:handler:", v13, 1, v22);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v14);

      v15 = (void *)MEMORY[0x24BEBD3A8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24DEF4290, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "actionWithTitle:style:handler:", v17, 0, &__block_literal_global_6);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "addAction:", v18);

      -[TSMultiPlanIntermediateViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v10, 1, 0);
      return;
    }
    -[CTDisplayPlanList plans](self->_carrierSetupItems, "plans");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {

      goto LABEL_5;
    }
    +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = objc_msgSend(v19, "isEmbeddedSIMOnlyConfig");

    if ((v20 & 1) != 0)
      goto LABEL_6;
  }
  -[TSMultiPlanIntermediateViewController delegate](self, "delegate");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "userDidTapCancel");

}

void __58__TSMultiPlanIntermediateViewController__skipButtonTapped__block_invoke(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "userDidTapCancel");

}

- (double)_heightAnchorConstant
{
  void *v2;
  double v3;
  double v4;

  -[TSMultiPlanIntermediateViewController view](self, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3 * 0.2;

  return v4;
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)isOtherButtonTapped
{
  return self->_isOtherButtonTapped;
}

- (void)setIsOtherButtonTapped:(BOOL)a3
{
  self->_isOtherButtonTapped = a3;
}

- (BOOL)installingTransferPlan
{
  return self->_installingTransferPlan;
}

- (void)setInstallingTransferPlan:(BOOL)a3
{
  self->_installingTransferPlan = a3;
}

- (BOOL)showSIMSetup
{
  return self->_showSIMSetup;
}

- (void)setShowSIMSetup:(BOOL)a3
{
  self->_showSIMSetup = a3;
}

- (BOOL)isTransferListCellTapped
{
  return self->_isTransferListCellTapped;
}

- (void)setIsTransferListCellTapped:(BOOL)a3
{
  self->_isTransferListCellTapped = a3;
}

- (BOOL)isStandaloneProximityFlow
{
  return self->_isStandaloneProximityFlow;
}

- (void)setIsStandaloneProximityFlow:(BOOL)a3
{
  self->_isStandaloneProximityFlow = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_carrierSetupItems, 0);
  objc_storeStrong((id *)&self->_pendingInstallItems, 0);
  objc_storeStrong((id *)&self->_transferItems, 0);
  objc_storeStrong((id *)&self->_buttons, 0);
  objc_storeStrong((id *)&self->_tableHeightAnchor, 0);
}

- (void)initWithPendingInstallItems:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self not initialized @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithTransferItems:(uint64_t)a3 showOtherOptions:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self not initialized @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

- (void)initWithTransferItems:(uint64_t)a3 pendingInstallItems:(uint64_t)a4 carrierSetupItems:(uint64_t)a5 showOtherOptions:(uint64_t)a6 isStandaloneProximityFlow:(uint64_t)a7 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]Self not initialized @%s", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1_0();
}

@end
