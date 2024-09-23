@implementation PKAccountAutomaticPaymentsConfigurationViewController

- (PKAccountAutomaticPaymentsConfigurationViewController)initWithController:(id)a3
{
  id v5;
  PKAccountAutomaticPaymentsConfigurationViewController *v6;
  PKAccountAutomaticPaymentsConfigurationViewController *v7;
  id *p_controller;
  uint64_t v9;
  PKAccount *account;
  void *v11;
  uint64_t v12;
  NSTimeZone *productTimeZone;
  id v14;
  uint64_t v15;
  NSCalendar *productCalendar;
  void *v17;
  void *v18;
  uint64_t v19;
  NSNumberFormatter *currencyFormatter;
  NSDateFormatter *v21;
  NSDateFormatter *modelDateFormatter;
  NSDateFormatter *v23;
  NSDateFormatter *pickerDateFormatter;
  NSDateFormatter *v25;
  NSDateFormatter *cellDateFormatter;
  NSDateFormatter *v27;
  NSDateFormatter *dayNameFormatter;
  NSDateFormatter *v29;
  NSDateFormatter *cardinalDayDateFormatter;
  void *v31;
  void *v32;
  uint64_t v33;
  NSArray *amounts;
  unint64_t v35;
  NSArray *v36;
  uint64_t v37;
  NSNumber *v38;
  void *selectedFrequency;
  uint64_t v40;
  NSNumber *v41;
  uint64_t v42;
  NSNumber *selectedAmount;
  PKMonthDayCollectionViewController *v44;
  PKMonthDayCollectionViewController *monthDayCollectionViewController;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  NSDate *selectedDate;
  PKAccountAutomaticPaymentsDateFooterView *v52;
  PKAccountAutomaticPaymentsDateFooterView *footerView;
  objc_super v55;

  v5 = a3;
  v55.receiver = self;
  v55.super_class = (Class)PKAccountAutomaticPaymentsConfigurationViewController;
  v6 = -[PKSectionTableViewController initWithStyle:numberOfSections:](&v55, sel_initWithStyle_numberOfSections_, 1, 1);
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

    v14 = objc_alloc(MEMORY[0x1E0C99D48]);
    v15 = objc_msgSend(v14, "initWithCalendarIdentifier:", *MEMORY[0x1E0C996C8]);
    productCalendar = v7->_productCalendar;
    v7->_productCalendar = (NSCalendar *)v15;

    -[NSCalendar setTimeZone:](v7->_productCalendar, "setTimeZone:", v7->_productTimeZone);
    v7->_featureIdentifier = objc_msgSend(*p_controller, "featureIdentifier");
    -[PKAccount creditDetails](v7->_account, "creditDetails");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "currencyCode");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    PKMutableNumberFormatterForCurrencyCode();
    v19 = objc_claimAutoreleasedReturnValue();
    currencyFormatter = v7->_currencyFormatter;
    v7->_currencyFormatter = (NSNumberFormatter *)v19;

    -[NSNumberFormatter setMinimumFractionDigits:](v7->_currencyFormatter, "setMinimumFractionDigits:", 0);
    v21 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    modelDateFormatter = v7->_modelDateFormatter;
    v7->_modelDateFormatter = v21;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v7->_modelDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("yyyy-MM-dd"));
    -[NSDateFormatter setTimeZone:](v7->_modelDateFormatter, "setTimeZone:", v7->_productTimeZone);
    v23 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    pickerDateFormatter = v7->_pickerDateFormatter;
    v7->_pickerDateFormatter = v23;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v7->_pickerDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEE, MMMM d"));
    -[NSDateFormatter setFormattingContext:](v7->_pickerDateFormatter, "setFormattingContext:", 2);
    -[NSDateFormatter setTimeZone:](v7->_pickerDateFormatter, "setTimeZone:", v7->_productTimeZone);
    v25 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    cellDateFormatter = v7->_cellDateFormatter;
    v7->_cellDateFormatter = v25;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v7->_cellDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMMM d, yyyy"));
    -[NSDateFormatter setTimeZone:](v7->_cellDateFormatter, "setTimeZone:", v7->_productTimeZone);
    v27 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dayNameFormatter = v7->_dayNameFormatter;
    v7->_dayNameFormatter = v27;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v7->_dayNameFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("EEEE"));
    -[NSDateFormatter setTimeZone:](v7->_dayNameFormatter, "setTimeZone:", v7->_productTimeZone);
    v29 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    cardinalDayDateFormatter = v7->_cardinalDayDateFormatter;
    v7->_cardinalDayDateFormatter = v29;

    -[NSDateFormatter setTimeZone:](v7->_cardinalDayDateFormatter, "setTimeZone:", v7->_productTimeZone);
    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v7->_cardinalDayDateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("d"));
    PKLocalizedFeatureString();
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = v31;
    if (v31)
      LOBYTE(v31) = objc_msgSend(v31, "isEqualToString:", CFSTR("1"));
    v7->_useOrdinalDay = (char)v31;
    -[PKAccountAutomaticPaymentsConfigurationViewController _amounts](v7, "_amounts");
    v33 = objc_claimAutoreleasedReturnValue();
    amounts = v7->_amounts;
    v7->_amounts = (NSArray *)v33;

    v35 = -[NSArray count](v7->_amounts, "count");
    v36 = v7->_amounts;
    if (v35 < 2)
    {
      -[NSArray firstObject](v36, "firstObject");
      v42 = objc_claimAutoreleasedReturnValue();
      selectedAmount = v7->_selectedAmount;
      v7->_selectedAmount = (NSNumber *)v42;

      selectedFrequency = v7->_selectedFrequency;
      v7->_selectedFrequency = (NSNumber *)&unk_1E3FADDE0;
    }
    else
    {
      -[NSArray objectAtIndex:](v36, "objectAtIndex:", 0);
      v37 = objc_claimAutoreleasedReturnValue();
      v38 = v7->_selectedAmount;
      v7->_selectedAmount = (NSNumber *)v37;

      -[PKAccountAutomaticPaymentsConfigurationViewController _frequencies](v7, "_frequencies");
      selectedFrequency = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(selectedFrequency, "firstObject");
      v40 = objc_claimAutoreleasedReturnValue();
      v41 = v7->_selectedFrequency;
      v7->_selectedFrequency = (NSNumber *)v40;

    }
    v44 = -[PKMonthDayCollectionViewController initWithDayDelegate:timeZone:]([PKMonthDayCollectionViewController alloc], "initWithDayDelegate:timeZone:", v7, v7->_productTimeZone);
    monthDayCollectionViewController = v7->_monthDayCollectionViewController;
    v7->_monthDayCollectionViewController = v44;

    objc_msgSend(MEMORY[0x1E0C99D68], "date");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = -[NSCalendar component:fromDate:](v7->_productCalendar, "component:fromDate:", 16, v46);
    v48 = objc_msgSend(*p_controller, "minimumPaymentDayForPreset:", -[PKAccountAutomaticPaymentsConfigurationViewController _preset](v7, "_preset"));
    -[PKMonthDayCollectionViewController setMinimumDayNumber:](v7->_monthDayCollectionViewController, "setMinimumDayNumber:", v48);
    if (v48 <= v47)
      v49 = v47;
    else
      v49 = v48;
    -[PKMonthDayCollectionViewController setDayNumber:](v7->_monthDayCollectionViewController, "setDayNumber:", v49);
    -[PKMonthDayCollectionViewController selectedDate](v7->_monthDayCollectionViewController, "selectedDate");
    v50 = objc_claimAutoreleasedReturnValue();
    selectedDate = v7->_selectedDate;
    v7->_selectedDate = (NSDate *)v50;

    -[PKAccountAutomaticPaymentsConfigurationViewController _updateDates](v7, "_updateDates");
    v52 = objc_alloc_init(PKAccountAutomaticPaymentsDateFooterView);
    footerView = v7->_footerView;
    v7->_footerView = v52;

    -[PKAccountAutomaticPaymentsDateFooterView setAccessibilityIdentifier:](v7->_footerView, "setAccessibilityIdentifier:", *MEMORY[0x1E0D67C18]);
    -[PKSectionTableViewController setSkipSetupForReadableContentGuide:](v7, "setSkipSetupForReadableContentGuide:", 1);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)PKAccountAutomaticPaymentsConfigurationViewController;
  -[PKSectionTableViewController dealloc](&v4, sel_dealloc);
}

