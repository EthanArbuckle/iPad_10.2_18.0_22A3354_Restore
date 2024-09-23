@implementation TSCellularPlanLabelPickerTableViewController

- (TSCellularPlanLabelPickerTableViewController)init
{
  TSCellularPlanLabelPickerTableViewController *v2;
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)TSCellularPlanLabelPickerTableViewController;
  v2 = -[TSCellularPlanLabelPickerTableViewController init](&v9, sel_init);
  if (v2)
  {
    v3 = objc_alloc(MEMORY[0x24BEBD9F0]);
    v4 = (void *)objc_msgSend(v3, "initWithFrame:style:", 2, *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
    -[TSCellularPlanLabelPickerTableViewController setTableView:](v2, "setTableView:", v4);

    -[TSCellularPlanLabelPickerTableViewController tableView](v2, "tableView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAllowsMultipleSelection:", 0);

    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", 0.0, 0.0, 0.0, 1.0);
    -[TSCellularPlanLabelPickerTableViewController tableView](v2, "tableView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setTableHeaderView:", v6);

  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  CTUserLabel *initialLabel;
  CTUserLabel *v8;
  CTUserLabel *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  objc_super v27;

  v27.receiver = self;
  v27.super_class = (Class)TSCellularPlanLabelPickerTableViewController;
  -[TSCellularPlanLabelPickerTableViewController viewWillAppear:](&v27, sel_viewWillAppear_, a3);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelPickerTableViewController navigationController](self, "navigationController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "view");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v4);

  initialLabel = self->_initialLabel;
  if (!initialLabel)
  {
    -[NSArray objectAtIndexedSubscript:](self->_predefinedUserLabels, "objectAtIndexedSubscript:", 0);
    v8 = (CTUserLabel *)objc_claimAutoreleasedReturnValue();
    v9 = self->_initialLabel;
    self->_initialLabel = v8;

    initialLabel = self->_initialLabel;
  }
  v10 = -[CTUserLabel indexInPredefinedLabels:](initialLabel, "indexInPredefinedLabels:", self->_predefinedUserLabels);
  if (v10 == -1)
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_storeStrong((id *)&self->_customLabel, self->_initialLabel);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", v10, 0);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_storeStrong((id *)&self->_chosenLabelIndexPath, v11);
  -[TSCellularPlanLabelPickerTableViewController tableView](self, "tableView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "reloadData");

  -[TSCellularPlanLabelPickerTableViewController navigationItem](self, "navigationItem");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setRightBarButtonItem:animated:", 0, 0);

  -[TSCellularPlanLabelPickerTableViewController navigationItem](self, "navigationItem");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD410]), "initWithBarButtonSystemItem:target:action:", 0, self, sel__doneButtonTapped);
  objc_msgSend(v14, "setLeftBarButtonItem:animated:", v15, 0);

  -[CTCellularPlanItem phoneNumber](self->_associatedPlanItem, "phoneNumber");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "length");

  if (v17)
  {
    -[TSCellularPlanLabelPickerTableViewController navigationItem](self, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[CTCellularPlanItem phoneNumber](self->_associatedPlanItem, "phoneNumber");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    +[TSUtilities formattedPhoneNumber:withCountryCode:](TSUtilities, "formattedPhoneNumber:withCountryCode:", v19, 0);
    v20 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[CTCellularPlanItem carrierName](self->_associatedPlanItem, "carrierName");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v22, "length");

    -[TSCellularPlanLabelPickerTableViewController navigationItem](self, "navigationItem");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("TITLE_%@_PLAN"), &stru_24DEF4290, CFSTR("Localizable"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[CTCellularPlanItem carrierName](self->_associatedPlanItem, "carrierName");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "stringWithFormat:", v21, v25);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setTitle:", v26);

      goto LABEL_11;
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("CELLULAR_PLAN_LABEL"), &stru_24DEF4290, CFSTR("Localizable"));
    v20 = objc_claimAutoreleasedReturnValue();
  }
  v21 = (void *)v20;
  objc_msgSend(v18, "setTitle:", v20);
LABEL_11:

}

