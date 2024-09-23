@implementation PKAccountAutomaticPaymentsDateViewController

- (PKAccountAutomaticPaymentsDateViewController)initWithController:(id)a3
{
  id v5;
  PKAccountAutomaticPaymentsDateViewController *v6;
  PKAccountAutomaticPaymentsDateViewController *v7;
  id *p_controller;
  uint64_t v9;
  PKAccount *account;
  void *v11;
  uint64_t v12;
  NSTimeZone *productTimeZone;
  uint64_t v14;
  NSIndexPath *selectedIndexPath;
  NSDate *date;
  PKMonthDayCollectionViewController *v17;
  PKMonthDayCollectionViewController *monthDayCollectionViewController;
  id v19;
  uint64_t v20;
  NSCalendar *productCalendar;
  NSCalendar *v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  NSDateFormatter *v27;
  NSDateFormatter *cardinalDayDateFormatter;
  void *v29;
  void *v30;
  PKAccountAutomaticPaymentsDateFooterView *v31;
  PKAccountAutomaticPaymentsDateFooterView *collectionFooterView;
  objc_super v34;

  v5 = a3;
  v34.receiver = self;
  v34.super_class = (Class)PKAccountAutomaticPaymentsDateViewController;
  v6 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v34, sel_initWithStyle_numberOfSections_, 1, 1);
  v7 = v6;
  if (v6)
  {
    p_controller = (id *)&v6->_controller;
    objc_storeStrong((id *)&v6->_controller, a3);
    objc_msgSend(*p_controller, "account");
    v9 = objc_claimAutoreleasedReturnValue();
    account = v7->_account;
    v7->_account = (PKAccount *)v9;

    -[PKAccount creditDetails](v7->_account, "creditDetails");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "productTimeZone");
    v12 = objc_claimAutoreleasedReturnValue();
    productTimeZone = v7->_productTimeZone;
    v7->_productTimeZone = (NSTimeZone *)v12;

    v7->_featureIdentifier = objc_msgSend(*p_controller, "featureIdentifier");
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", 0, 0);
    v14 = objc_claimAutoreleasedReturnValue();
    selectedIndexPath = v7->_selectedIndexPath;
    v7->_selectedIndexPath = (NSIndexPath *)v14;

    date = v7->_date;
    v7->_date = 0;

    v17 = -[PKMonthDayCollectionViewController initWithDayDelegate:timeZone:]([PKMonthDayCollectionViewController alloc], "initWithDayDelegate:timeZone:", v7, v7->_productTimeZone);
    monthDayCollectionViewController = v7->_monthDayCollectionViewController;
    v7->_monthDayCollectionViewController = v17;

    v19 = objc_alloc(MEMORY[0x1E0C99D48]);
    v20 = objc_msgSend(v19, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    productCalendar = v7->_productCalendar;
    v7->_productCalendar = (NSCalendar *)v20;

    -[NSCalendar setTimeZone:](v7->_productCalendar, "setTimeZone:", v7->_productTimeZone);
    v22 = v7->_productCalendar;
    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = -[NSCalendar component:fromDate:](v22, "component:fromDate:", 16, v23);

    v25 = objc_msgSend(*p_controller, "minimumPaymentDayForPreset:", 3);
    -[PKMonthDayCollectionViewController setMinimumDayNumber:](v7->_monthDayCollectionViewController, "setMinimumDayNumber:", v25);
    if (v25 <= v24)
      v26 = v24;
    else
      v26 = v25;
    -[PKMonthDayCollectionViewController setDayNumber:](v7->_monthDayCollectionViewController, "setDayNumber:", v26);
    v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    cardinalDayDateFormatter = v7->_cardinalDayDateFormatter;
    v7->_cardinalDayDateFormatter = v27;

    -[NSDateFormatter setTimeZone:](v7->_cardinalDayDateFormatter, "setTimeZone:", v7->_productTimeZone);
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v7->_cardinalDayDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("d"));
    PKLocalizedFeatureString();
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = v29;
    if (v29)
      LOBYTE(v29) = objc_msgSend(v29, "isEqualToString:", CFSTR("1"));
    v7->_useOrdinalDay = (char)v29;
    v31 = objc_alloc_init(PKAccountAutomaticPaymentsDateFooterView);
    collectionFooterView = v7->_collectionFooterView;
    v7->_collectionFooterView = v31;

    -[PKAccountAutomaticPaymentsDateFooterView setAccessibilityIdentifier:](v7->_collectionFooterView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C18]);
    -[PKAccountAutomaticPaymentsDateFooterView setCollectionViewController:](v7->_collectionFooterView, "setCollectionViewController:", v7->_monthDayCollectionViewController);
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
  v10.super_class = (Class)PKAccountAutomaticPaymentsDateViewController;
  -[PKSectionTableViewController viewDidLoad](&v10, sel_viewDidLoad);
  -[PKAccountAutomaticPaymentsDateViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("dateCellReuseIdentifier"));
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  -[PKAccountAutomaticPaymentsDateViewController tableHeaderView](self, "tableHeaderView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTableHeaderView:", v4);

  objc_msgSend(v3, "selectRowAtIndexPath:animated:scrollPosition:", self->_selectedIndexPath, 0, 0);
  v5 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedPaymentString(CFSTR("NEXT"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v5, "initWithTitle:style:target:action:", v6, 2, self, sel__handleNext_);

  objc_msgSend(v7, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67D98]);
  -[PKAccountAutomaticPaymentsDateViewController navigationItem](self, "navigationItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setRightBarButtonItem:", v7);
  -[PKAccountAutomaticPaymentsDateViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678E8]);

}

