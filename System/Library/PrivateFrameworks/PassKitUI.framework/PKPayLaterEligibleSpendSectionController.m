@implementation PKPayLaterEligibleSpendSectionController

- (PKPayLaterEligibleSpendSectionController)initWithPayLaterAccount:(id)a3 dynamicContentPage:(id)a4 viewControllerDelegate:(id)a5
{
  PKPayLaterEligibleSpendSectionController *v5;
  PKPayLaterEligibleSpendSectionController *v6;
  NSNumberFormatter *v7;
  NSNumberFormatter *numberFormatter;
  NSDateFormatter *v9;
  NSDateFormatter *timeFormatter;
  NSDateFormatter *v11;
  uint64_t v12;
  void *v13;
  NSDateFormatter *v14;
  NSDateFormatter *dateFormatter;
  NSDateFormatter *v16;
  void *v17;
  NSNumberFormatter *v18;
  NSNumberFormatter *percentageFormatter;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)PKPayLaterEligibleSpendSectionController;
  v5 = -[PKPayLaterSectionController initWithPayLaterAccount:dynamicContentPage:viewControllerDelegate:](&v21, sel_initWithPayLaterAccount_dynamicContentPage_viewControllerDelegate_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    -[PKPayLaterEligibleSpendSectionController _updateLocalState](v5, "_updateLocalState");
    v7 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    numberFormatter = v6->_numberFormatter;
    v6->_numberFormatter = v7;

    v9 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    timeFormatter = v6->_timeFormatter;
    v6->_timeFormatter = v9;

    v11 = v6->_timeFormatter;
    v12 = *MEMORY[0x1E0C996C8];
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v11, "setCalendar:", v13);

    -[NSDateFormatter setDateStyle:](v6->_timeFormatter, "setDateStyle:", 0);
    -[NSDateFormatter setTimeStyle:](v6->_timeFormatter, "setTimeStyle:", 1);
    v14 = (NSDateFormatter *)objc_alloc_init(MEMORY[0x1E0CB3578]);
    dateFormatter = v6->_dateFormatter;
    v6->_dateFormatter = v14;

    -[NSDateFormatter setLocalizedDateFormatFromTemplate:](v6->_dateFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("MMM d"));
    v16 = v6->_dateFormatter;
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", v12);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter setCalendar:](v16, "setCalendar:", v17);

    v18 = (NSNumberFormatter *)objc_alloc_init(MEMORY[0x1E0CB37F0]);
    percentageFormatter = v6->_percentageFormatter;
    v6->_percentageFormatter = v18;

    -[NSNumberFormatter setNumberStyle:](v6->_percentageFormatter, "setNumberStyle:", 3);
    -[NSNumberFormatter setMinimumFractionDigits:](v6->_percentageFormatter, "setMinimumFractionDigits:", 0);
    -[NSNumberFormatter setMaximumFractionDigits:](v6->_percentageFormatter, "setMaximumFractionDigits:", 2);
  }
  return v6;
}

- (id)identifiers
{
  id v3;
  unint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_msgSend(v3, "addObject:", CFSTR("kEligibleSpendSection"));
  if (-[NSArray count](self->_financingOptions, "count"))
  {
    v4 = 0;
    do
    {
      v5 = (void *)MEMORY[0x1E0CB3940];
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "stringWithFormat:", CFSTR("%@%@"), CFSTR("kFinancingOptionsSectionPrefix-"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "addObject:", v7);

      ++v4;
    }
    while (v4 < -[NSArray count](self->_financingOptions, "count"));
  }
  if (self->_financingOptionsProductType == 1)
    objc_msgSend(v3, "addObject:", CFSTR("kFinancingOptionsTotalCostSection"));
  objc_msgSend(v3, "addObject:", CFSTR("kNewPurchaseSection"));
  v8 = (void *)objc_msgSend(v3, "copy");

  return v8;
}

