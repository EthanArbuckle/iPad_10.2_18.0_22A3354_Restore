@implementation TSCellularPlanLabelsViewController

- (TSCellularPlanLabelsViewController)initWithAllowDismiss:(BOOL)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  TSCellularPlanLabelsViewController *v9;
  NSMutableArray *v10;
  NSMutableArray *sortedPlanItemsWithPendingLabels;
  NSString *iccid;
  objc_super v14;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_LABELS_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_LABELS_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14.receiver = self;
  v14.super_class = (Class)TSCellularPlanLabelsViewController;
  v9 = -[OBTableWelcomeController initWithTitle:detailText:icon:](&v14, sel_initWithTitle_detailText_icon_, v6, v8, 0);

  if (v9)
  {
    v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sortedPlanItemsWithPendingLabels = v9->_sortedPlanItemsWithPendingLabels;
    v9->_sortedPlanItemsWithPendingLabels = v10;

    iccid = v9->_iccid;
    v9->_iccid = 0;

    v9->_forceDualSIMSetup = 0;
    v9->_allowDismiss = a3;
    v9->_showDupLabelsFooter = 0;
  }
  return v9;
}

- (TSCellularPlanLabelsViewController)initWithIccid:(id)a3 forceDualSIMSetup:(BOOL)a4 allowDismiss:(BOOL)a5
{
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  TSCellularPlanLabelsViewController *v14;
  NSMutableArray *v15;
  NSMutableArray *sortedPlanItemsWithPendingLabels;
  objc_super v18;

  v9 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_LABELS_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_LABELS_DETAIL"), &stru_24DEF4290, CFSTR("Localizable"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v18.receiver = self;
  v18.super_class = (Class)TSCellularPlanLabelsViewController;
  v14 = -[OBTableWelcomeController initWithTitle:detailText:icon:](&v18, sel_initWithTitle_detailText_icon_, v11, v13, 0);

  if (v14)
  {
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    sortedPlanItemsWithPendingLabels = v14->_sortedPlanItemsWithPendingLabels;
    v14->_sortedPlanItemsWithPendingLabels = v15;

    objc_storeStrong((id *)&v14->_iccid, a3);
    v14->_forceDualSIMSetup = a4;
    v14->_allowDismiss = a5;
    v14->_showDupLabelsFooter = 0;
  }

  return v14;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  void *v5;
  OBBoldTrayButton *v6;
  OBBoldTrayButton *doneButton;
  OBBoldTrayButton *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
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
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)TSCellularPlanLabelsViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v35, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelsViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v6 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  doneButton = self->_doneButton;
  self->_doneButton = v6;

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_doneButton, "addTarget:action:forControlEvents:", self, sel__doneButtonTapped, 64);
  v8 = self->_doneButton;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("CONTINUE"), &stru_24DEF4290, CFSTR("Localizable"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBBoldTrayButton setTitle:forState:](v8, "setTitle:forState:", v10, 0);

  -[TSCellularPlanLabelsViewController buttonTray](self, "buttonTray");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "addButton:", self->_doneButton);

  v12 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v13 = (void *)objc_msgSend(v12, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v13);

  -[OBTableWelcomeController tableView](self, "tableView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAllowsSelectionDuringEditing:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setRowHeight:", *MEMORY[0x24BEBE770]);

  -[OBTableWelcomeController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEstimatedRowHeight:", 0.0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setBackgroundColor:", v19);

  -[OBTableWelcomeController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setScrollEnabled:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "reloadData");

  -[OBTableWelcomeController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "heightAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "contentSize");
  objc_msgSend(v25, "constraintEqualToConstant:", v27);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelsViewController setHeightAnchor:](self, "setHeightAnchor:", v28);

  -[TSCellularPlanLabelsViewController heightAnchor](self, "heightAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "setActive:", 1);

  if (self->_allowDismiss)
    v30 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 1, self, sel__cancelButtonTapped);
  else
    v30 = 0;
  -[OBBaseWelcomeController navigationItem](self, "navigationItem");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "setLeftBarButtonItem:", v30);

  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[TSCellularPlanLabelsViewController navigationController](self, "navigationController");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "navigationBar");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "setBackgroundColor:", v34);

  }
}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  objc_super v8;

  -[OBTableWelcomeController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "reloadData");

  -[TSCellularPlanLabelsViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "layoutIfNeeded");

  -[TSCellularPlanLabelsViewController heightAnchor](self, "heightAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "contentSize");
  objc_msgSend(v5, "setConstant:", v7);

  v8.receiver = self;
  v8.super_class = (Class)TSCellularPlanLabelsViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
}

