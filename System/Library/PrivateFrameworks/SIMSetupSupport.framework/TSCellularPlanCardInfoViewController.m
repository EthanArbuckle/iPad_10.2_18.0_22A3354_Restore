@implementation TSCellularPlanCardInfoViewController

- (TSCellularPlanCardInfoViewController)init
{
  void *v3;
  TSCellularPlanCardInfoViewController *v4;
  uint64_t v5;
  NSArray *tableData;
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
  uint64_t v20;
  NSArray *v21;
  void *v23;
  objc_super v24;
  _QWORD v25[3];
  _QWORD v26[2];
  _QWORD v27[2];
  const __CFString *v28;
  void *v29;
  const __CFString *v30;
  _QWORD v31[2];

  v31[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v24.receiver = self;
  v24.super_class = (Class)TSCellularPlanCardInfoViewController;
  v4 = -[TSCellularPlanCardInfoViewController initWithNibName:bundle:](&v24, sel_initWithNibName_bundle_, CFSTR("TSCellularPlanCardInfoView"), v3);

  if (v4)
  {
    -[TSCellularPlanCardInfoViewController setModalInPresentation:](v4, "setModalInPresentation:", 1);
    v5 = objc_opt_new();
    tableData = v4->_tableData;
    v4->_tableData = (NSArray *)v5;

    v30 = CFSTR("TITLE_KEY");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("NPHCELLULAR_CARD_INFO_SMDP_LABEL"), &stru_24DEF4290, CFSTR("Localizable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v31[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v31, &v30, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = (void *)objc_msgSend(v9, "mutableCopy");

    v28 = CFSTR("TITLE_KEY");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("NPHCELLULAR_CARD_INFO_ACTIVATION_CODE_LABEL"), &stru_24DEF4290, CFSTR("Localizable"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = v11;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v29, &v28, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = (void *)objc_msgSend(v12, "mutableCopy");

    v26[0] = CFSTR("TITLE_KEY");
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NPHCELLULAR_CARD_INFO_CONFIRMATION_CODE_LABEL"), &stru_24DEF4290, CFSTR("Localizable"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v26[1] = CFSTR("PLACEHOLDER_KEY");
    v27[0] = v15;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("NPHCELLULAR_CARD_INFO_CONFIRMATION_CODE_PLACEHOLDER"), &stru_24DEF4290, CFSTR("Localizable"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v27[1] = v17;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v27, v26, 2);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(v18, "mutableCopy");

    v25[0] = v23;
    v25[1] = v13;
    v25[2] = v19;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v25, 3);
    v20 = objc_claimAutoreleasedReturnValue();
    v21 = v4->_tableData;
    v4->_tableData = (NSArray *)v20;

  }
  return v4;
}

- (void)viewDidLoad
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
  id WeakRetained;
  id v13;
  void *v14;
  void *v15;
  UIBarButtonItem *v16;
  UIBarButtonItem *nextButton;
  void *v18;
  objc_super v19;

  v19.receiver = self;
  v19.super_class = (Class)TSCellularPlanCardInfoViewController;
  -[SSUIViewController viewDidLoad](&v19, sel_viewDidLoad);
  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanCardInfoViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v3);

  objc_msgSend(MEMORY[0x24BEBD4B8], "systemBackgroundColor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanCardInfoViewController navigationController](self, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setBackgroundColor:", v5);

  objc_msgSend(MEMORY[0x24BEBB528], "preferredFontDescriptorWithTextStyle:", *MEMORY[0x24BEBE238]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BEBB520];
  objc_msgSend(v8, "fontDescriptorWithSymbolicTraits:", 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "fontWithDescriptor:size:", v10, 0.0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  WeakRetained = objc_loadWeakRetained((id *)&self->_enterActivationLabel);
  objc_msgSend(WeakRetained, "setFont:", v11);

  v13 = objc_alloc(MEMORY[0x24BEBD410]);
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("NPHCELLULAR_CARD_INFO_NEXT"), &stru_24DEF4290, CFSTR("Localizable"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (UIBarButtonItem *)objc_msgSend(v13, "initWithTitle:style:target:action:", v15, 2, self, sel_addNewPlanWithUserInfo_);
  nextButton = self->_nextButton;
  self->_nextButton = v16;

  -[TSCellularPlanCardInfoViewController navigationItem](self, "navigationItem");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setRightBarButtonItem:animated:", self->_nextButton, 0);

  -[UIBarButtonItem setEnabled:](self->_nextButton, "setEnabled:", 0);
}

- (void)viewDidLayoutSubviews
{
  id WeakRetained;
  void *v4;
  double v5;
  double v6;
  id v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)TSCellularPlanCardInfoViewController;
  -[TSCellularPlanCardInfoViewController viewDidLayoutSubviews](&v8, sel_viewDidLayoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_infoTableView);
  objc_msgSend(MEMORY[0x24BDD15D8], "indexPathWithIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[TSCellularPlanCardInfoViewController tableView:heightForRowAtIndexPath:](self, "tableView:heightForRowAtIndexPath:", WeakRetained, v4);
  v6 = v5;

  v7 = objc_loadWeakRetained((id *)&self->_infoTableViewHeightConstraint);
  objc_msgSend(v7, "setConstant:", v6 * 3.0 + -0.5);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TSCellularPlanCardInfoViewController;
  -[TSCellularPlanCardInfoViewController viewWillAppear:](&v6, sel_viewWillAppear_, a3);
  self->_keyboardSize = (CGSize)*MEMORY[0x24BDBF148];
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel_keyboardWasShown_, *MEMORY[0x24BEBE448], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel_keyboardWillBeHidden_, *MEMORY[0x24BEBE578], 0);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TSCellularPlanCardInfoViewController;
  -[TSCellularPlanCardInfoViewController viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[TSCellularPlanCardInfoViewController resetFirstResponder](self, "resetFirstResponder");
}

- (void)resetFirstResponder
{
  void *v2;
  void *v3;
  id v4;

  -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("TABLE_CELL_KEY"));
  v4 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "editableTextField");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "becomeFirstResponder");

}