- (id)snapshotWithPreviousSnapshot:(id)a3 forSectionIdentifier:(id)a4
{
  id v5;
  id v6;
  __CFString *v7;
  __CFString *v8;
  int v9;
  __CFString *v10;
  __CFString *v11;
  int v12;
  __CFString *v13;
  __CFString *v14;
  int v15;

  v5 = a4;
  v6 = objc_alloc_init(MEMORY[0x1E0DC3390]);
  v7 = (__CFString *)v5;
  v8 = v7;
  if (v7 == CFSTR("kEligibleSpendSection"))
    goto LABEL_4;
  if (v7)
  {
    v9 = objc_msgSend(CFSTR("kEligibleSpendSection"), "isEqualToString:", v7);

    if (v9)
    {
LABEL_4:
      -[PKPayLaterEligibleSpendSectionController _configureEligbleSpendSection:](self, "_configureEligbleSpendSection:", v6);
      goto LABEL_14;
    }
    v10 = v8;
    if (v10 == CFSTR("kNewPurchaseSection")
      || (v11 = v10, v12 = objc_msgSend(CFSTR("kNewPurchaseSection"), "isEqualToString:", v10), v11, v12))
    {
      -[PKPayLaterEligibleSpendSectionController _configureNewPurchaseSection:](self, "_configureNewPurchaseSection:", v6);
      goto LABEL_14;
    }
  }
  if (-[__CFString hasPrefix:](v8, "hasPrefix:", CFSTR("kFinancingOptionsSectionPrefix-")))
  {
    -[PKPayLaterEligibleSpendSectionController _configureFinancingOptionsSectionWithSectionIdentifier:snapshot:](self, "_configureFinancingOptionsSectionWithSectionIdentifier:snapshot:", v8, v6);
  }
  else
  {
    v13 = v8;
    if (v13 == CFSTR("kFinancingOptionsTotalCostSection")
      || v8
      && (v14 = v13,
          v15 = -[__CFString isEqualToString:](v13, "isEqualToString:", CFSTR("kFinancingOptionsTotalCostSection")),
          v14,
          v15))
    {
      -[PKPayLaterEligibleSpendSectionController _configureTotalCostSection:](self, "_configureTotalCostSection:", v6);
    }
  }
LABEL_14:

  return v6;
}

- (void)setPayLaterAccount:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PKPayLaterEligibleSpendSectionController;
  -[PKPayLaterSectionController setPayLaterAccount:](&v7, sel_setPayLaterAccount_, a3);
  -[PKPayLaterEligibleSpendSectionController _updateLocalState](self, "_updateLocalState");
  -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "reconfigureHeaderAndFooterForSectionIdentifier:", CFSTR("kEligibleSpendSection"));

  -[PKPayLaterSectionController dynamicCollectionDelegate](self, "dynamicCollectionDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterEligibleSpendSectionController _firstFinancingOptionSectionIdentifier](self, "_firstFinancingOptionSectionIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "reconfigureHeaderAndFooterForSectionIdentifier:", v6);

}