- (void)viewWillAppear:(BOOL)a3
{
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
  int v16;
  NSObject *v17;
  BOOL v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  NSArray *v26;
  NSArray *planItemBadges;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)TSCellularPlanLabelsViewController;
  -[OBTableWelcomeController viewWillAppear:](&v28, sel_viewWillAppear_, a3);
  if ((-[TSCellularPlanLabelsViewController isMovingToParentViewController](self, "isMovingToParentViewController") & 1) == 0)
  {
    -[TSCellularPlanLabelsViewController labelPickerViewController](self, "labelPickerViewController");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[TSCellularPlanLabelsViewController labelPickerViewController](self, "labelPickerViewController");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "chosenLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSCellularPlanLabelsViewController labelPickerViewController](self, "labelPickerViewController");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "associatedPlanItem");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[TSCellularPlanLabelsViewController setPendingLabel:forPlanItem:](self, "setPendingLabel:forPlanItem:", v6, v8);

      -[TSCellularPlanLabelsViewController setLabelPickerViewController:](self, "setLabelPickerViewController:", 0);
      -[OBTableWelcomeController tableView](self, "tableView");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "reloadData");

    }
  }
  if ((unint64_t)-[NSMutableArray count](self->_sortedPlanItemsWithPendingLabels, "count") >= 2)
  {
    -[NSMutableArray objectAtIndex:](self->_sortedPlanItemsWithPendingLabels, "objectAtIndex:", 0);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "valueForKey:", CFSTR("pendingLabel"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[NSMutableArray objectAtIndex:](self->_sortedPlanItemsWithPendingLabels, "objectAtIndex:", 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "valueForKey:", CFSTR("pendingLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "label");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    v16 = objc_msgSend(v12, "isEqualToString:", v15);
    if (v16)
    {
      _TSLogDomain();
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        -[TSCellularPlanLabelsViewController viewWillAppear:].cold.1((uint64_t)v12, (uint64_t)v15, v17);

      v18 = 1;
    }
    else
    {
      v18 = 0;
    }
    -[OBBoldTrayButton setEnabled:](self->_doneButton, "setEnabled:", v16 ^ 1u);
    self->_showDupLabelsFooter = v18;
    v19 = objc_alloc(MEMORY[0x24BDBCE30]);
    -[NSMutableArray objectAtIndex:](self->_sortedPlanItemsWithPendingLabels, "objectAtIndex:", 0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "valueForKey:", CFSTR("pendingLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableArray objectAtIndex:](self->_sortedPlanItemsWithPendingLabels, "objectAtIndex:", 1);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "valueForKey:", CFSTR("pendingLabel"));
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v19, "initWithObjects:", v21, v23, 0);

    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "getShortLabelsForLabels:", v24);
    v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
    planItemBadges = self->_planItemBadges;
    self->_planItemBadges = v26;

  }
}

- (void)savePlanLabels:(id)a3
{
  void (**v4)(_QWORD);
  NSMutableArray *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(_QWORD))a3;
  if (-[NSMutableArray count](self->_sortedPlanItemsWithPendingLabels, "count"))
  {
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v5 = self->_sortedPlanItemsWithPendingLabels;
    v6 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v16;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v16 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
          +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("planItem"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("pendingLabel"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = (id)objc_msgSend(v11, "setLabelForPlan:label:", v12, v13);

        }
        v7 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v7);
    }

    goto LABEL_11;
  }
  if (v4)
LABEL_11:
    v4[2](v4);

}

- (void)setPendingLabel:(id)a3 forPlanItem:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[2];
  _QWORD v14[3];

  v14[2] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13[0] = CFSTR("pendingLabel");
  v13[1] = CFSTR("planItem");
  v14[0] = v6;
  v14[1] = v7;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, v13, 2);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[NSMutableArray count](self->_sortedPlanItemsWithPendingLabels, "count"))
  {
    v9 = 0;
    while (1)
    {
      -[TSCellularPlanLabelsViewController getPlanItemByIndex:](self, "getPlanItemByIndex:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "uuid");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "uuid");
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v11 == v12)
        break;
      if (-[NSMutableArray count](self->_sortedPlanItemsWithPendingLabels, "count") <= (unint64_t)++v9)
        goto LABEL_5;
    }
    -[NSMutableArray replaceObjectAtIndex:withObject:](self->_sortedPlanItemsWithPendingLabels, "replaceObjectAtIndex:withObject:", v9, v8);
  }
  else
  {
LABEL_5:
    -[NSMutableArray addObject:](self->_sortedPlanItemsWithPendingLabels, "addObject:", v8);
  }

}