- (void)viewWillLayoutSubviews
{
  PKAccountAutomaticPaymentsDateFooterView *collectionFooterView;
  PKMonthDayCollectionViewController *monthDayCollectionViewController;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)PKAccountAutomaticPaymentsDateViewController;
  -[PKAccountAutomaticPaymentsDateViewController viewWillLayoutSubviews](&v16, sel_viewWillLayoutSubviews);
  collectionFooterView = self->_collectionFooterView;
  if (-[PKAccountAutomaticPaymentsDateViewController _shouldShowCollectionView](self, "_shouldShowCollectionView"))
    monthDayCollectionViewController = self->_monthDayCollectionViewController;
  else
    monthDayCollectionViewController = 0;
  -[PKAccountAutomaticPaymentsDateFooterView setCollectionViewController:](collectionFooterView, "setCollectionViewController:", monthDayCollectionViewController);
  -[PKAccountAutomaticPaymentsDateFooterView textLabel](self->_collectionFooterView, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountAutomaticPaymentsDateViewController _footerText](self, "_footerText");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v6);

  -[PKAccountAutomaticPaymentsDateViewController tableView](self, "tableView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v9 = v8;

  -[PKAccountAutomaticPaymentsDateFooterView frame](self->_collectionFooterView, "frame");
  v11 = v10;
  v13 = v12;
  -[PKAccountAutomaticPaymentsDateFooterView sizeThatFits:](self->_collectionFooterView, "sizeThatFits:", v9, 0.0);
  -[PKAccountAutomaticPaymentsDateFooterView setFrame:](self->_collectionFooterView, "setFrame:", v11, v13, v14, v15);
  -[PKAccountAutomaticPaymentsDateFooterView layoutIfNeeded](self->_collectionFooterView, "layoutIfNeeded");
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
    -[PKAccountAutomaticPaymentsDateViewController tableView](self, "tableView");
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
  -[PKAccountAutomaticPaymentsController setPaymentFrequency:](self->_controller, "setPaymentFrequency:", -[PKAccountAutomaticPaymentsDateViewController _frequency](self, "_frequency", a3));
  -[PKAccountAutomaticPaymentsController setPaymentDate:](self->_controller, "setPaymentDate:", self->_date);
  -[PKAccountAutomaticPaymentsController setScheduledDay:](self->_controller, "setScheduledDay:", self->_scheduledDay);
  -[PKAccountAutomaticPaymentsController setAmount:](self->_controller, "setAmount:", 0);
  -[PKAccountAutomaticPaymentsDateViewController _handlePresentPayment](self, "_handlePresentPayment");
}

- (int64_t)_frequency
{
  if (-[NSIndexPath row](self->_selectedIndexPath, "row"))
    return 6;
  else
    return 7;
}

- (BOOL)_shouldShowCollectionView
{
  return -[PKAccountAutomaticPaymentsDateViewController _frequency](self, "_frequency") == 6;
}

- (void)_handlePresentPayment
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void (*v9)(uint64_t);
  void *v10;
  id v11;
  id location;

  -[PKAccountAutomaticPaymentsController alertControllerForScheduledDate:](self->_controller, "alertControllerForScheduledDate:", self->_date);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_initWeak(&location, self);
    v4 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = MEMORY[0x1E0C809B0];
    v8 = 3221225472;
    v9 = __69__PKAccountAutomaticPaymentsDateViewController__handlePresentPayment__block_invoke;
    v10 = &unk_1E3E63F88;
    objc_copyWeak(&v11, &location);
    objc_msgSend(v4, "actionWithTitle:style:handler:", v5, 0, &v7);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addAction:", v6, v7, v8, v9, v10);

    -[PKAccountAutomaticPaymentsDateViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v3, 1, 0);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKAccountAutomaticPaymentsDateViewController _performPresentPayment](self, "_performPresentPayment");
  }

}