- (id)footerContentForSectionIdentifier:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  int v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v4 = (__CFString *)a3;
  v5 = v4;
  if (v4 == CFSTR("kEligibleSpendSection")
    || v4
    && (v6 = -[__CFString isEqualToString:](v4, "isEqualToString:", CFSTR("kEligibleSpendSection")), v5, v6))
  {
    v7 = objc_alloc_init(MEMORY[0x1E0D66B00]);
    objc_msgSend(MEMORY[0x1E0C99D48], "calendarWithIdentifier:", *MEMORY[0x1E0C996C8]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99D68], "now");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    PKDateIgnoringTime();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    PKDateIgnoringTime();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "components:fromDate:toDate:options:", 16, v10, v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v24 = v8;
    objc_msgSend(v8, "components:fromDate:", 32, self->_expirationDate);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v23, "hour");
    -[NSDateFormatter stringFromDate:](self->_timeFormatter, "stringFromDate:", self->_expirationDate);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSDateFormatter stringFromDate:](self->_dateFormatter, "stringFromDate:", self->_expirationDate);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v12, "day");
    PKLocalizedCocoonString(CFSTR("AVAILABLE_TO_SPEND_FOOTER_LEARN_MORE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSDate isToday](self->_expirationDate, "isToday"))
    {
      PKLocalizedCocoonString(CFSTR("ELIGIBLE_SPEND_OFFER_DUE_TODAY_FOOTER"), CFSTR("%ld%@%@"), v13, v14, v17);
    }
    else if (-[NSDate isTomorrow](self->_expirationDate, "isTomorrow"))
    {
      PKLocalizedCocoonString(CFSTR("ELIGIBLE_SPEND_OFFER_DUE_TOMORROW_FOOTER"), CFSTR("%ld%@%@"), v13, v14, v17);
    }
    else
    {
      PKLocalizedCocoonString(CFSTR("ELIGIBLE_SPEND_OFFER_DUE_IN_DAYS_FOOTER"), CFSTR("%ld%@%@"), v16, v15, v17);
    }
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v19 = objc_alloc_init(MEMORY[0x1E0D66B08]);
    objc_msgSend(v19, "setLinkText:", v17);
    objc_msgSend(MEMORY[0x1E0C99E98], "URLWithString:", CFSTR("https://support.apple.com/ht212967?cid=mc-ols-applepay-article_ht212967-ios_ui-06092022#purchase"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setLinkURL:", v20);
    objc_msgSend(v19, "setAnalyticsIdentifier:", *MEMORY[0x1E0D68DB0]);
    v25[0] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setLinks:", v21);

    objc_msgSend(v7, "setFooterText:", v18);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (Class)headerViewClassForSectionIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  char v9;
  __CFString *v10;
  void *v11;
  int v12;

  v4 = a3;
  -[PKPayLaterEligibleSpendSectionController _firstFinancingOptionSectionIdentifier](self, "_firstFinancingOptionSectionIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  v7 = v5;
  v8 = v7;
  if (v7 == v6)
  {

    goto LABEL_12;
  }
  if (v6 && v7)
  {
    v9 = objc_msgSend(v6, "isEqualToString:", v7);

    if ((v9 & 1) != 0)
      goto LABEL_12;
  }
  else
  {

  }
  v10 = (__CFString *)v6;
  if (v10 == CFSTR("kEligibleSpendSection"))
  {
LABEL_12:
    objc_opt_class();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }
  v11 = v10;
  if (v10)
  {
    v12 = objc_msgSend(CFSTR("kEligibleSpendSection"), "isEqualToString:", v10);

    if (!v12)
    {
      v11 = 0;
      goto LABEL_13;
    }
    goto LABEL_12;
  }
LABEL_13:

  return (Class)v11;
}

- (void)configureHeaderView:(id)a3 forSectionIdentifier:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  int v10;
  PKCurrencyAmount *eligibleSpendAmount;
  id v12;
  void *v13;
  __CFString *v14;
  id v15;
  void *v16;
  __CFString *v17;
  __CFString *v18;
  int v19;
  id v20;

  v20 = a3;
  v6 = a4;
  -[PKPayLaterEligibleSpendSectionController _firstFinancingOptionSectionIdentifier](self, "_firstFinancingOptionSectionIdentifier");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v6;
  v9 = v8;
  if (v7 == v8)
  {

    goto LABEL_7;
  }
  if (v8 && v7)
  {
    v10 = objc_msgSend(v7, "isEqualToString:", v8);

    if (!v10)
      goto LABEL_12;
LABEL_7:
    eligibleSpendAmount = self->_eligibleSpendAmount;
    v12 = v20;
    -[PKCurrencyAmount formattedStringValue](eligibleSpendAmount, "formattedStringValue");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[NSArray count](self->_financingOptions, "count") >= 2)
      v14 = CFSTR("SAMPLE_PAYMENT_PLANS_TITLE");
    else
      v14 = CFSTR("SAMPLE_PAYMENT_PLAN_TITLE");
    PKLocalizedCocoonString(&v14->isa);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setPrimaryText:", v15);
    PKLocalizedCocoonString(CFSTR("SAMPLE_PAYMENT_PLAN_SUBTITLE"), CFSTR("%@"), v13);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setSecondaryText:", v16);

    objc_msgSend(v12, "setTopPadding:", 16.0);
    objc_msgSend(v12, "setBottomPadding:", 8.0);

    goto LABEL_16;
  }

LABEL_12:
  v17 = v9;
  if (v17 == CFSTR("kEligibleSpendSection")
    || (v18 = v17) != 0
    && (v19 = objc_msgSend(CFSTR("kEligibleSpendSection"), "isEqualToString:", v17), v18, v19))
  {
    v15 = v20;
    objc_msgSend(v15, "setTitleStyle:", 1);
    PKLocalizedCocoonString(CFSTR("AVAILABLE_TO_SPEND"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setTitle:", v13);
LABEL_16:

  }
}

- (id)layoutWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  __CFString *v8;
  __CFString *v9;
  int v10;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterEligibleSpendSectionController;
  -[PKPayLaterSectionController layoutWithLayoutEnvironment:sectionIdentifier:](&v12, sel_layoutWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (self->_financingOptionsProductType == 1)
  {
    v8 = (__CFString *)v6;
    if (v8 == CFSTR("kFinancingOptionsTotalCostSection")
      || (v9 = v8) != 0
      && (v10 = objc_msgSend(CFSTR("kFinancingOptionsTotalCostSection"), "isEqualToString:", v8), v9, v10))
    {
      objc_msgSend(v7, "contentInsets");
      objc_msgSend(v7, "setContentInsets:");
    }
  }

  return v7;
}

- (id)listLayoutConfigurationWithLayoutEnvironment:(id)a3 sectionIdentifier:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKPayLaterEligibleSpendSectionController;
  v6 = a4;
  -[PKPayLaterSectionController listLayoutConfigurationWithLayoutEnvironment:sectionIdentifier:](&v12, sel_listLayoutConfigurationWithLayoutEnvironment_sectionIdentifier_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "hasPrefix:", CFSTR("kFinancingOptionsSectionPrefix-"), v12.receiver, v12.super_class);

  if (v8 && self->_financingOptionsProductType == 1)
  {
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC39B8]), "initWithListAppearance:", 2);
    +[PKConnectedCollectionViewCell textInsetWithOuterRadius:](PKConnectedCollectionViewCell, "textInsetWithOuterRadius:", 12.0);
    objc_msgSend(v9, "setBottomSeparatorInsets:", 0.0, v10, 0.0, 0.0);
    objc_msgSend(v7, "setSeparatorConfiguration:", v9);

  }
  return v7;
}

