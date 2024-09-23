@implementation TSCellularPlanUsesViewController

- (TSCellularPlanUsesViewController)initWithType:(unint64_t)a3 withDoneButton:(BOOL)a4
{
  void *v7;
  _BOOL4 v8;
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
  NSMutableArray *v20;
  NSMutableArray *chosenUseIndexPaths;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  TSCellularPlanUsesViewController *v27;
  BOOL v29;
  BOOL v30;
  objc_super v31;
  objc_super v32;
  objc_super v33;
  objc_super v34;

  +[TSCellularPlanUsesViewController sGetSelectedPlanItems](TSCellularPlanUsesViewController, "sGetSelectedPlanItems");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = +[TSCellularPlanUsesViewController sInPrivateNetworkMode:](TSCellularPlanUsesViewController, "sInPrivateNetworkMode:", v7);
  switch(a3)
  {
    case 2uLL:
      v30 = a4;
      v13 = (void *)MEMORY[0x24BEBD640];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "imageNamed:inBundle:withConfiguration:", CFSTR("imessage"), v14, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_IMESSAGE_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_IMESSAGE_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v31.receiver = self;
      v31.super_class = (Class)TSCellularPlanUsesViewController;
      self = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v31, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v17, v19, v15, 0);

      v20 = (NSMutableArray *)objc_opt_new();
      chosenUseIndexPaths = self->_chosenUseIndexPaths;
      self->_chosenUseIndexPaths = v20;

LABEL_12:
      a4 = v30;
LABEL_13:
      self->_usesType = a3;
      self->_hasDoneButton = a4;
      objc_storeStrong((id *)&self->_selectedPlanItems, v7);
      self->_inPrivateNetworkMode = v8;
      goto LABEL_14;
    case 1uLL:
      v30 = a4;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = v22;
      if (v8)
      {
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_DATA_TITLE_PNW"), &stru_24DEF4290, CFSTR("Localizable"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_DATA_DETAIL_PNW"), &stru_24DEF4290, CFSTR("Localizable"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v33.receiver = self;
        v33.super_class = (Class)TSCellularPlanUsesViewController;
        v27 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v33, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v24, v26, 0, 0);
      }
      else
      {
        objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_DATA_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_DATA_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v32.receiver = self;
        v32.super_class = (Class)TSCellularPlanUsesViewController;
        v27 = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v32, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v24, v26, 0, 0);
      }
      self = v27;

      self->_dataSwitchEnabled = 0;
      goto LABEL_12;
    case 0uLL:
      v29 = a4;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_LINE_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_LINE_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v34.receiver = self;
      v34.super_class = (Class)TSCellularPlanUsesViewController;
      self = -[OBTableWelcomeController initWithTitle:detailText:icon:adoptTableViewScrollView:](&v34, sel_initWithTitle_detailText_icon_adoptTableViewScrollView_, v10, v12, 0, 0);

      a4 = v29;
      break;
  }
  if (self)
    goto LABEL_13;