- (id)getPlanItemByIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_sortedPlanItemsWithPendingLabels, "objectAtIndexedSubscript:", (int)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("planItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)getPendingLabelAtIndex:(int64_t)a3
{
  void *v3;
  void *v4;

  -[NSMutableArray objectAtIndexedSubscript:](self->_sortedPlanItemsWithPendingLabels, "objectAtIndexedSubscript:", (int)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("pendingLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)prepareLabels:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  NSString *v14;
  NSString *iccid;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  NSObject *v29;
  NSObject *v30;
  NSObject *v31;
  uint64_t v32;
  id v33;
  id v34;
  _QWORD v35[4];
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint8_t buf[4];
  uint64_t v43;
  __int16 v44;
  const char *v45;
  _BYTE v46[128];
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "planItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  v41 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v39;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v39 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v38 + 1) + 8 * i);
        if (objc_msgSend(v13, "isSelected"))
          objc_msgSend(v7, "addObject:", v13);
        if (!-[NSString length](self->_iccid, "length") && objc_msgSend(v13, "isInstalling"))
        {
          objc_msgSend(v13, "iccid");
          v14 = (NSString *)objc_claimAutoreleasedReturnValue();
          iccid = self->_iccid;
          self->_iccid = v14;

        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v38, v46, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v16, "count") >= 2)
  {
    objc_msgSend(v16, "objectAtIndex:", 0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "label");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (v19)
    {
      objc_msgSend(v16, "objectAtIndex:", 0);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "userLabel");
    }
    else
    {
      -[TSCellularPlanLabelsViewController getPredefinedUserLabels](self, "getPredefinedUserLabels");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "objectAtIndex:", 0);
    }
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanLabelsViewController setPendingLabel:forPlanItem:](self, "setPendingLabel:forPlanItem:", v21, v22);

    objc_msgSend(v16, "objectAtIndex:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "label");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_msgSend(v24, "length");

    if (v25)
    {
      objc_msgSend(v16, "objectAtIndex:", 1);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "userLabel");
    }
    else
    {
      -[TSCellularPlanLabelsViewController getPredefinedUserLabels](self, "getPredefinedUserLabels");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v26, "objectAtIndex:", 1);
    }
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "objectAtIndex:", 1);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanLabelsViewController setPendingLabel:forPlanItem:](self, "setPendingLabel:forPlanItem:", v27, v28);

    _TSLogDomain();
    v29 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      -[TSCellularPlanLabelsViewController prepareLabels:].cold.2(v16);

    _TSLogDomain();
    v30 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      -[TSCellularPlanLabelsViewController prepareLabels:].cold.1(v16);

  }
  _TSLogDomain();
  v31 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
  {
    v32 = objc_msgSend(v16, "count");
    *(_DWORD *)buf = 134218242;
    v43 = v32;
    v44 = 2080;
    v45 = "-[TSCellularPlanLabelsViewController prepareLabels:]";
    _os_log_impl(&dword_21B647000, v31, OS_LOG_TYPE_DEFAULT, "[sortedSelectedItems count]:%ld @%s", buf, 0x16u);
  }

  v35[0] = MEMORY[0x24BDAC760];
  v35[1] = 3221225472;
  v35[2] = __52__TSCellularPlanLabelsViewController_prepareLabels___block_invoke;
  v35[3] = &unk_24DEF3280;
  v36 = v16;
  v37 = v4;
  v33 = v16;
  v34 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v35);

}

uint64_t __52__TSCellularPlanLabelsViewController_prepareLabels___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), (unint64_t)objc_msgSend(*(id *)(a1 + 32), "count") > 1);
}

- (id)getPredefinedUserLabels
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BE15900], "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "getPredefinedLabels");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (void)prepare:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  id v8;
  id location;

  v4 = a3;
  if (v4)
  {
    if (self->_forceDualSIMSetup)
    {
      -[TSCellularPlanLabelsViewController prepareLabels:](self, "prepareLabels:", v4);
    }
    else
    {
      objc_initWeak(&location, self);
      +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6[0] = MEMORY[0x24BDAC760];
      v6[1] = 3221225472;
      v6[2] = __46__TSCellularPlanLabelsViewController_prepare___block_invoke;
      v6[3] = &unk_24DEF3688;
      objc_copyWeak(&v8, &location);
      v7 = v4;
      objc_msgSend(v5, "shouldShowPlanSetupWithCompletion:", v6);

      objc_destroyWeak(&v8);
      objc_destroyWeak(&location);
    }
  }

}