- (void)viewDidLoad
{
  void *v3;
  PKFixedAmountWrapperView *v4;
  PKFixedAmountWrapperView *wrapperView;
  PKFixedAmountWrapperView *v6;
  void *v7;
  UIPickerView *v8;
  UIPickerView *amountPicker;
  NSUInteger v10;
  UIPickerView *v11;
  UIPickerView *frequencyPicker;
  NSUInteger v13;
  UIPickerView *v14;
  UIPickerView *datePicker;
  NSUInteger v16;
  double v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  objc_super v24;

  v24.receiver = self;
  v24.super_class = (Class)PKAccountAutomaticPaymentsConfigurationViewController;
  -[PKSectionTableViewController viewDidLoad](&v24, sel_viewDidLoad);
  -[PKAccountAutomaticPaymentsConfigurationViewController tableView](self, "tableView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_alloc_init(PKFixedAmountWrapperView);
  wrapperView = self->_wrapperView;
  self->_wrapperView = v4;

  -[PKAccountAutomaticPaymentsConfigurationViewController setView:](self, "setView:", self->_wrapperView);
  -[PKFixedAmountWrapperView setTableView:](self->_wrapperView, "setTableView:", v3);
  v6 = self->_wrapperView;
  objc_msgSend(v3, "backgroundColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKFixedAmountWrapperView setBackgroundColor:](v6, "setBackgroundColor:", v7);

  v8 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
  amountPicker = self->_amountPicker;
  self->_amountPicker = v8;

  -[UIPickerView setDelegate:](self->_amountPicker, "setDelegate:", self);
  v10 = -[NSArray indexOfObject:](self->_amounts, "indexOfObject:", self->_selectedAmount);
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
    -[UIPickerView selectRow:inComponent:animated:](self->_amountPicker, "selectRow:inComponent:animated:", v10, 0, 0);
  -[PKFixedAmountWrapperView setPickerView:](self->_wrapperView, "setPickerView:", self->_amountPicker);
  self->_selectedRowType = 1;
  v11 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
  frequencyPicker = self->_frequencyPicker;
  self->_frequencyPicker = v11;

  -[UIPickerView setDelegate:](self->_frequencyPicker, "setDelegate:", self);
  v13 = -[NSArray indexOfObject:](self->_frequencies, "indexOfObject:", self->_selectedFrequency);
  if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    -[UIPickerView selectRow:inComponent:animated:](self->_frequencyPicker, "selectRow:inComponent:animated:", v13, 0, 0);
  v14 = (UIPickerView *)objc_alloc_init(MEMORY[0x1E0DC3AE0]);
  datePicker = self->_datePicker;
  self->_datePicker = v14;

  -[UIPickerView setDelegate:](self->_datePicker, "setDelegate:", self);
  v16 = -[NSArray indexOfObject:](self->_dates, "indexOfObject:", self->_selectedDate);
  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
    -[UIPickerView selectRow:inComponent:animated:](self->_datePicker, "selectRow:inComponent:animated:", v16, 0, 0);
  objc_msgSend(v3, "registerClass:forCellReuseIdentifier:", objc_opt_class(), CFSTR("configurationCellReuseIdentifier"));
  v17 = *MEMORY[0x1E0DC53D8];
  objc_msgSend(v3, "setRowHeight:", *MEMORY[0x1E0DC53D8]);
  objc_msgSend(v3, "setEstimatedRowHeight:", 60.0);
  -[PKAccountAutomaticPaymentsConfigurationViewController tableHeaderView](self, "tableHeaderView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setTableHeaderView:", v18);

  objc_msgSend(v3, "setRowHeight:", v17);
  v19 = objc_alloc(MEMORY[0x1E0DC34F0]);
  PKLocalizedPaymentString(CFSTR("NEXT"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = (void *)objc_msgSend(v19, "initWithTitle:style:target:action:", v20, 2, self, sel_handleNextButtonTapped_);

  -[PKAccountAutomaticPaymentsConfigurationViewController navigationItem](self, "navigationItem");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setRightBarButtonItem:", v21);

  -[PKAccountAutomaticPaymentsConfigurationViewController _updateNextButtonEnabledIfNecessary](self, "_updateNextButtonEnabledIfNecessary");
  -[PKAccountAutomaticPaymentsConfigurationViewController view](self, "view");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAccessibilityIdentifier:", *MEMORY[0x1E0D678E0]);

}

- (id)tableView
{
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)PKAccountAutomaticPaymentsConfigurationViewController;
  -[PKAccountAutomaticPaymentsConfigurationViewController tableView](&v5, sel_tableView);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[PKFixedAmountWrapperView tableView](self->_wrapperView, "tableView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (void)viewWillLayoutSubviews
{
  PKMonthDayCollectionViewController *monthDayCollectionViewController;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)PKAccountAutomaticPaymentsConfigurationViewController;
  -[PKAccountAutomaticPaymentsConfigurationViewController viewWillLayoutSubviews](&v15, sel_viewWillLayoutSubviews);
  if (self->_shouldShowCollectionView)
    monthDayCollectionViewController = self->_monthDayCollectionViewController;
  else
    monthDayCollectionViewController = 0;
  -[PKAccountAutomaticPaymentsDateFooterView setCollectionViewController:](self->_footerView, "setCollectionViewController:", monthDayCollectionViewController);
  -[PKAccountAutomaticPaymentsDateFooterView textLabel](self->_footerView, "textLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountAutomaticPaymentsConfigurationViewController _footerText](self, "_footerText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setText:", v5);

  -[PKAccountAutomaticPaymentsConfigurationViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "bounds");
  v8 = v7;

  -[PKAccountAutomaticPaymentsDateFooterView frame](self->_footerView, "frame");
  v10 = v9;
  v12 = v11;
  -[PKAccountAutomaticPaymentsDateFooterView sizeThatFits:](self->_footerView, "sizeThatFits:", v8, 0.0);
  -[PKAccountAutomaticPaymentsDateFooterView setFrame:](self->_footerView, "setFrame:", v10, v12, v13, v14);
  -[PKAccountAutomaticPaymentsDateFooterView layoutIfNeeded](self->_footerView, "layoutIfNeeded");
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
    -[PKAccountAutomaticPaymentsConfigurationViewController tableView](self, "tableView");
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

- (void)setSelectedFrequency:(id)a3
{
  NSNumber **p_selectedFrequency;
  NSUInteger v6;
  id v7;

  p_selectedFrequency = &self->_selectedFrequency;
  v7 = a3;
  if ((PKEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_selectedFrequency, a3);
    v6 = -[NSArray indexOfObject:](self->_frequencies, "indexOfObject:", *p_selectedFrequency);
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
      -[UIPickerView selectRow:inComponent:animated:](self->_frequencyPicker, "selectRow:inComponent:animated:", v6, 0, 0);
    -[PKAccountAutomaticPaymentsConfigurationViewController _updateDates](self, "_updateDates");
  }

}

- (id)_datesForFrequency:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t i;
  void *v11;
  void *v12;

  v4 = 14;
  if (a3 != 5)
    v4 = 0;
  if (a3 == 4)
    v5 = 7;
  else
    v5 = v4;
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(MEMORY[0x1E0C99D68], "date");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar components:fromDate:](self->_productCalendar, "components:fromDate:", 28, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSCalendar dateFromComponents:](self->_productCalendar, "dateFromComponents:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    for (i = 0; i != v5; ++i)
    {
      objc_msgSend(v9, "dateByAddingTimeInterval:", (double)i * 86400.0);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safelyAddObject:", v11);

    }
  }
  v12 = (void *)objc_msgSend(v6, "copy");

  return v12;
}

- (void)_updateDates
{
  NSInteger v3;
  NSArray *v4;
  NSArray *dates;
  NSUInteger v6;
  NSDate *v7;
  NSDate *selectedDate;
  UIPickerView *datePicker;
  NSUInteger v10;
  UIPickerView *v11;
  PKMonthDayCollectionViewController *monthDayCollectionViewController;
  NSInteger v13;
  int64_t v14;
  NSDate *v15;
  NSDate *v16;

  v3 = -[NSNumber integerValue](self->_selectedFrequency, "integerValue");
  -[PKAccountAutomaticPaymentsConfigurationViewController _datesForFrequency:](self, "_datesForFrequency:", v3);
  v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
  dates = self->_dates;
  self->_dates = v4;

  -[UIPickerView reloadAllComponents](self->_datePicker, "reloadAllComponents");
  if ((unint64_t)(v3 - 4) < 2)
  {
    v6 = -[NSArray indexOfObject:](self->_dates, "indexOfObject:", self->_selectedDate);
    if (v6 == 0x7FFFFFFFFFFFFFFFLL)
    {
      -[NSArray lastObject](self->_dates, "lastObject");
      v7 = (NSDate *)objc_claimAutoreleasedReturnValue();
      selectedDate = self->_selectedDate;
      self->_selectedDate = v7;

      if (!self->_selectedDate)
      {
LABEL_10:
        v14 = 0;
        goto LABEL_13;
      }
      datePicker = self->_datePicker;
      v10 = -[NSArray indexOfObject:](self->_dates, "indexOfObject:");
      v11 = datePicker;
    }
    else
    {
      v10 = v6;
      v11 = self->_datePicker;
    }
    -[UIPickerView selectRow:inComponent:animated:](v11, "selectRow:inComponent:animated:", v10, 0, 0);
    goto LABEL_10;
  }
  if (v3 != 6)
    return;
  monthDayCollectionViewController = self->_monthDayCollectionViewController;
  if (self->_selectedDate)
    v13 = -[NSCalendar component:fromDate:](self->_productCalendar, "component:fromDate:", 16);
  else
    v13 = 0;
  -[PKMonthDayCollectionViewController setDayNumber:](monthDayCollectionViewController, "setDayNumber:", v13);
  -[PKMonthDayCollectionViewController selectedDate](self->_monthDayCollectionViewController, "selectedDate");
  v15 = (NSDate *)objc_claimAutoreleasedReturnValue();
  v16 = self->_selectedDate;
  self->_selectedDate = v15;

  v14 = -[PKMonthDayCollectionViewController dayNumber](self->_monthDayCollectionViewController, "dayNumber");
LABEL_13:
  self->_scheduledDay = v14;
}

- (void)setSelectedAmount:(id)a3
{
  NSInteger v5;
  NSDate *v6;
  NSDate *selectedDate;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_selectedAmount, a3);
  v5 = -[NSCalendar component:fromDate:](self->_productCalendar, "component:fromDate:", 16, self->_selectedDate);
  -[PKMonthDayCollectionViewController setMinimumDayNumber:](self->_monthDayCollectionViewController, "setMinimumDayNumber:", -[PKAccountAutomaticPaymentsController minimumPaymentDayForPreset:](self->_controller, "minimumPaymentDayForPreset:", -[PKAccountAutomaticPaymentsConfigurationViewController _preset](self, "_preset")));
  -[PKMonthDayCollectionViewController setDayNumber:](self->_monthDayCollectionViewController, "setDayNumber:", v5);
  if (-[NSNumber isEqual:](self->_selectedAmount, "isEqual:", &unk_1E3FADDF8))
  {
    -[PKAccountAutomaticPaymentsConfigurationViewController setSelectedFrequency:](self, "setSelectedFrequency:", &unk_1E3FADDE0);
    -[PKMonthDayCollectionViewController selectedDate](self->_monthDayCollectionViewController, "selectedDate");
    v6 = (NSDate *)objc_claimAutoreleasedReturnValue();
    selectedDate = self->_selectedDate;
    self->_selectedDate = v6;

    self->_scheduledDay = -[PKMonthDayCollectionViewController dayNumber](self->_monthDayCollectionViewController, "dayNumber");
  }

}

- (void)setSelectedDate:(id)a3
{
  objc_storeStrong((id *)&self->_selectedDate, a3);
}

- (BOOL)shouldMapSection:(unint64_t)a3
{
  return 1;
}

- (void)monthDaySelectionViewController:(id)a3 didSelectDate:(id)a4 day:(int64_t)a5
{
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v8 = a4;
  if (self->_shouldShowCollectionView)
  {
    v12 = v8;
    objc_storeStrong((id *)&self->_selectedDate, a4);
    self->_scheduledDay = a5;
    -[PKAccountAutomaticPaymentsDateFooterView textLabel](self->_footerView, "textLabel");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountAutomaticPaymentsConfigurationViewController _footerText](self, "_footerText");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setText:", v10);

    -[PKAccountAutomaticPaymentsConfigurationViewController tableView](self, "tableView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "reloadData");

    -[PKAccountAutomaticPaymentsConfigurationViewController _updateNextButtonEnabledIfNecessary](self, "_updateNextButtonEnabledIfNecessary");
    v8 = v12;
  }

}

- (void)pickerView:(id)a3 didSelectRow:(int64_t)a4 inComponent:(int64_t)a5
{
  UIPickerView *v7;
  UIPickerView *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIPickerView *v13;

  v13 = (UIPickerView *)a3;
  -[PKFixedAmountWrapperView pickerView](self->_wrapperView, "pickerView");
  v7 = (UIPickerView *)objc_claimAutoreleasedReturnValue();

  v8 = v13;
  if (v7 == v13)
  {
    if (self->_amountPicker == v13)
    {
      -[NSArray objectAtIndexedSubscript:](self->_amounts, "objectAtIndexedSubscript:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountAutomaticPaymentsConfigurationViewController setSelectedAmount:](self, "setSelectedAmount:", v9);
    }
    else if (self->_frequencyPicker == v13)
    {
      -[NSArray objectAtIndexedSubscript:](self->_frequencies, "objectAtIndexedSubscript:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountAutomaticPaymentsConfigurationViewController setSelectedFrequency:](self, "setSelectedFrequency:", v9);
    }
    else
    {
      if (self->_datePicker != v13)
      {
LABEL_9:
        -[PKAccountAutomaticPaymentsDateFooterView textLabel](self->_footerView, "textLabel");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[PKAccountAutomaticPaymentsConfigurationViewController _footerText](self, "_footerText");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "setText:", v11);

        -[PKAccountAutomaticPaymentsConfigurationViewController tableView](self, "tableView");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "reloadData");

        -[PKAccountAutomaticPaymentsConfigurationViewController _updateNextButtonEnabledIfNecessary](self, "_updateNextButtonEnabledIfNecessary");
        v8 = v13;
        goto LABEL_10;
      }
      -[NSArray objectAtIndexedSubscript:](self->_dates, "objectAtIndexedSubscript:", a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[PKAccountAutomaticPaymentsConfigurationViewController setSelectedDate:](self, "setSelectedDate:", v9);
    }

    goto LABEL_9;
  }
LABEL_10:

}

- (int64_t)pickerView:(id)a3 numberOfRowsInComponent:(int64_t)a4
{
  UIPickerView *v5;
  UIPickerView *v6;
  int *v7;
  int64_t v8;

  v5 = (UIPickerView *)a3;
  v6 = v5;
  v7 = &OBJC_IVAR___PKAccountAutomaticPaymentsConfigurationViewController__amounts;
  if (self->_amountPicker == v5
    || (v7 = &OBJC_IVAR___PKAccountAutomaticPaymentsConfigurationViewController__frequencies,
        self->_frequencyPicker == v5)
    || (v7 = &OBJC_IVAR___PKAccountAutomaticPaymentsConfigurationViewController__dates, self->_datePicker == v5))
  {
    v8 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + *v7), "count");
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (int64_t)numberOfComponentsInPickerView:(id)a3
{
  return 1;
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  UIPickerView *v7;
  UIPickerView *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  NSDictionary *frequenciesMap;

  v7 = (UIPickerView *)a3;
  v8 = v7;
  if (self->_amountPicker == v7)
  {
    -[NSArray objectAtIndex:](self->_amounts, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountAutomaticPaymentsConfigurationViewController _textForAmount:](self, "_textForAmount:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v9 = (void *)v11;

    goto LABEL_9;
  }
  if (self->_frequencyPicker == v7)
  {
    frequenciesMap = self->_frequenciesMap;
    -[NSArray objectAtIndexedSubscript:](self->_frequencies, "objectAtIndexedSubscript:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDictionary objectForKeyedSubscript:](frequenciesMap, "objectForKeyedSubscript:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  if (self->_datePicker == v7)
  {
    -[NSArray objectAtIndex:](self->_dates, "objectAtIndex:", a4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](self->_pickerDateFormatter, "stringFromDate:", v10);
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  v9 = 0;
LABEL_9:

  return v9;
}

- (id)_dates
{
  NSArray *dates;
  NSArray *v4;
  NSArray *v5;

  dates = self->_dates;
  if (!dates)
  {
    -[PKAccountAutomaticPaymentsConfigurationViewController _datesForFrequency:](self, "_datesForFrequency:", -[PKAccountAutomaticPaymentsConfigurationViewController _frequency](self, "_frequency"));
    v4 = (NSArray *)objc_claimAutoreleasedReturnValue();
    v5 = self->_dates;
    self->_dates = v4;

    dates = self->_dates;
  }
  return dates;
}

- (id)_amounts
{
  NSArray *amounts;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  void *v14;
  id v15;
  uint64_t v16;
  NSArray *v17;
  NSArray *v18;
  void *v20;

  amounts = self->_amounts;
  if (!amounts)
  {
    -[PKAccount creditDetails](self->_account, "creditDetails");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accountSummary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if ((-[PKAccount isClosedAndChargedOff](self->_account, "isClosedAndChargedOff") & 1) != 0)
      objc_msgSend(v5, "currentBalance");
    else
      objc_msgSend(v5, "creditLimit");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    if (v6)
    {
      objc_msgSend(MEMORY[0x1E0CB3598], "zero");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v8, "compare:", v6);

      if (v9 == -1)
      {
        objc_msgSend(&unk_1E3FAEA88, "firstObject");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1E3FAEAA0, "firstObject");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(&unk_1E3FAEA88, "objectAtIndex:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          v20 = v5;
          v13 = 1;
          do
          {
            if (objc_msgSend(v10, "compare:", v6) != -1)
              break;
            objc_msgSend(v7, "addObject:", v10);
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(v11, "integerValue") + objc_msgSend(v10, "integerValue"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();

            if (v12 && objc_msgSend(v14, "compare:", v12) != -1)
            {
              v15 = v12;

              if (objc_msgSend(&unk_1E3FAEA88, "count") <= ++v13)
              {
                v12 = 0;
              }
              else
              {
                objc_msgSend(&unk_1E3FAEA88, "objectAtIndex:", v13);
                v12 = (void *)objc_claimAutoreleasedReturnValue();
              }

              if (objc_msgSend(&unk_1E3FAEAA0, "count") <= v13)
              {
                v14 = v15;
              }
              else
              {
                objc_msgSend(&unk_1E3FAEAA0, "objectAtIndex:", v13);
                v16 = objc_claimAutoreleasedReturnValue();

                v14 = v15;
                v11 = (void *)v16;
              }
            }
            v10 = v14;
          }
          while (v14);
          v5 = v20;
        }
        objc_msgSend(v7, "addObject:", v6);

      }
    }
    v17 = (NSArray *)objc_msgSend(v7, "copy");
    v18 = self->_amounts;
    self->_amounts = v17;

    amounts = self->_amounts;
  }
  return amounts;
}

- (id)_frequencies
{
  NSArray *frequencies;
  void *v4;
  char v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  NSArray *v11;
  NSArray *v12;
  NSDictionary *v13;
  NSDictionary *frequenciesMap;

  frequencies = self->_frequencies;
  if (!frequencies)
  {
    -[PKAccount scheduleRecurringPaymentsFeatureDescriptor](self->_account, "scheduleRecurringPaymentsFeatureDescriptor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "paymentFrequencies");
    v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
    v7 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if ((v5 & 4) != 0 && (-[PKAccount isClosedAndChargedOff](self->_account, "isClosedAndChargedOff") & 1) == 0)
    {
      objc_msgSend(v6, "addObject:", &unk_1E3FADF00);
      PKLocalizedFeatureString();
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, &unk_1E3FADF00);

    }
    if ((v5 & 8) != 0)
    {
      objc_msgSend(v6, "addObject:", &unk_1E3FADF18);
      PKLocalizedFeatureString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v9, &unk_1E3FADF18);

    }
    if ((v5 & 0x10) != 0)
    {
      objc_msgSend(v6, "addObject:", &unk_1E3FADDE0);
      PKLocalizedFeatureString();
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setObject:forKeyedSubscript:", v10, &unk_1E3FADDE0);

    }
    v11 = (NSArray *)objc_msgSend(v6, "copy");
    v12 = self->_frequencies;
    self->_frequencies = v11;

    v13 = (NSDictionary *)objc_msgSend(v7, "copy");
    frequenciesMap = self->_frequenciesMap;
    self->_frequenciesMap = v13;

    frequencies = self->_frequencies;
  }
  return frequencies;
}

- (id)_frequencyTitleForFrequency:(int64_t)a3
{
  if ((unint64_t)(a3 - 4) > 2)
    return 0;
  PKLocalizedFeatureString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (int64_t)_preset
{
  void *v2;
  int64_t v3;

  -[PKAccountAutomaticPaymentsConfigurationViewController _amount](self, "_amount");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = 1;
  else
    v3 = 2;

  return v3;
}

- (id)_amount
{
  NSNumber *selectedAmount;
  void *v5;
  NSNumber *v6;
  NSDecimalNumber *v7;
  void *v8;
  NSString *v9;
  void *v10;
  _QWORD v11[2];
  int v12;

  selectedAmount = self->_selectedAmount;
  if (!selectedAmount || -[NSNumber isEqualToNumber:](selectedAmount, "isEqualToNumber:", &unk_1E3FADDF8))
    return 0;
  v5 = (void *)MEMORY[0x1E0CB3598];
  v6 = self->_selectedAmount;
  if (v6)
  {
    -[NSNumber decimalValue](v6, "decimalValue");
  }
  else
  {
    v11[0] = 0;
    v11[1] = 0;
    v12 = 0;
  }
  objc_msgSend(v5, "decimalNumberWithDecimal:", v11);
  v7 = (NSDecimalNumber *)objc_claimAutoreleasedReturnValue();
  -[PKAccount creditDetails](self->_account, "creditDetails");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currencyCode");
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  PKCurrencyAmountCreate(v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (int64_t)_frequency
{
  return -[NSNumber integerValue](self->_selectedFrequency, "integerValue");
}

- (void)_updateNextButtonEnabledIfNecessary
{
  PKAccountAutomaticPaymentsController *controller;
  int64_t v4;
  int64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  controller = self->_controller;
  v4 = -[PKAccountAutomaticPaymentsConfigurationViewController _preset](self, "_preset");
  v5 = -[PKAccountAutomaticPaymentsConfigurationViewController _frequency](self, "_frequency");
  -[PKAccountAutomaticPaymentsConfigurationViewController _amount](self, "_amount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[PKAccountAutomaticPaymentsController canPerformScheduleAutomaticPaymentsWithPreset:frequency:amount:paymentDate:](controller, "canPerformScheduleAutomaticPaymentsWithPreset:frequency:amount:paymentDate:", v4, v5, v6, self->_selectedDate);

  -[PKAccountAutomaticPaymentsConfigurationViewController navigationItem](self, "navigationItem");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "rightBarButtonItem");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setEnabled:", v7);

}

- (void)handleNextButtonTapped:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  id location;

  v4 = a3;
  -[PKAccountAutomaticPaymentsController alertControllerForScheduledDate:](self->_controller, "alertControllerForScheduledDate:", self->_selectedDate);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    objc_initWeak(&location, self);
    v6 = (void *)MEMORY[0x1E0DC3448];
    PKLocalizedString(CFSTR("OK"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = MEMORY[0x1E0C809B0];
    v10 = 3221225472;
    v11 = __80__PKAccountAutomaticPaymentsConfigurationViewController_handleNextButtonTapped___block_invoke;
    v12 = &unk_1E3E63F88;
    objc_copyWeak(&v13, &location);
    objc_msgSend(v6, "actionWithTitle:style:handler:", v7, 0, &v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addAction:", v8, v9, v10, v11, v12);

    -[PKAccountAutomaticPaymentsConfigurationViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v5, 1, 0);
    objc_destroyWeak(&v13);
    objc_destroyWeak(&location);
  }
  else
  {
    -[PKAccountAutomaticPaymentsConfigurationViewController _performNextButtonTapped](self, "_performNextButtonTapped");
  }

}

void __80__PKAccountAutomaticPaymentsConfigurationViewController_handleNextButtonTapped___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_performNextButtonTapped");
    WeakRetained = v2;
  }

}

- (void)_performNextButtonTapped
{
  void *v3;
  uint64_t v4;
  PKAccountAutomaticPaymentsController *controller;
  void *v6;
  void *v7;
  id v8;

  -[PKAccountAutomaticPaymentsController fundingSources](self->_controller, "fundingSources");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  if (v4)
  {
    -[PKAccountAutomaticPaymentsController setPaymentPreset:](self->_controller, "setPaymentPreset:", -[PKAccountAutomaticPaymentsConfigurationViewController _preset](self, "_preset"));
    controller = self->_controller;
    -[PKAccountAutomaticPaymentsConfigurationViewController _amount](self, "_amount");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKAccountAutomaticPaymentsController setAmount:](controller, "setAmount:", v6);

    -[PKAccountAutomaticPaymentsController setPaymentFrequency:](self->_controller, "setPaymentFrequency:", -[PKAccountAutomaticPaymentsConfigurationViewController _frequency](self, "_frequency"));
    -[PKAccountAutomaticPaymentsController setPaymentDate:](self->_controller, "setPaymentDate:", self->_selectedDate);
    -[PKAccountAutomaticPaymentsController setScheduledDay:](self->_controller, "setScheduledDay:", self->_scheduledDay);
    -[PKAccountAutomaticPaymentsController setPaymentFrequency:](self->_controller, "setPaymentFrequency:", -[PKAccountAutomaticPaymentsConfigurationViewController _frequency](self, "_frequency"));
    -[PKAccountAutomaticPaymentsController performScheduleAutomaticPaymentsFromViewController:](self->_controller, "performScheduleAutomaticPaymentsFromViewController:", self);
  }
  else
  {
    -[PKAccountAutomaticPaymentsConfigurationViewController navigationController](self, "navigationController");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[PKAccountAutomaticPaymentsConfigurationViewController _addBankAccountInformationViewController](self, "_addBankAccountInformationViewController");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "presentViewController:animated:completion:", v7, 1, 0);

  }
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  if (-[PKAccountAutomaticPaymentsConfigurationViewController _preset](self, "_preset", a3, a4) == 1)
    return 3;
  else
    return 2;
}

- (id)tableView:(id)a3 viewForFooterInSection:(int64_t)a4
{
  return self->_footerView;
}

- (double)tableView:(id)a3 heightForFooterInSection:(int64_t)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (double)tableView:(id)a3 heightForRowAtIndexPath:(id)a4
{
  return *MEMORY[0x1E0DC53D8];
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  int64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a4;
  -[PKAccountAutomaticPaymentsConfigurationViewController tableView](self, "tableView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", CFSTR("configurationCellReuseIdentifier"), v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0DC39A8], "valueCellConfiguration");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKAccountAutomaticPaymentsConfigurationViewController _paymentRowTypeForIndexPath:](self, "_paymentRowTypeForIndexPath:", v5);

  -[PKAccountAutomaticPaymentsConfigurationViewController _textForPaymentRowType:](self, "_textForPaymentRowType:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  -[PKAccountAutomaticPaymentsConfigurationViewController _detailTextForPaymentRowType:](self, "_detailTextForPaymentRowType:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setSecondaryText:", v11);

  if (self->_selectedRowType == v9)
    objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  else
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "secondaryTextProperties");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setColor:", v12);
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "setFont:", v14);

  objc_msgSend(v8, "textProperties");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4AD0]);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setFont:", v16);

  objc_msgSend(v7, "setMinimumHeight:", 60.0);
  objc_msgSend(v7, "setContentConfiguration:", v8);
  objc_msgSend(v7, "setSelectionStyle:", 0);
  -[PKAccountAutomaticPaymentsConfigurationViewController _axIDForPaymentRowType:](self, "_axIDForPaymentRowType:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAccessibilityIdentifier:", v17);

  return v7;
}

- (id)_textForPaymentRowType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 2)
    return 0;
  PKLocalizedFeatureString();
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_detailTextForPaymentRowType:(int64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 3:
      -[PKAccountAutomaticPaymentsConfigurationViewController _displayStringForSelectedDate](self, "_displayStringForSelectedDate");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      -[NSDictionary objectForKeyedSubscript:](self->_frequenciesMap, "objectForKeyedSubscript:", self->_selectedFrequency);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 1:
      -[PKAccountAutomaticPaymentsConfigurationViewController _textForAmount:](self, "_textForAmount:", self->_selectedAmount);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      v3 = 0;
      break;
  }
  return v3;
}