- (void)viewWillDisappear:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)TSCellularPlanCardInfoViewController;
  -[TSCellularPlanCardInfoViewController viewWillDisappear:](&v7, sel_viewWillDisappear_, a3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "receivedResponse");

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BEBE448], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BEBE578], 0);

}

- (void)keyboardWasShown:(id)a3
{
  void *v4;
  CGFloat v5;
  CGFloat v6;
  id v7;

  objc_msgSend(a3, "userInfo");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BEBE468]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "CGRectValue");
  self->_keyboardSize.width = v5;
  self->_keyboardSize.height = v6;

  -[TSCellularPlanCardInfoViewController scrollViewForKeyboardIfNecessary](self, "scrollViewForKeyboardIfNecessary");
}

- (void)keyboardWillBeHidden:(id)a3
{
  CGFloat v3;
  UIScrollView **p_scrollView;
  id WeakRetained;
  id v6;

  v3 = -self->_keyboardSize.height;
  p_scrollView = &self->_scrollView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "setContentInset:", 0.0, 0.0, v3, 0.0);

  v6 = objc_loadWeakRetained((id *)p_scrollView);
  objc_msgSend(v6, "setScrollIndicatorInsets:", 0.0, 0.0, v3, 0.0);

}

- (void)scrollViewForKeyboardIfNecessary
{
  CGFloat *p_height;
  double v4;
  double v5;
  double v6;
  double v7;
  UIScrollView **p_scrollView;
  id WeakRetained;
  id v10;
  void *v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  CGFloat v20;
  UITextField *activeTextField;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  id v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  id v39;
  CGRect v40;
  CGRect v41;

  if (self->_activeTextField)
  {
    p_height = &self->_keyboardSize.height;
    v4 = 0.0;
    v5 = 0.0;
    v6 = 0.0;
  }
  else
  {
    v6 = *MEMORY[0x24BEBE158];
    v5 = *(double *)(MEMORY[0x24BEBE158] + 8);
    v4 = *(double *)(MEMORY[0x24BEBE158] + 24);
    p_height = (CGFloat *)(MEMORY[0x24BEBE158] + 16);
  }
  v7 = *p_height;
  p_scrollView = &self->_scrollView;
  WeakRetained = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(WeakRetained, "setScrollIndicatorInsets:", v6, v5, v7, v4);

  v10 = objc_loadWeakRetained((id *)&self->_scrollView);
  objc_msgSend(v10, "setContentInset:", v6, v5, v7, v4);

  if (self->_activeTextField)
  {
    -[TSCellularPlanCardInfoViewController view](self, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "frame");
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v19 = v18;

    v20 = v19 - self->_keyboardSize.height;
    activeTextField = self->_activeTextField;
    -[UITextField bounds](activeTextField, "bounds");
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v30 = objc_loadWeakRetained((id *)p_scrollView);
    -[UITextField convertRect:toView:](activeTextField, "convertRect:toView:", v30, v23, v25, v27, v29);
    v32 = v31;
    v34 = v33;
    v36 = v35;
    v38 = v37;

    v40.origin.x = v13;
    v40.origin.y = v15;
    v40.size.width = v17;
    v40.size.height = v20;
    v41.origin.x = v32;
    v41.origin.y = v34;
    v41.size.width = v36;
    v41.size.height = v38;
    if (!CGRectContainsRect(v40, v41))
    {
      v39 = objc_loadWeakRetained((id *)p_scrollView);
      objc_msgSend(v39, "scrollRectToVisible:animated:", 1, v32, v34, v36, v38);

    }
  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_tableData, "count", a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  TSCellularPlanTableViewCell *v7;
  void *v8;

  v5 = a4;
  -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("TABLE_CELL_KEY"));
  v7 = (TSCellularPlanTableViewCell *)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    v7 = -[TSCellularPlanTableViewCell initWithTag:delegate:]([TSCellularPlanTableViewCell alloc], "initWithTag:delegate:", objc_msgSend(v5, "row"), self);
    -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", objc_msgSend(v5, "row"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setObject:forKeyedSubscript:", v7, CFSTR("TABLE_CELL_KEY"));

  }
  -[TSCellularPlanCardInfoViewController configureCell:atIndexPath:](self, "configureCell:atIndexPath:", v7, v5);

  return v7;
}

