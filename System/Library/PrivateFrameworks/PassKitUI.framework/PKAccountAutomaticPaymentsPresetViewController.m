@implementation PKAccountAutomaticPaymentsPresetViewController

- (PKAccountAutomaticPaymentsPresetViewController)initWithController:(id)a3
{
  id v5;
  PKAccountAutomaticPaymentsPresetViewController *v6;
  PKAccountAutomaticPaymentsPresetViewController *v7;
  id *p_controller;
  uint64_t v9;
  PKAccount *account;
  uint64_t v11;
  NSIndexPath *selectedIndexPath;
  void *v13;
  char v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  NSArray *paymentPresets;
  uint64_t v26;
  NSIndexPath *v27;
  void *v29;
  objc_super v30;

  v5 = a3;
  v30.receiver = self;
  v30.super_class = (Class)PKAccountAutomaticPaymentsPresetViewController;
  v6 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v30, sel_initWithStyle_numberOfSections_, 1, 1);
  v7 = v6;
  if (v6)
  {
    p_controller = (id *)&v6->_controller;
    objc_storeStrong((id *)&v6->_controller, a3);
    objc_msgSend(*p_controller, "account");
    v9 = objc_claimAutoreleasedReturnValue();
    account = v7->_account;
    v7->_account = (PKAccount *)v9;

    v7->_featureIdentifier = objc_msgSend(*p_controller, "featureIdentifier");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    selectedIndexPath = v7->_selectedIndexPath;
    v7->_selectedIndexPath = (NSIndexPath *)v11;

    -[PKAccount scheduleRecurringPaymentsFeatureDescriptor](v7->_account, "scheduleRecurringPaymentsFeatureDescriptor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "paymentPresets");
    v29 = v13;
    v15 = objc_msgSend(v13, "paymentFrequencies");
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = v16;
    if ((v14 & 4) != 0)
      objc_msgSend(v16, "addObject:", &unk_1E3FAD648);
    if ((v14 & 2) != 0)
      objc_msgSend(v17, "addObject:", &unk_1E3FAD660);
    -[PKAccount creditDetails](v7->_account, "creditDetails");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "accountSummary");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v19, "creditLimit");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    if (v20)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v21 = v5;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v23 = objc_msgSend(v22, "compare:", v20);

      v5 = v21;
      if ((v14 & 1) != 0 && v15 && v23 == -1)
        objc_msgSend(v17, "addObject:", &unk_1E3FAD678);
    }
    v24 = objc_msgSend(v17, "copy");
    paymentPresets = v7->_paymentPresets;
    v7->_paymentPresets = (NSArray *)v24;

    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", -[NSArray indexOfObject:](v7->_paymentPresets, "indexOfObject:", &unk_1E3FAD648), 0);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = v7->_selectedIndexPath;
    v7->_selectedIndexPath = (NSIndexPath *)v26;

    -[PKSectionTableViewController setSkipSetupForReadableContentGuide:](v7, "setSkipSetupForReadableContentGuide:", 1);
  }

  return v7;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PKAccountAutomaticPaymentsPresetViewController;
  -[PKSectionTableViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PKAccountAutomaticPaymentsPresetViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("paymentPresetCellReuseIdentifier"));
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[PKAccountAutomaticPaymentsPresetViewController tableHeaderView](self, "tableHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTableHeaderView:", v4);

  objc_msgSend(v3, "selectRowAtIndexPath:animated:scrollPosition:", self->_selectedIndexPath, 0, 0);
  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedPaymentString(CFSTR("NEXT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, self, sel__handleNext_);

  objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D98]);
  -[PKAccountAutomaticPaymentsPresetViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);
  -[PKAccountAutomaticPaymentsPresetViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678F0]);

}