- (id)_axIDForPaymentRowType:(int64_t)a3
{
  id *v3;

  if ((unint64_t)(a3 - 1) > 2)
    v3 = (id *)MEMORY[0x1E0D68188];
  else
    v3 = (id *)qword_1E3E7A9B8[a3 - 1];
  return *v3;
}

- (id)_displayStringForSelectedDate
{
  return -[NSDateFormatter stringFromDate:](self->_cellDateFormatter, "stringFromDate:", self->_selectedDate);
}

- (id)_textForAmount:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToNumber:", &unk_1E3FADDF8))
    PKLocalizedFeatureString();
  else
    -[NSNumberFormatter stringFromNumber:](self->_currencyFormatter, "stringFromNumber:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)_paymentRowTypeForIndexPath:(id)a3
{
  uint64_t v4;
  int64_t v5;
  BOOL v7;
  BOOL v8;
  uint64_t v9;
  int64_t v10;

  v4 = objc_msgSend(a3, "row");
  v5 = -[PKAccountAutomaticPaymentsConfigurationViewController _preset](self, "_preset");
  v7 = v4 == 1 && v5 == 2;
  v8 = v5 != 2 && v4 == 1;
  v9 = 2;
  if (!v8)
    v9 = 0;
  if (v7)
    v10 = 3;
  else
    v10 = v9;
  if (v4 == 2)
    v10 = 3;
  if (v4)
    return v10;
  else
    return 1;
}

- (id)_footerText
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSCalendar *productCalendar;
  void *v9;
  void *v10;

  v3 = -[PKAccountAutomaticPaymentsConfigurationViewController _frequency](self, "_frequency");
  -[NSDateFormatter stringFromDate:](self->_dayNameFormatter, "stringFromDate:", self->_selectedDate);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountAutomaticPaymentsConfigurationViewController _displayStringForSelectedDate](self, "_displayStringForSelectedDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 4 || v3 == 5)
  {
    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (v3 == 6)
  {
    if (self->_useOrdinalDay)
    {
      PKOrdinalStringForInteger();
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      productCalendar = self->_productCalendar;
      objc_msgSend(MEMORY[0x1E0C99D68], "date");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[NSCalendar nextDateAfterDate:matchingUnit:value:options:](productCalendar, "nextDateAfterDate:matchingUnit:value:options:", v9, 16, self->_scheduledDay, 2);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[NSDateFormatter stringFromDate:](self->_cardinalDayDateFormatter, "stringFromDate:", v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
    PKLocalizedFeatureString();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  int64_t v7;
  int64_t v8;
  uint64_t v9;
  PKFixedAmountWrapperView *wrapperView;
  void *v11;
  void *v12;

  v6 = a3;
  v7 = -[PKAccountAutomaticPaymentsConfigurationViewController _paymentRowTypeForIndexPath:](self, "_paymentRowTypeForIndexPath:", a4);
  v8 = v7;
  self->_shouldShowCollectionView = 0;
  switch(v7)
  {
    case 3:
      if (-[PKAccountAutomaticPaymentsConfigurationViewController _frequency](self, "_frequency") != 6)
      {
        -[PKAccountAutomaticPaymentsConfigurationViewController _updateDates](self, "_updateDates");
        wrapperView = self->_wrapperView;
        v9 = 1288;
        goto LABEL_9;
      }
      -[PKFixedAmountWrapperView setPickerView:](self->_wrapperView, "setPickerView:", 0);
      self->_shouldShowCollectionView = 1;
      break;
    case 2:
      wrapperView = self->_wrapperView;
      v9 = 1280;
      goto LABEL_9;
    case 1:
      v9 = 1272;
      wrapperView = self->_wrapperView;
LABEL_9:
      -[PKFixedAmountWrapperView setPickerView:](wrapperView, "setPickerView:", *(Class *)((char *)&self->super.super.super.super.super.isa + v9));
      break;
  }
  self->_selectedRowType = v8;
  -[PKAccountAutomaticPaymentsDateFooterView textLabel](self->_footerView, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKAccountAutomaticPaymentsConfigurationViewController _footerText](self, "_footerText");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setText:", v12);

  objc_msgSend(v6, "reloadData");
  -[PKAccountAutomaticPaymentsConfigurationViewController _updateNextButtonEnabledIfNecessary](self, "_updateNextButtonEnabledIfNecessary");
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
  v7[2] = __117__PKAccountAutomaticPaymentsConfigurationViewController_addBankAccountInformationViewController_didAddFundingSource___block_invoke;
  v7[3] = &unk_1E3E61388;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], v7);

}

void __117__PKAccountAutomaticPaymentsConfigurationViewController_addBankAccountInformationViewController_didAddFundingSource___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(*(_QWORD *)(a1 + 32) + 1080);
  v3[0] = *(_QWORD *)(a1 + 40);
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setFundingSources:", v2);

}

- (void)addBankAccountInformationViewControllerDidFinish:(id)a3
{
  void *v4;
  _QWORD v5[5];

  -[PKAccountAutomaticPaymentsConfigurationViewController navigationController](self, "navigationController", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __106__PKAccountAutomaticPaymentsConfigurationViewController_addBankAccountInformationViewControllerDidFinish___block_invoke;
  v5[3] = &unk_1E3E612E8;
  v5[4] = self;
  objc_msgSend(v4, "dismissViewControllerAnimated:completion:", 1, v5);

}

void __106__PKAccountAutomaticPaymentsConfigurationViewController_addBankAccountInformationViewControllerDidFinish___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1080), "fundingSources");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (v3)
    objc_msgSend(*(id *)(a1 + 32), "_performNextButtonTapped");
}