LABEL_14:

  return self;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  OBBoldTrayButton *v10;
  OBBoldTrayButton *doneButton;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  unint64_t usesType;
  void *v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  NSLayoutConstraint *v34;
  NSLayoutConstraint *heightConstraint;
  void *v36;
  void *v37;
  objc_super v38;
  _QWORD v39[2];

  v39[1] = *MEMORY[0x24BDAC8D0];
  v38.receiver = self;
  v38.super_class = (Class)TSCellularPlanUsesViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v38, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanUsesViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  LODWORD(v5) = self->_hasDoneButton;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v5)
    v8 = CFSTR("DONE");
  else
    v8 = CFSTR("CONTINUE");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24DEF4290, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v10 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  doneButton = self->_doneButton;
  self->_doneButton = v10;

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_doneButton, "addTarget:action:forControlEvents:", self, sel__doneButtonTapped, 64);
  -[OBBoldTrayButton setTitle:forState:](self->_doneButton, "setTitle:forState:", v9, 0);
  -[TSCellularPlanUsesViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", self->_doneButton);

  if (!self->_inPrivateNetworkMode)
  {
    v13 = objc_alloc(MEMORY[0x24BEBD9F0]);
    v14 = (void *)objc_msgSend(v13, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[OBTableWelcomeController setTableView:](self, "setTableView:", v14);

    -[OBTableWelcomeController tableView](self, "tableView");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[OBTableWelcomeController tableView](self, "tableView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setRowHeight:", *MEMORY[0x24BEBE770]);

    -[OBTableWelcomeController tableView](self, "tableView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setBackgroundColor:", v18);

    -[OBTableWelcomeController tableView](self, "tableView");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDataSource:", self);

    -[OBTableWelcomeController tableView](self, "tableView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setDelegate:", self);

    -[OBTableWelcomeController tableView](self, "tableView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setScrollEnabled:", 0);

  }
  usesType = self->_usesType;
  if (usesType == 1)
  {
    if (self->_inPrivateNetworkMode)
    {
      v24 = 1;
      goto LABEL_13;
    }
    goto LABEL_11;
  }
  if (usesType != 2)
  {
LABEL_11:
    -[OBTableWelcomeController tableView](self, "tableView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setAllowsMultipleSelection:", 0);
    v24 = 0;
    goto LABEL_12;
  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 1;
  objc_msgSend(v23, "setAllowsMultipleSelection:", 1);
LABEL_12:

LABEL_13:
  -[OBBoldTrayButton setEnabled:](self->_doneButton, "setEnabled:", v24);
  -[OBTableWelcomeController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "reloadData");

  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[TSCellularPlanUsesViewController navigationController](self, "navigationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "navigationBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", v28);

  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  if (v29)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "heightAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[OBTableWelcomeController tableView](self, "tableView");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "contentSize");
    objc_msgSend(v31, "constraintEqualToConstant:", v33);
    v34 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    heightConstraint = self->_heightConstraint;
    self->_heightConstraint = v34;

    v36 = (void *)MEMORY[0x24BDD1628];
    v39[0] = self->_heightConstraint;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v39, 1);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "activateConstraints:", v37);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  objc_super v12;
  objc_super v13;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[TSCellularPlanUsesViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  v13.receiver = self;
  v13.super_class = (Class)TSCellularPlanUsesViewController;
  -[TSCellularPlanUsesViewController updateViewConstraints](&v13, sel_updateViewConstraints);
  if (self->_heightConstraint)
  {
    -[OBTableWelcomeController tableView](self, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "contentSize");
    v7 = v6;

    -[OBTableWelcomeController tableView](self, "tableView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "frame");
    v10 = v9;

    if (v7 >= v10)
      v11 = v7;
    else
      v11 = v10;
    -[NSLayoutConstraint setConstant:](self->_heightConstraint, "setConstant:", v11);
  }
  v12.receiver = self;
  v12.super_class = (Class)TSCellularPlanUsesViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v12, sel_viewDidLayoutSubviews);
}

+ (id)sGetSelectedPlanItems
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "planItems");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "isSelected", (_QWORD)v13))
          objc_msgSend(v4, "addObject:", v10);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  objc_msgSend(v4, "sortedArrayUsingSelector:", sel_compare_);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (BOOL)sInPrivateNetworkModeForItem:(id)a3
{
  return objc_msgSend(a3, "settingsMode") == 1;
}