- (id)tableHeaderView
{
  PKTableHeaderView *tableHeaderView;
  void *v4;
  void *v5;
  PKTableHeaderView *v6;
  PKTableHeaderView *v7;
  PKTableHeaderView *v8;
  void *v9;
  void *v10;
  PKTableHeaderView *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect v18;

  tableHeaderView = self->_tableHeaderView;
  if (!tableHeaderView)
  {
    PKLocalizedFeatureString();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = [PKTableHeaderView alloc];
    v7 = -[PKTableHeaderView initWithFrame:](v6, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v8 = self->_tableHeaderView;
    self->_tableHeaderView = v7;

    -[PKTableHeaderView titleLabel](self->_tableHeaderView, "titleLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v4);

    -[PKTableHeaderView subtitleLabel](self->_tableHeaderView, "subtitleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setText:", v5);

    -[PKTableHeaderView setTopPadding:](self->_tableHeaderView, "setTopPadding:", 5.0);
    -[PKTableHeaderView setBottomPadding:](self->_tableHeaderView, "setBottomPadding:", 60.0);
    v11 = self->_tableHeaderView;
    -[PKAccountAutomaticPaymentsPresetViewController tableView](self, "tableView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    -[PKTableHeaderView sizeThatFits:](v11, "sizeThatFits:", CGRectGetWidth(v18), 3.40282347e38);
    v14 = v13;
    v16 = v15;

    -[PKTableHeaderView setFrame:](self->_tableHeaderView, "setFrame:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), v14, v16);
    tableHeaderView = self->_tableHeaderView;
  }
  return tableHeaderView;
}

- (void)_handleNext:(id)a3
{
  void *v4;
  uint64_t v5;

  -[NSArray objectAtIndex:](self->_paymentPresets, "objectAtIndex:", -[NSIndexPath row](self->_selectedIndexPath, "row", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "integerValue");

  -[PKAccountAutomaticPaymentsController setPaymentPreset:](self->_controller, "setPaymentPreset:", v5);
  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[PKAccountAutomaticPaymentsController setPaymentFrequency:](self->_controller, "setPaymentFrequency:", 7);
    -[PKAccountAutomaticPaymentsController setPaymentDate:](self->_controller, "setPaymentDate:", 0);
    -[PKAccountAutomaticPaymentsController setAmount:](self->_controller, "setAmount:", 0);
  }
  -[PKAccountAutomaticPaymentsController presentNextViewControllerFromViewController:](self->_controller, "presentNextViewControllerFromViewController:", self);
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return 1;
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  return -[NSArray count](self->_paymentPresets, "count", a3, a4);
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  NSIndexPath **p_selectedIndexPath;
  id v8;

  v8 = a3;
  v6 = a4;
  p_selectedIndexPath = &self->_selectedIndexPath;
  if ((objc_msgSend(v6, "isEqual:", *p_selectedIndexPath) & 1) == 0)
  {
    objc_storeStrong((id *)p_selectedIndexPath, a4);
    objc_msgSend(v8, "reloadData");
  }
  objc_msgSend(v8, "deselectRowAtIndexPath:animated:", v6, 1);

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  int v8;
  void *v9;
  uint64_t v10;
  unint64_t v11;
  uint64_t v12;
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
  _QWORD *v24;
  id v26;
  int v27;
  void *v28;

  v6 = a3;
  v7 = a4;
  v8 = objc_msgSend(v7, "isEqual:", self->_selectedIndexPath);
  -[NSArray objectAtIndex:](self->_paymentPresets, "objectAtIndex:", objc_msgSend(v7, "row"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  v11 = v10 - 1;
  v27 = v8;
  if ((unint64_t)(v10 - 1) > 2)
  {
    v13 = 0;
    v12 = 0;
  }
  else
  {
    PKLocalizedFeatureString();
    v12 = objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("paymentPresetCellReuseIdentifier"), v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = (void *)v12;
  objc_msgSend(v15, "setText:", v12);
  objc_msgSend(v15, "setSecondaryText:", v13);
  objc_msgSend(v14, "setMinimumHeight:", 60.0);
  objc_msgSend(v15, "textProperties");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setFont:", v17);

  objc_msgSend(v15, "secondaryTextProperties");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setFont:", v19);

  objc_msgSend(v18, "setNumberOfLines:", 0);
  objc_msgSend(v14, "setContentConfiguration:", v15);
  objc_msgSend(v14, "accessoryView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v20)
  {
    objc_msgSend(v14, "traitCollection");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    PKUICellAccessoryCheckmarkConfiguration(v21);
    v26 = v6;
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v23);
    objc_msgSend(v14, "setAccessoryView:", v20);

    v6 = v26;
  }
  objc_msgSend(v20, "setHidden:", v27 ^ 1u);
  objc_msgSend(v14, "setSelectionStyle:", 0);
  if (v11 > 2)
    v24 = (_QWORD *)MEMORY[0x1E0D68188];
  else
    v24 = (_QWORD *)qword_1E3E6F7B8[v11];
  objc_msgSend(v14, "setAccessibilityIdentifier:", *v24);

  return v14;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  void *v9;
  int v10;
  void *v12;

  -[NSArray objectAtIndex:](self->_paymentPresets, "objectAtIndex:", -[NSIndexPath row](self->_selectedIndexPath, "row", a3, a4));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "integerValue");

  v7 = v6 & 0xFFFFFFFFFFFFFFFELL;
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "installmentPlans");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pk_hasObjectPassingTest:", &__block_literal_global_123);

  if (v7 != 2 || v10 == 0)
  {
    v12 = 0;
  }
  else
  {
    PKLocalizedFeatureString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v12;
}

uint64_t __84__PKAccountAutomaticPaymentsPresetViewController_tableView_titleForFooterInSection___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isComplete") ^ 1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_paymentPresets, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