void __46__TSCellularPlanLabelsViewController_prepare___block_invoke(uint64_t a1, char a2)
{
  _QWORD block[4];
  id v5;
  id v6;
  char v7;

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __46__TSCellularPlanLabelsViewController_prepare___block_invoke_2;
  block[3] = &unk_24DEF3660;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  v7 = a2;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

  objc_destroyWeak(&v6);
}

void __46__TSCellularPlanLabelsViewController_prepare___block_invoke_2(uint64_t a1)
{
  _BYTE *WeakRetained;
  void *v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (!WeakRetained)
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __46__TSCellularPlanLabelsViewController_prepare___block_invoke_2_cold_1(v4, v5, v6, v7, v8, v9, v10, v11);
    goto LABEL_8;
  }
  if (!*(_BYTE *)(a1 + 48))
  {
    _TSLogDomain();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __46__TSCellularPlanLabelsViewController_prepare___block_invoke_2_cold_2(v4, v12, v13, v14, v15, v16, v17, v18);
LABEL_8:

    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    goto LABEL_9;
  }
  WeakRetained[1232] = 1;
  objc_msgSend(WeakRetained, "prepareLabels:", *(_QWORD *)(a1 + 32));
LABEL_9:

}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v6;
  void *v7;
  int v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;

  if (-[NSMutableArray count](self->_sortedPlanItemsWithPendingLabels, "count", a3))
  {
    -[TSCellularPlanLabelsViewController getPlanItemByIndex:](self, "getPlanItemByIndex:", a4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "iccid");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", self->_iccid);

    v9 = v6;
    if (!v8)
    {
      objc_msgSend(v6, "phoneNumber");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "length");

      if (v11)
      {
        v12 = (void *)MEMORY[0x24BDD17C8];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LABEL_FOR_PHONE_NUMBER_%@"), &stru_24DEF4290, CFSTR("Localizable"));
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "phoneNumber");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v15, 0);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "stringWithFormat:", v14, v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_9;
      }
      v9 = v6;
    }
    objc_msgSend(v9, "carrierName");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_msgSend(v18, "length");

    if (!v19)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LABEL_FOR_YOUR_PLAN"), &stru_24DEF4290, CFSTR("Localizable"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("LABEL_FOR_YOUR_CARRIER_PLAN_%@"), &stru_24DEF4290, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "carrierName");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v14, v21);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_9:
LABEL_11:

    return v17;
  }
  v17 = 0;
  return v17;
}

- (void)tableView:(id)a3 willDisplayHeaderView:(id)a4 forSection:(int64_t)a5
{
  void *v5;
  id v6;

  objc_msgSend(a4, "textLabel", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemGrayColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTextColor:", v5);

}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v6 = a3;
  v7 = v6;
  if (self->_showDupLabelsFooter && objc_msgSend(v6, "numberOfSections") - 1 == a4)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_LABELS_SECTION_FOOTER"), &stru_24DEF4290, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }

  return v9;
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
  return -[NSMutableArray count](self->_sortedPlanItemsWithPendingLabels, "count", a3);
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  TSCellularPlanLabelTableViewCell *v6;
  void *v7;
  void *v8;
  NSArray *planItemBadges;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;

  v5 = a4;
  v6 = -[TSCellularPlanLabelTableViewCell initWithStyle:reuseIdentifier:]([TSCellularPlanLabelTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("plan"));
  -[TSCellularPlanLabelsViewController getPendingLabelAtIndex:](self, "getPendingLabelAtIndex:", objc_msgSend(v5, "section"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "label");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[TSCellularPlanLabelTableViewCell setAccessoryType:](v6, "setAccessoryType:", 1);
  planItemBadges = self->_planItemBadges;
  v10 = objc_msgSend(v5, "section");

  -[NSArray objectAtIndex:](planItemBadges, "objectAtIndex:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelTableViewCell setLabel:badge:](v6, "setLabel:badge:", v8, v11);

  -[TSCellularPlanLabelsViewController traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "userInterfaceStyle");

  if (v13 == 1)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "colorWithWhite:alpha:", 0.95, 1.0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanLabelTableViewCell setBackgroundColor:](v6, "setBackgroundColor:", v14);

  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  TSCellularPlanLabelPickerTableViewController *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v5 = a4;
  v6 = objc_alloc_init(TSCellularPlanLabelPickerTableViewController);
  -[TSCellularPlanLabelsViewController setLabelPickerViewController:](self, "setLabelPickerViewController:", v6);

  -[TSCellularPlanLabelsViewController labelPickerViewController](self, "labelPickerViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelsViewController getPlanItemByIndex:](self, "getPlanItemByIndex:", objc_msgSend(v5, "section"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAssociatedPlanItem:", v8);

  -[TSCellularPlanLabelsViewController labelPickerViewController](self, "labelPickerViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelsViewController getPendingLabelAtIndex:](self, "getPendingLabelAtIndex:", objc_msgSend(v5, "section"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setInitialLabel:", v10);

  -[TSCellularPlanLabelsViewController labelPickerViewController](self, "labelPickerViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelsViewController getPredefinedUserLabels](self, "getPredefinedUserLabels");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPredefinedUserLabels:", v12);

  -[TSCellularPlanLabelsViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelsViewController labelPickerViewController](self, "labelPickerViewController");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "pushViewController:animated:", v14, 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "deselectRowAtIndexPath:animated:", v5, 1);

}

- (void)_cancelButtonTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "userDidTapCancel");

}