+ (BOOL)sInPrivateNetworkMode:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v3 = a3;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v9;
    while (2)
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v3);
        if (+[TSCellularPlanUsesViewController sInPrivateNetworkModeForItem:](TSCellularPlanUsesViewController, "sInPrivateNetworkModeForItem:", *(_QWORD *)(*((_QWORD *)&v8 + 1) + 8 * i), (_QWORD)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
      if (v4)
        continue;
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)prepare:(id)a3
{
  void (**v4)(id, uint64_t);
  NSArray **p_selectedPlanItems;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  NSArray *v13;
  NSArray *planItemBadges;
  uint64_t v15;
  NSObject *v16;
  void *v17;
  _QWORD v18[4];
  void (**v19)(id, uint64_t);
  id v20;
  id location;

  v4 = (void (**)(id, uint64_t))a3;
  if (!v4)
  {
    _TSLogDomain();
    v11 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanUsesViewController prepare:].cold.1((uint64_t)self, v11, v15);
    goto LABEL_13;
  }
  p_selectedPlanItems = &self->_selectedPlanItems;
  if (-[NSArray count](self->_selectedPlanItems, "count") == 2)
  {
    v6 = objc_alloc(MEMORY[0x24BDBCE30]);
    -[NSArray objectAtIndex:](*p_selectedPlanItems, "objectAtIndex:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndex:](*p_selectedPlanItems, "objectAtIndex:", 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "userLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v6, "initWithObjects:", v8, v10, 0);

    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "getShortLabelsForLabels:", v11);
    v13 = (NSArray *)objc_claimAutoreleasedReturnValue();
    planItemBadges = self->_planItemBadges;
    self->_planItemBadges = v13;

    if (self->_usesType == 1)
    {
      v4[2](v4, 1);
    }
    else
    {
      objc_initWeak(&location, self);
      +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18[0] = MEMORY[0x24BDAC760];
      v18[1] = 3221225472;
      v18[2] = __44__TSCellularPlanUsesViewController_prepare___block_invoke;
      v18[3] = &unk_24DEF2A98;
      objc_copyWeak(&v20, &location);
      v19 = v4;
      objc_msgSend(v17, "getSubscriptionInfo:", v18);

      objc_destroyWeak(&v20);
      objc_destroyWeak(&location);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (-[NSArray count](*p_selectedPlanItems, "count") >= 3)
  {
    _TSLogDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      -[TSCellularPlanUsesViewController prepare:].cold.2((id *)p_selectedPlanItems, v16);

  }
  v4[2](v4, 0);
LABEL_14:

}

void __44__TSCellularPlanUsesViewController_prepare___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id WeakRetained;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  char v11;
  uint64_t i;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  uint64_t v18;
  id v19;
  uint64_t v20;
  void *v21;
  void *v22;
  id *location;
  uint64_t v24;
  id v25;
  id v26;
  _QWORD block[4];
  id v28;
  char v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  void *v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v26 = a2;
  v24 = a1;
  v25 = a3;
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  location = (id *)(a1 + 40);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "selectedPlanItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v31;
    v11 = 1;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v31 != v10)
          objc_enumerationMutation(v6);
        v13 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * i);
        objc_msgSend(v26, "subscriptions", location, v24, v25);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        +[TSUtilities findSubscriptionContextForCellularPlanItem:fromSubscriptionContexts:](TSUtilities, "findSubscriptionContextForCellularPlanItem:fromSubscriptionContexts:", v13, v14);
        v15 = (void *)objc_claimAutoreleasedReturnValue();

        if ((objc_msgSend(v15, "isSimDataOnly") & 1) != 0)
        {
          v11 = 0;
        }
        else
        {
          v16 = v13;

          v9 = v16;
        }

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
    v11 = 1;
  }

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44__TSCellularPlanUsesViewController_prepare___block_invoke_2;
  block[3] = &unk_24DEF2B78;
  v28 = *(id *)(v24 + 32);
  v29 = v11 & 1;
  dispatch_async(MEMORY[0x24BDAC9B8], block);
  if ((v11 & 1) == 0 && v9)
  {
    v17 = objc_loadWeakRetained(location);
    v18 = objc_msgSend(v17, "usesType");

    if (!v18)
    {
      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "selectPlanForVoice:", v9);
      goto LABEL_19;
    }
    v19 = objc_loadWeakRetained(location);
    v20 = objc_msgSend(v19, "usesType");

    if (v20 == 2)
    {
      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = v9;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v34, 1);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "selectPlansForIMessage:", v22);

LABEL_19:
    }
  }

}