- (void)_configureEligbleSpendSection:(id)a3
{
  objc_class *v4;
  id v5;
  PKPayLaterTitleDetailValueRow *v6;
  void *v7;
  void *v8;
  PKPayLaterTitleDetailValueRow *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v16 = objc_alloc_init(v4);
  v6 = [PKPayLaterTitleDetailValueRow alloc];
  PKLocalizedCocoonString(CFSTR("AVAILABLE_TO_SPEND"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurrencyAmount formattedStringValue](self->_eligibleSpendAmount, "formattedStringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPayLaterTitleDetailValueRow initWithTitle:detail:value:accessory:selectionHandler:](v6, "initWithTitle:detail:value:accessory:selectionHandler:", v7, v8, 0, 0, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailValueRow setTitleColor:](v9, "setTitleColor:", v10);

  v11 = (void *)*MEMORY[0x1E0DC48D0];
  PKFontForDefaultDesign((NSString *)*MEMORY[0x1E0DC4B10], (NSString *)*MEMORY[0x1E0DC48D0]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailValueRow setTitleFont:](v9, "setTitleFont:", v12);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailValueRow setDetailColor:](v9, "setDetailColor:", v13);

  PKFontForDesign((void *)*MEMORY[0x1E0DC13A8], (void *)*MEMORY[0x1E0DC4B50], v11, 2, 0, *MEMORY[0x1E0DC1420]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailValueRow setDetailFont:](v9, "setDetailFont:", v14);

  -[PKPayLaterTitleDetailValueRow setHorizontalMargin:](v9, "setHorizontalMargin:", 12.0);
  -[PKPayLaterTitleDetailValueRow setVerticalMargin:](v9, "setVerticalMargin:", 12.0);
  objc_msgSend(v16, "safelyAddObject:", v9);
  v15 = (void *)objc_msgSend(v16, "copy");
  objc_msgSend(v5, "appendItems:", v15);

}

- (void)_configureNewPurchaseSection:(id)a3
{
  id v4;
  id v5;
  PKPayLaterButtonRow *newPurchaseButtonRow;
  PKPayLaterButtonRow *v7;
  void *v8;
  PKPayLaterButtonRow *v9;
  PKPayLaterButtonRow *v10;
  void *v11;
  _QWORD v12[5];
  id v13;
  id location;

  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  objc_initWeak(&location, self);
  newPurchaseButtonRow = self->_newPurchaseButtonRow;
  if (!newPurchaseButtonRow)
  {
    v7 = [PKPayLaterButtonRow alloc];
    PKLocalizedCocoonString(CFSTR("NEW_PURCHASE_AMOUNT_BUTTON"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __73__PKPayLaterEligibleSpendSectionController__configureNewPurchaseSection___block_invoke;
    v12[3] = &unk_1E3E61B68;
    objc_copyWeak(&v13, &location);
    v12[4] = self;
    v9 = -[PKPayLaterButtonRow initWithTitle:selectionHandler:](v7, "initWithTitle:selectionHandler:", v8, v12);
    v10 = self->_newPurchaseButtonRow;
    self->_newPurchaseButtonRow = v9;

    objc_destroyWeak(&v13);
    newPurchaseButtonRow = self->_newPurchaseButtonRow;
  }
  objc_msgSend(v5, "addObject:", newPurchaseButtonRow);
  v11 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "appendItems:", v11);

  objc_destroyWeak(&location);
}

void __73__PKPayLaterEligibleSpendSectionController__configureNewPurchaseSection___block_invoke(uint64_t a1)
{
  id *WeakRetained;
  id *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id location;
  uint64_t v14;
  _QWORD v15[2];

  v15[1] = *MEMORY[0x1E0C80C00];
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "viewControllerDelegate");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = *MEMORY[0x1E0D68858];
    v15[0] = *MEMORY[0x1E0D68868];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, &v14, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "reportAnalyticsEvent:", v5);

    objc_msgSend(v3[23], "setShowSpinner:", 1);
    objc_msgSend(v3, "dynamicCollectionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reloadItem:animated:", v3[23], 1);

    objc_msgSend(v3, "payLaterAccount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    +[PKPayLaterSetupFlowController defaultPayLaterSetupFlowControllerForAccount:controllerContext:referrerIdentifier:](PKPayLaterSetupFlowController, "defaultPayLaterSetupFlowControllerForAccount:controllerContext:referrerIdentifier:", v7, 3, 0);
    v8 = objc_claimAutoreleasedReturnValue();
    v9 = v3[19];
    v3[19] = (id)v8;

    objc_initWeak(&location, *(id *)(a1 + 32));
    v10 = v3[19];
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = __73__PKPayLaterEligibleSpendSectionController__configureNewPurchaseSection___block_invoke_2;
    v11[3] = &unk_1E3E65F18;
    objc_copyWeak(&v12, &location);
    objc_msgSend(v10, "fetchPayLaterDynamicContentWithCompletion:", v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);

  }
}