- (void)configureCell:(id)a3 atIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  id v15;

  v6 = a4;
  v7 = a3;
  -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", objc_msgSend(v6, "row"));
  v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("TITLE_KEY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setText:", v8);

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("PLACEHOLDER_KEY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editableTextField");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setPlaceholder:", v10);

  objc_msgSend(v15, "objectForKeyedSubscript:", CFSTR("VALUE_KEY"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "editableTextField");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setText:", v12);

  v14 = objc_msgSend(v6, "row");
  objc_msgSend(v7, "setTag:", v14);

}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  double result;

  +[TSCellularPlanTableViewCell rowHeight](TSCellularPlanTableViewCell, "rowHeight", a3, a4);
  return result;
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4;
  uint64_t v5;
  NSArray *tableData;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;

  v4 = a3;
  objc_msgSend(v4, "resignFirstResponder");
  v5 = objc_msgSend(v4, "tag");

  switch(v5)
  {
    case 2:
      -[TSCellularPlanCardInfoViewController addNewPlanWithUserInfo:](self, "addNewPlanWithUserInfo:", 0);
      break;
    case 1:
      tableData = self->_tableData;
      v7 = 2;
      goto LABEL_7;
    case 0:
      tableData = self->_tableData;
      v7 = 1;
LABEL_7:
      -[NSArray objectAtIndexedSubscript:](tableData, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("TABLE_CELL_KEY"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v9, "editableTextField");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "becomeFirstResponder");

      break;
  }
  return 1;
}

- (void)textFieldDidBeginEditing:(id)a3
{
  UITextField *v4;
  uint64_t v5;
  UITextField *activeTextField;

  v4 = (UITextField *)a3;
  if (-[UITextField tag](v4, "tag") == 2)
    v5 = 11;
  else
    v5 = 4;
  -[UITextField setReturnKeyType:](v4, "setReturnKeyType:", v5);
  activeTextField = self->_activeTextField;
  self->_activeTextField = v4;

  -[TSCellularPlanCardInfoViewController scrollViewForKeyboardIfNecessary](self, "scrollViewForKeyboardIfNecessary");
}

- (BOOL)textField:(id)a3 shouldChangeCharactersInRange:(_NSRange)a4 replacementString:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  id v9;
  id v10;
  void *v11;
  void *v12;

  length = a4.length;
  location = a4.location;
  v9 = a3;
  v10 = a5;
  if (!objc_msgSend(v9, "tag"))
  {
    objc_msgSend(v9, "text");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "stringByReplacingCharactersInRange:withString:", location, length, v10);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIBarButtonItem setEnabled:](self->_nextButton, "setEnabled:", objc_msgSend(v12, "length") != 0);
  }

  return 1;
}