uint64_t __44__TSCellularPlanUsesViewController_prepare___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(a1 + 32), *(unsigned __int8 *)(a1 + 40));
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  unint64_t usesType;
  void *v9;
  void *v10;
  const __CFString *v11;

  v6 = a3;
  if (self->_usesType == 2)
  {
    v7 = 0;
    goto LABEL_10;
  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v7)
    goto LABEL_10;
  usesType = self->_usesType;
  if (!usesType)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("CELLULAR_PLAN_LINE_SECTION_FOOTER");
    goto LABEL_9;
  }
  v7 = 0;
  if (a4 && usesType == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    v11 = CFSTR("CELLULAR_PLAN_DATA_SECTION_FOOTER");
LABEL_9:
    objc_msgSend(v9, "localizedStringForKey:value:table:", v11, &stru_24DEF4290, CFSTR("Localizable"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_10:

  return v7;
}

- (void)tableView:(id)a3 willDisplayFooterView:(id)a4 forSection:(int64_t)a5
{
  void *v5;
  id v6;

  objc_msgSend(a4, "textLabel", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->_inPrivateNetworkMode)
    return 0;
  if (self->_usesType == 1)
    return 2;
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 1;
  else
    return 2;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  TSCellularPlanUsesDataSwitchCell *v6;
  _BOOL8 dataSwitchEnabled;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  void *v32;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    v6 = -[TSCellularPlanUsesDataSwitchCell initWithStyle:reuseIdentifier:]([TSCellularPlanUsesDataSwitchCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("dataswitch"));
    dataSwitchEnabled = self->_dataSwitchEnabled;
    -[TSCellularPlanUsesDataSwitchCell switchControl](v6, "switchControl");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setOn:", dataSwitchEnabled);

    -[TSCellularPlanUsesDataSwitchCell switchControl](v6, "switchControl");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addTarget:action:forControlEvents:", self, sel_dataSwitchChanged_, 4096);
  }
  else
  {
    v6 = -[TSCellularPlanUsesTableViewCell initWithStyle:reuseIdentifier:]([TSCellularPlanUsesTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("uses"));
    -[TSCellularPlanUsesDataSwitchCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
    -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", objc_msgSend(v5, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (self->_usesType > 1)
    {
      if (-[NSMutableArray containsObject:](self->_chosenUseIndexPaths, "containsObject:", v5))
        v13 = 3;
      else
        v13 = 0;
      -[TSCellularPlanUsesDataSwitchCell setAccessoryType:](v6, "setAccessoryType:", v13);
      -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", objc_msgSend(v5, "row"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "phoneNumber");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "length");

      if (v16)
      {
        -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", objc_msgSend(v5, "row"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "phoneNumber");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v17, 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        -[NSArray objectAtIndex:](self->_planItemBadges, "objectAtIndex:", objc_msgSend(v5, "row"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        -[TSCellularPlanUsesDataSwitchCell setLabel:description:badge:](v6, "setLabel:description:badge:", v9, v18, v19);

      }
      else
      {
        -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", objc_msgSend(v5, "row"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "carrierName");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = objc_msgSend(v21, "length");

        if (v22)
        {
          v23 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_IMESSAGE_NO_PHONE_NUMBER_%@"), &stru_24DEF4290, CFSTR("Localizable"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", objc_msgSend(v5, "row"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v25, "carrierName");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "stringWithFormat:", v24, v26);
          v27 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndex:](self->_planItemBadges, "objectAtIndex:", objc_msgSend(v5, "row"));
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          -[TSCellularPlanUsesDataSwitchCell setLabel:description:badge:](v6, "setLabel:description:badge:", v9, v27, v28);

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_IMESSAGE_NO_CARRIER_NAME"), &stru_24DEF4290, CFSTR("Localizable"));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          -[NSArray objectAtIndex:](self->_planItemBadges, "objectAtIndex:", objc_msgSend(v5, "row"));
          v29 = (void *)objc_claimAutoreleasedReturnValue();
          -[TSCellularPlanUsesDataSwitchCell setLabel:description:badge:](v6, "setLabel:description:badge:", v9, v24, v29);

        }
      }
    }
    else
    {
      if (-[NSIndexPath isEqual:](self->_chosenUseIndexPath, "isEqual:", v5))
        v11 = 3;
      else
        v11 = 0;
      -[TSCellularPlanUsesDataSwitchCell setAccessoryType:](v6, "setAccessoryType:", v11);
      -[NSArray objectAtIndex:](self->_planItemBadges, "objectAtIndex:", objc_msgSend(v5, "row"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSCellularPlanUsesDataSwitchCell setLabel:description:badge:](v6, "setLabel:description:badge:", v9, 0, v12);
    }

    -[TSCellularPlanUsesViewController traitCollection](self, "traitCollection");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = objc_msgSend(v30, "userInterfaceStyle");

    if (v31 == 1)
    {
      objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.95, 1.0);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSCellularPlanUsesDataSwitchCell setBackgroundColor:](v6, "setBackgroundColor:", v32);

    }
  }

  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  unint64_t usesType;
  void *v7;
  char v8;
  NSMutableArray *chosenUseIndexPaths;
  id v10;

  v10 = a4;
  -[OBBoldTrayButton setEnabled:](self->_doneButton, "setEnabled:", 1);
  usesType = self->_usesType;
  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

  if (usesType > 1)
  {
    v8 = -[NSMutableArray containsObject:](self->_chosenUseIndexPaths, "containsObject:", v10);
    chosenUseIndexPaths = self->_chosenUseIndexPaths;
    if ((v8 & 1) != 0)
      -[NSMutableArray removeObject:](chosenUseIndexPaths, "removeObject:", v10);
    else
      -[NSMutableArray addObject:](chosenUseIndexPaths, "addObject:", v10);
  }
  else
  {
    objc_storeStrong((id *)&self->_chosenUseIndexPath, a4);
  }

}

- (id)tableView:(id)a3 willSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (self->_usesType == 1 && objc_msgSend(v7, "section") == 1)
    v9 = 0;
  else
    v9 = v8;

  return v9;
}