void __73__PKPayLaterEligibleSpendSectionController__configureNewPurchaseSection___block_invoke_2(uint64_t a1, char a2, void *a3)
{
  id v5;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  char v10;

  v5 = a3;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __73__PKPayLaterEligibleSpendSectionController__configureNewPurchaseSection___block_invoke_3;
  block[3] = &unk_1E3E67148;
  objc_copyWeak(&v9, (id *)(a1 + 32));
  v10 = a2;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x1E0C80D38], block);

  objc_destroyWeak(&v9);
}

void __73__PKPayLaterEligibleSpendSectionController__configureNewPurchaseSection___block_invoke_3(uint64_t a1)
{
  id *WeakRetained;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id *v7;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v7 = WeakRetained;
    objc_msgSend(WeakRetained[23], "setShowSpinner:", 0);
    objc_msgSend(v7, "dynamicCollectionDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "reloadItem:animated:", v7[23], 1);

    if (!*(_BYTE *)(a1 + 48) || *(_QWORD *)(a1 + 32))
    {
      PKAccountDisplayableError();
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = PKAlertForDisplayableErrorWithHandlers(v5, 0, 0, 0);

      if (!v4)
      {
LABEL_7:

        WeakRetained = v7;
        goto LABEL_8;
      }
    }
    else
    {
      objc_msgSend(v7[19], "firstViewController");
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(v7, "dynamicCollectionDelegate");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "presentViewController:animated:completion:", v4, 1, 0);

    goto LABEL_7;
  }
LABEL_8:

}