- (void)addBankAccountInformationViewController:(id)a3 didFailWithError:(id)a4
{
  id v6;
  id v7;
  id v8;
  id v9;
  _QWORD block[4];
  id v11;
  PKAccountAutomaticPaymentsConfigurationViewController *v12;
  id v13;

  v6 = a3;
  v7 = a4;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __114__PKAccountAutomaticPaymentsConfigurationViewController_addBankAccountInformationViewController_didFailWithError___block_invoke;
  block[3] = &unk_1E3E61400;
  v11 = v7;
  v12 = self;
  v13 = v6;
  v8 = v6;
  v9 = v7;
  dispatch_async(MEMORY[0x1E0C80D38], block);

}

void __114__PKAccountAutomaticPaymentsConfigurationViewController_addBankAccountInformationViewController_didFailWithError___block_invoke(uint64_t a1)
{
  id v2;
  id v3;

  +[PKAccountFlowController displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:](PKAccountFlowController, "displayableErrorForError:featureIdentifier:genericErrorTitle:genericErrorMessage:", *(_QWORD *)(a1 + 32), objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 1088), "feature"), 0, 0);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v2 = PKAlertForDisplayableErrorWithHandlers(v3, 0, 0, 0);
  objc_msgSend(*(id *)(a1 + 48), "presentViewController:animated:completion:", v2, 1, 0);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_footerView, 0);
  objc_storeStrong((id *)&self->_wrapperView, 0);
  objc_storeStrong((id *)&self->_datePicker, 0);
  objc_storeStrong((id *)&self->_frequencyPicker, 0);
  objc_storeStrong((id *)&self->_amountPicker, 0);
  objc_storeStrong((id *)&self->_monthDayCollectionViewController, 0);
  objc_storeStrong((id *)&self->_productCalendar, 0);
  objc_storeStrong((id *)&self->_selectedDate, 0);
  objc_storeStrong((id *)&self->_selectedFrequency, 0);
  objc_storeStrong((id *)&self->_selectedAmount, 0);
  objc_storeStrong((id *)&self->_dates, 0);
  objc_storeStrong((id *)&self->_frequenciesMap, 0);
  objc_storeStrong((id *)&self->_frequencies, 0);
  objc_storeStrong((id *)&self->_amounts, 0);
  objc_storeStrong((id *)&self->_cardinalDayDateFormatter, 0);
  objc_storeStrong((id *)&self->_dayNameFormatter, 0);
  objc_storeStrong((id *)&self->_cellDateFormatter, 0);
  objc_storeStrong((id *)&self->_pickerDateFormatter, 0);
  objc_storeStrong((id *)&self->_modelDateFormatter, 0);
  objc_storeStrong((id *)&self->_currencyFormatter, 0);
  objc_storeStrong((id *)&self->_tableHeaderView, 0);
  objc_storeStrong((id *)&self->_productTimeZone, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_controller, 0);
}

@end