- (void)_doneButtonTapped
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[TSCellularPlanLabelsViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  objc_initWeak(&location, self);
  dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__TSCellularPlanLabelsViewController__doneButtonTapped__block_invoke;
  v5[3] = &unk_24DEF29F8;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __55__TSCellularPlanLabelsViewController__doneButtonTapped__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v2[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __55__TSCellularPlanLabelsViewController__doneButtonTapped__block_invoke_2;
  v2[3] = &unk_24DEF29A8;
  v2[4] = WeakRetained;
  objc_msgSend(WeakRetained, "savePlanLabels:", v2);

}

void __55__TSCellularPlanLabelsViewController__doneButtonTapped__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __55__TSCellularPlanLabelsViewController__doneButtonTapped__block_invoke_3;
  block[3] = &unk_24DEF29A8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __55__TSCellularPlanLabelsViewController__doneButtonTapped__block_invoke_3(uint64_t a1)
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

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)requireSetup
{
  return self->_requireSetup;
}

- (void)setRequireSetup:(BOOL)a3
{
  self->_requireSetup = a3;
}

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_heightAnchor, a3);
}

- (BOOL)showDupLabelsFooter
{
  return self->_showDupLabelsFooter;
}

- (void)setShowDupLabelsFooter:(BOOL)a3
{
  self->_showDupLabelsFooter = a3;
}

- (NSMutableArray)sortedPlanItemsWithPendingLabels
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setSortedPlanItemsWithPendingLabels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (TSCellularPlanLabelPickerTableViewController)labelPickerViewController
{
  return (TSCellularPlanLabelPickerTableViewController *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setLabelPickerViewController:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1264);
}

- (NSArray)planItemBadges
{
  return (NSArray *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setPlanItemBadges:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1272);
}

- (BOOL)forceDualSIMSetup
{
  return self->_forceDualSIMSetup;
}

- (void)setForceDualSIMSetup:(BOOL)a3
{
  self->_forceDualSIMSetup = a3;
}

- (BOOL)allowDismiss
{
  return self->_allowDismiss;
}

- (void)setAllowDismiss:(BOOL)a3
{
  self->_allowDismiss = a3;
}

- (NSString)iccid
{
  return (NSString *)objc_getProperty(self, a2, 1280, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_iccid, 0);
  objc_storeStrong((id *)&self->_planItemBadges, 0);
  objc_storeStrong((id *)&self->_labelPickerViewController, 0);
  objc_storeStrong((id *)&self->_sortedPlanItemsWithPendingLabels, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

- (void)viewWillAppear:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  __int16 v7;
  const char *v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v3 = 138412802;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  v7 = 2080;
  v8 = "-[TSCellularPlanLabelsViewController viewWillAppear:]";
  _os_log_debug_impl(&dword_21B647000, log, OS_LOG_TYPE_DEBUG, "[Db] Chosen labels %@, %@ duplicated, disabling the continue button @%s", (uint8_t *)&v3, 0x20u);
}

- (void)prepareLabels:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectAtIndex:", 1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_21B647000, v2, v3, "[Db] Secondary item: %@ @%s", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

- (void)prepareLabels:(void *)a1 .cold.2(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "objectAtIndex:", 0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0_1(&dword_21B647000, v2, v3, "[Db] Primary item: %@ @%s", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_3();
}

void __46__TSCellularPlanLabelsViewController_prepare___block_invoke_2_cold_1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]invalid self @%s", a5, a6, a7, a8, 2u);
}

void __46__TSCellularPlanLabelsViewController_prepare___block_invoke_2_cold_2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_0(&dword_21B647000, a1, a3, "[E]No need setup @%s", a5, a6, a7, a8, 2u);
}

@end