- (CTUserLabel)chosenLabel
{
  NSIndexPath *v3;
  id v4;
  NSIndexPath *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v3 = self->_chosenLabelIndexPath;
  if (-[NSIndexPath section](v3, "section"))
  {
    v4 = objc_alloc(MEMORY[0x24BE15918]);
    -[TSCellularPlanLabelPickerTableViewController tableView](self, "tableView");
    v5 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    -[NSIndexPath cellForRowAtIndexPath:](v5, "cellForRowAtIndexPath:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "editableTextField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "text");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v4, "initWithLabel:", v8);

    v3 = v5;
  }
  else
  {
    -[NSArray objectAtIndexedSubscript:](self->_predefinedUserLabels, "objectAtIndexedSubscript:", -[NSIndexPath row](v3, "row"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (CTUserLabel *)v9;
}

- (id)customLabelIndexPath
{
  return (id)objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
}

- (id)customLabelRowValue
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[TSCellularPlanLabelPickerTableViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanLabelPickerTableViewController customLabelIndexPath](self, "customLabelIndexPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "cellForRowAtIndexPath:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "editableTextField");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "text");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)_doneButtonTapped
{
  void *v3;
  id v4;
  id v5;

  -[TSCellularPlanLabelPickerTableViewController view](self, "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endEditing:", 1);

  -[TSCellularPlanLabelPickerTableViewController navigationController](self, "navigationController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (a4)
    return 1;
  else
    return -[NSArray count](self->_predefinedUserLabels, "count", a3);
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if (a4 == 1)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("CUSTOM_LABEL"), &stru_24DEF4290, CFSTR("Localizable"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  TSCellularPlanLabelTableViewCell *v6;
  NSArray *predefinedUserLabels;
  void *v8;
  BOOL v9;
  int v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL8 v20;
  int v21;
  TSCellularPlanLabelTableViewCell *v22;
  uint64_t v23;
  NSArray *v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;

  v5 = a4;
  if (objc_msgSend(v5, "section"))
  {
    v6 = (TSCellularPlanLabelTableViewCell *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD9F8]), "initWithStyle:reuseIdentifier:", 1000, CFSTR("customlabel"));
    predefinedUserLabels = self->_predefinedUserLabels;
    -[TSCellularPlanLabelPickerTableViewController chosenLabel](self, "chosenLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[NSArray containsObject:](predefinedUserLabels, "containsObject:", v8);

    v10 = -[NSIndexPath isEqual:](self->_chosenLabelIndexPath, "isEqual:", v5);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("TYPE_LABEL_HERE"), &stru_24DEF4290, CFSTR("Localizable"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanLabelTableViewCell editableTextField](v6, "editableTextField");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setPlaceholder:", v12);

    -[CTUserLabel label](self->_customLabel, "label");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanLabelTableViewCell editableTextField](v6, "editableTextField");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setText:", v14);

    -[TSCellularPlanLabelTableViewCell editableTextField](v6, "editableTextField");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setReturnKeyType:", 9);

    -[TSCellularPlanLabelTableViewCell editableTextField](v6, "editableTextField");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setClearButtonMode:", 1);

    -[TSCellularPlanLabelTableViewCell editableTextField](v6, "editableTextField");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setReturnKeyType:", 0);

    -[TSCellularPlanLabelTableViewCell editableTextField](v6, "editableTextField");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setDelegate:", self);

    -[TSCellularPlanLabelTableViewCell setSelectionStyle:](v6, "setSelectionStyle:", 0);
    -[TSCellularPlanLabelTableViewCell setTextFieldOffset:](v6, "setTextFieldOffset:", 0.01);
    if (v9)
    {
      v20 = 0;
    }
    else
    {
      -[CTUserLabel label](self->_customLabel, "label");
      self = (TSCellularPlanLabelPickerTableViewController *)objc_claimAutoreleasedReturnValue();
      v20 = -[TSCellularPlanLabelPickerTableViewController length](self, "length") == 0;
    }
    -[TSCellularPlanLabelTableViewCell textLabel](v6, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setEnabled:", v20);

    if (!v9)
    if (v10)
      v29 = 3;
    else
      v29 = 0;
    -[TSCellularPlanLabelTableViewCell setAccessoryType:](v6, "setAccessoryType:", v29);
  }
  else
  {
    v21 = -[NSIndexPath isEqual:](self->_chosenLabelIndexPath, "isEqual:", v5);
    v22 = -[TSCellularPlanLabelTableViewCell initWithStyle:reuseIdentifier:]([TSCellularPlanLabelTableViewCell alloc], "initWithStyle:reuseIdentifier:", 0, CFSTR("label"));
    v6 = v22;
    if (v21)
      v23 = 3;
    else
      v23 = 0;
    -[TSCellularPlanLabelTableViewCell setAccessoryType:](v22, "setAccessoryType:", v23);
    v24 = self->_predefinedUserLabels;
    v25 = objc_msgSend(v5, "row");

    -[NSArray objectAtIndexedSubscript:](v24, "objectAtIndexedSubscript:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "label");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[TSCellularPlanLabelTableViewCell setLabelWithNoBadge:](v6, "setLabelWithNoBadge:", v27);

  }
  return v6;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  CTUserLabel *v14;
  CTUserLabel *customLabel;
  void *v16;
  id v17;

  v17 = a3;
  v6 = a4;
  if (!objc_msgSend(v6, "section"))
  {
    objc_msgSend(MEMORY[0x24BDD15D8], "indexPathForRow:inSection:", 0, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "cellForRowAtIndexPath:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "editableTextField");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "text");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "length");

    if (!v13)
    {
      v14 = (CTUserLabel *)objc_msgSend(objc_alloc(MEMORY[0x24BE15918]), "initWithLabel:", &stru_24DEF4290);
      customLabel = self->_customLabel;
      self->_customLabel = v14;

    }
    goto LABEL_7;
  }
  if (objc_msgSend(v6, "section") == 1)
  {
    -[TSCellularPlanLabelPickerTableViewController customLabelRowValue](self, "customLabelRowValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
LABEL_7:
      objc_storeStrong((id *)&self->_chosenLabelIndexPath, a4);
  }
  -[TSCellularPlanLabelPickerTableViewController tableView](self, "tableView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "reloadData");

}

- (void)textFieldDidEndEditing:(id)a3
{
  void *v4;
  void *v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  CTUserLabel *v11;
  CTUserLabel *customLabel;
  NSIndexPath *v13;
  NSIndexPath *chosenLabelIndexPath;
  void *v15;
  id v16;

  objc_msgSend(a3, "text");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
  {
    if ((unint64_t)objc_msgSend(v5, "length") >= 0x1F)
    {
      v6 = objc_msgSend(v5, "length");
      if (v6 >= 0x1E)
        v7 = 30;
      else
        v7 = v6;
      v8 = objc_msgSend(v5, "rangeOfComposedCharacterSequencesForRange:", 0, v7);
      objc_msgSend(v5, "substringWithRange:", v8, v9);
      v10 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v10;
    }
    v11 = (CTUserLabel *)objc_msgSend(objc_alloc(MEMORY[0x24BE15918]), "initWithLabel:", v5);
    customLabel = self->_customLabel;
    self->_customLabel = v11;

    -[TSCellularPlanLabelPickerTableViewController customLabelIndexPath](self, "customLabelIndexPath");
    v13 = (NSIndexPath *)objc_claimAutoreleasedReturnValue();
    chosenLabelIndexPath = self->_chosenLabelIndexPath;
    self->_chosenLabelIndexPath = v13;

  }
  -[TSCellularPlanLabelPickerTableViewController tableView](self, "tableView");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "reloadData");

}

- (CTCellularPlanItem)associatedPlanItem
{
  return (CTCellularPlanItem *)objc_getProperty(self, a2, 1016, 1);
}

- (void)setAssociatedPlanItem:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1016);
}

- (CTUserLabel)initialLabel
{
  return (CTUserLabel *)objc_getProperty(self, a2, 1024, 1);
}

- (void)setInitialLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1024);
}

- (NSArray)predefinedUserLabels
{
  return (NSArray *)objc_getProperty(self, a2, 1032, 1);
}

- (void)setPredefinedUserLabels:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1032);
}

- (NSIndexPath)chosenLabelIndexPath
{
  return (NSIndexPath *)objc_getProperty(self, a2, 1040, 1);
}

- (void)setChosenLabelIndexPath:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1040);
}

- (CTUserLabel)customLabel
{
  return (CTUserLabel *)objc_getProperty(self, a2, 1048, 1);
}

- (void)setCustomLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_customLabel, 0);
  objc_storeStrong((id *)&self->_chosenLabelIndexPath, 0);
  objc_storeStrong((id *)&self->_predefinedUserLabels, 0);
  objc_storeStrong((id *)&self->_initialLabel, 0);
  objc_storeStrong((id *)&self->_associatedPlanItem, 0);
}

@end