void __69__PKAccountAutomaticPaymentsDateViewController__handlePresentPayment__block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_performPresentPayment");
    WeakRetained = v2;
  }

}

- (void)_performPresentPayment
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;

  -[PKAccountAutomaticPaymentsController fundingSources](self->_controller, "fundingSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PKAccountAutomaticPaymentsController performScheduleAutomaticPaymentsFromViewController:](self->_controller, "performScheduleAutomaticPaymentsFromViewController:", self);
  }
  else
  {
    -[PKAccountAutomaticPaymentsDateViewController navigationController](self, "navigationController");
    v6 = (id)objc_claimAutoreleasedReturnValue();
    -[PKAccountAutomaticPaymentsDateViewController _addBankAccountInformationViewController](self, "_addBankAccountInformationViewController");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v5, 1, 0);

  }
}

- (void)_updateNextButtonEnabledIfNecessary
{
  _BOOL8 v3;
  void *v4;
  id v5;

  v3 = -[PKAccountAutomaticPaymentsController canPerformScheduleAutomaticPaymentsWithPreset:frequency:amount:paymentDate:](self->_controller, "canPerformScheduleAutomaticPaymentsWithPreset:frequency:amount:paymentDate:", 3, -[PKAccountAutomaticPaymentsDateViewController _frequency](self, "_frequency"), 0, self->_date);
  -[PKAccountAutomaticPaymentsDateViewController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "rightBarButtonItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

}

- (id)_footerText
{
  void *v3;
  void *v4;
  NSCalendar *productCalendar;
  void *v6;
  void *v7;

  if (-[PKAccountAutomaticPaymentsDateViewController _frequency](self, "_frequency") == 7)
  {
    v3 = 0;
  }
  else
  {
    if (self->_useOrdinalDay)
    {
      PKOrdinalStringForInteger();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      productCalendar = self->_productCalendar;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCalendar nextDateAfterDate:matchingUnit:value:options:](productCalendar, "nextDateAfterDate:matchingUnit:value:options:", v6, 16, self->_scheduledDay, 2);
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSDateFormatter stringFromDate:](self->_cardinalDayDateFormatter, "stringFromDate:", v7);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

    }
    PKLocalizedFeatureString();
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v3;
}

- (void)monthDaySelectionViewController:(id)a3 didSelectDate:(id)a4 day:(int64_t)a5
{
  NSDate *v7;
  NSDate *date;
  void *v9;
  id v10;

  v10 = a4;
  if (-[PKAccountAutomaticPaymentsDateViewController _shouldShowCollectionView](self, "_shouldShowCollectionView"))
  {
    -[PKAccountAutomaticPaymentsController firstAutomaticPaymentDateForSelectedDate:](self->_controller, "firstAutomaticPaymentDateForSelectedDate:", v10);
    v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
    date = self->_date;
    self->_date = v7;

    self->_scheduledDay = a5;
    -[PKAccountAutomaticPaymentsDateViewController tableView](self, "tableView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "reloadData");

    -[PKAccountAutomaticPaymentsDateViewController _updateNextButtonEnabledIfNecessary](self, "_updateNextButtonEnabledIfNecessary");
  }

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
  return 2;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  PKAccountAutomaticPaymentsController *controller;
  void *v8;
  NSDate *v9;
  NSDate *date;
  NSDate *v11;
  id v12;

  v12 = a3;
  v6 = a4;
  if ((objc_msgSend(v6, "isEqual:", self->_selectedIndexPath) & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedIndexPath, a4);
    objc_msgSend(v12, "reloadData");
    if (-[PKAccountAutomaticPaymentsDateViewController _shouldShowCollectionView](self, "_shouldShowCollectionView"))
    {
      controller = self->_controller;
      -[PKMonthDayCollectionViewController selectedDate](self->_monthDayCollectionViewController, "selectedDate");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountAutomaticPaymentsController firstAutomaticPaymentDateForSelectedDate:](controller, "firstAutomaticPaymentDateForSelectedDate:", v8);
      v9 = (NSDate *)objc_claimAutoreleasedReturnValue();
      date = self->_date;
      self->_date = v9;

      self->_scheduledDay = -[PKMonthDayCollectionViewController dayNumber](self->_monthDayCollectionViewController, "dayNumber");
    }
    else
    {
      v11 = self->_date;
      self->_date = 0;

    }
  }
  objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v6, 1);
  -[PKAccountAutomaticPaymentsDateViewController _updateNextButtonEnabledIfNecessary](self, "_updateNextButtonEnabledIfNecessary");

}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  NSIndexPath *selectedIndexPath;
  id v6;
  id v7;
  int v8;
  uint64_t v9;
  void *v10;
  _QWORD *v11;
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

  selectedIndexPath = self->_selectedIndexPath;
  v6 = a4;
  v7 = a3;
  v8 = objc_msgSend(v6, "isEqual:", selectedIndexPath);
  v9 = objc_msgSend(v6, "row");
  objc_msgSend(v7, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("dateCellReuseIdentifier"), v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    v11 = (_QWORD *)MEMORY[0x1E0D67B18];
    goto LABEL_5;
  }
  if (v9 == 1)
  {
    v11 = (_QWORD *)MEMORY[0x1E0D67DB8];
LABEL_5:
    PKLocalizedFeatureString();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    PKLocalizedFeatureString();
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setAccessibilityIdentifier:", *v11);
    goto LABEL_7;
  }
  v13 = 0;
  v12 = 0;
