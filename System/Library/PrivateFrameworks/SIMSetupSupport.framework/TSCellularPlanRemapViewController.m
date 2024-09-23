@implementation TSCellularPlanRemapViewController

- (TSCellularPlanRemapViewController)initWithBackButton:(BOOL)a3 continueButton:(BOOL)a4 danglingPlanItem:(id)a5
{
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  unint64_t v11;
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
  TSCellularPlanRemapViewController *v22;
  objc_super v26;

  v7 = a5;
  objc_msgSend(v7, "phoneNumber");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  v10 = (void *)MEMORY[0x24BDD17C8];
  v11 = 0x24BDD1000uLL;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v9)
  {
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_CONTACT_DETAIL_WITH_NUMBER_%@_%@"), &stru_24DEF4290, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "phoneNumber");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v14, v16, v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = 0x24BDD1000;
  }
  else
  {
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_CONTACT_DETAIL_%@"), &stru_24DEF4290, CFSTR("Localizable"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "userLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "label");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", v14, v16);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(*(id *)(v11 + 1160), "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_CONTACT_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v26.receiver = self;
  v26.super_class = (Class)TSCellularPlanRemapViewController;
  v22 = -[OBTableWelcomeController initWithTitle:detailText:icon:](&v26, sel_initWithTitle_detailText_icon_, v21, v19, 0);

  if (v22)
  {
    v22->_hasBackButton = a3;
    v22->_hasContinueButton = a4;
    objc_storeStrong((id *)&v22->_danglingPlanItem, a5);
  }

  return v22;
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
  void *v13;
  void *v14;
  id v15;
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
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  double v32;
  void *v33;
  void *v34;
  objc_super v35;

  v35.receiver = self;
  v35.super_class = (Class)TSCellularPlanRemapViewController;
  -[TSOBTableWelcomeController viewDidLoad](&v35, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanRemapViewController navigationController](self, "navigationController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackgroundColor:", v3);

  LODWORD(v5) = self->_hasContinueButton;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if ((_DWORD)v5)
    v8 = CFSTR("CONTINUE");
  else
    v8 = CFSTR("DONE");
  objc_msgSend(v6, "localizedStringForKey:value:table:", v8, &stru_24DEF4290, CFSTR("Localizable"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE6E3E8], "boldButton");
  v10 = (OBBoldTrayButton *)objc_claimAutoreleasedReturnValue();
  doneButton = self->_doneButton;
  self->_doneButton = v10;

  -[OBBoldTrayButton addTarget:action:forControlEvents:](self->_doneButton, "addTarget:action:forControlEvents:", self, sel__doneButtonTapped, 64);
  -[OBBoldTrayButton setTitle:forState:](self->_doneButton, "setTitle:forState:", v9, 0);
  -[OBBoldTrayButton setEnabled:](self->_doneButton, "setEnabled:", 0);
  -[TSCellularPlanRemapViewController buttonTray](self, "buttonTray");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "addButton:", self->_doneButton);

  -[TSCellularPlanRemapViewController navigationController](self, "navigationController");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setHidesBackButton:", !self->_hasBackButton);

  v15 = objc_alloc(MEMORY[0x24BEBD9F0]);
  v16 = (void *)objc_msgSend(v15, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
  -[OBTableWelcomeController setTableView:](self, "setTableView:", v16);

  -[OBTableWelcomeController tableView](self, "tableView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BEBD4B8], "clearColor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v18);

  -[OBTableWelcomeController tableView](self, "tableView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAllowsSelectionDuringEditing:", 1);

  -[OBTableWelcomeController tableView](self, "tableView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "setRowHeight:", *MEMORY[0x24BEBE770]);

  -[OBTableWelcomeController tableView](self, "tableView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setEstimatedRowHeight:", 0.0);

  -[OBTableWelcomeController tableView](self, "tableView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setDataSource:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setDelegate:", self);

  -[OBTableWelcomeController tableView](self, "tableView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "reloadData");

  if (!+[TSUtilities inBuddy](TSUtilities, "inBuddy"))
  {
    -[TSCellularPlanRemapViewController navigationController](self, "navigationController");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "navigationBar");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setBackgroundColor:", v28);

  }
  -[OBTableWelcomeController tableView](self, "tableView");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "heightAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  -[OBTableWelcomeController tableView](self, "tableView");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "contentSize");
  objc_msgSend(v30, "constraintEqualToConstant:", v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanRemapViewController setHeightAnchor:](self, "setHeightAnchor:", v33);

  -[TSCellularPlanRemapViewController heightAnchor](self, "heightAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setActive:", 1);

}

- (void)viewDidLayoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  objc_super v8;

  -[TSCellularPlanRemapViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "layoutIfNeeded");

  -[OBTableWelcomeController tableView](self, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "contentSize");
  v6 = v5;
  -[TSCellularPlanRemapViewController heightAnchor](self, "heightAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v6);

  v8.receiver = self;
  v8.super_class = (Class)TSCellularPlanRemapViewController;
  -[OBTableWelcomeController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
}

- (void)remapDanglingItem:(id)a3
{
  void (**v4)(_QWORD);
  NSObject *v5;
  NSInteger v6;
  NSObject *v7;
  void *v8;
  CTDanglingPlanItem *danglingPlanItem;
  void *v10;
  id v11;

  v4 = (void (**)(_QWORD))a3;
  _TSLogDomain();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    -[TSCellularPlanRemapViewController remapDanglingItem:].cold.2((uint64_t)self, v5);

  v6 = -[NSIndexPath row](self->_chosenTargetCellularPlanItem, "row");
  if (v6 == -[NSArray count](self->_selectedPlanItems, "count"))
  {
    _TSLogDomain();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      -[TSCellularPlanRemapViewController remapDanglingItem:].cold.1(v7);

    if (v4)
      v4[2](v4);
  }
  else
  {
    +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    danglingPlanItem = self->_danglingPlanItem;
    -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", -[NSIndexPath row](self->_chosenTargetCellularPlanItem, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (id)objc_msgSend(v8, "remapSimLabel:to:", danglingPlanItem, v10);

    if (v4)
      v4[2](v4);

  }
}

- (void)prepare:(id)a3
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
  NSArray *v14;
  NSArray *selectedPlanItems;
  _QWORD block[4];
  id v17;
  id v18;
  id location;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "planItems");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v8 = v6;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v21 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v20 + 1) + 8 * i);
        if (objc_msgSend(v13, "isSelected"))
          objc_msgSend(v7, "addObject:", v13);
        if (objc_msgSend(v13, "isDefaultVoice"))
          objc_storeStrong((id *)&self->_defaultVoiceItem, v13);
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "sortedArrayUsingSelector:", sel_compare_);
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  selectedPlanItems = self->_selectedPlanItems;
  self->_selectedPlanItems = v14;

  if (v4)
  {
    objc_initWeak(&location, self);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __45__TSCellularPlanRemapViewController_prepare___block_invoke;
    block[3] = &unk_24DEF3C58;
    v17 = v4;
    objc_copyWeak(&v18, &location);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
    objc_destroyWeak(&v18);

    objc_destroyWeak(&location);
  }

}