- (void)_doneButtonTapped
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[TSCellularPlanUsesViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  objc_initWeak(&location, self);
  dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __53__TSCellularPlanUsesViewController__doneButtonTapped__block_invoke;
  v5[3] = &unk_24DEF29F8;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __53__TSCellularPlanUsesViewController__doneButtonTapped__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v2[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __53__TSCellularPlanUsesViewController__doneButtonTapped__block_invoke_2;
  v2[3] = &unk_24DEF29A8;
  v2[4] = WeakRetained;
  objc_msgSend(WeakRetained, "saveDefaultUse:", v2);

}

void __53__TSCellularPlanUsesViewController__doneButtonTapped__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __53__TSCellularPlanUsesViewController__doneButtonTapped__block_invoke_3;
  block[3] = &unk_24DEF29A8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __53__TSCellularPlanUsesViewController__doneButtonTapped__block_invoke_3(uint64_t a1)
{
  void *v2;
  id v3;

  objc_msgSend(*(id *)(a1 + 32), "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserInteractionEnabled:", 1);

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllerDidComplete:", *(_QWORD *)(a1 + 32));

}

- (void)dataSwitchChanged:(id)a3
{
  self->_dataSwitchEnabled = objc_msgSend(a3, "isOn");
}

- (void)saveDefaultUse:(id)a3
{
  void (**v4)(_QWORD);
  void *v5;
  uint64_t v6;
  void *v7;
  unint64_t v8;
  void *v9;
  NSMutableArray *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t i;
  void *v15;
  NSObject *v16;
  void *v17;
  BOOL *p_dataSwitchEnabled;
  _BOOL8 v19;
  void *v20;
  NSObject *v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[TSCoreTelephonyClientCache sharedInstance](TSCoreTelephonyClientCache, "sharedInstance");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  v8 = 0x255188000uLL;
  if (self->_usesType == 2)
  {
    v22 = (void *)v6;
    v23 = v5;
    v9 = (void *)objc_opt_new();
    v24 = 0u;
    v25 = 0u;
    v26 = 0u;
    v27 = 0u;
    v10 = self->_chosenUseIndexPaths;
    v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    if (v11)
    {
      v12 = v11;
      v13 = *(_QWORD *)v25;
      do
      {
        for (i = 0; i != v12; ++i)
        {
          if (*(_QWORD *)v25 != v13)
            objc_enumerationMutation(v10);
          -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * i), "row", v22));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v15);

        }
        v12 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v10, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      }
      while (v12);
    }

    v5 = v23;
    objc_msgSend(v23, "selectPlansForIMessage:", v9);
    _TSLogDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[TSCellularPlanUsesViewController saveDefaultUse:].cold.2();
    v7 = v22;
    v8 = 0x255188000;
  }
  else
  {
    -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", -[NSIndexPath row](self->_chosenUseIndexPath, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_usesType)
    {
      if (!self->_inPrivateNetworkMode)
        objc_msgSend(v5, "selectPlanForData:", v9);
    }
    else
    {
      objc_msgSend(v5, "selectPlanForVoice:", v9);
    }
    _TSLogDomain();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      -[TSCellularPlanUsesViewController saveDefaultUse:].cold.2();
  }

  if (self->_usesType == 1)
  {
    -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.super.super.isa + *(int *)(v8 + 3400)), "row") == 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    p_dataSwitchEnabled = &self->_dataSwitchEnabled;
    v19 = *p_dataSwitchEnabled;
    objc_msgSend(v17, "iccid");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDataFallbackEnabled:forIccid:", v19, v20);

    _TSLogDomain();
    v21 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
      -[TSCellularPlanUsesViewController saveDefaultUse:].cold.1(p_dataSwitchEnabled, (uint64_t)v17, v21);

  }
  if (v4)
    v4[2](v4);

}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)usesType
{
  return self->_usesType;
}