- (void)_configureFinancingOptionsSectionWithSectionIdentifier:(id)a3 snapshot:(id)a4
{
  objc_class *v6;
  id v7;
  id v8;
  void *v9;
  unint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v14 = a4;
  v6 = (objc_class *)MEMORY[0x1E0C99DE8];
  v7 = a3;
  v8 = objc_alloc_init(v6);
  objc_msgSend(v7, "stringByReplacingOccurrencesOfString:withString:", CFSTR("kFinancingOptionsSectionPrefix-"), &stru_1E3E7D690);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_msgSend(v9, "integerValue");
  if ((v10 & 0x8000000000000000) == 0 && v10 < -[NSArray count](self->_financingOptions, "count"))
  {
    -[NSArray objectAtIndexedSubscript:](self->_financingOptions, "objectAtIndexedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (self->_financingOptionsProductType == 1)
    {
      -[PKPayLaterEligibleSpendSectionController _paymentScheduleRowsForOption:](self, "_paymentScheduleRowsForOption:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "addObjectsFromArray:", v12);

    }
    v13 = (void *)objc_msgSend(v8, "copy");
    objc_msgSend(v14, "appendItems:", v13);

  }
}

- (void)_configureTotalCostSection:(id)a3
{
  objc_class *v4;
  id v5;
  PKPayLaterTitleDetailRow *v6;
  void *v7;
  void *v8;
  PKPayLaterTitleDetailRow *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = (objc_class *)MEMORY[0x1E0C99DE8];
  v5 = a3;
  v12 = objc_alloc_init(v4);
  v6 = [PKPayLaterTitleDetailRow alloc];
  PKLocalizedCocoonString(CFSTR("TOTAL_COST"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKCurrencyAmount formattedStringValue](self->_eligibleSpendAmount, "formattedStringValue");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = -[PKPayLaterTitleDetailRow initWithTitle:detail:selectionHandler:](v6, "initWithTitle:detail:selectionHandler:", v7, v8, 0);

  objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPayLaterTitleDetailRow setDetailColor:](v9, "setDetailColor:", v10);

  objc_msgSend(v12, "safelyAddObject:", v9);
  v11 = (void *)objc_msgSend(v12, "copy");
  objc_msgSend(v5, "appendItems:", v11);

}

- (id)_tileDetailRowForOption:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  PKPayLaterTileDetailRow *v15;

  v3 = a3;
  objc_msgSend(v3, "totalAmount");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "currencyAmount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "installmentAmount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currencyAmount");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedCocoonString(CFSTR("NUMBER_PAYMENTS"), CFSTR("%lu"), objc_msgSend(v3, "installmentCount"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v3, "productType");

  if (v9 != 1)
  {
    v12 = 0;
    v11 = 0;
    if (v5)
      goto LABEL_3;
LABEL_5:
    v14 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v7, "formattedStringValue");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("4_PAYMENT_OF"), CFSTR("%@"), v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  PKLocalizedCocoonString(CFSTR("INTEREST_FREE"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_5;
LABEL_3:
  objc_msgSend(v5, "formattedStringValue");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  PKLocalizedCocoonString(CFSTR("TOTAL_OPTION_AMOUNT"), CFSTR("%@"), v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_6:
  v15 = -[PKPayLaterTileDetailRow initWithTitleText:subtitleText:text:detailText:textSubtitle:customView:selectionHandler:]([PKPayLaterTileDetailRow alloc], "initWithTitleText:subtitleText:text:detailText:textSubtitle:customView:selectionHandler:", v11, v8, v12, v14, 0, 0, 0);

  return v15;
}

- (id)_paymentScheduleRowsForOption:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  v3 = a3;
  objc_msgSend(v3, "installments");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");
  objc_msgSend((id)objc_opt_class(), "dynamicContentPageForBNPLOption:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[PKPayLaterProgressRow progressRowsWithInstallmentCount:firstRowFont:dynamicContentPage:](PKPayLaterProgressRow, "progressRowsWithInstallmentCount:firstRowFont:dynamicContentPage:", v5, 0, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)_firstFinancingOptionSectionIdentifier
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@%@"), CFSTR("kFinancingOptionsSectionPrefix-"), &unk_1E3FAD7C8);
}

- (id)_lastFinancingOptionSectionIdentifier
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[NSArray count](self->_financingOptions, "count") - 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("%@%@"), CFSTR("kFinancingOptionsSectionPrefix-"), v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_updateLocalState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  PKCurrencyAmount *v11;
  PKCurrencyAmount *eligibleSpendAmount;
  NSDate *v13;
  NSDate *expirationDate;
  NSArray *v15;
  NSArray *financingOptions;
  NSArray *v17;
  void *v18;
  void *v19;
  NSArray *v20;
  NSArray *v21;
  void *v22;
  id *p_maxAPR;
  NSDecimalNumber *maxAPR;
  id *p_minAPR;
  NSDecimalNumber *minAPR;
  NSArray *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  uint64_t v33;
  id v34;
  id v35;
  id v36;
  id v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  _BYTE v42[128];
  void *v43;
  uint8_t buf[4];
  uint64_t v45;
  uint64_t v46;

  v46 = *MEMORY[0x1E0C80C00];
  -[PKPayLaterSectionController payLaterAccount](self, "payLaterAccount");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "payLaterDetails");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "products");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "allObjects");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "pk_arrayBySafelyApplyingBlock:", &__block_literal_global_148);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "firstObject");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((unint64_t)objc_msgSend(v7, "count") >= 2)
  {
    PKLogFacilityTypeGetObject();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v45 = objc_msgSend(v7, "count");
      _os_log_impl(&dword_19D178000, v9, OS_LOG_TYPE_DEFAULT, "Error! There can only be only pay later product type with an eligible spend amount. There are currently %ld", buf, 0xCu);
    }

  }
  objc_msgSend(v8, "eligibleSpend");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "availableToSpend");
  v11 = (PKCurrencyAmount *)objc_claimAutoreleasedReturnValue();
  eligibleSpendAmount = self->_eligibleSpendAmount;
  self->_eligibleSpendAmount = v11;

  objc_msgSend(v10, "expirationDate");
  v13 = (NSDate *)objc_claimAutoreleasedReturnValue();
  expirationDate = self->_expirationDate;
  self->_expirationDate = v13;

  objc_msgSend(v10, "financingOptions");
  v15 = (NSArray *)objc_claimAutoreleasedReturnValue();
  financingOptions = self->_financingOptions;
  self->_financingOptions = v15;

  v17 = self->_financingOptions;
  objc_msgSend(MEMORY[0x1E0CB3928], "sortDescriptorWithKey:ascending:", CFSTR("installmentAmount.currencyAmount.amount"), 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v43 = v18;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v43, 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSArray sortedArrayUsingDescriptors:](v17, "sortedArrayUsingDescriptors:", v19);
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  v21 = self->_financingOptions;
  self->_financingOptions = v20;

  -[NSArray firstObject](self->_financingOptions, "firstObject");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  self->_financingOptionsProductType = objc_msgSend(v22, "productType");

  p_maxAPR = (id *)&self->_maxAPR;
  maxAPR = self->_maxAPR;
  self->_maxAPR = 0;

  p_minAPR = (id *)&self->_minAPR;
  minAPR = self->_minAPR;
  self->_minAPR = 0;

  v40 = 0u;
  v41 = 0u;
  v38 = 0u;
  v39 = 0u;
  v27 = self->_financingOptions;
  v28 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
  if (v28)
  {
    v29 = v28;
    v30 = *(_QWORD *)v39;
    do
    {
      v31 = 0;
      do
      {
        if (*(_QWORD *)v39 != v30)
          objc_enumerationMutation(v27);
        objc_msgSend(*(id *)(*((_QWORD *)&v38 + 1) + 8 * v31), "apr", (_QWORD)v38);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        if (!*p_maxAPR)
          goto LABEL_13;
        if (!v32)
        {
          if (!*p_minAPR)
            goto LABEL_17;
          goto LABEL_18;
        }
        if (objc_msgSend(*p_maxAPR, "compare:", v32) == -1)
LABEL_13:
          objc_storeStrong(p_maxAPR, v32);
        if (!*p_minAPR || v32 && objc_msgSend(*p_minAPR, "compare:", v32) == 1)
LABEL_17:
          objc_storeStrong(p_minAPR, v32);
LABEL_18:

        ++v31;
      }
      while (v29 != v31);
      v33 = -[NSArray countByEnumeratingWithState:objects:count:](v27, "countByEnumeratingWithState:objects:count:", &v38, v42, 16);
      v29 = v33;
    }
    while (v33);
  }

  if (*p_minAPR)
  {
    v34 = *p_minAPR;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v34 = (id)objc_claimAutoreleasedReturnValue();
  }
  v35 = *p_minAPR;
  *p_minAPR = v34;

  if (*p_maxAPR)
  {
    v36 = *p_maxAPR;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3598], "zero");
    v36 = (id)objc_claimAutoreleasedReturnValue();
  }
  v37 = *p_maxAPR;
  *p_maxAPR = v36;

}