LABEL_7:
  objc_msgSend(MEMORY[0x1E0DC39A8], "subtitleCellConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setText:", v12);
  objc_msgSend(v14, "setSecondaryText:", v13);
  objc_msgSend(v10, "setMinimumHeight:", 60.0);
  objc_msgSend(v14, "textProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v16);

  objc_msgSend(v14, "secondaryTextProperties");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setFont:", v18);

  objc_msgSend(v17, "setNumberOfLines:", 0);
  objc_msgSend(v10, "setContentConfiguration:", v14);
  objc_msgSend(v10, "accessoryView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v19)
  {
    objc_msgSend(v10, "traitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    PKUICellAccessoryCheckmarkConfiguration(v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("checkmark"), v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", v22);
    objc_msgSend(v10, "setAccessoryView:", v19);

  }
  objc_msgSend(v19, "setHidden:", v8 ^ 1u);
  objc_msgSend(v10, "setSelectionStyle:", 0);

  return v10;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return self->_collectionFooterView;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)_addBankAccountInformationViewController
{
  void *v3;
  void *v4;
  void *v5;
  PKAddBankAccountInformationViewController *v6;
  void *v7;
  PKNavigationController *v8;

  -[PKAccount creditDetails](self->_account, "creditDetails");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "countryCode");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D66BC8]), "initWithType:", 1);
  v6 = -[PKAddBankAccountInformationViewController initWithDelegate:bankInformation:accountCountryCode:featureAccount:]([PKAddBankAccountInformationViewController alloc], "initWithDelegate:bankInformation:accountCountryCode:featureAccount:", self, v5, v4, self->_account);
  -[PKAccountAutomaticPaymentsController fundingSources](self->_controller, "fundingSources");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAddBankAccountInformationViewController setOfferKeychainPreFill:](v6, "setOfferKeychainPreFill:", objc_msgSend(v7, "count") == 0);

  v8 = -[PKNavigationController initWithRootViewController:]([PKNavigationController alloc], "initWithRootViewController:", v6);
  -[PKNavigationController setSupportedInterfaceOrientations:](v8, "setSupportedInterfaceOrientations:", 2);
  if (-[UIViewController pkui_userInterfaceIdiomSupportsLargeLayouts](self, "pkui_userInterfaceIdiomSupportsLargeLayouts"))
  {
    -[PKNavigationController setModalPresentationStyle:](v8, "setModalPresentationStyle:", 2);
  }

  return v8;
}

- (void)addBankAccountInformationViewController:(id)a3 didAddFundingSource:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __108__PKAccountAutomaticPaymentsDateViewController_addBankAccountInformationViewController_didAddFundingSource___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __108__PKAccountAutomaticPaymentsDateViewController_addBankAccountInformationViewController_didAddFundingSource___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 1096);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFundingSources:", v2);

}

- (void)addBankAccountInformationViewControllerDidFinish:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[PKAccountAutomaticPaymentsDateViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __97__PKAccountAutomaticPaymentsDateViewController_addBankAccountInformationViewControllerDidFinish___block_invoke;
  v5[3] = &unk_1E3E612E8;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

void __97__PKAccountAutomaticPaymentsDateViewController_addBankAccountInformationViewControllerDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1096), "fundingSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_performPresentPayment");
}

- (void)addBankAccountInformationViewController:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKAccountAutomaticPaymentsDateViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __105__PKAccountAutomaticPaymentsDateViewController_addBankAccountInformationViewController_didFailWithError___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __105__PKAccountAutomaticPaymentsDateViewController_addBankAccountInformationViewController_didFailWithError___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1104), "feature"), 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v2, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_productCalendar, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_collectionFooterView, 0);
  objc_storeStrong((id *)&self->_cardinalDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_monthDayCollectionViewController, 0);
  objc_storeStrong((id *)&self->_selectedIndexPath, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_controller, 0);
  objc_storeStrong((id *)&self->_date, 0);
}

@end