void __45__TSCellularPlanRemapViewController_prepare___block_invoke(uint64_t a1)
{
  uint64_t v1;
  void *v2;
  id WeakRetained;

  v1 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "selectedPlanItems");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, BOOL))(v1 + 16))(v1, (unint64_t)objc_msgSend(v2, "count") > 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 1;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_selectedPlanItems, "count", a3, a4) + 1;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  TSCellularPlanRemapTableViewCell *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;

  v5 = a4;
  v6 = -[TSCellularPlanRemapTableViewCell initWithStyle:reuseIdentifier:]([TSCellularPlanRemapTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("use"));
  -[TSCellularPlanRemapTableViewCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
  v7 = objc_msgSend(v5, "row");
  if (v7 == -[NSArray count](self->_selectedPlanItems, "count"))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_CONTACT_ROW_DECIDE_LATER"), &stru_24DEF4290, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanRemapTableViewCell titleLabel](v6, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v9);
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_CONTACT_ROW_TITLE"), &stru_24DEF4290, CFSTR("Localizable"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray objectAtIndex:](self->_selectedPlanItems, "objectAtIndex:", objc_msgSend(v5, "row"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "label");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringWithFormat:", v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanRemapTableViewCell titleLabel](v6, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setText:", v13);

  }
  if (-[NSIndexPath isEqual:](self->_chosenTargetCellularPlanItem, "isEqual:", v5))
    v15 = 3;
  else
    v15 = 0;
  -[TSCellularPlanRemapTableViewCell setAccessoryType:](v6, "setAccessoryType:", v15);

  return v6;
}

- (double)tableView:(id)a3 estimatedHeightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x24BEBE770];
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_CONTACT_SECTION_FOOTER"), &stru_24DEF4290, CFSTR("Localizable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[CTCellularPlanItem userLabel](self->_defaultVoiceItem, "userLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "label");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
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

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[OBBoldTrayButton setEnabled:](self->_doneButton, "setEnabled:", 1);
  -[OBTableWelcomeController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "reloadData");

  objc_storeStrong((id *)&self->_chosenTargetCellularPlanItem, a4);
  if (objc_msgSend(v10, "numberOfRowsInSection:", objc_msgSend(v6, "section")) >= 1)
  {
    v8 = 0;
    do
    {
      if (v8 != objc_msgSend(v6, "row"))
      {
        objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v8, objc_msgSend(v6, "section"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "deselectRowAtIndexPath:animated:", v9, 0);

      }
      ++v8;
    }
    while (v8 < objc_msgSend(v10, "numberOfRowsInSection:", objc_msgSend(v6, "section")));
  }

}