id __61__PKPayLaterEligibleSpendSectionController__updateLocalState__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  char v8;

  v2 = a2;
  objc_msgSend(v2, "eligibleSpend");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "availableToSpend");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  v6 = 0;
  if (v3 && v4)
  {
    objc_msgSend(v4, "amount");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "pk_isZeroNumber");

    if ((v8 & 1) != 0)
      v6 = 0;
    else
      v6 = v2;
  }

  return v6;
}

+ (id)dynamicContentPageForBNPLOption:(id)a3
{
  id v3;
  id v4;
  void *v5;
  uint64_t v6;
  unint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  id v18;
  void *v19;
  _QWORD v20[2];

  v20[1] = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v18 = objc_alloc_init(MEMORY[0x1E0D66FE0]);
  v4 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v19 = v3;
  objc_msgSend(v3, "installments");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "count"))
  {
    v6 = 0;
    v7 = 0;
    do
    {
      objc_msgSend(v5, "objectAtIndexedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_alloc_init(MEMORY[0x1E0D66FE8]);
      if (v7)
        PKLocalizedCocoonString(CFSTR("WEEKS_LATER"), CFSTR("%lu"), v6);
      else
        PKLocalizedCocoonString(CFSTR("DUE_AT_PURCHASE"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setContentTitle:", v10);
      objc_msgSend(v8, "dueAmount");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "currencyAmount");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "formattedStringValue");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setContentDetailTrailing:", v13);

      objc_msgSend(v4, "safelyAddObject:", v9);
      ++v7;
      v6 += 2;
    }
    while (v7 < objc_msgSend(v5, "count"));
  }
  v14 = objc_alloc_init(MEMORY[0x1E0D66FF0]);
  v15 = (void *)objc_msgSend(v4, "copy");
  objc_msgSend(v14, "setRows:", v15);

  v20[0] = v14;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v20, 1);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "setSections:", v16);

  return v18;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_newPurchaseButtonRow, 0);
  objc_storeStrong((id *)&self->_percentageFormatter, 0);
  objc_storeStrong((id *)&self->_dateFormatter, 0);
  objc_storeStrong((id *)&self->_timeFormatter, 0);
  objc_storeStrong((id *)&self->_payLaterSetupFlowController, 0);
  objc_storeStrong((id *)&self->_numberFormatter, 0);
  objc_storeStrong((id *)&self->_financingOptions, 0);
  objc_storeStrong((id *)&self->_expirationDate, 0);
  objc_storeStrong((id *)&self->_maxAPR, 0);
  objc_storeStrong((id *)&self->_minAPR, 0);
  objc_storeStrong((id *)&self->_eligibleSpendAmount, 0);
}

@end