- (void)textFieldDidEndEditing:(id)a3
{
  NSArray *tableData;
  id v5;
  void *v6;
  void *v7;
  UITextField *activeTextField;
  id v9;

  tableData = self->_tableData;
  v5 = a3;
  -[NSArray objectAtIndexedSubscript:](tableData, "objectAtIndexedSubscript:", objc_msgSend(v5, "tag"));
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "text");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v6, "copy");
  objc_msgSend(v9, "setObject:forKeyedSubscript:", v7, CFSTR("VALUE_KEY"));

  activeTextField = self->_activeTextField;
  self->_activeTextField = 0;

}

- (void)addNewPlanWithUserInfo:(id)a3
{
  void *v4;
  TSSIMSetupFlowDelegate **p_delegate;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  NSObject *v13;
  void *v14;
  id v15;
  int v16;
  const char *v17;
  __int16 v18;
  void *v19;
  __int16 v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  const char *v25;
  uint64_t v26;

  v26 = *MEMORY[0x24BDAC8D0];
  -[TSCellularPlanCardInfoViewController view](self, "view", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "endEditing:", 1);

  p_delegate = &self->_delegate;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "waitForResponse:", self);

  -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("VALUE_KEY"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("VALUE_KEY"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[NSArray objectAtIndexedSubscript:](self->_tableData, "objectAtIndexedSubscript:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("VALUE_KEY"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  _TSLogDomain();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    v16 = 136316162;
    v17 = "-[TSCellularPlanCardInfoViewController addNewPlanWithUserInfo:]";
    v18 = 2112;
    v19 = v8;
    v20 = 2112;
    v21 = v10;
    v22 = 2112;
    v23 = v12;
    v24 = 2080;
    v25 = "-[TSCellularPlanCardInfoViewController addNewPlanWithUserInfo:]";
    _os_log_debug_impl(&dword_21B647000, v13, OS_LOG_TYPE_DEBUG, "[Db] %s - addressField:%@, activationCode:%@, confirmationCode:%@ @%s", (uint8_t *)&v16, 0x34u);
  }

  +[TSCellularPlanManagerCache sharedInstance](TSCellularPlanManagerCache, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v14, "addNewPlanWithAddress:matchingId:confirmationCode:userConsent:completion:", v8, v10, v12, objc_msgSend(v15, "signupUserConsentResponse"), &__block_literal_global_17);

}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)onError
{
  id WeakRetained;
  id v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "receivedResponseWithVC:", self);

  -[TSCellularPlanCardInfoViewController resetFirstResponder](self, "resetFirstResponder");
  -[TSCellularPlanCardInfoViewController navigationItem](self, "navigationItem");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidesBackButton:", 0);

}

- (TSSIMSetupFlowDelegate)delegate
{
  return (TSSIMSetupFlowDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)enterActivationLabel
{
  return (UILabel *)objc_loadWeakRetained((id *)&self->_enterActivationLabel);
}

- (void)setEnterActivationLabel:(id)a3
{
  objc_storeWeak((id *)&self->_enterActivationLabel, a3);
}

- (UITableView)infoTableView
{
  return (UITableView *)objc_loadWeakRetained((id *)&self->_infoTableView);
}

- (void)setInfoTableView:(id)a3
{
  objc_storeWeak((id *)&self->_infoTableView, a3);
}

- (NSLayoutConstraint)infoTableViewHeightConstraint
{
  return (NSLayoutConstraint *)objc_loadWeakRetained((id *)&self->_infoTableViewHeightConstraint);
}

- (void)setInfoTableViewHeightConstraint:(id)a3
{
  objc_storeWeak((id *)&self->_infoTableViewHeightConstraint, a3);
}

- (UIScrollView)scrollView
{
  return (UIScrollView *)objc_loadWeakRetained((id *)&self->_scrollView);
}

- (void)setScrollView:(id)a3
{
  objc_storeWeak((id *)&self->_scrollView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_scrollView);
  objc_destroyWeak((id *)&self->_infoTableViewHeightConstraint);
  objc_destroyWeak((id *)&self->_infoTableView);
  objc_destroyWeak((id *)&self->_enterActivationLabel);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_nextButton, 0);
  objc_storeStrong((id *)&self->_activeTextField, 0);
  objc_storeStrong((id *)&self->_tableData, 0);
  objc_storeStrong((id *)&self->_fauxCardData, 0);
}

@end