- (int64_t)tableView:(id)a3 editingStyleForRowAtIndexPath:(id)a4
{
  return 3;
}

- (BOOL)tableView:(id)a3 shouldIndentWhileEditingRowAtIndexPath:(id)a4
{
  return 1;
}

- (void)tableView:(id)a3 didDeselectRowAtIndexPath:(id)a4
{
  objc_msgSend(a3, "selectRowAtIndexPath:animated:scrollPosition:", a4, 0, 0);
}

- (void)_doneButtonTapped
{
  void *v3;
  NSObject *v4;
  _QWORD v5[4];
  id v6;
  id location;

  -[TSCellularPlanRemapViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setUserInteractionEnabled:", 0);

  objc_initWeak(&location, self);
  dispatch_get_global_queue(2, 0);
  v4 = objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __54__TSCellularPlanRemapViewController__doneButtonTapped__block_invoke;
  v5[3] = &unk_24DEF29F8;
  objc_copyWeak(&v6, &location);
  dispatch_async(v4, v5);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __54__TSCellularPlanRemapViewController__doneButtonTapped__block_invoke(uint64_t a1)
{
  id WeakRetained;
  _QWORD v2[5];

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = __54__TSCellularPlanRemapViewController__doneButtonTapped__block_invoke_2;
  v2[3] = &unk_24DEF29A8;
  v2[4] = WeakRetained;
  objc_msgSend(WeakRetained, "remapDanglingItem:", v2);

}

void __54__TSCellularPlanRemapViewController__doneButtonTapped__block_invoke_2(uint64_t a1)
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54__TSCellularPlanRemapViewController__doneButtonTapped__block_invoke_3;
  block[3] = &unk_24DEF29A8;
  block[4] = *(_QWORD *)(a1 + 32);
  dispatch_async(MEMORY[0x24BDAC9B8], block);
}

void __54__TSCellularPlanRemapViewController__doneButtonTapped__block_invoke_3(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "delegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "viewControllerDidComplete:", *(_QWORD *)(a1 + 32));

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

- (NSLayoutConstraint)heightAnchor
{
  return self->_heightAnchor;
}

- (void)setHeightAnchor:(id)a3
{
  objc_storeStrong((id *)&self->_heightAnchor, a3);
}

- (NSArray)selectedPlanItems
{
  return (NSArray *)objc_getProperty(self, a2, 1256, 1);
}

- (void)setSelectedPlanItems:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1256);
}

- (CTDanglingPlanItem)danglingPlanItem
{
  return (CTDanglingPlanItem *)objc_getProperty(self, a2, 1264, 1);
}

- (void)setDanglingPlanItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1264);
}

- (CTCellularPlanItem)defaultVoiceItem
{
  return (CTCellularPlanItem *)objc_getProperty(self, a2, 1272, 1);
}

- (void)setDefaultVoiceItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1272);
}

- (NSIndexPath)chosenTargetCellularPlanItem
{
  return (NSIndexPath *)objc_getProperty(self, a2, 1280, 1);
}

- (void)setChosenTargetCellularPlanItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1280);
}

- (BOOL)hasBackButton
{
  return self->_hasBackButton;
}

- (void)setHasBackButton:(BOOL)a3
{
  self->_hasBackButton = a3;
}

- (BOOL)hasContinueButton
{
  return self->_hasContinueButton;
}

- (void)setHasContinueButton:(BOOL)a3
{
  self->_hasContinueButton = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chosenTargetCellularPlanItem, 0);
  objc_storeStrong((id *)&self->_defaultVoiceItem, 0);
  objc_storeStrong((id *)&self->_danglingPlanItem, 0);
  objc_storeStrong((id *)&self->_selectedPlanItems, 0);
  objc_storeStrong((id *)&self->_heightAnchor, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_doneButton, 0);
}

- (void)remapDanglingItem:(os_log_t)log .cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v1 = 136315138;
  v2 = "-[TSCellularPlanRemapViewController remapDanglingItem:]";
  _os_log_debug_impl(&dword_21B647000, log, OS_LOG_TYPE_DEBUG, "[Db] update later selected, skipping remap @%s", (uint8_t *)&v1, 0xCu);
}

- (void)remapDanglingItem:(uint64_t)a1 .cold.2(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  const char *v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = objc_msgSend(*(id *)(a1 + 1280), "row");
  v4 = 134218242;
  v5 = v3;
  v6 = 2080;
  v7 = "-[TSCellularPlanRemapViewController remapDanglingItem:]";
  _os_log_debug_impl(&dword_21B647000, a2, OS_LOG_TYPE_DEBUG, "[Db] remapping dangling item... selected row: %ld @%s", (uint8_t *)&v4, 0x16u);
}

@end