- (BOOL)hasDoneButton
{
  return self->_hasDoneButton;
}

- (void)setHasDoneButton:(BOOL)a3
{
  self->_hasDoneButton = a3;
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_heightAnchor, a3);
}

- (NSIndexPath)chosenUseIndexPath
{
  return (NSIndexPath *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setChosenUseIndexPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1272);
}

- (NSMutableArray)chosenUseIndexPaths
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setChosenUseIndexPaths:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1280);
}

- (NSArray)planItemBadges
{
  return (NSArray *)objc_getProperty(self, a2, 1288, 1);
}

- (void)setPlanItemBadges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1288);
}

- (NSArray)selectedPlanItems
{
  return (NSArray *)objc_getProperty(self, a2, 1296, 1);
}

- (void)setSelectedPlanItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1296);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_selectedPlanItems, 0);
  objc_storeStrong((id *)&self->_planItemBadges, 0);
  objc_storeStrong((id *)&self->_chosenUseIndexPaths, 0);
  objc_storeStrong((id *)&self->_chosenUseIndexPath, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_heightConstraint, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

- (void)prepare:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *(_QWORD *)(a1 + 1256);
  v4 = 134218242;
  v5 = v3;
  v6 = 2080;
  v7 = "-[TSCellularPlanUsesViewController prepare:]";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, a2, a3, "[E]missing completion for prepare uses view : %lu @%s", (uint8_t *)&v4);
  OUTLINED_FUNCTION_1_0();
}

- (void)prepare:(id *)a1 .cold.2(id *a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[14];
  const char *v5;
  uint64_t v6;

  v6 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(*a1, "count");
  OUTLINED_FUNCTION_1();
  v5 = "-[TSCellularPlanUsesViewController prepare:]";
  OUTLINED_FUNCTION_2_0(&dword_21B647000, a2, v3, "[E]Too many select items. %lu @%s", v4);
}

- (void)saveDefaultUse:(os_log_t)log .cold.1(_BYTE *a1, uint64_t a2, os_log_t log)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  __int16 v6;
  uint64_t v7;
  __int16 v8;
  const char *v9;
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  if (*a1)
    v3 = CFSTR("Yes");
  else
    v3 = CFSTR("No");
  v4 = 138412802;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  v8 = 2080;
  v9 = "-[TSCellularPlanUsesViewController saveDefaultUse:]";
  _os_log_debug_impl(&dword_21B647000, log, OS_LOG_TYPE_DEBUG, "[Db] data switch set to %@, non data preferred plan: %@ @%s", (uint8_t *)&v4, 0x20u);
}

- (void)saveDefaultUse:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_1_1(&dword_21B647000, v0, v1, "[Db] %@ @%s", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1_0();
}

@end
